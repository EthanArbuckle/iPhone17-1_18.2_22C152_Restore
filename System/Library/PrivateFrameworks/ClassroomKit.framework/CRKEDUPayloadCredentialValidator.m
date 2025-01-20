@interface CRKEDUPayloadCredentialValidator
- (BOOL)areCredentialsValidForOneToOneDeviceWithError:(id *)a3;
- (BOOL)areCredentialsValidForSharediPadDeviceWithError:(id *)a3;
- (BOOL)areCredentialsValidWithError:(id *)a3;
- (BOOL)hasPayloadCertificate;
- (BOOL)isEphemeralMultiUserDevice;
- (BOOL)isInstructor;
- (BOOL)isStub;
- (BOOL)isStudent;
- (BOOL)validateAnchorsWithKeyPath:(id)a3 payloadKey:(id)a4 error:(id *)a5;
- (BOOL)validateLeaderAnchorsWithError:(id *)a3;
- (BOOL)validateMemberAnchorsWithError:(id *)a3;
- (CRKEDUPayload)payload;
- (CRKEDUPayloadCredentialValidator)initWithPayload:(id)a3 isStub:(BOOL)a4 isEphemeralMultiUserDevice:(BOOL)a5;
@end

@implementation CRKEDUPayloadCredentialValidator

- (CRKEDUPayloadCredentialValidator)initWithPayload:(id)a3 isStub:(BOOL)a4 isEphemeralMultiUserDevice:(BOOL)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKEDUPayloadCredentialValidator;
  v10 = [(CRKEDUPayloadCredentialValidator *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_payload, a3);
    v11->_stub = a4;
    v11->_ephemeralMultiUserDevice = a5;
  }

  return v11;
}

- (BOOL)areCredentialsValidWithError:(id *)a3
{
  if ([(CRKEDUPayloadCredentialValidator *)self isStub]) {
    return 1;
  }
  if ([(CRKEDUPayloadCredentialValidator *)self isEphemeralMultiUserDevice])
  {
    return [(CRKEDUPayloadCredentialValidator *)self areCredentialsValidForSharediPadDeviceWithError:a3];
  }
  else
  {
    return [(CRKEDUPayloadCredentialValidator *)self areCredentialsValidForOneToOneDeviceWithError:a3];
  }
}

- (BOOL)areCredentialsValidForSharediPadDeviceWithError:(id *)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  BOOL v5 = [(CRKEDUPayloadCredentialValidator *)self hasPayloadCertificate];
  int v6 = v5 ^ [(CRKEDUPayloadCredentialValidator *)self validateLeaderAnchorsWithError:0];
  if (v6 == 1)
  {
    if (v5) {
      v7 = @"PayloadCertificateUUID";
    }
    else {
      v7 = @"LeaderPayloadCertificateAnchorUUID";
    }
    v8 = v7;
    v13[0] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v12[0] = @"PayloadCertificateUUID";
    v12[1] = @"LeaderPayloadCertificateAnchorUUID";
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crk_allOrNoneKeysErrorWithProvidedKeys:allOrNoneKeys:", v9, v10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6 ^ 1;
}

- (BOOL)areCredentialsValidForOneToOneDeviceWithError:(id *)a3
{
  if (![(CRKEDUPayloadCredentialValidator *)self hasPayloadCertificate])
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x263F087E8], "crk_missingFieldErrorWithField:", @"PayloadCertificateUUID");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  BOOL v5 = [(CRKEDUPayloadCredentialValidator *)self isStudent];
  BOOL v6 = [(CRKEDUPayloadCredentialValidator *)self isInstructor];
  if (v5 && v6)
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x263F087E8];
      v8 = [(CRKEDUPayloadCredentialValidator *)self payload];
      id v9 = [v8 userIdentifier];
      v10 = objc_msgSend(v7, "crk_topLevelUserIsBothLeaderAndMemberErrorWithUserIdentifier:", v9);
LABEL_15:
      *a3 = v10;

      return 0;
    }
    return 0;
  }
  if (!v5 && !v6)
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x263F087E8];
      v8 = [(CRKEDUPayloadCredentialValidator *)self payload];
      id v9 = [v8 userIdentifier];
      v10 = objc_msgSend(v12, "crk_topLevelUserIsNeitherLeaderNorMemberErrorWithUserIdentifier:", v9);
      goto LABEL_15;
    }
    return 0;
  }
  if (v5)
  {
    return [(CRKEDUPayloadCredentialValidator *)self validateLeaderAnchorsWithError:a3];
  }
  else
  {
    return [(CRKEDUPayloadCredentialValidator *)self validateMemberAnchorsWithError:a3];
  }
}

- (BOOL)validateMemberAnchorsWithError:(id *)a3
{
  return [(CRKEDUPayloadCredentialValidator *)self validateAnchorsWithKeyPath:@"memberPayloadCertificateAnchorUUID" payloadKey:@"MemberPayloadCertificateAnchorUUID" error:a3];
}

- (BOOL)validateLeaderAnchorsWithError:(id *)a3
{
  return [(CRKEDUPayloadCredentialValidator *)self validateAnchorsWithKeyPath:@"leaderPayloadCertificateAnchorUUID" payloadKey:@"LeaderPayloadCertificateAnchorUUID" error:a3];
}

- (BOOL)validateAnchorsWithKeyPath:(id)a3 payloadKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(CRKEDUPayloadCredentialValidator *)self payload];
  v11 = [v10 valueForKeyPath:v9];

  if (!v11)
  {
    if (!a5)
    {
      BOOL v13 = 0;
      goto LABEL_9;
    }
    v14 = objc_msgSend(MEMORY[0x263F087E8], "crk_missingFieldErrorWithField:", v8);
    goto LABEL_7;
  }
  uint64_t v12 = [v11 count];
  BOOL v13 = v12 != 0;
  if (a5 && !v12)
  {
    v14 = objc_msgSend(MEMORY[0x263F087E8], "crk_unsupportedValueErrorWithField:value:", v8, v11);
LABEL_7:
    BOOL v13 = 0;
    *a5 = v14;
  }
LABEL_9:

  return v13;
}

- (BOOL)isInstructor
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(CRKEDUPayloadCredentialValidator *)self payload];
  v4 = [v3 groups];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:@"LeaderIdentifiers"];
        v10 = [(CRKEDUPayloadCredentialValidator *)self payload];
        v11 = [v10 userIdentifier];
        char v12 = [v9 containsObject:v11];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)isStudent
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(CRKEDUPayloadCredentialValidator *)self payload];
  v4 = [v3 groups];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:@"MemberIdentifiers"];
        v10 = [(CRKEDUPayloadCredentialValidator *)self payload];
        v11 = [v10 userIdentifier];
        char v12 = [v9 containsObject:v11];

        if (v12)
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)hasPayloadCertificate
{
  v2 = [(CRKEDUPayloadCredentialValidator *)self payload];
  v3 = [v2 payloadCertificateUUID];
  BOOL v4 = v3 != 0;

  return v4;
}

- (CRKEDUPayload)payload
{
  return self->_payload;
}

- (BOOL)isStub
{
  return self->_stub;
}

- (BOOL)isEphemeralMultiUserDevice
{
  return self->_ephemeralMultiUserDevice;
}

- (void).cxx_destruct
{
}

@end