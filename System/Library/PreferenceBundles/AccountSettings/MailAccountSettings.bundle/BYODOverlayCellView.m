@interface BYODOverlayCellView
+ (id)log;
- (BYODOverlayCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)noteLabel;
- (void)setNote:(id)a3;
- (void)setNoteLabel:(id)a3;
@end

@implementation BYODOverlayCellView

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_59388;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7498 != -1) {
    dispatch_once(&qword_D7498, block);
  }
  v2 = (void *)qword_D7490;

  return v2;
}

- (BYODOverlayCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)BYODOverlayCellView;
  v7 = [(BYODOverlayCellView *)&v32 initWithStyle:a3 reuseIdentifier:v6];
  if (v7)
  {
    v8 = +[UIColor systemBackgroundColor];
    [(BYODOverlayCellView *)v7 setBackgroundColor:v8];

    [(BYODOverlayCellView *)v7 setSelectionStyle:0];
    uint64_t v9 = [(BYODOverlayCellView *)v7 textLabel];
    noteLabel = v7->_noteLabel;
    v7->_noteLabel = (UILabel *)v9;

    [(UILabel *)v7->_noteLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v7->_noteLabel setTextAlignment:1];
    v11 = v7->_noteLabel;
    v12 = +[UIColor systemGrayColor];
    [(UILabel *)v11 setTextColor:v12];

    v13 = v7->_noteLabel;
    +[UIFont systemMinimumFontSize];
    v14 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)v7->_noteLabel setLineBreakMode:0];
    [(UILabel *)v7->_noteLabel setNumberOfLines:0];
    v15 = [(UILabel *)v7->_noteLabel topAnchor];
    v16 = [(BYODOverlayCellView *)v7 contentView];
    v17 = [v16 topAnchor];
    v18 = [v15 constraintEqualToAnchor:v17 constant:0.0];
    [v18 setActive:1];

    v19 = [(UILabel *)v7->_noteLabel bottomAnchor];
    v20 = [(BYODOverlayCellView *)v7 contentView];
    v21 = [v20 bottomAnchor];
    v22 = [v19 constraintEqualToAnchor:v21 constant:0.0];
    [v22 setActive:1];

    v23 = [(UILabel *)v7->_noteLabel leadingAnchor];
    v24 = [(BYODOverlayCellView *)v7 contentView];
    v25 = [v24 leadingAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:0.0];
    [v26 setActive:1];

    v27 = [(UILabel *)v7->_noteLabel trailingAnchor];
    v28 = [(BYODOverlayCellView *)v7 contentView];
    v29 = [v28 trailingAnchor];
    v30 = [v27 constraintEqualToAnchor:v29 constant:0.0];
    [v30 setActive:1];
  }
  return v7;
}

- (void)setNote:(id)a3
{
}

- (UILabel)noteLabel
{
  return self->_noteLabel;
}

- (void)setNoteLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end