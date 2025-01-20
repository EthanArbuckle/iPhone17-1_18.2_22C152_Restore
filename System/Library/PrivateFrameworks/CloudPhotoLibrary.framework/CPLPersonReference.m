@interface CPLPersonReference
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CPLPersonReference)init;
- (CPLPersonReference)initWithCPLArchiver:(id)a3;
- (CPLPersonReference)initWithCoder:(id)a3;
- (CPLPersonReference)initWithSerializedString:(id)a3;
- (NSDictionary)extraProperties;
- (NSString)description;
- (NSString)personIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)plistArchiveWithCPLArchiver:(id)a3;
- (id)serializedString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExtraProperties:(id)a3;
- (void)setPersonIdentifier:(id)a3;
@end

@implementation CPLPersonReference

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_extraProperties, 0);
}

- (void)setPersonIdentifier:(id)a3
{
}

- (NSString)personIdentifier
{
  return self->_personIdentifier;
}

- (void)setExtraProperties:(id)a3
{
}

- (NSDictionary)extraProperties
{
  return self->_extraProperties;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"Identifier: %@ Extra properties: %@", self->_personIdentifier, self->_extraProperties];
}

- (unint64_t)hash
{
  return [(NSString *)self->_personIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CPLPersonReference *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = self->_personIdentifier;
      v7 = [(CPLPersonReference *)v5 personIdentifier];
      unint64_t v8 = (unint64_t)v7;
      if (v6 && v7)
      {
        char v9 = [(id)v6 isEqual:v7];

        if ((v9 & 1) == 0)
        {
LABEL_6:
          BOOL v10 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      else
      {

        if (v6 | v8) {
          goto LABEL_6;
        }
      }
      unint64_t v11 = self->_extraProperties;
      uint64_t v12 = [(CPLPersonReference *)v5 extraProperties];
      uint64_t v13 = v12;
      BOOL v10 = v11 && v12 && ([(id)v11 isEqual:v12] & 1) != 0 || (v11 | v13) == 0;

      goto LABEL_16;
    }
    BOOL v10 = 0;
  }
LABEL_17:

  return v10;
}

- (id)serializedString
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@%@%@", @"id", @"=", self->_personIdentifier];
  if ([(NSDictionary *)self->_extraProperties count])
  {
    v4 = [(NSDictionary *)self->_extraProperties allKeys];
    v5 = [v4 sortedArrayUsingSelector:sel_compare_];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v12 = [(NSDictionary *)self->_extraProperties objectForKeyedSubscript:v11];
          [v3 appendFormat:@"%@%@%@%@", @";", v11, @"=", v12, (void)v14];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
  return v3;
}

- (CPLPersonReference)initWithSerializedString:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CPLPersonReference;
  v5 = [(CPLPersonReference *)&v27 init];
  id v6 = v5;
  if (v5)
  {
    id v20 = v4;
    v21 = v5;
    uint64_t v7 = [v4 componentsSeparatedByString:@";"];
    uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v14 count] == 2)
          {
            long long v15 = [v14 objectAtIndex:0];
            long long v16 = [v15 stringByTrimmingCharactersInSet:v8];

            long long v17 = [v14 objectAtIndex:1];
            v18 = [v17 stringByTrimmingCharactersInSet:v8];

            if ([v16 isEqualToString:@"id"]) {
              objc_storeStrong((id *)&v21->_personIdentifier, v18);
            }
            else {
              [v22 setValue:v18 forKey:v16];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    id v6 = v21;
    if ([v22 count]) {
      objc_storeStrong((id *)&v21->_extraProperties, v22);
    }

    id v4 = v20;
  }

  return v6;
}

- (CPLPersonReference)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPersonReference;
  return [(CPLPersonReference *)&v3 init];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(CPLPersonReference *)self personIdentifier];
  [v4 setPersonIdentifier:v5];

  id v6 = [(CPLPersonReference *)self extraProperties];
  [v4 setExtraProperties:v6];

  return v4;
}

- (CPLPersonReference)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLPersonReference;
  v5 = [(CPLPersonReference *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personIdentifier"];
    [(CPLPersonReference *)v5 setPersonIdentifier:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extraProperties"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
      if (v8) {
        [(CPLPersonReference *)v5 setExtraProperties:v8];
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(CPLPersonReference *)self personIdentifier];
  if (v4) {
    [v7 encodeObject:v4 forKey:@"personIdentifier"];
  }
  v5 = [(CPLPersonReference *)self extraProperties];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:0];
    if (v6) {
      [v7 encodeObject:v6 forKey:@"extraProperties"];
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPLPersonReference)initWithCPLArchiver:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      objc_super v10 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v12 = v5[2];
        *(_DWORD *)buf = 138412546;
        v18 = v11;
        __int16 v19 = 2112;
        uint64_t v20 = v12;
        id v13 = v11;
        _os_log_impl(&dword_1B4CAC000, v10, OS_LOG_TYPE_ERROR, "Incorrect string for CPLPersonReference. Found %@: '%@'", buf, 0x16u);
      }
    }
    long long v14 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLArchiver.m"];
    [v14 handleFailureInMethod:a2, self, v15, 1322, @"Incorrect string for CPLPersonReference. Found %@: '%@'", objc_opt_class(), v5[2] object file lineNumber description];

    abort();
  }
  v16.receiver = self;
  v16.super_class = (Class)CPLPersonReference;
  id v6 = [(CPLPersonReference *)&v16 init];
  if (v6)
  {
    id v7 = [v5 _decodeKey:@"personIdentifier" class:objc_opt_class() inDictionary:v5[2]];
    uint64_t v8 = [v5 _decodeKey:@"extraProperties" class:objc_opt_class() inDictionary:v5[2]];
    [(CPLPersonReference *)v6 setPersonIdentifier:v7];
    [(CPLPersonReference *)v6 setExtraProperties:v8];
  }
  return v6;
}

- (id)plistArchiveWithCPLArchiver:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v6 = [(CPLPersonReference *)self personIdentifier];
  if (v6)
  {
    id v7 = [v4 _encodeKey:@"personIdentifier"];
    [v5 setObject:v6 forKeyedSubscript:v7];
  }
  uint64_t v8 = [(CPLPersonReference *)self extraProperties];
  if (v8)
  {
    id v9 = [v4 _encodeKey:@"extraProperties"];
    [v5 setObject:v8 forKeyedSubscript:v9];
  }
  return v5;
}

@end