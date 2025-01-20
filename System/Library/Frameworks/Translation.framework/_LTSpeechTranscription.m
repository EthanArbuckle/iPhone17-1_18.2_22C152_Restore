@interface _LTSpeechTranscription
+ (BOOL)supportsSecureCoding;
- (BOOL)isLowConfidence;
- (NSLocale)locale;
- (NSString)formattedString;
- (NSString)sanitizedFormattedString;
- (_LTSpeechTranscription)initWithCoder:(id)a3;
- (_LTSpeechTranscription)initWithFormattedString:(id)a3 locale:(id)a4 confidence:(double)a5 minConfidence:(double)a6 maxConfidence:(double)a7;
- (double)confidence;
- (double)maxConfidence;
- (double)minConfidence;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setFormattedString:(id)a3;
- (void)setLocale:(id)a3;
- (void)setLowConfidence:(BOOL)a3;
- (void)setMaxConfidence:(double)a3;
- (void)setMinConfidence:(double)a3;
- (void)setSanitizedFormattedString:(id)a3;
@end

@implementation _LTSpeechTranscription

- (_LTSpeechTranscription)initWithFormattedString:(id)a3 locale:(id)a4 confidence:(double)a5 minConfidence:(double)a6 maxConfidence:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_LTSpeechTranscription;
  v15 = [(_LTSpeechTranscription *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_locale, a4);
    objc_storeStrong((id *)&v16->_formattedString, a3);
    v16->_maxConfidence = a7;
    v16->_confidence = a5;
    v16->_minConfidence = a6;
    v16->_lowConfidence = 0;
    v17 = v16;
  }

  return v16;
}

- (_LTSpeechTranscription)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_LTSpeechTranscription;
  v5 = [(_LTSpeechTranscription *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locale"];
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formattedString"];
    formattedString = v5->_formattedString;
    v5->_formattedString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sanitizedFormattedString"];
    sanitizedFormattedString = v5->_sanitizedFormattedString;
    v5->_sanitizedFormattedString = (NSString *)v10;

    [v4 decodeDoubleForKey:@"confidence"];
    v5->_confidence = v12;
    [v4 decodeDoubleForKey:@"minConfidence"];
    v5->_minConfidence = v13;
    [v4 decodeDoubleForKey:@"maxConfidence"];
    v5->_maxConfidence = v14;
    v5->_lowConfidence = [v4 decodeBoolForKey:@"lowConfidence"];
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  locale = self->_locale;
  id v5 = a3;
  [v5 encodeObject:locale forKey:@"locale"];
  [v5 encodeObject:self->_formattedString forKey:@"formattedString"];
  [v5 encodeObject:self->_sanitizedFormattedString forKey:@"sanitizedFormattedString"];
  [v5 encodeDouble:@"confidence" forKey:self->_confidence];
  [v5 encodeDouble:@"minConfidence" forKey:self->_minConfidence];
  [v5 encodeDouble:@"maxConfidence" forKey:self->_maxConfidence];
  [v5 encodeBool:self->_lowConfidence forKey:@"lowConfidence"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSString)formattedString
{
  return self->_formattedString;
}

- (void)setFormattedString:(id)a3
{
}

- (NSString)sanitizedFormattedString
{
  return self->_sanitizedFormattedString;
}

- (void)setSanitizedFormattedString:(id)a3
{
}

- (double)minConfidence
{
  return self->_minConfidence;
}

- (void)setMinConfidence:(double)a3
{
  self->_minConfidence = a3;
}

- (double)maxConfidence
{
  return self->_maxConfidence;
}

- (void)setMaxConfidence:(double)a3
{
  self->_maxConfidence = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (BOOL)isLowConfidence
{
  return self->_lowConfidence;
}

- (void)setLowConfidence:(BOOL)a3
{
  self->_lowConfidence = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizedFormattedString, 0);
  objc_storeStrong((id *)&self->_formattedString, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end