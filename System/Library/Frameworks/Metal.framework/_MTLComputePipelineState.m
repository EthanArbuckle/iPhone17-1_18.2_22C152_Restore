@interface _MTLComputePipelineState
- (BOOL)supportIndirectCommandBuffers;
- (MTLDebugInstrumentationData)debugInstrumentationData;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (_MTLComputePipelineState)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4;
- (_MTLComputePipelineState)initWithParent:(id)a3;
- (id)formattedDescription:(unint64_t)a3;
- (id)functionHandleWithFunction:(id)a3;
- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)pipelineBinaries;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteFPRoundingMode;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)resourceIndex;
- (unsigned)getComputeKernelTelemetryID;
- (void)dealloc;
- (void)setDebugInstrumentationData:(id)a3;
@end

@implementation _MTLComputePipelineState

- (NSString)label
{
  return self->_label;
}

- (_MTLComputePipelineState)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  if (!a3)
  {
    v13 = @"device must not be nil.";
    unint64_t v14 = 0;
    uint64_t v15 = 1696;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = @"device is not a MTLDevice.";
    unint64_t v14 = 1;
    uint64_t v15 = 1699;
LABEL_10:
    MTLReportFailure(v14, "-[_MTLComputePipelineState initWithDevice:pipelineStateDescriptor:]", v15, (uint64_t)v13, v4, v5, v6, v7, (uint64_t)v19.receiver);
    if (a4) {
      goto LABEL_4;
    }
LABEL_11:
    v16 = @"desc must not be nil.";
    unint64_t v17 = 0;
    uint64_t v18 = 1702;
    goto LABEL_13;
  }
  if (!a4) {
    goto LABEL_11;
  }
LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  v16 = @"desc is not a MTLComputePipelineDescriptor.";
  unint64_t v17 = 1;
  uint64_t v18 = 1705;
LABEL_13:
  MTLReportFailure(v17, "-[_MTLComputePipelineState initWithDevice:pipelineStateDescriptor:]", v18, (uint64_t)v16, v4, v5, v6, v7, (uint64_t)v19.receiver);
LABEL_5:
  v19.receiver = self;
  v19.super_class = (Class)_MTLComputePipelineState;
  v11 = [(_MTLComputePipelineState *)&v19 init];
  if (v11)
  {
    v11->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v11->_device = (MTLDevice *)a3;
    v11->_supportIndirectCommandBuffers = [a4 supportIndirectCommandBuffers];
    v11->_textureWriteRoundingMode = [a4 textureWriteRoundingMode];
  }
  return v11;
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)dealloc
{
  self->_debugInstrumentationData = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLComputePipelineState;
  [(_MTLComputePipelineState *)&v3 dealloc];
}

- (_MTLComputePipelineState)initWithParent:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = @"parent is not a _MTLComputePipelineState.";
    unint64_t v12 = 1;
    uint64_t v13 = 1729;
  }
  else
  {
    v11 = @"parent must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 1726;
  }
  MTLReportFailure(v12, "-[_MTLComputePipelineState initWithParent:]", v13, (uint64_t)v11, v3, v4, v5, v6, (uint64_t)v14.receiver);
LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)_MTLComputePipelineState;
  v9 = [(_MTLComputePipelineState *)&v14 init];
  if (v9)
  {
    v9->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v9->_device = (MTLDevice *)(id)[a3 device];
    v9->_supportIndirectCommandBuffers = [a3 supportIndirectCommandBuffers];
    v9->_textureWriteRoundingMode = [a3 textureWriteRoundingMode];
    v9->_debugInstrumentationData = (MTLDebugInstrumentationData *)*((id *)a3 + 3);
  }
  return v9;
}

- (id)formattedDescription:(unint64_t)a3
{
  v13[6] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)_MTLComputePipelineState;
  uint64_t v7 = [(_MTLComputePipelineState *)&v12 description];
  v13[0] = v5;
  v13[1] = @"label =";
  label = @"<none>";
  device = self->_device;
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  v13[2] = label;
  v13[3] = v5;
  v13[4] = @"device =";
  if (device) {
    v10 = (__CFString *)[(MTLDevice *)device formattedDescription:v4];
  }
  else {
    v10 = @"<null>";
  }
  v13[5] = v10;
  return (id)[v6 stringWithFormat:@"%@%@", v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v13, 6), "componentsJoinedByString:", @" "];
}

- (NSString)description
{
  return (NSString *)[(_MTLComputePipelineState *)self formattedDescription:0];
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_supportIndirectCommandBuffers;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (int64_t)textureWriteFPRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unsigned)getComputeKernelTelemetryID
{
  return [(_MTLComputePipelineState *)self uniqueIdentifier];
}

- (id)pipelineBinaries
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)functionHandleWithFunction:(id)a3
{
  MTLReportFailure(0, "-[_MTLComputePipelineState functionHandleWithFunction:]", 1830, @"Driver needs to override this", v3, v4, v5, v6, vars0);
  return 0;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLComputePipelineState *)self device];

  return (id)[(MTLDevice *)v4 newVisibleFunctionTableWithDescriptor:a3];
}

- (id)newComputePipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  MTLReportFailure(0, "-[_MTLComputePipelineState newComputePipelineStateWithAdditionalBinaryFunctions:error:]", 1848, @"Driver needs to override this", v4, v5, v6, v7, vars0);
  return 0;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLComputePipelineState *)self device];

  return (id)[(MTLDevice *)v4 newIntersectionFunctionTableWithDescriptor:a3];
}

- (unint64_t)allocatedSize
{
  return 0;
}

- (int64_t)shaderValidation
{
  return 2;
}

- (int64_t)shaderValidationState
{
  return 2;
}

- (MTLDebugInstrumentationData)debugInstrumentationData
{
  return self->_debugInstrumentationData;
}

- (void)setDebugInstrumentationData:(id)a3
{
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

@end