@interface AMDColdstartOperation
+ (id)computeUpdatedScoresV2:(id)a3 withModel:(id)a4 andMappingDictionary:(id)a5;
+ (id)ensureNewDirectoryForBinaryWithModelId:(id)a3 andVersion:(id)a4;
+ (id)saveColdStartBinaryforModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6;
@end

@implementation AMDColdstartOperation

+ (id)ensureNewDirectoryForBinaryWithModelId:(id)a3 andVersion:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v22 = 0;
  objc_storeStrong(&v22, a4);
  id v21 = (id)[MEMORY[0x263F08850] defaultManager];
  id v12 = (id)[v21 URLsForDirectory:14 inDomains:1];
  id v20 = (id)[v12 lastObject];

  id v19 = (id)[v20 URLByAppendingPathComponent:0x26BEB2F98];
  id v18 = (id)[v19 URLByAppendingPathComponent:@"coldstartBinaries"];
  id v17 = (id)[v18 URLByAppendingPathComponent:location[0]];
  if (+[AMDMiscHelpers ensureDir:v17 removeIfExists:0])
  {
    id v15 = (id)[v22 stringValue];
    id v7 = (id)[MEMORY[0x263EFF910] date];
    [v7 timeIntervalSince1970];
    v8 = (void *)v4;

    v14[1] = v8;
    id v9 = (id)[NSNumber numberWithLong:v8];
    v14[0] = (id)[v9 stringValue];

    id v10 = (id)[v17 URLByAppendingPathComponent:v15];
    id v13 = (id)[v10 URLByAppendingPathComponent:v14[0]];

    if (+[AMDMiscHelpers ensureDir:v13 removeIfExists:1])
    {
      id v24 = v13;
    }
    else
    {
      id v24 = 0;
    }
    int v16 = 1;
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v24 = 0;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  v5 = v24;

  return v5;
}

+ (id)saveColdStartBinaryforModel:(id)a3 atLocation:(id)a4 withVersion:(id)a5 error:(id *)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v50 = 0;
  objc_storeStrong(&v50, a4);
  id v49 = 0;
  objc_storeStrong(&v49, a5);
  v48 = a6;
  id v47 = (id)[MEMORY[0x263F08850] defaultManager];
  if ([v47 fileExistsAtPath:v50])
  {
    id v17 = (void *)MEMORY[0x263EFF8F8];
    id v18 = (id)[NSURL fileURLWithPath:v50];
    id v42 = (id)objc_msgSend(v17, "dataWithContentsOfURL:");

    int v41 = 6;
    uLong v40 = crc32(0, (const Bytef *)([v42 bytes] + 6), objc_msgSend(v42, "length") - 6);
    v39 = (int *)[v42 bytes];
    v38 = v39;
    unsigned __int16 v37 = 0;
    unsigned __int16 v37 = *(_WORD *)v39;
    if (v37)
    {
      id v36 = (id)[NSString stringWithFormat:@"Format mismatch. Expected format:0 got:%d Binary cannot be processed for model: %@", v37, location[0]];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v34 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v36);
        _os_log_error_impl(&dword_20ABD4000, oslog, v34, "%@", v58, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id *v48 = +[AMDError allocError:7 withMessage:v36];
      id v52 = 0;
      int v43 = 1;
      objc_storeStrong(&v36, 0);
    }
    else
    {
      v38 = (int *)((char *)v38 + 2);
      int v33 = 0;
      int v33 = *v38;
      if (v40 == v33)
      {
        id v29 = +[AMDColdstartOperation ensureNewDirectoryForBinaryWithModelId:location[0] andVersion:v49];
        id v28 = (id)[NSURL fileURLWithPath:v50 isDirectory:0];
        id v16 = (id)[v29 URLByAppendingPathComponent:@"coldstartbinary"];
        id v27 = (id)[v16 URLByAppendingPathExtension:@"bin"];

        if (([v47 copyItemAtURL:v28 toURL:v27 error:v48] & 1) != 0 && !*v48)
        {
          [v47 removeItemAtURL:v28 error:v48];
          if (*v48)
          {
            os_log_t v22 = (os_log_t)&_os_log_internal;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v55, (uint64_t)v50);
              _os_log_error_impl(&dword_20ABD4000, v22, OS_LOG_TYPE_ERROR, "could not delete downloaded Coldstart binary at location: %@", v55, 0xCu);
            }
            objc_storeStrong((id *)&v22, 0);
            id v52 = 0;
            int v43 = 1;
          }
          else
          {
            v53[0] = @"modelId";
            v54[0] = location[0];
            v53[1] = @"url";
            id v9 = (id)[v27 path];
            v54[1] = v9;
            v53[2] = @"version";
            id v8 = (id)[v49 stringValue];
            v54[2] = v8;
            id v52 = (id)[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

            int v43 = 1;
          }
        }
        else
        {
          os_log_t v26 = (os_log_t)&_os_log_internal;
          os_log_type_t v25 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v12 = v26;
            os_log_type_t v13 = v25;
            id v15 = (id)[NSURL URLWithString:v50];
            id v10 = v15;
            id v24 = v10;
            id v11 = v29;
            id v14 = (id)[*v48 localizedDescription];
            id v23 = v14;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v56, (uint64_t)v10, (uint64_t)v11, (uint64_t)v23);
            _os_log_error_impl(&dword_20ABD4000, v12, v13, "could not copy the compiled model from %@ to %@, %@", v56, 0x20u);

            objc_storeStrong(&v23, 0);
            objc_storeStrong(&v24, 0);
          }
          objc_storeStrong((id *)&v26, 0);
          id v52 = 0;
          int v43 = 1;
        }
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
      }
      else
      {
        id v32 = (id)[NSString stringWithFormat:@"CRC value mismatch. Binary cannot be processed for model: %@", location[0]];
        os_log_t v31 = (os_log_t)&_os_log_internal;
        os_log_type_t v30 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v57, (uint64_t)v32);
          _os_log_error_impl(&dword_20ABD4000, v31, v30, "%@", v57, 0xCu);
        }
        objc_storeStrong((id *)&v31, 0);
        id *v48 = +[AMDError allocError:7 withMessage:v32];
        id v52 = 0;
        int v43 = 1;
        objc_storeStrong(&v32, 0);
      }
    }
    objc_storeStrong(&v42, 0);
  }
  else
  {
    id v46 = (id)[NSString stringWithFormat:@"Binary unavailable at path: %@ for model: %@", v50, location[0]];
    id v45 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v45, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v46);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v45, type, "%@", v59, 0xCu);
    }
    objc_storeStrong(&v45, 0);
    id *v48 = +[AMDError allocError:15 withMessage:v46];
    id v52 = 0;
    int v43 = 1;
    objc_storeStrong(&v46, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(location, 0);
  v6 = v52;

  return v6;
}

+ (id)computeUpdatedScoresV2:(id)a3 withModel:(id)a4 andMappingDictionary:(id)a5
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v118 = 0;
  objc_storeStrong(&v118, a4);
  id v117 = 0;
  objc_storeStrong(&v117, a5);
  +[AMDPerf startMonitoringEvent:@"ColdStart"];
  id v116 = 0;
  if (v118)
  {
    id v110 = v116;
    id v40 = +[AMDColdstartURL getColdstartURLForModel:v118 error:&v110];
    objc_storeStrong(&v116, v110);
    id v111 = v40;
    if (v116)
    {
      id v109 = (id)[NSString stringWithFormat:@"Error retrieving binary file from Coredata for model: %@", v118];
      id v108 = &_os_log_internal;
      os_log_type_t v107 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v108, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v129, (uint64_t)v109);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v108, v107, "%@", v129, 0xCu);
      }
      objc_storeStrong(&v108, 0);
      +[AMDFrameworkMetrics log:v109 withKey:@"coldstartError" atVerbosity:2];
      id v120 = 0;
      int v112 = 1;
      objc_storeStrong(&v109, 0);
    }
    else if (v111)
    {
      id v103 = (id)[MEMORY[0x263F08850] defaultManager];
      if ([v103 fileExistsAtPath:v111])
      {
        id v98 = v116;
        id v39 = (id)[v103 attributesOfItemAtPath:v111 error:&v98];
        objc_storeStrong(&v116, v98);
        id v99 = v39;
        if (v116)
        {
          id v97 = (id)[NSString stringWithFormat:@"Error extracting attributes of file: %@ for model: %@", v111, v118];
          id v96 = &_os_log_internal;
          os_log_type_t v95 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled((os_log_t)v96, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v126, (uint64_t)v97);
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v96, v95, "%@", v126, 0xCu);
          }
          objc_storeStrong(&v96, 0);
          +[AMDFrameworkMetrics log:v97 withKey:@"coldstartError" atVerbosity:2];
          id v120 = 0;
          int v112 = 1;
          objc_storeStrong(&v97, 0);
        }
        else
        {
          uint64_t v94 = 0;
          id v37 = (id)[v99 objectForKey:*MEMORY[0x263F080B8]];
          uint64_t v38 = [v37 unsignedLongLongValue];

          uint64_t v94 = v38;
          int v93 = (v38 - 6) / 0x14uLL;
          id v92 = &_os_log_internal;
          os_log_type_t v91 = OS_LOG_TYPE_DEBUG;
          if (os_log_type_enabled((os_log_t)v92, OS_LOG_TYPE_DEBUG))
          {
            __os_log_helper_16_2_2_8_64_8_64((uint64_t)v125, (uint64_t)v111, (uint64_t)v118);
            _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v92, v91, "Loading Coldstart binary: %@ for model: %@", v125, 0x16u);
          }
          objc_storeStrong(&v92, 0);
          id v36 = (void *)MEMORY[0x263EFF8F8];
          id v35 = (id)[NSURL fileURLWithPath:v111];
          id v90 = (id)objc_msgSend(v36, "dataWithContentsOfURL:");

          if (v90)
          {
            unsigned int v86 = 0;
            unsigned int v86 = [v117 count];
            unsigned int v85 = v86;
            id v84 = (id)objc_opt_new();
            id v34 = v117;
            uint64_t v78 = MEMORY[0x263EF8330];
            int v79 = -1073741824;
            int v80 = 0;
            v81 = __79__AMDColdstartOperation_computeUpdatedScoresV2_withModel_andMappingDictionary___block_invoke;
            v82 = &unk_263FE26B8;
            id v83 = v84;
            [v34 enumerateKeysAndObjectsUsingBlock:&v78];
            id v77 = (id)[v84 copy];
            id v76 = (id)[v117 mutableCopy];
            v75 = (int *)malloc_type_malloc(4 * v93, 0x100004052888210uLL);
            v74 = (int *)malloc_type_malloc(4 * v93, 0x100004052888210uLL);
            v73 = (float *)malloc_type_malloc(4 * v93, 0x100004052888210uLL);
            id v72 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v75 length:malloc_size(v75)];
            id v71 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v74 length:malloc_size(v74)];
            id v70 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v73 length:malloc_size(v73)];
            id v69 = 0;
            uint64_t v68 = [v90 bytes];
            v67 = (uint64_t *)(v68 + 6);
            int v66 = 0;
            while (v66 < v93)
            {
              uint64_t v65 = 0;
              uint64_t v65 = *v67;
              id v33 = v77;
              id v32 = (id)[NSNumber numberWithUnsignedLongLong:v65];
              id v5 = (id)objc_msgSend(v33, "objectForKey:");
              BOOL v31 = v5 == 0;

              if (v31)
              {
                id v30 = v84;
                id v29 = (id)[NSNumber numberWithUnsignedLongLong:v65];
                id v6 = (id)objc_msgSend(v30, "objectForKey:");
                BOOL v28 = v6 != 0;

                if (v28)
                {
                  id v21 = v84;
                  id v20 = (id)[NSNumber numberWithUnsignedLongLong:v65];
                  id v64 = (id)objc_msgSend(v21, "objectForKey:");

                  v75[v66] = [v64 intValue];
                  objc_storeStrong(&v64, 0);
                }
                else
                {
                  id v27 = v84;
                  id v26 = (id)[NSNumber numberWithInt:v85];
                  id v25 = (id)[NSNumber numberWithUnsignedLongLong:v65];
                  objc_msgSend(v27, "setObject:forKey:", v26);

                  id v24 = v76;
                  id v23 = (id)[NSNumber numberWithUnsignedLongLong:v65];
                  id v22 = (id)[NSNumber numberWithInt:v85];
                  objc_msgSend(v24, "setObject:forKey:", v23);

                  v75[v66] = v85++;
                }
                ++v67;
                uint64_t v63 = 0;
                uint64_t v63 = *v67;
                id v19 = v84;
                id v18 = (id)[NSNumber numberWithUnsignedLongLong:v63];
                id v62 = (id)objc_msgSend(v19, "objectForKey:");

                v74[v66] = [v62 intValue];
                ++v67;
                float v61 = 0.0;
                float v61 = *(float *)v67;
                v67 = (uint64_t *)((char *)v67 + 4);
                v73[v66++] = v61;
                objc_storeStrong(&v62, 0);
              }
              else
              {
                v67 = (uint64_t *)((char *)v67 + 20);
                ++v66;
              }
            }
            uint64_t v60 = v66;
            unsigned __int8 v59 = 1;
            int v58 = 0;
            memset(__b, 0, sizeof(__b));
            LODWORD(v56) = 0;
            SparseConvertFromCoordinate(v56, v75, v74, v73, v85, v86, v66, 1u, (uint64_t)__b);
            v55 = malloc_type_malloc(4 * v93, 0x100004052888210uLL);
            v54 = malloc_type_malloc(4 * (int)v85, 0x100004052888210uLL);
            id v53 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v55 length:malloc_size(v55)];
            id v52 = (id)[MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v54 length:malloc_size(v54)];
            for (int i = 0; i < (unint64_t)[location[0] count]; ++i)
            {
              id v17 = (id)[location[0] objectAtIndex:i];
              [v17 floatValue];
              *((_DWORD *)v55 + i) = v7;
            }
            *(void *)&v50.count = v86;
            v50.data = (float *)v55;
            DenseVector_Float v49 = (DenseVector_Float)0;
            v49.count = v85;
            v49.data = (float *)v54;
            memcpy(&__dst, __b, sizeof(__dst));
            *(void *)&v133.count = v86;
            v133.data = (float *)v55;
            *(void *)&v134.count = *(void *)&v49.count;
            v134.data = (float *)v54;
            SparseMultiply(&__dst, v133, v134);
            for (signed int j = 0; j < (int)v86; ++j)
              *((_DWORD *)v54 + j) = *((_DWORD *)v55 + j);
            id v16 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:(int)v85];
            id v8 = v69;
            id v69 = v16;

            for (signed int k = 0; k < (int)v85; ++k)
            {
              id v15 = v69;
              LODWORD(v9) = *((_DWORD *)v54 + k);
              id v14 = (id)[NSNumber numberWithFloat:v9];
              objc_msgSend(v15, "addObject:");
            }
            id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            id v13 = (id)[NSNumber numberWithInt:v86];
            objc_msgSend(v45, "setObject:forKey:");

            id v12 = (id)[NSNumber numberWithInt:v85];
            objc_msgSend(v45, "setObject:forKey:");

            +[AMDFrameworkMetrics log:v45 withKey:@"coldstartSummary" atVerbosity:2];
            +[AMDPerf endMonitoringEvent:@"ColdStart"];
            objc_storeStrong(&v45, 0);
            objc_storeStrong(&v52, 0);
            objc_storeStrong(&v53, 0);
            if (v69)
            {
              v121[0] = @"recomputedScores";
              v122[0] = v69;
              v121[1] = @"updatedRemapdict";
              v122[1] = v76;
              id v120 = (id)[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:2];
              int v112 = 1;
            }
            else
            {
              id v44 = (id)[NSString stringWithFormat:@"Coldstart: Error computing updated scores"];
              os_log_t oslog = (os_log_t)&_os_log_internal;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v123, (uint64_t)v44);
                _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v123, 0xCu);
              }
              objc_storeStrong((id *)&oslog, 0);
              +[AMDFrameworkMetrics log:v44 withKey:@"coldstartError" atVerbosity:2];
              id v120 = 0;
              int v112 = 1;
              objc_storeStrong(&v44, 0);
            }
            objc_storeStrong(&v69, 0);
            objc_storeStrong(&v70, 0);
            objc_storeStrong(&v71, 0);
            objc_storeStrong(&v72, 0);
            objc_storeStrong(&v76, 0);
            objc_storeStrong(&v77, 0);
            objc_storeStrong(&v83, 0);
            objc_storeStrong(&v84, 0);
          }
          else
          {
            id v89 = (id)[NSString stringWithFormat:@"could not read from file %@", v111];
            id v88 = &_os_log_internal;
            os_log_type_t v87 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled((os_log_t)v88, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v124, (uint64_t)v89);
              _os_log_error_impl(&dword_20ABD4000, (os_log_t)v88, v87, "%@", v124, 0xCu);
            }
            objc_storeStrong(&v88, 0);
            +[AMDFrameworkMetrics log:v89 withKey:@"coldstartError" atVerbosity:2];
            id v120 = 0;
            int v112 = 1;
            objc_storeStrong(&v89, 0);
          }
          objc_storeStrong(&v90, 0);
        }
        objc_storeStrong(&v99, 0);
      }
      else
      {
        id v102 = (id)[NSString stringWithFormat:@"Binary unavailable at path: %@ for model: %@", v111, v118];
        id v101 = &_os_log_internal;
        os_log_type_t v100 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v127, (uint64_t)v102);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v101, v100, "%@", v127, 0xCu);
        }
        objc_storeStrong(&v101, 0);
        +[AMDFrameworkMetrics log:v102 withKey:@"coldstartError" atVerbosity:2];
        id v120 = 0;
        int v112 = 1;
        objc_storeStrong(&v102, 0);
      }
      objc_storeStrong(&v103, 0);
    }
    else
    {
      id v106 = (id)[NSString stringWithFormat:@"Coldstart binary missing for model: %@", v118];
      id v105 = &_os_log_internal;
      os_log_type_t v104 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v105, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v128, (uint64_t)v106);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v105, v104, "%@", v128, 0xCu);
      }
      objc_storeStrong(&v105, 0);
      +[AMDFrameworkMetrics log:v106 withKey:@"coldstartError" atVerbosity:2];
      id v120 = 0;
      int v112 = 1;
      objc_storeStrong(&v106, 0);
    }
    objc_storeStrong(&v111, 0);
  }
  else
  {
    id v115 = (id)[NSString stringWithFormat:@"Coldstart modelId being passed is nil"];
    id v114 = &_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v114, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v130, (uint64_t)v115);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v114, type, "%@", v130, 0xCu);
    }
    objc_storeStrong(&v114, 0);
    +[AMDFrameworkMetrics log:v115 withKey:@"coldstartError" atVerbosity:2];
    id v120 = 0;
    int v112 = 1;
    objc_storeStrong(&v115, 0);
  }
  objc_storeStrong(&v116, 0);
  objc_storeStrong(&v117, 0);
  objc_storeStrong(&v118, 0);
  objc_storeStrong(location, 0);
  id v10 = v120;

  return v10;
}

void __79__AMDColdstartOperation_computeUpdatedScoresV2_withModel_andMappingDictionary___block_invoke(id *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = 0;
  objc_storeStrong(&v5, a3);
  [a1[4] setObject:location[0] forKeyedSubscript:v5];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

@end