@interface AVTAttributeCollectionViewCell
+ (id)cellIdentifier;
- (AVTAttributeValueView)valueView;
- (CGRect)frameForAttributeView;
- (UIView)attributeView;
- (id)discardableContentHandler;
- (void)discardContent;
- (void)prepareForReuse;
- (void)setAttributeView:(id)a3;
- (void)setDiscardableContentHandler:(id)a3;
@end

@implementation AVTAttributeCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTAttributeCollectionViewCell";
}

- (AVTAttributeValueView)valueView
{
  v3 = [(AVTAttributeCollectionViewCell *)self attributeView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v5 = [(AVTAttributeCollectionViewCell *)self attributeView];
  }
  else
  {
    v5 = 0;
  }
  return (AVTAttributeValueView *)v5;
}

- (void)setAttributeView:(id)a3
{
  p_attributeView = (id *)&self->_attributeView;
  id v7 = a3;
  if (*p_attributeView != v7) {
    objc_storeStrong((id *)&self->_attributeView, a3);
  }
  [(AVTAttributeCollectionViewCell *)self frameForAttributeView];
  objc_msgSend(*p_attributeView, "setFrame:");
  [*p_attributeView setAutoresizingMask:18];
  v6 = [(AVTAttributeCollectionViewCell *)self contentView];
  [v6 addSubview:*p_attributeView];
}

- (CGRect)frameForAttributeView
{
  v2 = [(AVTAttributeCollectionViewCell *)self contentView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)prepareForReuse
{
  double v3 = [(AVTAttributeCollectionViewCell *)self attributeView];
  double v4 = [v3 superview];
  double v5 = [(AVTAttributeCollectionViewCell *)self contentView];

  if (v4 == v5)
  {
    double v6 = [(AVTAttributeCollectionViewCell *)self attributeView];
    [v6 removeFromSuperview];
  }
  v7.receiver = self;
  v7.super_class = (Class)AVTAttributeCollectionViewCell;
  [(AVTAttributeCollectionViewCell *)&v7 prepareForReuse];
}

- (void)discardContent
{
  double v3 = [(AVTAttributeCollectionViewCell *)self valueView];
  [v3 discardContent];

  id discardableContentHandler = self->discardableContentHandler;
  if (discardableContentHandler)
  {
    double v5 = (void (*)(void))*((void *)discardableContentHandler + 2);
    v5();
  }
}

- (id)discardableContentHandler
{
  return self->discardableContentHandler;
}

- (void)setDiscardableContentHandler:(id)a3
{
}

- (UIView)attributeView
{
  return self->_attributeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeView, 0);
  objc_storeStrong(&self->discardableContentHandler, 0);
}

@end