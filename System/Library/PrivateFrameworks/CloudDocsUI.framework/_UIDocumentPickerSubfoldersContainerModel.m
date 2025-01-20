@interface _UIDocumentPickerSubfoldersContainerModel
- (BOOL)shouldShowTopLevelContainers;
- (_UIDocumentPickerSubfoldersContainerModel)initWithPickableTypes:(id)a3 container:(id)a4;
- (_UIDocumentPickerSubfoldersContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5;
- (id)_createObserver;
- (id)displayTitle;
- (id)scopes;
- (void)startMonitoringChanges;
@end

@implementation _UIDocumentPickerSubfoldersContainerModel

- (_UIDocumentPickerSubfoldersContainerModel)initWithPickableTypes:(id)a3 container:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIDocumentPickerSubfoldersContainerModel;
  v8 = [(_UIDocumentPickerURLContainerModel *)&v11 initWithURL:0 pickableTypes:a3 mode:1];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_containerID, a4);
  }

  return v9;
}

- (_UIDocumentPickerSubfoldersContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return -[_UIDocumentPickerSubfoldersContainerModel initWithPickableTypes:container:](self, "initWithPickableTypes:container:", a4, 0, a5);
}

- (BOOL)shouldShowTopLevelContainers
{
  return 0;
}

- (id)displayTitle
{
  return (id)[NSString stringWithFormat:@"Subfolders of %@", self->_containerID];
}

- (id)_createObserver
{
  v3 = [_UIDocumentPickerCloudDirectoryObserver alloc];
  v4 = [(_UIDocumentPickerSubfoldersContainerModel *)self scopes];
  v5 = [(_UIDocumentPickerCloudDirectoryObserver *)v3 initWithRecursiveScopes:v4 delegate:self];

  return v5;
}

- (void)startMonitoringChanges
{
  v15[1] = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)_UIDocumentPickerSubfoldersContainerModel;
  [(_UIDocumentPickerURLContainerModel *)&v14 startMonitoringChanges];
  v3 = [MEMORY[0x263F32588] allContainersByContainerID];
  v4 = [v3 objectForKeyedSubscript:self->_containerID];

  v5 = (void *)MEMORY[0x263EFF9D8];
  v6 = [[_UIDocumentPickerContainerContainerItem alloc] initWithContainer:v4];
  id v7 = [v5 orderedSetWithObject:v6];
  v8 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v8 setStaticItems:v7];

  [(_UIDocumentPickerContainerModel *)self setSortOrder:3];
  v9 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"sortPath" ascending:1];
  v15[0] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  objc_super v11 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v11 setSortDescriptors:v10];

  v12 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K UTI-CONFORMS-TO %@", *MEMORY[0x263F08358], *MEMORY[0x263F01A30]];
  v13 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v13 setQueryPredicate:v12];
}

- (id)scopes
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self->_containerID;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

- (void).cxx_destruct
{
}

@end