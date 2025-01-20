@interface CRMLCCModel
- (CRMLCCModel)init;
- (id)creditcardMLResultsFromImage:(id)a3 textFeatures:(id)a4 invert:(BOOL)a5 tryPatternMatch:(BOOL)a6;
- (id)creditcardResultsFromImage:(id)a3;
- (id)creditcardResultsFromImage:(id)a3 textFeatures:(id)a4 invert:(BOOL)a5 tryPatternMatch:(BOOL)a6;
@end

@implementation CRMLCCModel

- (CRMLCCModel)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRMLCCModel;
  v2 = [(CRMLModel *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)creditcardResultsFromImage:(id)a3
{
  [(CRMLModel *)self activationsFromImage:a3];
  v4 = [(CRMLModel *)self decodeActivations:v6];
  v7 = (void **)v6;
  std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](&v7);
  return v4;
}

- (id)creditcardResultsFromImage:(id)a3 textFeatures:(id)a4 invert:(BOOL)a5 tryPatternMatch:(BOOL)a6
{
  objc_super v6 = [(CRMLCCModel *)self creditcardMLResultsFromImage:a3 textFeatures:a4 invert:a5 tryPatternMatch:a6];
  return v6;
}

- (id)creditcardMLResultsFromImage:(id)a3 textFeatures:(id)a4 invert:(BOOL)a5 tryPatternMatch:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if ([v11 shouldExpandToFullWidth]) {
    double v12 = INFINITY;
  }
  else {
    double v12 = 9.0;
  }
  id v42 = [MEMORY[0x263EFF9A0] dictionary];
  v13 = +[GeometricCutTools findCorrectedBoundingBoxOfTextFeature:inImageWithSize:](GeometricCutTools, "findCorrectedBoundingBoxOfTextFeature:inImageWithSize:", v11, (double)(unint64_t)[v10 width], (double)(unint64_t)objc_msgSend(v10, "height"));
  v14 = objc_msgSend(v10, "imageByCroppingTextFeature:correctedBoundingBox:padding:networkInputSize:", v11, v13, v12, 6.0, 18.0, 28.0);
  v15 = v14;
  if (v14)
  {
    v16 = [v14 imageByApplyingHistogramCorrection];
    [v11 setImageCut:v16];
    v17 = +[CRInsights sharedInsights];
    [v17 provideInsightValue:v11 forKey:@"CRInsightsCardImageCutBufferKey"];

    long long v50 = 0uLL;
    uint64_t v51 = 0;
    if (v7)
    {
      v18 = [v16 imageByRotating180];
      [(CRMLModel *)self activationsFromImage:v18];
      std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)&v50);
      long long v50 = v48;
      uint64_t v51 = v49;
      uint64_t v49 = 0;
      long long v48 = 0uLL;
      v52[0] = (void **)&v48;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](v52);
    }
    else
    {
      [(CRMLModel *)self activationsFromImage:v16];
      std::vector<std::vector<std::vector<float>>>::__vdeallocate((void ***)&v50);
      long long v50 = v48;
      uint64_t v51 = v49;
      uint64_t v49 = 0;
      long long v48 = 0uLL;
      v52[0] = (void **)&v48;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100](v52);
    }
    if (*((void *)&v50 + 1) != (void)v50)
    {
      BOOL v37 = v6;
      BOOL v40 = v7;
      v41 = v13;
      v38 = v16;
      if (v16) {
        [v16 vImage];
      }
      else {
        memset(v47, 0, sizeof(v47));
      }
      unint64_t v19 = [v10 width];
      unint64_t v20 = [v10 height];
      v21 = [(CRMLModel *)self codeMap];
      memset(v46, 0, sizeof(v46));
      std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v46, (uint64_t *)v50, *((uint64_t **)&v50 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v50 + 1) - v50) >> 3));
      uint64_t v22 = (int)*MEMORY[0x263F7ECE0];
      uint64_t v23 = (int)*MEMORY[0x263F7ECD8];
      v24 = +[GeometricCutTools geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:](GeometricCutTools, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:", v11, v47, v41, v21, v46, v40, v12, 6.0, (double)v19, (double)v20, (double)*(int *)((char *)&self->super.super.isa + v22), (double)*(int *)((char *)&self->super.super.isa + v23));
      v39 = (void *)[v24 mutableCopy];

      *(void *)&long long v48 = v46;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
      v13 = v41;
      v25 = [v11 subFeatures];
      uint64_t v26 = [v25 count];

      if (v26 == 10)
      {
        [v11 addKohlsDigitProjection];
        if (v38) {
          [v38 vImage];
        }
        else {
          memset(v45, 0, sizeof(v45));
        }
        unint64_t v27 = [v10 width];
        unint64_t v28 = [v10 height];
        v29 = [(CRMLModel *)self codeMap];
        memset(v44, 0, sizeof(v44));
        std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v44, (uint64_t *)v50, *((uint64_t **)&v50 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v50 + 1) - v50) >> 3));
        v30 = +[GeometricCutTools geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:](GeometricCutTools, "geometricRecognitionOf:inDerotatedRegion:withPadding:fromCorrectedBoundingBox:inImageWithSize:withCodeMap:activations:invert:networkInputSize:", v11, v45, v41, v29, v44, v40, v12, 6.0, (double)v27, (double)v28, (double)*(int *)((char *)&self->super.super.isa + v22), (double)*(int *)((char *)&self->super.super.isa + v23));
        *(void *)&long long v48 = v44;
        std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
        v31 = [v30 objectForKey:@"CardNumber"];
        v13 = v41;
        [v39 setObject:v31 forKey:@"CardNumber"];
      }
      [v42 setObject:v39 forKey:@"FastScanningGeometricKey"];
      v32 = [(CRMLModel *)self codeMap];
      uint64_t v33 = [(CRMLModel *)self classCount];
      memset(v43, 0, sizeof(v43));
      std::vector<std::vector<std::vector<float>>>::__init_with_size[abi:ne180100]<std::vector<std::vector<float>>*,std::vector<std::vector<float>>*>(v43, (uint64_t *)v50, *((uint64_t **)&v50 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v50 + 1) - v50) >> 3));
      v34 = _creditCardImage2stringCTCSegment(v11, v32, v33, v43);
      *(void *)&long long v48 = v43;
      std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
      [v42 setObject:v34 forKey:@"FastScanningCTCSegmentKey"];
      v16 = v38;
      if (v37)
      {
        v35 = +[ActivationMapTools textFromActivationMap:&v50 codeMap:[(CRMLModel *)self codeMap] invert:v40];
        if (v35) {
          [v42 setObject:v35 forKey:@"FastScanningPatternSearchKey"];
        }
      }
    }
    *(void *)&long long v48 = &v50;
    std::vector<std::vector<std::vector<float>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  }
  return v42;
}

@end