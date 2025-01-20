@interface GEOSearchAttributionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)hasAttributionRequirement:(int)a3;
- (BOOL)shouldOpenInAppStore;
- (BOOL)supportsActionURLs;
- (GEOSearchAttributionInfo)initWithCoder:(id)a3;
- (GEOSearchAttributionInfo)initWithDictionaryRepresentation:(id)a3;
- (GEOSearchAttributionInfo)initWithSource:(id)a3 localizedAttribution:(id)a4 logoPaths:(id)a5 snippetLogoPaths:(id)a6;
- (GEOSearchAttributionSource)source;
- (NSArray)attributionApps;
- (NSString)appAdamID;
- (NSString)captionDisplayName;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)webBaseActionURL;
- (id)description;
- (id)dictionaryRepresentation;
- (id)logoPathForScale:(double)a3;
- (id)snippetLogoPathForScale:(double)a3;
- (unsigned)requirementsMask;
- (unsigned)version;
- (void)addLogoPath:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GEOSearchAttributionInfo

- (GEOSearchAttributionInfo)initWithSource:(id)a3 localizedAttribution:(id)a4 logoPaths:(id)a5 snippetLogoPaths:(id)a6
{
  v11 = a3;
  v12 = (id *)a4;
  id v13 = a5;
  id v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)GEOSearchAttributionInfo;
  v15 = [(GEOSearchAttributionInfo *)&v29 init];
  if (v15)
  {
    if (![v13 count])
    {

      id v13 = 0;
    }
    if (![v14 count])
    {

      id v14 = 0;
    }
    objc_storeStrong((id *)&v15->_source, a3);
    uint64_t v16 = [v13 copy];
    logoPaths = v15->_logoPaths;
    v15->_logoPaths = (NSArray *)v16;

    uint64_t v18 = [v14 copy];
    snippetLogoPaths = v15->_snippetLogoPaths;
    v15->_snippetLogoPaths = (NSArray *)v18;

    v20 = -[GEOLocalizedAttribution displayName](v12);
    uint64_t v21 = [v20 copy];
    displayName = v15->_displayName;
    v15->_displayName = (NSString *)v21;

    v23 = -[GEOLocalizedAttribution captionDisplayString](v12);
    uint64_t v24 = [v23 copy];
    captionDisplayName = v15->_captionDisplayName;
    v15->_captionDisplayName = (NSString *)v24;

    unint64_t v26 = 0;
    if (!v11) {
      goto LABEL_10;
    }
LABEL_7:
    -[GEOSearchAttributionSource _readAttributionRequirements]((uint64_t)v11);
    for (unint64_t i = v11[4]; v26 < i; unint64_t i = 0)
    {
      v15->_attributionRequirementsMask |= 1 << -[GEOSearchAttributionSource attributionRequirementsAtIndex:]((uint64_t)v11, v26++);
      if (v11) {
        goto LABEL_7;
      }
LABEL_10:
      ;
    }
  }

  return v15;
}

- (BOOL)hasAttributionRequirement:(int)a3
{
  return (self->_attributionRequirementsMask >> a3) & 1;
}

- (GEOSearchAttributionSource)source
{
  return self->_source;
}

- (BOOL)supportsActionURLs
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(GEOSearchAttributionInfo *)self attributionApps];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        v9 = objc_msgSend(v8, "handledSchemes", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              if ([*(id *)(*((void *)&v16 + 1) + 8 * j) isEqualToString:@"com.apple.maps.action"])
              {

                BOOL v14 = 1;
                goto LABEL_18;
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  v3 = [(GEOSearchAttributionInfo *)self webBaseActionURL];
  BOOL v14 = [v3 length] != 0;
LABEL_18:

  return v14;
}

- (NSString)webBaseActionURL
{
  return -[GEOSearchAttributionSource webBaseActionURL]((id *)&self->_source->super.super.isa);
}

- (NSArray)attributionApps
{
  return (NSArray *)-[GEOSearchAttributionSource attributionApps]((id *)&self->_source->super.super.isa);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionDisplayName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_snippetLogoPaths, 0);
  objc_storeStrong((id *)&self->_logoPaths, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

- (NSString)identifier
{
  return -[GEOSearchAttributionSource sourceIdentifier]((id *)&self->_source->super.super.isa);
}

- (unsigned)version
{
  source = self->_source;
  if (source) {
    return source->_sourceVersion;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldOpenInAppStore
{
  source = self->_source;
  return source && source->_enforceAppStore;
}

- (NSString)appAdamID
{
  return -[GEOSearchAttributionSource appAdamID]((id *)&self->_source->super.super.isa);
}

- (GEOSearchAttributionInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)GEOSearchAttributionInfo;
  uint64_t v5 = [(GEOSearchAttributionInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"source"];
    if (v6)
    {
      v7 = [[GEOSearchAttributionSource alloc] initWithData:v6];
      source = v5->_source;
      v5->_source = v7;
    }
    v9 = [v4 objectForKey:@"displayName"];
    uint64_t v10 = [v9 copy];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    uint64_t v12 = [v4 objectForKey:@"logoPaths"];
    if (![v12 count])
    {

      uint64_t v12 = 0;
    }
    uint64_t v13 = [v12 copy];
    logoPaths = v5->_logoPaths;
    v5->_logoPaths = (NSArray *)v13;

    v15 = [v4 objectForKey:@"snippetLogoPaths"];
    if (![v15 count])
    {

      v15 = 0;
    }
    uint64_t v16 = [v15 copy];
    snippetLogoPaths = v5->_snippetLogoPaths;
    v5->_snippetLogoPaths = (NSArray *)v16;

    long long v18 = [v4 objectForKey:@"attributionRequirementsMask"];
    v5->_attributionRequirementsMask = [v18 unsignedIntValue];

    long long v19 = v5;
  }

  return v5;
}

- (GEOSearchAttributionInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOSearchAttributionInfo;
  uint64_t v5 = [(GEOSearchAttributionInfo *)&v17 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"source"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
      source = v5->_source;
      v5->_source = (GEOSearchAttributionSource *)v6;
    }
    if ([v4 containsValueForKey:@"snippetLogoPaths"])
    {
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetLogoPaths"];
      snippetLogoPaths = v5->_snippetLogoPaths;
      v5->_snippetLogoPaths = (NSArray *)v8;
    }
    if ([v4 containsValueForKey:@"logoPaths"])
    {
      uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoPaths"];
      logoPaths = v5->_logoPaths;
      v5->_logoPaths = (NSArray *)v10;
    }
    if ([v4 containsValueForKey:@"displayName"])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
      uint64_t v13 = [v12 copy];
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v13;
    }
    if ([v4 containsValueForKey:@"requirementsMask"])
    {
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requirementsMask"];
      v5->_attributionRequirementsMask = [v15 unsignedIntValue];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  source = self->_source;
  id v5 = a3;
  [v5 encodeObject:source forKey:@"source"];
  [v5 encodeObject:self->_logoPaths forKey:@"logoPaths"];
  [v5 encodeObject:self->_snippetLogoPaths forKey:@"snippetLogoPaths"];
  uint64_t v6 = [(GEOSearchAttributionInfo *)self displayName];
  [v5 encodeObject:v6 forKey:@"displayName"];

  objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[GEOSearchAttributionInfo requirementsMask](self, "requirementsMask"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v7 forKey:@"requirementsMask"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dictionaryRepresentation
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v13[0] = @"source";
  source = self->_source;
  if (!source) {
    source = (GEOSearchAttributionSource *)MEMORY[0x1E4F1C9B8];
  }
  id v4 = [(GEOSearchAttributionSource *)source data];
  displayName = self->_displayName;
  v14[0] = v4;
  v14[1] = displayName;
  v13[1] = @"displayName";
  v13[2] = @"logoPaths";
  logoPaths = self->_logoPaths;
  id v7 = logoPaths;
  if (!logoPaths)
  {
    id v7 = [MEMORY[0x1E4F1C978] array];
  }
  v14[2] = v7;
  v13[3] = @"snippetLogoPaths";
  snippetLogoPaths = self->_snippetLogoPaths;
  v9 = snippetLogoPaths;
  if (!snippetLogoPaths)
  {
    v9 = [MEMORY[0x1E4F1C978] array];
  }
  v14[3] = v9;
  v13[4] = @"attributionRequirementsMask";
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:self->_attributionRequirementsMask];
  v14[4] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  if (snippetLogoPaths)
  {
    if (logoPaths) {
      goto LABEL_9;
    }
  }
  else
  {

    if (logoPaths) {
      goto LABEL_9;
    }
  }

LABEL_9:

  return v11;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttributionInfo;
  id v4 = [(GEOSearchAttributionInfo *)&v8 description];
  id v5 = [(GEOSearchAttributionInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)logoPathForScale:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_logoPaths;
  uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v20)
  {
    unint64_t v5 = vcvtpd_u64_f64(a3);
    uint64_t v6 = *(void *)v22;
    uint64_t v19 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        if (a3 <= 1.0)
        {
          unint64_t v11 = v5;
          char v12 = 0;
          uint64_t v13 = 2;
          while (1)
          {
            char v14 = v12;
            v15 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v13);
            uint64_t v16 = [v8 rangeOfString:v15];

            if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            char v12 = 1;
            uint64_t v13 = 3;
            if (v14)
            {

              goto LABEL_17;
            }
          }

          unint64_t v5 = v11;
          uint64_t v6 = v19;
        }
        else
        {
          v9 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v5);
          uint64_t v10 = [v8 rangeOfString:v9];

          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_17:
            id v17 = v8;
            goto LABEL_19;
          }
        }
      }
      id v17 = 0;
      uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (id)snippetLogoPathForScale:(double)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = self->_snippetLogoPaths;
  uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v20)
  {
    unint64_t v5 = vcvtpd_u64_f64(a3);
    uint64_t v6 = *(void *)v22;
    uint64_t v19 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        if (a3 <= 1.0)
        {
          unint64_t v11 = v5;
          char v12 = 0;
          uint64_t v13 = 2;
          while (1)
          {
            char v14 = v12;
            v15 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v13);
            uint64_t v16 = [v8 rangeOfString:v15];

            if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            char v12 = 1;
            uint64_t v13 = 3;
            if (v14)
            {

              goto LABEL_17;
            }
          }

          unint64_t v5 = v11;
          uint64_t v6 = v19;
        }
        else
        {
          v9 = objc_msgSend(NSString, "stringWithFormat:", @"@%lux", v5);
          uint64_t v10 = [v8 rangeOfString:v9];

          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_17:
            id v17 = v8;
            goto LABEL_19;
          }
        }
      }
      id v17 = 0;
      uint64_t v20 = [(NSArray *)v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v17 = 0;
  }
LABEL_19:

  return v17;
}

- (void)addLogoPath:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    if (self->_logoPaths) {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
    }
    else {
    unint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    }
    [(NSArray *)v5 addObject:v7];
    logoPaths = self->_logoPaths;
    self->_logoPaths = v5;

    id v4 = v7;
  }
}

- (NSString)captionDisplayName
{
  return self->_captionDisplayName;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unsigned)requirementsMask
{
  return self->_attributionRequirementsMask;
}

@end