@interface ISTransparentIcon
+ (BOOL)supportsSecureCoding;
+ (id)sharedInstance;
- (ISTransparentIcon)init;
- (ISTransparentIcon)initWithCoder:(id)a3;
- (id)makeResourceProvider;
@end

@implementation ISTransparentIcon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_47 != -1) {
    dispatch_once(&sharedInstance_onceToken_47, &__block_literal_global_49);
  }
  v2 = (void *)sharedInstance_sharedInstance_46;
  return v2;
}

uint64_t __35__ISTransparentIcon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_46 = objc_alloc_init(ISTransparentIcon);
  return MEMORY[0x1F41817F8]();
}

- (ISTransparentIcon)init
{
  v3 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID");
  v8.receiver = self;
  v8.super_class = (Class)ISTransparentIcon;
  v4 = [(ISConcreteIcon *)&v8 initWithDigest:v3];

  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    resourceProvider = v4->_resourceProvider;
    v4->_resourceProvider = (ISResourceProvider *)v5;
  }
  return v4;
}

- (ISTransparentIcon)initWithCoder:(id)a3
{
  v4 = +[ISTransparentIcon sharedInstance];

  return v4;
}

- (id)makeResourceProvider
{
  return self->_resourceProvider;
}

- (void).cxx_destruct
{
}

@end