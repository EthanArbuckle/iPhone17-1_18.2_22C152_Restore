@interface VCPImagePetsAnalyzer
- (VCPImagePetsAnalyzer)initWithMaxNumRegions:(int)a3;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
- (int)convertResultsToDict:(id)a3 results:(id)a4;
@end

@implementation VCPImagePetsAnalyzer

- (VCPImagePetsAnalyzer)initWithMaxNumRegions:(int)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VCPImagePetsAnalyzer;
  v4 = [(VCPImagePetsAnalyzer *)&v11 init];
  v5 = v4;
  if (v4)
  {
    if (a3 >= 5) {
      int v6 = 5;
    }
    else {
      int v6 = a3;
    }
    if (v6 <= 1) {
      int v6 = 1;
    }
    v4->_maxNumRegions = v6;
    uint64_t v7 = +[VCPCNNPetsDetectorV2 detector:5 forceCPU:0 sharedModel:0 revision:1];
    petsDetector = v5->_petsDetector;
    v5->_petsDetector = (VCPCNNPetsDetectorV2 *)v7;

    v9 = v5;
  }

  return v5;
}

- (int)convertResultsToDict:(id)a3 results:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v27 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v28)
  {
    int v23 = 0;
    uint64_t v25 = *(void *)v31;
LABEL_3:
    uint64_t v6 = 0;
    int v7 = v23;
    v23 += v28;
    while (1)
    {
      if (*(void *)v31 != v25) {
        objc_enumerationMutation(obj);
      }
      if (v7 + (int)v6 >= self->_maxNumRegions) {
        break;
      }
      v8 = *(void **)(*((void *)&v30 + 1) + 8 * v6);
      v9 = [v8 objectForKeyedSubscript:@"petsBounds"];
      NSRect v40 = NSRectFromString(v9);
      v29.a = 1.0;
      v29.b = 0.0;
      v29.c = 0.0;
      *(_OWORD *)&v29.d = xmmword_1BC280F00;
      v29.tdouble y = 1.0;
      CGRect v41 = CGRectApplyAffineTransform(v40, &v29);
      v36 = @"attributes";
      v34[0] = @"petsBounds";
      if (v41.origin.x < 1.0) {
        double x = v41.origin.x;
      }
      else {
        double x = 1.0;
      }
      if (v41.origin.x <= 0.0) {
        double x = 0.0;
      }
      if (v41.origin.y < 1.0) {
        double y = v41.origin.y;
      }
      else {
        double y = 1.0;
      }
      if (v41.origin.y <= 0.0) {
        double y = 0.0;
      }
      double width = 1.0 - v41.origin.x;
      if (v41.size.width < width) {
        double width = v41.size.width;
      }
      if (v41.size.width <= 0.0) {
        double v13 = 0.0;
      }
      else {
        double v13 = width;
      }
      double height = 1.0 - v41.origin.y;
      if (v41.size.height < 1.0 - v41.origin.y) {
        double height = v41.size.height;
      }
      if (v41.size.height <= 0.0) {
        double v15 = 0.0;
      }
      else {
        double v15 = height;
      }
      double v16 = x;
      double v17 = y;
      v18 = NSStringFromRect(*(NSRect *)(&v13 - 2));
      v34[1] = @"petsConfidence";
      v35[0] = v18;
      v19 = [v8 objectForKeyedSubscript:@"petsConfidence"];
      v35[1] = v19;
      v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      v37 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      [v27 addObject:v21];

      if (v28 == ++v6)
      {
        uint64_t v28 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v28) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return 0;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  id v9 = a6;
  *a5 = 0;
  int Width = CVPixelBufferGetWidth(a3);
  int Height = CVPixelBufferGetHeight(a3);
  if (Width <= Height) {
    int v12 = Height;
  }
  else {
    int v12 = Width;
  }
  if (Height >= Width) {
    int v13 = Width;
  }
  else {
    int v13 = Height;
  }
  v14 = [MEMORY[0x1E4F1CA48] array];
  double v15 = [MEMORY[0x1E4F1CA48] array];
  if ((float)((float)v12 / (float)v13) > 2.0)
  {
LABEL_14:
    int v16 = 0;
    goto LABEL_15;
  }
  int v16 = [(VCPCNNPetsDetectorV2 *)self->_petsDetector petsDetection:a3 petsRegions:v14 petsFaceRegions:v15 cancel:v9];
  if (!v16)
  {
    double v17 = [MEMORY[0x1E4F1CA48] array];
    v18 = [MEMORY[0x1E4F1CA48] array];
    [(VCPImagePetsAnalyzer *)self convertResultsToDict:v14 results:v17];
    [(VCPImagePetsAnalyzer *)self convertResultsToDict:v15 results:v18];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v17 count]) {
      [v19 setValue:v17 forKey:@"PetsResults"];
    }
    if ([v18 count]) {
      [v19 setValue:v18 forKey:@"PetsFaceResults"];
    }
    id v20 = v19;
    *a5 = v20;

    goto LABEL_14;
  }
LABEL_15:

  return v16;
}

- (void).cxx_destruct
{
}

@end