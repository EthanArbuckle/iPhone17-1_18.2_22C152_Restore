@interface _CUIRawPixelRendition
- (BOOL)isScaled;
- (CGImage)unslicedImage;
- (CGSize)unslicedSize;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)imageForSliceIndex:(int64_t)a3;
- (id)maskForSliceIndex:(int64_t)a3;
- (id)metrics;
- (id)sliceInformation;
- (int)pixelFormat;
- (void)dealloc;
@end

@implementation _CUIRawPixelRendition

- (void)dealloc
{
  CGImageRelease(self->_unslicedImage);
  if (self->_nimages)
  {
    unint64_t v3 = 0;
    do
      CGImageRelease(self->_image[v3++]);
    while (v3 < self->_nimages);
  }

  v4.receiver = self;
  v4.super_class = (Class)_CUIRawPixelRendition;
  [(CUIThemeRendition *)&v4 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  v93[0] = size;
  v93[1] = origin;
  CGSize v94 = size;
  CGPoint v95 = origin;
  CGSize v96 = size;
  CGPoint v97 = origin;
  CGSize v98 = size;
  CGPoint v99 = origin;
  CGSize v100 = size;
  CGPoint v101 = origin;
  CGSize v102 = size;
  CGPoint v103 = origin;
  CGSize v104 = size;
  CGPoint v105 = origin;
  CGSize v106 = size;
  CGPoint v107 = origin;
  CGSize v108 = size;
  CGPoint v109 = origin;
  CGSize v110 = size;
  CGPoint v111 = origin;
  CGSize v112 = size;
  CGPoint v113 = origin;
  CGSize v114 = size;
  CGPoint v115 = origin;
  CGSize v116 = size;
  CGPoint v117 = origin;
  CGSize v118 = size;
  CGPoint v119 = origin;
  CGSize v120 = size;
  CGPoint v121 = origin;
  CGSize v122 = size;
  v91.receiver = self;
  v91.super_class = (Class)_CUIRawPixelRendition;
  id v7 = [(CUIThemeRendition *)&v91 _initWithCSIHeader:a3 version:*(void *)&a4];
  if (v7)
  {
    unsigned int var6 = a3->var6;
    if (var6 != 1212500294 && var6 != 1246774599)
    {
      v9 = +[NSAssertionHandler currentHandler];
      v10 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v10);
      NSStringFromSelector(a2);
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"CUIThemeRendition.m", 2007, @"CoreUI: -[%@ %@] pixel format must be kCSIPixelFormatJPEG/kCSIPixelFormatHEIF");
    }
    v11 = (char *)&a3->var11.var1[a3->var11.var0] + a3->var10;
    v12 = v11 + 4;
    if (*((_DWORD *)v11 + 2))
    {
      v77 = +[NSAssertionHandler currentHandler];
      v78 = (objc_class *)objc_opt_class();
      v79 = NSStringFromClass(v78);
      NSStringFromSelector(a2);
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"CUIThemeRendition.m", 2010, @"CoreUI:-[%@ %@]  data shouldn't be compressed here");
    }
    *((_DWORD *)v7 + 54) = a3->var6;
    unsigned int v13 = *((_DWORD *)v12 + 2);
    unsigned int v14 = bswap32(v13);
    if (*(_DWORD *)v12 == 1146569042) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v13;
    }
    v16 = -[_CUISubrangeData initWithData:range:]([_CUISubrangeData alloc], "initWithData:range:", [v7 srcData], v12 - (unsigned char *)objc_msgSend(objc_msgSend(v7, "srcData"), "bytes") + 12, v15);
    *((void *)v7 + 28) = v16;
    if (v16)
    {
      v17 = CGImageSourceCreateWithData((CFDataRef)v16, 0);
      if (v17)
      {
        v18 = v17;
        *((void *)v7 + 45) = CGImageSourceCreateImageAtIndex(v17, 0, 0);
        +[CUIRenditionKey renditionKeyWithKeyList:](CUIRenditionKey, "renditionKeyWithKeyList:", [v7 key]);
        CGImageSetProperty();
        CFRelease(v18);
      }
    }
    uint64_t var0 = a3->var11.var0;
    if (var0)
    {
      uint64_t var10 = a3->var10;
      if (var10)
      {
        v21 = 0;
        uint64_t v22 = 0;
        v23 = &a3->var11.var1[var0 + 1];
        v24 = (unsigned int *)((char *)v23 + var10);
        do
        {
          unsigned int v25 = *v23;
          if (*v23 == 1006)
          {
            [v7 setExifOrientation:v23[2]];
          }
          else if (v25 == 1003)
          {
            uint64_t v22 = (uint64_t)(v23 + 2);
          }
          else if (v25 == 1001)
          {
            v21 = v23 + 2;
            *((_DWORD *)v7 + 55) = v23[2];
          }
          v23 = (unsigned int *)((char *)v23 + v23[1] + 8);
        }
        while (v23 < v24);
      }
      else
      {
        uint64_t v22 = 0;
        v21 = 0;
      }
      double v89 = 0.0;
      double v90 = 0.0;
      double Width = (double)CGImageGetWidth(*((CGImageRef *)v7 + 45));
      double Height = (double)CGImageGetHeight(*((CGImageRef *)v7 + 45));
      double v89 = Width;
      double v90 = Height;
      NSSize v87 = NSZeroSize;
      NSSize v88 = v87;
      NSSize v85 = v87;
      NSSize v86 = v87;
      unint64_t v84 = 0xBFF0000000000000;
      NSSize v82 = v87;
      NSSize v83 = v87;
      NSSize v80 = v87;
      NSSize v81 = v87;
      if (v22)
      {
        _extractMetrics(v22, (uint64_t)&v89, &v88.width, &v87.width, &v86.width, (int8x16_t *)&v85, &v84, &v83.width, (int8x16_t *)&v82, &v81.width, (int8x16_t *)&v80);
        double Width = v89;
        double Height = v90;
      }
      int v28 = CGImageGetHeight(*((CGImageRef *)v7 + 45));
      if (v21)
      {
        unint64_t v30 = *v21;
        if (v30)
        {
          int v31 = v28;
          unint64_t v32 = 0;
          v33 = v21 + 2;
          v34 = (double *)v93;
          do
          {
            unsigned int v35 = v33[1];
            unsigned int v36 = v33[2];
            if (v35) {
              BOOL v37 = v36 == 0;
            }
            else {
              BOOL v37 = 1;
            }
            if (v37)
            {
              *((void *)v7 + v32 + 29) = 0;
            }
            else
            {
              LODWORD(v29) = *(v33 - 1);
              v125.origin.x = (double)v29;
              v125.origin.y = (double)(v31 - (*v33 + v36));
              v125.size.width = (double)v35;
              v125.size.height = (double)v36;
              *(v34 - 2) = v125.origin.x;
              *(v34 - 1) = v125.origin.y;
              double *v34 = (double)v35;
              v34[1] = (double)v36;
              *((void *)v7 + v32 + 29) = CGImageCreateWithImageInRect(*((CGImageRef *)v7 + 45), v125);
              unint64_t v30 = *v21;
            }
            if (v32 > 0xE) {
              break;
            }
            ++v32;
            v33 += 4;
            v34 += 4;
          }
          while (v32 < v30);
        }
      }
      CGFloat v38 = NSZeroSize.height;
      if ([v7 type] == (id)3)
      {
        double v39 = (double)CGImageGetWidth(*((CGImageRef *)v7 + 29));
        double v40 = (double)CGImageGetWidth(*((CGImageRef *)v7 + 31));
        double v41 = (double)CGImageGetHeight(*((CGImageRef *)v7 + 29));
        double v42 = (double)CGImageGetHeight(*((CGImageRef *)v7 + 35));
        [v7 scale];
        double Width = v39 + v40 + v43;
        double v44 = v41 + v42;
      }
      else
      {
        if ([v7 type] != (id)2)
        {
          if ([v7 type] == (id)1)
          {
            double v50 = (double)CGImageGetWidth(*((CGImageRef *)v7 + 29));
            double v51 = v50 + (double)CGImageGetWidth(*((CGImageRef *)v7 + 31));
            [v7 scale];
            double Width = v52 + v51;
          }
          goto LABEL_43;
        }
        double v45 = (double)CGImageGetHeight(*((CGImageRef *)v7 + 29));
        double v44 = v45 + (double)CGImageGetHeight(*((CGImageRef *)v7 + 31));
      }
      [v7 scale];
      double Height = v46 + v44;
LABEL_43:
      v123.width = NSZeroSize.width;
      v123.height = v38;
      v124.width = Width;
      v124.height = Height;
      if (!NSEqualSizes(v123, v124))
      {
        v47 = [CUIRenditionMetrics alloc];
        uint64_t v48 = v84;
        __int16 v49 = [v7 type] == (id)2 || objc_msgSend(v7, "type") == (id)3;
        int v53 = [v7 type] == (id)1 || objc_msgSend(v7, "type") == (id)3;
        [v7 scale];
        *((void *)v7 + 46) = -[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v47, v49, v53, Width, Height, v89, v90, v88.width, v88.height, v87.width, v87.height, v54, v55, v56, v57, v58, *(uint64_t *)&v86.width, *(uint64_t *)&v86.height, *(uint64_t *)&v85.width,
                                 *(uint64_t *)&v85.height,
                                 v48,
                                 *(uint64_t *)&v83.width,
                                 *(uint64_t *)&v83.height,
                                 *(uint64_t *)&v82.width,
                                 *(uint64_t *)&v82.height,
                                 *(uint64_t *)&v81.width,
                                 *(uint64_t *)&v81.height,
                                 *(uint64_t *)&v80.width,
                                 *(uint64_t *)&v80.height,
                                 v59);
      }
      if ([v7 type] == (id)3 || objc_msgSend(v7, "type") == (id)2 || objc_msgSend(v7, "type") == (id)1)
      {
        id v66 = [v7 type];
        uint64_t v67 = 64;
        if (v66 == (id)3) {
          uint64_t v67 = 256;
        }
        double v69 = *((double *)v93 + 1);
        double v68 = *(double *)v93;
        v70 = (double *)((char *)&origin.x + v67);
        double v71 = v70[2];
        double v72 = v70[3];
        if ([v7 type] == (id)3)
        {
          double v73 = v98.width;
          if (v98.width <= v104.width) {
            double v73 = v104.width;
          }
          if (v68 == 0.0) {
            double v68 = v73;
          }
          double v74 = v94.height;
          if (v94.height <= v96.height) {
            double v74 = v96.height;
          }
          if (v69 == 0.0) {
            double v69 = v74;
          }
          if (v96.width <= v102.width) {
            double v75 = v102.width;
          }
          else {
            double v75 = v96.width;
          }
          if (v71 == 0.0) {
            double v71 = v75;
          }
          if (v72 == 0.0)
          {
            if (v104.height <= v106.height) {
              double v72 = v106.height;
            }
            else {
              double v72 = v104.height;
            }
          }
        }
        *((void *)v7 + 47) = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", [v7 type], 0.0, 0.0, Width, Height, v68, v69, v71, v72);
      }
      if (a3->var11.var0 > 1) {
        _CUILog(4, (uint64_t)"Warning: Ignoring extra images found in CSI", v60, v61, v62, v63, v64, v65, (uint64_t)v79);
      }
    }
  }
  return v7;
}

- (int)pixelFormat
{
  return self->_pixelFormat;
}

- (CGImage)unslicedImage
{
  return self->_unslicedImage;
}

- (CGSize)unslicedSize
{
  double Width = (double)CGImageGetWidth(self->_unslicedImage);
  double Height = (double)CGImageGetHeight(self->_unslicedImage);
  double v5 = Width;
  result.height = Height;
  result.width = v5;
  return result;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    v8 = self->_image[a3];
    return +[CUIImage imageWithCGImage:v8];
  }
}

- (id)maskForSliceIndex:(int64_t)a3
{
  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    v8 = self->_image[a3];
    *(_OWORD *)decode = xmmword_1A139EA00;
    size_t Width = CGImageGetWidth(v8);
    size_t Height = CGImageGetHeight(v8);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v8);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(v8);
    size_t BytesPerRow = CGImageGetBytesPerRow(v8);
    DataProvider = CGImageGetDataProvider(v8);
    BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v8);
    v16 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
    v17 = +[CUIImage imageWithCGImage:v16];
    CGImageRelease(v16);
  }
  return v17;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (id)metrics
{
  v2 = self->_renditionMetrics;
  return v2;
}

- (BOOL)isScaled
{
  return [(CUIThemeRendition *)self subtype] == 31
      || [(CUIThemeRendition *)self subtype] == 12
      || (id)[(CUIThemeRendition *)self type] == (id)2
      || (id)[(CUIThemeRendition *)self type] == (id)1;
}

@end