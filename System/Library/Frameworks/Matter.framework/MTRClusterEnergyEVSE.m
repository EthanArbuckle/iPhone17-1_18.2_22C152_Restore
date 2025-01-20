@interface MTRClusterEnergyEVSE
- (id)readAttributeAcceptedCommandListWithParams:(id)a3;
- (id)readAttributeApproximateEVEfficiencyWithParams:(id)a3;
- (id)readAttributeAttributeListWithParams:(id)a3;
- (id)readAttributeBatteryCapacityWithParams:(id)a3;
- (id)readAttributeChargingEnabledUntilWithParams:(id)a3;
- (id)readAttributeCircuitCapacityWithParams:(id)a3;
- (id)readAttributeClusterRevisionWithParams:(id)a3;
- (id)readAttributeDischargingEnabledUntilWithParams:(id)a3;
- (id)readAttributeEventListWithParams:(id)a3;
- (id)readAttributeFaultStateWithParams:(id)a3;
- (id)readAttributeFeatureMapWithParams:(id)a3;
- (id)readAttributeGeneratedCommandListWithParams:(id)a3;
- (id)readAttributeMaximumChargeCurrentWithParams:(id)a3;
- (id)readAttributeMaximumDischargeCurrentWithParams:(id)a3;
- (id)readAttributeMinimumChargeCurrentWithParams:(id)a3;
- (id)readAttributeNextChargeRequiredEnergyWithParams:(id)a3;
- (id)readAttributeNextChargeStartTimeWithParams:(id)a3;
- (id)readAttributeNextChargeTargetSoCWithParams:(id)a3;
- (id)readAttributeNextChargeTargetTimeWithParams:(id)a3;
- (id)readAttributeRandomizationDelayWindowWithParams:(id)a3;
- (id)readAttributeSessionDurationWithParams:(id)a3;
- (id)readAttributeSessionEnergyChargedWithParams:(id)a3;
- (id)readAttributeSessionEnergyDischargedWithParams:(id)a3;
- (id)readAttributeSessionIDWithParams:(id)a3;
- (id)readAttributeStateOfChargeWithParams:(id)a3;
- (id)readAttributeStateWithParams:(id)a3;
- (id)readAttributeSupplyStateWithParams:(id)a3;
- (id)readAttributeUserMaximumChargeCurrentWithParams:(id)a3;
- (id)readAttributeVehicleIDWithParams:(id)a3;
- (void)clearTargetsWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)clearTargetsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)disableWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)disableWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)enableChargingWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)enableDischargingWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)getTargetsWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)getTargetsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)setTargetsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)startDiagnosticsWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5;
- (void)startDiagnosticsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6;
- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 expectedValueInterval:(id)a4;
- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5;
@end

@implementation MTRClusterEnergyEVSE

- (void)disableWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)disableWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterDisableParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterDisableParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C209B8;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC4A8, &unk_26F9CB590, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)enableChargingWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterEnableChargingParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterEnableChargingParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C20BE4;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC4A8, &unk_26F9CB5A8, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)enableDischargingWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterEnableDischargingParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterEnableDischargingParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C20E10;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC4A8, &unk_26F9CB5C0, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)startDiagnosticsWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)startDiagnosticsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterStartDiagnosticsParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterStartDiagnosticsParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C21050;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC4A8, &unk_26F9CB5D8, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)setTargetsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterSetTargetsParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterSetTargetsParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C2127C;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC4A8, &unk_26F9CB5F0, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (void)getTargetsWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)getTargetsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterGetTargetsParams *)a3;
  id v34 = a4;
  id v11 = a5;
  id v12 = a6;
  id v33 = v12;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterGetTargetsParams);
  }
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = sub_244C214D4;
  v35[3] = &unk_265198C08;
  id v13 = v12;
  id v36 = v13;
  id v14 = (void *)MEMORY[0x2456969D0](v35);
  uint64_t v17 = objc_msgSend_timedInvokeTimeoutMs(v10, v15, v16);
  if (v17) {
    uint64_t v20 = (void *)v17;
  }
  else {
    uint64_t v20 = &unk_26F9CBE90;
  }
  v21 = objc_msgSend_device(self, v18, v19);
  uint64_t v24 = objc_msgSend_endpointID(self, v22, v23);
  uint64_t v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  uint64_t v28 = objc_opt_class();
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v32, (uint64_t)v24, &unk_26F9CC4A8, &unk_26F9CB6F8, v10, v34, v11, v20, v27, v28, v31, v14, v33);
}

- (void)clearTargetsWithExpectedValues:(id)a3 expectedValueInterval:(id)a4 completion:(id)a5
{
}

- (void)clearTargetsWithParams:(id)a3 expectedValues:(id)a4 expectedValueInterval:(id)a5 completion:(id)a6
{
  v10 = (MTREnergyEVSEClusterClearTargetsParams *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    v10 = objc_alloc_init(MTREnergyEVSEClusterClearTargetsParams);
  }
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = sub_244C21710;
  v33[3] = &unk_265198C08;
  id v14 = v13;
  id v34 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v33);
  uint64_t v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  if (v18) {
    v21 = (void *)v18;
  }
  else {
    v21 = &unk_26F9CBE90;
  }
  v22 = objc_msgSend_device(self, v19, v20);
  v25 = objc_msgSend_endpointID(self, v23, v24);
  uint64_t v28 = objc_msgSend_serverSideProcessingTimeout(v10, v26, v27);
  v31 = objc_msgSend_callbackQueue(self, v29, v30);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v22, v32, (uint64_t)v25, &unk_26F9CC4A8, &unk_26F9CB710, v10, v11, v12, v21, v28, 0, v31, v15);
}

- (id)readAttributeStateWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB440, v4);

  return v12;
}

- (id)readAttributeSupplyStateWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB548, v4);

  return v12;
}

- (id)readAttributeFaultStateWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB758, v4);

  return v12;
}

- (id)readAttributeChargingEnabledUntilWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB530, v4);

  return v12;
}

- (id)readAttributeDischargingEnabledUntilWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB608, v4);

  return v12;
}

- (id)readAttributeCircuitCapacityWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB770, v4);

  return v12;
}

- (id)readAttributeMinimumChargeCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB668, v4);

  return v12;
}

- (id)readAttributeMaximumChargeCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB950, v4);

  return v12;
}

- (id)readAttributeMaximumDischargeCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB740, v4);

  return v12;
}

- (id)readAttributeUserMaximumChargeCurrentWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB968, v4);

  return v12;
}

- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC4C0, &unk_26F9CB968, v19, v8, v11);
}

- (id)readAttributeRandomizationDelayWindowWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB980, v4);

  return v12;
}

- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC4C0, &unk_26F9CB980, v19, v8, v11);
}

- (id)readAttributeNextChargeStartTimeWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBCE0, v4);

  return v12;
}

- (id)readAttributeNextChargeTargetTimeWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBCF8, v4);

  return v12;
}

- (id)readAttributeNextChargeRequiredEnergyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB8F0, v4);

  return v12;
}

- (id)readAttributeNextChargeTargetSoCWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBD10, v4);

  return v12;
}

- (id)readAttributeApproximateEVEfficiencyWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBD28, v4);

  return v12;
}

- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 expectedValueInterval:(id)a4
{
}

- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 expectedValueInterval:(id)a4 params:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v11 = objc_msgSend_timedWriteTimeout(a5, v9, v10);
  id v14 = objc_msgSend_device(self, v12, v13);
  uint64_t v17 = objc_msgSend_endpointID(self, v15, v16);
  objc_msgSend_writeAttributeWithEndpointID_clusterID_attributeID_value_expectedValueInterval_timedWriteTimeout_(v14, v18, (uint64_t)v17, &unk_26F9CC4C0, &unk_26F9CBD28, v19, v8, v11);
}

- (id)readAttributeStateOfChargeWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBB90, v4);

  return v12;
}

- (id)readAttributeBatteryCapacityWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBBC0, v4);

  return v12;
}

- (id)readAttributeVehicleIDWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBBF0, v4);

  return v12;
}

- (id)readAttributeSessionIDWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBF08, v4);

  return v12;
}

- (id)readAttributeSessionDurationWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CBF20, v4);

  return v12;
}

- (id)readAttributeSessionEnergyChargedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CC4D8, v4);

  return v12;
}

- (id)readAttributeSessionEnergyDischargedWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CC4F0, v4);

  return v12;
}

- (id)readAttributeGeneratedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB458, v4);

  return v12;
}

- (id)readAttributeAcceptedCommandListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB470, v4);

  return v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB560, v4);

  return v12;
}

- (id)readAttributeAttributeListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB488, v4);

  return v12;
}

- (id)readAttributeFeatureMapWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB4A0, v4);

  return v12;
}

- (id)readAttributeClusterRevisionWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  uint64_t v10 = objc_msgSend_endpointID(self, v8, v9);
  id v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CC4C0, &unk_26F9CB4B8, v4);

  return v12;
}

@end