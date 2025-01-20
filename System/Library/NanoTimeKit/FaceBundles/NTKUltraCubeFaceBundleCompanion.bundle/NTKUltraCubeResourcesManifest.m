@interface NTKUltraCubeResourcesManifest
- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4;
- (unint64_t)maxCompatibleVersion;
- (unint64_t)maxNumberOfPhotos;
- (unint64_t)minCompatibleVersion;
@end

@implementation NTKUltraCubeResourcesManifest

- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(NTKUltraCubeResourcesManifest *)self resourceDirectoryURL];
    v8 = [v7 lastPathComponent];
    v9 = [v5 objectForKeyedSubscript:@"localIdentifier"];
    int v15 = 138412546;
    v16 = v8;
    __int16 v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: validating image list item: %@", (uint8_t *)&v15, 0x16u);
  }
  if (!+[NTKUltraCubePhoto validateDictionary:v5])
  {
    v10 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_2B874(self, v5, v10);
    }
    goto LABEL_15;
  }
  v10 = [v5 objectForKeyedSubscript:@"baseImageURL"];
  if (![(NTKUltraCubeResourcesManifest *)self resourceWithName:v10 isValidMediaAssetOfType:&off_4B500 withMinFileSize:1000 maxFileSize:4000000]|| ![(NTKUltraCubeResourcesManifest *)self resourceWithNameIsValidImage:v10])
  {
LABEL_15:
    BOOL v13 = 0;
    goto LABEL_16;
  }
  v11 = [v5 objectForKeyedSubscript:@"backgroundImageURL"];
  if (!v11
    || [(NTKUltraCubeResourcesManifest *)self resourceWithName:v11 isValidMediaAssetOfType:&off_4B500 withMinFileSize:1000 maxFileSize:4000000]&& [(NTKUltraCubeResourcesManifest *)self resourceWithNameIsValidImage:v11])
  {
    v12 = [v5 objectForKeyedSubscript:@"maskImageURL"];
    BOOL v13 = !v12
       || [(NTKUltraCubeResourcesManifest *)self resourceWithName:v12 isValidMediaAssetOfType:&off_4B518 withMinFileSize:1000 maxFileSize:4000000]&& [(NTKUltraCubeResourcesManifest *)self resourceWithNameIsValidImage:v12];
  }
  else
  {
    BOOL v13 = 0;
  }

LABEL_16:
  return v13;
}

- (unint64_t)minCompatibleVersion
{
  return 2;
}

- (unint64_t)maxCompatibleVersion
{
  return 2;
}

- (unint64_t)maxNumberOfPhotos
{
  return 24;
}

@end