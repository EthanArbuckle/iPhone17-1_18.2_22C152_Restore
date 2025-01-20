@interface PurgeChangeHistoryService
+ (BOOL)purgeChangeHistoryWithError:(id *)a3;
+ (const)activityIdentifier;
+ (void)run;
@end

@implementation PurgeChangeHistoryService

+ (const)activityIdentifier
{
  return "com.apple.contactsd.PurgeChangeHistoryService";
}

+ (void)run
{
  v3 = +[CNContactsDaemonLogs purgeHistory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ is running to purge change history.", buf, 0xCu);
  }
  id v10 = 0;
  unsigned int v5 = [a1 purgeChangeHistoryWithError:&v10];
  id v6 = v10;
  v7 = +[CNContactsDaemonLogs purgeHistory];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [a1 activityIdentifier]);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ has finished purging change history.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_100015D60(a1, (uint64_t)v6, v8);
  }
}

+ (BOOL)purgeChangeHistoryWithError:(id *)a3
{
  CFErrorRef error = 0;
  ABAddressBookRef v4 = ABAddressBookCreateWithOptions(0, &error);
  if (v4)
  {
    int SequenceNumberForClearingChanges = ABChangeHistoryGetSequenceNumberForClearingChanges();
    if (SequenceNumberForClearingChanges < 1)
    {
      v7 = +[CNContactsDaemonLogs purgeHistory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "No change history was purged";
        v9 = v7;
        uint32_t v10 = 2;
        goto LABEL_12;
      }
    }
    else
    {
      int v6 = SequenceNumberForClearingChanges;
      ABChangeHistoryClearChangesToSequenceNumber();
      v7 = +[CNContactsDaemonLogs purgeHistory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v16 = v6;
        v8 = "Purged change history to sequence number %d";
        v9 = v7;
        uint32_t v10 = 8;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }

    CFRelease(v4);
    return v4 != 0;
  }
  CFErrorRef v11 = error;
  if (a3) {
    *a3 = error;
  }
  v12 = +[CNContactsDaemonLogs purgeHistory];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_100015E24((uint64_t)v11, v12);
  }

  return v4 != 0;
}

@end