@interface _SFSpeechRecognizerModelOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)atypicalSpeech;
- (BOOL)enableParallelLoading;
- (BOOL)farField;
- (BOOL)isEqual:(id)a3;
- (NSArray)speechProfileContainers;
- (NSArray)speechProfileURLs;
- (NSDictionary)userIdMask;
- (NSString)taskForMemoryLock;
- (NSURL)modelOverrideURL;
- (NSURL)supplementalModelURL;
- (_SFSpeechRecognizerModelOptions)initWithCoder:(id)a3;
- (_SFSpeechRecognizerModelOptions)initWithFarField:(BOOL)a3 supplementalModelURL:(id)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 userIdMask:(id)a7 taskForMemoryLock:(id)a8 atypicalSpeech:(BOOL)a9 enableParallelLoading:(BOOL)a10 speechProfileContainers:(id)a11;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFSpeechRecognizerModelOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileContainers, 0);
  objc_storeStrong((id *)&self->_taskForMemoryLock, 0);
  objc_storeStrong((id *)&self->_userIdMask, 0);
  objc_storeStrong((id *)&self->_speechProfileURLs, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);

  objc_storeStrong((id *)&self->_supplementalModelURL, 0);
}

- (NSArray)speechProfileContainers
{
  return self->_speechProfileContainers;
}

- (BOOL)enableParallelLoading
{
  return self->_enableParallelLoading;
}

- (BOOL)atypicalSpeech
{
  return self->_atypicalSpeech;
}

- (NSString)taskForMemoryLock
{
  return self->_taskForMemoryLock;
}

- (NSDictionary)userIdMask
{
  return self->_userIdMask;
}

- (NSArray)speechProfileURLs
{
  return self->_speechProfileURLs;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (NSURL)supplementalModelURL
{
  return self->_supplementalModelURL;
}

- (BOOL)farField
{
  return self->_farField;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<_SFSpeechRecognizerModelOptions: farField %d, supplementalModelURL %@, modelOverrideURL %@, speechProfileURLs %@, userIdMask %@, taskForMemoryLock %@, atypicalSpeech %d, enableParallelLoading %d, speechProfileContainers %@>", self->_farField, self->_supplementalModelURL, self->_modelOverrideURL, self->_speechProfileURLs, self->_userIdMask, self->_taskForMemoryLock, self->_atypicalSpeech, self->_enableParallelLoading, self->_speechProfileContainers];
}

- (unint64_t)hash
{
  if (self->_farField) {
    uint64_t v3 = 1364;
  }
  else {
    uint64_t v3 = 2263;
  }
  uint64_t v4 = v3 + [(NSURL *)self->_supplementalModelURL hash];
  uint64_t v5 = [(NSURL *)self->_modelOverrideURL hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_speechProfileURLs hash] - v5 + 32 * v5;
  uint64_t v7 = [(NSDictionary *)self->_userIdMask hash] - v6 + 32 * v6;
  NSUInteger v8 = [(NSString *)self->_taskForMemoryLock hash];
  uint64_t v9 = 13;
  if (self->_atypicalSpeech) {
    uint64_t v10 = 13;
  }
  else {
    uint64_t v10 = 42;
  }
  if (!self->_enableParallelLoading) {
    uint64_t v9 = 42;
  }
  uint64_t v11 = v10 - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  return [(NSArray *)self->_speechProfileContainers hash] - (v9 - v11 + 32 * v11) + 32 * (v9 - v11 + 32 * v11);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (_SFSpeechRecognizerModelOptions *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else if ([(_SFSpeechRecognizerModelOptions *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    int farField = v5->_farField;
    int v30 = self->_farField;
    supplementalModelURL = self->_supplementalModelURL;
    unint64_t v7 = (unint64_t)supplementalModelURL | (unint64_t)v5->_supplementalModelURL;
    if (v7) {
      LODWORD(v7) = -[NSURL isEqual:](supplementalModelURL, "isEqual:") ^ 1;
    }
    char v28 = v7;
    modelOverrideURL = self->_modelOverrideURL;
    unint64_t v9 = (unint64_t)modelOverrideURL | (unint64_t)v5->_modelOverrideURL;
    if (v9) {
      LODWORD(v9) = -[NSURL isEqual:](modelOverrideURL, "isEqual:") ^ 1;
    }
    char v27 = v9;
    speechProfileURLs = self->_speechProfileURLs;
    if ((unint64_t)speechProfileURLs | (unint64_t)v5->_speechProfileURLs) {
      int v11 = !-[NSArray isEqualToArray:](speechProfileURLs, "isEqualToArray:");
    }
    else {
      LOBYTE(v11) = 0;
    }
    userIdMask = self->_userIdMask;
    if ((unint64_t)userIdMask | (unint64_t)v5->_userIdMask) {
      int v14 = !-[NSDictionary isEqualToDictionary:](userIdMask, "isEqualToDictionary:");
    }
    else {
      LOBYTE(v14) = 0;
    }
    taskForMemoryLock = self->_taskForMemoryLock;
    if ((unint64_t)taskForMemoryLock | (unint64_t)v5->_taskForMemoryLock) {
      int v16 = !-[NSString isEqualToString:](taskForMemoryLock, "isEqualToString:");
    }
    else {
      LOBYTE(v16) = 0;
    }
    int atypicalSpeech = self->_atypicalSpeech;
    int v18 = v5->_atypicalSpeech;
    int enableParallelLoading = self->_enableParallelLoading;
    int v20 = v5->_enableParallelLoading;
    speechProfileContainers = self->_speechProfileContainers;
    if ((unint64_t)speechProfileContainers | (unint64_t)v5->_speechProfileContainers) {
      char v22 = -[NSArray isEqualToArray:](speechProfileContainers, "isEqualToArray:");
    }
    else {
      char v22 = 1;
    }
    char v23 = v28;
    if (v30 != farField) {
      char v23 = 1;
    }
    char v24 = v23 | v27 | v11 | v14 | v16;
    if (enableParallelLoading == v20) {
      char v25 = v22;
    }
    else {
      char v25 = 0;
    }
    if (atypicalSpeech != v18) {
      char v25 = 0;
    }
    if (v24) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v25;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (_SFSpeechRecognizerModelOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_SFSpeechRecognizerModelOptions;
  uint64_t v5 = [(_SFSpeechRecognizerModelOptions *)&v20 init];
  if (v5)
  {
    v5->_int farField = [v4 decodeBoolForKey:@"_farField"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_supplementalModelURL"];
    supplementalModelURL = v5->_supplementalModelURL;
    v5->_supplementalModelURL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_modelOverrideURL"];
    modelOverrideURL = v5->_modelOverrideURL;
    v5->_modelOverrideURL = (NSURL *)v8;

    uint64_t v10 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_speechProfileURLs"];
    speechProfileURLs = v5->_speechProfileURLs;
    v5->_speechProfileURLs = (NSArray *)v10;

    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [v4 decodeDictionaryWithKeysOfClass:v12 objectsOfClass:objc_opt_class() forKey:@"_userIdMask"];
    userIdMask = v5->_userIdMask;
    v5->_userIdMask = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_taskForMemoryLock"];
    taskForMemoryLock = v5->_taskForMemoryLock;
    v5->_taskForMemoryLock = (NSString *)v15;

    v5->_int atypicalSpeech = [v4 decodeBoolForKey:@"_atypicalSpeech"];
    v5->_int enableParallelLoading = [v4 decodeBoolForKey:@"_enableParallelLoading"];
    uint64_t v17 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_speechProfileContainers"];
    speechProfileContainers = v5->_speechProfileContainers;
    v5->_speechProfileContainers = (NSArray *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL farField = self->_farField;
  id v5 = a3;
  [v5 encodeBool:farField forKey:@"_farField"];
  [v5 encodeObject:self->_supplementalModelURL forKey:@"_supplementalModelURL"];
  [v5 encodeObject:self->_modelOverrideURL forKey:@"_modelOverrideURL"];
  [v5 encodeObject:self->_speechProfileURLs forKey:@"_speechProfileURLs"];
  [v5 encodeObject:self->_userIdMask forKey:@"_userIdMask"];
  [v5 encodeObject:self->_taskForMemoryLock forKey:@"_taskForMemoryLock"];
  [v5 encodeBool:self->_atypicalSpeech forKey:@"_atypicalSpeech"];
  [v5 encodeBool:self->_enableParallelLoading forKey:@"_enableParallelLoading"];
  [v5 encodeObject:self->_speechProfileContainers forKey:@"_speechProfileContainers"];
}

- (_SFSpeechRecognizerModelOptions)initWithFarField:(BOOL)a3 supplementalModelURL:(id)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 userIdMask:(id)a7 taskForMemoryLock:(id)a8 atypicalSpeech:(BOOL)a9 enableParallelLoading:(BOOL)a10 speechProfileContainers:(id)a11
{
  id v17 = a4;
  id v18 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v19 = a11;
  v27.receiver = self;
  v27.super_class = (Class)_SFSpeechRecognizerModelOptions;
  objc_super v20 = [(_SFSpeechRecognizerModelOptions *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_BOOL farField = a3;
    objc_storeStrong((id *)&v20->_supplementalModelURL, a4);
    objc_storeStrong((id *)&v21->_modelOverrideURL, a5);
    objc_storeStrong((id *)&v21->_speechProfileURLs, a6);
    objc_storeStrong((id *)&v21->_userIdMask, a7);
    objc_storeStrong((id *)&v21->_taskForMemoryLock, a8);
    v21->_int atypicalSpeech = a9;
    v21->_int enableParallelLoading = a10;
    objc_storeStrong((id *)&v21->_speechProfileContainers, a11);
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end