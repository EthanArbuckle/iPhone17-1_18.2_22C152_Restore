@interface HDDataOriginProvenance
+ (BOOL)supportsSecureCoding;
+ (id)dataProvenanceWithSyncProvenance:(int64_t)a3 syncIdentity:(int64_t)a4 productType:(id)a5 systemBuild:(id)a6 operatingSystemVersion:(id *)a7 sourceVersion:(id)a8 timeZoneName:(id)a9 sourceID:(id)a10 deviceID:(id)a11 contributorReference:(id)a12;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (HDContributorReference)contributorReference;
- (HDDataOriginProvenance)initWithCoder:(id)a3;
- (NSNumber)deviceID;
- (NSNumber)sourceID;
- (NSString)productType;
- (NSString)sourceVersion;
- (NSString)systemBuild;
- (NSString)timeZoneName;
- (id)contributorID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)syncIdentity;
- (int64_t)syncProvenance;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setContributorReference:(id)a3;
- (void)setDeviceID:(id)a3;
- (void)setOperatingSystemVersion:(id *)a3;
- (void)setProductType:(id)a3;
- (void)setSourceID:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)setSyncIdentity:(int64_t)a3;
- (void)setSyncProvenance:(int64_t)a3;
- (void)setSystemBuild:(id)a3;
- (void)setTimeZoneName:(id)a3;
@end

@implementation HDDataOriginProvenance

- (NSNumber)sourceID
{
  return self->_sourceID;
}

- (BOOL)isValid
{
  return self->_sourceID
      && self->_deviceID
      && self->_sourceVersion
      && self->_productType
      && self->_systemBuild
      && self->_timeZoneName != 0;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t syncProvenance = self->_syncProvenance;
  id v5 = a3;
  [v5 encodeInt64:syncProvenance forKey:@"sync"];
  [v5 encodeInt64:self->_syncIdentity forKey:@"sync_identity"];
  [v5 encodeObject:self->_productType forKey:@"product_type"];
  [v5 encodeObject:self->_productType forKey:@"model"];
  [v5 encodeObject:self->_systemBuild forKey:@"build"];
  [v5 encodeObject:self->_sourceVersion forKey:@"source_version"];
  [v5 encodeObject:self->_timeZoneName forKey:@"tz_name"];
  [v5 encodeObject:self->_sourceID forKey:@"source_id"];
  [v5 encodeObject:self->_deviceID forKey:@"device_id"];
  [v5 encodeObject:self->_contributorReference forKey:@"contributor_reference"];
  [v5 encodeInteger:self->_operatingSystemVersion.majorVersion forKey:@"os_major_version"];
  [v5 encodeInteger:self->_operatingSystemVersion.minorVersion forKey:@"os_minor_version"];
  [v5 encodeInteger:self->_operatingSystemVersion.patchVersion forKey:@"os_patch_version"];
}

- (NSString)sourceVersion
{
  return self->_sourceVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = *($A44FF20282FB96BA82CF1B0FF6945C38 *)((char *)self + 80);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contributorReference, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_sourceID, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_systemBuild, 0);

  objc_storeStrong((id *)&self->_productType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDataOriginProvenance)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HDDataOriginProvenance;
  id v5 = [(HDDataOriginProvenance *)&v29 init];
  if (v5)
  {
    v5->_int64_t syncProvenance = [v4 decodeInt64ForKey:@"sync"];
    v5->_syncIdentity = [v4 decodeInt64ForKey:@"sync_identity"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"product_type"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v6;

    if (!v5->_productType)
    {
      v8 = [MEMORY[0x1E4F2B860] sharedBehavior];
      uint64_t v9 = [v8 currentDeviceProductType];
      v10 = v5->_productType;
      v5->_productType = (NSString *)v9;
    }
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    systemBuild = v5->_systemBuild;
    v5->_systemBuild = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source_version"];
    sourceVersion = v5->_sourceVersion;
    v5->_sourceVersion = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tz_name"];
    timeZoneName = v5->_timeZoneName;
    v5->_timeZoneName = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source_id"];
    sourceID = v5->_sourceID;
    v5->_sourceID = (NSNumber *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"device_id"];
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSNumber *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contributor_reference"];
    contributorReference = v5->_contributorReference;
    v5->_contributorReference = (HDContributorReference *)v21;

    if ([v4 containsValueForKey:@"os_major_version"])
    {
      uint64_t v23 = [v4 decodeIntegerForKey:@"os_major_version"];
      uint64_t v24 = [v4 decodeIntegerForKey:@"os_minor_version"];
      uint64_t v25 = [v4 decodeIntegerForKey:@"os_patch_version"];
      v5->_operatingSystemVersion.majorVersion = v23;
      v5->_operatingSystemVersion.minorVersion = v24;
      v5->_operatingSystemVersion.patchVersion = v25;
    }
    else
    {
      HDVersionFromBuildStringForProductType(v5->_systemBuild, v5->_productType, &v27);
      *(_OWORD *)&v5->_operatingSystemVersion.majorVersion = v27;
      v5->_operatingSystemVersion.patchVersion = v28;
    }
  }

  return v5;
}

- (NSNumber)deviceID
{
  return self->_deviceID;
}

- (unint64_t)hash
{
  int64_t v3 = self->_syncIdentity ^ self->_syncProvenance;
  NSUInteger v4 = v3 ^ [(NSString *)self->_productType hash];
  NSUInteger v5 = [(NSString *)self->_systemBuild hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSNumber *)self->_sourceID hash];
  uint64_t v7 = [(NSNumber *)self->_deviceID hash];
  unint64_t v8 = v7 ^ [(HDContributorReference *)self->_contributorReference hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_sourceVersion hash];
  return v9 ^ [(NSString *)self->_timeZoneName hash] ^ (2654435761 * self->_operatingSystemVersion.majorVersion) ^ (2654435761 * self->_operatingSystemVersion.minorVersion) ^ (2654435761 * self->_operatingSystemVersion.patchVersion);
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [+[HDDataOriginProvenance allocWithZone:](HDDataOriginProvenance, "allocWithZone:") init];
  v5->_int64_t syncProvenance = self->_syncProvenance;
  v5->_syncIdentity = self->_syncIdentity;
  uint64_t v6 = [(NSString *)self->_productType copyWithZone:a3];
  productType = v5->_productType;
  v5->_productType = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_systemBuild copyWithZone:a3];
  systemBuild = v5->_systemBuild;
  v5->_systemBuild = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_sourceVersion copyWithZone:a3];
  sourceVersion = v5->_sourceVersion;
  v5->_sourceVersion = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  timeZoneName = v5->_timeZoneName;
  v5->_timeZoneName = (NSString *)v12;

  objc_storeStrong((id *)&v5->_sourceID, self->_sourceID);
  objc_storeStrong((id *)&v5->_deviceID, self->_deviceID);
  objc_storeStrong((id *)&v5->_contributorReference, self->_contributorReference);
  long long v14 = *(_OWORD *)&self->_operatingSystemVersion.majorVersion;
  v5->_operatingSystemVersion.patchVersion = self->_operatingSystemVersion.patchVersion;
  *(_OWORD *)&v5->_operatingSystemVersion.majorVersion = v14;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_28;
  }
  if (self->_syncProvenance != v4[1]) {
    goto LABEL_28;
  }
  if (self->_syncIdentity != v4[2]) {
    goto LABEL_28;
  }
  sourceID = self->_sourceID;
  uint64_t v6 = (NSNumber *)v4[7];
  if (sourceID != v6 && (!v6 || !-[NSNumber isEqual:](sourceID, "isEqual:"))) {
    goto LABEL_28;
  }
  deviceID = self->_deviceID;
  uint64_t v8 = (NSNumber *)v4[8];
  if (deviceID != v8 && (!v8 || !-[NSNumber isEqual:](deviceID, "isEqual:"))) {
    goto LABEL_28;
  }
  contributorReference = self->_contributorReference;
  uint64_t v10 = (HDContributorReference *)v4[9];
  if (contributorReference != v10 && (!v10 || !-[HDContributorReference isEqual:](contributorReference, "isEqual:"))) {
    goto LABEL_28;
  }
  productType = self->_productType;
  uint64_t v12 = (NSString *)v4[3];
  if (productType != v12 && (!v12 || !-[NSString isEqualToString:](productType, "isEqualToString:"))) {
    goto LABEL_28;
  }
  if (((systemBuild = self->_systemBuild, long long v14 = (NSString *)v4[4], systemBuild == v14)
     || v14 && -[NSString isEqualToString:](systemBuild, "isEqualToString:"))
    && ((sourceVersion = self->_sourceVersion, v16 = (NSString *)v4[5], sourceVersion == v16)
     || v16 && -[NSString isEqualToString:](sourceVersion, "isEqualToString:"))
    && ((timeZoneName = self->_timeZoneName, v18 = (NSString *)v4[6], timeZoneName == v18)
     || v18 && -[NSString isEqualToString:](timeZoneName, "isEqualToString:"))
    && self->_operatingSystemVersion.majorVersion == v4[10]
    && self->_operatingSystemVersion.minorVersion == v4[11])
  {
    BOOL v19 = self->_operatingSystemVersion.patchVersion == v4[12];
  }
  else
  {
LABEL_28:
    BOOL v19 = 0;
  }

  return v19;
}

- (NSString)systemBuild
{
  return self->_systemBuild;
}

- (NSString)timeZoneName
{
  return self->_timeZoneName;
}

+ (id)dataProvenanceWithSyncProvenance:(int64_t)a3 syncIdentity:(int64_t)a4 productType:(id)a5 systemBuild:(id)a6 operatingSystemVersion:(id *)a7 sourceVersion:(id)a8 timeZoneName:(id)a9 sourceID:(id)a10 deviceID:(id)a11 contributorReference:(id)a12
{
  v18 = (NSNumber *)a10;
  v40 = (NSNumber *)a11;
  id v41 = a12;
  id v19 = a9;
  id v20 = a8;
  id v21 = a6;
  id v22 = a5;
  uint64_t v23 = objc_alloc_init(HDDataOriginProvenance);
  v23->_int64_t syncProvenance = a3;
  v23->_syncIdentity = a4;
  uint64_t v24 = [v22 copy];

  productType = v23->_productType;
  v23->_productType = (NSString *)v24;

  uint64_t v26 = [v21 copy];
  systemBuild = v23->_systemBuild;
  v23->_systemBuild = (NSString *)v26;

  long long v28 = *(_OWORD *)&a7->var0;
  v23->_operatingSystemVersion.patchVersion = a7->var2;
  *(_OWORD *)&v23->_operatingSystemVersion.majorVersion = v28;
  uint64_t v29 = [v20 copy];

  sourceVersion = v23->_sourceVersion;
  v23->_sourceVersion = (NSString *)v29;

  uint64_t v31 = [v19 copy];
  timeZoneName = v23->_timeZoneName;
  v23->_timeZoneName = (NSString *)v31;

  sourceID = v23->_sourceID;
  v23->_sourceID = v18;
  v34 = v18;

  deviceID = v23->_deviceID;
  v23->_deviceID = v40;
  v36 = v40;

  uint64_t v37 = [v41 copy];
  contributorReference = v23->_contributorReference;
  v23->_contributorReference = (HDContributorReference *)v37;

  return v23;
}

- (id)description
{
  int64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v11 = *(_OWORD *)&self->_productType;
  long long v12 = *(_OWORD *)&self->_syncProvenance;
  long long v9 = *(_OWORD *)&self->_deviceID;
  long long v10 = *(_OWORD *)&self->_timeZoneName;
  sourceVersion = self->_sourceVersion;
  uint64_t v6 = HKNSOperatingSystemVersionString();
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p syncProvenance=%ld, syncIdentity=%ld, productType=%@, systemBuild=%@, timeZone=%@, sourceID=%@, deviceID=%@, contributorReference=%@, sourceVersion=%@ operatingSystemVersion=%@>", v4, self, v12, v11, v10, v9, sourceVersion, v6, 0];

  return v7;
}

- (id)contributorID
{
  return [(HDContributorReference *)self->_contributorReference persistentID];
}

- (void)setSyncProvenance:(int64_t)a3
{
  self->_int64_t syncProvenance = a3;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(int64_t)a3
{
  self->_syncIdentity = a3;
}

- (void)setProductType:(id)a3
{
}

- (void)setSystemBuild:(id)a3
{
}

- (void)setOperatingSystemVersion:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_operatingSystemVersion.patchVersion = a3->var2;
  *(_OWORD *)&self->_operatingSystemVersion.majorVersion = v3;
}

- (void)setSourceVersion:(id)a3
{
}

- (void)setTimeZoneName:(id)a3
{
}

- (void)setSourceID:(id)a3
{
}

- (void)setDeviceID:(id)a3
{
}

- (HDContributorReference)contributorReference
{
  return self->_contributorReference;
}

- (void)setContributorReference:(id)a3
{
}

@end