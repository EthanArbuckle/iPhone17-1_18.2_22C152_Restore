@interface IKTextBadgeAttachment
- (IKBadgeElement)badge;
- (IKColor)tintColor;
- (IKTextBadgeAttachment)initWithBadgeElement:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation IKTextBadgeAttachment

- (IKTextBadgeAttachment)initWithBadgeElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IKTextBadgeAttachment;
  v5 = [(IKTextBadgeAttachment *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_badge, v4);
  }

  return v6;
}

- (IKBadgeElement)badge
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badge);
  return (IKBadgeElement *)WeakRetained;
}

- (IKColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_destroyWeak((id *)&self->_badge);
}

@end