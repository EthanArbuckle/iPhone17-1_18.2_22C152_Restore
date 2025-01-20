@interface APCDecoderProcessor
- (APCDecoderProcessor)initWithInputURL:(id)a3 codecConfig:(id)a4 error:(id *)a5;
- (APCDecoderProcessor)initWithInputURL:(id)a3 codecConfig:(id)a4 resultData:(id)a5 error:(id *)a6;
- (BOOL)getResultData:(id *)a3;
- (id)run;
@end

@implementation APCDecoderProcessor

- (APCDecoderProcessor)initWithInputURL:(id)a3 codecConfig:(id)a4 error:(id *)a5
{
  return [(APCDecoderProcessor *)self initWithInputURL:a3 codecConfig:a4 resultData:0 error:a5];
}

- (APCDecoderProcessor)initWithInputURL:(id)a3 codecConfig:(id)a4 resultData:(id)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v40.receiver = self;
  v40.super_class = (Class)APCDecoderProcessor;
  v13 = [(APCDecoderProcessor *)&v40 init];
  if (!v13) {
    goto LABEL_11;
  }
  v14 = 0;
  if (v10 && v11)
  {
    +[AUPasscodeDecoder registerAU];
    v15 = [AUPasscodeDecoder alloc];
    +[AUPasscodeDecoder getAUDesc];
    uint64_t v16 = [(AUPasscodeDecoder *)v15 initWithComponentDescription:v39 options:0 error:a6];
    decoderAU = v13->_decoderAU;
    v13->_decoderAU = (AUPasscodeDecoder *)v16;

    if (v13->_decoderAU)
    {
      v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      payloadsReceived = v13->_payloadsReceived;
      v13->_payloadsReceived = v18;

      [v11 setSampleRate:-1];
      [(AUPasscodeDecoder *)v13->_decoderAU setCodecConfig:v11];
      objc_initWeak(&location, v13->_payloadsReceived);
      v20 = dispatch_get_global_queue(0, 0);
      [(AUPasscodeDecoder *)v13->_decoderAU setDispatchQueue:v20];

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __69__APCDecoderProcessor_initWithInputURL_codecConfig_resultData_error___block_invoke;
      v36[3] = &unk_264CFE528;
      objc_copyWeak(&v37, &location);
      [(AUPasscodeDecoder *)v13->_decoderAU setDataHandler:v36];
      [(AUPasscodeDecoder *)v13->_decoderAU setRenderingOffline:1];
      [(AUPasscodeDecoder *)v13->_decoderAU setResultData:v12];
      v21 = [(AUPasscodeDecoder *)v13->_decoderAU resultData];
      BOOL v22 = v21 == 0;

      if (!v22)
      {
        v23 = [(AUPasscodeDecoder *)v13->_decoderAU resultData];
        [v23 reset];
      }
      v24 = APCLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v10;
        _os_log_impl(&dword_237D0E000, v24, OS_LOG_TYPE_INFO, "Recording URL: %@", buf, 0xCu);
      }

      v25 = -[AUAudioUnitOfflineProcessor initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:]([AUAudioUnitOfflineProcessor alloc], "initWithAudioUnit:inputFileURL:outputFileURL:ioSampleRate:", v13->_decoderAU, v10, 0, [v11 sampleRate]);
      processor = v13->_processor;
      v13->_processor = v25;

      if (v13->_processor)
      {
        v27 = [(AUPasscodeDecoder *)v13->_decoderAU inputBusses];
        v28 = [v27 objectAtIndexedSubscript:0];
        v29 = [v28 format];
        [v29 sampleRate];
        [v11 setSampleRate:(uint64_t)v30];

        objc_destroyWeak(&v37);
        objc_destroyWeak(&location);
LABEL_11:
        v14 = v13;
        goto LABEL_19;
      }
      v32 = APCLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v32, OS_LOG_TYPE_ERROR, "Failed to create the offline processor", buf, 2u);
      }

      v33 = (void *)MEMORY[0x263F087E8];
      uint64_t v41 = *MEMORY[0x263F08320];
      v42 = @"Failed to create the offline decoder processor";
      v34 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a6 = [v33 errorWithDomain:@"com.apple.audiopasscode" code:101 userInfo:v34];

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
    }
    else
    {
      v31 = APCLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v31, OS_LOG_TYPE_ERROR, "Failed to create the decoder AU", buf, 2u);
      }
    }
    v14 = 0;
  }
LABEL_19:

  return v14;
}

void __69__APCDecoderProcessor_initWithInputURL_codecConfig_resultData_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained addObject:v3];
}

- (id)run
{
  [(AUAudioUnitOfflineProcessor *)self->_processor run];
  payloadsReceived = self->_payloadsReceived;

  return payloadsReceived;
}

- (BOOL)getResultData:(id *)a3
{
  uint64_t v5 = [(AUPasscodeDecoder *)self->_decoderAU resultData];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [(AUPasscodeDecoder *)self->_decoderAU resultData];
    char v8 = [v7 isValid];

    if (v8)
    {
      *a3 = [(AUPasscodeDecoder *)self->_decoderAU resultData];
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadsReceived, 0);
  objc_storeStrong((id *)&self->_processor, 0);

  objc_storeStrong((id *)&self->_decoderAU, 0);
}

@end