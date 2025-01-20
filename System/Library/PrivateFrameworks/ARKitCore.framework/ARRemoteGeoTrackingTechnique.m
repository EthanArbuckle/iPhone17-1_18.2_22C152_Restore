@interface ARRemoteGeoTrackingTechnique
- (ARRemoteGeoTrackingTechnique)init;
- (ARRemoteGeoTrackingTechnique)initWithServerConnection:(id)a3;
- (BOOL)reconfigurableFrom:(id)a3;
- (BOOL)visualLocalizationUpdatesRequested;
- (__n128)getLocationFromWorldPosition:(__n128 *)a3@<X8> error:(__n128)a4@<Q0>;
- (double)posteriorVisualLocalizationCallInterval;
- (double)visualLocalizationCallInterval;
- (double)visualLocalizationCallIntervalTimeThreshold;
- (unint64_t)requiredSensorDataTypes;
- (unint64_t)supportEnablementOptions;
- (void)reconfigureFrom:(id)a3;
- (void)setPosteriorVisualLocalizationCallInterval:(double)a3;
- (void)setSupportEnablementOptions:(unint64_t)a3;
- (void)setVisualLocalizationCallInterval:(double)a3;
- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3;
- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3;
@end

@implementation ARRemoteGeoTrackingTechnique

- (ARRemoteGeoTrackingTechnique)init
{
  v3.receiver = self;
  v3.super_class = (Class)ARRemoteGeoTrackingTechnique;
  return [(ARRemoteTechnique *)&v3 initWithServiceName:@"com.apple.arkit.service.geoTracking"];
}

- (ARRemoteGeoTrackingTechnique)initWithServerConnection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARRemoteGeoTrackingTechnique;
  v5 = [(ARRemoteTechnique *)&v9 initWithServerConnection:v4];
  if (v5)
  {
    v6 = ARRemoteTechniqueClientInterfaceWithProtocol((uint64_t)&unk_1F12859E0);
    [v4 setExportedInterface:v6];

    v7 = ARRemoteTechniqueServiceInterfaceWithProtocol((uint64_t)&unk_1F1285A40);
    [v4 setRemoteObjectInterface:v7];
  }
  return v5;
}

- (BOOL)reconfigurableFrom:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (void)reconfigureFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_ARLogTechnique_onceToken_21 != -1) {
    dispatch_once(&_ARLogTechnique_onceToken_21, &__block_literal_global_123);
  }
  v5 = (void *)_ARLogTechnique_logObj_21;
  if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj_21, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring existing remote geo tracking technique.", (uint8_t *)&v11, 0x16u);
  }
  id v9 = v4;
  [v9 visualLocalizationCallInterval];
  -[ARRemoteGeoTrackingTechnique setVisualLocalizationCallInterval:](self, "setVisualLocalizationCallInterval:");
  [v9 posteriorVisualLocalizationCallInterval];
  -[ARRemoteGeoTrackingTechnique setPosteriorVisualLocalizationCallInterval:](self, "setPosteriorVisualLocalizationCallInterval:");
  [v9 visualLocalizationCallIntervalTimeThreshold];
  -[ARRemoteGeoTrackingTechnique setVisualLocalizationCallIntervalTimeThreshold:](self, "setVisualLocalizationCallIntervalTimeThreshold:");
  uint64_t v10 = [v9 visualLocalizationUpdatesRequested];

  [(ARRemoteGeoTrackingTechnique *)self setVisualLocalizationUpdatesRequested:v10];
}

- (__n128)getLocationFromWorldPosition:(__n128 *)a3@<X8> error:(__n128)a4@<Q0>
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  __n128 v19 = a4;
  uint64_t v20 = 0;
  v21 = (__n128 *)&v20;
  uint64_t v22 = 0x4020000000;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v19 length:16];
  v8 = [a1 serviceProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__ARRemoteGeoTrackingTechnique_getLocationFromWorldPosition_error___block_invoke;
  v12[3] = &unk_1E61885E0;
  v12[4] = &v20;
  v12[5] = &v13;
  [v8 getLocationFromWorldPosition:v7 reply:v12];

  if (a2) {
    *a2 = (id) v14[5];
  }
  __n128 v10 = v21[3];
  __n128 v11 = v21[2];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v20, 8);
  __n128 result = v11;
  *a3 = v11;
  a3[1] = v10;
  return result;
}

void __67__ARRemoteGeoTrackingTechnique_getLocationFromWorldPosition_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  ARVector3dFromNSData(a2, v10);
  long long v6 = v10[1];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v7 + 32) = v10[0];
  *(_OWORD *)(v7 + 48) = v6;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (unint64_t)requiredSensorDataTypes
{
  return 79;
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 setVisualLocalizationCallInterval:a3];
}

- (double)visualLocalizationCallInterval
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__ARRemoteGeoTrackingTechnique_visualLocalizationCallInterval__block_invoke;
  v5[3] = &unk_1E6186D78;
  v5[4] = &v6;
  [v2 visualLocalizationCallIntervalWithReply:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __62__ARRemoteGeoTrackingTechnique_visualLocalizationCallInterval__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setPosteriorVisualLocalizationCallInterval:(double)a3
{
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 setPosteriorVisualLocalizationCallInterval:a3];
}

- (double)posteriorVisualLocalizationCallInterval
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__ARRemoteGeoTrackingTechnique_posteriorVisualLocalizationCallInterval__block_invoke;
  v5[3] = &unk_1E6186D78;
  v5[4] = &v6;
  [v2 posteriorVisualLocalizationCallIntervalWithReply:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__ARRemoteGeoTrackingTechnique_posteriorVisualLocalizationCallInterval__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3
{
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 setVisualLocalizationCallIntervalTimeThreshold:a3];
}

- (double)visualLocalizationCallIntervalTimeThreshold
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __75__ARRemoteGeoTrackingTechnique_visualLocalizationCallIntervalTimeThreshold__block_invoke;
  v5[3] = &unk_1E6186D78;
  v5[4] = &v6;
  [v2 visualLocalizationCallIntervalTimeThresholdWithReply:v5];

  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__ARRemoteGeoTrackingTechnique_visualLocalizationCallIntervalTimeThreshold__block_invoke(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 setVisualLocalizationUpdatesRequested:v3];
}

- (BOOL)visualLocalizationUpdatesRequested
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 1;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__ARRemoteGeoTrackingTechnique_visualLocalizationUpdatesRequested__block_invoke;
  v4[3] = &unk_1E6186CD8;
  v4[4] = &v5;
  [v2 visualLocalizationUpdatesRequestedWithReply:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __66__ARRemoteGeoTrackingTechnique_visualLocalizationUpdatesRequested__block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  id v4 = [(ARRemoteTechnique *)self serviceProxy];
  [v4 setSupportEnablementOptions:a3];
}

- (unint64_t)supportEnablementOptions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v2 = [(ARRemoteTechnique *)self serviceProxy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ARRemoteGeoTrackingTechnique_supportEnablementOptions__block_invoke;
  v5[3] = &unk_1E6186D50;
  v5[4] = &v6;
  [v2 supportEnablementOptionsWithReply:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__ARRemoteGeoTrackingTechnique_supportEnablementOptions__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

@end