@interface AREnvironmentTexturingTechnique
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
- (AREnvironmentProbeManager)probeManager;
- (AREnvironmentTexturingTechnique)initWithOptions:(int64_t)a3 wantsHDREnvironmentTextures:(BOOL)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)networkIntialized;
- (BOOL)reconfigurableFrom:(id)a3;
- (BOOL)wantsHDREnvironmentTextures;
- (id)_fullDescription;
- (id)processData:(id)a3;
- (unint64_t)requiredSensorDataTypes;
- (void)prepare:(BOOL)a3;
- (void)reconfigureFrom:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)setNetworkIntialized:(BOOL)a3;
- (void)setProbeManager:(id)a3;
@end

@implementation AREnvironmentTexturingTechnique

- (AREnvironmentTexturingTechnique)initWithOptions:(int64_t)a3 wantsHDREnvironmentTextures:(BOOL)a4
{
  v18.receiver = self;
  v18.super_class = (Class)AREnvironmentTexturingTechnique;
  v6 = [(ARTechnique *)&v18 init];
  if (v6)
  {
    v7 = [[AREnvironmentProbeManager alloc] initWithMode:a3];
    probeManager = v6->_probeManager;
    v6->_probeManager = v7;

    uint64_t v9 = objc_opt_new();
    planeWorld = v6->_planeWorld;
    v6->_planeWorld = (ARPlaneWorld *)v9;

    uint64_t v11 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.environmentTexturing.planeUpdate");
    planeUpdateQueue = v6->_planeUpdateQueue;
    v6->_planeUpdateQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = ARCreateNonFixedPriorityDispatchQueue("com.apple.arkit.environmentTexturing.networkPrewarm");
    networkPrewarmQueue = v6->_networkPrewarmQueue;
    v6->_networkPrewarmQueue = (OS_dispatch_queue *)v13;

    v6->_networkIntialized = 0;
    v6->_wantsHDREnvironmentTextures = a4;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(1);
    ultraWideSemaphore = v6->_ultraWideSemaphore;
    v6->_ultraWideSemaphore = (OS_dispatch_semaphore *)v15;
  }
  return v6;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  id v7 = a3;
  char v4 = [AREnvironmentProbeManager alloc];
  v5 = [v7 probeManager];
  v6 = -[AREnvironmentProbeManager initWithMode:](v4, "initWithMode:", [v5 mode]);
  [(AREnvironmentTexturingTechnique *)self setProbeManager:v6];
}

- (id)processData:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 cameraType];
    v8 = v7;
    if (v7 == (void *)*MEMORY[0x1E4F15828])
    {
      intptr_t v9 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_ultraWideSemaphore, 0);

      if (!v9)
      {
        objc_storeStrong((id *)&self->_ultraWide, a3);
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_ultraWideSemaphore);
      }
    }
    else
    {
    }
  }
  return v5;
}

- (void)prepare:(BOOL)a3
{
  if (![(AREnvironmentTexturingTechnique *)self networkIntialized])
  {
    [(AREnvironmentTexturingTechnique *)self setNetworkIntialized:1];
    id v4 = +[ARCubemapCompletion sharedInstance];
    BOOL wantsHDREnvironmentTextures = self->_wantsHDREnvironmentTextures;
    id v6 = +[ARCubemapCompletion sharedInstance];
    [v6 setGenerateHDROutput:wantsHDREnvironmentTextures];
  }
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v35 = [v6 imageData];
  id v7 = [v6 resultDataOfClass:objc_opt_class()];
  v8 = [v7 lastObject];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_ultraWideSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  intptr_t v9 = self->_ultraWide;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_ultraWideSemaphore);
  v10 = v35;
  if (v9) {
    v10 = v9;
  }
  v34 = v10;
  uint64_t v11 = [v6 anchorsToAdd];
  v33 = +[ARProbeFilter filter:v11];

  v12 = objc_opt_new();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v13 = v33;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = [*(id *)(*((void *)&v44 + 1) + 8 * i) identifier];
        [v12 addObject:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v14);
  }

  objc_super v18 = [(AREnvironmentTexturingTechnique *)self probeManager];
  planeWorld = self->_planeWorld;
  if (planeWorld) {
    [(ARPlaneWorld *)planeWorld planes];
  }
  else {
    memset(v43, 0, sizeof(v43));
  }
  v20 = [v18 updateProbesForTimestamp:v43 planes:v34 imageData:v8 pose:v12 enableDirectTexturingForProbesWithIdentifier:a3];
  id location = v43;
  std::vector<ARTexturedPlane>::__destroy_vector::operator()[abi:ne180100]((void ***)&location);

  v21 = [(ARTechnique *)self delegate];
  v49 = v20;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  [v21 technique:self didOutputResultData:v22 timestamp:v6 context:a3];

  if (![(AREnvironmentTexturingTechnique *)self networkIntialized])
  {
    if (v8)
    {
      v23 = [v8 worldTrackingState];
      BOOL v24 = [v23 vioTrackingState] == 0;

      if (v24)
      {
        [(AREnvironmentTexturingTechnique *)self setNetworkIntialized:1];
        objc_initWeak(&location, self);
        networkPrewarmQueue = self->_networkPrewarmQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke;
        block[3] = &unk_1E61853C0;
        objc_copyWeak(&v42, &location);
        dispatch_async(networkPrewarmQueue, block);
        objc_destroyWeak(&v42);
        objc_destroyWeak(&location);
      }
    }
  }
  v26 = [v6 resultDataOfClass:objc_opt_class()];
  v27 = [v26 lastObject];

  if (v35) {
    BOOL v28 = v27 == 0;
  }
  else {
    BOOL v28 = 1;
  }
  if (!v28 && v8 != 0)
  {
    v30 = [v8 worldTrackingState];
    BOOL v31 = [v30 vioTrackingState] == 0;

    if (v31)
    {
      objc_initWeak(&location, self);
      planeUpdateQueue = self->_planeUpdateQueue;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke_2;
      v36[3] = &unk_1E61853E8;
      objc_copyWeak(&v40, &location);
      v37 = v35;
      id v38 = v27;
      id v39 = v8;
      dispatch_async(planeUpdateQueue, v36);

      objc_destroyWeak(&v40);
      objc_destroyWeak(&location);
    }
  }
}

void __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke(uint64_t a1)
{
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    int v2 = WeakRetained[96];
    id v3 = +[ARCubemapCompletion sharedInstance];
    [v3 setGenerateHDROutput:v2 != 0];

    WeakRetained = v4;
  }
}

void __72__AREnvironmentTexturingTechnique_requestResultDataAtTimestamp_context___block_invoke_2(id *a1)
{
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    [a1[4] timestamp];
    kdebug_trace();
    id v3 = (void *)WeakRetained[7];
    id v4 = [a1[5] detectionResult];
    convert((const CV3DPlaneDetectionPlaneList *)[v4 cv3dPlaneDetections], (uint64_t)v20);
    uint64_t v5 = [a1[4] pixelBuffer];
    [a1[4] exposureTargetOffset];
    int v7 = v6;
    [a1[6] cameraTransform];
    double v18 = v9;
    double v19 = v8;
    double v16 = v11;
    double v17 = v10;
    [a1[4] cameraIntrinsics];
    double v13 = v12;
    LODWORD(v12) = v7;
    objc_msgSend(v3, "updatePlanes:withCameraImage:exposureOffset:transform:intrinsics:synchronous:", v20, v5, 0, v12, v19, v18, v17, v16, v13, v14, v15);
    std::__tree<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::__map_value_compare<std::array<unsigned char,16ul>,std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>,std::less<std::array<unsigned char,16ul>>,true>,std::allocator<std::__value_type<std::array<unsigned char,16ul>,ARTexturedPlane>>>::destroy((uint64_t)v20, v21);

    [a1[4] timestamp];
    kdebug_trace();
  }
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AREnvironmentTexturingTechnique;
  if ([(ARTechnique *)&v11 isEqual:v4])
  {
    uint64_t v5 = [(AREnvironmentTexturingTechnique *)self probeManager];
    uint64_t v6 = [v5 mode];
    int v7 = [v4 probeManager];
    if (v6 == [v7 mode])
    {
      int wantsHDREnvironmentTextures = self->_wantsHDREnvironmentTextures;
      BOOL v9 = wantsHDREnvironmentTextures == [v4 wantsHDREnvironmentTextures];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_fullDescription
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)AREnvironmentTexturingTechnique;
  id v4 = [(ARTechnique *)&v10 _fullDescription];
  uint64_t v5 = [v3 stringWithFormat:@"%@\n", v4];

  uint64_t v6 = [(ARPlaneWorld *)self->_planeWorld _fullDescription];
  [v5 appendFormat:@"PlaneWorld: %@\n", v6];

  int v7 = [(AREnvironmentTexturingTechnique *)self probeManager];
  double v8 = [v7 _fullDescription];
  [v5 appendFormat:@"ProbManager: %@\n", v8];

  return v5;
}

- (BOOL)wantsHDREnvironmentTextures
{
  return self->_wantsHDREnvironmentTextures;
}

- (AREnvironmentProbeManager)probeManager
{
  return (AREnvironmentProbeManager *)objc_getProperty(self, a2, 104, 1);
}

- (void)setProbeManager:(id)a3
{
}

- (BOOL)networkIntialized
{
  return self->_networkIntialized;
}

- (void)setNetworkIntialized:(BOOL)a3
{
  self->_networkIntialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probeManager, 0);
  objc_storeStrong((id *)&self->_ultraWideSemaphore, 0);
  objc_storeStrong((id *)&self->_ultraWide, 0);
  objc_storeStrong((id *)&self->_networkPrewarmQueue, 0);
  objc_storeStrong((id *)&self->_planeUpdateQueue, 0);
  objc_storeStrong((id *)&self->_planeWorld, 0);
}

@end