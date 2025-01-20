@interface MessageListCellLabel
- (id)layout;
- (void)drawTextInRect:(CGRect)a3;
- (void)setAttributedText:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation MessageListCellLabel

- (void)setAttributedText:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(MessageListCellLabel *)self attributedText],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isEqualToAttributedString:v4],
        v5,
        (v6 & 1) == 0))
  {
    [(MessageListCellLabel *)self setLayout:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)MessageListCellLabel;
  [(MessageListCellLabel *)&v7 setAttributedText:v4];
}

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = [(MessageListCellLabel *)self attributedText];
  id v8 = objc_alloc_init(MEMORY[0x1E4FB0860]);
  [v8 setCachesLayout:1];
  [v8 setLayout:self->_layout];
  objc_msgSend(v10, "drawWithRect:options:context:", 33, v8, x, y, width, height);
  v9 = [v8 layout];
  [(MessageListCellLabel *)self setLayout:v9];
}

- (void)setLayout:(id)a3
{
}

- (id)layout
{
  return self->_layout;
}

- (void).cxx_destruct
{
}

@end