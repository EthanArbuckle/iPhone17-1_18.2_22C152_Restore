@interface IDSDAccountSendMessageContext
- (BOOL)isRegistrationActive;
- (BOOL)serviceAllowLiveMessageDelivery;
- (BOOL)serviceAllowLocalDelivery;
- (BOOL)serviceAllowProxyDelivery;
- (BOOL)serviceAllowWiProxDelivery;
- (BOOL)serviceIsDSBased;
- (BOOL)serviceUseiMessageCallerID;
- (BOOL)serviceWantsReflectedSend;
- (BOOL)serviceWantsTinkerDevices;
- (BOOL)shouldAllowCloudDelivery;
- (BOOL)shouldAllowLiveMessageDelivery;
- (BOOL)shouldIncludeDefaultDevice;
- (BOOL)shouldProtectTrafficUsingClassA;
- (BOOL)silentlyFailMessagesOnSwitch;
- (NSArray)aliasStrings;
- (NSArray)appleIDPrimaryDependentRegistrations;
- (NSArray)dependentRegistrations;
- (NSArray)primaryRegistrationURIs;
- (NSArray)pseudonyms;
- (NSArray)serviceDuetIdentifiers;
- (NSDictionary)defaultPairedDependentRegistrations;
- (NSDictionary)entitlements;
- (NSString)accountDescription;
- (NSString)accountDisplayName;
- (NSString)primaryRegistrationDSHandle;
- (NSString)serviceIdentifier;
- (NSString)servicePushTopic;
- (NSString)subService;
- (id)listenerID;
- (int)accountType;
- (unsigned)dataProtectionClass;
- (unsigned)serviceAdHocType;
- (void)setAccountDescription:(id)a3;
- (void)setAccountDisplayName:(id)a3;
- (void)setAccountType:(int)a3;
- (void)setAliasStrings:(id)a3;
- (void)setAppleIDPrimaryDependentRegistrations:(id)a3;
- (void)setDataProtectionClass:(unsigned int)a3;
- (void)setDefaultPairedDependentRegistrations:(id)a3;
- (void)setDependentRegistrations:(id)a3;
- (void)setEntitlements:(id)a3;
- (void)setIsRegistrationActive:(BOOL)a3;
- (void)setListenerID:(id)a3;
- (void)setPrimaryRegistrationDSHandle:(id)a3;
- (void)setPrimaryRegistrationURIs:(id)a3;
- (void)setPseudonyms:(id)a3;
- (void)setServiceAdHocType:(unsigned int)a3;
- (void)setServiceAllowLiveMessageDelivery:(BOOL)a3;
- (void)setServiceAllowLocalDelivery:(BOOL)a3;
- (void)setServiceAllowProxyDelivery:(BOOL)a3;
- (void)setServiceAllowWiProxDelivery:(BOOL)a3;
- (void)setServiceDuetIdentifiers:(id)a3;
- (void)setServiceIdentifier:(id)a3;
- (void)setServiceIsDSBased:(BOOL)a3;
- (void)setServicePushTopic:(id)a3;
- (void)setServiceUseiMessageCallerID:(BOOL)a3;
- (void)setServiceWantsReflectedSend:(BOOL)a3;
- (void)setServiceWantsTinkerDevices:(BOOL)a3;
- (void)setShouldAllowCloudDelivery:(BOOL)a3;
- (void)setShouldAllowLiveMessageDelivery:(BOOL)a3;
- (void)setShouldIncludeDefaultDevice:(BOOL)a3;
- (void)setShouldProtectTrafficUsingClassA:(BOOL)a3;
- (void)setSilentlyFailMessagesOnSwitch:(BOOL)a3;
- (void)setSubService:(id)a3;
@end

@implementation IDSDAccountSendMessageContext

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
}

- (NSString)servicePushTopic
{
  return self->_servicePushTopic;
}

- (void)setServicePushTopic:(id)a3
{
}

- (NSArray)serviceDuetIdentifiers
{
  return self->_serviceDuetIdentifiers;
}

- (void)setServiceDuetIdentifiers:(id)a3
{
}

- (unsigned)serviceAdHocType
{
  return self->_serviceAdHocType;
}

- (void)setServiceAdHocType:(unsigned int)a3
{
  self->_serviceAdHocType = a3;
}

- (BOOL)serviceIsDSBased
{
  return self->_serviceIsDSBased;
}

- (void)setServiceIsDSBased:(BOOL)a3
{
  self->_serviceIsDSBased = a3;
}

- (BOOL)serviceWantsReflectedSend
{
  return self->_serviceWantsReflectedSend;
}

- (void)setServiceWantsReflectedSend:(BOOL)a3
{
  self->_serviceWantsReflectedSend = a3;
}

- (BOOL)serviceAllowProxyDelivery
{
  return self->_serviceAllowProxyDelivery;
}

- (void)setServiceAllowProxyDelivery:(BOOL)a3
{
  self->_serviceAllowProxyDelivery = a3;
}

- (BOOL)serviceAllowLocalDelivery
{
  return self->_serviceAllowLocalDelivery;
}

- (void)setServiceAllowLocalDelivery:(BOOL)a3
{
  self->_serviceAllowLocalDelivery = a3;
}

- (BOOL)serviceAllowWiProxDelivery
{
  return self->_serviceAllowWiProxDelivery;
}

- (void)setServiceAllowWiProxDelivery:(BOOL)a3
{
  self->_serviceAllowWiProxDelivery = a3;
}

- (BOOL)serviceAllowLiveMessageDelivery
{
  return self->_serviceAllowLiveMessageDelivery;
}

- (void)setServiceAllowLiveMessageDelivery:(BOOL)a3
{
  self->_serviceAllowLiveMessageDelivery = a3;
}

- (BOOL)serviceUseiMessageCallerID
{
  return self->_serviceUseiMessageCallerID;
}

- (void)setServiceUseiMessageCallerID:(BOOL)a3
{
  self->_serviceUseiMessageCallerID = a3;
}

- (BOOL)serviceWantsTinkerDevices
{
  return self->_serviceWantsTinkerDevices;
}

- (void)setServiceWantsTinkerDevices:(BOOL)a3
{
  self->_serviceWantsTinkerDevices = a3;
}

- (BOOL)silentlyFailMessagesOnSwitch
{
  return self->_silentlyFailMessagesOnSwitch;
}

- (void)setSilentlyFailMessagesOnSwitch:(BOOL)a3
{
  self->_silentlyFailMessagesOnSwitch = a3;
}

- (BOOL)shouldProtectTrafficUsingClassA
{
  return self->_shouldProtectTrafficUsingClassA;
}

- (void)setShouldProtectTrafficUsingClassA:(BOOL)a3
{
  self->_shouldProtectTrafficUsingClassA = a3;
}

- (BOOL)shouldAllowCloudDelivery
{
  return self->_shouldAllowCloudDelivery;
}

- (void)setShouldAllowCloudDelivery:(BOOL)a3
{
  self->_shouldAllowCloudDelivery = a3;
}

- (BOOL)shouldAllowLiveMessageDelivery
{
  return self->_shouldAllowLiveMessageDelivery;
}

- (void)setShouldAllowLiveMessageDelivery:(BOOL)a3
{
  self->_shouldAllowLiveMessageDelivery = a3;
}

- (int)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(int)a3
{
  self->_accountType = a3;
}

- (NSString)primaryRegistrationDSHandle
{
  return self->_primaryRegistrationDSHandle;
}

- (void)setPrimaryRegistrationDSHandle:(id)a3
{
}

- (NSArray)primaryRegistrationURIs
{
  return self->_primaryRegistrationURIs;
}

- (void)setPrimaryRegistrationURIs:(id)a3
{
}

- (BOOL)isRegistrationActive
{
  return self->_isRegistrationActive;
}

- (void)setIsRegistrationActive:(BOOL)a3
{
  self->_isRegistrationActive = a3;
}

- (NSArray)dependentRegistrations
{
  return self->_dependentRegistrations;
}

- (void)setDependentRegistrations:(id)a3
{
}

- (NSDictionary)defaultPairedDependentRegistrations
{
  return self->_defaultPairedDependentRegistrations;
}

- (void)setDefaultPairedDependentRegistrations:(id)a3
{
}

- (NSArray)appleIDPrimaryDependentRegistrations
{
  return self->_appleIDPrimaryDependentRegistrations;
}

- (void)setAppleIDPrimaryDependentRegistrations:(id)a3
{
}

- (NSArray)aliasStrings
{
  return self->_aliasStrings;
}

- (void)setAliasStrings:(id)a3
{
}

- (NSArray)pseudonyms
{
  return self->_pseudonyms;
}

- (void)setPseudonyms:(id)a3
{
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (void)setAccountDescription:(id)a3
{
}

- (NSString)accountDisplayName
{
  return self->_accountDisplayName;
}

- (void)setAccountDisplayName:(id)a3
{
}

- (id)listenerID
{
  return self->_listenerID;
}

- (void)setListenerID:(id)a3
{
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
}

- (BOOL)shouldIncludeDefaultDevice
{
  return self->_shouldIncludeDefaultDevice;
}

- (void)setShouldIncludeDefaultDevice:(BOOL)a3
{
  self->_shouldIncludeDefaultDevice = a3;
}

- (unsigned)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (void)setDataProtectionClass:(unsigned int)a3
{
  self->_dataProtectionClass = a3;
}

- (NSString)subService
{
  return self->_subService;
}

- (void)setSubService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subService, 0);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong(&self->_listenerID, 0);
  objc_storeStrong((id *)&self->_accountDisplayName, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_pseudonyms, 0);
  objc_storeStrong((id *)&self->_aliasStrings, 0);
  objc_storeStrong((id *)&self->_appleIDPrimaryDependentRegistrations, 0);
  objc_storeStrong((id *)&self->_defaultPairedDependentRegistrations, 0);
  objc_storeStrong((id *)&self->_dependentRegistrations, 0);
  objc_storeStrong((id *)&self->_primaryRegistrationURIs, 0);
  objc_storeStrong((id *)&self->_primaryRegistrationDSHandle, 0);
  objc_storeStrong((id *)&self->_serviceDuetIdentifiers, 0);
  objc_storeStrong((id *)&self->_servicePushTopic, 0);

  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

@end