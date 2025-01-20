@interface AMDFetchDescriptor
+ (char)getCodeForSaveAsType:(id)a3;
+ (id)extractPart:(id)a3 from:(id)a4 required:(BOOL)a5 error:(id *)a6;
+ (id)refreshAggregationDescriptors:(id)a3 forDomain:(id)a4 error:(id *)a5;
- (AMDFetchDescriptor)initWithDict:(id)a3 usingSchema:(id)a4 error:(id *)a5;
- (BOOL)isPersistable;
- (NSArray)_columnSpecs;
- (NSString)_id;
- (NSString)_statement;
- (char)_saveAsType;
- (id)getColumnSpecs;
- (id)getId;
- (id)getStatement;
- (id)persist:(id)a3 error:(id *)a4;
- (id)persistObject:(id)a3 error:(id *)a4;
- (int)_keyColumn;
- (int)_listColumn;
- (int)_valueColumn;
- (int64_t)_domain;
- (int64_t)getDomain;
- (void)setDomain:(int64_t)a3;
- (void)set_columnSpecs:(id)a3;
- (void)set_domain:(int64_t)a3;
- (void)set_id:(id)a3;
- (void)set_keyColumn:(int)a3;
- (void)set_listColumn:(int)a3;
- (void)set_saveAsType:(char)a3;
- (void)set_statement:(id)a3;
- (void)set_valueColumn:(int)a3;
@end

@implementation AMDFetchDescriptor

+ (id)extractPart:(id)a3 from:(id)a4 required:(BOOL)a5 error:(id *)a6
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  BOOL v14 = a5;
  v13 = a6;
  id v12 = (id)[NSString stringWithFormat:@"Missing or invalid %@", location[0]];
  id v11 = (id)[v15 objectForKey:location[0]];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v11;
    }
    else
    {
      id *v13 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v12];
      id v17 = 0;
    }
  }
  else
  {
    if (v14) {
      id *v13 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v12];
    }
    id v17 = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  v6 = v17;

  return v6;
}

+ (char)getCodeForSaveAsType:(id)a3
{
  v12[3] = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if (!getCodeForSaveAsType__typeMap)
    {
      v11[0] = @"dictionary";
      v12[0] = &unk_26BEC1A78;
      v11[1] = @"list";
      v12[1] = &unk_26BEC1A90;
      v11[2] = @"rowset";
      v12[2] = &unk_26BEC1AA8;
      id v3 = (id)[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
      v4 = (void *)getCodeForSaveAsType__typeMap;
      getCodeForSaveAsType__typeMap = (uint64_t)v3;
    }
    id v7 = (id)[(id)getCodeForSaveAsType__typeMap objectForKey:location[0]];
    if (v7) {
      char v6 = [v7 unsignedIntValue];
    }
    else {
      char v6 = 0;
    }
    char v10 = v6;
    int v8 = 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    char v10 = 0;
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
  return v10;
}

+ (id)refreshAggregationDescriptors:(id)a3 forDomain:(id)a4 error:(id *)a5
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  Class v63 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v61 = 0;
  objc_storeStrong(&v61, a4);
  v60 = a5;
  id v59 = @"SaveAggDescripors";
  id v58 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  id v57 = (id)[location[0] objectForKey:0x26BEB8518];
  if (v57 && [v57 count])
  {
    id v52 = +[AMDSQLite getSharedInstance];
    if ([v52 getDb])
    {
      id v48 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v57, "count"));
      for (unsigned int i = 0; ; ++i)
      {
        unint64_t v30 = i;
        if (v30 >= [v57 count]) {
          break;
        }
        id v26 = (id)[v57 objectAtIndexedSubscript:i];
        id v46 = (id)[v26 mutableCopy];

        [v46 setObject:v61 forKey:@"domain"];
        id v28 = [v63 alloc];
        id v27 = v46;
        id v29 = (id)[v52 getDataSchema];
        id v45 = (id)objc_msgSend(v28, "initWithDict:usingSchema:error:", v27);

        if (*v60)
        {
          v24 = NSString;
          uint64_t v23 = i;
          id v25 = (id)[*v60 localizedDescription];
          id v44 = (id)[v24 stringWithFormat:@"SQLITE bad aggregation descriptor %u: '%@'", v23, v25];

          id v75 = v59;
          id v76 = v44;
          id v64 = (id)[NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
          int v53 = 1;
          objc_storeStrong(&v44, 0);
        }
        else
        {
          id v43 = (id)[v45 getId];
          id v42 = (id)[MEMORY[0x263F08900] dataWithJSONObject:v46 options:6 error:v60];
          if (*v60)
          {
            v21 = NSString;
            id v22 = v43;
            BOOL v5 = *v60 == 0;
            char v39 = 0;
            if (v5)
            {
              v20 = @"unknown reason";
            }
            else
            {
              id v40 = (id)[*v60 localizedDescription];
              char v39 = 1;
              v20 = (__CFString *)v40;
            }
            id v41 = (id)[v21 stringWithFormat:@"SQLITE agg descriptor '%@' serialization failure: %@", v22, v20];
            if (v39) {

            }
            id v73 = v59;
            id v74 = v41;
            id v64 = (id)[NSDictionary dictionaryWithObjects:&v74 forKeys:&v73 count:1];
            int v53 = 1;
            objc_storeStrong(&v41, 0);
          }
          else
          {
            id v16 = v48;
            v71[0] = 0x26BEAED98;
            v72[0] = v42;
            v71[1] = 0x26BEAE298;
            id v19 = (id)objc_msgSend(NSNumber, "numberWithInteger:", +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v61));
            v72[1] = v19;
            v71[2] = 0x26BEACC58;
            v72[2] = v43;
            v71[3] = 0x26BEAEC58;
            id v18 = +[AMDMiscHelpers getCurrentEpochSeconds];
            v72[3] = v18;
            id v17 = (id)[NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:4];
            objc_msgSend(v16, "addObject:");

            int v53 = 0;
          }
          objc_storeStrong(&v42, 0);
          objc_storeStrong(&v43, 0);
        }
        objc_storeStrong(&v45, 0);
        objc_storeStrong(&v46, 0);
        if (v53) {
          goto LABEL_32;
        }
      }
      id v38 = (id)[NSString stringWithFormat:@"%@ = %ld", 0x26BEAE298, +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:", v61)];
      v69[0] = @"tableName";
      v70[0] = 0x26BEAED78;
      v69[1] = 0x26BEAEC18;
      v70[1] = v48;
      v69[2] = @"predicateExpression";
      v70[2] = v38;
      id v37 = (id)[NSDictionary dictionaryWithObjects:v70 forKeys:v69 count:3];
      id v36 = (id)[v52 deleteRows:v37 error:v60];
      if (*v60)
      {
        BOOL v14 = NSString;
        id v13 = v61;
        id v15 = (id)[*v60 localizedDescription];
        id v35 = (id)[v14 stringWithFormat:@"SQLITE could not delete descriptors for domain '%@': %@", v13, v15];

        id v67 = v59;
        id v68 = v35;
        id v64 = (id)[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
        int v53 = 1;
        objc_storeStrong(&v35, 0);
      }
      else
      {
        [v58 addEntriesFromDictionary:v36];
        id v11 = v52;
        id v12 = (id)[v52 getBootSchema];
        id v34 = (id)objc_msgSend(v11, "insertRows:usingSchema:error:", v37);

        if (*v60)
        {
          v9 = NSString;
          id v8 = v61;
          id v10 = (id)[*v60 localizedDescription];
          id v33 = (id)[v9 stringWithFormat:@"SQLITE could not insert descriptors for domain '%@': %@", v8, v10];

          id v65 = v59;
          id v66 = v33;
          id v64 = (id)[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
          int v53 = 1;
          objc_storeStrong(&v33, 0);
        }
        else
        {
          [v58 addEntriesFromDictionary:v34];
          id v64 = v58;
          int v53 = 1;
        }
        objc_storeStrong(&v34, 0);
      }
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v38, 0);
LABEL_32:
      objc_storeStrong(&v48, 0);
    }
    else
    {
      id v51 = (id)[NSString stringWithFormat:@"SQL database pointer is nil"];
      id *v60 = +[AMDError allocError:22 withMessage:v51];
      os_log_t v50 = (os_log_t)&_os_log_internal;
      os_log_type_t v49 = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v79, (uint64_t)v51);
        _os_log_impl(&dword_20ABD4000, v50, v49, "%@", v79, 0xCu);
      }
      objc_storeStrong((id *)&v50, 0);
      id v77 = v59;
      id v78 = v51;
      id v64 = (id)[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
      int v53 = 1;
      objc_storeStrong(&v51, 0);
    }
    objc_storeStrong(&v52, 0);
  }
  else
  {
    id v56 = (id)[NSString stringWithFormat:@"No SQLite aggregators for domain '%@'", v61];
    id *v60 = +[AMDError allocError:15 withMessage:v56];
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v82, (uint64_t)v56);
      _os_log_impl(&dword_20ABD4000, oslog, type, "%@", v82, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v80 = v59;
    id v81 = v56;
    id v64 = (id)[NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
    int v53 = 1;
    objc_storeStrong(&v56, 0);
  }
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(location, 0);
  char v6 = v64;

  return v6;
}

- (id)getColumnSpecs
{
  return [(AMDFetchDescriptor *)self _columnSpecs];
}

- (int64_t)getDomain
{
  return [(AMDFetchDescriptor *)self _domain];
}

- (void)setDomain:(int64_t)a3
{
}

- (id)getId
{
  return [(AMDFetchDescriptor *)self _id];
}

- (id)getStatement
{
  return [(AMDFetchDescriptor *)self _statement];
}

- (AMDFetchDescriptor)initWithDict:(id)a3 usingSchema:(id)a4 error:(id *)a5
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  id v97 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v95 = 0;
  objc_storeStrong(&v95, a4);
  v94 = a5;
  id v5 = v97;
  id v97 = 0;
  v93.receiver = v5;
  v93.super_class = (Class)AMDFetchDescriptor;
  id v97 = [(AMDFetchDescriptor *)&v93 init];
  objc_storeStrong(&v97, v97);
  id v47 = +[AMDFetchDescriptor extractPart:@"id" from:location[0] required:1 error:v94];
  objc_msgSend(v97, "set_id:");

  if (*v94)
  {
    v98 = 0;
    int v92 = 1;
  }
  else
  {
    id v91 = +[AMDFetchDescriptor extractPart:@"tableName" from:location[0] required:1 error:v94];
    if (*v94)
    {
      v98 = 0;
      int v92 = 1;
    }
    else
    {
      id v90 = (id)[v95 getTables];
      id v6 = (id)[v90 objectForKey:v91];
      BOOL v44 = v6 != 0;

      if (v44)
      {
        id v88 = (id)[NSString stringWithFormat:@"FROM %@", v91];
        id v87 = (id)[location[0] objectForKey:@"columnsToFetch"];
        if (v87 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v86 = v87;
          id v85 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v86, "count"));
          id v84 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v86, "count"));
          memset(__b, 0, sizeof(__b));
          id v42 = v86;
          uint64_t v43 = [v42 countByEnumeratingWithState:__b objects:v99 count:16];
          if (v43)
          {
            uint64_t v39 = *(void *)__b[2];
            uint64_t v40 = 0;
            unint64_t v41 = v43;
            while (1)
            {
              uint64_t v38 = v40;
              if (*(void *)__b[2] != v39) {
                objc_enumerationMutation(v42);
              }
              id v83 = *(id *)(__b[1] + 8 * v40);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                break;
              }
              id v81 = v83;
              id v37 = (id)[v81 allKeys];
              id v10 = (id)[v37 firstObject];
              id v11 = v87;
              id v87 = v10;

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v80 = v87;
                id v13 = (id)[v81 objectForKey:v80];
                id v14 = v87;
                id v87 = v13;

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v79 = v87;
                  id v16 = [AMDSQLiteColumnSpec alloc];
                  id v78 = [(AMDSQLiteColumnSpec *)v16 initWithDict:v79 withName:v80 error:v94];
                  if (*v94)
                  {
                    v98 = 0;
                    int v92 = 1;
                  }
                  else
                  {
                    [v85 addObject:v78];
                    id v35 = v84;
                    id v36 = (id)[v78 getSelectColumnExpression];
                    objc_msgSend(v35, "addObject:");

                    int v92 = 0;
                  }
                  objc_storeStrong(&v78, 0);
                  objc_storeStrong(&v79, 0);
                }
                else
                {
                  id v15 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Invalid column spec"];
                  id *v94 = v15;
                  v98 = 0;
                  int v92 = 1;
                }
                objc_storeStrong(&v80, 0);
              }
              else
              {
                id v12 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Invalid column name"];
                id *v94 = v12;
                v98 = 0;
                int v92 = 1;
              }
              objc_storeStrong(&v81, 0);
              if (v92) {
                goto LABEL_29;
              }
              ++v40;
              if (v38 + 1 >= v41)
              {
                uint64_t v40 = 0;
                unint64_t v41 = [v42 countByEnumeratingWithState:__b objects:v99 count:16];
                if (!v41) {
                  goto LABEL_28;
                }
              }
            }
            id v9 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"Invalid columnspec"];
            id *v94 = v9;
            v98 = 0;
            int v92 = 1;
          }
          else
          {
LABEL_28:
            int v92 = 0;
          }
LABEL_29:

          if (!v92)
          {
            objc_msgSend(v97, "set_columnSpecs:", v85);
            id v77 = +[AMDFetchDescriptor extractPart:@"joinExpression" from:location[0] required:0 error:v94];
            if (*v94)
            {
              v98 = 0;
              int v92 = 1;
            }
            else
            {
              id v76 = +[AMDFetchDescriptor extractPart:@"predicateExpression" from:location[0] required:0 error:v94];
              if (*v94)
              {
                v98 = 0;
                int v92 = 1;
              }
              else
              {
                id v75 = +[AMDFetchDescriptor extractPart:@"groupByExpression" from:location[0] required:0 error:v94];
                if (*v94)
                {
                  v98 = 0;
                  int v92 = 1;
                }
                else
                {
                  id v74 = +[AMDFetchDescriptor extractPart:@"havingExpression" from:location[0] required:0 error:v94];
                  if (*v94)
                  {
                    v98 = 0;
                    int v92 = 1;
                  }
                  else
                  {
                    id v73 = +[AMDFetchDescriptor extractPart:@"sortExpression" from:location[0] required:0 error:v94];
                    if (*v94)
                    {
                      v98 = 0;
                      int v92 = 1;
                    }
                    else
                    {
                      id v72 = +[AMDFetchDescriptor extractPart:@"limit" from:location[0] required:0 error:v94];
                      if (*v94)
                      {
                        v98 = 0;
                        int v92 = 1;
                      }
                      else
                      {
                        id v71 = +[AMDFetchDescriptor extractPart:@"onlyLocalData" from:location[0] required:0 error:v94];
                        if (*v94)
                        {
                          v98 = 0;
                          int v92 = 1;
                        }
                        else
                        {
                          if (v71 && ([v71 isEqualToString:@"TRUE"] & 1) != 0)
                          {
                            id v70 = 0;
                            id v68 = 0;
                            id v34 = +[AMDDataSync fetchDeviceID:&v68];
                            objc_storeStrong(&v70, v68);
                            id v69 = v34;
                            if (v70 || !v69)
                            {
                              os_log_t oslog = (os_log_t)&_os_log_internal;
                              os_log_type_t type = OS_LOG_TYPE_ERROR;
                              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
                              {
                                log = oslog;
                                os_log_type_t v32 = type;
                                __os_log_helper_16_0_0(v64);
                                _os_log_error_impl(&dword_20ABD4000, log, v32, "Local device Id could not be fetched", v64, 2u);
                              }
                              objc_storeStrong((id *)&oslog, 0);
                            }
                            else
                            {
                              id v67 = (id)[NSString stringWithFormat:@"deviceId = '%@'", v69];
                              if (v76)
                              {
                                id v33 = (id)[v76 stringByAppendingString:@" AND "];
                                id v17 = (id)[v33 stringByAppendingString:v67];
                                id v18 = v76;
                                id v76 = v17;
                              }
                              else
                              {
                                objc_storeStrong(&v76, v67);
                              }
                              objc_storeStrong(&v67, 0);
                            }
                            objc_storeStrong(&v69, 0);
                            objc_storeStrong(&v70, 0);
                          }
                          id v29 = NSString;
                          id v30 = (id)[v84 componentsJoinedByString:@", "];
                          id v63 = (id)[v29 stringWithFormat:@"SELECT %@ %@", v30, v88];

                          char v61 = 0;
                          if (v77)
                          {
                            id v62 = (id)[v63 stringByAppendingFormat:@" %@", v77];
                            char v61 = 1;
                            objc_storeStrong(&v63, v62);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if (v61) {

                          }
                          char v59 = 0;
                          if (v76)
                          {
                            id v60 = (id)[v63 stringByAppendingFormat:@" WHERE %@", v76];
                            char v59 = 1;
                            objc_storeStrong(&v63, v60);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if (v59) {

                          }
                          char v57 = 0;
                          if (v75)
                          {
                            id v58 = (id)[v63 stringByAppendingFormat:@" GROUP BY %@", v75];
                            char v57 = 1;
                            objc_storeStrong(&v63, v58);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if (v57) {

                          }
                          char v55 = 0;
                          if (v74)
                          {
                            id v56 = (id)[v63 stringByAppendingFormat:@" HAVING %@", v74];
                            char v55 = 1;
                            objc_storeStrong(&v63, v56);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if (v55) {

                          }
                          char v53 = 0;
                          if (v73)
                          {
                            id v54 = (id)[v63 stringByAppendingFormat:@" ORDER BY %@", v73];
                            char v53 = 1;
                            objc_storeStrong(&v63, v54);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if (v53) {

                          }
                          char v51 = 0;
                          if (v72)
                          {
                            id v52 = (id)[v63 stringByAppendingFormat:@" LIMIT %@", v72];
                            char v51 = 1;
                            objc_storeStrong(&v63, v52);
                          }
                          else
                          {
                            objc_storeStrong(&v63, v63);
                          }
                          if (v51) {

                          }
                          objc_msgSend(v97, "set_statement:", v63);
                          id v50 = +[AMDFetchDescriptor extractPart:@"saveAs" from:location[0] required:0 error:v94];
                          if (*v94)
                          {
                            v98 = 0;
                            int v92 = 1;
                          }
                          else
                          {
                            char v19 = +[AMDFetchDescriptor getCodeForSaveAsType:v50];
                            objc_msgSend(v97, "set_saveAsType:", v19);
                            id v49 = +[AMDFetchDescriptor extractPart:@"domain" from:location[0] required:0 error:v94];
                            if (*v94)
                            {
                              v98 = 0;
                              int v92 = 1;
                            }
                            else
                            {
                              int64_t v20 = +[AMDDomains getCodeForDomain:v49];
                              objc_msgSend(v97, "set_domain:", v20);
                              id v48 = +[AMDFetchDescriptor extractPart:@"listColumn" from:location[0] required:0 error:v94];

                              if (*v94)
                              {
                                v98 = 0;
                                int v92 = 1;
                              }
                              else
                              {
                                if (v48) {
                                  unsigned int v28 = [v48 intValue];
                                }
                                else {
                                  unsigned int v28 = -1;
                                }
                                objc_msgSend(v97, "set_listColumn:", v28);
                                id v21 = +[AMDFetchDescriptor extractPart:@"keyColumn" from:location[0] required:0 error:v94];
                                id v22 = v48;
                                id v48 = v21;

                                if (*v94)
                                {
                                  v98 = 0;
                                  int v92 = 1;
                                }
                                else
                                {
                                  if (v48) {
                                    unsigned int v27 = [v48 intValue];
                                  }
                                  else {
                                    unsigned int v27 = -1;
                                  }
                                  objc_msgSend(v97, "set_keyColumn:", v27);
                                  id v23 = +[AMDFetchDescriptor extractPart:@"valueColumn" from:location[0] required:0 error:v94];
                                  id v24 = v48;
                                  id v48 = v23;

                                  if (*v94)
                                  {
                                    v98 = 0;
                                    int v92 = 1;
                                  }
                                  else
                                  {
                                    if (v48) {
                                      unsigned int v26 = [v48 intValue];
                                    }
                                    else {
                                      unsigned int v26 = -1;
                                    }
                                    objc_msgSend(v97, "set_valueColumn:", v26);
                                    v98 = (AMDFetchDescriptor *)v97;
                                    int v92 = 1;
                                  }
                                }
                              }
                              objc_storeStrong(&v48, 0);
                            }
                            objc_storeStrong(&v49, 0);
                          }
                          objc_storeStrong(&v50, 0);
                          objc_storeStrong(&v63, 0);
                        }
                        objc_storeStrong(&v71, 0);
                      }
                      objc_storeStrong(&v72, 0);
                    }
                    objc_storeStrong(&v73, 0);
                  }
                  objc_storeStrong(&v74, 0);
                }
                objc_storeStrong(&v75, 0);
              }
              objc_storeStrong(&v76, 0);
            }
            objc_storeStrong(&v77, 0);
          }
          objc_storeStrong(&v84, 0);
          objc_storeStrong(&v85, 0);
          objc_storeStrong(&v86, 0);
        }
        else
        {
          id v8 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:@"No or invalid columns"];
          id *v94 = v8;
          v98 = 0;
          int v92 = 1;
        }
        objc_storeStrong(&v87, 0);
        objc_storeStrong(&v88, 0);
      }
      else
      {
        id v89 = (id)[NSString stringWithFormat:@"SQLITE No table '%@'", v91];
        id v7 = +[AMDMiscHelpers logAndCreateError:29 errorMessage:v89];
        id *v94 = v7;
        v98 = 0;
        int v92 = 1;
        objc_storeStrong(&v89, 0);
      }
      objc_storeStrong(&v90, 0);
    }
    objc_storeStrong(&v91, 0);
  }
  objc_storeStrong(&v95, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v97, 0);
  return v98;
}

- (BOOL)isPersistable
{
  id v6 = [(AMDFetchDescriptor *)self _columnSpecs];
  unint64_t v7 = [(NSArray *)v6 count];

  BOOL v8 = 0;
  if ([(AMDFetchDescriptor *)self _domain])
  {
    BOOL v8 = 0;
    if ([(AMDFetchDescriptor *)self _saveAsType])
    {
      if ([(AMDFetchDescriptor *)self _saveAsType] != 2
        || (BOOL v8 = 0, [(AMDFetchDescriptor *)self _listColumn] >= 0)
        && (BOOL v8 = 0, [(AMDFetchDescriptor *)self _listColumn] < v7))
      {
        if ([(AMDFetchDescriptor *)self _saveAsType] == 1)
        {
          BOOL v5 = 0;
          if ([(AMDFetchDescriptor *)self _keyColumn] >= 0)
          {
            BOOL v5 = 0;
            if ([(AMDFetchDescriptor *)self _keyColumn] < v7)
            {
              BOOL v5 = 0;
              if ([(AMDFetchDescriptor *)self _valueColumn] >= 0)
              {
                BOOL v5 = 0;
                if ([(AMDFetchDescriptor *)self _valueColumn] < v7)
                {
                  int v4 = [(AMDFetchDescriptor *)self _keyColumn];
                  BOOL v5 = v4 != [(AMDFetchDescriptor *)self _valueColumn];
                }
              }
            }
          }
          int v3 = v5;
        }
        else
        {
          int v3 = 1;
        }
        return v3 != 0;
      }
    }
  }
  return v8;
}

- (id)persist:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = a4;
  id v33 = @"SQlitePersist";
  if ([(AMDFetchDescriptor *)v36 isPersistable])
  {
    id v28 = &_os_log_internal;
    os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEBUG))
    {
      id v18 = [(AMDFetchDescriptor *)v36 _id];
      __os_log_helper_16_2_2_8_64_4_0((uint64_t)v40, (uint64_t)v18, [(AMDFetchDescriptor *)v36 _saveAsType]);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v28, v27, "SQLITE Saving agg results for '%@', type: %d", v40, 0x12u);
    }
    objc_storeStrong(&v28, 0);
    id v26 = 0;
    char v4 = [(AMDFetchDescriptor *)v36 _saveAsType];
    if (v4)
    {
      uint64_t v6 = v4;
      char v5 = 1;
    }
    else
    {
      uint64_t v6 = 0;
      char v5 = 0;
    }
    if ((v5 & 1) == 0)
    {
      switch(v6)
      {
        case 0:
          objc_storeStrong(&v26, @"Check!!");
          break;
        case 1:
          id v25 = (id)[location[0] objectForKey:0x26BEAEE58];
          id v15 = NSDictionary;
          id v17 = (id)objc_msgSend(v25, "objectAtIndexedSubscript:", -[AMDFetchDescriptor _valueColumn](v36, "_valueColumn"));
          id v16 = (id)objc_msgSend(v25, "objectAtIndexedSubscript:", -[AMDFetchDescriptor _keyColumn](v36, "_keyColumn"));
          id v24 = (id)objc_msgSend(v15, "dictionaryWithObjects:forKeys:", v17);

          id v7 = [(AMDFetchDescriptor *)v36 persistObject:v24 error:v34];
          id v8 = v26;
          id v26 = v7;

          objc_storeStrong(&v24, 0);
          objc_storeStrong(&v25, 0);
          break;
        case 2:
          id v23 = (id)[location[0] objectForKey:0x26BEAEE58];
          id v22 = (id)objc_msgSend(v23, "objectAtIndexedSubscript:", -[AMDFetchDescriptor _listColumn](v36, "_listColumn"));
          id v9 = [(AMDFetchDescriptor *)v36 persistObject:v22 error:v34];
          id v10 = v26;
          id v26 = v9;

          objc_storeStrong(&v22, 0);
          objc_storeStrong(&v23, 0);
          break;
        case 3:
          id v11 = [(AMDFetchDescriptor *)v36 persistObject:location[0] error:v34];
          id v12 = v26;
          id v26 = v11;

          break;
        default:
          JUMPOUT(0);
      }
    }
    id v38 = v33;
    id v39 = v26;
    id v37 = (id)[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    int v29 = 1;
    objc_storeStrong(&v26, 0);
  }
  else
  {
    char v19 = NSString;
    int64_t v20 = [(AMDFetchDescriptor *)v36 _id];
    id v32 = (id)[v19 stringWithFormat:@"Cannot persist '%@', check descriptor", v20];

    id v31 = &_os_log_internal;
    os_log_type_t v30 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v32);
      _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v31, v30, "SQLITE %@", v43, 0xCu);
    }
    objc_storeStrong(&v31, 0);
    id v41 = v33;
    id v42 = v32;
    id v37 = (id)[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    int v29 = 1;
    objc_storeStrong(&v32, 0);
  }
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  id v13 = v37;

  return v13;
}

- (id)persistObject:(id)a3 error:(id *)a4
{
  v61[1] = *MEMORY[0x263EF8340];
  id v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v45 = a4;
  id v44 = @"persistFDOutput";
  id v43 = (id)[MEMORY[0x263F08900] dataWithJSONObject:location[0] options:6 error:a4];
  if (*a4)
  {
    id v26 = NSString;
    os_log_type_t v27 = [(AMDFetchDescriptor *)v47 _id];
    BOOL v4 = *v45 == 0;
    char v40 = 0;
    if (v4)
    {
      id v25 = @"unknown reason";
    }
    else
    {
      id v41 = (id)[*v45 localizedDescription];
      char v40 = 1;
      id v25 = (__CFString *)v41;
    }
    id v42 = (id)[v26 stringWithFormat:@"SQLITE tp data '%@' serialization failure: %@", v27, v25];
    if (v40) {

    }
    id v60 = v44;
    v61[0] = v42;
    id v48 = (id)[NSDictionary dictionaryWithObjects:v61 forKeys:&v60 count:1];
    int v39 = 1;
    objc_storeStrong(&v42, 0);
  }
  else
  {
    id v18 = NSString;
    uint64_t v17 = [(AMDFetchDescriptor *)v47 _domain];
    char v19 = [(AMDFetchDescriptor *)v47 _id];
    id v38 = (id)[v18 stringWithFormat:@"%@ = %ld AND %@ = '%@'", 0x26BEAE298, v17, 0x26BEADFF8, v19];

    v57[0] = 0x26BEAE298;
    id v24 = (id)objc_msgSend(NSNumber, "numberWithInteger:", -[AMDFetchDescriptor _domain](v47, "_domain"));
    v58[0] = v24;
    v57[1] = 0x26BEADFF8;
    id v23 = [(AMDFetchDescriptor *)v47 _id];
    v58[1] = v23;
    v57[2] = 0x26BEAED18;
    v58[2] = 0x26BEB7E78;
    v57[3] = 0x26BEAED38;
    id v22 = (id)objc_msgSend(NSNumber, "numberWithChar:", -[AMDFetchDescriptor _saveAsType](v47, "_saveAsType"));
    v58[3] = v22;
    v57[4] = 0x26BEAED58;
    v58[4] = v43;
    v57[5] = 0x26BEAEC58;
    id v21 = +[AMDMiscHelpers getCurrentEpochSeconds];
    v58[5] = v21;
    id v20 = (id)[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:6];
    id v59 = v20;
    id v37 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];

    v55[0] = @"tableName";
    v56[0] = 0x26BEAECF8;
    v55[1] = 0x26BEAEC18;
    v56[1] = v37;
    v55[2] = @"predicateExpression";
    v56[2] = v38;
    id v36 = (id)[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:3];
    id v35 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
    id v34 = +[AMDSQLite getSharedInstance];
    if ([v34 getDb])
    {
      id v32 = (id)[v34 deleteRows:v36 error:v45];
      if (*v45)
      {
        id v14 = NSString;
        id v16 = [(AMDFetchDescriptor *)v47 _id];
        uint64_t v13 = [(AMDFetchDescriptor *)v47 _domain];
        id v15 = (id)[*v45 localizedDescription];
        id v31 = (id)[v14 stringWithFormat:@"SQLITE error deleting old TP entry '%@', domain %lu: %@", v16, v13, v15];

        id v51 = v44;
        id v52 = v31;
        id v48 = (id)[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        int v39 = 1;
        objc_storeStrong(&v31, 0);
      }
      else
      {
        [v35 addEntriesFromDictionary:v32];
        id v12 = (id)[v34 getBootSchema];
        id v30 = (id)objc_msgSend(v34, "insertRows:usingSchema:error:", v36);

        if (*v45)
        {
          id v9 = NSString;
          id v11 = [(AMDFetchDescriptor *)v47 _id];
          uint64_t v8 = [(AMDFetchDescriptor *)v47 _domain];
          id v10 = (id)[*v45 localizedDescription];
          id v29 = (id)[v9 stringWithFormat:@"SQLITE error inserting new TP entry '%@', domain %lu: %@", v11, v8, v10];

          id v49 = v44;
          id v50 = v29;
          id v48 = (id)[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
          int v39 = 1;
          objc_storeStrong(&v29, 0);
        }
        else
        {
          [v35 addEntriesFromDictionary:v30];
          id v7 = [(AMDFetchDescriptor *)v47 _id];
          objc_msgSend(v35, "setObject:forKey:");

          id v48 = v35;
          int v39 = 1;
        }
        objc_storeStrong(&v30, 0);
      }
      objc_storeStrong(&v32, 0);
    }
    else
    {
      id v33 = (id)[NSString stringWithFormat:@"SQL database pointer is nil"];
      id v53 = v44;
      id v54 = v33;
      id v48 = (id)[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      int v39 = 1;
      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
    objc_storeStrong(&v37, 0);
    objc_storeStrong(&v38, 0);
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
  char v5 = v48;

  return v5;
}

- (NSArray)_columnSpecs
{
  return self->__columnSpecs;
}

- (void)set_columnSpecs:(id)a3
{
}

- (int64_t)_domain
{
  return self->__domain;
}

- (void)set_domain:(int64_t)a3
{
  self->__domain = a3;
}

- (NSString)_id
{
  return self->__id;
}

- (void)set_id:(id)a3
{
}

- (int)_keyColumn
{
  return self->__keyColumn;
}

- (void)set_keyColumn:(int)a3
{
  self->__keyColumn = a3;
}

- (int)_listColumn
{
  return self->__listColumn;
}

- (void)set_listColumn:(int)a3
{
  self->__listColumn = a3;
}

- (char)_saveAsType
{
  return self->__saveAsType;
}

- (void)set_saveAsType:(char)a3
{
  self->__saveAsType = a3;
}

- (NSString)_statement
{
  return self->__statement;
}

- (void)set_statement:(id)a3
{
}

- (int)_valueColumn
{
  return self->__valueColumn;
}

- (void)set_valueColumn:(int)a3
{
  self->__valueColumn = a3;
}

- (void).cxx_destruct
{
}

@end