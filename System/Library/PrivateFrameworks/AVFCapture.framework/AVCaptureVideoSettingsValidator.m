@interface AVCaptureVideoSettingsValidator
+ (BOOL)validateVideoSettings:(id)a3 allowingFeatures:(unint64_t)a4 validPixelKeys:(id)a5 validPixelFormats:(id)a6 validCodecKeys:(id)a7 validCodecs:(id)a8 exceptionReason:(id *)a9;
@end

@implementation AVCaptureVideoSettingsValidator

+ (BOOL)validateVideoSettings:(id)a3 allowingFeatures:(unint64_t)a4 validPixelKeys:(id)a5 validPixelFormats:(id)a6 validCodecKeys:(id)a7 validCodecs:(id)a8 exceptionReason:(id *)a9
{
  char v9 = a4;
  if (!a3)
  {
    if ((a4 & 1) == 0)
    {
      LOBYTE(v15) = 0;
      v31 = @"nil settings";
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  unint64_t v15 = [a3 count] | a4 & 2;
  if (!v15)
  {
    v31 = @"source passthru (empty dictionary) is not supported";
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v15) = 0;
    v31 = @"not a dictionary";
    goto LABEL_40;
  }
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D70]), "intValue");
  uint64_t v17 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F47D00]];
  if (v16) {
    BOOL v18 = v17 == 0;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    LOBYTE(v15) = 0;
    v31 = @"kCVPixelBufferPixelFormatTypeKey and AVVideoCodecKey may not both be specified";
    goto LABEL_40;
  }
  v19 = (void *)v17;
  if (v16) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v17 == 0;
  }
  if (v20)
  {
    LOBYTE(v15) = 0;
    v31 = @"Either kCVPixelBufferPixelFormatTypeKey or AVVideoCodecKey must be specified";
    goto LABEL_40;
  }
  if ((v9 & 4) != 0 && v16)
  {
    if (!a5
      || (uint64_t v21 = [MEMORY[0x1E4F1CAD0] setWithArray:a5],
          v22 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys")),
          [v22 minusSet:v21],
          ![v22 count]))
    {
      if (a6
        && (objc_msgSend(a6, "containsObject:", objc_msgSend(NSNumber, "numberWithInt:", v16)) & 1) == 0)
      {
        v31 = (__CFString *)[NSString stringWithFormat:@"Unsupported pixel format type specified: %@. Supported pixel format types are %@", AVStringForOSType(), a6];
LABEL_51:
        LOBYTE(v15) = 0;
        goto LABEL_40;
      }
      goto LABEL_39;
    }
    v32 = NSString;
    v33 = v22;
    uint64_t v34 = v21;
LABEL_50:
    v31 = (__CFString *)[v32 stringWithFormat:@"Unsupported keys specified: %@. Supported keys are %@", v33, v34];
    goto LABEL_51;
  }
  if ((v9 & 8) == 0 || !v17)
  {
    if (v16)
    {
      LOBYTE(v15) = 0;
      v31 = @"kCVPixelBufferPixelFormatTypeKey is unsupported";
      goto LABEL_40;
    }
    if (v17)
    {
      LOBYTE(v15) = 0;
      v31 = @"AVVideoCodecKey is unsupported";
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  if (!a7)
  {
LABEL_34:
    if (a8 && ([a8 containsObject:v19] & 1) == 0)
    {
      v31 = (__CFString *)[NSString stringWithFormat:@"Unsupported codec specified: %@. Supported codecs are %@", v19, a8];
      goto LABEL_51;
    }
LABEL_39:
    v31 = 0;
    LOBYTE(v15) = 1;
    goto LABEL_40;
  }
  uint64_t v23 = [MEMORY[0x1E4F1CAD0] setWithArray:a7];
  v24 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys"));
  [v24 minusSet:v23];
  if ((v9 & 0x10) == 0
    || ([v19 isEqual:*MEMORY[0x1E4F47D38]] & 1) == 0
    && ([v19 isEqual:*MEMORY[0x1E4F47D30]] & 1) == 0
    && ![v19 isEqual:AVStringForOSType()])
  {
    goto LABEL_56;
  }
  uint64_t v25 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F47D40]];
  uint64_t v26 = *MEMORY[0x1E4F47D88];
  if (v25)
  {
    v27 = (void *)v25;
    uint64_t v28 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F47D88]];
    v29 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(v27, "allKeys"));
    [v29 minusSet:v28];
    if ([v29 count])
    {
      v31 = (__CFString *)[NSString stringWithFormat:@"Unsupported AVVideoCompressionProperties specified: %@. Supported keys are %@", v29, v28];
      goto LABEL_51;
    }
  }
  if (![v24 containsObject:v26] || !objc_msgSend(v24, "count"))
  {
LABEL_56:
    if ([v24 count])
    {
      v32 = NSString;
      v33 = v24;
      uint64_t v34 = v23;
      goto LABEL_50;
    }
    goto LABEL_34;
  }
  LOBYTE(v15) = 0;
  v31 = @"AVVideoQualityKey is present at the top level instead of inside the AVVideoCompressionPropertiesKey sub-dictionary";
LABEL_40:
  if (a9) {
    *a9 = v31;
  }
  return v15;
}

@end