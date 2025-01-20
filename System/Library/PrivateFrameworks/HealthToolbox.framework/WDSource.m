@interface WDSource
- (HKDevice)device;
- (HKSourceDataModel)sourceModel;
- (NSString)name;
- (WDSource)initWithSource:(id)a3 device:(id)a4;
@end

@implementation WDSource

- (WDSource)initWithSource:(id)a3 device:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WDSource;
  v9 = [(WDSource *)&v29 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceModel, a3);
    objc_storeStrong((id *)&v10->_device, a4);
    if (v7)
    {
      v11 = [v7 source];
      name = [v11 name];
      uint64_t v13 = [name copy];
      v14 = (void *)v13;
      if (v13) {
        v15 = (__CFString *)v13;
      }
      else {
        v15 = &stru_26D2EA890;
      }
      objc_storeStrong((id *)&v10->_name, v15);
    }
    else
    {
      if ([v8 _isConnectedGymDevice])
      {
        v16 = [v8 manufacturer];

        if (v16)
        {
          v17 = [v8 _connectedGymDeviceFullName];
          v11 = v17;
          if (v17)
          {
            id v18 = v17;
            v11 = v18;
          }
          else
          {
            id v18 = [v8 manufacturer];
          }
          name = v10->_name;
          v10->_name = (NSString *)v18;
          goto LABEL_23;
        }
      }
      v11 = [v8 name];
      v19 = (void *)[v11 copy];
      name = v19;
      if (v19)
      {
        v20 = v19;
        v14 = v10->_name;
        v10->_name = v20;
      }
      else
      {
        v14 = [v8 model];
        v21 = (void *)[v14 copy];
        v22 = v21;
        if (v21)
        {
          v23 = v21;
          v24 = v10->_name;
          v10->_name = v23;
        }
        else
        {
          v24 = [v8 manufacturer];
          uint64_t v25 = [v24 copy];
          v26 = (void *)v25;
          if (v25) {
            v27 = (__CFString *)v25;
          }
          else {
            v27 = &stru_26D2EA890;
          }
          objc_storeStrong((id *)&v10->_name, v27);
        }
      }
    }

LABEL_23:
  }

  return v10;
}

- (HKSourceDataModel)sourceModel
{
  return self->_sourceModel;
}

- (HKDevice)device
{
  return self->_device;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_storeStrong((id *)&self->_sourceModel, 0);
}

@end