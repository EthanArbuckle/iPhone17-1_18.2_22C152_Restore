@interface XPCInterface
+ (id)CTCSCreateXPCTransportInterface;
+ (id)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords;
+ (id)CTCSGetExpectedClassesForOptionsOverXPCInterface;
+ (void)CTCSSetExpectedClassesForXPCBrokerInterface:(id)a3;
@end

@implementation XPCInterface

+ (id)CTCSGetExpectedClassesForOptionsOverXPCInterface
{
  if (CTCSGetExpectedClassesForOptionsOverXPCInterface_onceToken != -1) {
    dispatch_once(&CTCSGetExpectedClassesForOptionsOverXPCInterface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)CTCSGetExpectedClassesForOptionsOverXPCInterface_classes;

  return v2;
}

uint64_t __64__XPCInterface_CTCSGetExpectedClassesForOptionsOverXPCInterface__block_invoke()
{
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  CTCSGetExpectedClassesForOptionsOverXPCInterface_classes = objc_msgSend(v11, "setWithObjects:", v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

+ (id)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords
{
  if (CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_onceToken != -1) {
    dispatch_once(&CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_onceToken, &__block_literal_global_12);
  }
  uint64_t v2 = (void *)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_classes;

  return v2;
}

uint64_t __73__XPCInterface_CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords__block_invoke()
{
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords_classes = objc_msgSend(v12, "setWithObjects:", v11, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);

  return MEMORY[0x1F41817F8]();
}

+ (void)CTCSSetExpectedClassesForXPCBrokerInterface:(id)a3
{
  id v3 = a3;
  id v4 = +[XPCInterface CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerStoreThreadNetworkCredentialActiveDataSet_credentialsDataSet_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally_network_credentialsDataSet_waitForSync_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerStoreCachedAODasPreferredNetwork_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsValidateAODInternally_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerDeletePreferredNetworkWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerCleanKeychainThreadNetworksWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrievePreferredNetworkWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrievePreferredNetworkInternallyWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveActiveDataSetRecordWithXPANId_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsIsPreferredNetworkForActiveOperationalDataset_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveIsPreferredNetworkAvailable_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerAddPreferredNetworkWithCompletionInternally_extendedPANId_borderAgentID_ipV4NwSignature_ipv6NwSignature_wifiSSID_wifiPassword_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion_ipv6NwSignature_wifiSSID_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId_completion_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:sel_ctcsUpdatePreferredNetworkInternallyWithCompletion_ argumentIndex:0 ofReply:1];
}

+ (id)CTCSCreateXPCTransportInterface
{
  if (CTCSCreateXPCTransportInterface_onceToken != -1) {
    dispatch_once(&CTCSCreateXPCTransportInterface_onceToken, &__block_literal_global_64);
  }
  uint64_t v2 = (void *)CTCSCreateXPCTransportInterface_interface;

  return v2;
}

uint64_t __47__XPCInterface_CTCSCreateXPCTransportInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2C8C440];
  uint64_t v1 = (void *)CTCSCreateXPCTransportInterface_interface;
  CTCSCreateXPCTransportInterface_interface = v0;

  uint64_t v2 = CTCSCreateXPCTransportInterface_interface;

  return +[XPCInterface CTCSSetExpectedClassesForXPCBrokerInterface:v2];
}

@end