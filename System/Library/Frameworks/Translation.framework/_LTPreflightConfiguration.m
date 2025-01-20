@interface _LTPreflightConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)deviceSupportsTranslation;
- (BOOL)isForDownloadApprovalOnly;
- (NSArray)lowConfidenceLocales;
- (NSArray)sourceStrings;
- (NSArray)supportedLocalePairs;
- (NSArray)supportedLocales;
- (NSLocale)effectiveSourceLocale;
- (NSLocale)effectiveTargetLocale;
- (NSLocale)lidUnsupportedLocale;
- (NSLocale)requestedSourceLocale;
- (NSLocale)requestedTargetLocale;
- (NSLocale)resolvedSourceLocale;
- (NSLocale)resolvedTargetLocale;
- (NSLocale)systemLocale;
- (NSUUID)selfLoggingID;
- (_LTPreflightConfiguration)initWithCoder:(id)a3;
- (_LTPreflightConfiguration)initWithSession:(id)a3 request:(id)a4 supportedLocalePairs:(id)a5;
- (_LTPreflightConfiguration)initWithSourceStrings:(id)a3 supportedLocalePairs:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)nextStep;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceSupportsTranslation:(BOOL)a3;
- (void)setIsForDownloadApprovalOnly:(BOOL)a3;
- (void)setLidUnsupportedLocale:(id)a3;
- (void)setLowConfidenceLocales:(id)a3;
- (void)setRequestedSourceLocale:(id)a3;
- (void)setRequestedTargetLocale:(id)a3;
- (void)setResolvedSourceLocale:(id)a3;
- (void)setResolvedTargetLocale:(id)a3;
- (void)setSelfLoggingID:(id)a3;
- (void)setSystemLocale:(id)a3;
@end

@implementation _LTPreflightConfiguration

- (_LTPreflightConfiguration)initWithSourceStrings:(id)a3 supportedLocalePairs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_LTPreflightConfiguration;
  v8 = [(_LTPreflightConfiguration *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    sourceStrings = v8->_sourceStrings;
    v8->_sourceStrings = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    supportedLocalePairs = v8->_supportedLocalePairs;
    v8->_supportedLocalePairs = (NSArray *)v11;

    v8->_deviceSupportsTranslation = 1;
    v13 = v8;
  }

  return v8;
}

- (int64_t)nextStep
{
  if (![(_LTPreflightConfiguration *)self deviceSupportsTranslation]) {
    return 2;
  }
  uint64_t v3 = [(_LTPreflightConfiguration *)self resolvedSourceLocale];
  if (!v3) {
    return 0;
  }
  v4 = (void *)v3;
  v5 = [(_LTPreflightConfiguration *)self resolvedTargetLocale];
  int64_t v6 = v5 != 0;

  return v6;
}

- (NSArray)supportedLocales
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_supportedLocalePairs;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "sourceLocale", (void)v14);
        [v3 addObject:v10];

        uint64_t v11 = [v9 targetLocale];
        [v3 addObject:v11];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [v3 allObjects];

  return (NSArray *)v12;
}

- (NSLocale)effectiveSourceLocale
{
  uint64_t v3 = [(_LTPreflightConfiguration *)self resolvedSourceLocale];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_LTPreflightConfiguration *)self requestedSourceLocale];
  }
  uint64_t v6 = v5;

  return (NSLocale *)v6;
}

- (NSLocale)effectiveTargetLocale
{
  uint64_t v3 = [(_LTPreflightConfiguration *)self resolvedTargetLocale];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(_LTPreflightConfiguration *)self requestedTargetLocale];
  }
  uint64_t v6 = v5;

  return (NSLocale *)v6;
}

- (id)description
{
  uint64_t v3 = [(_LTPreflightConfiguration *)self lowConfidenceLocales];
  v27 = [v3 _ltCompactMap:&__block_literal_global_7];

  v23 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v4);
  v26 = [(_LTPreflightConfiguration *)self sourceStrings];
  uint64_t v19 = [v26 count];
  v25 = [(_LTPreflightConfiguration *)self supportedLocales];
  uint64_t v18 = [v25 count];
  v24 = [(_LTPreflightConfiguration *)self requestedSourceLocale];
  long long v16 = [v24 _ltLocaleIdentifier];
  v22 = [(_LTPreflightConfiguration *)self requestedTargetLocale];
  long long v15 = [v22 _ltLocaleIdentifier];
  v20 = [(_LTPreflightConfiguration *)self resolvedSourceLocale];
  id v5 = [v20 _ltLocaleIdentifier];
  long long v17 = [(_LTPreflightConfiguration *)self resolvedTargetLocale];
  uint64_t v6 = [v17 _ltLocaleIdentifier];
  uint64_t v7 = [(_LTPreflightConfiguration *)self lidUnsupportedLocale];
  v8 = [v7 _ltLocaleIdentifier];
  uint64_t v9 = [(_LTPreflightConfiguration *)self systemLocale];
  v10 = [v9 _ltLocaleIdentifier];
  if ([(_LTPreflightConfiguration *)self isForDownloadApprovalOnly]) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if ([(_LTPreflightConfiguration *)self deviceSupportsTranslation]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  objc_msgSend(v23, "stringWithFormat:", @"<%@: %p; number of sourceStrings: %zu; number of supportedLocales: %zu; requestedSource: %@; requestedTarget: %@; resolvedSource: %@; resolvedTarget: %@; lidUnsupportedLocale: %@; systemLocale: %@; lowConfidenceLocales: %@; isForDownloadApprovalOnly: %@; deviceSupportsTranslation: %@>",
    v21,
    self,
    v19,
    v18,
    v16,
    v15,
    v5,
    v6,
    v8,
    v10,
    v27,
    v11,
  v13 = v12);

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_LTPreflightConfiguration alloc];
  id v5 = [(_LTPreflightConfiguration *)self sourceStrings];
  uint64_t v6 = [(_LTPreflightConfiguration *)self supportedLocalePairs];
  uint64_t v7 = [(_LTPreflightConfiguration *)v4 initWithSourceStrings:v5 supportedLocalePairs:v6];

  v8 = [(_LTPreflightConfiguration *)self systemLocale];
  [(_LTPreflightConfiguration *)v7 setSystemLocale:v8];

  uint64_t v9 = [(_LTPreflightConfiguration *)self requestedSourceLocale];
  [(_LTPreflightConfiguration *)v7 setRequestedSourceLocale:v9];

  v10 = [(_LTPreflightConfiguration *)self requestedTargetLocale];
  [(_LTPreflightConfiguration *)v7 setRequestedTargetLocale:v10];

  uint64_t v11 = [(_LTPreflightConfiguration *)self resolvedSourceLocale];
  [(_LTPreflightConfiguration *)v7 setResolvedSourceLocale:v11];

  v12 = [(_LTPreflightConfiguration *)self resolvedTargetLocale];
  [(_LTPreflightConfiguration *)v7 setResolvedTargetLocale:v12];

  v13 = [(_LTPreflightConfiguration *)self lidUnsupportedLocale];
  [(_LTPreflightConfiguration *)v7 setLidUnsupportedLocale:v13];

  long long v14 = [(_LTPreflightConfiguration *)self lowConfidenceLocales];
  long long v15 = (void *)[v14 copy];
  [(_LTPreflightConfiguration *)v7 setLowConfidenceLocales:v15];

  [(_LTPreflightConfiguration *)v7 setIsForDownloadApprovalOnly:[(_LTPreflightConfiguration *)self isForDownloadApprovalOnly]];
  [(_LTPreflightConfiguration *)v7 setDeviceSupportsTranslation:[(_LTPreflightConfiguration *)self deviceSupportsTranslation]];
  long long v16 = [(_LTPreflightConfiguration *)self selfLoggingID];
  [(_LTPreflightConfiguration *)v7 setSelfLoggingID:v16];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  sourceStrings = self->_sourceStrings;
  id v5 = a3;
  [v5 encodeObject:sourceStrings forKey:@"sourceStrings"];
  [v5 encodeObject:self->_supportedLocalePairs forKey:@"supportedLocalePairs"];
  [v5 encodeObject:self->_systemLocale forKey:@"systemLocale"];
  [v5 encodeObject:self->_requestedSourceLocale forKey:@"requestedSourceLocale"];
  [v5 encodeObject:self->_requestedTargetLocale forKey:@"requestedTargetLocale"];
  [v5 encodeObject:self->_resolvedSourceLocale forKey:@"resolvedSourceLocale"];
  [v5 encodeObject:self->_resolvedTargetLocale forKey:@"resolvedTargetLocale"];
  [v5 encodeObject:self->_lidUnsupportedLocale forKey:@"lidUnsupportedLocale"];
  [v5 encodeObject:self->_lowConfidenceLocales forKey:@"lowConfidenceLocales"];
  [v5 encodeBool:self->_isForDownloadApprovalOnly forKey:@"isForDownloadApprovalOnly"];
  [v5 encodeBool:self->_deviceSupportsTranslation forKey:@"deviceSupportsTranslation"];
  [v5 encodeObject:self->_selfLoggingID forKey:@"selfLoggingID"];
}

- (_LTPreflightConfiguration)initWithCoder:(id)a3
{
  v40[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)_LTPreflightConfiguration;
  id v5 = [(_LTPreflightConfiguration *)&v37 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
    v8 = [v6 setWithArray:v7];

    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"sourceStrings"];
    sourceStrings = v5->_sourceStrings;
    v5->_sourceStrings = (NSArray *)v9;

    if (v5->_sourceStrings)
    {
      uint64_t v11 = (void *)MEMORY[0x263EFFA08];
      v39[0] = objc_opt_class();
      v39[1] = objc_opt_class();
      v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
      v13 = [v11 setWithArray:v12];

      uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"supportedLocalePairs"];
      supportedLocalePairs = v5->_supportedLocalePairs;
      v5->_supportedLocalePairs = (NSArray *)v14;

      if (v5->_supportedLocalePairs)
      {
        long long v16 = (void *)MEMORY[0x263EFFA08];
        v38[0] = objc_opt_class();
        v38[1] = objc_opt_class();
        long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
        uint64_t v18 = [v16 setWithArray:v17];

        uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemLocale"];
        systemLocale = v5->_systemLocale;
        v5->_systemLocale = (NSLocale *)v19;

        uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedSourceLocale"];
        requestedSourceLocale = v5->_requestedSourceLocale;
        v5->_requestedSourceLocale = (NSLocale *)v21;

        uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestedTargetLocale"];
        requestedTargetLocale = v5->_requestedTargetLocale;
        v5->_requestedTargetLocale = (NSLocale *)v23;

        uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolvedSourceLocale"];
        resolvedSourceLocale = v5->_resolvedSourceLocale;
        v5->_resolvedSourceLocale = (NSLocale *)v25;

        uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolvedTargetLocale"];
        resolvedTargetLocale = v5->_resolvedTargetLocale;
        v5->_resolvedTargetLocale = (NSLocale *)v27;

        uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lidUnsupportedLocale"];
        lidUnsupportedLocale = v5->_lidUnsupportedLocale;
        v5->_lidUnsupportedLocale = (NSLocale *)v29;

        uint64_t v31 = [v4 decodeObjectOfClasses:v18 forKey:@"lowConfidenceLocales"];
        lowConfidenceLocales = v5->_lowConfidenceLocales;
        v5->_lowConfidenceLocales = (NSArray *)v31;

        v5->_isForDownloadApprovalOnly = [v4 decodeBoolForKey:@"isForDownloadApprovalOnly"];
        v5->_deviceSupportsTranslation = [v4 decodeBoolForKey:@"deviceSupportsTranslation"];
        uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selfLoggingID"];
        selfLoggingID = v5->_selfLoggingID;
        v5->_selfLoggingID = (NSUUID *)v33;

        v35 = v5;
      }
      else
      {
        v35 = 0;
      }
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)supportedLocalePairs
{
  return self->_supportedLocalePairs;
}

- (NSArray)sourceStrings
{
  return self->_sourceStrings;
}

- (NSLocale)systemLocale
{
  return self->_systemLocale;
}

- (void)setSystemLocale:(id)a3
{
}

- (NSLocale)requestedSourceLocale
{
  return self->_requestedSourceLocale;
}

- (void)setRequestedSourceLocale:(id)a3
{
}

- (NSLocale)requestedTargetLocale
{
  return self->_requestedTargetLocale;
}

- (void)setRequestedTargetLocale:(id)a3
{
}

- (NSLocale)resolvedSourceLocale
{
  return self->_resolvedSourceLocale;
}

- (void)setResolvedSourceLocale:(id)a3
{
}

- (NSLocale)resolvedTargetLocale
{
  return self->_resolvedTargetLocale;
}

- (void)setResolvedTargetLocale:(id)a3
{
}

- (NSArray)lowConfidenceLocales
{
  return self->_lowConfidenceLocales;
}

- (void)setLowConfidenceLocales:(id)a3
{
}

- (NSLocale)lidUnsupportedLocale
{
  return self->_lidUnsupportedLocale;
}

- (void)setLidUnsupportedLocale:(id)a3
{
}

- (BOOL)isForDownloadApprovalOnly
{
  return self->_isForDownloadApprovalOnly;
}

- (void)setIsForDownloadApprovalOnly:(BOOL)a3
{
  self->_isForDownloadApprovalOnly = a3;
}

- (BOOL)deviceSupportsTranslation
{
  return self->_deviceSupportsTranslation;
}

- (void)setDeviceSupportsTranslation:(BOOL)a3
{
  self->_deviceSupportsTranslation = a3;
}

- (NSUUID)selfLoggingID
{
  return self->_selfLoggingID;
}

- (void)setSelfLoggingID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfLoggingID, 0);
  objc_storeStrong((id *)&self->_lidUnsupportedLocale, 0);
  objc_storeStrong((id *)&self->_lowConfidenceLocales, 0);
  objc_storeStrong((id *)&self->_resolvedTargetLocale, 0);
  objc_storeStrong((id *)&self->_resolvedSourceLocale, 0);
  objc_storeStrong((id *)&self->_requestedTargetLocale, 0);
  objc_storeStrong((id *)&self->_requestedSourceLocale, 0);
  objc_storeStrong((id *)&self->_systemLocale, 0);
  objc_storeStrong((id *)&self->_sourceStrings, 0);

  objc_storeStrong((id *)&self->_supportedLocalePairs, 0);
}

- (_LTPreflightConfiguration)initWithSession:(id)a3 request:(id)a4 supportedLocalePairs:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v9 batch];
  v12 = [v11 _ltCompactMap:&__block_literal_global_9];

  v13 = [(_LTPreflightConfiguration *)self initWithSourceStrings:v12 supportedLocalePairs:v8];
  uint64_t v14 = v13;
  long long v15 = [v10 sourceLocale];
  [(_LTPreflightConfiguration *)v14 setRequestedSourceLocale:v15];

  long long v16 = [v10 targetLocale];

  [(_LTPreflightConfiguration *)v14 setRequestedTargetLocale:v16];
  uint64_t v17 = [v9 isForDownloadRequest];

  [(_LTPreflightConfiguration *)v14 setIsForDownloadApprovalOnly:v17];
  uint64_t v18 = [MEMORY[0x263EFF960] currentLocale];
  [(_LTPreflightConfiguration *)v14 setSystemLocale:v18];

  return v14;
}

@end