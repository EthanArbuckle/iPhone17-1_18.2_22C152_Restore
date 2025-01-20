@interface ADEspressoRunnerV1
- (ADEspressoRunnerV1)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5;
- (BOOL)isCVPixelBufferBindingSupportedForFormat:(unsigned int)a3;
- (BOOL)isDirectBindingSupportedForFormat:(unsigned int)a3;
- (BOOL)isVImageBindingSupportedForFormat:(unsigned int)a3;
- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3;
- (id).cxx_construct;
- (id)networkVersionString;
- (id)registerDescriptor:(id)a3;
- (int)bindPixelBufferAsVImage:(__CVBuffer *)a3 toBlob:(const char *)a4;
- (int64_t)execute;
- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4;
- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4;
- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4;
- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6;
- (void)dealloc;
- (void)unlockAllVImageBindBuffers;
@end

@implementation ADEspressoRunnerV1

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  *((_OWORD *)self + 8) = 0u;
  *((_OWORD *)self + 9) = 0u;
  *((_DWORD *)self + 40) = 1065353216;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *((_DWORD *)self + 50) = 1065353216;
  *((_OWORD *)self + 13) = 0u;
  *((_OWORD *)self + 14) = 0u;
  *((_DWORD *)self + 60) = 1065353216;
  return self;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindAsEspressoBufferOutput);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindAsEspressoBufferInput);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindIndirect);
  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindDirect);

  std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::~__hash_table((uint64_t)&self->_pixelBuffersToBindAsVImage);
}

- (void)dealloc
{
  espresso_plan_destroy();
  espresso_context_destroy();
  v3.receiver = self;
  v3.super_class = (Class)ADEspressoRunnerV1;
  [(ADEspressoRunnerV1 *)&v3 dealloc];
}

- (int64_t)execute
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  int v62 = 335678456;
  long long v63 = 0u;
  long long v64 = 0u;
  kdebug_trace();
  kdebug_trace();
  p_p1 = &v2->_pixelBuffersToBindDirect.__table_.__p1_;
  v4 = &_os_log_internal;
  *(void *)&long long v5 = 136315138;
  long long v61 = v5;
  while (1)
  {
    p_p1 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)p_p1->__value_.__next_;
    if (!p_p1) {
      break;
    }
    v6 = p_p1 + 2;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      next = p_p1 + 2;
      if (SHIBYTE(p_p1[4].__value_.__next_) < 0) {
        next = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v6->__value_.__next_;
      }
      LODWORD(buf[0]) = v61;
      *(void *)((char *)buf + 4) = next;
      _os_log_impl(&dword_247EC4000, v4, OS_LOG_TYPE_DEFAULT, "binding \"%s\" as pixel buffer directly", (uint8_t *)buf, 0xCu);
    }
    int v8 = espresso_network_bind_direct_cvpixelbuffer();
    if (v8)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        if (SHIBYTE(p_p1[4].__value_.__next_) < 0) {
          v6 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v6->__value_.__next_;
        }
        LODWORD(buf[0]) = 136315394;
        *(void *)((char *)buf + 4) = v6;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v8;
        v9 = &_os_log_internal;
        v10 = "Failed binding \"%s\" as pixel buffer directly (status:%d)";
        goto LABEL_39;
      }
      goto LABEL_60;
    }
  }
  v11 = &v2->_pixelBuffersToBindIndirect.__table_.__p1_;
  v12 = &_os_log_internal;
  while (1)
  {
    v11 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v11->__value_.__next_;
    if (!v11) {
      break;
    }
    v13 = v11 + 2;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v11 + 2;
      if (SHIBYTE(v11[4].__value_.__next_) < 0) {
        v14 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v13->__value_.__next_;
      }
      LODWORD(buf[0]) = v61;
      *(void *)((char *)buf + 4) = v14;
      _os_log_impl(&dword_247EC4000, v12, OS_LOG_TYPE_DEFAULT, "binding \"%s\" as pixel buffer", (uint8_t *)buf, 0xCu);
    }
    int v15 = espresso_network_bind_cvpixelbuffer();
    if (v15)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        if (SHIBYTE(v11[4].__value_.__next_) < 0) {
          v13 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v13->__value_.__next_;
        }
        LODWORD(buf[0]) = 136315394;
        *(void *)((char *)buf + 4) = v13;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = v15;
        v9 = &_os_log_internal;
        v10 = "Failed binding \"%s\" as pixel buffer (status:%d)";
        goto LABEL_39;
      }
      goto LABEL_60;
    }
  }
  v16 = &v2->_pixelBuffersToBindAsVImage.__table_.__p1_;
  v17 = &_os_log_internal;
  do
  {
    v16 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v16->__value_.__next_;
    if (!v16)
    {
      v24 = (char *)v2->_pixelBuffersToBindAsEspressoBufferInput.__table_.__p1_.__value_.__next_;
      if (v24)
      {
        while (1)
        {
          v25 = v24 + 16;
          v26 = (__CVBuffer *)*((void *)v24 + 6);
          int v27 = espresso_network_bind_buffer();
          if (v27)
          {
            [(ADEspressoRunnerV1 *)v2 unlockAllVImageBindBuffers];
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              goto LABEL_60;
            }
            if (v24[39] < 0) {
              v25 = (void *)*v25;
            }
            LODWORD(v68[0]) = 136315394;
            *(void *)((char *)v68 + 4) = v25;
            WORD6(v68[0]) = 1024;
            *(_DWORD *)((char *)v68 + 14) = v27;
            v9 = &_os_log_internal;
            v10 = "Failed binding \"%s\" as espressoBuffer (status:%d)";
            goto LABEL_71;
          }
          size_t Width = CVPixelBufferGetWidth(v26);
          size_t Height = CVPixelBufferGetHeight(v26);
          PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(v26);
          v32 = PixelBufferUtils::asPixelBuffer(Width, Height, PixelFormatType, *(void **)&buf[0], v31);
          int v33 = PixelBufferUtils::copyPixelBuffer(v32, v26, 0);
          CVPixelBufferRelease(v32);
          if (v33) {
            break;
          }
          v24 = *(char **)v24;
          if (!v24) {
            goto LABEL_45;
          }
        }
        [(ADEspressoRunnerV1 *)v2 unlockAllVImageBindBuffers];
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_60;
        }
        if (v24[39] < 0) {
          v25 = (void *)*v25;
        }
        LODWORD(v68[0]) = 136315394;
        *(void *)((char *)v68 + 4) = v25;
        WORD6(v68[0]) = 1024;
        *(_DWORD *)((char *)v68 + 14) = -1;
        v9 = &_os_log_internal;
        v10 = "Failed copying \"%s\" to espressoBuffer (status:%d)";
LABEL_71:
        v23 = (uint8_t *)v68;
        goto LABEL_40;
      }
LABEL_45:
      memset(v68, 0, sizeof(v68));
      int v69 = 1065353216;
      v35 = &v2->_pixelBuffersToBindAsEspressoBufferOutput.__table_.__p1_;
      v34 = (char *)v2->_pixelBuffersToBindAsEspressoBufferOutput.__table_.__p1_.__value_.__next_;
      if (v34)
      {
        while (1)
        {
          v36 = v34 + 16;
          int v37 = espresso_network_bind_buffer();
          if (v37) {
            break;
          }
          *(void *)v65 = v34 + 16;
          v38 = std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v68, (unsigned __int8 *)v34 + 16, (long long **)v65);
          long long v40 = buf[5];
          long long v39 = buf[6];
          long long v41 = buf[4];
          *(_OWORD *)(v38 + 88) = buf[3];
          uint64_t v42 = v71;
          long long v44 = buf[8];
          long long v43 = buf[9];
          *(_OWORD *)(v38 + 152) = buf[7];
          *(_OWORD *)(v38 + 168) = v44;
          *(_OWORD *)(v38 + 184) = v43;
          *((void *)v38 + 25) = v42;
          *(_OWORD *)(v38 + 104) = v41;
          *(_OWORD *)(v38 + 120) = v40;
          *(_OWORD *)(v38 + 136) = v39;
          long long v46 = buf[1];
          long long v45 = buf[2];
          *(_OWORD *)(v38 + 40) = buf[0];
          *(_OWORD *)(v38 + 56) = v46;
          *(_OWORD *)(v38 + 72) = v45;
          v34 = *(char **)v34;
          if (!v34) {
            goto LABEL_48;
          }
        }
        [(ADEspressoRunnerV1 *)v2 unlockAllVImageBindBuffers];
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        if (v34[39] < 0) {
          v36 = (void *)*v36;
        }
        *(_DWORD *)v65 = 136315394;
        *(void *)&v65[4] = v36;
        __int16 v66 = 1024;
        int v67 = v37;
        v56 = &_os_log_internal;
        v57 = "Failed binding \"%s\" as espressoBuffer (status:%d)";
        v58 = v65;
      }
      else
      {
LABEL_48:
        kdebug_trace();
        kdebug_trace();
        int v47 = espresso_plan_execute_sync();
        kdebug_trace();
        kdebug_trace();
        do
        {
          v35 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v35->__value_.__next_;
          if (!v35)
          {
            kdebug_trace();
            [(ADEspressoRunnerV1 *)v2 unlockAllVImageBindBuffers];
            if (v47) {
              int64_t v59 = -22968;
            }
            else {
              int64_t v59 = 0;
            }
            goto LABEL_67;
          }
          v48 = v35 + 2;
          v49 = (__CVBuffer *)v35[6].__value_.__next_;
          *(void *)&buf[0] = v35 + 2;
          v50 = (void *)*((void *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t *)v68, (unsigned __int8 *)&v35[2], (long long **)buf)+ 5);
          size_t v51 = CVPixelBufferGetWidth(v49);
          size_t v52 = CVPixelBufferGetHeight(v49);
          v53 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(v49);
          v55 = PixelBufferUtils::asPixelBuffer(v51, v52, v53, v50, v54);
          LODWORD(v49) = PixelBufferUtils::copyPixelBuffer(v49, v55, 0);
          CVPixelBufferRelease(v55);
        }
        while (!v49);
        [(ADEspressoRunnerV1 *)v2 unlockAllVImageBindBuffers];
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_66;
        }
        if (SHIBYTE(v35[4].__value_.__next_) < 0) {
          v48 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v48->__value_.__next_;
        }
        LODWORD(buf[0]) = 136315394;
        *(void *)((char *)buf + 4) = v48;
        WORD6(buf[0]) = 1024;
        *(_DWORD *)((char *)buf + 14) = -1;
        v56 = &_os_log_internal;
        v57 = "Failed copying \"%s\" from espressoBuffer (status:%d)";
        v58 = (uint8_t *)buf;
      }
      _os_log_error_impl(&dword_247EC4000, v56, OS_LOG_TYPE_ERROR, v57, v58, 0x12u);
LABEL_66:
      int64_t v59 = -22971;
LABEL_67:
      std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::~__hash_table((uint64_t)v68);
      goto LABEL_61;
    }
    v18 = (__CVBuffer *)v16[6].__value_.__next_;
    CVPixelBufferLockBaseAddress(v18, 1uLL);
    v19 = v16 + 2;
    if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = v16 + 2;
      if (SHIBYTE(v16[4].__value_.__next_) < 0) {
        v20 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v19->__value_.__next_;
      }
      LODWORD(buf[0]) = v61;
      *(void *)((char *)buf + 4) = v20;
      _os_log_impl(&dword_247EC4000, v17, OS_LOG_TYPE_DEFAULT, "binding \"%s\" as vImage", (uint8_t *)buf, 0xCu);
    }
    v21 = v16 + 2;
    if (SHIBYTE(v16[4].__value_.__next_) < 0) {
      v21 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v19->__value_.__next_;
    }
    int v22 = -[ADEspressoRunnerV1 bindPixelBufferAsVImage:toBlob:](v2, "bindPixelBufferAsVImage:toBlob:", v18, v21, v61);
  }
  while (!v22);
  [(ADEspressoRunnerV1 *)v2 unlockAllVImageBindBuffers];
  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    goto LABEL_60;
  }
  if (SHIBYTE(v16[4].__value_.__next_) < 0) {
    v19 = (__compressed_pair<std::__hash_node_base<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *> *>, std::allocator<std::__hash_node<std::__hash_value_type<std::string, PixelBufferSharedPtr>, void *>>> *)v19->__value_.__next_;
  }
  LODWORD(buf[0]) = 136315394;
  *(void *)((char *)buf + 4) = v19;
  WORD6(buf[0]) = 1024;
  *(_DWORD *)((char *)buf + 14) = v22;
  v9 = &_os_log_internal;
  v10 = "Failed binding \"%s\" as vImage (status:%d)";
LABEL_39:
  v23 = (uint8_t *)buf;
LABEL_40:
  _os_log_error_impl(&dword_247EC4000, v9, OS_LOG_TYPE_ERROR, v10, v23, 0x12u);
LABEL_60:
  int64_t v59 = -22971;
LABEL_61:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v62);
  objc_sync_exit(v2);

  return v59;
}

- (void)unlockAllVImageBindBuffers
{
  for (CVPixelBufferRef i = (CVPixelBufferRef)self->_pixelBuffersToBindAsVImage.__table_.__p1_.__value_.__next_;
        i;
        CVPixelBufferRef i = *(CVPixelBufferRef *)i)
  {
    CVPixelBufferUnlockBaseAddress(*((CVPixelBufferRef *)i + 6), 1uLL);
  }
}

- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  size_t Width = CVPixelBufferGetWidth(*a3);
  if (Width != CVPixelBufferGetWidth(*a5) || (size_t v13 = CVPixelBufferGetHeight(*a3), v13 != CVPixelBufferGetHeight(*a5)))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      size_t v25 = CVPixelBufferGetWidth(*a3);
      size_t Height = CVPixelBufferGetHeight(*a3);
      size_t v27 = CVPixelBufferGetWidth(*a5);
      size_t v28 = CVPixelBufferGetHeight(*a5);
      *(_DWORD *)buf = 134218752;
      *(void *)&buf[4] = v25;
      __int16 v40 = 2048;
      uint64_t v41 = Height;
      __int16 v42 = 2048;
      size_t v43 = v27;
      __int16 v44 = 2048;
      size_t v45 = v28;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different dimensions (%zux%zu) vs (%zux%zu)", buf, 0x2Au);
    }
    goto LABEL_10;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(*a3);
  if (PixelFormatType != CVPixelBufferGetPixelFormatType(*a5))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v21 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a3);
      int v22 = buf;
      PixelBufferUtils::pixelFormatAsString(v21, buf);
      if (v42 < 0) {
        int v22 = *(unsigned char **)buf;
      }
      v23 = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(*a5);
      PixelBufferUtils::pixelFormatAsString(v23, (char *)__p);
      if (v34 >= 0) {
        v24 = __p;
      }
      else {
        v24 = (void **)__p[0];
      }
      *(_DWORD *)v35 = 136315394;
      v36 = v22;
      __int16 v37 = 2080;
      v38 = v24;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Input and output pixel buffers have different formats (%s) vs (%s)", v35, 0x16u);
      if (v34 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v42) < 0) {
        operator delete(*(void **)buf);
      }
    }
LABEL_10:
    int64_t v18 = -22953;
    goto LABEL_11;
  }
  BOOL v15 = [(ADEspressoRunnerV1 *)self isDirectBindingSupportedForFormat:CVPixelBufferGetPixelFormatType(*a3)];
  v16 = *a3;
  v17 = *a5;
  if (v15)
  {
    *a3 = v17;
    *a5 = v16;
    int64_t v18 = [(ADEspressoRunnerV1 *)self registerPixelBuffer:*a3 forDescriptor:v10];
    if (v18)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v10 name];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = [v19 UTF8String];
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);
      }
    }
    else
    {
      int64_t v18 = [(ADEspressoRunnerV1 *)self registerPixelBuffer:*a5 forDescriptor:v11];
      if (v18 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        id v29 = [v11 name];
        *(_DWORD *)buf = 136315138;
        *(void *)&buf[4] = [v29 UTF8String];
        _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed to re-register %s", buf, 0xCu);
      }
    }
  }
  else if (PixelBufferUtils::copyPixelBuffer(v16, v17, 0))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v30 = [v11 name];
      uint64_t v31 = [v30 UTF8String];
      id v32 = [v10 name];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v31;
      __int16 v40 = 2080;
      uint64_t v41 = [v32 UTF8String];
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed copying %s to %s", buf, 0x16u);
    }
    int64_t v18 = -22950;
  }
  else
  {
    int64_t v18 = 0;
  }
LABEL_11:

  return v18;
}

- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  long long v5 = a3;
  return [(ADEspressoRunnerV1 *)self registerPixelBufferPtr:&v5 forDescriptor:a4];
}

- (int64_t)registerPixelBufferPtr:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a4;
  LODWORD(v36) = 335679308;
  long long v37 = 0u;
  long long v38 = 0u;
  kdebug_trace();
  v7 = self;
  objc_sync_enter(v7);
  if (v6)
  {
    int v8 = *a3;
    v9 = objc_msgSend(v6, "imageDescriptor", v36, v37, v38);
    id v10 = (PixelBufferUtils *)[v9 pixelFormat];

    [v6 isInput];
    id v11 = [v6 name];
    v12 = (char *)[v11 UTF8String];

    if (espresso_network_query_blob_dimensions())
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
LABEL_4:
        int v13 = 1;
LABEL_5:
        uint64_t v14 = -22971;
        goto LABEL_9;
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v12;
      size_t v25 = &_os_log_internal;
      v26 = "failed to get dimensions for \"%s\"";
LABEL_41:
      _os_log_error_impl(&dword_247EC4000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0xCu);
      goto LABEL_4;
    }
    size_t v17 = v44;
    size_t v18 = v45;
    if (PixelBufferUtils::componentsPerPixelForPixelFormat(v10, 0) == 1
      && !PixelBufferUtils::planeCountForPixelFormat(v10))
    {
      size_t v18 = v46 * v45 * v47;
    }
    if (v8)
    {
      if (*a3) {
        goto LABEL_18;
      }
    }
    else
    {
      *(void *)buf = 0;
      CFDictionaryRef BufferAttributes = (const __CFDictionary *)getBufferAttributes();
      CVReturn v23 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], v44, v18, (OSType)v10, BufferAttributes, (CVPixelBufferRef *)buf);
      v24 = *(__CVBuffer **)buf;
      if (v23) {
        v24 = 0;
      }
      *a3 = v24;
      if (v24)
      {
LABEL_18:
        if ([(ADEspressoRunnerV1 *)v7 isDirectBindingSupportedForFormat:v10])
        {
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v12;
            _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "saving \"%s\" to bind as pixel buffer directly", buf, 0xCu);
          }
          id v19 = *a3;
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          long long v39 = (long long *)buf;
          v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindDirect, buf, &v39);
          CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 6));
          CVPixelBufferRef v21 = CVPixelBufferRetain(v19);
          goto LABEL_23;
        }
        if ([(ADEspressoRunnerV1 *)v7 isCVPixelBufferBindingSupportedForFormat:v10])
        {
          if (!v7->_CPUBindWA)
          {
            if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v12;
              _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "saving \"%s\" to bind as CVPixelBuffer", buf, 0xCu);
            }
            id v30 = *a3;
            std::string::basic_string[abi:ne180100]<0>(buf, v12);
            long long v39 = (long long *)buf;
            v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindIndirect, buf, &v39);
            CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 6));
            CVPixelBufferRef v21 = CVPixelBufferRetain(v30);
            goto LABEL_23;
          }
          if (([v6 isInput] & 1) == 0)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v12;
              _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot bind output \"%s\" buffer on CPU engine in this platform with provided pixel format", buf, 0xCu);
            }
            std::string::basic_string[abi:ne180100]<0>(buf, v12);
            std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__erase_unique<std::string>((uint64_t *)&v7->_pixelBuffersToBindAsVImage, buf);
            if (v43 < 0) {
              operator delete(*(void **)buf);
            }
            int v27 = -12;
            goto LABEL_74;
          }
          if ([(ADEspressoRunnerV1 *)v7 isVImageBindingSupportedForFormat:v10])
          {
            int v27 = 0;
          }
          else
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v12;
              _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot bind input \"%s\" buffer on CPU engine in this platform with provided pixel format", buf, 0xCu);
            }
            std::string::basic_string[abi:ne180100]<0>(buf, v12);
            std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__erase_unique<std::string>((uint64_t *)&v7->_pixelBuffersToBindAsVImage, buf);
            if (v43 < 0) {
              operator delete(*(void **)buf);
            }
            int v27 = -6;
          }
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v12;
            _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "saving \"%s\" to bind as vImage", buf, 0xCu);
          }
          char v34 = *a3;
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          long long v39 = (long long *)buf;
          v35 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindAsVImage, buf, &v39);
          CVPixelBufferRelease(*((CVPixelBufferRef *)v35 + 6));
          *((void *)v35 + 6) = CVPixelBufferRetain(v34);
          if (v43 < 0) {
            operator delete(*(void **)buf);
          }
LABEL_73:
          if (!v27)
          {
LABEL_25:
            int v13 = 0;
            goto LABEL_5;
          }
LABEL_74:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = v12;
            __int16 v41 = 1024;
            int v42 = v27;
            _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed binding espresso buffer \"%s\", status: %d", buf, 0x12u);
            if (v8) {
              goto LABEL_77;
            }
          }
          else if (v8)
          {
LABEL_77:
            *a3 = 0;
            goto LABEL_4;
          }
          CVPixelBufferRelease(*a3);
          goto LABEL_77;
        }
        if (!v8)
        {
          if (ADDebugUtilsADVerboseLogsEnabled && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v12;
            _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "binding \"%s\" buffer to espresso-managed pointer", buf, 0xCu);
          }
          CVPixelBufferRelease(*a3);
          int v27 = espresso_network_bind_buffer();
          if (!v27) {
            *a3 = PixelBufferUtils::asPixelBuffer(v17, v18, v10, *(void **)buf, v31);
          }
          goto LABEL_73;
        }
        if (ADDebugUtilsADVerboseLogsEnabled)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v12;
            size_t v28 = &_os_log_internal;
            os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
LABEL_58:
            _os_log_impl(&dword_247EC4000, v28, v29, "Warning: binding \"%s\" buffer to espresso-managed pointer with copying buffer. note: this is highly inefficient", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v12;
          size_t v28 = &_os_log_internal;
          os_log_type_t v29 = OS_LOG_TYPE_INFO;
          goto LABEL_58;
        }
        int v32 = [v6 isInput];
        int v33 = *a3;
        if (v32)
        {
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          long long v39 = (long long *)buf;
          v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindAsEspressoBufferInput, buf, &v39);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(buf, v12);
          long long v39 = (long long *)buf;
          v20 = std::__hash_table<std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PixelBufferSharedPtr>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PixelBufferSharedPtr>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&v7->_pixelBuffersToBindAsEspressoBufferOutput, buf, &v39);
        }
        CVPixelBufferRelease(*((CVPixelBufferRef *)v20 + 6));
        CVPixelBufferRef v21 = CVPixelBufferRetain(v33);
LABEL_23:
        *((void *)v20 + 6) = v21;
        if (v43 < 0) {
          operator delete(*(void **)buf);
        }
        goto LABEL_25;
      }
    }
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_4;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = v12;
    size_t v25 = &_os_log_internal;
    v26 = "failed allocating CVPixelBuffer for \"%s\"";
    goto LABEL_41;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot register buffer for nil descriptor", buf, 2u);
  }
  uint64_t v14 = -22953;
  int v13 = 1;
LABEL_9:
  objc_sync_exit(v7);

  if (v13) {
    int64_t v15 = v14;
  }
  else {
    int64_t v15 = 0;
  }
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v36);

  return v15;
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4
{
  v15[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  CVPixelBufferRef pixelBufferOut = 0;
  uint64_t v14 = *MEMORY[0x263F04130];
  v15[0] = MEMORY[0x263EFFA78];
  CFDictionaryRef v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  if (CVPixelBufferCreateWithIOSurface(0, a3, v7, &pixelBufferOut))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      id v10 = [v6 name];
      *(_DWORD *)buf = 138412290;
      int v13 = v10;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed allocating pixel buffer for binding %@ as a surface", buf, 0xCu);
    }
    int64_t v8 = -22971;
  }
  else
  {
    int64_t v8 = [(ADEspressoRunnerV1 *)self registerPixelBuffer:pixelBufferOut forDescriptor:v6];
    CVPixelBufferRelease(pixelBufferOut);
  }

  return v8;
}

- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3
{
  v4 = 0;
  [(ADEspressoRunnerV1 *)self registerPixelBufferPtr:&v4 forDescriptor:a3];
  return v4;
}

- (id)registerDescriptor:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = self;
  objc_sync_enter(v5);
  [v4 isInput];
  id v6 = [v4 name];
  [v6 UTF8String];
  int v7 = espresso_network_bind_buffer();

  if (v7)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      v12 = [v4 name];
      *(_DWORD *)buf = 138412546;
      int v27 = v12;
      __int16 v28 = 1024;
      int v29 = v7;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "failed binding espresso buffer \"%@\", status: %d", buf, 0x12u);
    }
    int64_t v8 = 0;
  }
  else
  {
    v9 = [ADEspressoBufferHandle alloc];
    id v10 = [v4 name];
    v13[8] = v23;
    v13[9] = v24;
    uint64_t v14 = v25;
    v13[4] = v19;
    v13[5] = v20;
    v13[6] = v21;
    v13[7] = v22;
    v13[0] = v15;
    v13[1] = v16;
    v13[2] = v17;
    v13[3] = v18;
    int64_t v8 = [(ADEspressoBufferHandle *)v9 initWithName:v10 buffer:v13];
  }
  objc_sync_exit(v5);

  return v8;
}

- (BOOL)isDirectBindingSupportedForFormat:(unsigned int)a3
{
  if (self->_engineType >> 1 != 5003) {
    return 0;
  }
  if (-[ADEspressoRunnerV1 isCVPixelBufferBindingSupportedForFormat:](self, "isCVPixelBufferBindingSupportedForFormat:"))
  {
    return 1;
  }
  BOOL result = 1;
  if ((int)a3 <= 1380411456)
  {
    if (a3 == 843264104) {
      return result;
    }
    int v5 = 1278226536;
LABEL_10:
    if (a3 == v5) {
      return result;
    }
    return 0;
  }
  if (a3 != 1380411457 && a3 != 1751410032)
  {
    int v5 = 1751411059;
    goto LABEL_10;
  }
  return result;
}

- (BOOL)isCVPixelBufferBindingSupportedForFormat:(unsigned int)a3
{
  objc_super v3 = *(PixelBufferUtils **)&a3;
  if (PixelBufferUtils::planeCountForPixelFormat(*(PixelBufferUtils **)&a3)) {
    return 0;
  }
  unint64_t v5 = PixelBufferUtils::pixelSizeForPixelFormat(v3, 0);
  return v5 == PixelBufferUtils::componentsPerPixelForPixelFormat(v3, 0);
}

- (int)bindPixelBufferAsVImage:(__CVBuffer *)a3 toBlob:(const char *)a4
{
  OSType PixelFormatType = (PixelBufferUtils *)CVPixelBufferGetPixelFormatType(a3);
  int v6 = (int)PixelFormatType;
  uint64_t v7 = PixelBufferUtils::planeCountForPixelFormat(PixelFormatType);
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = (CGRect *)MEMORY[0x263F001A8];
    PixelBufferUtils::asVImageBuffer(a3, 0, *MEMORY[0x263F001A8], &v17);
    data = v17.data;
    size_t rowBytes = v17.rowBytes;
    if (v8 != 1)
    {
      uint64_t v12 = 1;
      vImagePixelCount height = v17.height;
      uint64_t v14 = (char *)v17.data;
      do
      {
        memset(&v17, 0, sizeof(v17));
        PixelBufferUtils::asVImageBuffer(a3, (__CVBuffer *)v12, *v9, &v17);
        if (!v17.data) {
          return -6;
        }
        if (&v14[rowBytes * height] != v17.data)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot bind as vImage a buffer with non-tightly-packed planes", buf, 2u);
          }
          return -6;
        }
        vImagePixelCount height = v17.height;
        size_t rowBytes = v17.rowBytes;
        ++v12;
        uint64_t v14 = (char *)v17.data;
      }
      while (v8 != v12);
    }
  }
  else
  {
    PixelBufferUtils::asVImageBuffer(a3, *MEMORY[0x263F001A8], &v17);
    data = v17.data;
  }
  if (!data) {
    return -6;
  }
  switch(v6)
  {
    case 32:
      return espresso_network_bind_input_vimagebuffer_argb8();
    case 1111970369:
      return espresso_network_bind_input_vimagebuffer_bgra8();
    case 1380401729:
      return espresso_network_bind_input_vimagebuffer_rgba8();
  }
  return espresso_network_bind_input_vimagebuffer_planar8();
}

- (BOOL)isVImageBindingSupportedForFormat:(unsigned int)a3
{
  return a3 == 32
      || a3 == 1111970369
      || a3 == 1380401729
      || -[ADEspressoRunnerV1 isCVPixelBufferBindingSupportedForFormat:](self, "isCVPixelBufferBindingSupportedForFormat:");
}

- (id)networkVersionString
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (espresso_network_get_version())
  {
    v2 = 0;
  }
  else
  {
    v2 = [NSString stringWithUTF8String:v4];
  }

  return v2;
}

- (ADEspressoRunnerV1)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  int v34 = 335679304;
  long long v35 = 0u;
  long long v36 = 0u;
  kdebug_trace();
  v33.receiver = self;
  v33.super_class = (Class)ADEspressoRunnerV1;
  id v10 = [(ADEspressoRunnerV1 *)&v33 init];
  id v11 = v10;
  if (v10)
  {
    v10->_CPUBindWA = 0;
    v10->_storageType = 65552;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v8;
      _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "loading network from: %@", buf, 0xCu);
    }
    switch(a4)
    {
      case 0uLL:
        *(void *)&v11->_engineType = 0x1002000000000;
        uint64_t v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.vision.EspressoFramework"];
        int v13 = v12;
        if (!v12) {
          goto LABEL_7;
        }
        uint64_t v14 = [v12 infoDictionary];
        long long v15 = [v14 objectForKeyedSubscript:@"CFBundleVersion"];
        [v15 floatValue];
        BOOL v17 = v16 < 205.0;

        if (v17) {
LABEL_7:
        }
          v11->_CPUBindWA = 1;

        goto LABEL_20;
      case 1uLL:
        int v19 = 2;
        goto LABEL_19;
      case 2uLL:
        int v19 = 5;
        goto LABEL_19;
      case 3uLL:
        int v19 = 10006;
        goto LABEL_19;
      case 4uLL:
        int v19 = 10007;
LABEL_19:
        v11->_engineType = v19;
LABEL_20:
        uint64_t context = espresso_create_context();
        v11->_ctx = (void *)context;
        if (!context)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            long long v22 = &_os_log_internal;
            long long v23 = "failed creating espresso context. this is commonly due to unsupported espresso engine.";
            uint32_t v24 = 2;
            goto LABEL_41;
          }
          goto LABEL_26;
        }
        v11->_plan = (void *)espresso_create_plan();
        [v8 UTF8String];
        int v21 = espresso_plan_add_network();
        if (v21)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v21;
            long long v22 = &_os_log_internal;
            long long v23 = "failed adding plan to espresso runner, status: %d";
LABEL_24:
            uint32_t v24 = 8;
LABEL_41:
            _os_log_error_impl(&dword_247EC4000, v22, OS_LOG_TYPE_ERROR, v23, buf, v24);
            goto LABEL_26;
          }
          goto LABEL_26;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [(ADEspressoRunnerV1 *)v11 networkVersionString];
          uint64_t v27 = [v26 UTF8String];
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = v27;
          _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network version: %s", buf, 0xCu);
        }
        if (v9)
        {
          id v28 = v9;
          [v28 UTF8String];
          int v29 = espresso_network_select_configuration();
          if (v29)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v29;
              long long v22 = &_os_log_internal;
              long long v23 = "failed selecting espresso configuration, status: %d";
              goto LABEL_24;
            }
LABEL_26:
            uint64_t v25 = 0;
            goto LABEL_39;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = [v28 UTF8String];
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = v30;
            _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "network configuration: %s", buf, 0xCu);
          }
        }
        int v31 = espresso_plan_build();
        if (v31)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v31;
            long long v22 = &_os_log_internal;
            long long v23 = "failed building espresso plan, status: %d";
            goto LABEL_24;
          }
          goto LABEL_26;
        }
        break;
      default:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          ADCommonUtils::espressoEngineAsString(a4, buf);
          long long v18 = v38 >= 0 ? buf : *(unsigned char **)buf;
          *(_DWORD *)long long v39 = 136315138;
          __int16 v40 = v18;
          _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "unknown espresso engine '%s' requested.", v39, 0xCu);
          if (v38 < 0) {
            operator delete(*(void **)buf);
          }
        }
        goto LABEL_26;
    }
  }
  uint64_t v25 = v11;
LABEL_39:
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v34);

  return v25;
}

@end