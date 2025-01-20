@interface AFSpeechAudioAnalytics
+ (BOOL)supportsSecureCoding;
- (AFSpeechAudioAnalytics)initWithCoder:(id)a3;
- (AFSpeechAudioAnalytics)initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4;
- (AFSpeechAudioAnalytics)initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4 snr:(double)a5;
- (NSDictionary)acousticFeatures;
- (NSDictionary)speechRecognitionFeatures;
- (double)snr;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSpeechAudioAnalytics

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

- (AFSpeechAudioAnalytics)initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4 snr:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AFSpeechAudioAnalytics;
  v10 = [(AFSpeechAudioAnalytics *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    speechRecognitionFeatures = v10->_speechRecognitionFeatures;
    v10->_speechRecognitionFeatures = (NSDictionary *)v11;

    uint64_t v13 = [v9 copy];
    acousticFeatures = v10->_acousticFeatures;
    v10->_acousticFeatures = (NSDictionary *)v13;

    v10->_snr = a5;
  }

  return v10;
}

- (AFSpeechAudioAnalytics)initWithSpeechRecognitionFeatures:(id)a3 acousticFeatures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AFSpeechAudioAnalytics;
  id v8 = [(AFSpeechAudioAnalytics *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    speechRecognitionFeatures = v8->_speechRecognitionFeatures;
    v8->_speechRecognitionFeatures = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    acousticFeatures = v8->_acousticFeatures;
    v8->_acousticFeatures = (NSDictionary *)v11;
  }
  return v8;
}

- (AFSpeechAudioAnalytics)initWithCoder:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AFSpeechAudioAnalytics;
  v5 = [(AFSpeechAudioAnalytics *)&v18 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_speechRecognitionFeatures"];
    speechRecognitionFeatures = v5->_speechRecognitionFeatures;
    v5->_speechRecognitionFeatures = (NSDictionary *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
    uint64_t v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"_acousticFeatures"];
    acousticFeatures = v5->_acousticFeatures;
    v5->_acousticFeatures = (NSDictionary *)v14;

    [v4 decodeDoubleForKey:@"_snr"];
    v5->_snr = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  speechRecognitionFeatures = self->_speechRecognitionFeatures;
  id v5 = a3;
  [v5 encodeObject:speechRecognitionFeatures forKey:@"_speechRecognitionFeatures"];
  [v5 encodeObject:self->_acousticFeatures forKey:@"_acousticFeatures"];
  [v5 encodeDouble:@"_snr" forKey:self->_snr];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end