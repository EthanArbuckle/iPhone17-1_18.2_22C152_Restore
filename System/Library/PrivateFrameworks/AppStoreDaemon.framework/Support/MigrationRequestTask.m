@interface MigrationRequestTask
- (void)main;
@end

@implementation MigrationRequestTask

- (void)main
{
  if (self) {
    options = self->super._options;
  }
  else {
    options = 0;
  }
  v8 = options;
  v4 = sub_1003091C0();
  id v6 = [(ASDRequestOptions *)v8 migrationType];
  if (self)
  {
    id Property = objc_getProperty(self, v5, 64, 1);
    sub_100309AC0((uint64_t)v4, (uint64_t)v6, Property);

    self->super.super._success = 1;
  }
  else
  {
    sub_100309AC0((uint64_t)v4, (uint64_t)v6, 0);
  }
}

- (void).cxx_destruct
{
}

@end