@interface HDStaticSyncControlServer
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)remote_runStaticSyncExportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 batchSize:(unint64_t)a6 completion:(id)a7;
- (id)remote_runStaticSyncImportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 completion:(id)a6;
@end

@implementation HDStaticSyncControlServer

- (id)remote_runStaticSyncExportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 batchSize:(unint64_t)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  v15 = [HDStaticSyncExportTask alloc];
  v16 = [(HDStandardTaskServer *)self profile];
  v17 = [(HDStaticSyncExportTask *)v15 initWithProfile:v16 options:a3 storeIdentifier:v14 URL:v13 batchSize:a6];

  v18 = [(HDStaticSyncExportTask *)v17 runWithCompletion:v12];

  return v18;
}

- (id)remote_runStaticSyncImportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [HDStaticSyncImportTask alloc];
  id v14 = [(HDStandardTaskServer *)self profile];
  v15 = [(HDStaticSyncImportTask *)v13 initWithProfile:v14 options:a3 storeIdentifier:v12 URL:v11];

  v16 = [(HDStaticSyncImportTask *)v15 runWithCompletion:v10];

  return v16;
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7FA0](self, a2);
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7F98](self, a2);
}

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2B5A8] taskIdentifier];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

@end