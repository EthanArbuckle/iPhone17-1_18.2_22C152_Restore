@interface AFSpeechParameters
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFSpeechParameters)init;
- (AFSpeechParameters)initWithBuilder:(id)a3;
- (AFSpeechParameters)initWithCoder:(id)a3;
- (AFSpeechParameters)initWithLanguage:(id)a3 interactionIdentifier:(id)a4 task:(id)a5 loggingContext:(id)a6 applicationName:(id)a7 profile:(id)a8 overrides:(id)a9 modelOverrideURL:(id)a10 originalAudioFileURL:(id)a11 narrowband:(BOOL)a12 detectUtterances:(BOOL)a13 censorSpeech:(BOOL)a14 farField:(BOOL)a15 secureOfflineOnly:(BOOL)a16 shouldStoreAudioOnDevice:(BOOL)a17 maximumRecognitionDuration:(double)a18 inputOrigin:(id)a19 location:(id)a20 jitGrammar:(id)a21;
- (BOOL)censorSpeech;
- (BOOL)detectUtterances;
- (BOOL)farField;
- (BOOL)isEqual:(id)a3;
- (BOOL)narrowband;
- (BOOL)secureOfflineOnly;
- (BOOL)shouldStoreAudioOnDevice;
- (CLLocation)location;
- (NSArray)jitGrammar;
- (NSArray)loggingContext;
- (NSData)profile;
- (NSDictionary)overrides;
- (NSString)applicationName;
- (NSString)inputOrigin;
- (NSString)interactionIdentifier;
- (NSString)language;
- (NSString)task;
- (NSURL)modelOverrideURL;
- (NSURL)originalAudioFileURL;
- (double)maximumRecognitionDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jitGrammar, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_originalAudioFileURL, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_loggingContext, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

- (NSArray)jitGrammar
{
  return self->_jitGrammar;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (BOOL)shouldStoreAudioOnDevice
{
  return self->_shouldStoreAudioOnDevice;
}

- (BOOL)secureOfflineOnly
{
  return self->_secureOfflineOnly;
}

- (BOOL)farField
{
  return self->_farField;
}

- (BOOL)censorSpeech
{
  return self->_censorSpeech;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (BOOL)narrowband
{
  return self->_narrowband;
}

- (NSURL)originalAudioFileURL
{
  return self->_originalAudioFileURL;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSDictionary)overrides
{
  return self->_overrides;
}

- (NSData)profile
{
  return self->_profile;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (NSArray)loggingContext
{
  return self->_loggingContext;
}

- (NSString)task
{
  return self->_task;
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSString)language
{
  return self->_language;
}

- (void)encodeWithCoder:(id)a3
{
  language = self->_language;
  id v12 = a3;
  [v12 encodeObject:language forKey:@"AFSpeechParameters::language"];
  [v12 encodeObject:self->_interactionIdentifier forKey:@"AFSpeechParameters::interactionIdentifier"];
  [v12 encodeObject:self->_task forKey:@"AFSpeechParameters::task"];
  [v12 encodeObject:self->_loggingContext forKey:@"AFSpeechParameters::loggingContext"];
  [v12 encodeObject:self->_applicationName forKey:@"AFSpeechParameters::applicationName"];
  [v12 encodeObject:self->_profile forKey:@"AFSpeechParameters::profile"];
  [v12 encodeObject:self->_overrides forKey:@"AFSpeechParameters::overrides"];
  [v12 encodeObject:self->_modelOverrideURL forKey:@"AFSpeechParameters::modelOverrideURL"];
  [v12 encodeObject:self->_originalAudioFileURL forKey:@"AFSpeechParameters::originalAudioFileURL"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_narrowband];
  [v12 encodeObject:v5 forKey:@"AFSpeechParameters::narrowband"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_detectUtterances];
  [v12 encodeObject:v6 forKey:@"AFSpeechParameters::detectUtterances"];

  v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_censorSpeech];
  [v12 encodeObject:v7 forKey:@"AFSpeechParameters::censorSpeech"];

  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_farField];
  [v12 encodeObject:v8 forKey:@"AFSpeechParameters::farField"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_secureOfflineOnly];
  [v12 encodeObject:v9 forKey:@"AFSpeechParameters::secureOfflineOnly"];

  v10 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldStoreAudioOnDevice];
  [v12 encodeObject:v10 forKey:@"AFSpeechParameters::shouldStoreAudioOnDevice"];

  v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_maximumRecognitionDuration];
  [v12 encodeObject:v11 forKey:@"AFSpeechParameters::maximumRecognitionDuration"];

  [v12 encodeObject:self->_inputOrigin forKey:@"AFSpeechParameters::inputOrigin"];
  [v12 encodeObject:self->_location forKey:@"AFSpeechParameters::location"];
  [v12 encodeObject:self->_jitGrammar forKey:@"AFSpeechParameters::jitGrammar"];
}

- (AFSpeechParameters)initWithCoder:(id)a3
{
  id v3 = a3;
  v42 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::language"];
  v41 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::interactionIdentifier"];
  v40 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::task"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v39 = [v3 decodeObjectOfClasses:v6 forKey:@"AFSpeechParameters::loggingContext"];

  v38 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::applicationName"];
  v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::profile"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v36 = [v3 decodeObjectOfClasses:v10 forKey:@"AFSpeechParameters::overrides"];

  v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::modelOverrideURL"];
  v32 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::originalAudioFileURL"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::narrowband"];
  char v12 = [v11 BOOLValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::detectUtterances"];
  char v34 = [v13 BOOLValue];

  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::censorSpeech"];
  char v33 = [v14 BOOLValue];

  v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::farField"];
  char v16 = [v15 BOOLValue];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::secureOfflineOnly"];
  char v18 = [v17 BOOLValue];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::shouldStoreAudioOnDevice"];
  char v20 = [v19 BOOLValue];

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::maximumRecognitionDuration"];
  [v21 doubleValue];
  double v23 = v22;

  v31 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::inputOrigin"];
  v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFSpeechParameters::location"];
  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  v27 = [v3 decodeObjectOfClasses:v26 forKey:@"AFSpeechParameters::jitGrammar"];

  BYTE5(v29) = v20;
  BYTE4(v29) = v18;
  BYTE3(v29) = v16;
  BYTE2(v29) = v33;
  BYTE1(v29) = v34;
  LOBYTE(v29) = v12;
  v44 = -[AFSpeechParameters initWithLanguage:interactionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:maximumRecognitionDuration:inputOrigin:location:jitGrammar:](self, "initWithLanguage:interactionIdentifier:task:loggingContext:applicationName:profile:overrides:modelOverrideURL:originalAudioFileURL:narrowband:detectUtterances:censorSpeech:farField:secureOfflineOnly:shouldStoreAudioOnDevice:maximumRecognitionDuration:inputOrigin:location:jitGrammar:", v42, v41, v40, v39, v38, v37, v23, v36, v35, v32, v29, v31, v30, v27);

  return v44;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AFSpeechParameters *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      BOOL narrowband = self->_narrowband;
      if (narrowband == [(AFSpeechParameters *)v5 narrowband]
        && (BOOL detectUtterances = self->_detectUtterances,
            detectUtterances == [(AFSpeechParameters *)v5 detectUtterances])
        && (BOOL censorSpeech = self->_censorSpeech, censorSpeech == [(AFSpeechParameters *)v5 censorSpeech])
        && (BOOL farField = self->_farField, farField == [(AFSpeechParameters *)v5 farField])
        && (BOOL secureOfflineOnly = self->_secureOfflineOnly,
            secureOfflineOnly == [(AFSpeechParameters *)v5 secureOfflineOnly])
        && (BOOL shouldStoreAudioOnDevice = self->_shouldStoreAudioOnDevice,
            shouldStoreAudioOnDevice == [(AFSpeechParameters *)v5 shouldStoreAudioOnDevice])
        && (double maximumRecognitionDuration = self->_maximumRecognitionDuration,
            [(AFSpeechParameters *)v5 maximumRecognitionDuration],
            maximumRecognitionDuration == v13))
      {
        char v16 = [(AFSpeechParameters *)v5 language];
        language = self->_language;
        if (language == v16 || [(NSString *)language isEqual:v16])
        {
          char v18 = [(AFSpeechParameters *)v5 interactionIdentifier];
          interactionIdentifier = self->_interactionIdentifier;
          if (interactionIdentifier == v18
            || [(NSString *)interactionIdentifier isEqual:v18])
          {
            char v20 = [(AFSpeechParameters *)v5 task];
            task = self->_task;
            if (task == v20 || [(NSString *)task isEqual:v20])
            {
              double v22 = [(AFSpeechParameters *)v5 loggingContext];
              loggingContext = self->_loggingContext;
              if (loggingContext == v22 || [(NSArray *)loggingContext isEqual:v22])
              {
                v24 = [(AFSpeechParameters *)v5 applicationName];
                applicationName = self->_applicationName;
                if (applicationName == v24 || [(NSString *)applicationName isEqual:v24])
                {
                  v26 = [(AFSpeechParameters *)v5 profile];
                  profile = self->_profile;
                  if (profile == v26 || [(NSData *)profile isEqual:v26])
                  {
                    v28 = [(AFSpeechParameters *)v5 overrides];
                    overrides = self->_overrides;
                    if (overrides == v28 || [(NSDictionary *)overrides isEqual:v28])
                    {
                      uint64_t v30 = [(AFSpeechParameters *)v5 modelOverrideURL];
                      modelOverrideURL = self->_modelOverrideURL;
                      v44 = (void *)v30;
                      if (modelOverrideURL == (NSURL *)v30
                        || [(NSURL *)modelOverrideURL isEqual:v30])
                      {
                        uint64_t v32 = [(AFSpeechParameters *)v5 originalAudioFileURL];
                        originalAudioFileURL = self->_originalAudioFileURL;
                        v43 = (void *)v32;
                        if (originalAudioFileURL == (NSURL *)v32
                          || [(NSURL *)originalAudioFileURL isEqual:v32])
                        {
                          uint64_t v34 = [(AFSpeechParameters *)v5 inputOrigin];
                          inputOrigin = self->_inputOrigin;
                          v42 = (void *)v34;
                          if (inputOrigin == (NSString *)v34
                            || [(NSString *)inputOrigin isEqual:v34])
                          {
                            uint64_t v36 = [(AFSpeechParameters *)v5 location];
                            location = self->_location;
                            v41 = (void *)v36;
                            if (location == (CLLocation *)v36
                              || [(CLLocation *)location isEqual:v36])
                            {
                              uint64_t v38 = [(AFSpeechParameters *)v5 jitGrammar];
                              jitGrammar = self->_jitGrammar;
                              v40 = (void *)v38;
                              BOOL v14 = jitGrammar == (NSArray *)v38
                                 || [(NSArray *)jitGrammar isEqual:v38];
                            }
                            else
                            {
                              BOOL v14 = 0;
                            }
                          }
                          else
                          {
                            BOOL v14 = 0;
                          }
                        }
                        else
                        {
                          BOOL v14 = 0;
                        }
                      }
                      else
                      {
                        BOOL v14 = 0;
                      }
                    }
                    else
                    {
                      BOOL v14 = 0;
                    }
                  }
                  else
                  {
                    BOOL v14 = 0;
                  }
                }
                else
                {
                  BOOL v14 = 0;
                }
              }
              else
              {
                BOOL v14 = 0;
              }
            }
            else
            {
              BOOL v14 = 0;
            }
          }
          else
          {
            BOOL v14 = 0;
          }
        }
        else
        {
          BOOL v14 = 0;
        }
      }
      else
      {
        BOOL v14 = 0;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
  }

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_language hash];
  NSUInteger v4 = [(NSString *)self->_interactionIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_task hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_loggingContext hash];
  NSUInteger v7 = [(NSString *)self->_applicationName hash];
  uint64_t v8 = v7 ^ [(NSData *)self->_profile hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSDictionary *)self->_overrides hash];
  uint64_t v10 = [(NSURL *)self->_modelOverrideURL hash];
  uint64_t v11 = v10 ^ [(NSURL *)self->_originalAudioFileURL hash];
  uint64_t v29 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_narrowband];
  uint64_t v12 = v9 ^ v11 ^ [v29 hash];
  double v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_detectUtterances];
  uint64_t v14 = [v13 hash];
  v15 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_censorSpeech];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_farField];
  uint64_t v18 = v12 ^ v16 ^ [v17 hash];
  v19 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_secureOfflineOnly];
  uint64_t v20 = [v19 hash];
  v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_shouldStoreAudioOnDevice];
  uint64_t v22 = v20 ^ [v21 hash];
  double v23 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_maximumRecognitionDuration];
  uint64_t v24 = v22 ^ [v23 hash];
  NSUInteger v25 = v18 ^ v24 ^ [(NSString *)self->_inputOrigin hash];
  uint64_t v26 = [(CLLocation *)self->_location hash];
  unint64_t v27 = v25 ^ v26 ^ [(NSArray *)self->_jitGrammar hash];

  return v27;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechParameters;
  NSUInteger v5 = [(AFSpeechParameters *)&v18 description];
  long long v16 = *(_OWORD *)&self->_task;
  long long v17 = *(_OWORD *)&self->_language;
  applicationName = self->_applicationName;
  NSUInteger v7 = [(NSData *)self->_profile length];
  uint64_t v8 = @"YES";
  if (self->_narrowband) {
    uint64_t v9 = @"YES";
  }
  else {
    uint64_t v9 = @"NO";
  }
  if (self->_detectUtterances) {
    uint64_t v10 = @"YES";
  }
  else {
    uint64_t v10 = @"NO";
  }
  if (self->_censorSpeech) {
    uint64_t v11 = @"YES";
  }
  else {
    uint64_t v11 = @"NO";
  }
  if (self->_farField) {
    uint64_t v12 = @"YES";
  }
  else {
    uint64_t v12 = @"NO";
  }
  if (self->_secureOfflineOnly) {
    double v13 = @"YES";
  }
  else {
    double v13 = @"NO";
  }
  if (!self->_shouldStoreAudioOnDevice) {
    uint64_t v8 = @"NO";
  }
  v14 = objc_msgSend(v4, "initWithFormat:", @"%@ {language = %@, interactionIdentifier = %@, task = %@, loggingContext = %@, applicationName = %@, profile = (%llu bytes), overrides = %@, modelOverrideURL = %@, originalAudioFileURL = %@, BOOL narrowband = %@, detectUtterances = %@, censorSpeech = %@, farField = %@, secureOfflineOnly = %@, shouldStoreAudioOnDevice = %@, maximumRecognitionDuration = %f, inputOrigin = %@, location = %@, jitGrammar = %@}", v5, v17, v16, applicationName, v7, *(_OWORD *)&self->_overrides, self->_originalAudioFileURL, v9, v10, v11, v12, v13, v8, *(void *)&self->_maximumRecognitionDuration, self->_inputOrigin, self->_location,
                  self->_jitGrammar);

  return v14;
}

- (id)description
{
  return [(AFSpeechParameters *)self _descriptionWithIndent:0];
}

- (AFSpeechParameters)initWithLanguage:(id)a3 interactionIdentifier:(id)a4 task:(id)a5 loggingContext:(id)a6 applicationName:(id)a7 profile:(id)a8 overrides:(id)a9 modelOverrideURL:(id)a10 originalAudioFileURL:(id)a11 narrowband:(BOOL)a12 detectUtterances:(BOOL)a13 censorSpeech:(BOOL)a14 farField:(BOOL)a15 secureOfflineOnly:(BOOL)a16 shouldStoreAudioOnDevice:(BOOL)a17 maximumRecognitionDuration:(double)a18 inputOrigin:(id)a19 location:(id)a20 jitGrammar:(id)a21
{
  id v53 = a3;
  id v45 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a9;
  id v32 = a10;
  id v33 = a11;
  id v34 = a19;
  id v35 = a20;
  id v36 = a21;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __305__AFSpeechParameters_initWithLanguage_interactionIdentifier_task_loggingContext_applicationName_profile_overrides_modelOverrideURL_originalAudioFileURL_narrowband_detectUtterances_censorSpeech_farField_secureOfflineOnly_shouldStoreAudioOnDevice_maximumRecognitionDuration_inputOrigin_location_jitGrammar___block_invoke;
  v54[3] = &unk_1E592A0F8;
  id v55 = v53;
  id v56 = v45;
  id v57 = v27;
  id v58 = v28;
  id v59 = v29;
  id v60 = v30;
  id v61 = v31;
  id v62 = v32;
  BOOL v68 = a12;
  BOOL v69 = a13;
  BOOL v70 = a14;
  BOOL v71 = a15;
  BOOL v72 = a16;
  BOOL v73 = a17;
  double v67 = a18;
  id v63 = v33;
  id v64 = v34;
  id v65 = v35;
  id v66 = v36;
  id v51 = v36;
  id v50 = v35;
  id v49 = v34;
  id v48 = v33;
  id v47 = v32;
  id v46 = v31;
  id v37 = v30;
  id v38 = v29;
  id v39 = v28;
  id v40 = v27;
  id v41 = v45;
  id v42 = v53;
  v43 = [(AFSpeechParameters *)self initWithBuilder:v54];

  return v43;
}

void __305__AFSpeechParameters_initWithLanguage_interactionIdentifier_task_loggingContext_applicationName_profile_overrides_modelOverrideURL_originalAudioFileURL_narrowband_detectUtterances_censorSpeech_farField_secureOfflineOnly_shouldStoreAudioOnDevice_maximumRecognitionDuration_inputOrigin_location_jitGrammar___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setLanguage:v3];
  [v4 setInteractionIdentifier:*(void *)(a1 + 40)];
  [v4 setTask:*(void *)(a1 + 48)];
  [v4 setLoggingContext:*(void *)(a1 + 56)];
  [v4 setApplicationName:*(void *)(a1 + 64)];
  [v4 setProfile:*(void *)(a1 + 72)];
  [v4 setOverrides:*(void *)(a1 + 80)];
  [v4 setModelOverrideURL:*(void *)(a1 + 88)];
  [v4 setOriginalAudioFileURL:*(void *)(a1 + 96)];
  [v4 setNarrowband:*(unsigned __int8 *)(a1 + 136)];
  [v4 setDetectUtterances:*(unsigned __int8 *)(a1 + 137)];
  [v4 setCensorSpeech:*(unsigned __int8 *)(a1 + 138)];
  [v4 setFarField:*(unsigned __int8 *)(a1 + 139)];
  [v4 setSecureOfflineOnly:*(unsigned __int8 *)(a1 + 140)];
  [v4 setShouldStoreAudioOnDevice:*(unsigned __int8 *)(a1 + 141)];
  [v4 setMaximumRecognitionDuration:*(double *)(a1 + 128)];
  [v4 setInputOrigin:*(void *)(a1 + 104)];
  [v4 setLocation:*(void *)(a1 + 112)];
  [v4 setJitGrammar:*(void *)(a1 + 120)];
}

- (AFSpeechParameters)init
{
  return [(AFSpeechParameters *)self initWithBuilder:0];
}

- (AFSpeechParameters)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechParametersMutation *))a3;
  v46.receiver = self;
  v46.super_class = (Class)AFSpeechParameters;
  NSUInteger v5 = [(AFSpeechParameters *)&v46 init];
  uint64_t v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFSpeechParametersMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSpeechParametersMutation *)v7 isDirty])
    {
      uint64_t v8 = [(_AFSpeechParametersMutation *)v7 getLanguage];
      uint64_t v9 = [v8 copy];
      language = v6->_language;
      v6->_language = (NSString *)v9;

      uint64_t v11 = [(_AFSpeechParametersMutation *)v7 getInteractionIdentifier];
      uint64_t v12 = [v11 copy];
      interactionIdentifier = v6->_interactionIdentifier;
      v6->_interactionIdentifier = (NSString *)v12;

      uint64_t v14 = [(_AFSpeechParametersMutation *)v7 getTask];
      uint64_t v15 = [v14 copy];
      task = v6->_task;
      v6->_task = (NSString *)v15;

      long long v17 = [(_AFSpeechParametersMutation *)v7 getLoggingContext];
      uint64_t v18 = [v17 copy];
      loggingContext = v6->_loggingContext;
      v6->_loggingContext = (NSArray *)v18;

      uint64_t v20 = [(_AFSpeechParametersMutation *)v7 getApplicationName];
      uint64_t v21 = [v20 copy];
      applicationName = v6->_applicationName;
      v6->_applicationName = (NSString *)v21;

      double v23 = [(_AFSpeechParametersMutation *)v7 getProfile];
      uint64_t v24 = [v23 copy];
      profile = v6->_profile;
      v6->_profile = (NSData *)v24;

      uint64_t v26 = [(_AFSpeechParametersMutation *)v7 getOverrides];
      uint64_t v27 = [v26 copy];
      overrides = v6->_overrides;
      v6->_overrides = (NSDictionary *)v27;

      id v29 = [(_AFSpeechParametersMutation *)v7 getModelOverrideURL];
      uint64_t v30 = [v29 copy];
      modelOverrideURL = v6->_modelOverrideURL;
      v6->_modelOverrideURL = (NSURL *)v30;

      id v32 = [(_AFSpeechParametersMutation *)v7 getOriginalAudioFileURL];
      uint64_t v33 = [v32 copy];
      originalAudioFileURL = v6->_originalAudioFileURL;
      v6->_originalAudioFileURL = (NSURL *)v33;

      v6->_BOOL narrowband = [(_AFSpeechParametersMutation *)v7 getNarrowband];
      v6->_BOOL detectUtterances = [(_AFSpeechParametersMutation *)v7 getDetectUtterances];
      v6->_BOOL censorSpeech = [(_AFSpeechParametersMutation *)v7 getCensorSpeech];
      v6->_BOOL farField = [(_AFSpeechParametersMutation *)v7 getFarField];
      v6->_BOOL secureOfflineOnly = [(_AFSpeechParametersMutation *)v7 getSecureOfflineOnly];
      v6->_BOOL shouldStoreAudioOnDevice = [(_AFSpeechParametersMutation *)v7 getShouldStoreAudioOnDevice];
      [(_AFSpeechParametersMutation *)v7 getMaximumRecognitionDuration];
      v6->_double maximumRecognitionDuration = v35;
      id v36 = [(_AFSpeechParametersMutation *)v7 getInputOrigin];
      uint64_t v37 = [v36 copy];
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v37;

      id v39 = [(_AFSpeechParametersMutation *)v7 getLocation];
      uint64_t v40 = [v39 copy];
      location = v6->_location;
      v6->_location = (CLLocation *)v40;

      id v42 = [(_AFSpeechParametersMutation *)v7 getJitGrammar];
      uint64_t v43 = [v42 copy];
      jitGrammar = v6->_jitGrammar;
      v6->_jitGrammar = (NSArray *)v43;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFSpeechParametersMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_AFSpeechParametersMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSpeechParametersMutation *)v5 isDirty])
    {
      uint64_t v6 = objc_alloc_init(AFSpeechParameters);
      NSUInteger v7 = [(_AFSpeechParametersMutation *)v5 getLanguage];
      uint64_t v8 = [v7 copy];
      language = v6->_language;
      v6->_language = (NSString *)v8;

      uint64_t v10 = [(_AFSpeechParametersMutation *)v5 getInteractionIdentifier];
      uint64_t v11 = [v10 copy];
      interactionIdentifier = v6->_interactionIdentifier;
      v6->_interactionIdentifier = (NSString *)v11;

      double v13 = [(_AFSpeechParametersMutation *)v5 getTask];
      uint64_t v14 = [v13 copy];
      task = v6->_task;
      v6->_task = (NSString *)v14;

      long long v16 = [(_AFSpeechParametersMutation *)v5 getLoggingContext];
      uint64_t v17 = [v16 copy];
      loggingContext = v6->_loggingContext;
      v6->_loggingContext = (NSArray *)v17;

      v19 = [(_AFSpeechParametersMutation *)v5 getApplicationName];
      uint64_t v20 = [v19 copy];
      applicationName = v6->_applicationName;
      v6->_applicationName = (NSString *)v20;

      uint64_t v22 = [(_AFSpeechParametersMutation *)v5 getProfile];
      uint64_t v23 = [v22 copy];
      profile = v6->_profile;
      v6->_profile = (NSData *)v23;

      NSUInteger v25 = [(_AFSpeechParametersMutation *)v5 getOverrides];
      uint64_t v26 = [v25 copy];
      overrides = v6->_overrides;
      v6->_overrides = (NSDictionary *)v26;

      id v28 = [(_AFSpeechParametersMutation *)v5 getModelOverrideURL];
      uint64_t v29 = [v28 copy];
      modelOverrideURL = v6->_modelOverrideURL;
      v6->_modelOverrideURL = (NSURL *)v29;

      id v31 = [(_AFSpeechParametersMutation *)v5 getOriginalAudioFileURL];
      uint64_t v32 = [v31 copy];
      originalAudioFileURL = v6->_originalAudioFileURL;
      v6->_originalAudioFileURL = (NSURL *)v32;

      v6->_BOOL narrowband = [(_AFSpeechParametersMutation *)v5 getNarrowband];
      v6->_BOOL detectUtterances = [(_AFSpeechParametersMutation *)v5 getDetectUtterances];
      v6->_BOOL censorSpeech = [(_AFSpeechParametersMutation *)v5 getCensorSpeech];
      v6->_BOOL farField = [(_AFSpeechParametersMutation *)v5 getFarField];
      v6->_BOOL secureOfflineOnly = [(_AFSpeechParametersMutation *)v5 getSecureOfflineOnly];
      v6->_BOOL shouldStoreAudioOnDevice = [(_AFSpeechParametersMutation *)v5 getShouldStoreAudioOnDevice];
      [(_AFSpeechParametersMutation *)v5 getMaximumRecognitionDuration];
      v6->_double maximumRecognitionDuration = v34;
      double v35 = [(_AFSpeechParametersMutation *)v5 getInputOrigin];
      uint64_t v36 = [v35 copy];
      inputOrigin = v6->_inputOrigin;
      v6->_inputOrigin = (NSString *)v36;

      id v38 = [(_AFSpeechParametersMutation *)v5 getLocation];
      uint64_t v39 = [v38 copy];
      location = v6->_location;
      v6->_location = (CLLocation *)v39;

      id v41 = [(_AFSpeechParametersMutation *)v5 getJitGrammar];
      uint64_t v42 = [v41 copy];
      jitGrammar = v6->_jitGrammar;
      v6->_jitGrammar = (NSArray *)v42;
    }
    else
    {
      uint64_t v6 = (AFSpeechParameters *)[(AFSpeechParameters *)self copy];
    }
  }
  else
  {
    uint64_t v6 = (AFSpeechParameters *)[(AFSpeechParameters *)self copy];
  }

  return v6;
}

@end