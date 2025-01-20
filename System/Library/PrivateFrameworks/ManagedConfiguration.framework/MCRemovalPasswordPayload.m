@interface MCRemovalPasswordPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCRemovalPasswordPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSString)removalPasscode;
- (id)stubDictionary;
- (void)setRemovalPasscode:(id)a3;
@end

@implementation MCRemovalPasswordPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.profileRemovalPassword"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"PAYLOAD_REMOVAL_PASSWORD_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"PAYLOAD_REMOVAL_PASSWORD_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCRemovalPasswordPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v35.receiver = self;
  v35.super_class = (Class)MCRemovalPasswordPayload;
  v10 = [(MCPayload *)&v35 initWithDictionary:v8 profile:v9 outError:a5];
  if (v10)
  {
    if ([v9 isStub])
    {
      id v33 = 0;
      uint64_t v11 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"RemovalPassword" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v33];
      id v12 = v33;
      removalPasscode = v10->_removalPasscode;
      v10->_removalPasscode = (NSString *)v11;
    }
    else
    {
      id v34 = 0;
      uint64_t v14 = +[MCProfile removeRequiredNonZeroLengthStringInDictionary:v8 key:@"RemovalPassword" errorDomain:@"MCPayloadErrorDomain" missingDataCode:2002 missingDataErrorString:@"ERROR_PAYLOAD_REQUIRED_FIELD_MISSING_P_FIELD" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v34];
      id v12 = v34;
      v15 = v10->_removalPasscode;
      v10->_removalPasscode = (NSString *)v14;

      v16 = [v9 removalPasscode];

      if (v16)
      {
        v24 = (void *)MEMORY[0x1E4F28C58];
        v25 = MCErrorArray(@"ERROR_PAYLOAD_MULTIPLE_REMOVAL_PASSCODES", v17, v18, v19, v20, v21, v22, v23, 0);
        uint64_t v26 = [v24 MCErrorWithDomain:@"MCPayloadErrorDomain" code:2000 descriptionArray:v25 errorType:@"MCFatalError"];

        id v12 = (id)v26;
        if (v26) {
          goto LABEL_11;
        }
        goto LABEL_16;
      }
    }
    if (v10->_removalPasscode)
    {
      objc_msgSend(v9, "setRemovalPasscode:");
      [v9 setLocked:1];
      if (!v12) {
        goto LABEL_16;
      }
LABEL_11:
      v27 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v28 = v27;
        v29 = objc_opt_class();
        id v30 = v29;
        v31 = [v12 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v37 = v29;
        __int16 v38 = 2114;
        v39 = v31;
        _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_ERROR, "Cannot parse payload %{public}@. Error: %{public}@", buf, 0x16u);
      }
      if (a5) {
        *a5 = v12;
      }

      v10 = 0;
      goto LABEL_16;
    }
    objc_msgSend(v9, "setRemovalPasscode:");
    if (v12) {
      goto LABEL_11;
    }
LABEL_16:
  }
  return v10;
}

- (id)stubDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)MCRemovalPasswordPayload;
  uint64_t v3 = [(MCPayload *)&v7 stubDictionary];
  uint64_t v4 = v3;
  removalPasscode = self->_removalPasscode;
  if (removalPasscode) {
    [v3 setObject:removalPasscode forKey:@"RemovalPassword"];
  }
  return v4;
}

- (NSString)removalPasscode
{
  return self->_removalPasscode;
}

- (void)setRemovalPasscode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end