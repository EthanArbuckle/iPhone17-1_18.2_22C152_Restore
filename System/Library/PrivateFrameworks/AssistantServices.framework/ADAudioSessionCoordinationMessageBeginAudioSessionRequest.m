@interface ADAudioSessionCoordinationMessageBeginAudioSessionRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)init;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithEffectiveDate:(id)a3 expirationDuration:(double)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)effectiveDate;
- (NSString)description;
- (double)expirationDuration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessageBeginAudioSessionRequest

- (void).cxx_destruct
{
}

- (double)expirationDuration
{
  return self->_expirationDuration;
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
  v6 = +[NSNumber numberWithDouble:self->_expirationDuration];
  [v4 setObject:v6 forKey:@"expirationDuration"];

  id v7 = [v4 copy];
  return v7;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithDictionaryRepresentation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKey:@"effectiveDate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    v8 = [v4 objectForKey:@"expirationDuration"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }

    [v9 doubleValue];
    double v11 = v10;

    self = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self initWithEffectiveDate:v6 expirationDuration:v11];
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  effectiveDate = self->_effectiveDate;
  id v5 = a3;
  [v5 encodeObject:effectiveDate forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::effectiveDate"];
  id v6 = +[NSNumber numberWithDouble:self->_expirationDuration];
  [v5 encodeObject:v6 forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::expirationDuration"];
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::effectiveDate"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessageBeginAudioSessionRequest::expirationDuration"];

  [v6 doubleValue];
  double v8 = v7;

  id v9 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self initWithEffectiveDate:v5 expirationDuration:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      double expirationDuration = self->_expirationDuration;
      [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)v5 expirationDuration];
      if (expirationDuration == v7)
      {
        id v9 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)v5 effectiveDate];
        effectiveDate = self->_effectiveDate;
        BOOL v8 = effectiveDate == v9 || [(NSDate *)effectiveDate isEqual:v9];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSDate *)self->_effectiveDate hash];
  id v4 = +[NSNumber numberWithDouble:self->_expirationDuration];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;

  return v5;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADAudioSessionCoordinationMessageBeginAudioSessionRequest;
  unint64_t v5 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {effectiveDate = %@, expirationDuration = %f}", v5, self->_effectiveDate, *(void *)&self->_expirationDuration];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self _descriptionWithIndent:0];
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithEffectiveDate:(id)a3 expirationDuration:(double)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100230B0C;
  v9[3] = &unk_100507728;
  id v10 = a3;
  double v11 = a4;
  id v6 = v10;
  double v7 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self initWithBuilder:v9];

  return v7;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)init
{
  return [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self initWithBuilder:0];
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *))a3;
  v13.receiver = self;
  v13.super_class = (Class)ADAudioSessionCoordinationMessageBeginAudioSessionRequest;
  unint64_t v5 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)&v13 init];
  id v6 = v5;
  if (v4 && v5)
  {
    double v7 = [[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)v7 isDirty])
    {
      objc_super v8 = [(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)v7 getEffectiveDate];
      id v9 = (NSDate *)[v8 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v9;

      [(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)v7 getExpirationDuration];
      v6->_double expirationDuration = v11;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADAudioSessionCoordinationMessageBeginAudioSessionRequest);
      double v7 = [(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)v5 getEffectiveDate];
      objc_super v8 = (NSDate *)[v7 copy];
      effectiveDate = v6->_effectiveDate;
      v6->_effectiveDate = v8;

      [(_ADAudioSessionCoordinationMessageBeginAudioSessionRequestMutation *)v5 getExpirationDuration];
      v6->_double expirationDuration = v10;
    }
    else
    {
      id v6 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)[(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)[(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self copy];
  }

  return v6;
}

@end