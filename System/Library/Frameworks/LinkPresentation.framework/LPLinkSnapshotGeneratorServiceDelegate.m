@interface LPLinkSnapshotGeneratorServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
@end

@implementation LPLinkSnapshotGeneratorServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF7299B0];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v5 setClasses:v8 forSelector:sel_snapshotForMetadata_configurations_completionHandler_ argumentIndex:1 ofReply:0];

  [v4 setExportedInterface:v5];
  v9 = objc_opt_new();
  [v4 setExportedObject:v9];

  [v4 resume];
  return 1;
}

@end