@interface PHFaceChangeRequest
+ (id)changeRequestForFace:(id)a3;
+ (id)creationRequestForFace;
+ (void)deleteFaces:(id)a3;
- (BOOL)_associateFace:(id)a3 withPersonInPhotoLibrary:(id)a4 error:(id *)a5;
- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (BOOL)hasFaceMask;
- (BOOL)hasSmile;
- (BOOL)isHidden;
- (BOOL)isInTrash;
- (BOOL)isInVIPModel;
- (BOOL)isLeftEyeClosed;
- (BOOL)isRightEyeClosed;
- (BOOL)manual;
- (BOOL)shouldClearFaceCropGenerationState;
- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4;
- (CGRect)gazeRect;
- (NSString)groupingIdentifier;
- (NSString)managedEntityName;
- (NSURL)associatedPersonLibraryURL;
- (PHFaceChangeRequest)initWithUUID:(id)a3 objectID:(id)a4;
- (PHFaceChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5;
- (PHFaceprint)faceprint;
- (PHObjectPlaceholder)placeholderForCreatedFace;
- (double)blurScore;
- (double)bodyCenterX;
- (double)bodyCenterY;
- (double)bodyHeight;
- (double)bodyWidth;
- (double)centerX;
- (double)centerY;
- (double)duration;
- (double)gazeCenterX;
- (double)gazeCenterY;
- (double)poseYaw;
- (double)quality;
- (double)roll;
- (double)size;
- (double)startTime;
- (float)gazeAngle;
- (float)gazeConfidence;
- (id)_copyPersonWithPersonUUID:(id)a3 toLibrary:(id)a4 error:(id *)a5;
- (id)adjustmentVersion;
- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4;
- (id)initForNewObject;
- (int64_t)clusterSequenceNumber;
- (int64_t)faceAlgorithmVersion;
- (int64_t)nameSource;
- (int64_t)qualityMeasure;
- (int64_t)sourceHeight;
- (int64_t)sourceWidth;
- (int64_t)vuObservationID;
- (signed)detectionType;
- (unsigned)ageType;
- (unsigned)ethnicityType;
- (unsigned)eyeMakeupType;
- (unsigned)eyesState;
- (unsigned)faceExpressionType;
- (unsigned)facialHairType;
- (unsigned)gazeType;
- (unsigned)glassesType;
- (unsigned)hairColorType;
- (unsigned)hairType;
- (unsigned)headgearType;
- (unsigned)lipMakeupType;
- (unsigned)poseType;
- (unsigned)sexType;
- (unsigned)skintoneType;
- (unsigned)smileType;
- (void)associateFaceWithPersonUUID:(id)a3;
- (void)encodeToXPCDict:(id)a3;
- (void)setAdjustmentVersion:(id)a3;
- (void)setAgeType:(unsigned __int16)a3;
- (void)setAssociatedPersonLibraryURL:(id)a3;
- (void)setBlurScore:(double)a3;
- (void)setBodyCenterX:(double)a3;
- (void)setBodyCenterY:(double)a3;
- (void)setBodyHeight:(double)a3;
- (void)setBodyWidth:(double)a3;
- (void)setCenterX:(double)a3;
- (void)setCenterY:(double)a3;
- (void)setClusterSequenceNumber:(int64_t)a3;
- (void)setDetectionTraits:(id)a3;
- (void)setDetectionType:(signed __int16)a3;
- (void)setDuration:(double)a3;
- (void)setEthnicityType:(unsigned __int16)a3;
- (void)setEyeMakeupType:(unsigned __int16)a3;
- (void)setEyesState:(unsigned __int16)a3;
- (void)setFaceAlgorithmVersion:(int64_t)a3;
- (void)setFaceExpressionType:(unsigned __int16)a3;
- (void)setFaceprint:(id)a3;
- (void)setFacialHairType:(unsigned __int16)a3;
- (void)setGazeAngle:(float)a3;
- (void)setGazeCenterX:(double)a3;
- (void)setGazeCenterY:(double)a3;
- (void)setGazeConfidence:(float)a3;
- (void)setGazeRect:(CGRect)a3;
- (void)setGazeType:(unsigned __int16)a3;
- (void)setGlassesType:(unsigned __int16)a3;
- (void)setGroupingIdentifier:(id)a3;
- (void)setHairColorType:(unsigned __int16)a3;
- (void)setHairType:(unsigned __int16)a3;
- (void)setHasFaceMask:(BOOL)a3;
- (void)setHasSmile:(BOOL)a3;
- (void)setHeadgearType:(unsigned __int16)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInTrash:(BOOL)a3;
- (void)setIsInVIPModel:(BOOL)a3;
- (void)setLeftEyeClosed:(BOOL)a3;
- (void)setLipMakeupType:(unsigned __int16)a3;
- (void)setManual:(BOOL)a3;
- (void)setNameSource:(int64_t)a3;
- (void)setPoseType:(unsigned __int16)a3;
- (void)setPoseYaw:(double)a3;
- (void)setQuality:(double)a3;
- (void)setQualityMeasure:(int64_t)a3;
- (void)setRightEyeClosed:(BOOL)a3;
- (void)setRoll:(double)a3;
- (void)setSexType:(unsigned __int16)a3;
- (void)setShouldClearFaceCropGenerationState:(BOOL)a3;
- (void)setSize:(double)a3;
- (void)setSkintoneType:(unsigned __int16)a3;
- (void)setSmileType:(unsigned __int16)a3;
- (void)setSourceHeight:(int64_t)a3;
- (void)setSourceWidth:(int64_t)a3;
- (void)setStartTime:(double)a3;
- (void)setVuObservationID:(int64_t)a3;
@end

@implementation PHFaceChangeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedPersonLibraryURL, 0);
  objc_storeStrong((id *)&self->_gazeRectString, 0);
  objc_storeStrong((id *)&self->_associatedPersonUUID, 0);
  objc_storeStrong((id *)&self->_detectionTraits, 0);

  objc_storeStrong((id *)&self->_faceprint, 0);
}

- (void)setAssociatedPersonLibraryURL:(id)a3
{
}

- (NSURL)associatedPersonLibraryURL
{
  return self->_associatedPersonLibraryURL;
}

- (BOOL)shouldClearFaceCropGenerationState
{
  return self->_shouldClearFaceCropGenerationState;
}

- (void)setShouldClearFaceCropGenerationState:(BOOL)a3
{
  self->_shouldClearFaceCropGenerationState = a3;
  if (a3) {
    [(PHChangeRequest *)self didMutate];
  }
}

- (id)_copyPersonWithPersonUUID:(id)a3 toLibrary:(id)a4 error:(id *)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = [v9 managedObjectContext];
  if (self->_associatedPersonLibraryURL)
  {
    uint64_t v36 = 0;
    v11 = (id *)&v36;
    uint64_t v12 = PLCreateShortLivedPhotoLibraryWithPhotoLibraryURL();
  }
  else
  {
    uint64_t v37 = 0;
    v11 = (id *)&v37;
    uint64_t v12 = PLCreateShortLivedWellKnownPhotoLibrary();
  }
  v13 = (void *)v12;
  id v14 = *v11;
  v15 = v14;
  if (!v13)
  {
    id v26 = v14;
    v27 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      associatedPersonLibraryURL = self->_associatedPersonLibraryURL;
      if (!associatedPersonLibraryURL) {
        associatedPersonLibraryURL = (NSURL *)@"SYSTEM";
      }
      *(_DWORD *)buf = 138412290;
      v39 = associatedPersonLibraryURL;
      _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_ERROR, "source photo library (%@) could not be opened", buf, 0xCu);
    }

    id v29 = v26;
    goto LABEL_16;
  }
  id v33 = v14;
  v34 = a5;
  v16 = v10;
  v17 = (void *)[MEMORY[0x1E4F8A8B8] newTransferOptionsForPersonFromSystemToSyndication];
  [v17 setSkipContextSave:1];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F8A8B0]) initWithSourceLibrary:v13 destinationLibrary:v9 options:v17];
  id v35 = 0;
  int v19 = [v18 transferPersonWithUuid:v8 error:&v35];
  id v20 = v35;
  id v21 = v8;
  v22 = v20;
  if (v19)
  {
    v23 = v21;
    v24 = objc_msgSend(MEMORY[0x1E4F8AA10], "personWithUUID:inManagedObjectContext:");
    id v25 = 0;
  }
  else
  {
    v23 = v21;
    id v25 = v20;
    v30 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      associatedPersonUUID = self->_associatedPersonUUID;
      *(_DWORD *)buf = 138543618;
      v39 = (NSURL *)associatedPersonUUID;
      __int16 v40 = 2112;
      id v41 = v25;
      _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "transfer person failed for %{public}@: %@", buf, 0x16u);
    }

    v24 = 0;
  }

  id v29 = v25;
  v10 = v16;
  id v8 = v23;
  v15 = v33;
  a5 = v34;
  if (!v24)
  {
LABEL_16:
    if (a5)
    {
      id v29 = v29;
      v24 = 0;
      *a5 = v29;
    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (BOOL)_associateFace:(id)a3 withPersonInPhotoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PHFaceChangeRequest.m", 422, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];
  }
  if (!self->_didSetAssociatedPersonUUID)
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PHFaceChangeRequest.m", 423, @"Invalid parameter not satisfying: %@", @"_didSetAssociatedPersonUUID" object file lineNumber description];
  }
  if (self->_associatedPersonUUID)
  {
    v11 = [v10 managedObjectContext];
    uint64_t v12 = [MEMORY[0x1E4F8AA10] personWithUUID:self->_associatedPersonUUID inManagedObjectContext:v11];
    if (v12)
    {
      id v13 = (id)v12;
      id v14 = 0;
    }
    else
    {
      associatedPersonUUID = self->_associatedPersonUUID;
      id v31 = 0;
      id v13 = [(PHFaceChangeRequest *)self _copyPersonWithPersonUUID:associatedPersonUUID toLibrary:v10 error:&v31];
      id v14 = v31;
      if (!v13)
      {
LABEL_16:
        v24 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = [v9 uuid];
          id v26 = self->_associatedPersonUUID;
          *(_DWORD *)buf = 138543618;
          id v33 = v25;
          __int16 v34 = 2114;
          id v35 = v26;
          _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_ERROR, "Unable to associate face %{public}@ with target person %{public}@ (person not found)", buf, 0x16u);
        }
        if (a5)
        {
          id v14 = v14;
          BOOL v17 = 0;
          *a5 = v14;
        }
        else
        {
          BOOL v17 = 0;
        }
        goto LABEL_22;
      }
    }
    if ([v13 verifiedType] == -2)
    {
      int v19 = [v13 mergeTargetPerson];

      id v20 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v30 = v10;
        id v21 = a5;
        v22 = self->_associatedPersonUUID;
        v23 = [v19 personUUID];
        *(_DWORD *)buf = 138543618;
        id v33 = v22;
        a5 = v21;
        id v10 = v30;
        __int16 v34 = 2114;
        id v35 = v23;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_INFO, "Attempt to associate a face with a tombstone person %{public}@, will associate with merge target %{public}@", buf, 0x16u);
      }
      if (!v19) {
        goto LABEL_16;
      }
    }
    else
    {
      int v19 = v13;
    }
    [v9 setAssociatedPerson:v19];

    BOOL v17 = 1;
LABEL_22:

    goto LABEL_23;
  }
  v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [v9 uuid];
    *(_DWORD *)buf = 138543362;
    id v33 = v16;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_INFO, "setting person relationship to nil for face %{public}@", buf, 0xCu);
  }
  [v9 setAssociatedPerson:0];
  BOOL v17 = 1;
LABEL_23:

  return v17;
}

- (void)associateFaceWithPersonUUID:(id)a3
{
  v4 = (NSString *)a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetAssociatedPersonUUID = 1;
  associatedPersonUUID = self->_associatedPersonUUID;
  self->_associatedPersonUUID = v4;
}

- (int64_t)nameSource
{
  return self->_nameSource;
}

- (void)setNameSource:(int64_t)a3
{
  int v3 = a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetNameSource = 1;
  self->_nameSource = v3;
}

- (void)setDetectionTraits:(id)a3
{
  id v5 = a3;
  [(PHChangeRequest *)self didMutate];
  uint64_t v4 = (uint64_t)v5;
  self->_didSetDetectionTraits = 1;
  if (!v5)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C978] array];
  }
  id v6 = (id)v4;
  [(NSMutableArray *)self->_detectionTraits setArray:v4];
}

- (CGRect)gazeRect
{
  [MEMORY[0x1E4F8A7B0] cgRectFromGazeRectString:self->_gazeRectString];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setGazeRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PHChangeRequest *)self didMutate];
  self->_didSetGazeRect = 1;
  objc_msgSend(MEMORY[0x1E4F8A7B0], "stringFromGazeRect:", x, y, width, height);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  gazeRectString = self->_gazeRectString;
  self->_gazeRectString = v8;
}

- (PHFaceprint)faceprint
{
  return self->_faceprint;
}

- (void)setFaceprint:(id)a3
{
  double v4 = (PHFaceprint *)a3;
  [(PHChangeRequest *)self didMutate];
  self->_didSetFaceprint = 1;
  faceprint = self->_faceprint;
  self->_faceprint = v4;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F8A7B0];
  v7 = [a3 managedObjectContext];
  id v8 = [v6 insertInManagedObjectContext:v7];

  if (!a4 || v8)
  {
    uint64_t v12 = [(PHChangeRequest *)self uuid];
    [v8 setUuid:v12];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithFormat:@"Failed to create face"];
    v15[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", -1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v5 = [(PHFaceChangeRequest *)self detectionType];
  int v6 = v5;
  if (a4 && v5 == 2)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F28228];
    v11[0] = @"PHDetectionTypePet is not a valid value to assign to PHFace.detectionType";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 != 2;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = [v7 nameSource];
  uint64_t v10 = [(PHChangeRequest *)self helper];
  id v57 = 0;
  int v11 = [v10 applyMutationsToManagedObject:v7 error:&v57];
  id v12 = v57;

  if (!v11)
  {
    BOOL v40 = 0;
    goto LABEL_38;
  }
  if (self->_didSetNameSource) {
    [v7 setEffectiveNameSource:self->_nameSource];
  }
  if ([v7 effectiveNameSource] == 1 && v9 != 1) {
    [v7 setConfirmedFaceCropGenerationState:1];
  }
  if (self->_didSetDetectionTraits)
  {
    v47 = [MEMORY[0x1E4F1CA80] set];
    id v13 = [v7 managedObjectContext];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v46 = v7;
    uint64_t v14 = [v7 detectionTraits];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v14);
          }
          [v13 deleteObject:*(void *)(*((void *)&v53 + 1) + 8 * i)];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v16);
    }
    id v43 = v12;
    id v45 = v8;

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v44 = self;
    int v19 = self->_detectionTraits;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          id v25 = (void *)MEMORY[0x1E4F8A7C8];
          uint64_t v26 = objc_msgSend(v24, "type", v43);
          uint64_t v27 = [v24 value];
          [v24 score];
          double v29 = v28;
          [v24 startTime];
          double v31 = v30;
          [v24 duration];
          id v33 = [v25 insertIntoManagedObjectContext:v13 type:v26 value:v27 score:v29 startTime:v31 duration:v32];
          [v47 addObject:v33];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v21);
    }

    id v7 = v46;
    [v46 setDetectionTraits:v47];

    self = v44;
    id v8 = v45;
    id v12 = v43;
  }
  if (self->_didSetFaceprint)
  {
    [v7 removeFaceprint];
    if (self->_faceprint)
    {
      __int16 v34 = (void *)MEMORY[0x1E4F8A7C0];
      id v35 = [v7 managedObjectContext];
      uint64_t v36 = [v34 insertInManagedObjectContext:v35];

      [v36 setFace:v7];
      uint64_t v37 = [(PHFaceprint *)self->_faceprint faceprintData];
      [v36 setData:v37];

      objc_msgSend(v36, "setFaceprintVersion:", -[PHFaceprint faceprintVersion](self->_faceprint, "faceprintVersion"));
      [v7 setFaceprint:v36];
    }
  }
  if (!self->_didSetAssociatedPersonUUID)
  {
    if (self->_didSetGazeRect) {
      [v7 setGazeRectString:self->_gazeRectString];
    }
    goto LABEL_33;
  }
  id v48 = v12;
  BOOL v38 = [(PHFaceChangeRequest *)self _associateFace:v7 withPersonInPhotoLibrary:v8 error:&v48];
  id v39 = v48;

  if (!self->_didSetGazeRect)
  {
    if (v38) {
      goto LABEL_29;
    }
LABEL_37:
    BOOL v40 = 0;
    id v12 = v39;
    goto LABEL_38;
  }
  [v7 setGazeRectString:self->_gazeRectString];
  if (!v38) {
    goto LABEL_37;
  }
LABEL_29:
  id v12 = v39;
LABEL_33:
  if (self->_shouldClearFaceCropGenerationState)
  {
    [v7 setConfirmedFaceCropGenerationState:0];
    id v41 = [MEMORY[0x1E4F1CAD0] set];
    [v7 setRejectedPersonsNeedingFaceCrops:v41];
  }
  objc_msgSend(v7, "fixAssetRelationshipsForFaceTorsoOrTemporal", v43);
  [v7 fixPersonRelationshipsForFaceTorsoOrTemporal];
  BOOL v40 = 1;
LABEL_38:

  return v40;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(PHChangeRequest *)self helper];
  id v19 = 0;
  int v8 = [v7 validateMutationsToManagedObject:v6 error:&v19];

  id v9 = v19;
  if (v8)
  {
    uint64_t v10 = [(PHChangeRequest *)self helper];
    int v11 = [v10 mutations];
    id v12 = [v11 objectForKeyedSubscript:@"detectionType"];
    int v13 = [v12 isEqual:&unk_1EEB25AA0];

    if (!v13)
    {
      BOOL v17 = 1;
      goto LABEL_8;
    }
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    v21[0] = @"PHDetectionTypePet is not a valid value to assign to DetectedFace.detectionType";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    uint64_t v16 = objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", @"PHPhotosErrorDomain", 3111, v15);

    id v9 = (id)v16;
  }
  if (a4)
  {
    id v9 = v9;
    BOOL v17 = 0;
    *a4 = v9;
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_8:

  return v17;
}

- (NSString)managedEntityName
{
  return (NSString *)@"DetectedFace";
}

- (void)setAdjustmentVersion:(id)a3
{
  id v10 = a3;
  double v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  int v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"adjustmentVersion"];

    int v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"adjustmentVersion"];
  }
  else
  {
    [v6 removeObjectForKey:@"adjustmentVersion"];

    int v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"adjustmentVersion"];
  }
}

- (id)adjustmentVersion
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"adjustmentVersion"];

  return v5;
}

- (void)setGroupingIdentifier:(id)a3
{
  id v10 = a3;
  double v4 = [(PHChangeRequest *)self helper];
  [v4 didMutate];

  int v5 = [(PHChangeRequest *)self helper];
  id v6 = [v5 mutations];
  id v7 = v6;
  if (v10)
  {
    [v6 setObject:v10 forKeyedSubscript:@"groupingIdentifier"];

    int v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 removeObject:@"groupingIdentifier"];
  }
  else
  {
    [v6 removeObjectForKey:@"groupingIdentifier"];

    int v8 = [(PHChangeRequest *)self helper];
    id v9 = [v8 nilMutations];
    [v9 addObject:@"groupingIdentifier"];
  }
}

- (NSString)groupingIdentifier
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"groupingIdentifier"];

  return (NSString *)v5;
}

- (void)setDuration:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  id v6 = [(PHChangeRequest *)self helper];
  id v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"duration"];
}

- (double)duration
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"duration"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setStartTime:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"startTime"];
}

- (double)startTime
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"startTime"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setGazeConfidence:(float)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  *(float *)&double v6 = a3;
  id v9 = [NSNumber numberWithFloat:v6];
  double v7 = [(PHChangeRequest *)self helper];
  id v8 = [v7 mutations];
  [v8 setObject:v9 forKeyedSubscript:@"gazeConfidence"];
}

- (float)gazeConfidence
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"gazeConfidence"];

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (void)setGazeAngle:(float)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  *(float *)&double v6 = a3;
  id v9 = [NSNumber numberWithFloat:v6];
  float v7 = [(PHChangeRequest *)self helper];
  id v8 = [v7 mutations];
  [v8 setObject:v9 forKeyedSubscript:@"gazeAngle"];
}

- (float)gazeAngle
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"gazeAngle"];

  [v5 floatValue];
  float v7 = v6;

  return v7;
}

- (void)setGazeCenterY:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  float v6 = [(PHChangeRequest *)self helper];
  float v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"gazeCenterY"];
}

- (double)gazeCenterY
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"gazeCenterY"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setGazeCenterX:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"gazeCenterX"];
}

- (double)gazeCenterX
{
  +[PHPhotoLibrary assertTransaction];
  double v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"gazeCenterX"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setGazeType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"gazeType"];
}

- (unsigned)gazeType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"gazeType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setHasFaceMask:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"hasFaceMask"];
}

- (BOOL)hasFaceMask
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"hasFaceMask"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setEthnicityType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"ethnicityType"];
}

- (unsigned)ethnicityType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"ethnicityType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setSkintoneType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"skintoneType"];
}

- (unsigned)skintoneType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"skintoneType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setPoseType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"poseType"];
}

- (unsigned)poseType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"poseType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setHairType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"hairType"];
}

- (unsigned)hairType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"hairType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setHeadgearType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"headgearType"];
}

- (unsigned)headgearType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"headgearType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setFaceExpressionType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"faceExpressionType"];
}

- (unsigned)faceExpressionType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"faceExpressionType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setLipMakeupType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"lipMakeupType"];
}

- (unsigned)lipMakeupType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"lipMakeupType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setEyeMakeupType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"eyeMakeupType"];
}

- (unsigned)eyeMakeupType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"eyeMakeupType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setGlassesType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"glassesType"];
}

- (unsigned)glassesType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"glassesType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setHairColorType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"hairColorType"];
}

- (unsigned)hairColorType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"hairColorType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setFacialHairType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"facialHairType"];
}

- (unsigned)facialHairType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"facialHairType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setSmileType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"smileType"];
}

- (unsigned)smileType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"smileType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setEyesState:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"eyesState"];
}

- (unsigned)eyesState
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"eyesState"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setSexType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"genderType"];
}

- (unsigned)sexType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"genderType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setAgeType:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithUnsignedShort:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"ageType"];
}

- (unsigned)ageType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"ageType"];

  LOWORD(v3) = [v5 intValue];
  return (unsigned __int16)v3;
}

- (void)setVuObservationID:(int64_t)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"vuObservationID"];
}

- (int64_t)vuObservationID
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"vuObservationID"];

  int64_t v6 = [v5 integerValue];
  return v6;
}

- (void)setQuality:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"quality"];
}

- (double)quality
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"quality"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setQualityMeasure:(int64_t)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"qualityMeasure"];
}

- (int64_t)qualityMeasure
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"qualityMeasure"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setClusterSequenceNumber:(int64_t)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"clusterSequenceNumber"];
}

- (int64_t)clusterSequenceNumber
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"clusterSequenceNumber"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setFaceAlgorithmVersion:(int64_t)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"faceAlgorithmVersion"];
}

- (int64_t)faceAlgorithmVersion
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"faceAlgorithmVersion"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setPoseYaw:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"poseYaw"];
}

- (double)poseYaw
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"poseYaw"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setRightEyeClosed:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"isRightEyeClosed"];
}

- (BOOL)isRightEyeClosed
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"isRightEyeClosed"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setLeftEyeClosed:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"isLeftEyeClosed"];
}

- (BOOL)isLeftEyeClosed
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"isLeftEyeClosed"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setBlurScore:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"blurScore"];
}

- (double)blurScore
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"blurScore"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setHasSmile:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"hasSmile"];
}

- (BOOL)hasSmile
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"hasSmile"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setManual:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"manual"];
}

- (BOOL)manual
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"manual"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setInTrash:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"isInTrash"];
}

- (BOOL)isInTrash
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"isInTrash"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"hidden"];
}

- (BOOL)isHidden
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"hidden"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setIsInVIPModel:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithBool:v3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"vipModelType"];
}

- (BOOL)isInVIPModel
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"vipModelType"];

  LOBYTE(v3) = [v5 BOOLValue];
  return (char)v3;
}

- (void)setRoll:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"roll"];
}

- (double)roll
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"roll"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setSourceHeight:(int64_t)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"sourceHeight"];
}

- (int64_t)sourceHeight
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"sourceHeight"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setSourceWidth:(int64_t)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithInteger:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"sourceWidth"];
}

- (int64_t)sourceWidth
{
  +[PHPhotoLibrary assertTransaction];
  BOOL v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"sourceWidth"];

  int64_t v6 = (int)[v5 intValue];
  return v6;
}

- (void)setDetectionType:(signed __int16)a3
{
  uint64_t v3 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithShort:v3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"detectionType"];
}

- (signed)detectionType
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"detectionType"];

  LOWORD(v3) = [v5 intValue];
  return (__int16)v3;
}

- (void)setBodyHeight:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  int64_t v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"bodyHeight"];
}

- (double)bodyHeight
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"bodyHeight"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setBodyWidth:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"bodyWidth"];
}

- (double)bodyWidth
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"bodyWidth"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setBodyCenterY:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"bodyCenterY"];
}

- (double)bodyCenterY
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"bodyCenterY"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setBodyCenterX:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"bodyCenterX"];
}

- (double)bodyCenterX
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"bodyCenterX"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setCenterY:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"centerY"];
}

- (double)centerY
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"centerY"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setCenterX:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"centerX"];
}

- (double)centerX
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"centerX"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (void)setSize:(double)a3
{
  int v5 = [(PHChangeRequest *)self helper];
  [v5 didMutate];

  id v8 = [NSNumber numberWithDouble:a3];
  double v6 = [(PHChangeRequest *)self helper];
  double v7 = [v6 mutations];
  [v7 setObject:v8 forKeyedSubscript:@"size"];
}

- (double)size
{
  +[PHPhotoLibrary assertTransaction];
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 mutations];
  int v5 = [v4 objectForKey:@"size"];

  [v5 doubleValue];
  double v7 = v6;

  return v7;
}

- (PHObjectPlaceholder)placeholderForCreatedFace
{
  uint64_t v3 = [(PHChangeRequest *)self helper];
  double v4 = [v3 placeholderForCreatedObjectWithClass:objc_opt_class() changeRequest:self];

  return (PHObjectPlaceholder *)v4;
}

- (void)encodeToXPCDict:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PHChangeRequest *)self helper];
  [v5 encodeToXPCDict:v4];

  xpc_dictionary_set_BOOL(v4, "didSetDetectionTraits", self->_didSetDetectionTraits);
  if (self->_didSetDetectionTraits)
  {
    double v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_detectionTraits, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    double v7 = self->_detectionTraits;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "propertyListRepresentation", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    PLXPCDictionarySetArray();
  }
  xpc_dictionary_set_BOOL(v4, "didSetFaceprint", self->_didSetFaceprint);
  if (self->_didSetFaceprint)
  {
    faceprint = self->_faceprint;
    if (faceprint)
    {
      uint64_t v14 = [(PHFaceprint *)faceprint dictionaryRepresentation];
      PLXPCDictionarySetDictionary();
    }
  }
  xpc_dictionary_set_BOOL(v4, "shouldClearFaceCropGenerationState", self->_shouldClearFaceCropGenerationState);
  xpc_dictionary_set_BOOL(v4, "didSetAssociatedPersonUUID", self->_didSetAssociatedPersonUUID);
  if (self->_didSetAssociatedPersonUUID)
  {
    PLXPCDictionarySetString();
    PLXPCDictionarySetURL();
  }
  xpc_dictionary_set_BOOL(v4, "didSetGazeRect", self->_didSetGazeRect);
  if (self->_didSetGazeRect) {
    PLXPCDictionarySetString();
  }
  xpc_dictionary_set_BOOL(v4, "didSetNameSource", self->_didSetNameSource);
  if (self->_didSetNameSource) {
    xpc_dictionary_set_int64(v4, "nameSource", self->_nameSource);
  }
}

- (PHFaceChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)PHFaceChangeRequest;
  int v11 = [(PHChangeRequest *)&v40 init];
  if (v11)
  {
    id v12 = [[PHChangeRequestHelper alloc] initWithXPCDict:v8 changeRequest:v11 request:v9 clientAuthorization:v10];
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v11->_didSetDetectionTraits = xpc_dictionary_get_BOOL(v8, "didSetDetectionTraits");
      v11->_didSetFaceprint = xpc_dictionary_get_BOOL(v8, "didSetFaceprint");
      v11->_didSetAssociatedPersonUUID = xpc_dictionary_get_BOOL(v8, "didSetAssociatedPersonUUID");
      v11->_didSetGazeRect = xpc_dictionary_get_BOOL(v8, "didSetGazeRect");
      v11->_didSetNameSource = xpc_dictionary_get_BOOL(v8, "didSetNameSource");
      if (v11->_didSetDetectionTraits)
      {
        id v35 = v10;
        uint64_t v14 = PLArrayFromXPCDictionary();
        long long v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v16 = v14;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v37 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [[PHDetectionTrait alloc] initWithPropertyListRepresentation:*(void *)(*((void *)&v36 + 1) + 8 * i)];
              [(NSMutableArray *)v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v36 objects:v41 count:16];
          }
          while (v18);
        }

        detectionTraits = v11->_detectionTraits;
        v11->_detectionTraits = v15;
        v23 = v15;

        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];

        id v10 = v35;
      }
      if (v11->_didSetFaceprint)
      {
        v24 = PLDictionaryFromXPCDictionary();
        if (v24)
        {
          id v25 = [[PHFaceprint alloc] initWithDictionaryRepresentation:v24];
          faceprint = v11->_faceprint;
          v11->_faceprint = v25;
        }
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      BOOL v27 = xpc_dictionary_get_BOOL(v8, "shouldClearFaceCropGenerationState");
      v11->_shouldClearFaceCropGenerationState = v27;
      if (v27)
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
      }
      if (v11->_didSetAssociatedPersonUUID)
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
        uint64_t v28 = PLStringFromXPCDictionary();
        associatedPersonUUID = v11->_associatedPersonUUID;
        v11->_associatedPersonUUID = (NSString *)v28;

        uint64_t v30 = PLURLFromXPCDictionary();
        associatedPersonLibraryURL = v11->_associatedPersonLibraryURL;
        v11->_associatedPersonLibraryURL = (NSURL *)v30;
      }
      if (v11->_didSetGazeRect)
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
        uint64_t v32 = PLStringFromXPCDictionary();
        gazeRectString = v11->_gazeRectString;
        v11->_gazeRectString = (NSString *)v32;
      }
      if (v11->_didSetNameSource)
      {
        [(PHChangeRequestHelper *)v11->super._helper setMutated:1];
        [v9 recordUpdateRequest:v11];
        v11->_nameSource = xpc_dictionary_get_int64(v8, "nameSource");
      }
    }
  }

  return v11;
}

- (PHFaceChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHFaceChangeRequest;
  id v8 = [(PHChangeRequest *)&v14 init];
  if (v8)
  {
    id v9 = [[PHChangeRequestHelper alloc] initWithUUID:v6 objectID:v7 changeRequest:v8];
    helper = v8->super._helper;
    v8->super._helper = v9;

    int v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    detectionTraits = v8->_detectionTraits;
    v8->_detectionTraits = v11;
  }
  return v8;
}

- (id)initForNewObject
{
  v8.receiver = self;
  v8.super_class = (Class)PHFaceChangeRequest;
  double v2 = [(PHChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [[PHChangeRequestHelper alloc] initForNewObjectWithChangeRequest:v2];
    helper = v2->super._helper;
    v2->super._helper = v3;

    int v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    detectionTraits = v2->_detectionTraits;
    v2->_detectionTraits = v5;
  }
  return v2;
}

+ (void)deleteFaces:(id)a3
{
  id v5 = a3;
  id v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:v5 ofType:objc_opt_class() forSelector:a2];
}

+ (id)changeRequestForFace:(id)a3
{
  if (a3)
  {
    id v4 = +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)creationRequestForFace
{
  id v2 = [[PHFaceChangeRequest alloc] initForNewObject];

  return v2;
}

@end