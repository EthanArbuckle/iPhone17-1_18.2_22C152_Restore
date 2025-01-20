@interface VNImageBasedRequest
+ (Class)configurationClass;
- (BOOL)getOptionalValidatedInputDetectedObjectObservations:(id *)a3 forObservationClass:(Class)a4 relationWithRegionOfInterest:(unint64_t)a5 error:(id *)a6;
- (BOOL)getOptionalValidatedInputFaceObservations:(id *)a3 clippedToRegionOfInterest:(BOOL)a4 error:(id *)a5;
- (BOOL)isFullCoverageRegionOfInterest;
- (BOOL)validateConfigurationAndReturnError:(id *)a3;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (CGRect)regionOfInterest;
- (CGRect)regionOfInterestNonIntegralPixelRectForWidth:(unint64_t)a3 height:(unint64_t)a4;
- (CGRect)regionOfInterestPixelRectForWidth:(unint64_t)a3 height:(unint64_t)a4;
- (NSArray)inputDetectedObjectObservations;
- (NSArray)inputFaceObservations;
- (NSArray)supportedImageSizeSet;
- (NSString)description;
- (id)VNCoreMLTransformerDetectionprintAndReturnError:(id *)a3;
- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3;
- (id)_detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations:(id)a3 relationWithRegionOfInterest:(unint64_t)a4;
- (id)_faceObservationsForRegionOfInterestContainingFaceObservations:(id)a3;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setInputDetectedObjectObservations:(id)a3;
- (void)setInputFaceObservations:(id)a3;
- (void)setRegionOfInterest:(CGRect)regionOfInterest;
@end

@implementation VNImageBasedRequest

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (NSArray)inputFaceObservations
{
  v2 = [(VNRequest *)self configuration];
  v3 = [v2 inputFaceObservations];

  return (NSArray *)v3;
}

- (BOOL)getOptionalValidatedInputFaceObservations:(id *)a3 clippedToRegionOfInterest:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v9 = [(VNImageBasedRequest *)self inputFaceObservations];
  if (v9)
  {
    if (!+[VNValidationUtilities validateOptionalFaceObservations:v9 forRequest:self error:a5])
    {
      BOOL v11 = 0;
      goto LABEL_11;
    }
    if (v6)
    {
      uint64_t v10 = [(VNImageBasedRequest *)self _faceObservationsForRegionOfInterestContainingFaceObservations:v9];

      id v9 = (id)v10;
    }
    if (a3)
    {
      id v9 = v9;
LABEL_8:
      *a3 = v9;
    }
  }
  else if (a3)
  {
    goto LABEL_8;
  }
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (CGRect)regionOfInterest
{
  v2 = [(VNRequest *)self configuration];
  [v2 regionOfInterest];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)getOptionalValidatedInputDetectedObjectObservations:(id *)a3 forObservationClass:(Class)a4 relationWithRegionOfInterest:(unint64_t)a5 error:(id *)a6
{
  id v11 = [(VNImageBasedRequest *)self inputDetectedObjectObservations];
  if (v11)
  {
    if (!+[VNValidationUtilities validateOptionalDetectedObjectObservations:v11 forObservationClass:a4 forRequest:self error:a6])
    {
      BOOL v13 = 0;
      goto LABEL_10;
    }
    double v12 = [(VNImageBasedRequest *)self _detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations:v11 relationWithRegionOfInterest:a5];

    if (!a3)
    {
      BOOL v13 = 1;
      id v11 = v12;
      goto LABEL_10;
    }
    id v11 = v12;
    goto LABEL_6;
  }
  if (a3) {
LABEL_6:
  }
    *a3 = v11;
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (id)_detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations:(id)a3 relationWithRegionOfInterest:(unint64_t)a4
{
  id v6 = a3;
  if ([(VNImageBasedRequest *)self isFullCoverageRegionOfInterest])
  {
    id v7 = v6;
  }
  else
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __135__VNImageBasedRequest__detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations_relationWithRegionOfInterest___block_invoke;
    v14[3] = &__block_descriptor_72_e44_B32__0__VNDetectedObjectObservation_8Q16_B24l;
    v14[4] = a4;
    v14[5] = v8;
    v14[6] = v9;
    v14[7] = v10;
    v14[8] = v11;
    double v12 = [v6 indexesOfObjectsPassingTest:v14];
    id v7 = [v6 objectsAtIndexes:v12];
  }

  return v7;
}

BOOL __135__VNImageBasedRequest__detectedObjectObservationsForRegionOfInterestContainingDetectedObjectObservations_relationWithRegionOfInterest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 boundingBox];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  if (v12 == 1)
  {
    BOOL v13 = CGRectIntersectsRect(*(CGRect *)(a1 + 40), *(CGRect *)&v5);
  }
  else
  {
    if (v12)
    {
      BOOL v14 = 0;
      goto LABEL_7;
    }
    BOOL v13 = CGRectContainsRect(*(CGRect *)(a1 + 40), *(CGRect *)&v5);
  }
  BOOL v14 = v13;
LABEL_7:

  return v14;
}

- (void)setInputDetectedObjectObservations:(id)a3
{
  id v4 = a3;
  id v6 = (id)[v4 copy];

  uint64_t v5 = [(VNRequest *)self configuration];
  [v5 setInputDetectedObjectObservations:v6];
}

- (NSArray)inputDetectedObjectObservations
{
  v2 = [(VNRequest *)self configuration];
  id v3 = [v2 inputDetectedObjectObservations];

  return (NSArray *)v3;
}

- (id)_faceObservationsForRegionOfInterestContainingFaceObservations:(id)a3
{
  id v4 = a3;
  if ([(VNImageBasedRequest *)self isFullCoverageRegionOfInterest])
  {
    id v5 = v4;
  }
  else
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __86__VNImageBasedRequest__faceObservationsForRegionOfInterestContainingFaceObservations___block_invoke;
    v12[3] = &__block_descriptor_64_e34_B32__0__VNFaceObservation_8Q16_B24l;
    v12[4] = v6;
    v12[5] = v7;
    v12[6] = v8;
    v12[7] = v9;
    uint64_t v10 = [v4 indexesOfObjectsPassingTest:v12];
    id v5 = [v4 objectsAtIndexes:v10];
  }

  return v5;
}

BOOL __86__VNImageBasedRequest__faceObservationsForRegionOfInterestContainingFaceObservations___block_invoke(CGRect *a1, void *a2)
{
  id v3 = a2;
  [v3 boundingBox];
  v10.origin.x = v4;
  v10.origin.y = v5;
  v10.size.width = v6;
  v10.size.height = v7;
  BOOL v8 = CGRectContainsRect(a1[1], v10);

  return v8;
}

- (void)setInputFaceObservations:(id)a3
{
  id v4 = a3;
  id v6 = (id)[v4 copy];

  CGFloat v5 = [(VNRequest *)self configuration];
  [v5 setInputFaceObservations:v6];
}

- (NSArray)supportedImageSizeSet
{
  id v6 = 0;
  v2 = [(VNRequest *)self applicableDetectorClassAndOptions:&v6 forRevision:[(VNRequest *)self resolvedRevision] error:0];
  id v3 = v6;
  if (!v2
    || ([(objc_class *)v2 supportedImageSizeSetForOptions:v3 error:0],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v4;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v19.receiver = self;
  v19.super_class = (Class)VNImageBasedRequest;
  id v4 = [(VNRequest *)&v19 description];
  [(VNImageBasedRequest *)self regionOfInterest];
  uint64_t v9 = [NSString stringWithFormat:@"[%g, %g, %g, %g]", v5, v6, v7, v8];
  [v3 appendFormat:@"%@ ROI=%@", v4, v9];

  CGRect v10 = [(VNImageBasedRequest *)self inputFaceObservations];
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 valueForKey:@"uuid"];
    BOOL v13 = [v12 componentsJoinedByString:@", "];
    [v3 appendFormat:@" inputFaceObservations=[%@]", v13];
  }
  BOOL v14 = [(VNImageBasedRequest *)self inputDetectedObjectObservations];
  v15 = v14;
  if (v14)
  {
    v16 = [v14 valueForKey:@"uuid"];
    v17 = [v16 componentsJoinedByString:@", "];
    [v3 appendFormat:@" inputDetectedObjectObservations=[%@]", v17];
  }

  return (NSString *)v3;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNImageBasedRequest *)a3;
  if (self != v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)VNImageBasedRequest;
    [(VNRequest *)&v7 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(VNImageBasedRequest *)v4 regionOfInterest];
      -[VNImageBasedRequest setRegionOfInterest:](self, "setRegionOfInterest:");
      uint64_t v5 = [(VNImageBasedRequest *)v4 inputFaceObservations];
      [(VNImageBasedRequest *)self setInputFaceObservations:v5];

      uint64_t v6 = [(VNImageBasedRequest *)v4 inputDetectedObjectObservations];
      [(VNImageBasedRequest *)self setInputDetectedObjectObservations:v6];
    }
  }
}

- (CGRect)regionOfInterestPixelRectForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  [(VNImageBasedRequest *)self regionOfInterest];
  double v7 = v6 * (double)a3;
  double v9 = v8 * (double)a3;
  double v11 = v10 * (double)a4;
  double v13 = v12 * (double)a4;

  return CGRectIntegral(*(CGRect *)&v7);
}

- (CGRect)regionOfInterestNonIntegralPixelRectForWidth:(unint64_t)a3 height:(unint64_t)a4
{
  [(VNImageBasedRequest *)self regionOfInterest];
  double v7 = v6 * (double)a3;
  double v9 = v8 * (double)a3;
  double v11 = v10 * (double)a4;
  double v13 = v12 * (double)a4;
  result.size.height = v13;
  result.size.width = v9;
  result.origin.y = v11;
  result.origin.x = v7;
  return result;
}

- (BOOL)isFullCoverageRegionOfInterest
{
  [(VNImageBasedRequest *)self regionOfInterest];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  double v8 = 1.0;
  double v9 = 1.0;

  return CGRectEqualToRect(*(CGRect *)&v2, *(CGRect *)&v6);
}

- (BOOL)validateConfigurationAndReturnError:(id *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)VNImageBasedRequest;
  BOOL v5 = -[VNRequest validateConfigurationAndReturnError:](&v16, sel_validateConfigurationAndReturnError_);
  if (v5)
  {
    [(VNImageBasedRequest *)self regionOfInterest];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v17.origin.x = 0.0;
    v17.origin.y = 0.0;
    v17.size.width = 1.0;
    v17.size.height = 1.0;
    v18.origin.x = v7;
    v18.origin.y = v9;
    v18.size.width = v11;
    v18.size.height = v13;
    LOBYTE(v5) = CGRectContainsRect(v17, v18);
    if (a3)
    {
      if (!v5)
      {
        BOOL v14 = [NSString stringWithFormat:@"The region of interest [%g, %g, %g, %g] is not within the normalized bounds of [0 0 1 1]", *(void *)&v7, *(void *)&v9, *(void *)&v11, *(void *)&v13];
        *a3 = +[VNError errorWithCode:14 message:v14];

        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (void)setRegionOfInterest:(CGRect)regionOfInterest
{
  CGRect v10 = CGRectStandardize(regionOfInterest);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  id v8 = [(VNRequest *)self configuration];
  objc_msgSend(v8, "setRegionOfInterest:", x, y, width, height);
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(VNImageBasedRequest *)self regionOfInterest];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 regionOfInterest];
  v55.origin.double x = v13;
  v55.origin.double y = v14;
  v55.size.double width = v15;
  v55.size.double height = v16;
  v54.origin.double x = v6;
  v54.origin.double y = v8;
  v54.size.double width = v10;
  v54.size.double height = v12;
  if (!CGRectEqualToRect(v54, v55)) {
    goto LABEL_12;
  }
  CGRect v17 = [(VNImageBasedRequest *)self inputFaceObservations];
  CGRect v18 = [v4 inputFaceObservations];
  char IsSubsetOfFaceObservationsCollection = VNFaceObservationsCollectionIsSubsetOfFaceObservationsCollection(v17, v18);

  if ((IsSubsetOfFaceObservationsCollection & 1) == 0) {
    goto LABEL_12;
  }
  v20 = [(VNImageBasedRequest *)self inputDetectedObjectObservations];
  v21 = [v4 inputDetectedObjectObservations];
  id v22 = v20;
  id v23 = v21;
  v40 = v22;
  v41 = v23;
  if (v22 == v23)
  {
  }
  else
  {
    if (!v22 || !v23 || (unint64_t v24 = [v22 count], v24 > objc_msgSend(v41, "count")))
    {

LABEL_8:
      goto LABEL_12;
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v29 = v41;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v48 != v31) {
            objc_enumerationMutation(v29);
          }
          v33 = [*(id *)(*((void *)&v47 + 1) + 8 * i) uuid];
          [v28 addObject:v33];
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v30);
    }

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v34 = v40;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v44;
      while (2)
      {
        for (uint64_t j = 0; j != v35; ++j)
        {
          if (*(void *)v44 != v36) {
            objc_enumerationMutation(v34);
          }
          v38 = [*(id *)(*((void *)&v43 + 1) + 8 * j) uuid];
          char v39 = [v28 containsObject:v38];

          if ((v39 & 1) == 0)
          {

            goto LABEL_8;
          }
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v35) {
          continue;
        }
        break;
      }
    }
  }
  unint64_t v25 = [(VNRequest *)self maximumProcessingDimensionOnTheLongSide];
  if (v25 != [v4 maximumProcessingDimensionOnTheLongSide])
  {
LABEL_12:
    BOOL v26 = 0;
    goto LABEL_13;
  }
  v42.receiver = self;
  v42.super_class = (Class)VNImageBasedRequest;
  BOOL v26 = [(VNRequest *)&v42 willAcceptCachedResultsFromRequestWithConfiguration:v4];
LABEL_13:

  return v26;
}

- (id)VNCoreMLTransformerDetectionprintAndReturnError:(id *)a3
{
  double v5 = [(VNRequest *)self results];
  if ([v5 count])
  {
    CGFloat v6 = [v5 firstObject];
    double v7 = [v6 VNCoreMLTransformerDetectionprintAndReturnError:a3];
LABEL_5:

    goto LABEL_6;
  }
  if (a3)
  {
    id v8 = [NSString alloc];
    double v9 = [(VNRequest *)self specifier];
    CGFloat v6 = (void *)[v8 initWithFormat:@"%@ did not produce any results", v9];

    +[VNError errorForDataUnavailableWithLocalizedDescription:v6];
    double v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  double v7 = 0;
LABEL_6:

  return v7;
}

- (id)VNCoreMLTransformerSceneprintsAndReturnError:(id *)a3
{
  double v5 = [(VNRequest *)self results];
  if ([v5 count])
  {
    CGFloat v6 = [v5 firstObject];
    double v7 = [v6 VNCoreMLTransformerSceneprintsAndReturnError:a3];
LABEL_5:

    goto LABEL_6;
  }
  if (a3)
  {
    id v8 = [NSString alloc];
    double v9 = [(VNRequest *)self specifier];
    CGFloat v6 = (void *)[v8 initWithFormat:@"%@ did not produce any results", v9];

    +[VNError errorForDataUnavailableWithLocalizedDescription:v6];
    double v7 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  double v7 = 0;
LABEL_6:

  return v7;
}

@end