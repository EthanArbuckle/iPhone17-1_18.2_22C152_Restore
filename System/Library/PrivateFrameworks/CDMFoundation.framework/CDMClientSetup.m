@interface CDMClientSetup
+ (BOOL)supportsSecureCoding;
- (BOOL)shouldPerformWarmup;
- (CDMClientSetup)initWithCoder:(id)a3;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 embeddingVersion:(id)a4 sandboxId:(id)a5 activeServiceGraph:(id)a6;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8 embeddingVersion:(id)a9 nlSetupId:(id)a10 invocationSource:(id)a11;
- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8 embeddingVersion:(id)a9 nlSetupId:(id)a10 invocationSource:(id)a11 shouldPerformWarmup:(BOOL)a12;
- (NSArray)overrideSiriVocabSpans;
- (NSLocale)localeIdentifier;
- (NSString)activeServiceGraph;
- (NSString)assetDirPath;
- (NSString)embeddingVersion;
- (NSString)invocationSource;
- (NSString)sandboxId;
- (NSString)serviceStateDirectory;
- (NSString)serviceStateDirectorySandboxExtension;
- (NSUUID)nlSetupId;
- (id)description;
- (void)createSandboxExtensionForXPC;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CDMClientSetup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  localeIdentifier = self->_localeIdentifier;
  id v5 = a3;
  [v5 encodeObject:localeIdentifier forKey:@"localeIdentifier"];
  [v5 encodeObject:self->_sandboxId forKey:@"sandboxId"];
  [v5 encodeObject:self->_activeServiceGraph forKey:@"activeServiceGraph"];
  [v5 encodeObject:self->_assetDirPath forKey:@"assetDirPath"];
  [v5 encodeObject:self->_invocationSource forKey:@"invocationSource"];
  [v5 encodeObject:self->_overrideSiriVocabSpans forKey:@"overrideSiriVocabSpans"];
  [v5 encodeObject:self->_serviceStateDirectory forKey:@"serviceStateDirectory"];
  [v5 encodeObject:self->_embeddingVersion forKey:@"embeddingVersion"];
  [v5 encodeObject:self->_serviceStateDirectorySandboxExtension forKey:@"serviceStateDirectorySandboxExtension"];
  [v5 encodeObject:self->_nlSetupId forKey:@"nlSetupId"];
  [v5 encodeBool:self->_shouldPerformWarmup forKey:@"shouldPerformWarmup"];
}

- (NSString)serviceStateDirectorySandboxExtension
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (CDMClientSetup)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDMClientSetup;
  id v5 = [(CDMClientSetup *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localeIdentifier"];
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSLocale *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxId"];
    sandboxId = v5->_sandboxId;
    v5->_sandboxId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activeServiceGraph"];
    activeServiceGraph = v5->_activeServiceGraph;
    v5->_activeServiceGraph = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetDirPath"];
    assetDirPath = v5->_assetDirPath;
    v5->_assetDirPath = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invocationSource"];
    invocationSource = v5->_invocationSource;
    v5->_invocationSource = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nlSetupId"];
    nlSetupId = v5->_nlSetupId;
    v5->_nlSetupId = (NSUUID *)v16;

    v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"overrideSiriVocabSpans"];
    overrideSiriVocabSpans = v5->_overrideSiriVocabSpans;
    v5->_overrideSiriVocabSpans = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceStateDirectory"];
    serviceStateDirectory = v5->_serviceStateDirectory;
    v5->_serviceStateDirectory = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddingVersion"];
    embeddingVersion = v5->_embeddingVersion;
    v5->_embeddingVersion = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serviceStateDirectorySandboxExtension"];
    serviceStateDirectorySandboxExtension = v5->_serviceStateDirectorySandboxExtension;
    v5->_serviceStateDirectorySandboxExtension = (NSString *)v27;

    v5->_shouldPerformWarmup = [v4 decodeBoolForKey:@"shouldPerformWarmup"];
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStateDirectorySandboxExtension, 0);
  objc_storeStrong((id *)&self->_serviceStateDirectory, 0);
  objc_storeStrong((id *)&self->_overrideSiriVocabSpans, 0);
  objc_storeStrong((id *)&self->_nlSetupId, 0);
  objc_storeStrong((id *)&self->_invocationSource, 0);
  objc_storeStrong((id *)&self->_assetDirPath, 0);
  objc_storeStrong((id *)&self->_activeServiceGraph, 0);
  objc_storeStrong((id *)&self->_sandboxId, 0);
  objc_storeStrong((id *)&self->_embeddingVersion, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (NSString)activeServiceGraph
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (BOOL)shouldPerformWarmup
{
  return self->_shouldPerformWarmup;
}

- (NSString)serviceStateDirectory
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)sandboxId
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)overrideSiriVocabSpans
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSUUID)nlSetupId
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSLocale)localeIdentifier
{
  return (NSLocale *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)invocationSource
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)embeddingVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)assetDirPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 embeddingVersion:(id)a4 sandboxId:(id)a5 activeServiceGraph:(id)a6
{
  return [(CDMClientSetup *)self initWithLocaleIdentifier:a3 sandboxId:a5 activeServiceGraph:a6 assetDirPath:0 overrideSiriVocabSpans:0 serviceStateDirectory:0 embeddingVersion:a4 nlSetupId:0 invocationSource:0];
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8 embeddingVersion:(id)a9 nlSetupId:(id)a10 invocationSource:(id)a11
{
  LOBYTE(v12) = 1;
  return [(CDMClientSetup *)self initWithLocaleIdentifier:a3 sandboxId:a4 activeServiceGraph:a5 assetDirPath:a6 overrideSiriVocabSpans:a7 serviceStateDirectory:a8 embeddingVersion:a9 nlSetupId:a10 invocationSource:a11 shouldPerformWarmup:v12];
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8 embeddingVersion:(id)a9 nlSetupId:(id)a10 invocationSource:(id)a11 shouldPerformWarmup:(BOOL)a12
{
  id v30 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a6;
  id v26 = a7;
  id v25 = a8;
  id v24 = a9;
  id v23 = a10;
  id v19 = a11;
  v31.receiver = self;
  v31.super_class = (Class)CDMClientSetup;
  v20 = [(CDMClientSetup *)&v31 init];
  uint64_t v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_localeIdentifier, a3);
    objc_storeStrong((id *)&v21->_sandboxId, a4);
    objc_storeStrong((id *)&v21->_activeServiceGraph, a5);
    objc_storeStrong((id *)&v21->_assetDirPath, a6);
    objc_storeStrong((id *)&v21->_overrideSiriVocabSpans, a7);
    objc_storeStrong((id *)&v21->_embeddingVersion, a9);
    objc_storeStrong((id *)&v21->_serviceStateDirectory, a8);
    objc_storeStrong((id *)&v21->_invocationSource, a11);
    objc_storeStrong((id *)&v21->_nlSetupId, a10);
    v21->_shouldPerformWarmup = a12;
  }

  return v21;
}

- (void)createSandboxExtensionForXPC
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  serviceStateDirectory = self->_serviceStateDirectory;
  if (serviceStateDirectory && !self->_serviceStateDirectorySandboxExtension)
  {
    [(NSString *)serviceStateDirectory fileSystemRepresentation];
    uint64_t v4 = sandbox_extension_issue_file();
    if (v4)
    {
      self->_serviceStateDirectorySandboxExtension = (NSString *)[[NSString alloc] initWithCString:v4 encoding:4];
      MEMORY[0x270F9A758]();
    }
    else
    {
      id v5 = CDMOSLoggerForCategory(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = self->_serviceStateDirectory;
        *(_DWORD *)buf = 136315394;
        uint64_t v8 = "-[CDMClientSetup createSandboxExtensionForXPC]";
        __int16 v9 = 2112;
        uint64_t v10 = v6;
        _os_log_error_impl(&dword_2263A0000, v5, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to create sandbox extension for \"%@\"", buf, 0x16u);
      }

        self->_serviceStateDirectory);
    }
  }
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(NSUUID *)self->_nlSetupId UUIDString];
  id v5 = (void *)v4;
  uint64_t v6 = @"YES";
  if (self->_serviceStateDirectorySandboxExtension) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (!self->_shouldPerformWarmup) {
    uint64_t v6 = @"NO";
  }
  uint64_t v8 = [v3 stringWithFormat:@"[CDMClientSetup] - nlSetupId: %@, Language identifier: %@,Sandbox ID: %@, Graph Name: %@, Asset Dir Path: %@, Override Siri Vocabulary Spans: %@, Service State Directory: %@, Has Sandbox Extension: %@, Should Perform Warmup: %@", v4, self->_localeIdentifier, self->_sandboxId, self->_activeServiceGraph, self->_assetDirPath, self->_overrideSiriVocabSpans, self->_serviceStateDirectory, v7, v6];

  return v8;
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7 serviceStateDirectory:(id)a8
{
  return [(CDMClientSetup *)self initWithLocaleIdentifier:a3 sandboxId:a4 activeServiceGraph:a5 assetDirPath:a6 overrideSiriVocabSpans:a7 serviceStateDirectory:a8 embeddingVersion:0 nlSetupId:0 invocationSource:0];
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5 assetDirPath:(id)a6 overrideSiriVocabSpans:(id)a7
{
  return [(CDMClientSetup *)self initWithLocaleIdentifier:a3 sandboxId:a4 activeServiceGraph:a5 assetDirPath:a6 overrideSiriVocabSpans:a7 serviceStateDirectory:0 embeddingVersion:0 nlSetupId:0 invocationSource:0];
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4 activeServiceGraph:(id)a5
{
  return [(CDMClientSetup *)self initWithLocaleIdentifier:a3 sandboxId:a4 activeServiceGraph:a5 assetDirPath:0 overrideSiriVocabSpans:0 serviceStateDirectory:0 embeddingVersion:0 nlSetupId:0 invocationSource:0];
}

- (CDMClientSetup)initWithLocaleIdentifier:(id)a3 sandboxId:(id)a4
{
  return [(CDMClientSetup *)self initWithLocaleIdentifier:a3 sandboxId:a4 activeServiceGraph:0 assetDirPath:0 overrideSiriVocabSpans:0 serviceStateDirectory:0 embeddingVersion:0 nlSetupId:0 invocationSource:0];
}

@end