@interface CLEEDMediaServiceItem
- (BOOL)isEqual:(id)a3;
- (CLEEDMediaItem)mediaItem;
- (CLEEDMediaService)mediaService;
- (CLEEDMediaServiceItem)initWithMediaItem:(id)a3 mediaRequest:(id)a4 mediaService:(id)a5;
- (CLEEDMediaServiceRequest)mediaRequest;
- (NSDate)timestampEncryptionStart;
- (NSDate)timestampUploadStart;
- (NSURLSessionUploadTask)urlUploadTask;
- (OS_dispatch_source)delayTimer;
- (double)uploadProgressFraction;
- (id)completionHandler;
- (id)encryptMediaItem:(id)a3 returnedAuthTag:(id *)a4;
- (int64_t)compareMediaSize:(id)a3;
- (unint64_t)hash;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)cancelDelayTimer;
- (void)generateEncrytionKeyForMediaID:(id)a3 returningKey:(id *)a4 IV:(id *)a5;
- (void)handleUploadTaskCompletionForItem:(id)a3 response:(id)a4 error:(id)a5;
- (void)handleUploadTaskDelayForItem:(id)a3 response:(id)a4 error:(id)a5;
- (void)handleUploadTaskForSession:(id)a3 withRequest:(id)a4 resumeData:(id)a5;
- (void)processMediaItemWithCompletion:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDelayTimer:(id)a3;
- (void)setTimestampEncryptionStart:(id)a3;
- (void)setTimestampUploadStart:(id)a3;
- (void)setUploadProgressFraction:(double)a3;
- (void)setUrlUploadTask:(id)a3;
- (void)setupUploadTaskForSession:(id)a3 withRequest:(id)a4 resumeData:(id)a5 urlSessionError:(id)a6;
@end

@implementation CLEEDMediaServiceItem

- (CLEEDMediaServiceItem)initWithMediaItem:(id)a3 mediaRequest:(id)a4 mediaService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v57.receiver = self;
  v57.super_class = (Class)CLEEDMediaServiceItem;
  v12 = [(CLEEDMediaServiceItem *)&v57 init];
  v13 = v12;
  if (!v12) {
    goto LABEL_15;
  }
  objc_storeStrong((id *)&v12->_mediaRequest, a4);
  p_mediaItem = (id *)&v13->_mediaItem;
  objc_storeStrong((id *)&v13->_mediaItem, a3);
  objc_storeStrong((id *)&v13->_mediaService, a5);
  urlUploadTask = v13->_urlUploadTask;
  v13->_urlUploadTask = 0;

  id completionHandler = v13->_completionHandler;
  v13->_id completionHandler = 0;

  delayTimer = v13->_delayTimer;
  v13->_uploadProgressFraction = 0.0;
  v13->_delayTimer = 0;

  timestampEncryptionStart = v13->_timestampEncryptionStart;
  v13->_timestampEncryptionStart = 0;

  timestampUploadStart = v13->_timestampUploadStart;
  v13->_timestampUploadStart = 0;

  v20 = +[NSFileManager defaultManager];
  v21 = [v9 stagingURL];
  v22 = [v21 path];
  unsigned int v23 = [v20 fileExistsAtPath:v22];

  v24 = +[NSFileManager defaultManager];
  if (v23)
  {
    v53 = (id *)&v13->_mediaItem;
    id v25 = v11;
    id v26 = v10;
    v27 = [v9 stagingURL];
    v28 = [v27 path];
    uint64_t v56 = 0;
    v29 = (id *)&v56;
    v30 = &v56;
LABEL_6:
    v34 = [v24 attributesOfItemAtPath:v28 error:v30];
    id v35 = *v29;
    id v36 = [v34 fileSize];

    if (v35)
    {
      id v10 = v26;
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      id v11 = v25;
      v37 = (void *)qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR))
      {
        v47 = v37;
        v48 = [v9 stagingURL];
        v49 = [v48 path];
        v50 = [v9 encryptedFileURL];
        [v50 path];
        id v54 = v11;
        v52 = id v51 = v10;
        *(_DWORD *)buf = 136447235;
        v59 = "-[CLEEDMediaServiceItem initWithMediaItem:mediaRequest:mediaService:]";
        __int16 v60 = 2113;
        id v61 = v49;
        __int16 v62 = 2113;
        double v63 = *(double *)&v52;
        __int16 v64 = 2050;
        id v65 = v36;
        __int16 v66 = 2114;
        id v67 = v35;
        _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, File size error for stagingFile:%{private}@ or encryptedFile:%{private}@, size:%{public}ld, error:%{public}@", buf, 0x34u);

        id v10 = v51;
        id v11 = v54;
      }
      v38 = 0;
      goto LABEL_20;
    }
    id v10 = v26;
    id v11 = v25;
    p_mediaItem = v53;
    goto LABEL_14;
  }
  v31 = [v9 encryptedFileURL];
  v32 = [v31 path];
  unsigned int v33 = [v24 fileExistsAtPath:v32];

  if (v33)
  {
    v53 = (id *)&v13->_mediaItem;
    id v25 = v11;
    id v26 = v10;
    v24 = +[NSFileManager defaultManager];
    v27 = [v9 encryptedFileURL];
    v28 = [v27 path];
    uint64_t v55 = 0;
    v29 = (id *)&v55;
    v30 = &v55;
    goto LABEL_6;
  }
  id v36 = 0;
LABEL_14:
  [*p_mediaItem setMediaItemSizeBytes:v36];
LABEL_15:
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v39 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    mediaItem = v13->_mediaItem;
    v41 = v39;
    v42 = [(CLEEDMediaItem *)mediaItem mediaItemID];
    id v43 = [v42 UUIDString];
    id v44 = [v43 UTF8String];
    id v45 = [(CLEEDMediaItem *)v13->_mediaItem mediaItemSizeBytes];
    *(_DWORD *)buf = 136446723;
    v59 = "-[CLEEDMediaServiceItem initWithMediaItem:mediaRequest:mediaService:]";
    __int16 v60 = 2081;
    id v61 = v44;
    __int16 v62 = 2049;
    double v63 = (double)(unint64_t)v45 * 0.000000953674316;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, mediaID:%{private}s, size:%{private}.2lf MB", buf, 0x20u);
  }
  v38 = v13;
LABEL_20:

  return v38;
}

- (int64_t)compareMediaSize:(id)a3
{
  id v4 = a3;
  v5 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v6 = [v5 mediaItemSizeBytes];
  v7 = [v4 mediaItem];
  id v8 = [v7 mediaItemSizeBytes];

  if (v6 <= v8)
  {
    id v10 = [(CLEEDMediaServiceItem *)self mediaItem];
    id v11 = [v10 mediaItemSizeBytes];
    v12 = [v4 mediaItem];
    id v13 = [v12 mediaItemSizeBytes];

    if (v11 == v13) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = -1;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CLEEDMediaServiceItem *)a3;
  if (v4 == self) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:
    BOOL v13 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  uint64_t v6 = [(CLEEDMediaServiceItem *)self mediaItem];
  if (!v6)
  {
LABEL_8:

    goto LABEL_9;
  }
  v7 = (void *)v6;
  uint64_t v8 = [(CLEEDMediaServiceItem *)v5 mediaItem];
  if (!v8)
  {

    goto LABEL_8;
  }
  int64_t v9 = (void *)v8;
  id v10 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v11 = [(CLEEDMediaServiceItem *)v5 mediaItem];
  unsigned __int8 v12 = [v10 isEqual:v11];

  if ((v12 & 1) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (void)generateEncrytionKeyForMediaID:(id)a3 returningKey:(id *)a4 IV:(id *)a5
{
  id v6 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v7 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446466;
    id v36 = "-[CLEEDMediaServiceItem generateEncrytionKeyForMediaID:returningKey:IV:]";
    __int16 v37 = 2114;
    id v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#EED2EMS,%{public}s, Media encryption key generation for mediaID:%{public}@", buf, 0x16u);
  }
  uint64_t v8 = [v6 UUIDString];
  int64_t v9 = [@"device media response" dataUsingEncoding:4];
  id v10 = [(CLEEDMediaServiceRequest *)self->_mediaRequest sharedInfoPrefix];
  id v11 = +[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", (char *)[@"device media response" length]+ (void)objc_msgSend(v8, "length")+ (unint64_t)objc_msgSend(v10, "length"));

  unsigned __int8 v12 = [(CLEEDMediaServiceRequest *)self->_mediaRequest sharedInfoPrefix];
  [v11 appendData:v12];

  BOOL v13 = [v8 dataUsingEncoding:4];
  [v11 appendData:v13];

  [v11 appendData:v9];
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v14 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
    sub_100015318(v14);
  }
  v15 = [(CLEEDMediaServiceRequest *)self->_mediaRequest combinedSecret];
  v16 = +[CLEEDCryptoUtilities getDerivedKeyWithLength:48 secretData:v15 additionalInfo:v11];

  if (v16)
  {
    objc_msgSend(v16, "subdataWithRange:", 0, 32);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subdataWithRange:", 32, 16);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v17 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
    {
      log = v17;
      id v18 = [v16 base64EncodedStringWithOptions:0];
      id v19 = [v18 UTF8String];
      id v20 = [*a4 base64EncodedStringWithOptions:0];
      id v21 = [v20 UTF8String];
      id v22 = [*a5 base64EncodedStringWithOptions:0];
      id v23 = [v22 UTF8String];
      *(_DWORD *)buf = 136446979;
      id v36 = "-[CLEEDMediaServiceItem generateEncrytionKeyForMediaID:returningKey:IV:]";
      __int16 v37 = 2081;
      id v38 = v19;
      __int16 v39 = 2081;
      id v40 = v21;
      __int16 v41 = 2081;
      id v42 = v23;
      _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Derived key blob:%{private}s, derived key:%{private}s, derived IV:%{private}s", buf, 0x2Au);
    }
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    v24 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_1000152A0(v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
}

- (id)encryptMediaItem:(id)a3 returnedAuthTag:(id *)a4
{
  id v6 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v7 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = v7;
    int64_t v9 = [v6 stagingURL];
    id v10 = [v9 path];
    *(_DWORD *)buf = 136446467;
    v80 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
    __int16 v81 = 2113;
    *(void *)v82 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Encrypting media file at path:%{private}@", buf, 0x16u);
  }
  id v11 = +[NSFileManager defaultManager];
  unsigned __int8 v12 = [v6 stagingURL];
  BOOL v13 = [v12 path];
  unsigned __int8 v14 = [v11 fileExistsAtPath:v13];

  if (v14)
  {
    v15 = [v6 mediaItemID];
    id v77 = 0;
    id v78 = 0;
    [(CLEEDMediaServiceItem *)self generateEncrytionKeyForMediaID:v15 returningKey:&v78 IV:&v77];
    id v16 = v78;
    id v17 = v77;

    if (!v16 || !v17)
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_1000153C4();
      }
      id v21 = [v6 stagingURL];
      id v22 = [v21 path];
      +[CLEEDMediaService deleteFileAtPath:v22];

      id v20 = 0;
      goto LABEL_31;
    }
    CCCryptorRef cryptorRef = 0;
    id v18 = v16;
    if (CCCryptorCreateWithMode(0, 0xBu, 0, 0, 0, [v18 bytes], (size_t)objc_msgSend(v18, "length"), 0, 0, 0, 0, &cryptorRef))
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_1000157DC();
      }
LABEL_28:
      v24 = [v6 stagingURL];
      uint64_t v25 = v24;
LABEL_29:
      uint64_t v26 = [v24 path];
      +[CLEEDMediaService deleteFileAtPath:v26];
      id v20 = 0;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
    id v23 = v17;
    [v23 bytes];
    [v23 length];
    if (CCCryptorGCMSetIV())
    {
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
        sub_100015768();
      }
      goto LABEL_28;
    }
    uint64_t v28 = [v6 stagingURL];
    id v29 = [v28 path];
    uint64_t v30 = fopen((const char *)[v29 UTF8String], "rb");

    if (!v30)
    {
      v52 = sub_100002090();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_10001543C(v52);
      }

      goto LABEL_28;
    }
    v75 = v30;
    v71 = a4;
    uint64_t v31 = [v6 stagingURL];
    v32 = [v31 path];
    unsigned int v33 = [v32 stringByAppendingString:@".encrypted"];
    v34 = +[NSURL fileURLWithPath:v33];

    v72 = v34;
    id v35 = [v34 path];
    id v36 = fopen((const char *)[v35 UTF8String], "wb");

    __stream = v36;
    if (!v36)
    {
      v53 = sub_100002090();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        sub_1000154D8(v53);
      }

      fclose(v75);
      id v54 = [v6 stagingURL];
      uint64_t v55 = [v54 path];
      +[CLEEDMediaService deleteFileAtPath:v55];

      uint64_t v25 = v72;
      v24 = v72;
      goto LABEL_29;
    }
    id v73 = +[NSMutableData dataWithCapacity:0x100000];
    __int16 v37 = [(CLEEDMediaServiceItem *)self mediaItem];
    unint64_t v38 = (unint64_t)[v37 mediaItemSizeBytes] >> 20;
    __int16 v39 = [(CLEEDMediaServiceItem *)self mediaItem];
    if (((unint64_t)[v39 mediaItemSizeBytes] & 0xFFFFF) != 0) {
      int v40 = v38 + 1;
    }
    else {
      int v40 = v38;
    }
    int v70 = v40;

    int v41 = 1;
    while (1)
    {
      id v42 = v75;
      if (feof(v75)) {
        goto LABEL_71;
      }
      id v43 = v73;
      size_t v44 = fread([v43 mutableBytes], 1uLL, 0x100000uLL, v75);
      if (!v44) {
        goto LABEL_71;
      }
      size_t v45 = v44;
      int v46 = ferror(v75);
      if (v45 > 0x100000 || v46) {
        break;
      }
      if (qword_10002A1E0 != -1) {
        dispatch_once(&qword_10002A1E0, &stru_100024738);
      }
      v47 = qword_10002A1D8;
      if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446978;
        v80 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
        __int16 v81 = 1026;
        *(_DWORD *)v82 = v41;
        *(_WORD *)&v82[4] = 1026;
        *(_DWORD *)&v82[6] = v70;
        *(_WORD *)&v82[10] = 2050;
        *(void *)&v82[12] = v45;
        _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "#EED2EMS,%{public}s, Encrypting chunk %{public}d of %{public}d, chunkLength:%{public}zu", buf, 0x22u);
      }
      id v48 = v43;
      [v48 bytes];
      id v49 = v48;
      [v49 mutableBytes];
      if (CCCryptorGCMEncrypt())
      {
        uint64_t v56 = sub_100002090();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
          sub_1000155E8();
        }
        goto LABEL_66;
      }
      size_t v50 = fwrite([v49 bytes], 1uLL, v45, __stream);
      int v51 = ferror(__stream);
      if (!v51)
      {
        ++v41;
        if (v50 == v45) {
          continue;
        }
      }
      uint64_t v56 = sub_100002090();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v80 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
        __int16 v81 = 1026;
        *(_DWORD *)v82 = v51;
        *(_WORD *)&v82[4] = 2050;
        *(void *)&v82[6] = v45;
        *(_WORD *)&v82[14] = 2050;
        *(void *)&v82[16] = v50;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "#EED2EMS,%{public}s, Failed to write file,error code:%{public}d, readSize:%{public}zu, sizeWritten:%{public}zu", buf, 0x26u);
      }
      goto LABEL_66;
    }
    if (v46)
    {
      uint64_t v56 = sub_100002090();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_1000156F4();
      }
    }
    else
    {
      id v42 = v75;
      if (v45 <= 0x100000)
      {
LABEL_71:
        fclose(v42);
        fclose(__stream);
        id v59 = +[NSMutableData dataWithLength:16];
        [v59 mutableBytes];
        [v59 length];
        int v60 = CCCryptorGCMFinalize();
        CCCryptorRelease(cryptorRef);
        if (!v60)
        {
          id v59 = v59;
          id *v71 = v59;
          id v65 = sub_100002090();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            id v66 = [*v71 base64EncodedStringWithOptions:0];
            id v67 = [v66 UTF8String];
            *(_DWORD *)buf = 136446467;
            v80 = "-[CLEEDMediaServiceItem encryptMediaItem:returnedAuthTag:]";
            __int16 v81 = 2081;
            *(void *)v82 = v67;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, AuthenticationTag:%{private}s", buf, 0x16u);
          }
          v68 = [v6 stagingURL];
          v69 = [v68 path];
          +[CLEEDMediaService deleteFileAtPath:v69];

          uint64_t v25 = v72;
          id v20 = v72;
LABEL_76:
          uint64_t v26 = v73;

          goto LABEL_30;
        }
        id v61 = sub_100002090();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
          sub_100015574();
        }

        __int16 v62 = [v6 stagingURL];
        double v63 = [v62 path];
        +[CLEEDMediaService deleteFileAtPath:v63];

        uint64_t v25 = v72;
        __int16 v64 = [v72 path];
        +[CLEEDMediaService deleteFileAtPath:v64];

LABEL_75:
        id v20 = 0;
        goto LABEL_76;
      }
      uint64_t v56 = sub_100002090();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR)) {
        sub_10001565C();
      }
    }
LABEL_66:

    fclose(v75);
    fclose(__stream);
    objc_super v57 = [v6 stagingURL];
    v58 = [v57 path];
    +[CLEEDMediaService deleteFileAtPath:v58];

    uint64_t v25 = v72;
    id v59 = [v72 path];
    +[CLEEDMediaService deleteFileAtPath:v59];
    goto LABEL_75;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v19 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
    sub_100015850(v19);
  }
  id v20 = 0;
LABEL_32:

  return v20;
}

- (void)processMediaItemWithCompletion:(id)a3
{
  id v4 = a3;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  v5 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    log = v5;
    size_t v45 = [(CLEEDMediaServiceItem *)self mediaItem];
    size_t v44 = [v45 mediaItemID];
    id v43 = [v44 UUIDString];
    id v35 = [v43 UTF8String];
    id v42 = [(CLEEDMediaServiceItem *)self mediaItem];
    int v41 = [v42 encryptedFileURL];
    id v40 = [v41 path];
    id v34 = [v40 UTF8String];
    unint64_t v38 = [(CLEEDMediaServiceItem *)self mediaItem];
    __int16 v37 = [v38 authTag];
    id v36 = [v37 base64EncodedStringWithOptions:0];
    id v33 = [v36 UTF8String];
    id v6 = [(CLEEDMediaServiceItem *)self mediaRequest];
    v7 = [v6 deviceKeyConfirmation];
    [v7 base64EncodedStringWithOptions:0];
    id v46 = v4;
    id v8 = objc_claimAutoreleasedReturnValue();
    id v9 = [v8 UTF8String];
    id v10 = [(CLEEDMediaServiceItem *)self mediaRequest];
    id v11 = [v10 uploadURL];
    id v12 = [v11 UTF8String];
    BOOL v13 = [(CLEEDMediaServiceItem *)self mediaRequest];
    id v14 = [v13 token];
    *(_DWORD *)buf = 136447747;
    id v48 = "-[CLEEDMediaServiceItem processMediaItemWithCompletion:]";
    __int16 v49 = 2081;
    id v50 = v35;
    __int16 v51 = 2081;
    id v52 = v34;
    __int16 v53 = 2081;
    id v54 = v33;
    __int16 v55 = 2081;
    id v56 = v9;
    __int16 v57 = 2081;
    id v58 = v12;
    __int16 v59 = 2081;
    id v60 = [v14 UTF8String];
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Starting media upload, mediaID:%{private}s, EncryptedFile:%{private}s, AuthTag:%{private}s, deviceKeyCnf:%{private}s, uploadURL:%{private}s, token:%{private}s", buf, 0x48u);

    id v4 = v46;
  }
  [(CLEEDMediaServiceItem *)self setCompletionHandler:v4];
  v15 = [(CLEEDMediaServiceItem *)self mediaRequest];
  id v16 = [v15 uploadURL];
  id v17 = +[NSURL URLWithString:v16];
  id v18 = +[NSMutableURLRequest requestWithURL:v17];

  [v18 setHTTPMethod:@"PUT"];
  [v18 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  id v19 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v20 = [v19 mediaItemID];
  id v21 = [v20 UUIDString];
  [v18 setValue:v21 forHTTPHeaderField:@"x-eed-media-id"];

  id v22 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v23 = [v22 authTag];
  v24 = [v23 base64EncodedStringWithOptions:0];
  [v18 setValue:v24 forHTTPHeaderField:@"x-eed-media-auth-tag"];

  uint64_t v25 = [(CLEEDMediaServiceItem *)self mediaRequest];
  uint64_t v26 = [v25 deviceKeyConfirmation];
  uint64_t v27 = [v26 base64EncodedStringWithOptions:0];
  [v18 setValue:v27 forHTTPHeaderField:@"x-eed-device-key-confirmation"];

  uint64_t v28 = [(CLEEDMediaServiceItem *)self mediaRequest];
  id v29 = [v28 token];
  uint64_t v30 = [@"Bearer " stringByAppendingString:v29];
  [v18 setValue:v30 forHTTPHeaderField:@"Authorization"];

  uint64_t v31 = [(CLEEDMediaServiceItem *)self mediaService];
  v32 = [v31 getURLSession];
  [(CLEEDMediaServiceItem *)self setupUploadTaskForSession:v32 withRequest:v18 resumeData:0 urlSessionError:0];
}

- (void)setupUploadTaskForSession:(id)a3 withRequest:(id)a4 resumeData:(id)a5 urlSessionError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v64 = a5;
  id v63 = a6;
  id v12 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v62 = [v12 uploadAttempts];

  BOOL v13 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v14 = (char *)[v13 uploadAttempts];
  v15 = [(CLEEDMediaServiceItem *)self mediaItem];
  [v15 setUploadAttempts:v14 + 1];

  id v16 = [(CLEEDMediaServiceItem *)self mediaRequest];
  id v17 = [v16 requestTimestamp];
  [v17 timeIntervalSinceNow];
  double v19 = fabs(v18);

  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  uint64_t v20 = (uint64_t)v19;
  id v21 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v21;
    id v23 = [(CLEEDMediaServiceItem *)self mediaItem];
    *(_DWORD *)buf = 136447491;
    id v73 = "-[CLEEDMediaServiceItem setupUploadTaskForSession:withRequest:resumeData:urlSessionError:]";
    __int16 v74 = 2050;
    id v75 = [v23 uploadAttempts];
    __int16 v76 = 2050;
    uint64_t v77 = (uint64_t)v19;
    __int16 v78 = 2113;
    id v79 = v10;
    __int16 v80 = 2114;
    id v81 = v11;
    __int16 v82 = 2113;
    id v83 = v64;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, uploadAttempt:%{public}lu, timeElapsedSinceRequestSecs:%{public}lld, session:%{private}@, urlRequest:%{public}@, resumeData:%{private}@, ", buf, 0x3Eu);
  }
  if (v10 && v11)
  {
    v24 = [(CLEEDMediaServiceItem *)self mediaItem];
    uint64_t v25 = [v24 encryptedFileURL];
    if (v25)
    {
      uint64_t v26 = [(CLEEDMediaServiceItem *)self mediaItem];
      BOOL v28 = (unint64_t)[v26 uploadAttempts] > 3 || v20 > 14400;

      if (!v28)
      {
        [(CLEEDMediaServiceItem *)self cancelDelayTimer];
        id v29 = [(CLEEDMediaServiceItem *)self mediaService];
        uint64_t v30 = [v29 getQueue];
        dispatch_source_t v31 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v30);
        [(CLEEDMediaServiceItem *)self setDelayTimer:v31];

        v32 = [(CLEEDMediaServiceItem *)self delayTimer];
        BOOL v33 = v32 == 0;

        if (v33)
        {
          if (qword_10002A1E0 != -1) {
            dispatch_once(&qword_10002A1E0, &stru_100024738);
          }
          id v54 = qword_10002A1D8;
          if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
            sub_10001591C(v54, v55, v56, v57, v58, v59, v60, v61);
          }
          -[CLEEDMediaServiceItem handleUploadTaskForSession:withRequest:resumeData:](self, "handleUploadTaskForSession:withRequest:resumeData:", v10, v11, v64, v62);
        }
        else
        {
          dispatch_time_t v34 = dispatch_time(0, 10000000000 * (void)v62);
          id v35 = [(CLEEDMediaServiceItem *)self delayTimer];
          dispatch_source_set_timer(v35, v34, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);

          objc_initWeak((id *)buf, self);
          id v36 = [(CLEEDMediaServiceItem *)self delayTimer];
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_100005610;
          handler[3] = &unk_1000244C0;
          objc_copyWeak(&v69, (id *)buf);
          handler[4] = self;
          id v66 = v10;
          id v67 = v11;
          id v68 = v64;
          dispatch_source_set_event_handler(v36, handler);

          __int16 v37 = [(CLEEDMediaServiceItem *)self delayTimer];
          dispatch_resume(v37);

          objc_destroyWeak(&v69);
          objc_destroyWeak((id *)buf);
        }
        goto LABEL_33;
      }
    }
    else
    {
    }
  }
  id v38 = [objc_alloc((Class)NSMutableString) initWithString:@"Error"];
  __int16 v39 = v38;
  if (!v11) {
    id v40 = [v38 stringByAppendingString:@" -urlRequest nil,"];
  }
  if (!v10) {
    id v41 = [v39 stringByAppendingString:@" -urlSession nil,"];
  }
  id v42 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v43 = [v42 encryptedFileURL];
  BOOL v44 = v43 == 0;

  if (v44) {
    id v45 = [v39 stringByAppendingString:@" -urlEncryptedFile nil,"];
  }
  id v46 = [(CLEEDMediaServiceItem *)self mediaItem];
  BOOL v47 = (unint64_t)[v46 uploadAttempts] > 3;

  if (v47
    && (id v48 = [v39 stringByAppendingString:@" -max uploadAttempts reached,"],
        v63))
  {
    id v49 = v63;
  }
  else
  {
    id v49 = 0;
  }
  if (v20 >= 14401) {
    id v50 = [v39 stringByAppendingString:@" -exceeded MaxAllowedTimeForRequest,"];
  }
  if (!v49)
  {
    id v51 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    v71 = v39;
    id v52 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    id v49 = [v51 initWithDomain:@"com.apple.locationd.CLEEDMediaService" code:1007 userInfo:v52];
  }
  __int16 v53 = [(CLEEDMediaServiceItem *)self mediaItem];
  [(CLEEDMediaServiceItem *)self handleUploadTaskCompletionForItem:v53 response:0 error:v49];

LABEL_33:
}

- (void)cancelDelayTimer
{
  id v3 = [(CLEEDMediaServiceItem *)self delayTimer];

  if (v3)
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v4 = (void *)qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEBUG)) {
      sub_100015A38(v4);
    }
    v5 = [(CLEEDMediaServiceItem *)self delayTimer];
    dispatch_source_cancel(v5);

    [(CLEEDMediaServiceItem *)self setDelayTimer:0];
  }
}

- (void)handleUploadTaskForSession:(id)a3 withRequest:(id)a4 resumeData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v35 = v9;
  if (!v10)
  {
    id v14 = +[NSDate date];
    [(CLEEDMediaServiceItem *)self setTimestampUploadStart:v14];

    goto LABEL_8;
  }
  id v11 = [v8 uploadTaskWithResumeData:v10];
  [(CLEEDMediaServiceItem *)self setUrlUploadTask:v11];

  id v12 = [(CLEEDMediaServiceItem *)self urlUploadTask];

  if (!v12)
  {
LABEL_8:
    v15 = [(CLEEDMediaServiceItem *)self mediaItem];
    id v16 = [v15 encryptedFileURL];
    id v17 = [v8 uploadTaskWithRequest:v9 fromFile:v16];
    [(CLEEDMediaServiceItem *)self setUrlUploadTask:v17];

    goto LABEL_9;
  }
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  BOOL v13 = qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v39 = "-[CLEEDMediaServiceItem handleUploadTaskForSession:withRequest:resumeData:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, Retrying upload using resumable upload", buf, 0xCu);
  }
LABEL_9:
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  double v18 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    double v19 = v18;
    dispatch_time_t v34 = [(CLEEDMediaServiceItem *)self mediaItem];
    id v20 = v10;
    id v21 = v8;
    id v22 = [v34 uploadAttempts];
    id v23 = [(CLEEDMediaServiceItem *)self mediaItem];
    v24 = [v23 mediaItemID];
    id v25 = [v24 UUIDString];
    id v26 = [v25 UTF8String];
    uint64_t v27 = [(CLEEDMediaServiceItem *)self urlUploadTask];
    *(_DWORD *)buf = 136447747;
    __int16 v39 = "-[CLEEDMediaServiceItem handleUploadTaskForSession:withRequest:resumeData:]";
    __int16 v40 = 2050;
    id v41 = v22;
    id v8 = v21;
    id v10 = v20;
    __int16 v42 = 2082;
    id v43 = v26;
    __int16 v44 = 2113;
    id v45 = v27;
    __int16 v46 = 2113;
    id v47 = v8;
    __int16 v48 = 2114;
    id v49 = v35;
    __int16 v50 = 2113;
    id v51 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, uploadAttempt:%{public}lu, mediaID:%{public}s, URLUploadTask:%{private}@, session:%{private}@, urlRequest:%{public}@, resumeData:%{private}@", buf, 0x48u);
  }
  BOOL v28 = [(CLEEDMediaServiceItem *)self urlUploadTask];

  if (v28)
  {
    id v29 = [(CLEEDMediaServiceItem *)self urlUploadTask];
    [v29 setDelegate:self];

    id v30 = [(CLEEDMediaServiceItem *)self urlUploadTask];
    [v30 resume];
  }
  else
  {
    id v31 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
    CFStringRef v37 = @"Upload task creation failed";
    v32 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v30 = [v31 initWithDomain:@"com.apple.locationd.CLEEDMediaService" code:1008 userInfo:v32];

    BOOL v33 = [(CLEEDMediaServiceItem *)self mediaItem];
    [(CLEEDMediaServiceItem *)self handleUploadTaskCompletionForItem:v33 response:0 error:v30];
  }
}

- (void)handleUploadTaskCompletionForItem:(id)a3 response:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  id v12 = v11;
  if (v11)
  {
    id v13 = [v11 statusCode];
  }
  else
  {
    if (!v10) {
      goto LABEL_6;
    }
    id v13 = [v10 code];
  }
  [v8 setServerUploadStatus:v13];
LABEL_6:
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v14 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    id v15 = [v8 serverUploadStatus];
    __int16 v39 = [(CLEEDMediaServiceItem *)self mediaItem];
    id v38 = [v39 mediaItemID];
    [v38 UUIDString];
    id v16 = v10;
    id v17 = objc_claimAutoreleasedReturnValue();
    id v18 = [v17 UTF8String];
    double v19 = [(CLEEDMediaServiceItem *)self urlUploadTask];
    id v20 = [v8 stagingURL];
    id v21 = [v20 lastPathComponent];
    *(_DWORD *)buf = 136448003;
    id v41 = "-[CLEEDMediaServiceItem handleUploadTaskCompletionForItem:response:error:]";
    __int16 v42 = 2050;
    id v43 = v15;
    __int16 v44 = 2082;
    id v45 = v18;
    __int16 v46 = 2113;
    id v47 = v19;
    __int16 v48 = 2081;
    id v49 = [v21 UTF8String];
    __int16 v50 = 2114;
    id v51 = v12;
    __int16 v52 = 2114;
    id v53 = v16;
    __int16 v54 = 2114;
    uint64_t v55 = v12;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, serverUploadStatus:%{public}ld, mediaID:%{public}s, URLUploadTask:%{private}@, [item:%{private}s,response:%{public}@,error:%{public}@], httpResponse:%{public}@", buf, 0x52u);

    id v10 = v16;
  }
  if (v12 && (uint64_t)[v12 statusCode] >= 200 && (uint64_t)objc_msgSend(v12, "statusCode") <= 299)
  {
    [v8 setUploadStatus:5];
    id v22 = [(CLEEDMediaServiceItem *)self timestampUploadStart];
    [v22 timeIntervalSinceNow];
    [v8 setDurationUploadMs:(uint64_t)(fabs(v23) * 1000.0)];
  }
  else
  {
    [v8 setUploadStatus:6];
  }
  v24 = [(CLEEDMediaServiceItem *)self mediaItem];
  id v25 = [v24 encryptedFileURL];
  id v26 = [v25 path];
  +[CLEEDMediaService deleteFileAtPath:v26];

  uint64_t v27 = [(CLEEDMediaServiceItem *)self completionHandler];

  if (v27)
  {
    BOOL v28 = [(CLEEDMediaServiceItem *)self completionHandler];
    v28[2]();

    [(CLEEDMediaServiceItem *)self setCompletionHandler:0];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v29 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100015AD4(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
}

- (void)handleUploadTaskDelayForItem:(id)a3 response:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v9;
  if (qword_10002A1E0 != -1) {
    dispatch_once(&qword_10002A1E0, &stru_100024738);
  }
  id v12 = (void *)qword_10002A1D8;
  if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_DEFAULT))
  {
    log = v12;
    id v13 = [v8 serverUploadStatus];
    uint64_t v32 = [(CLEEDMediaServiceItem *)self mediaItem];
    uint64_t v31 = [v32 mediaItemID];
    id v14 = [v31 UUIDString];
    id v15 = v10;
    id v16 = [v14 UTF8String];
    id v17 = [(CLEEDMediaServiceItem *)self urlUploadTask];
    id v18 = [v8 stagingURL];
    id v19 = [v18 lastPathComponent];
    *(_DWORD *)buf = 136448003;
    uint64_t v34 = "-[CLEEDMediaServiceItem handleUploadTaskDelayForItem:response:error:]";
    __int16 v35 = 2050;
    id v36 = v13;
    __int16 v37 = 2082;
    id v38 = v16;
    id v10 = v15;
    __int16 v39 = 2113;
    __int16 v40 = v17;
    __int16 v41 = 2081;
    id v42 = [v19 UTF8String];
    __int16 v43 = 2114;
    id v44 = v11;
    __int16 v45 = 2114;
    id v46 = v15;
    __int16 v47 = 2114;
    id v48 = v11;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "#EED2EMS,%{public}s, serverUploadStatus:%{public}ld, mediaID:%{public}s, URLUploadTask:%{private}@, [item:%{private}s,response:%{public}@,error:%{public}@], httpResponse:%{public}@", buf, 0x52u);
  }
  [v8 setUploadStatus:3];
  if ([v8 uploadAttempts]) {
    objc_msgSend(v8, "setUploadAttempts:", (char *)objc_msgSend(v8, "uploadAttempts") - 1);
  }
  id v20 = [(CLEEDMediaServiceItem *)self completionHandler];

  if (v20)
  {
    id v21 = [(CLEEDMediaServiceItem *)self completionHandler];
    v21[2]();

    [(CLEEDMediaServiceItem *)self setCompletionHandler:0];
  }
  else
  {
    if (qword_10002A1E0 != -1) {
      dispatch_once(&qword_10002A1E0, &stru_100024738);
    }
    id v22 = qword_10002A1D8;
    if (os_log_type_enabled((os_log_t)qword_10002A1D8, OS_LOG_TYPE_ERROR)) {
      sub_100015B4C(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = [(CLEEDMediaServiceItem *)self mediaService];
  id v15 = [v14 getQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000063B4;
  v18[3] = &unk_1000244E8;
  v18[4] = self;
  id v19 = v12;
  id v20 = v13;
  int64_t v21 = a6;
  int64_t v22 = a7;
  int64_t v23 = a5;
  id v16 = v13;
  id v17 = v12;
  dispatch_async(v15, v18);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = [(CLEEDMediaServiceItem *)self mediaService];
  id v12 = [v11 getQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000667C;
  v16[3] = &unk_1000244C0;
  objc_copyWeak(&v21, &location);
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v20 = self;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v12, v16);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(CLEEDMediaServiceItem *)self mediaService];
  id v15 = [v14 getQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006A2C;
  block[3] = &unk_100024510;
  id v21 = v10;
  id v22 = v11;
  uint64_t v24 = self;
  id v25 = v13;
  id v23 = v12;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  dispatch_async(v15, block);
}

- (CLEEDMediaItem)mediaItem
{
  return self->_mediaItem;
}

- (CLEEDMediaServiceRequest)mediaRequest
{
  return self->_mediaRequest;
}

- (CLEEDMediaService)mediaService
{
  return self->_mediaService;
}

- (NSURLSessionUploadTask)urlUploadTask
{
  return self->_urlUploadTask;
}

- (void)setUrlUploadTask:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (double)uploadProgressFraction
{
  return self->_uploadProgressFraction;
}

- (void)setUploadProgressFraction:(double)a3
{
  self->_uploadProgressFraction = a3;
}

- (OS_dispatch_source)delayTimer
{
  return self->_delayTimer;
}

- (void)setDelayTimer:(id)a3
{
}

- (NSDate)timestampEncryptionStart
{
  return self->_timestampEncryptionStart;
}

- (void)setTimestampEncryptionStart:(id)a3
{
}

- (NSDate)timestampUploadStart
{
  return self->_timestampUploadStart;
}

- (void)setTimestampUploadStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampUploadStart, 0);
  objc_storeStrong((id *)&self->_timestampEncryptionStart, 0);
  objc_storeStrong((id *)&self->_delayTimer, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_urlUploadTask, 0);
  objc_storeStrong((id *)&self->_mediaService, 0);
  objc_storeStrong((id *)&self->_mediaRequest, 0);

  objc_storeStrong((id *)&self->_mediaItem, 0);
}

@end