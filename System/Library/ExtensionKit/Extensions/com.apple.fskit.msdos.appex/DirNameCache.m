@interface DirNameCache
- (BOOL)isInUse;
- (BOOL)isIncomplete;
- (DirNameCache)initWithDirEntrySize:(unsigned int)a3;
- (NSMutableDictionary)nameCacheBuckets;
- (id)insertDirEntryNamed:(char *)a3 ofLength:(unint64_t)a4 offsetInDir:(unint64_t)a5;
- (id)insertDirEntryNamedUtf16:(unistr255 *)a3 offsetInDir:(unint64_t)a4;
- (unsigned)dirEntrySize;
- (unsigned)hash:(unistr255 *)a3;
- (unsigned)numHashBuckets;
- (unsigned)numHashValues;
- (void)lookupDirEntryNamed:(char *)a3 ofLength:(unint64_t)a4 replyHandler:(id)a5;
- (void)lookupDirEntryNamedUtf16:(unistr255 *)a3 replyHandler:(id)a4;
- (void)removeDirEntryNamed:(char *)a3 ofLength:(unint64_t)a4 offsetInDir:(unint64_t)a5;
- (void)removeDirEntryNamedUtf16:(unistr255 *)a3 offsetInDir:(unint64_t)a4;
- (void)setDirEntrySize:(unsigned int)a3;
- (void)setIsInUse:(BOOL)a3;
- (void)setIsIncomplete:(BOOL)a3;
- (void)setNameCacheBuckets:(id)a3;
- (void)setNumHashBuckets:(unsigned int)a3;
- (void)setNumHashValues:(unsigned int)a3;
@end

@implementation DirNameCache

- (DirNameCache)initWithDirEntrySize:(unsigned int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DirNameCache;
  v4 = [(DirNameCache *)&v8 init];
  if (v4)
  {
    v5 = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:64];
    nameCacheBuckets = v4->_nameCacheBuckets;
    v4->_nameCacheBuckets = v5;

    v4->_dirEntrySize = a3;
  }
  return v4;
}

- (unsigned)hash:(unistr255 *)a3
{
  return crc32(0, (const Bytef *)a3->var1, 2 * a3->var0);
}

- (id)insertDirEntryNamed:(char *)a3 ofLength:(unint64_t)a4 offsetInDir:(unint64_t)a5
{
  memset(v9, 0, sizeof(v9));
  if (CONV_UTF8ToUnistr255((unsigned __int8 *)a3, a4, v9, 32)) {
    fs_errorForPOSIXError();
  }
  else {
  v7 = [(DirNameCache *)self insertDirEntryNamedUtf16:v9 offsetInDir:a5];
  }

  return v7;
}

- (void)removeDirEntryNamed:(char *)a3 ofLength:(unint64_t)a4 offsetInDir:(unint64_t)a5
{
  memset(v7, 0, sizeof(v7));
  if (!CONV_UTF8ToUnistr255((unsigned __int8 *)a3, a4, v7, 32)) {
    [(DirNameCache *)self removeDirEntryNamedUtf16:v7 offsetInDir:a5];
  }
}

- (void)lookupDirEntryNamed:(char *)a3 ofLength:(unint64_t)a4 replyHandler:(id)a5
{
  objc_super v8 = (void (**)(id, void *, void))a5;
  memset(v10, 0, sizeof(v10));
  if (CONV_UTF8ToUnistr255((unsigned __int8 *)a3, a4, v10, 32))
  {
    v9 = fs_errorForPOSIXError();
    v8[2](v8, v9, 0);
  }
  else
  {
    [(DirNameCache *)self lookupDirEntryNamedUtf16:v10 replyHandler:v8];
  }
}

- (id)insertDirEntryNamedUtf16:(unistr255 *)a3 offsetInDir:(unint64_t)a4
{
  p_numHashValues = (int *)&self->_numHashValues;
  if (self->_numHashValues == 50000)
  {
    v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002CBC4(p_numHashValues, v5);
    }
    v6 = 0;
    id v7 = 0;
  }
  else
  {
    unint64_t v10 = a4 / self->_dirEntrySize;
    CONV_Unistr255ToLowerCase(a3);
    unsigned int v11 = [(DirNameCache *)self hash:a3];
    snprintf(__str, 5uLL, "%u", v11 & 0x3F);
    id v7 = [objc_alloc((Class)NSString) initWithUTF8String:__str];
    v12 = [(NSMutableDictionary *)self->_nameCacheBuckets objectForKey:v7];
    if (v12)
    {
      v6 = v12;
      if ([(NameCacheBucket *)v12 currCount])
      {
        unint64_t v13 = 0;
        uint64_t v14 = 4;
        while (*(unsigned int *)((char *)&v6->elements->var0 + v14) != v10)
        {
          ++v13;
          v14 += 8;
          if (v13 >= [(NameCacheBucket *)v6 currCount]) {
            goto LABEL_12;
          }
        }
        v5 = fskit_std_log();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          sub_10002CCE4(v10, v5);
        }
        goto LABEL_19;
      }
    }
    else
    {
      v6 = objc_alloc_init(NameCacheBucket);
      [(NSMutableDictionary *)self->_nameCacheBuckets setObject:v6 forKey:v7];
      ++self->_numHashBuckets;
    }
LABEL_12:
    if (![(NameCacheBucket *)v6 addEntry:v11 | (v10 << 32)])
    {
      v15 = 0;
      ++*p_numHashValues;
      goto LABEL_20;
    }
    v5 = fskit_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002CC60(v5);
    }
  }
LABEL_19:

  v15 = fs_errorForPOSIXError();
LABEL_20:

  return v15;
}

- (void)removeDirEntryNamedUtf16:(unistr255 *)a3 offsetInDir:(unint64_t)a4
{
  if (self->_numHashValues)
  {
    unint64_t dirEntrySize = self->_dirEntrySize;
    CONV_Unistr255ToLowerCase(a3);
    snprintf(__str, 5uLL, "%u", [(DirNameCache *)self hash:a3] & 0x3F);
    id v8 = [objc_alloc((Class)NSString) initWithUTF8String:__str];
    v9 = [(NSMutableDictionary *)self->_nameCacheBuckets objectForKey:v8];
    unint64_t v10 = v9;
    if (v9)
    {
      if ([v9 removeEntryAtIndex:a4 / dirEntrySize]) {
        --self->_numHashValues;
      }
      if (![v10 currCount])
      {
        free(v10[1]);
        v10[1] = 0;
        [(NSMutableDictionary *)self->_nameCacheBuckets removeObjectForKey:v8];
        --self->_numHashBuckets;
      }
    }
  }
}

- (void)lookupDirEntryNamedUtf16:(unistr255 *)a3 replyHandler:(id)a4
{
  v6 = (void (**)(id, void, unint64_t))a4;
  if (self->_numHashValues && self->_numHashBuckets)
  {
    CONV_Unistr255ToLowerCase(a3);
    unsigned int v7 = [(DirNameCache *)self hash:a3];
    snprintf(__str, 5uLL, "%u", v7 & 0x3F);
    id v8 = [objc_alloc((Class)NSString) initWithUTF8String:__str];
    v9 = [(NSMutableDictionary *)self->_nameCacheBuckets objectForKey:v8];
    unint64_t v10 = v9;
    if (v9 && [v9 currCount])
    {
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = v10[1];
        if (*(_DWORD *)(v13 + v11) == v7) {
          break;
        }
        ++v12;
        v11 += 8;
        if (v12 >= [v10 currCount]) {
          goto LABEL_8;
        }
      }
      v6[2](v6, 0, self->_dirEntrySize * (unint64_t)*(unsigned int *)(v13 + v11 + 4));
    }
    else
    {
LABEL_8:
      uint64_t v14 = fs_errorForPOSIXError();
      ((void (**)(id, void *, unint64_t))v6)[2](v6, v14, 0);
    }
  }
  else
  {
    v15 = fs_errorForPOSIXError();
    ((void (**)(id, void *, unint64_t))v6)[2](v6, v15, 0);
  }
}

- (NSMutableDictionary)nameCacheBuckets
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNameCacheBuckets:(id)a3
{
}

- (BOOL)isInUse
{
  return self->_isInUse;
}

- (void)setIsInUse:(BOOL)a3
{
  self->_isInUse = a3;
}

- (BOOL)isIncomplete
{
  return self->_isIncomplete;
}

- (void)setIsIncomplete:(BOOL)a3
{
  self->_isIncomplete = a3;
}

- (unsigned)dirEntrySize
{
  return self->_dirEntrySize;
}

- (void)setDirEntrySize:(unsigned int)a3
{
  self->_unint64_t dirEntrySize = a3;
}

- (unsigned)numHashBuckets
{
  return self->_numHashBuckets;
}

- (void)setNumHashBuckets:(unsigned int)a3
{
  self->_numHashBuckets = a3;
}

- (unsigned)numHashValues
{
  return self->_numHashValues;
}

- (void)setNumHashValues:(unsigned int)a3
{
  self->_numHashValues = a3;
}

- (void).cxx_destruct
{
}

@end