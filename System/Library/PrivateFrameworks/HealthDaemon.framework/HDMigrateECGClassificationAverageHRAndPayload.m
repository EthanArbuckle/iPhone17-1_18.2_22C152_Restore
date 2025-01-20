@interface HDMigrateECGClassificationAverageHRAndPayload
@end

@implementation HDMigrateECGClassificationAverageHRAndPayload

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v111 = *MEMORY[0x1E4F143B8];
  uint64_t v61 = HDSQLiteColumnAsInt64();
  v59 = MEMORY[0x1C1879F20](a2, 1);
  double v4 = MEMORY[0x1C1879F40](a2, 2);
  uint64_t v58 = HDSQLiteColumnAsInt64();
  double v5 = MEMORY[0x1C1879F40](a2, 4);
  double v6 = MEMORY[0x1C1879F40](a2, 5);
  v60 = MEMORY[0x1C1879F20](a2, 6);
  if (MEMORY[0x1C1879FC0](a2, 7)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = HDSQLiteColumnAsInt64();
  }
  char v8 = MEMORY[0x1C1879FC0](a2, 8);
  double v9 = MEMORY[0x1C1879F40](a2, 8);
  int v10 = MEMORY[0x1C1879FC0](a2, 9);
  uint64_t v11 = HDSQLiteColumnAsInt64();
  v12 = [*(id *)(a1 + 32) protectedDatabase];
  uint64_t v13 = *(void *)(a1 + 40);
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_2;
  v76[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v76[4] = v61;
  int v14 = [v12 executeSQL:v13 error:a3 bindingHandler:v76 enumerationHandler:0];

  if (v14)
  {
    if (v11 > 1) {
      int v15 = 1;
    }
    else {
      int v15 = v10;
    }
    if (v15) {
      uint64_t v16 = 2;
    }
    else {
      uint64_t v16 = v11;
    }
    v17 = [*(id *)(a1 + 32) protectedDatabase];
    uint64_t v18 = *(void *)(a1 + 48);
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_3;
    v69[3] = &unk_1E6300FB0;
    uint64_t v71 = v61;
    id v70 = v60;
    uint64_t v72 = v7;
    char v75 = v8 ^ 1;
    double v73 = v9;
    uint64_t v74 = v16;
    int v19 = [v17 executeSQL:v18 error:a3 bindingHandler:v69 enumerationHandler:0];

    if (v19)
    {
      if (v11) {
        char v20 = v10;
      }
      else {
        char v20 = 1;
      }
      if (v20) {
        goto LABEL_69;
      }
      id v66 = *(id *)(a1 + 32);
      id v65 = v59;
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      uint64_t v22 = [&unk_1F17E99A8 countByEnumeratingWithState:&v106 objects:v110 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v107;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v107 != v23) {
              objc_enumerationMutation(&unk_1F17E99A8);
            }
            v25 = *(void **)(*((void *)&v106 + 1) + 8 * i);
            uint64_t v26 = [v25 integerValue];
            switch(v26)
            {
              case 201:
                if ((v11 & 0x80) != 0) {
                  goto LABEL_38;
                }
                break;
              case 202:
                if ((v11 & 0x200) != 0) {
                  goto LABEL_38;
                }
                break;
              case 203:
              case 208:
              case 209:
              case 210:
                continue;
              case 204:
                if ((v11 & 0x100) != 0) {
                  goto LABEL_38;
                }
                break;
              case 205:
                if ((v11 & 2) != 0) {
                  goto LABEL_38;
                }
                break;
              case 206:
                if ((v11 & 0x10) != 0) {
                  goto LABEL_38;
                }
                break;
              case 207:
                if ((v11 & 4) != 0) {
                  goto LABEL_38;
                }
                break;
              case 211:
                if ((v11 & 0x40) != 0) {
                  goto LABEL_38;
                }
                break;
              default:
                if (v26 == 167 && (v11 & 8) != 0) {
LABEL_38:
                }
                  [v21 setObject:&unk_1F17ED260 forKeyedSubscript:v25];
                break;
            }
          }
          uint64_t v22 = [&unk_1F17E99A8 countByEnumeratingWithState:&v106 objects:v110 count:16];
        }
        while (v22);
      }
      long long v106 = 0u;
      long long v107 = 0u;
      long long v108 = 0u;
      long long v109 = 0u;
      id obj = v21;
      uint64_t v27 = [obj countByEnumeratingWithState:&v106 objects:v110 count:16];
      if (v27)
      {
        uint64_t v64 = *(void *)v107;
        v56 = v88;
        v57 = v94;
        v54 = v78;
        v55 = v83;
LABEL_43:
        uint64_t v28 = 0;
        while (1)
        {
          if (*(void *)v107 != v64) {
            objc_enumerationMutation(obj);
          }
          v29 = *(void **)(*((void *)&v106 + 1) + 8 * v28);
          char v105 = 0;
          char v105 = objc_msgSend(v29, "integerValue", v54, v55, v56, v57);
          v30 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v105 length:1];
          v31 = objc_msgSend(MEMORY[0x1E4F29128], "hk_v3UUIDWithNameSpace:name:", v65, v30);
          uint64_t v101 = 0;
          v102 = &v101;
          uint64_t v103 = 0x2020000000;
          uint64_t v104 = 0;
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke;
          aBlock[3] = &unk_1E62F3640;
          aBlock[4] = &v101;
          v32 = _Block_copy(aBlock);
          v33 = [v66 protectedDatabase];
          v98[0] = MEMORY[0x1E4F143A8];
          v98[1] = 3221225472;
          v98[2] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_2;
          v98[3] = &unk_1E62F43C8;
          id v34 = v31;
          id v99 = v34;
          char v35 = [v33 executeSQL:@"SELECT COUNT(*) FROM objects WHERE uuid=?" error:a3 bindingHandler:v98 enumerationHandler:v32];

          if (v35)
          {
            if (v102[3] <= 0)
            {
              v37 = [v66 protectedDatabase];
              v93[0] = MEMORY[0x1E4F143A8];
              v93[1] = 3221225472;
              v94[0] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_3;
              v94[1] = &unk_1E62F3618;
              id v95 = v34;
              uint64_t v96 = v58;
              double v97 = v4;
              char v38 = [v37 executeSQL:@"INSERT INTO objects (uuid, provenance, creation_date) VALUES (?, ?, ?)", a3, v93, 0 error bindingHandler enumerationHandler];

              v39 = [v66 protectedDatabase];
              v40 = [v39 lastInsertRowID];

              char v41 = v40 ? v38 : 0;
              if (v41)
              {
                v42 = [v66 protectedDatabase];
                v87[0] = MEMORY[0x1E4F143A8];
                v87[1] = 3221225472;
                v88[0] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_4;
                v88[1] = &unk_1E6301000;
                id v43 = v40;
                double v91 = v5;
                double v92 = v6;
                id v89 = v43;
                v90 = v29;
                char v44 = [v42 executeSQL:@"INSERT INTO samples (data_id, start_date, end_date, data_type) VALUES (?, ?, ?, ?)", a3, v87, 0 error bindingHandler enumerationHandler];

                if (v44)
                {
                  v45 = [v66 protectedDatabase];
                  v82[0] = MEMORY[0x1E4F143A8];
                  v82[1] = 3221225472;
                  v83[0] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_5;
                  v83[1] = &unk_1E62F2DF0;
                  id v46 = v43;
                  id v84 = v46;
                  id v85 = obj;
                  v86 = v29;
                  char v47 = [v45 executeSQL:@"INSERT INTO category_samples (data_id, value) VALUES (?, ?)", a3, v82, 0 error bindingHandler enumerationHandler];

                  if (v47)
                  {
                    v48 = [v66 protectedDatabase];
                    v77[0] = MEMORY[0x1E4F143A8];
                    v77[1] = 3221225472;
                    v78[0] = ___HDInsertECGSymptomsAndCreateAssociationWithECGSamples_block_invoke_6;
                    v78[1] = &unk_1E62F3618;
                    uint64_t v80 = v61;
                    id v79 = v46;
                    uint64_t v81 = v58;
                    int v49 = [v48 executeSQL:@"INSERT INTO correlations (correlation, object, provenance) VALUES (?, ?, ?)", a3, v77, 0 error bindingHandler enumerationHandler];

                    int v36 = v49 ^ 1;
                  }
                  else
                  {
                    int v36 = 1;
                  }
                }
                else
                {
                  int v36 = 1;
                }
              }
              else
              {
                int v36 = 1;
              }
            }
            else
            {
              int v36 = 3;
            }
          }
          else
          {
            int v36 = 1;
          }

          _Block_object_dispose(&v101, 8);
          if (v36 != 3)
          {
            if (v36) {
              break;
            }
          }
          if (v27 == ++v28)
          {
            uint64_t v27 = [obj countByEnumeratingWithState:&v106 objects:v110 count:16];
            if (v27) {
              goto LABEL_43;
            }
            goto LABEL_67;
          }
        }
      }
      else
      {
LABEL_67:
        int v36 = 0;
      }

      uint64_t v50 = v36 == 0;
      if (v50)
      {
LABEL_69:
        v51 = [*(id *)(a1 + 32) protectedDatabase];
        uint64_t v52 = *(void *)(a1 + 56);
        v68[0] = MEMORY[0x1E4F143A8];
        v68[1] = 3221225472;
        v68[2] = ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_4;
        v68[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
        v68[4] = v61;
        uint64_t v50 = [v51 executeSQL:v52 error:a3 bindingHandler:v68 enumerationHandler:0];
      }
    }
    else
    {
      uint64_t v50 = 0;
    }
  }
  else
  {
    uint64_t v50 = 0;
  }

  return v50;
}

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(void *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 32) bytes];
  if (v4) {
    double v5 = (const char *)v4;
  }
  else {
    double v5 = "";
  }
  sqlite3_bind_blob(a2, 2, v5, [*(id *)(a1 + 32) length], (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  sqlite3_bind_int64(a2, 3, *(void *)(a1 + 48));
  if (*(unsigned char *)(a1 + 72)) {
    sqlite3_bind_double(a2, 4, *(double *)(a1 + 56));
  }
  else {
    sqlite3_bind_null(a2, 4);
  }
  sqlite3_int64 v6 = *(void *)(a1 + 64);

  return sqlite3_bind_int64(a2, 5, v6);
}

uint64_t ___HDMigrateECGClassificationAverageHRAndPayload_block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(void *)(a1 + 32));
}

@end