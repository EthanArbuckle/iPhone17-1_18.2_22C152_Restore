@interface SiriAcousticIdHeaderView
+ (double)defaultHeight;
- (BOOL)hasAlbumArtConstraint;
- (BOOL)hasConstraints;
- (BOOL)keylineHidden;
- (NSString)artistString;
- (NSString)songTitle;
- (NSURL)albumArt;
- (SKUIItemOfferButton)openButton;
- (SKUIPlayButton)playButton;
- (SiriAcousticIdHeaderView)initWithFrame:(CGRect)a3;
- (SiriAcousticIdHeaderViewDelegate)delegate;
- (SiriUIDownloadableImageView)albumArtImageView;
- (SiriUIKeyline)keyline;
- (UILabel)artistNameLabel;
- (UILabel)songTitleLabel;
- (double)desiredHeightForWidth:(double)a3;
- (int64_t)buttonLayout;
- (int64_t)playButtonItemIdentifier;
- (int64_t)playButtonState;
- (void)openButtonTapped:(id)a3;
- (void)playButtonTapped:(id)a3;
- (void)setAlbumArt:(id)a3;
- (void)setAlbumArtImageView:(id)a3;
- (void)setArtistNameLabel:(id)a3;
- (void)setArtistString:(id)a3;
- (void)setButtonLayout:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHasAlbumArtConstraint:(BOOL)a3;
- (void)setHasConstraints:(BOOL)a3;
- (void)setKeyline:(id)a3;
- (void)setKeylineHidden:(BOOL)a3;
- (void)setOpenButton:(id)a3;
- (void)setPlayButton:(id)a3;
- (void)setPlayButtonItemIdentifier:(int64_t)a3;
- (void)setPlayButtonProgress:(double)a3 animated:(BOOL)a4;
- (void)setPlayButtonState:(int64_t)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setSongTitle:(id)a3;
- (void)setSongTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation SiriAcousticIdHeaderView

- (SiriAcousticIdHeaderView)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)SiriAcousticIdHeaderView;
  v3 = -[SiriAcousticIdHeaderView initWithFrame:](&v32, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    albumArt = v3->_albumArt;
    v3->_albumArt = 0;

    uint64_t v6 = +[SiriSharedUIContentLabel labelWithMediumWeightRegularFont];
    songTitleLabel = v4->_songTitleLabel;
    v4->_songTitleLabel = (UILabel *)v6;

    [(UILabel *)v4->_songTitleLabel setNumberOfLines:2];
    [(UILabel *)v4->_songTitleLabel setLineBreakMode:4];
    [(UILabel *)v4->_songTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriAcousticIdHeaderView *)v4 addSubview:v4->_songTitleLabel];
    uint64_t v8 = +[SiriSharedUIContentLabel labelWithLightWeightSubtextFont];
    artistNameLabel = v4->_artistNameLabel;
    v4->_artistNameLabel = (UILabel *)v8;

    [(UILabel *)v4->_artistNameLabel setNumberOfLines:1];
    [(UILabel *)v4->_artistNameLabel setLineBreakMode:4];
    [(UILabel *)v4->_artistNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriAcousticIdHeaderView *)v4 addSubview:v4->_artistNameLabel];
    v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = (SKUIItemOfferButton *)objc_msgSend(objc_alloc((Class)SKUIItemOfferButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    openButton = v4->_openButton;
    v4->_openButton = v11;

    v13 = v4->_openButton;
    v14 = [v10 siriUILocalizedStringForKey:@"OPEN"];
    [(SKUIItemOfferButton *)v13 setTitle:v14];

    [(SKUIItemOfferButton *)v4->_openButton setFillStyle:0];
    v15 = v4->_openButton;
    v16 = +[UIColor siriui_textColor];
    [(SKUIItemOfferButton *)v15 setTintColor:v16];

    v17 = v4->_openButton;
    v18 = +[UIColor clearColor];
    [(SKUIItemOfferButton *)v17 setBackgroundColor:v18];

    [(SKUIItemOfferButton *)v4->_openButton setShowsConfirmationState:0];
    [(SKUIItemOfferButton *)v4->_openButton addTarget:v4 action:"openButtonTapped:" forControlEvents:64];
    [(SKUIItemOfferButton *)v4->_openButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriAcousticIdHeaderView *)v4 addSubview:v4->_openButton];
    [(SKUIItemOfferButton *)v4->_openButton sizeToFit];
    v19 = v4->_openButton;
    [(SKUIItemOfferButton *)v19 frame];
    v21 = +[NSLayoutConstraint constraintWithItem:v19 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v20];
    [(SiriAcousticIdHeaderView *)v4 addConstraint:v21];

    v22 = v4->_openButton;
    [(SKUIItemOfferButton *)v22 frame];
    v24 = +[NSLayoutConstraint constraintWithItem:v22 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v23];
    [(SiriAcousticIdHeaderView *)v4 addConstraint:v24];

    v25 = (SKUIPlayButton *)objc_alloc_init((Class)SKUIPlayButton);
    playButton = v4->_playButton;
    v4->_playButton = v25;

    v27 = v4->_playButton;
    v28 = +[UIColor siriui_textColor];
    [(SKUIPlayButton *)v27 setTintColor:v28];

    [(SKUIPlayButton *)v4->_playButton setBackgroundType:0];
    [(SKUIPlayButton *)v4->_playButton setStyle:1];
    [(SKUIPlayButton *)v4->_playButton sizeToFit];
    [(SKUIPlayButton *)v4->_playButton addTarget:v4 action:"playButtonTapped:" forControlEvents:64];
    [(SKUIPlayButton *)v4->_playButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriAcousticIdHeaderView *)v4 addSubview:v4->_playButton];
    uint64_t v29 = +[SiriUIKeyline keylineWithDefaultInsets];
    keyline = v4->_keyline;
    v4->_keyline = (SiriUIKeyline *)v29;

    [(SiriUIKeyline *)v4->_keyline setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SiriAcousticIdHeaderView *)v4 addSubview:v4->_keyline];
    [(SiriAcousticIdHeaderView *)v4 setNeedsUpdateConstraints];
  }
  return v4;
}

- (void)setAlbumArt:(id)a3
{
  id v11 = a3;
  v5 = [(SiriAcousticIdHeaderView *)self albumArt];
  unsigned __int8 v6 = [v5 isEqual:v11];

  if ((v6 & 1) == 0)
  {
    [(SiriUIDownloadableImageView *)self->_albumArtImageView removeFromSuperview];
    objc_storeStrong((id *)&self->_albumArt, a3);
    if (self->_albumArt)
    {
      id v7 = objc_alloc((Class)SiriUIDownloadableImageView);
      uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
      v9 = (SiriUIDownloadableImageView *)[v7 initWithImageURL:v11 placeHolderImageName:@"album-art-placeholder" placeHolderImageBundle:v8];
      albumArtImageView = self->_albumArtImageView;
      self->_albumArtImageView = v9;

      [(SiriUIDownloadableImageView *)self->_albumArtImageView setUserInteractionEnabled:0];
      [(SiriUIDownloadableImageView *)self->_albumArtImageView sizeToFit];
      [(SiriUIDownloadableImageView *)self->_albumArtImageView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SiriAcousticIdHeaderView *)self addSubview:self->_albumArtImageView];
      [(SiriAcousticIdHeaderView *)self setNeedsUpdateConstraints];
    }
  }
}

- (void)setSongTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_songTitle, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    songTitle = self->_songTitle;
    self->_songTitle = v4;

    [(UILabel *)self->_songTitleLabel setText:self->_songTitle];
  }
}

- (void)setArtistString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_artistString, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    artistString = self->_artistString;
    self->_artistString = v4;

    [(UILabel *)self->_artistNameLabel setText:self->_artistString];
  }
}

- (void)setButtonLayout:(int64_t)a3
{
  self->_buttonLayout = a3;
  if ((unint64_t)a3 <= 2)
  {
    uint64_t v4 = (3u >> (a3 & 7)) & 1;
    [(SKUIItemOfferButton *)self->_openButton setHidden:(a3 & 1) == 0];
    playButton = self->_playButton;
    [(SKUIPlayButton *)playButton setHidden:v4];
  }
}

- (void)setPlayButtonState:(int64_t)a3
{
  self->_playButtonState = a3;
  v5 = [(SKUIPlayButton *)self->_playButton superview];

  if (v5)
  {
    switch(a3)
    {
      case 2:
        playButton = self->_playButton;
        [(SKUIPlayButton *)playButton showPlayIndicator:0];
        break;
      case 1:
        [(SKUIPlayButton *)self->_playButton showPlayIndicator:1];
        uint64_t v8 = self->_playButton;
        -[SKUIPlayButton hideProgressAnimated:](v8, "hideProgressAnimated:");
        break;
      case 0:
        [(SKUIPlayButton *)self->_playButton showPlayIndicator:0];
        id v6 = self->_playButton;
        [(SKUIPlayButton *)v6 beginIndeterminateAnimation];
        break;
    }
  }
}

- (void)setPlayButtonProgress:(double)a3 animated:(BOOL)a4
{
  *(float *)&a3 = a3;
  [(SKUIPlayButton *)self->_playButton setProgress:a4 animated:a3];
}

- (BOOL)keylineHidden
{
  return [(SiriUIKeyline *)self->_keyline isHidden];
}

- (void)setKeylineHidden:(BOOL)a3
{
}

- (int64_t)playButtonItemIdentifier
{
  return (int64_t)[(SKUIPlayButton *)self->_playButton itemIdentifier];
}

- (void)setPlayButtonItemIdentifier:(int64_t)a3
{
}

- (void)openButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 headerViewOpenButtonWasTapped:self];
  }
}

- (void)playButtonTapped:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 headerViewPlayButtonWasTapped:self];
  }
}

- (void)updateConstraints
{
  v28.receiver = self;
  v28.super_class = (Class)SiriAcousticIdHeaderView;
  [(SiriAcousticIdHeaderView *)&v28 updateConstraints];
  v30[0] = &off_8670;
  v29[0] = @"albumArtWidth";
  v29[1] = @"snippetInsetL";
  double v3 = SiriUIPlatterStyle[32];
  uint64_t v4 = +[NSNumber numberWithDouble:v3];
  v30[1] = v4;
  v29[2] = @"snippetInsetR";
  double v5 = SiriUIPlatterStyle[34];
  char v6 = +[NSNumber numberWithDouble:v5];
  v30[2] = v6;
  v29[3] = @"songTitleLeadingMargin";
  id v7 = +[NSNumber numberWithDouble:v3 + 56.0 + 15.0];
  v30[3] = v7;
  v29[4] = @"playButtonTrailingMargin";
  uint64_t v8 = +[NSNumber numberWithDouble:v5];
  v30[4] = v8;
  v29[5] = @"openButtonTrailingMargin";
  v9 = +[NSNumber numberWithDouble:v5];
  v30[5] = v9;
  v29[6] = @"snippetInsetT";
  v10 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[31]];
  v30[6] = v10;
  v29[7] = @"snippetInsetB";
  id v11 = +[NSNumber numberWithDouble:SiriUIPlatterStyle[33]];
  v30[7] = v11;
  v30[8] = &off_8680;
  v29[8] = @"albumArtGutter";
  v29[9] = @"songInfoBaselineVerticalSpace";
  v30[9] = &off_8690;
  v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:10];

  if (!self->_hasConstraints)
  {
    v13 = _NSDictionaryOfVariableBindings(@"_openButton, _playButton, _songTitleLabel, _artistNameLabel, _keyline", self->_openButton, self->_playButton, self->_songTitleLabel, self->_artistNameLabel, self->_keyline, 0);
    v14 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-songTitleLeadingMargin-[_songTitleLabel]-[_openButton]-openButtonTrailingMargin-|", 0, v12, v13);
    [(SiriAcousticIdHeaderView *)self addConstraints:v14];

    v15 = +[NSLayoutConstraint constraintWithItem:self->_artistNameLabel attribute:5 relatedBy:0 toItem:self->_songTitleLabel attribute:5 multiplier:1.0 constant:0.0];
    [(SiriAcousticIdHeaderView *)self addConstraint:v15];

    v16 = +[NSLayoutConstraint constraintWithItem:self->_artistNameLabel attribute:7 relatedBy:0 toItem:self->_songTitleLabel attribute:7 multiplier:1.0 constant:0.0];
    [(SiriAcousticIdHeaderView *)self addConstraint:v16];

    v17 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_playButton]-playButtonTrailingMargin-|" options:0 metrics:v12 views:v13];
    [(SiriAcousticIdHeaderView *)self addConstraints:v17];

    v18 = +[NSLayoutConstraint constraintWithItem:self->_playButton attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [(SiriAcousticIdHeaderView *)self addConstraint:v18];

    v19 = +[NSLayoutConstraint constraintWithItem:self->_openButton attribute:10 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:0.0];
    [(SiriAcousticIdHeaderView *)self addConstraint:v19];

    double v20 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:[_songTitleLabel]-songInfoBaselineVerticalSpace-[_artistNameLabel]-(>=snippetInsetB)-|", 0, v12, v13);
    [(SiriAcousticIdHeaderView *)self addConstraints:v20];

    v21 = +[NSLayoutConstraint constraintWithItem:self->_songTitleLabel attribute:11 relatedBy:0 toItem:self attribute:10 multiplier:1.0 constant:-3.0];
    [(SiriAcousticIdHeaderView *)self addConstraint:v21];

    v22 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_keyline]|" options:0 metrics:v12 views:v13];
    [(SiriAcousticIdHeaderView *)self addConstraints:v22];

    double v23 = +[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_keyline]|" options:0 metrics:v12 views:v13];
    [(SiriAcousticIdHeaderView *)self addConstraints:v23];

    self->_hasConstraints = 1;
  }
  albumArtImageView = self->_albumArtImageView;
  if (albumArtImageView && !self->_hasAlbumArtConstraint)
  {
    v25 = _NSDictionaryOfVariableBindings(@"_albumArtImageView, _songTitleLabel", albumArtImageView, self->_songTitleLabel, 0);
    v26 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-snippetInsetL-[_albumArtImageView(==albumArtWidth)]", 0, v12, v25);
    [(SiriAcousticIdHeaderView *)self addConstraints:v26];

    v27 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-snippetInsetT-[_albumArtImageView(==albumArtWidth)]", 0, v12, v25);
    [(SiriAcousticIdHeaderView *)self addConstraints:v27];

    self->_hasAlbumArtConstraint = 1;
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriAcousticIdHeaderView;
  [(SiriAcousticIdHeaderView *)&v5 setSemanticContentAttribute:a3];
  uint64_t v4 = [(SiriAcousticIdHeaderView *)self constraints];
  [(SiriAcousticIdHeaderView *)self removeConstraints:v4];
  [(SiriAcousticIdHeaderView *)self addConstraints:v4];
}

+ (double)defaultHeight
{
  return SiriUIPlatterStyle[31] + 56.0 + SiriUIPlatterStyle[33];
}

- (double)desiredHeightForWidth:(double)a3
{
  +[SiriAcousticIdHeaderView defaultHeight];
  return result;
}

- (NSURL)albumArt
{
  return self->_albumArt;
}

- (NSString)songTitle
{
  return self->_songTitle;
}

- (NSString)artistString
{
  return self->_artistString;
}

- (int64_t)buttonLayout
{
  return self->_buttonLayout;
}

- (int64_t)playButtonState
{
  return self->_playButtonState;
}

- (SiriAcousticIdHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriAcousticIdHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriUIDownloadableImageView)albumArtImageView
{
  return self->_albumArtImageView;
}

- (void)setAlbumArtImageView:(id)a3
{
}

- (UILabel)songTitleLabel
{
  return self->_songTitleLabel;
}

- (void)setSongTitleLabel:(id)a3
{
}

- (UILabel)artistNameLabel
{
  return self->_artistNameLabel;
}

- (void)setArtistNameLabel:(id)a3
{
}

- (SKUIItemOfferButton)openButton
{
  return self->_openButton;
}

- (void)setOpenButton:(id)a3
{
}

- (SKUIPlayButton)playButton
{
  return self->_playButton;
}

- (void)setPlayButton:(id)a3
{
}

- (SiriUIKeyline)keyline
{
  return self->_keyline;
}

- (void)setKeyline:(id)a3
{
}

- (BOOL)hasConstraints
{
  return self->_hasConstraints;
}

- (void)setHasConstraints:(BOOL)a3
{
  self->_hasConstraints = a3;
}

- (BOOL)hasAlbumArtConstraint
{
  return self->_hasAlbumArtConstraint;
}

- (void)setHasAlbumArtConstraint:(BOOL)a3
{
  self->_hasAlbumArtConstraint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyline, 0);
  objc_storeStrong((id *)&self->_playButton, 0);
  objc_storeStrong((id *)&self->_openButton, 0);
  objc_storeStrong((id *)&self->_artistNameLabel, 0);
  objc_storeStrong((id *)&self->_songTitleLabel, 0);
  objc_storeStrong((id *)&self->_albumArtImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_artistString, 0);
  objc_storeStrong((id *)&self->_songTitle, 0);

  objc_storeStrong((id *)&self->_albumArt, 0);
}

@end