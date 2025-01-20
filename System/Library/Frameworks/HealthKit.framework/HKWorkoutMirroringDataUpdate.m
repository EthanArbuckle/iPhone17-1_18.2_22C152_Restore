@interface HKWorkoutMirroringDataUpdate
- (HKWorkoutMirroringDataUpdate)initWithData:(id)a3 completion:(id)a4;
- (NSData)data;
- (NSUUID)UUID;
- (id)completionHandler;
@end

@implementation HKWorkoutMirroringDataUpdate

- (HKWorkoutMirroringDataUpdate)initWithData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKWorkoutMirroringDataUpdate;
  v8 = [(HKWorkoutMirroringDataUpdate *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    UUID = v8->_UUID;
    v8->_UUID = (NSUUID *)v9;

    uint64_t v11 = [v6 copy];
    data = v8->_data;
    v8->_data = (NSData *)v11;

    uint64_t v13 = [v7 copy];
    id completionHandler = v8->_completionHandler;
    v8->_id completionHandler = (id)v13;
  }
  return v8;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (NSData)data
{
  return self->_data;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end