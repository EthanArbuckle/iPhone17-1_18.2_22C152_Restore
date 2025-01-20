@interface AUPasscodeEncoder
+ (AudioComponentDescription)getAUDesc;
+ (id)supportedEncoders;
+ (void)registerAU;
- (AUPasscodeCodecConfiguration)codecConfig;
- (AUPasscodeEncoder)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5;
- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3;
- (BOOL)canProcessInPlace;
- (BOOL)embedPasscode;
- (BOOL)silenceOutputOnNextAssetEnding;
- (BOOL)triggerFadeOut;
- (NSData)payload;
- (NSMutableDictionary)passcodeEmbedInfo;
- (OS_dispatch_queue)dispatchQueue;
- (float)fadeOutTimeSeconds;
- (id).cxx_construct;
- (id)assetEndedAndSilencedHandler;
- (id)inputBusses;
- (id)internalRenderBlock;
- (id)outputBusses;
- (int64_t)assetLength;
- (unint64_t)numLoopsToStopAfter;
- (void)dealloc;
- (void)deallocateRenderResources;
- (void)handleEOFReachedForAsset;
- (void)reset;
- (void)setAssetEndedAndSilencedHandler:(id)a3;
- (void)setAssetLength:(int64_t)a3;
- (void)setCodecConfig:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEmbedPasscode:(BOOL)a3;
- (void)setFadeOutTimeSeconds:(float)a3;
- (void)setNumLoopsToStopAfter:(unint64_t)a3;
- (void)setPasscodeEmbedInfo:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSilenceOutputOnNextAssetEnding:(BOOL)a3;
- (void)setTriggerFadeOut:(BOOL)a3;
@end

@implementation AUPasscodeEncoder

+ (id)supportedEncoders
{
  return +[APCCodecInfo supportedEncoders];
}

+ (AudioComponentDescription)getAUDesc
{
  *(_OWORD *)&retstr->componentType = xmmword_237D32BB0;
  retstr->componentFlagsMask = 0;
  return result;
}

+ (void)registerAU
{
  if (+[AUPasscodeEncoder registerAU]::gOnce != -1) {
    dispatch_once(&+[AUPasscodeEncoder registerAU]::gOnce, &__block_literal_global_2);
  }
}

uint64_t __31__AUPasscodeEncoder_registerAU__block_invoke()
{
  v0 = (void *)MEMORY[0x263F28DA0];
  uint64_t v1 = objc_opt_class();
  +[AUPasscodeEncoder getAUDesc];
  return [v0 registerSubclass:v1 asComponentDescription:v3 name:@"AUPasscodeEncoder" version:1];
}

- (AUPasscodeEncoder)initWithComponentDescription:(AudioComponentDescription *)a3 options:(unsigned int)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  AudioComponentDescription v38 = *a3;
  v37.receiver = self;
  v37.super_class = (Class)AUPasscodeEncoder;
  v5 = [(AUAudioUnit *)&v37 initWithComponentDescription:&v38 options:*(void *)&a4 error:a5];
  if (v5)
  {
    v6 = (AVAudioFormat *)[objc_alloc(MEMORY[0x263EF9388]) initStandardFormatWithSampleRate:1 channels:44100.0];
    BufferedAudioBus::init((BufferedAudioBus *)(v5 + 584), v6, 8);
    uint64_t v7 = [objc_alloc(MEMORY[0x263F28DA8]) initWithFormat:v6 error:0];
    v8 = (void *)*((void *)v5 + 78);
    *((void *)v5 + 78) = v7;

    id v9 = objc_alloc(MEMORY[0x263F28DB0]);
    uint64_t v47 = *((void *)v5 + 73);
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v47 count:1];
    uint64_t v11 = [v9 initWithAudioUnit:v5 busType:1 busses:v10];
    v12 = (void *)*((void *)v5 + 79);
    *((void *)v5 + 79) = v11;

    id v13 = objc_alloc(MEMORY[0x263F28DB0]);
    uint64_t v46 = *((void *)v5 + 78);
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
    uint64_t v15 = [v13 initWithAudioUnit:v5 busType:2 busses:v14];
    v16 = (void *)*((void *)v5 + 80);
    *((void *)v5 + 80) = v15;

    [(AVAudioFormat *)v6 sampleRate];
    double v18 = v17;
    unsigned int v36 = 0;
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    v19 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 81, &v36, (uint64_t)&std::piecewise_construct, &v39);
    v20 = (void (**)(uint64_t, void, std::string *, void, void))(v19 + 5);
    HIDWORD(v48.__r_.__value_.__r.__words[1]) = 0;
    LODWORD(v48.__r_.__value_.__r.__words[1]) = (v18 + 0.5);
    v48.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    if (&v48 != (std::string *)(v19 + 5))
    {
      v21 = *v20;
      if (*v20)
      {
        *(_OWORD *)&v39.__r_.__value_.__l.__data_ = 0uLL;
        v21(2, v20, &v39, 0, 0);
        ((void (*)(uint64_t, std::string *, void, void, void))v48.__r_.__value_.__l.__data_)(2, &v48, v20, 0, 0);
        ((void (*)(uint64_t, std::string *, std::string *, void, void))v39.__r_.__value_.__l.__data_)(2, &v39, &v48, 0, 0);
        std::any::reset[abi:ne180100](&v39);
      }
      else
      {
        *((_DWORD *)v19 + 12) = (v18 + 0.5);
        v19[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        v48.__r_.__value_.__r.__words[0] = 0;
      }
    }
    std::any::reset[abi:ne180100](&v48);
    AVAudioChannelCount v22 = [(AVAudioFormat *)v6 channelCount];
    unsigned int v36 = 1;
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    v23 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 81, &v36, (uint64_t)&std::piecewise_construct, &v39);
    v24 = (void (**)(uint64_t, void, std::string *, void, void))(v23 + 5);
    v48.__r_.__value_.__l.__size_ = v22;
    v48.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
    if (&v48 != (std::string *)(v23 + 5))
    {
      v25 = *v24;
      if (*v24)
      {
        *(_OWORD *)&v39.__r_.__value_.__l.__data_ = 0uLL;
        v25(2, v24, &v39, 0, 0);
        ((void (*)(uint64_t, std::string *, void, void, void))v48.__r_.__value_.__l.__data_)(2, &v48, v24, 0, 0);
        ((void (*)(uint64_t, std::string *, std::string *, void, void))v39.__r_.__value_.__l.__data_)(2, &v39, &v48, 0, 0);
        std::any::reset[abi:ne180100](&v39);
      }
      else
      {
        *((_DWORD *)v23 + 12) = v22;
        v23[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
        v48.__r_.__value_.__r.__words[0] = 0;
      }
    }
    std::any::reset[abi:ne180100](&v48);
    BOOL v26 = [(AVAudioFormat *)v6 isInterleaved];
    unsigned int v36 = 2;
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    v27 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)v5 + 81, &v36, (uint64_t)&std::piecewise_construct, &v39);
    v28 = (void (**)(uint64_t, void, std::string *, void, void))(v27 + 5);
    v48.__r_.__value_.__l.__size_ = v26;
    v48.__r_.__value_.__r.__words[0] = (std::string::size_type)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
    if (&v48 != (std::string *)(v27 + 5))
    {
      v29 = *v28;
      if (*v28)
      {
        *(_OWORD *)&v39.__r_.__value_.__l.__data_ = 0uLL;
        v29(2, v28, &v39, 0, 0);
        ((void (*)(uint64_t, std::string *, void, void, void))v48.__r_.__value_.__l.__data_)(2, &v48, v28, 0, 0);
        ((void (*)(uint64_t, std::string *, std::string *, void, void))v39.__r_.__value_.__l.__data_)(2, &v39, &v48, 0, 0);
        std::any::reset[abi:ne180100](&v39);
      }
      else
      {
        *((unsigned char *)v27 + 48) = v26;
        v27[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
        v48.__r_.__value_.__r.__words[0] = 0;
      }
    }
    std::any::reset[abi:ne180100](&v48);
    *((void *)v5 + 94) = 0;
    v5[728] = 0;
    *((_DWORD *)v5 + 183) = 1050253722;
    v5[729] = 0;
    v5[680] = 0;
    *((_DWORD *)v5 + 176) = 0;
    *((_DWORD *)v5 + 177) = 0;
    v5[730] = 1;
    *((void *)v5 + 95) = 0;
    *((void *)v5 + 89) = 0;
    *((void *)v5 + 90) = 0;
    v30 = (caulk::concurrent::messenger *)std::string::basic_string[abi:ne180100]<0>(&v48, "AUPasscodeEncoder messenger");
    uint64_t v31 = caulk::concurrent::messenger::shared_logging_priority(v30);
    if (*(unsigned char *)(v31 + 52))
    {
      uint64_t v32 = v31 + 32;
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&v39, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
        char v40 = 1;
        int v34 = *(_DWORD *)(v32 + 16);
        long long v41 = *(_OWORD *)v32;
        int v42 = v34;
        char v43 = 1;
        char v44 = 0;
        char v45 = 0;
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v48.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        std::string v39 = v48;
        char v40 = 1;
        int v33 = *(_DWORD *)(v31 + 48);
        long long v41 = *(_OWORD *)v32;
        int v42 = v33;
        char v43 = 1;
        char v44 = 0;
        char v45 = 0;
      }
      operator new();
    }
    std::__throw_bad_optional_access[abi:ne180100]();
  }

  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AUPasscodeEncoder;
  [(AUAudioUnit *)&v2 dealloc];
}

- (void)handleEOFReachedForAsset
{
  if (self->_assetEndedAndSilencedHandler)
  {
    v3 = [(AUPasscodeEncoder *)self dispatchQueue];
    if (v3) {
      [(AUPasscodeEncoder *)self dispatchQueue];
    }
    else {
    v4 = dispatch_get_global_queue(0, 0);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__AUPasscodeEncoder_handleEOFReachedForAsset__block_invoke;
    block[3] = &unk_264CFE468;
    block[4] = self;
    dispatch_async(v4, block);
  }
}

uint64_t __45__AUPasscodeEncoder_handleEOFReachedForAsset__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 776) + 16))();
}

- (id)inputBusses
{
  return self->_inputBusArray;
}

- (id)outputBusses
{
  return self->_outputBusArray;
}

- (BOOL)allocateRenderResourcesAndReturnError:(id *)a3
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  v4 = [(AUPasscodeEncoder *)self codecConfig];
  if (!v4) {
    goto LABEL_12;
  }
  v5 = [(AUPasscodeEncoder *)self payload];
  if (!v5)
  {

    goto LABEL_12;
  }
  int64_t v6 = [(AUPasscodeEncoder *)self assetLength];

  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = [(AUPasscodeEncoder *)self codecConfig];
  uint64_t v8 = [v7 numChannels];

  if (v8 > 1) {
    goto LABEL_12;
  }
  p_inputBus = &self->_inputBus;
  v10 = [(AUAudioUnitBus *)self->_inputBus.bus format];
  int v11 = [v10 isInterleaved];
  if (v11)
  {
    v66 = [(AUAudioUnitBus *)p_inputBus->bus format];
    if ([v66 channelCount] > 1) {
      goto LABEL_15;
    }
  }
  v12 = [(AUAudioUnitBus *)p_inputBus->bus format];
  if (![v12 isStandard])
  {

    if (!v11)
    {
LABEL_16:

      goto LABEL_24;
    }
LABEL_15:

    goto LABEL_16;
  }
  id v13 = [(AUAudioUnitBus *)self->_outputBus format];
  int v14 = [v13 isInterleaved];
  char v15 = v14;
  if (v14)
  {
    v16 = [(AUAudioUnitBus *)self->_outputBus format];
    if ([v16 channelCount] > 1)
    {
      char v17 = 1;
      goto LABEL_20;
    }
    id obj = v16;
  }
  v19 = [(AUAudioUnitBus *)self->_outputBus format];
  char v17 = [v19 isStandard] ^ 1;

  if ((v15 & 1) == 0) {
    goto LABEL_21;
  }
  v16 = obj;
LABEL_20:

LABEL_21:
  if (v11) {

  }
  if ((v17 & 1) == 0)
  {
    v21 = [(AUAudioUnitBus *)self->_outputBus format];
    unsigned int v22 = [v21 channelCount];
    v23 = [(AUPasscodeEncoder *)self codecConfig];
    uint64_t v24 = [v23 numChannels];

    if (v24 <= v22)
    {
      v74.receiver = self;
      v74.super_class = (Class)AUPasscodeEncoder;
      BOOL v18 = [(AUAudioUnit *)&v74 allocateRenderResourcesAndReturnError:a3];
      if (!v18) {
        return v18;
      }
      BufferedAudioBus::allocateRenderResources((BufferedAudioBus *)p_inputBus, [(AUAudioUnit *)self maximumFramesToRender]);
      v25 = [(AUPasscodeEncoder *)self inputBusses];
      BOOL v26 = [v25 objectAtIndexedSubscript:0];
      v27 = [v26 format];
      [v27 sampleRate];
      double v29 = v28;
      unsigned int v73 = 0;
      v78 = &v73;
      p_apcEncoderConfig = (uint64_t **)&self->_apcEncoderConfig;
      v30 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t **)&self->_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
      uint64_t v31 = (void (**)(uint64_t, void, unsigned int **, void, void))(v30 + 5);
      HIDWORD(v77) = 0;
      LODWORD(v77) = (v29 + 0.5);
      v76 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      if (&v76 != (uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *))(v30 + 5))
      {
        uint64_t v32 = *v31;
        if (*v31)
        {
          v78 = 0;
          uint64_t v79 = 0;
          v32(2, v31, &v78, 0, 0);
          v76(2u, (uint64_t)&v76, (uint64_t)v31, 0, 0);
          ((void (*)(uint64_t, unsigned int **, uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *), void, void))v78)(2, &v78, &v76, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v78);
        }
        else
        {
          *((_DWORD *)v30 + 12) = (v29 + 0.5);
          v30[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v76 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v76);

      int v33 = [(AUPasscodeEncoder *)self inputBusses];
      int v34 = [v33 objectAtIndexedSubscript:0];
      v35 = [v34 format];
      unsigned int v36 = [v35 channelCount];
      unsigned int v73 = 1;
      v78 = &v73;
      objc_super v37 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
      AudioComponentDescription v38 = (void (**)(uint64_t, void, unsigned int **, void, void))(v37 + 5);
      uint64_t v77 = v36;
      v76 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
      if (&v76 != (uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *))(v37 + 5))
      {
        std::string v39 = *v38;
        if (*v38)
        {
          v78 = 0;
          uint64_t v79 = 0;
          v39(2, v38, &v78, 0, 0);
          v76(2u, (uint64_t)&v76, (uint64_t)v38, 0, 0);
          ((void (*)(uint64_t, unsigned int **, uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *), void, void))v78)(2, &v78, &v76, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v78);
        }
        else
        {
          *((_DWORD *)v37 + 12) = v36;
          v37[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
          v76 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v76);

      char v40 = [(AUPasscodeEncoder *)self inputBusses];
      long long v41 = [v40 objectAtIndexedSubscript:0];
      int v42 = [v41 format];
      unsigned __int8 v43 = [v42 isInterleaved];
      unsigned int v73 = 2;
      v78 = &v73;
      char v44 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
      char v45 = (void (**)(uint64_t, void, unsigned int **, void, void))(v44 + 5);
      uint64_t v77 = v43;
      v76 = std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
      if (&v76 != (uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *))(v44 + 5))
      {
        uint64_t v46 = *v45;
        if (*v45)
        {
          v78 = 0;
          uint64_t v79 = 0;
          v46(2, v45, &v78, 0, 0);
          v76(2u, (uint64_t)&v76, (uint64_t)v45, 0, 0);
          ((void (*)(uint64_t, unsigned int **, uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *), void, void))v78)(2, &v78, &v76, 0, 0);
          std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v78);
        }
        else
        {
          *((unsigned char *)v44 + 48) = v43;
          v44[5] = (uint64_t *)std::__any_imp::_SmallHandler<BOOL>::__handle[abi:ne180100];
          v76 = 0;
        }
      }
      std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v76);

      uint64_t v47 = self;
      passcodeEmbedInfo = self->_passcodeEmbedInfo;
      if (passcodeEmbedInfo)
      {
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id obja = [(NSMutableDictionary *)passcodeEmbedInfo allKeys];
        uint64_t v49 = [obja countByEnumeratingWithState:&v69 objects:v75 count:16];
        if (v49)
        {
          uint64_t v50 = *(void *)v70;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v70 != v50) {
                objc_enumerationMutation(obja);
              }
              v52 = *(void **)(*((void *)&v69 + 1) + 8 * i);
              v53 = [(NSMutableDictionary *)self->_passcodeEmbedInfo objectForKeyedSubscript:v52];
              unsigned int v54 = [v53 unsignedLongValue];
              unsigned int v73 = [v52 integerValue];
              v78 = &v73;
              v55 = std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(p_apcEncoderConfig, &v73, (uint64_t)&std::piecewise_construct, &v78);
              v56 = (void (**)(uint64_t, void, unsigned int **, void, void))(v55 + 5);
              uint64_t v77 = v54;
              v76 = std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
              if (&v76 != (uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *))(v55 + 5))
              {
                v57 = *v56;
                if (*v56)
                {
                  v78 = 0;
                  uint64_t v79 = 0;
                  v57(2, v56, &v78, 0, 0);
                  v76(2u, (uint64_t)&v76, (uint64_t)v56, 0, 0);
                  ((void (*)(uint64_t, unsigned int **, uint64_t (**)(unsigned int, uint64_t, uint64_t, uint64_t, void *), void, void))v78)(2, &v78, &v76, 0, 0);
                  std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v78);
                }
                else
                {
                  *((_DWORD *)v55 + 12) = v54;
                  v55[5] = (uint64_t *)std::__any_imp::_SmallHandler<unsigned int>::__handle[abi:ne180100];
                  v76 = 0;
                }
              }
              std::any::reset[abi:ne180100]((uint64_t (**)(void, void, void, void, void))&v76);
            }
            uint64_t v49 = [obja countByEnumeratingWithState:&v69 objects:v75 count:16];
          }
          while (v49);
        }

        uint64_t v47 = self;
      }
      v58 = [(AUPasscodeEncoder *)v47 codecConfig];
      v59 = [(AUPasscodeEncoder *)self payload];
      +[APCCodecFactory createEncoderWithConfig:v58 apcConfig:p_apcEncoderConfig payloadData:v59];
      v60 = (APCEncoderBase *)v78;
      v78 = 0;
      value = self->_kernel.__ptr_.__value_;
      self->_kernel.__ptr_.__value_ = v60;
      if (value)
      {
        (*(void (**)(APCEncoderBase *))(*(void *)value + 8))(value);
        v62 = v78;
        v78 = 0;
        if (v62) {
          (*(void (**)(unsigned int *))(*(void *)v62 + 8))(v62);
        }
      }

      if (self->_kernel.__ptr_.__value_)
      {
        self->_assetSampleCount = 0;
        self->_silenceOutputOnNextAssetEnding = 0;
        self->_fadeOutNumSamples = 0;
        self->_triggerFadeOut = 0;
        LOBYTE(v18) = 1;
        self->_embedPasscode = 1;
        self->_loopNumber = 1;
        self->_beginningTime = 0;
        return v18;
      }
      [(AUAudioUnit *)self setRenderResourcesAllocated:0];
    }
    else if (a3)
    {
      goto LABEL_25;
    }
LABEL_12:
    LOBYTE(v18) = 0;
    return v18;
  }
LABEL_24:
  if (!a3) {
    goto LABEL_12;
  }
LABEL_25:
  id v20 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-10875 userInfo:0];
  LOBYTE(v18) = 0;
  *a3 = v20;
  return v18;
}

- (void)deallocateRenderResources
{
  p_inputBus = &self->_inputBus;
  pcmBuffer = self->_inputBus.pcmBuffer;
  self->_inputBus.pcmBuffer = 0;

  p_inputBus->originalAudioBufferList = 0;
  p_inputBus->mutableAudioBufferList = 0;
  v5.receiver = self;
  v5.super_class = (Class)AUPasscodeEncoder;
  [(AUAudioUnit *)&v5 deallocateRenderResources];
}

- (void)reset
{
  self->_outputIsSilenced = 0;
  self->_silenceOutputOnNextAssetEnding = 0;
  self->_assetSampleCount = 0;
  self->_fadeOutNumSamples = 0;
  self->_triggerFadeOut = 0;
  self->_embedPasscode = 1;
  self->_loopNumber = 1;
  self->_beginningTime = 0;
  v2.receiver = self;
  v2.super_class = (Class)AUPasscodeEncoder;
  [(AUAudioUnit *)&v2 reset];
}

- (id)internalRenderBlock
{
  p_inputBus = &self->_inputBus;
  v4 = [(AUAudioUnitBus *)self->_inputBus.bus format];
  [v4 sampleRate];
  uint64_t v6 = v5;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = &self->_passcodeEmbedInfo;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__AUPasscodeEncoder_internalRenderBlock__block_invoke;
  v9[3] = &unk_264CFE5C0;
  v9[6] = &self->_assetSampleCount;
  v9[7] = &self->_beginningTime;
  v9[8] = &self->_assetLength;
  v9[9] = &self->_outputIsSilenced;
  v9[10] = &self->_embedPasscode;
  v9[11] = &self->_kernel;
  v9[4] = v10;
  v9[5] = p_inputBus;
  v9[12] = &self->_triggerFadeOut;
  v9[13] = &self->_fadeOutNumSamples;
  v9[14] = &self->_fadeOutTimeSeconds;
  v9[15] = v6;
  v9[16] = &self->_fadeOutSampleIndex;
  v9[17] = &self->_numLoopsToStopAfter;
  v9[18] = &self->_loopNumber;
  v9[19] = &self->_silenceOutputOnNextAssetEnding;
  v9[20] = &self->_rtMessenger;
  v9[21] = &self->_eofMessage;
  uint64_t v7 = (void *)MEMORY[0x237E2DE80](v9);
  _Block_object_dispose(v10, 8);

  return v7;
}

uint64_t __40__AUPasscodeEncoder_internalRenderBlock__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6, uint64_t a7, void *a8)
{
  id v12 = a8;
  int v55 = 0;
  uint64_t v13 = BufferedInputBus::pullInput(*(BufferedInputBus **)(a1 + 40), (uint64_t)&v55, a3, a4, 0, v12);
  if (!v13)
  {
    id v50 = v12;
    uint64_t v54 = *(void *)(*(void *)(a1 + 40) + 32);
    if (!*((void *)a6 + 2))
    {
      uint64_t v14 = *a6;
      if (v14)
      {
        char v15 = (uint64_t *)(v54 + 16);
        v16 = a6 + 4;
        do
        {
          uint64_t v17 = *v15;
          v15 += 2;
          void *v16 = v17;
          v16 += 2;
          --v14;
        }
        while (v14);
      }
    }
    if (a4)
    {
      unsigned int v18 = 0;
      unint64_t v19 = 0x263F08000uLL;
      unsigned int v20 = a4;
      uint64_t v51 = a4;
      int v52 = a4;
      v53 = a6;
      do
      {
        uint64_t v21 = **(void **)(a1 + 48);
        if (!v21)
        {
          uint64_t v22 = mach_absolute_time();
          v23 = *(uint64_t **)(a1 + 48);
          **(void **)(a1 + 56) = v22;
          uint64_t v21 = *v23;
        }
        unsigned int v24 = **(_DWORD **)(a1 + 64) - v21;
        if (v20 >= v24) {
          uint64_t v25 = v24;
        }
        else {
          uint64_t v25 = v20;
        }
        BOOL v26 = (float *)(*((void *)a6 + 2) + 4 * v18);
        if (**(unsigned char **)(a1 + 72))
        {
          LODWORD(v25) = a4 - v18;
          vDSP_vclr((float *)(*((void *)a6 + 2) + 4 * v18), 1, a4 - v18);
        }
        else
        {
          v27 = (const void *)(*(void *)(v54 + 16) + 4 * v18);
          if (**(unsigned char **)(a1 + 80))
          {
            (*(void (**)(void, const void *, uint64_t, uint64_t))(***(void ***)(a1 + 88) + 16))(**(void **)(a1 + 88), v27, *((void *)a6 + 2) + 4 * v18, v25);
            if (!(*(unsigned int (**)(void))(***(void ***)(a1 + 88) + 32))(**(void **)(a1 + 88))
              && **(void **)(a1 + 56))
            {
              uint64_t v28 = mach_absolute_time();
              unint64_t v29 = v19;
              v30 = **(void ***)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
              uint64_t v31 = [*(id *)(v19 + 2584) numberWithUnsignedInteger:v28 - **(void **)(a1 + 56)];
              uint64_t v32 = [*(id *)(v29 + 2584) numberWithInt:1001];
              [v30 setObject:v31 forKey:v32];

              **(void **)(a1 + 56) = 0;
            }
          }
          else if (v25)
          {
            memmove((void *)(*((void *)a6 + 2) + 4 * v18), v27, 4 * v25);
          }
          int v33 = *(unsigned char **)(a1 + 96);
          if (*v33)
          {
            uint64_t v34 = llround(*(double *)(a1 + 120) * **(float **)(a1 + 112));
            if (v34 <= 1) {
              LODWORD(v34) = 1;
            }
            **(_DWORD **)(a1 + 104) = v34;
            **(_DWORD **)(a1 + 128) = 0;
            *int v33 = 0;
          }
          unint64_t v35 = **(void **)(a1 + 136);
          if (v35 && v35 <= **(void **)(a1 + 144)) {
            **(unsigned char **)(a1 + 152) = 1;
          }
          if (**(_DWORD **)(a1 + 104)) {
            BOOL v36 = v25 == 0;
          }
          else {
            BOOL v36 = 1;
          }
          if (!v36)
          {
            uint64_t v37 = v25;
            do
            {
              AudioComponentDescription v38 = *(unsigned char **)(a1 + 72);
              if (*v38)
              {
                *BOOL v26 = 0.0;
              }
              else
              {
                std::string v39 = *(unsigned int **)(a1 + 128);
                unsigned int v40 = *v39;
                long long v41 = *(unsigned int **)(a1 + 104);
                float v42 = (float)*v39 / (float)*v41;
                float v43 = *v26;
                *BOOL v26 = (float)(1.0 - v42) * (float)(v43 * expf(v42 * -2.0));
                *std::string v39 = v40 + 1;
                if (v40 + 1 >= *v41)
                {
                  *AudioComponentDescription v38 = 1;
                  caulk::concurrent::messenger::enqueue(**(caulk::concurrent::messenger ***)(a1 + 160), **(caulk::concurrent::message ***)(a1 + 168));
                }
              }
              ++v26;
              --v37;
            }
            while (v37);
          }
          if (**(void **)(a1 + 64) - **(void **)(a1 + 48) <= v51)
          {
            (*(void (**)(void))(***(void ***)(a1 + 88) + 24))(**(void **)(a1 + 88));
            LODWORD(a4) = v52;
            a6 = v53;
            unint64_t v19 = 0x263F08000;
            if (**(unsigned char **)(a1 + 152))
            {
              **(unsigned char **)(a1 + 72) = 1;
              caulk::concurrent::messenger::enqueue(**(caulk::concurrent::messenger ***)(a1 + 160), **(caulk::concurrent::message ***)(a1 + 168));
            }
            ++**(void **)(a1 + 144);
          }
          else
          {
            LODWORD(a4) = v52;
            a6 = v53;
            unint64_t v19 = 0x263F08000;
          }
        }
        v18 += v25;
        v20 -= v25;
        char v44 = *(void **)(a1 + 48);
        uint64_t v45 = *v44 + v25;
        *char v44 = v45;
        if (v45 >= **(void **)(a1 + 64)) {
          uint64_t v45 = 0;
        }
        *char v44 = v45;
      }
      while (v18 < a4);
    }
    if (*a6 >= 2)
    {
      size_t v46 = 4 * a4;
      unint64_t v47 = 1;
      uint64_t v48 = 8;
      do
      {
        memcpy(*(void **)&a6[v48], *((const void **)a6 + 2), v46);
        ++v47;
        v48 += 4;
      }
      while (v47 < *a6);
    }
    uint64_t v13 = 0;
    id v12 = v50;
  }

  return v13;
}

- (BOOL)canProcessInPlace
{
  return 1;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (AUPasscodeCodecConfiguration)codecConfig
{
  return self->_codecConfig;
}

- (void)setCodecConfig:(id)a3
{
}

- (int64_t)assetLength
{
  return self->_assetLength;
}

- (void)setAssetLength:(int64_t)a3
{
  self->_assetLength = a3;
}

- (BOOL)silenceOutputOnNextAssetEnding
{
  return self->_silenceOutputOnNextAssetEnding;
}

- (void)setSilenceOutputOnNextAssetEnding:(BOOL)a3
{
  self->_silenceOutputOnNextAssetEnding = a3;
}

- (unint64_t)numLoopsToStopAfter
{
  return self->_numLoopsToStopAfter;
}

- (void)setNumLoopsToStopAfter:(unint64_t)a3
{
  self->_numLoopsToStopAfter = a3;
}

- (float)fadeOutTimeSeconds
{
  return self->_fadeOutTimeSeconds;
}

- (void)setFadeOutTimeSeconds:(float)a3
{
  self->_fadeOutTimeSeconds = a3;
}

- (BOOL)triggerFadeOut
{
  return self->_triggerFadeOut;
}

- (void)setTriggerFadeOut:(BOOL)a3
{
  self->_triggerFadeOut = a3;
}

- (BOOL)embedPasscode
{
  return self->_embedPasscode;
}

- (void)setEmbedPasscode:(BOOL)a3
{
  self->_embedPasscode = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)assetEndedAndSilencedHandler
{
  return self->_assetEndedAndSilencedHandler;
}

- (void)setAssetEndedAndSilencedHandler:(id)a3
{
}

- (NSMutableDictionary)passcodeEmbedInfo
{
  return self->_passcodeEmbedInfo;
}

- (void)setPasscodeEmbedInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeEmbedInfo, 0);
  objc_storeStrong(&self->_assetEndedAndSilencedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_codecConfig, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  std::unique_ptr<caulk::concurrent::messenger>::reset[abi:ne180100]((uint64_t *)&self->_rtMessenger, 0);
  value = (id *)self->_eofMessage.__ptr_.__value_;
  self->_eofMessage.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<EOFReachedMessage>::operator()[abi:ne180100]((uint64_t)&self->_eofMessage, value);
  }
  std::__tree<std::__value_type<unsigned int,std::any>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,std::any>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,std::any>>>::destroy((uint64_t)&self->_apcEncoderConfig, (void *)self->_apcEncoderConfig.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_outputBusArray, 0);
  objc_storeStrong((id *)&self->_inputBusArray, 0);
  objc_storeStrong((id *)&self->_outputBus, 0);

  v4 = self->_kernel.__ptr_.__value_;
  self->_kernel.__ptr_.__value_ = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 72) = 0;
  *((void *)self + 73) = 0;
  *((_DWORD *)self + 148) = 0;
  *((void *)self + 76) = 0;
  *((void *)self + 77) = 0;
  *((void *)self + 75) = 0;
  *((void *)self + 82) = 0;
  *((void *)self + 83) = 0;
  *((void *)self + 81) = (char *)self + 656;
  *((void *)self + 86) = 0;
  *((void *)self + 87) = 0;
  return self;
}

@end