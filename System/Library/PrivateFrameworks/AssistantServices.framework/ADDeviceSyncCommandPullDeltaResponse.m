@interface ADDeviceSyncCommandPullDeltaResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaResponse)init;
- (ADDeviceSyncCommandPullDeltaResponse)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullDeltaResponse)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullDeltaResponse)initWithIncrementalChanges:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)incrementalChanges;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullDeltaResponse

- (void).cxx_destruct
{
}

- (NSArray)incrementalChanges
{
  return self->_incrementalChanges;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADDeviceSyncCommandPullDeltaResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"ADDeviceSyncCommandPullDeltaResponse::incrementalChanges"];

  v8 = [(ADDeviceSyncCommandPullDeltaResponse *)self initWithIncrementalChanges:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullDeltaResponse *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(ADDeviceSyncCommandPullDeltaResponse *)v4 incrementalChanges];
      incrementalChanges = self->_incrementalChanges;
      BOOL v7 = incrementalChanges == v5 || [(NSArray *)incrementalChanges isEqual:v5];
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
  return (unint64_t)[(NSArray *)self->_incrementalChanges hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncCommandPullDeltaResponse;
  uint64_t v5 = [(ADDeviceSyncCommandPullDeltaResponse *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {incrementalChanges = %@}", v5, self->_incrementalChanges];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncCommandPullDeltaResponse *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPullDeltaResponse)initWithIncrementalChanges:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BA150;
  v7[3] = &unk_100500CE8;
  id v8 = a3;
  id v4 = v8;
  uint64_t v5 = [(ADDeviceSyncCommandPullDeltaResponse *)self initWithBuilder:v7];

  return v5;
}

- (ADDeviceSyncCommandPullDeltaResponse)init
{
  return [(ADDeviceSyncCommandPullDeltaResponse *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPullDeltaResponse)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaResponseMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncCommandPullDeltaResponse;
  uint64_t v5 = [(ADDeviceSyncCommandPullDeltaResponse *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADDeviceSyncCommandPullDeltaResponseMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncCommandPullDeltaResponseMutation *)v7 isDirty])
    {
      id v8 = [(_ADDeviceSyncCommandPullDeltaResponseMutation *)v7 getIncrementalChanges];
      v9 = (NSArray *)[v8 copy];
      incrementalChanges = v6->_incrementalChanges;
      v6->_incrementalChanges = v9;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullDeltaResponseMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_ADDeviceSyncCommandPullDeltaResponseMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPullDeltaResponseMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncCommandPullDeltaResponse);
      BOOL v7 = [(_ADDeviceSyncCommandPullDeltaResponseMutation *)v5 getIncrementalChanges];
      id v8 = (NSArray *)[v7 copy];
      incrementalChanges = v6->_incrementalChanges;
      v6->_incrementalChanges = v8;
    }
    else
    {
      id v6 = (ADDeviceSyncCommandPullDeltaResponse *)[(ADDeviceSyncCommandPullDeltaResponse *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncCommandPullDeltaResponse *)[(ADDeviceSyncCommandPullDeltaResponse *)self copy];
  }

  return v6;
}

@end