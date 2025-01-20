@interface ADDeviceSyncCommandPullDeltaRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)init;
- (ADDeviceSyncCommandPullDeltaRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullDeltaRequest)initWithDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)dataType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)generation;
- (unint64_t)hash;
- (unint64_t)limit;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullDeltaRequest

- (void).cxx_destruct
{
}

- (unint64_t)limit
{
  return self->_limit;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (NSString)dataType
{
  return self->_dataType;
}

- (void)encodeWithCoder:(id)a3
{
  dataType = self->_dataType;
  id v5 = a3;
  [v5 encodeObject:dataType forKey:@"ADDeviceSyncCommandPullDeltaRequest::dataType"];
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_generation];
  [v5 encodeObject:v6 forKey:@"ADDeviceSyncCommandPullDeltaRequest::generation"];

  id v7 = +[NSNumber numberWithUnsignedLongLong:self->_limit];
  [v5 encodeObject:v7 forKey:@"ADDeviceSyncCommandPullDeltaRequest::limit"];
}

- (ADDeviceSyncCommandPullDeltaRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncCommandPullDeltaRequest::dataType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncCommandPullDeltaRequest::generation"];
  id v7 = [v6 unsignedLongLongValue];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncCommandPullDeltaRequest::limit"];

  id v9 = [v8 unsignedLongLongValue];
  v10 = [(ADDeviceSyncCommandPullDeltaRequest *)self initWithDataType:v5 generation:v7 limit:v9];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullDeltaRequest *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id generation = self->_generation;
      if (generation == (id)[(ADDeviceSyncCommandPullDeltaRequest *)v5 generation]
        && (id limit = self->_limit, limit == (id)[(ADDeviceSyncCommandPullDeltaRequest *)v5 limit]))
      {
        v8 = [(ADDeviceSyncCommandPullDeltaRequest *)v5 dataType];
        dataType = self->_dataType;
        BOOL v10 = dataType == v8 || [(NSString *)dataType isEqual:v8];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_dataType hash];
  id v4 = +[NSNumber numberWithUnsignedLongLong:self->_generation];
  unint64_t v5 = (unint64_t)[v4 hash] ^ v3;
  v6 = +[NSNumber numberWithUnsignedLongLong:self->_limit];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncCommandPullDeltaRequest;
  unint64_t v5 = [(ADDeviceSyncCommandPullDeltaRequest *)&v8 description];
  v6 = [v4 initWithFormat:@"%@ {dataType = %@, id generation = %llu, limit = %llu}", v5, self->_dataType, self->_generation, self->_limit];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncCommandPullDeltaRequest *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPullDeltaRequest)initWithDataType:(id)a3 generation:(unint64_t)a4 limit:(unint64_t)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100366990;
  v11[3] = &unk_10050E0A0;
  id v12 = a3;
  unint64_t v13 = a4;
  unint64_t v14 = a5;
  id v8 = v12;
  id v9 = [(ADDeviceSyncCommandPullDeltaRequest *)self initWithBuilder:v11];

  return v9;
}

- (ADDeviceSyncCommandPullDeltaRequest)init
{
  return [(ADDeviceSyncCommandPullDeltaRequest *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPullDeltaRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncCommandPullDeltaRequest;
  unint64_t v5 = [(ADDeviceSyncCommandPullDeltaRequest *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    unint64_t v7 = [[_ADDeviceSyncCommandPullDeltaRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncCommandPullDeltaRequestMutation *)v7 isDirty])
    {
      id v8 = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)v7 getDataType];
      id v9 = (NSString *)[v8 copy];
      dataType = v6->_dataType;
      v6->_dataType = v9;

      v6->_id generation = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)v7 getGeneration];
      v6->_id limit = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)v7 getLimit];
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaRequestMutation *))a3;
  if (v4)
  {
    unint64_t v5 = [[_ADDeviceSyncCommandPullDeltaRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPullDeltaRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncCommandPullDeltaRequest);
      unint64_t v7 = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)v5 getDataType];
      id v8 = (NSString *)[v7 copy];
      dataType = v6->_dataType;
      v6->_dataType = v8;

      v6->_id generation = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)v5 getGeneration];
      v6->_id limit = [(_ADDeviceSyncCommandPullDeltaRequestMutation *)v5 getLimit];
    }
    else
    {
      id v6 = (ADDeviceSyncCommandPullDeltaRequest *)[(ADDeviceSyncCommandPullDeltaRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncCommandPullDeltaRequest *)[(ADDeviceSyncCommandPullDeltaRequest *)self copy];
  }

  return v6;
}

@end