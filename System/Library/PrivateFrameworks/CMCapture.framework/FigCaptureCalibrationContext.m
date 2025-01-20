@interface FigCaptureCalibrationContext
+ (id)calibrationDataStringForInternalLogging:(id)a3;
+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3;
+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3;
+ (void)initialize;
- ($1AB5FA073B851C12C2339EC22442E995)lastSuccessfulCalibrationMagneticField;
- (FigCaptureCalibrationContext)initWithPreferenceString:(id)a3 withActivityName:(id)a4 withPropertyName:(id)a5 withExpectedDataSize:(unint64_t)a6 withInterval:(int)a7 withMinimumBatteryLevel:(int)a8 withInternalLogName:(id)a9 supportedDeviceNames:(id)a10;
- (FigCaptureCalibrationContext)initWithSupportedDeviceNames:(id)a3;
- (NSDictionary)lastSuccessfulCalibrationData;
- (NSString)activityName;
- (NSString)propertyName;
- (double)lastSuccessfulCalibrationTimeStamp;
- (id)calibrationDataHistory;
- (int)interval;
- (int)minimumBatteryLevelToRun;
- (uint64_t)_updateAndStashCalibrationData:(uint64_t)a3 externalErrors:(char)a4 hasFirmwareErrors:(uint64_t)a5 magneticFieldAttempts:(double)a6 magneticField:(double)a7;
- (unint64_t)expectedDataSize;
- (void)_createDictionaryForFailureOutsideFirmwareWithReasons:(uint64_t)a1;
- (void)_writeCalibrationDataToInternalLogFile:(double)a3 magneticField:(double)a4;
- (void)pushCalibrationDataToHistory:(id)a3 isRejected:(BOOL *)a4;
- (void)setLastSuccessfulCalibrationData:(id)a3;
- (void)setLastSuccessfulCalibrationMagneticField:(id)a3;
- (void)setLastSuccessfulCalibrationTimeStamp:(double)a3;
- (void)updateWithNewCalibrationData:(id)a3 orExternalErrors:(unsigned int)a4 magneticFieldAttempts:(int)a5 magneticField:(id)a6 isCalibrationValid:(BOOL *)a7 calibrationStatus:(unsigned int *)a8;
@end

@implementation FigCaptureCalibrationContext

- (NSDictionary)lastSuccessfulCalibrationData
{
  v2 = (void *)[(NSMutableDictionary *)self->_lastSuccessfulCalibrationData copy];
  return (NSDictionary *)v2;
}

+ (void)initialize
{
}

+ (id)calibrationDataStringForInternalLogging:(id)a3
{
  return 0;
}

+ (unsigned)calibrationStatusFromRawStreamCalibrationData:(id)a3
{
  return 0;
}

+ (id)createRawStreamCalibrationDataWithFailureReasons:(int)a3
{
  return 0;
}

- (FigCaptureCalibrationContext)initWithSupportedDeviceNames:(id)a3
{
  return 0;
}

- (FigCaptureCalibrationContext)initWithPreferenceString:(id)a3 withActivityName:(id)a4 withPropertyName:(id)a5 withExpectedDataSize:(unint64_t)a6 withInterval:(int)a7 withMinimumBatteryLevel:(int)a8 withInternalLogName:(id)a9 supportedDeviceNames:(id)a10
{
  if (a3)
  {
    v21.receiver = self;
    v21.super_class = (Class)FigCaptureCalibrationContext;
    v16 = [(FigCaptureCalibrationContext *)&v21 init];
    if (v16)
    {
      v17 = (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      uint64_t v18 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"CalibrationData"), "mutableCopy");
      v16->_lastSuccessfulCalibrationData = (NSMutableDictionary *)v18;
      if (!v18) {
        v16->_lastSuccessfulCalibrationData = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      if ([v17 objectForKeyedSubscript:@"TimeStampOfLastSuccessfulCalibration"]) {
        objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"TimeStampOfLastSuccessfulCalibration"), "doubleValue");
      }
      else {
        double Current = CFAbsoluteTimeGetCurrent();
      }
      v16->_lastSuccessfulCalibrationTimeStamp = Current;
      if ([v17 objectForKeyedSubscript:@"CalibrationCompassHeading"]) {
        objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", @"CalibrationCompassHeading"), "getBytes:length:", &v16->_lastSuccessfulCalibrationMagneticField, 24);
      }

      v16->_activityName = (NSString *)a4;
      v16->_preferenceString = (NSString *)a3;
      v16->_interval = a7;
      v16->_minimumBatteryLevelToRun = a8;
      v16->_internalLogName = (NSString *)a9;
      v16->_propertyName = (NSString *)a5;
      v16->_expectedDataSize = a6;
      v16->_supportedDevices = (NSArray *)a10;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return v16;
}

- (void)setLastSuccessfulCalibrationData:(id)a3
{
}

- (void)updateWithNewCalibrationData:(id)a3 orExternalErrors:(unsigned int)a4 magneticFieldAttempts:(int)a5 magneticField:(id)a6 isCalibrationValid:(BOOL *)a7 calibrationStatus:(unsigned int *)a8
{
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  double var2 = a6.var2;
  double var1 = a6.var1;
  double var0 = a6.var0;
  id v15 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v17 = [a3 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    v26 = a7;
    v27 = a8;
    uint64_t v19 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v15);
        }
        objc_super v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v21 isEqualToString:@"Back Camera"] & 1) != 0
          || [v21 isEqualToString:@"Back Telephoto Camera"])
        {
          int v22 = objc_msgSend((id)objc_opt_class(), "calibrationStatusFromRawStreamCalibrationData:", objc_msgSend(v15, "objectForKeyedSubscript:", v21));
          if (v22)
          {
            int v23 = v22;
            goto LABEL_13;
          }
        }
      }
      uint64_t v18 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v18) {
        continue;
      }
      break;
    }
    int v23 = 0;
LABEL_13:
    a7 = v26;
    a8 = v27;
    uint64_t v10 = v10;
  }
  else
  {
    int v23 = 0;
  }
  double v24 = sqrt(var1 * var1 + var0 * var0 + var2 * var2);
  if (!v15) {
    id v15 = (id)[MEMORY[0x1E4F1CA60] dictionary];
  }
  BOOL v25 = (-[FigCaptureCalibrationContext _updateAndStashCalibrationData:externalErrors:hasFirmwareErrors:magneticFieldAttempts:magneticField:]((CFStringRef *)self, v15, v11, v23 != 0, v10, var0, var1, var2) | v11 | v23) == 0;
  -[FigCaptureCalibrationContext _writeCalibrationDataToInternalLogFile:magneticField:]((uint64_t)self, v15, var0, var1, var2);
  [(FigCaptureCalibrationContext *)self reportLoggingWithCalibrationData:v15 isValid:v25 magneticFieldMagnitude:v24];
  if (a7) {
    *a7 = v25;
  }
  if (a8) {
    *a8 = !v25 | v11 | v23;
  }
}

- (uint64_t)_updateAndStashCalibrationData:(uint64_t)a3 externalErrors:(char)a4 hasFirmwareErrors:(uint64_t)a5 magneticFieldAttempts:(double)a6 magneticField:(double)a7
{
  double v21 = a6;
  double v22 = a7;
  double v23 = a8;
  if (!a1) {
    return 0;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(CFStringRef *)a1 lastSuccessfulCalibrationTimeStamp];
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", Current - v14), @"TimeSinceLastSuccessfulCalibration");
  objc_msgSend(a2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &v21, 24), @"CalibrationCompassHeading");
  char v20 = 0;
  if a3 || (a4)
  {
    if (!a3) {
      goto LABEL_10;
    }
    objc_msgSend(a2, "addEntriesFromDictionary:", -[FigCaptureCalibrationContext _createDictionaryForFailureOutsideFirmwareWithReasons:]((uint64_t)a1, a3));
LABEL_9:
    a3 = 0;
    goto LABEL_10;
  }
  [(CFStringRef *)a1 pushCalibrationDataToHistory:a2 isRejected:&v20];
  if (!v20)
  {
    [(CFStringRef *)a1 setLastSuccessfulCalibrationData:a2];
    [(CFStringRef *)a1 setLastSuccessfulCalibrationTimeStamp:Current];
    -[CFStringRef setLastSuccessfulCalibrationMagneticField:](a1, "setLastSuccessfulCalibrationMagneticField:", v21, v22, v23);
    if (!v20) {
      goto LABEL_9;
    }
  }
  a3 = 257;
  [(id)objc_opt_class() setStatusForCalibrationData:a2 status:257];
LABEL_10:
  id v15 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", -[CFStringRef lastSuccessfulCalibrationData](a1, "lastSuccessfulCalibrationData"), @"CalibrationData");
  v16 = NSNumber;
  [(CFStringRef *)a1 lastSuccessfulCalibrationTimeStamp];
  objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(v16, "numberWithDouble:"), @"TimeStampOfLastSuccessfulCalibration");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", -[CFStringRef calibrationDataHistory](a1, "calibrationDataHistory"), @"CalibrationHistory");
  CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v18 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSetValue(a1[7], v15, @"com.apple.cameracapture.volatile", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFPreferencesSetValue(@"magnetic_field_attempts", (CFPropertyListRef)[NSNumber numberWithInt:a5], @"com.apple.cameracapture.volatile", v17, v18);
  CFPreferencesSynchronize(@"com.apple.cameracapture.volatile", v17, v18);
  return a3;
}

- (void)_writeCalibrationDataToInternalLogFile:(double)a3 magneticField:(double)a4
{
  if (a1)
  {
    uint64_t v23 = 0;
    if (*(void *)(a1 + 88) && (MGGetBoolAnswer() & 1) == 0 && MGGetBoolAnswer())
    {
      uint64_t v10 = [(id)objc_opt_class() calibrationDataStringForInternalLogging:a2];
      if (v10)
      {
        uint64_t v11 = v10;
        id v12 = objc_alloc_init(MEMORY[0x1E4F28C10]);
        objc_msgSend(v12, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "localTimeZone"));
        [v12 setDateFormat:@"yyyy-MM-dd"];
        uint64_t v13 = objc_msgSend(v12, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
        if (FigCaptureCameracapturedEnabled()) {
          double v14 = @"cameracaptured";
        }
        else {
          double v14 = @"mediaserverd";
        }
        uint64_t v15 = [NSString stringWithFormat:@"%@.%@-%@.log", v14, *(void *)(a1 + 88), v13];
        uint64_t v16 = [NSString stringWithFormat:@"/private/var/mobile/Library/Logs/CrashReporter/%@", v14];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v23);
        uint64_t v17 = [NSString stringWithFormat:@"%@/%@", v16, v15];
        if (!v23)
        {
          uint64_t v18 = v17;
          uint64_t v19 = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", @"TimeSinceLastSuccessfulCalibration"), "longLongValue");
          [v12 setDateFormat:@"HH:mm:ss"];
          uint64_t v20 = objc_msgSend(v12, "stringFromDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "date"));
          id v21 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          [v21 appendFormat:@"%@, ", v20];
          [v21 appendFormat:@"%lld, ", v19];
          [v21 appendFormat:@"%f, %f, %f, %f, ", *(void *)&a3, *(void *)&a4, *(void *)&a5, sqrt(a4 * a4 + a3 * a3 + a5 * a5)];
          [v21 appendString:v11];
          [v21 appendString:@"\n"];
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v18) & 1) == 0) {
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "createFileAtPath:contents:attributes:", v18, 0, 0);
          }
          double v22 = (void *)[MEMORY[0x1E4F28CB0] fileHandleForUpdatingAtPath:v18];
          [v22 seekToEndOfFile];
          objc_msgSend(v22, "writeData:", objc_msgSend(v21, "dataUsingEncoding:", 4));
          [v22 closeFile];
          goto LABEL_13;
        }
LABEL_17:
        id v21 = 0;
LABEL_13:

        return;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    id v12 = 0;
    goto LABEL_17;
  }
}

- (void)pushCalibrationDataToHistory:(id)a3 isRejected:(BOOL *)a4
{
  if (a4) {
    *a4 = 0;
  }
}

- (id)calibrationDataHistory
{
  return 0;
}

- (void)_createDictionaryForFailureOutsideFirmwareWithReasons:(uint64_t)a1
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!*(void *)(a1 + 96))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = *(void **)(a1 + 96);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 isEqualToString:@"Back Camera"] & 1) != 0
          || [v10 isEqualToString:@"Back Telephoto Camera"])
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_opt_class(), "createRawStreamCalibrationDataWithFailureReasons:", a2), v10);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  return v4;
}

- (double)lastSuccessfulCalibrationTimeStamp
{
  return self->_lastSuccessfulCalibrationTimeStamp;
}

- (void)setLastSuccessfulCalibrationTimeStamp:(double)a3
{
  self->_lastSuccessfulCalibrationTimeStamp = a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)lastSuccessfulCalibrationMagneticField
{
  double x = self->_lastSuccessfulCalibrationMagneticField.x;
  double y = self->_lastSuccessfulCalibrationMagneticField.y;
  double z = self->_lastSuccessfulCalibrationMagneticField.z;
  result.double var2 = z;
  result.double var1 = y;
  result.double var0 = x;
  return result;
}

- (void)setLastSuccessfulCalibrationMagneticField:(id)a3
{
  self->_lastSuccessfulCalibrationMagneticField = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (NSString)activityName
{
  return self->_activityName;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (unint64_t)expectedDataSize
{
  return self->_expectedDataSize;
}

- (int)interval
{
  return self->_interval;
}

- (int)minimumBatteryLevelToRun
{
  return self->_minimumBatteryLevelToRun;
}

@end