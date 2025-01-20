@interface VNError
+ (id)errorForCVReturnCode:(int)a3 localizedDescription:(id)a4;
+ (id)errorForCVReturnCode:(int)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6 localizedDescription:(id)a7;
+ (id)errorForCancellationOfRequest:(id)a3;
+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3;
+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForEspressoErrorInfo:(id)a3 localizedDescription:(id)a4;
+ (id)errorForEspressoReturnStatus:(int)a3 localizedDescription:(id)a4;
+ (id)errorForExecutionTimeoutWithLocalizedDescription:(id)a3;
+ (id)errorForExecutionTimeoutWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForFailedEspressoPlan:(void *)a3 localizedDescription:(id)a4;
+ (id)errorForGPURequiredByRequest:(id)a3;
+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3;
+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForInvalidArgument:(id)a3 named:(id)a4;
+ (id)errorForInvalidArgumentWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidFormatErrorWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidImageFailure;
+ (id)errorForInvalidImageFailureWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForInvalidOperationForRequestClass:(Class)a3 revision:(unint64_t)a4;
+ (id)errorForInvalidOperationForRequestSpecifier:(id)a3;
+ (id)errorForInvalidOperationWithLocalizedDescription:(id)a3;
+ (id)errorForInvalidOption:(id)a3 named:(id)a4;
+ (id)errorForInvalidOption:(id)a3 named:(id)a4 localizedDescription:(id)a5;
+ (id)errorForInvalidOptionWithLocalizedDescription:(id)a3;
+ (id)errorForMemoryAllocationFailure;
+ (id)errorForMemoryAllocationFailureWithLocalizedDescription:(id)a3;
+ (id)errorForMissingOptionNamed:(id)a3;
+ (id)errorForOSStatus:(int)a3 localizedDescription:(id)a4;
+ (id)errorForOperationFailedErrorWithLocalizedDescription:(id)a3;
+ (id)errorForOperationFailedErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4;
+ (id)errorForOutOfBoundsErrorWithLocalizedDescription:(id)a3;
+ (id)errorForUnavailableSession;
+ (id)errorForUnimplementedFunctionWithLocalizedDescription:(id)a3;
+ (id)errorForUnimplementedMethod:(SEL)a3 ofObject:(id)a4;
+ (id)errorForUnknownErrorWithLocalizedDescription:(id)a3;
+ (id)errorForUnsupportedComputeDevice:(id)a3;
+ (id)errorForUnsupportedComputeDeviceWithLocalizedDescription:(id)a3;
+ (id)errorForUnsupportedComputeStage:(id)a3;
+ (id)errorForUnsupportedConfigurationOfRequest:(id)a3;
+ (id)errorForUnsupportedProcessingDevice:(id)a3;
+ (id)errorForUnsupportedRequestClassName:(id)a3;
+ (id)errorForUnsupportedRequestSpecifier:(id)a3;
+ (id)errorForUnsupportedRevision:(unint64_t)a3 ofRequest:(id)a4;
+ (id)errorForUnsupportedRevision:(unint64_t)a3 ofRequestClass:(Class)a4;
+ (id)errorForUnsupportedSerializingHeaderVersion:(unsigned int)a3;
+ (id)errorForVImageError:(int64_t)a3 localizedDescription:(id)a4;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4;
+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5;
+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
+ (void)VNAssert:(BOOL)a3 log:(id)a4;
+ (void)VNAssertClass:(Class)a3 needsToOverrideMethod:(SEL)a4;
+ (void)logInternalError:(id)a3;
@end

@implementation VNError

+ (void)VNAssert:(BOOL)a3 log:(id)a4
{
  id v12 = a4;
  if (!a3)
  {
    uint64_t v5 = [v12 UTF8String];
    VNValidatedLog(4, @"%s", v6, v7, v8, v9, v10, v11, v5);
  }
}

+ (void)VNAssertClass:(Class)a3 needsToOverrideMethod:(SEL)a4
{
  id v7 = [NSString alloc];
  uint64_t v8 = NSStringFromClass(a3);
  uint64_t v9 = NSStringFromSelector(a4);
  id v10 = (id)[v7 initWithFormat:@"Base class implementation is not provided. %@ must implement %@", v8, v9];

  [a1 VNAssert:0 log:v10];
}

+ (void)logInternalError:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v13 = v3;
    uint64_t v4 = [v3 code];
    id v5 = [v13 localizedDescription];
    [v5 cStringUsingEncoding:1];
    id v6 = [v13 localizedFailureReason];
    [v6 cStringUsingEncoding:1];
    VNValidatedLog(4, @"Error code: %llu; description: %s; reason: %s", v7, v8, v9, v10, v11, v12, v4);

    id v3 = v13;
  }
}

+ (id)errorForOSStatus:(int)a3 localizedDescription:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E4F28568], 0);
  uint64_t v7 = [a1 errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:v6];

  return v7;
}

+ (id)errorForCVReturnCode:(int)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6 localizedDescription:(id)a7
{
  uint64_t v9 = *(void *)&a3;
  id v10 = a7;
  id v11 = [NSString alloc];
  uint64_t v12 = VisionCoreFourCharCodeToString();
  id v13 = (void *)[v11 initWithFormat:@"%@ Width = %lu, Height = %lu, Format = %@", v10, a4, a5, v12];

  v14 = +[VNError errorForCVReturnCode:v9 localizedDescription:v13];

  return v14;
}

+ (id)errorForCVReturnCode:(int)a3 localizedDescription:(id)a4
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E4F28568], 0);
  uint64_t v7 = [a1 errorWithDomain:*MEMORY[0x1E4F28760] code:a3 userInfo:v6];

  return v7;
}

+ (id)errorForVImageError:(int64_t)a3 localizedDescription:(id)a4
{
  id v6 = a4;
  id v7 = [NSString alloc];
  uint64_t v8 = [NSNumber numberWithLong:a3];
  uint64_t v9 = (void *)[v7 initWithFormat:@"vImage_Error %@", v8];

  if ([v6 length])
  {
    uint64_t v10 = [[NSString alloc] initWithFormat:@"%@ (%@)", v6, v9];

    uint64_t v9 = (void *)v10;
  }
  id v11 = [a1 errorForInternalErrorWithLocalizedDescription:v9];

  return v11;
}

+ (id)errorForFailedEspressoPlan:(void *)a3 localizedDescription:(id)a4
{
  id v5 = a4;
  uint64_t error_info = espresso_plan_get_error_info();
  uint64_t v8 = objc_msgSend(a1, "errorForEspressoErrorInfo:localizedDescription:", error_info, v7, v5);

  return v8;
}

+ (id)errorForEspressoErrorInfo:(id)a3 localizedDescription:(id)a4
{
  var2 = a3.var2;
  uint64_t v5 = *(void *)&a3.var0;
  id v7 = a4;
  uint64_t v8 = NSString;
  if (v5 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"plan phase %u", v5);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = off_1E5B1C040[(int)v5];
  }
  uint64_t v10 = [v8 stringWithFormat:@"%s (%@)", var2, v9];

  if (v7)
  {
    uint64_t v11 = [NSString stringWithFormat:@"%@ - %@", v7, v10];

    uint64_t v10 = (void *)v11;
  }
  uint64_t v12 = [a1 errorForInternalErrorWithLocalizedDescription:v10];

  return v12;
}

+ (id)errorForEspressoReturnStatus:(int)a3 localizedDescription:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v7, "appendFormat:", @"%d", v4);
  uint64_t status_string = espresso_get_status_string();
  if (status_string) {
    objc_msgSend(v7, "appendFormat:", @": %s", status_string);
  }
  if ([v6 length])
  {
    id v9 = [NSString stringWithFormat:@"%@ (%@)", v6, v7];
  }
  else
  {
    id v9 = v7;
  }
  uint64_t v10 = v9;

  uint64_t v11 = [a1 errorForInternalErrorWithLocalizedDescription:v10];

  return v11;
}

+ (id)errorForUnavailableSession
{
  return (id)[a1 errorWithCode:32769 message:@"session no longer available"];
}

+ (id)errorForUnsupportedComputeDeviceWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorWithCode:22 message:a3];

  return v3;
}

+ (id)errorForUnsupportedComputeDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"unsupported compute device %@", v4];
  id v6 = [a1 errorForUnsupportedComputeDeviceWithLocalizedDescription:v5];

  return v6;
}

+ (id)errorForUnsupportedComputeStage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:@"unsupported compute stage %@", v4];
  id v6 = [a1 errorWithCode:21 message:v5];

  return v6;
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  id v4 = [a1 errorWithCode:17 message:a3 underlyingError:a4];

  return v4;
}

+ (id)errorForDataUnavailableWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorForDataUnavailableWithLocalizedDescription:a3 underlyingError:0];

  return v3;
}

+ (id)errorForUnsupportedRequestSpecifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 requestRevision];
  uint64_t v6 = [v4 requestClassAndReturnError:0];
  if (v6)
  {
    id v7 = [a1 errorForUnsupportedRevision:v5 ofRequestClass:v6];
  }
  else
  {
    uint64_t v8 = [v4 requestClassName];
    id v7 = [a1 errorForUnsupportedRequestClassName:v8];
  }

  return v7;
}

+ (id)errorForUnsupportedRequestClassName:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@ is not a supported request", a3];
  uint64_t v5 = [a1 errorWithCode:19 message:v4];

  return v5;
}

+ (id)errorForUnsupportedRevision:(unint64_t)a3 ofRequestClass:(Class)a4
{
  id v7 = NSString;
  uint64_t v8 = NSStringFromClass(a4);
  id v9 = VNRequestRevisionString(a4, a3);
  uint64_t v10 = [v7 stringWithFormat:@"%@ does not support %@", v8, v9];

  uint64_t v11 = [a1 errorWithCode:16 message:v10];

  return v11;
}

+ (id)errorForUnsupportedRevision:(unint64_t)a3 ofRequest:(id)a4
{
  id v6 = a4;
  id v7 = [a1 errorForUnsupportedRevision:a3 ofRequestClass:objc_opt_class()];

  return v7;
}

+ (id)errorForUnsupportedConfigurationOfRequest:(id)a3
{
  id v4 = [NSString stringWithFormat:@"The current configuration of %@ is not supported", a3];
  uint64_t v5 = [a1 errorForInvalidOperationWithLocalizedDescription:v4];

  return v5;
}

+ (id)errorForUnsupportedProcessingDevice:(id)a3
{
  id v3 = [NSString stringWithFormat:@"processing with %@ is not supported", a3];
  id v4 = +[VNError errorForInvalidOperationWithLocalizedDescription:v3];

  return v4;
}

+ (id)errorForGPURequiredByRequest:(id)a3
{
  id v3 = a3;
  id v4 = NSString;
  uint64_t v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  id v7 = [v4 stringWithFormat:@"%@ requires the GPU for processing", v6];

  uint64_t v8 = +[VNError errorForInvalidOperationWithLocalizedDescription:v7];

  return v8;
}

+ (id)errorForUnknownErrorWithLocalizedDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:11 userInfo:v5];

  return v6;
}

+ (id)errorForOperationFailedErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  id v4 = [a1 errorWithCode:3 message:a3 underlyingError:a4];

  return v4;
}

+ (id)errorForOperationFailedErrorWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorForOperationFailedErrorWithLocalizedDescription:a3 underlyingError:0];

  return v3;
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  id v4 = [a1 errorWithCode:15 message:a3 underlyingError:a4];

  return v4;
}

+ (id)errorForInvalidModelWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorForInvalidModelWithLocalizedDescription:a3 underlyingError:0];

  return v3;
}

+ (id)errorForInvalidArgument:(id)a3 named:(id)a4
{
  id v6 = a4;
  id v7 = NSString;
  uint64_t v8 = _prettyPrintedValue((objc_object *)a3);
  id v9 = [v7 stringWithFormat:@"argument %@ has an invalid value of %@", v6, v8];

  uint64_t v10 = [a1 errorForInvalidArgumentWithLocalizedDescription:v9];

  return v10;
}

+ (id)errorForInvalidArgumentWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorWithCode:14 message:a3];

  return v3;
}

+ (id)errorForInvalidOptionWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorWithCode:5 message:a3];

  return v3;
}

+ (id)errorForInvalidOption:(id)a3 named:(id)a4 localizedDescription:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = NSString;
  uint64_t v11 = _prettyPrintedValue((objc_object *)a3);
  uint64_t v12 = [v10 stringWithFormat:@"option %@ has an invalid value of %@", v8, v11];

  if ([v9 length])
  {
    uint64_t v13 = [v12 stringByAppendingFormat:@" - %@", v9];

    uint64_t v12 = (void *)v13;
  }
  v14 = [a1 errorForInvalidOptionWithLocalizedDescription:v12];

  return v14;
}

+ (id)errorForInvalidOption:(id)a3 named:(id)a4
{
  id v4 = [a1 errorForInvalidOption:a3 named:a4 localizedDescription:0];

  return v4;
}

+ (id)errorForMissingOptionNamed:(id)a3
{
  id v4 = [NSString stringWithFormat:@"missing option %@", a3];
  uint64_t v5 = [a1 errorWithCode:7 message:v4];

  return v5;
}

+ (id)errorForInvalidOperationForRequestSpecifier:(id)a3
{
  id v4 = [NSString stringWithFormat:@"%@ does not support operation", a3];
  uint64_t v5 = [a1 errorForInvalidOperationWithLocalizedDescription:v4];

  return v5;
}

+ (id)errorForInvalidOperationForRequestClass:(Class)a3 revision:(unint64_t)a4
{
  uint64_t v5 = NSString;
  id v6 = VNRequestRevisionString(a3, a4);
  id v7 = [v5 stringWithFormat:@"%@ does not support operation", v6];

  id v8 = [a1 errorForInvalidOperationWithLocalizedDescription:v7];

  return v8;
}

+ (id)errorForInvalidOperationWithLocalizedDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:12 userInfo:v5];

  return v6;
}

+ (id)errorForOutOfBoundsErrorWithLocalizedDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:4 userInfo:v5];

  return v6;
}

+ (id)errorForUnimplementedMethod:(SEL)a3 ofObject:(id)a4
{
  uint64_t v5 = NSString;
  id v6 = VNMethodSignatureStringForObjectAndSelector(a4, a3);
  id v7 = [v5 stringWithFormat:@"%@ must be overridden", v6];

  uint64_t v8 = [a1 errorForUnimplementedFunctionWithLocalizedDescription:v7];

  return v8;
}

+ (id)errorForUnimplementedFunctionWithLocalizedDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:8 userInfo:v5];

  return v6;
}

+ (id)errorForUnsupportedSerializingHeaderVersion:(unsigned int)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"unsupported serialized header version %u", *(void *)&a3);
  uint64_t v5 = [a1 errorForInvalidFormatErrorWithLocalizedDescription:v4];

  return v5;
}

+ (id)errorForInvalidFormatErrorWithLocalizedDescription:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:2 userInfo:v5];

  return v6;
}

+ (id)errorForExecutionTimeoutWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x1E4F28568], a4, *MEMORY[0x1E4F28A50], 0);
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:20 userInfo:v5];

  return v6;
}

+ (id)errorForExecutionTimeoutWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorForExecutionTimeoutWithLocalizedDescription:a3 underlyingError:0];

  return v3;
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3 underlyingError:(id)a4
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, *MEMORY[0x1E4F28568], a4, *MEMORY[0x1E4F28A50], 0);
  id v6 = [a1 errorWithDomain:@"com.apple.Vision" code:9 userInfo:v5];

  return v6;
}

+ (id)errorForInternalErrorWithLocalizedDescription:(id)a3
{
  id v3 = [a1 errorForInternalErrorWithLocalizedDescription:a3 underlyingError:0];

  return v3;
}

+ (id)errorForInvalidImageFailureWithLocalizedDescription:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [a1 errorWithDomain:@"com.apple.Vision" code:13 userInfo:v6];

  return v7;
}

+ (id)errorForInvalidImageFailure
{
  return (id)[a1 errorForInvalidImageFailureWithLocalizedDescription:0];
}

+ (id)errorForMemoryAllocationFailureWithLocalizedDescription:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = v4;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [a1 errorWithDomain:@"com.apple.Vision" code:10 userInfo:v6];

  return v7;
}

+ (id)errorForMemoryAllocationFailure
{
  return (id)[a1 errorForMemoryAllocationFailureWithLocalizedDescription:0];
}

+ (id)errorForCancellationOfRequest:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = NSString;
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    uint64_t v8 = [v5 stringWithFormat:@"request %@ was cancelled", v7];
  }
  else
  {
    uint64_t v8 = @"request was cancelled";
  }
  uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E4F28568], v4, @"VNRequest", 0);
  uint64_t v10 = [a1 errorWithDomain:@"com.apple.Vision" code:1 userInfo:v9];

  return v10;
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4 underlyingError:(id)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a4, *MEMORY[0x1E4F28568], a5, *MEMORY[0x1E4F28A50], 0);
  uint64_t v8 = [a1 errorWithDomain:@"com.apple.Vision" code:a3 userInfo:v7];

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 message:(id)a4
{
  id v4 = [a1 errorWithCode:a3 message:a4 underlyingError:0];

  return v4;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:a3 code:a4 userInfo:a5];
  [a1 logInternalError:v6];

  return v6;
}

@end