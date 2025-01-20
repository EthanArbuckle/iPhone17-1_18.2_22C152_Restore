@interface ADDeviceSyncCommandPullSnapshotRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotRequest)init;
- (ADDeviceSyncCommandPullSnapshotRequest)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotRequest)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotRequest)initWithDataType:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)dataType;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullSnapshotRequest

- (void).cxx_destruct
{
}

- (NSString)dataType
{
  return self->_dataType;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADDeviceSyncCommandPullSnapshotRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncCommandPullSnapshotRequest::dataType"];

  v6 = [(ADDeviceSyncCommandPullSnapshotRequest *)self initWithDataType:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullSnapshotRequest *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(ADDeviceSyncCommandPullSnapshotRequest *)v4 dataType];
      dataType = self->_dataType;
      BOOL v7 = dataType == v5 || [(NSString *)dataType isEqual:v5];
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
  return [(NSString *)self->_dataType hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncCommandPullSnapshotRequest;
  v5 = [(ADDeviceSyncCommandPullSnapshotRequest *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {dataType = %@}", v5, self->_dataType];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncCommandPullSnapshotRequest *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPullSnapshotRequest)initWithDataType:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10007128C;
  v7[3] = &unk_1004FFB68;
  id v8 = a3;
  id v4 = v8;
  v5 = [(ADDeviceSyncCommandPullSnapshotRequest *)self initWithBuilder:v7];

  return v5;
}

- (ADDeviceSyncCommandPullSnapshotRequest)init
{
  return [(ADDeviceSyncCommandPullSnapshotRequest *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPullSnapshotRequest)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotRequestMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncCommandPullSnapshotRequest;
  v5 = [(ADDeviceSyncCommandPullSnapshotRequest *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADDeviceSyncCommandPullSnapshotRequestMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncCommandPullSnapshotRequestMutation *)v7 isDirty])
    {
      id v8 = [(_ADDeviceSyncCommandPullSnapshotRequestMutation *)v7 getDataType];
      v9 = (NSString *)[v8 copy];
      dataType = v6->_dataType;
      v6->_dataType = v9;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotRequestMutation *))a3;
  if (v4)
  {
    v5 = [[_ADDeviceSyncCommandPullSnapshotRequestMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPullSnapshotRequestMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncCommandPullSnapshotRequest);
      BOOL v7 = [(_ADDeviceSyncCommandPullSnapshotRequestMutation *)v5 getDataType];
      id v8 = (NSString *)[v7 copy];
      dataType = v6->_dataType;
      v6->_dataType = v8;
    }
    else
    {
      id v6 = (ADDeviceSyncCommandPullSnapshotRequest *)[(ADDeviceSyncCommandPullSnapshotRequest *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncCommandPullSnapshotRequest *)[(ADDeviceSyncCommandPullSnapshotRequest *)self copy];
  }

  return v6;
}

@end