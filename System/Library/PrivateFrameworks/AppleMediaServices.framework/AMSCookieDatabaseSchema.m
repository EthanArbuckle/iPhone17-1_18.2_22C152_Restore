@interface AMSCookieDatabaseSchema
+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3;
+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3 error:(id *)a4;
+ (BOOL)migrateVersion0to1WithMigration:(id)a3 error:(id *)a4;
+ (BOOL)promptTapToRadarForSchemaMigrationFailureWithDescription:(id)a3 error:(id *)a4;
+ (id)_deviceStorageDetails;
@end

@implementation AMSCookieDatabaseSchema

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3
{
  return [a1 createOrUpdateSchemaUsingConnection:a3 error:0];
}

+ (BOOL)createOrUpdateSchemaUsingConnection:(id)a3 error:(id *)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = AMSSetLogKeyIfNeeded();
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__22;
  v57 = __Block_byref_object_dispose__22;
  id v58 = 0;
  v8 = [[AMSSQLiteSchema alloc] initWithConnection:v6];
  uint64_t v9 = [(AMSSQLiteSchema *)v8 currentUserVersion];
  v10 = v52;
  while (1)
  {
    if (v9 > 0) {
      goto LABEL_24;
    }
    if (!v9)
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v52[0] = __69__AMSCookieDatabaseSchema_createOrUpdateSchemaUsingConnection_error___block_invoke;
      v52[1] = &unk_1E55A1468;
      v52[2] = &v53;
      v52[3] = a1;
      if (![(AMSSQLiteSchema *)v8 migrateToVersion:1 usingBlock:v51]) {
        break;
      }
    }
    uint64_t v11 = [(AMSSQLiteSchema *)v8 currentUserVersion];
    BOOL v12 = v11 == v9;
    uint64_t v9 = v11;
    if (v12)
    {
      v13 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v13)
      {
        v13 = +[AMSLogConfig sharedConfig];
      }
      v14 = [v13 OSLogObject];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = AMSLogKey();
        v16 = NSString;
        if (v15)
        {
          uint64_t v17 = objc_opt_class();
          v10 = AMSLogKey();
          [v16 stringWithFormat:@"%@: [%@] ", v17, v10];
        }
        else
        {
          [NSString stringWithFormat:@"%@: ", objc_opt_class()];
        v18 = };
        *(_DWORD *)buf = 138543362;
        v60 = v18;
        _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to update AMS cookie database schema. User version did not change.", buf, 0xCu);
        if (v15)
        {

          v18 = v10;
        }
      }
      if (!os_variant_has_internal_content())
      {
LABEL_24:
        BOOL v28 = 1;
        goto LABEL_58;
      }
      id v49 = 0;
      char v26 = [a1 promptTapToRadarForSchemaMigrationFailureWithDescription:@"User version did not change after updating the cookie database schema" error:&v49];
      id v27 = v49;
      if (v26)
      {
        BOOL v28 = 1;
        goto LABEL_57;
      }
      id v29 = +[AMSLogConfig sharedConfig];
      if (!v29)
      {
        id v29 = +[AMSLogConfig sharedConfig];
      }
      v30 = [v29 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = AMSLogKey();
        v32 = NSString;
        if (v31)
        {
          uint64_t v33 = objc_opt_class();
          v34 = AMSLogKey();
          v35 = [v32 stringWithFormat:@"%@: [%@] ", v33, v34];
        }
        else
        {
          v35 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
          v34 = v35;
        }
        v46 = AMSLogableError((void *)v54[5]);
        *(_DWORD *)buf = 138543618;
        v60 = v35;
        __int16 v61 = 2114;
        v62 = v46;
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to file Tap-to-Radar. error = %{public}@", buf, 0x16u);
        if (v31) {
      }
        }
      BOOL v28 = 1;
      goto LABEL_55;
    }
  }
  v19 = +[AMSLogConfig sharedAccountsCookiesConfig];
  if (!v19)
  {
    v19 = +[AMSLogConfig sharedConfig];
  }
  v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = AMSLogKey();
    v22 = NSString;
    if (v21)
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      v25 = [v22 stringWithFormat:@"%@: [%@] ", v23, v24];
    }
    else
    {
      v25 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      v24 = v25;
    }
    v36 = AMSLogableError((void *)v54[5]);
    *(_DWORD *)buf = 138543618;
    v60 = v25;
    __int16 v61 = 2114;
    v62 = v36;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to update AMS cookie database schema. error = %{public}@", buf, 0x16u);
    if (v21) {
  }
    }
  if (a4) {
    *a4 = (id) v54[5];
  }
  if (!os_variant_has_internal_content())
  {
    BOOL v28 = 0;
    goto LABEL_58;
  }
  v37 = NSString;
  v38 = [(id)v54[5] localizedDescription];
  id v27 = [v37 stringWithFormat:@"Encountered a failure creating or updating the cookie database schema:\n\n%@", v38];

  id v50 = 0;
  char v39 = [a1 promptTapToRadarForSchemaMigrationFailureWithDescription:v27 error:&v50];
  id v29 = v50;
  if (v39)
  {
    BOOL v28 = 0;
    goto LABEL_56;
  }
  v30 = +[AMSLogConfig sharedConfig];
  if (!v30)
  {
    v30 = +[AMSLogConfig sharedConfig];
  }
  v40 = [v30 OSLogObject];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    v41 = AMSLogKey();
    v42 = NSString;
    if (v41)
    {
      uint64_t v43 = objc_opt_class();
      v44 = AMSLogKey();
      v45 = [v42 stringWithFormat:@"%@: [%@] ", v43, v44];
    }
    else
    {
      v45 = [NSString stringWithFormat:@"%@: ", objc_opt_class()];
      v44 = v45;
    }
    v47 = AMSLogableError((void *)v54[5]);
    *(_DWORD *)buf = 138543618;
    v60 = v45;
    __int16 v61 = 2114;
    v62 = v47;
    _os_log_impl(&dword_18D554000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to file Tap-to-Radar. error = %{public}@", buf, 0x16u);
    if (v41) {
  }
    }
  BOOL v28 = 0;
LABEL_55:

LABEL_56:
LABEL_57:

LABEL_58:
  _Block_object_dispose(&v53, 8);

  return v28;
}

void __69__AMSCookieDatabaseSchema_createOrUpdateSchemaUsingConnection_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v4 migrateVersion0to1WithMigration:a2 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if ((v6 & 1) == 0)
  {
    id v7 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = AMSLogKey();
      v10 = NSString;
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = v11;
      if (v9)
      {
        uint64_t v2 = AMSLogKey();
        [v10 stringWithFormat:@"%@: [%@] ", v12, v2];
      }
      else
      {
        [v10 stringWithFormat:@"%@: ", v11];
      v13 = };
      v14 = AMSLogableError(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      v19 = v14;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error migrating cookie database from version 0 to 1. error = %{public}@", buf, 0x16u);
      if (v9)
      {

        v13 = (void *)v2;
      }
    }
  }
}

+ (BOOL)migrateVersion0to1WithMigration:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 executeStatement:@"PRAGMA auto_vacuum = 2;" error:a4])
  {
    char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"CREATE TABLE cookies (");
    id v7 = objc_msgSend(&unk_1EDD01960, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_33);
    v8 = objc_msgSend(&unk_1EDD01960, "ams_filterUsingTest:", &__block_literal_global_107);
    uint64_t v9 = objc_msgSend(v8, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_109_0);

    v10 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithString:", @"PRIMARY KEY(");
    uint64_t v11 = [v9 componentsJoinedByString:@","];
    [v10 appendString:v11];

    [v10 appendString:@""]);
    uint64_t v12 = [v7 arrayByAddingObject:v10];

    v13 = [v12 componentsJoinedByString:@", "];
    [v6 appendString:v13];

    [v6 appendString:@";"]);
    v14 = (void *)[v6 copy];
    char v15 = [v5 executeStatement:v14 error:a4];
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

id __65__AMSCookieDatabaseSchema_migrateVersion0to1WithMigration_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 unsignedIntegerValue];
  if (v2 == 14)
  {
    v3 = 0;
  }
  else
  {
    unint64_t v4 = v2;
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    char v6 = AMSNameForAMSCookieDatabaseColumn(v4);
    [v5 appendString:v6];

    [v5 appendString:@" "];
    if (v4 >= 0xE) {
      id v7 = 0;
    }
    else {
      id v7 = @"TEXT";
    }
    [v5 appendString:v7];
    if (v4 <= 8 && ((1 << v4) & 0x148) != 0) {
      [v5 appendString:@" NOT NULL"];
    }
    v3 = (void *)[v5 copy];
  }
  return v3;
}

uint64_t __65__AMSCookieDatabaseSchema_migrateVersion0to1WithMigration_error___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  return (v2 < 9) & (0x148u >> v2);
}

__CFString *__65__AMSCookieDatabaseSchema_migrateVersion0to1WithMigration_error___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 unsignedIntegerValue];
  return AMSNameForAMSCookieDatabaseColumn(v2);
}

+ (BOOL)promptTapToRadarForSchemaMigrationFailureWithDescription:(id)a3 error:(id *)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = AMSSetLogKeyIfNeeded();
  Class v9 = (Class)_MergedGlobals_72[0]();
  if (v9)
  {
    v10 = [(objc_class *)v9 shared];
    uint64_t v11 = +[AMSLogConfig sharedAccountsCookiesConfig];
    uint64_t v12 = v11;
    if (v10)
    {
      uint64_t v64 = (uint64_t)a4;
      if (!v11)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      v13 = [v12 OSLogObject];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = AMSLogKey();
        char v15 = NSString;
        uint64_t v16 = objc_opt_class();
        uint64_t v17 = v16;
        if (v14)
        {
          uint64_t v4 = AMSLogKey();
          [v15 stringWithFormat:@"%@: [%@] ", v17, v4];
        }
        else
        {
          [v15 stringWithFormat:@"%@: ", v16];
        __int16 v18 = };
        *(_DWORD *)buf = 138543362;
        v67 = v18;
        _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Preparing Radar draft", buf, 0xCu);
        if (v14)
        {

          __int16 v18 = (void *)v4;
        }
      }
      uint64_t v12 = [objc_alloc((Class)off_1EB38A9E8[0]()) initWithName:@"Apple Media Services" version:@"Infrastructure" identifier:1158278];
      v24 = objc_alloc_init((Class)off_1EB38A9F0[0]());
      [v24 setClassification:6];
      [v24 setComponent:v12];
      [v24 setIsUserInitiated:0];
      v30 = NSString;
      v31 = [a1 _deviceStorageDetails];
      v62 = v8;
      id v63 = v7;
      v32 = [v30 stringWithFormat:@"%@. Log key: %@. %@.", v7, v8, v31];
      [v24 setProblemDescription:v32];

      [v24 setReproducibility:6];
      uint64_t v33 = [MEMORY[0x1E4F1C9C8] now];
      [v24 setTimeOfIssue:v33];

      [v24 setTitle:@"Failed to update AMS cookie database schema"];
      v34 = +[AMSLogConfig sharedAccountsCookiesConfig];
      if (!v34)
      {
        v34 = +[AMSLogConfig sharedConfig];
      }
      v35 = [v34 OSLogObject];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = AMSLogKey();
        v37 = NSString;
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = v38;
        if (v36)
        {
          uint64_t v33 = AMSLogKey();
          [v37 stringWithFormat:@"%@: [%@] ", v39, v33];
        }
        else
        {
          [v37 stringWithFormat:@"%@: ", v38];
        v40 = };
        v41 = AMSHashIfNeeded(v24);
        *(_DWORD *)buf = 138543618;
        v67 = v40;
        __int16 v68 = 2114;
        v69 = v41;
        _os_log_impl(&dword_18D554000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Sending Radar draft: %{public}@", buf, 0x16u);
        if (v36)
        {

          v40 = v33;
        }
      }
      id v65 = 0;
      [v10 createDraft:v24 forProcessNamed:@"AMS Cookie Database" withDisplayReason:@"it failed to create or update the schema" error:&v65];
      id v42 = v65;
      BOOL v43 = v42 == 0;
      uint64_t v44 = +[AMSLogConfig sharedAccountsCookiesConfig];
      v45 = (void *)v44;
      v46 = (void *)v64;
      if (v42)
      {
        if (!v44)
        {
          v45 = +[AMSLogConfig sharedConfig];
        }
        v47 = [v45 OSLogObject];
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v48 = AMSLogKey();
          id v49 = NSString;
          uint64_t v50 = objc_opt_class();
          uint64_t v51 = v50;
          if (v48)
          {
            uint64_t v61 = AMSLogKey();
            [v49 stringWithFormat:@"%@: [%@] ", v51, v61];
          }
          else
          {
            [v49 stringWithFormat:@"%@: ", v50];
          v52 = };
          v59 = AMSLogableError(v42);
          *(_DWORD *)buf = 138543618;
          v67 = v52;
          __int16 v68 = 2114;
          v69 = v59;
          _os_log_impl(&dword_18D554000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to send Radar draft. error = %{public}@", buf, 0x16u);
          if (v48)
          {

            v52 = (void *)v61;
          }

          v46 = (void *)v64;
        }

        if (v46) {
          void *v46 = v42;
        }
      }
      else
      {
        if (!v44)
        {
          v45 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v53 = [v45 OSLogObject];
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          v54 = AMSLogKey();
          uint64_t v55 = NSString;
          uint64_t v56 = objc_opt_class();
          uint64_t v57 = v56;
          if (v54)
          {
            uint64_t v64 = AMSLogKey();
            [v55 stringWithFormat:@"%@: [%@] ", v57, v64];
          }
          else
          {
            [v55 stringWithFormat:@"%@: ", v56];
          id v58 = };
          *(_DWORD *)buf = 138543362;
          v67 = v58;
          _os_log_impl(&dword_18D554000, v53, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully sent Radar draft.", buf, 0xCu);
          if (v54)
          {

            id v58 = (void *)v64;
          }
        }
      }

      v8 = v62;
      id v7 = v63;
    }
    else
    {
      if (!v11)
      {
        uint64_t v12 = +[AMSLogConfig sharedConfig];
      }
      v24 = [v12 OSLogObject];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = AMSLogKey();
        char v26 = NSString;
        uint64_t v27 = objc_opt_class();
        uint64_t v28 = v27;
        if (v25)
        {
          uint64_t v4 = AMSLogKey();
          [v26 stringWithFormat:@"%@: [%@] ", v28, v4];
        }
        else
        {
          [v26 stringWithFormat:@"%@: ", v27];
        id v29 = };
        *(_DWORD *)buf = 138543362;
        v67 = v29;
        _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Radar service does not exist, cannot send draft.", buf, 0xCu);
        if (v25)
        {

          id v29 = (void *)v4;
        }
      }
      BOOL v43 = 1;
    }
  }
  else
  {
    v10 = +[AMSLogConfig sharedAccountsCookiesConfig];
    if (!v10)
    {
      v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v10 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = AMSLogKey();
      uint64_t v20 = NSString;
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = v21;
      if (v19)
      {
        uint64_t v4 = AMSLogKey();
        [v20 stringWithFormat:@"%@: [%@] ", v22, v4];
      }
      else
      {
        [v20 stringWithFormat:@"%@: ", v21];
      uint64_t v23 = };
      *(_DWORD *)buf = 138543362;
      v67 = v23;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Radar service class does not exist, cannot send draft.", buf, 0xCu);
      if (v19)
      {

        uint64_t v23 = (void *)v4;
      }
    }
    BOOL v43 = 1;
  }

  return v43;
}

+ (id)_deviceStorageDetails
{
  unint64_t v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 2uLL, 1);
  v3 = [v2 lastObject];
  uint64_t v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  id v5 = [v4 attributesOfFileSystemForPath:v3 error:&v20];
  id v6 = v20;

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    v8 = [NSString stringWithFormat:@"Unable to determine free storage space, error: %@", v6];
  }
  else
  {
    Class v9 = [v5 objectForKey:*MEMORY[0x1E4F283B0]];
    unint64_t v10 = [v9 unsignedLongLongValue];

    uint64_t v11 = [v5 objectForKey:*MEMORY[0x1E4F283A0]];
    unint64_t v12 = [v11 unsignedLongLongValue];

    if (v10)
    {
      v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v12 * 100.0 / (double)v10];
    }
    else
    {
      v13 = 0;
    }
    v14 = NSString;
    [v13 floatValue];
    double v16 = v15;
    uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v12];
    __int16 v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v10];
    v8 = [v14 stringWithFormat:@"Device storage has %.02f%% free (%@ free out of %@)", *(void *)&v16, v17, v18];
  }
  return v8;
}

@end