@interface ENExposureDetectionDaemonSessionStatistics
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)droppedCachedKeyUpdatesCount;
- (unint64_t)droppedKeyCount;
- (unint64_t)fileInvalidKeyCount;
- (unint64_t)fileKeyCount;
- (unint64_t)invalidFileSignatureCount;
- (unint64_t)matchedKeyCount;
- (unint64_t)newCachedKeyCount;
- (unint64_t)processedFileCount;
- (unint64_t)revokedKeyCount;
- (unint64_t)updatedCachedKeyCount;
- (void)setDroppedCachedKeyUpdatesCount:(unint64_t)a3;
- (void)setDroppedKeyCount:(unint64_t)a3;
- (void)setFileInvalidKeyCount:(unint64_t)a3;
- (void)setFileKeyCount:(unint64_t)a3;
- (void)setInvalidFileSignatureCount:(unint64_t)a3;
- (void)setMatchedKeyCount:(unint64_t)a3;
- (void)setNewCachedKeyCount:(unint64_t)a3;
- (void)setProcessedFileCount:(unint64_t)a3;
- (void)setRevokedKeyCount:(unint64_t)a3;
- (void)setUpdatedCachedKeyCount:(unint64_t)a3;
@end

@implementation ENExposureDetectionDaemonSessionStatistics

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init(ENExposureDetectionDaemonSessionStatistics);
  *((void *)result + 2) = self->_droppedCachedKeyUpdatesCount;
  *((void *)result + 1) = self->_droppedKeyCount;
  *((void *)result + 3) = self->_fileKeyCount;
  *((void *)result + 4) = self->_fileInvalidKeyCount;
  *((void *)result + 5) = self->_invalidFileSignatureCount;
  *((void *)result + 6) = self->_matchedKeyCount;
  *((void *)result + 7) = self->_newCachedKeyCount;
  *((void *)result + 8) = self->_processedFileCount;
  *((void *)result + 9) = self->_revokedKeyCount;
  *((void *)result + 10) = self->_updatedCachedKeyCount;
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v3);
  NSAppendPrintF_safe();
  id v4 = 0;

  if (self->_processedFileCount)
  {
    NSAppendPrintF_safe();
    id v5 = v4;

    NSAppendPrintF_safe();
    id v4 = v5;

    if (self->_fileInvalidKeyCount)
    {
      NSAppendPrintF_safe();
      id v6 = v4;

      id v4 = v6;
    }
  }
  if (self->_invalidFileSignatureCount)
  {
    NSAppendPrintF_safe();
    id v7 = v4;

    id v4 = v7;
  }
  NSAppendPrintF_safe();
  id v8 = v4;

  if (self->_revokedKeyCount)
  {
    NSAppendPrintF_safe();
    id v9 = v8;

    id v8 = v9;
  }
  if (self->_droppedKeyCount)
  {
    NSAppendPrintF_safe();
    id v10 = v8;

    id v8 = v10;
  }
  if (self->_newCachedKeyCount)
  {
    NSAppendPrintF_safe();
    id v11 = v8;

    id v8 = v11;
  }
  if (self->_updatedCachedKeyCount)
  {
    NSAppendPrintF_safe();
    id v12 = v8;

    id v8 = v12;
  }
  if (self->_droppedCachedKeyUpdatesCount)
  {
    NSAppendPrintF_safe();
    id v13 = v8;

    id v8 = v13;
  }

  return v8;
}

- (unint64_t)droppedKeyCount
{
  return self->_droppedKeyCount;
}

- (void)setDroppedKeyCount:(unint64_t)a3
{
  self->_droppedKeyCount = a3;
}

- (unint64_t)droppedCachedKeyUpdatesCount
{
  return self->_droppedCachedKeyUpdatesCount;
}

- (void)setDroppedCachedKeyUpdatesCount:(unint64_t)a3
{
  self->_droppedCachedKeyUpdatesCount = a3;
}

- (unint64_t)fileKeyCount
{
  return self->_fileKeyCount;
}

- (void)setFileKeyCount:(unint64_t)a3
{
  self->_fileKeyCount = a3;
}

- (unint64_t)fileInvalidKeyCount
{
  return self->_fileInvalidKeyCount;
}

- (void)setFileInvalidKeyCount:(unint64_t)a3
{
  self->_fileInvalidKeyCount = a3;
}

- (unint64_t)invalidFileSignatureCount
{
  return self->_invalidFileSignatureCount;
}

- (void)setInvalidFileSignatureCount:(unint64_t)a3
{
  self->_invalidFileSignatureCount = a3;
}

- (unint64_t)matchedKeyCount
{
  return self->_matchedKeyCount;
}

- (void)setMatchedKeyCount:(unint64_t)a3
{
  self->_matchedKeyCount = a3;
}

- (unint64_t)newCachedKeyCount
{
  return self->_newCachedKeyCount;
}

- (void)setNewCachedKeyCount:(unint64_t)a3
{
  self->_newCachedKeyCount = a3;
}

- (unint64_t)processedFileCount
{
  return self->_processedFileCount;
}

- (void)setProcessedFileCount:(unint64_t)a3
{
  self->_processedFileCount = a3;
}

- (unint64_t)revokedKeyCount
{
  return self->_revokedKeyCount;
}

- (void)setRevokedKeyCount:(unint64_t)a3
{
  self->_revokedKeyCount = a3;
}

- (unint64_t)updatedCachedKeyCount
{
  return self->_updatedCachedKeyCount;
}

- (void)setUpdatedCachedKeyCount:(unint64_t)a3
{
  self->_updatedCachedKeyCount = a3;
}

@end