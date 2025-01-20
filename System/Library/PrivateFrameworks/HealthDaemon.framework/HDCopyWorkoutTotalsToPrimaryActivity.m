@interface HDCopyWorkoutTotalsToPrimaryActivity
@end

@implementation HDCopyWorkoutTotalsToPrimaryActivity

uint64_t ___HDCopyWorkoutTotalsToPrimaryActivity_block_invoke(void *a1, uint64_t a2)
{
  uint64_t v4 = HDSQLiteColumnAsInt64();
  v5 = MEMORY[0x1C1879F80](a2, 1);
  if ([v5 isEqualToString:@"HKIndoorWorkout"])
  {
    uint64_t v6 = a1[4];
LABEL_7:
    *(void *)(*(void *)(v6 + 8) + 24) = v4;
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"HKSwimmingLocationType"])
  {
    uint64_t v6 = a1[5];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"HKLapLength"])
  {
    uint64_t v6 = a1[6];
    goto LABEL_7;
  }
LABEL_8:

  return 1;
}

BOOL ___HDCopyWorkoutTotalsToPrimaryActivity_block_invoke_587(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = MEMORY[0x1C1879F90](a2, 1);
  uint64_t v7 = HDSQLiteColumnAsInt64();
  v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v10 = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v11 = *(void *)(*(void *)(a1[7] + 8) + 24);
  id v47 = 0;
  id v12 = v8;
  uint64_t v13 = HDSQLiteColumnAsInt64();
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 3;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x2020000000;
  v62[3] = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__157;
  v60[4] = __Block_byref_object_dispose__157;
  id v61 = 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_2;
  v59[3] = &__block_descriptor_64_e23_v16__0__sqlite3_stmt__8l;
  v59[4] = v13;
  v59[5] = v9;
  v59[6] = v10;
  v59[7] = v11;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_3;
  v58[3] = &unk_1E6307E30;
  v58[4] = v63;
  v58[5] = v62;
  v58[8] = v10;
  v58[9] = v11;
  v58[6] = v60;
  v58[7] = v9;
  if ([v12 executeCachedStatementForKey:&_HDInsertPrimaryActivityForRowAndMetadata_metadataKey error:&v47 SQLGenerator:&__block_literal_global_189 bindingHandler:v59 enumerationHandler:v58])
  {
    v14 = MEMORY[0x1C1879F20](a2, 1);
    uint64_t v15 = HDSQLiteColumnAsInt64();
    double v16 = MEMORY[0x1C1879F40](a2, 3);
    double v17 = MEMORY[0x1C1879F40](a2, 4);
    double v18 = MEMORY[0x1C1879F40](a2, 5);
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_5;
    v48[3] = &unk_1E6307E58;
    id v19 = v14;
    uint64_t v53 = v13;
    uint64_t v54 = v15;
    id v49 = v19;
    v50 = v63;
    v51 = v62;
    v52 = v60;
    double v55 = v16;
    double v56 = v17;
    double v57 = v18;
    char v20 = [v12 executeCachedStatementForKey:&_HDInsertPrimaryActivityForRowAndMetadata_insertionKey error:&v47 SQLGenerator:&__block_literal_global_621 bindingHandler:v48 enumerationHandler:0];
    if (v20)
    {
      v21 = [v12 lastInsertRowID];
      uint64_t v22 = [v21 unsignedLongLongValue];
    }
    else
    {
      uint64_t v22 = 0;
    }
  }
  else
  {
    uint64_t v22 = 0;
    char v20 = 0;
  }
  _Block_object_dispose(v60, 8);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v63, 8);

  id v23 = v47;
  if (v20)
  {
    v24 = (void *)a1[4];
    id v46 = 0;
    char v25 = _HDInsertStatisticsForColumnAndDataType(a2, 6, 10, v22, v24, (uint64_t)&v46, 1.0);
    id v26 = v46;
    id v27 = v26;
    if (v25)
    {
      v28 = (void *)a1[4];
      id v45 = v26;
      char v29 = _HDInsertStatisticsForColumnAndDataType(a2, 7, 9, v22, v28, (uint64_t)&v45, 1.0);
      id v30 = v45;

      if (v29)
      {
        v31 = (void *)a1[4];
        id v44 = v30;
        char v32 = _HDInsertStatisticsForColumnAndDataType(a2, 8, 111, v22, v31, (uint64_t)&v44, 1.0);
        id v27 = v44;

        if ((v32 & 1) == 0)
        {
          v39 = @"Failed to insert statistics for swimming strokes";
          goto LABEL_16;
        }
        v33 = (void *)a1[4];
        id v43 = v27;
        char v34 = _HDInsertStatisticsForColumnAndDataType(a2, 9, 12, v22, v33, (uint64_t)&v43, 1.0);
        id v30 = v43;

        if (v34)
        {
          uint64_t v35 = _HDDistanceTypeCodeForActivityType(v7);
          v36 = (void *)a1[4];
          id v42 = v30;
          char v37 = _HDInsertStatisticsForColumnAndDataType(a2, 10, v35, v22, v36, (uint64_t)&v42, 1000.0);
          id v27 = v42;

          if (v37)
          {
            ++*(void *)(*(void *)(a1[8] + 8) + 24);
            BOOL v38 = 1;
LABEL_19:

            goto LABEL_20;
          }
          v39 = @"Failed to insert statistics for distance";
LABEL_16:
          BOOL v38 = _HDAssignWorkoutDatabaseMigrationError(a3, v39, v27, v6);
          goto LABEL_19;
        }
        v40 = @"Failed to insert statistics for flights climbed";
      }
      else
      {
        v40 = @"Failed to insert statistics for basal energy";
      }
      BOOL v38 = _HDAssignWorkoutDatabaseMigrationError(a3, v40, v30, v6);
      id v27 = v30;
      goto LABEL_19;
    }
    v39 = @"Failed to insert statistics for active energy";
    goto LABEL_16;
  }
  BOOL v38 = _HDAssignWorkoutDatabaseMigrationError(a3, @"Failed to insert primary activity", v23, v6);
LABEL_20:

  return v38;
}

@end