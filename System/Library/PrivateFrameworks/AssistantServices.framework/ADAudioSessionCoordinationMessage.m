@interface ADAudioSessionCoordinationMessage
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessage)init;
- (ADAudioSessionCoordinationMessage)initWithBuilder:(id)a3;
- (ADAudioSessionCoordinationMessage)initWithCoder:(id)a3;
- (ADAudioSessionCoordinationMessage)initWithDictionaryRepresentation:(id)a3;
- (ADAudioSessionCoordinationMessage)initWithHostTime:(unint64_t)a3 type:(int64_t)a4 payloadBeginAudioSessionRequest:(id)a5 payloadBeginAudioSessionResponse:(id)a6 payloadKeepAudioSessionAliveRequest:(id)a7 payloadKeepAudioSessionAliveResponse:(id)a8 payloadEndAudioSessionRequest:(id)a9 payloadEndAudioSessionResponse:(id)a10;
- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)payloadBeginAudioSessionRequest;
- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)payloadBeginAudioSessionResponse;
- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)payloadEndAudioSessionRequest;
- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)payloadEndAudioSessionResponse;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)payloadKeepAudioSessionAliveRequest;
- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)payloadKeepAudioSessionAliveResponse;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)type;
- (unint64_t)hash;
- (unint64_t)hostTime;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADAudioSessionCoordinationMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadEndAudioSessionResponse, 0);
  objc_storeStrong((id *)&self->_payloadEndAudioSessionRequest, 0);
  objc_storeStrong((id *)&self->_payloadKeepAudioSessionAliveResponse, 0);
  objc_storeStrong((id *)&self->_payloadKeepAudioSessionAliveRequest, 0);
  objc_storeStrong((id *)&self->_payloadBeginAudioSessionResponse, 0);
  objc_storeStrong((id *)&self->_payloadBeginAudioSessionRequest, 0);
}

- (ADAudioSessionCoordinationMessageEndAudioSessionResponse)payloadEndAudioSessionResponse
{
  return self->_payloadEndAudioSessionResponse;
}

- (ADAudioSessionCoordinationMessageEndAudioSessionRequest)payloadEndAudioSessionRequest
{
  return self->_payloadEndAudioSessionRequest;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse)payloadKeepAudioSessionAliveResponse
{
  return self->_payloadKeepAudioSessionAliveResponse;
}

- (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest)payloadKeepAudioSessionAliveRequest
{
  return self->_payloadKeepAudioSessionAliveRequest;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionResponse)payloadBeginAudioSessionResponse
{
  return self->_payloadBeginAudioSessionResponse;
}

- (ADAudioSessionCoordinationMessageBeginAudioSessionRequest)payloadBeginAudioSessionRequest
{
  return self->_payloadBeginAudioSessionRequest;
}

- (int64_t)type
{
  return self->_type;
}

- (unint64_t)hostTime
{
  return self->_hostTime;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = +[NSNumber numberWithUnsignedLongLong:self->_hostTime];
  [v3 setObject:v4 forKey:@"hostTime"];

  unint64_t type = self->_type;
  if (type > 6) {
    v6 = @"(unknown)";
  }
  else {
    v6 = *(&off_100502C88 + type);
  }
  v7 = v6;
  [v3 setObject:v7 forKey:@"type"];

  payloadBeginAudioSessionRequest = self->_payloadBeginAudioSessionRequest;
  if (payloadBeginAudioSessionRequest)
  {
    v9 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)payloadBeginAudioSessionRequest buildDictionaryRepresentation];
    [v3 setObject:v9 forKey:@"payloadBeginAudioSessionRequest"];
  }
  payloadBeginAudioSessionResponse = self->_payloadBeginAudioSessionResponse;
  if (payloadBeginAudioSessionResponse)
  {
    v11 = [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)payloadBeginAudioSessionResponse buildDictionaryRepresentation];
    [v3 setObject:v11 forKey:@"payloadBeginAudioSessionResponse"];
  }
  payloadKeepAudioSessionAliveRequest = self->_payloadKeepAudioSessionAliveRequest;
  if (payloadKeepAudioSessionAliveRequest)
  {
    v13 = [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)payloadKeepAudioSessionAliveRequest buildDictionaryRepresentation];
    [v3 setObject:v13 forKey:@"payloadKeepAudioSessionAliveRequest"];
  }
  payloadKeepAudioSessionAliveResponse = self->_payloadKeepAudioSessionAliveResponse;
  if (payloadKeepAudioSessionAliveResponse)
  {
    v15 = [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)payloadKeepAudioSessionAliveResponse buildDictionaryRepresentation];
    [v3 setObject:v15 forKey:@"payloadKeepAudioSessionAliveResponse"];
  }
  payloadEndAudioSessionRequest = self->_payloadEndAudioSessionRequest;
  if (payloadEndAudioSessionRequest)
  {
    v17 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)payloadEndAudioSessionRequest buildDictionaryRepresentation];
    [v3 setObject:v17 forKey:@"payloadEndAudioSessionRequest"];
  }
  payloadEndAudioSessionResponse = self->_payloadEndAudioSessionResponse;
  if (payloadEndAudioSessionResponse)
  {
    v19 = [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)payloadEndAudioSessionResponse buildDictionaryRepresentation];
    [v3 setObject:v19 forKey:@"payloadEndAudioSessionResponse"];
  }
  id v20 = [v3 copy];

  return v20;
}

- (ADAudioSessionCoordinationMessage)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"hostTime"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    id v9 = [v7 unsignedLongLongValue];
    v10 = [v5 objectForKey:@"type"];
    objc_opt_class();
    id v27 = v9;
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      if ([v11 length])
      {
        if (qword_100585BF8 != -1) {
          dispatch_once(&qword_100585BF8, &stru_100502C68);
        }
        v12 = [(id)qword_100585C00 objectForKey:v11];
        id v13 = [v12 integerValue];
      }
      else
      {
        id v13 = 0;
      }
    }
    else
    {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"payloadBeginAudioSessionRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = [[ADAudioSessionCoordinationMessageBeginAudioSessionRequest alloc] initWithDictionaryRepresentation:v14];
    }
    else {
      v15 = 0;
    }

    v16 = [v5 objectForKey:@"payloadBeginAudioSessionResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = [[ADAudioSessionCoordinationMessageBeginAudioSessionResponse alloc] initWithDictionaryRepresentation:v16];
    }
    else {
      v17 = 0;
    }

    v18 = [v5 objectForKey:@"payloadKeepAudioSessionAliveRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v19 = [[ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest alloc] initWithDictionaryRepresentation:v18];
    }
    else {
      v19 = 0;
    }

    id v20 = [v5 objectForKey:@"payloadKeepAudioSessionAliveResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v21 = [[ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse alloc] initWithDictionaryRepresentation:v20];
    }
    else {
      v21 = 0;
    }

    v22 = [v5 objectForKey:@"payloadEndAudioSessionRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v23 = [[ADAudioSessionCoordinationMessageEndAudioSessionRequest alloc] initWithDictionaryRepresentation:v22];
    }
    else {
      v23 = 0;
    }

    v24 = [v5 objectForKey:@"payloadEndAudioSessionResponse"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v25 = [[ADAudioSessionCoordinationMessageEndAudioSessionResponse alloc] initWithDictionaryRepresentation:v24];
    }
    else {
      v25 = 0;
    }

    self = [(ADAudioSessionCoordinationMessage *)self initWithHostTime:v27 type:v13 payloadBeginAudioSessionRequest:v15 payloadBeginAudioSessionResponse:v17 payloadKeepAudioSessionAliveRequest:v19 payloadKeepAudioSessionAliveResponse:v21 payloadEndAudioSessionRequest:v23 payloadEndAudioSessionResponse:v25];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t hostTime = self->_hostTime;
  id v7 = a3;
  v5 = +[NSNumber numberWithUnsignedLongLong:hostTime];
  [v7 encodeObject:v5 forKey:@"ADAudioSessionCoordinationMessage::hostTime"];

  v6 = +[NSNumber numberWithInteger:self->_type];
  [v7 encodeObject:v6 forKey:@"ADAudioSessionCoordinationMessage::type"];

  [v7 encodeObject:self->_payloadBeginAudioSessionRequest forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionRequest"];
  [v7 encodeObject:self->_payloadBeginAudioSessionResponse forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionResponse"];
  [v7 encodeObject:self->_payloadKeepAudioSessionAliveRequest forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveRequest"];
  [v7 encodeObject:self->_payloadKeepAudioSessionAliveResponse forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveResponse"];
  [v7 encodeObject:self->_payloadEndAudioSessionRequest forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionRequest"];
  [v7 encodeObject:self->_payloadEndAudioSessionResponse forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionResponse"];
}

- (ADAudioSessionCoordinationMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::hostTime"];
  id v6 = [v5 unsignedLongLongValue];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::type"];
  id v8 = [v7 integerValue];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionRequest"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::payloadBeginAudioSessionResponse"];
  id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveRequest"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::payloadKeepAudioSessionAliveResponse"];
  id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionRequest"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADAudioSessionCoordinationMessage::payloadEndAudioSessionResponse"];

  v15 = [(ADAudioSessionCoordinationMessage *)self initWithHostTime:v6 type:v8 payloadBeginAudioSessionRequest:v9 payloadBeginAudioSessionResponse:v10 payloadKeepAudioSessionAliveRequest:v11 payloadKeepAudioSessionAliveResponse:v12 payloadEndAudioSessionRequest:v13 payloadEndAudioSessionResponse:v14];
  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADAudioSessionCoordinationMessage *)a3;
  if (self == v4)
  {
    BOOL v20 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id hostTime = self->_hostTime;
      if (hostTime == (id)[(ADAudioSessionCoordinationMessage *)v5 hostTime]
        && (id type = self->_type, type == (id)[(ADAudioSessionCoordinationMessage *)v5 type]))
      {
        id v8 = [(ADAudioSessionCoordinationMessage *)v5 payloadBeginAudioSessionRequest];
        payloadBeginAudioSessionRequest = self->_payloadBeginAudioSessionRequest;
        if (payloadBeginAudioSessionRequest == v8
          || [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)payloadBeginAudioSessionRequest isEqual:v8])
        {
          v10 = [(ADAudioSessionCoordinationMessage *)v5 payloadBeginAudioSessionResponse];
          payloadBeginAudioSessionResponse = self->_payloadBeginAudioSessionResponse;
          if (payloadBeginAudioSessionResponse == v10
            || [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)payloadBeginAudioSessionResponse isEqual:v10])
          {
            v12 = [(ADAudioSessionCoordinationMessage *)v5 payloadKeepAudioSessionAliveRequest];
            payloadKeepAudioSessionAliveRequest = self->_payloadKeepAudioSessionAliveRequest;
            if (payloadKeepAudioSessionAliveRequest == v12
              || [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)payloadKeepAudioSessionAliveRequest isEqual:v12])
            {
              v14 = [(ADAudioSessionCoordinationMessage *)v5 payloadKeepAudioSessionAliveResponse];
              payloadKeepAudioSessionAliveResponse = self->_payloadKeepAudioSessionAliveResponse;
              if (payloadKeepAudioSessionAliveResponse == v14
                || [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)payloadKeepAudioSessionAliveResponse isEqual:v14])
              {
                v16 = [(ADAudioSessionCoordinationMessage *)v5 payloadEndAudioSessionRequest];
                payloadEndAudioSessionRequest = self->_payloadEndAudioSessionRequest;
                if (payloadEndAudioSessionRequest == v16
                  || [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)payloadEndAudioSessionRequest isEqual:v16])
                {
                  v18 = [(ADAudioSessionCoordinationMessage *)v5 payloadEndAudioSessionResponse];
                  payloadEndAudioSessionResponse = self->_payloadEndAudioSessionResponse;
                  BOOL v20 = payloadEndAudioSessionResponse == v18
                     || [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)payloadEndAudioSessionResponse isEqual:v18];
                }
                else
                {
                  BOOL v20 = 0;
                }
              }
              else
              {
                BOOL v20 = 0;
              }
            }
            else
            {
              BOOL v20 = 0;
            }
          }
          else
          {
            BOOL v20 = 0;
          }
        }
        else
        {
          BOOL v20 = 0;
        }
      }
      else
      {
        BOOL v20 = 0;
      }
    }
    else
    {
      BOOL v20 = 0;
    }
  }

  return v20;
}

- (unint64_t)hash
{
  id v3 = +[NSNumber numberWithUnsignedLongLong:self->_hostTime];
  unint64_t v4 = (unint64_t)[v3 hash];
  v5 = +[NSNumber numberWithInteger:self->_type];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  unint64_t v7 = [(ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)self->_payloadBeginAudioSessionRequest hash];
  unint64_t v8 = v7 ^ [(ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)self->_payloadBeginAudioSessionResponse hash];
  unint64_t v9 = v8 ^ [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)self->_payloadKeepAudioSessionAliveRequest hash];
  unint64_t v10 = v6 ^ v9 ^ [(ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)self->_payloadKeepAudioSessionAliveResponse hash];
  unint64_t v11 = [(ADAudioSessionCoordinationMessageEndAudioSessionRequest *)self->_payloadEndAudioSessionRequest hash];
  unint64_t v12 = v10 ^ v11 ^ [(ADAudioSessionCoordinationMessageEndAudioSessionResponse *)self->_payloadEndAudioSessionResponse hash];

  return v12;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v12.receiver = self;
  v12.super_class = (Class)ADAudioSessionCoordinationMessage;
  v5 = [(ADAudioSessionCoordinationMessage *)&v12 description];
  unint64_t hostTime = self->_hostTime;
  unint64_t type = self->_type;
  if (type > 6) {
    unint64_t v8 = @"(unknown)";
  }
  else {
    unint64_t v8 = *(&off_100502C88 + type);
  }
  unint64_t v9 = v8;
  v10 = [v4 initWithFormat:@"%@ {hostTime = %llu, unint64_t type = %@, payloadBeginAudioSessionRequest = %@, payloadBeginAudioSessionResponse = %@, payloadKeepAudioSessionAliveRequest = %@, payloadKeepAudioSessionAliveResponse = %@, payloadEndAudioSessionRequest = %@, payloadEndAudioSessionResponse = %@}", v5, hostTime, v9, self->_payloadBeginAudioSessionRequest, self->_payloadBeginAudioSessionResponse, self->_payloadKeepAudioSessionAliveRequest, self->_payloadKeepAudioSessionAliveResponse, self->_payloadEndAudioSessionRequest, self->_payloadEndAudioSessionResponse];

  return v10;
}

- (NSString)description
{
  return (NSString *)[(ADAudioSessionCoordinationMessage *)self _descriptionWithIndent:0];
}

- (ADAudioSessionCoordinationMessage)initWithHostTime:(unint64_t)a3 type:(int64_t)a4 payloadBeginAudioSessionRequest:(id)a5 payloadBeginAudioSessionResponse:(id)a6 payloadKeepAudioSessionAliveRequest:(id)a7 payloadKeepAudioSessionAliveResponse:(id)a8 payloadEndAudioSessionRequest:(id)a9 payloadEndAudioSessionResponse:(id)a10
{
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10035F604;
  v22[3] = &unk_10050DB30;
  unint64_t v29 = a3;
  int64_t v30 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v27 = a9;
  id v28 = a10;
  id v13 = v28;
  id v14 = v27;
  id v15 = v26;
  id v16 = v25;
  id v17 = v24;
  id v18 = v23;
  v19 = [(ADAudioSessionCoordinationMessage *)self initWithBuilder:v22];

  return v19;
}

- (ADAudioSessionCoordinationMessage)init
{
  return [(ADAudioSessionCoordinationMessage *)self initWithBuilder:0];
}

- (ADAudioSessionCoordinationMessage)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageMutation *))a3;
  v27.receiver = self;
  v27.super_class = (Class)ADAudioSessionCoordinationMessage;
  v5 = [(ADAudioSessionCoordinationMessage *)&v27 init];
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_ADAudioSessionCoordinationMessageMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADAudioSessionCoordinationMessageMutation *)v7 isDirty])
    {
      v6->_unint64_t hostTime = [(_ADAudioSessionCoordinationMessageMutation *)v7 getHostTime];
      v6->_unint64_t type = [(_ADAudioSessionCoordinationMessageMutation *)v7 getType];
      unint64_t v8 = [(_ADAudioSessionCoordinationMessageMutation *)v7 getPayloadBeginAudioSessionRequest];
      unint64_t v9 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)[v8 copy];
      payloadBeginAudioSessionRequest = v6->_payloadBeginAudioSessionRequest;
      v6->_payloadBeginAudioSessionRequest = v9;

      unint64_t v11 = [(_ADAudioSessionCoordinationMessageMutation *)v7 getPayloadBeginAudioSessionResponse];
      objc_super v12 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)[v11 copy];
      payloadBeginAudioSessionResponse = v6->_payloadBeginAudioSessionResponse;
      v6->_payloadBeginAudioSessionResponse = v12;

      id v14 = [(_ADAudioSessionCoordinationMessageMutation *)v7 getPayloadKeepAudioSessionAliveRequest];
      id v15 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)[v14 copy];
      payloadKeepAudioSessionAliveRequest = v6->_payloadKeepAudioSessionAliveRequest;
      v6->_payloadKeepAudioSessionAliveRequest = v15;

      id v17 = [(_ADAudioSessionCoordinationMessageMutation *)v7 getPayloadKeepAudioSessionAliveResponse];
      id v18 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)[v17 copy];
      payloadKeepAudioSessionAliveResponse = v6->_payloadKeepAudioSessionAliveResponse;
      v6->_payloadKeepAudioSessionAliveResponse = v18;

      BOOL v20 = [(_ADAudioSessionCoordinationMessageMutation *)v7 getPayloadEndAudioSessionRequest];
      v21 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)[v20 copy];
      payloadEndAudioSessionRequest = v6->_payloadEndAudioSessionRequest;
      v6->_payloadEndAudioSessionRequest = v21;

      id v23 = [(_ADAudioSessionCoordinationMessageMutation *)v7 getPayloadEndAudioSessionResponse];
      id v24 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)[v23 copy];
      payloadEndAudioSessionResponse = v6->_payloadEndAudioSessionResponse;
      v6->_payloadEndAudioSessionResponse = v24;
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
  id v4 = (void (**)(id, _ADAudioSessionCoordinationMessageMutation *))a3;
  if (v4)
  {
    v5 = [[_ADAudioSessionCoordinationMessageMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADAudioSessionCoordinationMessageMutation *)v5 isDirty])
    {
      unint64_t v6 = objc_alloc_init(ADAudioSessionCoordinationMessage);
      v6->_unint64_t hostTime = [(_ADAudioSessionCoordinationMessageMutation *)v5 getHostTime];
      v6->_unint64_t type = [(_ADAudioSessionCoordinationMessageMutation *)v5 getType];
      unint64_t v7 = [(_ADAudioSessionCoordinationMessageMutation *)v5 getPayloadBeginAudioSessionRequest];
      unint64_t v8 = (ADAudioSessionCoordinationMessageBeginAudioSessionRequest *)[v7 copy];
      payloadBeginAudioSessionRequest = v6->_payloadBeginAudioSessionRequest;
      v6->_payloadBeginAudioSessionRequest = v8;

      id v10 = [(_ADAudioSessionCoordinationMessageMutation *)v5 getPayloadBeginAudioSessionResponse];
      unint64_t v11 = (ADAudioSessionCoordinationMessageBeginAudioSessionResponse *)[v10 copy];
      payloadBeginAudioSessionResponse = v6->_payloadBeginAudioSessionResponse;
      v6->_payloadBeginAudioSessionResponse = v11;

      id v13 = [(_ADAudioSessionCoordinationMessageMutation *)v5 getPayloadKeepAudioSessionAliveRequest];
      id v14 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveRequest *)[v13 copy];
      payloadKeepAudioSessionAliveRequest = v6->_payloadKeepAudioSessionAliveRequest;
      v6->_payloadKeepAudioSessionAliveRequest = v14;

      id v16 = [(_ADAudioSessionCoordinationMessageMutation *)v5 getPayloadKeepAudioSessionAliveResponse];
      id v17 = (ADAudioSessionCoordinationMessageKeepAudioSessionAliveResponse *)[v16 copy];
      payloadKeepAudioSessionAliveResponse = v6->_payloadKeepAudioSessionAliveResponse;
      v6->_payloadKeepAudioSessionAliveResponse = v17;

      v19 = [(_ADAudioSessionCoordinationMessageMutation *)v5 getPayloadEndAudioSessionRequest];
      BOOL v20 = (ADAudioSessionCoordinationMessageEndAudioSessionRequest *)[v19 copy];
      payloadEndAudioSessionRequest = v6->_payloadEndAudioSessionRequest;
      v6->_payloadEndAudioSessionRequest = v20;

      v22 = [(_ADAudioSessionCoordinationMessageMutation *)v5 getPayloadEndAudioSessionResponse];
      id v23 = (ADAudioSessionCoordinationMessageEndAudioSessionResponse *)[v22 copy];
      payloadEndAudioSessionResponse = v6->_payloadEndAudioSessionResponse;
      v6->_payloadEndAudioSessionResponse = v23;
    }
    else
    {
      unint64_t v6 = (ADAudioSessionCoordinationMessage *)[(ADAudioSessionCoordinationMessage *)self copy];
    }
  }
  else
  {
    unint64_t v6 = (ADAudioSessionCoordinationMessage *)[(ADAudioSessionCoordinationMessage *)self copy];
  }

  return v6;
}

@end