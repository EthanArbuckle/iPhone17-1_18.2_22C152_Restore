@interface SKGActivityJournal
+ (id)sharedJournal;
- (BOOL)deviceOnBattery;
- (BOOL)isInternalInstall;
- (BOOL)isVerboseEnabled;
- (BOOL)logBatteryState;
- (BOOL)verbose;
- (NSString)path;
- (SKGActivityJournal)initWithParentPath:(id)a3 fileName:(id)a4;
- (fd_obj)fd;
- (int)lastEventType;
- (os_unfair_lock_s)lock;
- (unint64_t)lastEventDataSize;
- (unsigned)repeatEventCount;
- (void)addEventForCSSearchableItems:(int)a3 items:(id)a4;
- (void)addEventForItem:(int)a3 bundleID:(id)a4 identifier:(id)a5;
- (void)addEventForItemWithNum:(int)a3 bundleID:(id)a4 identifier:(id)a5 num:(unint64_t)a6;
- (void)addEventForItemWithNum:(int)a3 num:(unint64_t)a4;
- (void)addEventWithTime:(int)a3;
- (void)addEventWithTime:(int)a3 data:(void *)a4 dataSize:(unsigned int)a5;
- (void)addProfilingEventWithType:(id)a3 outcome:(id)a4 duration:(unint64_t)a5 kind:(unint64_t)a6;
- (void)addPurgeJournalsEventForItemWithPath:(id)a3 size:(unint64_t)a4;
- (void)addVerboseEventForCSSearchableItems:(int)a3 items:(id)a4;
- (void)addVerboseEventForItem:(int)a3 bundleID:(id)a4 identifier:(id)a5;
- (void)addVerboseEventForItemWithString:(id)a3 identifier:(id)a4 str:(id)a5;
- (void)dealloc;
- (void)lastEventData;
- (void)setFd:(fd_obj *)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setLastEventData:(void *)a3;
- (void)setLastEventDataSize:(unint64_t)a3;
- (void)setLastEventType:(int)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLogBatteryState:(BOOL)a3;
- (void)setPath:(id)a3;
- (void)setRepeatEventCount:(unsigned int)a3;
- (void)setVerbose:(BOOL)a3;
- (void)writeDecorator:(unsigned int)a3 data:(void *)a4 dataSize:(unsigned int)a5;
- (void)writeEvent:(unsigned int)a3 data:(void *)a4 dataSize:(unsigned int)a5;
- (void)writeInit;
@end

@implementation SKGActivityJournal

+ (id)sharedJournal
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080920;
  block[3] = &unk_1000D9FB0;
  block[4] = a1;
  if (qword_1000F91E8 != -1) {
    dispatch_once(&qword_1000F91E8, block);
  }
  v2 = (void *)qword_1000F91F0;

  return v2;
}

- (SKGActivityJournal)initWithParentPath:(id)a3 fileName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = isAppleInternalInstall();
  self->_isInternalInstall = v8;
  if (v8)
  {
    v9 = +[NSFileManager defaultManager];
    unsigned __int8 v10 = [v9 fileExistsAtPath:v6];

    if ((v10 & 1) == 0)
    {
      v11 = +[NSFileManager defaultManager];
      id v30 = 0;
      unsigned __int8 v12 = [v11 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v30];
      id v13 = v30;

      if ((v12 & 1) == 0)
      {
        v14 = sub_10000BE40();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000A35BC((uint64_t)v13, (uint64_t)v6, v14);
        }
      }
    }
    id v15 = v6;
    open((const char *)[v15 fileSystemRepresentation], 0x100000);
    id v16 = v7;
    [v16 UTF8String];
    self->_fd = (fd_obj *)fd_create_protected();
    v17 = +[NSString stringWithFormat:@"%@/%@", v15, v16];
    path = self->_path;
    self->_path = v17;

    self->_lastEventData = malloc_type_calloc(0x200uLL, 1uLL, 0x100004077774924uLL);
    self->_lastEventDataSize = 0;
    *(void *)&self->_lastEventType = 0;
    id v19 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"SKGActivityJournal"];
    v20 = [v19 objectForKey:@"journalSize"];

    if (v20) {
      uint64_t v21 = (uint64_t)[v19 integerForKey:@"journalSize"];
    }
    else {
      uint64_t v21 = 52428800;
    }
    self->_verbose = 0;
    v22 = [v19 objectForKey:@"verbose"];

    if (v22) {
      self->_verbose = [v19 BOOLForKey:@"verbose"];
    }
    self->_logBatteryState = 0;
    v23 = [v19 objectForKey:@"logBatteryState"];

    if (v23) {
      self->_logBatteryState = [v19 BOOLForKey:@"logBatteryState"];
    }
    if (self->_fd)
    {
      self->_lock._os_unfair_lock_opaque = 0;
      if (v21)
      {
        uint64_t v24 = fd_lseek();
        if (v24 > v21)
        {
          unint64_t v25 = v24;
          v26 = sub_10000BE40();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
            sub_1000A3544(v25, v21, v26);
          }

          fd_zero_truncate();
          memset(v31, 0, sizeof(v31));
          if (v25 > 0x7F)
          {
            if (v25 >> 14)
            {
              if (v25 >> 21)
              {
                if (v25 >> 28)
                {
                  if (v25 >> 35)
                  {
                    if (v25 >> 42)
                    {
                      if (v25 >> 49)
                      {
                        if (HIBYTE(v25))
                        {
                          LOBYTE(v31[0]) = -1;
                          *(void *)((char *)v31 + 1) = v25;
                          uint64_t v27 = 9;
                        }
                        else
                        {
                          LOBYTE(v31[0]) = -2;
                          BYTE1(v31[0]) = BYTE6(v25);
                          BYTE2(v31[0]) = BYTE5(v25);
                          BYTE3(v31[0]) = BYTE4(v25);
                          BYTE4(v31[0]) = BYTE3(v25);
                          BYTE5(v31[0]) = BYTE2(v25);
                          BYTE6(v31[0]) = BYTE1(v25);
                          uint64_t v27 = 8;
                          BYTE7(v31[0]) = v25;
                        }
                      }
                      else
                      {
                        LOBYTE(v31[0]) = BYTE6(v25) | 0xFC;
                        BYTE1(v31[0]) = BYTE5(v25);
                        BYTE2(v31[0]) = BYTE4(v25);
                        BYTE3(v31[0]) = BYTE3(v25);
                        BYTE4(v31[0]) = BYTE2(v25);
                        BYTE5(v31[0]) = BYTE1(v25);
                        uint64_t v27 = 7;
                        BYTE6(v31[0]) = v25;
                      }
                    }
                    else
                    {
                      LOBYTE(v31[0]) = BYTE5(v25) | 0xF8;
                      BYTE1(v31[0]) = BYTE4(v25);
                      BYTE2(v31[0]) = BYTE3(v25);
                      BYTE3(v31[0]) = BYTE2(v25);
                      BYTE4(v31[0]) = BYTE1(v25);
                      BYTE5(v31[0]) = v25;
                      uint64_t v27 = 6;
                    }
                  }
                  else
                  {
                    LOBYTE(v31[0]) = BYTE4(v25) | 0xF0;
                    BYTE1(v31[0]) = BYTE3(v25);
                    BYTE2(v31[0]) = BYTE2(v25);
                    BYTE3(v31[0]) = BYTE1(v25);
                    BYTE4(v31[0]) = v25;
                    uint64_t v27 = 5;
                  }
                }
                else
                {
                  LOBYTE(v31[0]) = BYTE3(v25) | 0xE0;
                  BYTE1(v31[0]) = BYTE2(v25);
                  BYTE2(v31[0]) = BYTE1(v25);
                  BYTE3(v31[0]) = v25;
                  uint64_t v27 = 4;
                }
              }
              else
              {
                LOBYTE(v31[0]) = BYTE2(v25) | 0xC0;
                BYTE1(v31[0]) = BYTE1(v25);
                BYTE2(v31[0]) = v25;
                uint64_t v27 = 3;
              }
            }
            else
            {
              LOBYTE(v31[0]) = BYTE1(v25) | 0x80;
              BYTE1(v31[0]) = v25;
              uint64_t v27 = 2;
            }
          }
          else
          {
            LOBYTE(v31[0]) = v25;
            uint64_t v27 = 1;
          }
          *(unsigned char *)((unint64_t)v31 | v27) = 0;
          [(SKGActivityJournal *)self addEventWithTime:2 data:v31 dataSize:(v27 + 1)];
        }
      }
    }
    else
    {
      v28 = sub_10000BE40();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        sub_1000A3480(v15, (uint64_t)v16, v28);
      }
    }
    [(SKGActivityJournal *)self writeInit];
  }
  return self;
}

- (void)dealloc
{
  fd = self->_fd;
  self->_fd = 0;
  if (fd) {
    fd_release();
  }
  v4.receiver = self;
  v4.super_class = (Class)SKGActivityJournal;
  [(SKGActivityJournal *)&v4 dealloc];
}

- (BOOL)isVerboseEnabled
{
  return self->_verbose;
}

- (BOOL)deviceOnBattery
{
  if (!self->_logBatteryState) {
    return 0;
  }
  v2 = +[CSDeviceListener sharedListener];
  unsigned __int8 v3 = [v2 onBattery];

  return v3;
}

- (void)writeInit
{
  if (self->_fd)
  {
    long long v41 = 0u;
    memset(v42, 0, sizeof(v42));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    long long v27 = 0u;
    long long v26 = 0u;
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    long long v22 = 0u;
    long long v21 = 0u;
    long long v20 = 0u;
    long long v19 = 0u;
    long long v18 = 0u;
    long long v17 = 0u;
    long long v16 = 0u;
    long long v15 = 0u;
    long long v14 = 0u;
    long long v13 = 0u;
    long long v12 = 0u;
    char v11 = 3;
    unsigned int v3 = getpid();
    if (v3 > 0x7F)
    {
      if (v3 >> 14)
      {
        if (v3 >> 21)
        {
          if (v3 >> 28)
          {
            LOBYTE(v12) = -16;
            *(_DWORD *)((char *)&v12 + 1) = v3;
            uint64_t v4 = 6;
          }
          else
          {
            LOBYTE(v12) = HIBYTE(v3) | 0xE0;
            BYTE1(v12) = BYTE2(v3);
            BYTE2(v12) = BYTE1(v3);
            BYTE3(v12) = v3;
            uint64_t v4 = 5;
          }
        }
        else
        {
          LOBYTE(v12) = BYTE2(v3) | 0xC0;
          BYTE1(v12) = BYTE1(v3);
          BYTE2(v12) = v3;
          uint64_t v4 = 4;
        }
      }
      else
      {
        LOBYTE(v12) = BYTE1(v3) | 0x80;
        BYTE1(v12) = v3;
        uint64_t v4 = 3;
      }
    }
    else
    {
      LOBYTE(v12) = v3;
      uint64_t v4 = 2;
    }
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = sub_100080E90((uint64_t)&v11, v4, (unint64_t)Current);
    id v7 = &v11 + v6;
    *(&v11 + v6) = 0;
    CFDictionaryRef v8 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v8)
    {
      CFDictionaryRef v9 = v8;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v8, _kCFSystemVersionBuildVersionKey);
      if (Value)
      {
        if (!CFStringGetCString(Value, v7, 512 - v6, 0x8000100u)) {
          *id v7 = 0;
        }
      }
      CFRelease(v9);
    }
    strlen(v7);
    os_unfair_lock_lock(&self->_lock);
    fd_write();
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)writeDecorator:(unsigned int)a3 data:(void *)a4 dataSize:(unsigned int)a5
{
  if (self->_fd)
  {
    memset(v9, 0, sizeof(v9));
    if (a5 <= 0x1FB)
    {
      unsigned int v6 = (2 * a3) | 1;
      if (v6 > 0x7F)
      {
        unsigned int v8 = 2 * a3;
        if (v6 >> 14)
        {
          if (v6 >> 21)
          {
            if (v6 >> 28)
            {
              LOBYTE(v9[0]) = -16;
              *(_DWORD *)((char *)v9 + 1) = (2 * a3) | 1;
              uint64_t v7 = 5;
            }
            else
            {
              LOBYTE(v9[0]) = HIBYTE(v8) | 0xE0;
              BYTE1(v9[0]) = a3 >> 15;
              BYTE2(v9[0]) = (unsigned __int16)a3 >> 7;
              BYTE3(v9[0]) = (2 * a3) | 1;
              uint64_t v7 = 4;
            }
          }
          else
          {
            LOBYTE(v9[0]) = BYTE2(v8) | 0xC0;
            BYTE1(v9[0]) = (unsigned __int16)a3 >> 7;
            BYTE2(v9[0]) = (2 * a3) | 1;
            uint64_t v7 = 3;
          }
        }
        else
        {
          LOBYTE(v9[0]) = BYTE1(v8) | 0x80;
          BYTE1(v9[0]) = (2 * a3) | 1;
          uint64_t v7 = 2;
        }
      }
      else
      {
        LOBYTE(v9[0]) = (2 * a3) | 1;
        uint64_t v7 = 1;
      }
      if (a5) {
        memcpy((void *)((unint64_t)v9 | v7), a4, a5);
      }
      os_unfair_lock_lock(&self->_lock);
      fd_write();
      os_unfair_lock_unlock(&self->_lock);
    }
  }
}

- (void)writeEvent:(unsigned int)a3 data:(void *)a4 dataSize:(unsigned int)a5
{
  if (self->_fd)
  {
    memset(v13, 0, sizeof(v13));
    if (a5 <= 0x1FB)
    {
      size_t v7 = a5;
      if (self->_verbose || a3 <= 0x2D && ((1 << a3) & 0x380000240000) != 0)
      {
        unsigned int v8 = (2 * a3) | 1;
        if (!a5) {
          goto LABEL_9;
        }
      }
      else
      {
        unsigned int v8 = 2 * a3;
        if (!a5) {
          goto LABEL_9;
        }
      }
      if (self->_lastEventDataSize == a5 && !memcmp(a4, self->_lastEventData, a5))
      {
        unsigned int repeatEventCount = self->_repeatEventCount;
        if (v8 == self->_lastEventType)
        {
          self->_unsigned int repeatEventCount = repeatEventCount + 1;
          return;
        }
        if (!repeatEventCount)
        {
          v8 |= 0x80000000;
          LOBYTE(v13[0]) = -16;
          *(_DWORD *)((char *)v13 + 1) = v8;
LABEL_36:
          self->_lastEventType = v8;
          os_unfair_lock_lock(&self->_lock);
          fd_write();
          os_unfair_lock_unlock(&self->_lock);
          if ([(SKGActivityJournal *)self deviceOnBattery]) {
            [(SKGActivityJournal *)self writeDecorator:50 data:0 dataSize:0];
          }
          return;
        }
        goto LABEL_10;
      }
LABEL_9:
      unsigned int repeatEventCount = self->_repeatEventCount;
      if (!repeatEventCount)
      {
LABEL_26:
        memcpy(self->_lastEventData, a4, v7);
        self->_lastEventDataSize = v7;
        if (v8 > 0x7F)
        {
          if (v8 >> 14)
          {
            if (v8 >> 21)
            {
              if (v8 >> 28)
              {
                LOBYTE(v13[0]) = -16;
                *(_DWORD *)((char *)v13 + 1) = v8;
                uint64_t v11 = 5;
              }
              else
              {
                LOBYTE(v13[0]) = HIBYTE(v8) | 0xE0;
                BYTE1(v13[0]) = BYTE2(v8);
                BYTE2(v13[0]) = BYTE1(v8);
                BYTE3(v13[0]) = v8;
                uint64_t v11 = 4;
              }
            }
            else
            {
              LOBYTE(v13[0]) = BYTE2(v8) | 0xC0;
              BYTE1(v13[0]) = BYTE1(v8);
              BYTE2(v13[0]) = v8;
              uint64_t v11 = 3;
            }
          }
          else
          {
            LOBYTE(v13[0]) = BYTE1(v8) | 0x80;
            BYTE1(v13[0]) = v8;
            uint64_t v11 = 2;
          }
        }
        else
        {
          LOBYTE(v13[0]) = v8;
          uint64_t v11 = 1;
        }
        memcpy((void *)((unint64_t)v13 | v11), a4, v7);
        goto LABEL_36;
      }
LABEL_10:
      uint64_t v12 = 0;
      if (repeatEventCount > 0x7F)
      {
        if (repeatEventCount >> 14)
        {
          if (repeatEventCount >> 21)
          {
            if (repeatEventCount >> 28)
            {
              LOBYTE(v12) = -16;
              *(_DWORD *)((char *)&v12 + 1) = repeatEventCount;
              uint64_t v10 = 5;
            }
            else
            {
              LOBYTE(v12) = HIBYTE(repeatEventCount) | 0xE0;
              BYTE1(v12) = BYTE2(repeatEventCount);
              BYTE2(v12) = BYTE1(repeatEventCount);
              BYTE3(v12) = repeatEventCount;
              uint64_t v10 = 4;
            }
          }
          else
          {
            LOBYTE(v12) = BYTE2(repeatEventCount) | 0xC0;
            BYTE1(v12) = BYTE1(repeatEventCount);
            BYTE2(v12) = repeatEventCount;
            uint64_t v10 = 3;
          }
        }
        else
        {
          LOBYTE(v12) = BYTE1(repeatEventCount) | 0x80;
          BYTE1(v12) = repeatEventCount;
          uint64_t v10 = 2;
        }
      }
      else
      {
        LOBYTE(v12) = repeatEventCount;
        uint64_t v10 = 1;
      }
      [(SKGActivityJournal *)self writeDecorator:17 data:&v12 dataSize:v10];
      self->_unsigned int repeatEventCount = 0;
      goto LABEL_26;
    }
  }
}

- (void)addEventForItemWithNum:(int)a3 bundleID:(id)a4 identifier:(id)a5 num:(unint64_t)a6
{
  unsigned int v6 = a6;
  [(SKGActivityJournal *)self addEventForItem:*(void *)&a3 bundleID:a4 identifier:a5];
  v9[0] = 0;
  v9[1] = 0;
  if (v6 > 0x7F)
  {
    if (v6 >> 14)
    {
      if (v6 >> 21)
      {
        if (v6 >> 28)
        {
          LOBYTE(v9[0]) = -16;
          *(_DWORD *)((char *)v9 + 1) = v6;
          uint64_t v8 = 5;
        }
        else
        {
          LOBYTE(v9[0]) = HIBYTE(v6) | 0xE0;
          BYTE1(v9[0]) = BYTE2(v6);
          BYTE2(v9[0]) = BYTE1(v6);
          BYTE3(v9[0]) = v6;
          uint64_t v8 = 4;
        }
      }
      else
      {
        LOBYTE(v9[0]) = BYTE2(v6) | 0xC0;
        BYTE1(v9[0]) = BYTE1(v6);
        BYTE2(v9[0]) = v6;
        uint64_t v8 = 3;
      }
    }
    else
    {
      LOBYTE(v9[0]) = BYTE1(v6) | 0x80;
      BYTE1(v9[0]) = v6;
      uint64_t v8 = 2;
    }
  }
  else
  {
    LOBYTE(v9[0]) = v6;
    uint64_t v8 = 1;
  }
  [(SKGActivityJournal *)self writeDecorator:51 data:v9 dataSize:v8];
}

- (void)addEventForItemWithNum:(int)a3 num:(unint64_t)a4
{
}

- (void)addEventForItem:(int)a3 bundleID:(id)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (self->_isInternalInstall && v8 != 0 && v9 != 0)
  {
    unsigned int v17 = 0;
    memset(v18, 0, sizeof(v18));
    if (self->_verbose || (uint64_t v13 = 0, v6 <= 0x2D) && ((1 << v6) & 0x380000240000) != 0)
    {
      sub_100081B24((const char *)[v8 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), (uint64_t)v18, &v17);
      uint64_t v13 = v17;
    }
    id v14 = v10;
    [v14 UTF8String];
    strlen((const char *)[v14 UTF8String]);
    id v15 = v8;
    [v15 UTF8String];
    strlen((const char *)[v15 UTF8String]);
    unint64_t v16 = si_compute_oid_for_identifier_bundle_id();
    [(SKGActivityJournal *)self writeEvent:v6 data:v18 dataSize:sub_100080E90((uint64_t)v18, v13, v16)];
  }
}

- (void)addProfilingEventWithType:(id)a3 outcome:(id)a4 duration:(unint64_t)a5 kind:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = v11;
  if (self->_isInternalInstall && v10 != 0 && v11 != 0)
  {
    memset(v17, 0, sizeof(v17));
    if (a6 > 0x7F)
    {
      if (a6 >> 14)
      {
        if (a6 >> 21)
        {
          if (a6 >> 28)
          {
            if (a6 >> 35)
            {
              if (a6 >> 42)
              {
                if (a6 >> 49)
                {
                  if (HIBYTE(a6))
                  {
                    LOBYTE(v17[0]) = -1;
                    *(void *)((char *)v17 + 1) = a6;
                    uint64_t v15 = 9;
                  }
                  else
                  {
                    LOBYTE(v17[0]) = -2;
                    BYTE1(v17[0]) = BYTE6(a6);
                    BYTE2(v17[0]) = BYTE5(a6);
                    BYTE3(v17[0]) = BYTE4(a6);
                    BYTE4(v17[0]) = BYTE3(a6);
                    BYTE5(v17[0]) = BYTE2(a6);
                    BYTE6(v17[0]) = BYTE1(a6);
                    uint64_t v15 = 8;
                    BYTE7(v17[0]) = a6;
                  }
                }
                else
                {
                  LOBYTE(v17[0]) = BYTE6(a6) | 0xFC;
                  BYTE1(v17[0]) = BYTE5(a6);
                  BYTE2(v17[0]) = BYTE4(a6);
                  BYTE3(v17[0]) = BYTE3(a6);
                  BYTE4(v17[0]) = BYTE2(a6);
                  BYTE5(v17[0]) = BYTE1(a6);
                  uint64_t v15 = 7;
                  BYTE6(v17[0]) = a6;
                }
              }
              else
              {
                LOBYTE(v17[0]) = BYTE5(a6) | 0xF8;
                BYTE1(v17[0]) = BYTE4(a6);
                BYTE2(v17[0]) = BYTE3(a6);
                BYTE3(v17[0]) = BYTE2(a6);
                BYTE4(v17[0]) = BYTE1(a6);
                BYTE5(v17[0]) = a6;
                uint64_t v15 = 6;
              }
            }
            else
            {
              LOBYTE(v17[0]) = BYTE4(a6) | 0xF0;
              BYTE1(v17[0]) = BYTE3(a6);
              BYTE2(v17[0]) = BYTE2(a6);
              BYTE3(v17[0]) = BYTE1(a6);
              BYTE4(v17[0]) = a6;
              uint64_t v15 = 5;
            }
          }
          else
          {
            LOBYTE(v17[0]) = BYTE3(a6) | 0xE0;
            BYTE1(v17[0]) = BYTE2(a6);
            BYTE2(v17[0]) = BYTE1(a6);
            BYTE3(v17[0]) = a6;
            uint64_t v15 = 4;
          }
        }
        else
        {
          LOBYTE(v17[0]) = BYTE2(a6) | 0xC0;
          BYTE1(v17[0]) = BYTE1(a6);
          BYTE2(v17[0]) = a6;
          uint64_t v15 = 3;
        }
      }
      else
      {
        LOBYTE(v17[0]) = BYTE1(a6) | 0x80;
        BYTE1(v17[0]) = a6;
        uint64_t v15 = 2;
      }
    }
    else
    {
      LOBYTE(v17[0]) = a6;
      uint64_t v15 = 1;
    }
    unsigned int v16 = sub_100080E90((uint64_t)v17, v15, a5);
    sub_100081E78((const char *)[v10 UTF8String], (uint64_t)v17, &v16, 0x140uLL);
    sub_100081E78((const char *)[v12 UTF8String], (uint64_t)v17, &v16, 0x140uLL);
    [(SKGActivityJournal *)self addEventWithTime:46 data:v17 dataSize:v16];
  }
}

- (void)addVerboseEventForItem:(int)a3 bundleID:(id)a4 identifier:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_verbose)
  {
    if (self->_isInternalInstall && v8 != 0 && v9 != 0)
    {
      unsigned int v19 = 0;
      memset(v20, 0, sizeof(v20));
      id v13 = v8;
      id v14 = (const char *)[v13 UTF8String];
      id v15 = v10;
      sub_100081B24(v14, (const char *)[v15 UTF8String], (uint64_t)v20, &v19);
      id v16 = v15;
      [v16 UTF8String];
      strlen((const char *)[v16 UTF8String]);
      id v17 = v13;
      [v17 UTF8String];
      strlen((const char *)[v17 UTF8String]);
      unint64_t v18 = si_compute_oid_for_identifier_bundle_id();
      [(SKGActivityJournal *)self addEventWithTime:v6 data:v20 dataSize:sub_100080E90((uint64_t)v20, v19, v18)];
    }
  }
  else
  {
    [(SKGActivityJournal *)self addEventForItem:v6 bundleID:v8 identifier:v9];
  }
}

- (void)addVerboseEventForCSSearchableItems:(int)a3 items:(id)a4
{
  if (self->_verbose) {
    [(SKGActivityJournal *)self addEventForCSSearchableItems:*(void *)&a3 items:a4];
  }
}

- (void)addEventForCSSearchableItems:(int)a3 items:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  size_t v7 = v6;
  if (self->_isInternalInstall)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v13 = [v12 bundleID];
          id v14 = [v12 uniqueIdentifier];
          [(SKGActivityJournal *)self addEventForItem:v4 bundleID:v13 identifier:v14];
        }
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)addEventWithTime:(int)a3 data:(void *)a4 dataSize:(unsigned int)a5
{
  uint64_t v7 = *(void *)&a3;
  __chkstk_darwin();
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0x1FFFFFFF0);
  bzero(v10, v9);
  unint64_t Current = (unint64_t)CFAbsoluteTimeGetCurrent();
  if (Current > 0x7F)
  {
    if (Current >> 14)
    {
      if (Current >> 21)
      {
        if (Current >> 28)
        {
          if (Current >> 35)
          {
            if (Current >> 42)
            {
              if (Current >> 49)
              {
                if (HIBYTE(Current))
                {
                  *uint64_t v10 = -1;
                  *(void *)(v10 + 1) = Current;
                  uint64_t v12 = 9;
                }
                else
                {
                  *uint64_t v10 = -2;
                  v10[1] = BYTE6(Current);
                  v10[2] = BYTE5(Current);
                  v10[3] = BYTE4(Current);
                  v10[4] = BYTE3(Current);
                  v10[5] = BYTE2(Current);
                  v10[6] = BYTE1(Current);
                  uint64_t v12 = 8;
                  v10[7] = Current;
                }
              }
              else
              {
                *uint64_t v10 = BYTE6(Current) | 0xFC;
                v10[1] = BYTE5(Current);
                v10[2] = BYTE4(Current);
                v10[3] = BYTE3(Current);
                v10[4] = BYTE2(Current);
                v10[5] = BYTE1(Current);
                uint64_t v12 = 7;
                v10[6] = Current;
              }
            }
            else
            {
              *uint64_t v10 = BYTE5(Current) | 0xF8;
              v10[1] = BYTE4(Current);
              v10[2] = BYTE3(Current);
              v10[3] = BYTE2(Current);
              v10[4] = BYTE1(Current);
              v10[5] = Current;
              uint64_t v12 = 6;
            }
          }
          else
          {
            *uint64_t v10 = BYTE4(Current) | 0xF0;
            v10[1] = BYTE3(Current);
            v10[2] = BYTE2(Current);
            v10[3] = BYTE1(Current);
            v10[4] = Current;
            uint64_t v12 = 5;
          }
        }
        else
        {
          *uint64_t v10 = BYTE3(Current) | 0xE0;
          v10[1] = BYTE2(Current);
          v10[2] = BYTE1(Current);
          v10[3] = Current;
          uint64_t v12 = 4;
        }
      }
      else
      {
        *uint64_t v10 = BYTE2(Current) | 0xC0;
        v10[1] = BYTE1(Current);
        v10[2] = Current;
        uint64_t v12 = 3;
      }
    }
    else
    {
      *uint64_t v10 = BYTE1(Current) | 0x80;
      v10[1] = Current;
      uint64_t v12 = 2;
    }
  }
  else
  {
    *uint64_t v10 = Current;
    uint64_t v12 = 1;
  }
  if (a5)
  {
    memcpy(&v10[v12], a4, a5);
    v12 += a5;
  }
  [(SKGActivityJournal *)self writeEvent:v7 data:v10 dataSize:v12];
}

- (void)addEventWithTime:(int)a3
{
}

- (void)addVerboseEventForItemWithString:(id)a3 identifier:(id)a4 str:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (__CFString *)a5;
  if (self->_isInternalInstall && self->_verbose && v8 && v9)
  {
    unsigned int v18 = 0;
    memset(v19, 0, sizeof(v19));
    id v11 = v8;
    uint64_t v12 = (const char *)[v11 UTF8String];
    id v13 = v9;
    sub_100081B24(v12, (const char *)[v13 UTF8String], (uint64_t)v19, &v18);
    id v14 = v13;
    [v14 UTF8String];
    strlen((const char *)[v14 UTF8String]);
    id v15 = v11;
    [v15 UTF8String];
    strlen((const char *)[v15 UTF8String]);
    unint64_t v16 = si_compute_oid_for_identifier_bundle_id();
    unsigned int v18 = sub_100080E90((uint64_t)v19, v18, v16);
    if (v10) {
      long long v17 = v10;
    }
    else {
      long long v17 = &stru_1000DD7E8;
    }
    uint64_t v10 = v17;
    sub_100081E78((const char *)[(__CFString *)v10 UTF8String], (uint64_t)v19, &v18, 0x100uLL);
    [(SKGActivityJournal *)self addEventWithTime:19 data:v19 dataSize:v18];
  }
}

- (void)addPurgeJournalsEventForItemWithPath:(id)a3 size:(unint64_t)a4
{
  if (a3)
  {
    if (self->_isInternalInstall)
    {
      memset(v6, 0, 192);
      unsigned int v7 = sub_100080E90((uint64_t)v6, 0, a4);
      sub_100081E78((const char *)[a3 UTF8String], (uint64_t)v6, &v7, 0xC0uLL);
      [(SKGActivityJournal *)self addEventWithTime:47 data:v6 dataSize:v7];
    }
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (fd_obj)fd
{
  return self->_fd;
}

- (void)setFd:(fd_obj *)a3
{
  self->_fd = a3;
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_isInternalInstall = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)logBatteryState
{
  return self->_logBatteryState;
}

- (void)setLogBatteryState:(BOOL)a3
{
  self->_logBatteryState = a3;
}

- (void)lastEventData
{
  return self->_lastEventData;
}

- (void)setLastEventData:(void *)a3
{
  self->_lastEventData = a3;
}

- (unint64_t)lastEventDataSize
{
  return self->_lastEventDataSize;
}

- (void)setLastEventDataSize:(unint64_t)a3
{
  self->_lastEventDataSize = a3;
}

- (int)lastEventType
{
  return self->_lastEventType;
}

- (void)setLastEventType:(int)a3
{
  self->_lastEventType = a3;
}

- (unsigned)repeatEventCount
{
  return self->_repeatEventCount;
}

- (void)setRepeatEventCount:(unsigned int)a3
{
  self->_unsigned int repeatEventCount = a3;
}

- (void).cxx_destruct
{
}

@end