@interface ELSEnvironment
+ (id)sharedInstance;
- (CKContainerID)cloudKitContainerIdentifier;
- (id)_containerIdentifierForCloudKitEnvironment:(unint64_t)a3;
- (int64_t)_containerEnvironmentForCloudKitEnvironment:(unint64_t)a3;
- (unint64_t)cloudKitEnvironment;
@end

@implementation ELSEnvironment

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_environment;
  return v2;
}

uint64_t __32__ELSEnvironment_sharedInstance__block_invoke()
{
  sharedInstance_environment = objc_alloc_init(ELSEnvironment);
  return MEMORY[0x270F9A758]();
}

- (unint64_t)cloudKitEnvironment
{
  v2 = +[ELSDefaults sharedInstance];
  unint64_t v3 = [v2 cloudKitEnvironment];

  return v3;
}

- (CKContainerID)cloudKitContainerIdentifier
{
  unint64_t v3 = [(ELSEnvironment *)self _containerIdentifierForCloudKitEnvironment:[(ELSEnvironment *)self cloudKitEnvironment]];
  int64_t v4 = [(ELSEnvironment *)self _containerEnvironmentForCloudKitEnvironment:[(ELSEnvironment *)self cloudKitEnvironment]];
  v5 = (void *)[objc_alloc(MEMORY[0x263EFD620]) initWithContainerIdentifier:v3 environment:v4];

  return (CKContainerID *)v5;
}

- (id)_containerIdentifierForCloudKitEnvironment:(unint64_t)a3
{
  if (a3 <= 2) {
    self = *off_264522FE8[a3];
  }
  return self;
}

- (int64_t)_containerEnvironmentForCloudKitEnvironment:(unint64_t)a3
{
  if (a3 - 1 >= 2) {
    return 1;
  }
  else {
    return 2;
  }
}

@end