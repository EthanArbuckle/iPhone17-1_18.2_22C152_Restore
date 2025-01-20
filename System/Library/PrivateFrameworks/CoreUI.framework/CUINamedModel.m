@interface CUINamedModel
- (CUINamedModel)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (MDLAsset)asset;
- (id)_renditionForKey:(id)a3 inThemeRef:(unint64_t)a4;
- (id)description;
@end

@implementation CUINamedModel

- (id)_renditionForKey:(id)a3 inThemeRef:(unint64_t)a4
{
  v5 = (void *)_LookupStructuredThemeProvider(a4, a2);
  if (!objc_msgSend(v5, "assetExistsForKey:", objc_msgSend(a3, "keyList"))) {
    return 0;
  }
  id v6 = [a3 keyList];
  return [v5 renditionWithKey:v6];
}

- (CUINamedModel)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v49.receiver = self;
  v49.super_class = (Class)CUINamedModel;
  id v6 = -[CUINamedLookup initWithName:usingRenditionKey:fromTheme:](&v49, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4);
  v7 = [(CUINamedLookup *)v6 _rendition];
  if ((id)[(CUIThemeRendition *)v7 type] != (id)1011)
  {

    id v6 = 0;
  }
  id v36 = [(CUIThemeRendition *)v7 modelAsset];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = [(CUIThemeRendition *)v7 meshKeys];
  id v8 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v46;
    uint64_t v35 = *(void *)v46;
    do
    {
      v11 = 0;
      id v37 = v9;
      do
      {
        if (*(void *)v46 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v45 + 1) + 8 * (void)v11);
        id v13 = [(CUINamedModel *)v6 _renditionForKey:v12 inThemeRef:a5];
        if ([v13 type] == (id)1012)
        {
          v40 = v11;
          objc_msgSend(v36, "addObject:", objc_msgSend(v13, "modelMesh"));
          id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(objc_msgSend(v13, "submeshKeys"), "count"));
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          v39 = v13;
          id v21 = [v13 submeshKeys];
          id v22 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v42;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v42 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void *)(*((void *)&v41 + 1) + 8 * i);
                id v27 = [(CUINamedModel *)v6 _renditionForKey:v26 inThemeRef:a5];
                if ([v27 type] == (id)1016) {
                  objc_msgSend(v20, "addObject:", objc_msgSend(v27, "modelSubmesh"));
                }
                else {
                  _CUILog(4, (uint64_t)"-[CUINamedModel initWithName:usingRenditionKey:fromTheme:] Got a rendition not of type kCUIModelSubMeshRenditionType with key: '%@' skipping", v28, v29, v30, v31, v32, v33, v26);
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v41 objects:v50 count:16];
            }
            while (v23);
          }
          objc_msgSend(objc_msgSend(v39, "modelMesh"), "setSubmeshes:", v20);

          uint64_t v10 = v35;
          id v9 = v37;
          v11 = v40;
        }
        else
        {
          _CUILog(4, (uint64_t)"-[CUINamedModel initWithName:usingRenditionKey:fromTheme:] Got a rendition not of type kCUIModelMeshRenditionType with key: '%@' skipping", v14, v15, v16, v17, v18, v19, v12);
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      id v9 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v9);
  }
  return v6;
}

- (MDLAsset)asset
{
  v2 = [(CUINamedLookup *)self _rendition];
  return (MDLAsset *)[(CUIThemeRendition *)v2 modelAsset];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@:%p> name:'%@' asset:'%@' #meshes:%lu>", NSStringFromClass(v3), self, [(CUINamedLookup *)self name], [(CUINamedModel *)self asset], [(MDLAsset *)[(CUINamedModel *)self asset] count]];
}

@end