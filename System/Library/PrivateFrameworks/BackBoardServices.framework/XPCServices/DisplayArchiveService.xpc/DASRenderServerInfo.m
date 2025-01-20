@interface DASRenderServerInfo
+ (id)infoFromServerWithPort:(unsigned int)a3;
- (NSArray)parseErrors;
- (NSOrderedSet)displays;
- (NSSet)contexts;
- (NSString)raw;
- (id)_initWithPort:(unsigned int)a3 raw:(id)a4;
- (id)archiveOfContext:(id)a3;
- (id)contextWithIdentifier:(unsigned int)a3;
- (id)description;
- (void)_parseRaw;
- (void)dealloc;
@end

@implementation DASRenderServerInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raw, 0);
  objc_storeStrong((id *)&self->_parseErrors, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong((id *)&self->_contextIDNumberToContextMap, 0);
  objc_storeStrong((id *)&self->_displays, 0);
}

- (NSString)raw
{
  return self->_raw;
}

- (NSArray)parseErrors
{
  return self->_parseErrors;
}

- (NSSet)contexts
{
  return self->_contexts;
}

- (NSOrderedSet)displays
{
  return self->_displays;
}

- (void)_parseRaw
{
  id v103 = 0;
  v67 = +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", @"^(?<displayName>.+) (?:display|contexts)(?<displayProperties>(?: \\([^\\)]+\\))*:$"), 1, &v103);
  v57 = (DASRenderServerInfo *)v103;
  if (v57)
  {
    v2 = sub_100005E28();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v57;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "failed to create display info parser -> %@", buf, 0xCu);
    }
  }
  id v102 = 0;
  +[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", @"^\\s*(?<contextID>[0-9a-f]+):(?: level (?<level>[^;]+);)? pid (?<pid>[0-9]+) \\[(?<process>[^\\]]*)\\](?<contextProperties>(?: \\([^\\)]+\\))*$"),
    1,
  v3 = &v102);
  v56 = (DASRenderServerInfo *)v102;
  if (v56)
  {
    v4 = sub_100005E28();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v56;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "failed to create context info parser -> %@", buf, 0xCu);
    }
  }
  if (!v67)
  {
    v46 = +[NSString stringWithFormat:@"failed to create display info parser -> %@", v57];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v47 = (DASRenderServerInfo *)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      v49 = NSStringFromClass(v48);
      *(_DWORD *)buf = 138544642;
      v107 = v47;
      __int16 v108 = 2114;
      v109 = v49;
      __int16 v110 = 2048;
      v111 = self;
      __int16 v112 = 2114;
      CFStringRef v113 = @"DASParsing.m";
      __int16 v114 = 1024;
      int v115 = 387;
      __int16 v116 = 2114;
      v117 = v46;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v46 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000033F4);
  }
  v5 = sub_100005E28();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v44 = [v67 pattern];
    *(_DWORD *)buf = 138412290;
    v107 = v44;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "created display pattern %@", buf, 0xCu);
  }
  if (!v3)
  {
    v50 = +[NSString stringWithFormat:@"failed to create context info parser -> %@", v56];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v51 = (DASRenderServerInfo *)objc_claimAutoreleasedReturnValue();
      v52 = (objc_class *)objc_opt_class();
      v53 = NSStringFromClass(v52);
      *(_DWORD *)buf = 138544642;
      v107 = v51;
      __int16 v108 = 2114;
      v109 = v53;
      __int16 v110 = 2048;
      v111 = self;
      __int16 v112 = 2114;
      CFStringRef v113 = @"DASParsing.m";
      __int16 v114 = 1024;
      int v115 = 389;
      __int16 v116 = 2114;
      v117 = v50;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v50 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000034F0);
  }
  v6 = sub_100005E28();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v45 = [v3 pattern];
    *(_DWORD *)buf = 138412290;
    v107 = v45;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "created context pattern %@", buf, 0xCu);
  }
  v7 = +[NSMutableArray array];
  v8 = +[NSMutableOrderedSet orderedSet];
  v9 = +[NSMutableDictionary dictionary];
  v10 = +[NSMutableDictionary dictionary];
  v11 = +[NSMutableDictionary dictionary];
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = sub_10000355C;
  v100[4] = sub_10000356C;
  id v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = sub_10000355C;
  v98[4] = sub_10000356C;
  id v99 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = sub_10000355C;
  v96[4] = sub_10000356C;
  id v97 = 0;
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100003574;
  v88[3] = &unk_100010518;
  v92 = v98;
  v93 = v100;
  SEL v95 = a2;
  id v65 = v10;
  id v89 = v65;
  v90 = self;
  id v12 = v8;
  id v91 = v12;
  v94 = v96;
  v13 = objc_retainBlock(v88);
  raw = self->_raw;
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1000038A8;
  v77[3] = &unk_100010540;
  SEL v87 = a2;
  id v54 = v67;
  id v78 = v54;
  v79 = self;
  v15 = v13;
  id v84 = v15;
  v85 = v100;
  id v63 = v9;
  id v80 = v63;
  v86 = v98;
  id v55 = v3;
  id v81 = v55;
  id v16 = v11;
  id v82 = v16;
  id v58 = v7;
  id v83 = v58;
  v17 = v15;
  [(NSString *)raw enumerateLinesUsingBlock:v77];
  v15[2](v15);
  v64 = +[NSMutableOrderedSet orderedSet];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v12;
  id v60 = [obj countByEnumeratingWithState:&v73 objects:v105 count:16];
  if (v60)
  {
    uint64_t v61 = *(void *)v74;
    do
    {
      for (i = 0; i != v60; i = (char *)i + 1)
      {
        if (*(void *)v74 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v73 + 1) + 8 * i);
        v19 = +[NSMutableOrderedSet orderedSet];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        v20 = [v65 objectForKey:v18];
        id v21 = [v20 countByEnumeratingWithState:&v69 objects:v104 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v70;
          do
          {
            for (j = 0; j != v21; j = (char *)j + 1)
            {
              if (*(void *)v70 != v22) {
                objc_enumerationMutation(v20);
              }
              v24 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
              v25 = [v16 objectForKey:v24];
              if (!v25)
              {
                v39 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"failed to find context %x attached to %@ :\n%@", [v24 unsignedIntValue], v18, self->_raw);
                id v40 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                {
                  NSStringFromSelector(a2);
                  v41 = (DASRenderServerInfo *)(id)objc_claimAutoreleasedReturnValue();
                  v42 = (objc_class *)objc_opt_class();
                  v43 = NSStringFromClass(v42);
                  *(_DWORD *)buf = 138544642;
                  v107 = v41;
                  __int16 v108 = 2114;
                  v109 = v43;
                  __int16 v110 = 2048;
                  v111 = self;
                  __int16 v112 = 2114;
                  CFStringRef v113 = @"DASParsing.m";
                  __int16 v114 = 1024;
                  int v115 = 471;
                  __int16 v116 = 2114;
                  v117 = v39;
                  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
                }
                [v39 UTF8String];
                _bs_set_crash_log_message();
                __break(0);
                JUMPOUT(0x100003198);
              }
              [v19 addObject:v25];
            }
            id v21 = [v20 countByEnumeratingWithState:&v69 objects:v104 count:16];
          }
          while (v21);
        }

        v26 = [DASDisplayInfo alloc];
        v27 = [v63 objectForKey:v18];
        id v28 = [(DASDisplayInfo *)v26 _initWithName:v18 attachedContexts:v19 raw:v27];
        [v64 addObject:v28];
      }
      id v60 = [obj countByEnumeratingWithState:&v73 objects:v105 count:16];
    }
    while (v60);
  }

  v29 = (NSOrderedSet *)[v64 copy];
  displays = self->_displays;
  self->_displays = v29;

  v31 = (NSDictionary *)[v16 copy];
  contextIDNumberToContextMap = self->_contextIDNumberToContextMap;
  self->_contextIDNumberToContextMap = v31;

  v33 = [v16 allValues];
  v34 = +[NSSet setWithArray:v33];
  contexts = self->_contexts;
  self->_contexts = v34;

  v36 = (NSArray *)[v58 copy];
  parseErrors = self->_parseErrors;
  self->_parseErrors = v36;

  v38 = sub_100005E28();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v107 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "parse result: '%@'", buf, 0xCu);
  }

  _Block_object_dispose(v96, 8);
  _Block_object_dispose(v98, 8);

  _Block_object_dispose(v100, 8);
}

- (id)description
{
  +[BSDescriptionBuilder builderWithObject:self];
  v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  v9 = sub_1000047A8;
  v10 = &unk_1000104B0;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = self;
  id v3 = v11;
  id v4 = [v3 modifyBody:&v7];
  v5 = objc_msgSend(v3, "build", v7, v8, v9, v10);

  return v5;
}

- (id)archiveOfContext:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v27 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"contextInfo"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[DASRenderServerInfo archiveOfContext:]");
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = @"DASParsing.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v38) = 273;
      WORD2(v38) = 2114;
      *(void *)((char *)&v38 + 6) = v27;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ (%{public}@:%i) : %{public}@", buf, 0x26u);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x10000529CLL);
  }
  v5 = v4;
  uint64_t port = self->_port;
  id v7 = [v4 identifier];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  uint64_t v8 = (uint64_t (*)(uint64_t, id))off_1000153E0;
  v35 = off_1000153E0;
  if (!off_1000153E0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100005328;
    *(void *)&long long v38 = &unk_100010928;
    *((void *)&v38 + 1) = &v32;
    v9 = sub_100005378();
    v10 = dlsym(v9, "CARenderServerGetClientPort");
    *(void *)(*(void *)(*((void *)&v38 + 1) + 8) + 24) = v10;
    off_1000153E0 = *(_UNKNOWN **)(*(void *)(*((void *)&v38 + 1) + 8) + 24);
    uint64_t v8 = (uint64_t (*)(uint64_t, id))v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v8)
  {
    v29 = +[NSAssertionHandler currentHandler];
    v30 = +[NSString stringWithUTF8String:"mach_port_t soft_CARenderServerGetClientPort(mach_port_t, uint32_t)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"DASParsing.m", 26, @"%s", dlerror());

    __break(1u);
  }
  uint64_t v11 = v8(port, v7);
  if (v11)
  {
    id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"DumpDisplay: capture %x from %i", [v5 identifier], objc_msgSend(v5, "pid"));
    id v13 = objc_alloc((Class)RBSAssertion);
    v14 = +[RBSTarget targetWithPid:](RBSTarget, "targetWithPid:", [v5 pid]);
    v15 = +[RBSDomainAttribute attributeWithDomain:@"com.apple.displayarchive" name:@"RenderClientProcessing"];
    v36 = v15;
    id v16 = +[NSArray arrayWithObjects:&v36 count:1];
    id v17 = [v13 initWithExplanation:v12 target:v14 attributes:v16];

    id v31 = 0;
    [v17 acquireWithError:&v31];
    id v18 = v31;
    if (v18)
    {
      v19 = sub_100005E28();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        unsigned int v24 = [v5 identifier];
        unsigned int v25 = [v5 pid];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v24;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v25;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "error acquiring assertion to capture archive of context %x (from %i)", buf, 0xEu);
      }
    }
    v20 = (void *)off_100015290(v11);
    [v17 invalidate];
    mach_port_deallocate(mach_task_self_, v11);
    if (v20)
    {

      goto LABEL_18;
    }
    uint64_t v22 = sub_100005E28();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = [v5 identifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "unable to capture archive of context %x", buf, 8u);
    }
  }
  else
  {
    id v12 = sub_100005E28();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v21 = [v5 identifier];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "server doesn't know about context %x", buf, 8u);
    }
  }
  v20 = 0;
LABEL_18:

  return v20;
}

- (id)contextWithIdentifier:(unsigned int)a3
{
  contextIDNumberToContextMap = self->_contextIDNumberToContextMap;
  id v4 = +[NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSDictionary *)contextIDNumberToContextMap objectForKey:v4];

  return v5;
}

- (void)dealloc
{
  BSMachSendRightRelease();
  v3.receiver = self;
  v3.super_class = (Class)DASRenderServerInfo;
  [(DASRenderServerInfo *)&v3 dealloc];
}

- (id)_initWithPort:(unsigned int)a3 raw:(id)a4
{
  id v7 = a4;
  if ((BSMachPortIsType() & 1) == 0)
  {
    id v13 = +[NSString stringWithFormat:@"invalid port"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = NSStringFromSelector(a2);
      v15 = (objc_class *)objc_opt_class();
      id v16 = NSStringFromClass(v15);
      *(_DWORD *)buf = 138544642;
      v23 = v14;
      __int16 v24 = 2114;
      unsigned int v25 = v16;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      CFStringRef v29 = @"DASParsing.m";
      __int16 v30 = 1024;
      int v31 = 249;
      __int16 v32 = 2114;
      v33 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v13 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000057ECLL);
  }
  if (!v7)
  {
    id v17 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"raw"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v18 = NSStringFromSelector(a2);
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138544642;
      v23 = v18;
      __int16 v24 = 2114;
      unsigned int v25 = v20;
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2114;
      CFStringRef v29 = @"DASParsing.m";
      __int16 v30 = 1024;
      int v31 = 250;
      __int16 v32 = 2114;
      v33 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v17 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000058E4);
  }
  v21.receiver = self;
  v21.super_class = (Class)DASRenderServerInfo;
  uint64_t v8 = [(DASRenderServerInfo *)&v21 init];
  v9 = v8;
  if (v8)
  {
    v8->_uint64_t port = a3;
    v10 = (NSString *)[v7 copy];
    raw = v9->_raw;
    v9->_raw = v10;

    [(DASRenderServerInfo *)v9 _parseRaw];
  }

  return v9;
}

+ (id)infoFromServerWithPort:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ((BSMachPortIsType() & 1) == 0)
  {
    v14 = +[NSString stringWithFormat:@"the render server port must be valid"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      id v16 = (objc_class *)objc_opt_class();
      id v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2048;
      id v31 = a1;
      *(_WORD *)__int16 v32 = 2114;
      *(void *)&v32[2] = @"DASParsing.m";
      __int16 v33 = 1024;
      int v34 = 232;
      __int16 v35 = 2114;
      v36 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100005B78);
  }
  if ((BSMachSendRightRetain() & 1) == 0)
  {
    id v18 = +[NSString stringWithFormat:@"could not retain the server port"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(a2);
      v20 = (objc_class *)objc_opt_class();
      objc_super v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2048;
      id v31 = a1;
      *(_WORD *)__int16 v32 = 2114;
      *(void *)&v32[2] = @"DASParsing.m";
      __int16 v33 = 1024;
      int v34 = 237;
      __int16 v35 = 2114;
      v36 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v18 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100005C64);
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  v6 = off_1000153D8;
  CFStringRef v29 = off_1000153D8;
  if (!off_1000153D8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100005DD8;
    id v31 = &unk_100010928;
    *(void *)__int16 v32 = &v26;
    id v7 = sub_100005378();
    uint64_t v8 = dlsym(v7, "CARenderServerGetInfo");
    *(void *)(*(void *)(*(void *)v32 + 8) + 24) = v8;
    off_1000153D8 = *(_UNKNOWN **)(*(void *)(*(void *)v32 + 8) + 24);
    v6 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v6)
  {
    a1 = +[NSAssertionHandler currentHandler];
    a2 = +[NSString stringWithUTF8String:"char *soft_CARenderServerGetInfo(mach_port_t, uint32_t, uintptr_t)"];
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", a2, @"DASParsing.m", 25, @"%s", dlerror());

    __break(1u);
LABEL_17:
    uint64_t v22 = objc_msgSend(v10, "stringWithFormat:", @"could not fetch contexts info from server %x", v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      __int16 v24 = (objc_class *)objc_opt_class();
      unsigned int v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v25;
      *(_WORD *)&buf[22] = 2048;
      id v31 = a1;
      *(_WORD *)__int16 v32 = 2114;
      *(void *)&v32[2] = @"DASParsing.m";
      __int16 v33 = 1024;
      int v34 = 239;
      __int16 v35 = 2114;
      v36 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v22 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100005DB0);
  }
  v9 = (void *)((uint64_t (*)(uint64_t, void, void))v6)(v3, 0, 0);
  v10 = NSString;
  if (!v9) {
    goto LABEL_17;
  }
  uint64_t v11 = +[NSString stringWithUTF8String:v9];
  free(v9);
  id v12 = [[DASRenderServerInfo alloc] _initWithPort:v3 raw:v11];

  return v12;
}

@end