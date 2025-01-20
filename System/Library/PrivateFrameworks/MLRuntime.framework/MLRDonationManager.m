@interface MLRDonationManager
+ (id)defaultManager;
- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7;
- (MLRDonationManager)init;
- (OS_dispatch_queue)queue;
- (void)encodeAndUploadToDediscoWithIdentifier:(id)a3 measurements:(id)a4 withEncodingSchemas:(id)a5 metadata:(id)a6 completion:(id)a7;
- (void)setQueue:(id)a3;
@end

@implementation MLRDonationManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultManager_donationManagerClient;

  return v2;
}

uint64_t __36__MLRDonationManager_defaultManager__block_invoke()
{
  defaultManager_donationManagerClient = objc_alloc_init(MLRDonationManager);

  return MEMORY[0x270F9A758]();
}

- (MLRDonationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MLRDonationManager;
  v2 = [(MLRDonationManager *)&v10 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    id v4 = objc_claimAutoreleasedReturnValue();
    v5 = (const char *)[v4 UTF8String];
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)encodeAndUploadToDediscoWithIdentifier:(id)a3 measurements:(id)a4 withEncodingSchemas:(id)a5 metadata:(id)a6 completion:(id)a7
{
  v60[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(id, void *))a7;
  if (!v12)
  {
    v18 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLRDonationManager encodeAndUploadToDediscoWithIdentifier:measurements:withEncodingSchemas:metadata:completion:](v18, v19, v20, v21, v22, v23, v24, v25);
    }

    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F3A4A0];
    uint64_t v59 = *MEMORY[0x263F08320];
    v60[0] = @"identifier must not be nil.";
    v28 = NSDictionary;
    v29 = (__CFString **)v60;
    v30 = &v59;
    goto LABEL_14;
  }
  if (!v13)
  {
    v31 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MLRDonationManager encodeAndUploadToDediscoWithIdentifier:measurements:withEncodingSchemas:metadata:completion:](v31, v32, v33, v34, v35, v36, v37, v38);
    }

    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F3A4A0];
    uint64_t v57 = *MEMORY[0x263F08320];
    v58 = @"measurements must be not be nil.";
    v28 = NSDictionary;
    v29 = &v58;
    v30 = &v57;
    goto LABEL_14;
  }
  if (!v14)
  {
    v39 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[MLRDonationManager encodeAndUploadToDediscoWithIdentifier:measurements:withEncodingSchemas:metadata:completion:](v39, v40, v41, v42, v43, v44, v45, v46);
    }

    v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F3A4A0];
    uint64_t v55 = *MEMORY[0x263F08320];
    v56 = @"encodingSchemas must be not be nil.";
    v28 = NSDictionary;
    v29 = &v56;
    v30 = &v55;
LABEL_14:
    v47 = [v28 dictionaryWithObjects:v29 forKeys:v30 count:1];
    v48 = [v26 errorWithDomain:v27 code:1400 userInfo:v47];
    v16[2](v16, v48);

    goto LABEL_15;
  }
  v17 = [(MLRDonationManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke;
  block[3] = &unk_2643F1ED0;
  block[4] = self;
  id v50 = v12;
  id v51 = v13;
  id v52 = v14;
  id v53 = v15;
  v54 = v16;
  dispatch_async(v17, block);

LABEL_15:
}

void __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v11[0] = a1[6];
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[8];
  id v10 = 0;
  char v7 = [v2 record:v3 data:v4 encodingSchema:v5 metadata:v6 errorOut:&v10];
  id v8 = v10;

  if (v8 || (v7 & 1) == 0)
  {
    v9 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke_cold_1((uint64_t)v8, v9);
    }
  }
  (*(void (**)(void))(a1[9] + 16))();
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [MEMORY[0x263F3A438] coreChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    id v30 = v11;
    __int16 v31 = 2112;
    id v32 = v12;
    __int16 v33 = 2112;
    id v34 = v13;
    __int16 v35 = 2112;
    id v36 = v14;
    _os_log_debug_impl(&dword_21C376000, v15, OS_LOG_TYPE_DEBUG, "Recording key=%@, data=%@, encodingSchema=%@, metadata=%@", buf, 0x2Au);
  }

  v16 = [v13 objectForKeyedSubscript:@"type"];
  int v17 = [v16 isEqual:@"decimal"];

  if (v17
    || ([v13 objectForKeyedSubscript:@"type"],
        v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 isEqual:@"fedstats"],
        v18,
        v19))
  {
    uint64_t v20 = [v13 objectForKeyedSubscript:@"encodingParameters"];
    uint64_t v21 = objc_opt_new();
    char v22 = [v21 record:v11 data:v12 encodingSchema:v20 metadata:v14 errorOut:a7];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x263F3A438] coreChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MLRDonationManager record:data:encodingSchema:metadata:errorOut:](v23);
    }

    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    uint64_t v25 = *MEMORY[0x263F3A4A0];
    uint64_t v27 = *MEMORY[0x263F08320];
    v28 = @"The encodingSchema type has to be either decimal or fedstats.";
    uint64_t v20 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    [v24 errorWithDomain:v25 code:1400 userInfo:v20];
    char v22 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeAndUploadToDediscoWithIdentifier:(uint64_t)a3 measurements:(uint64_t)a4 withEncodingSchemas:(uint64_t)a5 metadata:(uint64_t)a6 completion:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeAndUploadToDediscoWithIdentifier:(uint64_t)a3 measurements:(uint64_t)a4 withEncodingSchemas:(uint64_t)a5 metadata:(uint64_t)a6 completion:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeAndUploadToDediscoWithIdentifier:(uint64_t)a3 measurements:(uint64_t)a4 withEncodingSchemas:(uint64_t)a5 metadata:(uint64_t)a6 completion:(uint64_t)a7 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __114__MLRDonationManager_encodeAndUploadToDediscoWithIdentifier_measurements_withEncodingSchemas_metadata_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C376000, a2, OS_LOG_TYPE_ERROR, "dedisco donation hit error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)record:(os_log_t)log data:encodingSchema:metadata:errorOut:.cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 138412546;
  int v2 = @"decimal";
  __int16 v3 = 2112;
  uint64_t v4 = @"fedstats";
  _os_log_error_impl(&dword_21C376000, log, OS_LOG_TYPE_ERROR, "The encodingSchema type has to be either %@ or %@.", (uint8_t *)&v1, 0x16u);
}

@end