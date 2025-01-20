@interface FigCaptureSessionConfiguration
+ (void)initialize;
- (BOOL)allCameraSourcesAreMetadataCameras;
- (BOOL)allowedToRunInMultitaskingMode;
- (BOOL)checkIfFileAlreadyExistForMFO;
- (BOOL)clientExpectsCameraMountedInLandscapeOrientation;
- (BOOL)clientIsVOIP;
- (BOOL)configuresAppAudioSession;
- (BOOL)configuresAppAudioSessionToMixWithOthers;
- (BOOL)continuityCameraIsWired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiCamSession;
- (BOOL)smartStyleRenderingEnabled;
- (BOOL)suppressVideoEffects;
- (BOOL)usesAppAudioSession;
- (BOOL)xctestAuthorizedToStealDevice;
- (FigCaptureSessionConfiguration)init;
- (FigCaptureSessionConfiguration)initWithXPCEncoding:(id)a3;
- (FigCaptureSmartStyle)smartStyle;
- (NSArray)connectionConfigurations;
- (NSArray)sinkConfigurations;
- (NSArray)sourceConfigurations;
- (NSString)description;
- (NSString)sessionPreset;
- (OS_tcc_identity)tccIdentity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)osStatePropertyList;
- (int)continuityCameraClientDeviceClass;
- (int64_t)configurationID;
- (int64_t)smartStyleControlMode;
- (void)addConnectionConfiguration:(id)a3;
- (void)dealloc;
- (void)removeConnectionConfiguration:(id)a3;
- (void)setAllowedToRunInMultitaskingMode:(BOOL)a3;
- (void)setCheckIfFileAlreadyExistForMFO:(BOOL)a3;
- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3;
- (void)setClientIsVOIP:(BOOL)a3;
- (void)setConfigurationID:(int64_t)a3;
- (void)setConfiguresAppAudioSession:(BOOL)a3;
- (void)setConfiguresAppAudioSessionToMixWithOthers:(BOOL)a3;
- (void)setContinuityCameraClientDeviceClass:(int)a3;
- (void)setContinuityCameraIsWired:(BOOL)a3;
- (void)setMultiCamSession:(BOOL)a3;
- (void)setSessionPreset:(id)a3;
- (void)setSmartStyle:(id)a3;
- (void)setSmartStyleControlMode:(int64_t)a3;
- (void)setSmartStyleRenderingEnabled:(BOOL)a3;
- (void)setSuppressVideoEffects:(BOOL)a3;
- (void)setTccIdentity:(id)a3;
- (void)setUsesAppAudioSession:(BOOL)a3;
- (void)setXctestAuthorizedToStealDevice:(BOOL)a3;
@end

@implementation FigCaptureSessionConfiguration

uint64_t __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke_2(uint64_t a1, int a2, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, "class");
  if (!string)
  {
    uint64_t v9 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  Class = objc_getClass(string);
  if ([(objc_class *)Class isSubclassOfClass:objc_opt_class()])
  {
    v7 = (void *)[[Class alloc] initWithXPCEncoding:xdict];
    if (!v7
      || !xpc_dictionary_get_value(xdict, "sourceIndex")
      || (unint64_t int64 = xpc_dictionary_get_int64(xdict, "sourceIndex"), int64 >= [*(id *)(a1 + 32) count]))
    {
      uint64_t v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "setSourceConfiguration:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", int64));
    [*(id *)(*(void *)(a1 + 40) + 8) addObject:v7];
  }
  else
  {
    v7 = 0;
  }
  uint64_t v9 = 1;
LABEL_9:

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionConfiguration;
  [(FigCaptureSessionConfiguration *)&v3 dealloc];
}

- (void)setTccIdentity:(id)a3
{
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (NSArray)sinkConfigurations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](-[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations"), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) sinkConfiguration];
        if (([v3 containsObject:v9] & 1) == 0) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (id)copyXPCEncoding
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "configurationID", [(FigCaptureSessionConfiguration *)self configurationID]);
  xpc_dictionary_set_BOOL(v3, "clientExpectsCameraMountedInLandscapeOrientation", [(FigCaptureSessionConfiguration *)self clientExpectsCameraMountedInLandscapeOrientation]);
  v4 = [(FigCaptureSessionConfiguration *)self sourceConfigurations];
  xpc_object_t v5 = xpc_array_create(0, 0);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) copyXPCEncoding];
        xpc_array_append_value(v5, v10);
        xpc_release(v10);
      }
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }
  xpc_dictionary_set_value(v3, "sources", v5);
  xpc_release(v5);
  xpc_object_t v11 = xpc_array_create(0, 0);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v27 = self;
  long long v12 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        uint64_t v18 = -[NSArray indexOfObject:](v4, "indexOfObject:", [v17 sourceConfiguration]);
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          int64_t v19 = v18;
          v20 = (void *)[v17 copyXPCEncoding];
          xpc_dictionary_set_int64(v20, "sourceIndex", v19);
          xpc_array_append_value(v11, v20);
          xpc_release(v20);
        }
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v14);
  }
  xpc_dictionary_set_value(v3, "connections", v11);
  xpc_release(v11);
  v21 = [(FigCaptureSessionConfiguration *)v27 sessionPreset];
  if (v21) {
    xpc_dictionary_set_string(v3, "sessionPreset", [(NSString *)v21 UTF8String]);
  }
  xpc_dictionary_set_BOOL(v3, "usesAppAudioSession", [(FigCaptureSessionConfiguration *)v27 usesAppAudioSession]);
  xpc_dictionary_set_BOOL(v3, "configuresAppAudioSession", [(FigCaptureSessionConfiguration *)v27 configuresAppAudioSession]);
  xpc_dictionary_set_BOOL(v3, "configuresAppAudioSessionToMixWithOthers", [(FigCaptureSessionConfiguration *)v27 configuresAppAudioSessionToMixWithOthers]);
  xpc_dictionary_set_BOOL(v3, "allowedToRunInMultitaskingMode", [(FigCaptureSessionConfiguration *)v27 allowedToRunInMultitaskingMode]);
  xpc_dictionary_set_BOOL(v3, "isMultiCamSession", [(FigCaptureSessionConfiguration *)v27 isMultiCamSession]);
  xpc_dictionary_set_BOOL(v3, "xctestAuthorizedToStealDevice", [(FigCaptureSessionConfiguration *)v27 xctestAuthorizedToStealDevice]);
  xpc_dictionary_set_BOOL(v3, "checkIfFileAlreadyExistForMFO", [(FigCaptureSessionConfiguration *)v27 checkIfFileAlreadyExistForMFO]);
  xpc_dictionary_set_BOOL(v3, "continuityCameraIsWired", [(FigCaptureSessionConfiguration *)v27 continuityCameraIsWired]);
  xpc_dictionary_set_int64(v3, "continuityCameraClientDeviceClass", [(FigCaptureSessionConfiguration *)v27 continuityCameraClientDeviceClass]);
  xpc_dictionary_set_BOOL(v3, "clientIsVOIP", [(FigCaptureSessionConfiguration *)v27 clientIsVOIP]);
  xpc_dictionary_set_BOOL(v3, "suppressVideoEffects", [(FigCaptureSessionConfiguration *)v27 suppressVideoEffects]);
  if ([(FigCaptureSessionConfiguration *)v27 tccIdentity])
  {
    [(FigCaptureSessionConfiguration *)v27 tccIdentity];
    v22 = (void *)tcc_identity_copy_external_representation();
    v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    xpc_dictionary_set_value(v3, "tccIdentity", v23);
  }
  xpc_dictionary_set_BOOL(v3, "smartStyleRenderingEnabled", [(FigCaptureSessionConfiguration *)v27 smartStyleRenderingEnabled]);
  xpc_dictionary_set_int64(v3, "smartStyleControlMode", [(FigCaptureSessionConfiguration *)v27 smartStyleControlMode]);
  smartStyle = v27->_smartStyle;
  if (smartStyle)
  {
    id v25 = [(FigCaptureSmartStyle *)smartStyle copyXPCEncoding];
    xpc_dictionary_set_value(v3, "smartStyle", v25);
    xpc_release(v25);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  uint64_t v39 = v5;
  uint64_t v40 = v4;
  uint64_t v41 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_30;
  }
  int64_t v13 = [(FigCaptureSessionConfiguration *)self configurationID];
  if (v13 != [a3 configurationID]) {
    goto LABEL_30;
  }
  int v14 = -[NSString isEqual:](-[FigCaptureSessionConfiguration sessionPreset](self, "sessionPreset"), "isEqual:", [a3 sessionPreset]);
  if (!v14) {
    return v14;
  }
  int v15 = [(FigCaptureSessionConfiguration *)self usesAppAudioSession];
  if (v15 != [a3 usesAppAudioSession]) {
    goto LABEL_30;
  }
  int v16 = [(FigCaptureSessionConfiguration *)self configuresAppAudioSession];
  if (v16 != [a3 configuresAppAudioSession]) {
    goto LABEL_30;
  }
  int v17 = [(FigCaptureSessionConfiguration *)self configuresAppAudioSessionToMixWithOthers];
  if (v17 != [a3 configuresAppAudioSessionToMixWithOthers]) {
    goto LABEL_30;
  }
  int v18 = [(FigCaptureSessionConfiguration *)self allowedToRunInMultitaskingMode];
  if (v18 != [a3 allowedToRunInMultitaskingMode]) {
    goto LABEL_30;
  }
  int v19 = [(FigCaptureSessionConfiguration *)self isMultiCamSession];
  if (v19 != [a3 isMultiCamSession]) {
    goto LABEL_30;
  }
  int v20 = [(FigCaptureSessionConfiguration *)self xctestAuthorizedToStealDevice];
  if (v20 != [a3 xctestAuthorizedToStealDevice]) {
    goto LABEL_30;
  }
  int v21 = [(FigCaptureSessionConfiguration *)self clientExpectsCameraMountedInLandscapeOrientation];
  if (v21 != [a3 clientExpectsCameraMountedInLandscapeOrientation]) {
    goto LABEL_30;
  }
  int v22 = [(FigCaptureSessionConfiguration *)self smartStyleRenderingEnabled];
  if (v22 != [a3 smartStyleRenderingEnabled]) {
    goto LABEL_30;
  }
  int64_t v23 = [(FigCaptureSessionConfiguration *)self smartStyleControlMode];
  if (v23 != [a3 smartStyleControlMode]) {
    goto LABEL_30;
  }
  v24 = [(FigCaptureSessionConfiguration *)self smartStyle];
  if (v24 == (FigCaptureSmartStyle *)[a3 smartStyle]
    || (int v14 = -[FigCaptureSmartStyle isEqual:](-[FigCaptureSessionConfiguration smartStyle](self, "smartStyle"), "isEqual:", [a3 smartStyle])) != 0)
  {
    id v25 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
    if (v25 == (NSArray *)[a3 connectionConfigurations]
      || (int v14 = -[NSArray isEqual:](-[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations"), "isEqual:", [a3 connectionConfigurations])) != 0)
    {
      int v26 = [(FigCaptureSessionConfiguration *)self continuityCameraIsWired];
      if (v26 == [a3 continuityCameraIsWired])
      {
        int v27 = [(FigCaptureSessionConfiguration *)self continuityCameraClientDeviceClass];
        if (v27 == [a3 continuityCameraClientDeviceClass])
        {
          int v28 = [(FigCaptureSessionConfiguration *)self clientIsVOIP];
          if (v28 == [a3 clientIsVOIP])
          {
            int v29 = [(FigCaptureSessionConfiguration *)self suppressVideoEffects];
            if (v29 == [a3 suppressVideoEffects])
            {
              if (!self->_tccIdentity) {
                goto LABEL_29;
              }
              if ([a3 tccIdentity])
              {
                long long v30 = NSString;
                [(FigCaptureSessionConfiguration *)self tccIdentity];
                long long v31 = (void *)[v30 stringWithUTF8String:tcc_identity_get_identifier()];
                [(FigCaptureSessionConfiguration *)self tccIdentity];
                uint64_t type = tcc_identity_get_type();
                long long v33 = NSString;
                [a3 tccIdentity];
                uint64_t v34 = [v33 stringWithUTF8String:tcc_identity_get_identifier()];
                [a3 tccIdentity];
                uint64_t v35 = tcc_identity_get_type();
                int v36 = [v31 isEqualToString:v34];
                LOBYTE(v14) = 0;
                if (!v36 || type != v35) {
                  return v14;
                }
LABEL_32:
                BOOL v37 = [(FigCaptureSessionConfiguration *)self checkIfFileAlreadyExistForMFO];
                LOBYTE(v14) = v37 ^ [a3 checkIfFileAlreadyExistForMFO] ^ 1;
                return v14;
              }
              if (!self->_tccIdentity)
              {
LABEL_29:
                if (![a3 tccIdentity]) {
                  goto LABEL_32;
                }
              }
            }
          }
        }
      }
LABEL_30:
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (NSString)sessionPreset
{
  return self->_sessionPreset;
}

- (int64_t)smartStyleControlMode
{
  return self->_smartStyleControlMode;
}

- (FigCaptureSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (NSArray)sourceConfigurations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](-[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations"), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * v8) sourceConfiguration];
        if (([v3 containsObject:v9] & 1) == 0) {
          [v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (NSArray)connectionConfigurations
{
  v2 = self->_connections;
  return (NSArray *)v2;
}

- (NSString)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@ %p: ID %lld, %@ multiCam: %d, appAudio: %d, autoConfig: %d, mixesWithOthers: %d, runWhileMultitasking: %d, checkIfFileAlreadyExistForMFO: %d", objc_opt_class(), self, -[FigCaptureSessionConfiguration configurationID](self, "configurationID"), -[FigCaptureSessionConfiguration sessionPreset](self, "sessionPreset"), -[FigCaptureSessionConfiguration isMultiCamSession](self, "isMultiCamSession"), -[FigCaptureSessionConfiguration usesAppAudioSession](self, "usesAppAudioSession"), -[FigCaptureSessionConfiguration configuresAppAudioSession](self, "configuresAppAudioSession"), -[FigCaptureSessionConfiguration configuresAppAudioSessionToMixWithOthers](self, "configuresAppAudioSessionToMixWithOthers"), -[FigCaptureSessionConfiguration allowedToRunInMultitaskingMode](self, "allowedToRunInMultitaskingMode"), -[FigCaptureSessionConfiguration checkIfFileAlreadyExistForMFO](self, "checkIfFileAlreadyExistForMFO")];
  if ([(FigCaptureSessionConfiguration *)self xctestAuthorizedToStealDevice]) {
    [v3 appendString:@", xctestSteals: 1"];
  }
  if ([(FigCaptureSessionConfiguration *)self continuityCameraIsWired]) {
    [v3 appendString:@", continuityCameraIsWired: YES"];
  }
  if ([(FigCaptureSessionConfiguration *)self continuityCameraClientDeviceClass]) {
    [v3 appendFormat:@", continuityCameraClientDeviceClass: %@", objc_msgSend(NSNumber, "numberWithInt:", -[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](self, "continuityCameraClientDeviceClass"))];
  }
  if ([(FigCaptureSessionConfiguration *)self suppressVideoEffects]) {
    [v3 appendString:@", suppressVideoEffects: YES"];
  }
  if ([(FigCaptureSessionConfiguration *)self smartStyleRenderingEnabled]) {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @", smartStyle:%@ controlMode:%d", -[FigCaptureSessionConfiguration smartStyle](self, "smartStyle"), -[FigCaptureSessionConfiguration smartStyleControlMode](self, "smartStyleControlMode"))];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"\n\t%@", *(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return (NSString *)v3;
}

- (BOOL)usesAppAudioSession
{
  return self->_usesAppAudioSession;
}

- (BOOL)suppressVideoEffects
{
  return self->_suppressVideoEffects;
}

- (BOOL)isMultiCamSession
{
  return self->_isMultiCamSession;
}

- (BOOL)continuityCameraIsWired
{
  return self->_continuityCameraIsWired;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (BOOL)configuresAppAudioSessionToMixWithOthers
{
  return self->_configuresAppAudioSessionToMixWithOthers;
}

- (BOOL)allowedToRunInMultitaskingMode
{
  return self->_allowedToRunInMultitaskingMode;
}

- (BOOL)xctestAuthorizedToStealDevice
{
  return self->_xctestAuthorizedToStealDevice;
}

- (BOOL)configuresAppAudioSession
{
  return self->_configuresAppAudioSession;
}

- (BOOL)checkIfFileAlreadyExistForMFO
{
  return self->_checkIfFileAlreadyExistForMFO;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConfigurationID:", -[FigCaptureSessionConfiguration configurationID](self, "configurationID"));
  objc_msgSend(v5, "setSessionPreset:", -[FigCaptureSessionConfiguration sessionPreset](self, "sessionPreset"));
  objc_msgSend(v5, "setUsesAppAudioSession:", -[FigCaptureSessionConfiguration usesAppAudioSession](self, "usesAppAudioSession"));
  objc_msgSend(v5, "setConfiguresAppAudioSession:", -[FigCaptureSessionConfiguration configuresAppAudioSession](self, "configuresAppAudioSession"));
  objc_msgSend(v5, "setConfiguresAppAudioSessionToMixWithOthers:", -[FigCaptureSessionConfiguration configuresAppAudioSessionToMixWithOthers](self, "configuresAppAudioSessionToMixWithOthers"));
  objc_msgSend(v5, "setAllowedToRunInMultitaskingMode:", -[FigCaptureSessionConfiguration allowedToRunInMultitaskingMode](self, "allowedToRunInMultitaskingMode"));
  objc_msgSend(v5, "setMultiCamSession:", -[FigCaptureSessionConfiguration isMultiCamSession](self, "isMultiCamSession"));
  objc_msgSend(v5, "setXctestAuthorizedToStealDevice:", -[FigCaptureSessionConfiguration xctestAuthorizedToStealDevice](self, "xctestAuthorizedToStealDevice"));
  objc_msgSend(v5, "setContinuityCameraIsWired:", -[FigCaptureSessionConfiguration continuityCameraIsWired](self, "continuityCameraIsWired"));
  objc_msgSend(v5, "setContinuityCameraClientDeviceClass:", -[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](self, "continuityCameraClientDeviceClass"));
  objc_msgSend(v5, "setClientIsVOIP:", -[FigCaptureSessionConfiguration clientIsVOIP](self, "clientIsVOIP"));
  objc_msgSend(v5, "setSuppressVideoEffects:", -[FigCaptureSessionConfiguration suppressVideoEffects](self, "suppressVideoEffects"));
  objc_msgSend(v5, "setCheckIfFileAlreadyExistForMFO:", -[FigCaptureSessionConfiguration checkIfFileAlreadyExistForMFO](self, "checkIfFileAlreadyExistForMFO"));
  objc_msgSend(v5, "setClientExpectsCameraMountedInLandscapeOrientation:", -[FigCaptureSessionConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation"));
  if ([(FigCaptureSessionConfiguration *)self tccIdentity])
  {
    [(FigCaptureSessionConfiguration *)self tccIdentity];
    tcc_identity_get_type();
    [(FigCaptureSessionConfiguration *)self tccIdentity];
    tcc_identity_get_identifier();
    uint64_t v6 = (void *)tcc_identity_create();
    [v5 setTccIdentity:v6];
  }
  objc_msgSend(v5, "setSmartStyleRenderingEnabled:", -[FigCaptureSessionConfiguration smartStyleRenderingEnabled](self, "smartStyleRenderingEnabled"));
  objc_msgSend(v5, "setSmartStyleControlMode:", -[FigCaptureSessionConfiguration smartStyleControlMode](self, "smartStyleControlMode"));
  objc_msgSend(v5, "setSmartStyle:", -[FigCaptureSessionConfiguration smartStyle](self, "smartStyle"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v7 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v11) copyWithZone:a3];
        [v5 addConnectionConfiguration:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return v5;
}

- (void)addConnectionConfiguration:(id)a3
{
}

- (void)setConfigurationID:(int64_t)a3
{
  self->_configurationID = a3;
}

- (BOOL)clientIsVOIP
{
  return self->_clientIsVOIP;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  self->_suppressVideoEffects = a3;
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  self->_continuityCameraIsWired = a3;
}

- (OS_tcc_identity)tccIdentity
{
  return self->_tccIdentity;
}

- (void)setXctestAuthorizedToStealDevice:(BOOL)a3
{
  self->_xctestAuthorizedToStealDevice = a3;
}

- (void)setUsesAppAudioSession:(BOOL)a3
{
  self->_usesAppAudioSession = a3;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

- (void)setSessionPreset:(id)a3
{
}

- (void)setMultiCamSession:(BOOL)a3
{
  self->_isMultiCamSession = a3;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_continuityCameraClientDeviceClass = a3;
}

- (void)setConfiguresAppAudioSessionToMixWithOthers:(BOOL)a3
{
  self->_configuresAppAudioSessionToMixWithOthers = a3;
}

- (void)setConfiguresAppAudioSession:(BOOL)a3
{
  self->_configuresAppAudioSession = a3;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (void)setCheckIfFileAlreadyExistForMFO:(BOOL)a3
{
  self->_checkIfFileAlreadyExistForMFO = a3;
}

- (void)setAllowedToRunInMultitaskingMode:(BOOL)a3
{
  self->_allowedToRunInMultitaskingMode = a3;
}

- (FigCaptureSessionConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionConfiguration;
  v2 = [(FigCaptureSessionConfiguration *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 1) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v2[32] = 1;
    v2[56] = 1;
    *(_WORD *)(v2 + 33) = 1;
    *(_WORD *)(v2 + 57) = 0;
    *((void *)v2 + 8) = 0;
  }
  return (FigCaptureSessionConfiguration *)v2;
}

- (void)setSmartStyle:(id)a3
{
}

- (void)setClientIsVOIP:(BOOL)a3
{
  self->_clientIsVOIP = a3;
}

- (void)setSmartStyleControlMode:(int64_t)a3
{
  self->_smartStyleControlMode = a3;
}

- (FigCaptureSessionConfiguration)initWithXPCEncoding:(id)a3
{
  uint64_t v3 = self;
  if (!a3)
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    goto LABEL_15;
  }
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureSessionConfiguration;
  uint64_t v3 = [(FigCaptureSessionConfiguration *)&v15 init];
  if (!v3) {
    return v3;
  }
  v3->_configurationID = xpc_dictionary_get_int64(a3, "configurationID");
  v3->_clientExpectsCameraMountedInLandscapeOrientation = xpc_dictionary_get_BOOL(a3, "clientExpectsCameraMountedInLandscapeOrientation");
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  xpc_object_t value = xpc_dictionary_get_value(a3, "sources");
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke;
  applier[3] = &unk_1E5C245F8;
  applier[4] = v5;
  if (!xpc_array_apply(value, applier))
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  v3->_connections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  xpc_object_t v7 = xpc_dictionary_get_value(a3, "connections");
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke_2;
  v13[3] = &unk_1E5C29480;
  v13[4] = v5;
  v13[5] = v3;
  if (!xpc_array_apply(v7, v13))
  {
LABEL_15:

    return 0;
  }
  string = xpc_dictionary_get_string(a3, "sessionPreset");
  if (string) {
    v3->_sessionPreset = (NSString *)[[NSString alloc] initWithUTF8String:string];
  }
  v3->_usesAppAudioSession = xpc_dictionary_get_BOOL(a3, "usesAppAudioSession");
  v3->_configuresAppAudioSession = xpc_dictionary_get_BOOL(a3, "configuresAppAudioSession");
  v3->_configuresAppAudioSessionToMixWithOthers = xpc_dictionary_get_BOOL(a3, "configuresAppAudioSessionToMixWithOthers");
  v3->_allowedToRunInMultitaskingMode = xpc_dictionary_get_BOOL(a3, "allowedToRunInMultitaskingMode");
  v3->_isMultiCamSession = xpc_dictionary_get_BOOL(a3, "isMultiCamSession");
  v3->_xctestAuthorizedToStealDevice = xpc_dictionary_get_BOOL(a3, "xctestAuthorizedToStealDevice");
  v3->_checkIfFileAlreadyExistForMFO = xpc_dictionary_get_BOOL(a3, "checkIfFileAlreadyExistForMFO");
  v3->_continuityCameraIsWired = xpc_dictionary_get_BOOL(a3, "continuityCameraIsWired");
  v3->_continuityCameraClientDeviceClass = xpc_dictionary_get_int64(a3, "continuityCameraClientDeviceClass");
  v3->_clientIsVOIP = xpc_dictionary_get_BOOL(a3, "clientIsVOIP");
  v3->_suppressVideoEffects = xpc_dictionary_get_BOOL(a3, "suppressVideoEffects");
  if (xpc_dictionary_get_value(a3, "tccIdentity"))
  {
    uint64_t v9 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    uint64_t v10 = tcc_identity_create_from_external_representation();

    v3->_tccIdentity = (OS_tcc_identity *)v10;
  }
  v3->_smartStyleRenderingEnabled = xpc_dictionary_get_BOOL(a3, "smartStyleRenderingEnabled");
  v3->_smartStyleControlMode = xpc_dictionary_get_int64(a3, "smartStyleControlMode");
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a3, "smartStyle");
  if (dictionary) {
    v3->_smartStyle = [[FigCaptureSmartStyle alloc] initWithXPCEncoding:dictionary];
  }
  return v3;
}

- (BOOL)allCameraSourcesAreMetadataCameras
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(FigCaptureSessionConfiguration *)self connectionConfigurations];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  BOOL v5 = 0;
  uint64_t v6 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v11 != v6) {
        objc_enumerationMutation(v2);
      }
      uint64_t v8 = (void *)[*(id *)(*((void *)&v10 + 1) + 8 * i) sourceConfiguration];
      if ([v8 sourceType] == 1)
      {
        if ([v8 sourceDeviceType] - 17 > 3) {
          return 0;
        }
        BOOL v5 = 1;
      }
    }
    uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v4);
  return v5;
}

+ (void)initialize
{
}

BOOL __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = [[FigCaptureSourceConfiguration alloc] initWithXPCEncoding:a3];
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4 != 0;
}

- (void)removeConnectionConfiguration:(id)a3
{
}

- (id)osStatePropertyList
{
  id v2 = [(FigCaptureSessionConfiguration *)self copyXPCEncoding];
  uint64_t v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  xpc_release(v2);
  return v3;
}

@end