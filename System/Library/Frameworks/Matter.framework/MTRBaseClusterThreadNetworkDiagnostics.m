@interface MTRBaseClusterThreadNetworkDiagnostics
+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActiveNetworkFaultsListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActiveNetworkFaultsListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeActiveTimestampWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeActiveTimestampWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttachAttemptCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttachAttemptCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBetterPartitionAttachAttemptCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeBetterPartitionAttachAttemptCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeChannelPage0MaskWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeChannelPage0MaskWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeChannelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeChannelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeChildRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeChildRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDataVersionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDataVersionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDelayWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDelayWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeDetachedRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeDetachedRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeExtendedPanIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeExtendedPanIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLeaderRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLeaderRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLeaderRouterIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeLeaderRouterIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeshLocalPrefixWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeMeshLocalPrefixWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNeighborTableListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNeighborTableWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNetworkNameWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeNetworkNameWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeOperationalDatasetComponentsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeOperationalDatasetComponentsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeOverrunCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeOverrunCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePanIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePanIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeParentChangeCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeParentChangeCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePartitionIdChangeCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePartitionIdChangeCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePartitionIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePartitionIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributePendingTimestampWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributePendingTimestampWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRouteTableListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRouteTableWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRouterRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRouterRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRoutingRoleWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRoutingRoleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxAddressFilteredCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxAddressFilteredCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxBeaconCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxBeaconCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxBeaconRequestCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxBeaconRequestCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxBroadcastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxBroadcastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxDataCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxDataCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxDataPollCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxDataPollCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxDestAddrFilteredCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxDestAddrFilteredCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxDuplicatedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxDuplicatedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxErrFcsCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxErrFcsCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxErrInvalidSrcAddrCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxErrInvalidSrcAddrCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxErrNoFrameCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxErrNoFrameCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxErrOtherCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxErrOtherCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxErrSecCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxErrSecCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxErrUnknownNeighborCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxErrUnknownNeighborCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxOtherCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxOtherCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxTotalCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxTotalCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRxUnicastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeRxUnicastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeSecurityPolicyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeSecurityPolicyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeStableDataVersionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeStableDataVersionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxAckRequestedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxAckRequestedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxAckedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxAckedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxBeaconCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxBeaconCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxBeaconRequestCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxBeaconRequestCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxBroadcastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxBroadcastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxDataCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxDataCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxDataPollCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxDataPollCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxDirectMaxRetryExpiryCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxDirectMaxRetryExpiryCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxErrAbortCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxErrAbortCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxErrBusyChannelCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxErrBusyChannelCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxErrCcaCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxErrCcaCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxIndirectMaxRetryExpiryCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxIndirectMaxRetryExpiryCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxNoAckRequestedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxNoAckRequestedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxOtherCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxOtherCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxRetryCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxRetryCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxTotalCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxTotalCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTxUnicastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeTxUnicastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeWeightingWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler;
+ (void)readAttributeWeightingWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (MTRBaseClusterThreadNetworkDiagnostics)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActiveNetworkFaultsListWithCompletion:(void *)completion;
- (void)readAttributeActiveNetworkFaultsListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeActiveTimestampWithCompletion:(void *)completion;
- (void)readAttributeActiveTimestampWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAttachAttemptCountWithCompletion:(void *)completion;
- (void)readAttributeAttachAttemptCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeBetterPartitionAttachAttemptCountWithCompletion:(void *)completion;
- (void)readAttributeBetterPartitionAttachAttemptCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeChannelPage0MaskWithCompletion:(void *)completion;
- (void)readAttributeChannelPage0MaskWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeChannelWithCompletion:(void *)completion;
- (void)readAttributeChannelWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeChildRoleCountWithCompletion:(void *)completion;
- (void)readAttributeChildRoleCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDataVersionWithCompletion:(void *)completion;
- (void)readAttributeDataVersionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDelayWithCompletion:(void *)completion;
- (void)readAttributeDelayWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeDetachedRoleCountWithCompletion:(void *)completion;
- (void)readAttributeDetachedRoleCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeExtendedPanIdWithCompletion:(void *)completion;
- (void)readAttributeExtendedPanIdWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLeaderRoleCountWithCompletion:(void *)completion;
- (void)readAttributeLeaderRoleCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeLeaderRouterIdWithCompletion:(void *)completion;
- (void)readAttributeLeaderRouterIdWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeMeshLocalPrefixWithCompletion:(void *)completion;
- (void)readAttributeMeshLocalPrefixWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNeighborTableListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeNeighborTableWithCompletion:(void *)completion;
- (void)readAttributeNetworkNameWithCompletion:(void *)completion;
- (void)readAttributeNetworkNameWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeOperationalDatasetComponentsWithCompletion:(void *)completion;
- (void)readAttributeOperationalDatasetComponentsWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeOverrunCountWithCompletion:(void *)completion;
- (void)readAttributeOverrunCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePanIdWithCompletion:(void *)completion;
- (void)readAttributePanIdWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeParentChangeCountWithCompletion:(void *)completion;
- (void)readAttributeParentChangeCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePartitionIdChangeCountWithCompletion:(void *)completion;
- (void)readAttributePartitionIdChangeCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePartitionIdWithCompletion:(void *)completion;
- (void)readAttributePartitionIdWithCompletionHandler:(void *)completionHandler;
- (void)readAttributePendingTimestampWithCompletion:(void *)completion;
- (void)readAttributePendingTimestampWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRouteTableListWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRouteTableWithCompletion:(void *)completion;
- (void)readAttributeRouterRoleCountWithCompletion:(void *)completion;
- (void)readAttributeRouterRoleCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRoutingRoleWithCompletion:(void *)completion;
- (void)readAttributeRoutingRoleWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxAddressFilteredCountWithCompletion:(void *)completion;
- (void)readAttributeRxAddressFilteredCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxBeaconCountWithCompletion:(void *)completion;
- (void)readAttributeRxBeaconCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxBeaconRequestCountWithCompletion:(void *)completion;
- (void)readAttributeRxBeaconRequestCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxBroadcastCountWithCompletion:(void *)completion;
- (void)readAttributeRxBroadcastCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxDataCountWithCompletion:(void *)completion;
- (void)readAttributeRxDataCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxDataPollCountWithCompletion:(void *)completion;
- (void)readAttributeRxDataPollCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxDestAddrFilteredCountWithCompletion:(void *)completion;
- (void)readAttributeRxDestAddrFilteredCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxDuplicatedCountWithCompletion:(void *)completion;
- (void)readAttributeRxDuplicatedCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxErrFcsCountWithCompletion:(void *)completion;
- (void)readAttributeRxErrFcsCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxErrInvalidSrcAddrCountWithCompletion:(void *)completion;
- (void)readAttributeRxErrInvalidSrcAddrCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxErrNoFrameCountWithCompletion:(void *)completion;
- (void)readAttributeRxErrNoFrameCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxErrOtherCountWithCompletion:(void *)completion;
- (void)readAttributeRxErrOtherCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxErrSecCountWithCompletion:(void *)completion;
- (void)readAttributeRxErrSecCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxErrUnknownNeighborCountWithCompletion:(void *)completion;
- (void)readAttributeRxErrUnknownNeighborCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxOtherCountWithCompletion:(void *)completion;
- (void)readAttributeRxOtherCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxTotalCountWithCompletion:(void *)completion;
- (void)readAttributeRxTotalCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeRxUnicastCountWithCompletion:(void *)completion;
- (void)readAttributeRxUnicastCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeSecurityPolicyWithCompletion:(void *)completion;
- (void)readAttributeSecurityPolicyWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeStableDataVersionWithCompletion:(void *)completion;
- (void)readAttributeStableDataVersionWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxAckRequestedCountWithCompletion:(void *)completion;
- (void)readAttributeTxAckRequestedCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxAckedCountWithCompletion:(void *)completion;
- (void)readAttributeTxAckedCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxBeaconCountWithCompletion:(void *)completion;
- (void)readAttributeTxBeaconCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxBeaconRequestCountWithCompletion:(void *)completion;
- (void)readAttributeTxBeaconRequestCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxBroadcastCountWithCompletion:(void *)completion;
- (void)readAttributeTxBroadcastCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxDataCountWithCompletion:(void *)completion;
- (void)readAttributeTxDataCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxDataPollCountWithCompletion:(void *)completion;
- (void)readAttributeTxDataPollCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxDirectMaxRetryExpiryCountWithCompletion:(void *)completion;
- (void)readAttributeTxDirectMaxRetryExpiryCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxErrAbortCountWithCompletion:(void *)completion;
- (void)readAttributeTxErrAbortCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxErrBusyChannelCountWithCompletion:(void *)completion;
- (void)readAttributeTxErrBusyChannelCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxErrCcaCountWithCompletion:(void *)completion;
- (void)readAttributeTxErrCcaCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxIndirectMaxRetryExpiryCountWithCompletion:(void *)completion;
- (void)readAttributeTxIndirectMaxRetryExpiryCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxNoAckRequestedCountWithCompletion:(void *)completion;
- (void)readAttributeTxNoAckRequestedCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxOtherCountWithCompletion:(void *)completion;
- (void)readAttributeTxOtherCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxRetryCountWithCompletion:(void *)completion;
- (void)readAttributeTxRetryCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxTotalCountWithCompletion:(void *)completion;
- (void)readAttributeTxTotalCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeTxUnicastCountWithCompletion:(void *)completion;
- (void)readAttributeTxUnicastCountWithCompletionHandler:(void *)completionHandler;
- (void)readAttributeWeightingWithCompletion:(void *)completion;
- (void)readAttributeWeightingWithCompletionHandler:(void *)completionHandler;
- (void)resetCountsWithCompletion:(MTRStatusCompletion)completion;
- (void)resetCountsWithCompletionHandler:(MTRStatusCompletion)completionHandler;
- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params completion:(MTRStatusCompletion)completion;
- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params completionHandler:(MTRStatusCompletion)completionHandler;
- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveNetworkFaultsListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveNetworkFaultsListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveTimestampWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeActiveTimestampWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttachAttemptCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttachAttemptCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBetterPartitionAttachAttemptCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBetterPartitionAttachAttemptCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeChannelPage0MaskWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeChannelPage0MaskWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeChannelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeChannelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeChildRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeChildRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDataVersionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDataVersionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDelayWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDelayWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDetachedRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeDetachedRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeExtendedPanIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeExtendedPanIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLeaderRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLeaderRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLeaderRouterIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLeaderRouterIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeshLocalPrefixWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeshLocalPrefixWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNeighborTableListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNeighborTableWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNetworkNameWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNetworkNameWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOperationalDatasetComponentsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOperationalDatasetComponentsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOverrunCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOverrunCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePanIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePanIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeParentChangeCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeParentChangeCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePartitionIdChangeCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePartitionIdChangeCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePartitionIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePartitionIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributePendingTimestampWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributePendingTimestampWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRouteTableListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRouteTableWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRouterRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRouterRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRoutingRoleWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRoutingRoleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxAddressFilteredCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxAddressFilteredCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxBeaconCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxBeaconCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxBeaconRequestCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxBeaconRequestCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxBroadcastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxBroadcastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDataCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDataCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDataPollCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDataPollCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDestAddrFilteredCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDestAddrFilteredCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDuplicatedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxDuplicatedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrFcsCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrFcsCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrInvalidSrcAddrCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrInvalidSrcAddrCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrNoFrameCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrNoFrameCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrOtherCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrOtherCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrSecCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrSecCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrUnknownNeighborCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxErrUnknownNeighborCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxOtherCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxOtherCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxTotalCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxTotalCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxUnicastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRxUnicastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSecurityPolicyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeSecurityPolicyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeStableDataVersionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeStableDataVersionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxAckRequestedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxAckRequestedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxAckedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxAckedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxBeaconCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxBeaconCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxBeaconRequestCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxBeaconRequestCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxBroadcastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxBroadcastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxDataCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxDataCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxDataPollCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxDataPollCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxDirectMaxRetryExpiryCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxDirectMaxRetryExpiryCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxErrAbortCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxErrAbortCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxErrBusyChannelCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxErrBusyChannelCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxErrCcaCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxErrCcaCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxIndirectMaxRetryExpiryCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxIndirectMaxRetryExpiryCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxNoAckRequestedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxNoAckRequestedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxOtherCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxOtherCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxRetryCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxRetryCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxTotalCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxTotalCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxUnicastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTxUnicastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeWeightingWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler;
- (void)subscribeAttributeWeightingWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
@end

@implementation MTRBaseClusterThreadNetworkDiagnostics

- (void)resetCountsWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRThreadNetworkDiagnosticsClusterResetCountsParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_2448CA0C4;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9C8EA8, &unk_26F9C87D0, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)readAttributeChannelWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8710, 0, v12, v14);
}

- (void)subscribeAttributeChannelWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributeChannelWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 0, v10, v11);
}

- (void)readAttributeRoutingRoleWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8800, 0, v12, v14);
}

- (void)subscribeAttributeRoutingRoleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeRoutingRoleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 1, v10, v11);
}

- (void)readAttributeNetworkNameWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C89C8, 0, v12, v14);
}

- (void)subscribeAttributeNetworkNameWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeNetworkNameWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 2, v10, v11);
}

- (void)readAttributePanIdWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C89E0, 0, v12, v14);
}

- (void)subscribeAttributePanIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C89E0, v20, v18, v9, v8);
}

+ (void)readAttributePanIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 3, v10, v11);
}

- (void)readAttributeExtendedPanIdWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C89F8, 0, v12, v14);
}

- (void)subscribeAttributeExtendedPanIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C89F8, v20, v18, v9, v8);
}

+ (void)readAttributeExtendedPanIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 4, v10, v11);
}

- (void)readAttributeMeshLocalPrefixWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8A10, 0, v12, v14);
}

- (void)subscribeAttributeMeshLocalPrefixWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8A10, v20, v18, v9, v8);
}

+ (void)readAttributeMeshLocalPrefixWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 5, v10, v11);
}

- (void)readAttributeOverrunCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8A28, 0, v12, v14);
}

- (void)subscribeAttributeOverrunCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8A28, v20, v18, v9, v8);
}

+ (void)readAttributeOverrunCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 6, v10, v11);
}

- (void)readAttributeNeighborTableWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8BC0, 0, v12, v14);
}

- (void)subscribeAttributeNeighborTableWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8BC0, v20, v18, v9, v8);
}

+ (void)readAttributeNeighborTableWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 7, v10, v11);
}

- (void)readAttributeRouteTableWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8BD8, 0, v12, v14);
}

- (void)subscribeAttributeRouteTableWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8BD8, v20, v18, v9, v8);
}

+ (void)readAttributeRouteTableWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 8, v10, v11);
}

- (void)readAttributePartitionIdWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8BF0, 0, v12, v14);
}

- (void)subscribeAttributePartitionIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8BF0, v20, v18, v9, v8);
}

+ (void)readAttributePartitionIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 9, v10, v11);
}

- (void)readAttributeWeightingWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C08, 0, v12, v14);
}

- (void)subscribeAttributeWeightingWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C08, v20, v18, v9, v8);
}

+ (void)readAttributeWeightingWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 10, v10, v11);
}

- (void)readAttributeDataVersionWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C20, 0, v12, v14);
}

- (void)subscribeAttributeDataVersionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C20, v20, v18, v9, v8);
}

+ (void)readAttributeDataVersionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 11, v10, v11);
}

- (void)readAttributeStableDataVersionWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C38, 0, v12, v14);
}

- (void)subscribeAttributeStableDataVersionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C38, v20, v18, v9, v8);
}

+ (void)readAttributeStableDataVersionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 12, v10, v11);
}

- (void)readAttributeLeaderRouterIdWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C50, 0, v12, v14);
}

- (void)subscribeAttributeLeaderRouterIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C50, v20, v18, v9, v8);
}

+ (void)readAttributeLeaderRouterIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 13, v10, v11);
}

- (void)readAttributeDetachedRoleCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C68, 0, v12, v14);
}

- (void)subscribeAttributeDetachedRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C68, v20, v18, v9, v8);
}

+ (void)readAttributeDetachedRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 14, v10, v11);
}

- (void)readAttributeChildRoleCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8A40, 0, v12, v14);
}

- (void)subscribeAttributeChildRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8A40, v20, v18, v9, v8);
}

+ (void)readAttributeChildRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 15, v10, v11);
}

- (void)readAttributeRouterRoleCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8A58, 0, v12, v14);
}

- (void)subscribeAttributeRouterRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8A58, v20, v18, v9, v8);
}

+ (void)readAttributeRouterRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 16, v10, v11);
}

- (void)readAttributeLeaderRoleCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8A70, 0, v12, v14);
}

- (void)subscribeAttributeLeaderRoleCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8A70, v20, v18, v9, v8);
}

+ (void)readAttributeLeaderRoleCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 17, v10, v11);
}

- (void)readAttributeAttachAttemptCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8A88, 0, v12, v14);
}

- (void)subscribeAttributeAttachAttemptCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8A88, v20, v18, v9, v8);
}

+ (void)readAttributeAttachAttemptCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 18, v10, v11);
}

- (void)readAttributePartitionIdChangeCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8AA0, 0, v12, v14);
}

- (void)subscribeAttributePartitionIdChangeCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8AA0, v20, v18, v9, v8);
}

+ (void)readAttributePartitionIdChangeCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 19, v10, v11);
}

- (void)readAttributeBetterPartitionAttachAttemptCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8AB8, 0, v12, v14);
}

- (void)subscribeAttributeBetterPartitionAttachAttemptCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8AB8, v20, v18, v9, v8);
}

+ (void)readAttributeBetterPartitionAttachAttemptCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 20, v10, v11);
}

- (void)readAttributeParentChangeCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C80, 0, v12, v14);
}

- (void)subscribeAttributeParentChangeCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C80, v20, v18, v9, v8);
}

+ (void)readAttributeParentChangeCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 21, v10, v11);
}

- (void)readAttributeTxTotalCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8C98, 0, v12, v14);
}

- (void)subscribeAttributeTxTotalCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8C98, v20, v18, v9, v8);
}

+ (void)readAttributeTxTotalCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 22, v10, v11);
}

- (void)readAttributeTxUnicastCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8D58, 0, v12, v14);
}

- (void)subscribeAttributeTxUnicastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8D58, v20, v18, v9, v8);
}

+ (void)readAttributeTxUnicastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 23, v10, v11);
}

- (void)readAttributeTxBroadcastCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8D70, 0, v12, v14);
}

- (void)subscribeAttributeTxBroadcastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8D70, v20, v18, v9, v8);
}

+ (void)readAttributeTxBroadcastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 24, v10, v11);
}

- (void)readAttributeTxAckRequestedCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8D88, 0, v12, v14);
}

- (void)subscribeAttributeTxAckRequestedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8D88, v20, v18, v9, v8);
}

+ (void)readAttributeTxAckRequestedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 25, v10, v11);
}

- (void)readAttributeTxAckedCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8DA0, 0, v12, v14);
}

- (void)subscribeAttributeTxAckedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8DA0, v20, v18, v9, v8);
}

+ (void)readAttributeTxAckedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 26, v10, v11);
}

- (void)readAttributeTxNoAckRequestedCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8DB8, 0, v12, v14);
}

- (void)subscribeAttributeTxNoAckRequestedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8DB8, v20, v18, v9, v8);
}

+ (void)readAttributeTxNoAckRequestedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 27, v10, v11);
}

- (void)readAttributeTxDataCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8DD0, 0, v12, v14);
}

- (void)subscribeAttributeTxDataCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8DD0, v20, v18, v9, v8);
}

+ (void)readAttributeTxDataCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 28, v10, v11);
}

- (void)readAttributeTxDataPollCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8DE8, 0, v12, v14);
}

- (void)subscribeAttributeTxDataPollCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8DE8, v20, v18, v9, v8);
}

+ (void)readAttributeTxDataPollCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 29, v10, v11);
}

- (void)readAttributeTxBeaconCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8E00, 0, v12, v14);
}

- (void)subscribeAttributeTxBeaconCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8E00, v20, v18, v9, v8);
}

+ (void)readAttributeTxBeaconCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 30, v10, v11);
}

- (void)readAttributeTxBeaconRequestCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8E18, 0, v12, v14);
}

- (void)subscribeAttributeTxBeaconRequestCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8E18, v20, v18, v9, v8);
}

+ (void)readAttributeTxBeaconRequestCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 31, v10, v11);
}

- (void)readAttributeTxOtherCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8EC0, 0, v12, v14);
}

- (void)subscribeAttributeTxOtherCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8EC0, v20, v18, v9, v8);
}

+ (void)readAttributeTxOtherCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 32, v10, v11);
}

- (void)readAttributeTxRetryCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8ED8, 0, v12, v14);
}

- (void)subscribeAttributeTxRetryCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8ED8, v20, v18, v9, v8);
}

+ (void)readAttributeTxRetryCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 33, v10, v11);
}

- (void)readAttributeTxDirectMaxRetryExpiryCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8EF0, 0, v12, v14);
}

- (void)subscribeAttributeTxDirectMaxRetryExpiryCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8EF0, v20, v18, v9, v8);
}

+ (void)readAttributeTxDirectMaxRetryExpiryCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 34, v10, v11);
}

- (void)readAttributeTxIndirectMaxRetryExpiryCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F08, 0, v12, v14);
}

- (void)subscribeAttributeTxIndirectMaxRetryExpiryCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F08, v20, v18, v9, v8);
}

+ (void)readAttributeTxIndirectMaxRetryExpiryCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 35, v10, v11);
}

- (void)readAttributeTxErrCcaCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F20, 0, v12, v14);
}

- (void)subscribeAttributeTxErrCcaCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F20, v20, v18, v9, v8);
}

+ (void)readAttributeTxErrCcaCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 36, v10, v11);
}

- (void)readAttributeTxErrAbortCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F38, 0, v12, v14);
}

- (void)subscribeAttributeTxErrAbortCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F38, v20, v18, v9, v8);
}

+ (void)readAttributeTxErrAbortCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 37, v10, v11);
}

- (void)readAttributeTxErrBusyChannelCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F50, 0, v12, v14);
}

- (void)subscribeAttributeTxErrBusyChannelCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F50, v20, v18, v9, v8);
}

+ (void)readAttributeTxErrBusyChannelCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 38, v10, v11);
}

- (void)readAttributeRxTotalCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F68, 0, v12, v14);
}

- (void)subscribeAttributeRxTotalCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F68, v20, v18, v9, v8);
}

+ (void)readAttributeRxTotalCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 39, v10, v11);
}

- (void)readAttributeRxUnicastCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F80, 0, v12, v14);
}

- (void)subscribeAttributeRxUnicastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F80, v20, v18, v9, v8);
}

+ (void)readAttributeRxUnicastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 40, v10, v11);
}

- (void)readAttributeRxBroadcastCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8F98, 0, v12, v14);
}

- (void)subscribeAttributeRxBroadcastCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8F98, v20, v18, v9, v8);
}

+ (void)readAttributeRxBroadcastCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 41, v10, v11);
}

- (void)readAttributeRxDataCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8FB0, 0, v12, v14);
}

- (void)subscribeAttributeRxDataCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8FB0, v20, v18, v9, v8);
}

+ (void)readAttributeRxDataCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 42, v10, v11);
}

- (void)readAttributeRxDataPollCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8FC8, 0, v12, v14);
}

- (void)subscribeAttributeRxDataPollCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8FC8, v20, v18, v9, v8);
}

+ (void)readAttributeRxDataPollCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 43, v10, v11);
}

- (void)readAttributeRxBeaconCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8FE0, 0, v12, v14);
}

- (void)subscribeAttributeRxBeaconCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8FE0, v20, v18, v9, v8);
}

+ (void)readAttributeRxBeaconCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 44, v10, v11);
}

- (void)readAttributeRxBeaconRequestCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8FF8, 0, v12, v14);
}

- (void)subscribeAttributeRxBeaconRequestCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8FF8, v20, v18, v9, v8);
}

+ (void)readAttributeRxBeaconRequestCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 45, v10, v11);
}

- (void)readAttributeRxOtherCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9010, 0, v12, v14);
}

- (void)subscribeAttributeRxOtherCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9010, v20, v18, v9, v8);
}

+ (void)readAttributeRxOtherCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 46, v10, v11);
}

- (void)readAttributeRxAddressFilteredCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9028, 0, v12, v14);
}

- (void)subscribeAttributeRxAddressFilteredCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9028, v20, v18, v9, v8);
}

+ (void)readAttributeRxAddressFilteredCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 47, v10, v11);
}

- (void)readAttributeRxDestAddrFilteredCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9040, 0, v12, v14);
}

- (void)subscribeAttributeRxDestAddrFilteredCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9040, v20, v18, v9, v8);
}

+ (void)readAttributeRxDestAddrFilteredCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 48, v10, v11);
}

- (void)readAttributeRxDuplicatedCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9058, 0, v12, v14);
}

- (void)subscribeAttributeRxDuplicatedCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9058, v20, v18, v9, v8);
}

+ (void)readAttributeRxDuplicatedCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 49, v10, v11);
}

- (void)readAttributeRxErrNoFrameCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9070, 0, v12, v14);
}

- (void)subscribeAttributeRxErrNoFrameCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9070, v20, v18, v9, v8);
}

+ (void)readAttributeRxErrNoFrameCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 50, v10, v11);
}

- (void)readAttributeRxErrUnknownNeighborCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9088, 0, v12, v14);
}

- (void)subscribeAttributeRxErrUnknownNeighborCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9088, v20, v18, v9, v8);
}

+ (void)readAttributeRxErrUnknownNeighborCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 51, v10, v11);
}

- (void)readAttributeRxErrInvalidSrcAddrCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C90A0, 0, v12, v14);
}

- (void)subscribeAttributeRxErrInvalidSrcAddrCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C90A0, v20, v18, v9, v8);
}

+ (void)readAttributeRxErrInvalidSrcAddrCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 52, v10, v11);
}

- (void)readAttributeRxErrSecCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C90B8, 0, v12, v14);
}

- (void)subscribeAttributeRxErrSecCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C90B8, v20, v18, v9, v8);
}

+ (void)readAttributeRxErrSecCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 53, v10, v11);
}

- (void)readAttributeRxErrFcsCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C90D0, 0, v12, v14);
}

- (void)subscribeAttributeRxErrFcsCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C90D0, v20, v18, v9, v8);
}

+ (void)readAttributeRxErrFcsCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 54, v10, v11);
}

- (void)readAttributeRxErrOtherCountWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C90E8, 0, v12, v14);
}

- (void)subscribeAttributeRxErrOtherCountWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C90E8, v20, v18, v9, v8);
}

+ (void)readAttributeRxErrOtherCountWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 55, v10, v11);
}

- (void)readAttributeActiveTimestampWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9100, 0, v12, v14);
}

- (void)subscribeAttributeActiveTimestampWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9100, v20, v18, v9, v8);
}

+ (void)readAttributeActiveTimestampWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 56, v10, v11);
}

- (void)readAttributePendingTimestampWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9118, 0, v12, v14);
}

- (void)subscribeAttributePendingTimestampWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9118, v20, v18, v9, v8);
}

+ (void)readAttributePendingTimestampWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 57, v10, v11);
}

- (void)readAttributeDelayWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9130, 0, v12, v14);
}

- (void)subscribeAttributeDelayWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9130, v20, v18, v9, v8);
}

+ (void)readAttributeDelayWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 58, v10, v11);
}

- (void)readAttributeSecurityPolicyWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9148, 0, v12, v14);
}

- (void)subscribeAttributeSecurityPolicyWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9148, v20, v18, v9, v8);
}

+ (void)readAttributeSecurityPolicyWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 59, v10, v11);
}

- (void)readAttributeChannelPage0MaskWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9160, 0, v12, v14);
}

- (void)subscribeAttributeChannelPage0MaskWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9160, v20, v18, v9, v8);
}

+ (void)readAttributeChannelPage0MaskWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 60, v10, v11);
}

- (void)readAttributeOperationalDatasetComponentsWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9178, 0, v12, v14);
}

- (void)subscribeAttributeOperationalDatasetComponentsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9178, v20, v18, v9, v8);
}

+ (void)readAttributeOperationalDatasetComponentsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 61, v10, v11);
}

- (void)readAttributeActiveNetworkFaultsListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C9190, 0, v12, v14);
}

- (void)subscribeAttributeActiveNetworkFaultsListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C9190, v20, v18, v9, v8);
}

+ (void)readAttributeActiveNetworkFaultsListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 62, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9C8EA8, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9C8EA8, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 53, 65533, v10, v11);
}

- (void)resetCountsWithParams:(MTRThreadNetworkDiagnosticsClusterResetCountsParams *)params completionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)resetCountsWithCompletionHandler:(MTRStatusCompletion)completionHandler
{
}

- (void)readAttributeChannelWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D617C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeChannelWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeChannelWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D62FC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeChannelWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeChannelWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D6424;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeChannelWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRoutingRoleWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D64E0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRoutingRoleWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRoutingRoleWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D6660;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRoutingRoleWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRoutingRoleWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D6788;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRoutingRoleWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNetworkNameWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D6844;
  v7[3] = &unk_265198D48;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNetworkNameWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNetworkNameWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D69C4;
  v26[3] = &unk_265198D48;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNetworkNameWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNetworkNameWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D6AEC;
  v18[3] = &unk_265198D48;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNetworkNameWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePanIdWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D6BA8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePanIdWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePanIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D6D28;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePanIdWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePanIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D6E50;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePanIdWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeExtendedPanIdWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D6F0C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeExtendedPanIdWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeExtendedPanIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D708C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeExtendedPanIdWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeExtendedPanIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D71B4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeExtendedPanIdWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeMeshLocalPrefixWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D7270;
  v7[3] = &unk_265198F00;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeMeshLocalPrefixWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeMeshLocalPrefixWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D73F0;
  v26[3] = &unk_265198F00;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeMeshLocalPrefixWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeMeshLocalPrefixWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D7518;
  v18[3] = &unk_265198F00;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeMeshLocalPrefixWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeOverrunCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D75D4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeOverrunCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeOverrunCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D7754;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeOverrunCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeOverrunCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D787C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeOverrunCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeNeighborTableListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D7938;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeNeighborTableWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeNeighborTableListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D7AB8;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeNeighborTableWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeNeighborTableListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D7BE0;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeNeighborTableWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRouteTableListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D7C9C;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRouteTableWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRouteTableListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D7E1C;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRouteTableWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRouteTableListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D7F44;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRouteTableWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePartitionIdWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D8000;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePartitionIdWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePartitionIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D8180;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePartitionIdWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePartitionIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D82A8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePartitionIdWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeWeightingWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D8364;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeWeightingWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeWeightingWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D84E4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeWeightingWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeWeightingWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D860C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeWeightingWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDataVersionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D86C8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDataVersionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDataVersionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D8848;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDataVersionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDataVersionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D8970;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDataVersionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeStableDataVersionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D8A2C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeStableDataVersionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeStableDataVersionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D8BAC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeStableDataVersionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeStableDataVersionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D8CD4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeStableDataVersionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLeaderRouterIdWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D8D90;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLeaderRouterIdWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeLeaderRouterIdWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D8F10;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLeaderRouterIdWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLeaderRouterIdWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D9038;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLeaderRouterIdWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDetachedRoleCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D90F4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDetachedRoleCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDetachedRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D9274;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDetachedRoleCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDetachedRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D939C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDetachedRoleCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeChildRoleCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D9458;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeChildRoleCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeChildRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D95D8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeChildRoleCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeChildRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D9700;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeChildRoleCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRouterRoleCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D97BC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRouterRoleCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRouterRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D993C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRouterRoleCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRouterRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D9A64;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRouterRoleCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeLeaderRoleCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D9B20;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeLeaderRoleCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeLeaderRoleCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448D9CA0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeLeaderRoleCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeLeaderRoleCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448D9DC8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeLeaderRoleCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAttachAttemptCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448D9E84;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAttachAttemptCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAttachAttemptCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DA004;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttachAttemptCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttachAttemptCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DA12C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAttachAttemptCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePartitionIdChangeCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DA1E8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePartitionIdChangeCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePartitionIdChangeCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DA368;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePartitionIdChangeCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePartitionIdChangeCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DA490;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePartitionIdChangeCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeBetterPartitionAttachAttemptCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DA54C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeBetterPartitionAttachAttemptCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeBetterPartitionAttachAttemptCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DA6CC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeBetterPartitionAttachAttemptCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeBetterPartitionAttachAttemptCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DA7F4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeBetterPartitionAttachAttemptCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeParentChangeCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DA8B0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeParentChangeCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeParentChangeCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DAA30;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeParentChangeCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeParentChangeCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DAB58;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeParentChangeCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxTotalCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DAC14;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxTotalCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxTotalCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DAD94;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxTotalCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxTotalCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DAEBC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxTotalCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxUnicastCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DAF78;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxUnicastCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxUnicastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DB0F8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxUnicastCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxUnicastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DB220;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxUnicastCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxBroadcastCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DB2DC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxBroadcastCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxBroadcastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DB45C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxBroadcastCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxBroadcastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DB584;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxBroadcastCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxAckRequestedCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DB640;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxAckRequestedCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxAckRequestedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DB7C0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxAckRequestedCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxAckRequestedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DB8E8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxAckRequestedCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxAckedCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DB9A4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxAckedCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxAckedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DBB24;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxAckedCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxAckedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DBC4C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxAckedCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxNoAckRequestedCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DBD08;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxNoAckRequestedCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxNoAckRequestedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DBE88;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxNoAckRequestedCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxNoAckRequestedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DBFB0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxNoAckRequestedCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxDataCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DC06C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxDataCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxDataCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DC1EC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxDataCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxDataCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DC314;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxDataCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxDataPollCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DC3D0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxDataPollCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxDataPollCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DC550;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxDataPollCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxDataPollCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DC678;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxDataPollCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxBeaconCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DC734;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxBeaconCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxBeaconCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DC8B4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxBeaconCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxBeaconCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DC9DC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxBeaconCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxBeaconRequestCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DCA98;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxBeaconRequestCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxBeaconRequestCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DCC18;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxBeaconRequestCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxBeaconRequestCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DCD40;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxBeaconRequestCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxOtherCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DCDFC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxOtherCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxOtherCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DCF7C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxOtherCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxOtherCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DD0A4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxOtherCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxRetryCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DD160;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxRetryCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxRetryCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DD2E0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxRetryCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxRetryCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DD408;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxRetryCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxDirectMaxRetryExpiryCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DD4C4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxDirectMaxRetryExpiryCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxDirectMaxRetryExpiryCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DD644;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxDirectMaxRetryExpiryCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxDirectMaxRetryExpiryCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DD76C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxDirectMaxRetryExpiryCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxIndirectMaxRetryExpiryCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DD828;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxIndirectMaxRetryExpiryCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxIndirectMaxRetryExpiryCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DD9A8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxIndirectMaxRetryExpiryCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxIndirectMaxRetryExpiryCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DDAD0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxIndirectMaxRetryExpiryCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxErrCcaCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DDB8C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxErrCcaCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxErrCcaCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DDD0C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxErrCcaCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxErrCcaCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DDE34;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxErrCcaCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxErrAbortCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DDEF0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxErrAbortCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxErrAbortCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DE070;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxErrAbortCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxErrAbortCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DE198;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxErrAbortCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeTxErrBusyChannelCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DE254;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeTxErrBusyChannelCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeTxErrBusyChannelCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DE3D4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeTxErrBusyChannelCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeTxErrBusyChannelCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DE4FC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeTxErrBusyChannelCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxTotalCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DE5B8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxTotalCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxTotalCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DE738;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxTotalCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxTotalCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DE860;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxTotalCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxUnicastCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DE91C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxUnicastCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxUnicastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DEA9C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxUnicastCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxUnicastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DEBC4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxUnicastCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxBroadcastCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DEC80;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxBroadcastCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxBroadcastCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DEE00;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxBroadcastCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxBroadcastCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DEF28;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxBroadcastCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxDataCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DEFE4;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxDataCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxDataCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DF164;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxDataCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxDataCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DF28C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxDataCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxDataPollCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DF348;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxDataPollCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxDataPollCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DF4C8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxDataPollCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxDataPollCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DF5F0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxDataPollCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxBeaconCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DF6AC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxBeaconCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxBeaconCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DF82C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxBeaconCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxBeaconCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DF954;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxBeaconCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxBeaconRequestCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DFA10;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxBeaconRequestCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxBeaconRequestCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DFB90;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxBeaconRequestCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxBeaconRequestCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448DFCB8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxBeaconRequestCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxOtherCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448DFD74;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxOtherCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxOtherCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448DFEF4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxOtherCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxOtherCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E001C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxOtherCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxAddressFilteredCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E00D8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxAddressFilteredCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxAddressFilteredCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E0258;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxAddressFilteredCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxAddressFilteredCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E0380;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxAddressFilteredCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxDestAddrFilteredCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E043C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxDestAddrFilteredCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxDestAddrFilteredCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E05BC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxDestAddrFilteredCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxDestAddrFilteredCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E06E4;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxDestAddrFilteredCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxDuplicatedCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E07A0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxDuplicatedCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxDuplicatedCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E0920;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxDuplicatedCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxDuplicatedCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E0A48;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxDuplicatedCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxErrNoFrameCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E0B04;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxErrNoFrameCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxErrNoFrameCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E0C84;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxErrNoFrameCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxErrNoFrameCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E0DAC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxErrNoFrameCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxErrUnknownNeighborCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E0E68;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxErrUnknownNeighborCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxErrUnknownNeighborCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E0FE8;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxErrUnknownNeighborCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxErrUnknownNeighborCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E1110;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxErrUnknownNeighborCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxErrInvalidSrcAddrCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E11CC;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxErrInvalidSrcAddrCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxErrInvalidSrcAddrCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E134C;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxErrInvalidSrcAddrCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxErrInvalidSrcAddrCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E1474;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxErrInvalidSrcAddrCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxErrSecCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E1530;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxErrSecCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxErrSecCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E16B0;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxErrSecCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxErrSecCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E17D8;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxErrSecCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxErrFcsCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E1894;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxErrFcsCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxErrFcsCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E1A14;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxErrFcsCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxErrFcsCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E1B3C;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxErrFcsCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeRxErrOtherCountWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E1BF8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeRxErrOtherCountWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeRxErrOtherCountWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E1D78;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeRxErrOtherCountWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeRxErrOtherCountWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E1EA0;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeRxErrOtherCountWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActiveTimestampWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E1F5C;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActiveTimestampWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActiveTimestampWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E20DC;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActiveTimestampWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActiveTimestampWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E2204;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActiveTimestampWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributePendingTimestampWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E22C0;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributePendingTimestampWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributePendingTimestampWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E2440;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributePendingTimestampWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributePendingTimestampWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E2568;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributePendingTimestampWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeDelayWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E2624;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeDelayWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeDelayWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E27A4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeDelayWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeDelayWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E28CC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeDelayWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeSecurityPolicyWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E2988;
  v7[3] = &unk_265198F50;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeSecurityPolicyWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeSecurityPolicyWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E2B08;
  v26[3] = &unk_265198F50;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeSecurityPolicyWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeSecurityPolicyWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E2C30;
  v18[3] = &unk_265198F50;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeSecurityPolicyWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeChannelPage0MaskWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E2CEC;
  v7[3] = &unk_265198F00;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeChannelPage0MaskWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeChannelPage0MaskWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E2E6C;
  v26[3] = &unk_265198F00;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeChannelPage0MaskWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeChannelPage0MaskWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E2F94;
  v18[3] = &unk_265198F00;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeChannelPage0MaskWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeOperationalDatasetComponentsWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E3050;
  v7[3] = &unk_265198F78;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeOperationalDatasetComponentsWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeOperationalDatasetComponentsWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E31D0;
  v26[3] = &unk_265198F78;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeOperationalDatasetComponentsWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeOperationalDatasetComponentsWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E32F8;
  v18[3] = &unk_265198F78;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeOperationalDatasetComponentsWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeActiveNetworkFaultsListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E33B4;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeActiveNetworkFaultsListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeActiveNetworkFaultsListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E3534;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeActiveNetworkFaultsListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeActiveNetworkFaultsListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E365C;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeActiveNetworkFaultsListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeGeneratedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E3718;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeGeneratedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeGeneratedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E3898;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeGeneratedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeGeneratedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E39C0;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeGeneratedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAcceptedCommandListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E3A7C;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAcceptedCommandListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAcceptedCommandListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E3BFC;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAcceptedCommandListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAcceptedCommandListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E3D24;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAcceptedCommandListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeAttributeListWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E3DE0;
  v7[3] = &unk_265198C80;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeAttributeListWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeAttributeListWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E3F60;
  v26[3] = &unk_265198C80;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeAttributeListWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeAttributeListWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E4088;
  v18[3] = &unk_265198C80;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeAttributeListWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeFeatureMapWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E4144;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeFeatureMapWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeFeatureMapWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E42C4;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeFeatureMapWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeFeatureMapWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E43EC;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeFeatureMapWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (void)readAttributeClusterRevisionWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_2448E44A8;
  v7[3] = &unk_265198C58;
  id v8 = v4;
  id v5 = v4;
  objc_msgSend_readAttributeClusterRevisionWithCompletion_(self, v6, (uint64_t)v7);
}

- (void)subscribeAttributeClusterRevisionWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval params:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablishedHandler reportHandler:(void *)reportHandler
{
  v12 = minInterval;
  uint64_t v13 = maxInterval;
  MTRSubscriptionEstablishedHandler v14 = subscriptionEstablishedHandler;
  v15 = reportHandler;
  v18 = objc_msgSend_copy(params, v16, v17);
  id v20 = v18;
  if (v18)
  {
    objc_msgSend_setMinInterval_(v18, v19, (uint64_t)v12);
    objc_msgSend_setMaxInterval_(v20, v21, (uint64_t)v13);
  }
  else
  {
    v22 = [MTRSubscribeParams alloc];
    id v20 = objc_msgSend_initWithMinInterval_maxInterval_(v22, v23, (uint64_t)v12, v13);
  }
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_2448E4628;
  v26[3] = &unk_265198C58;
  id v24 = v15;
  id v27 = v24;
  objc_msgSend_subscribeAttributeClusterRevisionWithParams_subscriptionEstablished_reportHandler_(self, v25, (uint64_t)v20, v14, v26);
}

+ (void)readAttributeClusterRevisionWithAttributeCache:(MTRAttributeCacheContainer *)attributeCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completionHandler:(void *)completionHandler
{
  id v10 = endpoint;
  uint64_t v11 = queue;
  v12 = completionHandler;
  v15 = objc_msgSend_realContainer(attributeCacheContainer, v13, v14);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_2448E4750;
  v18[3] = &unk_265198C58;
  id v16 = v12;
  id v19 = v16;
  objc_msgSend_readAttributeClusterRevisionWithClusterStateCache_endpoint_queue_completion_(a1, v17, (uint64_t)v15, v10, v11, v18);
}

- (MTRBaseClusterThreadNetworkDiagnostics)initWithDevice:(MTRBaseDevice *)device endpoint:(uint16_t)endpoint queue:(dispatch_queue_t)queue
{
  uint64_t v6 = endpoint;
  id v8 = device;
  id v9 = queue;
  uint64_t v11 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v10, v6);
  uint64_t v13 = (MTRBaseClusterThreadNetworkDiagnostics *)objc_msgSend_initWithDevice_endpointID_queue_(self, v12, (uint64_t)v8, v11, v9);

  return v13;
}

@end