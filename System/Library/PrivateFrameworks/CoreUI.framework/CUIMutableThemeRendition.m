@interface CUIMutableThemeRendition
- (CGImage)unslicedImage;
- (CUIMutableThemeRendition)initWithCGImage:(CGImage *)a3 withDescription:(id)a4 forKey:(const _renditionkeytoken *)a5;
- (const)key;
- (id)metrics;
- (id)sliceInformation;
- (void)dealloc;
- (void)setName:(id)a3;
@end

@implementation CUIMutableThemeRendition

- (CGImage)unslicedImage
{
  return self->_image;
}

- (id)metrics
{
  return self->_renditionMetrics;
}

- (void)setName:(id)a3
{
  if ([(CUIThemeRendition *)self internalName] != a3)
  {
    [(CUIThemeRendition *)self setInternalName:a3];
  }
}

- (CUIMutableThemeRendition)initWithCGImage:(CGImage *)a3 withDescription:(id)a4 forKey:(const _renditionkeytoken *)a5
{
  v49.receiver = self;
  v49.super_class = (Class)CUIMutableThemeRendition;
  v9 = [(CUIMutableThemeRendition *)&v49 init];
  v10 = CGImageRetain(a3);
  v9->_image = v10;
  size_t Width = CGImageGetWidth(v10);
  size_t Height = CGImageGetHeight(v9->_image);
  id v13 = [a4 resizingMode];
  -[CUIThemeRendition setExifOrientation:](v9, "setExifOrientation:", [a4 exifOrientation]);
  int v14 = CUIRenditionKeyTokenCount((uint64_t)a5);
  unsigned __int16 v15 = v14 + 1;
  v16 = (_renditionkeytoken *)malloc_type_calloc((v14 + 1), 4uLL, 0x100004052888210uLL);
  v9->_renditionKedouble y = v16;
  CUIRenditionKeyCopy(v16, a5, v15);
  [(CUIThemeRendition *)v9 setInternalScale:CUIRenditionKeyValueForAttribute(&v9->_renditionKey->identifier, 12)];
  LODWORD(a5) = [(CUIThemeRendition *)v9 internalScale];
  [a4 scale];
  if (a5 != v17)
  {
    v46 = +[NSAssertionHandler currentHandler];
    id v47 = (id)[(CUIThemeRendition *)v9 internalScale];
    [a4 scale];
    [(NSAssertionHandler *)v46 handleFailureInMethod:a2, v9, @"CUIMutableThemeRendition.m", 39, @"scale %u in rendition key does not match with scale %f passed in the image description", v47, v48 object file lineNumber description];
  }
  if (![(CUIThemeRendition *)v9 internalScale]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:v9 file:@"CUIMutableThemeRendition.m" lineNumber:40 description:@"scale must be > 0"];
  }
  -[CUIThemeRendition setInternalTemplateRenderingMode:](v9, "setInternalTemplateRenderingMode:", [a4 templateRenderingMode]);
  -[CUIThemeRendition setBlendMode:](v9, "setBlendMode:", [a4 blendMode]);
  switch((unint64_t)[a4 imageType])
  {
    case 0uLL:
      [(CUIThemeRendition *)v9 setType:0];
      v18 = v9;
      if (v13 == (id)1) {
        uint64_t v19 = 12;
      }
      else {
        uint64_t v19 = 11;
      }
      goto LABEL_21;
    case 1uLL:
      [(CUIThemeRendition *)v9 setType:1];
      v18 = v9;
      if (v13 == (id)1) {
        uint64_t v19 = 21;
      }
      else {
        uint64_t v19 = 20;
      }
      goto LABEL_21;
    case 2uLL:
      [(CUIThemeRendition *)v9 setType:2];
      v18 = v9;
      if (v13 == (id)1) {
        uint64_t v19 = 24;
      }
      else {
        uint64_t v19 = 23;
      }
      goto LABEL_21;
    case 3uLL:
      [(CUIThemeRendition *)v9 setType:3];
      v18 = v9;
      if (v13 == (id)1) {
        uint64_t v19 = 31;
      }
      else {
        uint64_t v19 = 30;
      }
LABEL_21:
      [(CUIThemeRendition *)v18 setSubtype:v19];
      break;
    case 4uLL:
      v20 = v9;
      uint64_t v21 = 4;
      goto LABEL_16;
    case 5uLL:
      v20 = v9;
      uint64_t v21 = 5;
LABEL_16:
      [(CUIThemeRendition *)v20 setType:v21];
      break;
    default:
      break;
  }
  double y = NSZeroRect.origin.y;
  [a4 edgeInsets];
  v9->_sliceInformation = -[CUIRenditionSliceInformation initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:]([CUIRenditionSliceInformation alloc], "initWithRenditionType:destinationRect:topLeftInset:bottomRightInset:", [(CUIThemeRendition *)v9 type], NSZeroRect.origin.x, y, (double)Width, (double)Height, v24 * (double)[(CUIThemeRendition *)v9 internalScale], v23 * (double)[(CUIThemeRendition *)v9 internalScale], v26 * (double)[(CUIThemeRendition *)v9 internalScale], v25 * (double)[(CUIThemeRendition *)v9 internalScale]);
  [a4 alignmentEdgeInsets];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33 * (double)[(CUIThemeRendition *)v9 internalScale];
  double v35 = v30 * (double)[(CUIThemeRendition *)v9 internalScale];
  double v36 = v28 * (double)[(CUIThemeRendition *)v9 internalScale];
  double v37 = v32 * (double)[(CUIThemeRendition *)v9 internalScale];
  v38 = [CUIRenditionMetrics alloc];
  unsigned int v39 = [(CUIThemeRendition *)v9 internalScale];
  v9->_renditionMetrics = (CUIRenditionMetrics *)-[CUIRenditionMetrics initWithImageSize:defaultImageSize:edgeBottomLeft:edgeTopRight:contentBottomLeft:contentTopRight:baseline:auxiliary1BottomLeft:auxiliary1TopRight:auxiliary2BottomLeft:auxiliary2TopRight:scalesVertically:scalesHorizontally:scale:](v38, 0, 0, (double)Width, (double)Height, (double)Width, (double)Height, v36, v35, v37, v34, v40, v41, v42, v43, v44, *(uint64_t *)&NSZeroSize.width, *(void *)&NSZeroSize.height, *(uint64_t *)&NSZeroSize.width,
                                                   *(void *)&NSZeroSize.height,
                                                   0,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(void *)&NSZeroSize.height,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(void *)&NSZeroSize.height,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(void *)&NSZeroSize.height,
                                                   *(uint64_t *)&NSZeroSize.width,
                                                   *(void *)&NSZeroSize.height,
                                                   COERCE__INT64((double)v39));
  return v9;
}

- (void)dealloc
{
  free(self->_renditionKey);
  CGImageRelease(self->_image);

  v3.receiver = self;
  v3.super_class = (Class)CUIMutableThemeRendition;
  [(CUIThemeRendition *)&v3 dealloc];
}

- (const)key
{
  return self->_renditionKey;
}

- (id)sliceInformation
{
  return self->_sliceInformation;
}

@end