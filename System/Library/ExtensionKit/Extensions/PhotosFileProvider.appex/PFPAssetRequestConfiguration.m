@interface PFPAssetRequestConfiguration
+ (id)analyticsActivityTypeFromFileProviderURL:(id)a3;
- (NSString)UUID;
- (NSString)localIdentifier;
- (PFPAssetRequestConfiguration)initWithFileProviderURL:(id)a3;
- (PHPhotoLibrary)photoLibrary;
- (PXPhotosExportConfiguration)exportConfiguration;
- (id)debugDescription;
- (int64_t)thumbnailSize;
@end

@implementation PFPAssetRequestConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportConfiguration, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (PXPhotosExportConfiguration)exportConfiguration
{
  return self->_exportConfiguration;
}

- (int64_t)thumbnailSize
{
  return self->_thumbnailSize;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (id)debugDescription
{
  v3 = [(PFPAssetRequestConfiguration *)self UUID];
  v4 = [(PFPAssetRequestConfiguration *)self photoLibrary];
  v5 = [(PFPAssetRequestConfiguration *)self exportConfiguration];
  v6 = +[NSString stringWithFormat:@"UUID: %@, PhotoLibrary: %@, ExportConfiguration: %@", v3, v4, v5];

  return v6;
}

- (PFPAssetRequestConfiguration)initWithFileProviderURL:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)PFPAssetRequestConfiguration;
  v5 = [(PFPAssetRequestConfiguration *)&v61 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_41;
  }
  v52 = v5;
  id v7 = objc_alloc_init((Class)NSURLComponents);
  id v53 = v4;
  v8 = [v4 URLByDeletingPathExtension];
  v9 = [v8 lastPathComponent];
  [v7 setQuery:v9];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v51 = v7;
  v10 = [v7 queryItems];
  id v11 = [v10 countByEnumeratingWithState:&v57 objects:v66 count:16];
  if (!v11)
  {
    id v54 = 0;
    v55 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_23;
  }
  id v12 = v11;
  id v54 = 0;
  v55 = 0;
  v13 = 0;
  v14 = 0;
  uint64_t v15 = *(void *)v58;
  do
  {
    v16 = 0;
    do
    {
      if (*(void *)v58 != v15) {
        objc_enumerationMutation(v10);
      }
      v17 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v16);
      v18 = [v17 name];
      v19 = PXPhotosFileProviderURLQueryItemUUIDKey();
      unsigned int v20 = [v18 isEqualToString:v19];

      if (v20)
      {
        uint64_t v21 = [v17 value];

        v14 = (void *)v21;
        goto LABEL_17;
      }
      v22 = [v17 name];
      v23 = PXPhotosFileProviderURLQueryItemIdentifierCodeKey();
      unsigned int v24 = [v22 isEqualToString:v23];

      if (v24)
      {
        uint64_t v25 = [v17 value];

        v13 = (void *)v25;
        goto LABEL_17;
      }
      v26 = [v17 name];
      v27 = PXPhotosFileProviderURLQueryItemLibraryIdentifierKey();
      unsigned int v28 = [v26 isEqualToString:v27];

      if (v28)
      {
        uint64_t v29 = [v17 value];

        v55 = (void *)v29;
        goto LABEL_17;
      }
      v30 = [v17 name];
      v31 = PXPhotosFileProviderURLQueryItemThumbnailSizeKey();
      unsigned int v32 = [v30 isEqualToString:v31];

      if (v32)
      {
        v33 = [v17 value];
        id v54 = [v33 integerValue];
LABEL_15:

        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v33 = [v17 name];
        v34 = [v17 value];
        *(_DWORD *)buf = 138412546;
        v63 = v33;
        __int16 v64 = 2112;
        id v65 = v34;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unknown URL query item (name: %@, value: %@)", buf, 0x16u);

        goto LABEL_15;
      }
LABEL_17:
      v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    id v35 = [v10 countByEnumeratingWithState:&v57 objects:v66 count:16];
    id v12 = v35;
  }
  while (v35);
LABEL_23:

  if ([v55 isEqualToString:@"cmm"])
  {
    v36 = +[PHPhotoLibrary sharedMomentSharePhotoLibrary];
    id v37 = 0;
    v6 = v52;
    id v4 = v53;
    if (!v36) {
      goto LABEL_30;
    }
  }
  else
  {
    v38 = (char *)[v55 integerValue];
    v6 = v52;
    id v4 = v53;
    if ((unint64_t)(v38 - 1) > 2)
    {
      id v37 = 0;
      goto LABEL_30;
    }
    id v56 = 0;
    v36 = +[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:v38 error:&v56];
    id v37 = v56;
    if (!v36)
    {
LABEL_30:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v63 = v55;
        __int16 v64 = 2112;
        id v65 = v37;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't open photo library with identifier (%{public}@): %@", buf, 0x16u);
      }
      v36 = 0;
    }
  }
  v39 = [v4 pathExtension];
  v40 = +[PFUniformTypeUtilities typeWithFilenameExtension:v39];

  if (!v40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v50 = [v4 pathExtension];
    *(_DWORD *)buf = 138412290;
    v63 = v50;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't find possible content type with extension: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&v6->_UUID, v14);
  if ([v14 length] && objc_msgSend(v13, "length"))
  {
    uint64_t v41 = +[NSString stringWithFormat:@"%@/L0/%@", v14, v13];
    localIdentifier = v6->_localIdentifier;
    v6->_localIdentifier = (NSString *)v41;
  }
  else
  {
    localIdentifier = v6->_localIdentifier;
    v6->_localIdentifier = 0;
  }

  photoLibrary = v6->_photoLibrary;
  v6->_photoLibrary = v36;
  v44 = v36;

  v6->_thumbnailSize = (int64_t)v54;
  v45 = [v51 queryItems];
  uint64_t v46 = +[PXPhotosExportConfiguration configurationWithQueryItems:v45 possibleContentType:v40];
  exportConfiguration = v6->_exportConfiguration;
  v6->_exportConfiguration = (PXPhotosExportConfiguration *)v46;

  v48 = [(id)objc_opt_class() analyticsActivityTypeFromFileProviderURL:v4];
  [(PXPhotosExportConfiguration *)v6->_exportConfiguration setActivityTypeForAssetExportAnalytics:v48];

LABEL_41:
  return v6;
}

+ (id)analyticsActivityTypeFromFileProviderURL:(id)a3
{
  v3 = [a3 URLByDeletingLastPathComponent];
  id v4 = [v3 lastPathComponent];
  if (![(__CFString *)v4 length])
  {

    id v4 = @"unknown";
  }
  v5 = [(__CFString *)v4 lowercaseString];

  v6 = +[NSBundle mainBundle];
  id v7 = [v6 bundleIdentifier];

  if (![(__CFString *)v7 length])
  {

    id v7 = @"com.apple.PhotosFileProvider";
  }
  v8 = +[NSString stringWithFormat:@"%@.%@", v7, v5];

  return v8;
}

@end