@interface LeakAgent
- (LeakAgent)initWithTask:(unsigned int)a3 pid:(int)a4;
- (id)getSerializedGraphWithFullDiskStackLogs:(id)a3 serializedGraph:(id)a4 error:(id *)a5;
- (id)logAndGenerateReceiptForErrorWithFormat:(id)a3;
- (id)mallocStackLogForAddress:(id)a3 size:(id)a4 isLiteZone:(id)a5;
- (id)serializedGraphWithOptions:(id)a3;
- (id)vmRegionStackLogForAddress:(id)a3 size:(id)a4;
- (void)dealloc;
@end

@implementation LeakAgent

- (LeakAgent)initWithTask:(unsigned int)a3 pid:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)LeakAgent;
  result = [(LeakAgent *)&v7 init];
  if (result)
  {
    result->_targetTask = a3;
    result->_targetPid = a4;
  }
  return result;
}

- (void)dealloc
{
  mach_port_name_t targetTask = self->_targetTask;
  if (targetTask + 1 >= 2)
  {
    mach_port_deallocate(mach_task_self_, targetTask);
    self->_mach_port_name_t targetTask = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)LeakAgent;
  [(LeakAgent *)&v4 dealloc];
}

- (id)getSerializedGraphWithFullDiskStackLogs:(id)a3 serializedGraph:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v45 = 0;
  if (a5) {
    v9 = a5;
  }
  else {
    v9 = (id *)&v45;
  }
  v10 = [v7 stackLogReader];

  if (v10)
  {
    v11 = +[NSFileManager defaultManager];
    v12 = [v11 temporaryDirectory];
    v13 = +[NSUUID UUID];
    v14 = [v13 UUIDString];
    v15 = +[NSString stringWithFormat:@"%@.memgraph", v14];
    v16 = [v12 URLByAppendingPathComponent:v15];

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000025FC;
    v43[3] = &unk_100008368;
    id v17 = v16;
    id v44 = v17;
    v18 = objc_retainBlock(v43);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100002710;
    v40[3] = &unk_100008390;
    v19 = v17;
    v41 = v19;
    v20 = v18;
    id v42 = v20;
    v21 = objc_retainBlock(v40);
    v22 = +[NSFileManager defaultManager];
    v23 = [v19 path];
    [v22 createFileAtPath:v23 contents:0 attributes:0];

    v24 = +[NSFileHandle fileHandleForWritingToURL:v19 error:v9];
    v25 = v24;
    if (!v24)
    {
      ((void (*)(void *, const char *, id))v20[2])(v20, "create", *v9);
      id v29 = 0;
LABEL_21:

      goto LABEL_22;
    }
    [v24 truncateFileAtOffset:0];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000027BC;
    v38[3] = &unk_1000083B8;
    id v39 = v7;
    unsigned __int8 v26 = +[VMUDirectedGraph encapsulateData:v8 to:v25 withSupplementalDataTag:"DISKLOGS" error:v9 dataGeneratorBlock:v38];
    [v25 closeFile];
    if ((v26 & 1) == 0)
    {
      if (!*v9)
      {
        NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
        v33 = +[NSString stringWithFormat:@"failed to write memgraph with full disk stack logs with unknown error"];
        v47 = v33;
        v34 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        id *v9 = +[NSError errorWithDomain:@"LeakAgent" code:-1 userInfo:v34];
      }
      ((void (*)(void *, const char *))v20[2])(v20, "write to");
      id v35 = (id)((uint64_t (*)(void *))v21[2])(v21);
      id v29 = 0;
      goto LABEL_20;
    }
    v27 = +[NSData dataWithContentsOfURL:v19 options:1 error:v9];
    if (v27)
    {
      ((void (*)(void *))v21[2])(v21);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      id *v9 = v28;
      if (!v28)
      {
        id v29 = v27;
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
    }
    else
    {
      ((void (*)(void *, const char *, id))v20[2])(v20, "read from", *v9);
      id v36 = (id)((uint64_t (*)(void *))v21[2])(v21);
    }
    id v29 = 0;
    goto LABEL_19;
  }
  NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
  v30 = +[NSString stringWithFormat:@"%@", @"stack log reader not present in memgraph, so can't save memgraph with full disk stack logs"];
  v51 = v30;
  v31 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  id *v9 = +[NSError errorWithDomain:@"LeakAgent" code:-1 userInfo:v31];

  v19 = sub_1000025A8();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    id v32 = [@"stack log reader not present in memgraph, so can't save memgraph with full disk stack logs" UTF8String];
    *(_DWORD *)buf = 136315138;
    id v49 = v32;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
  }
  id v29 = 0;
LABEL_22:

  return v29;
}

- (id)logAndGenerateReceiptForErrorWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v21];

  v6 = sub_1000025A8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int targetPid = self->_targetPid;
    *(_DWORD *)buf = 67109378;
    int v17 = targetPid;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to generate memory graph for pid %u: %@", buf, 0x12u);
  }

  id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to generate memory graph for pid %u: %@", self->_targetPid, v5];
  v9 = objc_opt_new();
  id v10 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
  id v15 = v8;
  v11 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v12 = [v10 initWithDomain:@"LeakAgent" code:-1 userInfo:v11];

  [v9 invokeCompletionWithReturnValue:0 error:v12];
  return v9;
}

- (id)serializedGraphWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000025A8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int targetPid = self->_targetPid;
    unsigned int targetTask = self->_targetTask;
    LODWORD(buf) = 67109634;
    DWORD1(buf) = targetPid;
    WORD4(buf) = 1024;
    *(_DWORD *)((char *)&buf + 10) = targetTask;
    HIWORD(buf) = 2112;
    *(void *)&long long v116 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "requested memgraph for %u (%#x) with options: %@", (uint8_t *)&buf, 0x18u);
  }

  id v8 = sub_1000025A8();
  if (os_signpost_enabled(v8))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Request memgraph", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
  }

  if (self->_targetTask + 1 <= 1)
  {
    uint64_t v9 = [(LeakAgent *)self logAndGenerateReceiptForErrorWithFormat:@"no valid task available"];
    goto LABEL_120;
  }
  id v10 = [v4 objectForKeyedSubscript:@"LeakedCount"];
  unsigned int v89 = [v10 BOOLValue];

  v11 = [v4 objectForKeyedSubscript:@"LeakedAddresses"];
  unsigned int v94 = [v11 BOOLValue];

  id v12 = [v4 objectForKeyedSubscript:@"MarkedCount"];
  unsigned int v88 = [v12 BOOLValue];

  v13 = [v4 objectForKeyedSubscript:@"MarkedAddresses"];
  unsigned int v90 = [v13 BOOLValue];

  NSErrorUserInfoKey v14 = [v4 objectForKeyedSubscript:@"AnalyzeCorpse"];
  v96 = v14;
  if (v14) {
    unsigned int v15 = [v14 BOOLValue];
  }
  else {
    unsigned int v15 = 0;
  }
  v16 = [v4 objectForKeyedSubscript:@"LeakedGraphOnly"];
  unsigned int v93 = [v16 BOOLValue];

  int v17 = [v4 objectForKeyedSubscript:@"CompressionOption"];
  id v95 = 0;
  uint64_t v110 = 0;
  v111 = &v110;
  uint64_t v112 = 0x2020000000;
  int v113 = 0;
  if (v94)
  {
    id v95 = +[NSMutableArray array];
  }
  __int16 v18 = [v4 objectForKeyedSubscript:@"RegionDescriptionOptions"];

  if (v18)
  {
    id v19 = [v4 objectForKeyedSubscript:@"RegionDescriptionOptions"];
    id v20 = [v19 unsignedLongValue];
  }
  else
  {
    if ((v93 & 1) == 0)
    {
      id v20 = (id)(VMUGetFlagsForAllVMRegionStatistics() | 0xC000);
      if (v17) {
        goto LABEL_17;
      }
      goto LABEL_19;
    }
    id v20 = 0;
  }
  if (v17)
  {
LABEL_17:
    BOOL v21 = (int)[v17 intValue] > 0;
    goto LABEL_20;
  }
LABEL_19:
  BOOL v21 = 1;
LABEL_20:
  BOOL v87 = v21;
  mach_port_t corpse_task_port = 0;
  uint64_t v22 = self->_targetTask;
  v23 = sub_1000025A8();
  if (os_signpost_enabled(v23))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Init memory scanner", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
  }

  if (!v15)
  {
LABEL_28:
    id v28 = [objc_alloc((Class)VMUTaskMemoryScanner) initWithTask:v22 options:v20];
    if (!v28)
    {
      uint64_t v9 = [(LeakAgent *)self logAndGenerateReceiptForErrorWithFormat:@"failed to create a VMUTaskMemoryScanner, probably because the target's libmalloc hasn't been initialized"];
      v91 = 0;
LABEL_118:

      goto LABEL_119;
    }
    id v29 = [v4 objectForKeyedSubscript:@"ScannerSettings"];

    if (v29)
    {
      v30 = [v4 objectForKeyedSubscript:@"ScannerSettings"];
      v31 = [v30 objectForKeyedSubscript:@"ScannerSettingExactScanningEnabled"];
      [v28 setExactScanningEnabled:[v31 boolValue]];

      id v32 = [v30 objectForKeyedSubscript:@"ScannerSettingAbandonedMarkingEnabled"];
      [v28 setAbandonedMarkingEnabled:[v32 boolValue]];

      v33 = [v30 objectForKeyedSubscript:@"ScannerSettingShowRawClassNames"];
      [v28 setShowRawClassNames:[v33 boolValue]];

      v34 = [v30 objectForKeyedSubscript:@"ScannerSettingObjectContentLevel"];
      [v28 setObjectContentLevel:[v34 unsignedIntValue]];

      id v35 = [v30 objectForKeyedSubscript:@"ScannerSettingScanningMask"];
      [v28 setScanningMask:[v35 unsignedIntValue]];

      id v36 = [v30 objectForKeyedSubscript:@"ScannerSettingMaxInteriorOffset"];
      v37 = v36;
      if (v36) {
        [v28 setMaxInteriorOffset:[v36 unsignedLongValue]];
      }
    }
    v38 = sub_1000025A8();
    if (os_signpost_enabled(v38))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Init memory scanner", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
    }

    id v39 = sub_1000025A8();
    if (os_signpost_enabled(v39))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Add root and malloc nodes", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
    }

    id v108 = 0;
    uint64_t v9 = (uint64_t)[v28 addAllNodesFromTaskWithError:&v108];
    id v40 = v108;
    v41 = v40;
    if (v9)
    {
      int v42 = 0;
    }
    else
    {
      v43 = [v40 localizedDescription];
      uint64_t v9 = [(LeakAgent *)self logAndGenerateReceiptForErrorWithFormat:@"failed to add nodes to VMUTaskMemoryScanner with the error \"%@\"", v43];

      int v42 = 1;
    }

    id v44 = sub_1000025A8();
    if (os_signpost_enabled(v44))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Add root and malloc nodes", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
    }

    if (v42)
    {
      v91 = 0;
      goto LABEL_67;
    }
    uint64_t v45 = sub_1000025A8();
    if (os_signpost_enabled(v45))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Process graph", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
    }

    NSErrorUserInfoKey v46 = [v4 objectForKeyedSubscript:@"ProcessSnapshotGraphOptions"];

    if (v46)
    {
      v47 = [v4 objectForKeyedSubscript:@"ProcessSnapshotGraphOptions"];
      id v48 = [v47 unsignedLongValue];

      [v28 processSnapshotGraphWithOptions:v48];
    }
    else
    {
      [v28 processSnapshotGraph];
    v86 = };
    id v49 = sub_1000025A8();
    if (os_signpost_enabled(v49))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v49, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Process graph", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
    }

    NSErrorUserInfoKey v50 = sub_1000025A8();
    if (os_signpost_enabled(v50))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Find leaks", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
    }

    if (!v93)
    {
      v91 = v86;
LABEL_64:
      v58 = sub_1000025A8();
      if (os_signpost_enabled(v58))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Find leaks", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
      }

      int v42 = 0;
LABEL_67:
      [v28 detachFromTask];
      v59 = sub_1000025A8();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        int v60 = self->_targetPid;
        LODWORD(buf) = 67109376;
        DWORD1(buf) = v60;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v22;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "detached from process: %u (%#x)", (uint8_t *)&buf, 0xEu);
      }

      if (corpse_task_port - 1 <= 0xFFFFFFFD) {
        mach_port_deallocate(mach_task_self_, corpse_task_port);
      }
      if (v42) {
        goto LABEL_118;
      }
      v61 = +[NSMutableDictionary dictionary];
      if (v22 == self->_targetTask)
      {
        uint64_t v117 = 0;
        long long buf = 0u;
        long long v116 = 0u;
        mach_msg_type_number_t task_info_outCnt = 10;
        if (task_info(v22, 0x12u, (task_info_t)&buf, &task_info_outCnt))
        {
          uint64_t v9 = [(LeakAgent *)self logAndGenerateReceiptForErrorWithFormat:@"target process no longer exists"];
LABEL_117:

          goto LABEL_118;
        }
      }
      if (((v89 ^ 1 | v93) & 1) == 0)
      {
        v62 = sub_1000025A8();
        if (os_signpost_enabled(v62))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Count leaks", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
        }

        v100 = _NSConcreteStackBlock;
        uint64_t v101 = 3221225472;
        v102 = sub_100003C48;
        v103 = &unk_100008408;
        id v104 = v91;
        v106 = &v110;
        id v105 = v95;
        VMUWithRootNodeMarkingMap();
        v63 = sub_1000025A8();
        if (os_signpost_enabled(v63))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v63, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Count leaks", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
        }
      }
      if ((v88 | v90) == 1)
      {
        v64 = sub_1000025A8();
        if (os_signpost_enabled(v64))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v64, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Count marked", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
        }

        id v65 = [v91 copyUserMarked];
        if (v90)
        {
          id v66 = +[NSMutableArray array];
        }
        else
        {
          id v66 = 0;
        }
        if (v65)
        {
          v98[0] = _NSConcreteStackBlock;
          v98[1] = 3221225472;
          v98[2] = sub_100003DB8;
          v98[3] = &unk_1000083E0;
          id v99 = v66;
          id v67 = [v91 enumerateMarkedObjects:v65 withBlock:v98];
          free(v65);
        }
        else
        {
          id v67 = 0;
        }
        if (v88)
        {
          v68 = +[NSNumber numberWithUnsignedInt:v67];
          [v61 setObject:v68 forKeyedSubscript:@"MarkedCount"];
        }
        if (v90) {
          [v61 setObject:v66 forKeyedSubscript:@"MarkedAddresses"];
        }
        v69 = sub_1000025A8();
        if (os_signpost_enabled(v69))
        {
          LOWORD(buf) = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v69, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Count marked", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
        }
      }
      v70 = sub_1000025A8();
      if (os_signpost_enabled(v70))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v70, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Serialize graph", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
      }

      v71 = [v91 plistRepresentationWithOptions:v87];
      v72 = sub_1000025A8();
      if (os_signpost_enabled(v72))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v72, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Serialize graph", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
      }

      v73 = [v4 objectForKeyedSubscript:@"CollectFullDiskStackLogs"];
      unsigned int v74 = [v73 BOOLValue];

      if (v74)
      {
        id v97 = 0;
        uint64_t v75 = [(LeakAgent *)self getSerializedGraphWithFullDiskStackLogs:v91 serializedGraph:v71 error:&v97];
        id v76 = v97;

        if (!v75)
        {
          v85 = [v76 localizedDescription];
          uint64_t v9 = [(LeakAgent *)self logAndGenerateReceiptForErrorWithFormat:@"failed to collect full disk stack logs with the error \"%@\"", v85];

LABEL_116:
          goto LABEL_117;
        }

        v71 = (void *)v75;
      }
      else if (!v71)
      {
        id v76 = 0;
        goto LABEL_107;
      }
      [v61 setObject:v71 forKeyedSubscript:@"SerializedGraph"];
      id v76 = v71;
LABEL_107:
      if (v89)
      {
        v77 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v111 + 6)];
        [v61 setObject:v77 forKeyedSubscript:@"LeakedCount"];
      }
      if (v94) {
        [v61 setObject:v95 forKeyedSubscript:@"LeakedAddresses"];
      }
      v78 = sub_1000025A8();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        int v79 = self->_targetPid;
        unsigned int v80 = [v91 nodeCount];
        unsigned int v81 = [v91 edgeCount];
        int v82 = *((_DWORD *)v111 + 6);
        *(void *)&long long buf = __PAIR64__(v79, 67109888);
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v80;
        HIWORD(buf) = 1024;
        LODWORD(v116) = v81;
        WORD2(v116) = 1024;
        *(_DWORD *)((char *)&v116 + 6) = v82;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "returning result for pid %u with %u nodes, %u edges (%u leaked)", (uint8_t *)&buf, 0x1Au);
      }

      v83 = sub_1000025A8();
      if (os_signpost_enabled(v83))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v83, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Request memgraph", (const char *)&unk_100007503, (uint8_t *)&buf, 2u);
      }

      uint64_t v9 = v61;
      goto LABEL_116;
    }
    id v51 = [objc_alloc((Class)VMULeakDetector) initWithTask:self->_targetTask graph:v86 scanner:v28 stackLogReader:0];
    [v51 setSuppressOutput:1];
    id v107 = 0;
    unsigned int v52 = [v51 doNormalLeakDetectionWithError:&v107];
    id v53 = v107;
    *((_DWORD *)v111 + 6) = v52;
    if (v53)
    {
      v54 = sub_1000025A8();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        uint64_t v55 = [v53 localizedDescription];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v55;
        v92 = (void *)v55;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "LeakDetector error: %@", (uint8_t *)&buf, 0xCu);
      }
      v91 = 0;
    }
    else
    {
      if (!v52)
      {
        v91 = 0;
        goto LABEL_63;
      }
      v56 = [v51 graph];
      v91 = -[NSObject subgraphWithMarkedNodes:](v56, "subgraphWithMarkedNodes:", [v51 leakedNodes]);
      v57 = v56;
      v54 = v86;
      v86 = v57;
    }

LABEL_63:
    goto LABEL_64;
  }
  uint64_t v24 = task_generate_corpse(self->_targetTask, &corpse_task_port);
  if (!v24)
  {
    v25 = sub_1000025A8();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v26 = self->_targetPid;
      unsigned int v27 = self->_targetTask;
      LODWORD(buf) = 67109632;
      DWORD1(buf) = v26;
      WORD4(buf) = 1024;
      *(_DWORD *)((char *)&buf + 10) = v27;
      HIWORD(buf) = 1024;
      LODWORD(v116) = corpse_task_port;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "generated a corpse for pid: %u (task: %#x): %#x", (uint8_t *)&buf, 0x14u);
    }

    uint64_t v22 = corpse_task_port;
    goto LABEL_28;
  }
  uint64_t v9 = [(LeakAgent *)self logAndGenerateReceiptForErrorWithFormat:@"failed to generate corpse: %#x - %s", v24, mach_error_string(v24)];
LABEL_119:

  _Block_object_dispose(&v110, 8);
LABEL_120:

  return (id)v9;
}

- (id)mallocStackLogForAddress:(id)a3 size:(id)a4 isLiteZone:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_targetTask + 1 <= 1)
  {
    unsigned int v27 = sub_1000025A8();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int targetPid = self->_targetPid;
      unsigned int targetTask = self->_targetTask;
      *(_DWORD *)long long buf = 67109376;
      int v39 = targetPid;
      __int16 v40 = 1024;
      unsigned int v41 = targetTask;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "no valid task available for target: %u (%#x)", buf, 0xEu);
    }

    exit(4);
  }
  v11 = v10;
  if (self->_stackLogReader
    || (id v12 = (VMUTaskStackLogReader *)[objc_alloc((Class)VMUTaskStackLogReader) initWithTask:self->_targetTask], stackLogReader = self->_stackLogReader, self->_stackLogReader = v12, stackLogReader, self->_stackLogReader))
  {
    NSErrorUserInfoKey v14 = (char *)[v8 unsignedLongLongValue];
    id v15 = [v9 unsignedLongLongValue];
    id v16 = [v11 BOOLValue];
    task_start_peeking();
    id v17 = [(VMUTaskStackLogReader *)self->_stackLogReader getFramesForAddress:v14 size:v15 inLiteZone:v16 stackFramesBuffer:buf];
    task_stop_peeking();
    if (v17 == (id)-1)
    {
      uint64_t v24 = sub_1000025A8();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = "NO";
        int v30 = 134218754;
        v31 = v14;
        __int16 v32 = 2048;
        if (v16) {
          v25 = "YES";
        }
        v33 = &v14[(void)v15];
        __int16 v34 = 2048;
        id v35 = v15;
        __int16 v36 = 2080;
        v37 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "unable to get malloc stack log for %#llx-%#llx [%llu] (liteZone: %s)", (uint8_t *)&v30, 0x2Au);
      }

      id v19 = +[NSArray array];
    }
    else
    {
      uint64_t v18 = (uint64_t)v17
          - (((uint64_t)v17 > 0) & ~[(VMUTaskStackLogReader *)self->_stackLogReader usesLiteMode]);
      id v19 = +[NSMutableArray arrayWithCapacity:v18];
      if (v18 >= 1)
      {
        uint64_t v20 = 0;
        unsigned int v21 = 1;
        do
        {
          uint64_t v22 = +[NSNumber numberWithUnsignedLongLong:*(void *)&buf[8 * v20]];
          [v19 setObject:v22 atIndexedSubscript:v20];

          uint64_t v20 = v21;
        }
        while (v18 > v21++);
      }
    }
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (id)vmRegionStackLogForAddress:(id)a3 size:(id)a4
{
  uint64_t v4 = __chkstk_darwin(self, a2, a3, a4);
  v6 = v5;
  uint64_t v7 = v4;
  id v9 = v8;
  id v10 = v6;
  if ((*(_DWORD *)(v7 + 8) + 1) <= 1)
  {
    v33 = sub_1000025A8();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      int v34 = *(_DWORD *)(v7 + 12);
      int v35 = *(_DWORD *)(v7 + 8);
      *(_DWORD *)long long buf = 67109376;
      int v43 = v34;
      __int16 v44 = 1024;
      int v45 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "no valid task available for target: %u (%#x)", buf, 0xEu);
    }

    exit(4);
  }
  v11 = v10;
  if (*(void *)(v7 + 16)
    || (id v12 = [objc_alloc((Class)VMUTaskStackLogReader) initWithTask:*(unsigned int *)(v7 + 8)], v13 = *(void **)(v7 + 16), *(void *)(v7 + 16) = v12, v13, *(void *)(v7 + 16)))
  {
    NSErrorUserInfoKey v14 = (char *)[v9 unsignedLongLongValue];
    id v15 = [v11 unsignedLongLongValue];
    unsigned int v16 = [*(id *)(v7 + 16) usesLiteMode];
    id v17 = *(void **)(v7 + 16);
    if (v16)
    {
      [v17 liteMSLPayloadforVMregionAddress:v14];
      uint64_t uniquing_table_index = msl_payload_get_uniquing_table_index();
    }
    else
    {
      id v19 = [v17 regionTracker];
      uint64_t v20 = v19;
      if (v19)
      {
        unsigned int v21 = [v19 vmRegionRangeInfoForRange:v14, v15];
        uint64_t uniquing_table_index = (uint64_t)[v21 stackIdentifier];
      }
      else
      {
        uint64_t uniquing_table_index = -1;
      }
    }
    if (uniquing_table_index == -1
      || (id v22 = [*(id *)(v7 + 16) getFramesForStackID:uniquing_table_index stackFramesBuffer:buf],
          v22 == (id)-1))
    {
      v31 = sub_1000025A8();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v36 = 134218496;
        v37 = v14;
        __int16 v38 = 2048;
        int v39 = &v14[(void)v15];
        __int16 v40 = 2048;
        id v41 = v15;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "unable to get VM region stack log for %#llx-%#llx [%llu]", (uint8_t *)&v36, 0x20u);
      }

      int v26 = +[NSArray array];
    }
    else
    {
      uint64_t v23 = (uint64_t)v22;
      LODWORD(v24) = [*(id *)(v7 + 16) usesLiteMode] ^ 1;
      if (v23 > 0) {
        uint64_t v24 = v24;
      }
      else {
        uint64_t v24 = 0;
      }
      uint64_t v25 = v23 - v24;
      int v26 = +[NSMutableArray arrayWithCapacity:v23 - v24];
      if (v25 >= 1)
      {
        uint64_t v27 = 0;
        unsigned int v28 = 1;
        do
        {
          id v29 = +[NSNumber numberWithUnsignedLongLong:*(void *)&buf[8 * v27]];
          [v26 setObject:v29 atIndexedSubscript:v27];

          uint64_t v27 = v28;
        }
        while (v25 > v28++);
      }
    }
  }
  else
  {
    int v26 = 0;
  }

  return v26;
}

- (void).cxx_destruct
{
}

@end