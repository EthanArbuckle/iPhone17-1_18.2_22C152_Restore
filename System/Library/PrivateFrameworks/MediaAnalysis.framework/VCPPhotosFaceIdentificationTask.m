@interface VCPPhotosFaceIdentificationTask
+ (id)taskWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5;
- (BOOL)run:(id *)a3;
- (VCPPhotosFaceIdentificationTask)initWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5;
- (void)_classifyPerson:(id)a3 usingModel:(id)a4 withResults:(id *)a5;
- (void)_classifyPet:(id)a3 usingModel:(id)a4 withResults:(id *)a5;
@end

@implementation VCPPhotosFaceIdentificationTask

- (VCPPhotosFaceIdentificationTask)initWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VCPPhotosFaceIdentificationTask;
  v11 = [(VCPPhotosFaceIdentificationTask *)&v14 initWithCompletionHandler:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_faceLocalIdentifiers, a3);
    objc_storeStrong((id *)&v12->_photoLibraryURL, a4);
  }

  return v12;
}

+ (id)taskWithFaceLocalIdentifiers:(id)a3 fromPhotoLibraryWithURL:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)objc_opt_class()) initWithFaceLocalIdentifiers:v9 fromPhotoLibraryWithURL:v8 withCompletionHandler:v7];

  return v10;
}

- (void)_classifyPerson:(id)a3 usingModel:(id)a4 withResults:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      v11 = [v7 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v50 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@] Predicting person(s) from VIP model", buf, 0xCu);
    }
  }
  v12 = [v7 faceClusteringProperties];
  v13 = [v12 faceprint];

  if (v13)
  {
    objc_super v14 = [v13 faceprintData];
    v15 = +[VCPFaceIDModel faceObservationFromFaceprintData:v14];

    if (!v15)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_36:

        goto LABEL_37;
      }
      v17 = VCPLogInstance();
      os_log_type_t v24 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v17, v24))
      {
        v25 = [v7 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v50 = v25;
        _os_log_impl((void *)&_mh_execute_header, v17, v24, "[%@] Failed to obtain face observation; skipping",
          buf,
          0xCu);
      }
LABEL_35:

      goto LABEL_36;
    }
    id v48 = 0;
    v16 = [v8 predictPersonFromFaceObservation:v15 limit:10 canceller:0 error:&v48];
    v17 = v48;
    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_34:

        goto LABEL_35;
      }
      v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v18, v19))
      {
        v20 = [v7 localIdentifier];
        v21 = [v17 description];
        *(_DWORD *)buf = 138412546;
        v50 = v20;
        __int16 v51 = 2112;
        v52[0] = v21;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] Face prediction failed (%@); skipping", buf, 0x16u);
      }
    }
    else
    {
      v41 = a5;
      id v42 = v8;
      v43 = v7;
      v18 = +[NSMutableDictionary dictionary];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v40 = v16;
      id v26 = v16;
      id v27 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
      if (v27)
      {
        id v28 = v27;
        uint64_t v29 = *(void *)v45;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(void *)v45 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            [v31 confidence];
            if (v32 > VCPPersonFaceVIPMatchingThreshold())
            {
              [v31 confidence];
              v33 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              v34 = [v31 predictedPersonUniqueIdentifier];
              [v18 setObject:v33 forKeyedSubscript:v34];
            }
          }
          id v28 = [v26 countByEnumeratingWithState:&v44 objects:v53 count:16];
        }
        while (v28);
      }

      id v7 = v43;
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v35 = VCPLogInstance();
        os_log_type_t v36 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v35, v36))
        {
          v37 = [v43 localIdentifier];
          unsigned int v38 = [v26 count];
          unsigned int v39 = [v18 count];
          *(_DWORD *)buf = 138412802;
          v50 = v37;
          __int16 v51 = 1024;
          LODWORD(v52[0]) = v38;
          WORD2(v52[0]) = 1024;
          *(_DWORD *)((char *)v52 + 6) = v39;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "[%@] VIP Model yielded %d predictions, %d exceeded confidence threshold", buf, 0x18u);
        }
      }
      v17 = 0;
      if (v41)
      {
        v18 = v18;
        id *v41 = v18;
      }
      id v8 = v42;
      v16 = v40;
    }

    goto LABEL_34;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v15 = VCPLogInstance();
    os_log_type_t v22 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v15, v22))
    {
      v23 = [v7 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v50 = v23;
      _os_log_impl((void *)&_mh_execute_header, v15, v22, "[%@] Failed to obtain faceprint; skipping", buf, 0xCu);
    }
    goto LABEL_36;
  }
LABEL_37:
}

- (void)_classifyPet:(id)a3 usingModel:(id)a4 withResults:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v9 = VCPLogInstance();
    os_log_type_t v10 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v9, v10))
    {
      v11 = [v7 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v53 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@] Predicting pet(s) from VIP model", buf, 0xCu);
    }
  }
  v12 = [v7 faceClusteringProperties];
  v13 = [v12 faceprint];

  if (v13)
  {
    objc_super v14 = [v13 faceprintData];
    v15 = +[VCPFaceIDModel animalObservationFromAnimalprintData:v14];

    if (!v15)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_36:

        goto LABEL_37;
      }
      v17 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v17, v25))
      {
        id v26 = [v7 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v53 = v26;
        _os_log_impl((void *)&_mh_execute_header, v17, v25, "[%@] Failed to obtain pet observation; skipping",
          buf,
          0xCu);
      }
LABEL_35:

      goto LABEL_36;
    }
    id v51 = 0;
    v16 = [v8 entityPredictionsForObservation:v15 limit:10 canceller:0 error:&v51];
    v17 = v51;
    if (v17)
    {
      if ((int)MediaAnalysisLogLevel() < 4)
      {
LABEL_34:

        goto LABEL_35;
      }
      v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v18, v19))
      {
        v20 = [v7 localIdentifier];
        [v17 description];
        os_log_type_t v22 = v21 = v16;
        *(_DWORD *)buf = 138412546;
        v53 = v20;
        __int16 v54 = 2112;
        v55[0] = v22;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] Pet prediction failed (%@); skipping", buf, 0x16u);

        v16 = v21;
      }
    }
    else
    {
      long long v44 = a5;
      long long v45 = v15;
      id v46 = v8;
      v18 = +[NSMutableDictionary dictionary];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v43 = v16;
      id v27 = v16;
      id v28 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v48;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v48 != v30) {
              objc_enumerationMutation(v27);
            }
            float v32 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            objc_msgSend(v32, "confidence", v43);
            float v34 = v33;
            +[VCPFaceIDModel petClassificationThreshold];
            if (v34 > v35)
            {
              [v32 confidence];
              os_log_type_t v36 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              v37 = [v32 entityUniqueIdentifier];
              [v18 setObject:v36 forKeyedSubscript:v37];
            }
          }
          id v29 = [v27 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v29);
      }

      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        unsigned int v38 = VCPLogInstance();
        os_log_type_t v39 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v38, v39))
        {
          v40 = [v7 localIdentifier];
          unsigned int v41 = [v27 count];
          unsigned int v42 = [v18 count];
          *(_DWORD *)buf = 138412802;
          v53 = v40;
          __int16 v54 = 1024;
          LODWORD(v55[0]) = v41;
          WORD2(v55[0]) = 1024;
          *(_DWORD *)((char *)v55 + 6) = v42;
          _os_log_impl((void *)&_mh_execute_header, v38, v39, "[%@] VIP Model yielded %d predictions, %d exceeded confidence threshold", buf, 0x18u);
        }
      }
      v17 = 0;
      if (v44)
      {
        v18 = v18;
        *long long v44 = v18;
      }
      v15 = v45;
      id v8 = v46;
      v16 = v43;
    }

    goto LABEL_34;
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v15 = VCPLogInstance();
    os_log_type_t v23 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v15, v23))
    {
      os_log_type_t v24 = [v7 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v53 = v24;
      _os_log_impl((void *)&_mh_execute_header, v15, v23, "[%@] Failed to obtain animalprint; skipping", buf, 0xCu);
    }
    goto LABEL_36;
  }
LABEL_37:
}

- (BOOL)run:(id *)a3
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v5 = VCPLogInstance();
    os_log_type_t v6 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v5, v6))
    {
      unsigned int v7 = [(NSArray *)self->_faceLocalIdentifiers count];
      photoLibraryURL = self->_photoLibraryURL;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v94 = v7;
      *(_WORD *)&v94[4] = 2112;
      *(void *)&v94[6] = photoLibraryURL;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Performing on-demand identification on %d faces from Photo Library (%@)", buf, 0x12u);
    }
  }
  id v9 = +[VCPPhotoLibraryManager sharedManager];
  os_log_type_t v10 = [v9 photoLibraryWithURL:self->_photoLibraryURL];

  if (v10)
  {
    v11 = [v10 librarySpecificFetchOptions];
    uint64_t v90 = PHFacePropertySetClustering;
    v12 = +[NSArray arrayWithObjects:&v90 count:1];
    [v11 setFetchPropertySets:v12];

    [v11 setIncludedDetectionTypes:&off_100230548];
    v13 = +[PHFace fetchFacesWithLocalIdentifiers:self->_faceLocalIdentifiers options:v11];
    if (![v13 count])
    {
      if (!a3)
      {
        BOOL v32 = 0;
        goto LABEL_79;
      }
      NSErrorUserInfoKey v88 = NSLocalizedDescriptionKey;
      v20 = +[NSString stringWithFormat:@"Face fetch did not return any results"];
      v89 = v20;
      uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v89 forKeys:&v88 count:1];
      float v33 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v26];
      BOOL v32 = 0;
      float v34 = *a3;
      *a3 = v33;
      goto LABEL_77;
    }
    id v14 = [v13 count];
    v74 = v13;
    if (v14 != (id)[(NSArray *)self->_faceLocalIdentifiers count] && (int)MediaAnalysisLogLevel() >= 4)
    {
      v15 = VCPLogInstance();
      os_log_type_t v16 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v15, v16))
      {
        unsigned int v17 = [v13 count];
        unsigned int v18 = [(NSArray *)self->_faceLocalIdentifiers count];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v94 = v17;
        *(_WORD *)&v94[4] = 1024;
        *(_DWORD *)&v94[6] = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Face fetch count (%d) does not match requested (%d)", buf, 0xEu);
      }
    }
    os_log_type_t v19 = +[VCPDefaultPhotoLibraryManager sharedManager];
    v20 = [v19 defaultPhotoLibrary];

    v21 = objc_msgSend(v20, "vcp_vipModelFilepathForVIPType:", 0);
    os_log_type_t v22 = +[NSFileManager defaultManager];
    unsigned int v23 = [v22 fileExistsAtPath:v21];

    if (v23)
    {
      os_log_type_t v24 = v20;
      os_log_type_t v25 = a3;
      id v82 = 0;
      uint64_t v26 = +[VCPFaceIDModel loadVIPModelAtPath:v21 withVIPType:0 error:&v82];
      id v27 = v82;
      id v28 = v27;
      if ((!v26 || v27) && (int)MediaAnalysisLogLevel() >= 3)
      {
        id v29 = VCPLogInstance();
        os_log_type_t v30 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)v94 = v28;
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "Cannot load Person Identity Model - %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 5)
      {
        uint64_t v26 = 0;
        v13 = v74;
        os_log_type_t v36 = &ADClientSetValueForScalarKey_ptr;
LABEL_30:
        float v34 = objc_msgSend(v20, "vcp_vipModelFilepathForVIPType:", 1);

        v37 = [v36[392] defaultManager];
        unsigned int v38 = [v37 fileExistsAtPath:v34];

        v71 = v11;
        if (v38)
        {
          id v81 = 0;
          uint64_t v39 = +[VCPFaceIDModel loadVIPModelAtPath:v34 withVIPType:1 error:&v81];
          v40 = v81;
          unsigned int v41 = v40;
          if ((!v39 || v40) && (int)MediaAnalysisLogLevel() >= 3)
          {
            unsigned int v42 = VCPLogInstance();
            os_log_type_t v43 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v42, v43))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v94 = v41;
              _os_log_impl((void *)&_mh_execute_header, v42, v43, "Cannot load Pet Identity Model - %@", buf, 0xCu);
            }

            v13 = v74;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() < 5)
          {
            uint64_t v39 = 0;
LABEL_43:
            if (v26 | v39)
            {
              v69 = v34;
              v70 = v10;
              v67 = a3;
              v68 = v20;
              long long v45 = +[NSMutableDictionary dictionary];
              long long v77 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              id v46 = v13;
              id v47 = [v46 countByEnumeratingWithState:&v77 objects:v85 count:16];
              if (v47)
              {
                id v48 = v47;
                uint64_t v49 = *(void *)v78;
                v72 = v45;
                os_log_type_t type = VCPLogToOSLogType[5];
LABEL_46:
                uint64_t v50 = 0;
                while (1)
                {
                  if (*(void *)v78 != v49) {
                    objc_enumerationMutation(v46);
                  }
                  id v51 = *(void **)(*((void *)&v77 + 1) + 8 * v50);
                  if ([(VCPPhotosFaceIdentificationTask *)self isCanceled])
                  {
                    if (v67)
                    {
                      NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
                      v62 = +[NSString stringWithFormat:@"Face identification canceled"];
                      v84 = v62;
                      v63 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
                      uint64_t v64 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v63];
                      id v65 = *v67;
                      id *v67 = (id)v64;
                    }
                    BOOL v32 = 0;
                    goto LABEL_74;
                  }
                  if ([v51 detectionType] == 1) {
                    break;
                  }
                  if (v39)
                  {
                    uint64_t v75 = 0;
                    v52 = (id *)&v75;
                    [(VCPPhotosFaceIdentificationTask *)self _classifyPet:v51 usingModel:v39 withResults:&v75];
LABEL_55:
                    v53 = *v52;
                    if (v53)
                    {
                      __int16 v54 = v53;
                      v55 = [v51 localIdentifier];
                      [v45 setObject:v54 forKeyedSubscript:v55];

                      goto LABEL_65;
                    }
                    goto LABEL_66;
                  }
                  if ((int)MediaAnalysisLogLevel() >= 5)
                  {
                    __int16 v54 = VCPLogInstance();
                    if (os_log_type_enabled(v54, type))
                    {
                      v56 = [v51 localIdentifier];
                      *(_DWORD *)buf = 138412290;
                      *(void *)v94 = v56;
                      v57 = v54;
                      os_log_type_t v58 = type;
                      v59 = "[%@] Skipped for Pet (no identity model)";
LABEL_63:
                      _os_log_impl((void *)&_mh_execute_header, v57, v58, v59, buf, 0xCu);
                    }
LABEL_64:
                    long long v45 = v72;
LABEL_65:
                  }
LABEL_66:
                  if (v48 == (id)++v50)
                  {
                    id v48 = [v46 countByEnumeratingWithState:&v77 objects:v85 count:16];
                    if (v48) {
                      goto LABEL_46;
                    }
                    goto LABEL_68;
                  }
                }
                if (!v26)
                {
                  if ((int)MediaAnalysisLogLevel() >= 5)
                  {
                    __int16 v54 = VCPLogInstance();
                    if (os_log_type_enabled(v54, type))
                    {
                      v56 = [v51 localIdentifier];
                      *(_DWORD *)buf = 138412290;
                      *(void *)v94 = v56;
                      v57 = v54;
                      os_log_type_t v58 = type;
                      v59 = "[%@] Skipped for Person (no identity model)";
                      goto LABEL_63;
                    }
                    goto LABEL_64;
                  }
                  goto LABEL_66;
                }
                uint64_t v76 = 0;
                v52 = (id *)&v76;
                [(VCPPhotosFaceIdentificationTask *)self _classifyPerson:v51 usingModel:v26 withResults:&v76];
                goto LABEL_55;
              }
LABEL_68:

              id v46 = [(VCPPhotosFaceIdentificationTask *)self completionHandler];
              (*((void (**)(id, void *, void))v46 + 2))(v46, v45, 0);
              BOOL v32 = 1;
LABEL_74:
              v13 = v74;
              v20 = v68;
            }
            else
            {
              if (!a3)
              {
                BOOL v32 = 0;
                goto LABEL_76;
              }
              v69 = v34;
              v70 = v10;
              NSErrorUserInfoKey v86 = NSLocalizedDescriptionKey;
              long long v45 = +[NSString stringWithFormat:@"Failed to load both Person and Pet Identity Models"];
              v87 = v45;
              id v46 = +[NSDictionary dictionaryWithObjects:&v87 forKeys:&v86 count:1];
              v60 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v46];
              id v61 = *a3;
              *a3 = v60;

              BOOL v32 = 0;
            }

            float v34 = v69;
            os_log_type_t v10 = v70;
LABEL_76:

            v11 = v71;
LABEL_77:

            goto LABEL_78;
          }
          unsigned int v41 = VCPLogInstance();
          os_log_type_t v44 = VCPLogToOSLogType[5];
          if (os_log_type_enabled(v41, v44))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v94 = v34;
            _os_log_impl((void *)&_mh_execute_header, v41, v44, "Pet Identity Model not exist - %@", buf, 0xCu);
          }
          uint64_t v39 = 0;
        }

        goto LABEL_43;
      }
      os_log_type_t v24 = v20;
      os_log_type_t v25 = a3;
      id v28 = VCPLogInstance();
      os_log_type_t v35 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v28, v35))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v94 = v21;
        _os_log_impl((void *)&_mh_execute_header, v28, v35, "Person Identity Model not exist - %@", buf, 0xCu);
      }
      uint64_t v26 = 0;
    }
    v13 = v74;
    os_log_type_t v36 = &ADClientSetValueForScalarKey_ptr;

    a3 = v25;
    v20 = v24;
    goto LABEL_30;
  }
  if (a3)
  {
    NSErrorUserInfoKey v91 = NSLocalizedDescriptionKey;
    v11 = +[NSString stringWithFormat:@"Failed to open specified Photo Library (%@)", self->_photoLibraryURL];
    v92 = v11;
    v13 = +[NSDictionary dictionaryWithObjects:&v92 forKeys:&v91 count:1];
    v31 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-50 userInfo:v13];
    BOOL v32 = 0;
    v20 = *a3;
    *a3 = v31;
LABEL_78:

LABEL_79:
    goto LABEL_80;
  }
  BOOL v32 = 0;
LABEL_80:

  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_faceLocalIdentifiers, 0);
}

@end