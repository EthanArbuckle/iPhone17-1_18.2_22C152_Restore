@interface ADDeviceSyncCommandPushGenerationsResponse
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceSyncCommandPushGenerationsResponse)init;
- (ADDeviceSyncCommandPushGenerationsResponse)initWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
@end

@implementation ADDeviceSyncCommandPushGenerationsResponse

- (BOOL)isEqual:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ADDeviceSyncCommandPushGenerationsResponse;
  return [(ADDeviceSyncCommandPushGenerationsResponse *)&v4 isEqual:a3];
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)ADDeviceSyncCommandPushGenerationsResponse;
  return [(ADDeviceSyncCommandPushGenerationsResponse *)&v3 hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ADDeviceSyncCommandPushGenerationsResponse;
  objc_super v3 = [(ADDeviceSyncCommandPushGenerationsResponse *)&v5 description];
  return v3;
}

- (id)description
{
  return [(ADDeviceSyncCommandPushGenerationsResponse *)self _descriptionWithIndent:0];
}

- (ADDeviceSyncCommandPushGenerationsResponse)init
{
  return [(ADDeviceSyncCommandPushGenerationsResponse *)self initWithBuilder:0];
}

- (ADDeviceSyncCommandPushGenerationsResponse)initWithBuilder:(id)a3
{
  objc_super v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsResponseMutation *))a3;
  v9.receiver = self;
  v9.super_class = (Class)ADDeviceSyncCommandPushGenerationsResponse;
  objc_super v5 = [(ADDeviceSyncCommandPushGenerationsResponse *)&v9 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = [[_ADDeviceSyncCommandPushGenerationsResponseMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    [(_ADDeviceSyncCommandPushGenerationsResponseMutation *)v7 isDirty];
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
  id v4 = (void (**)(id, _ADDeviceSyncCommandPushGenerationsResponseMutation *))a3;
  if (v4)
  {
    objc_super v5 = [[_ADDeviceSyncCommandPushGenerationsResponseMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceSyncCommandPushGenerationsResponseMutation *)v5 isDirty]) {
      v6 = objc_alloc_init(ADDeviceSyncCommandPushGenerationsResponse);
    }
    else {
      v6 = (ADDeviceSyncCommandPushGenerationsResponse *)[(ADDeviceSyncCommandPushGenerationsResponse *)self copy];
    }
    v7 = v6;
  }
  else
  {
    v7 = (ADDeviceSyncCommandPushGenerationsResponse *)[(ADDeviceSyncCommandPushGenerationsResponse *)self copy];
  }

  return v7;
}

@end