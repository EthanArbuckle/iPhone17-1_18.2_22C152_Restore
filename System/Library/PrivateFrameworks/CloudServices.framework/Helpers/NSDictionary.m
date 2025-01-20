@interface NSDictionary
- (id)base64EncodedStringFromDict;
- (id)keysOfEntriesContainingObject:(id)a3;
- (int64_t)compare:(id)a3 with:(id)a4;
- (void)recordIDAndClientMetadataForSilentAttemptFromRecords:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 sosCompatibilityModeEnabled:(BOOL)a6 reply:(id)a7;
@end

@implementation NSDictionary

- (id)keysOfEntriesContainingObject:(id)a3
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A9D8;
  v7[3] = &unk_1000710B8;
  id v8 = a3;
  id v4 = v8;
  v5 = [(NSDictionary *)self keysOfEntriesPassingTest:v7];

  return v5;
}

- (int64_t)compare:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"metadata"];
  v9 = [v8 objectForKeyedSubscript:@"BackupKeybagDigest"];

  v10 = [v7 objectForKeyedSubscript:@"metadata"];
  v11 = [v10 objectForKeyedSubscript:@"BackupKeybagDigest"];

  v12 = [(NSDictionary *)self keysOfEntriesContainingObject:v9];
  v13 = [(NSDictionary *)self keysOfEntriesContainingObject:v11];
  uint64_t v14 = kSecureBackupEscrowDateKey;
  v15 = [v6 objectForKeyedSubscript:kSecureBackupEscrowDateKey];
  v16 = [v7 objectForKeyedSubscript:v14];
  if ([v12 isEqualToSet:v13])
  {
    int64_t v17 = (int64_t)[v15 compare:v16];
    v18 = CloudServicesLog();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17 == -1)
    {
      if (v19)
      {
        *(_WORD *)buf = 0;
        v29 = "candidate can recover same views but is newer";
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    if (!v19) {
      goto LABEL_44;
    }
    *(_WORD *)buf = 0;
    v20 = "candidate can recover same views but is not newer";
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    goto LABEL_44;
  }
  v35 = v16;
  v36 = v15;
  v37 = v11;
  v38 = v9;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v21 = [&off_100076000 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (!v21) {
    goto LABEL_15;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v40;
  while (2)
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v40 != v23) {
        objc_enumerationMutation(&off_100076000);
      }
      uint64_t v25 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      id v26 = [v12 compareMembershipOfObject:v25 withSet:v13];
      int64_t v17 = (int64_t)v26;
      if (v26 == (id)1)
      {
        v18 = CloudServicesLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v25;
          v30 = "candidate cannot recover %@";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);
        }
LABEL_26:
        v11 = v37;
        v9 = v38;
        v16 = v35;
        v15 = v36;
        goto LABEL_44;
      }
      if (v26 == (id)-1)
      {
        v18 = CloudServicesLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v44 = v25;
          v30 = "candidate can recover %@";
          goto LABEL_25;
        }
        goto LABEL_26;
      }
    }
    id v22 = [&off_100076000 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_15:
  id v27 = [v12 countOfObjectsWithPrefix:@"PCS"];
  id v28 = [v13 countOfObjectsWithPrefix:@"PCS"];
  if (v27 > v28)
  {
    v18 = CloudServicesLog();
    v11 = v37;
    v9 = v38;
    v16 = v35;
    v15 = v36;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "candidate can recover fewer PCS views", buf, 2u);
    }
    int64_t v17 = 1;
    goto LABEL_44;
  }
  if (v27 < v28)
  {
    v18 = CloudServicesLog();
    v11 = v37;
    v9 = v38;
    v16 = v35;
    v15 = v36;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v29 = "candidate can recover more PCS views";
      goto LABEL_42;
    }
LABEL_43:
    int64_t v17 = -1;
    goto LABEL_44;
  }
  id v31 = [v12 count];
  v11 = v37;
  v9 = v38;
  v15 = v36;
  if (v31 <= [v13 count])
  {
    id v32 = [v12 count];
    if (v32 >= [v13 count])
    {
      v16 = v35;
      int64_t v17 = (int64_t)[v36 compare:v35];
      v18 = CloudServicesLog();
      BOOL v33 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17 != -1)
      {
        if (!v33) {
          goto LABEL_44;
        }
        *(_WORD *)buf = 0;
        v20 = "candidate can recover same number of views but is not newer";
        goto LABEL_5;
      }
      if (!v33) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v29 = "candidate can recover same number of views but is newer";
    }
    else
    {
      v18 = CloudServicesLog();
      v16 = v35;
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_WORD *)buf = 0;
      v29 = "candidate can recover more total views";
    }
LABEL_42:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v29, buf, 2u);
    goto LABEL_43;
  }
  v18 = CloudServicesLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "candidate can recover fewer total views", buf, 2u);
  }
  int64_t v17 = 1;
  v16 = v35;
LABEL_44:

  return v17;
}

- (void)recordIDAndClientMetadataForSilentAttemptFromRecords:(id)a3 passphraseLength:(unint64_t)a4 platform:(int)a5 sosCompatibilityModeEnabled:(BOOL)a6 reply:(id)a7
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void *, void))a7;
  v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)v86 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "looking for record for silent attempt of passphrase length %lu", buf, 0xCu);
  }

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v11 = v8;
  id v12 = [v11 countByEnumeratingWithState:&v81 objects:v87 count:16];
  if (!v12)
  {
    v66 = 0;
    v54 = 0;
    v52 = 0;
    v55 = v11;
    unint64_t v56 = a4;
    goto LABEL_62;
  }
  id v13 = v12;
  v58 = v9;
  v62 = 0;
  v63 = 0;
  v66 = 0;
  uint64_t v76 = kSecureBackupEscrowDateKey;
  uint64_t v77 = *(void *)v82;
  uint64_t v75 = kSecureBackupRecordIDKey;
  uint64_t v74 = kSecureBackupRemainingAttemptsKey;
  uint64_t v72 = kEscrowServiceRecordMetadataKey;
  uint64_t v67 = kSecureBackupClientMetadataKey;
  uint64_t v65 = kSecureBackupBottleIDKey;
  uint64_t v64 = kSecureBackupBottleValidityKey;
  uint64_t v14 = kSecureBackupUsesNumericPassphraseKey;
  uint64_t v60 = kSecureBackupNumericPassphraseLengthKey;
  unint64_t v73 = a4;
  v68 = v11;
  do
  {
    v15 = 0;
    id v71 = v13;
    do
    {
      if (*(void *)v82 != v77) {
        objc_enumerationMutation(v11);
      }
      v16 = *(void **)(*((void *)&v81 + 1) + 8 * (void)v15);
      uint64_t v17 = [v16 objectForKeyedSubscript:v76];
      v80 = [v16 objectForKeyedSubscript:v75];
      v18 = CloudServicesLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v19 = +[CSDateUtilities localStringFromDate:v17];
        *(_DWORD *)buf = 138412546;
        *(void *)v86 = v80;
        *(_WORD *)&v86[8] = 2112;
        *(void *)&v86[10] = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "checking escrow record: %@ from %@", buf, 0x16u);
      }
      v78 = (void *)v17;

      v20 = [v16 objectForKeyedSubscript:v74];
      unsigned int v21 = [v20 intValue];

      id v22 = [v16 objectForKeyedSubscript:@"silentAttemptAllowed"];
      unsigned int v23 = [v22 isEqual:&__kCFBooleanFalse];

      if (v21 == 10 && (v23 & 1) == 0)
      {
        v24 = [v16 objectForKeyedSubscript:v72];
        uint64_t v25 = [v24 objectForKeyedSubscript:v67];

        id v26 = [v25 mutableCopy];
        if (!a6)
        {
          id v27 = [v16 objectForKeyedSubscript:v72];
          id v28 = [v27 objectForKeyedSubscript:v65];
          [v26 setObject:v28 forKeyedSubscript:v65];

          v29 = [v16 objectForKeyedSubscript:v72];
          v30 = [v29 objectForKeyedSubscript:v64];
          [v26 setObject:v30 forKeyedSubscript:v64];

          id v31 = CloudServicesLog();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v86 = v26;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "metadata containing bottle: %@", buf, 0xCu);
          }
        }
        id v32 = [v26 objectForKeyedSubscript:@"device_platform"];
        unsigned int v33 = [v32 intValue];

        v34 = [v26 objectForKeyedSubscript:v14];
        unsigned int v35 = [v34 BOOLValue];

        if (v33 != a5)
        {
          v38 = CloudServicesLog();
          if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_30;
          }
          *(_WORD *)buf = 0;
          long long v40 = v38;
          long long v41 = "escrow record not same platform, skipping";
          goto LABEL_28;
        }
        if (v35)
        {
          v36 = [v26 objectForKeyedSubscript:v60];
          id v37 = [v36 unsignedIntegerValue];

          v38 = CloudServicesLog();
          BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
          if ((unint64_t)v37 > a4)
          {
            if (v39)
            {
              *(_DWORD *)buf = 134218240;
              *(void *)v86 = v37;
              *(_WORD *)&v86[8] = 2048;
              *(void *)&v86[10] = a4;
              long long v40 = v38;
              long long v41 = "escrow passphrase length (%lu) longer than silent attempt passphrase (%lu), skipping";
              uint32_t v42 = 22;
              goto LABEL_29;
            }
            goto LABEL_30;
          }
          if (v39)
          {
            *(_DWORD *)buf = 134217984;
            *(void *)v86 = v37;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "found clean record with passlen: %lu", buf, 0xCu);
          }

          if (v66 && [(NSDictionary *)self compare:v66 with:v16] != -1)
          {
            v38 = CloudServicesLog();
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
LABEL_34:
            *(_WORD *)buf = 0;
            long long v40 = v38;
            long long v41 = "keeping current candidate";
LABEL_28:
            uint32_t v42 = 2;
LABEL_29:
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v41, buf, v42);
LABEL_30:
            id v37 = (id)v73;
LABEL_52:
            uint64_t v44 = v79;

            unint64_t v73 = (unint64_t)v37;
            v11 = v68;
            id v13 = v71;
            goto LABEL_53;
          }
          v49 = CloudServicesLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v50 = @"better";
            if (!v66) {
              CFStringRef v50 = @"first";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v86 = v50;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
          }

          id v47 = v16;
          id v51 = v80;

          v38 = v63;
          v62 = v51;
          v63 = v26;
        }
        else
        {
          if (v66 && [(NSDictionary *)self compare:v66 with:v16] != -1)
          {
            v38 = CloudServicesLog();
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_30;
            }
            goto LABEL_34;
          }
          v45 = CloudServicesLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v46 = @"better";
            if (!v66) {
              CFStringRef v46 = @"first";
            }
            *(_DWORD *)buf = 138412290;
            *(void *)v86 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "found %@ candidate", buf, 0xCu);
          }

          id v47 = v16;
          id v48 = v80;

          v38 = v63;
          v62 = v48;
          v63 = v26;
          id v37 = (id)a4;
        }
        v66 = v47;
        goto LABEL_52;
      }
      uint64_t v25 = CloudServicesLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        CFStringRef v43 = &stru_100072CF8;
        if (v23) {
          CFStringRef v43 = @"not ";
        }
        *(_DWORD *)v86 = v21;
        *(_WORD *)&v86[4] = 2112;
        *(void *)&v86[6] = v43;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "candidate not eligible: remaining attempts = %d, silent attempt %@allowed", buf, 0x12u);
      }
      uint64_t v44 = v79;
LABEL_53:

      v15 = (char *)v15 + 1;
    }
    while (v13 != v15);
    id v13 = [v11 countByEnumeratingWithState:&v81 objects:v87 count:16];
  }
  while (v13);

  v52 = v62;
  if (v62)
  {
    v53 = CloudServicesLog();
    v9 = v58;
    v54 = v63;
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      sub_100049CD8((uint64_t)v62, (uint64_t)v63, v53);
    }

    v55 = CloudServicesLog();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      sub_100049C3C(v66, v72, v55);
    }
    unint64_t v56 = v73;
LABEL_62:

    unint64_t v57 = v56;
  }
  else
  {
    v9 = v58;
    v54 = v63;
    unint64_t v57 = v73;
  }
  v9[2](v9, v52, v54, v57);
}

- (id)base64EncodedStringFromDict
{
  v2 = +[NSPropertyListSerialization dataWithPropertyList:self format:200 options:0 error:0];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

@end