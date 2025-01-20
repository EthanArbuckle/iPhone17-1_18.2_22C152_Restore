@interface MTRBaseClusterUnitTesting
+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBitmap16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBitmap32WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBitmap64WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBitmap8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeCharStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterErrorBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnum16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnum8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEnumAttrWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEpochSWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEpochUsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFailureInt32UWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFloatDoubleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeFloatSingleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneralErrorBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeGlobalEnumWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeGlobalStructWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt24sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt24uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt32sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt32uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt40sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt40uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt48sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt48uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt56sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt56uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt64sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt64uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeListFabricScopedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeListInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeListLongOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeListNullablesAndOptionalsStructWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeListOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeListStructOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLongCharStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeLongOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeMeiInt8uWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNullableBitmap16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableBitmap32WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableBitmap64WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableBitmap8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableCharStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableEnum16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableEnum8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableEnumAttrWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableFloatDoubleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableFloatSingleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableGlobalEnumWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNullableGlobalStructWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeNullableInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt24sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt24uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt32sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt32uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt40sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt40uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt48sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt48uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt56sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt56uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt64sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt64uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableRangeRestrictedInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableRangeRestrictedInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableRangeRestrictedInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableRangeRestrictedInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeNullableStructWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRangeRestrictedInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRangeRestrictedInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRangeRestrictedInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeRangeRestrictedInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeReadFailureCodeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)readAttributeStructAttrWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeTimedWriteBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeUnsupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeVendorIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
+ (void)readAttributeWriteOnlyInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion;
- (void)globalEchoRequestWithParams:(id)a3 completion:(id)a4;
- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion;
- (void)readAttributeAttributeListWithCompletion:(void *)completion;
- (void)readAttributeBitmap16WithCompletion:(void *)completion;
- (void)readAttributeBitmap32WithCompletion:(void *)completion;
- (void)readAttributeBitmap64WithCompletion:(void *)completion;
- (void)readAttributeBitmap8WithCompletion:(void *)completion;
- (void)readAttributeBooleanWithCompletion:(void *)completion;
- (void)readAttributeCharStringWithCompletion:(void *)completion;
- (void)readAttributeClusterErrorBooleanWithCompletion:(void *)completion;
- (void)readAttributeClusterRevisionWithCompletion:(void *)completion;
- (void)readAttributeEnum16WithCompletion:(void *)completion;
- (void)readAttributeEnum8WithCompletion:(void *)completion;
- (void)readAttributeEnumAttrWithCompletion:(void *)completion;
- (void)readAttributeEpochSWithCompletion:(void *)completion;
- (void)readAttributeEpochUsWithCompletion:(void *)completion;
- (void)readAttributeEventListWithCompletion:(id)a3;
- (void)readAttributeFailureInt32UWithCompletion:(id)a3;
- (void)readAttributeFeatureMapWithCompletion:(void *)completion;
- (void)readAttributeFloatDoubleWithCompletion:(void *)completion;
- (void)readAttributeFloatSingleWithCompletion:(void *)completion;
- (void)readAttributeGeneralErrorBooleanWithCompletion:(void *)completion;
- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion;
- (void)readAttributeGlobalEnumWithCompletion:(id)a3;
- (void)readAttributeGlobalStructWithCompletion:(id)a3;
- (void)readAttributeInt16sWithCompletion:(void *)completion;
- (void)readAttributeInt16uWithCompletion:(void *)completion;
- (void)readAttributeInt24sWithCompletion:(void *)completion;
- (void)readAttributeInt24uWithCompletion:(void *)completion;
- (void)readAttributeInt32sWithCompletion:(void *)completion;
- (void)readAttributeInt32uWithCompletion:(void *)completion;
- (void)readAttributeInt40sWithCompletion:(void *)completion;
- (void)readAttributeInt40uWithCompletion:(void *)completion;
- (void)readAttributeInt48sWithCompletion:(void *)completion;
- (void)readAttributeInt48uWithCompletion:(void *)completion;
- (void)readAttributeInt56sWithCompletion:(void *)completion;
- (void)readAttributeInt56uWithCompletion:(void *)completion;
- (void)readAttributeInt64sWithCompletion:(void *)completion;
- (void)readAttributeInt64uWithCompletion:(void *)completion;
- (void)readAttributeInt8sWithCompletion:(void *)completion;
- (void)readAttributeInt8uWithCompletion:(void *)completion;
- (void)readAttributeListFabricScopedWithParams:(MTRReadParams *)params completion:(void *)completion;
- (void)readAttributeListInt8uWithCompletion:(void *)completion;
- (void)readAttributeListLongOctetStringWithCompletion:(void *)completion;
- (void)readAttributeListNullablesAndOptionalsStructWithCompletion:(void *)completion;
- (void)readAttributeListOctetStringWithCompletion:(void *)completion;
- (void)readAttributeListStructOctetStringWithCompletion:(void *)completion;
- (void)readAttributeLongCharStringWithCompletion:(void *)completion;
- (void)readAttributeLongOctetStringWithCompletion:(void *)completion;
- (void)readAttributeMeiInt8uWithCompletion:(id)a3;
- (void)readAttributeNullableBitmap16WithCompletion:(void *)completion;
- (void)readAttributeNullableBitmap32WithCompletion:(void *)completion;
- (void)readAttributeNullableBitmap64WithCompletion:(void *)completion;
- (void)readAttributeNullableBitmap8WithCompletion:(void *)completion;
- (void)readAttributeNullableBooleanWithCompletion:(void *)completion;
- (void)readAttributeNullableCharStringWithCompletion:(void *)completion;
- (void)readAttributeNullableEnum16WithCompletion:(void *)completion;
- (void)readAttributeNullableEnum8WithCompletion:(void *)completion;
- (void)readAttributeNullableEnumAttrWithCompletion:(void *)completion;
- (void)readAttributeNullableFloatDoubleWithCompletion:(void *)completion;
- (void)readAttributeNullableFloatSingleWithCompletion:(void *)completion;
- (void)readAttributeNullableGlobalEnumWithCompletion:(id)a3;
- (void)readAttributeNullableGlobalStructWithCompletion:(id)a3;
- (void)readAttributeNullableInt16sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt16uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt24sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt24uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt32sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt32uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt40sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt40uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt48sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt48uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt56sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt56uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt64sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt64uWithCompletion:(void *)completion;
- (void)readAttributeNullableInt8sWithCompletion:(void *)completion;
- (void)readAttributeNullableInt8uWithCompletion:(void *)completion;
- (void)readAttributeNullableOctetStringWithCompletion:(void *)completion;
- (void)readAttributeNullableRangeRestrictedInt16sWithCompletion:(void *)completion;
- (void)readAttributeNullableRangeRestrictedInt16uWithCompletion:(void *)completion;
- (void)readAttributeNullableRangeRestrictedInt8sWithCompletion:(void *)completion;
- (void)readAttributeNullableRangeRestrictedInt8uWithCompletion:(void *)completion;
- (void)readAttributeNullableStructWithCompletion:(void *)completion;
- (void)readAttributeOctetStringWithCompletion:(void *)completion;
- (void)readAttributeRangeRestrictedInt16sWithCompletion:(void *)completion;
- (void)readAttributeRangeRestrictedInt16uWithCompletion:(void *)completion;
- (void)readAttributeRangeRestrictedInt8sWithCompletion:(void *)completion;
- (void)readAttributeRangeRestrictedInt8uWithCompletion:(void *)completion;
- (void)readAttributeReadFailureCodeWithCompletion:(id)a3;
- (void)readAttributeStructAttrWithCompletion:(void *)completion;
- (void)readAttributeTimedWriteBooleanWithCompletion:(void *)completion;
- (void)readAttributeUnsupportedWithCompletion:(void *)completion;
- (void)readAttributeVendorIdWithCompletion:(void *)completion;
- (void)readAttributeWriteOnlyInt8uWithCompletion:(void *)completion;
- (void)simpleStructEchoRequestWithParams:(MTRUnitTestingClusterSimpleStructEchoRequestParams *)params completion:(void *)completion;
- (void)stringEchoRequestWithParams:(id)a3 completion:(id)a4;
- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBitmap16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBitmap32WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBitmap64WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBitmap8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeCharStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterErrorBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnum16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnum8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEnumAttrWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEpochSWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEpochUsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFailureInt32UWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFloatDoubleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeFloatSingleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneralErrorBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeGlobalEnumWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeGlobalStructWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt24sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt24uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt32sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt32uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt40sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt40uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt48sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt48uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt56sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt56uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt64sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt64uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeListFabricScopedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeListInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeListLongOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeListNullablesAndOptionalsStructWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeListOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeListStructOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLongCharStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeLongOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeMeiInt8uWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNullableBitmap16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableBitmap32WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableBitmap64WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableBitmap8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableCharStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableEnum16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableEnum8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableEnumAttrWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableFloatDoubleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableFloatSingleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableGlobalEnumWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNullableGlobalStructWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeNullableInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt24sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt24uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt32sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt32uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt40sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt40uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt48sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt48uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt56sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt56uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt64sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt64uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableRangeRestrictedInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableRangeRestrictedInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableRangeRestrictedInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableRangeRestrictedInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeNullableStructWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRangeRestrictedInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRangeRestrictedInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRangeRestrictedInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeRangeRestrictedInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeReadFailureCodeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5;
- (void)subscribeAttributeStructAttrWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeTimedWriteBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeUnsupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeVendorIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)subscribeAttributeWriteOnlyInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler;
- (void)testAddArgumentsWithParams:(MTRUnitTestingClusterTestAddArgumentsParams *)params completion:(void *)completion;
- (void)testBatchHelperRequestWithParams:(id)a3 completion:(id)a4;
- (void)testComplexNullableOptionalRequestWithParams:(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams *)params completion:(void *)completion;
- (void)testDifferentVendorMeiRequestWithParams:(id)a3 completion:(id)a4;
- (void)testEmitTestEventRequestWithParams:(MTRUnitTestingClusterTestEmitTestEventRequestParams *)params completion:(void *)completion;
- (void)testEmitTestFabricScopedEventRequestWithParams:(MTRUnitTestingClusterTestEmitTestFabricScopedEventRequestParams *)params completion:(void *)completion;
- (void)testEnumsRequestWithParams:(MTRUnitTestingClusterTestEnumsRequestParams *)params completion:(void *)completion;
- (void)testListInt8UArgumentRequestWithParams:(MTRUnitTestingClusterTestListInt8UArgumentRequestParams *)params completion:(void *)completion;
- (void)testListInt8UReverseRequestWithParams:(MTRUnitTestingClusterTestListInt8UReverseRequestParams *)params completion:(void *)completion;
- (void)testListNestedStructListArgumentRequestWithParams:(MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams *)params completion:(void *)completion;
- (void)testListStructArgumentRequestWithParams:(MTRUnitTestingClusterTestListStructArgumentRequestParams *)params completion:(void *)completion;
- (void)testNestedStructArgumentRequestWithParams:(MTRUnitTestingClusterTestNestedStructArgumentRequestParams *)params completion:(void *)completion;
- (void)testNestedStructListArgumentRequestWithParams:(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *)params completion:(void *)completion;
- (void)testNotHandledWithCompletion:(MTRStatusCompletion)completion;
- (void)testNotHandledWithParams:(MTRUnitTestingClusterTestNotHandledParams *)params completion:(MTRStatusCompletion)completion;
- (void)testNullableOptionalRequestWithCompletion:(id)a3;
- (void)testNullableOptionalRequestWithParams:(MTRUnitTestingClusterTestNullableOptionalRequestParams *)params completion:(void *)completion;
- (void)testSecondBatchHelperRequestWithParams:(id)a3 completion:(id)a4;
- (void)testSimpleArgumentRequestWithParams:(MTRUnitTestingClusterTestSimpleArgumentRequestParams *)params completion:(void *)completion;
- (void)testSimpleOptionalArgumentRequestWithCompletion:(id)a3;
- (void)testSimpleOptionalArgumentRequestWithParams:(MTRUnitTestingClusterTestSimpleOptionalArgumentRequestParams *)params completion:(MTRStatusCompletion)completion;
- (void)testSpecificWithCompletion:(void *)completion;
- (void)testSpecificWithParams:(MTRUnitTestingClusterTestSpecificParams *)params completion:(void *)completion;
- (void)testStructArgumentRequestWithParams:(MTRUnitTestingClusterTestStructArgumentRequestParams *)params completion:(void *)completion;
- (void)testStructArrayArgumentRequestWithParams:(MTRUnitTestingClusterTestStructArrayArgumentRequestParams *)params completion:(void *)completion;
- (void)testUnknownCommandWithCompletion:(MTRStatusCompletion)completion;
- (void)testUnknownCommandWithParams:(MTRUnitTestingClusterTestUnknownCommandParams *)params completion:(MTRStatusCompletion)completion;
- (void)testWithCompletion:(MTRStatusCompletion)completion;
- (void)testWithParams:(MTRUnitTestingClusterTestParams *)params completion:(MTRStatusCompletion)completion;
- (void)timedInvokeRequestWithCompletion:(MTRStatusCompletion)completion;
- (void)timedInvokeRequestWithParams:(MTRUnitTestingClusterTimedInvokeRequestParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap32WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap32WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap64WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap64WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBitmap8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeCharStringWithValue:(NSString *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeCharStringWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeClusterErrorBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeClusterErrorBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnum16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnum16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnum8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnum8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnumAttrWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEnumAttrWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEpochSWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEpochSWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEpochUsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeEpochUsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeFailureInt32UWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeFailureInt32UWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeFloatDoubleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeFloatDoubleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeFloatSingleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeFloatSingleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeGeneralErrorBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeGeneralErrorBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeGlobalEnumWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeGlobalEnumWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeGlobalStructWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeGlobalStructWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt24sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt24sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt24uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt24uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt32sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt32sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt32uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt32uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt40sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt40sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt40uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt40uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt48sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt48sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt48uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt48uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt56sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt56sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt56uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt56uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt64sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt64sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt64uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt64uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListFabricScopedWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListFabricScopedWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListInt8uWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListInt8uWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListLongOctetStringWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListLongOctetStringWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListNullablesAndOptionalsStructWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListNullablesAndOptionalsStructWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListOctetStringWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListOctetStringWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListStructOctetStringWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeListStructOctetStringWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLongCharStringWithValue:(NSString *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLongCharStringWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLongOctetStringWithValue:(NSData *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeLongOctetStringWithValue:(NSData *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeMeiInt8uWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeMeiInt8uWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeNullableBitmap16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap32WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap32WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap64WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap64WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBitmap8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableCharStringWithValue:(NSString *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableCharStringWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableEnum16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableEnum16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableEnum8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableEnum8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableEnumAttrWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableEnumAttrWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableFloatDoubleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableFloatDoubleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableFloatSingleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableFloatSingleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableGlobalEnumWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeNullableGlobalEnumWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeNullableGlobalStructWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeNullableGlobalStructWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeNullableInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt24sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt24sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt24uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt24uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt32sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt32sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt32uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt32uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt40sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt40sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt40uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt40uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt48sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt48sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt48uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt48uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt56sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt56sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt56uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt56uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt64sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt64sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt64uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt64uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableOctetStringWithValue:(NSData *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableOctetStringWithValue:(NSData *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableRangeRestrictedInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableStructWithValue:(MTRUnitTestingClusterSimpleStruct *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeNullableStructWithValue:(MTRUnitTestingClusterSimpleStruct *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOctetStringWithValue:(NSData *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeOctetStringWithValue:(NSData *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeRangeRestrictedInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeReadFailureCodeWithValue:(id)a3 completion:(id)a4;
- (void)writeAttributeReadFailureCodeWithValue:(id)a3 params:(id)a4 completion:(id)a5;
- (void)writeAttributeStructAttrWithValue:(MTRUnitTestingClusterSimpleStruct *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeStructAttrWithValue:(MTRUnitTestingClusterSimpleStruct *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeTimedWriteBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeTimedWriteBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeUnsupportedWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeUnsupportedWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeVendorIdWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeVendorIdWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
- (void)writeAttributeWriteOnlyInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion;
- (void)writeAttributeWriteOnlyInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion;
@end

@implementation MTRBaseClusterUnitTesting

- (void)testWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)testWithParams:(MTRUnitTestingClusterTestParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_244A93B54;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C87D0, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)testNotHandledWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)testNotHandledWithParams:(MTRUnitTestingClusterTestNotHandledParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestNotHandledParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  v28 = sub_244A93D4C;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8848, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)testSpecificWithCompletion:(void *)completion
{
}

- (void)testSpecificWithParams:(MTRUnitTestingClusterTestSpecificParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestSpecificParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A93F54;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8860, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testUnknownCommandWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)testUnknownCommandWithParams:(MTRUnitTestingClusterTestUnknownCommandParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestUnknownCommandParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_244A94148;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8878, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)testAddArgumentsWithParams:(MTRUnitTestingClusterTestAddArgumentsParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestAddArgumentsParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A94344;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8890, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testSimpleArgumentRequestWithParams:(MTRUnitTestingClusterTestSimpleArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestSimpleArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A9453C;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C88A8, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testStructArrayArgumentRequestWithParams:(MTRUnitTestingClusterTestStructArrayArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestStructArrayArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A94734;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8980, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testStructArgumentRequestWithParams:(MTRUnitTestingClusterTestStructArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestStructArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A9492C;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8998, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testNestedStructArgumentRequestWithParams:(MTRUnitTestingClusterTestNestedStructArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A94B24;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C89B0, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testListStructArgumentRequestWithParams:(MTRUnitTestingClusterTestListStructArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestListStructArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A94D1C;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8B48, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testListInt8UArgumentRequestWithParams:(MTRUnitTestingClusterTestListInt8UArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestListInt8UArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A94F14;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8B60, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testNestedStructListArgumentRequestWithParams:(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestNestedStructListArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A9510C;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C8B78, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testListNestedStructListArgumentRequestWithParams:(MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestListNestedStructListArgumentRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A95304;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C96E8, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testListInt8UReverseRequestWithParams:(MTRUnitTestingClusterTestListInt8UReverseRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestListInt8UReverseRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A954FC;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C9700, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testEnumsRequestWithParams:(MTRUnitTestingClusterTestEnumsRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestEnumsRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A956F4;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C9718, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testNullableOptionalRequestWithCompletion:(id)a3
{
}

- (void)testNullableOptionalRequestWithParams:(MTRUnitTestingClusterTestNullableOptionalRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestNullableOptionalRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A958F8;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C9730, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testComplexNullableOptionalRequestWithParams:(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestComplexNullableOptionalRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A95AF0;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C9748, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)simpleStructEchoRequestWithParams:(MTRUnitTestingClusterSimpleStructEchoRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterSimpleStructEchoRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A95CE8;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  v18 = objc_msgSend_endpointID(self, v16, v17);
  v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C9760, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)timedInvokeRequestWithCompletion:(MTRStatusCompletion)completion
{
}

- (void)timedInvokeRequestWithParams:(MTRUnitTestingClusterTimedInvokeRequestParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTimedInvokeRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A95EE8;
  id v30 = &unk_265198C08;
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
  uint64_t v22 = objc_msgSend_serverSideProcessingTimeout(v6, v20, v21);
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v16, v26, (uint64_t)v19, &unk_26F9CA1E0, &unk_26F9C9778, v6, v15, v22, 0, v25, v9, v27, v28, v29, v30);
}

- (void)testSimpleOptionalArgumentRequestWithCompletion:(id)a3
{
}

- (void)testSimpleOptionalArgumentRequestWithParams:(MTRUnitTestingClusterTestSimpleOptionalArgumentRequestParams *)params completion:(MTRStatusCompletion)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestSimpleOptionalArgumentRequestParams);
  }
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  uint64_t v28 = sub_244A960E0;
  v29 = &unk_265198C08;
  id v8 = v7;
  id v30 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v26);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v24 = objc_msgSend_callbackQueue(self, v22, v23);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v25, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9C9790, v6, v12, v21, 0, v24, v9, v26, v27, v28, v29);
}

- (void)testEmitTestEventRequestWithParams:(MTRUnitTestingClusterTestEmitTestEventRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestEmitTestEventRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A962DC;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA1F8, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testEmitTestFabricScopedEventRequestWithParams:(MTRUnitTestingClusterTestEmitTestFabricScopedEventRequestParams *)params completion:(void *)completion
{
  v6 = params;
  MTRStatusCompletion v7 = completion;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestEmitTestFabricScopedEventRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A964D4;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA210, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testBatchHelperRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRUnitTestingClusterTestBatchHelperRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestBatchHelperRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A966CC;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA228, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testSecondBatchHelperRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRUnitTestingClusterTestSecondBatchHelperRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestSecondBatchHelperRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A968C4;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA240, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)stringEchoRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRUnitTestingClusterStringEchoRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterStringEchoRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A96ABC;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA258, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)globalEchoRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRUnitTestingClusterGlobalEchoRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterGlobalEchoRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A96CB4;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA270, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)testDifferentVendorMeiRequestWithParams:(id)a3 completion:(id)a4
{
  v6 = (MTRUnitTestingClusterTestDifferentVendorMeiRequestParams *)a3;
  id v7 = a4;
  if (!v6) {
    v6 = objc_alloc_init(MTRUnitTestingClusterTestDifferentVendorMeiRequestParams);
  }
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = sub_244A96EAC;
  id v30 = &unk_265198C08;
  id v8 = v7;
  id v31 = v8;
  v9 = (void *)MEMORY[0x2456969D0](&v27);
  uint64_t v12 = objc_msgSend_timedInvokeTimeoutMs(v6, v10, v11);
  v15 = objc_msgSend_device(self, v13, v14);
  uint64_t v18 = objc_msgSend_endpointID(self, v16, v17);
  uint64_t v21 = objc_msgSend_serverSideProcessingTimeout(v6, v19, v20);
  uint64_t v22 = objc_opt_class();
  v25 = objc_msgSend_callbackQueue(self, v23, v24);
  objc_msgSend__invokeKnownCommandWithEndpointID_clusterID_commandID_commandPayload_timedInvokeTimeout_serverSideProcessingTimeout_responseClass_queue_completion_(v15, v26, (uint64_t)v18, &unk_26F9CA1E0, &unk_26F9CA288, v6, v12, v21, v22, v25, v9, v27, v28, v29, v30);
}

- (void)readAttributeBooleanWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8710, 0, v12, v14);
}

- (void)writeAttributeBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8710, v20, v18, v9, v8);
}

+ (void)readAttributeBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 0, v10, v11);
}

- (void)readAttributeBitmap8WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8800, 0, v12, v14);
}

- (void)writeAttributeBitmap8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBitmap8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeBitmap8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8800, v20, v18, v9, v8);
}

+ (void)readAttributeBitmap8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 1, v10, v11);
}

- (void)readAttributeBitmap16WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C89C8, 0, v12, v14);
}

- (void)writeAttributeBitmap16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBitmap16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeBitmap16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C89C8, v20, v18, v9, v8);
}

+ (void)readAttributeBitmap16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 2, v10, v11);
}

- (void)readAttributeBitmap32WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C89E0, 0, v12, v14);
}

- (void)writeAttributeBitmap32WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBitmap32WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeBitmap32WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C89E0, v20, v18, v9, v8);
}

+ (void)readAttributeBitmap32WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 3, v10, v11);
}

- (void)readAttributeBitmap64WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C89F8, 0, v12, v14);
}

- (void)writeAttributeBitmap64WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeBitmap64WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeBitmap64WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C89F8, v20, v18, v9, v8);
}

+ (void)readAttributeBitmap64WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 4, v10, v11);
}

- (void)readAttributeInt8uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8A10, 0, v12, v14);
}

- (void)writeAttributeInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8A10, v20, v18, v9, v8);
}

+ (void)readAttributeInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 5, v10, v11);
}

- (void)readAttributeInt16uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8A28, 0, v12, v14);
}

- (void)writeAttributeInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8A28, v20, v18, v9, v8);
}

+ (void)readAttributeInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 6, v10, v11);
}

- (void)readAttributeInt24uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8BC0, 0, v12, v14);
}

- (void)writeAttributeInt24uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt24uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt24uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8BC0, v20, v18, v9, v8);
}

+ (void)readAttributeInt24uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 7, v10, v11);
}

- (void)readAttributeInt32uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8BD8, 0, v12, v14);
}

- (void)writeAttributeInt32uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt32uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt32uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8BD8, v20, v18, v9, v8);
}

+ (void)readAttributeInt32uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 8, v10, v11);
}

- (void)readAttributeInt40uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8BF0, 0, v12, v14);
}

- (void)writeAttributeInt40uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt40uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt40uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8BF0, v20, v18, v9, v8);
}

+ (void)readAttributeInt40uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 9, v10, v11);
}

- (void)readAttributeInt48uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C08, 0, v12, v14);
}

- (void)writeAttributeInt48uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt48uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt48uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C08, v20, v18, v9, v8);
}

+ (void)readAttributeInt48uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 10, v10, v11);
}

- (void)readAttributeInt56uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C20, 0, v12, v14);
}

- (void)writeAttributeInt56uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt56uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt56uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C20, v20, v18, v9, v8);
}

+ (void)readAttributeInt56uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 11, v10, v11);
}

- (void)readAttributeInt64uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C38, 0, v12, v14);
}

- (void)writeAttributeInt64uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt64uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt64uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C38, v20, v18, v9, v8);
}

+ (void)readAttributeInt64uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 12, v10, v11);
}

- (void)readAttributeInt8sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C50, 0, v12, v14);
}

- (void)writeAttributeInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C50, v20, v18, v9, v8);
}

+ (void)readAttributeInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 13, v10, v11);
}

- (void)readAttributeInt16sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C68, 0, v12, v14);
}

- (void)writeAttributeInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C68, v20, v18, v9, v8);
}

+ (void)readAttributeInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 14, v10, v11);
}

- (void)readAttributeInt24sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8A40, 0, v12, v14);
}

- (void)writeAttributeInt24sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt24sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt24sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8A40, v20, v18, v9, v8);
}

+ (void)readAttributeInt24sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 15, v10, v11);
}

- (void)readAttributeInt32sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8A58, 0, v12, v14);
}

- (void)writeAttributeInt32sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt32sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt32sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8A58, v20, v18, v9, v8);
}

+ (void)readAttributeInt32sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16, v10, v11);
}

- (void)readAttributeInt40sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8A70, 0, v12, v14);
}

- (void)writeAttributeInt40sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt40sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt40sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8A70, v20, v18, v9, v8);
}

+ (void)readAttributeInt40sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 17, v10, v11);
}

- (void)readAttributeInt48sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8A88, 0, v12, v14);
}

- (void)writeAttributeInt48sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt48sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt48sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8A88, v20, v18, v9, v8);
}

+ (void)readAttributeInt48sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 18, v10, v11);
}

- (void)readAttributeInt56sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8AA0, 0, v12, v14);
}

- (void)writeAttributeInt56sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt56sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt56sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8AA0, v20, v18, v9, v8);
}

+ (void)readAttributeInt56sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 19, v10, v11);
}

- (void)readAttributeInt64sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8AB8, 0, v12, v14);
}

- (void)writeAttributeInt64sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeInt64sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeInt64sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8AB8, v20, v18, v9, v8);
}

+ (void)readAttributeInt64sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 20, v10, v11);
}

- (void)readAttributeEnum8WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C80, 0, v12, v14);
}

- (void)writeAttributeEnum8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnum8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnum8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C80, v20, v18, v9, v8);
}

+ (void)readAttributeEnum8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 21, v10, v11);
}

- (void)readAttributeEnum16WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8C98, 0, v12, v14);
}

- (void)writeAttributeEnum16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnum16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnum16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8C98, v20, v18, v9, v8);
}

+ (void)readAttributeEnum16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 22, v10, v11);
}

- (void)readAttributeFloatSingleWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8D58, 0, v12, v14);
}

- (void)writeAttributeFloatSingleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeFloatSingleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeFloatSingleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8D58, v20, v18, v9, v8);
}

+ (void)readAttributeFloatSingleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 23, v10, v11);
}

- (void)readAttributeFloatDoubleWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8D70, 0, v12, v14);
}

- (void)writeAttributeFloatDoubleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeFloatDoubleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeFloatDoubleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8D70, v20, v18, v9, v8);
}

+ (void)readAttributeFloatDoubleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 24, v10, v11);
}

- (void)readAttributeOctetStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8D88, 0, v12, v14);
}

- (void)writeAttributeOctetStringWithValue:(NSData *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeOctetStringWithValue:(NSData *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8D88, v20, v18, v9, v8);
}

+ (void)readAttributeOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 25, v10, v11);
}

- (void)readAttributeListInt8uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8DA0, 0, v12, v14);
}

- (void)writeAttributeListInt8uWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeListInt8uWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeListInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8DA0, v20, v18, v9, v8);
}

+ (void)readAttributeListInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 26, v10, v11);
}

- (void)readAttributeListOctetStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8DB8, 0, v12, v14);
}

- (void)writeAttributeListOctetStringWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeListOctetStringWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeListOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8DB8, v20, v18, v9, v8);
}

+ (void)readAttributeListOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 27, v10, v11);
}

- (void)readAttributeListStructOctetStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8DD0, 0, v12, v14);
}

- (void)writeAttributeListStructOctetStringWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeListStructOctetStringWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeListStructOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8DD0, v20, v18, v9, v8);
}

+ (void)readAttributeListStructOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 28, v10, v11);
}

- (void)readAttributeLongOctetStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8DE8, 0, v12, v14);
}

- (void)writeAttributeLongOctetStringWithValue:(NSData *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeLongOctetStringWithValue:(NSData *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeLongOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8DE8, v20, v18, v9, v8);
}

+ (void)readAttributeLongOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 29, v10, v11);
}

- (void)readAttributeCharStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8E00, 0, v12, v14);
}

- (void)writeAttributeCharStringWithValue:(NSString *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeCharStringWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeCharStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8E00, v20, v18, v9, v8);
}

+ (void)readAttributeCharStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 30, v10, v11);
}

- (void)readAttributeLongCharStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8E18, 0, v12, v14);
}

- (void)writeAttributeLongCharStringWithValue:(NSString *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeLongCharStringWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeLongCharStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8E18, v20, v18, v9, v8);
}

+ (void)readAttributeLongCharStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 31, v10, v11);
}

- (void)readAttributeEpochUsWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8EC0, 0, v12, v14);
}

- (void)writeAttributeEpochUsWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEpochUsWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEpochUsWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8EC0, v20, v18, v9, v8);
}

+ (void)readAttributeEpochUsWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 32, v10, v11);
}

- (void)readAttributeEpochSWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8ED8, 0, v12, v14);
}

- (void)writeAttributeEpochSWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEpochSWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEpochSWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8ED8, v20, v18, v9, v8);
}

+ (void)readAttributeEpochSWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 33, v10, v11);
}

- (void)readAttributeVendorIdWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8EF0, 0, v12, v14);
}

- (void)writeAttributeVendorIdWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeVendorIdWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeVendorIdWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8EF0, v20, v18, v9, v8);
}

+ (void)readAttributeVendorIdWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 34, v10, v11);
}

- (void)readAttributeListNullablesAndOptionalsStructWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F08, 0, v12, v14);
}

- (void)writeAttributeListNullablesAndOptionalsStructWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeListNullablesAndOptionalsStructWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeListNullablesAndOptionalsStructWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F08, v20, v18, v9, v8);
}

+ (void)readAttributeListNullablesAndOptionalsStructWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 35, v10, v11);
}

- (void)readAttributeEnumAttrWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F20, 0, v12, v14);
}

- (void)writeAttributeEnumAttrWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeEnumAttrWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeEnumAttrWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F20, v20, v18, v9, v8);
}

+ (void)readAttributeEnumAttrWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 36, v10, v11);
}

- (void)readAttributeStructAttrWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F38, 0, v12, v14);
}

- (void)writeAttributeStructAttrWithValue:(MTRUnitTestingClusterSimpleStruct *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeStructAttrWithValue:(MTRUnitTestingClusterSimpleStruct *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeStructAttrWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F38, v20, v18, v9, v8);
}

+ (void)readAttributeStructAttrWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 37, v10, v11);
}

- (void)readAttributeRangeRestrictedInt8uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F50, 0, v12, v14);
}

- (void)writeAttributeRangeRestrictedInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRangeRestrictedInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeRangeRestrictedInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F50, v20, v18, v9, v8);
}

+ (void)readAttributeRangeRestrictedInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 38, v10, v11);
}

- (void)readAttributeRangeRestrictedInt8sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F68, 0, v12, v14);
}

- (void)writeAttributeRangeRestrictedInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRangeRestrictedInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeRangeRestrictedInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F68, v20, v18, v9, v8);
}

+ (void)readAttributeRangeRestrictedInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 39, v10, v11);
}

- (void)readAttributeRangeRestrictedInt16uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F80, 0, v12, v14);
}

- (void)writeAttributeRangeRestrictedInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRangeRestrictedInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeRangeRestrictedInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F80, v20, v18, v9, v8);
}

+ (void)readAttributeRangeRestrictedInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 40, v10, v11);
}

- (void)readAttributeRangeRestrictedInt16sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8F98, 0, v12, v14);
}

- (void)writeAttributeRangeRestrictedInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeRangeRestrictedInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeRangeRestrictedInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8F98, v20, v18, v9, v8);
}

+ (void)readAttributeRangeRestrictedInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 41, v10, v11);
}

- (void)readAttributeListLongOctetStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8FB0, 0, v12, v14);
}

- (void)writeAttributeListLongOctetStringWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeListLongOctetStringWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeListLongOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8FB0, v20, v18, v9, v8);
}

+ (void)readAttributeListLongOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 42, v10, v11);
}

- (void)readAttributeListFabricScopedWithParams:(MTRReadParams *)params completion:(void *)completion
{
  uint64_t v17 = params;
  v6 = completion;
  id v9 = objc_msgSend_device(self, v7, v8);
  uint64_t v12 = objc_msgSend_endpointID(self, v10, v11);
  v15 = objc_msgSend_callbackQueue(self, v13, v14);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v9, v16, (uint64_t)v12, &unk_26F9CA1E0, &unk_26F9C8FC8, v17, v15, v6);
}

- (void)writeAttributeListFabricScopedWithValue:(NSArray *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeListFabricScopedWithValue:(NSArray *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeListFabricScopedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8FC8, v20, v18, v9, v8);
}

+ (void)readAttributeListFabricScopedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 43, v10, v11);
}

- (void)readAttributeTimedWriteBooleanWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9040, 0, v12, v14);
}

- (void)writeAttributeTimedWriteBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeTimedWriteBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeTimedWriteBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9040, v20, v18, v9, v8);
}

+ (void)readAttributeTimedWriteBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 48, v10, v11);
}

- (void)readAttributeGeneralErrorBooleanWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9058, 0, v12, v14);
}

- (void)writeAttributeGeneralErrorBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeGeneralErrorBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeGeneralErrorBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9058, v20, v18, v9, v8);
}

+ (void)readAttributeGeneralErrorBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 49, v10, v11);
}

- (void)readAttributeClusterErrorBooleanWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9070, 0, v12, v14);
}

- (void)writeAttributeClusterErrorBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeClusterErrorBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeClusterErrorBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  uint64_t v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9070, v20, v18, v9, v8);
}

+ (void)readAttributeClusterErrorBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 50, v10, v11);
}

- (void)readAttributeGlobalEnumWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9088, 0, v12, v14);
}

- (void)writeAttributeGlobalEnumWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeGlobalEnumWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeGlobalEnumWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9088, v20, v18, v9, v8);
}

+ (void)readAttributeGlobalEnumWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 51, v10, v11);
}

- (void)readAttributeGlobalStructWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C90A0, 0, v12, v14);
}

- (void)writeAttributeGlobalStructWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeGlobalStructWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeGlobalStructWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C90A0, v20, v18, v9, v8);
}

+ (void)readAttributeGlobalStructWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 52, v10, v11);
}

- (void)readAttributeUnsupportedWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA2A0, 0, v12, v14);
}

- (void)writeAttributeUnsupportedWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeUnsupportedWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeUnsupportedWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA2A0, v20, v18, v9, v8);
}

+ (void)readAttributeUnsupportedWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 255, v10, v11);
}

- (void)readAttributeReadFailureCodeWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA2B8, 0, v12, v14);
}

- (void)writeAttributeReadFailureCodeWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeReadFailureCodeWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeReadFailureCodeWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA2B8, v20, v18, v9, v8);
}

+ (void)readAttributeReadFailureCodeWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 12288, v10, v11);
}

- (void)readAttributeFailureInt32UWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA2D0, 0, v12, v14);
}

- (void)writeAttributeFailureInt32UWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeFailureInt32UWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeFailureInt32UWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA2D0, v20, v18, v9, v8);
}

+ (void)readAttributeFailureInt32UWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 12289, v10, v11);
}

- (void)readAttributeNullableBooleanWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8908, 0, v12, v14);
}

- (void)writeAttributeNullableBooleanWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableBooleanWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableBooleanWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8908, v20, v18, v9, v8);
}

+ (void)readAttributeNullableBooleanWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 0x4000, v10, v11);
}

- (void)readAttributeNullableBitmap8WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8920, 0, v12, v14);
}

- (void)writeAttributeNullableBitmap8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableBitmap8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableBitmap8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8920, v20, v18, v9, v8);
}

+ (void)readAttributeNullableBitmap8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16385, v10, v11);
}

- (void)readAttributeNullableBitmap16WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8938, 0, v12, v14);
}

- (void)writeAttributeNullableBitmap16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableBitmap16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableBitmap16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8938, v20, v18, v9, v8);
}

+ (void)readAttributeNullableBitmap16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16386, v10, v11);
}

- (void)readAttributeNullableBitmap32WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8950, 0, v12, v14);
}

- (void)writeAttributeNullableBitmap32WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableBitmap32WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableBitmap32WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8950, v20, v18, v9, v8);
}

+ (void)readAttributeNullableBitmap32WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16387, v10, v11);
}

- (void)readAttributeNullableBitmap64WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9D48, 0, v12, v14);
}

- (void)writeAttributeNullableBitmap64WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableBitmap64WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableBitmap64WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9D48, v20, v18, v9, v8);
}

+ (void)readAttributeNullableBitmap64WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16388, v10, v11);
}

- (void)readAttributeNullableInt8uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9D60, 0, v12, v14);
}

- (void)writeAttributeNullableInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9D60, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16389, v10, v11);
}

- (void)readAttributeNullableInt16uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9D78, 0, v12, v14);
}

- (void)writeAttributeNullableInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9D78, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16390, v10, v11);
}

- (void)readAttributeNullableInt24uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA2E8, 0, v12, v14);
}

- (void)writeAttributeNullableInt24uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt24uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt24uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA2E8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt24uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16391, v10, v11);
}

- (void)readAttributeNullableInt32uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA300, 0, v12, v14);
}

- (void)writeAttributeNullableInt32uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt32uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt32uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA300, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt32uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16392, v10, v11);
}

- (void)readAttributeNullableInt40uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA318, 0, v12, v14);
}

- (void)writeAttributeNullableInt40uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt40uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt40uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA318, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt40uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16393, v10, v11);
}

- (void)readAttributeNullableInt48uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9D90, 0, v12, v14);
}

- (void)writeAttributeNullableInt48uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt48uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt48uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9D90, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt48uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16394, v10, v11);
}

- (void)readAttributeNullableInt56uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9DA8, 0, v12, v14);
}

- (void)writeAttributeNullableInt56uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt56uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt56uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9DA8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt56uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16395, v10, v11);
}

- (void)readAttributeNullableInt64uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9DC0, 0, v12, v14);
}

- (void)writeAttributeNullableInt64uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt64uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt64uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9DC0, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt64uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16396, v10, v11);
}

- (void)readAttributeNullableInt8sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9DD8, 0, v12, v14);
}

- (void)writeAttributeNullableInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9DD8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16397, v10, v11);
}

- (void)readAttributeNullableInt16sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA330, 0, v12, v14);
}

- (void)writeAttributeNullableInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA330, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16398, v10, v11);
}

- (void)readAttributeNullableInt24sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA348, 0, v12, v14);
}

- (void)writeAttributeNullableInt24sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt24sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt24sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA348, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt24sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16399, v10, v11);
}

- (void)readAttributeNullableInt32sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C9DF0, 0, v12, v14);
}

- (void)writeAttributeNullableInt32sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt32sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt32sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C9DF0, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt32sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16400, v10, v11);
}

- (void)readAttributeNullableInt40sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA360, 0, v12, v14);
}

- (void)writeAttributeNullableInt40sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt40sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt40sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA360, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt40sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16401, v10, v11);
}

- (void)readAttributeNullableInt48sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA378, 0, v12, v14);
}

- (void)writeAttributeNullableInt48sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt48sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt48sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA378, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt48sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16402, v10, v11);
}

- (void)readAttributeNullableInt56sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA390, 0, v12, v14);
}

- (void)writeAttributeNullableInt56sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt56sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt56sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA390, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt56sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16403, v10, v11);
}

- (void)readAttributeNullableInt64sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA3A8, 0, v12, v14);
}

- (void)writeAttributeNullableInt64sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableInt64sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableInt64sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA3A8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableInt64sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16404, v10, v11);
}

- (void)readAttributeNullableEnum8WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA3C0, 0, v12, v14);
}

- (void)writeAttributeNullableEnum8WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableEnum8WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableEnum8WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA3C0, v20, v18, v9, v8);
}

+ (void)readAttributeNullableEnum8WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16405, v10, v11);
}

- (void)readAttributeNullableEnum16WithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA3D8, 0, v12, v14);
}

- (void)writeAttributeNullableEnum16WithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableEnum16WithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableEnum16WithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA3D8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableEnum16WithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16406, v10, v11);
}

- (void)readAttributeNullableFloatSingleWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA3F0, 0, v12, v14);
}

- (void)writeAttributeNullableFloatSingleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableFloatSingleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableFloatSingleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA3F0, v20, v18, v9, v8);
}

+ (void)readAttributeNullableFloatSingleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16407, v10, v11);
}

- (void)readAttributeNullableFloatDoubleWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA408, 0, v12, v14);
}

- (void)writeAttributeNullableFloatDoubleWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableFloatDoubleWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableFloatDoubleWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA408, v20, v18, v9, v8);
}

+ (void)readAttributeNullableFloatDoubleWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16408, v10, v11);
}

- (void)readAttributeNullableOctetStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA420, 0, v12, v14);
}

- (void)writeAttributeNullableOctetStringWithValue:(NSData *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableOctetStringWithValue:(NSData *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableOctetStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA420, v20, v18, v9, v8);
}

+ (void)readAttributeNullableOctetStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16409, v10, v11);
}

- (void)readAttributeNullableCharStringWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA438, 0, v12, v14);
}

- (void)writeAttributeNullableCharStringWithValue:(NSString *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableCharStringWithValue:(NSString *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableCharStringWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA438, v20, v18, v9, v8);
}

+ (void)readAttributeNullableCharStringWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16414, v10, v11);
}

- (void)readAttributeNullableEnumAttrWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA450, 0, v12, v14);
}

- (void)writeAttributeNullableEnumAttrWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableEnumAttrWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableEnumAttrWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA450, v20, v18, v9, v8);
}

+ (void)readAttributeNullableEnumAttrWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16420, v10, v11);
}

- (void)readAttributeNullableStructWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA468, 0, v12, v14);
}

- (void)writeAttributeNullableStructWithValue:(MTRUnitTestingClusterSimpleStruct *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableStructWithValue:(MTRUnitTestingClusterSimpleStruct *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableStructWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA468, v20, v18, v9, v8);
}

+ (void)readAttributeNullableStructWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16421, v10, v11);
}

- (void)readAttributeNullableRangeRestrictedInt8uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA480, 0, v12, v14);
}

- (void)writeAttributeNullableRangeRestrictedInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableRangeRestrictedInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableRangeRestrictedInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA480, v20, v18, v9, v8);
}

+ (void)readAttributeNullableRangeRestrictedInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16422, v10, v11);
}

- (void)readAttributeNullableRangeRestrictedInt8sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA498, 0, v12, v14);
}

- (void)writeAttributeNullableRangeRestrictedInt8sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableRangeRestrictedInt8sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableRangeRestrictedInt8sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA498, v20, v18, v9, v8);
}

+ (void)readAttributeNullableRangeRestrictedInt8sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16423, v10, v11);
}

- (void)readAttributeNullableRangeRestrictedInt16uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA4B0, 0, v12, v14);
}

- (void)writeAttributeNullableRangeRestrictedInt16uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableRangeRestrictedInt16uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableRangeRestrictedInt16uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA4B0, v20, v18, v9, v8);
}

+ (void)readAttributeNullableRangeRestrictedInt16uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16424, v10, v11);
}

- (void)readAttributeNullableRangeRestrictedInt16sWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA4C8, 0, v12, v14);
}

- (void)writeAttributeNullableRangeRestrictedInt16sWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeNullableRangeRestrictedInt16sWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableRangeRestrictedInt16sWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA4C8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableRangeRestrictedInt16sWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16425, v10, v11);
}

- (void)readAttributeWriteOnlyInt8uWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA4E0, 0, v12, v14);
}

- (void)writeAttributeWriteOnlyInt8uWithValue:(NSNumber *)value completion:(MTRStatusCompletion)completion
{
}

- (void)writeAttributeWriteOnlyInt8uWithValue:(NSNumber *)value params:(MTRWriteParams *)params completion:(MTRStatusCompletion)completion
{
  id v7 = value;
  uint64_t v8 = params;
  id v9 = completion;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeWriteOnlyInt8uWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA4E0, v20, v18, v9, v8);
}

+ (void)readAttributeWriteOnlyInt8uWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16426, v10, v11);
}

- (void)readAttributeNullableGlobalEnumWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA4F8, 0, v12, v14);
}

- (void)writeAttributeNullableGlobalEnumWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeNullableGlobalEnumWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableGlobalEnumWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA4F8, v20, v18, v9, v8);
}

+ (void)readAttributeNullableGlobalEnumWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16435, v10, v11);
}

- (void)readAttributeNullableGlobalStructWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA510, 0, v12, v14);
}

- (void)writeAttributeNullableGlobalStructWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeNullableGlobalStructWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeNullableGlobalStructWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA510, v20, v18, v9, v8);
}

+ (void)readAttributeNullableGlobalStructWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 16436, v10, v11);
}

- (void)readAttributeGeneratedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8728, 0, v12, v14);
}

- (void)subscribeAttributeGeneratedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8728, v20, v18, v9, v8);
}

+ (void)readAttributeGeneratedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 65528, v10, v11);
}

- (void)readAttributeAcceptedCommandListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8740, 0, v12, v14);
}

- (void)subscribeAttributeAcceptedCommandListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8740, v20, v18, v9, v8);
}

+ (void)readAttributeAcceptedCommandListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 65529, v10, v11);
}

- (void)readAttributeEventListWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8818, 0, v12, v14);
}

- (void)subscribeAttributeEventListWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8818, v20, v18, v9, v8);
}

+ (void)readAttributeEventListWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 65530, v10, v11);
}

- (void)readAttributeAttributeListWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8758, 0, v12, v14);
}

- (void)subscribeAttributeAttributeListWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8758, v20, v18, v9, v8);
}

+ (void)readAttributeAttributeListWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 65531, v10, v11);
}

- (void)readAttributeFeatureMapWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8770, 0, v12, v14);
}

- (void)subscribeAttributeFeatureMapWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8770, v20, v18, v9, v8);
}

+ (void)readAttributeFeatureMapWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 65532, v10, v11);
}

- (void)readAttributeClusterRevisionWithCompletion:(void *)completion
{
  id v14 = completion;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9C8788, 0, v12, v14);
}

- (void)subscribeAttributeClusterRevisionWithParams:(MTRSubscribeParams *)params subscriptionEstablished:(MTRSubscriptionEstablishedHandler)subscriptionEstablished reportHandler:(void *)reportHandler
{
  id v20 = params;
  MTRSubscriptionEstablishedHandler v8 = subscriptionEstablished;
  id v9 = reportHandler;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9C8788, v20, v18, v9, v8);
}

+ (void)readAttributeClusterRevisionWithClusterStateCache:(MTRClusterStateCacheContainer *)clusterStateCacheContainer endpoint:(NSNumber *)endpoint queue:(dispatch_queue_t)queue completion:(void *)completion
{
  id v16 = clusterStateCacheContainer;
  id v9 = endpoint;
  id v10 = queue;
  uint64_t v11 = completion;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 65533, v10, v11);
}

- (void)readAttributeMeiInt8uWithCompletion:(id)a3
{
  id v14 = a3;
  v6 = objc_msgSend_device(self, v4, v5);
  id v9 = objc_msgSend_endpointID(self, v7, v8);
  uint64_t v12 = objc_msgSend_callbackQueue(self, v10, v11);
  objc_msgSend__readKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_completion_(v6, v13, (uint64_t)v9, &unk_26F9CA1E0, &unk_26F9CA528, 0, v12, v14);
}

- (void)writeAttributeMeiInt8uWithValue:(id)a3 completion:(id)a4
{
}

- (void)writeAttributeMeiInt8uWithValue:(id)a3 params:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend_copy(v8, v10, v11);

  objc_msgSend_copy(v7, v12, v13);
  operator new();
}

- (void)subscribeAttributeMeiInt8uWithParams:(id)a3 subscriptionEstablished:(id)a4 reportHandler:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = objc_msgSend_device(self, v10, v11);
  v15 = objc_msgSend_endpointID(self, v13, v14);
  uint64_t v18 = objc_msgSend_callbackQueue(self, v16, v17);
  objc_msgSend__subscribeToKnownAttributeWithEndpointID_clusterID_attributeID_params_queue_reportHandler_subscriptionEstablished_(v12, v19, (uint64_t)v15, &unk_26F9CA1E0, &unk_26F9CA528, v20, v18, v9, v8);
}

+ (void)readAttributeMeiInt8uWithClusterStateCache:(id)a3 endpoint:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v14 = objc_msgSend_unsignedShortValue(v9, v12, v13);
  objc_msgSend__readKnownCachedAttributeWithEndpointID_clusterID_attributeID_queue_completion_(v16, v15, v14, 4294048773, 4294070017, v10, v11);
}

@end