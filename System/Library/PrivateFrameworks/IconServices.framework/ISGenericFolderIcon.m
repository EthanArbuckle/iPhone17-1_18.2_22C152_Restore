@interface ISGenericFolderIcon
+ (id)sharedInstance;
- (ISGenericFolderIcon)init;
- (ISResourceProvider)resourceProvider;
@end

@implementation ISGenericFolderIcon

uint64_t __37__ISGenericFolderIcon_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_0 = objc_alloc_init(ISGenericFolderIcon);
  return MEMORY[0x1F41817F8]();
}

- (ISGenericFolderIcon)init
{
  uint64_t v2 = *MEMORY[0x1E4F225C8];
  v4.receiver = self;
  v4.super_class = (Class)ISGenericFolderIcon;
  return [(ISTypeIcon *)&v4 initWithType:v2];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_8);
  }
  uint64_t v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

- (ISResourceProvider)resourceProvider
{
  resourceProvider = self->_resourceProvider;
  if (!resourceProvider)
  {
    objc_super v4 = [MEMORY[0x1E4F22490] typeRecordWithIdentifier:*MEMORY[0x1E4F225C8]];
    v5 = [[ISRecordResourceProvider alloc] initWithRecord:v4 options:0];
    v6 = self->_resourceProvider;
    self->_resourceProvider = &v5->super;

    v7 = objc_alloc_init(ISGenericRecipe);
    [(ISResourceProvider *)self->_resourceProvider setSuggestedRecipe:v7];

    resourceProvider = self->_resourceProvider;
  }
  return resourceProvider;
}

- (void).cxx_destruct
{
}

@end