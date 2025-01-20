@interface MIOOutputSettingsFactory
+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7;
@end

@implementation MIOOutputSettingsFactory

+ (id)outputSettingsWithConfig:(id)a3 formatDescription:(opaqueCMFormatDescription *)a4 defaultFrameRate:(double)a5 preferEncoderConfig:(BOOL)a6 enableAVEHighPerformanceProfile:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v11 = a3;
  v12 = [v11 objectForKey:@"StreamEncoderType"];
  uint64_t v13 = [v12 intValue];

  if (+[MIOMiscStreamOutputSettings supportsEncoderType:v13])
  {
    if (+[MIOLog debugEnabled])
    {
      v14 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "'Other' encoder does not support high performance profile.", buf, 2u);
      }
      v15 = off_2643AECD0;
LABEL_29:

      goto LABEL_30;
    }
    v15 = off_2643AECD0;
    goto LABEL_30;
  }
  if (+[MIOProResStreamOutputSettings supportsEncoderType:v13])
  {
    if (+[MIOLog debugEnabled])
    {
      v14 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "'ProRes' encoder does not support high performance profile.", v21, 2u);
      }
      v15 = off_2643AED10;
      goto LABEL_29;
    }
    v15 = off_2643AED10;
LABEL_30:
    v16 = [(__objc2_class *)*v15 outputSettingsWithConfig:v11 formatDescription:a4 defaultFrameRate:v8 preferEncoderConfig:v7 enableAVEHighPerformanceProfile:a5];
    goto LABEL_31;
  }
  if (+[MIOSlimStreamOutputSettings supportsEncoderType:v13])
  {
    if (+[MIOLog debugEnabled])
    {
      v14 = +[MIOLog defaultLog];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "'Slim' encoder does not support high performance profile.", v20, 2u);
      }
      v15 = off_2643AED28;
      goto LABEL_29;
    }
    v15 = off_2643AED28;
    goto LABEL_30;
  }
  if (+[MIOYzipStreamOutputSettings supportsEncoderType:v13])
  {
    if (!+[MIOLog debugEnabled])
    {
      v15 = off_2643AED80;
      goto LABEL_30;
    }
    v14 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "'Yzip' encoder does not support high performance profile.", v19, 2u);
    }
    v15 = off_2643AED80;
    goto LABEL_29;
  }
  if (+[MIOJPEGStreamOutputSettings supportsEncoderType:v13])
  {
    if (!+[MIOLog debugEnabled])
    {
      v15 = off_2643AECA8;
      goto LABEL_30;
    }
    v14 = +[MIOLog defaultLog];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21B5ED000, v14, OS_LOG_TYPE_DEBUG, "'JPEG' encoder does not support high performance profile.", v18, 2u);
    }
    v15 = off_2643AECA8;
    goto LABEL_29;
  }
  if (+[MIOH264StreamOutputSettings supportsEncoderType:v13])
  {
    v15 = off_2643AEC90;
    goto LABEL_30;
  }
  if (+[MIOHEVCAlphaStreamOutputSettings supportsEncoderType:v13])
  {
    v15 = off_2643AEC98;
    goto LABEL_30;
  }
  if (+[MIOHEVCStreamOutputSettings supportsEncoderType:v13])
  {
    v15 = off_2643AECA0;
    goto LABEL_30;
  }
  v16 = 0;
LABEL_31:

  return v16;
}

@end