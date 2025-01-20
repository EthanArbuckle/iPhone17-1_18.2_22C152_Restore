@interface HDOntologyMedsScanningResourcesImporter
+ (BOOL)_deleteVisionAssetWithShardRegistry:(id)a3 reason:(id)a4 error:(id *)a5;
+ (BOOL)_validateVisionAssetIntegrity:(id)a3 error:(id *)a4;
+ (BOOL)canImportEntry:(id)a3;
+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5;
+ (id)_visionAssetPathWithRegistry:(id)a3;
+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6;
+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6;
+ (int64_t)purgeSpaceForUrgency:(int)a3 shardRegistry:(id)a4;
+ (int64_t)purgeableSpaceForUrgency:(int)a3 shardRegistry:(id)a4;
@end

@implementation HDOntologyMedsScanningResourcesImporter

+ (BOOL)canImportEntry:(id)a3
{
  id v3 = a3;
  v4 = [v3 schemaType];
  uint64_t v5 = *MEMORY[0x1E4F2A2F0];
  if (v4 == (void *)*MEMORY[0x1E4F2A2F0])
  {
    LOBYTE(v5) = [v3 schemaVersion] == 2;
  }
  else if (v5)
  {
    v6 = [v3 schemaType];
    if ([v6 isEqualToString:v5]) {
      LOBYTE(v5) = [v3 schemaVersion] == 2;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 canImportEntry:v8])
  {
    v10 = [a1 _visionAssetPathWithRegistry:v9];
    id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    if ([v11 fileExistsAtPath:v10]
      && ![v11 removeItemAtPath:v10 error:a5])
    {
      goto LABEL_8;
    }
    v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    int v13 = [v11 createDirectoryAtURL:v12 withIntermediateDirectories:1 attributes:0 error:a5];

    if (!v13) {
      goto LABEL_8;
    }
    v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
    int v15 = [v9 unzipStagedShardFileForEntry:v8 toURL:v14 error:a5];

    if (v15) {
      char v16 = [a1 _validateVisionAssetIntegrity:v10 error:a5];
    }
    else {
LABEL_8:
    }
      char v16 = 0;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = objc_opt_class();
    v10 = [v8 schemaType];
    objc_msgSend(v17, "hk_assignError:code:format:", a5, 3, @"%@ cannot import entry with schema type (%@, %ld)", v18, v10, objc_msgSend(v8, "schemaVersion"));
    char v16 = 0;
  }

  return v16;
}

+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_6, a4, a5, a6);
}

uint64_t __88__HDOntologyMedsScanningResourcesImporter_willPruneEntries_options_shardRegistry_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 desiredState] == 3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    v4 = [v2 schemaType];
    uint64_t v3 = [v4 isEqualToString:*MEMORY[0x1E4F2A2F0]];
  }
  return v3;
}

+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  id v9 = a3;
  if ([a1 _deleteVisionAssetWithShardRegistry:a5 reason:@"Prune request" error:a6])id v10 = v9; {
  else
  }
    id v10 = 0;

  return v10;
}

+ (int64_t)purgeableSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 != 4) {
    return 0;
  }
  uint64_t v5 = [a1 _visionAssetPathWithRegistry:a4];
  v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  id v13 = 0;
  v7 = objc_msgSend(v6, "hk_fileSizeWithError:", &v13);
  id v8 = v13;
  id v9 = v8;
  if (v7 || (objc_msgSend(v8, "hk_isCocoaNoSuchFileError") & 1) != 0)
  {
    int64_t v10 = [v7 longLongValue];
  }
  else
  {
    _HKInitializeLogging();
    v12 = HKLogMedication();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v15 = a1;
      __int16 v16 = 2114;
      v17 = v5;
      __int16 v18 = 2114;
      v19 = v9;
      _os_log_error_impl(&dword_1BD54A000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Error getting size of '%{public}@': %{public}@", buf, 0x20u);
    }

    int64_t v10 = 0;
  }

  return v10;
}

+ (int64_t)purgeSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [a1 purgeableSpaceForUrgency:v4 shardRegistry:v6];
  if (v7 < 1)
  {
    int64_t v9 = 0;
  }
  else
  {
    int64_t v8 = v7;
    if ([a1 _deleteVisionAssetWithShardRegistry:v6 reason:@"Max Cache Delete Urgency" error:0])int64_t v9 = v8; {
    else
    }
      int64_t v9 = 0;
  }

  return v9;
}

+ (id)_visionAssetPathWithRegistry:(id)a3
{
  uint64_t v3 = [a3 daemon];
  uint64_t v4 = [v3 healthDirectoryPath];

  uint64_t v5 = [v4 stringByAppendingPathComponent:@"vision"];

  return v5;
}

+ (BOOL)_validateVisionAssetIntegrity:(id)a3 error:(id *)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28CB8];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  int64_t v8 = [v7 contentsOfDirectoryAtPath:v6 error:a4];

  if (v8)
  {
    int64_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F17FC618];
    int64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
    char v11 = [v9 isSubsetOfSet:v10];
    if ((v11 & 1) == 0)
    {
      v12 = objc_msgSend(v9, "hk_minus:", v10);
      id v13 = [v12 allObjects];
      v14 = [v13 componentsJoinedByString:@" - "];

      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 106, @"Vision asset missing required file: %@", v14);
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (BOOL)_deleteVisionAssetWithShardRegistry:(id)a3 reason:(id)a4 error:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int64_t v9 = [a1 _visionAssetPathWithRegistry:a3];
  id v10 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  _HKInitializeLogging();
  char v11 = HKLogMedication();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v21 = a1;
    __int16 v22 = 2114;
    v23 = v9;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl(&dword_1BD54A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Removing asset directory '%{public}@' for \"%{public}@\"", buf, 0x20u);
  }

  id v19 = 0;
  char v12 = [v10 removeItemAtPath:v9 error:&v19];
  id v13 = v19;
  v14 = v13;
  if (v12 & 1) != 0 || (objc_msgSend(v13, "hk_isCocoaNoSuchFileError"))
  {
    BOOL v15 = 1;
  }
  else
  {
    _HKInitializeLogging();
    __int16 v16 = HKLogMedication();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      id v21 = a1;
      __int16 v22 = 2114;
      v23 = v9;
      __int16 v24 = 2114;
      id v25 = v8;
      __int16 v26 = 2114;
      v27 = v14;
      _os_log_error_impl(&dword_1BD54A000, v16, OS_LOG_TYPE_ERROR, "%{public}@: Error removing asset directory for \"%{public}@\" '%{public}@': %{public}@", buf, 0x2Au);
    }

    id v17 = v14;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v15 = 0;
  }

  return v15;
}

@end