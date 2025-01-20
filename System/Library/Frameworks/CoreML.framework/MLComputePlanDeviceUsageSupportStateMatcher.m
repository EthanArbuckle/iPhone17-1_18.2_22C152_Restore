@interface MLComputePlanDeviceUsageSupportStateMatcher
+ (id)sharedInstance;
- (MLComputePlanDeviceUsageSupportStateMatcher)init;
- (NSArray)supportStatePatterns;
- (int64_t)matchingSupportStateForValidationMessage:(id)a3;
@end

@implementation MLComputePlanDeviceUsageSupportStateMatcher

- (void).cxx_destruct
{
}

- (NSArray)supportStatePatterns
{
  return self->_supportStatePatterns;
}

- (int64_t)matchingSupportStateForValidationMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(MLComputePlanDeviceUsageSupportStateMatcher *)self supportStatePatterns];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isMatchForValidationMessage:v4])
        {
          int64_t v11 = [v10 supportState];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  int64_t v11 = -1;
LABEL_11:

  return v11;
}

- (MLComputePlanDeviceUsageSupportStateMatcher)init
{
  v34[27] = *MEMORY[0x1E4F143B8];
  v33.receiver = self;
  v33.super_class = (Class)MLComputePlanDeviceUsageSupportStateMatcher;
  result = [(MLComputePlanDeviceUsageSupportStateMatcher *)&v33 init];
  if (result)
  {
    v32 = result;
    v31 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Input cannot run on ANE" supportState:100];
    v34[0] = v31;
    v30 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Invalid input tensor format[:|] (\\w+)" supportState:120];
    v34[1] = v30;
    v29 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Unsupported tensor (\\w+) type (\\w+)" supportState:120];
    v34[2] = v29;
    v28 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Unsupported parameter (\\w+) type (\\w+)" supportState:120];
    v34[3] = v28;
    v27 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Unsupported (\\w+) data type:? \"?(\\w+)\"?" supportState:120];
    v34[4] = v27;
    v26 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"type (\\w+) for (\\S+) is not supported. only support (\\w+)" supportState:120];
    v34[5] = v26;
    v25 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"(\\w+) const (\\w+) is not supported" supportState:120];
    v34[6] = v25;
    v24 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"ANECompiler does not support range shape flexibility" supportState:110];
    v34[7] = v24;
    v23 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Invalid output tensor format[:|] (\\w+)" supportState:220];
    v34[8] = v23;
    v22 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Output type (\\w+) is not supported" supportState:220];
    v34[9] = v22;
    v21 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@" must be positive." supportState:300];
    v34[10] = v21;
    v20 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Impossible to retrieve non-constant tensor shape at index #(\\d+)" supportState:300];
    v34[11] = v20;
    v19 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Unable to resolve operation input [\"|](\\w+)[\"|]" supportState:300];
    v34[12] = v19;
    uint64_t v18 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"kernel (width|height) and (width|height) should be multiple of (\\d+) for large kernel but are (\\d* and \\d*)" supportState:320];
    v34[13] = v18;
    v17 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"input and output (x|y) strides should be the same for conv with large kernel but are \\d+ and \\d+" supportState:320];
    v34[14] = v17;
    long long v16 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Tensor dimensions (N\\d+D\\d+C\\d+H\\d+W\\d+) are not within supported range, (N\\[\\d-\\d+\\]D\\[\\d-\\d+\\]C\\[\\d-\\d+\\]H\\[\\d-\\d+\\]W\\[\\d-\\d+\\])" supportState:320];
    v34[15] = v16;
    long long v15 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"does not support palettized (\\w+) with large kernel" supportState:320];
    v34[16] = v15;
    v3 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"padding on the (\\w+) dimension is not supported" supportState:330];
    v34[17] = v3;
    id v4 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Invalid Pool kernel (width|height) \\(([A-Za-z0-9]*)\\), must be ([0-9\\[\\]-]*) or ([0-9\\[\\]-]*)" supportState:320];
    v34[18] = v4;
    v5 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Failed to retrieve parameter (\\w+)" supportState:340];
    v34[19] = v5;
    uint64_t v6 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"invalid negative step on (\\w+) (\\w+)" supportState:310];
    v34[20] = v6;
    uint64_t v7 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"This platform doesn't support Neuron (\\S+) \\(aka (\\S+)\\)" supportState:400];
    v34[21] = v7;
    uint64_t v8 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Invalid operation. (\\w+)" supportState:400];
    v34[22] = v8;
    v9 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Unsupported MIL operation \"?(\\w+)\"?" supportState:400];
    v34[23] = v9;
    v10 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Cannot divided by zero" supportState:1];
    v34[24] = v10;
    int64_t v11 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"Weight file size (.*?) exceeds the maximum \\((.*?)\\)" supportState:501];
    v34[25] = v11;
    v12 = +[MLComputePlanDeviceUsageSupportStatePattern deviceUsageSupportStatePatternWithPattern:@"live io tensor memory footprint \\((.*?)\\) exceeds the bss limit \\((.*?)\\)" supportState:502];
    v34[26] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:27];
    supportStatePatterns = v32->_supportStatePatterns;
    v32->_supportStatePatterns = (NSArray *)v13;

    return v32;
  }
  return result;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__MLComputePlanDeviceUsageSupportStateMatcher_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_registry;

  return v2;
}

void __61__MLComputePlanDeviceUsageSupportStateMatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_registry;
  sharedInstance_registry = (uint64_t)v1;
}

@end