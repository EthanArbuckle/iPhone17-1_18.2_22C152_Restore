@interface IDSAWDLogging
- (BOOL)_shouldSubmitRegistrationCompletedForServiceIdentifier:(id)a3;
- (void)IDSDeviceConnectionForService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10;
- (void)IDSGenericConnectionForLink:(unint64_t)a3 connectionSetupStartTime:(id)a4 firstPacketReceiveTime:(id)a5 connectionType:(id)a6 success:(BOOL)a7 errorCode:(id)a8;
- (void)IDSMagnetCorruptionDetailedEvent:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7;
- (void)IDSQRAllocation:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8;
- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 firstReceivedPacketMKMtimeDelta:(int64_t)a5;
- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 membershipChangeMKMTimeDelta:(int64_t)a5;
- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(unint64_t)a4 missingPrekeys:(unint64_t)a5;
- (void)IDSSocketPairConnectionTCPInfoLinkType:(unint64_t)a3 currentRTT:(unint64_t)a4 bandwidth:(unint64_t)a5;
- (void)IDSWiProxDidConnectToPeer:(unint64_t)a3 resultCode:(unint64_t)a4;
- (void)IDSWiProxDidDisconnectFromPeer:(unint64_t)a3 resultCode:(unint64_t)a4;
- (void)IDSWiProxDidSendData:(unint64_t)a3;
- (void)OTRSessionNegotiation:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6;
- (void)WRMLinkRecommendation:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6;
- (void)_submitRegistrationAccountStatusMetric:(id)a3;
- (void)clientProcessReceivedMessage:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6;
- (void)messageDeliveredForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9;
- (void)messageReceivedForService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7;
- (void)messageSentForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7;
- (void)noteMessageReceivedForService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7;
- (void)noteServerStorageStateMachineEndedFor:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7;
- (void)queryAndSubmitStatusForAccounts;
- (void)registrationCompletedForRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6;
- (void)sessionAcceptReceivedWithAWDGUID:(id)a3;
- (void)sessionAcceptSentWithAWDGUID:(id)a3;
- (void)sessionCancelReceivedWithAWDGUID:(id)a3;
- (void)sessionCancelSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5;
- (void)sessionCompletedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(int64_t)a12 linkType:(unint64_t)a13 linkProtocol:(int64_t)a14 endedReason:(unsigned int)a15 destinationType:(int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isNetworkEnabled:(BOOL)a19 isNetworkActive:(BOOL)a20 isNetworkReachable:(BOOL)a21 isWifiInterfaceDisallowed:(BOOL)a22 isCellularInterfaceDisallowed:(BOOL)a23;
- (void)sessionConnectedWithAWDGUID:(id)a3;
- (void)sessionDeclineReceivedWithAWDGUID:(id)a3;
- (void)sessionDeclineSentWithAWDGUID:(id)a3;
- (void)sessionEndedWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 isNetworkEnabled:(BOOL)a9 isNetworkActive:(BOOL)a10 isNetworkReachable:(BOOL)a11 networkCheckResult:(unsigned int)a12 dataRate:(id)a13 gksError:(id)a14 connectDuration:(id)a15 remoteNetworkConnection:(unsigned int)a16 localNetworkConnection:(unsigned int)a17 connectionType:(unsigned int)a18 usesRelay:(BOOL)a19 currentNATType:(id)a20 remoteNATType:(id)a21 relayConnectDuration:(id)a22 isInitiator:(BOOL)a23 linkQuality:(id)a24 gksReturnCode:(id)a25;
- (void)sessionInvitationReceivedWithAWDGUID:(id)a3;
- (void)sessionInvitationSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4;
- (void)sessionReinitiateConnectedWithAWDGUID:(id)a3;
- (void)sessionReinitiateRequestedWithAWDGUID:(id)a3;
- (void)sessionReinitiateStartedWithAWDGUID:(id)a3;
- (void)sessionStartedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6;
- (void)socketClosedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10;
- (void)socketOpenedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 openError:(unint64_t)a5 socketError:(unint64_t)a6;
- (void)wifiSetupAttemptType:(unint64_t)a3 duration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6;
@end

@implementation IDSAWDLogging

- (void)IDSDeviceConnectionForService:(id)a3 wasSuccessful:(BOOL)a4 clientInitTime:(id)a5 clientOpenSocketCompletionTime:(id)a6 daemonOpenSocketTime:(id)a7 daemonOpenSocketCompletionTime:(id)a8 firstPacketReceiveTime:(id)a9 connectionInitTime:(id)a10
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v27 = v17;
  v28 = v15;
  v29 = v16;
  v30 = v18;
  id v31 = a10;
  v32 = v14;
  id v20 = v14;
  id v21 = v31;
  id v22 = v18;
  id v23 = v19;
  id v24 = v16;
  id v25 = v15;
  id v26 = v17;
  IDSAWDSubmitBlockAsync();
}

- (BOOL)_shouldSubmitRegistrationCompletedForServiceIdentifier:(id)a3
{
  return [&off_1009D2C68 containsObject:a3];
}

- (void)queryAndSubmitStatusForAccounts
{
  v3 = objc_msgSend(&off_1009D2C80, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(&off_1009D2C80, "count")));
  id v4 = [&off_1009D2C98 mutableCopy];
  if (+[IDSRegistrationController systemSupportsPhoneNumberRegistration])
  {
    [v4 addObject:&off_1009D1728];
  }
  v5 = objc_msgSend(v4, "objectAtIndexedSubscript:", arc4random_uniform((uint32_t)objc_msgSend(v4, "count")));
  id v6 = [v5 integerValue];

  v7 = +[IDSDServiceController sharedInstance];
  v8 = [v7 serviceWithIdentifier:v3];

  v9 = +[IDSDAccountController sharedInstance];
  v10 = [v9 accountsOnService:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v16, "accountType", (void)v19) == v6)
        {
          id v18 = +[IDSDAccountMetrics registrationAccountStatusMetricForAccount:v16];
          [(IDSAWDLogging *)self _submitRegistrationAccountStatusMetric:v18];

          id v17 = v11;
          goto LABEL_13;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v17 = +[IDSDAccountMetrics registrationAccountStatusMetricForNonexistentAccountWithType:v6 serviceIdentifier:v3];
  [(IDSAWDLogging *)self _submitRegistrationAccountStatusMetric:v17];
LABEL_13:
}

- (void)_submitRegistrationAccountStatusMetric:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)registrationCompletedForRegistrationType:(int)a3 serviceIdentifier:(id)a4 wasSuccessful:(BOOL)a5 registrationError:(int64_t)a6
{
  id v7 = a4;
  if ([(IDSAWDLogging *)self _shouldSubmitRegistrationCompletedForServiceIdentifier:v7])
  {
    id v8 = v7;
    IDSAWDSubmitBlockAsync();
  }
}

- (void)IDSGenericConnectionForLink:(unint64_t)a3 connectionSetupStartTime:(id)a4 firstPacketReceiveTime:(id)a5 connectionType:(id)a6 success:(BOOL)a7 errorCode:(id)a8
{
  id v11 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v12 = v18;
  id v13 = v17;
  id v14 = v11;
  id v15 = v16;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionStartedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6
{
  id v8 = a3;
  id v12 = a4;
  id v13 = a5;
  id v9 = v13;
  id v10 = v12;
  id v11 = v8;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionInvitationSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v5 = v8;
  id v6 = v7;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionInvitationReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionCancelSentWithAWDGUID:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5
{
  id v6 = a3;
  id v9 = a4;
  id v7 = v9;
  id v8 = v6;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionCancelReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionDeclineSentWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionDeclineReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionAcceptSentWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionAcceptReceivedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionConnectedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionReinitiateRequestedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionReinitiateStartedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionReinitiateConnectedWithAWDGUID:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionCompletedWithAWDGUID:(id)a3 protocolVersionNumber:(id)a4 serviceName:(id)a5 clientType:(int64_t)a6 isQREnabled:(BOOL)a7 isUsingQRDirectly:(BOOL)a8 isInitiator:(BOOL)a9 isScreenSharingSessionType:(BOOL)a10 isWithDefaultPairedDevice:(BOOL)a11 transportType:(int64_t)a12 linkType:(unint64_t)a13 linkProtocol:(int64_t)a14 endedReason:(unsigned int)a15 destinationType:(int)a16 durationOfSession:(id)a17 durationToConnect:(id)a18 isNetworkEnabled:(BOOL)a19 isNetworkActive:(BOOL)a20 isNetworkReachable:(BOOL)a21 isWifiInterfaceDisallowed:(BOOL)a22 isCellularInterfaceDisallowed:(BOOL)a23
{
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v33 = a17;
  id v34 = a18;
  v35 = v25;
  id v28 = v27;
  id v29 = v26;
  id v30 = v25;
  id v31 = v34;
  id v32 = v33;
  IDSAWDSubmitBlockAsync();
}

- (void)sessionEndedWithGuid:(id)a3 endedReason:(unsigned int)a4 genericError:(unsigned int)a5 gameKitError:(unsigned int)a6 conferenceMiscError:(unsigned int)a7 callDuration:(id)a8 isNetworkEnabled:(BOOL)a9 isNetworkActive:(BOOL)a10 isNetworkReachable:(BOOL)a11 networkCheckResult:(unsigned int)a12 dataRate:(id)a13 gksError:(id)a14 connectDuration:(id)a15 remoteNetworkConnection:(unsigned int)a16 localNetworkConnection:(unsigned int)a17 connectionType:(unsigned int)a18 usesRelay:(BOOL)a19 currentNATType:(id)a20 remoteNATType:(id)a21 relayConnectDuration:(id)a22 isInitiator:(BOOL)a23 linkQuality:(id)a24 gksReturnCode:(id)a25
{
  id v40 = a3;
  id v26 = a8;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a20;
  id v31 = a21;
  v43 = v26;
  v44 = v27;
  v45 = v28;
  v46 = v29;
  id v47 = a22;
  id v48 = a24;
  id v49 = a25;
  id v42 = v49;
  id v41 = v48;
  id v32 = v47;
  id v33 = v31;
  id v34 = v30;
  id v35 = v29;
  id v36 = v28;
  id v37 = v27;
  id v38 = v26;
  id v39 = v40;
  IDSAWDSubmitBlockAsync();
}

- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(unint64_t)a4 missingPrekeys:(unint64_t)a5
{
  id v6 = a3;
  id v5 = v6;
  IDSAWDSubmitBlockAsync();
}

- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 firstReceivedPacketMKMtimeDelta:(int64_t)a5
{
  id v6 = a3;
  id v5 = v6;
  IDSAWDSubmitBlockAsync();
}

- (void)IDSRealTimeEncryptionServiceName:(id)a3 activeParticipants:(int64_t)a4 membershipChangeMKMTimeDelta:(int64_t)a5
{
  id v6 = a3;
  id v5 = v6;
  IDSAWDSubmitBlockAsync();
}

- (void)IDSSocketPairConnectionTCPInfoLinkType:(unint64_t)a3 currentRTT:(unint64_t)a4 bandwidth:(unint64_t)a5
{
}

- (void)messageSentForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(unint64_t)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  LOBYTE(v18) = v10;
  id v16 = v11;
  unint64_t v17 = a7;
  IDSAWDSubmitBlockAsync();
  if (v10)
  {
    id v12 = objc_alloc_init((Class)IDSWRMMetricContainer);
    id v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setMessageSentSize:", a5, _NSConcreteStackBlock, 3221225472, sub_100331F08, &unk_1009891F8, self, v11, a5, a6, v17, v18);
      id v14 = +[IDSWRMExchange sharedInstance];
      [v14 submitMetric:v13];
    }
  }
}

- (void)clientProcessReceivedMessage:(id)a3 messageSize:(unint64_t)a4 deltaTime:(unint64_t)a5 priority:(unint64_t)a6
{
  id v7 = a3;
  id v6 = v7;
  IDSAWDSubmitBlockAsync();
}

- (void)messageDeliveredForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 deliveryError:(unint64_t)a7 RTT:(unint64_t)a8 priority:(unint64_t)a9
{
  BOOL v13 = a4;
  id v14 = a3;
  LOBYTE(v21) = v13;
  long long v19 = v14;
  unint64_t v20 = a6;
  IDSAWDSubmitBlockAsync();
  if (v13)
  {
    id v15 = objc_alloc_init((Class)IDSWRMMetricContainer);
    id v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setMessageDeliveredSize:", a5, _NSConcreteStackBlock, 3221225472, sub_100332288, &unk_100989248, self, v14, a5, v20, a7, a8, a9, v21);
      [v16 setMessageDeliveredDeliveryError:a7];
      [v16 setMessageDeliveredRTT:a8];
      unint64_t v17 = +[IDSWRMExchange sharedInstance];
      [v17 submitMetric:v16];
    }
  }
}

- (void)messageReceivedForService:(id)a3 isFromDefaultPairedDevice:(BOOL)a4 messageSize:(unint64_t)a5 linkType:(unint64_t)a6 priority:(int64_t)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  LOBYTE(v18) = v10;
  id v16 = v11;
  int64_t v17 = a7;
  IDSAWDSubmitBlockAsync();
  if (v10)
  {
    id v12 = objc_alloc_init((Class)IDSWRMMetricContainer);
    BOOL v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "setMessageReceivedSize:", a5, _NSConcreteStackBlock, 3221225472, sub_100332478, &unk_1009891F8, self, v11, a5, a6, v17, v18);
      id v14 = +[IDSWRMExchange sharedInstance];
      [v14 submitMetric:v13];
    }
  }
}

- (void)socketOpenedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 openError:(unint64_t)a5 socketError:(unint64_t)a6
{
  id v7 = a3;
  id v6 = v7;
  IDSAWDSubmitBlockAsync();
}

- (void)socketClosedForService:(id)a3 isToDefaultPairedDevice:(BOOL)a4 closeError:(unint64_t)a5 socketError:(unint64_t)a6 bytesSent:(unint64_t)a7 packetsSent:(unint64_t)a8 bytesReceived:(unint64_t)a9 packetsReceived:(unint64_t)a10
{
  BOOL v12 = a4;
  id v13 = a3;
  IDSAWDSubmitBlockAsync();
  if (v12)
  {
    id v14 = objc_alloc_init((Class)IDSWRMMetricContainer);
    id v15 = v14;
    if (v14)
    {
      [v14 setStreamBytesSent:a7];
      [v15 setStreamPacketsSent:a8];
      [v15 setStreamBytesReceived:a9];
      [v15 setStreamPacketsReceived:a10];
      id v16 = +[IDSWRMExchange sharedInstance];
      [v16 submitMetric:v15];
    }
  }
}

- (void)wifiSetupAttemptType:(unint64_t)a3 duration:(unint64_t)a4 result:(unint64_t)a5 client:(id)a6
{
  id v7 = a6;
  id v6 = v7;
  IDSAWDSubmitBlockAsync();
}

- (void)OTRSessionNegotiation:(id)a3 priority:(unint64_t)a4 duration:(unint64_t)a5 result:(unsigned int)a6
{
  id v7 = a3;
  id v6 = v7;
  IDSAWDSubmitBlockAsync();
}

- (void)WRMLinkRecommendation:(unsigned int)a3 primaryLinkType:(unsigned int)a4 magnetState:(unsigned int)a5 infraWiFiState:(unsigned int)a6
{
}

- (void)IDSQRAllocation:(unint64_t)a3 result:(unsigned int)a4 hasRecipientAccepted:(unsigned int)a5 payloadSize:(unsigned int)a6 topic:(id)a7 service:(id)a8
{
  id v9 = a7;
  id v12 = a8;
  id v10 = v12;
  id v11 = v9;
  IDSAWDSubmitBlockAsync();
}

- (void)IDSWiProxDidConnectToPeer:(unint64_t)a3 resultCode:(unint64_t)a4
{
}

- (void)IDSWiProxDidDisconnectFromPeer:(unint64_t)a3 resultCode:(unint64_t)a4
{
}

- (void)IDSWiProxDidSendData:(unint64_t)a3
{
}

- (void)noteMessageReceivedForService:(id)a3 accountType:(id)a4 fromStorage:(BOOL)a5 serverTimestamp:(double)a6 localTimeDelta:(double)a7
{
  id v8 = a3;
  id v11 = a4;
  id v9 = v11;
  id v10 = v8;
  IDSAWDSubmitBlockAsync();
}

- (void)IDSMagnetCorruptionDetailedEvent:(unint64_t)a3 correctRawBytesSinceLastCorruption:(unint64_t)a4 discardedRawBytes:(unint64_t)a5 recoveryTimeInMs:(unint64_t)a6 linkType:(unint64_t)a7
{
}

- (void)noteServerStorageStateMachineEndedFor:(id)a3 linkType:(int64_t)a4 wasPrimary:(BOOL)a5 timeTaken:(double)a6 numberProcessed:(int64_t)a7
{
  id v8 = a3;
  id v7 = v8;
  IDSAWDSubmitBlockAsync();
}

@end