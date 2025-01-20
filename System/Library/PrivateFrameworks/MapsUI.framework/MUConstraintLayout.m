@interface MUConstraintLayout
- (MUConstraintLayout)initWithInternal:(id)a3;
- (MUConstraintLayoutInternal)internal;
- (NSArray)layoutConstraints;
- (NSArray)layoutGuides;
- (UIView)viewForForwardingSetNeedsUpdateConstraints;
- (int64_t)mode;
- (void)activate;
- (void)deactivate;
- (void)prepare;
- (void)setMode:(int64_t)a3;
- (void)setViewForForwardingSetNeedsUpdateConstraints:(id)a3;
@end

@implementation MUConstraintLayout

- (MUConstraintLayoutInternal)internal
{
  return self->_internal;
}

- (MUConstraintLayout)initWithInternal:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MUConstraintLayout;
    v6 = [(MUConstraintLayout *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_internal, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (void)activate
{
}

- (NSArray)layoutConstraints
{
  return [(MUConstraintLayoutInternal *)self->_internal layoutConstraints];
}

- (NSArray)layoutGuides
{
  return [(MUConstraintLayoutInternal *)self->_internal layoutGuides];
}

- (int64_t)mode
{
  return [(MUConstraintLayoutInternal *)self->_internal mode];
}

- (void)setMode:(int64_t)a3
{
}

- (void)deactivate
{
}

- (void)prepare
{
}

- (UIView)viewForForwardingSetNeedsUpdateConstraints
{
  return [(MUConstraintLayoutInternal *)self->_internal viewForForwardingSetNeedsUpdateConstraints];
}

- (void)setViewForForwardingSetNeedsUpdateConstraints:(id)a3
{
}

@end