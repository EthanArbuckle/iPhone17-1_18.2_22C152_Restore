@interface CUINamedData
- (CUINamedData)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (NSData)data;
- (NSString)utiType;
- (id)description;
@end

@implementation CUINamedData

- (NSString)utiType
{
  v2 = [(CUINamedLookup *)self _rendition];
  if ((id)[(CUIThemeRendition *)v2 type] != (id)1000) {
    return (NSString *)@"com.adobe.pdf";
  }
  return (NSString *)[(CUIThemeRendition *)v2 utiType];
}

- (CUINamedData)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CUINamedData;
  v6 = [(CUINamedLookup *)&v15 initWithName:a3 usingRenditionKey:a4 fromTheme:a5];
  v7 = [(CUINamedLookup *)v6 _rendition];
  if ((id)[(CUIThemeRendition *)v7 type] != (id)1000 && (id)[(CUIThemeRendition *)v7 type] != (id)9)
  {
    _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named data '%@' with a type that is not a data type in the AssetCatalog", v8, v9, v10, v11, v12, v13, (uint64_t)a3);

    return 0;
  }
  return v6;
}

- (NSData)data
{
  v2 = [(CUINamedLookup *)self _rendition];
  if ((id)[(CUIThemeRendition *)v2 type] == (id)1000)
  {
    return (NSData *)[(CUIThemeRendition *)v2 data];
  }
  else
  {
    [(CUIThemeRendition *)v2 pdfDocument];
    DataProvider = (CGDataProvider *)CGPDFDocumentGetDataProvider();
    CFDataRef v5 = CGDataProviderCopyData(DataProvider);
    return (NSData *)v5;
  }
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  if (self) {
    id v5 = [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] name];
  }
  else {
    id v5 = 0;
  }
  return +[NSString stringWithFormat:@"<%@:%p> name:'%@' uti:'%@' data:%@>", v4, self, v5, [(CUINamedData *)self utiType], [(CUINamedData *)self data]];
}

@end