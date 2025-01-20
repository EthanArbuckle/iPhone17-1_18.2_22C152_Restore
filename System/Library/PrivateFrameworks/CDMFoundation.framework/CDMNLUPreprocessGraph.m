@interface CDMNLUPreprocessGraph
+ (BOOL)requiresAssets;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requiredDAGServices;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
- (void)buildGraph;
@end

@implementation CDMNLUPreprocessGraph

+ (id)requiredDAGServices
{
  v24[9] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = (objc_class *)objc_opt_class();
  v23 = NSStringFromClass(v3);
  v24[0] = v23;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v24[1] = v5;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v24[2] = v7;
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v24[3] = v9;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v24[4] = v11;
  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v24[5] = v13;
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v24[6] = v15;
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v24[7] = v17;
  v18 = (objc_class *)objc_opt_class();
  v19 = NSStringFromClass(v18);
  v24[8] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:9];
  v21 = [v2 setWithArray:v20];

  return v21;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v5 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = [NSNumber numberWithInteger:a3];
      int v9 = 136315394;
      v10 = "+[CDMNLUPreprocessGraph getUsageForAssetSetName:withLocale:]";
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v9, 0x16u);
    }
    v6 = 0;
  }
  else
  {
    v6 = +[CDMAssetsUtils getAssistantUsages:a4];
  }
  return v6;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 6;
}

+ (BOOL)requiresAssets
{
  return 1;
}

- (void)buildGraph
{
  objc_initWeak(location, self);
  v3 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v4 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v5 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v6 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v59 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v57 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  uint64_t v7 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v53 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v55 = (void *)v7;
  uint64_t v8 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v155[0] = 0;
  v155[1] = v155;
  v155[2] = 0x3032000000;
  v155[3] = __Block_byref_object_copy__4974;
  v155[4] = __Block_byref_object_dispose__4975;
  id v156 = 0;
  v153[0] = 0;
  v153[1] = v153;
  v153[2] = 0x3032000000;
  v153[3] = __Block_byref_object_copy__4974;
  v153[4] = __Block_byref_object_dispose__4975;
  id v154 = 0;
  v151[0] = 0;
  v151[1] = v151;
  v151[2] = 0x3032000000;
  v151[3] = __Block_byref_object_copy__4974;
  v151[4] = __Block_byref_object_dispose__4975;
  id v152 = 0;
  v149[0] = 0;
  v149[1] = v149;
  v149[2] = 0x3032000000;
  v149[3] = __Block_byref_object_copy__4974;
  v149[4] = __Block_byref_object_dispose__4975;
  id v150 = 0;
  v147[0] = 0;
  v147[1] = v147;
  v147[2] = 0x3032000000;
  v147[3] = __Block_byref_object_copy__4974;
  v147[4] = __Block_byref_object_dispose__4975;
  id v148 = 0;
  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x3032000000;
  v145[3] = __Block_byref_object_copy__4974;
  v145[4] = __Block_byref_object_dispose__4975;
  id v146 = 0;
  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x3032000000;
  v143[3] = __Block_byref_object_copy__4974;
  v143[4] = __Block_byref_object_dispose__4975;
  id v144 = 0;
  v141[0] = 0;
  v141[1] = v141;
  v141[2] = 0x3032000000;
  v141[3] = __Block_byref_object_copy__4974;
  v141[4] = __Block_byref_object_dispose__4975;
  id v142 = 0;
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x3032000000;
  v139[3] = __Block_byref_object_copy__4974;
  v139[4] = __Block_byref_object_dispose__4975;
  id v140 = 0;
  v137[0] = 0;
  v137[1] = v137;
  v137[2] = 0x3032000000;
  v137[3] = __Block_byref_object_copy__4974;
  v137[4] = __Block_byref_object_dispose__4975;
  id v138 = 0;
  v135[0] = 0;
  v135[1] = v135;
  v135[2] = 0x3032000000;
  v135[3] = __Block_byref_object_copy__4974;
  v135[4] = __Block_byref_object_dispose__4975;
  id v136 = 0;
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x3032000000;
  v133[3] = __Block_byref_object_copy__4974;
  v133[4] = __Block_byref_object_dispose__4975;
  id v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__4974;
  v131[4] = __Block_byref_object_dispose__4975;
  id v132 = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x3032000000;
  v129[3] = __Block_byref_object_copy__4974;
  v129[4] = __Block_byref_object_dispose__4975;
  id v130 = 0;
  int v9 = [(CDMServiceGraph *)self getGraphInput];
  v10 = [v9 siriNLUTypeObj];
  __int16 v11 = [(CDMServiceGraph *)self getLanguage];
  v12 = [(CDMServiceGraph *)self validateRequest:v10];
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3032000000;
  v127[3] = __Block_byref_object_copy__4974;
  v127[4] = __Block_byref_object_dispose__4975;
  [v12 utterance];
  v51 = (void *)v8;
  v48 = v12;
  v49 = v9;
  id v128 = (id)objc_claimAutoreleasedReturnValue();
  [(CDMServiceGraph *)self populateRequesterEnumForNluRequest:v10];
  uint64_t v13 = [v10 requestId];
  v122[0] = MEMORY[0x263EF8330];
  v122[1] = 3221225472;
  v122[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke;
  v122[3] = &unk_2647A5740;
  v125 = v127;
  id v47 = v11;
  id v123 = v47;
  v126 = v155;
  id v14 = v3;
  id v124 = v14;
  v15 = [(CDMServiceGraph *)self addNodeWithName:@"doCurrentTokenize" bindService:v14 requestId:v13 block:v122];

  v16 = [v10 requestId];
  v117[0] = MEMORY[0x263EF8330];
  v117[1] = 3221225472;
  v117[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_591;
  v117[3] = &unk_2647A5740;
  v120 = v155;
  id v17 = v10;
  id v118 = v17;
  v121 = v149;
  id v18 = v4;
  id v119 = v18;
  v50 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanizationDateTime" bindService:v18 requestId:v16 block:v117];

  v19 = [v17 requestId];
  v112[0] = MEMORY[0x263EF8330];
  v112[1] = 3221225472;
  v112[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_594;
  v112[3] = &unk_2647A5740;
  v115 = v155;
  id v20 = v17;
  id v113 = v20;
  v116 = v147;
  id v21 = v5;
  id v114 = v21;
  v62 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanizationRegex" bindService:v21 requestId:v19 block:v112];

  v22 = [v20 requestId];
  v107[0] = MEMORY[0x263EF8330];
  v107[1] = 3221225472;
  v107[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_595;
  v107[3] = &unk_2647A5740;
  v110 = v155;
  id v23 = v20;
  id v108 = v23;
  v111 = v145;
  id v24 = v6;
  id v109 = v24;
  v61 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanizationSiriVocabulary" bindService:v24 requestId:v22 block:v107];

  v25 = [v23 requestId];
  v102[9] = MEMORY[0x263EF8330];
  v102[10] = 3221225472;
  v102[11] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_596;
  v102[12] = &unk_2647A5740;
  v105 = v155;
  id v26 = v23;
  id v103 = v26;
  v106 = v143;
  id v104 = v59;
  id v46 = v104;
  v60 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doSpanizationVoc");
  v45 = v24;

  v27 = [v26 requestId];
  v102[0] = MEMORY[0x263EF8330];
  v102[1] = 3221225472;
  v102[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_597;
  v102[3] = &unk_2647A4D78;
  v102[4] = v141;
  v102[5] = v149;
  v102[6] = v147;
  v102[7] = v145;
  v102[8] = v143;
  v28 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanization" requestId:v27 block:v102];

  v29 = [v26 requestId];
  uint64_t v94 = MEMORY[0x263EF8330];
  uint64_t v95 = 3221225472;
  v96 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_2;
  v97 = &unk_2647A4DA0;
  v99 = v155;
  id v98 = v57;
  v100 = v153;
  v101 = v151;
  id v58 = v98;
  v30 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doEmbedding");
  v44 = v18;

  v31 = [v26 requestId];
  uint64_t v85 = MEMORY[0x263EF8330];
  uint64_t v86 = 3221225472;
  v87 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_601;
  v88 = &unk_2647A4DC8;
  v91 = v139;
  id v32 = v26;
  id v89 = v32;
  v92 = v155;
  v93 = v137;
  id v90 = v55;
  id v56 = v90;
  v33 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doContextualSpanMatching");
  v43 = v21;

  v34 = [v32 requestId];
  uint64_t v74 = MEMORY[0x263EF8330];
  uint64_t v75 = 3221225472;
  v76 = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_607;
  v77 = &unk_2647A4DF0;
  v80 = v135;
  v81 = v155;
  v82 = v153;
  v83 = v151;
  id v35 = v32;
  id v78 = v35;
  v84 = v133;
  id v79 = v53;
  id v54 = v79;
  v36 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doMentionDetection");
  v42 = v14;

  v37 = [v35 requestId];
  v64[1] = (id)MEMORY[0x263EF8330];
  v64[2] = (id)3221225472;
  v64[3] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_616;
  v64[4] = &unk_2647A4E18;
  v67 = v133;
  id v38 = v35;
  id v65 = v38;
  v68 = v131;
  v69 = v155;
  v70 = v137;
  v71 = v153;
  v72 = v151;
  v73 = v129;
  id v66 = v51;
  id v52 = v66;
  v39 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doMentionResolving");

  v40 = [v38 requestId];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_619;
  v63[3] = &unk_2647A4E40;
  v63[4] = v155;
  v63[5] = v141;
  v63[6] = v129;
  objc_copyWeak(v64, location);
  v41 = [(CDMServiceGraph *)self addNodeWithName:@"doPostProcess" requestId:v40 block:v63];

  [v50 addDependency:v15];
  [v62 addDependency:v15];
  [v61 addDependency:v15];
  [v60 addDependency:v15];
  [v28 addDependency:v50];
  [v28 addDependency:v62];
  [v28 addDependency:v61];
  [v28 addDependency:v60];
  [v30 addDependency:v15];
  [v33 addDependency:v15];
  [v39 addDependency:v33];
  [v36 addDependency:v30];
  [v39 addDependency:v36];
  [v41 addDependency:v28];
  [v41 addDependency:v39];

  objc_destroyWeak(v64);
  _Block_object_dispose(v127, 8);

  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);

  _Block_object_dispose(v133, 8);
  _Block_object_dispose(v135, 8);

  _Block_object_dispose(v137, 8);
  _Block_object_dispose(v139, 8);

  _Block_object_dispose(v141, 8);
  _Block_object_dispose(v143, 8);

  _Block_object_dispose(v145, 8);
  _Block_object_dispose(v147, 8);

  _Block_object_dispose(v149, 8);
  _Block_object_dispose(v151, 8);

  _Block_object_dispose(v153, 8);
  _Block_object_dispose(v155, 8);

  objc_destroyWeak(location);
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    v10 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizationProtoService", (uint8_t *)&v9, 0xCu);
  }

  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v9 = 136315394;
    v10 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Extracted from NluRequest, utterance: %@", (uint8_t *)&v9, 0x16u);
  }

  v4 = +[CDMTokenizerProtoService createProtoTokenRequestWithText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) locale:*(void *)(a1 + 32)];
  uint64_t v5 = [*(id *)(a1 + 40) handle:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_591(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response];
  v4 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];
  uint64_t v7 = +[CDMBaseSpanMatchService convertToSpanMatchRequest:v3 nlContext:v6];

  uint64_t v8 = [[CDMSpanMatcherRequestCommand alloc] initWithRequest:v7];
  uint64_t v9 = [*(id *)(a1 + 40) handle:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_594(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response];
  v4 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];
  uint64_t v7 = +[CDMBaseSpanMatchService convertToSpanMatchRequest:v3 nlContext:v6];

  uint64_t v8 = [[CDMSpanMatcherRequestCommand alloc] initWithRequest:v7];
  uint64_t v9 = [*(id *)(a1 + 40) handle:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_595(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response];
  v4 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];
  uint64_t v7 = +[CDMBaseSpanMatchService convertToSpanMatchRequest:v3 nlContext:v6];

  uint64_t v8 = [[CDMSpanMatcherRequestCommand alloc] initWithRequest:v7];
  uint64_t v9 = [*(id *)(a1 + 40) handle:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_596(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    uint64_t v13 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatchRequestCommand for use in CDMSpanMatchService", (uint8_t *)&v12, 0xCu);
  }

  v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response];
  v4 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];
  uint64_t v7 = +[CDMBaseSpanMatchService convertToSpanMatchRequest:v3 nlContext:v6];

  uint64_t v8 = [[CDMSpanMatcherRequestCommand alloc] initWithRequest:v7];
  uint64_t v9 = [*(id *)(a1 + 40) handle:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

uint64_t __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_597(void *a1)
{
  *(void *)(*(void *)(a1[4] + 8) + 40) = +[CDMServiceGraphUtil mergeDateTimeSpans:*(void *)(*(void *)(a1[5] + 8) + 40) regexSpans:*(void *)(*(void *)(a1[6] + 8) + 40) siriVocabularySpans:*(void *)(*(void *)(a1[7] + 8) + 40) vocSpans:*(void *)(*(void *)(a1[8] + 8) + 40)];
  return MEMORY[0x270F9A758]();
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    id v17 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v16, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71E00]);
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) response];
  uint64_t v5 = [v4 tokenChain];
  [v3 setTokenChain:v5];

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) response];
  uint64_t v7 = [v6 text];
  [v3 setText:v7];

  uint64_t v8 = [[CDMEmbeddingProtoRequestCommand alloc] initWithRequest:v3];
  uint64_t v9 = [*(id *)(a1 + 32) handle:v8];
  uint64_t v10 = [v9 response];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  int v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [v9 embeddingConfigs];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_601(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315138;
    v22 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMContextualSpanMatcherRequestCommand for use in CDMContextualSpanMatcherService", (uint8_t *)&v21, 0xCu);
  }

  id v3 = [CDMContextualSpanMatcherRequestCommand alloc];
  v4 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];
  uint64_t v7 = [*(id *)(a1 + 32) requestId];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v9 = [v8 tokenChain];
  uint64_t v10 = +[CDMContextualSpanMatcherServiceUtils buildContextualSpanMatcherRequestWithNLContext:v6 requestId:v7 tokenChain:v9];
  uint64_t v11 = [(CDMContextualSpanMatcherRequestCommand *)v3 initWithContextualSpanMatcherRequest:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(a1 + 40) handle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  id v17 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cmdError];

  if (v17)
  {
    uint64_t v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cmdError];
      id v20 = [v19 localizedDescription];
      int v21 = 136315394;
      v22 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
      __int16 v23 = 2112;
      id v24 = v20;
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: ContextualSpanMatcher prediction failed: %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_607(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionDetectorRequestCommand for use in CDMMentionDetectorService", buf, 0xCu);
  }

  int v21 = [CDMMentionDetectorRequestCommand alloc];
  __int16 v23 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  v22 = [v23 text];
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  v4 = [v3 tokenChain];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) embeddingTensorOutputs];
  uint64_t v6 = +[CDMServiceGraphUtil embeddingsOutput:v5 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forFactor:@"com.apple.siri.nl.marrs.md"];
  uint64_t v7 = [*(id *)(a1 + 32) requestId];
  uint64_t v8 = [v7 nluRequestId];
  uint64_t v9 = [*(id *)(a1 + 32) requestId];
  uint64_t v10 = +[CDMMentionDetectorServiceUtils buildMDRequestWithUtterance:v22 tokenChain:v4 embedding:v6 nluRequestId:v8 resultCandidateId:&stru_26DA24FF0 cdmRequestId:v9];
  uint64_t v11 = [(CDMMentionDetectorRequestCommand *)v21 initWithMDRequest:v10 withCurrTurn:0];
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [*(id *)(a1 + 40) handle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 80) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  id v17 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) cmdError];

  if (v17)
  {
    uint64_t v18 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) cmdError];
      id v20 = [v19 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v25 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
      __int16 v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_2263A0000, v18, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Detection prediction failed: %@", buf, 0x16u);
    }
  }
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_616(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v32 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionResolverRequestCommand for use in CDMMentionResolverService", buf, 0xCu);
  }

  id v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    __int16 v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    id v32 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    __int16 v33 = 2112;
    v34 = v23;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s CDMMentionDetectorResponseCommand: %@", buf, 0x16u);
  }

  uint64_t v25 = [*(id *)(a1 + 32) currentTurnInput];
  id v24 = [CDMMentionResolverRequestCommand alloc];
  v30 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) response];
  uint64_t v28 = [v30 tokenChain];
  v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response];
  __int16 v26 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) contextualSpanMatcherResponse];
  v29 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  v4 = +[CDMServiceGraphUtil embeddingsOutput:v29 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.marrs.md"];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) response];
  uint64_t v6 = [v5 text];
  uint64_t v7 = [*(id *)(a1 + 32) previousTurnInputs];
  uint64_t v8 = [v7 count];
  uint64_t v9 = [*(id *)(a1 + 32) requestId];
  uint64_t v10 = [v9 nluRequestId];
  uint64_t v11 = [*(id *)(a1 + 32) requestId];
  uint64_t v12 = +[CDMMentionResolverServiceUtils buildMRRequestWithCurTurn:v25 tokenChain:v28 mdResponse:v27 contextualSpanMatcherResponse:v26 embedding:v4 utterance:v6 turnIndex:v8 nluRequestId:v10 resultCandidateId:&stru_26DA24FF0 cdmRequestId:v11];
  uint64_t v13 = [(CDMMentionResolverRequestCommand *)v24 initWithMRRequest:v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = [*(id *)(a1 + 40) handle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;

  v19 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) cmdError];

  if (v19)
  {
    id v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v21 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) cmdError];
      v22 = [v21 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v32 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
      __int16 v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Resolver prediction failed: %@", buf, 0x16u);
    }
  }
}

void __35__CDMNLUPreprocessGraph_buildGraph__block_invoke_619(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[CDMNLUPreprocessGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Final post process step", (uint8_t *)&v10, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71EA0]);
  v4 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) response];
  [v3 setTokenizerResponse:v4];

  id v5 = objc_alloc_init(MEMORY[0x263F71E08]);
  [v3 setEmbeddingResponse:v5];

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) spanMatchResponse];
  [v3 setSpanMatchResponse:v6];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) response];
  [v3 setMentionResolverResponse:v7];

  uint64_t v8 = [[CDMNLUPreprocessResponseCommand alloc] initWithPreprocessingWrapper:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setGraphOutput:v8];
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end