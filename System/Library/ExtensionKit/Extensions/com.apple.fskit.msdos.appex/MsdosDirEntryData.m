@interface MsdosDirEntryData
- (MsdosDirEntryData)init;
- (MsdosDirEntryData)initWithData:(id)a3;
- (char)getName;
- (id)setBsdFlags:(unsigned int)a3;
- (int64_t)type;
- (unint64_t)calcFirstEntryOffsetInVolume:(id)a3;
- (unint64_t)dosDirEntryDirBlockNum;
- (unint64_t)dosDirEntryOffsetInDirBlock;
- (unint64_t)getSize;
- (unsigned)bsdFlags;
- (unsigned)getAttrFlags;
- (unsigned)getFirstCluster:(id)a3;
- (void)getAccessTime:(timespec *)a3;
- (void)getBirthTime:(timespec *)a3;
- (void)getChangeTime:(timespec *)a3;
- (void)getModifyTime:(timespec *)a3;
- (void)setAccessTime:(timespec *)a3;
- (void)setArchiveBit;
- (void)setAttrFlags:(unsigned __int8)a3;
- (void)setBirthTime:(timespec *)a3;
- (void)setChangeTime:(timespec *)a3;
- (void)setDosDirEntryDirBlockNum:(unint64_t)a3;
- (void)setDosDirEntryOffsetInDirBlock:(unint64_t)a3;
- (void)setFirstCluster:(unsigned int)a3 fileSystemInfo:(id)a4;
- (void)setLowerCaseFlags:(unsigned __int8)a3;
- (void)setModifyTime:(timespec *)a3;
- (void)setName:(char *)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation MsdosDirEntryData

- (MsdosDirEntryData)initWithData:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MsdosDirEntryData;
  v5 = [(MsdosDirEntryData *)&v8 init];
  if (v5)
  {
    v6 = +[NSMutableData dataWithData:v4];
    [(DirEntryData *)v5 setData:v6];
  }
  return v5;
}

- (MsdosDirEntryData)init
{
  v5.receiver = self;
  v5.super_class = (Class)MsdosDirEntryData;
  v2 = [(MsdosDirEntryData *)&v5 init];
  if (v2)
  {
    v3 = +[NSMutableData dataWithLength:32];
    [(DirEntryData *)v2 setData:v3];
  }
  return v2;
}

- (unint64_t)calcFirstEntryOffsetInVolume:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(MsdosDirEntryData *)self dosDirEntryDirBlockNum];
  id v6 = [v4 dirBlockSize];

  return [(MsdosDirEntryData *)self dosDirEntryOffsetInDirBlock] + (void)v6 * v5;
}

- (int64_t)type
{
  id v2 = [(DirEntryData *)self data];
  v3 = [v2 bytes];

  if ((v3[11] & 0x10) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (unsigned)bsdFlags
{
  id v2 = [(DirEntryData *)self data];
  v3 = (unsigned __int8 *)[v2 bytes];

  unsigned int v4 = v3[11];
  if ((v4 & 0x11111111) == 1) {
    int v5 = (((v4 & 0x30) == 0) << 16) | 2;
  }
  else {
    int v5 = ((v4 & 0x30) == 0) << 16;
  }
  return v5 & 0xFFFF7FFF | (((v4 >> 1) & 1) << 15);
}

- (id)setBsdFlags:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(DirEntryData *)self data];
  id v6 = [v5 bytes];

  int64_t v7 = [(MsdosDirEntryData *)self type];
  if ((v3 & 0xFFFC7FFD) != 0)
  {
    objc_super v8 = fskit_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100030A28(v3, v8, v9, v10, v11, v12, v13, v14);
    }

    v15 = fs_errorForPOSIXError();
  }
  else
  {
    unsigned int v16 = v6[11] & 0xFD | (2 * ((v3 >> 15) & 1));
    v6[11] = v6[11] & 0xFD | (2 * ((v3 & 0x8000) != 0));
    if (v7 == 2)
    {
      v15 = 0;
    }
    else
    {
      char v17 = v16 & 0xFE | ((v3 & 0x20002) != 0);
      v15 = 0;
      if ((v3 & 0x10000) != 0) {
        char v18 = v17 & 0xDF;
      }
      else {
        char v18 = v17 | 0x20;
      }
      v6[11] = v18;
    }
  }

  return v15;
}

- (void)getAccessTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = (unsigned __int16 *)[v4 bytes];

  uint64_t v6 = v5[9];

  msdosfs_dos2unixtime(v6, 0, 0, a3);
}

- (void)setAccessTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  msdosfs_unix2dostime(&a3->tv_sec, v5 + 9, 0, 0);
}

- (void)getModifyTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = (unsigned __int16 *)[v4 bytes];

  uint64_t v6 = v5[12];
  unsigned int v7 = v5[11];

  msdosfs_dos2unixtime(v6, v7, 0, a3);
}

- (void)setModifyTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  msdosfs_unix2dostime(&a3->tv_sec, v5 + 12, v5 + 11, 0);
}

- (void)getChangeTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = (unsigned __int16 *)[v4 bytes];

  uint64_t v6 = v5[12];
  unsigned int v7 = v5[11];

  msdosfs_dos2unixtime(v6, v7, 0, a3);
}

- (void)setChangeTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  msdosfs_unix2dostime(&a3->tv_sec, v5 + 12, v5 + 11, 0);
}

- (void)getBirthTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = (unsigned __int16 *)[v4 bytes];

  uint64_t v6 = v5[8];
  unsigned int v7 = v5[7];

  msdosfs_dos2unixtime(v6, v7, 0, a3);
}

- (void)setBirthTime:(timespec *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  msdosfs_unix2dostime(&a3->tv_sec, v5 + 8, v5 + 7, (unsigned char *)v5 + 13);
}

- (unsigned)getFirstCluster:(id)a3
{
  id v4 = a3;
  id v5 = [(DirEntryData *)self data];
  uint64_t v6 = (unsigned __int16 *)[v5 bytes];

  unsigned int v7 = v6[13];
  unsigned int v8 = [v4 type];

  if (v8 == 2) {
    v7 |= v6[10] << 16;
  }
  return v7;
}

- (void)setFirstCluster:(unsigned int)a3 fileSystemInfo:(id)a4
{
  id v6 = a4;
  id v7 = [(DirEntryData *)self data];
  unsigned int v8 = [v7 mutableBytes];

  v8[13] = a3;
  LODWORD(v7) = [v6 type];

  if (v7 == 2) {
    v8[10] = HIWORD(a3);
  }
}

- (char)getName
{
  id v2 = [(DirEntryData *)self data];
  uint64_t v3 = (char *)[v2 mutableBytes];

  return v3;
}

- (void)setName:(char *)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = (char *)[v4 mutableBytes];

  uint64_t v6 = *(void *)a3;
  *(_DWORD *)(v5 + 7) = *(_DWORD *)(a3 + 7);
  *(void *)id v5 = v6;
}

- (unint64_t)getSize
{
  id v2 = [(DirEntryData *)self data];
  uint64_t v3 = (unsigned int *)[v2 bytes];

  return v3[7];
}

- (void)setSize:(unint64_t)a3
{
  int v3 = a3;
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  v5[7] = v3;
}

- (void)setLowerCaseFlags:(unsigned __int8)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  v5[12] = a3;
}

- (void)setAttrFlags:(unsigned __int8)a3
{
  id v4 = [(DirEntryData *)self data];
  id v5 = [v4 mutableBytes];

  v5[11] = a3;
}

- (unsigned)getAttrFlags
{
  id v2 = [(DirEntryData *)self data];
  int v3 = [v2 mutableBytes];

  return v3[11];
}

- (void)setArchiveBit
{
  id v3 = [(DirEntryData *)self data];
  id v4 = [v3 mutableBytes];

  if ((id)[(MsdosDirEntryData *)self type] != (id)2) {
    v4[11] |= 0x20u;
  }
}

- (unint64_t)dosDirEntryOffsetInDirBlock
{
  return self->_dosDirEntryOffsetInDirBlock;
}

- (void)setDosDirEntryOffsetInDirBlock:(unint64_t)a3
{
  self->_dosDirEntryOffsetInDirBlock = a3;
}

- (unint64_t)dosDirEntryDirBlockNum
{
  return self->_dosDirEntryDirBlockNum;
}

- (void)setDosDirEntryDirBlockNum:(unint64_t)a3
{
  self->_dosDirEntryDirBlockNum = a3;
}

@end