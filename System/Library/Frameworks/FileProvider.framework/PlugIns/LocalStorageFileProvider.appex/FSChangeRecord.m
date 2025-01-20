@interface FSChangeRecord
- (BOOL)isBarrier;
- (BOOL)isNotification;
- (FSChangeRecord)initWithPath:(id)a3 fileID:(unint64_t)a4 flags:(unsigned int)a5 eventID:(unint64_t)a6;
- (NSString)path;
- (NSUUID)barrierUUID;
- (id)description;
- (unint64_t)eventID;
- (unint64_t)fileID;
- (unsigned)additionalDebugFlags;
- (unsigned)additionalDebugFlagsForHistoricalStream:(BOOL)a3;
- (unsigned)flags;
- (unsigned)rawFlags;
- (void)setPath:(id)a3;
@end

@implementation FSChangeRecord

- (unsigned)flags
{
  unsigned int v3 = [(FSChangeRecord *)self isBarrier];
  unsigned int rawFlags = self->_rawFlags;
  if ((rawFlags & 0x9000) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = v3;
  }
  if (v5) {
    return rawFlags & 0xFFF7FFFF;
  }
  else {
    return self->_rawFlags;
  }
}

- (FSChangeRecord)initWithPath:(id)a3 fileID:(unint64_t)a4 flags:(unsigned int)a5 eventID:(unint64_t)a6
{
  id v11 = a3;
  v20.receiver = self;
  v20.super_class = (Class)FSChangeRecord;
  v12 = [(FSChangeRecord *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_path, a3);
    v13->_fileID = a4;
    v13->_unsigned int rawFlags = a5;
    v13->_eventID = a6;
    uint64_t v14 = objc_msgSend(v11, "fpfs_extractFSEventsBarrierUUID");
    barrierUUID = v13->_barrierUUID;
    v13->_barrierUUID = (NSUUID *)v14;

    v16 = objc_msgSend(v11, "fpfs_extractFSEventsNotifyUUID");

    if (v16)
    {
      v13->_isNotification = 1;
      uint64_t v17 = [v11 stringByDeletingLastPathComponent];
      path = v13->_path;
      v13->_path = (NSString *)v17;
    }
  }

  return v13;
}

- (BOOL)isBarrier
{
  return self->_barrierUUID != 0;
}

- (unsigned)additionalDebugFlagsForHistoricalStream:(BOOL)a3
{
  BOOL v3 = a3;
  if (!os_variant_has_internal_content()
    || (self->_rawFlags & 0x80000) != 0
    || ![(NSString *)self->_path hasSuffix:@"-fail-with-dropped"])
  {
    return 0;
  }
  int v5 = [(NSString *)self->_path lastPathComponent];
  if ([v5 containsString:@"kernel"])
  {
    unsigned int v6 = 4;
  }
  else
  {
    if (v3) {
      CFStringRef v8 = @"historical";
    }
    else {
      CFStringRef v8 = @"live";
    }
    if ([v5 containsString:v8]) {
      unsigned int v6 = 2;
    }
    else {
      unsigned int v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t eventID = self->_eventID;
  unint64_t fileID = self->_fileID;
  unsigned int v6 = +[NSString fpfs_initWithFSEventsFlags:self->_rawFlags];
  v7 = [(NSString *)self->_path fp_prettyPath];
  CFStringRef v8 = +[NSString stringWithFormat:@"<%@ #%llu fileID:%llu flags:%@ path:'%@'>", v3, eventID, fileID, v6, v7];

  return v8;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unsigned)rawFlags
{
  return self->_rawFlags;
}

- (unint64_t)eventID
{
  return self->_eventID;
}

- (NSUUID)barrierUUID
{
  return self->_barrierUUID;
}

- (BOOL)isNotification
{
  return self->_isNotification;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (unsigned)additionalDebugFlags
{
  return self->_additionalDebugFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barrierUUID, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end