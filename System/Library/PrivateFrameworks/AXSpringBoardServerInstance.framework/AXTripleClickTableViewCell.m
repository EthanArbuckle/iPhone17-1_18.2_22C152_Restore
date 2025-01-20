@interface AXTripleClickTableViewCell
- (AXTripleClickTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation AXTripleClickTableViewCell

- (AXTripleClickTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AXTripleClickTableViewCell;
  v4 = [(AXTripleClickTableViewCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(AXTripleClickTableViewCell *)v4 textLabel];
    v7 = UISystemFontBoldForSize();
    [v6 setFont:v7];

    v8 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    topLine = v5->_topLine;
    v5->_topLine = v8;

    v10 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.37];
    [(UIView *)v5->_topLine setBackgroundColor:v10];

    [(AXTripleClickTableViewCell *)v5 addSubview:v5->_topLine];
    v11 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    bottomLine = v5->_bottomLine;
    v5->_bottomLine = v11;

    v13 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.15];
    [(UIView *)v5->_bottomLine setBackgroundColor:v13];

    [(AXTripleClickTableViewCell *)v5 addSubview:v5->_bottomLine];
    v14 = v5;
  }

  return v5;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AXTripleClickTableViewCell;
  [(AXTripleClickTableViewCell *)&v7 layoutSubviews];
  topLine = self->_topLine;
  [(AXTripleClickTableViewCell *)self frame];
  -[UIView setFrame:](topLine, "setFrame:", 0.0, 0.0);
  bottomLine = self->_bottomLine;
  [(AXTripleClickTableViewCell *)self frame];
  double v6 = v5 + -1.0;
  [(AXTripleClickTableViewCell *)self frame];
  -[UIView setFrame:](bottomLine, "setFrame:", 0.0, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomLine, 0);
  objc_storeStrong((id *)&self->_topLine, 0);
}

@end