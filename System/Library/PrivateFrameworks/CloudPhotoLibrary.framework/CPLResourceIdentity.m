@interface CPLResourceIdentity
+ (BOOL)isValidMMCSV2Signature:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)extensionForFileUTI:(id)a3;
+ (id)fileUTIForExtension:(id)a3;
+ (id)fingerPrintForData:(id)a3 error:(id *)a4;
+ (id)fingerPrintForFD:(int)a3 error:(id *)a4;
+ (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4;
+ (id)identityForStorageName:(id)a3;
+ (id)identityFromStoredIdentity:(id)a3;
+ (id)storageNameForFingerPrint:(id)a3 fileUTI:(id)a4 bucket:(id *)a5;
- (BOOL)isAvailable;
- (CGSize)imageDimensions;
- (CPLResourceIdentity)initWithCoder:(id)a3;
- (CPLResourceIdentity)initWithFileURL:(id)a3;
- (NSString)fileUTI;
- (NSString)fingerPrint;
- (NSString)stableHash;
- (NSURL)fileURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)identityForStorage;
- (id)stableHashForMasterWithManager:(id)a3;
- (unint64_t)fileSize;
- (unint64_t)hash;
- (void)setAvailable:(BOOL)a3;
- (void)setFileSize:(unint64_t)a3;
- (void)setFileURL:(id)a3;
- (void)setFileUTI:(id)a3;
- (void)setFingerPrint:(id)a3;
- (void)setImageDimensions:(CGSize)a3;
- (void)setStableHash:(id)a3;
@end

@implementation CPLResourceIdentity

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 cplCopyPropertiesFromObject:self withCopyBlock:0];
  return v4;
}

- (CPLResourceIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLResourceIdentity;
  v5 = [(CPLResourceIdentity *)&v8 init];
  v6 = v5;
  if (v5) {
    [v5 cplDecodePropertiesFromCoder:v4];
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileUTI, 0);
  objc_storeStrong((id *)&self->_stableHash, 0);
  objc_storeStrong((id *)&self->_fingerPrint, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)setFileUTI:(id)a3
{
}

- (NSString)fileUTI
{
  return self->_fileUTI;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setImageDimensions:(CGSize)a3
{
  self->_imageDimensions = a3;
}

- (CGSize)imageDimensions
{
  double width = self->_imageDimensions.width;
  double height = self->_imageDimensions.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (unint64_t)fileSize
{
  return self->_fileSize;
}

- (void)setStableHash:(id)a3
{
}

- (NSString)stableHash
{
  return self->_stableHash;
}

- (void)setFingerPrint:(id)a3
{
}

- (NSString)fingerPrint
{
  return self->_fingerPrint;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (id)identityForStorage
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(CPLResourceIdentity *)self fingerPrint];
  if (!v4)
  {
    if (!_CPLSilentLogging)
    {
      v11 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = self;
        _os_log_impl(&dword_1B4CAC000, v11, OS_LOG_TYPE_ERROR, "Can't create identity for storage for an identity without finger print: %@", buf, 0xCu);
      }
    }
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m"];
    [v12 handleFailureInMethod:a2, self, v13, 100, @"Can't create identity for storage for an identity without finger print: %@", self object file lineNumber description];

    abort();
  }
  v5 = (void *)v4;
  v6 = [(CPLResourceIdentity *)self fileUTI];
  v7 = v6;
  if (v6)
  {
    objc_super v8 = [v6 stringByReplacingOccurrencesOfString:@"." withString:@"_"];
  }
  else
  {
    objc_super v8 = @"CPLUNKNOWN";
  }
  v9 = [NSString stringWithFormat:@"%@.%@", v5, v8];

  return v9;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSURL *)self->_fileURL path];
  v6 = [v3 stringWithFormat:@"%@: filePath: %@ fingerPrint: %@  size: %.0fx%.0f fileUTI: %@", v4, v5, self->_fingerPrint, *(void *)&self->_imageDimensions.width, *(void *)&self->_imageDimensions.height, self->_fileUTI];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(CPLResourceIdentity *)self fingerPrint];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)stableHashForMasterWithManager:(id)a3
{
  id v5 = a3;
  if (!self->_fingerPrint)
  {
    if (!_CPLSilentLogging)
    {
      v12 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1B4CAC000, v12, OS_LOG_TYPE_ERROR, "Trying to compute stable hash for master without a fingerprint", v15, 2u);
      }
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m"];
    [v13 handleFailureInMethod:a2 object:self file:v14 lineNumber:73 description:@"Trying to compute stable hash for master without a fingerprint"];

    abort();
  }
  v6 = v5;
  stableHash = self->_stableHash;
  if (stableHash) {
    goto LABEL_5;
  }
  objc_super v8 = objc_msgSend(v5, "fingerprintSchemeForFingerprint:");
  int v9 = [v8 isForStableHash];

  if (v9)
  {
    stableHash = self->_fingerPrint;
LABEL_5:
    v10 = stableHash;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (CPLResourceIdentity)initWithFileURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLResourceIdentity;
  id v5 = [(CPLResourceIdentity *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;
  }
  return v5;
}

+ (id)identityForStorageName:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 hasPrefix:@"cpl"])
  {
    uint64_t v6 = [v5 substringFromIndex:3];

    v7 = [v6 pathExtension];
    objc_super v8 = [v6 stringByDeletingPathExtension];
    if ([v8 rangeOfString:@"_"] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"_" withString:@"/"];

      objc_super v8 = (void *)v9;
    }
    if ([v7 length])
    {
      if ([v8 length])
      {
        if ([v7 isEqual:@"cplunknown"])
        {
          v10 = 0;
        }
        else
        {
          v10 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v7];
        }
        id v11 = objc_alloc_init((Class)a1);
        v12 = [v10 identifier];
        [v11 setFileUTI:v12];

        [v11 setFingerPrint:v8];
        goto LABEL_11;
      }
      if (!_CPLSilentLogging)
      {
        v17 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v6;
          _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "Storage name should always have a finger print (%@)", buf, 0xCu);
        }
      }
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m"];
      [v15 handleFailureInMethod:a2, a1, v16, 190, @"Storage name should always have a finger print (%@)", v6 object file lineNumber description];
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        v14 = __CPLGenericOSLogDomain();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v6;
          _os_log_impl(&dword_1B4CAC000, v14, OS_LOG_TYPE_ERROR, "Storage name should always have an extension (%@)", buf, 0xCu);
        }
      }
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m"];
      [v15 handleFailureInMethod:a2, a1, v16, 189, @"Storage name should always have an extension (%@)", v6 object file lineNumber description];
    }

    abort();
  }
  id v11 = 0;
  uint64_t v6 = v5;
LABEL_11:

  return v11;
}

+ (id)storageNameForFingerPrint:(id)a3 fileUTI:(id)a4 bucket:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ([v9 hasPrefix:@"."])
  {
    if (!_CPLSilentLogging)
    {
      v17 = __CPLGenericOSLogDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_1B4CAC000, v17, OS_LOG_TYPE_ERROR, "%@ is not a valid finger print", buf, 0xCu);
      }
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLResourceIdentity.m"];
    [v18 handleFailureInMethod:a2, a1, v19, 158, @"%@ is not a valid finger print", v9 object file lineNumber description];

    abort();
  }
  if ([v9 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [v9 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];

    id v9 = (id)v11;
  }
  if (a5)
  {
    if ((unint64_t)[v9 length] < 4)
    {
      id v12 = v9;
    }
    else
    {
      id v12 = [v9 substringToIndex:3];
    }
    *a5 = v12;
  }
  v13 = [a1 extensionForFileUTI:v10];
  v14 = [@"cpl" stringByAppendingString:v9];
  v15 = [v14 cplStringByAppendingPathExtension:v13 fallbackExtension:@"cplunknown"];

  return v15;
}

+ (id)extensionForFileUTI:(id)a3
{
  if (a3)
  {
    unint64_t v3 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:");
    id v4 = [v3 preferredFilenameExtension];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)fileUTIForExtension:(id)a3
{
  id v3 = a3;
  if (![v3 length])
  {
    id v5 = 0;
LABEL_6:
    id v6 = (id)*MEMORY[0x1E4F44378];

    goto LABEL_7;
  }
  id v4 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v3];
  id v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  id v6 = v4;
  if ([v4 isDynamic]) {
    goto LABEL_6;
  }
LABEL_7:
  v7 = [v6 identifier];

  return v7;
}

+ (id)identityFromStoredIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 rangeOfString:@"."];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = v4;
    v7 = 0;
LABEL_6:
    id v10 = 0;
    goto LABEL_7;
  }
  uint64_t v8 = v5;
  id v6 = [v4 substringToIndex:v5];
  id v9 = [v4 substringFromIndex:v8 + 1];
  v7 = v9;
  if (!v9 || ![v9 length] || (objc_msgSend(v7, "isEqualToString:", @"CPLUNKNOWN") & 1) != 0) {
    goto LABEL_6;
  }
  id v10 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"."];
LABEL_7:
  id v11 = objc_alloc_init((Class)a1);
  [v11 setFingerPrint:v6];
  [v11 setFileUTI:v10];

  return v11;
}

+ (BOOL)isValidMMCSV2Signature:(id)a3
{
  return +[CPLFingerprintScheme isMMCSv2Signature:a3];
}

+ (id)fingerPrintForFD:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = +[CPLFingerprintContext sharedContext];
  v7 = [v6 fingerprintSchemeForNewMasterAsset];
  uint64_t v8 = [v7 fingerPrintForFD:v5 error:a4];

  return v8;
}

+ (id)fingerPrintForData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[CPLFingerprintContext sharedContext];
  v7 = [v6 fingerprintSchemeForNewMasterAsset];
  uint64_t v8 = [v7 fingerPrintForData:v5 error:a4];

  return v8;
}

+ (id)fingerPrintForFileAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[CPLFingerprintContext sharedContext];
  v7 = [v6 fingerprintSchemeForNewMasterAsset];
  uint64_t v8 = [v7 fingerPrintForFileAtURL:v5 error:a4];

  return v8;
}

@end