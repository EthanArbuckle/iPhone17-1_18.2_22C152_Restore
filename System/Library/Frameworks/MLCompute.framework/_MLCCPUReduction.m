@interface _MLCCPUReduction
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6;
- (_MLCCPUReduction)initWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5;
@end

@implementation _MLCCPUReduction

- (_MLCCPUReduction)initWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v23, 0x218uLL);
  int v10 = 1;
  switch(a4)
  {
    case 1:
      int v10 = 6;
      goto LABEL_12;
    case 2:
      int v10 = 4;
      goto LABEL_12;
    case 3:
      goto LABEL_13;
    case 4:
      goto LABEL_12;
    case 5:
      int v10 = 2;
      goto LABEL_12;
    case 6:
      int v10 = 3;
      goto LABEL_12;
    case 7:
      int v10 = 9;
      goto LABEL_12;
    case 8:
      int v10 = 10;
      goto LABEL_12;
    case 9:
      int v10 = 11;
LABEL_12:
      int v24 = v10;
LABEL_13:
      v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:536];
      memset(v28, 0, sizeof(v28));
      memset(v27, 0, sizeof(v27));
      v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:176];
      v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v28 length:176];
      memset(v22, 0, sizeof(v22));
      v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:176];
      v26[0] = v13;
      v26[1] = v14;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
      v25 = v15;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      v18 = +[MLCCPUDeviceOps deviceOpsWithType:43 params:v11 inDeltaData:v16 outDeltaData:v17 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

      [v18 setBinaryOperation:0];
      if (v18) {
        [v9 addObject:v18];
      }
      v19 = (void *)[v9 copy];
      v21.receiver = self;
      v21.super_class = (Class)_MLCCPUReduction;
      self = [(_MLCCPULayer *)&v21 initWithDevice:v8 deviceOps:v19];

      v12 = self;
      break;
    default:
      v11 = +[MLCLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[_MLCCPUReduction initWithDevice:reduceType:dimensions:](a2, a4, v11);
      }
      v12 = 0;
      break;
  }

  return v12;
}

+ (id)layerWithDevice:(id)a3 reduceType:(int)a4 dimensions:(id)a5 sourceShapeCount:(unint64_t)a6
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a5;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithDevice:v10 reduceType:v6 dimensions:v9];

  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8 = a5;
  id v37 = a6;
  v35 = [a4 objectAtIndexedSubscript:0];
  id v9 = [v35 params];
  uint64_t v10 = [v9 bytes];

  v11 = [v8 objectAtIndexedSubscript:0];
  v12 = [v11 descriptor];
  v13 = [v12 shape];
  v14 = [v8 objectAtIndexedSubscript:0];
  v15 = [v14 descriptor];
  v16 = [v15 stride];
  v36 = v8;
  v17 = [v8 objectAtIndexedSubscript:0];
  v18 = [v17 descriptor];
  uint64_t v34 = v10;
  LODWORD(v8) = CPU_BuildBNNSNDArrayLastMajorDescriptor(v10, v13, v16, 0, [v18 dataType]);

  if (!v8)
  {
    BOOL v32 = 0;
    v19 = v37;
LABEL_8:
    v28 = v35;
    v27 = v36;
    goto LABEL_9;
  }
  v19 = v37;
  v20 = [v37 descriptor];
  objc_super v21 = [v20 shape];
  v22 = [v37 descriptor];
  v23 = [v22 stride];
  int v24 = [v37 descriptor];
  int MajorDescriptor = CPU_BuildBNNSNDArrayLastMajorDescriptor(v34 + 176, v21, v23, 0, [v24 dataType]);

  if (!MajorDescriptor)
  {
    BOOL v32 = 0;
    goto LABEL_8;
  }
  memset(v38, 0, sizeof(v38));
  LODWORD(v38[0]) = 1;
  uint64_t v26 = MEMORY[0x1E01B0D70](v34, v38);
  v28 = v35;
  v27 = v36;
  if (v26)
  {
    uint64_t v29 = [v36 objectAtIndexedSubscript:0];
    [v35 setSourceStride:CPU_SetBatchStride(v29)];

    [v35 setResultStride:CPU_SetBatchStride(v37)];
  }
  objc_opt_class();
  v30 = objc_opt_new();
  [v35 setLayer:v30];

  v31 = [v35 layer];
  [v31 setFilter:v26];

  BOOL v32 = 1;
LABEL_9:

  return v32;
}

- (void)initWithDevice:(const char *)a1 reduceType:(int)a2 dimensions:(NSObject *)a3 .cold.1(const char *a1, int a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: unknown reduceType type = %d", (uint8_t *)&v6, 0x12u);
}

@end