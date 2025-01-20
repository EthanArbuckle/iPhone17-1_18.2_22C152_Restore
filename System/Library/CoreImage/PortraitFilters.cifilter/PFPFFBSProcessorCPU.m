@interface PFPFFBSProcessorCPU
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
@end

@implementation PFPFFBSProcessorCPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"fullROI"), "CGRectValue");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  int v16 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumVertices"), "intValue");
  unsigned int v17 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaS"), "intValue");
  id v18 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRLuma"), "intValue");
  id v19 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputSigmaRChroma"), "intValue");
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputLambda"), "floatValue");
  float v21 = v20;
  id v22 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"inputMaxNumIterations"), "intValue");
  if (v16 <= 1000) {
    sub_4BA44();
  }
  if (!v17) {
    sub_4BA70();
  }
  if (!v18) {
    sub_4BA9C();
  }
  if (!v19) {
    sub_4BAC8();
  }
  if (v21 == 0.0) {
    sub_4BAF4();
  }
  id v23 = v22;
  if (!v22) {
    sub_4BB20();
  }
  unsigned int v82 = v17;
  unint64_t v24 = (unint64_t)v13;
  id v25 = [a3 objectAtIndexedSubscript:0];
  id v26 = [a3 objectAtIndexedSubscript:1];
  id v27 = [a3 objectAtIndexedSubscript:2];
  CVPixelBufferRef v83 = sub_9BB4(v26, v9, v11, v13, v15);
  CVPixelBufferRef v85 = sub_9BB4(v27, v9, v11, v13, v15);
  unsigned int v28 = [a5 format];
  CIFormat v29 = kCIFormatRf;
  if (v28 == kCIFormatRf) {
    id v30 = [a5 bytesPerRow];
  }
  else {
    id v30 = (id)(4 * v24);
  }
  pixelBuffer = sub_9DB8((unint64_t)v13, (unint64_t)v15, (size_t)v30, 0);
  uint64_t v31 = v16;
  v32 = [[PFBilateralGridHash alloc] initWithWidth:(unint64_t)v13 height:(unint64_t)v15 maxHashTableSize:v16];
  id v33 = [v25 surface];
  [v25 region];
  if (-[PFBilateralGridHash createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:](v32, "createWithSurface:region:cropRect:sigma_s:sigma_r_luma:sigma_r_chroma:", v33, v82, v18, v19))
  {
    NSLog(@"Returning disparity image; unable to create 3D bilateral grid hash. Please file a radar.");
  }
  v34 = [[PFBilateralSolverCPU alloc] initWithWidth:(unint64_t)v13 height:(unint64_t)v15 maxVertices:v31];
  id v35 = [v25 surface];
  v37 = pixelBuffer;
  v36 = v85;
  v38 = v83;
  *(float *)&double v39 = v21;
  [(PFBilateralSolverCPU *)v34 doSolveWithBilateralGridhash:v32 reference:v35 disparity:v85 confidence:v83 output:pixelBuffer lambda:v23 maxIterations:v39];

  unsigned int v40 = [a5 format];
  if (v40 == kCIFormatRh)
  {
    if (CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL)) {
      goto LABEL_46;
    }
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    unint64_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    v43 = (char *)[a5 baseAddress];
    [a5 region];
    double v45 = v44;
    [a5 region];
    if (v45 >= v9)
    {
      int v48 = 0;
      int v47 = (int)(v46 * 4.0 + 0.0);
    }
    else
    {
      int v47 = 0;
      int v48 = (int)((v9 - v46) * 4.0 + 0.0);
    }
    [a5 region];
    double v55 = v54;
    [a5 region];
    if (v55 >= v11) {
      int v47 = (int)((double)v47 + v56 * (double)BytesPerRow);
    }
    else {
      int v48 = (int)((double)v48 + (v11 - v56) * (double)(unint64_t)[a5 bytesPerRow]);
    }
    [a5 region];
    double v58 = (double)v24;
    if (v57 < (double)v24) {
      double v58 = v57;
    }
    vImagePixelCount v59 = (unint64_t)v58;
    [a5 region];
    if (v60 >= v15) {
      double v61 = v15;
    }
    else {
      double v61 = v60;
    }
    src.data = &BaseAddress[v47];
    src.height = (unint64_t)v61;
    src.width = v59;
    src.rowBytes = BytesPerRow;
    dest.data = &v43[v48];
    dest.height = (unint64_t)v61;
    dest.width = v59;
    dest.rowBytes = (size_t)[a5 bytesPerRow];
    vImageConvert_PlanarFtoPlanar16F(&src, &dest, 0);
    v37 = pixelBuffer;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    goto LABEL_45;
  }
  if ([a5 format] == v29 && !CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL))
  {
    v49 = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
    id v50 = (id)CVPixelBufferGetBytesPerRow(pixelBuffer);
    if (v50 == [a5 bytesPerRow])
    {
      id v51 = [a5 baseAddress];
      size_t v52 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      size_t Height = CVPixelBufferGetHeight(pixelBuffer);
      memcpy(v51, v49, Height * v52);
    }
    else
    {
      size_t v62 = CVPixelBufferGetBytesPerRow(pixelBuffer);
      [a5 region];
      if (v63 < v13) {
        double v13 = v63;
      }
      [a5 region];
      if (v64 >= v15) {
        double v65 = v15;
      }
      else {
        double v65 = v64;
      }
      unint64_t v66 = (unint64_t)v65;
      v67 = (char *)[a5 baseAddress];
      [a5 region];
      double v69 = v68;
      [a5 region];
      if (v69 >= v9)
      {
        int v72 = 0;
        int v71 = (int)(v70 * 4.0 + 0.0);
      }
      else
      {
        int v71 = 0;
        int v72 = (int)((v9 - v70) * 4.0 + 0.0);
      }
      [a5 region];
      double v74 = v73;
      [a5 region];
      if (v74 >= v11) {
        int v71 = (int)((double)v71 + v75 * (double)v62);
      }
      else {
        int v72 = (int)((double)v72 + (v11 - v75) * (double)(unint64_t)[a5 bytesPerRow]);
      }
      if (v66)
      {
        unint64_t v76 = 0;
        size_t v77 = vcvtd_n_u64_f64(v13, 2uLL);
        v78 = &v67[v72];
        unsigned int v79 = 1;
        v80 = &v49[v71];
        do
        {
          memcpy(&v78[(void)[a5 bytesPerRow] * v76], &v80[v76 * v62], v77);
          unint64_t v76 = v79++;
        }
        while (v76 < v66);
      }
    }
    v37 = pixelBuffer;
    CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    v38 = v83;
LABEL_45:
    v36 = v85;
  }
LABEL_46:
  if (v37) {
    CVPixelBufferRelease(v37);
  }
  if (v38) {
    CVPixelBufferRelease(v38);
  }
  if (v36) {
    CVPixelBufferRelease(v36);
  }
  return 1;
}

@end