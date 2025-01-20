@interface ATXWalletDataSource
- (ATXWalletDataSource)initWithDevice:(id)a3;
- (id)_extractRelevantSemanticTagsFromPass:(id)a3;
- (unint64_t)_getPassStyleMaskForString:(id)a3;
- (void)passesWithStyle:(id)a3 callback:(id)a4;
@end

@implementation ATXWalletDataSource

- (void)passesWithStyle:(id)a3 callback:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1F2727278) & 1) == 0)
  {
LABEL_6:
    (*((void (**)(id, void, void))v6 + 2))(v6, MEMORY[0x1E4F1CBF0], 0);
    goto LABEL_31;
  }
  v7 = +[ATXWalletDataSourceSharedData sharedInstance];
  int v8 = [v7 hasEmptyWalletPasses];

  if (v8)
  {
    v9 = __atxlog_handle_heuristic();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0F43000, v9, OS_LOG_TYPE_DEFAULT, "Heuristics have cached no Wallet passes", buf, 2u);
    }

    goto LABEL_6;
  }
  v10 = objc_opt_new();
  v47 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2419200.0];
  if (![MEMORY[0x1E4F84898] isPassLibraryAvailable]) {
    goto LABEL_30;
  }
  id v45 = v6;
  id v46 = v5;
  unint64_t v11 = [(ATXWalletDataSource *)self _getPassStyleMaskForString:v5];
  v12 = +[ATXHeuristicResultCache sharedPassLibrary];
  v13 = [v12 passesOfStyles:v11];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v13;
  uint64_t v14 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  if (!v14) {
    goto LABEL_29;
  }
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)v52;
  uint64_t v48 = *MEMORY[0x1E4F87610];
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v52 != v16) {
        objc_enumerationMutation(obj);
      }
      v18 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      v19 = (void *)MEMORY[0x1D25F43D0]();
      v20 = objc_opt_new();
      v21 = [v18 relevantDate];

      if (v21)
      {
        v22 = NSNumber;
        v23 = [v18 relevantDate];
        [v23 timeIntervalSinceReferenceDate];
        v24 = objc_msgSend(v22, "numberWithDouble:");
        [v20 setObject:v24 forKeyedSubscript:@"date"];
      }
      v25 = [v18 localizedDescription];
      [v20 setObject:v25 forKeyedSubscript:@"description"];

      v26 = [v18 embeddedLocationsArray];
      v27 = [v26 allObjects];
      [v20 setObject:v27 forKeyedSubscript:@"locations"];

      v28 = [v18 localizedName];
      [v20 setObject:v28 forKeyedSubscript:@"name"];

      [v20 setObject:v18 forKeyedSubscript:@"pass"];
      v29 = [v18 serialNumber];
      [v20 setObject:v29 forKeyedSubscript:@"serial"];

      v30 = [v18 organizationName];
      [v20 setObject:v30 forKeyedSubscript:@"organization"];

      v31 = [v18 passURL];
      v32 = [v31 absoluteString];
      [v20 setObject:v32 forKeyedSubscript:@"url"];

      v33 = [v18 allSemantics];
      uint64_t v34 = [v33 count];

      if (v34)
      {
        v35 = [(ATXWalletDataSource *)self _extractRelevantSemanticTagsFromPass:v18];
        [v20 setValuesForKeysWithDictionary:v35];
      }
      if ((v11 & 0x10) == 0) {
        goto LABEL_21;
      }
      v36 = [v20 objectForKeyedSubscript:v48];
      v37 = v36;
      if (v36)
      {
        v38 = [v36 earlierDate:v47];

        if (v38 != v37)
        {

LABEL_21:
          [v10 addObject:v20];
          goto LABEL_27;
        }
        v39 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[ATXWalletDataSource passesWithStyle:callback:]((uint64_t)v56, (uint64_t)v18);
        }
      }
      else
      {
        v39 = __atxlog_handle_heuristic();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          -[ATXWalletDataSource passesWithStyle:callback:]((uint64_t)buf, (uint64_t)v18);
        }
      }

LABEL_27:
    }
    uint64_t v15 = [obj countByEnumeratingWithState:&v51 objects:v58 count:16];
  }
  while (v15);
LABEL_29:

  id v6 = v45;
  id v5 = v46;
LABEL_30:
  BOOL v40 = [v10 count] == 0;
  v41 = +[ATXWalletDataSourceSharedData sharedInstance];
  [v41 setHasEmptyWalletPasses:v40];

  v42 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"date" ascending:1];
  v55[0] = v42;
  v43 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"serial" ascending:1];
  v55[1] = v43;
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  [v10 sortUsingDescriptors:v44];

  (*((void (**)(id, void *, void))v6 + 2))(v6, v10, 0);
LABEL_31:
}

- (ATXWalletDataSource)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWalletDataSource;
  id v6 = [(ATXWalletDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (unint64_t)_getPassStyleMaskForString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 isEqualToString:@"ticket"])
    {
      unint64_t v5 = 4;
      goto LABEL_9;
    }
    if ([v4 isEqualToString:@"boardingPass"])
    {
      unint64_t v5 = 16;
      goto LABEL_9;
    }
  }
  id v6 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[ATXWalletDataSource _getPassStyleMaskForString:](v6);
  }

  unint64_t v5 = 0;
LABEL_9:

  return v5;
}

- (id)_extractRelevantSemanticTagsFromPass:(id)a3
{
  v94[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  unint64_t v5 = [v3 allSemantics];

  uint64_t v6 = *MEMORY[0x1E4F877A8];
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F877A8]];
  int v8 = [v7 stringValue];
  [v4 setObject:v8 forKeyedSubscript:v6];

  uint64_t v9 = *MEMORY[0x1E4F877A0];
  v10 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F877A0]];
  unint64_t v11 = [v10 stringValue];
  [v4 setObject:v11 forKeyedSubscript:v9];

  uint64_t v12 = *MEMORY[0x1E4F875F8];
  v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F875F8]];
  uint64_t v14 = [v13 dateValue];
  [v4 setObject:v14 forKeyedSubscript:v12];

  uint64_t v15 = *MEMORY[0x1E4F875F0];
  uint64_t v16 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F875F0]];
  v17 = [v16 dateValue];
  [v4 setObject:v17 forKeyedSubscript:v15];

  uint64_t v18 = *MEMORY[0x1E4F87680];
  v19 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87680]];
  v20 = [v19 numberValue];
  [v4 setObject:v20 forKeyedSubscript:v18];

  uint64_t v21 = *MEMORY[0x1E4F87860];
  v22 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87860]];
  v23 = [v22 stringValue];
  [v4 setObject:v23 forKeyedSubscript:v21];

  uint64_t v24 = *MEMORY[0x1E4F87878];
  v25 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87878]];
  v26 = [v25 stringValue];
  [v4 setObject:v26 forKeyedSubscript:v24];

  uint64_t v27 = *MEMORY[0x1E4F87840];
  v28 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87840]];
  v29 = [v28 stringValue];
  [v4 setObject:v29 forKeyedSubscript:v27];

  uint64_t v30 = *MEMORY[0x1E4F87868];
  v31 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87868]];
  v32 = [v31 stringValue];
  [v4 setObject:v32 forKeyedSubscript:v30];

  uint64_t v33 = *MEMORY[0x1E4F87670];
  uint64_t v34 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87670]];
  v35 = [v34 locationValue];

  if (v35)
  {
    v93[0] = @"lat";
    v36 = NSNumber;
    [v35 coordinate];
    v37 = objc_msgSend(v36, "numberWithDouble:");
    v93[1] = @"lon";
    v94[0] = v37;
    v38 = NSNumber;
    [v35 coordinate];
    BOOL v40 = [v38 numberWithDouble:v39];
    v94[1] = v40;
    v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:2];
    [v4 setObject:v41 forKeyedSubscript:v33];
  }
  uint64_t v42 = *MEMORY[0x1E4F87610];
  v43 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87610]];
  v44 = [v43 dateValue];
  [v4 setObject:v44 forKeyedSubscript:v42];

  uint64_t v45 = *MEMORY[0x1E4F87600];
  id v46 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87600]];
  v47 = [v46 dateValue];
  [v4 setObject:v47 forKeyedSubscript:v45];

  uint64_t v48 = *MEMORY[0x1E4F87738];
  v49 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87738]];
  v50 = [v49 stringValue];
  [v4 setObject:v50 forKeyedSubscript:v48];

  uint64_t v51 = *MEMORY[0x1E4F87660];
  long long v52 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87660]];
  long long v53 = [v52 locationValue];

  if (v53)
  {
    v91[0] = @"lat";
    long long v54 = NSNumber;
    [v53 coordinate];
    v55 = objc_msgSend(v54, "numberWithDouble:");
    v91[1] = @"lon";
    v92[0] = v55;
    v56 = NSNumber;
    [v53 coordinate];
    v58 = [v56 numberWithDouble:v57];
    v92[1] = v58;
    uint64_t v59 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v92 forKeys:v91 count:2];
    [v4 setObject:v59 forKeyedSubscript:v51];
  }
  uint64_t v60 = *MEMORY[0x1E4F87668];
  v61 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87668]];
  v62 = [v61 locationValue];

  if (v62)
  {
    v89[0] = @"lat";
    v63 = NSNumber;
    [v62 coordinate];
    v64 = objc_msgSend(v63, "numberWithDouble:");
    v89[1] = @"lon";
    v90[0] = v64;
    v65 = NSNumber;
    [v62 coordinate];
    v67 = [v65 numberWithDouble:v66];
    v90[1] = v67;
    v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:v89 count:2];
    [v4 setObject:v68 forKeyedSubscript:v60];
  }
  uint64_t v69 = *MEMORY[0x1E4F87770];
  v70 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87770]];
  v71 = [v70 stringValue];
  [v4 setObject:v71 forKeyedSubscript:v69];

  uint64_t v72 = *MEMORY[0x1E4F877B0];
  v73 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F877B0]];
  v74 = [v73 stringValue];
  [v4 setObject:v74 forKeyedSubscript:v72];

  uint64_t v75 = *MEMORY[0x1E4F87678];
  v76 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87678]];
  v77 = [v76 numberValue];
  [v4 setObject:v77 forKeyedSubscript:v75];

  uint64_t v78 = *MEMORY[0x1E4F876D8];
  v79 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F876D8]];
  v80 = [v79 stringValue];
  [v4 setObject:v80 forKeyedSubscript:v78];

  uint64_t v81 = *MEMORY[0x1E4F87720];
  v82 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87720]];
  v83 = [v82 stringValue];
  [v4 setObject:v83 forKeyedSubscript:v81];

  uint64_t v84 = *MEMORY[0x1E4F87758];
  v85 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F87758]];
  v86 = [v85 stringValue];
  [v4 setObject:v86 forKeyedSubscript:v84];

  v87 = __atxlog_handle_heuristic();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG)) {
    -[ATXWalletDataSource _extractRelevantSemanticTagsFromPass:]((uint64_t)v4, v87);
  }

  return v4;
}

- (void)passesWithStyle:(uint64_t)a1 callback:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "localizedDescription");
  *id v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1D0F43000, v5, v6, "ATXWalletDataSource: ignoring pass without departure date: %@");
}

- (void)passesWithStyle:(uint64_t)a1 callback:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_1(a1, a2), "localizedDescription");
  *id v3 = 138412290;
  void *v2 = v4;
  OUTLINED_FUNCTION_0_1(&dword_1D0F43000, v5, v6, "ATXWalletDataSource: ignoring old pass: %@");
}

- (void)_getPassStyleMaskForString:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0F43000, log, OS_LOG_TYPE_ERROR, "Unsupported pass style requested from Wallet data source", v1, 2u);
}

- (void)_extractRelevantSemanticTagsFromPass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0F43000, a2, OS_LOG_TYPE_DEBUG, "Extracted relevant semantic tags from pass: %@", (uint8_t *)&v2, 0xCu);
}

@end