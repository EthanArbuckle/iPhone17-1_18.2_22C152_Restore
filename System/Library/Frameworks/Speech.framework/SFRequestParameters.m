@interface SFRequestParameters
+ (BOOL)supportsSecureCoding;
- (BOOL)detectMultipleUtterances;
- (BOOL)enableAutoPunctuation;
- (BOOL)isEqual:(id)a3;
- (BOOL)narrowband;
- (BOOL)onDeviceOnly;
- (NSArray)inlineItemList;
- (NSDictionary)recognitionOverrides;
- (NSString)applicationName;
- (NSString)applicationVersion;
- (NSString)language;
- (NSString)requestIdentifier;
- (NSString)task;
- (NSString)taskIdentifier;
- (NSURL)dynamicLanguageModel;
- (NSURL)dynamicVocabulary;
- (NSURL)modelOverrideURL;
- (SFRequestParameters)initWithCoder:(id)a3;
- (double)maximumRecognitionDuration;
- (id)clientIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationName:(id)a3;
- (void)setApplicationVersion:(id)a3;
- (void)setDetectMultipleUtterances:(BOOL)a3;
- (void)setDynamicLanguageModel:(id)a3;
- (void)setDynamicVocabulary:(id)a3;
- (void)setEnableAutoPunctuation:(BOOL)a3;
- (void)setInlineItemList:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMaximumRecognitionDuration:(double)a3;
- (void)setModelOverrideURL:(id)a3;
- (void)setNarrowband:(BOOL)a3;
- (void)setOnDeviceOnly:(BOOL)a3;
- (void)setRecognitionOverrides:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskIdentifier:(id)a3;
@end

@implementation SFRequestParameters

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicVocabulary, 0);
  objc_storeStrong((id *)&self->_dynamicLanguageModel, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);
  objc_storeStrong((id *)&self->_recognitionOverrides, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_inlineItemList, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);

  objc_storeStrong((id *)&self->_applicationName, 0);
}

- (void)setEnableAutoPunctuation:(BOOL)a3
{
  self->_enableAutoPunctuation = a3;
}

- (BOOL)enableAutoPunctuation
{
  return self->_enableAutoPunctuation;
}

- (void)setOnDeviceOnly:(BOOL)a3
{
  self->_onDeviceOnly = a3;
}

- (BOOL)onDeviceOnly
{
  return self->_onDeviceOnly;
}

- (void)setDetectMultipleUtterances:(BOOL)a3
{
  self->_detectMultipleUtterances = a3;
}

- (BOOL)detectMultipleUtterances
{
  return self->_detectMultipleUtterances;
}

- (void)setDynamicVocabulary:(id)a3
{
}

- (NSURL)dynamicVocabulary
{
  return self->_dynamicVocabulary;
}

- (void)setDynamicLanguageModel:(id)a3
{
}

- (NSURL)dynamicLanguageModel
{
  return self->_dynamicLanguageModel;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)setModelOverrideURL:(id)a3
{
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (void)setRecognitionOverrides:(id)a3
{
}

- (NSDictionary)recognitionOverrides
{
  return self->_recognitionOverrides;
}

- (void)setNarrowband:(BOOL)a3
{
  self->_narrowband = a3;
}

- (BOOL)narrowband
{
  return self->_narrowband;
}

- (void)setTask:(id)a3
{
}

- (NSString)task
{
  return self->_task;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setTaskIdentifier:(id)a3
{
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setInlineItemList:(id)a3
{
}

- (NSArray)inlineItemList
{
  return self->_inlineItemList;
}

- (void)setApplicationVersion:(id)a3
{
}

- (NSString)applicationVersion
{
  return self->_applicationVersion;
}

- (void)setApplicationName:(id)a3
{
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (SFRequestParameters)initWithCoder:(id)a3
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFRequestParameters;
  v5 = [(SFRequestParameters *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::applicationName"];
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::applicationVersion"];
    applicationVersion = v5->_applicationVersion;
    v5->_applicationVersion = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    v12 = [v10 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"SFRequestParameters::inlineItemList"];
    inlineItemList = v5->_inlineItemList;
    v5->_inlineItemList = (NSArray *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::requestIdentifier"];
    requestIdentifier = v5->_requestIdentifier;
    v5->_requestIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::taskIdentifier"];
    taskIdentifier = v5->_taskIdentifier;
    v5->_taskIdentifier = (NSString *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::task"];
    task = v5->_task;
    v5->_task = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::language"];
    language = v5->_language;
    v5->_language = (NSString *)v21;

    v5->_narrowband = [v4 decodeBoolForKey:@"SFRequestParameters::narrowband"];
    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    v25 = [v23 setWithArray:v24];
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"SFRequestParameters::recognitionOverrides"];
    recognitionOverrides = v5->_recognitionOverrides;
    v5->_recognitionOverrides = (NSDictionary *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::modelOverrideURL"];
    modelOverrideURL = v5->_modelOverrideURL;
    v5->_modelOverrideURL = (NSURL *)v28;

    [v4 decodeDoubleForKey:@"SFRequestParameters::maximumRecognitionDuration"];
    v5->_maximumRecognitionDuration = v30;
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::dynamicLanguageModel"];
    dynamicLanguageModel = v5->_dynamicLanguageModel;
    v5->_dynamicLanguageModel = (NSURL *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SFRequestParameters::dynamicVocabulary"];
    dynamicVocabulary = v5->_dynamicVocabulary;
    v5->_dynamicVocabulary = (NSURL *)v33;

    v5->_detectMultipleUtterances = [v4 decodeBoolForKey:@"SFRequestParameters::detectMultipleUtterances"];
    v5->_onDeviceOnly = [v4 decodeBoolForKey:@"SFRequestParameters::onDeviceOnly"];
    v5->_enableAutoPunctuation = [v4 decodeBoolForKey:@"SFRequestParameters::enableAutoPunctuation"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  applicationName = self->_applicationName;
  id v5 = a3;
  [v5 encodeObject:applicationName forKey:@"SFRequestParameters::applicationName"];
  [v5 encodeObject:self->_applicationVersion forKey:@"SFRequestParameters::applicationVersion"];
  [v5 encodeObject:self->_inlineItemList forKey:@"SFRequestParameters::inlineItemList"];
  [v5 encodeObject:self->_requestIdentifier forKey:@"SFRequestParameters::requestIdentifier"];
  [v5 encodeObject:self->_taskIdentifier forKey:@"SFRequestParameters::taskIdentifier"];
  [v5 encodeObject:self->_task forKey:@"SFRequestParameters::task"];
  [v5 encodeObject:self->_language forKey:@"SFRequestParameters::language"];
  [v5 encodeBool:self->_narrowband forKey:@"SFRequestParameters::narrowband"];
  [v5 encodeObject:self->_recognitionOverrides forKey:@"SFRequestParameters::recognitionOverrides"];
  [v5 encodeObject:self->_modelOverrideURL forKey:@"SFRequestParameters::modelOverrideURL"];
  [v5 encodeDouble:@"SFRequestParameters::maximumRecognitionDuration" forKey:self->_maximumRecognitionDuration];
  [v5 encodeObject:self->_dynamicLanguageModel forKey:@"SFRequestParameters::dynamicLanguageModel"];
  [v5 encodeObject:self->_dynamicVocabulary forKey:@"SFRequestParameters::dynamicVocabulary"];
  [v5 encodeBool:self->_detectMultipleUtterances forKey:@"SFRequestParameters::detectMultipleUtterances"];
  [v5 encodeBool:self->_onDeviceOnly forKey:@"SFRequestParameters::onDeviceOnly"];
  [v5 encodeBool:self->_enableAutoPunctuation forKey:@"SFRequestParameters::enableAutoPunctuation"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)SFRequestParameters;
  v3 = [(SFRequestParameters *)&v6 description];
  id v4 = [v3 stringByAppendingFormat:@", applicationName=%@, applicationVersion=%@, inlineItemList=%@, requestIdentifier=%@ task=%@ language=%@ narrowband=%d recognitionOverrides=%@ modelOverrideURL=%@ maximumRecognitionDuration=%f dynamicLanguageModel=%@ dynamicVocabulary=%@ detectMultipleUtterances=%d onDeviceOnly=%d enableAutoPunctuation=%d", self->_applicationName, self->_applicationVersion, self->_inlineItemList, self->_requestIdentifier, self->_task, self->_language, self->_narrowband, self->_recognitionOverrides, self->_modelOverrideURL, *(void *)&self->_maximumRecognitionDuration, self->_dynamicLanguageModel, self->_dynamicVocabulary, self->_detectMultipleUtterances, self->_onDeviceOnly, self->_enableAutoPunctuation];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSString **)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_29;
  }
  applicationName = self->_applicationName;
  if (applicationName != v4[2] && !-[NSString isEqual:](applicationName, "isEqual:")) {
    goto LABEL_29;
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion != v4[3] && !-[NSString isEqual:](applicationVersion, "isEqual:")) {
    goto LABEL_29;
  }
  inlineItemList = self->_inlineItemList;
  if (inlineItemList != (NSArray *)v4[4] && !-[NSArray isEqual:](inlineItemList, "isEqual:")) {
    goto LABEL_29;
  }
  requestIdentifier = self->_requestIdentifier;
  if (requestIdentifier != v4[5] && !-[NSString isEqual:](requestIdentifier, "isEqual:")) {
    goto LABEL_29;
  }
  if (((taskIdentifier = self->_taskIdentifier, taskIdentifier == v4[6])
     || -[NSString isEqual:](taskIdentifier, "isEqual:"))
    && ((task = self->_task, task == v4[8]) || -[NSString isEqual:](task, "isEqual:"))
    && ((language = self->_language, language == v4[7]) || -[NSString isEqual:](language, "isEqual:"))
    && self->_narrowband == *((unsigned __int8 *)v4 + 8)
    && ((recognitionOverrides = self->_recognitionOverrides, recognitionOverrides == (NSDictionary *)v4[9])
     || -[NSDictionary isEqual:](recognitionOverrides, "isEqual:"))
    && ((modelOverrideURL = self->_modelOverrideURL, modelOverrideURL == (NSURL *)v4[10])
     || -[NSURL isEqual:](modelOverrideURL, "isEqual:"))
    && self->_maximumRecognitionDuration == *((double *)v4 + 11)
    && ((dynamicLanguageModel = self->_dynamicLanguageModel, dynamicLanguageModel == (NSURL *)v4[12])
     || -[NSURL isEqual:](dynamicLanguageModel, "isEqual:"))
    && ((dynamicVocabulary = self->_dynamicVocabulary, dynamicVocabulary == (NSURL *)v4[13])
     || -[NSURL isEqual:](dynamicVocabulary, "isEqual:"))
    && self->_detectMultipleUtterances == *((unsigned __int8 *)v4 + 9)
    && self->_onDeviceOnly == *((unsigned __int8 *)v4 + 10))
  {
    BOOL v16 = self->_enableAutoPunctuation == *((unsigned __int8 *)v4 + 11);
  }
  else
  {
LABEL_29:
    BOOL v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  return [(NSString *)self->_requestIdentifier hash];
}

- (id)clientIdentifier
{
  applicationName = self->_applicationName;
  if (applicationName)
  {
    v3 = applicationName;
  }
  else
  {
    v3 = +[SFUtilities defaultClientID];
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end