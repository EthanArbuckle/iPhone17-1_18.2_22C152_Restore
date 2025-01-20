@interface LPPlayButtonView
- (BOOL)isLyricStyle;
- (LPPlayButtonView)initWithHost:(id)a3;
- (LPPlayButtonView)initWithHost:(id)a3 playbackInformation:(id)a4 style:(id)a5 properties:(id)a6;
- (id)playable;
- (id)theme;
- (void)buildSubviewsIfNeeded;
- (void)dealloc;
- (void)installAudioButton;
- (void)installDisablediTunesButton;
- (void)installPlaceholderButton;
- (void)installPreviewButton;
- (void)installiTunesButton;
- (void)layoutComponentView;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)updateButton;
- (void)updateButtonForAudioBook;
- (void)updateButtonForAudioFile;
- (void)updateButtonForPodcast;
- (void)updateButtonForRadio;
- (void)updateButtonForSongOrAlbum;
@end

@implementation LPPlayButtonView

- (LPPlayButtonView)initWithHost:(id)a3
{
  return 0;
}

- (LPPlayButtonView)initWithHost:(id)a3 playbackInformation:(id)a4 style:(id)a5 properties:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)LPPlayButtonView;
  v14 = [(LPComponentView *)&v18 initWithHost:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_style, a5);
    objc_storeStrong((id *)&v15->_properties, a6);
    objc_storeStrong((id *)&v15->_playbackInformation, a4);
    v16 = v15;
  }

  return v15;
}

- (void)buildSubviewsIfNeeded
{
  if (!self->_hasBuilt)
  {
    [(LPPlayButtonView *)self updateButton];
    objc_initWeak(&location, self);
    v3 = +[LPiTunesStoreInformation shared];
    uint64_t v4 = MEMORY[0x1E4F143A8];
    uint64_t v5 = 3221225472;
    v6 = __41__LPPlayButtonView_buildSubviewsIfNeeded__block_invoke;
    v7 = &unk_1E5B055A0;
    objc_copyWeak(&v8, &location);
    [v3 registerForStoreAvailablityChangesWithToken:self handler:&v4];

    if ([(LPPlayButtonPresentationProperties *)self->_properties disabled]) {
      [(LPPlayButtonControl *)self->_button setEnabled:0];
    }
    self->_hasBuilt = 1;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __41__LPPlayButtonView_buildSubviewsIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateButton];
}

- (void)dealloc
{
  v3 = +[LPiTunesStoreInformation shared];
  [v3 unregisterForStoreAvailablityChangesWithToken:self];

  v4.receiver = self;
  v4.super_class = (Class)LPPlayButtonView;
  [(LPPlayButtonView *)&v4 dealloc];
}

- (BOOL)isLyricStyle
{
  v2 = self;
  v3 = [(LPComponentView *)self host];
  LOBYTE(v2) = [v3 rendererStyleForComponentView:v2] == 42;

  return (char)v2;
}

- (id)theme
{
  v3 = [(LPPlayButtonPresentationProperties *)self->_properties accentColor];

  if (v3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __25__LPPlayButtonView_theme__block_invoke;
    v14[3] = &unk_1E5B065C8;
    v14[4] = self;
    objc_super v4 = __25__LPPlayButtonView_theme__block_invoke((uint64_t)v14);
    uint64_t v5 = [LPAudioPlayButtonTheme alloc];
    v6 = [(LPPlayButtonPresentationProperties *)self->_properties accentColor];
    v7 = [(LPAudioPlayButtonStyle *)self->_style defaultTheme];
    id v8 = [v7 outerBorderColor];
    v9 = [(LPAudioPlayButtonTheme *)v5 initWithKeyColor:v4 secondaryColor:v6 outerBorderColor:v8 useInvertedInactiveState:0];
  }
  else
  {
    switch([(LPInlineMediaPlaybackInformation *)self->_playbackInformation type])
    {
      case 0uLL:
        BOOL v12 = [(LPPlayButtonView *)self isLyricStyle];
        style = self->_style;
        if (!v12) {
          goto LABEL_5;
        }
        uint64_t v11 = [(LPAudioPlayButtonStyle *)style lyricExcerptTheme];
        break;
      case 1uLL:
      case 2uLL:
      case 5uLL:
        style = self->_style;
LABEL_5:
        uint64_t v11 = [(LPAudioPlayButtonStyle *)style appleMusicTheme];
        break;
      case 3uLL:
      case 4uLL:
        uint64_t v11 = [(LPAudioPlayButtonStyle *)self->_style podcastsTheme];
        break;
      case 6uLL:
        uint64_t v11 = [(LPAudioPlayButtonStyle *)self->_style audioBookTheme];
        break;
      default:
        uint64_t v11 = [(LPAudioPlayButtonStyle *)self->_style defaultTheme];
        break;
    }
    v9 = (LPAudioPlayButtonTheme *)v11;
  }

  return v9;
}

id __25__LPPlayButtonView_theme__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(*(void *)(a1 + 32) + 480) accentColor];
  uint64_t v2 = [v1 deprecatedLuminosityLevel];

  if (v2)
  {
    if (v2 == 1)
    {
      v3 = [MEMORY[0x1E4FB1618] whiteColor];
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1618] blackColor];
  }

  return v3;
}

- (void)installPlaceholderButton
{
  button = self->_button;
  if (button) {
    [(LPPlayButtonControl *)button removeFromSuperview];
  }
  objc_super v4 = [LPPlaceholderPlayButtonControl alloc];
  style = self->_style;
  v6 = [(LPPlayButtonView *)self theme];
  v7 = [(LPPlaceholderPlayButtonControl *)v4 initWithStyle:style theme:v6];
  id v8 = self->_button;
  self->_button = v7;

  v9 = self->_button;

  [(LPPlayButtonView *)self addSubview:v9];
}

- (void)installiTunesButton
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = *a2;
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1A35DC000, log, OS_LOG_TYPE_DEFAULT, "Trying to install an iTunes button with no store identifier or persistent identifier or preview url %@; this viola"
      "tes the invariant",
      (uint8_t *)&v4,
      0xCu);
  }
  abort();
}

- (void)installDisablediTunesButton
{
  if ([(LPPlayButtonView *)self isLyricStyle])
  {
    [(LPPlayButtonView *)self installPlaceholderButton];
  }
  else
  {
    [(LPPlayButtonView *)self installiTunesButton];
    [(LPPlayButtonControl *)self->_button setEnabled:0];
    [(LPPlayButtonView *)self setUserInteractionEnabled:0];
  }
}

- (void)installPreviewButton
{
  if ([(LPPlayButtonView *)self isLyricStyle])
  {
    [(LPPlayButtonView *)self installPlaceholderButton];
  }
  else
  {
    button = self->_button;
    if (button) {
      [(LPPlayButtonControl *)button removeFromSuperview];
    }
    int v4 = [LPAudio alloc];
    uint64_t v5 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation previewURL];
    uint64_t v6 = objc_alloc_init(LPAudioProperties);
    v14 = [(LPAudio *)v4 initWithStreamingURL:v5 properties:v6];

    v7 = [LPStreamingAudioPlayButtonControl alloc];
    style = self->_style;
    v9 = [(LPPlayButtonView *)self theme];
    v10 = [(LPComponentView *)self host];
    uint64_t v11 = [v10 componentView:self playerForAudio:v14];
    BOOL v12 = [(LPStreamingAudioPlayButtonControl *)v7 initWithAudio:v14 style:style theme:v9 player:v11];
    id v13 = self->_button;
    self->_button = v12;

    [(LPPlayButtonControl *)self->_button installRecognizersOnView:self];
    [(LPPlayButtonView *)self addSubview:self->_button];
  }
}

- (void)updateButtonForSongOrAlbum
{
  uint64_t v3 = +[LPiTunesStoreInformation shared];
  int v4 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation storefrontIdentifier];
  uint64_t v5 = [v3 userStateForMediaStorefrontIdentifier:v4];

  if (v5 == 4)
  {
LABEL_13:
    [(LPPlayButtonView *)self installPlaceholderButton];
    return;
  }
  if (!v5)
  {
    [(LPPlayButtonView *)self installDisablediTunesButton];
    return;
  }
  if ([(LPInlineMediaPlaybackInformation *)self->_playbackInformation type] == 5) {
    goto LABEL_7;
  }
  unint64_t v6 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation availability];
  if (v6 < 2)
  {
    if (v5 == 1)
    {
LABEL_7:
      [(LPPlayButtonView *)self installiTunesButton];
      return;
    }
  }
  else if (v6 != 2)
  {
    if (v6 != 3) {
      return;
    }
    goto LABEL_13;
  }

  [(LPPlayButtonView *)self installPreviewButton];
}

- (void)updateButtonForRadio
{
  uint64_t v3 = +[LPiTunesStoreInformation shared];
  int v4 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation storefrontIdentifier];
  uint64_t v5 = [v3 userStateForMediaStorefrontIdentifier:v4];

  if ((unint64_t)(v5 - 2) >= 3)
  {
    if (v5)
    {
      if (v5 == 1)
      {
        [(LPPlayButtonView *)self installiTunesButton];
      }
    }
    else
    {
      [(LPPlayButtonView *)self installDisablediTunesButton];
    }
  }
  else
  {
    [(LPPlayButtonView *)self installPlaceholderButton];
  }
}

- (void)updateButtonForAudioBook
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.iBooks" allowPlaceholder:1 error:0];
  if (v3
    && (int v4 = v3,
        [v3 applicationState],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isInstalled],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    [(LPPlayButtonView *)self installiTunesButton];
  }
  else
  {
    [(LPPlayButtonView *)self installPlaceholderButton];
  }
}

- (void)updateButtonForPodcast
{
  if (-[LPInlineMediaPlaybackInformation isAvailableForAnonymousDownload](self->_playbackInformation, "isAvailableForAnonymousDownload")&& (v3 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:@"com.apple.iBooks" allowPlaceholder:1 error:0]) != 0&& (int v4 = v3, objc_msgSend(v3, "applicationState"), v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "isInstalled"), v5, v4, (v6 & 1) != 0))
  {
    [(LPPlayButtonView *)self installiTunesButton];
  }
  else
  {
    [(LPPlayButtonView *)self installPlaceholderButton];
  }
}

- (void)installAudioButton
{
  button = self->_button;
  if (button) {
    [(LPPlayButtonControl *)button removeFromSuperview];
  }
  int v4 = [LPStreamingAudioPlayButtonControl alloc];
  uint64_t v5 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation audio];
  style = self->_style;
  v7 = [(LPPlayButtonView *)self theme];
  id v8 = [(LPComponentView *)self host];
  v9 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation audio];
  v10 = [v8 componentView:self playerForAudio:v9];
  uint64_t v11 = [(LPStreamingAudioPlayButtonControl *)v4 initWithAudio:v5 style:style theme:v7 player:v10];
  BOOL v12 = self->_button;
  self->_button = v11;

  [(LPPlayButtonControl *)self->_button installRecognizersOnView:self];
  [(LPPlayButtonView *)self addSubview:self->_button];

  [(UIView *)self _lp_setNeedsLayout];
}

- (void)updateButtonForAudioFile
{
  uint64_t v3 = [(LPInlineMediaPlaybackInformation *)self->_playbackInformation audio];

  if (v3)
  {
    [(LPPlayButtonView *)self installAudioButton];
  }
  else
  {
    [(LPPlayButtonView *)self installPlaceholderButton];
  }
}

- (void)updateButton
{
  [(LPPlayButtonView *)self setUserInteractionEnabled:1];
  switch([(LPInlineMediaPlaybackInformation *)self->_playbackInformation type])
  {
    case 0uLL:
    case 1uLL:
    case 5uLL:
      [(LPPlayButtonView *)self updateButtonForSongOrAlbum];
      break;
    case 2uLL:
      [(LPPlayButtonView *)self updateButtonForRadio];
      break;
    case 3uLL:
    case 4uLL:
      [(LPPlayButtonView *)self updateButtonForPodcast];
      break;
    case 6uLL:
      [(LPPlayButtonView *)self updateButtonForAudioBook];
      break;
    case 7uLL:
      [(LPPlayButtonView *)self updateButtonForAudioFile];
      break;
    default:
      return;
  }
}

- (void)layoutComponentView
{
  [(LPPlayButtonView *)self buildSubviewsIfNeeded];
  [(LPPlayButtonView *)self bounds];
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double v6 = v5 + left;
  double v8 = v7 + top;
  double v10 = v9 - (left + self->_contentInset.right);
  button = self->_button;
  double v13 = v12 - (top + self->_contentInset.bottom);

  -[LPPlayButtonControl setFrame:](button, "setFrame:", v6, v8, v10, v13);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (id)playable
{
  return [(LPPlayButtonControl *)self->_button playable];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_playbackInformation, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end