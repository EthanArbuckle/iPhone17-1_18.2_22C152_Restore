@interface FigCaptureConnectionConfiguration
- (BOOL)enabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)smartCameraRequired;
- (BOOL)sourcesFromUnderlyingStream;
- (FigCaptureCameraCalibrationDataSinkConfiguration)cameraCalibrationDataSinkConfiguration;
- (FigCaptureConnectionConfiguration)init;
- (FigCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3;
- (FigCaptureDepthDataSinkConfiguration)depthDataSinkConfiguration;
- (FigCaptureIrisSinkConfiguration)irisSinkConfiguration;
- (FigCaptureMovieFileSinkConfiguration)movieFileSinkConfiguration;
- (FigCapturePointCloudDataSinkConfiguration)pointCloudDataSinkConfiguration;
- (FigCaptureSinkConfiguration)sinkConfiguration;
- (FigCaptureSourceConfiguration)sourceConfiguration;
- (FigCaptureStillImageSinkConfiguration)stillImageSinkConfiguration;
- (FigCaptureVideoDataSinkConfiguration)videoDataSinkConfiguration;
- (FigCaptureVideoPreviewSinkConfiguration)videoPreviewSinkConfiguration;
- (FigCaptureVideoThumbnailSinkConfiguration)thumbnailSinkConfiguration;
- (NSString)connectionID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (int)underlyingDeviceType;
- (unsigned)mediaType;
- (void)dealloc;
- (void)setConnectionID:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setMediaType:(unsigned int)a3;
- (void)setSinkConfiguration:(id)a3;
- (void)setSourceConfiguration:(id)a3;
- (void)setUnderlyingDeviceType:(int)a3;
@end

@implementation FigCaptureConnectionConfiguration

- (FigCaptureSourceConfiguration)sourceConfiguration
{
  return self->_sourceConfiguration;
}

- (FigCaptureVideoPreviewSinkConfiguration)videoPreviewSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureVideoPreviewSinkConfiguration *)v2 sinkType] == 1) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureIrisSinkConfiguration)irisSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureIrisSinkConfiguration *)v2 sinkType] == 10) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureSinkConfiguration)sinkConfiguration
{
  return self->_sinkConfiguration;
}

- (BOOL)smartCameraRequired
{
  v3 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] source];
  if (v3)
  {
    id v17 = 0;
    v4 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] source];
    uint64_t v5 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v5) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = *(void (**)(OpaqueFigCaptureSource *, __CFString *, void, id *))(v6 + 48);
    if (v7)
    {
      v7(v4, @"AttributesDictionary", *MEMORY[0x1E4F1CF80], &v17);
      id v8 = v17;
    }
    else
    {
      id v8 = 0;
    }
    int v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", @"SmartCameraSupported"), "BOOLValue");

    if (v9)
    {
      BOOL v10 = [(NSArray *)[(FigCaptureSourceVideoFormat *)[(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] requiredFormat] AVCaptureSessionPresets] containsObject:@"AVCaptureSessionPresetPhoto"];
      BOOL v11 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] depthDataDeliveryEnabled];
      BOOL v12 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] spatialOverCaptureEnabled];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v13 = [(FigCaptureConnectionConfiguration *)self portraitAutoSuggestEnabled];
      }
      else {
        int v13 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        char v14 = FigCaptureMetadataObjectConfigurationRequiresSceneClassification(self);
        if (!v10) {
          goto LABEL_19;
        }
      }
      else
      {
        char v14 = 0;
        if (!v10) {
          goto LABEL_19;
        }
      }
      if ((!v11 | v12 | v13) == 1)
      {
        BOOL v15 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] imageControlMode] != 4;
LABEL_20:
        LOBYTE(v3) = v14 | v15;
        return (char)v3;
      }
LABEL_19:
      BOOL v15 = 0;
      goto LABEL_20;
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    uint64_t v19 = v5;
    uint64_t v20 = v4;
    uint64_t v21 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_8:
      LOBYTE(v12) = 0;
      return v12;
    }
    BOOL v11 = [(FigCaptureConnectionConfiguration *)self connectionID];
    if (v11 == (NSString *)[a3 connectionID]
      || (int v12 = -[NSString isEqual:](-[FigCaptureConnectionConfiguration connectionID](self, "connectionID"), "isEqual:", [a3 connectionID])) != 0)
    {
      unsigned int v13 = [(FigCaptureConnectionConfiguration *)self mediaType];
      if (v13 != [a3 mediaType]) {
        goto LABEL_8;
      }
      int v14 = [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
      if (v14 != [a3 underlyingDeviceType]) {
        goto LABEL_8;
      }
      int v15 = [(FigCaptureConnectionConfiguration *)self enabled];
      if (v15 != [a3 enabled]) {
        goto LABEL_8;
      }
      v16 = [(FigCaptureConnectionConfiguration *)self sourceConfiguration];
      if (v16 == (FigCaptureSourceConfiguration *)[a3 sourceConfiguration]
        || (int v12 = -[FigCaptureSourceConfiguration isEqual:](-[FigCaptureConnectionConfiguration sourceConfiguration](self, "sourceConfiguration"), "isEqual:", [a3 sourceConfiguration])) != 0)
      {
        id v17 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
        if (v17 == (FigCaptureSinkConfiguration *)[a3 sinkConfiguration]
          || (int v12 = -[FigCaptureSinkConfiguration isEqual:](-[FigCaptureConnectionConfiguration sinkConfiguration](self, "sinkConfiguration"), "isEqual:", [a3 sinkConfiguration])) != 0)
        {
          LOBYTE(v12) = 1;
        }
      }
    }
  }
  return v12;
}

- (NSString)connectionID
{
  return self->_connectionID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConnectionID:", -[FigCaptureConnectionConfiguration connectionID](self, "connectionID"));
  objc_msgSend(v5, "setMediaType:", -[FigCaptureConnectionConfiguration mediaType](self, "mediaType"));
  objc_msgSend(v5, "setUnderlyingDeviceType:", -[FigCaptureConnectionConfiguration underlyingDeviceType](self, "underlyingDeviceType"));
  objc_msgSend(v5, "setEnabled:", -[FigCaptureConnectionConfiguration enabled](self, "enabled"));
  id v6 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] copyWithZone:a3];
  [v5 setSourceConfiguration:v6];

  id v7 = [(FigCaptureSinkConfiguration *)[(FigCaptureConnectionConfiguration *)self sinkConfiguration] copyWithZone:a3];
  [v5 setSinkConfiguration:v7];

  return v5;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setSourceConfiguration:(id)a3
{
}

- (void)setUnderlyingDeviceType:(int)a3
{
  self->_underlyingDeviceType = a3;
}

- (void)setSinkConfiguration:(id)a3
{
}

- (FigCaptureConnectionConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureConnectionConfiguration;
  result = [(FigCaptureConnectionConfiguration *)&v3 init];
  if (result) {
    result->_enabled = 1;
  }
  return result;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (void)setConnectionID:(id)a3
{
}

- (int)underlyingDeviceType
{
  return self->_underlyingDeviceType;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureConnectionConfiguration;
  [(FigCaptureConnectionConfiguration *)&v3 dealloc];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  uint64_t v4 = (objc_class *)objc_opt_class();
  Name = class_getName(v4);
  xpc_dictionary_set_string(v3, "class", Name);
  id v6 = [(FigCaptureSinkConfiguration *)[(FigCaptureConnectionConfiguration *)self sinkConfiguration] copyXPCEncoding];
  [(FigCaptureConnectionConfiguration *)self connectionID];
  FigXPCMessageSetCFString();
  xpc_dictionary_set_int64(v3, "mediaType", [(FigCaptureConnectionConfiguration *)self mediaType]);
  xpc_dictionary_set_int64(v3, "underlyingDeviceType", [(FigCaptureConnectionConfiguration *)self underlyingDeviceType]);
  xpc_dictionary_set_value(v3, "sink", v6);
  xpc_dictionary_set_BOOL(v3, "enabled", [(FigCaptureConnectionConfiguration *)self enabled]);
  xpc_release(v6);
  return v3;
}

- (FigCaptureMovieFileSinkConfiguration)movieFileSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureMovieFileSinkConfiguration *)v2 sinkType] == 4) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureStillImageSinkConfiguration)stillImageSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureStillImageSinkConfiguration *)v2 sinkType] == 3) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureVideoThumbnailSinkConfiguration)thumbnailSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureVideoThumbnailSinkConfiguration *)v2 sinkType] == 12) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureDepthDataSinkConfiguration)depthDataSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureDepthDataSinkConfiguration *)v2 sinkType] == 11) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureVideoDataSinkConfiguration)videoDataSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureVideoDataSinkConfiguration *)v2 sinkType] == 6) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureConnectionConfiguration)initWithXPCEncoding:(id)a3
{
  xpc_object_t v3 = self;
  if (!a3)
  {
    fig_log_get_emitter();
    goto LABEL_10;
  }
  v10.receiver = self;
  v10.super_class = (Class)FigCaptureConnectionConfiguration;
  xpc_object_t v3 = [(FigCaptureConnectionConfiguration *)&v10 init];
  if (v3)
  {
    xpc_object_t value = xpc_dictionary_get_value(a3, "sink");
    FigXPCMessageCopyCFString();
    v3->_mediaType = xpc_dictionary_get_int64(a3, "mediaType");
    v3->_underlyingDeviceType = xpc_dictionary_get_int64(a3, "underlyingDeviceType");
    string = xpc_dictionary_get_string(value, "class");
    if (!string) {
      goto LABEL_11;
    }
    Class Class = objc_getClass(string);
    if (![(objc_class *)Class isSubclassOfClass:objc_opt_class()]) {
      goto LABEL_11;
    }
    uint64_t v8 = [[Class alloc] initWithXPCEncoding:value];
    v3->_sinkConfiguration = (FigCaptureSinkConfiguration *)v8;
    if (v8)
    {
      v3->_enabled = xpc_dictionary_get_BOOL(a3, "enabled");
      return v3;
    }
    fig_log_get_emitter();
LABEL_10:
    FigDebugAssert3();
LABEL_11:

    return 0;
  }
  return v3;
}

- (BOOL)sourcesFromUnderlyingStream
{
  int v3 = [(FigCaptureSourceConfiguration *)[(FigCaptureConnectionConfiguration *)self sourceConfiguration] sourceDeviceType];
  return v3 != [(FigCaptureConnectionConfiguration *)self underlyingDeviceType];
}

- (FigCapturePointCloudDataSinkConfiguration)pointCloudDataSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCapturePointCloudDataSinkConfiguration *)v2 sinkType] == 15) {
    return v2;
  }
  else {
    return 0;
  }
}

- (FigCaptureCameraCalibrationDataSinkConfiguration)cameraCalibrationDataSinkConfiguration
{
  v2 = [(FigCaptureConnectionConfiguration *)self sinkConfiguration];
  if ([(FigCaptureCameraCalibrationDataSinkConfiguration *)v2 sinkType] == 16) {
    return v2;
  }
  else {
    return 0;
  }
}

@end