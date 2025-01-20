@interface ARGeoTrackingTechniqueService
+ (id)serviceName;
- (ARGeoTrackingTechniqueService)initWithConnection:(id)a3;
- (id)processData:(id)a3;
- (id)processDeviceOrientationData:(id)a3;
- (id)processLocationData:(id)a3;
- (void)getLocationFromWorldPosition:(id)a3 reply:(id)a4;
- (void)posteriorVisualLocalizationCallIntervalWithReply:(id)a3;
- (void)setPosteriorVisualLocalizationCallInterval:(double)a3;
- (void)setSupportEnablementOptions:(unint64_t)a3;
- (void)setVisualLocalizationCallInterval:(double)a3;
- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3;
- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3;
- (void)supportEnablementOptionsWithReply:(id)a3;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6;
- (void)visualLocalizationCallIntervalTimeThresholdWithReply:(id)a3;
- (void)visualLocalizationCallIntervalWithReply:(id)a3;
- (void)visualLocalizationUpdatesRequestedWithReply:(id)a3;
@end

@implementation ARGeoTrackingTechniqueService

- (ARGeoTrackingTechniqueService)initWithConnection:(id)a3
{
  id v4 = a3;
  v5 = ARRemoteGeoTrackingTechniqueServiceInterface();
  v6 = ARRemoteGeoTrackingTechniqueClientInterface();
  v13.receiver = self;
  v13.super_class = (Class)ARGeoTrackingTechniqueService;
  v7 = [(ARTechniqueService *)&v13 initWithConnection:v4 exportedInterface:v5 remoteObjectInterface:v6];

  if (v7)
  {
    v8 = [v4 remoteObjectProxy];
    [(ARTechniqueService *)v7 setClientProxy:v8];

    v9 = (void *)[objc_alloc(MEMORY[0x263F41720]) initWithNSXPCConnection:v4];
    v10 = (void *)[objc_alloc(MEMORY[0x263F20EB8]) initWithAuditToken:v9];
    [(ARTechniqueService *)v7 setTechnique:v10];

    v11 = [(ARTechniqueService *)v7 technique];
    [v11 setDelegate:v7];
  }
  return v7;
}

- (id)processLocationData:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(ARDaemonService *)self isActive])
  {
    v19 = _ARLogDaemon_5();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      *(_DWORD *)buf = 138543874;
      v31 = v21;
      __int16 v32 = 2048;
      v33 = self;
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl(&dword_24719A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping processing of location data: %@",
        buf,
        0x20u);
    }
    v22 = (ARLocationData *)v4;
    goto LABEL_13;
  }
  if (self->_lastProcessedLocationData)
  {
    [v4 timestamp];
    double v6 = v5;
    [(ARLocationData *)self->_lastProcessedLocationData timestamp];
    if (v6 <= v7)
    {
      v23 = _ARLogDaemon_5();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        int v26 = [v4 isSecure];
        [v4 timestamp];
        *(_DWORD *)buf = 138544386;
        v31 = v25;
        __int16 v32 = 2048;
        v33 = self;
        __int16 v34 = 2048;
        id v35 = v4;
        __int16 v36 = 1024;
        *(_DWORD *)v37 = v26;
        *(_WORD *)&v37[4] = 2048;
        *(void *)&v37[6] = v27;
        _os_log_impl(&dword_24719A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processLocationData - Already processed locationData (%p), isSecure: %d, timestamp: %f", buf, 0x30u);
      }
      v22 = self->_lastProcessedLocationData;
LABEL_13:
      v18 = v22;
      goto LABEL_14;
    }
  }
  v8 = _ARLogDaemon_5();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    int v11 = [v4 isSecure];
    [v4 timestamp];
    *(_DWORD *)buf = 138544642;
    v31 = v10;
    __int16 v32 = 2048;
    v33 = self;
    __int16 v34 = 2048;
    id v35 = v4;
    __int16 v36 = 2112;
    *(void *)v37 = v4;
    *(_WORD *)&v37[8] = 1024;
    *(_DWORD *)&v37[10] = v11;
    __int16 v38 = 2048;
    uint64_t v39 = v12;
    _os_log_impl(&dword_24719A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processLocationData - Processing locationData (%p): %@, isSecure: %d, timestamp: %f", buf, 0x3Au);
  }
  objc_super v13 = [(ARDaemonService *)self dataSource];
  v14 = [v13 service:self peerServiceOfType:objc_opt_class()];

  v15 = [v14 updateFromLocationData:v4];
  lastProcessedLocationData = self->_lastProcessedLocationData;
  self->_lastProcessedLocationData = v15;

  v17 = self->_lastProcessedLocationData;
  v29.receiver = self;
  v29.super_class = (Class)ARGeoTrackingTechniqueService;
  v18 = [(ARTechniqueService *)&v29 processData:v17];

LABEL_14:
  return v18;
}

- (id)processDeviceOrientationData:(id)a3
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(ARDaemonService *)self isActive])
  {
    v18 = _ARLogDaemon_5();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      *(_DWORD *)buf = 138543874;
      objc_super v29 = v20;
      __int16 v30 = 2048;
      v31 = self;
      __int16 v32 = 2112;
      id v33 = v4;
      _os_log_impl(&dword_24719A000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Service not active; skipping processing of device orientation data: %@",
        buf,
        0x20u);
    }
    v21 = (ARDeviceOrientationData *)v4;
    goto LABEL_13;
  }
  if (self->_lastProcessedDeviceOrientationData)
  {
    [v4 timestamp];
    double v6 = v5;
    [(ARDeviceOrientationData *)self->_lastProcessedDeviceOrientationData timestamp];
    if (v6 <= v7)
    {
      v22 = _ARLogDaemon_5();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = (objc_class *)objc_opt_class();
        v24 = NSStringFromClass(v23);
        [v4 timestamp];
        *(_DWORD *)buf = 138544130;
        objc_super v29 = v24;
        __int16 v30 = 2048;
        v31 = self;
        __int16 v32 = 2048;
        id v33 = v4;
        __int16 v34 = 2048;
        id v35 = v25;
        _os_log_impl(&dword_24719A000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processDeviceOrientationData - Already processed data (%p), timestamp: %f", buf, 0x2Au);
      }
      v21 = self->_lastProcessedDeviceOrientationData;
LABEL_13:
      v17 = v21;
      goto LABEL_14;
    }
  }
  v8 = _ARLogDaemon_5();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v4 timestamp];
    *(_DWORD *)buf = 138544386;
    objc_super v29 = v10;
    __int16 v30 = 2048;
    v31 = self;
    __int16 v32 = 2048;
    id v33 = v4;
    __int16 v34 = 2112;
    id v35 = v4;
    __int16 v36 = 2048;
    uint64_t v37 = v11;
    _os_log_impl(&dword_24719A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: processDeviceOrientationData - Processing data (%p): %@, timestamp: %f", buf, 0x34u);
  }
  uint64_t v12 = [(ARDaemonService *)self dataSource];
  objc_super v13 = [v12 service:self peerServiceOfType:objc_opt_class()];

  v14 = [v13 updateFromDeviceOrientationData:v4];
  lastProcessedDeviceOrientationData = self->_lastProcessedDeviceOrientationData;
  self->_lastProcessedDeviceOrientationData = v14;

  v16 = self->_lastProcessedDeviceOrientationData;
  v27.receiver = self;
  v27.super_class = (Class)ARGeoTrackingTechniqueService;
  v17 = [(ARTechniqueService *)&v27 processData:v16];

LABEL_14:
  return v17;
}

- (void)getLocationFromWorldPosition:(id)a3 reply:(id)a4
{
  double v5 = (void (**)(id, void *, id))a4;
  ARVector3FromNSData();
  double v15 = v6;
  double v7 = [(ARTechniqueService *)self technique];
  v9 = v7;
  id v19 = 0;
  if (v7)
  {
    [v7 getLocationFromWorldPosition:&v19 error:v15];
    id v10 = v19;
    int8x16_t v16 = v17;
    int8x16_t v8 = vextq_s8(v16, v16, 8uLL);
    uint64_t v14 = v8.i64[0];
    v8.i64[0] = v18;
  }
  else
  {
    id v10 = 0;
    v16.i64[0] = 0;
    uint64_t v14 = 0;
    v8.i64[0] = 0;
  }
  int8x16_t v13 = v8;

  *(void *)&long long v11 = v16.i64[0];
  *((void *)&v11 + 1) = v14;
  v20[0] = v11;
  v20[1] = v13;
  uint64_t v12 = [MEMORY[0x263EFF8F8] dataWithBytes:v20 length:32];
  v5[2](v5, v12, v10);
}

- (void)setVisualLocalizationCallInterval:(double)a3
{
  id v4 = [(ARTechniqueService *)self technique];
  [v4 setVisualLocalizationCallInterval:a3];
}

- (void)visualLocalizationCallIntervalWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(ARTechniqueService *)self technique];
  [v6 visualLocalizationCallInterval];
  (*((void (**)(id, void))a3 + 2))(v5, 0);
}

- (void)setPosteriorVisualLocalizationCallInterval:(double)a3
{
  id v4 = [(ARTechniqueService *)self technique];
  [v4 setPosteriorVisualLocalizationCallInterval:a3];
}

- (void)posteriorVisualLocalizationCallIntervalWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(ARTechniqueService *)self technique];
  [v6 posteriorVisualLocalizationCallInterval];
  (*((void (**)(id, void))a3 + 2))(v5, 0);
}

- (void)setVisualLocalizationCallIntervalTimeThreshold:(double)a3
{
  id v4 = [(ARTechniqueService *)self technique];
  [v4 setVisualLocalizationCallIntervalTimeThreshold:a3];
}

- (void)visualLocalizationCallIntervalTimeThresholdWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(ARTechniqueService *)self technique];
  [v6 visualLocalizationCallIntervalTimeThreshold];
  (*((void (**)(id, void))a3 + 2))(v5, 0);
}

- (void)setVisualLocalizationUpdatesRequested:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ARTechniqueService *)self technique];
  [v4 setVisualLocalizationUpdatesRequested:v3];
}

- (void)visualLocalizationUpdatesRequestedWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(ARTechniqueService *)self technique];
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, [v6 visualLocalizationUpdatesRequested], 0);
}

- (void)setSupportEnablementOptions:(unint64_t)a3
{
  id v4 = [(ARTechniqueService *)self technique];
  [v4 setSupportEnablementOptions:a3];
}

- (void)supportEnablementOptionsWithReply:(id)a3
{
  id v5 = a3;
  id v6 = [(ARTechniqueService *)self technique];
  (*((void (**)(id, uint64_t, void))a3 + 2))(v5, [v6 supportEnablementOptions], 0);
}

+ (id)serviceName
{
  return (id)*MEMORY[0x263F20E20];
}

- (id)processData:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [(ARGeoTrackingTechniqueService *)self processLocationData:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ARGeoTrackingTechniqueService *)self processDeviceOrientationData:v4];
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)ARGeoTrackingTechniqueService;
      uint64_t v5 = [(ARTechniqueService *)&v8 processData:v4];
    }
  }
  id v6 = (void *)v5;

  return v6;
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v42 = a6;
  id v10 = [(ARDaemonService *)self dataSource];
  long long v11 = [v10 service:self peerServiceOfType:objc_opt_class()];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v47 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v48;
    unint64_t v16 = 0x263F20000uLL;
    id v43 = v12;
    uint64_t v44 = *(void *)v48;
    do
    {
      uint64_t v17 = 0;
      uint64_t v45 = v14;
      do
      {
        if (*(void *)v48 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v18 = *(void **)(*((void *)&v47 + 1) + 8 * v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v19 = v18;
          v20 = [v19 localizationResult];

          if (v20)
          {
            v21 = _ARLogDaemon_5();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v22 = (objc_class *)objc_opt_class();
              v23 = NSStringFromClass(v22);
              [v19 heading];
              *(_DWORD *)buf = 138543875;
              v52 = v23;
              __int16 v53 = 2048;
              v54 = self;
              __int16 v55 = 2049;
              v56 = v24;
              _os_log_impl(&dword_24719A000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: vlHeading,%{private}f", buf, 0x20u);
            }
            v25 = _ARLogDaemon_5();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              int v26 = (objc_class *)objc_opt_class();
              objc_super v27 = NSStringFromClass(v26);
              [v19 location];
              objc_super v29 = v28 = v11;
              [v29 coordinate];
              v31 = v30;
              [v19 location];
              v33 = unint64_t v32 = v16;
              [v33 coordinate];
              id v35 = v34;
              __int16 v36 = [v19 location];
              [v36 altitude];
              *(_DWORD *)buf = 138544387;
              v52 = v27;
              __int16 v53 = 2048;
              v54 = self;
              __int16 v55 = 2049;
              v56 = v31;
              __int16 v57 = 2049;
              v58 = v35;
              __int16 v59 = 2049;
              id v60 = v37;
              _os_log_impl(&dword_24719A000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: vlLocation,%{private}lf,%{private}lf,%{private}lf", buf, 0x34u);

              uint64_t v14 = v45;
              unint64_t v16 = v32;

              long long v11 = v28;
              id v12 = v43;
              uint64_t v15 = v44;
            }
            uint64_t v38 = _ARLogDaemon_5();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v39 = (objc_class *)objc_opt_class();
              uint64_t v40 = NSStringFromClass(v39);
              *(_DWORD *)buf = 138544642;
              v52 = v40;
              __int16 v53 = 2048;
              v54 = self;
              __int16 v55 = 2048;
              v56 = v11;
              __int16 v57 = 2112;
              v58 = v11;
              __int16 v59 = 2112;
              id v60 = v19;
              __int16 v61 = 2048;
              double v62 = a5;
              _os_log_impl(&dword_24719A000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: technique:didOutputResultData: - Calling updateFromVisualLocalizationResult on locationSensorService (%p): %@, with visResult: %@, timestamp: %f", buf, 0x3Eu);

              uint64_t v14 = v45;
            }

            [v11 updateFromVisualLocalizationResult:v19];
          }
        }
        ++v17;
      }
      while (v14 != v17);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v47 objects:v63 count:16];
    }
    while (v14);
  }

  v41 = [(ARTechniqueService *)self technique];
  v46.receiver = self;
  v46.super_class = (Class)ARGeoTrackingTechniqueService;
  [(ARTechniqueService *)&v46 technique:v41 didOutputResultData:v12 timestamp:v42 context:a5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastProcessedDeviceOrientationData, 0);
  objc_storeStrong((id *)&self->_lastProcessedLocationData, 0);
}

@end