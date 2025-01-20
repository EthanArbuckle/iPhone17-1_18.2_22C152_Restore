@interface GTMTLReplayObjectMap
- (CGRect)contentRect;
- (CGRect)windowRect;
- (Class)layerClass;
- (GTMTLReplayObjectMap)initWithDevice:(id)a3;
- (GTMTLReplayObjectMap)initWithObjectMap:(id)a3;
- (MTLCommandQueue)defaultCommandQueue;
- (MTLDevice)defaultDevice;
- (id)accelerationStructureCommandEncoderForKey:(unint64_t)a3;
- (id)accelerationStructureForKey:(unint64_t)a3;
- (id)accelerationStructurePassDescriptorMap;
- (id)allocationForKey:(unint64_t)a3;
- (id)argumentEncoderForKey:(unint64_t)a3;
- (id)binaryArchiveForKey:(unint64_t)a3;
- (id)blitCommandEncoderForKey:(unint64_t)a3;
- (id)blitPassDescriptorMap;
- (id)bufferForHeapKey:(unint64_t)a3;
- (id)bufferForKey:(unint64_t)a3;
- (id)commandBufferForKey:(unint64_t)a3;
- (id)commandQueueForKey:(unint64_t)a3;
- (id)computeCommandEncoderForKey:(unint64_t)a3;
- (id)computePassDescriptorMap;
- (id)computePipelineDescriptorMap;
- (id)computePipelineStateForKey:(unint64_t)a3;
- (id)counterSampleBufferForKey:(unint64_t)a3;
- (id)depthStencilStateForKey:(unint64_t)a3;
- (id)deviceForKey:(unint64_t)a3;
- (id)drawableForKey:(unint64_t)a3;
- (id)dynamicLibraries;
- (id)dynamicLibraryForKey:(unint64_t)a3;
- (id)encoderForKey:(unint64_t)a3 ofType:(BOOL)a4;
- (id)eventForKey:(unint64_t)a3;
- (id)executeIndirectCommandBufferMap;
- (id)fenceForKey:(unint64_t)a3;
- (id)functionForKey:(unint64_t)a3;
- (id)functionHandleForKey:(unint64_t)a3;
- (id)functionMap;
- (id)functionPointerHandleForKey:(unint64_t)a3;
- (id)functionPrivateArgumentForKey:(unint64_t)a3;
- (id)heapForKey:(unint64_t)a3;
- (id)iOCommandBufferForKey:(unint64_t)a3;
- (id)iOCommandQueueForKey:(unint64_t)a3;
- (id)iOHandleForKey:(unint64_t)a3;
- (id)iOScratchBufferAllocatorForKey:(unint64_t)a3;
- (id)iOScratchBufferForKey:(unint64_t)a3;
- (id)indirectCommandBufferForKey:(unint64_t)a3;
- (id)indirectComputeCommandForKey:(unint64_t)a3;
- (id)indirectRenderCommandForKey:(unint64_t)a3;
- (id)intersectionFunctionTableForKey:(unint64_t)a3;
- (id)iosurfaceForProperties:(id)a3;
- (id)lateEvalEventForKey:(unint64_t)a3;
- (id)layerForKey:(unint64_t)a3;
- (id)libraries;
- (id)libraryForKey:(unint64_t)a3;
- (id)logStateForKey:(unint64_t)a3;
- (id)logStateMap;
- (id)objectPayloadBindingForKey:(unint64_t)a3;
- (id)parallelRenderCommandEncoderForKey:(unint64_t)a3;
- (id)pipelineLibraryForKey:(unint64_t)a3;
- (id)rasterizationRateMapForKey:(unint64_t)a3;
- (id)renderCommandEncoderForKey:(unint64_t)a3;
- (id)renderPassDescriptorMap;
- (id)renderPassDescriptorMapWithMemorylessSubstitutes:(id)a3;
- (id)renderPipelineDescriptorMap;
- (id)renderPipelineStateForKey:(unint64_t)a3;
- (id)residencySetForKey:(unint64_t)a3;
- (id)resourceForKey:(unint64_t)a3;
- (id)resourceGroupSPIForKey:(unint64_t)a3;
- (id)resourceStateCommandEncoderForKey:(unint64_t)a3;
- (id)resourceStatePassDescriptorMap;
- (id)resources;
- (id)restoreIndirectCommandBufferDataMap;
- (id)samplerStateForKey:(unint64_t)a3;
- (id)sharedEventForKey:(unint64_t)a3;
- (id)sharedEventHandleForKey:(unint64_t)a3;
- (id)spatialScalerForKey:(unint64_t)a3;
- (id)temporalScalerForKey:(unint64_t)a3;
- (id)textureForKey:(unint64_t)a3;
- (id)unusedResourceKeys;
- (id)visibleFunctionTableForKey:(unint64_t)a3;
- (id)windowProperties;
- (int64_t)interfaceOrientation;
- (unsigned)globalTraceIdForEncoder:(unint64_t)a3 ofType:(BOOL)a4;
- (void)addEntriesFromObjectMap:(id)a3;
- (void)addUnusedResourceKey:(unint64_t)a3;
- (void)commitCommandBuffers;
- (void)endEncodingForRenderCommandEncoder:(unint64_t)a3;
- (void)presentDrawableWithKey:(unint64_t)a3;
- (void)removeAccelerationStructureCommandEncoderForKey:(unint64_t)a3;
- (void)removeAccelerationStructureForKey:(unint64_t)a3;
- (void)removeAliasableResourceForKey:(id)a3;
- (void)removeArgumentEncoderForKey:(unint64_t)a3;
- (void)removeBlitCommandEncoderForKey:(unint64_t)a3;
- (void)removeBufferForHeapKey:(unint64_t)a3;
- (void)removeBufferForKey:(unint64_t)a3;
- (void)removeCommandBufferForKey:(unint64_t)a3;
- (void)removeCommandQueueForKey:(unint64_t)a3;
- (void)removeComputeCommandEncoderForKey:(unint64_t)a3;
- (void)removeComputePipelineStateForKey:(unint64_t)a3;
- (void)removeCounterSampleBuffer:(unint64_t)a3;
- (void)removeCounterSampleBufferForKey:(unint64_t)a3;
- (void)removeDeadlineProfileForKey:(unint64_t)a3;
- (void)removeDepthStencilStateForKey:(unint64_t)a3;
- (void)removeDeviceForKey:(unint64_t)a3;
- (void)removeDynamicLibraryForKey:(unint64_t)a3;
- (void)removeEventForKey:(unint64_t)a3;
- (void)removeFenceForKey:(unint64_t)a3;
- (void)removeFunctionForKey:(unint64_t)a3;
- (void)removeFunctionHandleForKey:(unint64_t)a3;
- (void)removeFunctionPointerHandleForKey:(unint64_t)a3;
- (void)removeFunctionPrivateArgumentForKey:(unint64_t)a3;
- (void)removeHeapForKey:(unint64_t)a3;
- (void)removeIOCommandBufferForKey:(unint64_t)a3;
- (void)removeIOCommandQueueForKey:(unint64_t)a3;
- (void)removeIOHandleForKey:(unint64_t)a3;
- (void)removeIOScratchBufferAllocatorForKey:(unint64_t)a3;
- (void)removeIOScratchBufferForKey:(unint64_t)a3;
- (void)removeIndirectCommandBufferForKey:(unint64_t)a3;
- (void)removeIndirectComputeCommandForKey:(unint64_t)a3;
- (void)removeIndirectRenderCommandForKey:(unint64_t)a3;
- (void)removeIntersectionFunctionTableForKey:(unint64_t)a3;
- (void)removeLateEvalEventForKey:(unint64_t)a3;
- (void)removeLibraryForKey:(unint64_t)a3;
- (void)removeLogStateForKey:(unint64_t)a3;
- (void)removeMotionEstimationPipelineForKey:(unint64_t)a3;
- (void)removeObjectPayloadBindingForKey:(unint64_t)a3;
- (void)removeParallelRenderCommandEncoderForKey:(unint64_t)a3;
- (void)removePipelineLibraryForKey:(unint64_t)a3;
- (void)removeRasterizationRateMapForKey:(unint64_t)a3;
- (void)removeRenderCommandEncoderForKey:(unint64_t)a3;
- (void)removeRenderPipelineStateForKey:(unint64_t)a3;
- (void)removeResidencySetForKey:(unint64_t)a3;
- (void)removeResourceGroupForKey:(unint64_t)a3;
- (void)removeResourceGroupSPIForKey:(unint64_t)a3;
- (void)removeResourceStateCommandEncoderForKey:(unint64_t)a3;
- (void)removeResourcesForKeys:(id)a3;
- (void)removeSamplerStateForKey:(unint64_t)a3;
- (void)removeSharedEventForKey:(unint64_t)a3;
- (void)removeSpatialScalerForKey:(unint64_t)a3;
- (void)removeTemporalScalerForKey:(unint64_t)a3;
- (void)removeTextureForKey:(unint64_t)a3;
- (void)removeVideoCommandEncoderForKey:(unint64_t)a3;
- (void)removeVisibleFunctionHandleForKey:(unint64_t)a3;
- (void)removeVisibleFunctionTableForKey:(unint64_t)a3;
- (void)setAccelerationStructure:(id)a3 forKey:(unint64_t)a4;
- (void)setAccelerationStructureCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setArgumentEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setBlitCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setBuffer:(id)a3 forHeapKey:(unint64_t)a4;
- (void)setBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setCommandBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setCommandQueue:(id)a3 forKey:(unint64_t)a4;
- (void)setComputeCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setComputePipelineState:(id)a3 forKey:(unint64_t)a4;
- (void)setContentRect:(CGRect)a3 windowRect:(CGRect)a4 properties:(id)a5;
- (void)setCounterSampleBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setDeadlineProfile:(id)a3 forKey:(unint64_t)a4;
- (void)setDebugCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setDefaultCommandQueue:(id)a3;
- (void)setDepthStencilState:(id)a3 forKey:(unint64_t)a4;
- (void)setDevice:(id)a3 forKey:(unint64_t)a4;
- (void)setDrawable:(id)a3 forKey:(unint64_t)a4;
- (void)setDynamicLibrary:(id)a3 forKey:(unint64_t)a4;
- (void)setDynamicLibrary:(id)a3 forPath:(const char *)a4;
- (void)setEvent:(id)a3 forKey:(unint64_t)a4;
- (void)setFence:(id)a3 forKey:(unint64_t)a4;
- (void)setFunction:(id)a3 forKey:(unint64_t)a4;
- (void)setFunctionHandle:(id)a3 forKey:(unint64_t)a4;
- (void)setFunctionPointerHandle:(id)a3 forKey:(unint64_t)a4;
- (void)setFunctionPrivateArgument:(id)a3 forKey:(unint64_t)a4;
- (void)setHeap:(id)a3 forKey:(unint64_t)a4;
- (void)setIOCommandBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setIOCommandQueue:(id)a3 forKey:(unint64_t)a4;
- (void)setIOScratchBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setIOScratchBufferAllocator:(id)a3 forKey:(unint64_t)a4;
- (void)setIndirectCommandBuffer:(id)a3 forKey:(unint64_t)a4;
- (void)setIndirectComputeCommand:(id)a3 forKey:(unint64_t)a4;
- (void)setIndirectRenderCommand:(id)a3 forKey:(unint64_t)a4;
- (void)setInterfaceOrientation:(int64_t)a3;
- (void)setIntersectionFunctionTable:(id)a3 forKey:(unint64_t)a4;
- (void)setLateEvalEvent:(id)a3 forKey:(unint64_t)a4;
- (void)setLayer:(id)a3 forKey:(unint64_t)a4;
- (void)setLayerClass:(Class)a3;
- (void)setLibrary:(id)a3 forKey:(unint64_t)a4;
- (void)setLogState:(id)a3 forKey:(unint64_t)a4;
- (void)setObjectPayloadBinding:(id)a3 forKey:(unint64_t)a4;
- (void)setParallelRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setPipelineLibrarySPI:(id)a3 forKey:(unint64_t)a4;
- (void)setRasterizationRateMap:(id)a3 forKey:(unint64_t)a4;
- (void)setRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setRenderPipelineState:(id)a3 forKey:(unint64_t)a4;
- (void)setResidencySet:(id)a3 forKey:(unint64_t)a4;
- (void)setResourceGroupSPI:(id)a3 forKey:(unint64_t)a4;
- (void)setResourceStateCommandEncoder:(id)a3 forKey:(unint64_t)a4;
- (void)setSamplerState:(id)a3 forKey:(unint64_t)a4;
- (void)setSharedEvent:(id)a3 forKey:(unint64_t)a4;
- (void)setSharedEventHandle:(id)a3 forKey:(unint64_t)a4;
- (void)setSpatialScaler:(id)a3 forKey:(unint64_t)a4;
- (void)setTemporalScaler:(id)a3 forKey:(unint64_t)a4;
- (void)setTexture:(id)a3 forKey:(unint64_t)a4;
- (void)setVisibleFunctionTable:(id)a3 forKey:(unint64_t)a4;
@end

@implementation GTMTLReplayObjectMap

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCommandQueue, 0);
  objc_storeStrong((id *)&self->_defaultDevice, 0);
  objc_storeStrong((id *)&self->_windowProperties, 0);
  objc_storeStrong((id *)&self->_unusedResources, 0);
  objc_storeStrong((id *)&self->_logStates, 0);
  objc_storeStrong((id *)&self->_temporalScalers, 0);
  objc_storeStrong((id *)&self->_spatialScalers, 0);
  objc_storeStrong((id *)&self->_deadlineProfiles, 0);
  objc_storeStrong((id *)&self->_mpsExternalPluginBases, 0);
  objc_storeStrong((id *)&self->_functionPrivateArguments, 0);
  objc_storeStrong((id *)&self->_functionPointerHandles, 0);
  objc_storeStrong((id *)&self->_intersectionFunctionTables, 0);
  objc_storeStrong((id *)&self->_functionHandles, 0);
  objc_storeStrong((id *)&self->_sharedEventHandles, 0);
  objc_storeStrong((id *)&self->_samplerStates, 0);
  objc_storeStrong((id *)&self->_bufferForHeap, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_resourceGroups, 0);
  objc_storeStrong((id *)&self->_residencySets, 0);
  objc_storeStrong((id *)&self->_renderPipelineStates, 0);
  objc_storeStrong((id *)&self->_rasterizationRateMaps, 0);
  objc_storeStrong((id *)&self->_pipelineLibraries, 0);
  objc_storeStrong((id *)&self->_objectPayloadBinding, 0);
  objc_storeStrong((id *)&self->_parallelRenderCommandEncoders, 0);
  objc_storeStrong((id *)&self->_motionEstimationPipelines, 0);
  objc_storeStrong((id *)&self->_dynamicLibraries, 0);
  objc_storeStrong((id *)&self->_libraries, 0);
  objc_storeStrong((id *)&self->_layers, 0);
  objc_storeStrong((id *)&self->_iosurfaces, 0);
  objc_storeStrong((id *)&self->_indirectRenderCommands, 0);
  objc_storeStrong((id *)&self->_indirectComputeCommands, 0);
  objc_storeStrong((id *)&self->_heaps, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_fences, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_drawables, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_depthStencilStates, 0);
  objc_storeStrong((id *)&self->_counterSampleBuffers, 0);
  objc_storeStrong((id *)&self->_computePipelineStates, 0);
  objc_storeStrong((id *)&self->_ioCommandQueues, 0);
  objc_storeStrong((id *)&self->_ioScratchBufferAllocators, 0);
  objc_storeStrong((id *)&self->_ioScratchBuffers, 0);
  objc_storeStrong((id *)&self->_ioHandles, 0);
  objc_storeStrong((id *)&self->_ioCommandBuffers, 0);
  objc_storeStrong((id *)&self->_commandQueues, 0);
  objc_storeStrong((id *)&self->_commandEncoders, 0);
  objc_storeStrong((id *)&self->_commandBuffers, 0);

  objc_storeStrong((id *)&self->_argumentEncoders, 0);
}

- (void)setDefaultCommandQueue:(id)a3
{
}

- (MTLCommandQueue)defaultCommandQueue
{
  return self->_defaultCommandQueue;
}

- (MTLDevice)defaultDevice
{
  return self->_defaultDevice;
}

- (id)unusedResourceKeys
{
  id v2 = [(NSMutableSet *)self->_unusedResources copy];

  return v2;
}

- (void)addUnusedResourceKey:(unint64_t)a3
{
  unusedResources = self->_unusedResources;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableSet *)unusedResources addObject:v4];
}

- (void)commitCommandBuffers
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v3 = self->_commandEncoders;
  id v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v31;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [(NSMutableDictionary *)self->_commandEncoders objectForKeyedSubscript:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        [v8 endEncoding];
      }
      id v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_commandEncoders removeAllObjects];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = self->_parallelRenderCommandEncoders;
  id v10 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [(NSMutableDictionary *)self->_parallelRenderCommandEncoders objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
        [v14 endEncoding];
      }
      id v11 = [(NSMutableDictionary *)v9 countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v11);
  }

  [(NSMutableDictionary *)self->_parallelRenderCommandEncoders removeAllObjects];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = self->_commandBuffers;
  id v16 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v22 + 1) + 8 * (void)k);
        v21 = -[NSMutableDictionary objectForKeyedSubscript:](self->_commandBuffers, "objectForKeyedSubscript:", v20, (void)v22);
        [g_activityLog logCommandBuffer:v21 withKey:[v20 unsignedLongLongValue]];
        GTMTLReplay_commitCommandBuffer(v21);
      }
      id v17 = [(NSMutableDictionary *)v15 countByEnumeratingWithState:&v22 objects:v34 count:16];
    }
    while (v17);
  }

  [(NSMutableDictionary *)self->_commandBuffers removeAllObjects];
}

- (id)encoderForKey:(unint64_t)a3 ofType:(BOOL)a4
{
  if (a4) {
    parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  }
  else {
    parallelRenderCommandEncoders = self->_commandEncoders;
  }
  id v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v6 = [(NSMutableDictionary *)parallelRenderCommandEncoders objectForKeyedSubscript:v5];

  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___MTLCommandEncoder]) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (unsigned)globalTraceIdForEncoder:(unint64_t)a3 ofType:(BOOL)a4
{
  if (a4) {
    parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  }
  else {
    parallelRenderCommandEncoders = self->_commandEncoders;
  }
  id v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v6 = [(NSMutableDictionary *)parallelRenderCommandEncoders objectForKeyedSubscript:v5];
  unsigned int v7 = [v6 globalTraceObjectID];

  return v7;
}

- (void)endEncodingForRenderCommandEncoder:(unint64_t)a3
{
  -[GTMTLReplayObjectMap renderCommandEncoderForKey:](self, "renderCommandEncoderForKey:");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 endEncoding];
  [(GTMTLReplayObjectMap *)self removeRenderCommandEncoderForKey:a3];
}

- (id)restoreIndirectCommandBufferDataMap
{
  id v3 = [(NSMutableDictionary *)self->_resources mutableCopy];
  [v3 addEntriesFromDictionary:self->_renderPipelineStates];
  [v3 addEntriesFromDictionary:self->_computePipelineStates];
  id v4 = [v3 copy];

  return v4;
}

- (id)renderPassDescriptorMap
{
  return [(GTMTLReplayObjectMap *)self renderPassDescriptorMapWithMemorylessSubstitutes:0];
}

- (id)renderPassDescriptorMapWithMemorylessSubstitutes:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_resources mutableCopy];
  if ([v4 count]) {
    [v5 addEntriesFromDictionary:v4];
  }
  [v5 addEntriesFromDictionary:self->_rasterizationRateMaps];
  id v6 = [v5 copy];

  return v6;
}

- (id)logStateMap
{
  return self->_logStates;
}

- (id)accelerationStructurePassDescriptorMap
{
  return self->_resources;
}

- (id)resourceStatePassDescriptorMap
{
  return self->_resources;
}

- (id)computePassDescriptorMap
{
  return self->_resources;
}

- (id)blitPassDescriptorMap
{
  return self->_resources;
}

- (id)computePipelineDescriptorMap
{
  id v3 = [(NSMutableDictionary *)self->_functions mutableCopy];
  [v3 addEntriesFromDictionary:self->_dynamicLibraries];
  [v3 addEntriesFromDictionary:self->_pipelineLibraries];

  return v3;
}

- (id)renderPipelineDescriptorMap
{
  id v3 = [(NSMutableDictionary *)self->_functions mutableCopy];
  [v3 addEntriesFromDictionary:self->_dynamicLibraries];
  [v3 addEntriesFromDictionary:self->_pipelineLibraries];
  id v4 = [v3 copy];

  return v4;
}

- (id)functionMap
{
  return self->_functions;
}

- (id)executeIndirectCommandBufferMap
{
  return self->_resources;
}

- (id)resources
{
  return self->_resources;
}

- (id)dynamicLibraries
{
  return self->_dynamicLibraries;
}

- (id)libraries
{
  return self->_libraries;
}

- (void)removeLogStateForKey:(unint64_t)a3
{
  logStates = self->_logStates;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)logStates removeObjectForKey:v4];
}

- (void)removeTemporalScalerForKey:(unint64_t)a3
{
  temporalScalers = self->_temporalScalers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)temporalScalers removeObjectForKey:v4];
}

- (void)removeSpatialScalerForKey:(unint64_t)a3
{
  spatialScalers = self->_spatialScalers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)spatialScalers removeObjectForKey:v4];
}

- (void)removeDeadlineProfileForKey:(unint64_t)a3
{
  deadlineProfiles = self->_deadlineProfiles;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)deadlineProfiles removeObjectForKey:v4];
}

- (void)removeVisibleFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)resources removeObjectForKey:v4];
}

- (void)removeFunctionPrivateArgumentForKey:(unint64_t)a3
{
  functionPrivateArguments = self->_functionPrivateArguments;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)functionPrivateArguments removeObjectForKey:v4];
}

- (void)removeFunctionPointerHandleForKey:(unint64_t)a3
{
  functionPointerHandles = self->_functionPointerHandles;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)functionPointerHandles removeObjectForKey:v4];
}

- (void)removeLateEvalEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)events removeObjectForKey:v4];
}

- (void)removeResourceGroupSPIForKey:(unint64_t)a3
{
  resourceGroups = self->_resourceGroups;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)resourceGroups removeObjectForKey:v4];
}

- (void)removeIntersectionFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)resources removeObjectForKey:v4];
}

- (void)removeAccelerationStructureCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandEncoders removeObjectForKey:v4];
}

- (void)removeAccelerationStructureForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)resources removeObjectForKey:v4];
}

- (void)removeFunctionHandleForKey:(unint64_t)a3
{
  functionHandles = self->_functionHandles;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)functionHandles removeObjectForKey:v4];
}

- (void)removeVisibleFunctionHandleForKey:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(GTMTLReplayObjectMap *)self removeAliasableResourceForKey:v4];
}

- (void)removeDynamicLibraryForKey:(unint64_t)a3
{
  dynamicLibraries = self->_dynamicLibraries;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)dynamicLibraries removeObjectForKey:v4];
}

- (void)removeVideoCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandEncoders removeObjectForKey:v4];
}

- (void)removeTextureForKey:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(GTMTLReplayObjectMap *)self removeAliasableResourceForKey:v4];
}

- (void)removeSharedEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)events removeObjectForKey:v4];
}

- (void)removeSamplerStateForKey:(unint64_t)a3
{
  samplerStates = self->_samplerStates;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)samplerStates removeObjectForKey:v4];
}

- (void)removeResourceStateCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandEncoders removeObjectForKey:v4];
}

- (void)removeResourceGroupForKey:(unint64_t)a3
{
  resourceGroups = self->_resourceGroups;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)resourceGroups removeObjectForKey:v4];
}

- (void)removeResidencySetForKey:(unint64_t)a3
{
  residencySets = self->_residencySets;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)residencySets removeObjectForKey:v4];
}

- (void)removeRenderPipelineStateForKey:(unint64_t)a3
{
  renderPipelineStates = self->_renderPipelineStates;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)renderPipelineStates removeObjectForKey:v4];
}

- (void)removeRenderCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandEncoders removeObjectForKey:v4];
}

- (void)removeRasterizationRateMapForKey:(unint64_t)a3
{
  rasterizationRateMaps = self->_rasterizationRateMaps;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)rasterizationRateMaps removeObjectForKey:v4];
}

- (void)removePipelineLibraryForKey:(unint64_t)a3
{
  pipelineLibraries = self->_pipelineLibraries;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)pipelineLibraries removeObjectForKey:v4];
}

- (void)removeObjectPayloadBindingForKey:(unint64_t)a3
{
  objectPayloadBinding = self->_objectPayloadBinding;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)objectPayloadBinding removeObjectForKey:v4];
}

- (void)removeParallelRenderCommandEncoderForKey:(unint64_t)a3
{
  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)parallelRenderCommandEncoders removeObjectForKey:v4];
}

- (void)removeMotionEstimationPipelineForKey:(unint64_t)a3
{
  motionEstimationPipelines = self->_motionEstimationPipelines;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)motionEstimationPipelines removeObjectForKey:v4];
}

- (void)removeLibraryForKey:(unint64_t)a3
{
  libraries = self->_libraries;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)libraries removeObjectForKey:v4];
}

- (void)removeIndirectRenderCommandForKey:(unint64_t)a3
{
  indirectRenderCommands = self->_indirectRenderCommands;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)indirectRenderCommands removeObjectForKey:v4];
}

- (void)removeIndirectComputeCommandForKey:(unint64_t)a3
{
  indirectComputeCommands = self->_indirectComputeCommands;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)indirectComputeCommands removeObjectForKey:v4];
}

- (void)removeIndirectCommandBufferForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)resources removeObjectForKey:v4];
}

- (void)removeHeapForKey:(unint64_t)a3
{
  heaps = self->_heaps;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)heaps removeObjectForKey:v4];
}

- (void)removeFunctionForKey:(unint64_t)a3
{
  functions = self->_functions;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)functions removeObjectForKey:v4];
}

- (void)removeFenceForKey:(unint64_t)a3
{
  fences = self->_fences;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)fences removeObjectForKey:v4];
}

- (void)removeEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)events removeObjectForKey:v4];
}

- (void)removeDeviceForKey:(unint64_t)a3
{
  devices = self->_devices;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)devices removeObjectForKey:v4];
}

- (void)removeDepthStencilStateForKey:(unint64_t)a3
{
  depthStencilStates = self->_depthStencilStates;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)depthStencilStates removeObjectForKey:v4];
}

- (void)removeCounterSampleBuffer:(unint64_t)a3
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)counterSampleBuffers removeObjectForKey:v4];
}

- (void)removeCounterSampleBufferForKey:(unint64_t)a3
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)counterSampleBuffers removeObjectForKey:v4];
}

- (void)removeComputePipelineStateForKey:(unint64_t)a3
{
  computePipelineStates = self->_computePipelineStates;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)computePipelineStates removeObjectForKey:v4];
}

- (void)removeComputeCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandEncoders removeObjectForKey:v4];
}

- (void)removeIOScratchBufferAllocatorForKey:(unint64_t)a3
{
  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)ioScratchBufferAllocators removeObjectForKey:v4];
}

- (void)removeIOScratchBufferForKey:(unint64_t)a3
{
  ioScratchBuffers = self->_ioScratchBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)ioScratchBuffers removeObjectForKey:v4];
}

- (void)removeIOHandleForKey:(unint64_t)a3
{
  ioHandles = self->_ioHandles;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)ioHandles removeObjectForKey:v4];
}

- (void)removeIOCommandQueueForKey:(unint64_t)a3
{
  ioCommandQueues = self->_ioCommandQueues;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)ioCommandQueues removeObjectForKey:v4];
}

- (void)removeIOCommandBufferForKey:(unint64_t)a3
{
  ioCommandBuffers = self->_ioCommandBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)ioCommandBuffers removeObjectForKey:v4];
}

- (void)removeCommandQueueForKey:(unint64_t)a3
{
  commandQueues = self->_commandQueues;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandQueues removeObjectForKey:v4];
}

- (void)removeCommandBufferForKey:(unint64_t)a3
{
  commandBuffers = self->_commandBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandBuffers removeObjectForKey:v4];
}

- (void)removeBufferForHeapKey:(unint64_t)a3
{
  bufferForHeap = self->_bufferForHeap;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)bufferForHeap removeObjectForKey:v4];
}

- (void)removeBufferForKey:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(GTMTLReplayObjectMap *)self removeAliasableResourceForKey:v4];
}

- (void)removeBlitCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)commandEncoders removeObjectForKey:v4];
}

- (void)removeArgumentEncoderForKey:(unint64_t)a3
{
  argumentEncoders = self->_argumentEncoders;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)argumentEncoders removeObjectForKey:v4];
}

- (void)removeAliasableResourceForKey:(id)a3
{
  id v6 = a3;
  id v4 = -[NSMutableDictionary objectForKeyedSubscript:](self->_resources, "objectForKeyedSubscript:");
  id v5 = v4;
  if (v4)
  {
    MakeRootResourceAliasable(v4);
    [(NSMutableDictionary *)self->_resources removeObjectForKey:v6];
  }
}

- (void)presentDrawableWithKey:(unint64_t)a3
{
  drawables = self->_drawables;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)drawables removeObjectForKey:v4];
}

- (id)allocationForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if (!v7)
  {
    heaps = self->_heaps;
    v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    unsigned int v7 = [(NSMutableDictionary *)heaps objectForKeyedSubscript:v9];
  }

  return v7;
}

- (id)bufferForHeapKey:(unint64_t)a3
{
  bufferForHeap = self->_bufferForHeap;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)bufferForHeap objectForKeyedSubscript:v4];

  return v5;
}

- (id)logStateForKey:(unint64_t)a3
{
  logStates = self->_logStates;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)logStates objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)temporalScalerForKey:(unint64_t)a3
{
  temporalScalers = self->_temporalScalers;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)temporalScalers objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)spatialScalerForKey:(unint64_t)a3
{
  spatialScalers = self->_spatialScalers;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)spatialScalers objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)functionPrivateArgumentForKey:(unint64_t)a3
{
  functionPrivateArguments = self->_functionPrivateArguments;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)functionPrivateArguments objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)functionPointerHandleForKey:(unint64_t)a3
{
  functionPointerHandles = self->_functionPointerHandles;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)functionPointerHandles objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)lateEvalEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)events objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLLateEvalEvent]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)resourceGroupSPIForKey:(unint64_t)a3
{
  resourceGroups = self->_resourceGroups;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resourceGroups objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)intersectionFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLIntersectionFunctionTable]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)accelerationStructureForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLAccelerationStructure]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)functionHandleForKey:(unint64_t)a3
{
  functionHandles = self->_functionHandles;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)functionHandles objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)visibleFunctionTableForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLVisibleFunctionTable]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)dynamicLibraryForKey:(unint64_t)a3
{
  dynamicLibraries = self->_dynamicLibraries;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)dynamicLibraries objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)binaryArchiveForKey:(unint64_t)a3
{
  return 0;
}

- (id)textureForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLTexture]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)sharedEventHandleForKey:(unint64_t)a3
{
  sharedEventHandles = self->_sharedEventHandles;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)sharedEventHandles objectForKeyedSubscript:v4];

  return v5;
}

- (id)sharedEventForKey:(unint64_t)a3
{
  events = self->_events;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)events objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLSharedEvent]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)samplerStateForKey:(unint64_t)a3
{
  samplerStates = self->_samplerStates;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)samplerStates objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)resourceStateCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)commandEncoders objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLResourceStateCommandEncoder]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)resourceForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)renderPipelineStateForKey:(unint64_t)a3
{
  renderPipelineStates = self->_renderPipelineStates;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)renderPipelineStates objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)renderCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)commandEncoders objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLRenderCommandEncoder]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)residencySetForKey:(unint64_t)a3
{
  residencySets = self->_residencySets;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)residencySets objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)rasterizationRateMapForKey:(unint64_t)a3
{
  rasterizationRateMaps = self->_rasterizationRateMaps;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)rasterizationRateMaps objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)pipelineLibraryForKey:(unint64_t)a3
{
  pipelineLibraries = self->_pipelineLibraries;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)pipelineLibraries objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)objectPayloadBindingForKey:(unint64_t)a3
{
  objectPayloadBinding = self->_objectPayloadBinding;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)objectPayloadBinding objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)parallelRenderCommandEncoderForKey:(unint64_t)a3
{
  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)parallelRenderCommandEncoders objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)libraryForKey:(unint64_t)a3
{
  libraries = self->_libraries;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)libraries objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)layerForKey:(unint64_t)a3
{
  layers = self->_layers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)layers objectForKeyedSubscript:v4];

  return v5;
}

- (id)iosurfaceForProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_iosurfaces objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [objc_alloc((Class)IOSurface) initWithProperties:v4];
    [(NSMutableDictionary *)self->_iosurfaces setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)indirectRenderCommandForKey:(unint64_t)a3
{
  indirectRenderCommands = self->_indirectRenderCommands;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)indirectRenderCommands objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)indirectComputeCommandForKey:(unint64_t)a3
{
  indirectComputeCommands = self->_indirectComputeCommands;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  unsigned int v7 = [(NSMutableDictionary *)indirectComputeCommands objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)indirectCommandBufferForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v4];

  if (IsResourceIndirectCommandBuffer(v5)) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)heapForKey:(unint64_t)a3
{
  heaps = self->_heaps;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)heaps objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)functionForKey:(unint64_t)a3
{
  functions = self->_functions;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)functions objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)fenceForKey:(unint64_t)a3
{
  fences = self->_fences;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)fences objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)eventForKey:(unint64_t)a3
{
  events = self->_events;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)events objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)drawableForKey:(unint64_t)a3
{
  drawables = self->_drawables;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)drawables objectForKeyedSubscript:v4];

  return v5;
}

- (id)deviceForKey:(unint64_t)a3
{
  return self->_defaultDevice;
}

- (id)depthStencilStateForKey:(unint64_t)a3
{
  depthStencilStates = self->_depthStencilStates;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)depthStencilStates objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)counterSampleBufferForKey:(unint64_t)a3
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)counterSampleBuffers objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)computePipelineStateForKey:(unint64_t)a3
{
  computePipelineStates = self->_computePipelineStates;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)computePipelineStates objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)computeCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)commandEncoders objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLComputeCommandEncoder]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)commandQueueForKey:(unint64_t)a3
{
  commandQueues = self->_commandQueues;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)commandQueues objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)iOCommandQueueForKey:(unint64_t)a3
{
  ioCommandQueues = self->_ioCommandQueues;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)ioCommandQueues objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)iOScratchBufferAllocatorForKey:(unint64_t)a3
{
  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)ioScratchBufferAllocators objectForKeyedSubscript:v4];

  return v5;
}

- (id)iOScratchBufferForKey:(unint64_t)a3
{
  ioScratchBuffers = self->_ioScratchBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)ioScratchBuffers objectForKeyedSubscript:v4];

  return v5;
}

- (id)iOHandleForKey:(unint64_t)a3
{
  ioHandles = self->_ioHandles;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)ioHandles objectForKeyedSubscript:v4];

  return v5;
}

- (id)iOCommandBufferForKey:(unint64_t)a3
{
  ioCommandBuffers = self->_ioCommandBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)ioCommandBuffers objectForKeyedSubscript:v4];

  return v5;
}

- (id)commandBufferForKey:(unint64_t)a3
{
  commandBuffers = self->_commandBuffers;
  id v4 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v5 = [(NSMutableDictionary *)commandBuffers objectForKeyedSubscript:v4];

  return v5;
}

- (id)bufferForKey:(unint64_t)a3
{
  resources = self->_resources;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)resources objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLBuffer]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)blitCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)commandEncoders objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLBlitCommandEncoder]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (id)argumentEncoderForKey:(unint64_t)a3
{
  argumentEncoders = self->_argumentEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)argumentEncoders objectForKeyedSubscript:v6];

  if (!v7)
  {
    unusedResources = self->_unusedResources;
    id v9 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v9];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v7;
}

- (id)accelerationStructureCommandEncoderForKey:(unint64_t)a3
{
  commandEncoders = self->_commandEncoders;
  id v6 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:");
  id v7 = [(NSMutableDictionary *)commandEncoders objectForKeyedSubscript:v6];

  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___MTLAccelerationStructureCommandEncoder]) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (!v9)
  {
    unusedResources = self->_unusedResources;
    id v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    LODWORD(unusedResources) = [(NSMutableSet *)unusedResources containsObject:v11];

    GTMTLReplay_dispatchFailedToGet(a3, (int)unusedResources);
  }

  return v9;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (void)setContentRect:(CGRect)a3 windowRect:(CGRect)a4 properties:(id)a5
{
  self->_contentRect = a3;
  self->_windowRect = a4;
  objc_storeStrong((id *)&self->_windowProperties, a5);
}

- (int64_t)interfaceOrientation
{
  return self->_orientation;
}

- (id)windowProperties
{
  return self->_windowProperties;
}

- (CGRect)windowRect
{
  double x = self->_windowRect.origin.x;
  double y = self->_windowRect.origin.y;
  double width = self->_windowRect.size.width;
  double height = self->_windowRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLogState:(id)a3 forKey:(unint64_t)a4
{
  logStates = self->_logStates;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)logStates setObject:v6 forKeyedSubscript:v7];
}

- (void)setTemporalScaler:(id)a3 forKey:(unint64_t)a4
{
  temporalScalers = self->_temporalScalers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)temporalScalers setObject:v6 forKeyedSubscript:v7];
}

- (void)setSpatialScaler:(id)a3 forKey:(unint64_t)a4
{
  spatialScalers = self->_spatialScalers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)spatialScalers setObject:v6 forKeyedSubscript:v7];
}

- (void)setDeadlineProfile:(id)a3 forKey:(unint64_t)a4
{
  deadlineProfiles = self->_deadlineProfiles;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)deadlineProfiles setObject:v6 forKeyedSubscript:v7];
}

- (void)setFunctionPrivateArgument:(id)a3 forKey:(unint64_t)a4
{
  functionPrivateArguments = self->_functionPrivateArguments;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)functionPrivateArguments setObject:v6 forKeyedSubscript:v7];
}

- (void)setFunctionPointerHandle:(id)a3 forKey:(unint64_t)a4
{
  functionPointerHandles = self->_functionPointerHandles;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)functionPointerHandles setObject:v6 forKeyedSubscript:v7];
}

- (void)setLateEvalEvent:(id)a3 forKey:(unint64_t)a4
{
  events = self->_events;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)events setObject:v6 forKeyedSubscript:v7];
}

- (void)setResourceGroupSPI:(id)a3 forKey:(unint64_t)a4
{
  resourceGroups = self->_resourceGroups;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resourceGroups setObject:v6 forKeyedSubscript:v7];
}

- (void)setResidencySet:(id)a3 forKey:(unint64_t)a4
{
  residencySets = self->_residencySets;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)residencySets setObject:v6 forKeyedSubscript:v7];
}

- (void)setIntersectionFunctionTable:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resources setObject:v6 forKeyedSubscript:v7];
}

- (void)setAccelerationStructure:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resources setObject:v6 forKeyedSubscript:v7];
}

- (void)setAccelerationStructureCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setFunctionHandle:(id)a3 forKey:(unint64_t)a4
{
  functionHandles = self->_functionHandles;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)functionHandles setObject:v6 forKeyedSubscript:v7];
}

- (void)setVisibleFunctionTable:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resources setObject:v6 forKeyedSubscript:v7];
}

- (void)setDynamicLibrary:(id)a3 forPath:(const char *)a4
{
  dynamicLibraries = self->_dynamicLibraries;
  id v6 = a3;
  id v7 = +[NSString stringWithUTF8String:a4];
  [(NSMutableDictionary *)dynamicLibraries setObject:v6 forKeyedSubscript:v7];
}

- (void)setDynamicLibrary:(id)a3 forKey:(unint64_t)a4
{
  dynamicLibraries = self->_dynamicLibraries;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)dynamicLibraries setObject:v6 forKeyedSubscript:v7];
}

- (void)setTexture:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resources setObject:v6 forKeyedSubscript:v7];
}

- (void)setSharedEventHandle:(id)a3 forKey:(unint64_t)a4
{
  sharedEventHandles = self->_sharedEventHandles;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)sharedEventHandles setObject:v6 forKeyedSubscript:v7];
}

- (void)setSharedEvent:(id)a3 forKey:(unint64_t)a4
{
  events = self->_events;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)events setObject:v6 forKeyedSubscript:v7];
}

- (void)setSamplerState:(id)a3 forKey:(unint64_t)a4
{
  samplerStates = self->_samplerStates;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)samplerStates setObject:v6 forKeyedSubscript:v7];
}

- (void)setResourceStateCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setRenderPipelineState:(id)a3 forKey:(unint64_t)a4
{
  renderPipelineStates = self->_renderPipelineStates;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)renderPipelineStates setObject:v6 forKeyedSubscript:v7];
}

- (void)setRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setRasterizationRateMap:(id)a3 forKey:(unint64_t)a4
{
  rasterizationRateMaps = self->_rasterizationRateMaps;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)rasterizationRateMaps setObject:v6 forKeyedSubscript:v7];
}

- (void)setPipelineLibrarySPI:(id)a3 forKey:(unint64_t)a4
{
  pipelineLibraries = self->_pipelineLibraries;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)pipelineLibraries setObject:v6 forKeyedSubscript:v7];
}

- (void)setObjectPayloadBinding:(id)a3 forKey:(unint64_t)a4
{
  objectPayloadBinding = self->_objectPayloadBinding;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)objectPayloadBinding setObject:v6 forKeyedSubscript:v7];
}

- (void)setParallelRenderCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  parallelRenderCommandEncoders = self->_parallelRenderCommandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)parallelRenderCommandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setLibrary:(id)a3 forKey:(unint64_t)a4
{
  libraries = self->_libraries;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)libraries setObject:v6 forKeyedSubscript:v7];
}

- (void)setLayer:(id)a3 forKey:(unint64_t)a4
{
  layers = self->_layers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)layers setObject:v6 forKeyedSubscript:v7];
}

- (void)setIndirectRenderCommand:(id)a3 forKey:(unint64_t)a4
{
  indirectRenderCommands = self->_indirectRenderCommands;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)indirectRenderCommands setObject:v6 forKeyedSubscript:v7];
}

- (void)setIndirectComputeCommand:(id)a3 forKey:(unint64_t)a4
{
  indirectComputeCommands = self->_indirectComputeCommands;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)indirectComputeCommands setObject:v6 forKeyedSubscript:v7];
}

- (void)setIndirectCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resources setObject:v6 forKeyedSubscript:v7];
}

- (void)setHeap:(id)a3 forKey:(unint64_t)a4
{
  heaps = self->_heaps;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)heaps setObject:v6 forKeyedSubscript:v7];
}

- (void)setFunction:(id)a3 forKey:(unint64_t)a4
{
  functions = self->_functions;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)functions setObject:v6 forKeyedSubscript:v7];
}

- (void)setFence:(id)a3 forKey:(unint64_t)a4
{
  fences = self->_fences;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)fences setObject:v6 forKeyedSubscript:v7];
}

- (void)setEvent:(id)a3 forKey:(unint64_t)a4
{
  events = self->_events;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)events setObject:v6 forKeyedSubscript:v7];
}

- (void)setDrawable:(id)a3 forKey:(unint64_t)a4
{
  drawables = self->_drawables;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)drawables setObject:v6 forKeyedSubscript:v7];
}

- (void)setDevice:(id)a3 forKey:(unint64_t)a4
{
  devices = self->_devices;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)devices setObject:v6 forKeyedSubscript:v7];
}

- (void)setDepthStencilState:(id)a3 forKey:(unint64_t)a4
{
  depthStencilStates = self->_depthStencilStates;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)depthStencilStates setObject:v6 forKeyedSubscript:v7];
}

- (void)setDebugCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setCounterSampleBuffer:(id)a3 forKey:(unint64_t)a4
{
  counterSampleBuffers = self->_counterSampleBuffers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)counterSampleBuffers setObject:v6 forKeyedSubscript:v7];
}

- (void)setComputePipelineState:(id)a3 forKey:(unint64_t)a4
{
  computePipelineStates = self->_computePipelineStates;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)computePipelineStates setObject:v6 forKeyedSubscript:v7];
}

- (void)setComputeCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setIOScratchBufferAllocator:(id)a3 forKey:(unint64_t)a4
{
  ioScratchBufferAllocators = self->_ioScratchBufferAllocators;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)ioScratchBufferAllocators setObject:v6 forKeyedSubscript:v7];
}

- (void)setIOScratchBuffer:(id)a3 forKey:(unint64_t)a4
{
  ioScratchBuffers = self->_ioScratchBuffers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)ioScratchBuffers setObject:v6 forKeyedSubscript:v7];
}

- (void)setIOCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  ioCommandBuffers = self->_ioCommandBuffers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)ioCommandBuffers setObject:v6 forKeyedSubscript:v7];
}

- (void)setIOCommandQueue:(id)a3 forKey:(unint64_t)a4
{
  ioCommandQueues = self->_ioCommandQueues;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)ioCommandQueues setObject:v6 forKeyedSubscript:v7];
}

- (void)setCommandQueue:(id)a3 forKey:(unint64_t)a4
{
  commandQueues = self->_commandQueues;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandQueues setObject:v6 forKeyedSubscript:v7];
}

- (void)setCommandBuffer:(id)a3 forKey:(unint64_t)a4
{
  commandBuffers = self->_commandBuffers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandBuffers setObject:v6 forKeyedSubscript:v7];
}

- (void)setBuffer:(id)a3 forHeapKey:(unint64_t)a4
{
  bufferForHeap = self->_bufferForHeap;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)bufferForHeap setObject:v6 forKeyedSubscript:v7];
}

- (void)setBuffer:(id)a3 forKey:(unint64_t)a4
{
  resources = self->_resources;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)resources setObject:v6 forKeyedSubscript:v7];
}

- (void)setBlitCommandEncoder:(id)a3 forKey:(unint64_t)a4
{
  commandEncoders = self->_commandEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)commandEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setArgumentEncoder:(id)a3 forKey:(unint64_t)a4
{
  argumentEncoders = self->_argumentEncoders;
  id v6 = a3;
  id v7 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(NSMutableDictionary *)argumentEncoders setObject:v6 forKeyedSubscript:v7];
}

- (void)setLayerClass:(Class)a3
{
  if (self->_layerClass != a3)
  {
    id v5 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:-[NSMutableDictionary count](self->_layers, "count")];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obj = self->_layers;
    id v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v26;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v11 = [(NSMutableDictionary *)self->_layers objectForKeyedSubscript:v10];
          id v12 = objc_alloc_init(a3);
          v13 = [v11 device];
          [v12 setDevice:v13];

          [v12 setColorspace:[v11 colorspace]];
          objc_msgSend(v12, "setPixelFormat:", objc_msgSend(v11, "pixelFormat"));
          [v12 setFramebufferOnly:[v11 framebufferOnly]];
          [v11 drawableSize];
          [v12 setDrawableSize:];
          [v11 bounds];
          [v12 setBounds:];
          [v11 contentsScale];
          [v12 setContentsScale:];
          if (v11)
          {
            [v11 transform];
          }
          else
          {
            long long v23 = 0u;
            long long v24 = 0u;
            long long v21 = 0u;
            long long v22 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            long long v17 = 0u;
            long long v18 = 0u;
          }
          v16[4] = v21;
          v16[5] = v22;
          v16[6] = v23;
          v16[7] = v24;
          v16[0] = v17;
          v16[1] = v18;
          v16[2] = v19;
          v16[3] = v20;
          [v12 setTransform:v16];
          [v11 anchorPoint];
          [v12 setAnchorPoint:];
          [(NSMutableDictionary *)v5 setObject:v12 forKeyedSubscript:v10];
        }
        id v7 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v7);
    }

    layers = self->_layers;
    self->_layers = v5;

    self->_layerClass = a3;
  }
}

- (Class)layerClass
{
  return self->_layerClass;
}

- (void)removeResourcesForKeys:(id)a3
{
  id v4 = a3;
  id v6 = +[NSNull null];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = -[NSMutableDictionary objectsForKeys:notFoundMarker:](self->_resources, "objectsForKeys:notFoundMarker:", v4, v6, 0);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (v12 != v6) {
          MakeRootResourceAliasable(v12);
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [(NSMutableDictionary *)self->_argumentEncoders removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_commandQueues removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_ioCommandQueues removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_computePipelineStates removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_counterSampleBuffers removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_depthStencilStates removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_drawables removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_events removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_fences removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_functions removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_heaps removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_indirectComputeCommands removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_indirectRenderCommands removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_iosurfaces removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_layers removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_libraries removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_dynamicLibraries removeObjectForKey:v4];
  [(NSMutableDictionary *)self->_motionEstimationPipelines removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_objectPayloadBinding removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_pipelineLibraries removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_rasterizationRateMaps removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_renderPipelineStates removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_residencySets removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_resourceGroups removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_resources removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_samplerStates removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_functionHandles removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_functionPointerHandles removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_functionPrivateArguments removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_deadlineProfiles removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_spatialScalers removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_temporalScalers removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_logStates removeObjectsForKeys:v4];
  [(NSMutableDictionary *)self->_mpsExternalPluginBases removeObjectsForKeys:v4];
}

- (void)addEntriesFromObjectMap:(id)a3
{
  argumentEncoders = self->_argumentEncoders;
  uint64_t v5 = *((void *)a3 + 1);
  id v6 = a3;
  [(NSMutableDictionary *)argumentEncoders addEntriesFromDictionary:v5];
  [(NSMutableDictionary *)self->_commandBuffers addEntriesFromDictionary:v6[2]];
  [(NSMutableDictionary *)self->_commandEncoders addEntriesFromDictionary:v6[3]];
  [(NSMutableDictionary *)self->_commandQueues addEntriesFromDictionary:v6[4]];
  [(NSMutableDictionary *)self->_ioCommandQueues addEntriesFromDictionary:v6[9]];
  [(NSMutableDictionary *)self->_ioCommandBuffers addEntriesFromDictionary:v6[5]];
  [(NSMutableDictionary *)self->_ioScratchBuffers addEntriesFromDictionary:v6[7]];
  [(NSMutableDictionary *)self->_ioScratchBufferAllocators addEntriesFromDictionary:v6[8]];
  [(NSMutableDictionary *)self->_ioHandles addEntriesFromDictionary:v6[6]];
  [(NSMutableDictionary *)self->_computePipelineStates addEntriesFromDictionary:v6[10]];
  [(NSMutableDictionary *)self->_counterSampleBuffers addEntriesFromDictionary:v6[11]];
  [(NSMutableDictionary *)self->_depthStencilStates addEntriesFromDictionary:v6[12]];
  [(NSMutableDictionary *)self->_devices addEntriesFromDictionary:v6[13]];
  [(NSMutableDictionary *)self->_drawables addEntriesFromDictionary:v6[14]];
  [(NSMutableDictionary *)self->_events addEntriesFromDictionary:v6[15]];
  [(NSMutableDictionary *)self->_fences addEntriesFromDictionary:v6[16]];
  [(NSMutableDictionary *)self->_functions addEntriesFromDictionary:v6[17]];
  [(NSMutableDictionary *)self->_heaps addEntriesFromDictionary:v6[18]];
  [(NSMutableDictionary *)self->_indirectComputeCommands addEntriesFromDictionary:v6[19]];
  [(NSMutableDictionary *)self->_indirectRenderCommands addEntriesFromDictionary:v6[20]];
  [(NSMutableDictionary *)self->_iosurfaces addEntriesFromDictionary:v6[21]];
  [(NSMutableDictionary *)self->_layers addEntriesFromDictionary:v6[22]];
  [(NSMutableDictionary *)self->_libraries addEntriesFromDictionary:v6[23]];
  [(NSMutableDictionary *)self->_dynamicLibraries addEntriesFromDictionary:v6[24]];
  [(NSMutableDictionary *)self->_motionEstimationPipelines addEntriesFromDictionary:v6[25]];
  [(NSMutableDictionary *)self->_parallelRenderCommandEncoders addEntriesFromDictionary:v6[26]];
  [(NSMutableDictionary *)self->_objectPayloadBinding addEntriesFromDictionary:v6[27]];
  [(NSMutableDictionary *)self->_pipelineLibraries addEntriesFromDictionary:v6[28]];
  [(NSMutableDictionary *)self->_rasterizationRateMaps addEntriesFromDictionary:v6[29]];
  [(NSMutableDictionary *)self->_renderPipelineStates addEntriesFromDictionary:v6[30]];
  [(NSMutableDictionary *)self->_residencySets addEntriesFromDictionary:v6[31]];
  [(NSMutableDictionary *)self->_resourceGroups addEntriesFromDictionary:v6[33]];
  [(NSMutableDictionary *)self->_resources addEntriesFromDictionary:v6[33]];
  [(NSMutableDictionary *)self->_samplerStates addEntriesFromDictionary:v6[35]];
  [(NSMutableDictionary *)self->_sharedEventHandles addEntriesFromDictionary:v6[36]];
  [(NSMutableDictionary *)self->_functionHandles addEntriesFromDictionary:v6[37]];
  [(NSMutableDictionary *)self->_functionPointerHandles addEntriesFromDictionary:v6[39]];
  [(NSMutableDictionary *)self->_functionPrivateArguments addEntriesFromDictionary:v6[40]];
  [(NSMutableDictionary *)self->_deadlineProfiles addEntriesFromDictionary:v6[42]];
  [(NSMutableDictionary *)self->_mpsExternalPluginBases addEntriesFromDictionary:v6[41]];
  [(NSMutableDictionary *)self->_spatialScalers addEntriesFromDictionary:v6[43]];
  [(NSMutableDictionary *)self->_temporalScalers addEntriesFromDictionary:v6[44]];
  [(NSMutableDictionary *)self->_logStates addEntriesFromDictionary:v6[45]];
  unusedResources = self->_unusedResources;
  uint64_t v8 = v6[46];

  [(NSMutableSet *)unusedResources unionSet:v8];
}

- (GTMTLReplayObjectMap)initWithObjectMap:(id)a3
{
  id v4 = a3;
  v137.receiver = self;
  v137.super_class = (Class)GTMTLReplayObjectMap;
  uint64_t v5 = [(GTMTLReplayObjectMap *)&v137 init];

  if (v5)
  {
    objc_storeStrong((id *)&v5->_defaultDevice, *((id *)v4 + 58));
    objc_storeStrong((id *)&v5->_defaultCommandQueue, *((id *)v4 + 59));
    if ([*((id *)v4 + 1) count])
    {
      id v6 = [*((id *)v4 + 1) allKeys];
      argumentEncoders = +[NSDictionary sharedKeySetForKeys:v6];
      uint64_t v8 = +[NSMutableDictionary dictionaryWithSharedKeySet:argumentEncoders];
      objc_storeStrong((id *)&v5->_argumentEncoders, v8);
    }
    else
    {
      id v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      argumentEncoders = v5->_argumentEncoders;
      v5->_argumentEncoders = v6;
    }

    if ([*((id *)v4 + 2) count])
    {
      id v9 = [*((id *)v4 + 2) allKeys];
      commandBuffers = +[NSDictionary sharedKeySetForKeys:v9];
      id v11 = +[NSMutableDictionary dictionaryWithSharedKeySet:commandBuffers];
      objc_storeStrong((id *)&v5->_commandBuffers, v11);
    }
    else
    {
      id v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      commandBuffers = v5->_commandBuffers;
      v5->_commandBuffers = v9;
    }

    if ([*((id *)v4 + 3) count])
    {
      id v12 = [*((id *)v4 + 3) allKeys];
      commandEncoders = +[NSDictionary sharedKeySetForKeys:v12];
      long long v14 = +[NSMutableDictionary dictionaryWithSharedKeySet:commandEncoders];
      objc_storeStrong((id *)&v5->_commandEncoders, v14);
    }
    else
    {
      id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      commandEncoders = v5->_commandEncoders;
      v5->_commandEncoders = v12;
    }

    if ([*((id *)v4 + 4) count])
    {
      long long v15 = [*((id *)v4 + 4) allKeys];
      commandQueues = +[NSDictionary sharedKeySetForKeys:v15];
      long long v17 = +[NSMutableDictionary dictionaryWithSharedKeySet:commandQueues];
      objc_storeStrong((id *)&v5->_commandQueues, v17);
    }
    else
    {
      long long v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      commandQueues = v5->_commandQueues;
      v5->_commandQueues = v15;
    }

    if ([*((id *)v4 + 5) count])
    {
      long long v18 = [*((id *)v4 + 5) allKeys];
      ioCommandBuffers = +[NSDictionary sharedKeySetForKeys:v18];
      long long v20 = +[NSMutableDictionary dictionaryWithSharedKeySet:ioCommandBuffers];
      objc_storeStrong((id *)&v5->_ioCommandBuffers, v20);
    }
    else
    {
      long long v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioCommandBuffers = v5->_ioCommandBuffers;
      v5->_ioCommandBuffers = v18;
    }

    if ([*((id *)v4 + 7) count])
    {
      long long v21 = [*((id *)v4 + 7) allKeys];
      ioScratchBuffers = +[NSDictionary sharedKeySetForKeys:v21];
      long long v23 = +[NSMutableDictionary dictionaryWithSharedKeySet:ioScratchBuffers];
      objc_storeStrong((id *)&v5->_ioScratchBuffers, v23);
    }
    else
    {
      long long v21 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioScratchBuffers = v5->_ioScratchBuffers;
      v5->_ioScratchBuffers = v21;
    }

    if ([*((id *)v4 + 8) count])
    {
      long long v24 = [*((id *)v4 + 8) allKeys];
      ioScratchBufferAllocators = +[NSDictionary sharedKeySetForKeys:v24];
      long long v26 = +[NSMutableDictionary dictionaryWithSharedKeySet:ioScratchBufferAllocators];
      objc_storeStrong((id *)&v5->_ioScratchBufferAllocators, v26);
    }
    else
    {
      long long v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioScratchBufferAllocators = v5->_ioScratchBufferAllocators;
      v5->_ioScratchBufferAllocators = v24;
    }

    if ([*((id *)v4 + 6) count])
    {
      long long v27 = [*((id *)v4 + 6) allKeys];
      ioHandles = +[NSDictionary sharedKeySetForKeys:v27];
      long long v29 = +[NSMutableDictionary dictionaryWithSharedKeySet:ioHandles];
      objc_storeStrong((id *)&v5->_ioHandles, v29);
    }
    else
    {
      long long v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioHandles = v5->_ioHandles;
      v5->_ioHandles = v27;
    }

    if ([*((id *)v4 + 9) count])
    {
      long long v30 = [*((id *)v4 + 9) allKeys];
      ioCommandQueues = +[NSDictionary sharedKeySetForKeys:v30];
      long long v32 = +[NSMutableDictionary dictionaryWithSharedKeySet:ioCommandQueues];
      objc_storeStrong((id *)&v5->_ioCommandQueues, v32);
    }
    else
    {
      long long v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      ioCommandQueues = v5->_ioCommandQueues;
      v5->_ioCommandQueues = v30;
    }

    if ([*((id *)v4 + 10) count])
    {
      long long v33 = [*((id *)v4 + 10) allKeys];
      computePipelineStates = +[NSDictionary sharedKeySetForKeys:v33];
      v35 = +[NSMutableDictionary dictionaryWithSharedKeySet:computePipelineStates];
      objc_storeStrong((id *)&v5->_computePipelineStates, v35);
    }
    else
    {
      long long v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      computePipelineStates = v5->_computePipelineStates;
      v5->_computePipelineStates = v33;
    }

    if ([*((id *)v4 + 11) count])
    {
      v36 = [*((id *)v4 + 11) allKeys];
      counterSampleBuffers = +[NSDictionary sharedKeySetForKeys:v36];
      v38 = +[NSMutableDictionary dictionaryWithSharedKeySet:counterSampleBuffers];
      objc_storeStrong((id *)&v5->_counterSampleBuffers, v38);
    }
    else
    {
      v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      counterSampleBuffers = v5->_counterSampleBuffers;
      v5->_counterSampleBuffers = v36;
    }

    if ([*((id *)v4 + 12) count])
    {
      v39 = [*((id *)v4 + 12) allKeys];
      depthStencilStates = +[NSDictionary sharedKeySetForKeys:v39];
      v41 = +[NSMutableDictionary dictionaryWithSharedKeySet:depthStencilStates];
      objc_storeStrong((id *)&v5->_depthStencilStates, v41);
    }
    else
    {
      v39 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      depthStencilStates = v5->_depthStencilStates;
      v5->_depthStencilStates = v39;
    }

    if ([*((id *)v4 + 13) count])
    {
      v42 = [*((id *)v4 + 13) allKeys];
      devices = +[NSDictionary sharedKeySetForKeys:v42];
      v44 = +[NSMutableDictionary dictionaryWithSharedKeySet:devices];
      objc_storeStrong((id *)&v5->_devices, v44);
    }
    else
    {
      v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      devices = v5->_devices;
      v5->_devices = v42;
    }

    if ([*((id *)v4 + 14) count])
    {
      v45 = [*((id *)v4 + 14) allKeys];
      drawables = +[NSDictionary sharedKeySetForKeys:v45];
      v47 = +[NSMutableDictionary dictionaryWithSharedKeySet:drawables];
      objc_storeStrong((id *)&v5->_drawables, v47);
    }
    else
    {
      v45 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      drawables = v5->_drawables;
      v5->_drawables = v45;
    }

    if ([*((id *)v4 + 15) count])
    {
      v48 = [*((id *)v4 + 15) allKeys];
      events = +[NSDictionary sharedKeySetForKeys:v48];
      v50 = +[NSMutableDictionary dictionaryWithSharedKeySet:events];
      objc_storeStrong((id *)&v5->_events, v50);
    }
    else
    {
      v48 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      events = v5->_events;
      v5->_events = v48;
    }

    if ([*((id *)v4 + 16) count])
    {
      v51 = [*((id *)v4 + 16) allKeys];
      fences = +[NSDictionary sharedKeySetForKeys:v51];
      v53 = +[NSMutableDictionary dictionaryWithSharedKeySet:fences];
      objc_storeStrong((id *)&v5->_fences, v53);
    }
    else
    {
      v51 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      fences = v5->_fences;
      v5->_fences = v51;
    }

    if ([*((id *)v4 + 17) count])
    {
      v54 = [*((id *)v4 + 17) allKeys];
      functions = +[NSDictionary sharedKeySetForKeys:v54];
      v56 = +[NSMutableDictionary dictionaryWithSharedKeySet:functions];
      objc_storeStrong((id *)&v5->_functions, v56);
    }
    else
    {
      v54 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functions = v5->_functions;
      v5->_functions = v54;
    }

    if ([*((id *)v4 + 18) count])
    {
      v57 = [*((id *)v4 + 18) allKeys];
      heaps = +[NSDictionary sharedKeySetForKeys:v57];
      v59 = +[NSMutableDictionary dictionaryWithSharedKeySet:heaps];
      objc_storeStrong((id *)&v5->_heaps, v59);
    }
    else
    {
      v57 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      heaps = v5->_heaps;
      v5->_heaps = v57;
    }

    if ([*((id *)v4 + 19) count])
    {
      v60 = [*((id *)v4 + 19) allKeys];
      indirectComputeCommands = +[NSDictionary sharedKeySetForKeys:v60];
      v62 = +[NSMutableDictionary dictionaryWithSharedKeySet:indirectComputeCommands];
      objc_storeStrong((id *)&v5->_indirectComputeCommands, v62);
    }
    else
    {
      v60 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      indirectComputeCommands = v5->_indirectComputeCommands;
      v5->_indirectComputeCommands = v60;
    }

    if ([*((id *)v4 + 20) count])
    {
      v63 = [*((id *)v4 + 20) allKeys];
      indirectRenderCommands = +[NSDictionary sharedKeySetForKeys:v63];
      v65 = +[NSMutableDictionary dictionaryWithSharedKeySet:indirectRenderCommands];
      objc_storeStrong((id *)&v5->_indirectRenderCommands, v65);
    }
    else
    {
      v63 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      indirectRenderCommands = v5->_indirectRenderCommands;
      v5->_indirectRenderCommands = v63;
    }

    if ([*((id *)v4 + 21) count])
    {
      v66 = [*((id *)v4 + 21) allKeys];
      iosurfaces = +[NSDictionary sharedKeySetForKeys:v66];
      v68 = +[NSMutableDictionary dictionaryWithSharedKeySet:iosurfaces];
      objc_storeStrong((id *)&v5->_iosurfaces, v68);
    }
    else
    {
      v66 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      iosurfaces = v5->_iosurfaces;
      v5->_iosurfaces = v66;
    }

    if ([*((id *)v4 + 22) count])
    {
      v69 = [*((id *)v4 + 22) allKeys];
      layers = +[NSDictionary sharedKeySetForKeys:v69];
      v71 = +[NSMutableDictionary dictionaryWithSharedKeySet:layers];
      objc_storeStrong((id *)&v5->_layers, v71);
    }
    else
    {
      v69 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      layers = v5->_layers;
      v5->_layers = v69;
    }

    if ([*((id *)v4 + 23) count])
    {
      v72 = [*((id *)v4 + 23) allKeys];
      libraries = +[NSDictionary sharedKeySetForKeys:v72];
      v74 = +[NSMutableDictionary dictionaryWithSharedKeySet:libraries];
      objc_storeStrong((id *)&v5->_libraries, v74);
    }
    else
    {
      v72 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      libraries = v5->_libraries;
      v5->_libraries = v72;
    }

    if ([*((id *)v4 + 24) count])
    {
      v75 = [*((id *)v4 + 24) allKeys];
      dynamicLibraries = +[NSDictionary sharedKeySetForKeys:v75];
      v77 = +[NSMutableDictionary dictionaryWithSharedKeySet:dynamicLibraries];
      objc_storeStrong((id *)&v5->_dynamicLibraries, v77);
    }
    else
    {
      v75 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      dynamicLibraries = v5->_dynamicLibraries;
      v5->_dynamicLibraries = v75;
    }

    if ([*((id *)v4 + 25) count])
    {
      v78 = [*((id *)v4 + 25) allKeys];
      motionEstimationPipelines = +[NSDictionary sharedKeySetForKeys:v78];
      v80 = +[NSMutableDictionary dictionaryWithSharedKeySet:motionEstimationPipelines];
      objc_storeStrong((id *)&v5->_motionEstimationPipelines, v80);
    }
    else
    {
      v78 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      motionEstimationPipelines = v5->_motionEstimationPipelines;
      v5->_motionEstimationPipelines = v78;
    }

    if ([*((id *)v4 + 26) count])
    {
      v81 = [*((id *)v4 + 26) allKeys];
      parallelRenderCommandEncoders = +[NSDictionary sharedKeySetForKeys:v81];
      v83 = +[NSMutableDictionary dictionaryWithSharedKeySet:parallelRenderCommandEncoders];
      objc_storeStrong((id *)&v5->_parallelRenderCommandEncoders, v83);
    }
    else
    {
      v81 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      parallelRenderCommandEncoders = v5->_parallelRenderCommandEncoders;
      v5->_parallelRenderCommandEncoders = v81;
    }

    if ([*((id *)v4 + 27) count])
    {
      v84 = [*((id *)v4 + 27) allKeys];
      objectPayloadBinding = +[NSDictionary sharedKeySetForKeys:v84];
      v86 = +[NSMutableDictionary dictionaryWithSharedKeySet:objectPayloadBinding];
      objc_storeStrong((id *)&v5->_objectPayloadBinding, v86);
    }
    else
    {
      v84 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      objectPayloadBinding = v5->_objectPayloadBinding;
      v5->_objectPayloadBinding = v84;
    }

    if ([*((id *)v4 + 28) count])
    {
      v87 = [*((id *)v4 + 28) allKeys];
      pipelineLibraries = +[NSDictionary sharedKeySetForKeys:v87];
      v89 = +[NSMutableDictionary dictionaryWithSharedKeySet:pipelineLibraries];
      objc_storeStrong((id *)&v5->_pipelineLibraries, v89);
    }
    else
    {
      v87 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      pipelineLibraries = v5->_pipelineLibraries;
      v5->_pipelineLibraries = v87;
    }

    if ([*((id *)v4 + 29) count])
    {
      v90 = [*((id *)v4 + 29) allKeys];
      rasterizationRateMaps = +[NSDictionary sharedKeySetForKeys:v90];
      v92 = +[NSMutableDictionary dictionaryWithSharedKeySet:rasterizationRateMaps];
      objc_storeStrong((id *)&v5->_rasterizationRateMaps, v92);
    }
    else
    {
      v90 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      rasterizationRateMaps = v5->_rasterizationRateMaps;
      v5->_rasterizationRateMaps = v90;
    }

    if ([*((id *)v4 + 30) count])
    {
      v93 = [*((id *)v4 + 30) allKeys];
      renderPipelineStates = +[NSDictionary sharedKeySetForKeys:v93];
      v95 = +[NSMutableDictionary dictionaryWithSharedKeySet:renderPipelineStates];
      objc_storeStrong((id *)&v5->_renderPipelineStates, v95);
    }
    else
    {
      v93 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      renderPipelineStates = v5->_renderPipelineStates;
      v5->_renderPipelineStates = v93;
    }

    if ([*((id *)v4 + 31) count])
    {
      v96 = [*((id *)v4 + 31) allKeys];
      residencySets = +[NSDictionary sharedKeySetForKeys:v96];
      v98 = +[NSMutableDictionary dictionaryWithSharedKeySet:residencySets];
      objc_storeStrong((id *)&v5->_residencySets, v98);
    }
    else
    {
      v96 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      residencySets = v5->_residencySets;
      v5->_residencySets = v96;
    }

    if ([*((id *)v4 + 32) count])
    {
      v99 = [*((id *)v4 + 32) allKeys];
      resourceGroups = +[NSDictionary sharedKeySetForKeys:v99];
      v101 = +[NSMutableDictionary dictionaryWithSharedKeySet:resourceGroups];
      objc_storeStrong((id *)&v5->_resourceGroups, v101);
    }
    else
    {
      v99 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      resourceGroups = v5->_resourceGroups;
      v5->_resourceGroups = v99;
    }

    if ([*((id *)v4 + 33) count])
    {
      v102 = [*((id *)v4 + 33) allKeys];
      resources = +[NSDictionary sharedKeySetForKeys:v102];
      v104 = +[NSMutableDictionary dictionaryWithSharedKeySet:resources];
      objc_storeStrong((id *)&v5->_resources, v104);
    }
    else
    {
      v102 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      resources = v5->_resources;
      v5->_resources = v102;
    }

    if ([*((id *)v4 + 35) count])
    {
      v105 = [*((id *)v4 + 35) allKeys];
      samplerStates = +[NSDictionary sharedKeySetForKeys:v105];
      v107 = +[NSMutableDictionary dictionaryWithSharedKeySet:samplerStates];
      objc_storeStrong((id *)&v5->_samplerStates, v107);
    }
    else
    {
      v105 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      samplerStates = v5->_samplerStates;
      v5->_samplerStates = v105;
    }

    if ([*((id *)v4 + 36) count])
    {
      v108 = [*((id *)v4 + 36) allKeys];
      sharedEventHandles = +[NSDictionary sharedKeySetForKeys:v108];
      v110 = +[NSMutableDictionary dictionaryWithSharedKeySet:sharedEventHandles];
      objc_storeStrong((id *)&v5->_sharedEventHandles, v110);
    }
    else
    {
      v108 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      sharedEventHandles = v5->_sharedEventHandles;
      v5->_sharedEventHandles = v108;
    }

    if ([*((id *)v4 + 37) count])
    {
      v111 = [*((id *)v4 + 37) allKeys];
      functionHandles = +[NSDictionary sharedKeySetForKeys:v111];
      v113 = +[NSMutableDictionary dictionaryWithSharedKeySet:functionHandles];
      objc_storeStrong((id *)&v5->_functionHandles, v113);
    }
    else
    {
      v111 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functionHandles = v5->_functionHandles;
      v5->_functionHandles = v111;
    }

    if ([*((id *)v4 + 39) count])
    {
      v114 = [*((id *)v4 + 39) allKeys];
      functionPointerHandles = +[NSDictionary sharedKeySetForKeys:v114];
      v116 = +[NSMutableDictionary dictionaryWithSharedKeySet:functionPointerHandles];
      objc_storeStrong((id *)&v5->_functionPointerHandles, v116);
    }
    else
    {
      v114 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functionPointerHandles = v5->_functionPointerHandles;
      v5->_functionPointerHandles = v114;
    }

    if ([*((id *)v4 + 40) count])
    {
      v117 = [*((id *)v4 + 40) allKeys];
      functionPrivateArguments = +[NSDictionary sharedKeySetForKeys:v117];
      v119 = +[NSMutableDictionary dictionaryWithSharedKeySet:functionPrivateArguments];
      objc_storeStrong((id *)&v5->_functionPrivateArguments, v119);
    }
    else
    {
      v117 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      functionPrivateArguments = v5->_functionPrivateArguments;
      v5->_functionPrivateArguments = v117;
    }

    if ([*((id *)v4 + 41) count])
    {
      v120 = [*((id *)v4 + 41) allKeys];
      mpsExternalPluginBases = +[NSDictionary sharedKeySetForKeys:v120];
      v122 = +[NSMutableDictionary dictionaryWithSharedKeySet:mpsExternalPluginBases];
      objc_storeStrong((id *)&v5->_mpsExternalPluginBases, v122);
    }
    else
    {
      v120 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      mpsExternalPluginBases = v5->_mpsExternalPluginBases;
      v5->_mpsExternalPluginBases = v120;
    }

    if ([*((id *)v4 + 42) count])
    {
      v123 = [*((id *)v4 + 42) allKeys];
      deadlineProfiles = +[NSDictionary sharedKeySetForKeys:v123];
      v125 = +[NSMutableDictionary dictionaryWithSharedKeySet:deadlineProfiles];
      objc_storeStrong((id *)&v5->_deadlineProfiles, v125);
    }
    else
    {
      v123 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      deadlineProfiles = v5->_deadlineProfiles;
      v5->_deadlineProfiles = v123;
    }

    if ([*((id *)v4 + 43) count])
    {
      v126 = [*((id *)v4 + 43) allKeys];
      spatialScalers = +[NSDictionary sharedKeySetForKeys:v126];
      v128 = +[NSMutableDictionary dictionaryWithSharedKeySet:spatialScalers];
      objc_storeStrong((id *)&v5->_spatialScalers, v128);
    }
    else
    {
      v126 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      spatialScalers = v5->_spatialScalers;
      v5->_spatialScalers = v126;
    }

    if ([*((id *)v4 + 44) count])
    {
      v129 = [*((id *)v4 + 44) allKeys];
      temporalScalers = +[NSDictionary sharedKeySetForKeys:v129];
      v131 = +[NSMutableDictionary dictionaryWithSharedKeySet:temporalScalers];
      objc_storeStrong((id *)&v5->_temporalScalers, v131);
    }
    else
    {
      v129 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      temporalScalers = v5->_temporalScalers;
      v5->_temporalScalers = v129;
    }

    if ([*((id *)v4 + 45) count])
    {
      v132 = [*((id *)v4 + 45) allKeys];
      logStates = +[NSDictionary sharedKeySetForKeys:v132];
      v134 = +[NSMutableDictionary dictionaryWithSharedKeySet:logStates];
      objc_storeStrong((id *)&v5->_logStates, v134);
    }
    else
    {
      v132 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      logStates = v5->_logStates;
      v5->_logStates = v132;
    }

    v5->_layerClass = (Class)*((void *)v4 + 47);
    [(GTMTLReplayObjectMap *)v5 addEntriesFromObjectMap:v4];
  }
  v135 = v5;

  return v135;
}

- (GTMTLReplayObjectMap)initWithDevice:(id)a3
{
  id v5 = a3;
  v99.receiver = self;
  v99.super_class = (Class)GTMTLReplayObjectMap;
  id v6 = [(GTMTLReplayObjectMap *)&v99 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_defaultDevice, a3);
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    argumentEncoders = v7->_argumentEncoders;
    v7->_argumentEncoders = v8;

    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandBuffers = v7->_commandBuffers;
    v7->_commandBuffers = v10;

    id v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandEncoders = v7->_commandEncoders;
    v7->_commandEncoders = v12;

    long long v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioCommandQueues = v7->_ioCommandQueues;
    v7->_ioCommandQueues = v14;

    long long v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioCommandBuffers = v7->_ioCommandBuffers;
    v7->_ioCommandBuffers = v16;

    long long v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioHandles = v7->_ioHandles;
    v7->_ioHandles = v18;

    long long v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioScratchBuffers = v7->_ioScratchBuffers;
    v7->_ioScratchBuffers = v20;

    long long v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    ioScratchBufferAllocators = v7->_ioScratchBufferAllocators;
    v7->_ioScratchBufferAllocators = v22;

    long long v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    commandQueues = v7->_commandQueues;
    v7->_commandQueues = v24;

    long long v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    computePipelineStates = v7->_computePipelineStates;
    v7->_computePipelineStates = v26;

    long long v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    counterSampleBuffers = v7->_counterSampleBuffers;
    v7->_counterSampleBuffers = v28;

    long long v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    depthStencilStates = v7->_depthStencilStates;
    v7->_depthStencilStates = v30;

    long long v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    devices = v7->_devices;
    v7->_devices = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    drawables = v7->_drawables;
    v7->_drawables = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    events = v7->_events;
    v7->_events = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fences = v7->_fences;
    v7->_fences = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functions = v7->_functions;
    v7->_functions = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    heaps = v7->_heaps;
    v7->_heaps = v42;

    v44 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    indirectComputeCommands = v7->_indirectComputeCommands;
    v7->_indirectComputeCommands = v44;

    v46 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    indirectRenderCommands = v7->_indirectRenderCommands;
    v7->_indirectRenderCommands = v46;

    v48 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    iosurfaces = v7->_iosurfaces;
    v7->_iosurfaces = v48;

    v50 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    layers = v7->_layers;
    v7->_layers = v50;

    v52 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    libraries = v7->_libraries;
    v7->_libraries = v52;

    v54 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    dynamicLibraries = v7->_dynamicLibraries;
    v7->_dynamicLibraries = v54;

    v56 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    motionEstimationPipelines = v7->_motionEstimationPipelines;
    v7->_motionEstimationPipelines = v56;

    v58 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    parallelRenderCommandEncoders = v7->_parallelRenderCommandEncoders;
    v7->_parallelRenderCommandEncoders = v58;

    v60 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objectPayloadBinding = v7->_objectPayloadBinding;
    v7->_objectPayloadBinding = v60;

    v62 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pipelineLibraries = v7->_pipelineLibraries;
    v7->_pipelineLibraries = v62;

    v64 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    rasterizationRateMaps = v7->_rasterizationRateMaps;
    v7->_rasterizationRateMaps = v64;

    v66 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    renderPipelineStates = v7->_renderPipelineStates;
    v7->_renderPipelineStates = v66;

    v68 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    residencySets = v7->_residencySets;
    v7->_residencySets = v68;

    v70 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resourceGroups = v7->_resourceGroups;
    v7->_resourceGroups = v70;

    v72 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    resources = v7->_resources;
    v7->_resources = v72;

    v74 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    samplerStates = v7->_samplerStates;
    v7->_samplerStates = v74;

    v76 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    sharedEventHandles = v7->_sharedEventHandles;
    v7->_sharedEventHandles = v76;

    v78 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functionHandles = v7->_functionHandles;
    v7->_functionHandles = v78;

    v80 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functionPointerHandles = v7->_functionPointerHandles;
    v7->_functionPointerHandles = v80;

    v82 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    functionPrivateArguments = v7->_functionPrivateArguments;
    v7->_functionPrivateArguments = v82;

    v84 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    deadlineProfiles = v7->_deadlineProfiles;
    v7->_deadlineProfiles = v84;

    v86 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    spatialScalers = v7->_spatialScalers;
    v7->_spatialScalers = v86;

    v88 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    temporalScalers = v7->_temporalScalers;
    v7->_temporalScalers = v88;

    v90 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    logStates = v7->_logStates;
    v7->_logStates = v90;

    v92 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mpsExternalPluginBases = v7->_mpsExternalPluginBases;
    v7->_mpsExternalPluginBases = v92;

    v7->_layerClass = (Class)objc_opt_class();
    v94 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    unusedResources = v7->_unusedResources;
    v7->_unusedResources = v94;

    v96 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    bufferForHeap = v7->_bufferForHeap;
    v7->_bufferForHeap = v96;
  }
  return v7;
}

@end