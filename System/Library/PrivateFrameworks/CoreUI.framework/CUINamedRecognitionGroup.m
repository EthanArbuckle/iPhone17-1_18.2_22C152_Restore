@interface CUINamedRecognitionGroup
- (CUINamedRecognitionGroup)initWithName:(id)a3 contentsFromCatalog:(id)a4 usingRenditionKey:(id)a5 fromTheme:(unint64_t)a6;
- (id)namedRecognitionImageImageList;
- (id)namedRecognitionItemList;
- (id)namedRecognitionObjectObjectList;
- (id)recognitionImageWithName:(id)a3;
- (id)recognitionItemsWithName:(id)a3;
- (id)recognitionObjectWithName:(id)a3;
- (void)dealloc;
@end

@implementation CUINamedRecognitionGroup

- (CUINamedRecognitionGroup)initWithName:(id)a3 contentsFromCatalog:(id)a4 usingRenditionKey:(id)a5 fromTheme:(unint64_t)a6
{
  v40.receiver = self;
  v40.super_class = (Class)CUINamedRecognitionGroup;
  v8 = [(CUINamedLookup *)&v40 initWithName:a3 usingRenditionKey:a5 fromTheme:a6];
  if (v8)
  {
    id v9 = [a3 stringByAppendingString:@"/"];
    id v10 = [(CUIThemeRendition *)[(CUINamedLookup *)v8 _rendition] contentNames];
    if (![v10 count])
    {
      _CUILog(4, (uint64_t)"CoreUI: NamedRecognitionGroup '%@' has no contents", v11, v12, v13, v14, v15, v16, (uint64_t)a3);

      return 0;
    }
    v8->_imageContents = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_objectContents = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v17 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v37;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(v10);
          }
          id v21 = *(id *)(*((void *)&v36 + 1) + 8 * (void)v20);
          id v22 = [a4 _recognitionImageWithName:v21];
          if (!v22)
          {
            id v26 = [a4 _recognitionObjectWithName:v21];
            if (!v26)
            {
              _CUILog(4, (uint64_t)"-[CUINamedRecognitionGroup initWithName:contentsFromCatalog:usingRenditionKey:fromTheme:] couldn't find any recognitions objects named '%@' skipping", v27, v28, v29, v30, v31, v32, (uint64_t)v21);
              goto LABEL_18;
            }
            id v25 = v26;
LABEL_15:
            if (objc_msgSend(v21, "rangeOfString:options:range:", v9, 8, 0, objc_msgSend(v21, "length")) != (id)0x7FFFFFFFFFFFFFFFLL) {
              id v21 = [v21 substringFromIndex:v33];
            }
            [(NSMutableDictionary *)v8->_objectContents setObject:v25 forKey:v21];
            goto LABEL_18;
          }
          id v23 = v22;
          if (objc_msgSend(v21, "rangeOfString:options:range:", v9, 8, 0, objc_msgSend(v21, "length")) != (id)0x7FFFFFFFFFFFFFFFLL) {
            id v21 = [v21 substringFromIndex:v24];
          }
          [(NSMutableDictionary *)v8->_imageContents setObject:v23 forKey:v21];
          id v25 = [a4 _recognitionObjectWithName:v21];
          if (v25) {
            goto LABEL_15;
          }
LABEL_18:
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v34 = [v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
        id v18 = v34;
      }
      while (v34);
    }
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUINamedRecognitionGroup;
  [(CUINamedLookup *)&v3 dealloc];
}

- (id)namedRecognitionItemList
{
  id v3 = [(NSMutableDictionary *)self->_imageContents allKeys];
  id v4 = [(NSMutableDictionary *)self->_objectContents allKeys];
  return [v3 arrayByAddingObjectsFromArray:v4];
}

- (id)namedRecognitionImageImageList
{
  return [(NSMutableDictionary *)self->_imageContents allKeys];
}

- (id)namedRecognitionObjectObjectList
{
  return [(NSMutableDictionary *)self->_objectContents allKeys];
}

- (id)recognitionItemsWithName:(id)a3
{
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(CUINamedRecognitionGroup *)self recognitionImageWithName:a3];
  if (v6) {
    [v5 addObject:v6];
  }
  id v7 = [(CUINamedRecognitionGroup *)self recognitionObjectWithName:a3];
  if (v7) {
    [v5 addObject:v7];
  }
  id v8 = [v5 copy];

  return v8;
}

- (id)recognitionImageWithName:(id)a3
{
  return [(NSMutableDictionary *)self->_imageContents objectForKey:a3];
}

- (id)recognitionObjectWithName:(id)a3
{
  return [(NSMutableDictionary *)self->_objectContents objectForKey:a3];
}

@end