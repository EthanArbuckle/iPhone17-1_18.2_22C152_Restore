@interface VNImageProcessingSession
- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4;
- (VNImageProcessingSession)init;
- (id)_printsProducedByRequest:(__CVBuffer *)a3 onPixelBuffer:(void *)a4 withAugmentations:(void *)a5 error:;
- (id)detectionprintsFromRequest:(id)a3 performedOnPixelBuffer:(__CVBuffer *)a4 withAugmentations:(id)a5 error:(id *)a6;
- (id)sceneprintsFromRequest:(id)a3 performedOnPixelBuffer:(__CVBuffer *)a4 withAugmentations:(id)a5 error:(id *)a6;
@end

@implementation VNImageProcessingSession

- (void).cxx_destruct
{
}

- (BOOL)prepareForPerformingRequests:(id)a3 error:(id *)a4
{
  return [(VNSession *)self->_session prepareForPerformingRequests:a3 error:a4];
}

- (id)detectionprintsFromRequest:(id)a3 performedOnPixelBuffer:(__CVBuffer *)a4 withAugmentations:(id)a5 error:(id *)a6
{
  return -[VNImageProcessingSession _printsProducedByRequest:onPixelBuffer:withAugmentations:error:]((uint64_t)self, a3, a4, a5, a6);
}

- (id)_printsProducedByRequest:(__CVBuffer *)a3 onPixelBuffer:(void *)a4 withAugmentations:(void *)a5 error:
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  uint64_t v63 = a1;
  if (!a1)
  {
    id v40 = 0;
    goto LABEL_42;
  }
  id v9 = a4;
  id v58 = v8;
  id v10 = v8;
  if ([v10 conformsToProtocol:&unk_1EF7AB9A0])
  {
    v11 = [v10 supportedImageSizeSet];
    v12 = [v11 firstObject];

    if (v12)
    {
      [v10 VNImageProcessingSessionRegionOfInterest];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      size_t Width = CVPixelBufferGetWidth(a3);
      size_t Height = CVPixelBufferGetHeight(a3);
      v23 = [v12 pixelsWideRange];
      uint64_t v24 = [v23 idealDimension];

      v25 = [v12 pixelsHighRange];
      uint64_t v26 = [v25 idealDimension];

      uint64_t v27 = [v12 idealImageFormat];
      id v28 = v9;
      v29 = v28;
      if (!v24 || !v26)
      {
        if (a5)
        {
          +[VNError errorForInvalidArgumentWithLocalizedDescription:@"scaled dimensions cannot be 0"];
          v59 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = 0;
        }
LABEL_21:

        goto LABEL_22;
      }
      v64 = v28;
      unint64_t v30 = Width;
      context = (void *)MEMORY[0x1A6257080]();
      v68 = @"VNImageBufferOption_DoNotCacheRepresentations";
      v69[0] = MEMORY[0x1E4F1CC38];
      v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v69 forKeys:&v68 count:1];
      v31 = [[VNImageBuffer alloc] initWithCVPixelBuffer:a3 orientation:1 options:v61 session:*(void *)(v63 + 8)];
      if (v31)
      {
        uint64_t v32 = [v64 count];
        double v33 = v14 * (double)v30;
        double v34 = v18 * (double)v30;
        double v35 = v16 * (double)Height;
        double v36 = v20 * (double)Height;
        if (!v32)
        {
          v66 = 0;
          v29 = v64;
          uint64_t v55 = -[VNImageBuffer croppedBufferWithWidth:height:format:cropRect:options:error:](v31, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v26, v27, 0, &v66, v33, v35, v34, v36);
          v37 = v66;
          if (v55)
          {
            uint64_t v67 = v55;
            v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v67 count:1];
          }
          else
          {
            v59 = 0;
          }
          goto LABEL_17;
        }
        v66 = 0;
        v59 = -[VNImageBuffer augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:](v31, "augmentedCroppedBuffersWithWidth:height:format:cropRect:options:augmentationOptions:error:", v24, v26, v27, 0, v64, &v66, v33, v35, v34, v36);
        v37 = v66;
      }
      else
      {
        v37 = +[VNError errorForInternalErrorWithLocalizedDescription:@"could not create augmentation image buffer"];
        v59 = 0;
      }
      v29 = v64;
LABEL_17:

      if (a5 && v37) {
        *a5 = v37;
      }

      goto LABEL_21;
    }
  }
  if (a5)
  {
    id v38 = [NSString alloc];
    v39 = [v10 specifier];
    v12 = (void *)[v38 initWithFormat:@"%@ does not provide ideal image parameters", v39];

    +[VNError errorWithCode:19 message:v12];
    v59 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  v59 = 0;
LABEL_23:

  id v40 = v59;
  if (v59)
  {
    id v41 = v10;
    id v42 = v59;
    contexta = (void *)MEMORY[0x1A6257080]();
    v62 = v41;
    v69[0] = v41;
    v65 = v42;
    v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
    uint64_t v44 = [v42 count];
    v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v44];
    if (v44)
    {
      uint64_t v46 = 0;
      v47 = 0;
      uint64_t v48 = MEMORY[0x1E4F1CC08];
      while (1)
      {
        v49 = -[VNImageRequestHandler initWithCVPixelBuffer:options:session:]([VNImageRequestHandler alloc], "initWithCVPixelBuffer:options:session:", [v65 objectAtIndex:v46], v48, *(void *)(v63 + 8));
        v68 = v47;
        BOOL v50 = [(VNImageRequestHandler *)v49 performRequests:v43 error:&v68];
        v51 = v68;

        if (!v50)
        {

          id v40 = 0;
          goto LABEL_35;
        }
        v66 = v51;
        v52 = [v62 VNImageProcessingSessionPrintAndReturnError:&v66];
        v47 = v66;

        if (!v52) {
          break;
        }
        [v45 addObject:v52];

        if (v44 == ++v46) {
          goto LABEL_31;
        }
      }

      id v40 = 0;
    }
    else
    {
      v47 = 0;
LABEL_31:
      id v40 = v45;
    }
    v51 = v47;
LABEL_35:

    if (a5 && v51) {
      *a5 = v51;
    }

    if (v40) {
      id v53 = v40;
    }
  }
  id v8 = v58;

LABEL_42:

  return v40;
}

- (id)sceneprintsFromRequest:(id)a3 performedOnPixelBuffer:(__CVBuffer *)a4 withAugmentations:(id)a5 error:(id *)a6
{
  return -[VNImageProcessingSession _printsProducedByRequest:onPixelBuffer:withAugmentations:error:]((uint64_t)self, a3, a4, a5, a6);
}

- (VNImageProcessingSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)VNImageProcessingSession;
  v2 = [(VNImageProcessingSession *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VNSession);
    session = v2->_session;
    v2->_session = v3;
  }
  return v2;
}

@end