@interface PDDevEndpointServer
- (BOOL)copyClass:(id)a3 fromDB:(id)a4 toDB:(id)a5;
- (BOOL)copyHandout:(id)a3 fromDB:(id)a4 toDB:(id)a5;
- (BOOL)insertDefaultCollaborationStatesFor:(id)a3 forClassID:(id)a4 toPersonIDs:(id)a5 fromPersonID:(id)a6;
- (BOOL)validateHandoutGraph:(id)a3 error:(id *)a4;
- (PDDatabase)studentDB;
- (PDDatabase)teacherDB;
- (id)_applyCollaborationStateChanges:(id)a3;
- (id)_createHandoutAssignedItemFrom:(id)a3 withError:(id *)a4;
- (id)database;
- (id)statusReport;
- (void)generateReports;
- (void)handleCollaborationStateChangesForMarkActivityAsComplete:(id)a3;
- (void)populateDevDB:(id)a3 forStudent:(BOOL)a4;
- (void)processSavedObjects:(id)a3;
- (void)remote_deleteAdminRequestID:(id)a3 completion:(id)a4;
- (void)remote_fetchAndCompleteActiveAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4;
- (void)remote_fetchHandoutAttachmentForDocumentURL:(id)a3 withCompletion:(id)a4;
- (void)remote_publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6;
- (void)remote_publishClass:(id)a3 membersToInsert:(id)a4 membersToDelete:(id)a5 completion:(id)a6;
- (void)remote_publishCollaborationStateChanges:(id)a3 completion:(id)a4;
- (void)remote_publishHandoutGraph:(id)a3 completion:(id)a4;
- (void)remote_publishSurveyAnswers:(id)a3 completion:(id)a4;
- (void)remote_saveObjects:(id)a3 saveResponse:(id)a4 completion:(id)a5;
- (void)remote_validateAndCreateHandoutAssignedItem:(id)a3 withCompletion:(id)a4;
@end

@implementation PDDevEndpointServer

- (id)statusReport
{
  v4.receiver = self;
  v4.super_class = (Class)PDDevEndpointServer;
  v2 = [(PDEndpointServer *)&v4 statusReport];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"is connected as dev"];

  return v2;
}

- (void)remote_publishClass:(id)a3 membersToInsert:(id)a4 membersToDelete:(id)a5 completion:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (void (**)(id, uint64_t, void *))a6;
  sub_100005DDC((uint64_t)self, a2);
  v15 = [(PDDevEndpointServer *)self database];
  v16 = [(PDEndpointServer *)self daemon];
  unsigned int v17 = [v16 mode];

  v18 = [(PDEndpointServer *)self client];
  if (v18) {
    BOOL v19 = v18[26] == 0;
  }
  else {
    BOOL v19 = 1;
  }

  if (v15)
  {
    unsigned __int8 v20 = sub_100004B84(v15);
    BOOL v21 = v17 != 2 || v19;
    if (!v21 && (v20 & 2) != 0)
    {
      v22 = [(PDEndpointServer *)self client];
      v23 = sub_10000C6B4(v22);

      v44[0] = 0;
      v44[1] = v44;
      v44[2] = 0x3032000000;
      v44[3] = sub_10000B6E4;
      v44[4] = sub_10000B58C;
      id v24 = v11;
      id v45 = v24;
      v34 = _NSConcreteStackBlock;
      uint64_t v35 = 3221225472;
      v36 = sub_1000AD740;
      v37 = &unk_1001F3DB8;
      v43 = v44;
      id v25 = v23;
      id v38 = v25;
      id v26 = v15;
      id v39 = v26;
      id v40 = v13;
      id v41 = v12;
      id v27 = v24;
      id v42 = v27;
      unsigned __int8 v28 = [v26 performTransaction:&v34 forWriting:1];
      if (v27)
      {
        v29 = [(PDDevEndpointServer *)self studentDB];
        unsigned __int8 v30 = [(PDDevEndpointServer *)self copyClass:v27 fromDB:v26 toDB:v29];

        if (v30)
        {
LABEL_11:
          v31 = 0;
          uint64_t v32 = 1;
LABEL_15:
          v14[2](v14, v32, v31);

          _Block_object_dispose(v44, 8);
          goto LABEL_16;
        }
      }
      else if (v28)
      {
        goto LABEL_11;
      }
      v31 = +[NSError cls_createErrorWithCode:100, @"Failed to create class.", v34, v35, v36, v37 description];
      uint64_t v32 = 0;
      goto LABEL_15;
    }
  }
  v33 = +[NSError cls_createErrorWithCode:4 description:@"Creating classes not allowed."];
  v14[2](v14, 0, v33);

LABEL_16:
}

- (BOOL)validateHandoutGraph:(id)a3 error:(id *)a4
{
  return 1;
}

- (void)remote_publishHandoutGraph:(id)a3 completion:(id)a4
{
  id v41 = a3;
  id v42 = (void (**)(id, void, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  v43 = self;
  v44 = [(PDDevEndpointServer *)self database];
  v7 = [(PDEndpointServer *)self daemon];
  unsigned int v8 = [v7 mode];

  v9 = [(PDEndpointServer *)self client];
  if (v9) {
    BOOL v10 = v9[26] != 0;
  }
  else {
    BOOL v10 = 0;
  }

  if (v44)
  {
    unsigned __int8 v11 = sub_100004B84(v44);
    if (v8 == 2 && v10 && (v11 & 2) != 0)
    {
      id v79 = 0;
      unsigned __int8 v12 = [(PDDevEndpointServer *)v43 validateHandoutGraph:v41 error:&v79];
      id v13 = v79;
      id v40 = v13;
      if ((v12 & 1) == 0)
      {
        v42[2](v42, 0, v13);
LABEL_29:

        goto LABEL_30;
      }
      v14 = [(PDEndpointServer *)v43 client];
      id v39 = sub_10000C6B4(v14);

      v77[0] = 0;
      v77[1] = v77;
      v77[2] = 0x3032000000;
      v77[3] = sub_10000B6E4;
      v77[4] = sub_10000B58C;
      v15 = sub_100003E58(v44);
      id v78 = [v15 objectID];

      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x3032000000;
      v74 = sub_10000B6E4;
      v75 = sub_10000B58C;
      id v76 = 0;
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x3032000000;
      v68 = sub_10000B6E4;
      v69 = sub_10000B58C;
      id v70 = (id)objc_opt_new();
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v16 = v41;
      id v17 = [v16 countByEnumeratingWithState:&v61 objects:v81 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v62;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v62 != v18) {
              objc_enumerationMutation(v16);
            }
            unsigned __int8 v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v21 = v20;
              v22 = [v21 personID];

              if (v22)
              {
                v23 = (void *)v66[5];
                id v24 = [v21 personID];
                [v23 addObject:v24];
              }
              id v25 = [v21 classID];

              if (v25)
              {
                uint64_t v26 = [v21 classID];
                id v27 = (void *)v72[5];
                v72[5] = v26;

                v80[0] = v72[5];
                v80[1] = &off_10020AED8;
                unsigned __int8 v28 = +[NSArray arrayWithObjects:v80 count:2];
                uint64_t v29 = objc_opt_class();
                v60[0] = _NSConcreteStackBlock;
                v60[1] = 3221225472;
                v60[2] = sub_1000AE044;
                v60[3] = &unk_1001F3DE0;
                v60[4] = &v65;
                [v44 selectAll:v29 where:@"parentObjectID = ? AND roles = ?" bindings:v28 block:v60];
              }
            }
          }
          id v17 = [v16 countByEnumeratingWithState:&v61 objects:v81 count:16];
        }
        while (v17);
      }

      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x3032000000;
      v57 = sub_10000B6E4;
      v58 = sub_10000B58C;
      id v59 = 0;
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1000AE0A4;
      v45[3] = &unk_1001F3E08;
      id v46 = v16;
      v50 = &v54;
      id v30 = v39;
      id v47 = v30;
      id v31 = v44;
      id v48 = v31;
      v49 = v43;
      v51 = &v71;
      v52 = &v65;
      v53 = v77;
      unsigned __int8 v32 = [v31 performTransaction:v45 forWriting:1];
      uint64_t v33 = v55[5];
      if (v33)
      {
        v34 = [(PDDevEndpointServer *)v43 studentDB];
        unsigned __int8 v35 = [(PDDevEndpointServer *)v43 copyHandout:v33 fromDB:v31 toDB:v34];

        if (v35)
        {
LABEL_23:
          v36 = 0;
          uint64_t v37 = 1;
LABEL_28:
          v42[2](v42, v37, v36);

          _Block_object_dispose(&v54, 8);
          _Block_object_dispose(&v65, 8);

          _Block_object_dispose(&v71, 8);
          _Block_object_dispose(v77, 8);

          goto LABEL_29;
        }
      }
      else if (v32)
      {
        goto LABEL_23;
      }
      v36 = +[NSError cls_createErrorWithCode:100 description:@"Failed to publish handout."];
      uint64_t v37 = 0;
      goto LABEL_28;
    }
  }
  id v38 = +[NSError cls_createErrorWithCode:4 description:@"Publishing handouts not allowed."];
  v42[2](v42, 0, v38);

LABEL_30:
}

- (BOOL)copyHandout:(id)a3 fromDB:(id)a4 toDB:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 insertOrUpdateObject:v7])
  {
    v99[0] = 0;
    v99[1] = v99;
    v99[2] = 0x3032000000;
    v99[3] = sub_10000B6E4;
    v99[4] = sub_10000B58C;
    BOOL v10 = sub_100003E58(v9);
    id v100 = [v10 objectID];

    uint64_t v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x2020000000;
    char v98 = 0;
    unsigned __int8 v11 = [v7 objectID];
    v101 = v11;
    unsigned __int8 v12 = +[NSArray arrayWithObjects:&v101 count:1];

    uint64_t v13 = objc_opt_class();
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_1000AEF8C;
    v92[3] = &unk_1001F3E30;
    v94 = &v95;
    id v14 = v9;
    id v93 = v14;
    [v8 selectAll:v13 where:@"parentObjectID = ?" bindings:v12 block:v92];
    if (*((unsigned char *)v96 + 24))
    {
      BOOL v15 = 0;
      id v16 = @"parentObjectID = ?";
    }
    else
    {
      id v17 = objc_opt_new();
      uint64_t v18 = objc_opt_new();
      BOOL v19 = objc_opt_new();
      unsigned __int8 v20 = [v7 objectID];
      [v17 addObject:v20];

      uint64_t v21 = objc_opt_class();
      v86[0] = _NSConcreteStackBlock;
      v86[1] = 3221225472;
      v86[2] = sub_1000AEFDC;
      v86[3] = &unk_1001F3E58;
      v91 = &v95;
      id v22 = v14;
      id v87 = v22;
      id v23 = v17;
      id v88 = v23;
      id v24 = v18;
      id v89 = v24;
      id v25 = v19;
      id v90 = v25;
      [v8 selectAll:v21 where:@"parentObjectID = ?" bindings:v12 block:v86];
      if (*((unsigned char *)v96 + 24))
      {
        BOOL v15 = 0;
        id v16 = @"parentObjectID = ?";
      }
      else
      {
        uint64_t v26 = objc_opt_class();
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_1000AF0F0;
        v83[3] = &unk_1001F3E80;
        v85 = &v95;
        id v49 = v22;
        id v84 = v49;
        [v8 selectAll:v26 where:@"parentObjectID = ?" bindings:v12 block:v83];
        if (*((unsigned char *)v96 + 24))
        {
          BOOL v15 = 0;
          id v16 = @"parentObjectID = ?";
        }
        else
        {
          if ([v24 count])
          {
            id v27 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];
            uint64_t v28 = objc_opt_class();
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472;
            v79[2] = sub_1000AF140;
            v79[3] = &unk_1001F3EA8;
            v82 = &v95;
            id v80 = v49;
            id v81 = v23;
            [v8 selectAll:v28 where:v27 bindings:v24 block:v79];
          }
          else
          {
            id v27 = @"parentObjectID = ?";
          }
          id v48 = objc_opt_new();
          if ([v25 count])
          {
            uint64_t v29 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];

            uint64_t v30 = objc_opt_class();
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = sub_1000AF1D4;
            v75[3] = &unk_1001F3ED0;
            id v78 = &v95;
            id v76 = v49;
            id v77 = v48;
            [v8 selectAll:v30 where:v29 bindings:v25 block:v75];
          }
          else
          {
            uint64_t v29 = v27;
          }
          id v47 = objc_opt_new();
          v44 = objc_opt_new();
          id v46 = objc_opt_new();
          if ([v48 count])
          {
            id v31 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];

            uint64_t v32 = objc_opt_class();
            v68[0] = _NSConcreteStackBlock;
            v68[1] = 3221225472;
            v68[2] = sub_1000AF278;
            v68[3] = &unk_1001F3EF8;
            v74 = &v95;
            id v69 = v49;
            id v70 = v23;
            id v71 = v47;
            id v72 = v44;
            id v73 = v46;
            [v8 selectAll:v32 where:v31 bindings:v48 block:v68];
          }
          else
          {
            id v31 = v29;
          }
          uint64_t v33 = objc_opt_new();
          if ([v47 count])
          {
            v34 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];

            uint64_t v35 = objc_opt_class();
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_1000AF38C;
            v64[3] = &unk_1001F3F20;
            uint64_t v67 = &v95;
            id v65 = v49;
            id v66 = v33;
            [v8 selectAll:v35 where:v34 bindings:v47 block:v64];
          }
          else
          {
            v34 = v31;
          }
          if (objc_msgSend(v46, "count", v44))
          {
            v36 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];

            uint64_t v37 = objc_opt_class();
            v61[0] = _NSConcreteStackBlock;
            v61[1] = 3221225472;
            v61[2] = sub_1000AF430;
            v61[3] = &unk_1001F3E30;
            long long v63 = &v95;
            id v62 = v49;
            [v8 selectAll:v37 where:v36 bindings:v46 block:v61];
          }
          else
          {
            v36 = v34;
          }
          if ([v45 count])
          {
            id v38 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];

            uint64_t v39 = objc_opt_class();
            v58[0] = _NSConcreteStackBlock;
            v58[1] = 3221225472;
            v58[2] = sub_1000AF480;
            v58[3] = &unk_1001F3E30;
            v60 = &v95;
            id v59 = v49;
            [v8 selectAll:v39 where:v38 bindings:v45 block:v58];
          }
          else
          {
            id v38 = v36;
          }
          if ([v33 count])
          {
            id v40 = +[PDDatabase whereSQLForArray:v24 prefix:@"parentObjectID in "];

            uint64_t v41 = objc_opt_class();
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_1000AF4D0;
            v54[3] = &unk_1001F3F48;
            v57 = &v95;
            id v55 = v49;
            id v56 = v23;
            [v8 selectAll:v41 where:v40 bindings:v33 block:v54];
          }
          else
          {
            id v40 = v38;
          }
          if ([v23 count])
          {
            id v16 = +[PDDatabase whereSQLForArray:v23 prefix:@"parentObjectID in "];

            uint64_t v42 = objc_opt_class();
            v50[0] = _NSConcreteStackBlock;
            v50[1] = 3221225472;
            v50[2] = sub_1000AF564;
            v50[3] = &unk_1001F3F70;
            v52 = v99;
            v53 = &v95;
            id v51 = v49;
            [v8 selectAll:v42 where:v16 bindings:v23 block:v50];
          }
          else
          {
            id v16 = v40;
          }
          BOOL v15 = *((unsigned char *)v96 + 24) == 0;
        }
      }
    }
    _Block_object_dispose(&v95, 8);
    _Block_object_dispose(v99, 8);
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)copyClass:(id)a3 fromDB:(id)a4 toDB:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v9 insertOrUpdateObject:v7])
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    BOOL v10 = [v7 objectID];
    id v27 = v10;
    unsigned __int8 v11 = +[NSArray arrayWithObjects:&v27 count:1];

    uint64_t v12 = objc_opt_class();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000AF83C;
    v20[3] = &unk_1001F3E30;
    id v22 = &v23;
    id v13 = v9;
    id v21 = v13;
    [v8 selectAll:v12 where:@"parentObjectID = ?" bindings:v11 block:v20];
    if (*((unsigned char *)v24 + 24))
    {
      BOOL v14 = 0;
    }
    else
    {
      uint64_t v15 = objc_opt_class();
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000AF88C;
      v17[3] = &unk_1001F3F98;
      BOOL v19 = &v23;
      id v18 = v13;
      [v8 selectAll:v15 where:@"parentObjectID = ?" bindings:v11 block:v17];
      BOOL v14 = *((unsigned char *)v24 + 24) == 0;
    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)remote_saveObjects:(id)a3 saveResponse:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(PDDevEndpointServer *)self processSavedObjects:v10];
  v11.receiver = self;
  v11.super_class = (Class)PDDevEndpointServer;
  [(PDEndpointServer *)&v11 remote_saveObjects:v10 saveResponse:v9 completion:v8];

  [(PDDevEndpointServer *)self generateReports];
}

- (void)processSavedObjects:(id)a3
{
  id v4 = a3;
  v5 = [(PDEndpointServer *)self daemon];
  unsigned int v6 = [v5 mode];

  if (v6 == 2)
  {
    id v7 = [(PDDevEndpointServer *)self studentDB];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v4;
    id v16 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          unsigned __int8 v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v20, "canCopyToDatabase:", v7, (void)v21)) {
            [v20 writeInDatabase:v7];
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v17);
    }

LABEL_28:
  }
  else if (v6 == 1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = v4;
    id v8 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (!v8) {
      goto LABEL_28;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v26;
    while (1)
    {
      for (j = 0; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          if ([v13 completionStatus] == 1)
          {
            uint64_t v14 = 3;
            goto LABEL_13;
          }
          if ([v13 completionStatus] == 2)
          {
            uint64_t v14 = 0;
LABEL_13:
            [v13 setCompletionStatus:v14];
          }

          continue;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (!v9) {
        goto LABEL_28;
      }
    }
  }
}

- (void)generateReports
{
  v3 = [(PDEndpointServer *)self daemon];
  unsigned int v4 = [v3 mode];

  if (v4 == 1)
  {
    v5 = [(PDDevEndpointServer *)self studentDB];
    unsigned int v6 = [(PDDevEndpointServer *)self teacherDB];
    uint64_t v7 = objc_opt_class();
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000AFCA4;
    v10[3] = &unk_1001F3FC0;
    id v11 = v5;
    id v12 = v6;
    id v8 = v6;
    id v9 = v5;
    [v9 selectAll:v7 block:v10];
  }
}

- (id)_applyCollaborationStateChanges:(id)a3
{
  id v4 = a3;
  v5 = [(PDDevEndpointServer *)self database];
  unsigned int v6 = sub_100003E58(v5);

  if (v6)
  {
    uint64_t v7 = sub_100003E58(v5);
    id v31 = [v7 objectID];

    id v8 = [(PDDevEndpointServer *)self teacherDB];
    id v9 = sub_100003E58(v8);
    uint64_t v35 = [v9 objectID];

    id v38 = (id)objc_opt_new();
    uint64_t v37 = objc_opt_new();
    uint64_t v10 = objc_opt_new();
    id v11 = sub_100003E58(v5);

    if (v11)
    {
      long long v28 = self;
      uint64_t v29 = v5;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v30 = v4;
      id obj = v4;
      id v34 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v34)
      {
        uint64_t v33 = *(void *)v44;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v44 != v33) {
              objc_enumerationMutation(obj);
            }
            id v13 = *(void **)(*((void *)&v43 + 1) + 8 * v12);
            uint64_t v14 = [v13 senderPersonID];

            if (!v14) {
              [v13 setSenderPersonID:v31];
            }
            uint64_t v15 = [v13 senderPersonID];
            id v16 = (void *)v15;
            unint64_t v17 = (v35 | v15) == 0;
            uint64_t v36 = v12;
            if (v35 && v15)
            {
              uint64_t v18 = [v13 senderPersonID];
              unint64_t v17 = (unint64_t)[(id)v35 isEqualToString:v18];
            }
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            BOOL v19 = [v13 changedDomains];
            id v20 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (v20)
            {
              id v21 = v20;
              uint64_t v22 = *(void *)v40;
              do
              {
                for (i = 0; i != v21; i = (char *)i + 1)
                {
                  if (*(void *)v40 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  long long v24 = objc_msgSend(v13, "stateForDomain:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "integerValue"));
                  if (v24)
                  {
                    [v38 addObject:v24];
                    +[PDSchoolworkCollaborationStateAdaptor devMode_MutateStateChanges:forDomain:](PDSchoolworkCollaborationStateAdaptor, "devMode_MutateStateChanges:forDomain:", v13, [v24 domain]);
                    +[PDSchoolworkCollaborationStateAdaptor devMode_DistributeState:v24 sentByTeacher:v17 toTeacherStates:v10 toStudentStates:v37];
                  }
                }
                id v21 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
              }
              while (v21);
            }

            uint64_t v12 = v36 + 1;
          }
          while ((id)(v36 + 1) != v34);
          id v34 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v34);
      }

      v5 = v29;
      id v4 = v30;
      self = v28;
    }
    long long v25 = [(PDDevEndpointServer *)self studentDB];
    [v25 insertOrUpdateObjects:v38];

    long long v26 = [(PDDevEndpointServer *)self teacherDB];
    [v26 insertOrUpdateObjects:v38];
  }
  else
  {
    id v38 = &__NSArray0__struct;
  }

  return v38;
}

- (void)remote_publishCollaborationStateChanges:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *, void))a4;
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    uint64_t v10 = [(PDDevEndpointServer *)self database];
    id v11 = sub_100003E58(v10);

    if (v11)
    {
      uint64_t v12 = [(PDDevEndpointServer *)self _applyCollaborationStateChanges:v6];
      v7[2](v7, v12, &__NSArray0__struct, 0);
    }
    else
    {
      CLSInitLog();
      id v13 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_ERROR))
      {
        v14[0] = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Must be signed in to publish state changes.", (uint8_t *)v14, 2u);
      }
      uint64_t v12 = +[NSError cls_createErrorWithCode:2 description:@"Must be signed in to publish state changes."];
      ((void (**)(id, void *, void *, void *))v7)[2](v7, 0, 0, v12);
    }
  }
  else
  {
    uint64_t v10 = +[NSError cls_createErrorWithCode:4 description:@"Changing assignment state not allowed. Not a Dashboard Client."];
    ((void (**)(id, void *, void *, void *))v7)[2](v7, 0, 0, v10);
  }
}

- (void)handleCollaborationStateChangesForMarkActivityAsComplete:(id)a3
{
  id v4 = a3;
  v5 = [PDSchoolworkCollaborationStateChangeManager alloc];
  id v6 = [(PDEndpointServer *)self client];
  uint64_t v7 = sub_10000C6B4(v6);
  id v8 = [(PDDevEndpointServer *)self database];
  long long v27 = sub_1000FF428((id *)&v5->super.isa, v7, v8);

  int v9 = [(PDDevEndpointServer *)self database];
  uint64_t v10 = sub_100003E58(v9);

  if (v10)
  {
    id v11 = sub_100003E58(v9);
    uint64_t v12 = [v11 objectID];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    if (v4) {
      id v13 = (void *)v4[2];
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;
    id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          BOOL v19 = [v9 select:objc_opt_class() identity:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          id v20 = v19;
          if (v19)
          {
            [v19 setCompletionStatus:3];
            sub_1000FF590(v27, v20, v12);
            id v21 = [(PDDevEndpointServer *)self studentDB];
            [v21 insertOrUpdateObject:v20];

            uint64_t v22 = [(PDDevEndpointServer *)self teacherDB];
            [v22 insertOrUpdateObject:v20];
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    long long v23 = sub_1000FF7A4(v27);
    id v24 = [(PDDevEndpointServer *)self _applyCollaborationStateChanges:v23];

    if (v4) {
      long long v25 = (void *)v4[4];
    }
    else {
      long long v25 = 0;
    }
    id v26 = v25;
    sub_10002F21C(self, v26);
  }
}

- (void)remote_fetchAndCompleteActiveAssignedActivitiesForContextPath:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (sub_1000A5C14())
  {
    sub_100005DDC((uint64_t)self, a2);
    int v9 = [(PDDevEndpointServer *)self database];
    id v10 = v9;
    if (v9) {
      unint64_t v11 = ((unint64_t)sub_100004B84(v9) >> 1) & 1;
    }
    else {
      LODWORD(v11) = 0;
    }
    if (!sub_100066C68(v10) || v11)
    {
      uint64_t v13 = 0;
      +[NSError cls_assignError:&v13 code:323 description:@"Unable call to fetchAndCompleteAllAssignedActivitiesForContextPath. Progress tracking is not allowed."];
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
    else
    {
      uint64_t v12 = sub_10002D20C(self, v7);
      [(PDDevEndpointServer *)self handleCollaborationStateChangesForMarkActivityAsComplete:v12];
      (*((void (**)(id, uint64_t, void))v8 + 2))(v8, 1, 0);
    }
  }
  else
  {
    id v14 = 0;
    +[NSError cls_assignError:&v14 code:322 description:@"No-Op for mark all assigned activities complete. Schoolwork is not installed."];
    id v10 = v14;
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v10);
  }
}

- (BOOL)insertDefaultCollaborationStatesFor:(id)a3 forClassID:(id)a4 toPersonIDs:(id)a5 fromPersonID:(id)a6
{
  id v9 = a3;
  id v28 = a4;
  id v10 = a5;
  unint64_t v11 = objc_opt_new();
  long long v27 = [(PDDevEndpointServer *)self database];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v10;
  id v29 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    uint64_t v13 = *(void *)v31;
    p_cache = PDFetchReportsOperation.cache;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v15);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = sub_1000A01DC((uint64_t)(p_cache + 213), v9, v16, v28);
          [v11 addObjectsFromArray:v17];
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = [(PDEndpointServer *)self daemon];
          unsigned int v19 = [v18 mode];

          if (v19 == 2)
          {
            id v20 = objc_alloc((Class)CLSCollaborationState);
            id v21 = sub_100002F74(v27);
            id v22 = [v20 initForObject:v9 ownerPersonID:v21 domain:5 state:1 flags:0];

            p_cache = (void **)(PDFetchReportsOperation + 16);
            long long v23 = sub_100002F74(v27);
            [v22 setSenderPersonID:v23];

            [v11 addObject:v22];
            id v24 = [(PDDevEndpointServer *)self studentDB];
            [v24 insertOrUpdateObject:v22];
          }
        }
        id v15 = (char *)v15 + 1;
      }
      while (v29 != v15);
      id v29 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v29);
  }

  unsigned __int8 v25 = [v27 insertOrUpdateObjects:v11];
  return v25;
}

- (void)remote_fetchHandoutAttachmentForDocumentURL:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000B0D40;
  v29[3] = &unk_1001F3FE8;
  id v7 = a4;
  id v31 = v7;
  id v8 = v6;
  id v30 = v8;
  id v9 = objc_retainBlock(v29);
  id v10 = [v8 lastPathComponent];
  unint64_t v11 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v12 = [v10 stringByAddingPercentEncodingWithAllowedCharacters:v11];

  uint64_t v13 = [@"%/" stringByAppendingString:v12];
  if (v12)
  {
    id v28 = v7;
    id v14 = [(PDDevEndpointServer *)self database];
    uint64_t v15 = objc_opt_class();
    uint64_t v35 = v13;
    id v16 = +[NSArray arrayWithObjects:&v35 count:1];
    uint64_t v17 = [v14 select:v15 where:@"devModeURL LIKE ?" bindings:v16];

    CLSInitLog();
    uint64_t v18 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Looking up asset matching devModeFileName: %@", buf, 0xCu);
    }
    unsigned int v19 = [v17 parentObjectID];

    if (v19)
    {
      id v20 = [(PDDevEndpointServer *)self database];
      uint64_t v21 = objc_opt_class();
      id v22 = [v17 parentObjectID];
      long long v32 = v22;
      long long v23 = +[NSArray arrayWithObjects:&v32 count:1];
      id v24 = [v20 select:v21 where:@"objectID = ?" bindings:v23];

      if (v24)
      {
        unsigned __int8 v25 = 0;
      }
      else
      {
        long long v27 = [v17 objectID];
        unsigned __int8 v25 = +[NSError cls_createErrorWithCode:100, @"failed to find attachment for asset with id: %@", v27 format];

        objc_msgSend(v25, "cls_log:", CLSLogDefault);
      }
      ((void (*)(void *, void *, void *))v9[2])(v9, v24, v25);

      id v7 = v28;
    }
    else
    {
      CLSInitLog();
      id v26 = CLSLogDefault;
      if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v34 = v13;
        _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "failed to find asset matching devModeFileName: %@", buf, 0xCu);
        id v26 = CLSLogDefault;
      }
      objc_msgSend(0, "cls_info:", v26);
      ((void (*)(void *, void, void))v9[2])(v9, 0, 0);
      unsigned __int8 v25 = 0;
    }
  }
  else
  {
    unsigned __int8 v25 = +[NSError cls_createErrorWithCode:2 description:@"URL is nil."];
    ((void (*)(void *, void, void *))v9[2])(v9, 0, v25);
  }
}

- (void)remote_validateAndCreateHandoutAssignedItem:(id)a3 withCompletion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, id))a4;
  sub_100005DDC((uint64_t)self, a2);
  id v9 = [(PDDevEndpointServer *)self database];
  id v10 = v9;
  if (v9) {
    unint64_t v11 = ((unint64_t)sub_100004B84(v9) >> 1) & 1;
  }
  else {
    LODWORD(v11) = 0;
  }
  if (!sub_100066C68(v10) || v11)
  {
    CLSInitLog();
    uint64_t v17 = CLSLogDefault;
    if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Unable call to remote_validateAndCreateHandoutAssignedItem. Progress tracking is not allowed.", buf, 2u);
    }
    id v32 = 0;
    +[NSError cls_assignError:&v32 code:4 description:@"Not Authorized"];
    id v16 = v32;
    v8[2](v8, 0, v16);
  }
  else
  {
    id v12 = [(PDDevEndpointServer *)self database];
    uint64_t v13 = objc_opt_class();
    id v36 = v7;
    id v14 = +[NSArray arrayWithObjects:&v36 count:1];
    uint64_t v15 = [v12 select:v13 where:@"parentObjectID = ?" bindings:v14];

    if (v15)
    {
      ((void (**)(id, void *, id))v8)[2](v8, v15, 0);
      id v16 = 0;
    }
    else
    {
      uint64_t v18 = [(PDDevEndpointServer *)self database];
      uint64_t v19 = objc_opt_class();
      id v35 = v7;
      id v20 = +[NSArray arrayWithObjects:&v35 count:1];
      uint64_t v21 = [v18 select:v19 where:@"objectID = ?" bindings:v20];

      if (v21)
      {
        id v30 = 0;
        id v22 = [(PDDevEndpointServer *)self _createHandoutAssignedItemFrom:v21 withError:&v30];
        id v16 = v30;
        if ([v22 effectiveAuthorizationStatus] == (id)2)
        {
          id v29 = v16;
          +[NSError cls_assignError:&v29 code:4 description:@"Authorization Denied."];
          id v23 = v29;

          v8[2](v8, 0, v23);
          uint64_t v15 = 0;
          id v16 = v23;
        }
        else
        {
          unsigned __int8 v25 = [(PDDevEndpointServer *)self database];
          uint64_t v26 = objc_opt_class();
          long long v27 = [v22 objectID];
          id v34 = v27;
          id v28 = +[NSArray arrayWithObjects:&v34 count:1];
          uint64_t v15 = [v25 select:v26 where:@"objectID = ?" bindings:v28];

          ((void (**)(id, void *, id))v8)[2](v8, v15, v16);
        }
      }
      else
      {
        CLSInitLog();
        id v24 = CLSLogDefault;
        if (os_log_type_enabled(CLSLogDefault, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Unable call to remote_validateAndCreateHandoutAssignedItem. Progress tracking is not allowed, failed to find handout attachment.", buf, 2u);
        }
        id v31 = 0;
        +[NSError cls_assignError:&v31 code:4 description:@"Not Authorized"];
        id v16 = v31;
        v8[2](v8, 0, v16);
        uint64_t v15 = 0;
      }
    }
  }
}

- (id)_createHandoutAssignedItemFrom:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  id v7 = [(PDEndpointServer *)self client];
  id v8 = sub_10000C6B4(v7);
  if (![v8 length])
  {
    +[NSError cls_assignError:a4 code:2 description:@"Unable to determine bundle identifier."];
    id v17 = 0;
    goto LABEL_12;
  }
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = sub_10000B6E4;
  v26[4] = sub_10000B58C;
  id v27 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = sub_10000B6E4;
  v24[4] = sub_10000B58C;
  id v25 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_10000B6E4;
  v22[4] = sub_10000B58C;
  id v23 = 0;
  id v9 = sub_10000C6B4(v7);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000B1620;
  v21[3] = &unk_1001F2170;
  v21[4] = v26;
  v21[5] = v24;
  v21[6] = v22;
  +[CLSUtil fetchInfoForAppWithBundleIdentifier:v9 completion:v21];

  id v10 = objc_alloc((Class)CLSHandoutAssignedItem);
  id v11 = [v6 type];
  id v12 = [v6 title];
  uint64_t v13 = [v6 objectID];
  id v14 = [v10 initWithType:v11 title:v12 handoutAttachmentID:v13];

  id v15 = [v14 effectiveAuthorizationStatus];
  CLSInitLog();
  id v16 = CLSLogDatabase;
  if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Authorization Status %ld.", buf, 0xCu);
  }
  if (v15 == (id)2)
  {
    +[NSError cls_assignError:a4 code:4 description:@"Authorization Denied."];
LABEL_10:
    id v17 = 0;
    goto LABEL_11;
  }
  [v14 setAppIdentifier:v8];
  uint64_t v18 = [(PDDevEndpointServer *)self database];
  unsigned __int8 v19 = [v18 insertObject:v14];

  if ((v19 & 1) == 0)
  {
    +[NSError cls_assignError:a4 code:100 description:@"Unable to create CLSHandoutAssignedItem."];
    goto LABEL_10;
  }
  id v17 = v14;
LABEL_11:

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);

  _Block_object_dispose(v26, 8);
LABEL_12:

  return v17;
}

- (id)database
{
  uint64_t v3 = [(PDEndpointServer *)self client];
  id v4 = [(PDEndpointServer *)self daemon];
  v5 = v4;
  if (v3)
  {
    if (*(unsigned char *)(v3 + 26))
    {
      unsigned int v6 = [v4 mode];
      switch(v6)
      {
        case 2u:
          uint64_t v7 = [(PDDevEndpointServer *)self teacherDB];
          goto LABEL_18;
        case 1u:
          uint64_t v7 = [(PDDevEndpointServer *)self studentDB];
          goto LABEL_18;
        case 0u:
          uint64_t v7 = [v5 database];
LABEL_18:
          id v12 = (void *)v7;
          goto LABEL_21;
      }
    }
    id v8 = *(void **)(v3 + 40);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [v9 classKitEnvironment];

  if (!(v10 | CLSClassKitEnvironmentProduction)
    || v10 && CLSClassKitEnvironmentProduction && objc_msgSend((id)v10, "isEqualToString:"))
  {
    uint64_t v11 = [v5 database];
  }
  else
  {
    if ([v5 mode] == 2) {
      [(PDDevEndpointServer *)self teacherDB];
    }
    else {
    uint64_t v11 = [(PDDevEndpointServer *)self studentDB];
    }
  }
  id v12 = (void *)v11;

LABEL_21:

  return v12;
}

- (PDDatabase)teacherDB
{
  uint64_t v3 = [(PDEndpointServer *)self daemon];
  id v4 = [v3 teacherDevDatabase];

  [(PDDevEndpointServer *)self populateDevDB:v4 forStudent:0];

  return (PDDatabase *)v4;
}

- (PDDatabase)studentDB
{
  uint64_t v3 = [(PDEndpointServer *)self daemon];
  id v4 = [v3 studentDevDatabase];

  [(PDDevEndpointServer *)self populateDevDB:v4 forStudent:1];

  return (PDDatabase *)v4;
}

- (void)remote_publishAdminRequests:(id)a3 withRequestor:(id)a4 adminRequestAccounts:(id)a5 completion:(id)a6
{
  uint64_t v7 = (void (**)(id, void, void *))a6;
  id v8 = [(PDEndpointServer *)self client];
  if (v8 && (int v9 = v8[26], v8, v9))
  {
    CLSInitLog();
    uint64_t v10 = CLSLogOnboarding;
    if (os_log_type_enabled(CLSLogOnboarding, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Feature unavailable.", buf, 2u);
    }
    uint64_t v11 = +[NSError cls_createErrorWithCode:1 description:@"Feature unavailable."];
    v7[2](v7, 0, v11);
  }
  else
  {
    id v12 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    v7[2](v7, 0, v12);
  }
}

- (void)remote_deleteAdminRequestID:(id)a3 completion:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  unsigned int v6 = [(PDEndpointServer *)self client];
  if (v6 && (int v7 = v6[26], v6, v7))
  {
    CLSInitLog();
    id v8 = CLSLogOnboarding;
    if (os_log_type_enabled(CLSLogOnboarding, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Feature unavailable.", buf, 2u);
    }
    int v9 = +[NSError cls_createErrorWithCode:1 description:@"Feature unavailable."];
    v5[2](v5, 0, v9);
  }
  else
  {
    id v10 = +[NSError cls_createErrorWithCode:4 description:@"Not authorized."];
    v5[2](v5, 0, v10);
  }
}

- (void)remote_publishSurveyAnswers:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, void, void *))a4;
  id v8 = [(PDEndpointServer *)self client];
  if (!v8 || (int v9 = v8[26], v8, !v9))
  {
    CFStringRef v12 = @"Not authorized.";
    goto LABEL_14;
  }
  id v10 = [(PDDevEndpointServer *)self database];
  uint64_t v11 = [(PDDevEndpointServer *)self studentDB];

  if (v10 != v11)
  {
    CFStringRef v12 = @"Student only operation.";
LABEL_14:
    uint64_t v26 = +[NSError cls_createErrorWithCode:4 description:v12];
    v7[2](v7, 0, v26);

    goto LABEL_15;
  }
  uint64_t v13 = [(PDDevEndpointServer *)self database];
  id v14 = objc_opt_new();
  uint64_t v15 = objc_opt_class();
  id v16 = [v6 objectID];
  id v34 = v16;
  id v17 = +[NSArray arrayWithObjects:&v34 count:1];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000B1E3C;
  v31[3] = &unk_1001F4010;
  id v18 = v14;
  id v32 = v18;
  [v13 selectAll:v15 where:@"surveyID = ?" bindings:v17 block:v31];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v25 = [(PDDevEndpointServer *)self teacherDB];
        [v25 insertOrUpdateObject:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v21);
  }

  ((void (**)(id, id, void *))v7)[2](v7, v19, 0);
LABEL_15:
}

- (void)populateDevDB:(id)a3 forStudent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  [v5 lock];
  id v6 = sub_100003E58(v5);
  int v7 = v6;
  if (v6 && [v6 sourceType])
  {
    [v5 unlock];
  }
  else
  {
    uint64_t v8 = sub_100005B44(v5);
    if (v8)
    {
      *(_WORD *)(v8 + 10) = 256;
      *(unsigned char *)(v8 + 9) = 0;
      *(unsigned char *)(v8 + 8) = v4;
    }
    BOOL v63 = v4;
    long long v64 = v7;
    id v62 = (void *)v8;
    sub_10004778C(v5, (void *)v8);
    uint64_t v9 = sub_100003A74(v5);
    if (v9)
    {
      *(void *)(v9 + 48) = 2;
      *(unsigned char *)(v9 + 8) = 1;
      *(unsigned char *)(v9 + 10) = 0;
    }
    long long v61 = (void *)v9;
    sub_1000AD338(v5, (void *)v9);
    v58 = v5;
    sub_10006711C(v5, 1);
    id v10 = [objc_alloc((Class)CLSLocation) _init];
    [v10 setLocationName:@"AppleSchool123"];
    [v10 setObjectID:@"AppleSchool123LocationID"];
    [v10 setSourceType:1];
    id v11 = [objc_alloc((Class)CLSRole) _init];
    [v11 setObjectID:@"role-instructor"];
    [v11 setType:4];
    v84[0] = @"CAN_MANAGE_CLASSES";
    v84[1] = @"CAN_MANAGE_MANAGED_APPLE_ID";
    v84[2] = @"CAN_EASY_STUDENT_SIGN_IN";
    CFStringRef v12 = +[NSArray arrayWithObjects:v84 count:3];
    [v11 setPrivileges:v12];

    id v56 = [objc_alloc((Class)CLSRole) _init];
    [v56 setObjectID:@"role-student"];
    [v56 setType:6];
    id v13 = [objc_alloc((Class)CLSClass) _init];
    [v13 setClassName:@"Dev Class"];
    id v14 = [v13 className];
    uint64_t v15 = [v14 sha224];
    [v13 setObjectID:v15];

    [v13 setSource:3];
    [v13 setOriginatingSource:1];
    id v16 = [objc_alloc((Class)CLSPerson) _init];
    [v16 setGivenName:@"Johnny"];
    [v16 setFamilyName:@"Appleseed"];
    [v16 setOrgID:@"apple-school-org-id"];
    [v16 setAppleID:@"johnny.appleseed@apple.com"];
    [v16 setProgressTrackingAllowed:1];
    id v17 = [v16 givenName];
    id v18 = [v17 sha224];
    [v16 setObjectID:v18];

    [v16 setIsSearchable:1];
    [v16 setSourceType:1];
    id v19 = [objc_alloc((Class)CLSPerson) _init];
    [v19 setGivenName:@"Jane"];
    [v19 setFamilyName:@"Appleseed"];
    [v19 setOrgID:@"apple-school-org-id"];
    [v19 setAppleID:@"jane.appleseed@apple.com"];
    [v19 setProgressTrackingAllowed:0];
    id v20 = [v19 givenName];
    id v21 = [v20 sha224];
    [v19 setObjectID:v21];

    [v19 setIsSearchable:1];
    [v19 setSourceType:1];
    id v22 = objc_alloc((Class)CLSClassMember);
    id v23 = [v13 objectID];
    uint64_t v24 = [v19 objectID];
    id v55 = [v22 initWithClassID:v23 personID:v24 roles:2];

    id v25 = objc_alloc((Class)CLSClassMember);
    uint64_t v26 = [v13 objectID];
    long long v27 = [v16 objectID];
    id v54 = [v25 initWithClassID:v26 personID:v27 roles:1];

    long long v28 = [PDPersonRoleLocation alloc];
    long long v29 = [v19 objectID];
    long long v30 = [v11 objectID];
    id v31 = [v10 objectID];
    id v59 = v11;
    id v32 = sub_1000BB794(v28, v29, v30, v31, (uint64_t)[v11 type]);

    long long v33 = [PDPersonRoleLocation alloc];
    id v34 = [v16 objectID];
    id v35 = [v56 objectID];
    id v36 = [v10 objectID];
    uint64_t v37 = sub_1000BB794(v33, v34, v35, v36, (uint64_t)[v56 type]);

    if (v63)
    {
      id v51 = v16;

      v83 = v37;
      id v38 = &v83;
    }
    else
    {
      id v51 = v19;

      v82 = v32;
      id v38 = &v82;
    }
    long long v39 = v32;
    long long v40 = +[NSArray arrayWithObjects:v38 count:1];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000B2628;
    v66[3] = &unk_1001F4038;
    id v5 = v58;
    id v41 = v58;
    id v67 = v41;
    id v57 = v56;
    id v68 = v57;
    id v60 = v59;
    id v69 = v60;
    id v53 = v10;
    id v70 = v53;
    id v52 = v16;
    id v71 = v52;
    long long v42 = v37;
    id v72 = v42;
    id v43 = v19;
    id v73 = v43;
    id v44 = v39;
    id v74 = v44;
    id v65 = v51;
    id v75 = v65;
    id v45 = v40;
    id v76 = v45;
    id v46 = v13;
    id v77 = v46;
    id v47 = v55;
    id v78 = v47;
    id v48 = v54;
    id v79 = v48;
    if (!v41 || ([v41 performTransaction:v66 forWriting:1] & 1) == 0)
    {
      CLSInitLog();
      id v49 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        CFStringRef v50 = @"teacher";
        if (v63) {
          CFStringRef v50 = @"student";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v81 = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Failed to populate dev database for %@.", buf, 0xCu);
      }
    }
    [v41 unlock];

    int v7 = v65;
  }
}

@end