@interface _ANEEspressoIRTranslator
+ (BOOL)translateModelAt:(id)a3 key:(id)a4 outputPath:(id)a5 isEncryptedModel:(BOOL)a6 translationOptions:(id)a7 error:(id *)a8;
+ (id)createErrorForPlan:(void *)a3 status:(int)a4;
+ (void)destroyEspresso:(void *)a3 ctx:(void *)a4;
@end

@implementation _ANEEspressoIRTranslator

+ (id)createErrorForPlan:(void *)a3 status:(int)a4
{
  espresso_plan_get_error_info();
  v7 = +[NSString stringWithFormat:@"_ANEEspressoIRTranslator : error %s", v6];
  v8 = +[_ANELog compiler];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_100032BEC(a2, (uint64_t)v7, v8);
  }

  +[_ANEDataReporter addValue:1 forScalarKey:@"ModelFailsEspressoCompilation"];
  v9 = +[_ANEStrings errorDomainEspresso];
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  v14 = v7;
  v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v11 = +[NSError errorWithDomain:v9 code:a4 userInfo:v10];

  return v11;
}

+ (BOOL)translateModelAt:(id)a3 key:(id)a4 outputPath:(id)a5 isEncryptedModel:(BOOL)a6 translationOptions:(id)a7 error:(id *)a8
{
  BOOL v38 = a6;
  id v39 = a3;
  id v43 = a4;
  id v42 = a5;
  id v11 = a7;
  uint64_t context = espresso_create_context();
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  NSErrorUserInfoKey v13 = [v11 allKeys];
  id v14 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
  v15 = &OBJC_IVAR____ANEDeviceController__device;
  if (v14)
  {
    id v16 = v14;
    uint64_t v17 = *(void *)v46;
    do
    {
      v18 = 0;
      do
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(id *)(*((void *)&v45 + 1) + 8 * (void)v18);
        [v19 UTF8String];
        v20 = [v11 objectForKeyedSubscript:v19];
        [v20 intValue];
        int v21 = espresso_context_set_int_option();

        if (v21)
        {
          v22 = [v15 + 308 compiler];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            v23 = NSStringFromSelector(a2);
            v24 = [v11 objectForKeyedSubscript:v19];
            unsigned int v25 = [v24 intValue];
            *(_DWORD *)buf = 138412802;
            *(void *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v19;
            __int16 v50 = 1024;
            unsigned int v51 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@: Failed to set int option for %@ and value: %d", buf, 0x1Cu);

            v15 = &OBJC_IVAR____ANEDeviceController__device;
          }
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      id v16 = [v13 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v16);
  }

  if (v38)
  {
    v26 = [v15 + 308 compiler];
    v28 = a8;
    id v27 = a1;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v29 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v29;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%@: Creating espresso plan for encrypted model", buf, 0xCu);
    }
    v30 = v43;
  }
  else
  {
    v30 = v43;
    v28 = a8;
    id v27 = a1;
  }
  uint64_t plan = espresso_create_plan();
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  id v32 = v39;
  [v32 UTF8String];
  uint64_t v33 = espresso_plan_add_network();
  if (v33)
  {
    v34 = v42;
LABEL_21:
    if (v28)
    {
      id *v28 = [v27 createErrorForPlan:plan status:v33];
    }
    [(id)objc_opt_class() destroyEspresso:plan ctx:context];
    BOOL v35 = 0;
    goto LABEL_24;
  }
  [v30 UTF8String];
  uint64_t v33 = espresso_network_compiler_set_metadata_key();
  v34 = v42;
  if (v33) {
    goto LABEL_21;
  }
  uint64_t v33 = espresso_plan_build();
  if (v33) {
    goto LABEL_21;
  }
  [v42 UTF8String];
  uint64_t v37 = espresso_dump_ir();
  BOOL v35 = v37 == 0;
  if (v37 && v28)
  {
    id *v28 = [v27 createErrorForPlan:plan status:v37];
  }
  [(id)objc_opt_class() destroyEspresso:plan ctx:context];
LABEL_24:

  return v35;
}

+ (void)destroyEspresso:(void *)a3 ctx:(void *)a4
{
  espresso_plan_destroy();
  _espresso_context_destroy(a4);
}

@end