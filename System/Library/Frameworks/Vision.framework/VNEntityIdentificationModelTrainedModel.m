@interface VNEntityIdentificationModelTrainedModel
+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6;
- (VNEntityIdentificationModelTrainedModel)initWithCoder:(id)a3;
- (id)entityPrintOriginatingRequestSpecifier;
- (id)entityUniqueIdentifiers;
- (id)predictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6;
- (id)printCountsForAllEntities;
- (id)printCountsForEntitiesWithUniqueIdentifiers:(id)a3;
- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3;
- (unint64_t)entityCount;
- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3;
- (unint64_t)printCountForEntityWithUniqueIdentifier:(id)a3;
@end

@implementation VNEntityIdentificationModelTrainedModel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 resolvedAlgorithmAndReturnError:a6];
  v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  v14 = (void *)[v12 trainedModelClass];
  if (v14
    && +[VisionCoreRuntimeUtilities item:v14 overridesClassSelector:sel_trainedModelBuiltFromConfiguration_dataProvider_canceller_error_])
  {
    v15 = [v14 trainedModelBuiltFromConfiguration:v9 dataProvider:v10 canceller:v11 error:a6];
    goto LABEL_8;
  }
  if (a6)
  {
    VNEntityIdentificationModelErrorForUnsupportedAlgorithm(v13);
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_7:
    v15 = 0;
  }
LABEL_8:

  return v15;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

- (VNEntityIdentificationModelTrainedModel)initWithCoder:(id)a3
{
  id v5 = a3;
  v6 = +[VNError errorForUnimplementedMethod:a2 ofObject:self];
  [v5 failWithError:v6];

  return 0;
}

- (id)printCountsForAllEntities
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)printCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (unint64_t)printCountForEntityWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3);
}

- (id)entityUniqueIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)entityCount
{
  return 0;
}

- (id)predictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  if (a6)
  {
    +[VNError errorForUnimplementedMethod:ofObject:](VNError, "errorForUnimplementedMethod:ofObject:", a2, self, a5);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    *a4 = +[VNError errorForUnimplementedMethod:a2 ofObject:self];
  }
  return 0;
}

- (id)entityPrintOriginatingRequestSpecifier
{
  return 0;
}

@end