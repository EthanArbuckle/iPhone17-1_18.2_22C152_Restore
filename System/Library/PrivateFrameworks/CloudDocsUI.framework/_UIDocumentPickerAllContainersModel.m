@interface _UIDocumentPickerAllContainersModel
- (BOOL)shouldShowTopLevelContainers;
- (_UIDocumentPickerAllContainersModel)initWithFoldersForPickableTypes:(id)a3 mode:(unint64_t)a4 sourceContainer:(id)a5;
- (_UIDocumentPickerAllContainersModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5;
- (id)_createObserver;
- (id)displayTitle;
- (id)scopes;
- (void)startMonitoringChanges;
- (void)updateScopes;
@end

@implementation _UIDocumentPickerAllContainersModel

- (_UIDocumentPickerAllContainersModel)initWithFoldersForPickableTypes:(id)a3 mode:(unint64_t)a4 sourceContainer:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_UIDocumentPickerAllContainersModel;
  v10 = [(_UIDocumentPickerURLContainerModel *)&v13 initWithURL:0 pickableTypes:a3 mode:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_sourceContainer, a5);
  }

  return v11;
}

- (_UIDocumentPickerAllContainersModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return [(_UIDocumentPickerAllContainersModel *)self initWithFoldersForPickableTypes:a4 mode:a5 sourceContainer:0];
}

- (BOOL)shouldShowTopLevelContainers
{
  return 0;
}

- (id)displayTitle
{
  return @"All containers";
}

- (id)_createObserver
{
  v3 = [_UIDocumentPickerCloudDirectoryObserver alloc];
  v4 = [(_UIDocumentPickerAllContainersModel *)self scopes];
  v5 = [(_UIDocumentPickerCloudDirectoryObserver *)v3 initWithRecursiveScopes:v4 delegate:self];

  return v5;
}

- (void)updateScopes
{
  v3 = [MEMORY[0x263F32588] documentContainers];
  v4 = [v3 valueForKey:@"identifier"];

  v5 = [MEMORY[0x263F32588] allContainersByContainerID];
  v6 = (void *)MEMORY[0x263F08A98];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  objc_super v13 = __51___UIDocumentPickerAllContainersModel_updateScopes__block_invoke;
  v14 = &unk_26492D9C8;
  id v15 = v5;
  v16 = self;
  id v7 = v5;
  v8 = [v6 predicateWithBlock:&v11];
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8, v11, v12, v13, v14);
  id v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  scopes = self->_scopes;
  self->_scopes = v9;
}

- (void)startMonitoringChanges
{
  v26[1] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)_UIDocumentPickerAllContainersModel;
  [(_UIDocumentPickerURLContainerModel *)&v24 startMonitoringChanges];
  [(_UIDocumentPickerContainerModel *)self setSortOrder:3];
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortPath" ascending:1];
  v26[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  v5 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v5 setSortDescriptors:v4];

  v6 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K UTI-CONFORMS-TO %@", *MEMORY[0x263F08358], *MEMORY[0x263F01A30]];
  id v7 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v7 setQueryPredicate:v6];

  v8 = self;
  [(_UIDocumentPickerAllContainersModel *)self updateScopes];
  id v9 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v10 = [MEMORY[0x263F32588] documentContainers];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (([v15 isInInitialState] & 1) == 0)
        {
          v16 = [[_UIDocumentPickerContainerContainerItem alloc] initWithContainer:v15];
          scopes = v8->_scopes;
          v18 = [v15 identifier];
          [(_UIDocumentPickerContainerItem *)v16 setPickable:[(NSArray *)scopes containsObject:v18]];

          [v9 addObject:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  v19 = [(_UIDocumentPickerURLContainerModel *)v8 observer];
  [v19 setStaticItems:v9];
}

- (id)scopes
{
  scopes = self->_scopes;
  if (!scopes)
  {
    [(_UIDocumentPickerAllContainersModel *)self updateScopes];
    scopes = self->_scopes;
  }

  return scopes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContainer, 0);

  objc_storeStrong((id *)&self->_scopes, 0);
}

@end