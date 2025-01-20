@interface _SFSpeechRecognizerSupportedFeatures
+ (BOOL)supportsSecureCoding;
- (BOOL)concatenateUtterances;
- (BOOL)isSingleUtteranceTask;
- (EARVoiceCommandActiveSet)voiceCommandActiveSet;
- (NSLocale)locale;
- (NSSet)taskNames;
- (_SFSpeechRecognizerDetectorOptions)detectionOptions;
- (_SFSpeechRecognizerModelOptions)modelOptions;
- (_SFSpeechRecognizerSupportedFeatures)initWithCoder:(id)a3;
- (_SFSpeechRecognizerSupportedFeatures)initWithLocale:(id)a3 taskNames:(id)a4 singleUtterance:(BOOL)a5 concatenateUtterances:(BOOL)a6 voiceCommandActiveSet:(id)a7 modelOptions:(id)a8 detectionOptions:(id)a9 flags:(unint64_t)a10;
- (id)description;
- (unint64_t)flags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFSpeechRecognizerSupportedFeatures

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionOptions, 0);
  objc_storeStrong((id *)&self->_modelOptions, 0);
  objc_storeStrong((id *)&self->_voiceCommandActiveSet, 0);
  objc_storeStrong((id *)&self->_taskNames, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (BOOL)concatenateUtterances
{
  return self->_concatenateUtterances;
}

- (BOOL)isSingleUtteranceTask
{
  return self->_isSingleUtteranceTask;
}

- (_SFSpeechRecognizerDetectorOptions)detectionOptions
{
  return self->_detectionOptions;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (_SFSpeechRecognizerModelOptions)modelOptions
{
  return self->_modelOptions;
}

- (EARVoiceCommandActiveSet)voiceCommandActiveSet
{
  return self->_voiceCommandActiveSet;
}

- (NSSet)taskNames
{
  return self->_taskNames;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (id)description
{
  v3 = NSString;
  v4 = [(NSLocale *)self->_locale localeIdentifier];
  v5 = [v3 stringWithFormat:@"<_SFSpeechRecognizerSupportedFeatures (%p): locale %@, taskNames %@, singleUtterance %d, concatenateUtterances %d, modelOptions %@, detectionOptions %@, flags %#lx>", self, v4, self->_taskNames, self->_isSingleUtteranceTask, self->_concatenateUtterances, self->_modelOptions, self->_detectionOptions, self->_flags];

  return v5;
}

- (_SFSpeechRecognizerSupportedFeatures)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFSpeechRecognizerSupportedFeatures;
  v5 = [(_SFSpeechRecognizerSupportedFeatures *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"_taskNames"];
    taskNames = v5->_taskNames;
    v5->_taskNames = (NSSet *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceCommandActiveSet"];
    voiceCommandActiveSet = v5->_voiceCommandActiveSet;
    v5->_voiceCommandActiveSet = (EARVoiceCommandActiveSet *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelOptions"];
    modelOptions = v5->_modelOptions;
    v5->_modelOptions = (_SFSpeechRecognizerModelOptions *)v15;

    v5->_flags = [v4 decodeIntegerForKey:@"_flags"];
    v5->_isSingleUtteranceTask = [v4 decodeBoolForKey:@"_isSingleUtteranceTask"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_detectionOptions"];
    detectionOptions = v5->_detectionOptions;
    v5->_detectionOptions = (_SFSpeechRecognizerDetectorOptions *)v17;

    v5->_concatenateUtterances = [v4 decodeBoolForKey:@"_concatenateUtterances"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFSpeechRecognizerSupportedFeatures *)self locale];
  [v9 encodeObject:v4 forKey:@"_locale"];

  v5 = [(_SFSpeechRecognizerSupportedFeatures *)self taskNames];
  [v9 encodeObject:v5 forKey:@"_taskNames"];

  uint64_t v6 = [(_SFSpeechRecognizerSupportedFeatures *)self voiceCommandActiveSet];
  [v9 encodeObject:v6 forKey:@"_voiceCommandActiveSet"];

  v7 = [(_SFSpeechRecognizerSupportedFeatures *)self modelOptions];
  [v9 encodeObject:v7 forKey:@"_modelOptions"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[_SFSpeechRecognizerSupportedFeatures flags](self, "flags"), @"_flags");
  objc_msgSend(v9, "encodeBool:forKey:", -[_SFSpeechRecognizerSupportedFeatures isSingleUtteranceTask](self, "isSingleUtteranceTask"), @"_isSingleUtteranceTask");
  v8 = [(_SFSpeechRecognizerSupportedFeatures *)self detectionOptions];
  [v9 encodeObject:v8 forKey:@"_detectionOptions"];

  objc_msgSend(v9, "encodeBool:forKey:", -[_SFSpeechRecognizerSupportedFeatures concatenateUtterances](self, "concatenateUtterances"), @"_concatenateUtterances");
}

- (_SFSpeechRecognizerSupportedFeatures)initWithLocale:(id)a3 taskNames:(id)a4 singleUtterance:(BOOL)a5 concatenateUtterances:(BOOL)a6 voiceCommandActiveSet:(id)a7 modelOptions:(id)a8 detectionOptions:(id)a9 flags:(unint64_t)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)_SFSpeechRecognizerSupportedFeatures;
  v21 = [(_SFSpeechRecognizerSupportedFeatures *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    locale = v21->_locale;
    v21->_locale = (NSLocale *)v22;

    uint64_t v24 = [v17 copy];
    taskNames = v21->_taskNames;
    v21->_taskNames = (NSSet *)v24;

    uint64_t v26 = [v18 copy];
    voiceCommandActiveSet = v21->_voiceCommandActiveSet;
    v21->_voiceCommandActiveSet = (EARVoiceCommandActiveSet *)v26;

    uint64_t v28 = [v19 copy];
    modelOptions = v21->_modelOptions;
    v21->_modelOptions = (_SFSpeechRecognizerModelOptions *)v28;

    v21->_flags = a10;
    objc_storeStrong((id *)&v21->_detectionOptions, a9);
    v21->_isSingleUtteranceTask = a5;
    v21->_concatenateUtterances = a6;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end