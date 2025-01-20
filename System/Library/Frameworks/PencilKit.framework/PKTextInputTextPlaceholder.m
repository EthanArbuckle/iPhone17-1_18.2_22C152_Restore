@interface PKTextInputTextPlaceholder
+ (PKTextInputTextPlaceholder)placeholderWithText:(id)a3 rects:(id)a4;
+ (PKTextInputTextPlaceholder)placeholderWithTextPlaceholder:(id)a3;
+ (PKTextInputTextPlaceholder)placeholderWithToken:(id)a3 frame:(CGRect)a4;
+ (PKTextInputTextPlaceholder)placeholderWithWebTextPlaceholder:(id)a3;
- (BOOL)shouldIgnoreOrigin;
- (NSArray)_rects;
- (id)placeholder;
- (id)rects;
- (void)setPlaceholder:(id)a3;
- (void)setShouldIgnoreOrigin:(BOOL)a3;
- (void)set_rects:(id)a3;
@end

@implementation PKTextInputTextPlaceholder

+ (PKTextInputTextPlaceholder)placeholderWithTextPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setPlaceholder:v4];

  return (PKTextInputTextPlaceholder *)v5;
}

+ (PKTextInputTextPlaceholder)placeholderWithWebTextPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setPlaceholder:v4];

  [v5 setShouldIgnoreOrigin:1];

  return (PKTextInputTextPlaceholder *)v5;
}

+ (PKTextInputTextPlaceholder)placeholderWithToken:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = objc_alloc_init((Class)a1);
  [v10 setPlaceholder:v9];

  v11 = [PKTextInputTextSelectionRect alloc];
  if (v11)
  {
    v16.receiver = v11;
    v16.super_class = (Class)PKTextInputTextSelectionRect;
    v12 = objc_msgSendSuper2(&v16, sel_init);
    v13 = v12;
    if (v12)
    {
      *((CGFloat *)v12 + 3) = x;
      *((CGFloat *)v12 + 4) = y;
      *((CGFloat *)v12 + 5) = width;
      *((CGFloat *)v12 + 6) = height;
    }
  }
  else
  {
    v13 = 0;
  }
  v17[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  objc_msgSend(v10, "set_rects:", v14);

  return (PKTextInputTextPlaceholder *)v10;
}

+ (PKTextInputTextPlaceholder)placeholderWithText:(id)a3 rects:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init((Class)a1);
  [v8 setPlaceholder:v7];

  objc_msgSend(v8, "set_rects:", v6);

  return (PKTextInputTextPlaceholder *)v8;
}

- (id)rects
{
  v3 = [(PKTextInputTextPlaceholder *)self _rects];

  if (v3)
  {
    id v4 = [(PKTextInputTextPlaceholder *)self _rects];
  }
  else
  {
    id v5 = [(PKTextInputTextPlaceholder *)self placeholder];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [(PKTextInputTextPlaceholder *)self placeholder];
      id v4 = [v7 rects];
    }
    else
    {
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v4;
}

- (id)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(id)a3
{
}

- (BOOL)shouldIgnoreOrigin
{
  return self->_shouldIgnoreOrigin;
}

- (void)setShouldIgnoreOrigin:(BOOL)a3
{
  self->_shouldIgnoreOrigin = a3;
}

- (NSArray)_rects
{
  return self->__rects;
}

- (void)set_rects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rects, 0);

  objc_storeStrong(&self->_placeholder, 0);
}

@end