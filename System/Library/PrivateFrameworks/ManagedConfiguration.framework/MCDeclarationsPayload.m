@interface MCDeclarationsPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCDeclarationsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSArray)declarations;
- (id)declarationsDictionary;
- (id)payloadDescriptionKeyValueSections;
- (id)stubDictionary;
- (id)verboseDescription;
@end

@implementation MCDeclarationsPayload

+ (id)typeStrings
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithObject:@"com.apple.declarations"];
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"DECLARATIONS_SINGULAR_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"DECLARATIONS_PLURAL_FORMAT", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCDeclarationsPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MCDeclarationsPayload;
  uint64_t v9 = [(MCPayload *)&v28 initWithDictionary:v8 profile:a4 outError:a5];
  if (v9)
  {
    id v27 = 0;
    v10 = [v8 MCValidateAndRemoveArrayOfClass:objc_opt_class() withKey:@"Declarations" isRequired:1 outError:&v27];
    v11 = (NSArray *)v27;
    if (v11)
    {
      v12 = v11;
      v13 = [(MCPayload *)v9 malformedPayloadErrorWithError:v11];
      v14 = v13;
      if (a5) {
        *a5 = v13;
      }
      v15 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v16 = v15;
        v17 = objc_opt_class();
        id v18 = v17;
        v19 = [v14 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v30 = v17;
        __int16 v31 = 2114;
        v32 = v19;
        _os_log_impl(&dword_1A13F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      uint64_t v9 = 0;
      declarations = v10;
      v10 = v12;
    }
    else
    {
      if ([v8 count])
      {
        v21 = (void *)_MCLogObjects;
        if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
        {
          v22 = v21;
          v23 = [(MCPayload *)v9 friendlyName];
          v24 = [v8 allKeys];
          *(_DWORD *)buf = 138543618;
          v30 = v23;
          __int16 v31 = 2114;
          v32 = v24;
          _os_log_impl(&dword_1A13F0000, v22, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v25 = [(NSArray *)v10 copy];
      declarations = v9->_declarations;
      v9->_declarations = (NSArray *)v25;
    }
  }
  return v9;
}

- (id)declarationsDictionary
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(MCDeclarationsPayload *)self declarations];
  uint64_t v5 = (void *)[v4 copy];
  [v3 setObject:v5 forKeyedSubscript:@"Declarations"];

  uint64_t v6 = (void *)[v3 copy];
  return v6;
}

- (id)stubDictionary
{
  v6.receiver = self;
  v6.super_class = (Class)MCDeclarationsPayload;
  uint64_t v3 = [(MCPayload *)&v6 stubDictionary];
  uint64_t v4 = [(MCDeclarationsPayload *)self declarationsDictionary];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

- (id)verboseDescription
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MCDeclarationsPayload;
  uint64_t v4 = [(MCPayload *)&v8 verboseDescription];
  uint64_t v5 = [(MCDeclarationsPayload *)self declarations];
  objc_super v6 = [v3 stringWithFormat:@"%@ %p: Declarations:%@", v4, self, v5];

  return v6;
}

- (id)payloadDescriptionKeyValueSections
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(MCDeclarationsPayload *)self declarations];
  unint64_t v6 = [v5 count];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v6);
  objc_super v8 = [MCKeyValue alloc];
  if (v6 <= 1) {
    uint64_t v9 = @"DECLARATIONS_SINGULAR_FORMAT";
  }
  else {
    uint64_t v9 = @"DECLARATIONS_PLURAL_FORMAT";
  }
  v10 = MCLocalizedString(v9);
  v11 = [(MCKeyValue *)v8 initWithLocalizedString:v7 localizedKey:v10];

  [v4 addObject:v11];
  if ([v4 count])
  {
    v12 = +[MCKeyValueSection sectionWithKeyValues:v4];
    [v3 addObject:v12];
  }
  if (![v3 count])
  {

    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)declarations
{
  return self->_declarations;
}

- (void).cxx_destruct
{
}

@end