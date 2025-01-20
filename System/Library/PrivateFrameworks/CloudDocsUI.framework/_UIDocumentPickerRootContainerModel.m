@interface _UIDocumentPickerRootContainerModel
- (_UIDocumentPickerRootContainerModel)initWithPickableTypes:(id)a3 mode:(unint64_t)a4;
- (_UIDocumentPickerRootContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5;
- (id)_containerListDidChange;
- (void)startMonitoringChanges;
@end

@implementation _UIDocumentPickerRootContainerModel

- (_UIDocumentPickerRootContainerModel)initWithPickableTypes:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  v7 = objc_msgSend(NSURL, "ui_cloudDocsContainerURL");
  v8 = [MEMORY[0x263F32588] localizedNameForDefaultCloudDocsContainer];
  if (!v7)
  {
    v9 = [MEMORY[0x263F08850] defaultManager];
    v10 = [v9 URLForDirectory:9 inDomain:1 appropriateForURL:0 create:1 error:0];
    v7 = [v10 URLByAppendingPathComponent:@"Documents"];

    v11 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    uint64_t v12 = [v11 localizedStringForKey:@"Local documents" value:@"Local documents" table:@"Localizable"];

    v8 = (void *)v12;
  }
  v16.receiver = self;
  v16.super_class = (Class)_UIDocumentPickerRootContainerModel;
  v13 = [(_UIDocumentPickerURLContainerModel *)&v16 initWithURL:v7 pickableTypes:v6 mode:a4];
  v14 = v13;
  if (v13) {
    [(_UIDocumentPickerURLContainerModel *)v13 setDisplayTitle:v8];
  }

  return v14;
}

- (_UIDocumentPickerRootContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return [(_UIDocumentPickerRootContainerModel *)self initWithPickableTypes:a4 mode:a5];
}

- (void)startMonitoringChanges
{
  v3 = [(_UIDocumentPickerURLContainerModel *)self observer];

  if (!v3)
  {
    if (self->_isObservingContainers)
    {
      v4 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      v5 = [MEMORY[0x263F08A00] defaultCenter];
      [v5 addObserver:self selector:sel__containerListDidChange name:*MEMORY[0x263F32370] object:0];

      v4 = [(_UIDocumentPickerRootContainerModel *)self _containerListDidChange];
      self->_isObservingContainers = 1;
    }
    v8.receiver = self;
    v8.super_class = (Class)_UIDocumentPickerRootContainerModel;
    [(_UIDocumentPickerURLContainerModel *)&v8 startMonitoringChanges];
    id v6 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v4];
    v7 = [(_UIDocumentPickerURLContainerModel *)self observer];
    [v7 setStaticItems:v6];
  }
}

- (id)_containerListDidChange
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = objc_msgSend(MEMORY[0x263F32588], "documentContainers", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x263F324E8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 identifier];
        if (([v11 isEqualToString:v8] & 1) == 0 && (objc_msgSend(v10, "isInInitialState") & 1) == 0)
        {
          uint64_t v12 = [v10 documentsURL];

          if (v12)
          {
            v13 = [[_UIDocumentPickerContainerContainerItem alloc] initWithContainer:v10];
            [(_UIDocumentPickerContainerItem *)v13 setPickable:[(_UIDocumentPickerURLContainerModel *)self shouldEnableContainer:v10]];
            [v3 addObject:v13];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  v14 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v3];
  v15 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v15 setStaticItems:v14];

  return v3;
}

@end