@interface HFSFileSystem
- (void)checkResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8;
- (void)didFinishLaunching;
- (void)didFinishLoading;
- (void)formatResource:(id)a3 options:(id)a4 connection:(id)a5 taskID:(id)a6 progress:(id)a7 replyHandler:(id)a8;
- (void)getVolumeName:(int)a3 masterBlock:(HFSMasterDirectoryBlock *)a4 reply:(id)a5;
- (void)loadVolume:(id)a3 reply:(id)a4;
- (void)probeResource:(id)a3 replyHandler:(id)a4;
@end

@implementation HFSFileSystem

- (void)getVolumeName:(int)a3 masterBlock:(HFSMasterDirectoryBlock *)a4 reply:(id)a5
{
  v7 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v8 = 0;
  int drSigWord = a4->drSigWord;
  if (drSigWord != 11080 && drSigWord != 22600)
  {
    if (drSigWord != 17474)
    {
      v12 = 0;
      uint64_t v13 = 0;
      goto LABEL_13;
    }
    if (a4->drEmbedSigWord != 11080)
    {
      v12 = 0;
      uint64_t v13 = 1;
      goto LABEL_13;
    }
    uint64_t v8 = ((unint64_t)(bswap32(a4->drAlBlSt) >> 16) << 9)
       + (bswap32(a4->drEmbedExtent.startBlock) >> 16) * (unint64_t)bswap32(a4->drAlBlkSiz);
  }
  uint64_t NameFromHFSPlusVolumeStartingAt = hfs_GetNameFromHFSPlusVolumeStartingAt(a3, v8, v14, bswap32(*(_DWORD *)&a4->drVN[4]));
  if (NameFromHFSPlusVolumeStartingAt == -3)
  {
    v12 = +[NSString stringWithUTF8String:v14];
    uint64_t v13 = 3;
  }
  else
  {
    uint64_t v13 = NameFromHFSPlusVolumeStartingAt;
    v12 = 0;
  }
LABEL_13:
  v7[2](v7, v13, v12);
}

- (void)didFinishLoading
{
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[HFSFileSystem didFinishLoading]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: Finished loading", (uint8_t *)&v3, 0xCu);
  }
}

- (void)didFinishLaunching
{
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315138;
    v4 = "-[HFSFileSystem didFinishLaunching]";
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

- (void)probeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_1000021C0;
  v49 = sub_1000021D0;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_1000021C0;
  v43 = sub_1000021D0;
  id v44 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  uint64_t v8 = +[FSBlockDeviceResource dynamicCast:v6];
  if (v8)
  {
    v9 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0xEA19C052uLL);
    if (!v9)
    {
      uint64_t v20 = fs_errorForPOSIXError();
      v21 = (void *)v46[5];
      v46[5] = v20;

      v22 = fskit_std_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v53 = "-[HFSFileSystem probeResource:replyHandler:]";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: Failed to allocate masterBlock", buf, 0xCu);
      }

      uint64_t v23 = 0;
      id v18 = 0;
      goto LABEL_21;
    }
    v10 = (char *)[v8 blockSize];
    unint64_t v11 = (unint64_t)v10;
    if ((unint64_t)(v10 - 16385) > 0xFFFFFFFFFFFFBFFFLL)
    {
      v15 = (char *)v9;
      if ((unint64_t)v10 >= 0x201)
      {
        v15 = (char *)malloc_type_malloc((size_t)v10, 0xF7E343CFuLL);
        if (!v15)
        {
          uint64_t v28 = fs_errorForPOSIXError();
          v29 = (void *)v46[5];
          v46[5] = v28;

          v30 = fskit_std_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v53 = "-[HFSFileSystem probeResource:replyHandler:]";
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s: Failed to allocate masterBlockBuffer", buf, 0xCu);
          }

          v15 = 0;
          id v18 = 0;
          uint64_t v23 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v24 = 0x400u % (unsigned __int16)v11;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000021D8;
      v34[3] = &unk_100004198;
      v34[4] = &v45;
      v34[5] = v24;
      [v8 synchronousReadInto:v15 startingAt:1024 - v24 length:v11 reply:v34];
      if (v46[5]) {
        goto LABEL_17;
      }
      if (v11 >= 0x201) {
        memcpy(v9, &v15[v24], 0x200uLL);
      }
      unsigned int v27 = bswap32(*v9) >> 16;
      if (v27 == 18475 || v27 == 18520)
      {
        v51[0] = 0;
        v51[1] = 0;
        if (hfs_GetVolumeUUIDRaw((int)[v8 fileDescriptor], (unsigned __int8 *)v51, (int)objc_msgSend(v8, "blockSize")) == -3)
        {
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_100002330;
          v33[3] = &unk_1000041C0;
          v33[4] = &v39;
          v33[5] = &v35;
          v33[6] = &v45;
          -[HFSFileSystem getVolumeName:masterBlock:reply:](self, "getVolumeName:masterBlock:reply:", [v8 fileDescriptor], v9, v33);
          if (*((unsigned char *)v36 + 24))
          {
            id v18 = [0 initWithUUIDBytes:v51];
            uint64_t v23 = 3;
LABEL_18:
            if (v11 < 0x201)
            {
LABEL_20:
              free(v9);
LABEL_21:
              uint64_t v25 = v40[5];
              v26 = objc_msgSend(v18, "fs_containerIdentifier");
              v19 = +[FSProbeResult resultWithResult:v23 name:v25 containerID:v26];

              v7[2](v7, v19, v46[5]);
              goto LABEL_22;
            }
LABEL_19:
            free(v15);
            goto LABEL_20;
          }
LABEL_17:
          uint64_t v23 = 0;
          id v18 = 0;
          goto LABEL_18;
        }
        uint64_t v31 = fs_errorForPOSIXError();
        v32 = (void *)v46[5];
        v46[5] = v31;

        v14 = fskit_std_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100003038(v14);
        }
      }
      else
      {
        v14 = fskit_std_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v53 = "-[HFSFileSystem probeResource:replyHandler:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Invalid volume signature", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v12 = fs_errorForPOSIXError();
      uint64_t v13 = (void *)v46[5];
      v46[5] = v12;

      v14 = fskit_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[HFSFileSystem probeResource:replyHandler:]";
        __int16 v54 = 2048;
        unint64_t v55 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Invalid block size (%lu)", buf, 0x16u);
      }
      v15 = 0;
    }

    goto LABEL_17;
  }
  v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
    sub_100002FB4(v16);
  }

  v17 = +[FSProbeResult resultWithResult:0 name:0 containerID:0];
  v7[2](v7, v17, 0);

  id v18 = 0;
  v19 = 0;
LABEL_22:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
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
  id v9 = a8;
  fs_errorForPOSIXError();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a8 + 2))(v9, v10);
}

@end