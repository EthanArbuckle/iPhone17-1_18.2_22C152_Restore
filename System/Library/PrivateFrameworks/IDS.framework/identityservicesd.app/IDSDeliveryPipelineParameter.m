@interface IDSDeliveryPipelineParameter
- (BOOL)alwaysIncludeSelf;
- (BOOL)alwaysSkipSelf;
- (BOOL)disallowQueryRefresh;
- (BOOL)forceAttachmentMessage;
- (BOOL)forceOnePerFanout;
- (BOOL)isScheduled;
- (BOOL)overrideSendOnePerTokenForService:(id)a3;
- (BOOL)sendOnePerToken;
- (BOOL)usedMMCS;
- (BOOL)wantsCertifiedDelivery;
- (BOOL)wantsDeliveryStatus;
- (BOOL)wantsFirewallDonation;
- (IDSDeliveryPipelineParameter)initWithInfo:(id)a3 uris:(id)a4 service:(id)a5 maxSize:(unint64_t)a6;
- (IDSPeerMessage)messageToSend;
- (IDSPrioritizedTokenList)prioritizedTokenList;
- (IDSRegistrationProperties)registrationProperties;
- (NSArray)aggregatableMessages;
- (NSArray)aggregateMessages;
- (NSArray)endpoints;
- (NSArray)uris;
- (NSData)dataToEncrypt;
- (NSData)encryptedTopLevelPayload;
- (NSData)fromIdentity;
- (NSDictionary)attributes;
- (NSDictionary)endpointsToEncryptedData;
- (NSDictionary)ktURIVerificationMap;
- (NSString)fromID;
- (NSString)fromShortHandle;
- (NSString)guid;
- (NSString)service;
- (id)description;
- (id)willSendBlock;
- (unint64_t)encryptionType;
- (unint64_t)maxSize;
- (void)setAggregatableMessages:(id)a3;
- (void)setAggregateMessages:(id)a3;
- (void)setAlwaysIncludeSelf:(BOOL)a3;
- (void)setAlwaysSkipSelf:(BOOL)a3;
- (void)setAttributes:(id)a3;
- (void)setDataToEncrypt:(id)a3;
- (void)setDisallowQueryRefresh:(BOOL)a3;
- (void)setEncryptedTopLevelPayload:(id)a3;
- (void)setEncryptionType:(unint64_t)a3;
- (void)setEndpoints:(id)a3;
- (void)setEndpointsToEncryptedData:(id)a3;
- (void)setForceAttachmentMessage:(BOOL)a3;
- (void)setForceOnePerFanout:(BOOL)a3;
- (void)setFromID:(id)a3;
- (void)setFromIdentity:(id)a3;
- (void)setFromShortHandle:(id)a3;
- (void)setGuid:(id)a3;
- (void)setIsScheduled:(BOOL)a3;
- (void)setKtURIVerificationMap:(id)a3;
- (void)setMaxSize:(unint64_t)a3;
- (void)setMessageToSend:(id)a3;
- (void)setPrioritizedTokenList:(id)a3;
- (void)setRegistrationProperties:(id)a3;
- (void)setSendOnePerToken:(BOOL)a3;
- (void)setService:(id)a3;
- (void)setUris:(id)a3;
- (void)setUsedMMCS:(BOOL)a3;
- (void)setWantsCertifiedDelivery:(BOOL)a3;
- (void)setWantsDeliveryStatus:(BOOL)a3;
- (void)setWantsFirewallDonation:(BOOL)a3;
- (void)setWillSendBlock:(id)a3;
@end

@implementation IDSDeliveryPipelineParameter

- (IDSDeliveryPipelineParameter)initWithInfo:(id)a3 uris:(id)a4 service:(id)a5 maxSize:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v57.receiver = self;
  v57.super_class = (Class)IDSDeliveryPipelineParameter;
  v13 = [(IDSDeliveryPipelineParameter *)&v57 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_uris, a4);
    uint64_t v15 = [v10 objectForKey:IDSDeliveryFromIDKey];
    fromID = v14->_fromID;
    v14->_fromID = (NSString *)v15;

    uint64_t v17 = [v10 objectForKey:IDSDeliveryFromShortHandle];
    fromShortHandle = v14->_fromShortHandle;
    v14->_fromShortHandle = (NSString *)v17;

    objc_storeStrong((id *)&v14->_service, a5);
    uint64_t v19 = [v10 objectForKey:IDSDeliveryFromIdentityKey];
    fromIdentity = v14->_fromIdentity;
    v14->_fromIdentity = (NSData *)v19;

    v21 = [v10 objectForKey:IDSDeliveryAlwaysSkipSelfKey];
    v14->_alwaysSkipSelf = [v21 BOOLValue];

    v22 = [v10 objectForKey:IDSDeliveryAlwaysIncludeSelfKey];
    v14->_alwaysIncludeSelf = [v22 BOOLValue];

    v23 = [v10 objectForKey:IDSDeliveryDisallowQueryRefreshKey];
    v14->_disallowQueryRefresh = [v23 BOOLValue];

    uint64_t v24 = [v10 objectForKey:IDSDeliveryRegistrationPropertiesKey];
    registrationProperties = v14->_registrationProperties;
    v14->_registrationProperties = (IDSRegistrationProperties *)v24;

    uint64_t v26 = [v10 objectForKey:IDSDeliveryDataToEncryptKey];
    dataToEncrypt = v14->_dataToEncrypt;
    v14->_dataToEncrypt = (NSData *)v26;

    uint64_t v28 = [v10 objectForKey:IDSDeliveryEncryptionAttributesKey];
    attributes = v14->_attributes;
    v14->_attributes = (NSDictionary *)v28;

    uint64_t v30 = [v10 objectForKey:IDSDeliveryKeyTransparencyURIVerificationMapKey];
    ktURIVerificationMap = v14->_ktURIVerificationMap;
    v14->_ktURIVerificationMap = (NSDictionary *)v30;

    v14->_forceAttachmentMessage = +[IMUserDefaults isForcingAttachmentMessage];
    v14->_forceOnePerFanout = +[IMUserDefaults isForcingOnePerFanout];
    v32 = [v10 objectForKey:IDSDeliveryWantsFirewallDonation];
    v14->_wantsFirewallDonation = [v32 BOOLValue];

    v14->_maxSize = a6;
    uint64_t v33 = [v10 objectForKey:IDSDeliveryMessageKey];
    messageToSend = v14->_messageToSend;
    v14->_messageToSend = (IDSPeerMessage *)v33;

    v35 = [(IDSPeerMessage *)v14->_messageToSend wantsDeliveryStatus];
    v14->_wantsDeliveryStatus = [v35 BOOLValue];

    v14->_wantsCertifiedDelivery = [(IDSPeerMessage *)v14->_messageToSend wantsCertifiedDelivery];
    uint64_t v36 = [v10 objectForKey:IDSDeliveryWillSendBlockKey];
    id willSendBlock = v14->_willSendBlock;
    v14->_id willSendBlock = (id)v36;

    uint64_t v38 = [v10 objectForKey:IDSDeliveryPrioritizedTokenListKey];
    prioritizedTokenList = v14->_prioritizedTokenList;
    v14->_prioritizedTokenList = (IDSPrioritizedTokenList *)v38;

    v40 = [(IDSPeerMessage *)v14->_messageToSend messageID];
    v41 = (NSString *)[v40 copy];
    guid = v14->_guid;
    v14->_guid = v41;

    if (!v14->_guid)
    {
      uint64_t v43 = +[NSString stringGUID];
      v44 = v14->_guid;
      v14->_guid = (NSString *)v43;

      v45 = +[IDSFoundationLog delivery];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = v14->_messageToSend;
        v47 = v14->_guid;
        *(_DWORD *)buf = 138412546;
        v59 = v46;
        __int16 v60 = 2112;
        v61 = v47;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Couldn't pull message guid out of %@, using %@", buf, 0x16u);
      }
    }
    if (CUTIsInternalInstall()
      && +[IMUserDefaults isForcefulLegacyEnabled])
    {
      uint64_t v48 = 2;
    }
    else
    {
      uint64_t v48 = +[IMUserDefaults isForcefulECCEnabled];
    }
    v14->_encryptionType = v48;
    v49 = [(IDSPeerMessage *)v14->_messageToSend deliveryMinimumTimeDelay];
    if (v49)
    {
      v14->_isScheduled = 1;
      p_isScheduled = &v14->_isScheduled;
    }
    else
    {
      v51 = [(IDSPeerMessage *)v14->_messageToSend deliveryMinimumTime];
      v14->_isScheduled = v51 != 0;
      p_isScheduled = &v14->_isScheduled;
    }
    if (*p_isScheduled)
    {
      unsigned __int8 v52 = 1;
    }
    else
    {
      v53 = [(IDSPeerMessage *)v14->_messageToSend messageBody];
      v54 = [v53 objectForKey:IDSCommandKey];
      unsigned __int8 v52 = [v54 isEqualToNumber:&off_1009D1DA0];
    }
    if ([(IDSDeliveryPipelineParameter *)v14 overrideSendOnePerTokenForService:v12])
    {
      v14->_sendOnePerToken = 1;
    }
    else
    {
      v55 = [v10 objectForKey:IDSDeliverySendOnePerTokenKey];
      v14->_sendOnePerToken = [v55 BOOLValue] | v52;
    }
  }

  return v14;
}

- (BOOL)overrideSendOnePerTokenForService:(id)a3
{
  return [a3 isEqualToString:@"com.apple.private.alloy.facetime.multi"];
}

- (id)description
{
  CFStringRef v2 = @"YES";
  if (self->_alwaysSkipSelf) {
    CFStringRef v3 = @"YES";
  }
  else {
    CFStringRef v3 = @"NO";
  }
  if (self->_alwaysIncludeSelf) {
    CFStringRef v4 = @"YES";
  }
  else {
    CFStringRef v4 = @"NO";
  }
  if (self->_disallowQueryRefresh) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  if (self->_sendOnePerToken) {
    CFStringRef v6 = @"YES";
  }
  else {
    CFStringRef v6 = @"NO";
  }
  if (self->_wantsDeliveryStatus) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if (self->_wantsCertifiedDelivery) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if (!self->_wantsFirewallDonation) {
    CFStringRef v2 = @"NO";
  }
  return +[NSString stringWithFormat:@"{ URIs: %@, fromID: %@, service: %@, fromIdentity: %@, alwaysSkipSelf: %@, alwaysIncludeSelf: %@, disallowQueryRefresh: %@, sendOnePerToken: %@, registrationProperties: %@, maxSize: %lu, wantsDeliveryStatus: %@, wantsCertifiedDelivery: %@, wantsFirewallDonation: %@, messageToSend: %@ }", *(_OWORD *)&self->_uris, self->_service, self->_fromIdentity, v3, v4, v5, v6, self->_registrationProperties, self->_maxSize, v7, v8, v2, self->_messageToSend];
}

- (NSArray)uris
{
  return self->_uris;
}

- (void)setUris:(id)a3
{
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
}

- (NSString)fromShortHandle
{
  return self->_fromShortHandle;
}

- (void)setFromShortHandle:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSData)fromIdentity
{
  return self->_fromIdentity;
}

- (void)setFromIdentity:(id)a3
{
}

- (BOOL)alwaysSkipSelf
{
  return self->_alwaysSkipSelf;
}

- (void)setAlwaysSkipSelf:(BOOL)a3
{
  self->_alwaysSkipSelf = a3;
}

- (BOOL)alwaysIncludeSelf
{
  return self->_alwaysIncludeSelf;
}

- (void)setAlwaysIncludeSelf:(BOOL)a3
{
  self->_alwaysIncludeSelf = a3;
}

- (BOOL)disallowQueryRefresh
{
  return self->_disallowQueryRefresh;
}

- (void)setDisallowQueryRefresh:(BOOL)a3
{
  self->_disallowQueryRefresh = a3;
}

- (BOOL)sendOnePerToken
{
  return self->_sendOnePerToken;
}

- (void)setSendOnePerToken:(BOOL)a3
{
  self->_sendOnePerToken = a3;
}

- (IDSRegistrationProperties)registrationProperties
{
  return self->_registrationProperties;
}

- (void)setRegistrationProperties:(id)a3
{
}

- (NSData)dataToEncrypt
{
  return self->_dataToEncrypt;
}

- (void)setDataToEncrypt:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSDictionary)ktURIVerificationMap
{
  return self->_ktURIVerificationMap;
}

- (void)setKtURIVerificationMap:(id)a3
{
}

- (unint64_t)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(unint64_t)a3
{
  self->_encryptionType = a3;
}

- (BOOL)forceAttachmentMessage
{
  return self->_forceAttachmentMessage;
}

- (void)setForceAttachmentMessage:(BOOL)a3
{
  self->_forceAttachmentMessage = a3;
}

- (BOOL)forceOnePerFanout
{
  return self->_forceOnePerFanout;
}

- (void)setForceOnePerFanout:(BOOL)a3
{
  self->_forceOnePerFanout = a3;
}

- (BOOL)wantsFirewallDonation
{
  return self->_wantsFirewallDonation;
}

- (void)setWantsFirewallDonation:(BOOL)a3
{
  self->_wantsFirewallDonation = a3;
}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (void)setMaxSize:(unint64_t)a3
{
  self->_maxSize = a3;
}

- (IDSPeerMessage)messageToSend
{
  return self->_messageToSend;
}

- (void)setMessageToSend:(id)a3
{
}

- (BOOL)wantsDeliveryStatus
{
  return self->_wantsDeliveryStatus;
}

- (void)setWantsDeliveryStatus:(BOOL)a3
{
  self->_wantsDeliveryStatus = a3;
}

- (BOOL)wantsCertifiedDelivery
{
  return self->_wantsCertifiedDelivery;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  self->_wantsCertifiedDelivery = a3;
}

- (IDSPrioritizedTokenList)prioritizedTokenList
{
  return self->_prioritizedTokenList;
}

- (void)setPrioritizedTokenList:(id)a3
{
}

- (id)willSendBlock
{
  return self->_willSendBlock;
}

- (void)setWillSendBlock:(id)a3
{
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (NSData)encryptedTopLevelPayload
{
  return self->_encryptedTopLevelPayload;
}

- (void)setEncryptedTopLevelPayload:(id)a3
{
}

- (BOOL)isScheduled
{
  return self->_isScheduled;
}

- (void)setIsScheduled:(BOOL)a3
{
  self->_isScheduled = a3;
}

- (NSArray)endpoints
{
  return self->_endpoints;
}

- (void)setEndpoints:(id)a3
{
}

- (NSDictionary)endpointsToEncryptedData
{
  return self->_endpointsToEncryptedData;
}

- (void)setEndpointsToEncryptedData:(id)a3
{
}

- (NSArray)aggregatableMessages
{
  return self->_aggregatableMessages;
}

- (void)setAggregatableMessages:(id)a3
{
}

- (NSArray)aggregateMessages
{
  return self->_aggregateMessages;
}

- (void)setAggregateMessages:(id)a3
{
}

- (BOOL)usedMMCS
{
  return self->_usedMMCS;
}

- (void)setUsedMMCS:(BOOL)a3
{
  self->_usedMMCS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateMessages, 0);
  objc_storeStrong((id *)&self->_aggregatableMessages, 0);
  objc_storeStrong((id *)&self->_endpointsToEncryptedData, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_encryptedTopLevelPayload, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong(&self->_willSendBlock, 0);
  objc_storeStrong((id *)&self->_prioritizedTokenList, 0);
  objc_storeStrong((id *)&self->_messageToSend, 0);
  objc_storeStrong((id *)&self->_ktURIVerificationMap, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_dataToEncrypt, 0);
  objc_storeStrong((id *)&self->_registrationProperties, 0);
  objc_storeStrong((id *)&self->_fromIdentity, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_fromShortHandle, 0);
  objc_storeStrong((id *)&self->_fromID, 0);

  objc_storeStrong((id *)&self->_uris, 0);
}

@end