@interface ADAudioSessionCoordinationMessageBeginAudioSessionResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)init;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithDictionaryRepresentation:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
@end

@implementation ADAudioSessionCoordinationMessageBeginAudioSessionResponse

- (id)buildDictionaryRepresentation
{
  return &__NSDictionary0__struct;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    self = [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)self init];
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
  v4.super_class = (Class)ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  return [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  return [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)&v3 hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  objc_super v3 = [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)&v5 description];
  return v3;
}

- (NSString)description
{
  return (NSString *)[(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)self _descriptionWithIndent:0];
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)init
{
  return [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)self initWithBuilder:0];
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)initWithBuilder:(id)a3
{
  objc_super v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)ADAudioSessionCoordinationMessageBeginAudioSessionResponse;
  objc_super v5 = [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)&v9 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    [(_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *)v7 isDirty];
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *))a3;
  if (v4)
  {
    objc_super v5 = [[_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADAudioSessionCoordinationMessageBeginAudioSessionResponseMutation *)v5 isDirty]) {
      v6 = objc_alloc_init(ADAudioSessionCoordinationMessageBeginAudioSessionResponse);
    }
    else {
      v6 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)[(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)self copy];
    }
    v7 = v6;
  }
  else
  {
    v7 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)[(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)self copy];
  }

  return v7;
}

@end