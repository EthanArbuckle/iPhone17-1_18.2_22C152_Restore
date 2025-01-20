@interface UIImage(ClipUIServicesExtras)
+ (id)cps_imageNamed:()ClipUIServicesExtras;
- (id)cps_averageColorImage;
- (id)cps_imageWithNormalizedOrientation;
- (id)cps_resizedImageWithSize:()ClipUIServicesExtras;
- (void)cps_averageColorImage;
@end

@implementation UIImage(ClipUIServicesExtras)

+ (id)cps_imageNamed:()ClipUIServicesExtras
{
  v3 = (void *)MEMORY[0x1E4F42A80];
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = objc_msgSend(v4, "cps_clipUIServicesBundle");
  v7 = [v3 imageNamed:v5 inBundle:v6 withConfiguration:0];

  return v7;
}

- (id)cps_resizedImageWithSize:()ClipUIServicesExtras
{
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", a2, a3);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__UIImage_ClipUIServicesExtras__cps_resizedImageWithSize___block_invoke;
  v10[3] = &unk_1E6AE94F0;
  v10[4] = a1;
  *(double *)&v10[5] = a2;
  *(double *)&v10[6] = a3;
  v7 = [v6 imageWithActions:v10];
  v8 = objc_msgSend(v7, "imageWithRenderingMode:", objc_msgSend(a1, "renderingMode"));

  return v8;
}

- (id)cps_averageColorImage
{
  v47[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v2 = (void *)getCIImageClass_softClass;
    uint64_t v44 = getCIImageClass_softClass;
    if (!getCIImageClass_softClass)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __getCIImageClass_block_invoke;
      v39 = &unk_1E6AE9048;
      v40 = &v41;
      __getCIImageClass_block_invoke((uint64_t)&v36);
      v2 = (void *)v42[3];
    }
    id v3 = v2;
    _Block_object_dispose(&v41, 8);
    v4 = objc_msgSend(v3, "imageWithCGImage:", objc_msgSend(a1, "CGImage"));
    [v4 extent];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v13 = (void *)getCIVectorClass_softClass;
    uint64_t v44 = getCIVectorClass_softClass;
    if (!getCIVectorClass_softClass)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __getCIVectorClass_block_invoke;
      v39 = &unk_1E6AE9048;
      v40 = &v41;
      __getCIVectorClass_block_invoke((uint64_t)&v36);
      v13 = (void *)v42[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v41, 8);
    v49.origin.x = v6;
    v49.origin.y = v8;
    v49.size.width = v10;
    v49.size.height = v12;
    double MinX = CGRectGetMinX(v49);
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.width = v10;
    v50.size.height = v12;
    double MinY = CGRectGetMinY(v50);
    v51.origin.x = v6;
    v51.origin.y = v8;
    v51.size.width = v10;
    v51.size.height = v12;
    double Width = CGRectGetWidth(v51);
    v52.origin.x = v6;
    v52.origin.y = v8;
    v52.size.width = v10;
    v52.size.height = v12;
    v18 = [v14 vectorWithX:MinX Y:MinY Z:Width W:CGRectGetHeight(v52)];
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2050000000;
    v19 = (void *)getCIFilterClass_softClass;
    uint64_t v44 = getCIFilterClass_softClass;
    if (!getCIFilterClass_softClass)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __getCIFilterClass_block_invoke;
      v39 = &unk_1E6AE9048;
      v40 = &v41;
      __getCIFilterClass_block_invoke((uint64_t)&v36);
      v19 = (void *)v42[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v41, 8);
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v21 = (id *)getkCIInputImageKeySymbolLoc_ptr;
    uint64_t v44 = getkCIInputImageKeySymbolLoc_ptr;
    if (!getkCIInputImageKeySymbolLoc_ptr)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __getkCIInputImageKeySymbolLoc_block_invoke;
      v39 = &unk_1E6AE9048;
      v40 = &v41;
      v22 = (void *)CoreImageLibrary();
      v23 = dlsym(v22, "kCIInputImageKey");
      *(void *)(v40[1] + 24) = v23;
      getkCIInputImageKeySymbolLoc_ptr = *(void *)(v40[1] + 24);
      v21 = (id *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (!v21) {
      -[UIImage(ClipUIServicesExtras) cps_averageColorImage]();
    }
    id v24 = *v21;
    id v45 = v24;
    v47[0] = v4;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    v25 = (id *)getkCIInputExtentKeySymbolLoc_ptr;
    uint64_t v44 = getkCIInputExtentKeySymbolLoc_ptr;
    if (!getkCIInputExtentKeySymbolLoc_ptr)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = __getkCIInputExtentKeySymbolLoc_block_invoke;
      v39 = &unk_1E6AE9048;
      v40 = &v41;
      v26 = (void *)CoreImageLibrary();
      v27 = dlsym(v26, "kCIInputExtentKey");
      *(void *)(v40[1] + 24) = v27;
      getkCIInputExtentKeySymbolLoc_ptr = *(void *)(v40[1] + 24);
      v25 = (id *)v42[3];
    }
    _Block_object_dispose(&v41, 8);
    if (!v25) {
      -[UIImage(ClipUIServicesExtras) cps_averageColorImage]();
    }
    id v46 = *v25;
    v47[1] = v18;
    v28 = (void *)MEMORY[0x1E4F1C9E8];
    id v29 = v46;
    v30 = [v28 dictionaryWithObjects:v47 forKeys:&v45 count:2];
    v31 = [v20 filterWithName:@"CIAreaAverage" withInputParameters:v30];

    v32 = (void *)MEMORY[0x1E4F42A80];
    v33 = [v31 outputImage];
    v34 = [v32 imageWithCIImage:v33];
  }
  else
  {
    v34 = 0;
  }

  return v34;
}

- (id)cps_imageWithNormalizedOrientation
{
  if ([a1 imageOrientation])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F42A60]);
    [v2 setScale:1.0];
    id v3 = objc_alloc(MEMORY[0x1E4F42A58]);
    [a1 size];
    v4 = objc_msgSend(v3, "initWithSize:format:", v2);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __67__UIImage_ClipUIServicesExtras__cps_imageWithNormalizedOrientation__block_invoke;
    v7[3] = &unk_1E6AE9518;
    v7[4] = a1;
    id v5 = [v4 imageWithActions:v7];
  }
  else
  {
    id v5 = a1;
  }

  return v5;
}

- (void)cps_averageColorImage
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkCIInputExtentKey(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CPSUIImageExtras.m", 13, @"%s", dlerror());

  __break(1u);
}

@end