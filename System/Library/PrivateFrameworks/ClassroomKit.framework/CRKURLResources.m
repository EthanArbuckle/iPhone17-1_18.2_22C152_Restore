@interface CRKURLResources
- (CRKURLResources)init;
- (CRKURLResources)initWithResources:(id)a3;
- (NSDate)lastModificationDate;
- (NSMutableDictionary)resources;
- (NSNumber)documentIdentifier;
- (NSNumber)isDirectory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)immutableResources;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)mutableResources;
- (id)underlyingResources;
- (unint64_t)size;
@end

@implementation CRKURLResources

- (CRKURLResources)init
{
  return [(CRKURLResources *)self initWithResources:MEMORY[0x263EFFA78]];
}

- (CRKURLResources)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKURLResources;
  v5 = [(CRKURLResources *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    resources = v5->_resources;
    v5->_resources = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (id)underlyingResources
{
  v2 = [(CRKURLResources *)self resources];
  v3 = (void *)[v2 copy];

  return v3;
}

- (NSNumber)isDirectory
{
  v2 = [(CRKURLResources *)self resources];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFF6A8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (NSNumber)documentIdentifier
{
  v2 = [(CRKURLResources *)self resources];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFF620]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (NSDate)lastModificationDate
{
  v2 = [(CRKURLResources *)self resources];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFF5F8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (unint64_t)size
{
  v2 = [(CRKURLResources *)self resources];
  v3 = [v2 objectForKeyedSubscript:*MEMORY[0x263EFF688]];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  unint64_t v6 = [v5 unsignedLongValue];
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CRKURLResources alloc];
  id v5 = [(CRKURLResources *)self resources];
  unint64_t v6 = [(CRKURLResources *)v4 initWithResources:v5];

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CRKMutableURLResources alloc];
  id v5 = [(CRKURLResources *)self resources];
  unint64_t v6 = [(CRKURLResources *)v4 initWithResources:v5];

  return v6;
}

- (id)immutableResources
{
  v2 = (void *)[(CRKURLResources *)self copy];

  return v2;
}

- (id)mutableResources
{
  v2 = (void *)[(CRKURLResources *)self mutableCopy];

  return v2;
}

- (NSMutableDictionary)resources
{
  return self->_resources;
}

- (void).cxx_destruct
{
}

@end