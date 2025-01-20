@interface CUINamedRecognitionObject
- (CUINamedRecognitionObject)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5;
- (NSData)objectData;
- (id)description;
- (id)referenceOriginTransformation;
- (int64_t)version;
@end

@implementation CUINamedRecognitionObject

- (CUINamedRecognitionObject)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CUINamedRecognitionObject;
  v5 = [(CUINamedLookup *)&v7 initWithName:a3 usingRenditionKey:a4 fromTheme:a5];
  if ((id)[(CUIThemeRendition *)[(CUINamedLookup *)v5 _rendition] type] != (id)1014)
  {

    return 0;
  }
  return v5;
}

- (int64_t)version
{
  return [(CUIThemeRendition *)[(CUINamedLookup *)self _rendition] objectVersion];
}

- (NSData)objectData
{
  v2 = [(CUINamedLookup *)self _rendition];
  return (NSData *)[(CUIThemeRendition *)v2 data];
}

- (id)referenceOriginTransformation
{
  id v1 = [a1 _rendition];
  return [v1 transformation];
}

- (id)description
{
  v20.receiver = self;
  v20.super_class = (Class)CUINamedRecognitionObject;
  id v3 = [(CUINamedRecognitionObject *)&v20 description];
  v4 = +[NSString stringWithFormat:@"\tColumns:\n"];
  [(CUINamedRecognitionObject *)self referenceOriginTransformation];
  uint64_t v5 = 0;
  long long v16 = v6;
  long long v17 = v7;
  long long v18 = v8;
  long long v19 = v9;
  v10 = (float *)&v16 + 2;
  do
  {
    double v11 = *(v10 - 2);
    double v12 = *(v10 - 1);
    float v13 = *v10;
    float v14 = v10[1];
    v10 += 4;
    v4 = +[NSString stringWithFormat:@"%@\t\t[%lu] = %f, %f, %f, %f\n", v4, v5++, *(void *)&v11, *(void *)&v12, v13, v14, v16, v17, v18, v19];
  }
  while (v5 != 4);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\n%@", v3, +[NSString stringWithFormat:@"Name: %@\nVersion: %ld\nTransformation: \n%@", [(CUINamedLookup *)self name], [(CUINamedRecognitionObject *)self version], v4]);
}

@end