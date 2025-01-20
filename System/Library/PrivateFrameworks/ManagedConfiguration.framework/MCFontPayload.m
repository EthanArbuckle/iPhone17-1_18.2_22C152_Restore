@interface MCFontPayload
+ (id)localizedPluralForm;
+ (id)localizedSingularForm;
+ (id)typeStrings;
- (MCFontPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5;
- (NSData)fontData;
- (NSString)name;
- (NSURL)persistentURL;
- (id)stubDictionary;
- (id)subtitle1Description;
- (id)subtitle1Label;
- (id)title;
- (id)verboseDescription;
- (void)setFontData:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentURL:(id)a3;
@end

@implementation MCFontPayload

+ (id)typeStrings
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.font";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)localizedSingularForm
{
  return MCLocalizedFormat(@"FONT_SINGULAR", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

+ (id)localizedPluralForm
{
  return MCLocalizedFormat(@"FONT_PLURAL", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (MCFontPayload)initWithDictionary:(id)a3 profile:(id)a4 outError:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)MCFontPayload;
  v10 = [(MCPayload *)&v39 initWithDictionary:v8 profile:v9 outError:a5];
  if (!v10) {
    goto LABEL_18;
  }
  if ([v9 isStub])
  {
    id v38 = 0;
    uint64_t v11 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"Name" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v38];
    id v12 = v38;
    name = v10->_name;
    v10->_name = (NSString *)v11;

    if (v12
      || (id v37 = 0,
          +[MCProfile removeOptionalObjectInDictionary:v8 key:@"Font" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v37], v14 = objc_claimAutoreleasedReturnValue(), id v12 = v37, fontData = v10->_fontData, v10->_fontData = (NSData *)v14, fontData, v12))
    {
      v16 = 0;
    }
    else
    {
      id v36 = 0;
      v16 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"PersistentURL" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v36];
      id v31 = v36;
      if (v31)
      {
        id v12 = v31;
      }
      else
      {
        if ([v16 length])
        {
          uint64_t v32 = [MEMORY[0x1E4F1CB10] URLWithString:v16];
          persistentURL = v10->_persistentURL;
          v10->_persistentURL = (NSURL *)v32;
        }
        id v12 = 0;
      }
    }
  }
  else
  {
    id v35 = 0;
    uint64_t v17 = +[MCProfile removeOptionalNonZeroLengthStringInDictionary:v8 key:@"Name" errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v35];
    id v12 = v35;
    v18 = v10->_name;
    v10->_name = (NSString *)v17;

    if (v12)
    {
LABEL_9:
      v20 = [(MCPayload *)v10 malformedPayloadErrorWithError:v12];
      v21 = v20;
      if (a5) {
        *a5 = v20;
      }
      v22 = (void *)_MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = objc_opt_class();
        id v25 = v24;
        v26 = [v21 MCVerboseDescription];
        *(_DWORD *)buf = 138543618;
        v41 = v24;
        __int16 v42 = 2114;
        id v43 = v26;
        _os_log_impl(&dword_1A13F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@ Can't parse payload: %{public}@", buf, 0x16u);
      }
      v10 = 0;
      goto LABEL_14;
    }
    id v34 = 0;
    uint64_t v19 = +[MCProfile removeOptionalObjectInDictionary:v8 key:@"Font" type:objc_opt_class() errorDomain:@"MCPayloadErrorDomain" invalidDataCode:2003 invalidDataErrorString:@"ERROR_PAYLOAD_FIELD_INVALID_P_FIELD" outError:&v34];
    id v12 = v34;
    v16 = v10->_fontData;
    v10->_fontData = (NSData *)v19;
  }

  if (v12) {
    goto LABEL_9;
  }
LABEL_14:
  if ([v8 count])
  {
    v27 = (void *)_MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_INFO))
    {
      v28 = v27;
      v29 = [(MCPayload *)v10 friendlyName];
      *(_DWORD *)buf = 138543618;
      v41 = v29;
      __int16 v42 = 2114;
      id v43 = v8;
      _os_log_impl(&dword_1A13F0000, v28, OS_LOG_TYPE_INFO, "Payload “%{public}@” contains ignored fields. They are: %{public}@", buf, 0x16u);
    }
  }

LABEL_18:
  return v10;
}

- (id)stubDictionary
{
  v10.receiver = self;
  v10.super_class = (Class)MCFontPayload;
  uint64_t v3 = [(MCPayload *)&v10 stubDictionary];
  uint64_t v4 = [(MCFontPayload *)self name];

  if (v4)
  {
    uint64_t v5 = [(MCFontPayload *)self name];
    [v3 setObject:v5 forKeyedSubscript:@"Name"];
  }
  uint64_t v6 = [(MCFontPayload *)self persistentURL];

  if (v6)
  {
    uint64_t v7 = [(MCFontPayload *)self persistentURL];
    id v8 = [v7 absoluteString];
    [v3 setObject:v8 forKeyedSubscript:@"PersistentURL"];
  }
  return v3;
}

- (id)verboseDescription
{
  v10.receiver = self;
  v10.super_class = (Class)MCFontPayload;
  uint64_t v3 = [(MCPayload *)&v10 verboseDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MCFontPayload *)self name];

  if (v5)
  {
    uint64_t v6 = [(MCFontPayload *)self name];
    [v4 appendFormat:@"Name        : %@\n", v6];
  }
  uint64_t v7 = [(MCFontPayload *)self persistentURL];

  if (v7)
  {
    id v8 = [(MCFontPayload *)self persistentURL];
    [v4 appendFormat:@"Path on disk: %@\n", v8];
  }
  return v4;
}

- (id)title
{
  return MCLocalizedFormat(@"FONT_TITLE", (uint64_t)a2, v2, v3, v4, v5, v6, v7, v9);
}

- (id)subtitle1Label
{
  uint64_t v2 = [(MCFontPayload *)self name];

  if (v2)
  {
    objc_super v10 = MCLocalizedFormat(@"FONT_NAME_TITLE_COLON", v3, v4, v5, v6, v7, v8, v9, v12);
  }
  else
  {
    objc_super v10 = 0;
  }
  return v10;
}

- (id)subtitle1Description
{
  uint64_t v3 = [(MCFontPayload *)self name];

  if (v3)
  {
    uint64_t v4 = [(MCFontPayload *)self name];
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

- (NSData)fontData
{
  return self->_fontData;
}

- (void)setFontData:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSURL)persistentURL
{
  return self->_persistentURL;
}

- (void)setPersistentURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fontData, 0);
}

@end