@interface CKMentionSuggestionAccessoryCell
+ (id)reuseIdentifier;
+ (id)supplementryViewKind;
- (CKMentionSuggestionAccessoryCell)initWithFrame:(CGRect)a3;
- (UIView)separatorView;
- (void)layoutSubviews;
- (void)setSeparatorView:(id)a3;
@end

@implementation CKMentionSuggestionAccessoryCell

+ (id)supplementryViewKind
{
  return @"CKMentionsSuggestionAccessoryCellKind";
}

+ (id)reuseIdentifier
{
  return @"CKMentionsSuggestionAccessoryReuseIdentifier";
}

- (CKMentionSuggestionAccessoryCell)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CKMentionSuggestionAccessoryCell;
  v3 = -[CKMentionSuggestionAccessoryCell initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F427D8] effectWithStyle:8];
    id v5 = objc_alloc(MEMORY[0x1E4F43028]);
    v6 = [MEMORY[0x1E4F42FE8] effectForBlurEffect:v4 style:7];
    v7 = (void *)[v5 initWithEffect:v6];

    v8 = [v7 contentView];
    v9 = +[CKUIBehavior sharedBehaviors];
    v10 = [v9 theme];
    v11 = [v10 paddleSeparatorColor];
    [v8 setBackgroundColor:v11];

    [(CKMentionSuggestionAccessoryCell *)v3 addSubview:v7];
    [(CKMentionSuggestionAccessoryCell *)v3 setSeparatorView:v7];
  }
  return v3;
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CKMentionSuggestionAccessoryCell;
  [(CKMentionSuggestionAccessoryCell *)&v19 layoutSubviews];
  [(CKMentionSuggestionAccessoryCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v11 = +[CKUIBehavior sharedBehaviors];
  [v11 paddleDividerInset];
  CGFloat v13 = v12;
  v20.origin.double x = v4;
  v20.origin.double y = v6;
  v20.size.double width = v8;
  v20.size.double height = v10;
  CGRect v21 = CGRectInset(v20, 0.0, v13);
  double x = v21.origin.x;
  double y = v21.origin.y;
  double width = v21.size.width;
  double height = v21.size.height;

  v18 = [(CKMentionSuggestionAccessoryCell *)self separatorView];
  objc_msgSend(v18, "setFrame:", x, y, width, height);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end