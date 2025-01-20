@interface DropletParticipantView
- (BOOL)isHidden;
- (CATransform3D)transform3D;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)frame;
- (_TtC9DropletUI22DropletParticipantView)initWithCoder:(id)a3;
- (_TtC9DropletUI22DropletParticipantView)initWithFrame:(CGRect)a3;
- (double)alpha;
- (void)_removeAllRetargetableAnimations:(BOOL)a3;
- (void)_setVelocity:(id)a3 forKey:(id)a4;
- (void)removeFromSuperview;
- (void)setAlpha:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setTransform3D:(CATransform3D *)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation DropletParticipantView

- (_TtC9DropletUI22DropletParticipantView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24D148774();
}

- (CGRect)frame
{
  sub_24D14675C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_24D14675C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGPoint)center
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DropletParticipantView();
  [(DropletParticipantView *)&v4 center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  sub_24D146C88(x, y);
}

- (CGAffineTransform)transform
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DropletParticipantView();
  CGPoint result = (CGAffineTransform *)[(CGAffineTransform *)&v10 transform];
  long long v5 = v8;
  long long v6 = v9;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v12 = *(_OWORD *)&a3->c;
  long long v13 = *(_OWORD *)&a3->a;
  tdouble x = a3->tx;
  tdouble y = a3->ty;
  long long v6 = (objc_class *)type metadata accessor for DropletParticipantView();
  v15.receiver = self;
  v15.super_class = v6;
  long long v7 = self;
  [(DropletParticipantView *)&v15 transform];
  long long v16 = v19;
  long long v17 = v20;
  long long v18 = v21;
  v14.receiver = v7;
  v14.super_class = v6;
  long long v19 = v13;
  long long v20 = v12;
  *(CGFloat *)&long long v21 = tx;
  *((CGFloat *)&v21 + 1) = ty;
  [(DropletParticipantView *)&v14 setTransform:&v19];
  [(DropletParticipantView *)v7 transform];
  if ((sub_24D149338() & 1) != 0
    || (long long v8 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews),
        swift_beginAccess(),
        uint64_t v9 = *v8,
        (uint64_t v10 = *(void *)(v9 + 16)) == 0))
  {
  }
  else
  {
    uint64_t v11 = v9 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_24D1471C4(v11, v7);
      v11 += 8;
      --v10;
    }
    while (v10);

    swift_bridgeObjectRelease();
  }
}

- (CATransform3D)transform3D
{
  v20.receiver = self;
  v20.super_class = (Class)type metadata accessor for DropletParticipantView();
  CGPoint result = (CATransform3D *)[(CATransform3D *)&v20 transform3D];
  long long v5 = v13;
  long long v6 = v14;
  long long v7 = v15;
  long long v8 = v16;
  long long v9 = v17;
  long long v10 = v18;
  long long v11 = v19;
  *(_OWORD *)&retstr->m11 = v12;
  *(_OWORD *)&retstr->m13 = v5;
  *(_OWORD *)&retstr->m21 = v6;
  *(_OWORD *)&retstr->m23 = v7;
  *(_OWORD *)&retstr->m31 = v8;
  *(_OWORD *)&retstr->m33 = v9;
  *(_OWORD *)&retstr->m41 = v10;
  *(_OWORD *)&retstr->m43 = v11;
  return result;
}

- (void)setTransform3D:(CATransform3D *)a3
{
  long long v27 = *(_OWORD *)&a3->m13;
  long long v28 = *(_OWORD *)&a3->m11;
  long long v25 = *(_OWORD *)&a3->m23;
  long long v26 = *(_OWORD *)&a3->m21;
  long long v23 = *(_OWORD *)&a3->m33;
  long long v24 = *(_OWORD *)&a3->m31;
  long long v22 = *(_OWORD *)&a3->m41;
  CGFloat m43 = a3->m43;
  CGFloat m44 = a3->m44;
  long long v6 = (objc_class *)type metadata accessor for DropletParticipantView();
  v39.receiver = self;
  v39.super_class = v6;
  long long v7 = self;
  [(DropletParticipantView *)&v39 transform3D];
  long long v34 = *(_OWORD *)&a.m13;
  long long v35 = *(_OWORD *)&a.m11;
  long long v32 = *(_OWORD *)&a.m23;
  long long v33 = *(_OWORD *)&a.m21;
  long long v30 = *(_OWORD *)&a.m33;
  long long v31 = *(_OWORD *)&a.m31;
  long long v29 = *(_OWORD *)&a.m41;
  CGFloat v8 = a.m43;
  CGFloat v9 = a.m44;
  v37.receiver = v7;
  v37.super_class = v6;
  *(_OWORD *)&a.m11 = v28;
  *(_OWORD *)&a.m13 = v27;
  *(_OWORD *)&a.m21 = v26;
  *(_OWORD *)&a.m23 = v25;
  *(_OWORD *)&a.m31 = v24;
  *(_OWORD *)&a.m33 = v23;
  *(_OWORD *)&a.m41 = v22;
  a.CGFloat m43 = m43;
  a.CGFloat m44 = m44;
  [(DropletParticipantView *)&v37 setTransform3D:&a];
  [(DropletParticipantView *)v7 transform3D];
  long long v10 = *(_OWORD *)&a.m11;
  long long v11 = *(_OWORD *)&a.m13;
  long long v12 = *(_OWORD *)&a.m21;
  long long v13 = *(_OWORD *)&a.m23;
  long long v14 = *(_OWORD *)&a.m31;
  long long v15 = *(_OWORD *)&a.m33;
  long long v16 = *(_OWORD *)&a.m41;
  long long v17 = *(_OWORD *)&a.m43;
  *(_OWORD *)&a.m11 = v35;
  *(_OWORD *)&a.m13 = v34;
  *(_OWORD *)&a.m21 = v33;
  *(_OWORD *)&a.m23 = v32;
  *(_OWORD *)&a.m31 = v31;
  *(_OWORD *)&a.m33 = v30;
  *(_OWORD *)&a.m41 = v29;
  a.CGFloat m43 = v8;
  a.CGFloat m44 = v9;
  *(_OWORD *)&b.m11 = v10;
  *(_OWORD *)&b.m13 = v11;
  *(_OWORD *)&b.m21 = v12;
  *(_OWORD *)&b.m23 = v13;
  *(_OWORD *)&b.m31 = v14;
  *(_OWORD *)&b.m33 = v15;
  *(_OWORD *)&b.m41 = v16;
  *(_OWORD *)&b.CGFloat m43 = v17;
  if (CATransform3DEqualToTransform(&a, &b)
    || (long long v18 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews),
        swift_beginAccess(),
        uint64_t v19 = *v18,
        (uint64_t v20 = *(void *)(v19 + 16)) == 0))
  {
  }
  else
  {
    uint64_t v21 = v19 + 32;
    swift_bridgeObjectRetain();
    do
    {
      sub_24D1476F8(v21, v7);
      v21 += 8;
      --v20;
    }
    while (v20);

    swift_bridgeObjectRelease();
  }
}

- (double)alpha
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DropletParticipantView();
  [(DropletParticipantView *)&v3 alpha];
  return result;
}

- (void)setAlpha:(double)a3
{
  long long v5 = (objc_class *)type metadata accessor for DropletParticipantView();
  v17.receiver = self;
  v17.super_class = v5;
  long long v6 = self;
  [(DropletParticipantView *)&v17 alpha];
  double v8 = v7;
  v16.receiver = v6;
  v16.super_class = v5;
  [(DropletParticipantView *)&v16 setAlpha:a3];
  [(DropletParticipantView *)v6 alpha];
  if (v9 == v8
    || (long long v10 = (char *)v6 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews,
        swift_beginAccess(),
        (uint64_t v11 = *(void *)(*(void *)v10 + 16)) == 0))
  {
  }
  else
  {
    uint64_t v12 = *(void *)v10 + 32;
    swift_bridgeObjectRetain();
    long long v13 = (void *)MEMORY[0x263F8EED0];
    do
    {
      uint64_t v14 = MEMORY[0x25331EC50](v12);
      if (v14)
      {
        long long v15 = (void *)v14;
        [(DropletParticipantView *)v6 alpha];
        (*(void (**)(_TtC9DropletUI22DropletParticipantView *))((*v13 & *v15) + 0xC0))(v6);
      }
      v12 += 8;
      --v11;
    }
    while (v11);

    swift_bridgeObjectRelease();
  }
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DropletParticipantView();
  return [(DropletParticipantView *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = (objc_class *)type metadata accessor for DropletParticipantView();
  v15.receiver = self;
  v15.super_class = v5;
  long long v6 = self;
  unsigned int v7 = [(DropletParticipantView *)&v15 isHidden];
  v14.receiver = v6;
  v14.super_class = v5;
  [(DropletParticipantView *)&v14 setHidden:v3];
  if (v7 == [(DropletParticipantView *)v6 isHidden]
    || (double v8 = (char *)v6 + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews,
        swift_beginAccess(),
        (uint64_t v9 = *(void *)(*(void *)v8 + 16)) == 0))
  {
  }
  else
  {
    uint64_t v10 = *(void *)v8 + 32;
    swift_bridgeObjectRetain();
    uint64_t v11 = (void *)MEMORY[0x263F8EED0];
    do
    {
      uint64_t v12 = (void *)MEMORY[0x25331EC50](v10);
      if (v12)
      {
        long long v13 = v12;
        (*(void (**)(_TtC9DropletUI22DropletParticipantView *, BOOL))((*v11 & *v12) + 0x110))(v6, [(DropletParticipantView *)v6 isHidden]);
      }
      v10 += 8;
      --v9;
    }
    while (v9);

    swift_bridgeObjectRelease();
  }
}

- (void)_setVelocity:(id)a3 forKey:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    unsigned int v7 = self;
    swift_unknownObjectRetain();
    sub_24D149388();
    swift_unknownObjectRelease();
    if (a4)
    {
LABEL_3:
      uint64_t v8 = sub_24D149268();
      uint64_t v10 = v9;

      goto LABEL_6;
    }
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    id v11 = a4;
    uint64_t v12 = self;
    if (a4) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  uint64_t v10 = 0;
LABEL_6:
  long long v13 = (char *)self + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews;
  swift_beginAccess();
  uint64_t v14 = *(void *)(*(void *)v13 + 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v13 + 32;
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v16 = MEMORY[0x25331EC50](v15);
      if (v16)
      {
        objc_super v17 = (void *)v16;
        sub_24D134760((uint64_t)v18, v8, v10);
      }
      v15 += 8;
      --v14;
    }
    while (v14);

    swift_bridgeObjectRelease();
  }
  else
  {
  }
  swift_bridgeObjectRelease();
  sub_24D1276AC((uint64_t)v18, &qword_26B189550);
}

- (void)_removeAllRetargetableAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews);
  swift_beginAccess();
  uint64_t v6 = *v5;
  uint64_t v7 = *(void *)(v6 + 16);
  if (v7)
  {
    uint64_t v8 = v6 + 32;
    uint64_t v9 = self;
    swift_bridgeObjectRetain();
    do
    {
      uint64_t v10 = (void *)MEMORY[0x25331EC50](v8);
      if (v10)
      {
        id v11 = v10;
        objc_msgSend(v10, sel__removeAllRetargetableAnimations_, v3);
      }
      v8 += 8;
      --v7;
    }
    while (v7);

    swift_bridgeObjectRelease();
  }
}

- (void)removeFromSuperview
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DropletParticipantView();
  double v2 = (char *)v9.receiver;
  [(DropletParticipantView *)&v9 removeFromSuperview];
  BOOL v3 = &v2[OBJC_IVAR____TtC9DropletUI22DropletParticipantView_trackingViews];
  swift_beginAccess();
  uint64_t v4 = *(void *)(*(void *)v3 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)v3 + 32;
    swift_bridgeObjectRetain();
    uint64_t v6 = (void *)MEMORY[0x263F8EED0];
    do
    {
      uint64_t v7 = (void *)MEMORY[0x25331EC50](v5);
      if (v7)
      {
        uint64_t v8 = v7;
        (*(void (**)(char *))((*v6 & *v7) + 0x128))(v2);
      }
      v5 += 8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  sub_24D148010();
}

- (_TtC9DropletUI22DropletParticipantView)initWithFrame:(CGRect)a3
{
  double result = (_TtC9DropletUI22DropletParticipantView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_24D12BF7C(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._layerRetained + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._subviewCache + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *(uint64_t *)((char *)&self->super._window + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType), *((unsigned char *)&self->super._gestureRecognizers + OBJC_IVAR____TtC9DropletUI22DropletParticipantView_keylineType));
  swift_bridgeObjectRelease();
}

@end