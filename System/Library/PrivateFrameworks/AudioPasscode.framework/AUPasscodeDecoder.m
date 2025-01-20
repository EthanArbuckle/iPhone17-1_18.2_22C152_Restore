@interface AUPasscodeDecoder
+ (AudioComponentDescription)getAUDesc;
+ (id)supportedDecoders;
+ (void)registerAU;
- (APCListenerResultData)resultData;
- (AUPasscodeCodecConfiguration)codecConfig;
- (AUPasscodeDecoder)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5;
- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3;
- (OS_dispatch_queue)dispatchQueue;
- (id).cxx_construct;
- (id)dataHandler;
- (id)inputBusses;
- (id)internalRenderBlock;
- (id)outputBusses;
- (void)deallocateRenderResources;
- (void)handleDecodedData:(void *)a3 ofLength:(int)a4;
- (void)setCodecConfig:(id)a3;
- (void)setDataHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setRenderingOffline:(BOOL)a3;
- (void)setResultData:(id)a3;
- (void)startAudioLogCapture;
- (void)stopAudioLogCapture;
@end

@implementation AUPasscodeDecoder

+ (AudioComponentDescription)getAUDesc
{
  *(_OWORD *)&retstr->componentType = xmmword_237D32B50;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (void)registerAU
{
  if (+[AUPasscodeDecoder registerAU]::gOnce != -1) {
    dispatch_once(&+[AUPasscodeDecoder registerAU]::gOnce, &__block_literal_global_1);
  }
}

uint64_t __31__AUPasscodeDecoder_registerAU__block_invoke()
{
  v0 = (void *)MEMORY[0x263F28DA0];
  uint64_t v1 = objc_opt_class();
  +[AUPasscodeDecoder getAUDesc];
  return [v0 registerSubclass:v1 asComponentDescription:v3 name:@"AUPasscodeDecoder" version:1];
}

+ (id)supportedDecoders
{
  return +[APCCodecInfo supportedDecoders];
}

- (AUPasscodeDecoder)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  v23[9] = *MEMORY[0x263EF8340];
  AudioComponentDescription v21 = *a3;
  v20.receiver = self;
  v20.super_class = (Class)AUPasscodeDecoder;
  v5 = [(AUAudioUnit *)&v20 initWithComponentDescription:&v21 options:*(void *)&a4 error:a5];
  if (v5)
  {
    v6 = (AVAudioFormat *)[objc_alloc(MEMORY[0x263EF9388]) initStandardFormatWithSampleRate:1 channels:48000.0];
    BufferedAudioBus::init((BufferedAudioBus *)(v5 + 592), v6, 8);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F28DA8]) initWithFormat:v6 error:0];
    v8 = (void *)*((void *)v5 + 79);
    *((void *)v5 + 79) = v7;

    id v9 = objc_alloc(MEMORY[0x263F28DB0]);
    v23[0] = *((void *)v5 + 74);
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v11 = [v9 initWithAudioUnit:v5 busType:1 busses:v10];
    v12 = (void *)*((void *)v5 + 80);
    *((void *)v5 + 80) = v11;

    id v13 = objc_alloc(MEMORY[0x263F28DB0]);
    uint64_t v22 = *((void *)v5 + 79);
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
    uint64_t v15 = [v13 initWithAudioUnit:v5 busType:2 busses:v14];
    v16 = (void *)*((void *)v5 + 81);
    *((void *)v5 + 81) = v15;

    uint64_t v17 = *((void *)v5 + 82);
    unint64_t v18 = *((void *)v5 + 83) - v17;
    if (v18 > 0x107)
    {
      if (v18 != 264) {
        *((void *)v5 + 83) = v17 + 264;
      }
    }
    else
    {
      std::vector<signed char>::__append((unint64_t *)v5 + 82, 264 - v18);
    }
    operator new();
  }

  return 0;
}

- (id)inputBusses
{
  return *((id *)self + 80);
}

- (id)outputBusses
{
  return *((id *)self + 81);
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v6 = [(AUPasscodeDecoder *)self codecConfig];

  if (!v6) {
    goto LABEL_40;
  }
  uint64_t v7 = [(AUPasscodeDecoder *)self codecConfig];
  uint64_t v8 = [v7 numChannels];

  if (v8 > 1) {
    goto LABEL_40;
  }
  id v9 = [*((id *)self + 79) format];
  v10 = [*((id *)self + 74) format];
  if (![v9 isEqual:v10]) {
    goto LABEL_7;
  }
  uint64_t v11 = [*((id *)self + 79) format];
  int v12 = [v11 isInterleaved];
  if (v12)
  {
    v3 = [*((id *)self + 79) format];
    if ([v3 channelCount] > 1)
    {

LABEL_7:
      goto LABEL_14;
    }
  }
  id v13 = [*((id *)self + 79) format];
  char v14 = [v13 isStandard];

  if (v12) {
  if ((v14 & 1) == 0)
  }
  {
LABEL_14:
    if (a3)
    {
LABEL_15:
      id v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-10875 userInfo:0];
      LOBYTE(v20) = 0;
      *a3 = v19;
      return v20;
    }
LABEL_40:
    LOBYTE(v20) = 0;
    return v20;
  }
  uint64_t v15 = [*((id *)self + 74) format];
  unsigned int v16 = [v15 channelCount];
  uint64_t v17 = [(AUPasscodeDecoder *)self codecConfig];
  uint64_t v18 = [v17 numChannels];

  if (v18 > v16)
  {
    if (a3) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
  BufferedAudioBus::allocateRenderResources((BufferedAudioBus *)((char *)self + 592), [(AUAudioUnit *)self maximumFramesToRender]);
  *((_DWORD *)self + 196) = [*((id *)self + 112) numChannels];
  AudioComponentDescription v21 = [*((id *)self + 80) objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 format];
  *((_DWORD *)self + 197) = [v22 channelCount];

  v23 = [*((id *)self + 80) objectAtIndexedSubscript:0];
  v24 = [v23 format];
  [v24 sampleRate];
  double v26 = v25;
  unsigned int v51 = 0;
  v52.__r_.__value_.__r.__words[0] = (std::string::size_type)&v51;
  v27 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)self + 95, &v51, (uint64_t)&std::piecewise_construct, &v52);
  v28 = (void (**)(uint64_t, void, std::string *, void, void))(v27 + 5);
  HIDWORD(__p.__r_.__value_.__r.__words[1]) = 0;
  LODWORD(__p.__r_.__value_.__r.__words[1]) = (v26 + 0.5);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  if (&__p != (std::string *)(v27 + 5))
  {
    v29 = *v28;
    if (*v28)
    {
      *(_OWORD *)&v52.__r_.__value_.__l.__data_ = 0uLL;
      v29(2, v28, &v52, 0, 0);
      ((void (*)(uint64_t, std::string *, void, void, void))__p.__r_.__value_.__l.__data_)(2, &__p, v28, 0, 0);
      ((void (*)(uint64_t, std::string *, std::string *, void, void))v52.__r_.__value_.__l.__data_)(2, &v52, &__p, 0, 0);
      std::any::reset[abi:ne180100](&v52);
    }
    else
    {
      *((_DWORD *)v27 + 12) = (v26 + 0.5);
      v27[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      __p.__r_.__value_.__r.__words[0] = 0;
    }
  }
  std::any::reset[abi:ne180100](&__p);

  unsigned int v51 = 1;
  v52.__r_.__value_.__r.__words[0] = (std::string::size_type)&v51;
  v30 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)self + 95, &v51, (uint64_t)&std::piecewise_construct, &v52);
  v31 = (void (**)(uint64_t, void, std::string *, void, void))(v30 + 5);
  unsigned int v32 = *((_DWORD *)self + 196);
  __p.__r_.__value_.__l.__size_ = v32;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
  if (&__p != (std::string *)(v30 + 5))
  {
    v33 = *v31;
    if (*v31)
    {
      *(_OWORD *)&v52.__r_.__value_.__l.__data_ = 0uLL;
      v33(2, v31, &v52, 0, 0);
      ((void (*)(uint64_t, std::string *, void, void, void))__p.__r_.__value_.__l.__data_)(2, &__p, v31, 0, 0);
      ((void (*)(uint64_t, std::string *, std::string *, void, void))v52.__r_.__value_.__l.__data_)(2, &v52, &__p, 0, 0);
      std::any::reset[abi:ne180100](&v52);
    }
    else
    {
      *((_DWORD *)v30 + 12) = v32;
      v30[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      __p.__r_.__value_.__r.__words[0] = 0;
    }
  }
  std::any::reset[abi:ne180100](&__p);
  v34 = [*((id *)self + 80) objectAtIndexedSubscript:0];
  v35 = [v34 format];
  unsigned __int8 v36 = [v35 isInterleaved];
  unsigned int v51 = 2;
  v52.__r_.__value_.__r.__words[0] = (std::string::size_type)&v51;
  v37 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)self + 95, &v51, (uint64_t)&std::piecewise_construct, &v52);
  v38 = (void (**)(uint64_t, void, std::string *, void, void))(v37 + 5);
  __p.__r_.__value_.__l.__size_ = v36;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
  if (&__p != (std::string *)(v37 + 5))
  {
    v39 = *v38;
    if (*v38)
    {
      *(_OWORD *)&v52.__r_.__value_.__l.__data_ = 0uLL;
      v39(2, v38, &v52, 0, 0);
      ((void (*)(uint64_t, std::string *, void, void, void))__p.__r_.__value_.__l.__data_)(2, &__p, v38, 0, 0);
      ((void (*)(uint64_t, std::string *, std::string *, void, void))v52.__r_.__value_.__l.__data_)(2, &v52, &__p, 0, 0);
      std::any::reset[abi:ne180100](&v52);
    }
    else
    {
      *((unsigned char *)v37 + 48) = v36;
      v37[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      __p.__r_.__value_.__r.__words[0] = 0;
    }
  }
  std::any::reset[abi:ne180100](&__p);

  v40 = [(AUPasscodeDecoder *)self codecConfig];
  +[APCCodecFactory createDecoderWithConfig:v40 apcConfig:(char *)self + 760 error:a3];
  std::string::size_type v41 = v52.__r_.__value_.__r.__words[0];
  v52.__r_.__value_.__r.__words[0] = 0;
  uint64_t v42 = *((void *)self + 73);
  *((void *)self + 73) = v41;
  if (v42)
  {
    (*(void (**)(uint64_t))(*(void *)v42 + 8))(v42);
    std::string::size_type v43 = v52.__r_.__value_.__r.__words[0];
    v52.__r_.__value_.__r.__words[0] = 0;
    if (v43) {
      (*(void (**)(std::string::size_type))(*(void *)v43 + 8))(v43);
    }
  }

  if (!*((void *)self + 73))
  {
    if (a3 && [*a3 code] == -7)
    {
      *a3 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-10868 userInfo:0];
    }
    [(AUAudioUnit *)self setRenderResourcesAllocated:0];
    goto LABEL_40;
  }
  v50.receiver = self;
  v50.super_class = (Class)AUPasscodeDecoder;
  BOOL v20 = [(AUAudioUnit *)&v50 allocateRenderResourcesAndReturnError:a3];
  if (v20)
  {
    v44 = (caulk::concurrent::messenger *)std::string::basic_string[abi:ne180100]<0>(&__p, "AUPasscodeDecoder messenger");
    uint64_t v45 = caulk::concurrent::messenger::shared_logging_priority(v44);
    if (*(unsigned char *)(v45 + 52))
    {
      uint64_t v46 = v45 + 32;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&v52, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        char v53 = 1;
        int v48 = *(_DWORD *)(v46 + 16);
        long long v54 = *(_OWORD *)v46;
        int v55 = v48;
        char v56 = 1;
        char v57 = 0;
        char v58 = 0;
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string v52 = __p;
        char v53 = 1;
        int v47 = *(_DWORD *)(v45 + 48);
        long long v54 = *(_OWORD *)v46;
        int v55 = v47;
        char v56 = 1;
        char v57 = 0;
        char v58 = 0;
      }
      unsigned int v51 = 1;
      std::make_unique[abi:ne180100]<caulk::concurrent::messenger,caulk::concurrent::messenger::thread_strategy,caulk::thread::attributes const&>();
    }
    std::__throw_bad_optional_access[abi:ne180100]();
  }
  return v20;
}

- (void)setRenderingOffline:(BOOL)a3
{
  *((unsigned char *)self + 800) = a3;
  v3.receiver = self;
  v3.super_class = (Class)AUPasscodeDecoder;
  -[AUAudioUnit setRenderingOffline:](&v3, sel_setRenderingOffline_);
}

- (void)deallocateRenderResources
{
  objc_super v3 = (char *)self + 592;
  v4 = (void *)*((void *)self + 76);
  *((void *)self + 76) = 0;

  *((void *)v3 + 3) = 0;
  *((void *)v3 + 4) = 0;
  v5.receiver = self;
  v5.super_class = (Class)AUPasscodeDecoder;
  [(AUAudioUnit *)&v5 deallocateRenderResources];
}

- (id)internalRenderBlock
{
  objc_super v3 = (char *)self + 584;
  v4 = (char *)self + 592;
  objc_super v5 = (char *)self + 800;
  v6 = (char *)self + 808;
  uint64_t v7 = (char *)self + 656;
  uint64_t v8 = (char *)self + 680;
  id v9 = (char *)self + 576;
  v10 = [(AUPasscodeDecoder *)self dataHandler];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __40__AUPasscodeDecoder_internalRenderBlock__block_invoke;
  v13[3] = &unk_264CFE4D8;
  v13[6] = v6;
  v13[7] = v3;
  v13[8] = v7;
  v13[9] = v5;
  v13[10] = v8;
  v13[11] = v9;
  v13[4] = v10;
  v13[5] = v4;
  v13[12] = (char *)self + 904;
  v13[13] = (char *)self + 816;
  uint64_t v11 = (void *)MEMORY[0x237E2DE80](v13);

  return v11;
}

uint64_t __40__AUPasscodeDecoder_internalRenderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void *a8)
{
  id v12 = a8;
  int v29 = 0;
  uint64_t v13 = BufferedInputBus::pullInput(*(BufferedInputBus **)(a1 + 40), (uint64_t)&v29, a3, a4, 0, v12);
  if (!v13)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 32);
    if (!*((void *)a6 + 2))
    {
      uint64_t v15 = *a6;
      if (v15)
      {
        unsigned int v16 = (uint64_t *)(v14 + 16);
        uint64_t v17 = a6 + 4;
        do
        {
          uint64_t v18 = *v16;
          v16 += 2;
          *uint64_t v17 = v18;
          v17 += 2;
          --v15;
        }
        while (v15);
      }
    }
    uint64_t v19 = *(void *)(v14 + 16);
    int v28 = 256;
    uint64_t v20 = **(void **)(a1 + 48);
    if (v20) {
      (*(void (**)(uint64_t, uint64_t))(*(void *)v20 + 16))(v20, v19);
    }
    (*(void (**)(void, uint64_t, uint64_t, void, int *))(***(void ***)(a1 + 56) + 16))(**(void **)(a1 + 56), v19, a4, **(void **)(a1 + 64), &v28);
    int v21 = v28;
    if (v28)
    {
      if (**(unsigned char **)(a1 + 72))
      {
        uint64_t v22 = [MEMORY[0x263EFF8F8] dataWithBytes:**(void **)(a1 + 64) length:v28];
        uint64_t v23 = *(void *)(a1 + 32);
        if (v23) {
          (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v22);
        }
      }
      else
      {
        uint64_t v24 = 0;
        do
        {
          uint64_t v25 = *(void *)(*(void *)(a1 + 80) + v24);
          v24 += 8;
        }
        while (*(unsigned char *)(v25 + 60));
        memcpy(*(void **)(v25 + 32), **(const void ***)(a1 + 64), v28);
        *(_DWORD *)(v25 + 56) = v21;
        *(unsigned char *)(v25 + 60) = 1;
        caulk::concurrent::messenger::enqueue(**(caulk::concurrent::messenger ***)(a1 + 88), (caulk::concurrent::message *)v25);
      }
      if (**(void **)(a1 + 96))
      {
        double v26 = *(std::mutex **)(a1 + 104);
        std::mutex::lock(v26);
        [**(id **)(a1 + 96) setCompletionTime:*(void *)(**(void **)(a1 + 64) + v28)];
        std::mutex::unlock(v26);
      }
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (void)handleDecodedData:(void *)a3 ofLength:(int)a4
{
  [*((id *)self + 99) appendBytes:a3 length:a4];
  unint64_t v5 = [*((id *)self + 99) length];
  if (v5 >= [*((id *)self + 112) payloadLengthBytes])
  {
    v6 = [MEMORY[0x263EFF8F8] dataWithData:*((void *)self + 99)];
    [*((id *)self + 99) setLength:0];
    uint64_t v7 = [(AUPasscodeDecoder *)self dataHandler];

    if (v7)
    {
      uint64_t v8 = [(AUPasscodeDecoder *)self dispatchQueue];
      id v9 = v8;
      if (!v8)
      {
        id v9 = MEMORY[0x263EF83A0];
        id v10 = MEMORY[0x263EF83A0];
      }
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __48__AUPasscodeDecoder_handleDecodedData_ofLength___block_invoke;
      v11[3] = &unk_264CFE500;
      v11[4] = self;
      v11[5] = v6;
      dispatch_async(v9, v11);
      if (!v8) {
    }
      }
  }
}

void __48__AUPasscodeDecoder_handleDecodedData_ofLength___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dataHandler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)startAudioLogCapture
{
  uint64_t v11 = 0;
  objc_super v3 = [*((id *)self + 80) objectAtIndexedSubscript:0];
  v4 = [v3 format];
  [v4 sampleRate];
  uint64_t v8 = v5;
  long long v9 = xmmword_237D32B60;
  uint64_t v10 = 0x100000004;
  LODWORD(v11) = 32;

  if (NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once != -1) {
    dispatch_once(&NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::once, &__block_literal_global_106);
  }
  v6 = NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction;
  if (NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction) {
    v6 = (uint64_t (*)(void, void, void, void, void, void))NewAudioCapturer(AudioCapturerOptions,char const*,char const*,unsigned int,AudioStreamBasicDescription const*,AudioStreamBasicDescription const&)::sImplFunction(69906, "/tmp/APCCaptures", "apc_capture", 1667327590, 0, &v8);
  }
  uint64_t v7 = *((void *)self + 101);
  *((void *)self + 101) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

- (void)stopAudioLogCapture
{
  uint64_t v3 = *((void *)self + 101);
  *((void *)self + 101) = 0;
  if (v3) {
    (*(void (**)(void))(*(void *)v3 + 8))();
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return (OS_dispatch_queue *)*((void *)self + 110);
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)dataHandler
{
  return (id)*((void *)self + 111);
}

- (void)setDataHandler:(id)a3
{
}

- (AUPasscodeCodecConfiguration)codecConfig
{
  return (AUPasscodeCodecConfiguration *)*((void *)self + 112);
}

- (void)setCodecConfig:(id)a3
{
}

- (APCListenerResultData)resultData
{
  return (APCListenerResultData *)*((void *)self + 113);
}

- (void)setResultData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 113, 0);
  objc_storeStrong((id *)self + 112, 0);
  objc_storeStrong((id *)self + 111, 0);
  objc_storeStrong((id *)self + 110, 0);
  std::mutex::~mutex((std::mutex *)((char *)self + 816));
  uint64_t v3 = *((void *)self + 101);
  *((void *)self + 101) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  objc_storeStrong((id *)self + 99, 0);
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)self + 760, *((void **)self + 96));
  v4 = (char *)self + 680;
  for (uint64_t i = 72; i != -8; i -= 8)
  {
    uint64_t v6 = *(void *)&v4[i];
    *(void *)&v4[i] = 0;
    if (v6) {
      std::default_delete<DecodedDataMessage>::operator()[abi:ne180100]((uint64_t)&v4[i], v6);
    }
  }
  uint64_t v7 = (void *)*((void *)self + 82);
  if (v7)
  {
    *((void *)self + 83) = v7;
    operator delete(v7);
  }
  objc_storeStrong((id *)self + 81, 0);
  objc_storeStrong((id *)self + 80, 0);
  objc_storeStrong((id *)self + 79, 0);

  uint64_t v8 = *((void *)self + 73);
  *((void *)self + 73) = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }

  std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)self + 72, 0);
}

- (id).cxx_construct
{
  *((void *)self + 72) = 0;
  *((void *)self + 73) = 0;
  *((void *)self + 74) = 0;
  *((_DWORD *)self + 150) = 0;
  *((void *)self + 77) = 0;
  *((void *)self + 78) = 0;
  *((void *)self + 76) = 0;
  *((void *)self + 83) = 0;
  *((void *)self + 84) = 0;
  *((void *)self + 82) = 0;
  *(_OWORD *)((char *)self + 680) = 0u;
  *(_OWORD *)((char *)self + 696) = 0u;
  *(_OWORD *)((char *)self + 712) = 0u;
  *(_OWORD *)((char *)self + 728) = 0u;
  *(_OWORD *)((char *)self + 744) = 0u;
  *((void *)self + 97) = 0;
  *((void *)self + 96) = 0;
  *((void *)self + 95) = (char *)self + 768;
  *((void *)self + 101) = 0;
  *((void *)self + 102) = 850045863;
  *(_OWORD *)((char *)self + 824) = 0u;
  *(_OWORD *)((char *)self + 840) = 0u;
  *(_OWORD *)((char *)self + 856) = 0u;
  *((void *)self + 109) = 0;
  return self;
}

@end