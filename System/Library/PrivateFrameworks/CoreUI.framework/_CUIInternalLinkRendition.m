@interface _CUIInternalLinkRendition
- (BOOL)edgesOnly;
- (BOOL)isInternalLink;
- (BOOL)isOpaque;
- (BOOL)isScaled;
- (BOOL)isTiled;
- (CGImage)unslicedImage;
- (CGRect)_destinationFrame;
- (CGRect)alphaCroppedRect;
- (CGSize)originalUncroppedSize;
- (CGSize)unslicedSize;
- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4;
- (id)_sourceRendition;
- (id)data;
- (id)imageForSliceIndex:(int64_t)a3;
- (id)linkingToRendition;
- (id)maskForSliceIndex:(int64_t)a3;
- (id)metrics;
- (id)properties;
- (id)sliceInformation;
- (int)bitmapEncoding;
- (int)pixelFormat;
- (unsigned)_fillOutImageSlices;
- (void)_setStructuredThemeStore:(id)a3;
- (void)dealloc;
@end

@implementation _CUIInternalLinkRendition

- (void)_setStructuredThemeStore:(id)a3
{
}

- (CGSize)originalUncroppedSize
{
  double width = self->_originalUncroppedSize.width;
  double height = self->_originalUncroppedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGImage)unslicedImage
{
  objc_sync_enter(self);
  unslicedImage = self->_unslicedImage;
  if (unslicedImage) {
    goto LABEL_9;
  }
  v4 = (CGImage *)objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "unslicedImage");
  v5 = v4;
  if (v4)
  {
    CGFloat x = self->_frame.origin.x;
    CGFloat width = self->_frame.size.width;
    double height = self->_frame.size.height;
    v18.origin.y = (double)CGImageGetHeight(v4) - (self->_frame.origin.y + height);
    v18.origin.CGFloat x = x;
    v18.size.CGFloat width = width;
    v18.size.double height = height;
    self->_unslicedImage = CGImageCreateWithImageInRect(v5, v18);
    +[CUIRenditionKey renditionKeyWithKeyList:[(CUIThemeRendition *)self key]];
    CGImageSetProperty();
    if ([objc_loadWeak((id *)&self->_sourceProvider) caAllowSubimageOfImage:v5]) {
      CGImageSetProperty();
    }
  }
  else if (objc_loadWeak((id *)&self->_sourceProvider) && ![(_CUIInternalLinkRendition *)self data])
  {
    v9 = +[CUIRenditionKey renditionKeyWithKeyList:[(CUIThemeRendition *)self key]];
    objc_msgSend(objc_msgSend(objc_loadWeak((id *)&self->_sourceProvider), "themeStore"), "path");
    _CUILog(4, (uint64_t)"CoreUI: Unable to resolve link '%@' to parent image with key '%@' for internalLink image in source at path '%@'", v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  }
  unslicedImage = self->_unslicedImage;
  if (unslicedImage)
  {
LABEL_9:
    CFRetain(unslicedImage);
    CFAutorelease(self->_unslicedImage);
    v16 = self->_unslicedImage;
  }
  else
  {
    v16 = 0;
  }
  objc_sync_exit(self);
  return v16;
}

- (id)_sourceRendition
{
  id Weak = objc_loadWeak((id *)&self->_sourceProvider);
  v4 = [(CUIRenditionKey *)self->_referenceKey keyList];
  return [Weak renditionWithKey:v4];
}

- (id)metrics
{
  v2 = self->_renditionMetrics;
  return v2;
}

- (CGRect)alphaCroppedRect
{
  double x = self->_alphaCroppedFrame.origin.x;
  double y = self->_alphaCroppedFrame.origin.y;
  double width = self->_alphaCroppedFrame.size.width;
  double height = self->_alphaCroppedFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

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
  v4.super_class = (Class)_CUIInternalLinkRendition;
  [(CUIThemeRendition *)&v4 dealloc];
}

- (id)_initWithCSIHeader:(const _csiheader *)a3 version:(unsigned int)a4
{
  v77.receiver = self;
  v77.super_class = (Class)_CUIInternalLinkRendition;
  v6 = [(CUIThemeRendition *)&v77 _initWithCSIHeader:a3 version:*(void *)&a4];
  uint64_t var0 = a3->var11.var0;
  if (var0)
  {
    v8 = a3;
    unsigned int v9 = 0;
    uint64_t v10 = (char *)&a3->var11.var1[var0 + 1] + a3->var10;
    CGFloat height = NSZeroSize.height;
    while (1)
    {
      uint64_t var10 = v8->var10;
      memset(v78, 0, 92);
      if (!var10) {
        break;
      }
      uint64_t v13 = v8;
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      v16 = &v10[-var10];
      do
      {
        switch(*(_DWORD *)v16)
        {
          case 0x3E9:
            uint64_t v14 = (unsigned int *)(v16 + 8);
            *((_DWORD *)v6 + 54) = *((_DWORD *)v16 + 2);
            break;
          case 0x3EB:
            uint64_t v15 = (uint64_t)(v16 + 8);
            break;
          case 0x3EE:
            [v6 setExifOrientation:*((unsigned int *)v16 + 2)];
            break;
          case 0x3F2:
            uint64_t v17 = *((void *)v16 + 2);
            v18.i64[0] = v17;
            v18.i64[1] = HIDWORD(v17);
            *(float64x2_t *)(v6 + 888) = vcvtq_f64_u64(v18);
            uint64_t v19 = *((void *)v16 + 3);
            v18.i64[0] = v19;
            v18.i64[1] = HIDWORD(v19);
            *(float64x2_t *)(v6 + 904) = vcvtq_f64_u64(v18);
            __memcpy_chk();
            *((void *)v6 + 116) = [[CUIRenditionKey alloc] initWithKeyList:v78];
            [v6 _initializeTypeIdentifiersWithLayout:*((unsigned __int16 *)v16 + 16)];
            break;
          case 0x3F3:
            uint64_t v20 = *((void *)v16 + 2);
            v21.i64[0] = v20;
            v21.i64[1] = HIDWORD(v20);
            *(float64x2_t *)(v6 + 936) = vcvtq_f64_u64(v21);
            uint64_t v22 = *((void *)v16 + 3);
            v21.i64[0] = v22;
            v21.i64[1] = HIDWORD(v22);
            *(float64x2_t *)(v6 + 952) = vcvtq_f64_u64(v21);
            uint64_t v23 = *((void *)v16 + 4);
            v21.i64[0] = v23;
            v21.i64[1] = HIDWORD(v23);
            *(float64x2_t *)(v6 + 968) = vcvtq_f64_u64(v21);
            break;
          default:
            break;
        }
        v16 += *((unsigned int *)v16 + 1) + 8;
      }
      while (v16 < v10);
      if (!v14) {
        break;
      }
      v24 = (CGImage *)[v6 unslicedImage];
      double v75 = 0.0;
      double v76 = 0.0;
      double Width = (double)CGImageGetWidth(v24);
      double v26 = (double)CGImageGetHeight(v24);
      double v75 = Width;
      double v76 = v26;
      NSSize v73 = NSZeroSize;
      NSSize v74 = v73;
      NSSize v71 = v73;
      NSSize v72 = v73;
      unint64_t v70 = 0xBFF0000000000000;
      NSSize v68 = v73;
      NSSize v69 = v73;
      NSSize v66 = v73;
      NSSize v67 = v73;
      if (v15)
      {
        _extractMetrics(v15, (uint64_t)&v75, &v74.width, &v73.width, &v72.width, (int8x16_t *)&v71, &v70, &v69.width, (int8x16_t *)&v68, &v67.width, (int8x16_t *)&v66);
        double Width = v75;
        double v26 = v76;
      }
      unsigned int v27 = *v14;
      *((_DWORD *)v6 + 54) = *v14;
      if (v27 >= 0x11) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v6 file:@"CUIThemeRendition.m" lineNumber:2986 description:@"CoreUI: have more slices than image slots: _CUIInternalLinkRendition"];
      }
      unint64_t v28 = *v14;
      if (v28)
      {
        unint64_t v29 = 0;
        v30 = v14 + 4;
        v31 = v6;
        do
        {
          unsigned int v32 = *(v30 - 1);
          unsigned int v33 = *v30;
          v34 = (CGPoint *)(v31 + 224);
          if (v32) {
            BOOL v35 = v33 == 0;
          }
          else {
            BOOL v35 = 1;
          }
          if (v35)
          {
            CGSize size = CGRectZero.size;
            CGPoint *v34 = CGRectZero.origin;
            *((CGSize *)v31 + 15) = size;
            unint64_t v28 = *v14;
          }
          else
          {
            uint64_t v37 = *(void *)(v30 - 3);
            v38.i64[0] = v37;
            v38.i64[1] = HIDWORD(v37);
            *(float64x2_t *)v34 = vcvtq_f64_u64(v38);
            *((double *)v31 + 30) = (double)v32;
            *((double *)v31 + 31) = (double)v33;
          }
          ++v29;
          v31 += 32;
          v30 += 4;
        }
        while (v29 < v28);
      }
      if ([v6 type] == (id)3)
      {
        double v39 = *((double *)v6 + 31);
        double v40 = *((double *)v6 + 55);
        double v41 = *((double *)v6 + 30) + *((double *)v6 + 38);
        [v6 scale];
        double Width = v41 + v42;
        [v6 scale];
        double v26 = v39 + v40 + v43;
      }
      else if ([v6 type] == (id)2)
      {
        double v44 = *((double *)v6 + 31) + *((double *)v6 + 39);
        [v6 scale];
        double v26 = v45 + v44;
      }
      else if ([v6 type] == (id)1)
      {
        double v46 = *((double *)v6 + 30) + *((double *)v6 + 38);
        [v6 scale];
        double Width = v47 + v46;
      }
      v79.double width = NSZeroSize.width;
      v79.CGFloat height = height;
      v80.double width = Width;
      v80.CGFloat height = v26;
      if (!NSEqualSizes(v79, v80))
      {
        v48 = [CUIRenditionMetrics alloc];
        uint64_t v49 = v70;
        __int16 v50 = [v6 type] == (id)2 || objc_msgSend(v6, "type") == (id)3;
        int v51 = [v6 type] == (id)1 || objc_msgSend(v6, "type") == (id)3;
        [v6 scale];
        *((void *)v6 + 109) = -[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v48, v50, v51, Width, v26, v75, v76, v74.width, v74.height, v73.width, v73.height, v52, v53, v54, v55, v56, *(uint64_t *)&v72.width, *(uint64_t *)&v72.height, *(uint64_t *)&v71.width,
                                  *(uint64_t *)&v71.height,
                                  v49,
                                  *(uint64_t *)&v69.width,
                                  *(uint64_t *)&v69.height,
                                  *(uint64_t *)&v68.width,
                                  *(uint64_t *)&v68.height,
                                  *(uint64_t *)&v67.width,
                                  *(uint64_t *)&v67.height,
                                  *(uint64_t *)&v66.width,
                                  *(uint64_t *)&v66.height,
                                  v57);
      }
      if ([v6 type] == (id)3 || objc_msgSend(v6, "type") == (id)2 || objc_msgSend(v6, "type") == (id)1)
      {
        id v58 = [v6 type];
        uint64_t v59 = 64;
        if (v58 == (id)3) {
          uint64_t v59 = 256;
        }
        double v60 = *((double *)v6 + 30);
        double v61 = *((double *)v6 + 31);
        v62 = (double *)&v6[v59 + 224];
        double v63 = v62[2];
        double v64 = v62[3];
        if ([v6 type] == (id)3)
        {
          if (v60 == 0.0)
          {
            if (*((double *)v6 + 42) <= *((double *)v6 + 54)) {
              double v60 = *((double *)v6 + 54);
            }
            else {
              double v60 = *((double *)v6 + 42);
            }
          }
          if (v61 == 0.0)
          {
            if (*((double *)v6 + 35) <= *((double *)v6 + 39)) {
              double v61 = *((double *)v6 + 39);
            }
            else {
              double v61 = *((double *)v6 + 35);
            }
          }
          if (v63 == 0.0)
          {
            if (*((double *)v6 + 38) <= *((double *)v6 + 50)) {
              double v63 = *((double *)v6 + 50);
            }
            else {
              double v63 = *((double *)v6 + 38);
            }
          }
          if (v64 == 0.0)
          {
            if (*((double *)v6 + 55) <= *((double *)v6 + 59)) {
              double v64 = *((double *)v6 + 59);
            }
            else {
              double v64 = *((double *)v6 + 55);
            }
          }
        }
        *((void *)v6 + 110) = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", [v6 type], 0.0, 0.0, Width, v26, v60, v61, v63, v64);
      }
      ++v9;
      v8 = v13;
      if (v9 >= v13->var11.var0) {
        return v6;
      }
    }

    return 0;
  }
  return v6;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

- (void).cxx_destruct
{
}

- (int)bitmapEncoding
{
  id v2 = [(_CUIInternalLinkRendition *)self _sourceRendition];
  return [v2 bitmapEncoding];
}

- (BOOL)isOpaque
{
  id v2 = [(_CUIInternalLinkRendition *)self _sourceRendition];
  return [v2 isOpaque];
}

- (int)pixelFormat
{
  id v2 = [(_CUIInternalLinkRendition *)self _sourceRendition];
  return [v2 pixelFormat];
}

- (BOOL)isInternalLink
{
  return 1;
}

- (id)linkingToRendition
{
  return self->_referenceKey;
}

- (CGRect)_destinationFrame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)unslicedSize
{
  [(_CUIInternalLinkRendition *)self originalUncroppedSize];
  if (v3 == 0.0 || v4 == 0.0)
  {
    [(_CUIInternalLinkRendition *)self _destinationFrame];
    double v3 = v5;
    double v4 = v6;
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (BOOL)isScaled
{
  return [(CUIThemeRendition *)self subtype] == 31
      || [(CUIThemeRendition *)self subtype] == 12
      || (id)[(CUIThemeRendition *)self type] == (id)2
      || (id)[(CUIThemeRendition *)self type] == (id)1;
}

- (id)data
{
  id v2 = [(_CUIInternalLinkRendition *)self _sourceRendition];
  return [v2 data];
}

- (id)properties
{
  v8.receiver = self;
  v8.super_class = (Class)_CUIInternalLinkRendition;
  id v3 = [(CUIThemeRendition *)&v8 properties];
  id v4 = objc_msgSend(-[_CUIInternalLinkRendition _sourceRendition](self, "_sourceRendition"), "properties");
  double v5 = v4;
  if (v3)
  {
    if ([v4 count])
    {
      id v6 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v3];
      [v6 addEntriesFromDictionary:v5];
    }
    else
    {
      id v6 = [v3 copy];
    }
    return v6;
  }
  return v5;
}

- (unsigned)_fillOutImageSlices
{
  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    if (!*((void *)v1 + 92))
    {
      if (v1[54])
      {
        id v2 = (CGImage *)[v1 unslicedImage];
        size_t Height = CGImageGetHeight(v2);
        if (v1[54])
        {
          unint64_t v4 = 0;
          double v5 = (double)Height;
          id v6 = (CGFloat *)v1;
          do
          {
            v8.origin.double x = v6[28];
            v8.size.double width = v6[30];
            v8.size.double height = v6[31];
            v8.origin.double y = v5 - (v6[29] + v8.size.height);
            *(void *)&v1[2 * v4++ + 184] = CGImageCreateWithImageInRect(v2, v8);
            v6 += 4;
          }
          while (v4 < v1[54]);
        }
      }
    }
    return (unsigned int *)objc_sync_exit(v1);
  }
  return result;
}

- (id)imageForSliceIndex:(int64_t)a3
{
  -[_CUIInternalLinkRendition _fillOutImageSlices]((unsigned int *)self);
  double v5 = self->_image[a3];
  return +[CUIImage imageWithCGImage:v5];
}

- (id)maskForSliceIndex:(int64_t)a3
{
  *(_OWORD *)decode = xmmword_1A139EA00;
  if (a3 < 0 || self->_nimages <= a3)
  {
    _CUILog(4, (uint64_t)"Invalid slice index %ld for rendition", a3, v3, v4, v5, v6, v7, a3);
    return 0;
  }
  else
  {
    -[_CUIInternalLinkRendition _fillOutImageSlices]((unsigned int *)self);
    uint64_t v10 = self->_image[a3];
    size_t Width = CGImageGetWidth(v10);
    size_t Height = CGImageGetHeight(v10);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v10);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(v10);
    size_t BytesPerRow = CGImageGetBytesPerRow(v10);
    DataProvider = CGImageGetDataProvider(v10);
    BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v10);
    uint64x2_t v18 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, decode, ShouldInterpolate);
    uint64_t v19 = +[CUIImage imageWithCGImage:v18];
    CGImageRelease(v18);
  }
  return v19;
}

- (BOOL)isTiled
{
  if ((id)[(CUIThemeRendition *)self type] == (id)3
    || ![(CUIThemeRendition *)self type]
    || (id)[(CUIThemeRendition *)self type] == (id)5
    || (id)[(CUIThemeRendition *)self type] == (id)8)
  {
    return [(CUIThemeRendition *)self subtype] == 30 || [(CUIThemeRendition *)self subtype] == 11;
  }
  id v4 = [(CUIThemeRendition *)self name];
  _CUILog(1, (uint64_t)"WARNING: -isTiled called on rendition named: %@, which is not a one-part or nine-part image, but the method is only meaningful for one-part and nine-part images. Returning NO.", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  return 0;
}

- (BOOL)edgesOnly
{
  return [(CUIThemeRendition *)self subtype] == 34
      && CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIThemeRendition *)self key], 11) != 2;
}

@end