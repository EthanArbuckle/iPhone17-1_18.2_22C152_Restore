@interface AudioCrossCorrelation
+ (BOOL)convertNSDataToWAV:(id)a3 atURL:(id)a4 error:(id)a5;
+ (id)calculatePeakDBValueWithSourceSignalData:(id)a3 resultSignalData:(id)a4 error:(id *)a5;
+ (id)convertWAVtoNSDataWithFileStringURL:(id)a3 withSampleRate:(id)a4 error:(id *)a5;
@end

@implementation AudioCrossCorrelation

+ (id)calculatePeakDBValueWithSourceSignalData:(id)a3 resultSignalData:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  unint64_t v9 = (unint64_t)[v7 length] >> 2;
  size_t v10 = v9 + ((unint64_t)[v8 length] >> 2) - 1;
  v11 = malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  bzero(v11, 4 * v10);
  v12 = malloc_type_malloc(4 * v10, 0x100004052888210uLL);
  bzero(v12, v10);
  id v13 = v7;
  id v14 = [v13 bytes];
  id v15 = [v13 length];

  memcpy(v12, v14, (size_t)v15);
  id v16 = v8;
  v17 = (const float *)[v16 bytes];
  vDSP_Length v18 = (unint64_t)[v16 length] >> 2;
  unint64_t v19 = (unint64_t)[v16 length];

  vDSP_conv((const float *)v12, 1, v17, 1, (float *)v11, 1, v18, v19 >> 2);
  float __C = 0.0;
  vDSP_Length v22 = 0;
  vDSP_maxvi((const float *)v11, 1, &__C, &v22, v10);
  free(v11);
  free(v12);
  v20 = 0;
  if (COERCE_UNSIGNED_INT(fabs(log10f(__C) * 10.0)) <= 0x7F7FFFFF)
  {
    v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  }
  if (a5 && !v20)
  {
    *a5 = +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-62 userInfo:0];
  }

  return v20;
}

+ (id)convertWAVtoNSDataWithFileStringURL:(id)a3 withSampleRate:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSURL) initWithString:v8];

  id v10 = [objc_alloc((Class)AVAudioFile) initForReading:v9 error:a5];
  id v11 = objc_alloc((Class)AVAudioPCMBuffer);
  v12 = [v10 processingFormat];
  id v13 = [v11 initWithPCMFormat:v12 frameCapacity:[v10 length]];

  [v10 readIntoBuffer:v13 error:a5];
  id v14 = *a5;
  id v15 = DiagnosticLogHandleForCategory();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      v17 = [*a5 localizedDescription];
      int v33 = 138412290;
      v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "WAV Audio could not be loaded into PCM buffer. Error : %@", (uint8_t *)&v33, 0xCu);
    }
    uint64_t v18 = -66;
LABEL_14:
    +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:v18 userInfo:0];
    id v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v16)
  {
    unint64_t v19 = [v13 format];
    [v19 sampleRate];
    int v33 = 134218242;
    v34 = v20;
    __int16 v35 = 2112;
    id v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Source WAV file sample rate: %f. Desired sample rate: %@", (uint8_t *)&v33, 0x16u);
  }
  v21 = [v13 format];
  [v21 sampleRate];
  vDSP_Length v22 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unsigned __int8 v23 = [v7 isEqualToNumber:v22];

  if ((v23 & 1) == 0)
  {
    v27 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v9 lastPathComponent];
      v29 = [v13 format];
      [v29 sampleRate];
      int v33 = 138412802;
      v34 = v28;
      __int16 v35 = 2048;
      id v36 = v30;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "The WAV file %@ has sample rate %f, which does not match the required sample rate %@.", (uint8_t *)&v33, 0x20u);
    }
    uint64_t v18 = -70;
    goto LABEL_14;
  }
  id v24 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *objc_msgSend(v13, "floatChannelData"), (int)(4 * objc_msgSend(v13, "frameLength")));
  v25 = v24;
  if (v24 && [v24 length])
  {
    id v26 = v25;
  }
  else
  {
    v32 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v33) = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "WAV Audio was loaded into PCM buffer but data is empty.", (uint8_t *)&v33, 2u);
    }

    +[NSError errorWithDomain:@"DAAudioQualityErrorDomain" code:-66 userInfo:0];
    id v26 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:

  return v26;
}

+ (BOOL)convertNSDataToWAV:(id)a3 atURL:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)AVAudioFormat) initWithCommonFormat:1 sampleRate:1 channels:0 interleaved:48000.0];
  uint64_t v11 = [v9 length] >> 2;
  id v12 = [objc_alloc((Class)AVAudioPCMBuffer) initWithPCMFormat:v10 frameCapacity:v11];
  [v12 setFrameLength:v11];
  id v13 = (void *)*((void *)[v12 mutableAudioBufferList] + 2);
  id v14 = v9;
  id v15 = [v14 bytes];
  id v16 = [v14 length];

  memcpy(v13, v15, (size_t)v16);
  id v17 = objc_alloc((Class)AVAudioFile);
  uint64_t v18 = [v10 settings];
  id v23 = v7;
  id v19 = [v17 initForWriting:v8 settings:v18 error:&v23];

  id v20 = v23;
  if (!v20)
  {
    id v22 = 0;
    [v19 writeFromBuffer:v12 error:&v22];
    id v20 = v22;
  }

  return 0;
}

@end