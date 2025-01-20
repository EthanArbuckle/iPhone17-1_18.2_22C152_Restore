@interface ADAudioSessionCoordinationMessageEndAudioSessionResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)init;
- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
@end

@implementation ADAudioSessionCoordinationMessageEndAudioSessionResponse

- (id)buildDictionaryRepresentation
{
  return &__NSDictionary0__struct;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    self = [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)self init];
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ADAudioSessionCoordinationMessageEndAudioSessionResponse;
  return [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)ADAudioSessionCoordinationMessageEndAudioSessionResponse;
  return [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)&v3 hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADAudioSessionCoordinationMessageEndAudioSessionResponse;
  objc_super v3 = [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)&v5 description];
  return v3;
}

- (NSString)description
{
  return (NSString *)[(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)self _descriptionWithIndent:0];
}

- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)init
{
  return [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)self initWithBuilder:0];
}

- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)initWithBuilder:(id)a3
{
  objc_super v4 = (void (**)(id, _ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAudioSessionCoordinationMessageEndAudioSessionResponse;
  objc_super v5 = [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)&v9 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    [(_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation *)v7 isDirty];
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation *))a3;
  if (v4)
  {
    objc_super v5 = [[_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADAudioSessionCoordinationMessageEndAudioSessionResponseMutation *)v5 isDirty]) {
      v6 = objc_alloc_init(ADAudioSessionCoordinationMessageEndAudioSessionResponse);
    }
    else {
      v6 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)[(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)self copy];
    }
    v7 = v6;
  }
  else
  {
    v7 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)[(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)self copy];
  }

  return v7;
}

@end