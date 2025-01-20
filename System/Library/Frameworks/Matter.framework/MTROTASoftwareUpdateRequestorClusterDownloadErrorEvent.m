@interface MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent
- (MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent)init;
- (NSNumber)bytesDownloaded;
- (NSNumber)platformCode;
- (NSNumber)progressPercent;
- (NSNumber)softwareVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBytesDownloaded:(NSNumber *)bytesDownloaded;
- (void)setPlatformCode:(NSNumber *)platformCode;
- (void)setProgressPercent:(NSNumber *)progressPercent;
- (void)setSoftwareVersion:(NSNumber *)softwareVersion;
@end

@implementation MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent

- (MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent;
  v2 = [(MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent *)&v9 init];
  v3 = v2;
  if (v2)
  {
    softwareVersion = v2->_softwareVersion;
    v2->_softwareVersion = (NSNumber *)&unk_26F9C8620;

    bytesDownloaded = v3->_bytesDownloaded;
    v3->_bytesDownloaded = (NSNumber *)&unk_26F9C8620;

    progressPercent = v3->_progressPercent;
    v3->_progressPercent = 0;

    platformCode = v3->_platformCode;
    v3->_platformCode = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent);
  v7 = objc_msgSend_softwareVersion(self, v5, v6);
  objc_msgSend_setSoftwareVersion_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_bytesDownloaded(self, v9, v10);
  objc_msgSend_setBytesDownloaded_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_progressPercent(self, v13, v14);
  objc_msgSend_setProgressPercent_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_platformCode(self, v17, v18);
  objc_msgSend_setPlatformCode_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: softwareVersion:%@; bytesDownloaded:%@; progressPercent:%@; platformCode:%@; >",
    v5,
    self->_softwareVersion,
    self->_bytesDownloaded,
    self->_progressPercent,
  v7 = self->_platformCode);

  return v7;
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
}

- (NSNumber)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(NSNumber *)bytesDownloaded
{
}

- (NSNumber)progressPercent
{
  return self->_progressPercent;
}

- (void)setProgressPercent:(NSNumber *)progressPercent
{
}

- (NSNumber)platformCode
{
  return self->_platformCode;
}

- (void)setPlatformCode:(NSNumber *)platformCode
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformCode, 0);
  objc_storeStrong((id *)&self->_progressPercent, 0);
  objc_storeStrong((id *)&self->_bytesDownloaded, 0);

  objc_storeStrong((id *)&self->_softwareVersion, 0);
}

@end