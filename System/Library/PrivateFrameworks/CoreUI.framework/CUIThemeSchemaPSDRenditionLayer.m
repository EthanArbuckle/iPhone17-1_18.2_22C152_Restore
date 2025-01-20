@interface CUIThemeSchemaPSDRenditionLayer
- (CUIThemeSchemaRendition)rendition;
- (id)description;
- (void)dealloc;
- (void)setRendition:(id)a3;
@end

@implementation CUIThemeSchemaPSDRenditionLayer

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDRenditionLayer;
  return objc_msgSend(-[CUIThemeSchemaPSDLayer description](&v3, sel_description), "stringByAppendingFormat:", @"\rRendition: %@", -[CUIThemeSchemaRendition description](-[CUIThemeSchemaPSDRenditionLayer rendition](self, "rendition"), "description"));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDRenditionLayer;
  [(CUIThemeSchemaPSDLayer *)&v3 dealloc];
}

- (CUIThemeSchemaRendition)rendition
{
  return self->rendition;
}

- (void)setRendition:(id)a3
{
}

@end