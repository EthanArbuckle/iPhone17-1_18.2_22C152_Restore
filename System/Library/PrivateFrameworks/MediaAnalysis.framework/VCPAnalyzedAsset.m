@interface VCPAnalyzedAsset
+ (id)assetWithLocalIdentifier:(id)a3 version:(int)a4 dateModified:(id)a5 dateAnalyzed:(id)a6 types:(unint64_t)a7 flags:(unint64_t)a8 statsFlags:(unint64_t)a9 masterFingerprint:(id)a10 adjustedFingerprint:(id)a11;
- (BOOL)isDegraded;
- (BOOL)isDeletePending;
- (NSDate)dateAnalyzed;
- (NSDate)dateModified;
- (NSString)localIdentifier;
- (VCPAnalyzedAsset)initWithLocalIdentifier:(id)a3 version:(int)a4 dateModified:(id)a5 dateAnalyzed:(id)a6 types:(unint64_t)a7 flags:(unint64_t)a8 statsFlags:(unint64_t)a9 masterFingerprint:(id)a10 adjustedFingerprint:(id)a11;
- (VCPFingerprint)fingerprint;
- (int)version;
- (unint64_t)flags;
- (unint64_t)statsFlags;
- (unint64_t)types;
- (void)updateLocalIdentifier:(id)a3;
@end

@implementation VCPAnalyzedAsset

- (VCPAnalyzedAsset)initWithLocalIdentifier:(id)a3 version:(int)a4 dateModified:(id)a5 dateAnalyzed:(id)a6 types:(unint64_t)a7 flags:(unint64_t)a8 statsFlags:(unint64_t)a9 masterFingerprint:(id)a10 adjustedFingerprint:(id)a11
{
  id v28 = a3;
  id v27 = a5;
  id v26 = a6;
  id v18 = a10;
  id v19 = a11;
  v29.receiver = self;
  v29.super_class = (Class)VCPAnalyzedAsset;
  v20 = [(VCPAnalyzedAsset *)&v29 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_localIdentifier, a3);
    v21->_version = a4;
    objc_storeStrong((id *)&v21->_dateModified, a5);
    objc_storeStrong((id *)&v21->_dateAnalyzed, a6);
    v21->_types = a7;
    v21->_flags = a8;
    v21->_statsFlags = a9;
    uint64_t v22 = +[VCPFingerprint fingerprintWithMaster:v18 adjusted:v19];
    fingerprint = v21->_fingerprint;
    v21->_fingerprint = (VCPFingerprint *)v22;

    v24 = v21;
  }

  return v21;
}

+ (id)assetWithLocalIdentifier:(id)a3 version:(int)a4 dateModified:(id)a5 dateAnalyzed:(id)a6 types:(unint64_t)a7 flags:(unint64_t)a8 statsFlags:(unint64_t)a9 masterFingerprint:(id)a10 adjustedFingerprint:(id)a11
{
  uint64_t v15 = *(void *)&a4;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  id v20 = a11;
  v21 = [[VCPAnalyzedAsset alloc] initWithLocalIdentifier:v16 version:v15 dateModified:v17 dateAnalyzed:v18 types:a7 flags:a8 statsFlags:a9 masterFingerprint:v19 adjustedFingerprint:v20];

  return v21;
}

- (void)updateLocalIdentifier:(id)a3
{
}

- (BOOL)isDeletePending
{
  return (BYTE3(self->_flags) >> 6) & 1;
}

- (BOOL)isDegraded
{
  return (BYTE2(self->_flags) >> 2) & 1;
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (int)version
{
  return self->_version;
}

- (NSDate)dateModified
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NSDate)dateAnalyzed
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (unint64_t)types
{
  return self->_types;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (unint64_t)statsFlags
{
  return self->_statsFlags;
}

- (VCPFingerprint)fingerprint
{
  return (VCPFingerprint *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprint, 0);
  objc_storeStrong((id *)&self->_dateAnalyzed, 0);
  objc_storeStrong((id *)&self->_dateModified, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
}

@end