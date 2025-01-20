@interface FBASimpleTextNoticeController
- (FBASimpleTextNoticeController)init;
- (UILabel)fbaNameLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)setFbaNameLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation FBASimpleTextNoticeController

- (FBASimpleTextNoticeController)init
{
  v3.receiver = self;
  v3.super_class = (Class)FBASimpleTextNoticeController;
  return [(FBASimpleTextNoticeController *)&v3 init];
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)FBASimpleTextNoticeController;
  [(FBASimpleTextNoticeController *)&v11 viewDidLoad];
  objc_super v3 = +[UIColor systemBackgroundColor];
  v4 = [(FBASimpleTextNoticeController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = +[UIColor labelColor];
  v6 = [(FBASimpleTextNoticeController *)self fbaNameLabel];
  [v6 setTextColor:v5];

  v7 = +[UIColor labelColor];
  v8 = [(FBASimpleTextNoticeController *)self titleLabel];
  [v8 setTextColor:v7];

  v9 = +[UIColor labelColor];
  v10 = [(FBASimpleTextNoticeController *)self subtitleLabel];
  [v10 setTextColor:v9];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)FBASimpleTextNoticeController;
  [(FBASimpleTextNoticeController *)&v14 viewDidLayoutSubviews];
  objc_super v3 = [(FBASimpleTextNoticeController *)self titleLabel];

  if (v3)
  {
    v4 = [(FBASimpleTextNoticeController *)self titleLabel];
    [v4 frame];
    double v6 = v5;
    v7 = [(FBASimpleTextNoticeController *)self titleLabel];
    [v7 setPreferredMaxLayoutWidth:v6];
  }
  v8 = [(FBASimpleTextNoticeController *)self subtitleLabel];

  if (v8)
  {
    v9 = [(FBASimpleTextNoticeController *)self subtitleLabel];
    [v9 frame];
    double v11 = v10;
    v12 = [(FBASimpleTextNoticeController *)self subtitleLabel];
    [v12 setPreferredMaxLayoutWidth:v11];
  }
  v13 = [(FBASimpleTextNoticeController *)self view];
  [v13 layoutIfNeeded];
}

- (UILabel)fbaNameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fbaNameLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFbaNameLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_subtitleLabel);
  objc_destroyWeak((id *)&self->_titleLabel);

  objc_destroyWeak((id *)&self->_fbaNameLabel);
}

@end