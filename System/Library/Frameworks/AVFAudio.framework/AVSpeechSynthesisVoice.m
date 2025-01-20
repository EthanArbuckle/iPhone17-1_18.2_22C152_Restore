@interface AVSpeechSynthesisVoice
+ (AVSpeechSynthesisVoice)voiceWithIdentifier:(NSString *)identifier;
+ (AVSpeechSynthesisVoice)voiceWithLanguage:(NSString *)languageCode;
+ (BOOL)supportsSecureCoding;
+ (NSArray)speechVoices;
+ (NSString)currentLanguageCode;
+ (void)initialize;
- (AVSpeechSynthesisVoice)initWithCoder:(id)a3;
- (NSDictionary)audioFileSettings;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVSpeechSynthesisVoice

- (void).cxx_destruct
{
}

- (NSDictionary)audioFileSettings
{
  return self->_audioFileSettings;
}

- (AVSpeechSynthesisVoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVSpeechSynthesisVoice;
  v5 = [(AVSpeechSynthesisVoice *)&v11 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"language"];
    [(AVSpeechSynthesisVoice *)v5 setLanguage:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(AVSpeechSynthesisVoice *)v5 setIdentifier:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(AVSpeechSynthesisVoice *)v5 setName:v8];

    -[AVSpeechSynthesisVoice setQuality:](v5, "setQuality:", [v4 decodeIntegerForKey:@"quality"]);
    -[AVSpeechSynthesisVoice setGender:](v5, "setGender:", [v4 decodeIntegerForKey:@"gender"]);
    -[AVSpeechSynthesisVoice setVoiceTraits:](v5, "setVoiceTraits:", [v4 decodeIntegerForKey:@"voiceTraits"]);
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(AVSpeechSynthesisVoice *)self language];
  [v7 encodeObject:v4 forKey:@"language"];

  v5 = [(AVSpeechSynthesisVoice *)self identifier];
  [v7 encodeObject:v5 forKey:@"identifier"];

  v6 = [(AVSpeechSynthesisVoice *)self name];
  [v7 encodeObject:v6 forKey:@"name"];

  objc_msgSend(v7, "encodeInteger:forKey:", -[AVSpeechSynthesisVoice quality](self, "quality"), @"quality");
  objc_msgSend(v7, "encodeInteger:forKey:", -[AVSpeechSynthesisVoice gender](self, "gender"), @"gender");
  objc_msgSend(v7, "encodeInteger:forKey:", -[AVSpeechSynthesisVoice voiceTraits](self, "voiceTraits"), @"voiceTraits");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (AVSpeechSynthesisVoice)voiceWithIdentifier:(NSString *)identifier
{
  return 0;
}

+ (AVSpeechSynthesisVoice)voiceWithLanguage:(NSString *)languageCode
{
  return 0;
}

+ (NSString)currentLanguageCode
{
  return 0;
}

+ (NSArray)speechVoices
{
  return 0;
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1) {
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_5009);
  }
}

@end