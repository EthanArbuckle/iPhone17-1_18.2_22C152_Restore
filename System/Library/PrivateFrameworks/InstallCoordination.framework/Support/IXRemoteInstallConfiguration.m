@interface IXRemoteInstallConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)provisioningProfileInstallFailureIsFatal;
- (NSArray)provisioningProfileDatas;
- (NSData)geoJSONData;
- (NSData)iconData;
- (NSData)sinfData;
- (NSDictionary)storeMetadata;
- (NSString)bundleID;
- (NSString)bundleVersion;
- (NSString)localizedName;
- (NSString)remoteInstallTargetBundleName;
- (NSString)targetLastPathComponent;
- (NSURL)deltaDirectoryURL;
- (NSURL)remoteInstallTargetDirectoryURL;
- (NSURL)remoteInstallTargetURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForAppWithBundleID:(id)a3 localizedName:(id)a4 installMode:(unsigned __int8)a5;
- (unint64_t)deltaScheme;
- (unint64_t)hash;
- (unsigned)iconType;
- (unsigned)importance;
- (unsigned)installMode;
- (unsigned)installableType;
- (unsigned)pairedAutoInstallOverride;
- (unsigned)stashMode;
- (void)setBundleVersion:(id)a3;
- (void)setDeltaDirectoryURL:(id)a3;
- (void)setDeltaScheme:(unint64_t)a3;
- (void)setGeoJSONData:(id)a3;
- (void)setIconData:(id)a3 containingImageOfType:(unsigned __int8)a4;
- (void)setImportance:(unsigned __int8)a3;
- (void)setInstallableType:(unsigned __int8)a3;
- (void)setPairedAutoInstallOverride:(unsigned __int8)a3;
- (void)setProvisioningProfileDatas:(id)a3;
- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3;
- (void)setRemoteInstallTargetBundleName:(id)a3;
- (void)setRemoteInstallTargetDirectoryURL:(id)a3;
- (void)setRemoteInstallTargetURL:(id)a3;
- (void)setSinfData:(id)a3;
- (void)setStashMode:(unsigned __int8)a3;
- (void)setStoreMetadata:(id)a3;
- (void)setTargetLastPathComponent:(id)a3;
@end

@implementation IXRemoteInstallConfiguration

- (id)initForAppWithBundleID:(id)a3 localizedName:(id)a4 installMode:(unsigned __int8)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IXRemoteInstallConfiguration;
  v11 = [(IXRemoteInstallConfiguration *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleID, a3);
    objc_storeStrong((id *)&v12->_localizedName, a4);
    v12->_installMode = a5;
  }

  return v12;
}

- (void)setIconData:(id)a3 containingImageOfType:(unsigned __int8)a4
{
  v6 = (NSData *)[a3 copy];
  iconData = self->_iconData;
  self->_iconData = v6;

  self->_iconType = a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [(id)objc_opt_class() allocWithZone:a3];
  v6 = [(IXRemoteInstallConfiguration *)self bundleID];
  v7 = [(IXRemoteInstallConfiguration *)self localizedName];
  id v8 = objc_msgSend(v5, "initForAppWithBundleID:localizedName:installMode:", v6, v7, -[IXRemoteInstallConfiguration installMode](self, "installMode"));

  objc_msgSend(v8, "setImportance:", -[IXRemoteInstallConfiguration importance](self, "importance"));
  id v9 = [(IXRemoteInstallConfiguration *)self iconData];
  objc_msgSend(v8, "setIconData:containingImageOfType:", v9, -[IXRemoteInstallConfiguration iconType](self, "iconType"));

  objc_msgSend(v8, "setStashMode:", -[IXRemoteInstallConfiguration stashMode](self, "stashMode"));
  id v10 = [(IXRemoteInstallConfiguration *)self deltaDirectoryURL];
  id v11 = [v10 copyWithZone:a3];
  [v8 setDeltaDirectoryURL:v11];

  objc_msgSend(v8, "setPairedAutoInstallOverride:", -[IXRemoteInstallConfiguration pairedAutoInstallOverride](self, "pairedAutoInstallOverride"));
  v12 = [(IXRemoteInstallConfiguration *)self storeMetadata];
  id v13 = [v12 copyWithZone:a3];
  [v8 setStoreMetadata:v13];

  objc_super v14 = [(IXRemoteInstallConfiguration *)self sinfData];
  id v15 = [v14 copyWithZone:a3];
  [v8 setSinfData:v15];

  v16 = [(IXRemoteInstallConfiguration *)self provisioningProfileDatas];
  id v17 = [v16 copyWithZone:a3];
  [v8 setProvisioningProfileDatas:v17];

  objc_msgSend(v8, "setProvisioningProfileInstallFailureIsFatal:", -[IXRemoteInstallConfiguration provisioningProfileInstallFailureIsFatal](self, "provisioningProfileInstallFailureIsFatal"));
  v18 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetURL];
  id v19 = [v18 copyWithZone:a3];
  [v8 setRemoteInstallTargetURL:v19];

  v20 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetDirectoryURL];
  id v21 = [v20 copyWithZone:a3];
  [v8 setRemoteInstallTargetDirectoryURL:v21];

  v22 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetBundleName];
  id v23 = [v22 copyWithZone:a3];
  [v8 setRemoteInstallTargetBundleName:v23];

  objc_msgSend(v8, "setInstallableType:", -[IXRemoteInstallConfiguration installableType](self, "installableType"));
  v24 = [(IXRemoteInstallConfiguration *)self targetLastPathComponent];
  id v25 = [v24 copyWithZone:a3];
  [v8 setTargetLastPathComponent:v25];

  v26 = [(IXRemoteInstallConfiguration *)self bundleVersion];
  id v27 = [v26 copyWithZone:a3];
  [v8 setBundleVersion:v27];

  v28 = [(IXRemoteInstallConfiguration *)self geoJSONData];
  id v29 = [v28 copyWithZone:a3];
  [v8 setGeoJSONData:v29];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IXRemoteInstallConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v14 = 1;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v14 = 0;
    goto LABEL_13;
  }
  id v5 = v4;
  v6 = [(IXRemoteInstallConfiguration *)self bundleID];
  v7 = [(IXRemoteInstallConfiguration *)v5 bundleID];
  id v8 = v6;
  id v9 = v7;
  id v10 = v9;
  if ((v8 != 0) != (v9 != 0) || v8 && v9 && ![v8 isEqual:v9]) {
    goto LABEL_8;
  }

  id v11 = [(IXRemoteInstallConfiguration *)self localizedName];
  v12 = [(IXRemoteInstallConfiguration *)v5 localizedName];
  id v8 = v11;
  id v13 = v12;
  id v10 = v13;
  if ((v8 != 0) != (v13 != 0) || v8 && v13 && ![v8 isEqual:v13])
  {
LABEL_8:

    BOOL v14 = 0;
  }
  else
  {

    unsigned int v16 = [(IXRemoteInstallConfiguration *)self installMode];
    if (v16 != [(IXRemoteInstallConfiguration *)v5 installMode]) {
      goto LABEL_35;
    }
    unsigned int v17 = [(IXRemoteInstallConfiguration *)self importance];
    if (v17 != [(IXRemoteInstallConfiguration *)v5 importance]) {
      goto LABEL_35;
    }
    v18 = [(IXRemoteInstallConfiguration *)self iconData];
    id v19 = [(IXRemoteInstallConfiguration *)v5 iconData];
    BOOL v20 = sub_100009304(v18, v19);

    if (!v20) {
      goto LABEL_35;
    }
    unsigned int v21 = [(IXRemoteInstallConfiguration *)self iconType];
    if (v21 != [(IXRemoteInstallConfiguration *)v5 iconType]) {
      goto LABEL_35;
    }
    unsigned int v22 = [(IXRemoteInstallConfiguration *)self stashMode];
    if (v22 != [(IXRemoteInstallConfiguration *)v5 stashMode]) {
      goto LABEL_35;
    }
    id v23 = [(IXRemoteInstallConfiguration *)self deltaDirectoryURL];
    v24 = [(IXRemoteInstallConfiguration *)v5 deltaDirectoryURL];
    BOOL v25 = sub_100009304(v23, v24);

    if (!v25) {
      goto LABEL_35;
    }
    unsigned int v26 = [(IXRemoteInstallConfiguration *)self pairedAutoInstallOverride];
    if (v26 != [(IXRemoteInstallConfiguration *)v5 pairedAutoInstallOverride]) {
      goto LABEL_35;
    }
    id v27 = [(IXRemoteInstallConfiguration *)self storeMetadata];
    v28 = [(IXRemoteInstallConfiguration *)v5 storeMetadata];
    BOOL v29 = sub_100009304(v27, v28);

    if (!v29) {
      goto LABEL_35;
    }
    v30 = [(IXRemoteInstallConfiguration *)self sinfData];
    v31 = [(IXRemoteInstallConfiguration *)v5 sinfData];
    BOOL v32 = sub_100009304(v30, v31);

    if (!v32) {
      goto LABEL_35;
    }
    v33 = [(IXRemoteInstallConfiguration *)self provisioningProfileDatas];
    v34 = [(IXRemoteInstallConfiguration *)v5 provisioningProfileDatas];
    BOOL v35 = sub_100009304(v33, v34);

    if (!v35) {
      goto LABEL_35;
    }
    unsigned int v36 = [(IXRemoteInstallConfiguration *)self provisioningProfileInstallFailureIsFatal];
    if (v36 != [(IXRemoteInstallConfiguration *)v5 provisioningProfileInstallFailureIsFatal])goto LABEL_35; {
    v37 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetURL];
    }
    v38 = [(IXRemoteInstallConfiguration *)v5 remoteInstallTargetURL];
    BOOL v39 = sub_100009304(v37, v38);

    if (!v39) {
      goto LABEL_35;
    }
    v40 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetDirectoryURL];
    v41 = [(IXRemoteInstallConfiguration *)v5 remoteInstallTargetDirectoryURL];
    BOOL v42 = sub_100009304(v40, v41);

    if (!v42) {
      goto LABEL_35;
    }
    v43 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetBundleName];
    v44 = [(IXRemoteInstallConfiguration *)v5 remoteInstallTargetBundleName];
    BOOL v45 = sub_100009304(v43, v44);

    if (!v45) {
      goto LABEL_35;
    }
    unsigned int v46 = [(IXRemoteInstallConfiguration *)self installableType];
    if (v46 != [(IXRemoteInstallConfiguration *)v5 installableType]) {
      goto LABEL_35;
    }
    v47 = [(IXRemoteInstallConfiguration *)self targetLastPathComponent];
    v48 = [(IXRemoteInstallConfiguration *)v5 targetLastPathComponent];
    BOOL v49 = sub_100009304(v47, v48);

    if (!v49
      || ([(IXRemoteInstallConfiguration *)self bundleVersion],
          v50 = objc_claimAutoreleasedReturnValue(),
          [(IXRemoteInstallConfiguration *)v5 bundleVersion],
          v51 = objc_claimAutoreleasedReturnValue(),
          BOOL v52 = sub_100009304(v50, v51),
          v51,
          v50,
          !v52))
    {
LABEL_35:
      BOOL v14 = 0;
      goto LABEL_10;
    }
    id v8 = [(IXRemoteInstallConfiguration *)self geoJSONData];
    id v10 = [(IXRemoteInstallConfiguration *)v5 geoJSONData];
    BOOL v14 = sub_100009304(v8, v10);
  }

LABEL_10:
LABEL_13:

  return v14;
}

- (unint64_t)hash
{
  v3 = [(IXRemoteInstallConfiguration *)self bundleID];
  unint64_t v4 = (unint64_t)[v3 hash];

  id v5 = [(IXRemoteInstallConfiguration *)self localizedName];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  unint64_t v7 = v6 ^ [(IXRemoteInstallConfiguration *)self installMode];
  uint64_t v8 = [(IXRemoteInstallConfiguration *)self importance];
  id v9 = [(IXRemoteInstallConfiguration *)self iconData];
  unint64_t v10 = v7 ^ v8 ^ (unint64_t)[v9 hash];

  uint64_t v11 = [(IXRemoteInstallConfiguration *)self iconType];
  uint64_t v12 = v11 ^ [(IXRemoteInstallConfiguration *)self stashMode];
  id v13 = [(IXRemoteInstallConfiguration *)self deltaDirectoryURL];
  unint64_t v14 = v10 ^ v12 ^ (unint64_t)[v13 hash];

  uint64_t v15 = [(IXRemoteInstallConfiguration *)self pairedAutoInstallOverride];
  unsigned int v16 = [(IXRemoteInstallConfiguration *)self storeMetadata];
  unint64_t v17 = v15 ^ (unint64_t)[v16 hash];

  v18 = [(IXRemoteInstallConfiguration *)self sinfData];
  unint64_t v19 = v17 ^ (unint64_t)[v18 hash];

  BOOL v20 = [(IXRemoteInstallConfiguration *)self provisioningProfileDatas];
  unint64_t v21 = v14 ^ v19 ^ (unint64_t)[v20 hash];

  uint64_t v22 = [(IXRemoteInstallConfiguration *)self provisioningProfileInstallFailureIsFatal];
  id v23 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetURL];
  unint64_t v24 = v22 ^ (unint64_t)[v23 hash];

  BOOL v25 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetDirectoryURL];
  unint64_t v26 = v24 ^ (unint64_t)[v25 hash];

  id v27 = [(IXRemoteInstallConfiguration *)self remoteInstallTargetBundleName];
  unint64_t v28 = v26 ^ (unint64_t)[v27 hash];

  unint64_t v29 = v21 ^ v28 ^ [(IXRemoteInstallConfiguration *)self installableType];
  v30 = [(IXRemoteInstallConfiguration *)self targetLastPathComponent];
  unint64_t v31 = (unint64_t)[v30 hash];

  BOOL v32 = [(IXRemoteInstallConfiguration *)self bundleVersion];
  unint64_t v33 = v31 ^ (unint64_t)[v32 hash];

  v34 = [(IXRemoteInstallConfiguration *)self geoJSONData];
  unint64_t v35 = v29 ^ v33 ^ (unint64_t)[v34 hash];

  return v35;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  unint64_t v4 = NSStringFromClass(v3);
  id v5 = [(IXRemoteInstallConfiguration *)self bundleID];
  unint64_t v6 = [(IXRemoteInstallConfiguration *)self localizedName];
  unsigned int v7 = [(IXRemoteInstallConfiguration *)self installMode];
  unint64_t v8 = [(IXRemoteInstallConfiguration *)self deltaScheme];
  id v9 = [(IXRemoteInstallConfiguration *)self deltaDirectoryURL];
  unint64_t v10 = [v9 path];
  uint64_t v11 = +[NSString stringWithFormat:@"<%@ 0x%p: bundleID=%@ localizedName=%@ installMode=%hhu deltaScheme=%lu deltaDirectory=%@>", v4, self, v5, v6, v7, v8, v10];

  return v11;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (unsigned)installMode
{
  return self->_installMode;
}

- (unsigned)importance
{
  return self->_importance;
}

- (void)setImportance:(unsigned __int8)a3
{
  self->_importance = a3;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (unsigned)iconType
{
  return self->_iconType;
}

- (unsigned)stashMode
{
  return self->_stashMode;
}

- (void)setStashMode:(unsigned __int8)a3
{
  self->_stashMode = a3;
}

- (NSURL)deltaDirectoryURL
{
  return self->_deltaDirectoryURL;
}

- (void)setDeltaDirectoryURL:(id)a3
{
}

- (unint64_t)deltaScheme
{
  return self->_deltaScheme;
}

- (void)setDeltaScheme:(unint64_t)a3
{
  self->_deltaScheme = a3;
}

- (unsigned)pairedAutoInstallOverride
{
  return self->_pairedAutoInstallOverride;
}

- (void)setPairedAutoInstallOverride:(unsigned __int8)a3
{
  self->_pairedAutoInstallOverride = a3;
}

- (NSDictionary)storeMetadata
{
  return self->_storeMetadata;
}

- (void)setStoreMetadata:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (NSArray)provisioningProfileDatas
{
  return self->_provisioningProfileDatas;
}

- (void)setProvisioningProfileDatas:(id)a3
{
}

- (BOOL)provisioningProfileInstallFailureIsFatal
{
  return self->_provisioningProfileInstallFailureIsFatal;
}

- (void)setProvisioningProfileInstallFailureIsFatal:(BOOL)a3
{
  self->_provisioningProfileInstallFailureIsFatal = a3;
}

- (NSURL)remoteInstallTargetURL
{
  return self->_remoteInstallTargetURL;
}

- (void)setRemoteInstallTargetURL:(id)a3
{
}

- (NSURL)remoteInstallTargetDirectoryURL
{
  return self->_remoteInstallTargetDirectoryURL;
}

- (void)setRemoteInstallTargetDirectoryURL:(id)a3
{
}

- (NSString)remoteInstallTargetBundleName
{
  return self->_remoteInstallTargetBundleName;
}

- (void)setRemoteInstallTargetBundleName:(id)a3
{
}

- (unsigned)installableType
{
  return self->_installableType;
}

- (void)setInstallableType:(unsigned __int8)a3
{
  self->_installableType = a3;
}

- (NSData)geoJSONData
{
  return self->_geoJSONData;
}

- (void)setGeoJSONData:(id)a3
{
}

- (NSString)targetLastPathComponent
{
  return self->_targetLastPathComponent;
}

- (void)setTargetLastPathComponent:(id)a3
{
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_targetLastPathComponent, 0);
  objc_storeStrong((id *)&self->_geoJSONData, 0);
  objc_storeStrong((id *)&self->_remoteInstallTargetBundleName, 0);
  objc_storeStrong((id *)&self->_remoteInstallTargetDirectoryURL, 0);
  objc_storeStrong((id *)&self->_remoteInstallTargetURL, 0);
  objc_storeStrong((id *)&self->_provisioningProfileDatas, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_storeMetadata, 0);
  objc_storeStrong((id *)&self->_deltaDirectoryURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end