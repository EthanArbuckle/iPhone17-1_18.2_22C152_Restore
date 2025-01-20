@interface _HKSectionedContextViewConfiguration
- (BOOL)bottomInsetsEnabled;
- (BOOL)horizontalInsetsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHorizontalInTwoOverlaysMode;
- (BOOL)topInsetsWithNoHeaderEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBottomInsetsEnabled:(BOOL)a3;
- (void)setHorizontalInsetsEnabled:(BOOL)a3;
- (void)setIsHorizontalInTwoOverlaysMode:(BOOL)a3;
- (void)setTopInsetsWithNoHeaderEnabled:(BOOL)a3;
@end

@implementation _HKSectionedContextViewConfiguration

- (BOOL)isEqual:(id)a3
{
  v4 = (_HKSectionedContextViewConfiguration *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      LOBYTE(v9) = 1;
      goto LABEL_8;
    }
    BOOL v6 = [(_HKSectionedContextViewConfiguration *)v4 isHorizontalInTwoOverlaysMode];
    if (v6 == [(_HKSectionedContextViewConfiguration *)self isHorizontalInTwoOverlaysMode])
    {
      BOOL v7 = [(_HKSectionedContextViewConfiguration *)v5 bottomInsetsEnabled];
      if (v7 == [(_HKSectionedContextViewConfiguration *)self bottomInsetsEnabled])
      {
        BOOL v8 = [(_HKSectionedContextViewConfiguration *)v5 horizontalInsetsEnabled];
        if (v8 == [(_HKSectionedContextViewConfiguration *)self horizontalInsetsEnabled])
        {
          BOOL v11 = [(_HKSectionedContextViewConfiguration *)v5 topInsetsWithNoHeaderEnabled];
          int v9 = v11 ^ [(_HKSectionedContextViewConfiguration *)self topInsetsWithNoHeaderEnabled] ^ 1;
          goto LABEL_8;
        }
      }
    }
  }
  LOBYTE(v9) = 0;
LABEL_8:

  return v9;
}

- (unint64_t)hash
{
  return self->_bottomInsetsEnabled ^ self->_isHorizontalInTwoOverlaysMode ^ self->_horizontalInsetsEnabled ^ self->_topInsetsWithNoHeaderEnabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(_HKSectionedContextViewConfiguration);
  [(_HKSectionedContextViewConfiguration *)v4 setIsHorizontalInTwoOverlaysMode:[(_HKSectionedContextViewConfiguration *)self isHorizontalInTwoOverlaysMode]];
  [(_HKSectionedContextViewConfiguration *)v4 setBottomInsetsEnabled:[(_HKSectionedContextViewConfiguration *)self bottomInsetsEnabled]];
  [(_HKSectionedContextViewConfiguration *)v4 setHorizontalInsetsEnabled:[(_HKSectionedContextViewConfiguration *)self horizontalInsetsEnabled]];
  [(_HKSectionedContextViewConfiguration *)v4 setTopInsetsWithNoHeaderEnabled:[(_HKSectionedContextViewConfiguration *)self topInsetsWithNoHeaderEnabled]];
  return v4;
}

- (BOOL)isHorizontalInTwoOverlaysMode
{
  return self->_isHorizontalInTwoOverlaysMode;
}

- (void)setIsHorizontalInTwoOverlaysMode:(BOOL)a3
{
  self->_isHorizontalInTwoOverlaysMode = a3;
}

- (BOOL)bottomInsetsEnabled
{
  return self->_bottomInsetsEnabled;
}

- (void)setBottomInsetsEnabled:(BOOL)a3
{
  self->_bottomInsetsEnabled = a3;
}

- (BOOL)horizontalInsetsEnabled
{
  return self->_horizontalInsetsEnabled;
}

- (void)setHorizontalInsetsEnabled:(BOOL)a3
{
  self->_horizontalInsetsEnabled = a3;
}

- (BOOL)topInsetsWithNoHeaderEnabled
{
  return self->_topInsetsWithNoHeaderEnabled;
}

- (void)setTopInsetsWithNoHeaderEnabled:(BOOL)a3
{
  self->_topInsetsWithNoHeaderEnabled = a3;
}

@end