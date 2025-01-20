@interface CMContinuityCaptureVideoStream
- (BOOL)_setStreamProperties:(id)a3 error:(id *)a4;
- (BOOL)_startStreamAndReturnError:(id *)a3;
- (BOOL)_stopStreamAndReturnError:(id *)a3;
- (BOOL)authorizedToStartStreamForClient:(id)a3;
- (BOOL)setStreamProperties:(id)a3 error:(id *)a4;
- (BOOL)setupStreams:(id)a3;
- (BOOL)startStreamAndReturnError:(id *)a3;
- (BOOL)stopStreamAndReturnError:(id *)a3;
- (CMContinuityCaptureVideoDevice)device;
- (CMContinuityCaptureVideoStream)initWithDevice:(id)a3 streamFormats:(id)a4 deviceID:(id)a5 queue:(id)a6;
- (NSArray)formats;
- (NSSet)availableProperties;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (id)_availableProperties;
- (id)_getResolvedStillCaptureConfigs:(id)a3;
- (id)_streamPropertiesForProperties:(id)a3 error:(id *)a4;
- (id)createFormatToPublish:(id)a3;
- (id)debugInfo;
- (id)streamPropertiesForProperties:(id)a3 error:(id *)a4;
- (void)_availableProperties;
- (void)_disconnectClient:(id)a3;
- (void)_setValueForControl:(id)a3 completion:(id)a4;
- (void)captureAsyncStillImage:(int64_t)a3 options:(id)a4 completionHandler:(id)a5;
- (void)disconnectClient:(id)a3;
- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5;
- (void)enqueueReactionEffect:(id)a3 completionHandler:(id)a4;
- (void)setValueForControl:(id)a3 completion:(id)a4;
- (void)setupControls;
- (void)terminateComplete:(id)a3;
@end

@implementation CMContinuityCaptureVideoStream

- (CMContinuityCaptureVideoStream)initWithDevice:(id)a3 streamFormats:(id)a4 deviceID:(id)a5 queue:(id)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v37 = a5;
  id v12 = a6;
  id obj = v10;
  v13 = [v10 compositeDelegate];
  objc_storeWeak((id *)&self->_compositeDevice, v13);

  v14 = NSString;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDevice);
  v16 = [WeakRetained client];
  v17 = [v16 device];
  v18 = [v17 deviceName];
  v19 = [v14 stringWithFormat:@"CMContinuityCaptureVideoStream-%@", v18];
  id v20 = objc_alloc_init(MEMORY[0x263F08C38]);
  v38.receiver = self;
  v38.super_class = (Class)CMContinuityCaptureVideoStream;
  v21 = [(CMIOExtensionStream *)&v38 initWithLocalizedName:v19 streamID:v20 direction:0 clockType:0 source:self];

  if (v21)
  {
    objc_storeStrong((id *)&v21->_queue, a6);
    v22 = CMContinuityCaptureLog(2);
    v23 = v11;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v21;
      __int16 v41 = 2112;
      id v42 = v11;
      _os_log_impl(&dword_235FC2000, v22, OS_LOG_TYPE_DEFAULT, " %@ setup stream for formats %@", buf, 0x16u);
    }

    v24 = obj;
    if (v21->_queue)
    {
      objc_storeWeak((id *)&v21->_device, obj);
      v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      cmControlByName = v21->_cmControlByName;
      v21->_cmControlByName = v25;

      v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      clientsRequestingBooleanControlOnByControlName = v21->_clientsRequestingBooleanControlOnByControlName;
      v21->_clientsRequestingBooleanControlOnByControlName = v27;

      if ([(CMContinuityCaptureVideoStream *)v21 setupStreams:v23])
      {
        v29 = v37;
        uint64_t v30 = [v37 copy];
        deviceID = v21->_deviceID;
        v21->_deviceID = (NSString *)v30;

        [(CMContinuityCaptureVideoStream *)v21 setupControls];
        v32 = v21;
      }
      else
      {
        v35 = CMContinuityCaptureLog(2);
        v29 = v37;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          -[CMContinuityCaptureVideoStream initWithDevice:streamFormats:deviceID:queue:]();
        }

        v32 = 0;
      }
    }
    else
    {
      v34 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[CMContinuityCaptureVideoStream initWithDevice:streamFormats:deviceID:queue:]();
      }

      v32 = 0;
      v29 = v37;
    }
  }
  else
  {
    v32 = 0;
    v23 = v11;
    v24 = obj;
    v29 = v37;
  }

  return v32;
}

- (void)terminateComplete:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = (void (**)(void))a3;
  v5 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    v7 = self;
    __int16 v8 = 2080;
    v9 = "-[CMContinuityCaptureVideoStream terminateComplete:]";
    _os_log_impl(&dword_235FC2000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  v4[2](v4);
}

- (CMContinuityCaptureVideoDevice)device
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);
  return (CMContinuityCaptureVideoDevice *)WeakRetained;
}

- (void)disconnectClient:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = [(CMContinuityCaptureVideoStream *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CMContinuityCaptureVideoStream_disconnectClient___block_invoke;
  block[3] = &unk_264C99120;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__CMContinuityCaptureVideoStream_disconnectClient___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _disconnectClient:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_disconnectClient:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v36 = self;
  id location = (id *)&self->_device;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412547;
      id v42 = self;
      __int16 v43 = 2113;
      *(void *)v44 = v4;
      _os_log_impl(&dword_235FC2000, v6, OS_LOG_TYPE_INFO, "%@ Client %{private}@ has disconnected.", buf, 0x16u);
    }

    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v7 = self->_clientsRequestingBooleanControlOnByControlName;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v37 objects:v47 count:16];
    if (v8)
    {
      uint64_t v10 = v8;
      id WeakRetained = 0;
      uint64_t v11 = *(void *)v38;
      *(void *)&long long v9 = 138412546;
      long long v33 = v9;
      do
      {
        uint64_t v12 = 0;
        uint64_t v35 = v10;
        do
        {
          if (*(void *)v38 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v37 + 1) + 8 * v12);
          v14 = -[NSMutableDictionary objectForKeyedSubscript:](v36->_clientsRequestingBooleanControlOnByControlName, "objectForKeyedSubscript:", v13, v33);
          if ([v14 containsObject:v4])
          {
            uint64_t v15 = v11;
            [v14 removeObject:v4];
            v16 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              int v17 = [v14 count];
              *(_DWORD *)buf = 138413059;
              id v42 = v36;
              __int16 v43 = 2113;
              *(void *)v44 = v4;
              *(_WORD *)&v44[8] = 2112;
              *(void *)&v44[10] = v13;
              __int16 v45 = 1024;
              int v46 = v17;
              _os_log_impl(&dword_235FC2000, v16, OS_LOG_TYPE_INFO, "%@ Client %{private}@ no longer needs %@ on. %d total clients.", buf, 0x26u);
            }

            uint64_t v18 = [v14 count];
            v19 = CMContinuityCaptureLog(2);
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
            if (v18)
            {
              uint64_t v11 = v15;
              if (v20)
              {
                int v21 = [v14 count];
                *(_DWORD *)buf = 138412802;
                id v42 = v36;
                __int16 v43 = 1024;
                *(_DWORD *)v44 = v21;
                *(_WORD *)&v44[4] = 2112;
                *(void *)&v44[6] = v13;
                _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_INFO, "%@ There are still %d clients that want %@ on. Keeping on.", buf, 0x1Cu);
              }
            }
            else
            {
              if (v20)
              {
                *(_DWORD *)buf = v33;
                id v42 = v36;
                __int16 v43 = 2112;
                *(void *)v44 = v13;
                _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_INFO, "%@ No more clients need %@ on. Turning off.", buf, 0x16u);
              }
              v23 = v7;

              v19 = [(NSMutableDictionary *)v36->_cmControlByName objectForKeyedSubscript:v13];
              v24 = [NSNumber numberWithBool:0];
              [v19 setValue:v24];

              id v25 = objc_loadWeakRetained(location);
              [v25 setValueForControl:v19 completion:0];

              if (!WeakRetained) {
                id WeakRetained = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              v26 = (void *)MEMORY[0x263F016E0];
              [NSNumber numberWithBool:0];
              v28 = v27 = WeakRetained;
              v29 = [v26 propertyStateWithValue:v28];
              [v27 setObject:v29 forKeyedSubscript:v13];

              id WeakRetained = v27;
              v7 = v23;
              uint64_t v11 = v15;
            }
            uint64_t v10 = v35;
          }
          else
          {
            v19 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              int v22 = [v14 count];
              *(_DWORD *)buf = 138413059;
              id v42 = v36;
              __int16 v43 = 2113;
              *(void *)v44 = v4;
              *(_WORD *)&v44[8] = 2112;
              *(void *)&v44[10] = v13;
              __int16 v45 = 1024;
              int v46 = v22;
              _os_log_impl(&dword_235FC2000, v19, OS_LOG_TYPE_INFO, "%@ Client %{private}@ didn't want %@ on. %d total clients.", buf, 0x26u);
            }
          }

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v37 objects:v47 count:16];
      }
      while (v10);
    }
    else
    {
      id WeakRetained = 0;
    }

    uint64_t v30 = [(NSMutableDictionary *)v36->_cmControlByName objectForKeyedSubscript:@"AsyncStillCaptureConfigurations"];
    if (v30)
    {
      [(NSMutableDictionary *)v36->_maxPhotoQualityPrioritizationByClients setObject:0 forKeyedSubscript:v4];
      v31 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        maxPhotoQualityPrioritizationByClients = v36->_maxPhotoQualityPrioritizationByClients;
        *(_DWORD *)buf = 138412546;
        id v42 = v36;
        __int16 v43 = 2112;
        *(void *)v44 = maxPhotoQualityPrioritizationByClients;
        _os_log_impl(&dword_235FC2000, v31, OS_LOG_TYPE_INFO, "%@ Updated maxPhotoQualityPrioritizationByClients to %@", buf, 0x16u);
      }
    }
    if (WeakRetained) {
      [(CMIOExtensionStream *)v36 notifyPropertiesChanged:WeakRetained];
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
}

- (void)setupControls
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v3 = [(CMContinuityCaptureVideoStream *)self device];
  id v4 = [v3 capabilities];
  id obja = [v4 controls];

  self->_activeFormatIndex = 0;
  v5 = [CMContinuityCaptureControl alloc];
  id v6 = [(CMContinuityCaptureVideoStream *)self device];
  uint64_t v7 = [v6 entity];
  uint64_t v8 = [(NSArray *)self->_continuityStreamFormats firstObject];
  long long v65 = xmmword_236059450;
  uint64_t v66 = 0;
  uint64_t v9 = [(CMContinuityCaptureControl *)v5 initWithName:@"ActiveFormat" attributes:0 entity:v7 minimumSupportedVersion:&v65 value:v8];

  v56 = (void *)v9;
  [(NSMutableDictionary *)self->_cmControlByName setObject:v9 forKeyedSubscript:@"ActiveFormat"];
  uint64_t v10 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"ActiveFormat"];
  [v3 setValueForControl:v10 completion:0];

  uint64_t v11 = [CMContinuityCaptureControl alloc];
  uint64_t v12 = [(CMContinuityCaptureVideoStream *)self device];
  uint64_t v13 = [v12 entity];
  v14 = NSNumber;
  uint64_t v15 = [(NSArray *)self->_continuityStreamFormats objectAtIndexedSubscript:self->_activeFormatIndex];
  v16 = objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "maxFrameRate"));
  long long v65 = xmmword_236059450;
  uint64_t v66 = 0;
  uint64_t v17 = [(CMContinuityCaptureControl *)v11 initWithName:@"CMIOExtensionPropertyStreamFrameDuration" attributes:0 entity:v13 minimumSupportedVersion:&v65 value:v16];

  v55 = (void *)v17;
  [(NSMutableDictionary *)self->_cmControlByName setObject:v17 forKeyedSubscript:@"CMIOExtensionPropertyStreamFrameDuration"];
  uint64_t v18 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"CMIOExtensionPropertyStreamFrameDuration"];
  [v3 setValueForControl:v18 completion:0];

  v19 = [CMContinuityCaptureControl alloc];
  BOOL v20 = [(CMContinuityCaptureVideoStream *)self device];
  uint64_t v21 = [v20 entity];
  int v22 = NSNumber;
  v23 = [(NSArray *)self->_continuityStreamFormats objectAtIndexedSubscript:self->_activeFormatIndex];
  v24 = objc_msgSend(v22, "numberWithUnsignedInt:", objc_msgSend(v23, "minFrameRate"));
  long long v65 = xmmword_236059450;
  uint64_t v66 = 0;
  uint64_t v25 = [(CMContinuityCaptureControl *)v19 initWithName:@"CMIOExtensionPropertyStreamMaxFrameDuration" attributes:0 entity:v21 minimumSupportedVersion:&v65 value:v24];

  v54 = (void *)v25;
  [(NSMutableDictionary *)self->_cmControlByName setObject:v25 forKeyedSubscript:@"CMIOExtensionPropertyStreamMaxFrameDuration"];
  v26 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:@"CMIOExtensionPropertyStreamMaxFrameDuration"];
  v60 = v3;
  [v3 setValueForControl:v26 completion:0];

  v27 = [CMContinuityCaptureControl alloc];
  v28 = [(CMContinuityCaptureVideoStream *)self device];
  uint64_t v29 = [v28 entity];
  long long v65 = xmmword_236059450;
  uint64_t v66 = 0;
  uint64_t v30 = [(CMContinuityCaptureControl *)v27 initWithName:@"ReactionsInProgress" attributes:0 entity:v29 minimumSupportedVersion:&v65 value:MEMORY[0x263EFFA68]];

  [(NSMutableDictionary *)self->_cmControlByName setObject:v30 forKeyedSubscript:@"ReactionsInProgress"];
  v31 = [MEMORY[0x263EFF9A0] dictionary];
  clientsRequestingBooleanControlOnByControlName = self->_clientsRequestingBooleanControlOnByControlName;
  self->_clientsRequestingBooleanControlOnByControlName = v31;

  long long v33 = [MEMORY[0x263EFF9A0] dictionary];
  maxPhotoQualityPrioritizationByClients = self->_maxPhotoQualityPrioritizationByClients;
  self->_maxPhotoQualityPrioritizationByClients = v33;

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = obja;
  uint64_t v35 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v62;
    do
    {
      uint64_t v38 = 0;
      uint64_t v57 = v36;
      do
      {
        if (*(void *)v62 != v37) {
          objc_enumerationMutation(obj);
        }
        long long v39 = *(void **)(*((void *)&v61 + 1) + 8 * v38);
        cmControlByName = self->_cmControlByName;
        __int16 v41 = [v39 name];
        [(NSMutableDictionary *)cmControlByName setObject:v39 forKeyedSubscript:v41];

        id v42 = [v39 name];
        LODWORD(cmControlByName) = [v42 isEqualToString:@"FaceDetectionEnabled"];

        if (cmControlByName)
        {
          __int16 v43 = [MEMORY[0x263EFF9C0] set];
          v44 = self->_clientsRequestingBooleanControlOnByControlName;
          __int16 v45 = v43;
          int v46 = @"FaceDetectionEnabled";
          goto LABEL_8;
        }
        v47 = [v39 name];
        int v48 = [v47 isEqualToString:@"AsyncStillCaptureEnabled"];

        if (v48)
        {
          __int16 v43 = [MEMORY[0x263EFF9C0] set];
          [(NSMutableDictionary *)self->_clientsRequestingBooleanControlOnByControlName setObject:v43 forKeyedSubscript:@"AsyncStillCaptureEnabled"];
LABEL_13:
          uint64_t v36 = v57;
          goto LABEL_14;
        }
        v49 = [v39 name];
        int v50 = [v49 isEqualToString:@"HumanBodyDetectionEnabled"];

        if (v50)
        {
          __int16 v43 = [MEMORY[0x263EFF9C0] set];
          [(NSMutableDictionary *)self->_clientsRequestingBooleanControlOnByControlName setObject:v43 forKeyedSubscript:@"HumanBodyDetectionEnabled"];
          goto LABEL_13;
        }
        v51 = [v39 name];
        int v52 = [v51 isEqualToString:@"HumanFullBodyDetectionEnabled"];

        uint64_t v36 = v57;
        if (v52)
        {
          __int16 v43 = [MEMORY[0x263EFF9C0] set];
          v44 = self->_clientsRequestingBooleanControlOnByControlName;
          __int16 v45 = v43;
          int v46 = @"HumanFullBodyDetectionEnabled";
LABEL_8:
          [(NSMutableDictionary *)v44 setObject:v45 forKeyedSubscript:v46];
LABEL_14:
        }
        [v60 setValueForControl:v39 completion:0];
        ++v38;
      }
      while (v36 != v38);
      uint64_t v53 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
      uint64_t v36 = v53;
    }
    while (v53);
  }
}

- (NSArray)formats
{
  return self->_extensionStreamFormats;
}

- (BOOL)setupStreams:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__CMContinuityCaptureVideoStream_setupStreams___block_invoke;
  v14[3] = &unk_264C99688;
  v14[4] = self;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  [v5 enumerateObjectsUsingBlock:v14];

  objc_storeStrong((id *)&self->_extensionStreamFormats, v6);
  objc_storeStrong((id *)&self->_continuityStreamFormats, v7);
  self->_activeFormatIndex = 0;
  extensionStreamFormats = self->_extensionStreamFormats;
  if (extensionStreamFormats && [(NSArray *)extensionStreamFormats count])
  {
    BOOL v11 = 1;
  }
  else
  {
    uint64_t v13 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CMContinuityCaptureVideoStream setupStreams:]();
    }

    BOOL v11 = 0;
  }

  return v11;
}

void __47__CMContinuityCaptureVideoStream_setupStreams___block_invoke(id *a1, void *a2)
{
  id v4 = a2;
  id v3 = objc_msgSend(a1[4], "createFormatToPublish:");
  if (v3)
  {
    [a1[5] addObject:v3];
    [a1[6] addObject:v4];
  }
}

- (id)createFormatToPublish:(id)a3
{
  id v3 = a3;
  CMTimeMake(&v15, 1, [v3 maxFrameRate]);
  CMTimeValue value = v15.value;
  CMTimeEpoch epoch = v15.epoch;
  uint64_t v6 = *(void *)&v15.timescale;
  CMTimeMake(&v15, 1, [v3 minFrameRate]);
  CMTimeValue v7 = v15.value;
  CMTimeEpoch v8 = v15.epoch;
  uint64_t v9 = *(void *)&v15.timescale;
  id v10 = objc_alloc(MEMORY[0x263F016F8]);
  uint64_t v11 = [v3 formatDescription];

  v14[2] = epoch;
  v15.CMTimeValue value = v7;
  *(void *)&v15.timescale = v9;
  v15.CMTimeEpoch epoch = v8;
  v14[0] = value;
  v14[1] = v6;
  uint64_t v12 = (void *)[v10 initWithFormatDescription:v11 maxFrameDuration:&v15 minFrameDuration:v14 validFrameDurations:0];
  return v12;
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  int v5 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMTimeEpoch v8 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v17.value) = 138412802;
      *(CMTimeValue *)((char *)&v17.value + 4) = (CMTimeValue)self;
      LOWORD(v17.flags) = 2112;
      *(void *)((char *)&v17.flags + 2) = a3;
      HIWORD(v17.epoch) = 1024;
      int v18 = v5;
      _os_log_debug_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEBUG, "%@ dispatchFrame %@ entity %u", (uint8_t *)&v17, 0x1Cu);
    }
  }
  memset(&v17, 170, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a3);
  uint64_t v9 = CMGetAttachment(a3, @"ContinuityCaptureTimeDiscontinuity", 0);
  int v10 = [v9 BOOLValue];
  CMRemoveAttachment(a3, @"ContinuityCaptureTimeDiscontinuity");
  CFStringRef v11 = (const __CFString *)*MEMORY[0x263F2C5D8];
  uint64_t v12 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2C5D8], 0);
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v12];
    v14 = [NSDictionary dictionaryWithDictionary:v13];
    CMSetAttachment(a3, v11, v14, 1u);
  }
  if (v10) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  CMTime v16 = v17;
  [(CMIOExtensionStream *)self sendSampleBuffer:a3 discontinuity:v15 hostTimeInNanoseconds:(unint64_t)(CMTimeGetSeconds(&v16) * 1000000000.0)];
}

- (NSSet)availableProperties
{
  uint64_t v7 = 0;
  CMTimeEpoch v8 = &v7;
  uint64_t v9 = 0x3032000000;
  int v10 = __Block_byref_object_copy__2;
  CFStringRef v11 = __Block_byref_object_dispose__2;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__CMContinuityCaptureVideoStream_availableProperties__block_invoke;
  v6[3] = &unk_264C994B0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

uint64_t __53__CMContinuityCaptureVideoStream_availableProperties__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _availableProperties];
  return MEMORY[0x270F9A758]();
}

- (id)_availableProperties
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  [v3 addObject:*MEMORY[0x263F016B8]];
  id v4 = [(NSMutableDictionary *)self->_cmControlByName allKeys];
  [v3 addObjectsFromArray:v4];

  if ([v3 containsObject:@"ActiveFormat"]) {
    [v3 removeObject:@"ActiveFormat"];
  }
  if (CMContinityCaptureDebugLogEnabled())
  {
    int v5 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[CMContinuityCaptureVideoStream _availableProperties]();
    }
  }
  return v3;
}

- (id)streamPropertiesForProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  uint64_t v15 = 0;
  CMTime v16 = &v15;
  uint64_t v17 = 0x3032000000;
  int v18 = __Block_byref_object_copy__2;
  uint64_t v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__CMContinuityCaptureVideoStream_streamPropertiesForProperties_error___block_invoke;
  v11[3] = &unk_264C996B0;
  uint64_t v13 = &v21;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  v14 = &v15;
  dispatch_async_and_wait(queue, v11);

  if (a4) {
    *a4 = (id) v16[5];
  }
  id v9 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __70__CMContinuityCaptureVideoStream_streamPropertiesForProperties_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _streamPropertiesForProperties:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)_streamPropertiesForProperties:(id)a3 error:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F01700] streamPropertiesWithDictionary:MEMORY[0x263EFFA78]];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = 0;
  id v8 = 0;
  id v9 = 0;
  CFDictionaryRef v10 = 0;
  if (!v4 || !v5) {
    goto LABEL_46;
  }
  if ([v4 containsObject:*MEMORY[0x263F016B8]])
  {
    CFStringRef v11 = [NSNumber numberWithUnsignedInteger:self->_activeFormatIndex];
    [v6 setActiveFormatIndex:v11];
  }
  uint64_t v12 = *MEMORY[0x263F016C0];
  if ([v4 containsObject:*MEMORY[0x263F016C0]])
  {
    uint64_t v13 = [(CMContinuityCaptureVideoStream *)self device];
    v14 = [v13 activeConfiguration];
    CMTimeMake(&time, 1, [v14 maxFrameRate]);
    CMTimeValue value = time.value;
    CMTimeEpoch epoch = time.epoch;
    uint64_t v17 = *(void *)&time.timescale;

    time.CMTimeValue value = value;
    *(void *)&time.timescale = v17;
    time.CMTimeEpoch epoch = epoch;
    CFDictionaryRef v18 = CMTimeCopyAsDictionary(&time, 0);
    if (v18) {
      [v6 setFrameDuration:v18];
    }
  }
  else
  {
    CFDictionaryRef v18 = 0;
  }
  uint64_t v19 = *MEMORY[0x263F016C8];
  uint64_t v50 = *MEMORY[0x263F016C8];
  v49 = v6;
  CFDictionaryRef v47 = v18;
  if ([v4 containsObject:*MEMORY[0x263F016C8]])
  {
    id v20 = [(CMContinuityCaptureVideoStream *)self device];
    uint64_t v21 = [v20 activeConfiguration];
    CMTimeMake(&time, 1, [v21 minFrameRate]);
    CMTimeValue v22 = time.value;
    CMTimeEpoch v23 = time.epoch;
    uint64_t v24 = *(void *)&time.timescale;

    time.CMTimeValue value = v22;
    *(void *)&time.timescale = v24;
    time.CMTimeEpoch epoch = v23;
    CFDictionaryRef v25 = CMTimeCopyAsDictionary(&time, 0);
    if (v25)
    {
      CFDictionaryRef v45 = v25;
      objc_msgSend(v6, "setMaxFrameDuration:");
    }
    else
    {
      CFDictionaryRef v45 = 0;
    }
    uint64_t v19 = v50;
  }
  else
  {
    CFDictionaryRef v45 = 0;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v26 = [(NSMutableDictionary *)self->_cmControlByName allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (!v27)
  {
    v51 = 0;
    id v9 = 0;
    goto LABEL_40;
  }
  uint64_t v28 = v27;
  v51 = 0;
  id v9 = 0;
  uint64_t v29 = *(void *)v54;
  do
  {
    for (uint64_t i = 0; i != v28; ++i)
    {
      if (*(void *)v54 != v29) {
        objc_enumerationMutation(v26);
      }
      v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
      if (([v31 isEqualToString:v12] & 1) == 0
        && ([v31 isEqualToString:v19] & 1) == 0
        && [v4 containsObject:v31])
      {
        id v32 = v4;
        long long v33 = [(NSMutableDictionary *)self->_cmControlByName objectForKeyedSubscript:v31];

        v34 = [v33 name];
        char v35 = [v34 isEqualToString:@"ActiveFormat"];

        if (v35)
        {
          id v9 = v33;
          id v4 = v32;
LABEL_35:
          uint64_t v19 = v50;
          continue;
        }
        if (v33)
        {
          if ([v31 isEqualToString:@"4cc_cfri_glob_0000"]
            && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
          {
            uint64_t v36 = [MEMORY[0x263F016D8] propertyAttributesWithSharedStreamDefaultValue:0x26E96A868 minValue:0 maxValue:0 validValues:0];
            uint64_t v37 = (void *)MEMORY[0x263F016E0];
            uint64_t v48 = [v33 value];
            uint64_t v38 = [v37 propertyStateWithValue:v48 attributes:v36];

            long long v39 = (void *)v48;
          }
          else
          {
            long long v40 = (void *)MEMORY[0x263F016E0];
            uint64_t v36 = [v33 value];
            uint64_t v38 = [v40 propertyStateWithValue:v36 attributes:0];
            long long v39 = v51;
          }

          __int16 v41 = (void *)v38;
          id v4 = v32;
          if (v41)
          {
LABEL_31:
            v51 = v41;
            [v49 setPropertyState:v41 forProperty:v31];
LABEL_34:
            id v9 = v33;
            goto LABEL_35;
          }
        }
        else
        {
          id v4 = v32;
          __int16 v41 = v51;
          if (v51) {
            goto LABEL_31;
          }
        }
        v51 = 0;
        goto LABEL_34;
      }
    }
    uint64_t v28 = [v26 countByEnumeratingWithState:&v53 objects:v58 count:16];
  }
  while (v28);
LABEL_40:

  if (CMContinityCaptureDebugLogEnabled())
  {
    id v42 = CMContinuityCaptureLog(2);
    uint64_t v6 = v49;
    uint64_t v7 = v46;
    CFDictionaryRef v10 = v47;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      -[CMContinuityCaptureVideoStream _streamPropertiesForProperties:error:]((uint64_t)self, v49, v42);
    }
  }
  else
  {
    uint64_t v6 = v49;
    uint64_t v7 = v46;
    CFDictionaryRef v10 = v47;
  }
  id v8 = v51;
LABEL_46:
  id v43 = v6;

  return v43;
}

- (BOOL)setStreamProperties:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  CMTimeEpoch v23 = __Block_byref_object_copy__2;
  uint64_t v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v7 = [(CMContinuityCaptureVideoStream *)self queue];
  dispatch_assert_queue_not_V2(v7);

  id v8 = [(CMContinuityCaptureVideoStream *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CMContinuityCaptureVideoStream_setStreamProperties_error___block_invoke;
  v12[3] = &unk_264C996B0;
  v14 = &v16;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v15 = &v20;
  dispatch_async_and_wait(v8, v12);

  if (a4) {
    *a4 = (id) v21[5];
  }
  char v10 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __60__CMContinuityCaptureVideoStream_setStreamProperties_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v2 _setStreamProperties:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_setStreamProperties:(id)a3 error:(id *)a4
{
  uint64_t v133 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(CMContinuityCaptureVideoStream *)self device];
  if (!v6)
  {
    v51 = 0;
    int v52 = 0;
    BOOL v8 = 0;
    goto LABEL_97;
  }
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  BOOL v8 = v5 != 0;
  if (!v5)
  {
    v51 = 0;
    int v52 = 0;
    long long v53 = 0;
    goto LABEL_96;
  }
  v114 = v6;
  id v9 = [v5 propertiesDictionary];
  char v10 = CMContinuityCaptureLog(2);
  v115 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = [v5 propertiesDictionary];
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = self;
    __int16 v128 = 2112;
    *(void *)v129 = v11;
    *(_WORD *)&v129[8] = 2112;
    *(void *)&v129[10] = v5;
    _os_log_impl(&dword_235FC2000, v10, OS_LOG_TYPE_DEFAULT, "%@ SetProperties %@ %@", buf, 0x20u);

    id v9 = v115;
  }
  v112 = v5;
  v113 = v7;

  long long v125 = 0u;
  long long v126 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  v120 = self;
  uint64_t v12 = [(NSMutableDictionary *)self->_cmControlByName allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v123 objects:v132 count:16];
  if (!v13)
  {
    v116 = 0;
    uint64_t v16 = 0;
    goto LABEL_57;
  }
  uint64_t v15 = v13;
  v116 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = *(void *)v124;
  uint64_t v18 = *MEMORY[0x263F016C0];
  uint64_t v19 = *MEMORY[0x263F016C8];
  *(void *)&long long v14 = 138413058;
  long long v110 = v14;
  do
  {
    for (uint64_t i = 0; i != v15; ++i)
    {
      if (*(void *)v124 != v17) {
        objc_enumerationMutation(v12);
      }
      uint64_t v21 = *(void **)(*((void *)&v123 + 1) + 8 * i);
      if (objc_msgSend(v21, "isEqualToString:", v18, v110)) {
        continue;
      }
      if ([v21 isEqualToString:v19]) {
        continue;
      }
      if ([v21 isEqualToString:@"PortraitEffectAperture"]) {
        continue;
      }
      if ([v21 isEqualToString:@"StudioLightingIntensity"]) {
        continue;
      }
      if ([v21 isEqualToString:@"GesturesEnabled"]) {
        continue;
      }
      if ([v21 isEqualToString:@"BackgroundReplacementPixelBuffer"]) {
        continue;
      }
      uint64_t v22 = [v9 objectForKey:v21];

      if (!v22) {
        continue;
      }
      v121 = [(NSMutableDictionary *)v120->_cmControlByName objectForKeyedSubscript:v21];

      v122 = [v9 objectForKeyedSubscript:v21];

      CMTimeEpoch v23 = [v121 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v25 = v121;
      if (isKindOfClass)
      {
        id v26 = [v122 value];
        int v117 = [v26 BOOLValue];

        uint64_t v27 = [v112 client];
        uint64_t v28 = [(NSMutableDictionary *)v120->_clientsRequestingBooleanControlOnByControlName objectForKeyedSubscript:v21];

        if (!v28 || !v27) {
          goto LABEL_41;
        }
        uint64_t v29 = [(NSMutableDictionary *)v120->_clientsRequestingBooleanControlOnByControlName objectForKeyedSubscript:v21];
        int v30 = [v29 containsObject:v27];
        v31 = v27;
        v111 = v27;
        if (v117)
        {
          if (v30)
          {
            id v32 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              int v33 = [v29 count];
              *(_DWORD *)buf = v110;
              *(void *)&uint8_t buf[4] = v120;
              __int16 v128 = 2112;
              *(void *)v129 = v31;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v21;
              __int16 v130 = 1024;
              int v131 = v33;
              v34 = v32;
              char v35 = "%@ Client %@ already wants %@ on. %d total clients.";
              goto LABEL_29;
            }
          }
          else
          {
            [v29 addObject:v27];
            id v32 = CMContinuityCaptureLog(2);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              int v40 = [v29 count];
              *(_DWORD *)buf = v110;
              *(void *)&uint8_t buf[4] = v120;
              __int16 v128 = 2112;
              *(void *)v129 = v31;
              *(_WORD *)&v129[8] = 2112;
              *(void *)&v129[10] = v21;
              __int16 v130 = 1024;
              int v131 = v40;
              v34 = v32;
              char v35 = "%@ Client %@ wants %@ on. %d total clients.";
LABEL_29:
              _os_log_impl(&dword_235FC2000, v34, OS_LOG_TYPE_INFO, v35, buf, 0x26u);
            }
          }

LABEL_40:
          uint64_t v27 = v111;
LABEL_41:

          id v25 = v121;
          goto LABEL_42;
        }
        if (v30)
        {
          [v29 removeObject:v27];
          v118 = CMContinuityCaptureLog(2);
          id v9 = v115;
          if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
          {
            int v36 = [v29 count];
            *(_DWORD *)buf = v110;
            *(void *)&uint8_t buf[4] = v120;
            __int16 v128 = 2112;
            *(void *)v129 = v27;
            *(_WORD *)&v129[8] = 2112;
            *(void *)&v129[10] = v21;
            __int16 v130 = 1024;
            int v131 = v36;
            uint64_t v37 = v118;
            uint64_t v38 = v118;
            long long v39 = "%@ Client %@ no longer wants %@ on. %d total clients.";
            goto LABEL_33;
          }
          uint64_t v37 = v118;
        }
        else
        {
          uint64_t v37 = CMContinuityCaptureLog(2);
          id v9 = v115;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            int v41 = [v29 count];
            *(_DWORD *)buf = v110;
            *(void *)&uint8_t buf[4] = v120;
            __int16 v128 = 2112;
            *(void *)v129 = v111;
            *(_WORD *)&v129[8] = 2112;
            *(void *)&v129[10] = v21;
            __int16 v130 = 1024;
            int v131 = v41;
            uint64_t v38 = v37;
            long long v39 = "%@ Client %@ doesn't want %@ on. %d total clients.";
LABEL_33:
            _os_log_impl(&dword_235FC2000, v38, OS_LOG_TYPE_INFO, v39, buf, 0x26u);
          }
        }

        if ([v29 count])
        {
          id v42 = CMContinuityCaptureLog(2);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            int v43 = [v29 count];
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v120;
            __int16 v128 = 1024;
            *(_DWORD *)v129 = v43;
            *(_WORD *)&v129[4] = 2112;
            *(void *)&v129[6] = v21;
            _os_log_impl(&dword_235FC2000, v42, OS_LOG_TYPE_INFO, "%@ There are still %d clients that want %@ on. Ignoring call to turn off.", buf, 0x1Cu);
          }

          uint64_t v16 = v122;
          v116 = v121;
          continue;
        }
        goto LABEL_40;
      }
LABEL_42:
      [v21 isEqualToString:@"AsyncStillCaptureConfigurations"];
      v44 = v25;
      CFDictionaryRef v45 = [v25 value];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v46 = [v44 value];
        CFDictionaryRef v47 = [v122 value];
        int v119 = [v46 isEqualToNumber:v47];

        if (v119)
        {
          uint64_t v48 = CMContinuityCaptureLog(2);
          id v9 = v115;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v120;
            __int16 v128 = 2080;
            *(void *)v129 = "-[CMContinuityCaptureVideoStream _setStreamProperties:error:]";
            *(_WORD *)&v129[8] = 2112;
            *(void *)&v129[10] = v121;
            _os_log_impl(&dword_235FC2000, v48, OS_LOG_TYPE_INFO, "%@ %s Skip setting value for %@ as it's not updated", buf, 0x20u);
          }

          v116 = v121;
          uint64_t v16 = v122;
          continue;
        }
      }
      else
      {
      }
      v49 = [v122 value];
      [v121 setValue:v49];

      [v113 setObject:v122 forKeyedSubscript:v21];
      uint64_t v50 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v120;
        __int16 v128 = 2112;
        *(void *)v129 = v121;
        _os_log_impl(&dword_235FC2000, v50, OS_LOG_TYPE_DEFAULT, "%@ Set Control %@", buf, 0x16u);
      }

      [v114 setValueForControl:v121 completion:0];
      v116 = v121;
      uint64_t v16 = v122;
      id v9 = v115;
    }
    uint64_t v15 = [v12 countByEnumeratingWithState:&v123 objects:v132 count:16];
  }
  while (v15);
LABEL_57:

  id v5 = v112;
  uint64_t v54 = [v112 activeFormatIndex];
  if (!v54)
  {
    id v7 = v113;
    id v6 = v114;
    p_isa = (id *)&v120->super.super.isa;
    goto LABEL_63;
  }
  long long v55 = (void *)v54;
  long long v56 = [v112 activeFormatIndex];
  unint64_t v57 = [v56 unsignedIntegerValue];
  p_isa = (id *)&v120->super.super.isa;
  unint64_t v59 = [(NSArray *)v120->_continuityStreamFormats count];

  id v7 = v113;
  id v6 = v114;
  if (v57 >= v59)
  {
LABEL_63:
    int v52 = v16;
    goto LABEL_64;
  }
  v60 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    long long v61 = [v112 activeFormatIndex];
    int v62 = [v61 unsignedIntegerValue];
    unint64_t activeFormatIndex = v120->_activeFormatIndex;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v120;
    __int16 v128 = 1024;
    *(_DWORD *)v129 = v62;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = activeFormatIndex;
    _os_log_impl(&dword_235FC2000, v60, OS_LOG_TYPE_DEFAULT, " %@ set active format to %d from %d ", buf, 0x18u);
  }
  long long v64 = [v112 activeFormatIndex];
  v120->_unint64_t activeFormatIndex = [v64 unsignedIntegerValue];

  long long v65 = (void *)MEMORY[0x263F016E0];
  uint64_t v66 = [NSNumber numberWithUnsignedInteger:v120->_activeFormatIndex];
  uint64_t v67 = [v65 propertyStateWithValue:v66];

  [v113 setObject:v67 forKeyedSubscript:*MEMORY[0x263F016B8]];
  uint64_t v68 = [(NSArray *)v120->_continuityStreamFormats objectAtIndexedSubscript:v120->_activeFormatIndex];
  v69 = [(NSMutableDictionary *)v120->_cmControlByName objectForKeyedSubscript:@"ActiveFormat"];
  [v69 setValue:v68];

  v70 = [(NSMutableDictionary *)v120->_cmControlByName objectForKeyedSubscript:@"ActiveFormat"];
  [v114 setValueForControl:v70 completion:0];

  int v52 = (void *)v67;
LABEL_64:
  v71 = [v112 frameDuration];

  v51 = v116;
  if (v71)
  {
    CFDictionaryRef v72 = [v112 frameDuration];
    CMTimeMakeFromDictionary((CMTime *)buf, v72);
    uint64_t v73 = *(void *)buf;
    int v74 = *(_DWORD *)&buf[8];

    if (v73 >= 1)
    {
      v75 = [p_isa[28] objectForKeyedSubscript:@"CMIOExtensionPropertyStreamFrameDuration"];

      if (v75)
      {
        *(float *)&double v76 = (float)v74 / (float)v73;
        v77 = [NSNumber numberWithFloat:v76];
        [v75 setValue:v77];

        [v6 setValueForControl:v75 completion:0];
        v51 = v75;
      }
      else
      {
        v51 = 0;
      }
    }
  }
  v78 = [v112 maxFrameDuration];

  if (v78)
  {
    CFDictionaryRef v79 = [v112 maxFrameDuration];
    CMTimeMakeFromDictionary((CMTime *)buf, v79);
    uint64_t v80 = *(void *)buf;
    int v81 = *(_DWORD *)&buf[8];

    if (v80 >= 1)
    {
      v82 = [p_isa[28] objectForKeyedSubscript:@"CMIOExtensionPropertyStreamMaxFrameDuration"];

      if (v82)
      {
        *(float *)&double v83 = (float)v81 / (float)v80;
        v84 = [NSNumber numberWithFloat:v83];
        [v82 setValue:v84];

        [v6 setValueForControl:v82 completion:0];
        v51 = v82;
      }
      else
      {
        v51 = 0;
      }
    }
  }
  v85 = [v115 objectForKeyedSubscript:@"PortraitEffectAperture"];

  if (v85)
  {
    v86 = [p_isa[28] objectForKeyedSubscript:@"PortraitEffectAperture"];

    if (v86)
    {
      v87 = v115;
      v88 = [v115 objectForKeyedSubscript:@"PortraitEffectAperture"];

      v89 = [v88 value];
      v90 = NSNumber;
      [v89 floatValue];
      v91 = objc_msgSend(v90, "numberWithFloat:");
      [v86 setValue:v91];

      [v6 setValueForControl:v86 completion:0];
      v51 = v86;
      int v52 = v88;
      goto LABEL_79;
    }
    v51 = 0;
  }
  v87 = v115;
LABEL_79:
  v92 = [v87 objectForKeyedSubscript:@"StudioLightingIntensity"];

  if (v92)
  {
    v93 = [p_isa[28] objectForKeyedSubscript:@"StudioLightingIntensity"];

    if (v93)
    {
      v94 = v115;
      v95 = [v115 objectForKeyedSubscript:@"StudioLightingIntensity"];

      v96 = [v95 value];
      v97 = NSNumber;
      [v96 floatValue];
      v98 = objc_msgSend(v97, "numberWithFloat:");
      [v93 setValue:v98];

      [v6 setValueForControl:v93 completion:0];
      v51 = v93;
      int v52 = v95;
      goto LABEL_84;
    }
    v51 = 0;
  }
  v94 = v115;
LABEL_84:
  v99 = [v94 objectForKeyedSubscript:@"GesturesEnabled"];

  if (v99)
  {
    v100 = [p_isa[28] objectForKeyedSubscript:@"GesturesEnabled"];

    if (v100)
    {
      v101 = v115;
      v102 = [v115 objectForKeyedSubscript:@"GesturesEnabled"];

      v103 = [v102 value];
      v104 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v103, "BOOLValue"));
      [v100 setValue:v104];

      [v6 setValueForControl:v100 completion:0];
      v51 = v100;
      int v52 = v102;
      goto LABEL_89;
    }
    v51 = 0;
  }
  v101 = v115;
LABEL_89:
  v105 = [v101 objectForKeyedSubscript:@"BackgroundReplacementPixelBuffer"];

  if (v105)
  {
    v106 = [p_isa[28] objectForKeyedSubscript:@"BackgroundReplacementPixelBuffer"];

    if (v106)
    {
      v107 = [v115 objectForKeyedSubscript:@"BackgroundReplacementPixelBuffer"];

      v108 = [v107 value];
      [v106 setValue:v108];

      [v6 setValueForControl:v106 completion:0];
      v51 = v106;
      int v52 = v107;
    }
    else
    {
      v51 = 0;
    }
  }
  BOOL v8 = 1;
  if ([v7 count]) {
    [p_isa notifyPropertiesChanged:v7];
  }
  long long v53 = v115;
LABEL_96:

LABEL_97:
  return v8;
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__CMContinuityCaptureVideoStream_setValueForControl_completion___block_invoke;
  v11[3] = &unk_264C99508;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureVideoStream_setValueForControl_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setValueForControl:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_setValueForControl:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cmControlByName = self->_cmControlByName;
  BOOL v8 = [v5 name];
  id v9 = [(NSMutableDictionary *)cmControlByName objectForKeyedSubscript:v8];

  if (!v9) {
    goto LABEL_37;
  }
  id v10 = self->_cmControlByName;
  CFStringRef v11 = [v5 name];
  id v9 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];

  id v12 = [v5 name];
  int v13 = [v12 isEqualToString:@"CMIOExtensionPropertyStreamFrameDuration"];

  if (v13)
  {
    id v14 = [v5 value];
    [v9 setValue:v14];

    uint64_t v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  uint64_t v16 = [v5 name];
  int v17 = [v16 isEqualToString:@"CMIOExtensionPropertyStreamMaxFrameDuration"];

  if (v17)
  {
    uint64_t v18 = [v5 value];
    [v9 setValue:v18];

    uint64_t v15 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      LODWORD(v50.value) = 138412802;
      *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
      LOWORD(v50.flags) = 2080;
      *(void *)((char *)&v50.flags + 2) = "-[CMContinuityCaptureVideoStream _setValueForControl:completion:]";
      HIWORD(v50.epoch) = 2112;
      v51 = v9;
      _os_log_impl(&dword_235FC2000, v15, OS_LOG_TYPE_DEFAULT, "%@ %s Update control %@", (uint8_t *)&v50, 0x20u);
    }
LABEL_8:

    uint64_t v19 = [v9 value];
    CMTimeMake(&v50, 1, [v19 unsignedIntValue]);
    uint64_t v20 = CMTimeCopyAsDictionary(&v50, 0);
    if (v20)
    {
      uint64_t v21 = [MEMORY[0x263F016E0] propertyStateWithValue:v20 attributes:0];
      if (v21)
      {
        uint64_t v22 = [v5 name];
        [v6 setObject:v21 forKeyedSubscript:v22];
      }
    }
    else
    {
      uint64_t v21 = 0;
    }

    goto LABEL_13;
  }
  CMTimeEpoch v23 = [v5 name];
  if (![v23 isEqualToString:@"4cc_cfri_glob_0000"]
    || ([v5 value], (uint64_t v24 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_24;
  }
  id v25 = (void *)v24;
  id v26 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_24:
    int v33 = [v5 name];
    if ([v33 isEqualToString:@"ReactionsInProgress"]
      && ([v5 value], (uint64_t v34 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v35 = (void *)v34;
      int v36 = [v5 value];
      objc_opt_class();
      char v37 = objc_opt_isKindOfClass();

      if (v37)
      {
        uint64_t v38 = [v9 value];
        long long v39 = [v5 value];
        int v40 = [v38 isEqualToArray:v39];

        if (!v40)
        {
          int v41 = [v5 value];
          [v9 setValue:v41];

          id v32 = CMContinuityCaptureLog(2);
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }
        uint64_t v20 = CMContinuityCaptureLog(2);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v50.value) = 138412290;
          *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
          goto LABEL_44;
        }
        goto LABEL_45;
      }
    }
    else
    {
    }
    id v42 = [v9 value];
    objc_opt_class();
    char v43 = objc_opt_isKindOfClass();

    if (v43)
    {
      v44 = [v9 value];
      CFDictionaryRef v45 = [v5 value];
      int v46 = [v44 isEqualToNumber:v45];

      if (!v46)
      {
        CFDictionaryRef v47 = [v5 value];
        [v9 setValue:v47];

        id v32 = CMContinuityCaptureLog(2);
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        goto LABEL_34;
      }
      uint64_t v20 = CMContinuityCaptureLog(2);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v50.value) = 138412290;
        *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
LABEL_44:
        _os_log_impl(&dword_235FC2000, v20, OS_LOG_TYPE_DEFAULT, "%@ control's value didn't change. Do not notify about properties change.", (uint8_t *)&v50, 0xCu);
      }
LABEL_45:
      uint64_t v21 = 0;
      goto LABEL_13;
    }
LABEL_37:
    uint64_t v21 = 0;
    goto LABEL_14;
  }
  uint64_t v28 = [v9 value];
  uint64_t v29 = [v5 value];
  int v30 = [v28 isEqualToDictionary:v29];

  if (v30)
  {
    uint64_t v20 = CMContinuityCaptureLog(2);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v50.value) = 138412290;
      *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
      goto LABEL_44;
    }
    goto LABEL_45;
  }
  v31 = [v5 value];
  [v9 setValue:v31];

  id v32 = CMContinuityCaptureLog(2);
  if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_35;
  }
LABEL_34:
  LODWORD(v50.value) = 138412802;
  *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
  LOWORD(v50.flags) = 2080;
  *(void *)((char *)&v50.flags + 2) = "-[CMContinuityCaptureVideoStream _setValueForControl:completion:]";
  HIWORD(v50.epoch) = 2112;
  v51 = v9;
  _os_log_impl(&dword_235FC2000, v32, OS_LOG_TYPE_DEFAULT, "%@ %s Update control %@", (uint8_t *)&v50, 0x20u);
LABEL_35:

  uint64_t v48 = (void *)MEMORY[0x263F016E0];
  v49 = [v5 value];
  uint64_t v21 = [v48 propertyStateWithValue:v49 attributes:0];

  if (v21)
  {
    uint64_t v20 = [v5 name];
    [v6 setObject:v21 forKeyedSubscript:v20];
LABEL_13:
  }
LABEL_14:
  if (objc_msgSend(v6, "count", v50.value, *(_OWORD *)&v50.timescale, v51)) {
    [(CMIOExtensionStream *)self notifyPropertiesChanged:v6];
  }
}

- (id)_getResolvedStillCaptureConfigs:(id)a3
{
  queue = self->_queue;
  id v4 = a3;
  dispatch_assert_queue_V2(queue);
  id v5 = (void *)[v4 mutableCopy];

  return v5;
}

- (BOOL)authorizedToStartStreamForClient:(id)a3
{
  return 1;
}

- (BOOL)startStreamAndReturnError:(id *)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v11 = 2080;
    id v12 = "-[CMContinuityCaptureVideoStream startStreamAndReturnError:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v5 = [(CMContinuityCaptureVideoStream *)self device];
  if (v5)
  {
    id v6 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__CMContinuityCaptureVideoStream_startStreamAndReturnError___block_invoke;
    v8[3] = &unk_264C990F8;
    objc_copyWeak(&v9, (id *)buf);
    [v6 startStreamForDevice:v5 startCompletion:v8 startSkippedCompletion:0];

    objc_destroyWeak(&v9);
  }

  objc_destroyWeak((id *)buf);
  return 1;
}

void __60__CMContinuityCaptureVideoStream_startStreamAndReturnError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _startStreamAndReturnError:0];
    id WeakRetained = v2;
  }
}

- (BOOL)_startStreamAndReturnError:(id *)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v11 = self;
    __int16 v12 = 2080;
    uint64_t v13 = "-[CMContinuityCaptureVideoStream _startStreamAndReturnError:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke;
  v7[3] = &unk_264C990F8;
  objc_copyWeak(&v8, &location);
  dispatch_async(queue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return 1;
}

void __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained device];
    id v5 = v4;
    if (v4)
    {
      id v6 = [v4 compositeDelegate];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke_2;
      v7[3] = &unk_264C996D8;
      objc_copyWeak(&v9, v1);
      id v8 = v5;
      [v6 registerStreamIntentForCaptureDevice:v8 completion:v7];

      objc_destroyWeak(&v9);
    }
  }
}

void __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    int v9 = 138543618;
    id v10 = WeakRetained;
    __int16 v11 = 2112;
    __int16 v12 = a2;
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ completed registerStreamIntentForCaptureDevice error %@", (uint8_t *)&v9, 0x16u);
  }
  if (a2 && [a2 code])
  {
    if ([a2 code] == -1005)
    {
      id v6 = kCMContinuityCaptureEventStreamDisableForMultipleStream;
LABEL_9:
      id v7 = [*(id *)(a1 + 32) compositeDelegate];
      objc_msgSend(v7, "postEvent:entity:data:", *v6, objc_msgSend(*(id *)(a1 + 32), "entity"), 0);

      goto LABEL_10;
    }
    if ([a2 code] == -1006)
    {
      id v6 = kCMContinuityCaptureEventStreamDisableForWifiContention;
      goto LABEL_9;
    }
  }
LABEL_10:
  id v8 = [*(id *)(a1 + 32) compositeDelegate];
  objc_msgSend(v8, "postEvent:entity:data:", @"kCMContinuityCaptureEventStartStream", objc_msgSend(*(id *)(a1 + 32), "entity"), 0);
}

- (BOOL)stopStreamAndReturnError:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    __int16 v17 = 2080;
    uint64_t v18 = "-[CMContinuityCaptureVideoStream stopStreamAndReturnError:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  id v5 = [(CMContinuityCaptureVideoStream *)self device];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 compositeDelegate];
    objc_msgSend(v7, "postEvent:entity:data:", @"kCMContinuityCaptureEventRemoteClientReconnect", objc_msgSend(v6, "entity"), 0);

    id v8 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v8 unscheduleNotification:4];

    int v9 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v9 unscheduleNotification:5];

    id v10 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v10 unscheduleNotification:13];

    __int16 v11 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    [v11 unscheduleNotification:14];

    __int16 v12 = +[CMContinuityCaptureSessionStateManager sharedInstance];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__CMContinuityCaptureVideoStream_stopStreamAndReturnError___block_invoke;
    void v14[3] = &unk_264C990F8;
    objc_copyWeak(&v15, (id *)buf);
    [v12 stopStreamForDevice:v6 option:0 completion:v14];

    objc_destroyWeak(&v15);
  }

  objc_destroyWeak((id *)buf);
  return 1;
}

void __59__CMContinuityCaptureVideoStream_stopStreamAndReturnError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _stopStreamAndReturnError:0];
    id WeakRetained = v2;
  }
}

- (BOOL)_stopStreamAndReturnError:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v4 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2080;
    uint64_t v16 = "-[CMContinuityCaptureVideoStream _stopStreamAndReturnError:]";
    _os_log_impl(&dword_235FC2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  id v5 = [(CMContinuityCaptureVideoStream *)self device];
  id v6 = [v5 compositeDelegate];
  id v7 = [(CMContinuityCaptureVideoStream *)self device];
  [v6 unregisterStreamIntentForCaptureDevice:v7];

  queue = self->_queue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__CMContinuityCaptureVideoStream__stopStreamAndReturnError___block_invoke;
  v10[3] = &unk_264C990F8;
  objc_copyWeak(&v11, &location);
  dispatch_async(queue, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return 1;
}

void __60__CMContinuityCaptureVideoStream__stopStreamAndReturnError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained device];
    id v3 = v2;
    if (v2)
    {
      id v4 = [v2 compositeDelegate];
      objc_msgSend(v4, "postEvent:entity:data:", @"kCMContinuityCaptureEventStopStream", objc_msgSend(v3, "entity"), 0);
    }
    id WeakRetained = v5;
  }
}

- (void)captureAsyncStillImage:(int64_t)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v10 = [(CMContinuityCaptureVideoStream *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__CMContinuityCaptureVideoStream_captureAsyncStillImage_options_completionHandler___block_invoke;
  block[3] = &unk_264C99300;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __83__CMContinuityCaptureVideoStream_captureAsyncStillImage_options_completionHandler___block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(CMContinuityCaptureStillImageRequest);
    [(CMContinuityCaptureStillImageRequest *)v3 setUniqueID:*(void *)(a1 + 56)];
    id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CompressedFormat"];
    [(CMContinuityCaptureStillImageRequest *)v3 setCompressedFormat:v4];

    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"HighResolutionCapture"];
    -[CMContinuityCaptureStillImageRequest setHighResolutionPhotoEnabled:](v3, "setHighResolutionPhotoEnabled:", [v5 BOOLValue]);

    id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"FlashMode"];
    -[CMContinuityCaptureStillImageRequest setFlashMode:](v3, "setFlashMode:", [v6 intValue]);

    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"PhotoQualityPrioritization"];
    -[CMContinuityCaptureStillImageRequest setPhotoQualityPrioritization:](v3, "setPhotoQualityPrioritization:", [v7 intValue]);

    uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"MaxPhotoDimensionsWidth"];
    if (v8
      && (id v9 = (void *)v8,
          [*(id *)(a1 + 32) objectForKeyedSubscript:@"MaxPhotoDimensionsHeight"],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"MaxPhotoDimensionsWidth"];
      unsigned int v12 = [v11 intValue];

      uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"MaxPhotoDimensionsHeight"];
      uint64_t v14 = [v13 intValue];

      unint64_t v15 = v12 | (unint64_t)(v14 << 32);
    }
    else
    {
      unint64_t v15 = 0;
    }
    [(CMContinuityCaptureStillImageRequest *)v3 setMaxPhotoDimensions:v15];
    [(CMContinuityCaptureStillImageRequest *)v3 setCompletionHandler:*(void *)(a1 + 40)];
    id v16 = objc_loadWeakRetained(WeakRetained + 33);
    uint64_t v17 = [WeakRetained device];
    uint64_t v18 = [v17 entity];
    uint64_t v20 = @"ImageRequest";
    v21[0] = v3;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    [v16 postEvent:@"kCMContinuityCaptureEventImageCapture" entity:v18 data:v19];
  }
}

- (void)enqueueReactionEffect:(id)a3 completionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v8 = CMContinuityCaptureLog(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = self;
    __int16 v19 = 2080;
    uint64_t v20 = "-[CMContinuityCaptureVideoStream enqueueReactionEffect:completionHandler:]";
    _os_log_impl(&dword_235FC2000, v8, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  id v9 = [(CMContinuityCaptureVideoStream *)self queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__CMContinuityCaptureVideoStream_enqueueReactionEffect_completionHandler___block_invoke;
  v12[3] = &unk_264C99508;
  objc_copyWeak(&v15, &location);
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureVideoStream_enqueueReactionEffect_completionHandler___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained device];
    if (v4)
    {
      id v5 = [v3 device];
      uint64_t v6 = [v5 entity];
      uint64_t v7 = *(void *)(a1 + 32);
      id v10 = @"ReactionType";
      v11[0] = v7;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [v4 postEvent:@"kCMContinuityCaptureEventEnqueueReactionEffect" entity:v6 data:v8];

      uint64_t v9 = *(void *)(a1 + 40);
      if (v9) {
        (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
      }
    }
  }
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(CMContinuityCaptureVideoStream *)self device];
  uint64_t v7 = [v3 stringWithFormat:@"%@: %@ [%p]", v5, v6, self];

  return (NSString *)v7;
}

- (id)debugInfo
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->_compositeDevice);
  objc_storeStrong((id *)&self->_maxPhotoQualityPrioritizationByClients, 0);
  objc_storeStrong((id *)&self->_clientsRequestingBooleanControlOnByControlName, 0);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_continuityStreamFormats, 0);
  objc_storeStrong((id *)&self->_extensionStreamFormats, 0);
}

- (void)initWithDevice:streamFormats:deviceID:queue:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, " %@ Invalid queue", v2, v3, v4, v5, v6);
}

- (void)initWithDevice:streamFormats:deviceID:queue:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, " %@ Failed to setup streams", v2, v3, v4, v5, v6);
}

- (void)setupStreams:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_235FC2000, v0, v1, "%@ Invalid stream formats", v2, v3, v4, v5, v6);
}

- (void)_availableProperties
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_235FC2000, v1, OS_LOG_TYPE_DEBUG, "%@ AvailableProperties %@", v2, 0x16u);
}

- (void)_streamPropertiesForProperties:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 propertiesDictionary];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_235FC2000, a3, OS_LOG_TYPE_DEBUG, "%@ GetProperties %@", (uint8_t *)&v6, 0x16u);
}

@end