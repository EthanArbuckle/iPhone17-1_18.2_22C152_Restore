@interface ADAudioSessionCoordinationMessageEndAudioSessionRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)init;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithEffectiveDate:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)effectiveDate;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessageEndAudioSessionRequest

- (void).cxx_destruct
{
}

- (NSDate)effectiveDate
{
  return self->_effectiveDate;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  effectiveDate = self->_effectiveDate;
  if (effectiveDate) {
    [v3 setObject:effectiveDate forKey:@"effectiveDate"];
  }
  id v6 = [v4 copy];

  return v6;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    v4 = [a3 objectForKey:@"effectiveDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    self = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self initWithEffectiveDate:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessageEndAudioSessionRequest::effectiveDate"];

  id v6 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self initWithEffectiveDate:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)v4 effectiveDate];
      effectiveDate = self->_effectiveDate;
      BOOL v7 = effectiveDate == v5 || [(NSDate *)effectiveDate isEqual:v5];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSDate *)self->_effectiveDate hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADAudioSessionCoordinationMessageEndAudioSessionRequest;
  id v5 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {effectiveDate = %@}", v5, self->_effectiveDate];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self _descriptionWithIndent:0];
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithEffectiveDate:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B8EFC;
  v7[3] = &unk_100500C48;
  id v8 = a3;
  id v4 = v8;
  id v5 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self initWithBuilder:v7];

  return v5;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)init
{
  return [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self initWithBuilder:0];
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADAudioSessionCoordinationMessageEndAudioSessionRequest;
  id v5 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *)v7 isDirty])
    {
      id v8 = [(_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *)v7 getEffectiveDate];
      v9 = (NSDate *)[v8 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v9;
    }
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *))a3;
  if (v4)
  {
    id v5 = [[_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADAudioSessionCoordinationMessageEndAudioSessionRequest);
      BOOL v7 = [(_ADAudioSessionCoordinationMessageEndAudioSessionRequestMutation *)v5 getEffectiveDate];
      id v8 = (NSDate *)[v7 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v8;
    }
    else
    {
      id v6 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)[(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)[(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self copy];
  }

  return v6;
}

@end