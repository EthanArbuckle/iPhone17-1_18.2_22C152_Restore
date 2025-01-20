@interface CKActionMenuItem
+ (id)itemWithImageTemplate:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5 target:(id)a6 action:(SEL)a7;
+ (void)animate:(id)a3 completion:(id)a4;
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CKActionMenuItem)init;
- (CKActionMenuItem)initWithView:(id)a3 label:(id)a4 target:(id)a5 action:(SEL)a6;
- (CKActionMenuItemView)label;
- (CKActionMenuItemView)view;
- (SEL)action;
- (id)description;
- (id)target;
- (void)sendAction;
- (void)setAction:(SEL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTarget:(id)a3;
- (void)setView:(id)a3;
- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4;
@end

@implementation CKActionMenuItem

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CKActionMenuItem;
  v4 = [(CKActionMenuItem *)&v8 description];
  v5 = NSStringFromSelector([(CKActionMenuItem *)self action]);
  v6 = [v3 stringWithFormat:@"%@ action: %@ enabled: %d highlighted: %d selected: %d", v4, v5, -[CKActionMenuItem isEnabled](self, "isEnabled"), -[CKActionMenuItem isHighlighted](self, "isHighlighted"), -[CKActionMenuItem isSelected](self, "isSelected")];

  return v6;
}

+ (id)itemWithImageTemplate:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5 target:(id)a6 action:(SEL)a7
{
  id v11 = a3;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  if ([v11 renderingMode] != 2)
  {
    uint64_t v15 = [v11 imageWithRenderingMode:2];

    id v11 = (id)v15;
  }
  v16 = [[CKActionMenuItemImageView alloc] initWithImage:v11 tintColor:v14 highlightedTintColor:v13];

  v17 = (void *)[objc_alloc((Class)objc_opt_class()) initWithView:v16 label:0 target:v12 action:a7];

  return v17;
}

- (CKActionMenuItem)initWithView:(id)a3 label:(id)a4 target:(id)a5 action:(SEL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKActionMenuItem;
  id v13 = [(CKActionMenuItem *)&v20 init];
  id v14 = v13;
  if (v13)
  {
    [(CKActionMenuItem *)v13 setView:v10];
    [(CKActionMenuItem *)v14 setLabel:v11];
    [(CKActionMenuItem *)v14 setTarget:v12];
    [(CKActionMenuItem *)v14 setAction:a6];
    v14->_enabled = 1;
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v10, "setEnabled:animated:", -[CKActionMenuItem isEnabled](v14, "isEnabled"), 0);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v10, "setHighlighted:animated:", -[CKActionMenuItem isHighlighted](v14, "isHighlighted"), 0);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v10, "setSelected:animated:", -[CKActionMenuItem isSelected](v14, "isSelected"), 0);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v11, "setEnabled:animated:", -[CKActionMenuItem isEnabled](v14, "isEnabled"), 0);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v11, "setHighlighted:animated:", -[CKActionMenuItem isHighlighted](v14, "isHighlighted"), 0);
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v11, "setSelected:animated:", -[CKActionMenuItem isSelected](v14, "isSelected"), 0);
    }
    uint64_t v15 = [v11 layer];
    LODWORD(v16) = 0.75;
    [v15 setShadowOpacity:v16];

    v17 = [v11 layer];
    objc_msgSend(v17, "setShadowOffset:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

    v18 = [v11 layer];
    [v18 setShadowRadius:3.0];
  }
  return v14;
}

- (CKActionMenuItem)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = [NSString stringWithUTF8String:"-[CKActionMenuItem init]"];
  [v3 raise:v4, @"Don't call %@. Use the designated initializer instead.", v5 format];

  return 0;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_enabled != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_enabled = a3;
    id v8 = [(CKActionMenuItem *)self view];
    if (objc_opt_respondsToSelector()) {
      [v8 setEnabled:v5 animated:v4];
    }
    v7 = [(CKActionMenuItem *)self label];
    if (objc_opt_respondsToSelector()) {
      [v7 setEnabled:v5 animated:v4];
    }
  }
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlighted != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_highlighted = a3;
    id v8 = [(CKActionMenuItem *)self view];
    if (objc_opt_respondsToSelector()) {
      [v8 setHighlighted:v5 animated:v4];
    }
    v7 = [(CKActionMenuItem *)self label];
    if (objc_opt_respondsToSelector()) {
      [v7 setHighlighted:v5 animated:v4];
    }
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_selected != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_selected = a3;
    id v8 = [(CKActionMenuItem *)self view];
    if (objc_opt_respondsToSelector()) {
      [v8 setSelected:v5 animated:v4];
    }
    v7 = [(CKActionMenuItem *)self label];
    if (objc_opt_respondsToSelector()) {
      [v7 setSelected:v5 animated:v4];
    }
  }
}

- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)(a3 - 1) < 2)
  {
    BOOL v6 = a4;
    uint64_t v7 = 1;
LABEL_6:
    [(CKActionMenuItem *)self setHighlighted:v6 animated:v7];
    return;
  }
  if (a3 != 3)
  {
    if (a3 != 4) {
      return;
    }
    BOOL v6 = 0;
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  [(CKActionMenuItem *)self setHighlighted:0 animated:1];
  if (v4)
  {
    [(CKActionMenuItem *)self sendAction];
  }
}

- (void)sendAction
{
  if ([(CKActionMenuItem *)self action])
  {
    id v5 = [MEMORY[0x1E4F42738] sharedApplication];
    v3 = [(CKActionMenuItem *)self action];
    BOOL v4 = [(CKActionMenuItem *)self target];
    [v5 sendAction:v3 to:v4 from:self forEvent:0];
  }
}

+ (void)animate:(id)a3 completion:(id)a4
{
}

- (CKActionMenuItemView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
}

- (CKActionMenuItemView)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_target, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end