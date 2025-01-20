@interface msdosFileSystem
- (FSBlockDeviceResource)resource;
- (id)startCheckWithTask:(id)a3 parameters:(id)a4 error:(id *)a5;
- (id)startFormatWithTask:(id)a3 parameters:(id)a4 error:(id *)a5;
- (id)syncRead:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6;
- (msdosVolume)volume;
- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
- (void)probeResource:(id)a3 replyHandler:(id)a4;
- (void)setResource:(id)a3;
- (void)setVolume:(id)a3;
@end

@implementation msdosFileSystem

- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = fskit_std_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[msdosFileSystem loadResource:options:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s:start", (uint8_t *)&buf, 0xCu);
  }

  resource = self->_resource;
  self->_resource = 0;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong((id *)&self->_resource, a3);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = v10;
  id v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v35;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v14);
        }
        if ([*(id *)(*((void *)&v34 + 1) + 8 * i) containsString:@"-f"])
        {
          (*((void (**)(id, void, void))v11 + 2))(v11, 0, 0);

          goto LABEL_24;
        }
      }
      id v15 = [v14 countByEnumeratingWithState:&v34 objects:v47 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100024CAC;
  v45 = sub_100024CBC;
  id v46 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_100024CAC;
  v32 = sub_100024CBC;
  id v33 = 0;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100025250;
  v27[3] = &unk_10004D1E0;
  v27[4] = &v28;
  v27[5] = &buf;
  [(msdosFileSystem *)self probeResource:v9 replyHandler:v27];
  if (v29[5])
  {
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  else
  {
    if ([*(id *)(*((void *)&buf + 1) + 40) result] != (id)3) {
      goto LABEL_21;
    }
    v18 = [msdosVolume alloc];
    v19 = [*(id *)(*((void *)&buf + 1) + 40) containerID];
    v20 = [v19 volumeIdentifier];
    v21 = [*(id *)(*((void *)&buf + 1) + 40) name];
    v22 = [(msdosVolume *)v18 initWithResource:v9 volumeID:v20 volumeName:v21];
    volume = self->_volume;
    self->_volume = v22;

    if (self->_volume)
    {
      v24 = fskit_std_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = [*(id *)(*((void *)&buf + 1) + 40) containerID];
        *(_DWORD *)v38 = 136315394;
        v39 = "-[msdosFileSystem loadResource:options:replyHandler:]";
        __int16 v40 = 2112;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s: loaded resource with volume ID (%@)", v38, 0x16u);
      }
      v26 = [(msdosFileSystem *)self volume];
      (*((void (**)(id, void *, void))v11 + 2))(v11, v26, 0);
    }
    else
    {
LABEL_21:
      v26 = fs_errorForPOSIXError();
      (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v26);
    }
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&buf, 8);
LABEL_24:
}

- (id)syncRead:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6
{
  id v13 = 0;
  id v7 = [a3 readInto:a4 startingAt:a5 length:a6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    id v9 = v8;
    id v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031668();
    }
  }
  else if (v7 == (id)a6)
  {
    id v9 = 0;
  }
  else
  {
    id v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000315D0(a6, (uint64_t)v7, v11);
    }

    id v9 = fs_errorForPOSIXError();
  }

  return v9;
}

- (void)probeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (id v8 = v6) == 0)
  {
    id v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 136315138;
      v31 = "-[msdosFileSystem probeResource:replyHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Given device is not a block device", (uint8_t *)&v30, 0xCu);
    }

    id v9 = 0;
    id v13 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
    id v11 = 0;
    goto LABEL_30;
  }
  id v9 = v8;
  id v10 = [v8 blockSize];
  id v11 = [objc_alloc((Class)NSMutableData) initWithLength:v10];
  uint64_t v12 = -[msdosFileSystem syncRead:into:startingAt:length:](self, "syncRead:into:startingAt:length:", v9, [v11 mutableBytes], 0, v10);
  if (v12)
  {
    id v13 = (void *)v12;
LABEL_28:
    id v15 = 0;
LABEL_29:
    uint64_t v16 = 0;
LABEL_30:
    uint64_t v26 = 0;
    goto LABEL_31;
  }
  id v11 = v11;
  v17 = (unsigned __int8 *)[v11 bytes];
  if ((*v17 | 2) != 0xEB
    || ((v18 = v17, id v11 = v11, v19 = [v11 bytes], *v19 == 0x54414658459076EBLL)
      ? (BOOL v21 = *(void *)((char *)v19 + 3) == 0x2020205441465845)
      : (BOOL v21 = 0),
        v21 || (unsigned int v22 = *(unsigned __int16 *)(v18 + 11), v22 < 0x200)))
  {
LABEL_27:
    id v13 = 0;
    goto LABEL_28;
  }
  id v13 = 0;
  if (v22 <= 0x1000)
  {
    v20.i32[0] = *(unsigned __int16 *)(v18 + 11);
    if (vaddlv_u8((uint8x8_t)vcnt_s8(v20)) <= 1u)
    {
      int v23 = v18[13];
      BOOL v24 = (v23 & (v23 - 1)) != 0 || v23 == 0;
      if (!v24
        && v18[16]
        && (*(_WORD *)(v18 + 19) || *((_DWORD *)v18 + 8))
        && (*(_WORD *)(v18 + 17) || *((_DWORD *)v18 + 11)))
      {
        id v15 = +[Utilities getVolumeName:bps:spc:bootsector:flags:](Utilities, "getVolumeName:bps:spc:bootsector:flags:", v9);
        v25 = malloc_type_calloc(0x10uLL, 1uLL, 0x100004077774924uLL);
        if (v25)
        {
          uint64_t v16 = +[Utilities generateVolumeUuid:v18 uuid:v25];
          id v13 = 0;
          uint64_t v26 = 3;
          goto LABEL_31;
        }
        id v13 = fs_errorForPOSIXError();
        goto LABEL_29;
      }
      goto LABEL_27;
    }
  }
  id v15 = 0;
  uint64_t v16 = 0;
  uint64_t v26 = 0;
LABEL_31:
  v27 = fskit_std_log();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    sub_1000316E8();
  }

  if (v13)
  {
    v7[2](v7, 0, v13);
  }
  else
  {
    id v28 = [objc_alloc((Class)FSContainerIdentifier) initWithUUID:v16];
    v29 = +[FSProbeResult resultWithResult:v26 name:v15 containerID:v28];
    ((void (**)(id, void *, void *))v7)[2](v7, v29, 0);
  }
}

- (id)startCheckWithTask:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v35 = objc_alloc_init((Class)NSProgress);
  id v33 = [[msdosProgressHelper alloc] initWithProgress:v35];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x5810000000;
  v54 = &unk_100049CD6;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v58 = 0;
  long long v34 = self->_resource;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  int v50 = 0;
  id v9 = fskit_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v60 = "-[msdosFileSystem startCheckWithTask:parameters:error:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: started to check resource", buf, 0xCu);
  }

  [v35 setTotalUnitCount:100];
  uint64_t v45 = 0;
  id v46 = &v45;
  uint64_t v47 = 0x2020000000;
  id v48 = 0;
  id v32 = v7;
  id v48 = v32;
  fsck_set_context_properties((uint64_t)sub_100025F04, (uint64_t)sub_100026018, v46[3]);
  fsck_set_maxmem(20971520);
  for (unint64_t i = 0; i < (unint64_t)[v8 count]; ++i)
  {
    id v11 = [v8 objectAtIndexedSubscript:i];
    if ([v11 isEqualToString:@"-q"])
    {
      fsck_set_quick(1);
      goto LABEL_12;
    }
    if ([v11 isEqualToString:@"-n"])
    {
      fsck_set_alwaysno(1);
      fsck_set_alwaysyes(0);
LABEL_11:
      fsck_set_preen(0);
      goto LABEL_12;
    }
    if ([v11 isEqualToString:@"-y"])
    {
      fsck_set_alwaysyes(1);
      fsck_set_alwaysno(0);
      goto LABEL_11;
    }
    if ([v11 isEqualToString:@"-p"])
    {
      fsck_set_preen(1);
      fsck_set_alwaysno(0);
      fsck_set_alwaysyes(0);
      goto LABEL_12;
    }
    if (![v11 isEqualToString:@"-M"])
    {
      bzero(buf, 0x400uLL);
      id v11 = v11;
      __snprintf_chk((char *)buf, 0x400uLL, 0, 0x400uLL, "Option '%s' not recognized\n", (const char *)[v11 UTF8String]);
      sub_100025F04((void *)v46[3], v27, (uint64_t)buf, 0);
      goto LABEL_40;
    }
    int v44 = 0;
    uint64_t v43 = 0;
    bzero(buf, 0x400uLL);
    if ((id)++i == [v8 count])
    {
      __snprintf_chk((char *)buf, 0x400uLL, 0, 0x400uLL, "Size argument missing\n");
      sub_100025F04((void *)v46[3], v28, (uint64_t)buf, 0);
      goto LABEL_40;
    }
    uint64_t v12 = [v8 objectAtIndexedSubscript:i];

    id v11 = v12;
    id v13 = (const char *)[v11 UTF8String];
    if (!sscanf(v13, "%zi%n", &v43, &v44))
    {
      __snprintf_chk((char *)buf, 0x400uLL, 0, 0x400uLL, "Size argument '%s' not recognized\n", v13);
      goto LABEL_39;
    }
    int v14 = v13[v44];
    if (v14 > 76)
    {
      if (v14 == 77) {
        goto LABEL_22;
      }
      if (v14 != 107)
      {
        if (v14 != 109) {
          goto LABEL_38;
        }
LABEL_22:
        v43 <<= 10;
      }
LABEL_25:
      uint64_t v15 = v43 << 10;
      v43 <<= 10;
      if (v13[v44 + 1])
      {
LABEL_38:
        __snprintf_chk((char *)buf, 0x400uLL, 0, 0x400uLL, "Size multiplier '%s' not recognized\n", &v13[v44]);
LABEL_39:
        sub_100025F04((void *)v46[3], v29, (uint64_t)buf, 0);
LABEL_40:

        fs_errorForPOSIXError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        v25 = fskit_std_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = *a5;
          *(_DWORD *)long long buf = 136315394;
          v60 = "-[msdosFileSystem startCheckWithTask:parameters:error:]";
          __int16 v61 = 2112;
          id v62 = v30;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s:done:error(%@)", buf, 0x16u);
        }
        id v24 = 0;
        goto LABEL_32;
      }
      goto LABEL_28;
    }
    if (v13[v44])
    {
      if (v14 != 75) {
        goto LABEL_38;
      }
      goto LABEL_25;
    }
    uint64_t v15 = v43;
LABEL_28:
    fsck_set_maxmem(v15);
LABEL_12:
  }
  id v16 = [(FSBlockDeviceResource *)v34 BSDName];
  fsck_set_dev((uint64_t)[v16 UTF8String]);

  v17 = v33;
  v18 = v52;
  v52[4] = (uint64_t)v17;
  v18[5] = (uint64_t)startCallback;
  v18[6] = (uint64_t)endCallback;
  v19 = self->_resource;
  int8x8_t v20 = v52;
  v52[7] = (uint64_t)v19;
  v20[8] = (uint64_t)readHelper;
  v20[9] = (uint64_t)writeHelper;
  v20[10] = (uint64_t)fstatHelper;
  BOOL v21 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000263FC;
  block[3] = &unk_10004D208;
  __int16 v40 = v49;
  long long v37 = v34;
  v41 = &v51;
  id v22 = v35;
  id v38 = v22;
  v42 = &v45;
  id v39 = v32;
  dispatch_async(v21, block);

  int v23 = fskit_std_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v60 = "-[msdosFileSystem startCheckWithTask:parameters:error:]";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: done", buf, 0xCu);
  }

  id v24 = v22;
  v25 = v37;
LABEL_32:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);

  return v24;
}

- (id)startFormatWithTask:(id)a3 parameters:(id)a4 error:(id *)a5
{
  id v66 = a3;
  id v8 = a4;
  id v69 = objc_alloc_init((Class)NSProgress);
  v67 = [[msdosProgressHelper alloc] initWithProgress:v69];
  id v9 = self;
  v70 = self->_resource;
  uint64_t v126 = 0;
  v127 = &v126;
  uint64_t v128 = 0x5010000000;
  v129 = &unk_100049CD6;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  v124[0] = 0;
  v124[1] = v124;
  v124[2] = 0x2020000000;
  int v125 = 0;
  id v10 = fskit_std_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v134 = "-[msdosFileSystem startFormatWithTask:parameters:error:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: started to format resource", buf, 0xCu);
  }

  [v69 setTotalUnitCount:100];
  int v147 = 0;
  uint64_t v146 = 0;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  int v145 = 0;
  id v11 = (id *)malloc_type_malloc(0x18uLL, 0x80040D6874129uLL);
  location = v11;
  if (!v11)
  {
    v25 = fskit_std_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100031970(v25, v26, v27, v28, v29, v30, v31, v32);
    }

    id v24 = 0;
    goto LABEL_94;
  }
  objc_storeStrong(v11, a3);
  objc_storeStrong(location + 1, self->_resource);
  objc_storeStrong(location + 2, self);
  if (!newfs_get_print_function_callback()) {
    newfs_set_print_function_callback((uint64_t)sub_1000271E8);
  }
  if (!newfs_get_wipefs_function_callback()) {
    newfs_set_wipefs_function_callback((uint64_t)wipeFSCallback);
  }
  newfs_set_client((uint64_t)location);
  uint64_t v12 = 0;
  v52 = 0;
  uint64_t v62 = 0;
  v63 = 0;
  v59 = 0;
  uint64_t v60 = 0;
  int v68 = 0;
  uint64_t v65 = 0;
  uint64_t v61 = 0;
  uint64_t v57 = 0;
  uint64_t v58 = 0;
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  uint64_t v54 = 0;
  int v53 = 0;
  int v13 = 0;
  for (unint64_t i = 0; ; ++i)
  {
    if (i >= (unint64_t)[v8 count])
    {
      id v18 = [(FSBlockDeviceResource *)v70 BSDName];
      id v19 = [v18 UTF8String];

      if (v12)
      {
        int8x8_t v20 = v12;
        if (!strchr(v12, 47))
        {
          __snprintf_chk(__s1, 0x400uLL, 0, 0x400uLL, "/boot/%s", v12);
          int8x8_t v20 = strdup(__s1);
          if (!v20)
          {
            BOOL v21 = __error();
            id v15 = +[NSString stringWithFormat:@"%s", strerror(*v21)];
            id v22 = [v15 UTF8String];
            sub_1000271E8(location, v23, (uint64_t)v22, 0);
            id v24 = 0;
            goto LABEL_93;
          }
        }
      }
      else
      {
        int8x8_t v20 = 0;
      }
      unsigned int v33 = [(FSBlockDeviceResource *)v70 blockSize];
      id v34 = [(FSBlockDeviceResource *)v70 blockCount];
      unsigned int v35 = [(FSBlockDeviceResource *)v70 physicalBlockSize];
      long long v36 = v67;
      long long v37 = v127;
      v127[4] = (uint64_t)v36;
      v37[5] = (uint64_t)startCallback;
      v37[6] = (uint64_t)endCallback;
      id v38 = v9->_resource;
      id v39 = v127;
      v127[7] = (uint64_t)v38;
      v39[8] = (uint64_t)readHelper;
      v39[9] = (uint64_t)writeHelper;
      __int16 v40 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      long long v116 = v139;
      long long v117 = v140;
      long long v114 = v137;
      long long v115 = v138;
      long long v120 = v143;
      long long v121 = v144;
      long long v118 = v141;
      long long v119 = v142;
      block[2] = sub_100027328;
      block[3] = &unk_10004D230;
      v77 = v12;
      v78 = v52;
      v79 = v63;
      v80 = v59;
      int v81 = v68;
      int v82 = HIDWORD(v65);
      int v83 = HIDWORD(v62);
      int v84 = HIDWORD(v61);
      int v85 = v61;
      int v86 = HIDWORD(v60);
      int v87 = v60;
      int v88 = HIDWORD(v58);
      int v89 = v58;
      int v90 = HIDWORD(v57);
      int v91 = v57;
      int v92 = v56;
      int v93 = v55;
      int v94 = HIDWORD(v54);
      int v95 = v54;
      int v96 = v53;
      int v97 = v62;
      int v98 = v13;
      int v99 = v65;
      int v100 = HIDWORD(v56);
      id v104 = v19;
      unsigned int v105 = v35;
      int v107 = v147;
      uint64_t v106 = v146;
      id v108 = v34;
      unsigned int v109 = v33;
      v111 = v20;
      long long v113 = v136;
      int v112 = -1;
      int v122 = v145;
      v75 = v124;
      v76 = &v126;
      int v101 = HIDWORD(v55);
      uint64_t v103 = 0;
      int v102 = 0;
      int v110 = 0;
      id v41 = v69;
      id v73 = v41;
      v123 = location;
      id v74 = v66;
      dispatch_async(v40, block);

      id v42 = v41;
      id v24 = v73;
      goto LABEL_95;
    }
    id v15 = [v8 objectAtIndexedSubscript:i];
    if (i + 1 >= (unint64_t)[v8 count])
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:");
      id v16 = objc_claimAutoreleasedReturnValue();
      v17 = (const char *)[v16 UTF8String];
    }
    if ([v15 isEqualToString:@"-N"])
    {
      int v13 = 1;
      goto LABEL_82;
    }
    if ([v15 isEqualToString:@"-B"])
    {
      uint64_t v12 = (char *)v17;
      goto LABEL_82;
    }
    if ([v15 isEqualToString:@"-F"])
    {
      if (!v17) {
        goto LABEL_92;
      }
      if (strcmp(v17, "12") && strcmp(v17, "16") && strcmp(v17, "32"))
      {
        id v24 = [objc_alloc((Class)NSString) initWithFormat:@"Invalid FAT type (%s), must be 12/16 or 32", v17];
        id v46 = [v24 UTF8String];
        sub_1000271E8(location, v47, (uint64_t)v46, 0);
        goto LABEL_93;
      }
      int v68 = atoi(v17);
      goto LABEL_82;
    }
    if ([v15 isEqualToString:@"-I"])
    {
      if (!v17) {
        goto LABEL_92;
      }
      HIDWORD(v65) = argtou(v17, 0, 0xFFFFFFFF);
      LODWORD(v65) = 1;
      goto LABEL_82;
    }
    if (![v15 isEqualToString:@"-O"]) {
      break;
    }
    if (!v17) {
      goto LABEL_92;
    }
    if (strlen(v17) >= 9)
    {
      id v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Bad OEM string (%s)", v17);
      id v48 = [v24 UTF8String];
      sub_1000271E8(location, v49, (uint64_t)v48, 0);
      goto LABEL_93;
    }
    v63 = v17;
LABEL_82:
  }
  if ([v15 isEqualToString:@"-S"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    HIDWORD(v62) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-P"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v62) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-a"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    HIDWORD(v61) = argtou(v17, 1u, 0xFFFFFFFF);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-b"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v61) = argtou(v17, 1u, 0xFFFFFFFF);
    HIDWORD(v60) = 0;
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-c"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    HIDWORD(v60) = argtou(v17, 1u, 0xFFu);
    LODWORD(v61) = 0;
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-e"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v60) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-f"])
  {
    v59 = v17;
    if (!v17) {
      goto LABEL_92;
    }
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-h"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    HIDWORD(v58) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-i"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v58) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-k"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    HIDWORD(v57) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-m"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v57) = argtou(v17, 0, 0xFFu);
    HIDWORD(v56) = 1;
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-n"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v56) = argtou(v17, 1u, 0xFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-o"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v55) = argtou(v17, 0, 0xFFFFFFFF);
    HIDWORD(v55) = 1;
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-r"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    HIDWORD(v54) = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-s"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    LODWORD(v54) = argtou(v17, 1u, 0xFFFFFFFF);
    goto LABEL_82;
  }
  if ([v15 isEqualToString:@"-u"])
  {
    if (!v17) {
      goto LABEL_92;
    }
    int v53 = argtou(v17, 1u, 0xFFFFu);
    goto LABEL_82;
  }
  if (![v15 isEqualToString:@"-v"]) {
    goto LABEL_82;
  }
  if (!v17)
  {
LABEL_92:
    id v24 = [objc_alloc((Class)NSString) initWithFormat:@"Option %@ requires a value", v15];
    id v43 = [v24 UTF8String];
    sub_1000271E8(location, v44, (uint64_t)v43, 0);
    goto LABEL_93;
  }
  if (oklabel((uint64_t)v17))
  {
    v52 = v17;
    goto LABEL_82;
  }
  id v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Given volume name (%s) is invalid for this file system", v17);
  id v50 = [v24 UTF8String];
  sub_1000271E8(location, v51, (uint64_t)v50, 0);
LABEL_93:

  free(location);
LABEL_94:
  fs_errorForPOSIXError();
  id v42 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_95:

  _Block_object_dispose(v124, 8);
  _Block_object_dispose(&v126, 8);

  return v42;
}

- (msdosVolume)volume
{
  return (msdosVolume *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVolume:(id)a3
{
}

- (FSBlockDeviceResource)resource
{
  return (FSBlockDeviceResource *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);

  objc_storeStrong((id *)&self->_volume, 0);
}

@end