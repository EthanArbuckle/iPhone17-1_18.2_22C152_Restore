@interface AMDFeatureDescriptor
+ (id)getDataType:(id)a3;
- (AMDFeatureDescriptor)initWithDictionary:(id)a3 withUserId:(id)a4 featureName:(id)a5;
- (AMDFeatureDescriptor)initWithDictionaryV2:(id)a3 withUserId:(id)a4 featureName:(id)a5 withDomain:(id)a6;
- (BOOL)checkJoinParameters;
- (BOOL)doOuterJoin;
- (NSArray)joinRequiredColumns;
- (NSDictionary)defaultJoinValueDict;
- (NSFetchRequest)fetchRequest;
- (NSMutableArray)aggregatedPropertyList;
- (NSMutableDictionary)propertyDict;
- (NSNumber)maxRecords;
- (NSNumber)sortOrder;
- (NSObject)defaultJoinValue;
- (NSString)aggregatedProperty;
- (NSString)featureName;
- (NSString)joinTable;
- (NSString)joinTableDomain;
- (NSString)joinType;
- (NSString)keyProperty;
- (NSString)sortKey;
- (NSString)version;
- (id)getFeature:(id *)a3;
- (id)getFeatureData:(id *)a3;
- (id)performInnerJoin:(id)a3;
- (id)performOuterJoin:(id)a3;
- (id)prepareArrayResult:(id)a3;
- (id)prepareDictionaryResult:(id)a3;
- (id)prepareResult:(id)a3;
- (id)sort:(id)a3;
- (id)transformTPDataForJoin:(id)a3;
- (void)outerJoin:(id)a3;
- (void)setAggregatedProperty:(id)a3;
- (void)setAggregatedPropertyList:(id)a3;
- (void)setDefaultJoinValue:(id)a3;
- (void)setDefaultJoinValueDict:(id)a3;
- (void)setDoOuterJoin:(BOOL)a3;
- (void)setFeatureName:(id)a3;
- (void)setFetchRequest:(id)a3;
- (void)setJoinRequiredColumns:(id)a3;
- (void)setJoinTable:(id)a3;
- (void)setJoinTableDomain:(id)a3;
- (void)setJoinType:(id)a3;
- (void)setKeyProperty:(id)a3;
- (void)setMaxRecords:(id)a3;
- (void)setPropertyDict:(id)a3;
- (void)setSortKey:(id)a3;
- (void)setSortOrder:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation AMDFeatureDescriptor

+ (id)getDataType:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!getDataType__typeDict)
  {
    id v11 = objc_alloc(NSDictionary);
    unint64_t v10 = 0x263F08000uLL;
    id v18 = (id)[NSNumber numberWithUnsignedInteger:100];
    id v17 = (id)[NSNumber numberWithUnsignedInteger:200];
    id v16 = (id)[NSNumber numberWithUnsignedInteger:300];
    id v15 = (id)[NSNumber numberWithUnsignedInteger:600];
    id v14 = (id)[NSNumber numberWithUnsignedInteger:500];
    id v13 = (id)[NSNumber numberWithUnsignedInteger:700];
    v12 = &v7;
    uint64_t v3 = objc_msgSend(v11, "initWithObjectsAndKeys:", v18, @"int16", v17, @"int32", v16, @"int64", v15, @"float32", v14, @"double", v13, @"string", 0);
    v4 = (void *)getDataType__typeDict;
    getDataType__typeDict = v3;
  }
  v8 = location;
  id v9 = (id)[(id)getDataType__typeDict valueForKey:location[0]];
  objc_storeStrong(v8, 0);
  id v5 = v9;

  return v5;
}

- (AMDFeatureDescriptor)initWithDictionary:(id)a3 withUserId:(id)a4 featureName:(id)a5
{
  uint64_t v136 = *MEMORY[0x263EF8340];
  id v127 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v125 = 0;
  objc_storeStrong(&v125, a4);
  id v124 = 0;
  objc_storeStrong(&v124, a5);
  id v5 = v127;
  id v127 = 0;
  v123.receiver = v5;
  v123.super_class = (Class)AMDFeatureDescriptor;
  id v127 = [(AMDFeatureDescriptor *)&v123 init];
  objc_storeStrong(&v127, v127);
  [v127 setFeatureName:v124];
  [v127 setVersion:@"v1"];
  id v122 = (id)[location[0] valueForKey:@"source_entity"];
  if (v122)
  {
    id v64 = (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:v122];
    objc_msgSend(v127, "setFetchRequest:");

    id v65 = (id)[v127 fetchRequest];
    [v65 setResultType:2];

    id v117 = (id)[location[0] valueForKey:@"properties_to_fetch"];
    if (!v117 || ![v117 count])
    {
      os_log_t v116 = (os_log_t)&_os_log_internal;
      os_log_type_t v115 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      {
        v62 = v116;
        os_log_type_t v63 = v115;
        __os_log_helper_16_0_0(v114);
        _os_log_error_impl(&dword_20ABD4000, v62, v63, "Missng property descriptors", v114, 2u);
      }
      objc_storeStrong((id *)&v116, 0);
      v128 = 0;
      int v118 = 1;
LABEL_93:
      objc_storeStrong(&v117, 0);
      goto LABEL_94;
    }
    if ((unint64_t)[v117 count] > 2)
    {
      os_log_t v113 = (os_log_t)&_os_log_internal;
      os_log_type_t v112 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v60 = v113;
        os_log_type_t v61 = v112;
        __os_log_helper_16_0_0(v111);
        _os_log_error_impl(&dword_20ABD4000, v60, v61, "More than two property descriptors found", v111, 2u);
      }
      objc_storeStrong((id *)&v113, 0);
      v128 = 0;
      int v118 = 1;
      goto LABEL_93;
    }
    id v110 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v117, "count"));
    memset(__b, 0, sizeof(__b));
    id v58 = v117;
    uint64_t v59 = [v58 countByEnumeratingWithState:__b objects:v135 count:16];
    if (!v59)
    {
LABEL_51:
      int v118 = 0;
LABEL_52:

      if (!v118)
      {
        id v36 = (id)[v127 fetchRequest];
        [v36 setPropertiesToFetch:v110];

        id v88 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v37 = (id)[&unk_26BEC3340 objectForKey:v122];

        if (v37)
        {
          id v87 = (id)[NSString stringWithFormat:@"userId == %@", v125];
          id v34 = v88;
          id v35 = (id)[MEMORY[0x263F08A98] predicateWithFormat:v87];
          objc_msgSend(v34, "addObject:");

          objc_storeStrong(&v87, 0);
        }
        id v86 = (id)[location[0] valueForKey:@"predicates"];
        if (v86)
        {
          memset(v84, 0, sizeof(v84));
          id v32 = v86;
          uint64_t v33 = [v32 countByEnumeratingWithState:v84 objects:v130 count:16];
          if (v33)
          {
            uint64_t v29 = *(void *)v84[2];
            uint64_t v30 = 0;
            unint64_t v31 = v33;
            while (1)
            {
              uint64_t v28 = v30;
              if (*(void *)v84[2] != v29) {
                objc_enumerationMutation(v32);
              }
              uint64_t v85 = *(void *)(v84[1] + 8 * v30);
              id v26 = v88;
              id v27 = (id)[MEMORY[0x263F08A98] predicateWithFormat:v85];
              objc_msgSend(v26, "addObject:");

              ++v30;
              if (v28 + 1 >= v31)
              {
                uint64_t v30 = 0;
                unint64_t v31 = [v32 countByEnumeratingWithState:v84 objects:v130 count:16];
                if (!v31) {
                  break;
                }
              }
            }
          }
        }
        id v83 = (id)[location[0] objectForKey:@"only_local_data"];
        if (v83 && ([v83 BOOLValue] & 1) != 0)
        {
          id v82 = 0;
          id v80 = 0;
          id v25 = +[AMDDataSync fetchDeviceID:&v80];
          objc_storeStrong(&v82, v80);
          id v81 = v25;
          if (v82 || !v81)
          {
            os_log_t v79 = (os_log_t)&_os_log_internal;
            os_log_type_t v78 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            {
              v21 = v79;
              os_log_type_t v22 = v78;
              __os_log_helper_16_0_0(v77);
              _os_log_error_impl(&dword_20ABD4000, v21, v22, "Local device Id could not be fetched", v77, 2u);
            }
            objc_storeStrong((id *)&v79, 0);
          }
          else
          {
            id v23 = v88;
            id v24 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"deviceId == %@", v81];
            objc_msgSend(v23, "addObject:");
          }
          objc_storeStrong(&v81, 0);
          objc_storeStrong(&v82, 0);
        }
        id v19 = (id)[v127 fetchRequest];
        id v18 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v88];
        objc_msgSend(v19, "setPredicate:");

        id v6 = (id)[v127 aggregatedProperty];
        BOOL v20 = v6 == 0;

        if (!v20)
        {
          id v17 = (id)[v127 fetchRequest];
          id v16 = (id)[v127 keyProperty];
          id v129 = v16;
          id v15 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v129 count:1];
          objc_msgSend(v17, "setPropertiesToGroupBy:");
        }
        id v76 = (id)[location[0] valueForKey:@"sort_descriptors"];
        if (v76 && [v76 count])
        {
          id v14 = (id)[v76 firstObject];
          id v13 = (id)[v14 objectForKey:@"sort_order"];
          objc_msgSend(v127, "setSortOrder:");
        }
        id v11 = (id)[location[0] valueForKey:@"num_records"];
        objc_msgSend(v127, "setMaxRecords:");

        id v12 = (id)[v127 maxRecords];
        char v74 = 0;
        char v72 = 0;
        if (v12
          && (id v75 = (id)[v127 maxRecords],
              char v74 = 1,
              [v75 integerValue] > 0))
        {
          id v73 = (id)[v127 maxRecords];
          char v72 = 1;
          id v10 = v73;
        }
        else
        {
          id v10 = &unk_26BEC2348;
        }
        [v127 setMaxRecords:v10];
        if (v72) {

        }
        if (v74) {
        id v71 = (id)[location[0] valueForKey:@"do_outer_join"];
        }
        if (v71) {
          int v9 = [v71 intValue];
        }
        else {
          int v9 = 1;
        }
        [v127 setDoOuterJoin:v9 != 0];
        id v70 = (id)[location[0] valueForKey:@"default_join_values"];
        if (v70) {
          id v8 = v70;
        }
        else {
          id v8 = &unk_26BEC2360;
        }
        [v127 setDefaultJoinValue:v8];
        v128 = (AMDFeatureDescriptor *)v127;
        int v118 = 1;
        objc_storeStrong(&v70, 0);
        objc_storeStrong(&v71, 0);
        objc_storeStrong(&v76, 0);
        objc_storeStrong(&v83, 0);
        objc_storeStrong(&v86, 0);
        objc_storeStrong(&v88, 0);
      }
      objc_storeStrong(&v110, 0);
      goto LABEL_93;
    }
    uint64_t v55 = *(void *)__b[2];
    uint64_t v56 = 0;
    unint64_t v57 = v59;
    while (1)
    {
      uint64_t v54 = v56;
      if (*(void *)__b[2] != v55) {
        objc_enumerationMutation(v58);
      }
      id v109 = *(id *)(__b[1] + 8 * v56);
      id v107 = (id)[v109 valueForKey:@"property_name"];
      if (!v107)
      {
        os_log_t v106 = (os_log_t)&_os_log_internal;
        os_log_type_t v105 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
        {
          v52 = v106;
          os_log_type_t v53 = v105;
          __os_log_helper_16_0_0(v104);
          _os_log_error_impl(&dword_20ABD4000, v52, v53, "Missng property name", v104, 2u);
        }
        objc_storeStrong((id *)&v106, 0);
        v128 = 0;
        int v118 = 1;
        goto LABEL_48;
      }
      id v103 = (id)[v109 valueForKey:@"aggregator_function"];
      if (v103)
      {
        id v102 = (id)[v109 valueForKey:@"aggregated_data_type"];
        if (v102)
        {
          id v99 = +[AMDFeatureDescriptor getDataType:v102];
          if (v99)
          {
            id v96 = (id)[v109 valueForKey:@"aggregator_keys"];
            if ([v96 count])
            {
              id v93 = objc_alloc_init(MEMORY[0x263EFF980]);
              memset(v91, 0, sizeof(v91));
              id v44 = v96;
              uint64_t v45 = [v44 countByEnumeratingWithState:v91 objects:v131 count:16];
              if (v45)
              {
                uint64_t v41 = *(void *)v91[2];
                uint64_t v42 = 0;
                unint64_t v43 = v45;
                while (1)
                {
                  uint64_t v40 = v42;
                  if (*(void *)v91[2] != v41) {
                    objc_enumerationMutation(v44);
                  }
                  uint64_t v92 = *(void *)(v91[1] + 8 * v42);
                  id v38 = v93;
                  id v39 = (id)[MEMORY[0x263F087F0] expressionForKeyPath:v92];
                  objc_msgSend(v38, "addObject:");

                  ++v42;
                  if (v40 + 1 >= v43)
                  {
                    uint64_t v42 = 0;
                    unint64_t v43 = [v44 countByEnumeratingWithState:v91 objects:v131 count:16];
                    if (!v43) {
                      break;
                    }
                  }
                }
              }

              id v90 = (id)[MEMORY[0x263F087F0] expressionForFunction:v103 arguments:v93];
              id v89 = objc_alloc_init(MEMORY[0x263EFF248]);
              [v89 setName:v107];
              objc_msgSend(v89, "setExpressionResultType:", objc_msgSend(v99, "unsignedIntegerValue"));
              [v89 setExpression:v90];
              [v110 addObject:v89];
              [v127 setAggregatedProperty:v107];
              objc_storeStrong(&v89, 0);
              objc_storeStrong(&v90, 0);
              objc_storeStrong(&v93, 0);
              int v118 = 0;
            }
            else
            {
              os_log_t v95 = (os_log_t)&_os_log_internal;
              os_log_type_t v94 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
              {
                v46 = v95;
                os_log_type_t v47 = v94;
                __os_log_helper_16_2_1_8_64((uint64_t)v132, (uint64_t)v107);
                _os_log_error_impl(&dword_20ABD4000, v46, v47, "No aggregator keys for aggregated property %@", v132, 0xCu);
              }
              objc_storeStrong((id *)&v95, 0);
              v128 = 0;
              int v118 = 1;
            }
            objc_storeStrong(&v96, 0);
          }
          else
          {
            os_log_t v98 = (os_log_t)&_os_log_internal;
            os_log_type_t v97 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
            {
              v48 = v98;
              os_log_type_t v49 = v97;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v133, (uint64_t)v107, (uint64_t)v102);
              _os_log_error_impl(&dword_20ABD4000, v48, v49, "Invalid data type for aggregated property %@: %@", v133, 0x16u);
            }
            objc_storeStrong((id *)&v98, 0);
            v128 = 0;
            int v118 = 1;
          }
          objc_storeStrong(&v99, 0);
        }
        else
        {
          os_log_t v101 = (os_log_t)&_os_log_internal;
          os_log_type_t v100 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            v50 = v101;
            os_log_type_t v51 = v100;
            __os_log_helper_16_2_1_8_64((uint64_t)v134, (uint64_t)v107);
            _os_log_error_impl(&dword_20ABD4000, v50, v51, "Missng data type for aggregated property %@", v134, 0xCu);
          }
          objc_storeStrong((id *)&v101, 0);
          v128 = 0;
          int v118 = 1;
        }
        objc_storeStrong(&v102, 0);
        if (v118) {
          goto LABEL_47;
        }
      }
      else
      {
        [v110 addObject:v107];
        [v127 setKeyProperty:v107];
      }
      int v118 = 0;
LABEL_47:
      objc_storeStrong(&v103, 0);
LABEL_48:
      objc_storeStrong(&v107, 0);
      if (v118) {
        goto LABEL_52;
      }
      ++v56;
      if (v54 + 1 >= v57)
      {
        uint64_t v56 = 0;
        unint64_t v57 = [v58 countByEnumeratingWithState:__b objects:v135 count:16];
        if (!v57) {
          goto LABEL_51;
        }
      }
    }
  }
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v67 = type;
    __os_log_helper_16_0_0(v119);
    _os_log_error_impl(&dword_20ABD4000, log, v67, "Missing entity name", v119, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v128 = 0;
  int v118 = 1;
LABEL_94:
  objc_storeStrong(&v122, 0);
  objc_storeStrong(&v124, 0);
  objc_storeStrong(&v125, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v127, 0);
  return v128;
}

- (AMDFeatureDescriptor)initWithDictionaryV2:(id)a3 withUserId:(id)a4 featureName:(id)a5 withDomain:(id)a6
{
  uint64_t v191 = *MEMORY[0x263EF8340];
  id v182 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v180 = 0;
  objc_storeStrong(&v180, a4);
  id v179 = 0;
  objc_storeStrong(&v179, a5);
  id v178 = 0;
  objc_storeStrong(&v178, a6);
  id v6 = v182;
  id v182 = 0;
  v177.receiver = v6;
  v177.super_class = (Class)AMDFeatureDescriptor;
  id v182 = [(AMDFeatureDescriptor *)&v177 init];
  objc_storeStrong(&v182, v182);
  [v182 setFeatureName:v179];
  [v182 setVersion:@"v2"];
  id v176 = (id)[location[0] valueForKey:@"source_entity"];
  if (v176)
  {
    id v91 = (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:v176];
    objc_msgSend(v182, "setFetchRequest:");

    id v92 = (id)[v182 fetchRequest];
    [v92 setResultType:2];

    id v171 = (id)[location[0] valueForKey:@"properties_to_fetch"];
    if (!v171 || ![v171 count])
    {
      os_log_t v170 = (os_log_t)&_os_log_internal;
      os_log_type_t v169 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v170, OS_LOG_TYPE_ERROR))
      {
        id v89 = v170;
        os_log_type_t v90 = v169;
        __os_log_helper_16_0_0(v168);
        _os_log_error_impl(&dword_20ABD4000, v89, v90, "Missng property descriptors", v168, 2u);
      }
      objc_storeStrong((id *)&v170, 0);
      v183 = 0;
      int v172 = 1;
LABEL_131:
      objc_storeStrong(&v171, 0);
      goto LABEL_132;
    }
    id v167 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v171, "count"));
    char v166 = 0;
    id v86 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    objc_msgSend(v182, "setPropertyDict:");

    memset(__b, 0, sizeof(__b));
    id v87 = v171;
    uint64_t v88 = [v87 countByEnumeratingWithState:__b objects:v190 count:16];
    if (!v88)
    {
LABEL_59:
      int v172 = 0;
LABEL_60:

      if (!v172)
      {
        id v55 = (id)[v182 fetchRequest];
        [v55 setPropertiesToFetch:v167];

        id v137 = (id)[location[0] objectForKey:@"having_predicate"];
        if ((v166 & 1) != 0 && v137 && [v137 count])
        {
          id v136 = objc_alloc_init(MEMORY[0x263EFF980]);
          memset(v134, 0, sizeof(v134));
          id v53 = v137;
          uint64_t v54 = [v53 countByEnumeratingWithState:v134 objects:v185 count:16];
          if (v54)
          {
            uint64_t v50 = *(void *)v134[2];
            uint64_t v51 = 0;
            unint64_t v52 = v54;
            while (1)
            {
              uint64_t v49 = v51;
              if (*(void *)v134[2] != v50) {
                objc_enumerationMutation(v53);
              }
              id v135 = *(id *)(v134[1] + 8 * v51);
              id v133 = (id)[v135 objectForKey:@"variable_name"];
              id v132 = (id)[v135 objectForKey:@"predicate"];
              if (v133 && v132)
              {
                id v128 = (id)[MEMORY[0x263F087F0] expressionForVariable:v133];
                id v127 = (id)[@"%@ " stringByAppendingString:v132];
                id v126 = (id)objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", v127, v128);
                [v136 addObject:v126];
                objc_storeStrong(&v126, 0);
                objc_storeStrong(&v127, 0);
                objc_storeStrong(&v128, 0);
                int v172 = 0;
              }
              else
              {
                os_log_t v131 = (os_log_t)&_os_log_internal;
                os_log_type_t v130 = OS_LOG_TYPE_ERROR;
                if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
                {
                  os_log_type_t v47 = v131;
                  os_log_type_t v48 = v130;
                  __os_log_helper_16_0_0(v129);
                  _os_log_error_impl(&dword_20ABD4000, v47, v48, "Incomplete predicate dictionary within the having predicate", v129, 2u);
                }
                objc_storeStrong((id *)&v131, 0);
                int v172 = 7;
              }
              objc_storeStrong(&v132, 0);
              objc_storeStrong(&v133, 0);
              ++v51;
              if (v49 + 1 >= v52)
              {
                uint64_t v51 = 0;
                unint64_t v52 = [v53 countByEnumeratingWithState:v134 objects:v185 count:16];
                if (!v52) {
                  break;
                }
              }
            }
          }

          id v125 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v136];
          id v46 = (id)[v182 fetchRequest];
          [v46 setHavingPredicate:v125];

          objc_storeStrong(&v125, 0);
          objc_storeStrong(&v136, 0);
        }
        id v124 = objc_alloc_init(MEMORY[0x263EFF980]);
        id v45 = (id)[&unk_26BEC3368 objectForKey:v176];

        if (v45)
        {
          id v123 = (id)[NSString stringWithFormat:@"userId == %@", v180];
          id v43 = v124;
          id v44 = (id)[MEMORY[0x263F08A98] predicateWithFormat:v123];
          objc_msgSend(v43, "addObject:");

          objc_storeStrong(&v123, 0);
        }
        id v122 = (id)[location[0] objectForKey:@"only_local_data"];
        if (v122 && ([v122 BOOLValue] & 1) != 0)
        {
          id v121 = 0;
          id v119 = 0;
          id v42 = +[AMDDataSync fetchDeviceID:&v119];
          objc_storeStrong(&v121, v119);
          id v120 = v42;
          if (v121 || !v120)
          {
            os_log_t v118 = (os_log_t)&_os_log_internal;
            os_log_type_t v117 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              id v38 = v118;
              os_log_type_t v39 = v117;
              __os_log_helper_16_0_0(v116);
              _os_log_error_impl(&dword_20ABD4000, v38, v39, "Local device Id could not be fetched", v116, 2u);
            }
            objc_storeStrong((id *)&v118, 0);
          }
          else
          {
            id v40 = v124;
            id v41 = (id)[MEMORY[0x263F08A98] predicateWithFormat:@"deviceId == %@", v120];
            objc_msgSend(v40, "addObject:");
          }
          objc_storeStrong(&v120, 0);
          objc_storeStrong(&v121, 0);
        }
        id v115 = (id)[location[0] valueForKey:@"predicates"];
        if (v115)
        {
          memset(v113, 0, sizeof(v113));
          id v36 = v115;
          uint64_t v37 = [v36 countByEnumeratingWithState:v113 objects:v184 count:16];
          if (v37)
          {
            uint64_t v33 = *(void *)v113[2];
            uint64_t v34 = 0;
            unint64_t v35 = v37;
            while (1)
            {
              uint64_t v32 = v34;
              if (*(void *)v113[2] != v33) {
                objc_enumerationMutation(v36);
              }
              uint64_t v114 = *(void *)(v113[1] + 8 * v34);
              id v30 = v124;
              id v31 = (id)[MEMORY[0x263F08A98] predicateWithFormat:v114];
              objc_msgSend(v30, "addObject:");

              ++v34;
              if (v32 + 1 >= v35)
              {
                uint64_t v34 = 0;
                unint64_t v35 = [v36 countByEnumeratingWithState:v113 objects:v184 count:16];
                if (!v35) {
                  break;
                }
              }
            }
          }
        }
        id v29 = (id)[v182 fetchRequest];
        id v28 = (id)[MEMORY[0x263F08730] andPredicateWithSubpredicates:v124];
        objc_msgSend(v29, "setPredicate:");

        id v112 = (id)[location[0] objectForKey:@"group_by_descriptors"];
        if (v112)
        {
          id v24 = (id)[v182 aggregatedPropertyList];
          char v107 = 0;
          BOOL v25 = 0;
          if (v24)
          {
            id v108 = (id)[v182 aggregatedPropertyList];
            char v107 = 1;
            BOOL v25 = 0;
            if ([v108 count]) {
              BOOL v25 = [v112 count] != 0;
            }
          }
          if (v107) {

          }
          if (v25)
          {
            id v23 = (id)[v182 fetchRequest];
            [v23 setPropertiesToGroupBy:v112];
          }
          id v106 = (id)[location[0] valueForKey:@"sort_descriptors"];
          if (v106 && [v106 count])
          {
            id v20 = (id)[v106 firstObject];
            id v19 = (id)[v20 objectForKey:@"sort_order"];
            objc_msgSend(v182, "setSortOrder:");

            id v22 = (id)[v106 firstObject];
            id v21 = (id)[v22 objectForKey:@"sort_key"];
            objc_msgSend(v182, "setSortKey:");
          }
          id v17 = (id)[location[0] valueForKey:@"num_records"];
          objc_msgSend(v182, "setMaxRecords:");

          id v18 = (id)[v182 maxRecords];
          char v104 = 0;
          char v102 = 0;
          if (v18
            && (id v105 = (id)[v182 maxRecords],
                char v104 = 1,
                [v105 integerValue] > 0))
          {
            id v103 = (id)[v182 maxRecords];
            char v102 = 1;
            id v16 = v103;
          }
          else
          {
            id v16 = &unk_26BEC2348;
          }
          [v182 setMaxRecords:v16];
          if (v102) {

          }
          if (v104) {
          id v101 = (id)[location[0] objectForKey:@"join_descriptors"];
          }
          char v99 = 0;
          BOOL v15 = 0;
          if (v101)
          {
            id v100 = (id)[v101 firstObject];
            char v99 = 1;
            BOOL v15 = v100 != 0;
          }
          if (v99) {

          }
          if (!v15) {
            goto LABEL_127;
          }
          id v98 = (id)[v101 firstObject];
          id v10 = (id)[v98 objectForKey:@"key"];
          objc_msgSend(v182, "setKeyProperty:");

          id v11 = (id)[v98 objectForKey:@"type"];
          objc_msgSend(v182, "setJoinType:");

          id v12 = (id)[v98 objectForKey:@"table"];
          objc_msgSend(v182, "setJoinTable:");

          id v13 = (id)[v98 objectForKey:@"default_join_values"];
          objc_msgSend(v182, "setDefaultJoinValueDict:");

          id v14 = (id)[v98 objectForKey:@"columns_to_fetch"];
          objc_msgSend(v182, "setJoinRequiredColumns:");

          [v182 setJoinTableDomain:v178];
          if ([v182 checkJoinParameters])
          {
            int v172 = 0;
          }
          else
          {
            v183 = 0;
            int v172 = 1;
          }
          objc_storeStrong(&v98, 0);
          if (!v172)
          {
LABEL_127:
            v183 = (AMDFeatureDescriptor *)v182;
            int v172 = 1;
          }
          objc_storeStrong(&v101, 0);
          objc_storeStrong(&v106, 0);
        }
        else
        {
          os_log_t v111 = (os_log_t)&_os_log_internal;
          os_log_type_t v110 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
          {
            id v26 = v111;
            os_log_type_t v27 = v110;
            __os_log_helper_16_0_0(v109);
            _os_log_error_impl(&dword_20ABD4000, v26, v27, "Properties to group by array is absent", v109, 2u);
          }
          objc_storeStrong((id *)&v111, 0);
          v183 = 0;
          int v172 = 1;
        }
        objc_storeStrong(&v112, 0);
        objc_storeStrong(&v115, 0);
        objc_storeStrong(&v122, 0);
        objc_storeStrong(&v124, 0);
        objc_storeStrong(&v137, 0);
      }
      objc_storeStrong(&v167, 0);
      goto LABEL_131;
    }
    uint64_t v83 = *(void *)__b[2];
    uint64_t v84 = 0;
    unint64_t v85 = v88;
    while (1)
    {
      uint64_t v82 = v84;
      if (*(void *)__b[2] != v83) {
        objc_enumerationMutation(v87);
      }
      id v165 = *(id *)(__b[1] + 8 * v84);
      id v163 = (id)[v165 valueForKey:@"property_name"];
      if (!v163)
      {
        os_log_t v162 = (os_log_t)&_os_log_internal;
        os_log_type_t v161 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
        {
          id v80 = v162;
          os_log_type_t v81 = v161;
          __os_log_helper_16_0_0(v160);
          _os_log_error_impl(&dword_20ABD4000, v80, v81, "Missng property name", v160, 2u);
        }
        objc_storeStrong((id *)&v162, 0);
        v183 = 0;
        int v172 = 1;
        goto LABEL_56;
      }
      id v159 = (id)[v165 valueForKey:@"aggregator_function"];
      if (v159)
      {
        char v166 = 1;
        id v8 = (id)[v182 aggregatedPropertyList];
        BOOL v73 = v8 != 0;

        if (!v73)
        {
          id v72 = objc_alloc_init(MEMORY[0x263EFF980]);
          objc_msgSend(v182, "setAggregatedPropertyList:");
        }
        id v151 = (id)[v165 valueForKey:@"aggregated_data_type"];
        if (v151)
        {
          id v148 = +[AMDFeatureDescriptor getDataType:v151];
          if (v148)
          {
            id v145 = (id)[v165 valueForKey:@"aggregator_keys"];
            if ([v145 count])
            {
              id v142 = objc_alloc_init(MEMORY[0x263EFF980]);
              memset(v140, 0, sizeof(v140));
              id v64 = v145;
              uint64_t v65 = [v64 countByEnumeratingWithState:v140 objects:v186 count:16];
              if (v65)
              {
                uint64_t v61 = *(void *)v140[2];
                uint64_t v62 = 0;
                unint64_t v63 = v65;
                while (1)
                {
                  uint64_t v60 = v62;
                  if (*(void *)v140[2] != v61) {
                    objc_enumerationMutation(v64);
                  }
                  uint64_t v141 = *(void *)(v140[1] + 8 * v62);
                  id v58 = v142;
                  id v59 = (id)[MEMORY[0x263F087F0] expressionForKeyPath:v141];
                  objc_msgSend(v58, "addObject:");

                  ++v62;
                  if (v60 + 1 >= v63)
                  {
                    uint64_t v62 = 0;
                    unint64_t v63 = [v64 countByEnumeratingWithState:v140 objects:v186 count:16];
                    if (!v63) {
                      break;
                    }
                  }
                }
              }

              id v139 = (id)[MEMORY[0x263F087F0] expressionForFunction:v159 arguments:v142];
              id v138 = objc_alloc_init(MEMORY[0x263EFF248]);
              [v138 setName:v163];
              objc_msgSend(v138, "setExpressionResultType:", objc_msgSend(v148, "unsignedIntegerValue"));
              [v138 setExpression:v139];
              [v167 addObject:v138];
              [v182 setAggregatedProperty:v163];
              id v56 = (id)[v182 aggregatedPropertyList];
              [v56 addObject:v163];

              id v57 = (id)[v182 propertyDict];
              [v57 setObject:v151 forKey:v163];

              objc_storeStrong(&v138, 0);
              objc_storeStrong(&v139, 0);
              objc_storeStrong(&v142, 0);
              int v172 = 0;
            }
            else
            {
              os_log_t v144 = (os_log_t)&_os_log_internal;
              os_log_type_t v143 = OS_LOG_TYPE_ERROR;
              if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
              {
                v66 = v144;
                os_log_type_t v67 = v143;
                __os_log_helper_16_2_1_8_64((uint64_t)v187, (uint64_t)v163);
                _os_log_error_impl(&dword_20ABD4000, v66, v67, "No aggregator keys for aggregated property %@", v187, 0xCu);
              }
              objc_storeStrong((id *)&v144, 0);
              v183 = 0;
              int v172 = 1;
            }
            objc_storeStrong(&v145, 0);
          }
          else
          {
            os_log_t v147 = (os_log_t)&_os_log_internal;
            os_log_type_t v146 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            {
              v68 = v147;
              os_log_type_t v69 = v146;
              __os_log_helper_16_2_2_8_64_8_64((uint64_t)v188, (uint64_t)v163, (uint64_t)v151);
              _os_log_error_impl(&dword_20ABD4000, v68, v69, "Invalid data type for aggregated property %@: %@", v188, 0x16u);
            }
            objc_storeStrong((id *)&v147, 0);
            v183 = 0;
            int v172 = 1;
          }
          objc_storeStrong(&v148, 0);
        }
        else
        {
          os_log_t v150 = (os_log_t)&_os_log_internal;
          os_log_type_t v149 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
          {
            id v70 = v150;
            os_log_type_t v71 = v149;
            __os_log_helper_16_2_1_8_64((uint64_t)v189, (uint64_t)v163);
            _os_log_error_impl(&dword_20ABD4000, v70, v71, "Missng data type for aggregated property %@", v189, 0xCu);
          }
          objc_storeStrong((id *)&v150, 0);
          v183 = 0;
          int v172 = 1;
        }
        objc_storeStrong(&v151, 0);
        if (v172) {
          goto LABEL_55;
        }
      }
      else
      {
        id v158 = (id)[v165 objectForKey:@"data_type"];
        if (v158)
        {
          id v7 = +[AMDFeatureDescriptor getDataType:v158];
          BOOL v77 = v7 != 0;

          if (v77)
          {
            [v167 addObject:v163];
            id v74 = (id)[v182 propertyDict];
            [v74 setObject:v158 forKey:v163];

            int v172 = 0;
          }
          else
          {
            os_log_t v154 = (os_log_t)&_os_log_internal;
            os_log_type_t v153 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
            {
              id v75 = v154;
              os_log_type_t v76 = v153;
              __os_log_helper_16_0_0(v152);
              _os_log_error_impl(&dword_20ABD4000, v75, v76, "Invalid property data type provided", v152, 2u);
            }
            objc_storeStrong((id *)&v154, 0);
            v183 = 0;
            int v172 = 1;
          }
        }
        else
        {
          os_log_t v157 = (os_log_t)&_os_log_internal;
          os_log_type_t v156 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
          {
            os_log_type_t v78 = v157;
            os_log_type_t v79 = v156;
            __os_log_helper_16_0_0(v155);
            _os_log_error_impl(&dword_20ABD4000, v78, v79, "Missing property data type", v155, 2u);
          }
          objc_storeStrong((id *)&v157, 0);
          v183 = 0;
          int v172 = 1;
        }
        objc_storeStrong(&v158, 0);
        if (v172) {
          goto LABEL_55;
        }
      }
      int v172 = 0;
LABEL_55:
      objc_storeStrong(&v159, 0);
LABEL_56:
      objc_storeStrong(&v163, 0);
      if (v172) {
        goto LABEL_60;
      }
      ++v84;
      if (v82 + 1 >= v85)
      {
        uint64_t v84 = 0;
        unint64_t v85 = [v87 countByEnumeratingWithState:__b objects:v190 count:16];
        if (!v85) {
          goto LABEL_59;
        }
      }
    }
  }
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v94 = type;
    __os_log_helper_16_0_0(v173);
    _os_log_error_impl(&dword_20ABD4000, log, v94, "Missing entity name", v173, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v183 = 0;
  int v172 = 1;
LABEL_132:
  objc_storeStrong(&v176, 0);
  objc_storeStrong(&v178, 0);
  objc_storeStrong(&v179, 0);
  objc_storeStrong(&v180, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v182, 0);
  return v183;
}

- (id)getFeature:(id *)a3
{
  id v8 = self;
  SEL v7 = a2;
  id v6 = a3;
  id location = [(AMDFeatureDescriptor *)self getFeatureData:a3];
  if (!*v6 && location) {
    id v9 = +[AMDFeature featureFromValue:location];
  }
  else {
    id v9 = 0;
  }
  objc_storeStrong(&location, 0);
  uint64_t v3 = v9;

  return v3;
}

- (BOOL)checkJoinParameters
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v34 = self;
  SEL v33 = a2;
  id v16 = [(AMDFeatureDescriptor *)self joinType];
  char v31 = 0;
  char v17 = 1;
  if (![(NSString *)v16 isEqualToString:@"inner"])
  {
    uint64_t v32 = [(AMDFeatureDescriptor *)v34 joinType];
    char v31 = 1;
    char v17 = [(NSString *)v32 isEqualToString:@"outer"];
  }
  if (v31) {

  }
  if (v17)
  {
    id v12 = [(AMDFeatureDescriptor *)v34 joinTable];
    char v26 = 0;
    BOOL v13 = 1;
    if (v12)
    {
      os_log_type_t v27 = [(AMDFeatureDescriptor *)v34 joinTableDomain];
      char v26 = 1;
      BOOL v13 = v27 == 0;
    }
    if (v26) {

    }
    if (v13)
    {
      id v25 = &_os_log_internal;
      char v24 = 16;
      if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
      {
        id v10 = v25;
        os_log_type_t v11 = v24;
        __os_log_helper_16_0_0(v23);
        _os_log_error_impl(&dword_20ABD4000, v10, v11, "Both the feature name to be joined to the descriptor result, and the feature domain must be specified", v23, 2u);
      }
      objc_storeStrong(&v25, 0);
      char v35 = 0;
    }
    else
    {
      id v8 = [(AMDFeatureDescriptor *)v34 joinTableDomain];
      BOOL v9 = +[AMDDomains getCodeForDomain:](AMDDomains, "getCodeForDomain:") != 0;

      if (v9)
      {
        v4 = [(AMDFeatureDescriptor *)v34 joinRequiredColumns];
        char v19 = 0;
        BOOL v5 = 1;
        if (v4)
        {
          id v20 = [(AMDFeatureDescriptor *)v34 joinRequiredColumns];
          char v19 = 1;
          BOOL v5 = [(NSArray *)v20 count] == 0;
        }
        if (v19) {

        }
        if (v5)
        {
          id v18 = &_os_log_internal;
          if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
          {
            uint64_t v3 = [(AMDFeatureDescriptor *)v34 joinTable];
            __os_log_helper_16_2_1_8_64((uint64_t)v36, (uint64_t)v3);
            _os_log_error_impl(&dword_20ABD4000, (os_log_t)v18, OS_LOG_TYPE_ERROR, "Required fields from feature: %@ have not been provided", v36, 0xCu);
          }
          objc_storeStrong(&v18, 0);
          char v35 = 0;
        }
        else
        {
          char v35 = 1;
        }
      }
      else
      {
        id v22 = &_os_log_internal;
        os_log_type_t v21 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
        {
          SEL v7 = [(AMDFeatureDescriptor *)v34 joinTableDomain];
          id v6 = [(AMDFeatureDescriptor *)v34 joinTable];
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v37, (uint64_t)v7, (uint64_t)v6);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v22, v21, "Unsupported domain:%@ passed for feature: %@", v37, 0x16u);
        }
        objc_storeStrong(&v22, 0);
        char v35 = 0;
      }
    }
  }
  else
  {
    id location = &_os_log_internal;
    char v29 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      os_log_type_t type = v29;
      __os_log_helper_16_0_0(v28);
      _os_log_error_impl(&dword_20ABD4000, log, type, "Incorrect join type passed. Only inner and outer joins are supported", v28, 2u);
    }
    objc_storeStrong(&location, 0);
    char v35 = 0;
  }
  return v35 & 1;
}

- (id)getFeatureData:(id *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v70 = self;
  SEL v69 = a2;
  v68 = a3;
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  int v63 = 838860800;
  int v64 = 48;
  uint64_t v65 = __Block_byref_object_copy__12;
  v66 = __Block_byref_object_dispose__12;
  id v67 = 0;
  uint64_t v54 = 0;
  id v55 = &v54;
  int v56 = 838860800;
  int v57 = 48;
  id v58 = __Block_byref_object_copy__12;
  id v59 = __Block_byref_object_dispose__12;
  id v60 = 0;
  id v30 = +[AMDCoreDataPersistentContainer sharedContainer];
  id v53 = (id)[v30 getManagedObjectContext];

  id v29 = v53;
  uint64_t v46 = MEMORY[0x263EF8330];
  int v47 = -1073741824;
  int v48 = 0;
  uint64_t v49 = __39__AMDFeatureDescriptor_getFeatureData___block_invoke;
  uint64_t v50 = &unk_263FE1C80;
  id v51 = v53;
  v52[0] = v70;
  v52[1] = &v61;
  v52[2] = &v54;
  [v29 performBlockAndWait:&v46];
  if (v62[5])
  {
    id v28 = (id) v62[5];
    id *v68 = v28;
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v27 = (id)[*v68 localizedDescription];
      __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v27);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "Error executing aggregation: %@", v73, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v71 = 0;
    int v43 = 1;
  }
  else if (v55[5])
  {
    os_log_t v42 = (os_log_t)&_os_log_internal;
    os_log_type_t v41 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v26 = [(id)v55[5] count];
      id v25 = [(AMDFeatureDescriptor *)v70 featureName];
      __os_log_helper_16_2_2_8_0_8_64((uint64_t)v72, v26, (uint64_t)v25);
      _os_log_debug_impl(&dword_20ABD4000, v42, v41, "Got %lu records for feature %@", v72, 0x16u);
    }
    objc_storeStrong((id *)&v42, 0);
    id v23 = [(AMDFeatureDescriptor *)v70 version];
    BOOL v24 = [(NSString *)v23 isEqualToString:@"v1"];

    if (v24)
    {
      [(AMDFeatureDescriptor *)v70 outerJoin:v55[5]];
      id v22 = v70;
      id v21 = [(AMDFeatureDescriptor *)v70 sort:v55[5]];
      id v71 = -[AMDFeatureDescriptor prepareResult:](v22, "prepareResult:");

      int v43 = 1;
    }
    else
    {
      char v39 = 0;
      char v37 = 0;
      char v19 = [(AMDFeatureDescriptor *)v70 joinType];
      BOOL v20 = 0;
      if (v19)
      {
        id v40 = [(AMDFeatureDescriptor *)v70 joinTable];
        char v39 = 1;
        BOOL v20 = 0;
        if (v40)
        {
          id v38 = [(AMDFeatureDescriptor *)v70 joinTableDomain];
          char v37 = 1;
          BOOL v20 = v38 != 0;
        }
      }
      if (v37) {

      }
      if (v39) {
      if (v20)
      }
      {
        id location = 0;
        char v17 = [(AMDFeatureDescriptor *)v70 joinType];
        BOOL v18 = [(NSString *)v17 isEqualToString:@"inner"];

        if (v18)
        {
          id v3 = [(AMDFeatureDescriptor *)v70 performInnerJoin:v55[5]];
          id v4 = location;
          id location = v3;
        }
        else
        {
          char v34 = 0;
          id v16 = [(AMDFeatureDescriptor *)v70 joinType];
          BOOL v15 = 0;
          if ([(NSString *)v16 isEqualToString:@"outer"])
          {
            id v35 = [(AMDFeatureDescriptor *)v70 defaultJoinValueDict];
            char v34 = 1;
            BOOL v15 = v35 != 0;
          }
          if (v34) {

          }
          if (v15)
          {
            id v5 = [(AMDFeatureDescriptor *)v70 performOuterJoin:v55[5]];
            id v6 = location;
            id location = v5;
          }
          else
          {
            os_log_t v33 = (os_log_t)&_os_log_internal;
            os_log_type_t v32 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              BOOL v13 = v33;
              os_log_type_t v14 = v32;
              __os_log_helper_16_0_0(v31);
              _os_log_error_impl(&dword_20ABD4000, v13, v14, "Invalid join parameters passed", v31, 2u);
            }
            objc_storeStrong((id *)&v33, 0);
          }
        }
        if (location)
        {
          id v12 = v70;
          id v11 = [(AMDFeatureDescriptor *)v70 sort:location];
          id v71 = -[AMDFeatureDescriptor prepareArrayResult:](v12, "prepareArrayResult:");
        }
        else
        {
          id v71 = 0;
        }
        int v43 = 1;
        objc_storeStrong(&location, 0);
      }
      else
      {
        id v10 = v70;
        id v9 = [(AMDFeatureDescriptor *)v70 sort:v55[5]];
        id v71 = -[AMDFeatureDescriptor prepareArrayResult:](v10, "prepareArrayResult:");

        int v43 = 1;
      }
    }
  }
  else
  {
    id v71 = 0;
    int v43 = 1;
  }
  objc_storeStrong(v52, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v53, 0);
  _Block_object_dispose(&v54, 8);
  objc_storeStrong(&v60, 0);
  _Block_object_dispose(&v61, 8);
  objc_storeStrong(&v67, 0);
  SEL v7 = v71;

  return v7;
}

void __39__AMDFeatureDescriptor_getFeatureData___block_invoke(uint64_t a1)
{
  v10[2] = (id)a1;
  v10[1] = (id)a1;
  id v4 = *(void **)(a1 + 32);
  id v7 = (id)[*(id *)(a1 + 40) fetchRequest];
  id location = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v9 = *location;
  id v6 = (id)objc_msgSend(v4, "executeFetchRequest:error:");
  objc_storeStrong(location, v9);
  v10[0] = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && v10[0])
  {
    uint64_t v1 = [v10[0] mutableCopy];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = v1;
  }
  objc_storeStrong(v10, 0);
}

- (void)outerJoin:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v70 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v67 = 0;
  LOBYTE(v48) = 1;
  if ([(AMDFeatureDescriptor *)v70 doOuterJoin])
  {
    id v68 = [(AMDFeatureDescriptor *)v70 keyProperty];
    char v67 = 1;
    int v48 = [v68 isEqualToString:0x26BEAEB38] ^ 1;
  }
  if (v67) {

  }
  if (v48)
  {
    int v66 = 1;
  }
  else
  {
    id v65 = 0;
    id obj = 0;
    id v47 = +[AMDTasteProfile getFeatureValueWithName:0x26BEB7DD8 inDomain:@"apps" error:&obj];
    objc_storeStrong(&v65, obj);
    id v64 = v47;
    if (!v65 && v64)
    {
      id v61 = v65;
      id v46 = +[AMDTasteProfile getFeatureValueWithName:0x26BEB7EB8 inDomain:@"apps" error:&v61];
      objc_storeStrong(&v65, v61);
      id v62 = v46;
      if (!v65 && v62)
      {
        id v40 = (void *)MEMORY[0x263EFF9C0];
        id v41 = (id)[v64 allKeys];
        id v60 = (id)objc_msgSend(v40, "setWithArray:");

        os_log_t v42 = (void *)MEMORY[0x263EFFA08];
        id v43 = (id)[v62 allKeys];
        id v59 = (id)objc_msgSend(v42, "setWithArray:");

        [v60 unionSet:v59];
        memset(__b, 0, sizeof(__b));
        id v44 = location[0];
        uint64_t v45 = [v44 countByEnumeratingWithState:__b objects:v78 count:16];
        if (v45)
        {
          uint64_t v37 = *(void *)__b[2];
          uint64_t v38 = 0;
          unint64_t v39 = v45;
          while (1)
          {
            uint64_t v36 = v38;
            if (*(void *)__b[2] != v37) {
              objc_enumerationMutation(v44);
            }
            id v58 = *(void **)(__b[1] + 8 * v38);
            id v33 = v60;
            os_log_type_t v32 = v58;
            id v35 = [(AMDFeatureDescriptor *)v70 keyProperty];
            id v34 = (id)objc_msgSend(v32, "objectForKey:");
            objc_msgSend(v33, "removeObject:");

            ++v38;
            if (v36 + 1 >= v39)
            {
              uint64_t v38 = 0;
              unint64_t v39 = [v44 countByEnumeratingWithState:__b objects:v78 count:16];
              if (!v39) {
                break;
              }
            }
          }
        }

        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_1_8_0((uint64_t)v77, [v60 count]);
          _os_log_debug_impl(&dword_20ABD4000, oslog, type, "Adding %lu records due to outer join", v77, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        memset(v53, 0, sizeof(v53));
        id v30 = v60;
        uint64_t v31 = [v30 countByEnumeratingWithState:v53 objects:v76 count:16];
        if (v31)
        {
          uint64_t v27 = *(void *)v53[2];
          uint64_t v28 = 0;
          unint64_t v29 = v31;
          while (1)
          {
            uint64_t v26 = v28;
            if (*(void *)v53[2] != v27) {
              objc_enumerationMutation(v30);
            }
            uint64_t v54 = *(void *)(v53[1] + 8 * v28);
            BOOL v24 = [(AMDFeatureDescriptor *)v70 aggregatedProperty];
            char v51 = 0;
            BOOL v25 = 1;
            if (!v24)
            {
              id v52 = [(AMDFeatureDescriptor *)v70 aggregatedPropertyList];
              char v51 = 1;
              BOOL v25 = v52 != 0;
            }
            if (v51) {

            }
            if (v25)
            {
              id v22 = [(AMDFeatureDescriptor *)v70 version];
              BOOL v23 = [(NSString *)v22 isEqualToString:@"v1"];

              if (v23)
              {
                id v17 = location[0];
                id v21 = [(AMDFeatureDescriptor *)v70 keyProperty];
                v74[0] = v21;
                v75[0] = v54;
                BOOL v20 = [(AMDFeatureDescriptor *)v70 aggregatedProperty];
                v74[1] = v20;
                char v19 = [(AMDFeatureDescriptor *)v70 defaultJoinValue];
                v75[1] = v19;
                id v18 = (id)[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:2];
                objc_msgSend(v17, "addObject:");
              }
              else
              {
                id v50 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                id v13 = v50;
                uint64_t v12 = v54;
                os_log_type_t v14 = [(AMDFeatureDescriptor *)v70 keyProperty];
                objc_msgSend(v13, "setObject:forKey:", v12);

                memset(v49, 0, 0x40uLL);
                BOOL v15 = [(AMDFeatureDescriptor *)v70 aggregatedPropertyList];
                uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:v49 objects:v73 count:16];
                if (v16)
                {
                  uint64_t v9 = *(void *)v49[2];
                  uint64_t v10 = 0;
                  unint64_t v11 = v16;
                  while (1)
                  {
                    uint64_t v8 = v10;
                    if (*(void *)v49[2] != v9) {
                      objc_enumerationMutation(v15);
                    }
                    v49[8] = *(void *)(v49[1] + 8 * v10);
                    id v6 = v50;
                    id v7 = [(AMDFeatureDescriptor *)v70 defaultJoinValue];
                    objc_msgSend(v6, "setObject:forKey:");

                    ++v10;
                    if (v8 + 1 >= v11)
                    {
                      uint64_t v10 = 0;
                      unint64_t v11 = [(NSMutableArray *)v15 countByEnumeratingWithState:v49 objects:v73 count:16];
                      if (!v11) {
                        break;
                      }
                    }
                  }
                }

                [location[0] addObject:v50];
                objc_storeStrong(&v50, 0);
              }
            }
            else
            {
              id v3 = location[0];
              id v5 = [(AMDFeatureDescriptor *)v70 keyProperty];
              id v71 = v5;
              uint64_t v72 = v54;
              id v4 = (id)[NSDictionary dictionaryWithObjects:&v72 forKeys:&v71 count:1];
              objc_msgSend(v3, "addObject:");
            }
            ++v28;
            if (v26 + 1 >= v29)
            {
              uint64_t v28 = 0;
              unint64_t v29 = [v30 countByEnumeratingWithState:v53 objects:v76 count:16];
              if (!v29) {
                break;
              }
            }
          }
        }

        objc_storeStrong(&v59, 0);
        objc_storeStrong(&v60, 0);
        int v66 = 0;
      }
      else
      {
        int v66 = 1;
      }
      objc_storeStrong(&v62, 0);
    }
    else
    {
      int v66 = 1;
    }
    objc_storeStrong(&v64, 0);
    objc_storeStrong(&v65, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)transformTPDataForJoin:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v38 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v36 = (id)[location[0] objectForKey:0x26BEB1878];
  id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  BOOL v23 = [(AMDFeatureDescriptor *)v38 keyProperty];
  id v34 = (id)objc_msgSend(v36, "objectForKey:");

  if (v34)
  {
    id v32 = (id)[v34 objectForKey:@"featureValue"];
    id v22 = (id)[v34 objectForKey:@"featureFormat"];
    id v21 = [(AMDFeatureDescriptor *)v38 keyProperty];
    objc_msgSend(v35, "setObject:forKey:", v22);

    id v31 = (id)[v36 allKeys];
    id v30 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    for (int i = 0; ; ++i)
    {
      unint64_t v20 = i;
      if (v20 >= [v32 count]) {
        break;
      }
      id v28 = (id)[v32 objectAtIndex:i];
      id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      memset(__b, 0, sizeof(__b));
      id obj = v31;
      uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
      if (v19)
      {
        uint64_t v15 = *(void *)__b[2];
        uint64_t v16 = 0;
        unint64_t v17 = v19;
        while (1)
        {
          uint64_t v14 = v16;
          if (*(void *)__b[2] != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void **)(__b[1] + 8 * v16);
          unint64_t v11 = v26;
          uint64_t v12 = [(AMDFeatureDescriptor *)v38 keyProperty];
          char v13 = objc_msgSend(v11, "isEqualToString:");

          if ((v13 & 1) == 0)
          {
            if (!i)
            {
              id v8 = v35;
              id v10 = (id)[v36 objectForKey:v26];
              id v9 = (id)[v10 objectForKey:@"featureFormat"];
              objc_msgSend(v8, "setObject:forKey:");
            }
            id v5 = (id)[v36 objectForKey:v26];
            id v24 = (id)[v5 objectForKey:@"featureValue"];

            id v6 = v27;
            id v7 = (id)[v24 objectAtIndex:i];
            objc_msgSend(v6, "setObject:forKey:");

            objc_storeStrong(&v24, 0);
          }
          ++v16;
          if (v14 + 1 >= v17)
          {
            uint64_t v16 = 0;
            unint64_t v17 = [obj countByEnumeratingWithState:__b objects:v42 count:16];
            if (!v17) {
              break;
            }
          }
        }
      }

      [v30 setObject:v27 forKey:v28];
      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
    }
    v40[0] = @"featureValue";
    v41[0] = v30;
    v40[1] = @"featureFormat";
    v41[1] = v35;
    id v39 = (id)[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    int v33 = 1;
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
  }
  else
  {
    id v39 = 0;
    int v33 = 1;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
  id v3 = v39;

  return v3;
}

- (id)performInnerJoin:(id)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v72 = 0;
  uint64_t v45 = [(AMDFeatureDescriptor *)v74 joinTable];
  id v44 = [(AMDFeatureDescriptor *)v74 joinTableDomain];
  id obj = v72;
  id v43 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v45);
  objc_storeStrong(&v72, obj);
  id v71 = v43;

  if (!v72 && v71)
  {
    id v65 = [(AMDFeatureDescriptor *)v74 transformTPDataForJoin:v71];
    if (v65)
    {
      id v62 = (id)[v65 objectForKey:@"featureValue"];
      id v61 = (id)[v65 objectForKey:@"featureFormat"];
      int v33 = (void *)MEMORY[0x263EFFA08];
      id v35 = (id)[v71 objectForKey:0x26BEB1878];
      id v34 = (id)[v35 allKeys];
      id v60 = (id)objc_msgSend(v33, "setWithArray:");

      memset(__b, 0, sizeof(__b));
      id v36 = [(AMDFeatureDescriptor *)v74 joinRequiredColumns];
      uint64_t v37 = [(NSArray *)v36 countByEnumeratingWithState:__b objects:v80 count:16];
      if (v37)
      {
        uint64_t v30 = *(void *)__b[2];
        uint64_t v31 = 0;
        unint64_t v32 = v37;
        while (1)
        {
          uint64_t v29 = v31;
          if (*(void *)__b[2] != v30) {
            objc_enumerationMutation(v36);
          }
          uint64_t v59 = *(void *)(__b[1] + 8 * v31);
          if (([v60 containsObject:v59] & 1) == 0) {
            break;
          }
          ++v31;
          if (v29 + 1 >= v32)
          {
            uint64_t v31 = 0;
            unint64_t v32 = [(NSArray *)v36 countByEnumeratingWithState:__b objects:v80 count:16];
            if (!v32) {
              goto LABEL_20;
            }
          }
        }
        os_log_t v57 = (os_log_t)&_os_log_internal;
        os_log_type_t v56 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v79, v59);
          _os_log_error_impl(&dword_20ABD4000, v57, v56, "Inner join failed:Requested property %@ not found in feature", v79, 0xCu);
        }
        objc_storeStrong((id *)&v57, 0);
        id v75 = 0;
        int v66 = 1;
      }
      else
      {
LABEL_20:
        int v66 = 0;
      }

      if (!v66)
      {
        id v55 = objc_alloc_init(MEMORY[0x263EFF980]);
        memset(v53, 0, sizeof(v53));
        id v27 = location[0];
        uint64_t v28 = [v27 countByEnumeratingWithState:v53 objects:v78 count:16];
        if (v28)
        {
          uint64_t v24 = *(void *)v53[2];
          uint64_t v25 = 0;
          unint64_t v26 = v28;
          while (1)
          {
            uint64_t v23 = v25;
            if (*(void *)v53[2] != v24) {
              objc_enumerationMutation(v27);
            }
            uint64_t v54 = *(void **)(v53[1] + 8 * v25);
            id v21 = v54;
            id v22 = [(AMDFeatureDescriptor *)v74 keyProperty];
            id v52 = (id)objc_msgSend(v21, "objectForKey:");

            id v51 = (id)[v62 objectForKey:v52];
            if (v51)
            {
              id v50 = (id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v54];
              memset(v48, 0, sizeof(v48));
              uint64_t v19 = [(AMDFeatureDescriptor *)v74 joinRequiredColumns];
              uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:v48 objects:v77 count:16];
              if (v20)
              {
                uint64_t v16 = *(void *)v48[2];
                uint64_t v17 = 0;
                unint64_t v18 = v20;
                while (1)
                {
                  uint64_t v15 = v17;
                  if (*(void *)v48[2] != v16) {
                    objc_enumerationMutation(v19);
                  }
                  uint64_t v49 = *(void *)(v48[1] + 8 * v17);
                  id v13 = v50;
                  id v14 = (id)[v51 objectForKey:v49];
                  objc_msgSend(v13, "setObject:forKey:");

                  ++v17;
                  if (v15 + 1 >= v18)
                  {
                    uint64_t v17 = 0;
                    unint64_t v18 = [(NSArray *)v19 countByEnumeratingWithState:v48 objects:v77 count:16];
                    if (!v18) {
                      break;
                    }
                  }
                }
              }

              [v55 addObject:v50];
              objc_storeStrong(&v50, 0);
              int v66 = 0;
            }
            else
            {
              int v66 = 5;
            }
            objc_storeStrong(&v51, 0);
            objc_storeStrong(&v52, 0);
            ++v25;
            if (v23 + 1 >= v26)
            {
              uint64_t v25 = 0;
              unint64_t v26 = [v27 countByEnumeratingWithState:v53 objects:v78 count:16];
              if (!v26) {
                break;
              }
            }
          }
        }

        if ([v55 count])
        {
          memset(v46, 0, sizeof(v46));
          unint64_t v11 = [(AMDFeatureDescriptor *)v74 joinRequiredColumns];
          uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:v46 objects:v76 count:16];
          if (v12)
          {
            uint64_t v8 = *(void *)v46[2];
            uint64_t v9 = 0;
            unint64_t v10 = v12;
            while (1)
            {
              uint64_t v7 = v9;
              if (*(void *)v46[2] != v8) {
                objc_enumerationMutation(v11);
              }
              uint64_t v47 = *(void *)(v46[1] + 8 * v9);
              id v6 = [(AMDFeatureDescriptor *)v74 propertyDict];
              id v5 = (id)[v61 objectForKey:v47];
              -[NSMutableDictionary setObject:forKey:](v6, "setObject:forKey:");

              ++v9;
              if (v7 + 1 >= v10)
              {
                uint64_t v9 = 0;
                unint64_t v10 = [(NSArray *)v11 countByEnumeratingWithState:v46 objects:v76 count:16];
                if (!v10) {
                  break;
                }
              }
            }
          }
        }
        id v75 = v55;
        int v66 = 1;
        objc_storeStrong(&v55, 0);
      }
      objc_storeStrong(&v60, 0);
      objc_storeStrong(&v61, 0);
      objc_storeStrong(&v62, 0);
    }
    else
    {
      os_log_t v64 = (os_log_t)&_os_log_internal;
      os_log_type_t v63 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      {
        uint64_t v38 = [(AMDFeatureDescriptor *)v74 keyProperty];
        __os_log_helper_16_2_1_8_64((uint64_t)v81, (uint64_t)v38);
        _os_log_error_impl(&dword_20ABD4000, v64, v63, "Inner join failed:Key property %@ not found in feature", v81, 0xCu);
      }
      objc_storeStrong((id *)&v64, 0);
      id v75 = 0;
      int v66 = 1;
    }
    objc_storeStrong(&v65, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v40 = type;
      os_log_t v42 = [(AMDFeatureDescriptor *)v74 joinTable];
      id v41 = (id)[v72 localizedDescription];
      id v67 = v41;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v82, (uint64_t)v42, (uint64_t)v67);
      _os_log_error_impl(&dword_20ABD4000, log, v40, "Inner join failed: Feature %@ could not be fetched. Error: %@", v82, 0x16u);

      objc_storeStrong(&v67, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v75 = 0;
    int v66 = 1;
  }
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, 0);
  id v3 = v75;

  return v3;
}

- (id)performOuterJoin:(id)a3
{
  uint64_t v102 = *MEMORY[0x263EF8340];
  id v91 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v89 = 0;
  os_log_t v57 = [(AMDFeatureDescriptor *)v91 joinTable];
  os_log_type_t v56 = [(AMDFeatureDescriptor *)v91 joinTableDomain];
  id obj = v89;
  id v55 = +[AMDTasteProfile getFeatureValueWithName:inDomain:error:](AMDTasteProfile, "getFeatureValueWithName:inDomain:error:", v57);
  objc_storeStrong(&v89, obj);
  id v88 = v55;

  if (!v89 && v88)
  {
    id v82 = [(AMDFeatureDescriptor *)v91 transformTPDataForJoin:v88];
    if (v82)
    {
      id v79 = (id)[v82 objectForKey:@"featureValue"];
      id v78 = (id)[v82 objectForKey:@"featureFormat"];
      id v47 = (id)[v88 objectForKey:0x26BEB1878];
      id v77 = (id)[v47 allKeys];

      id v76 = (id)[MEMORY[0x263EFFA08] setWithArray:v77];
      memset(__b, 0, sizeof(__b));
      int v48 = [(AMDFeatureDescriptor *)v91 joinRequiredColumns];
      uint64_t v49 = [(NSArray *)v48 countByEnumeratingWithState:__b objects:v99 count:16];
      if (v49)
      {
        uint64_t v44 = *(void *)__b[2];
        uint64_t v45 = 0;
        unint64_t v46 = v49;
        while (1)
        {
          uint64_t v43 = v45;
          if (*(void *)__b[2] != v44) {
            objc_enumerationMutation(v48);
          }
          uint64_t v75 = *(void *)(__b[1] + 8 * v45);
          if (([v76 containsObject:v75] & 1) == 0)
          {
            os_log_t v73 = (os_log_t)&_os_log_internal;
            os_log_type_t v72 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_1_8_64((uint64_t)v98, v75);
              _os_log_error_impl(&dword_20ABD4000, v73, v72, "Outer join failed:Requested property %@ not found in feature", v98, 0xCu);
            }
            objc_storeStrong((id *)&v73, 0);
            id v92 = 0;
            int v83 = 1;
            goto LABEL_25;
          }
          id v41 = [(AMDFeatureDescriptor *)v91 defaultJoinValueDict];
          id v3 = [(NSDictionary *)v41 objectForKey:v75];
          BOOL v42 = v3 != 0;

          if (!v42) {
            break;
          }
          ++v45;
          if (v43 + 1 >= v46)
          {
            uint64_t v45 = 0;
            unint64_t v46 = [(NSArray *)v48 countByEnumeratingWithState:__b objects:v99 count:16];
            if (!v46) {
              goto LABEL_24;
            }
          }
        }
        os_log_t v71 = (os_log_t)&_os_log_internal;
        os_log_type_t v70 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          uint64_t v39 = v75;
          os_log_type_t v40 = [(AMDFeatureDescriptor *)v91 joinTable];
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v97, v39, (uint64_t)v40);
          _os_log_error_impl(&dword_20ABD4000, v71, v70, "Outer join failed:Default value not provided for column: %@ while performing join with feature: %@", v97, 0x16u);
        }
        objc_storeStrong((id *)&v71, 0);
        id v92 = 0;
        int v83 = 1;
      }
      else
      {
LABEL_24:
        int v83 = 0;
      }
LABEL_25:

      if (!v83)
      {
        id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
        memset(v67, 0, sizeof(v67));
        id v37 = location[0];
        uint64_t v38 = [v37 countByEnumeratingWithState:v67 objects:v96 count:16];
        if (v38)
        {
          uint64_t v34 = *(void *)v67[2];
          uint64_t v35 = 0;
          unint64_t v36 = v38;
          while (1)
          {
            uint64_t v33 = v35;
            if (*(void *)v67[2] != v34) {
              objc_enumerationMutation(v37);
            }
            id v68 = *(void **)(v67[1] + 8 * v35);
            uint64_t v31 = v68;
            unint64_t v32 = [(AMDFeatureDescriptor *)v91 keyProperty];
            id v66 = (id)objc_msgSend(v31, "objectForKey:");

            id v65 = (id)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:v68];
            id v64 = (id)[v79 objectForKey:v66];
            if (v64)
            {
              memset(v60, 0, sizeof(v60));
              uint64_t v20 = [(AMDFeatureDescriptor *)v91 joinRequiredColumns];
              uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:v60 objects:v94 count:16];
              if (v21)
              {
                uint64_t v17 = *(void *)v60[2];
                uint64_t v18 = 0;
                unint64_t v19 = v21;
                while (1)
                {
                  uint64_t v16 = v18;
                  if (*(void *)v60[2] != v17) {
                    objc_enumerationMutation(v20);
                  }
                  uint64_t v61 = *(void *)(v60[1] + 8 * v18);
                  id v14 = v65;
                  id v15 = (id)[v64 objectForKey:v61];
                  objc_msgSend(v14, "setObject:forKey:");

                  ++v18;
                  if (v16 + 1 >= v19)
                  {
                    uint64_t v18 = 0;
                    unint64_t v19 = [(NSArray *)v20 countByEnumeratingWithState:v60 objects:v94 count:16];
                    if (!v19) {
                      break;
                    }
                  }
                }
              }
            }
            else
            {
              memset(v62, 0, sizeof(v62));
              uint64_t v29 = [(AMDFeatureDescriptor *)v91 joinRequiredColumns];
              uint64_t v30 = [(NSArray *)v29 countByEnumeratingWithState:v62 objects:v95 count:16];
              if (v30)
              {
                uint64_t v26 = *(void *)v62[2];
                uint64_t v27 = 0;
                unint64_t v28 = v30;
                while (1)
                {
                  uint64_t v25 = v27;
                  if (*(void *)v62[2] != v26) {
                    objc_enumerationMutation(v29);
                  }
                  uint64_t v63 = *(void *)(v62[1] + 8 * v27);
                  id v22 = v65;
                  uint64_t v24 = [(AMDFeatureDescriptor *)v91 defaultJoinValueDict];
                  id v23 = [(NSDictionary *)v24 objectForKey:v63];
                  objc_msgSend(v22, "setObject:forKey:");

                  ++v27;
                  if (v25 + 1 >= v28)
                  {
                    uint64_t v27 = 0;
                    unint64_t v28 = [(NSArray *)v29 countByEnumeratingWithState:v62 objects:v95 count:16];
                    if (!v28) {
                      break;
                    }
                  }
                }
              }
            }
            [v69 addObject:v65];
            objc_storeStrong(&v64, 0);
            objc_storeStrong(&v65, 0);
            objc_storeStrong(&v66, 0);
            ++v35;
            if (v33 + 1 >= v36)
            {
              uint64_t v35 = 0;
              unint64_t v36 = [v37 countByEnumeratingWithState:v67 objects:v96 count:16];
              if (!v36) {
                break;
              }
            }
          }
        }

        if ([v69 count])
        {
          memset(v58, 0, sizeof(v58));
          uint64_t v12 = [(AMDFeatureDescriptor *)v91 joinRequiredColumns];
          uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:v58 objects:v93 count:16];
          if (v13)
          {
            uint64_t v9 = *(void *)v58[2];
            uint64_t v10 = 0;
            unint64_t v11 = v13;
            while (1)
            {
              uint64_t v8 = v10;
              if (*(void *)v58[2] != v9) {
                objc_enumerationMutation(v12);
              }
              uint64_t v59 = *(void *)(v58[1] + 8 * v10);
              uint64_t v7 = [(AMDFeatureDescriptor *)v91 propertyDict];
              id v6 = (id)[v78 objectForKey:v59];
              -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:");

              ++v10;
              if (v8 + 1 >= v11)
              {
                uint64_t v10 = 0;
                unint64_t v11 = [(NSArray *)v12 countByEnumeratingWithState:v58 objects:v93 count:16];
                if (!v11) {
                  break;
                }
              }
            }
          }
        }
        id v92 = v69;
        int v83 = 1;
        objc_storeStrong(&v69, 0);
      }
      objc_storeStrong(&v76, 0);
      objc_storeStrong(&v77, 0);
      objc_storeStrong(&v78, 0);
      objc_storeStrong(&v79, 0);
    }
    else
    {
      os_log_t v81 = (os_log_t)&_os_log_internal;
      os_log_type_t v80 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        id v50 = [(AMDFeatureDescriptor *)v91 keyProperty];
        __os_log_helper_16_2_1_8_64((uint64_t)v100, (uint64_t)v50);
        _os_log_error_impl(&dword_20ABD4000, v81, v80, "Outer join failed:Key property %@ not found in feature", v100, 0xCu);
      }
      objc_storeStrong((id *)&v81, 0);
      id v92 = 0;
      int v83 = 1;
    }
    objc_storeStrong(&v82, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v52 = type;
      uint64_t v54 = [(AMDFeatureDescriptor *)v91 joinTable];
      id v53 = (id)[v89 localizedDescription];
      id v84 = v53;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v101, (uint64_t)v54, (uint64_t)v84);
      _os_log_error_impl(&dword_20ABD4000, log, v52, "Outer join failed: Feature %@ could not be fetched. Error: %@", v101, 0x16u);

      objc_storeStrong(&v84, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v92 = 0;
    int v83 = 1;
  }
  objc_storeStrong(&v88, 0);
  objc_storeStrong(&v89, 0);
  objc_storeStrong(location, 0);
  id v4 = v92;

  return v4;
}

- (id)sort:(id)a3
{
  uint64_t v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = [(AMDFeatureDescriptor *)v27 sortOrder];
  BOOL v15 = 1;
  if (v14) {
    BOOL v15 = [location[0] count] == 0;
  }

  if (v15)
  {
    id v28 = location[0];
    int v25 = 1;
  }
  else
  {
    id v24 = 0;
    uint64_t v12 = [(AMDFeatureDescriptor *)v27 version];
    BOOL v13 = [(NSString *)v12 isEqualToString:@"v1"];

    if (v13)
    {
      unint64_t v11 = [(AMDFeatureDescriptor *)v27 aggregatedProperty];
      char v22 = 0;
      char v20 = 0;
      if (v11)
      {
        id v23 = [(AMDFeatureDescriptor *)v27 aggregatedProperty];
        char v22 = 1;
        objc_storeStrong(&v24, v23);
      }
      else
      {
        uint64_t v21 = [(AMDFeatureDescriptor *)v27 keyProperty];
        char v20 = 1;
        objc_storeStrong(&v24, v21);
      }
      if (v20) {

      }
      if (v22) {
    }
      }
    else
    {
      uint64_t v10 = [(AMDFeatureDescriptor *)v27 sortKey];
      char v18 = 0;
      char v16 = 0;
      if (v10)
      {
        unint64_t v19 = [(AMDFeatureDescriptor *)v27 sortKey];
        char v18 = 1;
        objc_storeStrong(&v24, v19);
      }
      else
      {
        uint64_t v17 = [(AMDFeatureDescriptor *)v27 keyProperty];
        char v16 = 1;
        objc_storeStrong(&v24, v17);
      }
      if (v16) {

      }
      if (v18) {
    }
      }
    id v6 = (id)[location[0] firstObject];
    id v5 = (id)[v6 objectForKey:v24];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v8 = [(AMDFeatureDescriptor *)v27 sortOrder];
    BOOL v9 = [(NSNumber *)v8 intValue] == 0;

    id v28 = +[AMDMiscHelpers sortArrayElements:location[0] inDescendingOrder:v9 withComparisonKey:v24 isKeyString:isKindOfClass & 1];
    int v25 = 1;
    objc_storeStrong(&v24, 0);
  }
  objc_storeStrong(location, 0);
  id v3 = v28;

  return v3;
}

- (id)prepareDictionaryResult:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v27 = (id)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(location[0], "count"));
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v22 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
  if (v22)
  {
    uint64_t v17 = *(void *)__b[2];
    uint64_t v18 = 0;
    unint64_t v19 = v22;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)__b[2] != v17) {
        objc_enumerationMutation(obj);
      }
      uint64_t v26 = *(void **)(__b[1] + 8 * v18);
      id v14 = v26;
      BOOL v15 = [(AMDFeatureDescriptor *)v29 keyProperty];
      id v24 = (id)objc_msgSend(v14, "objectForKey:");

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v3 = (id)[v24 stringValue];
        id v4 = v24;
        id v24 = v3;
      }
      id v8 = v27;
      uint64_t v7 = v26;
      uint64_t v10 = [(AMDFeatureDescriptor *)v29 aggregatedProperty];
      id v9 = (id)objc_msgSend(v7, "objectForKey:");
      objc_msgSend(v8, "setObject:forKey:");

      uint64_t v11 = [v27 count];
      uint64_t v12 = [(AMDFeatureDescriptor *)v29 maxRecords];
      BOOL v13 = v11 != [(NSNumber *)v12 integerValue];

      if (v13) {
        int v23 = 0;
      }
      else {
        int v23 = 2;
      }
      objc_storeStrong(&v24, 0);
      if (v23) {
        break;
      }
      ++v18;
      if (v16 + 1 >= v19)
      {
        uint64_t v18 = 0;
        unint64_t v19 = [obj countByEnumeratingWithState:__b objects:v30 count:16];
        if (!v19) {
          break;
        }
      }
    }
  }

  id v6 = v27;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)prepareArrayResult:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  os_log_type_t v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v37 = 0;
  memset(__b, 0, sizeof(__b));
  id obj = location[0];
  uint64_t v27 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
  if (v27)
  {
    uint64_t v23 = *(void *)__b[2];
    uint64_t v24 = 0;
    unint64_t v25 = v27;
    while (1)
    {
      uint64_t v22 = v24;
      if (*(void *)__b[2] != v23) {
        objc_enumerationMutation(obj);
      }
      id v36 = *(id *)(__b[1] + 8 * v24);
      memset(v33, 0, sizeof(v33));
      id v20 = v36;
      uint64_t v21 = [v20 countByEnumeratingWithState:v33 objects:v43 count:16];
      if (v21)
      {
        uint64_t v17 = *(void *)v33[2];
        uint64_t v18 = 0;
        unint64_t v19 = v21;
        while (1)
        {
          uint64_t v16 = v18;
          if (*(void *)v33[2] != v17) {
            objc_enumerationMutation(v20);
          }
          uint64_t v34 = *(void *)(v33[1] + 8 * v18);
          id v3 = (id)[v38 objectForKey:v34];
          BOOL v15 = v3 != 0;

          if (v15)
          {
            id v29 = (id)[v38 objectForKey:v34];
            id v28 = (id)[v29 objectForKey:@"featureValue"];
            id v10 = v28;
            id v11 = (id)[v36 objectForKey:v34];
            objc_msgSend(v10, "addObject:");

            objc_storeStrong(&v28, 0);
            objc_storeStrong(&v29, 0);
          }
          else
          {
            id v32 = objc_alloc_init(MEMORY[0x263EFF9A0]);
            id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
            id v12 = v31;
            id v13 = (id)[v36 objectForKey:v34];
            objc_msgSend(v12, "addObject:");

            id v14 = [(AMDFeatureDescriptor *)v40 propertyDict];
            id v30 = (id)[(NSMutableDictionary *)v14 objectForKey:v34];

            [v32 setObject:v31 forKey:@"featureValue"];
            [v32 setObject:v30 forKey:@"featureFormat"];
            [v38 setObject:v32 forKey:v34];
            objc_storeStrong(&v30, 0);
            objc_storeStrong(&v31, 0);
            objc_storeStrong(&v32, 0);
          }
          ++v18;
          if (v16 + 1 >= v19)
          {
            uint64_t v18 = 0;
            unint64_t v19 = [v20 countByEnumeratingWithState:v33 objects:v43 count:16];
            if (!v19) {
              break;
            }
          }
        }
      }

      uint64_t v7 = ++v37;
      id v8 = [(AMDFeatureDescriptor *)v40 maxRecords];
      BOOL v9 = v7 != [(NSNumber *)v8 integerValue];

      if (!v9) {
        break;
      }
      ++v24;
      if (v22 + 1 >= v25)
      {
        uint64_t v24 = 0;
        unint64_t v25 = [obj countByEnumeratingWithState:__b objects:v44 count:16];
        if (!v25) {
          break;
        }
      }
    }
  }

  v41[0] = 0x26BEB1878;
  v42[0] = v38;
  v41[1] = 0x26BEB7E38;
  v42[1] = 0x26BEB7E58;
  id v6 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 2, &v38);
  objc_storeStrong(v5, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)prepareResult:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(AMDFeatureDescriptor *)v25 aggregatedProperty];
  BOOL v20 = v3 != 0;

  if (v20)
  {
    id v26 = [(AMDFeatureDescriptor *)v25 prepareDictionaryResult:location[0]];
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x263EFF980]);
    id v23 = (id)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(location[0], "count"));
    memset(__b, 0, sizeof(__b));
    id obj = location[0];
    uint64_t v19 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
    if (v19)
    {
      uint64_t v14 = *(void *)__b[2];
      uint64_t v15 = 0;
      unint64_t v16 = v19;
      while (1)
      {
        uint64_t v13 = v15;
        if (*(void *)__b[2] != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(__b[1] + 8 * v15);
        id v7 = v23;
        id v6 = v22;
        BOOL v9 = [(AMDFeatureDescriptor *)v25 keyProperty];
        id v8 = (id)objc_msgSend(v6, "objectForKey:");
        objc_msgSend(v7, "addObject:");

        uint64_t v10 = [v23 count];
        id v11 = [(AMDFeatureDescriptor *)v25 maxRecords];
        BOOL v12 = v10 != [(NSNumber *)v11 integerValue];

        if (!v12) {
          break;
        }
        ++v15;
        if (v13 + 1 >= v16)
        {
          uint64_t v15 = 0;
          unint64_t v16 = [obj countByEnumeratingWithState:__b objects:v27 count:16];
          if (!v16) {
            break;
          }
        }
      }
    }

    id v26 = v23;
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(location, 0);
  id v4 = v26;

  return v4;
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (NSFetchRequest)fetchRequest
{
  return self->_fetchRequest;
}

- (void)setFetchRequest:(id)a3
{
}

- (NSString)joinTable
{
  return self->_joinTable;
}

- (void)setJoinTable:(id)a3
{
}

- (NSString)joinTableDomain
{
  return self->_joinTableDomain;
}

- (void)setJoinTableDomain:(id)a3
{
}

- (NSArray)joinRequiredColumns
{
  return self->_joinRequiredColumns;
}

- (void)setJoinRequiredColumns:(id)a3
{
}

- (NSString)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(id)a3
{
  self->_joinType = (NSString *)a3;
}

- (NSString)keyProperty
{
  return self->_keyProperty;
}

- (void)setKeyProperty:(id)a3
{
}

- (NSString)aggregatedProperty
{
  return self->_aggregatedProperty;
}

- (void)setAggregatedProperty:(id)a3
{
}

- (NSNumber)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(id)a3
{
}

- (NSNumber)maxRecords
{
  return self->_maxRecords;
}

- (void)setMaxRecords:(id)a3
{
}

- (BOOL)doOuterJoin
{
  return self->_doOuterJoin;
}

- (void)setDoOuterJoin:(BOOL)a3
{
  self->_doOuterJoin = a3;
}

- (NSObject)defaultJoinValue
{
  return self->_defaultJoinValue;
}

- (void)setDefaultJoinValue:(id)a3
{
}

- (NSDictionary)defaultJoinValueDict
{
  return self->_defaultJoinValueDict;
}

- (void)setDefaultJoinValueDict:(id)a3
{
}

- (NSMutableDictionary)propertyDict
{
  return self->_propertyDict;
}

- (void)setPropertyDict:(id)a3
{
}

- (NSMutableArray)aggregatedPropertyList
{
  return self->_aggregatedPropertyList;
}

- (void)setAggregatedPropertyList:(id)a3
{
}

- (NSString)sortKey
{
  return self->_sortKey;
}

- (void)setSortKey:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end