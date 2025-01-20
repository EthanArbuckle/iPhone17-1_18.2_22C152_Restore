@interface CKRecordUtilities
+ (id)recordIDUsingName:(id)a3 zoneID:(id)a4;
+ (id)recordIDUsingSalt:(id)a3 zoneID:(id)a4 guid:(id)a5;
+ (id)recordNameForRecordChangeTag:(id)a3 ckRecordID:(id)a4 salt:(id)a5 guid:(id)a6;
+ (id)recordNameUsingSalt:(id)a3 guid:(id)a4;
@end

@implementation CKRecordUtilities

+ (id)recordNameUsingSalt:(id)a3 guid:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 length] && objc_msgSend(v5, "length"))
  {
    v7 = MEMORY[0x1E01689A0](v6, v5);
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412802;
        v12 = v7;
        __int16 v13 = 2112;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Computed message record name hash %@ from guid %@ and salt %@", (uint8_t *)&v11, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412802;
        v12 = 0;
        __int16 v13 = 2112;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Could not compute message record name hash %@ from guid %@ and salt %@ as one or both are nil", (uint8_t *)&v11, 0x20u);
      }
    }
    v7 = 0;
  }

  return v7;
}

+ (id)recordNameForRecordChangeTag:(id)a3 ckRecordID:(id)a4 salt:(id)a5 guid:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([a3 length] && objc_msgSend(v10, "length"))
  {
    id v13 = v10;
  }
  else
  {
    id v13 = [a1 recordNameUsingSalt:v11 guid:v12];
  }
  id v14 = v13;

  return v14;
}

+ (id)recordIDUsingName:(id)a3 zoneID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length]) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:v5 zoneID:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)recordIDUsingSalt:(id)a3 zoneID:(id)a4 guid:(id)a5
{
  id v8 = a4;
  v9 = [a1 recordNameUsingSalt:a3 guid:a5];
  id v10 = [a1 recordIDUsingName:v9 zoneID:v8];

  return v10;
}

@end