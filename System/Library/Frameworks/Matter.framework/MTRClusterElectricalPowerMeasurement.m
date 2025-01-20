@interface MTRClusterElectricalPowerMeasurement
- (id)readAttributeAcceptedCommandListWithParams:(id)a3;
- (id)readAttributeAccuracyWithParams:(id)a3;
- (id)readAttributeActiveCurrentWithParams:(id)a3;
- (id)readAttributeActivePowerWithParams:(id)a3;
- (id)readAttributeApparentCurrentWithParams:(id)a3;
- (id)readAttributeApparentPowerWithParams:(id)a3;
- (id)readAttributeAttributeListWithParams:(id)a3;
- (id)readAttributeClusterRevisionWithParams:(id)a3;
- (id)readAttributeEventListWithParams:(id)a3;
- (id)readAttributeFeatureMapWithParams:(id)a3;
- (id)readAttributeFrequencyWithParams:(id)a3;
- (id)readAttributeGeneratedCommandListWithParams:(id)a3;
- (id)readAttributeHarmonicCurrentsWithParams:(id)a3;
- (id)readAttributeHarmonicPhasesWithParams:(id)a3;
- (id)readAttributeNeutralCurrentWithParams:(id)a3;
- (id)readAttributeNumberOfMeasurementTypesWithParams:(id)a3;
- (id)readAttributePowerFactorWithParams:(id)a3;
- (id)readAttributePowerModeWithParams:(id)a3;
- (id)readAttributeRMSCurrentWithParams:(id)a3;
- (id)readAttributeRMSPowerWithParams:(id)a3;
- (id)readAttributeRMSVoltageWithParams:(id)a3;
- (id)readAttributeRangesWithParams:(id)a3;
- (id)readAttributeReactiveCurrentWithParams:(id)a3;
- (id)readAttributeReactivePowerWithParams:(id)a3;
- (id)readAttributeVoltageWithParams:(id)a3;
@end

@implementation MTRClusterElectricalPowerMeasurement

- (id)readAttributePowerModeWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB440, v4);

  return v12;
}

- (id)readAttributeNumberOfMeasurementTypesWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB548, v4);

  return v12;
}

- (id)readAttributeAccuracyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB758, v4);

  return v12;
}

- (id)readAttributeRangesWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB530, v4);

  return v12;
}

- (id)readAttributeVoltageWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB608, v4);

  return v12;
}

- (id)readAttributeActiveCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB770, v4);

  return v12;
}

- (id)readAttributeReactiveCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB668, v4);

  return v12;
}

- (id)readAttributeApparentCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB950, v4);

  return v12;
}

- (id)readAttributeActivePowerWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB740, v4);

  return v12;
}

- (id)readAttributeReactivePowerWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB968, v4);

  return v12;
}

- (id)readAttributeApparentPowerWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB980, v4);

  return v12;
}

- (id)readAttributeRMSVoltageWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB998, v4);

  return v12;
}

- (id)readAttributeRMSCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB9B0, v4);

  return v12;
}

- (id)readAttributeRMSPowerWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB9C8, v4);

  return v12;
}

- (id)readAttributeFrequencyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB9E0, v4);

  return v12;
}

- (id)readAttributeHarmonicCurrentsWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB788, v4);

  return v12;
}

- (id)readAttributeHarmonicPhasesWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB7A0, v4);

  return v12;
}

- (id)readAttributePowerFactorWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB7B8, v4);

  return v12;
}

- (id)readAttributeNeutralCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB7D0, v4);

  return v12;
}

- (id)readAttributeGeneratedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB458, v4);

  return v12;
}

- (id)readAttributeAcceptedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB470, v4);

  return v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB560, v4);

  return v12;
}

- (id)readAttributeAttributeListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB488, v4);

  return v12;
}

- (id)readAttributeFeatureMapWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB4A0, v4);

  return v12;
}

- (id)readAttributeClusterRevisionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC3B8, &unk_26F9CB4B8, v4);

  return v12;
}

@end