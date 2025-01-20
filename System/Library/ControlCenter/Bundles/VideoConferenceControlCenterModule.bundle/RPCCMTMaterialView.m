@interface RPCCMTMaterialView
+ (id)materialViewWithRecipe:(int64_t)a3;
- (BOOL)hasInoperativeAppearance;
- (BOOL)isHighlighted;
- (RPCCMTMaterialView)initWithRecipe:(int64_t)a3;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)setHasInoperativeAppearance:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation RPCCMTMaterialView

+ (id)materialViewWithRecipe:(int64_t)a3
{
  v3 = [[RPCCMTMaterialView alloc] initWithRecipe:a3];

  return v3;
}

- (RPCCMTMaterialView)initWithRecipe:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RPCCMTMaterialView;
  v4 = [(RPCCMTMaterialView *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [sub_2C8DC() materialViewWithRecipe:a3];
    opaqueObj = v4->opaqueObj;
    v4->opaqueObj = (MTMaterialView *)v5;

    [(RPCCMTMaterialView *)v4 addSubview:v4->opaqueObj];
  }
  return v4;
}

- (BOOL)isHighlighted
{
  return [(MTMaterialView *)self->opaqueObj isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)hasInoperativeAppearance
{
  return [(MTMaterialView *)self->opaqueObj hasInoperativeAppearance];
}

- (void)setHasInoperativeAppearance:(BOOL)a3
{
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  v3 = [(MTMaterialView *)self->opaqueObj visualStylingProviderForCategory:a3];
  v4 = [[RPCCMTVisualStylingProvider alloc] initWithProvider:v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end