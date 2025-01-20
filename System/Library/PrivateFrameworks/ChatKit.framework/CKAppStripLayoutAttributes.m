@interface CKAppStripLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)showsBorder;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)appStripSize;
- (void)setAppStripSize:(int64_t)a3;
- (void)setShowsBorder:(BOOL)a3;
@end

@implementation CKAppStripLayoutAttributes

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    id v7 = v4;
    int v8 = [v7 showsBorder];
    if (v8 == [(CKAppStripLayoutAttributes *)self showsBorder]
      && (uint64_t v9 = [v7 appStripSize], v9 == -[CKAppStripLayoutAttributes appStripSize](self, "appStripSize")))
    {
      v11.receiver = self;
      v11.super_class = (Class)CKAppStripLayoutAttributes;
      BOOL v6 = [(UICollectionViewLayoutAttributes *)&v11 isEqual:v7];
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKAppStripLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setShowsBorder:", -[CKAppStripLayoutAttributes showsBorder](self, "showsBorder"));
  objc_msgSend(v4, "setAppStripSize:", -[CKAppStripLayoutAttributes appStripSize](self, "appStripSize"));
  return v4;
}

- (int64_t)appStripSize
{
  return self->_appStripSize;
}

- (void)setAppStripSize:(int64_t)a3
{
  self->_appStripSize = a3;
}

- (BOOL)showsBorder
{
  return self->_showsBorder;
}

- (void)setShowsBorder:(BOOL)a3
{
  self->_showsBorder = a3;
}

@end