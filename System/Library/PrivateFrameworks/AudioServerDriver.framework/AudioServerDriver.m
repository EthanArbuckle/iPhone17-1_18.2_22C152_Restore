uint64_t ASD_GetPropertyData(AudioServerPlugInDriverInterface **a1, uint64_t a2, uint64_t a3, const AudioObjectPropertyAddress *a4, unsigned int a5, const void *a6, unsigned int a7, unsigned int *a8, void *a9)
{
  void *v9;
  uint64_t v10;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *context;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v9 = 0;
  v32 = *MEMORY[0x263EF8340];
  v10 = 2003329396;
  if (a4 && a8)
  {
    context = (void *)MEMORY[0x22A63EEF0]();
    v18 = getASDPlugin(a1);
    v9 = v18;
    if (v18)
    {
      v19 = [v18 objectForObjectID:a2];
      v20 = v19;
      if (v19)
      {
        if ([v19 hasProperty:a4])
        {
          if (a9)
          {
            *a8 = a7;
            if ([v20 getProperty:a4 withQualifierSize:a5 qualifierData:a6 dataSize:a8 andData:a9 forClient:a3])v10 = 0; {
            else
            }
              v10 = 2003329396;
          }
          else if (!a7)
          {
            v10 = 0;
            *a8 = 0;
          }
        }
        else
        {
          v10 = 2003332927;
        }
      }
      else
      {
        v10 = 560947818;
      }
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = objc_claimAutoreleasedReturnValue();
      [v22 UTF8String];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v27 = "!plugin";
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
        v30 = 1024;
        v31 = 1104;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
      }
      v10 = 560947818;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_GetPropertyData: ASD driver reference\n", buf, 2u);
      }
      v20 = 0;
    }
  }
  else
  {
    v20 = 0;
  }

  return v10;
}

void sub_225CD63FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getASDPlugin(AudioServerPlugInDriverInterface **a1)
{
  if (*a1 && (reserved = (id *)(*a1)[1]._reserved) != 0) {
    id WeakRetained = objc_loadWeakRetained(reserved + 3);
  }
  else {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

void sub_225CD69A8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_225CD7D88(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3F0], 8);
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_225CD7EFC(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v4, 0x10A1C4051BADACELL);

  _Unwind_Resume(a1);
}

void sub_225CD8020(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CD84EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASDSRCStreamHelper::ASDSRCStreamHelper(uint64_t a1, _OWORD *a2, const void **a3, void **a4, int a5)
{
  v8 = a2;
  long long v10 = *a2;
  long long v11 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v10;
  *(_OWORD *)(a1 + 16) = v11;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  std::vector<CAStreamBasicDescription>::__init_with_size[abi:ne180100]<CAStreamBasicDescription*,CAStreamBasicDescription*>((void *)(a1 + 40), *a3, (uint64_t)a3[1], 0xCCCCCCCCCCCCCCCDLL * (((unsigned char *)a3[1] - (unsigned char *)*a3) >> 3));
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 80) = 0;
  uint64_t v41 = a1;
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__init_with_size[abi:ne180100]<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>((void *)(a1 + 64), *a4, a4[1], ((char *)a4[1] - (char *)*a4) >> 4);
  *(_OWORD *)(a1 + 136) = 0u;
  uint64_t v12 = a1 + 136;
  *(void *)(v12 + 24) = 0;
  *(unsigned char *)(v12 + 16) = 0;
  *(_OWORD *)(v12 - 32) = 0u;
  *(_OWORD *)(v12 - 16) = 0u;
  *(_OWORD *)(v12 - 48) = 0u;
  int v39 = a5;
  *(unsigned char *)(v12 + 32) = a5;
  *(void *)(v12 + 48) = 0;
  *(void *)(v12 + 56) = 0;
  *(void *)(v12 + 40) = 0;
  *(unsigned char *)(v12 + 64) = 1;
  uint64_t v13 = (unsigned char *)a3[1] - (unsigned char *)*a3;
  if (!v13)
  {
    v35 = "underlyingStreamFormats.size() > 0";
    int v36 = 30;
    goto LABEL_43;
  }
  if (0xCCCCCCCCCCCCCCCDLL * (v13 >> 3) != ((char *)a4[1] - (char *)*a4) >> 4)
  {
    v35 = "underlyingStreamIOBlocks.size() == underlyingStreamFormats.size()";
    int v36 = 31;
    goto LABEL_43;
  }
  if ((v8[12] & 0x20) != 0)
  {
    v35 = "srcFormat.IsInterleaved()";
    int v36 = 32;
    goto LABEL_43;
  }
  if (*(double *)v8 == 0.0)
  {
    v35 = "srcFormat.mSampleRate != 0";
    int v36 = 33;
LABEL_43:
    __assert_rtn("ASDSRCStreamHelper", "ASDSRCStreamHelper.mm", v36, v35);
  }
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&inSourceFormat);
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&inDestinationFormat);
  v14 = (char *)*a3;
  v40 = (char *)a3[1];
  if (*a3 != v40)
  {
    while (1)
    {
      if ((v14[12] & 0x20) != 0)
      {
        int v33 = 42;
        v34 = "underlyingFmt.IsInterleaved()";
        goto LABEL_38;
      }
      int v15 = *((_DWORD *)v14 + 7);
      if (!v15)
      {
        int v33 = 43;
        v34 = "underlyingFmt.NumberChannels() != 0";
        goto LABEL_38;
      }
      if (v15 != *((_DWORD *)v8 + 7)) {
        break;
      }
      if (*(double *)v14 == 0.0)
      {
        int v33 = 45;
        v34 = "underlyingFmt.mSampleRate != 0";
LABEL_38:
        __assert_rtn("ASDSRCStreamHelper", "ASDSRCStreamHelper.mm", v33, v34);
      }
      if (v39) {
        double v16 = *(double *)v14;
      }
      else {
        double v16 = *(double *)v8;
      }
      if (v39) {
        double v17 = *(double *)v8;
      }
      else {
        double v17 = *(double *)v14;
      }
      double v18 = *(double *)(v41 + 160);
      double v19 = v17 / v16;
      if (v16 > v17) {
        double v19 = v16 / v17;
      }
      if (v18 <= v19) {
        double v18 = v19;
      }
      *(double *)(v41 + 160) = v18;
      if (v16 != v17)
      {
        memset(&__p, 0, 24);
        operator new();
      }
      *(unsigned char *)(v41 + 152) = 1;
      v14 += 40;
      if (v14 == v40) {
        goto LABEL_23;
      }
    }
    int v33 = 44;
    v34 = "underlyingFmt.NumberChannels() == srcFormat.NumberChannels()";
    goto LABEL_38;
  }
LABEL_23:
  v20 = (AudioConverterRef *)(v12 + 8);
  if (v39)
  {
    uint64_t v21 = *((void *)*a3 + 4);
    long long v22 = *((_OWORD *)*a3 + 1);
    *(_OWORD *)&inSourceFormat.mSampleRate = *(_OWORD *)*a3;
    *(_OWORD *)&inSourceFormat.mBytesPerPacket = v22;
    *(void *)&inSourceFormat.mBitsPerChannel = v21;
  }
  else
  {
    long long v23 = *((_OWORD *)v8 + 1);
    *(_OWORD *)&inSourceFormat.mSampleRate = *(_OWORD *)v8;
    *(_OWORD *)&inSourceFormat.mBytesPerPacket = v23;
    *(void *)&inSourceFormat.mBitsPerChannel = *((void *)v8 + 4);
    v8 = *a3;
  }
  long long v24 = *(_OWORD *)v8;
  long long v25 = *((_OWORD *)v8 + 1);
  *(void *)&inDestinationFormat.mBitsPerChannel = *((void *)v8 + 4);
  *(_OWORD *)&inDestinationFormat.mSampleRate = v24;
  *(_OWORD *)&inDestinationFormat.mBytesPerPacket = v25;
  if (*(unsigned char *)(v41 + 152))
  {
    OSStatus v26 = AudioConverterNew(&inSourceFormat, &inDestinationFormat, v20);
    OSStatus v27 = v26;
    if (v26)
    {
      LOBYTE(__p.mSampleRate) = HIBYTE(v26);
      BYTE1(__p.mSampleRate) = BYTE2(v26);
      BYTE2(__p.mSampleRate) = BYTE1(v26);
      *(_WORD *)((char *)&__p.mSampleRate + 3) = v26;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ASDSRCStreamHelper::ASDSRCStreamHelper();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      *(void *)exception = &unk_26D96F3D0;
      exception[2] = v27;
    }
  }
  else
  {
    *(_OWORD *)&__p.mSampleRate = *(_OWORD *)&inSourceFormat.mSampleRate;
    *(_OWORD *)&__p.mBytesPerPacket = *(_OWORD *)&inSourceFormat.mBytesPerPacket;
    __p.mReserved = inSourceFormat.mReserved;
    __p.mFormatFlags = 9;
    __p.mBytesPerPacket = 4 * inSourceFormat.mChannelsPerFrame;
    __p.mBytesPerFrame = 4 * inSourceFormat.mChannelsPerFrame;
    __p.mBitsPerChannel = 32;
    OSStatus v29 = AudioConverterNew(&inSourceFormat, &__p, (AudioConverterRef *)v12);
    OSStatus v30 = v29;
    if (v29)
    {
      LOBYTE(v42.mSampleRate) = HIBYTE(v29);
      BYTE1(v42.mSampleRate) = BYTE2(v29);
      BYTE2(v42.mSampleRate) = BYTE1(v29);
      *(_WORD *)((char *)&v42.mSampleRate + 3) = v29;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ASDSRCStreamHelper::ASDSRCStreamHelper();
      }
      v37 = __cxa_allocate_exception(0x10uLL);
      *(void *)v37 = &unk_26D96F3D0;
      v37[2] = v30;
    }
    *(void *)&v42.mFormatID = *(void *)&__p.mFormatID;
    *(_OWORD *)&v42.mBytesPerPacket = *(_OWORD *)&__p.mBytesPerPacket;
    *(void *)&v42.mBitsPerChannel = *(void *)&__p.mBitsPerChannel;
    v42.mSampleRate = inDestinationFormat.mSampleRate;
    OSStatus v31 = AudioConverterNew(&v42, &inDestinationFormat, v20);
    if (v31)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        ASDSRCStreamHelper::ASDSRCStreamHelper();
      }
      v38 = __cxa_allocate_exception(0x10uLL);
      *(void *)v38 = &unk_26D96F3D0;
      v38[2] = v31;
    }
  }
  return v41;
}

void sub_225CD8F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  std::vector<std::vector<RamstadSRC *>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 160));
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 160));
  int v33 = *a11;
  if (*a11)
  {
    *(void *)(a17 + 48) = v33;
    operator delete(v33);
  }
  _Unwind_Resume(a1);
}

void ASDSRCStreamHelper::~ASDSRCStreamHelper(ASDSRCStreamHelper *this)
{
  v3 = (RamstadSRC ***)*((void *)this + 14);
  uint64_t v4 = (RamstadSRC ***)*((void *)this + 15);
  v2 = (uint64_t *)((char *)this + 112);
  while (v3 != v4)
  {
    v5 = *v3;
    v6 = v3[1];
    while (v5 != v6)
    {
      if (*v5)
      {
        RamstadSRC::~RamstadSRC(*v5);
        MEMORY[0x22A63EB50]();
      }
      ++v5;
    }
    v3 += 3;
  }
  std::vector<std::vector<RamstadSRC *>>::__clear[abi:ne180100](v2);
  v7 = (OpaqueAudioConverter *)*((void *)this + 17);
  if (v7) {
    AudioConverterDispose(v7);
  }
  v8 = (OpaqueAudioConverter *)*((void *)this + 18);
  if (v8) {
    AudioConverterDispose(v8);
  }
  long long v10 = (void **)v2;
  std::vector<std::vector<RamstadSRC *>>::__destroy_vector::operator()[abi:ne180100](&v10);
  long long v10 = (void **)((char *)this + 64);
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destroy_vector::operator()[abi:ne180100](&v10);
  v9 = (void *)*((void *)this + 5);
  if (v9)
  {
    *((void *)this + 6) = v9;
    operator delete(v9);
  }
}

void __clang_call_terminate(void *a1)
{
}

void *ASDSRCStreamHelper::allocateStreamingResources(ASDSRCStreamHelper *this, size_t a2, double a3, double a4)
{
  LODWORD(a4) = *((_DWORD *)this + 7);
  LODWORD(a2) = vcvtpd_u64_f64(*((double *)this + 20) * ((double)a2
                                                       * (double)*(unint64_t *)&a4
                                                       * 4.0));
  *((_DWORD *)this + 27) = a2;
  result = malloc_type_calloc(1uLL, a2, 0x9F61A332uLL);
  *((void *)this + 12) = result;
  if (!result) {
    ASDSRCStreamHelper::allocateStreamingResources();
  }
  size_t v6 = *((unsigned int *)this + 27);
  if (!v6) {
    ASDSRCStreamHelper::allocateStreamingResources();
  }
  if (*((void *)this + 17))
  {
    *((_DWORD *)this + 26) = v6;
    result = malloc_type_calloc(1uLL, v6, 0xCD1A887uLL);
    *((void *)this + 11) = result;
    if (!result) {
      ASDSRCStreamHelper::allocateStreamingResources();
    }
  }
  return result;
}

void ASDSRCStreamHelper::deallocateStreamingResources(ASDSRCStreamHelper *this)
{
  v2 = (void *)*((void *)this + 11);
  if (v2)
  {
    free(v2);
    *((void *)this + 11) = 0;
    *((_DWORD *)this + 26) = 0;
  }
  v3 = (void *)*((void *)this + 12);
  if (v3)
  {
    free(v3);
    *((void *)this + 12) = 0;
    *((_DWORD *)this + 27) = 0;
  }
}

uint64_t ASDSRCStreamHelper::underlyingStreamFormats(ASDSRCStreamHelper *this)
{
  return (uint64_t)this + 40;
}

uint64_t ASDSRCStreamHelper::readInput(ASDSRCStreamHelper *this, uint64_t a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "NULL == ioMainBuffer";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 197;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioMainBuffer passed to SRC readInput\n", buf, 2u);
    }
    uint64_t v7 = 1970171760;
    BOOL v48 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v48) {
      ASDSRCStreamHelper::readInput(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    return v7;
  }
  size_t v6 = a3;
  uint64_t v7 = 1970171760;
  if (!a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "NULL == ioCycleInfo";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 198;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioCycleInfo passed to SRC readInput\n", buf, 2u);
    }
    BOOL v56 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v56) {
      ASDSRCStreamHelper::readInput(v56, v57, v58, v59, v60, v61, v62, v63);
    }
    return v7;
  }
  uint64_t v8 = a6;
  long long v11 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
  long long v90 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
  long long v91 = v11;
  long long v12 = *(_OWORD *)&a3->mMainHostTicksPerFrame;
  long long v92 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
  long long v93 = v12;
  long long v13 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mSubframes;
  long long v86 = *(_OWORD *)&a3->mInputTime.mRateScalar;
  long long v87 = v13;
  long long v14 = *(_OWORD *)&a3->mOutputTime.mSampleTime;
  long long v88 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mHours;
  long long v89 = v14;
  long long v15 = *(_OWORD *)&a3->mCurrentTime.mSMPTETime.mSubframes;
  long long v82 = *(_OWORD *)&a3->mCurrentTime.mRateScalar;
  long long v83 = v15;
  long long v16 = *(_OWORD *)&a3->mInputTime.mSampleTime;
  long long v84 = *(_OWORD *)&a3->mCurrentTime.mSMPTETime.mHours;
  long long v85 = v16;
  BOOL v17 = *((double *)this + 22) == a3->mInputTime.mSampleTime;
  long long v18 = *(_OWORD *)&a3->mIOCycleCounter;
  long long v19 = *(_OWORD *)&a3->mCurrentTime.mSampleTime;
  *(_OWORD *)buf = *(_OWORD *)&a3->mIOCycleCounter;
  *(_OWORD *)&buf[16] = v19;
  if (!v17) {
    *((unsigned char *)this + 200) = 1;
  }
  uint64_t v20 = *((void *)this + 8);
  if (*((void *)this + 9) == v20)
  {
LABEL_46:
    *((void *)this + 23) = v85;
    *((double *)this + 22) = v6->mInputTime.mSampleTime + (double)a2;
    return v7;
  }
  unint64_t v21 = 0;
  int v22 = 0;
  v68 = (int *)((char *)this + 108);
  v67 = (int *)((char *)this + 104);
  int v69 = 4 * a2;
  unsigned int v73 = a6;
  while (1)
  {
    uint64_t v23 = *((void *)this + 5);
    if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 6) - v23) >> 3) <= v21) {
      std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
    }
    long long v24 = (uint64_t *)(v20 + 16 * v21);
    uint64_t v25 = *v24;
    if (!*v24)
    {
      uint64_t v7 = 1937010544;
      goto LABEL_46;
    }
    uint64_t v26 = v23 + 40 * v21;
    if (*((unsigned char *)this + 152)) {
      break;
    }
    int v71 = v22;
    uint64_t v29 = *(unsigned int *)(v26 + 28);
    LODWORD(v18) = v6->mNominalIOBufferFrameSize;
    double v30 = (double)(unint64_t)v18;
    double v31 = *(double *)v26;
    double v32 = *(double *)v26 * v30;
    double v33 = *(double *)this;
    *(float *)&double v32 = v32 / *(double *)this;
    *(_DWORD *)&buf[8] = vcvtas_u32_f32(*(float *)&v32);
    uint64_t v34 = *((void *)this + 14);
    if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 15) - v34) >> 3) <= v21) {
      std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
    }
    v35 = (RamstadSRC ***)(v34 + 24 * v21);
    if (*((unsigned char *)this + 200))
    {
      *(void *)&long long v85 = round(v31 * v6->mInputTime.mSampleTime / v33);
      *((unsigned char *)this + 200) = 0;
      int v36 = *v35;
      v37 = *(RamstadSRC ***)(v34 + 24 * v21 + 8);
      while (v36 != v37)
        RamstadSRC::reset(*v36++);
    }
    else
    {
      *(double *)&long long v85 = *((double *)this + 23) + (double)*((unint64_t *)this + 24);
    }
    int v38 = RamstadSRC::inputSamplesForOutputSamples(**v35, a2);
    unsigned int v39 = (*(uint64_t (**)(void))(*v24 + 16))();
    *((void *)this + 24) = v38;
    UInt32 v40 = *(_DWORD *)(v26 + 24) * v38;
    UInt32 ioOutputDataSize = 4 * v29 * v38;
    if (AudioConverterConvertBuffer(*((AudioConverterRef *)this + 17), v40, *((const void **)this + 11), &ioOutputDataSize, *((void **)this + 12)))
    {
LABEL_45:
      uint64_t v7 = 560226676;
      size_t v6 = a3;
      goto LABEL_46;
    }
    unsigned int v72 = v39;
    if (v29)
    {
      unint64_t v41 = 0;
      AudioStreamBasicDescription v42 = (void *)(v34 + 24 * v21 + 8);
      do
      {
        if (v41 >= (uint64_t)(*v42 - (void)*v35) >> 3) {
          std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
        }
        v43 = (*v35)[v41];
        if (*((_DWORD *)v43 + 8) != 1) {
          __assert_rtn("readInput", "ASDSRCStreamHelper.mm", 278, "src->numChannels() == 1 && \"Number of SRC channels is not 1\"");
        }
        uint64_t v44 = *((void *)this + 11);
        uint64_t v45 = *((void *)this + 12);
        int v46 = RamstadSRC::inputSamplesForOutputSamples(v43, a2);
        RamstadSRC::processMono(v43, (const float *)(v45 + 4 * v41), (float *)(v44 + 4 * v41), v46, a2, v29, v29);
        if (v47 != v46) {
          __assert_rtn("readInput", "ASDSRCStreamHelper.mm", 284, "inputFramesConsumed == numInputFrames");
        }
        ++v41;
      }
      while (v41 != v29);
    }
    UInt32 ioOutputDataSize = *((_DWORD *)this + 6) * a2;
    if ((v69 * v29) > *((_DWORD *)this + 26))
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v76 = 136315650;
        *(void *)v77 = "inputDataSize > mBufferSize[0]";
        *(_WORD *)&v77[8] = 2080;
        v78 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
        __int16 v79 = 1024;
        int v80 = 289;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", v76, 0x1Cu);
      }
      uint64_t v7 = v72;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v66 = *v67;
        *(_DWORD *)v76 = 67109376;
        *(_DWORD *)v77 = v69 * v29;
        *(_WORD *)&v77[4] = 1024;
        *(_DWORD *)&v77[6] = v66;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Input data size %d exceeds driver capacity %d in SRC  readInput\n", v76, 0xEu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        goto LABEL_53;
      }
      return v7;
    }
    uint64_t v7 = v72;
    if (AudioConverterConvertBuffer(*((AudioConverterRef *)this + 18), v69 * v29, *((const void **)this + 11), &ioOutputDataSize, a4))
    {
      goto LABEL_45;
    }
    size_t v6 = a3;
    uint64_t v8 = v73;
    int v27 = v71;
LABEL_30:
    unint64_t v21 = (v27 + 1);
    uint64_t v20 = *((void *)this + 8);
    int v22 = v27 + 1;
    if (v21 >= (*((void *)this + 9) - v20) >> 4) {
      goto LABEL_46;
    }
  }
  int v27 = v22;
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, const AudioServerPlugInIOCycleInfo *, void, void, uint64_t))(v25 + 16))(v25, a2, v6, *((void *)this + 12), 0, v8);
  UInt32 v28 = *(_DWORD *)(v26 + 24) * a2;
  UInt32 ioOutputDataSize = *((_DWORD *)this + 6) * a2;
  if (v28 <= *((_DWORD *)this + 27))
  {
    if (AudioConverterConvertBuffer(*((AudioConverterRef *)this + 18), v28, *((const void **)this + 12), &ioOutputDataSize, a4))
    {
      uint64_t v7 = 560226676;
    }
    else
    {
      uint64_t v7 = v7;
    }
    goto LABEL_30;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v76 = 136315650;
    *(void *)v77 = "inputDataSize > mBufferSize[1]";
    *(_WORD *)&v77[8] = 2080;
    v78 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
    __int16 v79 = 1024;
    int v80 = 227;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", v76, 0x1Cu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v65 = *v68;
    *(_DWORD *)v76 = 67109376;
    *(_DWORD *)v77 = v28;
    *(_WORD *)&v77[4] = 1024;
    *(_DWORD *)&v77[6] = v65;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Input data size %d exceeds driver capacity %d in SRC  readInput\n", v76, 0xEu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
LABEL_53:
  }
    ASDSRCStreamHelper::readInput();
  return v7;
}

void sub_225CD99DC(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  if (a2 == 3)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_4:
    }
      ASDSRCStreamHelper::readInput();
  }
  else
  {
    __cxa_begin_catch(a1);
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (a2 == 2)
    {
      if (!v3) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
    if (v3) {
      ASDSRCStreamHelper::readInput();
    }
  }
LABEL_10:
  __cxa_end_catch();
  JUMPOUT(0x225CD9734);
}

uint64_t ASDSRCStreamHelper::writeMix(ASDSRCStreamHelper *this, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *inInputData, void *a5)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  if (!inInputData)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "NULL == ioMainBuffer";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 331;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioMainBuffer passed to SRC writeMix\n", buf, 2u);
    }
    uint64_t v6 = 1970171760;
    BOOL v46 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v46) {
      ASDSRCStreamHelper::writeMix(v46, v47, v48, v49, v50, v51, v52, v53);
    }
    return v6;
  }
  v5 = a3;
  uint64_t v6 = 1970171760;
  if (!a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&buf[4] = "NULL == ioCycleInfo";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 332;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioCycleInfo passed to SRC writeMix\n", buf, 2u);
    }
    BOOL v54 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v54) {
      ASDSRCStreamHelper::writeMix(v54, v55, v56, v57, v58, v59, v60, v61);
    }
    return v6;
  }
  uint64_t v7 = inInputData;
  long long v9 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
  long long v92 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
  long long v93 = v9;
  long long v10 = *(_OWORD *)&a3->mMainHostTicksPerFrame;
  long long v94 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
  long long v95 = v10;
  long long v11 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mSubframes;
  long long v88 = *(_OWORD *)&a3->mInputTime.mRateScalar;
  long long v89 = v11;
  long long v12 = *(_OWORD *)&a3->mOutputTime.mSampleTime;
  long long v90 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mHours;
  long long v91 = v12;
  long long v13 = *(_OWORD *)&a3->mCurrentTime.mSMPTETime.mSubframes;
  long long v84 = *(_OWORD *)&a3->mCurrentTime.mRateScalar;
  long long v85 = v13;
  long long v14 = *(_OWORD *)&a3->mInputTime.mSampleTime;
  long long v86 = *(_OWORD *)&a3->mCurrentTime.mSMPTETime.mHours;
  long long v87 = v14;
  BOOL v15 = *((double *)this + 22) == a3->mOutputTime.mSampleTime;
  long long v16 = *(_OWORD *)&a3->mIOCycleCounter;
  long long v17 = *(_OWORD *)&a3->mCurrentTime.mSampleTime;
  *(_OWORD *)buf = *(_OWORD *)&a3->mIOCycleCounter;
  *(_OWORD *)&buf[16] = v17;
  if (!v15) {
    *((unsigned char *)this + 200) = 1;
  }
  uint64_t v18 = *((void *)this + 8);
  if (*((void *)this + 9) == v18) {
    goto LABEL_69;
  }
  unint64_t v19 = 0;
  unsigned int v20 = 0;
  v67 = (int *)((char *)this + 108);
  int v69 = (UInt32 *)((char *)this + 104);
  int v71 = 4 * a2;
  int v76 = a2;
  while (1)
  {
    uint64_t v21 = *((void *)this + 5);
    if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 6) - v21) >> 3) <= v19) {
      std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v22 = v18 + 16 * v19;
    uint64_t v24 = *(void *)(v22 + 8);
    uint64_t v23 = v22 + 8;
    if (!v24)
    {
      uint64_t v6 = 1937010544;
      goto LABEL_69;
    }
    uint64_t v25 = v21 + 40 * v19;
    if (*((unsigned char *)this + 152))
    {
      int v26 = *((_DWORD *)this + 6);
      UInt32 ioOutputDataSize = 0;
      UInt32 ioOutputDataSize = *(_DWORD *)(v25 + 24) * a2;
      if (ioOutputDataSize <= *((_DWORD *)this + 27))
      {
        if (AudioConverterConvertBuffer(*((AudioConverterRef *)this + 18), v26 * a2, v7, &ioOutputDataSize, *((void **)this + 12)))
        {
          goto LABEL_46;
        }
        uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v23 + 16))();
        goto LABEL_32;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v78 = 136315650;
        *(void *)__int16 v79 = "outputDataSize > mBufferSize[1]";
        *(_WORD *)&v79[8] = 2080;
        int v80 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
        __int16 v81 = 1024;
        int v82 = 359;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", v78, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v63 = *v67;
        *(_DWORD *)v78 = 67109376;
        *(_DWORD *)__int16 v79 = ioOutputDataSize;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v63;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Output data size %d exceeds driver capacity %d in SRC writeMix\n", v78, 0xEu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        ASDSRCStreamHelper::writeMix();
      }
LABEL_67:
      int v62 = 2;
      goto LABEL_68;
    }
    uint64_t v75 = v25;
    uint64_t v73 = v23;
    unsigned int v72 = v20;
    unsigned int v68 = v6;
    uint64_t v27 = *((void *)this + 14);
    if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 15) - v27) >> 3) <= v19) {
      std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
    }
    uint64_t v28 = *((unsigned int *)this + 7);
    uint64_t v29 = (RamstadSRC ***)(v27 + 24 * v19);
    LODWORD(v16) = v5->mNominalIOBufferFrameSize;
    double v30 = (double)(unint64_t)v16;
    double v31 = *(double *)v25;
    double v32 = *(double *)v25 * v30;
    double v33 = *(double *)this;
    *(float *)&double v32 = v32 / *(double *)this;
    *(_DWORD *)&buf[8] = vcvtas_u32_f32(*(float *)&v32);
    if (*((unsigned char *)this + 200))
    {
      *(void *)&long long v91 = round(v31 * v5->mOutputTime.mSampleTime / v33);
      *((unsigned char *)this + 200) = 0;
      uint64_t v34 = *v29;
      v35 = *(RamstadSRC ***)(v27 + 24 * v19 + 8);
      while (v34 != v35)
        RamstadSRC::reset(*v34++);
    }
    else
    {
      *(double *)&long long v91 = *((double *)this + 23) + (double)*((unint64_t *)this + 24);
    }
    UInt32 v36 = *((_DWORD *)this + 6) * v76;
    UInt32 ioOutputDataSize = v71 * v28;
    if (AudioConverterConvertBuffer(*((AudioConverterRef *)this + 17), v36, inInputData, &ioOutputDataSize, *((void **)this + 11)))
    {
LABEL_46:
      int v62 = 3;
      uint64_t v6 = 560226676;
      goto LABEL_68;
    }
    if (v28)
    {
      unint64_t v37 = 0;
      int v38 = (void *)(v27 + 24 * v19 + 8);
      do
      {
        if (v37 >= (uint64_t)(*v38 - (void)*v29) >> 3) {
          std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
        }
        unsigned int v39 = (*v29)[v37];
        if (*((_DWORD *)v39 + 8) != 1) {
          __assert_rtn("writeMix", "ASDSRCStreamHelper.mm", 409, "src->numChannels() == 1 && \"Number of SRC channels is not 1\"");
        }
        uint64_t v40 = *((void *)this + 11);
        uint64_t v41 = *((void *)this + 12);
        *(_DWORD *)v78 = 0;
        int v42 = RamstadSRC::outputSamplesForInputSamples(v39, v76, (int *)v78);
        RamstadSRC::processMono(v39, (const float *)(v40 + 4 * v37), (float *)(v41 + 4 * v37), v76, v42, v28, v28);
        *(_DWORD *)v78 = v43;
        if (v43 != v76) {
          __assert_rtn("writeMix", "ASDSRCStreamHelper.mm", 416, "inputFramesConsumed == ioBufferFrameSize");
        }
        ++v37;
      }
      while (v37 != v28);
    }
    else
    {
      int v42 = 0;
    }
    *((void *)this + 24) = v42;
    UInt32 v44 = 4 * v28 * v42;
    UInt32 v45 = *(_DWORD *)(v75 + 24) * v42;
    UInt32 ioOutputDataSize = v45;
    v5 = a3;
    if (v44 > *((_DWORD *)this + 27)) {
      break;
    }
    if (v45 > *v69)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v78 = 136315650;
        *(void *)__int16 v79 = "outputDataSize > mBufferSize[0]";
        *(_WORD *)&v79[8] = 2080;
        int v80 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
        __int16 v81 = 1024;
        int v82 = 424;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", v78, 0x1Cu);
      }
      uint64_t v6 = v68;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        UInt32 v65 = *v69;
        *(_DWORD *)v78 = 67109376;
        *(_DWORD *)__int16 v79 = ioOutputDataSize;
        *(_WORD *)&v79[4] = 1024;
        *(_DWORD *)&v79[6] = v65;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Input data size %d exceeds driver capacity %d in SRC writeMix\n", v78, 0xEu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
        ASDSRCStreamHelper::writeMix();
      }
      goto LABEL_67;
    }
    if (AudioConverterConvertBuffer(*((AudioConverterRef *)this + 18), v44, *((const void **)this + 12), &ioOutputDataSize, *((void **)this + 11)))
    {
      goto LABEL_46;
    }
    uint64_t v6 = (*(uint64_t (**)(void))(*(void *)v73 + 16))();
    uint64_t v7 = inInputData;
    unsigned int v20 = v72;
LABEL_32:
    uint64_t v18 = *((void *)this + 8);
    unint64_t v19 = ++v20;
    a2 = v76;
    if (v20 >= (unint64_t)((*((void *)this + 9) - v18) >> 4)) {
      goto LABEL_69;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v78 = 136315650;
    *(void *)__int16 v79 = "inputDataSize > mBufferSize[1]";
    *(_WORD *)&v79[8] = 2080;
    int v80 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDSRCStreamHelper.mm";
    __int16 v81 = 1024;
    int v82 = 423;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", v78, 0x1Cu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v64 = *v67;
    *(_DWORD *)v78 = 67109376;
    *(_DWORD *)__int16 v79 = v44;
    *(_WORD *)&v79[4] = 1024;
    *(_DWORD *)&v79[6] = v64;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Input data size %d exceeds driver capacity %d in SRC writeMix\n", v78, 0xEu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
    ASDSRCStreamHelper::writeMix();
  }
  int v62 = 2;
  uint64_t v6 = v68;
LABEL_68:
  a2 = v76;
  if (v62 == 3)
  {
LABEL_69:
    *((void *)this + 23) = v91;
    *((double *)this + 22) = v5->mOutputTime.mSampleTime + (double)a2;
  }
  return v6;
}

void sub_225CDA458(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  if (a2 == 3)
  {
    __cxa_begin_catch(a1);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_4:
    }
      ASDSRCStreamHelper::readInput();
  }
  else
  {
    __cxa_begin_catch(a1);
    BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (a2 == 2)
    {
      if (!v3) {
        goto LABEL_10;
      }
      goto LABEL_4;
    }
    if (v3) {
      ASDSRCStreamHelper::readInput();
    }
  }
LABEL_10:
  __cxa_end_catch();
  JUMPOUT(0x225CDA38CLL);
}

void CAException::~CAException(std::exception *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x22A63EB50);
}

const char *CAException::what(CAException *this)
{
  return "CAException";
}

void *std::vector<CAStreamBasicDescription>::__init_with_size[abi:ne180100]<CAStreamBasicDescription*,CAStreamBasicDescription*>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    result = std::vector<CAStreamBasicDescription>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_225CDA5D0(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<CAStreamBasicDescription>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_225CDA6E8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__init_with_size[abi:ne180100]<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>(void *result, void *a2, void *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>((uint64_t)(v6 + 2), a2, a3, (void *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_225CDA7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  long long v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      *uint64_t v4 = MEMORY[0x22A63F100](*v6);
      v4[1] = MEMORY[0x22A63F100](v6[1]);
      uint64_t v4 = v11 + 2;
      v11 += 2;
      v6 += 2;
    }
    while (v6 != a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::__allocator_destroy[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>(*(void *)a1, **(void **)(a1 + 16), **(void **)(a1 + 16), **(void **)(a1 + 8), **(void **)(a1 + 8));
  }
  return a1;
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 != a5)
  {
    uint64_t v6 = a3;
    do
    {

      uint64_t v7 = *(void **)(v6 - 16);
      v6 -= 16;
    }
    while (v6 != a5);
  }
}

void std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v2 = (uint64_t *)*a1;
  if (*v2)
  {
    std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    BOOL v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 16)
  {

    v5 = *(void **)(i - 16);
  }
  *(void *)(a1 + 8) = a2;
}

void std::vector<std::vector<RamstadSRC *>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<RamstadSRC *>>::__clear[abi:ne180100]((uint64_t *)v2);
    BOOL v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::vector<RamstadSRC *>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  if (v2 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(void *)(v2 - 16) = v5;
        operator delete(v5);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void *std::vector<std::vector<RamstadSRC *>>::__construct_one_at_end[abi:ne180100]<std::vector<RamstadSRC *> const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 8);
  void *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<RamstadSRC *>::__init_with_size[abi:ne180100]<RamstadSRC **,RamstadSRC **>(v3, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  *(void *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_225CDAB6C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<RamstadSRC *>>::__push_back_slow_path<std::vector<RamstadSRC *> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  long long v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<RamstadSRC *>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  long long v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  BOOL v15 = v11;
  long long v16 = &v10[24 * v9];
  *(void *)long long v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  std::vector<RamstadSRC *>::__init_with_size[abi:ne180100]<RamstadSRC **,RamstadSRC **>(v11, *(const void **)a2, *(void *)(a2 + 8), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 3);
  v15 += 24;
  std::vector<std::vector<RamstadSRC *>>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<std::vector<RamstadSRC *>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_225CDAC78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::vector<RamstadSRC *>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::vector<RamstadSRC *>::__init_with_size[abi:ne180100]<RamstadSRC **,RamstadSRC **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    result = std::vector<RamstadSRC *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_225CDACEC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<RamstadSRC *>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t std::vector<std::vector<RamstadSRC *>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<RamstadSRC *>>,std::reverse_iterator<std::vector<RamstadSRC *>*>,std::reverse_iterator<std::vector<RamstadSRC *>*>,std::reverse_iterator<std::vector<RamstadSRC *>*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<RamstadSRC *>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<RamstadSRC *>>,std::reverse_iterator<std::vector<RamstadSRC *>*>,std::reverse_iterator<std::vector<RamstadSRC *>*>,std::reverse_iterator<std::vector<RamstadSRC *>*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      long long v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(void *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<RamstadSRC *>>,std::reverse_iterator<std::vector<RamstadSRC *>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<RamstadSRC *>>,std::reverse_iterator<std::vector<RamstadSRC *>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<RamstadSRC *>>,std::reverse_iterator<std::vector<RamstadSRC *>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<RamstadSRC *>>,std::reverse_iterator<std::vector<RamstadSRC *>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)v1;
    if (*(void *)v1)
    {
      *(void *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<RamstadSRC *>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::vector<RamstadSRC *>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v5 = *(void **)(v2 - 24);
    *(void *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_225CDB024(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

char *CAStringForOSType(unsigned int a1, char *__str, int64_t __size)
{
  if (__size)
  {
    BOOL v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = &__str[__size];
    unsigned int v13 = bswap32(a1);
    uint64_t v8 = MEMORY[0x263EF8318];
    do
    {
      uint64_t v9 = *((unsigned __int8 *)&v13 + v6);
      if (*((char *)&v13 + v6) < 0)
      {
        if (!__maskrune(v9, 0x40000uLL)) {
          goto LABEL_11;
        }
      }
      else if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x40000) == 0)
      {
        goto LABEL_11;
      }
      if (*((unsigned char *)&v13 + v6) == 92)
      {
LABEL_11:
        uint64_t v10 = &__str[snprintf(__str, __size, "0x")];
        goto LABEL_12;
      }
      BOOL v5 = v6++ > 2;
    }
    while (v6 != 4);
    if (__size < 1)
    {
      uint64_t v10 = __str;
    }
    else
    {
      *__str = 39;
      uint64_t v10 = __str + 1;
    }
LABEL_12:
    if (v10 < v7)
    {
      uint64_t v11 = 0;
      do
      {
        if (v5) {
          *v10++ = *((unsigned char *)&v13 + v11);
        }
        else {
          v10 += snprintf(v10, v7 - v10, "%02X", *((unsigned __int8 *)&v13 + v11));
        }
        if (v11 > 2) {
          break;
        }
        ++v11;
      }
      while (v10 < v7);
      if (v5 && v10 < v7) {
        *v10++ = 39;
      }
    }
    v10[-(v10 >= v7)] = 0;
  }
  return __str;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this)
{
  *((void *)this + 4) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

{
  *((void *)this + 4) = 0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2)
{
  long long v2 = *(_OWORD *)&a2->mSampleRate;
  long long v3 = *(_OWORD *)&a2->mBytesPerPacket;
  *((void *)this + 4) = *(void *)&a2->mBitsPerChannel;
  *(_OWORD *)this = v2;
  *((_OWORD *)this + 1) = v3;
}

{
  long long v2;
  long long v3;

  long long v2 = *(_OWORD *)&a2->mSampleRate;
  long long v3 = *(_OWORD *)&a2->mBytesPerPacket;
  *((void *)this + 4) = *(void *)&a2->mBitsPerChannel;
  *(_OWORD *)this = v2;
  *((_OWORD *)this + 1) = v3;
}

void CAStreamBasicDescription::CAStreamBasicDescription(CAStreamBasicDescription *this, double a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9)
{
  *(double *)this = a2;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a5;
  *((_DWORD *)this + 6) = a6;
  *((_DWORD *)this + 7) = a7;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a9;
  *((_DWORD *)this + 8) = a8;
  *((_DWORD *)this + 9) = 0;
}

{
  *(double *)this = a2;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = a5;
  *((_DWORD *)this + 6) = a6;
  *((_DWORD *)this + 7) = a7;
  *((_DWORD *)this + 2) = a3;
  *((_DWORD *)this + 3) = a9;
  *((_DWORD *)this + 8) = a8;
  *((_DWORD *)this + 9) = 0;
}

char *CAStreamBasicDescription::AsString(CAStreamBasicDescription *this, char *a2, int a3, char a4)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  CAStringForOSType(*((_DWORD *)this + 2), v46, 24);
  if (a4)
  {
    *(_DWORD *)__str = 0;
    v44[0] = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat(this, __str, (BOOL *)v44)
      && *(_DWORD *)__str
      && *(_DWORD *)__str <= 5u)
    {
      if (v44[0]) {
        uint64_t v8 = ", inter";
      }
      else {
        uint64_t v8 = ", non-inter";
      }
      if (*((_DWORD *)this + 7) <= 1u) {
        uint64_t v8 = "";
      }
      size_t v9 = a3;
      unint64_t v37 = *(const char **)this;
      UInt32 v36 = (char *)*((unsigned int *)this + 7);
      int v38 = off_264772D48[*(_DWORD *)__str - 1];
      unsigned int v39 = v8;
      uint64_t v10 = "%2d ch, %6.0f Hz, %s%s";
      goto LABEL_29;
    }
    int v23 = *((_DWORD *)this + 2);
    if (v23 == 1718773105)
    {
      size_t v9 = a3;
      unint64_t v37 = *(const char **)this;
      UInt32 v36 = (char *)*((unsigned int *)this + 7);
      uint64_t v10 = "%2d ch, %6.0f Hz, 'freq'";
LABEL_29:
      uint64_t v24 = a2;
LABEL_90:
      snprintf(v24, v9, v10, v36, v37, v38, v39, v40, v41, v42, v43);
      return a2;
    }
    int v11 = *((_DWORD *)this + 7);
    if (!v11 && !v23 && *(double *)this == 0.0)
    {
      size_t v9 = a3;
      unint64_t v37 = *(const char **)this;
      UInt32 v36 = 0;
      uint64_t v10 = "%2d ch, %6.0f Hz";
      goto LABEL_29;
    }
  }
  else
  {
    int v11 = *((_DWORD *)this + 7);
  }
  int v12 = snprintf(a2, a3, "%2d ch, %6.0f Hz, %s (0x%08X) ", v11, *(double *)this, v46, *((_DWORD *)this + 3));
  size_t v13 = (a3 - v12);
  if ((int)v13 >= 1)
  {
    long long v14 = &a2[v12];
    int v15 = *((_DWORD *)this + 2);
    if (v15 != 1634492771 && v15 != 1718378851)
    {
      if (v15 != 1819304813)
      {
        int v38 = (char *)*((unsigned int *)this + 5);
        unsigned int v39 = (const char *)*((unsigned int *)this + 6);
        UInt32 v36 = (char *)*((unsigned int *)this + 8);
        unint64_t v37 = (const char *)*((unsigned int *)this + 4);
        uint64_t v10 = "%d bits/channel, %d bytes/packet, %d frames/packet, %d bytes/frame";
LABEL_89:
        uint64_t v24 = v14;
        size_t v9 = v13;
        goto LABEL_90;
      }
      unsigned int v16 = *((_DWORD *)this + 3);
      unsigned int v17 = *((_DWORD *)this + 6);
      uint64_t v18 = "";
      if (!v17) {
        goto LABEL_19;
      }
      if ((v16 & 0x20) != 0)
      {
        unsigned int v19 = 1;
      }
      else
      {
        unsigned int v19 = *((_DWORD *)this + 7);
        if (!v19)
        {
LABEL_19:
          unsigned int v20 = " signed";
          if ((v16 & 4) == 0) {
            unsigned int v20 = " unsigned";
          }
          if (v16) {
            uint64_t v21 = "float";
          }
          else {
            uint64_t v21 = "integer";
          }
          if (v16) {
            uint64_t v22 = "";
          }
          else {
            uint64_t v22 = v20;
          }
LABEL_66:
          __str[0] = 0;
          if ((v16 & 0x20) != 0) {
            double v32 = ", deinterleaved";
          }
          else {
            double v32 = "";
          }
          uint64_t v28 = "";
          double v33 = "";
          goto LABEL_70;
        }
      }
      int v27 = v17 / v19;
      if ((int)(v17 / v19) < 2)
      {
        double v30 = " signed";
        if ((v16 & 4) == 0) {
          double v30 = " unsigned";
        }
        if (v16) {
          uint64_t v21 = "float";
        }
        else {
          uint64_t v21 = "integer";
        }
        if (v16) {
          uint64_t v22 = "";
        }
        else {
          uint64_t v22 = v30;
        }
        if (v27 != 1) {
          goto LABEL_66;
        }
        uint64_t v28 = "";
      }
      else
      {
        if ((v16 & 2) != 0) {
          uint64_t v28 = " big-endian";
        }
        else {
          uint64_t v28 = " little-endian";
        }
        uint64_t v29 = " unsigned";
        if ((v16 & 4) != 0) {
          uint64_t v29 = " signed";
        }
        if (v16) {
          uint64_t v21 = "float";
        }
        else {
          uint64_t v21 = "integer";
        }
        if (v16) {
          uint64_t v22 = "";
        }
        else {
          uint64_t v22 = v29;
        }
      }
      CAStreamBasicDescription::PackednessIsSignificant(this);
      if (v31)
      {
        if ((*((unsigned char *)this + 12) & 8) != 0) {
          snprintf(__str, 0x20uLL, "packed in %d bytes");
        }
        else {
          snprintf(__str, 0x20uLL, "unpacked in %d bytes");
        }
      }
      else
      {
        __str[0] = 0;
      }
      CAStreamBasicDescription::PackednessIsSignificant(this);
      if ((v34 & 1) != 0 || (*((unsigned char *)this + 32) & 7) != 0)
      {
        unsigned int v16 = *((_DWORD *)this + 3);
        if ((v16 & 0x10) != 0) {
          double v33 = " high-aligned";
        }
        else {
          double v33 = " low-aligned";
        }
      }
      else
      {
        unsigned int v16 = *((_DWORD *)this + 3);
        double v33 = "";
      }
      if ((v16 & 0x20) != 0) {
        double v32 = ", deinterleaved";
      }
      else {
        double v32 = "";
      }
      if (__str[0])
      {
        uint64_t v18 = ", ";
LABEL_85:
        if (((v16 >> 7) & 0x3F) != 0) {
          snprintf(v44, 0x14uLL, "%d.%d");
        }
        else {
          snprintf(v44, 0x14uLL, "%d");
        }
        int v42 = v33;
        int v43 = v32;
        uint64_t v40 = v18;
        uint64_t v41 = __str;
        int v38 = (char *)v22;
        unsigned int v39 = v21;
        uint64_t v10 = "%s-bit%s%s %s%s%s%s%s";
        UInt32 v36 = v44;
        unint64_t v37 = v28;
        goto LABEL_89;
      }
LABEL_70:
      if (*v33) {
        uint64_t v18 = ", ";
      }
      goto LABEL_85;
    }
    if ((*((_DWORD *)this + 3) - 1) > 3) {
      int v25 = snprintf(&a2[v12], v13, "from UNKNOWN source bit depth, ");
    }
    else {
      int v25 = snprintf(&a2[v12], v13, "from %d-bit source, ");
    }
    size_t v26 = (v13 - v25);
    if ((int)v26 >= 1) {
      snprintf(&v14[v25], v26, "%d frames/packet");
    }
  }
  return a2;
}

uint64_t CAStreamBasicDescription::IdentifyCommonPCMFormat(_DWORD *a1, _DWORD *a2, BOOL *a3)
{
  uint64_t result = 0;
  *a2 = 0;
  if (a1[2] != 1819304813) {
    return result;
  }
  if (a1[5] != 1) {
    return 0;
  }
  unsigned int v5 = a1[6];
  if (v5 != a1[4]) {
    return 0;
  }
  unsigned int v6 = a1[8];
  if (v5 < v6 >> 3) {
    return 0;
  }
  unsigned int v7 = a1[7];
  if (!v7) {
    return 0;
  }
  unsigned int v8 = a1[3];
  if (a3) {
    *a3 = (v8 & 0x20) == 0;
  }
  if ((v8 & 0x20) == 0)
  {
    if (v5 % v7) {
      return 0;
    }
    v5 /= v7;
  }
  uint64_t result = 1;
  if ((v8 & 2) != 0 || 8 * v5 != v6) {
    return result;
  }
  if (v8)
  {
    if ((v8 & 0x1F84) == 0)
    {
      if (v5 != 4)
      {
        if (v5 != 8) {
          return result;
        }
        LODWORD(result) = 4;
      }
      goto LABEL_29;
    }
    return 0;
  }
  if ((v8 & 4) == 0) {
    return result;
  }
  int v9 = (v8 >> 7) & 0x3F;
  if (v9 == 24 && v5 == 4)
  {
    LODWORD(result) = 3;
LABEL_29:
    *a2 = result;
    return 1;
  }
  if (!v9 && v5 == 4)
  {
    LODWORD(result) = 5;
    goto LABEL_29;
  }
  if (!v9 && v5 == 2)
  {
    LODWORD(result) = 2;
    goto LABEL_29;
  }
  return result;
}

void CAStreamBasicDescription::PackednessIsSignificant(CAStreamBasicDescription *this)
{
  if (*((_DWORD *)this + 2) != 1819304813)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      CAStreamBasicDescription::PackednessIsSignificant();
    }
    __break(1u);
  }
}

_DWORD *CAStreamBasicDescription::NormalizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    int v2 = 2 * this[7];
    this[3] = 12;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 16;
  }
  return this;
}

uint64_t CAStreamBasicDescription::NormalizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if (this) {
      int v3 = 9;
    }
    else {
      int v3 = 11;
    }
    int v4 = 2 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 16;
  }
  return this;
}

_DWORD *CAStreamBasicDescription::VirtualizeLinearPCMFormat(_DWORD *this, AudioStreamBasicDescription *a2)
{
  if (this[2] == 1819304813 && (this[3] & 0x40) == 0)
  {
    int v2 = 4 * this[7];
    this[3] = 9;
    this[4] = v2;
    this[5] = 1;
    this[6] = v2;
    this[8] = 32;
  }
  return this;
}

uint64_t CAStreamBasicDescription::VirtualizeLinearPCMFormat(uint64_t this, _DWORD *a2, AudioStreamBasicDescription *a3)
{
  if (a2[2] == 1819304813 && (a2[3] & 0x40) == 0)
  {
    if (this) {
      int v3 = 9;
    }
    else {
      int v3 = 11;
    }
    int v4 = 4 * a2[7];
    a2[3] = v3;
    a2[4] = v4;
    a2[5] = 1;
    a2[6] = v4;
    a2[8] = 32;
  }
  return this;
}

double CAStreamBasicDescription::ResetFormat(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  *((_DWORD *)this + 8) = 0;
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  return result;
}

uint64_t CAStreamBasicDescription::FillOutFormat(uint64_t this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  if (*(double *)this == 0.0) {
    *(Float64 *)this = a2->mSampleRate;
  }
  if (!*(_DWORD *)(this + 8)) {
    *(_DWORD *)(this + 8) = a2->mFormatID;
  }
  if (!*(_DWORD *)(this + 12)) {
    *(_DWORD *)(this + 12) = a2->mFormatFlags;
  }
  if (!*(_DWORD *)(this + 16)) {
    *(_DWORD *)(this + 16) = a2->mBytesPerPacket;
  }
  if (!*(_DWORD *)(this + 20)) {
    *(_DWORD *)(this + 20) = a2->mFramesPerPacket;
  }
  if (!*(_DWORD *)(this + 24)) {
    *(_DWORD *)(this + 24) = a2->mBytesPerFrame;
  }
  if (!*(_DWORD *)(this + 28)) {
    *(_DWORD *)(this + 28) = a2->mChannelsPerFrame;
  }
  if (!*(_DWORD *)(this + 32)) {
    *(_DWORD *)(this + 32) = a2->mBitsPerChannel;
  }
  return this;
}

uint64_t CAStreamBasicDescription::GetSimpleName(uint64_t this, AudioStreamBasicDescription *__str, size_t __size, int a4, int a5)
{
  unsigned int v6 = __size;
  unsigned int v7 = __str;
  unsigned int v8 = (double *)this;
  if (a5)
  {
    this = snprintf((char *)__str, __size, "%.0f ", *(double *)this);
    unsigned int v7 = (AudioStreamBasicDescription *)((char *)v7 + (int)this);
    v6 -= this;
  }
  int v9 = *((_DWORD *)v8 + 2);
  if (v9 == 1633889587)
  {
    strcpy((char *)v7, "AC-3");
    return this;
  }
  if (v9 == 1667326771)
  {
    strcpy((char *)v7, "AC-3 fo");
    return this;
  }
  if (v9 != 1819304813)
  {
    LOBYTE(v7->mSampleRate) = HIBYTE(v9);
    BYTE1(v7->mSampleRate) = *((unsigned char *)v8 + 10);
    BYTE2(v7->mSampleRate) = *((unsigned char *)v8 + 9);
    *(_WORD *)((char *)&v7->mSampleRate + 3) = *((unsigned __int8 *)v8 + 8);
    return this;
  }
  int v10 = *((_DWORD *)v8 + 3);
  if (v10)
  {
    int v11 = "Floating Point";
    int v12 = "Float";
  }
  else if ((v10 & 4) != 0)
  {
    int v11 = "Signed Integer";
    int v12 = "SInt";
  }
  else
  {
    int v11 = "Unsigned Integer";
    int v12 = "UInt";
  }
  if (a4) {
    size_t v13 = v12;
  }
  else {
    size_t v13 = v11;
  }
  if ((v10 & 0x10) != 0) {
    long long v14 = "High";
  }
  else {
    long long v14 = "Low";
  }
  if ((v10 & 0x40) != 0) {
    int v15 = "Unmixable";
  }
  else {
    int v15 = "Mixable";
  }
  uint64_t v16 = *((unsigned int *)v8 + 7);
  if (a4)
  {
    if ((v10 & 2) != 0)
    {
      if ((v10 & 8) != 0) {
        return snprintf((char *)v7, v6, "%s %d Ch %s %s%d");
      }
      else {
        return snprintf((char *)v7, v6, "%s %d Ch %s %s %s%d/%s%d", v15, v16, "Big Endian");
      }
    }
    else
    {
      if ((v10 & 8) == 0)
      {
        uint64_t v17 = 8 * (*((_DWORD *)v8 + 6) / v16);
        int v23 = (const char *)*((unsigned int *)v8 + 8);
        uint64_t v24 = v13;
        uint64_t v21 = v14;
        uint64_t v22 = v13;
        unsigned int v19 = v15;
        uint64_t v20 = *((unsigned int *)v8 + 7);
        uint64_t v18 = "%s %d Ch %s %s%d/%s%d";
        return snprintf((char *)v7, v6, v18, v19, v20, v21, v22, v23, v24, v17);
      }
      return snprintf((char *)v7, v6, "%s %d Ch %s%d");
    }
  }
  else if ((v10 & 2) != 0)
  {
    if ((v10 & 8) == 0)
    {
      uint64_t v17 = 8 * (*((_DWORD *)v8 + 6) / v16);
      int v23 = v13;
      uint64_t v24 = v14;
      uint64_t v21 = (const char *)*((unsigned int *)v8 + 8);
      uint64_t v22 = "Big Endian";
      unsigned int v19 = v15;
      uint64_t v20 = *((unsigned int *)v8 + 7);
      uint64_t v18 = "%s %d Channel %d Bit %s %s Aligned %s in %d Bits";
      return snprintf((char *)v7, v6, v18, v19, v20, v21, v22, v23, v24, v17);
    }
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s %s");
  }
  else if ((v10 & 8) != 0)
  {
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s");
  }
  else
  {
    return snprintf((char *)v7, v6, "%s %d Channel %d Bit %s Aligned %s in %d Bits", v15);
  }
}

uint64_t CAStreamBasicDescription::GetRegularizedFormatFlags(CAStreamBasicDescription *this, int a2)
{
  uint64_t result = *((unsigned int *)this + 3);
  if (*((_DWORD *)this + 2) == 1819304813)
  {
    unsigned int v4 = result & 0x7FFFFFFF;
    if ((result & 0x7FFFFFFF) == 0) {
      unsigned int v4 = result;
    }
    if (a2) {
      unsigned int v5 = v4;
    }
    else {
      unsigned int v5 = v4 & 0xFFFFFFBF;
    }
    CAStreamBasicDescription::PackednessIsSignificant(this);
    if (!v6) {
      v5 |= 8u;
    }
    CAStreamBasicDescription::PackednessIsSignificant(this);
    unsigned int v7 = *((_DWORD *)this + 8);
    if ((v8 & 1) == 0 && (v7 & 7) == 0) {
      v5 &= ~0x10u;
    }
    unsigned int v9 = v5 & 0xFFFFFFFB;
    if ((v5 & 1) == 0) {
      unsigned int v9 = v5;
    }
    BOOL v10 = (v9 & 8) == 0 || v7 > 8;
    unsigned int v11 = v9 & 2;
    if (v10) {
      unsigned int v11 = v9;
    }
    if (*((_DWORD *)this + 7) == 1) {
      v11 &= ~0x20u;
    }
    if (v11) {
      return v11;
    }
    else {
      return 0x80000000;
    }
  }
  return result;
}

BOOL CAStreamBasicDescription::EquivalentFormatFlags(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3, int a4)
{
  int v4 = (int)a3;
  if (a4)
  {
    int32x4_t v6 = *(int32x4_t *)&a2->mFormatID;
    v6.i64[1] = *((void *)this + 1);
    if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v6)))) {
      return 1;
    }
  }
  if (*((_DWORD *)this + 2) == 1819304813)
  {
    int RegularizedFormatFlags = CAStreamBasicDescription::GetRegularizedFormatFlags(this, (int)a3);
    return RegularizedFormatFlags == CAStreamBasicDescription::GetRegularizedFormatFlags((CAStreamBasicDescription *)a2, v4);
  }
  else
  {
    return *((_DWORD *)this + 3) == a2->mFormatFlags;
  }
}

BOOL CAStreamBasicDescription::IsExactlyEqual(CAStreamBasicDescription *this, const AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  return memcmp(this, a2, 0x24uLL) == 0;
}

BOOL CAStreamBasicDescription::IsEquivalent(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, const AudioStreamBasicDescription *a3)
{
  double v3 = *(double *)this;
  if (a3)
  {
    if (v3 != 0.0 && a2->mSampleRate != 0.0 && v3 != a2->mSampleRate) {
      return 0;
    }
    int v5 = *((_DWORD *)this + 2);
    if (v5)
    {
      AudioFormatID mFormatID = a2->mFormatID;
      if (mFormatID)
      {
        if (v5 != mFormatID) {
          return 0;
        }
      }
    }
    int v7 = *((_DWORD *)this + 4);
    if (v7)
    {
      UInt32 mBytesPerPacket = a2->mBytesPerPacket;
      if (mBytesPerPacket)
      {
        if (v7 != mBytesPerPacket) {
          return 0;
        }
      }
    }
    int v9 = *((_DWORD *)this + 5);
    if (v9)
    {
      UInt32 mFramesPerPacket = a2->mFramesPerPacket;
      if (mFramesPerPacket)
      {
        if (v9 != mFramesPerPacket) {
          return 0;
        }
      }
    }
    int v11 = *((_DWORD *)this + 6);
    if (v11)
    {
      UInt32 mBytesPerFrame = a2->mBytesPerFrame;
      if (mBytesPerFrame)
      {
        if (v11 != mBytesPerFrame) {
          return 0;
        }
      }
    }
    int v13 = *((_DWORD *)this + 7);
    if (v13)
    {
      UInt32 mChannelsPerFrame = a2->mChannelsPerFrame;
      if (mChannelsPerFrame)
      {
        if (v13 != mChannelsPerFrame) {
          return 0;
        }
      }
    }
    int v15 = *((_DWORD *)this + 8);
    if (!v15) {
      return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
    }
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
    if (!mBitsPerChannel) {
      return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
    }
  }
  else
  {
    if (v3 != a2->mSampleRate
      || *((_DWORD *)this + 2) != a2->mFormatID
      || *((_DWORD *)this + 4) != a2->mBytesPerPacket
      || *((_DWORD *)this + 5) != a2->mFramesPerPacket
      || *((_DWORD *)this + 7) != a2->mChannelsPerFrame)
    {
      return 0;
    }
    int v15 = *((_DWORD *)this + 8);
    UInt32 mBitsPerChannel = a2->mBitsPerChannel;
  }
  if (v15 != mBitsPerChannel) {
    return 0;
  }
  return CAStreamBasicDescription::EquivalentFormatFlags(this, a2, (const AudioStreamBasicDescription *)((a3 >> 1) & 1), a3 & 1);
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2, int a3)
{
  if (!a3) {
    return memcmp(this, a2, 0x24uLL) == 0;
  }
  return CAStreamBasicDescription::IsEquivalent(this, a2, (const AudioStreamBasicDescription *)3);
}

BOOL CAStreamBasicDescription::IsEqual(CAStreamBasicDescription *this, AudioStreamBasicDescription *a2)
{
  return CAStreamBasicDescription::IsEquivalent(this, a2, (const AudioStreamBasicDescription *)3);
}

BOOL SanityCheck(const AudioStreamBasicDescription *a1)
{
  BOOL result = 0;
  if (a1->mSampleRate >= 0.0 && a1->mSampleRate < 3000000.0)
  {
    UInt32 mBytesPerPacket = a1->mBytesPerPacket;
    if (mBytesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mFramesPerPacket = a1->mFramesPerPacket;
    if (mFramesPerPacket >= 0xF4240) {
      return 0;
    }
    UInt32 mBytesPerFrame = a1->mBytesPerFrame;
    if (mBytesPerFrame >= 0xF4240) {
      return 0;
    }
    BOOL result = 0;
    if (a1->mChannelsPerFrame - 1 > 0x3FF || a1->mBitsPerChannel > 0x400) {
      return result;
    }
    AudioFormatID mFormatID = a1->mFormatID;
    if (!mFormatID) {
      return 0;
    }
    BOOL v8 = mFramesPerPacket == 1 && mBytesPerPacket == mBytesPerFrame;
    return mFormatID != 1819304813 || v8;
  }
  return result;
}

uint64_t CAStreamBasicDescription::FromText(CAStreamBasicDescription *this, char *a2, AudioStreamBasicDescription *a3)
{
  if (*(unsigned char *)this == 45) {
    int v5 = (CAStreamBasicDescription *)((char *)this + 1);
  }
  else {
    int v5 = this;
  }
  int v6 = *(unsigned __int8 *)v5;
  if (v6 == 76)
  {
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    int i = 12;
  }
  else
  {
    if (v6 != 66)
    {
      int i = 12;
      goto LABEL_12;
    }
    uint64_t v7 = 2 * (*((unsigned char *)v5 + 1) == 69);
    if (*((unsigned char *)v5 + 1) == 69) {
      int i = 14;
    }
    else {
      int i = 12;
    }
  }
  int v5 = (CAStreamBasicDescription *)((char *)v5 + v7);
  int v6 = *(unsigned __int8 *)v5;
LABEL_12:
  int v9 = (FILE **)MEMORY[0x263EF8348];
  switch(v6)
  {
    case 'U':
      i &= 0xAu;
      int v10 = *((unsigned __int8 *)v5 + 1);
      int v5 = (CAStreamBasicDescription *)((char *)v5 + 1);
      int v6 = v10;
      break;
    case 'F':
      int i = i & 0xFFFFFFFA | 1;
      goto LABEL_17;
    case 'I':
LABEL_17:
      int v11 = (CAStreamBasicDescription *)((char *)v5 + 1);
      if (*((char *)v5 + 1) < 0)
      {
        int v13 = 0;
      }
      else
      {
        int v12 = *((unsigned __int8 *)v5 + 1);
        if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)v5 + 1) + 60) & 0x400) != 0)
        {
          int v13 = 0;
          int v11 = (CAStreamBasicDescription *)((char *)v5 + 2);
          while (1)
          {
            int v13 = v12 + 10 * v13 - 48;
            if (*(char *)v11 < 0) {
              break;
            }
            uint64_t v18 = *(unsigned __int8 *)v11;
            int v12 = *(unsigned __int8 *)v11;
            int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
            if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v18 + 60) & 0x400) == 0)
            {
              int v5 = (CAStreamBasicDescription *)((char *)v11 - 2);
              int v11 = (CAStreamBasicDescription *)((char *)v11 - 1);
              goto LABEL_33;
            }
          }
        }
        else
        {
          int v13 = 0;
LABEL_33:
          if (v12 == 46)
          {
            int v21 = *((char *)v5 + 2);
            unsigned int v19 = (CAStreamBasicDescription *)((char *)v5 + 2);
            unsigned __int8 v20 = v21;
            if (v21 < 0 || (uint64_t v22 = v20, (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v20 + 60) & 0x400) == 0))
            {
              int v23 = (FILE *)*MEMORY[0x263EF8348];
              uint64_t v24 = "Expected fractional bits following '.'\n";
              size_t v25 = 39;
LABEL_37:
              fwrite(v24, v25, 1uLL, v23);
              goto LABEL_101;
            }
            int v29 = 0;
            int v11 = v19;
            do
            {
              if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v22 + 60) & 0x400) == 0) {
                break;
              }
              int v30 = *((char *)v11 + 1);
              int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
              int v29 = 10 * v29 + v22 - 48;
              uint64_t v22 = v30;
            }
            while ((v30 & 0x80000000) == 0);
            v13 += v29;
            i |= v29 << 7;
          }
        }
      }
      unsigned int v28 = 1819304813;
      unsigned int v26 = (v13 + 7) >> 3;
      if ((v13 & 7) != 0) {
        int i = i & 0xFFFFFFE7 | 0x10;
      }
      int v27 = 1;
      goto LABEL_50;
  }
  uint64_t v14 = 0;
  int __c = 538976288;
  int v15 = this;
  int v11 = this;
  while (1)
  {
    int v17 = *(unsigned __int8 *)v11;
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    int v16 = v17;
    if (v17 == 92)
    {
      if (*(unsigned char *)v11 != 120) {
        return 0;
      }
      int v51 = 0;
      if (sscanf((const char *)v15 + 2, "%02X", &v51) != 1) {
        return 0;
      }
      *((unsigned char *)&__c + v14) = v51;
      int v11 = (CAStreamBasicDescription *)((char *)v15 + 4);
      goto LABEL_26;
    }
    *((unsigned char *)&__c + v14) = v16;
    if (!v16) {
      break;
    }
LABEL_26:
    ++v14;
    int v15 = v11;
    if (v14 == 4) {
      goto LABEL_40;
    }
  }
  if (v14 != 3) {
    return 0;
  }
  HIBYTE(__c) = 32;
  int v11 = v15;
LABEL_40:
  if (memchr("-@/#", SHIBYTE(__c), 5uLL))
  {
    HIBYTE(__c) = 32;
    int v11 = (CAStreamBasicDescription *)((char *)v11 - 1);
  }
  int i = 0;
  unsigned int v26 = 0;
  int v27 = 0;
  int v13 = 0;
  unsigned int v28 = bswap32(__c);
LABEL_50:
  int v31 = *(unsigned __int8 *)v11;
  if (v31 != 64)
  {
    double v33 = 0.0;
    goto LABEL_57;
  }
  int v32 = *((char *)v11 + 1);
  int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
  LOBYTE(v31) = v32;
  if (v32 < 0) {
    goto LABEL_100;
  }
  double v33 = 0.0;
  while ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v31 + 60) & 0x400) != 0)
  {
    double v33 = (double)(v31 - 48) + v33 * 10.0;
    int v34 = *((char *)v11 + 1);
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    LOBYTE(v31) = v34;
    if (v34 < 0) {
      goto LABEL_100;
    }
  }
LABEL_57:
  if (v31 == 47)
  {
    for (int i = 0; ; int i = (v36 + v35) | (16 * i))
    {
      int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
      int v35 = *(char *)v11;
      if ((v35 - 48) >= 0xA)
      {
        int v31 = *(unsigned __int8 *)v11;
        if ((v31 - 65) >= 6)
        {
          if ((v31 - 97) > 5) {
            break;
          }
          int v36 = -87;
        }
        else
        {
          int v36 = -55;
        }
      }
      else
      {
        int v36 = -48;
      }
    }
  }
  if (v31 != 35)
  {
    unsigned __int8 v37 = v31;
    int v39 = v27;
    goto LABEL_73;
  }
  int v38 = *((char *)v11 + 1);
  int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
  unsigned __int8 v37 = v38;
  if (v38 < 0) {
    goto LABEL_100;
  }
  int v39 = v27;
  while ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v37 + 60) & 0x400) != 0)
  {
    int v39 = 10 * v39 + v37 - 48;
    int v40 = *((char *)v11 + 1);
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
    unsigned __int8 v37 = v40;
    if (v40 < 0) {
      goto LABEL_100;
    }
  }
LABEL_73:
  if (v37 != 58)
  {
LABEL_82:
    if (v37 != 44) {
      goto LABEL_99;
    }
    UInt32 v44 = (char *)v11 + 1;
    int v45 = *((unsigned __int8 *)v11 + 1);
    if ((*((char *)v11 + 1) & 0x80000000) == 0
      && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * *((unsigned __int8 *)v11 + 1) + 60) & 0x400) != 0)
    {
      int v27 = 0;
      BOOL v46 = (char *)v11 + 2;
      do
      {
        UInt32 v44 = v46;
        int v27 = v45 + 10 * v27 - 48;
        int v47 = *v46;
        int v45 = v47;
        if (v47 < 0) {
          break;
        }
        int v48 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v47 + 60);
        BOOL v46 = v44 + 1;
      }
      while ((v48 & 0x400) != 0);
      int v11 = (CAStreamBasicDescription *)(v44 - 1);
    }
    else
    {
      int v27 = 0;
    }
    if (v45 == 73)
    {
      UInt32 v44 = (char *)v11 + 2;
    }
    else if (v45 == 68)
    {
      if (v28 != 1819304813)
      {
        int v23 = *v9;
        uint64_t v24 = "non-interleaved flag invalid for non-PCM formats\n";
        size_t v25 = 49;
        goto LABEL_37;
      }
      int v11 = (CAStreamBasicDescription *)((char *)v11 + 2);
      i |= 0x20u;
LABEL_99:
      if (*(unsigned char *)v11) {
        goto LABEL_100;
      }
      *(double *)a2 = v33;
      *((_DWORD *)a2 + 2) = v28;
      *((_DWORD *)a2 + 3) = i;
      *((_DWORD *)a2 + 4) = v26;
      *((_DWORD *)a2 + 5) = v39;
      *((_DWORD *)a2 + 6) = v26;
      *((_DWORD *)a2 + 7) = v27;
      uint64_t result = 1;
      *((_DWORD *)a2 + 8) = v13;
      *((_DWORD *)a2 + 9) = 0;
      return result;
    }
    if (v28 == 1819304813) {
      int v49 = v27;
    }
    else {
      int v49 = 1;
    }
    v26 *= v49;
    int v11 = (CAStreamBasicDescription *)v44;
    goto LABEL_99;
  }
  i &= 0xFFFFFFE7;
  int v41 = *((unsigned __int8 *)v11 + 1);
  if (v41 == 76) {
    goto LABEL_77;
  }
  if (v41 == 72)
  {
    i |= 0x10u;
LABEL_77:
    int v42 = *((char *)v11 + 2);
    int v11 = (CAStreamBasicDescription *)((char *)v11 + 2);
    unsigned __int8 v37 = v42;
    if ((v42 & 0x80000000) == 0)
    {
      unsigned int v26 = 0;
      while ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v37 + 60) & 0x400) != 0)
      {
        int v43 = *((char *)v11 + 1);
        int v11 = (CAStreamBasicDescription *)((char *)v11 + 1);
        unsigned int v26 = 10 * v26 + v37 - 48;
        unsigned __int8 v37 = v43;
        if (v43 < 0) {
          goto LABEL_100;
        }
      }
      goto LABEL_82;
    }
LABEL_100:
    fprintf(*v9, "extra characters at end of format string: %s\n", (const char *)v11);
  }
LABEL_101:
  fprintf(*v9, "Invalid format string: %s\n", (const char *)this);
  fwrite("Syntax of format strings is: \n", 0x1EuLL, 1uLL, *v9);
  return 0;
}

void *CASmartPreferences::instance(CASmartPreferences *this)
{
  {
    CASmartPreferences::CASmartPreferences((CASmartPreferences *)&CASmartPreferences::instance(void)::global);
  }
  return &CASmartPreferences::instance(void)::global;
}

void sub_225CDCCA0(_Unwind_Exception *a1)
{
}

double CACFPreferencesGetAppFloatValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (BOOL *)&v10;
  }
  double v8 = CASmartPreferences::InterpretFloat(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

double CASmartPreferences::InterpretFloat(const __CFString *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double valuePtr = 0.0;
  *a2 = 0;
  if (this)
  {
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      double valuePtr = (double)CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberDoubleType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%lf", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

uint64_t CACFPreferencesGetAppIntegerValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (BOOL *)&v10;
  }
  uint64_t v8 = CASmartPreferences::InterpretInteger(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

uint64_t CASmartPreferences::InterpretInteger(const __CFString *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      int valuePtr = CFBooleanGetValue((CFBooleanRef)this);
LABEL_6:
      *a2 = 1;
      return valuePtr;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)this, kCFNumberIntType, &valuePtr);
      goto LABEL_6;
    }
    if (v5 == CFStringGetTypeID())
    {
      CFStringGetCString(this, buffer, 64, 0x600u);
      if (sscanf(buffer, "%d", &valuePtr) == 1) {
        goto LABEL_6;
      }
    }
  }
  return valuePtr;
}

BOOL CACFPreferencesGetAppBooleanValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  CFStringRef v4 = (CASmartPreferences *)CFPreferencesCopyAppValue(a1, a2);
  CFStringRef v6 = v4;
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = (BOOL *)&v10;
  }
  BOOL v8 = CASmartPreferences::InterpretBoolean(v4, v7, v5);
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

BOOL CASmartPreferences::InterpretBoolean(CASmartPreferences *this, unsigned char *a2, BOOL *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int valuePtr = 0;
  *a2 = 0;
  if (this)
  {
    CFBooleanRef v4 = this;
    CFTypeID v5 = CFGetTypeID(this);
    if (v5 == CFBooleanGetTypeID())
    {
      LODWORD(this) = CFBooleanGetValue(v4);
LABEL_6:
      *a2 = 1;
      return this != 0;
    }
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      LODWORD(this) = valuePtr != 0;
      goto LABEL_6;
    }
    if (v5 != CFStringGetTypeID())
    {
      LODWORD(this) = 0;
      return this != 0;
    }
    CFStringGetCString((CFStringRef)v4, buffer, 64, 0x600u);
    if (sscanf(buffer, "%d", &valuePtr) == 1)
    {
      *a2 = 1;
      LODWORD(this) = valuePtr != 0;
      return this != 0;
    }
    char v7 = buffer[0];
    if (buffer[0])
    {
      BOOL v8 = &buffer[1];
      do
      {
        *(v8 - 1) = __tolower(v7);
        int v9 = *v8++;
        char v7 = v9;
      }
      while (v9);
    }
    if (!(*(unsigned __int16 *)buffer ^ 0x6F6E | buffer[2])
      || (*(_DWORD *)buffer == 1936482662 ? (BOOL v10 = v13 == 101) : (BOOL v10 = 0), v10))
    {
      LODWORD(this) = 0;
      goto LABEL_6;
    }
    if (*(_DWORD *)buffer == 7562617 || !(*(_DWORD *)buffer ^ 0x65757274 | v13))
    {
      LODWORD(this) = 1;
      *a2 = 1;
    }
    else
    {
      LODWORD(this) = valuePtr;
    }
  }
  return this != 0;
}

uint64_t CACFPreferencesGetAppFourCCValue(const __CFString *a1, const __CFString *a2, BOOL *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFStringRef v4 = (const __CFString *)CFPreferencesCopyAppValue(a1, a2);
  if (!v4)
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
    if (!a3) {
      return v7;
    }
    goto LABEL_7;
  }
  CFStringRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFStringGetTypeID() && (CFStringGetCString(v5, buffer, 64, 0x600u), strlen(buffer) == 4))
  {
    uint64_t v7 = bswap32(*(unsigned int *)buffer);
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    BOOL v8 = 0;
  }
  CFRelease(v5);
  if (a3) {
LABEL_7:
  }
    *a3 = v8;
  return v7;
}

void CASmartPreferences::CASmartPreferences(CASmartPreferences *this)
{
  *(void *)this = 850045863;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0]);
  global_queue = dispatch_get_global_queue(0, 0);
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  uint64_t v3 = dispatch_source_create(MEMORY[0x263EF83F0], 1uLL, 0, global_queue);
  *((void *)this + 12) = v3;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN18CASmartPreferencesC2Ev_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = this;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_resume(*((dispatch_object_t *)this + 12));
}

void sub_225CDD350(_Unwind_Exception *a1)
{
  std::mutex::~mutex(v1);
  _Unwind_Resume(a1);
}

void ___ZN18CASmartPreferencesC2Ev_block_invoke(uint64_t a1)
{
}

void CASmartPreferences::RereadPrefs(CASmartPreferences *this)
{
  std::mutex::lock((std::mutex *)this);
  CFSetApplyFunction(*((CFSetRef *)this + 8), (CFSetApplierFunction)SynchronizePrefDomain, 0);
  int v2 = (CFStringRef *)*((void *)this + 9);
  uint64_t v3 = (CFStringRef *)*((void *)this + 10);
  while (v2 != v3)
  {
    CASmartPreferences::Pref::Load(v2);
    v2 += 6;
  }
  std::mutex::unlock((std::mutex *)this);
}

void sub_225CDD3E4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t CASmartPreferences::HavePref(CASmartPreferences *this, CFTypeRef cf1, const __CFString *a3)
{
  uint64_t v3 = (CFTypeRef *)*((void *)this + 9);
  CFStringRef v4 = (CFTypeRef *)*((void *)this + 10);
  if (v3 == v4) {
    return 0;
  }
  while (!CFEqual(cf1, *v3) || !CFEqual(a3, v3[1]))
  {
    v3 += 6;
    if (v3 == v4) {
      return 0;
    }
  }
  return 1;
}

void CASmartPreferences::_RegisterFirstHandler(uint64_t a1, const void *a2, __CFString *a3, uint64_t a4)
{
  value = a3;
  uint64_t v11 = a2;
  std::mutex::lock((std::mutex *)a1);
  if ((CASmartPreferences::HavePref((CASmartPreferences *)a1, a2, a3) & 1) == 0)
  {
    CFRetain(a2);
    CFRetain(a3);
    unint64_t v8 = *(void *)(a1 + 80);
    if (v8 >= *(void *)(a1 + 88))
    {
      uint64_t v9 = std::vector<CASmartPreferences::Pref>::__emplace_back_slow_path<__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>((uint64_t *)(a1 + 72), (uint64_t *)&v11, (uint64_t *)&value, a4);
    }
    else
    {
      std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(a1 + 88, *(void **)(a1 + 80), (uint64_t *)&v11, (uint64_t *)&value, a4);
      uint64_t v9 = v8 + 48;
      *(void *)(a1 + 80) = v8 + 48;
    }
    *(void *)(a1 + 80) = v9;
    CFSetAddValue(*(CFMutableSetRef *)(a1 + 64), value);
    CASmartPreferences::Pref::Load((CFStringRef *)(*(void *)(a1 + 80) - 48));
  }
  std::mutex::unlock((std::mutex *)a1);
}

void sub_225CDD544(_Unwind_Exception *a1)
{
  *(void *)(v1 + 80) = v2;
  std::mutex::unlock((std::mutex *)v1);
  _Unwind_Resume(a1);
}

CFPropertyListRef CASmartPreferences::Pref::Load(CFStringRef *this)
{
  CFPropertyListRef result = CFPreferencesCopyAppValue(*this, this[1]);
  if (result)
  {
    return (CFPropertyListRef)std::function<BOOL ()(void const*)>::operator()((uint64_t)(this + 2), (uint64_t)result);
  }
  return result;
}

uint64_t std::function<BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t SynchronizePrefDomain(const __CFString *a1, void *a2)
{
  return CFPreferencesSynchronize(a1, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
}

uint64_t std::vector<CASmartPreferences::Pref>::__emplace_back_slow_path<__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v6) {
    unint64_t v6 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v10 = 0x555555555555555;
  }
  else {
    unint64_t v10 = v6;
  }
  uint64_t v18 = a1 + 2;
  if (v10) {
    uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CASmartPreferences::Pref>>((uint64_t)(a1 + 2), v10);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v14 = v11;
  int v15 = &v11[48 * v5];
  int v17 = &v11[48 * v10];
  std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>((uint64_t)(a1 + 2), v15, a2, a3, a4);
  int v16 = v15 + 48;
  std::vector<CASmartPreferences::Pref>::__swap_out_circular_buffer(a1, &v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)&v14);
  return v12;
}

void sub_225CDD73C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::allocator<CASmartPreferences::Pref>::construct[abi:ne180100]<CASmartPreferences::Pref,__CFString const*&,__CFString const*&,std::function<BOOL ()(void const*)> &>(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  v9[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = *a3;
  uint64_t v7 = *a4;
  std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100]((uint64_t)v9, a5);
  *a2 = v6;
  a2[1] = v7;
  std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), (uint64_t)v9);
  return std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](v9);
}

void sub_225CDD7D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  CFTypeRef *v3 = 0;
  return a1;
}

void *std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t *std::vector<CASmartPreferences::Pref>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 == *result)
  {
    uint64_t v7 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v7 = v6 - 48;
      uint64_t v8 = v4 - 48;
      *(_OWORD *)(v6 - 48) = *(_OWORD *)(v4 - 48);
      CFPropertyListRef result = (uint64_t *)std::__function::__value_func<BOOL ()(void const*)>::__value_func[abi:ne180100](v6 - 32, v4 - 32);
      uint64_t v4 = v8;
      uint64_t v6 = v7;
    }
    while (v8 != v5);
  }
  a2[1] = v7;
  uint64_t v9 = *v3;
  uint64_t *v3 = v7;
  a2[1] = v9;
  uint64_t v10 = v3[1];
  v3[1] = a2[2];
  a2[2] = v10;
  uint64_t v11 = v3[2];
  v3[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CASmartPreferences::Pref>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

uint64_t std::__split_buffer<CASmartPreferences::Pref>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 48;
    std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x22A63EB50);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_225CDE288(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CDE388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CDE484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDE4FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDE5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDE72C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDE870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDE9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDEA1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDEB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDEB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDEC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDECD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDEDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDEE28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDEF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDEF80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDF0C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CDF14C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDF28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CDF310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDF408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDF4A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDF74C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CDF8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CDFA9C(_Unwind_Exception *a1)
{
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225CDFB48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDFC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CDFCD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CDFDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CDFEE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CE000C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE00EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }

  _Unwind_Resume(a1);
}

void sub_225CE0208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE0308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE0428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE0528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE0670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CE07B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE08AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

id ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1[2]();

  return v2;
}

void sub_225CE0990(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        int v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        int v16 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          int v17 = *v16;
          a11 = *v16;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v17;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    std::function<objc_object * ()(void)>::operator()(v13);
    objc_claimAutoreleasedReturnValue();
    JUMPOUT(0x225CE0944);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<objc_object * ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::~__func(uint64_t a1)
{
  JUMPOUT(0x22A63EB50);
}

void *std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  void *v2 = &unk_26D96F8E0;
  v2[1] = *(id *)(a1 + 8);
  return v2;
}

id std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26D96F8E0;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

void std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::destroy(uint64_t a1)
{
}

void std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::destroy_deallocate(id *a1)
{
  operator delete(a1);
}

id std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,objc_object * ()(void)>::operator()(uint64_t a1)
{
  return std::__invoke_void_return_wrapper<objc_object * {__strong},false>::__call[abi:ne180100]<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1} &>((id *)(a1 + 8));
}

id std::__invoke_void_return_wrapper<objc_object * {__strong},false>::__call[abi:ne180100]<decltype(({parm#1})()) ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(objc_object *({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1} &>(id *a1)
{
  return *a1;
}

void *std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  v1[2]();
}

void sub_225CE0E04(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        int v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        int v16 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          int v17 = *v16;
          a11 = *v16;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v17;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    std::function<void ()(void)>::operator()(v13);
    JUMPOUT(0x225CE0DD0);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<void ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__function::__func<ASDDSP::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDDSP::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::~__func()
{
}

void *std::__function::__func<ASDDSP::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDDSP::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::__clone()
{
  id result = operator new(0x10uLL);
  void *result = &unk_26D96F898;
  return result;
}

void std::__function::__func<ASDDSP::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1},std::allocator<ASDDSP::exceptionBarrier(void({block_pointer})(void))::{lambda(void)#1}>,void ()(void)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26D96F898;
}

void *std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1[2]();

  return v2;
}

void sub_225CE12CC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        int v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        int v16 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          int v17 = *v16;
          a11 = *v16;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v17;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    std::function<BOOL ()(void)>::operator()(v13);
    JUMPOUT(0x225CE1290);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<BOOL ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,BOOL ()(void)>::~__func()
{
}

unsigned char *std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,BOOL ()(void)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_26D96F928;
  result[8] = *(unsigned char *)(a1 + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,BOOL ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26D96F928;
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(result + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(BOOL({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,BOOL ()(void)>::operator()(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

void *std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1[2]();

  return v2;
}

void sub_225CE1674(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, long long buf, int *a13)
{
  if (a2)
  {
    if (a2 == 4)
    {
      ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(a1);
      __cxa_end_catch();
    }
    else
    {
      if (a2 == 3)
      {
        int v15 = __cxa_begin_catch(a1);
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v15 + 16))(v15);
          LODWORD(buf) = 136315138;
          *(void *)((char *)&buf + 4) = v18;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "std::exception caught: %s.", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        int v16 = (int *)__cxa_begin_catch(a1);
        if (a2 == 2)
        {
          int v17 = *v16;
          a11 = *v16;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 67109634;
            DWORD1(buf) = v17;
            WORD4(buf) = 1040;
            *(_DWORD *)((char *)&buf + 10) = 4;
            HIWORD(buf) = 2080;
            a13 = &a11;
            _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Caught OSStatus exception %d %4.4s", (uint8_t *)&buf, 0x18u);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown exception caught!", (uint8_t *)&buf, 2u);
        }
      }
      __cxa_end_catch();
    }
    std::function<unsigned int ()(void)>::operator()(v13);
    JUMPOUT(0x225CE1638);
  }
  _Unwind_Resume(a1);
}

uint64_t std::function<unsigned int ()(void)>::operator()(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 24);
  if (!v1) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)v1 + 48);
  return v2();
}

void std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::~__func()
{
}

_DWORD *std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::__clone(uint64_t a1)
{
  id result = operator new(0x10uLL);
  *(void *)id result = &unk_26D96F970;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::__clone(uint64_t result, uint64_t a2)
{
  *(void *)a2 = &unk_26D96F970;
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 8);
  return result;
}

uint64_t std::__function::__func<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1},std::allocator<decltype(({parm#1})()) ASDDSP::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(unsigned int({block_pointer} {__strong})(void),decltype(({parm#1})()))::{lambda(void)#1}>,unsigned int ()(void)>::operator()(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void *std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x32u);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t result)
{
  _DWORD *v1 = *(_DWORD *)(result + 8);
  return result;
}

void ASDIntervalFilter::ASDIntervalFilter(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
  *(void *)a1 = &unk_26D96F418;
  *(_DWORD *)(a1 + 24) = a4 + 1;
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  operator new[]();
}

void ASDIntervalFilter::~ASDIntervalFilter(ASDIntervalFilter *this)
{
  *(void *)this = &unk_26D96F418;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 56));
  uint64_t v2 = *((void *)this + 4);
  if (v2) {
    MEMORY[0x22A63EB50](v2, 0x1000C40451B5BE8);
  }
}

void ASDIntervalFilter::reInitialiseFilter(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  if (!(a3 | a2))
  {
    if (*(void *)(a1 + 48) < 2uLL) {
      goto LABEL_5;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    unsigned int v9 = *(_DWORD *)(a1 + 24);
    unsigned int v10 = v9 + *(_DWORD *)(a1 + 40);
    uint64_t v11 = (void *)(v8 + 16 * (int)((v10 - 1) % v9));
    a3 = (__PAIR128__(v11[1] - *(void *)(v8 + 16 * (int)((v10 - 2) % v9) + 8), *v11)
        - *(unint64_t *)(v8 + 16 * (int)((v10 - 2) % v9))) >> 64;
    a2 = *v11 - *(void *)(v8 + 16 * (int)((v10 - 2) % v9));
  }
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = a3;
LABEL_5:
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12)
  {
    MEMORY[0x22A63EB50](v12, 0x1000C40451B5BE8);
    *(void *)(a1 + 32) = 0;
  }
  *(_DWORD *)(a1 + 24) = a4 + 1;
  operator new[]();
}

uint64_t ASDIntervalFilter::newTimePosition(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!*(void *)(a1 + 32)) {
    return 0;
  }
  uint64_t v6 = (pthread_mutex_t *)(a1 + 56);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  if (!*(void *)(a1 + 48))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    unint64_t v8 = *(int *)(a1 + 40);
    unsigned int v9 = (unint64_t *)(v7 + 16 * v8);
    unint64_t *v9 = a2;
    v9[1] = a3;
    unsigned int v10 = *(_DWORD *)(a1 + 24);
    if (v10 != 1)
    {
      unsigned int v11 = v10 - 1;
      unint64_t v12 = a2;
      do
      {
        signed int v13 = (v10 - 1 + v8) % v10;
        unint64_t v14 = *(void *)(a1 + 8);
        uint64_t v15 = *(void *)(v7 + 16 * (int)v8 + 8) - *(void *)(a1 + 16);
        BOOL v16 = v12 >= v14;
        v12 -= v14;
        uint64_t v17 = !v16;
        unint64_t v8 = v15 - v17;
        uint64_t v18 = (unint64_t *)(v7 + 16 * v13);
        *uint64_t v18 = v12;
        v18[1] = v8;
        LODWORD(v8) = v13;
        --v11;
      }
      while (v11);
    }
  }
  uint64_t v19 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(*(void *)a1 + 40))(a1, a2, a3);
  uint64_t v20 = *(int *)(a1 + 40);
  int v21 = (uint64_t *)(*(void *)(a1 + 32) + 16 * v20);
  *int v21 = v19;
  v21[1] = v22;
  *(_DWORD *)(a1 + 40) = (v20 + *(_DWORD *)(a1 + 24) + 1) % *(_DWORD *)(a1 + 24);
  ++*(void *)(a1 + 48);
  pthread_mutex_unlock(v6);
  return v19;
}

uint64_t ASDIntervalFilter::getMultiIntervalTime(ASDIntervalFilter *this)
{
  if (!*((void *)this + 4)) {
    return 0;
  }
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 56);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 56));
  uint64_t v3 = *(void *)(*((void *)this + 4)
                 + 16
                 * (int)((*((_DWORD *)this + 10) + *((_DWORD *)this + 6) - 1) % *((_DWORD *)this + 6)))
     - *(void *)(*((void *)this + 4) + 16 * *((int *)this + 10));
  pthread_mutex_unlock(v2);
  return v3;
}

void ASDIntervalFilterIIR::ASDIntervalFilterIIR(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
}

{
  ASDIntervalFilter::ASDIntervalFilter(a1, a2, a3, a4);
}

unint64_t ASDIntervalFilterIIR::calculateNewTimePosition(uint64_t a1, unint64_t a2, uint64_t a3)
{
  size_t v5 = (uint64_t *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 8);
  int v6 = *(unsigned __int16 *)(a1 + 184);
  uint64_t v7 = *(void *)(a1 + 16);
  unint64_t v8 = v4;
  uint64_t v9 = v7;
  if (*(_WORD *)(a1 + 184))
  {
    int v10 = *(unsigned __int16 *)(a1 + 184);
    uint64_t v9 = *(void *)(a1 + 16);
    unint64_t v8 = *(void *)(a1 + 8);
    do
    {
      *((void *)&v11 + 1) = v9;
      *(void *)&long long v11 = v8;
      uint64_t v9 = v11 >> 63;
      v8 *= 2;
      --v10;
    }
    while (v10);
  }
  unint64_t v12 = v8 + a2;
  LODWORD(v13) = __CFADD__(v8, a2);
  if (v12 < a2) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v13;
  }
  uint64_t v14 = v9 + a3 + v13;
  if (*(void *)(a1 + 48))
  {
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    unint64_t v64 = v8 + a2;
    uint64_t v65 = v9 + a3 + v13;
    if (v6)
    {
      uint64_t v15 = v66;
      uint64_t v16 = v67;
      uint64_t v17 = v9 + a3 + v13;
      int v18 = v6;
      unint64_t v19 = v8 + a2;
      do
      {
        *((void *)&v20 + 1) = v16;
        *(void *)&long long v20 = v15;
        uint64_t v16 = v20 >> 63;
        *((void *)&v20 + 1) = v15;
        *(void *)&long long v20 = v17;
        uint64_t v15 = v20 >> 63;
        *((void *)&v20 + 1) = v17;
        *(void *)&long long v20 = v19;
        uint64_t v17 = v20 >> 63;
        v19 *= 2;
        --v18;
      }
      while (v18);
      uint64_t v66 = v15;
      uint64_t v67 = v16;
      unint64_t v64 = v19;
      uint64_t v65 = v17;
    }
    (*(void (**)(uint64_t, uint64_t, unint64_t *))(*(void *)a1 + 48))(a1, a1 + 120, &v64);
    uint64_t v79 = 0;
    unint64_t v80 = 0;
    int v21 = *(unsigned __int16 *)(a1 + 184);
    unint64_t v77 = v12;
    uint64_t v78 = v14;
    if (v21)
    {
      uint64_t v22 = v79;
      unint64_t v23 = v80;
      do
      {
        *((void *)&v24 + 1) = v23;
        *(void *)&long long v24 = v22;
        unint64_t v23 = v24 >> 63;
        *((void *)&v24 + 1) = v22;
        *(void *)&long long v24 = v14;
        uint64_t v22 = v24 >> 63;
        *((void *)&v24 + 1) = v14;
        *(void *)&long long v24 = v12;
        uint64_t v14 = v24 >> 63;
        v12 *= 2;
        --v21;
      }
      while (v21);
      uint64_t v79 = v22;
      unint64_t v80 = v23;
      unint64_t v77 = v12;
      uint64_t v78 = v14;
    }
    operator-(&v77, (unint64_t *)(a1 + 120), (uint64_t)&v81);
    v63[0] = v81;
    v63[1] = v82;
    (*(void (**)(uint64_t, uint64_t, _OWORD *, void))(*(void *)a1 + 48))(a1, a1 + 152, v63, *(unsigned __int16 *)(a1 + 184));
    ASD_U256::operator+((unint64_t *)(a1 + 120), (unint64_t *)(a1 + 152), &v77);
    int v25 = *(unsigned __int16 *)(a1 + 184);
    unint64_t v26 = v77;
    uint64_t v27 = v78;
    if (*(_WORD *)(a1 + 184))
    {
      uint64_t v29 = v79;
      unint64_t v28 = v80;
      do
      {
        *((void *)&v30 + 1) = v27;
        *(void *)&long long v30 = v26;
        unint64_t v26 = v30 >> 1;
        *((void *)&v30 + 1) = v29;
        *(void *)&long long v30 = v27;
        uint64_t v27 = v30 >> 1;
        *((void *)&v30 + 1) = v28;
        *(void *)&long long v30 = v29;
        uint64_t v29 = v30 >> 1;
        v28 >>= 1;
        --v25;
      }
      while (v25);
    }
  }
  else
  {
    unint64_t v77 = v8 + a2;
    uint64_t v78 = v9 + a3 + v13;
    uint64_t v79 = 0;
    unint64_t v80 = 0;
    uint64_t v75 = 0;
    uint64_t v76 = 0;
    unint64_t v73 = v4;
    uint64_t v74 = v7;
    if (v6)
    {
      uint64_t v31 = v75;
      uint64_t v32 = v76;
      do
      {
        *((void *)&v33 + 1) = v32;
        *(void *)&long long v33 = v31;
        uint64_t v32 = v33 >> 63;
        *((void *)&v33 + 1) = v31;
        *(void *)&long long v33 = v7;
        uint64_t v31 = v33 >> 63;
        *((void *)&v33 + 1) = v7;
        *(void *)&long long v33 = v4;
        uint64_t v7 = v33 >> 63;
        v4 *= 2;
        --v6;
      }
      while (v6);
      uint64_t v75 = v31;
      uint64_t v76 = v32;
      unint64_t v73 = v4;
      uint64_t v74 = v7;
    }
    operator-(&v77, &v73, (uint64_t)&v81);
    int v34 = *(unsigned __int16 *)(a1 + 184);
    uint64_t v35 = *((void *)&v81 + 1);
    uint64_t v36 = v81;
    uint64_t v38 = *((void *)&v82 + 1);
    uint64_t v37 = v82;
    if (*(_WORD *)(a1 + 184))
    {
      int v39 = *(unsigned __int16 *)(a1 + 184);
      do
      {
        *((void *)&v40 + 1) = v38;
        *(void *)&long long v40 = v37;
        uint64_t v38 = v40 >> 63;
        *((void *)&v40 + 1) = v37;
        *(void *)&long long v40 = v35;
        uint64_t v37 = v40 >> 63;
        *((void *)&v40 + 1) = v35;
        *(void *)&long long v40 = v36;
        uint64_t v35 = v40 >> 63;
        v36 *= 2;
        --v39;
      }
      while (v39);
    }
    *(void *)(a1 + 120) = v36;
    *(void *)(a1 + 136) = v37;
    *(void *)(a1 + 144) = v38;
    *(void *)(a1 + 128) = v35;
    uint64_t v71 = 0;
    uint64_t v72 = 0;
    unint64_t v69 = v12;
    uint64_t v70 = v14;
    if (v34)
    {
      uint64_t v41 = v71;
      uint64_t v42 = v72;
      uint64_t v43 = v14;
      int v44 = v34;
      unint64_t v45 = v12;
      do
      {
        *((void *)&v46 + 1) = v42;
        *(void *)&long long v46 = v41;
        uint64_t v42 = v46 >> 63;
        *((void *)&v46 + 1) = v41;
        *(void *)&long long v46 = v43;
        uint64_t v41 = v46 >> 63;
        *((void *)&v46 + 1) = v43;
        *(void *)&long long v46 = v45;
        uint64_t v43 = v46 >> 63;
        v45 *= 2;
        --v44;
      }
      while (v44);
      uint64_t v71 = v41;
      uint64_t v72 = v42;
      unint64_t v69 = v45;
      uint64_t v70 = v43;
    }
    (*(void (**)(uint64_t, uint64_t, unint64_t *))(*(void *)a1 + 48))(a1, a1 + 120, &v69);
    uint64_t v79 = 0;
    unint64_t v80 = 0;
    int v47 = *(unsigned __int16 *)(a1 + 184);
    unint64_t v77 = v12;
    uint64_t v78 = v14;
    if (v47)
    {
      uint64_t v48 = v79;
      unint64_t v49 = v80;
      do
      {
        *((void *)&v50 + 1) = v49;
        *(void *)&long long v50 = v48;
        unint64_t v49 = v50 >> 63;
        *((void *)&v50 + 1) = v48;
        *(void *)&long long v50 = v14;
        uint64_t v48 = v50 >> 63;
        *((void *)&v50 + 1) = v14;
        *(void *)&long long v50 = v12;
        uint64_t v14 = v50 >> 63;
        v12 *= 2;
        --v47;
      }
      while (v47);
      uint64_t v79 = v48;
      unint64_t v80 = v49;
      unint64_t v77 = v12;
      uint64_t v78 = v14;
    }
    operator-(&v77, (unint64_t *)(a1 + 120), (uint64_t)&v81);
    operator*(v5, ~(-1 << *(_WORD *)(a1 + 184)), (uint64_t)&v77);
    unint64_t v51 = v77;
    uint64_t v52 = v78;
    uint64_t v53 = v79;
    unint64_t v54 = v80;
    if (*(_WORD *)(a1 + 184))
    {
      int v55 = *(unsigned __int16 *)(a1 + 184);
      do
      {
        *((void *)&v56 + 1) = v54;
        *(void *)&long long v56 = v53;
        unint64_t v54 = v56 >> 63;
        *((void *)&v56 + 1) = v53;
        *(void *)&long long v56 = v52;
        uint64_t v53 = v56 >> 63;
        *((void *)&v56 + 1) = v52;
        *(void *)&long long v56 = v51;
        uint64_t v52 = v56 >> 63;
        v51 *= 2;
        --v55;
      }
      while (v55);
    }
    *(void *)(a1 + 168) = v53;
    *(void *)(a1 + 176) = v54;
    *(void *)(a1 + 160) = v52;
    *(void *)(a1 + 152) = v51;
    v68[0] = v81;
    v68[1] = v82;
    (*(void (**)(uint64_t, uint64_t, _OWORD *))(*(void *)a1 + 48))(a1, a1 + 152, v68);
    ASD_U256::operator+((unint64_t *)(a1 + 120), (unint64_t *)(a1 + 152), &v77);
    int v57 = *(unsigned __int16 *)(a1 + 184);
    unint64_t v26 = v77;
    uint64_t v58 = v78;
    if (*(_WORD *)(a1 + 184))
    {
      uint64_t v60 = v79;
      unint64_t v59 = v80;
      do
      {
        *((void *)&v61 + 1) = v58;
        *(void *)&long long v61 = v26;
        unint64_t v26 = v61 >> 1;
        *((void *)&v61 + 1) = v60;
        *(void *)&long long v61 = v58;
        uint64_t v58 = v61 >> 1;
        *((void *)&v61 + 1) = v59;
        *(void *)&long long v61 = v60;
        uint64_t v60 = v61 >> 1;
        v59 >>= 1;
        --v57;
      }
      while (v57);
    }
  }
  return v26 - v8;
}

void *operator-@<X0>(void *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3 = result[2];
  unint64_t v4 = a2[2];
  unsigned long long v5 = __PAIR128__(result[3] - a2[3], v3) - v4;
  *(_OWORD *)(a3 + 16) = v5;
  unint64_t v6 = result[1];
  BOOL v8 = *result < *a2;
  unsigned long long v7 = __PAIR128__(v6 - a2[1], *result) - *a2;
  *(_OWORD *)a3 = v7;
  BOOL v9 = v6 == *((void *)&v7 + 1) && v8;
  if (v6 < *((void *)&v7 + 1) || v9)
  {
    *(void *)(a3 + 16) = v5 - 1;
    if (v3 == v4) {
      *(void *)(a3 + 24) = *((void *)&v5 + 1) - 1;
    }
  }
  return result;
}

unint64_t *ASD_U256::operator+@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3 = result[2];
  unint64_t v4 = a2[2];
  unint64_t v5 = v4 + v3;
  LODWORD(v6) = __CFADD__(v4, v3);
  if (v5 < v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v6;
  }
  uint64_t v7 = a2[3] + result[3] + v6;
  unint64_t v9 = *result;
  unint64_t v8 = result[1];
  unint64_t v11 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v12 = *a2 + *result;
  LODWORD(v13) = __CFADD__(*a2, *result);
  if (v12 < v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v13;
  }
  unint64_t v14 = v10 + v8 + v13;
  *a3 = v12;
  a3[1] = v14;
  a3[2] = v5;
  a3[3] = v7;
  if (v10 > v14
    || (v8 == v14 ? (BOOL v15 = v12 >= v9) : (BOOL v15 = 1),
        v15 ? (int v16 = 0) : (int v16 = 1),
        v12 < v11 ? (BOOL v17 = v10 == v14) : (BOOL v17 = 0),
        !v17 ? (BOOL v18 = v8 > v14) : (BOOL v18 = 1),
        !v18 ? (BOOL v19 = v16 == 0) : (BOOL v19 = 0),
        !v19))
  {
    a3[2] = v5 + 1;
    if (v5 == -1) {
      a3[3] = v7 + 1;
    }
  }
  return result;
}

__n128 ASDIntervalFilterIIR::IIR(uint64_t a1, __n128 *a2, unint64_t *a3, int a4)
{
  unint64_t v5 = a2->n128_u64[0];
  unint64_t v6 = a2->n128_u64[1];
  unint64_t v7 = a2[1].n128_u64[0];
  unint64_t v8 = a2[1].n128_u64[1];
  if (a4)
  {
    int v9 = a4;
    do
    {
      *((void *)&v10 + 1) = v6;
      *(void *)&long long v10 = v5;
      unint64_t v5 = v10 >> 1;
      *((void *)&v10 + 1) = v7;
      *(void *)&long long v10 = v6;
      unint64_t v6 = v10 >> 1;
      *((void *)&v10 + 1) = v8;
      *(void *)&long long v10 = v7;
      unint64_t v7 = v10 >> 1;
      v8 >>= 1;
      --v9;
    }
    while (v9);
  }
  v20[2] = v7;
  v20[3] = v8;
  v20[0] = v5;
  v20[1] = v6;
  unint64_t v11 = *a3;
  unint64_t v12 = a3[1];
  unint64_t v13 = a3[2];
  for (unint64_t i = a3[3]; a4; --a4)
  {
    *((void *)&v15 + 1) = v12;
    *(void *)&long long v15 = v11;
    unint64_t v11 = v15 >> 1;
    *((void *)&v15 + 1) = v13;
    *(void *)&long long v15 = v12;
    unint64_t v12 = v15 >> 1;
    *((void *)&v15 + 1) = i;
    *(void *)&long long v15 = v13;
    unint64_t v13 = v15 >> 1;
    i >>= 1;
  }
  v19[2] = v13;
  v19[3] = i;
  v19[0] = v11;
  v19[1] = v12;
  operator-(a2, v20, (uint64_t)v17);
  ASD_U256::operator+(v17, v19, (unint64_t *)v18);
  __n128 result = (__n128)v18[1];
  *a2 = (__n128)v18[0];
  a2[1] = result;
  return result;
}

void ASDIntervalFilterFIR::ASDIntervalFilterFIR(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
}

void sub_225CE249C(_Unwind_Exception *a1)
{
  ASDIntervalFilter::~ASDIntervalFilter(v1);
  _Unwind_Resume(a1);
}

uint64_t ASDIntervalFilterFIR::setNewFilter(ASDIntervalFilterFIR *this, unsigned int a2, const unint64_t *a3, int a4)
{
  unint64_t v8 = (void *)*((void *)this + 17);
  if (v8)
  {
    free(v8);
    *((void *)this + 17) = 0;
  }
  int v9 = (void *)*((void *)this + 16);
  if (v9)
  {
    free(v9);
    *((void *)this + 16) = 0;
  }
  long long v10 = (void *)*((void *)this + 15);
  if (v10)
  {
    free(v10);
    *((void *)this + 15) = 0;
  }
  *((_DWORD *)this + 36) = a2;
  unint64_t v11 = malloc_type_malloc(8 * a2, 0x100004000313F17uLL);
  *((void *)this + 15) = v11;
  if (v11)
  {
    memcpy(v11, a3, 8 * *((unsigned int *)this + 36));
    *((_DWORD *)this + 37) = a4;
    operator new[]();
  }
  return 3758097084;
}

void ASDIntervalFilterFIR::reInitialiseFilter(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
}

void ASDIntervalFilterFIR::~ASDIntervalFilterFIR(ASDIntervalFilterFIR *this)
{
  *(void *)this = &unk_26D96F458;
  uint64_t v2 = *((void *)this + 17);
  if (v2)
  {
    MEMORY[0x22A63EB50](v2, 0x1000C40451B5BE8);
    *((void *)this + 17) = 0;
  }
  uint64_t v3 = *((void *)this + 16);
  if (v3)
  {
    MEMORY[0x22A63EB50](v3, 0x1000C40451B5BE8);
    *((void *)this + 16) = 0;
  }
  unint64_t v4 = (void *)*((void *)this + 15);
  if (v4)
  {
    free(v4);
    *((void *)this + 15) = 0;
  }
  ASDIntervalFilter::~ASDIntervalFilter(this);
}

{
  uint64_t vars8;

  ASDIntervalFilterFIR::~ASDIntervalFilterFIR(this);
  JUMPOUT(0x22A63EB50);
}

uint64_t ASDIntervalFilterFIR::calculateNewTimePosition(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  if (*(void *)(a1 + 48))
  {
    ASDIntervalFilterFIR::FIR((unint64_t *)a1, *(void *)(a1 + 128), a2, a3, (uint64_t *)&v17);
    long long v21 = v17;
    long long v22 = v18;
    *(void *)&long long v15 = a2;
    *((void *)&v15 + 1) = a3;
    long long v16 = 0uLL;
    operator-(&v15, (unint64_t *)&v21, (uint64_t)&v17);
    uint64_t v6 = *(void *)(a1 + 136);
  }
  else
  {
    if (*(_DWORD *)(a1 + 144))
    {
      int v7 = 0;
      unint64_t v8 = 0;
      do
      {
        operator*((uint64_t *)(a1 + 8), v8, (uint64_t)&v17);
        uint64_t v9 = *(void *)(a1 + 128);
        unint64_t v10 = *(unsigned int *)(a1 + 144);
        *(_OWORD *)(v9 + 16 * ((v7 + (int)v10) % v10)) = __PAIR128__(a3 - *((void *)&v17 + 1), a2)
                                                                       - (unint64_t)v17;
        ++v8;
        --v7;
      }
      while (v8 < v10);
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 128);
    }
    ASDIntervalFilterFIR::FIR((unint64_t *)a1, v9, a2, a3, (uint64_t *)&v17);
    long long v21 = v17;
    long long v22 = v18;
    *(void *)&long long v15 = a2;
    *((void *)&v15 + 1) = a3;
    long long v16 = 0uLL;
    operator-(&v15, (unint64_t *)&v21, (uint64_t)&v17);
    operator*((uint64_t *)(a1 + 8), (unint64_t)*(unsigned int *)(a1 + 144) >> 1, (uint64_t)&v15);
    unsigned int v11 = *(_DWORD *)(a1 + 144);
    uint64_t v6 = *(void *)(a1 + 136);
    if (v11)
    {
      long long v12 = v15;
      unsigned int v13 = *(_DWORD *)(a1 + 144);
      do
      {
        *(_OWORD *)(v6 + 16 * (v13 % v11)) = v12;
        --v13;
      }
      while (v13);
    }
  }
  ASDIntervalFilterFIR::FIR((unint64_t *)a1, v6, v17, *((uint64_t *)&v17 + 1), (uint64_t *)&v15);
  long long v19 = v15;
  long long v20 = v16;
  ASD_U256::operator+((unint64_t *)&v21, (unint64_t *)&v19, (unint64_t *)&v15);
  uint64_t result = v15;
  *(_DWORD *)(a1 + 152) = (*(_DWORD *)(a1 + 152) + *(_DWORD *)(a1 + 144) + 1) % *(_DWORD *)(a1 + 144);
  return result;
}

unint64_t *ASDIntervalFilterFIR::FIR@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  unint64_t v5 = result;
  long long v19 = 0u;
  long long v20 = 0u;
  int v7 = (void *)(a2 + 16 * *((unsigned int *)result + 38));
  void *v7 = a3;
  v7[1] = a4;
  LODWORD(v7) = *((_DWORD *)result + 36);
  if (v7)
  {
    int v9 = 0;
    unint64_t v10 = 0;
    do
    {
      operator*((uint64_t *)(a2 + 16 * ((v9 + (int)v7 + *((_DWORD *)v5 + 38)) % v7)), *(void *)(v5[15] + 8 * v10), (uint64_t)v18);
      uint64_t result = ASD_U256::operator+=((unint64_t *)&v19, v18);
      ++v10;
      int v7 = (void *)*((unsigned int *)v5 + 36);
      --v9;
    }
    while (v10 < (unint64_t)v7);
  }
  int v11 = *((_DWORD *)v5 + 37);
  long long v12 = v20;
  *(_OWORD *)a5 = v19;
  *((_OWORD *)a5 + 1) = v12;
  if (v11)
  {
    uint64_t v13 = *a5;
    uint64_t v14 = a5[1];
    uint64_t v15 = a5[2];
    unint64_t v16 = a5[3];
    do
    {
      *((void *)&v17 + 1) = v14;
      *(void *)&long long v17 = v13;
      uint64_t v13 = v17 >> 1;
      *((void *)&v17 + 1) = v15;
      *(void *)&long long v17 = v14;
      uint64_t v14 = v17 >> 1;
      *((void *)&v17 + 1) = v16;
      *(void *)&long long v17 = v15;
      uint64_t v15 = v17 >> 1;
      v16 >>= 1;
      --v11;
    }
    while (v11);
    *a5 = v13;
    a5[1] = v14;
    a5[2] = v15;
    a5[3] = v16;
  }
  return result;
}

unint64_t *ASD_U256::operator+=(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = result[2];
  unint64_t v3 = a2[2];
  unint64_t v4 = v3 + v2;
  LODWORD(v5) = __CFADD__(v3, v2);
  if (v4 < v3) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v5;
  }
  uint64_t v6 = a2[3] + result[3] + v5;
  unint64_t v7 = result[1];
  unint64_t v9 = *a2;
  unint64_t v8 = a2[1];
  unint64_t v10 = *a2 + *result;
  LODWORD(v11) = __CFADD__(*a2, *result);
  if (v10 < v9) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = v11;
  }
  unint64_t v12 = v8 + v7 + v11;
  if (v8 > v12
    || (v10 < v9 ? (BOOL v13 = v8 == v12) : (BOOL v13 = 0),
        !v13 ? (int v14 = 0) : (int v14 = 1),
        v7 == v12 ? (BOOL v15 = v10 >= *result) : (BOOL v15 = 1),
        v15 ? (BOOL v16 = v7 > v12) : (BOOL v16 = 1),
        !v16 ? (BOOL v17 = v14 == 0) : (BOOL v17 = 0),
        !v17))
  {
    BOOL v15 = __CFADD__(v4++, 1);
    if (v15) {
      ++v6;
    }
  }
  result[2] = v4;
  result[3] = v6;
  _DWORD *result = v10;
  result[1] = v12;
  return result;
}

void ASDIntervalFilterIIR::~ASDIntervalFilterIIR(ASDIntervalFilterIIR *this)
{
  ASDIntervalFilter::~ASDIntervalFilter(this);
  JUMPOUT(0x22A63EB50);
}

void sub_225CE2DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE2FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE30E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE3170(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE3354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_225CE379C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE385C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_225CE3E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE3EDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE40F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE41F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE4508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,void **a25)
{
  MEMORY[0x22A63EB50](v25, 0x1020C403FC65FD6);
  a25 = (void **)&a22;
  std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100](&a25);
  _Unwind_Resume(a1);
}

void sub_225CE4674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

ASDDSPStreamHelper *std::unique_ptr<ASDDSPStreamHelper>::reset[abi:ne180100](ASDDSPStreamHelper **a1, ASDDSPStreamHelper *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    ASDDSPStreamHelper::~ASDDSPStreamHelper(result);
    JUMPOUT(0x22A63EB50);
  }
  return result;
}

void sub_225CE483C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE49D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  BOOL v17 = *(void **)(v15 - 72);
  if (v17)
  {
    *(void *)(v15 - 64) = v17;
    operator delete(v17);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CE4DE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE4EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_225CE4F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_225CE5514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE56EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE5844(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE5944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((void *)(v15 - 56));

  _Unwind_Resume(a1);
}

void sub_225CE5F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);

  ASDDSPGraphHelper::~ASDDSPGraphHelper((ASDDSPGraphHelper *)va);
  _Unwind_Resume(a1);
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::remove(uint64_t a1, uint64_t a2)
{
  v18.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 80);
  v18.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 80));
  uint64_t v4 = atomic_load((unint64_t *)(a1 + 40));
  if (v4
    && (unint64_t SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v4, a2), (SlotForKey & 1) != 0))
  {
    uint64_t v7 = v6;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v4 + 8 * HIDWORD(SlotForKey) + 16));
    if (v6)
    {
      int v8 = atomic_load((unsigned int *)(a1 + 48));
      if (v8 >= 1)
      {
        do
        {
          __ns.__rep_ = 50000;
          std::this_thread::sleep_for (&__ns);
          int v9 = atomic_load((unsigned int *)(a1 + 48));
        }
        while (v9 > 0);
      }
      if ((unsigned __int16)atomic_load((unsigned int *)v7))
      {
        std::unique_lock<std::mutex>::unlock(&v18);
        while ((unsigned __int16)atomic_load((unsigned int *)v7))
        {
          __ns.__rep_ = 500000;
          std::this_thread::sleep_for (&__ns);
        }
        std::unique_lock<std::mutex>::lock(&v18);
        uint64_t v4 = atomic_load((unint64_t *)(a1 + 40));
      }
      caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::element_t::release((unsigned int *)v7);
      int v13 = *(_DWORD *)(a1 + 32) - 1;
      *(_DWORD *)(a1 + 32) = v13;
      if (v4)
      {
        unsigned int v14 = 16 * v13;
        unsigned int v15 = *(_DWORD *)(v4 + 8);
        if (v14 / v15 <= 2 && v15 >= 9) {
          caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::rehash((unint64_t *)a1, v15 >> 1);
        }
      }
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::emptyReleasePool(a1);
  if (v18.__owns_) {
    std::mutex::unlock(v18.__m_);
  }
  return v7;
}

void sub_225CE6130(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11)
{
  if (a11) {
    std::mutex::unlock(a10);
  }
  _Unwind_Resume(exception_object);
}

void ASDDSPGraphHelper::~ASDDSPGraphHelper(ASDDSPGraphHelper *this)
{
  uint64_t v2 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void sub_225CE64AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE65F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE6828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_225CE6C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE6E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE6EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CE7130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE726C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  atomic_fetch_add(v10, 0xFFFFFFFF);
  _Unwind_Resume(exception_object);
}

void sub_225CE746C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CE7580(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  atomic_fetch_add(v10, 0xFFFFFFFF);
  _Unwind_Resume(exception_object);
}

void sub_225CE7AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::__list_imp<ASDDSPGraphHelper>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        std::__destroy_at[abi:ne180100]<ASDDSPGraphHelper,0>(v3 + 2);
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__destroy_at[abi:ne180100]<ASDDSPGraphHelper,0>(void *a1)
{
  uint64_t v2 = a1[3];
  a1[3] = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = a1[2];
  a1[2] = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  uint64_t v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void std::__function::__func<std::hash<unsigned long long>,std::allocator<std::hash<unsigned long long>>,unsigned int ()(unsigned long long)>::~__func()
{
}

void *std::__function::__func<std::hash<unsigned long long>,std::allocator<std::hash<unsigned long long>>,unsigned int ()(unsigned long long)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26D96F7C0;
  return result;
}

void std::__function::__func<std::hash<unsigned long long>,std::allocator<std::hash<unsigned long long>>,unsigned int ()(unsigned long long)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26D96F7C0;
}

uint64_t std::__function::__func<std::hash<unsigned long long>,std::allocator<std::hash<unsigned long long>>,unsigned int ()(unsigned long long)>::operator()(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::~guarded_lookup_hash_table(result);
    JUMPOUT(0x22A63EB50);
  }
  return result;
}

void *caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  if (atomic_load((unsigned int *)(a1 + 48)))
  {
    _os_assert_log();
    uint64_t v6 = _os_crash();
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::~guarded_lookup_hash_table(v6);
  }
  uint64_t v3 = atomic_load((unint64_t *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::~table_impl(v3);
    MEMORY[0x22A63EB50](v4, 0x1060C402CF69088);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 80));
  uint64_t v7 = (void **)(a1 + 56);
  std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return std::__function::__value_func<unsigned int ()(unsigned long long)>::~__value_func[abi:ne180100]((void *)a1);
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2) {
        caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::element_t::release(*v3);
      }
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

unsigned int *caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::element_t::release(unsigned int *result)
{
  if ((atomic_fetch_add((atomic_uint *volatile)result, 0xFFFF0000) & 0xFFFF0000) == 0x10000)
  {
    if (!atomic_load(result))
    {
      JUMPOUT(0x22A63EB50);
    }
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::element_t::release();
  }
  return result;
}

void std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t *)**a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::~table_impl(result);
    JUMPOUT(0x22A63EB50);
  }
  return result;
}

void *std::__function::__value_func<unsigned int ()(unsigned long long)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = v2;
    if (v4 != v2)
    {
      do
        ASDDSPStreamHelper::DSPStream::~DSPStream((ASDDSPStreamHelper::DSPStream *)(v4 - 72));
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void ASDDSPStreamHelper::DSPStream::~DSPStream(ASDDSPStreamHelper::DSPStream *this)
{
  uint64_t v4 = *((void *)this + 8);
  uint64_t v2 = (void *)((char *)this + 64);
  uint64_t v3 = v4;
  void *v2 = 0;
  if (v4) {
    std::default_delete<ASDBufferList>::operator()[abi:ne180100]((uint64_t)v2, v3);
  }
}

void std::default_delete<ASDBufferList>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = (void *)(a2 + 40);
    uint64_t v3 = *(void **)(a2 + 40);
    void *v2 = 0;
    if (v3) {
      std::default_delete<CABufferList>::operator()[abi:ne180100]((int)v2, v3);
    }
    JUMPOUT(0x22A63EB50);
  }
}

void std::default_delete<CABufferList>::operator()[abi:ne180100](int a1, void *__p)
{
  if (__p)
  {
    uint64_t v3 = __p[1];
    if (v3) {
      MEMORY[0x22A63EB30](v3, 0x1000C8077774924);
    }
    operator delete(__p);
  }
}

uint64_t std::vector<ASDDSPStreamHelper::DSPStream>::__construct_one_at_end[abi:ne180100]<ASDStreamDirection,AudioStreamBasicDescription,int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int),int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int)>(uint64_t a1, unsigned int *a2, AudioStreamBasicDescription *a3, void *a4, void *a5)
{
  uint64_t v8 = *(void *)(a1 + 8);
  uint64_t v9 = *a2;
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v11, a3);
  uint64_t result = ASDDSPStreamHelper::DSPStream::DSPStream(v8, v9, v11, *a4, *a5);
  *(void *)(a1 + 8) = v8 + 72;
  return result;
}

void sub_225CE845C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<ASDDSPStreamHelper::DSPStream>::__emplace_back_slow_path<ASDStreamDirection,AudioStreamBasicDescription,int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int),int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int)>(uint64_t *a1, unsigned int *a2, const AudioStreamBasicDescription *a3, void *a4, void *a5)
{
  uint64_t v6 = *a1;
  unint64_t v7 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  unint64_t v8 = v7 + 1;
  if (v7 + 1 > 0x38E38E38E38E38ELL) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = (uint64_t)(a1 + 2);
  unint64_t v14 = 0x8E38E38E38E38E39 * ((a1[2] - v6) >> 3);
  if (2 * v14 > v8) {
    unint64_t v8 = 2 * v14;
  }
  if (v14 >= 0x1C71C71C71C71C7) {
    unint64_t v15 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v15 = v8;
  }
  long long v24 = a1 + 2;
  if (v15) {
    BOOL v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDDSPStreamHelper::DSPStream>>(v13, v15);
  }
  else {
    BOOL v16 = 0;
  }
  long long v20 = v16;
  long long v21 = &v16[72 * v7];
  long long v22 = v21;
  unint64_t v23 = &v16[72 * v15];
  uint64_t v17 = *a2;
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v25, a3);
  ASDDSPStreamHelper::DSPStream::DSPStream(v21, v17, v25, *a4, *a5);
  long long v22 = v21 + 72;
  std::vector<ASDDSPStreamHelper::DSPStream>::__swap_out_circular_buffer(a1, &v20);
  uint64_t v18 = a1[1];
  std::__split_buffer<ASDDSPStreamHelper::DSPStream>::~__split_buffer((uint64_t)&v20);
  return v18;
}

void sub_225CE85A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::vector<ASDDSPStreamHelper::DSPStream>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ASDDSPStreamHelper::DSPStream>,std::reverse_iterator<ASDDSPStreamHelper::DSPStream*>,std::reverse_iterator<ASDDSPStreamHelper::DSPStream*>,std::reverse_iterator<ASDDSPStreamHelper::DSPStream*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ASDDSPStreamHelper::DSPStream>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(72 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ASDDSPStreamHelper::DSPStream>,std::reverse_iterator<ASDDSPStreamHelper::DSPStream*>,std::reverse_iterator<ASDDSPStreamHelper::DSPStream*>,std::reverse_iterator<ASDDSPStreamHelper::DSPStream*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10 = 0;
  uint64_t v11 = a7 - 72;
  while (a3 + v10 != a5)
  {
    uint64_t v12 = v11 + v10;
    v10 -= 72;
    ASDDSPStreamHelper::DSPStream::DSPStream(v12, v10 + a3);
  }
  return a6;
}

uint64_t std::__split_buffer<ASDDSPStreamHelper::DSPStream>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 72;
    ASDDSPStreamHelper::DSPStream::~DSPStream((ASDDSPStreamHelper::DSPStream *)(i - 72));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void ASDDSPStreamHelper::~ASDDSPStreamHelper(ASDDSPStreamHelper *this)
{
  std::mutex::~mutex((std::mutex *)((char *)this + 304));
  uint64_t v2 = (void *)*((void *)this + 35);
  if (v2)
  {
    *((void *)this + 36) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 32);
  if (v3)
  {
    *((void *)this + 33) = v3;
    operator delete(v3);
  }
  uint64_t v9 = (void **)((char *)this + 232);
  std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100](&v9);
  uint64_t v4 = (void *)*((void *)this + 26);
  if (v4)
  {
    *((void *)this + 27) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 23);
  if (v5)
  {
    *((void *)this + 24) = v5;
    operator delete(v5);
  }
  uint64_t v9 = (void **)((char *)this + 160);
  std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100](&v9);
  uint64_t v6 = (void *)*((void *)this + 17);
  *((void *)this + 17) = 0;
  if (v6) {
    std::default_delete<CABufferList>::operator()[abi:ne180100](this + 136, v6);
  }
  uint64_t v7 = (void *)*((void *)this + 11);
  *((void *)this + 11) = 0;
  if (v7) {
    std::default_delete<CABufferList>::operator()[abi:ne180100](this + 88, v7);
  }
  uint64_t v8 = (void *)*((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v8) {
    std::default_delete<CABufferList>::operator()[abi:ne180100](this + 40, v8);
  }
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 8);
  uint64_t result = std::function<unsigned int ()(unsigned long long)>::operator()(*(void *)a1, a2);
  signed int v6 = result % *(_DWORD *)(a1 + 8);
  if (v6 >= 3) {
    int v7 = 0;
  }
  else {
    int v7 = v4;
  }
  uint64_t v8 = (v6 + v7 - 3);
  uint64_t v9 = 0xFFFFFFFFLL;
  uint64_t v10 = 1;
  uint64_t v11 = result % *(_DWORD *)(a1 + 8);
  do
  {
    uint64_t v12 = v8;
    unint64_t v13 = atomic_load((unint64_t *)(a1 + 8 * v11 + 16));
    if (v13 == -1)
    {
      if ((int)v9 >= 0) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = v11;
      }
    }
    else
    {
      if (!v13)
      {
        uint64_t v10 = 0;
        if ((int)v9 >= 0) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v11;
        }
        return v10 | (v11 << 32);
      }
      if (*(void *)(v13 + 8) == a2) {
        return v10 | (v11 << 32);
      }
    }
    if ((int)v8 >= 3) {
      int v14 = 0;
    }
    else {
      int v14 = v4;
    }
    uint64_t v8 = (v8 + v14 - 3);
    uint64_t v11 = v12;
  }
  while (v12 != v6);
  if ((v9 & 0x80000000) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v9;
    return v10 | (v11 << 32);
  }
  __break(1u);
  return result;
}

uint64_t std::function<unsigned int ()(unsigned long long)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

void std::unique_lock<std::mutex>::unlock(std::unique_lock<std::mutex> *this)
{
  if (this->__owns_)
  {
    std::mutex::unlock(this->__m_);
    this->__owns_ = 0;
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::unlock: not locked");
    std::unique_lock<std::mutex>::lock(v2);
  }
}

void std::unique_lock<std::mutex>::lock(std::unique_lock<std::mutex> *this)
{
  m = this->__m_;
  if (m)
  {
    if (!this->__owns_)
    {
      std::mutex::lock(m);
      this->__owns_ = 1;
      return;
    }
  }
  else
  {
    std::__throw_system_error(1, "unique_lock::lock: references null mutex");
  }
  std::__throw_system_error(11, "unique_lock::lock: already locked");
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::rehash();
}

_DWORD *caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::rehash(unint64_t *a1, unsigned int a2)
{
  uint64_t v4 = a1 + 5;
  unint64_t v5 = atomic_load(a1 + 5);
  signed int v6 = operator new(8 * (a2 - 1) + 24);
  *(void *)signed int v6 = a1;
  v6[2] = a2;
  bzero(v6 + 4, 8 * a2);
  if (v5)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::copyAllElementsTo(v5, (uint64_t)v6);
    atomic_store((unint64_t)v6, v4);
    unint64_t v7 = a1[9];
    uint64_t v8 = (unint64_t *)a1[8];
    if ((unint64_t)v8 >= v7)
    {
      uint64_t v10 = (void *)a1[7];
      uint64_t v11 = v8 - v10;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v12 = v7 - (void)v10;
      unint64_t v13 = (uint64_t)(v7 - (void)v10) >> 2;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      uint64_t v25 = a1 + 9;
      if (v14)
      {
        unint64_t v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>((uint64_t)(a1 + 9), v14);
        uint64_t v10 = (void *)a1[7];
        uint64_t v8 = (unint64_t *)a1[8];
      }
      else
      {
        unint64_t v15 = 0;
      }
      BOOL v16 = (unint64_t *)&v15[8 * v11];
      uint64_t v17 = &v15[8 * v14];
      long long v24 = v17;
      *BOOL v16 = v5;
      *((void *)&v23 + 1) = v16 + 1;
      if (v8 == v10)
      {
        uint64_t v9 = v16 + 1;
      }
      else
      {
        do
        {
          unint64_t v18 = *--v8;
          unint64_t *v8 = 0;
          *--BOOL v16 = v18;
        }
        while (v8 != v10);
        uint64_t v9 = (void *)*((void *)&v23 + 1);
        uint64_t v17 = v24;
      }
      long long v19 = *(_OWORD *)(a1 + 7);
      a1[7] = (unint64_t)v16;
      a1[8] = (unint64_t)v9;
      long long v23 = v19;
      unint64_t v20 = a1[9];
      a1[9] = (unint64_t)v17;
      long long v24 = (char *)v20;
      uint64_t v22 = v19;
      std::__split_buffer<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>>::~__split_buffer((uint64_t)&v22);
    }
    else
    {
      unint64_t *v8 = v5;
      uint64_t v9 = v8 + 1;
    }
    a1[8] = (unint64_t)v9;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::emptyReleasePool(uint64_t result)
{
  int v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    uint64_t v2 = result;
    uint64_t v4 = *(uint64_t **)(result + 56);
    for (uint64_t i = *(uint64_t **)(result + 64);
          i != v4;
          uint64_t result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>::reset[abi:ne180100](i, 0))
    {
      --i;
    }
    *(void *)(v2 + 64) = v4;
  }
  return result;
}

unint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::copyAllElementsTo(unint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 8);
  if (v2)
  {
    uint64_t v4 = (unint64_t *)(result + 16);
    do
    {
      unint64_t v5 = *v4;
      if (*v4 + 1 >= 2)
      {
        uint64_t result = caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(a2, *(void *)(v5 + 8));
        if ((result & 1) == 0)
        {
          atomic_fetch_add((atomic_uint *volatile)v5, 0x10000u);
          atomic_store(v5, (unint64_t *)(a2 + 8 * HIDWORD(result) + 16));
        }
      }
      ++v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t std::__split_buffer<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl>>::reset[abi:ne180100]((uint64_t *)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::list<ASDDSPGraphHelper>::splice(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    unint64_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        unint64_t v7 = a4;
        do
        {
          unint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

BOOL caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::_addOrReplace(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  uint64_t v9 = (_DWORD *)atomic_load((unint64_t *)(a1 + 40));
  int v10 = *(_DWORD *)(a1 + 32) + 1;
  *(_DWORD *)(a1 + 32) = v10;
  if (v9)
  {
    unsigned int v11 = 16 * v10;
    unsigned int v12 = v9[2];
    if (v11 / v12 < 0xB) {
      goto LABEL_6;
    }
    unsigned int v13 = 2 * v12;
  }
  else
  {
    unsigned int v13 = 8;
  }
  uint64_t v9 = caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::rehash((unint64_t *)a1, v13);
LABEL_6:
  BOOL v14 = caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::addOrReplace((uint64_t)v9, a2, a3, a4);
  if (v14) {
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::emptyReleasePool(a1);
  }
  else {
    --*(_DWORD *)(a1 + 32);
  }
  std::mutex::unlock(v8);
  return v14;
}

void sub_225CE8DD8(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::addOrReplace(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  char SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(a1, a2);
  if ((SlotForKey & 1) == 0) {
    operator new();
  }
  if (a4) {
    *(void *)(v7 + 16) = a3;
  }
  return (SlotForKey & 1) == 0;
}

void sub_225CE9F00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void DSPGraph::GraphFactory::createPassthroughGraph(DSPGraph::GraphFactory *this, const CAStreamBasicDescription *a2)
{
}

void sub_225CEE414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  *unint64_t v15 = 0;
  (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  _Unwind_Resume(a1);
}

void sub_225CEE470()
{
  MEMORY[0x22A63EB50](v0, 0x10B3C4046E0D9ECLL);
  JUMPOUT(0x225CEE468);
}

void DSPGraph::GraphFactory::createLinearGraphWithBoxes()
{
}

void sub_225CEE5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  *unint64_t v15 = 0;
  (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  _Unwind_Resume(a1);
}

uint64_t DSPGraph::GraphFactory::createFormatMatchedGraphWithGraph(DSPGraph::Graph **a1, void *a2, void *a3)
{
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2[1] - *a2) >> 3) == DSPGraph::Graph::numInputs(*a1)
    && 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a3[1] - *a3) >> 3) == DSPGraph::Graph::numOutputs(*a1))
  {
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/DSPGraph_GraphFactory.cpp");
  std::string::basic_string[abi:ne180100]<0>(&v9, "createFormatMatchedGraphWithGraph");
  unint64_t v5 = (void *)((char *)*a1 + 408);
  if (*((char *)*a1 + 431) < 0) {
    unint64_t v5 = (void *)*v5;
  }
  uint64_t v6 = (*(uint64_t (**)(DSPGraph::Graph *))(*(void *)*a1 + 16))(*a1);
  DSPGraph::strprintf(v11, (DSPGraph *)"%s %s number of graph busses must match the number of external formats.", v7, v5, v6);
  uint64_t result = DSPGraph::ThrowException();
  __break(1u);
  return result;
}

void sub_225CEECA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  if (*(char *)(v35 - 89) < 0) {
    operator delete(*(void **)(v35 - 112));
  }
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CEEF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CEF1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_225CEF568(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CEF764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CEF858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_225CEF8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CEF9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CEFC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char *a25)
{
  MEMORY[0x22A63EB50](v25, 0x10A0C40218B55E4);
  if (__p) {
    operator delete(__p);
  }
  a25 = &a22;
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destroy_vector::operator()[abi:ne180100]((void ***)&a25);
  _Unwind_Resume(a1);
}

uint64_t std::vector<CAStreamBasicDescription>::emplace_back<AudioStreamBasicDescription>(void **a1, AudioStreamBasicDescription *a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= (unint64_t)v6)
  {
    unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v7 - (void)*a1) >> 3);
    if (v9 + 1 > 0x666666666666666) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (unsigned char *)*a1) >> 3);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= v9 + 1) {
      uint64_t v11 = v9 + 1;
    }
    if (v10 >= 0x333333333333333) {
      unint64_t v12 = 0x666666666666666;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      unsigned int v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>(v4, v12);
      uint64_t v15 = v14;
    }
    else
    {
      unsigned int v13 = 0;
      uint64_t v15 = 0;
    }
    CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)&v13[40 * v9], a2);
    uint64_t v8 = v16 + 40;
    unint64_t v18 = (char *)*a1;
    uint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        long long v19 = *(_OWORD *)(v17 - 40);
        long long v20 = *(_OWORD *)(v17 - 24);
        *((void *)v16 - 1) = *((void *)v17 - 1);
        *(_OWORD *)(v16 - 24) = v20;
        *(_OWORD *)(v16 - 40) = v19;
        v16 -= 40;
        v17 -= 40;
      }
      while (v17 != v18);
      uint64_t v17 = (char *)*a1;
    }
    *a1 = v16;
    a1[1] = v8;
    a1[2] = &v13[40 * v15];
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    CAStreamBasicDescription::CAStreamBasicDescription(*(CAStreamBasicDescription **)(v4 - 8), a2);
    uint64_t v8 = (void *)(v7 + 40);
    a1[1] = (void *)(v7 + 40);
  }
  a1[1] = v8;
  return (uint64_t)v8 - 40;
}

void sub_225CEFE78(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_225CEFF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

ASDSRCStreamHelper *std::unique_ptr<ASDSRCStreamHelper>::reset[abi:ne180100](ASDSRCStreamHelper **a1, ASDSRCStreamHelper *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    ASDSRCStreamHelper::~ASDSRCStreamHelper(result);
    JUMPOUT(0x22A63EB50);
  }
  return result;
}

void sub_225CF0104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_225CF040C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__emplace_back_slow_path<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks&>(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 60) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  v14[4] = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>>(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v11 = &v10[16 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v14[3] = &v10[16 * v9];
  *(void *)uint64_t v11 = MEMORY[0x22A63F100](*a2);
  *((void *)v11 + 1) = MEMORY[0x22A63F100](a2[1]);
  void v14[2] = v11 + 16;
  std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__swap_out_circular_buffer(a1, v14);
  uint64_t v12 = a1[1];
  std::__split_buffer<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_225CF07D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>((uint64_t)(a1 + 2), a1[1], (void *)a1[1], *a1, (void *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7;
    do
    {
      long long v9 = *((_OWORD *)a3 - 1);
      a3 -= 2;
      *a3 = 0;
      a3[1] = 0;
      *(_OWORD *)(v8 - 16) = v9;
      v8 -= 16;
      v7 -= 16;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>::operator()[abi:ne180100]((uint64_t *)a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  uint64_t v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>,std::reverse_iterator<std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>,std::reverse_iterator<std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>,std::reverse_iterator<std::reverse_iterator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(id **)(a2 + 32); i != *(id **)(a3 + 32); *(void *)(a2 + 32) = i)
  {

    uint64_t i = (id *)(*(void *)(a2 + 32) + 16);
  }
}

uint64_t std::__split_buffer<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 16;
  }
}

void sub_225CF0B1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CF0C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225CF0D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CF0F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CF10A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CF1218(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225CF1384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CF1518(_Unwind_Exception *a1)
{
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225CF1770(_Unwind_Exception *a1)
{
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_225CF18C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

void sub_225CF1A6C(_Unwind_Exception *a1)
{
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((void *)(v1 - 56));
  _Unwind_Resume(a1);
}

void ASD_CreateDriverInterface(void *a1)
{
  id v1 = a1;
  operator new();
}

void sub_225CF1B60(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v2, 0x10F0C40655B5A55);

  _Unwind_Resume(a1);
}

ASDPluginInterfaceInfo *ASD_DestroyDriverInterface(ASDPluginInterfaceInfo *result)
{
  if (result)
  {
    uint64_t result = (ASDPluginInterfaceInfo *)*((void *)result + 23);
    if (result)
    {
      ASDPluginInterfaceInfo::~ASDPluginInterfaceInfo(result);
      JUMPOUT(0x22A63EB50);
    }
  }
  return result;
}

void ASD_SetRealtimeOperationTableSize(uint64_t a1, unsigned int a2)
{
  if (!*(void *)a1 || (uint64_t v2 = *(ASDPluginInterfaceInfo **)(*(void *)a1 + 184)) == 0) {
    ASD_SetRealtimeOperationTableSize_cold_1();
  }
  ASDPluginInterfaceInfo::setRealTimeOperationVectorSize(v2, a2);
}

void ASDPluginInterfaceInfo::setRealTimeOperationVectorSize(ASDPluginInterfaceInfo *this, unsigned int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((void *)this + 4);
      int v6 = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 1024;
      unsigned int v9 = a2;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Setting realtime operation vectors to a capacity of %u elements.", (uint8_t *)&v6, 0x12u);
    }
    if (*((_DWORD *)this + 18) > a2)
    {
      unsigned int v5 = a2;
      do
      {
        ASDPluginInterfaceInfo::removeDeviceRealtimeOperations(this, v5);
        ASDPluginInterfaceInfo::removeStreamRealtimeOperations(this, v5++);
      }
      while (v5 < *((_DWORD *)this + 18));
    }
    std::vector<ASDDeviceRealTimeOperations *>::resize((uint64_t)this + 224, a2);
    *((void *)this + 31) = *((void *)this + 28);
    std::vector<ASDDeviceRealTimeOperations *>::resize((uint64_t)this + 400, a2);
    *((void *)this + 53) = *((void *)this + 50);
    *((_DWORD *)this + 18) = a2;
  }
  else if (*((_DWORD *)this + 18))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ASDPluginInterfaceInfo::setRealTimeOperationVectorSize((uint64_t)this);
    }
    __assert_rtn("setRealTimeOperationVectorSize", "ASDInterface.mm", 235, "0");
  }
}

void ASD_AddAudioDeviceRealTimeOperations(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)a1)
  {
    if (*(void *)(*(void *)a1 + 184)) {
      operator new();
    }
  }
  __assert_rtn("ASD_AddAudioDeviceRealTimeOperations", "ASDInterface.mm", 476, "pluginInfo");
}

void sub_225CF1EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ASDPluginInterfaceInfo::addDeviceRealtimeOperations(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 1024;
    unsigned int v12 = a2;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Adding realtime operations for device with objectID %u", (uint8_t *)&v9, 0x12u);
  }
  unsigned int v7 = *(_DWORD *)(a1 + 72);
  if (!v7) {
    return caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::_addOrReplace(a1 + 80, a2, a3, 0);
  }
  if (v7 <= a2) {
    return 0;
  }
  *(void *)(*(void *)(a1 + 248) + 8 * a2) = a3;
  return 1;
}

void ASD_RemoveAudioDeviceRealTimeOperations(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(void *)a1 || (id v3 = *(ASDPluginInterfaceInfo **)(*(void *)a1 + 184)) == 0) {
    __assert_rtn("ASD_RemoveAudioDeviceRealTimeOperations", "ASDInterface.mm", 499, "pluginInfo");
  }
  if ((ASDPluginInterfaceInfo::removeDeviceRealtimeOperations(v3, [v4 objectID]) & 1) == 0) {
    __assert_rtn("ASD_RemoveAudioDeviceRealTimeOperations", "ASDInterface.mm", 502, "success");
  }
}

void sub_225CF20B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ASDPluginInterfaceInfo::removeDeviceRealtimeOperations(ASDPluginInterfaceInfo *this, unsigned int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 4);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 1024;
    unsigned int v10 = a2;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Removing realtime operations for device with objectID %u", (uint8_t *)&v7, 0x12u);
  }
  uint64_t result = ASDPluginInterfaceInfo::deviceRealtimeOperationsForObject(this, a2);
  if (result)
  {
    uint64_t v6 = (id *)result;
    if (*((_DWORD *)this + 18))
    {
      *(void *)(*((void *)this + 31) + 8 * a2) = 0;
    }
    else
    {
      uint64_t result = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::remove((uint64_t)this + 80, a2);
      if (!result) {
        return result;
      }
    }

    MEMORY[0x22A63EB50](v6, 0x80C40FDC59921);
    return 1;
  }
  return result;
}

void ASD_AddClockDeviceRealTimeOperations(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)a1)
  {
    if (*(void *)(*(void *)a1 + 184)) {
      operator new();
    }
  }
  __assert_rtn("ASD_AddClockDeviceRealTimeOperations", "ASDInterface.mm", 508, "pluginInfo");
}

void sub_225CF2310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASD_RemoveClockDeviceRealTimeOperations(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(void *)a1 || (id v3 = *(ASDPluginInterfaceInfo **)(*(void *)a1 + 184)) == 0) {
    __assert_rtn("ASD_RemoveClockDeviceRealTimeOperations", "ASDInterface.mm", 531, "pluginInfo");
  }
  if ((ASDPluginInterfaceInfo::removeDeviceRealtimeOperations(v3, [v4 objectID]) & 1) == 0) {
    __assert_rtn("ASD_RemoveClockDeviceRealTimeOperations", "ASDInterface.mm", 534, "success");
  }
}

void sub_225CF23DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ASD_AddStreamRealTimeOperations(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)a1)
  {
    if (*(void *)(*(void *)a1 + 184)) {
      operator new();
    }
  }
  __assert_rtn("ASD_AddStreamRealTimeOperations", "ASDInterface.mm", 540, "pluginInfo");
}

void sub_225CF2544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL ASDPluginInterfaceInfo::addStreamRealtimeOperations(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v6;
    __int16 v11 = 1024;
    unsigned int v12 = a2;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Adding realtime operations for stream with objectID %u", (uint8_t *)&v9, 0x12u);
  }
  unsigned int v7 = *(_DWORD *)(a1 + 72);
  if (!v7) {
    return caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::_addOrReplace(a1 + 256, a2, a3, 0);
  }
  if (v7 <= a2) {
    return 0;
  }
  *(void *)(*(void *)(a1 + 424) + 8 * a2) = a3;
  return 1;
}

void ASD_RemoveStreamRealTimeOperations(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!*(void *)a1 || (id v3 = *(ASDPluginInterfaceInfo **)(*(void *)a1 + 184)) == 0) {
    __assert_rtn("ASD_RemoveStreamRealTimeOperations", "ASDInterface.mm", 561, "pluginInfo");
  }
  if ((ASDPluginInterfaceInfo::removeStreamRealtimeOperations(v3, [v4 objectID]) & 1) == 0) {
    __assert_rtn("ASD_RemoveStreamRealTimeOperations", "ASDInterface.mm", 564, "success");
  }
}

void sub_225CF270C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ASDPluginInterfaceInfo::removeStreamRealtimeOperations(ASDPluginInterfaceInfo *this, unsigned int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *((void *)this + 4);
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 1024;
    unsigned int v10 = a2;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%@: Removing realtime operations for stream with objectID %u", (uint8_t *)&v7, 0x12u);
  }
  uint64_t result = ASDPluginInterfaceInfo::streamRealtimeOperationsForObject(this, a2);
  if (result)
  {
    uint64_t v6 = (id *)result;
    if (*((_DWORD *)this + 18))
    {
      *(void *)(*((void *)this + 53) + 8 * a2) = 0;
    }
    else
    {
      uint64_t result = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::remove((uint64_t)this + 256, a2);
      if (!result) {
        return result;
      }
    }

    MEMORY[0x22A63EB50](v6, 0x80C40A1CEA83ALL);
    return 1;
  }
  return result;
}

uint64_t ASD_QueryInterface(void *a1, CFUUIDBytes a2, void **a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!*(void *)a1 || (id v3 = *(id **)(*(void *)a1 + 184)) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "!pluginInterfaceInfo";
      __int16 v22 = 2080;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v24 = 1024;
      int v25 = 631;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
    }
    uint64_t v13 = 560947818;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = &_os_log_internal;
    goto LABEL_15;
  }
  uint64_t v5 = *(void *)&a2.byte8;
  uint64_t v6 = *(void *)&a2.byte0;
  id WeakRetained = objc_loadWeakRetained(v3 + 3);
  if (!WeakRetained)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "!plugin";
      __int16 v22 = 2080;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v24 = 1024;
      int v25 = 634;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
    }
    uint64_t v13 = 560947818;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    *(_WORD *)buf = 0;
    uint64_t v14 = &_os_log_internal;
LABEL_15:
    _os_log_impl(&dword_225CD5000, v14, OS_LOG_TYPE_DEFAULT, "ASD_QueryInterface: ASD driver reference\n", buf, 2u);
LABEL_16:
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = WeakRetained;
  if (a3)
  {
    *(void *)&v27.byte0 = v6;
    *(void *)&v27.byte8 = v5;
    CFUUIDRef v9 = CFUUIDCreateFromUUIDBytes(0, v27);
    if (v9)
    {
      CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB30], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
      if (CFEqual(v9, v10)
        || (CFUUIDRef v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xEEu, 0xA5u, 0x77u, 0x3Du, 0xCCu, 0x43u, 0x49u, 0xF1u, 0x8Eu, 0, 0x8Fu, 0x96u, 0xE7u, 0xD2u, 0x3Bu, 0x17u), CFEqual(v9, v11)))
      {
        [v8 addRef];
        unsigned int v12 = v3 + 6;
      }
      else
      {
        CFUUIDRef v18 = CFUUIDGetConstantUUIDWithBytes(0, 0xD9u, 0x1Fu, 0x5Fu, 0x7Cu, 0x44u, 0x8Bu, 0x45u, 0xE9u, 0x8Cu, 0xDCu, 6u, 0xE6u, 0x69u, 0x78u, 0x95u, 0xAu);
        if (CFEqual(v9, v18))
        {
          [v8 addRef];
          unsigned int v12 = v3 + 7;
        }
        else
        {
          CFUUIDRef v19 = CFUUIDGetConstantUUIDWithBytes(0, 0xECu, 0x92u, 0xB9u, 0x78u, 0x25u, 0xB0u, 0x4Du, 0x59u, 0xA7u, 0xB7u, 0xD1u, 0x45u, 0xCEu, 0x52u, 0x72u, 0x19u);
          if (!CFEqual(v9, v19))
          {
            uint64_t v13 = 2147483652;
            goto LABEL_10;
          }
          [v8 addRef];
          unsigned int v12 = v3 + 8;
        }
      }
      uint64_t v13 = 0;
      *a3 = *v12;
LABEL_10:
      CFRelease(v9);
      goto LABEL_17;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "theRequestedUUID == NULL";
      __int16 v22 = 2080;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v24 = 1024;
      int v25 = 639;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
    }
    uint64_t v13 = 1852797029;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = &_os_log_internal;
      uint64_t v17 = "ASD_QueryInterface: failed to create the CFUUIDRef\n";
      goto LABEL_30;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v21 = "outInterface == NULL";
      __int16 v22 = 2080;
      long long v23 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v24 = 1024;
      int v25 = 635;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
    }
    uint64_t v13 = 1852797029;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = &_os_log_internal;
      uint64_t v17 = "ASD_QueryInterface: no place to store the returned interface\n";
LABEL_30:
      _os_log_impl(&dword_225CD5000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }
  }
LABEL_17:

  return v13;
}

void sub_225CF2D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_AddRef(AudioServerPlugInDriverInterface **a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = getASDPlugin(a1);
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 addRef];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = "!plugin";
      __int16 v7 = 2080;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v9 = 1024;
      int v10 = 683;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v5, 0x1Cu);
    }
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_AddRef: ASD driver reference\n", (uint8_t *)&v5, 2u);
      uint64_t v3 = 0;
    }
  }

  return v3;
}

void sub_225CF2EB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_Release(AudioServerPlugInDriverInterface **a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = getASDPlugin(a1);
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 removeRef];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = "!plugin";
      __int16 v7 = 2080;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v9 = 1024;
      int v10 = 703;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v5, 0x1Cu);
    }
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_Release: ASD driver reference\n", (uint8_t *)&v5, 2u);
      uint64_t v3 = 0;
    }
  }

  return v3;
}

void sub_225CF3008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_Initialize(AudioServerPlugInDriverInterface **a1, const AudioServerPlugInHostInterface *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = getASDPlugin(a1);
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      int v8 = 134217984;
      __int16 v9 = (const char *)a1;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_Initialize driver %p\n", (uint8_t *)&v8, 0xCu);
    }
    [v4 halInitializeWithPluginHost:a2];
    uint64_t v6 = 0;
  }
  else
  {
    if (v5)
    {
      int v8 = 136315650;
      __int16 v9 = "!plugin";
      __int16 v10 = 2080;
      uint64_t v11 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v12 = 1024;
      int v13 = 731;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v8, 0x1Cu);
    }
    uint64_t v6 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_Initialize: ASD driver reference\n", (uint8_t *)&v8, 2u);
    }
  }

  return v6;
}

void sub_225CF31A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_CreateDevice(AudioServerPlugInDriverInterface **a1, const __CFDictionary *a2, const AudioServerPlugInClientInfo *a3, unsigned int *a4)
{
  return 1970171760;
}

uint64_t ASD_DestroyDevice(AudioServerPlugInDriverInterface **a1)
{
  return 1970171760;
}

uint64_t ASD_AddDeviceClient(AudioServerPlugInDriverInterface **a1, uint64_t a2, const AudioServerPlugInClientInfo *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x22A63EEF0]();
  __int16 v7 = getASDPlugin(a1);
  int v8 = v7;
  if (v7)
  {
    __int16 v9 = [v7 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v10 = [v9 addClient:a3];
    }
    else {
      uint64_t v10 = 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      int v13 = "!plugin";
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v16 = 1024;
      int v17 = 794;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_AddDeviceClient: ASD driver reference\n", (uint8_t *)&v12, 2u);
    }
    __int16 v9 = 0;
  }

  return v10;
}

void sub_225CF33A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_RemoveDeviceClient(AudioServerPlugInDriverInterface **a1, uint64_t a2, const AudioServerPlugInClientInfo *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x22A63EEF0]();
  __int16 v7 = getASDPlugin(a1);
  int v8 = v7;
  if (v7)
  {
    __int16 v9 = [v7 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v10 = [v9 removeClient:a3];
    }
    else {
      uint64_t v10 = 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      int v13 = "!plugin";
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v16 = 1024;
      int v17 = 832;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_RemoveDeviceClient: ASD driver reference\n", (uint8_t *)&v12, 2u);
    }
    __int16 v9 = 0;
  }

  return v10;
}

void sub_225CF3594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_PerformDeviceConfigurationChange(AudioServerPlugInDriverInterface **a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v8 = (void *)MEMORY[0x22A63EEF0]();
  __int16 v9 = getASDPlugin(a1);
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      if (a3)
      {
        uint64_t v12 = 1970171760;
      }
      else if (a4)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
        [v11 performConfigurationChange:a4];
        uint64_t v12 = 0;
      }
      else
      {
        uint64_t v12 = 4294967246;
      }
    }
    else
    {
      uint64_t v12 = 560227702;
    }
    int v13 = v11;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "!plugin";
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v19 = 1024;
      int v20 = 877;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
    }
    uint64_t v12 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_PerformDeviceConfigurationChange: ASD driver reference\n", (uint8_t *)&v15, 2u);
    }
    int v13 = 0;
  }

  return v12;
}

void sub_225CF37DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_AbortDeviceConfigurationChange(AudioServerPlugInDriverInterface **a1, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  __int16 v7 = (void *)MEMORY[0x22A63EEF0]();
  int v8 = getASDPlugin(a1);
  __int16 v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v11 = 1970171760;
      if (a4)
      {
        objc_opt_class();
        objc_opt_isKindOfClass();
        uint64_t v12 = v10;
        [v10 abortConfigurationChange:a4];
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v11 = 560227702;
    }
    uint64_t v12 = v10;
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315650;
    int v15 = "!plugin";
    __int16 v16 = 2080;
    __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
    __int16 v18 = 1024;
    int v19 = 936;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v14, 0x1Cu);
  }
  uint64_t v11 = 560947818;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_AbortDeviceConfigurationChange: ASD driver reference\n", (uint8_t *)&v14, 2u);
  }
  uint64_t v12 = 0;
LABEL_13:

  return v11;
}

void sub_225CF3A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_HasProperty(AudioServerPlugInDriverInterface **a1, uint64_t a2, int a3, const AudioObjectPropertyAddress *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  __int16 v7 = (void *)MEMORY[0x22A63EEF0]();
  int v8 = getASDPlugin(a1);
  __int16 v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectForObjectID:a2];
    uint64_t v11 = [v10 hasProperty:a4];
    if (a4)
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      id v13 = objc_claimAutoreleasedReturnValue();
      [v13 UTF8String];
    }
    int v14 = v10;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315650;
      __int16 v17 = "!plugin";
      __int16 v18 = 2080;
      int v19 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v20 = 1024;
      int v21 = 983;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v16, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_HasProperty: ASD driver reference\n", (uint8_t *)&v16, 2u);
    }
    int v14 = 0;
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_225CF3C14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_IsPropertySettable(AudioServerPlugInDriverInterface **a1, uint64_t a2, int a3, const AudioObjectPropertyAddress *a4, unsigned __int8 *a5)
{
  BOOL v5 = 0;
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v6 = 2003329396;
  if (a4)
  {
    int v8 = 0;
    if (a5)
    {
      uint64_t v12 = (void *)MEMORY[0x22A63EEF0]();
      id v13 = getASDPlugin(a1);
      BOOL v5 = v13;
      if (v13)
      {
        int v14 = [v13 objectForObjectID:a2];
        int v8 = v14;
        if (v14)
        {
          if ([v14 hasProperty:a4])
          {
            uint64_t v6 = 0;
            *a5 = [v8 isPropertySettable:a4];
          }
          else
          {
            uint64_t v6 = 2003332927;
          }
        }
        else
        {
          uint64_t v6 = 560947818;
        }
        int v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        id v16 = objc_claimAutoreleasedReturnValue();
        [v16 UTF8String];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315650;
          int v19 = "!plugin";
          __int16 v20 = 2080;
          int v21 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
          __int16 v22 = 1024;
          int v23 = 1016;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v18, 0x1Cu);
        }
        uint64_t v6 = 560947818;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_IsPropertySettable: ASD driver reference\n", (uint8_t *)&v18, 2u);
        }
        int v8 = 0;
      }
    }
  }
  else
  {
    int v8 = 0;
  }

  return v6;
}

void sub_225CF3E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_GetPropertyDataSize(AudioServerPlugInDriverInterface **a1, uint64_t a2, int a3, const AudioObjectPropertyAddress *a4, uint64_t a5, const void *a6, unsigned int *a7)
{
  __int16 v7 = 0;
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v8 = 2003329396;
  if (a4)
  {
    uint64_t v10 = 0;
    if (a7)
    {
      context = (void *)MEMORY[0x22A63EEF0]();
      id v16 = getASDPlugin(a1);
      __int16 v7 = v16;
      if (v16)
      {
        __int16 v17 = [v16 objectForObjectID:a2];
        uint64_t v10 = v17;
        if (v17)
        {
          if ([v17 hasProperty:a4])
          {
            uint64_t v8 = 0;
            *a7 = [v10 dataSizeForProperty:a4 withQualifierSize:a5 andQualifierData:a6];
          }
          else
          {
            uint64_t v8 = 2003332927;
          }
        }
        else
        {
          uint64_t v8 = 560947818;
        }
        int v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        id v19 = objc_claimAutoreleasedReturnValue();
        [v19 UTF8String];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          int v23 = "!plugin";
          __int16 v24 = 2080;
          int v25 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
          __int16 v26 = 1024;
          int v27 = 1061;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
        }
        uint64_t v8 = 560947818;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_GetPropertyDataSize: ASD driver reference\n", buf, 2u);
        }
        uint64_t v10 = 0;
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v8;
}

void sub_225CF40F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_SetPropertyData(AudioServerPlugInDriverInterface **a1, uint64_t a2, uint64_t a3, const AudioObjectPropertyAddress *a4, unsigned int a5, const void *a6, uint64_t a7, const void *a8)
{
  uint64_t v8 = 0;
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v9 = 2003329396;
  if (a4 && a7)
  {
    uint64_t v12 = 0;
    if (a8)
    {
      context = (void *)MEMORY[0x22A63EEF0]();
      int v18 = getASDPlugin(a1);
      uint64_t v8 = v18;
      if (v18)
      {
        id v19 = [v18 objectForObjectID:a2];
        uint64_t v12 = v19;
        if (v19)
        {
          if ([v19 hasProperty:a4])
          {
            if ([v12 minDataSizeForProperty:a4 withQualifierSize:a5 andQualifierData:a6] <= a7)
            {
              if ([v12 setProperty:a4 withQualifierSize:a5 qualifierData:a6 dataSize:a7 andData:a8 forClient:a3])uint64_t v9 = 0; {
              else
              }
                uint64_t v9 = 2003329396;
            }
            else
            {
              uint64_t v9 = 561211770;
            }
          }
          else
          {
            uint64_t v9 = 2003332927;
          }
        }
        else
        {
          uint64_t v9 = 560947818;
        }
        __int16 v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        id v21 = objc_claimAutoreleasedReturnValue();
        [v21 UTF8String];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v26 = "!plugin";
          __int16 v27 = 2080;
          uint64_t v28 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
          __int16 v29 = 1024;
          int v30 = 1162;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", buf, 0x1Cu);
        }
        uint64_t v9 = 560947818;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_SetPropertyData: ASD driver reference\n", buf, 2u);
        }
        uint64_t v12 = 0;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v9;
}

void sub_225CF43A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_StartIO(AudioServerPlugInDriverInterface **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x22A63EEF0]();
  __int16 v7 = getASDPlugin(a1);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v10 = [v9 startIOForClient:a3];
    }
    else {
      uint64_t v10 = 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      id v13 = "!plugin";
      __int16 v14 = 2080;
      int v15 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v16 = 1024;
      int v17 = 1221;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_StartIO: ASD driver reference\n", (uint8_t *)&v12, 2u);
    }
    uint64_t v9 = 0;
  }

  return v10;
}

void sub_225CF4598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_StopIO(AudioServerPlugInDriverInterface **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)MEMORY[0x22A63EEF0]();
  __int16 v7 = getASDPlugin(a1);
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      uint64_t v10 = [v9 stopIOForClient:a3];
    }
    else {
      uint64_t v10 = 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      id v13 = "!plugin";
      __int16 v14 = 2080;
      int v15 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v16 = 1024;
      int v17 = 1255;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_StopIO: ASD driver reference\n", (uint8_t *)&v12, 2u);
    }
    uint64_t v9 = 0;
  }

  return v10;
}

void sub_225CF4784(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_GetZeroTimeStamp(AudioServerPlugInDriverInterface **a1, unsigned int a2, uint64_t a3, double *a4, unint64_t *a5, unint64_t *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t)*a1;
  if (*a1 && *(void *)(v6 + 184))
  {
    uint64_t v11 = ASDPluginInterfaceInfo::deviceRealtimeOperationsForObject(*(ASDPluginInterfaceInfo **)(v6 + 184), a2);
    if (v11)
    {
      uint64_t v12 = **(void **)(v11 + 16);
      if (v12) {
        return (*(uint64_t (**)(uint64_t, double *, unint64_t *, unint64_t *, uint64_t))(v12 + 16))(v12, a4, a5, a6, a3);
      }
      else {
        return 2003329396;
      }
    }
    else
    {
      return 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "!pluginInterfaceInfo";
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v19 = 1024;
      int v20 = 1289;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
    }
    uint64_t v13 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_GetZeroTimeStamp: ASD driver reference\n", (uint8_t *)&v15, 2u);
    }
  }
  return v13;
}

uint64_t ASDPluginInterfaceInfo::deviceRealtimeOperationsForObject(ASDPluginInterfaceInfo *this, unsigned int a2)
{
  unsigned int v3 = *((_DWORD *)this + 18);
  if (v3)
  {
    if (v3 <= a2) {
      return 0;
    }
    else {
      return *(void *)(*((void *)this + 31) + 8 * a2);
    }
  }
  else
  {
    BOOL v5 = (atomic_uint *)((char *)this + 128);
    atomic_fetch_add((atomic_uint *volatile)this + 32, 1u);
    uint64_t result = atomic_load((unint64_t *)this + 15);
    if (result)
    {
      caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::findSlotForKey(result, a2);
      if (v6)
      {
        atomic_fetch_add((atomic_uint *volatile)v6, 1u);
        uint64_t result = *(void *)(v6 + 8);
        atomic_fetch_add((atomic_uint *volatile)this + 32, 0xFFFFFFFF);
        atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF);
        return result;
      }
      uint64_t result = 0;
      BOOL v5 = (atomic_uint *)((char *)this + 128);
    }
    atomic_fetch_add(v5, 0xFFFFFFFF);
  }
  return result;
}

uint64_t ASD_WillDoIOOperation(AudioServerPlugInDriverInterface **a1, unsigned int a2, uint64_t a3, int a4, unsigned __int8 *a5, unsigned __int8 *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t)*a1;
  if (*a1 && *(void *)(v6 + 184))
  {
    uint64_t v11 = (void *)ASDPluginInterfaceInfo::deviceRealtimeOperationsForObject(*(ASDPluginInterfaceInfo **)(v6 + 184), a2);
    if (v11)
    {
      uint64_t v12 = 0;
      *a5 = 0;
      *a6 = 1;
      if (a4 > 1886218615)
      {
        if (a4 > 1919246691)
        {
          if (a4 == 1919513701)
          {
            uint64_t v13 = (void *)v11[10];
            if (!v13) {
              return 0;
            }
            goto LABEL_35;
          }
          if (a4 == 1919246692)
          {
            uint64_t v13 = (void *)v11[3];
            if (!v13) {
              return 0;
            }
            goto LABEL_35;
          }
        }
        else
        {
          if (a4 == 1886218616)
          {
            uint64_t v13 = (void *)v11[8];
            if (!v13) {
              return 0;
            }
            goto LABEL_35;
          }
          if (a4 == 1886352756)
          {
            uint64_t v13 = (void *)v11[6];
            if (!v13) {
              return 0;
            }
            goto LABEL_35;
          }
        }
      }
      else if (a4 > 1835628654)
      {
        if (a4 == 1835628655)
        {
          uint64_t v13 = (void *)v11[7];
          if (!v13) {
            return 0;
          }
          goto LABEL_35;
        }
        if (a4 == 1885957744)
        {
          uint64_t v13 = (void *)v11[5];
          if (!v13) {
            return 0;
          }
          goto LABEL_35;
        }
      }
      else
      {
        if (a4 == 1667853936)
        {
          uint64_t v13 = (void *)v11[4];
          if (!v13) {
            return 0;
          }
          goto LABEL_35;
        }
        if (a4 == 1668114808)
        {
          uint64_t v13 = (void *)v11[9];
          if (!v13) {
            return 0;
          }
LABEL_35:
          if (*v13) {
            return (*(uint64_t (**)(void, uint64_t, unsigned __int8 *, unsigned __int8 *))(*v13 + 16))(*v13, a3, a5, a6);
          }
          return 0;
        }
      }
    }
    else
    {
      return 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "!pluginInterfaceInfo";
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v19 = 1024;
      int v20 = 1326;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
    }
    uint64_t v12 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_WillDoIOOperation: ASD driver reference\n", (uint8_t *)&v15, 2u);
    }
  }
  return v12;
}

uint64_t ASD_BeginIOOperation(AudioServerPlugInDriverInterface **a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, const AudioServerPlugInIOCycleInfo *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t)*a1;
  if (*a1 && *(void *)(v6 + 184))
  {
    uint64_t v11 = ASDPluginInterfaceInfo::deviceRealtimeOperationsForObject(*(ASDPluginInterfaceInfo **)(v6 + 184), a2);
    if (v11)
    {
      uint64_t v12 = **(void **)(v11 + 88);
      if (v12) {
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, const AudioServerPlugInIOCycleInfo *, uint64_t))(v12 + 16))(v12, a4, a5, a6, a3);
      }
      else {
        return 0;
      }
    }
    else
    {
      return 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "!pluginInterfaceInfo";
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v19 = 1024;
      int v20 = 1427;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
    }
    uint64_t v13 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_BeginIOOperation: ASD driver reference\n", (uint8_t *)&v15, 2u);
    }
  }
  return v13;
}

uint64_t ASD_DoIOOperation(AudioServerPlugInDriverInterface **a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, unsigned int a6, const AudioServerPlugInIOCycleInfo *a7, void *a8, void *a9)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v9 = (uint64_t)*a1;
  if (!*a1 || !*(void *)(v9 + 184))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315650;
      uint64_t v18 = "!pluginInterfaceInfo";
      __int16 v19 = 2080;
      int v20 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v21 = 1024;
      int v22 = 1465;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v17, 0x1Cu);
    }
    uint64_t v12 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_DoIOOperation: ASD driver reference\n", (uint8_t *)&v17, 2u);
    }
    return v12;
  }
  uint64_t v11 = ASDPluginInterfaceInfo::streamRealtimeOperationsForObject(*(ASDPluginInterfaceInfo **)(v9 + 184), a3);
  if (!v11) {
    return 561214578;
  }
  uint64_t v12 = 1852797029;
  if (a5 > 1886218615)
  {
    if (a5 > 1919246691)
    {
      if (a5 == 1919513701)
      {
        uint64_t v13 = (uint64_t **)(v11 + 64);
      }
      else
      {
        if (a5 != 1919246692) {
          return v12;
        }
        uint64_t v13 = (uint64_t **)(v11 + 8);
      }
    }
    else if (a5 == 1886218616)
    {
      uint64_t v13 = (uint64_t **)(v11 + 48);
    }
    else
    {
      if (a5 != 1886352756) {
        return v12;
      }
      uint64_t v13 = (uint64_t **)(v11 + 32);
    }
  }
  else if (a5 > 1835628654)
  {
    if (a5 == 1835628655)
    {
      uint64_t v13 = (uint64_t **)(v11 + 40);
    }
    else
    {
      if (a5 != 1885957744) {
        return v12;
      }
      uint64_t v13 = (uint64_t **)(v11 + 24);
    }
  }
  else
  {
    if (a5 != 1667853936)
    {
      if (a5 == 1668114808)
      {
        uint64_t v13 = (uint64_t **)(v11 + 56);
        goto LABEL_28;
      }
      return v12;
    }
    uint64_t v13 = (uint64_t **)(v11 + 16);
  }
LABEL_28:
  uint64_t v14 = **v13;
  if (!v14) {
    return v12;
  }
  int v15 = *(uint64_t (**)(void))(v14 + 16);
  return v15();
}

uint64_t ASDPluginInterfaceInfo::streamRealtimeOperationsForObject(ASDPluginInterfaceInfo *this, unsigned int a2)
{
  unsigned int v3 = *((_DWORD *)this + 18);
  if (v3)
  {
    if (v3 <= a2) {
      return 0;
    }
    else {
      return *(void *)(*((void *)this + 53) + 8 * a2);
    }
  }
  else
  {
    BOOL v5 = (atomic_uint *)((char *)this + 304);
    atomic_fetch_add((atomic_uint *volatile)this + 76, 1u);
    uint64_t result = atomic_load((unint64_t *)this + 37);
    if (result)
    {
      caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::findSlotForKey(result, a2);
      if (v6)
      {
        atomic_fetch_add((atomic_uint *volatile)v6, 1u);
        uint64_t result = *(void *)(v6 + 8);
        atomic_fetch_add((atomic_uint *volatile)this + 76, 0xFFFFFFFF);
        atomic_fetch_add((atomic_uint *volatile)v6, 0xFFFFFFFF);
        return result;
      }
      uint64_t result = 0;
      BOOL v5 = (atomic_uint *)((char *)this + 304);
    }
    atomic_fetch_add(v5, 0xFFFFFFFF);
  }
  return result;
}

uint64_t ASD_EndIOOperation(AudioServerPlugInDriverInterface **a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, const AudioServerPlugInIOCycleInfo *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v6 = (uint64_t)*a1;
  if (*a1 && *(void *)(v6 + 184))
  {
    uint64_t v11 = ASDPluginInterfaceInfo::deviceRealtimeOperationsForObject(*(ASDPluginInterfaceInfo **)(v6 + 184), a2);
    if (v11)
    {
      uint64_t v12 = **(void **)(v11 + 96);
      if (v12) {
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, const AudioServerPlugInIOCycleInfo *, uint64_t))(v12 + 16))(v12, a4, a5, a6, a3);
      }
      else {
        return 0;
      }
    }
    else
    {
      return 560227702;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "!pluginInterfaceInfo";
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v19 = 1024;
      int v20 = 1537;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
    }
    uint64_t v13 = 560947818;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_EndIOOperation: ASD driver reference\n", (uint8_t *)&v15, 2u);
    }
  }
  return v13;
}

uint64_t ASD_IsolatedAddRef(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)a1 && (uint64_t v1 = *(void *)(*(void *)a1 + 56)) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    uint64_t v3 = [WeakRetained addRef];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = "!pluginInterfaceInfo";
      __int16 v7 = 2080;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v9 = 1024;
      int v10 = 1576;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v5, 0x1Cu);
    }
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_IsolatedAddRef: ASD driver reference\n", (uint8_t *)&v5, 2u);
      return 0;
    }
  }
  return v3;
}

void sub_225CF5530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_IsolatedRelease(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)a1 && (uint64_t v1 = *(void *)(*(void *)a1 + 56)) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    uint64_t v3 = [WeakRetained removeRef];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = "!pluginInterfaceInfo";
      __int16 v7 = 2080;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v9 = 1024;
      int v10 = 1593;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v5, 0x1Cu);
    }
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_IsolatedRelease: ASD driver reference\n", (uint8_t *)&v5, 2u);
      return 0;
    }
  }
  return v3;
}

void sub_225CF5680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_SetupForIsolatedIO(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  __int16 v9 = getASDPlugin(a1);
  if (v9)
  {
    int v10 = (void *)MEMORY[0x22A63EEF0]();
    uint64_t v11 = [v9 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v12 = [v9 objectForObjectID:a3];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = [v11 setupIsolatedIOForStream:v12 frameSize:a4 useCase:a5];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315650;
          __int16 v16 = "![stream isKindOfClass:[ASDStream class]]";
          __int16 v17 = 2080;
          uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
          __int16 v19 = 1024;
          int v20 = 1624;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
        }
        uint64_t v13 = 560947818;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_SetupForIsolatedIO: Bad stream object ID\n", (uint8_t *)&v15, 2u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315650;
        __int16 v16 = "![device isKindOfClass:[ASDAudioDevice class]]";
        __int16 v17 = 2080;
        uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
        __int16 v19 = 1024;
        int v20 = 1619;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
      }
      uint64_t v13 = 560947818;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_SetupForIsolatedIO: Bad device object ID\n", (uint8_t *)&v15, 2u);
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      __int16 v16 = "!plugin";
      __int16 v17 = 2080;
      uint64_t v18 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v19 = 1024;
      int v20 = 1610;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v15, 0x1Cu);
    }
    uint64_t v13 = 2003329396;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_SetupForIsolatedIO: ASD driver reference\n", (uint8_t *)&v15, 2u);
    }
  }

  return v13;
}

void sub_225CF5A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id getASDPlugin(uint64_t a1)
{
  if (*(void *)a1 && (uint64_t v1 = *(void *)(*(void *)a1 + 56)) != 0) {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

uint64_t ASD_TeardownForIsolatedIO(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  __int16 v7 = getASDPlugin(a1);
  if (v7)
  {
    uint64_t v8 = (void *)MEMORY[0x22A63EEF0]();
    __int16 v9 = [v7 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v10 = [v7 objectForObjectID:a3];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v9 teardownIsolatedIOForStream:v10 useCase:a4];
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = 136315650;
          uint64_t v14 = "![stream isKindOfClass:[ASDStream class]]";
          __int16 v15 = 2080;
          __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
          __int16 v17 = 1024;
          int v18 = 1657;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v13, 0x1Cu);
        }
        uint64_t v11 = 560947818;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_TeardownForIsolatedIO: Bad stream object ID\n", (uint8_t *)&v13, 2u);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315650;
        uint64_t v14 = "![device isKindOfClass:[ASDAudioDevice class]]";
        __int16 v15 = 2080;
        __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
        __int16 v17 = 1024;
        int v18 = 1652;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithAction \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v13, 0x1Cu);
      }
      uint64_t v11 = 560947818;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_TeardownForIsolatedIO: Bad device object ID\n", (uint8_t *)&v13, 2u);
      }
      int v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      uint64_t v14 = "!plugin";
      __int16 v15 = 2080;
      __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v17 = 1024;
      int v18 = 1643;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v13, 0x1Cu);
    }
    uint64_t v11 = 2003329396;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_SetupForIsolatedIO: ASD driver reference\n", (uint8_t *)&v13, 2u);
    }
  }

  return v11;
}

void sub_225CF5E44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_DoIsolatedIOOperation(uint64_t *a1, int a2, unsigned int a3, uint64_t a4, int a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  if (!*a1 || !*(void *)(v5 + 56))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315650;
      int v13 = "!pluginInterfaceInfo";
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v16 = 1024;
      int v17 = 1677;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v8 = 1852797029;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_DoIsolatedIOOperation: ASD driver reference\n", (uint8_t *)&v12, 2u);
    }
    return v8;
  }
  uint64_t v7 = ASDPluginInterfaceInfo::streamRealtimeOperationsForObject(*(ASDPluginInterfaceInfo **)(v5 + 56), a3);
  if (!v7) {
    return 561214578;
  }
  uint64_t v8 = 1852797029;
  if (a5 != 1919246692) {
    return v8;
  }
  uint64_t v9 = **(void **)(v7 + 72);
  if (!v9) {
    return v8;
  }
  int v10 = *(uint64_t (**)(void))(v9 + 16);
  return v10();
}

uint64_t ASD_IOThreadStateChangeAddRef(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)a1 && (uint64_t v1 = *(void *)(*(void *)a1 + 40)) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    uint64_t v3 = [WeakRetained addRef];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = "!pluginInterfaceInfo";
      __int16 v7 = 2080;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v9 = 1024;
      int v10 = 1722;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v5, 0x1Cu);
    }
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_IOThreadStateChangeAddRef: ASD driver reference\n", (uint8_t *)&v5, 2u);
      return 0;
    }
  }
  return v3;
}

void sub_225CF61A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ASD_IOThreadStateChangeRelease(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (*(void *)a1 && (uint64_t v1 = *(void *)(*(void *)a1 + 40)) != 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 24));
    uint64_t v3 = [WeakRetained removeRef];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = "!pluginInterfaceInfo";
      __int16 v7 = 2080;
      uint64_t v8 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v9 = 1024;
      int v10 = 1739;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v5, 0x1Cu);
    }
    uint64_t v3 = 0;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_IOThreadStateChangeRelease: ASD driver reference\n", (uint8_t *)&v5, 2u);
      return 0;
    }
  }
  return v3;
}

void sub_225CF62F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASD_IOThreadStateChange(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(void *)a1
    && (uint64_t v3 = *(void *)(*(void *)a1 + 40)) != 0
    && (id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24))) != 0)
  {
    __int16 v7 = WeakRetained;
    uint64_t v8 = (void *)MEMORY[0x22A63EEF0]();
    __int16 v9 = [v7 objectForObjectID:a2];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      [v9 ioThreadStateChange:a3];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = "true";
        __int16 v12 = 2080;
        int v13 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
        __int16 v14 = 1024;
        int v15 = 1764;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v10, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_IOThreadStateChange: Bad device object ID\n", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = "!plugin";
      __int16 v12 = 2080;
      int v13 = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/ASDInterface.mm";
      __int16 v14 = 1024;
      int v15 = 1752;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIf \"%s\" failed in %s at line %d goto Done. ", (uint8_t *)&v10, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ASD_SetupForIsolatedIO: ASD driver reference\n", (uint8_t *)&v10, 2u);
    }
    __int16 v7 = 0;
  }
}

void sub_225CF657C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ASDPluginInterfaceInfo::ASDPluginInterfaceInfo(ASDPluginInterfaceInfo *this, ASDPlugin *a2)
{
  uint64_t v2 = a2;
  operator new();
}

void sub_225CF67E4(_Unwind_Exception *a1)
{
  uint64_t v8 = (void *)v2[50];
  if (v8)
  {
    v2[51] = v8;
    operator delete(v8);
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::~guarded_lookup_hash_table(v5);
  __int16 v9 = (void *)v2[28];
  if (v9)
  {
    v2[29] = v9;
    operator delete(v9);
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::~guarded_lookup_hash_table(v4);

  objc_destroyWeak(v3);
  _Unwind_Resume(a1);
}

void *ASDDriverInterface::ASDDriverInterface(void *result, uint64_t a2)
{
  ASDSRCStreamHelper *result = 0;
  result[1] = ASD_QueryInterface;
  result[2] = ASD_AddRef;
  result[3] = ASD_Release;
  result[4] = ASD_Initialize;
  result[5] = ASD_CreateDevice;
  result[6] = ASD_DestroyDevice;
  result[7] = ASD_AddDeviceClient;
  result[8] = ASD_RemoveDeviceClient;
  result[9] = ASD_PerformDeviceConfigurationChange;
  result[10] = ASD_AbortDeviceConfigurationChange;
  result[11] = ASD_HasProperty;
  result[12] = ASD_IsPropertySettable;
  result[13] = ASD_GetPropertyDataSize;
  result[14] = ASD_GetPropertyData;
  result[15] = ASD_SetPropertyData;
  result[16] = ASD_StartIO;
  result[17] = ASD_StopIO;
  result[18] = ASD_GetZeroTimeStamp;
  result[19] = ASD_WillDoIOOperation;
  result[20] = ASD_BeginIOOperation;
  result[21] = ASD_DoIOOperation;
  result[22] = ASD_EndIOOperation;
  result[23] = a2;
  return result;
}

void std::__function::__func<std::hash<unsigned int>,std::allocator<std::hash<unsigned int>>,unsigned int ()(unsigned int)>::~__func()
{
}

void *std::__function::__func<std::hash<unsigned int>,std::allocator<std::hash<unsigned int>>,unsigned int ()(unsigned int)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  void *result = &unk_26D96F778;
  return result;
}

void std::__function::__func<std::hash<unsigned int>,std::allocator<std::hash<unsigned int>>,unsigned int ()(unsigned int)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26D96F778;
}

uint64_t std::__function::__func<std::hash<unsigned int>,std::allocator<std::hash<unsigned int>>,unsigned int ()(unsigned int)>::operator()(uint64_t a1, unsigned int *a2)
{
  return *a2;
}

void *caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  if (atomic_load((unsigned int *)(a1 + 48)))
  {
    _os_assert_log();
    uint64_t v6 = _os_crash();
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::~guarded_lookup_hash_table(v6);
  }
  uint64_t v3 = atomic_load((unint64_t *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::~table_impl(v3);
    MEMORY[0x22A63EB50](v4, 0x1060C402CF69088);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 80));
  __int16 v7 = (void **)(a1 + 56);
  std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return std::__function::__value_func<unsigned int ()>::~__value_func[abi:ne180100]((void *)a1);
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2) {
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::element_t::release(*v3);
      }
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

unsigned int *caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::element_t::release(unsigned int *result)
{
  if ((atomic_fetch_add((atomic_uint *volatile)result, 0xFFFF0000) & 0xFFFF0000) == 0x10000)
  {
    if (!atomic_load(result))
    {
      JUMPOUT(0x22A63EB50);
    }
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::element_t::release();
  }
  return result;
}

void std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t *)**a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::~table_impl(result);
    JUMPOUT(0x22A63EB50);
  }
  return result;
}

void *std::__function::__value_func<unsigned int ()(unsigned int)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::~guarded_lookup_hash_table(uint64_t a1)
{
  if (atomic_load((unsigned int *)(a1 + 48)))
  {
    _os_assert_log();
    uint64_t v6 = _os_crash();
    caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::~guarded_lookup_hash_table(v6);
  }
  uint64_t v3 = atomic_load((unint64_t *)(a1 + 40));
  if (v3)
  {
    uint64_t v4 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::~table_impl(v3);
    MEMORY[0x22A63EB50](v4, 0x1060C402CF69088);
  }
  std::mutex::~mutex((std::mutex *)(a1 + 80));
  __int16 v7 = (void **)(a1 + 56);
  std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return std::__function::__value_func<unsigned int ()>::~__value_func[abi:ne180100]((void *)a1);
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl::~table_impl(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2)
  {
    uint64_t v3 = (unsigned int **)(a1 + 16);
    do
    {
      if ((unint64_t)*v3 + 1 >= 2) {
        caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::element_t::release(*v3);
      }
      ++v3;
      --v2;
    }
    while (v2);
  }
  return a1;
}

void std::vector<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t *)**a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::~table_impl(result);
    JUMPOUT(0x22A63EB50);
  }
  return result;
}

void ASDPluginInterfaceInfo::~ASDPluginInterfaceInfo(ASDPluginInterfaceInfo *this)
{
  uint64_t v2 = *(void *)this;
  if (v2) {
    MEMORY[0x22A63EB50](v2, 0xA0C40F73F3A8ELL);
  }
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    MEMORY[0x22A63EB50](v3, 0xA0C4086DBBAE0);
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4) {
    MEMORY[0x22A63EB50](v4, 0xA0C40CE99C112);
  }
  uint64_t v5 = (void *)*((void *)this + 50);
  if (v5)
  {
    *((void *)this + 51) = v5;
    operator delete(v5);
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::~guarded_lookup_hash_table((uint64_t)this + 256);
  uint64_t v6 = (void *)*((void *)this + 28);
  if (v6)
  {
    *((void *)this + 29) = v6;
    operator delete(v6);
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::~guarded_lookup_hash_table((uint64_t)this + 80);

  objc_destroyWeak((id *)this + 3);
}

void std::vector<ASDDeviceRealTimeOperations *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<ASDDeviceRealTimeOperations *>::__append((void **)a1, a2 - v2);
  }
}

void std::vector<ASDDeviceRealTimeOperations *>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  __int16 v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      int v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>(v4, v12);
    }
    else {
      int v13 = 0;
    }
    __int16 v14 = &v13[8 * v10];
    int v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    uint64_t v16 = &v14[8 * a2];
    uint64_t v18 = (char *)*a1;
    int v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      int v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

BOOL caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::_addOrReplace(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  unint64_t v9 = (_DWORD *)atomic_load((unint64_t *)(a1 + 40));
  int v10 = *(_DWORD *)(a1 + 32) + 1;
  *(_DWORD *)(a1 + 32) = v10;
  if (v9)
  {
    unsigned int v11 = 16 * v10;
    unsigned int v12 = v9[2];
    if (v11 / v12 < 0xB) {
      goto LABEL_6;
    }
    unsigned int v13 = 2 * v12;
  }
  else
  {
    unsigned int v13 = 8;
  }
  unint64_t v9 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v13);
LABEL_6:
  BOOL v14 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::addOrReplace((uint64_t)v9, a2, a3, a4);
  if (v14) {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::emptyReleasePool(a1);
  }
  else {
    --*(_DWORD *)(a1 + 32);
  }
  std::mutex::unlock(v8);
  return v14;
}

void sub_225CF714C(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

_DWORD *caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::rehash(unint64_t *a1, unsigned int a2)
{
  uint64_t v4 = a1 + 5;
  unint64_t v5 = atomic_load(a1 + 5);
  uint64_t v6 = operator new(8 * (a2 - 1) + 24);
  *(void *)uint64_t v6 = a1;
  v6[2] = a2;
  bzero(v6 + 4, 8 * a2);
  if (v5)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::copyAllElementsTo(v5, (uint64_t)v6);
    atomic_store((unint64_t)v6, v4);
    unint64_t v7 = a1[9];
    uint64_t v8 = (unint64_t *)a1[8];
    if ((unint64_t)v8 >= v7)
    {
      int v10 = (void *)a1[7];
      uint64_t v11 = v8 - v10;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v12 = v7 - (void)v10;
      unint64_t v13 = (uint64_t)(v7 - (void)v10) >> 2;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      int v25 = a1 + 9;
      if (v14)
      {
        int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>((uint64_t)(a1 + 9), v14);
        int v10 = (void *)a1[7];
        uint64_t v8 = (unint64_t *)a1[8];
      }
      else
      {
        int v15 = 0;
      }
      uint64_t v16 = (unint64_t *)&v15[8 * v11];
      int v17 = &v15[8 * v14];
      __int16 v24 = v17;
      *uint64_t v16 = v5;
      *((void *)&v23 + 1) = v16 + 1;
      if (v8 == v10)
      {
        unint64_t v9 = v16 + 1;
      }
      else
      {
        do
        {
          unint64_t v18 = *--v8;
          unint64_t *v8 = 0;
          *--uint64_t v16 = v18;
        }
        while (v8 != v10);
        unint64_t v9 = (void *)*((void *)&v23 + 1);
        int v17 = v24;
      }
      long long v19 = *(_OWORD *)(a1 + 7);
      a1[7] = (unint64_t)v16;
      a1[8] = (unint64_t)v9;
      long long v23 = v19;
      unint64_t v20 = a1[9];
      a1[9] = (unint64_t)v17;
      __int16 v24 = (char *)v20;
      uint64_t v22 = v19;
      std::__split_buffer<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>>::~__split_buffer((uint64_t)&v22);
    }
    else
    {
      unint64_t *v8 = v5;
      unint64_t v9 = v8 + 1;
    }
    a1[8] = (unint64_t)v9;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

BOOL caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl::addOrReplace(uint64_t a1, int a2, uint64_t a3, int a4)
{
  char SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::findSlotForKey(a1, a2);
  if ((SlotForKey & 1) == 0) {
    operator new();
  }
  if (a4) {
    *(void *)(v7 + 8) = a3;
  }
  return (SlotForKey & 1) == 0;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::emptyReleasePool(uint64_t result)
{
  int v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    uint64_t v2 = result;
    uint64_t v4 = *(uint64_t **)(result + 56);
    for (uint64_t i = *(uint64_t **)(result + 64);
          i != v4;
          uint64_t result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](i, 0))
    {
      --i;
    }
    *(void *)(v2 + 64) = v4;
  }
  return result;
}

unint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl::copyAllElementsTo(unint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(result + 8);
  if (v2)
  {
    uint64_t v4 = (atomic_uint **)(result + 16);
    do
    {
      unint64_t v5 = *v4;
      if ((unint64_t)*v4 + 1 >= 2)
      {
        uint64_t result = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::findSlotForKey(a2, v5[1]);
        if ((result & 1) == 0)
        {
          atomic_fetch_add(v5, 0x10000u);
          atomic_store((unint64_t)v5, (unint64_t *)(a2 + 8 * HIDWORD(result) + 16));
        }
      }
      ++v4;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl::findSlotForKey(uint64_t a1, int a2)
{
  int v4 = *(_DWORD *)(a1 + 8);
  uint64_t result = std::function<unsigned int ()>::operator()(*(void *)a1, a2);
  signed int v6 = result % *(_DWORD *)(a1 + 8);
  if (v6 >= 3) {
    int v7 = 0;
  }
  else {
    int v7 = v4;
  }
  uint64_t v8 = (v6 + v7 - 3);
  uint64_t v9 = 0xFFFFFFFFLL;
  uint64_t v10 = 1;
  uint64_t v11 = result % *(_DWORD *)(a1 + 8);
  do
  {
    uint64_t v12 = v8;
    unint64_t v13 = atomic_load((unint64_t *)(a1 + 8 * v11 + 16));
    if (v13 == -1)
    {
      if ((int)v9 >= 0) {
        uint64_t v9 = v9;
      }
      else {
        uint64_t v9 = v11;
      }
    }
    else
    {
      if (!v13)
      {
        uint64_t v10 = 0;
        if ((int)v9 >= 0) {
          uint64_t v11 = v9;
        }
        else {
          uint64_t v11 = v11;
        }
        return v10 | (v11 << 32);
      }
      if (*(_DWORD *)(v13 + 4) == a2) {
        return v10 | (v11 << 32);
      }
    }
    if ((int)v8 >= 3) {
      int v14 = 0;
    }
    else {
      int v14 = v4;
    }
    uint64_t v8 = (v8 + v14 - 3);
    uint64_t v11 = v12;
  }
  while (v12 != v6);
  if ((v9 & 0x80000000) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v9;
    return v10 | (v11 << 32);
  }
  __break(1u);
  return result;
}

uint64_t std::function<unsigned int ()(unsigned int)>::operator()(uint64_t a1, int a2)
{
  int v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t std::__split_buffer<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100]((uint64_t *)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::remove(uint64_t a1, int a2)
{
  v18.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 80);
  v18.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 80));
  uint64_t v4 = atomic_load((unint64_t *)(a1 + 40));
  if (v4
    && (unint64_t SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::findSlotForKey(v4, a2), (SlotForKey & 1) != 0))
  {
    uint64_t v7 = v6;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v4 + 8 * HIDWORD(SlotForKey) + 16));
    if (v6)
    {
      int v8 = atomic_load((unsigned int *)(a1 + 48));
      if (v8 >= 1)
      {
        do
        {
          __ns.__rep_ = 50000;
          std::this_thread::sleep_for (&__ns);
          int v9 = atomic_load((unsigned int *)(a1 + 48));
        }
        while (v9 > 0);
      }
      if ((unsigned __int16)atomic_load((unsigned int *)v7))
      {
        std::unique_lock<std::mutex>::unlock(&v18);
        while ((unsigned __int16)atomic_load((unsigned int *)v7))
        {
          __ns.__rep_ = 500000;
          std::this_thread::sleep_for (&__ns);
        }
        std::unique_lock<std::mutex>::lock(&v18);
        uint64_t v4 = atomic_load((unint64_t *)(a1 + 40));
      }
      caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::element_t::release((unsigned int *)v7);
      int v13 = *(_DWORD *)(a1 + 32) - 1;
      *(_DWORD *)(a1 + 32) = v13;
      if (v4)
      {
        unsigned int v14 = 16 * v13;
        unsigned int v15 = *(_DWORD *)(v4 + 8);
        if (v14 / v15 <= 2 && v15 >= 9) {
          caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v15 >> 1);
        }
      }
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::emptyReleasePool(a1);
  if (v18.__owns_) {
    std::mutex::unlock(v18.__m_);
  }
  return v7;
}

void sub_225CF773C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11)
{
  if (a11) {
    std::mutex::unlock(a10);
  }
  _Unwind_Resume(exception_object);
}

BOOL caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::_addOrReplace(uint64_t a1, int a2, uint64_t a3, int a4)
{
  int v8 = (std::mutex *)(a1 + 80);
  std::mutex::lock((std::mutex *)(a1 + 80));
  int v9 = (_DWORD *)atomic_load((unint64_t *)(a1 + 40));
  int v10 = *(_DWORD *)(a1 + 32) + 1;
  *(_DWORD *)(a1 + 32) = v10;
  if (v9)
  {
    unsigned int v11 = 16 * v10;
    unsigned int v12 = v9[2];
    if (v11 / v12 < 0xB) {
      goto LABEL_6;
    }
    unsigned int v13 = 2 * v12;
  }
  else
  {
    unsigned int v13 = 8;
  }
  int v9 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v13);
LABEL_6:
  BOOL v14 = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::addOrReplace((uint64_t)v9, a2, a3, a4);
  if (v14) {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::emptyReleasePool(a1);
  }
  else {
    --*(_DWORD *)(a1 + 32);
  }
  std::mutex::unlock(v8);
  return v14;
}

void sub_225CF7824(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

_DWORD *caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::rehash(unint64_t *a1, unsigned int a2)
{
  uint64_t v4 = a1 + 5;
  unint64_t v5 = atomic_load(a1 + 5);
  uint64_t v6 = operator new(8 * (a2 - 1) + 24);
  *(void *)uint64_t v6 = a1;
  v6[2] = a2;
  bzero(v6 + 4, 8 * a2);
  if (v5)
  {
    caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::copyAllElementsTo(v5, (uint64_t)v6);
    atomic_store((unint64_t)v6, v4);
    unint64_t v7 = a1[9];
    int v8 = (unint64_t *)a1[8];
    if ((unint64_t)v8 >= v7)
    {
      int v10 = (void *)a1[7];
      uint64_t v11 = v8 - v10;
      if ((unint64_t)(v11 + 1) >> 61) {
        std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v12 = v7 - (void)v10;
      unint64_t v13 = (uint64_t)(v7 - (void)v10) >> 2;
      if (v13 <= v11 + 1) {
        unint64_t v13 = v11 + 1;
      }
      if (v12 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v14 = v13;
      }
      int v25 = a1 + 9;
      if (v14)
      {
        unsigned int v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>((uint64_t)(a1 + 9), v14);
        int v10 = (void *)a1[7];
        int v8 = (unint64_t *)a1[8];
      }
      else
      {
        unsigned int v15 = 0;
      }
      uint64_t v16 = (unint64_t *)&v15[8 * v11];
      int v17 = &v15[8 * v14];
      __int16 v24 = v17;
      *uint64_t v16 = v5;
      *((void *)&v23 + 1) = v16 + 1;
      if (v8 == v10)
      {
        int v9 = v16 + 1;
      }
      else
      {
        do
        {
          unint64_t v18 = *--v8;
          unint64_t *v8 = 0;
          *--uint64_t v16 = v18;
        }
        while (v8 != v10);
        int v9 = (void *)*((void *)&v23 + 1);
        int v17 = v24;
      }
      long long v19 = *(_OWORD *)(a1 + 7);
      a1[7] = (unint64_t)v16;
      a1[8] = (unint64_t)v9;
      long long v23 = v19;
      unint64_t v20 = a1[9];
      a1[9] = (unint64_t)v17;
      __int16 v24 = (char *)v20;
      uint64_t v22 = v19;
      std::__split_buffer<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>>::~__split_buffer((uint64_t)&v22);
    }
    else
    {
      unint64_t *v8 = v5;
      int v9 = v8 + 1;
    }
    a1[8] = (unint64_t)v9;
  }
  else
  {
    atomic_store((unint64_t)v6, v4);
  }
  return v6;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::emptyReleasePool(uint64_t result)
{
  int v1 = atomic_load((unsigned int *)(result + 48));
  if (v1 <= 0)
  {
    uint64_t v2 = result;
    uint64_t v4 = *(uint64_t **)(result + 56);
    for (uint64_t i = *(uint64_t **)(result + 64);
          i != v4;
          uint64_t result = std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100](i, 0))
    {
      --i;
    }
    *(void *)(v2 + 64) = v4;
  }
  return result;
}

uint64_t std::__split_buffer<std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::table_impl>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl,std::default_delete<caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl>>::reset[abi:ne180100]((uint64_t *)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned int)>>::remove(uint64_t a1, int a2)
{
  v18.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(a1 + 80);
  v18.__owns_ = 1;
  std::mutex::lock((std::mutex *)(a1 + 80));
  uint64_t v4 = atomic_load((unint64_t *)(a1 + 40));
  if (v4
    && (unint64_t SlotForKey = caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDDeviceRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::table_impl::findSlotForKey(v4, a2), (SlotForKey & 1) != 0))
  {
    uint64_t v7 = v6;
    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)(v4 + 8 * HIDWORD(SlotForKey) + 16));
    if (v6)
    {
      int v8 = atomic_load((unsigned int *)(a1 + 48));
      if (v8 >= 1)
      {
        do
        {
          __ns.__rep_ = 50000;
          std::this_thread::sleep_for (&__ns);
          int v9 = atomic_load((unsigned int *)(a1 + 48));
        }
        while (v9 > 0);
      }
      if ((unsigned __int16)atomic_load((unsigned int *)v7))
      {
        std::unique_lock<std::mutex>::unlock(&v18);
        while ((unsigned __int16)atomic_load((unsigned int *)v7))
        {
          __ns.__rep_ = 500000;
          std::this_thread::sleep_for (&__ns);
        }
        std::unique_lock<std::mutex>::lock(&v18);
        uint64_t v4 = atomic_load((unint64_t *)(a1 + 40));
      }
      caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::element_t::release((unsigned int *)v7);
      int v13 = *(_DWORD *)(a1 + 32) - 1;
      *(_DWORD *)(a1 + 32) = v13;
      if (v4)
      {
        unsigned int v14 = 16 * v13;
        unsigned int v15 = *(_DWORD *)(v4 + 8);
        if (v14 / v15 <= 2 && v15 >= 9) {
          caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::rehash((unint64_t *)a1, v15 >> 1);
        }
      }
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned int,ASDStreamRealTimeOperations *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()>>::emptyReleasePool(a1);
  if (v18.__owns_) {
    std::mutex::unlock(v18.__m_);
  }
  return v7;
}

void sub_225CF7BB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11)
{
  if (a11) {
    std::mutex::unlock(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ASD_uint64mul(uint64_t a1, uint64_t a2)
{
  return a2 * a1;
}

uint64_t ASD_add_128(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

__n128 ASD_U128::operator*@<Q0>(uint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t v5 = *a1;
  unint64_t v4 = a1[1];
  unint64_t v7 = *a2;
  unint64_t v6 = a2[1];
  unint64_t v8 = HIDWORD(v4);
  unint64_t v9 = HIDWORD(v6) * (unint64_t)v4 + v6 * (unint64_t)HIDWORD(v4);
  unint64_t v10 = HIDWORD(v9);
  unint64_t v11 = v9 << 32;
  unint64_t v12 = v10 + HIDWORD(v6) * (unint64_t)HIDWORD(v4);
  unint64_t v13 = v6 * v4;
  if (v6 * v4 >= v6 * (unint64_t)v4 && v13 >= v11) {
    unint64_t v15 = v12;
  }
  else {
    unint64_t v15 = v12 + 1;
  }
  unint64_t v16 = HIDWORD(v7);
  unint64_t v17 = HIDWORD(v7) * (unint64_t)v5 + v7 * (unint64_t)HIDWORD(v5);
  unint64_t v18 = HIDWORD(v17);
  unint64_t v19 = v17 << 32;
  unint64_t v20 = v18 + HIDWORD(v7) * (unint64_t)HIDWORD(v5);
  unint64_t v21 = v7 * v5;
  if (v7 * v5 >= v7 * (unint64_t)v5 && v21 >= v19) {
    unint64_t v23 = v20;
  }
  else {
    unint64_t v23 = v20 + 1;
  }
  unint64_t v24 = v7 * (unint64_t)v4;
  unint64_t v25 = HIDWORD(v7) * (unint64_t)v4 + v7 * (unint64_t)HIDWORD(v4);
  unint64_t v26 = v7 * v4;
  unint64_t v27 = HIDWORD(v6) * (unint64_t)HIDWORD(v5);
  unint64_t v28 = v6 * (unint64_t)v5;
  unint64_t v29 = HIDWORD(v6) * (unint64_t)v5 + v6 * (unint64_t)HIDWORD(v5);
  unint64_t v30 = v6 * v5;
  unint64_t v31 = v26 + v30;
  LODWORD(v32) = __CFADD__(v26, v30);
  if (v31 < v26) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v32;
  }
  BOOL v33 = v30 >= v28 && v30 >= v29 << 32;
  v43[2] = v13;
  v43[3] = v15;
  v43[0] = 0;
  v43[1] = 0;
  unint64_t v34 = v27 + v16 * (unint64_t)v8 + HIDWORD(v29) + HIDWORD(v25) + v32;
  if (!v33) {
    ++v34;
  }
  if (v26 >= v24 && v26 >= v25 << 32) {
    unint64_t v36 = v34;
  }
  else {
    unint64_t v36 = v34 + 1;
  }
  v42[2] = v36;
  v42[3] = 0;
  v42[0] = 0;
  v42[1] = v31;
  v41[2] = 0;
  v41[3] = 0;
  v41[0] = v21;
  v41[1] = v23;
  ASD_U256::operator+(v43, v42, (unint64_t *)&v39);
  __n128 v37 = v40;
  *(_OWORD *)a3 = v39;
  *(__n128 *)(a3 + 16) = v37;
  ASD_U256::operator+((unint64_t *)a3, v41, (unint64_t *)&v39);
  __n128 result = v40;
  *(_OWORD *)a3 = v39;
  *(__n128 *)(a3 + 16) = result;
  return result;
}

uint64_t ASD_U128::operator/(uint64_t *a1, void *a2)
{
  unint64_t v4 = 0;
  unint64_t v5 = 0;
  uint64_t result = *a1;
  uint64_t v7 = a1[1];
  unint64_t v10 = a2;
  unint64_t v8 = *a2;
  unint64_t v9 = v10[1];
  int v11 = 128;
  do
  {
    uint64_t v12 = result;
    *((void *)&v13 + 1) = v5;
    *(void *)&long long v13 = v4;
    unint64_t v5 = v13 >> 63;
    *((void *)&v13 + 1) = v4;
    *(void *)&long long v13 = v7;
    unint64_t v4 = v13 >> 63;
    result *= 2;
    unint64_t v14 = v5 - v9;
    if (v5 > v9 || v5 == v9 && v4 >= v8)
    {
      BOOL v15 = v4 >= v8;
      v4 -= v8;
      uint64_t v16 = !v15;
      unint64_t v5 = v14 - v16;
      result |= 1uLL;
    }
    *((void *)&v17 + 1) = v7;
    *(void *)&long long v17 = v12;
    uint64_t v7 = v17 >> 63;
    --v11;
  }
  while (v11);
  return result;
}

double operator*@<D0>(uint64_t *a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a2;
  v4[1] = 0;
  *(void *)&double result = ASD_U128::operator*(a1, v4, a3).n128_u64[0];
  return result;
}

double operator*@<D0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a1;
  v4[1] = 0;
  *(void *)&double result = ASD_U128::operator*(v4, a2, a3).n128_u64[0];
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void AudioRingBuffer::AudioRingBuffer(AudioRingBuffer *this)
{
  *(void *)this = &unk_26D96F3F8;
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)((char *)this + 8));
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)((char *)this + 48));
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((_DWORD *)this + 28) = 0;
  *((void *)this + 13) = 0;
  bzero((char *)this + 120, 0x314uLL);
  *((_WORD *)this + 454) = 1;
}

{
  *(void *)this = &unk_26D96F3F8;
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)((char *)this + 8));
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)((char *)this + 48));
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((_DWORD *)this + 28) = 0;
  *((void *)this + 13) = 0;
  bzero((char *)this + 120, 0x314uLL);
  *((_WORD *)this + 454) = 1;
}

void AudioRingBuffer::~AudioRingBuffer(AudioRingBuffer *this)
{
  *(void *)this = &unk_26D96F3F8;
  AudioRingBuffer::Deallocate(this);
  uint64_t v2 = (void *)*((void *)this + 12);
  if (v2)
  {
    free(v2);
    *((void *)this + 12) = 0;
  }
  uint64_t v3 = (void *)*((void *)this + 11);
  if (v3)
  {
    free(v3);
    *((void *)this + 11) = 0;
  }
}

{
  uint64_t vars8;

  AudioRingBuffer::~AudioRingBuffer(this);
  JUMPOUT(0x22A63EB50);
}

OpaqueAudioConverter *AudioRingBuffer::Deallocate(AudioRingBuffer *this)
{
  uint64_t v2 = (void *)*((void *)this + 13);
  if (v2)
  {
    free(v2);
    *((void *)this + 13) = 0;
  }
  *((_DWORD *)this + 28) = 0;
  *((void *)this + 15) = 0;
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v7);
  long long v3 = v7[1];
  *(_OWORD *)((char *)this + 8) = v7[0];
  *(_OWORD *)((char *)this + 24) = v3;
  uint64_t v4 = v8;
  *((void *)this + 5) = v8;
  long long v5 = *(_OWORD *)((char *)this + 24);
  *((_OWORD *)this + 3) = *(_OWORD *)((char *)this + 8);
  *((_OWORD *)this + 4) = v5;
  *((void *)this + 10) = v4;
  double result = (OpaqueAudioConverter *)*((void *)this + 16);
  if (result)
  {
    double result = (OpaqueAudioConverter *)AudioConverterDispose(result);
    *((void *)this + 16) = 0;
  }
  return result;
}

void AudioRingBuffer::Allocate(AudioRingBuffer *this, int a2, int a3, int a4)
{
  AudioRingBuffer::Deallocate(this);
  *((_DWORD *)this + 28) = a2;
  *((_DWORD *)this + 29) = a3;
  *((_DWORD *)this + 30) = a4;
  *((_DWORD *)this + 31) = a4 * a3;
  size_t v8 = ((a4 * a3 + 8) * a2);
  unint64_t v9 = (char *)malloc_type_malloc(v8, 0x7C51E058uLL);
  if (v8) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v18 = std::bad_alloc::bad_alloc(exception);
  }
  int v11 = v9;
  bzero(v9, v8);
  *((void *)this + 13) = v11;
  if (a2 > 0)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *((unsigned int *)this + 31);
    unint64_t v14 = &v11[8 * a2];
    do
    {
      *(void *)(*((void *)this + 13) + 8 * v12) = v14;
      v14 += v13;
      ++v12;
    }
    while (a2 != v12);
  }
  for (uint64_t i = 0; i != 768; i += 24)
  {
    uint64_t v16 = (char *)this + i;
    *((void *)v16 + 17) = 0;
    *((void *)v16 + 18) = 0;
    *((_DWORD *)v16 + 38) = 0;
  }
  *((_DWORD *)this + 226) = 0;
  *((unsigned char *)this + 908) = 1;
}

AudioRingBuffer *AudioRingBuffer::Clear(AudioRingBuffer *this)
{
  for (uint64_t i = 0; i != 768; i += 24)
  {
    uint64_t v2 = (char *)this + i;
    *((void *)v2 + 17) = 0;
    *((void *)v2 + 18) = 0;
    *((_DWORD *)v2 + 38) = 0;
  }
  *((_DWORD *)this + 226) = 0;
  *((unsigned char *)this + 908) = 1;
  return this;
}

void AudioRingBuffer::Allocate(AudioRingBuffer *this, const CAStreamBasicDescription *a2, int a3)
{
  int v6 = *((_DWORD *)a2 + 6);
  if ((*((_DWORD *)a2 + 3) & 0x20) != 0) {
    int v7 = *((_DWORD *)a2 + 7);
  }
  else {
    int v7 = 1;
  }
  AudioRingBuffer::Allocate(this, v7, v6, a3);
  long long v8 = *(_OWORD *)a2;
  long long v9 = *((_OWORD *)a2 + 1);
  *((void *)this + 5) = *((void *)a2 + 4);
  *(_OWORD *)((char *)this + 24) = v9;
  *(_OWORD *)((char *)this + 8) = v8;
  int v10 = *((_DWORD *)a2 + 3);
  if ((v10 & 0x20) != 0) {
    unsigned int v11 = *((_DWORD *)a2 + 7);
  }
  else {
    unsigned int v11 = 1;
  }
  if ((v10 & 0x20) != 0) {
    int v12 = 1;
  }
  else {
    int v12 = *((_DWORD *)a2 + 7);
  }
  uint64_t v13 = AllocABL(v11, v12);
  unint64_t v14 = (_DWORD *)*((void *)this + 11);
  if (v14 != v13)
  {
    free(v14);
    *((void *)this + 11) = v13;
  }
}

_DWORD *AllocABL(unsigned int a1, int a2)
{
  double result = malloc_type_malloc(16 * (a1 - 1) + 24, 0xD786F418uLL);
  _DWORD *result = a1;
  if (a1)
  {
    uint64_t v5 = a1;
    int v6 = result + 4;
    do
    {
      *((_DWORD *)v6 - 2) = a2;
      *((_DWORD *)v6 - 1) = 0;
      *int v6 = 0;
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t AudioRingBuffer::SetInputFormat(AudioRingBuffer *this, AudioStreamBasicDescription *inSourceFormat)
{
  uint64_t v4 = AudioConverterNew(inSourceFormat, (const AudioStreamBasicDescription *)((char *)this + 8), (AudioConverterRef *)this + 16);
  if (!v4)
  {
    long long v5 = *(_OWORD *)&inSourceFormat->mSampleRate;
    long long v6 = *(_OWORD *)&inSourceFormat->mBytesPerPacket;
    *((void *)this + 10) = *(void *)&inSourceFormat->mBitsPerChannel;
    *((_OWORD *)this + 3) = v5;
    *((_OWORD *)this + 4) = v6;
    AudioFormatFlags mFormatFlags = inSourceFormat->mFormatFlags;
    if ((mFormatFlags & 0x20) != 0) {
      UInt32 mChannelsPerFrame = inSourceFormat->mChannelsPerFrame;
    }
    else {
      UInt32 mChannelsPerFrame = 1;
    }
    if ((mFormatFlags & 0x20) != 0) {
      UInt32 v9 = 1;
    }
    else {
      UInt32 v9 = inSourceFormat->mChannelsPerFrame;
    }
    int v10 = AllocABL(mChannelsPerFrame, v9);
    unsigned int v11 = (_DWORD *)*((void *)this + 12);
    if (v11 != v10)
    {
      free(v11);
      *((void *)this + 12) = v10;
    }
  }
  return v4;
}

AudioRingBuffer *AudioRingBuffer::ConvertAndStore(AudioRingBuffer *this, int a2, const AudioBufferList *a3, int a4, UInt32 inNumberPCMFrames)
{
  if (inNumberPCMFrames)
  {
    long long v6 = (const AudioBufferList *)*((void *)this + 12);
    uint64_t mNumberBuffers = v6->mNumberBuffers;
    if (mNumberBuffers)
    {
      UInt32 v8 = *((_DWORD *)this + 18) * inNumberPCMFrames;
      p_mData = &a3->mBuffers[0].mData;
      int v10 = &v6->mBuffers[0].mData;
      do
      {
        unsigned int v11 = (char *)*p_mData;
        p_mData += 2;
        *int v10 = &v11[a4];
        *((_DWORD *)v10 - 1) = v8;
        v10 += 2;
        --mNumberBuffers;
      }
      while (mNumberBuffers);
    }
    int v12 = (AudioBufferList *)*((void *)this + 11);
    uint64_t v13 = v12->mNumberBuffers;
    if (v13)
    {
      UInt32 v14 = *((_DWORD *)this + 8) * inNumberPCMFrames;
      BOOL v15 = (uint64_t *)*((void *)this + 13);
      uint64_t v16 = &v12->mBuffers[0].mData;
      do
      {
        uint64_t v17 = *v15++;
        *uint64_t v16 = (void *)(v17 + a2);
        *((_DWORD *)v16 - 1) = v14;
        v16 += 2;
        --v13;
      }
      while (v13);
    }
    return (AudioRingBuffer *)AudioConverterConvertComplexBuffer(*((AudioConverterRef *)this + 16), inNumberPCMFrames, v6, v12);
  }
  return this;
}

uint64_t AudioRingBuffer::Store(AudioRingBuffer *this, const AudioBufferList *a2, unsigned int a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  long long v5 = this;
  uint64_t v6 = *((unsigned int *)this + 30);
  if (v6 < a3) {
    return 3;
  }
  uint64_t v10 = a4 + a3;
  int v11 = *((_DWORD *)this + 226);
  int v12 = (char *)this + 24 * (v11 & 0x1F);
  uint64_t v14 = *((void *)v12 + 18);
  uint64_t v13 = (uint64_t *)(v12 + 144);
  if (v14 > a4 || *((unsigned char *)this + 908) && *((unsigned char *)this + 909))
  {
    BOOL v15 = (char *)this + 24 * ((v11 + 1) & 0x1F);
    *((void *)v15 + 17) = a4;
    *((void *)v15 + 18) = a4;
    *((_DWORD *)v15 + 38) = v11 + 1;
    atomic_compare_exchange_strong((atomic_uint *volatile)this + 226, &v16, v11 + 1);
    *((unsigned char *)this + 908) = 0;
  }
  else if (v10 - *((void *)this + 3 * (v11 & 0x1F) + 17) > v6)
  {
    uint64_t v29 = v10 - v6;
    uint64_t v30 = *v13;
    if (v29 > v30) {
      uint64_t v30 = v29;
    }
    unint64_t v31 = (char *)this + 24 * ((v11 + 1) & 0x1F);
    *((void *)v31 + 17) = v29;
    *((void *)v31 + 18) = v30;
    *((_DWORD *)v31 + 38) = v11 + 1;
    atomic_compare_exchange_strong((atomic_uint *volatile)this + 226, &v32, v11 + 1);
  }
  uint64_t v17 = (void **)*((void *)this + 13);
  uint64_t v18 = *((void *)this + 3 * (*((_DWORD *)this + 226) & 0x1F) + 18);
  uint64_t v19 = *((int *)this + 30);
  int v21 = *((_DWORD *)this + 28);
  int v20 = *((_DWORD *)this + 29);
  if (v18 >= a4)
  {
    int v23 = ((v19 & ((int)(a4 % v19) >> 31)) + a4 % v19) * v20;
    goto LABEL_26;
  }
  int v22 = ((v19 & ((int)(v18 % v19) >> 31)) + v18 % v19) * v20;
  int v23 = ((v19 & ((int)(a4 % v19) >> 31)) + a4 % v19) * v20;
  if (v23 <= v22)
  {
    if (v21 < 1) {
      goto LABEL_26;
    }
    uint64_t v72 = a4 + a3;
    unint64_t v73 = this;
    uint64_t v33 = v22;
    size_t v34 = *((_DWORD *)this + 31) - v22;
    unsigned int v35 = v21 + 1;
    unint64_t v36 = (uint64_t *)*((void *)this + 13);
    do
    {
      uint64_t v37 = *v36++;
      bzero((void *)(v37 + v33), v34);
      --v35;
    }
    while (v35 > 1);
    unsigned int v38 = v21 + 1;
    long long v39 = v17;
    do
    {
      __n128 v40 = *v39++;
      bzero(v40, v23);
      --v38;
    }
    while (v38 > 1);
  }
  else
  {
    if (v21 < 1) {
      goto LABEL_26;
    }
    uint64_t v72 = a4 + a3;
    unint64_t v73 = this;
    uint64_t v24 = v22;
    size_t v25 = v23 - v22;
    unsigned int v26 = v21 + 1;
    unint64_t v27 = (uint64_t *)*((void *)this + 13);
    do
    {
      uint64_t v28 = *v27++;
      bzero((void *)(v28 + v24), v25);
      --v26;
    }
    while (v26 > 1);
  }
  uint64_t v10 = v72;
  long long v5 = v73;
LABEL_26:
  uint64_t v41 = *((int *)v5 + 30);
  int v42 = ((v41 & ((int)(v10 % v41) >> 31)) + v10 % v41) * *((_DWORD *)v5 + 29);
  uint64_t v43 = *((void *)v5 + 16);
  if (v42 <= v23)
  {
    if (!v43)
    {
      if ((int)a2->mNumberBuffers >= 1)
      {
        uint64_t v60 = v23;
        size_t v61 = *((_DWORD *)v5 + 31) - v23;
        UInt32 v62 = a2->mNumberBuffers + 1;
        uint64_t v63 = 16;
        unint64_t v64 = v17;
        do
        {
          uint64_t v65 = (uint64_t)*v64++;
          memcpy((void *)(v65 + v60), *(const void **)((char *)&a2->mNumberBuffers + v63), v61);
          v63 += 16;
          --v62;
        }
        while (v62 > 1);
        UInt32 mNumberBuffers = a2->mNumberBuffers;
        if ((int)a2->mNumberBuffers >= 1)
        {
          p_mData = &a2->mBuffers[0].mData;
          unsigned int v68 = mNumberBuffers + 1;
          do
          {
            uint64_t v70 = *v17++;
            unint64_t v69 = v70;
            uint64_t v71 = (char *)*p_mData;
            p_mData += 2;
            memcpy(v69, &v71[v61], v42);
            --v68;
          }
          while (v68 > 1);
        }
      }
      goto LABEL_32;
    }
    UInt32 v49 = v41 - a4 % v41 - (v41 & ((int)(a4 % v41) >> 31));
    AudioRingBuffer::ConvertAndStore(v5, v23, a2, 0, v49);
    int v47 = v49 * *((_DWORD *)v5 + 18);
    UInt32 v48 = (*((_DWORD *)v5 + 30) & ((int)(v10 % *((int *)v5 + 30)) >> 31)) + v10 % *((int *)v5 + 30);
    int v44 = v5;
    int v45 = 0;
    long long v46 = a2;
  }
  else
  {
    if (!v43)
    {
      UInt32 v52 = a2->mNumberBuffers;
      if ((int)a2->mNumberBuffers >= 1)
      {
        uint64_t v53 = v23;
        size_t v54 = v42 - v23;
        int v55 = &a2->mBuffers[0].mData;
        unsigned int v56 = v52 + 1;
        do
        {
          uint64_t v57 = (uint64_t)*v17++;
          uint64_t v58 = (void *)(v57 + v53);
          unint64_t v59 = *v55;
          v55 += 2;
          memcpy(v58, v59, v54);
          --v56;
        }
        while (v56 > 1);
      }
      goto LABEL_32;
    }
    int v44 = v5;
    int v45 = v23;
    long long v46 = a2;
    int v47 = 0;
    UInt32 v48 = a3;
  }
  AudioRingBuffer::ConvertAndStore(v44, v45, v46, v47, v48);
LABEL_32:
  uint64_t result = 0;
  int v50 = *((_DWORD *)v5 + 226);
  uint64_t v51 = (uint64_t)v5 + 24 * ((v50 + 1) & 0x1F) + 136;
  *(void *)uint64_t v51 = *((void *)v5 + 3 * (v50 & 0x1F) + 17);
  *(void *)(v51 + 8) = v10;
  *(_DWORD *)(v51 + 16) = v50 + 1;
  atomic_compare_exchange_strong((atomic_uint *volatile)v5 + 226, (unsigned int *)&v50, v50 + 1);
  return result;
}

void AudioRingBuffer::SetTimeBounds(AudioRingBuffer *this, uint64_t a2, uint64_t a3)
{
  int v3 = *((_DWORD *)this + 226);
  uint64_t v4 = (char *)this + 24 * ((v3 + 1) & 0x1F);
  *((void *)v4 + 17) = a2;
  *((void *)v4 + 18) = a3;
  *((_DWORD *)v4 + 38) = v3 + 1;
  atomic_compare_exchange_strong((atomic_uint *volatile)this + 226, (unsigned int *)&v3, v3 + 1);
}

uint64_t AudioRingBuffer::GetTimeBounds(AudioRingBuffer *this, uint64_t *a2, uint64_t *a3)
{
  int v3 = *((_DWORD *)this + 226);
  uint64_t v4 = (char *)this + 24 * (v3 & 0x1F);
  long long v5 = (uint64_t *)(v4 + 136);
  uint64_t v6 = (uint64_t *)(v4 + 144);
  int v7 = v4 + 152;
  int v8 = 8;
  while (1)
  {
    *a2 = *v5;
    *a3 = *v6;
    if (*v7 == v3) {
      break;
    }
    if (!--v8) {
      return 4;
    }
  }
  return 0;
}

uint64_t AudioRingBuffer::CheckTimeBounds(AudioRingBuffer *this, uint64_t a2, uint64_t a3)
{
  int v3 = *((_DWORD *)this + 226);
  uint64_t v4 = (char *)this + 24 * (v3 & 0x1F);
  long long v5 = (uint64_t *)(v4 + 136);
  uint64_t v6 = (uint64_t *)(v4 + 144);
  int v7 = v4 + 152;
  int v8 = 8;
  while (1)
  {
    uint64_t v9 = *v5;
    uint64_t v10 = *v6;
    if (*v7 == v3) {
      break;
    }
    if (!--v8) {
      return 4;
    }
  }
  if (v10 > a2) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = 2;
  }
  if (v10 >= a3) {
    unsigned int v12 = 0;
  }
  if (v9 >= a3) {
    int v13 = -2;
  }
  else {
    int v13 = -1;
  }
  if (v10 >= a3) {
    unsigned int v14 = v13;
  }
  else {
    unsigned int v14 = 3;
  }
  if (v9 > a2) {
    return v14;
  }
  else {
    return v12;
  }
}

uint64_t AudioRingBuffer::CheckTimeBounds2(AudioRingBuffer *this, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  if (a3 < a2) {
    return 4294967246;
  }
  int v6 = *((_DWORD *)this + 226);
  int v7 = (char *)this + 24 * (v6 & 0x1F);
  int v8 = (uint64_t *)(v7 + 136);
  uint64_t v9 = (uint64_t *)(v7 + 144);
  uint64_t v10 = v7 + 152;
  int v11 = 8;
  while (1)
  {
    uint64_t v12 = *v8;
    uint64_t v13 = *v9;
    if (*v10 == v6) {
      break;
    }
    if (!--v11) {
      return 4;
    }
  }
  *a4 = a2;
  *a5 = a3;
  if (v12 <= a2)
  {
    if (v13 >= a3)
    {
      return 0;
    }
    else
    {
      *a5 = v13;
      if (v13 <= a2)
      {
        *a4 = v13;
        return 2;
      }
      else
      {
        return 1;
      }
    }
  }
  else
  {
    *a4 = v12;
    if (v13 >= a3)
    {
      if (v12 >= a3)
      {
        *a5 = v12;
        return 4294967294;
      }
      else
      {
        return 0xFFFFFFFFLL;
      }
    }
    else
    {
      *a5 = v13;
      return 3;
    }
  }
}

uint64_t AudioRingBuffer::touchRingBufferMemory(AudioRingBuffer *this)
{
  uint64_t v1 = *((unsigned int *)this + 28);
  if ((int)v1 < 1)
  {
    int v3 = 0;
  }
  else
  {
    uint64_t v2 = 0;
    int v3 = 0;
    unint64_t v4 = *((unsigned int *)this + 31);
    do
    {
      if (v4)
      {
        for (unint64_t i = 0; i < v4; i += 4096)
          v3 += *(unsigned __int8 *)(*(void *)(*((void *)this + 13) + 8 * v2) + i);
      }
      ++v2;
    }
    while (v2 != v1);
  }
  uint64_t result = (AudioRingBuffer::touchRingBufferMemory(void)::gTempValue + v3);
  AudioRingBuffer::touchRingBufferMemory(void)::gTempValue += v3;
  return result;
}

uint64_t AudioRingBuffer::Fetch(AudioRingBuffer *this, AudioBufferList *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8 = a4 + a3;
  uint64_t result = AudioRingBuffer::CheckTimeBounds(this, a4, v8);
  if (result) {
    return result;
  }
  if (!a3)
  {
    signed int v15 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = (const void **)*((void *)this + 13);
  int v11 = *((_DWORD *)this + 29);
  uint64_t v12 = *((int *)this + 30);
  int v13 = ((v12 & ((int)(a4 % v12) >> 31)) + a4 % v12) * v11;
  int v14 = ((v12 & ((int)(v8 % v12) >> 31)) + v8 % v12) * v11;
  signed int v15 = v14 - v13;
  if (v14 <= v13)
  {
    int v35 = *((_DWORD *)this + 31) - v13;
    if ((int)a2->mNumberBuffers >= 1)
    {
      uint64_t v34 = v8;
      uint64_t v22 = v13;
      UInt32 v23 = a2->mNumberBuffers + 1;
      uint64_t v24 = 16;
      size_t v25 = (uint64_t *)*((void *)this + 13);
      do
      {
        uint64_t v26 = *v25++;
        memcpy(*(void **)((char *)&a2->mNumberBuffers + v24), (const void *)(v26 + v22), v35);
        v24 += 16;
        --v23;
      }
      while (v23 > 1);
      uint64_t v8 = v34;
      if ((int)a2->mNumberBuffers >= 1)
      {
        p_mData = &a2->mBuffers[0].mData;
        UInt32 v28 = a2->mNumberBuffers + 1;
        do
        {
          uint64_t v29 = (char *)*p_mData;
          p_mData += 2;
          uint64_t v30 = &v29[v35];
          unint64_t v31 = *v10++;
          memcpy(v30, v31, v14);
          --v28;
        }
        while (v28 > 1);
      }
    }
    signed int v15 = v35 + v14;
    goto LABEL_16;
  }
  if ((int)a2->mNumberBuffers >= 1)
  {
    uint64_t v16 = v13;
    uint64_t v17 = &a2->mBuffers[0].mData;
    UInt32 v18 = a2->mNumberBuffers + 1;
    do
    {
      int v20 = *v17;
      v17 += 2;
      uint64_t v19 = v20;
      uint64_t v21 = (uint64_t)*v10++;
      memcpy(v19, (const void *)(v21 + v16), v15);
      --v18;
    }
    while (v18 > 1);
LABEL_16:
    if ((int)a2->mNumberBuffers >= 1)
    {
      p_mDataByteSize = &a2->mBuffers[0].mDataByteSize;
      UInt32 v33 = a2->mNumberBuffers + 1;
      do
      {
        UInt32 *p_mDataByteSize = v15;
        p_mDataByteSize += 4;
        --v33;
      }
      while (v33 > 1);
    }
  }
  return AudioRingBuffer::CheckTimeBounds(this, a4, v8);
}

uint64_t AudioRingBuffer::FetchAllWithZeroes(AudioRingBuffer *this, AudioBufferList *a2, signed int a3, uint64_t a4, unsigned int *a5, unsigned int *a6, unsigned int *a7)
{
  int v14 = *((_DWORD *)this + 29) * a3;
  uint64_t v15 = a4 + a3;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  if (AudioRingBuffer::CheckTimeBounds2(this, a4, v15, &v77, &v76) == 4)
  {
    *a5 = a3;
    *a7 = 0;
    *a6 = 0;
    UInt32 mNumberBuffers = a2->mNumberBuffers;
    if ((int)a2->mNumberBuffers >= 1)
    {
      p_mData = &a2->mBuffers[0].mData;
      unsigned int v18 = mNumberBuffers + 1;
      do
      {
        uint64_t v19 = *p_mData;
        p_mData += 2;
        bzero(v19, v14);
        --v18;
      }
      while (v18 > 1);
    }
    return 4;
  }
  else
  {
    uint64_t v70 = a5;
    uint64_t v71 = a7;
    uint64_t v72 = a6;
    unint64_t v73 = this;
    uint64_t v21 = v76;
    uint64_t v67 = v15;
    uint64_t v68 = a4;
    signed int v22 = (v77 - a4) & ~(((int)v77 - (int)a4) >> 31);
    if (v22 >= a3) {
      signed int v22 = a3;
    }
    signed int v23 = (v15 - v76) & ~(((int)v15 - (int)v76) >> 31);
    if (v23 >= a3) {
      signed int v23 = a3;
    }
    unsigned int v69 = v23;
    int v24 = *((_DWORD *)this + 29);
    int v66 = v24;
    if (v76 != v77)
    {
      size_t v25 = (const void **)*((void *)this + 13);
      int v26 = v22 * v24;
      uint64_t v27 = *((int *)v73 + 30);
      int v28 = ((v27 & ((int)(v77 % v27) >> 31)) + v77 % v27) * v24;
      int v29 = ((v27 & ((int)(v76 % v27) >> 31)) + v76 % v27) * v24;
      if (v29 <= v28)
      {
        if ((int)a2->mNumberBuffers >= 1)
        {
          int v64 = ((v27 & ((int)(v76 % v27) >> 31)) + v76 % v27) * v24;
          uint64_t v65 = v76;
          uint64_t v38 = v26;
          uint64_t v39 = v28;
          int v63 = *((_DWORD *)v73 + 31) - v28;
          UInt32 v40 = a2->mNumberBuffers + 1;
          uint64_t v41 = 16;
          int v42 = (uint64_t *)*((void *)v73 + 13);
          do
          {
            uint64_t v43 = *v42++;
            memcpy((void *)(*(void *)((char *)&a2->mNumberBuffers + v41) + v38), (const void *)(v43 + v39), v63);
            v41 += 16;
            --v40;
          }
          while (v40 > 1);
          uint64_t v21 = v65;
          if ((int)a2->mNumberBuffers >= 1)
          {
            int v44 = &a2->mBuffers[0].mData;
            UInt32 v45 = a2->mNumberBuffers + 1;
            uint64_t v46 = v38 + v63;
            do
            {
              int v47 = (char *)*v44;
              v44 += 2;
              UInt32 v48 = &v47[v46];
              UInt32 v49 = *v25++;
              memcpy(v48, v49, v64);
              --v45;
            }
            while (v45 > 1);
          }
        }
      }
      else if ((int)a2->mNumberBuffers >= 1)
      {
        uint64_t v30 = v26;
        uint64_t v31 = v28;
        unsigned int v32 = &a2->mBuffers[0].mData;
        UInt32 v33 = a2->mNumberBuffers + 1;
        size_t v34 = v29 - v28;
        do
        {
          int v35 = (char *)*v32;
          v32 += 2;
          unint64_t v36 = &v35[v30];
          uint64_t v37 = (uint64_t)*v25++;
          memcpy(v36, (const void *)(v37 + v31), v34);
          --v33;
        }
        while (v33 > 1);
      }
    }
    uint64_t v75 = 0;
    uint64_t v20 = AudioRingBuffer::CheckTimeBounds2(v73, v68, v67, &v75, &v74);
    int v50 = v75;
    if (v21 < v75) {
      int v50 = v21;
    }
    signed int v51 = (v50 - v68) & ~((v50 - (int)v68) >> 31);
    if (v51 >= a3) {
      unsigned int v52 = a3;
    }
    else {
      unsigned int v52 = v51;
    }
    if (v52 && (int)a2->mNumberBuffers >= 1)
    {
      size_t v53 = (int)(*((_DWORD *)v73 + 29) * v52);
      size_t v54 = &a2->mBuffers[0].mData;
      UInt32 v55 = a2->mNumberBuffers + 1;
      do
      {
        unsigned int v56 = *v54;
        v54 += 2;
        bzero(v56, v53);
        --v55;
      }
      while (v55 > 1);
    }
    if (v69 && (int)a2->mNumberBuffers >= 1)
    {
      uint64_t v57 = &a2->mBuffers[0].mData;
      UInt32 v58 = a2->mNumberBuffers + 1;
      do
      {
        unint64_t v59 = (char *)*v57;
        v57 += 2;
        bzero(&v59[v14 - v69 * v66], (int)(v69 * v66));
        --v58;
      }
      while (v58 > 1);
    }
    *uint64_t v70 = v52;
    *uint64_t v71 = v69;
    *uint64_t v72 = a3 - (v69 + v52);
    if ((int)a2->mNumberBuffers >= 1)
    {
      p_mDataByteSize = &a2->mBuffers[0].mDataByteSize;
      UInt32 v61 = a2->mNumberBuffers + 1;
      do
      {
        UInt32 *p_mDataByteSize = v14;
        p_mDataByteSize += 4;
        --v61;
      }
      while (v61 > 1);
    }
  }
  return v20;
}

void sub_225CFBFD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
}

void sub_225CFC44C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_225D0209C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

float *OUTLINED_FUNCTION_1_2(float *result, uint64_t a2, void *a3, float a4)
{
  _DWORD *result = a4;
  *a3 = a2;
  return result;
}

uint64_t DebugPrint(const char *a1, ...)
{
  va_start(va, a1);
  return vprintf(a1, va);
}

void LogError(const char *a1, ...)
{
  va_start(va, a1);
  vprintf(a1, va);
  vsyslog(3, a1, va);
}

void LogWarning(const char *a1, ...)
{
  va_start(va, a1);
  vprintf(a1, va);
  vsyslog(4, a1, va);
}

uint64_t CAIsDebuggerAttached(void)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  *(void *)unint64_t v4 = 0xE00000001;
  int v5 = 1;
  pid_t v6 = getpid();
  size_t v1 = 648;
  unsigned int v3 = 0;
  sysctl(v4, 4u, v2, &v1, 0, 0);
  return (v3 >> 11) & 1;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_225D07EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_225D08178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D08578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D086E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D08A18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_225D08BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D08D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225D08E28(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v1, 0x10A1C4088BA2E40);
  _Unwind_Resume(a1);
}

void sub_225D08EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D08FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D09120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, void *a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225D09300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_225D094C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, void *a10, ...)
{
  va_start(va, a10);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100]((uint64_t *)va);

  _Unwind_Resume(a1);
}

void sub_225D09694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, char a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_225D09870(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void sub_225D09A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);

  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

DSPGraph::Interpreter *DSPGraph::Interpreter::Interpreter(DSPGraph::Interpreter *this)
{
  *(void *)this = MEMORY[0x263F28DE8] + 16;
  *((void *)this + 1) = 0;
  MEMORY[0x22A63E7E0]((char *)this + 16);
  *((void *)this + 20) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  *((_DWORD *)this + 42) = 1;
  *((void *)this + 22) = 0;
  *((unsigned char *)this + 184) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 24) = 0;
  return this;
}

void sub_225D09AFC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)(v1 + 8) = 0;
  if (v3) {
    DSPGraph::Interpreter::Interpreter(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void std::__shared_ptr_pointer<DSPGraph::Graph  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22A63EB50);
}

uint64_t std::__shared_ptr_pointer<DSPGraph::Graph  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_impl<char const*,char const*>(void *a1, char **a2, char **a3)
{
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node<char const*,char const*>((uint64_t)a1, a2, a3, (uint64_t)v7);
  inserted = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__node_insert_unique(a1, v7[0]);
  if (v5) {
    v7[0] = 0;
  }
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v7, 0);
  return inserted;
}

void sub_225D09D64(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node<char const*,char const*>@<X0>(uint64_t a1@<X0>, char **a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = a1 + 16;
  uint64_t v9 = operator new(0x40uLL);
  *(void *)a4 = v9;
  *(void *)(a4 + 8) = v8;
  *(unsigned char *)(a4 + 16) = 0;
  void *v9 = 0;
  v9[1] = 0;
  std::pair<std::string const,std::string>::pair[abi:ne180100]<char const*,char const*,0>(v9 + 2, a2, a3);
  *(unsigned char *)(a4 + 16) = 1;
  unint64_t result = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)(v9 + 2));
  v9[1] = result;
  return result;
}

void sub_225D09E00(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__node_insert_unique(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  unint64_t v4 = (unsigned __int8 *)(a2 + 16);
  unint64_t v5 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), a2 + 16);
  v2[1] = v5;
  pid_t v6 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__node_insert_unique_prepare[abi:ne180100]((uint64_t)a1, v5, v4);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__node_insert_unique_perform[abi:ne180100](a1, v2);
  return (unsigned __int8 *)v2;
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const*,char const*,0>(void *a1, char **a2, char **a3)
{
  unint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, *a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, *a3);
  return a1;
}

void sub_225D09EC8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      signed int v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__node_insert_unique_prepare[abi:ne180100](uint64_t a1, unint64_t a2, unsigned __int8 *a3)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v7.i16[0] = vaddlv_u8(v7);
    unint64_t v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL) {
      uint64_t v9 = v4 <= a2 ? a2 % v4 : a2;
    }
    else {
      uint64_t v9 = (v4 - 1) & a2;
    }
    uint64_t v10 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v9);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == a2)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a3)) {
            return i;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= v4) {
              v12 %= v4;
            }
          }
          else
          {
            v12 &= v4 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v4 || (float)(v14 * (float)v4) < v13)
  {
    BOOL v15 = 1;
    if (v4 >= 3) {
      BOOL v15 = (v4 & (v4 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v4);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v18);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__node_insert_unique_perform[abi:ne180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  uint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    void *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    uint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    unint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      int v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  int8x8_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<char const*>(uint64_t *a1, char **a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    int v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<RamstadSRC *>>>(v7, v9);
  }
  else {
    int v10 = 0;
  }
  __v.__first_ = v10;
  __v.__begin_ = v10 + v4;
  __v.__end_ = __v.__begin_;
  __v.__end_cap_.__value_ = &v10[v9];
  std::string::basic_string[abi:ne180100]<0>(__v.__begin_->__r_.__value_.__r.__words, *a2);
  __v.__end_ = __v.__begin_ + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v11 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v11;
}

void sub_225D0A9E0(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void ASDDSPGraphHelper::ASDDSPGraphHelper(void *a1, void *a2)
{
  uint64_t v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  a1[2] = 0;
  operator new();
}

void sub_225D0AC94(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v2, 0xE1C40E9FAB1CALL);
  uint64_t v4 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  unint64_t v5 = *(std::__shared_weak_count **)(v1 + 8);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  _Unwind_Resume(a1);
}

uint64_t ASDDSPGraphHelper::allocateStreamingResources(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  long long v10 = *(DSPGraph::Graph **)a1;
  uint64_t v11 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  DSPGraph::GraphFactory::createFormatMatchedGraphWithGraph(&v10, a2, a3);
  uint64_t v5 = v12;
  uint64_t v12 = 0;
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    uint64_t v7 = v12;
    uint64_t v12 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  unint64_t v8 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)a1);
  DSPGraph::Box::sampleRate(v8);
  DSPGraph::Graph::setSliceDuration();
  DSPGraph::Graph::configure(*(DSPGraph::Graph **)(a1 + 16));
  return DSPGraph::Graph::initialize(*(DSPGraph::Graph **)(a1 + 16));
}

void sub_225D0AE0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  _Unwind_Resume(exception_object);
}

DSPGraph::Graph *ASDDSPGraphHelper::deallocateStreamingResources(DSPGraph::Graph **this)
{
  DSPGraph::Graph::uninitialize(this[2]);
  DSPGraph::Graph::unconfigure(this[2]);
  uint64_t result = this[2];
  this[2] = 0;
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)result + 8);
    return (DSPGraph::Graph *)v3();
  }
  return result;
}

uint64_t ASDDSPGraphHelper::resetGraph(DSPGraph::Graph **this)
{
  return DSPGraph::Graph::reset(this[2]);
}

void sub_225D0B428(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_225D0D60C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_225D0E6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t CABufferList::AllocateBuffers(uint64_t this, unsigned int a2)
{
  if (*(_DWORD *)(this + 36) < a2) {
    operator new[]();
  }
  return this;
}

CABufferList *CABufferList::AllocateBuffersAndCopyFrom(CABufferList *this, unsigned int a2, CABufferList *a3, CABufferList *a4)
{
  int v4 = *((_DWORD *)this + 6);
  if (v4 == *((_DWORD *)a3 + 6) && v4 == *((_DWORD *)a4 + 6))
  {
    if (*((_DWORD *)this + 9) < a2)
    {
      CABufferList::VerifyNotTrashingOwnedBuffer((uint64_t)a4);
      operator new[]();
    }
    return (CABufferList *)CABufferList::CopyAllFrom(this, a3, a4);
  }
  return this;
}

uint64_t CABufferList::CopyAllFrom(CABufferList *this, CABufferList *a2, CABufferList *a3)
{
  uint64_t result = CABufferList::VerifyNotTrashingOwnedBuffer((uint64_t)a3);
  unsigned int v7 = *((_DWORD *)a2 + 9);
  int v8 = *((_DWORD *)this + 6);
  if (v8)
  {
    uint64_t v9 = (void *)((char *)a3 + 40);
    long long v10 = (unsigned int *)((char *)a2 + 36);
    uint64_t v11 = (void **)((char *)this + 40);
    do
    {
      --v8;
      uint64_t result = (uint64_t)memmove(*v11, *(const void **)(v10 + 1), *v10);
      uint64_t v12 = *v11;
      v11 += 2;
      void *v9 = v12;
      LODWORD(v12) = *v10;
      v10 += 4;
      *((_DWORD *)v9 - 1) = v12;
      v9 += 2;
    }
    while (v8);
  }
  if (a2 != a3)
  {
    return CABufferList::BytesConsumed(a2, v7);
  }
  return result;
}

uint64_t CABufferList::VerifyNotTrashingOwnedBuffer(uint64_t this)
{
  if (*(void *)(this + 8))
  {
    CABufferList::VerifyNotTrashingOwnedBuffer();
    return CABufferList::BytesConsumed(v1, v2);
  }
  return this;
}

uint64_t CABufferList::BytesConsumed(CABufferList *this, unsigned int a2)
{
  uint64_t result = CABufferList::VerifyNotTrashingOwnedBuffer((uint64_t)this);
  int v5 = *((_DWORD *)this + 6);
  if (v5)
  {
    for (uint64_t i = (void *)((char *)this + 40); ; i += 2)
    {
      unsigned int v7 = *((_DWORD *)i - 1);
      BOOL v8 = v7 >= a2;
      unsigned int v9 = v7 - a2;
      if (!v8) {
        break;
      }
      *i += a2;
      *((_DWORD *)i - 1) = v9;
      if (!--v5) {
        return result;
      }
    }
    CABufferList::BytesConsumed();
    return CABufferList::DeallocateBuffers(v10);
  }
  return result;
}

uint64_t CABufferList::DeallocateBuffers(CABufferList *this)
{
  int v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    uint64_t v3 = (void *)((char *)this + 40);
    do
    {
      void *v3 = 0;
      *((_DWORD *)v3 - 1) = 0;
      v3 += 2;
      --v2;
    }
    while (v2);
  }
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    uint64_t result = MEMORY[0x22A63EB30](result, 0x1000C8077774924);
    *((void *)this + 1) = 0;
    *((_DWORD *)this + 4) = 0;
  }
  return result;
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, const AudioStreamBasicDescription *a3, const char *a4)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v12, a3);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  *(_OWORD *)__str = 0u;
  if (v13 != 1819304813) {
    goto LABEL_10;
  }
  if (v14)
  {
    if (v17 == 32)
    {
      if ((v14 & 2) != 0)
      {
        strcpy(__str, ", BEF");
        int v9 = 10;
      }
      else
      {
        strcpy(__str, ", LEF");
        int v9 = -10;
      }
      return show(a1, a2, v9, a4, __str);
    }
LABEL_10:
    int v9 = 1;
    return show(a1, a2, v9, a4, __str);
  }
  if (!v15)
  {
LABEL_6:
    int v9 = 0;
    return show(a1, a2, v9, a4, __str);
  }
  if ((v14 & 0x20) != 0)
  {
    unsigned int v8 = 1;
  }
  else
  {
    unsigned int v8 = v16;
    if (!v16) {
      goto LABEL_6;
    }
  }
  int v9 = v15 / v8;
  if ((int)(v15 / v8) >= 1)
  {
    if (((a3->mFormatFlags >> 7) & 0x3F) != 0) {
      snprintf(__str, 0x50uLL, ", %d.%d-bit");
    }
    else {
      snprintf(__str, 0x50uLL, ", %d-bit");
    }
    if ((v14 & 2) != 0)
    {
      uint64_t v11 = " BEI";
    }
    else
    {
      int v9 = -v9;
      uint64_t v11 = " LEI";
    }
    strlcat(__str, v11, 0x50uLL);
  }
  return show(a1, a2, v9, a4, __str);
}

uint64_t show(const AudioBufferList *a1, int a2, int a3, const char *a4, const char *a5)
{
  unsigned int v8 = "AudioBufferList";
  if (a4) {
    unsigned int v8 = a4;
  }
  int v9 = "";
  if (a5) {
    int v9 = a5;
  }
  uint64_t result = printf("%s %p (%d fr%s):\n", v8, a1, a2, v9);
  if (a1->mNumberBuffers)
  {
    UInt32 v11 = 0;
    mBuffers = a1->mBuffers;
    int v13 = a3 + 10;
    do
    {
      printf("    [%2d] %5dbytes %dch @ %p", v11, mBuffers->mDataByteSize, mBuffers->mNumberChannels, mBuffers->mData);
      if (a2)
      {
        if (mBuffers->mData)
        {
          putchar(58);
          int v14 = mBuffers->mNumberChannels * a2;
          if (v14 >= 1)
          {
            mData = (unsigned __int8 *)mBuffers->mData;
            unsigned int v16 = v14 + 1;
            do
            {
              switch(v13)
              {
                case 0:
                case 10:
                  mData += 4;
                  goto LABEL_24;
                case 6:
                  mData += 4;
                  goto LABEL_22;
                case 7:
                  int v17 = (mData[2] << 16) | (mData[1] << 8);
                  int v18 = *mData;
                  goto LABEL_20;
                case 8:
                  mData += 2;
                  goto LABEL_18;
                case 9:
                case 11:
                  ++mData;
                  printf(" %02X");
                  break;
                case 12:
                  mData += 2;
LABEL_18:
                  printf(" %04X");
                  break;
                case 13:
                  int v17 = (*mData << 16) | (mData[1] << 8);
                  int v18 = mData[2];
LABEL_20:
                  printf(" %06X", v17 | v18);
                  mData += 3;
                  break;
                case 14:
                  mData += 4;
LABEL_22:
                  printf(" %08X");
                  break;
                case 20:
                  mData += 4;
LABEL_24:
                  printf(" %6.3f");
                  break;
                default:
                  break;
              }
              --v16;
            }
            while (v16 > 1);
          }
        }
      }
      uint64_t result = putchar(10);
      ++v11;
      ++mBuffers;
    }
    while (v11 < a1->mNumberBuffers);
  }
  return result;
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, int a3, const char *a4)
{
  return show(a1, a2, a3, a4, 0);
}

uint64_t CAShowAudioBufferList(const AudioBufferList *a1, int a2, int a3)
{
  return show(a1, a2, a3, 0, 0);
}

_DWORD *CrashIfClientProvidedBogusAudioBufferList(unsigned int *a1, char a2)
{
  unsigned int v4 = *a1;
  uint64_t result = a1 + 2;
  uint64_t v3 = v4;
  if (v4)
  {
    int v5 = 0;
    int v6 = 0;
    unsigned int v7 = &result[4 * v3];
    while (1)
    {
      unsigned int v8 = (_DWORD *)*((void *)result + 1);
      if (v8)
      {
        unsigned int v9 = result[1];
        if (v9 >= 4) {
          v6 += *v8 + *(_DWORD *)((char *)v8 + (v9 & 0xFFFFFFFC) - 4);
        }
      }
      else
      {
        if ((a2 & 1) == 0)
        {
          __break(1u);
          return result;
        }
        int v5 = 1;
      }
      result += 4;
      if (result >= v7) {
        return (_DWORD *)(v5 | v6 & 0xFFFFFFFE);
      }
    }
  }
  int v6 = 0;
  int v5 = 0;
  return (_DWORD *)(v5 | v6 & 0xFFFFFFFE);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

uint64_t DSPGraph::GraphBox::GraphBox(uint64_t a1, uint64_t a2, char a3)
{
  DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)a2);
  DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)a2);
  DSPGraph::Box::Box((DSPGraph::Box *)a1);
  *(void *)a1 = &unk_26D96F4E8;
  *(void *)(a1 + 776) = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 784) = v6;
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  unsigned int v7 = DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)a2);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  std::vector<DSPGraph::GraphIOData>::vector((void *)(a1 + 792), v7, &v31);
  unsigned int v8 = DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)a2);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  std::vector<DSPGraph::GraphIOData>::vector((void *)(a1 + 816), v8, &v31);
  *(unsigned char *)(a1 + 840) = a3;
  if (!*(void *)a2) {
    __assert_rtn("GraphBox", "DSPGraph_GraphBox.cpp", 26, "inGraph");
  }
  unsigned int v9 = *(DSPGraph::Graph **)(a1 + 776);
  int v10 = *((unsigned __int8 *)v9 + 761);
  if (!*((unsigned char *)v9 + 760) || !*((unsigned char *)v9 + 761))
  {
    int v11 = *((unsigned __int8 *)v9 + 762);
    DSPGraph::Graph::uninitialize(v9);
    DSPGraph::Graph::unconfigure(*(DSPGraph::Graph **)(a1 + 776));
    uint64_t v12 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)(a1 + 776));
    DSPGraph::Box::sampleRate(v12);
    DSPGraph::Graph::setSliceDuration();
    if (v10) {
      DSPGraph::Graph::configure(*(DSPGraph::Graph **)(a1 + 776));
    }
    if (v11) {
      DSPGraph::Graph::initialize(*(DSPGraph::Graph **)(a1 + 776));
    }
  }
  if (DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)a2)
    && DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)a2))
  {
    uint64_t v13 = DSPGraph::Graph::in(*(DSPGraph::Graph **)(a1 + 776));
    uint64_t v14 = *(void *)(v13 + 88);
    if (*(void *)(v13 + 96) == v14)
    {
      std::string::basic_string[abi:ne180100]<0>(&v31, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      std::string::basic_string[abi:ne180100]<0>(v37, "out");
      uint64_t v30 = (void *)(v13 + 32);
      if (*(char *)(v13 + 55) < 0) {
        uint64_t v30 = (void *)*v30;
      }
      DSPGraph::strprintf(v36, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v29, v30, (uint64_t)(*(void *)(v13 + 96) - *(void *)(v13 + 88)) >> 5, 0);
      uint64_t result = DSPGraph::ThrowException();
    }
    else
    {
      unsigned int v15 = 0;
      unsigned int v16 = **(double **)((*(uint64_t (**)(uint64_t))(*(void *)v14 + 40))(v14) + 120);
      while (v15 < DSPGraph::Graph::numInputs(*(DSPGraph::Graph **)a2))
      {
        int v17 = (DSPGraph::Box *)DSPGraph::Graph::in(*(DSPGraph::Graph **)a2);
        ++v15;
        if (DSPGraph::Box::sampleRate(v17) != v16)
        {
          std::string::basic_string[abi:ne180100]<0>(&v31, "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/DSPGraph_GraphBox.cpp");
          std::string::basic_string[abi:ne180100]<0>(v37, "GraphBox");
          int v18 = *(DSPGraph::Graph **)a2;
          long long v19 = (void *)(*(void *)a2 + 408);
          if (*((char *)v18 + 431) < 0) {
            long long v19 = (void *)*v19;
          }
          goto LABEL_18;
        }
      }
      unsigned int v23 = 0;
      do
      {
        if (v23 >= DSPGraph::Graph::numOutputs(*(DSPGraph::Graph **)a2)) {
          return a1;
        }
        unint64_t v24 = (DSPGraph::Box *)DSPGraph::Graph::out(*(DSPGraph::Graph **)a2);
        ++v23;
      }
      while (DSPGraph::Box::sampleRate(v24) == v16);
      std::string::basic_string[abi:ne180100]<0>(&v31, "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/DSPGraph_GraphBox.cpp");
      std::string::basic_string[abi:ne180100]<0>(v37, "GraphBox");
      int v18 = *(DSPGraph::Graph **)a2;
      long long v19 = (void *)(*(void *)a2 + 408);
      if (*((char *)v18 + 431) < 0) {
        long long v19 = (void *)*v19;
      }
LABEL_18:
      uint64_t v20 = (*(uint64_t (**)(DSPGraph::Graph *))(*(void *)v18 + 16))(v18);
      DSPGraph::strprintf(v36, (DSPGraph *)"%s %s graph must have the same sample rate for all input and output busses to be used in a GraphBox", v21, v19, v20);
      uint64_t result = DSPGraph::ThrowException();
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v31, "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/DSPGraph_GraphBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(v37, "GraphBox");
    uint64_t v25 = *(DSPGraph::Graph **)a2;
    uint64_t v26 = (void *)(*(void *)a2 + 408);
    if (*((char *)v25 + 431) < 0) {
      uint64_t v26 = (void *)*v26;
    }
    uint64_t v27 = (*(uint64_t (**)(DSPGraph::Graph *))(*(void *)v25 + 16))(v25);
    DSPGraph::strprintf(v36, (DSPGraph *)"%s %s graph must have at least one input and output bus.", v28, v26, v27);
    uint64_t result = DSPGraph::ThrowException();
  }
  __break(1u);
  return result;
}

void sub_225D10418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a31 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v34 - 65) < 0) {
    operator delete(*(void **)(v34 - 88));
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  uint64_t v36 = *v33;
  if (*v33)
  {
    *((void *)v31 + 103) = v36;
    operator delete(v36);
  }
  uint64_t v37 = *v32;
  if (*v32)
  {
    *((void *)v31 + 100) = v37;
    operator delete(v37);
  }
  unint64_t v38 = (std::__shared_weak_count *)*((void *)v31 + 98);
  if (v38) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v38);
  }
  DSPGraph::Box::~Box(v31);
  _Unwind_Resume(a1);
}

void DSPGraph::GraphBox::~GraphBox(DSPGraph::Graph **this)
{
  *this = (DSPGraph::Graph *)&unk_26D96F4E8;
  if (!*((unsigned char *)this + 840)) {
    DSPGraph::Graph::uninitialize(this[97]);
  }
  int v2 = this[102];
  if (v2)
  {
    this[103] = v2;
    operator delete(v2);
  }
  uint64_t v3 = this[99];
  if (v3)
  {
    this[100] = v3;
    operator delete(v3);
  }
  unsigned int v4 = (std::__shared_weak_count *)this[98];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  DSPGraph::Box::~Box((DSPGraph::Box *)this);
}

{
  uint64_t vars8;

  DSPGraph::GraphBox::~GraphBox(this);
  JUMPOUT(0x22A63EB50);
}

uint64_t DSPGraph::GraphBox::initialize(DSPGraph::Graph **this)
{
  DSPGraph::Box::initialize((DSPGraph::Box *)this);
  int v2 = this[97];
  return DSPGraph::Graph::initialize(v2);
}

uint64_t DSPGraph::GraphBox::uninitialize(DSPGraph::Graph **this)
{
  uint64_t result = DSPGraph::Box::uninitialize((DSPGraph::Box *)this);
  if (!*((unsigned char *)this + 840))
  {
    uint64_t v3 = this[97];
    return DSPGraph::Graph::uninitialize(v3);
  }
  return result;
}

uint64_t DSPGraph::GraphBox::prepareGraphIOData(DSPGraph::GraphBox *this, int a2)
{
  if (DSPGraph::Graph::numInputs(*((DSPGraph::Graph **)this + 97)))
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *((void *)this + 8);
      if (v6 >= (*((void *)this + 9) - v7) >> 5) {
        break;
      }
      uint64_t v8 = *(void *)((*(uint64_t (**)(void))(*(void *)(v7 + v5) + 40))() + 56);
      uint64_t v9 = *(void *)(v8 + 80);
      *(void *)(v8 + 8) = *(void *)(*((void *)this + 2) + 256);
      int v10 = *(_DWORD *)(v8 + 72);
      long long v28 = *(_OWORD *)(v8 + 8);
      long long v29 = *(_OWORD *)(v8 + 24);
      long long v30 = *(_OWORD *)(v8 + 40);
      long long v31 = *(_OWORD *)(v8 + 56);
      uint64_t v11 = *((void *)this + 99);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 100) - v11) >> 4) <= v6) {
LABEL_19:
      }
        std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
      uint64_t v12 = v11 + v4;
      *(_DWORD *)uint64_t v12 = a2;
      *(_DWORD *)(v12 + 4) = v10;
      *(_OWORD *)(v12 + 8) = v28;
      *(_OWORD *)(v12 + 24) = v29;
      *(_OWORD *)(v12 + 40) = v30;
      *(_OWORD *)(v12 + 56) = v31;
      *(void *)(v12 + 72) = v9;
      ++v6;
      v5 += 32;
      v4 += 80;
      if (v6 >= DSPGraph::Graph::numInputs(*((DSPGraph::Graph **)this + 97))) {
        goto LABEL_6;
      }
    }
    std::string::basic_string[abi:ne180100]<0>(&v28, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    std::string::basic_string[abi:ne180100]<0>(v33, "in");
    uint64_t v27 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      uint64_t v27 = (void *)*v27;
    }
    DSPGraph::strprintf(v32, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v26, v27, (uint64_t)(*((void *)this + 9) - *((void *)this + 8)) >> 5, v6);
    uint64_t result = DSPGraph::ThrowException();
    goto LABEL_26;
  }
LABEL_6:
  uint64_t result = DSPGraph::Graph::numOutputs(*((DSPGraph::Graph **)this + 97));
  if (result)
  {
    unsigned int v14 = 0;
    while (1)
    {
      uint64_t v15 = *((void *)this + 11);
      if (v14 >= (unint64_t)((*((void *)this + 12) - v15) >> 5))
      {
        std::string::basic_string[abi:ne180100]<0>(&v28, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
        std::string::basic_string[abi:ne180100]<0>(v33, "out");
        uint64_t v25 = (void *)((char *)this + 32);
        if (*((char *)this + 55) < 0) {
          uint64_t v25 = (void *)*v25;
        }
        goto LABEL_25;
      }
      uint64_t v16 = *(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v15 + 32 * v14) + 40))(v15 + 32 * v14)
                      + 56);
      int v17 = *(_DWORD **)(v16 + 80);
      if (*v17) {
        break;
      }
LABEL_13:
      *(void *)(v16 + 8) = *(void *)(*((void *)this + 2) + 256);
      int v21 = *(_DWORD *)(v16 + 72);
      long long v28 = *(_OWORD *)(v16 + 8);
      long long v29 = *(_OWORD *)(v16 + 24);
      long long v30 = *(_OWORD *)(v16 + 40);
      long long v31 = *(_OWORD *)(v16 + 56);
      uint64_t v22 = *((void *)this + 102);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 103) - v22) >> 4) <= v14) {
        goto LABEL_19;
      }
      uint64_t v23 = v22 + 80 * v14;
      *(_DWORD *)uint64_t v23 = a2;
      *(_DWORD *)(v23 + 4) = v21;
      *(_OWORD *)(v23 + 8) = v28;
      *(_OWORD *)(v23 + 24) = v29;
      *(_OWORD *)(v23 + 40) = v30;
      *(_OWORD *)(v23 + 56) = v31;
      *(void *)(v23 + 72) = v17;
      ++v14;
      uint64_t result = DSPGraph::Graph::numOutputs(*((DSPGraph::Graph **)this + 97));
      if (v14 >= result) {
        return result;
      }
    }
    unint64_t v18 = 0;
    uint64_t v19 = 3;
    while (1)
    {
      uint64_t v20 = *((void *)this + 11);
      if (v14 >= (unint64_t)((*((void *)this + 12) - v20) >> 5)) {
        break;
      }
      v17[v19] = *(_DWORD *)(*(void *)((*(uint64_t (**)(uint64_t))(*(void *)(v20 + 32 * v14) + 40))(v20 + 32 * v14)
                                       + 120)
                           + 24)
               * a2;
      ++v18;
      v19 += 4;
      if (v18 >= *v17) {
        goto LABEL_13;
      }
    }
    std::string::basic_string[abi:ne180100]<0>(&v28, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
    std::string::basic_string[abi:ne180100]<0>(v33, "out");
    uint64_t v25 = (void *)((char *)this + 32);
    if (*((char *)this + 55) < 0) {
      uint64_t v25 = (void *)*v25;
    }
LABEL_25:
    DSPGraph::strprintf(v32, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v24, v25, (uint64_t)(*((void *)this + 12) - *((void *)this + 11)) >> 5, v14);
    uint64_t result = DSPGraph::ThrowException();
LABEL_26:
    __break(1u);
  }
  return result;
}

void sub_225D10A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v29 - 81) < 0) {
    operator delete(*(void **)(v29 - 104));
  }
  if (a18 < 0) {
    operator delete(a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t DSPGraph::GraphBox::process(DSPGraph::GraphBox *this, int a2)
{
  if ((*(unsigned int (**)(DSPGraph::GraphBox *))(*(void *)this + 64))(this))
  {
    uint64_t v4 = *((void *)this + 8);
    if (*((void *)this + 9) == v4)
    {
      std::string::basic_string[abi:ne180100]<0>(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      std::string::basic_string[abi:ne180100]<0>(v18, "in");
      uint64_t v13 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        uint64_t v13 = (void *)*v13;
      }
      DSPGraph::strprintf(v17, (DSPGraph *)"Box::in inIndex out of range! box %s has %zu inputs but input %u was requested", v12, v13, (uint64_t)(*((void *)this + 9) - *((void *)this + 8)) >> 5, 0);
      DSPGraph::ThrowException();
    }
    else
    {
      uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 40))(v4);
      uint64_t v6 = *((void *)this + 11);
      if (*((void *)this + 12) != v6)
      {
        uint64_t v7 = *(void *)(v5 + 56);
        if (*(void *)((*(uint64_t (**)(uint64_t))(*(void *)v6 + 40))(v6) + 56) != v7)
        {
          DSPGraph::Buffer::copyFrom();
          DSPGraph::Buffer::copyTimeFrom();
        }
        DSPGraph::GraphBox::prepareGraphIOData(this, a2);
        if (*((void *)this + 103) != *((void *)this + 102))
        {
          uint64_t v8 = *((void *)this + 97);
          return MEMORY[0x270F0FEF0](v8);
        }
LABEL_22:
        std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
      }
      std::string::basic_string[abi:ne180100]<0>(v19, "/AppleInternal/Library/BuildRoots/cb09429a-9ee5-11ef-b491-ce2c30f2a3e7/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS18.2.Internal.sdk/System/Library/PrivateFrameworks/AudioToolboxCore.framework/PrivateHeaders/DSPGraph_Box.h");
      std::string::basic_string[abi:ne180100]<0>(v18, "out");
      uint64_t v15 = (void *)((char *)this + 32);
      if (*((char *)this + 55) < 0) {
        uint64_t v15 = (void *)*v15;
      }
      DSPGraph::strprintf(v17, (DSPGraph *)"Box::out inIndex out of range! box %s has %zu outputs but input %u was requested", v14, v15, (uint64_t)(*((void *)this + 12) - *((void *)this + 11)) >> 5, 0);
      DSPGraph::ThrowException();
    }
    __break(1u);
    goto LABEL_22;
  }
  DSPGraph::GraphBox::prepareGraphIOData(this, a2);
  uint64_t v9 = (DSPGraph::Box *)DSPGraph::Graph::in(*((DSPGraph::Graph **)this + 97));
  DSPGraph::Box::sampleRate(v9);
  DSPGraph::Graph::preflight();
  DSPGraph::Graph::processMultiple();
  uint64_t v10 = *((void *)this + 99);
  if (*((void *)this + 100) == v10) {
    std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
  }
  uint64_t v11 = *(unsigned int *)(v10 + 4);
  return MEMORY[0x270F0FEB0](this, v11, v10 + 8);
}

void sub_225D10D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(exception_object);
}

uint64_t DSPGraph::GraphBox::setParameter(DSPGraph::GraphBox *this, unsigned int a2, int a3, int a4, __n128 a5)
{
  if (a4 | a3)
  {
    std::string::basic_string[abi:ne180100]<0>(v9, "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/DSPGraph_GraphBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(v8, "setParameter");
    std::string::basic_string[abi:ne180100]<0>(v7, "DSPGraph parameters must have global scope and main element.");
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    uint64_t v5 = *(uint64_t (**)(__n128))(**((void **)this + 97) + 40);
    return v5(a5);
  }
  return result;
}

void sub_225D10E74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t DSPGraph::GraphBox::getParameter(DSPGraph::GraphBox *this, unsigned int a2, int a3, int a4)
{
  if (a4 | a3)
  {
    std::string::basic_string[abi:ne180100]<0>(v8, "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/DSPGraph_GraphBox.cpp");
    std::string::basic_string[abi:ne180100]<0>(v7, "getParameter");
    std::string::basic_string[abi:ne180100]<0>(v6, "DSPGraph parameters must have global scope and main element.");
    uint64_t result = DSPGraph::ThrowException();
    __break(1u);
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(**((void **)this + 97) + 48);
    return v4();
  }
  return result;
}

void sub_225D10F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v21 - 17) < 0) {
    operator delete(*(void **)(v21 - 40));
  }
  _Unwind_Resume(exception_object);
}

uint64_t DSPGraph::GraphBox::getParameterList@<X0>(uint64_t this@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (!a2) {
    return MEMORY[0x270F0FFA8](*(void *)(this + 776));
  }
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  return this;
}

void DSPGraph::GraphBox::getParameterInfo(int a1@<W1>, uint64_t a2@<X8>)
{
  if (a1)
  {
    char v3 = 0;
    *(_DWORD *)a2 = 1852204065;
  }
  else
  {
    *(void *)(a2 + 96) = 0;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    char v3 = 1;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  *(unsigned char *)(a2 + 104) = v3;
}

unint64_t DSPGraph::GraphBox::selfLatencyInTicks(DSPGraph::Graph **this)
{
  if (!DSPGraph::Graph::numOutputs(this[97])) {
    return 0;
  }
  unsigned int v2 = 0;
  unint64_t v3 = 0;
  do
  {
    uint64_t v4 = (DSPGraph::Box *)DSPGraph::Graph::out(this[97]);
    unint64_t v5 = DSPGraph::Box::totalLatencyInTicks(v4);
    if (v3 <= v5) {
      unint64_t v3 = v5;
    }
    ++v2;
  }
  while (v2 < DSPGraph::Graph::numOutputs(this[97]));
  return v3;
}

uint64_t DSPGraph::GraphBox::setMaxFrames(DSPGraph::GraphBox *this, int a2)
{
  uint64_t result = *((void *)this + 97);
  if (*(_DWORD *)(result + 688) != a2)
  {
    int v4 = *(unsigned __int8 *)(result + 762);
    if (*(unsigned char *)(result + 762))
    {
      DSPGraph::Graph::uninitialize((DSPGraph::Graph *)result);
      uint64_t result = *((void *)this + 97);
    }
    DSPGraph::Graph::unconfigure((DSPGraph::Graph *)result);
    unint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::out(*((DSPGraph::Graph **)this + 97));
    DSPGraph::Box::sampleRate(v5);
    (*(void (**)(DSPGraph::GraphBox *))(*(void *)this + 128))(this);
    DSPGraph::Graph::setSliceDuration();
    uint64_t result = DSPGraph::Graph::configure(*((DSPGraph::Graph **)this + 97));
    if (v4)
    {
      uint64_t v6 = (DSPGraph::Graph *)*((void *)this + 97);
      return DSPGraph::Graph::initialize(v6);
    }
  }
  return result;
}

DSPGraph::Graph *DSPGraph::GraphBox::setUsesFixedBlockSize(DSPGraph::GraphBox *this, int a2)
{
  uint64_t result = (DSPGraph::Graph *)*((void *)this + 97);
  if ((((*((unsigned char *)result + 760) != 0) ^ a2) & 1) == 0)
  {
    int v4 = *((unsigned __int8 *)result + 762);
    if (*((unsigned char *)result + 762))
    {
      DSPGraph::Graph::uninitialize(result);
      uint64_t result = (DSPGraph::Graph *)*((void *)this + 97);
    }
    DSPGraph::Graph::unconfigure(result);
    unint64_t v5 = (DSPGraph::Box *)DSPGraph::Graph::out(*((DSPGraph::Graph **)this + 97));
    DSPGraph::Box::sampleRate(v5);
    DSPGraph::Graph::setSliceDuration();
    uint64_t result = (DSPGraph::Graph *)DSPGraph::Graph::configure(*((DSPGraph::Graph **)this + 97));
    if (v4)
    {
      uint64_t v6 = (DSPGraph::Graph *)*((void *)this + 97);
      return (DSPGraph::Graph *)DSPGraph::Graph::initialize(v6);
    }
  }
  return result;
}

const char *DSPGraph::GraphBox::ClassName(DSPGraph::GraphBox *this)
{
  return "GraphBox";
}

uint64_t DSPGraph::Box::canBypass(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::isBypassed(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::canProcessInPlace(DSPGraph::Box *this)
{
  return 0;
}

BOOL DSPGraph::GraphBox::usesFixedBlockSize(DSPGraph::GraphBox *this)
{
  return *(unsigned char *)(*((void *)this + 97) + 760) == 0;
}

double DSPGraph::GraphBox::desc@<D0>(uint64_t a1@<X8>)
{
  double result = 2.04737529e190;
  *(_OWORD *)a1 = xmmword_225D3B2A0;
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t DSPGraph::Box::asAUBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asBoxProxy(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asGraphInput(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asGraphOutput(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asFCBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asSRCBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asFreqSRCBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asOperativeFCBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asOperativeSRCBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::asOperativeFreqSRCBox(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::GraphBox::hasPresetData(DSPGraph::GraphBox *this)
{
  return 0;
}

void DSPGraph::Box::getComponentName(unsigned char *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t DSPGraph::Box::isLatencyDelay(DSPGraph::Box *this)
{
  return 0;
}

uint64_t DSPGraph::Box::isFrequencySafe(DSPGraph::Box *this)
{
  return 1;
}

uint64_t DSPGraph::GraphBox::reset(DSPGraph::Graph **this)
{
  return DSPGraph::Graph::reset(this[97]);
}

void *std::vector<DSPGraph::GraphIOData>::vector(void *a1, unint64_t a2, _OWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<DSPGraph::GraphIOData>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v6 = (_OWORD *)a1[1];
    uint64_t v7 = &v6[5 * a2];
    uint64_t v8 = 80 * a2;
    do
    {
      *uint64_t v6 = *a3;
      long long v9 = a3[1];
      long long v10 = a3[2];
      long long v11 = a3[4];
      void v6[3] = a3[3];
      v6[4] = v11;
      v6[1] = v9;
      v6[2] = v10;
      v6 += 5;
      v8 -= 80;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_225D1136C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<DSPGraph::GraphIOData>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[80 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

void sub_225D11F64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_225D12168(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_225D12398(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t CATimeUtilities::GetCurrentGregorianDate(CATimeUtilities *this)
{
  double Current = CFAbsoluteTimeGetCurrent();
  return CATimeUtilities::GregorianDateFromAbsoluteTime(v1, Current);
}

uint64_t CATimeUtilities::GregorianDateFromAbsoluteTime(CATimeUtilities *this, CFAbsoluteTime a2)
{
  {
    CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz = (uint64_t)CFTimeZoneCopySystem();
  }
  CFTimeZoneRef v3 = (const __CFTimeZone *)CATimeUtilities::GregorianDateFromAbsoluteTime(double)::tz;
  return *(_OWORD *)&CFAbsoluteTimeGetGregorianDate(a2, v3);
}

void sub_225D128F0(_Unwind_Exception *a1)
{
}

uint64_t RamstadKernelFactory::ReferenceRamstadKernel(uint64_t **this, int a2, int a3, double a4, int a5)
{
  for (uint64_t i = *this; ; ++i)
  {
    if (i == this[1]) {
      operator new();
    }
    uint64_t v6 = *i;
    if (*(_DWORD *)(*i + 16) == a3
      && *(double *)v6 == a4
      && *(_DWORD *)(v6 + 12) == a2
      && *(unsigned __int8 *)(v6 + 20) == a5)
    {
      break;
    }
  }
  ++*(_DWORD *)(v6 + 8);
  return v6;
}

void sub_225D12A88(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v1, 0x1080C40F6A78312);
  _Unwind_Resume(a1);
}

uint64_t RamstadKernelFactory::ReleaseRamstadKernel(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(_DWORD *)(a2 + 8) - 1;
    *(_DWORD *)(a2 + 8) = v3;
    if (!v3)
    {
      uint64_t v4 = result;
      uint64_t v6 = *(void **)result;
      unint64_t v5 = *(void **)(result + 8);
      uint64_t v7 = (uint64_t)v5 - *(void *)result;
      if (v5 != *(void **)result)
      {
        uint64_t v8 = v7 >> 3;
        if ((unint64_t)(v7 >> 3) <= 1) {
          uint64_t v8 = 1;
        }
        size_t v9 = v7 - 8;
        do
        {
          if (*v6 == a2)
          {
            if (v6 + 1 != v5) {
              memmove(v6, v6 + 1, v9);
            }
            *(void *)(v4 + 8) = (char *)v6 + (v9 & 0xFFFFFFFFFFFFFFF8);
            long long v10 = *(void **)(a2 + 48);
            if (v10)
            {
              *(void *)(a2 + 56) = v10;
              operator delete(v10);
            }
            long long v11 = *(void **)(a2 + 24);
            if (v11)
            {
              *(void *)(a2 + 32) = v11;
              operator delete(v11);
            }
            JUMPOUT(0x22A63EB50);
          }
          ++v6;
          v9 -= 8;
          --v8;
        }
        while (v8);
      }
    }
  }
  return result;
}

uint64_t RamstadKernelFactoryD::ReferenceRamstadKernel(uint64_t **this, int a2, int a3, double a4, int a5)
{
  for (uint64_t i = *this; ; ++i)
  {
    if (i == this[1]) {
      operator new();
    }
    uint64_t v6 = *i;
    if (*(_DWORD *)(*i + 16) == a3
      && *(double *)v6 == a4
      && *(_DWORD *)(v6 + 12) == a2
      && *(unsigned __int8 *)(v6 + 20) == a5)
    {
      break;
    }
  }
  ++*(_DWORD *)(v6 + 8);
  return v6;
}

void sub_225D12D24(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v1, 0x1080C40F6A78312);
  _Unwind_Resume(a1);
}

uint64_t RamstadKernelFactoryD::ReleaseRamstadKernel(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    int v3 = *(_DWORD *)(a2 + 8) - 1;
    *(_DWORD *)(a2 + 8) = v3;
    if (!v3)
    {
      uint64_t v4 = result;
      uint64_t v6 = *(void **)result;
      unint64_t v5 = *(void **)(result + 8);
      uint64_t v7 = (uint64_t)v5 - *(void *)result;
      if (v5 != *(void **)result)
      {
        uint64_t v8 = v7 >> 3;
        if ((unint64_t)(v7 >> 3) <= 1) {
          uint64_t v8 = 1;
        }
        size_t v9 = v7 - 8;
        do
        {
          if (*v6 == a2)
          {
            if (v6 + 1 != v5) {
              memmove(v6, v6 + 1, v9);
            }
            *(void *)(v4 + 8) = (char *)v6 + (v9 & 0xFFFFFFFFFFFFFFF8);
            long long v10 = *(void **)(a2 + 48);
            if (v10)
            {
              *(void *)(a2 + 56) = v10;
              operator delete(v10);
            }
            long long v11 = *(void **)(a2 + 24);
            if (v11)
            {
              *(void *)(a2 + 32) = v11;
              operator delete(v11);
            }
            JUMPOUT(0x22A63EB50);
          }
          ++v6;
          v9 -= 8;
          --v8;
        }
        while (v8);
      }
    }
  }
  return result;
}

void RamstadKernel::RamstadKernel(RamstadKernel *this, int a2, int a3, double a4, int a5)
{
  *(double *)this = a4;
  double v6 = 1.0 / (double)a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 3) = a2;
  *((_DWORD *)this + 4) = a3;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  memset(v16, 0, sizeof(v16));
  uint64_t v15 = 0;
  uint64_t v7 = (char **)((char *)this + 48);
  int v8 = a5 + a3;
  memset(v14, 0, sizeof(v14));
  if (a2 > 10)
  {
    *((_DWORD *)this + 3) = 11;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 24, 0, 4uLL, (char *)v16);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)v7, *v7, 4 * v8, (char *)v16);
    uint64_t v11 = *((void *)this + 3);
    ramstadPrecalculateCoeffs<float>(*((_DWORD *)this + 3), (uint64_t)&kRamstadASRCPoles22, (uint64_t)&kRamstadASRCResidues22, (uint64_t)v14, (float *)v11, (float *)(v11 + 64), *(double *)this);
    *(_OWORD *)(v11 + 48) = *(_OWORD *)(v11 + 32);
    *(_OWORD *)(v11 + 112) = *(_OWORD *)(v11 + 96);
    if (v8 >= 1)
    {
      uint64_t v12 = (uint64_t)(*v7 + 64);
      double v13 = 0.0;
      do
      {
        ramstadBackEndCoeffs<float>(*((_DWORD *)this + 3), (uint64_t)v14, (float *)(v12 - 64), (_DWORD *)v12, v13);
        *(_OWORD *)(v12 - 16) = *(_OWORD *)(v12 - 32);
        *(_OWORD *)(v12 + 48) = *(_OWORD *)(v12 + 32);
        v12 += 128;
        double v13 = v6 + v13;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    *((_DWORD *)this + 3) = 8;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 24, 0, 2uLL, (char *)v16);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)v7, *v7, 2 * v8, (char *)v16);
    ramstadPrecalculateCoeffs<float>(*((_DWORD *)this + 3), (uint64_t)&kRamstadASRCPoles16, (uint64_t)&kRamstadASRCResidues16, (uint64_t)v14, *((float **)this + 3), (float *)(*((void *)this + 3) + 32), *(double *)this);
    if (v8 >= 1)
    {
      size_t v9 = *v7;
      double v10 = 0.0;
      do
      {
        ramstadBackEndCoeffs<float>(*((_DWORD *)this + 3), (uint64_t)v14, (float *)v9, (_DWORD *)v9 + 8, v10);
        v9 += 64;
        double v10 = v6 + v10;
        --v8;
      }
      while (v8);
    }
  }
}

void sub_225D13050(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 56) = v5;
    operator delete(v5);
  }
  double v6 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 32) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(uint64_t a1, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = __src;
  if (a3)
  {
    unint64_t v5 = a4;
    uint64_t v10 = *(void *)(a1 + 16);
    uint64_t v8 = a1 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = *(char **)(v8 - 8);
    if (a3 <= (v10 - (uint64_t)v11) >> 5)
    {
      uint64_t v18 = v11 - __src;
      uint64_t v19 = *(char **)(v8 - 8);
      uint64_t v20 = a3;
      if (a3 <= (v11 - __src) >> 5) {
        goto LABEL_15;
      }
      uint64_t v21 = 0;
      uint64_t v20 = v18 >> 5;
      uint64_t v19 = &v11[32 * (a3 - (v18 >> 5))];
      uint64_t v22 = 32 * a3 - 32 * (v18 >> 5);
      do
      {
        uint64_t v23 = &v11[v21];
        long long v24 = *((_OWORD *)a4 + 1);
        *(_OWORD *)uint64_t v23 = *(_OWORD *)a4;
        *((_OWORD *)v23 + 1) = v24;
        v21 += 32;
      }
      while (v22 != v21);
      *(void *)(a1 + 8) = v19;
      if (v11 != __src)
      {
LABEL_15:
        uint64_t v25 = &__src[32 * a3];
        uint64_t v26 = &v19[-32 * a3];
        uint64_t v27 = v19;
        if (v26 < v11)
        {
          uint64_t v27 = v19;
          do
          {
            long long v28 = *(_OWORD *)v26;
            long long v29 = *((_OWORD *)v26 + 1);
            v26 += 32;
            *(_OWORD *)uint64_t v27 = v28;
            *((_OWORD *)v27 + 1) = v29;
            v27 += 32;
          }
          while (v26 < v11);
        }
        *(void *)(a1 + 8) = v27;
        if (v19 != v25) {
          memmove(&v19[-32 * ((v19 - v25) >> 5)], __src, v19 - v25);
        }
        if (v4 <= v5)
        {
          if (*(void *)(a1 + 8) <= (unint64_t)v5) {
            unint64_t v30 = 0;
          }
          else {
            unint64_t v30 = a3;
          }
          v5 += 32 * v30;
        }
        long long v31 = v4;
        do
        {
          long long v32 = *((_OWORD *)v5 + 1);
          *(_OWORD *)long long v31 = *(_OWORD *)v5;
          *((_OWORD *)v31 + 1) = v32;
          v31 += 32;
          --v20;
        }
        while (v20);
      }
    }
    else
    {
      uint64_t v12 = *(unsigned char **)a1;
      unint64_t v13 = a3 + ((uint64_t)&v11[-*(void *)a1] >> 5);
      if (v13 >> 59) {
        std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = (__src - v12) >> 5;
      uint64_t v15 = v9 - (void)v12;
      if (v15 >> 4 > v13) {
        unint64_t v13 = v15 >> 4;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v13;
      }
      uint64_t v42 = v8;
      if (v16) {
        int v17 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv8_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v8, v16);
      }
      else {
        int v17 = 0;
      }
      long long v33 = &v17[32 * v14];
      AudioStreamBasicDescription __p = v17;
      unint64_t v39 = v33;
      unint64_t v41 = &v17[32 * v16];
      uint64_t v34 = 32 * a3;
      long long v35 = &v33[32 * a3];
      do
      {
        long long v36 = *((_OWORD *)v5 + 1);
        *(_OWORD *)long long v33 = *(_OWORD *)v5;
        *((_OWORD *)v33 + 1) = v36;
        v33 += 32;
        v34 -= 32;
      }
      while (v34);
      unint64_t v40 = v35;
      uint64_t v4 = _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_((void **)a1, (uint64_t)&__p, v4);
      if (v40 != v39) {
        v40 += (v39 - v40 + 31) & 0xFFFFFFFFFFFFFFE0;
      }
      if (__p) {
        operator delete(__p);
      }
    }
  }
  return v4;
}

void sub_225D13274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ramstadPrecalculateCoeffs<float>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, float *a5, float *a6, double a7)
{
  if (a1 >= 1)
  {
    double v9 = a7 * 3.14159265;
    uint64_t v10 = a1;
    uint64_t v11 = (double *)(a4 + 176);
    uint64_t v12 = (double *)(a3 + 8);
    unint64_t v13 = (double *)(a2 + 8);
    do
    {
      long double v14 = v9 * *(v13 - 1);
      double v15 = *v13;
      v13 += 2;
      double v16 = v9 * v15;
      double v17 = exp(v14);
      float v18 = (v17 + v17) * cos(v9 * v15);
      *a5++ = v18;
      float v19 = exp(v14 + v14);
      *a6++ = -v19;
      long double v20 = v9 * *(v12 - 1);
      double v21 = *v12;
      v12 += 2;
      long double v22 = hypot(v20, v9 * v21);
      *(v11 - 22) = v22 + v22;
      *(v11 - 11) = atan2(v9 * v21, v20);
      *uint64_t v11 = v14;
      v11[22] = v17;
      v11[11] = v16;
      ++v11;
      --v10;
    }
    while (v10);
  }
}

void ramstadBackEndCoeffs<float>(int a1, uint64_t a2, float *a3, _DWORD *a4, double a5)
{
  if (a1 >= 1)
  {
    uint64_t v8 = a1;
    double v9 = (double *)(a2 + 176);
    do
    {
      double v10 = *(v9 - 22);
      long double v11 = v10 * exp(*v9 * a5);
      double v12 = *(v9 - 11);
      double v13 = v9[11];
      double v14 = cos(v12 + v13 * a5);
      double v15 = v9[22];
      long double v16 = cos(v12 - v13 + v13 * a5);
      float v17 = v11 * v14;
      *a3++ = v17;
      *(float *)&long double v16 = v11 * -(v15 * v16);
      *a4++ = LODWORD(v16);
      ++v9;
      --v8;
    }
    while (v8);
  }
}

void RamstadKernelD::RamstadKernelD(RamstadKernelD *this, int a2, int a3, double a4, int a5)
{
  *(double *)this = a4;
  *((_DWORD *)this + 3) = a2;
  *((_DWORD *)this + 4) = a3;
  double v6 = 1.0 / (double)a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  memset(v20, 0, sizeof(v20));
  uint64_t v19 = 0;
  uint64_t v7 = (char **)((char *)this + 48);
  int v8 = a5 + a3;
  memset(v18, 0, sizeof(v18));
  if (a2 > 10)
  {
    *((_DWORD *)this + 3) = 11;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 24, 0, 4uLL, v20);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)v7, *v7, 4 * v8, v20);
    uint64_t v11 = *((void *)this + 3);
    ramstadPrecalculateCoeffs<double>(*((_DWORD *)this + 3), (uint64_t)&kRamstadASRCPoles22, (uint64_t)&kRamstadASRCResidues22, (uint64_t)v18, (long double *)v11, (long double *)(v11 + 128), *(double *)this);
    long long v12 = *(_OWORD *)(v11 + 80);
    *(_OWORD *)(v11 + 96) = *(_OWORD *)(v11 + 64);
    *(_OWORD *)(v11 + 112) = v12;
    long long v13 = *(_OWORD *)(v11 + 208);
    *(_OWORD *)(v11 + 224) = *(_OWORD *)(v11 + 192);
    *(_OWORD *)(v11 + 240) = v13;
    if (v8 >= 1)
    {
      uint64_t v14 = (uint64_t)(*v7 + 128);
      double v15 = 0.0;
      do
      {
        ramstadBackEndCoeffs<double>(*((_DWORD *)this + 3), (uint64_t)v18, (double *)(v14 - 128), (double *)v14, v15);
        long long v16 = *(_OWORD *)(v14 - 48);
        *(_OWORD *)(v14 - 32) = *(_OWORD *)(v14 - 64);
        *(_OWORD *)(v14 - 16) = v16;
        long long v17 = *(_OWORD *)(v14 + 80);
        *(_OWORD *)(v14 + 96) = *(_OWORD *)(v14 + 64);
        *(_OWORD *)(v14 + 112) = v17;
        v14 += 256;
        double v15 = v6 + v15;
        --v8;
      }
      while (v8);
    }
  }
  else
  {
    *((_DWORD *)this + 3) = 8;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 24, 0, 2uLL, v20);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)v7, *v7, 2 * v8, v20);
    ramstadPrecalculateCoeffs<double>(*((_DWORD *)this + 3), (uint64_t)&kRamstadASRCPoles16, (uint64_t)&kRamstadASRCResidues16, (uint64_t)v18, *((long double **)this + 3), (long double *)(*((void *)this + 3) + 64), *(double *)this);
    if (v8 >= 1)
    {
      double v9 = *v7;
      double v10 = 0.0;
      do
      {
        ramstadBackEndCoeffs<double>(*((_DWORD *)this + 3), (uint64_t)v18, (double *)v9, (double *)v9 + 8, v10);
        v9 += 128;
        double v10 = v6 + v10;
        --v8;
      }
      while (v8);
    }
  }
}

void sub_225D13684(_Unwind_Exception *exception_object)
{
  unint64_t v5 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 56) = v5;
    operator delete(v5);
  }
  double v6 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 32) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

long long *_ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_(uint64_t a1, char *__src, unint64_t a3, long long *a4)
{
  uint64_t v4 = (long long *)__src;
  if (a3)
  {
    unint64_t v5 = a4;
    uint64_t v10 = *(void *)(a1 + 16);
    uint64_t v8 = a1 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = *(char **)(v8 - 8);
    if (a3 <= (v10 - (uint64_t)v11) >> 6)
    {
      uint64_t v18 = v11 - __src;
      uint64_t v19 = *(char **)(v8 - 8);
      uint64_t v20 = a3;
      if (a3 <= (v11 - __src) >> 6) {
        goto LABEL_15;
      }
      uint64_t v21 = 0;
      uint64_t v20 = v18 >> 6;
      uint64_t v19 = &v11[64 * (a3 - (v18 >> 6))];
      uint64_t v22 = (a3 << 6) - (v18 >> 6 << 6);
      do
      {
        uint64_t v23 = &v11[v21];
        long long v25 = *a4;
        long long v24 = a4[1];
        long long v26 = a4[3];
        *((_OWORD *)v23 + 2) = a4[2];
        *((_OWORD *)v23 + 3) = v26;
        *(_OWORD *)uint64_t v23 = v25;
        *((_OWORD *)v23 + 1) = v24;
        v21 += 64;
      }
      while (v22 != v21);
      *(void *)(a1 + 8) = v19;
      if (v11 != __src)
      {
LABEL_15:
        uint64_t v27 = &__src[64 * a3];
        long long v28 = &v19[-64 * a3];
        long long v29 = v19;
        if (v28 < v11)
        {
          long long v29 = v19;
          do
          {
            long long v31 = *(_OWORD *)v28;
            long long v30 = *((_OWORD *)v28 + 1);
            long long v32 = *((_OWORD *)v28 + 3);
            *((_OWORD *)v29 + 2) = *((_OWORD *)v28 + 2);
            *((_OWORD *)v29 + 3) = v32;
            *(_OWORD *)long long v29 = v31;
            *((_OWORD *)v29 + 1) = v30;
            v29 += 64;
            v28 += 64;
          }
          while (v28 < v11);
        }
        *(void *)(a1 + 8) = v29;
        if (v19 != v27) {
          memmove(&v19[-64 * ((v19 - v27) >> 6)], __src, v19 - v27);
        }
        if (v4 <= v5)
        {
          if (*(void *)(a1 + 8) <= (unint64_t)v5) {
            unint64_t v33 = 0;
          }
          else {
            unint64_t v33 = a3;
          }
          v5 += 4 * v33;
        }
        uint64_t v34 = v4;
        do
        {
          long long v36 = *v5;
          long long v35 = v5[1];
          long long v37 = v5[3];
          v34[2] = v5[2];
          v34[3] = v37;
          long long *v34 = v36;
          v34[1] = v35;
          v34 += 4;
          --v20;
        }
        while (v20);
      }
    }
    else
    {
      long long v12 = *(unsigned char **)a1;
      unint64_t v13 = a3 + ((uint64_t)&v11[-*(void *)a1] >> 6);
      if (v13 >> 58) {
        std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v14 = (__src - v12) >> 6;
      uint64_t v15 = v9 - (void)v12;
      if (v15 >> 5 > v13) {
        unint64_t v13 = v15 >> 5;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v16 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v13;
      }
      uint64_t v49 = v8;
      if (v16) {
        long long v17 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv8_dEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(v8, v16);
      }
      else {
        long long v17 = 0;
      }
      unint64_t v38 = &v17[64 * v14];
      AudioStreamBasicDescription __p = v17;
      uint64_t v46 = v38;
      UInt32 v48 = &v17[64 * v16];
      unint64_t v39 = a3 << 6;
      unint64_t v40 = &v38[64 * a3];
      do
      {
        long long v42 = *v5;
        long long v41 = v5[1];
        long long v43 = v5[3];
        *((_OWORD *)v38 + 2) = v5[2];
        *((_OWORD *)v38 + 3) = v43;
        *(_OWORD *)unint64_t v38 = v42;
        *((_OWORD *)v38 + 1) = v41;
        v38 += 64;
        v39 -= 64;
      }
      while (v39);
      int v47 = v40;
      uint64_t v4 = _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_((void **)a1, (uint64_t)&__p, v4);
      if (v47 != v46) {
        v47 += (v46 - v47 + 63) & 0xFFFFFFFFFFFFFFC0;
      }
      if (__p) {
        operator delete(__p);
      }
    }
  }
  return v4;
}

void sub_225D138CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ramstadPrecalculateCoeffs<double>(int a1, uint64_t a2, uint64_t a3, uint64_t a4, long double *a5, long double *a6, double a7)
{
  if (a1 >= 1)
  {
    double v9 = a7 * 3.14159265;
    uint64_t v10 = a1;
    uint64_t v11 = (double *)(a4 + 176);
    long long v12 = (double *)(a3 + 8);
    unint64_t v13 = (double *)(a2 + 8);
    do
    {
      long double v14 = v9 * *(v13 - 1);
      double v15 = *v13;
      v13 += 2;
      double v16 = v9 * v15;
      double v17 = exp(v14);
      *a5++ = (v17 + v17) * cos(v9 * v15);
      *a6++ = -exp(v14 + v14);
      long double v18 = v9 * *(v12 - 1);
      double v19 = *v12;
      v12 += 2;
      long double v20 = hypot(v18, v9 * v19);
      *(v11 - 22) = v20 + v20;
      *(v11 - 11) = atan2(v9 * v19, v18);
      *uint64_t v11 = v14;
      v11[22] = v17;
      v11[11] = v16;
      ++v11;
      --v10;
    }
    while (v10);
  }
}

void ramstadBackEndCoeffs<double>(int a1, uint64_t a2, double *a3, double *a4, double a5)
{
  if (a1 >= 1)
  {
    uint64_t v8 = a1;
    double v9 = (double *)(a2 + 176);
    do
    {
      double v10 = *(v9 - 22);
      long double v11 = v10 * exp(*v9 * a5);
      double v12 = *(v9 - 11);
      double v13 = v9[11];
      double v14 = cos(v12 + v13 * a5);
      double v15 = v9[22];
      long double v16 = cos(v12 - v13 + v13 * a5);
      *a3++ = v11 * v14;
      *a4++ = v11 * -(v15 * v16);
      ++v9;
      --v8;
    }
    while (v8);
  }
}

void RamstadSRC::RamstadSRC(RamstadSRC *this, double a2, double a3, int a4, int a5)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((double *)this + 2) = a2;
  *((double *)this + 3) = a3;
  *((_DWORD *)this + 8) = a4;
  *((_DWORD *)this + 14) = 0;
  *((_DWORD *)this + 18) = 1;
  *((unsigned char *)this + 76) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  if (a5 > 63)
  {
    *((_DWORD *)this + 10) = 11;
    if (a5 > 0x5F)
    {
      char v5 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    *((_DWORD *)this + 10) = 8;
  }
  char v5 = 0;
LABEL_6:
  *((unsigned char *)this + 77) = v5;
  double v6 = floor(a2);
  BOOL v7 = v6 == a2;
  double v8 = a2 / a3;
  if (!v7) {
    goto LABEL_28;
  }
  double v9 = floor(a3);
  if (v9 != a3) {
    goto LABEL_28;
  }
  int v10 = (int)v6;
  int v11 = (int)v9;
  int v12 = (int)v6 >= 0 ? (int)v6 : -v10;
  int v13 = v11 >= 0 ? (int)v9 : -v11;
  if (v12 >= 2 && v13 >= 2)
  {
    do
    {
      if (v12 <= v13) {
        unsigned int v15 = v13;
      }
      else {
        unsigned int v15 = v12;
      }
      if (v12 < v13) {
        int v13 = v12;
      }
      int v12 = v15 % v13;
    }
    while ((int)(v15 % v13) > 0);
  }
  else
  {
    int v13 = 1;
  }
  int v16 = v11 / v13;
  if (v16 <= 1280)
  {
    *((unsigned char *)this + 76) = 1;
    int v17 = v10 / v13;
    *((_DWORD *)this + 9) = v16;
    *((_DWORD *)this + 11) = v17 / v16;
    *((_DWORD *)this + 12) = v17;
    *((_DWORD *)this + 13) = v17 % v16;
  }
  else
  {
LABEL_28:
    *((void *)this + 10) = 0x3E80000000000000;
    *((unsigned char *)this + 76) = 0;
    *((_DWORD *)this + 9) = 256;
    uint64_t v18 = vcvtmd_s64_f64(v8);
    *((_DWORD *)this + 11) = v18;
    signed int v19 = vcvtmd_s64_f64((v8 - floor(v8)) * 2147483650.0);
    *((_DWORD *)this + 13) = v19;
    *((void *)this + 8) = (v18 << 32 >> 1) + v19;
    *((void *)this + 29) = -1;
    *((_DWORD *)this + 60) = -1;
  }
  *((_DWORD *)this + 14) = 0;
  RamstadSRC::initFilter(this, 1.0 / v8);
}

void sub_225D13C6C(_Unwind_Exception *exception_object)
{
  uint64_t v4 = (void *)v1[26];
  if (v4)
  {
    v1[27] = v4;
    operator delete(v4);
  }
  char v5 = (void *)v1[23];
  if (v5)
  {
    v1[24] = v5;
    operator delete(v5);
  }
  double v6 = (void *)v1[20];
  if (v6)
  {
    v1[21] = v6;
    operator delete(v6);
  }
  BOOL v7 = (void *)v1[17];
  if (v7)
  {
    v1[18] = v7;
    operator delete(v7);
  }
  double v8 = (void *)v1[14];
  if (v8)
  {
    v1[15] = v8;
    operator delete(v8);
  }
  double v9 = *v2;
  if (*v2)
  {
    v1[12] = v9;
    operator delete(v9);
  }
  _Unwind_Resume(exception_object);
}

uint64_t RamstadSRC::initQuality(uint64_t this, int a2)
{
  if (a2 <= 63)
  {
    *(_DWORD *)(this + 40) = 8;
LABEL_5:
    char v2 = 0;
    goto LABEL_6;
  }
  *(_DWORD *)(this + 40) = 11;
  if (a2 <= 0x5F) {
    goto LABEL_5;
  }
  char v2 = 1;
LABEL_6:
  *(unsigned char *)(this + 77) = v2;
  return this;
}

double RamstadSRC::useInterpolationMethod(RamstadSRC *this, double a2)
{
  *((void *)this + 10) = 0x3E80000000000000;
  *((unsigned char *)this + 76) = 0;
  *((_DWORD *)this + 9) = 256;
  uint64_t v2 = vcvtmd_s64_f64(a2);
  *((_DWORD *)this + 11) = v2;
  signed int v3 = vcvtmd_s64_f64((a2 - floor(a2)) * 2147483650.0);
  *((void *)this + 8) = (v2 << 32 >> 1) + v3;
  double result = NAN;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  *((_DWORD *)this + 13) = v3;
  *((_DWORD *)this + 14) = 0;
  return result;
}

char *RamstadSRC::initFilter(RamstadSRC *this, double a2)
{
  *((_DWORD *)this + 18) = 1;
  if (a2 >= 1.0) {
    double v3 = 0.907029478;
  }
  else {
    double v3 = a2 * 0.907029478;
  }
  int v4 = 3 * *((_DWORD *)this + 8);
  if (v4 >= -1) {
    int v5 = v4 + 1;
  }
  else {
    int v5 = v4 + 2;
  }
  int v6 = v5 >> 1;
  if (*((_DWORD *)this + 10) == 8) {
    int v7 = *((_DWORD *)this + 8);
  }
  else {
    int v7 = v6;
  }
  unint64_t v8 = v7;
  if (*((unsigned char *)this + 77))
  {
    long long v14 = 0uLL;
    long long v15 = 0uLL;
    long long v12 = 0uLL;
    long long v13 = 0uLL;
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 136, *((char **)this + 17), v7, &v12);
    _ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 160, *((char **)this + 20), v8, &v12);
    {
      RamstadKernelFactoryD::RamstadKernelFactoryD((RamstadKernelFactoryD *)&GetKernelFactoryD(void)::sFactory);
      __cxa_atexit((void (*)(void *))RamstadKernelFactoryD::~RamstadKernelFactoryD, &GetKernelFactoryD(void)::sFactory, &dword_225CD5000);
    }
    *((void *)this + 1) = RamstadKernelFactoryD::ReferenceRamstadKernel((uint64_t **)&GetKernelFactoryD(void)::sFactory, *((_DWORD *)this + 10), *((_DWORD *)this + 9), v3, *((unsigned char *)this + 76) == 0);
  }
  else
  {
    long long v12 = 0uLL;
    long long v13 = 0uLL;
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 88, *((char **)this + 11), v7, (char *)&v12);
    _ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE6insertENS_11__wrap_iterIPKS1_EEmRS6_((uint64_t)this + 112, *((char **)this + 14), v8, (char *)&v12);
    GetKernelFactory();
    *(void *)this = RamstadKernelFactory::ReferenceRamstadKernel((uint64_t **)&GetKernelFactory(void)::sFactory, *((_DWORD *)this + 10), *((_DWORD *)this + 9), v3, *((unsigned char *)this + 76) == 0);
  }
  unint64_t v9 = *((int *)this + 8);
  LODWORD(v12) = 0;
  std::vector<float>::assign((char **)this + 23, v9, &v12);
  unint64_t v10 = *((int *)this + 8);
  LODWORD(v12) = 0;
  return std::vector<float>::assign((char **)this + 26, v10, &v12);
}

void sub_225D13F20(_Unwind_Exception *a1)
{
}

void RamstadSRC::RamstadSRC(RamstadSRC *this, double a2, double a3, int a4, int a5, double a6)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((double *)this + 2) = a2;
  *((double *)this + 3) = a3;
  *((_DWORD *)this + 8) = a4;
  *((_DWORD *)this + 14) = 0;
  *((_DWORD *)this + 18) = 1;
  *((unsigned char *)this + 76) = 0;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  if (a5 <= 63)
  {
    *((_DWORD *)this + 10) = 8;
LABEL_5:
    char v6 = 0;
    goto LABEL_6;
  }
  *((_DWORD *)this + 10) = 11;
  if (a5 <= 0x5F) {
    goto LABEL_5;
  }
  char v6 = 1;
LABEL_6:
  *((unsigned char *)this + 77) = v6;
  double v7 = a2 / a3;
  *((void *)this + 10) = 0x3E80000000000000;
  *((unsigned char *)this + 76) = 0;
  *((_DWORD *)this + 9) = 256;
  uint64_t v8 = vcvtmd_s64_f64(v7);
  *((_DWORD *)this + 11) = v8;
  signed int v9 = vcvtmd_s64_f64((v7 - floor(v7)) * 2147483650.0);
  *((void *)this + 8) = (v8 << 32 >> 1) + v9;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  *((_DWORD *)this + 13) = v9;
  *((_DWORD *)this + 14) = 0;
  RamstadSRC::initFilter(this, (1.0 - a6) / v7);
}

void sub_225D14060(_Unwind_Exception *exception_object)
{
  int v4 = (void *)v1[26];
  if (v4)
  {
    v1[27] = v4;
    operator delete(v4);
  }
  int v5 = (void *)v1[23];
  if (v5)
  {
    v1[24] = v5;
    operator delete(v5);
  }
  char v6 = (void *)v1[20];
  if (v6)
  {
    v1[21] = v6;
    operator delete(v6);
  }
  double v7 = (void *)v1[17];
  if (v7)
  {
    v1[18] = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)v1[14];
  if (v8)
  {
    v1[15] = v8;
    operator delete(v8);
  }
  signed int v9 = *v2;
  if (*v2)
  {
    v1[12] = v9;
    operator delete(v9);
  }
  _Unwind_Resume(exception_object);
}

double RamstadSRC::setRate@<D0>(RamstadSRC *this@<X0>, double a2@<D0>, uint64_t a3@<X8>)
{
  LODWORD(a3) = vcvtmd_s64_f64(a2);
  *((_DWORD *)this + 11) = a3;
  signed int v3 = vcvtmd_s64_f64((a2 - floor(a2)) * 2147483650.0);
  *((_DWORD *)this + 13) = v3;
  *((void *)this + 8) = (a3 << 32 >> 1) + v3;
  double result = NAN;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  return result;
}

void GetKernelFactory(void)
{
  {
    RamstadKernelFactory::RamstadKernelFactory((RamstadKernelFactory *)&GetKernelFactory(void)::sFactory);
    __cxa_atexit((void (*)(void *))RamstadKernelFactory::~RamstadKernelFactory, &GetKernelFactory(void)::sFactory, &dword_225CD5000);
  }
}

void sub_225D141A4(_Unwind_Exception *a1)
{
}

char *std::vector<float>::assign(char **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6 = (uint64_t)a1[2];
  double result = *a1;
  if (a2 <= (v6 - (uint64_t)result) >> 2)
  {
    long long v13 = a1[1];
    unint64_t v14 = (v13 - result) >> 2;
    if (v14 >= a2) {
      uint64_t v15 = a2;
    }
    else {
      uint64_t v15 = (v13 - result) >> 2;
    }
    if (v15)
    {
      int v16 = result;
      do
      {
        *(_DWORD *)int v16 = *a3;
        v16 += 4;
        --v15;
      }
      while (v15);
    }
    if (a2 <= v14)
    {
      a1[1] = &result[4 * a2];
    }
    else
    {
      int v17 = &v13[4 * (a2 - v14)];
      uint64_t v18 = 4 * a2 - 4 * v14;
      do
      {
        *(_DWORD *)long long v13 = *a3;
        v13 += 4;
        v18 -= 4;
      }
      while (v18);
      a1[1] = v17;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 >> 62) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v8 = v6 >> 1;
    if (v6 >> 1 <= a2) {
      uint64_t v8 = a2;
    }
    if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v9 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    double result = std::vector<float>::__vallocate[abi:ne180100](a1, v9);
    unint64_t v10 = a1[1];
    int v11 = &v10[4 * a2];
    uint64_t v12 = 4 * a2;
    do
    {
      *(_DWORD *)unint64_t v10 = *a3;
      v10 += 4;
      v12 -= 4;
    }
    while (v12);
    a1[1] = v11;
  }
  return result;
}

void RamstadSRC::~RamstadSRC(RamstadSRC *this)
{
  GetKernelFactory();
  RamstadKernelFactory::ReleaseRamstadKernel((uint64_t)&GetKernelFactory(void)::sFactory, *(void *)this);
  uint64_t v2 = (void *)*((void *)this + 26);
  if (v2)
  {
    *((void *)this + 27) = v2;
    operator delete(v2);
  }
  signed int v3 = (void *)*((void *)this + 23);
  if (v3)
  {
    *((void *)this + 24) = v3;
    operator delete(v3);
  }
  int v4 = (void *)*((void *)this + 20);
  if (v4)
  {
    *((void *)this + 21) = v4;
    operator delete(v4);
  }
  int v5 = (void *)*((void *)this + 17);
  if (v5)
  {
    *((void *)this + 18) = v5;
    operator delete(v5);
  }
  uint64_t v6 = (void *)*((void *)this + 14);
  if (v6)
  {
    *((void *)this + 15) = v6;
    operator delete(v6);
  }
  double v7 = (void *)*((void *)this + 11);
  if (v7)
  {
    *((void *)this + 12) = v7;
    operator delete(v7);
  }
}

void RamstadSRC::reset(RamstadSRC *this)
{
  *((_DWORD *)this + 14) = 0;
  *((_DWORD *)this + 18) = 1;
  if (*((unsigned char *)this + 77))
  {
    uint64_t v2 = (void *)*((void *)this + 17);
    uint64_t v3 = *((void *)this + 18) - (void)v2;
    if (v3 >= 1) {
      bzero(v2, ((((unint64_t)v3 >> 6) - ((unint64_t)v3 > 0x3F)) << 6) + 64);
    }
    int v4 = (void *)*((void *)this + 20);
    uint64_t v5 = *((void *)this + 21) - (void)v4;
    if (v5 >= 1)
    {
      unint64_t v6 = (unint64_t)v5 >> 6;
      BOOL v7 = (unint64_t)v5 > 0x3F;
      char v8 = 6;
LABEL_10:
      bzero(v4, (v6 - v7 + 1) << v8);
    }
  }
  else
  {
    unint64_t v9 = (void *)*((void *)this + 11);
    uint64_t v10 = *((void *)this + 12) - (void)v9;
    if (v10 >= 1) {
      bzero(v9, 32 * (((unint64_t)v10 >> 5) - ((unint64_t)v10 > 0x1F)) + 32);
    }
    int v4 = (void *)*((void *)this + 14);
    uint64_t v11 = *((void *)this + 15) - (void)v4;
    if (v11 >= 1)
    {
      unint64_t v6 = (unint64_t)v11 >> 5;
      BOOL v7 = (unint64_t)v11 > 0x1F;
      char v8 = 5;
      goto LABEL_10;
    }
  }
}

double RamstadSRC::processMono(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  if (*((_DWORD *)this + 8) != 1)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A63EA30](exception, "RamstadSRC::processMono, wrong channel count");
  }
  RamstadSRC::checkPreflight(this, a4, a5);
  if (*((unsigned char *)this + 77))
  {
    if (*((unsigned char *)this + 76)) {
      RamstadSRC::processMonoIntD(this, a2, a3, a4, a5, a6, a7);
    }
    else {
      RamstadSRC::processMonoFracD(this, a2, a3, a4, a5, a6, a7);
    }
  }
  else if (*((unsigned char *)this + 76))
  {
    RamstadSRC::processMonoInt(this, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    RamstadSRC::processMonoFrac(this, a2, a3, a4, a5, a6, a7);
  }
  double result = NAN;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  return result;
}

void sub_225D1456C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  *(void *)(v1 + 232) = -1;
  *(_DWORD *)(v1 + 240) = -1;
  _Unwind_Resume(a1);
}

_DWORD *RamstadSRC::checkPreflight(_DWORD *this, int a2, int a3)
{
  int v4 = this;
  int v5 = this[60];
  if (v5 == -1)
  {
    int v7 = 0;
    this = (_DWORD *)RamstadSRC::outputSamplesForInputSamples((RamstadSRC *)this, a2, &v7);
    if (v4[60] == a3) {
      return this;
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A63EA30](exception, "RamstadSRC process called without preflight and arguments don't match preflight.");
LABEL_10:
  }
  if (v5 != a3)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A63EA30](exception, "RamstadSRC process called for different number of output samples than preflight.");
    goto LABEL_10;
  }
  if (this[58] > a2 || this[59] < a2)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A63EA30](exception, "RamstadSRC process called for number of input samples than outside range of preflight.");
    goto LABEL_10;
  }
  return this;
}

void sub_225D1467C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t RamstadSRC::crashIfClientProvidedBogusBuffer(RamstadSRC *this, const float *a2, int a3)
{
  if (a3 < 1) {
    return 0;
  }
  if (a2) {
    return (LODWORD(a2[a3 - 1]) + *(_DWORD *)a2);
  }
  return result;
}

uint64_t RamstadSRC::processMonoIntD(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *((void *)this + 1);
  uint64_t v11 = *(float64x2_t **)(v10 + 24);
  uint64_t v12 = *(void *)(v10 + 48);
  long long v13 = (float64x2_t *)*((void *)this + 17);
  unint64_t v14 = (float64x2_t *)*((void *)this + 20);
  int v15 = *((_DWORD *)this + 9);
  int v16 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v17 = 0;
      LODWORD(v18) = 0;
      do
      {
        float64x2_t v20 = v13[2];
        float64x2_t v19 = v13[3];
        int v21 = v9;
        float64x2_t v23 = *v13;
        float64x2_t v22 = v13[1];
        if (v9 >= 1)
        {
          do
          {
            float64x2_t v24 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v25 = vmlaq_f64(v24, v20, v11[2]);
            float64x2_t v26 = vmlaq_f64(v24, v19, v11[3]);
            float64x2_t v27 = vmlaq_f64(v24, v23, *v11);
            float64x2_t v28 = vmlaq_f64(vmlaq_f64(v24, v22, v11[1]), v14[1], v11[5]);
            float64x2_t v29 = vmlaq_f64(v27, *v14, v11[4]);
            float64x2_t v30 = vmlaq_f64(v26, v14[3], v11[7]);
            float64x2_t v31 = vmlaq_f64(v25, v14[2], v11[6]);
            float64x2_t *v14 = v23;
            v14[1] = v22;
            void v14[2] = v20;
            v14[3] = v19;
            v13[2] = v31;
            v13[3] = v30;
            a2 += a6;
            float64x2_t v23 = v29;
            *long long v13 = v29;
            v13[1] = v28;
            float64x2_t v22 = v28;
            float64x2_t v20 = v31;
            float64x2_t v19 = v30;
            --v21;
          }
          while (v21);
        }
        uint64_t v18 = (v18 + v9);
        long long v32 = (float64x2_t *)(v12 + ((uint64_t)(2 * v7) << 6));
        float v33 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v32[4], *v14), v23, *v32), vmlaq_f64(vmulq_f64(v32[6], v14[2]), v20, v32[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v32[5], v14[1]), v22, v32[1]), vmlaq_f64(vmulq_f64(v32[7], v14[3]), v19, v32[3]))));
        *a3 = v33;
        a3 += a7;
        int v34 = v7 + v8;
        if (v34 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v34 < v15) {
          int v35 = 0;
        }
        else {
          int v35 = v15;
        }
        int v7 = v34 - v35;
        ++v17;
      }
      while (v17 != a5);
    }
    int v62 = a4 - v18;
    if (a4 > (int)v18)
    {
      if (v9 < v62) {
        int v62 = v9;
      }
      if (v62 >= 1)
      {
        float64x2_t v64 = v13[2];
        float64x2_t v63 = v13[3];
        float64x2_t v66 = *v13;
        float64x2_t v65 = v13[1];
        int v67 = v62;
        do
        {
          float64x2_t v68 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v69 = vmlaq_f64(v68, v64, v11[2]);
          float64x2_t v70 = vmlaq_f64(v68, v63, v11[3]);
          float64x2_t v71 = vmlaq_f64(v68, v66, *v11);
          float64x2_t v72 = vmlaq_f64(vmlaq_f64(v68, v65, v11[1]), v14[1], v11[5]);
          float64x2_t v73 = vmlaq_f64(v71, *v14, v11[4]);
          float64x2_t v74 = vmlaq_f64(v70, v14[3], v11[7]);
          float64x2_t v75 = vmlaq_f64(v69, v14[2], v11[6]);
          float64x2_t *v14 = v66;
          v14[1] = v65;
          void v14[2] = v64;
          v14[3] = v63;
          v13[2] = v75;
          v13[3] = v74;
          a2 += a6;
          float64x2_t v66 = v73;
          *long long v13 = v73;
          v13[1] = v72;
          float64x2_t v65 = v72;
          float64x2_t v64 = v75;
          float64x2_t v63 = v74;
          --v67;
        }
        while (v67);
      }
LABEL_44:
      v9 -= v62;
      uint64_t v18 = (v62 + v18);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v36 = 0;
      LODWORD(v18) = 0;
      do
      {
        if (v9 < 1)
        {
          float64x2_t v53 = v13[6];
          float64x2_t v52 = v13[7];
          float64x2_t v55 = v13[4];
          float64x2_t v54 = v13[5];
        }
        else
        {
          int v37 = v9;
          do
          {
            float64x2_t v38 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v39 = *v13;
            float64x2_t v40 = v13[1];
            float64x2_t v41 = v13[2];
            float64x2_t v42 = v13[3];
            float64x2_t v43 = vmlaq_f64(vmlaq_f64(v38, *v13, *v11), *v14, v11[8]);
            float64x2_t v44 = vmlaq_f64(vmlaq_f64(v38, v40, v11[1]), v14[1], v11[9]);
            float64x2_t v45 = vmlaq_f64(vmlaq_f64(v38, v41, v11[2]), v14[2], v11[10]);
            float64x2_t v46 = vmlaq_f64(vmlaq_f64(v38, v42, v11[3]), v14[3], v11[11]);
            void v14[2] = v41;
            v14[3] = v42;
            float64x2_t *v14 = v39;
            v14[1] = v40;
            v13[2] = v45;
            v13[3] = v46;
            *long long v13 = v43;
            v13[1] = v44;
            float64x2_t v48 = v13[4];
            float64x2_t v47 = v13[5];
            float64x2_t v50 = v13[6];
            float64x2_t v49 = v13[7];
            float64x2_t v51 = vmlaq_f64(v38, v48, v11[4]);
            float64x2_t v52 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v49, v11[7]), v14[7], v11[15]);
            float64x2_t v53 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v50, v11[6]), v14[6], v11[14]);
            float64x2_t v54 = vmlaq_f64(vmlaq_f64(v38, v47, v11[5]), v14[5], v11[13]);
            float64x2_t v55 = vmlaq_f64(v51, v14[4], v11[12]);
            v14[4] = v48;
            void v14[5] = v47;
            v14[6] = v50;
            v14[7] = v49;
            v13[6] = v53;
            v13[7] = v52;
            v13[4] = v55;
            v13[5] = v54;
            a2 += a6;
            --v37;
          }
          while (v37);
        }
        uint64_t v18 = (v18 + v9);
        unsigned int v56 = (float64x2_t *)(v12 + ((uint64_t)(4 * v7) << 6));
        float64x2_t v57 = vmlaq_f64(vmulq_f64(v56[13], v14[5]), v54, v56[5]);
        int64x2_t v58 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v56[8], *v14), *v13, *v56), vmlaq_f64(vmulq_f64(v56[10], v14[2]), v13[2], v56[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v56[9], v14[1]), v13[1], v56[1]), vmlaq_f64(vmulq_f64(v56[11], v14[3]), v13[3], v56[3])));
        int64x2_t v59 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v56[12], v14[4]), v55, v56[4]), vmlaq_f64(vmulq_f64(v56[14], v14[6]), v53, v56[6])), vaddq_f64(v57, vmlaq_f64(vmulq_f64(v56[15], v14[7]), v52, v56[7])));
        *(float *)v58.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v58, v59), (float64x2_t)vzip2q_s64(v58, v59)));
        *a3 = *(float *)v58.i32;
        a3 += a7;
        int v60 = v7 + v8;
        if (v60 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v60 < v15) {
          int v61 = 0;
        }
        else {
          int v61 = v15;
        }
        int v7 = v60 - v61;
        ++v36;
      }
      while (v36 != a5);
    }
    int v62 = a4 - v18;
    if (a4 > (int)v18)
    {
      if (v9 < v62) {
        int v62 = v9;
      }
      if (v62 >= 1)
      {
        int v76 = v62;
        do
        {
          float64x2_t v77 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v78 = *v13;
          float64x2_t v79 = v13[1];
          float64x2_t v80 = v13[2];
          float64x2_t v81 = v13[3];
          float64x2_t v82 = vmlaq_f64(vmlaq_f64(v77, *v13, *v11), *v14, v11[8]);
          float64x2_t v83 = vmlaq_f64(vmlaq_f64(v77, v79, v11[1]), v14[1], v11[9]);
          float64x2_t v84 = vmlaq_f64(vmlaq_f64(v77, v80, v11[2]), v14[2], v11[10]);
          float64x2_t v85 = vmlaq_f64(vmlaq_f64(v77, v81, v11[3]), v14[3], v11[11]);
          void v14[2] = v80;
          v14[3] = v81;
          float64x2_t *v14 = v78;
          v14[1] = v79;
          v13[2] = v84;
          v13[3] = v85;
          *long long v13 = v82;
          v13[1] = v83;
          float64x2_t v87 = v13[4];
          float64x2_t v86 = v13[5];
          float64x2_t v89 = v13[6];
          float64x2_t v88 = v13[7];
          float64x2_t v90 = vmlaq_f64(v77, v87, v11[4]);
          float64x2_t v91 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v88, v11[7]), v14[7], v11[15]);
          float64x2_t v92 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v89, v11[6]), v14[6], v11[14]);
          float64x2_t v93 = vmlaq_f64(vmlaq_f64(v77, v86, v11[5]), v14[5], v11[13]);
          float64x2_t v94 = vmlaq_f64(v90, v14[4], v11[12]);
          v14[4] = v87;
          void v14[5] = v86;
          v14[6] = v89;
          v14[7] = v88;
          v13[6] = v92;
          v13[7] = v91;
          v13[4] = v94;
          v13[5] = v93;
          a2 += a6;
          --v76;
        }
        while (v76);
      }
      goto LABEL_44;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v18;
}

uint64_t RamstadSRC::processMonoFracD(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  unsigned int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *((void *)this + 1);
  uint64_t v11 = *(float64x2_t **)(v10 + 24);
  uint64_t v12 = *(void *)(v10 + 48);
  long long v13 = (float64x2_t *)*((void *)this + 17);
  unint64_t v14 = (float64x2_t *)*((void *)this + 20);
  int v15 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      LODWORD(v16) = 0;
      for (int i = 0; i != a5; ++i)
      {
        float64x2_t v19 = v13[2];
        float64x2_t v18 = v13[3];
        int v20 = v9;
        float64x2_t v22 = *v13;
        float64x2_t v21 = v13[1];
        if (v9 >= 1)
        {
          do
          {
            float64x2_t v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v24 = vmlaq_f64(v23, v19, v11[2]);
            float64x2_t v25 = vmlaq_f64(v23, v18, v11[3]);
            float64x2_t v26 = vmlaq_f64(v23, v22, *v11);
            float64x2_t v27 = vmlaq_f64(vmlaq_f64(v23, v21, v11[1]), v14[1], v11[5]);
            float64x2_t v28 = vmlaq_f64(v26, *v14, v11[4]);
            float64x2_t v29 = vmlaq_f64(v25, v14[3], v11[7]);
            float64x2_t v30 = vmlaq_f64(v24, v14[2], v11[6]);
            float64x2_t *v14 = v22;
            v14[1] = v21;
            void v14[2] = v19;
            v14[3] = v18;
            v13[2] = v30;
            v13[3] = v29;
            a2 += a6;
            float64x2_t v22 = v28;
            *long long v13 = v28;
            v13[1] = v27;
            float64x2_t v21 = v27;
            float64x2_t v19 = v30;
            float64x2_t v18 = v29;
            --v20;
          }
          while (v20);
        }
        uint64_t v16 = (v16 + v9);
        uint64_t v31 = (v7 >> 22) & 0x1FE;
        long long v32 = (float64x2_t *)(v12 + (v31 << 6));
        float v33 = (float64x2_t *)(v12 + ((unint64_t)(v31 + 2) << 6));
        float64x2_t v34 = v14[2];
        float64x2_t v35 = v14[3];
        float64x2_t v36 = v14[1];
        int64x2_t v37 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v32[4], *v14), v22, *v32), vmlaq_f64(vmulq_f64(v32[6], v34), v19, v32[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v32[5], v36), v21, v32[1]), vmlaq_f64(vmulq_f64(v32[7], v35), v18, v32[3])));
        int64x2_t v38 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v14, v33[4]), v22, *v33), vmlaq_f64(vmulq_f64(v34, v33[6]), v19, v33[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v36, v33[5]), v21, v33[1]), vmlaq_f64(vmulq_f64(v35, v33[7]), v18, v33[3])));
        float64x2_t v39 = vaddq_f64((float64x2_t)vzip1q_s64(v38, v37), (float64x2_t)vzip2q_s64(v38, v37));
        *(float *)v39.f64 = v39.f64[1] + *((double *)this + 10) * (double)(v7 & 0x7FFFFF) * (v39.f64[0] - v39.f64[1]);
        *a3 = *(float *)v39.f64;
        a3 += a7;
        LODWORD(v33) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v33 >> 31);
      }
    }
    int v79 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v79) {
        int v79 = v9;
      }
      if (v79 >= 1)
      {
        float64x2_t v81 = v13[2];
        float64x2_t v80 = v13[3];
        float64x2_t v83 = *v13;
        float64x2_t v82 = v13[1];
        int v84 = v79;
        do
        {
          float64x2_t v85 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v86 = vmlaq_f64(v85, v81, v11[2]);
          float64x2_t v87 = vmlaq_f64(v85, v80, v11[3]);
          float64x2_t v88 = vmlaq_f64(v85, v83, *v11);
          float64x2_t v89 = vmlaq_f64(vmlaq_f64(v85, v82, v11[1]), v14[1], v11[5]);
          float64x2_t v90 = vmlaq_f64(v88, *v14, v11[4]);
          float64x2_t v91 = vmlaq_f64(v87, v14[3], v11[7]);
          float64x2_t v92 = vmlaq_f64(v86, v14[2], v11[6]);
          float64x2_t *v14 = v83;
          v14[1] = v82;
          void v14[2] = v81;
          v14[3] = v80;
          v13[2] = v92;
          v13[3] = v91;
          a2 += a6;
          float64x2_t v83 = v90;
          *long long v13 = v90;
          v13[1] = v89;
          float64x2_t v82 = v89;
          float64x2_t v81 = v92;
          float64x2_t v80 = v91;
          --v84;
        }
        while (v84);
      }
LABEL_32:
      v9 -= v79;
      uint64_t v16 = (v79 + v16);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v16 = 0;
    }
    else
    {
      LODWORD(v16) = 0;
      for (int j = 0; j != a5; ++j)
      {
        if (v9 < 1)
        {
          float64x2_t v57 = v13[6];
          float64x2_t v56 = v13[7];
          float64x2_t v59 = v13[4];
          float64x2_t v58 = v13[5];
        }
        else
        {
          int v41 = v9;
          do
          {
            float64x2_t v42 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
            float64x2_t v43 = *v13;
            float64x2_t v44 = v13[1];
            float64x2_t v45 = v13[2];
            float64x2_t v46 = v13[3];
            float64x2_t v47 = vmlaq_f64(vmlaq_f64(v42, *v13, *v11), *v14, v11[8]);
            float64x2_t v48 = vmlaq_f64(vmlaq_f64(v42, v44, v11[1]), v14[1], v11[9]);
            float64x2_t v49 = vmlaq_f64(vmlaq_f64(v42, v45, v11[2]), v14[2], v11[10]);
            float64x2_t v50 = vmlaq_f64(vmlaq_f64(v42, v46, v11[3]), v14[3], v11[11]);
            void v14[2] = v45;
            v14[3] = v46;
            float64x2_t *v14 = v43;
            v14[1] = v44;
            v13[2] = v49;
            v13[3] = v50;
            *long long v13 = v47;
            v13[1] = v48;
            float64x2_t v52 = v13[4];
            float64x2_t v51 = v13[5];
            float64x2_t v54 = v13[6];
            float64x2_t v53 = v13[7];
            float64x2_t v55 = vmlaq_f64(v42, v52, v11[4]);
            float64x2_t v56 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v53, v11[7]), v14[7], v11[15]);
            float64x2_t v57 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v54, v11[6]), v14[6], v11[14]);
            float64x2_t v58 = vmlaq_f64(vmlaq_f64(v42, v51, v11[5]), v14[5], v11[13]);
            float64x2_t v59 = vmlaq_f64(v55, v14[4], v11[12]);
            v14[4] = v52;
            void v14[5] = v51;
            v14[6] = v54;
            v14[7] = v53;
            v13[6] = v57;
            v13[7] = v56;
            v13[4] = v59;
            v13[5] = v58;
            a2 += a6;
            --v41;
          }
          while (v41);
        }
        uint64_t v16 = (v16 + v9);
        uint64_t v60 = (v7 >> 21) & 0x3FC;
        int v61 = (float64x2_t *)(v12 + (v60 << 6));
        int v62 = (float64x2_t *)(v12 + ((unint64_t)(v60 + 4) << 6));
        float64x2_t v63 = v13[1];
        float64x2_t v65 = v13[2];
        float64x2_t v64 = v13[3];
        float64x2_t v66 = v14[2];
        float64x2_t v67 = v14[3];
        float64x2_t v68 = v14[1];
        float64x2_t v69 = v14[6];
        float64x2_t v70 = v14[7];
        float64x2_t v71 = v14[4];
        float64x2_t v72 = v14[5];
        int64x2_t v73 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v61[8], *v14), *v13, *v61), vmlaq_f64(vmulq_f64(v61[10], v66), v65, v61[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v61[9], v68), v63, v61[1]), vmlaq_f64(vmulq_f64(v61[11], v67), v64, v61[3])));
        int64x2_t v74 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v61[12], v71), v59, v61[4]), vmlaq_f64(vmulq_f64(v61[14], v69), v57, v61[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v61[13], v72), v58, v61[5]), vmlaq_f64(vmulq_f64(v61[15], v70), v56, v61[7])));
        float64x2_t v75 = vmlaq_f64(vmulq_f64(v72, v62[13]), v58, v62[5]);
        int64x2_t v76 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v14, v62[8]), *v13, *v62), vmlaq_f64(vmulq_f64(v66, v62[10]), v65, v62[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v68, v62[9]), v63, v62[1]), vmlaq_f64(vmulq_f64(v67, v62[11]), v64, v62[3])));
        int64x2_t v77 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v71, v62[12]), v59, v62[4]), vmlaq_f64(vmulq_f64(v69, v62[14]), v57, v62[6])), vaddq_f64(v75, vmlaq_f64(vmulq_f64(v70, v62[15]), v56, v62[7])));
        float64x2_t v78 = vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v76, v73), (float64x2_t)vzip2q_s64(v76, v73)), vaddq_f64((float64x2_t)vzip1q_s64(v77, v74), (float64x2_t)vzip2q_s64(v77, v74)));
        *(float *)v78.f64 = v78.f64[1] + *((double *)this + 10) * (double)(v7 & 0x7FFFFF) * (v78.f64[0] - v78.f64[1]);
        *a3 = *(float *)v78.f64;
        a3 += a7;
        LODWORD(v62) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v62 >> 31);
      }
    }
    int v79 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v79) {
        int v79 = v9;
      }
      if (v79 >= 1)
      {
        int v93 = v79;
        do
        {
          float64x2_t v94 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*a2), 0);
          float64x2_t v95 = *v13;
          float64x2_t v96 = v13[1];
          float64x2_t v97 = v13[2];
          float64x2_t v98 = v13[3];
          float64x2_t v99 = vmlaq_f64(vmlaq_f64(v94, *v13, *v11), *v14, v11[8]);
          float64x2_t v100 = vmlaq_f64(vmlaq_f64(v94, v96, v11[1]), v14[1], v11[9]);
          float64x2_t v101 = vmlaq_f64(vmlaq_f64(v94, v97, v11[2]), v14[2], v11[10]);
          float64x2_t v102 = vmlaq_f64(vmlaq_f64(v94, v98, v11[3]), v14[3], v11[11]);
          void v14[2] = v97;
          v14[3] = v98;
          float64x2_t *v14 = v95;
          v14[1] = v96;
          v13[2] = v101;
          v13[3] = v102;
          *long long v13 = v99;
          v13[1] = v100;
          float64x2_t v104 = v13[4];
          float64x2_t v103 = v13[5];
          float64x2_t v106 = v13[6];
          float64x2_t v105 = v13[7];
          float64x2_t v107 = vmlaq_f64(v94, v104, v11[4]);
          float64x2_t v108 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v105, v11[7]), v14[7], v11[15]);
          float64x2_t v109 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v106, v11[6]), v14[6], v11[14]);
          float64x2_t v110 = vmlaq_f64(vmlaq_f64(v94, v103, v11[5]), v14[5], v11[13]);
          float64x2_t v111 = vmlaq_f64(v107, v14[4], v11[12]);
          v14[4] = v104;
          void v14[5] = v103;
          v14[6] = v106;
          v14[7] = v105;
          v13[6] = v109;
          v13[7] = v108;
          v13[4] = v111;
          v13[5] = v110;
          a2 += a6;
          --v93;
        }
        while (v93);
      }
      goto LABEL_32;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v16;
}

uint64_t RamstadSRC::processMonoInt(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 24);
  uint64_t v11 = *(void *)(*(void *)this + 48);
  uint64_t v12 = (float32x4_t *)*((void *)this + 11);
  long long v13 = (float32x4_t *)*((void *)this + 14);
  int v14 = *((_DWORD *)this + 9);
  int v15 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      int v16 = 0;
      LODWORD(v17) = 0;
      do
      {
        float32x4_t v19 = *v12;
        float32x4_t v20 = v12[1];
        int v21 = v9;
        if (v9 >= 1)
        {
          do
          {
            float32x4_t v22 = vld1q_dup_f32(a2);
            uint64_t v18 = 4 * a6;
            a2 = (const float *)((char *)a2 + v18);
            float32x4_t v23 = vmlaq_f32(v22, v20, v10[1]);
            float32x4_t v24 = vmlaq_f32(vmlaq_f32(v22, v19, *v10), *v13, v10[2]);
            float32x4_t v25 = vmlaq_f32(v23, v13[1], v10[3]);
            *long long v13 = v19;
            v13[1] = v20;
            *uint64_t v12 = v24;
            v12[1] = v25;
            float32x4_t v19 = v24;
            float32x4_t v20 = v25;
            --v21;
          }
          while (v21);
        }
        uint64_t v17 = (v17 + v9);
        int8x16_t v26 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 32), *v13), v19, *(float32x4_t *)(v11 + 64 * v7)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 48), v13[1]), v20, *(float32x4_t *)(v11 + 64 * v7 + 16)));
        *a3 = vaddv_f32(vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v26, v26, 8uLL)));
        a3 += a7;
        int v27 = v7 + v8;
        if (v27 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v27 < v14) {
          int v28 = 0;
        }
        else {
          int v28 = v14;
        }
        int v7 = v27 - v28;
        ++v16;
      }
      while (v16 != a5);
    }
    int v46 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v46) {
        int v46 = v9;
      }
      if (v46 >= 1)
      {
        float32x4_t v48 = *v12;
        float32x4_t v47 = v12[1];
        int v50 = v46;
        do
        {
          float32x4_t v51 = vld1q_dup_f32(a2);
          uint64_t v49 = 4 * a6;
          a2 = (const float *)((char *)a2 + v49);
          float32x4_t v52 = vmlaq_f32(v51, v47, v10[1]);
          float32x4_t v53 = vmlaq_f32(vmlaq_f32(v51, v48, *v10), *v13, v10[2]);
          float32x4_t v54 = vmlaq_f32(v52, v13[1], v10[3]);
          *long long v13 = v48;
          v13[1] = v47;
          *uint64_t v12 = v53;
          v12[1] = v54;
          float32x4_t v48 = v53;
          float32x4_t v47 = v54;
          --v50;
        }
        while (v50);
      }
LABEL_44:
      v9 -= v46;
      uint64_t v17 = (v46 + v17);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      int v29 = 0;
      LODWORD(v17) = 0;
      do
      {
        if (v9 < 1)
        {
          float32x4_t v39 = v12[2];
          float32x4_t v38 = v12[3];
        }
        else
        {
          int v31 = v9;
          do
          {
            float32x4_t v32 = vld1q_dup_f32(a2);
            uint64_t v30 = 4 * a6;
            a2 = (const float *)((char *)a2 + v30);
            float32x4_t v33 = v12[1];
            float32x4_t v34 = vmlaq_f32(vmlaq_f32(v32, *v12, *v10), *v13, v10[4]);
            float32x4_t v35 = vmlaq_f32(vmlaq_f32(v32, v33, v10[1]), v13[1], v10[5]);
            *long long v13 = *v12;
            v13[1] = v33;
            *uint64_t v12 = v34;
            v12[1] = v35;
            float32x4_t v36 = v12[2];
            float32x4_t v37 = v12[3];
            float32x4_t v38 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v37, v10[3]), v13[3], v10[7]);
            float32x4_t v39 = vmlaq_f32(vmlaq_f32(v32, v36, v10[2]), v13[2], v10[6]);
            v13[2] = v36;
            v13[3] = v37;
            v12[2] = v39;
            void v12[3] = v38;
            --v31;
          }
          while (v31);
        }
        uint64_t v17 = (v17 + v9);
        float64x2_t v40 = (float32x4_t *)(v11 + 128 * v7);
        float32x4_t v41 = vmlaq_f32(vmulq_f32(v40[6], v13[2]), v39, v40[2]);
        int8x16_t v42 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40[4], *v13), *v12, *v40), vmlaq_f32(vmulq_f32(v40[5], v13[1]), v12[1], v40[1]));
        *(float32x2_t *)v42.i8 = vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL));
        int8x16_t v43 = (int8x16_t)vaddq_f32(v41, vmlaq_f32(vmulq_f32(v40[7], v13[3]), v38, v40[3]));
        *(float32x2_t *)v43.i8 = vadd_f32(*(float32x2_t *)v43.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v43, v43, 8uLL));
        *a3 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v42.i8, *(int32x2_t *)v43.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v42.i8, *(int32x2_t *)v43.i8)));
        a3 += a7;
        int v44 = v7 + v8;
        if (v44 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v44 < v14) {
          int v45 = 0;
        }
        else {
          int v45 = v14;
        }
        int v7 = v44 - v45;
        ++v29;
      }
      while (v29 != a5);
    }
    int v46 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v46) {
        int v46 = v9;
      }
      if (v46 >= 1)
      {
        int v56 = v46;
        do
        {
          float32x4_t v57 = vld1q_dup_f32(a2);
          uint64_t v55 = 4 * a6;
          a2 = (const float *)((char *)a2 + v55);
          float32x4_t v58 = v12[1];
          float32x4_t v59 = vmlaq_f32(vmlaq_f32(v57, *v12, *v10), *v13, v10[4]);
          float32x4_t v60 = vmlaq_f32(vmlaq_f32(v57, v58, v10[1]), v13[1], v10[5]);
          *long long v13 = *v12;
          v13[1] = v58;
          *uint64_t v12 = v59;
          v12[1] = v60;
          float32x4_t v61 = v12[2];
          float32x4_t v62 = v12[3];
          float32x4_t v63 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v62, v10[3]), v13[3], v10[7]);
          float32x4_t v64 = vmlaq_f32(vmlaq_f32(v57, v61, v10[2]), v13[2], v10[6]);
          v13[2] = v61;
          v13[3] = v62;
          v12[2] = v64;
          void v12[3] = v63;
          --v56;
        }
        while (v56);
      }
      goto LABEL_44;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v17;
}

uint64_t RamstadSRC::processMonoFrac(RamstadSRC *this, const float *a2, float *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  unsigned int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 24);
  uint64_t v11 = *(void *)(*(void *)this + 48);
  uint64_t v12 = (float32x4_t *)*((void *)this + 11);
  long long v13 = (float32x4_t *)*((void *)this + 14);
  int v14 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      LODWORD(v15) = 0;
      for (int i = 0; i != a5; ++i)
      {
        float32x4_t v18 = *v12;
        float32x4_t v19 = v12[1];
        int v20 = v9;
        if (v9 >= 1)
        {
          do
          {
            float32x4_t v21 = vld1q_dup_f32(a2);
            uint64_t v17 = 4 * a6;
            a2 = (const float *)((char *)a2 + v17);
            float32x4_t v22 = vmlaq_f32(v21, v19, v10[1]);
            float32x4_t v23 = vmlaq_f32(vmlaq_f32(v21, v18, *v10), *v13, v10[2]);
            float32x4_t v24 = vmlaq_f32(v22, v13[1], v10[3]);
            *long long v13 = v18;
            v13[1] = v19;
            *uint64_t v12 = v23;
            v12[1] = v24;
            float32x4_t v18 = v23;
            float32x4_t v19 = v24;
            --v20;
          }
          while (v20);
        }
        uint64_t v15 = (v15 + v9);
        float v25 = *((double *)this + 10) * (double)(v7 & 0x7FFFFF);
        uint64_t v26 = (v7 >> 22) & 0x1FE;
        float32x4_t v27 = v13[1];
        int8x16_t v28 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 32 * v26 + 32), *v13), v18, *(float32x4_t *)(v11 + 32 * v26)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 32 * v26 + 48), v27), v19, *(float32x4_t *)(v11 + 32 * v26 + 16)));
        *(float32x2_t *)v28.i8 = vadd_f32(*(float32x2_t *)v28.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v28, v28, 8uLL));
        int8x16_t v29 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v13, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 32)), v18, *(float32x4_t *)(v11 + 32 * (v26 + 2))), vmlaq_f32(vmulq_f32(v27, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 48)), v19, *(float32x4_t *)(v11 + 32 * (v26 + 2) + 16)));
        *(float32x2_t *)v29.i8 = vadd_f32(*(float32x2_t *)v29.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v29, v29, 8uLL));
        *(float32x2_t *)v29.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v29.i8, *(int32x2_t *)v28.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v29.i8, *(int32x2_t *)v28.i8));
        *a3 = *(float *)&v29.i32[1] + (float)(v25 * (float)(*(float *)v29.i32 - *(float *)&v29.i32[1]));
        a3 += a7;
        LODWORD(v26) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v26 >> 31);
      }
    }
    int v54 = a4 - v15;
    if (a4 > (int)v15)
    {
      if (v9 < v54) {
        int v54 = v9;
      }
      if (v54 >= 1)
      {
        float32x4_t v56 = *v12;
        float32x4_t v55 = v12[1];
        int v58 = v54;
        do
        {
          float32x4_t v59 = vld1q_dup_f32(a2);
          uint64_t v57 = 4 * a6;
          a2 = (const float *)((char *)a2 + v57);
          float32x4_t v60 = vmlaq_f32(v59, v55, v10[1]);
          float32x4_t v61 = vmlaq_f32(vmlaq_f32(v59, v56, *v10), *v13, v10[2]);
          float32x4_t v62 = vmlaq_f32(v60, v13[1], v10[3]);
          *long long v13 = v56;
          v13[1] = v55;
          *uint64_t v12 = v61;
          v12[1] = v62;
          float32x4_t v56 = v61;
          float32x4_t v55 = v62;
          --v58;
        }
        while (v58);
      }
LABEL_32:
      v9 -= v54;
      uint64_t v15 = (v54 + v15);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      LODWORD(v15) = 0;
      for (int j = 0; j != a5; ++j)
      {
        if (v9 < 1)
        {
          float32x4_t v40 = v12[2];
          float32x4_t v39 = v12[3];
        }
        else
        {
          int v32 = v9;
          do
          {
            float32x4_t v33 = vld1q_dup_f32(a2);
            uint64_t v31 = 4 * a6;
            a2 = (const float *)((char *)a2 + v31);
            float32x4_t v34 = v12[1];
            float32x4_t v35 = vmlaq_f32(vmlaq_f32(v33, *v12, *v10), *v13, v10[4]);
            float32x4_t v36 = vmlaq_f32(vmlaq_f32(v33, v34, v10[1]), v13[1], v10[5]);
            *long long v13 = *v12;
            v13[1] = v34;
            *uint64_t v12 = v35;
            v12[1] = v36;
            float32x4_t v37 = v12[2];
            float32x4_t v38 = v12[3];
            float32x4_t v39 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v38, v10[3]), v13[3], v10[7]);
            float32x4_t v40 = vmlaq_f32(vmlaq_f32(v33, v37, v10[2]), v13[2], v10[6]);
            v13[2] = v37;
            v13[3] = v38;
            v12[2] = v40;
            void v12[3] = v39;
            --v32;
          }
          while (v32);
        }
        uint64_t v15 = (v15 + v9);
        float v41 = *((double *)this + 10) * (double)(v7 & 0x7FFFFF);
        uint64_t v42 = (v7 >> 21) & 0x3FC;
        int8x16_t v43 = (float32x4_t *)(v11 + 32 * v42);
        int v44 = (float32x4_t *)(v11 + 32 * (v42 + 4));
        float32x4_t v45 = v12[1];
        float32x4_t v46 = v13[1];
        float32x4_t v48 = v13[2];
        float32x4_t v47 = v13[3];
        int8x16_t v49 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v43[4], *v13), *v12, *v43), vmlaq_f32(vmulq_f32(v43[5], v46), v45, v43[1]));
        *(float32x2_t *)v49.i8 = vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v49, v49, 8uLL));
        int8x16_t v50 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v43[6], v48), v40, v43[2]), vmlaq_f32(vmulq_f32(v43[7], v47), v39, v43[3]));
        *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
        float32x4_t v51 = vmlaq_f32(vmulq_f32(v48, v44[6]), v40, v44[2]);
        int8x16_t v52 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v13, v44[4]), *v12, *v44), vmlaq_f32(vmulq_f32(v46, v44[5]), v45, v44[1]));
        *(float32x2_t *)v52.i8 = vadd_f32(*(float32x2_t *)v52.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v52, v52, 8uLL));
        int8x16_t v53 = (int8x16_t)vaddq_f32(v51, vmlaq_f32(vmulq_f32(v47, v44[7]), v39, v44[3]));
        *(float32x2_t *)v53.i8 = vadd_f32(*(float32x2_t *)v53.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v53, v53, 8uLL));
        *(float32x2_t *)v52.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v52.i8, *(int32x2_t *)v49.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v52.i8, *(int32x2_t *)v49.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v53.i8, *(int32x2_t *)v50.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v53.i8, *(int32x2_t *)v50.i8)));
        *a3 = *(float *)&v52.i32[1] + (float)(v41 * (float)(*(float *)v52.i32 - *(float *)&v52.i32[1]));
        a3 += a7;
        LODWORD(v44) = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v44 >> 31);
      }
    }
    int v54 = a4 - v15;
    if (a4 > (int)v15)
    {
      if (v9 < v54) {
        int v54 = v9;
      }
      if (v54 >= 1)
      {
        int v64 = v54;
        do
        {
          float32x4_t v65 = vld1q_dup_f32(a2);
          uint64_t v63 = 4 * a6;
          a2 = (const float *)((char *)a2 + v63);
          float32x4_t v66 = v12[1];
          float32x4_t v67 = vmlaq_f32(vmlaq_f32(v65, *v12, *v10), *v13, v10[4]);
          float32x4_t v68 = vmlaq_f32(vmlaq_f32(v65, v66, v10[1]), v13[1], v10[5]);
          *long long v13 = *v12;
          v13[1] = v66;
          *uint64_t v12 = v67;
          v12[1] = v68;
          float32x4_t v69 = v12[2];
          float32x4_t v70 = v12[3];
          float32x4_t v71 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v70, v10[3]), v13[3], v10[7]);
          float32x4_t v72 = vmlaq_f32(vmlaq_f32(v65, v69, v10[2]), v13[2], v10[6]);
          v13[2] = v69;
          v13[3] = v70;
          v12[2] = v72;
          void v12[3] = v71;
          --v64;
        }
        while (v64);
      }
      goto LABEL_32;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v15;
}

double RamstadSRC::processStereo(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  if (*((_DWORD *)this + 8) != 2)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x22A63EA30](exception, "RamstadSRC::processStereo, wrong channel count");
  }
  RamstadSRC::checkPreflight(this, a6, a7);
  if (*((unsigned char *)this + 77))
  {
    if (*((unsigned char *)this + 76)) {
      RamstadSRC::processStereoIntD(this, a2, a3, a4, a5, a6, a7, a8, a9);
    }
    else {
      RamstadSRC::processStereoFracD(this, a2, a3, a4, a5, a6, a7, a8, a9);
    }
  }
  else if (*((unsigned char *)this + 76))
  {
    RamstadSRC::processStereoInt(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    RamstadSRC::processStereoFrac(this, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  double result = NAN;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  return result;
}

void sub_225D15AB0(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 232) = -1;
  *(_DWORD *)(v1 + 240) = -1;
  _Unwind_Resume(exception_object);
}

uint64_t RamstadSRC::processStereoIntD(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 13);
  int v9 = *((_DWORD *)this + 14);
  int v11 = *((_DWORD *)this + 18);
  uint64_t v12 = *((void *)this + 1);
  long long v13 = *(float64x2_t **)(v12 + 24);
  uint64_t v14 = *(void *)(v12 + 48);
  uint64_t v15 = (float64x2_t *)*((void *)this + 17);
  int v16 = (float64x2_t *)*((void *)this + 20);
  int v17 = *((_DWORD *)this + 9);
  int v18 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a7 < 1)
    {
      uint64_t v20 = 0;
    }
    else
    {
      int v19 = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v11 < 1)
        {
          float64x2_t v46 = v15[6];
          float64x2_t v45 = v15[7];
          float64x2_t v44 = v15[4];
          float64x2_t v43 = v15[5];
        }
        else
        {
          uint64_t v21 = 0;
          int v22 = v11;
          do
          {
            float64x2_t v23 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v21]), 0);
            float64x2_t v24 = *v15;
            float64x2_t v25 = v15[1];
            float64x2_t v26 = v15[2];
            float64x2_t v27 = v15[3];
            float64x2_t v28 = vmlaq_f64(v23, v27, v13[3]);
            float64x2_t v29 = vmlaq_f64(v23, v26, v13[2]);
            float64x2_t v30 = vmlaq_f64(v23, v25, v13[1]);
            float64x2_t v31 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v21]), 0);
            float64x2_t v32 = vmlaq_f64(vmlaq_f64(v23, *v15, *v13), *v16, v13[4]);
            float64x2_t v33 = vmlaq_f64(v30, v16[1], v13[5]);
            float64x2_t v34 = vmlaq_f64(v29, v16[2], v13[6]);
            float64x2_t v35 = vmlaq_f64(v28, v16[3], v13[7]);
            _OWORD v16[2] = v26;
            v16[3] = v27;
            *int v16 = v24;
            v16[1] = v25;
            v15[2] = v34;
            v15[3] = v35;
            *uint64_t v15 = v32;
            v15[1] = v33;
            float64x2_t v37 = v15[4];
            float64x2_t v36 = v15[5];
            float64x2_t v39 = v15[6];
            float64x2_t v38 = v15[7];
            float64x2_t v40 = vmlaq_f64(v31, v39, v13[2]);
            float64x2_t v41 = vmlaq_f64(v31, v38, v13[3]);
            float64x2_t v42 = vmlaq_f64(v31, v37, *v13);
            float64x2_t v43 = vmlaq_f64(vmlaq_f64(v31, v36, v13[1]), v16[5], v13[5]);
            float64x2_t v44 = vmlaq_f64(v42, v16[4], v13[4]);
            float64x2_t v45 = vmlaq_f64(v41, v16[7], v13[7]);
            float64x2_t v46 = vmlaq_f64(v40, v16[6], v13[6]);
            v16[4] = v37;
            v16[5] = v36;
            v16[6] = v39;
            v16[7] = v38;
            v15[6] = v46;
            v15[7] = v45;
            v15[4] = v44;
            v15[5] = v43;
            v21 += a8;
            --v22;
          }
          while (v22);
          a2 = (const float *)((char *)a2 + v21 * 4);
          a3 = (const float *)((char *)a3 + v21 * 4);
        }
        uint64_t v20 = (v20 + v11);
        float32x4_t v47 = (float64x2_t *)(v14 + ((uint64_t)(2 * v9) << 6));
        float64x2_t v48 = v47[1];
        float64x2_t v50 = v47[2];
        float64x2_t v49 = v47[3];
        float64x2_t v51 = v47[6];
        float64x2_t v52 = v47[7];
        float64x2_t v53 = v47[4];
        float64x2_t v54 = v47[5];
        float64x2_t v55 = vmlaq_f64(vmulq_f64(v51, v16[6]), v46, v50);
        float64x2_t v56 = vmlaq_f64(vmulq_f64(v53, v16[4]), v44, *v47);
        float64x2_t v57 = vmlaq_f64(vmulq_f64(v52, v16[7]), v45, v49);
        float64x2_t v58 = vmlaq_f64(vmulq_f64(v54, v16[5]), v43, v48);
        float v59 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v53, *v16), *v15, *v47), vmlaq_f64(vmulq_f64(v51, v16[2]), v15[2], v50)), vaddq_f64(vmlaq_f64(vmulq_f64(v54, v16[1]), v15[1], v48), vmlaq_f64(vmulq_f64(v52, v16[3]), v15[3], v49))));
        *a4 = v59;
        float v60 = vaddvq_f64(vaddq_f64(vaddq_f64(v56, v55), vaddq_f64(v58, v57)));
        *a5 = v60;
        a4 += a9;
        a5 += a9;
        int v61 = v9 + v10;
        if (v61 < v17) {
          int v11 = v18;
        }
        else {
          int v11 = v18 + 1;
        }
        if (v61 < v17) {
          int v62 = 0;
        }
        else {
          int v62 = v17;
        }
        int v9 = v61 - v62;
        ++v19;
      }
      while (v19 != a7);
    }
    int v119 = a6 - v20;
    if (a6 > (int)v20)
    {
      if (v11 < v119) {
        int v119 = v11;
      }
      if (v119 >= 1)
      {
        uint64_t v120 = 0;
        int v121 = v119;
        do
        {
          float64x2_t v122 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v120]), 0);
          float64x2_t v123 = *v15;
          float64x2_t v124 = v15[1];
          float64x2_t v125 = v15[2];
          float64x2_t v126 = v15[3];
          float64x2_t v127 = vmlaq_f64(v122, v126, v13[3]);
          float64x2_t v128 = vmlaq_f64(v122, v125, v13[2]);
          float64x2_t v129 = vmlaq_f64(v122, v124, v13[1]);
          float64x2_t v130 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v120]), 0);
          float64x2_t v131 = vmlaq_f64(vmlaq_f64(v122, *v15, *v13), *v16, v13[4]);
          float64x2_t v132 = vmlaq_f64(v129, v16[1], v13[5]);
          float64x2_t v133 = vmlaq_f64(v128, v16[2], v13[6]);
          float64x2_t v134 = vmlaq_f64(v127, v16[3], v13[7]);
          _OWORD v16[2] = v125;
          v16[3] = v126;
          *int v16 = v123;
          v16[1] = v124;
          v15[2] = v133;
          v15[3] = v134;
          *uint64_t v15 = v131;
          v15[1] = v132;
          float64x2_t v136 = v15[4];
          float64x2_t v135 = v15[5];
          float64x2_t v138 = v15[6];
          float64x2_t v137 = v15[7];
          float64x2_t v139 = vmlaq_f64(v130, v138, v13[2]);
          float64x2_t v140 = vmlaq_f64(v130, v137, v13[3]);
          float64x2_t v141 = vmlaq_f64(v130, v136, *v13);
          float64x2_t v142 = vmlaq_f64(vmlaq_f64(v130, v135, v13[1]), v16[5], v13[5]);
          float64x2_t v143 = vmlaq_f64(v141, v16[4], v13[4]);
          float64x2_t v144 = vmlaq_f64(v140, v16[7], v13[7]);
          float64x2_t v145 = vmlaq_f64(v139, v16[6], v13[6]);
          v16[4] = v136;
          v16[5] = v135;
          v16[6] = v138;
          v16[7] = v137;
          v15[6] = v145;
          v15[7] = v144;
          v15[4] = v143;
          v15[5] = v142;
          v120 += a8;
          --v121;
        }
        while (v121);
      }
LABEL_47:
      v11 -= v119;
      uint64_t v20 = (v119 + v20);
    }
  }
  else
  {
    if (a7 < 1)
    {
      uint64_t v20 = 0;
    }
    else
    {
      int v63 = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v11 < 1)
        {
          float64x2_t v93 = v15[10];
          float64x2_t v92 = v15[11];
          float64x2_t v91 = v15[8];
          float64x2_t v90 = v15[9];
        }
        else
        {
          uint64_t v64 = 0;
          int v65 = v11;
          do
          {
            float64x2_t v66 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v64]), 0);
            float64x2_t v67 = *v15;
            float64x2_t v68 = v15[1];
            float64x2_t v69 = v15[2];
            float64x2_t v70 = v15[3];
            float64x2_t v71 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v64]), 0);
            float64x2_t v72 = vmlaq_f64(vmlaq_f64(v66, *v15, *v13), *v16, v13[8]);
            float64x2_t v73 = vmlaq_f64(vmlaq_f64(v66, v68, v13[1]), v16[1], v13[9]);
            float64x2_t v74 = vmlaq_f64(vmlaq_f64(v66, v69, v13[2]), v16[2], v13[10]);
            float64x2_t v75 = vmlaq_f64(vmlaq_f64(v66, v70, v13[3]), v16[3], v13[11]);
            _OWORD v16[2] = v69;
            v16[3] = v70;
            *int v16 = v67;
            v16[1] = v68;
            v15[2] = v74;
            v15[3] = v75;
            *uint64_t v15 = v72;
            v15[1] = v73;
            float64x2_t v76 = v15[4];
            float64x2_t v77 = v15[5];
            float64x2_t v78 = v15[6];
            float64x2_t v79 = v15[7];
            float64x2_t v80 = vmlaq_f64(vmlaq_f64(v71, v76, *v13), v16[4], v13[8]);
            float64x2_t v81 = vmlaq_f64(vmlaq_f64(v71, v77, v13[1]), v16[5], v13[9]);
            float64x2_t v82 = vmlaq_f64(vmlaq_f64(v71, v78, v13[2]), v16[6], v13[10]);
            float64x2_t v83 = vmlaq_f64(vmlaq_f64(v71, v79, v13[3]), v16[7], v13[11]);
            v16[4] = v76;
            v16[5] = v77;
            v16[6] = v78;
            v16[7] = v79;
            v15[6] = v82;
            v15[7] = v83;
            v15[4] = v80;
            v15[5] = v81;
            float64x2_t v85 = v15[8];
            float64x2_t v84 = v15[9];
            float64x2_t v87 = v15[10];
            float64x2_t v86 = v15[11];
            float64x2_t v88 = vmlaq_f64(v71, v87, v13[6]);
            float64x2_t v89 = vmlaq_f64(v66, v85, v13[4]);
            float64x2_t v90 = vmlaq_f64(vmlaq_f64(v66, v84, v13[5]), v16[9], v13[13]);
            float64x2_t v91 = vmlaq_f64(v89, v16[8], v13[12]);
            float64x2_t v92 = vmlaq_f64(vmlaq_f64(v71, v86, v13[7]), v16[11], v13[15]);
            float64x2_t v93 = vmlaq_f64(v88, v16[10], v13[14]);
            v16[8] = v85;
            v16[9] = v84;
            v16[10] = v87;
            v16[11] = v86;
            v15[10] = v93;
            v15[11] = v92;
            v15[8] = v91;
            v15[9] = v90;
            v64 += a8;
            --v65;
          }
          while (v65);
          a2 = (const float *)((char *)a2 + v64 * 4);
          a3 = (const float *)((char *)a3 + v64 * 4);
        }
        uint64_t v20 = (v20 + v11);
        float64x2_t v94 = (float64x2_t *)(v14 + ((uint64_t)(4 * v9) << 6));
        float64x2_t v95 = v94[1];
        float64x2_t v97 = v94[2];
        float64x2_t v96 = v94[3];
        float64x2_t v98 = v94[10];
        float64x2_t v99 = v94[11];
        float64x2_t v100 = v94[8];
        float64x2_t v101 = v94[9];
        float64x2_t v102 = vmlaq_f64(vmulq_f64(v98, v16[2]), v15[2], v97);
        float64x2_t v103 = vmlaq_f64(vmulq_f64(v100, *v16), *v15, *v94);
        float64x2_t v104 = vmlaq_f64(vmulq_f64(v99, v16[3]), v15[3], v96);
        float64x2_t v105 = vmlaq_f64(vmulq_f64(v101, v16[1]), v15[1], v95);
        float64x2_t v106 = vmlaq_f64(vmulq_f64(v98, v16[6]), v15[6], v97);
        float64x2_t v107 = vmlaq_f64(vmulq_f64(v100, v16[4]), v15[4], *v94);
        float64x2_t v108 = vmlaq_f64(vmulq_f64(v99, v16[7]), v15[7], v96);
        float64x2_t v109 = vmlaq_f64(vmulq_f64(v101, v16[5]), v15[5], v95);
        float64x2_t v110 = vmlaq_f64(vmulq_f64(v94[15], v16[11]), v92, v94[7]);
        float64x2_t v111 = vmlaq_f64(vmulq_f64(v94[14], v16[10]), v93, v94[6]);
        float64x2_t v112 = vmlaq_f64(vmulq_f64(v94[13], v16[9]), v90, v94[5]);
        int64x2_t v113 = (int64x2_t)vaddq_f64(vaddq_f64(v103, v102), vaddq_f64(v105, v104));
        int64x2_t v114 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v94[12], v16[8]), v91, v94[4]), v112);
        *(float *)v113.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v113, v114), (float64x2_t)vzip2q_s64(v113, v114)));
        *a4 = *(float *)v113.i32;
        int64x2_t v115 = (int64x2_t)vaddq_f64(vaddq_f64(v107, v106), vaddq_f64(v109, v108));
        int64x2_t v116 = (int64x2_t)vaddq_f64(v111, v110);
        *(float *)v115.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v115, v116), (float64x2_t)vzip2q_s64(v115, v116)));
        *a5 = *(float *)v115.i32;
        a4 += a9;
        a5 += a9;
        int v117 = v9 + v10;
        if (v117 < v17) {
          int v11 = v18;
        }
        else {
          int v11 = v18 + 1;
        }
        if (v117 < v17) {
          int v118 = 0;
        }
        else {
          int v118 = v17;
        }
        int v9 = v117 - v118;
        ++v63;
      }
      while (v63 != a7);
    }
    int v119 = a6 - v20;
    if (a6 > (int)v20)
    {
      if (v11 < v119) {
        int v119 = v11;
      }
      if (v119 >= 1)
      {
        uint64_t v146 = 0;
        int v147 = v119;
        do
        {
          float64x2_t v148 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v146]), 0);
          float64x2_t v149 = *v15;
          float64x2_t v150 = v15[1];
          float64x2_t v151 = v15[2];
          float64x2_t v152 = v15[3];
          float64x2_t v153 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v146]), 0);
          float64x2_t v154 = vmlaq_f64(vmlaq_f64(v148, *v15, *v13), *v16, v13[8]);
          float64x2_t v155 = vmlaq_f64(vmlaq_f64(v148, v150, v13[1]), v16[1], v13[9]);
          float64x2_t v156 = vmlaq_f64(vmlaq_f64(v148, v151, v13[2]), v16[2], v13[10]);
          float64x2_t v157 = vmlaq_f64(vmlaq_f64(v148, v152, v13[3]), v16[3], v13[11]);
          _OWORD v16[2] = v151;
          v16[3] = v152;
          *int v16 = v149;
          v16[1] = v150;
          v15[2] = v156;
          v15[3] = v157;
          *uint64_t v15 = v154;
          v15[1] = v155;
          float64x2_t v158 = v15[4];
          float64x2_t v159 = v15[5];
          float64x2_t v160 = v15[6];
          float64x2_t v161 = v15[7];
          float64x2_t v162 = vmlaq_f64(vmlaq_f64(v153, v158, *v13), v16[4], v13[8]);
          float64x2_t v163 = vmlaq_f64(vmlaq_f64(v153, v159, v13[1]), v16[5], v13[9]);
          float64x2_t v164 = vmlaq_f64(vmlaq_f64(v153, v160, v13[2]), v16[6], v13[10]);
          float64x2_t v165 = vmlaq_f64(vmlaq_f64(v153, v161, v13[3]), v16[7], v13[11]);
          v16[4] = v158;
          v16[5] = v159;
          v16[6] = v160;
          v16[7] = v161;
          v15[6] = v164;
          v15[7] = v165;
          v15[4] = v162;
          v15[5] = v163;
          float64x2_t v167 = v15[8];
          float64x2_t v166 = v15[9];
          float64x2_t v169 = v15[10];
          float64x2_t v168 = v15[11];
          float64x2_t v170 = vmlaq_f64(v153, v169, v13[6]);
          float64x2_t v171 = vmlaq_f64(v148, v167, v13[4]);
          float64x2_t v172 = vmlaq_f64(vmlaq_f64(v148, v166, v13[5]), v16[9], v13[13]);
          float64x2_t v173 = vmlaq_f64(v171, v16[8], v13[12]);
          float64x2_t v174 = vmlaq_f64(vmlaq_f64(v153, v168, v13[7]), v16[11], v13[15]);
          float64x2_t v175 = vmlaq_f64(v170, v16[10], v13[14]);
          v16[8] = v167;
          v16[9] = v166;
          v16[10] = v169;
          v16[11] = v168;
          v15[10] = v175;
          v15[11] = v174;
          v15[8] = v173;
          v15[9] = v172;
          v146 += a8;
          --v147;
        }
        while (v147);
      }
      goto LABEL_47;
    }
  }
  *((_DWORD *)this + 14) = v9;
  *((_DWORD *)this + 18) = v11;
  return v20;
}

uint64_t RamstadSRC::processStereoFracD(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 13);
  unsigned int v9 = *((_DWORD *)this + 14);
  int v11 = *((_DWORD *)this + 18);
  uint64_t v12 = *((void *)this + 1);
  long long v13 = *(float64x2_t **)(v12 + 24);
  uint64_t v14 = *(void *)(v12 + 48);
  uint64_t v15 = (float64x2_t *)*((void *)this + 17);
  int v16 = (float64x2_t *)*((void *)this + 20);
  int v17 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a7 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      LODWORD(v18) = 0;
      for (int i = 0; i != a7; ++i)
      {
        if (v11 < 1)
        {
          float64x2_t v45 = v15[6];
          float64x2_t v44 = v15[7];
          float64x2_t v43 = v15[4];
          float64x2_t v42 = v15[5];
        }
        else
        {
          uint64_t v20 = 0;
          int v21 = v11;
          do
          {
            float64x2_t v22 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v20]), 0);
            float64x2_t v23 = *v15;
            float64x2_t v24 = v15[1];
            float64x2_t v25 = v15[2];
            float64x2_t v26 = v15[3];
            float64x2_t v27 = vmlaq_f64(v22, v26, v13[3]);
            float64x2_t v28 = vmlaq_f64(v22, v25, v13[2]);
            float64x2_t v29 = vmlaq_f64(v22, v24, v13[1]);
            float64x2_t v30 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v20]), 0);
            float64x2_t v31 = vmlaq_f64(vmlaq_f64(v22, *v15, *v13), *v16, v13[4]);
            float64x2_t v32 = vmlaq_f64(v29, v16[1], v13[5]);
            float64x2_t v33 = vmlaq_f64(v28, v16[2], v13[6]);
            float64x2_t v34 = vmlaq_f64(v27, v16[3], v13[7]);
            _OWORD v16[2] = v25;
            v16[3] = v26;
            *int v16 = v23;
            v16[1] = v24;
            v15[2] = v33;
            v15[3] = v34;
            *uint64_t v15 = v31;
            v15[1] = v32;
            float64x2_t v36 = v15[4];
            float64x2_t v35 = v15[5];
            float64x2_t v38 = v15[6];
            float64x2_t v37 = v15[7];
            float64x2_t v39 = vmlaq_f64(v30, v38, v13[2]);
            float64x2_t v40 = vmlaq_f64(v30, v37, v13[3]);
            float64x2_t v41 = vmlaq_f64(v30, v36, *v13);
            float64x2_t v42 = vmlaq_f64(vmlaq_f64(v30, v35, v13[1]), v16[5], v13[5]);
            float64x2_t v43 = vmlaq_f64(v41, v16[4], v13[4]);
            float64x2_t v44 = vmlaq_f64(v40, v16[7], v13[7]);
            float64x2_t v45 = vmlaq_f64(v39, v16[6], v13[6]);
            v16[4] = v36;
            v16[5] = v35;
            v16[6] = v38;
            v16[7] = v37;
            v15[6] = v45;
            v15[7] = v44;
            v15[4] = v43;
            v15[5] = v42;
            v20 += a8;
            --v21;
          }
          while (v21);
          a2 = (const float *)((char *)a2 + v20 * 4);
          a3 = (const float *)((char *)a3 + v20 * 4);
        }
        uint64_t v18 = (v18 + v11);
        float v46 = *((double *)this + 10) * (double)(v9 & 0x7FFFFF);
        uint64_t v47 = (v9 >> 22) & 0x1FE;
        float64x2_t v48 = (float64x2_t *)(v14 + (v47 << 6));
        float64x2_t v49 = (float64x2_t *)(v14 + ((unint64_t)(v47 + 2) << 6));
        float64x2_t v50 = v48[1];
        float64x2_t v52 = v48[2];
        float64x2_t v51 = v48[3];
        float64x2_t v53 = v15[1];
        float64x2_t v55 = v15[2];
        float64x2_t v54 = v15[3];
        float64x2_t v56 = v48[6];
        float64x2_t v57 = v48[7];
        float64x2_t v58 = v48[4];
        float64x2_t v59 = v48[5];
        float64x2_t v60 = v16[2];
        float64x2_t v61 = v16[3];
        float64x2_t v62 = v16[1];
        float64x2_t v63 = vmlaq_f64(vmulq_f64(v59, v62), v53, v50);
        float64x2_t v64 = v16[6];
        float64x2_t v65 = v16[7];
        float64x2_t v66 = v16[4];
        float64x2_t v67 = v16[5];
        float64x2_t v68 = vmlaq_f64(vmulq_f64(v59, v67), v42, v50);
        int64x2_t v69 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v58, *v16), *v15, *v48), vmlaq_f64(vmulq_f64(v56, v60), v55, v52)), vaddq_f64(v63, vmlaq_f64(vmulq_f64(v57, v61), v54, v51)));
        int64x2_t v70 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v58, v66), v43, *v48), vmlaq_f64(vmulq_f64(v56, v64), v45, v52)), vaddq_f64(v68, vmlaq_f64(vmulq_f64(v57, v65), v44, v51)));
        float64x2_t v71 = v49[1];
        float64x2_t v73 = v49[2];
        float64x2_t v72 = v49[3];
        float64x2_t v74 = v49[6];
        float64x2_t v75 = v49[7];
        float64x2_t v76 = v49[4];
        float64x2_t v77 = v49[5];
        float64x2_t v78 = vmlaq_f64(vmulq_f64(v62, v77), v53, v71);
        float64x2_t v79 = vmlaq_f64(vmulq_f64(v67, v77), v42, v71);
        int64x2_t v80 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(*v16, v76), *v15, *v49), vmlaq_f64(vmulq_f64(v60, v74), v55, v73)), vaddq_f64(v78, vmlaq_f64(vmulq_f64(v61, v75), v54, v72)));
        *(float32x2_t *)v80.i8 = vcvt_f32_f64(vaddq_f64((float64x2_t)vzip1q_s64(v80, v69), (float64x2_t)vzip2q_s64(v80, v69)));
        int64x2_t v81 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v66, v76), v43, *v49), vmlaq_f64(vmulq_f64(v64, v74), v45, v73)), vaddq_f64(v79, vmlaq_f64(vmulq_f64(v65, v75), v44, v72)));
        *(float32x2_t *)v81.i8 = vcvt_f32_f64(vaddq_f64((float64x2_t)vzip1q_s64(v81, v70), (float64x2_t)vzip2q_s64(v81, v70)));
        *a4 = *(float *)&v80.i32[1] + (float)(v46 * (float)(*(float *)v80.i32 - *(float *)&v80.i32[1]));
        *a5 = *(float *)&v81.i32[1] + (float)(v46 * (float)(*(float *)v81.i32 - *(float *)&v81.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v49) = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v17 + (v49 >> 31);
      }
    }
    int v178 = a6 - v18;
    if (a6 > (int)v18)
    {
      if (v11 < v178) {
        int v178 = v11;
      }
      if (v178 >= 1)
      {
        uint64_t v179 = 0;
        int v180 = v178;
        do
        {
          float64x2_t v181 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v179]), 0);
          float64x2_t v182 = *v15;
          float64x2_t v183 = v15[1];
          float64x2_t v184 = v15[2];
          float64x2_t v185 = v15[3];
          float64x2_t v186 = vmlaq_f64(v181, v185, v13[3]);
          float64x2_t v187 = vmlaq_f64(v181, v184, v13[2]);
          float64x2_t v188 = vmlaq_f64(v181, v183, v13[1]);
          float64x2_t v189 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v179]), 0);
          float64x2_t v190 = vmlaq_f64(vmlaq_f64(v181, *v15, *v13), *v16, v13[4]);
          float64x2_t v191 = vmlaq_f64(v188, v16[1], v13[5]);
          float64x2_t v192 = vmlaq_f64(v187, v16[2], v13[6]);
          float64x2_t v193 = vmlaq_f64(v186, v16[3], v13[7]);
          _OWORD v16[2] = v184;
          v16[3] = v185;
          *int v16 = v182;
          v16[1] = v183;
          v15[2] = v192;
          v15[3] = v193;
          *uint64_t v15 = v190;
          v15[1] = v191;
          float64x2_t v195 = v15[4];
          float64x2_t v194 = v15[5];
          float64x2_t v197 = v15[6];
          float64x2_t v196 = v15[7];
          float64x2_t v198 = vmlaq_f64(v189, v197, v13[2]);
          float64x2_t v199 = vmlaq_f64(v189, v196, v13[3]);
          float64x2_t v200 = vmlaq_f64(v189, v195, *v13);
          float64x2_t v201 = vmlaq_f64(vmlaq_f64(v189, v194, v13[1]), v16[5], v13[5]);
          float64x2_t v202 = vmlaq_f64(v200, v16[4], v13[4]);
          float64x2_t v203 = vmlaq_f64(v199, v16[7], v13[7]);
          float64x2_t v204 = vmlaq_f64(v198, v16[6], v13[6]);
          v16[4] = v195;
          v16[5] = v194;
          v16[6] = v197;
          v16[7] = v196;
          v15[6] = v204;
          v15[7] = v203;
          v15[4] = v202;
          v15[5] = v201;
          v179 += a8;
          --v180;
        }
        while (v180);
      }
LABEL_35:
      v11 -= v178;
      uint64_t v18 = (v178 + v18);
    }
  }
  else
  {
    if (a7 < 1)
    {
      uint64_t v18 = 0;
    }
    else
    {
      int v82 = 0;
      LODWORD(v18) = 0;
      do
      {
        if (v11 < 1)
        {
          float64x2_t v112 = v15[10];
          float64x2_t v111 = v15[11];
          float64x2_t v110 = v15[8];
          float64x2_t v109 = v15[9];
        }
        else
        {
          uint64_t v83 = 0;
          int v84 = v11;
          do
          {
            float64x2_t v85 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v83]), 0);
            float64x2_t v86 = *v15;
            float64x2_t v87 = v15[1];
            float64x2_t v88 = v15[2];
            float64x2_t v89 = v15[3];
            float64x2_t v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v83]), 0);
            float64x2_t v91 = vmlaq_f64(vmlaq_f64(v85, *v15, *v13), *v16, v13[8]);
            float64x2_t v92 = vmlaq_f64(vmlaq_f64(v85, v87, v13[1]), v16[1], v13[9]);
            float64x2_t v93 = vmlaq_f64(vmlaq_f64(v85, v88, v13[2]), v16[2], v13[10]);
            float64x2_t v94 = vmlaq_f64(vmlaq_f64(v85, v89, v13[3]), v16[3], v13[11]);
            _OWORD v16[2] = v88;
            v16[3] = v89;
            *int v16 = v86;
            v16[1] = v87;
            v15[2] = v93;
            v15[3] = v94;
            *uint64_t v15 = v91;
            v15[1] = v92;
            float64x2_t v95 = v15[4];
            float64x2_t v96 = v15[5];
            float64x2_t v97 = v15[6];
            float64x2_t v98 = v15[7];
            float64x2_t v99 = vmlaq_f64(vmlaq_f64(v90, v95, *v13), v16[4], v13[8]);
            float64x2_t v100 = vmlaq_f64(vmlaq_f64(v90, v96, v13[1]), v16[5], v13[9]);
            float64x2_t v101 = vmlaq_f64(vmlaq_f64(v90, v97, v13[2]), v16[6], v13[10]);
            float64x2_t v102 = vmlaq_f64(vmlaq_f64(v90, v98, v13[3]), v16[7], v13[11]);
            v16[4] = v95;
            v16[5] = v96;
            v16[6] = v97;
            v16[7] = v98;
            v15[6] = v101;
            v15[7] = v102;
            v15[4] = v99;
            v15[5] = v100;
            float64x2_t v104 = v15[8];
            float64x2_t v103 = v15[9];
            float64x2_t v106 = v15[10];
            float64x2_t v105 = v15[11];
            float64x2_t v107 = vmlaq_f64(v90, v106, v13[6]);
            float64x2_t v108 = vmlaq_f64(v85, v104, v13[4]);
            float64x2_t v109 = vmlaq_f64(vmlaq_f64(v85, v103, v13[5]), v16[9], v13[13]);
            float64x2_t v110 = vmlaq_f64(v108, v16[8], v13[12]);
            float64x2_t v111 = vmlaq_f64(vmlaq_f64(v90, v105, v13[7]), v16[11], v13[15]);
            float64x2_t v112 = vmlaq_f64(v107, v16[10], v13[14]);
            v16[8] = v104;
            v16[9] = v103;
            v16[10] = v106;
            v16[11] = v105;
            v15[10] = v112;
            v15[11] = v111;
            v15[8] = v110;
            v15[9] = v109;
            v83 += a8;
            --v84;
          }
          while (v84);
          a2 = (const float *)((char *)a2 + v83 * 4);
          a3 = (const float *)((char *)a3 + v83 * 4);
        }
        uint64_t v113 = (v9 >> 21) & 0x3FC;
        int64x2_t v114 = (float64x2_t *)(v14 + (v113 << 6));
        int64x2_t v115 = (float64x2_t *)(v14 + ((unint64_t)(v113 + 4) << 6));
        float64x2_t v116 = v114[1];
        float64x2_t v118 = v114[2];
        float64x2_t v117 = v114[3];
        float64x2_t v236 = v15[1];
        float64x2_t v120 = v15[2];
        float64x2_t v119 = v15[3];
        float64x2_t v122 = v114[10];
        float64x2_t v121 = v114[11];
        float64x2_t v124 = v114[8];
        float64x2_t v123 = v114[9];
        float64x2_t v126 = v16[2];
        float64x2_t v125 = v16[3];
        float64x2_t v127 = v16[1];
        float64x2_t v128 = vmlaq_f64(vmulq_f64(v122, v126), v120, v118);
        float64x2_t v129 = vmlaq_f64(vmulq_f64(v124, *v16), *v15, *v114);
        float64x2_t v130 = vmlaq_f64(vmulq_f64(v121, v125), v119, v117);
        float64x2_t v131 = vmlaq_f64(vmulq_f64(v123, v127), v236, v116);
        float64x2_t v132 = v15[4];
        float64x2_t v133 = v15[5];
        float64x2_t v134 = v15[6];
        float64x2_t v135 = v15[7];
        float64x2_t v136 = v16[6];
        float64x2_t v137 = v16[7];
        float64x2_t v138 = v16[4];
        float64x2_t v139 = v16[5];
        float64x2_t v140 = vmlaq_f64(vmulq_f64(v122, v136), v134, v118);
        float64x2_t v141 = vmlaq_f64(vmulq_f64(v124, v138), v132, *v114);
        float64x2_t v142 = vmlaq_f64(vmulq_f64(v121, v137), v135, v117);
        float64x2_t v143 = vmlaq_f64(vmulq_f64(v123, v139), v133, v116);
        float64x2_t v144 = v115[2];
        float64x2_t v145 = v115[10];
        float64x2_t v146 = v115[11];
        float64x2_t v147 = vmlaq_f64(vmulq_f64(v126, v145), v120, v144);
        float64x2_t v149 = v115[8];
        float64x2_t v148 = v115[9];
        float64x2_t v150 = vmlaq_f64(vmulq_f64(*v16, v149), *v15, *v115);
        float64x2_t v151 = vmulq_f64(v138, v149);
        float64x2_t v152 = vmlaq_f64(vmulq_f64(v136, v145), v134, v144);
        float64x2_t v153 = vmlaq_f64(v151, v132, *v115);
        float64x2_t v155 = v16[10];
        float64x2_t v154 = v16[11];
        float64x2_t v156 = vmlaq_f64(vmulq_f64(v114[15], v154), v111, v114[7]);
        float64x2_t v157 = vmlaq_f64(vmulq_f64(v114[14], v155), v112, v114[6]);
        float64x2_t v158 = v115[3];
        float64x2_t v159 = vmlaq_f64(vmulq_f64(v125, v146), v119, v158);
        float64x2_t v160 = v115[1];
        float64x2_t v161 = vmlaq_f64(vmulq_f64(v127, v148), v236, v160);
        float64x2_t v162 = vmlaq_f64(vmulq_f64(v139, v148), v133, v160);
        float64x2_t v163 = vmlaq_f64(vmulq_f64(v154, v115[15]), v111, v115[7]);
        float64x2_t v165 = v16[8];
        float64x2_t v164 = v16[9];
        float64x2_t v166 = vmlaq_f64(vmulq_f64(v155, v115[14]), v112, v115[6]);
        int64x2_t v167 = (int64x2_t)vaddq_f64(vaddq_f64(v129, v128), vaddq_f64(v131, v130));
        int64x2_t v168 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v114[12], v165), v110, v114[4]), vmlaq_f64(vmulq_f64(v114[13], v164), v109, v114[5]));
        int64x2_t v169 = (int64x2_t)vaddq_f64(vaddq_f64(v141, v140), vaddq_f64(v143, v142));
        int64x2_t v170 = (int64x2_t)vaddq_f64(v157, v156);
        int64x2_t v171 = (int64x2_t)vaddq_f64(vaddq_f64(v150, v147), vaddq_f64(v161, v159));
        int64x2_t v172 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v165, v115[12]), v110, v115[4]), vmlaq_f64(vmulq_f64(v164, v115[13]), v109, v115[5]));
        float64x2_t v173 = vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v171, v167), (float64x2_t)vzip2q_s64(v171, v167)), vaddq_f64((float64x2_t)vzip1q_s64(v172, v168), (float64x2_t)vzip2q_s64(v172, v168)));
        int64x2_t v174 = (int64x2_t)vaddq_f64(vaddq_f64(v153, v152), vaddq_f64(v162, vmlaq_f64(vmulq_f64(v137, v146), v135, v158)));
        int64x2_t v175 = (int64x2_t)vaddq_f64(v166, v163);
        float v176 = *((double *)this + 10) * (double)(v9 & 0x7FFFFF);
        *(float32x2_t *)&v173.f64[0] = vcvt_f32_f64(v173);
        *(float32x2_t *)v174.i8 = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v174, v169), (float64x2_t)vzip2q_s64(v174, v169)), vaddq_f64((float64x2_t)vzip1q_s64(v175, v170), (float64x2_t)vzip2q_s64(v175, v170))));
        *a4 = *((float *)v173.f64 + 1) + (float)(v176 * (float)(*(float *)v173.f64 - *((float *)v173.f64 + 1)));
        *a5 = *(float *)&v174.i32[1] + (float)(v176 * (float)(*(float *)v174.i32 - *(float *)&v174.i32[1]));
        uint64_t v18 = (v18 + v11);
        a4 += a9;
        a5 += a9;
        unsigned int v177 = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v17 + (v177 >> 31);
        ++v82;
      }
      while (v82 != a7);
    }
    int v178 = a6 - v18;
    if (a6 > (int)v18)
    {
      if (v11 < v178) {
        int v178 = v11;
      }
      if (v178 >= 1)
      {
        uint64_t v205 = 0;
        int v206 = v178;
        do
        {
          float64x2_t v207 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[v205]), 0);
          float64x2_t v208 = *v15;
          float64x2_t v209 = v15[1];
          float64x2_t v210 = v15[2];
          float64x2_t v211 = v15[3];
          float64x2_t v212 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a3[v205]), 0);
          float64x2_t v213 = vmlaq_f64(vmlaq_f64(v207, *v15, *v13), *v16, v13[8]);
          float64x2_t v214 = vmlaq_f64(vmlaq_f64(v207, v209, v13[1]), v16[1], v13[9]);
          float64x2_t v215 = vmlaq_f64(vmlaq_f64(v207, v210, v13[2]), v16[2], v13[10]);
          float64x2_t v216 = vmlaq_f64(vmlaq_f64(v207, v211, v13[3]), v16[3], v13[11]);
          _OWORD v16[2] = v210;
          v16[3] = v211;
          *int v16 = v208;
          v16[1] = v209;
          v15[2] = v215;
          v15[3] = v216;
          *uint64_t v15 = v213;
          v15[1] = v214;
          float64x2_t v217 = v15[4];
          float64x2_t v218 = v15[5];
          float64x2_t v219 = v15[6];
          float64x2_t v220 = v15[7];
          float64x2_t v221 = vmlaq_f64(vmlaq_f64(v212, v217, *v13), v16[4], v13[8]);
          float64x2_t v222 = vmlaq_f64(vmlaq_f64(v212, v218, v13[1]), v16[5], v13[9]);
          float64x2_t v223 = vmlaq_f64(vmlaq_f64(v212, v219, v13[2]), v16[6], v13[10]);
          float64x2_t v224 = vmlaq_f64(vmlaq_f64(v212, v220, v13[3]), v16[7], v13[11]);
          v16[4] = v217;
          v16[5] = v218;
          v16[6] = v219;
          v16[7] = v220;
          v15[6] = v223;
          v15[7] = v224;
          v15[4] = v221;
          v15[5] = v222;
          float64x2_t v226 = v15[8];
          float64x2_t v225 = v15[9];
          float64x2_t v228 = v15[10];
          float64x2_t v227 = v15[11];
          float64x2_t v229 = vmlaq_f64(v212, v228, v13[6]);
          float64x2_t v230 = vmlaq_f64(v207, v226, v13[4]);
          float64x2_t v231 = vmlaq_f64(vmlaq_f64(v207, v225, v13[5]), v16[9], v13[13]);
          float64x2_t v232 = vmlaq_f64(v230, v16[8], v13[12]);
          float64x2_t v233 = vmlaq_f64(vmlaq_f64(v212, v227, v13[7]), v16[11], v13[15]);
          float64x2_t v234 = vmlaq_f64(v229, v16[10], v13[14]);
          v16[8] = v226;
          v16[9] = v225;
          v16[10] = v228;
          v16[11] = v227;
          v15[10] = v234;
          v15[11] = v233;
          v15[8] = v232;
          v15[9] = v231;
          v205 += a8;
          --v206;
        }
        while (v206);
      }
      goto LABEL_35;
    }
  }
  *((_DWORD *)this + 14) = v9;
  *((_DWORD *)this + 18) = v11;
  return v18;
}

uint64_t RamstadSRC::processStereoInt(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 13);
  int v9 = *((_DWORD *)this + 14);
  int v11 = *((_DWORD *)this + 18);
  uint64_t v12 = *(float32x4_t **)(*(void *)this + 24);
  uint64_t v13 = *(void *)(*(void *)this + 48);
  uint64_t v14 = (float32x4_t *)*((void *)this + 11);
  uint64_t v15 = (float32x4_t *)*((void *)this + 14);
  int v16 = *((_DWORD *)this + 9);
  int v17 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a7 < 1)
    {
      uint64_t v19 = 0;
    }
    else
    {
      int v18 = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v11 < 1)
        {
          float32x4_t v33 = v14[2];
          float32x4_t v34 = v14[3];
        }
        else
        {
          uint64_t v20 = 0;
          int v21 = v11;
          do
          {
            float64x2_t v22 = &a2[v20];
            float64x2_t v23 = &a3[v20];
            float32x4_t v24 = vld1q_dup_f32(v22);
            float32x4_t v25 = vld1q_dup_f32(v23);
            float32x4_t v26 = v14[1];
            float32x4_t v27 = vmlaq_f32(v24, v26, v12[1]);
            float32x4_t v28 = vmlaq_f32(vmlaq_f32(v24, *v14, *v12), *v15, v12[2]);
            float32x4_t v29 = vmlaq_f32(v27, v15[1], v12[3]);
            *uint64_t v15 = *v14;
            v15[1] = v26;
            float32x4_t *v14 = v28;
            v14[1] = v29;
            float32x4_t v30 = v14[2];
            float32x4_t v31 = v14[3];
            float32x4_t v32 = vmlaq_f32(v25, v31, v12[1]);
            float32x4_t v33 = vmlaq_f32(vmlaq_f32(v25, v30, *v12), v15[2], v12[2]);
            float32x4_t v34 = vmlaq_f32(v32, v15[3], v12[3]);
            v15[2] = v30;
            v15[3] = v31;
            void v14[2] = v33;
            v14[3] = v34;
            v20 += a8;
            --v21;
          }
          while (v21);
          a2 = (const float *)((char *)a2 + v20 * 4);
          a3 = (const float *)((char *)a3 + v20 * 4);
        }
        uint64_t v19 = (v19 + v11);
        float64x2_t v35 = (float32x4_t *)(v13 + 64 * v9);
        float32x4_t v36 = v35[1];
        float32x4_t v38 = v35[2];
        float32x4_t v37 = v35[3];
        float32x4_t v39 = vmlaq_f32(vmulq_f32(v37, v15[3]), v34, v36);
        float32x4_t v40 = vmlaq_f32(vmulq_f32(v38, v15[2]), v33, *v35);
        int8x16_t v41 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v38, *v15), *v14, *v35), vmlaq_f32(vmulq_f32(v37, v15[1]), v14[1], v36));
        *a4 = vaddv_f32(vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v41, v41, 8uLL)));
        int8x16_t v42 = (int8x16_t)vaddq_f32(v40, v39);
        *a5 = vaddv_f32(vadd_f32(*(float32x2_t *)v42.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v42, v42, 8uLL)));
        a4 += a9;
        a5 += a9;
        int v43 = v9 + v10;
        if (v43 < v16) {
          int v11 = v17;
        }
        else {
          int v11 = v17 + 1;
        }
        if (v43 < v16) {
          int v44 = 0;
        }
        else {
          int v44 = v16;
        }
        int v9 = v43 - v44;
        ++v18;
      }
      while (v18 != a7);
    }
    int v79 = a6 - v19;
    if (a6 > (int)v19)
    {
      if (v11 < v79) {
        int v79 = v11;
      }
      if (v79 >= 1)
      {
        uint64_t v80 = 0;
        int v81 = v79;
        do
        {
          int v82 = &a2[v80];
          uint64_t v83 = &a3[v80];
          float32x4_t v84 = vld1q_dup_f32(v82);
          float32x4_t v85 = vld1q_dup_f32(v83);
          float32x4_t v86 = v14[1];
          float32x4_t v87 = vmlaq_f32(v84, v86, v12[1]);
          float32x4_t v88 = vmlaq_f32(vmlaq_f32(v84, *v14, *v12), *v15, v12[2]);
          float32x4_t v89 = vmlaq_f32(v87, v15[1], v12[3]);
          *uint64_t v15 = *v14;
          v15[1] = v86;
          float32x4_t *v14 = v88;
          v14[1] = v89;
          float32x4_t v90 = v14[2];
          float32x4_t v91 = v14[3];
          float32x4_t v92 = vmlaq_f32(v85, v91, v12[1]);
          float32x4_t v93 = vmlaq_f32(vmlaq_f32(v85, v90, *v12), v15[2], v12[2]);
          float32x4_t v94 = vmlaq_f32(v92, v15[3], v12[3]);
          v15[2] = v90;
          v15[3] = v91;
          void v14[2] = v93;
          v14[3] = v94;
          v80 += a8;
          --v81;
        }
        while (v81);
      }
LABEL_47:
      v11 -= v79;
      uint64_t v19 = (v79 + v19);
    }
  }
  else
  {
    if (a7 < 1)
    {
      uint64_t v19 = 0;
    }
    else
    {
      int v45 = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v11 < 1)
        {
          float32x4_t v61 = v14[4];
          float32x4_t v62 = v14[5];
        }
        else
        {
          uint64_t v46 = 0;
          int v47 = v11;
          do
          {
            float64x2_t v48 = &a2[v46];
            float64x2_t v49 = &a3[v46];
            float32x4_t v50 = vld1q_dup_f32(v48);
            float32x4_t v51 = v14[1];
            float32x4_t v52 = vld1q_dup_f32(v49);
            float32x4_t v53 = vmlaq_f32(vmlaq_f32(v50, *v14, *v12), *v15, v12[4]);
            float32x4_t v54 = vmlaq_f32(vmlaq_f32(v50, v51, v12[1]), v15[1], v12[5]);
            *uint64_t v15 = *v14;
            v15[1] = v51;
            float32x4_t *v14 = v53;
            v14[1] = v54;
            float32x4_t v55 = v14[2];
            float32x4_t v56 = v14[3];
            float32x4_t v57 = vmlaq_f32(vmlaq_f32(v52, v55, *v12), v15[2], v12[4]);
            float32x4_t v58 = vmlaq_f32(vmlaq_f32(v52, v56, v12[1]), v15[3], v12[5]);
            v15[2] = v55;
            v15[3] = v56;
            void v14[2] = v57;
            v14[3] = v58;
            float32x4_t v59 = v14[4];
            float32x4_t v60 = v14[5];
            float32x4_t v61 = vmlaq_f32(vmlaq_f32(v50, v59, v12[2]), v15[4], v12[6]);
            float32x4_t v62 = vmlaq_f32(vmlaq_f32(v52, v60, v12[3]), v15[5], v12[7]);
            v15[4] = v59;
            v15[5] = v60;
            v14[4] = v61;
            void v14[5] = v62;
            v46 += a8;
            --v47;
          }
          while (v47);
          a2 = (const float *)((char *)a2 + v46 * 4);
          a3 = (const float *)((char *)a3 + v46 * 4);
        }
        uint64_t v19 = (v19 + v11);
        float64x2_t v63 = (float32x4_t *)(v13 + 128 * v9);
        float32x4_t v64 = v63[1];
        float32x4_t v66 = v63[4];
        float32x4_t v65 = v63[5];
        float32x4_t v67 = vmlaq_f32(vmulq_f32(v65, v15[1]), v14[1], v64);
        float32x4_t v68 = vmlaq_f32(vmulq_f32(v66, *v15), *v14, *v63);
        float32x4_t v69 = vmlaq_f32(vmulq_f32(v65, v15[3]), v14[3], v64);
        float32x4_t v70 = vmlaq_f32(vmulq_f32(v66, v15[2]), v14[2], *v63);
        int8x16_t v71 = (int8x16_t)vmlaq_f32(vmulq_f32(v63[7], v15[5]), v62, v63[3]);
        int8x16_t v72 = (int8x16_t)vmlaq_f32(vmulq_f32(v63[6], v15[4]), v61, v63[2]);
        int8x16_t v73 = (int8x16_t)vaddq_f32(v68, v67);
        *(float32x2_t *)v73.i8 = vadd_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v73, v73, 8uLL));
        int32x2_t v74 = (int32x2_t)vadd_f32(*(float32x2_t *)v72.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v72, v72, 8uLL));
        *a4 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v73.i8, v74), (float32x2_t)vzip2_s32(*(int32x2_t *)v73.i8, v74)));
        int8x16_t v75 = (int8x16_t)vaddq_f32(v70, v69);
        *(float32x2_t *)v75.i8 = vadd_f32(*(float32x2_t *)v75.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v75, v75, 8uLL));
        int32x2_t v76 = (int32x2_t)vadd_f32(*(float32x2_t *)v71.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v71, v71, 8uLL));
        *a5 = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v75.i8, v76), (float32x2_t)vzip2_s32(*(int32x2_t *)v75.i8, v76)));
        a4 += a9;
        a5 += a9;
        int v77 = v9 + v10;
        if (v77 < v16) {
          int v11 = v17;
        }
        else {
          int v11 = v17 + 1;
        }
        if (v77 < v16) {
          int v78 = 0;
        }
        else {
          int v78 = v16;
        }
        int v9 = v77 - v78;
        ++v45;
      }
      while (v45 != a7);
    }
    int v79 = a6 - v19;
    if (a6 > (int)v19)
    {
      if (v11 < v79) {
        int v79 = v11;
      }
      if (v79 >= 1)
      {
        uint64_t v95 = 0;
        int v96 = v79;
        do
        {
          float64x2_t v97 = &a2[v95];
          float64x2_t v98 = &a3[v95];
          float32x4_t v99 = vld1q_dup_f32(v97);
          float32x4_t v100 = v14[1];
          float32x4_t v101 = vld1q_dup_f32(v98);
          float32x4_t v102 = vmlaq_f32(vmlaq_f32(v99, *v14, *v12), *v15, v12[4]);
          float32x4_t v103 = vmlaq_f32(vmlaq_f32(v99, v100, v12[1]), v15[1], v12[5]);
          *uint64_t v15 = *v14;
          v15[1] = v100;
          float32x4_t *v14 = v102;
          v14[1] = v103;
          float32x4_t v104 = v14[2];
          float32x4_t v105 = v14[3];
          float32x4_t v106 = vmlaq_f32(vmlaq_f32(v101, v104, *v12), v15[2], v12[4]);
          float32x4_t v107 = vmlaq_f32(vmlaq_f32(v101, v105, v12[1]), v15[3], v12[5]);
          v15[2] = v104;
          v15[3] = v105;
          void v14[2] = v106;
          v14[3] = v107;
          float32x4_t v108 = v14[4];
          float32x4_t v109 = v14[5];
          float32x4_t v110 = vmlaq_f32(vmlaq_f32(v99, v108, v12[2]), v15[4], v12[6]);
          float32x4_t v111 = vmlaq_f32(vmlaq_f32(v101, v109, v12[3]), v15[5], v12[7]);
          v15[4] = v108;
          v15[5] = v109;
          v14[4] = v110;
          void v14[5] = v111;
          v95 += a8;
          --v96;
        }
        while (v96);
      }
      goto LABEL_47;
    }
  }
  *((_DWORD *)this + 14) = v9;
  *((_DWORD *)this + 18) = v11;
  return v19;
}

uint64_t RamstadSRC::processStereoFrac(RamstadSRC *this, const float *a2, const float *a3, float *a4, float *a5, int a6, int a7, int a8, int a9)
{
  int v10 = *((_DWORD *)this + 13);
  unsigned int v9 = *((_DWORD *)this + 14);
  int v11 = *((_DWORD *)this + 18);
  uint64_t v12 = *(float32x4_t **)(*(void *)this + 24);
  uint64_t v13 = *(void *)(*(void *)this + 48);
  uint64_t v14 = (float32x4_t *)*((void *)this + 11);
  uint64_t v15 = (float32x4_t *)*((void *)this + 14);
  int v16 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a7 >= 1)
    {
      LODWORD(v17) = 0;
      int v18 = 0;
      while (1)
      {
        uint64_t v17 = (v17 + v11);
        if ((int)v17 > *((_DWORD *)this + 58)) {
          goto LABEL_39;
        }
        if (v11 < 1)
        {
          float32x4_t v31 = v14[2];
          float32x4_t v32 = v14[3];
        }
        else
        {
          uint64_t v19 = 0;
          do
          {
            uint64_t v20 = &a2[v19];
            int v21 = &a3[v19];
            float32x4_t v22 = vld1q_dup_f32(v20);
            float32x4_t v23 = vld1q_dup_f32(v21);
            float32x4_t v24 = v14[1];
            float32x4_t v25 = vmlaq_f32(v22, v24, v12[1]);
            float32x4_t v26 = vmlaq_f32(vmlaq_f32(v22, *v14, *v12), *v15, v12[2]);
            float32x4_t v27 = vmlaq_f32(v25, v15[1], v12[3]);
            *uint64_t v15 = *v14;
            v15[1] = v24;
            float32x4_t *v14 = v26;
            v14[1] = v27;
            float32x4_t v28 = v14[2];
            float32x4_t v29 = v14[3];
            float32x4_t v30 = vmlaq_f32(v23, v29, v12[1]);
            float32x4_t v31 = vmlaq_f32(vmlaq_f32(v23, v28, *v12), v15[2], v12[2]);
            float32x4_t v32 = vmlaq_f32(v30, v15[3], v12[3]);
            v15[2] = v28;
            v15[3] = v29;
            void v14[2] = v31;
            v14[3] = v32;
            v19 += a8;
            --v11;
          }
          while (v11);
          a2 = (const float *)((char *)a2 + v19 * 4);
          a3 = (const float *)((char *)a3 + v19 * 4);
        }
        float v33 = *((double *)this + 10) * (double)(v9 & 0x7FFFFF);
        uint64_t v34 = (v9 >> 22) & 0x1FE;
        float64x2_t v35 = (float32x4_t *)(v13 + 32 * v34);
        float32x4_t v36 = (float32x4_t *)(v13 + 32 * (v34 + 2));
        float32x4_t v37 = v35[1];
        float32x4_t v38 = v14[1];
        float32x4_t v40 = v35[2];
        float32x4_t v39 = v35[3];
        float32x4_t v41 = v15[1];
        float32x4_t v43 = v15[2];
        float32x4_t v42 = v15[3];
        int8x16_t v44 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40, *v15), *v14, *v35), vmlaq_f32(vmulq_f32(v39, v41), v38, v37));
        *(float32x2_t *)v44.i8 = vadd_f32(*(float32x2_t *)v44.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v44, v44, 8uLL));
        int8x16_t v45 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v40, v43), v31, *v35), vmlaq_f32(vmulq_f32(v39, v42), v32, v37));
        *(float32x2_t *)v45.i8 = vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL));
        float32x4_t v46 = v36[1];
        float32x4_t v48 = v36[2];
        float32x4_t v47 = v36[3];
        float32x4_t v49 = vmlaq_f32(vmulq_f32(v43, v48), v31, *v36);
        int8x16_t v50 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v15, v48), *v14, *v36), vmlaq_f32(vmulq_f32(v41, v47), v38, v46));
        *(float32x2_t *)v50.i8 = vadd_f32(*(float32x2_t *)v50.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v50, v50, 8uLL));
        *(float32x2_t *)v50.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v44.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v50.i8, *(int32x2_t *)v44.i8));
        int8x16_t v51 = (int8x16_t)vaddq_f32(v49, vmlaq_f32(vmulq_f32(v42, v47), v32, v46));
        *(float32x2_t *)v51.i8 = vadd_f32(*(float32x2_t *)v51.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
        *(float32x2_t *)v51.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v45.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v51.i8, *(int32x2_t *)v45.i8));
        *a4 = *(float *)&v50.i32[1] + (float)(v33 * (float)(*(float *)v50.i32 - *(float *)&v50.i32[1]));
        *a5 = *(float *)&v51.i32[1] + (float)(v33 * (float)(*(float *)v51.i32 - *(float *)&v51.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v36) = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v16 + (v36 >> 31);
        if (++v18 == a7) {
          goto LABEL_23;
        }
      }
    }
    uint64_t v17 = 0;
LABEL_23:
    int v101 = a6 - v17;
    if (a6 > (int)v17)
    {
      if (v11 < v101) {
        int v101 = v11;
      }
      if (v101 >= 1)
      {
        uint64_t v102 = 0;
        int v103 = v101;
        do
        {
          float32x4_t v104 = &a2[v102];
          float32x4_t v105 = &a3[v102];
          float32x4_t v106 = vld1q_dup_f32(v104);
          float32x4_t v107 = vld1q_dup_f32(v105);
          float32x4_t v108 = v14[1];
          float32x4_t v109 = vmlaq_f32(v106, v108, v12[1]);
          float32x4_t v110 = vmlaq_f32(vmlaq_f32(v106, *v14, *v12), *v15, v12[2]);
          float32x4_t v111 = vmlaq_f32(v109, v15[1], v12[3]);
          *uint64_t v15 = *v14;
          v15[1] = v108;
          float32x4_t *v14 = v110;
          v14[1] = v111;
          float32x4_t v112 = v14[2];
          float32x4_t v113 = v14[3];
          float32x4_t v114 = vmlaq_f32(v107, v113, v12[1]);
          float32x4_t v115 = vmlaq_f32(vmlaq_f32(v107, v112, *v12), v15[2], v12[2]);
          float32x4_t v116 = vmlaq_f32(v114, v15[3], v12[3]);
          v15[2] = v112;
          v15[3] = v113;
          void v14[2] = v115;
          v14[3] = v116;
          v102 += a8;
          --v103;
        }
        while (v103);
      }
LABEL_37:
      v11 -= v101;
      uint64_t v17 = (v101 + v17);
    }
  }
  else
  {
    if (a7 >= 1)
    {
      int v52 = 0;
      LODWORD(v17) = 0;
      while (1)
      {
        uint64_t v17 = (v17 + v11);
        if ((int)v17 > *((_DWORD *)this + 58)) {
          break;
        }
        if (v11 < 1)
        {
          float32x4_t v67 = v14[4];
          float32x4_t v68 = v14[5];
        }
        else
        {
          uint64_t v53 = 0;
          do
          {
            float32x4_t v54 = &a2[v53];
            float32x4_t v55 = &a3[v53];
            float32x4_t v56 = vld1q_dup_f32(v54);
            float32x4_t v57 = v14[1];
            float32x4_t v58 = vld1q_dup_f32(v55);
            float32x4_t v59 = vmlaq_f32(vmlaq_f32(v56, *v14, *v12), *v15, v12[4]);
            float32x4_t v60 = vmlaq_f32(vmlaq_f32(v56, v57, v12[1]), v15[1], v12[5]);
            *uint64_t v15 = *v14;
            v15[1] = v57;
            float32x4_t *v14 = v59;
            v14[1] = v60;
            float32x4_t v61 = v14[2];
            float32x4_t v62 = v14[3];
            float32x4_t v63 = vmlaq_f32(vmlaq_f32(v58, v61, *v12), v15[2], v12[4]);
            float32x4_t v64 = vmlaq_f32(vmlaq_f32(v58, v62, v12[1]), v15[3], v12[5]);
            v15[2] = v61;
            v15[3] = v62;
            void v14[2] = v63;
            v14[3] = v64;
            float32x4_t v65 = v14[4];
            float32x4_t v66 = v14[5];
            float32x4_t v67 = vmlaq_f32(vmlaq_f32(v56, v65, v12[2]), v15[4], v12[6]);
            float32x4_t v68 = vmlaq_f32(vmlaq_f32(v58, v66, v12[3]), v15[5], v12[7]);
            v15[4] = v65;
            v15[5] = v66;
            v14[4] = v67;
            void v14[5] = v68;
            v53 += a8;
            --v11;
          }
          while (v11);
          a2 = (const float *)((char *)a2 + v53 * 4);
          a3 = (const float *)((char *)a3 + v53 * 4);
        }
        float v69 = *((double *)this + 10) * (double)(v9 & 0x7FFFFF);
        uint64_t v70 = (v9 >> 21) & 0x3FC;
        int8x16_t v71 = (float32x4_t *)(v13 + 32 * v70);
        int8x16_t v72 = (float32x4_t *)(v13 + 32 * (v70 + 4));
        float32x4_t v73 = v71[1];
        float32x4_t v74 = v14[1];
        float32x4_t v76 = v71[4];
        float32x4_t v75 = v71[5];
        float32x4_t v77 = v15[1];
        float32x4_t v78 = vmlaq_f32(vmulq_f32(v75, v77), v74, v73);
        float32x4_t v79 = v14[2];
        float32x4_t v80 = v14[3];
        float32x4_t v82 = v15[2];
        float32x4_t v81 = v15[3];
        float32x4_t v83 = vmlaq_f32(vmulq_f32(v75, v81), v80, v73);
        float32x4_t v85 = v15[4];
        float32x4_t v84 = v15[5];
        int8x16_t v86 = (int8x16_t)vmlaq_f32(vmulq_f32(v71[7], v84), v68, v71[3]);
        int8x16_t v87 = (int8x16_t)vmlaq_f32(vmulq_f32(v71[6], v85), v67, v71[2]);
        int8x16_t v88 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v76, *v15), *v14, *v71), v78);
        *(float32x2_t *)v88.i8 = vadd_f32(*(float32x2_t *)v88.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v88, v88, 8uLL));
        *(float32x2_t *)v73.f32 = vadd_f32(*(float32x2_t *)v87.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v87, v87, 8uLL));
        int8x16_t v89 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v76, v82), v79, *v71), v83);
        *(float32x2_t *)v89.i8 = vadd_f32(*(float32x2_t *)v89.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v89, v89, 8uLL));
        *(float32x2_t *)v76.f32 = vadd_f32(*(float32x2_t *)v86.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v86, v86, 8uLL));
        float32x4_t v90 = v72[1];
        float32x4_t v92 = v72[4];
        float32x4_t v91 = v72[5];
        float32x4_t v93 = vmlaq_f32(vmulq_f32(v77, v91), v74, v90);
        float32x4_t v94 = vmlaq_f32(vmulq_f32(v81, v91), v80, v90);
        float32x4_t v95 = vmlaq_f32(vmulq_f32(v82, v92), v79, *v72);
        int8x16_t v96 = (int8x16_t)vmlaq_f32(vmulq_f32(v84, v72[7]), v68, v72[3]);
        int8x16_t v97 = (int8x16_t)vmlaq_f32(vmulq_f32(v85, v72[6]), v67, v72[2]);
        int8x16_t v98 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*v15, v92), *v14, *v72), v93);
        *(float32x2_t *)v98.i8 = vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL));
        int32x2_t v99 = (int32x2_t)vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v97, v97, 8uLL));
        *(float32x2_t *)v98.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v98.i8, *(int32x2_t *)v88.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v98.i8, *(int32x2_t *)v88.i8)), vadd_f32((float32x2_t)vzip1_s32(v99, *(int32x2_t *)v73.f32), (float32x2_t)vzip2_s32(v99, *(int32x2_t *)v73.f32)));
        int8x16_t v100 = (int8x16_t)vaddq_f32(v95, v94);
        *(float32x2_t *)v100.i8 = vadd_f32(*(float32x2_t *)v100.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v100, v100, 8uLL));
        *(float32x2_t *)v88.i8 = vadd_f32(*(float32x2_t *)v96.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL));
        *(float32x2_t *)v100.i8 = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v100.i8, *(int32x2_t *)v89.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v100.i8, *(int32x2_t *)v89.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v76.f32), (float32x2_t)vzip2_s32(*(int32x2_t *)v88.i8, *(int32x2_t *)v76.f32)));
        *a4 = *(float *)&v98.i32[1] + (float)(v69 * (float)(*(float *)v98.i32 - *(float *)&v98.i32[1]));
        *a5 = *(float *)&v100.i32[1] + (float)(v69 * (float)(*(float *)v100.i32 - *(float *)&v100.i32[1]));
        a4 += a9;
        a5 += a9;
        LODWORD(v72) = v9 + v10;
        unsigned int v9 = (v9 + v10) & 0x7FFFFFFF;
        int v11 = v16 + (v72 >> 31);
        if (++v52 == a7) {
          goto LABEL_31;
        }
      }
LABEL_39:
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x22A63EA30](exception, "RamstadSRC::processStereoFrac preflight prediction failed.");
    }
    uint64_t v17 = 0;
LABEL_31:
    int v101 = a6 - v17;
    if (a6 > (int)v17)
    {
      if (v11 < v101) {
        int v101 = v11;
      }
      if (v101 >= 1)
      {
        uint64_t v117 = 0;
        int v118 = v101;
        do
        {
          float64x2_t v119 = &a2[v117];
          float64x2_t v120 = &a3[v117];
          float32x4_t v121 = vld1q_dup_f32(v119);
          float32x4_t v122 = v14[1];
          float32x4_t v123 = vld1q_dup_f32(v120);
          float32x4_t v124 = vmlaq_f32(vmlaq_f32(v121, *v14, *v12), *v15, v12[4]);
          float32x4_t v125 = vmlaq_f32(vmlaq_f32(v121, v122, v12[1]), v15[1], v12[5]);
          *uint64_t v15 = *v14;
          v15[1] = v122;
          float32x4_t *v14 = v124;
          v14[1] = v125;
          float32x4_t v126 = v14[2];
          float32x4_t v127 = v14[3];
          float32x4_t v128 = vmlaq_f32(vmlaq_f32(v123, v126, *v12), v15[2], v12[4]);
          float32x4_t v129 = vmlaq_f32(vmlaq_f32(v123, v127, v12[1]), v15[3], v12[5]);
          v15[2] = v126;
          v15[3] = v127;
          void v14[2] = v128;
          v14[3] = v129;
          float32x4_t v130 = v14[4];
          float32x4_t v131 = v14[5];
          float32x4_t v132 = vmlaq_f32(vmlaq_f32(v121, v130, v12[2]), v15[4], v12[6]);
          float32x4_t v133 = vmlaq_f32(vmlaq_f32(v123, v131, v12[3]), v15[5], v12[7]);
          v15[4] = v130;
          v15[5] = v131;
          v14[4] = v132;
          void v14[5] = v133;
          v117 += a8;
          --v118;
        }
        while (v118);
      }
      goto LABEL_37;
    }
  }
  *((_DWORD *)this + 14) = v9;
  *((_DWORD *)this + 18) = v11;
  return v17;
}

void sub_225D176B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double RamstadSRC::processMulti(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  RamstadSRC::checkPreflight(this, a4, a5);
  if (*((unsigned char *)this + 77))
  {
    if (*((unsigned char *)this + 76)) {
      RamstadSRC::processMultiIntD(this, a2, a3, a4, a5, a6, a7);
    }
    else {
      RamstadSRC::processMultiFracD(this, a2, a3, a4, a5, a6, a7);
    }
  }
  else if (*((unsigned char *)this + 76))
  {
    RamstadSRC::processMultiInt(this, a2, a3, a4, a5, a6, a7);
  }
  else
  {
    RamstadSRC::processMultiFrac(this, a2, a3, a4, a5, a6, a7);
  }
  double result = NAN;
  *((void *)this + 29) = -1;
  *((_DWORD *)this + 60) = -1;
  return result;
}

void sub_225D17784(_Unwind_Exception *a1)
{
  *(void *)(v1 + 232) = -1;
  *(_DWORD *)(v1 + 240) = -1;
  _Unwind_Resume(a1);
}

uint64_t RamstadSRC::processMultiIntD(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *((void *)this + 1);
  int v11 = *(float64x2_t **)(v10 + 24);
  uint64_t v12 = *(void *)(v10 + 48);
  uint64_t v13 = (float64x2_t *)*((void *)this + 17);
  uint64_t v14 = (float64x2_t *)*((void *)this + 20);
  int v15 = *((_DWORD *)this + 9);
  int v16 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v20 = 0;
      LODWORD(v19) = 0;
    }
    else
    {
      uint64_t v17 = 0;
      int v18 = 0;
      LODWORD(v19) = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v21 = 0;
          uint64_t v19 = (int)v19;
          do
          {
            uint64_t v22 = *((unsigned int *)this + 8);
            if ((int)v22 >= 1)
            {
              float32x4_t v23 = a2;
              float32x4_t v24 = v13;
              float32x4_t v25 = v14;
              do
              {
                uint64_t v26 = (uint64_t)*v23++;
                float64x2_t v27 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v26 + 4 * v19)), 0);
                float64x2_t v29 = *v24;
                float64x2_t v28 = v24[1];
                float64x2_t v31 = v24[2];
                float64x2_t v30 = v24[3];
                float64x2_t v32 = vmlaq_f64(v27, v31, v11[2]);
                float64x2_t v33 = vmlaq_f64(v27, v30, v11[3]);
                float64x2_t v34 = vmlaq_f64(v27, *v24, *v11);
                float64x2_t v35 = vmlaq_f64(vmlaq_f64(v27, v28, v11[1]), v25[1], v11[5]);
                float64x2_t v36 = vmlaq_f64(v34, *v25, v11[4]);
                float64x2_t v37 = vmlaq_f64(v33, v25[3], v11[7]);
                float64x2_t v38 = vmlaq_f64(v32, v25[2], v11[6]);
                v25[2] = v31;
                v25[3] = v30;
                *float32x4_t v25 = v29;
                v25[1] = v28;
                v25 += 4;
                v24[2] = v38;
                v24[3] = v37;
                *float32x4_t v24 = v36;
                v24[1] = v35;
                v24 += 4;
                --v22;
              }
              while (v22);
            }
            v19 += a6;
            ++v21;
          }
          while (v21 != v9);
        }
        uint64_t v39 = *((unsigned int *)this + 8);
        if ((int)v39 >= 1)
        {
          float32x4_t v41 = v13;
          float32x4_t v42 = v14;
          float32x4_t v43 = a3;
          do
          {
            float64x2_t v44 = v42[2];
            float64x2_t v45 = v42[3];
            float64x2_t v46 = *v42;
            float64x2_t v47 = v42[1];
            v42 += 4;
            uint64_t v48 = (uint64_t)*v43++;
            float32x4_t v40 = (float64x2_t *)(v12 + ((uint64_t)(2 * v7) << 6));
            float v49 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v40[4], v46), *v41, *v40), vmlaq_f64(vmulq_f64(v40[6], v44), v41[2], v40[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v40[5], v47), v41[1], v40[1]), vmlaq_f64(vmulq_f64(v40[7], v45), v41[3], v40[3]))));
            *(float *)(v48 + 4 * v17) = v49;
            v41 += 4;
            --v39;
          }
          while (v39);
        }
        uint64_t v20 = (v20 + v9);
        int v50 = v7 + v8;
        if (v50 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v50 < v15) {
          int v51 = 0;
        }
        else {
          int v51 = v15;
        }
        int v7 = v50 - v51;
        ++v18;
        v17 += a7;
      }
      while (v18 != a5);
    }
    int v133 = a4 - v20;
    if (a4 > (int)v20)
    {
      if (v9 < v133) {
        int v133 = v9;
      }
      if (v133 >= 1)
      {
        int v134 = 0;
        uint64_t v135 = (int)v19;
        uint64_t v136 = a6;
        do
        {
          uint64_t v137 = *((unsigned int *)this + 8);
          if ((int)v137 >= 1)
          {
            float64x2_t v138 = a2;
            float64x2_t v139 = v13;
            float64x2_t v140 = v14;
            do
            {
              uint64_t v141 = (uint64_t)*v138++;
              float64x2_t v142 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v141 + 4 * v135)), 0);
              float64x2_t v144 = *v139;
              float64x2_t v143 = v139[1];
              float64x2_t v146 = v139[2];
              float64x2_t v145 = v139[3];
              float64x2_t v147 = vmlaq_f64(v142, v146, v11[2]);
              float64x2_t v148 = vmlaq_f64(v142, v145, v11[3]);
              float64x2_t v149 = vmlaq_f64(v142, *v139, *v11);
              float64x2_t v150 = vmlaq_f64(vmlaq_f64(v142, v143, v11[1]), v140[1], v11[5]);
              float64x2_t v151 = vmlaq_f64(v149, *v140, v11[4]);
              float64x2_t v152 = vmlaq_f64(v148, v140[3], v11[7]);
              float64x2_t v153 = vmlaq_f64(v147, v140[2], v11[6]);
              v140[2] = v146;
              v140[3] = v145;
              *float64x2_t v140 = v144;
              v140[1] = v143;
              v140 += 4;
              v139[2] = v153;
              v139[3] = v152;
              *float64x2_t v139 = v151;
              v139[1] = v150;
              v139 += 4;
              --v137;
            }
            while (v137);
          }
          v135 += v136;
          ++v134;
        }
        while (v134 != v133);
      }
LABEL_67:
      v9 -= v133;
      uint64_t v20 = (v133 + v20);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v20 = 0;
      LODWORD(v54) = 0;
    }
    else
    {
      uint64_t v52 = 0;
      int v53 = 0;
      LODWORD(v54) = 0;
      LODWORD(v20) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v55 = 0;
          uint64_t v54 = (int)v54;
          do
          {
            int v56 = *((_DWORD *)this + 8);
            unint64_t v57 = (v56 - 1);
            float32x4_t v58 = v13;
            float32x4_t v59 = v14;
            if (v56 >= 2)
            {
              unint64_t v60 = 0;
              float32x4_t v59 = v14;
              float32x4_t v58 = v13;
              do
              {
                float32x4_t v61 = &a2[v60];
                float64x2_t v62 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v61)[v54]), 0);
                float64x2_t v63 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v61 + 1) + 4 * v54)), 0);
                float64x2_t v64 = *v58;
                float64x2_t v65 = v58[1];
                float64x2_t v66 = v58[2];
                float64x2_t v67 = v58[3];
                float64x2_t v68 = vmlaq_f64(vmlaq_f64(v62, *v58, *v11), *v59, v11[8]);
                float64x2_t v69 = vmlaq_f64(vmlaq_f64(v62, v65, v11[1]), v59[1], v11[9]);
                float64x2_t v70 = vmlaq_f64(vmlaq_f64(v62, v66, v11[2]), v59[2], v11[10]);
                float64x2_t v71 = vmlaq_f64(vmlaq_f64(v62, v67, v11[3]), v59[3], v11[11]);
                v59[2] = v66;
                v59[3] = v67;
                *float32x4_t v59 = v64;
                v59[1] = v65;
                v58[2] = v70;
                v58[3] = v71;
                *float32x4_t v58 = v68;
                v58[1] = v69;
                float64x2_t v72 = v58[4];
                float64x2_t v73 = v58[5];
                float64x2_t v74 = v58[6];
                float64x2_t v75 = v58[7];
                float64x2_t v76 = vmlaq_f64(vmlaq_f64(v63, v72, *v11), v59[4], v11[8]);
                float64x2_t v77 = vmlaq_f64(vmlaq_f64(v63, v73, v11[1]), v59[5], v11[9]);
                float64x2_t v78 = vmlaq_f64(vmlaq_f64(v63, v74, v11[2]), v59[6], v11[10]);
                float64x2_t v79 = vmlaq_f64(vmlaq_f64(v63, v75, v11[3]), v59[7], v11[11]);
                v59[4] = v72;
                v59[5] = v73;
                v59[6] = v74;
                v59[7] = v75;
                v58[6] = v78;
                v58[7] = v79;
                v58[4] = v76;
                v58[5] = v77;
                float64x2_t v81 = v58[8];
                float64x2_t v80 = v58[9];
                float64x2_t v83 = v58[10];
                float64x2_t v82 = v58[11];
                float64x2_t v84 = vmlaq_f64(v63, v83, v11[6]);
                float64x2_t v85 = vmlaq_f64(v62, v81, v11[4]);
                float64x2_t v86 = vmlaq_f64(vmlaq_f64(v62, v80, v11[5]), v59[9], v11[13]);
                float64x2_t v87 = vmlaq_f64(v85, v59[8], v11[12]);
                float64x2_t v88 = vmlaq_f64(vmlaq_f64(v63, v82, v11[7]), v59[11], v11[15]);
                float64x2_t v89 = vmlaq_f64(v84, v59[10], v11[14]);
                v59[8] = v81;
                v59[9] = v80;
                v59[10] = v83;
                v59[11] = v82;
                v58[10] = v89;
                v58[11] = v88;
                v58[8] = v87;
                v58[9] = v86;
                v58 += 12;
                v59 += 12;
                v60 += 2;
              }
              while (v60 < v57);
            }
            if (v56)
            {
              float64x2_t v90 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[(int)v57][v54]), 0);
              float64x2_t v91 = *v58;
              float64x2_t v92 = v58[1];
              float64x2_t v93 = v58[2];
              float64x2_t v94 = v58[3];
              float64x2_t v95 = vmlaq_f64(vmlaq_f64(v90, *v58, *v11), *v59, v11[8]);
              float64x2_t v96 = vmlaq_f64(vmlaq_f64(v90, v92, v11[1]), v59[1], v11[9]);
              float64x2_t v97 = vmlaq_f64(vmlaq_f64(v90, v93, v11[2]), v59[2], v11[10]);
              float64x2_t v98 = vmlaq_f64(vmlaq_f64(v90, v94, v11[3]), v59[3], v11[11]);
              v59[2] = v93;
              v59[3] = v94;
              *float32x4_t v59 = v91;
              v59[1] = v92;
              v58[2] = v97;
              v58[3] = v98;
              *float32x4_t v58 = v95;
              v58[1] = v96;
              float64x2_t v100 = v58[4];
              float64x2_t v99 = v58[5];
              float64x2_t v102 = v58[6];
              float64x2_t v101 = v58[7];
              float64x2_t v103 = vmlaq_f64(v90, v100, v11[4]);
              float64x2_t v104 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v101, v11[7]), v59[7], v11[15]);
              float64x2_t v105 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v102, v11[6]), v59[6], v11[14]);
              float64x2_t v106 = vmlaq_f64(vmlaq_f64(v90, v99, v11[5]), v59[5], v11[13]);
              float64x2_t v107 = vmlaq_f64(v103, v59[4], v11[12]);
              v59[4] = v100;
              v59[5] = v99;
              v59[6] = v102;
              v59[7] = v101;
              v58[6] = v105;
              v58[7] = v104;
              v58[4] = v107;
              v58[5] = v106;
            }
            v54 += a6;
            ++v55;
          }
          while (v55 != v9);
        }
        float32x4_t v108 = (float64x2_t *)(v12 + ((uint64_t)(4 * v7) << 6));
        int v109 = *((_DWORD *)this + 8);
        float32x4_t v110 = v13;
        float32x4_t v111 = v14;
        unint64_t v112 = (v109 - 1);
        if (v109 > 1)
        {
          unint64_t v113 = 0;
          float32x4_t v111 = v14;
          float32x4_t v110 = v13;
          do
          {
            float32x4_t v114 = &a3[v113];
            float64x2_t v115 = v108[1];
            float64x2_t v117 = v108[2];
            float64x2_t v116 = v108[3];
            float64x2_t v118 = v108[10];
            float64x2_t v119 = v108[11];
            float64x2_t v120 = v108[8];
            float64x2_t v121 = v108[9];
            float64x2_t v122 = vmlaq_f64(vmulq_f64(v121, v111[5]), v110[5], v115);
            float32x4_t v124 = *v114;
            uint64_t v123 = *((void *)v114 + 1);
            int64x2_t v125 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v120, *v111), *v110, *v108), vmlaq_f64(vmulq_f64(v118, v111[2]), v110[2], v117)), vaddq_f64(vmlaq_f64(vmulq_f64(v121, v111[1]), v110[1], v115), vmlaq_f64(vmulq_f64(v119, v111[3]), v110[3], v116)));
            int64x2_t v126 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v108[12], v111[8]), v110[8], v108[4]), vmlaq_f64(vmulq_f64(v108[13], v111[9]), v110[9], v108[5]));
            *(double *)v126.i64 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v125, v126), (float64x2_t)vzip2q_s64(v125, v126)));
            int64x2_t v127 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v120, v111[4]), v110[4], *v108), vmlaq_f64(vmulq_f64(v118, v111[6]), v110[6], v117)), vaddq_f64(v122, vmlaq_f64(vmulq_f64(v119, v111[7]), v110[7], v116)));
            int64x2_t v128 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v108[14], v111[10]), v110[10], v108[6]), vmlaq_f64(vmulq_f64(v108[15], v111[11]), v110[11], v108[7]));
            *(float *)v126.i32 = *(double *)v126.i64;
            *(float *)v127.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v127, v128), (float64x2_t)vzip2q_s64(v127, v128)));
            v124[v52] = *(float *)v126.i32;
            *(_DWORD *)(v123 + 4 * v52) = v127.i32[0];
            v110 += 12;
            v111 += 12;
            v113 += 2;
          }
          while (v113 < v112);
        }
        if (v109)
        {
          int64x2_t v129 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v108[8], *v111), *v110, *v108), vmlaq_f64(vmulq_f64(v108[10], v111[2]), v110[2], v108[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v108[9], v111[1]), v110[1], v108[1]), vmlaq_f64(vmulq_f64(v108[11], v111[3]), v110[3], v108[3])));
          int64x2_t v130 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v108[12], v111[4]), v110[4], v108[4]), vmlaq_f64(vmulq_f64(v108[14], v111[6]), v110[6], v108[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v108[13], v111[5]), v110[5], v108[5]), vmlaq_f64(vmulq_f64(v108[15], v111[7]), v110[7], v108[7])));
          *(float *)v129.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v129, v130), (float64x2_t)vzip2q_s64(v129, v130)));
          LODWORD(a3[(int)v112][v52]) = v129.i32[0];
        }
        uint64_t v20 = (v20 + v9);
        int v131 = v7 + v8;
        if (v131 < v15) {
          int v9 = v16;
        }
        else {
          int v9 = v16 + 1;
        }
        if (v131 < v15) {
          int v132 = 0;
        }
        else {
          int v132 = v15;
        }
        int v7 = v131 - v132;
        ++v53;
        v52 += a7;
      }
      while (v53 != a5);
    }
    int v133 = a4 - v20;
    if (a4 > (int)v20)
    {
      if (v9 < v133) {
        int v133 = v9;
      }
      if (v133 >= 1)
      {
        int v154 = 0;
        uint64_t v155 = (int)v54;
        uint64_t v156 = a6;
        do
        {
          int v157 = *((_DWORD *)this + 8);
          unint64_t v158 = (v157 - 1);
          float64x2_t v159 = v13;
          float64x2_t v160 = v14;
          if (v157 >= 2)
          {
            unint64_t v161 = 0;
            float64x2_t v160 = v14;
            float64x2_t v159 = v13;
            do
            {
              float64x2_t v162 = &a2[v161];
              float64x2_t v163 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v162)[v155]), 0);
              float64x2_t v164 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v162 + 1) + 4 * v155)), 0);
              float64x2_t v165 = *v159;
              float64x2_t v166 = v159[1];
              float64x2_t v167 = v159[2];
              float64x2_t v168 = v159[3];
              float64x2_t v169 = vmlaq_f64(vmlaq_f64(v163, *v159, *v11), *v160, v11[8]);
              float64x2_t v170 = vmlaq_f64(vmlaq_f64(v163, v166, v11[1]), v160[1], v11[9]);
              float64x2_t v171 = vmlaq_f64(vmlaq_f64(v163, v167, v11[2]), v160[2], v11[10]);
              float64x2_t v172 = vmlaq_f64(vmlaq_f64(v163, v168, v11[3]), v160[3], v11[11]);
              v160[2] = v167;
              v160[3] = v168;
              *float64x2_t v160 = v165;
              v160[1] = v166;
              v159[2] = v171;
              v159[3] = v172;
              *float64x2_t v159 = v169;
              v159[1] = v170;
              float64x2_t v173 = v159[4];
              float64x2_t v174 = v159[5];
              float64x2_t v175 = v159[6];
              float64x2_t v176 = v159[7];
              float64x2_t v177 = vmlaq_f64(vmlaq_f64(v164, v173, *v11), v160[4], v11[8]);
              float64x2_t v178 = vmlaq_f64(vmlaq_f64(v164, v174, v11[1]), v160[5], v11[9]);
              float64x2_t v179 = vmlaq_f64(vmlaq_f64(v164, v175, v11[2]), v160[6], v11[10]);
              float64x2_t v180 = vmlaq_f64(vmlaq_f64(v164, v176, v11[3]), v160[7], v11[11]);
              v160[4] = v173;
              v160[5] = v174;
              v160[6] = v175;
              v160[7] = v176;
              v159[6] = v179;
              v159[7] = v180;
              v159[4] = v177;
              v159[5] = v178;
              float64x2_t v182 = v159[8];
              float64x2_t v181 = v159[9];
              float64x2_t v184 = v159[10];
              float64x2_t v183 = v159[11];
              float64x2_t v185 = vmlaq_f64(v164, v184, v11[6]);
              float64x2_t v186 = vmlaq_f64(v163, v182, v11[4]);
              float64x2_t v187 = vmlaq_f64(vmlaq_f64(v163, v181, v11[5]), v160[9], v11[13]);
              float64x2_t v188 = vmlaq_f64(v186, v160[8], v11[12]);
              float64x2_t v189 = vmlaq_f64(vmlaq_f64(v164, v183, v11[7]), v160[11], v11[15]);
              float64x2_t v190 = vmlaq_f64(v185, v160[10], v11[14]);
              v160[8] = v182;
              v160[9] = v181;
              v160[10] = v184;
              v160[11] = v183;
              v159[10] = v190;
              v159[11] = v189;
              v159[8] = v188;
              v159[9] = v187;
              v159 += 12;
              v160 += 12;
              v161 += 2;
            }
            while (v161 < v158);
          }
          if (v157)
          {
            float64x2_t v191 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[(int)v158][v155]), 0);
            float64x2_t v192 = *v159;
            float64x2_t v193 = v159[1];
            float64x2_t v194 = v159[2];
            float64x2_t v195 = v159[3];
            float64x2_t v196 = vmlaq_f64(vmlaq_f64(v191, *v159, *v11), *v160, v11[8]);
            float64x2_t v197 = vmlaq_f64(vmlaq_f64(v191, v193, v11[1]), v160[1], v11[9]);
            float64x2_t v198 = vmlaq_f64(vmlaq_f64(v191, v194, v11[2]), v160[2], v11[10]);
            float64x2_t v199 = vmlaq_f64(vmlaq_f64(v191, v195, v11[3]), v160[3], v11[11]);
            v160[2] = v194;
            v160[3] = v195;
            *float64x2_t v160 = v192;
            v160[1] = v193;
            v159[2] = v198;
            v159[3] = v199;
            *float64x2_t v159 = v196;
            v159[1] = v197;
            float64x2_t v201 = v159[4];
            float64x2_t v200 = v159[5];
            float64x2_t v203 = v159[6];
            float64x2_t v202 = v159[7];
            float64x2_t v204 = vmlaq_f64(v191, v201, v11[4]);
            float64x2_t v205 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v202, v11[7]), v160[7], v11[15]);
            float64x2_t v206 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v203, v11[6]), v160[6], v11[14]);
            float64x2_t v207 = vmlaq_f64(vmlaq_f64(v191, v200, v11[5]), v160[5], v11[13]);
            float64x2_t v208 = vmlaq_f64(v204, v160[4], v11[12]);
            v160[4] = v201;
            v160[5] = v200;
            v160[6] = v203;
            v160[7] = v202;
            v159[6] = v206;
            v159[7] = v205;
            v159[4] = v208;
            v159[5] = v207;
          }
          v155 += v156;
          ++v154;
        }
        while (v154 != v133);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v20;
}

uint64_t RamstadSRC::processMultiFracD(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  unsigned int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *((void *)this + 1);
  int v11 = *(float64x2_t **)(v10 + 24);
  uint64_t v12 = *(void *)(v10 + 48);
  uint64_t v13 = (float64x2_t *)*((void *)this + 17);
  uint64_t v14 = (float64x2_t *)*((void *)this + 20);
  int v15 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      LODWORD(v18) = 0;
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      LODWORD(v17) = 0;
      LODWORD(v18) = 0;
      for (int i = 0; i != a5; ++i)
      {
        if (v9 >= 1)
        {
          int v20 = 0;
          uint64_t v18 = (int)v18;
          do
          {
            uint64_t v21 = *((unsigned int *)this + 8);
            if ((int)v21 >= 1)
            {
              uint64_t v22 = a2;
              float32x4_t v23 = v13;
              float32x4_t v24 = v14;
              do
              {
                uint64_t v25 = (uint64_t)*v22++;
                float64x2_t v26 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v25 + 4 * v18)), 0);
                float64x2_t v28 = *v23;
                float64x2_t v27 = v23[1];
                float64x2_t v30 = v23[2];
                float64x2_t v29 = v23[3];
                float64x2_t v31 = vmlaq_f64(v26, v30, v11[2]);
                float64x2_t v32 = vmlaq_f64(v26, v29, v11[3]);
                float64x2_t v33 = vmlaq_f64(v26, *v23, *v11);
                float64x2_t v34 = vmlaq_f64(vmlaq_f64(v26, v27, v11[1]), v24[1], v11[5]);
                float64x2_t v35 = vmlaq_f64(v33, *v24, v11[4]);
                float64x2_t v36 = vmlaq_f64(v32, v24[3], v11[7]);
                float64x2_t v37 = vmlaq_f64(v31, v24[2], v11[6]);
                v24[2] = v30;
                v24[3] = v29;
                *float32x4_t v24 = v28;
                v24[1] = v27;
                v24 += 4;
                v23[2] = v37;
                v23[3] = v36;
                *float32x4_t v23 = v35;
                v23[1] = v34;
                v23 += 4;
                --v21;
              }
              while (v21);
            }
            v18 += a6;
            ++v20;
          }
          while (v20 != v9);
        }
        uint64_t v38 = *((unsigned int *)this + 8);
        if ((int)v38 >= 1)
        {
          float v39 = *((double *)this + 10) * (double)(v7 & 0x7FFFFF);
          uint64_t v40 = (v7 >> 22) & 0x1FE;
          float32x4_t v41 = (float64x2_t *)(v12 + (v40 << 6));
          float32x4_t v42 = (float64x2_t *)(v12 + ((unint64_t)(v40 + 2) << 6));
          float32x4_t v43 = (float *)*((void *)this + 23);
          float64x2_t v44 = v13;
          float64x2_t v45 = v14;
          float64x2_t v46 = v43;
          uint64_t v47 = *((unsigned int *)this + 8);
          do
          {
            float64x2_t v48 = v45[2];
            float64x2_t v49 = v45[3];
            float64x2_t v50 = *v45;
            float64x2_t v51 = v45[1];
            v45 += 4;
            float v52 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v41[4], v50), *v44, *v41), vmlaq_f64(vmulq_f64(v41[6], v48), v44[2], v41[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v41[5], v51), v44[1], v41[1]), vmlaq_f64(vmulq_f64(v41[7], v49), v44[3], v41[3]))));
            *v46++ = v52;
            v44 += 4;
            --v47;
          }
          while (v47);
          int v53 = (float *)*((void *)this + 26);
          uint64_t v54 = v13;
          int v55 = v14;
          int v56 = v53;
          uint64_t v57 = v38;
          do
          {
            float64x2_t v58 = v55[2];
            float64x2_t v59 = v55[3];
            float64x2_t v60 = *v55;
            float64x2_t v61 = v55[1];
            v55 += 4;
            float v62 = vaddvq_f64(vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v42[4], v60), *v54, *v42), vmlaq_f64(vmulq_f64(v42[6], v58), v54[2], v42[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v42[5], v61), v54[1], v42[1]), vmlaq_f64(vmulq_f64(v42[7], v59), v54[3], v42[3]))));
            *v56++ = v62;
            v54 += 4;
            --v57;
          }
          while (v57);
          float64x2_t v63 = a3;
          do
          {
            float v64 = *v43++;
            float v65 = v64;
            float v66 = *v53++;
            float v67 = v65 + (float)(v39 * (float)(v66 - v65));
            uint64_t v68 = (uint64_t)*v63++;
            *(float *)(v68 + 4 * v16) = v67;
            --v38;
          }
          while (v38);
        }
        uint64_t v17 = (v17 + v9);
        unsigned int v69 = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v69 >> 31);
        v16 += a7;
      }
    }
    int v180 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v180) {
        int v180 = v9;
      }
      if (v180 >= 1)
      {
        int v181 = 0;
        uint64_t v182 = (int)v18;
        uint64_t v183 = a6;
        do
        {
          uint64_t v184 = *((unsigned int *)this + 8);
          if ((int)v184 >= 1)
          {
            float64x2_t v185 = a2;
            float64x2_t v186 = v13;
            float64x2_t v187 = v14;
            do
            {
              uint64_t v188 = (uint64_t)*v185++;
              float64x2_t v189 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(v188 + 4 * v182)), 0);
              float64x2_t v191 = *v186;
              float64x2_t v190 = v186[1];
              float64x2_t v193 = v186[2];
              float64x2_t v192 = v186[3];
              float64x2_t v194 = vmlaq_f64(v189, v193, v11[2]);
              float64x2_t v195 = vmlaq_f64(v189, v192, v11[3]);
              float64x2_t v196 = vmlaq_f64(v189, *v186, *v11);
              float64x2_t v197 = vmlaq_f64(vmlaq_f64(v189, v190, v11[1]), v187[1], v11[5]);
              float64x2_t v198 = vmlaq_f64(v196, *v187, v11[4]);
              float64x2_t v199 = vmlaq_f64(v195, v187[3], v11[7]);
              float64x2_t v200 = vmlaq_f64(v194, v187[2], v11[6]);
              v187[2] = v193;
              v187[3] = v192;
              *float64x2_t v187 = v191;
              v187[1] = v190;
              v187 += 4;
              v186[2] = v200;
              v186[3] = v199;
              *float64x2_t v186 = v198;
              v186[1] = v197;
              v186 += 4;
              --v184;
            }
            while (v184);
          }
          v182 += v183;
          ++v181;
        }
        while (v181 != v180);
      }
LABEL_67:
      v9 -= v180;
      uint64_t v17 = (v180 + v17);
    }
  }
  else
  {
    if (a5 < 1)
    {
      LODWORD(v72) = 0;
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v70 = 0;
      LODWORD(v17) = 0;
      int v71 = 0;
      LODWORD(v72) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v73 = 0;
          uint64_t v72 = (int)v72;
          do
          {
            int v74 = *((_DWORD *)this + 8);
            unint64_t v75 = (v74 - 1);
            float64x2_t v76 = v13;
            float64x2_t v77 = v14;
            if (v74 >= 2)
            {
              unint64_t v78 = 0;
              float64x2_t v77 = v14;
              float64x2_t v76 = v13;
              do
              {
                float64x2_t v79 = &a2[v78];
                float64x2_t v80 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v79)[v72]), 0);
                float64x2_t v81 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v79 + 1) + 4 * v72)), 0);
                float64x2_t v82 = *v76;
                float64x2_t v83 = v76[1];
                float64x2_t v84 = v76[2];
                float64x2_t v85 = v76[3];
                float64x2_t v86 = vmlaq_f64(vmlaq_f64(v80, *v76, *v11), *v77, v11[8]);
                float64x2_t v87 = vmlaq_f64(vmlaq_f64(v80, v83, v11[1]), v77[1], v11[9]);
                float64x2_t v88 = vmlaq_f64(vmlaq_f64(v80, v84, v11[2]), v77[2], v11[10]);
                float64x2_t v89 = vmlaq_f64(vmlaq_f64(v80, v85, v11[3]), v77[3], v11[11]);
                v77[2] = v84;
                v77[3] = v85;
                *float64x2_t v77 = v82;
                v77[1] = v83;
                v76[2] = v88;
                v76[3] = v89;
                *float64x2_t v76 = v86;
                v76[1] = v87;
                float64x2_t v90 = v76[4];
                float64x2_t v91 = v76[5];
                float64x2_t v92 = v76[6];
                float64x2_t v93 = v76[7];
                float64x2_t v94 = vmlaq_f64(vmlaq_f64(v81, v90, *v11), v77[4], v11[8]);
                float64x2_t v95 = vmlaq_f64(vmlaq_f64(v81, v91, v11[1]), v77[5], v11[9]);
                float64x2_t v96 = vmlaq_f64(vmlaq_f64(v81, v92, v11[2]), v77[6], v11[10]);
                float64x2_t v97 = vmlaq_f64(vmlaq_f64(v81, v93, v11[3]), v77[7], v11[11]);
                v77[4] = v90;
                v77[5] = v91;
                v77[6] = v92;
                v77[7] = v93;
                v76[6] = v96;
                v76[7] = v97;
                uint8_t v76[4] = v94;
                v76[5] = v95;
                float64x2_t v99 = v76[8];
                float64x2_t v98 = v76[9];
                float64x2_t v101 = v76[10];
                float64x2_t v100 = v76[11];
                float64x2_t v102 = vmlaq_f64(v81, v101, v11[6]);
                float64x2_t v103 = vmlaq_f64(v80, v99, v11[4]);
                float64x2_t v104 = vmlaq_f64(vmlaq_f64(v80, v98, v11[5]), v77[9], v11[13]);
                float64x2_t v105 = vmlaq_f64(v103, v77[8], v11[12]);
                float64x2_t v106 = vmlaq_f64(vmlaq_f64(v81, v100, v11[7]), v77[11], v11[15]);
                float64x2_t v107 = vmlaq_f64(v102, v77[10], v11[14]);
                v77[8] = v99;
                v77[9] = v98;
                unsigned char v77[10] = v101;
                v77[11] = v100;
                v76[10] = v107;
                v76[11] = v106;
                v76[8] = v105;
                v76[9] = v104;
                v76 += 12;
                v77 += 12;
                v78 += 2;
              }
              while (v78 < v75);
            }
            if (v74)
            {
              float64x2_t v108 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[(int)v75][v72]), 0);
              float64x2_t v109 = *v76;
              float64x2_t v110 = v76[1];
              float64x2_t v111 = v76[2];
              float64x2_t v112 = v76[3];
              float64x2_t v113 = vmlaq_f64(vmlaq_f64(v108, *v76, *v11), *v77, v11[8]);
              float64x2_t v114 = vmlaq_f64(vmlaq_f64(v108, v110, v11[1]), v77[1], v11[9]);
              float64x2_t v115 = vmlaq_f64(vmlaq_f64(v108, v111, v11[2]), v77[2], v11[10]);
              float64x2_t v116 = vmlaq_f64(vmlaq_f64(v108, v112, v11[3]), v77[3], v11[11]);
              v77[2] = v111;
              v77[3] = v112;
              *float64x2_t v77 = v109;
              v77[1] = v110;
              v76[2] = v115;
              v76[3] = v116;
              *float64x2_t v76 = v113;
              v76[1] = v114;
              float64x2_t v118 = v76[4];
              float64x2_t v117 = v76[5];
              float64x2_t v120 = v76[6];
              float64x2_t v119 = v76[7];
              float64x2_t v121 = vmlaq_f64(v108, v118, v11[4]);
              float64x2_t v122 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v119, v11[7]), v77[7], v11[15]);
              float64x2_t v123 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v120, v11[6]), v77[6], v11[14]);
              float64x2_t v124 = vmlaq_f64(vmlaq_f64(v108, v117, v11[5]), v77[5], v11[13]);
              float64x2_t v125 = vmlaq_f64(v121, v77[4], v11[12]);
              v77[4] = v118;
              v77[5] = v117;
              v77[6] = v120;
              v77[7] = v119;
              v76[6] = v123;
              v76[7] = v122;
              uint8_t v76[4] = v125;
              v76[5] = v124;
            }
            v72 += a6;
            ++v73;
          }
          while (v73 != v9);
        }
        double v126 = *((double *)this + 10);
        uint64_t v127 = (v7 >> 21) & 0x3FC;
        int64x2_t v128 = (float64x2_t *)(v12 + (v127 << 6));
        uint64_t v129 = *((unsigned int *)this + 8);
        int64x2_t v130 = (float *)*((void *)this + 23);
        int v131 = v13;
        int v132 = v14;
        unint64_t v133 = (v129 - 1);
        if ((int)v129 > 1)
        {
          unint64_t v134 = 0;
          uint64_t v135 = (float32x2_t *)*((void *)this + 23);
          int v132 = v14;
          int v131 = v13;
          do
          {
            float64x2_t v136 = v128[1];
            float64x2_t v138 = v128[2];
            float64x2_t v137 = v128[3];
            float64x2_t v139 = v128[10];
            float64x2_t v140 = v128[11];
            float64x2_t v141 = v128[8];
            float64x2_t v142 = v128[9];
            float64x2_t v143 = vmlaq_f64(vmulq_f64(v142, v132[1]), v131[1], v136);
            float64x2_t v144 = vmlaq_f64(vmulq_f64(v142, v132[5]), v131[5], v136);
            int64x2_t v145 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v128[12], v132[8]), v131[8], v128[4]), vmlaq_f64(vmulq_f64(v128[13], v132[9]), v131[9], v128[5]));
            int64x2_t v146 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v141, *v132), *v131, *v128), vmlaq_f64(vmulq_f64(v139, v132[2]), v131[2], v138)), vaddq_f64(v143, vmlaq_f64(vmulq_f64(v140, v132[3]), v131[3], v137)));
            int64x2_t v147 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v141, v132[4]), v131[4], *v128), vmlaq_f64(vmulq_f64(v139, v132[6]), v131[6], v138)), vaddq_f64(v144, vmlaq_f64(vmulq_f64(v140, v132[7]), v131[7], v137)));
            int64x2_t v148 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v128[14], v132[10]), v131[10], v128[6]), vmlaq_f64(vmulq_f64(v128[15], v132[11]), v131[11], v128[7]));
            *v135++ = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v146, v147), (float64x2_t)vzip2q_s64(v146, v147)), vaddq_f64((float64x2_t)vzip1q_s64(v145, v148), (float64x2_t)vzip2q_s64(v145, v148))));
            v131 += 12;
            v132 += 12;
            v134 += 2;
          }
          while (v134 < v133);
        }
        if (v129)
        {
          int64x2_t v149 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v128[8], *v132), *v131, *v128), vmlaq_f64(vmulq_f64(v128[10], v132[2]), v131[2], v128[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v128[9], v132[1]), v131[1], v128[1]), vmlaq_f64(vmulq_f64(v128[11], v132[3]), v131[3], v128[3])));
          int64x2_t v150 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v128[12], v132[4]), v131[4], v128[4]), vmlaq_f64(vmulq_f64(v128[14], v132[6]), v131[6], v128[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v128[13], v132[5]), v131[5], v128[5]), vmlaq_f64(vmulq_f64(v128[15], v132[7]), v131[7], v128[7])));
          *(float *)v149.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v149, v150), (float64x2_t)vzip2q_s64(v149, v150)));
          v130[(int)v133] = *(float *)v149.i32;
        }
        float64x2_t v151 = (float64x2_t *)(v12 + ((unint64_t)(v127 + 4) << 6));
        float64x2_t v152 = (float *)*((void *)this + 26);
        float64x2_t v153 = v13;
        int v154 = v14;
        if ((int)v129 >= 2)
        {
          unint64_t v155 = 0;
          uint64_t v156 = (float32x2_t *)*((void *)this + 26);
          int v154 = v14;
          float64x2_t v153 = v13;
          do
          {
            float64x2_t v157 = v151[1];
            float64x2_t v159 = v151[2];
            float64x2_t v158 = v151[3];
            float64x2_t v160 = v151[10];
            float64x2_t v161 = v151[11];
            float64x2_t v162 = v151[8];
            float64x2_t v163 = v151[9];
            float64x2_t v164 = vmlaq_f64(vmulq_f64(v163, v154[1]), v153[1], v157);
            float64x2_t v165 = vmlaq_f64(vmulq_f64(v163, v154[5]), v153[5], v157);
            int64x2_t v166 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v151[12], v154[8]), v153[8], v151[4]), vmlaq_f64(vmulq_f64(v151[13], v154[9]), v153[9], v151[5]));
            int64x2_t v167 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v162, *v154), *v153, *v151), vmlaq_f64(vmulq_f64(v160, v154[2]), v153[2], v159)), vaddq_f64(v164, vmlaq_f64(vmulq_f64(v161, v154[3]), v153[3], v158)));
            int64x2_t v168 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v162, v154[4]), v153[4], *v151), vmlaq_f64(vmulq_f64(v160, v154[6]), v153[6], v159)), vaddq_f64(v165, vmlaq_f64(vmulq_f64(v161, v154[7]), v153[7], v158)));
            int64x2_t v169 = (int64x2_t)vaddq_f64(vmlaq_f64(vmulq_f64(v151[14], v154[10]), v153[10], v151[6]), vmlaq_f64(vmulq_f64(v151[15], v154[11]), v153[11], v151[7]));
            *v156++ = vcvt_f32_f64(vaddq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v167, v168), (float64x2_t)vzip2q_s64(v167, v168)), vaddq_f64((float64x2_t)vzip1q_s64(v166, v169), (float64x2_t)vzip2q_s64(v166, v169))));
            v153 += 12;
            v154 += 12;
            v155 += 2;
          }
          while (v155 < v133);
        }
        if (v129)
        {
          int64x2_t v170 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v151[8], *v154), *v153, *v151), vmlaq_f64(vmulq_f64(v151[10], v154[2]), v153[2], v151[2])), vaddq_f64(vmlaq_f64(vmulq_f64(v151[9], v154[1]), v153[1], v151[1]), vmlaq_f64(vmulq_f64(v151[11], v154[3]), v153[3], v151[3])));
          int64x2_t v171 = (int64x2_t)vaddq_f64(vaddq_f64(vmlaq_f64(vmulq_f64(v151[12], v154[4]), v153[4], v151[4]), vmlaq_f64(vmulq_f64(v151[14], v154[6]), v153[6], v151[6])), vaddq_f64(vmlaq_f64(vmulq_f64(v151[13], v154[5]), v153[5], v151[5]), vmlaq_f64(vmulq_f64(v151[15], v154[7]), v153[7], v151[7])));
          *(float *)v170.i32 = vaddvq_f64(vaddq_f64((float64x2_t)vzip1q_s64(v170, v171), (float64x2_t)vzip2q_s64(v170, v171)));
          v152[(int)v133] = *(float *)v170.i32;
        }
        if ((int)v129 >= 1)
        {
          float v172 = v126 * (double)(v7 & 0x7FFFFF);
          float64x2_t v173 = a3;
          do
          {
            float v174 = *v130++;
            float v175 = v174;
            float v176 = *v152++;
            float v177 = v175 + (float)(v172 * (float)(v176 - v175));
            uint64_t v178 = (uint64_t)*v173++;
            *(float *)(v178 + 4 * v70) = v177;
            --v129;
          }
          while (v129);
        }
        uint64_t v17 = (v17 + v9);
        unsigned int v179 = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v15 + (v179 >> 31);
        ++v71;
        v70 += a7;
      }
      while (v71 != a5);
    }
    int v180 = a4 - v17;
    if (a4 > (int)v17)
    {
      if (v9 < v180) {
        int v180 = v9;
      }
      if (v180 >= 1)
      {
        int v201 = 0;
        uint64_t v202 = (int)v72;
        uint64_t v203 = a6;
        do
        {
          int v204 = *((_DWORD *)this + 8);
          unint64_t v205 = (v204 - 1);
          float64x2_t v206 = v13;
          float64x2_t v207 = v14;
          if (v204 >= 2)
          {
            unint64_t v208 = 0;
            float64x2_t v207 = v14;
            float64x2_t v206 = v13;
            do
            {
              float64x2_t v209 = &a2[v208];
              float64x2_t v210 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((*v209)[v202]), 0);
              float64x2_t v211 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(float *)(*((void *)v209 + 1) + 4 * v202)), 0);
              float64x2_t v212 = *v206;
              float64x2_t v213 = v206[1];
              float64x2_t v214 = v206[2];
              float64x2_t v215 = v206[3];
              float64x2_t v216 = vmlaq_f64(vmlaq_f64(v210, *v206, *v11), *v207, v11[8]);
              float64x2_t v217 = vmlaq_f64(vmlaq_f64(v210, v213, v11[1]), v207[1], v11[9]);
              float64x2_t v218 = vmlaq_f64(vmlaq_f64(v210, v214, v11[2]), v207[2], v11[10]);
              float64x2_t v219 = vmlaq_f64(vmlaq_f64(v210, v215, v11[3]), v207[3], v11[11]);
              v207[2] = v214;
              v207[3] = v215;
              *float64x2_t v207 = v212;
              v207[1] = v213;
              v206[2] = v218;
              v206[3] = v219;
              *float64x2_t v206 = v216;
              v206[1] = v217;
              float64x2_t v220 = v206[4];
              float64x2_t v221 = v206[5];
              float64x2_t v222 = v206[6];
              float64x2_t v223 = v206[7];
              float64x2_t v224 = vmlaq_f64(vmlaq_f64(v211, v220, *v11), v207[4], v11[8]);
              float64x2_t v225 = vmlaq_f64(vmlaq_f64(v211, v221, v11[1]), v207[5], v11[9]);
              float64x2_t v226 = vmlaq_f64(vmlaq_f64(v211, v222, v11[2]), v207[6], v11[10]);
              float64x2_t v227 = vmlaq_f64(vmlaq_f64(v211, v223, v11[3]), v207[7], v11[11]);
              v207[4] = v220;
              v207[5] = v221;
              v207[6] = v222;
              v207[7] = v223;
              v206[6] = v226;
              v206[7] = v227;
              v206[4] = v224;
              v206[5] = v225;
              float64x2_t v229 = v206[8];
              float64x2_t v228 = v206[9];
              float64x2_t v231 = v206[10];
              float64x2_t v230 = v206[11];
              float64x2_t v232 = vmlaq_f64(v211, v231, v11[6]);
              float64x2_t v233 = vmlaq_f64(v210, v229, v11[4]);
              float64x2_t v234 = vmlaq_f64(vmlaq_f64(v210, v228, v11[5]), v207[9], v11[13]);
              float64x2_t v235 = vmlaq_f64(v233, v207[8], v11[12]);
              float64x2_t v236 = vmlaq_f64(vmlaq_f64(v211, v230, v11[7]), v207[11], v11[15]);
              float64x2_t v237 = vmlaq_f64(v232, v207[10], v11[14]);
              v207[8] = v229;
              v207[9] = v228;
              v207[10] = v231;
              v207[11] = v230;
              v206[10] = v237;
              v206[11] = v236;
              v206[8] = v235;
              v206[9] = v234;
              v206 += 12;
              v207 += 12;
              v208 += 2;
            }
            while (v208 < v205);
          }
          if (v204)
          {
            float64x2_t v238 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(a2[(int)v205][v202]), 0);
            float64x2_t v239 = *v206;
            float64x2_t v240 = v206[1];
            float64x2_t v241 = v206[2];
            float64x2_t v242 = v206[3];
            float64x2_t v243 = vmlaq_f64(vmlaq_f64(v238, *v206, *v11), *v207, v11[8]);
            float64x2_t v244 = vmlaq_f64(vmlaq_f64(v238, v240, v11[1]), v207[1], v11[9]);
            float64x2_t v245 = vmlaq_f64(vmlaq_f64(v238, v241, v11[2]), v207[2], v11[10]);
            float64x2_t v246 = vmlaq_f64(vmlaq_f64(v238, v242, v11[3]), v207[3], v11[11]);
            v207[2] = v241;
            v207[3] = v242;
            *float64x2_t v207 = v239;
            v207[1] = v240;
            v206[2] = v245;
            v206[3] = v246;
            *float64x2_t v206 = v243;
            v206[1] = v244;
            float64x2_t v248 = v206[4];
            float64x2_t v247 = v206[5];
            float64x2_t v250 = v206[6];
            float64x2_t v249 = v206[7];
            float64x2_t v251 = vmlaq_f64(v238, v248, v11[4]);
            float64x2_t v252 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v249, v11[7]), v207[7], v11[15]);
            float64x2_t v253 = vmlaq_f64(vmlaq_f64((float64x2_t)0, v250, v11[6]), v207[6], v11[14]);
            float64x2_t v254 = vmlaq_f64(vmlaq_f64(v238, v247, v11[5]), v207[5], v11[13]);
            float64x2_t v255 = vmlaq_f64(v251, v207[4], v11[12]);
            v207[4] = v248;
            v207[5] = v247;
            v207[6] = v250;
            v207[7] = v249;
            v206[6] = v253;
            v206[7] = v252;
            v206[4] = v255;
            v206[5] = v254;
          }
          v202 += v203;
          ++v201;
        }
        while (v201 != v180);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v17;
}

uint64_t RamstadSRC::processMultiInt(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 24);
  uint64_t v11 = *(void *)(*(void *)this + 48);
  uint64_t v12 = (float32x4_t *)*((void *)this + 11);
  uint64_t v13 = (float32x4_t *)*((void *)this + 14);
  int v14 = *((_DWORD *)this + 9);
  int v15 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      uint64_t v19 = 0;
      LODWORD(v18) = 0;
    }
    else
    {
      uint64_t v16 = 0;
      int v17 = 0;
      LODWORD(v18) = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v20 = 0;
          uint64_t v18 = (int)v18;
          do
          {
            uint64_t v21 = *((unsigned int *)this + 8);
            if ((int)v21 >= 1)
            {
              uint64_t v22 = a2;
              float32x4_t v23 = v12;
              float32x4_t v24 = v13;
              do
              {
                uint64_t v25 = (uint64_t)*v22++;
                float64x2_t v26 = (const float *)(v25 + 4 * v18);
                float32x4_t v27 = vld1q_dup_f32(v26);
                float32x4_t v28 = v23[1];
                float32x4_t v29 = vmlaq_f32(v27, v28, v10[1]);
                float32x4_t v30 = vmlaq_f32(vmlaq_f32(v27, *v23, *v10), *v24, v10[2]);
                float32x4_t v31 = vmlaq_f32(v29, v24[1], v10[3]);
                *float32x4_t v24 = *v23;
                v24[1] = v28;
                v24 += 2;
                *float32x4_t v23 = v30;
                v23[1] = v31;
                v23 += 2;
                --v21;
              }
              while (v21);
            }
            v18 += a6;
            ++v20;
          }
          while (v20 != v9);
        }
        uint64_t v32 = *((unsigned int *)this + 8);
        if ((int)v32 >= 1)
        {
          float64x2_t v33 = v12;
          float64x2_t v34 = v13;
          float64x2_t v35 = a3;
          do
          {
            float32x4_t v36 = *v33;
            float32x4_t v37 = v33[1];
            v33 += 2;
            float32x4_t v39 = *v34;
            float32x4_t v38 = v34[1];
            v34 += 2;
            int8x16_t v40 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 32), v39), v36, *(float32x4_t *)(v11 + 64 * v7)), vmlaq_f32(vmulq_f32(*(float32x4_t *)(v11 + 64 * v7 + 48), v38), v37, *(float32x4_t *)(v11 + 64 * v7 + 16)));
            uint64_t v41 = (uint64_t)*v35++;
            *(float *)(v41 + 4 * v16) = vaddv_f32(vadd_f32(*(float32x2_t *)v40.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v40, v40, 8uLL)));
            --v32;
          }
          while (v32);
        }
        uint64_t v19 = (v19 + v9);
        int v42 = v7 + v8;
        if (v42 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v42 < v14) {
          int v43 = 0;
        }
        else {
          int v43 = v14;
        }
        int v7 = v42 - v43;
        ++v17;
        v16 += a7;
      }
      while (v17 != a5);
    }
    int v101 = a4 - v19;
    if (a4 > (int)v19)
    {
      if (v9 < v101) {
        int v101 = v9;
      }
      if (v101 >= 1)
      {
        int v102 = 0;
        uint64_t v103 = (int)v18;
        uint64_t v104 = a6;
        do
        {
          uint64_t v105 = *((unsigned int *)this + 8);
          if ((int)v105 >= 1)
          {
            float64x2_t v106 = a2;
            float64x2_t v107 = v12;
            float64x2_t v108 = v13;
            do
            {
              uint64_t v109 = (uint64_t)*v106++;
              float64x2_t v110 = (const float *)(v109 + 4 * v103);
              float32x4_t v111 = vld1q_dup_f32(v110);
              float32x4_t v112 = v107[1];
              float32x4_t v113 = vmlaq_f32(v111, v112, v10[1]);
              float32x4_t v114 = vmlaq_f32(vmlaq_f32(v111, *v107, *v10), *v108, v10[2]);
              float32x4_t v115 = vmlaq_f32(v113, v108[1], v10[3]);
              *float64x2_t v108 = *v107;
              v108[1] = v112;
              v108 += 2;
              *float64x2_t v107 = v114;
              v107[1] = v115;
              v107 += 2;
              --v105;
            }
            while (v105);
          }
          v103 += v104;
          ++v102;
        }
        while (v102 != v101);
      }
LABEL_67:
      v9 -= v101;
      uint64_t v19 = (v101 + v19);
    }
  }
  else
  {
    if (a5 < 1)
    {
      uint64_t v19 = 0;
      LODWORD(v46) = 0;
    }
    else
    {
      uint64_t v44 = 0;
      int v45 = 0;
      LODWORD(v46) = 0;
      LODWORD(v19) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v47 = 0;
          uint64_t v46 = (int)v46;
          do
          {
            int v48 = *((_DWORD *)this + 8);
            unint64_t v49 = (v48 - 1);
            float64x2_t v50 = v12;
            float64x2_t v51 = v13;
            if (v48 >= 2)
            {
              unint64_t v52 = 0;
              float64x2_t v51 = v13;
              float64x2_t v50 = v12;
              do
              {
                int v53 = &a2[v52];
                uint64_t v54 = &(*v53)[v46];
                int v55 = (const float *)(*((void *)v53 + 1) + 4 * v46);
                float32x4_t v56 = vld1q_dup_f32(v54);
                float32x4_t v57 = vld1q_dup_f32(v55);
                float32x4_t v58 = v50[1];
                float32x4_t v59 = vmlaq_f32(vmlaq_f32(v56, *v50, *v10), *v51, v10[4]);
                float32x4_t v60 = vmlaq_f32(vmlaq_f32(v56, v58, v10[1]), v51[1], v10[5]);
                *float64x2_t v51 = *v50;
                v51[1] = v58;
                *float64x2_t v50 = v59;
                v50[1] = v60;
                float32x4_t v61 = v50[2];
                float32x4_t v62 = v50[3];
                float32x4_t v63 = vmlaq_f32(vmlaq_f32(v57, v61, *v10), v51[2], v10[4]);
                float32x4_t v64 = vmlaq_f32(vmlaq_f32(v57, v62, v10[1]), v51[3], v10[5]);
                v51[2] = v61;
                v51[3] = v62;
                v50[2] = v63;
                v50[3] = v64;
                float32x4_t v65 = v50[4];
                float32x4_t v66 = v50[5];
                float32x4_t v67 = vmlaq_f32(vmlaq_f32(v56, v65, v10[2]), v51[4], v10[6]);
                float32x4_t v68 = vmlaq_f32(vmlaq_f32(v57, v66, v10[3]), v51[5], v10[7]);
                v51[4] = v65;
                v51[5] = v66;
                v50[4] = v67;
                v50[5] = v68;
                v50 += 6;
                v51 += 6;
                v52 += 2;
              }
              while (v52 < v49);
            }
            if (v48)
            {
              unsigned int v69 = &a2[(int)v49][v46];
              float32x4_t v70 = vld1q_dup_f32(v69);
              float32x4_t v71 = v50[1];
              float32x4_t v72 = vmlaq_f32(vmlaq_f32(v70, *v50, *v10), *v51, v10[4]);
              float32x4_t v73 = vmlaq_f32(vmlaq_f32(v70, v71, v10[1]), v51[1], v10[5]);
              *float64x2_t v51 = *v50;
              v51[1] = v71;
              *float64x2_t v50 = v72;
              v50[1] = v73;
              float32x4_t v74 = v50[2];
              float32x4_t v75 = v50[3];
              float32x4_t v76 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v75, v10[3]), v51[3], v10[7]);
              float32x4_t v77 = vmlaq_f32(vmlaq_f32(v70, v74, v10[2]), v51[2], v10[6]);
              v51[2] = v74;
              v51[3] = v75;
              v50[2] = v77;
              v50[3] = v76;
            }
            v46 += a6;
            ++v47;
          }
          while (v47 != v9);
        }
        unint64_t v78 = (float32x4_t *)(v11 + 128 * v7);
        int v79 = *((_DWORD *)this + 8);
        float64x2_t v80 = v12;
        float64x2_t v81 = v13;
        unint64_t v82 = (v79 - 1);
        if (v79 > 1)
        {
          unint64_t v83 = 0;
          float64x2_t v81 = v13;
          float64x2_t v80 = v12;
          do
          {
            float64x2_t v84 = &a3[v83];
            float32x4_t v85 = v78[1];
            float32x4_t v87 = v78[4];
            float32x4_t v86 = v78[5];
            float32x4_t v88 = vmlaq_f32(vmulq_f32(v86, v81[1]), v80[1], v85);
            float32x4_t v89 = vmlaq_f32(vmulq_f32(v86, v81[3]), v80[3], v85);
            float64x2_t v91 = *v84;
            uint64_t v90 = *((void *)v84 + 1);
            int8x16_t v92 = (int8x16_t)vmlaq_f32(vmulq_f32(v78[7], v81[5]), v80[5], v78[3]);
            int8x16_t v93 = (int8x16_t)vmlaq_f32(vmulq_f32(v78[6], v81[4]), v80[4], v78[2]);
            int8x16_t v94 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v87, *v81), *v80, *v78), v88);
            *(float32x2_t *)v94.i8 = vadd_f32(*(float32x2_t *)v94.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v94, v94, 8uLL));
            int32x2_t v95 = (int32x2_t)vadd_f32(*(float32x2_t *)v93.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v93, v93, 8uLL));
            *(float32x2_t *)v94.i8 = vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v94.i8, v95), (float32x2_t)vzip2_s32(*(int32x2_t *)v94.i8, v95));
            int8x16_t v96 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v87, v81[2]), v80[2], *v78), v89);
            *(float32x2_t *)v96.i8 = vadd_f32(*(float32x2_t *)v96.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v96, v96, 8uLL));
            *(float32x2_t *)v92.i8 = vadd_f32(*(float32x2_t *)v92.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v92, v92, 8uLL));
            v91[v44] = vaddv_f32(*(float32x2_t *)v94.i8);
            *(float *)(v90 + 4 * v44) = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v92.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v96.i8, *(int32x2_t *)v92.i8)));
            v80 += 6;
            v81 += 6;
            v83 += 2;
          }
          while (v83 < v82);
        }
        if (v79)
        {
          int8x16_t v97 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v78[4], *v81), *v80, *v78), vmlaq_f32(vmulq_f32(v78[5], v81[1]), v80[1], v78[1]));
          *(float32x2_t *)v97.i8 = vadd_f32(*(float32x2_t *)v97.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v97, v97, 8uLL));
          int8x16_t v98 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v78[6], v81[2]), v80[2], v78[2]), vmlaq_f32(vmulq_f32(v78[7], v81[3]), v80[3], v78[3]));
          *(float32x2_t *)v98.i8 = vadd_f32(*(float32x2_t *)v98.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v98, v98, 8uLL));
          a3[(int)v82][v44] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v97.i8, *(int32x2_t *)v98.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v97.i8, *(int32x2_t *)v98.i8)));
        }
        uint64_t v19 = (v19 + v9);
        int v99 = v7 + v8;
        if (v99 < v14) {
          int v9 = v15;
        }
        else {
          int v9 = v15 + 1;
        }
        if (v99 < v14) {
          int v100 = 0;
        }
        else {
          int v100 = v14;
        }
        int v7 = v99 - v100;
        ++v45;
        v44 += a7;
      }
      while (v45 != a5);
    }
    int v101 = a4 - v19;
    if (a4 > (int)v19)
    {
      if (v9 < v101) {
        int v101 = v9;
      }
      if (v101 >= 1)
      {
        int v116 = 0;
        uint64_t v117 = (int)v46;
        uint64_t v118 = a6;
        do
        {
          int v119 = *((_DWORD *)this + 8);
          unint64_t v120 = (v119 - 1);
          float64x2_t v121 = v12;
          float64x2_t v122 = v13;
          if (v119 >= 2)
          {
            unint64_t v123 = 0;
            float64x2_t v122 = v13;
            float64x2_t v121 = v12;
            do
            {
              float64x2_t v124 = &a2[v123];
              float64x2_t v125 = &(*v124)[v117];
              double v126 = (const float *)(*((void *)v124 + 1) + 4 * v117);
              float32x4_t v127 = vld1q_dup_f32(v125);
              float32x4_t v128 = vld1q_dup_f32(v126);
              float32x4_t v129 = v121[1];
              float32x4_t v130 = vmlaq_f32(vmlaq_f32(v127, *v121, *v10), *v122, v10[4]);
              float32x4_t v131 = vmlaq_f32(vmlaq_f32(v127, v129, v10[1]), v122[1], v10[5]);
              *float64x2_t v122 = *v121;
              v122[1] = v129;
              *float64x2_t v121 = v130;
              v121[1] = v131;
              float32x4_t v132 = v121[2];
              float32x4_t v133 = v121[3];
              float32x4_t v134 = vmlaq_f32(vmlaq_f32(v128, v132, *v10), v122[2], v10[4]);
              float32x4_t v135 = vmlaq_f32(vmlaq_f32(v128, v133, v10[1]), v122[3], v10[5]);
              v122[2] = v132;
              v122[3] = v133;
              v121[2] = v134;
              v121[3] = v135;
              float32x4_t v136 = v121[4];
              float32x4_t v137 = v121[5];
              float32x4_t v138 = vmlaq_f32(vmlaq_f32(v127, v136, v10[2]), v122[4], v10[6]);
              float32x4_t v139 = vmlaq_f32(vmlaq_f32(v128, v137, v10[3]), v122[5], v10[7]);
              v122[4] = v136;
              v122[5] = v137;
              v121[4] = v138;
              v121[5] = v139;
              v121 += 6;
              v122 += 6;
              v123 += 2;
            }
            while (v123 < v120);
          }
          if (v119)
          {
            float64x2_t v140 = &a2[(int)v120][v117];
            float32x4_t v141 = vld1q_dup_f32(v140);
            float32x4_t v142 = v121[1];
            float32x4_t v143 = vmlaq_f32(vmlaq_f32(v141, *v121, *v10), *v122, v10[4]);
            float32x4_t v144 = vmlaq_f32(vmlaq_f32(v141, v142, v10[1]), v122[1], v10[5]);
            *float64x2_t v122 = *v121;
            v122[1] = v142;
            *float64x2_t v121 = v143;
            v121[1] = v144;
            float32x4_t v145 = v121[2];
            float32x4_t v146 = v121[3];
            float32x4_t v147 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v146, v10[3]), v122[3], v10[7]);
            float32x4_t v148 = vmlaq_f32(vmlaq_f32(v141, v145, v10[2]), v122[2], v10[6]);
            v122[2] = v145;
            v122[3] = v146;
            v121[2] = v148;
            v121[3] = v147;
          }
          v117 += v118;
          ++v116;
        }
        while (v116 != v101);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v19;
}

uint64_t RamstadSRC::processMultiFrac(RamstadSRC *this, const float *const *a2, float *const *a3, int a4, int a5, int a6, int a7)
{
  int v8 = *((_DWORD *)this + 13);
  unsigned int v7 = *((_DWORD *)this + 14);
  int v9 = *((_DWORD *)this + 18);
  uint64_t v10 = *(float32x4_t **)(*(void *)this + 24);
  uint64_t v11 = *(void *)(*(void *)this + 48);
  uint64_t v12 = (float32x4_t *)*((void *)this + 11);
  uint64_t v13 = (float32x4_t *)*((void *)this + 14);
  int v14 = *((_DWORD *)this + 11);
  if (*((_DWORD *)this + 10) == 8)
  {
    if (a5 < 1)
    {
      LODWORD(v17) = 0;
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v15 = 0;
      LODWORD(v16) = 0;
      LODWORD(v17) = 0;
      for (int i = 0; i != a5; ++i)
      {
        if (v9 >= 1)
        {
          int v19 = 0;
          uint64_t v17 = (int)v17;
          do
          {
            uint64_t v20 = *((unsigned int *)this + 8);
            if ((int)v20 >= 1)
            {
              uint64_t v21 = a2;
              uint64_t v22 = v12;
              float32x4_t v23 = v13;
              do
              {
                uint64_t v24 = (uint64_t)*v21++;
                uint64_t v25 = (const float *)(v24 + 4 * v17);
                float32x4_t v26 = vld1q_dup_f32(v25);
                float32x4_t v27 = v22[1];
                float32x4_t v28 = vmlaq_f32(v26, v27, v10[1]);
                float32x4_t v29 = vmlaq_f32(vmlaq_f32(v26, *v22, *v10), *v23, v10[2]);
                float32x4_t v30 = vmlaq_f32(v28, v23[1], v10[3]);
                *float32x4_t v23 = *v22;
                v23[1] = v27;
                v23 += 2;
                *uint64_t v22 = v29;
                v22[1] = v30;
                v22 += 2;
                --v20;
              }
              while (v20);
            }
            v17 += a6;
            ++v19;
          }
          while (v19 != v9);
        }
        uint64_t v31 = *((unsigned int *)this + 8);
        if ((int)v31 >= 1)
        {
          float v32 = *((double *)this + 10) * (double)(v7 & 0x7FFFFF);
          uint64_t v33 = (v7 >> 22) & 0x1FE;
          float64x2_t v34 = (float32x4_t *)(v11 + 32 * v33);
          float64x2_t v35 = (float32x4_t *)(v11 + 32 * (v33 + 2));
          float32x4_t v36 = (float *)*((void *)this + 23);
          float32x4_t v37 = v12;
          float32x4_t v38 = v13;
          float32x4_t v39 = v36;
          uint64_t v40 = *((unsigned int *)this + 8);
          do
          {
            float32x4_t v41 = *v37;
            float32x4_t v42 = v37[1];
            v37 += 2;
            float32x4_t v44 = *v38;
            float32x4_t v43 = v38[1];
            v38 += 2;
            int8x16_t v45 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v34[2], v44), v41, *v34), vmlaq_f32(vmulq_f32(v34[3], v43), v42, v34[1]));
            *v39++ = vaddv_f32(vadd_f32(*(float32x2_t *)v45.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v45, v45, 8uLL)));
            --v40;
          }
          while (v40);
          uint64_t v46 = (float *)*((void *)this + 26);
          int v47 = v12;
          int v48 = v13;
          unint64_t v49 = v46;
          uint64_t v50 = v31;
          do
          {
            float32x4_t v51 = *v47;
            float32x4_t v52 = v47[1];
            v47 += 2;
            float32x4_t v54 = *v48;
            float32x4_t v53 = v48[1];
            v48 += 2;
            int8x16_t v55 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v35[2], v54), v51, *v35), vmlaq_f32(vmulq_f32(v35[3], v53), v52, v35[1]));
            *v49++ = vaddv_f32(vadd_f32(*(float32x2_t *)v55.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v55, v55, 8uLL)));
            --v50;
          }
          while (v50);
          float32x4_t v56 = a3;
          do
          {
            float v57 = *v36++;
            float v58 = v57;
            float v59 = *v46++;
            float v60 = v58 + (float)(v32 * (float)(v59 - v58));
            uint64_t v61 = (uint64_t)*v56++;
            *(float *)(v61 + 4 * v15) = v60;
            --v31;
          }
          while (v31);
        }
        uint64_t v16 = (v16 + v9);
        unsigned int v62 = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v62 >> 31);
        v15 += a7;
      }
    }
    int v143 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v143) {
        int v143 = v9;
      }
      if (v143 >= 1)
      {
        int v144 = 0;
        uint64_t v145 = (int)v17;
        uint64_t v146 = a6;
        do
        {
          uint64_t v147 = *((unsigned int *)this + 8);
          if ((int)v147 >= 1)
          {
            float32x4_t v148 = a2;
            int64x2_t v149 = v12;
            int64x2_t v150 = v13;
            do
            {
              uint64_t v151 = (uint64_t)*v148++;
              float64x2_t v152 = (const float *)(v151 + 4 * v145);
              float32x4_t v153 = vld1q_dup_f32(v152);
              float32x4_t v154 = v149[1];
              float32x4_t v155 = vmlaq_f32(v153, v154, v10[1]);
              float32x4_t v156 = vmlaq_f32(vmlaq_f32(v153, *v149, *v10), *v150, v10[2]);
              float32x4_t v157 = vmlaq_f32(v155, v150[1], v10[3]);
              *int64x2_t v150 = *v149;
              v150[1] = v154;
              v150 += 2;
              *int64x2_t v149 = v156;
              v149[1] = v157;
              v149 += 2;
              --v147;
            }
            while (v147);
          }
          v145 += v146;
          ++v144;
        }
        while (v144 != v143);
      }
LABEL_67:
      v9 -= v143;
      uint64_t v16 = (v143 + v16);
    }
  }
  else
  {
    if (a5 < 1)
    {
      LODWORD(v65) = 0;
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v63 = 0;
      LODWORD(v16) = 0;
      int v64 = 0;
      LODWORD(v65) = 0;
      do
      {
        if (v9 >= 1)
        {
          int v66 = 0;
          uint64_t v65 = (int)v65;
          do
          {
            int v67 = *((_DWORD *)this + 8);
            unint64_t v68 = (v67 - 1);
            unsigned int v69 = v12;
            float32x4_t v70 = v13;
            if (v67 >= 2)
            {
              unint64_t v71 = 0;
              float32x4_t v70 = v13;
              unsigned int v69 = v12;
              do
              {
                float32x4_t v72 = &a2[v71];
                float32x4_t v73 = &(*v72)[v65];
                float32x4_t v74 = (const float *)(*((void *)v72 + 1) + 4 * v65);
                float32x4_t v75 = vld1q_dup_f32(v73);
                float32x4_t v76 = vld1q_dup_f32(v74);
                float32x4_t v77 = v69[1];
                float32x4_t v78 = vmlaq_f32(vmlaq_f32(v75, *v69, *v10), *v70, v10[4]);
                float32x4_t v79 = vmlaq_f32(vmlaq_f32(v75, v77, v10[1]), v70[1], v10[5]);
                *float32x4_t v70 = *v69;
                v70[1] = v77;
                *unsigned int v69 = v78;
                v69[1] = v79;
                float32x4_t v80 = v69[2];
                float32x4_t v81 = v69[3];
                float32x4_t v82 = vmlaq_f32(vmlaq_f32(v76, v80, *v10), v70[2], v10[4]);
                float32x4_t v83 = vmlaq_f32(vmlaq_f32(v76, v81, v10[1]), v70[3], v10[5]);
                v70[2] = v80;
                v70[3] = v81;
                v69[2] = v82;
                v69[3] = v83;
                float32x4_t v84 = v69[4];
                float32x4_t v85 = v69[5];
                float32x4_t v86 = vmlaq_f32(vmlaq_f32(v75, v84, v10[2]), v70[4], v10[6]);
                float32x4_t v87 = vmlaq_f32(vmlaq_f32(v76, v85, v10[3]), v70[5], v10[7]);
                v70[4] = v84;
                v70[5] = v85;
                v69[4] = v86;
                v69[5] = v87;
                v69 += 6;
                v70 += 6;
                v71 += 2;
              }
              while (v71 < v68);
            }
            if (v67)
            {
              float32x4_t v88 = &a2[(int)v68][v65];
              float32x4_t v89 = vld1q_dup_f32(v88);
              float32x4_t v90 = v69[1];
              float32x4_t v91 = vmlaq_f32(vmlaq_f32(v89, *v69, *v10), *v70, v10[4]);
              float32x4_t v92 = vmlaq_f32(vmlaq_f32(v89, v90, v10[1]), v70[1], v10[5]);
              *float32x4_t v70 = *v69;
              v70[1] = v90;
              *unsigned int v69 = v91;
              v69[1] = v92;
              float32x4_t v93 = v69[2];
              float32x4_t v94 = v69[3];
              float32x4_t v95 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v94, v10[3]), v70[3], v10[7]);
              float32x4_t v96 = vmlaq_f32(vmlaq_f32(v89, v93, v10[2]), v70[2], v10[6]);
              v70[2] = v93;
              v70[3] = v94;
              v69[2] = v96;
              v69[3] = v95;
            }
            v65 += a6;
            ++v66;
          }
          while (v66 != v9);
        }
        double v97 = *((double *)this + 10);
        uint64_t v98 = (v7 >> 21) & 0x3FC;
        int v99 = (float32x4_t *)(v11 + 32 * v98);
        uint64_t v100 = *((unsigned int *)this + 8);
        int v101 = (float *)*((void *)this + 23);
        int v102 = v12;
        uint64_t v103 = v13;
        unint64_t v104 = (v100 - 1);
        if ((int)v100 > 1)
        {
          unint64_t v105 = 0;
          float64x2_t v106 = (float32x2_t *)*((void *)this + 23);
          uint64_t v103 = v13;
          int v102 = v12;
          do
          {
            float32x4_t v107 = v99[1];
            float32x4_t v109 = v99[4];
            float32x4_t v108 = v99[5];
            float32x4_t v110 = vmlaq_f32(vmulq_f32(v108, v103[1]), v102[1], v107);
            float32x4_t v111 = vmlaq_f32(vmulq_f32(v108, v103[3]), v102[3], v107);
            int8x16_t v112 = (int8x16_t)vmlaq_f32(vmulq_f32(v99[7], v103[5]), v102[5], v99[3]);
            int8x16_t v113 = (int8x16_t)vmlaq_f32(vmulq_f32(v99[6], v103[4]), v102[4], v99[2]);
            int8x16_t v114 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v109, *v103), *v102, *v99), v110);
            *(float32x2_t *)v113.i8 = vadd_f32(*(float32x2_t *)v113.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v113, v113, 8uLL));
            *(float32x2_t *)v114.i8 = vadd_f32(*(float32x2_t *)v114.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v114, v114, 8uLL));
            int8x16_t v115 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v109, v103[2]), v102[2], *v99), v111);
            *(float32x2_t *)v115.i8 = vadd_f32(*(float32x2_t *)v115.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v115, v115, 8uLL));
            *(float32x2_t *)v112.i8 = vadd_f32(*(float32x2_t *)v112.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v112, v112, 8uLL));
            *v106++ = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v114.i8, *(int32x2_t *)v115.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v114.i8, *(int32x2_t *)v115.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v113.i8, *(int32x2_t *)v112.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v113.i8, *(int32x2_t *)v112.i8)));
            v102 += 6;
            v103 += 6;
            v105 += 2;
          }
          while (v105 < v104);
        }
        if (v100)
        {
          int8x16_t v116 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v99[4], *v103), *v102, *v99), vmlaq_f32(vmulq_f32(v99[5], v103[1]), v102[1], v99[1]));
          *(float32x2_t *)v116.i8 = vadd_f32(*(float32x2_t *)v116.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v116, v116, 8uLL));
          int8x16_t v117 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v99[6], v103[2]), v102[2], v99[2]), vmlaq_f32(vmulq_f32(v99[7], v103[3]), v102[3], v99[3]));
          *(float32x2_t *)v117.i8 = vadd_f32(*(float32x2_t *)v117.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v117, v117, 8uLL));
          v101[(int)v104] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v117.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v116.i8, *(int32x2_t *)v117.i8)));
        }
        uint64_t v118 = (float32x4_t *)(v11 + 32 * (v98 + 4));
        int v119 = (float *)*((void *)this + 26);
        unint64_t v120 = v12;
        float64x2_t v121 = v13;
        if ((int)v100 >= 2)
        {
          unint64_t v122 = 0;
          unint64_t v123 = (float32x2_t *)*((void *)this + 26);
          float64x2_t v121 = v13;
          unint64_t v120 = v12;
          do
          {
            float32x4_t v124 = v118[1];
            float32x4_t v126 = v118[4];
            float32x4_t v125 = v118[5];
            float32x4_t v127 = vmlaq_f32(vmulq_f32(v125, v121[1]), v120[1], v124);
            float32x4_t v128 = vmlaq_f32(vmulq_f32(v125, v121[3]), v120[3], v124);
            int8x16_t v129 = (int8x16_t)vmlaq_f32(vmulq_f32(v118[7], v121[5]), v120[5], v118[3]);
            int8x16_t v130 = (int8x16_t)vmlaq_f32(vmulq_f32(v118[6], v121[4]), v120[4], v118[2]);
            int8x16_t v131 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v126, *v121), *v120, *v118), v127);
            *(float32x2_t *)v130.i8 = vadd_f32(*(float32x2_t *)v130.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v130, v130, 8uLL));
            *(float32x2_t *)v131.i8 = vadd_f32(*(float32x2_t *)v131.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v131, v131, 8uLL));
            int8x16_t v132 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v126, v121[2]), v120[2], *v118), v128);
            *(float32x2_t *)v132.i8 = vadd_f32(*(float32x2_t *)v132.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v132, v132, 8uLL));
            *(float32x2_t *)v129.i8 = vadd_f32(*(float32x2_t *)v129.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v129, v129, 8uLL));
            *v123++ = vadd_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v131.i8, *(int32x2_t *)v132.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v131.i8, *(int32x2_t *)v132.i8)), vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v130.i8, *(int32x2_t *)v129.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v130.i8, *(int32x2_t *)v129.i8)));
            v120 += 6;
            v121 += 6;
            v122 += 2;
          }
          while (v122 < v104);
        }
        if (v100)
        {
          int8x16_t v133 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v118[4], *v121), *v120, *v118), vmlaq_f32(vmulq_f32(v118[5], v121[1]), v120[1], v118[1]));
          *(float32x2_t *)v133.i8 = vadd_f32(*(float32x2_t *)v133.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v133, v133, 8uLL));
          int8x16_t v134 = (int8x16_t)vaddq_f32(vmlaq_f32(vmulq_f32(v118[6], v121[2]), v120[2], v118[2]), vmlaq_f32(vmulq_f32(v118[7], v121[3]), v120[3], v118[3]));
          *(float32x2_t *)v134.i8 = vadd_f32(*(float32x2_t *)v134.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v134, v134, 8uLL));
          v119[(int)v104] = vaddv_f32(vadd_f32((float32x2_t)vzip1_s32(*(int32x2_t *)v133.i8, *(int32x2_t *)v134.i8), (float32x2_t)vzip2_s32(*(int32x2_t *)v133.i8, *(int32x2_t *)v134.i8)));
        }
        if ((int)v100 >= 1)
        {
          float v135 = v97 * (double)(v7 & 0x7FFFFF);
          float32x4_t v136 = a3;
          do
          {
            float v137 = *v101++;
            float v138 = v137;
            float v139 = *v119++;
            float v140 = v138 + (float)(v135 * (float)(v139 - v138));
            uint64_t v141 = (uint64_t)*v136++;
            *(float *)(v141 + 4 * v63) = v140;
            --v100;
          }
          while (v100);
        }
        uint64_t v16 = (v16 + v9);
        unsigned int v142 = v7 + v8;
        unsigned int v7 = (v7 + v8) & 0x7FFFFFFF;
        int v9 = v14 + (v142 >> 31);
        ++v64;
        v63 += a7;
      }
      while (v64 != a5);
    }
    int v143 = a4 - v16;
    if (a4 > (int)v16)
    {
      if (v9 < v143) {
        int v143 = v9;
      }
      if (v143 >= 1)
      {
        int v158 = 0;
        uint64_t v159 = (int)v65;
        uint64_t v160 = a6;
        do
        {
          int v161 = *((_DWORD *)this + 8);
          unint64_t v162 = (v161 - 1);
          float64x2_t v163 = v12;
          float64x2_t v164 = v13;
          if (v161 >= 2)
          {
            unint64_t v165 = 0;
            float64x2_t v164 = v13;
            float64x2_t v163 = v12;
            do
            {
              int64x2_t v166 = &a2[v165];
              int64x2_t v167 = &(*v166)[v159];
              int64x2_t v168 = (const float *)(*((void *)v166 + 1) + 4 * v159);
              float32x4_t v169 = vld1q_dup_f32(v167);
              float32x4_t v170 = vld1q_dup_f32(v168);
              float32x4_t v171 = v163[1];
              float32x4_t v172 = vmlaq_f32(vmlaq_f32(v169, *v163, *v10), *v164, v10[4]);
              float32x4_t v173 = vmlaq_f32(vmlaq_f32(v169, v171, v10[1]), v164[1], v10[5]);
              *float64x2_t v164 = *v163;
              v164[1] = v171;
              *float64x2_t v163 = v172;
              v163[1] = v173;
              float32x4_t v174 = v163[2];
              float32x4_t v175 = v163[3];
              float32x4_t v176 = vmlaq_f32(vmlaq_f32(v170, v174, *v10), v164[2], v10[4]);
              float32x4_t v177 = vmlaq_f32(vmlaq_f32(v170, v175, v10[1]), v164[3], v10[5]);
              v164[2] = v174;
              v164[3] = v175;
              v163[2] = v176;
              v163[3] = v177;
              float32x4_t v178 = v163[4];
              float32x4_t v179 = v163[5];
              float32x4_t v180 = vmlaq_f32(vmlaq_f32(v169, v178, v10[2]), v164[4], v10[6]);
              float32x4_t v181 = vmlaq_f32(vmlaq_f32(v170, v179, v10[3]), v164[5], v10[7]);
              v164[4] = v178;
              v164[5] = v179;
              v163[4] = v180;
              v163[5] = v181;
              v163 += 6;
              v164 += 6;
              v165 += 2;
            }
            while (v165 < v162);
          }
          if (v161)
          {
            uint64_t v182 = &a2[(int)v162][v159];
            float32x4_t v183 = vld1q_dup_f32(v182);
            float32x4_t v184 = v163[1];
            float32x4_t v185 = vmlaq_f32(vmlaq_f32(v183, *v163, *v10), *v164, v10[4]);
            float32x4_t v186 = vmlaq_f32(vmlaq_f32(v183, v184, v10[1]), v164[1], v10[5]);
            *float64x2_t v164 = *v163;
            v164[1] = v184;
            *float64x2_t v163 = v185;
            v163[1] = v186;
            float32x4_t v187 = v163[2];
            float32x4_t v188 = v163[3];
            float32x4_t v189 = vmlaq_f32(vmlaq_f32((float32x4_t)0, v188, v10[3]), v164[3], v10[7]);
            float32x4_t v190 = vmlaq_f32(vmlaq_f32(v183, v187, v10[2]), v164[2], v10[6]);
            v164[2] = v187;
            v164[3] = v188;
            v163[2] = v190;
            v163[3] = v189;
          }
          v159 += v160;
          ++v158;
        }
        while (v158 != v143);
      }
      goto LABEL_67;
    }
  }
  *((_DWORD *)this + 14) = v7;
  *((_DWORD *)this + 18) = v9;
  return v16;
}

double RamstadSRC::latencySeconds(RamstadSRC *this)
{
  double v1 = *((double *)this + 3);
  double v2 = *((double *)this + 2) / v1;
  if (v2 >= 1.0) {
    double v3 = dbl_225D3B2E0[*((_DWORD *)this + 10) == 8];
  }
  else {
    double v3 = dbl_225D3B2D0[*((_DWORD *)this + 10) == 8] / v2;
  }
  return v3 / v1;
}

double RamstadSRC::latencySamples(RamstadSRC *this)
{
  double v1 = *((double *)this + 2) / *((double *)this + 3);
  if (v1 >= 1.0) {
    return dbl_225D3B2E0[*((_DWORD *)this + 10) == 8];
  }
  else {
    return dbl_225D3B2D0[*((_DWORD *)this + 10) == 8] / v1;
  }
}

uint64_t RamstadSRC::inputSamplesForOutputSamples(RamstadSRC *this, int a2)
{
  unint64_t v2 = (a2 - 1);
  if (a2 < 1) {
    return 0;
  }
  if (*((unsigned char *)this + 76)) {
    LODWORD(v2) = (*((_DWORD *)this + 14) + *((_DWORD *)this + 12) * (int)v2) / *((_DWORD *)this + 9);
  }
  else {
    unint64_t v2 = (*((int *)this + 14) + *((void *)this + 8) * v2) >> 31;
  }
  uint64_t v3 = (v2 + *((_DWORD *)this + 18));
  *((_DWORD *)this + 58) = v3;
  *((_DWORD *)this + 59) = v3;
  *((_DWORD *)this + 60) = a2;
  return v3;
}

uint64_t RamstadSRC::outputSamplesForInputSamples(RamstadSRC *this, int a2, int *a3)
{
  int v5 = 0;
  uint64_t v6 = 0;
  *a3 = 0;
  int v7 = *((_DWORD *)this + 18);
  BOOL v8 = __OFSUB__(a2, v7);
  int v9 = a2 - v7;
  if (v9 < 0 == v8)
  {
    if (*((unsigned char *)this + 76))
    {
      uint64_t v11 = *((int *)this + 9) * (uint64_t)v9;
      uint64_t v12 = *((int *)this + 14);
      uint64_t v13 = *((int *)this + 12);
    }
    else
    {
      uint64_t v12 = (uint64_t)v9 << 31;
      uint64_t v11 = *((int *)this + 14);
      uint64_t v13 = *((void *)this + 8);
    }
    uint64_t v14 = (v12 + v11 + v13 - 1) / v13;
    uint64_t v6 = (v14 + 1);
    if ((v14 & 0x80000000) != 0)
    {
      int v5 = 0;
    }
    else
    {
      while (1)
      {
        int v5 = RamstadSRC::inputSamplesForOutputSamples(this, v6);
        if (v5 <= a2) {
          break;
        }
        BOOL v8 = __OFSUB__(v6, 1);
        uint64_t v6 = (v6 - 1);
        if (((int)v6 < 0) ^ v8 | (v6 == 0))
        {
          int v5 = *a3;
          goto LABEL_12;
        }
      }
      *a3 = v5;
    }
  }
LABEL_12:
  *((_DWORD *)this + 58) = v5;
  *((_DWORD *)this + 59) = a2;
  *((_DWORD *)this + 60) = v6;
  return v6;
}

void RamstadKernelFactoryD::~RamstadKernelFactoryD(RamstadKernelFactoryD *this)
{
  unint64_t v2 = *(void **)this;
  if (v2)
  {
    *((void *)this + 1) = v2;
    operator delete(v2);
  }
}

void RamstadKernelFactoryD::RamstadKernelFactoryD(RamstadKernelFactoryD *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<RamstadKernelD *>::reserve((void **)this, 0x20uLL);
}

void sub_225D1A00C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<RamstadKernelD *>::reserve(void **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<RamstadSRC *>>(v3, a2);
    int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void RamstadKernelFactory::~RamstadKernelFactory(RamstadKernelFactory *this)
{
  unint64_t v2 = *(void **)this;
  if (v2)
  {
    *((void *)this + 1) = v2;
    operator delete(v2);
  }
}

void RamstadKernelFactory::RamstadKernelFactory(RamstadKernelFactory *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<RamstadKernelD *>::reserve((void **)this, 0x20uLL);
}

void sub_225D1A138(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *_ZNSt3__16vectorIDv8_fNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_(void **a1, uint64_t a2, char *__src)
{
  int64_t v5 = *(char **)(a2 + 8);
  uint64_t v6 = (char *)*a1;
  int v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    int v7 = *(char **)(a2 + 8);
    do
    {
      long long v9 = *((_OWORD *)v8 - 2);
      long long v10 = *((_OWORD *)v8 - 1);
      v8 -= 32;
      *((_OWORD *)v7 - 2) = v9;
      *((_OWORD *)v7 - 1) = v10;
      v7 -= 32;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v11 = a1[1];
  uint64_t v12 = *(void *)(a2 + 16);
  int64_t v13 = v11 - __src;
  if (v11 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v11 - __src);
    int v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v12 + v13;
  uint64_t v14 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v14;
  uint64_t v15 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v15;
  uint64_t v16 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v16;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv8_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

_OWORD *_ZNSt3__16vectorIDv8_dNS_9allocatorIS1_EEE26__swap_out_circular_bufferERNS_14__split_bufferIS1_RS3_EEPS1_(void **a1, uint64_t a2, _OWORD *__src)
{
  int64_t v5 = *(_OWORD **)(a2 + 8);
  uint64_t v6 = *a1;
  int v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    int v7 = *(_OWORD **)(a2 + 8);
    do
    {
      long long v9 = *(v8 - 4);
      v8 -= 4;
      long long v11 = v8[2];
      long long v10 = v8[3];
      long long v12 = v8[1];
      *(v7 - 4) = v9;
      v7 -= 4;
      _OWORD v7[2] = v11;
      void v7[3] = v10;
      v7[1] = v12;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  int64_t v13 = a1[1];
  uint64_t v14 = *(void *)(a2 + 16);
  int64_t v15 = v13 - (unsigned char *)__src;
  if (v13 != (unsigned char *)__src)
  {
    memmove(*(void **)(a2 + 16), __src, v13 - (unsigned char *)__src);
    int v7 = *(_OWORD **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v14 + v15;
  uint64_t v16 = *a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v16;
  uint64_t v17 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v17;
  uint64_t v18 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v18;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

void *_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv8_dEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(a2 << 6);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void sub_225D1A430(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1A4D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1A594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1A60C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1A718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x22A63F100](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_225D1AAF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, long long a10)
{
  if (a2)
  {

    int64_t v13 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
    {
      uint64_t v14 = v13;
      if (CALog_DefaultScope)
      {
        int64_t v15 = *(id *)CALog_DefaultScope;
      }
      else
      {
        int64_t v15 = &_os_log_internal;
        id v16 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
        uint64_t v18 = (*(uint64_t (**)(void *))(*(void *)v14 + 16))(v14);
        LODWORD(a9) = 136315906;
        *(void *)((char *)&a9 + 4) = v17;
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 115;
        WORD1(a10) = 2080;
        *(void *)((char *)&a10 + 4) = "-[ASDRingBufferOutputStream writeMixBlock]_block_invoke";
        WORD6(a10) = 2080;
        *(void *)((char *)&a10 + 14) = v18;
        _os_log_impl(&dword_225CD5000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s: %s", (uint8_t *)&a9, 0x26u);
      }
    }
    else
    {
      if (CALog_DefaultScope)
      {
        int64_t v15 = *(id *)CALog_DefaultScope;
      }
      else
      {
        int64_t v15 = &_os_log_internal;
        id v19 = &_os_log_internal;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
        LODWORD(a9) = 136315906;
        *(void *)((char *)&a9 + 4) = v20;
        WORD6(a9) = 1024;
        *(_DWORD *)((char *)&a9 + 14) = 119;
        WORD1(a10) = 2080;
        *(void *)((char *)&a10 + 4) = "-[ASDRingBufferOutputStream writeMixBlock]_block_invoke";
        WORD6(a10) = 2080;
        *(void *)((char *)&a10 + 14) = "Unknown exception occured.";
        _os_log_impl(&dword_225CD5000, v15, OS_LOG_TYPE_ERROR, "%s:%d:%s: %s", (uint8_t *)&a9, 0x26u);
      }
    }

    __cxa_end_catch();
    JUMPOUT(0x225D1AAC4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ASDBufferList::setBufferListFromData(ASDBufferList *this, void *a2, int a3)
{
  if (!a2) {
    ASDBufferList::setBufferListFromData();
  }
  if (*(_DWORD *)(*((void *)this + 5) + 24) != 1) {
    ASDBufferList::setBufferListFromData();
  }
  int v4 = *((_DWORD *)this + 6) * a3;
  int64_t v5 = (CABufferList *)*((void *)this + 5);
  return CABufferList::SetBytes(v5, v4, a2);
}

void sub_225D1AE38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1AED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1AF9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1B00C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1B118(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1B4B8(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, long long a12)
{
  if (a2)
  {

    int64_t v15 = __cxa_begin_catch(a1);
    if (a2 == 2)
    {
      id v16 = v15;
      if (CALog_DefaultScope)
      {
        uint64_t v17 = *(id *)CALog_DefaultScope;
      }
      else
      {
        uint64_t v17 = &_os_log_internal;
        id v18 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v19 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
        uint64_t v20 = (*(uint64_t (**)(void *))(*(void *)v16 + 16))(v16);
        LODWORD(buf) = 136315906;
        *(void *)((char *)&buf + 4) = v19;
        WORD6(buf) = 1024;
        *(_DWORD *)((char *)&buf + 14) = 220;
        WORD1(a12) = 2080;
        *(void *)((char *)&a12 + 4) = "-[ASDRingBufferInputStream readInputBlock]_block_invoke";
        WORD6(a12) = 2080;
        *(void *)((char *)&a12 + 14) = v20;
        _os_log_impl(&dword_225CD5000, v17, OS_LOG_TYPE_ERROR, "%s:%d:%s: %s", (uint8_t *)&buf, 0x26u);
      }
    }
    else
    {
      if (CALog_DefaultScope)
      {
        uint64_t v17 = *(id *)CALog_DefaultScope;
      }
      else
      {
        uint64_t v17 = &_os_log_internal;
        id v21 = &_os_log_internal;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v22 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDRingBufferStream.mm");
        LODWORD(buf) = 136315650;
        *(void *)((char *)&buf + 4) = v22;
        WORD6(buf) = 1024;
        *(_DWORD *)((char *)&buf + 14) = 225;
        WORD1(a12) = 2080;
        *(void *)((char *)&a12 + 4) = "-[ASDRingBufferInputStream readInputBlock]_block_invoke";
        _os_log_impl(&dword_225CD5000, v17, OS_LOG_TYPE_ERROR, "%s:%d:%s: Unknown exception occured.", (uint8_t *)&buf, 0x1Cu);
      }
    }

    __cxa_end_catch();
    JUMPOUT(0x225D1B480);
  }
  _Unwind_Resume(a1);
}

void sub_225D1B840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_225D1B8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t CABufferList::SetBytes(CABufferList *this, int a2, void *a3)
{
  v10[5] = *MEMORY[0x263EF8340];
  uint64_t result = CABufferList::VerifyNotTrashingOwnedBuffer((uint64_t)this);
  if (*((_DWORD *)this + 6) != 1)
  {
    if (CALog_DefaultScope)
    {
      int v7 = *(id *)CALog_DefaultScope;
    }
    else
    {
      int v7 = &_os_log_internal;
      id v8 = &_os_log_internal;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      long long v9 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/Utility/CABufferList.h");
      CABufferList::SetBytes((uint64_t)v9, (uint64_t)v10);
    }

    __break(1u);
  }
  *((_DWORD *)this + 9) = a2;
  *((void *)this + 5) = a3;
  return result;
}

void sub_225D1BA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *CABufferList::New(CABufferList *this, const char *a2, const CAStreamBasicDescription *a3)
{
  int v4 = *((_DWORD *)a2 + 3);
  if ((v4 & 0x20) != 0) {
    unsigned int v5 = *((_DWORD *)a2 + 7);
  }
  else {
    unsigned int v5 = 1;
  }
  if ((v4 & 0x20) != 0) {
    int v6 = 1;
  }
  else {
    int v6 = *((_DWORD *)a2 + 7);
  }
  uint64_t result = operator new(16 * v5 + 32);
  void *result = this;
  result[1] = 0;
  *((_DWORD *)result + 4) = 0;
  *((_DWORD *)result + 6) = v5;
  if (v5)
  {
    id v8 = (char *)(result + 4);
    do
    {
      *(_DWORD *)id v8 = v6;
      *((_DWORD *)v8 + 1) = 0;
      *((void *)v8 + 1) = 0;
      v8 += 16;
      --v5;
    }
    while (v5);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  return result;
}

void sub_225D20978(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

uint64_t CALog::setNumberSubscopeBits(uint64_t this)
{
  CALog::sNumberScopeBits = 64 - this;
  CALog::sScopeMask = ~(-1 << -(char)this);
  CALog::sSubscopeMask = -1 << -(char)this;
  return this;
}

uint64_t CALog::Instance(CALog *this)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&CALog::Instance(void)::onceflag, memory_order_acquire) != -1)
  {
    int v4 = &v2;
    uint64_t v3 = &v4;
    std::__call_once(&CALog::Instance(void)::onceflag, &v3, (void (__cdecl *)(void *))std::__call_once_proxy[abi:ne180100]<std::tuple<CALog::Instance(void)::$_0 &&>>);
  }
  return CALog::Instance(void)::instance;
}

uint64_t CALog::Scope::SetScopePriorityThreshold(uint64_t this, int a2)
{
  if (a2 >= 5) {
    int v2 = 5;
  }
  else {
    int v2 = a2;
  }
  if ((*(_DWORD *)(this + 48) & 0x20) != 0) {
    int v3 = v2;
  }
  else {
    int v3 = a2;
  }
  *(_DWORD *)(this + 8) = v3;
  return this;
}

CALog::Scope *CALog::Scope::Scope(CALog::Scope *this, int a2, uint64_t a3, const char *category, const char *subsystem, const char *a6, int a7)
{
  *((_DWORD *)this + 2) = 3;
  *((void *)this + 2) = 0;
  *((void *)this + 7) = 0;
  *((unsigned char *)this + 64) = 0;
  if (a2)
  {
    os_log_t v13 = (os_log_t)&_os_log_internal;
    if (category && subsystem) {
      os_log_t v13 = os_log_create(subsystem, category);
    }
    *(void *)this = v13;
    gUseOSLogInDefaultScope = 1;
  }
  else
  {
    *(void *)this = 0;
  }
  uint64_t v14 = (__CFString *)CFStringCreateWithCString(0, subsystem, 0x8000100u);
  int64_t v15 = (__CFString *)CFStringCreateWithCString(0, a6, 0x8000100u);
  CALog::Scope::init(this, a3, category, v14, v15, a7);
  CFRelease(v14);
  CFRelease(v15);
  return this;
}

uint64_t CALog::Scope::init(CALog::Scope *this, uint64_t a2, const char *a3, __CFString *cf, void *a5, int a6)
{
  v24[4] = *MEMORY[0x263EF8340];
  *((void *)this + 3) = a3;
  *((void *)this + 4) = cf;
  *((void *)this + 5) = a5;
  *((_DWORD *)this + 12) = a6;
  if (cf) {
    CFRetain(cf);
  }
  if (a5) {
    CFRetain(a5);
  }
  *((void *)this + 15) = 0;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  pthread_rwlock_wrlock(&sLock);
  long long v10 = (void **)gScopes;
  if (!gScopes) {
    operator new();
  }
  unint64_t v11 = *(void *)(gScopes + 16);
  long long v12 = *(void **)(gScopes + 8);
  if ((unint64_t)v12 >= v11)
  {
    uint64_t v14 = ((uint64_t)v12 - *(void *)gScopes) >> 4;
    unint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) >> 60) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = v11 - *(void *)gScopes;
    if (v16 >> 3 > v15) {
      unint64_t v15 = v16 >> 3;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v17 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17) {
      id v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDSRCStreamHelper::ASDUnderlyingStreamDoIOOperationBlocks>>(gScopes + 16, v17);
    }
    else {
      id v18 = 0;
    }
    id v19 = &v18[16 * v14];
    uint64_t v20 = &v18[16 * v17];
    *(void *)id v19 = a2;
    *((void *)v19 + 1) = this;
    os_log_t v13 = v19 + 16;
    uint64_t v22 = (char *)*v10;
    id v21 = (char *)v10[1];
    if (v21 != *v10)
    {
      do
      {
        *((_OWORD *)v19 - 1) = *((_OWORD *)v21 - 1);
        v19 -= 16;
        v21 -= 16;
      }
      while (v21 != v22);
      id v21 = (char *)*v10;
    }
    *long long v10 = v19;
    v10[1] = v13;
    v10[2] = v20;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *long long v12 = a2;
    v12[1] = this;
    os_log_t v13 = v12 + 2;
  }
  v10[1] = v13;
  uint64_t result = pthread_rwlock_unlock(&sLock);
  if (cf)
  {
    v24[0] = &unk_26D96F850;
    v24[1] = this;
    v24[3] = v24;
    CASmartPreferences::AddHandler<int>((CASmartPreferences *)a5, cf, (uint64_t)PrefValueToPriority, (uint64_t)v24);
    return (uint64_t)std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v24);
  }
  return result;
}

void sub_225D233C8(_Unwind_Exception *a1)
{
}

void *CASmartPreferences::AddHandler<int>(CASmartPreferences *a1, __CFString *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v8 = CASmartPreferences::instance(a1);
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)v11, a4);
  os_log_t v13 = 0;
  long long v9 = operator new(0x30uLL);
  void *v9 = &unk_26D96F808;
  v9[1] = a3;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v9 + 2), (uint64_t)v11);
  os_log_t v13 = v9;
  CASmartPreferences::_RegisterFirstHandler((uint64_t)v8, a1, a2, (uint64_t)v12);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100](v12);
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v11);
}

void sub_225D23500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<BOOL ()(void const*)>::~__value_func[abi:ne180100]((uint64_t *)va);
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](v6);
  _Unwind_Resume(a1);
}

uint64_t PrefValueToPriority(const __CFString *a1, BOOL *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int valuePtr = -1;
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr);
    int v5 = valuePtr + 3;
  }
  else
  {
    if (v4 != CFStringGetTypeID()) {
      goto LABEL_22;
    }
    if (CFEqual(a1, @"error"))
    {
      int v5 = 1;
      goto LABEL_23;
    }
    if (CFEqual(a1, @"warning"))
    {
      int v5 = 2;
      goto LABEL_23;
    }
    if (CFEqual(a1, @"note") || CFEqual(a1, @"notice"))
    {
      int v5 = 3;
      goto LABEL_23;
    }
    if (CFEqual(a1, @"info"))
    {
      int v5 = 4;
      goto LABEL_23;
    }
    if (CFEqual(a1, @"details"))
    {
      int v5 = 5;
      goto LABEL_23;
    }
    if (CFEqual(a1, @"minutiae"))
    {
      int v5 = 6;
      goto LABEL_23;
    }
    if (CFEqual(a1, @"spew"))
    {
      int v5 = 7;
      goto LABEL_23;
    }
    if (!CFStringGetCString(a1, buffer, 64, 0x8000100u))
    {
LABEL_22:
      int v5 = -1;
      goto LABEL_23;
    }
    int v9 = 0;
    int v6 = sscanf(buffer, "%d", &v9);
    int v5 = v9 + 3;
    if (v6 != 1) {
      int v5 = -1;
    }
  }
LABEL_23:
  *a2 = v5 > 0;
  return v5 & ~(v5 >> 31);
}

uint64_t CALog::RegisterScope(CALog *this, uint64_t a2, unint64_t a3, const char *a4, const char *a5, const char *a6)
{
  if ((CALog::sSubscopeMask & a2) != 0)
  {
    CALog::RegisterScope(a2);
    os_log_t v13 = v12;
    MEMORY[0x22A63EB50](v6, 0x1070C40331E2312);
    _Unwind_Resume(v13);
  }
  if (!a2) {
    goto LABEL_9;
  }
  pthread_rwlock_rdlock(&sLock);
  if (!gScopes || (id v8 = *(void **)gScopes, v9 = *(void **)(gScopes + 8), *(void **)gScopes == v9))
  {
LABEL_7:
    uint64_t v10 = 0;
  }
  else
  {
    while (*v8 != (CALog::sScopeMask & a2))
    {
      v8 += 2;
      if (v8 == v9) {
        goto LABEL_7;
      }
    }
    uint64_t v10 = v8[1];
  }
  pthread_rwlock_unlock(&sLock);
  if (!v10) {
LABEL_9:
  }
    operator new();
  return v10;
}

char *LogFilenameOnly(char *__s)
{
  uint64_t v1 = __s;
  if (__s) {
    __s = strrchr(__s, 47);
  }
  if (__s) {
    return __s + 1;
  }
  else {
    return v1;
  }
}

uint64_t CALog::Scope::SetPriorityThreshold(uint64_t this, unint64_t a2, int a3)
{
  if (a2)
  {
    uint64_t v3 = 0;
    unint64_t v4 = a2 >> CALog::sNumberScopeBits;
    unint64_t v5 = ~(a2 >> CALog::sNumberScopeBits);
    uint64_t v6 = this + 72;
    do
    {
      uint64_t v7 = v3 + 1;
      uint64_t v8 = *(void *)(v6 + 8 * v3);
      uint64_t v9 = v8 | v4;
      uint64_t v10 = v8 & v5;
      if (v3 + 1 <= a3) {
        uint64_t v10 = v9;
      }
      *(void *)(v6 + 8 * v3++) = v10;
    }
    while (v7 != 7);
    *(void *)(this + 16) |= v4;
  }
  else
  {
    if (a3 >= 5) {
      int v11 = 5;
    }
    else {
      int v11 = a3;
    }
    if ((*(_DWORD *)(this + 48) & 0x20) != 0) {
      int v12 = v11;
    }
    else {
      int v12 = a3;
    }
    *(_DWORD *)(this + 8) = v12;
  }
  return this;
}

uint64_t CALog::Scope::GetPriorityThreshold(CALog::Scope *this, uint64_t a2)
{
  if (a2)
  {
    LODWORD(v2) = 8;
    for (uint64_t i = 6; i != -1; --i)
    {
      uint64_t v4 = *((void *)this + i + 9);
      uint64_t v2 = (v2 - 1);
      if ((v4 & a2) != 0) {
        return v2;
      }
    }
  }
  return *((unsigned int *)this + 2);
}

uint64_t CALog::Scope::SetScopeFileDestination(uint64_t this, __sFILE *a2, char a3)
{
  *(void *)(this + 56) = a2;
  if (a2) {
    char v3 = a3;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(this + 64) = v3;
  return this;
}

BOOL CALog::Scope::ScopeLogEnabled(CALog::Scope *this, int a2, unint64_t a3)
{
  unint64_t v3 = a3 >> CALog::sNumberScopeBits;
  if (!(a3 >> CALog::sNumberScopeBits)) {
    return *((_DWORD *)this + 2) >= a2;
  }
  if ((a2 - 1) <= 6 && (*((void *)this + (a2 - 1) + 9) & v3) != 0) {
    return 1;
  }
  return (v3 & ~*((void *)this + 2)) != 0 && *((_DWORD *)this + 2) >= a2;
}

uint64_t CALog::LogEnabled(int a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (a1 > 5) {
    goto LABEL_15;
  }
  if (v4)
  {
    if (!*(void *)v4)
    {
LABEL_16:
      unint64_t v8 = (unint64_t)a2[1] >> CALog::sNumberScopeBits;
      if (v8)
      {
        if ((a1 - 1) <= 6 && (*(void *)(v4 + 8 * (a1 - 1) + 72) & v8) != 0) {
          return 1;
        }
        if ((v8 & ~*(void *)(v4 + 16)) == 0) {
          return 0;
        }
      }
      return *(_DWORD *)(v4 + 8) >= a1;
    }
  }
  else if (gUseOSLogInDefaultScope != 1)
  {
    return a1 < 4;
  }
  if ((a1 - 1) < 3) {
    return 1;
  }
  if ((a1 - 4) > 1
    || (!v4 ? (unint64_t v5 = &_os_log_internal) : (unint64_t v5 = *(NSObject **)v4),
        (uint64_t v6 = 1, a1 == 4) ? (v7 = OS_LOG_TYPE_INFO) : (v7 = OS_LOG_TYPE_DEBUG),
        !os_log_type_enabled(v5, v7)))
  {
LABEL_15:
    if (v4) {
      goto LABEL_16;
    }
    return a1 < 4;
  }
  return v6;
}

void CALog::CALog(CALog *this, const char *__filename)
{
  *((void *)this + 1) = 0;
  *(_DWORD *)this = 1;
  if (__filename) {
    *((void *)this + 1) = fopen(__filename, "a");
  }
}

{
  *((void *)this + 1) = 0;
  *(_DWORD *)this = 1;
  if (__filename) {
    *((void *)this + 1) = fopen(__filename, "a");
  }
}

void CALog::~CALog(CALog *this)
{
  uint64_t v2 = (FILE *)*((void *)this + 1);
  if (v2)
  {
    fclose(v2);
    *((void *)this + 1) = 0;
  }
}

{
  FILE *v2;

  uint64_t v2 = (FILE *)*((void *)this + 1);
  if (v2)
  {
    fclose(v2);
    *((void *)this + 1) = 0;
  }
}

FILE *CALog::setFile(CALog *this, __sFILE *a2)
{
  uint64_t result = (FILE *)*((void *)this + 1);
  if (result) {
    uint64_t result = (FILE *)fclose(result);
  }
  *((void *)this + 1) = a2;
  return result;
}

void formatLikeOSLog(UInt8 *a1, uint64_t a2, char *__source, unsigned int *a4)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  if (!a2) {
    return;
  }
  uint64_t v4 = a1;
  unint64_t v5 = (unint64_t)&a1[a2 - 1];
  if (v5 <= (unint64_t)a1) {
    goto LABEL_136;
  }
  uint64_t v7 = MEMORY[0x263EF8318];
  uint64_t v68 = (uint64_t)&a1[a2 - 1];
  while (1)
  {
    uint64_t v9 = __source + 1;
    int v8 = *__source;
    if (v8 != 37)
    {
      if (!*__source) {
        goto LABEL_136;
      }
      goto LABEL_8;
    }
    if (*v9 != 37) {
      break;
    }
LABEL_8:
    *v4++ = v8;
    ++__source;
LABEL_129:
    if ((unint64_t)v4 >= v5) {
      goto LABEL_136;
    }
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  *(_OWORD *)__dst = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  *(_OWORD *)float32x4_t v74 = 0u;
  long long v75 = 0u;
  int v10 = *v9;
  if (v10 != 123)
  {
    int v12 = 0;
    if (*v9) {
      goto LABEL_44;
    }
    goto LABEL_46;
  }
  int v11 = strchr(__source + 2, 125);
  if (v11)
  {
    int v12 = v11;
    BOOL v13 = *(_DWORD *)(__source + 2) == 1986622064 && *(_DWORD *)(__source + 5) == 1702125942;
    if (v13)
    {
      BOOL v15 = 0;
      uint64_t v16 = __source + 9;
    }
    else
    {
      int v14 = *(_DWORD *)(__source + 2) ^ 0x6C627570 | *((unsigned __int16 *)__source + 3) ^ 0x6369;
      BOOL v13 = v14 == 0;
      BOOL v15 = v14 != 0;
      uint64_t v16 = __source + 8;
      if (!v13) {
        uint64_t v16 = __source + 2;
      }
    }
    unint64_t v17 = v16 - 1;
    do
    {
      unsigned int v18 = v17[1];
      if ((v18 & 0x80000000) != 0) {
        int v19 = __maskrune(v18, 0x4000uLL);
      }
      else {
        int v19 = *(_DWORD *)(v7 + 4 * v18 + 60) & 0x4000;
      }
      ++v17;
    }
    while (v19);
    if (!v15 && *v17 == 44) {
      ++v17;
    }
    uint64_t v20 = v17 - 1;
    id v21 = v17 - 2;
    do
    {
      unsigned int v22 = v20[1];
      if ((v22 & 0x80000000) != 0) {
        int v23 = __maskrune(v22, 0x4000uLL);
      }
      else {
        int v23 = *(_DWORD *)(v7 + 4 * v22 + 60) & 0x4000;
      }
      ++v20;
      ++v21;
    }
    while (v23);
    uint64_t v24 = strchr(v20, 58);
    if (v24)
    {
      uint64_t v25 = v24;
      if (v24 < v12)
      {
        if ((unint64_t)(v24 - v21) >= 0x80) {
          size_t v26 = 128;
        }
        else {
          size_t v26 = v24 - v21;
        }
        strlcpy(__dst, v20, v26);
        if ((unint64_t)(v12 - v25) < 0x80) {
          size_t v27 = v12 - v25;
        }
        else {
          size_t v27 = 128;
        }
        strlcpy(v74, v25 + 1, v27);
      }
    }
    uint64_t v9 = v12 + 1;
    LOBYTE(v10) = v12[1];
    if ((_BYTE)v10)
    {
      do
      {
LABEL_44:
        if (!memchr("-+ #0123456789.'", (char)v10, 0x11uLL)) {
          break;
        }
        int v28 = *++v9;
        LOBYTE(v10) = v28;
      }
      while (v28);
    }
LABEL_46:
    if (v10 == 42) {
      float32x4_t v29 = v9 + 1;
    }
    else {
      float32x4_t v29 = v9;
    }
    int v30 = *v29;
    if (v30 > 107)
    {
      if (v30 == 108)
      {
        float32x4_t v36 = v29 + 1;
        BOOL v37 = v29[1] == 108;
        v29 += 2;
        if (v37) {
          int v32 = 4;
        }
        else {
          int v32 = 3;
        }
        if (!v37) {
          float32x4_t v29 = v36;
        }
      }
      else
      {
        if (v30 == 122) {
          int v33 = 6;
        }
        else {
          int v33 = 0;
        }
        if (v30 == 122) {
          float64x2_t v34 = v29 + 1;
        }
        else {
          float64x2_t v34 = v29;
        }
        if (v30 == 116) {
          int v32 = 7;
        }
        else {
          int v32 = v33;
        }
        if (v30 == 116) {
          ++v29;
        }
        else {
          float32x4_t v29 = v34;
        }
      }
    }
    else if (v30 == 76)
    {
      ++v29;
      int v32 = 8;
    }
    else
    {
      if (v30 == 104)
      {
        int v35 = *++v29;
        BOOL v31 = v35 == 104;
        if (v35 == 104) {
          int v32 = 1;
        }
        else {
          int v32 = 2;
        }
      }
      else
      {
        BOOL v31 = v30 == 106;
        if (v30 == 106) {
          int v32 = 5;
        }
        else {
          int v32 = 0;
        }
      }
      if (v31) {
        ++v29;
      }
    }
    int v38 = *v29;
    unsigned int v69 = v29 + 1;
    int v39 = *v29;
    if (!v12 || v39 == 80)
    {
      unint64_t v44 = v29 - __source + 2;
      if (v44 >= 0xA0) {
        size_t v42 = 160;
      }
      else {
        size_t v42 = v44;
      }
      p_format = &__format;
      uint64_t v40 = __source;
    }
    else
    {
      char __format = 37;
      uint64_t v40 = v12 + 1;
      unint64_t v41 = v29 - (v12 + 1) + 2;
      if (v41 >= 0x9F) {
        size_t v42 = 159;
      }
      else {
        size_t v42 = v41;
      }
      p_format = v73;
    }
    strlcpy(p_format, v40, v42);
    if (v38 <= 79)
    {
      if ((v38 - 69) < 3) {
        goto LABEL_97;
      }
      if (v38 == 64)
      {
        int8x16_t v55 = a4;
        a4 += 2;
        CFStringRef v56 = CFStringCreateWithFormat(0, 0, @"%@", *(void *)v55);
        CFStringRef v57 = v56;
        CFIndex usedBufLen = 0;
        unint64_t v5 = v68;
        if ((UInt8 *)v68 == v4)
        {
          int v58 = 0;
        }
        else
        {
          v91.length = CFStringGetLength(v56);
          v91.location = 0;
          CFStringGetBytes(v57, v91, 0x8000100u, 0, 0, v4, ~(unint64_t)v4 + v68, &usedBufLen);
          int v58 = usedBufLen;
          v4[usedBufLen] = 0;
        }
        unsigned int v59 = v58 >> 31;
        v4 += v58 & ~(v58 >> 31);
        CFRelease(v57);
        goto LABEL_127;
      }
      if (v38 == 65)
      {
LABEL_97:
        int v48 = a4;
        a4 += 2;
        uint64_t v49 = *(void *)v48;
        unint64_t v5 = v68;
        if (v10 == 42)
        {
          uint64_t v50 = a4;
          a4 += 2;
          if (__dst[0]) {
            goto LABEL_136;
          }
          unsigned int v51 = snprintf((char *)v4, v68 - (void)v4, &__format, *v50, v49);
        }
        else
        {
          if (__dst[0]) {
            goto LABEL_136;
          }
          unsigned int v51 = snprintf((char *)v4, v68 - (void)v4, &__format, v49, v67);
        }
        goto LABEL_125;
      }
LABEL_112:
      LOBYTE(v59) = 0;
      *v4++ = v39;
      unint64_t v5 = v68;
    }
    else
    {
      switch(v38)
      {
        case 'a':
        case 'e':
        case 'f':
        case 'g':
          goto LABEL_97;
        case 'b':
        case 'h':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 'q':
        case 'r':
        case 't':
        case 'v':
        case 'w':
          goto LABEL_112;
        case 'c':
          float v60 = a4;
          a4 += 2;
          uint64_t v47 = *v60;
          goto LABEL_117;
        case 'd':
        case 'i':
          unint64_t v5 = v68;
          switch(v32)
          {
            case 1:
            case 2:
              goto LABEL_93;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
              goto LABEL_105;
            default:
              goto LABEL_120;
          }
        case 'o':
        case 'u':
        case 'x':
          goto LABEL_104;
        case 'p':
          uint64_t v61 = a4;
          a4 += 2;
          uint64_t v47 = *(void *)v61;
          if (v10 == 42)
          {
            float32x4_t v53 = a4;
            a4 += 2;
            int v54 = __dst[0];
            unint64_t v5 = v68;
            goto LABEL_108;
          }
          int v65 = __dst[0];
          unint64_t v5 = v68;
          goto LABEL_123;
        case 's':
          unsigned int v62 = a4;
          a4 += 2;
          uint64_t v47 = *(void *)v62;
LABEL_117:
          int v63 = v10;
LABEL_121:
          unint64_t v5 = v68;
          if (v63 == 42)
          {
LABEL_107:
            float32x4_t v53 = a4;
            a4 += 2;
            int v54 = __dst[0];
LABEL_108:
            if (v54) {
              goto LABEL_136;
            }
            unsigned int v51 = snprintf((char *)v4, v5 - (void)v4, &__format, *v53, v47);
          }
          else
          {
LABEL_122:
            int v65 = __dst[0];
LABEL_123:
            if (v65) {
              goto LABEL_136;
            }
            unsigned int v51 = snprintf((char *)v4, v5 - (void)v4, &__format, v47, v67);
          }
          break;
        default:
          if (v38 == 80)
          {
            if (v10 == 42)
            {
              a4 += 4;
              LOBYTE(v59) = 1;
              unint64_t v5 = v68;
            }
            else
            {
              unint64_t v5 = v68;
              snprintf((char *)v4, v68 - (void)v4, "<expected .* before %%P>");
              LOBYTE(v59) = 1;
            }
            goto LABEL_127;
          }
          if (v38 == 88)
          {
LABEL_104:
            unint64_t v5 = v68;
            switch(v32)
            {
              case 1:
              case 2:
LABEL_93:
                int v45 = v10;
                uint64_t v46 = a4;
                a4 += 2;
                uint64_t v47 = *v46;
                goto LABEL_106;
              case 3:
              case 4:
              case 5:
              case 6:
              case 7:
LABEL_105:
                int v45 = v10;
                float32x4_t v52 = a4;
                a4 += 2;
                uint64_t v47 = *(void *)v52;
LABEL_106:
                if (v45 == 42) {
                  goto LABEL_107;
                }
                goto LABEL_122;
              default:
LABEL_120:
                int v63 = v10;
                int v64 = a4;
                a4 += 2;
                uint64_t v47 = *v64;
                goto LABEL_121;
            }
          }
          goto LABEL_112;
      }
LABEL_125:
      if ((v51 & 0x80000000) != 0) {
        goto LABEL_136;
      }
      LOBYTE(v59) = 0;
      v4 += v51;
    }
LABEL_127:
    if (v59) {
      goto LABEL_136;
    }
    __source = v69;
    goto LABEL_129;
  }
  snprintf((char *)v4, v5 - (void)v4, "<%%P parse error>");
LABEL_136:
  if ((unint64_t)v4 >= v5) {
    int v66 = (unsigned char *)v5;
  }
  else {
    int v66 = v4;
  }
  *int v66 = 0;
}

void CALog::log_va(CALog *this, int a2, const CALog::Scope *a3, char *__s, int a5, const char *a6, char *__s1, CFStringRef format, va_list arguments)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    LOBYTE(v16) = 31;
    goto LABEL_5;
  }
  int v16 = *((_DWORD *)a3 + 12);
  if (v16)
  {
LABEL_5:
    uint64_t CurrentGregorianDate = CATimeUtilities::GetCurrentGregorianDate(this);
    int v20 = snprintf(__str, 0x400uLL, "%.2d:%.2d:%.2d.%.3d ", (int)((unint64_t)CurrentGregorianDate >> 24) >> 24, CurrentGregorianDate >> 56, (int)v19, (int)((v19 - (double)(int)v19) * 1000.0));
    unsigned int v17 = v20 & ~(v20 >> 31);
    goto LABEL_6;
  }
  unsigned int v17 = 0;
LABEL_6:
  if ((a2 - 1) <= 6 && (v16 & 2) != 0)
  {
    int v21 = snprintf(&__str[v17], 1024 - v17, "%s", gPriorityStrings[a2 - 1]);
    v17 += v21 & ~(v21 >> 31);
  }
  if ((v16 & 4) != 0)
  {
    LOBYTE(usedBufLen[0]) = 0;
    unsigned int v22 = pthread_self();
    pthread_getname_np(v22, (char *)usedBufLen, 0x40uLL);
    if (LOBYTE(usedBufLen[0]))
    {
      int v23 = snprintf(&__str[v17], 1024 - v17, "[%s] ");
    }
    else
    {
      pthread_self();
      int v23 = snprintf(&__str[v17], 1024 - v17, "[%p] ");
    }
    v17 += v23 & ~(v23 >> 31);
  }
  if (a3 && *((void *)a3 + 3))
  {
    uint64_t v24 = &__str[v17];
    size_t v25 = 1024 - v17;
    if (a2 >= 3) {
      int v26 = snprintf(v24, v25, "<%s> ");
    }
    else {
      int v26 = snprintf(v24, v25, ">%s> ");
    }
    v17 += v26 & ~(v26 >> 31);
  }
  if ((v16 & 8) != 0)
  {
    if (__s)
    {
      strrchr(__s, 47);
      int v27 = snprintf(&__str[v17], 1024 - v17, "%s:%d: ");
    }
    else
    {
      int v27 = snprintf(&__str[v17], 1024 - v17, "%d: ");
    }
    v17 += v27 & ~(v27 >> 31);
  }
  if (a6 && (v16 & 0x10) != 0)
  {
    int v28 = snprintf(&__str[v17], 1024 - v17, "%s: ", a6);
    v17 += v28 & ~(v28 >> 31);
  }
  if (__s1)
  {
    if (strstr(__s1, "%@") || strstr(__s1, "%{")) {
      formatLikeOSLog((UInt8 *)&__str[v17], 1024 - v17, __s1, (unsigned int *)arguments);
    }
    else {
      vsnprintf(&__str[v17], 1024 - v17, __s1, arguments);
    }
    goto LABEL_36;
  }
  if (!format)
  {
LABEL_36:
    CALog::scopedPrint(this, a3, a2, __str);
    return;
  }
  CFStringRef v29 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
  int v30 = __str;
  if (CFStringGetCString(v29, &__str[v17], 1023 - v17, 0x8000100u))
  {
    BOOL v31 = 0;
  }
  else
  {
    usedBufLen[0] = 0;
    v36.length = CFStringGetLength(v29);
    v36.location = 0;
    CFStringGetBytes(v29, v36, 0x8000100u, 0x3Fu, 0, 0, 0, usedBufLen);
    if ((unint64_t)(usedBufLen[0] - 1) > 0x3FFE)
    {
      BOOL v31 = 0;
      int v30 = __str;
    }
    else
    {
      size_t v32 = v17 + usedBufLen[0] + 1;
      BOOL v31 = (char *)malloc_type_malloc(v32, 0xAF11C50FuLL);
      strlcpy(v31, __str, v32);
      CFStringGetCString(v29, &v31[v17], (int)(v32 - v17), 0x8000100u);
      int v30 = v31;
    }
  }
  CFRelease(v29);
  CALog::scopedPrint(this, a3, a2, v30);
  if (v31) {
    free(v31);
  }
}

void CALog::scopedPrint(CALog *this, const CALog::Scope *a2, int a3, const char *a4)
{
  if (!a2
    || (int v8 = (FILE *)*((void *)a2 + 7)) == 0
    || (fprintf(v8, "%s\n", a4), fflush(*((FILE **)a2 + 7)), !*((unsigned char *)a2 + 64)))
  {
    CALog::print(this, a3, a4);
  }
}

void CALog::vprintf(CALog *this, int a2, const char *a3, va_list a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a3)
  {
    vsnprintf(__str, 0x400uLL, a3, a4);
    CALog::print(this, a2, __str);
  }
}

void CALog::print(CALog *this, int a2, const char *a3)
{
  uint64_t v4 = (FILE *)*((void *)this + 1);
  if (v4)
  {
    fprintf(v4, "%s\n", a3);
    unint64_t v5 = (FILE *)*((void *)this + 1);
    fflush(v5);
  }
  else
  {
    if (a2 >= 3) {
      int v6 = 3;
    }
    else {
      int v6 = a2;
    }
    int v7 = *(_DWORD *)this;
    if (*(_DWORD *)this == 3)
    {
      puts(a3);
    }
    else if (v7 == 2)
    {
      syslog(v6 + 2, "%s", a3);
    }
    else if (v7 == 1)
    {
      CFLog();
    }
  }
}

void _CALog_Log(CALog *a1, const CALog::Scope *a2, char *a3, int a4, const char *a5, char *a6, uint64_t a7, uint64_t a8, char arguments)
{
  int v14 = (int)a1;
  BOOL v15 = (CALog *)CALog::Instance(a1);
  CALog::log_va(v15, v14, a2, a3, a4, a5, a6, 0, &arguments);
}

uint64_t _CALog_LogEnabled(int a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = 0;
  return CALog::LogEnabled(a1, v3);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<CALog::Instance(void)::$_0 &&>>()
{
}

uint64_t std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

{
  void *v3;
  uint64_t v4;

  uint64_t v3 = (void *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 24);
  if (v4)
  {
    if (v4 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(*(void *)*v3 + 24))(*v3, a1);
      return a1;
    }
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    uint64_t v3 = (void *)(a1 + 24);
  }
  void *v3 = 0;
  return a1;
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(void *a1)
{
  *a1 = &unk_26D96F808;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);
  return a1;
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::~__func(void *a1)
{
  *a1 = &unk_26D96F808;
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);
  JUMPOUT(0x22A63EB50);
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x30uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *v2 = &unk_26D96F808;
  v2[1] = v3;
  std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(v2 + 2), a1 + 16);
  return v2;
}

void sub_225D24C68(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  *a2 = &unk_26D96F808;
  a2[1] = v2;
  return std::__function::__value_func<void ()(int)>::__value_func[abi:ne180100]((uint64_t)(a2 + 2), a1 + 16);
}

void *std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy(uint64_t a1)
{
  return std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100]((void *)(a1 + 16));
}

void std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::destroy_deallocate(void *a1)
{
  std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](a1 + 2);
  operator delete(a1);
}

BOOL std::__function::__func<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1},std::allocator<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1}>,BOOL ()(void const*)>::operator()(uint64_t a1, uint64_t *a2)
{
  return std::__invoke_void_return_wrapper<BOOL,false>::__call[abi:ne180100]<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1} &,void const*>((uint64_t (**)(uint64_t, char *))(a1 + 8), a2);
}

BOOL std::__invoke_void_return_wrapper<BOOL,false>::__call[abi:ne180100]<void CASmartPreferences::AddHandler<int>(__CFString const*,__CFString const*,int (*)(void const*,BOOL &),std::function<void ()(int)>)::{lambda(void const*)#1} &,void const*>(uint64_t (**a1)(uint64_t, char *), uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v6 = 0;
  int v4 = (*a1)(v3, &v6);
  if (!v6) {
    return 0;
  }
  std::function<void ()(int)>::operator()((uint64_t)(a1 + 1), v4);
  return v6 != 0;
}

uint64_t std::function<void ()(int)>::operator()(uint64_t a1, int a2)
{
  int v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, int *))(*(void *)v2 + 48))(v2, &v4);
}

void std::__function::__func<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0,std::allocator<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0>,void ()(int)>::~__func()
{
}

void *std::__function::__func<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0,std::allocator<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = &unk_26D96F850;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0,std::allocator<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0>,void ()(int)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26D96F850;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0,std::allocator<CALog::Scope::init(unsigned long long,char const*,__CFString const*,__CFString const*,unsigned int)::$_0>,void ()(int)>::operator()(uint64_t result, int *a2)
{
  int v2 = *a2;
  uint64_t v3 = *(void *)(result + 8);
  if (*a2 >= 5) {
    int v4 = 5;
  }
  else {
    int v4 = *a2;
  }
  if ((*(_DWORD *)(v3 + 48) & 0x20) != 0) {
    int v2 = v4;
  }
  *(_DWORD *)(v3 + 8) = v2;
  return result;
}

void *std::__function::__value_func<void ()(int)>::~__value_func[abi:ne180100](void *a1)
{
  int v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t ASDDSPStreamHelper::DSPStream::DSPStream(uint64_t a1, int a2, long long *a3, uint64_t a4, void *a5)
{
  *(_DWORD *)a1 = a2;
  long long v7 = *a3;
  long long v8 = a3[1];
  *(void *)(a1 + 40) = *((void *)a3 + 4);
  *(_OWORD *)(a1 + 24) = v8;
  *(_OWORD *)(a1 + 8) = v7;
  id v9 = a5;
  *(void *)(a1 + 48) = MEMORY[0x22A63F100](a4);
  uint64_t v10 = MEMORY[0x22A63F100](v9);

  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = 0;
  return a1;
}

uint64_t ASDDSPStreamHelper::DSPStream::DSPStream(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 48) = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  *(void *)(a1 + 56) = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  *(void *)(a1 + 64) = 0;
  return a1;
}

{
  long long v4;
  long long v5;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 48) = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  *(void *)(a1 + 56) = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  *(void *)(a1 + 64) = 0;
  return a1;
}

{
  long long v4;
  long long v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 48) = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  char v6 = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  long long v7 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  *(void *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  return a1;
}

uint64_t ASDDSPStreamHelper::DSPStream::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  uint64_t v6 = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  long long v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v6;

  uint64_t v8 = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  id v9 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v8;

  uint64_t v10 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = 0;
  if (v10) {
    std::default_delete<ASDBufferList>::operator()[abi:ne180100](a1 + 64, v10);
  }
  return a1;
}

{
  long long v4;
  long long v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  long long v4 = *(_OWORD *)(a2 + 8);
  long long v5 = *(_OWORD *)(a2 + 24);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  uint64_t v6 = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  long long v7 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v6;

  uint64_t v8 = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  id v9 = *(void **)(a1 + 56);
  *(void *)(a1 + 56) = v8;

  uint64_t v10 = *(void *)(a2 + 64);
  *(void *)(a2 + 64) = 0;
  int v11 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v10;
  if (v11) {
    std::default_delete<ASDBufferList>::operator()[abi:ne180100](a1 + 64, v11);
  }
  return a1;
}

uint64_t ASDDSPStreamHelper::DSPStream::writeMix(ASDDSPStreamHelper::DSPStream *this, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3)
{
  uint64_t v4 = *((void *)this + 7);
  if (!v4) {
    return 1852797029;
  }
  uint64_t v5 = *((void *)this + 8);
  if (!v5) {
    return 1852797029;
  }
  if (*(_DWORD *)(*(void *)(v5 + 40) + 24) != 1) {
    ASDDSPStreamHelper::DSPStream::writeMix();
  }
  uint64_t v6 = *(uint64_t (**)(void))(v4 + 16);
  return v6();
}

uint64_t ASDDSPStreamHelper::DSPStream::readInput(ASDDSPStreamHelper::DSPStream *this, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3)
{
  uint64_t v4 = *((void *)this + 6);
  if (!v4) {
    return 1852797029;
  }
  uint64_t v5 = *((void *)this + 8);
  if (!v5) {
    return 1852797029;
  }
  if (*(_DWORD *)(*(void *)(v5 + 40) + 24) != 1) {
    ASDDSPStreamHelper::DSPStream::writeMix();
  }
  uint64_t v6 = *(uint64_t (**)(void))(v4 + 16);
  return v6();
}

uint64_t ASDDSPStreamHelper::DSPStream::setupIO(uint64_t a1, uint64_t a2, int a3, long long *a4)
{
  long long v4 = a4[1];
  v7[0] = *a4;
  v7[1] = v4;
  long long v5 = a4[3];
  _OWORD v7[2] = a4[2];
  void v7[3] = v5;
  return SetupGraphIOData(a2, a3, v7, *(void *)(a1 + 64));
}

uint64_t SetupGraphIOData(uint64_t a1, int a2, long long *a3, uint64_t a4)
{
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)a1 = a2;
  long long v4 = *a3;
  long long v5 = a3[1];
  long long v6 = a3[2];
  *(_OWORD *)(a1 + 56) = a3[3];
  *(_OWORD *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 24) = v5;
  *(_OWORD *)(a1 + 8) = v4;
  *(void *)(a1 + 72) = *(void *)(a4 + 40) + 24;
  unsigned int v7 = *(_DWORD *)(a4 + 24) * a2;
  uint64_t v8 = *(_DWORD **)(a4 + 40);
  unsigned int v9 = v8[4];
  if (v9) {
    BOOL v10 = v7 > v9;
  }
  else {
    BOOL v10 = 0;
  }
  uint64_t v11 = !v10;
  if (v11 == 1) {
    CABufferList::SetNumBytes(v8, v7);
  }
  return v11;
}

uint64_t ASDDSPStreamHelper::ASDDSPStreamHelper(uint64_t a1, long long *a2, const CAStreamBasicDescription *a3, uint64_t a4, int a5)
{
  long long v10 = *a2;
  long long v11 = a2[1];
  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(_OWORD *)a1 = v10;
  *(_OWORD *)(a1 + 16) = v11;
  *(void *)(a1 + 40) = CABufferList::New((CABufferList *)"", (const char *)a2, a3);
  uint64_t v12 = *((void *)a2 + 4);
  long long v13 = a2[1];
  *(_OWORD *)(a1 + 48) = *a2;
  *(_OWORD *)(a1 + 64) = v13;
  *(void *)(a1 + 80) = v12;
  *(void *)(a1 + 88) = CABufferList::New((CABufferList *)"", (const char *)a2, v14);
  long long v15 = *a2;
  long long v16 = a2[1];
  *(void *)(a1 + 128) = *((void *)a2 + 4);
  *(_OWORD *)(a1 + 96) = v15;
  *(_OWORD *)(a1 + 112) = v16;
  unsigned int v18 = CABufferList::New((CABufferList *)"", (const char *)a2, v17);
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  double v19 = (char **)(a1 + 184);
  *(void *)(a1 + 136) = v18;
  *(void *)(a1 + 144) = a4;
  *(_OWORD *)(a1 + 232) = 0u;
  *(void *)(a1 + 304) = 850045863;
  int v101 = (void **)(a1 + 256);
  int v102 = (void **)(a1 + 208);
  uint64_t v100 = (void **)(a1 + 280);
  *(void *)(a1 + 296) = 0;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 353) = 0u;
  int v21 = *(const ASDDSPStreamHelper::DSPStream **)a3;
  int v20 = (const ASDDSPStreamHelper::DSPStream *)*((void *)a3 + 1);
  if (v20 == *(const ASDDSPStreamHelper::DSPStream **)a3)
  {
    float32x4_t v96 = "underlyingStreams.size() > 0";
    int v97 = 145;
    goto LABEL_91;
  }
  if ((*((unsigned char *)a2 + 12) & 0x20) != 0)
  {
    float32x4_t v96 = "dspFormat.IsInterleaved()";
    int v97 = 146;
LABEL_91:
    __assert_rtn("ASDDSPStreamHelper", "ASDDSPStreamHelper.mm", v97, v96);
  }
  unint64_t v22 = a5 == 1768845428;
  unint64_t v23 = a5 != 1768845428;
  uint64_t v24 = "stream.mFormat.IsInterleaved()";
  do
  {
    if ((*((unsigned char *)v21 + 20) & 0x20) != 0)
    {
      int v95 = 163;
      goto LABEL_88;
    }
    int v25 = *(_DWORD *)v21;
    if (a5 == 1768845428 && v25 != 1768845428)
    {
      int v95 = 167;
      uint64_t v24 = "stream.mDirection == ASDStreamDirectionInput";
LABEL_88:
      __assert_rtn("ASDDSPStreamHelper", "ASDDSPStreamHelper.mm", v95, v24);
    }
    BOOL v26 = v25 == 1768845428;
    if (v25 == 1768845428) {
      unint64_t v27 = v23;
    }
    else {
      unint64_t v27 = v22;
    }
    if (v26) {
      unint64_t v23 = v27 + 1;
    }
    else {
      unint64_t v22 = v27 + 1;
    }
    int v21 = (const ASDDSPStreamHelper::DSPStream *)((char *)v21 + 72);
  }
  while (v21 != v20);
  if (!v23)
  {
    uint64_t v98 = "numDspGraphIn != 0";
    int v99 = 174;
    goto LABEL_94;
  }
  if (!v22)
  {
    uint64_t v98 = "numDspGraphOut != 0";
    int v99 = 175;
LABEL_94:
    __assert_rtn("ASDDSPStreamHelper", "ASDDSPStreamHelper.mm", v99, v98);
  }
  std::vector<ASDDSPStreamHelper::DSPStream>::reserve((uint64_t *)(a1 + 160), v23);
  std::vector<DSPGraph::GraphIOData>::reserve((void **)(a1 + 184), v23);
  std::vector<CAStreamBasicDescription>::reserve(v102, v23);
  std::vector<ASDDSPStreamHelper::DSPStream>::reserve((uint64_t *)(a1 + 232), v22);
  std::vector<DSPGraph::GraphIOData>::reserve(v101, v22);
  std::vector<CAStreamBasicDescription>::reserve(v100, v22);
  if (a5 == 1768845428)
  {
    unint64_t v34 = *(void *)(a1 + 288);
    unint64_t v33 = *(void *)(a1 + 296);
    if (v34 >= v33)
    {
      unint64_t v43 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v34 - (void)*v100) >> 3);
      unint64_t v44 = v43 + 1;
      if (v43 + 1 > 0x666666666666666) {
        goto LABEL_95;
      }
      unint64_t v45 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v33 - (void)*v100) >> 3);
      if (2 * v45 > v44) {
        unint64_t v44 = 2 * v45;
      }
      if (v45 >= 0x333333333333333) {
        unint64_t v46 = 0x666666666666666;
      }
      else {
        unint64_t v46 = v44;
      }
      if (v46) {
        uint64_t v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>(a1 + 296, v46);
      }
      else {
        uint64_t v47 = 0;
      }
      int v64 = &v47[40 * v43];
      int v65 = &v47[40 * v46];
      long long v66 = *a2;
      long long v67 = a2[1];
      *((void *)v64 + 4) = *((void *)a2 + 4);
      *(_OWORD *)int v64 = v66;
      *((_OWORD *)v64 + 1) = v67;
      BOOL v37 = v64 + 40;
      unsigned int v69 = *(char **)(a1 + 280);
      uint64_t v68 = *(char **)(a1 + 288);
      if (v68 != v69)
      {
        do
        {
          long long v70 = *(_OWORD *)(v68 - 40);
          long long v71 = *(_OWORD *)(v68 - 24);
          *((void *)v64 - 1) = *((void *)v68 - 1);
          *(_OWORD *)(v64 - 24) = v71;
          *(_OWORD *)(v64 - 40) = v70;
          v64 -= 40;
          v68 -= 40;
        }
        while (v68 != v69);
        uint64_t v68 = (char *)*v100;
      }
      *(void *)(a1 + 280) = v64;
      *(void *)(a1 + 288) = v37;
      *(void *)(a1 + 296) = v65;
      if (v68) {
        operator delete(v68);
      }
    }
    else
    {
      long long v35 = *a2;
      long long v36 = a2[1];
      *(void *)(v34 + 32) = *((void *)a2 + 4);
      *(_OWORD *)unint64_t v34 = v35;
      *(_OWORD *)(v34 + 16) = v36;
      BOOL v37 = (char *)(v34 + 40);
    }
    *(void *)(a1 + 288) = v37;
    float32x4_t v72 = *(char **)(a1 + 264);
    unint64_t v73 = *(void *)(a1 + 272);
    if ((unint64_t)v72 >= v73)
    {
      unint64_t v75 = 0xCCCCCCCCCCCCCCCDLL * ((v72 - (unsigned char *)*v101) >> 4);
      unint64_t v76 = v75 + 1;
      if (v75 + 1 > 0x333333333333333) {
        std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v77 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v73 - (void)*v101) >> 4);
      if (2 * v77 > v76) {
        unint64_t v76 = 2 * v77;
      }
      if (v77 >= 0x199999999999999) {
        unint64_t v78 = 0x333333333333333;
      }
      else {
        unint64_t v78 = v76;
      }
      if (v78) {
        long long v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>(a1 + 272, v78);
      }
      else {
        long long v79 = 0;
      }
      long long v87 = &v79[80 * v75];
      long long v88 = &v79[80 * v78];
      float32x4_t v74 = v87 + 80;
      *((_OWORD *)v87 + 3) = 0u;
      *((_OWORD *)v87 + 4) = 0u;
      *((_OWORD *)v87 + 1) = 0u;
      *((_OWORD *)v87 + 2) = 0u;
      *(_OWORD *)long long v87 = 0u;
      uint64_t v90 = *(char **)(a1 + 256);
      long long v89 = *(char **)(a1 + 264);
      if (v89 != v90)
      {
        do
        {
          *((_OWORD *)v87 - 5) = *((_OWORD *)v89 - 5);
          long long v91 = *((_OWORD *)v89 - 4);
          long long v92 = *((_OWORD *)v89 - 3);
          long long v93 = *((_OWORD *)v89 - 1);
          *((_OWORD *)v87 - 2) = *((_OWORD *)v89 - 2);
          *((_OWORD *)v87 - 1) = v93;
          *((_OWORD *)v87 - 4) = v91;
          *((_OWORD *)v87 - 3) = v92;
          v87 -= 80;
          v89 -= 80;
        }
        while (v89 != v90);
        long long v89 = (char *)*v101;
      }
      *(void *)(a1 + 256) = v87;
      *(void *)(a1 + 264) = v74;
      *(void *)(a1 + 272) = v88;
      if (v89) {
        operator delete(v89);
      }
    }
    else
    {
      *((_OWORD *)v72 + 3) = 0u;
      *((_OWORD *)v72 + 4) = 0u;
      float32x4_t v74 = v72 + 80;
      *((_OWORD *)v72 + 1) = 0u;
      *((_OWORD *)v72 + 2) = 0u;
      *(_OWORD *)float32x4_t v72 = 0u;
    }
    *(void *)(a1 + 264) = v74;
    goto LABEL_83;
  }
  unint64_t v28 = *(void *)(a1 + 224);
  unint64_t v29 = *(void *)(a1 + 216);
  if (v29 < v28)
  {
    long long v30 = *a2;
    long long v31 = a2[1];
    *(void *)(v29 + 32) = *((void *)a2 + 4);
    *(_OWORD *)unint64_t v29 = v30;
    *(_OWORD *)(v29 + 16) = v31;
    size_t v32 = (char *)(v29 + 40);
    goto LABEL_43;
  }
  unint64_t v38 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v29 - (void)*v102) >> 3);
  unint64_t v39 = v38 + 1;
  if (v38 + 1 > 0x666666666666666) {
LABEL_95:
  }
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  unint64_t v40 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v28 - (void)*v102) >> 3);
  if (2 * v40 > v39) {
    unint64_t v39 = 2 * v40;
  }
  if (v40 >= 0x333333333333333) {
    unint64_t v41 = 0x666666666666666;
  }
  else {
    unint64_t v41 = v39;
  }
  if (v41) {
    size_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>(a1 + 224, v41);
  }
  else {
    size_t v42 = 0;
  }
  int v48 = &v42[40 * v38];
  uint64_t v49 = &v42[40 * v41];
  long long v50 = *a2;
  long long v51 = a2[1];
  *((void *)v48 + 4) = *((void *)a2 + 4);
  *(_OWORD *)int v48 = v50;
  *((_OWORD *)v48 + 1) = v51;
  size_t v32 = v48 + 40;
  float32x4_t v53 = *(char **)(a1 + 208);
  float32x4_t v52 = *(char **)(a1 + 216);
  if (v52 != v53)
  {
    do
    {
      long long v54 = *(_OWORD *)(v52 - 40);
      long long v55 = *(_OWORD *)(v52 - 24);
      *((void *)v48 - 1) = *((void *)v52 - 1);
      *(_OWORD *)(v48 - 24) = v55;
      *(_OWORD *)(v48 - 40) = v54;
      v48 -= 40;
      v52 -= 40;
    }
    while (v52 != v53);
    float32x4_t v52 = (char *)*v102;
  }
  *(void *)(a1 + 208) = v48;
  *(void *)(a1 + 216) = v32;
  *(void *)(a1 + 224) = v49;
  if (v52) {
    operator delete(v52);
  }
LABEL_43:
  unint64_t v56 = *(void *)(a1 + 200);
  *(void *)(a1 + 216) = v32;
  CFStringRef v57 = *(_OWORD **)(a1 + 192);
  if ((unint64_t)v57 >= v56)
  {
    unint64_t v59 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v57 - *v19) >> 4);
    unint64_t v60 = v59 + 1;
    if (v59 + 1 > 0x333333333333333) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v61 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v56 - (void)*v19) >> 4);
    if (2 * v61 > v60) {
      unint64_t v60 = 2 * v61;
    }
    if (v61 >= 0x199999999999999) {
      unint64_t v62 = 0x333333333333333;
    }
    else {
      unint64_t v62 = v60;
    }
    if (v62) {
      int v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>(a1 + 200, v62);
    }
    else {
      int v63 = 0;
    }
    long long v80 = &v63[80 * v59];
    long long v81 = &v63[80 * v62];
    int v58 = v80 + 80;
    *((_OWORD *)v80 + 3) = 0u;
    *((_OWORD *)v80 + 4) = 0u;
    *((_OWORD *)v80 + 1) = 0u;
    *((_OWORD *)v80 + 2) = 0u;
    *(_OWORD *)long long v80 = 0u;
    long long v83 = *(char **)(a1 + 184);
    float32x4_t v82 = *(char **)(a1 + 192);
    if (v82 != v83)
    {
      do
      {
        *((_OWORD *)v80 - 5) = *((_OWORD *)v82 - 5);
        long long v84 = *((_OWORD *)v82 - 4);
        long long v85 = *((_OWORD *)v82 - 3);
        long long v86 = *((_OWORD *)v82 - 1);
        *((_OWORD *)v80 - 2) = *((_OWORD *)v82 - 2);
        *((_OWORD *)v80 - 1) = v86;
        *((_OWORD *)v80 - 4) = v84;
        *((_OWORD *)v80 - 3) = v85;
        v80 -= 80;
        v82 -= 80;
      }
      while (v82 != v83);
      float32x4_t v82 = *v19;
    }
    *(void *)(a1 + 184) = v80;
    *(void *)(a1 + 192) = v58;
    *(void *)(a1 + 200) = v81;
    if (v82) {
      operator delete(v82);
    }
  }
  else
  {
    v57[3] = 0u;
    v57[4] = 0u;
    int v58 = v57 + 5;
    v57[1] = 0u;
    v57[2] = 0u;
    *CFStringRef v57 = 0u;
  }
  *(void *)(a1 + 192) = v58;
LABEL_83:
  if (*(void *)a3 != *((void *)a3 + 1)) {
    ASDDSPStreamHelper::addStream((ASDDSPStreamHelper *)a1, *(const ASDDSPStreamHelper::DSPStream **)a3);
  }
  return a1;
}

void sub_225D25AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **a11, void **a12, void **a13, uint64_t a14)
{
  std::mutex::~mutex(v17);
  double v19 = *a11;
  if (*a11)
  {
    v15[36] = v19;
    operator delete(v19);
  }
  int v20 = *a12;
  if (*a12)
  {
    v15[33] = v20;
    operator delete(v20);
  }
  a14 = a10;
  std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100]((void ***)&a14);
  int v21 = *a13;
  if (*a13)
  {
    v15[27] = v21;
    operator delete(v21);
  }
  unint64_t v22 = (void **)(v15 + 17);
  unint64_t v23 = *v16;
  if (*v16)
  {
    v15[24] = v23;
    operator delete(v23);
  }
  a14 = a9;
  std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100]((void ***)&a14);
  uint64_t v24 = *v22;
  *unint64_t v22 = 0;
  if (v24) {
    std::default_delete<CABufferList>::operator()[abi:ne180100](v15 + 136, v24);
  }
  int v25 = *(void **)(v14 + 48);
  *(void *)(v14 + 48) = 0;
  if (v25) {
    std::default_delete<CABufferList>::operator()[abi:ne180100](v14 + 48, v25);
  }
  BOOL v26 = *(void **)v14;
  *(void *)uint64_t v14 = 0;
  if (v26) {
    std::default_delete<CABufferList>::operator()[abi:ne180100](v14, v26);
  }
  _Unwind_Resume(a1);
}

uint64_t std::vector<ASDDSPStreamHelper::DSPStream>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0x8E38E38E38E38E39 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x38E38E38E38E38FLL) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = a1[1] - *a1;
    long long v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<ASDDSPStreamHelper::DSPStream>>(result, a2);
    v7[1] = v7[0] + v5;
    _OWORD v7[2] = v7[0] + v5;
    void v7[3] = v7[0] + 72 * v6;
    std::vector<ASDDSPStreamHelper::DSPStream>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<ASDDSPStreamHelper::DSPStream>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_225D25C30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ASDDSPStreamHelper::DSPStream>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<DSPGraph::GraphIOData>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 4) < a2)
  {
    if (a2 >= 0x333333333333334) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 80;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>(v3, a2);
    unsigned int v7 = &v6[80 * v5];
    unsigned int v9 = &v6[80 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 5) = *((_OWORD *)v10 - 5);
        long long v13 = *((_OWORD *)v10 - 4);
        long long v14 = *((_OWORD *)v10 - 3);
        long long v15 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v15;
        *((_OWORD *)v12 - 4) = v13;
        *((_OWORD *)v12 - 3) = v14;
        v12 -= 80;
        v10 -= 80;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<CAStreamBasicDescription>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 40;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>(v3, a2);
    unsigned int v7 = &v6[40 * v5];
    unsigned int v9 = &v6[40 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 40);
        long long v14 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void ASDDSPStreamHelper::addStream(ASDDSPStreamHelper *this, const ASDDSPStreamHelper::DSPStream *a2)
{
  uint64_t v4 = (char *)a2 + 8;
  if (*(_DWORD *)a2 == 1768845428)
  {
    uint64_t v5 = (char *)this + 224;
    unint64_t v6 = *((void *)this + 28);
    unint64_t v7 = *((void *)this + 27);
    if (v7 < v6)
    {
      long long v8 = *(_OWORD *)v4;
      long long v9 = *(_OWORD *)((char *)a2 + 24);
      *(void *)(v7 + 32) = *((void *)a2 + 5);
      *(_OWORD *)unint64_t v7 = v8;
      *(_OWORD *)(v7 + 16) = v9;
      long long v10 = (char *)(v7 + 40);
LABEL_28:
      unint64_t v37 = *((void *)this + 25);
      *((void *)this + 27) = v10;
      unint64_t v38 = (_OWORD *)*((void *)this + 24);
      if ((unint64_t)v38 < v37)
      {
        v38[3] = 0u;
        v38[4] = 0u;
        unint64_t v39 = v38 + 5;
        v38[1] = 0u;
        v38[2] = 0u;
        _OWORD *v38 = 0u;
        goto LABEL_60;
      }
      uint64_t v40 = *((void *)this + 23);
      unint64_t v41 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v38 - v40) >> 4);
      unint64_t v42 = v41 + 1;
      if (v41 + 1 <= 0x333333333333333)
      {
        unint64_t v43 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v37 - v40) >> 4);
        if (2 * v43 > v42) {
          unint64_t v42 = 2 * v43;
        }
        if (v43 >= 0x199999999999999) {
          unint64_t v44 = 0x333333333333333;
        }
        else {
          unint64_t v44 = v42;
        }
        if (v44) {
          unint64_t v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>((uint64_t)this + 200, v44);
        }
        else {
          unint64_t v45 = 0;
        }
        int v63 = &v45[80 * v41];
        int v64 = &v45[80 * v44];
        unint64_t v39 = v63 + 80;
        *((_OWORD *)v63 + 3) = 0u;
        *((_OWORD *)v63 + 4) = 0u;
        *((_OWORD *)v63 + 1) = 0u;
        *((_OWORD *)v63 + 2) = 0u;
        *(_OWORD *)int v63 = 0u;
        long long v66 = (char *)*((void *)this + 23);
        int v65 = (char *)*((void *)this + 24);
        if (v65 != v66)
        {
          do
          {
            *((_OWORD *)v63 - 5) = *((_OWORD *)v65 - 5);
            long long v67 = *((_OWORD *)v65 - 4);
            long long v68 = *((_OWORD *)v65 - 3);
            long long v69 = *((_OWORD *)v65 - 1);
            *((_OWORD *)v63 - 2) = *((_OWORD *)v65 - 2);
            *((_OWORD *)v63 - 1) = v69;
            *((_OWORD *)v63 - 4) = v67;
            *((_OWORD *)v63 - 3) = v68;
            v63 -= 80;
            v65 -= 80;
          }
          while (v65 != v66);
          int v65 = (char *)*((void *)this + 23);
        }
        *((void *)this + 23) = v63;
        *((void *)this + 24) = v39;
        *((void *)this + 25) = v64;
        if (v65) {
          operator delete(v65);
        }
LABEL_60:
        *((void *)this + 24) = v39;
        long long v70 = (uint64_t *)((char *)this + 160);
        unint64_t v71 = *((void *)this + 21);
        if (v71 >= *((void *)this + 22))
        {
          uint64_t v72 = std::vector<ASDDSPStreamHelper::DSPStream>::__emplace_back_slow_path<ASDDSPStreamHelper::DSPStream const&>(v70, (uint64_t)a2);
        }
        else
        {
          std::vector<ASDDSPStreamHelper::DSPStream>::__construct_one_at_end[abi:ne180100]<ASDDSPStreamHelper::DSPStream const&>((uint64_t)v70, (uint64_t)a2);
          uint64_t v72 = v71 + 72;
        }
        *((void *)this + 21) = v72;
        operator new();
      }
LABEL_75:
      std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = *((void *)this + 26);
    unint64_t v17 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v7 - v16) >> 3);
    unint64_t v18 = v17 + 1;
    if (v17 + 1 <= 0x666666666666666)
    {
      unint64_t v19 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v6 - v16) >> 3);
      if (2 * v19 > v18) {
        unint64_t v18 = 2 * v19;
      }
      if (v19 >= 0x333333333333333) {
        unint64_t v20 = 0x666666666666666;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20) {
        int v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>((uint64_t)v5, v20);
      }
      else {
        int v21 = 0;
      }
      unint64_t v29 = &v21[40 * v17];
      long long v30 = &v21[40 * v20];
      long long v31 = *(_OWORD *)v4;
      long long v32 = *((_OWORD *)v4 + 1);
      *((void *)v29 + 4) = *((void *)v4 + 4);
      *(_OWORD *)unint64_t v29 = v31;
      *((_OWORD *)v29 + 1) = v32;
      long long v10 = v29 + 40;
      unint64_t v34 = (char *)*((void *)this + 26);
      unint64_t v33 = (char *)*((void *)this + 27);
      if (v33 != v34)
      {
        do
        {
          long long v35 = *(_OWORD *)(v33 - 40);
          long long v36 = *(_OWORD *)(v33 - 24);
          *((void *)v29 - 1) = *((void *)v33 - 1);
          *(_OWORD *)(v29 - 24) = v36;
          *(_OWORD *)(v29 - 40) = v35;
          v29 -= 40;
          v33 -= 40;
        }
        while (v33 != v34);
        unint64_t v33 = (char *)*((void *)this + 26);
      }
      *((void *)this + 26) = v29;
      *((void *)this + 27) = v10;
      *((void *)this + 28) = v30;
      if (v33) {
        operator delete(v33);
      }
      goto LABEL_28;
    }
LABEL_74:
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v11 = *((void *)this + 36);
  unint64_t v12 = *((void *)this + 37);
  if (v11 >= v12)
  {
    unint64_t v22 = (void **)((char *)this + 280);
    uint64_t v23 = *((void *)this + 35);
    unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v23) >> 3);
    unint64_t v25 = v24 + 1;
    if (v24 + 1 > 0x666666666666666) {
      goto LABEL_74;
    }
    unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - v23) >> 3);
    if (2 * v26 > v25) {
      unint64_t v25 = 2 * v26;
    }
    if (v26 >= 0x333333333333333) {
      unint64_t v27 = 0x666666666666666;
    }
    else {
      unint64_t v27 = v25;
    }
    if (v27) {
      unint64_t v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CAStreamBasicDescription>>((uint64_t)this + 296, v27);
    }
    else {
      unint64_t v28 = 0;
    }
    unint64_t v46 = &v28[40 * v24];
    uint64_t v47 = &v28[40 * v27];
    long long v48 = *(_OWORD *)v4;
    long long v49 = *((_OWORD *)v4 + 1);
    *((void *)v46 + 4) = *((void *)v4 + 4);
    *(_OWORD *)unint64_t v46 = v48;
    *((_OWORD *)v46 + 1) = v49;
    long long v15 = v46 + 40;
    long long v51 = (char *)*((void *)this + 35);
    long long v50 = (char *)*((void *)this + 36);
    if (v50 != v51)
    {
      do
      {
        long long v52 = *(_OWORD *)(v50 - 40);
        long long v53 = *(_OWORD *)(v50 - 24);
        *((void *)v46 - 1) = *((void *)v50 - 1);
        *(_OWORD *)(v46 - 24) = v53;
        *(_OWORD *)(v46 - 40) = v52;
        v46 -= 40;
        v50 -= 40;
      }
      while (v50 != v51);
      long long v50 = (char *)*v22;
    }
    *((void *)this + 35) = v46;
    *((void *)this + 36) = v15;
    *((void *)this + 37) = v47;
    if (v50) {
      operator delete(v50);
    }
  }
  else
  {
    long long v13 = *(_OWORD *)v4;
    long long v14 = *(_OWORD *)((char *)a2 + 24);
    *(void *)(v11 + 32) = *((void *)a2 + 5);
    *(_OWORD *)unint64_t v11 = v13;
    *(_OWORD *)(v11 + 16) = v14;
    long long v15 = (char *)(v11 + 40);
  }
  *((void *)this + 36) = v15;
  long long v54 = (_OWORD *)*((void *)this + 33);
  unint64_t v55 = *((void *)this + 34);
  if ((unint64_t)v54 >= v55)
  {
    uint64_t v57 = *((void *)this + 32);
    unint64_t v58 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v54 - v57) >> 4);
    unint64_t v59 = v58 + 1;
    if (v58 + 1 > 0x333333333333333) {
      goto LABEL_75;
    }
    unint64_t v60 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v55 - v57) >> 4);
    if (2 * v60 > v59) {
      unint64_t v59 = 2 * v60;
    }
    if (v60 >= 0x199999999999999) {
      unint64_t v61 = 0x333333333333333;
    }
    else {
      unint64_t v61 = v59;
    }
    if (v61) {
      unint64_t v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DSPGraph::GraphIOData>>((uint64_t)this + 272, v61);
    }
    else {
      unint64_t v62 = 0;
    }
    unint64_t v73 = &v62[80 * v58];
    float32x4_t v74 = &v62[80 * v61];
    unint64_t v56 = v73 + 80;
    *((_OWORD *)v73 + 3) = 0u;
    *((_OWORD *)v73 + 4) = 0u;
    *((_OWORD *)v73 + 1) = 0u;
    *((_OWORD *)v73 + 2) = 0u;
    *(_OWORD *)unint64_t v73 = 0u;
    unint64_t v76 = (char *)*((void *)this + 32);
    unint64_t v75 = (char *)*((void *)this + 33);
    if (v75 != v76)
    {
      do
      {
        *((_OWORD *)v73 - 5) = *((_OWORD *)v75 - 5);
        long long v77 = *((_OWORD *)v75 - 4);
        long long v78 = *((_OWORD *)v75 - 3);
        long long v79 = *((_OWORD *)v75 - 1);
        *((_OWORD *)v73 - 2) = *((_OWORD *)v75 - 2);
        *((_OWORD *)v73 - 1) = v79;
        *((_OWORD *)v73 - 4) = v77;
        *((_OWORD *)v73 - 3) = v78;
        v73 -= 80;
        v75 -= 80;
      }
      while (v75 != v76);
      unint64_t v75 = (char *)*((void *)this + 32);
    }
    *((void *)this + 32) = v73;
    *((void *)this + 33) = v56;
    *((void *)this + 34) = v74;
    if (v75) {
      operator delete(v75);
    }
  }
  else
  {
    v54[3] = 0u;
    v54[4] = 0u;
    unint64_t v56 = v54 + 5;
    v54[1] = 0u;
    v54[2] = 0u;
    *long long v54 = 0u;
  }
  *((void *)this + 33) = v56;
  long long v80 = (uint64_t *)((char *)this + 232);
  unint64_t v81 = *((void *)this + 30);
  if (v81 >= *((void *)this + 31))
  {
    uint64_t v82 = std::vector<ASDDSPStreamHelper::DSPStream>::__emplace_back_slow_path<ASDDSPStreamHelper::DSPStream const&>(v80, (uint64_t)a2);
  }
  else
  {
    std::vector<ASDDSPStreamHelper::DSPStream>::__construct_one_at_end[abi:ne180100]<ASDDSPStreamHelper::DSPStream const&>((uint64_t)v80, (uint64_t)a2);
    uint64_t v82 = v81 + 72;
  }
  *((void *)this + 30) = v82;
  operator new();
}

void sub_225D263A8(_Unwind_Exception *a1)
{
  MEMORY[0x22A63EB50](v1, 0x1020C40148D8B47);
  _Unwind_Resume(a1);
}

uint64_t ASDDSPStreamHelper::allocateStreamingResources(ASDDSPStreamHelper *this, int a2)
{
  uint64_t result = CABufferList::AllocateBuffers(*((void *)this + 5), *((_DWORD *)this + 6) * a2);
  uint64_t v5 = *((void *)this + 20);
  uint64_t v6 = *((void *)this + 21);
  while (v5 != v6)
  {
    uint64_t result = CABufferList::AllocateBuffers(*(void *)(*(void *)(v5 + 64) + 40), *(_DWORD *)(*(void *)(v5 + 64) + 24) * a2);
    v5 += 72;
  }
  uint64_t v8 = *((void *)this + 29);
  uint64_t v7 = *((void *)this + 30);
  while (v8 != v7)
  {
    uint64_t result = CABufferList::AllocateBuffers(*(void *)(*(void *)(v8 + 64) + 40), *(_DWORD *)(*(void *)(v8 + 64) + 24) * a2);
    v8 += 72;
  }
  return result;
}

uint64_t ASDDSPStreamHelper::deallocateStreamingResources(ASDDSPStreamHelper *this)
{
  uint64_t result = CABufferList::DeallocateBuffers(*((CABufferList **)this + 5));
  uint64_t v3 = *((void *)this + 20);
  uint64_t v4 = *((void *)this + 21);
  while (v3 != v4)
  {
    uint64_t result = CABufferList::DeallocateBuffers(*(CABufferList **)(*(void *)(v3 + 64) + 40));
    v3 += 72;
  }
  uint64_t v6 = *((void *)this + 29);
  uint64_t v5 = *((void *)this + 30);
  while (v6 != v5)
  {
    uint64_t result = CABufferList::DeallocateBuffers(*(CABufferList **)(*(void *)(v6 + 64) + 40));
    v6 += 72;
  }
  return result;
}

uint64_t ASDDSPStreamHelper::dspInStreamFormats(ASDDSPStreamHelper *this)
{
  return (uint64_t)this + 208;
}

uint64_t ASDDSPStreamHelper::dspOutStreamFormats(ASDDSPStreamHelper *this)
{
  return (uint64_t)this + 280;
}

uint64_t ASDDSPStreamHelper::readInput(ASDDSPStreamHelper *this, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a3)
    {
      long long v9 = (std::mutex *)((char *)this + 304);
      if (std::mutex::try_lock((std::mutex *)((char *)this + 304)))
      {
        __dst = a4;
        long long v79 = v9;
        unsigned int v80 = a2;
        uint64_t v10 = 1970171760;
        unint64_t v11 = (CAStreamBasicDescription **)*((void *)this + 20);
        unint64_t v12 = (CAStreamBasicDescription **)*((void *)this + 21);
        if (v11 != v12)
        {
          uint64_t v13 = 0;
          uint64_t v14 = -1;
          while (1)
          {
            CAStreamBasicDescription::BytesToFrames(v11[8]);
            if (v15 < v80)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                *(void *)&uint8_t buf[4] = "ioBufferFrameSize > inStream.mBufferList->capacityFrames()";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDD"
                                      "SPStreamHelper.mm";
                *(_WORD *)&buf[22] = 1024;
                *(_DWORD *)&buf[24] = 284;
                _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
              {
                CAStreamBasicDescription::BytesToFrames(v11[8]);
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&uint8_t buf[4] = v80;
                *(_WORD *)&buf[8] = 1024;
                *(_DWORD *)&buf[10] = v55;
                _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ioBufferFrameSize %d passed to DSP readInput exceeds ringbuffer capacity %d\n", buf, 0xEu);
              }
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
              {
                CAStreamBasicDescription::BytesToFrames(v11[8]);
                ASDDSPStreamHelper::readInput((uint64_t)buf, v80, v56);
              }
              goto LABEL_56;
            }
            uint64_t v16 = *((void *)this + 23);
            if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 24) - v16) >> 4) <= ++v14) {
              std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
            }
            long long v17 = *(_OWORD *)&a3->mInputTime.mRateScalar;
            *(_OWORD *)buf = *(_OWORD *)&a3->mInputTime.mSampleTime;
            *(_OWORD *)&buf[16] = v17;
            long long v18 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mHours;
            long long v83 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mSubframes;
            long long v84 = v18;
            if ((SetupGraphIOData(v16 + v13, v80, (long long *)buf, (uint64_t)v11[8]) & 1) == 0)
            {
              BOOL v57 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v57) {
                ASDDSPStreamHelper::readInput(v57, v58, v59, v60, v61, v62, v63, v64);
              }
LABEL_56:
              uint64_t Input = v10;
              goto LABEL_61;
            }
            uint64_t Input = ASDDSPStreamHelper::DSPStream::readInput((ASDDSPStreamHelper::DSPStream *)v11, v80, a3);
            if (Input) {
              break;
            }
            uint64_t v10 = 0;
            v13 += 80;
            v11 += 9;
            if (v11 == v12) {
              goto LABEL_26;
            }
          }
          BOOL v65 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v65) {
            ASDDSPStreamHelper::readInput(v65, v66, v67, v68, v69, v70, v71, v72);
          }
          goto LABEL_61;
        }
        uint64_t Input = 1970171760;
LABEL_26:
        uint64_t v36 = *((void *)this + 32);
        if (*((void *)this + 33) == v36) {
          std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
        }
        long long v37 = *(_OWORD *)&a3->mInputTime.mRateScalar;
        v81[0] = *(_OWORD *)&a3->mInputTime.mSampleTime;
        v81[1] = v37;
        long long v38 = *(_OWORD *)&a3->mInputTime.mSMPTETime.mHours;
        v81[2] = *(_OWORD *)&a3->mInputTime.mSMPTETime.mSubframes;
        v81[3] = v38;
        if ((SetupGraphIOData(v36, v80, v81, (uint64_t)this) & 1) == 0)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&uint8_t buf[4] = "!setupGraphIO";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 295;
            _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to setup Graph output buffer for DSP readInput\n", buf, 2u);
          }
          BOOL v47 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
          if (v47) {
            ASDDSPStreamHelper::readInput(v47, v48, v49, v50, v51, v52, v53, v54);
          }
          goto LABEL_61;
        }
        uint64_t v39 = *((void *)this + 18);
        atomic_fetch_add((atomic_uint *volatile)(v39 + 48), 1u);
        uint64_t v40 = atomic_load((unint64_t *)(v39 + 40));
        if (!v40
          || (caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v40, -1), (unint64_t v42 = (atomic_uint *)v41) == 0))
        {
          atomic_fetch_add((atomic_uint *volatile)(v39 + 48), 0xFFFFFFFF);
          __assert_rtn("readInput", "ASDDSPStreamHelper.mm", 302, "graphHelper");
        }
        atomic_fetch_add((atomic_uint *volatile)v41, 1u);
        unint64_t v43 = *(ASDDSPGraphHelper **)(v41 + 16);
        atomic_fetch_add((atomic_uint *volatile)(v39 + 48), 0xFFFFFFFF);
        if (v43)
        {
          if (*((void *)this + 24) == *((void *)this + 23)) {
            goto LABEL_68;
          }
          kdebug_trace();
          if (*((void *)v43 + 2))
          {
            DSPGraph::Graph::preflight();
            if (*((void *)v43 + 2))
            {
              DSPGraph::Graph::processMultiple();
              ASDDSPStreamHelper::validateGraphAudio(this, v43, *((const CAStreamBasicDescription **)this + 26), *((const CAStreamBasicDescription **)this + 35));
              if (*((void *)this + 24) != *((void *)this + 23))
              {
                kdebug_trace();
                unsigned int v44 = *((_DWORD *)this + 6) * v80;
                if (v44 <= *(_DWORD *)(*((void *)this + 5) + 36))
                {
                  ASDBufferList::copyDataFromBufferList((ASDBufferList *)this, __dst, v80);
                  uint64_t Input = 0;
                }
                else
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    *(void *)&uint8_t buf[4] = "numBytes > mDSPBL.dataSize()";
                    *(_WORD *)&buf[12] = 2080;
                    *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/"
                                          "ASDDSPStreamHelper.mm";
                    *(_WORD *)&buf[22] = 1024;
                    *(_DWORD *)&buf[24] = 314;
                    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
                  }
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    int v45 = *(_DWORD *)(*((void *)this + 5) + 36);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)&uint8_t buf[4] = v44;
                    *(_WORD *)&buf[8] = 1024;
                    *(_DWORD *)&buf[10] = v45;
                    _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "numBytes %d passed to DSP readInput exceeds ringbuffer data size %d\n", buf, 0xEu);
                  }
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
                    ASDDSPStreamHelper::readInput((uint64_t)this + 40, v44, v46);
                  }
                }
                atomic_fetch_add(v42, 0xFFFFFFFF);
LABEL_61:
                std::mutex::unlock(v79);
                return Input;
              }
LABEL_68:
              std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
            }
          }
          float32x4_t v74 = "mFormatMatchedGraph";
          int v75 = 38;
          unint64_t v76 = "ASDDSPGraphHelper.h";
          long long v77 = "graphToProcess";
        }
        else
        {
          float32x4_t v74 = "*graphHelper";
          int v75 = 303;
          unint64_t v76 = "ASDDSPStreamHelper.mm";
          long long v77 = "readInput";
        }
        __assert_rtn(v77, v76, v75, v74);
      }
      bzero(a4, *((_DWORD *)this + 6) * a2);
      return 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "NULL == ioCycleInfo";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 272;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioCycleInfo passed to DSP readInput\n", buf, 2u);
      }
      uint64_t Input = 1970171760;
      BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      if (v28) {
        ASDDSPStreamHelper::readInput(v28, v29, v30, v31, v32, v33, v34, v35);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "NULL == ioMainBuffer";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 271;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioMainBuffer passed to DSP readInput\n", buf, 2u);
    }
    uint64_t Input = 1970171760;
    BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v20) {
      ASDDSPStreamHelper::readInput(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  return Input;
}

void sub_225D26D60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::mutex *a11)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  std::mutex::unlock(a11);
  if (a2 == 4)
  {
    __cxa_begin_catch(exception_object);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ASDDSPStreamHelper::readInput();
    }
    goto LABEL_5;
  }
  if (a2 == 3)
  {
    __cxa_begin_catch(exception_object);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
  }
  else
  {
    __cxa_begin_catch(exception_object);
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (a2 != 2)
    {
      if (v13) {
        ASDDSPStreamHelper::readInput(v13, v14, v15, v16, v17, v18, v19, v20);
      }
LABEL_5:
      __cxa_end_catch();
      JUMPOUT(0x225D26C80);
    }
    if (!v13) {
      goto LABEL_5;
    }
  }
  ASDSRCStreamHelper::readInput();
  goto LABEL_5;
}

ASDDSPStreamHelper *ASDDSPStreamHelper::validateGraphAudio(ASDDSPStreamHelper *this, ASDDSPGraphHelper *a2, const CAStreamBasicDescription *a3, const CAStreamBasicDescription *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((void *)this + 19))
  {
    uint64_t v6 = this;
    uint64_t v18 = this;
    uint64_t v7 = *((void *)this + 23);
    uint64_t v8 = *((void *)this + 24);
    if (v7 == v8)
    {
      int v11 = 0;
    }
    else
    {
      int v10 = 0;
      while (1)
      {
        this = (ASDDSPStreamHelper *)ASDDSPStreamHelper::validateGraphAudio(ASDDSPGraphHelper *,CAStreamBasicDescription const*,CAStreamBasicDescription const*)::$_0::operator()<DSPGraph::GraphIOData>((uint64_t)&v18, v7, (uint64_t)a3);
        int v11 = (int)this;
        if (this) {
          break;
        }
        ++v10;
        v7 += 80;
        if (v7 == v8)
        {
          int v11 = 0;
          break;
        }
      }
    }
    uint64_t v12 = *((void *)v6 + 32);
    uint64_t v13 = *((void *)v6 + 33);
    if (v12 == v13)
    {
      if (!v11) {
        return this;
      }
LABEL_15:
      int v15 = 0;
    }
    else
    {
      int v14 = 0;
      while (1)
      {
        this = (ASDDSPStreamHelper *)ASDDSPStreamHelper::validateGraphAudio(ASDDSPGraphHelper *,CAStreamBasicDescription const*,CAStreamBasicDescription const*)::$_0::operator()<DSPGraph::GraphIOData>((uint64_t)&v18, v12, (uint64_t)a4);
        int v15 = (int)this;
        if (this) {
          break;
        }
        ++v14;
        v12 += 80;
        if (v12 == v13)
        {
          if (v11) {
            goto LABEL_15;
          }
          return this;
        }
      }
    }
    __s[0] = 0;
    if (v11)
    {
      if (v11 != 1 && v11 != 2) {
        ASDDSPStreamHelper::validateGraphAudio();
      }
      snprintf(__s, 0x100uLL, "input stream[%u] ABL[%u] channel[%u] (%s)");
    }
    else if (v15)
    {
      size_t v16 = strlen(__s);
      if (v16) {
        strcat(__s, " and ");
      }
      if (v15 != 1 && v15 != 2) {
        ASDDSPStreamHelper::validateGraphAudio();
      }
      snprintf(&__s[v16], 256 - v16, "output stream[%u] ABL[%u] channel[%u] (%s)");
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ASDDSPStreamHelper::validateGraphAudio();
    }
    uint64_t v17 = (DSPGraph::Graph *)*((void *)a2 + 2);
    if (!v17) {
      ASDDSPStreamHelper::validateGraphAudio();
    }
    return (ASDDSPStreamHelper *)DSPGraph::Graph::reset(v17);
  }
  return this;
}

void *ASDBufferList::copyDataFromBufferList(ASDBufferList *this, void *__dst, int a3)
{
  if (!__dst) {
    ASDBufferList::copyDataFromBufferList();
  }
  uint64_t v3 = *((void *)this + 5);
  if (*(_DWORD *)(v3 + 24) != 1) {
    ASDBufferList::copyDataFromBufferList();
  }
  size_t v4 = (*((_DWORD *)this + 6) * a3);
  if (v4 > *(_DWORD *)(v3 + 36)) {
    ASDBufferList::copyDataFromBufferList();
  }
  uint64_t v6 = *(const void **)(v3 + 40);
  return memcpy(__dst, v6, v4);
}

uint64_t ASDDSPStreamHelper::processOutput(ASDDSPStreamHelper *this, int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, unsigned int a6)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  if (a4)
  {
    if (a3)
    {
      if (a5)
      {
        uint64_t v12 = (std::mutex *)((char *)this + 304);
        if (!std::mutex::try_lock((std::mutex *)((char *)this + 304))) {
          return 0;
        }
        uint64_t v13 = *((void *)this + 18);
        int v14 = (atomic_uint *)(v13 + 48);
        atomic_fetch_add((atomic_uint *volatile)(v13 + 48), 1u);
        uint64_t v15 = atomic_load((unint64_t *)(v13 + 40));
        if (v15)
        {
          caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v15, a6);
          uint64_t v17 = (atomic_uint *)v16;
          if (v16)
          {
            atomic_fetch_add((atomic_uint *volatile)v16, 1u);
            uint64_t v18 = *(ASDDSPGraphHelper **)(v16 + 16);
            atomic_fetch_add((atomic_uint *volatile)(v13 + 48), 0xFFFFFFFF);
            if (v18)
            {
              ASDBufferList::setBufferListFromData((ASDBufferList *)((char *)this + 48), a4, a2);
              ASDBufferList::setBufferListFromData((ASDBufferList *)((char *)this + 96), a5, a2);
              long long v19 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
              *(_OWORD *)BOOL v57 = *(_OWORD *)&a3->mOutputTime.mSampleTime;
              *(_OWORD *)&v57[16] = v19;
              long long v20 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
              long long v58 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
              long long v59 = v20;
              uint64_t v21 = *((void *)this + 23);
              if (*((void *)this + 24) == v21) {
                std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
              }
              uint64_t v22 = *((void *)this + 11) + 24;
              *(_DWORD *)uint64_t v21 = a2;
              *(_DWORD *)(v21 + 4) = 0;
              *(_OWORD *)(v21 + 8) = *(_OWORD *)v57;
              *(_OWORD *)(v21 + 24) = *(_OWORD *)&v57[16];
              *(_OWORD *)(v21 + 40) = v58;
              *(_OWORD *)(v21 + 56) = v59;
              *(void *)(v21 + 72) = v22;
              long long v23 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
              *(_OWORD *)BOOL v57 = *(_OWORD *)&a3->mOutputTime.mSampleTime;
              *(_OWORD *)&v57[16] = v23;
              long long v24 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
              long long v58 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
              long long v59 = v24;
              uint64_t v25 = *((void *)this + 32);
              if (*((void *)this + 33) == v25) {
                std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
              }
              uint64_t v26 = *((void *)this + 17) + 24;
              *(_DWORD *)uint64_t v25 = a2;
              *(_DWORD *)(v25 + 4) = 0;
              *(_OWORD *)(v25 + 8) = *(_OWORD *)v57;
              *(_OWORD *)(v25 + 24) = *(_OWORD *)&v57[16];
              *(_OWORD *)(v25 + 40) = v58;
              *(_OWORD *)(v25 + 56) = v59;
              *(void *)(v25 + 72) = v26;
              if (*((void *)v18 + 2))
              {
                DSPGraph::Graph::preflight();
                if (*((void *)v18 + 2))
                {
                  DSPGraph::Graph::processMultiple();
                  ASDDSPStreamHelper::validateGraphAudio(this, v18, (const CAStreamBasicDescription *)this, (const CAStreamBasicDescription *)this);
                  atomic_fetch_add(v17, 0xFFFFFFFF);
LABEL_33:
                  std::mutex::unlock(v12);
                  return 0;
                }
              }
              uint64_t v53 = "mFormatMatchedGraph";
              int v54 = 38;
              int v55 = "ASDDSPGraphHelper.h";
              int v56 = "graphToProcess";
            }
            else
            {
              uint64_t v53 = "*graphHelper";
              int v54 = 377;
              int v55 = "ASDDSPStreamHelper.mm";
              int v56 = "processOutput";
            }
            __assert_rtn(v56, v55, v54, v53);
          }
          int v14 = (atomic_uint *)(v13 + 48);
        }
        atomic_fetch_add(v14, 0xFFFFFFFF);
        memcpy(a5, a4, (*((_DWORD *)this + 6) * a2));
        goto LABEL_33;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)BOOL v57 = 136315650;
        *(void *)&v57[4] = "NULL == ioSecondaryBuffer";
        *(_WORD *)&v57[12] = 2080;
        *(void *)&v57[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
        *(_WORD *)&v57[22] = 1024;
        *(_DWORD *)&v57[24] = 362;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", v57, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v57 = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioSecondaryBuffer passed to DSP processOutput\n", v57, 2u);
      }
      uint64_t v27 = 1970171760;
      BOOL v44 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      if (v44) {
        ASDDSPStreamHelper::processOutput(v44, v45, v46, v47, v48, v49, v50, v51);
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)BOOL v57 = 136315650;
        *(void *)&v57[4] = "NULL == ioCycleInfo";
        *(_WORD *)&v57[12] = 2080;
        *(void *)&v57[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
        *(_WORD *)&v57[22] = 1024;
        *(_DWORD *)&v57[24] = 361;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", v57, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v57 = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioCycleInfo passed to DSP processOutput\n", v57, 2u);
      }
      uint64_t v27 = 1970171760;
      BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      if (v36) {
        ASDDSPStreamHelper::processOutput(v36, v37, v38, v39, v40, v41, v42, v43);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v57 = 136315650;
      *(void *)&v57[4] = "NULL == ioMainBuffer";
      *(_WORD *)&v57[12] = 2080;
      *(void *)&v57[14] = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
      *(_WORD *)&v57[22] = 1024;
      *(_DWORD *)&v57[24] = 360;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", v57, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v57 = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioMainBuffer passed to DSP processOutput\n", v57, 2u);
    }
    uint64_t v27 = 1970171760;
    BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v28) {
      ASDDSPStreamHelper::processOutput(v28, v29, v30, v31, v32, v33, v34, v35);
    }
  }
  return v27;
}

void sub_225D27694(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  atomic_fetch_add(v3, 0xFFFFFFFF);
  std::mutex::unlock(v2);
  if (a2 == 4)
  {
    __cxa_begin_catch(exception_object);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ASDDSPStreamHelper::readInput();
    }
    goto LABEL_5;
  }
  if (a2 == 3)
  {
    __cxa_begin_catch(exception_object);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
  }
  else
  {
    __cxa_begin_catch(exception_object);
    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (a2 != 2)
    {
      if (v6) {
        ASDDSPStreamHelper::readInput(v6, v7, v8, v9, v10, v11, v12, v13);
      }
LABEL_5:
      __cxa_end_catch();
      JUMPOUT(0x225D275F8);
    }
    if (!v6) {
      goto LABEL_5;
    }
  }
  ASDSRCStreamHelper::readInput();
  goto LABEL_5;
}

uint64_t ASDDSPStreamHelper::writeMix(ASDDSPStreamHelper *this, unsigned int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.mIOCycleCounter) = 136315650;
      *(UInt64 *)((char *)&buf.mIOCycleCounter + 4) = (UInt64)"NULL == ioMainBuffer";
      *((_WORD *)&buf.mNominalIOBufferFrameSize + 2) = 2080;
      *(void *)((char *)&buf.mNominalIOBufferFrameSize + 6) = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/"
                                                                "AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
      HIWORD(buf.mCurrentTime.mSampleTime) = 1024;
      LODWORD(buf.mCurrentTime.mHostTime) = 434;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.mIOCycleCounter) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioMainBuffer passed to DSP writeMix\n", (uint8_t *)&buf, 2u);
    }
    uint64_t v12 = 1970171760;
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v13) {
      ASDDSPStreamHelper::writeMix(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return v12;
  }
  if (!a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.mIOCycleCounter) = 136315650;
      *(UInt64 *)((char *)&buf.mIOCycleCounter + 4) = (UInt64)"NULL == ioCycleInfo";
      *((_WORD *)&buf.mNominalIOBufferFrameSize + 2) = 2080;
      *(void *)((char *)&buf.mNominalIOBufferFrameSize + 6) = "/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/"
                                                                "AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
      HIWORD(buf.mCurrentTime.mSampleTime) = 1024;
      LODWORD(buf.mCurrentTime.mHostTime) = 435;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfNULLWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.mIOCycleCounter) = 0;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "NULL ioCycleInfo passed to DSP writeMix\n", (uint8_t *)&buf, 2u);
    }
    uint64_t v12 = 1970171760;
    BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v21) {
      ASDDSPStreamHelper::writeMix(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    return v12;
  }
  float32x4_t v126 = (std::mutex *)((char *)this + 304);
  BOOL v9 = std::mutex::try_lock((std::mutex *)((char *)this + 304));
  if (!v9)
  {
    uint64_t v30 = (CAStreamBasicDescription **)*((void *)this + 29);
    uint64_t v29 = (CAStreamBasicDescription **)*((void *)this + 30);
    if (v30 == v29) {
      return 0;
    }
    BOOL v125 = 0;
    uint64_t v31 = 1970171760;
    while (1)
    {
      CAStreamBasicDescription::BytesToFrames(v30[8]);
      if (v32 < a2)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.mIOCycleCounter) = 136315650;
          *(UInt64 *)((char *)&buf.mIOCycleCounter + 4) = (UInt64)"ioBufferFrameSize > outStream.mBufferList->capacityFrames()";
          *((_WORD *)&buf.mNominalIOBufferFrameSize + 2) = 2080;
          *(void *)((char *)&buf.mNominalIOBufferFrameSize + 6) = "/Library/Caches/com.apple.xbs/Sources/AudioServerDri"
                                                                    "ver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
          HIWORD(buf.mCurrentTime.mSampleTime) = 1024;
          LODWORD(buf.mCurrentTime.mHostTime) = 513;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&buf, 0x1Cu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          CAStreamBasicDescription::BytesToFrames(v30[8]);
          LODWORD(buf.mIOCycleCounter) = 67109376;
          HIDWORD(buf.mIOCycleCounter) = a2;
          LOWORD(buf.mNominalIOBufferFrameSize) = 1024;
          *(UInt32 *)((char *)&buf.mNominalIOBufferFrameSize + 2) = v54;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ioBufferFrameSize %d passed to DSP writeMix exceeds capacity %d on output streams\n", (uint8_t *)&buf, 0xEu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          CAStreamBasicDescription::BytesToFrames(v30[8]);
          ASDDSPStreamHelper::writeMix((uint64_t)&buf, a2, v103);
        }
        uint64_t v12 = v31;
        goto LABEL_107;
      }
      uint64_t v33 = v30[8];
      uint64_t v34 = (CABufferList *)*((void *)v33 + 5);
      unsigned int v35 = *((_DWORD *)v34 + 4);
      if (v35) {
        BOOL v36 = *((_DWORD *)v33 + 6) * a2 > v35;
      }
      else {
        BOOL v36 = 0;
      }
      if (!v36)
      {
        CABufferList::SetNumBytes(v34, *((_DWORD *)v33 + 6) * a2);
        uint64_t v34 = (CABufferList *)*((void *)v30[8] + 5);
        unsigned int v35 = *((_DWORD *)v34 + 4);
      }
      CABufferList::SetToZeroes(v34, v35);
      uint64_t v12 = ASDDSPStreamHelper::DSPStream::writeMix((ASDDSPStreamHelper::DSPStream *)v30, a2, a3);
      if (v12) {
        break;
      }
      uint64_t v31 = 0;
      v30 += 9;
      if (v30 == v29) {
        goto LABEL_107;
      }
    }
    BOOL v55 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!v55) {
      goto LABEL_107;
    }
LABEL_60:
    ASDDSPStreamHelper::writeMix(v55, v56, v57, v58, v59, v60, v61, v62);
    goto LABEL_107;
  }
  if (*((unsigned char *)this + 368))
  {
    uint64_t v10 = *((void *)this + 29);
    uint64_t v11 = *((void *)this + 30);
    if (v10 == v11)
    {
      uint64_t v12 = 0;
LABEL_108:
      std::mutex::unlock(v126);
      return v12;
    }
    BOOL v125 = v9;
    while (1)
    {
      uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(v10 + 56) + 16))();
      if (v12) {
        break;
      }
      v10 += 72;
      if (v10 == v11)
      {
        uint64_t v12 = 0;
        goto LABEL_107;
      }
    }
    BOOL v55 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (!v55) {
      goto LABEL_107;
    }
    goto LABEL_60;
  }
  BOOL v125 = v9;
  uint64_t v12 = 1970171760;
  uint64_t v37 = (CAStreamBasicDescription **)*((void *)this + 20);
  unint64_t v123 = (CAStreamBasicDescription **)*((void *)this + 21);
  if (v123 == v37)
  {
LABEL_41:
    uint64_t v48 = *((void *)this + 23);
    if (*((void *)this + 24) == v48) {
      std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
    }
    long long v49 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
    v127[0] = *(_OWORD *)&a3->mOutputTime.mSampleTime;
    v127[1] = v49;
    long long v50 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
    v127[2] = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
    v127[3] = v50;
    if (SetupGraphIOData(v48, a2, v127, (uint64_t)this))
    {
      CAStreamBasicDescription::BytesToFrames((CAStreamBasicDescription *)this);
      if (v51 >= a2)
      {
        ASDBufferList::copyDataToBufferList((ASDBufferList *)this, a4, a2);
        uint64_t v90 = *((void *)this + 29);
        uint64_t v89 = *((void *)this + 30);
        if (v90 == v89)
        {
LABEL_85:
          uint64_t v97 = *((void *)this + 18);
          atomic_fetch_add((atomic_uint *volatile)(v97 + 48), 1u);
          uint64_t v98 = atomic_load((unint64_t *)(v97 + 40));
          if (!v98
            || (caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v98, -1), (float32x4_t v124 = (atomic_uint *)v99) == 0))
          {
            atomic_fetch_add((atomic_uint *volatile)(v97 + 48), 0xFFFFFFFF);
            __assert_rtn("writeMix", "ASDDSPStreamHelper.mm", 483, "graphHelper");
          }
          atomic_fetch_add((atomic_uint *volatile)v99, 1u);
          uint64_t v100 = *(ASDDSPGraphHelper **)(v99 + 16);
          atomic_fetch_add((atomic_uint *volatile)(v97 + 48), 0xFFFFFFFF);
          if (*((void *)this + 24) == *((void *)this + 23)) {
            goto LABEL_114;
          }
          kdebug_trace();
          if (!*((void *)v100 + 2) || (DSPGraph::Graph::preflight(), !*((void *)v100 + 2))) {
            __assert_rtn("graphToProcess", "ASDDSPGraphHelper.h", 38, "mFormatMatchedGraph");
          }
          DSPGraph::Graph::processMultiple();
          ASDDSPStreamHelper::validateGraphAudio(this, v100, *((const CAStreamBasicDescription **)this + 26), *((const CAStreamBasicDescription **)this + 35));
          if (*((void *)this + 24) == *((void *)this + 23)) {
LABEL_114:
          }
            std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
          kdebug_trace();
          int v102 = (ASDDSPStreamHelper::DSPStream *)*((void *)this + 29);
          int v101 = (ASDDSPStreamHelper::DSPStream *)*((void *)this + 30);
          while (1)
          {
            if (v102 == v101)
            {
              uint64_t v12 = 0;
              goto LABEL_106;
            }
            uint64_t v12 = ASDDSPStreamHelper::DSPStream::writeMix(v102, a2, a3);
            if (v12) {
              break;
            }
            int v102 = (ASDDSPStreamHelper::DSPStream *)((char *)v102 + 72);
          }
          BOOL v114 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v114) {
            ASDDSPStreamHelper::writeMix(v114, v115, v116, v117, v118, v119, v120, v121);
          }
LABEL_106:
          atomic_fetch_add(v124, 0xFFFFFFFF);
        }
        else
        {
          uint64_t v91 = 0;
          uint64_t v92 = -1;
          while (1)
          {
            CAStreamBasicDescription::BytesToFrames(*(CAStreamBasicDescription **)(v90 + 64));
            if (v93 < a2) {
              break;
            }
            uint64_t v94 = *((void *)this + 32);
            if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 33) - v94) >> 4) <= ++v92) {
              std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
            }
            long long v95 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
            *(_OWORD *)&buf.mIOCycleCounter = *(_OWORD *)&a3->mOutputTime.mSampleTime;
            *(_OWORD *)&buf.mCurrentTime.mSampleTime = v95;
            long long v96 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
            *(_OWORD *)&buf.mCurrentTime.mRateScalar = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
            *(_OWORD *)&buf.mCurrentTime.mSMPTETime.mSubframes = v96;
            if ((SetupGraphIOData(v94 + v91, a2, (long long *)&buf, *(void *)(v90 + 64)) & 1) == 0)
            {
              BOOL v106 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
              if (v106) {
                ASDDSPStreamHelper::writeMix(v106, v107, v108, v109, v110, v111, v112, v113);
              }
              goto LABEL_107;
            }
            v91 += 80;
            v90 += 72;
            if (v90 == v89) {
              goto LABEL_85;
            }
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.mIOCycleCounter) = 136315650;
            *(UInt64 *)((char *)&buf.mIOCycleCounter + 4) = (UInt64)"ioBufferFrameSize > outStream.mBufferList->capacityFrames()";
            *((_WORD *)&buf.mNominalIOBufferFrameSize + 2) = 2080;
            *(void *)((char *)&buf.mNominalIOBufferFrameSize + 6) = "/Library/Caches/com.apple.xbs/Sources/AudioServerD"
                                                                      "river/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
            HIWORD(buf.mCurrentTime.mSampleTime) = 1024;
            LODWORD(buf.mCurrentTime.mHostTime) = 474;
            _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&buf, 0x1Cu);
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
          {
            CAStreamBasicDescription::BytesToFrames(*(CAStreamBasicDescription **)(v90 + 64));
            LODWORD(buf.mIOCycleCounter) = 67109376;
            HIDWORD(buf.mIOCycleCounter) = a2;
            LOWORD(buf.mNominalIOBufferFrameSize) = 1024;
            *(UInt32 *)((char *)&buf.mNominalIOBufferFrameSize + 2) = v104;
            _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ioBufferFrameSize %d passed to DSP writeMix exceeds ringbuffer capacity %d on output streams\n", (uint8_t *)&buf, 0xEu);
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
          {
            CAStreamBasicDescription::BytesToFrames(*(CAStreamBasicDescription **)(v90 + 64));
            ASDDSPStreamHelper::writeMix((uint64_t)&buf, a2, v105);
          }
        }
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.mIOCycleCounter) = 136315650;
          *(UInt64 *)((char *)&buf.mIOCycleCounter + 4) = (UInt64)"ioBufferFrameSize > mDSPBL.capacityFrames()";
          *((_WORD *)&buf.mNominalIOBufferFrameSize + 2) = 2080;
          *(void *)((char *)&buf.mNominalIOBufferFrameSize + 6) = "/Library/Caches/com.apple.xbs/Sources/AudioServerDri"
                                                                    "ver/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
          HIWORD(buf.mCurrentTime.mSampleTime) = 1024;
          LODWORD(buf.mCurrentTime.mHostTime) = 468;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&buf, 0x1Cu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
        {
          CAStreamBasicDescription::BytesToFrames((CAStreamBasicDescription *)this);
          LODWORD(buf.mIOCycleCounter) = 67109376;
          HIDWORD(buf.mIOCycleCounter) = a2;
          LOWORD(buf.mNominalIOBufferFrameSize) = 1024;
          *(UInt32 *)((char *)&buf.mNominalIOBufferFrameSize + 2) = v52;
          _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ioBufferFrameSize %d passed to DSP writeMix exceeds ringbuffer capacity %d\n", (uint8_t *)&buf, 0xEu);
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
        {
          CAStreamBasicDescription::BytesToFrames((CAStreamBasicDescription *)this);
          ASDDSPStreamHelper::writeMix((uint64_t)&buf, a2, v53);
        }
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.mIOCycleCounter) = 136315650;
        *(UInt64 *)((char *)&buf.mIOCycleCounter + 4) = (UInt64)"!setupGraphIO";
        *((_WORD *)&buf.mNominalIOBufferFrameSize + 2) = 2080;
        *(void *)((char *)&buf.mNominalIOBufferFrameSize + 6) = "/Library/Caches/com.apple.xbs/Sources/AudioServerDrive"
                                                                  "r/AudioServerDriver/DSP/ASDDSPStreamHelper.mm";
        HIWORD(buf.mCurrentTime.mSampleTime) = 1024;
        LODWORD(buf.mCurrentTime.mHostTime) = 466;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&buf, 0x1Cu);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.mIOCycleCounter) = 0;
        _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Failed to setup Graph output buffer for DSP writeMix\n", (uint8_t *)&buf, 2u);
      }
      BOOL v63 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
      if (v63) {
        ASDDSPStreamHelper::writeMix(v63, v64, v65, v66, v67, v68, v69, v70);
      }
    }
  }
  else
  {
    uint64_t v38 = 0;
    long long v39 = *(_OWORD *)&a3->mOutputTime.mRateScalar;
    long long v40 = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mHours;
    long long v41 = *(_OWORD *)&a3->mMainHostTicksPerFrame;
    *(_OWORD *)&buf.mOutputTime.mSMPTETime.mSubframes = *(_OWORD *)&a3->mOutputTime.mSMPTETime.mSubframes;
    *(_OWORD *)&buf.mOutputTime.mSMPTETime.mHours = v40;
    *(_OWORD *)&buf.mOutputTime.mSampleTime = *(_OWORD *)&a3->mOutputTime.mSampleTime;
    *(_OWORD *)&buf.mOutputTime.mRateScalar = v39;
    long long v42 = *(_OWORD *)&a3->mCurrentTime.mSMPTETime.mSubframes;
    *(_OWORD *)&buf.mCurrentTime.mRateScalar = *(_OWORD *)&a3->mCurrentTime.mRateScalar;
    *(_OWORD *)&buf.mCurrentTime.mSMPTETime.mSubframes = v42;
    long long v43 = *(_OWORD *)&a3->mInputTime.mSampleTime;
    *(_OWORD *)&buf.mCurrentTime.mSMPTETime.mHours = *(_OWORD *)&a3->mCurrentTime.mSMPTETime.mHours;
    *(_OWORD *)&buf.mInputTime.mSampleTime = v43;
    long long v44 = *(_OWORD *)&a3->mCurrentTime.mSampleTime;
    *(_OWORD *)&buf.mIOCycleCounter = *(_OWORD *)&a3->mIOCycleCounter;
    *(_OWORD *)&buf.mCurrentTime.mSampleTime = v44;
    *(_OWORD *)&buf.mInputTime.mSampleTime = *(_OWORD *)&buf.mOutputTime.mSampleTime;
    *(_OWORD *)&buf.mInputTime.mRateScalar = v39;
    *(_OWORD *)&buf.mInputTime.mSMPTETime.mSubframes = *(_OWORD *)&buf.mOutputTime.mSMPTETime.mSubframes;
    uint64_t v45 = 80;
    *(_OWORD *)&buf.mMainHostTicksPerFrame = v41;
    *(_OWORD *)&buf.mInputTime.mSMPTETime.mHours = v40;
    while (1)
    {
      CAStreamBasicDescription::BytesToFrames(v37[8]);
      if (v46 < a2) {
        break;
      }
      uint64_t v47 = *((void *)this + 23);
      if (0xCCCCCCCCCCCCCCCDLL * ((*((void *)this + 24) - v47) >> 4) <= ++v38) {
        std::vector<CAStreamBasicDescription>::__throw_out_of_range[abi:ne180100]();
      }
      AudioTimeStamp mInputTime = buf.mInputTime;
      if ((SetupGraphIOData(v47 + v45, a2, (long long *)&mInputTime, (uint64_t)v37[8]) & 1) == 0)
      {
        BOOL v73 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v73) {
          ASDDSPStreamHelper::writeMix(v73, v74, v75, v76, v77, v78, v79, v80);
        }
        goto LABEL_107;
      }
      uint64_t v12 = ASDDSPStreamHelper::DSPStream::readInput((ASDDSPStreamHelper::DSPStream *)v37, a2, &buf);
      if (v12)
      {
        BOOL v81 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v81) {
          ASDDSPStreamHelper::readInput(v81, v82, v83, v84, v85, v86, v87, v88);
        }
        goto LABEL_107;
      }
      v45 += 80;
      v37 += 9;
      if (v37 == v123)
      {
        uint64_t v12 = 0;
        goto LABEL_41;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(mInputTime.mSampleTime) = 136315650;
      *(void *)((char *)&mInputTime.mSampleTime + 4) = "ioBufferFrameSize > inStream.mBufferList->capacityFrames()";
      WORD2(mInputTime.mHostTime) = 2080;
      *(UInt64 *)((char *)&mInputTime.mHostTime + 6) = (UInt64)"/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/A"
                                                               "udioServerDriver/DSP/ASDDSPStreamHelper.mm";
      HIWORD(mInputTime.mRateScalar) = 1024;
      LODWORD(mInputTime.mWordClockTime) = 455;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " AudioServerDriver assertion FailIfWithFault \"%s\" failed in %s at line %d goto Exit. ", (uint8_t *)&mInputTime, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      CAStreamBasicDescription::BytesToFrames(v37[8]);
      LODWORD(mInputTime.mSampleTime) = 67109376;
      HIDWORD(mInputTime.mSampleTime) = a2;
      LOWORD(mInputTime.mHostTime) = 1024;
      *(_DWORD *)((char *)&mInputTime.mHostTime + 2) = v71;
      _os_log_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "ioBufferFrameSize %d passed to DSP writeMix exceeds ringbuffer capacity %d on input streams\n", (uint8_t *)&mInputTime, 0xEu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT))
    {
      CAStreamBasicDescription::BytesToFrames(v37[8]);
      ASDDSPStreamHelper::writeMix((uint64_t)&mInputTime, a2, v72);
    }
  }
LABEL_107:
  if (v125) {
    goto LABEL_108;
  }
  return v12;
}

void sub_225D284C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, std::mutex *a13)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  if (a12) {
    std::mutex::unlock(a13);
  }
  if (a2 == 4)
  {
    __cxa_begin_catch(exception_object);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      ASDDSPStreamHelper::readInput();
    }
    goto LABEL_7;
  }
  if (a2 == 3)
  {
    __cxa_begin_catch(exception_object);
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
  }
  else
  {
    __cxa_begin_catch(exception_object);
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (a2 != 2)
    {
      if (v15) {
        ASDDSPStreamHelper::readInput(v15, v16, v17, v18, v19, v20, v21, v22);
      }
LABEL_7:
      __cxa_end_catch();
      JUMPOUT(0x225D283FCLL);
    }
    if (!v15) {
      goto LABEL_7;
    }
  }
  ASDSRCStreamHelper::readInput();
  goto LABEL_7;
}

uint64_t ASDBufferList::copyDataToBufferList(ASDBufferList *this, void *a2, int a3)
{
  if (!a2) {
    ASDBufferList::copyDataToBufferList();
  }
  uint64_t v4 = *((void *)this + 5);
  if (*(_DWORD *)(v4 + 24) != 1) {
    ASDBufferList::copyDataToBufferList();
  }
  size_t v6 = (*((_DWORD *)this + 6) * a3);
  if (v6 > *(_DWORD *)(v4 + 16)) {
    return 0;
  }
  memcpy(*(void **)(v4 + 40), a2, v6);
  unsigned int v7 = *((_DWORD *)this + 6) * a3;
  uint64_t v8 = (_DWORD *)*((void *)this + 5);
  unsigned int v9 = v8[4];
  if (v9 && v7 > v9) {
    return 0;
  }
  CABufferList::SetNumBytes(v8, v7);
  return 1;
}

void ASDDSPStreamHelper::suspendProcessing(ASDDSPStreamHelper *this)
{
}

void ASDDSPStreamHelper::resumeProcessing(ASDDSPStreamHelper *this)
{
}

uint64_t ASDDSPStreamHelper::setGraphAudioValidationMode(uint64_t result, uint64_t a2)
{
  *(void *)(result + 152) = a2;
  return result;
}

uint64_t ASDDSPStreamHelper::validateGraphAudio(ASDDSPGraphHelper *,CAStreamBasicDescription const*,CAStreamBasicDescription const*)::$_0::operator()<DSPGraph::GraphIOData>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(*(void *)a1 + 152) == 2) {
    int v3 = *(_DWORD *)a2;
  }
  else {
    int v3 = 1;
  }
  uint64_t v4 = *(_DWORD **)(a2 + 72);
  if (!*v4) {
    return 0;
  }
  unint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = &v4[4 * v7];
    unsigned int v9 = v8 + 2;
    int v17 = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat((_DWORD *)(a3 + 40 * v7), &v17, 0)
      && v17 == 1)
    {
      break;
    }
    int v18 = 0;
    if (CAStreamBasicDescription::IdentifyCommonPCMFormat((_DWORD *)(a3 + 40 * v7), &v18, 0)) {
      BOOL v11 = v18 == 4;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      uint64_t v12 = (*v9 * v3);
      if (v12)
      {
        uint64_t v13 = 0;
        while (fabs(*(double *)(*(void *)&v4[4 * v7 + 4] + 8 * v13)) != INFINITY)
        {
          if (v12 == ++v13) {
            goto LABEL_24;
          }
        }
        return (v7 << 32) | 2;
      }
    }
LABEL_24:
    ++v7;
    uint64_t v4 = *(_DWORD **)(a2 + 72);
    if (v7 >= *v4) {
      return 0;
    }
  }
  uint64_t v14 = (*v9 * v3);
  if (!v14) {
    goto LABEL_24;
  }
  uint64_t v15 = 0;
  while (fabsf(*(float *)(*((void *)v8 + 2) + 4 * v15)) != INFINITY)
  {
    if (v14 == ++v15) {
      goto LABEL_24;
    }
  }
  return (v7 << 32) | 2;
}

ASDDSPStreamHelper *ASDDSPStreamHelper::setBypassGraphMode(ASDDSPStreamHelper *this, char a2)
{
  *((unsigned char *)this + 368) = a2;
  return this;
}

void CAStreamBasicDescription::BytesToFrames(CAStreamBasicDescription *this)
{
  if (!*((_DWORD *)this + 6))
  {
    BOOL v1 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v1) {
      CAStreamBasicDescription::BytesToFrames(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    __break(1u);
  }
}

_DWORD *CABufferList::SetNumBytes(_DWORD *this, unsigned int a2)
{
  void v9[5] = *MEMORY[0x263EF8340];
  unsigned int v2 = this[4];
  if (v2) {
    BOOL v3 = v2 >= a2;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    if (CALog_DefaultScope)
    {
      uint64_t v6 = *(id *)CALog_DefaultScope;
    }
    else
    {
      uint64_t v6 = &_os_log_internal;
      id v7 = &_os_log_internal;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/Utility/CABufferList.h");
      CABufferList::SetNumBytes((uint64_t)v8, (uint64_t)v9);
    }

    __break(1u);
  }
  int v4 = this[6];
  if (v4)
  {
    uint64_t v5 = this + 9;
    do
    {
      unsigned int *v5 = a2;
      v5 += 4;
      --v4;
    }
    while (v4);
  }
  return this;
}

void sub_225D28980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CABufferList::SetToZeroes(CABufferList *this, unsigned int a2)
{
  v11[5] = *MEMORY[0x263EF8340];
  unsigned int v2 = *((_DWORD *)this + 4);
  if (v2) {
    BOOL v3 = v2 >= a2;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    if (CALog_DefaultScope)
    {
      uint64_t v8 = *(id *)CALog_DefaultScope;
    }
    else
    {
      uint64_t v8 = &_os_log_internal;
      id v9 = &_os_log_internal;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/Utility/CABufferList.h");
      CABufferList::SetToZeroes((uint64_t)v10, (uint64_t)v11);
    }

    __break(1u);
  }
  int v4 = *((_DWORD *)this + 6);
  if (v4)
  {
    size_t v6 = a2;
    id v7 = (void **)((char *)this + 40);
    do
    {
      --v4;
      bzero(*v7, v6);
      *((_DWORD *)v7 - 1) = a2;
      v7 += 2;
    }
    while (v4);
  }
}

void sub_225D28A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::vector<ASDDSPStreamHelper::DSPStream>::__construct_one_at_end[abi:ne180100]<ASDDSPStreamHelper::DSPStream const&>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_DWORD *)uint64_t v4 = *(_DWORD *)a2;
  long long v5 = *(_OWORD *)(a2 + 8);
  long long v6 = *(_OWORD *)(a2 + 24);
  *(void *)(v4 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(v4 + 24) = v6;
  *(_OWORD *)(v4 + 8) = v5;
  *(void *)(v4 + 48) = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  uint64_t result = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  *(void *)(v4 + 56) = result;
  *(void *)(v4 + 64) = 0;
  *(void *)(a1 + 8) = v4 + 72;
  return result;
}

uint64_t std::vector<ASDDSPStreamHelper::DSPStream>::__emplace_back_slow_path<ASDDSPStreamHelper::DSPStream const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL) {
    std::vector<CAStreamBasicDescription>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x1C71C71C71C71C7) {
    unint64_t v9 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v9 = v5;
  }
  v16[4] = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ASDDSPStreamHelper::DSPStream>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  BOOL v11 = &v10[72 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[72 * v9];
  *(_DWORD *)BOOL v11 = *(_DWORD *)a2;
  long long v12 = *(_OWORD *)(a2 + 8);
  long long v13 = *(_OWORD *)(a2 + 24);
  *((void *)v11 + 5) = *(void *)(a2 + 40);
  *(_OWORD *)(v11 + 24) = v13;
  *(_OWORD *)(v11 + 8) = v12;
  *((void *)v11 + 6) = MEMORY[0x22A63F100](*(void *)(a2 + 48));
  *((void *)v11 + 7) = MEMORY[0x22A63F100](*(void *)(a2 + 56));
  *((void *)v11 + 8) = 0;
  _OWORD v16[2] = v11 + 72;
  std::vector<ASDDSPStreamHelper::DSPStream>::__swap_out_circular_buffer(a1, v16);
  uint64_t v14 = a1[1];
  std::__split_buffer<ASDDSPStreamHelper::DSPStream>::~__split_buffer((uint64_t)v16);
  return v14;
}

void sub_225D28C44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<ASDDSPStreamHelper::DSPStream>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t result, int a2, int a3, float a4)
{
  *(float *)uint64_t result = a4;
  *(_DWORD *)(result + 4) = a2;
  *(_WORD *)(result + 8) = 1024;
  *(_DWORD *)(result + 10) = a3;
  return result;
}

void OUTLINED_FUNCTION_8_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X1>, int a2@<W8>)
{
  *(_DWORD *)(a1 + 14) = a2;
  *(_WORD *)(a1 + 18) = 2080;
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_225D29500(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_225D29724(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ResamplerInitLocker::ResamplerInitLocker(ResamplerInitLocker *this)
{
}

{
  pthread_mutex_lock(&sInitLocker);
}

void ResamplerInitLocker::~ResamplerInitLocker(ResamplerInitLocker *this)
{
}

{
  pthread_mutex_unlock(&sInitLocker);
}

void sub_225D2A7D4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_225D2AF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_225D2C28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_225D30F18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_225D312EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void ASDSRCStreamHelper::ASDSRCStreamHelper()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_225CD5000, &_os_log_internal, v0, " ASDSRCStreamHelper failed to create the output converter from SRC format, Error: %d (%s)", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7(&dword_225CD5000, &_os_log_internal, v0, " ASDSRCStreamHelper failed to create the input converter to SRC format, Error: %d (%s)", v1, v2, v3, v4, v5);
}

void ASDSRCStreamHelper::allocateStreamingResources()
{
}

{
  __assert_rtn("allocateStreamingResources", "ASDSRCStreamHelper.mm", 155, "mBufferSize[1] != 0");
}

{
  __assert_rtn("allocateStreamingResources", "ASDSRCStreamHelper.mm", 161, "mBuffer[0]");
}

void ASDSRCStreamHelper::readInput(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "NULL ioCycleInfo passed to SRC readInput\n", a5, a6, a7, a8, 0);
}

void ASDSRCStreamHelper::readInput()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_225CD5000, &_os_log_internal, v0, "Input data size %d exceeds driver capacity %d in SRC  readInput\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(*MEMORY[0x263EF8340]);
  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v1, "%s", v2, v3, v4, v5, v6);
}

{
  uint8_t v0[16];

  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Unknown exception occured", v0, 2u);
}

void ASDSRCStreamHelper::writeMix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "NULL ioCycleInfo passed to SRC writeMix\n", a5, a6, a7, a8, 0);
}

void ASDSRCStreamHelper::writeMix()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_225CD5000, &_os_log_internal, v0, "Input data size %d exceeds driver capacity %d in SRC writeMix\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_225CD5000, &_os_log_internal, v0, "Input data size %d exceeds driver capacity %d in SRC writeMix\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_225CD5000, &_os_log_internal, v0, "Output data size %d exceeds driver capacity %d in SRC writeMix\n", v1, v2, v3, v4, v5);
}

void CAStreamBasicDescription::PackednessIsSignificant()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, " PackednessIsSignificant only applies for PCM", v0, 2u);
}

void ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(void *a1)
{
  uint64_t v1 = __cxa_begin_catch(a1);
  OUTLINED_FUNCTION_2_0((uint64_t)v1);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    OUTLINED_FUNCTION_3_0();
    OUTLINED_FUNCTION_4_0();
    OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_1_1(&dword_225CD5000, &_os_log_internal, v2, "Caught graph exception %d %4.4s %s in %s:%i", v3, v4, v5, v6, v7);
  }
}

void caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::element_t::release()
{
}

void ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(void *a1, _DWORD *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *a2 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    OUTLINED_FUNCTION_0_1();
    _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", v2, 0x32u);
  }
}

void ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(void *a1, _DWORD *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (char *)__cxa_begin_catch(a1);
  int v4 = *((_DWORD *)v3 + 2);
  *a2 = v4;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = v3 + 72;
    if (v3[95] < 0) {
      uint64_t v5 = (void *)*v5;
    }
    uint64_t v6 = v3 + 16;
    if (v3[39] < 0) {
      uint64_t v6 = (void *)*v6;
    }
    int v7 = *((_DWORD *)v3 + 10);
    v8[0] = 67110402;
    v8[1] = v4;
    __int16 v9 = 1040;
    int v10 = 4;
    __int16 v11 = 2080;
    long long v12 = a2;
    __int16 v13 = 2080;
    uint64_t v14 = v5;
    __int16 v15 = 2080;
    uint64_t v16 = v6;
    __int16 v17 = 1024;
    int v18 = v7;
    _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Caught graph exception %d %4.4s %s in %s:%i", (uint8_t *)v8, 0x32u);
  }
}

void ASD_SetRealtimeOperationTableSize_cold_1()
{
}

void ASDPluginInterfaceInfo::setRealTimeOperationVectorSize(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_225CD5000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@: Attempt to move from vectors to maps for realtime operations.", (uint8_t *)&v2, 0xCu);
}

uint64_t DSPGraph::Interpreter::Interpreter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void CABufferList::VerifyNotTrashingOwnedBuffer()
{
  if (CALog_DefaultScope) {
    uint64_t v0 = *(NSObject **)CALog_DefaultScope;
  }
  else {
    uint64_t v0 = &_os_log_internal;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/Utility/CABufferList.h");
    OUTLINED_FUNCTION_0_3(&dword_225CD5000, v1, v2, "%s:%d:%s: ASSERTION FAILURE [(mBufferMemory == __null) != 0 is false]: ", v3, v4, v5, v6, 2u);
  }
  __break(1u);
}

void CABufferList::BytesConsumed()
{
  if (CALog_DefaultScope) {
    uint64_t v0 = *(NSObject **)CALog_DefaultScope;
  }
  else {
    uint64_t v0 = &_os_log_internal;
  }
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    LogFilenameOnly("/Library/Caches/com.apple.xbs/Sources/AudioServerDriver/Utility/CABufferList.h");
    OUTLINED_FUNCTION_0_3(&dword_225CD5000, v1, v2, "%s:%d:%s: ASSERTION FAILURE [(nBytes <= buf->mDataByteSize) != 0 is false]: ", v3, v4, v5, v6, 2u);
  }
  __break(1u);
}

void ASDBufferList::setBufferListFromData()
{
}

{
  __assert_rtn("setBufferListFromData", "ASDBufferList.h", 95, "mBufferList->GetNumberBuffers() == 1");
}

void CABufferList::SetBytes(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2, 4.8152e-34);
  *(_DWORD *)(v2 + 14) = 84;
  *(_WORD *)(v2 + 18) = 2080;
  *(void *)(v2 + 20) = "SetBytes";
  _os_log_impl(&dword_225CD5000, v3, OS_LOG_TYPE_ERROR, "%s:%d:%s: ASSERTION FAILURE [(mABL.mNumberBuffers == 1) != 0 is false]: ", v4, 0x1Cu);
}

{
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_0_4(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_9(v2, 84);
  *(void *)(v3 + 20) = "SetBytes";
  OUTLINED_FUNCTION_8_0(&dword_225CD5000, v3, v4, "%s:%d:%s: ASSERTION FAILURE [(mABL.mNumberBuffers == 1) != 0 is false]: ", v5);
}

void CABufferList::VerifyNotTrashingOwnedBuffer(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2, 4.8152e-34);
  *(_DWORD *)(v2 + 14) = 271;
  *(_WORD *)(v2 + 18) = 2080;
  *(void *)(v2 + 20) = "VerifyNotTrashingOwnedBuffer";
  _os_log_impl(&dword_225CD5000, v3, OS_LOG_TYPE_ERROR, "%s:%d:%s: ASSERTION FAILURE [(mBufferMemory == __null) != 0 is false]: ", v4, 0x1Cu);
}

{
  uint64_t v2;
  uint64_t v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_0_4(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_9(v2, 271);
  *(void *)(v3 + 20) = "VerifyNotTrashingOwnedBuffer";
  OUTLINED_FUNCTION_8_0(&dword_225CD5000, v3, v4, "%s:%d:%s: ASSERTION FAILURE [(mBufferMemory == __null) != 0 is false]: ", v5);
}

void CALog::RegisterScope(uint64_t a1)
{
  if (CALog_DefaultScope) {
    uint64_t v2 = *(NSObject **)CALog_DefaultScope;
  }
  else {
    uint64_t v2 = &_os_log_internal;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315906;
    uint64_t v4 = "CALog.cpp";
    __int16 v5 = 1024;
    int v6 = 240;
    __int16 v7 = 2080;
    unint64_t v8 = "RegisterScope";
    __int16 v9 = 2048;
    uint64_t v10 = a1;
    _os_log_impl(&dword_225CD5000, v2, OS_LOG_TYPE_ERROR, "%s:%d:%s: ERROR: subscope bits are set in scope: 0x%lx", (uint8_t *)&v3, 0x26u);
  }
  __break(1u);
}

void ASDDSPStreamHelper::DSPStream::writeMix()
{
  __assert_rtn("data", "ASDBufferList.h", 60, "mBufferList->GetNumberBuffers() == 1");
}

void ASDDSPStreamHelper::addStream()
{
}

{
  __assert_rtn("addStream", "ASDDSPStreamHelper.mm", 218, "outStream.mBufferList");
}

void ASDDSPStreamHelper::readInput(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "NULL ioCycleInfo passed to DSP readInput\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_225CD5000, &_os_log_internal, a3, "Unknown exception occured.", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "Failed to setup Graph output buffer for DSP readInput\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_225CD5000, &_os_log_internal, a3, " Failed DSP readInput", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_225CD5000, &_os_log_internal, a3, " Failed to setup IO for DSP input", a5, a6, a7, a8, 0);
}

void ASDDSPStreamHelper::readInput()
{
  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_11(&dword_225CD5000, &_os_log_internal, v0, "%s %d %s", v1, v2, v3, v4, v5);
}

void ASDDSPStreamHelper::readInput(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(*(void *)a1 + 36);
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  OUTLINED_FUNCTION_10(&dword_225CD5000, &_os_log_internal, a3, "numBytes %d passed to DSP readInput exceeds ringbuffer data size %d\n", (uint8_t *)v4);
}

void ASDDSPStreamHelper::readInput(uint64_t a1, int a2, int a3)
{
  OUTLINED_FUNCTION_2_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_10(&dword_225CD5000, &_os_log_internal, v3, "ioBufferFrameSize %d passed to DSP readInput exceeds ringbuffer capacity %d\n", v4);
}

void ASDDSPStreamHelper::validateGraphAudio()
{
}

{
  __assert_rtn("graphToProcess", "ASDDSPGraphHelper.h", 38, "mFormatMatchedGraph");
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4(&dword_225CD5000, &_os_log_internal, v0, "bogus value in audio %s - resetting the DSP graph", v1, v2, v3, v4, v5);
}

void ASDBufferList::copyDataFromBufferList()
{
}

{
  __assert_rtn("copyDataFromBufferList", "ASDBufferList.h", 87, "numBytes <= mBufferList->GetNumBytes()");
}

{
  __assert_rtn("copyDataFromBufferList", "ASDBufferList.h", 86, "mBufferList->GetNumberBuffers() == 1");
}

void ASDDSPStreamHelper::processOutput(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "NULL ioCycleInfo passed to DSP processOutput\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "NULL ioSecondaryBuffer passed to DSP processOutput\n", a5, a6, a7, a8, 0);
}

void ASDDSPStreamHelper::writeMix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "NULL ioCycleInfo passed to DSP writeMix\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_225CD5000, &_os_log_internal, a3, " Failed DSP output writeMix", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_225CD5000, &_os_log_internal, a3, " Failed to setup IO for output stream of DSP writeMix", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_5(&dword_225CD5000, &_os_log_internal, a3, "Failed to setup Graph output buffer for DSP writeMix\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0_0(&dword_225CD5000, &_os_log_internal, a3, " Failed to setup IO for input stream of DSP writeMix", a5, a6, a7, a8, 0);
}

void ASDDSPStreamHelper::writeMix(uint64_t a1, int a2, int a3)
{
  OUTLINED_FUNCTION_2_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_10(&dword_225CD5000, &_os_log_internal, v3, "ioBufferFrameSize %d passed to DSP writeMix exceeds ringbuffer capacity %d\n", v4);
}

{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_10(&dword_225CD5000, &_os_log_internal, v3, "ioBufferFrameSize %d passed to DSP writeMix exceeds ringbuffer capacity %d on output streams\n", v4);
}

{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_10(&dword_225CD5000, &_os_log_internal, v3, "ioBufferFrameSize %d passed to DSP writeMix exceeds ringbuffer capacity %d on input streams\n", v4);
}

{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2, a3, 1.5047e-36);
  OUTLINED_FUNCTION_10(&dword_225CD5000, &_os_log_internal, v3, "ioBufferFrameSize %d passed to DSP writeMix exceeds capacity %d on output streams\n", v4);
}

void ASDBufferList::copyDataToBufferList()
{
}

{
  __assert_rtn("copyDataToBufferList", "ASDBufferList.h", 70, "mBufferList->GetNumberBuffers() == 1");
}

void CAStreamBasicDescription::BytesToFrames(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CABufferList::SetNumBytes(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_9(v2, 241);
  *(void *)(v3 + 20) = "SetNumBytes";
  OUTLINED_FUNCTION_8_0(&dword_225CD5000, v3, v4, "%s:%d:%s: ASSERTION FAILURE [(mBufferCapacity == 0 || nBytes <= mBufferCapacity) != 0 is false]: ", v5);
}

void CABufferList::SetToZeroes(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_0_4(a1, a2, 4.8152e-34);
  OUTLINED_FUNCTION_9(v2, 149);
  *(void *)(v3 + 20) = "SetToZeroes";
  OUTLINED_FUNCTION_8_0(&dword_225CD5000, v3, v4, "%s:%d:%s: ASSERTION FAILURE [(mBufferCapacity == 0 || nBytes <= mBufferCapacity) != 0 is false]: ", v5);
}

OSStatus AudioConverterConvertBuffer(AudioConverterRef inAudioConverter, UInt32 inInputDataSize, const void *inInputData, UInt32 *ioOutputDataSize, void *outOutputData)
{
  return MEMORY[0x270F0FCC0](inAudioConverter, *(void *)&inInputDataSize, inInputData, ioOutputDataSize, outOutputData);
}

OSStatus AudioConverterConvertComplexBuffer(AudioConverterRef inAudioConverter, UInt32 inNumberPCMFrames, const AudioBufferList *inInputData, AudioBufferList *outOutputData)
{
  return MEMORY[0x270F0FCC8](inAudioConverter, *(void *)&inNumberPCMFrames, inInputData, outOutputData);
}

OSStatus AudioConverterDispose(AudioConverterRef inAudioConverter)
{
  return MEMORY[0x270F0FCD0](inAudioConverter);
}

OSStatus AudioConverterNew(const AudioStreamBasicDescription *inSourceFormat, const AudioStreamBasicDescription *inDestinationFormat, AudioConverterRef *outAudioConverter)
{
  return MEMORY[0x270F0FCD8](inSourceFormat, inDestinationFormat, outAudioConverter);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2 = MEMORY[0x270EE4288](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

uint64_t CFLog()
{
  return MEMORY[0x270EE4AD8]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x270EE5118](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFTimeZoneRef CFTimeZoneCopySystem(void)
{
  return (CFTimeZoneRef)MEMORY[0x270EE52E8]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x270EE5480](alloc, *(void *)&bytes.byte0, *(void *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x270EE5498](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x270EF3EE0](*(void *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x270EF4000](notifier);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x270EF49B0](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t AUProcessingBlock_DSPGraph::AUProcessingBlock_DSPGraph()
{
  return MEMORY[0x270F0FE48]();
}

uint64_t DSPGraph::ABIVersion(DSPGraph *this)
{
  return MEMORY[0x270F0FE50](this);
}

uint64_t DSPGraph::Interpreter::compileFile()
{
  return MEMORY[0x270F0FE58]();
}

uint64_t DSPGraph::Interpreter::compileText()
{
  return MEMORY[0x270F0FE60]();
}

uint64_t DSPGraph::NewBoxRegistry::NewBoxRegistry(DSPGraph::NewBoxRegistry *this)
{
  return MEMORY[0x270F0FE70](this);
}

uint64_t DSPGraph::ThrowException()
{
  return MEMORY[0x270F0FE78]();
}

uint64_t DSPGraph::Box::initialize(DSPGraph::Box *this)
{
  return MEMORY[0x270F0FE80](this);
}

uint64_t DSPGraph::Box::uninitialize(DSPGraph::Box *this)
{
  return MEMORY[0x270F0FE88](this);
}

uint64_t DSPGraph::Box::totalLatencyInTicks(DSPGraph::Box *this)
{
  return MEMORY[0x270F0FE90](this);
}

uint64_t DSPGraph::Box::totalLatencyInSamples(DSPGraph::Box *this)
{
  return MEMORY[0x270F0FEA0](this);
}

uint64_t DSPGraph::Box::Box(DSPGraph::Box *this)
{
  return MEMORY[0x270F0FEB8](this);
}

void DSPGraph::Box::~Box(DSPGraph::Box *this)
{
}

uint64_t DSPGraph::Graph::initialize(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FEC8](this);
}

uint64_t DSPGraph::Graph::setAUStrip(DSPGraph::Graph *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F0FED0](this, a2);
}

uint64_t DSPGraph::Graph::unconfigure(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FED8](this);
}

uint64_t DSPGraph::Graph::uninitialize(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FEE0](this);
}

uint64_t DSPGraph::Graph::processMultiple()
{
  return MEMORY[0x270F0FEF8]();
}

uint64_t DSPGraph::Graph::setPropertyStrip(DSPGraph::Graph *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F0FF08](this, a2);
}

uint64_t DSPGraph::Graph::setSliceDuration()
{
  return MEMORY[0x270F0FF18]();
}

uint64_t DSPGraph::Graph::add()
{
  return MEMORY[0x270F0FF30]();
}

uint64_t DSPGraph::Graph::box()
{
  return MEMORY[0x270F0FF38]();
}

uint64_t DSPGraph::Graph::reset(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FF40](this);
}

uint64_t DSPGraph::Graph::connect()
{
  return MEMORY[0x270F0FF48]();
}

uint64_t DSPGraph::Graph::addInput()
{
  return MEMORY[0x270F0FF50]();
}

uint64_t DSPGraph::Graph::addOutput()
{
  return MEMORY[0x270F0FF58]();
}

uint64_t DSPGraph::Graph::configure(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FF60](this);
}

uint64_t DSPGraph::Graph::preflight()
{
  return MEMORY[0x270F0FF68]();
}

uint64_t DSPGraph::Graph::Graph(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FF70](this);
}

uint64_t DSPGraph::Buffer::copyTimeFrom()
{
  return MEMORY[0x270F0FF78]();
}

uint64_t DSPGraph::Buffer::copyFrom()
{
  return MEMORY[0x270F0FF80]();
}

uint64_t DSPGraph::strprintf(DSPGraph *this, const char *a2, ...)
{
  return MEMORY[0x270F0FF88](this, a2);
}

uint64_t DSPGraph::Box::sampleRate(DSPGraph::Box *this)
{
  return MEMORY[0x270F0FF90](this);
}

uint64_t DSPGraph::Graph::numOutputs(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FF98](this);
}

uint64_t DSPGraph::Graph::hasParameter(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FFA0](this);
}

uint64_t DSPGraph::Graph::in(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FFB0](this);
}

uint64_t DSPGraph::Graph::out(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FFB8](this);
}

uint64_t DSPGraph::Graph::numInputs(DSPGraph::Graph *this)
{
  return MEMORY[0x270F0FFC0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
}

void std::this_thread::sleep_for (const std::chrono::nanoseconds *__ns)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

BOOL std::mutex::try_lock(std::mutex *this)
{
  return MEMORY[0x270F98BB0](this);
}

void std::mutex::~mutex(std::mutex *this)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x270ED8050]();
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDAEE0](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB680](__s, *(void *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x270EDBB00](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
}