@interface ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)init;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithExpirationDuration:(double)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)expirationDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest

- (double)expirationDuration
{
  return self->_expirationDuration;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithDouble:self->_expirationDuration];
  [v3 setObject:v4 forKey:@"expirationDuration"];

  id v5 = [v3 copy];
  return v5;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    v4 = [a3 objectForKey:@"expirationDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    [v5 doubleValue];
    double v8 = v7;

    self = [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self initWithExpirationDuration:v8];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  double expirationDuration = self->_expirationDuration;
  id v4 = a3;
  id v5 = +[NSNumber numberWithDouble:expirationDuration];
  [v4 encodeObject:v5 forKey:@"ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest::expirationDuration"];
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest::expirationDuration"];

  [v5 doubleValue];
  double v7 = v6;

  return [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self initWithExpirationDuration:v7];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double expirationDuration = self->_expirationDuration;
      [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)v4 expirationDuration];
      BOOL v7 = expirationDuration == v6;
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
  v2 = +[NSNumber numberWithDouble:self->_expirationDuration];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest;
  id v5 = [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {double expirationDuration = %f}", v5, *(void *)&self->_expirationDuration];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self _descriptionWithIndent:0];
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithExpirationDuration:(double)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100213B5C;
  v4[3] = &unk_100506F50;
  *(double *)&v4[4] = a3;
  return [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self initWithBuilder:v4];
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)init
{
  return [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self initWithBuilder:0];
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *))a3;
  v10.receiver = self;
  v10.super_class = (Class)ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest;
  id v5 = [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)&v10 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *)v7 isDirty])
    {
      [(_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *)v7 getExpirationDuration];
      v6->_double expirationDuration = v8;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *))a3;
  if (v4)
  {
    id v5 = [[_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest);
      [(_ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequestMutation *)v5 getExpirationDuration];
      v6->_double expirationDuration = v7;
    }
    else
    {
      id v6 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)[(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)[(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self copy];
  }

  return v6;
}

@end