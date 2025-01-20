@interface _ANEProgramForEvaluation
+ (id)new;
+ (id)programWithController:(id)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5;
+ (id)programWithHandle:(unint64_t)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5;
- (BOOL)processInputBuffers:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)processOutputSet:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6;
- (BOOL)processRequest:(id)a3 model:(id)a4 qos:(unsigned int)a5 qIndex:(unint64_t)a6 modelStringID:(unint64_t)a7 options:(id)a8 returnValue:(unsigned int *)a9 error:(id *)a10;
- (OS_dispatch_semaphore)requestsInFlight;
- (_ANEDeviceController)controller;
- (_ANEProgramForEvaluation)init;
- (_ANEProgramForEvaluation)initWithController:(id)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5;
- (char)queueDepth;
- (id)description;
- (id)programInferenceOtherErrorForMessage:(ANENotificationMessageStruct *)a3 model:(id)a4 methodName:(id)a5;
- (int64_t)currentAsyncRequestsInFlight;
- (unint64_t)intermediateBufferHandle;
- (unint64_t)programHandle;
- (void)dealloc;
- (void)setCurrentAsyncRequestsInFlight:(int64_t)a3;
- (void)setIntermediateBufferHandle:(unint64_t)a3;
- (void)setProgramHandle:(unint64_t)a3;
@end

@implementation _ANEProgramForEvaluation

+ (id)new
{
  return 0;
}

- (_ANEProgramForEvaluation)init
{
  return 0;
}

+ (id)programWithHandle:(unint64_t)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5
{
  uint64_t v5 = a5;
  v8 = +[_ANEDeviceController controllerWithProgramHandle:a3];
  id v9 = [objc_alloc((Class)a1) initWithController:v8 intermediateBufferHandle:a4 queueDepth:v5];

  return v9;
}

+ (id)programWithController:(id)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithController:v8 intermediateBufferHandle:a4 queueDepth:v5];

  return v9;
}

- (_ANEProgramForEvaluation)initWithController:(id)a3 intermediateBufferHandle:(unint64_t)a4 queueDepth:(char)a5
{
  int v5 = a5;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_ANEProgramForEvaluation;
  v10 = [(_ANEProgramForEvaluation *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_controller, a3);
    v11->_programHandle = (unint64_t)[v9 programHandle];
    v11->_intermediateBufferHandle = a4;
    v11->_queueDepth = v5;
    dispatch_semaphore_t v12 = dispatch_semaphore_create(v5);
    requestsInFlight = v11->_requestsInFlight;
    v11->_requestsInFlight = (OS_dispatch_semaphore *)v12;

    v11->_currentAsyncRequestsInFlight = 0;
    [(_ANEDeviceController *)v11->_controller start];
  }

  return v11;
}

- (void)dealloc
{
  [(_ANEDeviceController *)self->_controller stop];
  controller = self->_controller;
  self->_controller = 0;

  v4.receiver = self;
  v4.super_class = (Class)_ANEProgramForEvaluation;
  [(_ANEProgramForEvaluation *)&v4 dealloc];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  int v5 = +[NSString stringWithFormat:@"%@: { programHandle=%llu : intermediateBufferHandle=%llu : queueDepth=%d }", v4, [(_ANEProgramForEvaluation *)self programHandle], [(_ANEProgramForEvaluation *)self intermediateBufferHandle], [(_ANEProgramForEvaluation *)self queueDepth]];

  return v5;
}

- (id)programInferenceOtherErrorForMessage:(ANENotificationMessageStruct *)a3 model:(id)a4 methodName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[NSString stringWithFormat:@"%@: ANEProgramProcessRequestDirect() Failed with status=0x%x : statusType=0x%x", v8, a3->var1, a3->var0];
  v10 = +[_ANELog common];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    int var0 = a3->var0;
    int var1 = a3->var1;
    *(_DWORD *)buf = 138413058;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = var1;
    __int16 v22 = 1024;
    int v23 = var0;
    __int16 v24 = 2112;
    id v25 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: ANEProgramProcessRequestDirect() Failed with status=0x%x : statusType=0x%x lModel=%@", buf, 0x22u);
  }

  int v11 = a3->var1;
  if (v11 == 14)
  {
    dispatch_semaphore_t v12 = +[NSString stringWithFormat:@"%@: Program not found", v9];
    uint64_t v13 = +[_ANEErrors programInferenceProgramNotFoundForMethod:v12];
    goto LABEL_7;
  }
  if (v11 == 15)
  {
    dispatch_semaphore_t v12 = +[NSString stringWithFormat:@"%@: Program Inference timeout", v9];
    uint64_t v13 = +[_ANEErrors timeoutErrorForMethod:v12];
LABEL_7:
    v14 = (void *)v13;

    goto LABEL_9;
  }
  v14 = +[_ANEErrors programInferenceOtherErrorForMethod:v9];
LABEL_9:

  return v14;
}

- (BOOL)processRequest:(id)a3 model:(id)a4 qos:(unsigned int)a5 qIndex:(unint64_t)a6 modelStringID:(unint64_t)a7 options:(id)a8 returnValue:(unsigned int *)a9 error:(id *)a10
{
  uint64_t v10 = __chkstk_darwin(self, a2, a3, a4, *(void *)&a5, a6, a7, a8);
  dispatch_semaphore_t v12 = v11;
  uint64_t v122 = v14;
  aSelector = v13;
  int v16 = v15;
  int v126 = v17;
  id v19 = v18;
  v127 = (void *)v10;
  id v21 = v20;
  id v22 = v19;
  id v128 = v12;
  uint64_t v158 = 0;
  v159 = &v158;
  uint64_t v160 = 0x3032000000;
  v161 = sub_10000A49C;
  v162 = sub_10000A4AC;
  id v163 = 0;
  uint64_t v154 = 0;
  v155 = &v154;
  uint64_t v156 = 0x2020000000;
  char v157 = 1;
  id v129 = v22;
  unsigned __int8 v23 = [v21 validate];
  *((unsigned char *)v155 + 24) = v23;
  if ((v23 & 1) == 0)
  {
LABEL_12:
    BOOL v31 = 0;
    goto LABEL_83;
  }
  dispatch_time_t v24 = dispatch_time(0, 10000000000);
  id v25 = [v21 completionHandler];
  if (v25)
  {
    BOOL v124 = 0;
  }
  else
  {
    v26 = [v21 sharedEvents];
    BOOL v124 = v26 == 0;
  }
  v27 = +[_ANELog common];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v111 = NSStringFromSelector(aSelector);
    unsigned int v173 = 138412802;
    id v174 = v111;
    __int16 v175 = 2112;
    *(void *)v176 = v129;
    *(_WORD *)&v176[8] = 1024;
    *(_DWORD *)&v176[10] = v124;
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "%@ ANEProgramProcessRequestDirect() for lModel %@ waitForResults is %d", (uint8_t *)&v173, 0x1Cu);
  }
  if (!v124)
  {
    v28 = [v127 requestsInFlight];
    BOOL v29 = dispatch_semaphore_wait(v28, v24) == 0;

    if (!v29)
    {
      v30 = +[_ANELog common];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(aSelector);
        id v114 = (id)objc_claimAutoreleasedReturnValue();
        signed int v115 = [v127 queueDepth];
        id v116 = [v127 currentAsyncRequestsInFlight];
        unsigned int v173 = 138413314;
        id v174 = v114;
        __int16 v175 = 1024;
        *(_DWORD *)v176 = 15;
        *(_WORD *)&v176[4] = 2048;
        *(void *)&v176[6] = v115;
        __int16 v177 = 2048;
        id v178 = v116;
        __int16 v179 = 2112;
        id v180 = v129;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@: Async Request could not be queued - timed out ret=0x%xself.queueDepth=%ld : self.currentAsyncRequestsInFlight=%ld lModel=%@", (uint8_t *)&v173, 0x30u);
      }
      goto LABEL_12;
    }
    objc_msgSend(v127, "setCurrentAsyncRequestsInFlight:", (char *)objc_msgSend(v127, "currentAsyncRequestsInFlight") + 1);
  }
  bzero(&v173, 0x3030uLL);
  uint64_t v150 = 0;
  v151 = &v150;
  uint64_t v152 = 0x2020000000;
  int v153 = 0;
  v32 = [v128 objectForKeyedSubscript:kANEFPerformanceStatsMaskKey];
  v121 = v32;
  if (v32)
  {
    if (([v32 unsignedIntValue] & 4) != 0)
    {
      long long v149 = 0u;
      long long v148 = 0u;
      long long v147 = 0u;
      long long v146 = 0u;
      v33 = [v21 perfStatsArray];
      id v34 = [v33 countByEnumeratingWithState:&v146 objects:v172 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v147;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v147 != v35) {
              objc_enumerationMutation(v33);
            }
            v37 = *(void **)(*((void *)&v146 + 1) + 8 * i);
            if ([v37 statType] == (id)2)
            {
              v38 = [v37 stats];
              id v189 = [v38 ioSurface];
            }
          }
          id v34 = [v33 countByEnumeratingWithState:&v146 objects:v172 count:16];
        }
        while (v34);
      }
    }
    LODWORD(v32) = +[_ANEPerformanceStats driverMaskForANEFMask:](_ANEPerformanceStats, "driverMaskForANEFMask:", [v121 unsignedIntValue]);
  }
  int v190 = (int)v32;
  *((_DWORD *)v151 + 6) = v32;
  v39 = [v21 inputArray];
  LODWORD(v174) = [v39 count];

  for (unsigned int j = 0; ; unsigned int j = v42 + 1)
  {
    v41 = [v21 inputArray];
    uint64_t v42 = j;
    BOOL v43 = (unint64_t)[v41 count] > j;

    if (!v43) {
      break;
    }
    v44 = [v21 inputArray];
    v45 = [v44 objectAtIndexedSubscript:v42];
    *(id *)((char *)&v174 + 24 * v42 + 4) = [v45 ioSurface];

    v46 = [v21 inputIndexArray];
    v47 = [v46 objectAtIndexedSubscript:v42];
    *(_DWORD *)&v176[24 * v42 + 2] = [v47 unsignedIntegerValue];

    v48 = [v21 inputArray];
    v49 = [v48 objectAtIndexedSubscript:v42];
    v50 = [v49 startOffset];
    *((_DWORD *)&v177 + 6 * v42) = [v50 unsignedIntegerValue];
  }
  v51 = [v21 outputArray];
  unsigned int v181 = [v51 count];

  for (unsigned int k = 0; ; unsigned int k = v54 + 1)
  {
    v53 = [v21 outputArray];
    uint64_t v54 = k;
    BOOL v55 = (unint64_t)[v53 count] > k;

    if (!v55) {
      break;
    }
    v56 = [v21 outputArray];
    v57 = [v56 objectAtIndexedSubscript:v54];
    v182[3 * v54] = [v57 ioSurface];

    v58 = [v21 outputIndexArray];
    v59 = [v58 objectAtIndexedSubscript:v54];
    LODWORD(v182[3 * v54 + 1]) = [v59 unsignedIntegerValue];

    v60 = [v21 outputArray];
    v61 = [v60 objectAtIndexedSubscript:v54];
    v62 = [v61 startOffset];
    HIDWORD(v182[3 * v54 + 2]) = [v62 unsignedIntegerValue];
  }
  v63 = [v21 weightsBuffer];
  BOOL v64 = v63 == 0;

  if (!v64)
  {
    v65 = [v21 weightsBuffer];
    id v188 = [v65 ioSurface];
  }
  v66 = [v21 procedureIndex];
  unsigned int v173 = [v66 unsignedIntegerValue];

  v182[769] = [v127 programHandle];
  int v183 = v16;
  int v185 = v126;
  int v184 = 0;
  v67 = [v128 objectForKeyedSubscript:kANEFDisableIOFencesUseSharedEventsKey];
  v119 = v67;
  if (v67)
  {
    unsigned __int8 v186 = [v67 BOOLValue];
    v68 = +[_ANELog common];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      [v119 BOOLValue];
      sub_100023D08();
    }
  }
  else
  {
    unsigned __int8 v186 = 0;
  }
  v69 = [v128 objectForKeyedSubscript:kANEFEnableFWToFWSignal];
  v120 = v69;
  if (v69)
  {
    unsigned __int8 v187 = [v69 BOOLValue];
    v70 = +[_ANELog common];
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      objc_claimAutoreleasedReturnValue();
      [v120 BOOLValue];
      sub_100023CB8();
    }
  }
  else
  {
    unsigned __int8 v187 = 0;
  }
  v71 = &v145;
  for (uint64_t m = 2; m != 514; m += 8)
    *(void *)&v143[m] = 0;
  for (uint64_t n = 514; n != 1026; n += 8)
    *(void *)&v143[n] = 0;
  v74 = [v21 sharedEvents];
  BOOL v75 = v74 == 0;

  if (v75)
  {
    v96 = 0;
  }
  else
  {
    bzero(v143, 0x1008uLL);
    v76 = [v21 sharedEvents];
    v77 = [v76 signalEvents];
    unsigned int v78 = [v77 count];
    v143[1] = v78;
    if (v78)
    {
      uint64_t v79 = 0;
      uint64_t v80 = v78;
      uint64_t v117 = 134218240;
      do
      {
        v81 = objc_msgSend(v77, "objectAtIndexedSubscript:", v79, v117);
        uint64_t v82 = [v81 sharedEvent];
        v83 = (void *)*v71;
        uint64_t *v71 = v82;

        v71[1] = (uint64_t)[v81 value];
        id v84 = [v81 eventType];
        if ((unint64_t)v84 >= 6)
        {
          v85 = +[_ANELog common];
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v170 = v117;
            *(void *)&v170[4] = v84;
            *(_WORD *)&v170[12] = 2048;
            *(void *)&v170[14] = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Unknown _ANESignalEventType=%lu using (%lu)", v170, 0x16u);
          }

          LODWORD(v84) = 0;
        }
        *((_DWORD *)v71 + 4) = v84;
        *((_DWORD *)v71 + 5) = [v81 symbolIndex];
        v71[3] = (uint64_t)[v81 agentMask];

        ++v79;
        v71 += 4;
      }
      while (v80 != v79);
    }
    v86 = [v76 waitEvents];
    unsigned int v87 = [v86 count];
    v143[0] = v87;
    if (v87)
    {
      uint64_t v88 = 0;
      uint64_t v89 = v87;
      v90 = &v144;
      uint64_t v118 = 134218240;
      do
      {
        v91 = objc_msgSend(v86, "objectAtIndexedSubscript:", v88, v118);
        uint64_t v92 = [v91 sharedEvent];
        v93 = (void *)*(v90 - 1);
        *(v90 - 1) = v92;

        uint64_t *v90 = (uint64_t)[v91 value];
        id v94 = [v91 eventType];
        if ((unint64_t)v94 >= 3)
        {
          v95 = +[_ANELog common];
          if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v170 = v118;
            *(void *)&v170[4] = v94;
            *(_WORD *)&v170[12] = 2048;
            *(void *)&v170[14] = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_ERROR, "Unknown _ANEWaitEventType=%lu using (%lu)", v170, 0x16u);
          }

          LODWORD(v94) = 0;
        }
        *((_DWORD *)v90 + 2) = v94;

        ++v88;
        v90 += 4;
      }
      while (v89 != v88);
    }

    v96 = v143;
  }
  v97 = [v21 completionHandler];
  *((unsigned char *)v155 + 24) = 1;
  kdebug_trace();
  *(void *)v170 = 0;
  *(void *)&v170[8] = v170;
  *(void *)&v170[16] = 0x2020000000;
  char v171 = 0;
  v98 = objc_msgSend(v127, "controller", v97);
  id v99 = [v98 device];
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_10000A4B4;
  v130[3] = &unk_10003C8D8;
  v139 = aSelector;
  int v141 = v126;
  v135 = &v154;
  v136 = &v158;
  id v100 = v129;
  id v131 = v100;
  v132 = v127;
  v137 = &v150;
  id v133 = v21;
  uint64_t v140 = v122;
  id v101 = v97;
  BOOL v142 = v124;
  id v134 = v101;
  v138 = v170;
  v102 = [v133 transactionHandle];
  id v103 = [v102 unsignedIntegerValue];
  v104 = [v133 transactionHandle];
  v105 = v130;
  if (v99 && *(void *)v99) {
    unsigned int v106 = (*(uint64_t (**)(id, unsigned int *, void *, _DWORD *, BOOL, id, BOOL))(*(void *)v99 + 32))(v99, &v173, v105, v96, v124, v103, v104 != 0);
  }
  else {
    unsigned int v106 = 2;
  }

  *a9 = v106;
  if (*a9)
  {
    if (!*(unsigned char *)(*(void *)&v170[8] + 24))
    {
      v107 = [v127 requestsInFlight];
      dispatch_semaphore_signal(v107);

      objc_msgSend(v127, "setCurrentAsyncRequestsInFlight:", (char *)objc_msgSend(v127, "currentAsyncRequestsInFlight") - 1);
    }
    v108 = +[_ANELog common];
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      v112 = NSStringFromSelector(aSelector);
      unsigned int v113 = *a9;
      int v164 = 138412802;
      v165 = v112;
      __int16 v166 = 1024;
      unsigned int v167 = v113;
      __int16 v168 = 2112;
      id v169 = v100;
      _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "%@: Could not process request ret=0x%x lModel=%@", (uint8_t *)&v164, 0x1Cu);
    }
  }
  else if (v124 && !*((unsigned char *)v155 + 24))
  {
    *a9 = 18;
  }

  _Block_object_dispose(v170, 8);
  for (uint64_t ii = 1018; ii != 506; ii -= 8)

  do
  {

    ii -= 8;
  }
  while (ii != -6);

  _Block_object_dispose(&v150, 8);
  BOOL v31 = 1;
LABEL_83:

  if (v31)
  {
    if (a10) {
      *a10 = (id) v159[5];
    }
    LOBYTE(v31) = *a9 == 0;
  }
  _Block_object_dispose(&v154, 8);
  _Block_object_dispose(&v158, 8);

  return v31;
}

- (BOOL)processOutputSet:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v13 = +[_ANELog common];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v20 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    BOOL v29 = v20;
    __int16 v30 = 2048;
    *(void *)BOOL v31 = v10;
    *(_WORD *)&v31[8] = 2112;
    *(void *)&v31[10] = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "-----> %@: processOutputSet() outputSet=%p lModel=%@ : ", buf, 0x20u);
  }
  unsigned int v24 = objc_msgSend(v10, "procedureIndex", -[_ANEProgramForEvaluation programHandle](self, "programHandle"));
  unsigned int v25 = [v10 setIndex];
  id v26 = [v10 signalValue];
  uint64_t v27 = [v10 signalNotRequired];
  BYTE1(v27) = [v10 isOpenLoop];
  uint64_t v14 = [(_ANEProgramForEvaluation *)self controller];
  id v15 = [v14 device];
  if (v15 && *(void *)v15)
  {
    int v16 = (*(uint64_t (**)(id, uint64_t *))(*(void *)v15 + 40))(v15, &v23);

    if (!v16)
    {
      BOOL v17 = 1;
      goto LABEL_11;
    }
  }
  else
  {

    int v16 = 2;
  }
  v18 = +[_ANELog common];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    id v21 = NSStringFromSelector(a2);
    unint64_t v22 = [(_ANEProgramForEvaluation *)self programHandle];
    *(_DWORD *)buf = 138413314;
    BOOL v29 = v21;
    __int16 v30 = 1024;
    *(_DWORD *)BOOL v31 = v16;
    *(_WORD *)&v31[4] = 2112;
    *(void *)&v31[6] = v11;
    *(_WORD *)&v31[14] = 2048;
    *(void *)&v31[16] = v22;
    __int16 v32 = 2048;
    id v33 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@: Could not process output set enqueue request ret=0x%x lModel=%@ programHandle=%llu signalValue=%llu", buf, 0x30u);
  }
  BOOL v17 = 0;
LABEL_11:
  if (a6) {
    *a6 = 0;
  }

  return v17;
}

- (BOOL)processInputBuffers:(id)a3 model:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v44 = a4;
  id v43 = a5;
  id v9 = +[_ANELog common];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v35 = NSStringFromSelector(a2);
    *(_DWORD *)v53 = 138412802;
    *(void *)&v53[4] = v35;
    *(_WORD *)uint64_t v54 = 2048;
    *(void *)&v54[2] = v8;
    __int16 v55 = 2112;
    id v56 = v44;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "-----> %@: processInputBuffers() inputBuffers=%p lModel=%@ : ", v53, 0x20u);
  }
  bzero(&v54[4], 0xBF8uLL);
  *(void *)v53 = [(_ANEProgramForEvaluation *)self programHandle];
  *(_DWORD *)&v53[8] = [v8 procedureIndex];
  v57[255] = [v8 executionDelay];
  id v10 = [v8 inputBufferInfoIndex];
  BOOL v11 = (unint64_t)[v10 count] > 0xFF;

  if (v11)
  {
    dispatch_semaphore_t v12 = +[_ANELog common];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      id v38 = (id)objc_claimAutoreleasedReturnValue();
      v39 = [v8 inputBufferInfoIndex];
      *(_DWORD *)buf = 138412802;
      id v48 = v38;
      __int16 v49 = 2048;
      *(void *)v50 = [v39 count];
      *(_WORD *)&v50[8] = 1024;
      *(_DWORD *)&v50[10] = 255;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: inputBuffers inputBufferInfoIndex=%lu exceeds max=%d", buf, 0x1Cu);
    }
  }
  uint64_t v13 = objc_msgSend(v8, "inputBufferInfoIndex", a6);
  *(_DWORD *)uint64_t v54 = [v13 count];

  for (unsigned int i = 0; ; unsigned int i = v16 + 1)
  {
    id v15 = [v8 inputBufferInfoIndex];
    uint64_t v16 = i;
    BOOL v17 = (unint64_t)[v15 count] > i;

    if (!v17) {
      break;
    }
    v18 = [v8 inputBufferInfoIndex];
    id v19 = [v18 objectAtIndexedSubscript:v16];
    unsigned int v20 = [v19 unsignedIntegerValue];
    *(_DWORD *)&v54[4 * v16 + 4] = v20;

    id v21 = +[_ANELog common];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v22 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v48 = v22;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v20;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "-----> %@: processInputBuffers() inputBufferInfoIndex value is %d ", buf, 0x12u);
    }
  }
  for (unsigned int j = 0; ; unsigned int j = v25 + 1)
  {
    unsigned int v24 = [v8 inputFreeValue];
    uint64_t v25 = j;
    BOOL v26 = (unint64_t)[v24 count] > j;

    if (!v26) {
      break;
    }
    uint64_t v27 = [v8 inputFreeValue];
    v28 = [v27 objectAtIndexedSubscript:v25];
    v57[v25] = [v28 unsignedIntegerValue];
  }
  BOOL v29 = [(_ANEProgramForEvaluation *)self controller];
  id v30 = [v29 device];
  if (v30 && *(void *)v30)
  {
    int v31 = (*(uint64_t (**)(id, unsigned char *))(*(void *)v30 + 48))(v30, v53);

    if (!v31)
    {
      BOOL v32 = 1;
      goto LABEL_23;
    }
  }
  else
  {

    int v31 = 2;
  }
  id v33 = +[_ANELog common];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    v36 = NSStringFromSelector(a2);
    unint64_t v37 = [(_ANEProgramForEvaluation *)self programHandle];
    *(_DWORD *)buf = 138413058;
    id v48 = v36;
    __int16 v49 = 1024;
    *(_DWORD *)v50 = v31;
    *(_WORD *)&v50[4] = 2112;
    *(void *)&v50[6] = v44;
    __int16 v51 = 2048;
    unint64_t v52 = v37;
    _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@: Could not process input ready request ret=0x%x lModel=%@ programHandle=%llu", buf, 0x26u);
  }
  BOOL v32 = 0;
LABEL_23:
  if (v41) {
    void *v41 = 0;
  }

  return v32;
}

- (_ANEDeviceController)controller
{
  return self->_controller;
}

- (unint64_t)programHandle
{
  return self->_programHandle;
}

- (void)setProgramHandle:(unint64_t)a3
{
  self->_programHandle = a3;
}

- (unint64_t)intermediateBufferHandle
{
  return self->_intermediateBufferHandle;
}

- (void)setIntermediateBufferHandle:(unint64_t)a3
{
  self->_intermediateBufferHandle = a3;
}

- (char)queueDepth
{
  return self->_queueDepth;
}

- (OS_dispatch_semaphore)requestsInFlight
{
  return self->_requestsInFlight;
}

- (int64_t)currentAsyncRequestsInFlight
{
  return self->_currentAsyncRequestsInFlight;
}

- (void)setCurrentAsyncRequestsInFlight:(int64_t)a3
{
  self->_currentAsyncRequestsInFlight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestsInFlight, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end