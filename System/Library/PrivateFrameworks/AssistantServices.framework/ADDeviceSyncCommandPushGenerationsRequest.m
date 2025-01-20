@interface ADDeviceSyncCommandPushGenerationsRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsRequest)init;
- (ADDeviceSyncCommandPushGenerationsRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsRequest)initWithGenerationsByDataType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)generationsByDataType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPushGenerationsRequest

- (void).cxx_destruct
{
}

- (NSDictionary)generationsByDataType
{
  return self->_generationsByDataType;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADDeviceSyncCommandPushGenerationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"ADDeviceSyncCommandPushGenerationsRequest::generationsByDataType"];

  v9 = [(ADDeviceSyncCommandPushGenerationsRequest *)self initWithGenerationsByDataType:v8];
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPushGenerationsRequest *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ADDeviceSyncCommandPushGenerationsRequest *)v4 generationsByDataType];
      generationsByDataType = self->_generationsByDataType;
      BOOL v7 = generationsByDataType == v5 || [(NSDictionary *)generationsByDataType isEqual:v5];
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
  return (unint64_t)[(NSDictionary *)self->_generationsByDataType hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncCommandPushGenerationsRequest;
  uint64_t v5 = [(ADDeviceSyncCommandPushGenerationsRequest *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {generationsByDataType = %@}", v5, self->_generationsByDataType];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncCommandPushGenerationsRequest *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPushGenerationsRequest)initWithGenerationsByDataType:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002118CC;
  v7[3] = &unk_100506F08;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = [(ADDeviceSyncCommandPushGenerationsRequest *)self initWithBuilder:v7];

  return v5;
}

- (ADDeviceSyncCommandPushGenerationsRequest)init
{
  return [(ADDeviceSyncCommandPushGenerationsRequest *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPushGenerationsRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncCommandPushGenerationsRequest;
  uint64_t v5 = [(ADDeviceSyncCommandPushGenerationsRequest *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADDeviceSyncCommandPushGenerationsRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncCommandPushGenerationsRequestMutation *)v7 isDirty])
    {
      id v8 = [(_ADDeviceSyncCommandPushGenerationsRequestMutation *)v7 getGenerationsByDataType];
      v9 = (NSDictionary *)[v8 copy];
      generationsByDataType = v6->_generationsByDataType;
      v6->_generationsByDataType = v9;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsRequestMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_ADDeviceSyncCommandPushGenerationsRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPushGenerationsRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncCommandPushGenerationsRequest);
      BOOL v7 = [(_ADDeviceSyncCommandPushGenerationsRequestMutation *)v5 getGenerationsByDataType];
      id v8 = (NSDictionary *)[v7 copy];
      generationsByDataType = v6->_generationsByDataType;
      v6->_generationsByDataType = v8;
    }
    else
    {
      id v6 = (ADDeviceSyncCommandPushGenerationsRequest *)[(ADDeviceSyncCommandPushGenerationsRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncCommandPushGenerationsRequest *)[(ADDeviceSyncCommandPushGenerationsRequest *)self copy];
  }

  return v6;
}

@end