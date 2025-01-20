@interface DIController2IO_XPCHandlerAttach
- (BOOL)createDeviceWithError:(id *)a3;
- (BOOL)disconnectFromDriverWithError:(id *)a3;
- (BOOL)isNewDevice;
- (BOOL)setupDriverWithError:(id *)a3;
- (BOOL)updateFileBackingInfoWithRootDeviceEntryID:(unint64_t *)a3 error:(id *)a4;
- (DIAttachParams)attachParams;
- (DIController2IO_XPCHandlerAttach)initWithParams:(id)a3;
- (id)launchIODaemonWithError:(id *)a3;
- (id)runWithError:(id *)a3;
- (unsigned)getInterconnectLocation;
- (unsigned)ucConnection;
- (void)setIsNewDevice:(BOOL)a3;
@end

@implementation DIController2IO_XPCHandlerAttach

- (DIController2IO_XPCHandlerAttach)initWithParams:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIController2IO_XPCHandlerAttach;
  v6 = [(DIController2IO_XPCHandlerBase *)&v9 initWithParams:v5];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attachParams, a3);
    v7->_ucConnection = 0;
  }

  return v7;
}

- (id)launchIODaemonWithError:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_10002F3D8;
  v25 = sub_10002F3E8;
  id v26 = 0;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002F3F0;
  v18[3] = &unk_1001A1BA0;
  objc_copyWeak(&v19, &location);
  v18[4] = &v21;
  id v5 = objc_retainBlock(v18);
  if ([(DIController2IO_XPCHandlerAttach *)self isNewDevice])
  {
    int v6 = *__error();
    if (sub_1000D850C())
    {
      v7 = sub_1000D848C();
      os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v28 = 60;
      __int16 v29 = 2080;
      v30 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf(__stderrp, "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      v12 = sub_1000D848C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v28 = 60;
        __int16 v29 = 2080;
        v30 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Device created, attaching to the new device", buf, 0x12u);
      }
    }
    *__error() = v6;
    v13 = [(DIBaseXPCHandler *)self remoteProxy];
    v14 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
    [v13 attachToNewDeviceWithParams:v14 reply:v5];
  }
  else
  {
    int v9 = *__error();
    if (sub_1000D850C())
    {
      v10 = sub_1000D848C();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v28 = 60;
      __int16 v29 = 2080;
      v30 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
      v11 = (char *)_os_log_send_and_compose_impl();

      if (v11)
      {
        fprintf(__stderrp, "%s\n", v11);
        free(v11);
      }
    }
    else
    {
      v15 = sub_1000D848C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v28 = 60;
        __int16 v29 = 2080;
        v30 = "-[DIController2IO_XPCHandlerAttach launchIODaemonWithError:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Attaching to an existing device", buf, 0x12u);
      }
    }
    *__error() = v9;
    v13 = [(DIBaseXPCHandler *)self remoteProxy];
    v14 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
    [v13 attachToExistingDeviceWithParams:v14 reply:v5];
  }

  if ([(DIBaseXPCHandler *)self completeCommandWithError:a3]) {
    id v16 = (id)v22[5];
  }
  else {
    id v16 = 0;
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v21, 8);

  return v16;
}

- (BOOL)setupDriverWithError:(id *)a3
{
  id v5 = +[DIIOObject copyDiskImagesControllerWithError:](DIIOObject, "copyDiskImagesControllerWithError:");
  int v6 = v5;
  if (v5)
  {
    io_service_t v7 = [v5 ioObj];
    uint64_t v8 = IOServiceOpen(v7, mach_task_self_, 0, &self->_ucConnection);
    if (v8)
    {
      int v9 = +[NSString stringWithFormat:@"IOServiceOpen failed. error=0x%x", v8];
      BOOL v10 = +[DIError failWithEnumValue:153 verboseInfo:v9 error:a3];
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)disconnectFromDriverWithError:(id *)a3
{
  int v5 = *__error();
  if (sub_1000D850C())
  {
    int v6 = sub_1000D848C();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    int v15 = 66;
    __int16 v16 = 2080;
    v17 = "-[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:]";
    io_service_t v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf(__stderrp, "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    uint64_t v8 = sub_1000D848C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      int v15 = 66;
      __int16 v16 = 2080;
      v17 = "-[DIController2IO_XPCHandlerAttach disconnectFromDriverWithError:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Closing IO service", buf, 0x12u);
    }
  }
  *__error() = v5;
  p_ucConnection = &self->_ucConnection;
  uint64_t v10 = IOServiceClose(*p_ucConnection);
  unsigned int *p_ucConnection = 0;
  if (!v10) {
    return 1;
  }
  v11 = +[NSString stringWithFormat:@"IOServiceClose failed. error=0x%x", v10];
  BOOL v12 = +[DIError failWithEnumValue:153 verboseInfo:v11 error:a3];

  return v12;
}

- (BOOL)updateFileBackingInfoWithRootDeviceEntryID:(unint64_t *)a3 error:(id *)a4
{
  io_service_t v7 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
  uint64_t v8 = [v7 inputStatFS];
  if (!v8)
  {

    goto LABEL_11;
  }
  int v9 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
  uint64_t v10 = [v9 inputStatFS];
  v11 = [v10 mountedFrom];

  if (!v11)
  {
LABEL_11:
    *a3 = 0;
    int v26 = *__error();
    if (sub_1000D850C())
    {
      v27 = sub_1000D848C();
      os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      int v34 = 85;
      __int16 v35 = 2080;
      v36 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
      int v28 = (char *)_os_log_send_and_compose_impl();

      if (v28)
      {
        fprintf(__stderrp, "%s\n", v28);
        free(v28);
      }
    }
    else
    {
      __int16 v29 = sub_1000D848C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        int v34 = 85;
        __int16 v35 = 2080;
        v36 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image file is not backed by local storage, root device entry ID will be the disk image device itself", buf, 0x12u);
      }
    }
    *__error() = v26;
    return 1;
  }
  BOOL v12 = [DIIOMedia alloc];
  v13 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
  v14 = [v13 inputStatFS];
  int v15 = [v14 mountedFrom];
  __int16 v16 = [(DIIOMedia *)v12 initWithDevName:v15 error:a4];

  if (v16)
  {
    id v17 = [(DIIOMedia *)v16 copyBlockDeviceWithError:a4];
    v18 = v17;
    if (v17)
    {
      id v19 = [v17 copyRootBlockDeviceWithError:a4];
      v20 = v19;
      if (v19)
      {
        id v21 = [v19 registryEntryIDWithError:a4];
        *a3 = (unint64_t)v21;
        if (v21)
        {
          int v22 = *__error();
          if (sub_1000D850C())
          {
            uint64_t v23 = sub_1000D848C();
            os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
            unint64_t v24 = *a3;
            *(_DWORD *)buf = 68158210;
            int v34 = 85;
            __int16 v35 = 2080;
            v36 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
            __int16 v37 = 2048;
            unint64_t v38 = v24;
            v25 = (char *)_os_log_send_and_compose_impl();

            if (v25)
            {
              fprintf(__stderrp, "%s\n", v25);
              free(v25);
            }
          }
          else
          {
            v31 = sub_1000D848C();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v32 = *a3;
              *(_DWORD *)buf = 68158210;
              int v34 = 85;
              __int16 v35 = 2080;
              v36 = "-[DIController2IO_XPCHandlerAttach updateFileBackingInfoWithRootDeviceEntryID:error:]";
              __int16 v37 = 2048;
              unint64_t v38 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%.*s: Entry ID of root block storage device: 0x%llx", buf, 0x1Cu);
            }
          }
          *__error() = v22;

          return 1;
        }
      }
    }
  }
  return 0;
}

- (unsigned)getInterconnectLocation
{
  v2 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
  v3 = [v2 inputURL];
  v4 = [v3 scheme];

  if ([v4 isEqualToString:@"file"])
  {
    unsigned __int8 v5 = 1;
  }
  else if ([v4 isEqualToString:@"ram"])
  {
    unsigned __int8 v5 = 2;
  }
  else if ([v4 isEqualToString:@"http"])
  {
    unsigned __int8 v5 = 3;
  }
  else if ([v4 isEqualToString:@"https"])
  {
    unsigned __int8 v5 = 3;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)createDeviceWithError:(id *)a3
{
  v3 = (void *)__chkstk_darwin(self, a2, a3);
  uint64_t v5 = v4;
  int v6 = v3;
  size_t outputStructCnt = 12;
  io_service_t v7 = [v3 attachParams];
  [v7 autoMount];

  uint64_t v8 = [v6 attachParams];
  int v9 = v8;
  if (v8)
  {
    [v8 backend];
  }
  else
  {
    v115 = 0;
    uint64_t v114 = 0;
  }
  sub_100030EC8((void **)&v114, (void **)buf);
  if (v115) {
    sub_100004944(v115);
  }

  if (*(void *)buf)
  {
    uint64_t v10 = [QuarantineFileHandler alloc];
    v99 = [(QuarantineFileHandler *)v10 initWithFD:(***(uint64_t (****)(void))buf)(*(void *)buf) error:v5];
    if (!v99) {
      goto LABEL_13;
    }
  }
  else
  {
    v11 = [v6 attachParams];
    BOOL v12 = [v11 inputURL];
    v13 = [v12 scheme];
    if ([v13 isEqualToString:@"http"])
    {
    }
    else
    {
      v14 = [v6 attachParams];
      int v15 = [v14 inputURL];
      __int16 v16 = [v15 scheme];
      unsigned int v17 = [v16 isEqualToString:@"https"];

      if (!v17)
      {
        v99 = 0;
        goto LABEL_15;
      }
    }
    v18 = [QuarantineFileHandler alloc];
    id v19 = [v6 attachParams];
    v20 = [v19 inputURL];
    v99 = [(QuarantineFileHandler *)v18 initWithURL:v20 error:v5];

    if (!v99)
    {
LABEL_13:
      BOOL v21 = 0;
      v99 = 0;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v21 = 1;
LABEL_16:
  if (*(void *)v104) {
    sub_100004944(*(std::__shared_weak_count **)v104);
  }
  if (v21)
  {
    if (v99)
    {
      v98 = [(QuarantineFileHandler *)v99 getFileInfoWithError:v5];
      if (!v98 && [(QuarantineFileHandler *)v99 isQuarantined])
      {
        LOBYTE(v21) = 0;
        goto LABEL_67;
      }
      if ([(QuarantineFileHandler *)v99 isQuarantined])
      {
        int v22 = *__error();
        if (sub_1000D850C())
        {
          uint64_t v114 = 0;
          uint64_t v23 = sub_1000D848C();
          os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&uint8_t buf[4] = 58;
          *(_WORD *)v104 = 2080;
          *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
          LODWORD(v92) = 18;
          v89 = buf;
          unint64_t v24 = (char *)_os_log_send_and_compose_impl();

          if (v24)
          {
            fprintf(__stderrp, "%s\n", v24);
            free(v24);
          }
        }
        else
        {
          v25 = sub_1000D848C();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&uint8_t buf[4] = 58;
            *(_WORD *)v104 = 2080;
            *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%.*s: Attaching a quarantined image", buf, 0x12u);
          }
        }
        *__error() = v22;
      }
    }
    else
    {
      v98 = 0;
    }
    unsigned __int8 v26 = objc_msgSend(v6, "getInterconnectLocation", v89, v92);
    v27 = [v6 attachParams];
    if ([v27 emulateExternalDisk])
    {
      int v28 = os_variant_allows_internal_security_policies();

      if (v28)
      {
        int v29 = *__error();
        if (sub_1000D850C())
        {
          uint64_t v114 = 0;
          v30 = sub_1000D848C();
          os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&uint8_t buf[4] = 58;
          *(_WORD *)v104 = 2080;
          *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
          LODWORD(v93) = 18;
          v90 = buf;
          v31 = (char *)_os_log_send_and_compose_impl();

          if (v31)
          {
            fprintf(__stderrp, "%s\n", v31);
            free(v31);
          }
        }
        else
        {
          unint64_t v32 = sub_1000D848C();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&uint8_t buf[4] = 58;
            *(_WORD *)v104 = 2080;
            *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%.*s: [Apple Internal] Creating an emulated external disk", buf, 0x12u);
          }
        }
        *__error() = v29;
        unsigned __int8 v26 = 4;
      }
    }
    else
    {
    }
    v33 = objc_msgSend(v6, "attachParams", v90, v93);
    int v34 = [v33 diskImageParamsXPC];
    __int16 v35 = (std::__shared_weak_count *)[v34 numBlocks];

    v36 = [v6 attachParams];
    __int16 v37 = [v36 diskImageParamsXPC];
    unint64_t v38 = [v37 shadowChain];
    unsigned __int8 v39 = [v38 isEmpty];

    if ((v39 & 1) == 0)
    {
      v36 = [v6 attachParams];
      v40 = [v36 diskImageParamsXPC];
      v41 = [v40 shadowChain];
      v42 = (std::__shared_weak_count *)[v41 topDiskImageNumBlocks];

      if ((uint64_t)v42 > 0) {
        __int16 v35 = v42;
      }
    }
    long long v117 = 0u;
    memset(v118, 0, 464);
    long long v116 = 0u;
    uint64_t v114 = 8;
    v115 = v35;
    v97 = [v6 attachParams];
    v43 = [v97 diskImageParamsXPC];
    v96 = v43;
    LODWORD(v116) = [v43 blockSize];
    v44 = [v6 attachParams];
    v45 = [v44 diskImageParamsXPC];
    unsigned __int8 v46 = [v45 isWritableFormat];
    if (v46)
    {
      uint64_t v47 = v5;
      BOOL v48 = 0;
    }
    else
    {
      v95 = [v6 attachParams];
      v36 = [v95 shadowChain];
      v43 = [v36 activeShadowURL];
      uint64_t v47 = v5;
      BOOL v48 = v43 == 0;
    }
    BYTE4(v116) = v48;
    v49 = [v6 attachParams];
    *(_WORD *)((char *)&v116 + 5) = [v49 hasUnlockedBackend];
    BYTE7(v116) = v26;
    bzero((char *)&v116 + 8, 0x818uLL);

    uint64_t v50 = v47;
    if ((v46 & 1) == 0)
    {
    }
    v51 = [v6 attachParams];
    v52 = [v51 instanceID];
    [v52 getUUIDBytes:(char *)&v116 + 8];

    int v53 = *__error();
    if (sub_1000D850C())
    {
      v54 = sub_1000D848C();
      os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
      v55 = v115;
      int v56 = v116;
      id v57 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:(char *)&v116 + 8];
      *(_DWORD *)buf = 68158978;
      *(_DWORD *)&uint8_t buf[4] = 58;
      *(_WORD *)v104 = 2080;
      *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
      __int16 v105 = 2048;
      v106 = v55;
      __int16 v107 = 1024;
      int v108 = v56;
      __int16 v109 = 2114;
      id v110 = v57;
      __int16 v111 = 1024;
      int v112 = 8;
      LODWORD(v94) = 50;
      v91 = buf;
      v58 = (char *)_os_log_send_and_compose_impl();

      if (v58)
      {
        fprintf(__stderrp, "%s\n", v58);
        free(v58);
      }
    }
    else
    {
      v59 = sub_1000D848C();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = v115;
        int v61 = v116;
        id v62 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:(char *)&v116 + 8];
        *(_DWORD *)buf = 68158978;
        *(_DWORD *)&uint8_t buf[4] = 58;
        *(_WORD *)v104 = 2080;
        *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
        __int16 v105 = 2048;
        v106 = v60;
        __int16 v107 = 1024;
        int v108 = v61;
        __int16 v109 = 2114;
        id v110 = v62;
        __int16 v111 = 1024;
        int v112 = 8;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%.*s: Creating device with %llu blocks of %u bytes, instance ID %{public}@, ABI version %d", buf, 0x32u);
      }
    }
    *__error() = v53;
    v63 = [v6 attachParams];
    v64 = [v63 inputURL];
    unsigned __int8 v65 = +[DIAttachParams copyWithURL:v64 outURLStr:v118 maxLen:1024 error:v50];

    if ((v65 & 1) == 0) {
      goto LABEL_65;
    }
    v66 = [v6 attachParams];
    v67 = [v66 shadowChain];
    v68 = [v67 activeShadowURL];
    if (v68)
    {
      v69 = [v6 attachParams];
      v70 = [v69 shadowChain];
      v71 = [v70 activeShadowURL];
      unsigned __int8 v72 = +[DIAttachParams copyWithURL:v71 outURLStr:&v119 maxLen:1024 error:v50];

      if ((v72 & 1) == 0) {
        goto LABEL_65;
      }
    }
    else
    {
    }
    v73 = objc_msgSend(v6, "attachParams", v91, v94);
    v74 = [v73 inputURL];
    unsigned int v75 = [v74 isFileURL];

    if (!v75
      || ([v6 updateFileBackingInfoWithRootDeviceEntryID:(char *)&v117 + 8 error:v50] & 1) != 0)
    {
      uint64_t v76 = IOConnectCallStructMethod((mach_port_t)[v6 ucConnection], 0, &v114, 0x830uLL, &outputStruct, &outputStructCnt);
      if (v76)
      {
        v77 = +[NSString stringWithFormat:@"Create device call failed, error=0x%x", v76];
        LOBYTE(v21) = +[DIError failWithEnumValue:153 verboseInfo:v77 error:v50];
      }
      else
      {
        [v6 setIsNewDevice:v102 != 0];
        v79 = outputStruct;
        v80 = [v6 attachParams];
        [v80 setRegEntryID:v79];

        int v81 = *__error();
        if (sub_1000D850C())
        {
          v82 = sub_1000D848C();
          os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&uint8_t buf[4] = 58;
          *(_WORD *)v104 = 2080;
          *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
          __int16 v105 = 2048;
          v106 = outputStruct;
          v83 = (char *)_os_log_send_and_compose_impl();

          if (v83)
          {
            fprintf(__stderrp, "%s\n", v83);
            free(v83);
          }
        }
        else
        {
          v84 = sub_1000D848C();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68158210;
            *(_DWORD *)&uint8_t buf[4] = 58;
            *(_WORD *)v104 = 2080;
            *(void *)&v104[2] = "-[DIController2IO_XPCHandlerAttach createDeviceWithError:]";
            __int16 v105 = 2048;
            v106 = outputStruct;
            _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%.*s: Device registry entry ID: 0x%llx", buf, 0x1Cu);
          }
        }
        *__error() = v81;
        unsigned int v85 = [v6 isNewDevice];
        if (v98) {
          unsigned int v86 = v85;
        }
        else {
          unsigned int v86 = 0;
        }
        if (v86 == 1
          && [v98 length]
          && (bzero(buf, 0x1060uLL),
              unsigned __int16 v113 = (unsigned __int16)[v98 length],
              objc_msgSend(v98, "getBytes:length:", buf, objc_msgSend(v98, "length")),
              uint64_t v87 = IOConnectCallStructMethod((mach_port_t)[v6 ucConnection], 1u, buf, 0x1062uLL, 0, 0), v87))
        {
          v88 = +[NSString stringWithFormat:@"Failed to quarantine device, error=0x%x", v87];
          LOBYTE(v21) = +[DIError failWithEnumValue:153 verboseInfo:v88 error:v50];
        }
        else
        {
          LOBYTE(v21) = 1;
        }
      }
      goto LABEL_66;
    }
LABEL_65:
    LOBYTE(v21) = 0;
LABEL_66:
  }
LABEL_67:

  return v21;
}

- (id)runWithError:(id *)a3
{
  if (!-[DIController2IO_XPCHandlerAttach setupDriverWithError:](self, "setupDriverWithError:"))
  {
    v11 = 0;
LABEL_11:
    id v8 = 0;
    goto LABEL_13;
  }
  if (![(DIController2IO_XPCHandlerAttach *)self createDeviceWithError:a3]) {
    goto LABEL_12;
  }
  if ([(DIController2IO_XPCHandlerAttach *)self isNewDevice])
  {
    uint64_t v5 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
    int v6 = [v5 diskImageParamsXPC];
    unsigned __int8 v7 = [v6 lockWritableBackendsWithError:a3];

    if ((v7 & 1) == 0) {
      goto LABEL_12;
    }
  }
  if (![(DIBaseXPCHandler *)self connectWithError:a3]
    || (id v8 = [(DIController2IO_XPCHandlerAttach *)self launchIODaemonWithError:a3]) == 0)
  {
LABEL_12:
    [(DIController2IO_XPCHandlerAttach *)self disconnectFromDriverWithError:0];
    v11 = 0;
    id v8 = 0;
    goto LABEL_13;
  }
  int v9 = [(DIController2IO_XPCHandlerAttach *)self attachParams];
  unsigned int v10 = [v9 handleRefCount];

  if (!v10)
  {
    [(DIController2IO_XPCHandlerAttach *)self disconnectFromDriverWithError:0];
    goto LABEL_15;
  }
  if ([(DIController2IO_XPCHandlerAttach *)self disconnectFromDriverWithError:a3])
  {
LABEL_15:
    v11 = v8;
    goto LABEL_11;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (DIAttachParams)attachParams
{
  return self->_attachParams;
}

- (unsigned)ucConnection
{
  return self->_ucConnection;
}

- (BOOL)isNewDevice
{
  return self->_isNewDevice;
}

- (void)setIsNewDevice:(BOOL)a3
{
  self->_isNewDevice = a3;
}

- (void).cxx_destruct
{
}

@end