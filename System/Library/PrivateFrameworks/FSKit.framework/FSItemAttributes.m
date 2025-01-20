@interface FSItemAttributes
+ (BOOL)supportsSecureCoding;
+ (id)requestWithData:(id)a3;
+ (id)requestWithLIAttributes:(const _LIFileAttributes *)a3;
- (BOOL)inhibitKernelOffloadedIO;
- (BOOL)isValid:(int64_t)a3;
- (BOOL)supportsLimitedXAttrs;
- (FSItemAttributes)init;
- (FSItemAttributes)initWithCoder:(id)a3;
- (FSItemAttributes)initWithLIAttributes:(const _LIFileAttributes *)a3;
- (id)attrsData;
- (int64_t)type;
- (timespec)accessTime;
- (timespec)addedTime;
- (timespec)backupTime;
- (timespec)birthTime;
- (timespec)changeTime;
- (timespec)modifyTime;
- (unint64_t)allocSize;
- (unint64_t)fileID;
- (unint64_t)parentID;
- (unint64_t)size;
- (unsigned)flags;
- (unsigned)gid;
- (unsigned)internalFlags;
- (unsigned)linkCount;
- (unsigned)mode;
- (unsigned)uid;
- (void)accessTime;
- (void)addedTime;
- (void)allocSize;
- (void)backupTime;
- (void)birthTime;
- (void)changeTime;
- (void)encodeWithCoder:(id)a3;
- (void)fileID;
- (void)flags;
- (void)getLIAttributes:(_LIFileAttributes *)a3;
- (void)gid;
- (void)internalFlags;
- (void)invalidateAllProperties;
- (void)linkCount;
- (void)mode;
- (void)modifyTime;
- (void)parentID;
- (void)setAccessTime:(timespec)a3;
- (void)setAddedTime:(timespec)a3;
- (void)setAllocSize:(unint64_t)a3;
- (void)setAttributeSeqno:(unint64_t)a3;
- (void)setBackupTime:(timespec)a3;
- (void)setBirthTime:(timespec)a3;
- (void)setChangeTime:(timespec)a3;
- (void)setFileID:(unint64_t)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGid:(unsigned int)a3;
- (void)setInhibitKernelOffloadedIO:(BOOL)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setLinkCount:(unsigned int)a3;
- (void)setMode:(unsigned int)a3;
- (void)setModifyTime:(timespec)a3;
- (void)setParentID:(unint64_t)a3;
- (void)setSize:(unint64_t)a3;
- (void)setSupportsLimitedXAttrs:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)setUid:(unsigned int)a3;
- (void)size;
- (void)type;
- (void)uid;
@end

@implementation FSItemAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0];
    objc_exception_throw(v4);
  }
  [v5 encodeBytes:&self->attrs length:184 forKey:@"FSItemAttr"];
}

- (FSItemAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FSItemAttributes;
  uint64_t v19 = 0;
  id v5 = [(FSItemAttributes *)&v18 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v17 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0];
      objc_exception_throw(v17);
    }
    uint64_t v6 = [v4 decodeBytesForKey:@"FSItemAttr" returnedLength:&v19];
    if (v6 && v19 == 184)
    {
      long long v7 = *(_OWORD *)v6;
      long long v8 = *(_OWORD *)(v6 + 16);
      long long v9 = *(_OWORD *)(v6 + 32);
      *(_OWORD *)(v5 + 56) = *(_OWORD *)(v6 + 48);
      *(_OWORD *)(v5 + 40) = v9;
      *(_OWORD *)(v5 + 24) = v8;
      *(_OWORD *)(v5 + 8) = v7;
      long long v10 = *(_OWORD *)(v6 + 64);
      long long v11 = *(_OWORD *)(v6 + 80);
      long long v12 = *(_OWORD *)(v6 + 96);
      *(_OWORD *)(v5 + 120) = *(_OWORD *)(v6 + 112);
      *(_OWORD *)(v5 + 104) = v12;
      *(_OWORD *)(v5 + 88) = v11;
      *(_OWORD *)(v5 + 72) = v10;
      long long v13 = *(_OWORD *)(v6 + 128);
      long long v14 = *(_OWORD *)(v6 + 144);
      long long v15 = *(_OWORD *)(v6 + 160);
      *((void *)v5 + 23) = *(void *)(v6 + 176);
      *(_OWORD *)(v5 + 168) = v15;
      *(_OWORD *)(v5 + 152) = v14;
      *(_OWORD *)(v5 + 136) = v13;
    }
    else
    {

      id v5 = 0;
    }
  }

  return (FSItemAttributes *)v5;
}

- (FSItemAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)FSItemAttributes;
  result = [(FSItemAttributes *)&v3 init];
  if (result)
  {
    *(void *)&result->attrs.fa_int_flags = 0;
    result->attrs.fa_addedtime = 0u;
    result->attrs.fa_backuptime = 0u;
    result->attrs.fa_birthtime = 0u;
    result->attrs.fa_ctime = 0u;
    result->attrs.fa_mtime = 0u;
    result->attrs.fa_atime = 0u;
    *(_OWORD *)&result->attrs.fa_fileid = 0u;
    *(_OWORD *)&result->attrs.fa_size = 0u;
    *(_OWORD *)&result->attrs.fa_nlink = 0u;
    *(_OWORD *)&result->attrs.fa_seqno = 0u;
    *(_OWORD *)&result->attrs.__fa_rsvd0 = 0u;
  }
  return result;
}

- (FSItemAttributes)initWithLIAttributes:(const _LIFileAttributes *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FSItemAttributes;
  result = [(FSItemAttributes *)&v7 init];
  if (result)
  {
    unint64_t fa_validmask = a3->fa_validmask;
    result->attrs.unint64_t fa_validmask = fa_validmask;
    unint64_t v6 = a3->fa_validmask;
    if (v6)
    {
      result->attrs.fa_type = a3->fa_type;
      if ((v6 & 2) == 0)
      {
LABEL_4:
        if ((v6 & 8) == 0) {
          goto LABEL_5;
        }
        goto LABEL_24;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_4;
    }
    result->attrs.fa_mode = a3->fa_mode;
    if ((v6 & 8) == 0)
    {
LABEL_5:
      if ((v6 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_25;
    }
LABEL_24:
    result->attrs.fa_uid = a3->fa_uid;
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_26;
    }
LABEL_25:
    result->attrs.fa_nlink = a3->fa_nlink;
    if ((v6 & 0x10) == 0)
    {
LABEL_7:
      if ((v6 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_27;
    }
LABEL_26:
    result->attrs.fa_gid = a3->fa_gid;
    if ((v6 & 0x20) == 0)
    {
LABEL_8:
      if ((v6 & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_28;
    }
LABEL_27:
    result->attrs.fa_bsd_flags = a3->fa_bsd_flags;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_29;
    }
LABEL_28:
    result->attrs.fa_size = a3->fa_size;
    if ((v6 & 0x80) == 0)
    {
LABEL_10:
      if ((v6 & 0x100) == 0) {
        goto LABEL_11;
      }
      goto LABEL_30;
    }
LABEL_29:
    result->attrs.fa_allocsize = a3->fa_allocsize;
    if ((v6 & 0x100) == 0)
    {
LABEL_11:
      if ((v6 & 0x200) == 0) {
        goto LABEL_12;
      }
      goto LABEL_31;
    }
LABEL_30:
    result->attrs.fa_fileid = a3->fa_fileid;
    if ((v6 & 0x200) == 0)
    {
LABEL_12:
      if ((v6 & 0x400) == 0) {
        goto LABEL_13;
      }
      goto LABEL_32;
    }
LABEL_31:
    result->attrs.fa_parentid = a3->fa_parentid;
    if ((v6 & 0x400) == 0)
    {
LABEL_13:
      if ((v6 & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_33;
    }
LABEL_32:
    result->attrs.fa_atime = a3->fa_atime;
    if ((v6 & 0x800) == 0)
    {
LABEL_14:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_34;
    }
LABEL_33:
    result->attrs.fa_mtime = a3->fa_mtime;
    if ((v6 & 0x1000) == 0)
    {
LABEL_15:
      if ((v6 & 0x2000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_35;
    }
LABEL_34:
    result->attrs.fa_ctime = a3->fa_ctime;
    if ((v6 & 0x2000) == 0)
    {
LABEL_16:
      if ((v6 & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_36;
    }
LABEL_35:
    result->attrs.fa_birthtime = a3->fa_birthtime;
    if ((v6 & 0x4000) == 0)
    {
LABEL_17:
      if ((v6 & 0x8000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
LABEL_36:
    result->attrs.fa_backuptime = a3->fa_backuptime;
    if ((v6 & 0x8000) == 0)
    {
LABEL_18:
      if ((v6 & 0x10000) == 0)
      {
LABEL_20:
        result->attrs.unint64_t fa_validmask = v6 | fa_validmask;
        return result;
      }
LABEL_19:
      result->attrs.fa_int_flags = a3->fa_int_flags;
      goto LABEL_20;
    }
LABEL_37:
    result->attrs.fa_addedtime = a3->fa_addedtime;
    if ((v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  return result;
}

+ (id)requestWithLIAttributes:(const _LIFileAttributes *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)a1) initWithLIAttributes:a3];
  return v3;
}

+ (id)requestWithData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  if ((unint64_t)[v4 length] > 0xB7)
  {
    objc_super v7 = [a1 requestWithLIAttributes:v5];
  }
  else
  {
    unint64_t v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[FSItemAttributes requestWithData:](v4, v6);
    }

    objc_super v7 = 0;
  }

  return v7;
}

- (void)getLIAttributes:(_LIFileAttributes *)a3
{
  long long v3 = *(_OWORD *)&self->attrs.__fa_rsvd0;
  long long v4 = *(_OWORD *)&self->attrs.fa_seqno;
  long long v5 = *(_OWORD *)&self->attrs.fa_size;
  *(_OWORD *)&a3->fa_nlink = *(_OWORD *)&self->attrs.fa_nlink;
  *(_OWORD *)&a3->fa_size = v5;
  *(_OWORD *)&a3->__fa_rsvd0 = v3;
  *(_OWORD *)&a3->fa_seqno = v4;
  long long v6 = *(_OWORD *)&self->attrs.fa_fileid;
  timespec fa_atime = self->attrs.fa_atime;
  timespec fa_ctime = self->attrs.fa_ctime;
  a3->fa_mtime = self->attrs.fa_mtime;
  a3->timespec fa_ctime = fa_ctime;
  *(_OWORD *)&a3->fa_fileid = v6;
  a3->timespec fa_atime = fa_atime;
  timespec fa_birthtime = self->attrs.fa_birthtime;
  timespec fa_backuptime = self->attrs.fa_backuptime;
  timespec fa_addedtime = self->attrs.fa_addedtime;
  *(void *)&a3->fa_int_flags = *(void *)&self->attrs.fa_int_flags;
  a3->timespec fa_backuptime = fa_backuptime;
  a3->timespec fa_addedtime = fa_addedtime;
  a3->timespec fa_birthtime = fa_birthtime;
}

- (void)setAttributeSeqno:(unint64_t)a3
{
  self->attrs.fa_seqno = a3;
}

- (void)invalidateAllProperties
{
  self->attrs.unint64_t fa_validmask = 0;
}

- (BOOL)isValid:(int64_t)a3
{
  BOOL v3 = 0;
  if (a3 > 511)
  {
    if (a3 >= 0x8000)
    {
      if (a3 >= 0x20000)
      {
        if (a3 == 0x20000)
        {
          a3 = 0x4000;
        }
        else
        {
          if (a3 != 0x4000000000000000) {
            return v3;
          }
          a3 = 0x10000;
        }
      }
      else if (a3 == 0x8000)
      {
        a3 = 1024;
      }
      else
      {
        if (a3 != 0x10000) {
          return v3;
        }
        a3 = 0x2000;
      }
    }
    else if (a3 >= 0x2000)
    {
      if (a3 == 0x2000)
      {
        a3 = 0x8000;
      }
      else
      {
        if (a3 != 0x4000) {
          return v3;
        }
        a3 = 4096;
      }
    }
    else if (a3 != 512)
    {
      if (a3 != 4096) {
        return v3;
      }
      a3 = 2048;
    }
    return (self->attrs.fa_validmask & a3) != 0;
  }
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 != 128 && a3 != 256) {
        return v3;
      }
    }
    else if (a3 != 32 && a3 != 64)
    {
      return v3;
    }
    return (self->attrs.fa_validmask & a3) != 0;
  }
  int64_t v4 = a3 - 1;
  a3 = 8;
  switch(v4)
  {
    case 0:
      return (self->attrs.fa_validmask & a3) != 0;
    case 1:
      a3 = 16;
      return (self->attrs.fa_validmask & a3) != 0;
    case 3:
      a3 = 2;
      return (self->attrs.fa_validmask & a3) != 0;
    case 7:
      a3 = 1;
      return (self->attrs.fa_validmask & a3) != 0;
    default:
      return v3;
  }
  return v3;
}

- (unsigned)internalFlags
{
  if ((self->attrs.fa_validmask & 0x10000) == 0)
  {
    BOOL v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes internalFlags]();
    }
  }
  return self->attrs.fa_int_flags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->attrs.fa_int_flags = a3;
  self->attrs.fa_validmask |= 0x10000uLL;
}

- (unsigned)uid
{
  if ((self->attrs.fa_validmask & 8) == 0)
  {
    BOOL v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes uid]();
    }
  }
  return self->attrs.fa_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->attrs.fa_uid = a3;
  self->attrs.fa_validmask |= 8uLL;
}

- (unsigned)gid
{
  if ((self->attrs.fa_validmask & 0x10) == 0)
  {
    BOOL v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes gid]();
    }
  }
  return self->attrs.fa_gid;
}

- (void)setGid:(unsigned int)a3
{
  self->attrs.fa_gid = a3;
  self->attrs.fa_validmask |= 0x10uLL;
}

- (unsigned)mode
{
  if ((self->attrs.fa_validmask & 2) == 0)
  {
    BOOL v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes mode]();
    }
  }
  return self->attrs.fa_mode;
}

- (void)setMode:(unsigned int)a3
{
  self->attrs.fa_mode = a3;
  self->attrs.fa_validmask |= 2uLL;
}

- (unsigned)linkCount
{
  if ((self->attrs.fa_validmask & 4) == 0)
  {
    BOOL v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes linkCount]();
    }
  }
  return self->attrs.fa_nlink;
}

- (void)setLinkCount:(unsigned int)a3
{
  self->attrs.fa_nlink = a3;
  self->attrs.fa_validmask |= 4uLL;
}

- (unsigned)flags
{
  if ((self->attrs.fa_validmask & 0x20) == 0)
  {
    BOOL v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes flags]();
    }
  }
  return self->attrs.fa_bsd_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->attrs.fa_bsd_flags = a3;
  self->attrs.fa_validmask |= 0x20uLL;
}

- (BOOL)inhibitKernelOffloadedIO
{
  return ([(FSItemAttributes *)self internalFlags] & 1) == 0;
}

- (void)setInhibitKernelOffloadedIO:(BOOL)a3
{
}

- (BOOL)supportsLimitedXAttrs
{
  return ([(FSItemAttributes *)self internalFlags] >> 2) & 1;
}

- (void)setSupportsLimitedXAttrs:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  [(FSItemAttributes *)self setInternalFlags:self->attrs.fa_int_flags & 0xFFFFFFFB | v3];
}

- (unint64_t)size
{
  if ((self->attrs.fa_validmask & 0x40) == 0)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes size]();
    }
  }
  return self->attrs.fa_size;
}

- (void)setSize:(unint64_t)a3
{
  self->attrs.fa_size = a3;
  self->attrs.fa_validmask |= 0x40uLL;
}

- (unint64_t)allocSize
{
  if ((self->attrs.fa_validmask & 0x80) == 0)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes allocSize]();
    }
  }
  return self->attrs.fa_allocsize;
}

- (void)setAllocSize:(unint64_t)a3
{
  self->attrs.fa_allocsize = a3;
  self->attrs.fa_validmask |= 0x80uLL;
}

- (unint64_t)fileID
{
  if ((self->attrs.fa_validmask & 0x100) == 0)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes fileID]();
    }
  }
  return self->attrs.fa_fileid;
}

- (void)setFileID:(unint64_t)a3
{
  self->attrs.fa_fileid = a3;
  self->attrs.fa_validmask |= 0x100uLL;
}

- (unint64_t)parentID
{
  if ((self->attrs.fa_validmask & 0x200) == 0)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes parentID]();
    }
  }
  return self->attrs.fa_parentid;
}

- (void)setParentID:(unint64_t)a3
{
  self->attrs.fa_parentid = a3;
  self->attrs.fa_validmask |= 0x200uLL;
}

- (int64_t)type
{
  if ((self->attrs.fa_validmask & 1) == 0)
  {
    int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes type]();
    }
  }
  uint64_t v4 = self->attrs.fa_type - 1;
  if (v4 < 7) {
    return v4 + 1;
  }
  else {
    return 0;
  }
}

- (void)setType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 7) {
    unsigned int v3 = a3;
  }
  else {
    unsigned int v3 = 0;
  }
  self->attrs.fa_type = v3;
  self->attrs.fa_validmask |= 1uLL;
}

- (id)attrsData
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:&self->attrs length:184];
}

- (timespec)modifyTime
{
  if ((self->attrs.fa_validmask & 0x800) == 0)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes modifyTime]();
    }
  }
  __darwin_time_t tv_sec = self->attrs.fa_mtime.tv_sec;
  uint64_t tv_nsec = self->attrs.fa_mtime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setModifyTime:(timespec)a3
{
  self->attrs.fa_mtime = a3;
  self->attrs.fa_validmask |= 0x800uLL;
}

- (timespec)accessTime
{
  if ((self->attrs.fa_validmask & 0x400) == 0)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes accessTime]();
    }
  }
  __darwin_time_t tv_sec = self->attrs.fa_atime.tv_sec;
  uint64_t tv_nsec = self->attrs.fa_atime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setAccessTime:(timespec)a3
{
  self->attrs.timespec fa_atime = a3;
  self->attrs.fa_validmask |= 0x400uLL;
}

- (timespec)changeTime
{
  if ((self->attrs.fa_validmask & 0x1000) == 0)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes changeTime]();
    }
  }
  __darwin_time_t tv_sec = self->attrs.fa_ctime.tv_sec;
  uint64_t tv_nsec = self->attrs.fa_ctime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setChangeTime:(timespec)a3
{
  self->attrs.timespec fa_ctime = a3;
  self->attrs.fa_validmask |= 0x1000uLL;
}

- (timespec)addedTime
{
  if ((self->attrs.fa_validmask & 0x8000) == 0)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes addedTime]();
    }
  }
  __darwin_time_t tv_sec = self->attrs.fa_addedtime.tv_sec;
  uint64_t tv_nsec = self->attrs.fa_addedtime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setAddedTime:(timespec)a3
{
  self->attrs.timespec fa_addedtime = a3;
  self->attrs.fa_validmask |= 0x8000uLL;
}

- (timespec)backupTime
{
  if ((self->attrs.fa_validmask & 0x4000) == 0)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes backupTime]();
    }
  }
  __darwin_time_t tv_sec = self->attrs.fa_backuptime.tv_sec;
  uint64_t tv_nsec = self->attrs.fa_backuptime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setBackupTime:(timespec)a3
{
  self->attrs.timespec fa_backuptime = a3;
  self->attrs.fa_validmask |= 0x4000uLL;
}

- (timespec)birthTime
{
  if ((self->attrs.fa_validmask & 0x2000) == 0)
  {
    unsigned int v3 = fskit_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      -[FSItemAttributes birthTime]();
    }
  }
  __darwin_time_t tv_sec = self->attrs.fa_birthtime.tv_sec;
  uint64_t tv_nsec = self->attrs.fa_birthtime.tv_nsec;
  result.uint64_t tv_nsec = tv_nsec;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (void)setBirthTime:(timespec)a3
{
  self->attrs.timespec fa_birthtime = a3;
  self->attrs.fa_validmask |= 0x2000uLL;
}

+ (void)requestWithData:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 length];
  _os_log_error_impl(&dword_24DDB2000, a2, OS_LOG_TYPE_ERROR, "requestWithData: passed NSData with only %lu bytes", (uint8_t *)&v3, 0xCu);
}

- (void)internalFlags
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid intflags", v2, v3, v4, v5, v6);
}

- (void)uid
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid uid", v2, v3, v4, v5, v6);
}

- (void)gid
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid gid", v2, v3, v4, v5, v6);
}

- (void)mode
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid mode", v2, v3, v4, v5, v6);
}

- (void)linkCount
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid nlink", v2, v3, v4, v5, v6);
}

- (void)flags
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid flags", v2, v3, v4, v5, v6);
}

- (void)size
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid size", v2, v3, v4, v5, v6);
}

- (void)allocSize
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid allocSize", v2, v3, v4, v5, v6);
}

- (void)fileID
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid fileID", v2, v3, v4, v5, v6);
}

- (void)parentID
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid parentid", v2, v3, v4, v5, v6);
}

- (void)type
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid type", v2, v3, v4, v5, v6);
}

- (void)modifyTime
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid modify time", v2, v3, v4, v5, v6);
}

- (void)accessTime
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid access time", v2, v3, v4, v5, v6);
}

- (void)changeTime
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid change time", v2, v3, v4, v5, v6);
}

- (void)addedTime
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid added time", v2, v3, v4, v5, v6);
}

- (void)backupTime
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid backup time", v2, v3, v4, v5, v6);
}

- (void)birthTime
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_24DDB2000, v0, v1, "Accessing invalid birth time", v2, v3, v4, v5, v6);
}

@end