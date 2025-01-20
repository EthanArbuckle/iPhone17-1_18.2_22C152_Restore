@interface MTRClusterFormaldehydeConcentrationMeasurement
- (id)readAttributeAcceptedCommandListWithParams:(id)a3;
- (id)readAttributeAttributeListWithParams:(id)a3;
- (id)readAttributeAverageMeasuredValueWindowWithParams:(id)a3;
- (id)readAttributeAverageMeasuredValueWithParams:(id)a3;
- (id)readAttributeClusterRevisionWithParams:(id)a3;
- (id)readAttributeEventListWithParams:(id)a3;
- (id)readAttributeFeatureMapWithParams:(id)a3;
- (id)readAttributeGeneratedCommandListWithParams:(id)a3;
- (id)readAttributeLevelValueWithParams:(id)a3;
- (id)readAttributeMaxMeasuredValueWithParams:(id)a3;
- (id)readAttributeMeasuredValueWithParams:(id)a3;
- (id)readAttributeMeasurementMediumWithParams:(id)a3;
- (id)readAttributeMeasurementUnitWithParams:(id)a3;
- (id)readAttributeMinMeasuredValueWithParams:(id)a3;
- (id)readAttributePeakMeasuredValueWindowWithParams:(id)a3;
- (id)readAttributePeakMeasuredValueWithParams:(id)a3;
- (id)readAttributeUncertaintyWithParams:(id)a3;
@end

@implementation MTRClusterFormaldehydeConcentrationMeasurement

- (id)readAttributeMeasuredValueWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB440, v4);

  return v12;
}

- (id)readAttributeMinMeasuredValueWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB548, v4);

  return v12;
}

- (id)readAttributeMaxMeasuredValueWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB758, v4);

  return v12;
}

- (id)readAttributePeakMeasuredValueWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB530, v4);

  return v12;
}

- (id)readAttributePeakMeasuredValueWindowWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB608, v4);

  return v12;
}

- (id)readAttributeAverageMeasuredValueWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB770, v4);

  return v12;
}

- (id)readAttributeAverageMeasuredValueWindowWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB668, v4);

  return v12;
}

- (id)readAttributeUncertaintyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB950, v4);

  return v12;
}

- (id)readAttributeMeasurementUnitWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB740, v4);

  return v12;
}

- (id)readAttributeMeasurementMediumWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB968, v4);

  return v12;
}

- (id)readAttributeLevelValueWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB980, v4);

  return v12;
}

- (id)readAttributeGeneratedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB458, v4);

  return v12;
}

- (id)readAttributeAcceptedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB470, v4);

  return v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB560, v4);

  return v12;
}

- (id)readAttributeAttributeListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB488, v4);

  return v12;
}

- (id)readAttributeFeatureMapWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB4A0, v4);

  return v12;
}

- (id)readAttributeClusterRevisionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CCDA8, &unk_26F9CB4B8, v4);

  return v12;
}

@end