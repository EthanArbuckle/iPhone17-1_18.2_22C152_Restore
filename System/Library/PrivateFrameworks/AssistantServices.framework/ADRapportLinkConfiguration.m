@interface ADRapportLinkConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkConfiguration)init;
- (ADRapportLinkConfiguration)initWithBuilder:(id)a3;
- (ADRapportLinkConfiguration)initWithCoder:(id)a3;
- (ADRapportLinkConfiguration)initWithDiscoveryOptions:(id)a3 transportOptions:(id)a4 connectionOptions:(id)a5 enablesProximityTracking:(int64_t)a6;
- (ADRapportLinkConnectionOptions)connectionOptions;
- (ADRapportLinkDiscoveryOptions)discoveryOptions;
- (ADRapportLinkTransportOptions)transportOptions;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)enablesProximityTracking;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionOptions, 0);
  objc_storeStrong((id *)&self->_transportOptions, 0);
  objc_storeStrong((id *)&self->_discoveryOptions, 0);
}

- (int64_t)enablesProximityTracking
{
  return self->_enablesProximityTracking;
}

- (ADRapportLinkConnectionOptions)connectionOptions
{
  return self->_connectionOptions;
}

- (ADRapportLinkTransportOptions)transportOptions
{
  return self->_transportOptions;
}

- (ADRapportLinkDiscoveryOptions)discoveryOptions
{
  return self->_discoveryOptions;
}

- (void)encodeWithCoder:(id)a3
{
  discoveryOptions = self->_discoveryOptions;
  id v5 = a3;
  [v5 encodeObject:discoveryOptions forKey:@"ADRapportLinkConfiguration::discoveryOptions"];
  [v5 encodeObject:self->_transportOptions forKey:@"ADRapportLinkConfiguration::transportOptions"];
  [v5 encodeObject:self->_connectionOptions forKey:@"ADRapportLinkConfiguration::connectionOptions"];
  id v6 = +[NSNumber numberWithInteger:self->_enablesProximityTracking];
  [v5 encodeObject:v6 forKey:@"ADRapportLinkConfiguration::enablesProximityTracking"];
}

- (ADRapportLinkConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkConfiguration::discoveryOptions"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkConfiguration::transportOptions"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkConfiguration::connectionOptions"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkConfiguration::enablesProximityTracking"];

  id v9 = [v8 integerValue];
  v10 = [(ADRapportLinkConfiguration *)self initWithDiscoveryOptions:v5 transportOptions:v6 connectionOptions:v7 enablesProximityTracking:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADRapportLinkConfiguration *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id enablesProximityTracking = self->_enablesProximityTracking;
      if (enablesProximityTracking == (id)[(ADRapportLinkConfiguration *)v5 enablesProximityTracking])
      {
        v7 = [(ADRapportLinkConfiguration *)v5 discoveryOptions];
        discoveryOptions = self->_discoveryOptions;
        if (discoveryOptions == v7 || [(ADRapportLinkDiscoveryOptions *)discoveryOptions isEqual:v7])
        {
          id v9 = [(ADRapportLinkConfiguration *)v5 transportOptions];
          transportOptions = self->_transportOptions;
          if (transportOptions == v9 || [(ADRapportLinkTransportOptions *)transportOptions isEqual:v9])
          {
            v11 = [(ADRapportLinkConfiguration *)v5 connectionOptions];
            connectionOptions = self->_connectionOptions;
            BOOL v13 = connectionOptions == v11
               || [(ADRapportLinkConnectionOptions *)connectionOptions isEqual:v11];
          }
          else
          {
            BOOL v13 = 0;
          }
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ADRapportLinkDiscoveryOptions *)self->_discoveryOptions hash];
  unint64_t v4 = [(ADRapportLinkTransportOptions *)self->_transportOptions hash] ^ v3;
  unint64_t v5 = v4 ^ [(ADRapportLinkConnectionOptions *)self->_connectionOptions hash];
  id v6 = +[NSNumber numberWithInteger:self->_enablesProximityTracking];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADRapportLinkConfiguration;
  unint64_t v5 = [(ADRapportLinkConfiguration *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {discoveryOptions = %@, transportOptions = %@, connectionOptions = %@, enablesProximityTracking = %lld}", v5, self->_discoveryOptions, self->_transportOptions, self->_connectionOptions, self->_enablesProximityTracking];

  return v6;
}

- (id)description
{
  return [(ADRapportLinkConfiguration *)self _descriptionWithIndent:0];
}

- (ADRapportLinkConfiguration)initWithDiscoveryOptions:(id)a3 transportOptions:(id)a4 connectionOptions:(id)a5 enablesProximityTracking:(int64_t)a6
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001AD7C0;
  v15[3] = &unk_1005055D0;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  int64_t v19 = a6;
  id v10 = v18;
  id v11 = v17;
  id v12 = v16;
  BOOL v13 = [(ADRapportLinkConfiguration *)self initWithBuilder:v15];

  return v13;
}

- (ADRapportLinkConfiguration)init
{
  return [(ADRapportLinkConfiguration *)self initWithBuilder:0];
}

- (ADRapportLinkConfiguration)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADRapportLinkConfigurationMutation *))a3;
  v18.receiver = self;
  v18.super_class = (Class)ADRapportLinkConfiguration;
  unint64_t v5 = [(ADRapportLinkConfiguration *)&v18 init];
  id v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_ADRapportLinkConfigurationMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADRapportLinkConfigurationMutation *)v7 isDirty])
    {
      objc_super v8 = [(_ADRapportLinkConfigurationMutation *)v7 getDiscoveryOptions];
      id v9 = (ADRapportLinkDiscoveryOptions *)[v8 copy];
      discoveryOptions = v6->_discoveryOptions;
      v6->_discoveryOptions = v9;

      id v11 = [(_ADRapportLinkConfigurationMutation *)v7 getTransportOptions];
      id v12 = (ADRapportLinkTransportOptions *)[v11 copy];
      transportOptions = v6->_transportOptions;
      v6->_transportOptions = v12;

      v14 = [(_ADRapportLinkConfigurationMutation *)v7 getConnectionOptions];
      v15 = (ADRapportLinkConnectionOptions *)[v14 copy];
      connectionOptions = v6->_connectionOptions;
      v6->_connectionOptions = v15;

      v6->_id enablesProximityTracking = [(_ADRapportLinkConfigurationMutation *)v7 getEnablesProximityTracking];
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
  id v4 = (void (**)(id, _ADRapportLinkConfigurationMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_ADRapportLinkConfigurationMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADRapportLinkConfigurationMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADRapportLinkConfiguration);
      unint64_t v7 = [(_ADRapportLinkConfigurationMutation *)v5 getDiscoveryOptions];
      objc_super v8 = (ADRapportLinkDiscoveryOptions *)[v7 copy];
      discoveryOptions = v6->_discoveryOptions;
      v6->_discoveryOptions = v8;

      id v10 = [(_ADRapportLinkConfigurationMutation *)v5 getTransportOptions];
      id v11 = (ADRapportLinkTransportOptions *)[v10 copy];
      transportOptions = v6->_transportOptions;
      v6->_transportOptions = v11;

      BOOL v13 = [(_ADRapportLinkConfigurationMutation *)v5 getConnectionOptions];
      v14 = (ADRapportLinkConnectionOptions *)[v13 copy];
      connectionOptions = v6->_connectionOptions;
      v6->_connectionOptions = v14;

      v6->_id enablesProximityTracking = [(_ADRapportLinkConfigurationMutation *)v5 getEnablesProximityTracking];
    }
    else
    {
      id v6 = (ADRapportLinkConfiguration *)[(ADRapportLinkConfiguration *)self copy];
    }
  }
  else
  {
    id v6 = (ADRapportLinkConfiguration *)[(ADRapportLinkConfiguration *)self copy];
  }

  return v6;
}

@end