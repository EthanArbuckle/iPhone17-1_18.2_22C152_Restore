@interface ControlsGalleryManager.IconViewProvider
- (BOOL)isIconViewRecycled:(id)a3;
- (id)dequeueReusableIconViewOfClass:(Class)a3;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
- (void)recycleIconView:(id)a3;
@end

@implementation ControlsGalleryManager.IconViewProvider

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
  uint64_t v6 = MEMORY[0x24C5D11D0](self->iconViewDelegate, a2);
  id v7 = a3;
  id v8 = a4;
  swift_retain();
  objc_msgSend(v7, sel_setDelegate_, v6);

  swift_release();
  swift_unknownObjectRelease();
}

@end