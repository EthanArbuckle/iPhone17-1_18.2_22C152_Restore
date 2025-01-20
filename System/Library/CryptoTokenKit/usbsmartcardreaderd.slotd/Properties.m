@interface Properties
- (Properties)initWithService:(id)a3;
- (id)get:(id)a3;
@end

@implementation Properties

- (Properties)initWithService:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Properties;
  v6 = [(Properties *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ioService, a3);
  }

  return v7;
}

- (id)get:(id)a3
{
  ioService = self->_ioService;
  v4 = (__CFString *)a3;
  CFProperty = (void *)IORegistryEntryCreateCFProperty([(IOKitObjectHolder *)ioService holder], v4, kCFAllocatorDefault, 1u);

  return CFProperty;
}

- (void).cxx_destruct
{
}

@end