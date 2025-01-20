@interface VCPImageLivePhotoBlurAnalyzer
- (VCPImageLivePhotoBlurAnalyzer)initWithMovingObjectsResults:(id)a3;
- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6;
@end

@implementation VCPImageLivePhotoBlurAnalyzer

- (VCPImageLivePhotoBlurAnalyzer)initWithMovingObjectsResults:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VCPImageLivePhotoBlurAnalyzer;
  v6 = [(VCPImageLivePhotoBlurAnalyzer *)&v10 init];
  v7 = v6;
  if (v6)
  {
    if (v5) {
      objc_storeStrong((id *)&v6->_movingObjects, a3);
    }
    v8 = v7;
  }

  return v7;
}

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  objc_super v10 = v9;
  if (!v9 || ((*((uint64_t (**)(id))v9 + 2))(v9) & 1) == 0)
  {
    int v17 = 1065353216;
    if ([(NSArray *)self->_movingObjects count])
    {
      int v11 = [(VCPBlurAnalyzer *)self computeSharpnessScore:&v17 forObjects:self->_movingObjects inImage:a3];
      if (v11) {
        goto LABEL_9;
      }
      LODWORD(v12) = v17;
    }
    else
    {
      LODWORD(v12) = 1.0;
    }
    v21 = @"IrisSharpnessResults";
    v18 = @"quality";
    v13 = [NSNumber numberWithFloat:v12];
    v19 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v20 = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v22[0] = v15;
    *a5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];

    int v11 = 0;
    goto LABEL_9;
  }
  int v11 = -128;
LABEL_9:

  return v11;
}

- (void).cxx_destruct
{
}

@end