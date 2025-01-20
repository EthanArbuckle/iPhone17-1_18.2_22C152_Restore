@interface ARReplayConfiguration
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4 outError:(id *)a5;
- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4 replayMode:(int64_t)a5 outError:(id *)a6;
- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 replaySensor:(id)a4;
- (ARReplayConfigurationDelegate)delegate;
- (BOOL)isEqual:(id)a3;
- (NSNumber)vioSessionID;
- (NSString)description;
- (NSURL)fileURL;
- (id)imageSensorSettings;
- (id)imageSensorSettingsForUltraWide;
- (id)initPrivate;
- (id)parentImageSensorSettings;
- (id)secondaryTechniques;
- (int64_t)worldAlignment;
- (void)ensureTechniqueAndCustomSensorCompatibility;
- (void)pause;
- (void)play;
- (void)replaySensorDidFinishReplayingData;
- (void)setAlwaysUsePrimaryCameraForHiResOrX420VideoFormat;
- (void)setDelegate:(id)a3;
@end

@implementation ARReplayConfiguration

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return 1;
}

- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4 outError:(id *)a5
{
  return [(ARReplayConfiguration *)self initWithBaseConfiguration:a3 fileURL:a4 replayMode:0 outError:a5];
}

- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4 replayMode:(int64_t)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = (objc_class *)ARReplaySensorClassForMovieURL(v11, a6);
  if (v12)
  {
    v13 = (void *)[[v12 alloc] initWithSequenceURL:v11 replayMode:a5];
    [v13 setReplaySensorDelegate:self];
    self = [(ARReplayConfiguration *)self initWithBaseConfiguration:v10 replaySensor:v13];

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (ARReplayConfiguration)initWithBaseConfiguration:(id)a3 replaySensor:(id)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [v6 parentImageSensorSettings];
    [v8 setParentImageSensorSettings:v9];
  }
  v22.receiver = self;
  v22.super_class = (Class)ARReplayConfiguration;
  id v10 = [(ARCustomTechniquesConfiguration *)&v22 initPrivate];
  id v11 = (ARReplayConfiguration *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 17, a4);
    uint64_t v12 = [v7 sequenceURL];
    fileURL = v11->_fileURL;
    v11->_fileURL = (NSURL *)v12;

    uint64_t v14 = [MEMORY[0x1E4F4D5D8] grabCMSessionID:v11->_fileURL];
    vioSessionID = v11->_vioSessionID;
    v11->_vioSessionID = (NSNumber *)v14;

    v16 = [v7 replaySensorDelegate];

    if (!v16) {
      [v7 setReplaySensorDelegate:v11];
    }
    [(ARCustomTechniquesConfiguration *)v11 setTemplateConfiguration:v6];
    if (v7)
    {
      v23[0] = v7;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [(ARCustomTechniquesConfiguration *)v11 setCustomSensors:v17];
    }
    else
    {
      [(ARCustomTechniquesConfiguration *)v11 setCustomSensors:MEMORY[0x1E4F1CBF0]];
    }
    [(ARReplayConfiguration *)v11 setAlwaysUsePrimaryCameraForHiResOrX420VideoFormat];
    v18 = [(ARCustomTechniquesConfiguration *)v11 templateConfiguration];
    v19 = [v18 techniques];
    [(ARCustomTechniquesConfiguration *)v11 setTechniques:v19];

    -[ARConfiguration setFrameSemantics:](v11, "setFrameSemantics:", [v6 frameSemantics]);
    -[ARConfiguration setFrameDebugOptions:](v11, "setFrameDebugOptions:", [v6 frameDebugOptions]);
    -[ARConfiguration setPersonMetadataEnabled:](v11, "setPersonMetadataEnabled:", [v6 isPersonMetadataEnabled]);
    v20 = v11;
  }

  return v11;
}

- (id)initPrivate
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[ARReplayConfiguration initPrivate]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  id v8 = [(ARReplayConfiguration *)self initWithBaseConfiguration:v6 fileURL:v7 outError:0];

  return v8;
}

- (void)play
{
}

- (void)pause
{
}

- (int64_t)worldAlignment
{
  v2 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  int64_t v3 = [v2 worldAlignment];

  return v3;
}

- (id)parentImageSensorSettings
{
  v2 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  uint64_t v4 = [v3 parentImageSensorSettings];

  v26 = v4;
  v5 = [v4 settings];
  id v6 = (void *)[v5 mutableCopy];

  v28 = [MEMORY[0x1E4F1CA48] array];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    id v11 = &OBJC_IVAR___ARMLImageProcessingTechnique__espressoInputTensors;
    v27 = v2;
    do
    {
      uint64_t v12 = 0;
      uint64_t v29 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * v12);
        uint64_t v14 = v11[15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v15 = *(id *)((char *)&v2->super.super.super.isa + v14);
          v16 = [v13 videoFormat];
          v17 = v16;
          if (!v16) {
            goto LABEL_13;
          }
          v18 = [v16 device];

          if (v18)
          {
            v19 = [v17 device];
            v20 = [v19 deviceType];
            [v17 device];
            uint64_t v21 = v10;
            v23 = id v22 = v7;
            v24 = objc_msgSend(v15, "availableVideoFormatForDeviceType:position:", v20, objc_msgSend(v23, "position"));

            id v7 = v22;
            uint64_t v10 = v21;
            v2 = v27;
          }
          else
          {
            v19 = [v17 captureDeviceType];
            v24 = objc_msgSend(v15, "availableVideoFormatForDeviceType:position:", v19, objc_msgSend(v17, "captureDevicePosition"));
          }

          id v11 = &OBJC_IVAR___ARMLImageProcessingTechnique__espressoInputTensors;
          if (v24)
          {
            [v13 setVideoFormat:v24];
          }
          else
          {
LABEL_13:
            [v28 addObject:v13];
          }

          uint64_t v9 = v29;
        }
        ++v12;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  [v7 removeObjectsInArray:v28];
  [v26 setSettings:v7];

  return v26;
}

- (id)imageSensorSettings
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int64_t v3 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
    uint64_t v4 = [v3 imageSensorSettings];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = self->_replaySensor;
      id v6 = [v4 videoFormat];
      id v7 = v6;
      if (v6)
      {
        uint64_t v8 = [v6 device];

        if (v8)
        {
          uint64_t v9 = [v7 device];
          uint64_t v10 = [v9 deviceType];
          id v11 = [v7 device];
          uint64_t v12 = -[ARReplaySensorProtocol availableVideoFormatForDeviceType:position:](v5, "availableVideoFormatForDeviceType:position:", v10, [v11 position]);
        }
        else
        {
          uint64_t v9 = [v7 captureDeviceType];
          uint64_t v12 = -[ARReplaySensorProtocol availableVideoFormatForDeviceType:position:](v5, "availableVideoFormatForDeviceType:position:", v9, [v7 captureDevicePosition]);
        }

        if (v12)
        {
          [v4 setVideoFormat:v12];
        }
      }
    }
    [v4 setVisionDataOutputEnabled:0];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ARReplayConfiguration;
    uint64_t v4 = [(ARCustomTechniquesConfiguration *)&v14 imageSensorSettings];
  }
  return v4;
}

- (id)imageSensorSettingsForUltraWide
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = 0;
    goto LABEL_17;
  }
  int64_t v3 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v5 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();

    v5 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
    if ((v6 & 1) == 0)
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();

      if ((v7 & 1) == 0)
      {
        id v8 = 0;
        goto LABEL_15;
      }
      v5 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
    }
  }
  id v8 = [v5 imageSensorSettingsForUltraWide];

  if (!v8)
  {
LABEL_15:
    id v8 = v8;
    v16 = v8;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_11:
    [v8 setVisionDataOutputEnabled:0];
    goto LABEL_15;
  }
  uint64_t v9 = self->_replaySensor;
  uint64_t v10 = [v8 videoFormat];
  if (v10)
  {
    id v11 = (void *)v10;
    uint64_t v12 = [v8 videoFormat];
    v13 = [v12 captureDeviceType];
    objc_super v14 = [v8 videoFormat];
    id v15 = -[ARReplaySensorProtocol availableVideoFormatForDeviceType:position:](v9, "availableVideoFormatForDeviceType:position:", v13, [v14 captureDevicePosition]);

    if (v15)
    {
      [v8 setVideoFormat:v15];

      goto LABEL_11;
    }
  }

  v16 = 0;
LABEL_16:

LABEL_17:
  return v16;
}

- (NSNumber)vioSessionID
{
  vioSessionID = self->_vioSessionID;
  if (!vioSessionID)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F4D5D8];
    v5 = [(ARReplayConfiguration *)self fileURL];
    char v6 = [v4 grabCMSessionID:v5];
    char v7 = (NSNumber *)[v6 copy];
    id v8 = self->_vioSessionID;
    self->_vioSessionID = v7;

    vioSessionID = self->_vioSessionID;
  }
  return vioSessionID;
}

- (void)ensureTechniqueAndCustomSensorCompatibility
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)ARReplayConfiguration;
  [(ARCustomTechniquesConfiguration *)&v13 ensureTechniqueAndCustomSensorCompatibility];
  int64_t v3 = [(ARCustomTechniquesConfiguration *)self techniques];
  uint64_t v4 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v3];
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 options];
    char v7 = [(ARReplayConfiguration *)self vioSessionID];
    [v6 setVioSessionID:v7];

    id v8 = [v5 mutableOptions];
    char v9 = [v8 isEqual:v6];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [[ARWorldTrackingTechnique alloc] initWithOptions:v6];
      v14[0] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t v12 = +[ARParentTechnique techniquesByForceReplacingTechniques:v3 withMatchingClassTechniques:v11];
      [(ARCustomTechniquesConfiguration *)self setTechniques:v12];
    }
  }
}

- (id)secondaryTechniques
{
  v21[1] = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  uint64_t v4 = [v3 secondaryTechniques];

  v5 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v4];
  char v6 = v5;
  if (v5)
  {
    char v7 = [v5 options];
    id v8 = [(ARConfiguration *)self deviceModel];
    [v7 setDeviceModel:v8];

    char v9 = [(ARConfiguration *)self replaySensor];
    uint64_t v10 = v9;
    if (v9 && [v9 replayMode]) {
      [v7 setDeterministicMode:1];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v7, "setVisionDataWillBeReplayed:", objc_msgSend(v10, "shouldReplayVisionData"));
    }
    if (self->super.super._videoFormat)
    {
      id v11 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        objc_super v13 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
        objc_super v14 = [v13 imageSensorSettingsForWorldTracking];

        [v14 setVisionDataOutputEnabled:0];
        [v7 setImageSensorSettings:v14];
      }
    }
    id v15 = [v6 mutableOptions];
    int v16 = [v15 isEqual:v7];

    if (v16)
    {
      id v17 = v4;
    }
    else
    {
      v18 = [[ARWorldTrackingTechnique alloc] initWithOptions:v7];
      v21[0] = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      id v17 = +[ARParentTechnique techniquesByForceReplacingTechniques:v4 withMatchingClassTechniques:v19];
    }
  }
  else
  {
    id v17 = v4;
  }

  return v17;
}

- (void)setAlwaysUsePrimaryCameraForHiResOrX420VideoFormat
{
  int64_t v3 = [(ARConfiguration *)self replaySensor];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return;
  }
  id v13 = [(ARConfiguration *)self replaySensor];
  v5 = [v13 availableVideoFormatForDeviceType:*MEMORY[0x1E4F15830] position:1];
  char v6 = v5;
  if (v5
    && (([v5 has4KVideoResolution] & 1) != 0 || objc_msgSend(v6, "isX420PixelFormat")))
  {
    char v7 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
    char v8 = [v7 isKindOfConfiguration:objc_opt_class()];

    char v9 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
    if (v8) {
      goto LABEL_9;
    }
    char v10 = [v9 isKindOfConfiguration:objc_opt_class()];

    char v9 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
    if (v10) {
      goto LABEL_9;
    }
    int v11 = [v9 isKindOfConfiguration:objc_opt_class()];

    if (v11)
    {
      char v9 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
LABEL_9:
      uint64_t v12 = [v9 getAsKindOfConfiguration:objc_opt_class()];

      [v12 setAlwaysUsePrimaryCameraForTracking:1];
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  return a3 == self;
}

- (NSString)description
{
  int64_t v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@" fileURL=%@", self->_fileURL];
  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (void)replaySensorDidFinishReplayingData
{
  id v3 = [(ARReplayConfiguration *)self delegate];
  [v3 replayConfigurationDidFinishReplaying:self];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (ARReplayConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARReplayConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_vioSessionID, 0);
  objc_storeStrong((id *)&self->_replaySensor, 0);
}

@end