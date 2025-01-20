@interface MTRClusterThreadNetworkDiagnostics
- (MTRClusterThreadNetworkDiagnostics)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveNetworkFaultsListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeActiveTimestampWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttachAttemptCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeBetterPartitionAttachAttemptCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeChannelPage0MaskWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeChannelWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeChildRoleCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDataVersionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDelayWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeDetachedRoleCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeExtendedPanIdWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLeaderRoleCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeLeaderRouterIdWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeMeshLocalPrefixWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNeighborTableListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNeighborTableWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeNetworkNameWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOperationalDatasetComponentsWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeOverrunCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePanIdWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeParentChangeCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePartitionIdChangeCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePartitionIdWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributePendingTimestampWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRouteTableListWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRouteTableWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRouterRoleCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRoutingRoleWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxAddressFilteredCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxBeaconCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxBeaconRequestCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxBroadcastCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxDataCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxDataPollCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxDestAddrFilteredCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxDuplicatedCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxErrFcsCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxErrInvalidSrcAddrCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxErrNoFrameCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxErrOtherCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxErrSecCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxErrUnknownNeighborCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxOtherCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxTotalCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeRxUnicastCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeSecurityPolicyWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeStableDataVersionWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxAckRequestedCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxAckedCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxBeaconCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxBeaconRequestCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxBroadcastCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxDataCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxDataPollCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxDirectMaxRetryExpiryCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxErrAbortCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxErrBusyChannelCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxErrCcaCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxIndirectMaxRetryExpiryCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxNoAckRequestedCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxOtherCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxRetryCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxTotalCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeTxUnicastCountWithParams:(MTRReadParams *)params;
- (NSDictionary)readAttributeWeightingWithParams:(MTRReadParams *)params;
- (id)readAttributeEventListWithParams:(id)a3;
- (void)resetCountsWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)resetCountsWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion;
- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler;
@end

@implementation MTRClusterThreadNetworkDiagnostics

- (void)resetCountsWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
}

- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completion:(MTRStatusCompletion)completion
{
  v10 = params;
  v11 = expectedDataValueDictionaries;
  v12 = expectedValueIntervalMs;
  MTRStatusCompletion v13 = completion;
  if (!v10) {
    v10 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterResetCountsParams);
  }
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_244BF6F68;
  v32[3] = &unk_265198C08;
  id v14 = v13;
  id v33 = v14;
  v15 = (void *)MEMORY[0x2456969D0](v32);
  v18 = objc_msgSend_timedInvokeTimeoutMs(v10, v16, v17);
  v21 = objc_msgSend_device(self, v19, v20);
  v24 = objc_msgSend_endpointID(self, v22, v23);
  v27 = objc_msgSend_serverSideProcessingTimeout(v10, v25, v26);
  v30 = objc_msgSend_callbackQueue(self, v28, v29);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_expectedValues_expectedValueInterval_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v21, v31, (uint64_t)v24, &unk_26F9CBC68, &unk_26F9CB500, v10, v11, v12, v18, v27, 0, v30, v15);
}

- (NSDictionary)readAttributeChannelWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB440, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRoutingRoleWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB548, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNetworkNameWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB758, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePanIdWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB530, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeExtendedPanIdWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB608, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeMeshLocalPrefixWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB770, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOverrunCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB668, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeNeighborTableWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB950, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRouteTableWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB740, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePartitionIdWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB968, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeWeightingWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB980, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDataVersionWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB998, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeStableDataVersionWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB9B0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLeaderRouterIdWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB9C8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDetachedRoleCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB9E0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeChildRoleCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB788, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRouterRoleCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB7A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeLeaderRoleCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB7B8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAttachAttemptCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB7D0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePartitionIdChangeCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB7E8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeBetterPartitionAttachAttemptCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB800, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeParentChangeCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB9F8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxTotalCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBA10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxUnicastCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBB00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxBroadcastCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBB18, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxAckRequestedCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBB30, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxAckedCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBB48, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxNoAckRequestedCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBB60, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxDataCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB818, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxDataPollCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB830, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxBeaconCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB848, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxBeaconRequestCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB878, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxOtherCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBC98, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxRetryCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBCB0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxDirectMaxRetryExpiryCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBCC8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxIndirectMaxRetryExpiryCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBCE0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxErrCcaCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBCF8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxErrAbortCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB8F0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeTxErrBusyChannelCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBD10, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxTotalCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBD28, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxUnicastCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB938, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxBroadcastCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBA40, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxDataCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBA70, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxDataPollCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBA88, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxBeaconCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBAA0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxBeaconRequestCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBAB8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxOtherCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBAD0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxAddressFilteredCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBAE8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxDestAddrFilteredCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBB90, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxDuplicatedCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBBC0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxErrNoFrameCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBBF0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxErrUnknownNeighborCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBC20, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxErrInvalidSrcAddrCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBC50, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxErrSecCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBC80, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxErrFcsCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBD40, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeRxErrOtherCountWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBD58, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveTimestampWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBD70, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributePendingTimestampWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBD88, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeDelayWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBDA0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeSecurityPolicyWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBDB8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeChannelPage0MaskWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBDD0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeOperationalDatasetComponentsWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBDE8, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeActiveNetworkFaultsListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CBE00, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeGeneratedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB458, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeAcceptedCommandListWithParams:(MTRReadParams *)params
{
  v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB470, v4);

  return (NSDictionary *)v12;
}

- (id)readAttributeEventListWithParams:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB560, v4);

  return v12;
}

- (NSDictionary)readAttributeAttributeListWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB488, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeFeatureMapWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB4A0, v4);

  return (NSDictionary *)v12;
}

- (NSDictionary)readAttributeClusterRevisionWithParams:(MTRReadParams *)params
{
  id v4 = params;
  v7 = objc_msgSend_device(self, v5, v6);
  v10 = objc_msgSend_endpointID(self, v8, v9);
  v12 = objc_msgSend_readAttributeWithEndpointID_clusterID_attributeID_params_(v7, v11, (uint64_t)v10, &unk_26F9CBC80, &unk_26F9CB4B8, v4);

  return (NSDictionary *)v12;
}

- (MTRClusterThreadNetworkDiagnostics)initWithDevice:(MTRDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  v8 = device;
  uint64_t v9 = queue;
  v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  MTRStatusCompletion v13 = (MTRClusterThreadNetworkDiagnostics *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params expectedValues:(NSArray *)expectedDataValueDictionaries expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)resetCountsWithExpectedValues:(NSArray *)expectedValues expectedValueInterval:(NSNumber *)expectedValueIntervalMs completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (NSDictionary)readAttributeNeighborTableListWithParams:(MTRReadParams *)params
{
  v3 = objc_msgSend_readAttributeNeighborTableWithParams_(self, a2, (uint64_t)params);

  return (NSDictionary *)v3;
}

- (NSDictionary)readAttributeRouteTableListWithParams:(MTRReadParams *)params
{
  v3 = objc_msgSend_readAttributeRouteTableWithParams_(self, a2, (uint64_t)params);

  return (NSDictionary *)v3;
}

@end