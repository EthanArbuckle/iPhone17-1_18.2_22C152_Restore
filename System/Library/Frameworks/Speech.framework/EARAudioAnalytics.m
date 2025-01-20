@interface EARAudioAnalytics
+ (BOOL)supportsSecureCoding;
- (EARAudioAnalytics)initWithAnalytics:(id)a3;
- (EARAudioAnalytics)initWithCoder:(id)a3;
- (NSDictionary)acousticFeatures;
- (NSDictionary)speechRecognitionFeatures;
- (double)snr;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EARAudioAnalytics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acousticFeatures, 0);

  objc_storeStrong((id *)&self->_speechRecognitionFeatures, 0);
}

- (double)snr
{
  return self->_snr;
}

- (NSDictionary)acousticFeatures
{
  return self->_acousticFeatures;
}

- (NSDictionary)speechRecognitionFeatures
{
  return self->_speechRecognitionFeatures;
}

- (EARAudioAnalytics)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EARAudioAnalytics;
  v5 = [(EARAudioAnalytics *)&v14 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeDictionaryWithKeysOfClass:v6 objectsOfClass:objc_opt_class() forKey:@"speechRecognitionFeatures"];
    speechRecognitionFeatures = v5->_speechRecognitionFeatures;
    v5->_speechRecognitionFeatures = (NSDictionary *)v7;

    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [v4 decodeDictionaryWithKeysOfClass:v9 objectsOfClass:objc_opt_class() forKey:@"acousticFeatures"];
    acousticFeatures = v5->_acousticFeatures;
    v5->_acousticFeatures = (NSDictionary *)v10;

    [v4 decodeDoubleForKey:@"snr"];
    v5->_snr = v12;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  speechRecognitionFeatures = self->_speechRecognitionFeatures;
  id v5 = a3;
  [v5 encodeObject:speechRecognitionFeatures forKey:@"speechRecognitionFeatures"];
  [v5 encodeObject:self->_acousticFeatures forKey:@"acousticFeatures"];
  [v5 encodeDouble:@"snr" forKey:self->_snr];
}

- (EARAudioAnalytics)initWithAnalytics:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EARAudioAnalytics;
  id v5 = [(EARAudioAnalytics *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 acousticFeatures];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __39__EARAudioAnalytics_initWithAnalytics___block_invoke;
    v16[3] = &unk_1E6154E70;
    id v17 = v7;
    id v8 = v7;
    [v6 enumerateKeysAndObjectsUsingBlock:v16];
    uint64_t v9 = [v4 speechRecognitionFeatures];
    uint64_t v10 = [v9 copy];
    speechRecognitionFeatures = v5->_speechRecognitionFeatures;
    v5->_speechRecognitionFeatures = (NSDictionary *)v10;

    uint64_t v12 = [v8 copy];
    acousticFeatures = v5->_acousticFeatures;
    v5->_acousticFeatures = (NSDictionary *)v12;

    [v4 snr];
    v5->_snr = v14;
  }
  return v5;
}

void __39__EARAudioAnalytics_initWithAnalytics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [[EARAcousticFeature alloc] initWithFeature:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end