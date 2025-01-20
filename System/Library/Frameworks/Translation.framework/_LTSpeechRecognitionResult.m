@interface _LTSpeechRecognitionResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isFinal;
- (BOOL)isStable;
- (NSArray)transcriptions;
- (NSLocale)locale;
- (NSString)modelVersion;
- (_LTSpeechRecognitionResult)initWithCoder:(id)a3;
- (_LTSpeechRecognitionSausage)bestRecognitionAlternatives;
- (id)bestTranscription;
- (void)encodeWithCoder:(id)a3;
- (void)setBestRecognitionAlternatives:(id)a3;
- (void)setFinal:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setModelVersion:(id)a3;
- (void)setStable:(BOOL)a3;
- (void)setTranscriptions:(id)a3;
@end

@implementation _LTSpeechRecognitionResult

- (_LTSpeechRecognitionResult)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSpeechRecognitionResult;
  v5 = [(_LTSpeechRecognitionResult *)&v17 init];
  if (v5)
  {
    v5->_final = [v4 decodeBoolForKey:@"final"];
    v5->_stable = [v4 decodeBoolForKey:@"stable"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
    v10 = [v8 setWithArray:v9];

    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"transcriptions"];
    transcriptions = v5->_transcriptions;
    v5->_transcriptions = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sausage"];
    bestRecognitionAlternatives = v5->_bestRecognitionAlternatives;
    v5->_bestRecognitionAlternatives = (_LTSpeechRecognitionSausage *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL final = self->_final;
  id v5 = a3;
  [v5 encodeBool:final forKey:@"final"];
  [v5 encodeBool:self->_stable forKey:@"stable"];
  [v5 encodeObject:self->_locale forKey:@"locale"];
  [v5 encodeObject:self->_transcriptions forKey:@"transcriptions"];
  [v5 encodeObject:self->_bestRecognitionAlternatives forKey:@"sausage"];
}

- (id)bestTranscription
{
  return [(NSArray *)self->_transcriptions firstObject];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (void)setFinal:(BOOL)a3
{
  self->_BOOL final = a3;
}

- (BOOL)isStable
{
  return self->_stable;
}

- (void)setStable:(BOOL)a3
{
  self->_stable = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSArray)transcriptions
{
  return self->_transcriptions;
}

- (void)setTranscriptions:(id)a3
{
}

- (_LTSpeechRecognitionSausage)bestRecognitionAlternatives
{
  return self->_bestRecognitionAlternatives;
}

- (void)setBestRecognitionAlternatives:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_bestRecognitionAlternatives, 0);
  objc_storeStrong((id *)&self->_transcriptions, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end