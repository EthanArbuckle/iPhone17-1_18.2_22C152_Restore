@interface CAFlipBook
- (BOOL)cachesFramesOnExit;
- (BOOL)isInverted;
- (BOOL)isOneHzFlipBook;
- (BOOL)powerSavingEnabled;
- (BOOL)wantsTransform;
- (id)_frameById:(unint64_t)a3;
- (id)_initWithDisplayId:(unsigned int)a3 options:(id)a4;
- (id)activeFrames;
- (id)cancel;
- (id)copyCurrentFrame;
- (id)description;
- (id)frameAtTime:(unint64_t)a3;
- (id)renderForTime:(unint64_t)a3 options:(id)a4 userInfo:(id)a5 error:(id *)a6;
- (unint64_t)maximumMemoryUsageForDiagnostics;
- (unint64_t)memoryUsage;
- (unsigned)contextId;
- (void)_collectFlipBookFrames;
- (void)collect;
- (void)dealloc;
- (void)purge;
- (void)setCachesFramesOnExit:(BOOL)a3;
- (void)setContextId:(unsigned int)a3;
- (void)setInverted:(BOOL)a3;
- (void)setMaximumMemoryUsageForDiagnostics:(unint64_t)a3;
- (void)setOneHzFlipBook:(BOOL)a3;
- (void)setPowerSavingEnabled:(BOOL)a3;
- (void)setWantsTransform:(BOOL)a3;
@end

@implementation CAFlipBook

- (BOOL)cachesFramesOnExit
{
  return self->_cachesFramesOnExit;
}

- (BOOL)isOneHzFlipBook
{
  return self->_oneHzFlipBook;
}

- (BOOL)powerSavingEnabled
{
  return self->_powerSavingEnabled;
}

- (void)setWantsTransform:(BOOL)a3
{
  self->_wantsTransform = a3;
}

- (BOOL)wantsTransform
{
  return self->_wantsTransform;
}

- (void)setMaximumMemoryUsageForDiagnostics:(unint64_t)a3
{
  self->_maximumMemoryUsageForDiagnostics = a3;
}

- (unint64_t)maximumMemoryUsageForDiagnostics
{
  return self->_maximumMemoryUsageForDiagnostics;
}

- (void)setInverted:(BOOL)a3
{
  self->_inverted = a3;
}

- (BOOL)isInverted
{
  return self->_inverted;
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (unsigned)contextId
{
  return self->_contextId;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<CAFlipBook: maximumSize %zu, generation %u, contextId 0x%x>", self->_maximumSize, self->_generation, self->_contextId];
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(CAFlipBook *)self purge];
  mach_port_name_t serverPort = self->_serverPort;
  if (serverPort + 1 >= 2)
  {
    mach_port_deallocate(*MEMORY[0x1E4F14960], serverPort);
    self->_mach_port_name_t serverPort = 0;
  }

  self->_frames = 0;
  v4.receiver = self;
  v4.super_class = (Class)CAFlipBook;
  [(CAFlipBook *)&v4 dealloc];
}

- (void)setCachesFramesOnExit:(BOOL)a3
{
  self->_cachesFramesOnExit = a3;
  _CASFlipBookModify(self->_serverPort, self->_displayId, 5, a3);
}

- (void)setOneHzFlipBook:(BOOL)a3
{
  self->_oneHzFlipBook = a3;
}

- (void)setPowerSavingEnabled:(BOOL)a3
{
  self->_powerSavingEnabled = a3;
}

- (void)purge
{
}

- (void)collect
{
}

- (id)cancel
{
  mach_msg_return_t v7;
  uint64_t v8;
  mach_port_name_t v9;
  IOSurfaceRef v10;
  id v11;
  int msg;
  unsigned char msg_4[60];
  uint64_t v15;

  v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CAFlipBook *)self maximumMemoryUsageForDiagnostics];
  unsigned int serverPort = self->_serverPort;
  unsigned int displayId = self->_displayId;
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg_4[28] = displayId;
  msg_4[32] = v3 != 0;
  *(_WORD *)&msg_4[33] = 0;
  msg_4[35] = 0;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = serverPort;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(void *)&msg_4[12] = 0x9D3700000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_t reply_port = *(_DWORD *)&msg_4[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x28u, 0x40u, reply_port, 0, 0);
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (v7)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (*(_DWORD *)&msg_4[16] != 40347
    || (msg & 0x80000000) == 0
    || *(_DWORD *)&msg_4[20] != 1
    || *(_DWORD *)msg_4 != 56
    || *(_DWORD *)&msg_4[4]
    || *(unsigned __int16 *)&msg_4[34] << 16 != 1114112)
  {
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return 0;
  }
  v8 = *(void *)&msg_4[44];
  v9 = *(_DWORD *)&msg_4[24];
  if (*(_DWORD *)&msg_4[24])
  {
    v10 = IOSurfaceLookupFromMachPort(*(mach_port_t *)&msg_4[24]);
    mach_port_deallocate(*MEMORY[0x1E4F14960], v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = [(CAFlipBook *)self _frameById:v8];
  if (v11)
  {
    [(NSMutableArray *)self->_frames removeAllObjects];
    [(NSMutableArray *)self->_frames addObject:v11];
    [v11 setSurface:v10];
  }
  ++self->_generation;
  if (v10) {
    CFRelease(v10);
  }
  return v11;
}

- (unint64_t)memoryUsage
{
  mach_msg_return_t v5;
  unsigned char msg[36];
  long long v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E4F143B8];
  unsigned int serverPort = self->_serverPort;
  unsigned int displayId = self->_displayId;
  *(_OWORD *)&msg[20] = 0u;
  v8 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = displayId;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = serverPort;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x9D3500000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)msg, 3, 0x24u, 0x34u, reply_port, 0, 0);
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else if (v5)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (*(_DWORD *)&msg[20] == 40345
      && (*(_DWORD *)msg & 0x80000000) == 0
      && *(_DWORD *)&msg[4] == 44
      && !*(_DWORD *)&msg[8]
      && !*(_DWORD *)&msg[32])
    {
      return v8;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return 0;
}

- (id)activeFrames
{
  uint64_t v3 = mach_continuous_time();
  uint64_t v4 = 0;
  if ([(NSMutableArray *)self->_frames count])
  {
    while (1)
    {
      uint64_t v5 = (void *)[(NSMutableArray *)self->_frames objectAtIndex:v4];
      if ([v5 presentationTime] > v3
        && [v5 generation] == self->_generation)
      {
        break;
      }
      if (++v4 >= (unint64_t)[(NSMutableArray *)self->_frames count]) {
        goto LABEL_7;
      }
    }
    if (!v4) {
      goto LABEL_9;
    }
LABEL_7:
    if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_frames, "objectAtIndex:", v4 - 1), "generation") == self->_generation)--v4; {
  }
    }
LABEL_9:
  frames = self->_frames;
  uint64_t v7 = [(NSMutableArray *)frames count] - v4;

  return (id)-[NSMutableArray subarrayWithRange:](frames, "subarrayWithRange:", v4, v7);
}

- (id)copyCurrentFrame
{
  mach_msg_return_t v6;
  mach_port_name_t v7;
  uint64_t v8;
  IOSurfaceRef v9;
  id v10;
  CAFlipBookFrame *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  id v24;
  int msg;
  unsigned char msg_4[60];
  uint64_t v28;

  v28 = *MEMORY[0x1E4F143B8];
  unsigned int serverPort = self->_serverPort;
  unsigned int displayId = self->_displayId;
  memset(&msg_4[16], 0, 44);
  *(_OWORD *)msg_4 = 0u;
  *(void *)&msg_4[20] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg_4[28] = displayId;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = serverPort;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(void *)&msg_4[12] = 0x9D3600000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    mach_port_t reply_port = *(_DWORD *)&msg_4[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (v6)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
    return 0;
  }
  if (*(_DWORD *)&msg_4[16] != 40346
    || (msg & 0x80000000) == 0
    || *(_DWORD *)&msg_4[20] != 1
    || *(_DWORD *)msg_4 != 56
    || *(_DWORD *)&msg_4[4]
    || *(unsigned __int16 *)&msg_4[34] << 16 != 1114112)
  {
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return 0;
  }
  uint64_t v7 = *(_DWORD *)&msg_4[24];
  if (!*(_DWORD *)&msg_4[24]) {
    return 0;
  }
  v8 = *(void *)&msg_4[44];
  v9 = IOSurfaceLookupFromMachPort(*(mach_port_t *)&msg_4[24]);
  mach_port_deallocate(*MEMORY[0x1E4F14960], v7);
  if (!v9) {
    return 0;
  }
  v10 = [(CAFlipBook *)self _frameById:v8];
  if (v10)
  {
    v11 = [CAFlipBookFrame alloc];
    v12 = [v10 presentationTime];
    v13 = [v10 frameId];
    v14 = [v10 generation];
    [v10 apl];
    v16 = v15;
    [v10 aplDimming];
    v18 = v17;
    v19 = [v10 memoryUsage];
    v20 = [v10 isInverted];
    v21 = [v10 userInfo];
    LODWORD(v22) = v16;
    LODWORD(v23) = v18;
    v24 = [(CAFlipBookFrame *)v11 _initWithPresentationTime:v12 frameId:v13 generation:v14 apl:v19 aplDimming:v20 memoryUsage:v21 inverted:v22 userInfo:v23];
    objc_msgSend(v24, "setRawSurface:", objc_msgSend(v10, "rawSurface"));
    [v10 rawSurfaceFrame];
    objc_msgSend(v24, "setRawSurfaceFrame:");
    [v24 setSurface:v9];
  }
  else
  {
    v24 = 0;
  }
  CFRelease(v9);
  return v24;
}

- (id)frameAtTime:(unint64_t)a3
{
  mach_msg_return_t v7;
  mach_error_t v8;
  BOOL v9;
  NSObject *v10;
  char *v11;
  uint64_t v13;
  unsigned char msg[36];
  long long v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E4F143B8];
  unsigned int serverPort = self->_serverPort;
  unsigned int displayId = self->_displayId;
  *(_OWORD *)&msg[20] = 0u;
  v15 = 0u;
  v16 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = displayId;
  *(void *)&v15 = a3;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = serverPort;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x9D3400000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x2Cu, 0x3Cu, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
      goto LABEL_19;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v8 = -308;
    }
    else if (*(_DWORD *)&msg[20] == 40344)
    {
      if ((*(_DWORD *)msg & 0x80000000) != 0) {
        goto LABEL_27;
      }
      if (*(_DWORD *)&msg[4] != 52)
      {
        if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            v9 = 1;
          }
          else {
            v9 = *(_DWORD *)&msg[32] == 0;
          }
          if (v9) {
            v8 = -300;
          }
          else {
            v8 = *(_DWORD *)&msg[32];
          }
          goto LABEL_28;
        }
        goto LABEL_27;
      }
      if (*(_DWORD *)&msg[8])
      {
LABEL_27:
        v8 = -300;
        goto LABEL_28;
      }
      v8 = *(_DWORD *)&msg[32];
      if (!*(_DWORD *)&msg[32])
      {
        v13 = v15;
        self->_lastFrameId = *((void *)&v15 + 1);
        goto LABEL_30;
      }
    }
    else
    {
      v8 = -301;
    }
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)msg);
    if (v8) {
      goto LABEL_19;
    }
    v13 = 0;
LABEL_30:
    [(CAFlipBook *)self _collectFlipBookFrames];
    return [(CAFlipBook *)self _frameById:v13];
  }
  mig_put_reply_port(*(mach_port_t *)&msg[12]);
LABEL_19:
  if (x_log_hook_p())
  {
    mach_error_string(v8);
    x_log_();
  }
  else
  {
    v10 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
    {
      v11 = mach_error_string(v8);
      *(_DWORD *)msg = 67109378;
      *(_DWORD *)&msg[4] = v8;
      *(_WORD *)&msg[8] = 2080;
      *(void *)&msg[10] = v11;
      _os_log_impl(&dword_184668000, v10, OS_LOG_TYPE_ERROR, "-[CAFlipBook frameAtTime:] IPC failed 0x%x - %s", msg, 0x12u);
    }
  }
  return 0;
}

- (id)renderForTime:(unint64_t)a3 options:(id)a4 userInfo:(id)a5 error:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  BOOL v10 = [(CAFlipBook *)self wantsTransform];
  BOOL v11 = [(CAFlipBook *)self isInverted];
  unsigned int serverPort = self->_serverPort;
  unsigned int displayId = self->_displayId;
  unsigned int v14 = [(CAFlipBook *)self contextId];
  if (v10) {
    int v15 = 2;
  }
  else {
    int v15 = 0;
  }
  *(_OWORD *)&msg[20] = 0u;
  long long v46 = 0u;
  uint64_t v50 = 0;
  long long v49 = 0u;
  unsigned long long v48 = 0u;
  long long v47 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(void *)&msg[24] = *MEMORY[0x1E4F14068];
  *(_DWORD *)&msg[32] = displayId;
  LODWORD(v46) = v14;
  *(void *)((char *)&v46 + 4) = a3;
  HIDWORD(v46) = v15 | v11;
  mach_port_t reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = serverPort;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)msg = 5395;
  *(void *)&msg[16] = 0x9D3300000000;
  if (MEMORY[0x1E4F14B18])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    mach_port_t reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v17 = mach_msg((mach_msg_header_t *)msg, 3, 0x34u, 0x6Cu, reply_port, 0, 0);
  uint64_t v18 = v17;
  if ((v17 - 268435458) <= 0xE && ((1 << (v17 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
LABEL_29:
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    uint64_t v44 = objc_msgSend(NSString, "stringWithFormat:", @"IPC Error %d", v18);
    v28 = objc_msgSend(v27, "errorWithDomain:code:userInfo:", @"com.apple.coreanimation.flipbook", 6, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
    id v29 = 0;
    *a6 = v28;
    return v29;
  }
  if (v17)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_29;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v18 = 4294966988;
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_29;
  }
  if (*(_DWORD *)&msg[20] != 40343)
  {
    uint64_t v18 = 4294966995;
    goto LABEL_28;
  }
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      uint64_t v18 = 4294966996;
      if (*(_DWORD *)&msg[32])
      {
        if (*(_DWORD *)&msg[8]) {
          uint64_t v18 = 4294966996;
        }
        else {
          uint64_t v18 = *(unsigned int *)&msg[32];
        }
      }
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v18 = 4294966996;
    goto LABEL_28;
  }
  uint64_t v18 = 4294966996;
  if (*(_DWORD *)&msg[24] != 1 || *(_DWORD *)&msg[4] != 100 || *(_DWORD *)&msg[8]) {
    goto LABEL_28;
  }
  if (WORD1(v46) << 16 != 1114112) {
    goto LABEL_27;
  }
  uint64_t v19 = v47;
  self->_lastFrameId = *((void *)&v47 + 1);
  unsigned long long v22 = v48;
  uint64_t v20 = v22 >> 64;
  unint64_t v21 = v22;
  uint64_t v23 = HIDWORD(v46);
  mach_port_name_t v24 = *(_DWORD *)&msg[28];
  int v25 = v49;
  int v39 = DWORD2(v49);
  int v40 = DWORD1(v49);
  int v38 = HIDWORD(v49);
  if (*(_DWORD *)&msg[28])
  {
    IOSurfaceRef v26 = IOSurfaceLookupFromMachPort(*(mach_port_t *)&msg[28]);
    mach_port_deallocate(*MEMORY[0x1E4F14960], v24);
  }
  else
  {
    IOSurfaceRef v26 = 0;
  }
  if (v23)
  {
    if (a6)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      if (v23 > 6) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = [NSString stringWithUTF8String:status_to_string::status_codes[v23]];
      }
      uint64_t v42 = v32;
      v37 = objc_msgSend(v31, "errorWithDomain:code:userInfo:", @"com.apple.coreanimation.flipbook", v23, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
      id v29 = 0;
      *a6 = v37;
    }
    else
    {
      id v29 = 0;
    }
  }
  else
  {
    if (!v19) {
      __assert_rtn("-[CAFlipBook renderForTime:options:userInfo:error:]", "CAFlipBook.mm", 305, "frameId != 0");
    }
    [(CAFlipBook *)self _collectFlipBookFrames];
    v33 = [CAFlipBookFrame alloc];
    LODWORD(v35) = HIDWORD(v21);
    LODWORD(v34) = v21;
    id v36 = [(CAFlipBookFrame *)v33 _initWithPresentationTime:a3 frameId:v19 generation:self->_generation apl:v20 aplDimming:self->_inverted memoryUsage:a5 inverted:v34 userInfo:v35];
    [v36 setRawSurface:v26];
    objc_msgSend(v36, "setRawSurfaceFrame:", (double)v25, (double)v40, (double)v39, (double)v38);
    [(NSMutableArray *)self->_frames addObject:v36];
    id v29 = v36;
  }
  if (v26) {
    CFRelease(v26);
  }
  return v29;
}

- (void)_collectFlipBookFrames
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (x_log_hook_p())
  {
    unint64_t lastFrameId = self->_lastFrameId;
    x_log_();
  }
  else
  {
    uint64_t v3 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v4 = self->_lastFrameId;
      *(_DWORD *)buf = 134217984;
      unint64_t v7 = v4;
      _os_log_impl(&dword_184668000, v3, OS_LOG_TYPE_DEFAULT, "CAFlipBook collecting frames < %llu", buf, 0xCu);
    }
  }
  while ([(NSMutableArray *)self->_frames count]
       && objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_frames, "objectAtIndex:", 0), "frameId") < self->_lastFrameId)
    [(NSMutableArray *)self->_frames removeObjectAtIndex:0];
}

- (id)_frameById:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  frames = self->_frames;
  uint64_t v6 = [(NSMutableArray *)frames countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(frames);
        }
        BOOL v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 frameId] == a3) {
          return v10;
        }
      }
      uint64_t v7 = [(NSMutableArray *)frames countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  if (x_log_hook_p())
  {
    [(NSMutableArray *)self->_frames count];
    objc_msgSend((id)-[NSMutableArray firstObject](self->_frames, "firstObject"), "frameId");
    objc_msgSend((id)-[NSMutableArray lastObject](self->_frames, "lastObject"), "frameId");
    x_log_();
  }
  else
  {
    v12 = x_log_category_windowserver;
    if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t lastFrameId = self->_lastFrameId;
      int v14 = [(NSMutableArray *)self->_frames count];
      uint64_t v15 = objc_msgSend((id)-[NSMutableArray firstObject](self->_frames, "firstObject"), "frameId");
      uint64_t v16 = objc_msgSend((id)-[NSMutableArray lastObject](self->_frames, "lastObject"), "frameId");
      *(_DWORD *)buf = 134218752;
      unint64_t v18 = lastFrameId;
      __int16 v19 = 1024;
      int v20 = v14;
      __int16 v21 = 2048;
      uint64_t v22 = v15;
      __int16 v23 = 2048;
      uint64_t v24 = v16;
      _os_log_impl(&dword_184668000, v12, OS_LOG_TYPE_DEFAULT, "CAFlipBook _frameById:%llu not found in _frames(size=%i, first=%llu, last=%llu)", buf, 0x26u);
    }
  }
  return 0;
}

- (id)_initWithDisplayId:(unsigned int)a3 options:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CAFlipBook;
  uint64_t v6 = [(CAFlipBook *)&v10 init];
  if (v6)
  {
    v6->_unsigned int serverPort = CARenderServerGetServerPort(0);
    v6->_maximumSize = 512;
    v6->_contextId = 0;
    v6->_unsigned int displayId = a3;
    v6->_unint64_t lastFrameId = 0;
    v6->_generation = 0;
    v6->_wantsTransform = 0;
    v6->_inverted = 0;
    v6->_frames = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"maximumSize"), "intValue");
    if ((v7 - 2) > 0x1FE)
    {
      NSLog(&cfstr_CoreanimationM_10.isa, v7, 512);
    }
    else
    {
      unint64_t v8 = v7;
      _CASFlipBookModify(v6->_serverPort, v6->_displayId, 0, v7);
      v6->_maximumSize = v8;
    }
  }
  return v6;
}

@end