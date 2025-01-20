@interface _INPBAppBundleInfo
+ (BOOL)supportsSecureCoding;
+ (Class)intentSupportType;
+ (Class)localizedProjectsType;
+ (Class)supportedPlatformsType;
- (BOOL)hasAppId;
- (BOOL)hasBuildId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)intentSupports;
- (NSArray)localizedProjects;
- (NSArray)supportedPlatforms;
- (_INPBAppBundleInfo)initWithCoder:(id)a3;
- (_INPBAppId)appId;
- (_INPBBuildId)buildId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)intentSupportAtIndex:(unint64_t)a3;
- (id)localizedProjectsAtIndex:(unint64_t)a3;
- (id)supportedPlatformsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)intentSupportsCount;
- (unint64_t)localizedProjectsCount;
- (unint64_t)supportedPlatformsCount;
- (void)addIntentSupport:(id)a3;
- (void)addLocalizedProjects:(id)a3;
- (void)addSupportedPlatforms:(id)a3;
- (void)clearIntentSupports;
- (void)clearLocalizedProjects;
- (void)clearSupportedPlatforms;
- (void)encodeWithCoder:(id)a3;
- (void)setAppId:(id)a3;
- (void)setBuildId:(id)a3;
- (void)setIntentSupports:(id)a3;
- (void)setLocalizedProjects:(id)a3;
- (void)setSupportedPlatforms:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBAppBundleInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedPlatforms, 0);
  objc_storeStrong((id *)&self->_localizedProjects, 0);
  objc_storeStrong((id *)&self->_intentSupports, 0);
  objc_storeStrong((id *)&self->_buildId, 0);

  objc_storeStrong((id *)&self->_appId, 0);
}

- (NSArray)supportedPlatforms
{
  return self->_supportedPlatforms;
}

- (NSArray)localizedProjects
{
  return self->_localizedProjects;
}

- (NSArray)intentSupports
{
  return self->_intentSupports;
}

- (_INPBBuildId)buildId
{
  return self->_buildId;
}

- (_INPBAppId)appId
{
  return self->_appId;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBAppBundleInfo *)self appId];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"app_id"];

  v6 = [(_INPBAppBundleInfo *)self buildId];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"build_id"];

  if ([(NSArray *)self->_intentSupports count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v9 = self->_intentSupports;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v39 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v38 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"intent_support"];
  }
  if ([(NSArray *)self->_localizedProjects count])
  {
    v15 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v16 = self->_localizedProjects;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v34 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"localized_projects"];
  }
  if ([(NSArray *)self->_supportedPlatforms count])
  {
    v22 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v23 = self->_supportedPlatforms;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * k), "dictionaryRepresentation", (void)v30);
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"supported_platforms"];
  }

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_INPBAppId *)self->_appId hash];
  unint64_t v4 = [(_INPBBuildId *)self->_buildId hash] ^ v3;
  uint64_t v5 = [(NSArray *)self->_intentSupports hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_localizedProjects hash];
  return v6 ^ [(NSArray *)self->_supportedPlatforms hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  uint64_t v5 = [(_INPBAppBundleInfo *)self appId];
  uint64_t v6 = [v4 appId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v7 = [(_INPBAppBundleInfo *)self appId];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(_INPBAppBundleInfo *)self appId];
    uint64_t v10 = [v4 appId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAppBundleInfo *)self buildId];
  uint64_t v6 = [v4 buildId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v12 = [(_INPBAppBundleInfo *)self buildId];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_INPBAppBundleInfo *)self buildId];
    v15 = [v4 buildId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAppBundleInfo *)self intentSupports];
  uint64_t v6 = [v4 intentSupports];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v17 = [(_INPBAppBundleInfo *)self intentSupports];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(_INPBAppBundleInfo *)self intentSupports];
    v20 = [v4 intentSupports];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAppBundleInfo *)self localizedProjects];
  uint64_t v6 = [v4 localizedProjects];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_26;
  }
  uint64_t v22 = [(_INPBAppBundleInfo *)self localizedProjects];
  if (v22)
  {
    v23 = (void *)v22;
    uint64_t v24 = [(_INPBAppBundleInfo *)self localizedProjects];
    uint64_t v25 = [v4 localizedProjects];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBAppBundleInfo *)self supportedPlatforms];
  uint64_t v6 = [v4 supportedPlatforms];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v27 = [(_INPBAppBundleInfo *)self supportedPlatforms];
    if (!v27)
    {

LABEL_30:
      BOOL v32 = 1;
      goto LABEL_28;
    }
    v28 = (void *)v27;
    v29 = [(_INPBAppBundleInfo *)self supportedPlatforms];
    long long v30 = [v4 supportedPlatforms];
    char v31 = [v29 isEqual:v30];

    if (v31) {
      goto LABEL_30;
    }
  }
  else
  {
LABEL_26:
  }
LABEL_27:
  BOOL v32 = 0;
LABEL_28:

  return v32;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBAppBundleInfo allocWithZone:](_INPBAppBundleInfo, "allocWithZone:") init];
  id v6 = [(_INPBAppId *)self->_appId copyWithZone:a3];
  [(_INPBAppBundleInfo *)v5 setAppId:v6];

  id v7 = [(_INPBBuildId *)self->_buildId copyWithZone:a3];
  [(_INPBAppBundleInfo *)v5 setBuildId:v7];

  v8 = (void *)[(NSArray *)self->_intentSupports copyWithZone:a3];
  [(_INPBAppBundleInfo *)v5 setIntentSupports:v8];

  v9 = (void *)[(NSArray *)self->_localizedProjects copyWithZone:a3];
  [(_INPBAppBundleInfo *)v5 setLocalizedProjects:v9];

  uint64_t v10 = (void *)[(NSArray *)self->_supportedPlatforms copyWithZone:a3];
  [(_INPBAppBundleInfo *)v5 setSupportedPlatforms:v10];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBAppBundleInfo *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBAppBundleInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBAppBundleInfo *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBAppBundleInfo *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBAppBundleInfo *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBAppBundleInfo *)self appId];

  if (v5)
  {
    id v6 = [(_INPBAppBundleInfo *)self appId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBAppBundleInfo *)self buildId];

  if (v7)
  {
    v8 = [(_INPBAppBundleInfo *)self buildId];
    PBDataWriterWriteSubmessage();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v9 = self->_intentSupports;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        PBDataWriterWriteSubmessage();
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v11);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v14 = self->_localizedProjects;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v16);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v19 = self->_supportedPlatforms;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBAppBundleInfoReadFrom(self, (uint64_t)a3);
}

- (id)supportedPlatformsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_supportedPlatforms objectAtIndexedSubscript:a3];
}

- (unint64_t)supportedPlatformsCount
{
  return [(NSArray *)self->_supportedPlatforms count];
}

- (void)addSupportedPlatforms:(id)a3
{
  id v4 = a3;
  supportedPlatforms = self->_supportedPlatforms;
  id v8 = v4;
  if (!supportedPlatforms)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_supportedPlatforms;
    self->_supportedPlatforms = v6;

    id v4 = v8;
    supportedPlatforms = self->_supportedPlatforms;
  }
  [(NSArray *)supportedPlatforms addObject:v4];
}

- (void)clearSupportedPlatforms
{
}

- (void)setSupportedPlatforms:(id)a3
{
  self->_supportedPlatforms = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)localizedProjectsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_localizedProjects objectAtIndexedSubscript:a3];
}

- (unint64_t)localizedProjectsCount
{
  return [(NSArray *)self->_localizedProjects count];
}

- (void)addLocalizedProjects:(id)a3
{
  id v4 = a3;
  localizedProjects = self->_localizedProjects;
  id v8 = v4;
  if (!localizedProjects)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_localizedProjects;
    self->_localizedProjects = v6;

    id v4 = v8;
    localizedProjects = self->_localizedProjects;
  }
  [(NSArray *)localizedProjects addObject:v4];
}

- (void)clearLocalizedProjects
{
}

- (void)setLocalizedProjects:(id)a3
{
  self->_localizedProjects = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (id)intentSupportAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_intentSupports objectAtIndexedSubscript:a3];
}

- (unint64_t)intentSupportsCount
{
  return [(NSArray *)self->_intentSupports count];
}

- (void)addIntentSupport:(id)a3
{
  id v4 = a3;
  intentSupports = self->_intentSupports;
  id v8 = v4;
  if (!intentSupports)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_intentSupports;
    self->_intentSupports = v6;

    id v4 = v8;
    intentSupports = self->_intentSupports;
  }
  [(NSArray *)intentSupports addObject:v4];
}

- (void)clearIntentSupports
{
}

- (void)setIntentSupports:(id)a3
{
  self->_intentSupports = (NSArray *)[a3 mutableCopy];

  MEMORY[0x1F41817F8]();
}

- (BOOL)hasBuildId
{
  return self->_buildId != 0;
}

- (void)setBuildId:(id)a3
{
}

- (BOOL)hasAppId
{
  return self->_appId != 0;
}

- (void)setAppId:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)supportedPlatformsType
{
  return (Class)objc_opt_class();
}

+ (Class)localizedProjectsType
{
  return (Class)objc_opt_class();
}

+ (Class)intentSupportType
{
  return (Class)objc_opt_class();
}

@end