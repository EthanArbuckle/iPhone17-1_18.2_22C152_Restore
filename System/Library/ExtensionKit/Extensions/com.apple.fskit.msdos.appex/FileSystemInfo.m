@interface FileSystemInfo
- (BOOL)isClusterValid:(unsigned int)a3;
- (BOOL)isFAT12Or16;
- (BOOL)serialNumberExists;
- (BOOL)uuidExists;
- (BOOL)volumeLabelExists;
- (FSVolumeIdentifier)uuid;
- (NSMutableData)fsInfoSector;
- (NSNumber)fsSubTypeNum;
- (NSString)fsSubTypeName;
- (NSString)fsTypeName;
- (NSString)volumeLabel;
- (unint64_t)dirBlockSize;
- (unint64_t)fatOffset;
- (unint64_t)fatSize;
- (unint64_t)fileSizeInBits;
- (unint64_t)freeClusters;
- (unint64_t)maxValidCluster;
- (unint64_t)metaDataZoneSize;
- (unint64_t)offsetForCluster:(unint64_t)a3;
- (unint64_t)offsetForDirBlock:(unint64_t)a3;
- (unint64_t)rootDirBytes;
- (unsigned)FATMask;
- (unsigned)bytesPerCluster;
- (unsigned)bytesPerSector;
- (unsigned)dirtyBitValue;
- (unsigned)firstClusterOffset;
- (unsigned)firstDirBlockNum;
- (unsigned)firstFreeCluster;
- (unsigned)fsInfoSectorNumber;
- (unsigned)numOfFATs;
- (unsigned)rootDirSize;
- (unsigned)rootFirstCluster;
- (unsigned)rootSector;
- (unsigned)serialNumber;
- (unsigned)type;
- (void)setBytesPerCluster:(unsigned int)a3;
- (void)setBytesPerSector:(unsigned int)a3;
- (void)setDirBlockSize:(unint64_t)a3;
- (void)setDirtyBitValue:(unsigned __int8)a3;
- (void)setFATMask:(unsigned int)a3;
- (void)setFatOffset:(unint64_t)a3;
- (void)setFatSize:(unint64_t)a3;
- (void)setFirstClusterOffset:(unsigned int)a3;
- (void)setFirstDirBlockNum:(unsigned int)a3;
- (void)setFirstFreeCluster:(unsigned int)a3;
- (void)setFreeClusters:(unint64_t)a3;
- (void)setFsInfoSector:(id)a3;
- (void)setFsInfoSectorNumber:(unsigned int)a3;
- (void)setFsSubTypeName:(id)a3;
- (void)setFsSubTypeNum:(id)a3;
- (void)setFsTypeName:(id)a3;
- (void)setMaxValidCluster:(unint64_t)a3;
- (void)setMetaDataZoneSize:(unint64_t)a3;
- (void)setNumOfFATs:(unsigned __int8)a3;
- (void)setRootDirSize:(unsigned int)a3;
- (void)setRootFirstCluster:(unsigned int)a3;
- (void)setRootSector:(unsigned int)a3;
- (void)setSerialNumber:(unsigned int)a3;
- (void)setSerialNumberExists:(BOOL)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setUuid:(id)a3;
- (void)setUuidExists:(BOOL)a3;
- (void)setVolumeLabel:(id)a3;
- (void)setVolumeLabelExists:(BOOL)a3;
@end

@implementation FileSystemInfo

- (unint64_t)offsetForCluster:(unint64_t)a3
{
  unint64_t v4 = a3 - 2;
  uint64_t v5 = [(FileSystemInfo *)self bytesPerCluster];
  unsigned int v6 = [(FileSystemInfo *)self firstClusterOffset];
  return [(FileSystemInfo *)self bytesPerSector] * v6 + v4 * v5;
}

- (unint64_t)offsetForDirBlock:(unint64_t)a3
{
  unint64_t v4 = a3 - [(FileSystemInfo *)self firstDirBlockNum];
  unint64_t v5 = [(FileSystemInfo *)self dirBlockSize];
  unsigned int v6 = [(FileSystemInfo *)self firstClusterOffset];
  return [(FileSystemInfo *)self bytesPerSector] * v6 + v4 * v5;
}

- (BOOL)isClusterValid:(unsigned int)a3
{
  return a3 >= 2 && [(FileSystemInfo *)self maxValidCluster] >= a3;
}

- (BOOL)isFAT12Or16
{
  return ![(FileSystemInfo *)self type] || [(FileSystemInfo *)self type] == 1;
}

- (unint64_t)rootDirBytes
{
  if (![(FileSystemInfo *)self isFAT12Or16]) {
    return 0;
  }
  unsigned int v3 = [(FileSystemInfo *)self rootDirSize];
  return [(FileSystemInfo *)self bytesPerSector] * (unint64_t)v3;
}

- (unint64_t)fileSizeInBits
{
  return 33;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (unsigned)FATMask
{
  return self->_FATMask;
}

- (void)setFATMask:(unsigned int)a3
{
  self->_FATMask = a3;
}

- (unsigned)dirtyBitValue
{
  return self->_dirtyBitValue;
}

- (void)setDirtyBitValue:(unsigned __int8)a3
{
  self->_dirtyBitValue = a3;
}

- (unint64_t)dirBlockSize
{
  return self->_dirBlockSize;
}

- (void)setDirBlockSize:(unint64_t)a3
{
  self->_dirBlockSize = a3;
}

- (unsigned)bytesPerSector
{
  return self->_bytesPerSector;
}

- (void)setBytesPerSector:(unsigned int)a3
{
  self->_bytesPerSector = a3;
}

- (unsigned)bytesPerCluster
{
  return self->_bytesPerCluster;
}

- (void)setBytesPerCluster:(unsigned int)a3
{
  self->_bytesPerCluster = a3;
}

- (unsigned)firstFreeCluster
{
  return self->_firstFreeCluster;
}

- (void)setFirstFreeCluster:(unsigned int)a3
{
  self->_firstFreeCluster = a3;
}

- (unsigned)firstClusterOffset
{
  return self->_firstClusterOffset;
}

- (void)setFirstClusterOffset:(unsigned int)a3
{
  self->_firstClusterOffset = a3;
}

- (unint64_t)maxValidCluster
{
  return self->_maxValidCluster;
}

- (void)setMaxValidCluster:(unint64_t)a3
{
  self->_maxValidCluster = a3;
}

- (unsigned)firstDirBlockNum
{
  return self->_firstDirBlockNum;
}

- (void)setFirstDirBlockNum:(unsigned int)a3
{
  self->_firstDirBlockNum = a3;
}

- (unint64_t)freeClusters
{
  return self->_freeClusters;
}

- (void)setFreeClusters:(unint64_t)a3
{
  self->_freeClusters = a3;
}

- (unsigned)rootFirstCluster
{
  return self->_rootFirstCluster;
}

- (void)setRootFirstCluster:(unsigned int)a3
{
  self->_rootFirstCluster = a3;
}

- (unsigned)numOfFATs
{
  return self->_numOfFATs;
}

- (void)setNumOfFATs:(unsigned __int8)a3
{
  self->_numOfFATs = a3;
}

- (unsigned)rootSector
{
  return self->_rootSector;
}

- (void)setRootSector:(unsigned int)a3
{
  self->_rootSector = a3;
}

- (NSString)fsTypeName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFsTypeName:(id)a3
{
}

- (NSString)fsSubTypeName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setFsSubTypeName:(id)a3
{
}

- (NSNumber)fsSubTypeNum
{
  return (NSNumber *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFsSubTypeNum:(id)a3
{
}

- (NSString)volumeLabel
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setVolumeLabel:(id)a3
{
}

- (BOOL)volumeLabelExists
{
  return self->_volumeLabelExists;
}

- (void)setVolumeLabelExists:(BOOL)a3
{
  self->_volumeLabelExists = a3;
}

- (unsigned)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(unsigned int)a3
{
  self->_serialNumber = a3;
}

- (BOOL)serialNumberExists
{
  return self->_serialNumberExists;
}

- (void)setSerialNumberExists:(BOOL)a3
{
  self->_serialNumberExists = a3;
}

- (FSVolumeIdentifier)uuid
{
  return (FSVolumeIdentifier *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUuid:(id)a3
{
}

- (BOOL)uuidExists
{
  return self->_uuidExists;
}

- (void)setUuidExists:(BOOL)a3
{
  self->_uuidExists = a3;
}

- (unint64_t)fatOffset
{
  return self->_fatOffset;
}

- (void)setFatOffset:(unint64_t)a3
{
  self->_fatOffset = a3;
}

- (unint64_t)fatSize
{
  return self->_fatSize;
}

- (void)setFatSize:(unint64_t)a3
{
  self->_fatSize = a3;
}

- (unsigned)rootDirSize
{
  return self->_rootDirSize;
}

- (void)setRootDirSize:(unsigned int)a3
{
  self->_rootDirSize = a3;
}

- (unint64_t)metaDataZoneSize
{
  return self->_metaDataZoneSize;
}

- (void)setMetaDataZoneSize:(unint64_t)a3
{
  self->_metaDataZoneSize = a3;
}

- (unsigned)fsInfoSectorNumber
{
  return self->_fsInfoSectorNumber;
}

- (void)setFsInfoSectorNumber:(unsigned int)a3
{
  self->_fsInfoSectorNumber = a3;
}

- (NSMutableData)fsInfoSector
{
  return (NSMutableData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setFsInfoSector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fsInfoSector, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_volumeLabel, 0);
  objc_storeStrong((id *)&self->_fsSubTypeNum, 0);
  objc_storeStrong((id *)&self->_fsSubTypeName, 0);

  objc_storeStrong((id *)&self->_fsTypeName, 0);
}

@end