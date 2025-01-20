@interface HFCameraClipExporter
+ (BOOL)hasCachedRecordingForCameraClip:(id)a3;
+ (double)durationOfCachedRecordingForCameraClip:(id)a3;
+ (id)_exportableCameraName:(id)a3;
+ (id)userFriendlyExportURLForCameraName:(id)a3 withStartDate:(id)a4;
@end

@implementation HFCameraClipExporter

+ (id)userFriendlyExportURLForCameraName:(id)a3 withStartDate:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v6 = (objc_class *)MEMORY[0x263F08790];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setLocalizedDateFormatFromTemplate:@"MMM-d-y-hh:mm:ss-a-z"];
  v10 = [v9 stringFromDate:v7];

  v11 = [a1 _exportableCameraName:v8];

  v12 = [NSString stringWithFormat:@"%@_%@.mp4", v11, v10];
  v13 = [v12 stringByReplacingOccurrencesOfString:@":" withString:@"-"];

  v14 = [v13 stringByReplacingOccurrencesOfString:@"," withString:&stru_26C081158];

  v15 = [v14 stringByReplacingOccurrencesOfString:@" " withString:@"-"];

  v16 = HFLogForCategory(0x12uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v15;
    _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Attempt to generate export url using string:%@", buf, 0xCu);
  }

  v17 = NSURL;
  v18 = +[HFUtilities cachesDirectoryURL];
  v19 = [v17 URLWithString:v15 relativeToURL:v18];

  return v19;
}

+ (BOOL)hasCachedRecordingForCameraClip:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = +[HFCameraUtilities videoDestinationURLForCameraClip:v3];
  +[HFCameraClipExporter durationOfCachedRecordingForCameraClip:v3];
  if (v5 != 0.0)
  {
    double v6 = v5;
    [v3 duration];
    if (v7 != 0.0)
    {
      [v3 duration];
      double v9 = v6 / v8;
      v10 = HFLogForCategory(0x12uLL);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        [v3 duration];
        *(_DWORD *)buf = 134218496;
        double v21 = v6;
        __int16 v22 = 2048;
        uint64_t v23 = v11;
        __int16 v24 = 2048;
        double v25 = v9 * 100.0;
        _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Cached recording duration (%0.2f/%0.2f) is %0.2f percent downloaded.", buf, 0x20u);
      }

      if (v9 >= 0.95)
      {
        BOOL v17 = 1;
        goto LABEL_14;
      }
      v12 = HFLogForCategory(0x12uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20B986000, v12, OS_LOG_TYPE_ERROR, "Truncated video file detected. Removing.", buf, 2u);
      }

      v13 = [MEMORY[0x263F08850] defaultManager];
      v14 = [v4 path];
      id v19 = 0;
      [v13 removeItemAtPath:v14 error:&v19];
      id v15 = v19;

      if (v15)
      {
        v16 = HFLogForCategory(0x12uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          double v21 = *(double *)&v15;
          __int16 v22 = 2112;
          uint64_t v23 = v4;
          _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Error:%@ removing file:%@", buf, 0x16u);
        }
      }
    }
  }
  BOOL v17 = 0;
LABEL_14:

  return v17;
}

+ (double)durationOfCachedRecordingForCameraClip:(id)a3
{
  id v3 = +[HFCameraUtilities videoDestinationURLForCameraClip:a3];
  +[HFCameraUtilities durationOfRecordingAtURL:v3];
  double v5 = v4;

  return v5;
}

+ (id)_exportableCameraName:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x263F08708] punctuationCharacterSet];
  uint64_t v5 = [v3 rangeOfCharacterFromSet:v4];
  uint64_t v7 = v6;

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", v5, v7, &stru_26C081158);

    id v3 = (id)v8;
  }
  return v3;
}

@end