@interface IMCTSMSUtilitiesManager
+ (id)sharedManager;
- (BOOL)isEagerUploadEnabledForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)messagesFilteringSettingForPreferedSubscription;
- (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsEnabledForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4 reset:(BOOL)a5;
- (BOOL)mmsSupportedAndConfiguredForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)mmsSupportsH264VideoForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)readDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)readDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)readEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)readMMSUserOverrideForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)shouldShowMMSEmailAddress:(id)a3 simID:(id)a4;
- (BOOL)shouldUploadToMMCS:(id)a3;
- (BOOL)smsAllowCaseSensitiveSenderIDForPhoneNumber:(id)a3;
- (IMCTSMSUtilitiesManager)init;
- (double)mmsMaximumAudioDurationForPhoneNumber:(id)a3 simID:(id)a4;
- (double)mmsMaximumDurationWithPreset:(id)a3 phoneNumber:(id)a4 simID:(id)a5;
- (double)mmsMaximumVideoDurationForPhoneNumber:(id)a3 simID:(id)a4;
- (id)carrierBundleValueForKeyHierarchy:(id)a3 phoneNumber:(id)a4 simID:(id)a5;
- (id)carrierNameForPhoneNumber:(id)a3;
- (id)countryCodeForPhoneNumber:(id)a3 simID:(id)a4;
- (id)countryCodeForSimSlot:(int64_t)a3;
- (id)mmsEmailAddressToMatchForPhoneNumber:(id)a3 simID:(id)a4;
- (id)myCTPhoneNumber;
- (id)phoneNumbersEnabledForMultipleSubscriptionDevice;
- (id)uniqueIdentifierForPhoneNumber:(id)a3 simID:(id)a4;
- (int)mmsEnabledToken;
- (int)mmsMaxImageDimensionForPhoneNumber:(id)a3 simID:(id)a4;
- (int)mmsMaxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (int)mmsMaximumMessageByteCountForPhoneNumber:(id)a3 simID:(id)a4;
- (int)mmsMaximumSlideCountForPhoneNumber:(id)a3 simID:(id)a4;
- (int)rcsEnabledToken;
- (unint64_t)iMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7;
- (unint64_t)iMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7;
- (unint64_t)readAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:(id)a3 simID:(id)a4;
- (void)iMessageMaxTransferFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7;
- (void)registerServiceCapabilityNotifications;
- (void)setMmsEnabledToken:(int)a3;
- (void)setRcsEnabledToken:(int)a3;
- (void)synchronizeMMSCapabilityToWatch:(BOOL)a3;
- (void)synchronizePreferredSubscriptionMMSCapabilityToWatch;
@end

@implementation IMCTSMSUtilitiesManager

- (BOOL)mmsEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    LOBYTE(v17) = IMMMSEnabled();
    goto LABEL_35;
  }
  v8 = +[IMCTSubscriptionUtilities sharedInstance];
  v9 = [v8 ctSubscriptionInfo];
  v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Subscription context was nil, returning NO for MMS enabled", v31, 2u);
      }
    }
    LOBYTE(v17) = 0;
    goto LABEL_32;
  }
  v11 = [v10 phoneNumber];
  v12 = [v10 labelID];
  v13 = [(IMCTSMSUtilitiesManager *)self uniqueIdentifierForPhoneNumber:v11 simID:v12];
  if (!qword_1E94FF2F8)
  {
LABEL_13:
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20 = (void *)qword_1E94FF2F8;
    qword_1E94FF2F8 = (uint64_t)v19;

LABEL_14:
    BOOL v21 = [(IMCTSMSUtilitiesManager *)self mmsSupportedAndConfiguredForPhoneNumber:v11 simID:v12];
    BOOL v22 = [(IMCTSMSUtilitiesManager *)self readMMSUserOverrideForPhoneNumber:v11 simID:v12];
    uint64_t v17 = v21 & v22;
    if ([v13 length])
    {
      if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = @"NO";
          *(_DWORD *)v31 = 138413826;
          *(void *)&v31[4] = v7;
          if (v21) {
            v25 = @"YES";
          }
          else {
            v25 = @"NO";
          }
          if (v22) {
            v26 = @"YES";
          }
          else {
            v26 = @"NO";
          }
          if (v17) {
            v24 = @"YES";
          }
          *(_WORD *)&v31[12] = 2112;
          *(void *)&v31[14] = v12;
          __int16 v32 = 2112;
          id v33 = v6;
          __int16 v34 = 2112;
          v35 = v11;
          __int16 v36 = 2112;
          v37 = v25;
          __int16 v38 = 2112;
          v39 = v26;
          __int16 v40 = 2112;
          v41 = v24;
          _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Is MMS enabled for simID %@ (default %@) phoneNumber %@ (default %@): mmsSupportedAndConfigured %@ isUserEnabled %@ isMMSEnabled %@", v31, 0x48u);
        }
      }
      v27 = (void *)qword_1E94FF2F8;
      v28 = objc_msgSend(NSNumber, "numberWithBool:", v17, *(_OWORD *)v31);
      [v27 setObject:v28 forKey:v13];

      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v31 = 138412290;
          *(void *)&v31[4] = qword_1E94FF2F8;
          _os_log_impl(&dword_1A0772000, v29, OS_LOG_TYPE_INFO, "mmsCapability dict is now %@", v31, 0xCu);
        }
      }
    }
    goto LABEL_31;
  }
  v14 = [(id)qword_1E94FF2F8 allKeys];
  int v15 = [v14 containsObject:v13];

  if (!v15)
  {
    if (qword_1E94FF2F8) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  v16 = [(id)qword_1E94FF2F8 objectForKey:v13];
  LOBYTE(v17) = [v16 BOOLValue];

LABEL_31:
LABEL_32:
  if (qword_1E94FF2B8 != -1) {
    dispatch_once(&qword_1E94FF2B8, &unk_1EF2BF980);
  }

LABEL_35:
  return v17;
}

- (void)registerServiceCapabilityNotifications
{
  BOOL v3 = [(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:0 simID:0];
  notify_register_check("kMMSEnabledDidChange", &self->_mmsEnabledToken);
  notify_set_state([(IMCTSMSUtilitiesManager *)self mmsEnabledToken], v3);

  notify_post("kMMSEnabledDidChange");
}

- (BOOL)mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
    {
      v8 = [MEMORY[0x1E4F61740] sharedInstance];
      [v8 deviceType];

      v9 = +[IMCTSubscriptionUtilities sharedInstance];
      v10 = [v9 ctSubscriptionInfo];
      v11 = objc_msgSend(v10, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v11)
      {
        CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
        v12 = +[IMCTSubscriptionUtilities sharedInstance];
        v13 = (void *)[v12 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_1EF305D60 defaultValue:MEMORY[0x1E4F1CC38] valueIfError:MEMORY[0x1E4F1CC38]];
        int v14 = [v13 BOOLValue];

        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            v16 = @"NO";
            if (v14) {
              v16 = @"YES";
            }
            int v25 = 138412290;
            v26 = v16;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Fetching carrier bundle value for GroupModeEnabled: %@", (uint8_t *)&v25, 0xCu);
          }
        }
        if ((v14 & 1) == 0)
        {
          uint64_t v17 = +[IMCTSubscriptionUtilities sharedInstance];
          v18 = (void *)[v17 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_1EF305D78 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
          int v19 = [v18 BOOLValue];

          if (IMOSLoggingEnabled())
          {
            v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              BOOL v21 = @"NO";
              if (v19) {
                BOOL v21 = @"YES";
              }
              int v25 = 138412290;
              v26 = v21;
              _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, "GroupMode disabled, fetching carrier bundle value for GroupModeAllowUserOverride: %@", (uint8_t *)&v25, 0xCu);
            }
          }
          goto LABEL_28;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412802;
          v26 = v6;
          __int16 v27 = 2112;
          id v28 = v7;
          __int16 v29 = 2112;
          v30 = @"YES";
          _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "Could not find group mode enabled value because no context was found for phone number %@ simID %@. Defaulting to %@", (uint8_t *)&v25, 0x20u);
        }
      }
      LOBYTE(v19) = 1;
LABEL_28:

      goto LABEL_29;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v25 = 138412546;
        v26 = v6;
        __int16 v27 = 2112;
        id v28 = v7;
        _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "MMS is not configured for phone number %@ simID %@", (uint8_t *)&v25, 0x16u);
      }
    }
    LOBYTE(v19) = 0;
  }
  else
  {
    LOBYTE(v19) = 1;
  }
LABEL_29:

  return v19;
}

- (int)mmsEnabledToken
{
  return self->_mmsEnabledToken;
}

- (IMCTSMSUtilitiesManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMCTSMSUtilitiesManager;
  v2 = [(IMCTSMSUtilitiesManager *)&v5 init];
  BOOL v3 = v2;
  if (v2)
  {
    *(void *)&v2->_mmsEnabledToken = -1;
    [(IMCTSMSUtilitiesManager *)v2 registerServiceCapabilityNotifications];
  }
  return v3;
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A0790B24;
  block[3] = &unk_1E5A10168;
  block[4] = a1;
  if (qword_1EB4A61F8 != -1) {
    dispatch_once(&qword_1EB4A61F8, block);
  }
  v2 = (void *)qword_1EB4A6118;

  return v2;
}

- (id)uniqueIdentifierForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if ([v6 length]) {
    id v7 = v6;
  }
  else {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (BOOL)readMMSUserOverrideForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(IMCTSMSUtilitiesManager *)self mmsDefaultEnabledForPhoneNumber:v6 simID:v7];
  id v8 = @"MMSEnabled";
  char v9 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    v10 = [(IMCTSMSUtilitiesManager *)self uniqueIdentifierForPhoneNumber:v6 simID:v7];
    if ([v10 length])
    {
      id v8 = [NSString stringWithFormat:@"%@%@", @"MMSEnabled-", v10];
      char v9 = IMGetCachedDomainBoolForKeyWithDefaultValue();
    }
  }
  return v9;
}

- (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMFeatureFlags sharedFeatureFlags];
  int v8 = [v7 isReadMMSDefaultFromCBEnabled];

  if (v8)
  {
    char v9 = +[IMCTSubscriptionUtilities sharedInstance];
    v10 = [v9 ctSubscriptionInfo];
    v11 = objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);

    if (!v11)
    {
      if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
      {
        v11 = 0;
      }
      else
      {
        v13 = +[IMCTSubscriptionUtilities sharedInstance];
        int v14 = [v13 ctSubscriptionInfo];
        int v15 = [v14 subscriptions];
        v11 = [v15 firstObject];
      }
    }
    v16 = +[IMCTSubscriptionUtilities sharedInstance];
    uint64_t v17 = (void *)[v16 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_1EF305CB8 defaultValue:0 valueIfError:0];

    if (v17)
    {
      v18 = [v17 valueForKey:@"MMSDefaultEnabled"];
      int v19 = v18;
      if (v18) {
        char v12 = [v18 BOOLValue];
      }
      else {
        char v12 = 1;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (id)phoneNumbersEnabledForMultipleSubscriptionDevice
{
  v2 = +[IMCTSubscriptionUtilities sharedInstance];
  BOOL v3 = [v2 ctSubscriptionInfo];
  v4 = [v3 phoneNumbersOfActiveSubscriptions];

  return v4;
}

- (BOOL)readEnablePreviewTranscodingQualityCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v7 = +[IMCTSubscriptionUtilities sharedInstance];
    int v8 = [v7 ctSubscriptionInfo];
    char v9 = objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);

    if (v9)
    {
      v10 = +[IMCTSubscriptionUtilities sharedInstance];
      v11 = (void *)[v10 copyOperatorBundleValueForSubscriptionContext:v9 keyHierarchy:&unk_1EF305CD0 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
      int v12 = [v11 BOOLValue];
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = @"NO";
      int v16 = 138412802;
      if (v12) {
        int v14 = @"YES";
      }
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Operator/EnablePreviewTranscodingQuality: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }
  }
  return v12;
}

- (BOOL)readDisablePreviewTranscodingQualityOnWiFiCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v7 = +[IMCTSubscriptionUtilities sharedInstance];
    int v8 = [v7 ctSubscriptionInfo];
    char v9 = objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);

    if (v9)
    {
      v10 = +[IMCTSubscriptionUtilities sharedInstance];
      v11 = (void *)[v10 copyOperatorBundleValueForSubscriptionContext:v9 keyHierarchy:&unk_1EF305CE8 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
      int v12 = [v11 BOOLValue];
    }
    else
    {
      int v12 = 0;
    }
  }
  else
  {
    int v12 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = @"NO";
      int v16 = 138412802;
      if (v12) {
        int v14 = @"YES";
      }
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Operator/DisablePreviewTranscodingQualityOnWiFi: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }
  }
  return v12;
}

- (BOOL)readDisablePreviewTranscodingQualityOnWRMCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v7 = +[IMCTSubscriptionUtilities sharedInstance];
    int v8 = [v7 ctSubscriptionInfo];
    char v9 = objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);

    if (v9)
    {
      v10 = +[IMCTSubscriptionUtilities sharedInstance];
      v11 = (void *)[v10 copyOperatorBundleValueForSubscriptionContext:v9 keyHierarchy:&unk_1EF305D00 defaultValue:MEMORY[0x1E4F1CC38] valueIfError:MEMORY[0x1E4F1CC38]];
      int v12 = [v11 BOOLValue];
    }
    else
    {
      int v12 = 1;
    }
  }
  else
  {
    int v12 = IMGetCachedDomainBoolForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = @"NO";
      int v16 = 138412802;
      if (v12) {
        int v14 = @"YES";
      }
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Operator/DisablePreviewTranscodingQualityOnWRMRecommendation: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }
  }
  return v12;
}

- (unint64_t)readAttachmentPreviewTranscodingQualitySizeCarrierValueForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v7 = +[IMCTSubscriptionUtilities sharedInstance];
    int v8 = [v7 ctSubscriptionInfo];
    char v9 = objc_msgSend(v8, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);

    if (v9)
    {
      v10 = +[IMCTSubscriptionUtilities sharedInstance];
      v11 = (void *)[v10 copyOperatorBundleValueForSubscriptionContext:v9 keyHierarchy:&unk_1EF305D18 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
      unint64_t v12 = (int)[v11 intValue];
    }
    else
    {
      unint64_t v12 = 0;
    }
  }
  else
  {
    unint64_t v12 = IMGetCachedDomainIntForKeyWithDefaultValue();
  }
  if (IMOSLoggingEnabled())
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = [NSNumber numberWithUnsignedInteger:v12];
      int v16 = 138412802;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Operator/AttachmentPreviewTranscodingQualitySize: %@ for phone number %@ simID %@", (uint8_t *)&v16, 0x20u);
    }
  }

  return v12;
}

- (BOOL)mmsSupportedAndConfiguredForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((IMSharedHelperDeviceIsAltAccount() & 1) != 0
    || ([MEMORY[0x1E4F61740] sharedInstance],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 supportsMMS],
        v7,
        (v8 & 1) != 0))
  {
    if (qword_1EB4A6618 != -1) {
      dispatch_once(&qword_1EB4A6618, &unk_1EF2C1358);
    }
    char v21 = 1;
    if (IMSharedHelperRetrieveSimDetailsFromTelephony())
    {
      char v9 = +[IMCTSubscriptionUtilities sharedInstance];
      __int16 v20 = [v9 ctSubscriptionInfo];

      v10 = objc_msgSend(v20, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
      if (v10)
      {
        uint64_t v11 = 3;
        do
        {
          unint64_t v12 = [(id)qword_1E94FF310 sharedMessageCenter];
          uint64_t v13 = [v12 isMmsEnabledForSub:v10 enabled:&v21];

          if (!v13) {
            break;
          }
          if (IMOSLoggingEnabled())
          {
            int v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              id v23 = v10;
              __int16 v24 = 2048;
              uint64_t v25 = (int)v13;
              __int16 v26 = 2048;
              uint64_t v27 = v13 >> 32;
              _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "MMS configured check for slot %@ failed (%ld, %ld) retrying...", buf, 0x20u);
            }
          }
          --v11;
        }
        while (v11);
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v23 = v5;
            _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Could not find whether MMS was enabled because no context was found for phone number %@. Returning NO", buf, 0xCu);
          }
        }
        char v21 = 0;
      }

      char v16 = v21 != 0;
    }
    else
    {
      int v15 = [(id)qword_1E94FF310 sharedMessageCenter];
      char v16 = [v15 isMmsConfigured];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Device does not have support MMS", buf, 2u);
      }
    }
    char v16 = 0;
  }

  return v16;
}

- (int)mmsMaximumSlideCountForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
    {
      char v8 = +[IMCTSubscriptionUtilities sharedInstance];
      char v9 = [v8 ctSubscriptionInfo];
      v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v10)
      {
        uint64_t v11 = +[IMCTSubscriptionUtilities sharedInstance];
        unint64_t v12 = (void *)[v11 copyCarrierBundleValueForSubscriptionContext:v10 keyHierarchy:&unk_1EF305D30 defaultValue:&unk_1EF3058F8 valueIfError:&unk_1EF305910];
        int v13 = [v12 intValue];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)char v16 = 0;
            _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "No context found, returning 0 max slide count", v16, 2u);
          }
        }
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = IMMMSMaximumSlideCount();
  }

  return v13;
}

- (int)mmsMaximumMessageByteCountForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    int v16 = IMMMSMaximumMessageByteCount();
    goto LABEL_28;
  }
  if (![(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        *(void *)uint64_t v22 = v6;
        *(_WORD *)&v22[8] = 2112;
        *(void *)&v22[10] = v7;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "MMS is not configured for phone number %@ simID %@", (uint8_t *)&v21, 0x16u);
      }
      goto LABEL_20;
    }
LABEL_21:
    int v16 = 0x100000;
    goto LABEL_28;
  }
  char v8 = [MEMORY[0x1E4F61740] sharedInstance];
  uint64_t v9 = [v8 deviceType];

  if (v9 != 2)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v21 = 67109120;
        *(_DWORD *)uint64_t v22 = 0x100000;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Non iPhone should not have multiple subscriptions! ******** FILE A RADAR **********. Defaulting to %d", (uint8_t *)&v21, 8u);
      }
LABEL_20:

      goto LABEL_21;
    }
    goto LABEL_21;
  }
  v10 = +[IMCTSubscriptionUtilities sharedInstance];
  uint64_t v11 = [v10 ctSubscriptionInfo];
  unint64_t v12 = objc_msgSend(v11, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

  if (v12)
  {
    int v13 = +[IMCTSubscriptionUtilities sharedInstance];
    int v14 = (void *)[v13 copyCarrierBundleValueForSubscriptionContext:v12 keyHierarchy:&unk_1EF305D48 defaultValue:&unk_1EF305928 valueIfError:&unk_1EF305910];
    int v15 = [v14 intValue];

    if (v15 <= 0) {
      int v16 = 0x100000;
    }
    else {
      int v16 = v15;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v21 = 67109634;
        *(_DWORD *)uint64_t v22 = v16;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v6;
        *(_WORD *)&v22[14] = 2112;
        *(void *)&v22[16] = v7;
        _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Settng MaxMessageSize to:%d for phone number: %@ simID %@", (uint8_t *)&v21, 0x1Cu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v21 = 67109634;
        *(_DWORD *)uint64_t v22 = 0x100000;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v6;
        *(_WORD *)&v22[14] = 2112;
        *(void *)&v22[16] = v7;
        _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "No context found, returning %d for MaxMessageSize for phone number: %@ simID %@", (uint8_t *)&v21, 0x1Cu);
      }
    }
    int v16 = 0x100000;
  }

LABEL_28:
  return v16;
}

- (BOOL)mmsGroupTextReplicationSupportedForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = (char *)a3;
  id v7 = a4;
  if ([(IMCTSMSUtilitiesManager *)self mmsGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v6 simID:v7])
  {
    if (IMSharedHelperRetrieveSimDetailsFromTelephony())
    {
      char v8 = +[IMCTSubscriptionUtilities sharedInstance];
      uint64_t v9 = [v8 ctSubscriptionInfo];
      v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v10)
      {
        uint64_t v11 = +[IMCTSubscriptionUtilities sharedInstance];
        unint64_t v12 = (void *)[v11 copyCarrierBundleValueForSubscriptionContext:v10 keyHierarchy:&unk_1EF305D90 defaultValue:MEMORY[0x1E4F1CC38] valueIfError:MEMORY[0x1E4F1CC38]];
        int v13 = [v12 BOOLValue];

        if (IMOSLoggingEnabled())
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v15 = @"NO";
            int v19 = 138412802;
            __int16 v20 = v6;
            __int16 v21 = 2112;
            if (v13) {
              int v15 = @"YES";
            }
            id v22 = v7;
            __int16 v23 = 2112;
            __int16 v24 = v15;
            _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Hybrid groups enabled by carrier for %@ %@: %@", (uint8_t *)&v19, 0x20u);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v19 = 138412802;
            __int16 v20 = v6;
            __int16 v21 = 2112;
            id v22 = v7;
            __int16 v23 = 2112;
            __int16 v24 = @"YES";
            _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Could not find group replication enabled value because no context was found for phone number %@ simID %@. Defaulting to %@", (uint8_t *)&v19, 0x20u);
          }
        }
        LOBYTE(v13) = 1;
      }
    }
    else
    {
      LOBYTE(v13) = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v19 = 136315138;
        __int16 v20 = "-[IMCTSMSUtilitiesManager mmsGroupTextReplicationSupportedForPhoneNumber:simID:]";
        _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Group MMS not enabled, returning NO for %s", (uint8_t *)&v19, 0xCu);
      }
    }
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (BOOL)mmsGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  char v8 = [v7 objectForKey:@"disable-hybrid-smil-content-location"];
  uint64_t v9 = v8;
  if (v8 && [v8 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "SMIL content location hybrid support disabled via IDSServerBag", (uint8_t *)&v21, 2u);
      }
    }
    LOBYTE(v11) = 0;
  }
  else if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    unint64_t v12 = +[IMCTSubscriptionUtilities sharedInstance];
    int v13 = [v12 ctSubscriptionInfo];
    int v14 = objc_msgSend(v13, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);

    if (v14)
    {
      int v15 = +[IMCTSubscriptionUtilities sharedInstance];
      int v16 = (void *)[v15 copyCarrierBundleValueForSubscriptionContext:v14 keyHierarchy:&unk_1EF305DA8 defaultValue:MEMORY[0x1E4F1CC38] valueIfError:MEMORY[0x1E4F1CC38]];
      int v11 = [v16 BOOLValue];

      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          __int16 v18 = @"NO";
          int v21 = 138412802;
          id v22 = v5;
          __int16 v23 = 2112;
          if (v11) {
            __int16 v18 = @"YES";
          }
          id v24 = v6;
          __int16 v25 = 2112;
          __int16 v26 = v18;
          _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "SMIL content location supports Apple message identifier for %@ %@: %@", (uint8_t *)&v21, 0x20u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412802;
          id v22 = v5;
          __int16 v23 = 2112;
          id v24 = v6;
          __int16 v25 = 2112;
          __int16 v26 = @"YES";
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Could not find whether SMIL content location supports Apple message identifiers because no context was found for phone number %@ simID %@. Defaulting to %@", (uint8_t *)&v21, 0x20u);
        }
      }
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (int)mmsMaxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
    {
      char v8 = +[IMCTSubscriptionUtilities sharedInstance];
      uint64_t v9 = [v8 ctSubscriptionInfo];
      v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v10)
      {
        int v11 = +[IMCTSubscriptionUtilities sharedInstance];
        unint64_t v12 = (void *)[v11 copyCarrierBundleValueForSubscriptionContext:v10 keyHierarchy:&unk_1EF305DC0 defaultValue:&unk_1EF3058F8 valueIfError:&unk_1EF3058F8];
        int v13 = [v12 intValue];

        if (v13 >= 1)
        {
          if (v13 <= 10) {
            int v14 = 10;
          }
          else {
            int v14 = v13;
          }
          if (IMOSLoggingEnabled())
          {
            int v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v18[0] = 67109376;
              v18[1] = v14;
              __int16 v19 = 1024;
              int v20 = v13;
              _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Setting  maxNumberOfRecipents to %d, maxValue from Dictionary was %d", (uint8_t *)v18, 0xEu);
            }
          }
          goto LABEL_19;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        int v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18[0]) = 0;
          _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Subscription context was nil, returning 0 for max recipients for phone number", (uint8_t *)v18, 2u);
        }
      }
      int v14 = 0x7FFFFFFF;
LABEL_19:

      goto LABEL_20;
    }
    int v14 = 0x7FFFFFFF;
  }
  else
  {
    int v14 = IMMMSMaxRecipients();
  }
LABEL_20:

  return v14;
}

- (int)mmsMaxImageDimensionForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
    {
      char v8 = +[IMCTSubscriptionUtilities sharedInstance];
      uint64_t v9 = [v8 ctSubscriptionInfo];
      v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v10)
      {
        int v11 = +[IMCTSubscriptionUtilities sharedInstance];
        unint64_t v12 = (void *)[v11 copyCarrierBundleValueForSubscriptionContext:v10 keyHierarchy:&unk_1EF305DD8 defaultValue:&unk_1EF3058F8 valueIfError:&unk_1EF3058F8];
        int v13 = [v12 intValue];

        if (IMOSLoggingEnabled())
        {
          int v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v17 = 67109634;
            int v18 = v13;
            __int16 v19 = 2112;
            id v20 = v6;
            __int16 v21 = 2112;
            id v22 = v7;
            _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Setting MaxImageDimension to %d, for phone number %@ simID %@", (uint8_t *)&v17, 0x1Cu);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            int v17 = 67109120;
            int v18 = 0x7FFFFFFF;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Subscription context was nil, returning %d for max image dimension", (uint8_t *)&v17, 8u);
          }
        }
        int v13 = 0x7FFFFFFF;
      }
    }
    else
    {
      int v13 = 0x7FFFFFFF;
    }
  }
  else
  {
    int v13 = IMMMSMaxImageDimension();
  }

  return v13;
}

- (BOOL)mmsSupportsH264VideoForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
    {
      char v8 = +[IMCTSubscriptionUtilities sharedInstance];
      uint64_t v9 = [v8 ctSubscriptionInfo];
      v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v10)
      {
        int v11 = +[IMCTSubscriptionUtilities sharedInstance];
        unint64_t v12 = (void *)[v11 copyCarrierBundleValueForSubscriptionContext:v10 keyHierarchy:&unk_1EF305DF0 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
        int v13 = [v12 intValue];

        char v14 = v13 > 0;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int v17 = 0;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Subscription context was nil, returning NO for SupportsH264Video.", v17, 2u);
          }
        }
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = IMMMSSupportsH264Video();
  }

  return v14;
}

- (double)mmsMaximumAudioDurationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (!qword_1E94FF880)
    {
      char v8 = (void **)MEMORY[0x1A6227920]("AVAssetExportPresetAudioOnlyMMS", @"AVFoundation");
      if (v8) {
        uint64_t v9 = *v8;
      }
      else {
        uint64_t v9 = 0;
      }
      objc_storeStrong((id *)&qword_1E94FF880, v9);
    }
    -[IMCTSMSUtilitiesManager mmsMaximumDurationWithPreset:phoneNumber:simID:](self, "mmsMaximumDurationWithPreset:phoneNumber:simID:");
  }
  else
  {
    v10 = (void *)qword_1E94FF888;
    if (!qword_1E94FF888)
    {
      int v11 = (void **)MEMORY[0x1A6227920]("AVAssetExportPresetMMS", @"AVFoundation");
      if (v11) {
        unint64_t v12 = *v11;
      }
      else {
        unint64_t v12 = 0;
      }
      objc_storeStrong((id *)&qword_1E94FF888, v12);
      v10 = (void *)qword_1E94FF888;
    }
    double v13 = sub_1A08426DC(v10);
  }
  double v14 = v13;

  return v14;
}

- (double)mmsMaximumVideoDurationForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if (!qword_1E94FF890)
    {
      char v8 = (void **)MEMORY[0x1A6227920]("AVAssetExportPresetMMS", @"AVFoundation");
      if (v8) {
        uint64_t v9 = *v8;
      }
      else {
        uint64_t v9 = 0;
      }
      objc_storeStrong((id *)&qword_1E94FF890, v9);
    }
    -[IMCTSMSUtilitiesManager mmsMaximumDurationWithPreset:phoneNumber:simID:](self, "mmsMaximumDurationWithPreset:phoneNumber:simID:");
  }
  else
  {
    v10 = (void *)qword_1E94FF898;
    if (!qword_1E94FF898)
    {
      int v11 = (void **)MEMORY[0x1A6227920]("AVAssetExportPresetMMS", @"AVFoundation");
      if (v11) {
        unint64_t v12 = *v11;
      }
      else {
        unint64_t v12 = 0;
      }
      objc_storeStrong((id *)&qword_1E94FF898, v12);
      v10 = (void *)qword_1E94FF898;
    }
    double v13 = sub_1A08426DC(v10);
  }
  double v14 = v13;

  return v14;
}

- (double)mmsMaximumDurationWithPreset:(id)a3 phoneNumber:(id)a4 simID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    if (qword_1E94FF8A8 != -1) {
      dispatch_once(&qword_1E94FF8A8, &unk_1EF2BD798);
    }
    if (qword_1E94FF8B8 != -1) {
      dispatch_once(&qword_1E94FF8B8, &unk_1EF2BE2D8);
    }
    int v11 = objc_msgSend(objc_alloc(NSNumber), "initWithLongLong:", -[IMCTSMSUtilitiesManager mmsMaximumMessageByteCountForPhoneNumber:simID:](self, "mmsMaximumMessageByteCountForPhoneNumber:simID:", v9, v10));
    unint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v11, @"fileLengthLimit", 0);
    long long v17 = 0uLL;
    uint64_t v18 = 0;
    if (qword_1E94FF8A0) {
      [(id)qword_1E94FF8A0 maximumDurationForPreset:v8 properties:v12];
    }
    long long v15 = v17;
    uint64_t v16 = v18;
    double v13 = off_1E94FF8B0(&v15);
  }
  else
  {
    double v13 = INFINITY;
  }

  return v13;
}

- (void)iMessageMaxTransferFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    long long v15 = [v12 objectForKey:@"att-wifi-max-file-size"];
    unint64_t v16 = [v15 unsignedIntegerValue];

    long long v17 = [v12 objectForKey:@"att-cellular-max-file-size"];
    uint64_t v18 = [v17 unsignedIntegerValue];

    if (!v16) {
      unint64_t v16 = 10485760;
    }
    if (v18) {
      unint64_t v19 = v18;
    }
    else {
      unint64_t v19 = 0x400000;
    }
    if (a3)
    {
      if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v13 simID:v14])
      {
        int v20 = [(IMCTSMSUtilitiesManager *)self mmsMaximumMessageByteCountForPhoneNumber:v13 simID:v14];
        if (v16 <= v20) {
          unint64_t v16 = v20;
        }
      }
      *a3 = v16;
      if (IMOSLoggingEnabled())
      {
        __int16 v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          unint64_t v22 = *a3;
          int v25 = 134217984;
          unint64_t v26 = v22;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Returning carrier bundle value %tu for key IMiMessageMaxTransferFileSizeForWifiForPhoneNumber", (uint8_t *)&v25, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, "No wifiSize pointer provided for IMiMessageMaxTransferFileSizeForWifiForPhoneNumber", (uint8_t *)&v25, 2u);
      }
    }
    if (a4)
    {
      if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v13 simID:v14])
      {
        unint64_t v24 = [(IMCTSMSUtilitiesManager *)self mmsMaximumMessageByteCountForPhoneNumber:v13 simID:v14];
        if (v19 > v24) {
          unint64_t v24 = v19;
        }
        *a4 = v24;
      }
      else
      {
        *a4 = v19;
      }
    }
  }
  else
  {
    IMiMessageMaxTransferFileSizeForWifi();
  }
}

- (unint64_t)iMessageMaxTransferAudioFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    long long v15 = [v12 objectForKey:@"att-wifi-audio-max-file-size"];
    unint64_t v16 = [v15 unsignedIntegerValue];

    long long v17 = [v12 objectForKey:@"att-wifi-audio-cellular-file-size"];
    unint64_t v18 = [v17 unsignedIntegerValue];

    if (!v16) {
      unint64_t v16 = 10485760;
    }
    if (!v18) {
      unint64_t v18 = 0x400000;
    }
    if (a3)
    {
      *a3 = v16;
      if (IMOSLoggingEnabled())
      {
        unint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          unint64_t v20 = *a3;
          int v24 = 134217984;
          unint64_t v25 = v20;
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Returning carrier bundle value %tu for key IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "No wifiSize pointer provided for IMiMessageMaxTransferAudioFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 2u);
      }
    }
    if (a4)
    {
      if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v13 simID:v14])
      {
        unint64_t v22 = [(IMCTSMSUtilitiesManager *)self mmsMaximumMessageByteCountForPhoneNumber:v13 simID:v14];
        if (v18 > v22) {
          unint64_t v22 = v18;
        }
        *a4 = v22;
      }
      else
      {
        *a4 = v18;
      }
    }
  }
  else
  {
    unint64_t v16 = IMiMessageMaxTransferAudioFileSizeForWifi();
  }

  return v16;
}

- (unint64_t)iMessageMaxTransferVideoFileSizeForWifiForPhoneNumber:(unint64_t *)a3 cellSize:(unint64_t *)a4 serverConfigurationBag:(id)a5 phoneNumber:(id)a6 simID:(id)a7
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    long long v15 = [v12 objectForKey:@"att-wifi-video-max-file-size"];
    unint64_t v16 = [v15 unsignedIntegerValue];

    long long v17 = [v12 objectForKey:@"att-wifi-video-cellular-file-size"];
    unint64_t v18 = [v17 unsignedIntegerValue];

    if (!v16) {
      unint64_t v16 = 10485760;
    }
    if (!v18) {
      unint64_t v18 = 0x400000;
    }
    if (a3)
    {
      *a3 = v16;
      if (IMOSLoggingEnabled())
      {
        unint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          unint64_t v20 = *a3;
          int v24 = 134217984;
          unint64_t v25 = v20;
          _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Returning carrier bundle value %tu for key IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "No wifiSize pointer provided for IMiMessageMaxTransferVideoFileSizeForWifiForPhoneNumber", (uint8_t *)&v24, 2u);
      }
    }
    if (a4)
    {
      if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v13 simID:v14])
      {
        unint64_t v22 = [(IMCTSMSUtilitiesManager *)self mmsMaximumMessageByteCountForPhoneNumber:v13 simID:v14];
        if (v18 > v22) {
          unint64_t v22 = v18;
        }
        *a4 = v22;
      }
      else
      {
        *a4 = v18;
      }
    }
  }
  else
  {
    unint64_t v16 = IMiMessageMaxTransferAudioFileSizeForWifi();
  }

  return v16;
}

- (id)mmsEmailAddressToMatchForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    if ([(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:v6 simID:v7])
    {
      id v8 = +[IMCTSubscriptionUtilities sharedInstance];
      id v9 = [v8 ctSubscriptionInfo];
      id v10 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v7, v6);

      if (v10
        && (+[IMCTSubscriptionUtilities sharedInstance],
            int v11 = objc_claimAutoreleasedReturnValue(),
            id v12 = (void *)[v11 copyCarrierBundleValueForSubscriptionContext:v10 keyHierarchy:&unk_1EF305E08 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]], v13 = objc_msgSend(v12, "BOOLValue"), v12, v11, v13))
      {
        id v14 = (void *)CFPreferencesCopyAppValue(@"MMSEmailAddress", @"com.apple.MobileSMS");
        if (qword_1E94FF8C0 != -1) {
          dispatch_once(&qword_1E94FF8C0, &unk_1EF2BE318);
        }
      }
      else
      {
        id v14 = 0;
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = IMMMSEmailAddressToMatch();
  }

  return v14;
}

- (BOOL)shouldShowMMSEmailAddress:(id)a3 simID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL SimDetailsFromTelephony = IMSharedHelperRetrieveSimDetailsFromTelephony();
  id v8 = +[IMCTSubscriptionUtilities sharedInstance];
  id v9 = [v8 ctSubscriptionInfo];
  id v10 = v9;
  if (SimDetailsFromTelephony)
  {
    int v11 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
  }
  else
  {
    id v12 = [v9 subscriptions];
    uint64_t v13 = [v12 count];

    if (v13 != 1)
    {
      int v11 = 0;
      goto LABEL_8;
    }
    id v8 = +[IMCTSubscriptionUtilities sharedInstance];
    id v10 = [v8 ctSubscriptionInfo];
    id v14 = [v10 subscriptions];
    int v11 = [v14 firstObject];
  }
  if (v11)
  {
    long long v15 = +[IMCTSubscriptionUtilities sharedInstance];
    unint64_t v16 = (void *)[v15 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_1EF305E20 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
    int v17 = [v16 BOOLValue];

    unint64_t v18 = @"YES";
    goto LABEL_9;
  }
LABEL_8:
  int v17 = 0;
  unint64_t v18 = @"NO";
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    unint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      unint64_t v20 = @"NO";
      if (v17) {
        unint64_t v20 = @"YES";
      }
      int v22 = 138412546;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      unint64_t v25 = v20;
      _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Did find context: %@, showMMSEmailAddress: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  return v17;
}

- (BOOL)isEagerUploadEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v9 = [v8 objectForKey:@"disable-eager-upload"];
  id v10 = v9;
  if (v9 && [v9 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = 0;
        id v12 = "Eager upload disabled in IDSServerBag";
        uint64_t v13 = (uint8_t *)&v22;
LABEL_17:
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, v12, v13, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  id v14 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v15 = [v14 isInternalInstall];

  if (v15 && (IMGetCachedDomainBoolForKeyWithDefaultValue() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v12 = "Eager upload disabled in defaults com.apple.imessage";
        uint64_t v13 = buf;
        goto LABEL_17;
      }
LABEL_18:
    }
LABEL_19:
    BOOL v18 = 0;
    goto LABEL_20;
  }
  BOOL v16 = [(IMCTSMSUtilitiesManager *)self mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:v6 simID:v7];
  if (v16 && IMOSLoggingEnabled())
  {
    int v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)unint64_t v20 = 0;
      _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Eager upload disabled in Carrier Bundle", v20, 2u);
    }
  }
  BOOL v18 = !v16;
LABEL_20:

  return v18;
}

- (BOOL)mmsEagerUploadDisabledInCarrierBundleForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL SimDetailsFromTelephony = IMSharedHelperRetrieveSimDetailsFromTelephony();
  id v8 = +[IMCTSubscriptionUtilities sharedInstance];
  id v9 = [v8 ctSubscriptionInfo];
  id v10 = v9;
  if (SimDetailsFromTelephony)
  {
    int v11 = objc_msgSend(v9, "__im_subscriptionContextOrDefaultForForSimID:phoneNumber:", v6, v5);
  }
  else
  {
    id v12 = [v9 subscriptions];
    uint64_t v13 = [v12 count];

    if (v13 != 1)
    {
      int v11 = 0;
      goto LABEL_8;
    }
    id v8 = +[IMCTSubscriptionUtilities sharedInstance];
    id v10 = [v8 ctSubscriptionInfo];
    id v14 = [v10 subscriptions];
    int v11 = [v14 firstObject];
  }
  if (v11)
  {
    int v15 = +[IMCTSubscriptionUtilities sharedInstance];
    BOOL v16 = (void *)[v15 copyCarrierBundleValueForSubscriptionContext:v11 keyHierarchy:&unk_1EF305E38 defaultValue:MEMORY[0x1E4F1CC28] valueIfError:MEMORY[0x1E4F1CC28]];
    int v17 = [v16 BOOLValue];

    BOOL v18 = @"NO";
    goto LABEL_9;
  }
LABEL_8:
  int v17 = 0;
  BOOL v18 = @"YES";
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    unint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      unint64_t v20 = @"NO";
      if (v17) {
        unint64_t v20 = @"YES";
      }
      int v22 = 138412546;
      uint64_t v23 = v18;
      __int16 v24 = 2112;
      unint64_t v25 = v20;
      _os_log_impl(&dword_1A0772000, v19, OS_LOG_TYPE_INFO, "Did find context: %@, DisableEagerUpload: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  return v17;
}

- (BOOL)mmsRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  return [(IMCTSMSUtilitiesManager *)self mmsRestrictedModeEnabledForPhoneNumber:a3 simID:a4 reset:0];
}

- (BOOL)mmsRestrictedModeEnabledForPhoneNumber:(id)a3 simID:(id)a4 reset:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v10 = [(IMCTSMSUtilitiesManager *)self uniqueIdentifierForPhoneNumber:v8 simID:v9];
    if (v10)
    {
      Boolean keyExistsAndHasValidFormat = 0;
      int v11 = [NSString stringWithFormat:@"%@%@", @"MMSRestricted-", v10];
      int AppBooleanValue = CFPreferencesGetAppBooleanValue(v11, @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
      char v13 = AppBooleanValue != 0;
      if (AppBooleanValue) {
        BOOL v14 = !v5;
      }
      else {
        BOOL v14 = 0;
      }
      if (!v14 && (byte_1E94FF8C8 & 1) == 0)
      {
        byte_1E94FF8C8 = 1;
        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Now listening for restricted mode changed notifications", buf, 2u);
          }
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1A0843C94, @"com.apple.MobileSMS.MMSRestricted.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
    }
    else
    {
      char v13 = IMMMSRestrictedModeEnabled();
    }
  }
  else
  {
    char v13 = IMMMSRestrictedModeEnabled();
  }

  return v13;
}

- (void)synchronizeMMSCapabilityToWatch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (qword_1EB4A6160
    && ([MEMORY[0x1E4F1C9C8] date],
        v4 = objc_claimAutoreleasedReturnValue(),
        [v4 timeIntervalSinceDate:qword_1EB4A6160],
        double v6 = v5,
        v4,
        v6 <= 300.0)
    && (Boolean keyExistsAndHasValidFormat = 0,
        int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MMSRelayEnabled", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat), keyExistsAndHasValidFormat == 1)&& (AppBooleanValue != 0) == v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = @"NO";
        if (AppBooleanValue) {
          id v10 = @"YES";
        }
        else {
          id v10 = @"NO";
        }
        if (v3) {
          id v9 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        __int16 v21 = v10;
        __int16 v22 = 2112;
        uint64_t v23 = v9;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Not setting MMSEnabled from %@ to %@, skipping sync", buf, 0x16u);
      }
    }
  }
  else
  {
    int v11 = (objc_class *)MEMORY[0x1A6227910](@"NPSManager", @"NanoPreferencesSync");
    if (v11)
    {
      id v12 = objc_alloc_init(v11);
      CFPreferencesSetAppValue(@"MMSRelayEnabled", (CFPropertyListRef)[NSNumber numberWithBool:v3], @"com.apple.MobileSMS");
      if (IMOSLoggingEnabled())
      {
        char v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          BOOL v14 = @"NO";
          if (v3) {
            BOOL v14 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          __int16 v21 = v14;
          _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Setting MMSEnabled Nano Preference to: %@", buf, 0xCu);
        }
      }
      CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
      int v15 = [MEMORY[0x1E4F1CAD0] setWithObject:@"MMSRelayEnabled"];
      [v12 synchronizeUserDefaultsDomain:@"com.apple.MobileSMS" keys:v15];

      uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
      int v17 = (void *)qword_1EB4A6160;
      qword_1EB4A6160 = v16;
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Could not weak link ____NPSManagerClass in _synchronizeMMSCapabilityToWatch", buf, 2u);
      }
    }
  }
}

- (void)synchronizePreferredSubscriptionMMSCapabilityToWatch
{
  BOOL v3 = [(IMCTSMSUtilitiesManager *)self mmsEnabledForPhoneNumber:0 simID:0];
  if (IMSharedHelperDeviceHasMultipleSubscriptions()) {
    [(IMCTSMSUtilitiesManager *)self synchronizeMMSCapabilityToWatch:v3];
  }
  notify_set_state([(IMCTSMSUtilitiesManager *)self mmsEnabledToken], v3);

  notify_post("kMMSEnabledDidChange");
}

- (id)countryCodeForSimSlot:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = +[IMCTSubscriptionUtilities sharedInstance];
  double v5 = [v4 ctSubscriptionInfo];
  double v6 = objc_msgSend(v5, "__im_subscriptionContextForForSlotID:", a3);

  if (v6)
  {
    id v7 = +[IMCTSubscriptionUtilities sharedInstance];
    id v8 = (void *)[v7 copyIsoCountryCodeForSubscriptionContext:v6];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        int64_t v12 = a3;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Could not find subscription context for slot %ld", (uint8_t *)&v11, 0xCu);
      }
    }
    id v8 = 0;
  }

  return v8;
}

- (id)countryCodeForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMCTSubscriptionUtilities sharedInstance];
  id v8 = [v7 ctSubscriptionInfo];
  id v9 = objc_msgSend(v8, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);

  if (v9)
  {
    id v10 = +[IMCTSubscriptionUtilities sharedInstance];
    int v11 = (void *)[v10 copyIsoCountryCodeForSubscriptionContext:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412546;
        id v15 = v5;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Could not find subscription context for phone number %@ and sim ID %@", (uint8_t *)&v14, 0x16u);
      }
    }
    int v11 = 0;
  }

  return v11;
}

- (BOOL)messagesFilteringSettingForPreferedSubscription
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL SimDetailsFromTelephony = IMSharedHelperRetrieveSimDetailsFromTelephony();
  BOOL v3 = +[IMCTSubscriptionUtilities sharedInstance];
  v4 = [v3 ctSubscriptionInfo];
  id v5 = v4;
  if (SimDetailsFromTelephony)
  {
    id v6 = [v4 preferredOrDefaultSubscriptionContext];
  }
  else
  {
    id v7 = [v4 subscriptions];
    uint64_t v8 = [v7 count];

    if (v8 != 1)
    {
      id v6 = 0;
      goto LABEL_8;
    }
    BOOL v3 = +[IMCTSubscriptionUtilities sharedInstance];
    id v5 = [v3 ctSubscriptionInfo];
    id v9 = [v5 subscriptions];
    id v6 = [v9 firstObject];
  }
  if (v6)
  {
    id v10 = +[IMCTSubscriptionUtilities sharedInstance];
    int v11 = (void *)[v10 copyCarrierBundleValueForSubscriptionContext:v6 keyHierarchy:&unk_1EF305E50 defaultValue:MEMORY[0x1E4F1CC38] valueIfError:MEMORY[0x1E4F1CC28]];
    BOOL v12 = [v11 intValue] != 0;

    uint64_t v13 = @"YES";
    goto LABEL_9;
  }
LABEL_8:
  BOOL v12 = 0;
  uint64_t v13 = @"NO";
LABEL_9:
  if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"NO";
      if (v12) {
        id v15 = @"YES";
      }
      int v17 = 138412546;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      unint64_t v20 = v15;
      _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, "Did find context: %@. filteringEnabled: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  return v12;
}

- (id)carrierBundleValueForKeyHierarchy:(id)a3 phoneNumber:(id)a4 simID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMCTSubscriptionUtilities sharedInstance];
  int v11 = [v10 ctSubscriptionInfo];
  BOOL v12 = objc_msgSend(v11, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v8);

  uint64_t v13 = +[IMCTSubscriptionUtilities sharedInstance];
  int v14 = (void *)[v13 copyCarrierBundleValueForSubscriptionContext:v12 keyHierarchy:v9 defaultValue:0 valueIfError:0];

  return v14;
}

- (id)carrierNameForPhoneNumber:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (MEMORY[0x1A62278C0]())
  {
    id v5 = [(IMCTSMSUtilitiesManager *)self carrierBundleValueForKeyHierarchy:&unk_1EF305E68 phoneNumber:v4 simID:0];
    if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v8 = 138412546;
          id v9 = v4;
          __int16 v10 = 2112;
          int v11 = v5;
          _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Error getting carrier name for phone number - %@. Carrier Bundle Object -> %@", (uint8_t *)&v8, 0x16u);
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)smsAllowCaseSensitiveSenderIDForPhoneNumber:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMCTSMSUtilitiesManager *)self carrierBundleValueForKeyHierarchy:&unk_1EF305E80 phoneNumber:v4 simID:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v5 objectForKeyedSubscript:@"AllowCasesensitiveSenderID"];
    id v7 = v6;
    if (v6) {
      int v8 = [v6 BOOLValue];
    }
    else {
      int v8 = 1;
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = @"NO";
        if (v8) {
          int v11 = @"YES";
        }
        int v13 = 138412290;
        int v14 = v11;
        _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "AllowCasesensitiveSenderID provided by carrier is -> %@.\n", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        int v14 = (__CFString *)&unk_1EF305E80;
        __int16 v15 = 2112;
        __int16 v16 = v5;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Error getting Carrier Bundle dictionary. Key Hierarchy -> %@.\nPhoneNumber -> %@", (uint8_t *)&v13, 0x16u);
      }
    }
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (BOOL)shouldUploadToMMCS:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Checking to See if we should upload to MMCS", buf, 2u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  __int16 v19 = v3;
  id v5 = [v3 objectForKey:@"k"];
  int v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        __int16 v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v11 = [v10 objectForKey:@"type"];
        int v12 = [v11 isEqualToString:@"text/plain"];

        if (v12)
        {
          if (!IMOSLoggingEnabled()) {
            continue;
          }
          int v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Found A Text Part thats OK", buf, 2u);
          }
          goto LABEL_14;
        }
        int v14 = [v10 objectForKey:@"type"];
        int v15 = [v14 isEqualToString:@"application/smil"];

        int v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            int v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Found SMIL data.. thats OK ", buf, 2u);
            }
LABEL_14:

            continue;
          }
        }
        else
        {
          if (v16)
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A0772000, v17, OS_LOG_TYPE_INFO, "Found Something else that wasnt there, looks like we need to upload this one to MMCS", buf, 2u);
            }
          }
          ++v6;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  return v6 > 0;
}

- (id)myCTPhoneNumber
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    v2 = +[IMCTSubscriptionUtilities sharedInstance];
    id v3 = [v2 ctPhoneNumber];

    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      int v11 = v3;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from subscription context is: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v5 = [MEMORY[0x1E4F61740] sharedInstance];
    int v6 = [v5 telephoneNumber];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F61740] sharedInstance];
      id v3 = [v7 telephoneNumber];
    }
    else
    {
      id v3 = 0;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      int v11 = v3;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from FTDevice is: %@", (uint8_t *)&v10, 0xCu);
    }
  }

LABEL_13:
  uint64_t v8 = IMNormalizePhoneNumber((uint64_t)v3);

  return v8;
}

- (void)setMmsEnabledToken:(int)a3
{
  self->_mmsEnabledToken = a3;
}

- (int)rcsEnabledToken
{
  return self->_rcsEnabledToken;
}

- (void)setRcsEnabledToken:(int)a3
{
  self->_rcsEnabledToken = a3;
}

@end