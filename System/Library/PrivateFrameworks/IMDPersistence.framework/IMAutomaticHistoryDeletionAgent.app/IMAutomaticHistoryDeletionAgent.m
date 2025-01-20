void sub_100004AB8()
{
  dispatch_time_t v0;
  uint64_t vars8;

  v0 = dispatch_time(0, 15000000000);
  dispatch_after(v0, (dispatch_queue_t)&_dispatch_main_q, &stru_100008280);
}

void sub_100004B00(id a1)
{
}

CFTypeRef sub_100004B14()
{
  pthread_mutex_lock(&stru_10000C148);
  uid_t v0 = geteuid();
  if (!v0) {
    uid_t v0 = getuid();
  }
  if (qword_10000C188)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10000C188, (const void *)v0);
    if (Value) {
      goto LABEL_13;
    }
  }
  else
  {
    qword_10000C188 = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
  }
  pw_dir = getenv("IPHONE_SHARED_RESOURCES_DIRECTORY");
  if (pw_dir || (v3 = getpwuid(v0)) != 0 && (pw_dir = v3->pw_dir) != 0)
  {
    Value = CFStringCreateWithFileSystemRepresentation(0, pw_dir);
    if (Value)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)qword_10000C188, (const void *)v0, Value);
      CFRelease(Value);
    }
  }
  else
  {
    Value = 0;
  }
LABEL_13:
  pthread_mutex_unlock(&stru_10000C148);
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%@/Library/Preferences/%@", Value, @"com.apple.MobileSMS");
  return CFAutorelease(v4);
}

id sub_100004C2C()
{
  id result = objc_msgSend(+[IDSServerBag sharedInstanceForBagType:](IDSServerBag, "sharedInstanceForBagType:", 0), "objectForKey:", @"automatic-deletion-disabled");
  if (result)
  {
    return [result BOOLValue];
  }
  return result;
}

uint64_t start()
{
  if (IMOSLoggingEnabled())
  {
    uid_t v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFStringRef v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "IMAutomaticHistoryDeletionAgent launched!", v4, 2u);
    }
  }
  v1 = +[IMMetricsCollector sharedInstance];
  [(IMMetricsCollector *)v1 trackEvent:IMMetricsCollectorEventDeletionAgentLaunched];
  notify_post((const char *)[IMCloudKitLogDailyMetricsNotification cStringUsingEncoding:4]);
  IMRegisterSADAwareXPCActivity();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100008308);
  [+[NSRunLoop currentRunLoop] run];
  return 0;
}

void sub_100004D94(id a1, OS_xpc_object *a2)
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Reached OSX automatic deletion daily setup method", buf, 2u);
    }
  }
  if (xpc_activity_get_state(a2))
  {
    if (xpc_activity_set_state(a2, 4))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004F38;
      block[3] = &unk_1000082E8;
      block[4] = a2;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      return;
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v5 = "Failed to set the state of xpc_activity to continue.";
        goto LABEL_13;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    CFStringRef v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "Handler invoked in check in state";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
}

void sub_100004F38(uint64_t a1)
{
  sub_100004FD4();
  dispatch_time_t v2 = dispatch_time(0, 15000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006440;
  block[3] = &unk_1000082E8;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100004FD4()
{
  if (IMOSLoggingEnabled())
  {
    uid_t v0 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Reached iOS automatic deletion setup method", buf, 2u);
    }
  }
  if ([+[IMUnlockMonitor sharedInstance] isUnderFirstDataProtectionLock])
  {
    if (IMOSLoggingEnabled())
    {
      v1 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Device under first data protection lock, returning early.", buf, 2u);
      }
    }
    return;
  }
  dispatch_time_t v2 = +[NSDate date];
  v3 = [+[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian] components:512 fromDate:v2];
  id v4 = [(NSDateComponents *)v3 weekday];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v3;
      *(_WORD *)&buf[22] = 2048;
      v83 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Should we cleans orphaned attachments? (date=%@) (weekdayComponents:%@) (Day:%ld)", buf, 0x20u);
    }
  }
  CFStringRef v6 = (const __CFString *)sub_100004B14();
  keyExistsAndHasValidFormat[0] = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"TargetAttachmentCleanupDate", v6, keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat[0])
  {
    uint64_t v8 = AppIntegerValue;
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Changing target date based on defaults", buf, 2u);
      }
    }
  }
  else
  {
    uint64_t v8 = 1;
  }
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Target date: %ld", buf, 0xCu);
    }
  }
  id v11 = objc_msgSend(+[IDSServerBag sharedInstanceForBagType:](IDSServerBag, "sharedInstanceForBagType:", 0), "objectForKey:", @"automatic-deletion-disabled");
  if (v11 && ([v11 BOOLValue] & 1) != 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_135;
    }
    v12 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_135;
    }
    *(_WORD *)buf = 0;
    v13 = "Server returned that deletion was disabled, not deleting anything.";
    goto LABEL_108;
  }
  if (IMOSLoggingEnabled())
  {
    v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Reached iOS deletion method", buf, 2u);
    }
  }
  if (sub_100004B14())
  {
    id v15 = objc_alloc_init((Class)IMSyncedSettingsManager);
    id v16 = [v15 settingValueForKey:0];
    id v17 = [v15 settingValueForKey:1];

    if (v16 && (int)[v16 intValue] >= 1)
    {
      +[IMDMessageAutomaticHistoryDeletion deleteMessagesAndAttachmentsAfterDays:v16];
      char v18 = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      char v18 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v16 longValue];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "not deleting messages older than %ld days", buf, 0xCu);
      }
    }
    else
    {
      char v18 = 1;
    }
    if ((int)[v17 intValue] >= 1)
    {
      int v22 = [v17 intValue];
      if (v22 < (int)[v16 intValue])
      {
        +[IMDMessageAutomaticHistoryDeletion deleteAttachmentsAfterDays:v17];
LABEL_45:
        if (IMOSLoggingEnabled())
        {
          v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Notifying agent so that it can reload the chats.", buf, 2u);
          }
        }
        notify_post("com.apple.automatichistorydeletion.deleted");
        goto LABEL_49;
      }
    }
    if (IMOSLoggingEnabled())
    {
      v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = [v17 longValue];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "not deleting attachments older than %ld days", buf, 0xCu);
      }
    }
    if ((v18 & 1) == 0) {
      goto LABEL_45;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Could not find sms domain", buf, 2u);
    }
  }
LABEL_49:
  id v26 = objc_msgSend(+[IDSServerBag sharedInstanceForBagType:](IDSServerBag, "sharedInstanceForBagType:", 1), "objectForKey:", @"recoverable-deletion-disabled");
  if (v26 && [v26 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Not deleting recoverable messages, disabled by server bag", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Deleting recoverable messages that have aged out of recovery window", buf, 2u);
      }
    }
    +[IMDMessageAutomaticHistoryDeletion deleteRecoverableMessagesEligibleForPermanentRemoval];
    if (IMOSLoggingEnabled())
    {
      v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Notifying daemon to reload chat registry", buf, 2u);
      }
    }
    notify_post("com.apple.automatichistorydeletion.deleted");
  }
  if (v4 == (id)v8)
  {
    +[IMDMessageAutomaticHistoryDeletion cleanUpOrphanAttachments];
  }
  else if (IMOSLoggingEnabled())
  {
    v30 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Not the target date, bailing", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "deleting stale ChatKit previews", buf, 2u);
    }
  }
  *(void *)keyExistsAndHasValidFormat = [(id)IMSafeTemporaryDirectory() path];
  CFStringRef v86 = @"CKAnimatedImageMediaObjectPreview";
  v32 = +[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", +[NSArray arrayWithObjects:keyExistsAndHasValidFormat count:2]);
  v33 = +[NSFileManager defaultManager];
  v81[0] = NSURLNameKey;
  v81[1] = NSURLIsDirectoryKey;
  v34 = [(NSFileManager *)v33 enumeratorAtURL:v32 includingPropertiesForKeys:+[NSArray arrayWithObjects:v81 count:2] options:7 errorHandler:0];
  for (id i = [(NSDirectoryEnumerator *)v34 nextObject];
        i;
        id i = [(NSDirectoryEnumerator *)v34 nextObject])
  {
    id v37 = [i path];
    id v38 = [(NSDictionary *)[(NSFileManager *)v33 attributesOfItemAtPath:v37 error:0] objectForKey:NSFileCreationDate];
    id v39 = v38;
    if (v38)
    {
      [v38 timeIntervalSinceNow];
      if (fabs(v40) > 3600.0)
      {
        if (IMOSLoggingEnabled())
        {
          v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v37;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v39;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "ChatKit preview (%@) is too old (created %@), deleting.", buf, 0x16u);
          }
        }
        [(NSFileManager *)v33 removeItemAtPath:v37 error:0];
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "deleting stale ChatKit bubble plugin previews", buf, 2u);
    }
  }
  v43 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Caches/com.apple.MobileSMS/Plugins/Snapshots"];
  v44 = +[NSFileManager defaultManager];
  *(void *)keyExistsAndHasValidFormat = NSURLNameKey;
  CFStringRef v86 = (const __CFString *)NSURLIsDirectoryKey;
  v45 = [(NSFileManager *)v44 enumeratorAtURL:v43 includingPropertiesForKeys:+[NSArray arrayWithObjects:keyExistsAndHasValidFormat count:2] options:7 errorHandler:0];
  for (id j = [(NSDirectoryEnumerator *)v45 nextObject];
        j;
        id j = [(NSDirectoryEnumerator *)v45 nextObject])
  {
    id v48 = [j path];
    id v49 = [(NSDictionary *)[(NSFileManager *)v44 attributesOfItemAtPath:v48 error:0] objectForKey:NSFileCreationDate];
    id v50 = v49;
    if (v49)
    {
      [v49 timeIntervalSinceNow];
      if (fabs(v51) > 3600.0)
      {
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v48;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v50;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "ChatKit preview (%@) is too old (created %@), deleting.", buf, 0x16u);
          }
        }
        [(NSFileManager *)v44 removeItemAtPath:v48 error:0];
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v53 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Deleting previews older than last 200", buf, 2u);
    }
  }
  IMDAttachmentRecordDeleteAttachmentPreviewsOlderThan();
  if (IMOSLoggingEnabled())
  {
    v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "Finished previews older than last 200", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v55 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "Cleansing orphaned sticker transfer user info", buf, 2u);
    }
  }
  [(id)IMStickerTransferInfoDirectoryURL() path];
  IMSharedHelperDeleteOrphanedStickerMMCSDownloadTokens();
  if (IMOSLoggingEnabled())
  {
    v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Cleansing orphaned sticker attachments", buf, 2u);
    }
  }
  IMDCleanseOrphanedStickerAttachments();
  if (IMOSLoggingEnabled())
  {
    v57 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Cleansing browser snapshot cache", buf, 2u);
    }
  }
  IMDCleanseBrowserSnapshots();
  id v58 = objc_msgSend(+[IDSServerBag sharedInstanceForBagType:](IDSServerBag, "sharedInstanceForBagType:", 0), "objectForKey:", @"junk-deletion-disabled");
  if (v58 && [v58 BOOLValue])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_135;
    }
    v12 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_135;
    }
    *(_WORD *)buf = 0;
    v13 = "Not deleting junk messages, disabled by server bag";
LABEL_108:
    v59 = v12;
    uint32_t v60 = 2;
LABEL_126:
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, v13, buf, v60);
    goto LABEL_135;
  }
  *(void *)keyExistsAndHasValidFormat = 0;
  CFStringRef v86 = (const __CFString *)keyExistsAndHasValidFormat;
  uint64_t v87 = 0x2020000000;
  char v88 = 0;
  v61 = +[NSPredicate predicateWithFormat:@"%K == %ld AND %K == %@", IMChatPropertyIsFiltered, 2, IMChatPropertyServiceName, IMServiceNameiMessage];
  id v62 = +[IMDDatabase synchronousDatabase];
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&uint8_t buf[16] = sub_100006668;
  v83 = &unk_100008350;
  v84 = keyExistsAndHasValidFormat;
  [v62 fetchChatRecordsFilteredUsingPredicate:v61 sortedUsingDescriptors:0 limit:1 completionHandler:buf];
  int length_low = LOBYTE(v86->length);
  BOOL v64 = LOBYTE(v86->length) != 0;
  _Block_object_dispose(keyExistsAndHasValidFormat, 8);
  unsigned int v65 = +[IMDeviceUtilities supportsiMessageJunk];
  int v66 = IMOSLoggingEnabled();
  if (((v64 | v65) & 1) == 0)
  {
    if (!v66) {
      goto LABEL_135;
    }
    v74 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v74, OS_LOG_TYPE_INFO)) {
      goto LABEL_135;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = @"NO";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = @"NO";
    v13 = "Not deleting junk messages, recipient is not Oscar eligible: %@ or junk chat exists: %@";
    v59 = v74;
    uint32_t v60 = 22;
    goto LABEL_126;
  }
  if (v66)
  {
    v67 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      CFStringRef v68 = @"NO";
      if (v65) {
        CFStringRef v69 = @"YES";
      }
      else {
        CFStringRef v69 = @"NO";
      }
      if (length_low) {
        CFStringRef v68 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v69;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "Eligible for deletion: %@ - has one junk iMessage: %@", buf, 0x16u);
    }
  }
  id v70 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"startDeletingJunkMessagesFrom"];
  if (v70)
  {
    BOOL v71 = objc_msgSend(v70, "compare:", +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -9720000.0)) == (id)1;
    int v72 = IMOSLoggingEnabled();
    if (!v71)
    {
      if (v72)
      {
        v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_INFO, "Deleting junk messages that have aged out of recovery window", buf, 2u);
        }
      }
      +[IMDMessageAutomaticHistoryDeletion deleteJunkMessagesEligibleForPermanentRemovalOldThanDays:90];
      if (IMOSLoggingEnabled())
      {
        v76 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "Notifying daemon to reload chat registry", buf, 2u);
        }
      }
      notify_post("com.apple.automatichistorydeletion.deleted");
      goto LABEL_135;
    }
    if (v72)
    {
      v73 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = 90;
        v13 = "The feature has been enabled for less than %ld days";
        v59 = v73;
        uint32_t v60 = 12;
        goto LABEL_126;
      }
    }
  }
  else
  {
    [+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults") setObject:+[NSDate date] forKey:@"startDeletingJunkMessagesFrom"];
  }
LABEL_135:
  if (IMOSLoggingEnabled())
  {
    v78 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "Cleaning database", buf, 2u);
    }
  }
  +[IMDMessageAutomaticHistoryDeletion cleanDatabase];
  if (IMOSLoggingEnabled())
  {
    v79 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Notifying to kick off daily periodic sync from automatic deletion agent", buf, 2u);
    }
  }
  notify_post((const char *)[IMCloudKitKickOffDailySyncNotification cStringUsingEncoding:4]);
}

void sub_100006440(uint64_t a1)
{
  BOOL v1 = xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  int v2 = IMOSLoggingEnabled();
  if (v1)
  {
    if (v2)
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v6 = 0;
        id v4 = "Marked xpc_activity to done.";
        v5 = (uint8_t *)&v6;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
      }
    }
  }
  else if (v2)
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v4 = "Failed to set the state of xpc_activity to done.";
      v5 = buf;
      goto LABEL_8;
    }
  }
}

void sub_100006534(id a1, OS_xpc_object *a2)
{
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received iOS keep messages pref change notif,.", v4, 2u);
    }
  }
  sub_100004FD4();
  dispatch_time_t v3 = dispatch_time(0, 15000000000);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, &stru_100008328);
}

void sub_1000065E8(id a1)
{
  if (IMOSLoggingEnabled())
  {
    BOOL v1 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Exiting manually as we were launched as part of a darwin notification", v2, 2u);
    }
  }
  exit(0);
}

void sub_100006668(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    if (IMOSLoggingEnabled())
    {
      dispatch_time_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Found at least 1 iMessage junk chat", v4, 2u);
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithFileSystemRepresentation(CFAllocatorRef alloc, const char *buffer)
{
  return _CFStringCreateWithFileSystemRepresentation(alloc, buffer);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

uint64_t IMDAttachmentRecordDeleteAttachmentPreviewsOlderThan()
{
  return _IMDAttachmentRecordDeleteAttachmentPreviewsOlderThan();
}

uint64_t IMDCleanseBrowserSnapshots()
{
  return _IMDCleanseBrowserSnapshots();
}

uint64_t IMDCleanseOrphanedStickerAttachments()
{
  return _IMDCleanseOrphanedStickerAttachments();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMRegisterSADAwareXPCActivity()
{
  return _IMRegisterSADAwareXPCActivity();
}

uint64_t IMSafeTemporaryDirectory()
{
  return _IMSafeTemporaryDirectory();
}

uint64_t IMSharedHelperDeleteOrphanedStickerMMCSDownloadTokens()
{
  return _IMSharedHelperDeleteOrphanedStickerMMCSDownloadTokens();
}

uint64_t IMStickerTransferInfoDirectoryURL()
{
  return _IMStickerTransferInfoDirectoryURL();
}

uint64_t OSLogHandleForIMEventCategory()
{
  return _OSLogHandleForIMEventCategory();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

uid_t geteuid(void)
{
  return _geteuid();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cleanDatabase(void *a1, const char *a2, ...)
{
  return [a1 cleanDatabase];
}

id objc_msgSend_cleanUpOrphanAttachments(void *a1, const char *a2, ...)
{
  return [a1 cleanUpOrphanAttachments];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deleteRecoverableMessagesEligibleForPermanentRemoval(void *a1, const char *a2, ...)
{
  return [a1 deleteRecoverableMessagesEligibleForPermanentRemoval];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isUnderFirstDataProtectionLock(void *a1, const char *a2, ...)
{
  return [a1 isUnderFirstDataProtectionLock];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_supportsiMessageJunk(void *a1, const char *a2, ...)
{
  return [a1 supportsiMessageJunk];
}

id objc_msgSend_synchronousDatabase(void *a1, const char *a2, ...)
{
  return [a1 synchronousDatabase];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}