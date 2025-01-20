@interface HMMTRProtocolOperation
+ (id)logCategory;
- (HAPCharacteristic)characteristic;
- (HAPCharacteristicWriteRequestTuple)writePrimaryRequestTuple;
- (HAPCharacteristicWriteRequestTuple)writeSecondaryRequestTuple;
- (HMMTRClusterDescription)characteristicDescription;
- (HMMTRDeviceTopology)topology;
- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 matterDevice:(id)a5 clusterIDCharacteristicMap:(id)a6;
- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 matterDevice:(id)a5 primaryArgument:(id)a6 clusterIDCharacteristicMap:(id)a7;
- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristicHandlingType:(unint64_t)a4 targetCharacteristic:(id)a5 targetValue:(id)a6 matterDevice:(id)a7 clusterIDCharacteristicMap:(id)a8;
- (MTRDevice)matterDevice;
- (NSDictionary)clusterIDCharacteristicMap;
- (id)value;
- (unint64_t)endpoint;
- (unint64_t)handlingType;
- (unint64_t)type;
- (void)setCharacteristic:(id)a3;
- (void)setCharacteristicDescription:(id)a3;
- (void)setEndpoint:(unint64_t)a3;
- (void)setHandlingType:(unint64_t)a3;
- (void)setTopology:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)setWritePrimaryRequestTuple:(id)a3;
- (void)setWriteSecondaryRequestTuple:(id)a3;
@end

@implementation HMMTRProtocolOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIDCharacteristicMap, 0);
  objc_storeStrong((id *)&self->_topology, 0);
  objc_storeStrong((id *)&self->_writeSecondaryRequestTuple, 0);
  objc_storeStrong((id *)&self->_writePrimaryRequestTuple, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_characteristicDescription, 0);
  objc_storeStrong((id *)&self->_matterDevice, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

- (NSDictionary)clusterIDCharacteristicMap
{
  return self->_clusterIDCharacteristicMap;
}

- (void)setTopology:(id)a3
{
}

- (HMMTRDeviceTopology)topology
{
  return self->_topology;
}

- (void)setWriteSecondaryRequestTuple:(id)a3
{
}

- (HAPCharacteristicWriteRequestTuple)writeSecondaryRequestTuple
{
  return (HAPCharacteristicWriteRequestTuple *)objc_getProperty(self, a2, 72, 1);
}

- (void)setWritePrimaryRequestTuple:(id)a3
{
}

- (HAPCharacteristicWriteRequestTuple)writePrimaryRequestTuple
{
  return (HAPCharacteristicWriteRequestTuple *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndpoint:(unint64_t)a3
{
  self->_endpoint = a3;
}

- (unint64_t)endpoint
{
  return self->_endpoint;
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setCharacteristicDescription:(id)a3
{
}

- (void)setHandlingType:(unint64_t)a3
{
  self->_handlingType = a3;
}

- (unint64_t)handlingType
{
  return self->_handlingType;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (MTRDevice)matterDevice
{
  return self->_matterDevice;
}

- (void)setCharacteristic:(id)a3
{
}

- (HAPCharacteristic)characteristic
{
  return self->_characteristic;
}

- (HMMTRClusterDescription)characteristicDescription
{
  characteristicDescription = self->_characteristicDescription;
  if (!characteristicDescription)
  {
    v4 = +[HMMTRProtocolMap protocolMap];
    v5 = [(HAPCharacteristic *)self->_characteristic type];
    v6 = [v4 descriptionOfMTRClusterForCharacteristicUUID:v5 operation:self->_type value:self->_value endpointID:self->_endpoint clusterIDCharacteristicMap:self->_clusterIDCharacteristicMap];
    v7 = self->_characteristicDescription;
    self->_characteristicDescription = v6;

    characteristicDescription = self->_characteristicDescription;
  }
  return characteristicDescription;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristicHandlingType:(unint64_t)a4 targetCharacteristic:(id)a5 targetValue:(id)a6 matterDevice:(id)a7 clusterIDCharacteristicMap:(id)a8
{
  id v14 = a5;
  id obj = a6;
  id v35 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = [v14 service];
  v18 = [v14 type];
  v19 = [v17 characteristicsOfType:v18];
  v20 = [v19 firstObject];

  if (v20)
  {
    v36.receiver = self;
    v36.super_class = (Class)HMMTRProtocolOperation;
    v21 = [(HMMTRProtocolOperation *)&v36 init];
    if (v21)
    {
      v22 = v21;
      v23 = [v14 service];
      v24 = [v14 type];
      v25 = [v23 characteristicsOfType:v24];
      [v25 firstObject];
      unint64_t v33 = a4;
      id v26 = v16;
      v28 = id v27 = v15;
      uint64_t v29 = [(HMMTRProtocolOperation *)v22 initWithOperationOfType:a3 characteristic:v28 matterDevice:v27 clusterIDCharacteristicMap:v26];

      id v15 = v27;
      id v16 = v26;

      objc_storeStrong((id *)(v29 + 48), obj);
      *(void *)(v29 + 32) = v33;
    }
    else
    {
      uint64_t v29 = 0;
    }
    v31 = v35;
    self = (HMMTRProtocolOperation *)(id)v29;
    v30 = self;
  }
  else
  {
    v30 = 0;
    v31 = v35;
  }

  return v30;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 matterDevice:(id)a5 primaryArgument:(id)a6 clusterIDCharacteristicMap:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMMTRProtocolOperation;
  id v16 = [(HMMTRProtocolOperation *)&v19 init];
  if (v16)
  {
    v17 = [(HMMTRProtocolOperation *)v16 initWithOperationOfType:a3 characteristic:v12 matterDevice:v13 clusterIDCharacteristicMap:v15];
    objc_storeStrong(&v17->_value, a6);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (HMMTRProtocolOperation)initWithOperationOfType:(unint64_t)a3 characteristic:(id)a4 matterDevice:(id)a5 clusterIDCharacteristicMap:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMMTRProtocolOperation;
  id v14 = [(HMMTRProtocolOperation *)&v22 init];
  id v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_characteristic, a4);
    objc_storeStrong((id *)&v15->_matterDevice, a5);
    v15->_endpoint = 1;
    v15->_handlingType = 0;
    objc_storeStrong((id *)&v15->_clusterIDCharacteristicMap, a6);
    id v16 = [v11 service];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    objc_super v19 = [v18 endpoint];

    if (v19)
    {
      v20 = [v18 endpoint];
      v15->_endpoint = (int)[v20 intValue];
    }
  }

  return v15;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_4476 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_4476, &__block_literal_global_4477);
  }
  v2 = (void *)logCategory__hmf_once_v2_4478;
  return v2;
}

uint64_t __37__HMMTRProtocolOperation_logCategory__block_invoke()
{
  logCategory__hmf_once_v2_4478 = HMFCreateOSLogHandle();
  return MEMORY[0x270F9A758]();
}

@end