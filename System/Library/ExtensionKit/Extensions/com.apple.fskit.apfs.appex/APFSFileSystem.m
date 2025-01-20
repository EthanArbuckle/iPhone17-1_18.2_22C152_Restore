@interface APFSFileSystem
- (id)syncRead:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6;
- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8;
- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8;
- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
- (void)probeResource:(id)a3 replyHandler:(id)a4;
- (void)setState:(int64_t)a3 replyHandler:(id)a4;
- (void)unloadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
@end

@implementation APFSFileSystem

- (void)setState:(int64_t)a3 replyHandler:(id)a4
{
  id v5 = a4;
  fs_errorForPOSIXError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  id v6 = a5;
  fs_errorForPOSIXError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a5 + 2))(v6, 0, v7);
}

- (void)unloadResource:(id)a3 options:(id)a4 replyHandler:(id)a5
{
  id v6 = a5;
  fs_errorForPOSIXError();
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);
}

- (id)syncRead:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6
{
  id v9 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = sub_100057608;
  v17 = sub_100057618;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100057620;
  v12[3] = &unk_100080AF8;
  v12[4] = &v13;
  v12[5] = a6;
  [v9 synchronousReadInto:a4 startingAt:a5 length:a6 replyHandler:v12];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (void)probeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if ([v6 kind] == (id)1)
  {
    v8 = +[FSBlockDeviceResource dynamicCast:v6];
    id v9 = [v8 blockSize];
    if ((unint64_t)v9 <= 0x1000) {
      uint64_t v10 = 4096;
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    id v11 = [objc_alloc((Class)NSMutableData) initWithLength:v10];
    uint64_t v12 = -[APFSFileSystem syncRead:into:startingAt:length:](self, "syncRead:into:startingAt:length:", v8, [v11 mutableBytes], 0, v10);
    if (!v12)
    {
      id v11 = v11;
      uint64_t v13 = (char *)[v11 mutableBytes];
      if (!nx_check_superblock((uint64_t)v13, 0x10001u, 0, v14, v15))
      {
        long long v23 = *(_OWORD *)(v13 + 72);
        id v18 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v23];
        id v19 = objc_alloc((Class)FSContainerIdentifier);
        id v20 = objc_msgSend(v19, "initWithUUID:", v18, v23);
        if ((*((void *)v13 + 8) & 0xFFFFFFFFFFFFFEFDLL) != 0)
        {
          v21 = +[FSProbeResult resultWithResult:1 name:0 containerID:v20];
          v7[2](v7, v21, 0);
        }
        else
        {
          if (*((void *)v13 + 7)) {
            uint64_t v22 = 2;
          }
          else {
            uint64_t v22 = 3;
          }
          v21 = +[FSProbeResult resultWithResult:v22 name:0 containerID:v20];
          v7[2](v7, v21, 0);
        }

        goto LABEL_9;
      }
      uint64_t v12 = fs_errorForPOSIXError();
    }
    v16 = (void *)v12;
    v7[2](v7, 0, v12);

LABEL_9:
    goto LABEL_13;
  }
  v17 = fskit_std_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v23) = 136315138;
    *(void *)((char *)&v23 + 4) = "-[APFSFileSystem probeResource:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Given device is not a block device", (uint8_t *)&v23, 0xCu);
  }

  fs_errorForPOSIXError();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, id))v7)[2](v7, 0, v11);
LABEL_13:
}

- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8
{
  id v9 = a8;
  fs_errorForPOSIXError();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v9, v10);
}

- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  int8x16_t v15 = (void (**)(id, void))a8;
  uint64_t v86 = 0;
  long long v141 = 0u;
  long long v140 = 0u;
  long long v139 = 0u;
  long long v138 = 0u;
  long long v137 = 0u;
  long long v136 = 0u;
  long long v135 = 0u;
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v127 = 0u;
  long long v128 = 0u;
  *(_OWORD *)__str = 0u;
  long long v126 = 0u;
  uint64_t v124 = 0;
  long long v122 = 0u;
  long long v123 = 0u;
  *(_OWORD *)uuid_t out = 0u;
  v16 = +[FSBlockDeviceResource dynamicCast:a3];
  v17 = (id *)malloc_type_malloc(0x18uLL, 0x80040D6874129uLL);
  id v18 = v17;
  if (!v17) {
    goto LABEL_31;
  }
  objc_storeStrong(v17, a5);
  uint64_t v19 = +[NSBundle bundleForClass:objc_opt_class()];
  id v20 = v18[2];
  v18[2] = (id)v19;

  qword_100084A88 = (uint64_t)v18;
  parse_nx_format_options(0, out);
  v21 = malloc_type_malloc(0x28uLL, 0x1010040E0C58372uLL);
  if (!v21)
  {
LABEL_31:
    free(v18);
    int v47 = 0;
    goto LABEL_41;
  }
  uint64_t v22 = (uint64_t)v21;
  v21[7] = [v16 fileDescriptor];
  *(_DWORD *)(v22 + 16) = [v16 physicalBlockSize];
  *(_DWORD *)(v22 + 8) = [v16 blockCount];
  *(_DWORD *)(v22 + 12) = [v16 blockSize];
  *(unsigned char *)(v22 + 24) = [v16 isWritable];
  *(_DWORD *)(v22 + 20) = [v16 partitionBase];
  id v23 = [v16 devicePath];
  size_t v24 = strlen((const char *)[v23 UTF8String]);
  *(void *)uint64_t v22 = malloc_type_malloc(v24, 0x3643FC46uLL);

  v25 = *(char **)v22;
  if (!*(void *)v22)
  {
    free(v18);
    int v47 = 0;
    int v48 = 12;
    goto LABEL_40;
  }
  v78 = v18;
  id v26 = [v16 devicePath];
  strcpy(v25, (const char *)[v26 UTF8String]);

  v79 = v16;
  *(_DWORD *)(v22 + 32) = [v16 state];
  uint64_t v124 = v22;
  v80 = v14;
  [v14 setTotalUnitCount:2];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  *(_OWORD *)uuid_t v90 = 0u;
  parse_apfs_format_options(0, v90);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v77 = v12;
  v27 = [v12 options];
  id v28 = [v27 countByEnumeratingWithState:&v82 objects:v89 count:16];
  if (!v28)
  {
    LODWORD(v81) = 0;
    unsigned int v75 = -1;
    int v76 = 0;
    goto LABEL_35;
  }
  id v29 = v28;
  uint64_t v81 = 0;
  unsigned int v75 = -1;
  int v76 = 0;
  uint64_t v30 = *(void *)v83;
  do
  {
    v31 = 0;
    do
    {
      if (*(void *)v83 != v30) {
        objc_enumerationMutation(v27);
      }
      v32 = *(void **)(*((void *)&v82 + 1) + 8 * (void)v31);
      v33 = [v32 option];
      if ([v33 isEqual:@"v"])
      {
        id v34 = [v32 optionValue];
        snprintf(__str, 0x110uLL, "volname=%s", (const char *)[v34 UTF8String]);

        if (parse_apfs_format_options(__str, v90))
        {
          v74 = "-[APFSFileSystem formatResource:options:connection:taskID:progress:replyHandler:]";
          v49 = "%s:%d: invalid value for -v\n";
LABEL_33:
          log_err((uint64_t)v49, v35, v36, v37, v38, v39, v40, v41, (uint64_t)v74);

          int v47 = 0;
          int v48 = 22;
          goto LABEL_38;
        }
        goto LABEL_17;
      }
      if ([v33 isEqual:@"i"])
      {
        v42 = "case=insensitive";
LABEL_16:
        parse_apfs_format_options(v42, v90);
        goto LABEL_17;
      }
      if ([v33 isEqual:@"e"])
      {
        v42 = "case=sensitive";
        goto LABEL_16;
      }
      if ([v33 isEqual:@"E"])
      {
        v43 = "encrypted";
LABEL_24:
        parse_apfs_format_options(v43, v90);
        BYTE4(v81) = 1;
        goto LABEL_17;
      }
      if ([v33 isEqual:@"S"])
      {
        if ((v81 & 0x100000000) == 0)
        {
          v49 = "invalid option -S should follow -E\n";
          goto LABEL_33;
        }
        id v44 = [v32 optionValue];
        snprintf(__str, 0x110uLL, "password=%s", (const char *)[v44 UTF8String]);

        v43 = __str;
        goto LABEL_24;
      }
      if ([v33 isEqual:@"A"])
      {
        LODWORD(v81) = 1;
      }
      else if ([v33 isEqual:@"D"])
      {
        v45 = [v32 optionValue];
        unsigned int v75 = [v45 intValue];

        LODWORD(v81) = 1;
        int v76 = 1;
      }
LABEL_17:

      v31 = (char *)v31 + 1;
    }
    while (v29 != v31);
    id v46 = [v27 countByEnumeratingWithState:&v82 objects:v89 count:16];
    id v29 = v46;
  }
  while (v46);
LABEL_35:

  if (os_variant_has_internal_content() || ((v76 | v81) & 1) == 0)
  {
    v15[2](v15, 0);
    id v14 = v80;
    v50 = v78;
    v16 = v79;
    if ((v81 & 1) == 0)
    {
      id v53 = [v79 bsdName];
      int v48 = nx_format((uint64_t)[v53 UTF8String], (uint64_t)out, 0, &v86);

      if (v48)
      {
        int v47 = 1;
        id v12 = v77;
        goto LABEL_39;
      }
    }
    [v80 setCompletedUnitCount:1];
    if (v76)
    {
      v87 = 0;
      *(void *)buf = 0;
      int v59 = nx_mount(v22, 0, (uint64_t **)buf, v54, v55, v56, v57, v58);
      id v12 = v77;
      if (!v59)
      {
        int v48 = apfs_deletefs(*(uint64_t *)buf, v75 - 1, &v87);
        uint64_t v60 = *(void *)buf;
        if (!v48)
        {
          int v48 = nx_reaper_wait(*(uint64_t **)buf, (unint64_t)v87);
          nx_unmount(*(uint64_t *)buf);
          if (!v48) {
            goto LABEL_63;
          }
LABEL_64:
          int v47 = 1;
          goto LABEL_39;
        }
LABEL_61:
        nx_unmount(v60);
        goto LABEL_64;
      }
    }
    else
    {
      __strlcpy_chk();
      v87 = 0;
      *(void *)buf = 0;
      int v59 = nx_mount(v22, 0, (uint64_t **)buf, v61, v62, v63, v64, v65);
      id v12 = v77;
      if (!v59)
      {
        int v66 = apfs_newfs(*(uint64_t *)buf, (uint64_t)v90, 0, 0, &v87);
        if (!v66)
        {
          log_info((uint64_t)"%s:%d: created a new volume with index : %d", v67, v68, v69, v70, v71, v72, v73, (uint64_t)"do_userland_create");
          obj_release(v87);
          nx_unmount(*(uint64_t *)buf);
LABEL_63:
          [v80 setCompletedUnitCount:2];
          int v48 = 0;
          goto LABEL_64;
        }
        int v48 = v66;
        uint64_t v60 = *(void *)buf;
        goto LABEL_61;
      }
    }
    int v48 = v59;
    goto LABEL_64;
  }
  int v47 = 0;
  int v48 = 45;
LABEL_38:
  id v12 = v77;
  v50 = v78;
  id v14 = v80;
  v16 = v79;
LABEL_39:
  free(v50);
LABEL_40:
  free(*(void **)v22);
  free((void *)v22);
  if (v48)
  {
LABEL_41:
    v51 = fs_errorForPOSIXError();
    if (v47) {
      goto LABEL_42;
    }
LABEL_44:
    ((void (**)(id, void *))v15)[2](v15, v51);
  }
  else
  {
    v51 = 0;
    if ((v47 & 1) == 0) {
      goto LABEL_44;
    }
LABEL_42:
    [v13 completed:v51 replyHandler:&stru_100080B38];
  }
  v52 = fskit_std_log();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[APFSFileSystem formatResource:options:connection:taskID:progress:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s: done", buf, 0xCu);
  }
}

@end