@interface ECMessageAuthenticator
- (BOOL)_isErrorStatus:(int64_t)a3;
- (ECDKIMVerifier)dkimVerifier;
- (ECDMARCVerifier)dmarcVerifier;
- (ECMessageAuthenticator)init;
- (ECMessageAuthenticator)initWithDKIMVerifier:(id)a3 dmarcVerifier:(id)a4;
- (ECMessageAuthenticator)initWithDNSClient:(id)a3;
- (id)_onDeviceResultsForMessage:(id)a3 sender:(id)a4 dkimHeaders:(id)a5;
- (id)_verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 sender:(id)a5 identifierAlignment:(int64_t)a6 dkimVerifierOptions:(int64_t)a7;
- (id)_verifyMessage:(id)a3 withSender:(id)a4 strictlyAlignedDKIMSignatureHeaders:(id)a5 relaxedAlignedDKIMSignatureHeaders:(id)a6 dkimVerifierOptions:(int64_t)a7;
- (id)authenticateMessageData:(id)a3 onDevice:(BOOL)a4 sender:(id)a5;
- (void)_addServerResultsFromMessage:(id)a3 toResult:(id)a4;
@end

@implementation ECMessageAuthenticator

- (ECMessageAuthenticator)initWithDKIMVerifier:(id)a3 dmarcVerifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ECMessageAuthenticator;
  v9 = [(ECMessageAuthenticator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dkimVerifier, a3);
    objc_storeStrong((id *)&v10->_dmarcVerifier, a4);
  }

  return v10;
}

- (ECMessageAuthenticator)initWithDNSClient:(id)a3
{
  id v4 = a3;
  v5 = [[ECDKIMVerifier alloc] initWithPublicKeySource:v4];
  v6 = [[ECDMARCVerifier alloc] initWithRecordSource:v4];
  id v7 = [(ECMessageAuthenticator *)self initWithDKIMVerifier:v5 dmarcVerifier:v6];

  return v7;
}

- (ECMessageAuthenticator)init
{
  v3 = objc_alloc_init(ECDNSClient);
  id v4 = [(ECMessageAuthenticator *)self initWithDNSClient:v3];

  return v4;
}

- (id)authenticateMessageData:(id)a3 onDevice:(BOOL)a4 sender:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 emailAddressValue];
  v11 = (void *)v10;
  if (v10) {
    objc_super v12 = (void *)v10;
  }
  else {
    objc_super v12 = v9;
  }
  id v13 = v12;

  v14 = [(ECMessageAuthenticator *)self dkimVerifier];
  id v21 = 0;
  id v22 = 0;
  v15 = [v14 verifiableMessageForMessageData:v8 dkimSignatureHeaders:&v22 error:&v21];
  id v16 = v22;
  id v17 = v21;

  if (v15)
  {
    if (v6)
    {
      v18 = [(ECMessageAuthenticator *)self _onDeviceResultsForMessage:v15 sender:v13 dkimHeaders:v16];
    }
    else
    {
      v18 = objc_alloc_init(ECMessageAuthenticationResult);
    }
    v19 = v18;
    [(ECMessageAuthenticator *)self _addServerResultsFromMessage:v15 toResult:v18];
  }
  else
  {
    v19 = objc_alloc_init(ECMessageAuthenticationResult);
    [(ECMessageAuthenticationResult *)v19 setDkimAttemptedHeaderVerification:0];
    [(ECMessageAuthenticationResult *)v19 setDkimAttemptedBodyVerification:0];
    [(ECMessageAuthenticationResult *)v19 setBestDKIMSignatureHeader:0];
    [(ECMessageAuthenticationResult *)v19 setDkimError:v17];
  }

  return v19;
}

- (id)_onDeviceResultsForMessage:(id)a3 sender:(id)a4 dkimHeaders:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 emailAddressValue];

  if (v11)
  {
    objc_super v12 = [v9 emailAddressValue];
    id v21 = 0;
    id v22 = 0;
    +[ECDMARCVerifier partitionDKIMSignatureHeadersByIdentifierAlignment:v10 forSender:v12 strictAligned:&v22 relaxedAligned:&v21 unaligned:0];
    id v11 = v22;
    id v13 = v21;
  }
  else
  {
    id v13 = 0;
  }
  v14 = [(ECMessageAuthenticator *)self _verifyMessage:v8 withSender:v9 strictlyAlignedDKIMSignatureHeaders:v11 relaxedAlignedDKIMSignatureHeaders:v13 dkimVerifierOptions:7];
  if (([v14 dkimHeadersVerified] & 1) == 0)
  {
    uint64_t v15 = [(ECMessageAuthenticator *)self _verifyMessage:v8 withSender:v9 strictlyAlignedDKIMSignatureHeaders:v11 relaxedAlignedDKIMSignatureHeaders:v13 dkimVerifierOptions:1];

    v14 = (void *)v15;
  }
  if (!v14)
  {
    id v16 = [(ECMessageAuthenticator *)self _verifyMessage:v8 withDKIMSignatureHeaders:v10 sender:v9 identifierAlignment:0 dkimVerifierOptions:7];
    if ([v16 dkimHeadersVerified])
    {
      v14 = v16;
    }
    else
    {
      uint64_t v17 = [(ECMessageAuthenticator *)self _verifyMessage:v8 withDKIMSignatureHeaders:v10 sender:v9 identifierAlignment:0 dkimVerifierOptions:1];

      v14 = (void *)v17;
    }
  }
  if (([v14 dkimAttemptedBodyVerification] & 1) == 0)
  {
    v18 = [v8 bodyData];
    uint64_t v19 = [v18 length];

    if (v19) {
      [v14 setDkimAttemptedBodyVerification:1];
    }
  }

  return v14;
}

- (id)_verifyMessage:(id)a3 withSender:(id)a4 strictlyAlignedDKIMSignatureHeaders:(id)a5 relaxedAlignedDKIMSignatureHeaders:(id)a6 dkimVerifierOptions:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if ([v14 count])
  {
    id v16 = [(ECMessageAuthenticator *)self _verifyMessage:v12 withDKIMSignatureHeaders:v14 sender:v13 identifierAlignment:2 dkimVerifierOptions:a7];
    id v17 = v16;
    if ([v16 dmarcStatus] == 2) {
      goto LABEL_15;
    }
  }
  else
  {
    id v17 = 0;
  }
  if ([v15 count])
  {
    v18 = [(ECMessageAuthenticator *)self _verifyMessage:v12 withDKIMSignatureHeaders:v15 sender:v13 identifierAlignment:1 dkimVerifierOptions:a7];
    uint64_t v19 = v18;
    if (v17)
    {
      uint64_t v20 = [v18 dmarcStatus];
      if (v20 == 2 || v20 == 3 && (unint64_t v21 = [v17 dmarcStatus], v21 <= 5) && ((1 << v21) & 0x33) != 0)
      {
        id v22 = v19;

        id v17 = v22;
      }
    }
    else
    {
      id v17 = v18;
    }
  }
  id v16 = v17;
LABEL_15:
  id v23 = v16;

  return v23;
}

- (id)_verifyMessage:(id)a3 withDKIMSignatureHeaders:(id)a4 sender:(id)a5 identifierAlignment:(int64_t)a6 dkimVerifierOptions:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v24 = v12;
  id v15 = objc_alloc_init(ECMessageAuthenticationResult);
  if ([v13 count])
  {
    id v16 = [(ECMessageAuthenticator *)self dkimVerifier];
    id v26 = 0;
    id v17 = [v16 verifyMessage:v12 withDKIMSignatureHeaders:v13 options:a7 error:&v26];
    id v18 = v26;
  }
  else
  {
    id v18 = 0;
    id v17 = 0;
  }
  uint64_t v25 = 0;
  uint64_t v19 = [v14 emailAddressValue];

  if (v19)
  {
    uint64_t v20 = [(ECMessageAuthenticator *)self dmarcVerifier];
    unint64_t v21 = [v14 emailAddressValue];
    uint64_t v22 = [v20 dmarcStatusForSender:v21 dkimResult:v17 != 0 identifierAlignment:a6 receiverPolicy:&v25];

    if ((a7 & 1) == 0)
    {
LABEL_6:
      [(ECMessageAuthenticationResult *)v15 setDkimAttemptedHeaderVerification:0];
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v22 = 3;
    if ((a7 & 1) == 0) {
      goto LABEL_6;
    }
  }
  [(ECMessageAuthenticationResult *)v15 setDkimAttemptedHeaderVerification:1];
  [(ECMessageAuthenticationResult *)v15 setDkimHeadersVerified:v17 != 0];
LABEL_9:
  if ((a7 & 2) != 0)
  {
    [(ECMessageAuthenticationResult *)v15 setDkimAttemptedBodyVerification:1];
    [(ECMessageAuthenticationResult *)v15 setDkimBodyVerified:v17 != 0];
  }
  else
  {
    [(ECMessageAuthenticationResult *)v15 setDkimAttemptedBodyVerification:0];
  }
  [(ECMessageAuthenticationResult *)v15 setBestDKIMSignatureHeader:v17];
  [(ECMessageAuthenticationResult *)v15 setDkimError:v18];
  [(ECMessageAuthenticationResult *)v15 setDmarcStatus:v22];
  [(ECMessageAuthenticationResult *)v15 setDmarcReceiverPolicy:v25];
  [(ECMessageAuthenticationResult *)v15 setDmarcIdentifierAlignment:a6];

  return v15;
}

- (void)_addServerResultsFromMessage:(id)a3 toResult:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  BOOL v6 = [a3 headers];
  id v7 = +[ECHeaderAuthenticationResults authenticationResultsForRawHeaders:v6];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v24;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v23 + 1) + 8 * v10);
        id v12 = [v11 firstStatementForMethod:@"dkim"];
        if (v12)
        {
          [v5 setDkimHasServerResult:1];
          id v13 = [v12 result];
          objc_msgSend(v5, "setDkimServerVerified:", objc_msgSend(v13, "isEqualToString:", @"pass"));

          id v14 = [v12 valueForPropertyType:@"header" property:@"d"];
          if (!v14)
          {
            id v15 = [v12 valueForPropertyType:@"header" property:@"i"];
            if ([v15 length] && objc_msgSend(v15, "characterAtIndex:", 0) == 64)
            {
              id v14 = [v15 substringFromIndex:1];
            }
            else
            {
              id v16 = [v15 emailAddressValue];
              id v14 = [v16 domain];
            }
          }
          [v5 setDkimServerSigningDomain:v14];
          id v17 = [v12 valueForPropertyType:@"header" property:@"s"];
          [v5 setDkimServerResultSelector:v17];
        }
        id v18 = [v11 firstStatementForMethod:@"dmarc"];
        if (v18)
        {
          if (_addServerResultsFromMessage_toResult__onceToken != -1) {
            dispatch_once(&_addServerResultsFromMessage_toResult__onceToken, &__block_literal_global_11);
          }
          uint64_t v19 = (void *)_addServerResultsFromMessage_toResult__kDMARCStatusByResultString;
          uint64_t v20 = [v18 result];
          unint64_t v21 = [v19 objectForKeyedSubscript:v20];
          objc_msgSend(v5, "setDmarcServerStatus:", objc_msgSend(v21, "integerValue"));
        }
        if ([v5 dkimHasServerResult] && objc_msgSend(v5, "dmarcServerStatus"))
        {

          goto LABEL_24;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_24:
}

void __64__ECMessageAuthenticator__addServerResultsFromMessage_toResult___block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"none";
  v2[1] = @"pass";
  v3[0] = &unk_1F1A73290;
  v3[1] = &unk_1F1A732A8;
  v2[2] = @"fail";
  v2[3] = @"temperror";
  v3[2] = &unk_1F1A732C0;
  v3[3] = &unk_1F1A732D8;
  v2[4] = @"permerror";
  v3[4] = &unk_1F1A732F0;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)_addServerResultsFromMessage_toResult__kDMARCStatusByResultString;
  _addServerResultsFromMessage_toResult__kDMARCStatusByResultString = v0;
}

- (BOOL)_isErrorStatus:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (ECDKIMVerifier)dkimVerifier
{
  return self->_dkimVerifier;
}

- (ECDMARCVerifier)dmarcVerifier
{
  return self->_dmarcVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dmarcVerifier, 0);
  objc_storeStrong((id *)&self->_dkimVerifier, 0);
}

@end