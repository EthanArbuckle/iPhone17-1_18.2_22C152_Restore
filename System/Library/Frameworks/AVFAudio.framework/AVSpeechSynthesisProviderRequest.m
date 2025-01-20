@interface AVSpeechSynthesisProviderRequest
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- (AVSpeechSynthesisProviderRequest)initWithCoder:(id)a3;
- (AVSpeechSynthesisProviderRequest)initWithSSMLRepresentation:(NSString *)text voice:(AVSpeechSynthesisProviderVoice *)voice;
- (AVSpeechSynthesisProviderVoice)voice;
- (NSString)ssmlRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setSsmlRepresentation:(id)a3;
- (void)setVoice:(id)a3;
@end

@implementation AVSpeechSynthesisProviderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voice, 0);

  objc_storeStrong((id *)&self->_ssmlRepresentation, 0);
}

- (void)setVoice:(id)a3
{
}

- (AVSpeechSynthesisProviderVoice)voice
{
  return self->_voice;
}

- (void)setSsmlRepresentation:(id)a3
{
}

- (NSString)ssmlRepresentation
{
  return self->_ssmlRepresentation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(AVSpeechSynthesisProviderRequest *)self voice];
  [v4 setVoice:v5];

  v6 = [(AVSpeechSynthesisProviderRequest *)self ssmlRepresentation];
  [v4 setSsmlRepresentation:v6];

  return v4;
}

- (AVSpeechSynthesisProviderRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVSpeechSynthesisProviderRequest;
  v5 = [(AVSpeechSynthesisProviderRequest *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voice"];
    [(AVSpeechSynthesisProviderRequest *)v5 setVoice:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ssmlRepresentation"];
    [(AVSpeechSynthesisProviderRequest *)v5 setSsmlRepresentation:v7];

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AVSpeechSynthesisProviderRequest *)self voice];
  [v6 encodeObject:v4 forKey:@"voice"];

  v5 = [(AVSpeechSynthesisProviderRequest *)self ssmlRepresentation];
  [v6 encodeObject:v5 forKey:@"ssmlRepresentation"];
}

- (AVSpeechSynthesisProviderRequest)initWithSSMLRepresentation:(NSString *)text voice:(AVSpeechSynthesisProviderVoice *)voice
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