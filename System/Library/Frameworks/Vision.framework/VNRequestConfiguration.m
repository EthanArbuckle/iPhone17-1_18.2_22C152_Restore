@interface VNRequestConfiguration
- (BOOL)preferBackgroundProcessing;
- (Class)requestClass;
- (NSDictionary)computeStageDeviceAssignments;
- (NSDictionary)resolvedComputeStageDeviceAssignments;
- (VNProcessingDevice)processingDevice;
- (VNRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)computeDeviceForComputeStage:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)detectionLevel;
- (unint64_t)maximumProcessingDimensionOnTheLongSide;
- (unint64_t)memoryPoolId;
- (unint64_t)metalContextPriority;
- (unint64_t)modelExecutionPriority;
- (unint64_t)modelFileBackingStore;
- (unint64_t)resolvedRevision;
- (void)setComputeDevice:(id)a3 forComputeStage:(id)a4;
- (void)setComputeStageDeviceAssignments:(id)a3;
- (void)setDetectionLevel:(unint64_t)a3;
- (void)setMaximumProcessingDimensionOnTheLongSide:(unint64_t)a3;
- (void)setMemoryPoolId:(unint64_t)a3;
- (void)setMetalContextPriority:(unint64_t)a3;
- (void)setModelExecutionPriority:(unint64_t)a3;
- (void)setModelFileBackingStore:(unint64_t)a3;
- (void)setPreferBackgroundProcessing:(BOOL)a3;
- (void)setProcessingDevice:(id)a3;
- (void)setResolvedRevision:(unint64_t)a3;
@end

@implementation VNRequestConfiguration

- (VNRequestConfiguration)initWithRequestClass:(Class)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VNRequestConfiguration;
  v4 = [(VNRequestConfiguration *)&v8 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_requestClass, a3);
    v5->_resolvedRevision = [(objc_class *)a3 defaultRevision];
    v5->_detectionLevel = 0;
    v5->_metalContextPriority = 1;
    v5->_preferBackgroundProcessing = 0;
    *(_OWORD *)&v5->_modelExecutionPriority = 0u;
    *(_OWORD *)&v5->_maximumProcessingDimensionOnTheLongSide = 0u;
    v6 = v5;
  }

  return v5;
}

- (NSDictionary)resolvedComputeStageDeviceAssignments
{
  v8[2] = *MEMORY[0x1E4F143B8];
  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  if (computeStageDeviceAssignments)
  {
    v4 = (void *)[(NSMutableDictionary *)computeStageDeviceAssignments copy];
  }
  else if (self->_processingDevice)
  {
    v5 = [[VNProcessingDeviceComputeDeviceBridge alloc] initWithProcessingDevice:self->_processingDevice];
    v7[0] = @"VNComputeStageMain";
    v7[1] = @"VNComputeStagePostProcessing";
    v8[0] = v5;
    v8[1] = v5;
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return (NSDictionary *)v4;
}

- (unint64_t)modelExecutionPriority
{
  return self->_modelExecutionPriority;
}

- (unint64_t)memoryPoolId
{
  return self->_memoryPoolId;
}

- (BOOL)preferBackgroundProcessing
{
  return self->_preferBackgroundProcessing;
}

- (unint64_t)modelFileBackingStore
{
  return self->_modelFileBackingStore;
}

- (unint64_t)resolvedRevision
{
  return self->_resolvedRevision;
}

- (void)setResolvedRevision:(unint64_t)a3
{
  self->_resolvedRevision = a3;
}

- (void)setModelFileBackingStore:(unint64_t)a3
{
  self->_modelFileBackingStore = a3;
}

- (void)setMemoryPoolId:(unint64_t)a3
{
  self->_memoryPoolId = a3;
}

- (VNProcessingDevice)processingDevice
{
  return self->_processingDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingDevice, 0);
  objc_storeStrong((id *)&self->_requestClass, 0);

  objc_storeStrong((id *)&self->_computeStageDeviceAssignments, 0);
}

- (void)setProcessingDevice:(id)a3
{
  v4 = (VNProcessingDevice *)a3;
  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  self->_computeStageDeviceAssignments = 0;

  processingDevice = self->_processingDevice;
  self->_processingDevice = v4;
}

- (void)setComputeDevice:(id)a3 forComputeStage:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  processingDevice = self->_processingDevice;
  self->_processingDevice = 0;

  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  if (v11)
  {
    if (!computeStageDeviceAssignments)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = self->_computeStageDeviceAssignments;
      self->_computeStageDeviceAssignments = v9;

      computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
    }
    [(NSMutableDictionary *)computeStageDeviceAssignments setObject:v11 forKey:v6];
  }
  else
  {
    [(NSMutableDictionary *)computeStageDeviceAssignments removeObjectForKey:v6];
  }
}

- (void)setModelExecutionPriority:(unint64_t)a3
{
  self->_modelExecutionPriority = a3;
}

- (unint64_t)detectionLevel
{
  return self->_detectionLevel;
}

- (Class)requestClass
{
  return self->_requestClass;
}

- (void)setMaximumProcessingDimensionOnTheLongSide:(unint64_t)a3
{
  self->_maximumProcessingDimensionOnTheLongSide = a3;
}

- (unint64_t)maximumProcessingDimensionOnTheLongSide
{
  return self->_maximumProcessingDimensionOnTheLongSide;
}

- (void)setPreferBackgroundProcessing:(BOOL)a3
{
  self->_preferBackgroundProcessing = a3;
}

- (void)setMetalContextPriority:(unint64_t)a3
{
  self->_metalContextPriority = a3;
}

- (unint64_t)metalContextPriority
{
  return self->_metalContextPriority;
}

- (void)setDetectionLevel:(unint64_t)a3
{
  self->_detectionLevel = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRequestClass:", self->_requestClass);
  v5 = v4;
  if (v4)
  {
    [v4 setResolvedRevision:self->_resolvedRevision];
    [v5 setDetectionLevel:self->_detectionLevel];
    [v5 setMetalContextPriority:self->_metalContextPriority];
    [v5 setModelExecutionPriority:self->_modelExecutionPriority];
    [v5 setPreferBackgroundProcessing:self->_preferBackgroundProcessing];
    [v5 setModelFileBackingStore:self->_modelFileBackingStore];
    [v5 setMaximumProcessingDimensionOnTheLongSide:self->_maximumProcessingDimensionOnTheLongSide];
    [v5 setMemoryPoolId:self->_memoryPoolId];
    objc_storeStrong(v5 + 6, self->_processingDevice);
    uint64_t v6 = [(NSMutableDictionary *)self->_computeStageDeviceAssignments mutableCopy];
    id v7 = v5[1];
    v5[1] = (id)v6;
  }
  return v5;
}

- (id)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (i = objc_opt_class(); i && i != objc_opt_class(); i = (void *)[i superclass])
    {
      unsigned int outCount = 0;
      v5 = class_copyPropertyList((Class)i, &outCount);
      if (outCount)
      {
        for (unint64_t j = 0; j < outCount; ++j)
        {
          id v7 = (void *)[[NSString alloc] initWithUTF8String:property_getName(v5[j])];
          [v3 addObject:v7];
        }
      }
      free(v5);
    }
  }
  else
  {
    id v3 = 0;
  }
  [v3 sortUsingSelector:sel_compare_];
  objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", 32 * objc_msgSend(v3, "count"));
  v21.receiver = self;
  v21.super_class = (Class)VNRequestConfiguration;
  v9 = [(VNRequestConfiguration *)&v21 description];
  [v8 appendString:v9];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t k = 0; k != v11; ++k)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * k);
        v15 = [(VNRequestConfiguration *)self valueForKey:v14];
        [v8 appendFormat:@"\n    %@=%@", v14, v15, (void)v17];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)setComputeStageDeviceAssignments:(id)a3
{
  id v7 = a3;
  processingDevice = self->_processingDevice;
  self->_processingDevice = 0;

  v5 = (NSMutableDictionary *)[v7 mutableCopy];
  computeStageDeviceAssignments = self->_computeStageDeviceAssignments;
  self->_computeStageDeviceAssignments = v5;
}

- (NSDictionary)computeStageDeviceAssignments
{
  v2 = (void *)[(NSMutableDictionary *)self->_computeStageDeviceAssignments copy];

  return (NSDictionary *)v2;
}

- (id)computeDeviceForComputeStage:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_computeStageDeviceAssignments objectForKey:a3];

  return v3;
}

@end