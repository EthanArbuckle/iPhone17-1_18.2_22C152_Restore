@interface CUIThemeSchemaPSDLayer
- (NSString)name;
- (id)description;
- (void)dealloc;
- (void)setName:(id)a3;
@end

@implementation CUIThemeSchemaPSDLayer

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDLayer;
  return objc_msgSend(-[CUIThemeSchemaPSDLayer description](&v3, sel_description), "stringByAppendingFormat:", @"\rName: %@", -[CUIThemeSchemaPSDLayer name](self, "name"));
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDLayer;
  [(CUIThemeSchemaPSDLayer *)&v3 dealloc];
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
}

@end