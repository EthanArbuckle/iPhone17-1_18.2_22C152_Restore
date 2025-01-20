@interface _MLCCPUSoftmax
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5;
- (_MLCCPUSoftmax)initWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5;
@end

@implementation _MLCCPUSoftmax

- (_MLCCPUSoftmax)initWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v27 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  memset(v23, 0, sizeof(v23));
  if (!a4)
  {
    int v10 = 11;
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    int v10 = 21;
LABEL_5:
    LODWORD(v24) = v10;
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:408];
    memset(v22, 0, sizeof(v22));
    memset(v21, 0, sizeof(v21));
    v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:176];
    v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:176];
    v29[0] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
    v28 = v13;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
    v16 = +[MLCCPUDeviceOps deviceOpsWithType:16 params:v11 inDeltaData:v14 outDeltaData:v15 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

    if (v16)
    {
      [v16 setSoftmaxDimension:a5];
      [v9 addObject:v16];
    }
    v17 = (void *)[v9 copy];
    v20.receiver = self;
    v20.super_class = (Class)_MLCCPUSoftmax;
    self = [(_MLCCPULayer *)&v20 initWithDevice:v8 deviceOps:v17];

    v18 = self;
    goto LABEL_11;
  }
  v11 = +[MLCLog framework];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[_MLCCPUSoftmax initWithDevice:operation:dimension:](a4, v11);
  }
  v18 = 0;
LABEL_11:

  return v18;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4 dimension:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithDevice:v8 operation:v6 dimension:a5];

  return v9;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  return +[_MLCCPUNeuron compileWithDevice:a3 deviceOps:a4 sourceTensors:a5 resultTensor:a6];
}

- (void)initWithDevice:(int)a1 operation:(NSObject *)a2 dimension:.cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "-[_MLCCPUSoftmax initWithDevice:operation:dimension:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: Unknown softmaxOp=%d", (uint8_t *)&v2, 0x12u);
}

@end