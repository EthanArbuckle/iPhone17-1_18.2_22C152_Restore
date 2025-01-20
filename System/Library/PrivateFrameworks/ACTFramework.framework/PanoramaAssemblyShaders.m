@interface PanoramaAssemblyShaders
- (MTLComputePipelineState)addSliceToProjectiveGrid;
- (MTLComputePipelineState)addSliceToStaging;
- (MTLComputePipelineState)addStagingToOutput;
- (MTLComputePipelineState)prepareForDenoising;
- (MTLComputePipelineState)resetPanoSizedState;
- (MTLComputePipelineState)resetSliceSizedState;
- (PanoramaAssemblyShaders)initWithContext:(id)a3;
@end

@implementation PanoramaAssemblyShaders

- (PanoramaAssemblyShaders)initWithContext:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PanoramaAssemblyShaders;
  v6 = [(PanoramaAssemblyShaders *)&v26 init];
  if (!v6) {
    goto LABEL_10;
  }
  uint64_t v7 = objc_msgSend_computePipelineStateFor_constants_(v4, v5, @"assemblyResetPanoState", 0);
  resetPanoSizedState = v6->_resetPanoSizedState;
  v6->_resetPanoSizedState = (MTLComputePipelineState *)v7;

  if (!v6->_resetPanoSizedState) {
    goto LABEL_10;
  }
  uint64_t v10 = objc_msgSend_computePipelineStateFor_constants_(v4, v9, @"assemblyResetSliceState", 0);
  resetSliceSizedState = v6->_resetSliceSizedState;
  v6->_resetSliceSizedState = (MTLComputePipelineState *)v10;

  if (!v6->_resetSliceSizedState) {
    goto LABEL_10;
  }
  uint64_t v13 = objc_msgSend_computePipelineStateFor_constants_(v4, v12, @"assemblyAddSliceToStaging", 0);
  addSliceToStaging = v6->_addSliceToStaging;
  v6->_addSliceToStaging = (MTLComputePipelineState *)v13;

  if (!v6->_addSliceToStaging) {
    goto LABEL_10;
  }
  uint64_t v16 = objc_msgSend_computePipelineStateFor_constants_(v4, v15, @"assemblyAddSliceToProjectiveGrid", 0);
  addSliceToProjectiveGrid = v6->_addSliceToProjectiveGrid;
  v6->_addSliceToProjectiveGrid = (MTLComputePipelineState *)v16;

  if (!v6->_addSliceToProjectiveGrid) {
    goto LABEL_10;
  }
  uint64_t v19 = objc_msgSend_computePipelineStateFor_constants_(v4, v18, @"addStagingToOutput", 0);
  addStagingToOutput = v6->_addStagingToOutput;
  v6->_addStagingToOutput = (MTLComputePipelineState *)v19;

  if (!v6->_addStagingToOutput) {
    goto LABEL_10;
  }
  uint64_t v22 = objc_msgSend_computePipelineStateFor_constants_(v4, v21, @"prepareForDenoising", 0);
  prepareForDenoising = v6->_prepareForDenoising;
  v6->_prepareForDenoising = (MTLComputePipelineState *)v22;

  if (v6->_prepareForDenoising) {
    v24 = v6;
  }
  else {
LABEL_10:
  }
    v24 = 0;

  return v24;
}

- (MTLComputePipelineState)resetPanoSizedState
{
  return self->_resetPanoSizedState;
}

- (MTLComputePipelineState)resetSliceSizedState
{
  return self->_resetSliceSizedState;
}

- (MTLComputePipelineState)addSliceToStaging
{
  return self->_addSliceToStaging;
}

- (MTLComputePipelineState)addSliceToProjectiveGrid
{
  return self->_addSliceToProjectiveGrid;
}

- (MTLComputePipelineState)addStagingToOutput
{
  return self->_addStagingToOutput;
}

- (MTLComputePipelineState)prepareForDenoising
{
  return self->_prepareForDenoising;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prepareForDenoising, 0);
  objc_storeStrong((id *)&self->_addStagingToOutput, 0);
  objc_storeStrong((id *)&self->_addSliceToProjectiveGrid, 0);
  objc_storeStrong((id *)&self->_addSliceToStaging, 0);
  objc_storeStrong((id *)&self->_resetSliceSizedState, 0);
  objc_storeStrong((id *)&self->_resetPanoSizedState, 0);
}

@end