@interface SKTextureAtlasPacker
+ (CGImage)copyProcessedImageSource:(id)a3;
- (BOOL)isFullyOpaque:(CGImage *)a3;
- (CGImage)copyRotateCGImage:(CGImage *)a3 direction:(BOOL)a4;
- (CGRect)calcNonAlphaArea:(CGImage *)a3;
- (id)generateMetaData;
- (id)getTextureFileList:(id)a3 modDate:(id *)a4;
- (id)partitionTextureFilesByResolution:(id)a3;
- (id)processPackedTextureAtlas:(const void *)a3 suffix:(id)a4 packer:(shared_ptr<MaxRectTexturePacker>)a5 sortedTrimArray:(const void *)a6 sortedTextureArray:(const void *)a7;
- (void)generateTextureAtlasImages:(id)a3 outputDictionary:(id *)a4 forcePOT:(BOOL)a5;
@end

@implementation SKTextureAtlasPacker

- (CGImage)copyRotateCGImage:(CGImage *)a3 direction:(BOOL)a4
{
  BOOL v4 = a4;
  double Width = (double)CGImageGetWidth(a3);
  double Height = (double)CGImageGetHeight(a3);
  v8 = malloc_type_malloc(vcvtd_n_u64_f64(Width * Height, 2uLL), 0xCD6AE79BuLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v10 = CGBitmapContextCreate(v8, (unint64_t)Height, (unint64_t)Width, 8uLL, vcvtd_n_u64_f64(Height, 2uLL), DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = Height;
  v18.size.height = Width;
  CGContextClearRect(v10, v18);
  double v11 = 1.0;
  if (v4) {
    double v12 = -1.0;
  }
  else {
    double v12 = 1.0;
  }
  if (v4)
  {
    double v13 = 0.0;
  }
  else
  {
    double v11 = -1.0;
    double v13 = Height;
  }
  v17.a = 0.0;
  v17.b = v12;
  v17.c = v11;
  if (v4) {
    double v14 = Width;
  }
  else {
    double v14 = 0.0;
  }
  v17.d = 0.0;
  v17.tx = v13;
  v17.ty = v14;
  CGContextConcatCTM(v10, &v17);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = Width;
  v19.size.height = Height;
  CGContextDrawImage(v10, v19, a3);
  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  free(v8);
  return Image;
}

- (CGRect)calcNonAlphaArea:(CGImage *)a3
{
  ColorSpace = CGImageGetColorSpace(a3);
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  CGFloat v6 = *MEMORY[0x263F001A8];
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  size_t Width = CGImageGetWidth(a3);
  double v9 = (double)Width;
  size_t Height = CGImageGetHeight(a3);
  double v11 = v6;
  double v12 = (double)Height;
  double v13 = v7;
  double v14 = (double)Width;
  double v15 = (double)Height;
  if (Model != kCGColorSpaceModelIndexed)
  {
    size_t v16 = Height;
    CGAffineTransform v17 = (char *)malloc_type_malloc((unint64_t)(v9 * v12), 0x91E5CE4uLL);
    unint64_t v18 = (unint64_t)v9;
    CGRect v19 = CGBitmapContextCreate(v17, (unint64_t)v9, (unint64_t)v12, 8uLL, (unint64_t)v9, 0, 7u);
    v45.origin.x = 0.0;
    v45.origin.y = 0.0;
    v45.size.width = (double)Width;
    v45.size.height = v12;
    CGContextClearRect(v19, v45);
    v46.origin.x = 0.0;
    v46.origin.y = 0.0;
    v46.size.width = (double)Width;
    v46.size.height = v12;
    CGContextDrawImage(v19, v46, a3);
    double v13 = v7;
    double v15 = v12;
    if (v16)
    {
      uint64_t v20 = 0;
      v21 = v17;
      double v15 = v12;
      double v13 = v7;
      while (!Width)
      {
LABEL_8:
        double v13 = v13 + 1.0;
        double v15 = v15 + -1.0;
        ++v20;
        v21 += v18;
        if ((double)(int)v20 >= v12) {
          goto LABEL_9;
        }
      }
      uint64_t v22 = 0;
      while (!v21[v22])
      {
        if ((double)(int)++v22 >= v9) {
          goto LABEL_8;
        }
      }
    }
LABEL_9:
    LODWORD(v23) = (int)(v13 + v15 + -1.0);
    if (v13 <= (double)(int)v23)
    {
      uint64_t v23 = (int)v23;
      v38 = &v17[v18 * (int)v23];
      while (!Width)
      {
LABEL_26:
        double v15 = v15 + -1.0;
        --v23;
        v38 -= v18;
        if (v13 > (double)(int)v23) {
          goto LABEL_10;
        }
      }
      uint64_t v39 = 0;
      while (!v38[v39])
      {
        if ((double)(int)++v39 >= v9) {
          goto LABEL_26;
        }
      }
    }
LABEL_10:
    double v11 = v6;
    double v14 = (double)Width;
    if (Width)
    {
      uint64_t v24 = 0;
      double v25 = v13 + v15;
      v26 = &v17[v18 * (int)v13];
      double v14 = (double)Width;
      double v11 = v6;
      while (1)
      {
        int v27 = (int)v13 + 1;
        v28 = v26;
        if (v25 > (double)(int)v13) {
          break;
        }
LABEL_15:
        double v11 = v11 + 1.0;
        double v14 = v14 + -1.0;
        ++v24;
        ++v26;
        if ((double)(int)v24 >= v9) {
          goto LABEL_16;
        }
      }
      while (!*v28)
      {
        v28 += v18;
        double v29 = (double)v27++;
        if (v25 <= v29) {
          goto LABEL_15;
        }
      }
    }
LABEL_16:
    LODWORD(v30) = (int)(v11 + v14 + -1.0);
    if (v11 <= (double)(int)v30)
    {
      double v40 = v13 + v15;
      uint64_t v30 = (int)v30;
      while (1)
      {
        int v41 = (int)v13 + 1;
        v42 = &v17[v18 * (int)v13];
        if (v40 > (double)(int)v13) {
          break;
        }
LABEL_32:
        double v14 = v14 + -1.0;
        if (v11 > (double)(int)--v30) {
          goto LABEL_17;
        }
      }
      while (!v42[v30])
      {
        v42 += v18;
        double v43 = (double)v41++;
        if (v40 <= v43) {
          goto LABEL_32;
        }
      }
    }
LABEL_17:
    CGContextRelease(v19);
    free(v17);
  }
  v47.origin.x = v6;
  v47.origin.y = v7;
  v47.size.width = (double)Width;
  v47.size.height = v12;
  v44.x = v11;
  v44.y = v13;
  BOOL v31 = CGRectContainsPoint(v47, v44);
  double v32 = *MEMORY[0x263F00148];
  double v33 = *(double *)(MEMORY[0x263F00148] + 8);
  if (v31)
  {
    double v32 = v11;
    double v33 = v13;
  }
  float v34 = v15;
  double v35 = fmaxf(v34, 1.0);
  float v36 = v14;
  double v37 = fmaxf(v36, 1.0);
  result.size.height = v35;
  result.size.width = v37;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (BOOL)isFullyOpaque:(CGImage *)a3
{
  -[SKTextureAtlasPacker calcNonAlphaArea:](self, "calcNonAlphaArea:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = (char *)malloc_type_malloc((unint64_t)(v8 * v10), 0xB027D371uLL);
  unint64_t v13 = (unint64_t)v9;
  double v14 = CGBitmapContextCreate(v12, (unint64_t)v9, (unint64_t)v11, 8uLL, (unint64_t)v9, 0, 7u);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v9;
  v24.size.height = v11;
  CGContextClearRect(v14, v24);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v9;
  v25.size.height = v11;
  CGContextDrawImage(v14, v25, a3);
  LODWORD(v15) = (int)v7;
  if (v7 + v11 > (double)(int)v7)
  {
    double v17 = v5 + v9;
    uint64_t v15 = (int)v15;
    unint64_t v18 = &v12[v13 * (int)v15 + (int)v5];
    while (1)
    {
      int v19 = (int)v5 + 1;
      uint64_t v20 = v18;
      if (v17 > (double)(int)v5) {
        break;
      }
LABEL_7:
      ++v15;
      v18 += v13;
      if (v7 + v11 <= (double)(int)v15) {
        goto LABEL_2;
      }
    }
    while (1)
    {
      int v21 = *v20++;
      if (v21 != 255) {
        break;
      }
      double v22 = (double)v19++;
      if (v17 <= v22) {
        goto LABEL_7;
      }
    }
    BOOL v16 = 0;
  }
  else
  {
LABEL_2:
    BOOL v16 = 1;
  }
  CGContextRelease(v14);
  free(v12);
  return v16;
}

- (id)partitionTextureFilesByResolution:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = v19;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        double v7 = [v6 lowercaseString];
        double v8 = [v7 stringByDeletingPathExtension];

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v9 = [&unk_26BF04888 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v9)
        {
          id v10 = v3;
          uint64_t v11 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(&unk_26BF04888);
              }
              unint64_t v13 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              if ([v8 hasSuffix:v13])
              {
                double v14 = v13;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [&unk_26BF04888 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v9) {
              continue;
            }
            break;
          }
          double v14 = @"KFilenameHasNoMatchingSuffix";
LABEL_16:
          id v3 = v10;
        }
        else
        {
          double v14 = @"KFilenameHasNoMatchingSuffix";
        }
        uint64_t v15 = [v3 objectForKey:v14];
        BOOL v16 = v15;
        if (v15)
        {
          [v15 addObject:v6];
          id v17 = v16;
        }
        else
        {
          id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v17 addObject:v6];
          [v3 setObject:v17 forKey:v14];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)getTextureFileList:(id)a3 modDate:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v20 = a3;
  uint64_t v21 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v24 = *MEMORY[0x263EFF5F8];
  uint64_t v25 = *MEMORY[0x263EFF6A8];
  uint64_t v4 = *MEMORY[0x263EFF750];
  double v5 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF6A8], *MEMORY[0x263EFF5F8], 0);
  unint64_t v18 = [v21 enumeratorAtURL:v20 includingPropertiesForKeys:v5 options:4 errorHandler:0];

  id v22 = [MEMORY[0x263EFF980] array];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v18;
  id v6 = 0;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v28 = 0;
        [v10 getResourceValue:&v28 forKey:v4 error:0];
        id v11 = v28;
        id v27 = 0;
        [v10 getResourceValue:&v27 forKey:v25 error:0];
        id v12 = v27;
        id v26 = 0;
        [v10 getResourceValue:&v26 forKey:v24 error:0];
        id v13 = v26;
        double v14 = v13;
        if (v6)
        {
          if ([v13 compare:v6] == 1)
          {
            id v15 = v14;

            id v6 = v15;
          }
        }
        else
        {
          id v6 = v13;
        }
        if (([v12 BOOLValue] & 1) == 0)
        {
          BOOL v16 = [v11 lowercaseString];
          if (([v16 hasSuffix:@".jpg"] & 1) != 0
            || [v16 hasSuffix:@".png"])
          {
            [v22 addObject:v10];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v7);
  }

  if (a4) {
    *a4 = v6;
  }

  return v22;
}

- (id)generateMetaData
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v2 setObject:@"APPL" forKey:@"format"];
  id v3 = [NSNumber numberWithInt:1];
  [v2 setObject:v3 forKey:@"version"];

  return v2;
}

- (id)processPackedTextureAtlas:(const void *)a3 suffix:(id)a4 packer:(shared_ptr<MaxRectTexturePacker>)a5 sortedTrimArray:(const void *)a6 sortedTextureArray:(const void *)a7
{
  var1 = a5.var1;
  var0 = a5.var0;
  id v68 = a4;
  id v70 = [MEMORY[0x263EFF980] arrayWithCapacity:(uint64_t)(*((void *)a3 + 1) - *(void *)a3) >> 4];
  if (*((void *)a3 + 1) != *(void *)a3)
  {
    unint64_t v8 = 0;
    v69 = a3;
    while (1)
    {
      uint64_t v9 = MEMORY[0x21052F180]();
      id v10 = (double *)(*(void *)a3 + 16 * v8);
      double v11 = *v10;
      double rect = v10[1];
      id v12 = malloc_type_malloc(vcvtd_n_u64_f64(*v10 * rect, 2uLL), 0x95C211AAuLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      point_8 = CGBitmapContextCreate(v12, (unint64_t)v11, (unint64_t)rect, 8uLL, vcvtd_n_u64_f64(v11, 2uLL), DeviceRGB, 0x4001u);
      CGColorSpaceRelease(DeviceRGB);
      v96.origin.x = 0.0;
      v96.origin.y = 0.0;
      v96.size.width = v11;
      v96.size.height = rect;
      CGContextClearRect(point_8, v96);
      id v73 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      double v14 = NSStringFromCGSize(*(CGSize *)(*(void *)a3 + 16 * v8));
      [v73 setObject:v14 forKey:@"size"];
      v72 = (void *)v9;

      uint64_t v15 = (*(uint64_t (**)(void, unint64_t))(**(void **)var0 + 40))(*(void *)var0, v8);
      v71 = v12;
      v84 = [MEMORY[0x263EFF980] arrayWithCapacity:v15];
      if (v15) {
        break;
      }
LABEL_53:
      [v73 setObject:v84 forKey:@"subimages"];
      Image = CGBitmapContextCreateImage(point_8);
      v66 = [MEMORY[0x263F1C6B0] imageWithCGImage:Image];
      [v73 setObject:v66 forKey:@"path"];
      CGContextRelease(point_8);
      free(v71);
      CGImageRelease(Image);
      [v70 addObject:v73];

      ++v8;
      a3 = v69;
      if (v8 >= (uint64_t)(v69[1] - *v69) >> 4) {
        goto LABEL_54;
      }
    }
    uint64_t v16 = 0;
    uint64_t v80 = v15;
    while (1)
    {
      id v17 = (void *)MEMORY[0x21052F180]();
      CGSize v18 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
      v92.CGPoint origin = (CGPoint)*MEMORY[0x263F001A8];
      v92.CGSize size = v18;
      unsigned int v91 = 0;
      int v90 = 0;
      uint64_t v19 = (*(uint64_t (**)(void, unint64_t, uint64_t, unsigned int *, CGRect *, int *))(**(void **)var0 + 48))(*(void *)var0, v8, v16, &v91, &v92, &v90);
      uint64_t v20 = *(void *)var1 + 32 * v91;
      double v21 = *(double *)v20;
      double v22 = *(double *)(v20 + 8);
      double v24 = *(double *)(v20 + 16);
      double v23 = *(double *)(v20 + 24);
      uint64_t v25 = *(void *)a6 + 32 * v91;
      id v26 = *(CGImage **)v25;
      if (*(char *)(v25 + 31) < 0)
      {
        std::string::__init_copy_ctor_external(&v89, *(const std::string::value_type **)(v25 + 8), *(void *)(v25 + 16));
      }
      else
      {
        long long v27 = *(_OWORD *)(v25 + 8);
        v89.__r_.__value_.__r.__words[2] = *(void *)(v25 + 24);
        *(_OWORD *)&v89.__r_.__value_.__l.__data_ = v27;
      }
      unint64_t v28 = v8;
      long long v29 = NSString;
      int v30 = SHIBYTE(v89.__r_.__value_.__r.__words[2]);
      long long v31 = (std::string *)v89.__r_.__value_.__r.__words[0];
      uint64_t v32 = [NSString defaultCStringEncoding];
      double v33 = v30 >= 0 ? &v89 : v31;
      uint64_t v34 = [v29 stringWithCString:v33 encoding:v32];
      id v35 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      [v35 setObject:v34 forKey:@"name"];
      float v36 = [MEMORY[0x263EFF980] arrayWithCapacity:0];
      [v35 setObject:v36 forKey:@"aliases"];

      size_t Width = CGImageGetWidth(v26);
      size_t Height = CGImageGetHeight(v26);
      if (!v19) {
        break;
      }
      id v26 = [(SKTextureAtlasPacker *)self copyRotateCGImage:v26 direction:1];
      double v39 = (double)CGImageGetWidth(v26) - v22 - v23;
      double v40 = v21;
      CGFloat v41 = v23;
      CGFloat v42 = v24;
      if (v26) {
        goto LABEL_15;
      }
LABEL_16:
      CGFloat point = v21;
      double v46 = (double)Width;
      double v47 = (double)Height;
      if (v24 != (double)Width || v23 != v47) {
        goto LABEL_48;
      }
      CGPoint origin = v92.origin;
      CGSize size = v92.size;
      double v81 = v92.origin.y + -1.0;
      double v82 = v92.size.height + -1.0;
      double v74 = v92.origin.x + -1.0;
      double v75 = v92.origin.y + v92.size.height;
      double v78 = v92.origin.x + v92.size.width;
      double v79 = v92.size.width + -1.0;
      int v51 = v90;
      if ((v90 & 8) != 0)
      {
        if (!v26) {
          goto LABEL_48;
        }
        v98.origin.x = 0.0;
        v98.origin.y = 0.0;
        v98.size.height = 1.0;
        v98.size.width = v92.size.width;
        v52 = CGImageCreateWithImageInRect(v26, v98);
        v99.size.height = 1.0;
        v99.origin.x = origin.x;
        v99.origin.y = v75;
        v99.size.width = size.width;
        CGContextDrawImage(point_8, v99, v52);
        CGImageRelease(v52);
        int v51 = v90;
        if ((v90 & 4) == 0)
        {
          if (v90)
          {
LABEL_35:
            v104.origin.x = 0.0;
            v104.origin.y = 0.0;
            v104.size.width = 1.0;
            v104.size.height = size.height;
            v55 = CGImageCreateWithImageInRect(v26, v104);
            v105.size.width = 1.0;
            v105.origin.x = v74;
            v105.origin.y = origin.y;
            v105.size.height = size.height;
            CGContextDrawImage(point_8, v105, v55);
            CGImageRelease(v55);
            int v51 = v90;
            if ((v90 & 2) == 0) {
              goto LABEL_36;
            }
LABEL_33:
            v102.origin.y = 0.0;
            v102.size.width = 1.0;
            v102.origin.x = v79;
            v102.size.height = size.height;
            v54 = CGImageCreateWithImageInRect(v26, v102);
            v103.size.width = 1.0;
            v103.origin.x = v78;
            v103.origin.y = origin.y;
            v103.size.height = size.height;
            CGContextDrawImage(point_8, v103, v54);
            CGImageRelease(v54);
            int v51 = v90;
            goto LABEL_37;
          }
LABEL_31:
          if (v26 && (v51 & 2) != 0) {
            goto LABEL_33;
          }
LABEL_36:
          if (v26)
          {
LABEL_37:
            if ((v51 & 9) == 9)
            {
              v106.origin.x = 0.0;
              v106.origin.y = 0.0;
              v106.size.width = 1.0;
              v106.size.height = 1.0;
              v56 = CGImageCreateWithImageInRect(v26, v106);
              v107.size.width = 1.0;
              v107.size.height = 1.0;
              v107.origin.x = v74;
              v107.origin.y = v75;
              CGContextDrawImage(point_8, v107, v56);
              CGImageRelease(v56);
              int v51 = v90;
            }
          }
          if (v26 && (v51 & 5) == 5)
          {
            v108.origin.x = 0.0;
            v108.size.width = 1.0;
            v108.size.height = 1.0;
            v108.origin.y = v82;
            v57 = CGImageCreateWithImageInRect(v26, v108);
            v109.size.width = 1.0;
            v109.size.height = 1.0;
            v109.origin.x = v74;
            v109.origin.y = v81;
            CGContextDrawImage(point_8, v109, v57);
            CGImageRelease(v57);
            int v51 = v90;
          }
          if (v26 && (v51 & 0xA) == 0xA)
          {
            v110.origin.y = 0.0;
            v110.size.width = 1.0;
            v110.size.height = 1.0;
            v110.origin.x = v79;
            v58 = CGImageCreateWithImageInRect(v26, v110);
            v111.size.width = 1.0;
            v111.size.height = 1.0;
            v111.origin.x = v78;
            v111.origin.y = v75;
            CGContextDrawImage(point_8, v111, v58);
            CGImageRelease(v58);
            int v51 = v90;
          }
          if ((~v51 & 6) == 0 && v26)
          {
            v112.size.width = 1.0;
            v112.size.height = 1.0;
            v112.origin.x = v79;
            v112.origin.y = v82;
            v59 = CGImageCreateWithImageInRect(v26, v112);
            v113.size.width = 1.0;
            v113.size.height = 1.0;
            v113.origin.x = v78;
            v113.origin.y = v81;
            CGContextDrawImage(point_8, v113, v59);
            CGImageRelease(v59);
          }
          goto LABEL_48;
        }
      }
      else if (!v26 || (v90 & 4) == 0)
      {
        if ((v90 & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_34;
      }
      v100.origin.x = 0.0;
      v100.size.height = 1.0;
      v100.origin.y = v82;
      v100.size.width = size.width;
      v53 = CGImageCreateWithImageInRect(v26, v100);
      v101.size.height = 1.0;
      v101.origin.x = origin.x;
      v101.origin.y = v81;
      v101.size.width = size.width;
      CGContextDrawImage(point_8, v101, v53);
      CGImageRelease(v53);
      int v51 = v90;
      if ((v90 & 1) == 0) {
        goto LABEL_31;
      }
LABEL_34:
      if (v26) {
        goto LABEL_35;
      }
LABEL_48:
      v94.y = v47 - v22 - v23;
      v92.origin.y = rect - v92.origin.y - v92.size.height;
      v94.x = point;
      v60 = NSStringFromCGPoint(v94);
      [v35 setObject:v60 forKey:@"spriteOffset"];

      v95.width = v46;
      v95.height = (double)Height;
      v61 = NSStringFromCGSize(v95);
      [v35 setObject:v61 forKey:@"spriteSourceSize"];

      v62 = NSStringFromCGRect(v92);
      [v35 setObject:v62 forKey:@"textureRect"];

      v63 = [NSNumber numberWithBool:v19];
      [v35 setObject:v63 forKey:@"textureRotated"];

      v64 = objc_msgSend(NSNumber, "numberWithBool:", -[SKTextureAtlasPacker isFullyOpaque:](self, "isFullyOpaque:", v26));
      [v35 setObject:v64 forKey:@"isFullyOpaque"];

      [v84 addObject:v35];
      if (v19) {
        CGImageRelease(v26);
      }

      if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v89.__r_.__value_.__l.__data_);
      }
      unint64_t v8 = v28;
      if (v80 == ++v16) {
        goto LABEL_53;
      }
    }
    double v39 = v21;
    double v40 = v22;
    CGFloat v41 = v24;
    CGFloat v42 = v23;
    if (!v26) {
      goto LABEL_16;
    }
LABEL_15:
    CGFloat v43 = v41;
    CGFloat v44 = v42;
    CGRect v45 = CGImageCreateWithImageInRect(v26, *(CGRect *)&v39);
    v97.CGPoint origin = v92.origin;
    v97.size.width = v41;
    v97.size.height = v42;
    CGContextDrawImage(point_8, v97, v45);
    CGImageRelease(v45);
    goto LABEL_16;
  }
LABEL_54:

  return v70;
}

+ (CGImage)copyProcessedImageSource:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  if (!v3) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = CGImageSourceCreateWithURL(v3, 0);
      id v6 = v5;
      if (v5)
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
        CFRelease(v6);
        goto LABEL_10;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CFURLRef v7 = v3;
        unint64_t v8 = (void *)MEMORY[0x263F1C6B0];
        uint64_t v9 = SKGetResourceBundle();
        id v10 = [v8 imageNamed:v7 inBundle:v9];

        id v11 = v10;
        ImageAtIndex = CGImageRetain((CGImageRef)[v11 CGImage]);

        goto LABEL_10;
      }
    }
LABEL_9:
    ImageAtIndex = 0;
    goto LABEL_10;
  }
  ImageAtIndex = CGImageRetain((CGImageRef)[(__CFURL *)v3 CGImage]);
LABEL_10:

  return ImageAtIndex;
}

- (void)generateTextureAtlasImages:(id)a3 outputDictionary:(id *)a4 forcePOT:(BOOL)a5
{
  id v26 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  CFURLRef v7 = [v6 allKeys];
  long long v31 = [(SKTextureAtlasPacker *)self partitionTextureFilesByResolution:v7];

  long long v27 = [(SKTextureAtlasPacker *)self generateMetaData];
  id v28 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obuint64_t j = [v31 allKeys];
  uint64_t v32 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v32)
  {
    uint64_t v30 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v51 != v30) {
          objc_enumerationMutation(obj);
        }
        unint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        char v9 = objc_msgSend(v8, "isEqualToString:", @"KFilenameHasNoMatchingSuffix", v26);
        id v10 = &stru_26BEEFD10;
        if ((v9 & 1) == 0) {
          id v10 = v8;
        }
        double v33 = v10;
        double v47 = 0;
        v48 = 0;
        unint64_t v49 = 0;
        id v11 = [v31 objectForKey:v8];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v12 = v11;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v54 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v44;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v44 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void **)(*((void *)&v43 + 1) + 8 * j);
              long long __p = 0uLL;
              uint64_t v42 = 0;
              id v17 = [v6 objectForKey:v16];
              CGImageRef image = +[SKTextureAtlasPacker copyProcessedImageSource:v17];

              std::string::basic_string[abi:ne180100]<0>(v35, (char *)[v16 cStringUsingEncoding:4]);
              if (SHIBYTE(v42) < 0) {
                operator delete((void *)__p);
              }
              long long __p = *(_OWORD *)v35;
              uint64_t v42 = v36;
              CGSize v18 = v48;
              if ((unint64_t)v48 >= v49)
              {
                double v21 = (char *)std::vector<TextureInfo>::__push_back_slow_path<TextureInfo const&>((uint64_t *)&v47, (uint64_t)&image);
              }
              else
              {
                *(void *)v48 = image;
                uint64_t v19 = (std::string *)(v18 + 8);
                if (SHIBYTE(v42) < 0)
                {
                  std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
                }
                else
                {
                  long long v20 = __p;
                  *((void *)v18 + 3) = v42;
                  *(_OWORD *)&v19->__r_.__value_.__l.__data_ = v20;
                }
                double v21 = v18 + 32;
              }
              v48 = v21;
              if (SHIBYTE(v42) < 0) {
                operator delete((void *)__p);
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v43 objects:v54 count:16];
          }
          while (v13);
        }

        unint64_t v23 = 126 - 2 * __clz((v48 - v47) >> 5);
        v35[0] = sortTextureFunc;
        if (v48 == v47) {
          uint64_t v24 = 0;
        }
        else {
          uint64_t v24 = v23;
        }
        std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(TextureInfo const&,TextureInfo const&),TextureInfo*,false>((long long *)v47, v48, (uint64_t (**)(long long *, long long *))v35, v24, 1, v22);
        if (v48 != v47)
        {
          double v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          operator new();
        }

        CGImageRef image = (CGImageRef)&v47;
        std::vector<TextureInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&image);
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v32);
  }

  [v27 setObject:v28 forKey:@"images"];
  id v25 = v27;
  id *v26 = v25;
}

@end