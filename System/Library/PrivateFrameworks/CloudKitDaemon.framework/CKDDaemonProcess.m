@interface CKDDaemonProcess
+ (id)currentProcess;
+ (void)deriveCurrentProcessWithArgC:(int)a3 argv:(const char *)a4;
- (BOOL)isSystemInstalledBinary;
- (C2Multipeer)multipeer;
- (id)_initWithArgC:(int)a3 argv:(const char *)a4;
- (id)_initWithProcessType:(int64_t)a3;
- (id)chunkDataFromSignature:(id)a3 forContainerIdentifier:(id)a4;
- (int64_t)processType;
- (void)setMultipeer:(id)a3;
@end

@implementation CKDDaemonProcess

- (int64_t)processType
{
  return self->_processType;
}

+ (id)currentProcess
{
  id v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)qword_1EBBD0188;
  if (!qword_1EBBD0188)
  {
    v4 = [CKDDaemonProcess alloc];
    uint64_t v6 = objc_msgSend__initWithProcessType_(v4, v5, 2);
    v7 = (void *)qword_1EBBD0188;
    qword_1EBBD0188 = v6;

    v3 = (void *)qword_1EBBD0188;
  }
  id v8 = v3;
  objc_sync_exit(v2);

  return v8;
}

+ (void)deriveCurrentProcessWithArgC:(int)a3 argv:(const char *)a4
{
  uint64_t v5 = *(void *)&a3;
  id obj = a1;
  objc_sync_enter(obj);
  if (qword_1EBBD0188)
  {
    v13 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v7, v8);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, obj, @"CKDDaemonProcess.m", 41, @"Not expected to have a current process here");
  }
  v9 = [CKDDaemonProcess alloc];
  uint64_t v11 = objc_msgSend__initWithArgC_argv_(v9, v10, v5, a4);
  v12 = (void *)qword_1EBBD0188;
  qword_1EBBD0188 = v11;

  objc_sync_exit(obj);
}

- (id)_initWithProcessType:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CKDDaemonProcess;
  v4 = [(CKDDaemonProcess *)&v11 init];
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4->_processType = a3;
    if (*MEMORY[0x1E4F1A4F0] != -1) {
      dispatch_once(MEMORY[0x1E4F1A4F0], &unk_1F2044770);
    }
    *(unsigned char *)(v5 + 8) = *MEMORY[0x1E4F1A4E8];
    if (!a3 && _os_feature_enabled_impl())
    {
      id v6 = objc_alloc(MEMORY[0x1E4F50D60]);
      uint64_t v8 = objc_msgSend_initWithChunkDelegate_(v6, v7, v5);
      v9 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = v8;
    }
  }
  return (id)v5;
}

- (id)_initWithArgC:(int)a3 argv:(const char *)a4
{
  uint64_t v8 = 0;
  char v9 = 0;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = xmmword_1E64F8028;
  long long v25 = unk_1E64F8038;
  long long v26 = xmmword_1E64F8048;
  long long v27 = unk_1E64F8058;
  option v21 = *(option *)ymmword_1E64F7FE8;
  long long v22 = xmmword_1E64F8008;
  long long v23 = unk_1E64F8018;
  while (1)
  {
    while (1)
    {
      int v10 = getopt_long_only(a3, (char *const *)a4, "std", &v21, 0);
      if (v10 <= 114) {
        break;
      }
      if (v10 == 115)
      {
        uint64_t v8 = 1;
      }
      else if (v10 == 116)
      {
        uint64_t v8 = 2;
      }
    }
    if (v10 == -1) {
      break;
    }
    if (v10 == 100) {
      char v9 = 1;
    }
  }
  uint64_t v12 = objc_msgSend__initWithProcessType_(self, v11, v8, *(_OWORD *)&v21.name, *(_OWORD *)&v21.flag, v22, v23, v24, v25, v26, v27);
  v15 = (void *)v12;
  if (v12)
  {
    if (*(unsigned char *)(v12 + 8) == (v9 & 1))
    {
      v17 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, v15, @"CKDDaemonProcess.m", 85, @"Incompatible env and cli arguments for using debug");
    }
    if ((v15[2] == 2) != (*MEMORY[0x1E4F1A4E0] != 0))
    {
      v19 = objc_msgSend_currentHandler(MEMORY[0x1E4F28B00], v13, v14);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, v15, @"CKDDaemonProcess.m", 86, @"Incompatible env and cli arguments for supporting test hooks");
    }
  }
  return v15;
}

- (id)chunkDataFromSignature:(id)a3 forContainerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v20 = 0;
    option v21 = &v20;
    uint64_t v22 = 0x3032000000;
    long long v23 = sub_1C4FBF7CC;
    long long v24 = sub_1C4FBF7DC;
    id v25 = 0;
    int v10 = objc_msgSend_defaultContext(CKDLogicalDeviceContext, v8, v9);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1C4FBF7E4;
    v14[3] = &unk_1E64F8070;
    id v11 = v10;
    id v15 = v11;
    id v16 = v7;
    v17 = self;
    id v18 = v6;
    v19 = &v20;
    CKMuckingWithPersonas(v14);
    id v12 = (id)v21[5];

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (BOOL)isSystemInstalledBinary
{
  return self->_isSystemInstalledBinary;
}

- (C2Multipeer)multipeer
{
  return self->_multipeer;
}

- (void)setMultipeer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end