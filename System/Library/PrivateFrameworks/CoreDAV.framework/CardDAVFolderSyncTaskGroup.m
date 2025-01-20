@interface CardDAVFolderSyncTaskGroup
- (BOOL)isInitialSync;
- (CardDAVFolderSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9 appSpecificDataItemClass:(Class)a10;
- (CardDAVFolderSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 syncItemOrder:(BOOL)a7 context:(id)a8 accountInfoProvider:(id)a9 taskManager:(id)a10 appSpecificDataItemClass:(Class)a11;
- (Class)bulkChangeTaskClass;
- (id)copyGetTaskWithURL:(id)a3;
- (id)copyMultiGetTaskWithURLs:(id)a3;
- (id)dataContentType;
- (void)applyAdditionalPropertiesFromPutTask:(id)a3;
- (void)setIsInitialSync:(BOOL)a3;
@end

@implementation CardDAVFolderSyncTaskGroup

- (CardDAVFolderSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 syncItemOrder:(BOOL)a7 context:(id)a8 accountInfoProvider:(id)a9 taskManager:(id)a10 appSpecificDataItemClass:(Class)a11
{
  v12.receiver = self;
  v12.super_class = (Class)CardDAVFolderSyncTaskGroup;
  result = [(CoreDAVContainerSyncTaskGroup *)&v12 initWithFolderURL:a3 previousCTag:a4 previousSyncToken:a5 actions:a6 syncItemOrder:a7 context:a8 accountInfoProvider:a9 taskManager:a10];
  if (result) {
    result->super._appSpecificDataItemClass = a11;
  }
  return result;
}

- (CardDAVFolderSyncTaskGroup)initWithFolderURL:(id)a3 previousCTag:(id)a4 previousSyncToken:(id)a5 actions:(id)a6 context:(id)a7 accountInfoProvider:(id)a8 taskManager:(id)a9 appSpecificDataItemClass:(Class)a10
{
  return [(CardDAVFolderSyncTaskGroup *)self initWithFolderURL:a3 previousCTag:a4 previousSyncToken:a5 actions:a6 syncItemOrder:0 context:a7 accountInfoProvider:a8 taskManager:a9 appSpecificDataItemClass:a10];
}

- (id)copyMultiGetTaskWithURLs:(id)a3
{
  id v4 = a3;
  v5 = [[CardDAVFolderMultiGetTask alloc] initWithURLs:v4 atContainerURL:self->super._folderURL appSpecificDataItemClass:self->super._appSpecificDataItemClass];

  return v5;
}

- (id)copyGetTaskWithURL:(id)a3
{
  id v3 = a3;
  id v4 = [(CoreDAVTask *)[CardDAVFolderGetTask alloc] initWithURL:v3];

  return v4;
}

- (id)dataContentType
{
  return @"text/vcard; charset=utf-8";
}

- (Class)bulkChangeTaskClass
{
  return (Class)objc_opt_class();
}

- (void)applyAdditionalPropertiesFromPutTask:(id)a3
{
  id v13 = a3;
  id v4 = [v13 responseHeaders];
  v5 = [v4 CDVObjectForKeyCaseInsensitive:@"Location"];

  if (v5)
  {
    v6 = [(CoreDAVTaskGroup *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(CoreDAVTaskGroup *)self delegate];
      v9 = [v13 url];
      int v10 = [v8 setExternalLocation:v5 forItemWithURL:v9 inFolderWithURL:self->super._folderURL];

      if (v10)
      {
        locationChangedURLs = self->super._locationChangedURLs;
        objc_super v12 = [v13 url];
        [(NSMutableSet *)locationChangedURLs addObject:v12];
      }
    }
  }
}

- (BOOL)isInitialSync
{
  return self->_isInitialSync;
}

- (void)setIsInitialSync:(BOOL)a3
{
  self->_isInitialSync = a3;
}

@end