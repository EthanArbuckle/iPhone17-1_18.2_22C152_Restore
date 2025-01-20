@interface CRKASMCertificateParserResult
+ (BOOL)certificate:(id)a3 hasCommonNameWithPrefix:(id)a4;
+ (id)resultForCertificate:(id)a3 expectedCommonNamePrefix:(id)a4 expectedUserIdentifier:(id)a5;
- (BOOL)isCertificateValidWithError:(id *)a3;
- (CRKASMCertificateParserResult)initWithUserIdentifier:(id)a3 validationError:(id)a4;
- (NSError)validationError;
- (NSString)userIdentifier;
@end

@implementation CRKASMCertificateParserResult

- (CRKASMCertificateParserResult)initWithUserIdentifier:(id)a3 validationError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKASMCertificateParserResult;
  v8 = [(CRKASMCertificateParserResult *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    userIdentifier = v8->_userIdentifier;
    v8->_userIdentifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_validationError, a4);
  }

  return v8;
}

+ (id)resultForCertificate:(id)a3 expectedCommonNamePrefix:(id)a4 expectedUserIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v14 = &unk_26D819E20;
    uint64_t v15 = 2;
LABEL_9:
    v13 = CRKErrorWithCodeAndUserInfo(v15, v14);
    objc_super v12 = 0;
    goto LABEL_14;
  }
  if (([a1 certificate:v8 hasCommonNameWithPrefix:v9] & 1) == 0)
  {
    uint64_t v15 = 34;
    v14 = 0;
    goto LABEL_9;
  }
  v11 = +[CRKASMCertificateUserIdentifierExtractor userIdentifierFromCertificate:v8];
  objc_super v12 = v11;
  if (v11)
  {
    if ([v11 isEqualToString:v10])
    {
      if ([v8 isTemporallyValid])
      {
        v13 = 0;
        goto LABEL_14;
      }
      uint64_t v16 = 33;
    }
    else
    {
      uint64_t v16 = 36;
    }
  }
  else
  {
    uint64_t v16 = 34;
  }
  v13 = CRKErrorWithCodeAndUserInfo(v16, 0);
LABEL_14:
  v17 = (void *)[objc_alloc((Class)a1) initWithUserIdentifier:v12 validationError:v13];

  return v17;
}

- (BOOL)isCertificateValidWithError:(id *)a3
{
  v5 = [(CRKASMCertificateParserResult *)self validationError];

  if (a3 && v5)
  {
    *a3 = [(CRKASMCertificateParserResult *)self validationError];
  }
  return v5 == 0;
}

+ (BOOL)certificate:(id)a3 hasCommonNameWithPrefix:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = objc_msgSend(a3, "commonNames", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) hasPrefix:v5])
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (NSError)validationError
{
  return self->_validationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationError, 0);

  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end