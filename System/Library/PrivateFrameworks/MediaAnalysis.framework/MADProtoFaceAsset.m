@interface MADProtoFaceAsset
+ (Class)detectedFacesType;
+ (id)protoFromPhotosAsset:(id)a3;
- (BOOL)hasAdjustmentVersion;
- (BOOL)hasAlgorithmVersion;
- (BOOL)hasAssetAdjustmentTimestamp;
- (BOOL)hasAssetCloudIdentifier;
- (BOOL)hasAssetLocalIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)detectedFaces;
- (NSString)assetCloudIdentifier;
- (NSString)assetLocalIdentifier;
- (double)adjustmentVersion;
- (double)assetAdjustmentTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)detectedFacesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (int)algorithmVersion;
- (unint64_t)detectedFacesCount;
- (unint64_t)hash;
- (void)addDetectedFaces:(id)a3;
- (void)clearDetectedFaces;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)persistToPhotosAsset:(id)a3;
- (void)setAdjustmentVersion:(double)a3;
- (void)setAlgorithmVersion:(int)a3;
- (void)setAssetAdjustmentTimestamp:(double)a3;
- (void)setAssetCloudIdentifier:(id)a3;
- (void)setAssetLocalIdentifier:(id)a3;
- (void)setDetectedFaces:(id)a3;
- (void)setHasAdjustmentVersion:(BOOL)a3;
- (void)setHasAlgorithmVersion:(BOOL)a3;
- (void)setHasAssetAdjustmentTimestamp:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation MADProtoFaceAsset

+ (id)protoFromPhotosAsset:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_alloc_init(MADProtoFaceAsset);
  v5 = [v3 localIdentifier];
  [(MADProtoFaceAsset *)v4 setAssetLocalIdentifier:v5];

  v6 = [v3 photoLibrary];
  v7 = [v3 localIdentifier];
  id v30 = 0;
  v8 = objc_msgSend(v6, "mad_cloudIdentifierForLocalIdentifier:error:", v7, &v30);
  id v9 = v30;
  [(MADProtoFaceAsset *)v4 setAssetCloudIdentifier:v8];

  v10 = [(MADProtoFaceAsset *)v4 assetCloudIdentifier];

  if (v10)
  {
    v11 = [v3 adjustmentTimestamp];
    [v11 timeIntervalSinceReferenceDate];
    -[MADProtoFaceAsset setAssetAdjustmentTimestamp:](v4, "setAssetAdjustmentTimestamp:");

    -[MADProtoFaceAsset setAlgorithmVersion:](v4, "setAlgorithmVersion:", [v3 faceAnalysisVersion]);
    v12 = [v3 faceAdjustmentVersion];
    [v12 timeIntervalSinceReferenceDate];
    -[MADProtoFaceAsset setAdjustmentVersion:](v4, "setAdjustmentVersion:");

    v13 = [v3 photoLibrary];
    v14 = objc_msgSend(v13, "mad_allFacesFetchOptions");

    uint64_t v15 = *MEMORY[0x1E4F39620];
    v31[0] = *MEMORY[0x1E4F39630];
    v31[1] = v15;
    v31[2] = *MEMORY[0x1E4F39610];
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
    [v14 setFetchPropertySets:v16];

    v17 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v3 options:v14];
    v18 = [MEMORY[0x1E4F1CA48] array];
    if ([v17 count])
    {
      unint64_t v19 = 0;
      do
      {
        v20 = (void *)MEMORY[0x1C186D320]();
        v21 = [v17 objectAtIndexedSubscript:v19];
        v22 = +[MADProtoDetectedFace protoFromPhotosFace:v21];
        [v18 addObject:v22];

        ++v19;
      }
      while (v19 < [v17 count]);
    }
    [(MADProtoFaceAsset *)v4 setValue:v18 forKey:@"detectedFaces"];
    if ((int)MediaAnalysisLogLevel() > 6)
    {
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = [v3 localIdentifier];
        v25 = [(MADProtoFaceAsset *)v4 detectedFaces];
        int v26 = [v25 count];
        *(_DWORD *)buf = 138412546;
        v33 = v24;
        __int16 v34 = 1024;
        LODWORD(v35) = v26;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_DEBUG, "[%@] Backed up %d faces", buf, 0x12u);
      }
    }
    v27 = v4;

LABEL_14:
    goto LABEL_15;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v28 = [v3 localIdentifier];
      *(_DWORD *)buf = 138412546;
      v33 = v28;
      __int16 v34 = 2112;
      id v35 = v9;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_ERROR, "[%@] Failed to fetch asset cloud identifier: %@", buf, 0x16u);
    }
    v27 = 0;
    goto LABEL_14;
  }
  v27 = 0;
LABEL_15:

  return v27;
}

- (void)persistToPhotosAsset:(id)a3
{
  v99[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F38ED8] changeRequestForAsset:v4];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = [v4 localIdentifier];
      v8 = [(MADProtoFaceAsset *)self detectedFaces];
      *(_DWORD *)buf = 138412546;
      v96 = v7;
      __int16 v97 = 1024;
      *(_DWORD *)v98 = [v8 count];
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_DEBUG, "[%@] Restoring %d faces", buf, 0x12u);
    }
  }
  id v9 = [(MADProtoFaceAsset *)self detectedFaces];
  uint64_t v10 = [v9 count];

  if (!v10)
  {
LABEL_63:
    v69 = (void *)MEMORY[0x1E4F1C9C8];
    [(MADProtoFaceAsset *)self adjustmentVersion];
    v70 = objc_msgSend(v69, "dateWithTimeIntervalSinceReferenceDate:");
    [v5 setFaceAdjustmentVersion:v70];

    objc_msgSend(v5, "setFaceAnalysisVersion:", (__int16)-[MADProtoFaceAsset algorithmVersion](self, "algorithmVersion"));
    if (objc_msgSend(v4, "mad_isEligibleForComputeSync"))
    {
      int v71 = [v5 faceAnalysisVersion];
      v72 = [v4 photoLibrary];
      int v73 = objc_msgSend(v72, "mad_faceProcessingInternalVersion");

      if (v73 == v71) {
        objc_msgSend(v5, "setLocalAnalysisStage:", objc_msgSend(v4, "mad_analysisStageAfterCompletingAnalysis:", 3));
      }
    }
    goto LABEL_72;
  }
  unint64_t v12 = 0;
  uint64_t v86 = *MEMORY[0x1E4F39630];
  uint64_t v85 = *MEMORY[0x1E4F39620];
  uint64_t v84 = *MEMORY[0x1E4F39610];
  *(void *)&long long v11 = 138413058;
  long long v76 = v11;
  id v87 = v4;
  v80 = v5;
  v83 = self;
  while (1)
  {
    v13 = (void *)MEMORY[0x1C186D320]();
    v14 = [(MADProtoFaceAsset *)self detectedFaces];
    uint64_t v15 = [v14 objectAtIndexedSubscript:v12];
    v16 = [v15 vcpPhotosFace];

    v17 = [v4 photoLibrary];
    v18 = objc_msgSend(v17, "mad_allFacesFetchOptions");

    v99[0] = v86;
    v99[1] = v85;
    v99[2] = v84;
    unint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:3];
    [v18 setFetchPropertySets:v19];

    v90 = v18;
    v20 = [MEMORY[0x1E4F39048] fetchFacesInAsset:v4 options:v18];
    v89 = v20;
    if (![v20 count]) {
      break;
    }
    uint64_t v21 = +[VCPPhotosFace facesFromPHFetchResult:v20 copyOption:2];
    [v16 size];
    double v23 = v22;
    int v24 = MediaAnalysisLogLevel();
    if (v23 == 0.0)
    {
      if (v24 >= 7)
      {
        id v35 = VCPLogInstance();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v36 = [v4 localIdentifier];
          v37 = [v16 gist];
          *(_DWORD *)buf = 138412546;
          v96 = v36;
          __int16 v97 = 2112;
          *(void *)v98 = v37;
          _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEBUG, "[%@] Face not present in restored face (%@), finding matching torso", buf, 0x16u);

          v5 = v80;
        }
      }
      uint64_t v91 = 0;
      v28 = (id *)&v91;
      uint64_t v29 = objc_msgSend(MEMORY[0x1E4F8CCE8], "sortedViableMergeCandidateTorsosFor:from:ignoreSourceAssetDimensions:matchScores:", v16, v21, 0, &v91, v76);
    }
    else
    {
      if (v24 >= 7)
      {
        v25 = VCPLogInstance();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          int v26 = [v4 localIdentifier];
          v27 = [v16 gist];
          *(_DWORD *)buf = 138412546;
          v96 = v26;
          __int16 v97 = 2112;
          *(void *)v98 = v27;
          _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[%@] Face present in restored face (%@), finding matching face", buf, 0x16u);

          v5 = v80;
        }
      }
      uint64_t v92 = 0;
      v28 = (id *)&v92;
      uint64_t v29 = objc_msgSend(MEMORY[0x1E4F8CCE8], "sortedViableMergeCandidateFacesFor:from:ignoreSourceAssetDimensions:matchScores:", v16, v21, 0, &v92, v76);
    }
    v38 = (void *)v29;
    id v39 = *v28;
    v88 = (void *)v21;
    if ([v38 count])
    {
      if ([v38 count])
      {
        v81 = v39;
        uint64_t v40 = 0;
        while (1)
        {
          v41 = [v38 objectAtIndexedSubscript:v40];
          int v42 = [v16 detectionType];
          int v43 = [v41 detectionType];
          int v44 = MediaAnalysisLogLevel();
          if (v42 == v43) {
            break;
          }
          if (v44 >= 6)
          {
            v45 = VCPLogInstance();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              v46 = [v4 localIdentifier];
              v47 = [v16 gist];
              v48 = [v41 gist];
              *(_DWORD *)buf = 138412802;
              v96 = v46;
              __int16 v97 = 2112;
              *(void *)v98 = v47;
              *(_WORD *)&v98[8] = 2112;
              *(void *)&v98[10] = v48;
              _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_INFO, " [%@] Mismatching detection type for detected face (%@) and existing face (%@), skip merging", buf, 0x20u);

              id v4 = v87;
            }
          }
          if (++v40 >= (unint64_t)[v38 count])
          {
            v41 = 0;
            goto LABEL_45;
          }
        }
        if (v44 >= 6)
        {
          v52 = VCPLogInstance();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v53 = [v4 localIdentifier];
            int v78 = [v38 count];
            v54 = [v41 gist];
            v55 = [v81 objectAtIndexedSubscript:v40];
            *(_DWORD *)buf = v76;
            v96 = v53;
            __int16 v97 = 1024;
            *(_DWORD *)v98 = v78;
            *(_WORD *)&v98[4] = 2112;
            *(void *)&v98[6] = v54;
            *(_WORD *)&v98[14] = 2112;
            *(void *)&v98[16] = v55;
            _os_log_impl(&dword_1BBEDA000, v52, OS_LOG_TYPE_INFO, "[%@] %d viable merge candidates, merging with the most matching one (%@, distanceScore: %@)", buf, 0x26u);
          }
        }
LABEL_45:
        id v39 = v81;
      }
      else
      {
        v41 = 0;
      }
      __int16 v34 = +[VCPFaceUtils phFaceFromVCPPhotosFace:v41 withFetchOptions:v90];
      BOOL v51 = v34 == 0;
      int v56 = MediaAnalysisLogLevel();
      if (v34)
      {
        if (v56 >= 7)
        {
          v57 = VCPLogInstance();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            v77 = [v4 localIdentifier];
            v79 = [v16 gist];
            uint64_t v58 = [v41 gist];
            *(_DWORD *)buf = 138412802;
            v96 = v77;
            __int16 v97 = 2112;
            *(void *)v98 = v79;
            *(_WORD *)&v98[8] = 2112;
            *(void *)&v98[10] = v58;
            v59 = (void *)v58;
            _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_DEBUG, "[%@] Merging restored face (%@) with existing face (%@)", buf, 0x20u);

            id v4 = v87;
          }
        }
        uint64_t v60 = [MEMORY[0x1E4F39058] changeRequestForFace:v34];
      }
      else
      {
        if (v56 >= 3)
        {
          v61 = VCPLogInstance();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            [v4 localIdentifier];
            v62 = id v82 = v39;
            v63 = [v41 gist];
            *(_DWORD *)buf = 138412546;
            v96 = v62;
            __int16 v97 = 2112;
            *(void *)v98 = v63;
            _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_ERROR, "[%@] Failed to find matching PHFace (%@), creating new face for restored face", buf, 0x16u);

            id v39 = v82;
            id v4 = v87;
          }
        }
        uint64_t v60 = [MEMORY[0x1E4F39058] creationRequestForFace];
      }
      v33 = (void *)v60;

      v5 = v80;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v49 = VCPLogInstance();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = [v4 localIdentifier];
          *(_DWORD *)buf = 138412290;
          v96 = v50;
          _os_log_impl(&dword_1BBEDA000, v49, OS_LOG_TYPE_ERROR, "[%@] No viable merge candidate, creating new face for restored face", buf, 0xCu);

          v5 = v80;
        }
      }
      v33 = [MEMORY[0x1E4F39058] creationRequestForFace];
      __int16 v34 = 0;
      BOOL v51 = 1;
    }

    if (!v33) {
      goto LABEL_67;
    }
    +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:v16 toPHFaceChangeRequest:v33];
    if (!v51)
    {
      v93 = v34;
      v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v93 count:1];
      [v5 addFaces:v66];

      [v33 setClusterSequenceNumber:0];
      [v33 setVuObservationID:0];
      goto LABEL_62;
    }
LABEL_60:
    v64 = [v33 placeholderForCreatedFace];
    v94 = v64;
    v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v94 count:1];
    [v5 addFaces:v65];

LABEL_62:
    ++v12;
    self = v83;
    v67 = [(MADProtoFaceAsset *)v83 detectedFaces];
    unint64_t v68 = [v67 count];

    if (v12 >= v68) {
      goto LABEL_63;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    id v30 = VCPLogInstance();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = [v4 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v96 = v31;
      _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_DEBUG, "[%@] No existing face, creating new face for restored face", buf, 0xCu);
    }
  }
  uint64_t v32 = objc_msgSend(MEMORY[0x1E4F39058], "creationRequestForFace", v76);
  if (v32)
  {
    v33 = (void *)v32;
    +[VCPFaceUtils assignPropertiesOfVCPPhotosFace:v16 toPHFaceChangeRequest:v32];
    __int16 v34 = 0;
    goto LABEL_60;
  }
  __int16 v34 = 0;
LABEL_67:
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    v74 = VCPLogInstance();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v75 = [v4 localIdentifier];
      *(_DWORD *)buf = 138412290;
      v96 = v75;
      _os_log_impl(&dword_1BBEDA000, v74, OS_LOG_TYPE_ERROR, "[%@] Failed to create PHFaceChangeRequest; skipping",
        buf,
        0xCu);
    }
  }

LABEL_72:
}

- (BOOL)hasAssetLocalIdentifier
{
  return self->_assetLocalIdentifier != 0;
}

- (BOOL)hasAssetCloudIdentifier
{
  return self->_assetCloudIdentifier != 0;
}

- (void)setAssetAdjustmentTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_assetAdjustmentTimestamp = a3;
}

- (void)setHasAssetAdjustmentTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssetAdjustmentTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAlgorithmVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_algorithmVersion = a3;
}

- (void)setHasAlgorithmVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAlgorithmVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAdjustmentVersion:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adjustmentVersion = a3;
}

- (void)setHasAdjustmentVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdjustmentVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearDetectedFaces
{
}

- (void)addDetectedFaces:(id)a3
{
  id v4 = a3;
  detectedFaces = self->_detectedFaces;
  id v8 = v4;
  if (!detectedFaces)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_detectedFaces;
    self->_detectedFaces = v6;

    id v4 = v8;
    detectedFaces = self->_detectedFaces;
  }
  [(NSMutableArray *)detectedFaces addObject:v4];
}

- (unint64_t)detectedFacesCount
{
  return [(NSMutableArray *)self->_detectedFaces count];
}

- (id)detectedFacesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_detectedFaces objectAtIndex:a3];
}

+ (Class)detectedFacesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MADProtoFaceAsset;
  id v4 = [(MADProtoFaceAsset *)&v8 description];
  v5 = [(MADProtoFaceAsset *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  assetLocalIdentifier = self->_assetLocalIdentifier;
  if (assetLocalIdentifier) {
    [v3 setObject:assetLocalIdentifier forKey:@"assetLocalIdentifier"];
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if (assetCloudIdentifier) {
    [v4 setObject:assetCloudIdentifier forKey:@"assetCloudIdentifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v17 = [NSNumber numberWithDouble:self->_assetAdjustmentTimestamp];
    [v4 setObject:v17 forKey:@"assetAdjustmentTimestamp"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v18 = [NSNumber numberWithInt:self->_algorithmVersion];
  [v4 setObject:v18 forKey:@"algorithmVersion"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    objc_super v8 = [NSNumber numberWithDouble:self->_adjustmentVersion];
    [v4 setObject:v8 forKey:@"adjustmentVersion"];
  }
LABEL_9:
  if ([(NSMutableArray *)self->_detectedFaces count])
  {
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_detectedFaces, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v10 = self->_detectedFaces;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "dictionaryRepresentation", (void)v19);
          [v9 addObject:v15];
        }
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    [v4 setObject:v9 forKey:@"detectedFaces"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MADProtoFaceAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_assetLocalIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_assetCloudIdentifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteDoubleField();
LABEL_9:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_detectedFaces;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_assetLocalIdentifier)
  {
    objc_msgSend(v4, "setAssetLocalIdentifier:");
    id v4 = v10;
  }
  if (self->_assetCloudIdentifier)
  {
    objc_msgSend(v10, "setAssetCloudIdentifier:");
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_17:
    *((_DWORD *)v4 + 6) = self->_algorithmVersion;
    *((unsigned char *)v4 + 56) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *((void *)v4 + 2) = *(void *)&self->_assetAdjustmentTimestamp;
  *((unsigned char *)v4 + 56) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_7:
  if (has)
  {
LABEL_8:
    *((void *)v4 + 1) = *(void *)&self->_adjustmentVersion;
    *((unsigned char *)v4 + 56) |= 1u;
  }
LABEL_9:
  if ([(MADProtoFaceAsset *)self detectedFacesCount])
  {
    [v10 clearDetectedFaces];
    unint64_t v6 = [(MADProtoFaceAsset *)self detectedFacesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(MADProtoFaceAsset *)self detectedFacesAtIndex:i];
        [v10 addDetectedFaces:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_assetLocalIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_assetCloudIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_assetAdjustmentTimestamp;
    *(unsigned char *)(v5 + 56) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_algorithmVersion;
  *(unsigned char *)(v5 + 56) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_adjustmentVersion;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
LABEL_5:
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_detectedFaces;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addDetectedFaces:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  assetLocalIdentifier = self->_assetLocalIdentifier;
  if ((unint64_t)assetLocalIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](assetLocalIdentifier, "isEqual:")) {
      goto LABEL_23;
    }
  }
  assetCloudIdentifier = self->_assetCloudIdentifier;
  if ((unint64_t)assetCloudIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](assetCloudIdentifier, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_assetAdjustmentTimestamp != *((double *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 4) == 0 || self->_algorithmVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_adjustmentVersion != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_23;
  }
  detectedFaces = self->_detectedFaces;
  if ((unint64_t)detectedFaces | *((void *)v4 + 6)) {
    char v8 = -[NSMutableArray isEqual:](detectedFaces, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetLocalIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_assetCloudIdentifier hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double assetAdjustmentTimestamp = self->_assetAdjustmentTimestamp;
    double v8 = -assetAdjustmentTimestamp;
    if (assetAdjustmentTimestamp >= 0.0) {
      double v8 = self->_assetAdjustmentTimestamp;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_algorithmVersion;
    if (has) {
      goto LABEL_11;
    }
LABEL_16:
    unint64_t v16 = 0;
    return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ [(NSMutableArray *)self->_detectedFaces hash];
  }
  uint64_t v11 = 0;
  if ((has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  double adjustmentVersion = self->_adjustmentVersion;
  double v13 = -adjustmentVersion;
  if (adjustmentVersion >= 0.0) {
    double v13 = self->_adjustmentVersion;
  }
  long double v14 = floor(v13 + 0.5);
  double v15 = (v13 - v14) * 1.84467441e19;
  unint64_t v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0) {
      v16 += (unint64_t)v15;
    }
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v16 ^ [(NSMutableArray *)self->_detectedFaces hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 5)) {
    -[MADProtoFaceAsset setAssetLocalIdentifier:](self, "setAssetLocalIdentifier:");
  }
  if (*((void *)v4 + 4)) {
    -[MADProtoFaceAsset setAssetCloudIdentifier:](self, "setAssetCloudIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 56);
  if ((v5 & 2) != 0)
  {
    self->_double assetAdjustmentTimestamp = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 56);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_algorithmVersion = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 56))
  {
LABEL_8:
    self->_double adjustmentVersion = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 6);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[MADProtoFaceAsset addDetectedFaces:](self, "addDetectedFaces:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (void)setAssetLocalIdentifier:(id)a3
{
}

- (NSString)assetCloudIdentifier
{
  return self->_assetCloudIdentifier;
}

- (void)setAssetCloudIdentifier:(id)a3
{
}

- (double)assetAdjustmentTimestamp
{
  return self->_assetAdjustmentTimestamp;
}

- (int)algorithmVersion
{
  return self->_algorithmVersion;
}

- (double)adjustmentVersion
{
  return self->_adjustmentVersion;
}

- (NSMutableArray)detectedFaces
{
  return self->_detectedFaces;
}

- (void)setDetectedFaces:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedFaces, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_assetCloudIdentifier, 0);
}

@end