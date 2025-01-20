@interface VNReadOnlyPersonsModel
+ (BOOL)isReadOnly;
+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5;
- (BOOL)dropCurrentFaceModelAndReturnError:(id *)a3;
- (VNReadOnlyPersonsModel)initWithConfiguration:(id)a3 faceModel:(id)a4;
- (id)faceCountsForAllPersons;
- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3;
- (id)faceObservationsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (id)personUniqueIdentifiers;
- (id)personsModel:(id)a3 faceObservationAtIndex:(unint64_t)a4 forPersonAtIndex:(unint64_t)a5;
- (id)personsModel:(id)a3 uniqueIdentifierOfPersonAtIndex:(unint64_t)a4;
- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4;
- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3;
- (unint64_t)numberOfPersonsInPersonsModel:(id)a3;
- (unint64_t)personCount;
- (unint64_t)personsModel:(id)a3 indexOfPersonWithUniqueIdentifier:(id)a4;
- (unint64_t)personsModel:(id)a3 numberOfFaceObservationsForPersonAtIndex:(unint64_t)a4;
@end

@implementation VNReadOnlyPersonsModel

- (id)personsModel:(id)a3 faceObservationAtIndex:(unint64_t)a4 forPersonAtIndex:(unint64_t)a5
{
  v5 = -[VNReadOnlyPersonsModel upToDateFaceModelWithCanceller:error:](self, "upToDateFaceModelWithCanceller:error:", 0, 0, a5);
  uint64_t v6 = [v5 faceprintRequestRevision];
  v7 = +[VNFaceObservation faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:](VNFaceObservation, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", v6, 0, 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v7;
}

- (unint64_t)personsModel:(id)a3 numberOfFaceObservationsForPersonAtIndex:(unint64_t)a4
{
  return 0;
}

- (unint64_t)personsModel:(id)a3 indexOfPersonWithUniqueIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 personUniqueIdentifiers];
    unint64_t v9 = [v8 indexOfObject:v5];
  }
  else
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)personsModel:(id)a3 uniqueIdentifierOfPersonAtIndex:(unint64_t)a4
{
  id v5 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  uint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 personUniqueIdentifiers];
    v8 = [v7 objectAtIndex:a4];
  }
  else
  {
    v8 = &stru_1EF75C0C0;
  }

  return v8;
}

- (unint64_t)numberOfPersonsInPersonsModel:(id)a3
{
  v3 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 personUniqueIdentifiers];
    unint64_t v6 = [v5 count];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)faceCountsForAllPersons
{
  v2 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 faceCountsForAllPersons];
  }
  else
  {
    v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  unint64_t v6 = v5;
  if (v5)
  {
    v7 = [v5 faceCountsForPersonsWithUniqueIdentifiers:v4];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v7;
}

- (id)faceObservationsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    VNPersonsModelErrorForReadOnlyModelWithLocalizedDescription(@"face observations are not available");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  unint64_t v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 faceCountForPersonWithUniqueIdentifier:v4];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)personUniqueIdentifiers
{
  v2 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 personUniqueIdentifiers];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (unint64_t)personCount
{
  v2 = [(VNReadOnlyPersonsModel *)self upToDateFaceModelWithCanceller:0 error:0];
  v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 personCount];
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4
{
  return self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
}

- (BOOL)dropCurrentFaceModelAndReturnError:(id *)a3
{
  if (a3)
  {
    VNPersonsModelErrorForReadOnlyModelWithLocalizedDescription(0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (VNReadOnlyPersonsModel)initWithConfiguration:(id)a3 faceModel:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNReadOnlyPersonsModel;
  v8 = [(VNPersonsModel *)&v11 initWithConfiguration:a3 dataSource:self];
  unint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->super._faceModel_DO_NOT_ACCESS_DIRECTLY, a4);
  }

  return v9;
}

+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = [a1 configurationFromLoadedObjects:v7 error:a5];
  if (v8)
  {
    uint64_t v9 = 0;
    char v10 = 1;
    while (1)
    {
      char v11 = v10;
      v12 = [NSNumber numberWithUnsignedInt:*((unsigned int *)&+[VNReadOnlyPersonsModel newModelFromVersion:objects:error:]::kSupportedFaceModelTags + v9)];
      v13 = [v7 objectForKeyedSubscript:v12];

      if (v13) {
        break;
      }
      char v10 = 0;
      uint64_t v9 = 1;
      if ((v11 & 1) == 0)
      {
        if (a5)
        {
          VNPersonsModelErrorForInvalidModelData(@"face model data is unavailable");
          v13 = 0;
          id v14 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = 0;
          id v14 = 0;
        }
        goto LABEL_13;
      }
    }
    v15 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v8 faceModel:v13];
    if (objc_msgSend(v15, "updateInternalConfigurationWithModelFaceprintRequestRevision:error:", objc_msgSend(v13, "faceprintRequestRevision"), a5))id v14 = v15; {
    else
    }
      id v14 = 0;

LABEL_13:
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

+ (BOOL)isReadOnly
{
  return 1;
}

@end