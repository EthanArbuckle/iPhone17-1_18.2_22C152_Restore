@interface MICodeSigningInfo
+ (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 fromProcessWithAuditToken:(id *)a5 error:(id *)a6;
+ (id)signingIdentifierForAuditToken:(id *)a3 error:(id *)a4;
- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3;
- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3 fromSource:(unint64_t)a4;
- (MICodeSigningInfo)initWithSignerIdentity:(id)a3 signerOrganization:(id)a4 codeInfoIdentifier:(id)a5 teamIdentifier:(id)a6 signatureVersion:(id)a7 entitlements:(id)a8 signerType:(unint64_t)a9 profileType:(unint64_t)a10 signingInfoSource:(unint64_t)a11 launchWarningData:(id)a12;
- (NSData)launchWarningData;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)entitlements;
- (NSNumber)signatureVersion;
- (NSString)codeInfoIdentifier;
- (NSString)signerIdentity;
- (NSString)signerOrganization;
- (NSString)teamIdentifier;
- (id)initForTesting;
- (unint64_t)codeSignerType;
- (unint64_t)profileValidationType;
- (unint64_t)signingInfoSource;
@end

@implementation MICodeSigningInfo

- (id)initForTesting
{
  v3.receiver = self;
  v3.super_class = (Class)MICodeSigningInfo;
  return [(MICodeSigningInfo *)&v3 init];
}

- (MICodeSigningInfo)initWithSignerIdentity:(id)a3 signerOrganization:(id)a4 codeInfoIdentifier:(id)a5 teamIdentifier:(id)a6 signatureVersion:(id)a7 entitlements:(id)a8 signerType:(unint64_t)a9 profileType:(unint64_t)a10 signingInfoSource:(unint64_t)a11 launchWarningData:(id)a12
{
  id v19 = a3;
  id v20 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v21 = a12;
  v29.receiver = self;
  v29.super_class = (Class)MICodeSigningInfo;
  v22 = [(MICodeSigningInfo *)&v29 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_signerIdentity, a3);
    objc_storeStrong((id *)&v23->_signerOrganization, a4);
    objc_storeStrong((id *)&v23->_codeInfoIdentifier, a5);
    objc_storeStrong((id *)&v23->_teamIdentifier, a6);
    objc_storeStrong((id *)&v23->_signatureVersion, a7);
    objc_storeStrong((id *)&v23->_entitlements, a8);
    v23->_profileValidationType = a10;
    v23->_signingInfoSource = a11;
    v23->_codeSignerType = a9;
    objc_storeStrong((id *)&v23->_launchWarningData, a12);
  }

  return v23;
}

- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3
{
  return [(MICodeSigningInfo *)self initWithDictionaryRepresentation:a3 fromSource:0];
}

- (MICodeSigningInfo)initWithDictionaryRepresentation:(id)a3 fromSource:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  id v7 = v6;
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_41;
    }
LABEL_40:
    MOLogWrite();
LABEL_41:
    v35 = 0;
    goto LABEL_64;
  }
  v9 = [v7 objectForKeyedSubscript:@"SigningInfoSource"];
  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  uint64_t v12 = [v11 unsignedIntegerValue];
  if (a4) {
    unint64_t v13 = a4;
  }
  else {
    unint64_t v13 = v12;
  }
  id v14 = v7;
  v15 = [v14 objectForKeyedSubscript:@"CodeSignerType"];
  objc_opt_class();
  id v16 = v15;
  if (objc_opt_isKindOfClass()) {
    id v17 = v16;
  }
  else {
    id v17 = 0;
  }

  if (v17)
  {
    uint64_t v18 = [v17 unsignedIntegerValue];
  }
  else
  {
    id v19 = [v14 objectForKeyedSubscript:@"AdHocSigned"];
    int v20 = MIBooleanValue(v19, 0);

    id v21 = [v14 objectForKeyedSubscript:@"ValidatedByProfile"];
    int v22 = MIBooleanValue(v21, 0);

    uint64_t v23 = 2;
    if (v22) {
      uint64_t v23 = 3;
    }
    if (v20) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v23;
    }
  }

  id v24 = v14;
  id v25 = [v24 objectForKeyedSubscript:@"ProfileType"];
  objc_opt_class();
  id v26 = v25;
  if (objc_opt_isKindOfClass()) {
    id v27 = v26;
  }
  else {
    id v27 = 0;
  }

  if (v27)
  {
    uint64_t v28 = [v27 unsignedIntegerValue];
  }
  else
  {
    objc_super v29 = [v24 objectForKeyedSubscript:@"ValidatedByProfile"];
    int v30 = MIBooleanValue(v29, 0);

    if (v30)
    {
      v31 = [v24 objectForKeyedSubscript:@"ValidatedByUPP"];
      char v32 = MIBooleanValue(v31, 0);

      if (v32)
      {
        uint64_t v28 = 2;
      }
      else
      {
        v33 = [v24 objectForKeyedSubscript:@"ValidatedByFreeProfile"];
        int v34 = MIBooleanValue(v33, 0);

        if (v34) {
          uint64_t v28 = 3;
        }
        else {
          uint64_t v28 = 4;
        }
      }
    }
    else
    {
      uint64_t v28 = 1;
    }
  }

  if (v18 == 3 && v28 == 1)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  uint64_t v63 = v28;
  v36 = [v24 objectForKeyedSubscript:@"SignerIdentity"];
  objc_opt_class();
  id v37 = v36;
  if (objc_opt_isKindOfClass()) {
    id v62 = v37;
  }
  else {
    id v62 = 0;
  }
  v64 = v37;

  v38 = [v24 objectForKeyedSubscript:@"SignerOrganization"];
  objc_opt_class();
  id v39 = v38;
  if (objc_opt_isKindOfClass()) {
    id v60 = v39;
  }
  else {
    id v60 = 0;
  }
  v61 = v39;

  v40 = [v24 objectForKeyedSubscript:@"CodeInfoIdentifier"];
  objc_opt_class();
  id v41 = v40;
  v65 = self;
  if (objc_opt_isKindOfClass()) {
    id v58 = v41;
  }
  else {
    id v58 = 0;
  }
  v59 = v41;

  v42 = [v24 objectForKeyedSubscript:@"TeamIdentifier"];
  objc_opt_class();
  id v43 = v42;
  if (objc_opt_isKindOfClass()) {
    id v56 = v43;
  }
  else {
    id v56 = 0;
  }
  v57 = v43;

  v44 = [v24 objectForKeyedSubscript:@"SignatureVersion"];
  objc_opt_class();
  id v45 = v44;
  uint64_t v46 = v18;
  if (objc_opt_isKindOfClass()) {
    id v47 = v45;
  }
  else {
    id v47 = 0;
  }

  v48 = [v24 objectForKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  objc_opt_class();
  id v49 = v48;
  if (objc_opt_isKindOfClass()) {
    id v50 = v49;
  }
  else {
    id v50 = 0;
  }

  v51 = [v24 objectForKeyedSubscript:@"LaunchWarningData"];
  objc_opt_class();
  id v52 = v51;
  v55 = v45;
  if (objc_opt_isKindOfClass()) {
    id v53 = v52;
  }
  else {
    id v53 = 0;
  }

  v35 = [(MICodeSigningInfo *)v65 initWithSignerIdentity:v62 signerOrganization:v60 codeInfoIdentifier:v58 teamIdentifier:v56 signatureVersion:v47 entitlements:v50 signerType:v46 profileType:v63 signingInfoSource:v13 launchWarningData:v53];
  self = v35;

LABEL_64:
  return v35;
}

- (NSDictionary)dictionaryRepresentation
{
  objc_super v3 = objc_opt_new();
  v4 = [(MICodeSigningInfo *)self entitlements];

  if (v4)
  {
    v5 = [(MICodeSigningInfo *)self entitlements];
    [v3 setObject:v5 forKeyedSubscript:@"com.apple.MobileContainerManager.Entitlements"];
  }
  id v6 = [(MICodeSigningInfo *)self signerIdentity];

  if (v6)
  {
    id v7 = [(MICodeSigningInfo *)self signerIdentity];
    [v3 setObject:v7 forKeyedSubscript:@"SignerIdentity"];
  }
  id v8 = [(MICodeSigningInfo *)self signerOrganization];

  if (v8)
  {
    v9 = [(MICodeSigningInfo *)self signerOrganization];
    [v3 setObject:v9 forKeyedSubscript:@"SignerOrganization"];
  }
  id v10 = [(MICodeSigningInfo *)self codeInfoIdentifier];

  if (v10)
  {
    id v11 = [(MICodeSigningInfo *)self codeInfoIdentifier];
    [v3 setObject:v11 forKeyedSubscript:@"CodeInfoIdentifier"];
  }
  uint64_t v12 = [(MICodeSigningInfo *)self teamIdentifier];

  if (v12)
  {
    unint64_t v13 = [(MICodeSigningInfo *)self teamIdentifier];
    [v3 setObject:v13 forKeyedSubscript:@"TeamIdentifier"];
  }
  id v14 = [(MICodeSigningInfo *)self signatureVersion];

  if (v14)
  {
    v15 = [(MICodeSigningInfo *)self signatureVersion];
    [v3 setObject:v15 forKeyedSubscript:@"SignatureVersion"];
  }
  id v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MICodeSigningInfo profileValidationType](self, "profileValidationType"));
  [v3 setObject:v16 forKeyedSubscript:@"ProfileType"];

  id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MICodeSigningInfo codeSignerType](self, "codeSignerType"));
  [v3 setObject:v17 forKeyedSubscript:@"CodeSignerType"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MICodeSigningInfo signingInfoSource](self, "signingInfoSource"));
  [v3 setObject:v18 forKeyedSubscript:@"SigningInfoSource"];

  id v19 = [(MICodeSigningInfo *)self launchWarningData];
  [v3 setObject:v19 forKeyedSubscript:@"LaunchWarningData"];

  int v20 = (void *)[v3 copy];
  return (NSDictionary *)v20;
}

+ (id)signingIdentifierForAuditToken:(id *)a3 error:(id *)a4
{
  CFErrorRef error = 0;
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v7 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v7;
  id v8 = SecTaskCreateWithAuditToken(v6, &token);
  if (!v8)
  {
    long long v17 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v17;
    uint64_t v18 = audit_token_to_pid(&token);
    uint64_t v12 = _CreateAndLogError((uint64_t)"+[MICodeSigningInfo signingIdentifierForAuditToken:error:]", 197, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to create SecTask from audit token for pid %d", v19, v18);
    id v11 = 0;
    if (!a4) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v9 = v8;
  CFStringRef v10 = SecTaskCopySigningIdentifier(v8, &error);
  id v11 = (__CFString *)v10;
  uint64_t v12 = error;
  if (error) {
    CFErrorRef error = 0;
  }
  if (!v10)
  {
    long long v13 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a3->var0;
    *(_OWORD *)&token.val[4] = v13;
    uint64_t v14 = audit_token_to_pid(&token);
    uint64_t v16 = _CreateAndLogError((uint64_t)"+[MICodeSigningInfo signingIdentifierForAuditToken:error:]", 209, @"MIInstallerErrorDomain", 4, v12, 0, @"Failed to get signing identifier from SecTask for pid %d", v15, v14);

    uint64_t v12 = (void *)v16;
  }
  CFRelease(v9);
  if (a4)
  {
LABEL_9:
    if (!v11) {
      *a4 = v12;
    }
  }
LABEL_11:

  return v11;
}

+ (BOOL)getValue:(id *)a3 forEntitlement:(id)a4 fromProcessWithAuditToken:(id *)a5 error:(id *)a6
{
  v9 = (__CFString *)a4;
  CFErrorRef error = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v11 = *(_OWORD *)&a5->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a5->var0;
  *(_OWORD *)&token.val[4] = v11;
  uint64_t v12 = SecTaskCreateWithAuditToken(v10, &token);
  if (v12)
  {
    long long v13 = v12;
    CFTypeRef v14 = SecTaskCopyValueForEntitlement(v12, v9, &error);
    uint64_t v15 = (void *)v14;
    uint64_t v16 = error;
    if (error && (CFErrorRef error = 0, !v14))
    {
      long long v21 = *(_OWORD *)&a5->var0[4];
      *(_OWORD *)token.val = *(_OWORD *)a5->var0;
      *(_OWORD *)&token.val[4] = v21;
      uint64_t v22 = audit_token_to_pid(&token);
      uint64_t v24 = _CreateAndLogError((uint64_t)"+[MICodeSigningInfo getValue:forEntitlement:fromProcessWithAuditToken:error:]", 245, @"MIInstallerErrorDomain", 4, v16, 0, @"Failed to get signing identifier from SecTask for pid %d", v23, v22);

      BOOL v17 = 0;
      uint64_t v15 = 0;
      uint64_t v16 = (void *)v24;
    }
    else
    {
      BOOL v17 = 1;
    }
    CFRelease(v13);
    if (!a6) {
      goto LABEL_11;
    }
  }
  else
  {
    long long v18 = *(_OWORD *)&a5->var0[4];
    *(_OWORD *)token.val = *(_OWORD *)a5->var0;
    *(_OWORD *)&token.val[4] = v18;
    uint64_t v19 = audit_token_to_pid(&token);
    uint64_t v16 = _CreateAndLogError((uint64_t)"+[MICodeSigningInfo getValue:forEntitlement:fromProcessWithAuditToken:error:]", 232, @"MIInstallerErrorDomain", 4, 0, 0, @"Failed to create SecTask from audit token for pid %d", v20, v19);
    uint64_t v15 = 0;
    BOOL v17 = 0;
    if (!a6) {
      goto LABEL_11;
    }
  }
  if (!v17) {
    *a6 = v16;
  }
LABEL_11:
  char v25 = !v17;
  if (!a3) {
    char v25 = 1;
  }
  if ((v25 & 1) == 0) {
    *a3 = v15;
  }

  return v17;
}

- (NSString)signerIdentity
{
  return self->_signerIdentity;
}

- (NSString)signerOrganization
{
  return self->_signerOrganization;
}

- (NSString)codeInfoIdentifier
{
  return self->_codeInfoIdentifier;
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (NSNumber)signatureVersion
{
  return self->_signatureVersion;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (unint64_t)codeSignerType
{
  return self->_codeSignerType;
}

- (unint64_t)profileValidationType
{
  return self->_profileValidationType;
}

- (unint64_t)signingInfoSource
{
  return self->_signingInfoSource;
}

- (NSData)launchWarningData
{
  return self->_launchWarningData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchWarningData, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_signatureVersion, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_codeInfoIdentifier, 0);
  objc_storeStrong((id *)&self->_signerOrganization, 0);
  objc_storeStrong((id *)&self->_signerIdentity, 0);
}

@end