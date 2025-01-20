@interface VNReadOnlyEntityIdentificationModel
+ (BOOL)isReadOnly;
+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5;
- (BOOL)dropTrainedModelAndReturnError:(id *)a3;
- (VNReadOnlyEntityIdentificationModel)initWithConfiguration:(id)a3 trainedModel:(id)a4;
- (id)entityIdentificationModel:(id)a3 observationAtIndex:(unint64_t)a4 forEntityAtIndex:(unint64_t)a5;
- (id)entityIdentificationModel:(id)a3 uniqueIdentifierOfEntityAtIndex:(unint64_t)a4;
- (id)observationCountsForAllEntities;
- (id)observationCountsForEntitiesWithUniqueIdentifiers:(id)a3;
- (id)observationsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (id)trainedModelWithCanceller:(id)a3 error:(id *)a4;
- (unint64_t)entityIdentificationModel:(id)a3 indexOfEntityWithUniqueIdentifier:(id)a4;
- (unint64_t)entityIdentificationModel:(id)a3 numberOfObservationsForEntityAtIndex:(unint64_t)a4;
- (unint64_t)numberOfEntitiesInEntityIdentificationModel:(id)a3;
- (unint64_t)observationCountForEntityWithUniqueIdentifier:(id)a3;
@end

@implementation VNReadOnlyEntityIdentificationModel

- (void).cxx_destruct
{
}

- (id)entityIdentificationModel:(id)a3 observationAtIndex:(unint64_t)a4 forEntityAtIndex:(unint64_t)a5
{
  return 0;
}

- (unint64_t)entityIdentificationModel:(id)a3 numberOfObservationsForEntityAtIndex:(unint64_t)a4
{
  v5 = [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel uniqueIdentifierOfEntityAtIndex:a4];
  unint64_t v6 = [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel printCountForEntityWithUniqueIdentifier:v5];

  return v6;
}

- (unint64_t)entityIdentificationModel:(id)a3 indexOfEntityWithUniqueIdentifier:(id)a4
{
  return [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel indexOfEntityWithUniqueIdentifier:a4];
}

- (id)entityIdentificationModel:(id)a3 uniqueIdentifierOfEntityAtIndex:(unint64_t)a4
{
  return [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel uniqueIdentifierOfEntityAtIndex:a4];
}

- (unint64_t)numberOfEntitiesInEntityIdentificationModel:(id)a3
{
  return [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel entityCount];
}

- (id)observationCountsForAllEntities
{
  return [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel printCountsForAllEntities];
}

- (id)observationCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  return [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel printCountsForEntitiesWithUniqueIdentifiers:a3];
}

- (id)observationsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(@"observations are not available in a read-only model");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (unint64_t)observationCountForEntityWithUniqueIdentifier:(id)a3
{
  return [(VNEntityIdentificationModelTrainedModel *)self->_trainedModel printCountForEntityWithUniqueIdentifier:a3];
}

- (id)trainedModelWithCanceller:(id)a3 error:(id *)a4
{
  return self->_trainedModel;
}

- (BOOL)dropTrainedModelAndReturnError:(id *)a3
{
  if (a3)
  {
    VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(0);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (VNReadOnlyEntityIdentificationModel)initWithConfiguration:(id)a3 trainedModel:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VNReadOnlyEntityIdentificationModel;
  v8 = [(VNEntityIdentificationModel *)&v11 initWithConfiguration:a3 dataSource:self];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_trainedModel, a4);
  }

  return v9;
}

+ (BOOL)isReadOnly
{
  return 1;
}

+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a1 modelConfigurationForVersion:a3 modelObjects:v8 error:a5];
  if (v9)
  {
    uint64_t v10 = 0;
    char v11 = 1;
    while (1)
    {
      char v12 = v11;
      v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&newModelForVersion_modelObjects_error__kTrainedModelSupportedTags[4 * v10]];
      v14 = [v8 objectForKeyedSubscript:v13];

      if (v14) {
        break;
      }
      char v11 = 0;
      uint64_t v10 = 1;
      if ((v12 & 1) == 0)
      {
        if (a5)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, @"trained model data is not available", 0);
          v14 = 0;
          v15 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_17;
        }
        v14 = 0;
        goto LABEL_16;
      }
    }
    if (![v14 entityCount])
    {
LABEL_11:
      v15 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v9 trainedModel:v14];
      goto LABEL_17;
    }
    v16 = [v9 entityPrintOriginatingRequestSpecifier];
    v17 = [v14 entityPrintOriginatingRequestSpecifier];
    if ([v16 hasModelEquivalencyToRequestSpecifier:v17])
    {

      goto LABEL_11;
    }
    if (a5)
    {
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, @"trained model entity print originating request is not defined", 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

LABEL_16:
    v15 = 0;
LABEL_17:
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end