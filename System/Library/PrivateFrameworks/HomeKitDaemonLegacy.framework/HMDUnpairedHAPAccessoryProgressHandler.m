@interface HMDUnpairedHAPAccessoryProgressHandler
- (HMDUnpairedHAPAccessoryProgressHandler)initWithAccessoryUUID:(id)a3 progressHandler:(id)a4;
- (NSUUID)accessoryUUID;
- (id)progressHandler;
- (void)setAccessoryUUID:(id)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation HMDUnpairedHAPAccessoryProgressHandler

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setAccessoryUUID:(id)a3
{
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (HMDUnpairedHAPAccessoryProgressHandler)initWithAccessoryUUID:(id)a3 progressHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDUnpairedHAPAccessoryProgressHandler;
  v9 = [(HMDUnpairedHAPAccessoryProgressHandler *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryUUID, a3);
    v11 = _Block_copy(v8);
    id progressHandler = v10->_progressHandler;
    v10->_id progressHandler = v11;
  }
  return v10;
}

@end