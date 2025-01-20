@interface ADRapportLinkConnectionOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkConnectionOptions)init;
- (ADRapportLinkConnectionOptions)initWithBuilder:(id)a3;
- (ADRapportLinkConnectionOptions)initWithCoder:(id)a3;
- (ADRapportLinkConnectionOptions)initWithUsesOnDemandConnection:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)usesOnDemandConnection;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkConnectionOptions

- (int64_t)usesOnDemandConnection
{
  return self->_usesOnDemandConnection;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t usesOnDemandConnection = self->_usesOnDemandConnection;
  id v4 = a3;
  id v5 = +[NSNumber numberWithInteger:usesOnDemandConnection];
  [v4 encodeObject:v5 forKey:@"ADRapportLinkConnectionOptions::usesOnDemandConnection"];
}

- (ADRapportLinkConnectionOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkConnectionOptions::usesOnDemandConnection"];

  id v6 = [v5 integerValue];
  return [(ADRapportLinkConnectionOptions *)self initWithUsesOnDemandConnection:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADRapportLinkConnectionOptions *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id usesOnDemandConnection = self->_usesOnDemandConnection;
      BOOL v6 = usesOnDemandConnection == (id)[(ADRapportLinkConnectionOptions *)v4 usesOnDemandConnection];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithInteger:self->_usesOnDemandConnection];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADRapportLinkConnectionOptions;
  id v5 = [(ADRapportLinkConnectionOptions *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {id usesOnDemandConnection = %lld}", v5, self->_usesOnDemandConnection];

  return v6;
}

- (id)description
{
  return [(ADRapportLinkConnectionOptions *)self _descriptionWithIndent:0];
}

- (ADRapportLinkConnectionOptions)initWithUsesOnDemandConnection:(int64_t)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100271E80;
  v4[3] = &unk_1005085B8;
  v4[4] = a3;
  return [(ADRapportLinkConnectionOptions *)self initWithBuilder:v4];
}

- (ADRapportLinkConnectionOptions)init
{
  return [(ADRapportLinkConnectionOptions *)self initWithBuilder:0];
}

- (ADRapportLinkConnectionOptions)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADRapportLinkConnectionOptionsMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)ADRapportLinkConnectionOptions;
  id v5 = [(ADRapportLinkConnectionOptions *)&v9 init];
  id v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADRapportLinkConnectionOptionsMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADRapportLinkConnectionOptionsMutation *)v7 isDirty]) {
      v6->_id usesOnDemandConnection = [(_ADRapportLinkConnectionOptionsMutation *)v7 getUsesOnDemandConnection];
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
  id v4 = (void (**)(id, _ADRapportLinkConnectionOptionsMutation *))a3;
  if (v4)
  {
    id v5 = [[_ADRapportLinkConnectionOptionsMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADRapportLinkConnectionOptionsMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADRapportLinkConnectionOptions);
      v6->_id usesOnDemandConnection = [(_ADRapportLinkConnectionOptionsMutation *)v5 getUsesOnDemandConnection];
    }
    else
    {
      id v6 = (ADRapportLinkConnectionOptions *)[(ADRapportLinkConnectionOptions *)self copy];
    }
  }
  else
  {
    id v6 = (ADRapportLinkConnectionOptions *)[(ADRapportLinkConnectionOptions *)self copy];
  }

  return v6;
}

@end