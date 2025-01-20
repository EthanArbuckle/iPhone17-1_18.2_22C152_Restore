@interface CardDAVFolderMultiGetTask
- (CardDAVFolderMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5;
@end

@implementation CardDAVFolderMultiGetTask

- (CardDAVFolderMultiGetTask)initWithURLs:(id)a3 atContainerURL:(id)a4 appSpecificDataItemClass:(Class)a5
{
  v8.receiver = self;
  v8.super_class = (Class)CardDAVFolderMultiGetTask;
  v5 = [(CoreDAVContainerMultiGetTask *)&v8 initWithURLs:a3 atContainerURL:a4 appSpecificDataItemClass:a5];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->super._appSpecificNamespace, @"urn:ietf:params:xml:ns:carddav");
    objc_storeStrong((id *)&v6->super._appSpecificMultiGetCommand, @"addressbook-multiget");
    objc_storeStrong((id *)&v6->super._appSpecificDataProp, @"address-data");
  }
  return v6;
}

@end