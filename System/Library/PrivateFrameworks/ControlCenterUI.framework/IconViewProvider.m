@interface IconViewProvider
- (BOOL)isIconViewRecycled:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)recycleIconView:(id)a3;
@end

@implementation IconViewProvider

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id v3 = objc_msgSend(*(id *)self->iconViewMap, sel_dequeueReusableViewOfClass_, a3);

  return v3;
}

- (void)recycleIconView:(id)a3
{
}

- (BOOL)isIconViewRecycled:(id)a3
{
  return objc_msgSend(*(id *)self->iconViewMap, sel_isViewRecycled_, a3);
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  swift_retain();
  sub_1D7B72E34(v5);

  swift_release();
}

@end