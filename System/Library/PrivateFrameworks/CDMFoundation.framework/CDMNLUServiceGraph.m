@interface CDMNLUServiceGraph
+ (BOOL)requiresAssets;
+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4;
+ (id)requiredDAGServices;
+ (int)getNLXSchemaCDMServiceGraphName;
- (Class)supportedGraphInputType;
- (void)buildGraph;
@end

@implementation CDMNLUServiceGraph

+ (id)requiredDAGServices
{
  v50[22] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = (objc_class *)objc_opt_class();
  v49 = NSStringFromClass(v3);
  v50[0] = v49;
  v4 = (objc_class *)objc_opt_class();
  v48 = NSStringFromClass(v4);
  v50[1] = v48;
  v5 = (objc_class *)objc_opt_class();
  v47 = NSStringFromClass(v5);
  v50[2] = v47;
  v6 = (objc_class *)objc_opt_class();
  v46 = NSStringFromClass(v6);
  v50[3] = v46;
  v7 = (objc_class *)objc_opt_class();
  v45 = NSStringFromClass(v7);
  v50[4] = v45;
  v8 = (objc_class *)objc_opt_class();
  v44 = NSStringFromClass(v8);
  v50[5] = v44;
  v9 = (objc_class *)objc_opt_class();
  v43 = NSStringFromClass(v9);
  v50[6] = v43;
  v10 = (objc_class *)objc_opt_class();
  v42 = NSStringFromClass(v10);
  v50[7] = v42;
  v11 = (objc_class *)objc_opt_class();
  v41 = NSStringFromClass(v11);
  v50[8] = v41;
  v12 = (objc_class *)objc_opt_class();
  v40 = NSStringFromClass(v12);
  v50[9] = v40;
  v13 = (objc_class *)objc_opt_class();
  v39 = NSStringFromClass(v13);
  v50[10] = v39;
  v14 = (objc_class *)objc_opt_class();
  v38 = NSStringFromClass(v14);
  v50[11] = v38;
  v15 = (objc_class *)objc_opt_class();
  v37 = NSStringFromClass(v15);
  v50[12] = v37;
  v16 = (objc_class *)objc_opt_class();
  v36 = NSStringFromClass(v16);
  v50[13] = v36;
  v17 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v17);
  v50[14] = v18;
  v19 = (objc_class *)objc_opt_class();
  v20 = NSStringFromClass(v19);
  v50[15] = v20;
  v21 = (objc_class *)objc_opt_class();
  v22 = NSStringFromClass(v21);
  v50[16] = v22;
  v23 = (objc_class *)objc_opt_class();
  v24 = NSStringFromClass(v23);
  v50[17] = v24;
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v50[18] = v26;
  v27 = (objc_class *)objc_opt_class();
  v28 = NSStringFromClass(v27);
  v50[19] = v28;
  v29 = (objc_class *)objc_opt_class();
  v30 = NSStringFromClass(v29);
  v50[20] = v30;
  v31 = (objc_class *)objc_opt_class();
  v32 = NSStringFromClass(v31);
  v50[21] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:22];
  v34 = [v2 setWithArray:v33];

  return v34;
}

+ (id)getUsageForAssetSetName:(int64_t)a3 withLocale:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (a3 == 1)
  {
    uint64_t v6 = +[CDMAssetsUtils getNLUsages:v5];
    goto LABEL_5;
  }
  if (!a3)
  {
    uint64_t v6 = +[CDMAssetsUtils getAssistantUsages:v5];
LABEL_5:
    v7 = (void *)v6;
    goto LABEL_9;
  }
  v8 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = [NSNumber numberWithInteger:a3];
    int v11 = 136315394;
    v12 = "+[CDMNLUServiceGraph getUsageForAssetSetName:withLocale:]";
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_debug_impl(&dword_2263A0000, v8, OS_LOG_TYPE_DEBUG, "%s No usages found for asset set name %@", (uint8_t *)&v11, 0x16u);
  }
  v7 = 0;
LABEL_9:

  return v7;
}

+ (int)getNLXSchemaCDMServiceGraphName
{
  return 1;
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
  v162 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v158 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v156 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v154 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v152 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  uint64_t v5 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v160 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v150 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  uint64_t v6 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  uint64_t v7 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  uint64_t v8 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  uint64_t v9 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v138 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v131 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v145 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v136 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v143 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v132 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v126 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v129 = (void *)v5;
  v141 = [(CDMServiceGraph *)self getServiceByClass:objc_opt_class()];
  v500[0] = 0;
  v500[1] = v500;
  v500[2] = 0x3032000000;
  v500[3] = __Block_byref_object_copy__476;
  v500[4] = __Block_byref_object_dispose__477;
  id v501 = 0;
  v498[0] = 0;
  v498[1] = v498;
  v498[2] = 0x3032000000;
  v498[3] = __Block_byref_object_copy__476;
  v498[4] = __Block_byref_object_dispose__477;
  id v499 = 0;
  v496[0] = 0;
  v496[1] = v496;
  v496[2] = 0x3032000000;
  v496[3] = __Block_byref_object_copy__476;
  v496[4] = __Block_byref_object_dispose__477;
  id v497 = 0;
  v494[0] = 0;
  v494[1] = v494;
  v494[2] = 0x3032000000;
  v494[3] = __Block_byref_object_copy__476;
  v494[4] = __Block_byref_object_dispose__477;
  id v495 = 0;
  v492[0] = 0;
  v492[1] = v492;
  v492[2] = 0x3032000000;
  v492[3] = __Block_byref_object_copy__476;
  v492[4] = __Block_byref_object_dispose__477;
  id v493 = 0;
  v490[0] = 0;
  v490[1] = v490;
  v490[2] = 0x3032000000;
  v490[3] = __Block_byref_object_copy__476;
  v490[4] = __Block_byref_object_dispose__477;
  id v491 = 0;
  v488[0] = 0;
  v488[1] = v488;
  v488[2] = 0x3032000000;
  v488[3] = __Block_byref_object_copy__476;
  v488[4] = __Block_byref_object_dispose__477;
  id v489 = 0;
  v486[0] = 0;
  v486[1] = v486;
  v486[2] = 0x3032000000;
  v486[3] = __Block_byref_object_copy__476;
  v486[4] = __Block_byref_object_dispose__477;
  id v487 = 0;
  v484[0] = 0;
  v484[1] = v484;
  v484[2] = 0x3032000000;
  v484[3] = __Block_byref_object_copy__476;
  v484[4] = __Block_byref_object_dispose__477;
  id v485 = 0;
  v482[0] = 0;
  v482[1] = v482;
  v482[2] = 0x3032000000;
  v482[3] = __Block_byref_object_copy__476;
  v482[4] = __Block_byref_object_dispose__477;
  id v483 = 0;
  v480[0] = 0;
  v480[1] = v480;
  v480[2] = 0x3032000000;
  v480[3] = __Block_byref_object_copy__476;
  v480[4] = __Block_byref_object_dispose__477;
  id v481 = 0;
  v478[0] = 0;
  v478[1] = v478;
  v478[2] = 0x3032000000;
  v478[3] = __Block_byref_object_copy__476;
  v478[4] = __Block_byref_object_dispose__477;
  id v479 = 0;
  v476[0] = 0;
  v476[1] = v476;
  v476[2] = 0x3032000000;
  v476[3] = __Block_byref_object_copy__476;
  v476[4] = __Block_byref_object_dispose__477;
  id v477 = 0;
  v474[0] = 0;
  v474[1] = v474;
  v474[2] = 0x3032000000;
  v474[3] = __Block_byref_object_copy__476;
  v474[4] = __Block_byref_object_dispose__477;
  id v475 = 0;
  v472[0] = 0;
  v472[1] = v472;
  v472[2] = 0x3032000000;
  v472[3] = __Block_byref_object_copy__476;
  v472[4] = __Block_byref_object_dispose__477;
  id v473 = 0;
  v470[0] = 0;
  v470[1] = v470;
  v470[2] = 0x3032000000;
  v470[3] = __Block_byref_object_copy__476;
  v470[4] = __Block_byref_object_dispose__477;
  id v471 = 0;
  v468[0] = 0;
  v468[1] = v468;
  v468[2] = 0x3032000000;
  v468[3] = __Block_byref_object_copy__476;
  v468[4] = __Block_byref_object_dispose__477;
  id v469 = 0;
  v466[0] = 0;
  v466[1] = v466;
  v466[2] = 0x3032000000;
  v466[3] = __Block_byref_object_copy__476;
  v466[4] = __Block_byref_object_dispose__477;
  id v467 = 0;
  v464[0] = 0;
  v464[1] = v464;
  v464[2] = 0x3032000000;
  v464[3] = __Block_byref_object_copy__476;
  v464[4] = __Block_byref_object_dispose__477;
  id v465 = 0;
  v462[0] = 0;
  v462[1] = v462;
  v462[2] = 0x3032000000;
  v462[3] = __Block_byref_object_copy__476;
  v462[4] = __Block_byref_object_dispose__477;
  id v463 = 0;
  v460[0] = 0;
  v460[1] = v460;
  v460[2] = 0x3032000000;
  v460[3] = __Block_byref_object_copy__476;
  v460[4] = __Block_byref_object_dispose__477;
  id v461 = 0;
  v458[0] = 0;
  v458[1] = v458;
  v458[2] = 0x3032000000;
  v458[3] = __Block_byref_object_copy__476;
  v458[4] = __Block_byref_object_dispose__477;
  id v459 = 0;
  v456[0] = 0;
  v456[1] = v456;
  v456[2] = 0x3032000000;
  v456[3] = __Block_byref_object_copy__476;
  v456[4] = __Block_byref_object_dispose__477;
  id v457 = 0;
  v454[0] = 0;
  v454[1] = v454;
  v454[2] = 0x3032000000;
  v454[3] = __Block_byref_object_copy__476;
  v454[4] = __Block_byref_object_dispose__477;
  id v455 = 0;
  v452[0] = 0;
  v452[1] = v452;
  v452[2] = 0x3032000000;
  v452[3] = __Block_byref_object_copy__476;
  v452[4] = __Block_byref_object_dispose__477;
  id v453 = 0;
  v450[0] = 0;
  v450[1] = v450;
  v450[2] = 0x3032000000;
  v450[3] = __Block_byref_object_copy__476;
  v450[4] = __Block_byref_object_dispose__477;
  id v451 = 0;
  v448[0] = 0;
  v448[1] = v448;
  v448[2] = 0x3032000000;
  v448[3] = __Block_byref_object_copy__476;
  v448[4] = __Block_byref_object_dispose__477;
  id v449 = 0;
  v446[0] = 0;
  v446[1] = v446;
  v446[2] = 0x3032000000;
  v446[3] = __Block_byref_object_copy__476;
  v446[4] = __Block_byref_object_dispose__477;
  id v447 = 0;
  v444[0] = 0;
  v444[1] = v444;
  v444[2] = 0x3032000000;
  v444[3] = __Block_byref_object_copy__476;
  v444[4] = __Block_byref_object_dispose__477;
  id v445 = 0;
  v442[0] = 0;
  v442[1] = v442;
  v442[2] = 0x3032000000;
  v442[3] = __Block_byref_object_copy__476;
  v442[4] = __Block_byref_object_dispose__477;
  id v443 = 0;
  v440[0] = 0;
  v440[1] = v440;
  v440[2] = 0x3032000000;
  v440[3] = __Block_byref_object_copy__476;
  v440[4] = __Block_byref_object_dispose__477;
  id v441 = 0;
  v438[0] = 0;
  v438[1] = v438;
  v438[2] = 0x3032000000;
  v438[3] = __Block_byref_object_copy__476;
  v438[4] = __Block_byref_object_dispose__477;
  id v439 = 0;
  v436[0] = 0;
  v436[1] = v436;
  v436[2] = 0x3032000000;
  v436[3] = __Block_byref_object_copy__476;
  v436[4] = __Block_byref_object_dispose__477;
  id v437 = 0;
  v434[0] = 0;
  v434[1] = v434;
  v434[2] = 0x3032000000;
  v434[3] = __Block_byref_object_copy__476;
  v434[4] = __Block_byref_object_dispose__477;
  id v435 = 0;
  v432[0] = 0;
  v432[1] = v432;
  v432[2] = 0x3032000000;
  v432[3] = __Block_byref_object_copy__476;
  v432[4] = __Block_byref_object_dispose__477;
  id v433 = 0;
  v10 = [MEMORY[0x263F089D8] stringWithString:@"\n*** ✅ FOR DEBUGGING (start) ***"];
  [(CDMServiceGraph *)self getGraphInput];
  v122 = (void *)v7;
  v120 = v124 = (void *)v6;
  int v11 = [v120 siriNLUTypeObj];
  v12 = (void *)MEMORY[0x263F71F68];
  __int16 v13 = [v11 requestId];
  v128 = [v12 extractRequestLinkData:v13];

  v14 = [(CDMServiceGraph *)self getLanguage];
  uint64_t v15 = [(CDMServiceGraph *)self validateRequest:v11];
  v430[0] = 0;
  v430[1] = v430;
  v430[2] = 0x3032000000;
  v430[3] = __Block_byref_object_copy__476;
  v430[4] = __Block_byref_object_dispose__477;
  id v431 = [v15 utterance];
  v428[0] = 0;
  v428[1] = v428;
  v428[2] = 0x3032000000;
  v428[3] = __Block_byref_object_copy__476;
  v428[4] = __Block_byref_object_dispose__477;
  id v429 = [v15 idA];
  v426[0] = 0;
  v426[1] = v426;
  v426[2] = 0x3032000000;
  v426[3] = __Block_byref_object_copy__476;
  v426[4] = __Block_byref_object_dispose__477;
  id v427 = 0;
  [(CDMServiceGraph *)self populateRequesterEnumForNluRequest:v11];
  v118 = (void *)v8;
  v114 = (void *)v9;
  v16 = [v11 requestId];
  v420[0] = MEMORY[0x263EF8330];
  v420[1] = 3221225472;
  v420[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke;
  v420[3] = &unk_2647A4518;
  id v17 = v11;
  id v421 = v17;
  v423 = v462;
  v424 = v500;
  id v18 = v3;
  id v422 = v18;
  objc_copyWeak(&v425, location);
  v135 = [(CDMServiceGraph *)self addNodeWithName:@"doContextUpdate" bindService:v18 requestId:v16 block:v420];
  v112 = v15;
  v113 = v18;

  v19 = [v17 requestId];
  v413[0] = MEMORY[0x263EF8330];
  v413[1] = 3221225472;
  v413[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_609;
  v413[3] = &unk_2647A4540;
  id v20 = v17;
  id v414 = v20;
  id v21 = v14;
  id v415 = v21;
  v418 = v498;
  id v22 = v4;
  id v416 = v22;
  id v23 = v10;
  id v417 = v23;
  objc_copyWeak(&v419, location);
  uint64_t v24 = [(CDMServiceGraph *)self addNodeWithName:@"doCurrentTokenize" bindService:v22 requestId:v19 block:v413];

  v25 = [v20 requestId];
  v412[0] = MEMORY[0x263EF8330];
  v412[1] = 3221225472;
  v412[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_611;
  v412[3] = &unk_2647A4D78;
  v412[4] = v500;
  v412[5] = v426;
  v412[6] = v430;
  v412[7] = v496;
  v412[8] = v498;
  v164 = [(CDMServiceGraph *)self addNodeWithName:@"doCorrectedUtteranceTokenize" bindService:v22 requestId:v25 block:v412];

  v26 = [v20 requestId];
  v405[0] = MEMORY[0x263EF8330];
  v405[1] = 3221225472;
  v405[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_612;
  v405[3] = &unk_2647A4A58;
  v409 = v494;
  id v27 = v22;
  id v406 = v27;
  id v28 = v20;
  id v407 = v28;
  v410 = v430;
  id v29 = v21;
  id v408 = v29;
  objc_copyWeak(&v411, location);
  v134 = [(CDMServiceGraph *)self addNodeWithName:@"doPreviousTurnsTokenize" bindService:v160 requestId:v26 block:v405];

  v30 = [v28 requestId];
  v398[0] = MEMORY[0x263EF8330];
  v398[1] = 3221225472;
  v398[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2;
  v398[3] = &unk_2647A4A08;
  v400 = v496;
  v401 = v426;
  id v31 = v162;
  id v399 = v31;
  v402 = v486;
  v403 = v484;
  v404 = v488;
  v163 = [(CDMServiceGraph *)self addNodeWithName:@"doEmbedding" bindService:v31 requestId:v30 block:v398];

  v32 = [v28 requestId];
  v392[0] = MEMORY[0x263EF8330];
  v392[1] = 3221225472;
  v392[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_616;
  v392[3] = &unk_2647A4DC8;
  v395 = v500;
  v396 = v496;
  id v33 = v28;
  id v393 = v33;
  v397 = v482;
  id v34 = v158;
  id v394 = v34;
  v149 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanizationDateTime" bindService:v34 requestId:v32 block:v392];

  v35 = [v33 requestId];
  uint64_t v383 = MEMORY[0x263EF8330];
  uint64_t v384 = 3221225472;
  v385 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_620;
  v386 = &unk_2647A4DC8;
  v389 = v500;
  v390 = v496;
  id v36 = v33;
  id v387 = v36;
  v391 = v480;
  id v388 = v156;
  id v111 = v388;
  v148 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doSpanizationRegex");
  v116 = v23;

  v37 = [v36 requestId];
  v377[0] = MEMORY[0x263EF8330];
  v377[1] = 3221225472;
  v377[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_621;
  v377[3] = &unk_2647A4DC8;
  v380 = v500;
  v381 = v496;
  id v378 = v154;
  id v38 = v36;
  id v379 = v38;
  v382 = v478;
  id v110 = v378;
  v155 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanizationSiriVocabulary" bindService:v378 requestId:v37 block:v377];
  v108 = v31;
  v109 = v27;

  v39 = [v38 requestId];
  v371[0] = MEMORY[0x263EF8330];
  v371[1] = 3221225472;
  v371[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_623;
  v371[3] = &unk_2647A4DC8;
  v374 = v500;
  v375 = v496;
  id v40 = v38;
  id v372 = v40;
  v376 = v476;
  id v41 = v152;
  id v373 = v41;
  v147 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanizationVoc" bindService:v41 requestId:v39 block:v371];
  v106 = v41;
  v107 = v34;

  v42 = [v40 requestId];
  v359[0] = MEMORY[0x263EF8330];
  v359[1] = 3221225472;
  v359[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_624;
  v359[3] = &unk_2647A4568;
  id v360 = v150;
  id v43 = v40;
  id v361 = v43;
  v363 = v426;
  id v44 = v29;
  id v362 = v44;
  v364 = v496;
  v365 = v432;
  v366 = v486;
  v367 = v484;
  v368 = v500;
  v369 = v468;
  objc_copyWeak(&v370, location);
  id v105 = v360;
  v159 = [(CDMServiceGraph *)self addNodeWithName:@"doUaaPNLInference" bindService:v360 requestId:v42 block:v359];

  v45 = [v43 requestId];
  v353[0] = MEMORY[0x263EF8330];
  v353[1] = 3221225472;
  v353[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_625;
  v353[3] = &unk_2647A4DC8;
  v356 = v432;
  v357 = v498;
  id v46 = v43;
  id v354 = v46;
  v358 = v434;
  id v47 = v141;
  id v355 = v47;
  v140 = [(CDMServiceGraph *)self addNodeWithName:@"doShortcutParse" bindService:v47 requestId:v45 block:v353];

  [v46 requestId];
  v48 = v133 = (void *)v24;
  v340[0] = MEMORY[0x263EF8330];
  v340[1] = 3221225472;
  v340[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_627;
  v340[3] = &unk_2647A4590;
  v343 = v460;
  v344 = v496;
  v345 = v432;
  v346 = v426;
  v347 = v486;
  v348 = v484;
  v349 = v462;
  id v49 = v46;
  id v341 = v49;
  v350 = v500;
  objc_copyWeak(&v352, location);
  id v50 = v143;
  id v342 = v50;
  v351 = v458;
  v142 = [(CDMServiceGraph *)self addNodeWithName:@"doPSCInference" bindService:v50 requestId:v48 block:v340];

  v51 = [v49 requestId];
  v327[0] = MEMORY[0x263EF8330];
  v327[1] = 3221225472;
  v327[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_628;
  v327[3] = &unk_2647A4590;
  v330 = v456;
  v331 = v496;
  v332 = v432;
  v333 = v426;
  v334 = v486;
  v335 = v484;
  v336 = v462;
  id v52 = v49;
  id v328 = v52;
  v337 = v500;
  objc_copyWeak(&v339, location);
  v338 = v454;
  v53 = v132;
  v329 = v53;
  v157 = [(CDMServiceGraph *)self addNodeWithName:@"doLVCInference" bindService:v53 requestId:v51 block:v327];

  v54 = [v52 requestId];
  v103 = v53;
  v104 = v47;
  uint64_t v311 = MEMORY[0x263EF8330];
  uint64_t v312 = 3221225472;
  v313 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_629;
  v314 = &unk_2647A4590;
  v317 = v466;
  v318 = v496;
  v319 = v432;
  v320 = v426;
  v321 = v486;
  v322 = v484;
  v323 = v462;
  id v55 = v52;
  id v315 = v55;
  v324 = v500;
  objc_copyWeak(&v326, location);
  id v316 = v145;
  v325 = v464;
  id v102 = v316;
  v56 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doSNLCInference");

  v57 = [v55 requestId];
  uint64_t v298 = MEMORY[0x263EF8330];
  uint64_t v299 = 3221225472;
  v300 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_630;
  v301 = &unk_2647A45E0;
  id v58 = v55;
  id v302 = v58;
  v305 = v428;
  id v59 = v44;
  id v303 = v59;
  v306 = v478;
  v307 = v426;
  v308 = v500;
  v309 = v492;
  v310 = v490;
  id v304 = v136;
  id v101 = v304;
  v137 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doSSUMatching");

  v60 = [v58 requestId];
  v289[0] = MEMORY[0x263EF8330];
  v289[1] = 3221225472;
  v289[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_638;
  v289[3] = &unk_2647A45B8;
  v294 = v462;
  id v290 = v160;
  id v61 = v58;
  id v291 = v61;
  v295 = v498;
  v296 = v494;
  v297 = v452;
  v62 = v128;
  v292 = v62;
  id v99 = v59;
  id v100 = v290;
  id v293 = v99;
  v161 = [(CDMServiceGraph *)self addNodeWithName:@"doCcqrAerCbRInference" bindService:v290 requestId:v60 block:v289];
  v98 = v50;

  v63 = [v61 requestId];
  v279[0] = MEMORY[0x263EF8330];
  v279[1] = 3221225472;
  v279[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_639;
  v279[3] = &unk_2647A45E0;
  v283 = v496;
  v284 = v426;
  v285 = v486;
  v286 = v484;
  v287 = v500;
  id v64 = v138;
  id v280 = v64;
  v288 = v438;
  id v65 = v116;
  id v281 = v65;
  id v66 = v61;
  id v282 = v66;
  v153 = [(CDMServiceGraph *)self addNodeWithName:@"doCATIInference" bindService:v64 requestId:v63 block:v279];

  v67 = [v66 requestId];
  v267[0] = MEMORY[0x263EF8330];
  v267[1] = 3221225472;
  v267[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_642;
  v267[3] = &unk_2647A4608;
  v270 = v472;
  v271 = v496;
  v272 = v432;
  v273 = v426;
  v274 = v486;
  v275 = v484;
  v276 = v500;
  id v68 = v66;
  id v268 = v68;
  objc_copyWeak(&v278, location);
  id v69 = v129;
  id v269 = v69;
  v277 = v470;
  v70 = [(CDMServiceGraph *)self addNodeWithName:@"doNLv4Inference" bindService:v69 requestId:v67 block:v267];

  v71 = [v68 requestId];
  v258[0] = MEMORY[0x263EF8330];
  v258[1] = 3221225472;
  v258[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_646;
  v258[3] = &unk_2647A4630;
  v261 = v426;
  v262 = v432;
  v263 = v496;
  v264 = v500;
  v72 = v131;
  v259 = v72;
  id v73 = v68;
  id v260 = v73;
  v265 = v470;
  v266 = v464;
  v151 = [(CDMServiceGraph *)self addNodeWithName:@"doNLv4SNLCMerging" bindService:v72 requestId:v71 block:v258];
  v117 = v72;
  v130 = v69;

  v74 = [v73 requestId];
  uint64_t v248 = MEMORY[0x263EF8330];
  uint64_t v249 = 3221225472;
  v250 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_653;
  v251 = &unk_2647A4A08;
  v253 = v426;
  v254 = v432;
  v255 = v496;
  v256 = v500;
  v257 = v436;
  id v252 = v126;
  id v127 = v252;
  v75 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doOverridesProto");

  [v75 setQueuePriority:4];
  v76 = [v73 requestId];
  uint64_t v240 = MEMORY[0x263EF8330];
  uint64_t v241 = 3221225472;
  v242 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_654;
  v243 = &unk_2647A4658;
  id v77 = v73;
  id v244 = v77;
  v78 = v62;
  v245 = v78;
  v247 = v452;
  id v246 = v124;
  id v125 = v246;
  v139 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doRepetitionDetection");

  v79 = [v77 requestId];
  uint64_t v226 = MEMORY[0x263EF8330];
  uint64_t v227 = 3221225472;
  v228 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_657;
  v229 = &unk_2647A4680;
  v233 = v450;
  v234 = v426;
  v235 = v496;
  v236 = v486;
  v237 = v484;
  v80 = v78;
  v230 = v80;
  id v81 = v77;
  id v231 = v81;
  v238 = v500;
  v239 = v448;
  id v232 = v122;
  id v123 = v232;
  v146 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doMentionDetection");
  v97 = v64;

  v82 = [v81 requestId];
  uint64_t v216 = MEMORY[0x263EF8330];
  uint64_t v217 = 3221225472;
  v218 = __32__CDMNLUServiceGraph_buildGraph__block_invoke_660;
  v219 = &unk_2647A46A8;
  v222 = v446;
  v223 = v500;
  id v83 = v81;
  id v220 = v83;
  v224 = v496;
  v225 = v444;
  id v221 = v118;
  id v119 = v221;
  v144 = -[CDMServiceGraph addNodeWithName:bindService:requestId:block:](self, "addNodeWithName:bindService:requestId:block:", @"doContextualSpanMatching");

  v84 = [v83 requestId];
  v203[0] = MEMORY[0x263EF8330];
  v203[1] = 3221225472;
  v203[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_663;
  v203[3] = &unk_2647A46D0;
  v207 = v448;
  v208 = v500;
  v209 = v442;
  v210 = v496;
  v211 = v444;
  v212 = v486;
  v213 = v484;
  v214 = v426;
  v96 = v80;
  v204 = v96;
  id v85 = v83;
  id v205 = v85;
  v215 = v440;
  id v86 = v114;
  id v206 = v86;
  v87 = [(CDMServiceGraph *)self addNodeWithName:@"doMentionResolving" bindService:v86 requestId:v84 block:v203];
  v115 = v86;

  v88 = [v85 requestId];
  v193[0] = MEMORY[0x263EF8330];
  v193[1] = 3221225472;
  v193[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_666;
  v193[3] = &unk_2647A46F8;
  v195 = v474;
  v196 = v482;
  v197 = v480;
  v198 = v478;
  v199 = v476;
  id v89 = v85;
  id v194 = v89;
  objc_copyWeak(&v202, location);
  v200 = v432;
  v201 = v440;
  v90 = [(CDMServiceGraph *)self addNodeWithName:@"doSpanMerging" requestId:v88 block:v193];

  v91 = [v89 requestId];
  v167[0] = MEMORY[0x263EF8330];
  v167[1] = 3221225472;
  v167[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_668;
  v167[3] = &unk_2647A4720;
  v171 = v500;
  id v95 = v89;
  id v168 = v95;
  v172 = v434;
  v173 = v466;
  v174 = v464;
  v175 = v472;
  v176 = v470;
  v177 = v468;
  v178 = v438;
  v179 = v460;
  v180 = v458;
  v181 = v454;
  v182 = v436;
  v183 = v450;
  v184 = v448;
  v185 = v442;
  v186 = v440;
  v187 = v474;
  v188 = v452;
  v189 = v498;
  v190 = v490;
  v191 = v462;
  id v121 = v120;
  id v169 = v121;
  id v94 = v65;
  id v170 = v94;
  objc_copyWeak(&v192, location);
  v92 = [(CDMServiceGraph *)self addNodeWithName:@"doPostProcess" requestId:v91 block:v167];

  [v161 addDependency:v134];
  [v161 addDependency:v133];
  [v161 addDependency:v139];
  [v135 addDependency:v161];
  [v164 addDependency:v135];
  [v56 addDependency:v164];
  [v75 addDependency:v164];
  [v163 addDependency:v164];
  [v149 addDependency:v164];
  [v148 addDependency:v164];
  [v155 addDependency:v164];
  [v147 addDependency:v164];
  [v159 addDependency:v164];
  [v70 addDependency:v164];
  [v146 addDependency:v163];
  [v144 addDependency:v164];
  [v87 addDependency:v144];
  [v87 addDependency:v146];
  [v90 addDependency:v149];
  [v90 addDependency:v148];
  [v90 addDependency:v155];
  [v90 addDependency:v147];
  [v90 addDependency:v87];
  [v140 addDependency:v90];
  [v153 addDependency:v163];
  [v142 addDependency:v164];
  [v142 addDependency:v90];
  [v142 addDependency:v163];
  [v157 addDependency:v164];
  [v157 addDependency:v90];
  [v157 addDependency:v163];
  [v56 addDependency:v90];
  [v56 addDependency:v163];
  [v56 addDependency:v87];
  [v137 addDependency:v155];
  [v159 addDependency:v163];
  [v159 addDependency:v90];
  [v70 addDependency:v163];
  [v70 addDependency:v90];
  [v70 addDependency:v87];
  [v151 addDependency:v70];
  [v151 addDependency:v56];
  [v75 addDependency:v90];
  [v92 addDependency:v151];
  [v92 addDependency:v159];
  [v92 addDependency:v142];
  [v92 addDependency:v157];
  [v92 addDependency:v153];
  [v92 addDependency:v75];
  [v92 addDependency:v140];
  [v92 addDependency:v139];
  [v92 addDependency:v87];
  [v92 addDependency:v137];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_3;
  aBlock[3] = &unk_2647A4748;
  aBlock[4] = v436;
  v93 = _Block_copy(aBlock);
  [(CDMServiceGraph *)self skipNode:v70 basedOnNode:v75 withCondition:v93];
  [(CDMServiceGraph *)self skipNode:v56 basedOnNode:v75 withCondition:v93];
  [(CDMServiceGraph *)self skipNode:v142 basedOnNode:v75 withCondition:v93];
  [(CDMServiceGraph *)self skipNode:v153 basedOnNode:v75 withCondition:v93];
  v165[0] = MEMORY[0x263EF8330];
  v165[1] = 3221225472;
  v165[2] = __32__CDMNLUServiceGraph_buildGraph__block_invoke_671;
  v165[3] = &unk_2647A4748;
  v165[4] = v464;
  [(CDMServiceGraph *)self skipNode:v70 basedOnNode:v56 withCondition:v165];

  objc_destroyWeak(&v192);
  objc_destroyWeak(&v202);

  objc_destroyWeak(&v278);
  objc_destroyWeak(&v326);

  objc_destroyWeak(&v339);
  objc_destroyWeak(&v352);

  objc_destroyWeak(&v370);
  objc_destroyWeak(&v411);

  objc_destroyWeak(&v419);
  objc_destroyWeak(&v425);

  _Block_object_dispose(v426, 8);
  _Block_object_dispose(v428, 8);

  _Block_object_dispose(v430, 8);
  _Block_object_dispose(v432, 8);

  _Block_object_dispose(v434, 8);
  _Block_object_dispose(v436, 8);

  _Block_object_dispose(v438, 8);
  _Block_object_dispose(v440, 8);

  _Block_object_dispose(v442, 8);
  _Block_object_dispose(v444, 8);

  _Block_object_dispose(v446, 8);
  _Block_object_dispose(v448, 8);

  _Block_object_dispose(v450, 8);
  _Block_object_dispose(v452, 8);

  _Block_object_dispose(v454, 8);
  _Block_object_dispose(v456, 8);

  _Block_object_dispose(v458, 8);
  _Block_object_dispose(v460, 8);

  _Block_object_dispose(v462, 8);
  _Block_object_dispose(v464, 8);

  _Block_object_dispose(v466, 8);
  _Block_object_dispose(v468, 8);

  _Block_object_dispose(v470, 8);
  _Block_object_dispose(v472, 8);

  _Block_object_dispose(v474, 8);
  _Block_object_dispose(v476, 8);

  _Block_object_dispose(v478, 8);
  _Block_object_dispose(v480, 8);

  _Block_object_dispose(v482, 8);
  _Block_object_dispose(v484, 8);

  _Block_object_dispose(v486, 8);
  _Block_object_dispose(v488, 8);

  _Block_object_dispose(v490, 8);
  _Block_object_dispose(v492, 8);

  _Block_object_dispose(v494, 8);
  _Block_object_dispose(v496, 8);

  _Block_object_dispose(v498, 8);
  _Block_object_dispose(v500, 8);

  objc_destroyWeak(location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315138;
    id v17 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Prepare CDMContextUpdateRequestCommand", (uint8_t *)&v16, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71DE8]);
  v4 = [*(id *)(a1 + 32) currentTurnInput];
  [v3 setCurrentTurn:v4];

  uint64_t v5 = [*(id *)(a1 + 32) previousTurnInputs];
  [v3 setPreviousTurns:v5];

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) qrResponse];
  uint64_t v7 = [v6 rewriteHypotheses];
  [v3 setQrHypotheses:v7];

  uint64_t v8 = [[CDMContextUpdateRequestCommand alloc] initWithCtxUpdateRequest:v3];
  uint64_t v9 = [*(id *)(a1 + 40) handle:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  __int16 v13 = [*(id *)(a1 + 32) requestId];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v15 = [WeakRetained cdmDataDispatcherContext];
  +[CDMDataDispatcher dispatchContextUpdateData:v12 requestId:v13 dataDispatcherContext:v15];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_609(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    v14 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v13, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) currentTurnInput];
  v4 = [v3 asrOutputs];
  uint64_t v5 = +[CDMTokenizerProtoService createProtoTokenRequestWithAsrOutputs:v4 locale:*(void *)(a1 + 40)];

  uint64_t v6 = [*(id *)(a1 + 48) handle:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  +[CDMServiceGraphUtil addDebugInfo:*(void *)(a1 + 56) nluRequest:*(void *)(a1 + 32) responseObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v10 = [*(id *)(a1 + 32) requestId];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v12 = [WeakRetained cdmDataDispatcherContext];
  +[CDMDataDispatcher dispatchCurrentTurnTokenizationData:v9 requestId:v10 dataDispatcherContext:v12];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_611(void *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315138;
    int v13 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMTokenizationProtoRequestCommand for use in CDMTokenizerProtoService", (uint8_t *)&v12, 0xCu);
  }

  id v3 = [*(id *)(*(void *)(a1[4] + 8) + 40) firstReformedInput];
  BOOL v4 = [v3 type] == 1;

  uint64_t v5 = CDMOSLoggerForCategory(0);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v6)
    {
      int v12 = 136315138;
      int v13 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      uint64_t v7 = "%s Current Turn is a Correction for the previous turn";
LABEL_9:
      _os_log_debug_impl(&dword_2263A0000, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v12, 0xCu);
    }
  }
  else if (v6)
  {
    int v12 = 136315138;
    int v13 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    uint64_t v7 = "%s Current Turn is NOT a Correction for the previous turn";
    goto LABEL_9;
  }

  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(*(void *)(a1[6] + 8) + 40));
  uint64_t v8 = *(void **)(*(void *)(a1[8] + 8) + 40);
  uint64_t v9 = *(void *)(a1[7] + 8);
  id v10 = v8;
  int v11 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v10;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_612(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) currentTurnInput];
  BOOL v4 = [*(id *)(a1 + 40) previousTurnInputs];
  uint64_t v5 = +[CDMServiceGraphUtil prepareCcqrTokens:v2 currentTurn:v3 previousTurns:v4 utterance:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) locale:*(void *)(a1 + 48)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v11 = [*(id *)(a1 + 40) requestId];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v10 = [WeakRetained cdmDataDispatcherContext];
  +[CDMDataDispatcher dispatchPreviousTurnTokenizationData:v8 requestId:v11 dataDispatcherContext:v10];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 136315138;
    uint64_t v18 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMEmbeddingProtoRequestCommand for use in CDMEmbeddingProtoService", (uint8_t *)&v17, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71E00]);
  BOOL v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) response];
  uint64_t v5 = [v4 tokenChain];
  [v3 setTokenChain:v5];

  [v3 setText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v6 = [[CDMEmbeddingProtoRequestCommand alloc] initWithRequest:v3];
  uint64_t v7 = [*(id *)(a1 + 32) handle:v6];
  uint64_t v8 = [v7 response];
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [v7 embeddingConfigs];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  int v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = +[SiriNLUInternalEmbeddingConverter convertFromProtoEmbeddingResponseCommand:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
  int v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_616(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMDateTimeSpanMatchService", (uint8_t *)&v18, 0xCu);
  }

  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) firstReformedInput];
  BOOL v4 = [v3 currentTurn];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) responses];
  uint64_t v8 = +[CDMBaseSpanMatchService convertToSpanMatchRequests:v7 nlContext:v6];

  uint64_t v9 = [CDMSpanMatcherRequestCommand alloc];
  id v10 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v11 = [v10 asrOutputs];
  uint64_t v12 = [*(id *)(a1 + 32) requestId];
  int v13 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v12];
  uint64_t v14 = [(CDMSpanMatcherRequestCommand *)v9 initWithRequests:v8 asrHypothesis:v11 selfMetadata:v13];

  uint64_t v15 = [*(id *)(a1 + 40) handle:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_620(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    uint64_t v19 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMRegexSpanMatchService", (uint8_t *)&v18, 0xCu);
  }

  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) firstReformedInput];
  BOOL v4 = [v3 currentTurn];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) responses];
  uint64_t v8 = +[CDMBaseSpanMatchService convertToSpanMatchRequests:v7 nlContext:v6];

  uint64_t v9 = [CDMSpanMatcherRequestCommand alloc];
  id v10 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v11 = [v10 asrOutputs];
  uint64_t v12 = [*(id *)(a1 + 32) requestId];
  int v13 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v12];
  uint64_t v14 = [(CDMSpanMatcherRequestCommand *)v9 initWithRequests:v8 asrHypothesis:v11 selfMetadata:v13];

  uint64_t v15 = [*(id *)(a1 + 40) handle:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  int v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_621(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMSiriVocabularySpanMatchService", (uint8_t *)&v19, 0xCu);
  }

  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) firstReformedInput];
  BOOL v4 = [v3 currentTurn];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) responses];
  uint64_t v8 = +[CDMBaseSpanMatchService convertToSpanMatchRequests:v7 nlContext:v6];

  uint64_t v9 = objc_alloc_init(CDMSpanMatchDataUpdateCommand);
  [*(id *)(a1 + 32) updateData:v9];
  id v10 = [CDMSpanMatcherRequestCommand alloc];
  uint64_t v11 = [*(id *)(a1 + 40) currentTurnInput];
  uint64_t v12 = [v11 asrOutputs];
  int v13 = [*(id *)(a1 + 40) requestId];
  uint64_t v14 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v13];
  uint64_t v15 = [(CDMSpanMatcherRequestCommand *)v10 initWithRequests:v8 asrHypothesis:v12 selfMetadata:v14];

  uint64_t v16 = [*(id *)(a1 + 32) handle:v15];
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  int v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_623(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 136315138;
    int v19 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMSpanMatcherRequestCommand for use in CDMVocSpanMatchService", (uint8_t *)&v18, 0xCu);
  }

  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) firstReformedInput];
  BOOL v4 = [v3 currentTurn];
  uint64_t v5 = [v4 turnContext];
  uint64_t v6 = [v5 nlContext];

  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) responses];
  uint64_t v8 = +[CDMBaseSpanMatchService convertToSpanMatchRequests:v7 nlContext:v6];

  uint64_t v9 = [CDMSpanMatcherRequestCommand alloc];
  id v10 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v11 = [v10 asrOutputs];
  uint64_t v12 = [*(id *)(a1 + 32) requestId];
  int v13 = +[CDMSELFLogUtil createSELFMetadataWithRequestId:v12];
  uint64_t v14 = [(CDMSpanMatcherRequestCommand *)v9 initWithRequests:v8 asrHypothesis:v11 selfMetadata:v13];

  uint64_t v15 = [*(id *)(a1 + 40) handle:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_624(uint64_t a1)
{
  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) requestId];
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v17 = *(void *)(a1 + 48);
  int v19 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) response];
  id v3 = [v19 tokenChain];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  uint64_t v6 = +[CDMServiceGraphUtil embeddingsOutput:v5 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.uaap.ssu"];
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) firstReformedInput];
  uint64_t v8 = [v7 currentTurn];
  uint64_t v9 = *(void *)(*(void *)(a1 + 104) + 8);
  id obj = *(id *)(v9 + 40);
  id v22 = 0;
  id v20 = 0;
  id v10 = (void *)v2;
  LOBYTE(v2) = +[CDMServiceGraphUtil runUaaPNLProtoService:v18 requestId:v2 utterance:v16 locale:v17 tokenChain:v3 matchingSpans:v4 embeddingTensor:v6 currentTurn:v8 outUaapProtoRequest:&v22 outUaapProtoResponse:&obj outError:&v20];
  id v11 = v22;
  objc_storeStrong((id *)(v9 + 40), obj);
  id v12 = v20;

  if ((v2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    [WeakRetained failedWithError:v12];
  }
  uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  uint64_t v15 = [*(id *)(a1 + 40) requestId];
  +[CDMDataDispatcher dispatchUaaPData:v11 withResponse:v14 requestId:v15];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_625(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315138;
    uint64_t v14 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Output VoiceCommand NLUParse if there is voice command matching span found", (uint8_t *)&v13, 0xCu);
  }

  id v3 = [CDMShortcutRequestCommand alloc];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v6 = [v5 tokenChain];
  uint64_t v7 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v8 = [v7 turnContext];
  uint64_t v9 = [(CDMShortcutRequestCommand *)v3 initWithMatchingSpans:v4 tokenChain:v6 currentTurnContext:v8];

  uint64_t v10 = [*(id *)(a1 + 40) handle:v9];
  uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_627(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a2);
  id v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CDMPSCRequestCommand for use in CDMPSCService", buf, 0xCu);
  }

  v30 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v4 = [v30 tokenChain];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  uint64_t v8 = +[CDMServiceGraphUtil embeddingsOutput:v7 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.psc"];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) rewriteMsg];
  uint64_t v10 = [*(id *)(a1 + 32) requestId];
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) firstReformedInput];
  id v12 = [v11 currentTurn];
  id v31 = 0;
  uint64_t v13 = +[CDMServiceGraphUtil buildPSCRequestWithTokenChain:v4 matchingSpans:v5 utterance:v6 embeddingTensor:v8 rewriteMsg:v9 nluRequestId:v10 currentTurn:v12 error:&v31];
  id v14 = v31;
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;
  id v17 = v14;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained failedWithError:v17];

    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  id v20 = [*(id *)(a1 + 40) handle:v18];
  id v21 = objc_loadWeakRetained(&location);
  if (!v21
    || (id v22 = objc_loadWeakRetained(&location),
        char v23 = [v22 isCancelled],
        v22,
        v21,
        (v23 & 1) != 0))
  {
    uint64_t v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s CDMPSCService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), v20);
  v25 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) cmdError];

  if (v25)
  {
    uint64_t v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) cmdError];
      id v29 = [v28 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v29;
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s PSC failed to handle the request: %@", buf, 0x16u);
    }
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v27 = [*(id *)(a1 + 32) requestId];
  +[CDMDataDispatcher dispatchPSCData:v26 withResponse:v20 requestId:v27];

  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_628(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMLVCRequestCommand for use in CDMLVCService", buf, 0xCu);
  }

  id v27 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  id v3 = [v27 tokenChain];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  uint64_t v7 = +[CDMServiceGraphUtil embeddingsOutput:v6 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.lvc"];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) rewriteMsg];
  uint64_t v9 = [*(id *)(a1 + 32) requestId];
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) firstReformedInput];
  id v28 = 0;
  uint64_t v11 = +[CDMServiceGraphUtil buildLVCRequestWithTokenChain:v3 matchingSpans:v4 utterance:v5 embeddingTensor:v7 rewriteMsg:v8 nluRequestId:v9 reformedTurnInput:v10 error:&v28];
  id v12 = v28;
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v11;

  uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v15)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained failedWithError:v12];

    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  uint64_t v17 = [*(id *)(a1 + 40) handle:v15];
  uint64_t v18 = *(void *)(*(void *)(a1 + 112) + 8);
  int v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  id v20 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) cmdError];

  if (v20)
  {
    id v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v25 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) cmdError];
      uint64_t v26 = [v25 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v30 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v31 = 2112;
      v32 = v26;
      _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s LVC failed to handle the request: %@", buf, 0x16u);
    }
  }
  uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  uint64_t v24 = [*(id *)(a1 + 32) requestId];
  +[CDMDataDispatcher dispatchLVCData:v22 withResponse:v23 requestId:v24];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_629(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a2);
  id v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CDMSNLCProtoRequestCommand for use in CDMSNLCProtoService", buf, 0xCu);
  }

  v30 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v4 = [v30 tokenChain];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  uint64_t v8 = +[CDMServiceGraphUtil embeddingsOutput:v7 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.snlc"];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) rewriteMsg];
  uint64_t v10 = [*(id *)(a1 + 32) requestId];
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) firstReformedInput];
  id v12 = [v11 currentTurn];
  id v31 = 0;
  uint64_t v13 = +[CDMServiceGraphUtil buildSNLCProtoRequestWithTokenChain:v4 matchingSpans:v5 utterance:v6 embeddingTensor:v8 rewriteMsg:v9 requestId:v10 currentTurn:v12 error:&v31];
  id v14 = v31;
  uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v13;
  id v17 = v14;

  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (!v18)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    [WeakRetained failedWithError:v17];

    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
  id v20 = [*(id *)(a1 + 40) handle:v18];
  id v21 = objc_loadWeakRetained(&location);
  if (!v21
    || (id v22 = objc_loadWeakRetained(&location),
        char v23 = [v22 isCancelled],
        v22,
        v21,
        (v23 & 1) != 0))
  {
    uint64_t v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s CDMSNLCProtoService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), v20);
  v25 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) cmdError];

  if (v25)
  {
    uint64_t v24 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) cmdError];
      id v29 = [v28 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v34 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v35 = 2112;
      id v36 = v29;
      _os_log_debug_impl(&dword_2263A0000, v24, OS_LOG_TYPE_DEBUG, "%s SNLC failed to handle the request: %@", buf, 0x16u);
    }
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v27 = [*(id *)(a1 + 32) requestId];
  +[CDMDataDispatcher dispatchSNLCData:v26 withResponse:v20 requestId:v27];

  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_630(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v21 = 136315138;
    id v22 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Building SSU request for use in CDMSSUService", (uint8_t *)&v21, 0xCu);
  }

  id v3 = objc_alloc_init(MEMORY[0x263F71EF8]);
  uint64_t v4 = [*(id *)(a1 + 32) requestId];
  [v3 setNluRequestId:v4];

  [v3 setAsrId:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  [v3 setLocale:*(void *)(a1 + 40)];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v5)
  {
    int v19 = "siriVocabularySpanResponse != nil";
    int v20 = 595;
    goto LABEL_12;
  }
  uint64_t v6 = [v5 spanMatchResponse];
  uint64_t v7 = [v6 matchingSpans];
  [v3 setMatchingSpans:v7];

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    int v19 = "correctedUtterance != nil";
    int v20 = 598;
    goto LABEL_12;
  }
  objc_msgSend(v3, "setUtterance:");
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) firstReformedInput];
  uint64_t v9 = [v8 currentTurn];
  uint64_t v10 = [v9 turnContext];
  uint64_t v11 = [v10 nlContext];
  id v12 = [v11 salientEntities];
  [v3 setSalientEntities:v12];

  if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
  {
    int v19 = "ssuRequestCommand == nil";
    int v20 = 602;
    goto LABEL_12;
  }
  uint64_t v13 = [[CDMSSURequestCommand alloc] initWithParserRequest:v3];
  uint64_t v14 = *(void *)(*(void *)(a1 + 88) + 8);
  uint64_t v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    int v19 = "ssuResponseCommand == nil";
    int v20 = 605;
LABEL_12:
    __assert_rtn("-[CDMNLUServiceGraph buildGraph]_block_invoke", "CDMNLUServiceGraph.m", v20, v19);
  }
  uint64_t v16 = [*(id *)(a1 + 48) handle:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  uint64_t v17 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = v16;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_638(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_2";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Prepare to run CDMCcqrAerCbRService", buf, 0xCu);
  }

  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = [*(id *)(*(void *)(a1[9] + 8) + 40) response];
  uint64_t v6 = +[CDMServiceGraphUtil runCcqrService:v3 nluRequest:v4 tokenResponse:v5 previousTurnTokenizationResponseCommand:*(void *)(*(void *)(a1[10] + 8) + 40) rdResponse:*(void *)(*(void *)(a1[11] + 8) + 40) requestLink:a1[6] locale:a1[7]];
  uint64_t v7 = *(void *)(a1[8] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  uint64_t v9 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s CDMCcqrAerCbRService node finished", buf, 0xCu);
  }
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_639(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a2);
  uint64_t v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CATIRequestCommand for use in CDMCATIProtoService", buf, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F71DC8]);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v6 = [v5 tokenChain];
  uint64_t v7 = +[CDMServiceGraphUtil buildNormalizedUtterance:v6];

  [v4 setNormalisedUtterance:v7];
  [v4 setOriginalUtterance:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  uint64_t v8 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) embeddingTensorOutputs];
  uint64_t v9 = +[CDMServiceGraphUtil embeddingsOutput:v8 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) forFactor:@"com.apple.siri.nl.cati"];
  [v4 setEmbeddings:v9];

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) firstReformedInput];
  uint64_t v11 = [v10 currentTurn];
  [v4 setTurnInput:v11];

  uint64_t v12 = [[CDMCATIProtoRequestCommand alloc] initWithRequest:v4];
  uint64_t v13 = [*(id *)(a1 + 32) handle:v12];
  id v14 = objc_loadWeakRetained(&location);
  if (v14
    && (id v15 = objc_loadWeakRetained(&location),
        char v16 = [v15 isCancelled],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 96) + 8);
    id v19 = v13;
    uint64_t v17 = *(NSObject **)(v18 + 40);
    *(void *)(v18 + 40) = v19;
  }
  else
  {
    uint64_t v17 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      id v22 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s CDMCATIProtoService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
  }

  +[CDMServiceGraphUtil addDebugInfo:*(void *)(a1 + 40) nluRequest:*(void *)(a1 + 48) responseObject:v13];
  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_642(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, a2);
  uint64_t v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s Creating CDMNLv4RequestCommand for use in CDMNLv4ProtoService", buf, 0xCu);
  }

  id v28 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  id v4 = [v28 tokenChain];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  uint64_t v8 = +[CDMServiceGraphUtil embeddingsOutput:v7 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.nlv4"];
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) firstReformedInput];
  uint64_t v10 = [v9 currentTurn];
  uint64_t v11 = [*(id *)(a1 + 32) requestId];
  id v29 = 0;
  uint64_t v12 = +[CDMServiceGraphUtil buildNLv4ProtoRequestWithTokenChain:v4 matchingSpans:v5 utterance:v6 embeddingTensor:v8 currentTurn:v10 requestId:v11 outError:&v29];
  id v13 = v29;
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v12;

  if (v13)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    [WeakRetained failedWithError:v13];
  }
  uint64_t v17 = [*(id *)(a1 + 40) handle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v18 = objc_loadWeakRetained(&location);
  if (!v18
    || (id v19 = objc_loadWeakRetained(&location),
        char v20 = [v19 isCancelled],
        v19,
        v18,
        (v20 & 1) != 0))
  {
    int v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s CDMNLv4ProtoService node was cancelled, so not adding response to graph.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), v17);
  id v22 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) cmdError];
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    int v21 = objc_loadWeakRetained((id *)(a1 + 112));
    uint64_t v24 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) cmdError];
    v25 = [v24 localizedDescription];
    [v21 failedWithErrorCode:1 errorDomain:@"doNLv4InferenceNode" message:v25];

LABEL_11:
  }
  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v27 = [*(id *)(a1 + 32) requestId];
  +[CDMDataDispatcher dispatchNLv4Data:v26 withResponse:v17 requestId:v27];

  objc_destroyWeak(&location);
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_646(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) response];
  uint64_t v5 = [v4 tokenChain];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) firstReformedInput];
  uint64_t v7 = +[CDMServiceGraphUtil overrideInputsFromUtterance:v2 matchingSpans:v3 tokenChain:v5 contextUpdateReformedTurnInputBundle:v6];

  id v8 = objc_alloc_init(MEMORY[0x263F71E80]);
  [v8 setInputs:v7];
  uint64_t v9 = [[CDMOverridesProtoRequestCommand alloc] initWithRequest:v8];
  uint64_t v10 = [*(id *)(a1 + 32) handle:v9];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x263F71E68]);
    uint64_t v12 = [v10 parsesForReplacement];
    id v13 = (void *)[v12 mutableCopy];
    [v11 setHypotheses:v13];

    id v14 = objc_alloc_init(MEMORY[0x263F71CB0]);
    id v15 = [*(id *)(a1 + 40) requestId];
    [v14 setRequestId:v15];

    char v16 = [v10 parsesForReplacement];
    uint64_t v17 = (void *)[v16 mutableCopy];
    [v14 setParses:v17];

    id v18 = [[CDMNLv4ProtoResponseCommand alloc] initWithParserResponse:v11 nluResponse:v14];
    uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
    char v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

LABEL_3:
    goto LABEL_9;
  }
  if (+[CDMFeatureFlags isAmbiguityRefactorEnabled]
    && [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) isDelegated])
  {
    int v21 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315138;
      uint64_t v24 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s SNLC delegated to server so NLv4 response will be empty", (uint8_t *)&v23, 0xCu);
    }

    uint64_t v22 = *(void *)(*(void *)(a1 + 80) + 8);
    id v11 = *(id *)(v22 + 40);
    *(void *)(v22 + 40) = 0;
    goto LABEL_3;
  }
LABEL_9:
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_653(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 136315138;
    id v15 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMOverridesProtoRequestCommand for use in CDMOverridesProtoService", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v6 = [v5 tokenChain];
  uint64_t v7 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) firstReformedInput];
  id v8 = +[CDMServiceGraphUtil overrideInputsFromUtterance:v3 matchingSpans:v4 tokenChain:v6 contextUpdateReformedTurnInputBundle:v7];

  id v9 = objc_alloc_init(MEMORY[0x263F71E80]);
  [v9 setInputs:v8];
  uint64_t v10 = [[CDMOverridesProtoRequestCommand alloc] initWithRequest:v9];
  uint64_t v11 = [*(id *)(a1 + 32) handle:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_654(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 136315138;
    char v20 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMRepetitionDetectionRequestCommand for use in CDMRepetitionDetectionService", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v3 = [*(id *)(a1 + 32) previousTurnInputs];
  uint64_t v4 = [v3 lastObject];

  uint64_t v5 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v6 = [CDMRepetitionDetectionRequestCommand alloc];
  uint64_t v7 = [*(id *)(a1 + 40) nlId];
  id v8 = [*(id *)(a1 + 40) resultCandidateId];
  id v9 = [*(id *)(a1 + 32) requestId];
  uint64_t v10 = +[CDMRepetitionDetectionServiceUtils buildRDRequestWithPrevTurn:v4 curTurn:v5 nluRequestId:v7 resultCandidateId:v8 cdmRequestId:v9];
  uint64_t v11 = [(CDMRepetitionDetectionRequestCommand *)v6 initWithQRRequest:v10];

  uint64_t v12 = [*(id *)(a1 + 48) handle:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  id v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cmdError];

  if (v15)
  {
    uint64_t v16 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cmdError];
      id v18 = [v17 localizedDescription];
      int v19 = 136315394;
      char v20 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v18;
      _os_log_impl(&dword_2263A0000, v16, OS_LOG_TYPE_INFO, "%s [WARN]: Repetition Detection prediction failed: %@", (uint8_t *)&v19, 0x16u);
    }
  }
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_657(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v31 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionDetectorRequestCommand for use in CDMMentionDetectorService", buf, 0xCu);
  }

  id v27 = [CDMMentionDetectorRequestCommand alloc];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v29 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) response];
  id v28 = [v29 tokenChain];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) embeddingTensorOutputs];
  uint64_t v5 = +[CDMServiceGraphUtil embeddingsOutput:v4 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forFactor:@"com.apple.siri.nl.marrs.md"];
  uint64_t v6 = [*(id *)(a1 + 32) nlId];
  uint64_t v7 = [*(id *)(a1 + 32) resultCandidateId];
  id v8 = [*(id *)(a1 + 40) requestId];
  id v9 = +[CDMMentionDetectorServiceUtils buildMDRequestWithUtterance:v3 tokenChain:v28 embedding:v5 nluRequestId:v6 resultCandidateId:v7 cdmRequestId:v8];
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) firstReformedInput];
  uint64_t v11 = [v10 currentTurn];
  uint64_t v12 = [(CDMMentionDetectorRequestCommand *)v27 initWithMDRequest:v9 withCurrTurn:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = [*(id *)(a1 + 48) handle:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  uint64_t v16 = *(void *)(*(void *)(a1 + 104) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  id v18 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) response];
    *(_DWORD *)buf = 136315394;
    id v31 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    __int16 v32 = 2112;
    uint64_t v33 = v26;
    _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s #MD response: %@", buf, 0x16u);
  }
  int v19 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) cmdError];

  if (v19)
  {
    char v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = [*(id *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) cmdError];
      uint64_t v22 = [v21 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v31 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v32 = 2112;
      uint64_t v33 = v22;
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Detection prediction failed: %@", buf, 0x16u);
    }
  }
  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
  uint64_t v25 = [*(id *)(a1 + 40) requestId];
  +[CDMDataDispatcher dispatchMDData:v23 withResponse:v24 requestId:v25];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_660(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v24 = 136315138;
    uint64_t v25 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMContextualSpanMatcherRequestCommand for use in CDMContextualSpanMatcherService", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v3 = [CDMContextualSpanMatcherRequestCommand alloc];
  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) firstReformedInput];
  uint64_t v5 = [v4 currentTurn];
  uint64_t v6 = [v5 turnContext];
  uint64_t v7 = [v6 nlContext];
  id v8 = [*(id *)(a1 + 32) requestId];
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) response];
  uint64_t v10 = [v9 tokenChain];
  uint64_t v11 = +[CDMContextualSpanMatcherServiceUtils buildContextualSpanMatcherRequestWithNLContext:v7 requestId:v8 tokenChain:v10];
  uint64_t v12 = [(CDMContextualSpanMatcherRequestCommand *)v3 initWithContextualSpanMatcherRequest:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;

  uint64_t v15 = [*(id *)(a1 + 40) handle:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  id v18 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) contextualSpanMatcherResponse];
    int v24 = 136315394;
    uint64_t v25 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    __int16 v26 = 2112;
    id v27 = v23;
    _os_log_debug_impl(&dword_2263A0000, v18, OS_LOG_TYPE_DEBUG, "%s #ContextualSpanMatcher response: %@", (uint8_t *)&v24, 0x16u);
  }
  int v19 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) cmdError];

  if (v19)
  {
    char v20 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) cmdError];
      uint64_t v22 = [v21 localizedDescription];
      int v24 = 136315394;
      uint64_t v25 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v22;
      _os_log_impl(&dword_2263A0000, v20, OS_LOG_TYPE_INFO, "%s [WARN]: ContextualSpanMatcher prediction failed: %@", (uint8_t *)&v24, 0x16u);
    }
  }
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_663(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    id v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s Creating CDMMentionResolverRequestCommand for use in CDMMentionResolverService", buf, 0xCu);
  }

  uint64_t v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v29 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    id v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    __int16 v39 = 2112;
    id v40 = v29;
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s CDMMentionDetectorResponseCommand: %@", buf, 0x16u);
  }

  uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) firstReformedInput];
  __int16 v32 = [v4 currentTurn];

  id v31 = [CDMMentionResolverRequestCommand alloc];
  id v36 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) response];
  __int16 v35 = [v36 tokenChain];
  uint64_t v34 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) response];
  uint64_t v33 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) contextualSpanMatcherResponse];
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) embeddingTensorOutputs];
  uint64_t v6 = +[CDMServiceGraphUtil embeddingsOutput:v5 embeddingConfig:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40) forFactor:@"com.apple.siri.nl.marrs.mr"];
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) firstReformedInput];
  id v9 = [v8 previousTurns];
  uint64_t v10 = [v9 count];
  uint64_t v11 = [*(id *)(a1 + 32) nlId];
  uint64_t v12 = [*(id *)(a1 + 32) resultCandidateId];
  uint64_t v13 = [*(id *)(a1 + 40) requestId];
  int v14 = +[CDMMentionResolverServiceUtils buildMRRequestWithCurTurn:v32 tokenChain:v35 mdResponse:v34 contextualSpanMatcherResponse:v33 embedding:v6 utterance:v7 turnIndex:v10 nluRequestId:v11 resultCandidateId:v12 cdmRequestId:v13];
  uint64_t v15 = [(CDMMentionResolverRequestCommand *)v31 initWithMRRequest:v14];
  uint64_t v16 = *(void *)(*(void *)(a1 + 72) + 8);
  uint64_t v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  uint64_t v18 = [*(id *)(a1 + 48) handle:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v19 = *(void *)(*(void *)(a1 + 120) + 8);
  char v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;

  __int16 v21 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v30 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) response];
    *(_DWORD *)buf = 136315394;
    id v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    __int16 v39 = 2112;
    id v40 = v30;
    _os_log_debug_impl(&dword_2263A0000, v21, OS_LOG_TYPE_DEBUG, "%s #MR response: %@", buf, 0x16u);
  }
  uint64_t v22 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) cmdError];

  if (v22)
  {
    uint64_t v23 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = [*(id *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) cmdError];
      uint64_t v25 = [v24 localizedDescription];
      *(_DWORD *)buf = 136315394;
      id v38 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      __int16 v39 = 2112;
      id v40 = v25;
      _os_log_impl(&dword_2263A0000, v23, OS_LOG_TYPE_INFO, "%s [WARN]: Mention Resolver prediction failed: %@", buf, 0x16u);
    }
  }
  uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
  uint64_t v28 = [*(id *)(a1 + 40) requestId];
  +[CDMDataDispatcher dispatchMRData:v26 withResponse:v27 requestId:v28];
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_666(uint64_t a1)
{
  uint64_t v2 = +[CDMServiceGraphUtil mergeDateTimeSpans:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) regexSpans:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) siriVocabularySpans:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) vocSpans:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = [*(id *)(a1 + 32) requestId];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v8 = [WeakRetained cdmDataDispatcherContext];
  +[CDMDataDispatcher dispatchSpanizationData:v5 requestId:v6 dataDispatcherContext:v8];

  id v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) matchingSpansForNL];
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) response];
  uint64_t v10 = [v9 mentions];
  uint64_t v11 = +[CDMServiceGraphUtil appendMarrsSpans:v14 marrsMRSpans:v10];
  uint64_t v12 = *(void *)(*(void *)(a1 + 80) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __32__CDMNLUServiceGraph_buildGraph__block_invoke_2_668(uint64_t a1)
{
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) correctionOutcome];
  uint64_t v2 = [*(id *)(a1 + 32) currentTurnInput];
  uint64_t v3 = [v2 correctionOutcomeOverride];
  int v4 = [v3 type];

  if (v4 == 1)
  {
    uint64_t v5 = [*(id *)(a1 + 32) currentTurnInput];
    uint64_t v6 = [v5 correctionOutcomeOverride];

    id v9 = (void *)v6;
  }
  +[CDMPostProcessUtils runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:](CDMPostProcessUtils, "runPostProcess:snlcRequest:snlcResponse:nLv4Request:nLv4Response:uaapNLProtoResponse:catiProtoResponse:pscRequest:pscResponse:lvcResponse:overridesProtoResponse:mdRequest:mdResponse:mrRequest:mrResponse:spanProtoResponse:rdResponse:tokenProtoResponse:ssuResponse:ccqrResponse:correctionOutcome:nluRequest:graphInput:debugText:", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 40),
    *(void *)(*(void *)(*(void *)(a1 + 184) + 8) + 40),
    *(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 40),
    *(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 40),
    *(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 40),
    *(void *)(*(void *)(*(void *)(a1 + 216) + 8) + 40),
    v9,
    *(_OWORD *)(a1 + 32),
  uint64_t v7 = *(void *)(a1 + 48));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 224));
  [WeakRetained setGraphOutput:v7];
}

BOOL __32__CDMNLUServiceGraph_buildGraph__block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) parsesForReplacement];
  uint64_t v2 = [v1 count];

  uint64_t v3 = CDMOSLoggerForCategory(0);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      int v7 = 136315138;
      id v8 = "-[CDMNLUServiceGraph buildGraph]_block_invoke_3";
      uint64_t v5 = "%s Skip node logic #1: Non-empty overridesProtoResponse.parsesForReplacement, will initiate skip of inference nodes";
LABEL_7:
      _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, v5, (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v4)
  {
    int v7 = 136315138;
    id v8 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    uint64_t v5 = "%s Skip node logic #1: Empty overridesProtoResponse.parsesForReplacement, will NOT skip inference nodes";
    goto LABEL_7;
  }

  return v2 != 0;
}

BOOL __32__CDMNLUServiceGraph_buildGraph__block_invoke_671(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v1 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) classLabel];
  uint64_t v2 = CDMOSLoggerForCategory(0);
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG);
  if (v1)
  {
    if (v3)
    {
      int v6 = 136315138;
      int v7 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
      BOOL v4 = "%s Skip node logic #2: SNLC did NOT classify SNLC_CLASS_SERVER, will NOT skip doNLv4Inference node";
LABEL_7:
      _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v3)
  {
    int v6 = 136315138;
    int v7 = "-[CDMNLUServiceGraph buildGraph]_block_invoke";
    BOOL v4 = "%s Skip node logic #2: SNLC classified SNLC_CLASS_SERVER, will initiate skip of doNLv4Inference node";
    goto LABEL_7;
  }

  return v1 == 0;
}

- (Class)supportedGraphInputType
{
  return (Class)objc_opt_class();
}

@end