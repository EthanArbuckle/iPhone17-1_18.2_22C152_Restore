@interface CUIThemeSchemaLayer
+ (id)layerWithRenditions:(id)a3 name:(id)a4 index:(unint64_t)a5;
- (CUIThemeSchemaLayer)initWithRenditions:(id)a3 name:(id)a4 index:(unint64_t)a5;
- (NSArray)renditions;
- (NSString)name;
- (double)translateFromWidthsOrHeightsToLeftsOrTops:(id)a3 leftsOrTops:(id *)a4;
- (id)description;
- (unint64_t)index;
- (void)calculateColumLefts:(id *)a3 rowTops:(id *)a4 totalSize:(CGSize *)a5 forPartFeatures:(unint64_t)a6;
- (void)dealloc;
- (void)setIndex:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setRenditions:(id)a3;
@end

@implementation CUIThemeSchemaLayer

- (CUIThemeSchemaLayer)initWithRenditions:(id)a3 name:(id)a4 index:(unint64_t)a5
{
  v11.receiver = self;
  v11.super_class = (Class)CUIThemeSchemaLayer;
  v8 = [(CUIThemeSchemaLayer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CUIThemeSchemaLayer *)v8 setRenditions:a3];
    [(CUIThemeSchemaLayer *)v9 setName:a4];
    [(CUIThemeSchemaLayer *)v9 setIndex:a5];
  }
  return v9;
}

- (void)dealloc
{
  [(CUIThemeSchemaLayer *)self setRenditions:0];
  [(CUIThemeSchemaLayer *)self setName:0];
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaLayer;
  [(CUIThemeSchemaLayer *)&v3 dealloc];
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaLayer;
  return objc_msgSend(-[CUIThemeSchemaLayer description](&v3, sel_description), "stringByAppendingFormat:", @"\rName: %@\rIndex: %d\rRenditions: %@", -[CUIThemeSchemaLayer name](self, "name"), -[CUIThemeSchemaLayer index](self, "index"), -[NSArray description](-[CUIThemeSchemaLayer renditions](self, "renditions"), "description"));
}

+ (id)layerWithRenditions:(id)a3 name:(id)a4 index:(unint64_t)a5
{
  id v5 = [objc_alloc((Class)a1) initWithRenditions:a3 name:a4 index:a5];
  return v5;
}

- (double)translateFromWidthsOrHeightsToLeftsOrTops:(id)a3 leftsOrTops:(id *)a4
{
  uint64_t v6 = (uint64_t)[a3 count];
  v7 = +[NSMutableArray arrayWithCapacity:v6];
  if (v6 < 1)
  {
    double v10 = 0.0;
  }
  else
  {
    uint64_t v9 = 0;
    double v10 = 0.0;
    do
    {
      *(float *)&double v8 = v10;
      [(NSMutableArray *)v7 addObject:+[NSNumber numberWithFloat:v8]];
      objc_msgSend(objc_msgSend(a3, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v9)), "floatValue");
      double v8 = v11;
      double v10 = v10 + v8;
      ++v9;
    }
    while (v6 != v9);
  }
  *a4 = v7;
  return v10;
}

- (void)calculateColumLefts:(id *)a3 rowTops:(id *)a4 totalSize:(CGSize *)a5 forPartFeatures:(unint64_t)a6
{
  double v8 = +[NSMutableDictionary dictionaryWithCapacity:2];
  uint64_t v9 = +[NSMutableDictionary dictionaryWithCapacity:2];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v28 = self;
  double v10 = [(CUIThemeSchemaLayer *)self renditions];
  id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v15 renditionCoordinatesForPartFeatures:a6];
        double v17 = v16;
        double v19 = v18;
        v20 = (CGImage *)objc_msgSend(objc_msgSend(v15, "referenceImage"), "image");
        v21 = +[NSNumber numberWithInteger:(uint64_t)v17];
        if (![(NSMutableDictionary *)v8 objectForKey:v21])
        {
          double Width = (double)CGImageGetWidth(v20);
          *(float *)&double Width = Width;
          [(NSMutableDictionary *)v8 setObject:+[NSNumber numberWithFloat:Width] forKey:v21];
        }
        v23 = +[NSNumber numberWithInteger:(uint64_t)v19];
        if (![(NSMutableDictionary *)v9 objectForKey:v23])
        {
          double Height = (double)CGImageGetHeight(v20);
          *(float *)&double Height = Height;
          [(NSMutableDictionary *)v9 setObject:+[NSNumber numberWithFloat:Height] forKey:v23];
        }
      }
      id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v12);
  }
  v33 = 0;
  [(CUIThemeSchemaLayer *)v28 translateFromWidthsOrHeightsToLeftsOrTops:v8 leftsOrTops:&v33];
  CGFloat v26 = v25;
  v32 = 0;
  [(CUIThemeSchemaLayer *)v28 translateFromWidthsOrHeightsToLeftsOrTops:v9 leftsOrTops:&v32];
  *a3 = v33;
  *a4 = v32;
  a5->width = v26;
  a5->height = v27;
}

- (NSArray)renditions
{
  return self->_renditions;
}

- (void)setRenditions:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end