@interface exfatFileSystem
- (BOOL)isChecksumBootRegionValid:(char *)a3 bytesPerSector:(unint64_t)a4;
- (id)syncRead:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6;
- (unsigned)getDirEntrySetChecksum:(exfat_file_entry_set *)a3;
- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8;
- (void)didFinishLaunching;
- (void)didFinishLoading;
- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8;
- (void)getVolumeNameAndUUID:(id)a3 reply:(id)a4;
- (void)loadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
- (void)loadVolume:(id)a3 reply:(id)a4;
- (void)probeResource:(id)a3 replyHandler:(id)a4;
- (void)unloadResource:(id)a3 options:(id)a4 replyHandler:(id)a5;
@end

@implementation exfatFileSystem

- (void)didFinishLaunching
{
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[exfatFileSystem didFinishLaunching]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: Finished launching", (uint8_t *)&v3, 0xCu);
  }
}

- (void)loadVolume:(id)a3 reply:(id)a4
{
  id v5 = a4;
  fs_errorForPOSIXError();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0, v6);
}

- (void)didFinishLoading
{
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[exfatFileSystem didFinishLoading]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: Finished launching", (uint8_t *)&v3, 0xCu);
  }
}

- (id)syncRead:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6
{
  id v13 = 0;
  id v7 = [a3 readInto:a4 startingAt:a5 length:a6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    v9 = v8;
    v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100011300(v9);
    }
  }
  else if (v7 == (id)a6)
  {
    v9 = 0;
  }
  else
  {
    v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100011274();
    }

    v9 = fs_errorForPOSIXError();
  }

  return v9;
}

- (BOOL)isChecksumBootRegionValid:(char *)a3 bytesPerSector:(unint64_t)a4
{
  unint64_t v4 = 11 * a4;
  if (a4)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    if (v4 <= 1) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = 11 * a4;
    }
    do
    {
      if ((unint64_t)(v5 - 106) > 6 || ((1 << (v5 - 106)) & 0x43) == 0)
      {
        HIDWORD(v9) = v6;
        LODWORD(v9) = v6;
        int v6 = (v9 >> 1) + a3[v5];
      }
      ++v5;
    }
    while (v7 != v5);
  }
  else
  {
    int v6 = 0;
  }
  v10 = &a3[v4];
  v11 = &a3[12 * a4];
  do
  {
    v12 = v10;
    if (v10 >= v11) {
      break;
    }
    v10 += 4;
  }
  while (*(_DWORD *)v12 == v6);
  return v12 >= v11;
}

- (unsigned)getDirEntrySetChecksum:(exfat_file_entry_set *)a3
{
  uint64_t v3 = 0;
  unsigned __int16 v4 = 0;
  do
  {
    if ((v3 & 0x7FFFFFFFFFFFFFFELL) != 2) {
      unsigned __int16 v4 = ((v4 >> 1) | (v4 << 15)) + *(&a3->var0.var0 + v3);
    }
    ++v3;
  }
  while (32 * a3->var0.var1 + 32 != v3);
  return v4;
}

- (void)getVolumeNameAndUUID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void *, id))a4;
  v138[0] = 0;
  v138[1] = 0;
  size_t v8 = 12 * (void)[v6 blockSize];
  unint64_t v9 = (unsigned int *)malloc_type_calloc(1uLL, v8, 0x787F7F0AuLL);
  if (!v9)
  {
    id v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10001138C(v13, v14, v15, v16, v17, v18, v19, v20);
    }

    v12 = 0;
    id v21 = 0;
    v22 = 0;
    goto LABEL_23;
  }
  v10 = v9;
  uint64_t v11 = [(exfatFileSystem *)self syncRead:v6 into:v9 startingAt:0 length:v8];
  if (v11) {
    goto LABEL_3;
  }
  if (*(void *)v10 != 0x54414658459076EBLL || *(void *)((char *)v10 + 3) != 0x2020205441465845)
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10001194C(v24, v25, v26, v27, v28, v29, v30, v31);
    }
LABEL_19:

LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  if (*((unsigned __int8 *)v10 + 105) << 8 != 256)
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000118D4(v24, v33, v34, v35, v36, v37, v38, v39);
    }
    goto LABEL_19;
  }
  int v32 = *((unsigned __int8 *)v10 + 108);
  if ((v32 - 13) <= 0xFFFFFFFB)
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_100011404();
    }
    goto LABEL_19;
  }
  if (12 << v32 > v8)
  {
    v40 = (char *)malloc_type_realloc(v10, 12 << v32, 0x40FFA8C5uLL);
    if (!v40)
    {
      v52 = fskit_std_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_10001147C(v52, v53, v54, v55, v56, v57, v58, v59);
      }

      v12 = 0;
      id v21 = 0;
      v22 = 0;
      v10 = 0;
      goto LABEL_22;
    }
    v10 = (unsigned int *)v40;
    uint64_t v11 = [(exfatFileSystem *)self syncRead:v6 into:&v40[v8] startingAt:v8 length:(12 << v32) - v8];
    if (v11)
    {
LABEL_3:
      v12 = (void *)v11;
LABEL_21:
      id v21 = 0;
      v22 = 0;
      goto LABEL_22;
    }
  }
  uint64_t v41 = 1 << v32;
  if (![(exfatFileSystem *)self isChecksumBootRegionValid:v10 bytesPerSector:1 << v32])
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10001185C(v24, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_19;
  }
  int v42 = *((unsigned __int8 *)v10 + 109);
  int v43 = *((unsigned __int8 *)v10 + 108);
  if ((v42 + v43) >= 0x1A)
  {
    v44 = fskit_std_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_1000114F4();
    }
LABEL_39:

    goto LABEL_20;
  }
  int v60 = *((unsigned __int8 *)v10 + 110);
  if ((v60 - 3) <= 0xFFFFFFFD)
  {
    v44 = fskit_std_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_10001156C();
    }
    goto LABEL_39;
  }
  if (v60 == 1 && (*((_WORD *)v10 + 53) & 1) != 0)
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1000115E4(v24, v61, v62, v63, v64, v65, v66, v67);
    }
    goto LABEL_19;
  }
  unsigned int v68 = v10[24];
  unsigned int v69 = v10[23] + 1;
  if (v68 < 2 || v68 > v69)
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10001165C(v68, v69, v24);
    }
    goto LABEL_19;
  }
  unsigned int v133 = v10[24];
  unsigned int v130 = v10[23] + 1;
  size_t v70 = (v41 << v42);
  unsigned int v71 = v10[22];
  v72 = (UInt8 *)malloc_type_calloc(1uLL, v70, 0x99EC41F4uLL);
  if (!v72)
  {
    v24 = fskit_std_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_10001138C(v24, v91, v92, v93, v94, v95, v96, v97);
    }
    goto LABEL_19;
  }
  v73 = v72;
  size_t v136 = v70;
  v131 = (char *)malloc_type_calloc(1uLL, v70, 0x50A058B8uLL);
  if (!v131)
  {
    v98 = fskit_std_log();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR)) {
      sub_10001138C(v98, v99, v100, v101, v102, v103, v104, v105);
    }

    v12 = 0;
    id v21 = 0;
    v22 = 0;
    goto LABEL_89;
  }
  v22 = 0;
  char v132 = 0;
  uint64_t v129 = v71 << v43;
  v135 = v73;
  uint64_t v128 = (v41 - 1);
  unsigned int v74 = v133;
  while (1)
  {
    unsigned int v134 = v74;
    unsigned int v75 = v136;
    uint64_t v76 = [(exfatFileSystem *)self syncRead:v6 into:v73 startingAt:v129 + v136 * (unint64_t)(v74 - 2) length:v136];
    if (v76)
    {
LABEL_90:
      v12 = (void *)v76;
      goto LABEL_87;
    }
    if (v136) {
      break;
    }
LABEL_63:
    uint64_t v88 = 4 * v134;
    unint64_t v89 = v10[20] + (unint64_t)(v88 >> v32);
    if (v89)
    {
      uint64_t v76 = [(exfatFileSystem *)self syncRead:v6 into:v131 startingAt:v89 << v32 length:1 << v32];
      if (v76) {
        goto LABEL_90;
      }
    }
    unsigned int v74 = *(_DWORD *)&v131[v88 & v128];
    if (v74 < 2 || v74 > v130)
    {
      if ((v132 & 1) == 0) {
        uuid_create_md5_from_name((unsigned __int8 *)v138, &unk_100017DC0, v10 + 25, 4u);
      }
      id v21 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v138];
      v12 = 0;
      v73 = v135;
      goto LABEL_88;
    }
  }
  uint64_t v77 = 0;
  while (1)
  {
    v78 = &v73[v77];
    int v79 = v73[v77];
    if (v79 != 131) {
      goto LABEL_58;
    }
    uint64_t v80 = v78[1];
    if ((v80 - 1) <= 0xA) {
      break;
    }
LABEL_62:
    v77 += 32;
    if (v77 >= v75) {
      goto LABEL_63;
    }
  }
  CFStringRef v81 = CFStringCreateWithBytes(kCFAllocatorDefault, &v73[v77 + 2], 2 * v80, 0x14000100u, 0);
  if (v81)
  {
    CFStringRef v82 = v81;
    MutableCopy = CFStringCreateMutableCopy(0, 0, v81);
    if (!MutableCopy)
    {
      v106 = fskit_std_log();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
        sub_10001176C(v106, v114, v115, v116, v117, v118, v119, v120);
      }
      goto LABEL_86;
    }
    CFStringRef v84 = MutableCopy;
    CFStringNormalize(MutableCopy, kCFStringNormalizationFormD);
    if (!CFStringGetCString(v84, buffer, 36, 0x8000100u))
    {
      v106 = fskit_std_log();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
        sub_1000117E4(v106, v121, v122, v123, v124, v125, v126, v127);
      }
      goto LABEL_86;
    }
    CFRelease(v82);
    CFRelease(v84);
    id v85 = [objc_alloc((Class)NSString) initWithUTF8String:buffer];

    int v79 = *v78;
    v22 = v85;
    v73 = v135;
    unsigned int v75 = v136;
LABEL_58:
    if (v79 == 160)
    {
      v86 = &v73[v77];
      int v87 = *(unsigned __int16 *)&v73[v77 + 2];
      if (v87 == [(exfatFileSystem *)self getDirEntrySetChecksum:v78])
      {
        *(_OWORD *)buffer = *(_OWORD *)(v86 + 6);
        sub_10000EAE8((uint64_t)buffer, (uint64_t)v138);
        char v132 = 1;
      }
      v73 = v135;
      unsigned int v75 = v136;
    }
    goto LABEL_62;
  }
  v106 = fskit_std_log();
  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR)) {
    sub_1000116F4(v106, v107, v108, v109, v110, v111, v112, v113);
  }
LABEL_86:
  v73 = v135;

  v12 = 0;
LABEL_87:
  id v21 = 0;
LABEL_88:
  free(v131);
LABEL_89:
  free(v73);
LABEL_22:
  free(v10);
LABEL_23:
  v7[2](v7, v22, v21);
}

- (void)probeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  unint64_t v7 = (void (**)(id, void, void *))a4;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x3032000000;
  uint64_t v39 = sub_10000EF50;
  v40 = sub_10000EF60;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_10000EF50;
  uint64_t v34 = sub_10000EF60;
  id v35 = 0;
  if ([v6 kind] == (id)1)
  {
    size_t v8 = +[FSBlockDeviceResource dynamicCast:v6];
    unint64_t v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v43 = "-[exfatFileSystem probeResource:replyHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: device matches!", buf, 0xCu);
    }

    id v10 = [v8 blockSize];
    uint64_t v11 = malloc_type_malloc((size_t)v10, 0xE028BF79uLL);
    if (!v11)
    {
      uint64_t v18 = fskit_std_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_1000119C4(v18, v19, v20, v21, v22, v23, v24, v25);
      }

      v12 = fs_errorForPOSIXError();
      if (v12) {
        goto LABEL_17;
      }
    }
    v12 = [(exfatFileSystem *)self syncRead:v8 into:v11 startingAt:0 length:v10];
    if (v12)
    {
LABEL_17:
      v7[2](v7, 0, v12);
      uint64_t v17 = 0;
    }
    else
    {
      if (*v11 == 0x54414658459076EBLL && *(void *)((char *)v11 + 3) == 0x2020205441465845)
      {
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000EF68;
        v29[3] = &unk_10001C5E8;
        v29[4] = &v36;
        v29[5] = &v30;
        [(exfatFileSystem *)self getVolumeNameAndUUID:v8 reply:v29];
        uint64_t v14 = 3;
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v27 = v37[5];
      uint64_t v28 = objc_msgSend((id)v31[5], "fs_containerIdentifier");
      uint64_t v17 = +[FSProbeResult resultWithResult:v14 name:v27 containerID:v28];

      ((void (**)(id, void *, void *))v7)[2](v7, v17, 0);
      v12 = 0;
    }
  }
  else
  {
    uint64_t v15 = fskit_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v43 = "-[exfatFileSystem probeResource:replyHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: Given device is not a block device", buf, 0xCu);
    }

    uint64_t v16 = fs_errorForPOSIXError();
    v7[2](v7, 0, v16);

    v12 = 0;
    uint64_t v17 = 0;
    size_t v8 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);
}

- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8
{
  id v63 = a3;
  id v61 = a4;
  id v62 = a5;
  id v59 = a6;
  id v13 = a7;
  uint64_t v64 = (void (**)(id, void))a8;
  uint64_t v66 = v13;
  int v60 = +[FSTaskProgressUpdater progressUpdaterWithProgress:v13];
  CFTypeRef cf = 0;
  unsigned int v74 = 0;
  unsigned int v75 = 0;
  uint64_t v14 = fskit_std_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v80 = "-[exfatFileSystem checkResource:options:connection:taskID:progress:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: started to check resource", buf, 0xCu);
  }

  location = (id *)malloc_type_malloc(0x18uLL, 0x1080040622C3295uLL);
  if (!location)
  {
    uint64_t v36 = fskit_std_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      sub_100011A3C(v36, v37, v38, v39, v40, v41, v42, v43);
    }
    goto LABEL_24;
  }
  uint64_t v15 = +[NSBundle bundleForClass:objc_opt_class()];
  id v16 = location[1];
  location[1] = (id)v15;

  objc_storeStrong(location, a5);
  *((_DWORD *)location + 4) = 2;
  uint64_t v65 = +[FSBlockDeviceResource dynamicCast:v63];
  if (!v65)
  {
    uint64_t v36 = fskit_std_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v80 = "-[exfatFileSystem checkResource:options:connection:taskID:progress:replyHandler:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s: could not get a device from resource", buf, 0xCu);
    }
LABEL_24:

    int v44 = 0;
    char v45 = 0;
    uint64_t v65 = 0;
    goto LABEL_30;
  }
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v17 = [v61 options];
  int v18 = 0;
  id v19 = [v17 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v19)
  {
    char v68 = 0;
    uint64_t v20 = *(void *)v70;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v70 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v69 + 1) + 8 * i);
        uint64_t v23 = [v22 option];
        unsigned __int8 v24 = [v23 isEqualToString:@"d"];

        if (v24)
        {
          int v18 = 1;
        }
        else
        {
          uint64_t v25 = [v22 option];
          unsigned __int8 v26 = [v25 isEqualToString:@"q"];

          if (v26)
          {
            char v68 = 1;
          }
          else
          {
            uint64_t v27 = [v22 option];
            unsigned __int8 v28 = [v27 isEqualToString:@"y"];

            if ((v28 & 1) == 0)
            {
              uint64_t v29 = [v22 option];
              unsigned __int8 v30 = [v29 isEqualToString:@"n"];

              if ((v30 & 1) == 0)
              {
                uint64_t v31 = [v22 option];
                unsigned __int8 v32 = [v31 isEqualToString:@"g"];

                if ((v32 & 1) == 0)
                {
                  uint64_t v33 = [v22 option];
                  unsigned __int8 v34 = [v33 isEqualToString:@"x"];

                  if ((v34 & 1) == 0)
                  {
                    id v35 = [v22 option];
                    [v35 isEqualToString:@"S"];
                  }
                }
              }
            }
          }
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }
    while (v19);
  }
  else
  {
    char v68 = 0;
  }

  fsck_set_debug(v18 != 0);
  fsck_set_quick(v68 & 1);
  fsck_set_fd((uint64_t)[v65 fileDescriptor]);
  fsck_set_device_block_size((uint64_t)[v65 blockSize]);
  fsck_set_device_block_count((uint64_t)[v65 blockCount]);
  fsck_set_messages_func((uint64_t)fsckMsgsAskPrompt, (uint64_t)fsckMsgsPrintFormat, (uint64_t)fsckMsgsPrintRaw, (uint64_t)fsckMsgsPrintRawError, 2, (uint64_t)location);
  v64[2](v64, 0);
  [v66 setTotalUnitCount:100];
  unsigned int v74 = startCallback;
  unsigned int v75 = endCallback;
  CFTypeRef cf = v60;
  int v44 = fsck_exfat_check_fs(&cf, v46, v47, v48, v49, v50, v51, v52);
  char v45 = 1;
LABEL_30:
  id v53 = [v66 totalUnitCount];
  if ((uint64_t)v53 > (uint64_t)[v66 completedUnitCount]) {
    objc_msgSend(v66, "setCompletedUnitCount:", objc_msgSend(v66, "totalUnitCount"));
  }
  CFRelease(cf);
  if (location) {
    free(location);
  }
  if (v45)
  {
    if (v44)
    {
      NSErrorUserInfoKey v76 = NSLocalizedDescriptionKey;
      uint64_t v54 = +[NSBundle mainBundle];
      uint64_t v55 = [v54 localizedStringForKey:@"Unknown Error" value:&stru_10001C6B0 table:0];
      uint64_t v77 = v55;
      uint64_t v56 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
      uint64_t v57 = +[NSError errorWithDomain:@"com.apple.fskit.exfat" code:v44 userInfo:v56];
    }
    else
    {
      uint64_t v57 = 0;
    }
    [v62 didCompleteWithError:v57 completionHandler:&stru_10001C628];
  }
  else
  {
    uint64_t v57 = fs_errorForPOSIXError();
    ((void (**)(id, void *))v64)[2](v64, v57);
  }

  uint64_t v58 = fskit_std_log();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v80 = "-[exfatFileSystem checkResource:options:connection:taskID:progress:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: done", buf, 0xCu);
  }
}

- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8
{
  id v15 = a3;
  id v110 = a4;
  id v107 = a5;
  id v16 = a6;
  id v17 = a7;
  int v18 = (void (**)(id, void *))a8;
  uint64_t v108 = +[FSTaskProgressUpdater progressUpdaterWithProgress:v17];
  id v19 = v15;
  uint64_t v109 = +[FSBlockDeviceResource dynamicCast:v15];
  CFTypeRef cf = 0;
  uint64_t v127 = 0;
  uint64_t v128 = 0;
  newfs_init_state();
  memset(&v125, 0, sizeof(v125));
  int v124 = 0;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v121 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  uint64_t v20 = (id *)malloc_type_malloc(0x18uLL, 0x80040D6874129uLL);
  if (!v20)
  {
    uint64_t v47 = fskit_std_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100011B4C(v47, v48, v49, v50, v51, v52, v53, v54);
    }

    unsigned int v75 = 0;
    int v124 = 12;
    NSErrorUserInfoKey v76 = v107;
    uint64_t v55 = v110;
    goto LABEL_80;
  }
  uint64_t v21 = (uint64_t)v20;
  objc_storeStrong(v20, a5);
  objc_storeStrong((id *)(v21 + 8), a3);
  objc_storeStrong((id *)(v21 + 16), self);
  if (!newfs_get_print_function_callback()) {
    newfs_set_print_function_callback((uint64_t)sub_10001049C);
  }
  id v102 = v15;
  if (!newfs_get_wipefs_function_callback()) {
    newfs_set_wipefs_function_callback((uint64_t)sub_1000105F4);
  }
  uint64_t v105 = v18;
  v106 = v17;
  id v103 = v16;
  uint64_t v104 = (void *)v21;
  newfs_set_client(v21);
  long long v122 = 0u;
  long long v123 = 0u;
  long long v121 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  LOWORD(v120) = -1;
  BYTE9(v123) = 1;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id obj = [v110 options];
  id v22 = [obj countByEnumeratingWithState:&v113 objects:v138 count:16];
  if (!v22)
  {
    uint64_t v101 = 0;
    goto LABEL_61;
  }
  id v23 = v22;
  uint64_t v101 = 0;
  uint64_t v24 = *(void *)v114;
  while (2)
  {
    for (i = 0; i != v23; i = (char *)i + 1)
    {
      if (*(void *)v114 != v24) {
        objc_enumerationMutation(obj);
      }
      unsigned __int8 v26 = *(void **)(*((void *)&v113 + 1) + 8 * i);
      id v27 = [v26 option];
      uint64_t v28 = *(char *)[v27 UTF8String];
      id v29 = [v26 optionValue];
      unsigned __int8 v30 = (char *)[v29 UTF8String];

      if ([v27 isEqual:@"N"])
      {
        BYTE8(v123) = 1;
        goto LABEL_52;
      }
      if ([v27 isEqual:@"R"])
      {
        BYTE9(v123) = 0;
        goto LABEL_52;
      }
      if ([v27 isEqual:@"I"])
      {
        DWORD2(v119) = get_uint32(v28, v30, &v124);
        goto LABEL_17;
      }
      if ([v27 isEqual:@"S"])
      {
        int uint32 = get_uint32(v28, v30, &v124);
        if (v124) {
          goto LABEL_58;
        }
        if ((uint32 & (uint32 - 1)) != 0 || (uint32 - 4097) <= 0xFFFFF1FE)
        {
          id v73 = objc_alloc((Class)NSString);
          uint64_t v80 = [v26 optionValue];
          CFStringRef v81 = @"Invalid bytes per sector (%@); must be a power of two from 512 to 4096";
          id v82 = objc_msgSend(v73, "initWithFormat:", @"Invalid bytes per sector (%@); must be a power of two from 512 to 4096",
                  v80);
          goto LABEL_74;
        }
        LODWORD(v118) = uint32;
      }
      else if ([v27 isEqual:@"a"])
      {
        int v32 = get_uint32(v28, v30, &v124);
        HIDWORD(v118) = v32;
        if (v124) {
          goto LABEL_58;
        }
        if (!v32)
        {
          unsigned int v74 = +[NSBundle bundleForClass:objc_opt_class()];
          unsigned int v75 = @"Sectors per FAT must be non-zero";
          NSErrorUserInfoKey v76 = v107;
          uint64_t v77 = [v107 localizedMessage:@"Sectors per FAT must be non-zero" table:@"fsck_appex" bundle:v74];

          v78 = @"Sectors per FAT must be non-zero";
          goto LABEL_75;
        }
      }
      else if ([v27 isEqual:@"b"])
      {
        int v33 = get_uint32(v28, v30, &v124);
        if (v124) {
          goto LABEL_58;
        }
        if ((v33 & (v33 - 1)) != 0 || (v33 - 33554433) <= 0xFE0001FE)
        {
          id v79 = objc_alloc((Class)NSString);
          uint64_t v80 = [v26 optionValue];
          CFStringRef v81 = @"Invalid bytes per cluster (%@); must be a power of two from 512 to 33554432";
          id v82 = objc_msgSend(v79, "initWithFormat:", @"Invalid bytes per cluster (%@); must be a power of two from 512 to 33554432",
                  v80);
          goto LABEL_74;
        }
        DWORD1(v118) = v33;
      }
      else if ([v27 isEqual:@"c"])
      {
        unsigned int v35 = get_uint32(v28, v30, &v124);
        LODWORD(v122) = v35;
        if (v124) {
          goto LABEL_58;
        }
        if (v35 > 0x10000
          || (v36.i32[0] = v35, uint8x8_t v37 = (uint8x8_t)vcnt_s8(v36), v37.i16[0] = vaddlv_u8(v37), v37.i32[0] != 1))
        {
          id v83 = objc_alloc((Class)NSString);
          uint64_t v80 = [v26 optionValue];
          CFStringRef v81 = @"Invalid sectors per cluster (%@); must be a power of two from 1 to 65536";
          id v82 = objc_msgSend(v83, "initWithFormat:", @"Invalid sectors per cluster (%@); must be a power of two from 1 to 65536",
                  v80);
          goto LABEL_74;
        }
      }
      else if ([v27 isEqual:@"n"])
      {
        int v38 = get_uint32(v28, v30, &v124);
        HIDWORD(v119) = v38;
        if (v124)
        {
LABEL_58:
          unsigned int v75 = 0;
          uint64_t v77 = 0;
LABEL_59:
          NSErrorUserInfoKey v76 = v107;
          goto LABEL_76;
        }
        if ((v38 - 3) <= 0xFFFFFFFD)
        {
          id v84 = objc_alloc((Class)NSString);
          uint64_t v80 = [v26 optionValue];
          CFStringRef v81 = @"Invalid number of FATs (%@); must be 1 or 2";
          id v82 = [v84 initWithFormat:@"Invalid number of FATs (%@); must be 1 or 2", v80];
          goto LABEL_74;
        }
      }
      else
      {
        if ([v27 isEqual:@"s"])
        {
          *((void *)&v117 + 1) = get_uint64(v28, v30, &v124);
LABEL_17:
          if (v124) {
            goto LABEL_58;
          }
          goto LABEL_52;
        }
        if (![v27 isEqual:@"v"]) {
          goto LABEL_52;
        }
        if (!verify_volume_name((unsigned __int8 *)v30))
        {
          id v85 = objc_alloc((Class)NSString);
          uint64_t v80 = [v26 optionValue];
          CFStringRef v81 = @"Given volume name (%@) is invalid for this file system";
          id v82 = [v85 initWithFormat:@"Given volume name (%@) is invalid for this file system", v80];
LABEL_74:
          int v87 = v82;

          uint64_t v88 = +[NSBundle bundleForClass:objc_opt_class()];
          unint64_t v89 = [v26 optionValue];
          NSErrorUserInfoKey v76 = v107;
          uint64_t v77 = objc_msgSend(v107, "localizedMessage:table:bundle:", v81, @"fsck_appex", v88, v89);

          v78 = v87;
          unsigned int v75 = v78;
LABEL_75:
          id v90 = [(__CFString *)v78 UTF8String];
          long long buf = newfs_ctx;
          *(void *)&long long v132 = qword_100110C50;
          newfs_print((uint64_t)&buf, 16, (uint64_t)"%s\n", v91, v92, v93, v94, v95, (uint64_t)v90);
          int v124 = 22;
LABEL_76:

          int v71 = 0;
          id v19 = v102;
          id v16 = v103;
          uint64_t v55 = v110;
          int v18 = v105;
          id v17 = v106;
          goto LABEL_77;
        }
        Mutable = CFStringCreateMutable(0, 0);
        if (!Mutable)
        {
          long long buf = newfs_ctx;
          *(void *)&long long v132 = qword_100110C50;
          newfs_print((uint64_t)&buf, 16, (uint64_t)"Could not create CFMutableString for volume name\n", v40, v41, v42, v43, v44, (uint64_t)usedBufLen);
          unsigned int v75 = 0;
          uint64_t v77 = 0;
          int v124 = 12;
          goto LABEL_59;
        }
        char v45 = Mutable;
        CFStringAppendCString(Mutable, v30, 0x8000100u);
        CFStringNormalize(v45, kCFStringNormalizationFormC);
        CFIndex Length = CFStringGetLength(v45);
        CFIndex v112 = 0;
        v139.location = 0;
        v139.length = Length;
        if (CFStringGetBytes(v45, v139, 0x14000100u, 0, 0, (UInt8 *)&v120 + 2, 22, &v112) != Length)
        {
          id v86 = objc_alloc((Class)NSString);
          uint64_t v80 = [v26 optionValue];
          CFStringRef v81 = @"Could not convert name (%@) to precomposed UTF-16 little endian; may be too long";
          id v82 = objc_msgSend(v86, "initWithFormat:", @"Could not convert name (%@) to precomposed UTF-16 little endian; may be too long",
                  v80);
          goto LABEL_74;
        }
        LOWORD(v120) = (unint64_t)v112 >> 1;
        CFRelease(v45);
        uint64_t v101 = (uint64_t)v30;
      }
LABEL_52:
    }
    id v23 = [obj countByEnumeratingWithState:&v113 objects:v138 count:16];
    if (v23) {
      continue;
    }
    break;
  }
LABEL_61:

  id v56 = [v109 bsdName];
  id v57 = [v56 UTF8String];

  newfs_set_fd((uint64_t)[v109 fileDescriptor]);
  NSErrorUserInfoKey v76 = v107;
  id v16 = v103;
  if (newfs_get_fd() == -1)
  {
    long long buf = newfs_ctx;
    *(void *)&long long v132 = qword_100110C50;
    newfs_print((uint64_t)&buf, 16, (uint64_t)"%s: device file descriptor is -1, path (%s)\n", v58, v59, v60, v61, v62, (uint64_t)"-[exfatFileSystem formatResource:options:connection:taskID:progress:replyHandler:]");
    int v70 = 22;
    id v19 = v102;
    uint64_t v55 = v110;
    int v18 = v105;
    id v17 = v106;
    long long v69 = v104;
LABEL_65:
    int v124 = v70;
    free(v69);
    unsigned int v75 = 0;
    goto LABEL_80;
  }
  int fd = newfs_get_fd();
  id v19 = v102;
  uint64_t v55 = v110;
  int v18 = v105;
  id v17 = v106;
  long long v69 = v104;
  if (fstat(fd, &v125))
  {
    long long buf = newfs_ctx;
    *(void *)&long long v132 = qword_100110C50;
    newfs_print((uint64_t)&buf, 16, (uint64_t)"%s: fstat failed, path (%s)", v64, v65, v66, v67, v68, (uint64_t)"-[exfatFileSystem formatResource:options:connection:taskID:progress:replyHandler:]");
    int v70 = 5;
    goto LABEL_65;
  }
  v105[2](v105, 0);
  newfs_set_volume_name(v101);
  newfs_set_device_path((uint64_t)v57);
  newfs_set_sector_size((uint64_t)[v109 blockSize]);
  newfs_set_partition_offset((uint64_t)[v109 partitionBase]);
  newfs_set_total_sectors((uint64_t)[v109 blockCount]);
  [v106 setTotalUnitCount:100];
  CFTypeRef cf = v108;
  uint64_t v127 = startCallback;
  uint64_t v128 = endCallback;
  long long v135 = v121;
  long long v136 = v122;
  long long v137 = v123;
  long long buf = v117;
  long long v132 = v118;
  long long v133 = v119;
  long long v134 = v120;
  int v71 = format((uint64_t)&buf, &cf);
  id v72 = [v106 totalUnitCount];
  if ((uint64_t)v72 < (uint64_t)[v106 completedUnitCount]) {
    objc_msgSend(v106, "setCompletedUnitCount:", objc_msgSend(v106, "totalUnitCount"));
  }
  CFRelease(cf);
  unsigned int v75 = 0;
  uint64_t v77 = 0;
  CFTypeRef cf = 0;
LABEL_77:
  int v96 = v124;
  free(v104);
  if (v96)
  {
    if (v77)
    {
      NSErrorUserInfoKey v129 = NSLocalizedFailureReasonErrorKey;
      unsigned int v130 = v77;
      uint64_t v97 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
      int v18 = v105;
      id v17 = v106;
      v98 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v96 userInfo:v97];
      v18[2](v18, v98);

      goto LABEL_81;
    }
LABEL_80:
    uint64_t v97 = fs_errorForPOSIXError();
    v18[2](v18, v97);
    uint64_t v77 = 0;
    goto LABEL_81;
  }
  if (v71)
  {
    uint64_t v99 = fs_errorForPOSIXError();
    [v76 didCompleteWithError:v99 completionHandler:&stru_10001C648];
  }
  else
  {
    [v76 didCompleteWithError:0 completionHandler:&stru_10001C648];
  }
  uint64_t v97 = fskit_std_log();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[exfatFileSystem formatResource:options:connection:taskID:progress:replyHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "%s: done", (uint8_t *)&buf, 0xCu);
  }
LABEL_81:
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

@end