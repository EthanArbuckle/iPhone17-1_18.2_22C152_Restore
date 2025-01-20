@interface LPiTunesMediaURLComponents
+ (id)identifierFromQueryItems:(id)a3 pathComponent:(id)a4;
+ (id)storefrontCountryCodeFromPathComponent:(id)a3;
- (LPiTunesMediaURLComponents)initWithURL:(id)a3;
- (NSString)identifier;
- (NSString)storefrontCountryCode;
@end

@implementation LPiTunesMediaURLComponents

- (LPiTunesMediaURLComponents)initWithURL:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)LPiTunesMediaURLComponents;
  v5 = [(LPiTunesMediaURLComponents *)&v18 init];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
    v7 = [v6 path];
    v8 = [v7 pathComponents];

    if ((unint64_t)[v8 count] < 3) {
      goto LABEL_6;
    }
    v9 = [v6 queryItems];
    v10 = [v8 lastObject];
    uint64_t v11 = +[LPiTunesMediaURLComponents identifierFromQueryItems:v9 pathComponent:v10];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v11;

    if (!v5->_identifier) {
      goto LABEL_6;
    }
    v13 = [v8 objectAtIndexedSubscript:1];
    uint64_t v14 = +[LPiTunesMediaURLComponents storefrontCountryCodeFromPathComponent:v13];
    storefrontCountryCode = v5->_storefrontCountryCode;
    v5->_storefrontCountryCode = (NSString *)v14;

    if (v5->_storefrontCountryCode) {
      v16 = v5;
    }
    else {
LABEL_6:
    }
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)identifierFromQueryItems:(id)a3 pathComponent:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = [*(id *)(*((void *)&v27 + 1) + 8 * i) name];
        int v12 = [v11 isEqualToString:@"a"];

        if (v12)
        {
          id v21 = v6;

          goto LABEL_25;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    while (2)
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        objc_super v18 = [v17 name];
        int v19 = [v18 isEqualToString:@"i"];

        if (v19)
        {
          id v21 = [v17 value];

          goto LABEL_25;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if ([v6 hasPrefix:@"id"])
  {
    id v20 = [v6 substringFromIndex:2];
LABEL_23:
    id v21 = v20;
    goto LABEL_25;
  }
  if ([v6 hasPrefix:@"ra"])
  {
    id v20 = v6;
    goto LABEL_23;
  }
  id v21 = 0;
LABEL_25:

  return v21;
}

+ (id)storefrontCountryCodeFromPathComponent:(id)a3
{
  id v3 = a3;
  if (+[LPiTunesMediaStorefrontMappings isValidStorefrontCountryCode:v3])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)storefrontCountryCode
{
  return self->_storefrontCountryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefrontCountryCode, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end