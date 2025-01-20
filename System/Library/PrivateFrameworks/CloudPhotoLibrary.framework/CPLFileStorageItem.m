@interface CPLFileStorageItem
- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMarkedForDelete;
- (BOOL)isOriginal;
- (CPLFileStorageItem)initWithIdentity:(id)a3 original:(BOOL)a4 markedForDelete:(BOOL)a5 lastAccessDate:(id)a6;
- (CPLResourceIdentity)identity;
- (NSDate)lastAccessDate;
- (id)description;
- (unint64_t)hash;
@end

@implementation CPLFileStorageItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccessDate, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (NSDate)lastAccessDate
{
  return self->_lastAccessDate;
}

- (BOOL)isMarkedForDelete
{
  return self->_markedForDelete;
}

- (BOOL)isOriginal
{
  return self->_original;
}

- (CPLResourceIdentity)identity
{
  return self->_identity;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CPLFileStorageItem *)self identity];
  v6 = [v5 fingerPrint];
  v7 = [(CPLFileStorageItem *)self identity];
  v8 = [v7 fileUTI];
  if ([(CPLFileStorageItem *)self isOriginal]) {
    v9 = " [original]";
  }
  else {
    v9 = "";
  }
  BOOL v10 = [(CPLFileStorageItem *)self isMarkedForDelete];
  v11 = " [to be deleted]";
  if (!v10) {
    v11 = "";
  }
  v12 = [v3 stringWithFormat:@"<%@ [%@ %@]%s%s>", v4, v6, v8, v9, v11];

  return v12;
}

- (unint64_t)hash
{
  v2 = [(CPLFileStorageItem *)self identity];
  v3 = [v2 fingerPrint];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (CPLFileStorageItem *)a3;
  if (v4 == self)
  {
    char v7 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = [(CPLFileStorageItem *)self isOriginal];
    if (v5 == [(CPLFileStorageItem *)v4 isOriginal])
    {
      BOOL v6 = [(CPLFileStorageItem *)self isMarkedForDelete];
      if (v6 == [(CPLFileStorageItem *)v4 isMarkedForDelete])
      {
        v9 = [(CPLFileStorageItem *)self lastAccessDate];

        BOOL v10 = [(CPLFileStorageItem *)v4 lastAccessDate];
        v11 = v10;
        if (v9)
        {
          if (!v10) {
            goto LABEL_5;
          }
          v12 = [(CPLFileStorageItem *)self lastAccessDate];
          v13 = [(CPLFileStorageItem *)v4 lastAccessDate];
          char v14 = [v12 isEqual:v13];

          if ((v14 & 1) == 0) {
            goto LABEL_5;
          }
        }
        else
        {

          if (v11) {
            goto LABEL_5;
          }
        }
        v15 = [(CPLFileStorageItem *)self identity];
        v16 = [(CPLFileStorageItem *)v4 identity];
        char v7 = [v15 isEqual:v16];

        goto LABEL_7;
      }
    }
  }
LABEL_5:
  char v7 = 0;
LABEL_7:

  return v7;
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [(CPLResourceIdentity *)self->_identity fileURL];
  BOOL v10 = v9;
  if (v9)
  {
    char v11 = [v9 getResourceValue:a3 forKey:v8 error:a5];
  }
  else
  {
    *a3 = 0;
    char v11 = 1;
  }

  return v11;
}

- (CPLFileStorageItem)initWithIdentity:(id)a3 original:(BOOL)a4 markedForDelete:(BOOL)a5 lastAccessDate:(id)a6
{
  id v12 = a3;
  id v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CPLFileStorageItem;
  char v14 = [(CPLFileStorageItem *)&v33 init];
  v15 = v14;
  if (v14)
  {
    if (v12)
    {
      objc_storeStrong((id *)&v14->_identity, a3);
      v16 = [v12 fingerPrint];

      if (v16)
      {
        v17 = [v12 fileUTI];

        if (v17)
        {
          v15->_original = a4;
          v15->_markedForDelete = a5;
          uint64_t v18 = [v13 copy];
          lastAccessDate = v15->_lastAccessDate;
          v15->_lastAccessDate = (NSDate *)v18;

          goto LABEL_6;
        }
        if (!_CPLSilentLogging)
        {
          v31 = __CPLItemOSLogDomain();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1B4CAC000, v31, OS_LOG_TYPE_ERROR, "Can't create a file storage item without a type identifier", v32, 2u);
          }
        }
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m"];
        v24 = @"Can't create a file storage item without a type identifier";
        v25 = v22;
        SEL v26 = a2;
        v27 = v15;
        v28 = v23;
        uint64_t v29 = 694;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          v30 = __CPLItemOSLogDomain();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1B4CAC000, v30, OS_LOG_TYPE_ERROR, "Can't create a file storage item without an identity finger print", v32, 2u);
          }
        }
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m"];
        v24 = @"Can't create a file storage item without an identity finger print";
        v25 = v22;
        SEL v26 = a2;
        v27 = v15;
        v28 = v23;
        uint64_t v29 = 693;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v21 = __CPLItemOSLogDomain();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1B4CAC000, v21, OS_LOG_TYPE_ERROR, "Can't create a file storage item without an identity", v32, 2u);
        }
      }
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v23 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m"];
      v24 = @"Can't create a file storage item without an identity";
      v25 = v22;
      SEL v26 = a2;
      v27 = v15;
      v28 = v23;
      uint64_t v29 = 690;
    }
    [v25 handleFailureInMethod:v26 object:v27 file:v28 lineNumber:v29 description:v24];

    abort();
  }
LABEL_6:

  return v15;
}

@end