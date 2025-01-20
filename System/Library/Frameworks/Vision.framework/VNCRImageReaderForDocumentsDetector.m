@interface VNCRImageReaderForDocumentsDetector
+ (id)imageReaderRecognitionOptionsForProcessOptions:(id)a3;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
@end

@implementation VNCRImageReaderForDocumentsDetector

+ (id)imageReaderRecognitionOptionsForProcessOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNCRImageReaderForDocumentsDetector;
  v5 = objc_msgSendSuper2(&v10, sel_imageReaderRecognitionOptionsForProcessOptions_, v4);
  uint64_t v6 = *MEMORY[0x1E4FAF0B8];
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FAF0B8]];
  [v5 setObject:v7 forKeyedSubscript:v6];

  v8 = [v4 objectForKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_DetectionOnly"];
  [v5 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FAF068]];

  return v5;
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v38 = a9;
  v37 = +[VNValidationUtilities requiredObjectOfClass:objc_opt_class() forKey:@"VNCRImageReaderForDocumentsDetectorProcessOption_OriginatingRequest" inOptions:v13 error:a8];
  if (!v37)
  {
    v21 = 0;
    goto LABEL_35;
  }
  v36 = [(VNDetector *)self requiredCancellerInOptions:v13 error:a8];
  if (v36)
  {
    v35 = [(id)objc_opt_class() imageReaderRecognitionOptionsForProcessOptions:v13];
    if (!v35)
    {
      v21 = 0;
LABEL_33:

      goto LABEL_34;
    }
    v32 = [v13 objectForKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_CRImageReaderTrackingSession"];
    v33 = [(VNCRImageReaderDetector *)self cachedImageReader];
    v14 = [v13 objectForKeyedSubscript:@"VNCRImageReaderForDocumentsDetectorProcessOption_TextObservationsToRecognize"];
    v34 = v14;
    if ([v14 count])
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v14, "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v74 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v70;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v70 != v18) {
              objc_enumerationMutation(v16);
            }
            v20 = [*(id *)(*((void *)&v69 + 1) + 8 * i) getCROutputRegion];
            [v15 addObject:v20];
          }
          uint64_t v17 = [v16 countByEnumeratingWithState:&v69 objects:v74 count:16];
        }
        while (v17);
      }
    }
    else
    {
      v15 = 0;
    }
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__4984;
    v67 = __Block_byref_object_dispose__4985;
    id v68 = 0;
    uint64_t v57 = 0;
    v58 = &v57;
    uint64_t v59 = 0x3032000000;
    v60 = __Block_byref_object_copy__4984;
    v61 = __Block_byref_object_dispose__4985;
    id v62 = 0;
    uint64_t v53 = 0;
    v54 = &v53;
    uint64_t v55 = 0x2020000000;
    char v56 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
    v42[3] = &unk_1E5B1C630;
    v52 = a4;
    id v49 = v38;
    id v31 = v15;
    id v43 = v31;
    id v44 = v33;
    v50 = &v57;
    v51 = &v63;
    id v22 = v32;
    id v45 = v22;
    v46 = self;
    id v47 = v13;
    id v48 = v35;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2;
    v39[3] = &unk_1E5B1C658;
    v41 = &v53;
    id v23 = v44;
    id v40 = v23;
    char v24 = [v36 tryToPerformBlock:v42 usingSignallingBlock:v39];
    if (*((unsigned char *)v54 + 24)
      || !-[VNCRImageReaderDetector isCRImageReaderViableAfterError:](self, "isCRImageReaderViableAfterError:", v58[5], v31))
    {
      id v25 = -[VNCRImageReaderDetector newImageReaderAndReturnError:](self, "newImageReaderAndReturnError:", 0, v31);
      if (v25) {
        [(VNCRImageReaderDetector *)self setCachedImageReader:v25];
      }
    }
    if (v24)
    {
      v26 = (NSError *)v58[5];
      if (!v26 && v64[5])
      {
        v28 = [VNDocumentObservation alloc];
        v29 = [(VNDocumentObservation *)v28 initWithTopLevelRegion:v64[5] requestRevision:[(VNRequest *)v37 revision]];
        v73 = v29;
        v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];

        goto LABEL_32;
      }
      if (a8)
      {
        _vnErrorForError(v26, v37);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v21 = 0;
        *a8 = v27;
LABEL_32:

        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v57, 8);

        _Block_object_dispose(&v63, 8);
        goto LABEL_33;
      }
    }
    else if (a8)
    {
      id v27 = +[VNError errorForCancellationOfRequest:v37];
      goto LABEL_28;
    }
    v21 = 0;
    goto LABEL_32;
  }
  v21 = 0;
LABEL_34:

LABEL_35:

  return v21;
}

void __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FAF168]) initWithCVPixelBuffer:*(void *)(a1 + 104)];
  v3 = _Block_copy(*(const void **)(a1 + 80));
  if (*(void *)(a1 + 32))
  {
    size_t Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 104));
    size_t Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 104));
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v8 = *(void *)(*(void *)(a1 + 88) + 8);
    id obj = *(id *)(v8 + 40);
    v9 = [v6 recognizeDetectedBlocks:v7 inImage:v2 error:&obj withProgressHandler:v3];
    objc_storeStrong((id *)(v8 + 40), obj);
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4FAF130], "documentWithRegions:title:confidence:imageSize:", v9, 0, 2, (double)Width, (double)Height);
    uint64_t v11 = *(void *)(*(void *)(a1 + 96) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else if (*(void *)(a1 + 48))
  {
    v9 = [*(id *)(a1 + 56) validatedImageBufferFromOptions:*(void *)(a1 + 64) error:0];
    id v13 = [v9 sceneStabilityMetric];
    [v2 setSceneStabilityMetric:v13];
    uint64_t v14 = *(void *)(a1 + 72);
    v15 = *(void **)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = *(void *)(*(void *)(a1 + 88) + 8);
    id v27 = *(id *)(v17 + 40);
    uint64_t v18 = objc_msgSend(v15, "documentOutputRegionForImage:options:roi:trackingSession:error:withProgressHandler:", v2, v14, v16, &v27, v3, 0.0, 0.0, 1.0, 1.0);
    objc_storeStrong((id *)(v17 + 40), v27);
    uint64_t v19 = *(void *)(*(void *)(a1 + 96) + 8);
    v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
  else
  {
    v21 = *(void **)(a1 + 40);
    uint64_t v22 = *(void *)(a1 + 72);
    uint64_t v23 = *(void *)(*(void *)(a1 + 88) + 8);
    id v26 = *(id *)(v23 + 40);
    uint64_t v24 = objc_msgSend(v21, "documentOutputRegionForImage:options:roi:error:withProgressHandler:", v2, v22, &v26, v3, 0.0, 0.0, 1.0, 1.0);
    objc_storeStrong((id *)(v23 + 40), v26);
    uint64_t v25 = *(void *)(*(void *)(a1 + 96) + 8);
    v9 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
}

uint64_t __137__VNCRImageReaderForDocumentsDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) cancel];
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v16 = a4;
  uint64_t v17 = [(VNDetector *)self validatedImageBufferFromOptions:v16 error:a8];
  if (v17)
  {
    uint64_t v18 = [(VNCRImageReaderDetector *)self cachedImageReader];
    uint64_t v19 = [v16 objectForKeyedSubscript:@"VNCRImageReaderDetectorProcessOption_MinimumTextHeight"];
    [v19 doubleValue];
    double v21 = v20;

    unint64_t v22 = [v17 width];
    unint64_t v23 = [v17 height];
    v39.origin.double x = x * (double)v22;
    v39.size.double width = width * (double)v22;
    v39.origin.double y = y * (double)v23;
    v39.size.double height = height * (double)v23;
    CGRect v40 = CGRectIntegral(v39);
    double v24 = v40.origin.x;
    double v25 = v40.origin.y;
    double v26 = v40.size.width;
    double v27 = v40.size.height;
    objc_msgSend(v18, "smallestImageSizeForTextWithRelativeHeight:originalImageSize:", v21, v40.size.width, v40.size.height);
    double v29 = v28;
    double v31 = v30;
    double v38 = 0.0;
    +[VNValidationUtilities getDoubleValue:&v38 forKey:@"VNCRImageReaderForDocumentsDetectorProcessOption_MaximumProcessingDimensionOnTheLongSide" inOptions:v16 withDefaultValue:a8 error:0.0];
    if (v38 > 0.0)
    {
      double v32 = v29 >= v31 ? v29 : v31;
      if (v32 > v38)
      {
        double v29 = v29 * (v38 / v32);
        double v31 = v31 * (v38 / v32);
      }
    }
    unint64_t v33 = ((unint64_t)v31 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if ((((unint64_t)v29 + 1) & 0xFFFFFFFFFFFFFFFELL) >= 3 && v33 > 2)
    {
      v36 = (__CVBuffer *)objc_msgSend(v17, "croppedBufferWithWidth:height:format:cropRect:options:error:", v24, v25, v26, v27);
      *a7 = v36;
      LOBYTE(a8) = v36 != 0;
    }
    else if (a8)
    {
      v35 = objc_msgSend(NSString, "stringWithFormat:", @"The image is too small in at least one dimension %ld x %ld (each dimension has to be more than 2 pixels)", ((unint64_t)v29 + 1) & 0xFFFFFFFFFFFFFFFELL, v33);
      *a8 = +[VNError errorForInvalidImageFailureWithLocalizedDescription:v35];

      LOBYTE(a8) = 0;
    }
  }
  else
  {
    LOBYTE(a8) = 0;
  }

  return (char)a8;
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VNCRImageReaderForDocumentsDetector;
  if ([(VNDetector *)&v13 warmUpSession:a3 withOptions:v8 error:a5])
  {
    v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FAF0B8]];
    uint64_t v10 = [v9 integerValue];

    char v11 = [MEMORY[0x1E4FAF150] preheatModelsForOptions:v8 revision:v10 error:a5];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

@end