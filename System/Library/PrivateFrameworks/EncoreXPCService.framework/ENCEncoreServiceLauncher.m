@interface ENCEncoreServiceLauncher
- (ENCEncoreServiceLauncher)init;
- (EncoreService)encoreService;
@end

@implementation ENCEncoreServiceLauncher

- (ENCEncoreServiceLauncher)init
{
  v6.receiver = self;
  v6.super_class = (Class)ENCEncoreServiceLauncher;
  v2 = [(ENCEncoreServiceLauncher *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[EncoreService service];
    encoreService = v2->_encoreService;
    v2->_encoreService = (EncoreService *)v3;
  }
  return v2;
}

- (EncoreService)encoreService
{
  return self->_encoreService;
}

- (void).cxx_destruct
{
}

@end