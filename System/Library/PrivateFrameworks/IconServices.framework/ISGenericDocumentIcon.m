@interface ISGenericDocumentIcon
+ (id)sharedInstance;
- (ISGenericDocumentIcon)init;
@end

@implementation ISGenericDocumentIcon

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_15 != -1) {
    dispatch_once(&sharedInstance_onceToken_15, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance_sharedInstance_14;
  return v2;
}

uint64_t __39__ISGenericDocumentIcon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_14 = objc_alloc_init(ISGenericDocumentIcon);
  return MEMORY[0x1F41817F8]();
}

- (ISGenericDocumentIcon)init
{
  uint64_t v2 = *MEMORY[0x1E4F22590];
  v4.receiver = self;
  v4.super_class = (Class)ISGenericDocumentIcon;
  return [(ISTypeIcon *)&v4 initWithType:v2];
}

@end