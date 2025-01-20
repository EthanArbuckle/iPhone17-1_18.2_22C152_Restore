@interface CKDZoneGatekeeper
+ (id)gatekeeperForContainerID:(id)a3 accountID:(id)a4;
- (BOOL)hasStatusToReport;
- (CKDZoneGatekeeperImplementation)background;
- (CKDZoneGatekeeperImplementation)foreground;
- (id)CKStatusReportArray;
- (id)initInternal;
- (void)registerWaiter:(id)a3 forZoneIDs:(id)a4 expectDelayBeforeRequestBegins:(BOOL)a5 completionHandler:(id)a6;
- (void)relinquishLocksForWaiter:(id)a3 deferRelinquish:(BOOL)a4;
- (void)setBackground:(id)a3;
- (void)setForeground:(id)a3;
@end

@implementation CKDZoneGatekeeper

+ (id)gatekeeperForContainerID:(id)a3 accountID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1EBBCFBC0 != -1) {
    dispatch_once(&qword_1EBBCFBC0, &unk_1F2042CD0);
  }
  id v8 = objc_alloc(MEMORY[0x1E4F1A470]);
  v10 = objc_msgSend_initWithObject1_object2_(v8, v9, (uint64_t)v6, v7);
  id v11 = a1;
  objc_sync_enter(v11);
  inited = objc_msgSend_objectForKey_((void *)qword_1EBBCFBC8, v12, (uint64_t)v10);
  if (!inited)
  {
    v14 = [CKDZoneGatekeeper alloc];
    inited = objc_msgSend_initInternal(v14, v15, v16);
    objc_msgSend_setObject_forKey_((void *)qword_1EBBCFBC8, v17, (uint64_t)inited, v10);
  }
  objc_sync_exit(v11);

  return inited;
}

- (id)initInternal
{
  v8.receiver = self;
  v8.super_class = (Class)CKDZoneGatekeeper;
  v2 = [(CKDZoneGatekeeper *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    foreground = v2->_foreground;
    v2->_foreground = (CKDZoneGatekeeperImplementation *)v3;

    uint64_t v5 = objc_opt_new();
    background = v2->_background;
    v2->_background = (CKDZoneGatekeeperImplementation *)v5;
  }
  return v2;
}

- (void)registerWaiter:(id)a3 forZoneIDs:(id)a4 expectDelayBeforeRequestBegins:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v18 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v16 = objc_msgSend_foreground(self, v12, v13);
  if (v7)
  {
    uint64_t v17 = objc_msgSend_background(self, v14, v15);

    uint64_t v16 = (void *)v17;
  }
  objc_msgSend_registerWaiter_forZoneIDs_completionHandler_(v16, v14, (uint64_t)v18, v10, v11);
}

- (void)relinquishLocksForWaiter:(id)a3 deferRelinquish:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9 = objc_msgSend_foreground(self, v7, v8);
  objc_msgSend_relinquishLocksForWaiter_deferRelinquish_(v9, v10, (uint64_t)v6, v4);

  objc_msgSend_background(self, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_relinquishLocksForWaiter_deferRelinquish_(v14, v13, (uint64_t)v6, v4);
}

- (BOOL)hasStatusToReport
{
  BOOL v4 = objc_msgSend_foreground(self, a2, v2);
  if (objc_msgSend_hasStatusToReport(v4, v5, v6))
  {
    char hasStatusToReport = 1;
  }
  else
  {
    id v10 = objc_msgSend_background(self, v7, v8);
    char hasStatusToReport = objc_msgSend_hasStatusToReport(v10, v11, v12);
  }
  return hasStatusToReport;
}

- (id)CKStatusReportArray
{
  uint64_t v3 = objc_opt_new();
  uint64_t v6 = objc_msgSend_foreground(self, v4, v5);
  int hasStatusToReport = objc_msgSend_hasStatusToReport(v6, v7, v8);

  if (hasStatusToReport)
  {
    uint64_t v12 = objc_msgSend_stringWithFormat_(NSString, v10, @"foregroundZoneGatekeeper {");
    objc_msgSend_addObject_(v3, v13, (uint64_t)v12);

    uint64_t v16 = objc_msgSend_foreground(self, v14, v15);
    v19 = objc_msgSend_CKStatusReportArray(v16, v17, v18);
    objc_msgSend_addObject_(v3, v20, (uint64_t)v19);

    objc_msgSend_addObject_(v3, v21, @"}");
  }
  v22 = objc_msgSend_background(self, v10, v11);
  int v25 = objc_msgSend_hasStatusToReport(v22, v23, v24);

  if (v25)
  {
    v27 = objc_msgSend_stringWithFormat_(NSString, v26, @"backgroundZoneGatekeeper {");
    objc_msgSend_addObject_(v3, v28, (uint64_t)v27);

    v31 = objc_msgSend_background(self, v29, v30);
    v34 = objc_msgSend_CKStatusReportArray(v31, v32, v33);
    objc_msgSend_addObject_(v3, v35, (uint64_t)v34);

    objc_msgSend_addObject_(v3, v36, @"}");
  }
  return v3;
}

- (CKDZoneGatekeeperImplementation)foreground
{
  return self->_foreground;
}

- (void)setForeground:(id)a3
{
}

- (CKDZoneGatekeeperImplementation)background
{
  return self->_background;
}

- (void)setBackground:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_foreground, 0);
}

@end