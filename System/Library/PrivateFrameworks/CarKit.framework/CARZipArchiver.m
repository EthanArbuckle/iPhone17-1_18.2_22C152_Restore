@interface CARZipArchiver
- (BOOL)archiveDirectory:(id)a3 toLocation:(id)a4;
- (BOOL)unarchive:(id)a3 toLocation:(id)a4;
@end

@implementation CARZipArchiver

- (BOOL)archiveDirectory:(id)a3 toLocation:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  BOMCopierNew();
  v7 = [MEMORY[0x1E4F1CA48] array];
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12[0] = @"createPKZip";
  v12[1] = @"enableLogging";
  v13[0] = MEMORY[0x1E4F1CC38];
  v13[1] = MEMORY[0x1E4F1CC38];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = v6;
  [v9 fileSystemRepresentation];

  id v10 = v5;
  [v10 fileSystemRepresentation];

  LODWORD(v10) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return v10 == 0;
}

- (BOOL)unarchive:(id)a3 toLocation:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  BOMCopierNew();
  v7 = [MEMORY[0x1E4F1CA48] array];
  BOMCopierSetUserData();
  BOMCopierSetCopyFileFinishedHandler();
  v12[0] = @"extractPKZip";
  v12[1] = @"enableLogging";
  v13[0] = MEMORY[0x1E4F1CC38];
  v13[1] = MEMORY[0x1E4F1CC38];
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = v6;
  [v9 fileSystemRepresentation];

  id v10 = v5;
  [v10 fileSystemRepresentation];

  LODWORD(v10) = BOMCopierCopyWithOptions();
  BOMCopierFree();

  return v10 == 0;
}

@end