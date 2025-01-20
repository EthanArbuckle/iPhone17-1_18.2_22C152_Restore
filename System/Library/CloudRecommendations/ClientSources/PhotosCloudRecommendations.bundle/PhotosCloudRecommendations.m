uint64_t PLUIGetLog()
{
  return _PLUIGetLog();
}

uint64_t PULocalizedString()
{
  return _PULocalizedString();
}

uint64_t PUStringWithValidatedFormat()
{
  return _PUStringWithValidatedFormat();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_cloudStorageTotalBytesSize(void *a1, const char *a2, ...)
{
  return [a1 cloudStorageTotalBytesSize];
}

id objc_msgSend_shouldShowCloudStorageTip(void *a1, const char *a2, ...)
{
  return [a1 shouldShowCloudStorageTip];
}

id objc_msgSend_storageManagementUtility(void *a1, const char *a2, ...)
{
  return [a1 storageManagementUtility];
}

id objc_msgSend_stringFromByteCount_countStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromByteCount:countStyle:");
}
, "Cloud Storage Recoverable: %@", buf, 0xCu);
    }
    v11 = PULocalizedString();
    v23 = +[NSByteCountFormatter stringFromByteCount:v8 countStyle:0];
    v24 = PUStringWithValidatedFormat();

    v12 = objc_alloc((Class)CENativeModalRecommendationAction);
    v13 = PULocalizedString();
    v14 = objc_msgSend(v12, "initWithIdentifier:title:detailControllerClass:", @"com.apple.mobileslideshow-reviewPhotosAndVideos", v13, objc_opt_class(), v23);

    v15 = objc_alloc((Class)CERecommendation);
    v16 = PULocalizedString();
    v17 = [(PhotosCloudRecommendations *)self bundleID];
    v18 = +[NSNumber numberWithUnsignedLong:v8];
    v19 = CERecommendationTypeDeclutter;
    v26 = v14;
    v20 = +[NSArray arrayWithObjects:&v26 count:1];
    v21 = [v15 initWithIdentifier:@"com.apple.mobileslideshow-reviewPhotosAndVideos" title:v16 message:v24 bundleID:v17 storageRecoverable:v18 category:v19 actions:v20];

    v25 = v21;
    v22 = +[NSArray arrayWithObjects:&v25 count:1];
    v6[2](v6, v22, 0);
  }
  else
  {
    v6[2](v6, &__NSArray0__struct, 0);
  }
}

- (id)bundleID
{
  return @"com.apple.mobileslideshow";
}

- (PhotosCloudRecommendations)init
{
  v8.receiver = self;
  v8.super_class = (Class)PhotosCloudRecommendations;
  v2 = [(PhotosCloudRecommendations *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)PUStorageManagementUtility);
    v4 = +[PHPhotoLibrary px_systemPhotoLibrary];
    v5 = (PUStorageManagementUtility *)[v3 initWithPhotoLibrary:v4];
    storageManagementUtility = v2->_storageManagementUtility;
    v2->_storageManagementUtility = v5;
  }
  return v2;
}

@end