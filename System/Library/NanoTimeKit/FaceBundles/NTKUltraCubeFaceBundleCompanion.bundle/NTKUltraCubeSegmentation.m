@interface NTKUltraCubeSegmentation
+ (CGImage)maskImageFromAuxiliaryDictionary:(id)a3;
+ (id)dataFromAuxiliaryDictionary:(id)a3;
+ (id)descriptionFromAuxiliaryDictionary:(id)a3;
- (BOOL)hasAuxiliaryDictionary;
- (CGImage)auxiliaryMaskImage;
- (NSDictionary)auxiliaryDictionary;
- (NTKUltraCubeSegmentation)init;
- (NTKUltraCubeSegmentation)initWithType:(unint64_t)a3 dictionary:(id)a4;
- (id)auxiliaryDictionaryData;
- (id)auxiliaryDictionaryDescription;
- (unint64_t)type;
- (void)setAuxiliaryDictionary:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NTKUltraCubeSegmentation

- (NTKUltraCubeSegmentation)init
{
  return [(NTKUltraCubeSegmentation *)self initWithType:0 dictionary:0];
}

- (NTKUltraCubeSegmentation)initWithType:(unint64_t)a3 dictionary:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKUltraCubeSegmentation;
  v8 = [(NTKUltraCubeSegmentation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_auxiliaryDictionary, a4);
  }

  return v9;
}

- (BOOL)hasAuxiliaryDictionary
{
  return self->_auxiliaryDictionary != 0;
}

- (id)auxiliaryDictionaryData
{
  return +[NTKUltraCubeSegmentation dataFromAuxiliaryDictionary:self->_auxiliaryDictionary];
}

- (id)auxiliaryDictionaryDescription
{
  return +[NTKUltraCubeSegmentation descriptionFromAuxiliaryDictionary:self->_auxiliaryDictionary];
}

- (CGImage)auxiliaryMaskImage
{
  return +[NTKUltraCubeSegmentation maskImageFromAuxiliaryDictionary:self->_auxiliaryDictionary];
}

+ (CGImage)maskImageFromAuxiliaryDictionary:(id)a3
{
  id v4 = a3;
  CFDataRef v5 = [a1 dataFromAuxiliaryDictionary:v4];
  if (v5)
  {
    v6 = [a1 descriptionFromAuxiliaryDictionary:v4];
    if (!v6)
    {
      v10 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v7 = CGDataProviderCreateWithCFData(v5);
    if ([v6 format] == 1278226488)
    {
      v8 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
      CGImageRef v9 = CGImageCreate((int)[v6 width], (int)objc_msgSend(v6, "height"), 8uLL, 8uLL, (int)objc_msgSend(v6, "bytesPerRow"), v8, 0, v7, 0, 1, kCGRenderingIntentDefault);
    }
    else
    {
      if ([v6 format] != 1751411059)
      {
        objc_super v11 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109888;
          int v14 = (int)[v6 format] >> 24;
          __int16 v15 = 1024;
          int v16 = (int)([v6 format] << 8) >> 24;
          __int16 v17 = 1024;
          int v18 = (__int16)[v6 format] >> 8;
          __int16 v19 = 1024;
          int v20 = (char)[v6 format];
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "createMask: unknown pixel format '%c%c%c%c'", buf, 0x1Au);
        }

        v10 = 0;
        goto LABEL_13;
      }
      v8 = CGColorSpaceCreateWithName(kCGColorSpaceGenericGray);
      CGImageRef v9 = CGImageCreate((int)[v6 width], (int)objc_msgSend(v6, "height"), 0x10uLL, 0x10uLL, (int)objc_msgSend(v6, "bytesPerRow"), v8, 0x100u, v7, 0, 1, kCGRenderingIntentDefault);
    }
    v10 = v9;
    CFRelease(v8);
LABEL_13:
    CFRelease(v7);
    goto LABEL_14;
  }
  v10 = 0;
LABEL_15:

  return v10;
}

+ (id)dataFromAuxiliaryDictionary:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:kCGImageAuxiliaryDataInfoData];
  if (v3)
  {
    id v4 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      id v7 = "+[NTKUltraCubeSegmentation dataFromAuxiliaryDictionary:]";
      __int16 v8 = 2048;
      id v9 = [v3 length];
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%s: auxiliaryData length: %ld bytes", (uint8_t *)&v6, 0x16u);
    }
  }

  return v3;
}

+ (id)descriptionFromAuxiliaryDictionary:(id)a3
{
  if (a3)
  {
    v3 = [a3 objectForKeyedSubscript:kCGImageAuxiliaryDataInfoDataDescription];
    if (v3)
    {
      id v4 = objc_alloc_init(NTKUltraCubeAuxiliaryDataDescription);
      CFDataRef v5 = [v3 objectForKeyedSubscript:kCGImagePropertyWidth];
      -[NTKUltraCubeAuxiliaryDataDescription setWidth:](v4, "setWidth:", [v5 intValue]);

      int v6 = [v3 objectForKeyedSubscript:kCGImagePropertyHeight];
      -[NTKUltraCubeAuxiliaryDataDescription setHeight:](v4, "setHeight:", [v6 intValue]);

      id v7 = [v3 objectForKeyedSubscript:kCGImagePropertyBytesPerRow];
      -[NTKUltraCubeAuxiliaryDataDescription setBytesPerRow:](v4, "setBytesPerRow:", [v7 intValue]);

      __int16 v8 = [v3 objectForKeyedSubscript:kCGImagePropertyPixelFormat];
      -[NTKUltraCubeAuxiliaryDataDescription setFormat:](v4, "setFormat:", [v8 unsignedIntValue]);

      id v9 = [v3 objectForKeyedSubscript:@"NTKImageAuxiliaryThresholdSegmentation"];
      -[NTKUltraCubeAuxiliaryDataDescription setIsThresholdMask:](v4, "setIsThresholdMask:", [v9 BOOLValue]);

      v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315394;
        v13 = "+[NTKUltraCubeSegmentation descriptionFromAuxiliaryDictionary:]";
        __int16 v14 = 2112;
        __int16 v15 = v4;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      v10 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        v13 = "+[NTKUltraCubeSegmentation descriptionFromAuxiliaryDictionary:]";
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%s: unable to retrieve data description from zuxiliary dictionary", (uint8_t *)&v12, 0xCu);
      }
      id v4 = 0;
    }
  }
  else
  {
    v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "+[NTKUltraCubeSegmentation descriptionFromAuxiliaryDictionary:]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s: no auxiliaryDictionary", (uint8_t *)&v12, 0xCu);
    }
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDictionary)auxiliaryDictionary
{
  return self->_auxiliaryDictionary;
}

- (void)setAuxiliaryDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end