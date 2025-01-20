uint64_t sub_100003BA4()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  id v11;

  if (!SOSCCIsSOSTrustAndSyncingEnabled()) {
    return 0;
  }
  v0 = sub_100003D80(3);
  v1 = [v0 mapWithBlock:&stru_10000C4B8];
  v2 = [v1 mutableCopy];

  v3 = sub_100003D80(2);
  v4 = [v3 mapWithBlock:&stru_10000C4D8];
  v5 = [v4 mutableCopy];

  if ([v2 count])
  {
    v6 = secLogObjForScope();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Process accept: %@", (uint8_t *)&v10, 0xCu);
    }

    v7 = SOSCCAcceptApplicants();
  }
  else
  {
    v7 = 1;
  }
  if ([v5 count])
  {
    v8 = secLogObjForScope();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Process reject: %@", (uint8_t *)&v10, 0xCu);
    }

    if (v7) {
      v7 = SOSCCRejectApplicants();
    }
  }

  return v7;
}

id sub_100003D80(int a1)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    id v2 = (id)objc_opt_new();
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v3 = objc_msgSend((id)qword_100010710, "objectEnumerator", 0);
    id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v8 applicantUIState] == a1) {
            [v2 addObject:v8];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v2 = objc_alloc_init((Class)NSMutableArray);
  }

  return v2;
}

id sub_100003ED4(id a1, id a2)
{
  return [a2 rawPeerInfo];
}

id sub_100003EDC(id a1, id a2)
{
  return [a2 rawPeerInfo];
}

uint64_t start()
{
  if (OctagonPlatformSupportsSOS())
  {
    uint64_t v140 = os_transaction_create();
    v0 = dispatch_get_global_queue(2, 0);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v0, &stru_10000C518);

    xpc_activity_register("com.apple.security.CircleJoinRequestedTick", XPC_ACTIVITY_CHECK_IN, &stru_10000C538);
    v1 = &OBJC_CATEGORY_NSArray___map;
    if (byte_100010722)
    {
LABEL_3:
      id v2 = secLogObjForScope();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Done", buf, 2u);
      }

      v3 = v140;
      goto LABEL_8;
    }
    int v5 = 0;
    uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
    uint64_t v134 = kSecureBackupIsEnabledKey;
    uint64_t v138 = SBUserNotificationDontDismissOnUnlock;
    uint64_t v137 = SBUserNotificationDismissOnLock;
    v7 = &OBJC_CATEGORY_NSArray___map;
    while ((SOSCCIsSOSTrustAndSyncingEnabled() & 1) == 0)
    {
LABEL_197:
      ++v5;
LABEL_198:
      sub_100006CD0(0);
      props = v7[37].props;
      if (props)
      {
        ((void (*)(void))props[2])();
        v133 = v7[37].props;
        v7[37].props = 0;
      }
      if (v5 > 1 || BYTE2(v1[38].name)) {
        goto LABEL_3;
      }
    }
    v8 = v6[36].props;
    v6[36].props = (__objc2_prop_list *)@"processEvents A";

    CFErrorRef err = 0;
    CFTypeRef cf = 0;
    int v9 = SOSCCThisDeviceIsInCircleNonCached();
    unsigned int DepartureReason = SOSCCGetLastDepartureReason();
    if (sub_100005838((__CFError *)cf) && v9 == -1)
    {
      long long v11 = secLogObjForScope();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v162 = 138412290;
        *(void *)&v162[4] = cf;
        long long v12 = v11;
        long long v13 = "returning from processEvents due to error returned from securityd: %@";
        goto LABEL_20;
      }
      goto LABEL_21;
    }
    if (!DepartureReason)
    {
      if (err)
      {
        v14 = (const void *)sSecXPCErrorDomain;
        CFErrorDomain Domain = CFErrorGetDomain(err);
        if (CFEqual(v14, Domain))
        {
          long long v11 = secLogObjForScope();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v162 = 138412290;
            *(void *)&v162[4] = err;
            long long v12 = v11;
            long long v13 = "XPC error while checking last departure reason: \"%@\", not processing events";
LABEL_20:
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, v162, 0xCu);
          }
LABEL_21:
          uint64_t v6 = &OBJC_CATEGORY_NSArray___map;

          goto LABEL_65;
        }
      }
    }
    uint64_t v16 = +[NSDate date];
    v17 = +[PersistentState loadFromStorage];
    v18 = secLogObjForScope();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v17 lastCircleStatus];
      *(_DWORD *)v162 = 67109888;
      *(_DWORD *)&v162[4] = v19;
      *(_WORD *)&v162[8] = 1024;
      *(_DWORD *)&v162[10] = v9;
      *(_WORD *)&v162[14] = 1024;
      *(_DWORD *)&v162[16] = DepartureReason;
      *(_WORD *)&v162[20] = 2048;
      *(void *)&v162[22] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "CircleStatus %d -> %d{%d} (s=%p)", v162, 0x1Eu);
    }

    v142 = v17;
    v20 = [v17 pendingApplicationReminder];
    [v20 timeIntervalSinceDate:v16];
    double v22 = v21;

    v23 = secLogObjForScope();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [v17 pendingApplicationReminder];
      id v25 = [v24 debugDescription];
      *(_DWORD *)v162 = 138412546;
      *(void *)&v162[4] = v25;
      *(_WORD *)&v162[12] = 2048;
      *(double *)&v162[14] = v22;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Time until pendingApplicationReminder (%@) %f", v162, 0x16u);

      v1 = &OBJC_CATEGORY_NSArray___map;
    }

    v141 = (void *)v16;
    if (v9 == 2)
    {
      if (v22 <= 0.0)
      {
        v26 = off_1000106E8;
        off_1000106E8 = @"reminderAlert";

        [v17 pendingApplicationReminderAlertInterval];
        id v27 = v17;
        if (SOSCCIsSOSTrustAndSyncingEnabled())
        {
          MGGetSInt32Answer();
          uint64_t v28 = SecFrameworkCopyLocalizedString();
          id v29 = [objc_alloc((Class)SecureBackup) initWithUserActivityLabel:@"iCloudResetAvailable"];
          *(void *)out_token = 0;
          v30 = [v29 getAccountInfoWithInfo:0 results:out_token];
          id v31 = *(id *)out_token;
          v32 = secLogObjForScope();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v162 = 138412546;
            *(void *)&v162[4] = v30;
            *(_WORD *)&v162[12] = 2112;
            *(void *)&v162[14] = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "SecureBackup e=%@ r=%@", v162, 0x16u);
          }

          if (v30)
          {
            unsigned int v33 = 0;
          }
          else
          {
            [v31 objectForKeyedSubscript:v134];
            id v135 = v27;
            v35 = uint64_t v34 = v28;
            unsigned int v33 = [v35 isEqualToNumber:&__kCFBooleanTrue];

            uint64_t v28 = v34;
            id v27 = v135;
          }

          if (qword_100010728 != -1) {
            dispatch_once(&qword_100010728, &stru_10000C5D8);
          }
          if (byte_100010730)
          {
            [v27 defaultPendingApplicationReminderAlertInterval];
            [v27 pendingApplicationReminderAlertInterval];
          }
          *(void *)out_token = kCFUserNotificationAlertHeaderKey;
          v36 = (void *)SecFrameworkCopyLocalizedString();
          *(void *)v162 = v36;
          *(void *)&v162[8] = v28;
          v136 = (void *)v28;
          CFStringRef v156 = kCFUserNotificationAlertMessageKey;
          CFStringRef v157 = kCFUserNotificationDefaultButtonTitleKey;
          v37 = (void *)SecFrameworkCopyLocalizedString();
          *(void *)&v162[16] = v37;
          CFStringRef v158 = kCFUserNotificationAlternateButtonTitleKey;
          v38 = &stru_10000CD08;
          if (v33) {
            v38 = (__CFString *)SecFrameworkCopyLocalizedString();
          }
          *(void *)&v162[24] = v38;
          v163 = &__kCFBooleanTrue;
          v164 = &__kCFBooleanTrue;
          CFStringRef v159 = kCFUserNotificationAlertTopMostKey;
          uint64_t v160 = v138;
          uint64_t v161 = v137;
          v165 = &__kCFBooleanFalse;
          CFDictionaryRef v39 = +[NSDictionary dictionaryWithObjects:v162 forKeys:out_token count:7];
          if (v33) {

          }
          SInt32 error = 0;
          v40 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v39);
          qword_100010700 = (uint64_t)v40;
          if (error)
          {
            v41 = secLogObjForScope();
            v1 = &OBJC_CATEGORY_NSArray___map;
            v42 = v136;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v153 = 67109120;
              SInt32 v154 = error;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Can't make pending notification err=%x", v153, 8u);
            }
          }
          else
          {
            byte_100010708 = 1;
            qword_1000106F8 = (uint64_t)CFUserNotificationCreateRunLoopSource(0, v40, (CFUserNotificationCallBack)sub_100008318, 0);
            Current = CFRunLoopGetCurrent();
            CFRunLoopAddSource(Current, (CFRunLoopSourceRef)qword_1000106F8, kCFRunLoopDefaultMode);
            v1 = &OBJC_CATEGORY_NSArray___map;
            v42 = v136;
          }
        }
      }
      else
      {
        sub_10000590C(vcvtpd_s64_f64(v22));
      }
    }
    if (SOSCCIsSOSTrustAndSyncingEnabled())
    {
      v44 = +[ACAccountStore defaultStore];
      v45 = objc_msgSend(v44, "aa_primaryAppleAccount");
      v46 = [v45 accountProperties];
      v47 = [v46 objectForKeyedSubscript:@"personID"];

      if (v47)
      {
        unsigned int v48 = +[CDPAccount isICDPEnabledForDSID:v47];
        char v49 = v48;
        NSLog(@"iCDP: PSKeychainSyncIsUsingICDP returning %{BOOL}d", v48);
      }
      else
      {
        NSLog(@"iCDP: no primary account");
        char v49 = 0;
      }
      byte_100010721 = v49;
      v50 = secLogObjForScope();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v162 = 67109120;
        *(_DWORD *)&v162[4] = byte_100010721;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "account is icdp: %{BOOL}d", v162, 8u);
      }
    }
    CFTypeRef v51 = cf;
    if (cf)
    {
      CFTypeRef cf = 0;
      CFRelease(v51);
    }
    uint64_t v52 = SOSCCThisDeviceIsInCircleNonCached();
    if (sub_100005838((__CFError *)cf) && v52 == -1)
    {
      v53 = secLogObjForScope();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v162 = 138412290;
        *(void *)&v162[4] = cf;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "returning from processEvents due to error returned from securityd: %@", v162, 0xCu);
      }

      uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
      v54 = v142;
      goto LABEL_64;
    }
    if (byte_100010721)
    {
      [v142 setLastCircleStatus:v52];
      [v142 writeToStorage];
      if (byte_100010720 == 1)
      {
        v56 = secLogObjForScope();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "followup not resolved", v162, 2u);
        }

        BYTE2(v1[38].name) = 1;
LABEL_73:
        uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
        v7 = &OBJC_CATEGORY_NSArray___map;
        v54 = v142;
        goto LABEL_196;
      }
      switch((int)v52)
      {
        case -1:
          v81 = secLogObjForScope();
          uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v162 = 138412290;
            *(void *)&v162[4] = cf;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "error from SOSCCThisDeviceIsInCircle: %@", v162, 0xCu);
          }

          int v71 = SOSCCIsSOSTrustAndSyncingEnabled();
          goto LABEL_127;
        case 0:
          v82 = secLogObjForScope();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v162 = 0;
            _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "follow up should be resolved", v162, 2u);
          }

          BYTE2(v1[38].name) = 1;
          byte_100010720 = 0;
          goto LABEL_75;
        case 1:
        case 3:
          v69 = secLogObjForScope();
          BOOL v70 = os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT);
          if (DepartureReason)
          {
            if (v70)
            {
              *(_WORD *)v162 = 0;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "iCDP: We need to get back into the circle", v162, 2u);
            }

            int v71 = SOSCCIsSOSTrustAndSyncingEnabled();
            uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
LABEL_127:
            v54 = v142;
            if (v71) {
              sub_1000059F8(&stru_10000C618);
            }
          }
          else
          {
            if (v70)
            {
              *(_WORD *)v162 = 0;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "iCDP: We appear to not be associated with an iCloud account", v162, 2u);
            }

            uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
            v54 = v142;
          }
          BYTE2(v1[38].name) = 1;
          break;
        case 2:
          goto LABEL_75;
        default:
          v80 = secLogObjForScope();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v162 = 67109120;
            *(_DWORD *)&v162[4] = v52;
            _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Unknown circle status %d", v162, 8u);
          }

          goto LABEL_73;
      }
LABEL_195:
      v7 = &OBJC_CATEGORY_NSArray___map;
LABEL_196:

      goto LABEL_197;
    }
    if (v52 == -1 && [v142 lastCircleStatus] != -1 && DepartureReason == 1)
    {
      v76 = secLogObjForScope();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v162 = 138412290;
        *(void *)&v162[4] = cf;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "SA: error from SOSCCThisDeviceIsInCircle: %@", v162, 0xCu);
      }

      if (CFErrorGetCode((CFErrorRef)cf) == 2)
      {
        v77 = secLogObjForScope();
        uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
        if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v162 = 0;
          _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "SA: We need the password to re-validate ourselves - it's changed on another device", v162, 2u);
        }

        sub_100005AB0(8u);
        v54 = v142;
        [v142 setLastCircleStatus:0xFFFFFFFFLL];
        [v142 writeToStorage];
LABEL_64:

LABEL_65:
        v55 = secLogObjForScope();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Processed events!!!", buf, 2u);
        }

        int v5 = 0;
        v7 = &OBJC_CATEGORY_NSArray___map;
        goto LABEL_198;
      }
    }
LABEL_75:
    if (([v142 lastCircleStatus] || (v52 & 0xFFFFFFFD) != 1)
      && ([v142 lastCircleStatus] != 3
       || v52 != 1
       || ([v142 absentCircleWithNoReason] & 1) == 0))
    {
      v57 = [v142 debugShowLeftReason];

      if (!v57)
      {
LABEL_156:
        uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
        v93 = off_1000106E8;
        off_1000106E8 = @"processEvents C";

        v54 = v142;
        if (v52 != [v142 lastCircleStatus])
        {
          unsigned int v94 = [v142 lastCircleStatus];
          [v142 setLastCircleStatus:v52];
          if (v94 == 2 || v52 != 2)
          {
            if (v94 == 2 && v52 != 2)
            {
              v97 = secLogObjForScope();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v162 = 0;
                _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "Pending request completed", v162, 2u);
              }

              v98 = +[NSDate distantPast];
              [v142 setApplicationDate:v98];

              v99 = +[NSDate distantFuture];
              [v142 setPendingApplicationReminder:v99];
            }
          }
          else
          {
            v95 = secLogObjForScope();
            if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v162 = 0;
              _os_log_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEFAULT, "Pending request started", v162, 2u);
            }

            [v142 setApplicationDate:v141];
            v96 = objc_msgSend(v141, "dateByAddingTimeInterval:", (double)objc_msgSend(v142, "pendingApplicationReminderAlertInterval"));
            [v142 setPendingApplicationReminder:v96];

            sub_10000590C((int)[v142 pendingApplicationReminderAlertInterval]);
          }
          [v142 writeToStorage];
        }
        if (v52)
        {
          if (v52 == 2)
          {
            uint64_t v100 = qword_100010700;
            if (qword_100010700)
            {
              out_token[0] = 0;
              v101 = off_1000106E8;
              off_1000106E8 = @"processEvents D1";

              v102 = (const char *)kSOSCCCircleChangedNotification;
              id v103 = &_dispatch_main_q;
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_100006294;
              handler[3] = &unk_10000C558;
              handler[4] = v100;
              notify_register_dispatch(v102, out_token, (dispatch_queue_t)&_dispatch_main_q, handler);

              v104 = off_1000106E8;
              off_1000106E8 = @"processEvents D2";

              v105 = secLogObjForScope();
              if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v162 = 67109376;
                *(_DWORD *)&v162[4] = (byte_100010708 & 1) == 0;
                *(_WORD *)&v162[8] = 1024;
                *(_DWORD *)&v162[10] = out_token[0];
                _os_log_impl((void *)&_mh_execute_header, v105, OS_LOG_TYPE_DEFAULT, "NOTE: currentAlertIsForApplicants %{BOOL}d, token %d", v162, 0xEu);
              }

              CFRunLoopRun();
              goto LABEL_64;
            }
          }
          v127 = off_1000106E8;
          off_1000106E8 = @"processEvents D4";

          v128 = secLogObjForScope();
          if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v162 = 67109120;
            *(_DWORD *)&v162[4] = v52;
            _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "SOSCCThisDeviceIsInCircle status %d, not checking applicants", v162, 8u);
          }
        }
        else
        {
          v106 = off_1000106E8;
          off_1000106E8 = @"processEvents E";

          uint64_t v107 = objc_opt_new();
          v108 = (void *)qword_100010710;
          qword_100010710 = v107;

          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          v109 = (void *)SOSCCCopyApplicantPeerInfo();
          id v110 = [v109 countByEnumeratingWithState:&v143 objects:buf count:16];
          if (v110)
          {
            id v111 = v110;
            uint64_t v112 = *(void *)v144;
            do
            {
              for (i = 0; i != v111; i = (char *)i + 1)
              {
                if (*(void *)v144 != v112) {
                  objc_enumerationMutation(v109);
                }
                v114 = [[Applicant alloc] initWithPeerInfo:*(void *)(*((void *)&v143 + 1) + 8 * i)];
                v115 = (void *)qword_100010710;
                v116 = [(Applicant *)v114 idString];
                [v115 setObject:v114 forKeyedSubscript:v116];
              }
              id v111 = [v109 countByEnumeratingWithState:&v143 objects:buf count:16];
            }
            while (v111);
          }

          CFTypeRef v117 = cf;
          if (cf)
          {
            CFTypeRef cf = 0;
            CFRelease(v117);
          }
          out_token[0] = -42;
          uint64_t v6 = &OBJC_CATEGORY_NSArray___map;
          v118 = off_1000106E8;
          off_1000106E8 = @"processEvents F";

          v119 = (const char *)kSOSCCCircleChangedNotification;
          id v120 = &_dispatch_main_q;
          uint32_t v121 = notify_register_dispatch(v119, out_token, (dispatch_queue_t)&_dispatch_main_q, &stru_10000C598);

          v122 = secLogObjForScope();
          v1 = &OBJC_CATEGORY_NSArray___map;
          if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v162 = 67109376;
            *(_DWORD *)&v162[4] = out_token[0];
            *(_WORD *)&v162[8] = 1024;
            *(_DWORD *)&v162[10] = v121;
            _os_log_impl((void *)&_mh_execute_header, v122, OS_LOG_TYPE_DEFAULT, "ACC token %d, status %d", v162, 0xEu);
          }

          v123 = off_1000106E8;
          off_1000106E8 = @"processEvents F2";

          v54 = v142;
          if ([(id)qword_100010710 count])
          {
            v124 = off_1000106E8;
            off_1000106E8 = @"processEvents F3";

            sub_10000653C(0);
            v125 = off_1000106E8;
            off_1000106E8 = @"processEvents F4";

            if (qword_100010700)
            {
              v126 = off_1000106E8;
              off_1000106E8 = @"processEvents F5";

              CFRunLoopRun();
            }
          }
          else
          {
            v129 = secLogObjForScope();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v162 = 0;
              _os_log_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_DEFAULT, "No applicants", v162, 2u);
            }
          }
          v130 = off_1000106E8;
          off_1000106E8 = @"processEvents F6";

          notify_cancel(out_token[0]);
          v131 = off_1000106E8;
          off_1000106E8 = @"processEvents DONE";
        }
        goto LABEL_195;
      }
    }
    v58 = off_1000106E8;
    off_1000106E8 = @"processEvents B";

    v59 = [v142 debugShowLeftReason];

    if (v59)
    {
      v60 = secLogObjForScope();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [v142 debugShowLeftReason];
        *(_DWORD *)v162 = 138412290;
        *(void *)&v162[4] = v61;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "debugShowLeftReason: %@", v162, 0xCu);
      }
      v62 = [v142 debugShowLeftReason];
      unsigned int DepartureReason = [v62 intValue];

      [v142 setDebugShowLeftReason:0];
      CFErrorRef v63 = err;
      if (err)
      {
        CFErrorRef err = 0;
        CFRelease(v63);
      }
      [v142 writeToStorage];
    }
    if (!DepartureReason)
    {
      v72 = secLogObjForScope();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v162 = 138412290;
        *(void *)&v162[4] = err;
        v73 = v72;
        v74 = "Couldn't get last departure reason: %@";
        uint32_t v75 = 12;
LABEL_154:
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, v74, v162, v75);
      }
LABEL_155:

      goto LABEL_156;
    }
    BOOL v65 = v52 == 3 && DepartureReason == 1;
    [v142 setAbsentCircleWithNoReason:v65];
    v66 = secLogObjForScope();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v162 = 67109120;
      *(_DWORD *)&v162[4] = DepartureReason;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Depature reason %d", v162, 8u);
    }

    if (!byte_100010721)
    {
      v78 = secLogObjForScope();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v162 = 0;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "posting revocation notification!", v162, 2u);
      }

      sub_100005AB0(DepartureReason);
      goto LABEL_151;
    }
    if (byte_100010720)
    {
      v67 = secLogObjForScope();
      v68 = v142;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v162 = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "still waiting for followup to resolve", v162, 2u);
      }

LABEL_152:
      v72 = secLogObjForScope();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v92 = [v68 lastCircleStatus];
        *(_DWORD *)v162 = 67109376;
        *(_DWORD *)&v162[4] = v52;
        *(_WORD *)&v162[8] = 1024;
        *(_DWORD *)&v162[10] = v92;
        v73 = v72;
        v74 = "pKOA returned (cS %d lCS %d)";
        uint32_t v75 = 14;
        goto LABEL_154;
      }
      goto LABEL_155;
    }
    id v79 = objc_alloc_init((Class)CDPFollowUpController);
    if (SOSCompatibilityModeEnabled()) {
      +[CDPFollowUpContext contextForSOSCompatibilityMode];
    }
    else {
    v83 = +[CDPFollowUpContext contextForStateRepair];
    }
    int v84 = SOSCompatibilityModeEnabled();
    v85 = secLogObjForScope();
    BOOL v86 = os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
    if (v84)
    {
      if (v86)
      {
        *(_WORD *)v162 = 0;
        v87 = v85;
        v88 = "Posting a follow up (for SOS) of type SOS Compatibility Mode";
LABEL_142:
        _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, v88, v162, 2u);
      }
    }
    else if (v86)
    {
      *(_WORD *)v162 = 0;
      v87 = v85;
      v88 = "Posting a follow up (for SOS) of type repair";
      goto LABEL_142;
    }

    id v148 = 0;
    [v79 postFollowUpWithContext:v83 error:&v148];
    id v89 = v148;
    v90 = secLogObjForScope();
    BOOL v91 = os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT);
    if (v89)
    {
      if (v91)
      {
        *(_DWORD *)v162 = 138412290;
        *(void *)&v162[4] = v89;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "request to CoreCDP to follow up failed: %@", v162, 0xCu);
      }
    }
    else
    {
      if (v91)
      {
        *(_WORD *)v162 = 0;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "CoreCDP handling follow up", v162, 2u);
      }

      byte_100010720 = 1;
    }

LABEL_151:
    v68 = v142;
    goto LABEL_152;
  }
  v3 = secLogObjForScope();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CJR triggered even though SOS is turned off for this platform", buf, 2u);
  }
LABEL_8:

  return 0;
}

__CFError *sub_100005838(__CFError *result)
{
  if (result)
  {
    v1 = result;
    id v2 = (const void *)sSecXPCErrorDomain;
    CFErrorDomain Domain = CFErrorGetDomain(result);
    result = (__CFError *)CFEqual(v2, Domain);
    if (result)
    {
      id v4 = secLogObjForScope();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        uint64_t v6 = v1;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC error while checking circle status: \"%@\", not processing events", (uint8_t *)&v5, 0xCu);
      }

      return (__CFError *)1;
    }
  }
  return result;
}

void sub_10000590C(int a1)
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(xdict, XPC_ACTIVITY_DELAY, a1);
  xpc_dictionary_set_uint64(xdict, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_MIN);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_BOOL(xdict, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_string(xdict, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_activity_register("com.apple.security.CircleJoinRequestedTick", xdict, &stru_10000C5F8);
}

void sub_1000059F8(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (qword_100010718)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100008088;
    v7[3] = &unk_10000C640;
    id v8 = v1;
    v3 = objc_retainBlock(v7);
    id v4 = (void *)qword_100010718;
    qword_100010718 = (uint64_t)v3;

    int v5 = v8;
  }
  else
  {
    id v6 = objc_retainBlock(v1);
    int v5 = (void *)qword_100010718;
    qword_100010718 = (uint64_t)v6;
  }
}

void sub_100005AB0(unsigned int a1)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    id v2 = off_1000106E8;
    off_1000106E8 = @"pKOA A";

    v3 = secLogObjForScope();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "DepartureReason %d", buf, 8u);
    }

    if (a1 > 7 || ((1 << a1) & 0xE4) == 0)
    {
      id v4 = (void *)SecFrameworkCopyLocalizedString();
      int v5 = (void *)SecFrameworkCopyLocalizedString();
      if (qword_100010728 != -1) {
        dispatch_once(&qword_100010728, &stru_10000C5D8);
      }
      if (byte_100010730)
      {
        if (a1 >= 8) {
          int v6 = 8;
        }
        else {
          int v6 = a1;
        }
        v7 = (void *)SecFrameworkCopyLocalizedString();
        id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, off_10000C660[v6]);

        uint64_t v9 = [v5 stringByAppendingString:v8];

        int v5 = (void *)v9;
      }
      v39[0] = kCFUserNotificationAlertHeaderKey;
      v39[1] = kCFUserNotificationAlertMessageKey;
      v40[0] = v4;
      v40[1] = v5;
      v39[2] = kCFUserNotificationDefaultButtonTitleKey;
      long long v10 = (void *)SecFrameworkCopyLocalizedString();
      v40[2] = v10;
      v39[3] = kCFUserNotificationAlternateButtonTitleKey;
      long long v11 = (void *)SecFrameworkCopyLocalizedString();
      v40[3] = v11;
      v39[4] = kCFUserNotificationAlertTopMostKey;
      v39[5] = SBUserNotificationDismissOnLock;
      v40[4] = &__kCFBooleanTrue;
      v40[5] = &__kCFBooleanFalse;
      v39[6] = SBUserNotificationDontDismissOnUnlock;
      v40[6] = &__kCFBooleanTrue;
      CFDictionaryRef v12 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:7];

      SInt32 error = 0;
      long long v13 = off_1000106E8;
      if (byte_100010709 == 1)
      {
        off_1000106E8 = @"pKOA B";

        v14 = secLogObjForScope();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&buf[4] = qword_100010700;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating existing alert %@ with %@", buf, 0x16u);
        }

        CFUserNotificationUpdate((CFUserNotificationRef)qword_100010700, 0.0, 3uLL, v12);
LABEL_37:
        id v29 = off_1000106E8;
        off_1000106E8 = @"pKOA Z";

        return;
      }
      off_1000106E8 = @"pKOA C";

      CFUserNotificationRef v15 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v12);
      SInt32 v16 = error;
      if ((v15 != 0) != (error != 0))
      {
LABEL_29:
        if (v16)
        {
          v24 = secLogObjForScope();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = error;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Can't make kicked out notification err=%x", buf, 8u);
          }

          if (v15) {
            CFRelease(v15);
          }
        }
        else
        {
          byte_100010708 = 1;
          byte_100010709 = 1;
          qword_100010700 = (uint64_t)v15;
          id v25 = secLogObjForScope();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = qword_100010700;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "New ko alert %@ a=%@", buf, 0x16u);
          }

          qword_1000106F8 = (uint64_t)CFUserNotificationCreateRunLoopSource(0, (CFUserNotificationRef)qword_100010700, (CFUserNotificationCallBack)sub_100007C3C, 0);
          Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, (CFRunLoopSourceRef)qword_1000106F8, kCFRunLoopDefaultMode);
          *(_DWORD *)buf = -1431655766;
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_100007B1C;
          handler[3] = &unk_10000C6B0;
          handler[4] = v15;
          unsigned int v33 = a1;
          notify_register_dispatch("com.apple.EscrowSecurityAlert.reset", (int *)buf, (dispatch_queue_t)&_dispatch_main_q, handler);
          id v27 = off_1000106E8;
          off_1000106E8 = @"pKOA D";

          CFRunLoopRun();
          uint64_t v28 = off_1000106E8;
          off_1000106E8 = @"pKOA E";

          notify_cancel(*(int *)buf);
        }
        goto LABEL_37;
      }
      v17 = secLogObjForScope();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = @"Execution has encountered an unexpected state";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 1405091854;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Simulating crash, reason: %@, code=%08x", buf, 0x12u);
      }

      int v18 = dword_1000106F0;
      if (dword_1000106F0 == -1)
      {
        if (sub_1000086BC())
        {
          uint64_t v19 = getpid();
          v20 = @"Execution has encountered an unexpected state";
          uint64_t v35 = 0;
          v36 = &v35;
          uint64_t v37 = 0x2020000000;
          double v21 = (void (*)(uint64_t, uint64_t, const __CFString *))off_100010740;
          v38 = off_100010740;
          if (!off_100010740)
          {
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_10000878C;
            v42 = &unk_10000C7C8;
            v43 = &v35;
            double v22 = sub_1000087DC();
            v23 = dlsym(v22, "SimulateCrash");
            *(void *)(v43[1] + 24) = v23;
            off_100010740 = *(_UNKNOWN **)(v43[1] + 24);
            double v21 = (void (*)(uint64_t, uint64_t, const __CFString *))v36[3];
          }
          _Block_object_dispose(&v35, 8);
          if (!v21)
          {
            v30 = +[NSAssertionHandler currentHandler];
            id v31 = +[NSString stringWithUTF8String:"BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"];
            objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"simulate_crash.m", 22, @"%s", dlerror());

            __break(1u);
          }
          v21(v19, 1405091854, @"Execution has encountered an unexpected state");

          goto LABEL_28;
        }
        int v18 = dword_1000106F0;
      }
      dword_1000106F0 = v18 + 1;
LABEL_28:
      SInt32 v16 = error;
      goto LABEL_29;
    }
  }
}

void sub_100006274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006294(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 32) == qword_100010700)
  {
    int v6 = SOSCCThisDeviceIsInCircle();
    if (sub_100005838(0)) {
      BOOL v7 = v6 == -1;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v8 = secLogObjForScope();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "returning from processEvents due to error returned from securityd: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    id v8 = secLogObjForScope();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6 == 2)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Still pending...", buf, 2u);
      }
LABEL_15:

      return;
    }
    if (v6 == -1)
    {
      if (v9)
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v14 = -1;
        *(_WORD *)&v14[4] = 2112;
        *(void *)&v14[6] = qword_100010700;
        __int16 v15 = 2112;
        uint64_t v16 = 0;
        long long v10 = "No longer pending (nCS=%d, alert=%@) error: %@";
        long long v11 = v8;
        uint32_t v12 = 28;
        goto LABEL_21;
      }
    }
    else if (v9)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v14 = v6;
      *(_WORD *)&v14[4] = 2112;
      *(void *)&v14[6] = qword_100010700;
      long long v10 = "No longer pending (nCS=%d, alert=%@)";
      long long v11 = v8;
      uint32_t v12 = 18;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }

    sub_100006CD0(1);
    return;
  }
  id v4 = secLogObjForScope();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v14 = (byte_100010708 & 1) == 0;
    *(_WORD *)&v14[4] = 2048;
    *(void *)&v14[6] = v5;
    __int16 v15 = 2048;
    uint64_t v16 = qword_100010700;
    __int16 v17 = 2112;
    uint64_t v18 = qword_100010700;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "-- CC after original alert gone (currentAlertIsForApplicants %{BOOL}d, pA %p, cA %p -- %@)", buf, 0x26u);
  }

  notify_cancel(a2);
}

void sub_10000653C(int a1)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    id v2 = +[MCProfileConnection sharedConnection];
    unsigned int v3 = [v2 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

    if (v3 == 2)
    {
      id v4 = secLogObjForScope();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Account modifications not allowed.", buf, 2u);
      }
      goto LABEL_31;
    }
    if (a1)
    {
      if (SOSCCIsSOSTrustAndSyncingEnabled())
      {
        uint64_t v5 = (void *)SecFrameworkCopyLocalizedString();
        int v6 = sub_100006D6C();
        BOOL v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

        id v8 = (void *)SecFrameworkCopyLocalizedString();
        *(void *)v42 = kCFUserNotificationAlertHeaderKey;
        CFStringRef v43 = kCFUserNotificationDefaultButtonTitleKey;
        *(void *)buf = v7;
        *(void *)&buf[8] = v8;
        CFStringRef v44 = kCFUserNotificationAlertTopMostKey;
        CFStringRef v45 = (CFStringRef)SBUserNotificationDontDismissOnUnlock;
        *(void *)&buf[16] = &__kCFBooleanTrue;
        CFTypeRef v51 = &__kCFBooleanTrue;
        CFStringRef v46 = (CFStringRef)SBUserNotificationDismissOnLock;
        uint64_t v52 = &__kCFBooleanFalse;
        CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:buf forKeys:v42 count:5];
        CFOptionFlags responseFlags = 3;
        SInt32 error = -1431655766;
        long long v10 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v9);
        if (v10)
        {
          long long v11 = v10;
          CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags);
          CFRelease(v11);
        }
      }
      uint32_t v12 = (void *)qword_100010700;
      if (!qword_100010700)
      {
LABEL_19:
        byte_100010708 = 0;
        v14 = sub_100006DE8();
        __int16 v15 = secLogObjForScope();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = qword_100010710;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Asking about: %@ (of: %@)", buf, 0x16u);
        }

        id v4 = v14;
        int v16 = SOSCCIsSOSTrustAndSyncingEnabled();
        if (v4
          && v16
          && ([v4 name], (uint64_t v17 = objc_claimAutoreleasedReturnValue()) != 0)
          && (uint64_t v18 = (void *)v17,
              [v4 deviceType],
              uint64_t v19 = objc_claimAutoreleasedReturnValue(),
              v19,
              v18,
              v19))
        {
          v20 = (void *)SecFrameworkCopyLocalizedString();
          double v21 = [v4 name];
          double v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);

          id v23 = [v4 deviceType];
          if (([v23 isEqualToString:@"iPhone"] & 1) == 0
            && ([v23 isEqualToString:@"iPod"] & 1) == 0
            && ([v23 isEqualToString:@"iPad"] & 1) == 0)
          {
            [v23 isEqualToString:@"Mac"];
          }
          id v25 = (void *)SecFrameworkCopyLocalizedString();

          v26 = sub_100006D6C();
          id v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v26);

          *(void *)v42 = kCFUserNotificationAlertHeaderKey;
          CFStringRef v43 = kCFUserNotificationAlertMessageKey;
          *(void *)buf = v22;
          *(void *)&buf[8] = v27;
          CFStringRef v44 = kCFUserNotificationDefaultButtonTitleKey;
          uint64_t v28 = (void *)SecFrameworkCopyLocalizedString();
          *(void *)&buf[16] = v28;
          CFStringRef v45 = kCFUserNotificationAlternateButtonTitleKey;
          id v29 = (void *)SecFrameworkCopyLocalizedString();
          CFTypeRef v51 = v29;
          CFStringRef v46 = kCFUserNotificationTextFieldTitlesKey;
          v30 = (void *)SecFrameworkCopyLocalizedString();
          uint64_t v52 = v30;
          v53 = &__kCFBooleanTrue;
          id v31 = (void *)SBUserNotificationDontDismissOnUnlock;
          CFStringRef v47 = kCFUserNotificationAlertTopMostKey;
          uint64_t v48 = SBUserNotificationDontDismissOnUnlock;
          v54 = &__kCFBooleanTrue;
          v32 = (void *)SBUserNotificationDismissOnLock;
          uint64_t v49 = SBUserNotificationDismissOnLock;
          v55 = &__kCFBooleanFalse;
          CFDictionaryRef v33 = +[NSDictionary dictionaryWithObjects:buf forKeys:v42 count:8];

          if (v33)
          {
            if (qword_100010700)
            {
              SInt32 v34 = CFUserNotificationUpdate((CFUserNotificationRef)qword_100010700, 0.0, 0x10003uLL, v33);
              if (v34)
              {
                SInt32 v35 = v34;
                v36 = secLogObjForScope();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&uint8_t buf[4] = v35;
                  _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "CFUserNotificationUpdate err=%d", buf, 8u);
                }

                goto LABEL_48;
              }
            }
            else
            {
              v42[0] = 0;
              uint64_t v37 = CFUserNotificationCreate(0, 0.0, 0x10003uLL, v42, v33);
              qword_100010700 = (uint64_t)v37;
              if (v42[0])
              {
                CFDictionaryRef v39 = secLogObjForScope();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v4;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v42[0];
                  _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Can't make notification for %@ err=%x", buf, 0x12u);
                }

LABEL_48:
                exit(0);
              }
              qword_1000106F8 = (uint64_t)CFUserNotificationCreateRunLoopSource(0, v37, (CFUserNotificationCallBack)sub_100006F5C, 0);
              Current = CFRunLoopGetCurrent();
              CFRunLoopAddSource(Current, (CFRunLoopSourceRef)qword_1000106F8, kCFRunLoopDefaultMode);
            }
            [v4 setApplicantUIState:1];

LABEL_31:
            return;
          }
        }
        else
        {
        }
        v24 = secLogObjForScope();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v4;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "NULL data for %@", buf, 0xCu);
        }

        sub_100006CD0(1);
        goto LABEL_31;
      }
      if (byte_100010708 != 1)
      {
LABEL_16:
        qword_100010700 = 0;
        CFRelease(v12);
LABEL_17:
        long long v13 = (const void *)qword_1000106F8;
        if (qword_1000106F8)
        {
          qword_1000106F8 = 0;
          CFRelease(v13);
        }
        goto LABEL_19;
      }
    }
    else
    {
      if (byte_100010708 != 1) {
        goto LABEL_19;
      }
      uint32_t v12 = (void *)qword_100010700;
      if (!qword_100010700) {
        goto LABEL_19;
      }
    }
    CFUserNotificationCancel((CFUserNotificationRef)v12);
    uint32_t v12 = (void *)qword_100010700;
    if (!qword_100010700) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
}

void sub_100006CD0(int a1)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    if (qword_1000106F8)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)qword_1000106F8, kCFRunLoopDefaultMode);
      unsigned int v3 = (const void *)qword_1000106F8;
      if (qword_1000106F8)
      {
        qword_1000106F8 = 0;
        CFRelease(v3);
      }
    }
    if (qword_100010700)
    {
      CFUserNotificationCancel((CFUserNotificationRef)qword_100010700);
      id v4 = (const void *)qword_100010700;
      if (qword_100010700)
      {
        qword_100010700 = 0;
        CFRelease(v4);
      }
    }
    if (a1)
    {
      uint64_t v5 = CFRunLoopGetCurrent();
      CFRunLoopStop(v5);
    }
    byte_100010708 = 1;
    byte_100010709 = 0;
  }
}

id sub_100006D6C()
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    v0 = +[ACAccountStore defaultStore];
    id v1 = objc_msgSend(v0, "aa_primaryAppleAccount");
    id v2 = [v1 username];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id sub_100006DE8()
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v0 = objc_msgSend((id)qword_100010710, "objectEnumerator", 0);
    id v1 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v1)
    {
      id v2 = v1;
      id v3 = 0;
      uint64_t v4 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(void *)v11 != v4) {
            objc_enumerationMutation(v0);
          }
          int v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if ([v6 applicantUIState] == 1)
          {
            id v8 = v6;

            goto LABEL_17;
          }
          if (![v6 applicantUIState])
          {
            id v7 = v6;

            id v3 = v7;
          }
        }
        id v2 = [v0 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v3 = 0;
    }

    id v3 = v3;
    id v8 = v3;
LABEL_17:
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_100006F5C(__CFUserNotification *a1, __CFError *a2)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    if (a2 != (__CFError *)1)
    {
      if (!a2)
      {
        int v4 = 0;
        int v5 = 3;
        goto LABEL_9;
      }
      int v6 = secLogObjForScope();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        CFErrorRef v37 = a2;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unexpected response %lu", buf, 0xCu);
      }
    }
    int v5 = 2;
    int v4 = 1;
LABEL_9:
    CFErrorRef err = 0;
    id v7 = sub_100003D80(1);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100007520;
    v33[3] = &unk_10000C710;
    int v34 = v5;
    [v7 enumerateObjectsUsingBlock:v33];
    if (v4)
    {
      int v8 = sub_100003BA4();
      CFDictionaryRef v9 = secLogObjForScope();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8)
      {
        if (v10)
        {
          *(_DWORD *)buf = 138412290;
          CFErrorRef v37 = (CFErrorRef)v7;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Didn't need password to process %@", buf, 0xCu);
        }

        sub_100006CD0(1);
        goto LABEL_58;
      }
      if (v10)
      {
        *(_DWORD *)buf = 138412546;
        CFErrorRef v37 = err;
        __int16 v38 = 2112;
        CFDictionaryRef v39 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Couldn't process reject without password (e=%@) for %@ (will try with password next)", buf, 0x16u);
      }

      long long v11 = err;
      CFIndex Code = CFErrorGetCode(err);
      if ((unint64_t)(Code + 536870212) <= 0x26 && ((1 << (Code + 68)) & 0x4002000001) != 0)
      {
        CFErrorDomain Domain = CFErrorGetDomain(v11);
        if (Domain && kCFErrorDomainMach)
        {
          if (CFEqual(Domain, kCFErrorDomainMach)) {
            goto LABEL_21;
          }
        }
        else if (Domain == kCFErrorDomainMach)
        {
LABEL_21:
          v14 = secLogObjForScope();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "system is locked, dismiss the notification", buf, 2u);
          }
LABEL_57:

LABEL_58:
          return;
        }
      }
      CFErrorRef v15 = err;
      if (err)
      {
        CFErrorRef err = 0;
        CFRelease(v15);
      }
    }
    int v16 = CFUserNotificationGetResponseValue(a1, kCFUserNotificationTextFieldValuesKey, 0);
    v14 = v16;
    if (v16)
    {
      v32 = v16;
      uint64_t v17 = (const char *)[v16 UTF8String];
      uint64_t v18 = +[NSData dataWithBytes:v17 length:strlen(v17)];
      unsigned int v19 = 0;
      while ((SOSCCTryUserCredentials() & 1) != 0)
      {
        int v20 = sub_100003BA4();
        if ((v20 & 1) == 0)
        {
          double v21 = secLogObjForScope();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFErrorRef v37 = err;
            __int16 v38 = 2112;
            CFDictionaryRef v39 = v7;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Can't processRequests: %@ for %@", buf, 0x16u);
          }
        }
        CFErrorRef v22 = err;
        if (err)
        {
          CFErrorRef err = 0;
          CFRelease(v22);
        }
        BOOL v24 = v19++ < 4;
        if ((v24 & ~v20 & 1) == 0)
        {
          if (v20 && (sub_100006DE8(), id v25 = objc_claimAutoreleasedReturnValue(), v25, v25))
          {
            sub_100006CD0(0);
            sub_10000653C(0);
          }
          else
          {
            sub_100006CD0(1);
          }
          v14 = v32;
          goto LABEL_56;
        }
      }
      id v27 = secLogObjForScope();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFErrorRef v37 = err;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Try user credentials failed %@", buf, 0xCu);
      }

      if (err)
      {
        uint64_t v28 = (const void *)kSOSErrorDomain;
        CFErrorDomain v29 = CFErrorGetDomain(err);
        if (!CFEqual(v28, v29) || CFErrorGetCode(err) != 3) {
          exit(0);
        }
      }
      v30 = secLogObjForScope();
      v14 = v32;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Calling askAboutAll again...", buf, 2u);
      }

      [v7 enumerateObjectsUsingBlock:&stru_10000C750];
      sub_10000653C(1);
      CFErrorRef v31 = err;
      if (err)
      {
        CFErrorRef err = 0;
        CFRelease(v31);
      }
LABEL_56:
    }
    else
    {
      v26 = secLogObjForScope();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No password given, retry", buf, 2u);
      }

      sub_10000653C(1);
    }
    goto LABEL_57;
  }
}

id sub_100007520(uint64_t a1, void *a2)
{
  return [a2 setApplicantUIState:*(unsigned int *)(a1 + 32)];
}

void sub_10000752C(id a1, id a2, unint64_t a3, BOOL *a4)
{
}

void sub_100007538(id a1, int a2)
{
  id v2 = secLogObjForScope();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)uint64_t v49 = kSOSCCCircleChangedNotification;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Notified: %s", buf, 0xCu);
  }

  CFTypeRef cf = 0;
  id v3 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = (id)SOSCCCopyApplicantPeerInfo();
  id v4 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (!v4)
  {
    char v36 = 0;
    goto LABEL_20;
  }
  id v6 = v4;
  char v36 = 0;
  uint64_t v7 = *(void *)v43;
  *(void *)&long long v5 = 138412546;
  long long v35 = v5;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v43 != v7) {
        objc_enumerationMutation(obj);
      }
      CFDictionaryRef v9 = [[Applicant alloc] initWithPeerInfo:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      BOOL v10 = [(Applicant *)v9 idString];
      [v3 addObject:v10];

      long long v11 = (void *)qword_100010710;
      long long v12 = [(Applicant *)v9 idString];
      long long v13 = [v11 objectForKeyedSubscript:v12];

      if (!v13)
      {
        int v16 = (void *)qword_100010710;
        CFErrorRef v15 = [(Applicant *)v9 idString];
        [v16 setObject:v9 forKeyedSubscript:v15];
        char v36 = 1;
        goto LABEL_16;
      }
      unsigned int v14 = [v13 applicantUIState];
      if (v14 == 1)
      {
        [(Applicant *)v9 setApplicantUIState:1];
LABEL_15:
        uint64_t v17 = (void *)qword_100010710;
        CFErrorRef v15 = [(Applicant *)v9 idString];
        [v17 setObject:v9 forKeyedSubscript:v15];
        goto LABEL_16;
      }
      if (!v14) {
        goto LABEL_15;
      }
      CFErrorRef v15 = secLogObjForScope();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v35;
        *(void *)uint64_t v49 = v13;
        *(_WORD *)&v49[8] = 2112;
        *(void *)&v49[10] = v9;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Update to %@ >> %@ with pending order, should work out ok though", buf, 0x16u);
      }
LABEL_16:
    }
    id v6 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  }
  while (v6);
LABEL_20:

  if (!cf)
  {
    unsigned int v19 = objc_opt_new();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    int v20 = [(id)qword_100010710 keyEnumerator];
    id v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v39;
      char v24 = v36;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * (void)j);
          if ((objc_msgSend(v3, "containsObject:", v26, v35) & 1) == 0)
          {
            [v19 addObject:v26];
            char v24 = 1;
          }
        }
        id v22 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v22);
    }
    else
    {
      char v24 = v36;
    }

    [(id)qword_100010710 removeObjectsForKeys:v19];
    if (![v3 count])
    {
      id v27 = secLogObjForScope();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "All applicants were handled elsewhere", buf, 2u);
      }

      sub_100006CD0(1);
    }
    int v28 = SOSCCThisDeviceIsInCircle();
    if (sub_100005838(0) && v28 == -1)
    {
      CFErrorDomain v29 = secLogObjForScope();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v49 = 0;
        v30 = "returning early due to error returned from securityd: %@";
        CFErrorRef v31 = v29;
        uint32_t v32 = 12;
LABEL_51:
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
    else
    {
      if (v28)
      {
        CFDictionaryRef v33 = secLogObjForScope();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = [v3 count];
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)uint64_t v49 = v28;
          *(_WORD *)&v49[4] = 2048;
          *(void *)&v49[6] = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Left circle (%d), not handling remaining %lu applicants", buf, 0x12u);
        }

        sub_100006CD0(1);
      }
      if (v24)
      {
        sub_10000653C(0);
LABEL_53:

        goto LABEL_54;
      }
      CFErrorDomain v29 = secLogObjForScope();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v30 = "needsUpdate false, not updating alert";
        CFErrorRef v31 = v29;
        uint32_t v32 = 2;
        goto LABEL_51;
      }
    }

    goto LABEL_53;
  }
  uint64_t v18 = secLogObjForScope();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v49 = cf;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Could not update peer info array: %@", buf, 0xCu);
  }

  CFRelease(cf);
LABEL_54:
}

void sub_100007B1C(uint64_t a1)
{
  uint64_t v2 = qword_100010700;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      int v6 = 138412290;
      uint64_t v7 = off_1000106E8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Backup state might have changed (dS=%@)", (uint8_t *)&v6, 0xCu);
    }

    sub_100005AB0(*(unsigned int *)(a1 + 40));
  }
  else
  {
    if (v5)
    {
      int v6 = 138412290;
      uint64_t v7 = off_1000106E8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Backup state may have changed, but we don't care anymore (dS=%@)", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_100007C3C(uint64_t a1, uint64_t a2)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    id v4 = secLogObjForScope();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      uint64_t v7 = a1;
      __int16 v8 = 2048;
      uint64_t v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "kOC %@ %lu", (uint8_t *)&v6, 0x16u);
    }

    if (a2)
    {
      if (a2 != 1)
      {
LABEL_9:
        sub_100006CD0(1);
        return;
      }
      BOOL v5 = &stru_10000C6F0;
    }
    else
    {
      BOOL v5 = &stru_10000C6D0;
    }
    sub_1000059F8(v5);
    goto LABEL_9;
  }
}

void sub_100007D34(id a1)
{
  if (byte_100010721) {
    CFStringRef v1 = @"prefs:root=APPLE_ACCOUNT&aaaction=CDP&command=rejoin";
  }
  else {
    CFStringRef v1 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync/ADVANCED";
  }
  uint64_t v2 = +[NSURL URLWithString:v1];
  uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v4 = [v3 openSensitiveURL:v2 withOptions:0];

  BOOL v5 = secLogObjForScope();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109120;
    unsigned int v8 = byte_100010721;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "kickOutChoice account is iCDP: %{BOOL}d", (uint8_t *)&v7, 8u);
  }

  int v6 = secLogObjForScope();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 67109378;
    unsigned int v8 = v4;
    __int16 v9 = 2112;
    BOOL v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ok=%{BOOL}d opening %@", (uint8_t *)&v7, 0x12u);
  }
}

void sub_100007EAC(id a1)
{
  if (!byte_100010721) {
    return;
  }
  id v1 = objc_alloc_init((Class)CDPFollowUpController);
  if (SOSCompatibilityModeEnabled()) {
    +[CDPFollowUpContext contextForSOSCompatibilityMode];
  }
  else {
  uint64_t v2 = +[CDPFollowUpContext contextForStateRepair];
  }
  int v3 = SOSCompatibilityModeEnabled();
  unsigned int v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      int v6 = "Posting a follow up (for SOS) of type SOS Compatibility Mode";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    int v6 = "Posting a follow up (for SOS) of type repair";
    goto LABEL_10;
  }

  id v10 = 0;
  [v1 postFollowUpWithContext:v2 error:&v10];
  id v7 = v10;
  unsigned int v8 = secLogObjForScope();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "request to CoreCDP to follow up failed: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreCDP handling follow up", buf, 2u);
    }

    byte_100010720 = 1;
  }
}

uint64_t sub_100008088(uint64_t a1)
{
  (*(void (**)(void))(qword_100010718 + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

void sub_1000080D8(id a1)
{
  id v1 = objc_alloc_init((Class)CDPFollowUpController);
  if (SOSCompatibilityModeEnabled()) {
    +[CDPFollowUpContext contextForSOSCompatibilityMode];
  }
  else {
  uint64_t v2 = +[CDPFollowUpContext contextForStateRepair];
  }
  int v3 = SOSCompatibilityModeEnabled();
  unsigned int v4 = secLogObjForScope();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    int v6 = "Posting a follow up (for SOS) of type SOS Compatibility Mode";
  }
  else
  {
    if (!v5) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    int v6 = "Posting a follow up (for SOS) of type repair";
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
LABEL_10:

  id v10 = 0;
  [v1 postFollowUpWithContext:v2 error:&v10];
  id v7 = v10;
  unsigned int v8 = secLogObjForScope();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "request to CoreCDP to follow up failed: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CoreCDP handling follow up", buf, 2u);
    }

    byte_100010720 = 1;
  }
}

void sub_1000082A8(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = secLogObjForScope();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "activity handler fired", v3, 2u);
  }
}

void sub_100008318(uint64_t a1, unint64_t a2)
{
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    if (a2 <= 1)
    {
      int v3 = +[PersistentState loadFromStorage];
      unsigned int v4 = objc_opt_new();
      BOOL v5 = objc_msgSend(v4, "dateByAddingTimeInterval:", (double)objc_msgSend(v3, "pendingApplicationReminderAlertInterval"));
      [v3 setPendingApplicationReminder:v5];

      sub_10000590C((int)[v3 pendingApplicationReminderAlertInterval]);
      [v3 writeToStorage];
      if (a2 == 1)
      {
        int v6 = +[LSApplicationWorkspace defaultWorkspace];
        id v7 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync/ADVANCED"];
        unsigned int v8 = [v6 openSensitiveURL:v7 withOptions:0];

        BOOL v9 = secLogObjForScope();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          int v10 = 136315650;
          long long v11 = "reminderChoice";
          __int16 v12 = 2112;
          CFStringRef v13 = @"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync/ADVANCED";
          __int16 v14 = 1024;
          unsigned int v15 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s iCSC: opening %@ ok=%{BOOL}d", (uint8_t *)&v10, 0x1Cu);
        }
      }
    }
    sub_100006CD0(1);
  }
}

void sub_1000084D0(id a1)
{
  byte_100010730 = os_variant_has_internal_diagnostics();
}

void sub_1000084FC(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (SOSCCIsSOSTrustAndSyncingEnabled())
  {
    int v3 = xpc_copy_description(v2);
    string = xpc_dictionary_get_string(v2, "Notification");
    BOOL v5 = secLogObjForScope();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      int v10 = (void *)string;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notification arrived: %s", (uint8_t *)&v9, 0xCu);
    }

    int v6 = secLogObjForScope();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = "for applicants";
      if (byte_100010708) {
        id v7 = "!applicants";
      }
      int v9 = 136316162;
      int v10 = v3;
      __int16 v11 = 2048;
      uint64_t v12 = qword_100010700;
      if (byte_100010709) {
        unsigned int v8 = "KO";
      }
      else {
        unsigned int v8 = "!KO";
      }
      __int16 v13 = 2080;
      __int16 v14 = v7;
      __int16 v15 = 2080;
      int v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = off_1000106E8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "notifyd event: %s\nAlert (%p) %s %s\ndebugState: %@", (uint8_t *)&v9, 0x34u);
    }

    free(v3);
  }
}

uint64_t sub_1000086BC()
{
  if (!qword_100010738) {
    qword_100010738 = _sl_dlopen();
  }
  return qword_100010738;
}

void *sub_10000878C(uint64_t a1)
{
  uint64_t v2 = sub_1000087DC();
  result = dlsym(v2, "SimulateCrash");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100010740 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000087DC()
{
  uint64_t v0 = sub_1000086BC();
  if (v0) {
    return (void *)v0;
  }
  id v1 = +[NSAssertionHandler currentHandler];
  int v3 = +[NSString stringWithUTF8String:"void *CrashReporterSupportLibrary(void)"];
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, @"simulate_crash.m", 18, @"%s", 0);

  __break(1u);
  free(v4);
  return v1;
}

uint64_t sub_10000888C()
{
  uint64_t result = _sl_dlopen();
  qword_100010738 = result;
  return result;
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return _CFUserNotificationGetResponseValue(userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return _CFUserNotificationUpdate(userNotification, timeout, flags, dictionary);
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t OctagonPlatformSupportsSOS()
{
  return _OctagonPlatformSupportsSOS();
}

uint64_t SOSCCAcceptApplicants()
{
  return _SOSCCAcceptApplicants();
}

uint64_t SOSCCCopyApplicantPeerInfo()
{
  return _SOSCCCopyApplicantPeerInfo();
}

uint64_t SOSCCGetLastDepartureReason()
{
  return _SOSCCGetLastDepartureReason();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return _SOSCCIsSOSTrustAndSyncingEnabled();
}

uint64_t SOSCCRejectApplicants()
{
  return _SOSCCRejectApplicants();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return _SOSCCThisDeviceIsInCircle();
}

uint64_t SOSCCThisDeviceIsInCircleNonCached()
{
  return _SOSCCThisDeviceIsInCircleNonCached();
}

uint64_t SOSCCTryUserCredentials()
{
  return _SOSCCTryUserCredentials();
}

uint64_t SOSCompatibilityModeEnabled()
{
  return _SOSCompatibilityModeEnabled();
}

uint64_t SecFrameworkCopyLocalizedString()
{
  return _SecFrameworkCopyLocalizedString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

uint64_t secLogObjForScope()
{
  return _secLogObjForScope();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absentCircleWithNoReason(void *a1, const char *a2, ...)
{
  return [a1 absentCircleWithNoReason];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_applicantUIState(void *a1, const char *a2, ...)
{
  return [a1 applicantUIState];
}

id objc_msgSend_applicantUIStateName(void *a1, const char *a2, ...)
{
  return [a1 applicantUIStateName];
}

id objc_msgSend_applicationDate(void *a1, const char *a2, ...)
{
  return [a1 applicationDate];
}

id objc_msgSend_contextForSOSCompatibilityMode(void *a1, const char *a2, ...)
{
  return [a1 contextForSOSCompatibilityMode];
}

id objc_msgSend_contextForStateRepair(void *a1, const char *a2, ...)
{
  return [a1 contextForStateRepair];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugShowLeftReason(void *a1, const char *a2, ...)
{
  return [a1 debugShowLeftReason];
}

id objc_msgSend_defaultPendingApplicationReminderAlertInterval(void *a1, const char *a2, ...)
{
  return [a1 defaultPendingApplicationReminderAlertInterval];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_idString(void *a1, const char *a2, ...)
{
  return [a1 idString];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastCircleStatus(void *a1, const char *a2, ...)
{
  return [a1 lastCircleStatus];
}

id objc_msgSend_loadFromStorage(void *a1, const char *a2, ...)
{
  return [a1 loadFromStorage];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_pendingApplicationReminder(void *a1, const char *a2, ...)
{
  return [a1 pendingApplicationReminder];
}

id objc_msgSend_pendingApplicationReminderAlertInterval(void *a1, const char *a2, ...)
{
  return [a1 pendingApplicationReminderAlertInterval];
}

id objc_msgSend_rawPeerInfo(void *a1, const char *a2, ...)
{
  return [a1 rawPeerInfo];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_urlForStorage(void *a1, const char *a2, ...)
{
  return [a1 urlForStorage];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_writeToStorage(void *a1, const char *a2, ...)
{
  return [a1 writeToStorage];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}