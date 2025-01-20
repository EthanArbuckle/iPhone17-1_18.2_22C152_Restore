@interface SGSchemaOrgKey
+ (BOOL)isSupportedEntityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSchemaOrgKey:(id)a3;
- (NSString)description;
- (SGSchemaOrgKey)init;
- (SGSchemaOrgKey)initWithSerialized:(id)a3;
- (id)serialize;
- (unint64_t)hash;
@end

@implementation SGSchemaOrgKey

- (void).cxx_destruct
{
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGSchemaOrgKey uuid:%@>", self->_uuid];
  return (NSString *)v2;
}

- (unint64_t)hash
{
  return [(NSString *)self->_uuid hash];
}

- (BOOL)isEqualToSchemaOrgKey:(id)a3
{
  v4 = (SGSchemaOrgKey *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    v5 = self->_uuid;
    v6 = v5;
    if (v5 == v4->_uuid) {
      char v7 = 1;
    }
    else {
      char v7 = -[NSString isEqual:](v5, "isEqual:");
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGSchemaOrgKey *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSchemaOrgKey *)self isEqualToSchemaOrgKey:v5];

  return v6;
}

- (SGSchemaOrgKey)initWithSerialized:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGSchemaOrgKey;
  BOOL v6 = [(SGSchemaOrgKey *)&v9 init];
  char v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_uuid, a3);
  }

  return v7;
}

- (SGSchemaOrgKey)init
{
  v8.receiver = self;
  v8.super_class = (Class)SGSchemaOrgKey;
  v2 = [(SGSchemaOrgKey *)&v8 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1CB79B230]();
    v4 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v5 = [v4 UUIDString];

    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v5;
  }
  return v2;
}

- (id)serialize
{
  return self->_uuid;
}

+ (BOOL)isSupportedEntityType:(int64_t)a3
{
  return a3 == 17;
}

@end