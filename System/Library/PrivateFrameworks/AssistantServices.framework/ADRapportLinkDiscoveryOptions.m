@interface ADRapportLinkDiscoveryOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkDiscoveryOptions)init;
- (ADRapportLinkDiscoveryOptions)initWithBuilder:(id)a3;
- (ADRapportLinkDiscoveryOptions)initWithCoder:(id)a3;
- (ADRapportLinkDiscoveryOptions)initWithIncludesFamily:(int64_t)a3 includesHome:(int64_t)a4 includesRemoraDevices:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)includesFamily;
- (int64_t)includesHome;
- (int64_t)includesRemoraDevices;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkDiscoveryOptions

- (int64_t)includesRemoraDevices
{
  return self->_includesRemoraDevices;
}

- (int64_t)includesHome
{
  return self->_includesHome;
}

- (int64_t)includesFamily
{
  return self->_includesFamily;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t includesFamily = self->_includesFamily;
  id v5 = a3;
  v6 = +[NSNumber numberWithInteger:includesFamily];
  [v5 encodeObject:v6 forKey:@"ADRapportLinkDiscoveryOptions::includesFamily"];

  v7 = +[NSNumber numberWithInteger:self->_includesHome];
  [v5 encodeObject:v7 forKey:@"ADRapportLinkDiscoveryOptions::includesHome"];

  id v8 = +[NSNumber numberWithInteger:self->_includesRemoraDevices];
  [v5 encodeObject:v8 forKey:@"ADRapportLinkDiscoveryOptions::includesRemoraDevices"];
}

- (ADRapportLinkDiscoveryOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkDiscoveryOptions::includesFamily"];
  id v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkDiscoveryOptions::includesHome"];
  id v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkDiscoveryOptions::includesRemoraDevices"];

  id v10 = [v9 integerValue];
  return [(ADRapportLinkDiscoveryOptions *)self initWithIncludesFamily:v6 includesHome:v8 includesRemoraDevices:v10];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADRapportLinkDiscoveryOptions *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id includesFamily = self->_includesFamily;
      if (includesFamily == (id)[(ADRapportLinkDiscoveryOptions *)v5 includesFamily]
        && (id includesHome = self->_includesHome,
            includesHome == (id)[(ADRapportLinkDiscoveryOptions *)v5 includesHome]))
      {
        id includesRemoraDevices = self->_includesRemoraDevices;
        BOOL v9 = includesRemoraDevices == (id)[(ADRapportLinkDiscoveryOptions *)v5 includesRemoraDevices];
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = +[NSNumber numberWithInteger:self->_includesFamily];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = +[NSNumber numberWithInteger:self->_includesHome];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = +[NSNumber numberWithInteger:self->_includesRemoraDevices];
  unint64_t v8 = v6 ^ (unint64_t)[v7 hash];

  return v8;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADRapportLinkDiscoveryOptions;
  id v5 = [(ADRapportLinkDiscoveryOptions *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {id includesFamily = %lld, includesHome = %lld, includesRemoraDevices = %lld}", v5, self->_includesFamily, self->_includesHome, self->_includesRemoraDevices];

  return v6;
}

- (id)description
{
  return [(ADRapportLinkDiscoveryOptions *)self _descriptionWithIndent:0];
}

- (ADRapportLinkDiscoveryOptions)initWithIncludesFamily:(int64_t)a3 includesHome:(int64_t)a4 includesRemoraDevices:(int64_t)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100119444;
  v6[3] = &unk_100502800;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = a5;
  return [(ADRapportLinkDiscoveryOptions *)self initWithBuilder:v6];
}

- (ADRapportLinkDiscoveryOptions)init
{
  return [(ADRapportLinkDiscoveryOptions *)self initWithBuilder:0];
}

- (ADRapportLinkDiscoveryOptions)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADRapportLinkDiscoveryOptionsMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)ADRapportLinkDiscoveryOptions;
  id v5 = [(ADRapportLinkDiscoveryOptions *)&v9 init];
  id v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADRapportLinkDiscoveryOptionsMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADRapportLinkDiscoveryOptionsMutation *)v7 isDirty])
    {
      v6->_id includesFamily = [(_ADRapportLinkDiscoveryOptionsMutation *)v7 getIncludesFamily];
      v6->_id includesHome = [(_ADRapportLinkDiscoveryOptionsMutation *)v7 getIncludesHome];
      v6->_id includesRemoraDevices = [(_ADRapportLinkDiscoveryOptionsMutation *)v7 getIncludesRemoraDevices];
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
  id v4 = (void (**)(id, _ADRapportLinkDiscoveryOptionsMutation *))a3;
  if (v4)
  {
    id v5 = [[_ADRapportLinkDiscoveryOptionsMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADRapportLinkDiscoveryOptionsMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADRapportLinkDiscoveryOptions);
      v6->_id includesFamily = [(_ADRapportLinkDiscoveryOptionsMutation *)v5 getIncludesFamily];
      v6->_id includesHome = [(_ADRapportLinkDiscoveryOptionsMutation *)v5 getIncludesHome];
      v6->_id includesRemoraDevices = [(_ADRapportLinkDiscoveryOptionsMutation *)v5 getIncludesRemoraDevices];
    }
    else
    {
      id v6 = (ADRapportLinkDiscoveryOptions *)[(ADRapportLinkDiscoveryOptions *)self copy];
    }
  }
  else
  {
    id v6 = (ADRapportLinkDiscoveryOptions *)[(ADRapportLinkDiscoveryOptions *)self copy];
  }

  return v6;
}

@end