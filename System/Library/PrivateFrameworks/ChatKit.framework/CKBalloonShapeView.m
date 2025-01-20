@interface CKBalloonShapeView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGRect)frame;
- (CKBalloonDescriptor_t)descriptor;
- (CKBalloonShapeView)initWithCoder:(id)a3;
- (CKBalloonShapeView)initWithDescriptor:(CKBalloonDescriptor_t *)a3 imageGenerator:(id)a4;
- (CKBalloonShapeView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)setDescriptor:(CKBalloonDescriptor_t *)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation CKBalloonShapeView

- (CKBalloonDescriptor_t)descriptor
{
  v3 = &self->var0 + OBJC_IVAR___CKBalloonShapeView_descriptor;
  unint64_t v4 = *(unint64_t *)((char *)&self->var4 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  char v5 = *(&self->var5 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  BOOL v6 = *(&self->var9 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  BOOL v7 = *(&self->var10 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  BOOL v8 = *(&self->var11 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  BOOL v9 = *(&self->var12 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  *(_DWORD *)&retstr->var0 = *(_DWORD *)(&self->var0 + OBJC_IVAR___CKBalloonShapeView_descriptor);
  retstr->var4 = v4;
  retstr->var5 = v5;
  retstr->var6 = *(CKColor_t *)(v3 + 24);
  *(_OWORD *)&retstr->var7 = *(_OWORD *)(v3 + 56);
  retstr->var9 = v6;
  retstr->var10 = v7;
  retstr->var11 = v8;
  retstr->var12 = v9;
  return self;
}

- (void)setDescriptor:(CKBalloonDescriptor_t *)a3
{
  unint64_t var4 = a3->var4;
  char var5 = a3->var5;
  BOOL var9 = a3->var9;
  BOOL var10 = a3->var10;
  BOOL var11 = a3->var11;
  BOOL var12 = a3->var12;
  BOOL v9 = (char *)self + OBJC_IVAR___CKBalloonShapeView_descriptor;
  long long v10 = *(_OWORD *)&a3->var6.red;
  long long v11 = *(_OWORD *)&a3->var6.blue;
  long long v12 = *(_OWORD *)&a3->var7;
  *(_DWORD *)BOOL v9 = *(_DWORD *)&a3->var0;
  *((void *)v9 + 1) = var4;
  v9[16] = var5;
  *(_OWORD *)(v9 + 24) = v10;
  *(_OWORD *)(v9 + 40) = v11;
  *(_OWORD *)(v9 + 56) = v12;
  v9[72] = var9;
  v9[73] = var10;
  v9[74] = var11;
  v9[75] = var12;
  v13 = self;
  sub_18F79C71C();
}

- (CKBalloonShapeView)initWithDescriptor:(CKBalloonDescriptor_t *)a3 imageGenerator:(id)a4
{
  unint64_t var4 = a3->var4;
  char var5 = a3->var5;
  BOOL var9 = a3->var9;
  BOOL var10 = a3->var10;
  BOOL var11 = a3->var11;
  BOOL var12 = a3->var12;
  int v16 = *(_DWORD *)&a3->var0;
  unint64_t v17 = var4;
  char v18 = var5;
  CKColor_t var6 = a3->var6;
  long long v20 = *(_OWORD *)&a3->var7;
  BOOL v21 = var9;
  BOOL v22 = var10;
  BOOL v23 = var11;
  BOOL v24 = var12;
  long long v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E922C140);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_18F81DD50;
  sub_18EF3528C(0, (unint64_t *)&qword_1E922C110);
  *(void *)(v12 + 32) = sub_18F7B9FC0();
  sub_18F7B99E0();
  id v13 = objc_allocWithZone((Class)CKBalloonShapeView);
  v14 = (CKBalloonShapeView *)sub_18F79CD90((uint64_t)&v16, v12, (uint64_t (*)(uint64_t))sub_18F79EA2C, v11, 1.0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

- (UIEdgeInsets)alignmentRectInsets
{
  v2 = self;
  CKBalloonShapeView.alignmentRectInsets.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (CKBalloonShapeView)initWithCoder:(id)a3
{
  UIEdgeInsets result = (CKBalloonShapeView *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)CKBalloonShapeView;
  [(CKBalloonShapeView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)CKBalloonShapeView;
  double v7 = self;
  [(CKBalloonShapeView *)&v21 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v20.receiver = v7;
  v20.super_class = (Class)CKBalloonShapeView;
  -[CKBalloonShapeView setFrame:](&v20, sel_setFrame_, x, y, width, height);
  [(CKBalloonShapeView *)v7 frame];
  v23.origin.double x = v16;
  v23.origin.double y = v17;
  v23.size.double width = v18;
  v23.size.double height = v19;
  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  if (!CGRectEqualToRect(v22, v23)) {
    [(CKBalloonShapeView *)v7 setNeedsLayout];
  }
}

- (void)layoutSublayersOfLayer:(id)a3
{
  double v4 = (objc_class *)a3;
  *(void *)&v7._attr.refcount = self;
  id v5 = *(id *)&v7._attr.refcount;
  v7.super.isa = v4;
  CKBalloonShapeView.layoutSublayers(of:)(v7);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (sub_18F7B97E0() == 0xD000000000000011 && v4 == 0x800000018F89D100 || (sub_18F7BA700() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    objc_super v6 = self;
    CALayer v7 = (void *)sub_18F7B97A0();
    v9.receiver = v6;
    v9.super_class = (Class)CKBalloonShapeView;
    BOOL v5 = [(CKBalloonShapeView *)&v9 _shouldAnimatePropertyWithKey:v7];

    swift_bridgeObjectRelease();
  }
  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CKBalloonShapeView;
  double v2 = self;
  [(CKBalloonShapeView *)&v4 layoutSubviews];
  if ((*((unsigned char *)&v2->super.super._responderFlags + OBJC_IVAR___CKBalloonShapeView_drawingMode) & 1) == 0)
  {
    double v3 = (CKBalloonShapeView *)objc_retain(*(id *)((char *)&v2->super.super.super.isa
                                                 + OBJC_IVAR___CKBalloonShapeView_drawingMode));
    sub_18F79DB78(v3);

    double v2 = v3;
  }
}

- (CKBalloonShapeView)initWithFrame:(CGRect)a3
{
  CGRect result = (CKBalloonShapeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end