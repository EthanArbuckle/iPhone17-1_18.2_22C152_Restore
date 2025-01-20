@interface Utilities
+ (BOOL)containsReadOnlyAttributes:(id)a3;
+ (BOOL)isDotOrDotDot:(char *)a3 length:(unint64_t)a4;
+ (BOOL)isLabelLegal:(char *)a3;
+ (id)generateVolumeUuid:(bootsector *)a3 uuid:(char *)a4;
+ (id)getMD5Digest:(unsigned int)a3 forData:(const char *)a4 length:(unsigned int)a5;
+ (id)getVolumeLabelFromBootSector:(char *)a3;
+ (id)getVolumeName:(id)a3 bps:(unsigned __int16)a4 spc:(unsigned __int8)a5 bootsector:(bootsector *)a6 flags:(unsigned __int8)a7;
+ (id)metaWriteToDevice:(id)a3 from:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6;
+ (id)sharedUtilities;
+ (id)syncMetaClearToDevice:(id)a3 rangesToClear:(id)a4;
+ (id)syncMetaPurgeToDevice:(id)a3 rangesToPurge:(id)a4;
+ (id)syncMetaReadFromDevice:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6;
+ (id)syncReadFromDevice:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6;
+ (unsigned)getDefaultDOSEncoding;
+ (unsigned)parseCharacterOfLongNameEntry:(winentry *)a3 charIdxInEntry:(unsigned int)a4 charIdxInName:(unsigned int)a5 unistrName:(unistr255 *)a6 isFirstLongEntryInSet:(BOOL)a7;
+ (void)enableMetaRW;
+ (void)setGMTDiffOffset;
- (BOOL)useMetaRW;
- (void)setUseMetaRW:(BOOL)a3;
@end

@implementation Utilities

+ (id)sharedUtilities
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002AABC;
  block[3] = &unk_10004D2E8;
  block[4] = a1;
  if (qword_100056A28 != -1) {
    dispatch_once(&qword_100056A28, block);
  }
  v2 = (void *)qword_100056A30;

  return v2;
}

+ (id)getVolumeName:(id)a3 bps:(unsigned __int16)a4 spc:(unsigned __int8)a5 bootsector:(bootsector *)a6 flags:(unsigned __int8)a7
{
  unsigned int v9 = a5;
  unsigned int v10 = a4;
  id v12 = a3;
  v13 = [a1 sharedUtilities];
  if ([v13 useMetaRW])
  {
    v14 = fskit_std_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100032D84(v14);
    }

    id v15 = 0;
    goto LABEL_59;
  }
  memset(__dst, 0, 11);
  if (a7)
  {
    unint64_t v16 = 32 * *(unsigned __int16 *)&a6->var2.var2[6] + v10 - 1;
    id v45 = v12;
    uint64_t v17 = (v16 / v10);
    if ((v16 / v10))
    {
      uint64_t v18 = 0;
      int v19 = *(unsigned __int16 *)&a6->var2.var2[3]
          + *(unsigned __int16 *)&a6->var2.var2[11] * a6->var0.var2[5];
      while (1)
      {
        v20 = [a1 syncReadFromDevice:v45 into:v46 startingAt:(v19 + v18) * v10 length:v10];
        if (v20)
        {

          goto LABEL_64;
        }
        if (v10) {
          break;
        }
LABEL_19:
        if (++v18 == v17) {
          goto LABEL_37;
        }
      }
      uint64_t v21 = 0;
      while (1)
      {
        if (v46[v21] != 229)
        {
          if (!v46[v21]) {
            goto LABEL_37;
          }
          int v22 = v46[v21 + 11];
          if (v22 != 15 && (v22 & 8) != 0) {
            break;
          }
        }
        v21 += 32;
        if (v21 >= v10) {
          goto LABEL_19;
        }
      }
      strncpy(__dst, &v46[v21], 0xBuLL);
    }
    else
    {
      uint64_t v24 = v9 * v10;
      id v44 = [objc_alloc((Class)NSMutableData) initWithLength:v24];
      unsigned int v25 = *(_DWORD *)&a6->var2.var2[33];
      if (v25 - 2 <= 0xFFFFFFF3)
      {
        uint64_t v43 = v9;
        while (1)
        {
          uint64_t v26 = (*(unsigned __int16 *)&a6->var2.var2[3]
               + *(_DWORD *)&a6->var2.var2[25] * a6->var0.var2[5]
               + (v25 - 2) * v43)
              * v10;
          id v27 = v44;
          uint64_t v28 = objc_msgSend(a1, "syncReadFromDevice:into:startingAt:length:", v45, objc_msgSend(v27, "mutableBytes"), v26, v24);
          if (v28)
          {
LABEL_63:
            v41 = (void *)v28;

LABEL_64:
            id v15 = 0;
            id v12 = v45;
            goto LABEL_59;
          }
          id v29 = v27;
          v30 = [v29 bytes];
          if (v24) {
            break;
          }
LABEL_34:
          unsigned int v34 = 4 * v25;
          unint64_t v42 = (v34 / v10 + (unint64_t)*(unsigned __int16 *)&a6->var2.var2[3]) * v10;
          id v35 = v29;
          uint64_t v28 = objc_msgSend(a1, "syncReadFromDevice:into:startingAt:length:", v45, objc_msgSend(v35, "mutableBytes"), v42, v10);
          if (v28) {
            goto LABEL_63;
          }
          unsigned int v25 = *(_DWORD *)((unsigned char *)objc_msgSend(v35, "bytes", v27) + v34 % v10) & 0xFFFFFFF;
          if (v25 - 2 >= 0xFFFFFFF4) {
            goto LABEL_36;
          }
        }
        uint64_t v31 = 0;
        while (1)
        {
          if (v30[v31] != 229)
          {
            if (!v30[v31]) {
              goto LABEL_36;
            }
            int v32 = v30[v31 + 11];
            if (v32 != 15 && (v32 & 8) != 0) {
              break;
            }
          }
          v31 += 32;
          if (v31 >= v24) {
            goto LABEL_34;
          }
        }
        strncpy(__dst, &v30[v31], 0xBuLL);
      }
LABEL_36:
    }
LABEL_37:
    id v12 = v45;
  }
  int v36 = __dst[0];
  if ((a7 & 2) != 0 && !__dst[0])
  {
    if (!a6)
    {
      v37 = fskit_std_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_100032E08(v37);
      }
    }
    if (*(_WORD *)&a6->var2.var2[6])
    {
      if (a6->var0.var4[7] == 41)
      {
        v38 = &a6->var0.var4[12];
LABEL_49:
        strncpy(__dst, v38, 0xBuLL);
      }
    }
    else if (a6->var0.var4[35] == 41)
    {
      v38 = &a6->var0.var4[40];
      goto LABEL_49;
    }
    int v36 = __dst[0];
  }
  if (v36 == 5) {
    __dst[0] = -27;
  }
  if (([a1 isLabelLegal:__dst] & 1) == 0) {
    __dst[0] = 0;
  }
  for (int i = 10; i != -1; --i)
  {
    if (__dst[i] != 32) {
      break;
    }
    __dst[i] = 0;
  }
  id v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", __dst, 11, CFStringConvertEncodingToNSStringEncoding((CFStringEncoding)objc_msgSend(a1, "getDefaultDOSEncoding")));
LABEL_59:

  return v15;
}

+ (BOOL)isLabelLegal:(char *)a3
{
  unsigned int v3 = *a3;
  if (v3 >= 0x21)
  {
    BOOL v4 = 0;
    unint64_t v5 = 0;
    v6 = a3 + 1;
    while (!memchr("\"*+,./:;<=>?[\\]|", v3, 0x11uLL))
    {
      if (v5 == 10) {
        return 1;
      }
      BOOL v4 = v5 > 9;
      unsigned int v3 = v6[v5++];
      if (v3 < 0x20) {
        break;
      }
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  v7 = fskit_std_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    unsigned int v10 = "+[Utilities isLabelLegal:]";
    __int16 v11 = 1024;
    unsigned int v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Illegal character: %c", (uint8_t *)&v9, 0x12u);
  }

  return v4;
}

+ (id)generateVolumeUuid:(bootsector *)a3 uuid:(char *)a4
{
  uint64_t v5 = 36;
  if (!*(_WORD *)&a3->var2.var2[6]) {
    uint64_t v5 = 64;
  }
  v6 = &a3->var0.var0[v5];
  if (v6[2] == 41)
  {
    v7 = v6 + 3;
    if (v6[3] || v6[4] || v6[5] || v6[6])
    {
      int v8 = *(unsigned __int16 *)&a3->var2.var2[8];
      if (!*(_WORD *)&a3->var2.var2[8]) {
        int v8 = *(_DWORD *)&a3->var2.var2[21];
      }
      memset(&c, 0, sizeof(c));
      int data = v8;
      CC_MD5_Init(&c);
      CC_MD5_Update(&c, &unk_10003DC55, 0x10u);
      CC_MD5_Update(&c, v7, 4u);
      CC_MD5_Update(&c, &data, 4u);
      CC_MD5_Final((unsigned __int8 *)a4, &c);
      a4[6] = a4[6] & 0xF | 0x30;
      a4[8] = a4[8] & 0x3F | 0x80;
    }
  }
  uuid_unparse((const unsigned __int8 *)a4, (char *)&c);
  id v9 = objc_alloc((Class)NSUUID);
  id v10 = [objc_alloc((Class)NSString) initWithUTF8String:&c];
  id v11 = [v9 initWithUUIDString:v10];

  return v11;
}

+ (id)getVolumeLabelFromBootSector:(char *)a3
{
  uint64_t v3 = 0;
  memset(v9, 0, sizeof(v9));
  do
  {
    int v4 = a3[v3];
    if (v4 == 5 && v3 == 0) {
      int v4 = 229;
    }
    if ((v4 - 160) >= 0xFFFFFFE0) {
      LOWORD(v4) = dos2unicodeConv[v4 - 128];
    }
    *((unsigned char *)v9 + v3++) = v4;
  }
  while (v3 != 11);
  for (unsigned int i = 10; i != -1; --i)
  {
    if (*((unsigned char *)v9 + i) != 32) {
      break;
    }
  }
  *((unsigned char *)v9 + (int)i + 1) = 0;
  v7 = +[FSFileName nameWithCString:v9];

  return v7;
}

+ (unsigned)getDefaultDOSEncoding
{
  v2 = +[NSProcessInfo processInfo];
  uint64_t v3 = [v2 environment];
  int v4 = [v3 objectForKey:@"__CF_USER_TEXT_ENCODING"];

  uint64_t v5 = objc_msgSend(v4, "substringFromIndex:", (char *)objc_msgSend(v4, "length") - 3);

  id v6 = v5;
  int v7 = strtol((const char *)[v6 UTF8String], 0, 0);
  if (v7 > 24)
  {
    switch(v7)
    {
      case 25:
        unsigned int v8 = 1057;
        break;
      case 26:
      case 27:
      case 28:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
        goto LABEL_18;
      case 29:
      case 36:
      case 38:
        unsigned int v8 = 1042;
        break;
      case 35:
        unsigned int v8 = 1044;
        break;
      case 37:
        unsigned int v8 = 1046;
        break;
      default:
        if (v7 == 140)
        {
LABEL_9:
          unsigned int v8 = 1049;
        }
        else if (v7 == 152)
        {
LABEL_8:
          unsigned int v8 = 1043;
        }
        else
        {
LABEL_18:
          unsigned int v8 = -1;
        }
        break;
    }
  }
  else
  {
    unsigned int v8 = 1040;
    switch(v7)
    {
      case 0:
        break;
      case 1:
        unsigned int v8 = 1056;
        break;
      case 2:
        unsigned int v8 = 1059;
        break;
      case 3:
        unsigned int v8 = 1058;
        break;
      case 4:
        goto LABEL_9;
      case 5:
        unsigned int v8 = 1047;
        break;
      case 6:
        unsigned int v8 = 1029;
        break;
      case 7:
        goto LABEL_8;
      case 21:
        unsigned int v8 = 1053;
        break;
      default:
        goto LABEL_18;
    }
  }

  return v8;
}

+ (unsigned)parseCharacterOfLongNameEntry:(winentry *)a3 charIdxInEntry:(unsigned int)a4 charIdxInName:(unsigned int)a5 unistrName:(unistr255 *)a6 isFirstLongEntryInSet:(BOOL)a7
{
  if (a4 > 0xC) {
    return 0;
  }
  unsigned __int16 v7 = *(_WORD *)(&a3->var0 + puLongNameOffset[a4]);
  if ((unsigned __int16)(v7 + 1) <= 1u)
  {
    if (a7)
    {
      a6->var0 = a5 + a4;
      return 1;
    }
    return 0;
  }
  if (a5 + a4 > 0xFF) {
    return 0;
  }
  a6->var1[a5 + a4] = v7;
  return 2;
}

+ (BOOL)isDotOrDotDot:(char *)a3 length:(unint64_t)a4
{
  if (!a3) {
    return 0;
  }
  if (a4 == 1 && *a3 == 46) {
    return 1;
  }
  int v6 = strncmp(a3, "..", 2uLL);
  return a4 == 2 && v6 == 0;
}

+ (id)syncReadFromDevice:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6
{
  id v13 = 0;
  id v7 = [a3 readInto:a4 startingAt:a5 length:a6 error:&v13];
  id v8 = v13;
  if (v8)
  {
    id v9 = v8;
    id v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100032F00();
    }
  }
  else if (v7 == (id)a6)
  {
    id v9 = 0;
  }
  else
  {
    id v11 = fskit_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100032E8C();
    }

    id v9 = fs_errorForPOSIXError();
  }

  return v9;
}

+ (id)syncMetaReadFromDevice:(id)a3 into:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6
{
  id v10 = a3;
  id v11 = [a1 sharedUtilities];
  if ([v11 useMetaRW])
  {
    unsigned int v12 = [v10 metadataReadInto:a4 startingAt:a5 length:a6];

    if (!v12) {
      goto LABEL_9;
    }
    id v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100032F74();
    }
  }
  else
  {
    unsigned int v12 = +[Utilities syncReadFromDevice:v10 into:a4 startingAt:a5 length:a6];

    if (!v12) {
      goto LABEL_9;
    }
    id v13 = fskit_std_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100032FE8();
    }
  }

LABEL_9:

  return v12;
}

+ (id)metaWriteToDevice:(id)a3 from:(void *)a4 startingAt:(int64_t)a5 length:(unint64_t)a6
{
  id v10 = a3;
  uint64_t v11 = [v10 metadataWriteFrom:a4 startingAt:a5 length:a6];
  if (v11)
  {
    unsigned int v12 = (void *)v11;
    id v13 = [a1 sharedUtilities];
    if ([v13 useMetaRW])
    {
      v14 = fskit_std_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        int v22 = "+[Utilities metaWriteToDevice:from:startingAt:length:]";
        __int16 v23 = 2048;
        int64_t v24 = a5;
        __int16 v25 = 2048;
        unint64_t v26 = a6;
        __int16 v27 = 2112;
        uint64_t v28 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to meta write, offset %lld, length %zu, error %@", buf, 0x2Au);
      }

      id v15 = v12;
    }
    else
    {
      id v20 = v12;
      id v16 = [v10 writeFrom:a4 startingAt:a5 length:a6 error:&v20];
      id v15 = v20;

      if (v15)
      {
        uint64_t v17 = fskit_std_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1000330D0();
        }
      }
      else if (v16 == (id)a6)
      {
        id v15 = 0;
      }
      else
      {
        uint64_t v18 = fskit_std_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_10003305C();
        }

        fs_errorForPOSIXError();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (id)syncMetaClearToDevice:(id)a3 rangesToClear:(id)a4
{
  int v4 = [a3 metadataClear:a4 wait:0];
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100033144();
    }
  }

  return v4;
}

+ (id)syncMetaPurgeToDevice:(id)a3 rangesToPurge:(id)a4
{
  int v4 = [a3 metadataPurge:a4];
  if (v4)
  {
    uint64_t v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000331B8();
    }
  }

  return v4;
}

+ (id)getMD5Digest:(unsigned int)a3 forData:(const char *)a4 length:(unsigned int)a5
{
  unsigned int v8 = a3 >> 1;
  id v9 = (char *)&c - (((a3 >> 1) + 15) & 0xFFFFFFF0);
  bzero(v9, a3 >> 1);
  id v10 = +[NSMutableData dataWithLength:a3 + 1];
  uint64_t v11 = (char *)[v10 mutableBytes];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  CC_MD5_Update(&c, a4, a5);
  CC_MD5_Final((unsigned __int8 *)v9, &c);
  if (a3 >= 2)
  {
    int v12 = 0;
    int v13 = 0;
    do
    {
      snprintf(&v11[2 * v12], 3uLL, "%02x", v9[v13++]);
      int v12 = v13;
    }
    while (v8 > v13);
  }

  return v10;
}

+ (BOOL)containsReadOnlyAttributes:(id)a3
{
  id v3 = a3;
  if (([v3 isValid:8] & 1) != 0
    || ([v3 isValid:16] & 1) != 0
    || ([v3 isValid:128] & 1) != 0
    || ([v3 isValid:256] & 1) != 0
    || ([v3 isValid:512] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isValid:0x4000];
  }

  return v4;
}

+ (void)enableMetaRW
{
  v2 = fskit_std_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10003322C(v2);
  }

  id v3 = +[Utilities sharedUtilities];
  [v3 setUseMetaRW:1];
}

+ (void)setGMTDiffOffset
{
  time_t v4 = time(0);
  v2 = gmtime(&v4);
  v2->tm_isdst = -1;
  time_t v3 = mktime(v2);
  dword_1000564C0 = -(int)difftime(v4, v3);
}

- (BOOL)useMetaRW
{
  return self->_useMetaRW;
}

- (void)setUseMetaRW:(BOOL)a3
{
  self->_useMetaRW = a3;
}

@end