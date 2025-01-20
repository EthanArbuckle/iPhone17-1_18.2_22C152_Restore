@interface GKStaticRenderContentView
- (UIView)contentView;
- (id)description;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)prepareToReuseSubviewsOfView:(id)a3;
- (void)setContentView:(id)a3;
- (void)setNeedsLayout;
@end

@implementation GKStaticRenderContentView

- (id)description
{
  v2 = NSString;
  v3 = [(UIView *)self->_contentView recursiveDescription];
  v4 = [v2 stringWithFormat:@"DETACHED: %@", v3];

  return v4;
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  if (self->_contentView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)*p_contentView setBackgroundColor:0];
    [(UIView *)*p_contentView setOpaque:0];
    [(GKStaticRenderContentView *)self addSubview:*p_contentView];
    [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:1];
    v5 = v7;
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)GKStaticRenderContentView;
  [(GKStaticRenderContentView *)&v3 layoutSubviews];
  [(GKStaticRenderContentView *)self bounds];
  -[UIView setFrame:](self->_contentView, "setFrame:");
  [(UIView *)self->_contentView updateConstraintsIfNeeded];
  [(UIView *)self->_contentView layoutIfNeeded];
  [(GKStaticRenderContentView *)self setNeedsDisplay];
}

- (void)setNeedsLayout
{
  v3.receiver = self;
  v3.super_class = (Class)GKStaticRenderContentView;
  [(GKStaticRenderContentView *)&v3 setNeedsLayout];
  [(UIView *)self->_contentView setNeedsLayout];
}

- (void)prepareToReuseSubviewsOfView:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 prepareForReuse];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(v4, "subviews", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(GKStaticRenderContentView *)self prepareToReuseSubviewsOfView:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)prepareForReuse
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end