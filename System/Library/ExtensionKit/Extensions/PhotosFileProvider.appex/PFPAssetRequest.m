@interface PFPAssetRequest
+ (void)_exportThumbnailForAsset:(id)a3 thumbnailSize:(int64_t)a4 fileProviderURL:(id)a5 progress:(id)a6 completion:(id)a7;
+ (void)_markURLAsPurgable:(id)a3 completionHandler:(id)a4;
+ (void)_replaceAssetAtURL:(id)a3 withItemAtURL:(id)a4 completionHandler:(id)a5;
+ (void)_saveImageRef:(CGImage *)a3 toURL:(id)a4 completionHandler:(id)a5;
+ (void)requestFileForPhotosFileProviderURL:(id)a3 progressCreation:(id)a4 completion:(id)a5;
@end

@implementation PFPAssetRequest

+ (void)_markURLAsPurgable:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id, void))a4;
  if (+[PLCacheDeleteSupport markPurgeableForFileAtURL:v5 withUrgency:0 outInode:0])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Marked file provider URL (%@) as purgeable.", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to mark file provider URL (%@) as purgeable.", (uint8_t *)&v7, 0xCu);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully provided file at URL: %@", (uint8_t *)&v7, 0xCu);
  }
  v6[2](v6, v5, 0);
}

+ (void)_replaceAssetAtURL:(id)a3 withItemAtURL:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, id))a5;
  v11 = +[NSFileManager defaultManager];
  id v14 = 0;
  unsigned int v12 = [v11 replaceItemAtURL:v8 withItemAtURL:v9 backupItemName:0 options:0 resultingItemURL:0 error:&v14];
  id v13 = v14;

  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Replaced existing file at URL (%@) with URL (%@).", buf, 0x16u);
    }
    [a1 _markURLAsPurgable:v8 completionHandler:v10];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to replace file at URL (%@) with URL (%@) with error: %@", buf, 0x20u);
    }
    v10[2](v10, 0, v13);
  }
}

+ (void)_saveImageRef:(CGImage *)a3 toURL:(id)a4 completionHandler:(id)a5
{
  CFURLRef v8 = (const __CFURL *)a4;
  id v9 = (void (**)(id, void, void *))a5;
  v10 = [UTTypeJPEG identifier];
  v11 = CGImageDestinationCreateWithURL(v8, v10, 1uLL, 0);

  if (v11)
  {
    CGImageDestinationAddImage(v11, a3, 0);
    if (CGImageDestinationFinalize(v11))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFURLRef v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Saved image ref at URL (%@).", buf, 0xCu);
      }
      [a1 _markURLAsPurgable:v8 completionHandler:v9];
    }
    else
    {
      NSErrorUserInfoKey v22 = NSDebugDescriptionErrorKey;
      CFStringRef v23 = @"Failed to write image ref";
      id v14 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      v15 = +[NSError errorWithDomain:@"PFPAssetRequestErrorDomain" code:-1 userInfo:v14];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFURLRef v19 = v8;
        __int16 v20 = 2112;
        v21 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to saved image ref to URL (%@) with error: %@", buf, 0x16u);
      }
      v9[2](v9, 0, v15);
    }
    CFRelease(v11);
  }
  else
  {
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"Failed to create destination ref";
    unsigned int v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v13 = +[NSError errorWithDomain:@"PFPAssetRequestErrorDomain" code:-1 userInfo:v12];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFURLRef v19 = v8;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to saved image ref to URL (%@) with error: %@", buf, 0x16u);
    }
    v9[2](v9, 0, v13);
  }
}

+ (void)_exportThumbnailForAsset:(id)a3 thumbnailSize:(int64_t)a4 fileProviderURL:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (a4 == 1)
  {
    double v17 = 120.0;
  }
  else
  {
    double v17 = 360.0;
    if (!a4)
    {
      id v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2, a1, @"PFPAssetRequest.m", 195, @"Invalid parameter not satisfying: %@", @"thumbnailSize != PXPhotosFileProviderThumbnailSizeUndefined" object file lineNumber description];

      double v17 = 360.0;
    }
  }
  id v19 = objc_alloc_init((Class)PHImageRequestOptions);
  [v19 setDeliveryMode:1];
  [v19 setNetworkAccessAllowed:0];
  __int16 v20 = +[PHImageManager defaultManager];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100004EF4;
  v24[3] = &unk_1000082A8;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = a1;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  objc_msgSend(v20, "requestNewCGImageForAsset:targetSize:contentMode:options:resultHandler:", v13, 0, v19, v24, v17, v17);
}

+ (void)requestFileForPhotosFileProviderURL:(id)a3 progressCreation:(id)a4 completion:(id)a5
{
  id v9 = a3;
  v10 = (void (**)(id, void *))a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_33:
    id v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2, a1, @"PFPAssetRequest.m", 126, @"Invalid parameter not satisfying: %@", @"progressCreation" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_34;
  }
  id v26 = +[NSAssertionHandler currentHandler];
  [v26 handleFailureInMethod:a2, a1, @"PFPAssetRequest.m", 125, @"Invalid parameter not satisfying: %@", @"fileProviderURL" object file lineNumber description];

  if (!v10) {
    goto LABEL_33;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_34:
  id v28 = +[NSAssertionHandler currentHandler];
  [v28 handleFailureInMethod:a2, a1, @"PFPAssetRequest.m", 127, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  unsigned int v12 = +[NSProgress progressWithTotalUnitCount:100];
  v10[2](v10, v12);
  id v13 = [[PFPAssetRequestConfiguration alloc] initWithFileProviderURL:v9];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(PFPAssetRequestConfiguration *)v13 debugDescription];
    *(_DWORD *)buf = 138412546;
    v42 = v14;
    __int16 v43 = 2112;
    id v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Created configuration (%@) from file provider URL: %@", buf, 0x16u);
  }
  id v15 = [(PFPAssetRequestConfiguration *)v13 photoLibrary];
  if (v15)
  {
LABEL_11:
    id v18 = [(PFPAssetRequestConfiguration *)v13 localIdentifier];
    if (!v18)
    {
      id v19 = [(PFPAssetRequestConfiguration *)v13 UUID];
      id v20 = [v19 length];

      if (v20)
      {
        id v21 = [(PFPAssetRequestConfiguration *)v13 UUID];
        id v18 = +[PHAsset localIdentifierWithUUID:v21];
      }
      else
      {
        id v18 = 0;
      }
    }
    id v22 = objc_msgSend(v15, "px_fetchObjectWithLocalIdentifier:", v18);
    if (!v22)
    {
      id v29 = v11;
      v39[0] = NSDebugDescriptionErrorKey;
      v39[1] = NSURLErrorKey;
      v40[0] = @"Failed to fetch PHObject";
      v40[1] = v9;
      v24 = +[NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
      id v23 = +[NSError errorWithDomain:@"PFPAssetRequestErrorDomain" code:0 userInfo:v24];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to fetch PHObject with localIdentifier: %@", buf, 0xCu);
      }
      id v11 = v29;
      (*((void (**)(id, void, void *))v29 + 2))(v29, 0, v23);
      goto LABEL_30;
    }
    [v12 setCompletedUnitCount:1];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v22;
      __int16 v43 = 2112;
      id v44 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Finished fetching object: %@ (progress: %@)", buf, 0x16u);
    }
    id v23 = [(PFPAssetRequestConfiguration *)v13 exportConfiguration];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(PFPAssetRequestConfiguration *)v13 thumbnailSize])
      {
        objc_msgSend(a1, "_exportThumbnailForAsset:thumbnailSize:fileProviderURL:progress:completion:", v22, -[PFPAssetRequestConfiguration thumbnailSize](v13, "thumbnailSize"), v9, v12, v11);
LABEL_30:

        goto LABEL_31;
      }
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000057B8;
      v34[3] = &unk_100008280;
      id v37 = a1;
      id v35 = v9;
      id v36 = v11;
      +[PXPhotosExportUtilities exportAsset:v22 configuration:v23 progress:v12 completion:v34];

      id v25 = v35;
    }
    else
    {
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000057E0;
      v30[3] = &unk_100008280;
      id v33 = a1;
      id v31 = v9;
      id v32 = v11;
      +[PXPhotosExportUtilities exportAssetsInContainer:v22 configuration:v23 progress:v12 completion:v30];

      id v25 = v31;
    }

    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Missing photo library so fallback to the system photo library.", buf, 2u);
  }
  id v38 = 0;
  uint64_t v16 = +[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:1 error:&v38];
  id v17 = v38;
  id v15 = v17;
  if (v16)
  {

    id v15 = (void *)v16;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't open system photo library: %@", buf, 0xCu);
  }
  (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v15);
LABEL_31:
}

@end