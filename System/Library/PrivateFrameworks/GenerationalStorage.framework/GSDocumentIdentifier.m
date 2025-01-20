@interface GSDocumentIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (GSDocumentIdentifier)initWithCoder:(id)a3;
- (GSDocumentIdentifier)initWithDocumentIdentifier:(id)a3;
- (GSDocumentIdentifier)initWithFileDescriptor:(int)a3 forItemAtURL:(id)a4 allocateIfNone:(BOOL)a5 error:(id *)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GSDocumentIdentifier

- (GSDocumentIdentifier)initWithDocumentIdentifier:(id)a3
{
  v4 = (char *)a3;
  v8.receiver = self;
  v8.super_class = (Class)GSDocumentIdentifier;
  v5 = [(GSDocumentIdentifier *)&v8 init];
  v6 = (GSDocumentIdentifier *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = *(_OWORD *)(v4 + 8);
    *((void *)v5 + 3) = *((void *)v4 + 3);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return [v4 initWithDocumentIdentifier:self];
}

- (void)encodeWithCoder:(id)a3
{
  volumeUUID = self->volumeUUID;
  id v5 = a3;
  [v5 encodeBytes:volumeUUID length:16 forKey:@"u"];
  [v5 encodeInt64:self->documentID forKey:@"i"];
}

- (GSDocumentIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GSDocumentIdentifier;
  uint64_t v10 = 0;
  id v5 = [(GSDocumentIdentifier *)&v9 init];
  if (v5)
  {
    id v6 = v4;
    v7 = [v6 decodeBytesForKey:@"u" returnedLength:&v10];
    if (v7 && v10 == 16) {
      *(_OWORD *)(v5 + 8) = *v7;
    }
    *((void *)v5 + 3) = [v6 decodeInt64ForKey:@"i"];
  }

  return (GSDocumentIdentifier *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  memset(&v4, 0, sizeof(v4));
  CC_SHA256_Init(&v4);
  CC_SHA256_Update(&v4, self->volumeUUID, 0x10u);
  CC_SHA256_Update(&v4, &self->documentID, 8u);
  CC_SHA256_Final(md, &v4);
  return *(void *)md;
}

- (BOOL)isEqual:(id)a3
{
  CC_SHA256_CTX v4 = (GSDocumentIdentifier *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
      && (*(void *)self->volumeUUID == *(void *)v4->volumeUUID
        ? (BOOL v5 = *(void *)&self->volumeUUID[8] == *(void *)&v4->volumeUUID[8])
        : (BOOL v5 = 0),
          v5)
      && self->documentID == v4->documentID;
  }

  return v6;
}

- (id)description
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:self->volumeUUID];
  unint64_t documentID = self->documentID;
  BOOL v5 = [v3 UUIDString];
  BOOL v6 = +[NSString stringWithFormat:@"docid:%lld on device %@", documentID, v5];

  return v6;
}

- (GSDocumentIdentifier)initWithFileDescriptor:(int)a3 forItemAtURL:(id)a4 allocateIfNone:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)GSDocumentIdentifier;
  v11 = [(GSDocumentIdentifier *)&v22 init];
  if (v11)
  {
    memset(&v23, 0, 512);
    int v21 = 0;
    if (fstatfs(v8, &v23) < 0)
    {
      v15 = +[NSString stringWithFormat:@"statfs(%@) failed", v10];
      int v16 = *__error();
      v17 = sub_100002D4C();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
    }
    else
    {
      if (!+[GSStorageManager _isPermanentStorageSupportedForStatFSInfo:&v23 error:a6])
      {
LABEL_19:

        v11 = 0;
        goto LABEL_20;
      }
      if (sub_10000BE54(v23.f_mntonname, v11->volumeUUID))
      {
        unsigned int v12 = sub_10000C184(v8, &v21);
        uint64_t v13 = v12;
        v11->unint64_t documentID = v12;
        if (v12 || !v7) {
          goto LABEL_9;
        }
        if (+[GSStorageManager _isPermanentStorageSupportedForFD:v8 error:a6])
        {
          unsigned int v14 = sub_10000C238(v8);
          uint64_t v13 = v14;
          v11->unint64_t documentID = v14;
          if (v14)
          {
LABEL_9:
            if (v13)
            {
              v11->deviceID = v23.f_fsid.val[0];
              goto LABEL_20;
            }
            v15 = +[NSString stringWithFormat:@"no storage for %@", v10];
            v20 = sub_100002D4C();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
              sub_100026BF0();
            }

            if (!a6) {
              goto LABEL_18;
            }
            v18 = sub_100003600(102, v15, 0);
            goto LABEL_17;
          }
          v15 = +[NSString stringWithFormat:@"unable to acquire document ID for %@", v10];
          int v16 = *__error();
          v17 = sub_100002D4C();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_22;
          }
        }
        else
        {
          v15 = +[NSString stringWithFormat:@"permanent storage not supported for %@", v10];
          int v16 = *__error();
          v17 = sub_100002D4C();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
LABEL_22:
          }
            sub_100026B74();
        }
LABEL_15:

        if (!a6)
        {
LABEL_18:

          goto LABEL_19;
        }
        v18 = sub_100011F0C(v16, v15);
LABEL_17:
        *a6 = v18;
        goto LABEL_18;
      }
      v15 = +[NSString stringWithFormat:@"unable to get device uuid for %s", v23.f_mntonname];
      int v16 = *__error();
      v17 = sub_100002D4C();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_15;
      }
    }
    sub_100026B74();
    goto LABEL_15;
  }
LABEL_20:

  return v11;
}

@end