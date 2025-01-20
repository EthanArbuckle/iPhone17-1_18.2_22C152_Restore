@interface AXNPSWrapper
+ (void)synchronizeNanoDomain:(id)a3 keys:(id)a4;
- (AXNPSWrapper)initWithDomain:(id)a3;
- (NPSDomainAccessor)wrapped;
- (id)objectForKey:(id)a3;
- (id)synchronize;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setWrapped:(id)a3;
@end

@implementation AXNPSWrapper

+ (void)synchronizeNanoDomain:(id)a3 keys:(id)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F79CE0];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 synchronizeNanoDomain:v7 keys:v6];
}

- (AXNPSWrapper)initWithDomain:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXNPSWrapper;
  v5 = [(AXNPSWrapper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F79CD8]) initWithDomain:v4];
    wrapped = v5->_wrapped;
    v5->_wrapped = (NPSDomainAccessor *)v6;
  }
  return v5;
}

- (id)synchronize
{
  return (id)[(NPSDomainAccessor *)self->_wrapped synchronize];
}

- (id)objectForKey:(id)a3
{
  return (id)[(NPSDomainAccessor *)self->_wrapped objectForKey:a3];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
}

- (NPSDomainAccessor)wrapped
{
  return self->_wrapped;
}

- (void)setWrapped:(id)a3
{
}

- (void).cxx_destruct
{
}

@end