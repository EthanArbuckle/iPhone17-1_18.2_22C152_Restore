@interface CDXRetrieveFirstIdentificationEntriesOperationExtensionsDataSource
- (id)installedExtensionWithIdentifier:(id)a3 error:(id *)a4;
@end

@implementation CDXRetrieveFirstIdentificationEntriesOperationExtensionsDataSource

- (id)installedExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  return +[NSExtension extensionWithIdentifier:a3 error:a4];
}

@end