@interface AUAudioUnitOfflineProcessor
- (AUAudioUnitOfflineProcessor)initWithAudioUnit:(id)a3 inputFileURL:(id)a4 outputFileURL:(id)a5 ioSampleRate:(int64_t)a6;
- (BOOL)run;
- (double)initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:;
- (id).cxx_construct;
- (int64_t)assetLength;
@end

@implementation AUAudioUnitOfflineProcessor

- (AUAudioUnitOfflineProcessor)initWithAudioUnit:(id)a3 inputFileURL:(id)a4 outputFileURL:(id)a5 ioSampleRate:(int64_t)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v11 = a3;
  CFURLRef v12 = (const __CFURL *)a4;
  CFURLRef v13 = (const __CFURL *)a5;
  v51.receiver = self;
  v51.super_class = (Class)AUAudioUnitOfflineProcessor;
  v14 = [(AUAudioUnitOfflineProcessor *)&v51 init];
  if (!v14) {
    goto LABEL_20;
  }
  if (!v11) {
    goto LABEL_6;
  }
  int v15 = [v11 renderResourcesAllocated] ^ 1;
  if (!v12) {
    LOBYTE(v15) = 0;
  }
  if ((v15 & 1) == 0)
  {
LABEL_6:
    v16 = APCLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237D0E000, v16, OS_LOG_TYPE_ERROR, "Bad input argument to AUAudioUnitOfflineProcessor", buf, 2u);
    }
LABEL_18:

LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
  v17 = [v11 inputBusses];
  if ([v17 count] != 1)
  {

LABEL_16:
    v16 = APCLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_237D0E000, v16, OS_LOG_TYPE_ERROR, "AUAudioUnitOfflineProcessor only supports single bus IO audio units", buf, 2u);
    }
    goto LABEL_18;
  }
  v18 = [v11 outputBusses];
  BOOL v19 = [v18 count] == 1;

  if (!v19) {
    goto LABEL_16;
  }
  objc_storeStrong((id *)v14 + 3, a3);
  ExtAudioFileRef outExtAudioFile = 0;
  OSStatus v20 = ExtAudioFileOpenURL(v12, &outExtAudioFile);
  if (v20)
  {
    v21 = APCLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "open input file";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v20;
      _os_log_impl(&dword_237D0E000, v21, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", buf, 0x12u);
    }

    goto LABEL_19;
  }
  v23 = (ExtAudioFileRef *)(v14 + 8);
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100]((OpaqueExtAudioFile **)v14 + 1, outExtAudioFile);
  UInt32 ioPropertyDataSize = 8;
  OSStatus Property = ExtAudioFileGetProperty(*((ExtAudioFileRef *)v14 + 1), 0x2366726Du, &ioPropertyDataSize, v14 + 144);
  if (Property)
  {
    v25 = APCLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "query input file length";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = Property;
      _os_log_impl(&dword_237D0E000, v25, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", buf, 0x12u);
    }
LABEL_34:

    goto LABEL_19;
  }
  uint64_t v55 = 0;
  memset(buf, 0, sizeof(buf));
  UInt32 ioPropertyDataSize = 40;
  OSStatus v26 = ExtAudioFileGetProperty(*v23, 0x66666D74u, &ioPropertyDataSize, buf);
  if (v26)
  {
    v25 = APCLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(inPropertyData.mSampleRate) = 136315394;
      *(void *)((char *)&inPropertyData.mSampleRate + 4) = "query input file format";
      LOWORD(inPropertyData.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&inPropertyData.mFormatFlags + 2) = v26;
      _os_log_impl(&dword_237D0E000, v25, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", (uint8_t *)&inPropertyData, 0x12u);
    }
    goto LABEL_34;
  }
  double v27 = *(double *)buf;
  if (a6 >= 0) {
    double v27 = (double)a6;
  }
  inPropertyData.mSampleRate = v27;
  *(_OWORD *)&inPropertyData.mFormatID = xmmword_237D32C00;
  *(_OWORD *)&inPropertyData.mBytesPerFrame = xmmword_237D32C10;
  OSStatus v28 = ExtAudioFileSetProperty(*v23, 0x63666D74u, 0x28u, &inPropertyData);
  if (v28)
  {
    v25 = APCLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 136315394;
      *(void *)&v52[4] = "set input file client data format";
      *(_WORD *)&v52[12] = 1024;
      *(_DWORD *)&v52[14] = v28;
      _os_log_impl(&dword_237D0E000, v25, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", v52, 0x12u);
    }
    goto LABEL_34;
  }
  v29 = (void *)[objc_alloc(MEMORY[0x263EF9388]) initWithStreamDescription:&inPropertyData];
  v30 = [v11 inputBusses];
  v31 = [v30 objectAtIndexedSubscript:0];
  id v48 = 0;
  [v31 setFormat:v29 error:&v48];
  id v32 = v48;

  if (v32)
  {
    v33 = APCLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 138412290;
      *(void *)&v52[4] = v32;
      _os_log_impl(&dword_237D0E000, v33, OS_LOG_TYPE_ERROR, "Error setting the AU input bus format: %@", v52, 0xCu);
    }

LABEL_43:
    v37 = v14;
LABEL_44:

    goto LABEL_19;
  }
  v34 = [v11 outputBusses];
  v35 = [v34 objectAtIndexedSubscript:0];
  id v47 = 0;
  [v35 setFormat:v29 error:&v47];
  id v32 = v47;

  if (v32)
  {
    v36 = APCLogObject();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v52 = 138412290;
      *(void *)&v52[4] = v32;
      _os_log_impl(&dword_237D0E000, v36, OS_LOG_TYPE_ERROR, "Error setting the AU output bus format: %@", v52, 0xCu);
    }

    goto LABEL_43;
  }
  if (v13)
  {
    OSStatus v38 = ExtAudioFileCreateWithURL(v13, 0x57415645u, &inPropertyData, 0, 1u, &outExtAudioFile);
    if (v38)
    {
      v37 = APCLogObject();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v52 = 136315394;
        *(void *)&v52[4] = "create output file";
        *(_WORD *)&v52[12] = 1024;
        *(_DWORD *)&v52[14] = v38;
        _os_log_impl(&dword_237D0E000, v37, OS_LOG_TYPE_ERROR, "Error creating offline processor: failed to %s (error %d)", v52, 0x12u);
      }
      id v32 = v14;
      goto LABEL_44;
    }
    std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100]((OpaqueExtAudioFile **)v14 + 2, outExtAudioFile);
  }
  objc_initWeak(&location, v14);
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __89__AUAudioUnitOfflineProcessor_initWithAudioUnit_inputFileURL_outputFileURL_ioSampleRate___block_invoke;
  v44[3] = &unk_264CFE5E8;
  objc_copyWeak(&v45, &location);
  uint64_t v39 = MEMORY[0x237E2DE80](v44);
  v40 = (void *)*((void *)v14 + 17);
  *((void *)v14 + 17) = v39;

  -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]::$_0::operator()<CA::StreamDescription,std::vector<float>>((uint64_t)&inPropertyData, (char **)v14 + 11, (uint64_t)v52);
  v41 = (void *)*((void *)v14 + 5);
  if (v41)
  {
    *((void *)v14 + 6) = v41;
    operator delete(v41);
    *((void *)v14 + 5) = 0;
    *((void *)v14 + 6) = 0;
    *((void *)v14 + 7) = 0;
  }
  *(_OWORD *)(v14 + 40) = *(_OWORD *)v52;
  *((void *)v14 + 7) = *(void *)&v52[16];
  -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]::$_0::operator()<CA::StreamDescription,std::vector<float>>((uint64_t)&inPropertyData, (char **)v14 + 14, (uint64_t)v52);
  v42 = (void *)*((void *)v14 + 8);
  if (v42)
  {
    *((void *)v14 + 9) = v42;
    operator delete(v42);
    *((void *)v14 + 8) = 0;
    *((void *)v14 + 9) = 0;
    *((void *)v14 + 10) = 0;
  }
  *((_OWORD *)v14 + 4) = *(_OWORD *)v52;
  *((void *)v14 + 10) = *(void *)&v52[16];
  v43 = APCLogObject();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v52 = 0;
    _os_log_impl(&dword_237D0E000, v43, OS_LOG_TYPE_INFO, "Finished offline processor init", v52, 2u);
  }

  objc_destroyWeak(&v45);
  objc_destroyWeak(&location);

LABEL_20:
  return (AUAudioUnitOfflineProcessor *)v14;
}

uint64_t __89__AUAudioUnitOfflineProcessor_initWithAudioUnit_inputFileURL_outputFileURL_ioSampleRate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, UInt32 a4, uint64_t a5, uint64_t a6)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  UInt32 ioNumberFrames = a4;
  uint64_t v9 = ExtAudioFileRead(*((ExtAudioFileRef *)WeakRetained + 1), &ioNumberFrames, *((AudioBufferList **)WeakRetained + 5));
  if (v9)
  {
    v10 = APCLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v17 = v9;
      _os_log_impl(&dword_237D0E000, v10, OS_LOG_TYPE_ERROR, "Read of source file error: %d", buf, 8u);
    }
  }
  else
  {
    if (ioNumberFrames != a4)
    {
      id v11 = APCLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v11, OS_LOG_TYPE_ERROR, "Read of source file returned an unexpected number of frames", buf, 2u);
      }
    }
    *(_DWORD *)a6 = 1;
    *(_DWORD *)(a6 + 8) = 1;
    uint64_t v12 = *((void *)WeakRetained + 5);
    if (!*(_DWORD *)v12)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::logic_error::logic_error(exception, "accessing a CA::BufferList with an out-of-range index");
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
      __cxa_throw(exception, (struct type_info *)off_264CFE380, MEMORY[0x263F8C068]);
    }
    *(void *)(a6 + 16) = *(void *)(v12 + 16);
    *(_DWORD *)(a6 + 12) = *(_DWORD *)(v12 + 12);
  }

  return v9;
}

- (double)initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:
{
  if ((*(_DWORD *)(a1 + 12) & 0x20) != 0) {
    uint64_t v6 = *(unsigned int *)(a1 + 28);
  }
  else {
    uint64_t v6 = 1;
  }
  __x[0] = 0;
  std::vector<char>::vector(&v16, (16 * v6) | 8, __x);
  *(_DWORD *)v16.__begin_ = v6;
  if ((*(_DWORD *)(a1 + 12) & 0x20) != 0) {
    unint64_t v7 = (*(_DWORD *)(a1 + 28) << 11);
  }
  else {
    unint64_t v7 = 2048;
  }
  *(_DWORD *)__x = 0;
  std::vector<float>::assign(a2, v7, __x);
  std::vector<char>::pointer begin = v16.__begin_;
  uint64_t v9 = *(unsigned int *)v16.__begin_;
  if (v9)
  {
    uint64_t v10 = 0;
    id v11 = *a2;
    std::vector<char>::pointer v12 = v16.__begin_ + 16;
    uint64_t v13 = v9 << 11;
    do
    {
      *(void *)std::vector<char>::pointer v12 = &v11[4 * (v10 & 0xFFFFF800)];
      *((void *)v12 - 1) = 0x200000000001;
      v10 += 2048;
      v12 += 16;
    }
    while (v13 != v10);
  }
  *(void *)a3 = begin;
  double result = *(double *)&v16.__end_;
  *(_OWORD *)(a3 + 8) = *(_OWORD *)&v16.__end_;
  return result;
}

- (BOOL)run
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  audioUnit = self->_audioUnit;
  id v23 = 0;
  BOOL v4 = [(AUAudioUnit *)audioUnit allocateRenderResourcesAndReturnError:&v23];
  id v5 = v23;
  if (v5) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = v4;
  }
  if (!v6)
  {
    uint64_t v18 = APCLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_237D0E000, v18, OS_LOG_TYPE_ERROR, "Allocate resources failed on AU: %@", buf, 0xCu);
    }

LABEL_21:
    BOOL v17 = 0;
    goto LABEL_22;
  }
  unint64_t v7 = [(AUAudioUnit *)self->_audioUnit renderBlock];
  id renderBlock = self->_renderBlock;
  self->_id renderBlock = v7;

  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)buf = 0u;
  long long v27 = 0u;
  ExtAudioFileSeek(self->_srcFile.__ptr_.__value_, 0);
  SInt64 outFrameOffset = 0;
  SInt64 assetLength = self->_assetLength;
  if (assetLength >= 1)
  {
    int v10 = 0;
    while (1)
    {
      unsigned int v11 = assetLength - v10;
      UInt32 v12 = v11 >= 0x800 ? 2048 : v11;
      (*((void (**)(void))self->_renderBlock + 2))();
      value = self->_destFile.__ptr_.__value_;
      if (value)
      {
        OSStatus v14 = ExtAudioFileWrite(value, v12, (const AudioBufferList *)self->_destBufferList.mStorage.__begin_);
        OSStatus v15 = v14;
        if ((v14 + 66560) >= 2 && v14 != 0) {
          break;
        }
      }
      *(double *)buf = *(double *)buf + (double)v12;
      ExtAudioFileTell(self->_srcFile.__ptr_.__value_, &outFrameOffset);
      int v10 = outFrameOffset;
      SInt64 assetLength = self->_assetLength;
      if (outFrameOffset >= assetLength) {
        goto LABEL_17;
      }
    }
    OSStatus v20 = APCLogObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 67109120;
      OSStatus v25 = v15;
      _os_log_impl(&dword_237D0E000, v20, OS_LOG_TYPE_ERROR, "AUAudioUnitOfflineProcessor write to output file failed (error %d)", v24, 8u);
    }

    goto LABEL_21;
  }
LABEL_17:
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](&self->_destFile.__ptr_.__value_, 0);
  BOOL v17 = 1;
LABEL_22:

  return v17;
}

- (int64_t)assetLength
{
  return self->_assetLength;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pullInputBlock, 0);
  std::vector<char>::pointer begin = self->_destAudioStorage.__begin_;
  if (begin)
  {
    self->_destAudioStorage.__end_ = begin;
    operator delete(begin);
  }
  BOOL v4 = self->_srcAudioStorage.__begin_;
  if (v4)
  {
    self->_srcAudioStorage.__end_ = v4;
    operator delete(v4);
  }
  id v5 = self->_destBufferList.mStorage.__begin_;
  if (v5)
  {
    self->_destBufferList.mStorage.__end_ = v5;
    operator delete(v5);
  }
  BOOL v6 = self->_srcBufferList.mStorage.__begin_;
  if (v6)
  {
    self->_srcBufferList.mStorage.__end_ = v6;
    operator delete(v6);
  }
  objc_storeStrong(&self->_renderBlock, 0);
  objc_storeStrong((id *)&self->_audioUnit, 0);
  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](&self->_destFile.__ptr_.__value_, 0);

  std::unique_ptr<OpaqueExtAudioFile,applesauce::raii::v1::detail::opaque_deletion_functor<OpaqueExtAudioFile*,&(ExtAudioFileDispose)>>::reset[abi:ne180100](&self->_srcFile.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  self->_srcFile.__ptr_.__value_ = 0;
  self->_destFile.__ptr_.__value_ = 0;
  std::vector<char>::value_type __x = 0;
  std::vector<char>::vector((std::vector<char> *)&self->_srcBufferList, 8uLL, &__x);
  *(_DWORD *)self->_srcBufferList.mStorage.__begin_ = 0;
  std::vector<char>::value_type v5 = 0;
  std::vector<char>::vector((std::vector<char> *)&self->_destBufferList, 8uLL, &v5);
  *(_DWORD *)self->_destBufferList.mStorage.__begin_ = 0;
  *(_OWORD *)&self->_srcAudioStorage.__begin_ = 0u;
  *(_OWORD *)&self->_srcAudioStorage.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_destAudioStorage.__end_ = 0u;
  return self;
}

@end