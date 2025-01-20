@interface ADRapportLinkTransportOptions
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADRapportLinkTransportOptions)init;
- (ADRapportLinkTransportOptions)initWithAllowsAWDL:(int64_t)a3 allowsBLE:(int64_t)a4 allowsInfraWiFi:(int64_t)a5 allowsBTPipe:(int64_t)a6 allowsForceBLE:(int64_t)a7 allowsForceAWDL:(int64_t)a8 noL2Cap:(int64_t)a9;
- (ADRapportLinkTransportOptions)initWithBuilder:(id)a3;
- (ADRapportLinkTransportOptions)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)allowsAWDL;
- (int64_t)allowsBLE;
- (int64_t)allowsBTPipe;
- (int64_t)allowsForceAWDL;
- (int64_t)allowsForceBLE;
- (int64_t)allowsInfraWiFi;
- (int64_t)noL2Cap;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADRapportLinkTransportOptions

- (int64_t)noL2Cap
{
  return self->_noL2Cap;
}

- (int64_t)allowsForceAWDL
{
  return self->_allowsForceAWDL;
}

- (int64_t)allowsForceBLE
{
  return self->_allowsForceBLE;
}

- (int64_t)allowsBTPipe
{
  return self->_allowsBTPipe;
}

- (int64_t)allowsInfraWiFi
{
  return self->_allowsInfraWiFi;
}

- (int64_t)allowsBLE
{
  return self->_allowsBLE;
}

- (int64_t)allowsAWDL
{
  return self->_allowsAWDL;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t allowsAWDL = self->_allowsAWDL;
  id v5 = a3;
  v6 = +[NSNumber numberWithInteger:allowsAWDL];
  [v5 encodeObject:v6 forKey:@"ADRapportLinkTransportOptions::allowsAWDL"];

  v7 = +[NSNumber numberWithInteger:self->_allowsBLE];
  [v5 encodeObject:v7 forKey:@"ADRapportLinkTransportOptions::allowsBLE"];

  v8 = +[NSNumber numberWithInteger:self->_allowsInfraWiFi];
  [v5 encodeObject:v8 forKey:@"ADRapportLinkTransportOptions::allowsInfraWiFi"];

  v9 = +[NSNumber numberWithInteger:self->_allowsBTPipe];
  [v5 encodeObject:v9 forKey:@"ADRapportLinkTransportOptions::allowsBTPipe"];

  v10 = +[NSNumber numberWithInteger:self->_allowsForceBLE];
  [v5 encodeObject:v10 forKey:@"ADRapportLinkTransportOptions::allowsForceBLE"];

  v11 = +[NSNumber numberWithInteger:self->_allowsForceAWDL];
  [v5 encodeObject:v11 forKey:@"ADRapportLinkTransportOptions::allowsForceAWDL"];

  id v12 = +[NSNumber numberWithInteger:self->_noL2Cap];
  [v5 encodeObject:v12 forKey:@"ADRapportLinkTransportOptions::noL2Cap"];
}

- (ADRapportLinkTransportOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::allowsAWDL"];
  id v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::allowsBLE"];
  id v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::allowsInfraWiFi"];
  id v10 = [v9 integerValue];

  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::allowsBTPipe"];
  id v12 = [v11 integerValue];

  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::allowsForceBLE"];
  id v14 = [v13 integerValue];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::allowsForceAWDL"];
  id v16 = [v15 integerValue];

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADRapportLinkTransportOptions::noL2Cap"];

  id v18 = [v17 integerValue];
  return [(ADRapportLinkTransportOptions *)self initWithAllowsAWDL:v6 allowsBLE:v8 allowsInfraWiFi:v10 allowsBTPipe:v12 allowsForceBLE:v14 allowsForceAWDL:v16 noL2Cap:v18];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADRapportLinkTransportOptions *)a3;
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
      id allowsAWDL = self->_allowsAWDL;
      if (allowsAWDL == (id)[(ADRapportLinkTransportOptions *)v5 allowsAWDL]
        && (id allowsBLE = self->_allowsBLE,
            allowsBLE == (id)[(ADRapportLinkTransportOptions *)v5 allowsBLE])
        && (id allowsInfraWiFi = self->_allowsInfraWiFi,
            allowsInfraWiFi == (id)[(ADRapportLinkTransportOptions *)v5 allowsInfraWiFi])
        && (id allowsBTPipe = self->_allowsBTPipe,
            allowsBTPipe == (id)[(ADRapportLinkTransportOptions *)v5 allowsBTPipe])
        && (id allowsForceBLE = self->_allowsForceBLE,
            allowsForceBLE == (id)[(ADRapportLinkTransportOptions *)v5 allowsForceBLE])
        && (id allowsForceAWDL = self->_allowsForceAWDL,
            allowsForceAWDL == (id)[(ADRapportLinkTransportOptions *)v5 allowsForceAWDL]))
      {
        id noL2Cap = self->_noL2Cap;
        BOOL v13 = noL2Cap == (id)[(ADRapportLinkTransportOptions *)v5 noL2Cap];
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
  v3 = +[NSNumber numberWithInteger:self->_allowsAWDL];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = +[NSNumber numberWithInteger:self->_allowsBLE];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;
  v7 = +[NSNumber numberWithInteger:self->_allowsInfraWiFi];
  unint64_t v8 = (unint64_t)[v7 hash];
  v9 = +[NSNumber numberWithInteger:self->_allowsBTPipe];
  unint64_t v10 = v6 ^ v8 ^ (unint64_t)[v9 hash];
  v11 = +[NSNumber numberWithInteger:self->_allowsForceBLE];
  unint64_t v12 = (unint64_t)[v11 hash];
  BOOL v13 = +[NSNumber numberWithInteger:self->_allowsForceAWDL];
  unint64_t v14 = v12 ^ (unint64_t)[v13 hash];
  v15 = +[NSNumber numberWithInteger:self->_noL2Cap];
  unint64_t v16 = v10 ^ v14 ^ (unint64_t)[v15 hash];

  return v16;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADRapportLinkTransportOptions;
  id v5 = [(ADRapportLinkTransportOptions *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {id allowsAWDL = %lld, allowsBLE = %lld, allowsInfraWiFi = %lld, allowsBTPipe = %lld, allowsForceBLE = %lld, allowsForceAWDL = %lld, noL2Cap = %lld}", v5, self->_allowsAWDL, self->_allowsBLE, self->_allowsInfraWiFi, self->_allowsBTPipe, self->_allowsForceBLE, self->_allowsForceAWDL, self->_noL2Cap];

  return v6;
}

- (id)description
{
  return [(ADRapportLinkTransportOptions *)self _descriptionWithIndent:0];
}

- (ADRapportLinkTransportOptions)initWithAllowsAWDL:(int64_t)a3 allowsBLE:(int64_t)a4 allowsInfraWiFi:(int64_t)a5 allowsBTPipe:(int64_t)a6 allowsForceBLE:(int64_t)a7 allowsForceAWDL:(int64_t)a8 noL2Cap:(int64_t)a9
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004F810;
  v10[3] = &unk_1004FF198;
  v10[4] = a3;
  v10[5] = a4;
  v10[6] = a5;
  v10[7] = a6;
  v10[8] = a7;
  v10[9] = a8;
  v10[10] = a9;
  return [(ADRapportLinkTransportOptions *)self initWithBuilder:v10];
}

- (ADRapportLinkTransportOptions)init
{
  return [(ADRapportLinkTransportOptions *)self initWithBuilder:0];
}

- (ADRapportLinkTransportOptions)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADRapportLinkTransportOptionsMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)ADRapportLinkTransportOptions;
  id v5 = [(ADRapportLinkTransportOptions *)&v9 init];
  id v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADRapportLinkTransportOptionsMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADRapportLinkTransportOptionsMutation *)v7 isDirty])
    {
      v6->_id allowsAWDL = [(_ADRapportLinkTransportOptionsMutation *)v7 getAllowsAWDL];
      v6->_id allowsBLE = [(_ADRapportLinkTransportOptionsMutation *)v7 getAllowsBLE];
      v6->_id allowsInfraWiFi = [(_ADRapportLinkTransportOptionsMutation *)v7 getAllowsInfraWiFi];
      v6->_id allowsBTPipe = [(_ADRapportLinkTransportOptionsMutation *)v7 getAllowsBTPipe];
      v6->_id allowsForceBLE = [(_ADRapportLinkTransportOptionsMutation *)v7 getAllowsForceBLE];
      v6->_id allowsForceAWDL = [(_ADRapportLinkTransportOptionsMutation *)v7 getAllowsForceAWDL];
      v6->_id noL2Cap = [(_ADRapportLinkTransportOptionsMutation *)v7 getNoL2Cap];
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
  id v4 = (void (**)(id, _ADRapportLinkTransportOptionsMutation *))a3;
  if (v4)
  {
    id v5 = [[_ADRapportLinkTransportOptionsMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADRapportLinkTransportOptionsMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADRapportLinkTransportOptions);
      v6->_id allowsAWDL = [(_ADRapportLinkTransportOptionsMutation *)v5 getAllowsAWDL];
      v6->_id allowsBLE = [(_ADRapportLinkTransportOptionsMutation *)v5 getAllowsBLE];
      v6->_id allowsInfraWiFi = [(_ADRapportLinkTransportOptionsMutation *)v5 getAllowsInfraWiFi];
      v6->_id allowsBTPipe = [(_ADRapportLinkTransportOptionsMutation *)v5 getAllowsBTPipe];
      v6->_id allowsForceBLE = [(_ADRapportLinkTransportOptionsMutation *)v5 getAllowsForceBLE];
      v6->_id allowsForceAWDL = [(_ADRapportLinkTransportOptionsMutation *)v5 getAllowsForceAWDL];
      v6->_id noL2Cap = [(_ADRapportLinkTransportOptionsMutation *)v5 getNoL2Cap];
    }
    else
    {
      id v6 = (ADRapportLinkTransportOptions *)[(ADRapportLinkTransportOptions *)self copy];
    }
  }
  else
  {
    id v6 = (ADRapportLinkTransportOptions *)[(ADRapportLinkTransportOptions *)self copy];
  }

  return v6;
}

@end