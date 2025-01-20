@interface MTRClusterPowerSource
- (MTRClusterPowerSource)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveBatChargeFaultsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveBatFaultsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveWiredFaultsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatANSIDesignationWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatApprovedChemistryWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatCapacityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatChargeLevelWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatChargeStateWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatChargingCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatCommonDesignationWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatFunctionalWhileChargingWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatIECDesignationWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatPercentRemainingWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatPresentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatQuantityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatReplaceabilityWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatReplacementDescriptionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatReplacementNeededWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatTimeRemainingWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatTimeToFullChargeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBatVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDescriptionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOrderWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeStatusWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredAssessedCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredAssessedInputFrequencyWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredAssessedInputVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredCurrentTypeWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredMaximumCurrentWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredNominalVoltageWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWiredPresentWithParams:(MTRReadParams *)params;
- (id)readAttributeEndpointListWithParams:(id)a3;
- (id)readAttributeEventListWithParams:(id)a3;
@end

@implementation MTRClusterPowerSource

- (NSDictionary)readAttributeStatusWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOrderWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB548, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDescriptionWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB758, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredAssessedInputVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB530, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredAssessedInputFrequencyWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB608, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredCurrentTypeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB770, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredAssessedCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB668, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredNominalVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB950, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredMaximumCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB740, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWiredPresentWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB968, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveWiredFaultsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB980, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatVoltageWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB998, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatPercentRemainingWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB9B0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatTimeRemainingWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB9C8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatChargeLevelWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB9E0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatReplacementNeededWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB788, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatReplaceabilityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB7A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatPresentWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB7B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveBatFaultsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB7D0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatReplacementDescriptionWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB7E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatCommonDesignationWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB800, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatANSIDesignationWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB9F8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatIECDesignationWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CBA10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatApprovedChemistryWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CBB00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatCapacityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CBB18, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatQuantityWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CBB30, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatChargeStateWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CBB48, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatTimeToFullChargeWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CBB60, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatFunctionalWhileChargingWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB818, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBatChargingCurrentWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB830, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveBatChargeFaultsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB848, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEndpointListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB878, v4);

  return v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBAE8, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterPowerSource)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  v13 = (MTRClusterPowerSource *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end