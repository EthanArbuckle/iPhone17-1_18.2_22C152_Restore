@interface VNFeaturePrintObservation
+ (BOOL)supportsSecureCoding;
- (BOOL)computeDistance:(float *)outDistance toFeaturePrintObservation:(VNFeaturePrintObservation *)featurePrint error:(NSError *)error;
- (NSData)data;
- (NSUInteger)elementCount;
- (VNElementType)elementType;
- (float)computeDistanceToFeaturePrintObservation:(id)a3 error:(id *)a4;
@end

@implementation VNFeaturePrintObservation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)computeDistanceToFeaturePrintObservation:(id)a3 error:(id *)a4
{
  float v5 = NAN;
  [(VNFeaturePrintObservation *)self computeDistance:&v5 toFeaturePrintObservation:a3 error:a4];
  return v5;
}

- (BOOL)computeDistance:(float *)outDistance toFeaturePrintObservation:(VNFeaturePrintObservation *)featurePrint error:(NSError *)error
{
  v8 = featurePrint;
  float __C = NAN;
  unint64_t v9 = [(VNObservation *)self requestRevision];
  if (v9 == [(VNObservation *)v8 requestRevision])
  {
    v10 = [(VNFeaturePrintObservation *)self data];
    uint64_t v11 = [v10 length];
    vDSP_Length v12 = [(VNFeaturePrintObservation *)self elementCount];
    v13 = [(VNFeaturePrintObservation *)v8 data];
    uint64_t v14 = [v13 length];
    VNElementType v15 = [(VNFeaturePrintObservation *)self elementType];
    if (v15 == [(VNFeaturePrintObservation *)v8 elementType]
      && [(VNFeaturePrintObservation *)self elementType] == VNElementTypeFloat
      && v12 == [(VNFeaturePrintObservation *)v8 elementCount]
      && v11 == v14)
    {
      v16 = (const float *)[v10 bytes];
      v17 = (const float *)[v13 bytes];
      if (v16 && v17)
      {
        vDSP_distancesq(v16, 1, v17, 1, &__C, v12);
        float v18 = sqrtf(__C);
        float __C = v18;
        if (outDistance) {
          *outDistance = v18;
        }
        BOOL v19 = 1;
        goto LABEL_20;
      }
      if (error)
      {
        v20 = +[VNError errorForUnknownErrorWithLocalizedDescription:@"One or more of the feature prints are empty"];
        goto LABEL_15;
      }
    }
    else if (error)
    {
      v20 = +[VNError errorWithCode:12 message:@"The observations do not have a feature print that match each others format"];
LABEL_15:
      BOOL v19 = 0;
      *error = (NSError *)v20;
LABEL_20:

      goto LABEL_21;
    }
    BOOL v19 = 0;
    goto LABEL_20;
  }
  if (error)
  {
    +[VNError errorWithCode:12 message:@"The revision of the observations do not match"];
    BOOL v19 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_21:

  return v19;
}

- (NSData)data
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:0 length:0];

  return (NSData *)v2;
}

- (NSUInteger)elementCount
{
  return 0;
}

- (VNElementType)elementType
{
  return 0;
}

@end