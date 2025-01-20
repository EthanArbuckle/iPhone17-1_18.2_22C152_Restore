@interface ICLUninstallRecord
+ (BOOL)supportsSecureCoding;
+ (id)uninstallRecordArrayToDictionary:(id)a3;
- (BOOL)hasParallelPlaceholder;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPlaceholder;
- (ICLUninstallRecord)init;
- (ICLUninstallRecord)initWithCoder:(id)a3;
- (NSDictionary)legacyDictionary;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setHasParallelPlaceholder:(BOOL)a3;
- (void)setIsPlaceholder:(BOOL)a3;
@end

@implementation ICLUninstallRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICLUninstallRecord)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICLUninstallRecord;
  return [(ICLUninstallRecord *)&v3 init];
}

- (ICLUninstallRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICLUninstallRecord;
  v5 = [(ICLUninstallRecord *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    v5->_isPlaceholder = [v4 decodeBoolForKey:@"isPlaceholder"];
    v5->_hasParallelPlaceholder = [v4 decodeBoolForKey:@"hasParallelPlaceholder"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(ICLUninstallRecord *)self bundleIdentifier];
  [v5 encodeObject:v4 forKey:@"bundleIdentifier"];

  objc_msgSend(v5, "encodeBool:forKey:", -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder"), @"isPlaceholder");
  objc_msgSend(v5, "encodeBool:forKey:", -[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"), @"hasParallelPlaceholder");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(ICLUninstallRecord *)self bundleIdentifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setBundleIdentifier:v7];

  objc_msgSend(v5, "setIsPlaceholder:", -[ICLUninstallRecord isPlaceholder](self, "isPlaceholder"));
  objc_msgSend(v5, "setHasParallelPlaceholder:", -[ICLUninstallRecord hasParallelPlaceholder](self, "hasParallelPlaceholder"));
  return v5;
}

- (NSDictionary)legacyDictionary
{
  objc_super v3 = objc_opt_new();
  id v4 = [(ICLUninstallRecord *)self bundleIdentifier];
  if (v4) {
    [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F1CFF8]];
  }

  BOOL v5 = [(ICLUninstallRecord *)self isPlaceholder];
  uint64_t v6 = MEMORY[0x1E4F1CC28];
  uint64_t v7 = MEMORY[0x1E4F1CC38];
  if (v5) {
    uint64_t v8 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v8 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v8 forKeyedSubscript:@"IsPlaceholder"];
  if ([(ICLUninstallRecord *)self hasParallelPlaceholder]) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v6;
  }
  [v3 setObject:v9 forKeyedSubscript:@"HasParallelPlaceholder"];
  v10 = (void *)[v3 copy];

  return (NSDictionary *)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICLUninstallRecord *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      uint64_t v6 = [(ICLUninstallRecord *)self bundleIdentifier];
      uint64_t v7 = [(ICLUninstallRecord *)v5 bundleIdentifier];
      BOOL v8 = MICompareObjects(v6, v7);

      if (v8)
      {
        BOOL v9 = [(ICLUninstallRecord *)self isPlaceholder];
        if (v9 == [(ICLUninstallRecord *)v5 isPlaceholder])
        {
          BOOL v12 = [(ICLUninstallRecord *)self hasParallelPlaceholder];
          if (v12 == [(ICLUninstallRecord *)v5 hasParallelPlaceholder])
          {
            BOOL v10 = 1;
            goto LABEL_14;
          }
          if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
          {
LABEL_13:
            BOOL v10 = 0;
LABEL_14:

            goto LABEL_15;
          }
        }
        else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        {
          goto LABEL_13;
        }
      }
      else if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
        goto LABEL_13;
      }
      MOLogWrite();
      goto LABEL_13;
    }
    BOOL v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(ICLUninstallRecord *)self isPlaceholder];
  BOOL v4 = [(ICLUninstallRecord *)self hasParallelPlaceholder];
  uint64_t v5 = 2;
  if (!v4) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = v5 | v3;
  uint64_t v7 = [(ICLUninstallRecord *)self bundleIdentifier];
  unint64_t v8 = [v7 hash] ^ v6;

  return v8;
}

+ (id)uninstallRecordArrayToDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "legacyDictionary", (void)v14);
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v20 count:16];
      }
      while (v7);
    }

    v18 = @"UninstalledAppInfoArray";
    v11 = (void *)[v4 copy];
    v19 = v11;
    BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (BOOL)hasParallelPlaceholder
{
  return self->_hasParallelPlaceholder;
}

- (void)setHasParallelPlaceholder:(BOOL)a3
{
  self->_hasParallelPlaceholder = a3;
}

- (void).cxx_destruct
{
}

@end