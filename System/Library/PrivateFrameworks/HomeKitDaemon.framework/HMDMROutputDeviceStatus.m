@interface HMDMROutputDeviceStatus
- (BOOL)isEqual:(id)a3;
- (HMDMRAVEndpoint)outputEndpoint;
- (HMDMROutputDeviceStatus)initWithOutputEndpoint:(id)a3;
- (HMDMROutputDeviceStatus)initWithOutputEndpoint:(id)a3 error:(id)a4;
- (HMDMROutputDeviceStatus)initWithOutputUID:(id)a3;
- (HMDMROutputDeviceStatus)initWithOutputUID:(id)a3 error:(id)a4;
- (NSError)error;
- (NSString)outputUID;
- (unint64_t)hash;
@end

@implementation HMDMROutputDeviceStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_outputUID, 0);
  objc_storeStrong((id *)&self->_outputEndpoint, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSString)outputUID
{
  return self->_outputUID;
}

- (HMDMRAVEndpoint)outputEndpoint
{
  return self->_outputEndpoint;
}

- (unint64_t)hash
{
  v3 = [(HMDMROutputDeviceStatus *)self outputUID];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDMROutputDeviceStatus *)self outputEndpoint];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDMROutputDeviceStatus *)a3;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(HMDMROutputDeviceStatus *)self outputUID];
      v7 = [(HMDMROutputDeviceStatus *)v5 outputUID];
      int v8 = HMFEqualObjects();

      if (v8
        && ([(HMDMROutputDeviceStatus *)self outputEndpoint],
            v9 = objc_claimAutoreleasedReturnValue(),
            [(HMDMROutputDeviceStatus *)v5 outputEndpoint],
            v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = HMFEqualObjects(),
            v10,
            v9,
            v11))
      {
        v12 = [(HMDMROutputDeviceStatus *)self error];
        v13 = [(HMDMROutputDeviceStatus *)v5 error];
        char v14 = HMFEqualObjects();
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }

  return v14;
}

- (HMDMROutputDeviceStatus)initWithOutputEndpoint:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMROutputDeviceStatus;
  v9 = [(HMDMROutputDeviceStatus *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_outputEndpoint, a3);
  }

  return v10;
}

- (HMDMROutputDeviceStatus)initWithOutputUID:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDMROutputDeviceStatus;
  v9 = [(HMDMROutputDeviceStatus *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a4);
    objc_storeStrong((id *)&v10->_outputUID, a3);
  }

  return v10;
}

- (HMDMROutputDeviceStatus)initWithOutputEndpoint:(id)a3
{
  return [(HMDMROutputDeviceStatus *)self initWithOutputEndpoint:a3 error:0];
}

- (HMDMROutputDeviceStatus)initWithOutputUID:(id)a3
{
  return [(HMDMROutputDeviceStatus *)self initWithOutputUID:a3 error:0];
}

@end