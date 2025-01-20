@interface EARSpeechModelInfo
+ (BOOL)supportsSecureCoding;
- (EARSpeechModelInfo)initWithCoder:(id)a3;
- (EARSpeechModelInfo)initWithModelInfo:(id)a3;
- (NSSet)samplingRates;
- (NSSet)tasks;
- (NSString)acousticModelVersion;
- (NSString)acousticProfileVersion;
- (NSString)language;
- (NSString)phoneSetVersion;
- (NSString)version;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARSpeechModelInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticModelVersion, 0);
  objc_storeStrong((id *)&self->_acousticProfileVersion, 0);
  objc_storeStrong((id *)&self->_phoneSetVersion, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_samplingRates, 0);

  objc_storeStrong((id *)&self->_version, 0);
}

- (NSString)acousticModelVersion
{
  return self->_acousticModelVersion;
}

- (NSString)acousticProfileVersion
{
  return self->_acousticProfileVersion;
}

- (NSString)phoneSetVersion
{
  return self->_phoneSetVersion;
}

- (NSString)language
{
  return self->_language;
}

- (NSSet)tasks
{
  return self->_tasks;
}

- (NSSet)samplingRates
{
  return self->_samplingRates;
}

- (NSString)version
{
  return self->_version;
}

- (EARSpeechModelInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)EARSpeechModelInfo;
  v5 = [(EARSpeechModelInfo *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"samplingRates"];
    samplingRates = v5->_samplingRates;
    v5->_samplingRates = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"tasks"];
    tasks = v5->_tasks;
    v5->_tasks = (NSSet *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    language = v5->_language;
    v5->_language = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneSetVersion"];
    phoneSetVersion = v5->_phoneSetVersion;
    v5->_phoneSetVersion = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acousticProfileVersion"];
    acousticProfileVersion = v5->_acousticProfileVersion;
    v5->_acousticProfileVersion = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acousticModelVersion"];
    acousticModelVersion = v5->_acousticModelVersion;
    v5->_acousticModelVersion = (NSString *)v24;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  version = self->_version;
  id v5 = a3;
  [v5 encodeObject:version forKey:@"version"];
  [v5 encodeObject:self->_samplingRates forKey:@"samplingRates"];
  [v5 encodeObject:self->_tasks forKey:@"tasks"];
  [v5 encodeObject:self->_language forKey:@"language"];
  [v5 encodeObject:self->_phoneSetVersion forKey:@"phoneSetVersion"];
  [v5 encodeObject:self->_acousticProfileVersion forKey:@"acousticProfileVersion"];
  [v5 encodeObject:self->_acousticModelVersion forKey:@"acousticModelVersion"];
}

- (EARSpeechModelInfo)initWithModelInfo:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)EARSpeechModelInfo;
  id v5 = [(EARSpeechModelInfo *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 version];
    version = v5->_version;
    v5->_version = (NSString *)v6;

    v8 = [v4 samplingRates];
    uint64_t v9 = [v8 copy];
    samplingRates = v5->_samplingRates;
    v5->_samplingRates = (NSSet *)v9;

    uint64_t v11 = [v4 tasks];
    uint64_t v12 = [v11 copy];
    tasks = v5->_tasks;
    v5->_tasks = (NSSet *)v12;

    uint64_t v14 = [v4 language];
    language = v5->_language;
    v5->_language = (NSString *)v14;

    uint64_t v16 = [v4 phoneSetVersion];
    phoneSetVersion = v5->_phoneSetVersion;
    v5->_phoneSetVersion = (NSString *)v16;

    uint64_t v18 = [v4 acousticProfileVersion];
    acousticProfileVersion = v5->_acousticProfileVersion;
    v5->_acousticProfileVersion = (NSString *)v18;

    uint64_t v20 = [v4 acousticModelVersion];
    acousticModelVersion = v5->_acousticModelVersion;
    v5->_acousticModelVersion = (NSString *)v20;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end