@interface AXMVisionFaceNameHelper
- (BOOL)_checkPhotoLibraryAuthorization;
- (BOOL)_isDeviceUnlocked;
- (BOOL)_loadPersonsModelWithPhotoLibraryURL:(id)a3;
- (BOOL)_shouldReloadPersonsModelWithPhotoLibraryURL:(id)a3;
- (BOOL)prepareForLookupWithPhotoLibraryURL:(id)a3;
- (NSDate)_personsModelFileModifiedDate;
- (NSMutableDictionary)_personLocalIdentifierToName;
- (VNPersonsModel)_personsModel;
- (double)_lastFileModificationCheckTime;
- (id)_fetchPersonsForLocalIdentifiers:(id)a3 withPhotoLibraryURL:(id)a4;
- (id)_fileModificationDateForPath:(id)a3;
- (id)_filePathForPersonsModelWithPhotoLibraryURL:(id)a3;
- (id)_photoAuthorizationMessage:(int64_t)a3;
- (id)nameForFaceObservation:(id)a3;
- (id)photoLibraryWithURL:(id)a3;
- (unint64_t)faceprintRequestRevisionForPersonsModel;
- (void)_resetState;
- (void)set_lastFileModificationCheckTime:(double)a3;
- (void)set_personLocalIdentifierToName:(id)a3;
- (void)set_personsModel:(id)a3;
- (void)set_personsModelFileModifiedDate:(id)a3;
@end

@implementation AXMVisionFaceNameHelper

- (void)_resetState
{
  [(AXMVisionFaceNameHelper *)self set_personsModel:0];
  [(AXMVisionFaceNameHelper *)self set_personsModelFileModifiedDate:0];
  [(AXMVisionFaceNameHelper *)self set_personLocalIdentifierToName:0];

  [(AXMVisionFaceNameHelper *)self set_lastFileModificationCheckTime:0.0];
}

- (unint64_t)faceprintRequestRevisionForPersonsModel
{
  id VCPMediaAnalyzerClass = getVCPMediaAnalyzerClass();
  v4 = [(AXMVisionFaceNameHelper *)self _personsModel];
  unint64_t v5 = [VCPMediaAnalyzerClass faceprintRevisionForPersonModel:v4];

  return v5;
}

- (id)photoLibraryWithURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = (void *)[objc_alloc((Class)getPHPhotoLibraryClass_0()) initWithPhotoLibraryURL:v3];
    id v11 = 0;
    int v5 = [v4 openAndWaitWithUpgrade:0 error:&v11];
    id v6 = v11;
    v7 = v6;
    if (v4 && !v6 && v5)
    {
      id v8 = v4;
    }
    else
    {
      v9 = AXMediaLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        [(AXMVisionFaceNameHelper *)(uint64_t)v3 photoLibraryWithURL:v9];
      }

      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_filePathForPersonsModelWithPhotoLibraryURL:(id)a3
{
  id v3 = [(AXMVisionFaceNameHelper *)self photoLibraryWithURL:a3];
  if (v3)
  {
    v4 = [getVCPMediaAnalyzerClass() personModelFilepathForPhotoLibrary:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_loadPersonsModelWithPhotoLibraryURL:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  id v6 = [(AXMVisionFaceNameHelper *)self _filePathForPersonsModelWithPhotoLibraryURL:v4];

  if (!v6)
  {
    v10 = AXMediaLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "AXMVisionFaceNameHelper: Could not find filepath of VNPersonsModel";
      v16 = v10;
      uint32_t v17 = 2;
LABEL_10:
      _os_log_impl(&dword_1B57D5000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    }
LABEL_11:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) == 0)
  {
    v10 = AXMediaLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v22 = *(double *)&v6;
      v15 = "AXMVisionFaceNameHelper: VNPersonsModel model path does not exist '%@'. (it may not be created yet)";
      v16 = v10;
      uint32_t v17 = 12;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v20 = 0;
  v9 = [getVCPMediaAnalyzerClass() loadPersonModelAtPath:v6 error:&v20];
  v10 = v20;
  BOOL v11 = v9 != 0;
  if (v9)
  {
    [(AXMVisionFaceNameHelper *)self set_personsModel:v9];
    v12 = [(AXMVisionFaceNameHelper *)self _fileModificationDateForPath:v6];
    [(AXMVisionFaceNameHelper *)self set_personsModelFileModifiedDate:v12];

    [(AXMVisionFaceNameHelper *)self set_lastFileModificationCheckTime:CFAbsoluteTimeGetCurrent()];
    double v13 = CFAbsoluteTimeGetCurrent();
    v14 = AXMediaLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v22 = v13 - Current;
      _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: VNPersonsModel loadTime: %.3f", buf, 0xCu);
    }
  }
  else
  {
    v14 = AXMediaLogCommon();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [MEMORY[0x1E4F29060] callStackSymbols];
      *(_DWORD *)buf = 138412802;
      double v22 = *(double *)&v6;
      __int16 v23 = 2112;
      v24 = v10;
      __int16 v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1B57D5000, v14, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: Could not load VNPersonsModel from path %@: %@ %@", buf, 0x20u);
    }
  }

LABEL_15:
  return v11;
}

- (BOOL)_shouldReloadPersonsModelWithPhotoLibraryURL:(id)a3
{
  id v4 = a3;
  int v5 = [(AXMVisionFaceNameHelper *)self _personsModel];

  if (v5
    && (double Current = CFAbsoluteTimeGetCurrent(),
        [(AXMVisionFaceNameHelper *)self _lastFileModificationCheckTime],
        Current - v7 >= 600.0))
  {
    [(AXMVisionFaceNameHelper *)self set_lastFileModificationCheckTime:CFAbsoluteTimeGetCurrent()];
    v9 = [(AXMVisionFaceNameHelper *)self _filePathForPersonsModelWithPhotoLibraryURL:v4];
    v10 = [(AXMVisionFaceNameHelper *)self _fileModificationDateForPath:v9];
    if (v10
      && ([(AXMVisionFaceNameHelper *)self _personsModelFileModifiedDate],
          BOOL v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v11)
      && ([(AXMVisionFaceNameHelper *)self _personsModelFileModifiedDate],
          v12 = objc_claimAutoreleasedReturnValue(),
          char v13 = [v10 isEqualToDate:v12],
          v12,
          (v13 & 1) == 0))
    {
      v15 = AXMediaLogCommon();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1B57D5000, v15, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: Resetting state for change to personsModel file", v16, 2u);
      }

      BOOL v8 = 1;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_photoAuthorizationMessage:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return *(&off_1E6118828 + a3);
  }
}

- (BOOL)_checkPhotoLibraryAuthorization
{
  return [getPHPhotoLibraryClass_0() authorizationStatus] == 3;
}

- (id)_fileModificationDateForPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v11 = 0;
    int v5 = [v4 attributesOfItemAtPath:v3 error:&v11];
    id v6 = v11;

    if (v5)
    {
      double v7 = [v5 fileModificationDate];
    }
    else
    {
      BOOL v8 = AXMediaLogCommon();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [MEMORY[0x1E4F29060] callStackSymbols];
        *(_DWORD *)buf = 138412802;
        id v13 = v3;
        __int16 v14 = 2112;
        id v15 = v6;
        __int16 v16 = 2112;
        uint32_t v17 = v9;
        _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: Could not load get fileModificationDate from path %@: %@ %@", buf, 0x20u);
      }
      double v7 = 0;
    }
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (id)_fetchPersonsForLocalIdentifiers:(id)a3 withPhotoLibraryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [(AXMVisionFaceNameHelper *)self photoLibraryWithURL:v7];
  v10 = v9;
  if (v9)
  {
    id v11 = [v9 librarySpecificFetchOptions];
    [v11 setIncludeGuestAssets:1];
    [v11 setMinimumVerifiedFaceCount:0];
    [v11 setMinimumUnverifiedFaceCount:0];
    v12 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"verifiedType == %d", 1);
    [v11 setPredicate:v12];

    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v13 = (void *)getPHPersonClass_softClass;
    uint64_t v21 = getPHPersonClass_softClass;
    if (!getPHPersonClass_softClass)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __getPHPersonClass_block_invoke;
      v17[3] = &unk_1E6116AD8;
      v17[4] = &v18;
      __getPHPersonClass_block_invoke((uint64_t)v17);
      id v13 = (void *)v19[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v18, 8);
    id v15 = [v14 fetchPersonsWithLocalIdentifiers:v8 options:v11];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)prepareForLookupWithPhotoLibraryURL:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(AXMVisionFaceNameHelper *)self _isDeviceUnlocked])
  {
    id v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "AXMVisionFaceNameHelper: Device is locked so face names should not be available";
LABEL_9:
      _os_log_impl(&dword_1B57D5000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_10:

LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  if ([(AXMVisionFaceNameHelper *)self _shouldReloadPersonsModelWithPhotoLibraryURL:v4])
  {
    [(AXMVisionFaceNameHelper *)self _resetState];
  }
  int v5 = [(AXMVisionFaceNameHelper *)self _personLocalIdentifierToName];

  if (!v5)
  {
    if (![(AXMVisionFaceNameHelper *)self _checkPhotoLibraryAuthorization])
    {
      uint64_t v27 = AXMediaLogCommon();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = -[AXMVisionFaceNameHelper _photoAuthorizationMessage:](self, "_photoAuthorizationMessage:", (int)[getPHPhotoLibraryClass_0() authorizationStatus]);
        *(_DWORD *)buf = 138412290;
        v36 = v28;
        _os_log_impl(&dword_1B57D5000, v27, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: PhotoLibrary Authorization Failure - Face names will not be available : %@", buf, 0xCu);
      }
      goto LABEL_11;
    }
    if ([(AXMVisionFaceNameHelper *)self _loadPersonsModelWithPhotoLibraryURL:v4])
    {
      id v6 = [(AXMVisionFaceNameHelper *)self _personsModel];
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(AXMVisionFaceNameHelper *)self set_personLocalIdentifierToName:v11];

      if ([v6 personCount])
      {
        v12 = [v6 personUniqueIdentifiers];
        id v13 = [(AXMVisionFaceNameHelper *)self _fetchPersonsForLocalIdentifiers:v12 withPhotoLibraryURL:v4];

        if (v13)
        {
          v29 = v6;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                uint64_t v20 = [v19 displayName];
                uint64_t v21 = v20;
                if (v20)
                {
                  id v22 = v20;
                }
                else
                {
                  id v22 = [v19 name];
                }
                __int16 v23 = v22;

                v24 = [(AXMVisionFaceNameHelper *)self _personLocalIdentifierToName];
                __int16 v25 = [v19 localIdentifier];
                [v24 setObject:v23 forKeyedSubscript:v25];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v34 count:16];
            }
            while (v16);
          }

          id v6 = v29;
        }
        v26 = [(AXMVisionFaceNameHelper *)self _personLocalIdentifierToName];
        BOOL v7 = [v26 count] != 0;
      }
      else
      {
        id v13 = AXMediaLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B57D5000, v13, OS_LOG_TYPE_DEFAULT, "AXMVisionFaceNameHelper: No persons found in VNPersonsModel so face names will not be available", buf, 2u);
        }
        BOOL v7 = 0;
      }

      goto LABEL_6;
    }
    id v8 = AXMediaLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "AXMVisionFaceNameHelper: Failed to load VNPersonsModel so face names will not be available";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  id v6 = [(AXMVisionFaceNameHelper *)self _personLocalIdentifierToName];
  BOOL v7 = [v6 count] != 0;
LABEL_6:

LABEL_12:
  return v7;
}

- (id)nameForFaceObservation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AXMVisionFaceNameHelper *)self _checkPhotoLibraryAuthorization];
  id v6 = 0;
  if (v4 && v5)
  {
    BOOL v7 = [(AXMVisionFaceNameHelper *)self _personLocalIdentifierToName];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      v12 = AXMediaLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[AXMVisionFaceNameHelper nameForFaceObservation:](v12);
      }
      id v6 = 0;
      goto LABEL_15;
    }
    id VCPMediaAnalyzerClass = getVCPMediaAnalyzerClass();
    v10 = [(AXMVisionFaceNameHelper *)self _personsModel];
    id v15 = 0;
    id v11 = [VCPMediaAnalyzerClass classifyFaceObservation:v4 withPersonsModel:v10 error:&v15];
    v12 = v15;

    if (v12)
    {
      id v13 = AXMediaLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[AXMVisionFaceNameHelper nameForFaceObservation:]((uint64_t)v12, v13);
      }
      id v6 = 0;
    }
    else
    {
      if (!v11)
      {
        id v6 = 0;
        goto LABEL_14;
      }
      id v13 = [(AXMVisionFaceNameHelper *)self _personLocalIdentifierToName];
      id v6 = [v13 objectForKeyedSubscript:v11];
    }

LABEL_14:
LABEL_15:
  }

  return v6;
}

- (BOOL)_isDeviceUnlocked
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  v2 = (uint64_t (*)(void))getMKBGetDeviceLockStateSymbolLoc_ptr;
  id v11 = getMKBGetDeviceLockStateSymbolLoc_ptr;
  if (!getMKBGetDeviceLockStateSymbolLoc_ptr)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getMKBGetDeviceLockStateSymbolLoc_block_invoke;
    v7[3] = &unk_1E6116AD8;
    v7[4] = &v8;
    __getMKBGetDeviceLockStateSymbolLoc_block_invoke((uint64_t)v7);
    v2 = (uint64_t (*)(void))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    id v6 = (_Unwind_Exception *)__77__AXMVisionFeatureFaceAttributes__AXMAgeCategoryForVisionCategoryIdentifier___block_invoke_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  int v3 = v2(0);
  return !v3 || v3 == 3;
}

- (VNPersonsModel)_personsModel
{
  return self->__personsModel;
}

- (void)set_personsModel:(id)a3
{
}

- (NSDate)_personsModelFileModifiedDate
{
  return self->__personsModelFileModifiedDate;
}

- (void)set_personsModelFileModifiedDate:(id)a3
{
  self->__personsModelFileModifiedDate = (NSDate *)a3;
}

- (NSMutableDictionary)_personLocalIdentifierToName
{
  return self->__personLocalIdentifierToName;
}

- (void)set_personLocalIdentifierToName:(id)a3
{
}

- (double)_lastFileModificationCheckTime
{
  return self->__lastFileModificationCheckTime;
}

- (void)set_lastFileModificationCheckTime:(double)a3
{
  self->__lastFileModificationCheckTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__personLocalIdentifierToName, 0);

  objc_storeStrong((id *)&self->__personsModel, 0);
}

- (void)photoLibraryWithURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl(&dword_1B57D5000, log, OS_LOG_TYPE_FAULT, "AXMVisionFaceNameHelper: Could not fetch Photo Library using the photo library URL : %@ error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)nameForFaceObservation:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B57D5000, log, OS_LOG_TYPE_ERROR, "AXMVisionFaceNameHelper: no names cached for nameForFaceObservation", v1, 2u);
}

- (void)nameForFaceObservation:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F29060] callStackSymbols];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1B57D5000, a2, OS_LOG_TYPE_ERROR, "AXMVisionFaceNameHelper: Error classifying face. Error: %@ %@", (uint8_t *)&v5, 0x16u);
}

@end