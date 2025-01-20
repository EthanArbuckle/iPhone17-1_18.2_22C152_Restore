@interface CKUploadRequestManagerStateMachine
+ (id)nameFromFunction:(int64_t)a3;
+ (id)nameFromResponseAction:(int64_t)a3;
+ (id)nameFromState:(int64_t)a3;
+ (id)nameFromStateEvent:(int64_t)a3;
- (BOOL)canPerformFunction:(int64_t)a3;
- (CKUploadRequestManagerStateMachine)initWithActionHandler:(id)a3;
- (CUStateEvent)eventCausingTransition;
- (CUStateMachine)stateMachine;
- (id)actionHandler;
- (id)createStateMachine;
- (id)enterStateHandler;
- (id)eventHandlerForState:(id)a3 withEnterBlock:(id)a4 exitBlock:(id)a5 eventBlock:(id)a6;
- (id)exitStateHandler;
- (id)internalActionHandler;
- (void)dealloc;
- (void)dispatchEvent:(int64_t)a3;
- (void)dispatchEvent:(int64_t)a3 userInfo:(id)a4;
- (void)setActionHandler:(id)a3;
- (void)setEnterStateHandler:(id)a3;
- (void)setEventCausingTransition:(id)a3;
- (void)setExitStateHandler:(id)a3;
- (void)setInternalActionHandler:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)start;
- (void)transitionToState:(id)a3 withEvent:(id)a4;
@end

@implementation CKUploadRequestManagerStateMachine

- (id)createStateMachine
{
  v171[12] = *MEMORY[0x1E4F143B8];
  id v110 = objc_alloc_init(MEMORY[0x1E4F5E1E8]);
  id v3 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v5 = objc_msgSend_initWithName_parent_(v3, v4, @"Global", 0);
  id v6 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  uint64_t v8 = objc_msgSend_initWithName_parent_(v6, v7, @"Root Unregistered", (uint64_t)v5);
  id v9 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v11 = objc_msgSend_initWithName_parent_(v9, v10, @"Initial", v8);
  id v12 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v112 = (void *)v8;
  v14 = objc_msgSend_initWithName_parent_(v12, v13, @"Cleared", v8);
  id v15 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v17 = objc_msgSend_initWithName_parent_(v15, v16, @"Root Registered", (uint64_t)v5);
  id v18 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v20 = objc_msgSend_initWithName_parent_(v18, v19, @"Fetching Initial Data", (uint64_t)v17);
  id v21 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v23 = objc_msgSend_initWithName_parent_(v21, v22, @"Root Initialized", (uint64_t)v17);
  id v24 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v107 = objc_msgSend_initWithName_parent_(v24, v25, @"Fetching Account ID", (uint64_t)v23);
  id v26 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v28 = objc_msgSend_initWithName_parent_(v26, v27, @"System Not Ready", (uint64_t)v23);
  id v29 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v31 = objc_msgSend_initWithName_parent_(v29, v30, @"Root Ready", (uint64_t)v23);
  id v32 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v105 = objc_msgSend_initWithName_parent_(v32, v33, @"Pending Repair", (uint64_t)v31);
  id v34 = objc_alloc(MEMORY[0x1E4F5E1D8]);
  v104 = objc_msgSend_initWithName_parent_(v34, v35, @"Repairing", (uint64_t)v31);
  v111 = v5;
  v37 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v36, (uint64_t)v5, (uint64_t)&unk_1ED7EF2D8, &unk_1ED7F0298, &unk_1ED7F0378);
  objc_msgSend_setEventHandler_(v5, v38, (uint64_t)v37, v39);

  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = sub_18B0F0738;
  v169[3] = &unk_1E54643F8;
  id v40 = v20;
  id v170 = v40;
  v42 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v41, (uint64_t)v112, (uint64_t)&unk_1ED7F04F8, &unk_1ED7F05B8, v169);
  objc_msgSend_setEventHandler_(v112, v43, (uint64_t)v42, v44);

  v167[0] = MEMORY[0x1E4F143A8];
  v167[1] = 3221225472;
  v167[2] = sub_18B0F0834;
  v167[3] = &unk_1E54643F8;
  id v45 = v14;
  id v168 = v45;
  v47 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v46, (uint64_t)v11, (uint64_t)&unk_1ED7F06D8, &unk_1ED7F07B8, v167);
  objc_msgSend_setEventHandler_(v11, v48, (uint64_t)v47, v49);

  v51 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v50, (uint64_t)v45, (uint64_t)&unk_1ED7F0858, &unk_1ED7F08F8, &unk_1ED7F0958);
  objc_msgSend_setEventHandler_(v45, v52, (uint64_t)v51, v53);

  v164[0] = MEMORY[0x1E4F143A8];
  v164[1] = 3221225472;
  v164[2] = sub_18B0F09B8;
  v164[3] = &unk_1E5464420;
  id v109 = v11;
  id v165 = v109;
  id v54 = v45;
  id v166 = v54;
  v56 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v55, (uint64_t)v17, (uint64_t)&unk_1ED7F0998, &unk_1ED7F09B8, v164);
  objc_msgSend_setEventHandler_(v17, v57, (uint64_t)v56, v58);

  v162[0] = 0;
  v162[1] = v162;
  v162[2] = 0x2020000000;
  char v163 = 0;
  v160[0] = 0;
  v160[1] = v160;
  v160[2] = 0x2020000000;
  char v161 = 0;
  v158[0] = 0;
  v158[1] = v158;
  v158[2] = 0x2020000000;
  char v159 = 0;
  v156[0] = 0;
  v156[1] = v156;
  v156[2] = 0x2020000000;
  char v157 = 0;
  v154[0] = 0;
  v154[1] = v154;
  v154[2] = 0x2020000000;
  char v155 = 0;
  v153[0] = MEMORY[0x1E4F143A8];
  v153[1] = 3221225472;
  v153[2] = sub_18B0F0AF8;
  v153[3] = &unk_1E5464448;
  v153[4] = v162;
  v153[5] = v160;
  v153[6] = v158;
  v153[7] = v156;
  v153[8] = v154;
  v145[0] = MEMORY[0x1E4F143A8];
  v145[1] = 3221225472;
  v145[2] = sub_18B0F0BB4;
  v145[3] = &unk_1E5464470;
  v148 = v162;
  v149 = v160;
  v150 = v158;
  v151 = v156;
  v152 = v154;
  id v59 = v107;
  id v146 = v59;
  id v60 = v28;
  id v147 = v60;
  v62 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v61, (uint64_t)v40, (uint64_t)v153, &unk_1ED7F09D8, v145);
  objc_msgSend_setEventHandler_(v40, v63, (uint64_t)v62, v64);

  v143[0] = 0;
  v143[1] = v143;
  v143[2] = 0x2020000000;
  char v144 = 0;
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = sub_18B0F0FC4;
  v142[3] = &unk_1E5464498;
  v142[4] = v143;
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = sub_18B0F1060;
  v141[3] = &unk_1E5464498;
  v141[4] = v143;
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = sub_18B0F1118;
  v136[3] = &unk_1E54644C0;
  v140 = v143;
  id v108 = v40;
  id v137 = v108;
  id v65 = v60;
  id v138 = v65;
  id v106 = v54;
  id v139 = v106;
  v67 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v66, (uint64_t)v23, (uint64_t)v142, v141, v136);
  objc_msgSend_setEventHandler_(v23, v68, (uint64_t)v67, v69);

  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = sub_18B0F1594;
  v133[3] = &unk_1E5464420;
  id v70 = v65;
  id v134 = v70;
  id v71 = v105;
  id v135 = v71;
  v73 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v72, (uint64_t)v59, (uint64_t)&unk_1ED7F0A18, &unk_1ED7F0A78, v133);
  objc_msgSend_setEventHandler_(v59, v74, (uint64_t)v73, v75);

  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  char v132 = 0;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x2020000000;
  char v130 = 0;
  v125[0] = MEMORY[0x1E4F143A8];
  v125[1] = 3221225472;
  v125[2] = sub_18B0F1790;
  v125[3] = &unk_1E54644E8;
  v127 = v129;
  v128 = v131;
  id v76 = v59;
  id v126 = v76;
  v78 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v77, (uint64_t)v70, (uint64_t)&unk_1ED7F0AD8, &unk_1ED7F0B18, v125);
  objc_msgSend_setEventHandler_(v70, v79, (uint64_t)v78, v80);

  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = sub_18B0F1A84;
  v122[3] = &unk_1E5464420;
  id v81 = v70;
  id v123 = v81;
  id v82 = v71;
  id v124 = v82;
  v84 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v83, (uint64_t)v31, (uint64_t)&unk_1ED7F0B38, &unk_1ED7F0B78, v122);
  objc_msgSend_setEventHandler_(v31, v85, (uint64_t)v84, v86);

  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = sub_18B0F1DA0;
  v120[3] = &unk_1E54643F8;
  id v87 = v104;
  id v121 = v87;
  v89 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v88, (uint64_t)v82, (uint64_t)&unk_1ED7F0BB8, &unk_1ED7F0BF8, v120);
  objc_msgSend_setEventHandler_(v82, v90, (uint64_t)v89, v91);

  v118[0] = 0;
  v118[1] = v118;
  v118[2] = 0x2020000000;
  char v119 = 0;
  v116[4] = v118;
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = sub_18B0F1F80;
  v117[3] = &unk_1E5464498;
  v117[4] = v118;
  v115 = v118;
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = sub_18B0F2004;
  v116[3] = &unk_1E5464498;
  v113[0] = MEMORY[0x1E4F143A8];
  v113[1] = 3221225472;
  v113[2] = sub_18B0F20B4;
  v113[3] = &unk_1E5464510;
  id v92 = v82;
  id v114 = v92;
  v94 = objc_msgSend_eventHandlerForState_withEnterBlock_exitBlock_eventBlock_(self, v93, (uint64_t)v87, (uint64_t)v117, v116, v113);
  objc_msgSend_setEventHandler_(v87, v95, (uint64_t)v94, v96);

  _Block_object_dispose(v118, 8);
  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);

  _Block_object_dispose(v143, 8);
  _Block_object_dispose(v154, 8);
  _Block_object_dispose(v156, 8);
  _Block_object_dispose(v158, 8);
  _Block_object_dispose(v160, 8);
  _Block_object_dispose(v162, 8);
  v171[0] = v111;
  v171[1] = v112;
  v171[2] = v109;
  v171[3] = v106;
  v171[4] = v17;
  v171[5] = v108;
  v171[6] = v23;
  v171[7] = v76;
  v171[8] = v81;
  v171[9] = v31;
  v171[10] = v92;
  v171[11] = v87;
  v98 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v97, (uint64_t)v171, 12);
  objc_msgSend_setStates_(v110, v99, (uint64_t)v98, v100);

  objc_msgSend_setInitialState_(v110, v101, (uint64_t)v109, v102);

  return v110;
}

+ (id)nameFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E54645A0[a3];
  }
}

+ (id)nameFromFunction:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E54645C0[a3];
  }
}

+ (id)nameFromStateEvent:(int64_t)a3
{
  if ((unint64_t)a3 > 0x12) {
    return @"Unknown";
  }
  else {
    return off_1E54645D8[a3];
  }
}

+ (id)nameFromResponseAction:(int64_t)a3
{
  if ((unint64_t)a3 > 0x1C) {
    return @"Unknown";
  }
  else {
    return off_1E5464670[a3];
  }
}

- (void)dealloc
{
  objc_msgSend_invalidate(self->_stateMachine, a2, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)CKUploadRequestManagerStateMachine;
  [(CKUploadRequestManagerStateMachine *)&v5 dealloc];
}

- (CKUploadRequestManagerStateMachine)initWithActionHandler:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKUploadRequestManagerStateMachine;
  uint64_t v8 = [(CKUploadRequestManagerStateMachine *)&v17 init];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_copy(v4, v5, v6, v7);
    id actionHandler = v8->_actionHandler;
    v8->_id actionHandler = (id)v9;

    uint64_t v14 = objc_msgSend_createStateMachine(v8, v11, v12, v13);
    stateMachine = v8->_stateMachine;
    v8->_stateMachine = (CUStateMachine *)v14;
  }
  return v8;
}

- (void)start
{
  objc_msgSend_stateMachine(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_start(v7, v4, v5, v6);
}

- (void)dispatchEvent:(int64_t)a3
{
}

- (void)dispatchEvent:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v6 = objc_msgSend_mutableCopy(a4, a2, a3, (uint64_t)a4);
  v10 = v6;
  if (v6)
  {
    id v11 = v6;
  }
  else
  {
    objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v7, v8, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v33 = v11;

  id v15 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v12, v13, v14);
  v19 = objc_msgSend_UUIDString(v15, v16, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v33, v20, (uint64_t)v19, @"uuid");

  id v21 = objc_alloc(MEMORY[0x1E4F5E1E0]);
  id v24 = objc_msgSend_nameFromStateEvent_(CKUploadRequestManagerStateMachine, v22, a3, v23);
  id v26 = objc_msgSend_initWithName_userInfo_(v21, v25, (uint64_t)v24, (uint64_t)v33);

  v30 = objc_msgSend_stateMachine(self, v27, v28, v29);
  objc_msgSend_dispatchEvent_(v30, v31, (uint64_t)v26, v32);
}

- (BOOL)canPerformFunction:(int64_t)a3
{
  id v4 = self;
  v24[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_18B0F27B0;
  v16[3] = &unk_1E5464538;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a3;
  v16[4] = &v18;
  objc_msgSend_setInternalActionHandler_(v4, v5, (uint64_t)v16, v6);
  uint64_t v23 = @"function";
  uint64_t v9 = objc_msgSend_numberWithInteger_(NSNumber, v7, a3, v8);
  v24[0] = v9;
  id v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v10, (uint64_t)v24, (uint64_t)&v23, 1);
  objc_msgSend_dispatchEvent_userInfo_(v4, v12, 18, (uint64_t)v11);

  objc_msgSend_setInternalActionHandler_(v4, v13, 0, v14);
  LOBYTE(v4) = *((unsigned char *)v19 + 24) != 0;
  objc_destroyWeak(v17);
  _Block_object_dispose(&v18, 8);
  objc_destroyWeak(&location);
  return (char)v4;
}

- (id)eventHandlerForState:(id)a3 withEnterBlock:(id)a4 exitBlock:(id)a5 eventBlock:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  objc_initWeak(&location, self);
  objc_initWeak(&from, v13);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18B0F2A88;
  aBlock[3] = &unk_1E5463288;
  objc_copyWeak(&v30, &location);
  uint64_t v14 = _Block_copy(aBlock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_18B0F2C60;
  v22[3] = &unk_1E5464580;
  objc_copyWeak(&v27, &location);
  objc_copyWeak(&v28, &from);
  id v23 = v10;
  id v24 = v14;
  id v25 = v11;
  id v26 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v14;
  id v18 = v10;
  v19 = _Block_copy(v22);
  uint64_t v20 = _Block_copy(v19);

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v20;
}

- (void)transitionToState:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  if (a4) {
    objc_msgSend_setEventCausingTransition_(self, v6, (uint64_t)a4, v7);
  }
  else {
    objc_msgSend_setEventCausingTransition_(self, v6, 0, v7);
  }
  objc_msgSend_stateMachine(self, v9, v10, v11);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transitionToState_(v14, v12, (uint64_t)v8, v13);
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (id)enterStateHandler
{
  return self->_enterStateHandler;
}

- (void)setEnterStateHandler:(id)a3
{
}

- (id)exitStateHandler
{
  return self->_exitStateHandler;
}

- (void)setExitStateHandler:(id)a3
{
}

- (CUStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (CUStateEvent)eventCausingTransition
{
  return self->_eventCausingTransition;
}

- (void)setEventCausingTransition:(id)a3
{
}

- (id)internalActionHandler
{
  return self->_internalActionHandler;
}

- (void)setInternalActionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internalActionHandler, 0);
  objc_storeStrong((id *)&self->_eventCausingTransition, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong(&self->_exitStateHandler, 0);
  objc_storeStrong(&self->_enterStateHandler, 0);

  objc_storeStrong(&self->_actionHandler, 0);
}

@end