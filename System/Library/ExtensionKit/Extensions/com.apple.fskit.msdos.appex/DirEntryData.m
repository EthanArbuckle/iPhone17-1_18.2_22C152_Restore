@interface DirEntryData
+ (id)dynamicCast:(id)a3;
- (DirEntryData)initWithData:(id)a3;
- (NSMutableData)data;
- (char)getName;
- (id)setBsdFlags:(unsigned int)a3;
- (int64_t)type;
- (unint64_t)calcFirstEntryOffsetInVolume:(id)a3;
- (unint64_t)firstEntryOffsetInDir;
- (unint64_t)getSize;
- (unint64_t)getValidDataLength;
- (unsigned)bsdFlags;
- (unsigned)getFirstCluster:(id)a3;
- (unsigned)numberOfDirEntries;
- (void)setData:(id)a3;
- (void)setFirstEntryOffsetInDir:(unint64_t)a3;
- (void)setNumberOfDirEntries:(unsigned __int16)a3;
@end

@implementation DirEntryData

+ (id)dynamicCast:(id)a3
{
  id v3 = a3;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (DirEntryData)initWithData:(id)a3
{
  return 0;
}

- (int64_t)type
{
  return 0;
}

- (unsigned)bsdFlags
{
  return 0;
}

- (id)setBsdFlags:(unsigned int)a3
{
  return (id)fs_errorForPOSIXError();
}

- (unsigned)getFirstCluster:(id)a3
{
  return 0;
}

- (char)getName
{
  return 0;
}

- (unint64_t)getSize
{
  return 0;
}

- (unint64_t)getValidDataLength
{
  return 0;
}

- (unint64_t)calcFirstEntryOffsetInVolume:(id)a3
{
  return 0;
}

- (NSMutableData)data
{
  return (NSMutableData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setData:(id)a3
{
}

- (unsigned)numberOfDirEntries
{
  return self->_numberOfDirEntries;
}

- (void)setNumberOfDirEntries:(unsigned __int16)a3
{
  self->_numberOfDirEntries = a3;
}

- (unint64_t)firstEntryOffsetInDir
{
  return self->_firstEntryOffsetInDir;
}

- (void)setFirstEntryOffsetInDir:(unint64_t)a3
{
  self->_firstEntryOffsetInDir = a3;
}

- (void).cxx_destruct
{
}

@end