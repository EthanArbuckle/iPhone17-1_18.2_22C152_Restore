@interface DRPDropletContainerView
- (BOOL)isHidden;
- (CATransform3D)transform3D;
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)frame;
- (DRPDropletContainerView)initWithCoder:(id)a3;
- (DRPDropletContainerView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)boundaryOutsets;
- (UIView)contentView;
- (double)_continuousCornerRadius;
- (double)continuousCornerRadius;
- (unint64_t)boundaryEdges;
- (void)_removeAllRetargetableAnimations:(BOOL)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setVelocity:(id)a3 forKey:(id)a4;
- (void)layoutSubviews;
- (void)setBoundaryEdges:(unint64_t)a3;
- (void)setBoundaryOutsets:(UIEdgeInsets)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContentView:(id)a3;
- (void)setContinuousCornerRadius:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setTransform3D:(CATransform3D *)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation DRPDropletContainerView

- (DRPDropletContainerView)initWithFrame:(CGRect)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_boundaryEdges) = 0;
  v3 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets);
  long long v4 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  _OWORD *v3 = *MEMORY[0x263F834E8];
  v3[1] = v4;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_participantViews) = (Class)MEMORY[0x263F8EE78];
  v6.receiver = self;
  v6.super_class = (Class)DRPDropletContainerView;
  return -[DRPDropletContainerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (DRPDropletContainerView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_boundaryEdges) = 0;
  long long v4 = (_OWORD *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets);
  long long v5 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
  *long long v4 = *MEMORY[0x263F834E8];
  v4[1] = v5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_participantViews) = (Class)MEMORY[0x263F8EE78];
  id v6 = a3;

  result = (DRPDropletContainerView *)sub_24D149448();
  __break(1u);
  return result;
}

- (UIView)contentView
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  return (UIView *)*v2;
}

- (void)setContentView:(id)a3
{
  long long v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContainerView_contentView);
  swift_beginAccess();
  id v6 = *v5;
  *long long v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_24D125370(v6);
}

- (double)continuousCornerRadius
{
  [(DRPDropletContainerView *)self _continuousCornerRadius];
  return result;
}

- (void)setContinuousCornerRadius:(double)a3
{
}

- (double)_continuousCornerRadius
{
  v3.receiver = self;
  v3.super_class = (Class)DRPDropletContainerView;
  [(DRPDropletContainerView *)&v3 _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v3 = self;
  DRPDropletContainerView._continuousCornerRadius.setter();
}

- (unint64_t)boundaryEdges
{
  v2 = (unint64_t *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryEdges);
  swift_beginAccess();
  return *v2;
}

- (void)setBoundaryEdges:(unint64_t)a3
{
  long long v4 = self;
  DRPDropletContainerView.boundaryEdges.setter(a3);
}

- (UIEdgeInsets)boundaryOutsets
{
  v2 = (double *)((char *)self + OBJC_IVAR___DRPDropletContainerView_boundaryOutsets);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setBoundaryOutsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  id v7 = self;
  DRPDropletContainerView.boundaryOutsets.setter(top, left, bottom, right);
}

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)DRPDropletContainerView;
  [(DRPDropletContainerView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double v3 = self;
  DRPDropletContainerView.frame.setter();
}

- (CGRect)bounds
{
  v6.receiver = self;
  v6.super_class = (Class)DRPDropletContainerView;
  [(DRPDropletContainerView *)&v6 bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double v3 = self;
  DRPDropletContainerView.bounds.setter();
}

- (CGPoint)center
{
  v4.receiver = self;
  v4.super_class = (Class)DRPDropletContainerView;
  [(DRPDropletContainerView *)&v4 center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double v3 = self;
  DRPDropletContainerView.center.setter();
}

- (CGAffineTransform)transform
{
  v10.receiver = self;
  v10.super_class = (Class)DRPDropletContainerView;
  CGPoint result = (CGAffineTransform *)[(CGAffineTransform *)&v10 transform];
  long long v5 = v8;
  long long v6 = v9;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->tx;
  objc_super v4 = self;
  DRPDropletContainerView.transform.setter(v5);
}

- (BOOL)isHidden
{
  v3.receiver = self;
  v3.super_class = (Class)DRPDropletContainerView;
  return [(DRPDropletContainerView *)&v3 isHidden];
}

- (void)setHidden:(BOOL)a3
{
  objc_super v4 = self;
  DRPDropletContainerView.isHidden.setter(a3);
}

- (CATransform3D)transform3D
{
  v20.receiver = self;
  v20.super_class = (Class)DRPDropletContainerView;
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
  long long v3 = *(_OWORD *)&a3->m13;
  v8[0] = *(_OWORD *)&a3->m11;
  v8[1] = v3;
  long long v4 = *(_OWORD *)&a3->m23;
  v8[2] = *(_OWORD *)&a3->m21;
  v8[3] = v4;
  long long v5 = *(_OWORD *)&a3->m33;
  v8[4] = *(_OWORD *)&a3->m31;
  v8[5] = v5;
  long long v6 = *(_OWORD *)&a3->m43;
  v8[6] = *(_OWORD *)&a3->m41;
  v8[7] = v6;
  long long v7 = self;
  DRPDropletContainerView.transform3D.setter(v8);
}

- (void)_setVelocity:(id)a3 forKey:(id)a4
{
  if (!a3)
  {
    memset(v13, 0, sizeof(v13));
    id v11 = a4;
    long long v12 = self;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0;
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  id v6 = a4;
  long long v7 = self;
  swift_unknownObjectRetain();
  sub_24D149388();
  swift_unknownObjectRelease();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = sub_24D149268();
  uint64_t v10 = v9;

LABEL_6:
  DRPDropletContainerView._setVelocity(_:forKey:)((uint64_t)v13, v8, v10);

  swift_bridgeObjectRelease();
  sub_24D1276AC((uint64_t)v13, &qword_26B189550);
}

- (void)_removeAllRetargetableAnimations:(BOOL)a3
{
  long long v4 = self;
  DRPDropletContainerView._removeAllRetargetableAnimations(_:)(a3);
}

- (void)layoutSubviews
{
  double v2 = self;
  DRPDropletContainerView.layoutSubviews()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end