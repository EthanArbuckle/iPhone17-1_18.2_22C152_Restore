@interface IMSyncErrorAnalyzer
+ (id)sharedInstance;
- (BOOL)CKPartialError:(id)a3 hasErrorCode:(id)a4;
- (BOOL)CKPartialError:(id)a3 onlyHasErrorCodes:(id)a4;
- (BOOL)_isCKErrorPartialFailure:(id)a3;
- (BOOL)acceptableErrorCodeWhileDeleting:(id)a3;
- (BOOL)errorIndicatesAssetWasNotAvailable:(id)a3;
- (BOOL)errorIndicatesBatchFailure:(id)a3;
- (BOOL)errorIndicatesBatchSizeFailure:(id)a3;
- (BOOL)errorIndicatesDeviceConditionsDontAllowSync:(id)a3;
- (BOOL)errorIndicatesDeviceDoesNotHaveKeysToSync:(id)a3;
- (BOOL)errorIndicatesDuplicateRecordWasFound:(id)a3;
- (BOOL)errorIndicatesIdentityWasLost:(id)a3;
- (BOOL)errorIndicatesItemWasUnknown:(id)a3;
- (BOOL)errorIndicatesMaxAttemptsFailed:(id)a3;
- (BOOL)errorIndicatesQuotaExceeded:(id)a3;
- (BOOL)errorIndicatesRecordSizeFailure:(id)a3;
- (BOOL)errorIndicatesRecordWasAlreadyChanged:(id)a3;
- (BOOL)errorIndicatesRecordWasArchived:(id)a3;
- (BOOL)errorIndicatesTokenWasExpired:(id)a3;
- (BOOL)errorIndicatesUserDeletedZone:(id)a3;
- (BOOL)errorIndicatesZoneNotCreated:(id)a3;
- (BOOL)errorIndicatesZoneNotFound:(id)a3;
- (id)_errorsFromPartialError:(id)a3;
- (id)extractRecordIDsDeletedFromCKPartialError:(id)a3;
- (id)extractRecordIDsNotFoundFromCKPartialError:(id)a3;
- (int64_t)responseForError:(id)a3 attempt:(unint64_t)a4 retryInterval:(id *)a5;
- (unint64_t)calculateDelay:(unint64_t)a3 forAttempt:(unint64_t)a4 maxInterval:(unint64_t)a5;
@end

@implementation IMSyncErrorAnalyzer

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1A07CEBF0;
  block[3] = &unk_1E5A10168;
  block[4] = a1;
  if (qword_1EB4A6570 != -1) {
    dispatch_once(&qword_1EB4A6570, block);
  }
  v2 = (void *)qword_1EB4A6648;

  return v2;
}

- (BOOL)_isCKErrorPartialFailure:(id)a3
{
  return [a3 code] == 2;
}

- (id)_errorsFromPartialError:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 valueForKey:*MEMORY[0x1E4F19CD8]];
  v5 = [v4 allValues];

  return v5;
}

- (BOOL)CKPartialError:(id)a3 onlyHasErrorCodes:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(IMSyncErrorAnalyzer *)self _isCKErrorPartialFailure:v6]
    && [v7 count])
  {
    v8 = [(IMSyncErrorAnalyzer *)self _errorsFromPartialError:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      char v11 = 1;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "code"));
          if (![v7 containsObject:v13]) {
            char v11 = 0;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }
      while (v9);
      BOOL v14 = v11 & 1;
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    if (v6 && IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v6;
        _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "******** IMDCKUtilities not a partial error %@", buf, 0xCu);
      }
    }
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)CKPartialError:(id)a3 hasErrorCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(IMSyncErrorAnalyzer *)self _isCKErrorPartialFailure:v6];
  if (!v7 || !v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [(IMSyncErrorAnalyzer *)self _errorsFromPartialError:v6];
  if ([v9 count] != 1)
  {

    goto LABEL_7;
  }
  uint64_t v10 = [v9 lastObject];
  uint64_t v11 = [v10 code];
  uint64_t v12 = [v7 integerValue];

  if (v11 != v12)
  {
LABEL_7:
    uint64_t v14 = [v6 code];
    BOOL v13 = v14 == [v7 integerValue];
    goto LABEL_8;
  }
  BOOL v13 = 1;
LABEL_8:

  return v13;
}

- (BOOL)errorIndicatesZoneNotCreated:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = IMSingleObjectArray();
    if ([(IMSyncErrorAnalyzer *)self CKPartialError:v4 onlyHasErrorCodes:v5])
    {
      BOOL v6 = 1;
    }
    else
    {
      id v7 = [v4 domain];
      if ([v7 isEqualToString:*MEMORY[0x1E4F19C40]]) {
        BOOL v6 = [v4 code] == 26;
      }
      else {
        BOOL v6 = 0;
      }
    }
    BOOL v8 = [v4 domain];
    if ([v8 isEqualToString:@"com.apple.Messages.ChatSyncErrorDomain"])
    {
      uint64_t v9 = [v4 code];

      if (v9 == 1) {
        BOOL v6 = 1;
      }
    }
    else
    {
    }
    uint64_t v10 = [v4 domain];
    if ([v10 isEqualToString:@"com.apple.Messages.MessageSyncErrorDomain"])
    {
      uint64_t v11 = [v4 code];

      if (v11 == 1) {
        BOOL v6 = 1;
      }
    }
    else
    {
    }
    uint64_t v12 = [v4 domain];
    if ([v12 isEqualToString:@"com.apple.IMCore.IMDCKAttachmentSyncController"])
    {
      uint64_t v13 = [v4 code];

      if (!v13) {
        BOOL v6 = 1;
      }
    }
    else
    {
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesZoneNotFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
      BOOL v6 = [v4 code] == 26;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesUserDeletedZone:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  BOOL v6 = [v4 domain];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v7) {
    goto LABEL_7;
  }
  BOOL v8 = IMSingleObjectArray();
  if (![(IMSyncErrorAnalyzer *)self CKPartialError:v5 onlyHasErrorCodes:v8])
  {
    uint64_t v9 = [v5 code];

    if (v9 == 28) {
      goto LABEL_6;
    }
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_8;
  }

LABEL_6:
  BOOL v10 = 1;
LABEL_8:

  return v10;
}

- (BOOL)errorIndicatesDeviceConditionsDontAllowSync:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"com.apple.Messages.MessageSyncErrorDomain"])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 2) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  BOOL v6 = [v3 domain];
  if ([v6 isEqualToString:@"com.apple.Messages.ChatSyncErrorDomain"])
  {
    uint64_t v7 = [v3 code];

    if (v7 == 3) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  BOOL v8 = [v3 domain];
  if (![v8 isEqualToString:@"com.apple.IMCore.IMDCKAttachmentSyncController"])
  {

    goto LABEL_13;
  }
  uint64_t v9 = [v3 code];

  if (v9 != 4)
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
LABEL_11:
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)errorIndicatesMaxAttemptsFailed:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  if ([v4 isEqualToString:@"com.apple.Messages.ChatSyncErrorDomain"])
  {
    uint64_t v5 = [v3 code];

    if (v5 == 6) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  BOOL v6 = [v3 domain];
  if (![v6 isEqualToString:@"com.apple.IMCore.IMDCKAttachmentSyncController"])
  {

    goto LABEL_9;
  }
  uint64_t v7 = [v3 code];

  if (v7 != 1)
  {
LABEL_9:
    BOOL v8 = 0;
    goto LABEL_10;
  }
LABEL_7:
  BOOL v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)errorIndicatesQuotaExceeded:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMSyncErrorAnalyzer *)self _isCKErrorPartialFailure:v4])
  {
    uint64_t v5 = [(IMSyncErrorAnalyzer *)self _errorsFromPartialError:v4];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      char v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) code] == 25) {
            char v7 = 1;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
      LOBYTE(v6) = v7 & 1;
    }
  }
  else
  {
    uint64_t v5 = [v4 domain];
    if (![v5 isEqualToString:*MEMORY[0x1E4F19C40]])
    {

      LOBYTE(v6) = 0;
      goto LABEL_16;
    }
    LOBYTE(v6) = [v4 code] == 25;
  }

LABEL_16:
  return v6;
}

- (BOOL)errorIndicatesTokenWasExpired:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMSyncErrorAnalyzer *)self _isCKErrorPartialFailure:v4])
  {
    uint64_t v5 = [(IMSyncErrorAnalyzer *)self _errorsFromPartialError:v4];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      char v7 = 0;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * i) code] == 21) {
            char v7 = 1;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
      LOBYTE(v6) = v7 & 1;
    }
  }
  else
  {
    uint64_t v5 = [v4 domain];
    if (![v5 isEqualToString:*MEMORY[0x1E4F19C40]])
    {

      LOBYTE(v6) = 0;
      goto LABEL_16;
    }
    LOBYTE(v6) = [v4 code] == 21;
  }

LABEL_16:
  return v6;
}

- (BOOL)errorIndicatesBatchFailure:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
      BOOL v6 = [v4 code] == 22;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesRecordWasArchived:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
      BOOL v6 = [v4 code] == 100 || objc_msgSend(v4, "code") == 2050;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesDuplicateRecordWasFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]] && objc_msgSend(v4, "code") == 12)
    {
      BOOL v6 = [v4 userInfo];
      if (v6)
      {
        char v7 = [v4 userInfo];
        uint64_t v8 = *MEMORY[0x1E4F19C30];
        uint64_t v9 = [v7 objectForKey:*MEMORY[0x1E4F19C30]];
        if (v9)
        {
          BOOL v10 = [v4 userInfo];
          long long v11 = [v10 objectForKey:v8];
          char v12 = [v11 containsString:@"You can't save the same record twice"];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (BOOL)errorIndicatesRecordWasAlreadyChanged:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
      BOOL v6 = [v4 code] == 14;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesAssetWasNotAvailable:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
      BOOL v6 = [v4 code] == 35;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesItemWasUnknown:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F19C40]]) {
      BOOL v6 = [v4 code] == 11;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)errorIndicatesBatchSizeFailure:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v5)
  {
    BOOL v6 = [v5 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19DD8]];

    if (v7)
    {
      uint64_t v8 = [v3 domain];
      LOBYTE(v7) = [v8 isEqualToString:*MEMORY[0x1E4F19C40]]
                && [v3 code] == 27
                && [v5 code] == 1020;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)errorIndicatesRecordSizeFailure:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v5)
  {
    BOOL v6 = [v5 domain];
    int v7 = [v6 isEqualToString:*MEMORY[0x1E4F19DD8]];

    if (v7)
    {
      uint64_t v8 = [v3 domain];
      LOBYTE(v7) = [v8 isEqualToString:*MEMORY[0x1E4F19C40]]
                && [v3 code] == 27
                && [v5 code] == 2023;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)acceptableErrorCodeWhileDeleting:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1EF305748, &unk_1EF305760, 0);
  BOOL v6 = !v4
    || [(IMSyncErrorAnalyzer *)self CKPartialError:v4 onlyHasErrorCodes:v5]
    || [v4 code] == 26
    || [v4 code] == 28;

  return v6;
}

- (id)extractRecordIDsDeletedFromCKPartialError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4 && [(IMSyncErrorAnalyzer *)self _isCKErrorPartialFailure:v4])
  {
    BOOL v6 = [v4 userInfo];
    int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = objc_msgSend(v7, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v9) {
      goto LABEL_19;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        long long v14 = [v7 objectForKeyedSubscript:v13];
        if ([v14 code] == 26)
        {
          if (!v5) {
            goto LABEL_17;
          }
        }
        else if ([v14 code] != 28 || v5 == 0)
        {
          goto LABEL_17;
        }
        uint64_t v16 = [v13 recordName];

        if (v16)
        {
          long long v17 = [v13 recordName];
          CFArrayAppendValue(v5, v17);
        }
LABEL_17:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v10)
      {
LABEL_19:

        break;
      }
    }
  }

  return v5;
}

- (id)extractRecordIDsNotFoundFromCKPartialError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4 && [(IMSyncErrorAnalyzer *)self _isCKErrorPartialFailure:v4])
  {
    BOOL v6 = [v4 userInfo];
    int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = objc_msgSend(v7, "allKeys", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = [v7 objectForKeyedSubscript:v13];
          if ([v14 code] == 11 && v5 != 0)
          {
            uint64_t v16 = [v13 recordName];

            if (v16)
            {
              long long v17 = [v13 recordName];
              CFArrayAppendValue(v5, v17);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

- (BOOL)errorIndicatesIdentityWasLost:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 domain];
  if (![v5 isEqualToString:*MEMORY[0x1E4F19C40]])
  {

    goto LABEL_5;
  }
  if ([v4 code] != 112)
  {
    BOOL v7 = [(IMSyncErrorAnalyzer *)self CKPartialError:v4 onlyHasErrorCodes:&unk_1EF305B08];

    if (v7) {
      goto LABEL_7;
    }
LABEL_5:
    BOOL v6 = 0;
    goto LABEL_12;
  }

LABEL_7:
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "********** Encryption identiy missing error ***********", v10, 2u);
    }
  }
  BOOL v6 = 1;
LABEL_12:

  return v6;
}

- (BOOL)errorIndicatesDeviceDoesNotHaveKeysToSync:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4
    || ([v4 domain],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:*MEMORY[0x1E4F19C40]],
        v6,
        (v7 & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Error does not indicate device is missing TLK", v16, 2u);
      }
    }
    goto LABEL_15;
  }
  if (!-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, &unk_1EF305B20)&& [v5 code] != 111)
  {
    if (-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, &unk_1EF305B38)|| [v5 code] == 110)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_10;
      }
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      __int16 v14 = 0;
      uint64_t v9 = (uint8_t *)&v14;
      goto LABEL_8;
    }
    if (-[IMSyncErrorAnalyzer CKPartialError:onlyHasErrorCodes:](self, "CKPartialError:onlyHasErrorCodes:", v5, &unk_1EF305B50)|| [v5 code] == 112)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_10;
      }
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
        goto LABEL_9;
      }
      __int16 v13 = 0;
      uint64_t v9 = (uint8_t *)&v13;
      goto LABEL_8;
    }
LABEL_15:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    uint64_t v9 = buf;
LABEL_8:
    _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Error indicates missing TLKs.", v9, 2u);
    goto LABEL_9;
  }
LABEL_10:
  BOOL v10 = 1;
LABEL_16:

  return v10;
}

- (unint64_t)calculateDelay:(unint64_t)a3 forAttempt:(unint64_t)a4 maxInterval:(unint64_t)a5
{
  double v6 = exp2((double)a4) * (double)a3;
  if (v6 >= (double)a5) {
    return (unint64_t)(double)a5;
  }
  return (unint64_t)v6;
}

- (int64_t)responseForError:(id)a3 attempt:(unint64_t)a4 retryInterval:(id *)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8 && IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "responseForError should not be called with nil error", (uint8_t *)&v55, 2u);
    }
  }
  BOOL v10 = [v8 domain];
  uint64_t v11 = *MEMORY[0x1E4F19C40];
  int v12 = [v10 isEqualToString:*MEMORY[0x1E4F19C40]];

  if (!v12)
  {
    v15 = [v8 domain];
    int v16 = [v15 isEqualToString:@"com.apple.Messages.MiC"];

    if (v16)
    {
      int64_t v17 = 1;
      switch([v8 code])
      {
        case 0:
          goto LABEL_36;
        case 2:
          int64_t v17 = 4;
          break;
        case 3:
          int64_t v17 = 5;
          break;
        case 4:
          int64_t v17 = 258;
          break;
        case 7:
          int64_t v17 = 259;
          break;
        default:
          goto LABEL_91;
      }
      goto LABEL_91;
    }
    long long v22 = [v8 domain];
    int v23 = [v22 isEqualToString:@"kCFErrorDomainCFNetwork"];

    if ((v23 & 1) != 0
      || ([v8 domain],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          char v25 = [v24 isEqualToString:*MEMORY[0x1E4F281F8]],
          v24,
          (v25 & 1) != 0))
    {
      int64_t v17 = 2;
      goto LABEL_91;
    }
    v27 = [v8 domain];
    char v28 = [v27 isEqualToString:*MEMORY[0x1E4F28798]];

    if (v28) {
      goto LABEL_36;
    }
    v29 = [v8 domain];
    int v30 = [v29 isEqualToString:@"FileTransferFileURLRetrievalErrorDomain"];

    if (v30)
    {
      if ([v8 code] == 10) {
        int64_t v17 = 8;
      }
      else {
        int64_t v17 = 7;
      }
    }
    else
    {
      v36 = [v8 domain];
      int v37 = [v36 isEqualToString:@"FileTransferErrorDomain"];

      if ((v37 & 1) == 0)
      {
        if ([(IMSyncErrorAnalyzer *)self errorIndicatesZoneNotCreated:v8]
          && IMOSLoggingEnabled())
        {
          v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            int v55 = 138412290;
            unint64_t v56 = (unint64_t)v8;
            _os_log_impl(&dword_1A0772000, v50, OS_LOG_TYPE_INFO, "Error: zone creation failed %@, is not recoverable", (uint8_t *)&v55, 0xCu);
          }
        }
        if (![(IMSyncErrorAnalyzer *)self errorIndicatesDeviceConditionsDontAllowSync:v8])
        {
          if ([(IMSyncErrorAnalyzer *)self errorIndicatesMaxAttemptsFailed:v8]
            && IMOSLoggingEnabled())
          {
            v54 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              int v55 = 138412290;
              unint64_t v56 = (unint64_t)v8;
              _os_log_impl(&dword_1A0772000, v54, OS_LOG_TYPE_INFO, "Error: exceeded attempts %@, is not recoverable", (uint8_t *)&v55, 0xCu);
            }
          }
          int64_t v17 = 1;
          goto LABEL_91;
        }
        if (IMOSLoggingEnabled())
        {
          v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            int v55 = 138412290;
            unint64_t v56 = (unint64_t)v8;
            _os_log_impl(&dword_1A0772000, v51, OS_LOG_TYPE_INFO, "Error: Conditions no longer good for sync %@, is not recoverable, will defer to DAS if possible", (uint8_t *)&v55, 0xCu);
          }
        }
LABEL_36:
        int64_t v17 = 3;
        goto LABEL_91;
      }
      int64_t v17 = 9;
    }
LABEL_91:
    unint64_t v44 = [(IMSyncErrorAnalyzer *)self calculateDelay:15 forAttempt:a4 maxInterval:300];
    if (IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        int v55 = 138412802;
        unint64_t v56 = (unint64_t)v8;
        __int16 v57 = 2048;
        unint64_t v58 = v44;
        __int16 v59 = 2048;
        unint64_t v60 = a4;
        _os_log_impl(&dword_1A0772000, v47, OS_LOG_TYPE_INFO, "No retry interval found for error %@, calculated interval %lu for attempt %lu", (uint8_t *)&v55, 0x20u);
      }
    }
    goto LABEL_95;
  }
  if ([v8 code] == 2)
  {
    __int16 v13 = [(IMSyncErrorAnalyzer *)self _errorsFromPartialError:v8];
    if ([v13 count] == 1)
    {
      uint64_t v14 = [v13 firstObject];

      id v8 = (id)v14;
    }
  }
  else
  {
    __int16 v13 = 0;
  }
  long long v18 = [v8 userInfo];
  long long v19 = [v18 objectForKey:*MEMORY[0x1E4F28A50]];

  uint64_t v20 = [v8 code];
  int64_t v17 = 1;
  if (v20 > 110)
  {
    if (v20 <= 130)
    {
      if (v20 == 111)
      {
        int64_t v17 = 5;
      }
      else if (v20 == 112)
      {
        int64_t v17 = 6;
      }
    }
    else if ((unint64_t)(v20 - 131) >= 2)
    {
      if (v20 == 140)
      {
        if (IMOSLoggingEnabled())
        {
          long long v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            int v55 = 138412290;
            unint64_t v56 = (unint64_t)v8;
            _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Error: Low Disk Space %@, is not recoverable", (uint8_t *)&v55, 0xCu);
          }
LABEL_73:
        }
LABEL_79:
        int64_t v17 = 1;
      }
    }
    else
    {
LABEL_25:
      int64_t v17 = 3;
    }
  }
  else
  {
    switch(v20)
    {
      case 1:
      case 25:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_79;
        }
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v55 = 138412290;
          unint64_t v56 = (unint64_t)v8;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Error %@ is not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 2:
      case 5:
      case 8:
      case 13:
      case 15:
      case 21:
      case 27:
      case 28:
      case 29:
      case 30:
        break;
      case 3:
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            int v55 = 138412290;
            unint64_t v56 = (unint64_t)v8;
            _os_log_impl(&dword_1A0772000, v32, OS_LOG_TYPE_INFO, "Error: Network unavailable error %@, should defer activity; xpc_activity_will invoke us again later.",
              (uint8_t *)&v55,
              0xCu);
          }
        }
        goto LABEL_25;
      case 4:
      case 6:
      case 7:
      case 23:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_34;
        }
        v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v55 = 138412290;
          unint64_t v56 = (unint64_t)v8;
          _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Error: Throttle or Network Failure %@, retrying", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_33;
      case 9:
      case 32:
        goto LABEL_57;
      case 10:
      case 11:
      case 12:
      case 24:
      case 26:
      case 31:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_79;
        }
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v55 = 138412290;
          unint64_t v56 = (unint64_t)v8;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Error! Unexpected %@, not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 14:
      case 16:
      case 17:
      case 19:
      case 22:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_79;
        }
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v55 = 138412290;
          unint64_t v56 = (unint64_t)v8;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Error: Failed to successfuly sync changes up %@, not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 18:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_79;
        }
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v55 = 138412290;
          unint64_t v56 = (unint64_t)v8;
          _os_log_impl(&dword_1A0772000, v21, OS_LOG_TYPE_INFO, "Error: Unexpected App Version! %@, not recoverable", (uint8_t *)&v55, 0xCu);
        }
        goto LABEL_73;
      case 20:
        v33 = [v19 domain];
        uint64_t v34 = *MEMORY[0x1E4F19CA0];
        if ([v33 isEqualToString:*MEMORY[0x1E4F19CA0]])
        {
          BOOL v35 = [v19 code] == 1026;

          if (v35) {
            goto LABEL_25;
          }
        }
        else
        {
        }
        v38 = [v19 domain];
        if ([v38 isEqualToString:v34])
        {
          BOOL v39 = [v19 code] == 1025;

          if (v39) {
            goto LABEL_79;
          }
        }
        else
        {
        }
        v52 = [v19 domain];
        if ([v52 isEqualToString:v11])
        {
          BOOL v53 = [v19 code] == 131;

          if (v53) {
            goto LABEL_25;
          }
        }
        else
        {
        }
        if (IMOSLoggingEnabled())
        {
          v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            LOWORD(v55) = 0;
            _os_log_impl(&dword_1A0772000, v26, OS_LOG_TYPE_INFO, "Operation cancelled, an earlier operation might have failed, retrying", (uint8_t *)&v55, 2u);
          }
LABEL_33:
        }
LABEL_34:
        int64_t v17 = 2;
        break;
      default:
        if (v20 == 110)
        {
LABEL_57:
          if (IMOSLoggingEnabled())
          {
            v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              int v55 = 138412290;
              unint64_t v56 = (unint64_t)v8;
              _os_log_impl(&dword_1A0772000, v31, OS_LOG_TYPE_INFO, "Error: NonHSA2/No user/restricted %@.", (uint8_t *)&v55, 0xCu);
            }
          }
          int64_t v17 = 4;
        }
        break;
    }
  }
  v40 = [v8 userInfo];
  v41 = [v40 objectForKey:*MEMORY[0x1E4F19C60]];

  if (v41)
  {
    [v41 doubleValue];
    double v43 = v42;
    unint64_t v44 = (unint64_t)v42;
    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        int v55 = 134217984;
        unint64_t v56 = (unint64_t)v43;
        _os_log_impl(&dword_1A0772000, v45, OS_LOG_TYPE_INFO, "Error userInfo has a retry interval %lu", (uint8_t *)&v55, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        int v55 = 138412290;
        unint64_t v56 = 0;
        _os_log_impl(&dword_1A0772000, v46, OS_LOG_TYPE_INFO, "Error userInfo had %@ as retry interval, ignoring.", (uint8_t *)&v55, 0xCu);
      }
    }
    unint64_t v44 = 0;
  }

  if (!v44) {
    goto LABEL_91;
  }
LABEL_95:
  if (IMOSLoggingEnabled())
  {
    v48 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      int v55 = 134218754;
      unint64_t v56 = v17;
      __int16 v57 = 2048;
      unint64_t v58 = v44;
      __int16 v59 = 2048;
      unint64_t v60 = a4;
      __int16 v61 = 2112;
      id v62 = v8;
      _os_log_impl(&dword_1A0772000, v48, OS_LOG_TYPE_INFO, "Error analysis: response %lu interval %lu for attempt %lu error %@", (uint8_t *)&v55, 0x2Au);
    }
  }
  if (a5)
  {
    *a5 = [NSNumber numberWithUnsignedInteger:v44];
  }

  return v17;
}

@end