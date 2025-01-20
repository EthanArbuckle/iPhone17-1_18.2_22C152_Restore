@interface AKFormFeature
+ (id)featureWithRect:(CGRect)a3 onPage:(id)a4;
- (AKFormFeature)initWithRect:(CGRect)a3 onPage:(id)a4;
- (AKPageController)page;
- (CGRect)rect;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setPage:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation AKFormFeature

+ (id)featureWithRect:(CGRect)a3 onPage:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithRect:onPage:", v9, x, y, width, height);

  return v10;
}

- (AKFormFeature)initWithRect:(CGRect)a3 onPage:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AKFormFeature;
  v10 = [(AKFormFeature *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_rect.origin.CGFloat x = x;
    v10->_rect.origin.CGFloat y = y;
    v10->_rect.size.CGFloat width = width;
    v10->_rect.size.CGFloat height = height;
    objc_storeWeak((id *)&v10->_page, v9);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)objc_opt_class() allocWithZone:a3];
  CGSize size = self->_rect.size;
  *(CGPoint *)(v4 + 16) = self->_rect.origin;
  *(CGSize *)(v4 + 32) = size;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_storeWeak((id *)(v4 + 8), WeakRetained);

  return (id)v4;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  objc_msgSend(v3, "appendFormat:", @"frame = (%g %g; %g %g); ",
    *(void *)&self->_rect.origin.x,
    *(void *)&self->_rect.origin.y,
    *(void *)&self->_rect.size.width,
    *(void *)&self->_rect.size.height);
  [v3 appendFormat:@"page = %@>", WeakRetained];

  return v3;
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (AKPageController)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (AKPageController *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end