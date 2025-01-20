@interface ARSceneReconstructionHandler
- (ARSceneReconstructionDelegate)delegate;
- (ARSceneReconstructionHandler)initWithSceneReconstruction:(unint64_t)a3 options:(id)a4 slamSessionHandle:(CV3DSLAMSession *)a5;
- (ARSceneReconstructionOptions)options;
- (BOOL)_canReconfigureExistingSessionForSceneReconstruction:(unint64_t)a3 options:(id)a4;
- (BOOL)_configureMeshingConfiguration:(CV3DReconMeshingConfiguration *)a3 error:(id *)a4;
- (BOOL)_lockAndExecuteBlock:(id)a3;
- (BOOL)_lockAndExecuteCFErrorBlockWithErrorMessage:(id)a3 cfErrorBlock:(id)a4;
- (BOOL)_lockAndExecuteCFErrorBlockWithErrorMessage:(id)a3 cfErrorBlock:(id)a4 failSession:(BOOL)a5;
- (BOOL)_lockAndExecuteNSErrorBlock:(id)a3;
- (BOOL)_reconfigureSession:(CV3DReconSession *)a3 error:(id *)a4;
- (BOOL)_recreateReconstructionSessionWithError:(id *)a3;
- (BOOL)queryOccupancyWithPoints:(id)a3 callback:(id)a4;
- (__CVBuffer)postProcessConfidenceBuffer:(__CVBuffer *)a3 fromSegmentationData:(id)a4;
- (id).cxx_construct;
- (int64_t)_reconfigureSessionAndHandleError;
- (int64_t)_recreateSessionAndHandleError;
- (int64_t)reconfigureSceneReconstruction:(unint64_t)a3 options:(id)a4;
- (uint64_t)bufferSlamState:;
- (uint64_t)bufferSlamState:(uint64_t)a1;
- (unint64_t)sceneReconstruction;
- (void)_didReceiveKeyframeListUpdateCallbackWithKeyframeList:(CV3DReconKeyframeList *)a3 timestamp:(double)a4 error:(__CFError *)a5;
- (void)_didReceiveMeshListUpdateCallbackWithMeshList:(CV3DReconMeshList *)a3 timestamp:(double)a4 error:(__CFError *)a5;
- (void)_setupSLAMStateBuffering;
- (void)bufferSlamState:(CV3DSLAMStateContext *)a3;
- (void)bufferSlamState:(std::__shared_weak_count *)a1;
- (void)dealloc;
- (void)failWithError:(id)a3;
- (void)handleCFError:(__CFError *)a3 withErrorMessage:(id)a4;
- (void)handleCFError:(__CFError *)a3 withErrorMessage:(id)a4 failSession:(BOOL)a5;
- (void)meshPlaneHarmonizationShouldEnable:(BOOL)a3;
- (void)pause;
- (void)processPlaneList:(CV3DPlaneDetectionPlaneList *)a3;
- (void)pushDepth:(id)a3 semanticSegmentation:(id)a4 personSegmentation:(id)a5 pose:(id)a6;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)start;
- (void)swapSlamStateBuffers;
@end

@implementation ARSceneReconstructionHandler

- (ARSceneReconstructionHandler)initWithSceneReconstruction:(unint64_t)a3 options:(id)a4 slamSessionHandle:(CV3DSLAMSession *)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ARSceneReconstructionHandler;
  v10 = [(ARSceneReconstructionHandler *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_sceneReconstruction = a3;
    objc_storeStrong((id *)&v10->_options, a4);
    v11->_slamSessionHandle = a5;
    CV3DSLAMSessionRetain();
    v11->_slamStateBufferBackLock._os_unfair_lock_opaque = 0;
    v11->_reconstructionSessionLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (void)bufferSlamState:(CV3DSLAMStateContext *)a3
{
  CV3DSLAMStateRetain();
  v4 = a3;
  operator new();
}

- (void)swapSlamStateBuffers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_slamStateBufferFront = (uint64_t *)&self->_slamStateBufferFront;
  if (self->_slamStateBufferFront.__begin_ != self->_slamStateBufferFront.__end_)
  {
    v4 = _ARLogTechnique();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v5);
      int v9 = 138543618;
      v10 = v6;
      __int16 v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unexpected non-empty slam state buffer; discarding...",
        (uint8_t *)&v9,
        0x16u);
    }
    std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::__clear[abi:ne180100](p_slamStateBufferFront);
  }
  os_unfair_lock_lock_with_options();
  long long v7 = *(_OWORD *)&self->_slamStateBufferFront.__begin_;
  *(_OWORD *)&self->_slamStateBufferFront.__begin_ = *(_OWORD *)&self->_slamStateBufferBack.__begin_;
  *(_OWORD *)&self->_slamStateBufferBack.__begin_ = v7;
  value = self->_slamStateBufferFront.__end_cap_.__value_;
  self->_slamStateBufferFront.__end_cap_.__value_ = self->_slamStateBufferBack.__end_cap_.__value_;
  self->_slamStateBufferBack.__end_cap_.__value_ = value;
  os_unfair_lock_unlock(&self->_slamStateBufferBackLock);
}

- (BOOL)_recreateReconstructionSessionWithError:(id *)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  CV3DReconSessionRelease();
  self->_reconstructionSession = 0;
  v75 = 0;
  unint64_t sceneReconstruction = self->_sceneReconstruction;
  if ((sceneReconstruction & 0x80) != 0)
  {
    uint64_t v6 = CV3DReconSessionConfigurationCreateWithPrivatePreset();
    if ((sceneReconstruction & 1 | ((sceneReconstruction & 8) != 0)) == 1) {
      -[ARSceneReconstructionHandler _recreateReconstructionSessionWithError:]();
    }
  }
  else
  {
    uint64_t v6 = CV3DReconSessionConfigurationCreateWithPrivatePreset();
  }
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v72 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke;
  v73 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v74 = v6;
  if ((~self->_sceneReconstruction & 0x11) != 0
    && (sceneReconstruction & 0x80) == 0
    && (self->_sceneReconstruction & 0x18) != 0x18
    || (CV3DReconSessionConfigurationAddPrivateMappingAttribute() & 1) != 0)
  {
    uint64_t v8 = CV3DReconSlamAdapterCreate();
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v68 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2;
    v69 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v70 = v8;
    objc_initWeak(&location, self);
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_3;
    v64[3] = &unk_1E6188358;
    objc_copyWeak(&v65, &location);
    v47 = (void *)MEMORY[0x1BA9C63E0](v64);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_4;
    v62[3] = &unk_1E6188380;
    objc_copyWeak(&v63, &location);
    v46 = (void *)MEMORY[0x1BA9C63E0](v62);
    if (CV3DReconSlamAdapterSetAnchoringCallbacks())
    {
      if (CV3DReconSessionConfigurationSetSlamAdapter())
      {
        if (CV3DReconSessionConfigurationAddMappingAttribute())
        {
          [(ARSceneReconstructionOptions *)self->_options lowQosSchedulingEnabled];
          if (CV3DReconSessionConfigurationEnableLowQosScheduling())
          {
            [(ARSceneReconstructionOptions *)self->_options minDepthUncertaintyThreshold];
            GetConfidenceFromUncertainty(v9);
            float v11 = v10;
            if ((CV3DReconSessionConfigurationSetMinDepthConfidence() & 1) == 0)
            {
              v18 = objc_msgSend(NSString, "stringWithFormat:", @"Error setting reconstruction session minimum depth confidence to %f", v11);
              ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, v18);
              goto LABEL_32;
            }
            if ((sceneReconstruction & 1) == 0)
            {
LABEL_40:
              if ((sceneReconstruction & 0x80) == 0) {
                goto LABEL_56;
              }
              uint64_t v22 = CV3DReconMeshingConfigurationCreateWithPrivatePreset();
              if (!v22)
              {
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error creating meshing configuration");
                goto LABEL_28;
              }
              v54[0] = MEMORY[0x1E4F143A8];
              v54[1] = 3221225472;
              v55 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_38;
              v56 = &__block_descriptor_40_e5_v8__0l;
              uint64_t v57 = v22;
              if ([(ARSceneReconstructionHandler *)self _configureMeshingConfiguration:v22 error:a3])
              {
                if (CV3DReconMeshingConfigurationAddPrivateMeshIntegrationAttribute())
                {
                  if (CV3DReconSessionConfigurationSetMeshingConfiguration())
                  {
                    char v23 = 1;
                    goto LABEL_55;
                  }
                  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error setting meshing configuration");
                }
                else
                {
                  v24 = _ARLogGeneral();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                  {
                    v25 = (objc_class *)objc_opt_class();
                    uint64_t v26 = NSStringFromClass(v25);
                    *(_DWORD *)buf = 138543874;
                    uint64_t v77 = v26;
                    __int16 v78 = 2048;
                    v79 = self;
                    __int16 v80 = 2112;
                    v81 = v75;
                    os_log_t loga = (os_log_t)v26;
                    _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding color to reconstruction session meshing configuration: %@", buf, 0x20u);
                  }
                }
              }
              char v23 = 0;
LABEL_55:
              v55((uint64_t)v54);
              if ((v23 & 1) == 0) {
                goto LABEL_28;
              }
LABEL_56:
              if ((CV3DReconSessionConfigurationEnableSynchronousScheduling() & 1) == 0)
              {
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error setting scheduling mode in reconstruction session configuration");
                goto LABEL_28;
              }
              [(ARSceneReconstructionOptions *)self->_options deterministicMode];
              if (CV3DReconSessionConfigurationEnableDeterministicBehavior())
              {
                BOOL v27 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.sceneReconstruction.waitTillVIOIsStable"];
                if (CV3DReconSessionConfigurationEnableConsumeVIOMetadata())
                {
                  uint64_t v28 = CV3DReconSessionCreateWithConfiguration();
                  v29 = (CV3DReconSession *)v28;
                  if (v28)
                  {
                    v50[0] = MEMORY[0x1E4F143A8];
                    v50[1] = 3221225472;
                    v51 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_54;
                    v52 = &__block_descriptor_40_e5_v8__0l;
                    uint64_t v53 = v28;
                    if ((sceneReconstruction & 0x81) != 0 && CV3DReconSessionHasMeshingCapability())
                    {
                      v48[1] = (id)MEMORY[0x1E4F143A8];
                      v48[2] = (id)3221225472;
                      v48[3] = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2_55;
                      v48[4] = &unk_1E61883A8;
                      objc_copyWeak(&v49, &location);
                      if ((CV3DReconSessionAddOnMeshListUpdateCallback() & 1) == 0)
                      {
                        ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error setting meshing list update callback");
                        objc_destroyWeak(&v49);
                        goto LABEL_92;
                      }
                      objc_destroyWeak(&v49);
                    }
                    if ((sceneReconstruction & 8) != 0 && CV3DReconSessionHasKeyframingCapability())
                    {
                      objc_copyWeak(v48, &location);
                      if ((CV3DReconSessionAddOnKeyframeListUpdateCallback() & 1) == 0)
                      {
                        ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error setting keyframe list update callback");
                        objc_destroyWeak(v48);
                        goto LABEL_92;
                      }
                      objc_destroyWeak(v48);
                    }
                    if (![(ARSceneReconstructionHandler *)self _reconfigureSession:v29 error:a3])
                    {
                      BOOL v7 = 0;
                      goto LABEL_93;
                    }
                    if ((sceneReconstruction & 0x80) != 0 && (CV3DReconSessionEnablePerFrameMeshColor() & 1) == 0)
                    {
                      v39 = v75;
                      v40 = [NSString stringWithFormat:@"Error enabling per-frame mesh color"];
                      ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v39, v40);
                    }
                    else
                    {
                      if ((sceneReconstruction & 1) == 0
                        || (unint64_t v30 = self->_sceneReconstruction & 0x11, (CV3DReconSessionEnablePerFrameMeshColor() & 1) != 0))
                      {
                        CV3DReconSessionRetain();
                        self->_reconstructionSession = v29;
                        BOOL v7 = 1;
LABEL_93:
                        ((void (*)(void *))v51)(v50);
                        goto LABEL_29;
                      }
                      v41 = v75;
                      v42 = @"disabling";
                      if (v30 == 17) {
                        v42 = @"enabling";
                      }
                      v43 = [NSString stringWithFormat:@"Error %@ per-frame mesh color", v42];
                      ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v41, v43);
                    }
LABEL_92:
                    BOOL v7 = 0;
                    goto LABEL_93;
                  }
                  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error creating reconstruction session");
LABEL_28:
                  BOOL v7 = 0;
LABEL_29:

                  objc_destroyWeak(&v63);
                  objc_destroyWeak(&v65);
                  objc_destroyWeak(&location);
                  v68((uint64_t)v67);
                  goto LABEL_30;
                }
                v35 = v75;
                v36 = "disabling";
                if (v27) {
                  v36 = "enabling";
                }
                v18 = objc_msgSend(NSString, "stringWithFormat:", @"Error %s consume VIO metadata in reconstruction session configuration", v36);
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v35, v18);
              }
              else
              {
                v31 = v75;
                v32 = NSString;
                BOOL v33 = [(ARSceneReconstructionOptions *)self->_options deterministicMode];
                v34 = "disabling";
                if (v33) {
                  v34 = "enabling";
                }
                v18 = objc_msgSend(v32, "stringWithFormat:", @"Error %s deterministic mode in reconstruction session configuration", v34);
                ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v31, v18);
              }
LABEL_32:

              goto LABEL_28;
            }
            uint64_t v12 = CV3DReconMeshingConfigurationCreateWithPrivatePreset();
            if (!v12)
            {
              ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error creating meshing configuration");
              goto LABEL_28;
            }
            v58[0] = MEMORY[0x1E4F143A8];
            v58[1] = 3221225472;
            v59 = __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_5;
            v60 = &__block_descriptor_40_e5_v8__0l;
            uint64_t v61 = v12;
            if (![(ARSceneReconstructionHandler *)self _configureMeshingConfiguration:v12 error:a3])goto LABEL_38; {
            if (CV3DReconMeshingConfigurationAddMeshIntegrationAttribute())
            }
            {
              if ((~self->_sceneReconstruction & 0x11) != 0)
              {
                if ((CV3DReconMeshingConfigurationRemoveMeshIntegrationAttribute() & 1) == 0)
                {
                  uint64_t v13 = _ARLogGeneral();
                  if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_37;
                  }
                  log = v13;
                  v37 = (objc_class *)objc_opt_class();
                  v38 = NSStringFromClass(v37);
                  *(_DWORD *)buf = 138543874;
                  uint64_t v77 = (uint64_t)v38;
                  __int16 v78 = 2048;
                  v79 = self;
                  __int16 v80 = 2112;
                  v81 = v75;
                  _os_log_impl(&dword_1B88A2000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error removing color to reconstruction session meshing configuration: %@", buf, 0x20u);

                  goto LABEL_36;
                }
              }
              else if ((CV3DReconMeshingConfigurationAddPrivateMeshIntegrationAttribute() & 1) == 0)
              {
                uint64_t v13 = _ARLogGeneral();
                if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
                {
                  log = v13;
                  v14 = (objc_class *)objc_opt_class();
                  v15 = NSStringFromClass(v14);
                  *(_DWORD *)buf = 138543874;
                  uint64_t v77 = (uint64_t)v15;
                  __int16 v78 = 2048;
                  v79 = self;
                  __int16 v80 = 2112;
                  v81 = v75;
                  _os_log_impl(&dword_1B88A2000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding color to reconstruction session meshing configuration: %@", buf, 0x20u);

LABEL_36:
                  uint64_t v13 = log;
                  goto LABEL_37;
                }
                goto LABEL_37;
              }
              if (CV3DReconSessionConfigurationSetMeshingConfiguration())
              {
                char v21 = 1;
LABEL_39:
                v59((uint64_t)v58);
                if ((v21 & 1) == 0) {
                  goto LABEL_28;
                }
                goto LABEL_40;
              }
              ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error setting meshing configuration");
LABEL_38:
              char v21 = 0;
              goto LABEL_39;
            }
            uint64_t v13 = _ARLogGeneral();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              log = v13;
              v19 = (objc_class *)objc_opt_class();
              v20 = NSStringFromClass(v19);
              *(_DWORD *)buf = 138543874;
              uint64_t v77 = (uint64_t)v20;
              __int16 v78 = 2048;
              v79 = self;
              __int16 v80 = 2112;
              v81 = v75;
              _os_log_impl(&dword_1B88A2000, log, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding semantics to reconstruction session meshing configuration: %@", buf, 0x20u);

              goto LABEL_36;
            }
LABEL_37:

            goto LABEL_38;
          }
          v16 = @"Error setting reconstruction session QoS scheduling mode";
        }
        else
        {
          v16 = @"Error adding reconstruction session configuration mapping attribute: semantic";
        }
      }
      else
      {
        v16 = @"Error setting reconstruction session configuration slam adapter";
      }
    }
    else
    {
      v16 = @"Error setting reconstruction session configuration slam adapter callbacks";
    }
    ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, v16);
    goto LABEL_28;
  }
  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a3, v75, @"Error enabling color attribute");
  BOOL v7 = 0;
LABEL_30:
  v72((uint64_t)v71);
  return v7;
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4147F48](*(void *)(a1 + 32));
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2(uint64_t a1)
{
  return MEMORY[0x1F4147FE8](*(void *)(a1 + 32));
}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (CV3DSLAMSessionAddAnchor() & 1) == 0) {
    [WeakRetained handleCFError:0 withErrorMessage:@"Error adding anchor"];
  }
}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (CV3DSLAMSessionRemoveAnchor() & 1) == 0) {
    [WeakRetained handleCFError:0 withErrorMessage:@"Error removing anchor"];
  }
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_5(uint64_t a1)
{
  return MEMORY[0x1F4147E78](*(void *)(a1 + 32));
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_38(uint64_t a1)
{
  return MEMORY[0x1F4147E78](*(void *)(a1 + 32));
}

uint64_t __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_54()
{
  return CV3DReconSessionRelease();
}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_2_55(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReceiveMeshListUpdateCallbackWithMeshList:a2 timestamp:a3 error:a4];
}

void __72__ARSceneReconstructionHandler__recreateReconstructionSessionWithError___block_invoke_3_60(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didReceiveKeyframeListUpdateCallbackWithKeyframeList:a2 timestamp:a3 error:a4];
}

- (void)_setupSLAMStateBuffering
{
  if (!self->_slamStateCbID.__engaged_)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = 0;
    objc_copyWeak(&v4, &location);
    unint64_t v3 = CV3DSLAMSessionRegisterNewStateBlock();
    if (v3)
    {
      self->_slamStateCbID.var0.__val_ = v3;
      self->_slamStateCbID.__engaged_ = 1;
    }
    else
    {
      [(ARSceneReconstructionHandler *)self handleCFError:v5 withErrorMessage:@"Error setting slam state callback"];
    }
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __56__ARSceneReconstructionHandler__setupSLAMStateBuffering__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bufferSlamState:a2];
}

- (BOOL)_canReconfigureExistingSessionForSceneReconstruction:(unint64_t)a3 options:(id)a4
{
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  BOOL v7 = self->_reconstructionSession
    && [(ARSceneReconstructionOptions *)self->_options isEqual:v6]
    && (self->_sceneReconstruction ^ a3) == 2;

  return v7;
}

- (BOOL)_reconfigureSession:(CV3DReconSession *)a3 error:(id *)a4
{
  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  if ((self->_sceneReconstruction & 1) == 0) {
    return 1;
  }
  unint64_t v7 = self->_sceneReconstruction & 3;
  if (CV3DReconSessionEnablePerFrameMeshSemantics())
  {
    if (CV3DReconSessionEnablePerFrameMeshColor()) {
      return 1;
    }
    uint64_t v8 = @"disabling";
    if (v7 == 3) {
      uint64_t v8 = @"enabling";
    }
    float v9 = [NSString stringWithFormat:@"Error %@ per-frame mesh color", v8];
    ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a4, 0, v9);
  }
  else
  {
    float v10 = @"disabling";
    if (v7 == 3) {
      float v10 = @"enabling";
    }
    float v9 = [NSString stringWithFormat:@"Error %@ per-frame mesh semantics", v10];
    ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a4, 0, v9);
  }

  return 0;
}

- (BOOL)_configureMeshingConfiguration:(CV3DReconMeshingConfiguration *)a3 error:(id *)a4
{
  os_unfair_lock_assert_owner(&self->_reconstructionSessionLock);
  ARVoxelSizeForSceneReconstructionOptions(self->_options);
  if (CV3DReconMeshingConfigurationSetVoxelSize())
  {
    ARBucketsOrderOfMagnitudeForSceneReconstructionOptions(self->_options);
    if (CV3DReconMeshingConfigurationSetBucketsOrderOfMagnitude())
    {
      if (ARDeviceIsiPad() && (CV3DReconMeshingConfigurationSetMinMeshingPeriod() & 1) == 0)
      {
        id v6 = @"Error setting meshing configuration minimum meshing period on iPad";
      }
      else
      {
        [(ARSceneReconstructionOptions *)self->_options enableOccupancyMapping];
        if (CV3DReconMeshingConfigurationEnableOccupancyMapping())
        {
          self->_occupancyMappingEnabled = CV3DReconMeshingConfigurationHasOccupancyMapping();
          return 1;
        }
        id v6 = @"Error enabling occupancy mapping";
      }
    }
    else
    {
      id v6 = @"Error setting meshing configuration buckets order of magnitude";
    }
  }
  else
  {
    id v6 = @"Error setting meshing configuration voxel size";
  }
  ARSetNSErrorByWrappingCFErrorWithFailureReasonMessage(a4, 0, v6);
  return 0;
}

- (void)_didReceiveMeshListUpdateCallbackWithMeshList:(CV3DReconMeshList *)a3 timestamp:(double)a4 error:(__CFError *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    float v9 = _ARLogTechnique();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      float v10 = (objc_class *)objc_opt_class();
      float v11 = NSStringFromClass(v10);
      uint64_t v12 = [(__CFError *)a5 localizedFailureReason];
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error received in mesh list update callback: %@", (uint8_t *)&v15, 0x20u);
    }
    kdebug_trace();
    CV3DReconMeshListRelease();
  }
  else
  {
    CV3DReconMeshListGetCount();
    kdebug_trace();
    uint64_t v13 = [(ARSceneReconstructionHandler *)self delegate];

    if (v13)
    {
      v14 = [(ARSceneReconstructionHandler *)self delegate];
      [v14 sceneReconstructionHandler:self didOutputMeshList:a3 withTimestamp:a4];
    }
    else
    {
      CV3DReconMeshListRelease();
    }
  }
}

- (void)_didReceiveKeyframeListUpdateCallbackWithKeyframeList:(CV3DReconKeyframeList *)a3 timestamp:(double)a4 error:(__CFError *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    uint64_t v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      float v9 = (objc_class *)objc_opt_class();
      float v10 = NSStringFromClass(v9);
      float v11 = [(__CFError *)a5 localizedFailureReason];
      int v15 = 138543874;
      v16 = v10;
      __int16 v17 = 2048;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error received in keyframe list update callback: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    uint64_t v13 = [(ARSceneReconstructionHandler *)self delegate];

    if (v13)
    {
      v14 = [(ARSceneReconstructionHandler *)self delegate];
      [v14 sceneReconstructionHandler:self didOutputKeyframeList:a3 withTimestamp:a4];

      goto LABEL_8;
    }
  }
  CV3DReconKeyframeListRelease();
LABEL_8:
}

- (void)start
{
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__ARSceneReconstructionHandler_start__block_invoke;
  v5[3] = &unk_1E61883F8;
  v5[4] = self;
  if (![(ARSceneReconstructionHandler *)self _lockAndExecuteBlock:v5]
    || ([(ARSceneReconstructionHandler *)self _setupSLAMStateBuffering],
        v4[0] = MEMORY[0x1E4F143A8],
        v4[1] = 3221225472,
        v4[2] = __37__ARSceneReconstructionHandler_start__block_invoke_2,
        v4[3] = &unk_1E6188420,
        v4[4] = self,
        [(ARSceneReconstructionHandler *)self _lockAndExecuteNSErrorBlock:v4]))
  {
    if (!self->_sessionActivated)
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __37__ARSceneReconstructionHandler_start__block_invoke_3;
      v3[3] = &unk_1E6188448;
      v3[4] = self;
      [(ARSceneReconstructionHandler *)self _lockAndExecuteCFErrorBlockWithErrorMessage:@"Error enabling reconstruction session" cfErrorBlock:v3];
    }
  }
}

BOOL __37__ARSceneReconstructionHandler_start__block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 8) == 0;
}

uint64_t __37__ARSceneReconstructionHandler_start__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recreateReconstructionSessionWithError:a2];
}

uint64_t __37__ARSceneReconstructionHandler_start__block_invoke_3(uint64_t a1)
{
  return MEMORY[0x1F4147F78](*(void *)(*(void *)(a1 + 32) + 8));
}

- (int64_t)reconfigureSceneReconstruction:(unint64_t)a3 options:(id)a4
{
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  if (self->_sceneReconstruction == a3 && [(ARSceneReconstructionOptions *)self->_options isEqual:v7])
  {
    int64_t v8 = 1;
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__ARSceneReconstructionHandler_reconfigureSceneReconstruction_options___block_invoke;
    v12[3] = &unk_1E6188470;
    v12[4] = self;
    unint64_t v14 = a3;
    id v13 = v7;
    BOOL v9 = [(ARSceneReconstructionHandler *)self _lockAndExecuteBlock:v12];
    self->_unint64_t sceneReconstruction = a3;
    objc_storeStrong((id *)&self->_options, a4);
    if (v9) {
      int64_t v10 = [(ARSceneReconstructionHandler *)self _reconfigureSessionAndHandleError];
    }
    else {
      int64_t v10 = [(ARSceneReconstructionHandler *)self _recreateSessionAndHandleError];
    }
    int64_t v8 = v10;
  }
  return v8;
}

uint64_t __71__ARSceneReconstructionHandler_reconfigureSceneReconstruction_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _canReconfigureExistingSessionForSceneReconstruction:*(void *)(a1 + 48) options:*(void *)(a1 + 40)];
}

- (int64_t)_reconfigureSessionAndHandleError
{
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__ARSceneReconstructionHandler__reconfigureSessionAndHandleError__block_invoke;
  v4[3] = &unk_1E6188420;
  v4[4] = self;
  if ([(ARSceneReconstructionHandler *)self _lockAndExecuteNSErrorBlock:v4]) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t __65__ARSceneReconstructionHandler__reconfigureSessionAndHandleError__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reconfigureSession:*(void *)(*(void *)(a1 + 32) + 8) error:a2];
}

- (int64_t)_recreateSessionAndHandleError
{
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  if (self->_sessionActivated)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __62__ARSceneReconstructionHandler__recreateSessionAndHandleError__block_invoke;
    v6[3] = &unk_1E6188448;
    v6[4] = self;
    if (![(ARSceneReconstructionHandler *)self _lockAndExecuteCFErrorBlockWithErrorMessage:@"Error disabling reconstruction session" cfErrorBlock:v6])return 0; {
    self->_sessionActivated = 0;
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62__ARSceneReconstructionHandler__recreateSessionAndHandleError__block_invoke_2;
    v5[3] = &unk_1E6188448;
    v5[4] = self;
    if (![(ARSceneReconstructionHandler *)self _lockAndExecuteCFErrorBlockWithErrorMessage:@"Error waiting on reconstruction session" cfErrorBlock:v5 failSession:0])return 0; {
  }
    }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__ARSceneReconstructionHandler__recreateSessionAndHandleError__block_invoke_3;
  v4[3] = &unk_1E6188420;
  v4[4] = self;
  if ([(ARSceneReconstructionHandler *)self _lockAndExecuteNSErrorBlock:v4]) {
    return 2;
  }
  else {
    return 0;
  }
}

uint64_t __62__ARSceneReconstructionHandler__recreateSessionAndHandleError__block_invoke()
{
  return CV3DReconSessionDisable();
}

uint64_t __62__ARSceneReconstructionHandler__recreateSessionAndHandleError__block_invoke_2()
{
  return CV3DReconSessionWait();
}

uint64_t __62__ARSceneReconstructionHandler__recreateSessionAndHandleError__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _recreateReconstructionSessionWithError:a2];
}

- (void)pause
{
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  if (self->_sessionActivated)
  {
    os_unfair_lock_lock(p_reconstructionSessionLock);
    char v4 = CV3DReconSessionDisable();
    os_unfair_lock_unlock(p_reconstructionSessionLock);
    if (v4) {
      self->_sessionActivated = 0;
    }
    else {
      [(ARSceneReconstructionHandler *)self handleCFError:0 withErrorMessage:@"Error disabling reconstruction session"];
    }
  }
}

- (void)reset
{
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  os_unfair_lock_lock(p_reconstructionSessionLock);
  kdebug_trace();
  char v4 = CV3DReconSessionReset();
  kdebug_trace();
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  if ((v4 & 1) == 0) {
    [(ARSceneReconstructionHandler *)self handleCFError:0 withErrorMessage:@"Error resetting reconstruction session"];
  }
}

- (void)meshPlaneHarmonizationShouldEnable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  os_unfair_lock_lock(p_reconstructionSessionLock);
  char v6 = CV3DReconSessionEnableMeshPlaneHarmony();
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  if (v6)
  {
    id v7 = _ARLogTechnique();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int64_t v8 = (objc_class *)objc_opt_class();
      BOOL v9 = NSStringFromClass(v8);
      int64_t v10 = "disabled";
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v9;
      if (v3) {
        int64_t v10 = "enabled";
      }
      __int16 v13 = 2048;
      unint64_t v14 = self;
      __int16 v15 = 2080;
      v16 = v10;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Scene reconstruction plane harmonization is %s", buf, 0x20u);
    }
  }
  else
  {
    [(ARSceneReconstructionHandler *)self handleCFError:0 withErrorMessage:@"Error updating plane harmonization" failSession:0];
  }
}

- (void)pushDepth:(id)a3 semanticSegmentation:(id)a4 personSegmentation:(id)a5 pose:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v54 = a4;
  id v52 = a5;
  id v53 = a6;
  float v11 = [v53 worldTrackingState];
  uint64_t v12 = [v11 state];

  if (v12 == 2)
  {
    if ([v54 maskedSemanticsSampledForDepth])
    {
      __int16 v13 = [v10 sourceImageData];
      [v13 timestamp];
      kdebug_trace();

      unint64_t v14 = [v10 sourceImageData];
      [v14 cameraIntrinsics];
      double v50 = v16;
      float v51 = v15;
      double v49 = v17;
      v18 = [v10 sourceImageData];
      [v18 imageResolution];
      double v20 = v19;
      double v22 = v21;
      [v10 depthBufferSize];
      ARAdjustIntrinsicsForViewportSize(v51, v50, v49, v20, v22, v23, v24);
      long long v48 = v25;

      [v53 visionCameraTransform];
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
      kdebug_trace();
      uint64_t v26 = [v54 sourceImageData];
      [v26 timestamp];
      [v10 depthBufferSize];
      [v10 depthBufferSize];
      uint64_t v27 = CV3DReconFrameBundleCreate();

      if (v27)
      {
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v64 = __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke;
        id v65 = &__block_descriptor_40_e5_v8__0l;
        uint64_t v66 = v27;
        *(void *)buf = 0;
        uint64_t v28 = [v53 slamState];
        -[ARSceneReconstructionHandler bufferSlamState:](self, "bufferSlamState:", [v28 slamState]);

        [(ARSceneReconstructionHandler *)self swapSlamStateBuffers];
        begin = self->_slamStateBufferFront.__begin_;
        end = self->_slamStateBufferFront.__end_;
        if (begin != end)
        {
          while (1)
          {
            if (!*begin)
            {
              [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Error: unexpected null slam state" failSession:0];
              goto LABEL_35;
            }
            uint64_t v31 = CV3DReconSlamMetadataCreateFromSlamState();
            if (!v31) {
              break;
            }
            v59[0] = MEMORY[0x1E4F143A8];
            v59[1] = 3221225472;
            v60 = __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_2;
            uint64_t v61 = &__block_descriptor_40_e5_v8__0l;
            uint64_t v62 = v31;
            char v32 = CV3DReconFrameBundleAddSlamMetadata();
            if ((v32 & 1) == 0) {
              [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Error adding SLAM state to frame bundle" failSession:0];
            }
            v60((uint64_t)v59);
            if ((v32 & 1) == 0) {
              goto LABEL_35;
            }
            begin += 2;
            if (begin == end) {
              goto LABEL_11;
            }
          }
          [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Error: failed to convert slam state to recon slam metadata" failSession:0];
          goto LABEL_35;
        }
LABEL_11:
        std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::__clear[abi:ne180100]((uint64_t *)&self->_slamStateBufferFront);
        [v10 singleFrameDepthBuffer];
        if ((CV3DReconFrameBundleSetDepthImage() & 1) == 0)
        {
          [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Error setting depth image to frame bundle" failSession:0];
LABEL_35:
          v64((uint64_t)v63);
          goto LABEL_26;
        }
        BOOL v33 = -[ARSceneReconstructionHandler postProcessConfidenceBuffer:fromSegmentationData:](self, "postProcessConfidenceBuffer:fromSegmentationData:", [v10 singleFrameConfidenceBuffer], v52);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v56 = __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_3;
        uint64_t v57 = &__block_descriptor_40_e5_v8__0l;
        v58 = v33;
        if ([v10 normalsBuffer]
          && ([v10 normalsBuffer], (CV3DReconFrameBundleSetNormalsImage() & 1) == 0))
        {
          v45 = @"Error setting normals image to frame bundle";
        }
        else if (CV3DReconFrameBundleSetDepthConfidenceImage())
        {
          [v54 maskedSemanticsSampledForDepth];
          if (CV3DReconFrameBundleSetSemanticsImage())
          {
            unint64_t sceneReconstruction = self->_sceneReconstruction;
            if ((~sceneReconstruction & 0x11) != 0
              && (~sceneReconstruction & 0x18) != 0
              && (sceneReconstruction & 0x80) == 0
              || (objc_msgSend(v10, "sourceImageData", v48),
                  v35 = objc_claimAutoreleasedReturnValue(),
                  [v35 pixelBuffer],
                  char v36 = CV3DReconFrameBundleSetColorImage(),
                  v35,
                  (v36 & 1) != 0))
            {
              CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v10, "singleFrameDepthBuffer", v48));
              CVPixelBufferGetHeight((CVPixelBufferRef)[v10 singleFrameDepthBuffer]);
              CVPixelBufferGetWidth((CVPixelBufferRef)[v54 maskedSemanticsSampledForDepth]);
              CVPixelBufferGetHeight((CVPixelBufferRef)[v54 maskedSemanticsSampledForDepth]);
              kdebug_trace();
              kdebug_trace();
              os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
              os_unfair_lock_lock(&self->_reconstructionSessionLock);
              [v10 timestamp];
              v46 = [v54 sourceImageData];
              [v46 timestamp];
              kdebug_trace();

              char v47 = CV3DReconSessionProcessFrameBundle();
              os_unfair_lock_unlock(&self->_reconstructionSessionLock);
              kdebug_trace();
              if ((v47 & 1) == 0) {
                [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Error processing frame bundle" failSession:0];
              }
            }
            else
            {
              [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Error setting color image to frame bundle" failSession:0];
            }
            goto LABEL_34;
          }
          v45 = @"Error setting semantics image to frame bundle";
        }
        else
        {
          v45 = @"Error setting depth confidence image to frame bundle";
        }
        -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", *(void *)buf, v45, 0, v48);
LABEL_34:
        v56((uint64_t)v55);
        goto LABEL_35;
      }
      v37 = _ARLogTechnique();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v44;
        __int16 v68 = 2048;
        v69 = self;
        _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error creating frame bundle, skipping pushing to spatial mapping", buf, 0x16u);
      }
    }
    else
    {
      v37 = _ARLogTechnique();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v41 = (objc_class *)objc_opt_class();
        v42 = NSStringFromClass(v41);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v42;
        __int16 v68 = 2048;
        v69 = self;
        _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping pushing to spatial mapping since masked semantics sampled for depth is not available", buf, 0x16u);
      }
    }
  }
  else
  {
    v37 = _ARLogTechnique();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      v38 = (objc_class *)objc_opt_class();
      NSStringFromClass(v38);
      id v39 = (id)objc_claimAutoreleasedReturnValue();
      v40 = [v53 worldTrackingState];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v39;
      __int16 v68 = 2048;
      v69 = self;
      __int16 v70 = 2048;
      uint64_t v71 = [v40 state];
      _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping pushing to spatial mapping since world tracking state is not normal: %ld", buf, 0x20u);
    }
  }

LABEL_26:
}

uint64_t __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4147D28](*(void *)(a1 + 32));
}

uint64_t __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_2(uint64_t a1)
{
  return MEMORY[0x1F4147FF8](*(void *)(a1 + 32));
}

void __87__ARSceneReconstructionHandler_pushDepth_semanticSegmentation_personSegmentation_pose___block_invoke_3(uint64_t a1)
{
}

- (__CVBuffer)postProcessConfidenceBuffer:(__CVBuffer *)a3 fromSegmentationData:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (!v6 || ![v6 segmentationBuffer]) {
    goto LABEL_27;
  }
  if (a3)
  {
    double Width = (double)CVPixelBufferGetWidth(a3);
    double Height = (double)CVPixelBufferGetHeight(a3);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  id v10 = (__CVBuffer *)[v7 segmentationBuffer];
  float v11 = v10;
  if (v10)
  {
    double v12 = (double)CVPixelBufferGetWidth(v10);
    double v13 = (double)CVPixelBufferGetHeight(v11);
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB30];
    double v13 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  if (v12 != Width || v13 != Height)
  {
    float v15 = _ARLogTechnique();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      double v16 = (objc_class *)objc_opt_class();
      double v17 = NSStringFromClass(v16);
      int v33 = 138544642;
      v34 = v17;
      __int16 v35 = 2048;
      char v36 = self;
      __int16 v37 = 1024;
      int v38 = (int)v12;
      __int16 v39 = 1024;
      int v40 = (int)v13;
      __int16 v41 = 1024;
      int v42 = (int)Width;
      __int16 v43 = 1024;
      int v44 = (int)Height;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Confidence buffer and person segmentation buffer do not match size. (%d,%d) vs. (%d,%d).", (uint8_t *)&v33, 0x2Eu);
    }
    CVPixelBufferRef v18 = CVPixelBufferRetain(a3);
    goto LABEL_28;
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  double v20 = ARCreateCVPixelBufferFromPool(&self->_postProcessedDepthConfidencePool, PixelFormatType, self, @"Post processed confidence buffer", Width, Height);
  if (!v20)
  {
LABEL_27:
    CVPixelBufferRef v18 = CVPixelBufferRetain(a3);
LABEL_28:
    double v20 = v18;
    goto LABEL_29;
  }
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v7 segmentationBuffer], 1uLL);
  CVPixelBufferLockBaseAddress(v20, 0);
  CVPixelBufferLockBaseAddress(a3, 1uLL);
  BaseAddress = CVPixelBufferGetBaseAddress(v20);
  double v22 = CVPixelBufferGetBaseAddress(a3);
  size_t BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
  memcpy(BaseAddress, v22, (unint64_t)(Height * (double)BytesPerRow));
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  size_t v24 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v7 segmentationBuffer]);
  size_t v25 = CVPixelBufferGetBytesPerRow(v20);
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  for (size_t i = 0; i < CVPixelBufferGetHeight(v20); ++i)
  {
    size_t v29 = 0;
    unint64_t v30 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v7 segmentationBuffer]) + v27;
    uint64_t v31 = (char *)CVPixelBufferGetBaseAddress(v20) + v26;
    while (CVPixelBufferGetWidth(v20) > v29)
    {
      if (v30[v29]) {
        *(_DWORD *)&v31[4 * v29] = 0;
      }
      ++v29;
    }
    v27 += v24;
    v26 += v25;
  }
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v7 segmentationBuffer], 1uLL);
  CVPixelBufferUnlockBaseAddress(v20, 0);
LABEL_29:

  return v20;
}

- (void)processPlaneList:(CV3DPlaneDetectionPlaneList *)a3
{
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  os_unfair_lock_lock(p_reconstructionSessionLock);
  char v5 = CV3DReconSessionProcessPlaneList();
  os_unfair_lock_unlock(p_reconstructionSessionLock);
  if ((v5 & 1) == 0) {
    [(ARSceneReconstructionHandler *)self handleCFError:0 withErrorMessage:@"Error processing plane list" failSession:0];
  }
}

- (BOOL)queryOccupancyWithPoints:(id)a3 callback:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  if (self->_occupancyMappingEnabled)
  {
    *(void *)buf = 0;
    uint64_t v8 = MEMORY[0x1BA9C4190](v6);
    os_unfair_lock_lock(&self->_reconstructionSessionLock);
    char OccupancyAsync = CV3DReconSessionQueryOccupancyAsync();
    os_unfair_lock_unlock(&self->_reconstructionSessionLock);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    id v10 = __66__ARSceneReconstructionHandler_queryOccupancyWithPoints_callback___block_invoke;
    double v16 = __66__ARSceneReconstructionHandler_queryOccupancyWithPoints_callback___block_invoke;
    double v17 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v18 = v8;
    if ((OccupancyAsync & 1) == 0)
    {
      [(ARSceneReconstructionHandler *)self handleCFError:*(void *)buf withErrorMessage:@"Failed to query occupancy map" failSession:0];
      id v10 = v16;
    }
    v10((uint64_t)v15);
  }
  else
  {
    float v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      double v12 = (objc_class *)objc_opt_class();
      double v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v13;
      __int16 v20 = 2048;
      double v21 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Occupancy mapping is not enabled.", buf, 0x16u);
    }
    char OccupancyAsync = 0;
  }

  return OccupancyAsync;
}

uint64_t __66__ARSceneReconstructionHandler_queryOccupancyWithPoints_callback___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4147EA8](*(void *)(a1 + 32));
}

- (void)failWithError:(id)a3
{
  id v5 = a3;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  char v4 = [(ARSceneReconstructionHandler *)self delegate];
  [v4 sceneReconstructionHandler:self didFailWithError:v5];
}

- (void)handleCFError:(__CFError *)a3 withErrorMessage:(id)a4 failSession:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  if (a3)
  {
    BOOL v9 = _ARLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (objc_class *)objc_opt_class();
      float v11 = NSStringFromClass(v10);
      double v12 = [(__CFError *)a3 localizedFailureReason];
      int v13 = 138544130;
      unint64_t v14 = v11;
      __int16 v15 = 2048;
      double v16 = self;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v12;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@: %@", (uint8_t *)&v13, 0x2Au);
    }
    if (v5) {
      [(ARSceneReconstructionHandler *)self failWithError:a3];
    }
  }
}

- (void)handleCFError:(__CFError *)a3 withErrorMessage:(id)a4
{
}

- (BOOL)_lockAndExecuteBlock:(id)a3
{
  p_reconstructionSessionLock = &self->_reconstructionSessionLock;
  char v4 = (uint64_t (**)(void))a3;
  os_unfair_lock_assert_not_owner(p_reconstructionSessionLock);
  os_unfair_lock_lock(p_reconstructionSessionLock);
  char v5 = v4[2](v4);

  os_unfair_lock_unlock(p_reconstructionSessionLock);
  return v5;
}

- (BOOL)_lockAndExecuteNSErrorBlock:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  uint64_t v23 = 0;
  size_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__6;
  uint64_t v27 = __Block_byref_object_dispose__6;
  id v28 = 0;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  __int16 v19 = __60__ARSceneReconstructionHandler__lockAndExecuteNSErrorBlock___block_invoke;
  __int16 v20 = &unk_1E6188498;
  id v5 = v4;
  id v21 = v5;
  uint64_t v22 = &v23;
  BOOL v6 = [(ARSceneReconstructionHandler *)self _lockAndExecuteBlock:&v17];
  if (!v6)
  {
    id v7 = _ARLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = objc_msgSend((id)v24[5], "localizedFailureReason", v17, v18, v19, v20);
      float v11 = [(id)v24[5] underlyingErrors];
      double v12 = [v11 firstObject];
      int v13 = [v12 localizedFailureReason];
      *(_DWORD *)buf = 138544130;
      id v30 = v9;
      __int16 v31 = 2048;
      char v32 = self;
      __int16 v33 = 2112;
      v34 = v10;
      __int16 v35 = 2112;
      char v36 = v13;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@: %@", buf, 0x2Au);
    }
    unint64_t v14 = [(id)v24[5] underlyingErrors];
    __int16 v15 = [v14 firstObject];
    [(ARSceneReconstructionHandler *)self failWithError:v15];
  }
  _Block_object_dispose(&v23, 8);

  return v6;
}

uint64_t __60__ARSceneReconstructionHandler__lockAndExecuteNSErrorBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, id *))(v1 + 16))(v1, &obj);
  objc_storeStrong((id *)(v2 + 40), obj);
  return v3;
}

- (BOOL)_lockAndExecuteCFErrorBlockWithErrorMessage:(id)a3 cfErrorBlock:(id)a4 failSession:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_reconstructionSessionLock);
  uint64_t v19 = 0;
  __int16 v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  __int16 v15 = __101__ARSceneReconstructionHandler__lockAndExecuteCFErrorBlockWithErrorMessage_cfErrorBlock_failSession___block_invoke;
  double v16 = &unk_1E6188498;
  id v10 = v9;
  id v17 = v10;
  uint64_t v18 = &v19;
  BOOL v11 = [(ARSceneReconstructionHandler *)self _lockAndExecuteBlock:&v13];
  if (!v11) {
    -[ARSceneReconstructionHandler handleCFError:withErrorMessage:failSession:](self, "handleCFError:withErrorMessage:failSession:", v20[3], v8, v5, v13, v14, v15, v16);
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __101__ARSceneReconstructionHandler__lockAndExecuteCFErrorBlockWithErrorMessage_cfErrorBlock_failSession___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8) + 24);
}

- (BOOL)_lockAndExecuteCFErrorBlockWithErrorMessage:(id)a3 cfErrorBlock:(id)a4
{
  return [(ARSceneReconstructionHandler *)self _lockAndExecuteCFErrorBlockWithErrorMessage:a3 cfErrorBlock:a4 failSession:1];
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_postProcessedDepthConfidencePool);
  uint64_t v4 = 0;
  if (self->_slamStateCbID.__engaged_ && (CV3DSLAMSessionDeregisterNewStateBlock() & 1) == 0) {
    [(ARSceneReconstructionHandler *)self handleCFError:v4 withErrorMessage:@"Error deregistering slam state callback" failSession:0];
  }
  if (self->_reconstructionSession)
  {
    if ((CV3DReconSessionDisable() & 1) == 0) {
      [(ARSceneReconstructionHandler *)self handleCFError:v4 withErrorMessage:@"Error disabling reconstruction session" failSession:0];
    }
    if ((CV3DReconSessionWait() & 1) == 0) {
      [(ARSceneReconstructionHandler *)self handleCFError:v4 withErrorMessage:@"Error waiting on reconstruction session" failSession:0];
    }
  }
  CV3DReconSessionRelease();
  CV3DSLAMSessionRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARSceneReconstructionHandler;
  [(ARSceneReconstructionHandler *)&v3 dealloc];
}

- (unint64_t)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (ARSceneReconstructionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSceneReconstructionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ARSceneReconstructionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_destroyWeak((id *)&self->_delegate);
  p_slamStateBufferFront = &self->_slamStateBufferFront;
  std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_slamStateBufferFront);
  p_slamStateBufferFront = &self->_slamStateBufferBack;
  std::vector<std::shared_ptr<CV3DSLAMStateContext const>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_slamStateBufferFront);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 112) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((unsigned char *)self + 104) = 0;
  return self;
}

- (void)bufferSlamState:(std::__shared_weak_count *)a1
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BA9C56C0);
}

- (uint64_t)bufferSlamState:
{
  return CV3DSLAMStateRelease();
}

- (uint64_t)bufferSlamState:(uint64_t)a1
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

- (void)_recreateReconstructionSessionWithError:.cold.1()
{
}

@end