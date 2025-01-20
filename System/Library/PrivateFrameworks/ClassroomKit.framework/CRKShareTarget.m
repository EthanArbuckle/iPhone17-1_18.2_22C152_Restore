@interface CRKShareTarget
+ (id)sandboxExtensionForPath:(id)a3;
+ (id)sandboxExtensionsForFileURLs:(id)a3;
- (BOOL)isCourse;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToShareTarget:(id)a3;
- (BOOL)isGroup;
- (BOOL)isInstructor;
- (BOOL)supportsFileURLs;
- (CATTaskClient)taskClient;
- (CRKShareTarget)initWithDictionary:(id)a3;
- (DMFControlGroupIdentifier)courseIdentifier;
- (NSData)iconImageData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)secondaryName;
- (NSString)type;
- (id)description;
- (id)operationToSendItems:(id)a3 fromBundleIdentifier:(id)a4 description:(id)a5 previewImageData:(id)a6;
- (unint64_t)hash;
- (void)setCourse:(BOOL)a3;
- (void)setCourseIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setGroup:(BOOL)a3;
- (void)setIconImageData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstructor:(BOOL)a3;
- (void)setSecondaryName:(id)a3;
- (void)setSupportsFileURLs:(BOOL)a3;
- (void)setTaskClient:(id)a3;
- (void)setType:(id)a3;
@end

@implementation CRKShareTarget

- (CRKShareTarget)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"CRKShareTarget.m", 43, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)CRKShareTarget;
  v6 = [(CRKShareTarget *)&v32 init];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F39D20]);
    v8 = [v5 objectForKeyedSubscript:@"CourseIdentifier"];
    uint64_t v9 = [v7 initWithString:v8];
    courseIdentifier = v6->_courseIdentifier;
    v6->_courseIdentifier = (DMFControlGroupIdentifier *)v9;

    v11 = [v5 objectForKeyedSubscript:@"Type"];
    uint64_t v12 = [v11 copy];
    type = v6->_type;
    v6->_type = (NSString *)v12;

    v14 = [v5 objectForKeyedSubscript:@"Identifier"];
    uint64_t v15 = [v14 copy];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v15;

    v17 = [v5 objectForKeyedSubscript:@"DisplayName"];
    uint64_t v18 = [v17 copy];
    displayName = v6->_displayName;
    v6->_displayName = (NSString *)v18;

    v20 = [v5 objectForKeyedSubscript:@"SecondaryName"];
    uint64_t v21 = [v20 copy];
    secondaryName = v6->_secondaryName;
    v6->_secondaryName = (NSString *)v21;

    v23 = [v5 objectForKeyedSubscript:@"IconImageData"];
    uint64_t v24 = [v23 copy];
    iconImageData = v6->_iconImageData;
    v6->_iconImageData = (NSData *)v24;

    v26 = [v5 objectForKeyedSubscript:@"IsCourse"];
    v6->_course = [v26 BOOLValue];

    v27 = [v5 objectForKeyedSubscript:@"IsGroup"];
    v6->_group = [v27 BOOLValue];

    v28 = [v5 objectForKeyedSubscript:@"IsInstructor"];
    v6->_instructor = [v28 BOOLValue];

    v29 = [v5 objectForKeyedSubscript:@"SupportsFileURLs"];
    v6->_supportsFileURLs = [v29 BOOLValue];
  }
  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = objc_opt_new();
  v4 = [(CRKShareTarget *)self courseIdentifier];

  if (v4)
  {
    id v5 = [(CRKShareTarget *)self courseIdentifier];
    v6 = [v5 stringValue];
    [v3 setObject:v6 forKeyedSubscript:@"CourseIdentifier"];
  }
  id v7 = [(CRKShareTarget *)self type];

  if (v7)
  {
    v8 = [(CRKShareTarget *)self type];
    [v3 setObject:v8 forKeyedSubscript:@"Type"];
  }
  uint64_t v9 = [(CRKShareTarget *)self identifier];

  if (v9)
  {
    v10 = [(CRKShareTarget *)self identifier];
    [v3 setObject:v10 forKeyedSubscript:@"Identifier"];
  }
  v11 = [(CRKShareTarget *)self displayName];

  if (v11)
  {
    uint64_t v12 = [(CRKShareTarget *)self displayName];
    [v3 setObject:v12 forKeyedSubscript:@"DisplayName"];
  }
  v13 = [(CRKShareTarget *)self secondaryName];

  if (v13)
  {
    v14 = [(CRKShareTarget *)self secondaryName];
    [v3 setObject:v14 forKeyedSubscript:@"SecondaryName"];
  }
  uint64_t v15 = [(CRKShareTarget *)self iconImageData];

  if (v15)
  {
    v16 = [(CRKShareTarget *)self iconImageData];
    [v3 setObject:v16 forKeyedSubscript:@"IconImageData"];
  }
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKShareTarget isCourse](self, "isCourse"));
  [v3 setObject:v17 forKeyedSubscript:@"IsCourse"];

  uint64_t v18 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKShareTarget isGroup](self, "isGroup"));
  [v3 setObject:v18 forKeyedSubscript:@"IsGroup"];

  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKShareTarget isInstructor](self, "isInstructor"));
  [v3 setObject:v19 forKeyedSubscript:@"IsInstructor"];

  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[CRKShareTarget supportsFileURLs](self, "supportsFileURLs"));
  [v3 setObject:v20 forKeyedSubscript:@"SupportsFileURLs"];

  uint64_t v21 = (void *)[v3 copy];

  return (NSDictionary *)v21;
}

- (id)operationToSendItems:(id)a3 fromBundleIdentifier:(id)a4 description:(id)a5 previewImageData:(id)a6
{
  v10 = (void *)MEMORY[0x263F08A98];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 predicateWithFormat:@"isFileURL == %@", MEMORY[0x263EFFA88]];
  v16 = [v14 filteredArrayUsingPredicate:v15];

  v17 = objc_opt_new();
  uint64_t v18 = [(CRKShareTarget *)self courseIdentifier];
  [v17 setCourseIdentifier:v18];

  v19 = [(CRKShareTarget *)self type];
  [v17 setTargetType:v19];

  v20 = [(CRKShareTarget *)self identifier];
  [v17 setTargetIdentifier:v20];

  [v17 setUrls:v14];
  uint64_t v21 = objc_msgSend(NSURL, "crk_overriddenDescriptionForItems:originalDescription:", v14, v12);

  [v17 setShareDescription:v21];
  [v17 setPreviewImageData:v11];

  v22 = [(id)objc_opt_class() sandboxExtensionsForFileURLs:v16];
  [v17 setSandboxExtensions:v22];

  [v17 setSourceBundleIdentifier:v13];
  v23 = [(CRKShareTarget *)self taskClient];
  uint64_t v24 = [v23 prepareTaskOperationForRequest:v17];

  return v24;
}

+ (id)sandboxExtensionsForFileURLs:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "path", (void)v16);
        if (v11)
        {
          id v12 = [a1 sandboxExtensionForPath:v11];
          if (v12) {
            [v5 setObject:v12 forKeyedSubscript:v11];
          }
        }
        id v13 = [v11 stringByDeletingLastPathComponent];
        if (v13)
        {
          id v14 = [a1 sandboxExtensionForPath:v13];
          if (v14) {
            [v5 setObject:v14 forKeyedSubscript:v13];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)sandboxExtensionForPath:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  [@"com.apple.app-sandbox.read" UTF8String];
  id v4 = v3;
  [v4 UTF8String];
  id v5 = (char *)sandbox_extension_issue_file();
  if (_CRKLogGeneral_onceToken_3 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_3, &__block_literal_global_17);
  }
  id v6 = _CRKLogGeneral_logObj_3;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v4;
    __int16 v11 = 2082;
    id v12 = v5;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "Created sandbox extension for file with path %{public}@: %{public}s", (uint8_t *)&v9, 0x16u);
  }
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v5 length:strlen(v5) + 1];
    free(v5);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v3 = [(CRKShareTarget *)self courseIdentifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(CRKShareTarget *)self type];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(CRKShareTarget *)self identifier];
  uint64_t v8 = [v7 hash];
  int v9 = [(CRKShareTarget *)self displayName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  __int16 v11 = [(CRKShareTarget *)self secondaryName];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CRKShareTarget *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CRKShareTarget *)self isEqualToShareTarget:v4];
  }

  return v5;
}

- (BOOL)isEqualToShareTarget:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKShareTarget *)self courseIdentifier];
  uint64_t v6 = [v4 courseIdentifier];
  unint64_t v7 = v5;
  unint64_t v8 = v6;
  if (v7 | v8 && (int v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
  {
    LOBYTE(v31) = 0;
  }
  else
  {
    uint64_t v10 = [(CRKShareTarget *)self type];
    __int16 v11 = [v4 type];
    unint64_t v12 = v10;
    unint64_t v13 = v11;
    if (v12 | v13 && (int v14 = [(id)v12 isEqual:v13], (id)v13, (id)v12, !v14))
    {
      LOBYTE(v31) = 0;
    }
    else
    {
      uint64_t v15 = [(CRKShareTarget *)self identifier];
      long long v16 = [v4 identifier];
      unint64_t v17 = v15;
      unint64_t v18 = v16;
      if (v17 | v18
        && (int v19 = [(id)v17 isEqual:v18], (id)v18, (id)v17, !v19))
      {
        LOBYTE(v31) = 0;
      }
      else
      {
        v20 = [(CRKShareTarget *)self displayName];
        uint64_t v21 = [v4 displayName];
        unint64_t v22 = v20;
        unint64_t v36 = v21;
        v37 = (void *)v22;
        if (v22 | v36
          && (int v34 = [(id)v22 isEqual:v36], (id)v36, (id)v22, !v34))
        {
          LOBYTE(v31) = 0;
        }
        else
        {
          unint64_t v35 = v17;
          v23 = [(CRKShareTarget *)self secondaryName];
          uint64_t v24 = [v4 secondaryName];
          unint64_t v25 = v23;
          unint64_t v26 = v24;
          if ((!(v25 | v26)
             || (int v27 = [(id)v25 isEqual:v26], (id)v26, (id)v25, v27))
            && (int v28 = -[CRKShareTarget isCourse](self, "isCourse"), v28 == [v4 isCourse])
            && (int v29 = -[CRKShareTarget isGroup](self, "isGroup"), v29 == [v4 isGroup])
            && (int v30 = [(CRKShareTarget *)self isInstructor],
                v30 == [v4 isInstructor]))
          {
            BOOL v33 = [(CRKShareTarget *)self supportsFileURLs];
            int v31 = v33 ^ [v4 supportsFileURLs] ^ 1;
          }
          else
          {
            LOBYTE(v31) = 0;
          }
          unint64_t v17 = v35;
        }
      }
    }
  }

  return v31;
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(CRKShareTarget *)self identifier];
  uint64_t v6 = [(CRKShareTarget *)self displayName];
  unint64_t v7 = [v3 stringWithFormat:@"<%@: %p {identifier = %@, displayName = %@}>", v4, self, v5, v6];

  return v7;
}

- (DMFControlGroupIdentifier)courseIdentifier
{
  return self->_courseIdentifier;
}

- (void)setCourseIdentifier:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)secondaryName
{
  return self->_secondaryName;
}

- (void)setSecondaryName:(id)a3
{
}

- (NSData)iconImageData
{
  return self->_iconImageData;
}

- (void)setIconImageData:(id)a3
{
}

- (BOOL)isGroup
{
  return self->_group;
}

- (void)setGroup:(BOOL)a3
{
  self->_group = a3;
}

- (BOOL)isCourse
{
  return self->_course;
}

- (void)setCourse:(BOOL)a3
{
  self->_course = a3;
}

- (BOOL)isInstructor
{
  return self->_instructor;
}

- (void)setInstructor:(BOOL)a3
{
  self->_instructor = a3;
}

- (BOOL)supportsFileURLs
{
  return self->_supportsFileURLs;
}

- (void)setSupportsFileURLs:(BOOL)a3
{
  self->_supportsFileURLs = a3;
}

- (CATTaskClient)taskClient
{
  return self->_taskClient;
}

- (void)setTaskClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskClient, 0);
  objc_storeStrong((id *)&self->_iconImageData, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_courseIdentifier, 0);
}

@end