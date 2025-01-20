@interface DSNavigationManager
- (BOOL)isDTOActive;
- (BOOL)shouldIngestURL:(id)a3;
- (Class)startingClassForURL:(id)a3;
- (Class)topViewControllerForUnorderedClass:(Class)a3;
- (DSNavigationManager)init;
- (NSArray)detailControllerPanes;
- (NSArray)panesRequiringNetwork;
- (NSArray)reviewDeviceAccessNavigationOrder;
- (NSArray)safetyCheckNavigationOrderWifiSync;
- (NSArray)safetyResetNavigationOrder;
- (NSArray)safetyResetNavigationOrderDTO;
- (NSArray)sharingActivityNavigationOrder;
- (NSArray)sharingActivityNavigationOrderDTO;
- (NSDictionary)reviewDeviceAccessChapters;
- (NSDictionary)safetyCheckChaptersWifiSync;
- (NSDictionary)safetyResetChapters;
- (NSDictionary)safetyResetChaptersDTO;
- (NSDictionary)sharingActivityChapters;
- (NSDictionary)sharingActivityChaptersDTO;
- (id)deepLinkToPane:(Class)a3 inFlow:(int64_t)a4;
- (id)navigationChaptersForFlowType:(int64_t)a3;
- (id)navigationForURL:(id)a3;
- (id)navigationOrderForFlowType:(int64_t)a3;
- (id)restoredDTONavigationOrder:(int64_t)a3 withPath:(id)a4;
- (id)restoredDeviceAccessNavigationOrder:(int64_t)a3;
- (void)setDetailControllerPanes:(id)a3;
- (void)setPanesRequiringNetwork:(id)a3;
- (void)setReviewDeviceAccessChapters:(id)a3;
- (void)setReviewDeviceAccessNavigationOrder:(id)a3;
- (void)setSafetyCheckChaptersWifiSync:(id)a3;
- (void)setSafetyCheckNavigationOrderWifiSync:(id)a3;
- (void)setSafetyResetChapters:(id)a3;
- (void)setSafetyResetChaptersDTO:(id)a3;
- (void)setSafetyResetNavigationOrder:(id)a3;
- (void)setSafetyResetNavigationOrderDTO:(id)a3;
- (void)setSharingActivityChapters:(id)a3;
- (void)setSharingActivityChaptersDTO:(id)a3;
- (void)setSharingActivityNavigationOrder:(id)a3;
- (void)setSharingActivityNavigationOrderDTO:(id)a3;
@end

@implementation DSNavigationManager

- (DSNavigationManager)init
{
  v109[4] = *MEMORY[0x263EF8340];
  v93.receiver = self;
  v93.super_class = (Class)DSNavigationManager;
  v2 = [(DSNavigationManager *)&v93 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.DigitalSeparation", "DSNavigationManager");
    v4 = (void *)DSLog_9;
    DSLog_9 = (uint64_t)v3;

    v109[0] = objc_opt_class();
    v109[1] = objc_opt_class();
    v109[2] = objc_opt_class();
    v109[3] = objc_opt_class();
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:4];
    panesRequiringNetwork = v2->_panesRequiringNetwork;
    v2->_panesRequiringNetwork = (NSArray *)v5;

    v108[0] = objc_opt_class();
    v108[1] = objc_opt_class();
    v108[2] = objc_opt_class();
    v108[3] = objc_opt_class();
    v108[4] = objc_opt_class();
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:5];
    detailControllerPanes = v2->_detailControllerPanes;
    v2->_detailControllerPanes = (NSArray *)v7;

    v107[0] = objc_opt_class();
    v107[1] = objc_opt_class();
    v107[2] = objc_opt_class();
    v107[3] = objc_opt_class();
    v107[4] = objc_opt_class();
    v107[5] = objc_opt_class();
    v107[6] = objc_opt_class();
    v107[7] = objc_opt_class();
    uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:8];
    safetyResetNavigationOrder = v2->_safetyResetNavigationOrder;
    v2->_safetyResetNavigationOrder = (NSArray *)v9;

    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    v105[0] = v12;
    v106[0] = &unk_26E91FB90;
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    v105[1] = v14;
    v106[1] = &unk_26E91FBA8;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v105[2] = v16;
    v106[2] = &unk_26E91FBC0;
    uint64_t v17 = [NSDictionary dictionaryWithObjects:v106 forKeys:v105 count:3];
    safetyResetChapters = v2->_safetyResetChapters;
    v2->_safetyResetChapters = (NSDictionary *)v17;

    v104[0] = objc_opt_class();
    v104[1] = objc_opt_class();
    v104[2] = objc_opt_class();
    v104[3] = objc_opt_class();
    v104[4] = objc_opt_class();
    v104[5] = objc_opt_class();
    v104[6] = objc_opt_class();
    v104[7] = objc_opt_class();
    v104[8] = objc_opt_class();
    v104[9] = objc_opt_class();
    v104[10] = objc_opt_class();
    v104[11] = objc_opt_class();
    v104[12] = objc_opt_class();
    v104[13] = objc_opt_class();
    v104[14] = objc_opt_class();
    v104[15] = objc_opt_class();
    uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:16];
    sharingActivityNavigationOrder = v2->_sharingActivityNavigationOrder;
    v2->_sharingActivityNavigationOrder = (NSArray *)v19;

    v21 = (objc_class *)objc_opt_class();
    v91 = NSStringFromClass(v21);
    v102[0] = v91;
    v103[0] = &unk_26E91FB90;
    v22 = (objc_class *)objc_opt_class();
    v89 = NSStringFromClass(v22);
    v102[1] = v89;
    v103[1] = &unk_26E91FB90;
    v23 = (objc_class *)objc_opt_class();
    v87 = NSStringFromClass(v23);
    v102[2] = v87;
    v103[2] = &unk_26E91FBA8;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v102[3] = v25;
    v103[3] = &unk_26E91FBC0;
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v102[4] = v27;
    v103[4] = &unk_26E91FBC0;
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v102[5] = v29;
    v103[5] = &unk_26E91FBC0;
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v102[6] = v31;
    v103[6] = &unk_26E91FBC0;
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    v102[7] = v33;
    v103[7] = &unk_26E91FBC0;
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    v102[8] = v35;
    v103[8] = &unk_26E91FBC0;
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v102[9] = v37;
    v103[9] = &unk_26E91FBC0;
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    v102[10] = v39;
    v103[10] = &unk_26E91FBC0;
    uint64_t v40 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:11];
    sharingActivityChapters = v2->_sharingActivityChapters;
    v2->_sharingActivityChapters = (NSDictionary *)v40;

    v101[0] = objc_opt_class();
    v101[1] = objc_opt_class();
    v101[2] = objc_opt_class();
    v101[3] = objc_opt_class();
    v101[4] = objc_opt_class();
    v101[5] = objc_opt_class();
    v101[6] = objc_opt_class();
    v101[7] = objc_opt_class();
    uint64_t v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v101 count:8];
    safetyResetNavigationOrderDTO = v2->_safetyResetNavigationOrderDTO;
    v2->_safetyResetNavigationOrderDTO = (NSArray *)v42;

    v44 = (objc_class *)objc_opt_class();
    v45 = NSStringFromClass(v44);
    v99[0] = v45;
    v100[0] = &unk_26E91FB90;
    v46 = (objc_class *)objc_opt_class();
    v47 = NSStringFromClass(v46);
    v99[1] = v47;
    v100[1] = &unk_26E91FBA8;
    v48 = (objc_class *)objc_opt_class();
    v49 = NSStringFromClass(v48);
    v99[2] = v49;
    v100[2] = &unk_26E91FBA8;
    v50 = (objc_class *)objc_opt_class();
    v51 = NSStringFromClass(v50);
    v99[3] = v51;
    v100[3] = &unk_26E91FBC0;
    v52 = (objc_class *)objc_opt_class();
    v53 = NSStringFromClass(v52);
    v99[4] = v53;
    v100[4] = &unk_26E91FBC0;
    uint64_t v54 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:5];
    safetyResetChaptersDTO = v2->_safetyResetChaptersDTO;
    v2->_safetyResetChaptersDTO = (NSDictionary *)v54;

    v98[0] = objc_opt_class();
    v98[1] = objc_opt_class();
    v98[2] = objc_opt_class();
    v98[3] = objc_opt_class();
    v98[4] = objc_opt_class();
    v98[5] = objc_opt_class();
    v98[6] = objc_opt_class();
    v98[7] = objc_opt_class();
    v98[8] = objc_opt_class();
    v98[9] = objc_opt_class();
    v98[10] = objc_opt_class();
    v98[11] = objc_opt_class();
    v98[12] = objc_opt_class();
    v98[13] = objc_opt_class();
    v98[14] = objc_opt_class();
    v98[15] = objc_opt_class();
    uint64_t v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:16];
    sharingActivityNavigationOrderDTO = v2->_sharingActivityNavigationOrderDTO;
    v2->_sharingActivityNavigationOrderDTO = (NSArray *)v56;

    v58 = (objc_class *)objc_opt_class();
    v92 = NSStringFromClass(v58);
    v96[0] = v92;
    v97[0] = &unk_26E91FB90;
    v59 = (objc_class *)objc_opt_class();
    v90 = NSStringFromClass(v59);
    v96[1] = v90;
    v97[1] = &unk_26E91FB90;
    v60 = (objc_class *)objc_opt_class();
    v88 = NSStringFromClass(v60);
    v96[2] = v88;
    v97[2] = &unk_26E91FBA8;
    v61 = (objc_class *)objc_opt_class();
    v62 = NSStringFromClass(v61);
    v96[3] = v62;
    v97[3] = &unk_26E91FBC0;
    v63 = (objc_class *)objc_opt_class();
    v64 = NSStringFromClass(v63);
    v96[4] = v64;
    v97[4] = &unk_26E91FBC0;
    v65 = (objc_class *)objc_opt_class();
    v66 = NSStringFromClass(v65);
    v96[5] = v66;
    v97[5] = &unk_26E91FBC0;
    v67 = (objc_class *)objc_opt_class();
    v68 = NSStringFromClass(v67);
    v96[6] = v68;
    v97[6] = &unk_26E91FBC0;
    v69 = (objc_class *)objc_opt_class();
    v70 = NSStringFromClass(v69);
    v96[7] = v70;
    v97[7] = &unk_26E91FBC0;
    v71 = (objc_class *)objc_opt_class();
    v72 = NSStringFromClass(v71);
    v96[8] = v72;
    v97[8] = &unk_26E91FBC0;
    v73 = (objc_class *)objc_opt_class();
    v74 = NSStringFromClass(v73);
    v96[9] = v74;
    v97[9] = &unk_26E91FBC0;
    v75 = (objc_class *)objc_opt_class();
    v76 = NSStringFromClass(v75);
    v96[10] = v76;
    v97[10] = &unk_26E91FBC0;
    uint64_t v77 = [NSDictionary dictionaryWithObjects:v97 forKeys:v96 count:11];
    sharingActivityChaptersDTO = v2->_sharingActivityChaptersDTO;
    v2->_sharingActivityChaptersDTO = (NSDictionary *)v77;

    safetyCheckChaptersWifiSync = v2->_safetyCheckChaptersWifiSync;
    v80 = (NSDictionary *)MEMORY[0x263EFFA78];
    v2->_safetyCheckChaptersWifiSync = (NSDictionary *)MEMORY[0x263EFFA78];

    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    uint64_t v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:2];
    safetyCheckNavigationOrderWifiSync = v2->_safetyCheckNavigationOrderWifiSync;
    v2->_safetyCheckNavigationOrderWifiSync = (NSArray *)v81;

    reviewDeviceAccessChapters = v2->_reviewDeviceAccessChapters;
    v2->_reviewDeviceAccessChapters = v80;

    v94[0] = objc_opt_class();
    v94[1] = objc_opt_class();
    v94[2] = objc_opt_class();
    uint64_t v84 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:3];
    reviewDeviceAccessNavigationOrder = v2->_reviewDeviceAccessNavigationOrder;
    v2->_reviewDeviceAccessNavigationOrder = (NSArray *)v84;
  }
  return v2;
}

- (id)navigationOrderForFlowType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      v4 = [(DSNavigationManager *)self reviewDeviceAccessNavigationOrder];
      break;
    case 1:
      if ([(DSNavigationManager *)self isDTOActive]) {
        [(DSNavigationManager *)self sharingActivityNavigationOrderDTO];
      }
      else {
        [(DSNavigationManager *)self sharingActivityNavigationOrder];
      }
      goto LABEL_6;
    case 0:
      if ([(DSNavigationManager *)self isDTOActive]) {
        [(DSNavigationManager *)self safetyResetNavigationOrderDTO];
      }
      else {
        [(DSNavigationManager *)self safetyResetNavigationOrder];
      }
      v4 = LABEL_6:;
      break;
    default:
      if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_ERROR)) {
        -[DSNavigationManager navigationOrderForFlowType:]();
      }
      v4 = (void *)MEMORY[0x263EFFA68];
      break;
  }
  return v4;
}

- (id)navigationChaptersForFlowType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      v4 = [(DSNavigationManager *)self reviewDeviceAccessChapters];
      break;
    case 1:
      if ([(DSNavigationManager *)self isDTOActive]) {
        [(DSNavigationManager *)self sharingActivityChaptersDTO];
      }
      else {
        [(DSNavigationManager *)self sharingActivityChapters];
      }
      goto LABEL_6;
    case 0:
      if ([(DSNavigationManager *)self isDTOActive]) {
        [(DSNavigationManager *)self safetyResetChaptersDTO];
      }
      else {
        [(DSNavigationManager *)self safetyResetChapters];
      }
      v4 = LABEL_6:;
      break;
    default:
      if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_ERROR)) {
        -[DSNavigationManager navigationChaptersForFlowType:]();
      }
      v4 = (void *)MEMORY[0x263EFFA78];
      break;
  }
  return v4;
}

- (BOOL)shouldIngestURL:(id)a3
{
  v4 = [a3 objectForKey:@"path"];
  BOOL v5 = [v4 length]
    && ([v4 isEqualToString:@"/"] & 1) == 0
    && ([v4 isEqualToString:@"SAFETY_CHECK"] & 1) == 0
    && [(DSNavigationManager *)self startingClassForURL:v4] != 0;

  return v5;
}

- (id)deepLinkToPane:(Class)a3 inFlow:(int64_t)a4
{
  v6 = [MEMORY[0x263F089D8] stringWithString:@"settings-navigation://com.apple.Settings.PrivacyAndSecurity/SAFETY_CHECK/"];
  uint64_t v7 = v6;
  if (a4) {
    v8 = @"MANAGE_SHARING";
  }
  else {
    v8 = @"EMERGENCY_RESET";
  }
  [v6 appendString:v8];
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v9 = @"PASSCODE";
LABEL_12:
    [v7 appendString:v9];
    goto LABEL_13;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v9 = @"FACEID";
    goto LABEL_12;
  }
  if ((Class)objc_opt_class() == a3)
  {
    uint64_t v9 = @"TOUCHID";
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_ERROR)) {
    -[DSNavigationManager deepLinkToPane:inFlow:]();
  }
LABEL_13:
  return v7;
}

- (id)navigationForURL:(id)a3
{
  v4 = [a3 objectForKey:@"path"];
  int v5 = [v4 containsString:@"EMERGENCY_RESET"];
  char v6 = v5;
  uint64_t v7 = v5 ^ 1u;
  v8 = [(DSNavigationManager *)self startingClassForURL:v4];
  if (v8 == (objc_class *)objc_opt_class())
  {
    uint64_t v9 = [(DSNavigationManager *)self safetyCheckNavigationOrderWifiSync];
    v10 = [(DSNavigationManager *)self safetyCheckChaptersWifiSync];
    uint64_t v11 = 1;
    uint64_t v12 = 3;
    v13 = @"Sharing Reminder";
  }
  else if ([v4 containsString:@"DEVICE_ACCESS"])
  {
    uint64_t v9 = [(DSNavigationManager *)self restoredDeviceAccessNavigationOrder:v7];
    v10 = [(DSNavigationManager *)self navigationChaptersForFlowType:v7];
    uint64_t v11 = 0;
    uint64_t v12 = 1;
    v13 = @"Passcode Change";
  }
  else if (v8 == (objc_class *)objc_opt_class() || v8 == (objc_class *)objc_opt_class())
  {
    uint64_t v9 = [(DSNavigationManager *)self navigationOrderForFlowType:v7];
    v10 = [(DSNavigationManager *)self navigationChaptersForFlowType:v7];
    uint64_t v12 = 0;
    uint64_t v11 = 1;
    v13 = @"Apple Intelligence";
  }
  else
  {
    uint64_t v9 = [(DSNavigationManager *)self restoredDTONavigationOrder:v7 withPath:v4];
    if (v6) {
      [(DSNavigationManager *)self safetyResetChaptersDTO];
    }
    else {
    v10 = [(DSNavigationManager *)self sharingActivityChaptersDTO];
    }
    uint64_t v11 = 0;
    uint64_t v12 = 2;
    v13 = @"SDP Delay";
  }
  v14 = [[DSDeepLinkRepresentation alloc] initWithOrder:v9 orderType:v12 chapters:v10 requiresAuth:v11 flowType:v7 entrypointAnalytic:v13 path:v4];

  return v14;
}

- (id)restoredDTONavigationOrder:(int64_t)a3 withPath:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(DSNavigationManager *)self startingClassForURL:v6];
  if (v7)
  {
    v8 = v7;
    if (a3) {
      [(DSNavigationManager *)self sharingActivityNavigationOrderDTO];
    }
    else {
    v10 = [(DSNavigationManager *)self safetyResetNavigationOrderDTO];
    }
    uint64_t v11 = [v10 indexOfObject:v8];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_ERROR)) {
        -[DSNavigationManager restoredDTONavigationOrder:withPath:]();
      }
      uint64_t v9 = (void *)MEMORY[0x263EFFA68];
    }
    else
    {
      uint64_t v12 = v11;
      uint64_t v9 = objc_opt_new();
      if (v8 == (objc_class *)objc_opt_class()) {
        [v9 addObject:objc_opt_class()];
      }
      v13 = objc_msgSend(v10, "subarrayWithRange:", v12, objc_msgSend(v10, "count") - v12);
      [v9 addObjectsFromArray:v13];
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_ERROR)) {
      -[DSNavigationManager restoredDTONavigationOrder:withPath:]();
    }
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)restoredDeviceAccessNavigationOrder:(int64_t)a3
{
  os_log_t v3 = (void *)MEMORY[0x263EFF980];
  v4 = [(DSNavigationManager *)self navigationOrderForFlowType:a3];
  int v5 = [v3 arrayWithArray:v4];

  [v5 removeObject:objc_opt_class()];
  return v5;
}

- (Class)startingClassForURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 containsString:@"PASSCODE"]
    || [v3 containsString:@"FACEID"]
    || [v3 containsString:@"TOUCHID"]
    || [v3 containsString:@"apple.com"]
    || [v3 containsString:@"reminders/wifisync"]
    || [v3 containsString:@"EMERGENCY_RESET"]
    || [v3 containsString:@"MANAGE_SHARING"])
  {
    v4 = objc_opt_class();
  }
  else
  {
    id v6 = DSLog_9;
    if (os_log_type_enabled((os_log_t)DSLog_9, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_235BFC000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't parse an entry configuration from URL path: %@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return (Class)v4;
}

- (Class)topViewControllerForUnorderedClass:(Class)a3
{
  if ((Class)objc_opt_class() != a3
    && (Class)objc_opt_class() != a3
    && (Class)objc_opt_class() != a3
    && (Class)objc_opt_class() != a3)
  {
    objc_opt_class();
  }
  v4 = objc_opt_class();
  return (Class)v4;
}

- (BOOL)isDTOActive
{
  return [MEMORY[0x263F3A390] shouldShowBioRatchetFlow];
}

- (NSArray)panesRequiringNetwork
{
  return self->_panesRequiringNetwork;
}

- (void)setPanesRequiringNetwork:(id)a3
{
}

- (NSArray)detailControllerPanes
{
  return self->_detailControllerPanes;
}

- (void)setDetailControllerPanes:(id)a3
{
}

- (NSDictionary)safetyResetChapters
{
  return self->_safetyResetChapters;
}

- (void)setSafetyResetChapters:(id)a3
{
}

- (NSDictionary)sharingActivityChapters
{
  return self->_sharingActivityChapters;
}

- (void)setSharingActivityChapters:(id)a3
{
}

- (NSArray)safetyResetNavigationOrder
{
  return self->_safetyResetNavigationOrder;
}

- (void)setSafetyResetNavigationOrder:(id)a3
{
}

- (NSArray)sharingActivityNavigationOrder
{
  return self->_sharingActivityNavigationOrder;
}

- (void)setSharingActivityNavigationOrder:(id)a3
{
}

- (NSDictionary)safetyResetChaptersDTO
{
  return self->_safetyResetChaptersDTO;
}

- (void)setSafetyResetChaptersDTO:(id)a3
{
}

- (NSDictionary)sharingActivityChaptersDTO
{
  return self->_sharingActivityChaptersDTO;
}

- (void)setSharingActivityChaptersDTO:(id)a3
{
}

- (NSArray)safetyResetNavigationOrderDTO
{
  return self->_safetyResetNavigationOrderDTO;
}

- (void)setSafetyResetNavigationOrderDTO:(id)a3
{
}

- (NSArray)sharingActivityNavigationOrderDTO
{
  return self->_sharingActivityNavigationOrderDTO;
}

- (void)setSharingActivityNavigationOrderDTO:(id)a3
{
}

- (NSDictionary)safetyCheckChaptersWifiSync
{
  return self->_safetyCheckChaptersWifiSync;
}

- (void)setSafetyCheckChaptersWifiSync:(id)a3
{
}

- (NSArray)safetyCheckNavigationOrderWifiSync
{
  return self->_safetyCheckNavigationOrderWifiSync;
}

- (void)setSafetyCheckNavigationOrderWifiSync:(id)a3
{
}

- (NSDictionary)reviewDeviceAccessChapters
{
  return self->_reviewDeviceAccessChapters;
}

- (void)setReviewDeviceAccessChapters:(id)a3
{
}

- (NSArray)reviewDeviceAccessNavigationOrder
{
  return self->_reviewDeviceAccessNavigationOrder;
}

- (void)setReviewDeviceAccessNavigationOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewDeviceAccessNavigationOrder, 0);
  objc_storeStrong((id *)&self->_reviewDeviceAccessChapters, 0);
  objc_storeStrong((id *)&self->_safetyCheckNavigationOrderWifiSync, 0);
  objc_storeStrong((id *)&self->_safetyCheckChaptersWifiSync, 0);
  objc_storeStrong((id *)&self->_sharingActivityNavigationOrderDTO, 0);
  objc_storeStrong((id *)&self->_safetyResetNavigationOrderDTO, 0);
  objc_storeStrong((id *)&self->_sharingActivityChaptersDTO, 0);
  objc_storeStrong((id *)&self->_safetyResetChaptersDTO, 0);
  objc_storeStrong((id *)&self->_sharingActivityNavigationOrder, 0);
  objc_storeStrong((id *)&self->_safetyResetNavigationOrder, 0);
  objc_storeStrong((id *)&self->_sharingActivityChapters, 0);
  objc_storeStrong((id *)&self->_safetyResetChapters, 0);
  objc_storeStrong((id *)&self->_detailControllerPanes, 0);
  objc_storeStrong((id *)&self->_panesRequiringNetwork, 0);
}

- (void)navigationOrderForFlowType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error: can't determine navigation order for unexpected flow type %lu", v2, v3, v4, v5, v6);
}

- (void)navigationChaptersForFlowType:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Error: can't determine navigation chapters for unexpected flow type %lu", v2, v3, v4, v5, v6);
}

- (void)deepLinkToPane:inFlow:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Pointing to Safety Check landing page because Class %@ is not handled", v2, v3, v4, v5, v6);
}

- (void)restoredDTONavigationOrder:withPath:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_235BFC000, v0, v1, "Couldn't parse a DTO entry configuration from URL path: %@", v2, v3, v4, v5, v6);
}

- (void)restoredDTONavigationOrder:withPath:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_235BFC000, v1, OS_LOG_TYPE_ERROR, "Current pane type: %@ not found in DTO navigation order: %@", v2, 0x16u);
}

@end