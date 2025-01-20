@interface DDScannerServiceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)languageHighConfidence;
- (BOOL)noObjC;
- (BOOL)remoteScannerEnabled;
- (BOOL)spotlightSuggestionsEnabled;
- (DDScannerServiceConfiguration)init;
- (DDScannerServiceConfiguration)initWithCoder:(id)a3;
- (DDScannerServiceConfiguration)initWithScannerType:(int)a3 passiveIntent:(BOOL)a4;
- (NSArray)mockMLResults;
- (NSArray)supportedMLResults;
- (NSString)country;
- (NSString)language;
- (OS_dispatch_queue)completionQueue;
- (__CFString)recyclingIdentifier;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initEmpty;
- (int)qos;
- (int)scannerType;
- (int)script;
- (int64_t)resultsOptions;
- (int64_t)scannerOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setCountry:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLanguageHighConfidence:(BOOL)a3;
- (void)setMockMLResults:(id)a3;
- (void)setNoObjC:(BOOL)a3;
- (void)setQos:(int)a3;
- (void)setRemoteScannerEnabled:(BOOL)a3;
- (void)setResultsOptions:(int64_t)a3;
- (void)setScannerOptions:(int64_t)a3;
- (void)setScript:(int)a3;
- (void)setSpotlightSuggestionsEnabled:(BOOL)a3;
- (void)setSupportedMLResults:(id)a3;
- (void)setTimeout:(double)a3;
@end

@implementation DDScannerServiceConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initEmpty");
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 8) = self->_scannerType;
    *(void *)(v4 + 56) = self->_resultsOptions;
    *(void *)(v4 + 64) = self->_scannerOptions;
    *(double *)(v4 + 48) = self->_timeout;
    *(unsigned char *)(v4 + 32) = self->_noObjC;
    *(unsigned char *)(v4 + 33) = self->_languageHighConfidence;
    *(unsigned char *)(v4 + 12) = self->_spotlightSuggestionsEnabled;
    *(unsigned char *)(v4 + 13) = self->_remoteScannerEnabled;
    objc_storeStrong((id *)(v4 + 72), self->_language);
    objc_storeStrong((id *)(v5 + 16), self->_recyclingIdentifier);
    objc_storeStrong((id *)(v5 + 88), self->_mockMLResults);
    objc_storeStrong((id *)(v5 + 96), self->_supportedMLResults);
    *(_DWORD *)(v5 + 36) = self->_qos;
    *(_DWORD *)(v5 + 40) = self->_script;
    objc_storeStrong((id *)(v5 + 104), self->_country);
  }
  return (id)v5;
}

- (id)initEmpty
{
  v3.receiver = self;
  v3.super_class = (Class)DDScannerServiceConfiguration;
  return [(DDScannerServiceConfiguration *)&v3 init];
}

- (__CFString)recyclingIdentifier
{
  if (a1)
  {
    v2 = a1;
    if ([(__CFString *)a1 remoteScannerEnabled])
    {
      a1 = @"Remote";
    }
    else
    {
      data = v2->data;
      if (!data)
      {
        id v4 = [NSString alloc];
        info = (__CFString *)v2[3].info;
        if (!info) {
          info = &stru_1EF034530;
        }
        uint64_t v6 = [v4 initWithFormat:@"T:%d|S:%d:%@:%d:%@", LODWORD(v2->info), BYTE4(v2->info), v2[2].info, BYTE1(v2[1].isa), info];
        v7 = v2->data;
        v2->data = (char *)v6;

        data = v2->data;
      }
      a1 = data;
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)remoteScannerEnabled
{
  BOOL remoteScannerEnabled = self->_remoteScannerEnabled;
  if (!self->_remoteScannerEnabled) {
    [(DDScannerServiceConfiguration *)self qos];
  }
  return remoteScannerEnabled;
}

- (int)qos
{
  return self->_qos;
}

- (NSString)language
{
  return self->_language;
}

- (double)timeout
{
  return self->_timeout;
}

- (NSArray)supportedMLResults
{
  return self->_supportedMLResults;
}

- (BOOL)spotlightSuggestionsEnabled
{
  return self->_spotlightSuggestionsEnabled;
}

- (int)script
{
  return self->_script;
}

- (int)scannerType
{
  return self->_scannerType;
}

- (int64_t)scannerOptions
{
  return self->_scannerOptions;
}

- (int64_t)resultsOptions
{
  return self->_resultsOptions;
}

- (BOOL)noObjC
{
  return self->_noObjC;
}

- (NSArray)mockMLResults
{
  return self->_mockMLResults;
}

- (BOOL)languageHighConfidence
{
  return self->_languageHighConfidence;
}

- (NSString)country
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_supportedMLResults, 0);
  objc_storeStrong((id *)&self->_mockMLResults, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_language, 0);

  objc_storeStrong((id *)&self->_recyclingIdentifier, 0);
}

- (void)setSpotlightSuggestionsEnabled:(BOOL)a3
{
  if (self->_spotlightSuggestionsEnabled != a3)
  {
    self->_spotlightSuggestionsEnabled = a3;
    self->_recyclingIdentifier = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (void)setQos:(int)a3
{
  self->_qos = a3;
}

- (void)setNoObjC:(BOOL)a3
{
  self->_noObjC = a3;
}

- (DDScannerServiceConfiguration)initWithScannerType:(int)a3 passiveIntent:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)DDScannerServiceConfiguration;
  result = [(DDScannerServiceConfiguration *)&v8 init];
  if (result)
  {
    result->_scannerType = a3;
    int64_t v7 = 1537;
    if (v4) {
      int64_t v7 = 1989;
    }
    result->_resultsOptions = v7;
    result->_scannerOptions = 0;
    result->_timeout = 6.0;
  }
  return result;
}

- (void)setCountry:(id)a3
{
}

- (void)setSupportedMLResults:(id)a3
{
}

- (void)setMockMLResults:(id)a3
{
}

- (void)setScript:(int)a3
{
  self->_script = a3;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setScannerOptions:(int64_t)a3
{
  self->_scannerOptions = a3;
}

- (void)setResultsOptions:(int64_t)a3
{
  self->_resultsOptions = a3;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setRemoteScannerEnabled:(BOOL)a3
{
  self->_BOOL remoteScannerEnabled = a3;
}

- (void)setLanguageHighConfidence:(BOOL)a3
{
  if (self->_languageHighConfidence != a3)
  {
    self->_languageHighConfidence = a3;
    self->_recyclingIdentifier = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (void)setLanguage:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  p_language = &self->_language;
  if (self->_language != v5)
  {
    objc_super v8 = v5;
    objc_storeStrong((id *)p_language, a3);
    recyclingIdentifier = self->_recyclingIdentifier;
    self->_recyclingIdentifier = 0;

    uint64_t v5 = v8;
  }

  MEMORY[0x1F41817F8](p_language, v5);
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = -[DDScannerServiceConfiguration recyclingIdentifier]((__CFString *)self);
  uint64_t v6 = (void *)v5;
  if (self->_noObjC) {
    int64_t v7 = @"C";
  }
  else {
    int64_t v7 = @"ObjC";
  }
  objc_super v8 = [v3 stringWithFormat:@"<%@ %p> %@ timeout:%.1f SPI:%@ resultsOptions:%ld scannerOptions:%ld", v4, self, v5, *(void *)&self->_timeout, v7, self->_resultsOptions, self->_scannerOptions];

  return v8;
}

- (DDScannerServiceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DDScannerServiceConfiguration *)self initEmpty];
  if (v5)
  {
    v5->_scannerType = [v4 decodeIntegerForKey:@"ST"];
    v5->_resultsOptions = [v4 decodeIntegerForKey:@"RO"];
    v5->_scannerOptions = [v4 decodeIntegerForKey:@"SO"];
    [v4 decodeDoubleForKey:@"TO"];
    v5->_timeout = v6;
    v5->_noObjC = [v4 decodeBoolForKey:@"OC"];
    v5->_languageHighConfidence = [v4 decodeBoolForKey:@"LHC"];
    v5->_spotlightSuggestionsEnabled = [v4 decodeBoolForKey:@"SP"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LG"];
    language = v5->_language;
    v5->_language = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"country"];
    country = v5->_country;
    v5->_country = (NSString *)v9;

    v5->_script = [v4 decodeIntegerForKey:@"script"];
    v5->_qos = [v4 decodeIntegerForKey:@"qos"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_scannerType forKey:@"ST"];
  [v6 encodeInteger:self->_resultsOptions forKey:@"RO"];
  [v6 encodeInteger:self->_scannerOptions forKey:@"SO"];
  [v6 encodeDouble:@"TO" forKey:self->_timeout];
  [v6 encodeBool:self->_noObjC forKey:@"OC"];
  [v6 encodeBool:self->_languageHighConfidence forKey:@"LHC"];
  [v6 encodeBool:self->_spotlightSuggestionsEnabled forKey:@"SP"];
  language = self->_language;
  if (language) {
    [v6 encodeObject:language forKey:@"LG"];
  }
  country = self->_country;
  if (country) {
    [v6 encodeObject:country forKey:@"country"];
  }
  [v6 encodeInteger:self->_script forKey:@"script"];
  [v6 encodeInteger:self->_qos forKey:@"qos"];
}

- (DDScannerServiceConfiguration)init
{
  return [(DDScannerServiceConfiguration *)self initWithScannerType:0 passiveIntent:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end