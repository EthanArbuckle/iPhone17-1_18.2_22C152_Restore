@interface GCDeviceHaptics
- (CHHapticEngine)createEngineWithLocality:(GCHapticsLocality)locality;
- (GCController)controller;
- (GCDeviceHaptics)initWithCapabilityGraph:(id)a3;
- (GCHapticCapabilityGraph)capabilityGraph;
- (NSSet)supportedLocalities;
- (void)setController:(id)a3;
- (void)setSupportedLocalities:(id)a3;
@end

@implementation GCDeviceHaptics

- (CHHapticEngine)createEngineWithLocality:(GCHapticsLocality)locality
{
  v4 = locality;
  if (v4 && [(NSMutableSet *)self->_supportedLocalities containsObject:v4])
  {
    v5 = [(GCHapticCapabilityGraph *)self->_capabilityGraph nodes];
    v6 = [v5 objectForKeyedSubscript:v4];

    uint64_t v7 = GCCurrentProcessLinkedOnAfter(0x7E70901FFFFFFFFuLL) ^ 1;
    v42[0] = @"com.apple.GameController.gamecontrollerd.haptics";
    v41[0] = @"MachServiceName";
    v41[1] = @"actuators";
    v37 = v6;
    v36 = [v6 actuators];
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v36 requiringSecureCoding:1 error:0];
    v42[1] = v8;
    v41[2] = @"controllerIdentifier";
    v34 = self;
    p_controller = &self->_controller;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
    v11 = [WeakRetained identifier];
    v42[2] = v11;
    v41[3] = @"persistentControllerIdentifier";
    id v12 = objc_loadWeakRetained((id *)p_controller);
    v13 = [v12 persistentIdentifier];
    v42[3] = v13;
    v41[4] = @"controllerProductCategory";
    location = (id *)p_controller;
    id v14 = objc_loadWeakRetained((id *)p_controller);
    v15 = [v14 productCategory];
    v42[4] = v15;
    v41[5] = @"shouldSquareContinuousIntensity";
    v16 = +[NSNumber numberWithBool:v7];
    v42[5] = v16;
    v17 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:6];

    if (gc_isInternalBuild())
    {
      v31 = getGCLogger();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v17;
        _os_log_impl(&dword_220998000, v31, OS_LOG_TYPE_DEFAULT, "Creating CHHapticEngine with options %@", buf, 0xCu);
      }
    }
    id v38 = 0;
    v18 = (void *)[objc_alloc((Class)&off_26D2BF338) initWithOptions:v17 error:&v38];
    id v19 = v38;
    int isInternalBuild = gc_isInternalBuild();
    if (v19)
    {
      if (isInternalBuild)
      {
        v32 = getGCLogger();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          [(GCDeviceHaptics *)(uint64_t)v17 createEngineWithLocality:v32];
        }
      }
      v21 = +[GCAnalytics instance];
      v22 = currentProcessBundleIdentifier();
      id v23 = objc_loadWeakRetained(location);
      v24 = [v23 productCategory];
      [v21 sendHapticsErrorRaisedEventFromSource:v22 productCategory:v24 errorType:@"CHHapticEngineCreationFailure"];

      id v25 = 0;
    }
    else
    {
      if (isInternalBuild)
      {
        v33 = getGCLogger();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v18;
          _os_log_impl(&dword_220998000, v33, OS_LOG_TYPE_DEFAULT, "Created CHHapticEngine %@", buf, 0xCu);
        }
      }
      v26 = +[GCAnalytics instance];
      v27 = currentProcessBundleIdentifier();
      v28 = [(GCDeviceHaptics *)v34 controller];
      v29 = [v28 productCategory];
      [v26 sendHapticsEngineCreatedEventForBundleID:v27 productCategory:v29 hapticsLocality:v4];

      id v25 = v18;
    }
  }
  else
  {
    id v25 = 0;
  }

  return (CHHapticEngine *)v25;
}

- (NSSet)supportedLocalities
{
  return &self->_supportedLocalities->super;
}

- (void)setSupportedLocalities:(id)a3
{
}

- (GCController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (GCController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_supportedLocalities, 0);

  objc_storeStrong((id *)&self->_capabilityGraph, 0);
}

- (GCDeviceHaptics)initWithCapabilityGraph:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCDeviceHaptics;
  v6 = [(GCDeviceHaptics *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_capabilityGraph, a3);
    v8 = [v5 exposedCapabilities];
    uint64_t v9 = [v8 copy];
    supportedLocalities = v7->_supportedLocalities;
    v7->_supportedLocalities = (NSMutableSet *)v9;
  }
  return v7;
}

- (GCHapticCapabilityGraph)capabilityGraph
{
  return self->_capabilityGraph;
}

- (void)createEngineWithLocality:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_220998000, log, OS_LOG_TYPE_ERROR, "Error creating CHHapticEngine with options %@ - %@", (uint8_t *)&v3, 0x16u);
}

@end