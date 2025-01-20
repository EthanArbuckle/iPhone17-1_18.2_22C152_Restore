@interface HMMStateData
- (BOOL)cleanClose;
- (BOOL)isOpen;
- (HMMStateData)initWithName:(id)a3 enterTime:(unint64_t)a4 enterData:(id)a5;
- (NSDictionary)enterData;
- (NSDictionary)exitData;
- (NSString)name;
- (unint64_t)duration;
- (unint64_t)enterTime;
- (void)_exitTime:(unint64_t)a3 exitData:(id)a4;
- (void)exitTime:(unint64_t)a3 exitData:(id)a4;
- (void)forceExit:(unint64_t)a3;
- (void)setEnterTime:(unint64_t)a3;
@end

@implementation HMMStateData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exitData, 0);
  objc_storeStrong((id *)&self->_enterData, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setEnterTime:(unint64_t)a3
{
  self->_enterTime = a3;
}

- (unint64_t)enterTime
{
  return self->_enterTime;
}

- (NSDictionary)exitData
{
  return self->_exitData;
}

- (NSDictionary)enterData
{
  return self->_enterData;
}

- (BOOL)cleanClose
{
  return self->_cleanClose;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (NSString)name
{
  return self->_name;
}

- (void)forceExit:(unint64_t)a3
{
}

- (void)_exitTime:(unint64_t)a3 exitData:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if ([(HMMStateData *)self isOpen])
  {
    self->_open = 0;
    if ([(HMMStateData *)self enterTime] <= a3)
    {
      self->_duration = a3 - [(HMMStateData *)self enterTime];
    }
    else
    {
      v8 = (void *)MEMORY[0x1D944E970]();
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = HMFGetLogIdentifier();
        v12 = [(HMMStateData *)v9 name];
        int v18 = 138543618;
        v19 = v11;
        __int16 v20 = 2114;
        v21 = v12;
        _os_log_impl(&dword_1D4999000, v10, OS_LOG_TYPE_ERROR, "%{public}@Metrics state %{public}@ exit time less than enter time", (uint8_t *)&v18, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_exitData, a4);
  }
  else
  {
    v13 = (void *)MEMORY[0x1D944E970]();
    v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      v17 = [(HMMStateData *)v14 name];
      int v18 = 138543618;
      v19 = v16;
      __int16 v20 = 2114;
      v21 = v17;
      _os_log_impl(&dword_1D4999000, v15, OS_LOG_TYPE_ERROR, "%{public}@Metrics state %{public}@ was already exited", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)exitTime:(unint64_t)a3 exitData:(id)a4
{
  self->_cleanClose = 1;
}

- (HMMStateData)initWithName:(id)a3 enterTime:(unint64_t)a4 enterData:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMMStateData;
  v11 = [(HMMStateData *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    v12->_open = 1;
    v12->_enterTime = a4;
    objc_storeStrong((id *)&v12->_enterData, a5);
  }

  return v12;
}

@end