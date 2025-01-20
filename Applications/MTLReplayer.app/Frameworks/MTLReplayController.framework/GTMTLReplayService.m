@interface GTMTLReplayService
- (BOOL)cancel:(unint64_t)a3;
- (BOOL)load:(id)a3 error:(id *)a4;
- (BOOL)pause:(unint64_t)a3;
- (BOOL)resume:(unint64_t)a3;
- (GTMTLReplayService)initWithContext:(GTMTLReplayClient *)a3;
- (id)decode:(id)a3;
- (id)fetch:(id)a3;
- (id)profile:(id)a3;
- (id)query:(id)a3;
- (id)raytrace:(id)a3;
- (id)shaderdebug:(id)a3;
- (id)update:(id)a3;
- (unint64_t)registerObserver:(id)a3;
- (void)broadcastDisconnect:(id)a3 path:(id)a4;
- (void)deregisterObserver:(unint64_t)a3;
- (void)deregisterObserversForConnection:(id)a3 path:(id)a4;
- (void)display:(id)a3;
- (void)notifyError:(id)a3;
- (void)terminateProcess;
@end

@implementation GTMTLReplayService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_terminateConnection, 0);
  objc_storeStrong((id *)&self->_terminatePath, 0);

  objc_storeStrong((id *)&self->_gputrace, 0);
}

- (id)raytrace:(id)a3
{
  clientContext = self->_clientContext;
  id v4 = a3;
  v5 = [v4 streamHandler];
  id v6 = [v4 dispatchUID];
  id v7 = [v4 streamRef];
  id v8 = [v4 requestID];

  id var0 = clientContext->var7.var0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = __31__GTMTLReplayService_raytrace___block_invoke;
  v12[3] = &unk_744DD0;
  id v15 = v6;
  id v16 = v8;
  id v13 = v5;
  v14 = clientContext;
  id v17 = v7;
  id v10 = v5;
  [var0 addOperationWithBlock:v12];

  return 0;
}

void __31__GTMTLReplayService_raytrace___block_invoke(uint64_t a1)
{
  GTMTLReplayController_debugSubCommandStop(*(void *)(*(void *)(a1 + 40) + 8), *(_DWORD *)(a1 + 48), 0);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  id v4 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __31__GTMTLReplayService_raytrace___block_invoke_2;
  v14[3] = &unk_744D80;
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 56);
  uint64_t v17 = v5;
  id v15 = v6;
  uint64_t v7 = *(void *)(a1 + 64);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __31__GTMTLReplayService_raytrace___block_invoke_3;
  v10[3] = &unk_744DA8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v11 = v8;
  uint64_t v12 = v9;
  uint64_t v13 = *(void *)(a1 + 56);
  +[GTAccelerationStructureServerSession sessionWithReplayClient:v2 functionIndex:v3 requestID:v4 transport:0 dataHandler:v14 accelerationStructureKey:v7 completionHandler:v10];
}

void __31__GTMTLReplayService_raytrace___block_invoke_2(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v19 = a3;
  id v6 = a4;
  uint64_t Operation = GTCoreOperationControl_getOperation(a1[5]);
  if (Operation && *(unsigned char *)(Operation + 24))
  {
    uint64_t v8 = *(void *)(a1[6] + 8);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v8 + 48), 0xFFFFFFFFFFFFFFFFLL);
    if (GTCoreOperationControl_getOperation(a1[5]))
    {
      id v10 = *(void **)(v8 + 56);
      id v11 = +[NSNumber numberWithUnsignedLongLong:a1[5]];
      [v10 removeObjectForKey:v11];

      GTCoreOperationControl_removeOperation(a1[5]);
      uint64_t v12 = a1[4];
      id v13 = [objc_alloc((Class)GTReplayResponseStream) initWithState:2];
      (*(void (**)(uint64_t, id))(v12 + 16))(v12, v13);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v8 + 48));
  }
  else
  {
    v14 = objc_opt_new();
    [v14 setData:v19];
    if (v6)
    {
      id v15 = [v6 domain];
      id v16 = [v6 code];
      uint64_t v17 = [v6 userInfo];
      v18 = +[NSError errorWithDomain:v15 code:v16 userInfo:v17];
      [v14 setError:v18];
    }
    else
    {
      [v14 setError:0];
    }
    (*(void (**)(void))(a1[4] + 16))();
  }
}

void __31__GTMTLReplayService_raytrace___block_invoke_3(void *a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15)
  {
    uint64_t v6 = *(void *)(a1[5] + 8);
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v6 + 48), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v7 = *(void **)(v6 + 56);
    uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:a1[6]];
    [v7 setObject:v15 forKey:v8];

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 48));
    [v15 setSessionID:a1[6]];
    GTCoreOperationControl_addOperation(a1[6]);
    uint64_t v9 = a1[4];
    id v10 = [objc_alloc((Class)GTReplayResponseStream) initWithState:1];
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
  }
  else
  {
    id v10 = [objc_alloc((Class)GTReplayResponseStream) initWithState:2];
    if (v5)
    {
      id v11 = [v5 domain];
      id v12 = [v5 code];
      id v13 = [v5 userInfo];
      v14 = +[NSError errorWithDomain:v11 code:v12 userInfo:v13];
      [v10 setError:v14];
    }
    (*(void (**)(void, id))(a1[4] + 16))(a1[4], v10);
  }
}

- (id)shaderdebug:(id)a3
{
  id v4 = a3;
  clientContext = self->_clientContext;
  id var0 = clientContext->var7.var0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __34__GTMTLReplayService_shaderdebug___block_invoke;
  v9[3] = &unk_7463C0;
  id v10 = v4;
  id v11 = clientContext;
  id v7 = v4;
  [var0 addOperationWithBlock:v9];

  return 0;
}

void __34__GTMTLReplayService_shaderdebug___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 32);
    id v3 = v2;
    v147[0] = &off_759900;
    v146[0] = @"Type";
    v146[1] = @"MinPositionX";
    if (v2)
    {
      [v2 minThreadPositionInGrid];
      uint64_t v4 = v131;
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v132 = 0;
      uint64_t v131 = 0;
      uint64_t v133 = 0;
    }
    id v7 = +[NSNumber numberWithUnsignedLongLong:v4];
    v147[1] = v7;
    v146[2] = @"MinPositionY";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v9 = v129;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v129 = 0;
      uint64_t v128 = 0;
      uint64_t v130 = 0;
    }
    id v10 = +[NSNumber numberWithUnsignedLongLong:v9];
    v147[2] = v10;
    v146[3] = @"MinPositionZ";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v11 = v127;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v126 = 0;
      uint64_t v125 = 0;
      uint64_t v127 = 0;
    }
    id v12 = +[NSNumber numberWithUnsignedLongLong:v11];
    v147[3] = v12;
    v146[4] = @"MaxPositionX";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v13 = v122;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
    }
    v14 = +[NSNumber numberWithUnsignedLongLong:v13];
    v147[4] = v14;
    v146[5] = @"MaxPositionY";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v15 = v120;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v119 = 0;
      uint64_t v120 = 0;
      uint64_t v121 = 0;
    }
    id v16 = +[NSNumber numberWithUnsignedLongLong:v15];
    v147[5] = v16;
    v146[6] = @"MaxPositionZ";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v17 = v118;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v116 = 0;
      uint64_t v117 = 0;
      uint64_t v118 = 0;
    }
    v18 = +[NSNumber numberWithUnsignedLongLong:v17];
    v147[6] = v18;
    id v19 = v147;
    v20 = v146;
LABEL_46:
    v30 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v20 count:7];
LABEL_47:

LABEL_48:
    goto LABEL_49;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(id *)(a1 + 32);
    id v3 = v5;
    v145[0] = &off_759918;
    v144[0] = @"Type";
    v144[1] = @"MinPositionX";
    if (v5)
    {
      [v5 minThreadPositionInGrid];
      uint64_t v6 = v113;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v113 = 0;
      uint64_t v114 = 0;
      uint64_t v115 = 0;
    }
    id v7 = +[NSNumber numberWithUnsignedLongLong:v6];
    v145[1] = v7;
    v144[2] = @"MinPositionY";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v25 = v111;
    }
    else
    {
      uint64_t v25 = 0;
      uint64_t v110 = 0;
      uint64_t v111 = 0;
      uint64_t v112 = 0;
    }
    id v10 = +[NSNumber numberWithUnsignedLongLong:v25];
    v145[2] = v10;
    v144[3] = @"MinPositionZ";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v26 = v109;
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v107 = 0;
      uint64_t v108 = 0;
      uint64_t v109 = 0;
    }
    id v12 = +[NSNumber numberWithUnsignedLongLong:v26];
    v145[3] = v12;
    v144[4] = @"MaxPositionX";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v27 = v104;
    }
    else
    {
      uint64_t v27 = 0;
      uint64_t v104 = 0;
      uint64_t v105 = 0;
      uint64_t v106 = 0;
    }
    v14 = +[NSNumber numberWithUnsignedLongLong:v27];
    v145[4] = v14;
    v144[5] = @"MaxPositionY";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v28 = v102;
    }
    else
    {
      uint64_t v28 = 0;
      uint64_t v101 = 0;
      uint64_t v102 = 0;
      uint64_t v103 = 0;
    }
    id v16 = +[NSNumber numberWithUnsignedLongLong:v28];
    v145[5] = v16;
    v144[6] = @"MaxPositionZ";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v29 = v100;
    }
    else
    {
      uint64_t v29 = 0;
      uint64_t v98 = 0;
      uint64_t v99 = 0;
      uint64_t v100 = 0;
    }
    v18 = +[NSNumber numberWithUnsignedLongLong:v29];
    v145[6] = v18;
    id v19 = v145;
    v20 = v144;
    goto LABEL_46;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(id *)(a1 + 32);
    v143[0] = &off_759930;
    v142[0] = @"Type";
    v142[1] = @"AmplificationID";
    id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 amplificationID]);
    v143[1] = v7;
    v142[2] = @"MinPositionX";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v8 = v95;
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v95 = 0;
      uint64_t v96 = 0;
      uint64_t v97 = 0;
    }
    id v10 = +[NSNumber numberWithUnsignedLongLong:v8];
    v143[2] = v10;
    v142[3] = @"MinPositionY";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v52 = v93;
    }
    else
    {
      uint64_t v52 = 0;
      uint64_t v92 = 0;
      uint64_t v93 = 0;
      uint64_t v94 = 0;
    }
    id v12 = +[NSNumber numberWithUnsignedLongLong:v52];
    v143[3] = v12;
    v142[4] = @"MinPositionZ";
    if (v3)
    {
      [v3 minThreadPositionInGrid];
      uint64_t v53 = v91;
    }
    else
    {
      uint64_t v53 = 0;
      uint64_t v89 = 0;
      uint64_t v90 = 0;
      uint64_t v91 = 0;
    }
    v70 = +[NSNumber numberWithUnsignedLongLong:v53];
    v143[4] = v70;
    v142[5] = @"MaxPositionX";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v54 = v86;
    }
    else
    {
      uint64_t v54 = 0;
      uint64_t v86 = 0;
      uint64_t v87 = 0;
      uint64_t v88 = 0;
    }
    v69 = +[NSNumber numberWithUnsignedLongLong:v54];
    v143[5] = v69;
    v142[6] = @"MaxPositionY";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v55 = v84;
    }
    else
    {
      uint64_t v55 = 0;
      uint64_t v83 = 0;
      uint64_t v84 = 0;
      uint64_t v85 = 0;
    }
    v68 = +[NSNumber numberWithUnsignedLongLong:v55];
    v143[6] = v68;
    v142[7] = @"MaxPositionZ";
    if (v3)
    {
      [v3 maxThreadPositionInGrid];
      uint64_t v56 = v82;
    }
    else
    {
      uint64_t v56 = 0;
      uint64_t v80 = 0;
      uint64_t v81 = 0;
      uint64_t v82 = 0;
    }
    v57 = +[NSNumber numberWithUnsignedLongLong:v56];
    v143[7] = v57;
    v142[8] = @"ObjectThreadgroupPosX";
    if (v3)
    {
      [v3 objectThreadgroupPositionInGrid];
      uint64_t v58 = v77;
    }
    else
    {
      uint64_t v58 = 0;
      uint64_t v77 = 0;
      uint64_t v78 = 0;
      uint64_t v79 = 0;
    }
    v59 = +[NSNumber numberWithUnsignedLongLong:v58];
    v143[8] = v59;
    v142[9] = @"ObjectThreadgroupPosY";
    if (v3)
    {
      [v3 objectThreadgroupPositionInGrid];
      uint64_t v60 = v75;
    }
    else
    {
      uint64_t v60 = 0;
      uint64_t v74 = 0;
      uint64_t v75 = 0;
      uint64_t v76 = 0;
    }
    v61 = +[NSNumber numberWithUnsignedLongLong:v60];
    v143[9] = v61;
    v142[10] = @"ObjectThreadgroupPosZ";
    if (v3)
    {
      [v3 objectThreadgroupPositionInGrid];
      uint64_t v62 = v73;
    }
    else
    {
      uint64_t v62 = 0;
      v72[1] = 0;
      v72[2] = 0;
      uint64_t v73 = 0;
    }
    v63 = +[NSNumber numberWithUnsignedLongLong:v62];
    v143[10] = v63;
    v30 = +[NSDictionary dictionaryWithObjects:v143 forKeys:v142 count:11];

    goto LABEL_48;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v22 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v141[0] = &off_759888;
    v140[0] = @"Type";
    v140[1] = @"InstanceID";
    id v3 = v22;
    id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 instanceID]);
    v141[1] = v7;
    v140[2] = @"AmplificationID";
    id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 amplificationID]);
    v141[2] = v10;
    v140[3] = @"VertexIDs";
    id v12 = [v3 vertexIDs];
    v141[3] = v12;
    v23 = v141;
    v24 = v140;
LABEL_58:
    v30 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:4];
    goto LABEL_48;
  }
  objc_opt_class();
  char v50 = objc_opt_isKindOfClass();
  v51 = *(void **)(a1 + 32);
  if (v50)
  {
    v139[0] = &off_759948;
    v138[0] = @"Type";
    v138[1] = @"InstanceID";
    id v3 = v51;
    id v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 instanceID]);
    v139[1] = v7;
    v138[2] = @"AmplificationID";
    id v10 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 amplificationID]);
    v139[2] = v10;
    v138[3] = @"PatchIDs";
    id v12 = [v3 patchIDs];
    v139[3] = v12;
    v23 = v139;
    v24 = v138;
    goto LABEL_58;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v64 = *(void **)(a1 + 32);
    v137[0] = &off_759870;
    v136[0] = @"Type";
    v136[1] = @"MinPositionX";
    id v3 = v64;
    id v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 minPixelPosition]);
    v137[1] = v7;
    v136[2] = @"MinPositionY";
    [v3 minPixelPosition];
    id v10 = +[NSNumber numberWithUnsignedLongLong:v65];
    v137[2] = v10;
    v136[3] = @"MaxPositionX";
    id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v3 maxPixelPosition]);
    v137[3] = v12;
    v136[4] = @"MaxPositionY";
    [v3 maxPixelPosition];
    v14 = +[NSNumber numberWithUnsignedLongLong:v66];
    v137[4] = v14;
    v136[5] = @"MinSampleID";
    id v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 minSampleID]);
    v137[5] = v16;
    v136[6] = @"MaxSampleID";
    v18 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 maxSampleID]);
    v137[6] = v18;
    v136[7] = @"RenderTargetArrayIndex";
    v67 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v3 renderTargetArrayIndex]);
    v137[7] = v67;
    v30 = +[NSDictionary dictionaryWithObjects:v137 forKeys:v136 count:8];

    goto LABEL_47;
  }
  v30 = 0;
LABEL_49:
  id v31 = objc_alloc_init((Class)GTReplayResponse);
  [v31 setRequestID:[*(id *)(a1 + 32) requestID]];
  if (v30)
  {
    uint64_t v32 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v35 = objc_opt_class();
    +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, v33, v34, v35, objc_opt_class(), 0);
    id v36 = (id)objc_claimAutoreleasedReturnValue();
    v37 = [*(id *)(a1 + 32) programData];
    v72[0] = 0;
    v38 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v36 fromData:v37 error:v72];
    id v39 = v72[0];
    id v40 = [v38 mutableCopy];

    v41 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) dispatchUID]);
    [v40 setObject:v41 forKeyedSubscript:@"FunctionIndex"];

    v42 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", (unint64_t)[*(id *)(a1 + 32) dispatchUID] >> 32);
    [v40 setObject:v42 forKeyedSubscript:@"SubCommandIndex"];

    [v40 setObject:v30 forKeyedSubscript:@"ROI"];
    id v43 = [v40 copy];
    v71[1] = v39;
    v44 = GTMTLShaderDebugger_generateTrace();
    id v45 = v39;

    if (v44)
    {
      v71[0] = v45;
      v46 = +[NSKeyedArchiver archivedDataWithRootObject:v44 requiringSecureCoding:1 error:v71];
      id v47 = v71[0];

      [v31 setData:v46];
      id v45 = v47;
    }
    else
    {
      [v31 setData:0];
    }
    [v31 setError:v45];
  }
  else
  {
    [v31 setData:0];
    id v48 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v134 = NSLocalizedDescriptionKey;
    CFStringRef v135 = @"Invalid request";
    id v45 = +[NSDictionary dictionaryWithObjects:&v135 forKeys:&v134 count:1];
    id v36 = [v48 initWithDomain:@"GTReplayerRequestDomain" code:300 userInfo:v45];
    [v31 setError:v36];
  }

  v49 = [*(id *)(a1 + 32) completionHandler];
  ((void (**)(void, id))v49)[2](v49, v31);
}

- (id)profile:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestID];
  uint64_t v6 = [[GTReplayerOperationBatch alloc] initWithRequestID:v5];
  clientContext = self->_clientContext;
  v49 = v6;
  id v7 = [clientContext->var1->var1 defaultDevice];
  uint64_t v8 = DEVICEOBJECT(v7);
  io_registry_entry_t v9 = [v8 acceleratorPort];

  v72[0] = 0x7FFFFFFF;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__738;
  v70 = __Block_byref_object_dispose__739;
  GetMetalPluginName(v9, v72);
  id v71 = (id)objc_claimAutoreleasedReturnValue();
  IsAGXMetalPlugin((void *)v67[5], v10);
  uint64_t v46 = (uint64_t)v5;
  id v47 = [v4 streamHandler];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  id v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
  v20 = [v4 profileData];
  id v65 = 0;
  v21 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v19 fromData:v20 error:&v65];
  id v22 = v65;

  [v21 setObject:v67[5] forKeyedSubscript:@"MetalPluginName"];
  if (v72[0] != 0x7FFFFFFF)
  {
    v23 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
    [v21 setObject:v23 forKeyedSubscript:@"gpuTarget"];
  }
  v24 = [clientContext->var1->var1 defaultDevice];
  GTDeviceCapabilities_fromDevice();

  char isAGX = GTDeviceCapabilities_isAGX();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v26 = (GTReplayerOperation *)v4;
    if (isAGX)
    {
      if ((GTDeviceCapabilities_isAGX1() & 1) != 0 || GTDeviceCapabilities_isAGX2())
      {
        if (([(GTReplayerOperation *)v26 shaderProfiling] & 1) != 0
          || GTDeviceCapabilities_isAGX1())
        {
          uint64_t v27 = [GTReplayerOperation alloc];
          uint64_t v28 = v63;
          v63[0] = _NSConcreteStackBlock;
          v63[1] = 3221225472;
          v63[2] = __30__GTMTLReplayService_profile___block_invoke_2;
          v63[3] = &unk_744C90;
          v63[6] = clientContext;
          v63[4] = v21;
          v63[5] = v47;
          uint64_t v29 = [(GTReplayerOperation *)v27 initWithBatch:v49 withBlock:v63];
LABEL_13:
          uint64_t v33 = v29;
          uint64_t v34 = (id *)(v28 + 4);
          uint64_t v35 = (id *)(v28 + 5);
LABEL_14:

LABEL_15:
          [(GTReplayerOperationBatch *)v49 addOperation:v33];

          goto LABEL_16;
        }
        id v43 = [GTReplayerOperation alloc];
        v41 = v62;
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = __30__GTMTLReplayService_profile___block_invoke_4;
        v62[3] = &unk_744CB8;
        v62[6] = v46;
        v62[5] = v47;
        v62[7] = clientContext;
        v62[4] = v21;
        v42 = [(GTReplayerOperation *)v43 initWithBatch:v49 withBlock:v62];
      }
      else
      {
        if (!GTDeviceCapabilities_isAGX3())
        {
          uint64_t v33 = 0;
          goto LABEL_15;
        }
        id v40 = [GTReplayerOperation alloc];
        v41 = v61;
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = __30__GTMTLReplayService_profile___block_invoke_6;
        v61[3] = &unk_744CE0;
        v61[7] = v46;
        v61[5] = v47;
        v61[8] = clientContext;
        v61[4] = v21;
        v61[6] = &v66;
        v42 = [(GTReplayerOperation *)v40 initWithBatch:v49 withBlock:v61];
      }
      uint64_t v33 = v42;
      uint64_t v34 = (id *)(v41 + 5);
      uint64_t v35 = (id *)(v41 + 4);
      goto LABEL_14;
    }
    uint64_t v32 = [GTReplayerOperation alloc];
    uint64_t v28 = v64;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = __30__GTMTLReplayService_profile___block_invoke;
    v64[3] = &unk_744C90;
    v64[6] = clientContext;
    v64[4] = v21;
    v64[5] = v47;
    uint64_t v29 = [(GTReplayerOperation *)v32 initWithBatch:v49 withBlock:v64];
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v30 = [GTReplayerOperation alloc];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = __30__GTMTLReplayService_profile___block_invoke_8;
    v56[3] = &unk_744D08;
    char v60 = isAGX;
    v59 = clientContext;
    v57 = v21;
    id v58 = v47;
    id v31 = [(GTReplayerOperation *)v30 initWithBatch:v49 withBlock:v56];
    [(GTReplayerOperationBatch *)v49 addOperation:v31];

    uint64_t v26 = v57;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_17;
    }
    if ([v4 priority])
    {
      v37 = [GTReplayerOperation alloc];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = __30__GTMTLReplayService_profile___block_invoke_11;
      v50[3] = &unk_744D58;
      id v51 = v21;
      id v52 = v47;
      uint64_t v26 = [(GTReplayerOperation *)v37 initWithBatch:v49 withBlock:v50];
      v38 = &v51;
      id v39 = &v52;
    }
    else
    {
      v44 = [GTReplayerOperation alloc];
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = __30__GTMTLReplayService_profile___block_invoke_9;
      v53[3] = &unk_744C90;
      v55[1] = clientContext;
      id v54 = v21;
      v55[0] = v47;
      uint64_t v26 = [(GTReplayerOperation *)v44 initWithBatch:v49 withBlock:v53];
      uint64_t Operation = GTCoreOperationControl_getOperation(v46);
      v38 = &v54;
      id v39 = (id *)v55;
      *(void *)(Operation + 8) = BatchFilteredPause;
      *(void *)(Operation + 16) = BatchFilteredResume;
    }

    [(GTReplayerOperationBatch *)v49 addOperation:v26];
  }
LABEL_16:

LABEL_17:
  [(GTReplayerOperationBatch *)v49 flush:clientContext->var7.var1];

  _Block_object_dispose(&v66, 8);
  return 0;
}

void __30__GTMTLReplayService_profile___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    id v3 = GTMTLReplayClient_queryShaderInfo(*(void *)(*(void *)(a1 + 48) + 8), (id *)(*(void *)(a1 + 48) + 256), *(void **)(a1 + 32));
    id v4 = [v3 mutableCopy];
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isLegacy"];
    id v5 = objc_opt_new();
    id v6 = [v4 copy];
    id v9 = 0;
    id v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v9];
    id v8 = v9;
    [v5 setData:v7];

    [v5 setError:v8];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __30__GTMTLReplayService_profile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    [*(id *)(*(void *)(a1 + 48) + 256) waitUntilAllOperationsAreFinished];
    id v3 = GTMTLReplayClient_embeddedQueryShaderInfo(*(void *)(*(void *)(a1 + 48) + 8), (id *)(*(void *)(a1 + 48) + 256), *(void **)(a1 + 32));
    id v4 = objc_opt_new();
    id v17 = 0;
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v17];
    id v6 = v17;
    [v4 setData:v5];

    [v4 setError:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [v3 objectForKeyedSubscript:@"Streaming Shader Profiling Data"];

    if (v8)
    {
      [*(id *)(*(void *)(a1 + 48) + 256) waitUntilAllOperationsAreFinished];
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t v11 = (id *)(v9 + 256);
      uint64_t v12 = *(void **)(a1 + 32);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __30__GTMTLReplayService_profile___block_invoke_3;
      v14[3] = &unk_744D30;
      uint64_t v13 = v7;
      uint64_t v15 = v13;
      id v16 = *(id *)(a1 + 40);
      GTMTLReplayClient_streamShaderProfilingData(v10, v11, v12, v14);
      dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

void __30__GTMTLReplayService_profile___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    id v3 = objc_opt_new();
    [v3 setRequestID:*(void *)(a1 + 48)];
    id v15 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:&off_759058 requiringSecureCoding:1 error:&v15];
    id v5 = v15;
    [v3 setData:v4];

    [v3 setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    [*(id *)(*(void *)(a1 + 56) + 256) waitUntilAllOperationsAreFinished];
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v8 = *(void *)(v7 + 8);
    uint64_t v9 = (id *)(v7 + 256);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __30__GTMTLReplayService_profile___block_invoke_5;
    v12[3] = &unk_744D30;
    dispatch_semaphore_t v13 = v6;
    uint64_t v10 = *(void **)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    uint64_t v11 = v6;
    GTMTLReplayClient_collectGPUShaderTimelineData(v8, v9, v10, v12);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __30__GTMTLReplayService_profile___block_invoke_6(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    dispatch_queue_t v26 = dispatch_queue_create("gputools.apsreply", 0);
    id v3 = objc_opt_new();
    [v3 setRequestID:*(void *)(a1 + 56)];
    id v39 = 0;
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:&off_759080 requiringSecureCoding:1 error:&v39];
    id v5 = v39;
    [v3 setData:v4];

    [v3 setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    [*(id *)(*(void *)(a1 + 64) + 256) waitUntilAllOperationsAreFinished];
    dispatch_semaphore_t v6 = GTShaderProfilerStreamDataFromReplayDataSource();
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    char v38 = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    char v36 = 0;
    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"SupportsFileFormatV2"];
    [v6 setSupportsFileFormatV2:[v8 BOOLValue]];

    uint64_t v9 = *(void *)(a1 + 64);
    uint64_t v10 = *(void *)(v9 + 8);
    uint64_t v11 = (id *)(v9 + 256);
    uint64_t v12 = *(void **)(a1 + 32);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = __30__GTMTLReplayService_profile___block_invoke_7;
    v30[3] = &unk_746008;
    dispatch_semaphore_t v13 = v7;
    id v31 = v13;
    uint64_t v33 = v37;
    id v14 = v6;
    id v32 = v14;
    uint64_t v34 = v35;
    GTMTLReplayClient_collectAPSData(v10, v11, v12, v30);
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    [v14 setMetalPluginName:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    id v29 = 0;
    id v15 = [v14 encode:0 error:&v29];
    id v16 = v29;
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = objc_opt_new();
      [v18 setError:v17];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if ([v14 supportsFileFormatV2])
      {
        uint64_t v18 = objc_opt_new();
        CFStringRef v42 = @"Profiler Raw URL";
        id v43 = v15;
        id v19 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        id v28 = 0;
        v20 = +[NSKeyedArchiver archivedDataWithRootObject:v19 requiringSecureCoding:1 error:&v28];
        id v17 = v28;
        [v18 setData:v20];

        [v18 setError:v17];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        uint64_t v18 = objc_opt_new();
        uint64_t v21 = +[NSData dataWithContentsOfURL:v15 options:8 error:0];
        id v19 = (void *)v21;
        if (v21)
        {
          CFStringRef v40 = @"Profiler Raw";
          uint64_t v41 = v21;
          id v22 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        }
        else
        {
          id v22 = &__NSDictionary0__struct;
        }
        id v27 = 0;
        v23 = +[NSKeyedArchiver archivedDataWithRootObject:v22 requiringSecureCoding:1 error:&v27];
        id v17 = v27;
        [v18 setData:v23];

        [v18 setError:v17];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v25 = objc_opt_new();
        (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);
      }
    }

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v37, 8);
  }
}

void __30__GTMTLReplayService_profile___block_invoke_8(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(id **)(v4 + 8);
    dispatch_semaphore_t v6 = (id *)(v4 + 256);
    dispatch_semaphore_t v7 = *(void **)(a1 + 32);
    if (v3) {
      GTMTLReplayClient_embeddedDerivedCounterData((uint64_t)v5, (uint64_t)v6, v7);
    }
    uint64_t v8 = GTMTLReplayClient_derivedCounterData(v5, v6, v7);
    uint64_t v9 = objc_opt_new();
    id v14 = 0;
    uint64_t v10 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v14];
    id v11 = v14;
    [v9 setData:v10];

    [v9 setError:v11];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v12 = *(void *)(a1 + 40);
    dispatch_semaphore_t v13 = objc_opt_new();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v13);
  }
}

void __30__GTMTLReplayService_profile___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(v4 + 8);
    dispatch_semaphore_t v6 = (id *)(v4 + 256);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = __30__GTMTLReplayService_profile___block_invoke_10;
    v17[3] = &unk_744D30;
    dispatch_semaphore_t v7 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    dispatch_semaphore_t v18 = v3;
    id v19 = v8;
    uint64_t v9 = v3;
    BOOL v10 = GTMTLReplayClient_streamBatchFilteredData(v5, v6, v7, v17);
    CFStringRef v20 = @"Batch Filtering Started";
    id v11 = +[NSNumber numberWithBool:v10];
    uint64_t v21 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

    dispatch_semaphore_t v13 = objc_opt_new();
    id v16 = 0;
    id v14 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:1 error:&v16];
    id v15 = v16;
    [v13 setData:v14];

    [v13 setError:v15];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __30__GTMTLReplayService_profile___block_invoke_11(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    GTMTLReplayClient_addBatchFilteringRequest(*(void **)(a1 + 32));
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (id)objc_opt_new();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void __30__GTMTLReplayService_profile___block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v5 = v4;
  if (v3)
  {
    id v8 = 0;
    dispatch_semaphore_t v6 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v8];
    id v7 = v8;
    [v5 setData:v6];
  }
  else
  {
    [v4 setData:0];
    id v7 = 0;
  }
  [v5 setError:v7];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!v3) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __30__GTMTLReplayService_profile___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v12 = v3;
  if (v3)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      || ([v3 objectForKeyedSubscript:@"Streaming APS Counters"],
          id v4 = objc_claimAutoreleasedReturnValue(),
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4 != 0,
          v4,
          id v3 = v12,
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)))
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        goto LABEL_8;
      }
      uint64_t v5 = [v3 objectForKeyedSubscript:@"Streaming APS Profiling"];
      if (v5) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }

      id v3 = v12;
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
LABEL_8:
        dispatch_semaphore_t v6 = [v3 objectForKeyedSubscript:@"Remove APS Timeline"];

        id v7 = *(void **)(a1 + 40);
        if (v6) {
          [v7 removeAPSTimelineData];
        }
        else {
          [v7 addAPSTimelineData:v12];
        }
      }
      else
      {
        BOOL v10 = [v12 objectForKeyedSubscript:@"Remove APS Counters"];

        id v11 = *(void **)(a1 + 40);
        if (v10) {
          [v11 removeAPSCounterData];
        }
        else {
          [v11 addAPSCounterData:v12];
        }
      }
    }
    else
    {
      id v8 = [v12 objectForKeyedSubscript:@"Remove APS Data"];

      uint64_t v9 = *(void **)(a1 + 40);
      if (v8) {
        [v9 removeAPSData];
      }
      else {
        [v9 addAPSData:v12];
      }
    }
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void __30__GTMTLReplayService_profile___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  if (v3)
  {
    id v7 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
    id v6 = v7;
    [v4 setData:v5];

    [v4 setError:v6];
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __30__GTMTLReplayService_profile___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  if (v3)
  {
    id v7 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
    id v6 = v7;
    [v4 setData:v5];

    [v4 setError:v6];
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)resume:(unint64_t)a3
{
  uint64_t Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
  {
    id v4 = *(void (**)(void))(Operation + 16);
    if (v4)
    {
      v4();
      LOBYTE(Operation) = 1;
    }
    else
    {
      LOBYTE(Operation) = 0;
    }
  }
  return Operation;
}

- (BOOL)pause:(unint64_t)a3
{
  uint64_t Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation)
  {
    id v4 = *(void (**)(void))(Operation + 8);
    if (v4)
    {
      v4();
      LOBYTE(Operation) = 1;
    }
    else
    {
      LOBYTE(Operation) = 0;
    }
  }
  return Operation;
}

- (BOOL)cancel:(unint64_t)a3
{
  uint64_t Operation = GTCoreOperationControl_getOperation(a3);
  if (Operation) {
    *(unsigned char *)(Operation + 24) = 1;
  }
  return Operation != 0;
}

- (id)decode:(id)a3
{
  id v4 = a3;
  var1 = self->_clientContext->var1;
  if (var1)
  {
    clientContext = self->_clientContext;
    id var0 = var1->var0;
    v44 = objc_opt_new();
    id v45 = objc_opt_new();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    CFStringRef v42 = v4;
    id obj = [v4 requests];
    id v6 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v6)
    {
      id v7 = v6;
      id v8 = &send_ptr;
      uint64_t v9 = *(void *)v53;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v12 = objc_alloc_init((Class)v8[206]);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v11;
            id v51 = 0;
            id v51 = [v13 streamRef];
            unsigned int v14 = [v13 dispatchUID];
            unint64_t v15 = (unint64_t)[v13 dispatchUID];
            Object = GTMTLSMContext_getObject(*(void *)var0->var5, (uint64_t)v51, var0->var9.var0.var0 + v14);
            if (Object && *(_DWORD *)Object == 57)
            {
              uint64_t v17 = v14;
              find_entry((uint64_t)var0->var1, &v51, 8uLL, 0);
              v60[0] = @"requestID";
              dispatch_semaphore_t v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v13 requestID]);
              v61[0] = v18;
              v60[1] = @"functionIndex";
              id v19 = +[NSNumber numberWithUnsignedLongLong:v15 & 0xFFFFFFFF00000000 | v17];
              v61[1] = v19;
              v60[2] = @"streamref";
              CFStringRef v20 = +[NSNumber numberWithUnsignedLongLong:v51];
              v60[3] = @"type";
              v61[2] = v20;
              v61[3] = &off_7598E8;
              uint64_t v21 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:4];
              [v44 addObject:v21];

              id v8 = &send_ptr;
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v11;
              unsigned int v22 = [v13 dispatchUID];
              unint64_t v23 = (unint64_t)[v13 dispatchUID];
              unsigned __int16 v24 = (unsigned __int16)[v13 type] - 1;
              if (v24 <= 7u && ((0xC7u >> v24) & 1) != 0)
              {
                unint64_t v25 = v23 & 0xFFFFFFFF00000000;
                uint64_t v26 = qword_4C81D8[v24];
                uint64_t v43 = v26 + [v13 index];
                v58[0] = @"requestID";
                id v27 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v13 requestID]);
                v59[0] = v27;
                v58[1] = @"functionIndex";
                id v28 = +[NSNumber numberWithUnsignedLongLong:v25 | v22];
                v59[1] = v28;
                v58[2] = @"object";
                id v29 = +[NSNumber numberWithUnsignedLongLong:v43];
                v58[3] = @"type";
                v59[2] = v29;
                v59[3] = &off_759870;
                v30 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:4];
                [v44 addObject:v30];

                id v8 = &send_ptr;
              }
            }
            else
            {
              id v13 = (id)objc_opt_new();
              [v13 setRequestID:[v11 requestID:clientContext]];
              id v31 = objc_alloc((Class)NSError);
              NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
              CFStringRef v57 = @"unknown request";
              id v32 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
              id v33 = [v31 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v32];
              [v13 setError:v33];

              id v8 = &send_ptr;
              [v45 addObject:v13];
            }
          }
        }
        id v7 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
      }
      while (v7);
    }

    id v4 = v42;
    [v42 completionHandler];
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __29__GTMTLReplayService_decode___block_invoke;
    v48[3] = &unk_744C68;
    id v49 = v45;
    id v50 = (id)objc_claimAutoreleasedReturnValue();
    id v34 = v50;
    uint64_t v35 = v45;
    FetchResourceObjectBatch((uint64_t)clientContext, v44, 0, v48);
  }
  else
  {
    char v36 = objc_opt_new();
    [v36 setRequestID:[v4 requestID]];
    id v37 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v63 = NSLocalizedDescriptionKey;
    CFStringRef v64 = @"Decode request happened before replayer data source is loaded";
    char v38 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    id v39 = [v37 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v38];
    [v36 setError:v39];

    uint64_t v35 = [v4 completionHandler];
    v44 = v36;
    v35[2](v35, v36);
  }

  return 0;
}

void __29__GTMTLReplayService_decode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v47 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  id v61 = 0;
  id v48 = v4;
  uint64_t v9 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v8 fromData:v4 error:&v61];
  id v10 = v61;

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  unsigned int v14 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  id v45 = v9;
  unint64_t v15 = [v9 objectForKeyedSubscript:@"object"];
  id v60 = v10;
  id v16 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v14 fromData:v15 error:&v60];
  id v44 = v60;

  id v50 = [v16 objectForKeyedSubscript:@"object"];
  id v49 = [v16 objectForKeyedSubscript:@"requestID"];
  id v17 = [v16 objectForKeyedSubscript:@"functionIndex"];
  dispatch_semaphore_t v18 = (uint64_t *)[v17 bytes];
  id v19 = [v16 objectForKeyedSubscript:@"stream"];
  id v20 = [v19 count];

  uint64_t v59 = 0;
  memory_object_size_t v21 = 1280 * (void)v20;
  unsigned int v22 = (void *)GTCoreAlloc(v21);
  bzero(v22, v21);
  dispatch_data_t concat = (dispatch_data_t)&_dispatch_data_empty;
  id v24 = &_dispatch_data_empty;
  id v43 = objc_alloc_init((Class)NSMutableDictionary);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v25 = [v16 objectForKeyedSubscript:@"stream"];
  id v26 = [v25 countByEnumeratingWithState:&v55 objects:v62 count:16];
  if (v26)
  {
    id v27 = v26;
    memory_object_size_t v40 = v21;
    id v41 = v17;
    CFStringRef v42 = v16;
    uint64_t v28 = *(void *)v56;
    do
    {
      id v29 = 0;
      v30 = concat;
      do
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v25);
        }
        id v31 = *(void **)(*((void *)&v55 + 1) + 8 * (void)v29);
        v53[0] = GTMTLTextureDescriptorDefaults;
        v53[1] = xmmword_4C9980;
        v53[2] = xmmword_4C9990;
        uint64_t v54 = 512;
        uint64_t v32 = *v18++;
        id v33 = NewResourceData(v31, v50, v49, 0, (uint64_t)v53, (uint64_t)v22, &v59, v32, v30);
        dispatch_data_t concat = dispatch_data_create_concat(v30, v33);

        id v29 = (char *)v29 + 1;
        v30 = concat;
      }
      while (v27 != v29);
      id v27 = [v25 countByEnumeratingWithState:&v55 objects:v62 count:16];
    }
    while (v27);
    size_t v34 = 80 * v59;
    id v17 = v41;
    id v16 = v42;
    memory_object_size_t v21 = v40;
  }
  else
  {
    size_t v34 = 0;
  }

  destructor[0] = _NSConcreteStackBlock;
  destructor[1] = 3221225472;
  destructor[2] = __29__GTMTLReplayService_decode___block_invoke_2;
  destructor[3] = &__block_descriptor_48_e5_v8__0l;
  destructor[4] = v22;
  destructor[5] = v21;
  dispatch_data_t v35 = dispatch_data_create(v22, v34, 0, destructor);
  [v43 setObject:v35 forKey:@"info"];
  [v43 setObject:concat forKey:@"data"];
  id v36 = [*(id *)(a1 + 32) copy];
  [v43 setObject:v36 forKey:@"unknown"];

  id v37 = objc_opt_new();
  id v51 = 0;
  char v38 = +[NSKeyedArchiver archivedDataWithRootObject:v43 requiringSecureCoding:1 error:&v51];
  id v39 = v51;
  [v37 setData:v38];

  [v37 setError:v39];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __29__GTMTLReplayService_decode___block_invoke_2(uint64_t a1)
{
  uint64_t result = vm_deallocate(mach_task_self_, *(void *)(a1 + 32), *(void *)(a1 + 40));
  *(void *)(a1 + 32) = 0;
  return result;
}

- (id)update:(id)a3
{
  id v4 = a3;
  val = self;
  clientContext = self->_clientContext;
  p_id var0 = (void **)&clientContext->var1->var0;
  if (p_var0) {
    uint64_t v76 = *p_var0;
  }
  else {
    uint64_t v76 = 0;
  }
  uint64_t v74 = objc_opt_new();
  uint64_t v77 = -[GTReplayerOperationBatch initWithRequestID:]([GTReplayerOperationBatch alloc], "initWithRequestID:", [v4 requestID]);
  uint64_t v78 = objc_opt_new();
  id v6 = objc_alloc((Class)NSMutableArray);
  uint64_t v7 = [v4 requests];
  id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  uint64_t v9 = [v4 requests];
  id v10 = [v9 count];

  if (v10)
  {
    unint64_t v11 = 0;
    do
    {
      uint64_t v12 = objc_opt_new();
      [v8 setObject:v12 atIndexedSubscript:v11];

      uint64_t v13 = [v4 requests];
      ++v11;
      id v14 = [v13 count];
    }
    while ((unint64_t)v14 > v11);
  }
  unint64_t v15 = [v4 requests];
  id v16 = [v15 count];

  if (v16)
  {
    uint64_t v17 = 0;
    uint64_t v73 = v84;
    while (1)
    {
      dispatch_semaphore_t v18 = [v4 requests];
      id v19 = [v18 objectAtIndexedSubscript:v17];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v31 = v19;
          uint64_t v32 = [v31 data];
          id v33 = [v31 uuid];
          [v78 setObject:v32 forKeyedSubscript:v33];

          if ([v78 count] == (char *)&def_1C1270 + 1)
          {
            size_t v34 = [GTReplayerOperation alloc];
            v96[0] = _NSConcreteStackBlock;
            v96[1] = 3221225472;
            v96[2] = __29__GTMTLReplayService_update___block_invoke;
            v96[3] = &unk_744BC8;
            uint64_t v100 = v76;
            id v97 = v78;
            uint64_t v101 = clientContext;
            id v98 = v31;
            id v99 = v8;
            int v102 = v17;
            dispatch_data_t v35 = [(GTReplayerOperation *)v34 initWithBatch:v77 withBlock:v96];
            [(GTReplayerOperationBatch *)v77 addOperation:v35];
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (v76)
            {
              objc_initWeak(&location, val);
              id v36 = [GTReplayerOperation alloc];
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472;
              v90[2] = __29__GTMTLReplayService_update___block_invoke_2;
              v90[3] = &unk_744BF0;
              objc_copyWeak(v93, &location);
              id v91 = v19;
              v93[1] = v76;
              v93[2] = clientContext;
              id v92 = v8;
              int v94 = v17;
              id v37 = [(GTReplayerOperation *)v36 initWithBatch:v77 withBlock:v90];
              [(GTReplayerOperationBatch *)v77 addOperation:v37];

              objc_destroyWeak(v93);
              objc_destroyWeak(&location);
            }
            else
            {
              uint64_t v59 = objc_opt_new();
              [v59 setRequestID:[v19 requestID]];
              id v60 = objc_alloc((Class)NSError);
              NSErrorUserInfoKey v106 = NSLocalizedDescriptionKey;
              CFStringRef v107 = @"Update request happened before replayer data source is loaded";
              id v61 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
              id v62 = [v60 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v61];
              [v59 setError:v62];

              [v8 setObject:v59 atIndexedSubscript:v17];
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v41 = v19;
              CFStringRef v42 = [v41 configuration];
              [v41 requestID];
              BOOL v43 = val->_gputrace != 0;
              id v44 = [GTReplayerOperation alloc];
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v84[0] = __29__GTMTLReplayService_update___block_invoke_3;
              v84[1] = &unk_744C18;
              BOOL v89 = v43;
              id v85 = v42;
              id v86 = v41;
              id v87 = v8;
              int v88 = v17;
              id v45 = v41;
              id v46 = v42;
              id v47 = [(GTReplayerOperation *)v44 initWithBatch:v77 withBlock:v83];
              [(GTReplayerOperationBatch *)v77 addOperation:v47];
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v52 = v19;
                BOOL v53 = val->_terminateConnection == 0;
                uint64_t v54 = [v52 connection];
                terminateConnection = val->_terminateConnection;
                val->_terminateConnection = (OS_xpc_object *)v54;

                [v52 path];
                if (v53) {
                  uint64_t v67 = {;
                }
                  terminatePath = val->_terminatePath;
                  val->_terminatePath = (OS_xpc_object *)v67;
                }
                else {
                  terminatePath = {;
                }
                  uint64_t v57 = MessagePathMerge();
                  long long v58 = val->_terminatePath;
                  val->_terminatePath = (OS_xpc_object *)v57;
                }
              }
              else
              {
                NSErrorUserInfoKey v63 = objc_opt_new();
                [v63 setRequestID:[v19 requestID]];
                id v64 = objc_alloc((Class)NSError);
                NSErrorUserInfoKey v104 = NSLocalizedDescriptionKey;
                CFStringRef v105 = @"unknown request";
                id v65 = +[NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];
                id v66 = [v64 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v65];
                [v63 setError:v66];

                [v8 setObject:v63 atIndexedSubscript:v17];
              }
            }
          }
        }
        goto LABEL_25;
      }
      id v20 = v19;
      memory_object_size_t v21 = objc_opt_new();
      [v21 setRequestID:[v20 requestID]];
      var1 = clientContext->var1;
      if (!var1) {
        break;
      }
      var6 = var1->var6;
      p_var6 = &var1->var6;
      dispatch_semaphore_wait(var6, 0xFFFFFFFFFFFFFFFFLL);
      id v25 = p_var6[1];
      id v26 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v20 sessionsID]);
      id v27 = [v25 objectForKey:v26];

      dispatch_semaphore_signal((dispatch_semaphore_t)*p_var6);
      if (!v27)
      {
        id v48 = objc_alloc((Class)NSError);
        NSErrorUserInfoKey v108 = NSLocalizedDescriptionKey;
        CFStringRef v109 = @"ASV viewer session does not exist";
        id v39 = +[NSDictionary dictionaryWithObjects:&v109 forKeys:&v108 count:1];
        id v40 = [v48 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v39];
        goto LABEL_24;
      }
      id v103 = 0;
      uint64_t v28 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v103];
      id v29 = v103;
      [v21 setData:v28];

      [v21 setError:v29];
      [v8 setObject:v21 atIndexedSubscript:v17];
      v30 = [v20 data];

      [v27 receiveData:v30];
LABEL_25:

      id v50 = [v4 requests];
      id v51 = [v50 count];

      if ((unint64_t)v51 <= ++v17) {
        goto LABEL_34;
      }
    }
    id v38 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v110 = NSLocalizedDescriptionKey;
    CFStringRef v111 = @"Update request happened before replayer data source is loaded";
    id v39 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:&v110 count:1];
    id v40 = [v38 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v39];
LABEL_24:
    id v49 = v40;
    [v21 setError:v40];

    [v8 setObject:v21 atIndexedSubscript:v17];
    goto LABEL_25;
  }
LABEL_34:
  uint64_t v68 = [GTReplayerOperation alloc];
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = __29__GTMTLReplayService_update___block_invoke_4;
  v80[3] = &unk_744C40;
  id v81 = v8;
  id v82 = v4;
  id v69 = v4;
  id v70 = v8;
  id v71 = [(GTReplayerOperation *)v68 initWithBatch:v77 withBlock:v80];
  [(GTReplayerOperationBatch *)v77 addOperation:v71];
  [(GTReplayerOperationBatch *)v77 finish:clientContext->var7.var0];

  return 0;
}

void __29__GTMTLReplayService_update___block_invoke_4(uint64_t a1)
{
  id v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 32) copy];
  id v7 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
  id v5 = v7;
  [v2 setData:v4];

  [v2 setError:v5];
  id v6 = [*(id *)(a1 + 40) completionHandler];

  ((void (**)(void, void *))v6)[2](v6, v2);
}

void __29__GTMTLReplayService_update___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    id v3 = *(void **)(a1 + 32);
    if (*(void *)(a1 + 56))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
      id v5 = *(void **)(v4 + 128);
      id v6 = *(void **)(v4 + 136);
      id v7 = GTTransportArchiveDirectory();
      UpdateDebugFileCache(v3, v5, v6, v7);
    }
    else
    {
      id v8 = GTTransportArchiveDirectory();
      id v9 = v3;
      id v10 = v8;
      if (v9)
      {
        id v11 = [objc_alloc((Class)NSURL) initFileURLWithPath:v10 isDirectory:1];
        uint64_t v12 = +[NSFileManager defaultManager];
        id v24 = 0;
        [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v24];
        id v13 = v24;

        v22[0] = 0;
        v22[1] = v22;
        v22[2] = 0x2020000000;
        char v23 = 1;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = __StoreDebugFileCache_block_invoke;
        v19[3] = &unk_744DF8;
        id v14 = v11;
        id v20 = v14;
        memory_object_size_t v21 = v22;
        [v9 enumerateKeysAndObjectsUsingBlock:v19];

        _Block_object_dispose(v22, 8);
      }
    }
    unint64_t v15 = objc_opt_new();
    [v15 setRequestID:[*(id *)(a1 + 40) requestID]];
    id v18 = 0;
    id v16 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v18];
    id v17 = v18;
    [v15 setData:v16];

    [v15 setError:v17];
    [*(id *)(a1 + 48) setObject:v15 atIndexedSubscript:*(int *)(a1 + 72)];
  }
}

void __29__GTMTLReplayService_update___block_invoke_2(uint64_t a1, uint64_t a2)
{
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained || *(unsigned char *)(a2 + 24)) {
    goto LABEL_17;
  }
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  id v6 = *(id *)(a1 + 32);
  id v7 = [v6 streamRef];
  [v6 dispatchUID];
  [v6 dispatchUID];
  id v8 = [v6 shaderURL];

  if (v8)
  {
    id v9 = [v6 shaderURL];
    unsigned int v10 = [v9 startAccessingSecurityScopedResource];

    if (v10)
    {
      id v11 = (apr_pool_t *)*WeakRetained[1];
      uint64_t v12 = [v6 shaderURL];
      apr_pool_cleanup_register(v11, v12, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtensionURL_811, apr_pool_cleanup_null);
    }
    id v13 = [v6 shaderURL];
    id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 128);
    unint64_t v15 = +[NSNumber numberWithUnsignedLongLong:v7];
    [v14 setObject:v13 forKeyedSubscript:v15];

    CFStringRef v35 = @"streamref";
    id v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 streamRef]);
    id v36 = v16;
    id v17 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];

    id v18 = [v6 shaderURL];
    goto LABEL_13;
  }
  id v19 = [v6 shaderIR];

  if (v19)
  {
    v33[0] = @"streamref";
    id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 streamRef]);
    v33[1] = @"IR";
    v34[0] = v20;
    memory_object_size_t v21 = [v6 shaderIR];
    v34[1] = v21;
    unsigned int v22 = v34;
    char v23 = v33;
LABEL_11:
    id v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:2];

    goto LABEL_12;
  }
  id v17 = [v6 shaderSource];

  if (v17)
  {
    v31[0] = @"streamref";
    id v20 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 streamRef]);
    v31[1] = @"source";
    v32[0] = v20;
    memory_object_size_t v21 = [v6 shaderSource];
    v32[1] = v21;
    unsigned int v22 = v32;
    char v23 = v31;
    goto LABEL_11;
  }
LABEL_12:
  id v18 = 0;
LABEL_13:
  id v24 = objc_opt_new();
  [v24 setRequestID:[*(id *)(a1 + 32) requestID]];
  if (UpdateLibraryResource(*(id **)(*(void *)(a1 + 64) + 8), v17, v5, v18))
  {
    [v5 objectForKeyedSubscript:@"updatedPipelines"];
    id v25 = v29 = v5;
    id v26 = [v25 copy];
    id v30 = 0;
    id v27 = +[NSKeyedArchiver archivedDataWithRootObject:v26 requiringSecureCoding:1 error:&v30];
    id v28 = v30;
    [v24 setData:v27];

    id v5 = v29;
  }
  else
  {
    id v28 = [v5 objectForKeyedSubscript:@"error"];
  }
  [v24 setError:v28];

  [*(id *)(a1 + 40) setObject:v24 atIndexedSubscript:*(int *)(a1 + 72)];
LABEL_17:
}

void __29__GTMTLReplayService_update___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    if (*(unsigned char *)(a1 + 60))
    {
      [*(id *)(a1 + 32) setForceLoadUnusedResources:0];
      [*(id *)(a1 + 32) setEnableReplayFromOtherPlatforms:0];
      [*(id *)(a1 + 32) setEnableCapture:0];
      [*(id *)(a1 + 32) setEnableHUD:0];
    }
    unsigned int v3 = [*(id *)(a1 + 32) forceLoadActionClear];
    dword_77313C = dword_77313C & 0xFFFFFFFE | v3;
    if ([*(id *)(a1 + 32) forceLoadUnusedResources]) {
      int v4 = 1024;
    }
    else {
      int v4 = 0;
    }
    dword_77313C = dword_77313C & 0xFFFFFBFF | v4;
    if ([*(id *)(a1 + 32) forceWaitUntilCompleted]) {
      int v5 = 2;
    }
    else {
      int v5 = 0;
    }
    dword_77313C = dword_77313C & 0xFFFFFFFD | v5;
    if ([*(id *)(a1 + 32) disableOptimizeRestores]) {
      int v6 = 16;
    }
    else {
      int v6 = 0;
    }
    dword_77313C = dword_77313C & 0xFFFFFFEF | v6;
    if ([*(id *)(a1 + 32) enableDisplayOnDevice]) {
      int v7 = 0;
    }
    else {
      int v7 = 32;
    }
    dword_77313C = dword_77313C & 0xFFFFFFDF | v7;
    if ([*(id *)(a1 + 32) disableHeapTextureCompression]) {
      int v8 = 0x2000;
    }
    else {
      int v8 = 0;
    }
    dword_77313C = dword_77313C & 0xFFFFDFFF | v8;
    if ([*(id *)(a1 + 32) enableReplayFromOtherPlatforms]) {
      int v9 = 0x80000;
    }
    else {
      int v9 = 0;
    }
    dword_77313C = dword_77313C & 0xFFF7FFFF | v9;
    if ([*(id *)(a1 + 32) enableCapture]) {
      int v10 = 0x1000000;
    }
    else {
      int v10 = 0;
    }
    dword_77313C = dword_77313C & 0xFEFFFFFF | v10;
    if ([*(id *)(a1 + 32) enableHUD]) {
      int v11 = 0x2000000;
    }
    else {
      int v11 = 0;
    }
    dword_77313C = dword_77313C & 0xFDFFFFFF | v11;
    uint64_t v12 = objc_opt_new();
    [v12 setRequestID:[*(id *)(a1 + 40) requestID]];
    id v15 = 0;
    id v13 = +[NSKeyedArchiver archivedDataWithRootObject:&__kCFBooleanTrue requiringSecureCoding:1 error:&v15];
    id v14 = v15;
    [v12 setData:v13];

    [v12 setError:v14];
    [*(id *)(a1 + 48) setObject:v12 atIndexedSubscript:*(int *)(a1 + 56)];
  }
}

- (void)display:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  clientContext = self->_clientContext;
  if (clientContext->var9 && (dword_77313C & 0x20) == 0 && clientContext->var1)
  {
    id var0 = clientContext->var7.var0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __30__GTMTLReplayService_display___block_invoke;
    v8[3] = &unk_7463C0;
    int v10 = clientContext;
    id v9 = v4;
    [var0 addOperationWithBlock:v8];
  }
}

void __30__GTMTLReplayService_display___block_invoke(uint64_t a1)
{
  uint64_t v2 = **(void **)(*(void *)(a1 + 40) + 8);
  id v3 = [*(id *)(a1 + 32) streamRef];
  unsigned int v4 = [*(id *)(a1 + 32) dispatchUID];
  unint64_t v5 = (unint64_t)[*(id *)(a1 + 32) dispatchUID] >> 32;
  uint64_t v6 = *(void *)(v2 + 80);
  unsigned __int8 v7 = [*(id *)(a1 + 32) filters];
  if (v7)
  {
    *(void *)&v56[0] = 0x400FF00FFLL;
    BYTE8(v56[0]) = 0;
    BYTE9(v56[0]) = (v7 & 2) != 0;
    BYTE10(v56[0]) = (v7 & 4) != 0;
    BYTE11(v56[0]) = 0;
    GTMTLReplayClient_displayAttachment(*(void *)(a1 + 40), (uint64_t)v56, v4, v5);
  }
  else
  {
    unint64_t v8 = v6 + v4;
    uint64_t v52 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v52 + 8);
    GTMTLReplayController_debugSubCommandStop(v9, v8, v5);
    uint64_t v10 = *(void *)(*(void *)v9 + 40);
    Object = GTMTLSMContext_getObject(*(void *)v10, (uint64_t)v3, v8);
    if (Object)
    {
      id v50 = Object;
      v60[0] = &off_759810;
      v59[0] = @"type";
      v59[1] = @"object";
      uint64_t v12 = +[NSNumber numberWithUnsignedLongLong:v3];
      v60[1] = v12;
      v59[2] = @"DependencyGraphRequestedTextureLevel";
      id v13 = +[NSNumber numberWithUnsignedShort:0];
      v60[2] = v13;
      v59[3] = @"DependencyGraphRequestedTextureSlice";
      id v14 = +[NSNumber numberWithUnsignedShort:0];
      v60[3] = v14;
      void v59[4] = @"DependencyGraphRequestedTextureAttachmentIndex";
      id v15 = +[NSNumber numberWithUnsignedInt:0];
      void v60[4] = v15;
      v59[5] = @"DependencyGraphRequestedTextureDepthPlane";
      id v16 = +[NSNumber numberWithUnsignedShort:0];
      v60[5] = v16;
      id v17 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:6];

      id v18 = *(void **)(v9 + 40);
      id v19 = +[NSNumber numberWithUnsignedLongLong:v3];
      id v20 = [v18 objectForKeyedSubscript:v19];

      if (!v20)
      {
        id v20 = [*(id *)(v9 + 8) textureForKey:v3];
      }
      long long v58 = v17;
      memory_object_size_t v21 = +[NSArray arrayWithObjects:&v58 count:1];
      uint64_t v57 = v20;
      unsigned int v22 = +[NSArray arrayWithObjects:&v57 count:1];

      GTMTLReplayClient_waitForUntrackedWritesToComplete(v9, v22);
      id v51 = v21;
      char v23 = GTMTLReplayClient_retrieveTexturesForResize((id *)v9, v21, v22, 1, 0);
      id v24 = [*(id *)(v9 + 8) defaultCommandQueue];
      id v25 = InternalCommandBuffer(v24, @"DisplayTexture");

      id v26 = [GTMTLTextureRenderEncoder alloc];
      id v27 = [*(id *)(v9 + 8) defaultDevice];
      id v28 = [(GTMTLTextureRenderEncoder *)v26 initWithDevice:v27];

      if (v50[24])
      {
        id v29 = apr_array_make(*(apr_pool_t **)v52, 16, 8);
        GTMTLSMContext_getObjects(*(_DWORD **)(v10 + 240), v8, v29);
        if (v29->nelts >= 1)
        {
          uint64_t v30 = 0;
          do
          {
            id v31 = [*(id *)(v9 + 8) layerForKey:*(void *)(*(void *)&v29->elts[8 * v30] + 40)];
            [v31 drawableSize];
            double v33 = v32;
            double v35 = v34;
            if (v31) {
              [v31 transform];
            }
            else {
              memset(v56, 0, sizeof(v56));
            }
            [(GTMTLTextureRenderEncoder *)v28 setTransform:v56];
            [v31 bounds];
            double v37 = v36;
            double v39 = v38;
            double v41 = v40;
            double v43 = v42;
            [v31 contentsScale];
            -[GTMTLTextureRenderEncoder setBounds:contentsScale:](v28, "setBounds:contentsScale:", v37, v39, v41, v43, v44);
            [v31 anchorPoint];
            -[GTMTLTextureRenderEncoder setAnchor:](v28, "setAnchor:");
            id v45 = [v22 objectAtIndexedSubscript:v30];
            id v46 = [v23 objectAtIndexedSubscript:v30];
            EncodeAttachment(v52, v25, v28, v45, v46, 0, 0, (unint64_t)v33, (unint64_t)v35, 0);

            ++v30;
          }
          while (v30 < v29->nelts);
        }
      }
      else
      {
        -[GTMTLTextureRenderEncoder setBounds:contentsScale:](v28, "setBounds:contentsScale:", 0.0, 0.0, (double)*(unint64_t *)(v9 + 22464), (double)*(unint64_t *)(v9 + 22472), 1.0);
        id v47 = [v22 objectAtIndexedSubscript:0];
        id v48 = [v23 objectAtIndexedSubscript:0];
        EncodeAttachment(v52, v25, v28, v47, v48, 0, 0, *(void *)(v9 + 22464), *(void *)(v9 + 22472), 1u);
      }
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = __GTMTLReplayClient_displayTexture_block_invoke;
      _OWORD v53[3] = &unk_746888;
      uint64_t v54 = v28;
      uint64_t v55 = v52;
      id v49 = v28;
      [v25 addCompletedHandler:v53];
      GTMTLReplay_commitCommandBuffer(v25);
    }
  }
}

- (id)fetch:(id)a3
{
  id v4 = a3;
  var1 = self->_clientContext->var1;
  if (!var1 || (id var0 = var1->var0) == 0)
  {
    int v94 = objc_opt_new();
    [v94 setRequestID:[v4 requestID]];
    id v95 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v148 = NSLocalizedDescriptionKey;
    CFStringRef v149 = @"Fetch request happened before replayer data source is loaded";
    uint64_t v96 = +[NSDictionary dictionaryWithObjects:&v149 forKeys:&v148 count:1];
    id v97 = [v95 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v96];
    [v94 setError:v97];

    uint64_t v93 = [v4 completionHandler];
    v93[2](v93, v94);
    goto LABEL_58;
  }
  clientContext = self->_clientContext;
  id v7 = objc_alloc((Class)NSMutableDictionary);
  unint64_t v8 = [v4 requests];
  id v111 = [v7 initWithCapacity:[v8 count]];

  uint64_t v112 = objc_opt_new();
  uint64_t v101 = objc_opt_new();
  long long v127 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  uint64_t v100 = v4;
  id obj = [v4 requests];
  id v9 = [obj countByEnumeratingWithState:&v127 objects:v147 count:16];
  if (!v9) {
    goto LABEL_56;
  }
  id v10 = v9;
  uint64_t v115 = *(void *)v128;
  int v102 = var0;
  do
  {
    int v11 = 0;
    id v113 = v10;
    do
    {
      if (*(void *)v128 != v115) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void **)(*((void *)&v127 + 1) + 8 * (void)v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          id v21 = [v13 requestID];
          id v124 = 0;
          id v124 = [v13 streamRef];
          unsigned int v22 = [v13 dispatchUID];
          unint64_t v23 = (unint64_t)[v13 dispatchUID];
          Object = GTMTLSMContext_getObject(*(void *)var0->var5, (uint64_t)[v13 streamRef], var0->var9.var0.var0 + v22);
          if (Object && *(_DWORD *)Object == 22)
          {
            entry = find_entry((uint64_t)var0->var1, &v124, 8uLL, 0);
            if (*entry) {
              uint64_t v26 = *(void *)(*entry + 32);
            }
            else {
              uint64_t v26 = 0;
            }
            uint64_t v74 = v22;
            v141[0] = @"requestID";
            uint64_t v75 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v21, clientContext);
            v142[0] = v75;
            v141[1] = @"functionIndex";
            uint64_t v76 = +[NSNumber numberWithUnsignedLongLong:v23 & 0xFFFFFFFF00000000 | v74];
            v142[1] = v76;
            v141[2] = @"streamref";
            uint64_t v77 = +[NSNumber numberWithUnsignedLongLong:v124];
            v142[2] = v77;
            v141[3] = @"object";
            uint64_t v78 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v26 + 8)];
            v142[3] = v78;
            v142[4] = &off_759870;
            void v141[4] = @"type";
            v141[5] = @"range.location";
            +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v13 range]);
            uint64_t v79 = v110 = v21;
            v142[5] = v79;
            v141[6] = @"range.length";
            [v13 range];
            id v81 = +[NSNumber numberWithUnsignedLongLong:v80];
            v142[6] = v81;
            id v82 = +[NSDictionary dictionaryWithObjects:v142 forKeys:v141 count:7];

            [v112 addObject:v82];
            uint64_t v83 = +[NSNumber numberWithUnsignedLongLong:v110];
            [v111 setObject:v82 forKeyedSubscript:v83];

            goto LABEL_47;
          }
          goto LABEL_49;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v12;
          id v28 = [v27 requestID];
          unsigned int v29 = [v27 dispatchUID];
          unint64_t v30 = (unint64_t)[v27 dispatchUID];
          if ([v27 solid]) {
            uint64_t v31 = -3;
          }
          else {
            uint64_t v31 = -1;
          }
          v139[0] = @"requestID";
          double v32 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v28, clientContext);
          v140[0] = v32;
          v139[1] = @"functionIndex";
          double v33 = +[NSNumber numberWithUnsignedLongLong:v30 & 0xFFFFFFFF00000000 | v29];
          v140[1] = v33;
          v139[2] = @"object";
          double v34 = +[NSNumber numberWithUnsignedLongLong:v31];
          v140[2] = v34;
          v140[3] = &off_759888;
          v139[3] = @"type";
          void v139[4] = @"resolution";
          void v140[4] = &off_759008;
          double v35 = v140;
          double v36 = v139;
LABEL_25:
          +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v35, v36, 5, clientContext);
          id v13 = (id)objc_claimAutoreleasedReturnValue();

          id v10 = v113;
          [v112 addObject:v13];
          double v40 = +[NSNumber numberWithUnsignedLongLong:v28];
          double v41 = v111;
          id v42 = v13;
          id v43 = v40;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v27 = v12;
            id v28 = [v27 requestID];
            unsigned int v37 = [v27 dispatchUID];
            unint64_t v38 = (unint64_t)[v27 dispatchUID];
            uint64_t v39 = [v27 index] - 513;
            v137[0] = @"requestID";
            double v32 = +[NSNumber numberWithUnsignedLongLong:v28];
            v138[0] = v32;
            v137[1] = @"functionIndex";
            double v33 = +[NSNumber numberWithUnsignedLongLong:v38 & 0xFFFFFFFF00000000 | v37];
            v138[1] = v33;
            v137[2] = @"object";
            double v34 = +[NSNumber numberWithUnsignedLongLong:v39];
            v138[2] = v34;
            v138[3] = &off_759888;
            v137[3] = @"type";
            v137[4] = @"resolution";
            void v138[4] = &off_759030;
            double v35 = v138;
            double v36 = v137;
            goto LABEL_25;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v44 = v12;
            id v45 = [v44 requestID];
            unsigned int v46 = [v44 dispatchUID];
            unint64_t v47 = (unint64_t)[v44 dispatchUID];
            uint64_t v48 = [v44 index] - 1025;
            v135[0] = @"requestID";
            id v49 = +[NSNumber numberWithUnsignedLongLong:v45];
            v136[0] = v49;
            v135[1] = @"functionIndex";
            id v50 = +[NSNumber numberWithUnsignedLongLong:v47 & 0xFFFFFFFF00000000 | v46];
            v136[1] = v50;
            v135[2] = @"object";
            id v51 = +[NSNumber numberWithUnsignedLongLong:v48];
            v135[3] = @"type";
            v136[2] = v51;
            v136[3] = &off_7598D0;
            id v13 = +[NSDictionary dictionaryWithObjects:v136 forKeys:v135 count:4];

            [v112 addObject:v13];
            uint64_t v52 = +[NSNumber numberWithUnsignedLongLong:v45];
            [v111 setObject:v13 forKeyedSubscript:v52];

            goto LABEL_48;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            id v13 = (id)objc_opt_new();
            [v13 setRequestID:[v12 requestID:clientContext]];
            id v84 = objc_alloc((Class)NSError);
            NSErrorUserInfoKey v131 = NSLocalizedDescriptionKey;
            CFStringRef v132 = @"unknown request";
            id v85 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
            id v86 = [v84 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v85];
            [v13 setError:v86];

            [v101 addObject:v13];
            goto LABEL_48;
          }
          id v13 = v12;
          id v66 = [v13 requestID];
          unsigned int v67 = [v13 dispatchUID];
          unint64_t v68 = (unint64_t)[v13 dispatchUID];
          unsigned int v69 = [v13 objectShaderThreadgroupBoundsPresent];
          v133[0] = @"requestID";
          id v70 = +[NSNumber numberWithUnsignedLongLong:v66];
          v134[0] = v70;
          v133[1] = @"functionIndex";
          id v71 = +[NSNumber numberWithUnsignedLongLong:v68 & 0xFFFFFFFF00000000 | v67];
          v134[1] = v71;
          v133[2] = @"object";
          v72 = +[NSNumber numberWithUnsignedLongLong:-1026];
          v133[3] = @"type";
          v134[2] = v72;
          v134[3] = &off_759870;
          uint64_t v73 = +[NSDictionary dictionaryWithObjects:v134 forKeys:v133 count:4];
          double v40 = +[NSMutableDictionary dictionaryWithDictionary:v73];

          id var0 = v102;
          id v10 = v113;
          if (v69)
          {
            id v124 = 0;
            uint64_t v125 = 0;
            uint64_t v126 = 0;
            if (v13)
            {
              [v13 objectShaderThreadgroupBeginBounds];
              id v121 = 0;
              uint64_t v122 = 0;
              uint64_t v123 = 0;
              [v13 objectShaderThreadgroupEndBounds];
            }
            else
            {
              id v121 = 0;
              uint64_t v122 = 0;
              uint64_t v123 = 0;
            }
            id v87 = +[NSMutableData data];
            [v87 appendBytes:&v124 length:12];
            [v87 appendBytes:&v121 length:12];
            id v88 = [v87 copy];
            [v40 setObject:v88 forKeyedSubscript:@"objectThreadgroupRange"];
          }
          [v112 addObject:v40 clientContext];
          id v27 = +[NSNumber numberWithUnsignedLongLong:v66];
          double v41 = v111;
          id v42 = v40;
          id v43 = v27;
        }
        [v41 setObject:v42 forKeyedSubscript:v43];

        goto LABEL_49;
      }
      id v13 = v12;
      id v14 = [v13 requestID];
      id v121 = 0;
      id v121 = [v13 streamRef];
      unsigned int v15 = [v13 dispatchUID];
      unint64_t v16 = (unint64_t)[v13 dispatchUID];
      id v17 = GTMTLSMContext_getObject(*(void *)var0->var5, (uint64_t)[v13 streamRef], var0->var9.var0.var0 + v15);
      if (v17)
      {
        id v18 = v17;
        if (*(_DWORD *)v17 == 80)
        {
          id v19 = find_entry((uint64_t)var0->var1, &v121, 8uLL, 0);
          if (*v19) {
            uint64_t v20 = *(void *)(*v19 + 32);
          }
          else {
            uint64_t v20 = 0;
          }
          id v124 = 0;
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          if (v13) {
            [v13 size];
          }
          v145[0] = @"requestID";
          id v109 = v14;
          NSErrorUserInfoKey v108 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14, clientContext);
          v146[0] = v108;
          v145[1] = @"functionIndex";
          CFStringRef v107 = +[NSNumber numberWithUnsignedLongLong:v16 & 0xFFFFFFFF00000000 | v15];
          v146[1] = v107;
          v145[2] = @"streamref";
          NSErrorUserInfoKey v106 = +[NSNumber numberWithUnsignedLongLong:v121];
          v146[2] = v106;
          v145[3] = @"object";
          CFStringRef v105 = +[NSNumber numberWithUnsignedLongLong:*(void *)(v20 + 8)];
          v146[3] = v105;
          v146[4] = &off_759888;
          v145[4] = @"type";
          v145[5] = @"DependencyGraphRequestedTextureLevel";
          NSErrorUserInfoKey v104 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 level]);
          v146[5] = v104;
          v145[6] = @"DependencyGraphRequestedTextureSlice";
          id v103 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 slice]);
          v146[6] = v103;
          void v145[7] = @"DependencyGraphRequestedTextureDepthPlane";
          BOOL v53 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v13 depth]);
          void v146[7] = v53;
          v145[8] = @"DependencyGraphRequestedTextureAttachmentIndex";
          id v54 = [v13 plane];
          uint64_t v55 = (uint64_t)v54;
          uint64_t v56 = v18[13];
          if (v56) {
            uint64_t v57 = (unsigned __int16 *)(v56 + 34);
          }
          else {
            uint64_t v57 = (unsigned __int16 *)(v18 + 19);
          }
          int v58 = *v57;
          if (v58 == 260 || v58 == 255)
          {
            if (v54) {
              uint64_t v55 = 9;
            }
            else {
              uint64_t v55 = 8;
            }
          }
          uint64_t v59 = +[NSNumber numberWithInt:v55];
          v146[8] = v59;
          v145[9] = @"resolveMultisampleTexture";
          id v60 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 resolveMultisampleTexture]);
          v146[9] = v60;
          v145[10] = @"resolution";
          v143[0] = @"width";
          id v61 = +[NSNumber numberWithUnsignedLongLong:v124];
          v144[0] = v61;
          v143[1] = @"height";
          id v62 = +[NSNumber numberWithUnsignedLongLong:v125];
          v143[2] = @"format";
          v144[1] = v62;
          v144[2] = &off_7598A0;
          NSErrorUserInfoKey v63 = +[NSDictionary dictionaryWithObjects:v144 forKeys:v143 count:3];
          v146[10] = v63;
          id v64 = +[NSDictionary dictionaryWithObjects:v146 forKeys:v145 count:11];

          [v112 addObject:v64];
          id v65 = +[NSNumber numberWithUnsignedLongLong:v109];
          [v111 setObject:v64 forKeyedSubscript:v65];

LABEL_47:
          id var0 = v102;
LABEL_48:
          id v10 = v113;
        }
      }
LABEL_49:

      int v11 = (char *)v11 + 1;
    }
    while (v10 != v11);
    id v89 = [obj countByEnumeratingWithState:&v127 objects:v147 count:16];
    id v10 = v89;
  }
  while (v89);
LABEL_56:

  id v4 = v100;
  uint64_t v90 = [v100 completionHandler];
  v116[0] = _NSConcreteStackBlock;
  v116[1] = 3221225472;
  v116[2] = __28__GTMTLReplayService_fetch___block_invoke;
  v116[3] = &unk_744BA0;
  id v117 = v100;
  id v118 = v111;
  id v119 = v101;
  id v120 = v90;
  id v91 = v101;
  id v92 = v111;
  uint64_t v93 = v90;
  int v94 = v112;
  FetchResourceObjectBatch((uint64_t)clientContext, v112, 0, v116);

LABEL_58:
  return 0;
}

void __28__GTMTLReplayService_fetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    uint64_t v57 = a1;
    id v53 = v6;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    int v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    id v68 = 0;
    id v54 = v5;
    uint64_t v12 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v5 error:&v68];
    id v13 = v68;

    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    uint64_t v52 = v12;
    id v19 = [v12 objectForKeyedSubscript:@"object"];
    id v67 = v13;
    uint64_t v20 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v18 fromData:v19 error:&v67];
    id v21 = v67;

    uint64_t v56 = [v20 objectForKeyedSubscript:@"object"];
    uint64_t v55 = [v20 objectForKeyedSubscript:@"requestID"];
    id v22 = [v20 objectForKeyedSubscript:@"functionIndex"];
    unint64_t v23 = (uint64_t *)[v22 bytes];
    id v24 = [v20 objectForKeyedSubscript:@"stream"];
    id v25 = [v24 count];

    uint64_t v66 = 0;
    uint64_t v26 = 1280 * (void)v25;
    id v27 = (void *)GTCoreAlloc(1280 * (void)v25);
    bzero(v27, 1280 * (void)v25);
    dispatch_data_t concat = (dispatch_data_t)&_dispatch_data_empty;
    id v29 = &_dispatch_data_empty;
    id v51 = objc_alloc_init((Class)NSMutableDictionary);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    unint64_t v30 = [v20 objectForKeyedSubscript:@"stream"];
    id v31 = [v30 countByEnumeratingWithState:&v62 objects:v69 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v48 = 1280 * (void)v25;
      id v49 = v21;
      id v50 = v20;
      uint64_t v33 = *(void *)v63;
      do
      {
        double v34 = 0;
        double v35 = concat;
        do
        {
          if (*(void *)v63 != v33) {
            objc_enumerationMutation(v30);
          }
          double v36 = *(void **)(*((void *)&v62 + 1) + 8 * (void)v34);
          v60[0] = GTMTLTextureDescriptorDefaults;
          v60[1] = xmmword_4C9980;
          v60[2] = xmmword_4C9990;
          uint64_t v61 = 512;
          uint64_t v37 = *v23++;
          unint64_t v38 = NewResourceData(v36, v56, v55, *(void **)(v57 + 40), (uint64_t)v60, (uint64_t)v27, &v66, v37, v35);
          dispatch_data_t concat = dispatch_data_create_concat(v35, v38);

          double v34 = (char *)v34 + 1;
          double v35 = concat;
        }
        while (v32 != v34);
        id v32 = [v30 countByEnumeratingWithState:&v62 objects:v69 count:16];
      }
      while (v32);
      size_t v39 = 80 * v66;
      uint64_t v20 = v50;
      uint64_t v26 = v48;
      double v40 = v49;
    }
    else
    {
      size_t v39 = 0;
      double v40 = v21;
    }

    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472;
    destructor[2] = __28__GTMTLReplayService_fetch___block_invoke_2;
    destructor[3] = &__block_descriptor_48_e5_v8__0l;
    destructor[4] = v27;
    destructor[5] = v26;
    dispatch_data_t v42 = dispatch_data_create(v27, v39, 0, destructor);
    [v51 setObject:v42 forKey:@"info"];
    [v51 setObject:concat forKey:@"data"];
    id v43 = [*(id *)(v57 + 48) copy];
    [v51 setObject:v43 forKey:@"unknown"];

    id v44 = objc_opt_new();
    [v44 setRequestID:[*(id *)(v57 + 32) requestID]];
    id v45 = [v51 copy];
    id v58 = 0;
    unsigned int v46 = +[NSKeyedArchiver archivedDataWithRootObject:v45 requiringSecureCoding:1 error:&v58];
    id v47 = v58;
    [v44 setData:v46];

    [v44 setError:v47];
    (*(void (**)(void))(*(void *)(v57 + 56) + 16))();

    id v7 = v53;
    id v5 = v54;
  }
  else
  {
    double v41 = objc_opt_new();
    [v41 setRequestID:[*(id *)(a1 + 32) requestID]];
    [v41 setData:0];
    [v41 setError:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __28__GTMTLReplayService_fetch___block_invoke_2(uint64_t a1)
{
  uint64_t result = vm_deallocate(mach_task_self_, *(void *)(a1 + 32), *(void *)(a1 + 40));
  *(void *)(a1 + 32) = 0;
  return result;
}

- (id)query:(id)a3
{
  id v4 = a3;
  id v68 = self;
  clientContext = self->_clientContext;
  id v69 = [v4 requestID];
  id v6 = [[GTReplayerOperationBatch alloc] initWithRequestID:v69];
  group = dispatch_group_create();
  id v7 = objc_alloc((Class)NSMutableArray);
  uint64_t v8 = [v4 requests];
  id v9 = [v7 initWithCapacity:[v8 count]];

  uint64_t v10 = [v4 requests];
  id v11 = [v10 count];

  if (v11)
  {
    unint64_t v12 = 0;
    do
    {
      id v13 = objc_opt_new();
      [v9 setObject:v13 atIndexedSubscript:v12];

      ++v12;
      uint64_t v14 = [v4 requests];
      id v15 = [v14 count];
    }
    while ((unint64_t)v15 > v12);
  }
  uint64_t v16 = [v4 requests];
  id v17 = [v16 count];

  if (v17)
  {
    unint64_t v18 = 0;
    do
    {
      id v19 = [v4 requests];
      uint64_t v20 = [v19 objectAtIndexedSubscript:v18];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v20;
        [v21 dispatchUID];
        [v21 dispatchUID];
        id v22 = [v21 streamRef];
        id v23 = [v21 requestID];

        id v24 = [GTReplayerOperation alloc];
        v113[0] = _NSConcreteStackBlock;
        v113[1] = 3221225472;
        v113[2] = __28__GTMTLReplayService_query___block_invoke;
        v113[3] = &unk_744A90;
        uint64_t v115 = clientContext;
        id v116 = v22;
        id v117 = v23;
        uint64_t v114 = (NSURL *)v9;
        int v118 = v18;
        id v25 = [(GTReplayerOperation *)v24 initWithBatch:v6 withBlock:v113];
        [(GTReplayerOperationBatch *)v6 addOperation:v25];

        uint64_t v26 = v114;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v20;
          unsigned int v28 = [v27 dispatchUID];
          unint64_t v29 = (unint64_t)[v27 dispatchUID] >> 32;
          id v30 = [v27 requestID];

          id v31 = [GTReplayerOperation alloc];
          v106[0] = _NSConcreteStackBlock;
          v106[1] = 3221225472;
          v106[2] = __28__GTMTLReplayService_query___block_invoke_2;
          v106[3] = &unk_744A90;
          id v108 = v30;
          id v109 = clientContext;
          unsigned int v110 = v28;
          int v111 = v29;
          CFStringRef v107 = (NSURL *)v9;
          int v112 = v18;
          id v32 = [(GTReplayerOperation *)v31 initWithBatch:v6 withBlock:v106];
          [(GTReplayerOperationBatch *)v6 addOperation:v32];

          uint64_t v26 = v107;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v33 = [v20 requestID];
            double v34 = [GTReplayerOperation alloc];
            v102[0] = _NSConcreteStackBlock;
            v102[1] = 3221225472;
            v102[2] = __28__GTMTLReplayService_query___block_invoke_3;
            v102[3] = &unk_744AB8;
            id v104 = v33;
            id v103 = (NSURL *)v9;
            int v105 = v18;
            double v35 = [(GTReplayerOperation *)v34 initWithBatch:v6 withBlock:v102];
            [(GTReplayerOperationBatch *)v6 addOperation:v35];

            uint64_t v26 = v103;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v36 = [v20 requestID];
              uint64_t v37 = [GTReplayerOperation alloc];
              v97[0] = _NSConcreteStackBlock;
              v97[1] = 3221225472;
              v97[2] = __28__GTMTLReplayService_query___block_invoke_4;
              v97[3] = &unk_744AE0;
              id v99 = clientContext;
              id v100 = v36;
              id v98 = (NSURL *)v9;
              int v101 = v18;
              unint64_t v38 = [(GTReplayerOperation *)v37 initWithBatch:v6 withBlock:v97];
              [(GTReplayerOperationBatch *)v6 addOperation:v38];

              uint64_t v26 = v98;
            }
            else
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v39 = [v20 requestID];
                double v40 = [GTReplayerOperation alloc];
                v92[0] = _NSConcreteStackBlock;
                v92[1] = 3221225472;
                v92[2] = __28__GTMTLReplayService_query___block_invoke_5;
                v92[3] = &unk_744AE0;
                int v94 = clientContext;
                id v95 = v39;
                uint64_t v93 = (NSURL *)v9;
                int v96 = v18;
                double v41 = [(GTReplayerOperation *)v40 initWithBatch:v6 withBlock:v92];
                [(GTReplayerOperationBatch *)v6 addOperation:v41];

                uint64_t v26 = v93;
              }
              else
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v42 = v20;
                  id v66 = [v42 requestID];
                  id v67 = [v42 dispatchUID];
                  v121[0] = @"requestID";
                  id v43 = +[NSNumber numberWithUnsignedLongLong:v66];
                  v122[0] = v43;
                  v121[1] = @"functionIndex";
                  id v44 = [v42 dispatchUID];

                  id v45 = +[NSNumber numberWithUnsignedLongLong:v44];
                  v122[1] = v45;
                  v122[2] = &off_759858;
                  v121[2] = @"object";
                  v121[3] = @"type";
                  v122[3] = &off_759870;
                  unsigned int v46 = +[NSDictionary dictionaryWithObjects:v122 forKeys:v121 count:4];

                  dispatch_group_enter(group);
                  v85[0] = _NSConcreteStackBlock;
                  v85[1] = 3221225472;
                  v85[2] = __28__GTMTLReplayService_query___block_invoke_79;
                  v85[3] = &unk_744B28;
                  id v86 = v46;
                  id v89 = v66;
                  id v90 = v67;
                  id v87 = v9;
                  int v91 = v18;
                  id v88 = group;
                  uint64_t v26 = v46;
                  FetchResourceObject((id *)&clientContext->var0, v26, v85);

                  id v47 = v86;
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v48 = [v20 requestID];
                    id v49 = [GTReplayerOperation alloc];
                    v81[0] = _NSConcreteStackBlock;
                    v81[1] = 3221225472;
                    v81[2] = __28__GTMTLReplayService_query___block_invoke_3_95;
                    v81[3] = &unk_744AB8;
                    id v83 = v48;
                    id v82 = (NSURL *)v9;
                    int v84 = v18;
                    id v50 = [(GTReplayerOperation *)v49 initWithBatch:v6 withBlock:v81];
                    [(GTReplayerOperationBatch *)v6 addOperation:v50];

                    uint64_t v26 = v82;
                    goto LABEL_24;
                  }
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    uint64_t v26 = (NSURL *)objc_opt_new();
                    -[NSURL setRequestID:](v26, "setRequestID:", [v20 requestID]);
                    id v55 = objc_alloc((Class)NSError);
                    NSErrorUserInfoKey v119 = NSLocalizedDescriptionKey;
                    CFStringRef v120 = @"unknown request";
                    uint64_t v56 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
                    id v57 = [v55 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v56];
                    [(NSURL *)v26 setError:v57];

                    [v9 setObject:v26 atIndexedSubscript:v18];
                    goto LABEL_24;
                  }
                  id v51 = [v20 requestID];
                  uint64_t v52 = v68->_gputrace;
                  id v53 = [GTReplayerOperation alloc];
                  v76[0] = _NSConcreteStackBlock;
                  v76[1] = 3221225472;
                  v76[2] = __28__GTMTLReplayService_query___block_invoke_4_98;
                  v76[3] = &unk_744B50;
                  uint64_t v77 = v52;
                  id v79 = v51;
                  id v78 = v9;
                  int v80 = v18;
                  uint64_t v26 = v52;
                  id v54 = [(GTReplayerOperation *)v53 initWithBatch:v6 withBlock:v76];
                  [(GTReplayerOperationBatch *)v6 addOperation:v54];

                  id v47 = v77;
                }
              }
            }
          }
        }
      }
LABEL_24:

      ++v18;
      id v58 = [v4 requests];
      id v59 = [v58 count];
    }
    while ((unint64_t)v59 > v18);
  }
  id v60 = [GTReplayerOperation alloc];
  v71[0] = _NSConcreteStackBlock;
  v71[1] = 3221225472;
  id v71[2] = __28__GTMTLReplayService_query___block_invoke_5_103;
  v71[3] = &unk_744B78;
  v72 = group;
  id v73 = v9;
  id v74 = v4;
  id v75 = v69;
  id v61 = v4;
  id v62 = v9;
  long long v63 = group;
  long long v64 = [(GTReplayerOperation *)v60 initWithBatch:v6 withBlock:v71];
  [(GTReplayerOperationBatch *)v6 addOperation:v64];
  [(GTReplayerOperationBatch *)v6 finish:clientContext->var7.var0];

  return 0;
}

void __28__GTMTLReplayService_query___block_invoke_5_103(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = objc_opt_new();
  id v3 = [*(id *)(a1 + 40) copy];
  id v7 = 0;
  id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
  id v5 = v7;
  [v2 setData:v4];

  [v2 setError:v5];
  [v2 setRequestID:*(void *)(a1 + 56)];
  id v6 = [*(id *)(a1 + 48) completionHandler];

  ((void (**)(void, void *))v6)[2](v6, v2);
}

void __28__GTMTLReplayService_query___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v3)
    {
      uint64_t v4 = *(void *)(a1 + 48);
      unint64_t v12 = 0;
      id v5 = GTMTLReplayClient_queryRasterMap(v3, v4, &v12);
      id v6 = v12;
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      CFStringRef v14 = @"Query request happened before replayer data source is loaded";
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v6 = [v7 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v8];

      id v5 = 0;
    }
    id v9 = objc_alloc_init((Class)GTReplayResponse);
    [v9 setRequestID:*(void *)(a1 + 56)];
    if (v6)
    {
      [v9 setData:0];
    }
    else
    {
      id v11 = 0;
      uint64_t v10 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v11];
      id v6 = v11;
      [v9 setData:v10];
    }
    [v9 setError:v6];
    [*(id *)(a1 + 32) setObject:v9 atIndexedSubscript:*(int *)(a1 + 64)];
  }
}

void __28__GTMTLReplayService_query___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    id v3 = objc_alloc_init((Class)GTReplayResponse);
    [v3 setRequestID:*(void *)(a1 + 40)];
    uint64_t v4 = *(unsigned int **)(*(void *)(a1 + 48) + 8);
    if (v4)
    {
      unint64_t v5 = *(unsigned int *)(a1 + 56);
      unint64_t v6 = *(unsigned int *)(a1 + 60);
      id v18 = 0;
      int v7 = GTMTLReplayClient_generateFunctionResourceUsageInfoV2(v4, v5, v6, &v18);
      id v8 = v18;
      if (v7)
      {
        id v17 = 0;
        id v9 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v17];
        id v10 = v17;
        [v3 setData:v9];

        [v3 setError:v10];
      }
      else
      {
        id v14 = objc_alloc((Class)NSError);
        v21[0] = NSLocalizedDescriptionKey;
        v21[1] = NSLocalizedRecoverySuggestionErrorKey;
        v22[0] = @"resource usage error";
        v22[1] = @"query again?";
        id v15 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
        id v16 = [v14 initWithDomain:NSCocoaErrorDomain code:1 userInfo:v15];
        [v3 setError:v16];

        id v10 = 0;
      }
    }
    else
    {
      id v11 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
      CFStringRef v20 = @"Query request happened before replayer data source is loaded";
      unint64_t v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      id v13 = [v11 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v12];
      [v3 setError:v13];

      id v10 = 0;
      id v8 = 0;
    }
    [*(id *)(a1 + 32) setObject:v3 atIndexedSubscript:*(int *)(a1 + 64)];
  }
}

void __28__GTMTLReplayService_query___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    uint64_t v3 = GTMTLDeviceCapabilitiesQuery();
    id v5 = objc_alloc_init((Class)GTReplayResponse);
    [v5 setRequestID:*(void *)(a1 + 40)];
    uint64_t v4 = +[NSData dataWithBytesNoCopy:v3 length:GTMTLDeviceCapabilitiesSize() freeWhenDone:0];
    [v5 setData:v4];

    [v5 setError:0];
    [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:*(int *)(a1 + 48)];
  }
}

void __28__GTMTLReplayService_query___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v3)
    {
      uint64_t v4 = [*(id *)(v3 + 8) defaultDevice];
      id v5 = DYMTLReplayFrameProfiler_loadAnalysis(v4);

      id v6 = 0;
    }
    else
    {
      id v7 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
      CFStringRef v13 = @"Query request happened before replayer data source is loaded";
      id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      id v6 = [v7 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v8];

      id v5 = 0;
    }
    id v9 = objc_opt_new();
    [v9 setRequestID:*(void *)(a1 + 48)];
    if (v6)
    {
      [v9 setData:0];
    }
    else
    {
      id v11 = 0;
      id v10 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v11];
      id v6 = v11;
      [v9 setData:v10];
    }
    [v9 setError:v6];
    [*(id *)(a1 + 32) setObject:v9 atIndexedSubscript:*(int *)(a1 + 56)];
  }
}

void __28__GTMTLReplayService_query___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 24)) {
    return;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v3)
  {
    uint64_t v4 = [*(id *)(v3 + 8) defaultDevice];
    GTDeviceCapabilities_fromDevice();

    if (!GTDeviceCapabilities_isAGX())
    {
      id v5 = [*(id *)(v3 + 8) defaultDevice];
      if (objc_opt_respondsToSelector())
      {
        id v14 = [(NSNumber *)v5 currentPerformanceState];
        v22[0] = @"enabled";
        id v15 = +[NSNumber numberWithBool:v14 != 0];
        id v23 = v15;
        id v24 = &__kCFBooleanTrue;
        v22[1] = @"supported";
        void v22[2] = @"PerformanceStateAssertion";
        id v16 = +[NSNumber numberWithInteger:v14];
        id v25 = v16;
        CFStringRef v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:v22 count:3];
      }
      else
      {
        CFStringRef v13 = &off_759490;
      }
      goto LABEL_15;
    }
    ExpectedState(v3);
    id v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    id v25 = 0;
    LOBYTE(v24) = 0;
    id v23 = 0;
    id v6 = [*(id *)(v3 + 8) defaultDevice];
    GTAGXPerfStateControl::InitWithDevice((uint64_t)&v23, v6);

    GTAGXPerfStateControl::ConsistentGPUPerfStateLevel((GTAGXPerfStateControl *)&v23, v5);
    id v7 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    if (GTDeviceCapabilities_isAGX3())
    {
      id v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];
      [v8 setObject:&off_759D68 forKeyedSubscript:@"gen"];
      id v9 = (_UNKNOWN **)[v8 copy];
    }
    else
    {
      if (!GTDeviceCapabilities_isAGX2())
      {
        CFStringRef v13 = v7;
        goto LABEL_14;
      }
      id v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];
      [v8 setObject:&off_759D80 forKeyedSubscript:@"gen"];
      id v9 = (_UNKNOWN **)[v8 copy];
    }
    CFStringRef v13 = v9;

LABEL_14:
    GTAGXPerfStateControl::~GTAGXPerfStateControl(&v23);
LABEL_15:

    id v12 = 0;
    goto LABEL_16;
  }
  id v10 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
  CFStringRef v21 = @"Query request happened before replayer data source is loaded";
  id v11 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v12 = [v10 initWithDomain:@"com.apple.gputools.MTLReplayer" code:104 userInfo:v11];

  CFStringRef v13 = 0;
LABEL_16:
  id v17 = objc_opt_new();
  [v17 setRequestID:*(void *)(a1 + 48)];
  if (v12)
  {
    [v17 setData:0];
  }
  else
  {
    id v19 = 0;
    id v18 = +[NSKeyedArchiver archivedDataWithRootObject:v13 requiringSecureCoding:1 error:&v19];
    id v12 = v19;
    [v17 setData:v18];
  }
  [v17 setError:v12];
  [*(id *)(a1 + 32) setObject:v17 atIndexedSubscript:*(int *)(a1 + 56)];
}

void __28__GTMTLReplayService_query___block_invoke_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = 0;
  memset(buffer, 0, sizeof(buffer));
  CFStringRef v24 = @"MTLBuffer-0xfffffffffffffabd-Fetch";
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  id v8 = +[NSNumber numberWithUnsignedLongLong:v5];
  id v25 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  id v10 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
  id v22 = v10;
  uint64_t v23 = *(void *)(a1 + 32);
  id v11 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v12 = NewResourceData(v7, v6, v9, v11, 0, (uint64_t)buffer, &v21, *(void *)(a1 + 64), &_dispatch_data_empty);

  dispatch_data_t v13 = dispatch_data_create(buffer, 0x50uLL, 0, &__block_literal_global_85);
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  [v14 setObject:v13 forKey:@"info"];
  [v14 setObject:v12 forKey:@"data"];
  id v15 = objc_alloc_init((Class)GTReplayResponse);
  [v15 setRequestID:*(void *)(a1 + 56)];
  id v16 = [v14 copy];
  id v19 = 0;
  id v17 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:1 error:&v19];
  id v18 = v19;
  [v15 setData:v17];

  [v15 setError:v18];
  [*(id *)(a1 + 40) setObject:v15 atIndexedSubscript:*(int *)(a1 + 72)];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __28__GTMTLReplayService_query___block_invoke_3_95(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    id v3 = objc_alloc_init((Class)GTReplayConfiguration);
    [v3 setForceLoadActionClear:dword_77313C & 1];
    [v3 setForceLoadUnusedResources:(dword_77313C >> 10) & 1];
    [v3 setForceWaitUntilCompleted:(dword_77313C >> 1) & 1];
    [v3 setDisableOptimizeRestores:(dword_77313C >> 4) & 1];
    [v3 setEnableDisplayOnDevice:(dword_77313C & 0x20) == 0];
    [v3 setDisableHeapTextureCompression:(dword_77313C >> 13) & 1];
    [v3 setEnableReplayFromOtherPlatforms:(dword_77313C >> 19) & 1];
    [v3 setEnableCapture:HIBYTE(dword_77313C) & 1];
    [v3 setEnableHUD:(dword_77313C >> 25) & 1];
    uint64_t v4 = objc_opt_new();
    [v4 setRequestID:*(void *)(a1 + 40)];
    id v7 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
    id v6 = v7;
    [v4 setData:v5];

    [v4 setError:v6];
    [*(id *)(a1 + 32) setObject:v4 atIndexedSubscript:*(int *)(a1 + 48)];
  }
}

void __28__GTMTLReplayService_query___block_invoke_4_98(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 24))
  {
    id v3 = objc_opt_new();
    [v3 setGputraceURL:*(void *)(a1 + 32)];
    [v3 setShaderDebuggerVersion:3];
    [v3 setShaderProfilerVersion:4];
    [v3 setAccelerationViewerVersion:11];
    uint64_t v4 = objc_opt_new();
    [v4 setRequestID:*(void *)(a1 + 48)];
    id v7 = 0;
    uint64_t v5 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v7];
    id v6 = v7;
    [v4 setData:v5];

    [v4 setError:v6];
    [*(id *)(a1 + 40) setObject:v4 atIndexedSubscript:*(int *)(a1 + 56)];
  }
}

- (void)notifyError:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __34__GTMTLReplayService_notifyError___block_invoke;
  v7[3] = &unk_744A68;
  id v8 = v4;
  id v6 = v4;
  [(GTObservableService *)observers notifyAll:v7];
}

id __34__GTMTLReplayService_notifyError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 notifyError:*(void *)(a1 + 32)];
}

- (void)broadcastDisconnect:(id)a3 path:(id)a4
{
  id v9 = a4;
  id v6 = [a3 connection];
  id v7 = v6;
  if (v6 == self->_terminateConnection)
  {
    int v8 = MessagePathEndsWith();

    if (v8) {
      [(GTMTLReplayService *)self terminateProcess];
    }
  }
  else
  {
  }
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
}

- (void)deregisterObserver:(unint64_t)a3
{
}

- (unint64_t)registerObserver:(id)a3
{
  return (unint64_t)[(GTObservableService *)self->_observers registerObserver:a3];
}

- (void)terminateProcess
{
  clientContext = self->_clientContext;
  if (clientContext && clientContext->var0) {
    apr_pool_destroy(clientContext->var0);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &__block_literal_global_36);
}

void __38__GTMTLReplayService_terminateProcess__block_invoke(id a1)
{
}

- (BOOL)load:(id)a3 error:(id *)a4
{
  id v6 = a3;
  clientContext = self->_clientContext;
  objc_storeStrong((id *)&self->_gputrace, a3);
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id var0 = clientContext->var7.var0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __33__GTMTLReplayService_load_error___block_invoke;
  v11[3] = &unk_746960;
  dispatch_data_t v13 = &v15;
  id v14 = clientContext;
  id v9 = v6;
  id v12 = v9;
  [var0 addOperationWithBlock:v11];
  [clientContext->var7.var0 waitUntilAllOperationsAreFinished];
  LOBYTE(var0) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)var0;
}

void __33__GTMTLReplayService_load_error___block_invoke(void *a1)
{
  uint64_t v2 = (apr_pool_t **)a1[6];
  id v3 = (void *)a1[4];
  id v4 = GTTransportArchiveDirectory();
  id v5 = v3;
  id v11 = v4;
  id v6 = &__block_literal_global_870;
  if (v5
    && ([v5 scheme],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isEqualToString:NSURLFileScheme],
        v7,
        v8))
  {
    if ([v5 startAccessingSecurityScopedResource]) {
      apr_pool_cleanup_register(*v2, v5, (apr_status_t (__cdecl *)(void *))CleanupSandboxExtensionURL, apr_pool_cleanup_null);
    }
    id v9 = [v5 path];
    BOOL v10 = BeginDebugArchivePath(v2, v9, v11, 0, &__block_literal_global_870);
  }
  else
  {
    BOOL v10 = 0;
  }

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v10;
}

- (GTMTLReplayService)initWithContext:(GTMTLReplayClient *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GTMTLReplayService;
  id v4 = [(GTMTLReplayService *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    v4->_clientContext = a3;
    uint64_t v6 = objc_opt_new();
    observers = v5->_observers;
    v5->_observers = (GTObservableService *)v6;

    id var0 = a3->var0;
    control = (uint64_t)apr_palloc(var0, 0x48uLL);
    pthread_mutex_init((pthread_mutex_t *)(control + 8), 0);
    *(void *)control = apr_hash_make(var0);
  }
  return v5;
}

@end