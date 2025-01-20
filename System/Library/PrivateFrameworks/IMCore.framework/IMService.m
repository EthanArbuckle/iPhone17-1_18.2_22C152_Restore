@interface IMService
+ (BOOL)isEmailAddress:(id)a3 inDomains:(id)a4;
+ (IMPersonStatus)myStatus;
+ (IMService)serviceWithName:(NSString *)name;
+ (NSArray)allServices;
+ (NSDate)myIdleTime;
+ (NSNotificationCenter)notificationCenter;
+ (NSString)imageNameForStatus:(IMPersonStatus)status;
+ (NSURL)imageURLForStatus:(IMPersonStatus)status;
+ (id)aimService;
+ (id)allServicesNonBlocking;
+ (id)callService;
+ (id)canonicalFormOfID:(id)a3 withIDSensitivity:(int)a4 forHandleType:(unint64_t)a5;
+ (id)facetimeService;
+ (id)iMessageLiteService;
+ (id)iMessageService;
+ (id)jabberService;
+ (id)rcsService;
+ (id)satelliteSMSService;
+ (id)smsService;
+ (id)subnetService;
+ (void)forgetStatusImageAppearance;
- (BOOL)initialSyncPerformed;
- (BOOL)isEnabled;
- (BOOL)supportsCapability:(id)a3;
- (BOOL)supportsReplicationCapability:(id)a3;
- (IMServiceStatus)status;
- (NSArray)infoForAllScreenNames;
- (NSArray)infoForPreferredScreenNames;
- (NSArray)peopleWithScreenName:(NSString *)screenName;
- (NSArray)screenNamesForPerson:(ABPerson *)person;
- (NSDictionary)infoForScreenName:(NSString *)screenName;
- (NSDictionary)serviceProperties;
- (NSString)localizedName;
- (NSString)localizedShortName;
- (NSString)name;
- (id)_displayName;
- (id)canonicalFormOfID:(id)a3;
- (id)infoForAllPeople;
- (id)infoForDisplayedPeople;
- (id)infoForPerson:(id)a3;
- (id)myScreenNames;
- (void)setServiceProperties:(id)a3;
@end

@implementation IMService

+ (id)iMessageService
{
  return (id)qword_1EB3F2410;
}

+ (id)rcsService
{
  return (id)qword_1EB3F22D8;
}

+ (id)smsService
{
  return (id)qword_1EB3F2418;
}

+ (NSNotificationCenter)notificationCenter
{
  return 0;
}

+ (void)forgetStatusImageAppearance
{
  objc_msgSend_forgetStatusImageAppearance(IMServiceAgent, a2, v2, v3);
}

+ (NSString)imageNameForStatus:(IMPersonStatus)status
{
  return (NSString *)((uint64_t (*)(__objc2_class *, char *, IMPersonStatus))MEMORY[0x1F4181798])(IMServiceAgent, sel_imageNameForStatus_, status);
}

+ (NSURL)imageURLForStatus:(IMPersonStatus)status
{
  return (NSURL *)((uint64_t (*)(__objc2_class *, char *, IMPersonStatus))MEMORY[0x1F4181798])(IMServiceAgent, sel_imageURLForStatus_, status);
}

+ (NSArray)allServices
{
  return (NSArray *)objc_msgSend_allServices(IMServiceImpl, a2, v2, v3);
}

+ (id)allServicesNonBlocking
{
  return (id)objc_msgSend_allServicesNonBlocking(IMServiceImpl, a2, v2, v3);
}

+ (IMService)serviceWithName:(NSString *)name
{
  return (IMService *)objc_msgSend_serviceWithName_(IMServiceImpl, a2, (uint64_t)name, v3);
}

+ (IMPersonStatus)myStatus
{
  return 0;
}

+ (NSDate)myIdleTime
{
  v4 = (void *)MEMORY[0x1E4F1C9C8];
  v5 = objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
  v9 = objc_msgSend_listener(v5, v6, v7, v8);
  unsigned int v13 = objc_msgSend_myIdleTime(v9, v10, v11, v12);
  v17 = objc_msgSend_dateWithTimeIntervalSinceNow_(v4, v14, v15, v16, (double)v13);

  return (NSDate *)v17;
}

+ (BOOL)isEmailAddress:(id)a3 inDomains:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v12 = objc_msgSend_count(v6, v7, v8, v9);
  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = 0;
  while (1)
  {
    v14 = objc_msgSend_objectAtIndex_(v6, v10, v13, v11);
    if (objc_msgSend_isEqualToString_(v14, v15, @"*", v16))
    {
LABEL_11:
      LOBYTE(v12) = 1;
      goto LABEL_15;
    }
    if (objc_msgSend_hasSuffix_(v5, v17, (uint64_t)v14, v18)) {
      break;
    }
LABEL_9:

    if (v12 == ++v13)
    {
      LOBYTE(v12) = 0;
      goto LABEL_16;
    }
  }
  uint64_t v22 = objc_msgSend_length(v5, v19, v20, v21);
  unint64_t v26 = v22 + ~objc_msgSend_length(v14, v23, v24, v25);
  if (v26 < objc_msgSend_length(v5, v27, v28, v29))
  {
    if (v26
      && v26 < objc_msgSend_length(v5, v30, v31, v32)
      && objc_msgSend_characterAtIndex_(v5, v33, v26, v34) == 64)
    {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  uint64_t v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1A4CB71A8((uint64_t)v5, (uint64_t)v14, v12);
  }

  LOBYTE(v12) = 0;
LABEL_15:

LABEL_16:
  return (char)v12;
}

+ (id)canonicalFormOfID:(id)a3 withIDSensitivity:(int)a4 forHandleType:(unint64_t)a5
{
  return (id)MEMORY[0x1F4123F88](a3, *(void *)&a4, a5);
}

- (BOOL)isEnabled
{
  return 0;
}

- (BOOL)initialSyncPerformed
{
  return 0;
}

- (NSString)localizedName
{
  return 0;
}

- (NSString)localizedShortName
{
  return 0;
}

- (NSString)name
{
  return 0;
}

- (IMServiceStatus)status
{
  return 0;
}

- (NSDictionary)infoForScreenName:(NSString *)screenName
{
  return 0;
}

- (NSArray)infoForAllScreenNames
{
  return 0;
}

- (NSArray)infoForPreferredScreenNames
{
  return 0;
}

- (id)canonicalFormOfID:(id)a3
{
  return 0;
}

- (NSArray)peopleWithScreenName:(NSString *)screenName
{
  return 0;
}

- (NSArray)screenNamesForPerson:(ABPerson *)person
{
  return 0;
}

- (id)myScreenNames
{
  return 0;
}

- (BOOL)supportsCapability:(id)a3
{
  return 0;
}

- (BOOL)supportsReplicationCapability:(id)a3
{
  return 0;
}

- (NSDictionary)serviceProperties
{
  return 0;
}

- (id)_displayName
{
  id v5 = objc_msgSend_name(self, a2, v2, v3);
  int isEqualToString = objc_msgSend_isEqualToString_(v5, v6, *MEMORY[0x1E4F6E1B8], v7);

  if (isEqualToString)
  {
    uint64_t v12 = sub_1A4C0ACE4();
    uint64_t v13 = @"iMessage • Satellite";
    objc_msgSend_localizedStringForKey_value_table_(v12, v14, @"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE", @"iMessage • Satellite", @"IMCoreLocalizable");
    uint64_t v23 = LABEL_5:;
    uint64_t v24 = (void *)v23;
    if (v23) {
      uint64_t v25 = (void *)v23;
    }
    else {
      uint64_t v25 = v13;
    }
    id v26 = v25;

    goto LABEL_9;
  }
  uint64_t v15 = objc_msgSend_name(self, v9, v10, v11);
  int v18 = objc_msgSend_isEqualToString_(v15, v16, *MEMORY[0x1E4F6E1A8], v17);

  if (v18)
  {
    uint64_t v12 = sub_1A4C0ACE4();
    uint64_t v13 = @"Text Message • Satellite";
    objc_msgSend_localizedStringForKey_value_table_(v12, v22, @"PLACEHOLDER_TEXT_VIEW_SATELLITE_MESSAGE_SMS", @"Text Message • Satellite", @"IMCoreLocalizable");
    goto LABEL_5;
  }
  uint64_t v28 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v19, v20, v21);
  int isLazuliEnabled = objc_msgSend_isLazuliEnabled(v28, v29, v30, v31);

  objc_msgSend_smsService(IMServiceImpl, v33, v34, v35);
  v36 = (IMService *)objc_claimAutoreleasedReturnValue();

  if (isLazuliEnabled)
  {
    if (v36 == self)
    {
      uint64_t v12 = sub_1A4C0ACE4();
      uint64_t v13 = @"Text Message • SMS";
      objc_msgSend_localizedStringForKey_value_table_(v12, v56, @"TEXT_MESSAGE_SMS", @"Text Message • SMS", @"IMCoreLocalizable");
      goto LABEL_5;
    }
    objc_msgSend_iMessageService(IMServiceImpl, v37, v38, v39);
    v40 = (IMService *)objc_claimAutoreleasedReturnValue();

    if (v40 != self)
    {
      objc_msgSend_rcsService(IMServiceImpl, v41, v42, v43);
      v44 = (IMService *)objc_claimAutoreleasedReturnValue();

      if (v44 == self)
      {
        if ((IMDeviceIsGreenTea() & 1) != 0
          || objc_msgSend_IMDeviceIsChinaRegion(MEMORY[0x1E4F6E730], v48, v49, v50))
        {
          v51 = sub_1A4C0ACE4();
          uint64_t v12 = v51;
          v53 = @"5G_MESSAGING";
        }
        else
        {
          v51 = sub_1A4C0ACE4();
          uint64_t v12 = v51;
          v53 = @"TEXT_MESSAGE_RCS";
        }
        uint64_t v13 = @"Text Message • RCS";
        objc_msgSend_localizedStringForKey_value_table_(v51, v52, (uint64_t)v53, @"Text Message • RCS", @"IMCoreLocalizable");
        goto LABEL_5;
      }
      goto LABEL_21;
    }
LABEL_22:
    uint64_t v12 = sub_1A4C0ACE4();
    uint64_t v13 = @"iMessage";
    objc_msgSend_localizedStringForKey_value_table_(v12, v55, @"MADRID", @"iMessage", @"IMCoreLocalizable");
    goto LABEL_5;
  }
  if (v36 == self)
  {
    uint64_t v12 = sub_1A4C0ACE4();
    uint64_t v13 = @"Text Message";
    objc_msgSend_localizedStringForKey_value_table_(v12, v57, @"TEXT_MESSAGE", @"Text Message", @"IMCoreLocalizable");
    goto LABEL_5;
  }
  objc_msgSend_iMessageService(IMServiceImpl, v37, v38, v39);
  v54 = (IMService *)objc_claimAutoreleasedReturnValue();

  if (v54 == self) {
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend_name(self, v45, v46, v47);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v26;
}

- (void)setServiceProperties:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)infoForPerson:(id)a3
{
  return 0;
}

- (id)infoForAllPeople
{
  return 0;
}

- (id)infoForDisplayedPeople
{
  return 0;
}

+ (id)aimService
{
  return 0;
}

+ (id)subnetService
{
  return 0;
}

+ (id)jabberService
{
  return 0;
}

+ (id)callService
{
  return (id)qword_1EB3F2408;
}

+ (id)facetimeService
{
  return (id)qword_1EB3F2408;
}

+ (id)iMessageLiteService
{
  return (id)qword_1EB3F22E8;
}

+ (id)satelliteSMSService
{
  return (id)qword_1EB3F22E0;
}

@end