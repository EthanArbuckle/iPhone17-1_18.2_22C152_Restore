@interface SiriPronunciationItemCell
+ (double)defaultCellHeight;
+ (id)_buttonPlayImage;
+ (id)_buttonStopImage;
+ (id)_flatImageFromSnippetBundleNamed:(id)a3;
- (BOOL)showingPlaying;
- (NSString)confirmTitle;
- (NSString)playTitle;
- (SiriPronunciationItemCell)initWithFrame:(CGRect)a3;
- (id)confirmHandler;
- (id)playHandler;
- (void)_confirmButtonTapped:(id)a3;
- (void)_playButtonTapped:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setConfirmHandler:(id)a3;
- (void)setConfirmTitle:(id)a3;
- (void)setPlayHandler:(id)a3;
- (void)setPlayTitle:(id)a3;
- (void)setShowingPlaying:(BOOL)a3;
@end

@implementation SiriPronunciationItemCell

+ (double)defaultCellHeight
{
  v2 = +[UIScreen mainScreen];
  [v2 scale];

  return 44.0;
}

+ (id)_flatImageFromSnippetBundleNamed:(id)a3
{
  id v3 = a3;
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = +[UIImage imageNamed:v3 inBundle:v4];

  v6 = +[UIColor whiteColor];
  v7 = [v5 _flatImageWithColor:v6];

  return v7;
}

+ (id)_buttonPlayImage
{
  return [a1 _flatImageFromSnippetBundleNamed:@"stroked-circle-play"];
}

+ (id)_buttonStopImage
{
  return [a1 _flatImageFromSnippetBundleNamed:@"stroked-circle-stop"];
}

- (SiriPronunciationItemCell)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SiriPronunciationItemCell;
  id v3 = -[SiriPronunciationItemCell initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[SiriPronunciationItemCell _buttonPlayImage];
    [v4 size];
    v5 = +[UIScreen mainScreen];
    [v5 scale];
    if (v6 >= 2.0) {
      double v7 = 0.5;
    }
    else {
      double v7 = 1.0;
    }

    double v8 = SiriUIPlatterStyle[32];
    double v9 = SiriUIPlatterStyle[34];
    uint64_t v10 = +[UIButton buttonWithType:1];
    playButton = v3->_playButton;
    v3->_playButton = (UIButton *)v10;

    [(UIButton *)v3->_playButton addTarget:v3 action:"_playButtonTapped:" forControlEvents:64];
    [(UIButton *)v3->_playButton setImage:v4 forState:0];
    -[UIButton setImageEdgeInsets:](v3->_playButton, "setImageEdgeInsets:", -1.0, v8, 1.0, 0.0);
    [(UIButton *)v3->_playButton setContentHorizontalAlignment:1];
    -[UIButton setTitleEdgeInsets:](v3->_playButton, "setTitleEdgeInsets:", -v7, v8 + 11.0, v7, 5.0);
    v12 = v3->_playButton;
    v13 = +[UIColor siriui_textColor];
    [(UIButton *)v12 setTintColor:v13];

    [(SiriPronunciationItemCell *)v3 addSubview:v3->_playButton];
    uint64_t v14 = +[UIButton buttonWithType:1];
    confirmButton = v3->_confirmButton;
    v3->_confirmButton = (UIButton *)v14;

    [(UIButton *)v3->_confirmButton addTarget:v3 action:"_confirmButtonTapped:" forControlEvents:64];
    [(UIButton *)v3->_confirmButton setContentHorizontalAlignment:2];
    -[UIButton setTitleEdgeInsets:](v3->_confirmButton, "setTitleEdgeInsets:", -v7, 0.0, v7, v9);
    v16 = v3->_confirmButton;
    v17 = +[UIColor siriui_textColor];
    [(UIButton *)v16 setTintColor:v17];

    [(SiriPronunciationItemCell *)v3 addSubview:v3->_confirmButton];
  }
  return v3;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)SiriPronunciationItemCell;
  [(SiriPronunciationItemCell *)&v33 layoutSubviews];
  [(SiriPronunciationItemCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = round(v7 / 1.62 + v7 / 1.62) * 0.5;
  if ((SiriUIIsCompactWidth() & 1) == 0) {
    double v11 = v11 + (v8 - v11) / 3.0;
  }
  v12 = +[UIScreen mainScreen];
  [v12 scale];
  BOOL v14 = v13 < 2.0;
  double v15 = ceil(v4);
  double v16 = ceil(v6);
  double v17 = ceil(v11);
  double v18 = ceil(v10);
  double v31 = v16;
  double v32 = v18;
  if (v14) {
    double v19 = v18;
  }
  else {
    double v19 = v10;
  }
  if (v14) {
    double v11 = v17;
  }
  if (v14) {
    double v20 = v16;
  }
  else {
    double v20 = v6;
  }
  if (v14) {
    double v21 = v15;
  }
  else {
    double v21 = v4;
  }

  -[UIButton setFrame:](self->_playButton, "setFrame:", v21, v20, v11, v19);
  v34.origin.x = v21;
  v34.origin.y = v20;
  v34.size.width = v11;
  v34.size.height = v19;
  double MaxX = CGRectGetMaxX(v34);
  v35.origin.x = v4;
  v35.origin.y = v6;
  v35.size.width = v8;
  v35.size.height = v10;
  double v23 = CGRectGetMaxX(v35);
  v36.origin.x = MaxX;
  v36.origin.y = v6;
  v36.size.width = v8;
  v36.size.height = v10;
  double v24 = v23 - CGRectGetMinX(v36);
  v25 = +[UIScreen mainScreen];
  [v25 scale];
  BOOL v27 = v26 < 2.0;
  double v28 = ceil(MaxX);
  double v29 = ceil(v24);
  if (v27) {
    double v30 = v28;
  }
  else {
    double v30 = MaxX;
  }
  if (v27) {
    double v6 = v31;
  }
  if (v27) {
    double v24 = v29;
  }
  if (v27) {
    double v10 = v32;
  }

  -[UIButton setFrame:](self->_confirmButton, "setFrame:", v30, v6, v24, v10);
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)SiriPronunciationItemCell;
  [(SiriPronunciationItemCell *)&v5 prepareForReuse];
  [(UIButton *)self->_playButton setTitle:0 forState:0];
  id playHandler = self->_playHandler;
  self->_id playHandler = 0;

  [(UIButton *)self->_confirmButton setTitle:0 forState:0];
  id confirmHandler = self->_confirmHandler;
  self->_id confirmHandler = 0;
}

- (void)setShowingPlaying:(BOOL)a3
{
  if (self->_showingPlaying != a3)
  {
    self->_showingPlaying = a3;
    if (a3) {
      +[SiriPronunciationItemCell _buttonStopImage];
    }
    else {
    id v4 = +[SiriPronunciationItemCell _buttonPlayImage];
    }
    [(UIButton *)self->_playButton setImage:v4 forState:0];
  }
}

- (void)setPlayTitle:(id)a3
{
}

- (NSString)playTitle
{
  return [(UIButton *)self->_playButton titleForState:0];
}

- (void)setConfirmTitle:(id)a3
{
}

- (NSString)confirmTitle
{
  return [(UIButton *)self->_confirmButton titleForState:0];
}

- (void)_playButtonTapped:(id)a3
{
  id playHandler = (void (**)(void))self->_playHandler;
  if (playHandler) {
    playHandler[2]();
  }
}

- (void)_confirmButtonTapped:(id)a3
{
  id confirmHandler = (void (**)(void))self->_confirmHandler;
  if (confirmHandler) {
    confirmHandler[2]();
  }
}

- (BOOL)showingPlaying
{
  return self->_showingPlaying;
}

- (id)playHandler
{
  return self->_playHandler;
}

- (void)setPlayHandler:(id)a3
{
}

- (id)confirmHandler
{
  return self->_confirmHandler;
}

- (void)setConfirmHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_confirmHandler, 0);
  objc_storeStrong(&self->_playHandler, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);

  objc_storeStrong((id *)&self->_playButton, 0);
}

@end