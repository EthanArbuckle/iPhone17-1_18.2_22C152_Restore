@interface AMDMegadomeTest
+ (id)testAPI;
+ (id)testMegadome:(id)a3;
+ (void)testSingleView:(id)a3 summary:(id)a4;
@end

@implementation AMDMegadomeTest

+ (id)testMegadome:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v15 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = (id)[location[0] objectForKey:TEST_API];

  if (v9)
  {
    id v16 = (id)[v15 testAPI];
    int v13 = 1;
  }
  else
  {
    id v12 = 0;
    id v8 = (id)[location[0] objectForKey:TEST_JS_HANDLER];

    if (v8)
    {
      id v7 = (id)[location[0] objectForKey:TEST_JS_HANDLER];
      id obj = v12;
      id v6 = +[AMDMegadomeIntegration handleJSRequest:error:](AMDMegadomeIntegration, "handleJSRequest:error:");
      objc_storeStrong(&v12, obj);
      id v11 = v6;

      if (v12)
      {
        v17 = @"error";
        id v5 = (id)[v12 localizedDescription];
        v18[0] = v5;
        id v16 = (id)[NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
      }
      else
      {
        id v16 = v11;
      }
      int v13 = 1;
      objc_storeStrong(&v11, 0);
    }
    else
    {
      id v16 = &unk_26BEC2C88;
      int v13 = 1;
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
  v3 = v16;

  return v3;
}

+ (id)testAPI
{
  id v5 = a1;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init(MEMORY[0x263EFF9A0]);
  NSLog(&cfstr_InMegadomeApiT.isa);
  [v5 testSingleView:0x26BEAD078 summary:v4[0]];
  [v5 testSingleView:0x26BEAD0B8 summary:v4[0]];
  NSLog(&cfstr_DoneMegadomeAp.isa);
  id v3 = v4[0];
  objc_storeStrong(v4, 0);

  return v3;
}

+ (void)testSingleView:(id)a3 summary:(id)a4
{
  v64[3] = *MEMORY[0x263EF8340];
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v62 = 0;
  objc_storeStrong(&v62, a4);
  NSLog(&cfstr_ListingView.isa, location[0]);
  id v61 = 0;
  id v60 = 0;
  id v59 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  char v58 = 0;
  id v57 = (id)[getGDViewServiceClass_0() clientService];
  id v56 = 0;
  if ([location[0] isEqualToString:0x26BEAD0B8])
  {
    id v55 = v61;
    id v30 = (id)[v57 firstPartyShortTermTopicViewWithError:&v55];
    objc_storeStrong(&v61, v55);
    id v4 = v56;
    id v56 = v30;
  }
  else
  {
    if (([location[0] isEqualToString:0x26BEAD078] & 1) == 0)
    {
      id v6 = (id)[NSString stringWithFormat:@"Bad view: %@", location[0]];
      id v7 = v60;
      id v60 = v6;

      NSLog(&stru_26BEADD78.isa, v60);
      [v59 setObject:v60 forKey:@"error"];
      int v53 = 1;
      goto LABEL_19;
    }
    id v54 = v61;
    id v29 = (id)[v57 firstPartyLongTermTopicViewWithError:&v54];
    objc_storeStrong(&v61, v54);
    id v5 = v56;
    id v56 = v29;
  }
  if (v61)
  {
    v27 = NSString;
    id v28 = location[0];
    id v26 = (id)[v61 localizedDescription];
    id v8 = (id)[v27 stringWithFormat:@"Error obtaining viewProtocol for %@: %@", v28, v26];
    id v9 = v60;
    id v60 = v8;

    NSLog(&stru_26BEADD78.isa, v60);
    [v59 setObject:v60 forKey:@"error"];
    int v53 = 1;
  }
  else
  {
    uint64_t v48 = 0;
    v49 = &v48;
    int v50 = 0x20000000;
    int v51 = 32;
    int v52 = 0;
    id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v25 = v56;
    uint64_t v41 = MEMORY[0x263EF8330];
    int v42 = -1073741824;
    int v43 = 0;
    v44 = __42__AMDMegadomeTest_testSingleView_summary___block_invoke;
    v45 = &unk_263FE2418;
    v46[0] = v47;
    v46[1] = &v48;
    [v25 enumerateTopicsWithBlock:&v41];
    [v59 setObject:v47 forKey:@"iteratedData"];
    id v24 = v59;
    id v23 = (id)[NSNumber numberWithUnsignedInt:*((unsigned int *)v49 + 6)];
    objc_msgSend(v24, "setObject:forKey:");

    NSLog(&cfstr_FoundUEntriesI.isa, *((unsigned int *)v49 + 6), location[0]);
    id v22 = location[0];
    id v21 = (id)[v56 databaseFilePath];
    NSLog(&cfstr_DbPathForView.isa, v22, v21);

    unsigned int v40 = 0;
    ppDb = 0;
    id v20 = (id)[v56 databaseFilePath];
    unsigned int v40 = sqlite3_open_v2((const char *)[v20 UTF8String], &ppDb, 65538, 0);

    if (v40)
    {
      id v10 = (id)objc_msgSend(NSString, "stringWithFormat:", @"MEGADOME DB loading failed: %d", v40);
      id v11 = v60;
      id v60 = v10;

      NSLog(&stru_26BEADD78.isa, v60);
      [v59 setObject:v60 forKey:@"SQLData"];
      int v53 = 1;
    }
    else
    {
      NSLog(&cfstr_LoadedDb.isa);
      ppStmt = 0;
      id v37 = @"SELECT topicId, score, most_recent_documentId FROM topics ORDER BY score DESC";
      unsigned int v40 = sqlite3_prepare_v2(ppDb, (const char *)[v37 UTF8String], -1, &ppStmt, 0);
      if (!v40 && ppStmt)
      {
        unsigned int v36 = 0;
        id v35 = objc_alloc_init(MEMORY[0x263EFF980]);
        while (sqlite3_step(ppStmt) == 100)
        {
          id v34 = (id)objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 0));
          double v33 = 0.0;
          double v33 = sqlite3_column_double(ppStmt, 1);
          id v32 = (id)objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(ppStmt, 2));
          NSLog(&cfstr_TopicIdScoreFD.isa, v34, *(void *)&v33, v32);
          id v19 = v35;
          v64[0] = v34;
          id v18 = (id)[NSNumber numberWithDouble:v33];
          v64[1] = v18;
          v64[2] = v32;
          id v17 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:3];
          objc_msgSend(v19, "addObject:");

          ++v36;
          objc_storeStrong(&v32, 0);
          objc_storeStrong(&v34, 0);
        }
        [v59 setObject:v35 forKey:@"sqlData"];
        id v16 = v59;
        id v15 = (id)[NSNumber numberWithUnsignedInt:v36];
        objc_msgSend(v16, "setObject:forKey:");

        NSLog(&cfstr_FoundUEntriesI_0.isa, *((unsigned int *)v49 + 6), location[0]);
        objc_storeStrong(&v35, 0);
        int v53 = 0;
      }
      else
      {
        id v12 = (id)objc_msgSend(NSString, "stringWithFormat:", @"MEGADOME Query prep failed: %d", v40);
        id v13 = v60;
        id v60 = v12;

        NSLog(&stru_26BEADD78.isa, v60);
        [v59 setObject:v60 forKey:@"sqlData"];
        int v53 = 1;
      }
      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(v46, 0);
    objc_storeStrong(&v47, 0);
    _Block_object_dispose(&v48, 8);
  }
LABEL_19:
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  if (!v53) {
    int v53 = 0;
  }
  int v14 = v53;
  [v62 setObject:v59 forKey:location[0]];
  if (v58) {
    objc_exception_rethrow();
  }
  int v53 = v14;
  if (v14)
  {
    if (v14 == 2)
    {
      __break(1u);
      JUMPOUT(0x20AC786D8);
    }
  }
  else
  {
    int v53 = 0;
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v60, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(location, 0);
}

void __42__AMDMegadomeTest_testSingleView_summary___block_invoke(void *a1, void *a2)
{
  v14[3] = *MEMORY[0x263EF8340];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = (id)[location[0] topicIdentifier];
  [location[0] topicScore];
  uint64_t v3 = v2;
  id v4 = (id)[location[0] mostRecentDocumentId];
  NSLog(&cfstr_TopicIdScoreFD.isa, v5, v3, v4);

  id v7 = (void *)a1[4];
  id v11 = (id)[location[0] topicIdentifier];
  v14[0] = v11;
  id v6 = NSNumber;
  [location[0] topicScore];
  id v10 = (id)objc_msgSend(v6, "numberWithDouble:");
  v14[1] = v10;
  id v9 = (id)[location[0] mostRecentDocumentId];
  v14[2] = v9;
  id v8 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  objc_msgSend(v7, "addObject:");

  ++*(_DWORD *)(*(void *)(a1[5] + 8) + 24);
  objc_storeStrong(location, 0);
}

@end