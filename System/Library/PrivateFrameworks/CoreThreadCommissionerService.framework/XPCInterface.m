@interface XPCInterface
+ (id)CTCSCreateXPCTransportInterface;
+ (id)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords;
+ (id)CTCSGetExpectedClassesForOptionsOverXPCInterface;
+ (void)CTCSSetExpectedClassesForXPCBrokerInterface:(id)a3;
@end

@implementation XPCInterface

+ (id)CTCSGetExpectedClassesForOptionsOverXPCInterface
{
  if (qword_10007D5C8 != -1) {
    dispatch_once(&qword_10007D5C8, &stru_100074880);
  }
  v2 = (void *)qword_10007D5D0;

  return v2;
}

+ (id)CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords
{
  if (qword_10007D5D8 != -1) {
    dispatch_once(&qword_10007D5D8, &stru_1000748A0);
  }
  v2 = (void *)qword_10007D5E0;

  return v2;
}

+ (void)CTCSSetExpectedClassesForXPCBrokerInterface:(id)a3
{
  id v3 = a3;
  id v4 = +[XPCInterface CTCSExpectedXPCInterfaceClassesForAllActiveDataSetRecords];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveActiveDataSetRecordWithUniqueIdentifier:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveActiveDataSetRecordForThreadBorderAgent:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveAllActiveDataSetRecordsWithActiveFlag:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerDeleteActiveDataSetRecordForThreadBorderAgent:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerDeleteActiveDataSetRecordWithUniqueIdentifier:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerStoreThreadNetworkCredentialActiveDataSet:credentialsDataSet:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerStoreThreadNetworkCredentialActiveDataSetInternally:network:credentialsDataSet:waitForSync:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerStoreCachedAODasPreferredNetwork:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsValidateAODInternally:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerDeletePreferredNetworkWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerCleanPreferredAndFrozenThreadNetworksWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerCleanKeychainThreadNetworksWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrievePreferredNetworkWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrievePreferredNetworkWithNoScanWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrievePreferredNetworkInternallyWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrievePreferredNetworkInternallyOnMdnsAndSigWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveActiveDataSetRecordWithXPANId:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveOrGeneratePreferredNetworkInternallyWithCompletion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsIsPreferredNetworkForActiveOperationalDataset:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveIsPreferredNetworkAvailable:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerAddPreferredNetworkWithCompletionInternally:extendedPANId:borderAgentID:ipV4NwSignature:ipv6NwSignature:wifiSSID:wifiPassword:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerDeletePreferredNetworkForNetworkSignatureInternallyWithCompletion:ipv6NwSignature:wifiSSID:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsServerRetrieveActiveDataSetRecordInternallyWithXPANId:completion:" argumentIndex:0 ofReply:1];
  [v3 setClasses:v4 forSelector:"ctcsUpdatePreferredNetworkInternallyWithCompletion:" argumentIndex:0 ofReply:1];
}

+ (id)CTCSCreateXPCTransportInterface
{
  if (qword_10007D5F0 != -1) {
    dispatch_once(&qword_10007D5F0, &stru_1000748C0);
  }
  v2 = (void *)qword_10007D5E8;

  return v2;
}

@end