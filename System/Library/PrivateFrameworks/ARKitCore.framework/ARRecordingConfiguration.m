@interface ARRecordingConfiguration
+ (BOOL)isSupported;
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
- (ARRecordingConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4;
- (ARRecordingConfiguration)initWithBaseConfiguration:(id)a3 recordingTechnique:(id)a4;
- (ARRecordingTechniqueProtocol)recordingTechnique;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)customUserData;
- (NSString)description;
- (NSURL)fileURL;
- (id)finishBlock;
- (id)imageSensorSettings;
- (id)initPrivate;
- (id)parentImageSensorSettings;
- (id)secondaryTechniques;
- (id)videoFormat;
- (int64_t)worldAlignment;
- (unint64_t)state;
- (void)abortRecording;
- (void)finishRecordingWithHandler:(id)a3;
- (void)setCustomUserData:(id)a3;
- (void)setFinishBlock:(id)a3;
- (void)setRecordingTechnique:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setVideoFormat:(id)a3;
- (void)startRecording;
- (void)technique:(id)a3 didFinishWithResult:(id)a4;
@end

@implementation ARRecordingConfiguration

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  return 1;
}

- (ARRecordingConfiguration)initWithBaseConfiguration:(id)a3 fileURL:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v8 = [v6 techniques];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    uint64_t v12 = 15;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        v12 |= [*(id *)(*((void *)&v27 + 1) + 8 * i) requiredSensorDataTypes];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v12 = 15;
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v14 = objc_msgSend(v6, "secondaryTechniques", 0);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        v12 |= [*(id *)(*((void *)&v23 + 1) + 8 * j) requiredSensorDataTypes];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v19 = [v6 isCollaborationEnabled];
  }
  else {
    uint64_t v19 = 0;
  }
  v20 = [[ARRecordingTechniquePublic alloc] initWithFileURL:v7 recordingSensorDataTypes:v12 startImmediately:0 recordCollaborationData:v19];
  v21 = [(ARRecordingConfiguration *)self initWithBaseConfiguration:v6 recordingTechnique:v20];

  return v21;
}

- (ARRecordingConfiguration)initWithBaseConfiguration:(id)a3 recordingTechnique:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 templateConfiguration];
    uint64_t v9 = [(ARRecordingConfiguration *)self initWithBaseConfiguration:v8 recordingTechnique:v7];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)ARRecordingConfiguration;
    uint64_t v10 = [(ARCustomTechniquesConfiguration *)&v20 initPrivate];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = v7;
        uint64_t v12 = [v6 parentImageSensorSettings];
        [v11 setParentImageSensorSettings:v12];
      }
      objc_storeStrong(v10 + 18, a4);
      uint64_t v13 = [v7 outputFileURL];
      id v14 = v10[17];
      v10[17] = (id)v13;

      uint64_t v15 = [v6 techniques];
      uint64_t v16 = (void *)[v15 mutableCopy];

      [v10 setTemplateConfiguration:v6];
      uint64_t v17 = [v16 indexOfObjectPassingTest:&__block_literal_global_118];
      if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
        [v16 removeObjectAtIndex:v17];
      }
      [v16 addObject:v7];
      objc_msgSend(v10, "setAutoFocusEnabled:", objc_msgSend(v6, "isAutoFocusEnabled"));
      objc_msgSend(v10, "setProvidesAudioData:", objc_msgSend(v6, "providesAudioData"));
      v18 = [v6 customSensors];
      [v10 setCustomSensors:v18];

      objc_msgSend(v10, "setFrameSemantics:", objc_msgSend(v6, "frameSemantics"));
      [v10 setTechniques:v16];
    }
    uint64_t v9 = v10;
  }

  return v9;
}

uint64_t __73__ARRecordingConfiguration_initWithBaseConfiguration_recordingTechnique___block_invoke(uint64_t a1, void *a2)
{
  return [a2 conformsToProtocol:&unk_1F12682D8];
}

- (id)initPrivate
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[ARRecordingConfiguration initPrivate]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  id v6 = objc_opt_new();
  id v7 = objc_opt_new();
  v8 = [(ARRecordingConfiguration *)self initWithBaseConfiguration:v6 fileURL:v7];

  return v8;
}

- (ARRecordingTechniqueProtocol)recordingTechnique
{
  [(ARCustomTechniquesConfiguration *)self _configureRecordingTechniqueIfNeeded];
  recordingTechnique = self->_recordingTechnique;
  return recordingTechnique;
}

- (void)startRecording
{
  if ([(ARRecordingConfiguration *)self state]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"You cannot start more than once"];
  }
  [(ARRecordingConfiguration *)self setState:1];
  v3 = [(ARRecordingConfiguration *)self customUserData];
  [(ARRecordingTechniqueProtocol *)self->_recordingTechnique setCustomUserData:v3];

  id v4 = [(ARRecordingConfiguration *)self recordingTechnique];
  [v4 startRecording];
}

- (void)finishRecordingWithHandler:(id)a3
{
  id v4 = a3;
  if ([(ARRecordingConfiguration *)self state] != 1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"You cannot finish before start or more than once"];
  }
  [(ARRecordingConfiguration *)self setState:2];
  [(ARRecordingConfiguration *)self setFinishBlock:v4];

  v5 = [(ARRecordingConfiguration *)self recordingTechnique];
  [v5 setRecordingTechniqueDelegate:self];

  id v6 = [(ARRecordingConfiguration *)self recordingTechnique];
  [v6 finishRecording];
}

- (void)abortRecording
{
  if ([(ARRecordingConfiguration *)self state] == 1)
  {
    [(ARRecordingConfiguration *)self setState:2];
    id v3 = [(ARRecordingConfiguration *)self recordingTechnique];
    [v3 abortRecording];
  }
}

+ (BOOL)isSupported
{
  return +[ARRecordingTechniquePublic isSupported];
}

- (int64_t)worldAlignment
{
  v2 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  int64_t v3 = [v2 worldAlignment];

  return v3;
}

- (void)setVideoFormat:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v7 = [NSString stringWithUTF8String:"-[ARRecordingConfiguration setVideoFormat:]"];
  v5 = (objc_class *)objc_opt_class();
  id v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"%@: Cannot set videoFormat for %@.", v7, v6 format];
}

- (id)videoFormat
{
  v2 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  int64_t v3 = [v2 videoFormat];

  return v3;
}

- (id)imageSensorSettings
{
  v2 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  int64_t v3 = [v2 imageSensorSettings];

  return v3;
}

- (id)parentImageSensorSettings
{
  v2 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  int64_t v3 = [v2 parentImageSensorSettings];

  return v3;
}

- (id)secondaryTechniques
{
  v2 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  int64_t v3 = [v2 secondaryTechniques];

  return v3;
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
  id v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  [v6 appendFormat:@" fileURL=%@", self->_fileURL];
  id v7 = [(ARCustomTechniquesConfiguration *)self templateConfiguration];
  v8 = [v7 description];
  [v6 appendFormat:@" templateConfiguration=%@", v8];

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (void)technique:(id)a3 didFinishWithResult:(id)a4
{
  id v7 = a4;
  v5 = [(ARRecordingConfiguration *)self finishBlock];

  if (v5)
  {
    id v6 = [(ARRecordingConfiguration *)self finishBlock];
    ((void (**)(void, id))v6)[2](v6, v7);

    [(ARRecordingConfiguration *)self setFinishBlock:0];
  }
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setRecordingTechnique:(id)a3
{
}

- (NSDictionary)customUserData
{
  return self->_customUserData;
}

- (void)setCustomUserData:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (id)finishBlock
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setFinishBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_finishBlock, 0);
  objc_storeStrong((id *)&self->_customUserData, 0);
  objc_storeStrong((id *)&self->_recordingTechnique, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end