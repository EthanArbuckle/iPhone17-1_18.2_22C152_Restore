@interface AVTDisabledMirroringHandler
- (AVTCoreDataCloudKitMirroringHandlerDelegate)delegate;
- (void)exportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6;
- (void)importChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6;
- (void)resetZoneWithManagedObjectContext:(id)a3 completionHandler:(id)a4;
- (void)scheduleExportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6;
- (void)scheduleImportChangesWithManagedObjectContext:(id)a3 workQueue:(id)a4 completionHandler:(id)a5;
@end

@implementation AVTDisabledMirroringHandler

- (void)scheduleImportChangesWithManagedObjectContext:(id)a3 workQueue:(id)a4 completionHandler:(id)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v10 = *MEMORY[0x263F08338];
  v11[0] = @"Disabled mirroring handler!";
  v6 = NSDictionary;
  id v7 = a5;
  v8 = [v6 dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v9 = +[AVTError errorWithCode:999 userInfo:v8];
  (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v9);
}

- (void)scheduleExportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08338];
  v12[0] = @"Disabled mirroring handler!";
  id v7 = NSDictionary;
  id v8 = a6;
  v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = +[AVTError errorWithCode:999 userInfo:v9];
  (*((void (**)(id, void, void *))a6 + 2))(v8, 0, v10);
}

- (void)importChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08338];
  v12[0] = @"Disabled mirroring handler!";
  id v7 = NSDictionary;
  id v8 = a6;
  v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = +[AVTError errorWithCode:999 userInfo:v9];
  (*((void (**)(id, void, void *))a6 + 2))(v8, 0, v10);
}

- (void)exportChangesWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 workQueue:(id)a5 completionHandler:(id)a6
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F08338];
  v12[0] = @"Disabled mirroring handler!";
  id v7 = NSDictionary;
  id v8 = a6;
  v9 = [v7 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v10 = +[AVTError errorWithCode:999 userInfo:v9];
  (*((void (**)(id, void, void *))a6 + 2))(v8, 0, v10);
}

- (AVTCoreDataCloudKitMirroringHandlerDelegate)delegate
{
  return 0;
}

- (void)resetZoneWithManagedObjectContext:(id)a3 completionHandler:(id)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F08338];
  v10[0] = @"Disabled mirroring handler!";
  v5 = NSDictionary;
  id v6 = a4;
  id v7 = [v5 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v8 = +[AVTError errorWithCode:999 userInfo:v7];
  (*((void (**)(id, void, void *))a4 + 2))(v6, 0, v8);
}

@end