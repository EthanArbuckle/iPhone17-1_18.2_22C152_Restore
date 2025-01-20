@interface ISGenericApplicationIcon
+ (id)sharedInstance;
- (ISGenericApplicationIcon)init;
- (ISResourceProvider)resourceProvider;
@end

@implementation ISGenericApplicationIcon

uint64_t __42__ISGenericApplicationIcon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_24 = objc_alloc_init(ISGenericApplicationIcon);
  return MEMORY[0x1F41817F8]();
}

- (ISGenericApplicationIcon)init
{
  uint64_t v2 = *MEMORY[0x1E4F22528];
  v4.receiver = self;
  v4.super_class = (Class)ISGenericApplicationIcon;
  return [(ISTypeIcon *)&v4 initWithType:v2];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25 != -1) {
    dispatch_once(&sharedInstance_onceToken_25, &__block_literal_global_27);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_24;
  return v2;
}

- (ISResourceProvider)resourceProvider
{
  resourceProvider = self->_resourceProvider;
  if (!resourceProvider)
  {
    objc_super v4 = +[ISResourceProvider defaultAppIconResourceProvider];
    v5 = self->_resourceProvider;
    self->_resourceProvider = v4;

    resourceProvider = self->_resourceProvider;
  }
  return resourceProvider;
}

- (void).cxx_destruct
{
}

@end