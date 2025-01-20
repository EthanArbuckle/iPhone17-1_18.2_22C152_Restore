@interface CLEEDMediaItem
+ (BOOL)supportsSecureCoding;
+ (id)createMediaItemFromDict:(id)a3;
- (BOOL)didApplyDelayMitigation;
- (BOOL)isEqual:(id)a3;
- (BOOL)metricProcessed;
- (CLEEDMediaItem)initWithCoder:(id)a3;
- (CLEEDMediaItem)initWithURL:(id)a3 assetIdentifier:(id)a4 sandboxExtension:(id)a5 mediaType:(int64_t)a6;
- (CLEEDMediaItem)initWithURL:(id)a3 sandboxExtension:(id)a4 mediaType:(int64_t)a5;
- (NSData)authTag;
- (NSString)assetIdentifier;
- (NSString)mediaItemFormat;
- (NSString)sandboxExtension;
- (NSURL)URL;
- (NSURL)encryptedFileURL;
- (NSURL)stagingURL;
- (NSUUID)mediaItemID;
- (id)createMediaItemDict;
- (id)description;
- (int64_t)durationCopyMs;
- (int64_t)durationEncryptionMs;
- (int64_t)durationTranscodeMs;
- (int64_t)durationUploadMs;
- (int64_t)serverUploadStatus;
- (int64_t)type;
- (int64_t)uploadStatus;
- (unint64_t)hash;
- (unint64_t)mediaItemSizeBytes;
- (unint64_t)originalSizeBytes;
- (unint64_t)uploadAttempts;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAuthTag:(id)a3;
- (void)setDidApplyDelayMitigation:(BOOL)a3;
- (void)setDurationCopyMs:(int64_t)a3;
- (void)setDurationEncryptionMs:(int64_t)a3;
- (void)setDurationTranscodeMs:(int64_t)a3;
- (void)setDurationUploadMs:(int64_t)a3;
- (void)setEncryptedFileURL:(id)a3;
- (void)setMediaItemFormat:(id)a3;
- (void)setMediaItemID:(id)a3;
- (void)setMediaItemSizeBytes:(unint64_t)a3;
- (void)setMetricProcessed:(BOOL)a3;
- (void)setOriginalSizeBytes:(unint64_t)a3;
- (void)setServerUploadStatus:(int64_t)a3;
- (void)setStagingURL:(id)a3;
- (void)setUploadAttempts:(unint64_t)a3;
- (void)setUploadStatus:(int64_t)a3;
@end

@implementation CLEEDMediaItem

- (CLEEDMediaItem)initWithURL:(id)a3 sandboxExtension:(id)a4 mediaType:(int64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v9 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446978;
    v13 = "-[CLEEDMediaItem initWithURL:sandboxExtension:mediaType:]";
    __int16 v14 = 2114;
    id v15 = a3;
    __int16 v16 = 2114;
    id v17 = a4;
    __int16 v18 = 2050;
    int64_t v19 = a5;
    _os_log_impl(&dword_1906B8000, v9, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[URL:%{public}@,Token:%{public}@,Type:%{public}lu]", buf, 0x2Au);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v11 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMediaItem initWithURL:sandboxExtension:mediaType:]", "CoreLocation: %s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  return [(CLEEDMediaItem *)self initWithURL:a3 assetIdentifier:0 sandboxExtension:a4 mediaType:a5];
}

- (CLEEDMediaItem)initWithURL:(id)a3 assetIdentifier:(id)a4 sandboxExtension:(id)a5 mediaType:(int64_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (qword_1E929F608 != -1) {
    dispatch_once(&qword_1E929F608, &unk_1EE005660);
  }
  v11 = qword_1E929F600;
  if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136447234;
    v29 = "-[CLEEDMediaItem initWithURL:assetIdentifier:sandboxExtension:mediaType:]";
    __int16 v30 = 2114;
    id v31 = a3;
    __int16 v32 = 2114;
    id v33 = a4;
    __int16 v34 = 2114;
    id v35 = a5;
    __int16 v36 = 2050;
    int64_t v37 = a6;
    _os_log_impl(&dword_1906B8000, v11, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[URL:%{public}@,assetIdentifier:%{public}@,Token:%{public}@,Type:%{public}lu]", buf, 0x34u);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    int v18 = 136447234;
    int64_t v19 = "-[CLEEDMediaItem initWithURL:assetIdentifier:sandboxExtension:mediaType:]";
    __int16 v20 = 2114;
    id v21 = a3;
    __int16 v22 = 2114;
    id v23 = a4;
    __int16 v24 = 2114;
    id v25 = a5;
    __int16 v26 = 2050;
    int64_t v27 = a6;
    __int16 v16 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLEEDMediaItem initWithURL:assetIdentifier:sandboxExtension:mediaType:]", "CoreLocation: %s\n", v16);
    if (v16 != (char *)buf) {
      free(v16);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)CLEEDMediaItem;
  v12 = [(CLEEDMediaItem *)&v17 init];
  if (v12)
  {
    *((void *)v12 + 4) = a3;
    *((void *)v12 + 6) = a5;
    *((void *)v12 + 5) = a4;
    *((void *)v12 + 2) = a6;
    *((void *)v12 + 3) = 0;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *((void *)v12 + 14) = -1;
    uint64_t v13 = [[NSString alloc] initWithUTF8String:"notset"];
    *((void *)v12 + 15) = 0;
    *((void *)v12 + 12) = 0;
    *((void *)v12 + 13) = 0;
    *((void *)v12 + 11) = v13;
    *(void *)&long long v14 = -1;
    *((void *)&v14 + 1) = -1;
    *((_OWORD *)v12 + 8) = v14;
    *((_OWORD *)v12 + 9) = v14;
    *((_WORD *)v12 + 4) = 0;
  }
  return (CLEEDMediaItem *)v12;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLEEDMediaItem;
  [(CLEEDMediaItem *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@" <CLEEDMediaItem: URL, %@, stagingURL, %@, mediaID, %@, encryptedURL, %@, mediaType, %lu, uploadStatus, %lu>", -[CLEEDMediaItem URL](self, "URL"), -[CLEEDMediaItem stagingURL](self, "stagingURL"), -[CLEEDMediaItem mediaItemID](self, "mediaItemID"), -[CLEEDMediaItem encryptedFileURL](self, "encryptedFileURL"), -[CLEEDMediaItem type](self, "type"), -[CLEEDMediaItem uploadStatus](self, "uploadStatus")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_URL forKey:@"placeholderURL"];
  [a3 encodeObject:self->_stagingURL forKey:@"stagingURL"];
  [a3 encodeObject:self->_encryptedFileURL forKey:@"encryptedURL"];
  [a3 encodeObject:self->_authTag forKey:@"authTag"];
  [a3 encodeObject:self->_assetIdentifier forKey:@"assetIdentifier"];
  [a3 encodeObject:self->_mediaItemID forKey:@"mediaUUID"];
  [a3 encodeObject:self->_sandboxExtension forKey:@"sandboxExtension"];
  [a3 encodeInteger:self->_type forKey:@"mediaType"];
  [a3 encodeInteger:self->_uploadStatus forKey:@"uploadStatus"];
  [a3 encodeObject:self->_mediaItemFormat forKey:@"mediaItemFormat"];
  [a3 encodeInteger:self->_mediaItemSizeBytes forKey:@"mediaItemSizeBytes"];
  [a3 encodeInteger:self->_originalSizeBytes forKey:@"originalSizeBytes"];
  [a3 encodeInteger:self->_serverUploadStatus forKey:@"serverUploadStatus"];
  [a3 encodeInteger:self->_uploadAttempts forKey:@"uploadAttempts"];
  [a3 encodeInteger:self->_durationCopyMs forKey:@"durationCopyMs"];
  [a3 encodeInteger:self->_durationTranscodeMs forKey:@"durationTranscodeMs"];
  [a3 encodeInteger:self->_durationEncryptionMs forKey:@"durationEncryptionMs"];
  [a3 encodeInteger:self->_durationUploadMs forKey:@"durationUploadMs"];
  [a3 encodeBool:self->_metricProcessed forKey:@"metricProcessed"];
  BOOL didApplyDelayMitigation = self->_didApplyDelayMitigation;

  [a3 encodeBool:didApplyDelayMitigation forKey:@"didApplyDelayMitigation"];
}

- (CLEEDMediaItem)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CLEEDMediaItem;
  v4 = [(CLEEDMediaItem *)&v6 init];
  if (v4)
  {
    v4->_URL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"placeholderURL"];
    v4->_stagingURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"stagingURL"];
    v4->_encryptedFileURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"encryptedURL"];
    v4->_authTag = (NSData *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"authTag"];
    v4->_assetIdentifier = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"assetIdentifier"];
    v4->_mediaItemID = (NSUUID *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaUUID"];
    v4->_sandboxExtension = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sandboxExtension"];
    v4->_type = [a3 decodeIntegerForKey:@"mediaType"];
    v4->_uploadStatus = [a3 decodeIntegerForKey:@"uploadStatus"];
    v4->_serverUploadStatus = [a3 decodeIntegerForKey:@"serverUploadStatus"];
    v4->_mediaItemFormat = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaItemFormat"];
    v4->_mediaItemSizeBytes = [a3 decodeIntegerForKey:@"mediaItemSizeBytes"];
    v4->_originalSizeBytes = [a3 decodeIntegerForKey:@"originalSizeBytes"];
    v4->_uploadAttempts = [a3 decodeIntegerForKey:@"uploadAttempts"];
    v4->_durationCopyMs = [a3 decodeIntegerForKey:@"durationCopyMs"];
    v4->_durationTranscodeMs = [a3 decodeIntegerForKey:@"durationTranscodeMs"];
    v4->_durationEncryptionMs = [a3 decodeIntegerForKey:@"durationEncryptionMs"];
    v4->_durationUploadMs = [a3 decodeIntegerForKey:@"durationUploadMs"];
    v4->_metricProcessed = [a3 decodeBoolForKey:@"metricProcessed"];
    v4->_BOOL didApplyDelayMitigation = [a3 decodeBoolForKey:@"didApplyDelayMitigation"];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  BOOL result = 0;
  if (objc_opt_isKindOfClass())
  {
    if ([(CLEEDMediaItem *)self assetIdentifier])
    {
      if ([a3 assetIdentifier])
      {
        if (-[NSString isEqualToString:](-[CLEEDMediaItem assetIdentifier](self, "assetIdentifier"), "isEqualToString:", [a3 assetIdentifier]))
        {
          int64_t v5 = [(CLEEDMediaItem *)self type];
          if (v5 == [a3 type]) {
            return 1;
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)hash
{
  v2 = [(CLEEDMediaItem *)self assetIdentifier];

  return [(NSString *)v2 hash];
}

- (id)createMediaItemDict
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v3)
  {
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem type](self, "type")), @"mediaType");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem uploadStatus](self, "uploadStatus")), @"uploadStatus");
    objc_msgSend(v3, "setValue:forKey:", -[NSURL absoluteString](-[CLEEDMediaItem URL](self, "URL"), "absoluteString"), @"placeholderURL");
    objc_msgSend(v3, "setValue:forKey:", -[CLEEDMediaItem assetIdentifier](self, "assetIdentifier"), @"assetIdentifier");
    objc_msgSend(v3, "setValue:forKey:", -[CLEEDMediaItem sandboxExtension](self, "sandboxExtension"), @"sandboxExtension");
    objc_msgSend(v3, "setValue:forKey:", -[NSURL absoluteString](-[CLEEDMediaItem stagingURL](self, "stagingURL"), "absoluteString"), @"stagingURL");
    objc_msgSend(v3, "setValue:forKey:", -[NSURL absoluteString](-[CLEEDMediaItem encryptedFileURL](self, "encryptedFileURL"), "absoluteString"), @"encryptedURL");
    objc_msgSend(v3, "setValue:forKey:", -[CLEEDMediaItem authTag](self, "authTag"), @"authTag");
    objc_msgSend(v3, "setValue:forKey:", -[NSUUID UUIDString](-[CLEEDMediaItem mediaItemID](self, "mediaItemID"), "UUIDString"), @"mediaUUID");
    objc_msgSend(v3, "setValue:forKey:", -[CLEEDMediaItem mediaItemFormat](self, "mediaItemFormat"), @"mediaItemFormat");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem serverUploadStatus](self, "serverUploadStatus")), @"serverUploadStatus");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CLEEDMediaItem mediaItemSizeBytes](self, "mediaItemSizeBytes")), @"mediaItemSizeBytes");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CLEEDMediaItem originalSizeBytes](self, "originalSizeBytes")), @"originalSizeBytes");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CLEEDMediaItem uploadAttempts](self, "uploadAttempts")), @"uploadAttempts");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem durationCopyMs](self, "durationCopyMs")), @"durationCopyMs");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem durationTranscodeMs](self, "durationTranscodeMs")), @"durationTranscodeMs");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem durationUploadMs](self, "durationUploadMs")), @"durationUploadMs");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithInteger:", -[CLEEDMediaItem durationEncryptionMs](self, "durationEncryptionMs")), @"durationEncryptionMs");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CLEEDMediaItem metricProcessed](self, "metricProcessed")), @"metricProcessed");
    objc_msgSend(v3, "setValue:forKey:", objc_msgSend(NSNumber, "numberWithBool:", -[CLEEDMediaItem didApplyDelayMitigation](self, "didApplyDelayMitigation")), @"didApplyDelayMitigation");
  }
  else
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    v4 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v8 = "-[CLEEDMediaItem createMediaItemDict]";
      _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil mediaItemDict, early return", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      objc_super v6 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "-[CLEEDMediaItem createMediaItemDict]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf) {
        free(v6);
      }
    }
  }
  return v3;
}

+ (id)createMediaItemFromDict:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 valueForKey:@"placeholderURL"];
  id v5 = objc_alloc(MEMORY[0x1E4F1CB10]);
  if (v4) {
    objc_super v6 = (__CFString *)v4;
  }
  else {
    objc_super v6 = &stru_1EE006720;
  }
  v7 = (void *)[v5 initWithString:v6];
  id v8 = v7;
  uint64_t v9 = [a3 valueForKey:@"assetIdentifier"];
  uint64_t v10 = [a3 valueForKey:@"sandboxExtension"];
  int v11 = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"mediaType"), "intValue");
  if (v7) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    if (qword_1E929F608 != -1) {
      dispatch_once(&qword_1E929F608, &unk_1EE005660);
    }
    uint64_t v13 = qword_1E929F600;
    if (os_log_type_enabled((os_log_t)qword_1E929F600, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446723;
      __int16 v24 = "+[CLEEDMediaItem createMediaItemFromDict:]";
      __int16 v25 = 2113;
      __int16 v26 = v7;
      __int16 v27 = 2113;
      uint64_t v28 = v10;
      _os_log_impl(&dword_1906B8000, v13, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,URL:%{private}@, sandboxExtension:%{private}@,mandatory item nil, early return", buf, 0x20u);
    }
    if (sub_1906CB57C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1E929F608 != -1) {
        dispatch_once(&qword_1E929F608, &unk_1EE005660);
      }
      __int16 v22 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 0, "+[CLEEDMediaItem createMediaItemFromDict:]", "CoreLocation: %s\n", v22);
      if (v22 != (char *)buf) {
        free(v22);
      }
    }
    return 0;
  }
  else
  {
    long long v14 = [[CLEEDMediaItem alloc] initWithURL:v7 assetIdentifier:v9 sandboxExtension:v10 mediaType:v11];
    -[CLEEDMediaItem setUploadStatus:](v14, "setUploadStatus:", (int)objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"uploadStatus"), "intValue"));
    uint64_t v15 = [a3 valueForKey:@"stagingURL"];
    if (v15) {
      uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v15];
    }
    else {
      uint64_t v16 = 0;
    }
    [(CLEEDMediaItem *)v14 setStagingURL:v16];
    uint64_t v17 = [a3 valueForKey:@"encryptedURL"];
    if (v17) {
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v17];
    }
    else {
      uint64_t v18 = 0;
    }
    [(CLEEDMediaItem *)v14 setEncryptedFileURL:v18];
    -[CLEEDMediaItem setAuthTag:](v14, "setAuthTag:", [a3 valueForKey:@"authTag"]);
    uint64_t v19 = [a3 valueForKey:@"mediaUUID"];
    if (v19) {
      uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v19];
    }
    else {
      uint64_t v20 = 0;
    }
    [(CLEEDMediaItem *)v14 setMediaItemID:v20];
    -[CLEEDMediaItem setMediaItemFormat:](v14, "setMediaItemFormat:", [a3 valueForKey:@"mediaItemFormat"]);
    -[CLEEDMediaItem setServerUploadStatus:](v14, "setServerUploadStatus:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"serverUploadStatus"), "integerValue"));
    -[CLEEDMediaItem setMediaItemSizeBytes:](v14, "setMediaItemSizeBytes:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"mediaItemSizeBytes"), "unsignedIntegerValue"));
    -[CLEEDMediaItem setOriginalSizeBytes:](v14, "setOriginalSizeBytes:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"originalSizeBytes"), "unsignedIntegerValue"));
    -[CLEEDMediaItem setUploadAttempts:](v14, "setUploadAttempts:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"uploadAttempts"), "unsignedIntegerValue"));
    -[CLEEDMediaItem setDurationCopyMs:](v14, "setDurationCopyMs:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"durationCopyMs"), "integerValue"));
    -[CLEEDMediaItem setDurationTranscodeMs:](v14, "setDurationTranscodeMs:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"durationTranscodeMs"), "integerValue"));
    -[CLEEDMediaItem setDurationUploadMs:](v14, "setDurationUploadMs:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"durationUploadMs"), "integerValue"));
    -[CLEEDMediaItem setDurationEncryptionMs:](v14, "setDurationEncryptionMs:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"durationEncryptionMs"), "integerValue"));
    -[CLEEDMediaItem setMetricProcessed:](v14, "setMetricProcessed:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"metricProcessed"), "BOOLValue"));
    -[CLEEDMediaItem setDidApplyDelayMitigation:](v14, "setDidApplyDelayMitigation:", objc_msgSend((id)objc_msgSend(a3, "valueForKey:", @"didApplyDelayMitigation"), "BOOLValue"));
  }
  return v14;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)uploadStatus
{
  return self->_uploadStatus;
}

- (void)setUploadStatus:(int64_t)a3
{
  self->_uploadStatus = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (NSString)sandboxExtension
{
  return self->_sandboxExtension;
}

- (NSURL)stagingURL
{
  return self->_stagingURL;
}

- (void)setStagingURL:(id)a3
{
}

- (NSURL)encryptedFileURL
{
  return self->_encryptedFileURL;
}

- (void)setEncryptedFileURL:(id)a3
{
}

- (NSData)authTag
{
  return self->_authTag;
}

- (void)setAuthTag:(id)a3
{
}

- (NSUUID)mediaItemID
{
  return self->_mediaItemID;
}

- (void)setMediaItemID:(id)a3
{
}

- (NSString)mediaItemFormat
{
  return self->_mediaItemFormat;
}

- (void)setMediaItemFormat:(id)a3
{
}

- (unint64_t)mediaItemSizeBytes
{
  return self->_mediaItemSizeBytes;
}

- (void)setMediaItemSizeBytes:(unint64_t)a3
{
  self->_mediaItemSizeBytes = a3;
}

- (unint64_t)originalSizeBytes
{
  return self->_originalSizeBytes;
}

- (void)setOriginalSizeBytes:(unint64_t)a3
{
  self->_originalSizeBytes = a3;
}

- (int64_t)serverUploadStatus
{
  return self->_serverUploadStatus;
}

- (void)setServerUploadStatus:(int64_t)a3
{
  self->_serverUploadStatus = a3;
}

- (unint64_t)uploadAttempts
{
  return self->_uploadAttempts;
}

- (void)setUploadAttempts:(unint64_t)a3
{
  self->_uploadAttempts = a3;
}

- (int64_t)durationCopyMs
{
  return self->_durationCopyMs;
}

- (void)setDurationCopyMs:(int64_t)a3
{
  self->_durationCopyMs = a3;
}

- (int64_t)durationTranscodeMs
{
  return self->_durationTranscodeMs;
}

- (void)setDurationTranscodeMs:(int64_t)a3
{
  self->_durationTranscodeMs = a3;
}

- (int64_t)durationEncryptionMs
{
  return self->_durationEncryptionMs;
}

- (void)setDurationEncryptionMs:(int64_t)a3
{
  self->_durationEncryptionMs = a3;
}

- (int64_t)durationUploadMs
{
  return self->_durationUploadMs;
}

- (void)setDurationUploadMs:(int64_t)a3
{
  self->_durationUploadMs = a3;
}

- (BOOL)metricProcessed
{
  return self->_metricProcessed;
}

- (void)setMetricProcessed:(BOOL)a3
{
  self->_metricProcessed = a3;
}

- (BOOL)didApplyDelayMitigation
{
  return self->_didApplyDelayMitigation;
}

- (void)setDidApplyDelayMitigation:(BOOL)a3
{
  self->_BOOL didApplyDelayMitigation = a3;
}

@end