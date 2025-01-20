@interface CUINamedSolidLayerStack
- (BOOL)isEqual:(id)a3;
- (CGImage)flattenedImage;
- (CGSize)size;
- (CUINamedSolidLayerStack)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5 resolvingWithBlock:(id)a6;
- (NSArray)layers;
- (id)layerImageAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setLayers:(id)a3;
@end

@implementation CUINamedSolidLayerStack

- (CUINamedSolidLayerStack)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5 resolvingWithBlock:(id)a6
{
  id v7 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CUINamedSolidLayerStack;
  v8 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v54, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4);
  v9 = [(CUINamedLookup *)v8 _rendition];
  if ((id)[(CUIThemeRendition *)v9 type] == (id)1018)
  {
    if (!v7)
    {
      [(CUINamedLookup *)v8 setName:[(CUIThemeRendition *)v9 name]];
      id v7 = [(CUIThemeRendition *)v9 name];
    }
    v46 = v8;
    v48 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [(CUIThemeRendition *)v9 layerReferences];
    id v16 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v51;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          uint64_t v22 = (*((uint64_t (**)(id, id))a6 + 2))(a6, [v21 referenceKey]);
          if (!v22)
          {
            [v21 referenceKey];
            _CUILog(4, (uint64_t)"CoreUI: Unable to resolve layer reference for '%@' name '%@' layerRef referenceKey '%@'", v27, v28, v29, v30, v31, v32, (uint64_t)v21);
            goto LABEL_23;
          }
          v23 = [[CUINamedSolidLayerImage alloc] initWithName:+[NSString stringWithFormat:@"%@[%ld]", v7, (char *)i + v18 + 1] usingRenditionKey:v22 fromTheme:a5];
          if ([(CUINamedLookup *)v23 _rendition])
          {
            [v21 frame];
            -[CUINamedSolidLayerImage setFrame:](v23, "setFrame:");
            [v21 opacity];
            if (v24 < 1.0)
            {
              [(CUINamedSolidLayerImage *)v23 opacity];
              if (v25 == 1.0)
              {
                [v21 opacity];
                -[CUINamedSolidLayerImage setOpacity:](v23, "setOpacity:");
              }
            }
            if ((int)[v21 blendMode] >= 1 && !-[CUINamedSolidLayerImage blendMode](v23, "blendMode")) {
              -[CUINamedSolidLayerImage setBlendMode:](v23, "setBlendMode:", [v21 blendMode]);
            }
            -[CUINamedSolidLayerImage setFixedFrame:](v23, "setFixedFrame:", [v21 fixedFrame]);
            [(NSArray *)v48 addObject:v23];
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
        v18 += (uint64_t)i;
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_23:
    v26 = v46;
    v46->_layers = v48;
    v8 = objc_alloc_init(CUIRenditionKey);
    [(CUINamedSolidLayerStack *)v8 setThemeElement:[(CUIRenditionKey *)[(CUINamedLookup *)v46 key] themeElement]];
    [(CUINamedSolidLayerStack *)v8 setThemePart:208];
    [(CUINamedSolidLayerStack *)v8 setThemeIdentifier:[(CUIRenditionKey *)[(CUINamedLookup *)v46 key] themeIdentifier]];
    uint64_t v33 = (*((uint64_t (**)(id, CUINamedSolidLayerStack *))a6 + 2))(a6, v8);
    if (v33)
    {
      v40 = (void *)v33;
      unint64_t v41 = [(CUINamedLookup *)v46 storageRef];
      v43 = (void *)_LookupStructuredThemeProvider(v41, v42);
      id v44 = objc_msgSend(v43, "copyLookupKeySignatureForKey:", objc_msgSend(v40, "keyList"));
      v46->_flattenedImageRendition = (CUIThemeRendition *)objc_msgSend(v43, "renditionWithKey:usingKeySignature:", objc_msgSend(v40, "keyList"), v44);
    }
    else
    {
      _CUILog(4, (uint64_t)"CoreUI: Unable to resolve flattened image for layer stack %@", v34, v35, v36, v37, v38, v39, (uint64_t)v46);
    }
  }
  else
  {
    _CUILog(4, (uint64_t)"CoreUI: Attempting to create named layer stack '%@' from inappropriate rendition type: %@", v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    v26 = 0;
  }

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CUINamedSolidLayerStack;
  if (!-[CUINamedLookup isEqual:](&v8, sel_isEqual_)) {
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  unsigned int v5 = -[NSArray isEqual:](-[CUINamedSolidLayerStack layers](self, "layers"), "isEqual:", [a3 layers]);
  if (v5)
  {
    id v6 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] type];
    if (v6 == objc_msgSend(objc_msgSend(a3, "_rendition"), "type"))
    {
      LOBYTE(v5) = 1;
      return v5;
    }
LABEL_6:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  v14.receiver = self;
  v14.super_class = (Class)CUINamedSolidLayerStack;
  unint64_t v3 = [(CUINamedLookup *)&v14 hash];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = [(CUINamedSolidLayerStack *)self layers];
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 *= 2654435769 * (void)[*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) hash];
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (CGSize)size
{
  id v2 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] metrics];
  [v2 imageSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)layerImageAtIndex:(unint64_t)a3
{
  double v4 = [(CUINamedSolidLayerStack *)self layers];
  return [(NSArray *)v4 objectAtIndexedSubscript:a3];
}

- (CGImage)flattenedImage
{
  return [(CUIThemeRendition *)self->_flattenedImageRendition unslicedImage];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUINamedSolidLayerStack;
  [(CUINamedLookup *)&v3 dealloc];
}

- (NSArray)layers
{
  return self->_layers;
}

- (void)setLayers:(id)a3
{
}

@end