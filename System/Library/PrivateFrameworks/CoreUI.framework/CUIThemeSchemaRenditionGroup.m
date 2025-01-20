@interface CUIThemeSchemaRenditionGroup
+ (id)renditionGroupsForRenditions:(id)a3 part:(id *)a4;
- (CUIThemeSchemaRenditionGroup)initWithRenditions:(id)a3 part:(id *)a4;
- (NSArray)renditions;
- (id)_layerNameForDrawingLayer:(int64_t)a3;
- (id)_layerNameForState:(int64_t)a3;
- (id)_renditionsSortedIntoLayers;
- (id)baseKey;
- (id)description;
- (id)mutablePSDImageRef;
- (id)mutablePSDImageRefColumnStyle;
- (id)schemaLayersAndLayerGroups;
- (id)themeSchemaLayers;
- (int64_t)partFeatures;
- (void)addLayoutMetricsToPSDImageRef:(id)a3 withRendition:(id)a4;
- (void)addStatesAndDrawingLayersToPSDLayers:(id)a3 forPresentationState:(unint64_t)a4;
- (void)addValueOrDim1LayersToPSDLayers:(id)a3 forPresentationState:(unint64_t)a4 state:(unint64_t)a5 drawingLayer:(unint64_t)a6;
- (void)dealloc;
- (void)setRenditions:(id)a3;
@end

@implementation CUIThemeSchemaRenditionGroup

+ (id)renditionGroupsForRenditions:(id)a3 part:(id *)a4
{
  if (![a3 count]) {
    return 0;
  }
  unsigned int v5 = CUIRenditionKeyValueForAttribute((unsigned __int16 *)objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "key"), 2);
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v6 = [a3 countByEnumeratingWithState:&v70 objects:v78 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v71;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v71 != v8) {
          objc_enumerationMutation(a3);
        }
        if (CUIRenditionKeyValueForAttribute((unsigned __int16 *)[*(id *)(*((void *)&v70 + 1) + 8 * i) key], 2) != v5)
        {
          _CUILog(1, (uint64_t)"Can't create rendition groups. The problem: not all renditions come from the same part.", v10, v11, v12, v13, v14, v15, v49);
          return 0;
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v70 objects:v78 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  obuint64_t j = +[NSMutableArray array];
  v16 = +[NSMutableArray arrayWithArray:a3];
  for (uint64_t j = 1; j != 3; ++j)
  {
    for (uint64_t k = 0; k != 4; ++k)
    {
      for (uint64_t m = 0; m != 6; ++m)
      {
        id v20 = +[NSMutableArray array];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        id v21 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v66 objects:v77 count:16];
        if (v21)
        {
          id v22 = v21;
          uint64_t v23 = *(void *)v67;
          do
          {
            for (n = 0; n != v22; n = (char *)n + 1)
            {
              if (*(void *)v67 != v23) {
                objc_enumerationMutation(v16);
              }
              v25 = *(void **)(*((void *)&v66 + 1) + 8 * (void)n);
              v26 = (unsigned __int16 *)[v25 key];
              if (CUIRenditionKeyValueForAttribute(v26, 4) == (unsigned __int16)m
                && CUIRenditionKeyValueForAttribute(v26, 3) == (unsigned __int16)k
                && CUIRenditionKeyValueForAttribute(v26, 12) == (unsigned __int16)j)
              {
                [v20 addObject:v25];
              }
            }
            id v22 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v66 objects:v77 count:16];
          }
          while (v22);
        }
        if ([v20 count])
        {
          objc_msgSend(obj, "addObject:", -[CUIThemeSchemaRenditionGroup initWithRenditions:part:]([CUIThemeSchemaRenditionGroup alloc], "initWithRenditions:part:", v20, a4));
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v27 = [v20 countByEnumeratingWithState:&v62 objects:v76 count:16];
          if (v27)
          {
            id v28 = v27;
            uint64_t v29 = *(void *)v63;
            do
            {
              for (ii = 0; ii != v28; ii = (char *)ii + 1)
              {
                if (*(void *)v63 != v29) {
                  objc_enumerationMutation(v20);
                }
                [(NSMutableArray *)v16 removeObject:*(void *)(*((void *)&v62 + 1) + 8 * (void)ii)];
              }
              id v28 = [v20 countByEnumeratingWithState:&v62 objects:v76 count:16];
            }
            while (v28);
          }
        }
      }
    }
  }
  int64_t var4 = a4->var4;
  if ([obj count] && (var4 & 0x10000) != 0 && (var4 & 4) != 0)
  {
    v32 = +[NSMutableArray arrayWithArray:obj];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v33 = [obj countByEnumeratingWithState:&v58 objects:v75 count:16];
    if (v33)
    {
      id v34 = v33;
      v50 = v32;
      uint64_t v51 = *(void *)v59;
      do
      {
        for (juint64_t j = 0; jj != v34; juint64_t j = (char *)jj + 1)
        {
          if (*(void *)v59 != v51) {
            objc_enumerationMutation(obj);
          }
          v36 = *(void **)(*((void *)&v58 + 1) + 8 * (void)jj);
          id v37 = objc_msgSend(v36, "renditions", v50);
          id v38 = +[NSMutableArray array];
          id v39 = +[NSMutableArray array];
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v40 = [v37 countByEnumeratingWithState:&v54 objects:v74 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v55;
            do
            {
              for (kuint64_t k = 0; kk != v41; kuint64_t k = (char *)kk + 1)
              {
                if (*(void *)v55 != v42) {
                  objc_enumerationMutation(v37);
                }
                v44 = *(void **)(*((void *)&v54 + 1) + 8 * (void)kk);
                if (CUIRenditionKeyValueForAttribute((unsigned __int16 *)[v44 key], 14)) {
                  v45 = v39;
                }
                else {
                  v45 = v38;
                }
                [v45 addObject:v44];
              }
              id v41 = [v37 countByEnumeratingWithState:&v54 objects:v74 count:16];
            }
            while (v41);
          }
          if ([v38 count] && objc_msgSend(v39, "count"))
          {
            v46 = [[CUIThemeSchemaRenditionGroup alloc] initWithRenditions:v38 part:a4];
            v47 = [[CUIThemeSchemaRenditionGroup alloc] initWithRenditions:v39 part:a4];
            [(NSMutableArray *)v50 removeObject:v36];
            [(NSMutableArray *)v50 addObject:v46];
            [(NSMutableArray *)v50 addObject:v47];
          }
        }
        id v34 = [obj countByEnumeratingWithState:&v58 objects:v75 count:16];
      }
      while (v34);
      return v50;
    }
    else
    {
      return v32;
    }
  }
  return obj;
}

- (CUIThemeSchemaRenditionGroup)initWithRenditions:(id)a3 part:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CUIThemeSchemaRenditionGroup;
  id v6 = [(CUIThemeSchemaRenditionGroup *)&v9 init];
  id v7 = v6;
  if (v6)
  {
    [(CUIThemeSchemaRenditionGroup *)v6 setRenditions:a3];
    v7->_part = a4;
  }
  return v7;
}

- (id)baseKey
{
  id result = self->_baseKey;
  if (!result)
  {
    memset(v4, 0, 92);
    CUIRenditionKeyCopy(v4, objc_msgSend(-[NSArray objectAtIndex:](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "objectAtIndex:", 0), "key"), 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 10, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 6, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 8, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 9, 0, 0x16u);
    CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 11, 0, 0x16u);
    if (([(CUIThemeSchemaRenditionGroup *)self partFeatures] & 0x10000) == 0) {
      CUIRenditionKeySetValueForAttribute((unsigned __int16 *)v4, 14, 0, 0x16u);
    }
    id result = [[CUIRenditionKey alloc] initWithKeyList:v4];
    self->_baseKey = (CUIRenditionKey *)result;
  }
  return result;
}

- (void)addLayoutMetricsToPSDImageRef:(id)a3 withRendition:(id)a4
{
  [a4 contentInsets];
  double v8 = CUIEdgeInsetsToCGRect(v6, v7);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  uint64_t v15 = objc_alloc_init(CUIPSDLayoutMetricsChannel);
  [(CUIPSDLayoutMetricsChannel *)v15 setName:@"ContentBounds"];
  -[CUIPSDLayoutMetricsChannel setEdgeInsets:](v15, "setEdgeInsets:", v8, v10, v12, v14);
  [a3 addLayoutMetricsChannel:v15];
  v16 = objc_alloc_init(CUIPSDLayoutMetricsChannel);
  [(CUIPSDLayoutMetricsChannel *)v16 setName:@"Edges"];
  [a4 edgeInsets:1];
  -[CUIPSDLayoutMetricsChannel setEdgeInsets:](v16, "setEdgeInsets:");
  [a3 addLayoutMetricsChannel:v16];
}

- (id)mutablePSDImageRef
{
  id v3 = [(CUIThemeSchemaRenditionGroup *)self themeSchemaLayers];
  v46 = self;
  int64_t v49 = [(CUIThemeSchemaRenditionGroup *)self partFeatures];
  v4 = +[NSMutableArray arrayWithCapacity:0];
  id v60 = 0;
  id v61 = 0;
  CGSize v5 = CGSizeZero;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  CGSize v59 = v5;
  obuint64_t j = v3;
  id v43 = [v3 countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (!v43) {
    return 0;
  }
  unsigned int v50 = 0;
  unsigned int v6 = 0;
  id v7 = 0;
  ARGBBitmapContext = 0;
  v47 = 0;
  uint64_t v42 = *(void *)v56;
  double v9 = 1.0;
  do
  {
    for (i = 0; i != v43; i = (char *)i + 1)
    {
      if (*(void *)v56 != v42) {
        objc_enumerationMutation(obj);
      }
      double v11 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      double v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld. %@", v6 + 1, [v11 name]);
      if (v6)
      {
        v64.size = v59;
        v64.origin.x = 0.0;
        v64.origin.y = 0.0;
        CGContextClearRect(ARGBBitmapContext, v64);
      }
      else
      {
        [v11 calculateColumLefts:&v60 rowTops:&v61 totalSize:&v59 forPartFeatures:v49];
        ARGBBitmapContext = CreateARGBBitmapContext(v59.width, v59.height, 1.0);
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v48 = [v11 renditions];
      id v13 = [v48 countByEnumeratingWithState:&v51 objects:v62 count:16];
      if (v13)
      {
        id v14 = v13;
        v44 = v12;
        v45 = i;
        uint64_t v15 = ARGBBitmapContext;
        uint64_t v16 = *(void *)v52;
        while (2)
        {
          for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v52 != v16) {
              objc_enumerationMutation(v48);
            }
            v18 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
            id v19 = [v18 gradient];
            if (v19)
            {
              id v7 = v19;
              goto LABEL_26;
            }
            [v18 opacity];
            double v9 = v20;
            unsigned int v50 = [v18 blendMode];
            [v18 renditionCoordinatesForPartFeatures:v49];
            double v22 = v21;
            double v24 = v23;
            v25 = (CGImage *)objc_msgSend(objc_msgSend(v18, "referenceImage"), "image");
            size_t Width = CGImageGetWidth(v25);
            size_t Height = CGImageGetHeight(v25);
            objc_msgSend(objc_msgSend(v60, "objectAtIndex:", (unint64_t)v22), "floatValue");
            double v29 = v28;
            objc_msgSend(objc_msgSend(v61, "objectAtIndex:", (unint64_t)v24), "floatValue");
            double v31 = v30;
            v65.size.width = (double)Width;
            v65.size.height = (double)Height;
            v65.origin.x = v29;
            v65.origin.y = v31;
            CGContextDrawImage(v15, v65, v25);
            if (!v6)
            {
              uint64_t v32 = [v18 numberOfSlices];
              if (v32)
              {
                uint64_t v33 = 0;
                uint64_t v34 = 32 * v32;
                do
                {
                  CGRect v66 = CGRectOffset(*(CGRect *)((char *)[v18 sliceRects] + v33), v29, v31);
                  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v66);
                  if (DictionaryRepresentation)
                  {
                    CFDictionaryRef v36 = DictionaryRepresentation;
                    [(NSMutableArray *)v4 addObject:DictionaryRepresentation];
                    CFRelease(v36);
                  }
                  v33 += 32;
                }
                while (v34 != v33);
              }
              [(CUIThemeSchemaRenditionGroup *)v46 addLayoutMetricsToPSDImageRef:v47 withRendition:v18];
            }
          }
          id v14 = [v48 countByEnumeratingWithState:&v51 objects:v62 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        id v7 = 0;
LABEL_26:
        ARGBBitmapContext = v15;
        double v12 = v44;
        i = v45;
      }
      if (v6)
      {
        if (v7) {
          goto LABEL_29;
        }
      }
      else
      {
        id v38 = [CUIMutablePSDImageRef alloc];
        v47 = [(CUIMutablePSDImageRef *)v38 initWithPixelWidth:(unint64_t)v59.width pixelHeight:(unint64_t)v59.height];
        [(CUIMutablePSDImageRef *)v47 addOrUpdateSlicesWithSliceRects:v4];
        if (v7)
        {
LABEL_29:
          id v37 = [[CUIPSDGradientLayer alloc] initWithGradient:v7];
          goto LABEL_32;
        }
      }
      Image = CGBitmapContextCreateImage(ARGBBitmapContext);
      id v37 = [[CUIPSDImageLayer alloc] initWithCGImageRef:Image];
      CGImageRelease(Image);
LABEL_32:
      [(CUIPSDLayer *)v37 setName:v12];
      [(CUIPSDLayer *)v37 setOpacity:v9];
      [(CUIPSDLayer *)v37 setBlendMode:v50];
      [(CUIMutablePSDImageRef *)v47 addLayer:v37];

      ++v6;
    }
    id v43 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
  }
  while (v43);
  if (ARGBBitmapContext) {
    CGContextRelease(ARGBBitmapContext);
  }
  return v47;
}

- (id)mutablePSDImageRefColumnStyle
{
  id v4 = [(CUIThemeSchemaRenditionGroup *)self schemaLayersAndLayerGroups];
  id v43 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  id v5 = [v4 count];
  p_info = CUINamedExternalLink.info;
  if ((uint64_t)v5 - 1 >= 0)
  {
    uint64_t v7 = (uint64_t)v5;
    do
    {
      id v8 = [v4 objectAtIndex:--v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(v8, "setIsStart:", objc_msgSend(v8, "isStart") ^ 1);
      }
      [(NSMutableArray *)v43 addObject:v8];
    }
    while (v7 > 0);
  }
  if (([(CUIThemeSchemaRenditionGroup *)self partFeatures] & 0x10000) != 0
    && objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](v43, "firstObject"), "rendition"), "drawingLayer"))
  {
    id v43 = (NSMutableArray *)[v4 mutableCopy];
  }
  id v9 = [(NSArray *)[(CUIThemeSchemaRenditionGroup *)self renditions] objectAtIndex:0];
  if (!v9) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"CUIThemeSchemaRenditionGroup.m" lineNumber:356 description:@"Couldn't find a rendition in the dictionary of groups and renditions. Something gang aft agley."];
  }
  double v10 = (CGImage *)objc_msgSend(objc_msgSend(v9, "referenceImage"), "image");
  double Width = (double)CGImageGetWidth(v10);
  double Height = (double)CGImageGetHeight(v10);
  v45 = [[CUIMutablePSDImageRef alloc] initWithPixelWidth:(unint64_t)Width pixelHeight:(unint64_t)Height];
  id v13 = +[NSMutableArray array];
  uint64_t v14 = [v9 numberOfSlices];
  uint64_t v15 = v43;
  if (v14)
  {
    uint64_t v16 = 0;
    uint64_t v17 = 32 * v14;
    do
    {
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)((char *)[v9 sliceRects]
                                                                                + v16));
      if (DictionaryRepresentation)
      {
        CFDictionaryRef v19 = DictionaryRepresentation;
        [v13 addObject:DictionaryRepresentation];
        CFRelease(v19);
      }
      v16 += 32;
    }
    while (v17 != v16);
  }
  [(CUIThemeSchemaRenditionGroup *)self addLayoutMetricsToPSDImageRef:v45 withRendition:v9];
  [(CUIMutablePSDImageRef *)v45 addOrUpdateSlicesWithSliceRects:v13];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v20)
  {
    id v21 = v20;
    int v22 = 0;
    ARGBBitmapContext = 0;
    double v24 = CUINamedExternalLink.info;
    uint64_t v25 = *(void *)v47;
    while (1)
    {
      v26 = 0;
      int v42 = v22;
      int v27 = -v22;
      int v44 = -v22;
      do
      {
        if (*(void *)v47 != v25) {
          objc_enumerationMutation(v15);
        }
        float v28 = *(void **)(*((void *)&v46 + 1) + 8 * (void)v26);
        if (v27 == v26)
        {
          ARGBBitmapContext = CreateARGBBitmapContext(Width, Height, 1.0);
        }
        else
        {
          v51.origin.x = 0.0;
          v51.origin.y = 0.0;
          v51.size.width = Width;
          v51.size.height = Height;
          CGContextClearRect(ARGBBitmapContext, v51);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v29 = v21;
          uint64_t v30 = v25;
          double v31 = v24;
          id v32 = [v28 rendition];
          id v33 = [v32 gradient];
          if (v33)
          {
            uint64_t v34 = [[CUIPSDGradientLayer alloc] initWithGradient:v33];
          }
          else
          {
            v35 = (CGImage *)objc_msgSend(objc_msgSend(v32, "referenceImage"), "image");
            CGFloat v36 = (double)CGImageGetWidth(v35);
            v52.size.height = (double)CGImageGetHeight(v35);
            v52.origin.x = 0.0;
            v52.origin.y = 0.0;
            v52.size.width = v36;
            CGContextDrawImage(ARGBBitmapContext, v52, v35);
            id v37 = p_info;
            CGImageRef Image = CGBitmapContextCreateImage(ARGBBitmapContext);
            uint64_t v34 = [[CUIPSDImageLayer alloc] initWithCGImageRef:Image];
            id v39 = Image;
            p_info = v37;
            uint64_t v15 = v43;
            CGImageRelease(v39);
          }
          -[CUIPSDLayer setName:](v34, "setName:", [v28 name]);
          [v32 opacity];
          -[CUIPSDLayer setOpacity:](v34, "setOpacity:");
          -[CUIPSDLayer setBlendMode:](v34, "setBlendMode:", [v32 blendMode]);
          double v24 = v31;
          uint64_t v25 = v30;
          id v21 = v29;
          int v27 = v44;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_33;
          }
          if ([v28 isStart])
          {
            uint64_t v34 = objc_alloc_init(CUIPSDLayerGroupStart);
          }
          else
          {
            uint64_t v34 = objc_alloc_init(CUIPSDLayerGroupEnd);
            -[CUIPSDLayer setName:](v34, "setName:", [v28 name]);
          }
        }
        [(CUIMutablePSDImageRef *)v45 addLayer:v34];

LABEL_33:
        v26 = (char *)v26 + 1;
      }
      while (v21 != v26);
      int v22 = v42 + v21;
      id v40 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v46 objects:v50 count:16];
      id v21 = v40;
      if (!v40)
      {
        if (ARGBBitmapContext) {
          CGContextRelease(ARGBBitmapContext);
        }
        return v45;
      }
    }
  }
  return v45;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaRenditionGroup;
  return objc_msgSend(-[CUIThemeSchemaRenditionGroup description](&v3, sel_description), "stringByAppendingFormat:", @" -- Renditions: %@", -[NSArray description](-[CUIThemeSchemaRenditionGroup renditions](self, "renditions"), "description"));
}

- (id)_renditionsSortedIntoLayers
{
  v2 = [(CUIThemeSchemaRenditionGroup *)self renditions];
  return [(NSArray *)v2 sortedArrayUsingComparator:&__block_literal_global_16];
}

uint64_t __59__CUIThemeSchemaRenditionGroup__renditionsSortedIntoLayers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 drawingLayer];
  if (v5 < [a3 drawingLayer]) {
    return -1;
  }
  unsigned int v6 = [a2 drawingLayer];
  if (v6 > [a3 drawingLayer]) {
    return 1;
  }
  unsigned int v8 = [a2 state];
  if (v8 < [a3 state]) {
    return -1;
  }
  unsigned int v9 = [a2 state];
  return v9 > [a3 state];
}

- (id)_layerNameForState:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return 0;
  }
  else {
    return off_1E5A5CAE0[a3];
  }
}

- (id)_layerNameForDrawingLayer:(int64_t)a3
{
  if ((unint64_t)a3 > 7) {
    return @"Unused Drawing Layer";
  }
  else {
    return off_1E5A5CB10[a3];
  }
}

- (id)themeSchemaLayers
{
  id v3 = [(CUIThemeSchemaRenditionGroup *)self _renditionsSortedIntoLayers];
  id v17 = +[NSMutableArray array];
  id v4 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        double v11 = v8;
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (v11)
        {
          unsigned int v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) state];
          if (v12 != [v11 state]
            || (unsigned int v13 = [v8 drawingLayer],
                v13 != [v11 drawingLayer]))
          {
            if ([v11 drawingLayer]) {
              id v14 = -[CUIThemeSchemaRenditionGroup _layerNameForDrawingLayer:](self, "_layerNameForDrawingLayer:", [v11 drawingLayer]);
            }
            else {
              id v14 = -[CUIThemeSchemaRenditionGroup _layerNameForState:](self, "_layerNameForState:", [v11 state]);
            }
            objc_msgSend(v17, "addObject:", +[CUIThemeSchemaLayer layerWithRenditions:name:index:](CUIThemeSchemaLayer, "layerWithRenditions:name:index:", v4, v14, v7++));
            id v4 = +[NSMutableArray array];
          }
        }
        [v4 addObject:v8];
      }
      id v6 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    unsigned int v8 = 0;
  }
  if ([v8 drawingLayer]) {
    id v15 = -[CUIThemeSchemaRenditionGroup _layerNameForDrawingLayer:](self, "_layerNameForDrawingLayer:", [v8 drawingLayer]);
  }
  else {
    id v15 = -[CUIThemeSchemaRenditionGroup _layerNameForState:](self, "_layerNameForState:", [v8 state]);
  }
  objc_msgSend(v17, "addObject:", +[CUIThemeSchemaLayer layerWithRenditions:name:index:](CUIThemeSchemaLayer, "layerWithRenditions:name:index:", v4, v15, v7));
  return +[NSArray arrayWithArray:v17];
}

- (id)schemaLayersAndLayerGroups
{
  id v28 = +[NSMutableArray array];
  id v3 = [(CUIThemeSchemaRenditionGroup *)self renditions];
  unsigned int v4 = [(CUIThemeSchemaRenditionGroup *)self partFeatures];
  if ((v4 & 0x100000) != 0)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = [(NSArray *)v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v3);
          }
          id v17 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v18 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          [(CUIThemeSchemaPSDRenditionLayer *)v18 setRendition:v17];
          -[CUIThemeSchemaPSDLayer setName:](v18, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%@ to %@-%@", [v17 previousStateLocalizedString], objc_msgSend(v17, "previousValueLocalizedString"), objc_msgSend(v17, "stateLocalizedString"), objc_msgSend(v17, "valueLocalizedString")));
          [v28 addObject:v18];
        }
        id v14 = [(NSArray *)v3 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v5 = objc_msgSend(-[CUIThemeSchemaRenditionGroup themeSchemaLayers](self, "themeSchemaLayers"), "count");
    id v6 = +[NSMutableArray array];
    if ((*(void *)&v4 & 0x20004) == 0 || (v4 & 0x10000) != 0)
    {
      if ((unint64_t)v5 < 2)
      {
        if ((v4 & 0x4001) != 0)
        {
          [(CUIThemeSchemaRenditionGroup *)self addValueOrDim1LayersToPSDLayers:v28 forPresentationState:0 state:0 drawingLayer:0];
        }
        else
        {
          double v23 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          [(CUIThemeSchemaPSDLayer *)v23 setName:@"Normal"];
          [(CUIThemeSchemaPSDRenditionLayer *)v23 setRendition:[(NSArray *)v3 objectAtIndex:0]];
          [v28 addObject:v23];
        }
      }
      else
      {
        if ((v4 & 0x10000) != 0)
        {
          uint64_t v19 = 0;
          if (![[(NSArray *)v3 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"presentationState == %lu", 0]] count])
          {
            uint64_t v19 = 1;
            if (!-[NSArray count](-[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"presentationState == %lu", 1)), "count"))uint64_t v19 = 2* (-[NSArray count]([(NSArray *)v3 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"presentationState == %lu", 2)], {
                       "count") != 0);
            }
          }
        }
        else
        {
          uint64_t v19 = 0;
        }
        [(CUIThemeSchemaRenditionGroup *)self addStatesAndDrawingLayersToPSDLayers:v28 forPresentationState:v19];
      }
    }
    else
    {
      uint64_t v7 = v6;
      id v8 = +[NSMutableArray array];
      [v7 addObject:&unk_1EF4A6B08];
      [v8 addObject:@"Active"];
      if ((v4 & 4) != 0)
      {
        [v7 addObject:&unk_1EF4A6B20];
        [v8 addObject:@"Inactive"];
      }
      if ((v4 & 0x20000) != 0)
      {
        [v7 addObject:&unk_1EF4A6B38];
        [v8 addObject:@"Active Main"];
      }
      id v9 = [v7 count];
      if ((unint64_t)v5 < 2)
      {
        if ((v4 & 0x4001) != 0)
        {
          if (v9)
          {
            unint64_t v20 = 0;
            do
            {
              long long v21 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
              [(CUIThemeSchemaPSDLayerGroup *)v21 setIsStart:1];
              [v28 addObject:v21];
              -[CUIThemeSchemaRenditionGroup addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:](self, "addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:", v28, objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v20), "unsignedIntegerValue"), 0, 0);
              int v22 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
              [(CUIThemeSchemaPSDLayerGroup *)v22 setIsStart:0];
              -[CUIThemeSchemaPSDLayer setName:](v22, "setName:", [v8 objectAtIndex:v20]);
              [(CUIThemeSchemaPSDLayer *)v21 setName:[(CUIThemeSchemaPSDLayer *)v22 name]];
              [v28 addObject:v22];
              ++v20;
            }
            while (v20 < (unint64_t)[v7 count]);
          }
        }
        else if (v9)
        {
          unint64_t v24 = 0;
          do
          {
            uint64_t v25 = -[NSArray filteredArrayUsingPredicate:](v3, "filteredArrayUsingPredicate:", +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", @"presentationState == %lu", objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v24), "unsignedIntegerValue")));
            if ([(NSArray *)v25 count])
            {
              v26 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
              [(CUIThemeSchemaPSDRenditionLayer *)v26 setRendition:[(NSArray *)v25 objectAtIndex:0]];
              -[CUIThemeSchemaPSDLayer setName:](v26, "setName:", [v8 objectAtIndex:v24]);
              [v28 addObject:v26];
            }
            ++v24;
          }
          while (v24 < (unint64_t)[v7 count]);
        }
      }
      else if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          double v11 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          [(CUIThemeSchemaPSDLayerGroup *)v11 setIsStart:1];
          [v28 addObject:v11];
          -[CUIThemeSchemaRenditionGroup addStatesAndDrawingLayersToPSDLayers:forPresentationState:](self, "addStatesAndDrawingLayersToPSDLayers:forPresentationState:", v28, objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v10), "unsignedIntegerValue"));
          unsigned int v12 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          [(CUIThemeSchemaPSDLayerGroup *)v12 setIsStart:0];
          -[CUIThemeSchemaPSDLayer setName:](v12, "setName:", [v8 objectAtIndex:v10]);
          [(CUIThemeSchemaPSDLayer *)v11 setName:[(CUIThemeSchemaPSDLayer *)v12 name]];
          [v28 addObject:v12];
          ++v10;
        }
        while (v10 < (unint64_t)[v7 count]);
      }
    }
  }
  return +[NSArray arrayWithArray:v28];
}

- (void)addStatesAndDrawingLayersToPSDLayers:(id)a3 forPresentationState:(unint64_t)a4
{
  id v7 = [(CUIThemeSchemaRenditionGroup *)self themeSchemaLayers];
  id v37 = self;
  unsigned int v35 = [(CUIThemeSchemaRenditionGroup *)self partFeatures];
  if ((v35 & 0x1000000) != 0)
  {
    uint64_t v22 = 0;
    unint64_t v34 = a4;
    do
    {
      double v23 = [(NSArray *)[(CUIThemeSchemaRenditionGroup *)self renditions] filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"state == %lu AND presentationState == %lu", v22, a4]];
      if ([(NSArray *)v23 count])
      {
        id v24 = objc_msgSend(-[NSArray objectAtIndex:](v23, "objectAtIndex:", 0), "stateLocalizedString");
        uint64_t v25 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        [(CUIThemeSchemaPSDLayerGroup *)v25 setIsStart:1];
        id v36 = v24;
        [(CUIThemeSchemaPSDLayer *)v25 setName:v24];
        [a3 addObject:v25];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v26 = [(NSArray *)v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v26)
        {
          id v27 = v26;
          uint64_t v28 = *(void *)v39;
          do
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v39 != v28) {
                objc_enumerationMutation(v23);
              }
              long long v30 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              id v31 = [v30 drawingLayerLocalizedString];
              long long v32 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
              [(CUIThemeSchemaPSDLayer *)v32 setName:v31];
              [(CUIThemeSchemaPSDRenditionLayer *)v32 setRendition:v30];
              [a3 addObject:v32];
            }
            id v27 = [(NSArray *)v23 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v27);
        }
        id v33 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        [(CUIThemeSchemaPSDLayerGroup *)v33 setIsStart:0];
        [(CUIThemeSchemaPSDLayer *)v33 setName:v36];
        [a3 addObject:v33];
        a4 = v34;
      }
      ++v22;
    }
    while (v22 != 6);
  }
  else if ([v7 count])
  {
    unint64_t v8 = 0;
    unint64_t v9 = 0x1E5A50000uLL;
    do
    {
      id v10 = objc_msgSend(objc_msgSend(v7, "objectAtIndex:", v8), "renditions");
      double v11 = v10;
      if (v8)
      {
        unsigned int v12 = objc_msgSend(objc_msgSend(v10, "objectAtIndex:", 0), "drawingLayer");
        id v13 = [v11 objectAtIndex:0];
        if (v12) {
          id v14 = (__CFString *)[v13 drawingLayerLocalizedString];
        }
        else {
          id v14 = (__CFString *)[v13 stateLocalizedString];
        }
        uint64_t v15 = v14;
      }
      else if ((v35 & 0x1000) == 0 || (uint64_t v15 = @"Background", (unint64_t)[v7 count] <= 1))
      {
        uint64_t v15 = @"Normal";
      }
      id v16 = objc_msgSend(v11, "filteredArrayUsingPredicate:", objc_msgSend(*(id *)(v9 + 3088), "predicateWithFormat:", @"presentationState == %lu", a4));
      if ([v16 count])
      {
        id v17 = [v16 objectAtIndex:0];
        if ([v16 count] == (id)1)
        {
          long long v18 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          [(CUIThemeSchemaPSDLayer *)v18 setName:v15];
          [(CUIThemeSchemaPSDRenditionLayer *)v18 setRendition:v17];
        }
        else
        {
          unint64_t v19 = v9;
          unint64_t v20 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          [(CUIThemeSchemaPSDLayerGroup *)v20 setIsStart:1];
          [a3 addObject:v20];
          -[CUIThemeSchemaRenditionGroup addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:](v37, "addValueOrDim1LayersToPSDLayers:forPresentationState:state:drawingLayer:", a3, a4, [v17 state], objc_msgSend(v17, "drawingLayer"));
          long long v18 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
          [(CUIThemeSchemaPSDRenditionLayer *)v18 setIsStart:0];
          [(CUIThemeSchemaPSDLayer *)v18 setName:v15];
          long long v21 = v20;
          unint64_t v9 = v19;
          [(CUIThemeSchemaPSDLayer *)v21 setName:v15];
        }
        [a3 addObject:v18];
      }
      ++v8;
    }
    while (v8 < (unint64_t)[v7 count]);
  }
}

- (void)addValueOrDim1LayersToPSDLayers:(id)a3 forPresentationState:(unint64_t)a4 state:(unint64_t)a5 drawingLayer:(unint64_t)a6
{
  id v36 = [(NSArray *)[(CUIThemeSchemaRenditionGroup *)self renditions] filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"presentationState == %lu AND state == %lu AND drawingLayer == %lu", a4, a5, a6]];
  if (([(CUIThemeSchemaRenditionGroup *)self partFeatures] & 1) != 0
    && ([(CUIThemeSchemaRenditionGroup *)self partFeatures] & 0x4000) != 0)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      uint64_t v25 = [(NSArray *)v36 filteredArrayUsingPredicate:+[NSPredicate predicateWithFormat:@"value == %lu", i]];
      if ([(NSArray *)v25 count])
      {
        id v26 = objc_msgSend(-[NSArray objectAtIndex:](v25, "objectAtIndex:", 0), "valueLocalizedString");
        id v27 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        [(CUIThemeSchemaPSDLayerGroup *)v27 setIsStart:1];
        id v37 = v26;
        [(CUIThemeSchemaPSDLayer *)v27 setName:v26];
        [a3 addObject:v27];
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v28 = [(NSArray *)v25 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v29; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v47 != v30) {
                objc_enumerationMutation(v25);
              }
              long long v32 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
              id v33 = [v32 dimension1LocalizedString];
              unint64_t v34 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
              [(CUIThemeSchemaPSDLayer *)v34 setName:v33];
              [(CUIThemeSchemaPSDRenditionLayer *)v34 setRendition:v32];
              [a3 addObject:v34];
            }
            id v29 = [(NSArray *)v25 countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v29);
        }
        unsigned int v35 = objc_alloc_init(CUIThemeSchemaPSDLayerGroup);
        [(CUIThemeSchemaPSDLayerGroup *)v35 setIsStart:0];
        [(CUIThemeSchemaPSDLayer *)v35 setName:v37];
        [a3 addObject:v35];
      }
    }
  }
  else if ([(CUIThemeSchemaRenditionGroup *)self partFeatures])
  {
    id v16 = [(NSArray *)v36 sortedArrayUsingComparator:&__block_literal_global_104];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = *(void **)(*((void *)&v42 + 1) + 8 * (void)k);
          id v22 = [v21 valueLocalizedString];
          double v23 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          [(CUIThemeSchemaPSDRenditionLayer *)v23 setRendition:v21];
          [(CUIThemeSchemaPSDLayer *)v23 setName:v22];
          [a3 addObject:v23];
        }
        id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v18);
    }
  }
  else
  {
    unint64_t v8 = [(NSArray *)v36 sortedArrayUsingComparator:&__block_literal_global_106];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v38 objects:v50 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t m = 0; m != v10; uint64_t m = (char *)m + 1)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v38 + 1) + 8 * (void)m);
          id v14 = [v13 dimension1LocalizedString];
          uint64_t v15 = objc_alloc_init(CUIThemeSchemaPSDRenditionLayer);
          [(CUIThemeSchemaPSDRenditionLayer *)v15 setRendition:v13];
          [(CUIThemeSchemaPSDLayer *)v15 setName:v14];
          [a3 addObject:v15];
        }
        id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v38 objects:v50 count:16];
      }
      while (v10);
    }
  }
}

uint64_t __104__CUIThemeSchemaRenditionGroup_addValueOrDim1LayersToPSDLayers_forPresentationState_state_drawingLayer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 value];
  if (v5 < [a3 value]) {
    return -1;
  }
  unsigned int v7 = [a2 value];
  return v7 > [a3 value];
}

uint64_t __104__CUIThemeSchemaRenditionGroup_addValueOrDim1LayersToPSDLayers_forPresentationState_state_drawingLayer___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 dimension1];
  if (v5 < [a3 dimension1]) {
    return -1;
  }
  unsigned int v7 = [a2 dimension1];
  return v7 > [a3 dimension1];
}

- (int64_t)partFeatures
{
  return self->_part->var4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaRenditionGroup;
  [(CUIThemeSchemaRenditionGroup *)&v3 dealloc];
}

- (NSArray)renditions
{
  return self->_renditions;
}

- (void)setRenditions:(id)a3
{
}

@end