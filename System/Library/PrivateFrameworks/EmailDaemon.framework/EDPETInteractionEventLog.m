@interface EDPETInteractionEventLog
+ (OS_os_log)log;
+ (void)enumerateFramesInData:(id)a3 block:(id)a4;
- ($40EAC33F1F794FC3221B301F61335479)hashedSubject:(SEL)a3;
- (BOOL)_isLogQuotaReached;
- (BOOL)_openCurrentLogfile;
- (BOOL)shouldLog;
- (CNContactStore)contactStore;
- (EDPETInteractionEventLog)initWithDirectory:(id)a3 userProfileProvider:(id)a4 contactStore:(id)a5 vipManager:(id)a6;
- (EFLazyCache)contactIDCache;
- (EFMutableInt64Set)currentLogMessageIDs;
- (EMUserProfileProvider)profileProvider;
- (EMVIPManager)vipManager;
- (NSData)rotatingSalt;
- (NSFileHandle)logFileHandle;
- (NSString)meContactIdentifier;
- (NSURL)currentLogFile;
- (NSURL)directory;
- (OS_dispatch_queue)workQueue;
- (id)_buildLogFileURLInDir:(id)a3;
- (id)_currentLocaleIdentifier;
- (id)_eventForName:(int)a3 date:(id)a4;
- (id)_framedMessage:(id)a3;
- (id)_messageDataEventForMessage:(id)a3 account:(id)a4;
- (id)_scanForMessageIDs:(id)a3 logVersion:(int64_t *)a4;
- (id)batchedEventsForSubmission;
- (id)hashedMessageHeadersForMessage:(id)a3;
- (id)persistentBits;
- (int)_eventNameFromString:(id)a3;
- (int)_openFileForAppending:(id)a3;
- (int)_timezoneOffset;
- (int64_t)_truncatedSHA256:(id)a3;
- (int64_t)deviceID;
- (int64_t)hashedAccountID:(id)a3;
- (int64_t)hashedContactIDForAddress:(id)a3;
- (int64_t)hashedConversationID:(int64_t)a3;
- (int64_t)hashedMailboxID:(id)a3;
- (int64_t)hashedString:(id)a3;
- (int64_t)userID;
- (unint64_t)_estimateStopCount:(id)a3;
- (unint64_t)_truncatedUNIXTimestampFromDate:(id)a3;
- (unsigned)sequenceNumber;
- (void)_compressFramedMessagesIntoBatch:(id)a3;
- (void)_resetIdentifiers;
- (void)_rotateLogWithCompressedData:(id)a3;
- (void)_writeEvent:(id)a3;
- (void)_writeHeader;
- (void)_writeMessageDataIfNecessary:(id)a3;
- (void)_writeMessageDataIfNecessary:(id)a3 account:(id)a4;
- (void)_writeQuotaReachedEvent;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4;
- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5;
- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6;
- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6;
- (void)persistentBits;
- (void)setCurrentLogFile:(id)a3;
- (void)setCurrentLogMessageIDs:(id)a3;
- (void)setLogFileHandle:(id)a3;
- (void)setMeContactIdentifier:(id)a3;
- (void)setRotatingSalt:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setShouldLog:(BOOL)a3;
- (void)waitForPendingWrites;
@end

@implementation EDPETInteractionEventLog

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDPETInteractionEventLog_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_72 != -1) {
    dispatch_once(&log_onceToken_72, block);
  }
  v2 = (void *)log_log_72;

  return (OS_os_log *)v2;
}

void __31__EDPETInteractionEventLog_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_72;
  log_log_72 = (uint64_t)v1;
}

- (EDPETInteractionEventLog)initWithDirectory:(id)a3 userProfileProvider:(id)a4 contactStore:(id)a5 vipManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)EDPETInteractionEventLog;
  v15 = [(EDPETInteractionEventLog *)&v28 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_directory, a3);
    objc_storeStrong((id *)&v16->_profileProvider, a4);
    objc_storeStrong((id *)&v16->_contactStore, a5);
    objc_storeStrong((id *)&v16->_vipManager, a6);
    v17 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E4F60D88]);
    contactIDCache = v16->_contactIDCache;
    v16->_contactIDCache = v17;

    atomic_store(1u, &v16->_sequenceNumber);
    v19 = (EFMutableInt64Set *)objc_alloc_init(MEMORY[0x1E4F60DB8]);
    currentLogMessageIDs = v16->_currentLogMessageIDs;
    v16->_currentLogMessageIDs = v19;

    atomic_store([(EDPETInteractionEventLog *)v16 _openCurrentLogfile], (unsigned __int8 *)&v16->_shouldLog);
    uint64_t v21 = objc_opt_new();
    stringHasher = v16->_stringHasher;
    v16->_stringHasher = (SGMailIntelligenceStringHasher *)v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v24 = dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v25 = dispatch_queue_create("com.apple.email.EDPETInteractionEventLog.workQueue", v24);
    workQueue = v16->_workQueue;
    v16->_workQueue = (OS_dispatch_queue *)v25;
  }
  return v16;
}

- (int64_t)userID
{
  int64_t result = self->_userID;
  if (!result)
  {
    int64_t result = [(EDPETInteractionEventLog *)self hashedString:@"USER-ID"];
    self->_userID = result;
  }
  return result;
}

- (int64_t)deviceID
{
  int64_t result = self->_deviceID;
  if (!result)
  {
    v4 = [MEMORY[0x1E4F60D58] currentDevice];
    v5 = [v4 identifier];
    v6 = [v5 UUIDString];
    self->_deviceID = [(EDPETInteractionEventLog *)self hashedString:v6];

    return self->_deviceID;
  }
  return result;
}

- (id)persistentBits
{
  p_persistentBits = (uint64_t *)&self->_persistentBits;
  if (!self->_persistentBits)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.suggestions.mail-intelligence"];
    uint64_t v4 = [v3 objectForKey:@"mailIntelligencePersistentBits"];
    v5 = (void *)*p_persistentBits;
    uint64_t *p_persistentBits = v4;

    if (!*p_persistentBits)
    {
      v6 = +[EDPETInteractionEventLog log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[EDPETInteractionEventLog persistentBits]();
      }

      v7 = objc_alloc_init(EDInteractionEventLogLegacyPersistentBitsProvider);
      uint64_t v8 = [(EDInteractionEventLogLegacyPersistentBitsProvider *)v7 _persistentBits];
      v9 = (void *)*p_persistentBits;
      uint64_t *p_persistentBits = v8;

      if (!*p_persistentBits)
      {
        v10 = +[EDPETInteractionEventLog log];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[EDPETInteractionEventLog persistentBits]();
        }

        uint64_t v11 = [NSNumber numberWithUnsignedInt:arc4random_uniform(8u)];
        id v12 = (void *)*p_persistentBits;
        uint64_t *p_persistentBits = v11;
      }
    }
    objc_msgSend(v3, "setObject:forKey:");
  }
  id v13 = +[EDPETInteractionEventLog log];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    [(EDPETInteractionEventLog *)p_persistentBits persistentBits];
  }

  id v14 = (void *)*p_persistentBits;

  return v14;
}

- (void)_resetIdentifiers
{
  self->_userID = 0;
  self->_deviceID = 0;
}

- (NSString)meContactIdentifier
{
  v15[1] = *MEMORY[0x1E4F143B8];
  meContactIdentifier = self->_meContactIdentifier;
  if (!meContactIdentifier)
  {
    uint64_t v4 = [(EDPETInteractionEventLog *)self contactStore];
    v15[0] = *MEMORY[0x1E4F1AE08];
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v6 = [v4 _crossPlatformUnifiedMeContactWithKeysToFetch:v5 error:0];

    v7 = [v6 identifier];
    uint64_t v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
    }
    v10 = self->_meContactIdentifier;
    self->_meContactIdentifier = v9;

    meContactIdentifier = self->_meContactIdentifier;
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
  if ([(NSString *)meContactIdentifier isEqual:v11]) {
    id v12 = 0;
  }
  else {
    id v12 = self->_meContactIdentifier;
  }
  id v13 = v12;

  return v13;
}

- (void)_rotateLogWithCompressedData:(id)a3
{
  id v18 = a3;
  uint64_t v4 = [(EDPETInteractionEventLog *)self logFileHandle];
  [v4 closeFile];

  v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  if ([v5 BOOLForKey:*MEMORY[0x1E4F60118]])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    [v6 setFormatOptions:307];
    v7 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [v6 setTimeZone:v7];

    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [v6 stringFromDate:v8];

    v10 = [NSString stringWithFormat:@"interaction_log,at=%@,v=%ld.pblog.archived", v9, 15];
    uint64_t v11 = [NSString stringWithFormat:@"interaction_log,at=%@,v=%ld.pblog.lzma", v9, 15];
    id v12 = [(EDPETInteractionEventLog *)self directory];
    id v13 = [v12 URLByAppendingPathComponent:v10];

    id v14 = [(EDPETInteractionEventLog *)self directory];
    v15 = [v14 URLByAppendingPathComponent:v11];

    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    v17 = [(EDPETInteractionEventLog *)self currentLogFile];
    [v16 moveItemAtURL:v17 toURL:v13 error:0];

    [v18 writeToURL:v15 atomically:0];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    v9 = [(EDPETInteractionEventLog *)self currentLogFile];
    [v6 removeItemAtURL:v9 error:0];
  }

  [(EDPETInteractionEventLog *)self _resetIdentifiers];
  atomic_store([(EDPETInteractionEventLog *)self _openCurrentLogfile], (unsigned __int8 *)&self->_shouldLog);
}

- (BOOL)_openCurrentLogfile
{
  id v3 = [(EDPETInteractionEventLog *)self directory];
  uint64_t v4 = [(EDPETInteractionEventLog *)self _buildLogFileURLInDir:v3];
  [(EDPETInteractionEventLog *)self setCurrentLogFile:v4];

  v5 = [(EDPETInteractionEventLog *)self currentLogFile];
  uint64_t v6 = [(EDPETInteractionEventLog *)self _openFileForAppending:v5];

  if (v6 == -1) {
    return 0;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v6 closeOnDealloc:1];
  [(EDPETInteractionEventLog *)self setLogFileHandle:v7];

  uint64_t v8 = [(EDPETInteractionEventLog *)self logFileHandle];
  [v8 seekToEndOfFile];

  v9 = [(EDPETInteractionEventLog *)self logFileHandle];
  uint64_t v10 = [v9 offsetInFile];

  if (v10)
  {
    uint64_t v11 = [(EDPETInteractionEventLog *)self logFileHandle];
    [v11 seekToFileOffset:0];

    id v12 = [(EDPETInteractionEventLog *)self logFileHandle];
    id v13 = [v12 readDataToEndOfFileAndReturnError:0];

    id v14 = [(EDPETInteractionEventLog *)self logFileHandle];
    [v14 seekToEndOfFile];

    uint64_t v18 = -1;
    v15 = [(EDPETInteractionEventLog *)self currentLogMessageIDs];
    v16 = [(EDPETInteractionEventLog *)self _scanForMessageIDs:v13 logVersion:&v18];
    [v15 addIndexes:v16];

    if (v18 != 15) {
      [(EDPETInteractionEventLog *)self _writeHeader];
    }
  }
  else
  {
    [(EDPETInteractionEventLog *)self _writeHeader];
    id v13 = [(EDPETInteractionEventLog *)self currentLogMessageIDs];
    [v13 removeAllIndexes];
  }

  return ![(EDPETInteractionEventLog *)self _isLogQuotaReached];
}

- (id)_buildLogFileURLInDir:(id)a3
{
  id v5 = a3;
  if (([v5 isFileURL] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"EDPETInteractionEventLog.m", 220, @"Invalid parameter not satisfying: %@", @"directory.isFileURL" object file lineNumber description];
  }
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"interaction_log.pblog"];

  return v6;
}

- (int)_openFileForAppending:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = open((const char *)[v3 fileSystemRepresentation], 522, 384);
  if (v4 == -1)
  {
    int v5 = *__error();
    uint64_t v6 = [NSString stringWithUTF8String:strerror(v5)];
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v10 = v3;
      __int16 v11 = 1024;
      int v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_ERROR, "Could not open '%@': %d: %@", buf, 0x1Cu);
    }
  }
  return v4;
}

- (id)_framedMessage:(id)a3
{
  id v3 = a3;
  int v4 = [v3 data];
  int v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA58]), "initWithCapacity:", objc_msgSend(v4, "length") + 5);
  char v9 = [v3 messageFrameType];
  [v5 appendBytes:&v9 length:1];
  __int16 v8 = bswap32([v4 length]) >> 16;
  [v5 appendBytes:&v8 length:2];
  [v5 appendData:v4];
  char v7 = v8 ^ HIBYTE(v8) ^ 0x55;
  [v5 appendBytes:&v7 length:1];

  return v5;
}

- (id)_scanForMessageIDs:(id)a3 logVersion:(int64_t *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F60DB8]);
  char v7 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__EDPETInteractionEventLog__scanForMessageIDs_logVersion___block_invoke;
  v10[3] = &unk_1E6C04570;
  int v12 = a4;
  id v8 = v6;
  id v11 = v8;
  [v7 enumerateFramesInData:v5 block:v10];

  return v8;
}

void __58__EDPETInteractionEventLog__scanForMessageIDs_logVersion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2 == 5)
  {
    id v7 = v5;
    id v6 = [[EDPBMessageDataIDOnly alloc] initWithData:v5];
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", -[EDPBMessageDataIDOnly messageId](v6, "messageId"));
  }
  else
  {
    if (a2 != 4) {
      goto LABEL_6;
    }
    id v7 = v5;
    id v6 = [[EDPBInteractionEventHeader alloc] initWithData:v5];
    **(void **)(a1 + 40) = [(EDPBMessageDataIDOnly *)v6 version];
  }

  id v5 = v7;
LABEL_6:
}

- (void)_writeEvent:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  if (v5)
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[EDPETInteractionEventLog _writeEvent:]((uint64_t)v4, v6);
    }

    id v7 = [(EDPETInteractionEventLog *)self _framedMessage:v4];
    id v8 = [(EDPETInteractionEventLog *)self logFileHandle];
    [v8 writeData:v7];

    char v9 = [(EDPETInteractionEventLog *)self logFileHandle];
    [v9 synchronizeFile];

    if ([(EDPETInteractionEventLog *)self _isLogQuotaReached])
    {
      id v10 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[EDPETInteractionEventLog _writeEvent:]();
      }

      [(EDPETInteractionEventLog *)self _writeQuotaReachedEvent];
    }
  }
}

- (void)_writeMessageDataIfNecessary:(id)a3
{
}

- (void)_writeMessageDataIfNecessary:(id)a3 account:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  if (v7)
  {
    id v8 = [v17 messageIDHeader];
    char v9 = objc_msgSend(v8, "ec_messageIDSubstring");
    int64_t v10 = [(EDPETInteractionEventLog *)self hashedString:v9];

    if (v17)
    {
      if (v10)
      {
        id v11 = [(EDPETInteractionEventLog *)self currentLogMessageIDs];
        char v12 = [v11 containsIndex:v10];

        if ((v12 & 1) == 0)
        {
          __int16 v13 = [(EDPETInteractionEventLog *)self _messageDataEventForMessage:v17 account:v6];
          id v14 = [(EDPETInteractionEventLog *)self currentLogMessageIDs];
          [v14 addIndex:v10];

          uint64_t v15 = [(EDPETInteractionEventLog *)self _framedMessage:v13];
          v16 = [(EDPETInteractionEventLog *)self logFileHandle];
          [v16 writeData:v15];
        }
      }
    }
  }
}

- (void)_writeHeader
{
  unsigned __int8 v7 = objc_alloc_init(EDPBInteractionEventHeader);
  [(EDPBInteractionEventHeader *)v7 setVersion:15];
  [(EDPBInteractionEventHeader *)v7 setUserId:[(EDPETInteractionEventLog *)self userID]];
  [(EDPBInteractionEventHeader *)v7 setDeviceId:[(EDPETInteractionEventLog *)self deviceID]];
  id v3 = [(EDPETInteractionEventLog *)self _currentLocaleIdentifier];
  [(EDPBInteractionEventHeader *)v7 setLocale:v3];

  [(EDPBInteractionEventHeader *)v7 setTimezoneOffset:[(EDPETInteractionEventLog *)self _timezoneOffset]];
  id v4 = [(EDPETInteractionEventLog *)self persistentBits];
  -[EDPBInteractionEventHeader setUserSegment:](v7, "setUserSegment:", [v4 unsignedIntValue]);

  [(EDPBInteractionEventHeader *)v7 setCategoryRootInstalled:1];
  unsigned __int8 v5 = [(EDPETInteractionEventLog *)self _framedMessage:v7];
  id v6 = [(EDPETInteractionEventLog *)self logFileHandle];
  [v6 writeData:v5];
}

- (void)_writeQuotaReachedEvent
{
  atomic_store(0, (unsigned __int8 *)&self->_shouldLog);
  id v6 = objc_alloc_init(EDPETQuotaReachedEvent);
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [(EDPETQuotaReachedEvent *)v6 setTimestamp:[(EDPETInteractionEventLog *)self _truncatedUNIXTimestampFromDate:v3]];

  atomic_fetch_add((atomic_uint *volatile)&self->_sequenceNumber, 1u);
  -[EDPETQuotaReachedEvent setSequenceNumber:](v6, "setSequenceNumber:");
  [(EDPETQuotaReachedEvent *)v6 setTimezoneOffset:[(EDPETInteractionEventLog *)self _timezoneOffset]];
  id v4 = [(EDPETInteractionEventLog *)self _framedMessage:v6];
  unsigned __int8 v5 = [(EDPETInteractionEventLog *)self logFileHandle];
  [v5 writeData:v4];
}

+ (void)enumerateFramesInData:(id)a3 block:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, void *, unint64_t, unint64_t, char *))a4;
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  unint64_t v9 = [v7 length];
  char v21 = 0;
  if (v9)
  {
    unint64_t v10 = 0;
    do
    {
      unint64_t v11 = v10 + 3;
      if (v10 + 3 > v9) {
        break;
      }
      uint64_t v12 = bswap32(*(unsigned __int16 *)(v10 + v8 + 1)) >> 16;
      uint64_t v13 = v11 + v12;
      if (v11 + v12 > v9) {
        break;
      }
      unint64_t v14 = v8 + v10;
      uint64_t v15 = *(unsigned __int8 *)(v8 + v10);
      v16 = objc_msgSend(v7, "subdataWithRange:");
      unint64_t v10 = v13 + 1;
      if (v13 + 1 > v9) {
        goto LABEL_15;
      }
      if ((v12 ^ (v12 >> 8) ^ *(unsigned __int8 *)(v8 + v13)) != 0x55)
      {
        uint64_t v18 = [(id)objc_opt_class() log];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          +[EDPETInteractionEventLog enumerateFramesInData:block:](v13 + 1, v18);
        }

LABEL_15:
        break;
      }
      if (v8 + v10 - v14 != v12 + 4)
      {
        id v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:a2 object:a1 file:@"EDPETInteractionEventLog.m" lineNumber:384 description:@"WAT"];
      }
      v6[2](v6, v15, v16, v14, v8 + v10 - v14, &v21);
      if (v21) {
        goto LABEL_15;
      }
    }
    while (v10 < v9);
  }
}

- (unint64_t)_estimateStopCount:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F60D90]) initWithLineThroughPoints:v3];
    [v5 evaluateReverse:139776.0];
    unint64_t v4 = vcvtad_u64_f64(v6);
  }
  else
  {
    unint64_t v4 = -1;
  }

  return v4;
}

- (void)_compressFramedMessagesIntoBatch:(id)a3
{
  id v4 = a3;
  id v5 = [(EDPETInteractionEventLog *)self logFileHandle];
  [v5 seekToFileOffset:0];

  double v6 = [(EDPETInteractionEventLog *)self logFileHandle];
  id v7 = [v6 readDataToEndOfFile];

  uint64_t v72 = 0;
  v73 = &v72;
  uint64_t v74 = 0x4810000000;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v76.dst_ptr = v8;
  *(_OWORD *)&v76.src_ptr = v8;
  v75 = &unk_1DB68C921;
  v76.state = (void *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v68 = 0;
  v69 = &v68;
  uint64_t v70 = 0x2020000000;
  compression_status v71 = -1431655766;
  compression_status v71 = compression_stream_init(&v76, COMPRESSION_STREAM_ENCODE, COMPRESSION_LZMA);
  if (!*((_DWORD *)v69 + 6))
  {
    unint64_t v10 = malloc_type_malloc(0x24C00uLL, 0xAB31A7E9uLL);
    unint64_t v11 = v73;
    v73[4] = (uint64_t)v10;
    v11[5] = 150528;
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x2020000000;
    int v67 = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x2020000000;
    uint64_t v63 = 0;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v59[3] = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    v54[0] = 0;
    v54[1] = v54;
    v54[2] = 0x2020000000;
    v54[3] = -1;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__27;
    v52 = __Block_byref_object_dispose__27;
    id v53 = 0;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    uint64_t v12 = objc_opt_new();
    uint64_t v13 = objc_opt_class();
    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __61__EDPETInteractionEventLog__compressFramedMessagesIntoBatch___block_invoke;
    v30 = &unk_1E6C04598;
    v34 = v59;
    v35 = v54;
    v36 = &v64;
    id v14 = v4;
    id v31 = v14;
    v37 = &v44;
    v38 = &v72;
    v39 = &v68;
    v43 = v10;
    v40 = &v55;
    id v15 = v12;
    id v32 = v15;
    v33 = self;
    v41 = &v48;
    v42 = &v60;
    [v13 enumerateFramesInData:v7 block:&v27];
    if (*((_DWORD *)v69 + 6))
    {
      v16 = objc_msgSend((id)objc_opt_class(), "log", v27, v28, v29, v30, v31);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.4();
      }
    }
    else
    {
      if (*((_DWORD *)v65 + 6) == 1)
      {
        id v17 = objc_alloc_init(EDPETQuotaReachedEvent);
        atomic_fetch_add((atomic_uint *volatile)&self->_sequenceNumber, 1u);
        -[EDPETQuotaReachedEvent setSequenceNumber:](v17, "setSequenceNumber:", v27, v28, v29, v30, v31);
        uint64_t v18 = [MEMORY[0x1E4F1C9C8] now];
        [(EDPETQuotaReachedEvent *)v17 setTimestamp:[(EDPETInteractionEventLog *)self _truncatedUNIXTimestampFromDate:v18]];

        [(EDPETQuotaReachedEvent *)v17 setTimezoneOffset:[(EDPETInteractionEventLog *)self _timezoneOffset]];
        [(EDPETQuotaReachedEvent *)v17 setDroppedEventsCount:v61[3]];
        if (v49[5])
        {
          v19 = [EDPBInteractionEvent alloc];
          v20 = [(EDPBInteractionEvent *)v19 initWithData:v49[5]];
          [(EDPETQuotaReachedEvent *)v17 setTimestamp:[(EDPBInteractionEvent *)v20 timestamp]];
          [(EDPETQuotaReachedEvent *)v17 setTimezoneOffset:[(EDPETInteractionEventLog *)self _timezoneOffset]];
        }
        [v14 setQuotaEvent:v17];
      }
      compression_status v21 = compression_stream_process((compression_stream *)(v73 + 4), 1);
      *((_DWORD *)v69 + 6) = v21;
      if (v21 == COMPRESSION_STATUS_END)
      {
        v56[3] = v73[4] - (void)v10;
        if (*((unsigned char *)v45 + 24))
        {
          id v22 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v23 = (void *)[v22 initWithBytesNoCopy:v10 length:v56[3] freeWhenDone:1];
          [v14 setRawData:v23];
        }
        else
        {
          v24 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:]();
          }

          [v14 setRawData:0];
          free(v10);
        }
        compression_status v25 = compression_stream_destroy((compression_stream *)(v73 + 4));
        *((_DWORD *)v69 + 6) = v25;
        if (v25)
        {
          v26 = [(id)objc_opt_class() log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:]();
          }
        }
        goto LABEL_18;
      }
      v16 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:]();
      }
    }

    free(v10);
LABEL_18:

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

    _Block_object_dispose(v54, 8);
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(v59, 8);
    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&v64, 8);
    goto LABEL_19;
  }
  unint64_t v9 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[EDPETInteractionEventLog _compressFramedMessagesIntoBatch:].cold.5();
  }

LABEL_19:
  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v72, 8);
}

void __61__EDPETInteractionEventLog__compressFramedMessagesIntoBatch___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  id v12 = a3;
  if (++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= *(void *)(*(void *)(*(void *)(a1 + 64)
                                                                                              + 8)
                                                                                  + 24))
    *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
  if (v13 == 1)
  {
    if (a2 == 1)
    {
      id v22 = v12;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40), a3);
      id v12 = v22;
    }
    ++*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24);
  }
  else
  {
    if (v13) {
      goto LABEL_15;
    }
    id v21 = v12;
    if (a2 == 1)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    }
    else if (a2 == 2)
    {
      id v14 = [[EDPETQuotaReachedEvent alloc] initWithData:v12];
      [*(id *)(a1 + 32) setQuotaEvent:v14];

LABEL_13:
      *a6 = 1;
LABEL_14:
      id v12 = v21;
      goto LABEL_15;
    }
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 48) = a4;
    *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 56) = a5;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = compression_stream_process((compression_stream *)(*(void *)(*(void *)(a1 + 88) + 8)+ 32), 0);
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)) {
      goto LABEL_13;
    }
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) - *(void *)(a1 + 128);
    id v12 = v21;
    if (v15 != *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
    {
      v16 = *(void **)(a1 + 40);
      id v17 = (void *)MEMORY[0x1E4F60DF0];
      uint64_t v18 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
      v19 = [NSNumber numberWithUnsignedInteger:v15];
      v20 = [v17 pairWithFirst:v18 second:v19];
      [v16 addObject:v20];

      *(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = v15;
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 48) _estimateStopCount:*(void *)(a1 + 40)];
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (id)batchedEventsForSubmission
{
  id v3 = objc_alloc_init(EDPETBatchedWrapper);
  id v4 = [(EDPETInteractionEventLog *)self workQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __54__EDPETInteractionEventLog_batchedEventsForSubmission__block_invoke;
  int v13 = &unk_1E6BFFAF0;
  id v14 = self;
  id v5 = v3;
  uint64_t v15 = v5;
  dispatch_sync(v4, &v10);

  if ([(EDPETBatchedWrapper *)v5 hasRawData])
  {
    double v6 = objc_alloc_init(EDPETSubmittedEvent);
    id v7 = [MEMORY[0x1E4F1C9C8] now];
    [(EDPETSubmittedEvent *)v6 setTimestamp:[(EDPETInteractionEventLog *)self _truncatedUNIXTimestampFromDate:v7]];

    [(EDPETSubmittedEvent *)v6 setTimezoneOffset:[(EDPETInteractionEventLog *)self _timezoneOffset]];
    [(EDPETBatchedWrapper *)v5 setSubmittedEvent:v6];
    long long v8 = v5;
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

void __54__EDPETInteractionEventLog_batchedEventsForSubmission__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) logFileHandle];
  uint64_t v2 = [v4 offsetInFile];

  if (v2)
  {
    id v5 = [*(id *)(a1 + 32) logFileHandle];
    [v5 synchronizeFile];

    [*(id *)(a1 + 32) _compressFramedMessagesIntoBatch:*(void *)(a1 + 40)];
    id v3 = *(void **)(a1 + 32);
    id v6 = [*(id *)(a1 + 40) rawData];
    objc_msgSend(v3, "_rotateLogWithCompressedData:");
  }
}

- (BOOL)_isLogQuotaReached
{
  uint64_t v2 = [(EDPETInteractionEventLog *)self logFileHandle];
  BOOL v3 = (unint64_t)[v2 offsetInFile] >> 13 > 0x20C;

  return v3;
}

- (void)waitForPendingWrites
{
  BOOL v3 = [(EDPETInteractionEventLog *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__EDPETInteractionEventLog_waitForPendingWrites__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  block[4] = self;
  dispatch_sync(v3, block);
}

void __48__EDPETInteractionEventLog_waitForPendingWrites__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) logFileHandle];
  [v1 synchronizeFile];
}

- (int)_eventNameFromString:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  unsigned __int8 v7 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  if ((v7 & 1) == 0)
  {
    int v8 = 0;
    goto LABEL_51;
  }
  id v9 = [v5 uppercaseString];
  if ([v9 isEqualToString:@"INVALID"]) {
    goto LABEL_4;
  }
  if ([v9 isEqualToString:@"MESSAGE_FETCHED"])
  {
    uint64_t v10 = 1;
  }
  else if ([v9 isEqualToString:@"MESSAGE_SENT"])
  {
    uint64_t v10 = 2;
  }
  else if ([v9 isEqualToString:@"MESSAGE_LIST_DISPLAY_STARTED"])
  {
    uint64_t v10 = 3;
  }
  else if ([v9 isEqualToString:@"MESSAGE_LIST_DISPLAY_ENDED"])
  {
    uint64_t v10 = 4;
  }
  else if ([v9 isEqualToString:@"MESSAGE_MOVED"])
  {
    uint64_t v10 = 5;
  }
  else if ([v9 isEqualToString:@"MESSAGE_COPIED"])
  {
    uint64_t v10 = 6;
  }
  else if ([v9 isEqualToString:@"LINK_CLICKED"])
  {
    uint64_t v10 = 7;
  }
  else if ([v9 isEqualToString:@"APP_LAUNCH"])
  {
    uint64_t v10 = 8;
  }
  else if ([v9 isEqualToString:@"APP_BACKGROUND"])
  {
    uint64_t v10 = 9;
  }
  else if ([v9 isEqualToString:@"APP_RESUME"])
  {
    uint64_t v10 = 10;
  }
  else if ([v9 isEqualToString:@"FLAG_CHANGED"])
  {
    uint64_t v10 = 11;
  }
  else if ([v9 isEqualToString:@"READ_CHANGED"])
  {
    uint64_t v10 = 12;
  }
  else if ([v9 isEqualToString:@"MESSAGE_VIEW_START"])
  {
    uint64_t v10 = 13;
  }
  else if ([v9 isEqualToString:@"MESSAGE_VIEW_END"])
  {
    uint64_t v10 = 14;
  }
  else if ([v9 isEqualToString:@"REPLY_DRAFT_STARTED"])
  {
    uint64_t v10 = 15;
  }
  else if ([v9 isEqualToString:@"FORWARD_DRAFT_STARTED"])
  {
    uint64_t v10 = 16;
  }
  else if ([v9 isEqualToString:@"REPLY_SENT"])
  {
    uint64_t v10 = 17;
  }
  else if ([v9 isEqualToString:@"FORWARD_SENT"])
  {
    uint64_t v10 = 18;
  }
  else if ([v9 isEqualToString:@"MARKED_MUTE_THREAD"])
  {
    uint64_t v10 = 19;
  }
  else if ([v9 isEqualToString:@"CATEGORY_MARKED"])
  {
    uint64_t v10 = 20;
  }
  else
  {
    if (![v9 isEqualToString:@"CATEGORY_INFERRED"])
    {
LABEL_4:

      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"EDPETInteractionEventLog.m", 573, @"Can't map eventName string to enum: %@", v6 object file lineNumber description];
      uint64_t v10 = 0;
      goto LABEL_48;
    }
    uint64_t v10 = 21;
  }

LABEL_48:
  uint64_t v11 = [NSNumber numberWithInt:v10];
  int v12 = [&unk_1F35BB4E0 containsObject:v11];

  if (v12) {
    int v8 = 0;
  }
  else {
    int v8 = v10;
  }
LABEL_51:

  return v8;
}

- (unint64_t)_truncatedUNIXTimestampFromDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return (unint64_t)(round(v3 / 60.0) * 60.0);
}

- (int)_timezoneOffset
{
  uint64_t v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  uint64_t v3 = [v2 secondsFromGMT];

  return llround((double)v3 / 60.0 / 60.0);
}

- (id)_eventForName:(int)a3 date:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v7 = a4;
  int v8 = objc_alloc_init(EDPBInteractionEvent);
  atomic_fetch_add((atomic_uint *volatile)&self->_sequenceNumber, 1u);
  -[EDPBInteractionEvent setSequenceNumber:](v8, "setSequenceNumber:");
  [(EDPBInteractionEvent *)v8 setTimestamp:[(EDPETInteractionEventLog *)self _truncatedUNIXTimestampFromDate:v7]];
  [(EDPBInteractionEvent *)v8 setEventName:v4];
  switch((int)v4)
  {
    case 0:
    case 1:
    case 3:
    case 4:
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"EDPETInteractionEventLog.m", 612, @"INVALID event, we should not have reached this point" object file lineNumber description];

      uint64_t v10 = 0;
      goto LABEL_23;
    case 2:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventMessageSent);
      [(EDPBInteractionEvent *)v8 setMessageSent:v11];
      goto LABEL_21;
    case 5:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventMessageMoved);
      [(EDPBInteractionEvent *)v8 setMessageMoved:v11];
      goto LABEL_21;
    case 6:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventMessageCopied);
      [(EDPBInteractionEvent *)v8 setMessageCopied:v11];
      goto LABEL_21;
    case 7:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventLinkClicked);
      [(EDPBInteractionEvent *)v8 setLinkClicked:v11];
      goto LABEL_21;
    case 8:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventAppLaunch);
      [(EDPBInteractionEvent *)v8 setAppLaunch:v11];
      goto LABEL_21;
    case 9:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventAppBackground);
      [(EDPBInteractionEvent *)v8 setAppBackground:v11];
      goto LABEL_21;
    case 10:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventAppResume);
      [(EDPBInteractionEvent *)v8 setAppResume:v11];
      goto LABEL_21;
    case 11:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventFlagChanged);
      [(EDPBInteractionEvent *)v8 setFlagChanged:v11];
      goto LABEL_21;
    case 12:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventReadChanged);
      [(EDPBInteractionEvent *)v8 setReadChanged:v11];
      goto LABEL_21;
    case 13:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventMessageViewStart);
      [(EDPBInteractionEvent *)v8 setMessageViewStart:v11];
      goto LABEL_21;
    case 14:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventMessageViewEnd);
      [(EDPBInteractionEvent *)v8 setMessageViewEnd:v11];
      goto LABEL_21;
    case 15:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventReplyDraftStarted);
      [(EDPBInteractionEvent *)v8 setReplyDraftStarted:v11];
      goto LABEL_21;
    case 16:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventForwardDraftStarted);
      [(EDPBInteractionEvent *)v8 setForwardDraftStarted:v11];
      goto LABEL_21;
    case 17:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventReplySent);
      [(EDPBInteractionEvent *)v8 setReplySent:v11];
      goto LABEL_21;
    case 18:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventForwardSent);
      [(EDPBInteractionEvent *)v8 setForwardSent:v11];
      goto LABEL_21;
    case 19:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventMarkedMuteThread);
      [(EDPBInteractionEvent *)v8 setMarkedMuteThread:v11];
      goto LABEL_21;
    case 20:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventCategoryMarked);
      [(EDPBInteractionEvent *)v8 setCategoryMarked:v11];
      goto LABEL_21;
    case 21:
      uint64_t v11 = objc_alloc_init(EDPBInteractionEventCategoryInferred);
      [(EDPBInteractionEvent *)v8 setCategoryInferred:v11];
LABEL_21:

      break;
    default:
      break;
  }
  uint64_t v10 = v8;
LABEL_23:

  return v10;
}

- (int64_t)_truncatedSHA256:(id)a3
{
  return [(SGMailIntelligenceStringHasher *)self->_stringHasher truncatedSHA256:a3];
}

- (id)_currentLocaleIdentifier
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v3 = [v2 localeIdentifier];

  if ([v3 length]) {
    goto LABEL_4;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CA20] systemLocale];
  id v5 = [v4 localeIdentifier];

  if ([v5 length])
  {
    uint64_t v3 = v5;
LABEL_4:
    id v6 = v3;
    id v5 = v6;
    goto LABEL_5;
  }
  id v6 = &stru_1F3583658;
LABEL_5:

  return v6;
}

- (int64_t)hashedString:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 dataUsingEncoding:4];
    int64_t v7 = [(EDPETInteractionEventLog *)self _truncatedSHA256:v6];
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (int64_t)hashedContactIDForAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(EDPETInteractionEventLog *)self contactIDCache];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  int v12 = __54__EDPETInteractionEventLog_hashedContactIDForAddress___block_invoke;
  int v13 = &unk_1E6C045C0;
  id v14 = self;
  id v6 = v4;
  id v15 = v6;
  int64_t v7 = [v5 objectForKey:v6 generator:&v10];
  int64_t v8 = objc_msgSend(v7, "longLongValue", v10, v11, v12, v13, v14);

  return v8;
}

id __54__EDPETInteractionEventLog_hashedContactIDForAddress___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) contactStore];
  uint64_t v3 = *(void *)(a1 + 40);
  v15[0] = *MEMORY[0x1E4F1AE08];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v5 = objc_msgSend(v2, "em_fetchContactForEmailAddress:keysToFetch:createIfNeeded:", v3, v4, 0);

  id v6 = [v5 identifier];
  if (!v6) {
    goto LABEL_3;
  }
  int64_t v7 = [v5 identifier];
  int64_t v8 = [*(id *)(a1 + 32) meContactIdentifier];
  char v9 = [v7 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = NSNumber;
    int v12 = *(void **)(a1 + 32);
    int v13 = [v5 identifier];
    uint64_t v10 = objc_msgSend(v11, "numberWithLongLong:", objc_msgSend(v12, "hashedString:", v13));
  }
  else
  {
LABEL_3:
    uint64_t v10 = &unk_1F35BAE98;
  }

  return v10;
}

- ($40EAC33F1F794FC3221B301F61335479)hashedSubject:(SEL)a3
{
  id v6 = a4;
  retstr->var1 = 0;
  retstr->var2 = 0;
  retstr->var0 = 0;
  int64_t v7 = [v6 subjectWithoutPrefix];
  int64_t v8 = +[EDSubjectTokenizer tokenizeString:v7];

  if ([v8 count])
  {
    retstr->var0 = (int64_t *)malloc_type_calloc([v8 count], 8uLL, 0x100004000313F17uLL);
    retstr->var1 = [v8 count];
    unint64_t v9 = [v8 count];
    retstr->var2 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__EDPETInteractionEventLog_hashedSubject___block_invoke;
    v11[3] = &unk_1E6C045E8;
    unint64_t v13 = v9;
    long long v12 = *(_OWORD *)&retstr->var0;
    v11[4] = self;
    [v8 enumerateObjectsUsingBlock:v11];
  }

  return result;
}

void __42__EDPETInteractionEventLog_hashedSubject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(void *)(*(void *)(a1 + 40) + 8 * a3) = objc_msgSend(*(id *)(a1 + 32), "hashedString:");
}

- (int64_t)hashedAccountID:(id)a3
{
  id v4 = [a3 emailAddressStrings];
  id v5 = [v4 firstObject];
  int64_t v6 = [(EDPETInteractionEventLog *)self hashedString:v5];

  return v6;
}

- (int64_t)hashedMailboxID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    int64_t v6 = [v4 URL];
    int64_t v7 = [v6 absoluteString];
    int64_t v8 = [(EDPETInteractionEventLog *)self hashedString:v7];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (int64_t)hashedConversationID:(int64_t)a3
{
  int64_t v3 = a3;
  int64_t v7 = a3;
  if ((unint64_t)(a3 + 1) >= 2)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:&v7 length:8];
    int64_t v3 = [(EDPETInteractionEventLog *)self _truncatedSHA256:v5];
  }
  return v3;
}

- (id)hashedMessageHeadersForMessage:(id)a3
{
  v87[3] = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  uint64_t v62 = objc_alloc_init(EDPBMessageHeaders);
  id v4 = [(EDPETInteractionEventLog *)self profileProvider];
  id v5 = [v4 allEmailAddresses];
  uint64_t v60 = objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_56);

  int64_t v6 = [v56 senders];
  int64_t v7 = [v6 firstObject];
  int64_t v8 = [v7 emailAddressValue];

  v54 = v8;
  unint64_t v9 = [v8 simpleAddress];
  uint64_t v10 = [v9 lowercaseString];

  uint64_t v55 = (void *)v10;
  [(EDPBMessageHeaders *)v62 setSender:[(EDPETInteractionEventLog *)self hashedString:v10]];
  uint64_t v11 = [v54 domain];
  long long v12 = [v11 lowercaseString];
  [(EDPBMessageHeaders *)v62 setSenderDomain:[(EDPETInteractionEventLog *)self hashedString:v12]];

  unint64_t v13 = [(EDPETInteractionEventLog *)self vipManager];
  -[EDPBMessageHeaders setSenderIsVip:](v62, "setSenderIsVip:", [v13 isVIPAddress:v10]);

  [(EDPBMessageHeaders *)v62 setSenderContactId:[(EDPETInteractionEventLog *)self hashedContactIDForAddress:v10]];
  memset(v84, 170, sizeof(v84));
  id v14 = [v56 subject];
  [(EDPETInteractionEventLog *)self hashedSubject:v14];

  [(EDPBMessageHeaders *)v62 setSubjectWords:v84[0] count:v84[1]];
  if (v84[0])
  {
    free(v84[0]);
    v84[0] = 0;
  }
  id v15 = [v56 subject];
  v16 = [v15 prefix];
  -[EDPBMessageHeaders setMessageIsForwarded:](v62, "setMessageIsForwarded:", [v16 isEqualToString:@"Fwd: "]);

  id v17 = [v56 subject];
  -[EDPBMessageHeaders setMessageIsReply:](v62, "setMessageIsReply:", [v17 hasReplyPrefix]);

  uint64_t v18 = [v56 dateReceived];
  [(EDPBMessageHeaders *)v62 setDateReceived:[(EDPETInteractionEventLog *)self _truncatedUNIXTimestampFromDate:v18]];

  v19 = [v56 listIDHash];

  if (v19)
  {
    v20 = [v56 listIDHash];
    id v21 = [v20 stringValue];
    [(EDPBMessageHeaders *)v62 setListId:[(EDPETInteractionEventLog *)self hashedString:v21]];
  }
  -[EDPBMessageHeaders setUserIsSender:](v62, "setUserIsSender:", [v60 containsObject:v10]);
  id v22 = (void *)MEMORY[0x1E4F60DF0];
  v23 = [v56 to];
  v24 = [v22 pairWithFirst:@"to" second:v23];
  v87[0] = v24;
  compression_status v25 = (void *)MEMORY[0x1E4F60DF0];
  v26 = [v56 cc];
  uint64_t v27 = [v25 pairWithFirst:@"cc" second:v26];
  v87[1] = v27;
  uint64_t v28 = (void *)MEMORY[0x1E4F60DF0];
  v29 = [v56 bcc];
  v30 = [v28 pairWithFirst:@"bcc" second:v29];
  v87[2] = v30;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:3];

  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v31;
  uint64_t v32 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
  if (v32)
  {
    uint64_t v58 = *(void *)v81;
    do
    {
      uint64_t v59 = v32;
      for (uint64_t i = 0; i != v59; ++i)
      {
        if (*(void *)v81 != v58) {
          objc_enumerationMutation(obj);
        }
        v34 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        v61 = [v34 first];
        v35 = [v34 second];
        v36 = objc_msgSend(v35, "ef_mapSelector:", sel_lowercaseString);

        uint64_t v77 = 0;
        uint64_t v78 = 0;
        uint64_t v79 = 0;
        uint64_t v74 = 0;
        uint64_t v75 = 0;
        uint64_t v76 = 0;
        uint64_t v71 = 0;
        uint64_t v72 = 0;
        uint64_t v73 = 0;
        uint64_t v68 = 0;
        uint64_t v69 = 0;
        uint64_t v70 = 0;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v37 = v36;
        uint64_t v38 = [v37 countByEnumeratingWithState:&v64 objects:v85 count:16];
        if (v38)
        {
          uint64_t v39 = *(void *)v65;
          do
          {
            for (uint64_t j = 0; j != v38; ++j)
            {
              if (*(void *)v65 != v39) {
                objc_enumerationMutation(v37);
              }
              v41 = [*(id *)(*((void *)&v64 + 1) + 8 * j) emailAddressValue];
              v42 = [v41 simpleAddress];
              v43 = [v42 lowercaseString];

              [(EDPETInteractionEventLog *)self hashedString:v43];
              PBRepeatedInt64Add();
              uint64_t v44 = [v41 domain];
              v45 = [v44 lowercaseString];
              [(EDPETInteractionEventLog *)self hashedString:v45];
              PBRepeatedInt64Add();

              uint64_t v46 = [(EDPETInteractionEventLog *)self vipManager];
              [v46 isVIPAddress:v43];
              PBRepeatedBOOLAdd();

              [(EDPETInteractionEventLog *)self hashedContactIDForAddress:v43];
              PBRepeatedInt64Add();
            }
            uint64_t v38 = [v37 countByEnumeratingWithState:&v64 objects:v85 count:16];
          }
          while (v38);
        }

        char v47 = [MEMORY[0x1E4F1CAD0] setWithArray:v37];
        uint64_t v48 = [v60 intersectsSet:v47];
        if ([v61 isEqualToString:@"to"])
        {
          [(EDPBMessageHeaders *)v62 setToAddress:v77 count:v78];
          [(EDPBMessageHeaders *)v62 setToDomains:v74 count:v75];
          [(EDPBMessageHeaders *)v62 setToIsVips:v71 count:v72];
          [(EDPBMessageHeaders *)v62 setToContactIds:v68 count:v69];
          [(EDPBMessageHeaders *)v62 setUserIsTo:v48];
        }
        else if ([v61 isEqualToString:@"cc"])
        {
          [(EDPBMessageHeaders *)v62 setCcAddress:v77 count:v78];
          [(EDPBMessageHeaders *)v62 setCcDomains:v74 count:v75];
          [(EDPBMessageHeaders *)v62 setCcIsVips:v71 count:v72];
          [(EDPBMessageHeaders *)v62 setCcContactIds:v68 count:v69];
          [(EDPBMessageHeaders *)v62 setUserIsCc:v48];
        }
        else if ([v61 isEqualToString:@"bcc"])
        {
          [(EDPBMessageHeaders *)v62 setBccAddress:v77 count:v78];
          [(EDPBMessageHeaders *)v62 setBccDomains:v74 count:v75];
          [(EDPBMessageHeaders *)v62 setBccIsVips:v71 count:v72];
          [(EDPBMessageHeaders *)v62 setBccContactIds:v68 count:v69];
          [(EDPBMessageHeaders *)v62 setUserIsBcc:v48];
        }
        PBRepeatedInt64Clear();
        PBRepeatedInt64Clear();
        PBRepeatedBOOLClear();
        PBRepeatedInt64Clear();
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v80 objects:v86 count:16];
    }
    while (v32);
  }

  v49 = [v56 references];
  size_t v50 = [v49 count];

  v51 = malloc_type_calloc(v50, 8uLL, 0x100004000313F17uLL);
  bzero(v51, 8 * v50);
  v52 = [v56 references];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __59__EDPETInteractionEventLog_hashedMessageHeadersForMessage___block_invoke_2;
  v63[3] = &unk_1E6C04610;
  v63[4] = self;
  v63[5] = v51;
  [v52 enumerateObjectsUsingBlock:v63];

  [(EDPBMessageHeaders *)v62 setReferences:v51 count:v50];
  free(v51);

  return v62;
}

id __59__EDPETInteractionEventLog_hashedMessageHeadersForMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 lowercaseString];

  return v2;
}

void __59__EDPETInteractionEventLog_hashedMessageHeadersForMessage___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  int64_t v6 = *(void **)(a1 + 32);
  id v8 = v5;
  int64_t v7 = objc_msgSend(v5, "ec_messageIDSubstring");
  *(void *)(*(void *)(a1 + 40) + 8 * a3) = [v6 hashedString:v7];
}

- (id)_messageDataEventForMessage:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(EDPBMessageData);
  [(EDPBMessageData *)v8 withHasher:self setDataFromMessage:v6 account:v7];

  return v8;
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 data:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(EDPETInteractionEventLog *)self _eventNameFromString:v10];
  if (v14)
  {
    id v15 = [(EDPETInteractionEventLog *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke;
    block[3] = &unk_1E6C04638;
    block[4] = self;
    int v20 = v14;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(v15, block);
  }
}

void __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _eventForName:*(unsigned int *)(a1 + 64) date:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    [v2 withHasher:*(void *)(a1 + 32) setMessage:*(void *)(a1 + 48) data:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _writeMessageDataIfNecessary:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _writeEvent:v2];
  }
  else
  {
    int64_t v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)id v6 = 0xE00000001;
    int v7 = 1;
    pid_t v8 = getpid();
    size_t v4 = 648;
    if (!sysctl(v6, 4u, __b, &v4, 0, 0) && (__b[8] & 0x800) != 0) {
      __debugbreak();
    }
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 conversationID:(int64_t)a5 data:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  int v13 = [(EDPETInteractionEventLog *)self _eventNameFromString:v10];
  if (v13)
  {
    int v14 = [(EDPETInteractionEventLog *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke;
    block[3] = &unk_1E6C04660;
    block[4] = self;
    int v19 = v13;
    id v16 = v11;
    int64_t v18 = a5;
    id v17 = v12;
    dispatch_async(v14, block);
  }
}

void __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _eventForName:*(unsigned int *)(a1 + 64) date:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    [v2 withHasher:*(void *)(a1 + 32) setConversationID:*(void *)(a1 + 56) data:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _writeEvent:v2];
  }
  else
  {
    int64_t v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)id v6 = 0xE00000001;
    int v7 = 1;
    pid_t v8 = getpid();
    size_t v4 = 648;
    if (!sysctl(v6, 4u, __b, &v4, 0, 0) && (__b[8] & 0x800) != 0) {
      __debugbreak();
    }
  }
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(EDPETInteractionEventLog *)self _eventNameFromString:v6];
  if (v8)
  {
    uint64_t v9 = [(EDPETInteractionEventLog *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke;
    block[3] = &unk_1E6C04688;
    block[4] = self;
    int v12 = v8;
    id v11 = v7;
    dispatch_async(v9, block);
  }
}

void __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  size_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 _eventForName:v3 date:v4];

  if (objc_opt_respondsToSelector())
  {
    [v5 withHasher:*(void *)(a1 + 32) setDataFromMessage:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _writeEvent:v5];
  }
  else
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 48) >= 0x16u)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 48));
        objc_claimAutoreleasedReturnValue();
      }
      __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)uint64_t v9 = 0xE00000001;
    int v10 = 1;
    pid_t v11 = getpid();
    size_t v7 = 648;
    if (!sysctl(v9, 4u, __b, &v7, 0, 0) && (__b[8] & 0x800) != 0) {
      __debugbreak();
    }
  }
}

- (void)persistEvent:(id)a3 dataFromMessage:(id)a4 account:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(EDPETInteractionEventLog *)self _eventNameFromString:v8];
  if (v11)
  {
    uint64_t v12 = [(EDPETInteractionEventLog *)self workQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke;
    v13[3] = &unk_1E6C046B0;
    v13[4] = self;
    int v16 = v11;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(v12, v13);
  }
}

void __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  size_t v4 = [MEMORY[0x1E4F1C9C8] date];
  id v5 = [v2 _eventForName:v3 date:v4];

  if (objc_opt_respondsToSelector())
  {
    [v5 withHasher:*(void *)(a1 + 32) setDataFromMessage:*(void *)(a1 + 40) account:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _writeMessageDataIfNecessary:*(void *)(a1 + 40) account:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _writeEvent:v5];
  }
  else
  {
    id v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 56) >= 0x16u)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        objc_claimAutoreleasedReturnValue();
      }
      __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)id v9 = 0xE00000001;
    int v10 = 1;
    pid_t v11 = getpid();
    size_t v7 = 648;
    if (!sysctl(v9, 4u, __b, &v7, 0, 0) && (__b[8] & 0x800) != 0) {
      __debugbreak();
    }
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailbox:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  int v14 = [(EDPETInteractionEventLog *)self _eventNameFromString:v10];
  if (v14)
  {
    id v15 = [(EDPETInteractionEventLog *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke;
    block[3] = &unk_1E6C04638;
    block[4] = self;
    int v20 = v14;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(v15, block);
  }
}

void __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _eventForName:*(unsigned int *)(a1 + 64) date:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    [v2 withHasher:*(void *)(a1 + 32) setMessage:*(void *)(a1 + 48) mailbox:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _writeMessageDataIfNecessary:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _writeEvent:v2];
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke_cold_1();
    }

    memset(__b, 170, sizeof(__b));
    __b[8] = 0;
    *(void *)id v6 = 0xE00000001;
    int v7 = 1;
    pid_t v8 = getpid();
    size_t v4 = 648;
    if (!sysctl(v6, 4u, __b, &v4, 0, 0) && (__b[8] & 0x800) != 0) {
      __debugbreak();
    }
  }
}

- (void)persistEvent:(id)a3 date:(id)a4 message:(id)a5 mailboxType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [(EDPETInteractionEventLog *)self _eventNameFromString:v10];
  if (v13)
  {
    int v14 = [(EDPETInteractionEventLog *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke;
    block[3] = &unk_1E6C04660;
    block[4] = self;
    int v19 = v13;
    id v16 = v11;
    id v17 = v12;
    int64_t v18 = a6;
    dispatch_async(v14, block);
  }
}

void __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _eventForName:*(unsigned int *)(a1 + 64) date:*(void *)(a1 + 40)];
  if (objc_opt_respondsToSelector())
  {
    [v2 withHasher:*(void *)(a1 + 32) setMessage:*(void *)(a1 + 48) mailboxType:*(void *)(a1 + 56)];
    [*(id *)(a1 + 32) _writeMessageDataIfNecessary:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _writeEvent:v2];
  }
  else
  {
    uint64_t v3 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      if (*(_DWORD *)(a1 + 64) >= 0x16u)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 64));
        objc_claimAutoreleasedReturnValue();
      }
      __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke_cold_1();
    }
  }
}

- (NSURL)currentLogFile
{
  return self->_currentLogFile;
}

- (void)setCurrentLogFile:(id)a3
{
}

- (EMUserProfileProvider)profileProvider
{
  return self->_profileProvider;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (EFLazyCache)contactIDCache
{
  return self->_contactIDCache;
}

- (void)setMeContactIdentifier:(id)a3
{
}

- (NSData)rotatingSalt
{
  return self->_rotatingSalt;
}

- (void)setRotatingSalt:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unsigned)sequenceNumber
{
  return atomic_load(&self->_sequenceNumber);
}

- (void)setSequenceNumber:(unsigned int)a3
{
}

- (NSURL)directory
{
  return self->_directory;
}

- (NSFileHandle)logFileHandle
{
  return self->_logFileHandle;
}

- (void)setLogFileHandle:(id)a3
{
}

- (BOOL)shouldLog
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_shouldLog);
  return v2 & 1;
}

- (void)setShouldLog:(BOOL)a3
{
}

- (EFMutableInt64Set)currentLogMessageIDs
{
  return self->_currentLogMessageIDs;
}

- (void)setCurrentLogMessageIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLogMessageIDs, 0);
  objc_storeStrong((id *)&self->_logFileHandle, 0);
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_rotatingSalt, 0);
  objc_storeStrong((id *)&self->_meContactIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIDCache, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_profileProvider, 0);
  objc_storeStrong((id *)&self->_currentLogFile, 0);
  objc_storeStrong((id *)&self->_persistentBits, 0);

  objc_storeStrong((id *)&self->_stringHasher, 0);
}

- (void)persistentBits
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "No persistentBits found. Searching for legacy version.", v1, 2u);
}

- (void)_writeEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Reached quota, writing truncation marker", v2, v3, v4, v5, v6);
}

- (void)_writeEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

+ (void)enumerateFramesInData:(uint64_t)a1 block:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Checksum failure at offset %zu, bailing to read", (uint8_t *)&v2, 0xCu);
}

- (void)_compressFramedMessagesIntoBatch:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "_destroy failed", v2, v3, v4, v5, v6);
}

- (void)_compressFramedMessagesIntoBatch:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "No interaction events found, returning nil data", v2, v3, v4, v5, v6);
}

- (void)_compressFramedMessagesIntoBatch:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "_process(.FINALIZE) failed", v2, v3, v4, v5, v6);
}

- (void)_compressFramedMessagesIntoBatch:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "_process() failed", v2, v3, v4, v5, v6);
}

- (void)_compressFramedMessagesIntoBatch:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB39C000, v0, v1, "Error initializing compression", v2, v3, v4, v5, v6);
}

void __59__EDPETInteractionEventLog_persistEvent_date_message_data___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "%@ doesn't implement setMessage:data:", v5);
}

void __66__EDPETInteractionEventLog_persistEvent_date_conversationID_data___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "%@ doesn't implement setConversationID:data:", v5);
}

void __57__EDPETInteractionEventLog_persistEvent_dataFromMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "%@ doesn't implement setDataFromMessage:", v5);
}

void __65__EDPETInteractionEventLog_persistEvent_dataFromMessage_account___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "%@ doesn't implement setDataFromMessage:account:", v5);
}

void __62__EDPETInteractionEventLog_persistEvent_date_message_mailbox___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "%@ doesn't implement setMessage:mailbox:", v5);
}

void __66__EDPETInteractionEventLog_persistEvent_date_message_mailboxType___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_11(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_6(&dword_1DB39C000, v3, v4, "%@ doesn't implement setMessage:mailboxType:", v5);
}

@end