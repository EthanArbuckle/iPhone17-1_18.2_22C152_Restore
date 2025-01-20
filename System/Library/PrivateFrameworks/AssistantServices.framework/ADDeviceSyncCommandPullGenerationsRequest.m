@interface ADDeviceSyncCommandPullGenerationsRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullGenerationsRequest)init;
- (ADDeviceSyncCommandPullGenerationsRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullGenerationsRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullGenerationsRequest)initWithDataTypes:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)dataTypes;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullGenerationsRequest

- (void).cxx_destruct
{
}

- (NSArray)dataTypes
{
  return self->_dataTypes;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADDeviceSyncCommandPullGenerationsRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ADDeviceSyncCommandPullGenerationsRequest::dataTypes"];

  v8 = [(ADDeviceSyncCommandPullGenerationsRequest *)self initWithDataTypes:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullGenerationsRequest *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ADDeviceSyncCommandPullGenerationsRequest *)v4 dataTypes];
      dataTypes = self->_dataTypes;
      BOOL v7 = dataTypes == v5 || [(NSArray *)dataTypes isEqual:v5];
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
  return (unint64_t)[(NSArray *)self->_dataTypes hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncCommandPullGenerationsRequest;
  uint64_t v5 = [(ADDeviceSyncCommandPullGenerationsRequest *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {dataTypes = %@}", v5, self->_dataTypes];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncCommandPullGenerationsRequest *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPullGenerationsRequest)initWithDataTypes:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000B1884;
  v7[3] = &unk_100500B68;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = [(ADDeviceSyncCommandPullGenerationsRequest *)self initWithBuilder:v7];

  return v5;
}

- (ADDeviceSyncCommandPullGenerationsRequest)init
{
  return [(ADDeviceSyncCommandPullGenerationsRequest *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPullGenerationsRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullGenerationsRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncCommandPullGenerationsRequest;
  uint64_t v5 = [(ADDeviceSyncCommandPullGenerationsRequest *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADDeviceSyncCommandPullGenerationsRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncCommandPullGenerationsRequestMutation *)v7 isDirty])
    {
      id v8 = [(_ADDeviceSyncCommandPullGenerationsRequestMutation *)v7 getDataTypes];
      v9 = (NSArray *)[v8 copy];
      dataTypes = v6->_dataTypes;
      v6->_dataTypes = v9;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullGenerationsRequestMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_ADDeviceSyncCommandPullGenerationsRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPullGenerationsRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncCommandPullGenerationsRequest);
      BOOL v7 = [(_ADDeviceSyncCommandPullGenerationsRequestMutation *)v5 getDataTypes];
      id v8 = (NSArray *)[v7 copy];
      dataTypes = v6->_dataTypes;
      v6->_dataTypes = v8;
    }
    else
    {
      id v6 = (ADDeviceSyncCommandPullGenerationsRequest *)[(ADDeviceSyncCommandPullGenerationsRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncCommandPullGenerationsRequest *)[(ADDeviceSyncCommandPullGenerationsRequest *)self copy];
  }

  return v6;
}

@end