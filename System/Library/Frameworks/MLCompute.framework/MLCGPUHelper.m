@interface MLCGPUHelper
+ (id)allocateAndCopyToTemporaryMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 batchSize:(unint64_t)a5 copyingKernel:(id)a6 sourceMTLBuffer:(id)a7 MLCDataType:(int)a8 heapAllocator:(id)a9;
+ (id)allocateMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 kernel:(id)a5 batchSize:(unint64_t)a6 heapAllocator:(id)a7 imageBatchIsTemporary:(BOOL)a8;
+ (id)allocateTemporaryMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 kernel:(id)a5 batchSize:(unint64_t)a6;
+ (unint64_t)mtlResourceOptions;
+ (unint64_t)mtlStorageMode;
+ (void)concatChannelsForwardWithParams:(ConcatImageParams)a3 sourceImageBatch:(id)a4 resultImageBatch:(id)a5 commandBuffer:(id)a6 device:(id)a7 deviceIndex:(unint64_t)a8;
+ (void)copyMPSImageBatchToMTLBuffer:(id)a3 commandBuffer:(id)a4 sourceImageBatch:(id)a5 destinationMTLBuffer:(id)a6 MLCDataType:(int)a7;
+ (void)copyMTLBufferToMPSImageBatch:(id)a3 commandBuffer:(id)a4 sourceMTLBuffer:(id)a5 destinationImageBatch:(id)a6 MLCDataType:(int)a7;
@end

@implementation MLCGPUHelper

+ (unint64_t)mtlStorageMode
{
  return 0;
}

+ (unint64_t)mtlResourceOptions
{
  return 0;
}

+ (void)concatChannelsForwardWithParams:(ConcatImageParams)a3 sourceImageBatch:(id)a4 resultImageBatch:(id)a5 commandBuffer:(id)a6 device:(id)a7 deviceIndex:(unint64_t)a8
{
  uint64_t v11 = *(void *)&a3.var0;
  ConcatImageParams v49 = a3;
  char var2 = a3.var2;
  id v13 = a4;
  id v46 = a5;
  id v14 = a6;
  id v15 = a7;
  context = (void *)MEMORY[0x1E01B11E0]();
  v16 = [v13 objectAtIndexedSubscript:0];
  unint64_t v17 = [v16 width];

  v18 = [v13 objectAtIndexedSubscript:0];
  unint64_t v19 = [v18 height];

  unint64_t v41 = v17;
  BOOL v21 = v17 < 9 || v19 < 9;
  if (v21) {
    uint64_t v22 = 8;
  }
  else {
    uint64_t v22 = 16;
  }
  if (v21) {
    char v23 = 3;
  }
  else {
    char v23 = 4;
  }
  uint64_t v24 = [v13 count];
  unsigned int v25 = WORD2(v11);
  BOOL v27 = (v11 & 0x30000) == 0 && v24 != 1;
  BOOL v28 = (var2 & 3) == 0 && v27;
  v45 = v14;
  v29 = [v14 computeCommandEncoderWithDispatchType:v28];
  v44 = v15;
  if (v25 > 4) {
    [v15 gpuPipelineStatesForwardConcat2DArray];
  }
  else {
  v30 = [v15 gpuPipelineStatesForwardConcat2D];
  }
  v31 = [v30 objectAtIndexedSubscript:a8];
  [v29 setComputePipelineState:v31];

  [v29 memoryBarrierWithScope:2];
  if ([v13 count])
  {
    unint64_t v32 = 0;
    unint64_t v33 = (v22 - 1 + v41) >> v23;
    unint64_t v34 = (v22 - 1 + v19) >> v23;
    do
    {
      v35 = [v13 objectAtIndexedSubscript:v32];
      v36 = [v35 texture];
      [v29 setTexture:v36 atIndex:0];

      int var0 = v49.var0;
      v38 = [v46 objectAtIndexedSubscript:v32];
      v39 = [v38 texture];
      if (var0) {
        uint64_t v40 = 1;
      }
      else {
        uint64_t v40 = 2;
      }
      [v29 setTexture:v39 atIndex:v40];

      [v29 setBytes:&v49 length:6 atIndex:0];
      v48[0] = v33;
      v48[1] = v34;
      v48[2] = 1;
      v47[0] = v22;
      v47[1] = v22;
      v47[2] = 1;
      [v29 dispatchThreadgroups:v48 threadsPerThreadgroup:v47];
      ++v32;
    }
    while (v32 < [v13 count]);
  }
  [v29 endEncoding];
  GPU_clearTemporaryImageBatchReadCount(v13);
}

+ (void)copyMTLBufferToMPSImageBatch:(id)a3 commandBuffer:(id)a4 sourceMTLBuffer:(id)a5 destinationImageBatch:(id)a6 MLCDataType:(int)a7
{
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E01B11E0]();
  uint64_t v15 = [v13 count];
  v16 = [v13 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 width];
  v18 = [v13 objectAtIndexedSubscript:0];
  uint64_t v19 = [v18 height] * v17;
  v20 = [v13 objectAtIndexedSubscript:0];
  uint64_t v21 = v19 * [v20 featureChannels];

  uint64_t v22 = GPU_CreateMPSMatrixDesc(v15, v21, 1, a7);
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v12 descriptor:v22];
  [v24 encodeBatchToCommandBuffer:v11 sourceMatrix:v23 destinationImages:v13];
}

+ (void)copyMPSImageBatchToMTLBuffer:(id)a3 commandBuffer:(id)a4 sourceImageBatch:(id)a5 destinationMTLBuffer:(id)a6 MLCDataType:(int)a7
{
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1E01B11E0]();
  uint64_t v15 = [v12 count];
  v16 = [v12 objectAtIndexedSubscript:0];
  uint64_t v17 = [v16 width];
  v18 = [v12 objectAtIndexedSubscript:0];
  uint64_t v19 = [v18 height] * v17;
  v20 = [v12 objectAtIndexedSubscript:0];
  uint64_t v21 = v19 * [v20 featureChannels];

  uint64_t v22 = GPU_CreateMPSMatrixDesc(v15, v21, 1, a7);
  char v23 = (void *)[objc_alloc(MEMORY[0x1E4F35618]) initWithBuffer:v13 descriptor:v22];
  [v24 encodeBatchToCommandBuffer:v11 sourceImages:v12 destinationMatrix:v23];
}

+ (id)allocateTemporaryMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 kernel:(id)a5 batchSize:(unint64_t)a6
{
  return (id)[a1 allocateMPSImageBatchForTensor:a3 commandBuffer:a4 kernel:a5 batchSize:a6 heapAllocator:0 imageBatchIsTemporary:1];
}

+ (id)allocateMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 kernel:(id)a5 batchSize:(unint64_t)a6 heapAllocator:(id)a7 imageBatchIsTemporary:(BOOL)a8
{
  unint64_t v33 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  uint64_t v17 = [v13 descriptor];
  v18 = [v17 shape];
  BOOL v19 = [v18 count] != 1;

  v20 = [v13 descriptor];
  uint64_t v21 = [v20 shape];
  uint64_t v22 = [v21 objectAtIndexedSubscript:v19];
  unint64_t v23 = [v22 unsignedIntegerValue];

  uint64_t v36 = 0;
  unint64_t v37 = v23;
  uint64_t v35 = 0;
  GPU_GetTensorWidthAndHeight(v13, &v36, &v35);
  if (!a6) {
    a6 = objc_msgSend(v13, "calculateBatchSizeToUse", v33);
  }
  if (v23 > kMaxFeatureChannelMPSImage && (GPU_AdjustFeatureChannelBeyondMax(&v36, &v35, &v37, 0) & 1) == 0)
  {
    BOOL v27 = +[MLCLog framework];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[MLCGPUHelper allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:](v33, v13, v27);
    }
    goto LABEL_11;
  }
  id v24 = objc_msgSend(v13, "descriptor", v33);
  int v25 = [v24 dataType];

  int v26 = v25 - 1;
  if ((v25 - 1) >= 6 || ((0x2Du >> v26) & 1) == 0)
  {
    BOOL v27 = +[MLCLog framework];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      +[MLCGPUHelper allocateMPSImageBatchForTensor:commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:](v34, v13, v27);
    }
LABEL_11:
    BOOL v28 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  BOOL v27 = [MEMORY[0x1E4F35578] imageDescriptorWithChannelFormat:qword_1DD1F09E0[v26] width:v36 height:v35 featureChannels:v37];
  if (v16)
  {
    id v30 = v16;
  }
  else
  {
    if (a8) {
      v31 = (void *)MEMORY[0x1E4F35978];
    }
    else {
      v31 = (void *)MEMORY[0x1E4F35530];
    }
    id v30 = [v31 defaultAllocator];
  }
  unint64_t v32 = v30;
  BOOL v28 = [v30 imageBatchForCommandBuffer:v14 imageDescriptor:v27 kernel:v15 count:a6];

LABEL_12:

  return v28;
}

+ (id)allocateAndCopyToTemporaryMPSImageBatchForTensor:(id)a3 commandBuffer:(id)a4 batchSize:(unint64_t)a5 copyingKernel:(id)a6 sourceMTLBuffer:(id)a7 MLCDataType:(int)a8 heapAllocator:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a4;
  v18 = [a1 allocateMPSImageBatchForTensor:a3 commandBuffer:v17 kernel:v16 batchSize:a5 heapAllocator:a9 imageBatchIsTemporary:1];
  [a1 copyMTLBufferToMPSImageBatch:v16 commandBuffer:v17 sourceMTLBuffer:v15 destinationImageBatch:v18 MLCDataType:v9];

  return v18;
}

+ (void)allocateMPSImageBatchForTensor:(NSObject *)a3 commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:.cold.1(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = [a2 descriptor];
  int v7 = 138412546;
  v8 = v5;
  __int16 v9 = 1024;
  int v10 = [v6 dataType];
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: Illegal tensor data type:%d", (uint8_t *)&v7, 0x12u);
}

+ (void)allocateMPSImageBatchForTensor:(NSObject *)a3 commandBuffer:kernel:batchSize:heapAllocator:imageBatchIsTemporary:.cold.2(const char *a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(a1);
  v6 = [a2 descriptor];
  int v7 = [v6 shape];
  v8 = [v7 objectAtIndexedSubscript:1];
  int v9 = 138412546;
  int v10 = v5;
  __int16 v11 = 1024;
  int v12 = [v8 intValue];
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: featureChannel = %d is not supported on GPU", (uint8_t *)&v9, 0x12u);
}

@end