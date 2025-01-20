@interface CAFRequestKey
+ (id)requestKeyForCharacteristic:(id)a3;
+ (id)requestKeyForControl:(id)a3;
- (BOOL)isEqual:(id)a3;
- (CAFCachedDescription)cachedDescription;
- (CAFRequestKey)initWithPriority:(id)a3 pluginID:(id)a4;
- (NSNumber)pluginID;
- (NSNumber)priority;
- (NSString)description;
- (id)copyWithPriority:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currentDescriptionForCache:(id)a3;
- (unint64_t)hash;
@end

@implementation CAFRequestKey

+ (id)requestKeyForCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 priority];
  v7 = [v4 pluginID];

  v8 = (void *)[v5 initWithPriority:v6 pluginID:v7];
  return v8;
}

+ (id)requestKeyForControl:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = [v4 priority];
  v7 = [v4 pluginID];

  v8 = (void *)[v5 initWithPriority:v6 pluginID:v7];
  return v8;
}

- (CAFRequestKey)initWithPriority:(id)a3 pluginID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CAFRequestKey;
  v9 = [(CAFRequestKey *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_priority, a3);
    objc_storeStrong((id *)&v10->_pluginID, a4);
    v11 = [[CAFCachedDescription alloc] initWithCacheable:v10];
    cachedDescription = v10->_cachedDescription;
    v10->_cachedDescription = v11;
  }
  return v10;
}

- (NSString)description
{
  v2 = [(CAFRequestKey *)self cachedDescription];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (id)copyWithPriority:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  v6 = [(CAFRequestKey *)self pluginID];
  id v7 = (void *)[v5 initWithPriority:v4 pluginID:v6];

  return v7;
}

- (id)currentDescriptionForCache:(id)a3
{
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  v6 = [(CAFRequestKey *)self priority];
  id v7 = [(CAFRequestKey *)self pluginID];
  id v8 = [v4 stringWithFormat:@"<%@: %p priority: %@ plugin=%@ >", v5, self, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(CAFRequestKey *)self priority];
  v6 = [(CAFRequestKey *)self pluginID];
  id v7 = (void *)[v4 initWithPriority:v5 pluginID:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CAFRequestKey *)a3;
  if (v4 != self)
  {
    objc_opt_class();
    uint64_t v5 = v4;
    if (v5)
    {
      if (objc_opt_isKindOfClass())
      {
        v6 = [(CAFRequestKey *)self priority];
        id v7 = [(CAFRequestKey *)v5 priority];

        if (v6 != v7)
        {
          char v8 = 0;
LABEL_11:

          goto LABEL_12;
        }
        v9 = [(CAFRequestKey *)self pluginID];
        v10 = [(CAFRequestKey *)v5 pluginID];
        char v8 = [v9 isEqual:v10];
      }
      else
      {
        char v8 = 0;
        v9 = v5;
        uint64_t v5 = 0;
      }
    }
    else
    {
      char v8 = 0;
      v9 = 0;
    }

    goto LABEL_11;
  }
  char v8 = 1;
LABEL_12:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(CAFRequestKey *)self pluginID];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (NSNumber)pluginID
{
  return self->_pluginID;
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);
  objc_storeStrong((id *)&self->_priority, 0);
}

@end