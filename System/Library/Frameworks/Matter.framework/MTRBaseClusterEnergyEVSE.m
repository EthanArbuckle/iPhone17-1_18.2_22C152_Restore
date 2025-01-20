@interface MTRBaseClusterEnergyEVSE
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeApproximateEVEfficiencyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeAttributeListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeBatteryCapacityWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeChargingEnabledUntilWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeCircuitCapacityWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeDischargingEnabledUntilWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFaultStateWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFeatureMapWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeMaximumChargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeMaximumDischargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeMinimumChargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNextChargeRequiredEnergyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNextChargeStartTimeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNextChargeTargetSoCWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNextChargeTargetTimeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeRandomizationDelayWindowWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeSessionDurationWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeSessionEnergyChargedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeSessionEnergyDischargedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeSessionIDWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeStateOfChargeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeStateWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeSupplyStateWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeUserMaximumChargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeVehicleIDWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)clearTargetsWithCompletion:(id)a3;
- (void)clearTargetsWithParams:(id)a3 completion:(id)a4;
- (void)disableWithCompletion:(id)a3;
- (void)disableWithParams:(id)a3 completion:(id)a4;
- (void)enableChargingWithParams:(id)a3 completion:(id)a4;
- (void)enableDischargingWithParams:(id)a3 completion:(id)a4;
- (void)getTargetsWithCompletion:(id)a3;
- (void)getTargetsWithParams:(id)a3 completion:(id)a4;
- (void)readAttributeAcceptedCommandListWithCompletion:(id)a3;
- (void)readAttributeApproximateEVEfficiencyWithCompletion:(id)a3;
- (void)readAttributeAttributeListWithCompletion:(id)a3;
- (void)readAttributeBatteryCapacityWithCompletion:(id)a3;
- (void)readAttributeChargingEnabledUntilWithCompletion:(id)a3;
- (void)readAttributeCircuitCapacityWithCompletion:(id)a3;
- (void)readAttributeClusterRevisionWithCompletion:(id)a3;
- (void)readAttributeDischargingEnabledUntilWithCompletion:(id)a3;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeFaultStateWithCompletion:(id)a3;
- (void)readAttributeFeatureMapWithCompletion:(id)a3;
- (void)readAttributeGeneratedCommandListWithCompletion:(id)a3;
- (void)readAttributeMaximumChargeCurrentWithCompletion:(id)a3;
- (void)readAttributeMaximumDischargeCurrentWithCompletion:(id)a3;
- (void)readAttributeMinimumChargeCurrentWithCompletion:(id)a3;
- (void)readAttributeNextChargeRequiredEnergyWithCompletion:(id)a3;
- (void)readAttributeNextChargeStartTimeWithCompletion:(id)a3;
- (void)readAttributeNextChargeTargetSoCWithCompletion:(id)a3;
- (void)readAttributeNextChargeTargetTimeWithCompletion:(id)a3;
- (void)readAttributeRandomizationDelayWindowWithCompletion:(id)a3;
- (void)readAttributeSessionDurationWithCompletion:(id)a3;
- (void)readAttributeSessionEnergyChargedWithCompletion:(id)a3;
- (void)readAttributeSessionEnergyDischargedWithCompletion:(id)a3;
- (void)readAttributeSessionIDWithCompletion:(id)a3;
- (void)readAttributeStateOfChargeWithCompletion:(id)a3;
- (void)readAttributeStateWithCompletion:(id)a3;
- (void)readAttributeSupplyStateWithCompletion:(id)a3;
- (void)readAttributeUserMaximumChargeCurrentWithCompletion:(id)a3;
- (void)readAttributeVehicleIDWithCompletion:(id)a3;
- (void)setTargetsWithParams:(id)a3 completion:(id)a4;
- (void)startDiagnosticsWithCompletion:(id)a3;
- (void)startDiagnosticsWithParams:(id)a3 completion:(id)a4;
- (void)subscribeAttributeAcceptedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeApproximateEVEfficiencyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeAttributeListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeBatteryCapacityWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeChargingEnabledUntilWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeCircuitCapacityWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeClusterRevisionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeDischargingEnabledUntilWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFaultStateWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFeatureMapWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeGeneratedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeMaximumChargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeMaximumDischargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeMinimumChargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNextChargeRequiredEnergyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNextChargeStartTimeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNextChargeTargetSoCWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNextChargeTargetTimeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeRandomizationDelayWindowWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeSessionDurationWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeSessionEnergyChargedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeSessionEnergyDischargedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeSessionIDWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeStateOfChargeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeStateWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeSupplyStateWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeUserMaximumChargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeVehicleIDWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 params:(id)a4 completion:(id)a5;
@end

@implementation MTRBaseClusterEnergyEVSE

- (void)disableWithCompletion:(id)a3
{
}

- (void)disableWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterDisableParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterDisableParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244968BB8;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C8848, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)enableChargingWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterEnableChargingParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterEnableChargingParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244968DB0;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C8860, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)enableDischargingWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterEnableDischargingParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterEnableDischargingParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244968FA8;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C8878, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)startDiagnosticsWithCompletion:(id)a3
{
}

- (void)startDiagnosticsWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterStartDiagnosticsParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterStartDiagnosticsParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_2449691AC;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C8890, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)setTargetsWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterSetTargetsParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterSetTargetsParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_2449693A4;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C88A8, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)getTargetsWithCompletion:(id)a3
{
}

- (void)getTargetsWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterGetTargetsParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterGetTargetsParams);
  }
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  v30 = sub_2449695B8;
  id v31 = &unk_265198C08;
  id v8 = v7;
  id v32 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v28);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v23 = objc_opt_class();
  v26 = objc_msgSend_callbackQueue(self, v24, v25);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v27, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C8980, v6, v15, v22, v23, v26, v9, v28, v29, v30, v31);
}

- (void)clearTargetsWithCompletion:(id)a3
{
}

- (void)clearTargetsWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTREnergyEVSEClusterClearTargetsParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTREnergyEVSEClusterClearTargetsParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  uint64_t v29 = sub_2449697B8;
  v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  if (v12) {
    v15 = (void *)v12;
  }
  else {
    v15 = &unk_26F9C9238;
  }
  v16 = objc_msgSend_device(self, v13, v14);
  v19 = objc_msgSend_endpointID(self, v17, v18);
  v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  uint64_t v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9C95E0, &unk_26F9C8998, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)readAttributeStateWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8710, 0, v12, v14);
}

- (void)subscribeAttributeStateWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributeStateWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 0, v10, v11);
}

- (void)readAttributeSupplyStateWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8800, 0, v12, v14);
}

- (void)subscribeAttributeSupplyStateWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeSupplyStateWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 1, v10, v11);
}

- (void)readAttributeFaultStateWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C89C8, 0, v12, v14);
}

- (void)subscribeAttributeFaultStateWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeFaultStateWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 2, v10, v11);
}

- (void)readAttributeChargingEnabledUntilWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C89E0, 0, v12, v14);
}

- (void)subscribeAttributeChargingEnabledUntilWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C89E0, v20, v18, v9, v8);
}

+ (void)readAttributeChargingEnabledUntilWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 3, v10, v11);
}

- (void)readAttributeDischargingEnabledUntilWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C89F8, 0, v12, v14);
}

- (void)subscribeAttributeDischargingEnabledUntilWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C89F8, v20, v18, v9, v8);
}

+ (void)readAttributeDischargingEnabledUntilWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 4, v10, v11);
}

- (void)readAttributeCircuitCapacityWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8A10, 0, v12, v14);
}

- (void)subscribeAttributeCircuitCapacityWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8A10, v20, v18, v9, v8);
}

+ (void)readAttributeCircuitCapacityWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 5, v10, v11);
}

- (void)readAttributeMinimumChargeCurrentWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8A28, 0, v12, v14);
}

- (void)subscribeAttributeMinimumChargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8A28, v20, v18, v9, v8);
}

+ (void)readAttributeMinimumChargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 6, v10, v11);
}

- (void)readAttributeMaximumChargeCurrentWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8BC0, 0, v12, v14);
}

- (void)subscribeAttributeMaximumChargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8BC0, v20, v18, v9, v8);
}

+ (void)readAttributeMaximumChargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 7, v10, v11);
}

- (void)readAttributeMaximumDischargeCurrentWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8BD8, 0, v12, v14);
}

- (void)subscribeAttributeMaximumDischargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8BD8, v20, v18, v9, v8);
}

+ (void)readAttributeMaximumDischargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 8, v10, v11);
}

- (void)readAttributeUserMaximumChargeCurrentWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8BF0, 0, v12, v14);
}

- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeUserMaximumChargeCurrentWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeUserMaximumChargeCurrentWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8BF0, v20, v18, v9, v8);
}

+ (void)readAttributeUserMaximumChargeCurrentWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 9, v10, v11);
}

- (void)readAttributeRandomizationDelayWindowWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8C08, 0, v12, v14);
}

- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeRandomizationDelayWindowWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeRandomizationDelayWindowWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8C08, v20, v18, v9, v8);
}

+ (void)readAttributeRandomizationDelayWindowWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 10, v10, v11);
}

- (void)readAttributeNextChargeStartTimeWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8F08, 0, v12, v14);
}

- (void)subscribeAttributeNextChargeStartTimeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8F08, v20, v18, v9, v8);
}

+ (void)readAttributeNextChargeStartTimeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 35, v10, v11);
}

- (void)readAttributeNextChargeTargetTimeWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8F20, 0, v12, v14);
}

- (void)subscribeAttributeNextChargeTargetTimeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8F20, v20, v18, v9, v8);
}

+ (void)readAttributeNextChargeTargetTimeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 36, v10, v11);
}

- (void)readAttributeNextChargeRequiredEnergyWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8F38, 0, v12, v14);
}

- (void)subscribeAttributeNextChargeRequiredEnergyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8F38, v20, v18, v9, v8);
}

+ (void)readAttributeNextChargeRequiredEnergyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 37, v10, v11);
}

- (void)readAttributeNextChargeTargetSoCWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8F50, 0, v12, v14);
}

- (void)subscribeAttributeNextChargeTargetSoCWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8F50, v20, v18, v9, v8);
}

+ (void)readAttributeNextChargeTargetSoCWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 38, v10, v11);
}

- (void)readAttributeApproximateEVEfficiencyWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8F68, 0, v12, v14);
}

- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeApproximateEVEfficiencyWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeApproximateEVEfficiencyWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8F68, v20, v18, v9, v8);
}

+ (void)readAttributeApproximateEVEfficiencyWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 39, v10, v11);
}

- (void)readAttributeStateOfChargeWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C9040, 0, v12, v14);
}

- (void)subscribeAttributeStateOfChargeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C9040, v20, v18, v9, v8);
}

+ (void)readAttributeStateOfChargeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 48, v10, v11);
}

- (void)readAttributeBatteryCapacityWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C9058, 0, v12, v14);
}

- (void)subscribeAttributeBatteryCapacityWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C9058, v20, v18, v9, v8);
}

+ (void)readAttributeBatteryCapacityWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 49, v10, v11);
}

- (void)readAttributeVehicleIDWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C9070, 0, v12, v14);
}

- (void)subscribeAttributeVehicleIDWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C9070, v20, v18, v9, v8);
}

+ (void)readAttributeVehicleIDWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 50, v10, v11);
}

- (void)readAttributeSessionIDWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C95F8, 0, v12, v14);
}

- (void)subscribeAttributeSessionIDWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C95F8, v20, v18, v9, v8);
}

+ (void)readAttributeSessionIDWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 64, v10, v11);
}

- (void)readAttributeSessionDurationWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C9610, 0, v12, v14);
}

- (void)subscribeAttributeSessionDurationWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C9610, v20, v18, v9, v8);
}

+ (void)readAttributeSessionDurationWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65, v10, v11);
}

- (void)readAttributeSessionEnergyChargedWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C9628, 0, v12, v14);
}

- (void)subscribeAttributeSessionEnergyChargedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C9628, v20, v18, v9, v8);
}

+ (void)readAttributeSessionEnergyChargedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 66, v10, v11);
}

- (void)readAttributeSessionEnergyDischargedWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C9640, 0, v12, v14);
}

- (void)subscribeAttributeSessionEnergyDischargedWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C9640, v20, v18, v9, v8);
}

+ (void)readAttributeSessionEnergyDischargedWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 67, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C95E0, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C95E0, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 153, 65533, v10, v11);
}

@end