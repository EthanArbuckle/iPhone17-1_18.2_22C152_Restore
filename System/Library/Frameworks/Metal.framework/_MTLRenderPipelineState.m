@interface _MTLRenderPipelineState
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)threadgroupSizeMatchesTileSize;
- (MTLDebugInstrumentationData)fragmentDebugInstrumentationData;
- (MTLDebugInstrumentationData)meshDebugInstrumentationData;
- (MTLDebugInstrumentationData)objectDebugInstrumentationData;
- (MTLDebugInstrumentationData)tileDebugInstrumentationData;
- (MTLDebugInstrumentationData)vertexDebugInstrumentationData;
- (MTLDevice)device;
- (NSString)label;
- (_MTLRenderPipelineState)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6;
- (_MTLRenderPipelineState)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6 maxTotalThreadgroupsPerMeshGrid:(unint64_t)a7;
- (_MTLRenderPipelineState)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4;
- (_MTLRenderPipelineState)initWithDeviceAndTileDesc:(id)a3 tilePipelineStateDescriptor:(id)a4;
- (_MTLRenderPipelineState)initWithParent:(id)a3;
- (_MTLRenderPipelineState)initWithTileParent:(id)a3;
- (id)fragmentFunctionHandleWithFunction:(id)a3;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4;
- (id)meshFunctionHandleWithFunction:(id)a3;
- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5;
- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)objectFunctionHandleWithFunction:(id)a3;
- (id)pipelineBinaries;
- (id)tileFunctionHandleWithFunction:(id)a3;
- (id)vertexFunctionHandleWithFunction:(id)a3;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteFPRoundingMode;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)imageBlockSampleLength;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageblockSampleLength;
- (unint64_t)maxTotalThreadgroupsPerMeshGrid;
- (unint64_t)maxTotalThreadsPerMeshThreadgroup;
- (unint64_t)maxTotalThreadsPerObjectThreadgroup;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)meshThreadExecutionWidth;
- (unint64_t)objectThreadExecutionWidth;
- (unint64_t)resourceIndex;
- (unsigned)explicitVisibilityGroupID;
- (unsigned)getFragmentShaderTelemetryID;
- (unsigned)getMeshShaderTelemetryID;
- (unsigned)getObjectShaderTelemetryID;
- (unsigned)getVertexShaderTelemetryID;
- (void)dealloc;
- (void)setFragmentDebugInstrumentationData:(id)a3;
- (void)setMeshDebugInstrumentationData:(id)a3;
- (void)setObjectDebugInstrumentationData:(id)a3;
- (void)setTileDebugInstrumentationData:(id)a3;
- (void)setVertexDebugInstrumentationData:(id)a3;
@end

@implementation _MTLRenderPipelineState

- (_MTLRenderPipelineState)initWithDevice:(id)a3 pipelineStateDescriptor:(id)a4
{
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
  _MTLMessageContextBegin_((uint64_t)v25, (uint64_t)"-[_MTLRenderPipelineState initWithDevice:pipelineStateDescriptor:]", 5561, (uint64_t)a3, 3, (uint64_t)"Render Pipeline Descriptor Validation");
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a4) {
        goto LABEL_4;
      }
LABEL_19:
      v23 = @"desc must not be nil.";
LABEL_21:
      _MTLMessageContextPush_((uint64_t)v25, 4, (uint64_t)v23, v7, v8, v9, v10, v11, (uint64_t)v24.receiver);
      goto LABEL_5;
    }
    v21 = @"device is not a MTLDevice.";
    uint64_t v22 = 8;
  }
  else
  {
    v21 = @"device must not be nil.";
    uint64_t v22 = 4;
  }
  _MTLMessageContextPush_((uint64_t)v25, v22, (uint64_t)v21, v7, v8, v9, v10, v11, (uint64_t)v24.receiver);
  if (!a4) {
    goto LABEL_19;
  }
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = @"desc is not a MTLRenderPipelineDescriptor.";
    goto LABEL_21;
  }
LABEL_5:
  if ([a4 isTessellationFactorScaleEnabled]
    && [a4 supportIndirectCommandBuffers])
  {
    _MTLMessageContextPush_((uint64_t)v25, 4, @"pipelines with tessellationFactorScaleEnabled = YES are not compatible with indirect command buffers", v12, v13, v14, v15, v16, (uint64_t)v24.receiver);
  }
  _MTLMessageContextEnd((uint64_t)v25);
  v24.receiver = self;
  v24.super_class = (Class)_MTLRenderPipelineState;
  v17 = [(_MTLRenderPipelineState *)&v24 init];
  if (v17)
  {
    v17->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v17->_device = (MTLDevice *)a3;
    v17->_supportIndirectCommandBuffers = [a4 supportIndirectCommandBuffers];
    v17->_textureWriteRoundingMode = [a4 textureWriteRoundingMode];
    if ([a4 meshFunction])
    {
      uint64_t v18 = [a4 maxTotalThreadsPerObjectThreadgroup];
      if (!v18) {
        uint64_t v18 = [a3 maxTotalComputeThreadsPerThreadgroup];
      }
      v17->_maxTotalThreadsPerObjectThreadgroup = v18;
      uint64_t v19 = [a4 maxTotalThreadsPerMeshThreadgroup];
      if (!v19) {
        uint64_t v19 = [a3 maxTotalComputeThreadsPerThreadgroup];
      }
      v17->_maxTotalThreadsPerMeshThreadgroup = v19;
      v17->_maxTotalThreadgroupsPerMeshGrid = -1;
      v17->_objectThreadExecutionWidth = -1;
      v17->_meshThreadExecutionWidth = -1;
    }
  }
  return v17;
}

- (NSString)label
{
  return self->_label;
}

- (MTLDevice)device
{
  return self->_device;
}

- (_MTLRenderPipelineState)initWithDeviceAndTileDesc:(id)a3 tilePipelineStateDescriptor:(id)a4
{
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  _MTLMessageContextBegin_((uint64_t)v19, (uint64_t)"-[_MTLRenderPipelineState initWithDeviceAndTileDesc:tilePipelineStateDescriptor:]", 5661, (uint64_t)a3, 3, (uint64_t)"Render Pipeline Descriptor Validation");
  if (!a3)
  {
    uint64_t v14 = @"device must not be nil.";
    uint64_t v15 = 4;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v14 = @"device is not a MTLDevice.";
    uint64_t v15 = 8;
LABEL_10:
    _MTLMessageContextPush_((uint64_t)v19, v15, (uint64_t)v14, v7, v8, v9, v10, v11, (uint64_t)v18.receiver);
    if (a4) {
      goto LABEL_4;
    }
LABEL_11:
    uint64_t v16 = @"desc must not be nil.";
    uint64_t v17 = 4;
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
  uint64_t v16 = @"desc is not a MTLRenderPipelineDescriptor.";
  uint64_t v17 = 8;
LABEL_13:
  _MTLMessageContextPush_((uint64_t)v19, v17, (uint64_t)v16, v7, v8, v9, v10, v11, (uint64_t)v18.receiver);
LABEL_5:
  _MTLMessageContextEnd((uint64_t)v19);
  v18.receiver = self;
  v18.super_class = (Class)_MTLRenderPipelineState;
  uint64_t v12 = [(_MTLRenderPipelineState *)&v18 init];
  if (v12)
  {
    v12->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v12->_device = (MTLDevice *)a3;
    v12->_threadgroupSizeMatchesTileSize = [a4 threadgroupSizeMatchesTileSize];
  }
  return v12;
}

- (id)pipelineBinaries
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (_MTLRenderPipelineState)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6
{
  uint64_t v11 = [a4 maxTotalThreadgroupsPerMeshGrid];
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = -1;
  }

  return [(_MTLRenderPipelineState *)self initWithDevice:a3 meshRenderPipelineStateDescriptor:a4 objectThreadExecutionWidth:a5 meshThreadExecutionWidth:a6 maxTotalThreadgroupsPerMeshGrid:v12];
}

- (_MTLRenderPipelineState)initWithDevice:(id)a3 meshRenderPipelineStateDescriptor:(id)a4 objectThreadExecutionWidth:(unint64_t)a5 meshThreadExecutionWidth:(unint64_t)a6 maxTotalThreadgroupsPerMeshGrid:(unint64_t)a7
{
  uint64_t v27 = 0;
  memset(v26, 0, sizeof(v26));
  _MTLMessageContextBegin_((uint64_t)v26, (uint64_t)"-[_MTLRenderPipelineState initWithDevice:meshRenderPipelineStateDescriptor:objectThreadExecutionWidth:meshThreadExecutionWidth:maxTotalThreadgroupsPerMeshGrid:]", 5620, (uint64_t)a3, 3, (uint64_t)"Render Pipeline Descriptor Validation");
  if (!a3)
  {
    uint64_t v22 = @"device must not be nil.";
    uint64_t v23 = 4;
    goto LABEL_14;
  }
  if (([a3 conformsToProtocol:&unk_1ECB3F6B8] & 1) == 0)
  {
    uint64_t v22 = @"device is not a MTLDevice.";
    uint64_t v23 = 8;
LABEL_14:
    _MTLMessageContextPush_((uint64_t)v26, v23, (uint64_t)v22, v13, v14, v15, v16, v17, (uint64_t)v25.receiver);
    if (a4) {
      goto LABEL_4;
    }
LABEL_15:
    objc_super v24 = @"desc must not be nil.";
    goto LABEL_17;
  }
  if (!a4) {
    goto LABEL_15;
  }
LABEL_4:
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_5;
  }
  objc_super v24 = @"desc is not a MTLMeshRenderPipelineDescriptor.";
LABEL_17:
  _MTLMessageContextPush_((uint64_t)v26, 4, (uint64_t)v24, v13, v14, v15, v16, v17, (uint64_t)v25.receiver);
LABEL_5:
  _MTLMessageContextEnd((uint64_t)v26);
  v25.receiver = self;
  v25.super_class = (Class)_MTLRenderPipelineState;
  objc_super v18 = [(_MTLRenderPipelineState *)&v25 init];
  if (v18)
  {
    v18->_label = (NSString *)objc_msgSend((id)objc_msgSend(a4, "label"), "copy");
    v18->_device = (MTLDevice *)a3;
    v18->_supportIndirectCommandBuffers = [a4 supportIndirectCommandBuffers];
    v18->_textureWriteRoundingMode = [a4 textureWriteRoundingMode];
    uint64_t v19 = [a4 maxTotalThreadsPerObjectThreadgroup];
    if (!v19) {
      uint64_t v19 = [a3 maxTotalComputeThreadsPerThreadgroup];
    }
    v18->_maxTotalThreadsPerObjectThreadgroup = v19;
    uint64_t v20 = [a4 maxTotalThreadsPerMeshThreadgroup];
    if (!v20) {
      uint64_t v20 = [a3 maxTotalComputeThreadsPerThreadgroup];
    }
    v18->_objectThreadExecutionWidth = a5;
    v18->_meshThreadExecutionWidth = a6;
    v18->_maxTotalThreadsPerMeshThreadgroup = v20;
    v18->_maxTotalThreadgroupsPerMeshGrid = a7;
  }
  return v18;
}

- (_MTLRenderPipelineState)initWithParent:(id)a3
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  _MTLMessageContextBegin_((uint64_t)v15, (uint64_t)"-[_MTLRenderPipelineState initWithParent:]", 5693, 0, 3, (uint64_t)"Render Pipeline State Validation");
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v12 = @"parent is not a _MTLRenderPipelineState.";
    uint64_t v13 = 8;
  }
  else
  {
    uint64_t v12 = @"parent must not be nil.";
    uint64_t v13 = 4;
  }
  _MTLMessageContextPush_((uint64_t)v15, v13, (uint64_t)v12, v5, v6, v7, v8, v9, (uint64_t)v14.receiver);
LABEL_3:
  _MTLMessageContextEnd((uint64_t)v15);
  v14.receiver = self;
  v14.super_class = (Class)_MTLRenderPipelineState;
  uint64_t v10 = [(_MTLRenderPipelineState *)&v14 init];
  if (v10)
  {
    v10->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v10->_device = (MTLDevice *)(id)[a3 device];
    v10->_supportIndirectCommandBuffers = [a3 supportIndirectCommandBuffers];
    v10->_textureWriteRoundingMode = [a3 textureWriteRoundingMode];
    v10->_objectThreadExecutionWidth = [a3 objectThreadExecutionWidth];
    v10->_meshThreadExecutionWidth = [a3 meshThreadExecutionWidth];
    v10->_maxTotalThreadsPerObjectThreadgroup = [a3 maxTotalThreadsPerObjectThreadgroup];
    v10->_maxTotalThreadsPerMeshThreadgroup = [a3 maxTotalThreadsPerMeshThreadgroup];
  }
  return v10;
}

- (_MTLRenderPipelineState)initWithTileParent:(id)a3
{
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  _MTLMessageContextBegin_((uint64_t)v15, (uint64_t)"-[_MTLRenderPipelineState initWithTileParent:]", 5728, 0, 3, (uint64_t)"Render Pipeline State Validation");
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v12 = @"parent is not a _MTLRenderPipelineState.";
    uint64_t v13 = 8;
  }
  else
  {
    uint64_t v12 = @"parent must not be nil.";
    uint64_t v13 = 4;
  }
  _MTLMessageContextPush_((uint64_t)v15, v13, (uint64_t)v12, v5, v6, v7, v8, v9, (uint64_t)v14.receiver);
LABEL_3:
  _MTLMessageContextEnd((uint64_t)v15);
  v14.receiver = self;
  v14.super_class = (Class)_MTLRenderPipelineState;
  uint64_t v10 = [(_MTLRenderPipelineState *)&v14 init];
  if (v10)
  {
    v10->_label = (NSString *)objc_msgSend((id)objc_msgSend(a3, "label"), "copy");
    v10->_device = (MTLDevice *)(id)[a3 device];
    v10->_threadgroupSizeMatchesTileSize = [a3 threadgroupSizeMatchesTileSize];
    v10->_supportIndirectCommandBuffers = [a3 supportIndirectCommandBuffers];
    v10->_textureWriteRoundingMode = [a3 textureWriteRoundingMode];
  }
  return v10;
}

- (void)dealloc
{
  self->_vertexDebugInstrumentationData = 0;
  self->_fragmentDebugInstrumentationData = 0;

  self->_tileDebugInstrumentationData = 0;
  self->_objectDebugInstrumentationData = 0;

  self->_meshDebugInstrumentationData = 0;
  v3.receiver = self;
  v3.super_class = (Class)_MTLRenderPipelineState;
  [(_MTLRenderPipelineState *)&v3 dealloc];
}

- (unsigned)getVertexShaderTelemetryID
{
  return [(_MTLRenderPipelineState *)self uniqueIdentifier];
}

- (unsigned)getFragmentShaderTelemetryID
{
  return [(_MTLRenderPipelineState *)self uniqueIdentifier];
}

- (unsigned)getObjectShaderTelemetryID
{
  return [(_MTLRenderPipelineState *)self uniqueIdentifier];
}

- (unsigned)getMeshShaderTelemetryID
{
  return [(_MTLRenderPipelineState *)self uniqueIdentifier];
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  return 0;
}

- (unint64_t)imageblockSampleLength
{
  return 0;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return 0;
}

- (BOOL)supportIndirectCommandBuffers
{
  return self->_supportIndirectCommandBuffers;
}

- (int64_t)shaderValidation
{
  return 2;
}

- (int64_t)shaderValidationState
{
  return 2;
}

- (int64_t)textureWriteRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (int64_t)textureWriteFPRoundingMode
{
  return self->_textureWriteRoundingMode;
}

- (unint64_t)allocatedSize
{
  return 0;
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState vertexFunctionHandleWithFunction:]", 5886, @"Driver needs to override this", v3, v4, v5, v6, vars0);
  return 0;
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState fragmentFunctionHandleWithFunction:]", 5892, @"Driver needs to override this", v3, v4, v5, v6, vars0);
  return 0;
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState tileFunctionHandleWithFunction:]", 5898, @"Driver needs to override this", v3, v4, v5, v6, vars0);
  return 0;
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState objectFunctionHandleWithFunction:]", 5905, @"Driver needs to override this", v3, v4, v5, v6, vars0);
  return 0;
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState meshFunctionHandleWithFunction:]", 5911, @"Driver needs to override this", v3, v4, v5, v6, vars0);
  return 0;
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
      id result = [(_MTLRenderPipelineState *)self vertexFunctionHandleWithFunction:a3];
      break;
    case 2uLL:
      id result = [(_MTLRenderPipelineState *)self fragmentFunctionHandleWithFunction:a3];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = [(_MTLRenderPipelineState *)self tileFunctionHandleWithFunction:a3];
      break;
    case 8uLL:
      id result = [(_MTLRenderPipelineState *)self objectFunctionHandleWithFunction:a3];
      break;
    default:
      if (a4 == 16) {
        id result = [(_MTLRenderPipelineState *)self meshFunctionHandleWithFunction:a3];
      }
      else {
LABEL_5:
      }
        id result = 0;
      break;
  }
  return result;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newVisibleFunctionTableWithDescriptor:a3];
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newVisibleFunctionTableWithDescriptor:a3];
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newVisibleFunctionTableWithDescriptor:a3];
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newVisibleFunctionTableWithDescriptor:a3];
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newVisibleFunctionTableWithDescriptor:a3];
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
      id result = [(_MTLRenderPipelineState *)self newVisibleFunctionTableFromVertexStageWithDescriptor:a3];
      break;
    case 2uLL:
      id result = [(_MTLRenderPipelineState *)self newVisibleFunctionTableFromFragmentStageWithDescriptor:a3];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = [(_MTLRenderPipelineState *)self newVisibleFunctionTableFromTileStageWithDescriptor:a3];
      break;
    case 8uLL:
      id result = [(_MTLRenderPipelineState *)self newVisibleFunctionTableFromObjectStageWithDescriptor:a3];
      break;
    default:
      if (a4 == 16) {
        id result = [(_MTLRenderPipelineState *)self newVisibleFunctionTableFromMeshStageWithDescriptor:a3];
      }
      else {
LABEL_5:
      }
        id result = 0;
      break;
  }
  return result;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState newRenderPipelineStateWithAdditionalBinaryFunctions:fragmentAdditionalBinaryFunctions:error:]", 5998, @"Driver needs to override this", (uint64_t)a5, v5, v6, v7, vars0);
  return 0;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  MTLReportFailure(0, "-[_MTLRenderPipelineState newTileRenderPipelineStateWithAdditionalBinaryFunctions:error:]", 6005, @"Driver needs to override this", v4, v5, v6, v7, vars0);
  return 0;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  if (objc_msgSend((id)objc_msgSend(a3, "tileAdditionalBinaryFunctions"), "count"))
  {
    uint64_t v7 = [a3 tileAdditionalBinaryFunctions];
    return [(_MTLRenderPipelineState *)self newTileRenderPipelineStateWithAdditionalBinaryFunctions:v7 error:a4];
  }
  else
  {
    uint64_t v9 = [a3 vertexAdditionalBinaryFunctions];
    uint64_t v10 = [a3 fragmentAdditionalBinaryFunctions];
    return [(_MTLRenderPipelineState *)self newRenderPipelineStateWithAdditionalBinaryFunctions:v9 fragmentAdditionalBinaryFunctions:v10 error:a4];
  }
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newIntersectionFunctionTableWithDescriptor:a3];
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newIntersectionFunctionTableWithDescriptor:a3];
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newIntersectionFunctionTableWithDescriptor:a3];
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newIntersectionFunctionTableWithDescriptor:a3];
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  uint64_t v4 = [(_MTLRenderPipelineState *)self device];

  return (id)[(MTLDevice *)v4 newIntersectionFunctionTableWithDescriptor:a3];
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  switch(a4)
  {
    case 1uLL:
      id result = [(_MTLRenderPipelineState *)self newVertexIntersectionFunctionTableWithDescriptor:a3];
      break;
    case 2uLL:
      id result = [(_MTLRenderPipelineState *)self newFragmentIntersectionFunctionTableWithDescriptor:a3];
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_5;
    case 4uLL:
      id result = [(_MTLRenderPipelineState *)self newTileIntersectionFunctionTableWithDescriptor:a3];
      break;
    case 8uLL:
      id result = [(_MTLRenderPipelineState *)self newObjectIntersectionFunctionTableWithDescriptor:a3];
      break;
    default:
      if (a4 == 16) {
        id result = [(_MTLRenderPipelineState *)self newMeshIntersectionFunctionTableWithDescriptor:a3];
      }
      else {
LABEL_5:
      }
        id result = 0;
      break;
  }
  return result;
}

- (MTLDebugInstrumentationData)vertexDebugInstrumentationData
{
  return self->_vertexDebugInstrumentationData;
}

- (void)setVertexDebugInstrumentationData:(id)a3
{
}

- (MTLDebugInstrumentationData)fragmentDebugInstrumentationData
{
  return self->_fragmentDebugInstrumentationData;
}

- (void)setFragmentDebugInstrumentationData:(id)a3
{
}

- (MTLDebugInstrumentationData)tileDebugInstrumentationData
{
  return self->_tileDebugInstrumentationData;
}

- (void)setTileDebugInstrumentationData:(id)a3
{
}

- (unint64_t)resourceIndex
{
  return self->_resourceIndex;
}

- (unsigned)explicitVisibilityGroupID
{
  return self->_explicitVisibilityGroupID;
}

- (unint64_t)gpuAddress
{
  return self->_gpuAddress;
}

- (unint64_t)objectThreadExecutionWidth
{
  return self->_objectThreadExecutionWidth;
}

- (unint64_t)meshThreadExecutionWidth
{
  return self->_meshThreadExecutionWidth;
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return self->_maxTotalThreadsPerObjectThreadgroup;
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return self->_maxTotalThreadsPerMeshThreadgroup;
}

- (unint64_t)maxTotalThreadgroupsPerMeshGrid
{
  return self->_maxTotalThreadgroupsPerMeshGrid;
}

- (MTLDebugInstrumentationData)objectDebugInstrumentationData
{
  return self->_objectDebugInstrumentationData;
}

- (void)setObjectDebugInstrumentationData:(id)a3
{
}

- (MTLDebugInstrumentationData)meshDebugInstrumentationData
{
  return self->_meshDebugInstrumentationData;
}

- (void)setMeshDebugInstrumentationData:(id)a3
{
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return self->_threadgroupSizeMatchesTileSize;
}

- (unint64_t)imageBlockSampleLength
{
  return self->_imageBlockSampleLength;
}

@end