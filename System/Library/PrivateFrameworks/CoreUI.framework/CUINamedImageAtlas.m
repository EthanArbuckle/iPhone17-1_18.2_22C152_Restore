@interface CUINamedImageAtlas
- (BOOL)_dimension1ExistsInKeyFormatForThemeRef:(BOOL)result;
- (BOOL)completeTextureExtrusion;
- (CGImage)image;
- (CUINamedImageAtlas)initWithName:(id)a3 usingRenditionKey:(id)a4 withContents:(id)a5 contentsFromCatalog:(id)a6 fromTheme:(unint64_t)a7 withSourceThemeRef:(unint64_t)a8;
- (NSArray)imageNames;
- (__CFArray)images;
- (double)scale;
- (id)_renditionForKey:(uint64_t)a3 inThemeRef:;
- (id)imageWithName:(id)a3;
- (void)dealloc;
@end

@implementation CUINamedImageAtlas

- (void)dealloc
{
  atlasImages = self->_atlasImages;
  if (atlasImages) {
    CFRelease(atlasImages);
  }

  v4.receiver = self;
  v4.super_class = (Class)CUINamedImageAtlas;
  [(CUINamedLookup *)&v4 dealloc];
}

- (id)_renditionForKey:(uint64_t)a3 inThemeRef:
{
  if (!a1) {
    return 0;
  }
  objc_super v4 = (void *)_LookupStructuredThemeProvider(a3, a2);
  if (!objc_msgSend(v4, "assetExistsForKey:", objc_msgSend(a2, "keyList"))) {
    return 0;
  }
  id v5 = [a2 keyList];
  return [v4 renditionWithKey:v5];
}

- (BOOL)_dimension1ExistsInKeyFormatForThemeRef:(BOOL)result
{
  if (result)
  {
    id v2 = objc_msgSend((id)_LookupStructuredThemeProvider(a2, a2), "keyFormat");
    return CUIRenditionKeyHasIdentifier((uint64_t)v2, 8);
  }
  return result;
}

- (CUINamedImageAtlas)initWithName:(id)a3 usingRenditionKey:(id)a4 withContents:(id)a5 contentsFromCatalog:(id)a6 fromTheme:(unint64_t)a7 withSourceThemeRef:(unint64_t)a8
{
  v14 = (void *)_LookupStructuredThemeProvider(a8, a2);
  v85.receiver = self;
  v85.super_class = (Class)CUINamedImageAtlas;
  v65 = [(CUINamedLookup *)&v85 initWithName:a3 usingRenditionKey:a4 fromTheme:a7];
  if (!v65->_images)
  {
    id v76 = [a3 stringByAppendingString:@"/"];
    v74 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v64 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    id v58 = a6;
    if (a5
      && (id v15 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, a5, a7),
          objc_msgSend(objc_msgSend(v15, "contentNames"), "count")))
    {
      id obj = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", objc_msgSend(v15, "contentNames"));
    }
    else
    {
      id obj = 0;
    }
    id v16 = [(CUIRenditionKey *)[(CUINamedLookup *)v65 renditionKey] copy];
    BOOL v59 = -[CUINamedImageAtlas _dimension1ExistsInKeyFormatForThemeRef:]((BOOL)v65, a7);
    id v57 = [v16 themeScale];
    id v73 = [v16 themeIdiom];
    id v72 = [v16 themeSubtype];
    id v71 = [v16 themeDisplayGamut];
    id v70 = [v16 themeDirection];
    id v69 = [v16 themeSizeClassHorizontal];
    id v68 = [v16 themeSizeClassVertical];
    id v67 = [v16 themeMemoryClass];
    id v66 = [v16 themeGraphicsClass];
    [v16 setThemeDimension1:0];
    v60 = v16;
    id v17 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, v16, a7);
    if (v17)
    {
      uint64_t v61 = 0;
      do
      {
        unint64_t v18 = a7;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v81 = 0u;
        long long v82 = 0u;
        v62 = v17;
        id v19 = [v17 layerReferences];
        id v20 = [v19 countByEnumeratingWithState:&v81 objects:v87 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v82;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v82 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = [*(id *)(*((void *)&v81 + 1) + 8 * i) referenceKey];
              id v25 = objc_msgSend(v14, "renditionNameForKeyList:", objc_msgSend(v24, "keyList"));
              id v27 = v25;
              if (objc_msgSend(v25, "rangeOfString:options:range:", v76, 8, 0, objc_msgSend(v25, "length")) != (id)0x7FFFFFFFFFFFFFFFLL) {
                id v27 = [v25 substringFromIndex:v26];
              }
              v28 = [[CUINamedImage alloc] initWithName:v27 usingRenditionKey:v24 fromTheme:v18];
              if (v28)
              {
                v29 = v28;
                [(NSDictionary *)v74 setObject:v28 forKey:v27];
              }
              [obj removeObject:v25];
            }
            id v21 = [v19 countByEnumeratingWithState:&v81 objects:v87 count:16];
          }
          while (v21);
        }
        [(NSArray *)v64 addObject:v62];
        id v30 = [v62 unslicedImage];
        if (v30)
        {
          CFArrayAppendValue(theArray, v30);
          a7 = v18;
          if (!v59) {
            break;
          }
        }
        else
        {
          a7 = v18;
          if (!v59) {
            break;
          }
        }
        ++v61;
        objc_msgSend(v60, "setThemeDimension1:");
        id v17 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, v60, a7);
      }
      while (v17);
    }

    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v31 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v78;
      do
      {
        for (j = 0; j != v32; j = (char *)j + 1)
        {
          if (*(void *)v78 != v33) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
          id v37 = v35;
          if (objc_msgSend(v35, "rangeOfString:options:range:", v76, 8, 0, objc_msgSend(v35, "length")) != (id)0x7FFFFFFFFFFFFFFFLL) {
            id v37 = [v35 substringFromIndex:v36];
          }
          id v38 = [v58 imageWithName:v35 scaleFactor:v73 deviceIdiom:v72 deviceSubtype:v71 displayGamut:v70 layoutDirection:v69 sizeClassHorizontal:(double)(uint64_t)v57 sizeClassVertical:v68 memoryClass:v67 graphicsClass:v66];
          if (v38)
          {
            v45 = v38;
            [v38 setName:v37];
            [(NSDictionary *)v74 setObject:v45 forKey:v37];
            id v46 = objc_msgSend(objc_msgSend(v45, "_rendition"), "linkingToRendition");
            if (v46)
            {
              id v47 = -[CUINamedImageAtlas _renditionForKey:inThemeRef:]((uint64_t)v65, v46, a7);
              if (v47 && (v54 = v47, [(NSArray *)v64 indexOfObject:v47] == 0x7FFFFFFFFFFFFFFFLL))
              {
                [(NSArray *)v64 addObject:v54];
                id v55 = [v54 unslicedImage];
                if (v55) {
                  CFArrayAppendValue(theArray, v55);
                }
              }
              else
              {
                _CUILog(1, (uint64_t)"CoreUI: didn't find parent rendition for '%@' skipping it", v48, v49, v50, v51, v52, v53, (uint64_t)v35);
              }
            }
          }
          else
          {
            _CUILog(1, (uint64_t)"CoreUI: couldn't find image '%@' in '%@'", v39, v40, v41, v42, v43, v44, (uint64_t)v35);
          }
        }
        id v32 = [obj countByEnumeratingWithState:&v77 objects:v86 count:16];
      }
      while (v32);
    }
    v65->_images = v74;
    v65->_renditions = v64;
    v65->_atlasImages = theArray;
  }
  return v65;
}

- (CGImage)image
{
  atlasImages = self->_atlasImages;
  if (!atlasImages || CFArrayGetCount(atlasImages) < 1) {
    return 0;
  }
  _CUILog(1, (uint64_t)"CoreUI: using depricated method -[CUINamedImageAtlas image] use -[CUINamedImageAtlas images] instead", v4, v5, v6, v7, v8, v9, v12);
  v10 = self->_atlasImages;
  return (CGImage *)CFArrayGetValueAtIndex(v10, 0);
}

- (__CFArray)images
{
  return self->_atlasImages;
}

- (double)scale
{
  return (double)CUIRenditionKeyValueForAttribute((unsigned __int16 *)[(CUIRenditionKey *)[(CUINamedLookup *)self renditionKey] keyList], 12);
}

- (id)imageWithName:(id)a3
{
  return [(NSDictionary *)self->_images objectForKey:a3];
}

- (NSArray)imageNames
{
  return [(NSDictionary *)self->_images allKeys];
}

- (BOOL)completeTextureExtrusion
{
  return [(CUINamedLookup *)self _distilledInVersion] > 0x1AB;
}

@end