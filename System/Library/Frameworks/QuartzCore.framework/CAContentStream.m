@interface CAContentStream
+ (id)contentStreamWithOptions:(id)a3 queue:(id)a4 handler:(id)a5 error:(id *)a6;
- (BOOL)releaseSurface:(__IOSurface *)a3 error:(id *)a4;
- (BOOL)releaseSurfaceWithId:(unsigned int)a3 error:(id *)a4;
- (BOOL)setExcludedContexts:(id)a3 error:(id *)a4;
- (BOOL)setIncludedContexts:(id)a3 error:(id *)a4;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (BOOL)updateOptions:(id)a3 error:(id *)a4;
- (id).cxx_construct;
- (id)copyOptions;
- (unsigned)streamId;
- (void)clearSeenSurfaces;
- (void)dealloc;
- (void)produceSurface:(unsigned int)a3 withFrameInfo:(const CA_content_stream_frame_info *)a4;
@end

@implementation CAContentStream

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((void *)self + 12) = (char *)self + 128;
  *((void *)self + 13) = (char *)self + 128;
  *((void *)self + 14) = (char *)self + 128;
  *((void *)self + 15) = 8;
  *((_DWORD *)self + 66) = 0;
  *((void *)self + 34) = 0;
  *((void *)self + 35) = 0;
  *((_DWORD *)self + 73) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_seen_surfaces._begin;
  if (begin != self->_seen_surfaces._fixedStorage) {
    free(begin);
  }
  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&self->_excludedContexts);

  std::__hash_table<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,CA::Render::PerModeInfo>>>::~__hash_table((uint64_t)&self->_includedContexts);
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  memset(v19, 0, 25);
  unsigned int v3 = [(CAContentStreamOptions *)self->_options targetDisplayId];
  unsigned int serverPort = self->_serverPort;
  unsigned int port = self->_clientIPC._port;
  int v6 = CA::MachPortUtil::task_identity_port(void)::task[0];
  if (!CA::MachPortUtil::task_identity_port(void)::task[0])
  {
    task_create_identity_token(*MEMORY[0x1E4F14960], CA::MachPortUtil::task_identity_port(void)::task);
    int v6 = CA::MachPortUtil::task_identity_port(void)::task[0];
  }
  v16[0] = 0;
  v16[1] = v3;
  v19[25] = 2;
  __int16 v20 = 0;
  uint64_t v7 = _CASContentStreamModify(serverPort, port, v6, (long long *)v16);
  if (v7)
  {
    uint64_t v8 = v7;
    if (x_log_hook_p())
    {
      uint64_t v12 = v8;
      x_log_();
    }
    else
    {
      v9 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        int v15 = v8;
        _os_log_impl(&dword_184668000, v9, OS_LOG_TYPE_ERROR, "Failed to destroy server-side content stream %u", buf, 8u);
      }
    }
  }
  CA::MachPortUtil::ClientIPC::destroy((CA::MachPortUtil::ClientIPC *)&self->_clientIPC);

  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  _Block_release(self->_handler);
  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  [(CAContentStream *)self clearSeenSurfaces];
  os_unfair_lock_unlock((os_unfair_lock_t)&self->_callback_lock);
  os_unfair_lock_lock((os_unfair_lock_t)&_all_streams_lock);
  v11 = (CAContentStream **)_all_streams;
  if (_all_streams != (_UNKNOWN *)qword_1E8F84E70)
  {
    while (*v11 != self)
    {
      if (++v11 == (CAContentStream **)qword_1E8F84E70)
      {
        v11 = (CAContentStream **)qword_1E8F84E70;
        break;
      }
    }
  }
  if (v11 != (CAContentStream **)qword_1E8F84E70)
  {
    *v11 = *(CAContentStream **)(qword_1E8F84E70 - 8);
    if (qword_1E8F84E70 <= (unint64_t)_all_streams) {
      __assert_rtn("pop_back", "x-small-vector.h", 410, "_end > _begin && \"pop_back on empty container\"");
    }
    qword_1E8F84E70 -= 8;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_streams_lock);
  v13.receiver = self;
  v13.super_class = (Class)CAContentStream;
  [(CAContentStream *)&v13 dealloc];
}

- (unsigned)streamId
{
  return self->_clientIPC._port;
}

- (void)clearSeenSurfaces
{
  begin = self->_seen_surfaces._begin;
  end = self->_seen_surfaces._end;
  if (begin != end)
  {
    v5 = (ipc_space_t *)MEMORY[0x1E4F14960];
    do
    {
      mach_port_name_t port = begin->port;
      if (port) {
        mach_port_deallocate(*v5, port);
      }
      iosurface = begin->iosurface;
      ++begin;
      CFRelease(iosurface);
    }
    while (begin != end);
    begin = self->_seen_surfaces._begin;
  }
  self->_seen_surfaces._end = begin;
}

- (BOOL)releaseSurface:(__IOSurface *)a3 error:(id *)a4
{
  if (!a3) {
    return 0;
  }
  uint64_t ID = IOSurfaceGetID(a3);

  return [(CAContentStream *)self releaseSurfaceWithId:ID error:a4];
}

- (BOOL)releaseSurfaceWithId:(unsigned int)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unsigned int serverPort = self->_serverPort;
    unsigned int port = self->_clientIPC._port;
    *(_OWORD *)&msg[20] = 0u;
    *(_OWORD *)&msg[4] = 0u;
    *(_DWORD *)&msg[24] = 1;
    *(_DWORD *)&msg[28] = port;
    int v12 = 1245184;
    uint64_t v13 = *MEMORY[0x1E4F14068];
    unsigned int v14 = a3;
    reply_unsigned int port = mig_get_reply_port();
    *(_DWORD *)&msg[8] = serverPort;
    *(_DWORD *)&msg[12] = reply_port;
    *(_DWORD *)msg = -2147478253;
    *(void *)&msg[16] = 0x9D3B00000000;
    if (MEMORY[0x1E4F14B18])
    {
      voucher_mach_msg_set((mach_msg_header_t *)msg);
      reply_unsigned int port = *(_DWORD *)&msg[12];
    }
    uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 3, 0x34u, 0x2Cu, reply_port, 0, 0);
    uint64_t v9 = v8;
    if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(*(mach_port_t *)&msg[12]);
    }
    else if (v8)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    }
    else
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 40351)
      {
        uint64_t v9 = 4294966996;
        if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
        {
          uint64_t v9 = *(unsigned int *)&msg[32];
          if (!*(_DWORD *)&msg[32]) {
            return 1;
          }
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
    }
    server_error(a4, v9);
  }
  return 0;
}

- (void)produceSurface:(unsigned int)a3 withFrameInfo:(const CA_content_stream_frame_info *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_callback_lock = &self->_callback_lock;
  os_unfair_lock_lock((os_unfair_lock_t)&self->_callback_lock);
  if (self->_queue && self->_handler)
  {
    if (!a3)
    {
      iosurface = 0;
      uint64_t id = 0;
      goto LABEL_15;
    }
    begin = self->_seen_surfaces._begin;
    end = self->_seen_surfaces._end;
    if (begin != end)
    {
      while (begin->port != a3)
      {
        if (++begin == end)
        {
          begin = self->_seen_surfaces._end;
          break;
        }
      }
    }
    if (begin != end)
    {
LABEL_13:
      uint64_t id = begin->id;
      iosurface = begin->iosurface;
LABEL_15:
      v16 = objc_opt_new();
      [v16 setSurfaceId:id];
      [v16 setSurface:iosurface];
      [v16 setStatus:a4->var1];
      [v16 setDisplayTime:a4->var0];
      [v16 setDropCount:a4->var2];
      LOBYTE(v17) = a4->var9;
      [v16 setDisplayResolution:(double)v17];
      [v16 setContentScaleX:a4->var3];
      [v16 setContentScaleY:a4->var4];
      objc_msgSend(v16, "setContentRect:", a4->var5, a4->var6, a4->var7, a4->var8);
      long long v18 = _Block_copy(self->_handler);
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__CAContentStream_produceSurface_withFrameInfo___block_invoke;
      block[3] = &unk_1E5280838;
      block[5] = v16;
      block[6] = v18;
      block[4] = self;
      dispatch_async(queue, block);
      goto LABEL_16;
    }
    v10 = IOSurfaceLookupFromMachPort(a3);
    if (v10)
    {
      mach_port_mod_refs(*MEMORY[0x1E4F14960], a3, 0, 1);
      IOSurfaceID v11 = IOSurfaceGetID(v10);
      int v12 = self->_seen_surfaces._end;
      unint64_t v13 = v12 - self->_seen_surfaces._begin + 1;
      if (self->_seen_surfaces._capacity < v13)
      {
        X::small_vector_base<ContentStreamClientFrame>::grow((uint64_t)&self->_seen_surfaces, v13);
        int v12 = self->_seen_surfaces._end;
      }
      v12->iosurface = v10;
      v12->uint64_t id = v11;
      v12->unsigned int port = a3;
      begin = self->_seen_surfaces._end;
      self->_seen_surfaces._end = begin + 1;
      goto LABEL_13;
    }
    if (x_log_hook_p())
    {
      x_log_();
    }
    else
    {
      __int16 v20 = x_log_category_windowserver;
      if (os_log_type_enabled((os_log_t)x_log_category_windowserver, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v23 = a3;
        _os_log_impl(&dword_184668000, v20, OS_LOG_TYPE_ERROR, "Failed to create surface from machport %u", buf, 8u);
      }
    }
  }
LABEL_16:
  os_unfair_lock_unlock((os_unfair_lock_t)p_callback_lock);
}

void __48__CAContentStream_produceSurface_withFrameInfo___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  _Block_release(*(const void **)(a1 + 48));
  v2 = *(void **)(a1 + 40);
}

- (BOOL)stop:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (!self->_started)
  {
    if (a3)
    {
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = @"Stream already stopped";
      int v6 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
      BOOL result = 0;
      *a3 = v6;
      return result;
    }
    return 0;
  }
  uint64_t started = _CASContentStreamStartStop(self->_serverPort, self->_clientIPC._port, 0, 0, 0, 0, 0);
  if (started)
  {
    server_error(a3, started);
    return 0;
  }
  self->_uint64_t started = 0;
  return 1;
}

- (BOOL)start:(id *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if (self->_started)
  {
    stream_active_error(a3);
    return 0;
  }
  next = self->_excludedContexts.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (!std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::find<unsigned int>(&self->_includedContexts.__table_.__bucket_list_.__ptr_.__value_, next[4]))
    {
      next = *(_DWORD **)next;
      if (!next) {
        goto LABEL_8;
      }
    }
    if (!a3) {
      return 0;
    }
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Cannot include and exclude the same context";
    unsigned int v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1));
    goto LABEL_21;
  }
LABEL_8:
  int value = self->_includedContexts.__table_.__p2_.__value_;
  int v9 = self->_excludedContexts.__table_.__p2_.__value_;
  unint64_t v10 = (v9 + value);
  if (!(v9 + value))
  {
    if (!a3) {
      return 0;
    }
    uint64_t v21 = *MEMORY[0x1E4F28568];
    v22 = @"Empty context list";
    unsigned int v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
LABEL_21:
    BOOL v4 = 0;
    *a3 = v14;
    return v4;
  }
  memset(v20, 0, sizeof(v20));
  v16 = v20;
  unint64_t v17 = (char *)v20;
  long long v18 = v20;
  uint64_t v19 = 32;
  if (v10 >= 0x21) {
    X::small_vector_base<unsigned int>::grow((int **)&v16, v10);
  }
  for (i = self->_includedContexts.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    uint64_t v15 = i[2];
    X::small_vector_base<unsigned int>::push_back((uint64_t)&v16, &v15);
  }
  for (j = self->_excludedContexts.__table_.__p1_.__value_.__next_; j; j = (void *)*j)
  {
    uint64_t v15 = j[2];
    X::small_vector_base<unsigned int>::push_back((uint64_t)&v16, &v15);
  }
  uint64_t started = _CASContentStreamStartStop(self->_serverPort, self->_clientIPC._port, 1, (uint64_t)v16, (unint64_t)(v17 - (unsigned char *)v16) >> 2, value, v9);
  BOOL v4 = started == 0;
  if (started) {
    server_error(a3, started);
  }
  else {
    self->_uint64_t started = 1;
  }
  if (v16 != v18) {
    free(v16);
  }
  return v4;
}

- (BOOL)updateOptions:(id)a3 error:(id *)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  if (self->_started)
  {
    stream_active_error(a4);
    return 0;
  }
  if (!validate_options((CAContentStreamOptions *)a3, (NSError **)a4)) {
    return 0;
  }
  unsigned int v7 = [a3 targetDisplayId];
  unsigned int v8 = [a3 pixelFormat];
  CFStringRef Name = CGColorSpaceGetName((CGColorSpaceRef)[a3 colorSpaceKey]);
  unsigned __int8 v71 = 0;
  get_colorspace_map(&v71);
  if (v71)
  {
    uint64_t v10 = 0;
    while ((CFStringRef)get_colorspace_map(unsigned char *)::space_names[v10] != Name)
    {
      if (v71 == ++v10) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    LOBYTE(v10) = 0;
  }
  char v70 = [a3 YCbCrMatrix];
  char v69 = [a3 ChromaLocation];
  [a3 frameSize];
  double v12 = v11;
  [a3 frameSize];
  double v66 = v13;
  [a3 minimumFrameTime];
  double v64 = v14;
  __int16 v68 = [a3 queueDepth];
  if ([a3 alwaysScaleToFit]) {
    char v15 = 2;
  }
  else {
    char v15 = 0;
  }
  char v16 = [a3 preserveAspectRatioKey];
  [a3 sourceRect];
  double v62 = v17;
  [a3 sourceRect];
  double v19 = v18;
  [a3 sourceRect];
  double v21 = v20;
  [a3 sourceRect];
  double v23 = v22;
  [a3 destinationRect];
  double v25 = v24;
  [a3 destinationRect];
  double v27 = v26;
  [a3 destinationRect];
  double v29 = v28;
  [a3 destinationRect];
  double v31 = v30;
  if ([a3 backgroundColorKey])
  {
    size_t NumberOfComponents = CGColorGetNumberOfComponents((CGColorRef)[a3 backgroundColorKey]);
    Components = (float64x2_t *)CGColorGetComponents((CGColorRef)[a3 backgroundColorKey]);
    int16x8_t v34 = 0uLL;
    if (NumberOfComponents >= 4 && Components)
    {
      float64x2_t v35 = (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL);
      __asm { FMOV            V3.2D, #0.5 }
      int16x8_t v34 = (int16x8_t)vcvtq_s64_f64(vmlaq_f64(_Q3, v35, *Components));
      *(int16x4_t *)v34.i8 = vuzp1_s16((int16x4_t)vmovn_s64((int64x2_t)v34), (int16x4_t)vmovn_s64(vcvtq_s64_f64(vmlaq_f64(_Q3, v35, Components[1]))));
    }
  }
  else
  {
    int16x8_t v34 = 0uLL;
  }
  if (self->_options)
  {
    char v43 = 0;
    pid_t v44 = 0;
  }
  else
  {
    int16x8_t v60 = v34;
    pid_t v45 = getpid();
    char v43 = 1;
    int16x8_t v34 = v60;
    pid_t v44 = v45;
  }
  unsigned int v46 = v12;
  unsigned int v47 = v66;
  float v48 = v64;
  char v49 = v15 | v16;
  unsigned int v50 = v62;
  unsigned int v51 = v31;
  unsigned int serverPort = self->_serverPort;
  unsigned int port = self->_clientIPC._port;
  int v54 = CA::MachPortUtil::task_identity_port(void)::task[0];
  if (!CA::MachPortUtil::task_identity_port(void)::task[0])
  {
    unsigned int v63 = self->_serverPort;
    pid_t v58 = v44;
    unsigned int v59 = self->_clientIPC._port;
    int16x8_t v61 = v34;
    char v67 = v43;
    char v65 = v49;
    unsigned int v56 = v47;
    unsigned int v57 = v46;
    task_create_identity_token(*MEMORY[0x1E4F14960], CA::MachPortUtil::task_identity_port(void)::task);
    unsigned int v51 = v31;
    unsigned int v47 = v56;
    unsigned int v46 = v57;
    pid_t v44 = v58;
    unsigned int port = v59;
    unsigned int serverPort = v63;
    char v49 = v65;
    char v43 = v67;
    int16x8_t v34 = v61;
    int v54 = CA::MachPortUtil::task_identity_port(void)::task[0];
  }
  *(void *)&long long v72 = __PAIR64__(v7, v44);
  *((void *)&v72 + 1) = __PAIR64__(v46, v8);
  unsigned int v73 = v47;
  unsigned int v74 = v50;
  unsigned int v75 = v19;
  unsigned int v76 = v21;
  unsigned int v77 = v23;
  unsigned int v78 = v25;
  unsigned int v79 = v27;
  unsigned int v80 = v29;
  unsigned int v81 = v51;
  float v82 = v48;
  __int16 v83 = v68;
  char v84 = v10;
  char v85 = v70;
  char v86 = v69;
  unsigned __int32 v87 = vmovn_s16(v34).u32[0];
  char v88 = v43;
  char v89 = v49;
  char v90 = 0;
  uint64_t v55 = _CASContentStreamModify(serverPort, port, v54, &v72);
  BOOL v41 = v55 == 0;
  if (v55) {
    server_error(a4, v55);
  }

  self->_options = (CAContentStreamOptions *)[a3 copy];
  [(CAContentStream *)self clearSeenSurfaces];
  return v41;
}

- (id)copyOptions
{
  return (id)[(CAContentStreamOptions *)self->_options copy];
}

- (BOOL)setExcludedContexts:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL started = self->_started;
  if (self->_started)
  {
    stream_active_error(a4);
  }
  else
  {
    p_excludedContexts = &self->_excludedContexts;
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear(&self->_excludedContexts.__table_.__bucket_list_.__ptr_.__value_);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(a3);
          }
          unsigned int v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) unsignedIntValue];
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int,unsigned int>((uint64_t)p_excludedContexts, v11, v11, 0);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v8);
    }
  }
  return !started;
}

- (BOOL)setIncludedContexts:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL started = self->_started;
  if (self->_started)
  {
    stream_active_error(a4);
  }
  else
  {
    p_includedContexts = &self->_includedContexts;
    std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::clear(&self->_includedContexts.__table_.__bucket_list_.__ptr_.__value_);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(a3);
          }
          unsigned int v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) unsignedIntValue];
          std::__hash_table<std::__hash_value_type<unsigned int,unsigned int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,unsigned int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,unsigned int,unsigned int>((uint64_t)p_includedContexts, v11, v11, 0);
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v8);
    }
  }
  return !started;
}

+ (id)contentStreamWithOptions:(id)a3 queue:(id)a4 handler:(id)a5 error:(id *)a6
{
  v33[1] = *MEMORY[0x1E4F143B8];
  if (!a4 || !a5)
  {
    if (a6)
    {
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v33[0] = @"Invalid handler";
      unsigned int v11 = 0;
      *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 3, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1));
      return v11;
    }
    return 0;
  }
  if (!validate_options((CAContentStreamOptions *)a3, (NSError **)a6)) {
    return 0;
  }
  unsigned int v11 = (NSObject **)objc_alloc_init((Class)a1);
  if (!v11) {
    return v11;
  }
  *((_DWORD *)v11 + 64) = CARenderServerGetServerPort(0);
  uint64_t v12 = CA::MachPortUtil::ClientIPC::create((mach_port_context_t)(v11 + 33), "CAContentStreamClientHandler");
  if (v12)
  {
    if (a6)
    {
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Error creating client ports! 0x%x", v12);
      uint64_t v30 = *MEMORY[0x1E4F28568];
      uint64_t v31 = v13;
      *a6 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CoreAnimationErrorDomain", 2, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    }

    return 0;
  }
  if (([v11 updateOptions:a3 error:a6] & 1) == 0)
  {

    return 0;
  }
  *((unsigned char *)v11 + 288) = 0;
  v11[38] = _Block_copy(a5);
  dispatch_retain((dispatch_object_t)a4);
  v11[37] = a4;
  long long v14 = v11[35];
  if (v14) {
    dispatch_activate(v14);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_all_streams_lock);
  long long v16 = _all_streams;
  long long v15 = (NSObject ***)qword_1E8F84E70;
  uint64_t v17 = (qword_1E8F84E70 - (uint64_t)_all_streams) >> 3;
  if (qword_1E8F84E80 < (unint64_t)(v17 + 1))
  {
    uint64_t v18 = qword_1E8F84E78;
    unint64_t v19 = (qword_1E8F84E80 + 1) | ((unint64_t)(qword_1E8F84E80 + 1) >> 1) | (((qword_1E8F84E80 + 1) | ((unint64_t)(qword_1E8F84E80 + 1) >> 1)) >> 2);
    unint64_t v20 = v19 | (v19 >> 4) | ((v19 | (v19 >> 4)) >> 8);
    unint64_t v21 = v20 | (v20 >> 16) | ((v20 | (v20 >> 16)) >> 32);
    if (v21 + 1 > v17 + 1) {
      uint64_t v22 = v21 + 1;
    }
    else {
      uint64_t v22 = v17 + 1;
    }
    double v23 = (char *)malloc_type_malloc(8 * v22, 0x80040B8603338uLL);
    double v24 = v23;
    double v25 = (uint64_t *)_all_streams;
    uint64_t v26 = qword_1E8F84E70;
    if (_all_streams != (_UNKNOWN *)qword_1E8F84E70)
    {
      double v27 = v23;
      do
      {
        uint64_t v28 = *v25++;
        *(void *)double v27 = v28;
        v27 += 8;
      }
      while (v25 != (uint64_t *)v26);
    }
    if (v16 != (void *)v18) {
      free(_all_streams);
    }
    long long v15 = (NSObject ***)&v24[8 * v17];
    _all_streams = v24;
    qword_1E8F84E70 = (uint64_t)v15;
    qword_1E8F84E80 = v22;
  }
  *long long v15 = v11;
  qword_1E8F84E70 += 8;
  unsigned int v11 = v11;
  os_unfair_lock_unlock((os_unfair_lock_t)&_all_streams_lock);
  return v11;
}

@end