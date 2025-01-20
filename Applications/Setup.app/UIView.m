@interface UIView
- (double)buddy_heightForContainerWidth:(double)a3 ratio:(double)a4;
- (id)buddy_scaleHeightTo:(double)a3 ratio:(double)a4;
- (id)buddy_scaleWidthTo:(double)a3 ratio:(double)a4;
- (void)buddy_setSemanticContentAttributeRecursively:(int64_t)a3;
@end

@implementation UIView

- (void)buddy_setSemanticContentAttributeRecursively:(int64_t)a3
{
  v11 = self;
  SEL v10 = a2;
  int64_t v9 = a3;
  memset(__b, 0, sizeof(__b));
  v3 = [(UIView *)v11 subviews];
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:__b objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(id *)(__b[1] + 8 * i);
        [v8 buddy_setSemanticContentAttributeRecursively:v9];
      }
      id v4 = [(NSArray *)v3 countByEnumeratingWithState:__b objects:v12 count:16];
    }
    while (v4);
  }

  [(UIView *)v11 setSemanticContentAttribute:v9];
}

- (id)buddy_scaleHeightTo:(double)a3 ratio:(double)a4
{
  [(UIView *)self bounds];
  [(UIView *)self bounds];
  uint64_t v14 = v4;
  uint64_t v13 = v5;
  uint64_t v16 = v6;
  uint64_t v15 = v7;
  sub_10011706C();
  -[UIView setBounds:](self, "setBounds:", v8, v9, v10, v11, *(void *)&v8, *(void *)&v9, *(void *)&v10, *(void *)&v11, *(void *)&v8, *(void *)&v9, *(void *)&v10, *(void *)&v11, v13, v14, v15, v16);
  return self;
}

- (id)buddy_scaleWidthTo:(double)a3 ratio:(double)a4
{
  [(UIView *)self bounds];
  [(UIView *)self bounds];
  uint64_t v14 = v4;
  uint64_t v13 = v5;
  uint64_t v16 = v6;
  uint64_t v15 = v7;
  sub_10011706C();
  -[UIView setBounds:](self, "setBounds:", v8, v9, v10, v11, *(void *)&v8, *(void *)&v9, *(void *)&v10, *(void *)&v11, *(void *)&v8, *(void *)&v9, *(void *)&v10, *(void *)&v11, v13, v14, v15, v16);
  return self;
}

- (double)buddy_heightForContainerWidth:(double)a3 ratio:(double)a4
{
  [(UIView *)self bounds];
  [(UIView *)self bounds];
  sub_10011706C();
  return v4;
}

@end