@interface CUIThemeSchemaPSDLayerGroup
- (BOOL)isStart;
- (id)description;
- (void)setIsStart:(BOOL)a3;
@end

@implementation CUIThemeSchemaPSDLayerGroup

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIThemeSchemaPSDLayerGroup;
  return objc_msgSend(-[CUIThemeSchemaPSDLayer description](&v3, sel_description), "stringByAppendingFormat:", @"\risStart: %d", -[CUIThemeSchemaPSDLayerGroup isStart](self, "isStart"));
}

- (BOOL)isStart
{
  return self->isStart;
}

- (void)setIsStart:(BOOL)a3
{
  self->isStart = a3;
}

@end