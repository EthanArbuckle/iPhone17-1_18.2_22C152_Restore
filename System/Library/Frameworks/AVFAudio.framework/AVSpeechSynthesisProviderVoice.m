@interface AVSpeechSynthesisProviderVoice
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVSpeechSynthesisProviderVoice)initWithCoder:(id)a3;
- (AVSpeechSynthesisProviderVoice)initWithName:(NSString *)name identifier:(NSString *)identifier primaryLanguages:(NSArray *)primaryLanguages supportedLanguages:(NSArray *)supportedLanguages;
- (AVSpeechSynthesisVoiceGender)gender;
- (NSArray)primaryLanguages;
- (NSArray)supportedLanguages;
- (NSInteger)age;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)voiceSize;
- (void)encodeWithCoder:(id)a3;
- (void)setAge:(NSInteger)age;
- (void)setGender:(AVSpeechSynthesisVoiceGender)gender;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setSupportedLanguages:(id)a3;
- (void)setVersion:(NSString *)version;
- (void)setVoiceSize:(int64_t)voiceSize;
@end

@implementation AVSpeechSynthesisProviderVoice

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_primaryLanguages, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setAge:(NSInteger)age
{
  self->_age = age;
}

- (NSInteger)age
{
  return self->_age;
}

- (void)setGender:(AVSpeechSynthesisVoiceGender)gender
{
  self->_gender = gender;
}

- (AVSpeechSynthesisVoiceGender)gender
{
  return self->_gender;
}

- (void)setVersion:(NSString *)version
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVoiceSize:(int64_t)voiceSize
{
  self->_voiceSize = voiceSize;
}

- (int64_t)voiceSize
{
  return self->_voiceSize;
}

- (void)setSupportedLanguages:(id)a3
{
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (NSArray)primaryLanguages
{
  return self->_primaryLanguages;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(AVSpeechSynthesisProviderVoice *)self name];
  [v4 setName:v5];

  v6 = [(AVSpeechSynthesisProviderVoice *)self identifier];
  [v4 setIdentifier:v6];

  v7 = [(AVSpeechSynthesisProviderVoice *)self supportedLanguages];
  [v4 setSupportedLanguages:v7];

  objc_msgSend(v4, "setVoiceSize:", -[AVSpeechSynthesisProviderVoice voiceSize](self, "voiceSize"));
  v8 = [(AVSpeechSynthesisProviderVoice *)self version];
  [v4 setVersion:v8];

  objc_msgSend(v4, "setGender:", -[AVSpeechSynthesisProviderVoice gender](self, "gender"));
  objc_msgSend(v4, "setAge:", -[AVSpeechSynthesisProviderVoice age](self, "age"));
  return v4;
}

- (AVSpeechSynthesisProviderVoice)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AVSpeechSynthesisProviderVoice;
  v5 = [(AVSpeechSynthesisProviderVoice *)&v19 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    [(AVSpeechSynthesisProviderVoice *)v5 setName:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    [(AVSpeechSynthesisProviderVoice *)v5 setIdentifier:v7];

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"primaryLanguages"];
    [(AVSpeechSynthesisProviderVoice *)v5 setSupportedLanguages:v11];

    v12 = [v4 decodeObjectOfClasses:v10 forKey:@"supportedLanguages"];
    [(AVSpeechSynthesisProviderVoice *)v5 setSupportedLanguages:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voiceSize"];
    -[AVSpeechSynthesisProviderVoice setVoiceSize:](v5, "setVoiceSize:", [v13 longLongValue]);

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    [(AVSpeechSynthesisProviderVoice *)v5 setVersion:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gender"];
    -[AVSpeechSynthesisProviderVoice setGender:](v5, "setGender:", [v15 integerValue]);

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"age"];
    -[AVSpeechSynthesisProviderVoice setAge:](v5, "setAge:", [v16 integerValue]);

    v17 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  id v4 = [(AVSpeechSynthesisProviderVoice *)self name];
  [v9 encodeObject:v4 forKey:@"name"];

  v5 = [(AVSpeechSynthesisProviderVoice *)self identifier];
  [v9 encodeObject:v5 forKey:@"identifier"];

  v6 = [(AVSpeechSynthesisProviderVoice *)self primaryLanguages];
  [v9 encodeObject:v6 forKey:@"primaryLanguages"];

  v7 = [(AVSpeechSynthesisProviderVoice *)self supportedLanguages];
  [v9 encodeObject:v7 forKey:@"supportedLanguages"];

  v8 = [(AVSpeechSynthesisProviderVoice *)self version];
  [v9 encodeObject:v8 forKey:@"version"];

  objc_msgSend(v9, "encodeInt64:forKey:", -[AVSpeechSynthesisProviderVoice voiceSize](self, "voiceSize"), @"voiceSize");
  objc_msgSend(v9, "encodeInteger:forKey:", -[AVSpeechSynthesisProviderVoice gender](self, "gender"), @"gender");
  objc_msgSend(v9, "encodeInteger:forKey:", -[AVSpeechSynthesisProviderVoice age](self, "age"), @"age");
}

- (AVSpeechSynthesisProviderVoice)initWithName:(NSString *)name identifier:(NSString *)identifier primaryLanguages:(NSArray *)primaryLanguages supportedLanguages:(NSArray *)supportedLanguages
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if (_AVLoadSpeechSynthesisImplementation(void)::onceToken != -1) {
    dispatch_once(&_AVLoadSpeechSynthesisImplementation(void)::onceToken, &__block_literal_global_5009);
  }
}

@end