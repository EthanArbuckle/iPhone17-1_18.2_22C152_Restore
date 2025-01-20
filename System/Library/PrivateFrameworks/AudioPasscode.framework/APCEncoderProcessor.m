@interface APCEncoderProcessor
- (APCEncoderProcessor)initWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 outputURL:(id)a6 error:(id *)a7;
- (BOOL)getEmbeddingInfo:(id *)a3;
- (float)evaluateAsset:(id)a3;
- (void)run;
@end

@implementation APCEncoderProcessor

- (APCEncoderProcessor)initWithAssetURL:(id)a3 codecConfig:(id)a4 payload:(id)a5 outputURL:(id)a6 error:(id *)a7
{
  v51[1] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v41.receiver = self;
  v41.super_class = (Class)APCEncoderProcessor;
  v16 = [(APCEncoderProcessor *)&v41 init];
  if (v16)
  {
    if (!v12 || !v13 || !v14 || !v15)
    {
      v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v50 = *MEMORY[0x263F08320];
      v51[0] = @"Invalid input arguments";
      v31 = [NSDictionary dictionaryWithObjects:v51 forKeys:&v50 count:1];
      *a7 = [v30 errorWithDomain:@"com.apple.audiopasscode" code:100 userInfo:v31];

LABEL_22:
      v35 = 0;
      goto LABEL_23;
    }
    +[AUPasscodeEncoder registerAU];
    v17 = [AUPasscodeEncoder alloc];
    +[AUPasscodeEncoder getAUDesc];
    uint64_t v18 = [(AUPasscodeEncoder *)v17 initWithComponentDescription:v40 options:0 error:a7];
    encoderAU = v16->_encoderAU;
    v16->_encoderAU = (AUPasscodeEncoder *)v18;

    if (!v16->_encoderAU)
    {
      v32 = APCLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v32, OS_LOG_TYPE_ERROR, "Failed to create the encoder AU", buf, 2u);
      }

      goto LABEL_22;
    }
    objc_msgSend(v13, "setPayloadLengthBytes:", objc_msgSend(v14, "length"));
    v20 = [(AUPasscodeEncoder *)v16->_encoderAU inputBusses];
    v21 = [v20 objectAtIndexedSubscript:0];
    v22 = [v21 format];
    [v22 sampleRate];
    [v13 setSampleRate:(uint64_t)v23];

    [(AUPasscodeEncoder *)v16->_encoderAU setPayload:v14];
    [(AUPasscodeEncoder *)v16->_encoderAU setCodecConfig:v13];
    v24 = APCLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      double v47 = *(double *)&v12;
      __int16 v48 = 2112;
      id v49 = v15;
      _os_log_impl(&dword_237D0E000, v24, OS_LOG_TYPE_INFO, "Asset URL: '%@'\nOutput File URL: '%@'", buf, 0x16u);
    }

    [(APCEncoderProcessor *)v16 evaluateAsset:v12];
    float v26 = v25;
    if (v25 < 0.1)
    {
      v27 = APCLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        double v47 = v26;
        _os_log_impl(&dword_237D0E000, v27, OS_LOG_TYPE_ERROR, "The success rate of the input file is too low: %f", buf, 0xCu);
      }

      v28 = (void *)MEMORY[0x263F087E8];
      uint64_t v44 = *MEMORY[0x263F08320];
      v45 = @"The asset score is too low";
      v29 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      *a7 = [v28 errorWithDomain:@"com.apple.audiopasscode" code:102 userInfo:v29];

      goto LABEL_22;
    }
    v33 = [[AUAudioUnitOfflineProcessor alloc] initWithAudioUnit:v16->_encoderAU inputFileURL:v12 outputFileURL:v15 ioSampleRate:-1];
    processor = v16->_processor;
    v16->_processor = v33;

    [(AUPasscodeEncoder *)v16->_encoderAU setAssetLength:[(AUAudioUnitOfflineProcessor *)v16->_processor assetLength]];
    if (!v16->_processor)
    {
      v36 = APCLogObject();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_237D0E000, v36, OS_LOG_TYPE_ERROR, "Failed to create the offline processor", buf, 2u);
      }

      v37 = (void *)MEMORY[0x263F087E8];
      uint64_t v42 = *MEMORY[0x263F08320];
      v43 = @"Failed to create the offline encoder processor";
      v38 = [NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      *a7 = [v37 errorWithDomain:@"com.apple.audiopasscode" code:101 userInfo:v38];

      goto LABEL_22;
    }
  }
  v35 = v16;
LABEL_23:

  return v35;
}

- (float)evaluateAsset:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v29 = 0;
  v5 = (void *)[objc_alloc(MEMORY[0x263EF9380]) initForReading:v4 error:&v29];
  id v6 = v29;
  if (v6)
  {
    id v7 = v6;
    v8 = APCLogObject();
    float v9 = 0.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v7;
      _os_log_impl(&dword_237D0E000, v8, OS_LOG_TYPE_ERROR, "Failed to open input file URL: %@", buf, 0xCu);
    }
  }
  else
  {
    id v10 = objc_alloc(MEMORY[0x263EF93B0]);
    v11 = [v5 processingFormat];
    v8 = objc_msgSend(v10, "initWithPCMFormat:frameCapacity:", v11, objc_msgSend(v5, "length"));

    id v28 = 0;
    [v5 readIntoBuffer:v8 error:&v28];
    id v7 = v28;
    if (v7)
    {
      id v12 = APCLogObject();
      float v9 = 0.0;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v31 = v7;
        _os_log_impl(&dword_237D0E000, v12, OS_LOG_TYPE_ERROR, "Failed to read the input file: %@", buf, 0xCu);
      }
    }
    else
    {
      id v13 = [(AUPasscodeEncoder *)self->_encoderAU codecConfig];
      id v12 = [v13 copy];

      id v14 = [v5 processingFormat];
      [v14 sampleRate];
      [v12 setSampleRate:(uint64_t)(v15 + 0.5)];

      id v27 = 0;
      +[APCCodecFactory evaluateCarrierWithConfig:v12 carrier:v8 embeddingResult:&v27];
      float v9 = v16;
      id v17 = v27;
      if (v17)
      {
        [(AUPasscodeEncoder *)self->_encoderAU setPasscodeEmbedInfo:v17];
        uint64_t v18 = [NSNumber numberWithInt:108];
        v19 = [v17 objectForKey:v18];
        uint64_t v26 = [v19 unsignedIntegerValue];

        v20 = [NSNumber numberWithInt:1000];
        v21 = [v17 objectForKey:v20];
        uint64_t v22 = [v21 unsignedIntegerValue];

        double v23 = [[APCPlayerEmbedInfo alloc] initWithPasscodeDurationNSec:(unint64_t)((double)(unint64_t)(v22 + v26)/ (double)[v12 sampleRate]* 1000000000.0)];
        passcodeEmbedInfo = self->_passcodeEmbedInfo;
        self->_passcodeEmbedInfo = v23;
      }
    }
  }
  return v9;
}

- (void)run
{
}

- (BOOL)getEmbeddingInfo:(id *)a3
{
  passcodeEmbedInfo = self->_passcodeEmbedInfo;
  if (passcodeEmbedInfo) {
    *a3 = passcodeEmbedInfo;
  }
  return passcodeEmbedInfo != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcodeEmbedInfo, 0);
  objc_storeStrong((id *)&self->_processor, 0);

  objc_storeStrong((id *)&self->_encoderAU, 0);
}

@end