@interface _MLCCPUCompare
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 operation:(int)a4;
- (_MLCCPUCompare)initWithDevice:(id)a3 operation:(int)a4;
@end

@implementation _MLCCPUCompare

- (_MLCCPUCompare)initWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (a4 >= 0xC)
  {
    v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_MLCCPUCompare initWithDevice:operation:](a2, v9);
    }

    int v8 = 0;
  }
  else
  {
    int v8 = dword_1DD1F0D2C[a4];
  }
  memset(v23, 0, 512);
  LODWORD(v23[0]) = v8;
  v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:536];
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v26 length:176];
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v27 length:176];
  memset(v22, 0, sizeof(v22));
  v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:176];
  v25[0] = v11;
  v25[1] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v24 = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v16 = +[MLCCPUDeviceOps deviceOpsWithType:42 params:v10 inDeltaData:v14 outDeltaData:v15 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  [v16 setBinaryOperation:a4 != 8];
  if (v16) {
    [v7 addObject:v16];
  }
  v17 = (void *)[v7 copy];
  v21.receiver = self;
  v21.super_class = (Class)_MLCCPUCompare;
  v18 = [(_MLCCPULayer *)&v21 initWithDevice:v6 deviceOps:v17];

  return v18;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 operation:v4];

  return v7;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8 = a5;
  id v42 = a6;
  v41 = [a4 objectAtIndexedSubscript:0];
  id v9 = [v41 params];
  uint64_t v10 = [v9 bytes];

  uint64_t v40 = v10;
  uint64_t v11 = v10 + 8;
  v12 = [v8 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  v14 = [v13 shape];
  v15 = [v8 objectAtIndexedSubscript:0];
  v16 = [v15 descriptor];
  v17 = [v16 stride];
  v18 = [v8 objectAtIndexedSubscript:0];
  v19 = [v18 descriptor];
  LODWORD(v11) = CPU_BuildBNNSNDArrayLastMajorDescriptor(v11, v14, v17, 0, [v19 dataType]);

  if (v11)
  {
    v20 = v8;
    if ([v8 count] != 2) {
      goto LABEL_4;
    }
    v39 = [v8 objectAtIndexedSubscript:1];
    objc_super v21 = [v39 descriptor];
    v22 = [v21 shape];
    v23 = [v20 objectAtIndexedSubscript:1];
    v24 = [v23 descriptor];
    v25 = [v24 stride];
    v26 = [v20 objectAtIndexedSubscript:1];
    [v26 descriptor];
    uint64_t v28 = v27 = v20;
    int MajorDescriptor = CPU_BuildBNNSNDArrayLastMajorDescriptor(v40 + 184, v22, v25, 0, [v28 dataType]);

    v20 = v27;
    if (!MajorDescriptor)
    {
      char v36 = 0;
      v30 = v42;
    }
    else
    {
LABEL_4:
      v30 = v42;
      v31 = [v42 descriptor];
      v32 = [v31 shape];
      v33 = [v42 descriptor];
      v34 = [v33 stride];
      v35 = [v42 descriptor];
      char v36 = CPU_BuildBNNSNDArrayLastMajorDescriptor(v40 + 360, v32, v34, 0, [v35 dataType]);
    }
    v37 = v41;
  }
  else
  {
    char v36 = 0;
    v37 = v41;
    v30 = v42;
    v20 = v8;
  }

  return v36;
}

- (void)initWithDevice:(const char *)a1 operation:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Unsupported operation.", (uint8_t *)&v4, 0xCu);
}

@end