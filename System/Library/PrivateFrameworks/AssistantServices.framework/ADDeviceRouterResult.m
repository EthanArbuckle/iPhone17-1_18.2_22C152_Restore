@interface ADDeviceRouterResult
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceRouterResult)init;
- (ADDeviceRouterResult)initWithBuilder:(id)a3;
- (ADDeviceRouterResult)initWithCoder:(id)a3;
- (ADDeviceRouterResult)initWithPeerInfo:(id)a3 contextIdentifier:(id)a4 proximity:(int64_t)a5 commandRelayProxyIdentifier:(id)a6 error:(id)a7;
- (ADPeerInfo)peerInfo;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSString)commandRelayProxyIdentifier;
- (NSUUID)contextIdentifier;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)proximity;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceRouterResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_commandRelayProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_peerInfo, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSString)commandRelayProxyIdentifier
{
  return self->_commandRelayProxyIdentifier;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (ADPeerInfo)peerInfo
{
  return self->_peerInfo;
}

- (void)encodeWithCoder:(id)a3
{
  peerInfo = self->_peerInfo;
  id v6 = a3;
  [v6 encodeObject:peerInfo forKey:@"ADDeviceRouterResult::peerInfo"];
  [v6 encodeObject:self->_contextIdentifier forKey:@"ADDeviceRouterResult::contextIdentifier"];
  v5 = +[NSNumber numberWithInteger:self->_proximity];
  [v6 encodeObject:v5 forKey:@"ADDeviceRouterResult::proximity"];

  [v6 encodeObject:self->_commandRelayProxyIdentifier forKey:@"ADDeviceRouterResult::commandRelayProxyIdentifier"];
  [v6 encodeObject:self->_error forKey:@"ADDeviceRouterResult::error"];
}

- (ADDeviceRouterResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceRouterResult::peerInfo"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceRouterResult::contextIdentifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceRouterResult::proximity"];
  id v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceRouterResult::commandRelayProxyIdentifier"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceRouterResult::error"];

  v11 = [(ADDeviceRouterResult *)self initWithPeerInfo:v5 contextIdentifier:v6 proximity:v8 commandRelayProxyIdentifier:v9 error:v10];
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceRouterResult *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id proximity = self->_proximity;
      if (proximity == (id)[(ADDeviceRouterResult *)v5 proximity])
      {
        v7 = [(ADDeviceRouterResult *)v5 peerInfo];
        peerInfo = self->_peerInfo;
        if (peerInfo == v7 || [(ADPeerInfo *)peerInfo isEqual:v7])
        {
          v9 = [(ADDeviceRouterResult *)v5 contextIdentifier];
          contextIdentifier = self->_contextIdentifier;
          if (contextIdentifier == v9 || [(NSUUID *)contextIdentifier isEqual:v9])
          {
            v11 = [(ADDeviceRouterResult *)v5 commandRelayProxyIdentifier];
            commandRelayProxyIdentifier = self->_commandRelayProxyIdentifier;
            if (commandRelayProxyIdentifier == v11
              || [(NSString *)commandRelayProxyIdentifier isEqual:v11])
            {
              v13 = [(ADDeviceRouterResult *)v5 error];
              error = self->_error;
              BOOL v15 = error == v13 || [(NSError *)error isEqual:v13];
            }
            else
            {
              BOOL v15 = 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
        }
        else
        {
          BOOL v15 = 0;
        }
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ADPeerInfo *)self->_peerInfo hash];
  unint64_t v4 = (unint64_t)[(NSUUID *)self->_contextIdentifier hash] ^ v3;
  v5 = +[NSNumber numberWithInteger:self->_proximity];
  unint64_t v6 = (unint64_t)[v5 hash];
  unint64_t v7 = v4 ^ [(NSString *)self->_commandRelayProxyIdentifier hash] ^ v6;
  unint64_t v8 = v7 ^ (unint64_t)[(NSError *)self->_error hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceRouterResult;
  v5 = [(ADDeviceRouterResult *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {peerInfo = %@, contextIdentifier = %@, proximity = %lld, commandRelayProxyIdentifier = %@, error = %@}", v5, self->_peerInfo, self->_contextIdentifier, self->_proximity, self->_commandRelayProxyIdentifier, self->_error];

  return v6;
}

- (id)description
{
  return [(ADDeviceRouterResult *)self _descriptionWithIndent:0];
}

- (ADDeviceRouterResult)initWithPeerInfo:(id)a3 contextIdentifier:(id)a4 proximity:(int64_t)a5 commandRelayProxyIdentifier:(id)a6 error:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100215124;
  v21[3] = &unk_100506FE8;
  id v22 = v12;
  id v23 = v13;
  id v25 = a7;
  int64_t v26 = a5;
  id v24 = v14;
  id v15 = v25;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  v19 = [(ADDeviceRouterResult *)self initWithBuilder:v21];

  return v19;
}

- (ADDeviceRouterResult)init
{
  return [(ADDeviceRouterResult *)self initWithBuilder:0];
}

- (ADDeviceRouterResult)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceRouterResultMutation *))a3;
  v21.receiver = self;
  v21.super_class = (Class)ADDeviceRouterResult;
  v5 = [(ADDeviceRouterResult *)&v21 init];
  id v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_ADDeviceRouterResultMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceRouterResultMutation *)v7 isDirty])
    {
      objc_super v8 = [(_ADDeviceRouterResultMutation *)v7 getPeerInfo];
      v9 = (ADPeerInfo *)[v8 copy];
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = v9;

      v11 = [(_ADDeviceRouterResultMutation *)v7 getContextIdentifier];
      id v12 = (NSUUID *)[v11 copy];
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = v12;

      v6->_id proximity = [(_ADDeviceRouterResultMutation *)v7 getProximity];
      id v14 = [(_ADDeviceRouterResultMutation *)v7 getCommandRelayProxyIdentifier];
      id v15 = (NSString *)[v14 copy];
      commandRelayProxyIdentifier = v6->_commandRelayProxyIdentifier;
      v6->_commandRelayProxyIdentifier = v15;

      id v17 = [(_ADDeviceRouterResultMutation *)v7 getError];
      id v18 = (NSError *)[v17 copy];
      error = v6->_error;
      v6->_error = v18;
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
  id v4 = (void (**)(id, _ADDeviceRouterResultMutation *))a3;
  if (v4)
  {
    v5 = [[_ADDeviceRouterResultMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceRouterResultMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceRouterResult);
      unint64_t v7 = [(_ADDeviceRouterResultMutation *)v5 getPeerInfo];
      objc_super v8 = (ADPeerInfo *)[v7 copy];
      peerInfo = v6->_peerInfo;
      v6->_peerInfo = v8;

      v10 = [(_ADDeviceRouterResultMutation *)v5 getContextIdentifier];
      v11 = (NSUUID *)[v10 copy];
      contextIdentifier = v6->_contextIdentifier;
      v6->_contextIdentifier = v11;

      v6->_id proximity = [(_ADDeviceRouterResultMutation *)v5 getProximity];
      id v13 = [(_ADDeviceRouterResultMutation *)v5 getCommandRelayProxyIdentifier];
      id v14 = (NSString *)[v13 copy];
      commandRelayProxyIdentifier = v6->_commandRelayProxyIdentifier;
      v6->_commandRelayProxyIdentifier = v14;

      id v16 = [(_ADDeviceRouterResultMutation *)v5 getError];
      id v17 = (NSError *)[v16 copy];
      error = v6->_error;
      v6->_error = v17;
    }
    else
    {
      id v6 = (ADDeviceRouterResult *)[(ADDeviceRouterResult *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceRouterResult *)[(ADDeviceRouterResult *)self copy];
  }

  return v6;
}

@end