@interface NotificationCell
+ (double)defaultCellHeight;
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (BOOL)isAnnounceEnabledForSectionInfo:(id)a3;
- (NSString)bundlePath;
- (id)getLazyIcon;
- (void)dealloc;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setAppIcon:(id)a3;
- (void)setAppName:(id)a3;
- (void)setBundlePath:(id)a3;
- (void)setNotificationTypes:(id)a3;
@end

@implementation NotificationCell

+ (int64_t)cellStyle
{
  return 3;
}

+ (double)defaultCellHeight
{
  return UITableViewAutomaticDimension;
}

- (id)getLazyIcon
{
  v3 = [(NotificationCell *)self specifier];
  v4 = [v3 propertyForKey:@"BBSECTION_INFO_KEY"];

  v5 = objc_msgSend(v4, "nc_settingsIconImage");
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)NotificationCell;
    v5 = [(NotificationCell *)&v7 getLazyIcon];
  }

  return v5;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v102 = a3;
  v109 = [v102 propertyForKey:@"BBSECTION_INFO_KEY"];
  v3 = [v102 propertyForKey:PSIconUTTypeIdentifierKey];

  if (!v3)
  {
    v4 = [v109 sectionID];
    id v5 = [v4 copy];
    [v102 setProperty:v5 forKey:PSLazyIconAppID];

    v6 = [v102 propertyForKey:kWantsIcon];
    [v102 setProperty:v6 forKey:PSLazyIconLoading];
  }
  v137.receiver = self;
  v137.super_class = (Class)NotificationCell;
  [(NotificationCell *)&v137 refreshCellContentsWithSpecifier:v102];
  v103 = +[NSMutableArray array];
  unsigned int v101 = [v109 allowsNotifications];
  id v7 = [v109 lockScreenSetting];
  id v8 = [v109 notificationCenterSetting];
  id v9 = [v109 carPlaySetting];
  id v10 = [v109 remoteNotificationsSetting];
  unsigned __int8 v11 = [(NotificationCell *)self isAnnounceEnabledForSectionInfo:v109];
  v12 = (char *)[v109 criticalAlertSetting];
  int v13 = v12 == (unsigned char *)&dword_0 + 2;
  unsigned int v121 = [v109 isDeliveredQuietly];
  v14.i64[0] = (uint64_t)v10;
  v14.i64[1] = (uint64_t)v9;
  v15.i64[0] = (uint64_t)v8;
  v15.i64[1] = (uint64_t)v7;
  if (v101)
  {
    int64x2_t v115 = v15;
    int64x2_t v123 = v14;
    unint64_t v16 = (unint64_t)[v109 suppressedSettings];
    unsigned __int8 v17 = [v109 pushSettings];
    id v18 = [v109 alertType];
    v19 = [v109 sectionID];
    id v20 = +[TLAlert bb_toneLibraryAlertTypeForSectionID:v19];

    if (v20)
    {
      v21 = +[TLToneManager sharedToneManager];
      v22 = [v109 subsectionID];
      v23 = [v21 currentToneIdentifierForAlertType:v20 topic:v22];

      v17 &= 0xEDu;
      if (v23)
      {
        unsigned int v24 = [v23 isEqualToString:TLToneIdentifierNone];
        char v25 = 18;
        if (v24) {
          char v25 = 0;
        }
        v17 |= v25;
      }
      if (MGGetBoolAnswer())
      {
        v26 = +[TLVibrationManager sharedVibrationManager];
        v27 = [v109 subsectionID];
        v28 = [v26 currentVibrationIdentifierForAlertType:v20 topic:v27];

        if (v28) {
          unsigned int v29 = [v28 isEqualToString:TLVibrationIdentifierNone] ^ 1;
        }
        else {
          LOBYTE(v29) = 0;
        }
      }
      else
      {
        LOBYTE(v29) = 0;
      }
    }
    else
    {
      LOBYTE(v29) = 0;
    }
    char v33 = v17 & 0xF6;
    if ((v16 & 0x2000) == 0) {
      char v33 = v17;
    }
    if ((v16 & 0x4000) != 0)
    {
      v33 &= 0xEDu;
      char v34 = 0;
    }
    else
    {
      char v34 = v29;
    }
    if ((v16 & 0x20) != 0) {
      unint64_t v35 = 0;
    }
    else {
      unint64_t v35 = (unint64_t)v18;
    }
    unint64_t v120 = v35;
    if ((v16 & 0x20) != 0) {
      v33 &= 0xDBu;
    }
    char v122 = v33;
    if ((v16 & 0x400) != 0) {
      unsigned __int8 v36 = 0;
    }
    else {
      unsigned __int8 v36 = v11;
    }
    char v118 = v36;
    char v119 = v34;
    long long v135 = 0u;
    long long v136 = 0u;
    BOOL v38 = (v16 & 0x100) == 0 && v12 == (unsigned char *)&dword_0 + 2;
    char v117 = v38;
    long long v133 = 0uLL;
    long long v134 = 0uLL;
    id obj = [v109 subsections];
    id v125 = [obj countByEnumeratingWithState:&v133 objects:v138 count:16];
    int64x2_t v39 = vdupq_n_s64(2uLL);
    int8x16_t v40 = (int8x16_t)vdupq_n_s64(v16);
    int8x8_t v124 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v40, (int8x16_t)xmmword_33EA0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v40, (int8x16_t)xmmword_33EB0))), (int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v123, v39), (int32x4_t)vceqq_s64(v115, v39)))), (int8x8_t)0x1000100010001);
    if (v125)
    {
      uint64_t v116 = *(void *)v134;
      uint64_t v105 = TLToneIdentifierNone;
      uint64_t v104 = TLVibrationIdentifierNone;
      int64x2_t v106 = vdupq_n_s64(2uLL);
      do
      {
        for (i = 0; i != v125; i = (char *)i + 1)
        {
          if (*(void *)v134 != v116) {
            objc_enumerationMutation(obj);
          }
          v42 = *(void **)(*((void *)&v133 + 1) + 8 * i);
          if ([v42 allowsNotifications])
          {
            unint64_t v43 = (unint64_t)[v42 suppressedSettings];
            unsigned __int8 v44 = [v42 pushSettings];
            id v114 = [v42 alertType];
            v113.i64[1] = (uint64_t)[v42 lockScreenSetting];
            v113.i64[0] = (uint64_t)[v42 notificationCenterSetting];
            id v112 = [v42 carPlaySetting];
            id v45 = [v42 remoteNotificationsSetting];
            unsigned __int8 v111 = [(NotificationCell *)self isAnnounceEnabledForSectionInfo:v42];
            v46 = (char *)[v42 criticalAlertSetting];
            unsigned __int8 v110 = [v42 isDeliveredQuietly];
            v47 = [v109 sectionID];
            id v48 = +[TLAlert bb_toneLibraryAlertTypeForSectionID:v47];

            if (v48)
            {
              v49 = +[TLToneManager sharedToneManager];
              v50 = [v42 subsectionID];
              v51 = [v49 currentToneIdentifierForAlertType:v48 topic:v50];

              v44 &= 0xEDu;
              if (v51)
              {
                unsigned int v52 = [v51 isEqualToString:v105];
                char v53 = 18;
                if (v52) {
                  char v53 = 0;
                }
                v44 |= v53;
              }
              if (MGGetBoolAnswer())
              {
                v54 = +[TLVibrationManager sharedVibrationManager];
                v55 = [v42 subsectionID];
                v56 = [v54 currentVibrationIdentifierForAlertType:v48 topic:v55];

                if (v56) {
                  unsigned int v57 = [v56 isEqualToString:v104] ^ 1;
                }
                else {
                  LOBYTE(v57) = 0;
                }
              }
              else
              {
                LOBYTE(v57) = 0;
              }
            }
            else
            {
              LOBYTE(v57) = 0;
            }
            v58.i64[0] = (uint64_t)v45;
            v58.i64[1] = (uint64_t)v112;
            int8x16_t v59 = (int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v58, v106), (int32x4_t)vceqq_s64(v113, v106));
            char v60 = v44 & 0xF6;
            if ((v43 & 0x2000) == 0) {
              char v60 = v44;
            }
            if ((v43 & 0x4000) != 0) {
              v60 &= 0xEDu;
            }
            if ((v43 & 0x6000) != 0) {
              char v61 = 0;
            }
            else {
              char v61 = v57;
            }
            if ((v43 & 0x20) != 0) {
              v60 &= 0xDBu;
            }
            unint64_t v62 = (unint64_t)v114;
            if ((v43 & 0x20) != 0) {
              unint64_t v62 = 0;
            }
            int8x16_t v63 = (int8x16_t)vdupq_n_s64(v43);
            int64x2_t v64 = (int64x2_t)vandq_s8(v63, (int8x16_t)xmmword_33EA0);
            int64x2_t v65 = (int64x2_t)vandq_s8(v63, (int8x16_t)xmmword_33EB0);
            unsigned __int8 v66 = v111;
            if ((v43 & 0x400) != 0) {
              unsigned __int8 v66 = 0;
            }
            BOOL v68 = (v43 & 0x100) == 0 && v46 == (unsigned char *)&dword_0 + 2;
            v122 |= v60;
            int8x8_t v124 = vand_s8(vorr_s8(v124, (int8x8_t)vmovn_s32((int32x4_t)vandq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64(v64), (int32x4_t)vceqzq_s64(v65)), v59))), (int8x8_t)0x1000100010001);
            char v117 = (v117 | v68) & 1;
            char v118 = (v118 | v66) & 1;
            char v119 = (v119 | v61) & 1;
            LOBYTE(v121) = (v121 | v110) & 1;
            unint64_t v69 = v120;
            if (v120 <= v62) {
              unint64_t v69 = v62;
            }
            unint64_t v120 = v69;
          }
        }
        id v125 = [obj countByEnumeratingWithState:&v133 objects:v138 count:16];
      }
      while (v125);
    }

    int v31 = v119 & 1;
    v121 &= 1u;
    int v13 = v117 & 1;
    int v30 = v118 & 1;
    unsigned __int8 v11 = v118 & 1;
  }
  else
  {
    int v30 = 0;
    unint64_t v120 = 0;
    char v122 = 0;
    int v31 = 0;
    int64x2_t v32 = vdupq_n_s64(2uLL);
    int8x8_t v124 = (int8x8_t)vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v14, v32), (int32x4_t)vceqq_s64(v15, v32)));
  }
  v70 = +[NCSettingsGatewayController sharedInstance];
  v71 = (char *)[v70 effectiveGlobalScheduledDeliverySetting];

  if (v71 == (unsigned char *)&dword_0 + 2) {
    unsigned int v72 = v101;
  }
  else {
    unsigned int v72 = 0;
  }
  if (v72 == 1)
  {
    BOOL v73 = [v109 scheduledDeliverySetting] == (char *)&dword_0 + 2;
    v74 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v75 = v74;
    if (v73) {
      CFStringRef v76 = @"SCHEDULED";
    }
    else {
      CFStringRef v76 = @"IMMEDIATE";
    }
    v77 = [v74 localizedStringForKey:v76 value:&stru_419A0 table:@"NotificationsSettings"];
    [v103 addObject:v77];
  }
  if (v13)
  {
    v78 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v79 = [v78 localizedStringForKey:@"CRITICAL_ALERTS" value:&stru_419A0 table:@"NotificationsSettings"];
    [v103 addObject:v79];
  }
  if (v71 != (unsigned char *)&dword_0 + 2)
  {
    if ((v122 & 4) != 0 && v120)
    {
      v80 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v81 = [v80 localizedStringForKey:@"BANNER_ALERTS" value:&stru_419A0 table:@"NotificationsSettings"];
      [v103 addObject:v81];
    }
    if ((v122 & 0x10) != 0)
    {
      v82 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v83 = [v82 localizedStringForKey:@"SOUNDS" value:&stru_419A0 table:@"NotificationsSettings"];
    }
    else
    {
      if (!v31) {
        goto LABEL_100;
      }
      v82 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v83 = [v82 localizedStringForKey:@"VIBRATIONS" value:&stru_419A0 table:@"NotificationsSettings"];
    }
    v84 = (void *)v83;
    [v103 addObject:v83];

LABEL_100:
    if ((v122 & 8) != 0)
    {
      v85 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      v86 = [v85 localizedStringForKey:@"BADGES" value:&stru_419A0 table:@"NotificationsSettings"];
      [v103 addObject:v86];
    }
  }
  if (v124.i8[2])
  {
    id v87 = objc_alloc_init((Class)CRPairedVehicleManager);
    uint64_t v127 = 0;
    v128 = &v127;
    uint64_t v129 = 0x3032000000;
    v130 = sub_176B8;
    v131 = sub_176C8;
    id v132 = 0;
    v126[0] = _NSConcreteStackBlock;
    v126[1] = 3221225472;
    v126[2] = sub_176D0;
    v126[3] = &unk_411A8;
    v126[4] = &v127;
    [v87 syncFetchAllVehiclesWithCompletion:v126];
    BOOL v88 = [(id)v128[5] count] != 0;
    _Block_object_dispose(&v127, 8);
  }
  else
  {
    BOOL v88 = 0;
  }
  if (v124.i8[0]) {
    unsigned __int8 v89 = +[NCRemoteNotificationsManager featureIsAvailable];
  }
  else {
    unsigned __int8 v89 = 0;
  }
  v90 = [v109 sectionID];
  if ([v90 isEqualToString:@"com.apple.mobilemail"])
  {
    v91 = [v109 subsections];
    BOOL v92 = [v91 count] == 0;
  }
  else
  {
    BOOL v92 = 0;
  }

  if (v30)
  {
    v93 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
    v94 = [v93 localizedStringForKey:@"ANNOUNCE" value:&stru_419A0 table:@"NotificationsSettings"];
    [v103 addObject:v94];
  }
  if (![v103 count])
  {
    if (v121)
    {
      v95 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v96 = [v95 localizedStringForKey:@"DELIVER_QUIETLY" value:&stru_419A0 table:@"NotificationsSettings"];
LABEL_119:
      v97 = (void *)v96;
      [v103 addObject:v96];

      goto LABEL_120;
    }
    if (!v101 || !(v124.i8[4] & 1 | v124.i8[6] & 1 | ((v88 | v89 | v11 | v13) | v92) & 1))
    {
      v95 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
      uint64_t v96 = [v95 localizedStringForKey:@"OFF" value:&stru_419A0 table:@"NotificationsSettings"];
      goto LABEL_119;
    }
  }
LABEL_120:
  v98 = +[NSBundle bundleWithIdentifier:@"com.apple.NotificationsSettings"];
  v99 = [v98 localizedStringForKey:@"SEPERATOR" value:&stru_419A0 table:@"NotificationsSettings"];
  v100 = [v103 componentsJoinedByString:v99];
  [(NotificationCell *)self setNotificationTypes:v100];
}

- (BOOL)canReload
{
  return 1;
}

- (void)dealloc
{
  [(UIImageView *)self->_appIcon removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)NotificationCell;
  [(NotificationCell *)&v3 dealloc];
}

- (void)setAppIcon:(id)a3
{
  id v5 = (UIImageView *)a3;
  appIcon = self->_appIcon;
  if (appIcon != v5)
  {
    id v8 = v5;
    [(UIImageView *)appIcon removeFromSuperview];
    objc_storeStrong((id *)&self->_appIcon, a3);
    id v7 = [(NotificationCell *)self contentView];
    [v7 addSubview:self->_appIcon];

    appIcon = (UIImageView *)[(NotificationCell *)self setNeedsLayout];
    id v5 = v8;
  }

  _objc_release_x1(appIcon, v5);
}

- (void)setAppName:(id)a3
{
  id v4 = a3;
  id v5 = [(NotificationCell *)self textLabel];
  [v5 setText:v4];
}

- (void)setNotificationTypes:(id)a3
{
  id v4 = a3;
  id v5 = [(NotificationCell *)self detailTextLabel];
  [v5 setText:v4];
}

- (BOOL)isAnnounceEnabledForSectionInfo:(id)a3
{
  id v3 = a3;
  id v4 = +[NCSettingsGatewayController sharedInstance];
  id v5 = (char *)[v4 effectiveGlobalAnnounceSetting];

  v6 = (char *)[v3 announceSetting];
  if (v5 == (unsigned char *)&dword_0 + 2 && (unint64_t)v6 >= 2)
  {
    id v9 = v6;
    id v10 = +[NCSettingsGatewayController sharedInstance];
    BOOL v8 = [v10 effectiveGlobalScheduledDeliverySetting] != (char *)&dword_0 + 2
      || [v3 scheduledDeliverySetting] != (char *)&dword_0 + 2
      || [v3 timeSensitiveSetting] == (char *)&dword_0 + 2
      || [v3 directMessagesSetting] == (char *)&dword_0 + 2;

    if (v8 && v9 == (unsigned char *)&dword_0 + 2)
    {
      unsigned __int8 v11 = (char *)[v3 timeSensitiveSetting];
      BOOL v12 = [v3 scheduledDeliverySetting] != (char *)&dword_0 + 2
         && [v3 directMessagesSetting]
         || [v3 scheduledDeliverySetting] == (char *)&dword_0 + 2
         && [v3 directMessagesSetting] == (char *)&dword_0 + 2;
      LOBYTE(v8) = v11 == (unsigned char *)&dword_0 + 2 || v12;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (void)setBundlePath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundlePath, 0);

  objc_storeStrong((id *)&self->_appIcon, 0);
}

@end