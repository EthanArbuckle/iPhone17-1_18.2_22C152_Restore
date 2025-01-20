@interface MLCTensor
+ (BOOL)canConvertValue:(float)_S0 toDataType:(int)a4;
+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor;
+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor data:(MLCTensorData *)data;
+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor fillWithData:(NSNumber *)fillData;
+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor randomInitializerType:(MLCRandomInitializerType)randomInitializerType;
+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize;
+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data;
+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType;
+ (MLCTensor)tensorWithSequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data;
+ (MLCTensor)tensorWithSequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType;
+ (MLCTensor)tensorWithShape:(NSArray *)shape;
+ (MLCTensor)tensorWithShape:(NSArray *)shape data:(MLCTensorData *)data dataType:(MLCDataType)dataType;
+ (MLCTensor)tensorWithShape:(NSArray *)shape dataType:(MLCDataType)dataType;
+ (MLCTensor)tensorWithShape:(NSArray *)shape fillWithData:(NSNumber *)fillData dataType:(MLCDataType)dataType;
+ (MLCTensor)tensorWithShape:(NSArray *)shape randomInitializerType:(MLCRandomInitializerType)randomInitializerType;
+ (MLCTensor)tensorWithShape:(NSArray *)shape randomInitializerType:(MLCRandomInitializerType)randomInitializerType dataType:(MLCDataType)dataType;
+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize;
+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data;
+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data dataType:(MLCDataType)dataType;
+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize fillWithData:(float)fillData dataType:(MLCDataType)dataType;
+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType;
+ (id)newDataForTensorDescriptor:(id)a3 fillWithData:(id)a4;
+ (id)newRandomDataForWeightTensorDescriptor:(id)a3 randomInitializerType:(int)a4;
+ (void)initialize;
- (BOOL)bindAndWriteData:(MLCTensorData *)data toDevice:(MLCDevice *)device;
- (BOOL)bindOptimizerData:(NSArray *)data deviceData:(NSArray *)deviceData;
- (BOOL)copyDataFromDeviceMemoryToBytes:(void *)bytes length:(NSUInteger)length synchronizeWithDevice:(BOOL)synchronizeWithDevice;
- (BOOL)dataContainsScalarWhere:(id)a3;
- (BOOL)doesShapeMatchWithTensor:(id)a3;
- (BOOL)hasValidNumerics;
- (BOOL)isLayerParameter;
- (BOOL)isTensorDataTypeInListOfDataTypes:(id)a3;
- (BOOL)skipWritingToDevice;
- (BOOL)synchronizeData;
- (BOOL)synchronizeOptimizerData;
- (MLCDevice)device;
- (MLCLayer)intermediateSumLayer;
- (MLCTensor)initWithTensorDescriptor:(id)a3 tensorData:(id)a4 parentLayers:(id)a5 childLayers:(id)a6 device:(id)a7 deviceMemory:(id)a8;
- (MLCTensor)sharedMemoryTensor;
- (MLCTensor)tensorByDequantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias;
- (MLCTensor)tensorByDequantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias axis:(NSInteger)axis;
- (MLCTensor)tensorByQuantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias axis:(NSInteger)axis;
- (MLCTensor)tensorByQuantizingToType:(MLCDataType)type scale:(float)scale bias:(NSInteger)bias;
- (MLCTensorDescriptor)descriptor;
- (NSArray)optimizerData;
- (NSArray)optimizerDeviceData;
- (NSData)data;
- (NSMutableArray)broadcastabledeviceMemory;
- (NSMutableArray)childLayers;
- (NSMutableArray)deviceMemory;
- (NSMutableArray)parentLayers;
- (NSString)label;
- (NSUInteger)tensorID;
- (id)copyAndReplaceData:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceDataSources;
- (int)computeFlags;
- (int)multiDeviceReductionType;
- (unint64_t)calculateBatchSizeToUse;
- (unint64_t)calculateBatchSizeToUse:(unint64_t)a3;
- (unint64_t)concatDimension;
- (unint64_t)concatOffset;
- (unint64_t)deviceIndex;
- (unint64_t)interleave;
- (unint64_t)readCount;
- (unint64_t)rootSourceGradientTensorCount;
- (unint64_t)rootSourceGradientTensorIndex;
- (unint64_t)rootSourceGradientTensorIndexStart;
- (unint64_t)splitDimension;
- (unint64_t)splitOffset;
- (unint64_t)tensorBatchSize;
- (void)allocateDeviceMemory:(id)a3;
- (void)deallocateDeviceMemory:(id)a3;
- (void)dispatchWriteTensorDataToAllDevices:(id)a3;
- (void)dispatchWriteTensorDataToAllDevices:(id)a3 batchSize:(unint64_t)a4;
- (void)setBroadcastabledeviceMemory:(id)a3;
- (void)setChildLayers:(id)a3;
- (void)setComputeFlags:(int)a3;
- (void)setConcatDimension:(unint64_t)a3;
- (void)setConcatOffset:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceDataSources:(id)a3;
- (void)setDeviceIndex:(unint64_t)a3;
- (void)setDeviceMemory:(id)a3;
- (void)setInterleave:(unint64_t)a3;
- (void)setIntermediateSumLayer:(id)a3;
- (void)setIsLayerParameter:(BOOL)a3;
- (void)setLabel:(NSString *)label;
- (void)setMultiDeviceReductionType:(int)a3;
- (void)setOptimizerData:(id)a3;
- (void)setOptimizerDeviceData:(id)a3;
- (void)setParentLayers:(id)a3;
- (void)setReadCount:(unint64_t)a3;
- (void)setRootSourceGradientTensorCount:(unint64_t)a3;
- (void)setRootSourceGradientTensorIndex:(unint64_t)a3;
- (void)setRootSourceGradientTensorIndexStart:(unint64_t)a3;
- (void)setSharedMemoryTensor:(id)a3;
- (void)setSkipWritingToDevice:(BOOL)a3;
- (void)setSplitDimension:(unint64_t)a3;
- (void)setSplitOffset:(unint64_t)a3;
- (void)setTensorID:(unint64_t)a3;
- (void)writeTensorDataToAllDevices:(id)a3;
- (void)writeTensorDataToAllDevices:(id)a3 batchSize:(unint64_t)a4;
@end

@implementation MLCTensor

+ (void)initialize
{
  if (initialize_onceToken_0 != -1) {
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_4);
  }
}

uint64_t __23__MLCTensor_initialize__block_invoke()
{
  gNextTensorID = 0;
  gLock = 0;
  gGaussian = +[_MLCGaussianRandomGenerator zeroMeanGaussianRandomGenerator];

  return MEMORY[0x1F41817F8]();
}

- (id)copyAndReplaceData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 length];
    v8 = [(MLCTensor *)self descriptor];
    uint64_t v9 = [v8 tensorAllocationSizeInBytes];

    if (v7 != v9)
    {
      v10 = +[MLCLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v19 = NSStringFromSelector(a2);
        uint64_t v20 = [v6 length];
        v21 = [(MLCTensor *)self descriptor];
        int v22 = 138412802;
        v23 = v19;
        __int16 v24 = 2048;
        uint64_t v25 = v20;
        __int16 v26 = 2048;
        uint64_t v27 = [v21 tensorAllocationSizeInBytes];
        _os_log_error_impl(&dword_1DD0C9000, v10, OS_LOG_TYPE_ERROR, "%@: Data size mismatch! data.length=%lu : tensorAllocationSizeInBytes=%lu", (uint8_t *)&v22, 0x20u);
      }
    }
  }
  v11 = self;
  v12 = [(MLCTensor *)v11 descriptor];
  v13 = [(MLCTensor *)v11 parentLayers];
  v14 = [(MLCTensor *)v11 childLayers];
  v15 = [(MLCTensor *)v11 device];
  v16 = [(MLCTensor *)v11 deviceMemory];
  v17 = [(MLCTensor *)v11 initWithTensorDescriptor:v12 tensorData:v6 parentLayers:v13 childLayers:v14 device:v15 deviceMemory:v16];

  return v17;
}

- (MLCTensor)initWithTensorDescriptor:(id)a3 tensorData:(id)a4 parentLayers:(id)a5 childLayers:(id)a6 device:(id)a7 deviceMemory:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id obj = a5;
  id v17 = a5;
  id v37 = a6;
  id v18 = a6;
  id v38 = a7;
  id v19 = a7;
  id v20 = a8;
  v39.receiver = self;
  v39.super_class = (Class)MLCTensor;
  v21 = [(MLCTensor *)&v39 init];
  if (v21)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&gLock);
    uint64_t v22 = gNextTensorID++;
    v21->_tensorID = v22;
    os_unfair_lock_unlock((os_unfair_lock_t)&gLock);
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"data%lu", v21->_tensorID);
    label = v21->_label;
    v21->_label = (NSString *)v23;

    objc_storeStrong((id *)&v21->_descriptor, a3);
    objc_storeStrong((id *)&v21->_data, a4);
    objc_storeStrong((id *)&v21->_parentLayers, obj);
    objc_storeStrong((id *)&v21->_childLayers, v37);
    objc_storeStrong((id *)&v21->_device, v38);
    objc_storeStrong((id *)&v21->_deviceMemory, a8);
    v21->_deviceIndex = 0;
    uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    uint64_t v26 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    broadcastabledeviceMemory = v21->_broadcastabledeviceMemory;
    v21->_broadcastabledeviceMemory = (NSMutableArray *)v26;

    v21->_readCount = 0;
    sharedMemoryTensor = v21->_sharedMemoryTensor;
    v21->_sharedMemoryTensor = 0;

    v21->_concatOffset = 0;
    v21->_concatDimension = 0;
    v21->_splitOffset = 0;
    v21->_splitDimension = 1;
    v21->_multiDeviceReductionType = 0;
    v21->_interleave = 1;
    v21->_rootSourceGradientTensorIndexStart = 0;
    v21->_rootSourceGradientTensorCount = 0;
    intermediateSumLayer = v21->_intermediateSumLayer;
    v21->_rootSourceGradientTensorIndex = 0;
    v21->_intermediateSumLayer = 0;

    uint64_t v30 = [v25 mutableCopy];
    optimizerData = v21->_optimizerData;
    v21->_optimizerData = (NSArray *)v30;

    uint64_t v32 = [v25 mutableCopy];
    optimizerDeviceData = v21->_optimizerDeviceData;
    v21->_optimizerDeviceData = (NSArray *)v32;

    id deviceDataSources = v21->_deviceDataSources;
    v21->_id deviceDataSources = 0;

    v21->_skipWritingToDevice = 0;
    v21->_computeFlags = 0;
  }

  return v21;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor
{
  v4 = tensorDescriptor;
  id v5 = objc_alloc((Class)a1);
  v6 = (void *)MEMORY[0x1E4F1CBF0];
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v8 = (void *)[v6 mutableCopy];
  uint64_t v9 = (void *)[v6 mutableCopy];
  v10 = (void *)[v5 initWithTensorDescriptor:v4 tensorData:0 parentLayers:v7 childLayers:v8 device:0 deviceMemory:v9];

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor data:(MLCTensorData *)data
{
  v6 = data;
  uint64_t v7 = tensorDescriptor;
  id v8 = objc_alloc((Class)a1);
  uint64_t v9 = [(MLCTensorData *)v6 data];

  v10 = (void *)MEMORY[0x1E4F1CBF0];
  v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v12 = (void *)[v10 mutableCopy];
  v13 = (void *)[v10 mutableCopy];
  v14 = (void *)[v8 initWithTensorDescriptor:v7 tensorData:v9 parentLayers:v11 childLayers:v12 device:0 deviceMemory:v13];

  return (MLCTensor *)v14;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor fillWithData:(NSNumber *)fillData
{
  v6 = tensorDescriptor;
  uint64_t v7 = (void *)[a1 newDataForTensorDescriptor:v6 fillWithData:fillData];
  id v8 = [a1 tensorWithDescriptor:v6 data:v7];

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithDescriptor:(MLCTensorDescriptor *)tensorDescriptor randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v4 = *(void *)&randomInitializerType;
  v6 = tensorDescriptor;
  uint64_t v7 = (void *)[a1 newRandomDataForWeightTensorDescriptor:v6 randomInitializerType:v4];
  id v8 = [a1 tensorWithDescriptor:v6 data:v7];

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape
{
  uint64_t v4 = +[MLCTensorDescriptor descriptorWithShape:shape dataType:1];
  id v5 = [a1 tensorWithDescriptor:v4];

  return (MLCTensor *)v5;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v4 = *(void *)&randomInitializerType;
  v6 = +[MLCTensorDescriptor descriptorWithShape:shape dataType:1];
  uint64_t v7 = [a1 tensorWithDescriptor:v6 randomInitializerType:v4];

  return (MLCTensor *)v7;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape randomInitializerType:(MLCRandomInitializerType)randomInitializerType dataType:(MLCDataType)dataType
{
  uint64_t v5 = *(void *)&randomInitializerType;
  uint64_t v7 = +[MLCTensorDescriptor descriptorWithShape:shape dataType:*(void *)&dataType];
  id v8 = [a1 tensorWithDescriptor:v7 randomInitializerType:v5];

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape dataType:(MLCDataType)dataType
{
  uint64_t v5 = +[MLCTensorDescriptor descriptorWithShape:shape dataType:*(void *)&dataType];
  v6 = [a1 tensorWithDescriptor:v5];

  return (MLCTensor *)v6;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape fillWithData:(NSNumber *)fillData dataType:(MLCDataType)dataType
{
  uint64_t v5 = *(void *)&dataType;
  id v8 = fillData;
  uint64_t v9 = +[MLCTensorDescriptor descriptorWithShape:shape dataType:v5];
  v10 = [a1 tensorWithDescriptor:v9 fillWithData:v8];

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithShape:(NSArray *)shape data:(MLCTensorData *)data dataType:(MLCDataType)dataType
{
  uint64_t v5 = *(void *)&dataType;
  id v8 = data;
  uint64_t v9 = +[MLCTensorDescriptor descriptorWithShape:shape dataType:v5];
  v10 = [a1 tensorWithDescriptor:v9 data:v8];

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize
{
  uint64_t v7 = +[MLCTensorDescriptor descriptorWithWidth:width height:height featureChannelCount:featureChannelCount batchSize:batchSize];
  id v8 = [a1 tensorWithDescriptor:v7];

  return (MLCTensor *)v8;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize fillWithData:(float)fillData dataType:(MLCDataType)dataType
{
  v10 = +[MLCTensorDescriptor descriptorWithWidth:width height:height featureChannelCount:featureChannelCount batchSize:batchSize dataType:*(void *)&dataType];
  *(float *)&double v11 = fillData;
  v12 = [NSNumber numberWithFloat:v11];
  v13 = [a1 tensorWithDescriptor:v10 fillWithData:v12];

  return (MLCTensor *)v13;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v7 = *(void *)&randomInitializerType;
  uint64_t v9 = +[MLCTensorDescriptor descriptorWithWidth:width height:height featureChannelCount:featureChannelCount batchSize:batchSize];
  v10 = [a1 tensorWithDescriptor:v9 randomInitializerType:v7];

  return (MLCTensor *)v10;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data
{
  v12 = data;
  v13 = +[MLCTensorDescriptor descriptorWithWidth:width height:height featureChannelCount:featureChannelCount batchSize:batchSize];
  v14 = [a1 tensorWithDescriptor:v13 data:v12];

  return (MLCTensor *)v14;
}

+ (MLCTensor)tensorWithWidth:(NSUInteger)width height:(NSUInteger)height featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data dataType:(MLCDataType)dataType
{
  uint64_t v8 = *(void *)&dataType;
  v14 = data;
  id v15 = +[MLCTensorDescriptor descriptorWithWidth:width height:height featureChannelCount:featureChannelCount batchSize:batchSize dataType:v8];
  id v16 = [a1 tensorWithDescriptor:v15 data:v14];

  return (MLCTensor *)v16;
}

+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize
{
  uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:batchSize];
  if (batchSize)
  {
    uint64_t v10 = 0;
    do
    {
      double v11 = [NSNumber numberWithUnsignedInteger:sequenceLength];
      [v9 setObject:v11 atIndexedSubscript:v10];

      ++v10;
    }
    while (batchSize != v10);
  }
  v12 = (void *)[v9 copy];
  v13 = [a1 tensorWithSequenceLengths:v12 sortedSequences:1 featureChannelCount:featureChannelCount batchSize:batchSize randomInitializerType:1];

  return (MLCTensor *)v13;
}

+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v6 = *(void *)&randomInitializerType;
  double v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:batchSize];
  if (batchSize)
  {
    uint64_t v12 = 0;
    do
    {
      v13 = [NSNumber numberWithUnsignedInteger:sequenceLength];
      [v11 setObject:v13 atIndexedSubscript:v12];

      ++v12;
    }
    while (batchSize != v12);
  }
  v14 = (void *)[v11 copy];
  id v15 = [a1 tensorWithSequenceLengths:v14 sortedSequences:1 featureChannelCount:featureChannelCount batchSize:batchSize randomInitializerType:v6];

  return (MLCTensor *)v15;
}

+ (MLCTensor)tensorWithSequenceLength:(NSUInteger)sequenceLength featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data
{
  uint64_t v10 = data;
  double v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:batchSize];
  if (batchSize)
  {
    uint64_t v12 = 0;
    do
    {
      v13 = [NSNumber numberWithUnsignedInteger:sequenceLength];
      [v11 setObject:v13 atIndexedSubscript:v12];

      ++v12;
    }
    while (batchSize != v12);
  }
  v14 = (void *)[v11 copy];
  id v15 = [a1 tensorWithSequenceLengths:v14 sortedSequences:1 featureChannelCount:featureChannelCount batchSize:batchSize data:v10];

  return (MLCTensor *)v15;
}

+ (MLCTensor)tensorWithSequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize randomInitializerType:(MLCRandomInitializerType)randomInitializerType
{
  uint64_t v7 = *(void *)&randomInitializerType;
  v25[3] = *MEMORY[0x1E4F143B8];
  v13 = sequenceLengths;
  v14 = v13;
  if (sortedSequences)
  {
    id v15 = [(NSArray *)v13 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 unsignedIntegerValue];

    id v17 = [NSNumber numberWithUnsignedInteger:batchSize];
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v16, v17);
    v25[1] = v18;
    id v19 = [NSNumber numberWithUnsignedInteger:featureChannelCount];
    v25[2] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
    v21 = +[MLCTensorDescriptor descriptorWithShape:v20 sequenceLengths:v14 sortedSequences:1 dataType:1];

    uint64_t v22 = (void *)[(id)objc_opt_class() newRandomDataForWeightTensorDescriptor:v21 randomInitializerType:v7];
    uint64_t v23 = [a1 tensorWithDescriptor:v21 data:v22];
  }
  else
  {
    v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[MLCTensor tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:](a2);
    }
    uint64_t v23 = 0;
  }

  return (MLCTensor *)v23;
}

+ (MLCTensor)tensorWithSequenceLengths:(NSArray *)sequenceLengths sortedSequences:(BOOL)sortedSequences featureChannelCount:(NSUInteger)featureChannelCount batchSize:(NSUInteger)batchSize data:(MLCTensorData *)data
{
  v24[3] = *MEMORY[0x1E4F143B8];
  v13 = sequenceLengths;
  v14 = data;
  if (sortedSequences)
  {
    id v15 = [(NSArray *)v13 objectAtIndexedSubscript:0];
    uint64_t v16 = [v15 unsignedIntegerValue];

    id v17 = [NSNumber numberWithUnsignedInteger:batchSize];
    id v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v16, v17);
    v24[1] = v18;
    id v19 = [NSNumber numberWithUnsignedInteger:featureChannelCount];
    v24[2] = v19;
    id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    v21 = +[MLCTensorDescriptor descriptorWithShape:v20 sequenceLengths:v13 sortedSequences:1 dataType:1];

    if (v14) {
      [a1 tensorWithDescriptor:v21 data:v14];
    }
    else {
    uint64_t v22 = [a1 tensorWithDescriptor:v21];
    }
  }
  else
  {
    v21 = +[MLCLog framework];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      +[MLCTensor tensorWithSequenceLengths:sortedSequences:featureChannelCount:batchSize:randomInitializerType:](a2);
    }
    uint64_t v22 = 0;
  }

  return (MLCTensor *)v22;
}

- (BOOL)dataContainsScalarWhere:(id)a3
{
  v22[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(MLCTensor *)self data];

  if (v5)
  {
    uint64_t v6 = [(MLCTensor *)self descriptor];
    uint64_t v7 = [v6 dimensionCount];
    uint64_t v8 = (char *)&v13[-1] - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v8, 8 * v7);
    uint64_t v17 = 0;
    id v18 = (id *)&v17;
    uint64_t v19 = 0x3042000000;
    id v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22[0] = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__MLCTensor_dataContainsScalarWhere___block_invoke;
    v13[3] = &unk_1E6CB4FA8;
    v13[4] = self;
    uint64_t v16 = v8;
    id v14 = v4;
    id v15 = &v17;
    uint64_t v9 = (uint64_t (**)(void, void))MEMORY[0x1E01B13D0](v13);
    objc_storeWeak(v18 + 5, v9);
    char v10 = v9[2](v9, 0);

    _Block_object_dispose(&v17, 8);
    objc_destroyWeak(v22);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

BOOL __37__MLCTensor_dataContainsScalarWhere___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) descriptor];
  uint64_t v5 = [v4 dimensionCount] - 1;

  if (v5 == a2)
  {
    id v6 = [*(id *)(a1 + 32) data];
    uint64_t v7 = [v6 bytes];

    if (a2)
    {
      uint64_t v8 = 0;
      do
      {
        uint64_t v9 = [*(id *)(a1 + 32) descriptor];
        char v10 = [v9 stride];
        double v11 = [v10 objectAtIndexedSubscript:v8];
        v7 += *(void *)(*(void *)(a1 + 56) + 8 * v8) * [v11 unsignedIntegerValue];

        ++v8;
      }
      while (a2 != v8);
    }
    unint64_t v12 = 0;
    do
    {
      v13 = [*(id *)(a1 + 32) descriptor];
      id v14 = [v13 shape];
      id v15 = [v14 objectAtIndexedSubscript:a2];
      unint64_t v16 = [v15 unsignedIntegerValue];

      BOOL v17 = v12 < v16;
      if (v12 >= v16) {
        break;
      }
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = [*(id *)(a1 + 32) descriptor];
      id v20 = [v19 stride];
      v21 = [v20 objectAtIndexedSubscript:a2];
      LOBYTE(v18) = (*(uint64_t (**)(uint64_t, unint64_t))(v18 + 16))(v18, v7 + [v21 unsignedIntegerValue] * v12);

      ++v12;
    }
    while ((v18 & 1) == 0);
  }
  else
  {
    unint64_t v22 = 0;
    do
    {
      uint64_t v23 = [*(id *)(a1 + 32) descriptor];
      __int16 v24 = [v23 shape];
      uint64_t v25 = [v24 objectAtIndexedSubscript:a2];
      unint64_t v26 = [v25 unsignedIntegerValue];

      BOOL v17 = v22 < v26;
      if (v22 >= v26) {
        break;
      }
      *(void *)(*(void *)(a1 + 56) + 8 * a2) = v22;
      WeakRetained = (uint64_t (**)(id, uint64_t))objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48)
                                                                                                  + 8)
                                                                                      + 40));
      int v28 = WeakRetained[2](WeakRetained, a2 + 1);

      ++v22;
    }
    while (!v28);
  }
  return v17;
}

- (BOOL)hasValidNumerics
{
  v3 = [(MLCTensor *)self descriptor];
  if (([v3 isFloatingPoint] & 1) == 0)
  {

    return 1;
  }
  id v4 = [(MLCTensor *)self data];

  if (!v4) {
    return 1;
  }
  uint64_t v5 = [(MLCTensor *)self descriptor];
  int v6 = [v5 dataType];

  if (v6 == 3) {
    uint64_t v7 = &__block_literal_global_11;
  }
  else {
    uint64_t v7 = &__block_literal_global_13;
  }
  return ![(MLCTensor *)self dataContainsScalarWhere:v7];
}

BOOL __29__MLCTensor_hasValidNumerics__block_invoke(uint64_t a1, _WORD *a2)
{
  return (*a2 & 0x7FFFu) > 0x7BFF;
}

BOOL __29__MLCTensor_hasValidNumerics__block_invoke_2(uint64_t a1, _DWORD *a2)
{
  return (*a2 & 0x7FFFFFFFu) > 0x7F7FFFFF;
}

- (BOOL)copyDataFromDeviceMemoryToBytes:(void *)bytes length:(NSUInteger)length synchronizeWithDevice:(BOOL)synchronizeWithDevice
{
  BOOL v5 = synchronizeWithDevice;
  char v10 = [(MLCTensor *)self device];

  if (!v10)
  {
    unint64_t v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:](a2);
    }
    goto LABEL_11;
  }
  double v11 = [(MLCTensor *)self deviceMemory];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    unint64_t v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:](a2);
    }
LABEL_11:

    return 0;
  }
  v13 = [(MLCTensor *)self descriptor];
  NSUInteger v14 = [v13 tensorAllocationSizeInBytes];

  if (v14 > length)
  {
    id v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:]();
    }

    return 0;
  }
  if (v5)
  {
    uint64_t v18 = [(MLCTensor *)self device];
    uint64_t v19 = [v18 computeEngine];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      v21 = [(MLCTensor *)self device];
      unint64_t v22 = [v21 computeEngine];
      int v23 = [v22 synchronizeTensorOnHost:self];

      if (!v23) {
        return 0;
      }
    }
  }
  __int16 v24 = [(MLCTensor *)self device];
  uint64_t v25 = [v24 computeEngine];
  [v25 readTensor:self targetBuffer:bytes];

  return 1;
}

- (BOOL)bindAndWriteData:(MLCTensorData *)data toDevice:(MLCDevice *)device
{
  int v6 = data;
  uint64_t v7 = device;
  unint64_t v8 = [(MLCTensorData *)v6 length];
  uint64_t v9 = [(MLCTensor *)self descriptor];
  unint64_t v10 = [v9 tensorAllocationSizeInBytes];

  if (v8 >= v10)
  {
    MLCDeviceType v11 = [(MLCDevice *)v7 type];
    BOOL v12 = [(MLCTensor *)self isLayerParameter];
    if (v11)
    {
      if (!v12)
      {
        uint64_t v25 = [(MLCTensorData *)v6 data];
        [(MLCTensor *)self setData:v25];

        unint64_t v26 = [(MLCTensor *)self calculateBatchSizeToUse];
        uint64_t v27 = [(MLCDevice *)v7 computeEngine];
        int v28 = [v27 needToAllocateDeviceMemoryForTensor:self];

        if (v28) {
          [(MLCTensor *)self allocateDeviceMemory:v7];
        }
        [(MLCTensor *)self writeTensorDataToAllDevices:v7 batchSize:v26];
        goto LABEL_21;
      }
      v13 = [(MLCTensor *)self data];
      NSUInteger v14 = [(MLCTensorData *)v6 data];

      if (v13 == v14) {
        goto LABEL_19;
      }
    }
    else
    {
      if (!v12)
      {
        v29 = [(MLCTensorData *)v6 data];
        [(MLCTensor *)self setData:v29];

        uint64_t v30 = [(MLCTensor *)self data];
        v31 = [(MLCTensor *)self deviceMemory];
        [v31 setObject:v30 atIndexedSubscript:0];

LABEL_20:
LABEL_21:
        [(MLCTensor *)self setDevice:v7];
        goto LABEL_22;
      }
      uint64_t v16 = [(MLCTensor *)self data];
      if (!v16) {
        goto LABEL_17;
      }
      BOOL v17 = (void *)v16;
      uint64_t v18 = [(MLCTensor *)self data];
      uint64_t v19 = [(MLCTensorData *)v6 data];

      if (v18 == v19)
      {
LABEL_17:
        id v20 = [(MLCTensorData *)v6 data];
        [(MLCTensor *)self setData:v20];
        goto LABEL_18;
      }
    }
    id v20 = [(MLCTensor *)self data];
    v21 = (void *)[v20 bytes];
    id v22 = [(MLCTensorData *)v6 data];
    int v23 = (const void *)[v22 bytes];
    __int16 v24 = [(MLCTensor *)self data];
    memcpy(v21, v23, [v24 length]);

LABEL_18:
LABEL_19:
    uint64_t v30 = [(MLCDevice *)v7 computeEngine];
    [v30 reloadParameterDataFromHostToDeviceMemoryForTensor:self];
    goto LABEL_20;
  }
  id v15 = +[MLCLog framework];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[MLCTensor copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:]();
  }

LABEL_22:
  return v8 >= v10;
}

- (BOOL)synchronizeData
{
  v3 = [(MLCTensor *)self device];

  if (!v3) {
    return 1;
  }
  id v4 = [(MLCTensor *)self deviceMemory];
  uint64_t v5 = [v4 count];

  if (!v5) {
    return 1;
  }
  int v6 = [(MLCTensor *)self device];
  uint64_t v7 = [v6 computeEngine];
  unint64_t v8 = [v7 getHostPointerIfUnifiedDeviceMemory:self];

  if (v8)
  {
    [(MLCTensor *)self setData:v8];
  }
  else
  {
    unint64_t v8 = [(MLCTensor *)self data];
    if (!v8)
    {
      unint64_t v10 = [(MLCTensor *)self descriptor];
      size_t v11 = [v10 tensorAllocationSizeInBytes];

      BOOL v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_calloc(v11, 1uLL, 0x100004077774924uLL), v11, 1);
      [(MLCTensor *)self setData:v12];

      unint64_t v8 = 0;
    }
  }
  v13 = [(MLCTensor *)self device];
  NSUInteger v14 = [v13 computeEngine];
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0
    && ([(MLCTensor *)self device],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        [v16 computeEngine],
        BOOL v17 = objc_claimAutoreleasedReturnValue(),
        int v18 = [v17 synchronizeTensorOnHost:self],
        v17,
        v16,
        !v18))
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v19 = [(MLCTensor *)self device];
    id v20 = [v19 computeEngine];
    id v21 = [(MLCTensor *)self data];
    objc_msgSend(v20, "readTensor:targetBuffer:", self, objc_msgSend(v21, "bytes"));

    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)synchronizeOptimizerData
{
  uint64_t v3 = [(MLCTensor *)self device];
  if (v3)
  {
    id v4 = (void *)v3;
    uint64_t v5 = [(MLCTensor *)self optimizerDeviceData];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      uint64_t v7 = [(MLCTensor *)self deviceMemory];
      uint64_t v8 = [v7 count];

      if (v8)
      {
        if (![(MLCTensor *)self isLayerParameter])
        {
          uint64_t v16 = [(MLCTensor *)self device];
          BOOL v17 = [v16 computeEngine];
          [v17 synchronizeOptimizerUpdatesForTensor:self];

          int v18 = [(MLCTensor *)self device];
          uint64_t v19 = [v18 computeEngine];
          [v19 commitAndWaitForCompletion:0];

          v13 = [(MLCTensor *)self device];
          id v20 = [v13 computeEngine];
          [v20 convertUpdatesToTensorDataForTensorParameters:self];
LABEL_12:

          return 1;
        }
        BOOL v9 = [(MLCTensor *)self childLayers];
        uint64_t v10 = [v9 count];

        if (v10)
        {
          unint64_t v11 = 0;
          while (1)
          {
            BOOL v12 = [(MLCTensor *)self childLayers];
            v13 = [v12 objectAtIndexedSubscript:v11];

            if ([v13 isTrainable]) {
              break;
            }

            ++v11;
            NSUInteger v14 = [(MLCTensor *)self childLayers];
            unint64_t v15 = [v14 count];

            if (v11 >= v15) {
              return 1;
            }
          }
          id v21 = [(MLCTensor *)self device];
          id v22 = [v21 computeEngine];
          [v22 synchronizeUpdatesForLayer:v13];

          int v23 = [(MLCTensor *)self device];
          __int16 v24 = [v23 computeEngine];
          [v24 commitAndWaitForCompletion:0];

          id v20 = [(MLCTensor *)self device];
          uint64_t v25 = [v20 computeEngine];
          [v25 convertUpdatesToTensorDataForLayer:v13];

          goto LABEL_12;
        }
      }
    }
  }
  return 1;
}

- (BOOL)bindOptimizerData:(NSArray *)data deviceData:(NSArray *)deviceData
{
  uint64_t v6 = deviceData;
  [(MLCTensor *)self setOptimizerData:data];
  if (v6) {
    [(MLCTensor *)self setOptimizerDeviceData:v6];
  }

  return 1;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCTensor *)self label];
  uint64_t v7 = [(MLCTensor *)self descriptor];
  uint64_t v8 = [(MLCTensor *)self data];
  BOOL v9 = [(MLCTensor *)self deviceMemory];
  uint64_t v10 = [v3 stringWithFormat:@"%@: { label=%@ : tensorDescriptor=%@ : tensorData=%@ : deviceMemory=%@ }", v5, v6, v7, v8, v9];

  return v10;
}

- (BOOL)doesShapeMatchWithTensor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MLCTensor *)self descriptor];
  uint64_t v6 = [v5 shape];
  uint64_t v7 = [v6 count];
  int v28 = v4;
  uint64_t v8 = [v4 descriptor];
  BOOL v9 = [v8 shape];
  uint64_t v10 = [v9 count];

  if (v7 == v10)
  {
    unint64_t v11 = [(MLCTensor *)self descriptor];
    BOOL v12 = [v11 shape];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      unint64_t v14 = 0;
      do
      {
        unint64_t v15 = [(MLCTensor *)self descriptor];
        uint64_t v16 = [v15 shape];
        BOOL v17 = [v16 objectAtIndexedSubscript:v14];
        uint64_t v18 = [v17 unsignedIntegerValue];
        uint64_t v19 = [v28 descriptor];
        id v20 = [v19 shape];
        id v21 = [v20 objectAtIndexedSubscript:v14];
        uint64_t v22 = [v21 unsignedIntegerValue];

        BOOL v23 = v18 == v22;
        if (v18 != v22) {
          break;
        }
        ++v14;
        __int16 v24 = [(MLCTensor *)self descriptor];
        uint64_t v25 = [v24 shape];
        unint64_t v26 = [v25 count];
      }
      while (v14 < v26);
    }
    else
    {
      BOOL v23 = 1;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (unint64_t)calculateBatchSizeToUse
{
  return [(MLCTensor *)self calculateBatchSizeToUse:0];
}

- (unint64_t)calculateBatchSizeToUse:(unint64_t)a3
{
  uint64_t v5 = [(MLCTensor *)self descriptor];
  uint64_t v6 = [v5 shape];
  uint64_t v7 = [v6 count];

  if (v7 == 1) {
    return 1;
  }
  BOOL v9 = [(MLCTensor *)self descriptor];
  uint64_t v10 = [v9 shape];
  unint64_t v11 = [v10 objectAtIndexedSubscript:0];
  unint64_t v12 = [v11 unsignedIntegerValue];

  if (v12 >= a3) {
    unint64_t v13 = a3;
  }
  else {
    unint64_t v13 = v12;
  }
  if (a3) {
    return v13;
  }
  else {
    return v12;
  }
}

- (void)allocateDeviceMemory:(id)a3
{
  id v6 = a3;
  if ([v6 type])
  {
    id v4 = [v6 computeEngine];
    [v4 allocateDeviceMemoryForTensor:self];
  }
  else
  {
    id v4 = [(MLCTensor *)self deviceMemory];
    uint64_t v5 = [(MLCTensor *)self data];
    [v4 addObject:v5];
  }
}

- (void)deallocateDeviceMemory:(id)a3
{
  id v4 = [a3 computeEngine];
  [v4 deallocateDeviceMemoryForTensor:self];
}

- (void)writeTensorDataToAllDevices:(id)a3
{
  id v4 = [a3 computeEngine];
  [v4 broadcastTensor:self];
}

- (void)writeTensorDataToAllDevices:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = [a3 computeEngine];
  [v6 broadcastTensor:self batchSize:a4];
}

- (void)dispatchWriteTensorDataToAllDevices:(id)a3
{
  id v4 = [a3 computeEngine];
  [v4 dispatchBroadcastTensor:self];
}

- (void)dispatchWriteTensorDataToAllDevices:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = [a3 computeEngine];
  [v6 dispatchBroadcastTensor:self batchSize:a4];
}

+ (BOOL)canConvertValue:(float)_S0 toDataType:(int)a4
{
  BOOL result = 0;
  switch(a4)
  {
    case 1:
    case 4:
      BOOL result = 1;
      break;
    case 3:
      float v5 = fabsf(_S0);
      __asm { FCVT            H0, S0 }
      short float v11 = fabsl(_H0);
      if (v5 == INFINITY) {
        BOOL result = v11 == COERCE_SHORT_FLOAT(31744);
      }
      else {
        BOOL result = v11 > COERCE_SHORT_FLOAT(31744) || v11 < COERCE_SHORT_FLOAT(31744);
      }
      break;
    case 6:
      BOOL result = _S0 <= 1.0 && _S0 >= 0.0;
      break;
    default:
      return result;
  }
  return result;
}

+ (id)newDataForTensorDescriptor:(id)a3 fillWithData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  size_t v8 = [v7 tensorAllocationSizeInBytes];
  int v9 = [v7 dataType];
  uint64_t v10 = (float *)malloc_type_malloc(v8, 0xCA03E5B1uLL);
  vDSP_Length v11 = [v7 elementCount];

  switch(v9)
  {
    case 0:
    case 10:
      unint64_t v12 = +[MLCLog framework];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MLCDeviceGPU multiDeviceTensorReduction:sourceBuffer:targetBuffer:](a2);
      }

      break;
    case 1:
      [v6 floatValue];
      LODWORD(__A) = v13;
      vDSP_vfill((const float *)&__A, v10, 1, v11);
      break;
    case 3:
      [v6 floatValue];
      __asm { FCVT            H0, S0 }
      LOWORD(__A) = _S0;
      WORD1(__A) = _S0;
      goto LABEL_13;
    case 4:
      int v19 = [v6 BOOLValue];
      goto LABEL_10;
    case 5:
      uint64_t __A = [v6 longLongValue];
      goto LABEL_15;
    case 6:
      [v6 floatValue];
      int v19 = (int)(float)(v20 * 255.0);
LABEL_10:
      memset(v10, v19, v8);
      break;
    case 7:
      LODWORD(__A) = [v6 intValue];
      goto LABEL_13;
    case 8:
      LODWORD(__A) = 16843009 * [v6 intValue];
LABEL_13:
      memset_pattern4(v10, &__A, v8);
      break;
    case 9:
      LODWORD(__A) = 16843009 * [v6 intValue];
LABEL_15:
      memset_pattern8(v10, &__A, v8);
      break;
    default:
      break;
  }
  id v21 = +[MLCTensorData dataWithBytesNoCopy:v10 length:v8 freeWhenDone:1];

  return v21;
}

+ (id)newRandomDataForWeightTensorDescriptor:(id)a3 randomInitializerType:(int)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 fanIn];
  uint64_t v7 = [v5 fanOut];
  uint64_t v8 = [v5 elementCount];
  if (v6 | v7) {
    goto LABEL_8;
  }
  if ((a4 & 0xFFFFFFFE) != 2)
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
LABEL_8:
    size_t v46 = [v5 tensorAllocationSizeInBytes];
    BOOL v17 = (float *)malloc_type_malloc(v46, 0x8AECF894uLL);
    BOOL v18 = +[MLCPlatformInfo isRNGSeeded];
    if (v18) {
      srand48(+[MLCPlatformInfo randomSeed]);
    }
    int v19 = malloc_type_malloc(4 * v8, 0x100004052888210uLL);
    arc4random_buf(v19, 4 * v8);
    if (v8)
    {
      uint64_t v21 = 0;
      float v22 = (float)(unint64_t)(v6 + v7);
      float v23 = sqrtf(6.0 / v22);
      float v24 = -v23;
      float v25 = 1.0 / v22;
      float v26 = v23 + v23;
      v44 = &v48;
      _S13 = 0.0;
      do
      {
        switch(a4)
        {
          case 1:
            uint32_t v30 = arc4random();
            if (v18) {
              double v31 = drand48();
            }
            else {
              double v31 = (double)v30 / 4294967300.0;
            }
            _S13 = v31;
            break;
          case 3:
            [(id)gGaussian sample];
            *(float *)&double v29 = v29;
            _S13 = v25 * *(float *)&v29;
            break;
          case 2:
            if (v18)
            {
              double v28 = drand48();
            }
            else
            {
              LODWORD(v20) = *((_DWORD *)v19 + v21);
              double v28 = (double)v20 / 4294967300.0;
            }
            float v33 = v28;
            _S13 = v24 + (float)(v33 * v26);
            break;
          default:
            uint64_t v32 = +[MLCLog framework];
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
              +[MLCTensor newRandomDataForWeightTensorDescriptor:randomInitializerType:]((uint64_t)v49, (uint64_t)a2);
            }

            break;
        }
        int v34 = objc_msgSend(v5, "dataType", v44);
        switch(v34)
        {
          case 1:
            v17[v21] = _S13;
            break;
          case 4:
            *((unsigned char *)v17 + v21) = _S13 >= 0.5;
            break;
          case 3:
            __asm { FCVT            H0, S13 }
            *((_WORD *)v17 + v21) = _H0;
            break;
          default:
            v40 = +[MLCLog framework];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              +[MLCTensor newRandomDataForWeightTensorDescriptor:randomInitializerType:]((uint64_t)v47, (uint64_t)a2);
            }

            break;
        }
        ++v21;
      }
      while (v8 != v21);
    }
    free(v19);
    v41 = +[MLCTensorData dataWithBytesNoCopy:v17 length:v46 freeWhenDone:1];
    goto LABEL_38;
  }
  if ([v5 dimensionCount] == 4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 1;
    do
    {
      vDSP_Length v11 = [v5 shape];
      unint64_t v12 = [v11 objectAtIndexedSubscript:v9];
      v10 *= [v12 unsignedIntegerValue];

      ++v9;
    }
    while (v9 != 4);
    int v13 = [v5 shape];
    unint64_t v14 = [v13 objectAtIndexedSubscript:2];
    uint64_t v6 = [v14 unsignedIntegerValue] * v10;

    unint64_t v15 = [v5 shape];
    uint64_t v16 = [v15 objectAtIndexedSubscript:3];
    uint64_t v7 = [v16 unsignedIntegerValue] * v10;

    goto LABEL_8;
  }
  v43 = +[MLCLog framework];
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    +[MLCTensor newRandomDataForWeightTensorDescriptor:randomInitializerType:]();
  }

  v41 = 0;
LABEL_38:

  return v41;
}

- (BOOL)isTensorDataTypeInListOfDataTypes:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = [(MLCTensor *)self descriptor];
      int v7 = [v6 dataType];
      uint64_t v8 = [v4 objectAtIndexedSubscript:v5];
      int v9 = [v8 intValue];

      BOOL v10 = v7 == v9;
      if (v7 == v9) {
        break;
      }
      ++v5;
    }
    while (v5 < [v4 count]);
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (unint64_t)tensorBatchSize
{
  uint64_t v3 = [(MLCTensor *)self descriptor];
  id v4 = [v3 shape];
  if ([v4 count] == 1)
  {
    unint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [(MLCTensor *)self descriptor];
    int v7 = [v6 shape];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    unint64_t v5 = [v8 unsignedIntegerValue];
  }
  return v5;
}

- (MLCTensor)tensorByQuantizingToType:(MLCDataType)type scale:(float)scale bias:(NSInteger)bias
{
  uint64_t v5 = *(void *)&type;
  float v17 = scale;
  NSInteger v16 = bias;
  int v7 = (void *)MEMORY[0x1E01B11E0](self, a2);
  uint64_t v8 = +[MLCTensorDescriptor descriptorWithShape:&unk_1F3876EE8 stride:0 dataType:1];
  int v9 = +[MLCTensorData dataWithBytes:&v17 length:4];
  BOOL v10 = +[MLCTensor tensorWithDescriptor:v8 data:v9];

  vDSP_Length v11 = +[MLCTensorDescriptor descriptorWithShape:&unk_1F3876F00 stride:0 dataType:7];
  unint64_t v12 = +[MLCTensorData dataWithBytes:&v16 length:4];
  int v13 = +[MLCTensor tensorWithDescriptor:v11 data:v12];

  unint64_t v14 = [(MLCTensor *)self tensorByQuantizingToType:v5 scale:v10 bias:v13 axis:-1];

  return (MLCTensor *)v14;
}

- (MLCTensor)tensorByQuantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias axis:(NSInteger)axis
{
  uint64_t v6 = *(void *)&type;
  if ((type - 10) > 0xFFFFFFFC)
  {
    [(MLCTensor *)self synchronizeData];
    vDSP_Length v11 = [(MLCTensor *)self descriptor];
    unint64_t v12 = [v11 shape];
    int v13 = +[MLCTensorDescriptor descriptorWithShape:v12 stride:0 dataType:v6];

    unint64_t v14 = +[MLCTensorData dataWithBytesNoCopy:length:](MLCTensorData, "dataWithBytesNoCopy:length:", malloc_type_malloc([v13 tensorAllocationSizeInBytes], 0x9FB04933uLL), objc_msgSend(v13, "tensorAllocationSizeInBytes"));
    int v9 = +[MLCTensor tensorWithDescriptor:v13 data:v14];
  }
  else
  {
    uint64_t v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MLCTensor tensorByQuantizingToType:scale:bias:axis:](a2);
    }

    int v9 = 0;
  }

  return (MLCTensor *)v9;
}

- (MLCTensor)tensorByDequantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias
{
  uint64_t v6 = *(void *)&type;
  int v18 = v5;
  float v17 = scale;
  uint64_t v8 = (void *)MEMORY[0x1E01B11E0](self, a2, *(void *)&type, scale, bias);
  int v9 = +[MLCTensorDescriptor descriptorWithShape:&unk_1F3876F18 stride:0 dataType:1];
  BOOL v10 = +[MLCTensorData dataWithBytes:&v18 length:4];
  vDSP_Length v11 = +[MLCTensor tensorWithDescriptor:v9 data:v10];

  unint64_t v12 = +[MLCTensorDescriptor descriptorWithShape:&unk_1F3876F30 stride:0 dataType:7];
  int v13 = +[MLCTensorData dataWithBytes:&v17 length:4];
  unint64_t v14 = +[MLCTensor tensorWithDescriptor:v12 data:v13];

  unint64_t v15 = [(MLCTensor *)self tensorByDequantizingToType:v6 scale:v11 bias:v14 axis:-1];

  return (MLCTensor *)v15;
}

- (MLCTensor)tensorByDequantizingToType:(MLCDataType)type scale:(MLCTensor *)scale bias:(MLCTensor *)bias axis:(NSInteger)axis
{
  if (type == MLCDataTypeFloat32)
  {
    uint64_t v8 = [(MLCTensor *)self descriptor];
    if ([v8 dataType] == 8)
    {
LABEL_5:

LABEL_6:
      [(MLCTensor *)self synchronizeData];
      BOOL v10 = [(MLCTensor *)self descriptor];
      vDSP_Length v11 = [v10 shape];
      unint64_t v12 = +[MLCTensorDescriptor descriptorWithShape:v11 stride:0 dataType:1];

      int v13 = +[MLCTensorData dataWithBytesNoCopy:length:](MLCTensorData, "dataWithBytesNoCopy:length:", malloc_type_malloc([v12 tensorAllocationSizeInBytes], 0xAED3EAD3uLL), objc_msgSend(v12, "tensorAllocationSizeInBytes"));
      unint64_t v14 = +[MLCTensor tensorWithDescriptor:v12 data:v13];

      goto LABEL_11;
    }
    int v9 = [(MLCTensor *)self descriptor];
    if ([v9 dataType] == 9)
    {

      goto LABEL_5;
    }
    float v17 = [(MLCTensor *)self descriptor];
    int v18 = [v17 dataType];

    if (v18 == 7) {
      goto LABEL_6;
    }
    int v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCTensor tensorByDequantizingToType:scale:bias:axis:]();
    }
  }
  else
  {
    unint64_t v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCTensor tensorByDequantizingToType:scale:bias:axis:](a2);
    }
  }
  unint64_t v14 = 0;
LABEL_11:

  return (MLCTensor *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int v5 = [(MLCTensor *)self descriptor];
  uint64_t v6 = [(MLCTensor *)self data];
  int v7 = [(MLCTensor *)self parentLayers];
  uint64_t v8 = [(MLCTensor *)self childLayers];
  int v9 = [(MLCTensor *)self device];
  BOOL v10 = [(MLCTensor *)self deviceMemory];
  vDSP_Length v11 = (void *)[v4 initWithTensorDescriptor:v5 tensorData:v6 parentLayers:v7 childLayers:v8 device:v9 deviceMemory:v10];

  unint64_t v12 = [(MLCTensor *)self device];
  [v11 setDevice:v12];

  objc_msgSend(v11, "setReadCount:", -[MLCTensor readCount](self, "readCount"));
  int v13 = [(MLCTensor *)self sharedMemoryTensor];
  [v11 setSharedMemoryTensor:v13];

  objc_msgSend(v11, "setConcatOffset:", -[MLCTensor concatOffset](self, "concatOffset"));
  objc_msgSend(v11, "setConcatDimension:", -[MLCTensor concatDimension](self, "concatDimension"));
  objc_msgSend(v11, "setSplitOffset:", -[MLCTensor splitOffset](self, "splitOffset"));
  objc_msgSend(v11, "setSplitDimension:", -[MLCTensor splitDimension](self, "splitDimension"));
  objc_msgSend(v11, "setMultiDeviceReductionType:", -[MLCTensor multiDeviceReductionType](self, "multiDeviceReductionType"));
  objc_msgSend(v11, "setInterleave:", -[MLCTensor interleave](self, "interleave"));
  objc_msgSend(v11, "setRootSourceGradientTensorIndex:", -[MLCTensor rootSourceGradientTensorIndex](self, "rootSourceGradientTensorIndex"));
  objc_msgSend(v11, "setRootSourceGradientTensorIndexStart:", -[MLCTensor rootSourceGradientTensorIndexStart](self, "rootSourceGradientTensorIndexStart"));
  objc_msgSend(v11, "setRootSourceGradientTensorCount:", -[MLCTensor rootSourceGradientTensorCount](self, "rootSourceGradientTensorCount"));
  unint64_t v14 = [(MLCTensor *)self intermediateSumLayer];
  [v11 setIntermediateSumLayer:v14];

  unint64_t v15 = [(MLCTensor *)self optimizerData];
  [v11 setOptimizerData:v15];

  NSInteger v16 = [(MLCTensor *)self optimizerDeviceData];
  [v11 setOptimizerDeviceData:v16];

  float v17 = [(MLCTensor *)self deviceDataSources];
  [v11 setDeviceDataSources:v17];

  objc_msgSend(v11, "setSkipWritingToDevice:", -[MLCTensor skipWritingToDevice](self, "skipWritingToDevice"));
  objc_msgSend(v11, "setComputeFlags:", -[MLCTensor computeFlags](self, "computeFlags"));
  return v11;
}

- (NSUInteger)tensorID
{
  return self->_tensorID;
}

- (void)setTensorID:(unint64_t)a3
{
  self->_tensorID = a3;
}

- (MLCTensorDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSArray)optimizerData
{
  return self->_optimizerData;
}

- (void)setOptimizerData:(id)a3
{
}

- (NSArray)optimizerDeviceData
{
  return self->_optimizerDeviceData;
}

- (void)setOptimizerDeviceData:(id)a3
{
}

- (NSMutableArray)parentLayers
{
  return self->_parentLayers;
}

- (void)setParentLayers:(id)a3
{
}

- (NSMutableArray)childLayers
{
  return self->_childLayers;
}

- (void)setChildLayers:(id)a3
{
}

- (NSMutableArray)deviceMemory
{
  return self->_deviceMemory;
}

- (void)setDeviceMemory:(id)a3
{
}

- (unint64_t)deviceIndex
{
  return self->_deviceIndex;
}

- (void)setDeviceIndex:(unint64_t)a3
{
  self->_deviceIndex = a3;
}

- (NSMutableArray)broadcastabledeviceMemory
{
  return self->_broadcastabledeviceMemory;
}

- (void)setBroadcastabledeviceMemory:(id)a3
{
}

- (MLCTensor)sharedMemoryTensor
{
  return self->_sharedMemoryTensor;
}

- (void)setSharedMemoryTensor:(id)a3
{
}

- (int)multiDeviceReductionType
{
  return self->_multiDeviceReductionType;
}

- (void)setMultiDeviceReductionType:(int)a3
{
  self->_multiDeviceReductionType = a3;
}

- (unint64_t)concatOffset
{
  return self->_concatOffset;
}

- (void)setConcatOffset:(unint64_t)a3
{
  self->_concatOffset = a3;
}

- (unint64_t)concatDimension
{
  return self->_concatDimension;
}

- (void)setConcatDimension:(unint64_t)a3
{
  self->_concatDimension = a3;
}

- (unint64_t)splitOffset
{
  return self->_splitOffset;
}

- (void)setSplitOffset:(unint64_t)a3
{
  self->_splitOffset = a3;
}

- (unint64_t)splitDimension
{
  return self->_splitDimension;
}

- (void)setSplitDimension:(unint64_t)a3
{
  self->_splitDimension = a3;
}

- (unint64_t)rootSourceGradientTensorIndexStart
{
  return self->_rootSourceGradientTensorIndexStart;
}

- (void)setRootSourceGradientTensorIndexStart:(unint64_t)a3
{
  self->_rootSourceGradientTensorIndexStart = a3;
}

- (unint64_t)rootSourceGradientTensorCount
{
  return self->_rootSourceGradientTensorCount;
}

- (void)setRootSourceGradientTensorCount:(unint64_t)a3
{
  self->_rootSourceGradientTensorCount = a3;
}

- (unint64_t)rootSourceGradientTensorIndex
{
  return self->_rootSourceGradientTensorIndex;
}

- (void)setRootSourceGradientTensorIndex:(unint64_t)a3
{
  self->_rootSourceGradientTensorIndex = a3;
}

- (MLCLayer)intermediateSumLayer
{
  return self->_intermediateSumLayer;
}

- (void)setIntermediateSumLayer:(id)a3
{
}

- (unint64_t)interleave
{
  return self->_interleave;
}

- (void)setInterleave:(unint64_t)a3
{
  self->_interleave = a3;
}

- (BOOL)isLayerParameter
{
  return self->_isLayerParameter;
}

- (void)setIsLayerParameter:(BOOL)a3
{
  self->_isLayerParameter = a3;
}

- (id)deviceDataSources
{
  return self->_deviceDataSources;
}

- (void)setDeviceDataSources:(id)a3
{
}

- (BOOL)skipWritingToDevice
{
  return self->_skipWritingToDevice;
}

- (void)setSkipWritingToDevice:(BOOL)a3
{
  self->_skipWritingToDevice = a3;
}

- (int)computeFlags
{
  return self->_computeFlags;
}

- (void)setComputeFlags:(int)a3
{
  self->_computeFlags = a3;
}

- (unint64_t)readCount
{
  return self->_readCount;
}

- (void)setReadCount:(unint64_t)a3
{
  self->_readCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deviceDataSources, 0);
  objc_storeStrong((id *)&self->_intermediateSumLayer, 0);
  objc_storeStrong((id *)&self->_sharedMemoryTensor, 0);
  objc_storeStrong((id *)&self->_broadcastabledeviceMemory, 0);
  objc_storeStrong((id *)&self->_deviceMemory, 0);
  objc_storeStrong((id *)&self->_childLayers, 0);
  objc_storeStrong((id *)&self->_parentLayers, 0);
  objc_storeStrong((id *)&self->_optimizerDeviceData, 0);
  objc_storeStrong((id *)&self->_optimizerData, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

+ (void)tensorWithSequenceLengths:(const char *)a1 sortedSequences:featureChannelCount:batchSize:randomInitializerType:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unsorted sequences are not supported", v4, v5, v6, v7, v8);
}

- (void)copyDataFromDeviceMemoryToBytes:(const char *)a1 length:synchronizeWithDevice:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: No device assoicated with tensor", v4, v5, v6, v7, v8);
}

- (void)copyDataFromDeviceMemoryToBytes:(const char *)a1 length:synchronizeWithDevice:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: No device memory allocated for tensor", v4, v5, v6, v7, v8);
}

- (void)copyDataFromDeviceMemoryToBytes:length:synchronizeWithDevice:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = [v0 descriptor];
  [v3 tensorAllocationSizeInBytes];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v4, v5, "%@: length must be >= tensor.descriptor.tensorAllocationSizeInBytes (%lu)", v6, v7, v8, v9, v10);
}

+ (void)newRandomDataForWeightTensorDescriptor:(uint64_t)a1 randomInitializerType:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_7_1(a1, a2);
  uint64_t v5 = NSStringFromSelector(v4);
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1DD0C9000, v6, v7, "%@: Unsupported data type.");
}

+ (void)newRandomDataForWeightTensorDescriptor:(uint64_t)a1 randomInitializerType:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_7_1(a1, a2);
  uint64_t v5 = NSStringFromSelector(v4);
  _DWORD *v3 = 138412290;
  *uint64_t v2 = v5;
  OUTLINED_FUNCTION_6_1(&dword_1DD0C9000, v6, v7, "%@: Unsupported random number generator");
}

+ (void)newRandomDataForWeightTensorDescriptor:randomInitializerType:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  SEL v1 = NSStringFromSelector(v0);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: unexpected number of dimensions(%lu).", v4, v5, v6, v7, v8);
}

- (void)tensorByQuantizingToType:(const char *)a1 scale:bias:axis:.cold.1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: invalid data type (%d) specified for quantization.", v4, v5, v6, v7, v8);
}

- (void)tensorByDequantizingToType:scale:bias:axis:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  uint64_t v2 = NSStringFromSelector(v1);
  uint64_t v3 = [v0 descriptor];
  [v3 dataType];
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v4, v5, "%@: source data type (%d) specified for de-quantization must be a quantized data type.", v6, v7, v8, v9, 2u);
}

- (void)tensorByDequantizingToType:(const char *)a1 scale:bias:axis:.cold.2(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_8(&dword_1DD0C9000, v2, v3, "%@: invalid data type (%d) specified for de-quantization, must be MLCDataTypeFloat32", v4, v5, v6, v7, v8);
}

@end