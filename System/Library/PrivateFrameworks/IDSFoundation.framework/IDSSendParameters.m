@interface IDSSendParameters
- (BOOL)activityContinuation;
- (BOOL)allowCloudDelivery;
- (BOOL)alwaysIncludeSelf;
- (BOOL)alwaysSkipSelf;
- (BOOL)bypassDuet;
- (BOOL)bypassSizeCheck;
- (BOOL)bypassStorage;
- (BOOL)compressPayload;
- (BOOL)compressed;
- (BOOL)daemonDeathResend;
- (BOOL)disableAliasValidation;
- (BOOL)disallowRefresh;
- (BOOL)encryptPayload;
- (BOOL)enforceRemoteTimeouts;
- (BOOL)expectsPeerResponse;
- (BOOL)fakeMessage;
- (BOOL)fireAndForget;
- (BOOL)forceEncryptionOff;
- (BOOL)homeKitPayload;
- (BOOL)ignoreMaxRetryCount;
- (BOOL)isProxiedOutgoingMessage;
- (BOOL)isUPlusOne;
- (BOOL)liveMessageDelivery;
- (BOOL)localDelivery;
- (BOOL)nonCloudWaking;
- (BOOL)nonWaking;
- (BOOL)requireBluetooth;
- (BOOL)requireLocalWiFi;
- (BOOL)sessionForceInternetInvitation;
- (BOOL)useDictAsTopLevel;
- (BOOL)wantsAppAck;
- (BOOL)wantsCertifiedDelivery;
- (BOOL)wantsDeliveryStatus;
- (BOOL)wantsFirewallDonation;
- (BOOL)wantsProgress;
- (BOOL)wantsResponse;
- (IDSDestination)destinations;
- (IDSPrioritizedTokenList)prioritizedTokenList;
- (IDSSendParameters)init;
- (IDSSendParameters)initWithCoder:(id)a3;
- (IDSSendParameters)initWithDictionary:(id)a3;
- (NSArray)bulkedPayload;
- (NSArray)duetIdentifiersOverride;
- (NSArray)finalDestinationURIs;
- (NSArray)interestingRegistrationProperties;
- (NSArray)requireAllRegistrationProperties;
- (NSArray)requireLackOfRegistrationProperties;
- (NSData)accessToken;
- (NSData)data;
- (NSData)dataToEncrypt;
- (NSData)groupData;
- (NSData)messageUUID;
- (NSDate)expirationDate;
- (NSDictionary)deliveryStatusContext;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)encryptionAttributes;
- (NSDictionary)keyTransparencyURIVerificationMap;
- (NSDictionary)message;
- (NSDictionary)protobuf;
- (NSDictionary)resourceMetadata;
- (NSMutableDictionary)params;
- (NSNumber)command;
- (NSNumber)commandContext;
- (NSNumber)deliveryMinimumTime;
- (NSNumber)deliveryMinimumTimeDelay;
- (NSNumber)dropMessageIndicatorCommand;
- (NSNumber)isInitiator;
- (NSNumber)messageType;
- (NSNumber)originalTimestamp;
- (NSNumber)pushPriority;
- (NSNumber)quickRelayUserType;
- (NSNumber)sendMode;
- (NSString)accountUUID;
- (NSString)alternateCallbackID;
- (NSString)destinationCorrelationIdentifier;
- (NSString)fromID;
- (NSString)fromShortHandle;
- (NSString)identifier;
- (NSString)localDestinationDeviceUUID;
- (NSString)mainAccountUUID;
- (NSString)metricReportIdentifier;
- (NSString)originalfromID;
- (NSString)peerResponseIdentifier;
- (NSString)queueOneIdentifier;
- (NSString)resourcePath;
- (NSString)sessionID;
- (NSString)subService;
- (NSString)subServiceAccountUUID;
- (double)timeout;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (int64_t)forceQuery;
- (int64_t)priority;
- (os_unfair_lock_s)lock;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessToken:(id)a3;
- (void)setAccountUUID:(id)a3;
- (void)setActivityContinuation:(BOOL)a3;
- (void)setAllowCloudDelivery:(BOOL)a3;
- (void)setAlternateCallbackID:(id)a3;
- (void)setAlwaysIncludeSelf:(BOOL)a3;
- (void)setAlwaysSkipSelf:(BOOL)a3;
- (void)setBulkedPayload:(id)a3;
- (void)setBypassDuet:(BOOL)a3;
- (void)setBypassSizeCheck:(BOOL)a3;
- (void)setBypassStorage:(BOOL)a3;
- (void)setCommand:(id)a3;
- (void)setCommandContext:(id)a3;
- (void)setCompressPayload:(BOOL)a3;
- (void)setCompressed:(BOOL)a3;
- (void)setDaemonDeathResend:(BOOL)a3;
- (void)setData:(id)a3;
- (void)setDataToEncrypt:(id)a3;
- (void)setDeliveryMinimumTime:(id)a3;
- (void)setDeliveryMinimumTimeDelay:(id)a3;
- (void)setDeliveryStatusContext:(id)a3;
- (void)setDestinationCorrelationIdentifier:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setDisableAliasValidation:(BOOL)a3;
- (void)setDisallowRefresh:(BOOL)a3;
- (void)setDropMessageIndicatorCommand:(id)a3;
- (void)setDuetIdentifiersOverride:(id)a3;
- (void)setEncryptPayload:(BOOL)a3;
- (void)setEncryptionAttributes:(id)a3;
- (void)setEnforceRemoteTimeouts:(BOOL)a3;
- (void)setExpectsPeerResponse:(BOOL)a3;
- (void)setFakeMessage:(BOOL)a3;
- (void)setFinalDestinationURIs:(id)a3;
- (void)setFireAndForget:(BOOL)a3;
- (void)setForceEncryptionOff:(BOOL)a3;
- (void)setForceQuery:(int64_t)a3;
- (void)setFromID:(id)a3;
- (void)setFromShortHandle:(id)a3;
- (void)setGroupData:(id)a3;
- (void)setHomeKitPayload:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreMaxRetryCount:(BOOL)a3;
- (void)setInterestingRegistrationProperties:(id)a3;
- (void)setIsInitiator:(id)a3;
- (void)setIsProxiedOutgoingMessage:(BOOL)a3;
- (void)setIsUPlusOne:(BOOL)a3;
- (void)setKeyTransparencyURIVerificationMap:(id)a3;
- (void)setLiveMessageDelivery:(BOOL)a3;
- (void)setLocalDelivery:(BOOL)a3;
- (void)setLocalDestinationDeviceUUID:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setMainAccountUUID:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setMessageUUID:(id)a3;
- (void)setMetricReportIdentifier:(id)a3;
- (void)setNonCloudWaking:(BOOL)a3;
- (void)setNonWaking:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setOriginalTimestamp:(id)a3;
- (void)setOriginalfromID:(id)a3;
- (void)setParams:(id)a3;
- (void)setPeerResponseIdentifier:(id)a3;
- (void)setPrioritizedTokenList:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setProtobuf:(id)a3;
- (void)setPushPriority:(id)a3;
- (void)setQueueOneIdentifier:(id)a3;
- (void)setQuickRelayUserType:(id)a3;
- (void)setRequireAllRegistrationProperties:(id)a3;
- (void)setRequireBluetooth:(BOOL)a3;
- (void)setRequireLackOfRegistrationProperties:(id)a3;
- (void)setRequireLocalWiFi:(BOOL)a3;
- (void)setResourceMetadata:(id)a3;
- (void)setResourcePath:(id)a3;
- (void)setSendMode:(id)a3;
- (void)setSessionForceInternetInvitation:(BOOL)a3;
- (void)setSessionID:(id)a3;
- (void)setSubService:(id)a3;
- (void)setSubServiceAccountUUID:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setUseDictAsTopLevel:(BOOL)a3;
- (void)setWantsAppAck:(BOOL)a3;
- (void)setWantsCertifiedDelivery:(BOOL)a3;
- (void)setWantsDeliveryStatus:(BOOL)a3;
- (void)setWantsFirewallDonation:(BOOL)a3;
- (void)setWantsProgress:(BOOL)a3;
- (void)setWantsResponse:(BOOL)a3;
@end

@implementation IDSSendParameters

- (IDSSendParameters)init
{
  return (IDSSendParameters *)objc_msgSend_initWithDictionary_(self, a2, 0, v2);
}

- (IDSSendParameters)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSSendParameters;
  v5 = [(IDSSendParameters *)&v15 init];
  v9 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_msgSend_mutableCopy(v4, v6, v7, v8);
    v11 = v10;
    if (v10) {
      v12 = v10;
    }
    else {
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    params = v9->_params;
    v9->_params = v12;
  }
  return v9;
}

- (IDSSendParameters)initWithCoder:(id)a3
{
  v5 = objc_msgSend_decodeObjectForKey_(a3, a2, @"params", v3);
  double v8 = (IDSSendParameters *)objc_msgSend_initWithDictionary_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v5 = objc_alloc((Class)objc_opt_class());
  double v8 = objc_msgSend_initWithDictionary_(v5, v6, (uint64_t)self->_params, v7);
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)objectForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  double v8 = objc_msgSend_objectForKey_(self->_params, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  v9 = (char *)a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  params = self->_params;
  if (v9) {
    objc_msgSend_setObject_forKey_(params, v9, (uint64_t)v9, v7, v6);
  }
  else {
    objc_msgSend_removeObjectForKey_(params, 0, (uint64_t)v6, v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)self->_params, v7, @"params");

  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)dictionaryRepresentation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_params;
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setData:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDataKey");
}

- (NSData)data
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDataKey", v2);
  id v4 = self;

  return (NSData *)v4;
}

- (void)setMessage:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersMessageKey");
}

- (NSDictionary)message
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersMessageKey", v2);
  id v4 = self;

  return (NSDictionary *)v4;
}

- (void)setProtobuf:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersProtobufKey");
}

- (NSDictionary)protobuf
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersProtobufKey", v2);
  id v4 = self;

  return (NSDictionary *)v4;
}

- (void)setResourcePath:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersResourcePathKey");
}

- (NSString)resourcePath
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersResourcePathKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setResourceMetadata:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersResourceMetadataKey");
}

- (NSDictionary)resourceMetadata
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersResourceMetadataKey", v2);
  id v4 = self;

  return (NSDictionary *)v4;
}

- (void)setFromID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersFromIDKey");
}

- (NSString)fromID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersFromIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setFromShortHandle:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersFromShortHandleKey");
}

- (NSString)fromShortHandle
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersFromShortHandleKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setDestinations:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDestinationsKey");
}

- (IDSDestination)destinations
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDestinationsKey", v2);
  id v4 = self;

  return (IDSDestination *)v4;
}

- (void)setFinalDestinationURIs:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersFinalDestinationURIsKey");
}

- (NSArray)finalDestinationURIs
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersFinalDestinationURIsKey", v2);
  id v4 = self;

  return (NSArray *)v4;
}

- (void)setAccountUUID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersAccountUUIDKey");
}

- (NSString)accountUUID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersAccountUUIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setDataToEncrypt:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDataToEncryptKey");
}

- (NSData)dataToEncrypt
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDataToEncryptKey", v2);
  id v4 = self;

  return (NSData *)v4;
}

- (void)setEncryptionAttributes:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersEncryptionAttributesKey");
}

- (NSDictionary)encryptionAttributes
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersEncryptionAttributesKey", v2);
  id v4 = self;

  return (NSDictionary *)v4;
}

- (void)setCommand:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersCommandKey");
}

- (NSNumber)command
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersCommandKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setCommandContext:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersCommandContextKey");
}

- (NSNumber)commandContext
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersCommandContextKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setIdentifier:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersIdentifierKey");
}

- (NSString)identifier
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersIdentifierKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setDeliveryStatusContext:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDeliveryStatusContextKey");
}

- (NSDictionary)deliveryStatusContext
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDeliveryStatusContextKey", v2);
  id v4 = self;

  return (NSDictionary *)v4;
}

- (void)setMessageUUID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersMessageUUIDKey");
}

- (NSData)messageUUID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersMessageUUIDKey", v2);
  id v4 = self;

  return (NSData *)v4;
}

- (void)setAlternateCallbackID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersAlternateCallbackIDKey");
}

- (NSString)alternateCallbackID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersAlternateCallbackIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setBulkedPayload:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersBulkedPayloadKey");
}

- (NSArray)bulkedPayload
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersBulkedPayloadKey", v2);
  id v4 = self;

  return (NSArray *)v4;
}

- (void)setPeerResponseIdentifier:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersPeerResponseIdentifierKey");
}

- (NSString)peerResponseIdentifier
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersPeerResponseIdentifierKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setRequireAllRegistrationProperties:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersRequireAllRegistrationPropertiesKey");
}

- (NSArray)requireAllRegistrationProperties
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersRequireAllRegistrationPropertiesKey", v2);
  id v4 = self;

  return (NSArray *)v4;
}

- (void)setRequireLackOfRegistrationProperties:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersRequireLackOfRegistrationPropertiesKey");
}

- (NSArray)requireLackOfRegistrationProperties
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersRequireLackOfRegistrationPropertiesKey", v2);
  id v4 = self;

  return (NSArray *)v4;
}

- (void)setInterestingRegistrationProperties:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersInterestingRegistrationPropertiesKey");
}

- (NSArray)interestingRegistrationProperties
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersInterestingRegistrationPropertiesKey", v2);
  id v4 = self;

  return (NSArray *)v4;
}

- (void)setQueueOneIdentifier:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersQueueOneIdentifierKey");
}

- (NSString)queueOneIdentifier
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersQueueOneIdentifierKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setDuetIdentifiersOverride:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDuetIdentifiersOverrideKey");
}

- (NSArray)duetIdentifiersOverride
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDuetIdentifiersOverrideKey", v2);
  id v4 = self;

  return (NSArray *)v4;
}

- (void)setAccessToken:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersAccessTokenKey");
}

- (NSData)accessToken
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersAccessTokenKey", v2);
  id v4 = self;

  return (NSData *)v4;
}

- (void)setSubService:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersSubServiceKey");
}

- (NSString)subService
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersSubServiceKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setSubServiceAccountUUID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersSubServiceAccountUUIDKey");
}

- (NSString)subServiceAccountUUID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersSubServiceAccountUUIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setMainAccountUUID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersMainAccountUUIDKey");
}

- (NSString)mainAccountUUID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersMainAccountUUIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setOriginalfromID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersOriginalfromIDKey");
}

- (NSString)originalfromID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersOriginalfromIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setLocalDestinationDeviceUUID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersLocalDestinationDeviceUUIDKey");
}

- (NSString)localDestinationDeviceUUID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersLocalDestinationDeviceUUIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setDestinationCorrelationIdentifier:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDestinationCorrelationIdentifierKey");
}

- (NSString)destinationCorrelationIdentifier
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDestinationCorrelationIdentifierKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setMessageType:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersMessageTypeKey");
}

- (NSNumber)messageType
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersMessageTypeKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setSessionID:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersSessionIDKey");
}

- (NSString)sessionID
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersSessionIDKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setGroupData:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersGroupDataKey");
}

- (NSData)groupData
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersGroupDataKey", v2);
  id v4 = self;

  return (NSData *)v4;
}

- (void)setMetricReportIdentifier:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersMetricReportIdentifierKey");
}

- (NSString)metricReportIdentifier
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersMetricReportIdentifierKey", v2);
  id v4 = self;

  return (NSString *)v4;
}

- (void)setDropMessageIndicatorCommand:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDropMessageIndicatorCommandKey");
}

- (NSNumber)dropMessageIndicatorCommand
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDropMessageIndicatorCommandKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setOriginalTimestamp:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersOriginalTimestampKey");
}

- (NSNumber)originalTimestamp
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersOriginalTimestampKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setPushPriority:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersPushPriorityKey");
}

- (NSNumber)pushPriority
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersPushPriorityKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setPrioritizedTokenList:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersPrioritizedTokenListKey");
}

- (IDSPrioritizedTokenList)prioritizedTokenList
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersPrioritizedTokenListKey", v2);
  id v4 = self;

  return (IDSPrioritizedTokenList *)v4;
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDeliveryMinimumTimeDelayKey");
}

- (NSNumber)deliveryMinimumTimeDelay
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDeliveryMinimumTimeDelayKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setDeliveryMinimumTime:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersDeliveryMinimumTimeKey");
}

- (NSNumber)deliveryMinimumTime
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDeliveryMinimumTimeKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setSendMode:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersSendModeKey");
}

- (NSNumber)sendMode
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersSendModeKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setIsInitiator:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersIsInitiatorKey");
}

- (NSNumber)isInitiator
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersIsInitiatorKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setKeyTransparencyURIVerificationMap:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersKeyTransparencyURIVerificationMapKey");
}

- (NSDictionary)keyTransparencyURIVerificationMap
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersKeyTransparencyURIVerificationMapKey", v2);
  id v4 = self;

  return (NSDictionary *)v4;
}

- (void)setQuickRelayUserType:(id)a3
{
  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, @"IDSSendParametersQuickRelayUserTypeKey");
}

- (NSNumber)quickRelayUserType
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersQuickRelayUserTypeKey", v2);
  id v4 = self;

  return (NSNumber *)v4;
}

- (void)setExpectsPeerResponse:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersExpectsPeerResponseKey");
}

- (BOOL)expectsPeerResponse
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersExpectsPeerResponseKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setCompressed:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersCompressedKey");
}

- (BOOL)compressed
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersCompressedKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setUseDictAsTopLevel:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersUseDictAsTopLevelKey");
}

- (BOOL)useDictAsTopLevel
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersUseDictAsTopLevelKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsAppAck:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersWantsAppAckKey");
}

- (BOOL)wantsAppAck
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersWantsAppAckKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setEncryptPayload:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersEncryptPayloadKey");
}

- (BOOL)encryptPayload
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersEncryptPayloadKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setCompressPayload:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersCompressPayloadKey");
}

- (BOOL)compressPayload
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersCompressPayloadKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsResponse:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersWantsResponseKey");
}

- (BOOL)wantsResponse
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersWantsResponseKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsProgress:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersWantsProgressKey");
}

- (BOOL)wantsProgress
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersWantsProgressKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsDeliveryStatus:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersWantsDeliveryStatusKey");
}

- (BOOL)wantsDeliveryStatus
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersWantsDeliveryStatusKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersWantsCertifiedDeliveryKey");
}

- (BOOL)wantsCertifiedDelivery
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersWantsCertifiedDeliveryKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setPriority:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3 && sel_integerValue == sel_BOOLValue)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersPriorityKey");
}

- (int64_t)priority
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersPriorityKey", v2);
  int64_t v7 = objc_msgSend_integerValue(v3, v4, v5, v6);

  return v7;
}

- (void)setLocalDelivery:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersLocalDeliveryKey");
}

- (BOOL)localDelivery
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersLocalDeliveryKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setRequireBluetooth:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersRequireBluetoothKey");
}

- (BOOL)requireBluetooth
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersRequireBluetoothKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setRequireLocalWiFi:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersRequireLocalWiFiKey");
}

- (BOOL)requireLocalWiFi
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersRequireLocalWiFiKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setTimeout:(double)a3
{
  objc_msgSend_numberWithDouble_(NSNumber, a2, v3, a3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (a3 == 0.0 && sel_doubleValue == sel_BOOLValue)
  {

    double v8 = 0;
  }
  v10 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersTimeoutKey");
}

- (double)timeout
{
  uint64_t v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersTimeoutKey", v2);
  objc_msgSend_doubleValue(v3, v4, v5, v6);
  double v8 = v7;

  return v8;
}

- (void)setBypassDuet:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersBypassDuetKey");
}

- (BOOL)bypassDuet
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersBypassDuetKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setFakeMessage:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersFakeMessageKey");
}

- (BOOL)fakeMessage
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersFakeMessageKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setBypassStorage:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersBypassStorageKey");
}

- (BOOL)bypassStorage
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersBypassStorageKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setActivityContinuation:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersActivityContinuationKey");
}

- (BOOL)activityContinuation
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersActivityContinuationKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setNonWaking:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersNonWakingKey");
}

- (BOOL)nonWaking
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersNonWakingKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setNonCloudWaking:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersNonCloudWakingKey");
}

- (BOOL)nonCloudWaking
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersNonCloudWakingKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setDaemonDeathResend:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersDaemonDeathResendKey");
}

- (BOOL)daemonDeathResend
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDaemonDeathResendKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setBypassSizeCheck:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersBypassSizeCheckKey");
}

- (BOOL)bypassSizeCheck
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersBypassSizeCheckKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setFireAndForget:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersFireAndForgetKey");
}

- (BOOL)fireAndForget
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersFireAndForgetKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setIsProxiedOutgoingMessage:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersIsProxiedOutgoingMessageKey");
}

- (BOOL)isProxiedOutgoingMessage
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersIsProxiedOutgoingMessageKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setEnforceRemoteTimeouts:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersEnforceRemoteTimeoutsKey");
}

- (BOOL)enforceRemoteTimeouts
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersEnforceRemoteTimeoutsKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setHomeKitPayload:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersHomeKitPayloadKey");
}

- (BOOL)homeKitPayload
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersHomeKitPayloadKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setDisableAliasValidation:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersDisableAliasValidationKey");
}

- (BOOL)disableAliasValidation
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDisableAliasValidationKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setForceEncryptionOff:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersForceEncryptionOffKey");
}

- (BOOL)forceEncryptionOff
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersForceEncryptionOffKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setAllowCloudDelivery:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersAllowCloudDeliveryKey");
}

- (BOOL)allowCloudDelivery
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersAllowCloudDeliveryKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setAlwaysSkipSelf:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersAlwaysSkipSelfKey");
}

- (BOOL)alwaysSkipSelf
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersAlwaysSkipSelfKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setForceQuery:(int64_t)a3
{
  objc_msgSend_numberWithInteger_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3 && sel_integerValue == sel_BOOLValue)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersForceQueryKey");
}

- (int64_t)forceQuery
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersForceQueryKey", v2);
  int64_t v7 = objc_msgSend_integerValue(v3, v4, v5, v6);

  return v7;
}

- (void)setAlwaysIncludeSelf:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersAlwaysIncludeSelfKey");
}

- (BOOL)alwaysIncludeSelf
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersAlwaysIncludeSelfKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setDisallowRefresh:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersDisallowRefreshKey");
}

- (BOOL)disallowRefresh
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersDisallowRefreshKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setLiveMessageDelivery:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersLiveMessageDeliveryKey");
}

- (BOOL)liveMessageDelivery
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersLiveMessageDeliveryKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setIsUPlusOne:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersIsUPlusOneKey");
}

- (BOOL)isUPlusOne
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersIsUPlusOneKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setSessionForceInternetInvitation:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersSessionForceInternetInvitationKey");
}

- (BOOL)sessionForceInternetInvitation
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersSessionForceInternetInvitationKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsFirewallDonation:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersWantsFirewallDonationKey");
}

- (BOOL)wantsFirewallDonation
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersWantsFirewallDonationKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setIgnoreMaxRetryCount:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  double v6 = (char *)objc_claimAutoreleasedReturnValue();
  double v8 = v6;
  if (!a3)
  {

    double v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, @"IDSSendParametersIgnoreMaxRetryCountKey");
}

- (BOOL)ignoreMaxRetryCount
{
  double v3 = objc_msgSend_objectForKey_(self, a2, @"IDSSendParametersIgnoreMaxRetryCountKey", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (NSDate)expirationDate
{
  objc_msgSend_timeout(self, a2, v2, v3);
  if (v6 <= 2.22044605e-16)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E4F1C9C8], v4, v5, v6);
  }
  return (NSDate *)v7;
}

- (NSMutableDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
}

@end