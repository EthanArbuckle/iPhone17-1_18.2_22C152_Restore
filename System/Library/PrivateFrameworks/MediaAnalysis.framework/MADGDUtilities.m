@interface MADGDUtilities
+ (MADGDUtilities)sharedInstance;
+ (id)fetchKeyFaceLocalIdentifiersForPhotoLibrary:(id)a3;
+ (unint64_t)clusterFaceCountThreshold;
- (BOOL)_addFacesWithFaceBatch:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)_removeObservationIDs:(id)a3 fromGallery:(id)a4;
- (BOOL)_resetObservationIDForFaces:(id)a3 fromPhotoLibrary:(id)a4;
- (BOOL)prepareClusteringWithFaces:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)removeObservationsWithAssetLocalIdentifiers:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6;
- (BOOL)syncVisualUnderstandingService:(id)a3 withPhotosLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (BOOL)updatePersonWithPhotosLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 keyFaceLocalIdentifiers:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11;
- (BOOL)updatePersonWithSyndicationLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 cancelOrExtendTimeoutBlock:(id)a9 error:(id *)a10;
- (MADGDUtilities)init;
- (int)_fetchChangedPersonSinceChangeToken:(id)a3 photosLibrary:(id)a4 changedPersonLocalIdentifiers:(id *)a5 latestChangeToken:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7;
- (void)_dedupeGraphVerifiedPersonsForPerson:(id)a3 photoLibrary:(id)a4;
- (void)_deleteUnverifiedPersonsWithZeroFaces:(id)a3;
- (void)flush;
@end

@implementation MADGDUtilities

- (MADGDUtilities)init
{
  v7.receiver = self;
  v7.super_class = (Class)MADGDUtilities;
  v2 = [(MADGDUtilities *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MADGDUtilities", v3);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

+ (MADGDUtilities)sharedInstance
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  dispatch_queue_t v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&stru_10021EBC0];

  return (MADGDUtilities *)v5;
}

+ (unint64_t)clusterFaceCountThreshold
{
  return 20000;
}

- (void)flush
{
}

- (BOOL)_removeObservationIDs:(id)a3 fromGallery:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    objc_super v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 134217984;
      id v21 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[GallerySync] Removing %lu observation(s) from Gallery", buf, 0xCu);
    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10014BFB4;
  v18[3] = &unk_10021EC08;
  id v9 = v5;
  id v19 = v9;
  v10 = objc_retainBlock(v18);
  id v17 = 0;
  unsigned __int8 v11 = [v6 mutateAndReturnError:&v17 handler:v10];

  id v12 = v17;
  if ((v11 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v14))
    {
      id v15 = [v9 count];
      *(_DWORD *)buf = 134218242;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[GallerySync] Failed to remove %lu observation from Gallery %@", buf, 0x16u);
    }
  }
  return v11;
}

- (BOOL)_resetObservationIDForFaces:(id)a3 fromPhotoLibrary:(id)a4
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10014C448;
  v15[3] = &unk_10021C738;
  id v5 = a3;
  id v16 = v5;
  id v14 = 0;
  unsigned __int8 v6 = [a4 performChangesAndWait:v15 error:&v14];
  id v7 = v14;
  int v8 = MediaAnalysisLogLevel();
  if (v6)
  {
    if (v8 >= 7)
    {
      id v9 = VCPLogInstance();
      os_log_type_t v10 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v9, v10))
      {
        id v11 = [v5 count];
        *(_DWORD *)buf = 134217984;
        id v18 = v11;
        id v12 = "[GallerySync] Reset %lu vuObservationID(s) in Photos";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v9, v10, v12, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v8 >= 3)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      id v12 = "[GallerySync] Failed to reset vuObservationID in Photos - %@";
      goto LABEL_8;
    }
LABEL_9:
  }
  return v6;
}

- (int)_fetchChangedPersonSinceChangeToken:(id)a3 photosLibrary:(id)a4 changedPersonLocalIdentifiers:(id *)a5 latestChangeToken:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v26 = a7;
  id v13 = objc_alloc_init((Class)PHPersistentChangeFetchRequest);
  [v13 setMaximumChangeThreshold:10000];
  [v13 setToken:v11];
  id v45 = 0;
  id v14 = [v12 fetchPersistentChangesWithRequest:v13 error:&v45];
  id v15 = v45;
  if (v15)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v17))
      {
        objc_msgSend(v15, "description", v26);
        id v18 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = @"[GallerySync][PersonChangeToken]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2112;
        v47 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Failed to fetch Photos changes since %@ (%@); falling back to full scan",
          buf,
          0x20u);
      }
    }
    int v19 = -23801;
  }
  else if ([v14 changeCount])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v20, v21))
      {
        unsigned int v22 = objc_msgSend(v14, "changeCount", v26);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"[GallerySync][PersonChangeToken]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Evaluating %d changes", buf, 0x12u);
      }
    }
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    int v44 = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v47 = sub_10014CA6C;
    v48 = sub_10014CA7C;
    id v49 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_10014CA6C;
    v39 = sub_10014CA7C;
    id v40 = +[NSMutableSet set];
    id v23 = +[NSMutableSet set];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10014CA84;
    v29[3] = &unk_10021EC30;
    v30 = @"[GallerySync][PersonChangeToken]";
    id v31 = v26;
    v32 = &v41;
    v33 = buf;
    v34 = &v35;
    [v14 enumeratePHChangesWithBlock:v29];
    int v19 = *((_DWORD *)v42 + 6);
    if (!v19)
    {
      if (a5) {
        *a5 = (id) v36[5];
      }
      v24 = (void *)v36[5];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10014CD04;
      v27[3] = &unk_10021EC58;
      v28 = @"[GallerySync][PersonChangeToken]";
      [v24 enumerateObjectsUsingBlock:v27];
      if (a6) {
        *a6 = *(id *)(*(void *)&buf[8] + 40);
      }
    }
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v41, 8);
  }
  else
  {
    int v19 = 0;
  }

  return v19;
}

- (void)_deleteUnverifiedPersonsWithZeroFaces:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v27 = @"[GallerySync][RemoveUnverifiedPerson]";
        __int16 v28 = 2048;
        id v29 = [v4 count];
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ Deleting %lu 0-face unverified persons", buf, 0x16u);
      }
    }
    id v7 = [v4 firstObject];
    int v8 = [v7 photoLibrary];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10014D094;
    v23[3] = &unk_10021EC80;
    id v9 = v4;
    id v24 = v9;
    SEL v25 = a2;
    id v22 = 0;
    unsigned __int8 v10 = [v8 performChangesAndWait:v23 error:&v22];
    id v11 = v22;

    int v12 = MediaAnalysisLogLevel();
    if (v10)
    {
      if (v12 >= 7)
      {
        id v13 = VCPLogInstance();
        os_log_type_t v14 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v13, v14))
        {
          id v15 = [v9 count];
          *(_DWORD *)buf = 138412546;
          CFStringRef v27 = @"[GallerySync][RemoveUnverifiedPerson]";
          __int16 v28 = 2048;
          id v29 = v15;
          id v16 = "%@ Deleted %lu 0-face unverified persons";
          os_log_type_t v17 = v13;
          os_log_type_t v18 = v14;
          uint32_t v19 = 22;
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if (v12 >= 3)
    {
      id v13 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v20))
      {
        id v21 = [v9 count];
        *(_DWORD *)buf = 138412802;
        CFStringRef v27 = @"[GallerySync][RemoveUnverifiedPerson]";
        __int16 v28 = 2048;
        id v29 = v21;
        __int16 v30 = 2112;
        id v31 = v11;
        id v16 = "%@ Failed to delete %lu 0-face unverified persons - %@";
        os_log_type_t v17 = v13;
        os_log_type_t v18 = v20;
        uint32_t v19 = 32;
        goto LABEL_13;
      }
LABEL_14:
    }
  }
}

- (BOOL)syncVisualUnderstandingService:(id)a3 withPhotosLibrary:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  id v11 = objc_msgSend(v9, "vcp_description");
  int v12 = +[NSString stringWithFormat:@"[GallerySync] Syncing VU Service w PL %@", v11];

  id v13 = +[MADStateHandler sharedStateHandler];
  [v13 addBreadcrumb:@"%@", v12];

  operationQueue = self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014D2F0;
  block[3] = &unk_10021EE10;
  id v20 = v9;
  id v21 = self;
  id v23 = v10;
  id v24 = &v25;
  id v22 = v8;
  id v15 = v8;
  id v16 = v10;
  id v17 = v9;
  dispatch_sync(operationQueue, block);
  LOBYTE(v10) = *((unsigned char *)v26 + 24);

  _Block_object_dispose(&v25, 8);
  return (char)v10;
}

- (BOOL)_addFacesWithFaceBatch:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [v9 firstObject];
  id v13 = [v12 photoLibrary];

  v39 = v10;
  if (v13)
  {
    os_log_type_t v14 = objc_msgSend(v13, "vcp_description");
    id v15 = +[NSString stringWithFormat:@"[GalleryAddFace][%@]", v14];

    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412546;
        id v51 = v15;
        __int16 v52 = 2048;
        id v53 = [v9 count];
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ Adding %lu faces to Gallery", buf, 0x16u);
      }
    }
    uint64_t v37 = a6;
    uint64_t v49 = PHAssetPropertySetImport;
    os_log_type_t v18 = +[NSArray arrayWithObjects:&v49 count:1];
    uint32_t v19 = +[PHAsset fetchAssetsGroupedByFaceUUIDForFaces:v9 fetchPropertySets:v18];
    if ([v19 count])
    {
      id v20 = [v13 librarySpecificFetchOptions];
      id v21 = [v19 allValues];
      id v22 = +[PHMoment fetchMomentUUIDByAssetUUIDForAssets:v21 options:v20];
    }
    else
    {
      id v22 = 0;
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100154BD0;
    v41[3] = &unk_10021EE60;
    id v30 = v13;
    id v42 = v30;
    id v43 = v9;
    id v38 = v11;
    id v48 = v11;
    id v26 = v15;
    id v44 = v26;
    id v28 = v19;
    id v45 = v28;
    id v31 = v22;
    id v46 = v31;
    id v47 = v10;
    v32 = objc_retainBlock(v41);
    id v40 = 0;
    unsigned __int8 v29 = [v30 performCancellableChangesAndWait:v32 error:&v40];
    id v33 = v40;
    if ((v29 & 1) == 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v34 = VCPLogInstance();
        os_log_type_t type = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v34, type))
        {
          *(_DWORD *)buf = 138412546;
          id v51 = v26;
          __int16 v52 = 2112;
          id v53 = v33;
          _os_log_impl((void *)&_mh_execute_header, v34, type, "%@ Failed to update face ObservationIDs from Gallery to Photos - %@", buf, 0x16u);
        }
      }
      if (v37) {
        *uint64_t v37 = [v33 copy];
      }
    }

    id v11 = v38;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v23 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v25 = [v9 firstObject];
        *(_DWORD *)buf = 138412290;
        id v51 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, v24, "[GalleryAddFace] Nil photo library for face %@", buf, 0xCu);
      }
    }
    if (!a6)
    {
      unsigned __int8 v29 = 0;
      goto LABEL_24;
    }
    NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
    id v26 = [v9 firstObject];
    +[NSString stringWithFormat:@"[GalleryAddFace] Nil photo library for face %@", v26];
    os_log_type_t v18 = v27 = a6;
    v55 = v18;
    id v28 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v28];
    unsigned __int8 v29 = 0;
    *uint64_t v27 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_24:
  return v29;
}

- (BOOL)prepareClusteringWithFaces:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  id v33 = sub_10014CA6C;
  v34 = sub_10014CA7C;
  id v35 = 0;
  operationQueue = self->_operationQueue;
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_10015616C;
  id v23 = &unk_10021EE88;
  id v14 = v10;
  id v24 = v14;
  uint64_t v25 = self;
  id v15 = v11;
  id v26 = v15;
  id v16 = v12;
  id v27 = v16;
  id v28 = &v30;
  unsigned __int8 v29 = &v36;
  dispatch_sync(operationQueue, &v20);
  if (a6)
  {
    os_log_type_t v17 = (void *)v31[5];
    if (v17) {
      *a6 = objc_msgSend(v17, "copy", v20, v21, v22, v23, v24, v25, v26);
    }
  }
  char v18 = *((unsigned char *)v37 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

- (BOOL)removeObservationsWithAssetLocalIdentifiers:(id)a3 gallery:(id)a4 cancelOrExtendTimeoutBlock:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  operationQueue = self->_operationQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100156644;
  v15[3] = &unk_10021EEB0;
  id v16 = v9;
  id v17 = v10;
  char v18 = &v20;
  uint32_t v19 = a6;
  id v12 = v10;
  id v13 = v9;
  dispatch_sync(operationQueue, v15);
  LOBYTE(operationQueue) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)operationQueue;
}

- (void)_dedupeGraphVerifiedPersonsForPerson:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(v6, "mad_allPersonsFetchOptions");
  v69 = v5;
  id v8 = +[NSArray arrayWithObjects:&v69 count:1];
  id v9 = +[PHPerson fetchPersonsWithLocalIdentifiers:v8 options:v7];
  id v10 = [v9 firstObject];

  if (v10)
  {
    if ([v10 verifiedType] == (id)1 || objc_msgSend(v10, "verifiedType") == (id)2)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v11 = VCPLogInstance();
        os_log_type_t v12 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v11, v12))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v5;
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "[VUDedupe] Checking person %@", buf, 0xCu);
        }
      }
      id v13 = objc_msgSend(v6, "mad_allFacesFetchOptions");
      id v14 = +[NSPredicate predicateWithFormat:@"(trainingType = %d) || (trainingType = %d)", 1, 5];
      [v13 setInternalPredicate:v14];

      v68[0] = PHFacePropertySetIdentifier;
      v68[1] = PHFacePropertySetPersonBuilder;
      id v15 = +[NSArray arrayWithObjects:v68 count:2];
      [v13 setFetchPropertySets:v15];

      id v16 = +[PHFace fetchFacesForPerson:v10 options:v13];
      if (![v16 count])
      {
        if ((int)MediaAnalysisLogLevel() < 3)
        {
LABEL_48:

          goto LABEL_49;
        }
        id v17 = VCPLogInstance();
        os_log_type_t v41 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v17, v41))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v5;
          _os_log_impl((void *)&_mh_execute_header, v17, v41, "[VUDedupe] Person has no training face %@; ignoring",
            buf,
            0xCu);
        }
LABEL_47:

        goto LABEL_48;
      }
      id v17 = [v6 librarySpecificFetchOptions];
      char v18 = +[PHFaceCrop fetchFaceCropByFaceLocalIdentifierForFaces:v16 fetchOptions:v17];
      uint32_t v19 = [v18 allValues];
      if (![v19 count])
      {
LABEL_46:

        goto LABEL_47;
      }
      v50 = v18;
      id v51 = v17;
      __int16 v52 = v16;
      id v53 = v13;
      NSErrorUserInfoKey v54 = v10;
      v55 = v5;
      v56 = v6;
      uint64_t v20 = +[NSMutableArray array];
      uint64_t v21 = +[NSMutableArray array];
      if ([v19 count])
      {
        unint64_t v22 = 0;
        do
        {
          id v24 = [v19 objectAtIndexedSubscript:v22];
          uint64_t v25 = +[PHPerson fetchPersonForFaceCrop:v24 options:v7];
          id v26 = [v25 firstObject];

          id v27 = [v26 verifiedType];
          id v28 = v20;
          if (v27 == (id)1 || (v29 = [v26 verifiedType], id v28 = v21, v29 == (id)2)) {
            [v28 addObject:v26];
          }

          ++v22;
        }
        while (v22 < (unint64_t)[v19 count]);
      }
      id v30 = [v20 count];
      id v31 = [v21 count];
      if (v30)
      {
        id v5 = v55;
        id v13 = v53;
        if (v31)
        {
          v61[0] = _NSConcreteStackBlock;
          v61[1] = 3221225472;
          v61[2] = sub_100157284;
          v61[3] = &unk_100219D00;
          uint64_t v32 = (id *)&v62;
          id v48 = v20;
          v62 = v48;
          id v33 = v21;
          v63 = v33;
          id v60 = 0;
          unsigned int v34 = [v56 performChangesAndWait:v61 error:&v60];
          id v35 = v60;
          int v36 = MediaAnalysisLogLevel();
          if (v34)
          {
            if (v36 >= 6)
            {
              uint64_t v37 = VCPLogInstance();
              os_log_type_t type = VCPLogToOSLogType[6];
              if (os_log_type_enabled(v37, type))
              {
                *(_DWORD *)buf = 138412546;
                v65 = v33;
                __int16 v66 = 2112;
                v67 = v48;
                uint64_t v38 = "[VUDedupe] Deduped graph-verified persons %@ with user-verified persons %@";
LABEL_40:
                _os_log_impl((void *)&_mh_execute_header, v37, type, v38, buf, 0x16u);
                goto LABEL_41;
              }
              goto LABEL_41;
            }
          }
          else if (v36 >= 3)
          {
            uint64_t v37 = VCPLogInstance();
            os_log_type_t type = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v37, type))
            {
              *(_DWORD *)buf = 138412546;
              v65 = v33;
              __int16 v66 = 2112;
              v67 = v48;
              uint64_t v38 = "[VUDedupe] Failed to dedupe graph-verified persons %@ for user-verified persons %@";
              goto LABEL_40;
            }
LABEL_41:
          }
          id v45 = v63;
          goto LABEL_43;
        }
      }
      else
      {
        id v5 = v55;
        id v13 = v53;
        if ((unint64_t)v31 >= 2)
        {
          v58[0] = _NSConcreteStackBlock;
          v58[1] = 3221225472;
          v58[2] = sub_100157420;
          v58[3] = &unk_10021C738;
          uint64_t v32 = (id *)&v59;
          id v42 = v21;
          v59 = v42;
          id v57 = 0;
          unsigned int v43 = [v56 performChangesAndWait:v58 error:&v57];
          id v35 = v57;
          int v44 = MediaAnalysisLogLevel();
          if (v43)
          {
            if (v44 < 6)
            {
LABEL_44:

              goto LABEL_45;
            }
            id v45 = VCPLogInstance();
            os_log_type_t v49 = VCPLogToOSLogType[6];
            if (!os_log_type_enabled(v45, v49))
            {
LABEL_43:

              goto LABEL_44;
            }
            *(_DWORD *)buf = 138412546;
            v65 = v42;
            __int16 v66 = 2112;
            v67 = v55;
            id v46 = "[VUDedupe] Deduped graph-verified persons %@ for graph verified person %@";
          }
          else
          {
            if (v44 < 3) {
              goto LABEL_44;
            }
            id v45 = VCPLogInstance();
            os_log_type_t v49 = VCPLogToOSLogType[3];
            if (!os_log_type_enabled(v45, v49)) {
              goto LABEL_43;
            }
            *(_DWORD *)buf = 138412546;
            v65 = v42;
            __int16 v66 = 2112;
            v67 = v55;
            id v46 = "[VUDedupe] Failed to dedupe graph-verified persons %@ for graph verified person %@";
          }
          _os_log_impl((void *)&_mh_execute_header, v45, v49, v46, buf, 0x16u);
          goto LABEL_43;
        }
      }
LABEL_45:

      id v6 = v56;
      id v10 = v54;
      id v17 = v51;
      id v16 = v52;
      char v18 = v50;
      goto LABEL_46;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v13 = VCPLogInstance();
      os_log_type_t v39 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v13, v39))
      {
        *(_DWORD *)buf = 138412290;
        v65 = v5;
        id v40 = "[VUDedupe] Person %@ is not verified; ignoring";
        goto LABEL_31;
      }
      goto LABEL_49;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v13 = VCPLogInstance();
    os_log_type_t v39 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v13, v39))
    {
      *(_DWORD *)buf = 138412290;
      v65 = v5;
      id v40 = "[VUDedupe] Failed to find person %@; ignoring";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v13, v39, v40, buf, 0xCu);
    }
LABEL_49:
  }
}

- (BOOL)updatePersonWithPhotosLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 keyFaceLocalIdentifiers:(id)a9 cancelOrExtendTimeoutBlock:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  uint64_t v47 = 0;
  id v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  operationQueue = self->_operationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100157638;
  block[3] = &unk_10021EF28;
  id v45 = &v47;
  id v46 = a11;
  id v36 = v19;
  id v37 = v20;
  id v38 = v21;
  id v39 = v17;
  id v40 = v22;
  id v41 = v18;
  id v42 = v23;
  unsigned int v43 = self;
  id v44 = v24;
  id v26 = v23;
  id v27 = v18;
  id v28 = v22;
  id v29 = v17;
  id v30 = v21;
  id v31 = v20;
  id v32 = v19;
  id v33 = v24;
  dispatch_sync(operationQueue, block);
  LOBYTE(v24) = *((unsigned char *)v48 + 24);

  _Block_object_dispose(&v47, 8);
  return (char)v24;
}

- (BOOL)updatePersonWithSyndicationLibrary:(id)a3 service:(id)a4 entityIdentifier:(id)a5 entityClass:(id)a6 observationIDs:(id)a7 taggedPersonUUID:(id)a8 cancelOrExtendTimeoutBlock:(id)a9 error:(id *)a10
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  operationQueue = self->_operationQueue;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10015A250;
  v29[3] = &unk_10021EF50;
  id v30 = v16;
  id v31 = v17;
  id v32 = v19;
  id v33 = v18;
  id v36 = &v38;
  id v37 = a10;
  id v34 = v15;
  id v35 = v20;
  id v22 = v15;
  id v23 = v18;
  id v24 = v19;
  id v25 = v17;
  id v26 = v16;
  id v27 = v20;
  dispatch_sync(operationQueue, v29);
  LOBYTE(v20) = *((unsigned char *)v39 + 24);

  _Block_object_dispose(&v38, 8);
  return (char)v20;
}

+ (id)fetchKeyFaceLocalIdentifiersForPhotoLibrary:(id)a3
{
  id v3 = a3;
  id v24 = objc_msgSend(v3, "mad_allPersonsFetchOptionsWithDetectionTypes:andVerifiedTypes:", 0, &off_100230788);
  uint64_t v4 = +[PHPerson fetchPersonsWithOptions:](PHPerson, "fetchPersonsWithOptions:");
  id v5 = objc_msgSend(v3, "mad_allFacesFetchOptions");
  [v5 setIncludeNonvisibleFaces:0];
  id v23 = (void *)v4;
  id v6 = +[PHFace fetchKeyFaceByPersonLocalIdentifierForPersons:v4 options:v5];
  id v7 = +[NSMutableSet set];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v22 = v6;
  id v8 = [v6 allValues];
  id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v15 = [v13 localIdentifier];

        if (v15)
        {
          id v16 = [v13 localIdentifier];
          [v7 addObject:v16];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v10);
  }

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v17 = VCPLogInstance();
    os_log_type_t v18 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v17, v18))
    {
      id v19 = [v7 count];
      id v20 = [v23 count];
      *(_DWORD *)buf = 134218240;
      id v30 = v19;
      __int16 v31 = 2048;
      id v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "[Fetch KeyFaces] Fetched %lu key face(s) for %lu verified person(s)", buf, 0x16u);
    }
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end