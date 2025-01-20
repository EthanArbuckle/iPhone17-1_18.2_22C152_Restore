@interface APCCodecFactory
+ (float)evaluateCarrierWithConfig:(id)a3 carrier:(id)a4 embeddingResult:(id *)a5;
+ (id)createBestConfigForCapability:(id)a3;
+ (unique_ptr<APCDecoderBase,)createDecoderWithConfig:(id)a3 apcConfig:(void *)a4 error:(id *)a5;
+ (unique_ptr<APCEncoderBase,)createEncoderWithConfig:(id)a3 apcConfig:(void *)a4 payloadData:(id)a5;
@end

@implementation APCCodecFactory

+ (unique_ptr<APCDecoderBase,)createDecoderWithConfig:(id)a3 apcConfig:(void *)a4 error:(id *)a5
{
  v6 = v5;
  id v7 = a3;
  void *v6 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    operator new();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      operator new();
    }
  }

  return v8;
}

+ (unique_ptr<APCEncoderBase,)createEncoderWithConfig:(id)a3 apcConfig:(void *)a4 payloadData:(id)a5
{
  id v7 = v5;
  id v8 = a3;
  id v9 = a5;
  *id v7 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    operator new();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      operator new();
    }
  }

  return v11;
}

+ (float)evaluateCarrierWithConfig:(id)a3 carrier:(id)a4 embeddingResult:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    operator new();
  }

  return 1.0;
}

+ (id)createBestConfigForCapability:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = APCLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_237D0E000, v4, OS_LOG_TYPE_INFO, "Find an EchoCodec Capabiltity data", (uint8_t *)&v9, 2u);
    }

    v5 = [[EchoCodecConfiguration alloc] initWithCapabilityData:v3];
    id v6 = APCLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t v7 = [(EchoCodecConfiguration *)v5 algorithmVersionNumber];
      int v9 = 134217984;
      double v10 = (float)((float)v7 / 100.0);
      _os_log_impl(&dword_237D0E000, v6, OS_LOG_TYPE_INFO, "EchoCodec algorithm version: %3.2f", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end