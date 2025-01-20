@interface ARCustomTechniquesConfiguration
+ (NSArray)supportedVideoFormats;
- (ARConfiguration)templateConfiguration;
- (ARWorldMap)initialWorldMap;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLightEstimationEnabled;
- (NSArray)techniques;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageSensorSettings;
- (id)imageSensorSettingsForUltraWide;
- (id)initPrivate;
- (int64_t)worldAlignment;
- (void)_configureRecordingTechniqueIfNeeded;
- (void)_ensureTechniqueAndCustomSensorCompatibilityIfNeeded;
- (void)_updateCaptureSettings;
- (void)configureRecordingTechnique;
- (void)ensureTechniqueAndCustomSensorCompatibility;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCustomSensors:(id)a3;
- (void)setProvidesAudioData:(BOOL)a3;
- (void)setTechniques:(id)a3;
- (void)setTemplateConfiguration:(id)a3;
- (void)setVideoFormat:(id)a3;
@end

@implementation ARCustomTechniquesConfiguration

+ (NSArray)supportedVideoFormats
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)initPrivate
{
  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  id v2 = [(ARConfiguration *)&v4 initPrivate];
  if (v2 && ARShouldSupport1440pAndAutofocus()) {
    [v2 setAutoFocusEnabled:1];
  }
  return v2;
}

- (void)setVideoFormat:(id)a3
{
}

- (id)imageSensorSettings
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)ARCustomTechniquesConfiguration;
  v3 = [(ARConfiguration *)&v18 imageSensorSettings];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v4 = self->_techniques;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    v8 = (void *)MEMORY[0x1E4F15E48];
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_12;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v8 = (void *)MEMORY[0x1E4F15E30];
LABEL_12:
          objc_msgSend(v3, "setMetaData:", *v8, v14);
          goto LABEL_13;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  templateConfiguration = self->_templateConfiguration;
  if (templateConfiguration)
  {
    v11 = [(ARConfiguration *)templateConfiguration imageSensorSettings];
    objc_msgSend(v3, "setVisionDataOutputEnabled:", objc_msgSend(v11, "visionDataOutputEnabled"));
    v12 = [v11 visionDataOutputParameters];
    [v3 setVisionDataOutputParameters:v12];
  }
  return v3;
}

- (int64_t)worldAlignment
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    templateConfiguration = self->_templateConfiguration;
    return [(ARConfiguration *)templateConfiguration worldAlignment];
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = [(ARCustomTechniquesConfiguration *)self techniques];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int64_t v11 = [v10 alignment];

            return v11;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    return 2;
  }
}

- (BOOL)isLightEstimationEnabled
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(ARCustomTechniquesConfiguration *)self techniques];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        BOOL v7 = 1;
        goto LABEL_13;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      BOOL v7 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_13:

  return v7;
}

- (ARWorldMap)initialWorldMap
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(ARCustomTechniquesConfiguration *)self techniques];
  uint64_t v5 = +[ARTechnique techniqueOfClass:v3 inArray:v4];

  uint64_t v6 = [v5 options];
  BOOL v7 = [v6 initialWorldMap];

  return (ARWorldMap *)v7;
}

- (void)setCustomSensors:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  [(ARConfiguration *)&v4 setCustomSensors:a3];
  [(ARCustomTechniquesConfiguration *)self _updateCaptureSettings];
  self->_needsEnsureTechniqueAndCustomSensorCompatibility = 1;
}

- (void)setCameraPosition:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  [(ARConfiguration *)&v4 setCameraPosition:a3];
  [(ARCustomTechniquesConfiguration *)self _updateCaptureSettings];
  self->_needsEnsureTechniqueAndCustomSensorCompatibility = 1;
}

- (void)setProvidesAudioData:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ARCustomTechniquesConfiguration;
  [(ARConfiguration *)&v4 setProvidesAudioData:a3];
  self->_needsConfigureRecordingTechnique = 1;
}

- (void)setTechniques:(id)a3
{
  objc_super v4 = (NSArray *)[a3 copy];
  techniques = self->_techniques;
  self->_techniques = v4;

  [(ARCustomTechniquesConfiguration *)self _updateCaptureSettings];
  self->_needsEnsureTechniqueAndCustomSensorCompatibility = 1;
  self->_needsConfigureRecordingTechnique = 1;
}

- (NSArray)techniques
{
  [(ARCustomTechniquesConfiguration *)self _ensureTechniqueAndCustomSensorCompatibilityIfNeeded];
  [(ARCustomTechniquesConfiguration *)self _configureRecordingTechniqueIfNeeded];
  techniques = self->_techniques;
  return techniques;
}

- (void)_updateCaptureSettings
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(ARConfiguration *)self customSensors];
  if (!v3)
  {
    if ([(ARConfiguration *)self cameraPosition]) {
      return;
    }
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 1;
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__8;
    v26 = __Block_byref_object_dispose__8;
    id v27 = (id)*MEMORY[0x1E4F15830];
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    techniques = self->_techniques;
    char v21 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __57__ARCustomTechniquesConfiguration__updateCaptureSettings__block_invoke;
    v17[3] = &unk_1E6188650;
    v17[4] = &v28;
    v17[5] = &v22;
    v17[6] = &v18;
    [(NSArray *)techniques enumerateObjectsUsingBlock:v17];
    uint64_t v5 = v29[3];
    if (v5 == [(ARVideoFormat *)self->super._videoFormat captureDevicePosition])
    {
      uint64_t v6 = (void *)v23[5];
      BOOL v7 = [(ARVideoFormat *)self->super._videoFormat captureDeviceType];
      LOBYTE(v6) = v6 == v7;

      if (v6) {
        goto LABEL_19;
      }
    }
    if (*((unsigned char *)v19 + 24))
    {
      uint64_t v8 = +[ARWorldTrackingConfiguration supportedVideoFormats];
      long long v9 = [v8 firstObject];
    }
    else
    {
      uint64_t v8 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:v29[3] deviceType:v23[5]];
      long long v11 = [v8 firstObject];
      videoFormat = self->super._videoFormat;
      self->super._videoFormat = v11;

      if (self->super._videoFormat || !ARRGBFaceTrackingEnabled()) {
        goto LABEL_14;
      }
      long long v9 = +[ARFaceTrackingConfiguration fallbackVideoFormat];
    }
    long long v10 = self->super._videoFormat;
    self->super._videoFormat = v9;

LABEL_14:
    if (_ARLogGeneral_onceToken_52 != -1) {
      dispatch_once(&_ARLogGeneral_onceToken_52, &__block_literal_global_178);
    }
    long long v13 = (id)_ARLogGeneral_logObj_52;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      long long v16 = [(ARVideoFormat *)self->super._videoFormat description];
      *(_DWORD *)buf = 138543874;
      id v33 = v15;
      __int16 v34 = 2048;
      v35 = self;
      __int16 v36 = 2114;
      v37 = v16;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Video format updated in custom techniques configurations: %{public}@", buf, 0x20u);
    }
LABEL_19:
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
    return;
  }
}

void __57__ARCustomTechniquesConfiguration__updateCaptureSettings__block_invoke(void *a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 techniqueOfClass:objc_opt_class()];
  if (v3)
  {

LABEL_4:
    *(void *)(*(void *)(a1[4] + 8) + 24) = 2;
    uint64_t v5 = ARFaceTrackingDevice();
    uint64_t v6 = *(void *)(a1[5] + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = v10;
    goto LABEL_5;
  }
  objc_super v4 = [v10 techniqueOfClass:objc_opt_class()];

  if (v4) {
    goto LABEL_4;
  }
  long long v9 = [v10 techniqueOfClass:objc_opt_class()];

  uint64_t v8 = v10;
  if (v9) {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
LABEL_5:
}

- (void)ensureTechniqueAndCustomSensorCompatibility
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:self->_techniques];
  objc_super v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 options];
    uint64_t v6 = (void *)[v5 copy];
    BOOL v7 = [(ARConfiguration *)self deviceModel];
    [v6 setDeviceModel:v7];

    uint64_t v8 = [(ARConfiguration *)self replaySensor];
    long long v9 = v8;
    if (v8 && [v8 replayMode]) {
      [v6 setDeterministicMode:1];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(v6, "setVisionDataWillBeReplayed:", objc_msgSend(v9, "shouldReplayVisionData"));
    }
    if (self->super._videoFormat)
    {
      id v10 = [(ARCustomTechniquesConfiguration *)self imageSensorSettings];
      [v6 setImageSensorSettings:v10];

      long long v11 = [(ARCustomTechniquesConfiguration *)self imageSensorSettingsForUltraWide];
      [v6 setImageSensorSettingsForUltraWide:v11];
    }
    if (([v5 isEqual:v6] & 1) == 0)
    {
      long long v12 = [[ARWorldTrackingTechnique alloc] initWithOptions:v6];
      context = (void *)MEMORY[0x1BA9C6160]();
      v18[0] = v12;
      techniques = self->_techniques;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      id v15 = +[ARParentTechnique techniquesByForceReplacingTechniques:techniques withMatchingClassTechniques:v14];
      long long v16 = self->_techniques;
      self->_techniques = v15;
    }
  }
}

- (id)imageSensorSettingsForUltraWide
{
  return 0;
}

- (void)configureRecordingTechnique
{
  techniques = self->_techniques;
  objc_super v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_125];
  id v9 = [(NSArray *)techniques filteredArrayUsingPredicate:v4];

  uint64_t v5 = [v9 firstObject];
  if (v5)
  {
    objc_msgSend(v5, "setExpectAudioData:", -[ARConfiguration providesAudioData](self, "providesAudioData"));
    uint64_t v6 = self->_techniques;
    BOOL v7 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_120_0];
    uint64_t v8 = [(NSArray *)v6 filteredArrayUsingPredicate:v7];

    objc_msgSend(v5, "setExpectDepthData:", objc_msgSend(v8, "count") != 0);
  }
}

uint64_t __62__ARCustomTechniquesConfiguration_configureRecordingTechnique__block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F12682D8];
}

unint64_t __62__ARCustomTechniquesConfiguration_configureRecordingTechnique__block_invoke_2(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 requiredSensorDataTypes] >> 5) & 1;
}

- (void)_ensureTechniqueAndCustomSensorCompatibilityIfNeeded
{
  if (self->_needsEnsureTechniqueAndCustomSensorCompatibility)
  {
    self->_needsEnsureTechniqueAndCustomSensorCompatibility = 0;
    [(ARCustomTechniquesConfiguration *)self ensureTechniqueAndCustomSensorCompatibility];
  }
}

- (void)_configureRecordingTechniqueIfNeeded
{
  if (self->_needsConfigureRecordingTechnique)
  {
    self->_needsConfigureRecordingTechnique = 0;
    [(ARCustomTechniquesConfiguration *)self configureRecordingTechnique];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARCustomTechniquesConfiguration;
  if ([(ARConfiguration *)&v10 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(ARCustomTechniquesConfiguration *)self techniques];
    BOOL v7 = [v5 techniques];

    char v8 = [v6 isEqualToArray:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ARCustomTechniquesConfiguration;
  id v4 = [(ARConfiguration *)&v11 copyWithZone:a3];
  id v5 = [(ARCustomTechniquesConfiguration *)self techniques];
  uint64_t v6 = [v5 copy];
  BOOL v7 = (void *)v4[15];
  v4[15] = v6;

  uint64_t v8 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  id v9 = (void *)v4[16];
  v4[16] = v8;

  return v4;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  BOOL v7 = [(ARCustomTechniquesConfiguration *)self techniques];
  uint64_t v8 = [v7 valueForKey:@"description"];
  id v9 = [v8 componentsJoinedByString:@", "];
  [v6 appendFormat:@" techniques=[%@]", v9];

  [v6 appendString:@">"];
  return v6;
}

- (ARConfiguration)templateConfiguration
{
  return self->_templateConfiguration;
}

- (void)setTemplateConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateConfiguration, 0);
  objc_storeStrong((id *)&self->_techniques, 0);
}

@end