@interface _UIDocumentPickerSearchContainerModel
- (BOOL)shouldShowTopLevelContainers;
- (NSString)queryString;
- (_UIDocumentPickerSearchContainerModel)initWithPickableTypes:(id)a3 mode:(unint64_t)a4;
- (_UIDocumentPickerSearchContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5;
- (id)_createObserver;
- (id)displayTitle;
- (id)scopes;
- (void)_updateObserverForQuery;
- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5;
- (void)setQueryString:(id)a3;
- (void)startMonitoringChanges;
@end

@implementation _UIDocumentPickerSearchContainerModel

- (_UIDocumentPickerSearchContainerModel)initWithPickableTypes:(id)a3 mode:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerSearchContainerModel;
  return [(_UIDocumentPickerURLContainerModel *)&v5 initWithURL:0 pickableTypes:a3 mode:a4];
}

- (_UIDocumentPickerSearchContainerModel)initWithURL:(id)a3 pickableTypes:(id)a4 mode:(unint64_t)a5
{
  return [(_UIDocumentPickerSearchContainerModel *)self initWithPickableTypes:a4 mode:a5];
}

- (BOOL)shouldShowTopLevelContainers
{
  return 0;
}

- (id)displayTitle
{
  v2 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v3 = [v2 localizedStringForKey:@"Search Results" value:@"Search Results" table:@"Localizable"];

  return v3;
}

- (void)startMonitoringChanges
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerSearchContainerModel;
  [(_UIDocumentPickerURLContainerModel *)&v3 startMonitoringChanges];
  [(_UIDocumentPickerSearchContainerModel *)self _updateObserverForQuery];
}

- (id)scopes
{
  v2 = [MEMORY[0x263F32588] documentContainers];
  objc_super v3 = [v2 valueForKey:@"identifier"];

  return v3;
}

- (id)_createObserver
{
  objc_super v3 = [_UIDocumentPickerCloudDirectoryObserver alloc];
  v4 = [(_UIDocumentPickerSearchContainerModel *)self scopes];
  objc_super v5 = [(_UIDocumentPickerCloudDirectoryObserver *)v3 initWithRecursiveScopes:v4 delegate:self];

  return v5;
}

- (void)setQueryString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_queryString, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    queryString = self->_queryString;
    self->_queryString = v4;

    if ([(NSString *)self->_queryString length]) {
      [(_UIDocumentPickerSearchContainerModel *)self startMonitoringChanges];
    }
  }
}

- (void)arrayController:(id)a3 modelChanged:(id)a4 differences:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentPickerSearchContainerModel;
  [(_UIDocumentPickerURLContainerModel *)&v7 arrayController:a3 modelChanged:a4 differences:a5];
  if (![(NSString *)self->_queryString length])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __82___UIDocumentPickerSearchContainerModel_arrayController_modelChanged_differences___block_invoke;
    block[3] = &unk_26492CC78;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

- (void)_updateObserverForQuery
{
  NSUInteger v3 = [(NSString *)self->_queryString length];
  v4 = (void *)MEMORY[0x263F08A98];
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x263F08360];
    queryString = self->_queryString;
    objc_super v7 = NSString;
    v8 = [MEMORY[0x263F08AE8] escapedPatternForString:queryString];
    v9 = [v7 stringWithFormat:@"*%@*", v8];
    id v11 = [v4 predicateWithFormat:@"%K BEGINSWITH[cd] %@ OR %K LIKE[cd] %@", v5, queryString, v5, v9];
  }
  else
  {
    id v11 = [MEMORY[0x263F08A98] predicateWithValue:0];
  }
  v10 = [(_UIDocumentPickerURLContainerModel *)self observer];
  [v10 setQueryPredicate:v11];
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void).cxx_destruct
{
}

@end