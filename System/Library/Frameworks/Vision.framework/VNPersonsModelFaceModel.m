@interface VNPersonsModelFaceModel
+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6;
- (BOOL)isCompatibleWithConfiguration:(id)a3;
- (VNPersonsModelFaceModel)initWithCoder:(id)a3;
- (id)faceCountsForAllPersons;
- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3;
- (id)personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 canceller:(id)a6 error:(id *)a7;
- (id)personUniqueIdentifiers;
- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3;
- (unint64_t)faceprintRequestRevision;
- (unint64_t)personCount;
@end

@implementation VNPersonsModelFaceModel

- (VNPersonsModelFaceModel)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNPersonsModelFaceModel;
  return [(VNPersonsModelFaceModel *)&v4 init];
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  if (a4)
  {
    VNPersonsModelErrorForUnimplementedMethod((uint64_t)self, (uint64_t)a2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (id)faceCountsForAllPersons
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  return 0;
}

- (id)personUniqueIdentifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (unint64_t)personCount
{
  return 0;
}

- (unint64_t)faceprintRequestRevision
{
  return 0;
}

- (BOOL)isCompatibleWithConfiguration:(id)a3
{
  v3 = [a3 resolvedAlgorithmAndReturnError:0];
  objc_super v4 = v3;
  v6 = v3 && (uint64_t v5 = [v3 faceModelClass]) != 0 && objc_opt_class() == v5;

  return v6;
}

- (id)personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 canceller:(id)a6 error:(id *)a7
{
  if (a7)
  {
    VNPersonsModelErrorForUnimplementedMethod((uint64_t)self, (uint64_t)a2);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 resolvedAlgorithmAndReturnError:a6];
  v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  v14 = (void *)[v12 faceModelClass];
  if (v14
    && +[VisionCoreRuntimeUtilities item:v14 overridesClassSelector:sel_modelBuiltFromConfiguration_dataProvider_canceller_error_])
  {
    v15 = [v14 modelBuiltFromConfiguration:v9 dataProvider:v10 canceller:v11 error:a6];
    goto LABEL_8;
  }
  if (a6)
  {
    VNPersonsModelErrorForUnsupportedAlgorithm(v13);
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

@end