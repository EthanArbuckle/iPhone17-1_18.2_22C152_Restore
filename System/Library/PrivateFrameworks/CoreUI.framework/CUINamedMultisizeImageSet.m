@interface CUINamedMultisizeImageSet
- (CUINamedMultisizeImageSet)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (id)debugDescription;
- (id)sizeIndexes;
@end

@implementation CUINamedMultisizeImageSet

- (CUINamedMultisizeImageSet)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CUINamedMultisizeImageSet;
  v6 = [(CUINamedLookup *)&v14 initWithName:a3 usingRenditionKey:a4 fromTheme:a5];
  if ((id)[(CUIThemeRendition *)[(CUINamedLookup *)v6 _rendition] type] != (id)1010)
  {
    _CUILog(4, (uint64_t)"CoreUI: attempting to lookup a named image multisize image set '%@' buts its a '%d' instead", v7, v8, v9, v10, v11, v12, (uint64_t)a3);

    return 0;
  }
  return v6;
}

- (id)sizeIndexes
{
  v2 = [(CUINamedLookup *)self _rendition];
  return [(CUIThemeRendition *)v2 sizeIndexes];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)CUINamedMultisizeImageSet;
  return objc_msgSend(-[CUINamedMultisizeImageSet debugDescription](&v3, sel_debugDescription), "stringByAppendingString:", objc_msgSend(-[CUINamedMultisizeImageSet sizeIndexes](self, "sizeIndexes"), "debugDescription"));
}

@end