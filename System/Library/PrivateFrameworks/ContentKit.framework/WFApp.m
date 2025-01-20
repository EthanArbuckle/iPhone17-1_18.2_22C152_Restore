@interface WFApp
+ (BOOL)supportsSecureCoding;
+ (id)allApps;
+ (id)findAppWithBundleIdentifier:(id)a3 name:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrontmost;
- (BOOL)isHidden;
- (BOOL)isRunning;
- (NSString)bundleIdentifier;
- (NSString)localizedName;
- (WFApp)initWithBundleIdentifier:(id)a3 displayRepresentation:(id)a4;
- (WFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4;
- (WFApp)initWithCoder:(id)a3;
- (WFApp)initWithRecord:(id)a3;
- (WFAppDisplayRepresentation)displayRepresentation;
- (id)bundleURL;
- (id)icon;
- (id)launchDate;
- (id)processIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFApp

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (WFAppDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFApp *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  id v6 = [(WFApp *)self localizedName];
  [v4 encodeObject:v6 forKey:@"localizedName"];
}

- (WFApp)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedName"];
    self = [(WFApp *)self initWithBundleIdentifier:v5 localizedName:v6];

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(WFApp *)self bundleIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [(WFApp *)self bundleIdentifier];
  id v6 = v4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v8 = v7;

  v9 = [v8 bundleIdentifier];

  id v10 = v5;
  id v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {
    char v13 = 1;
  }
  else
  {
    char v13 = 0;
    if (v10 && v11) {
      char v13 = [v10 isEqual:v11];
    }
  }

  return v13;
}

- (id)icon
{
  v2 = (void *)MEMORY[0x263F85308];
  unint64_t v3 = [(WFApp *)self bundleIdentifier];
  id v4 = [v2 applicationIconImageForBundleIdentifier:v3 format:2];

  return v4;
}

- (id)launchDate
{
  return 0;
}

- (id)bundleURL
{
  return 0;
}

- (BOOL)isHidden
{
  return 0;
}

- (BOOL)isFrontmost
{
  return 0;
}

- (id)processIdentifier
{
  return 0;
}

- (BOOL)isRunning
{
  return 0;
}

- (NSString)localizedName
{
  return [(WFAppDisplayRepresentation *)self->_displayRepresentation title];
}

- (WFApp)initWithBundleIdentifier:(id)a3 displayRepresentation:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFApp.m", 188, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v10 = [(WFApp *)self init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    objc_storeStrong((id *)&v11->_displayRepresentation, a4);
    v12 = v11;
  }

  return v11;
}

- (WFApp)initWithBundleIdentifier:(id)a3 localizedName:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"WFApp.m", 174, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  id v10 = [(WFApp *)self init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleIdentifier, a3);
    if (v9)
    {
      uint64_t v12 = +[WFAppDisplayRepresentation withTitle:v9];
      displayRepresentation = v11->_displayRepresentation;
      v11->_displayRepresentation = (WFAppDisplayRepresentation *)v12;
    }
    v14 = v11;
  }

  return v11;
}

- (WFApp)initWithRecord:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFApp.m", 162, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  id v6 = [(WFApp *)self init];
  if (v6)
  {
    uint64_t v7 = [v5 bundleIdentifier];
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    id v9 = [v5 localizedName];
    uint64_t v10 = +[WFAppDisplayRepresentation withTitle:v9];
    displayRepresentation = v6->_displayRepresentation;
    v6->_displayRepresentation = (WFAppDisplayRepresentation *)v10;

    uint64_t v12 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allApps
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  +[WFGreenTeaLogger log:@"Reading installed app list", 0];
  unint64_t v3 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x2166CF8F0]();
        if (objc_msgSend(v8, "wf_isAvailableInContext:", 0))
        {
          uint64_t v10 = [[WFApp alloc] initWithRecord:v8];
          [v2 addObject:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)findAppWithBundleIdentifier:(id)a3 name:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v33 = 0;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v5 allowPlaceholder:1 error:&v33];
    id v8 = v33;
    id v9 = [v7 bundleIdentifier];

    if (v9)
    {
      uint64_t v10 = [WFApp alloc];
      id v11 = [v7 bundleIdentifier];
      long long v12 = [v7 localizedName];
      long long v13 = [(WFApp *)v10 initWithBundleIdentifier:v11 localizedName:v12];

      goto LABEL_22;
    }
  }
  else
  {
    id v8 = 0;
  }
  if ([v6 length])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    +[WFGreenTeaLogger log:@"Reading installed app list"];
    uint64_t v7 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
    uint64_t v14 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      id v27 = v8;
      id v28 = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v7);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x2166CF8F0]();
          v20 = [v18 localizedName];
          if ([v20 isEqualToString:v6])
          {

LABEL_21:
            v23 = [WFApp alloc];
            v24 = [v18 bundleIdentifier];
            v25 = [v18 localizedName];
            long long v13 = [(WFApp *)v23 initWithBundleIdentifier:v24 localizedName:v25];

            id v8 = v27;
            id v5 = v28;
            goto LABEL_22;
          }
          v21 = [v18 localizedShortName];
          char v22 = [v21 isEqualToString:v6];

          if (v22) {
            goto LABEL_21;
          }
        }
        uint64_t v15 = [v7 countByEnumeratingWithState:&v29 objects:v38 count:16];
        id v8 = v27;
        id v5 = v28;
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v7 = getWFGeneralLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "+[WFApp findAppWithBundleIdentifier:name:]";
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_ERROR, "%s Could not get app with error: %@", buf, 0x16u);
  }
  long long v13 = 0;
LABEL_22:

  return v13;
}

@end