@interface ADDeviceSyncCommandPullSnapshotResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotResponse)init;
- (ADDeviceSyncCommandPullSnapshotResponse)initWithBuilder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotResponse)initWithCoder:(id)a3;
- (ADDeviceSyncCommandPullSnapshotResponse)initWithSnapshot:(id)a3;
- (ADDeviceSyncSnapshot)snapshot;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceSyncCommandPullSnapshotResponse

- (void).cxx_destruct
{
}

- (ADDeviceSyncSnapshot)snapshot
{
  return self->_snapshot;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ADDeviceSyncCommandPullSnapshotResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceSyncCommandPullSnapshotResponse::snapshot"];

  v6 = [(ADDeviceSyncCommandPullSnapshotResponse *)self initWithSnapshot:v5];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceSyncCommandPullSnapshotResponse *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(ADDeviceSyncCommandPullSnapshotResponse *)v4 snapshot];
      snapshot = self->_snapshot;
      BOOL v7 = snapshot == v5 || [(ADDeviceSyncSnapshot *)snapshot isEqual:v5];
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
  return [(ADDeviceSyncSnapshot *)self->_snapshot hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceSyncCommandPullSnapshotResponse;
  v5 = [(ADDeviceSyncCommandPullSnapshotResponse *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {snapshot = %@}", v5, self->_snapshot];

  return v6;
}

- (id)description
{
  return [(ADDeviceSyncCommandPullSnapshotResponse *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPullSnapshotResponse)initWithSnapshot:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10028B1E0;
  v7[3] = &unk_1005095A8;
  id v8 = a3;
  id v4 = v8;
  v5 = [(ADDeviceSyncCommandPullSnapshotResponse *)self initWithBuilder:v7];

  return v5;
}

- (ADDeviceSyncCommandPullSnapshotResponse)init
{
  return [(ADDeviceSyncCommandPullSnapshotResponse *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPullSnapshotResponse)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotResponseMutation *))a3;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncCommandPullSnapshotResponse;
  v5 = [(ADDeviceSyncCommandPullSnapshotResponse *)&v12 init];
  id v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = [[_ADDeviceSyncCommandPullSnapshotResponseMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceSyncCommandPullSnapshotResponseMutation *)v7 isDirty])
    {
      id v8 = [(_ADDeviceSyncCommandPullSnapshotResponseMutation *)v7 getSnapshot];
      v9 = (ADDeviceSyncSnapshot *)[v8 copy];
      snapshot = v6->_snapshot;
      v6->_snapshot = v9;
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPullSnapshotResponseMutation *))a3;
  if (v4)
  {
    v5 = [[_ADDeviceSyncCommandPullSnapshotResponseMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPullSnapshotResponseMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceSyncCommandPullSnapshotResponse);
      BOOL v7 = [(_ADDeviceSyncCommandPullSnapshotResponseMutation *)v5 getSnapshot];
      id v8 = (ADDeviceSyncSnapshot *)[v7 copy];
      snapshot = v6->_snapshot;
      v6->_snapshot = v8;
    }
    else
    {
      id v6 = (ADDeviceSyncCommandPullSnapshotResponse *)[(ADDeviceSyncCommandPullSnapshotResponse *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceSyncCommandPullSnapshotResponse *)[(ADDeviceSyncCommandPullSnapshotResponse *)self copy];
  }

  return v6;
}

@end