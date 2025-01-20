@interface LPAudioPlayButtonStyle
- (LPAudioPlayButtonStyle)initWithPlatform:(int64_t)a3;
- (LPAudioPlayButtonTheme)appleMusicTheme;
- (LPAudioPlayButtonTheme)audioBookTheme;
- (LPAudioPlayButtonTheme)defaultTheme;
- (LPAudioPlayButtonTheme)lyricExcerptTheme;
- (LPAudioPlayButtonTheme)podcastsTheme;
- (LPPointUnit)glyphSize;
- (LPSize)size;
- (void)setGlyphSize:(id)a3;
- (void)setSize:(id)a3;
@end

@implementation LPAudioPlayButtonStyle

- (LPAudioPlayButtonStyle)initWithPlatform:(int64_t)a3
{
  v42.receiver = self;
  v42.super_class = (Class)LPAudioPlayButtonStyle;
  v5 = [(LPAudioPlayButtonStyle *)&v42 init];
  if (v5)
  {
    v6 = [LPSize alloc];
    if ((unint64_t)a3 <= 6) {
      v3 = [[LPPointUnit alloc] initWithValue:dbl_1A3711B48[a3]];
    }
    uint64_t v7 = [(LPSize *)v6 initWithSquarePoints:v3];
    size = v5->_size;
    v5->_size = (LPSize *)v7;

    if ((unint64_t)a3 <= 6) {
      v9 = [[LPPointUnit alloc] initWithValue:dbl_1A3711B80[a3]];
    }
    glyphSize = v5->_glyphSize;
    v5->_glyphSize = v9;

    v11 = [MEMORY[0x1E4FB1618] colorWithRed:0.725490196 green:0.725490196 blue:0.741176471 alpha:1.0];
    v12 = [LPAudioPlayButtonTheme alloc];
    v13 = [MEMORY[0x1E4FB1618] systemBlueColor];
    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v15 = [(LPAudioPlayButtonTheme *)v12 initWithKeyColor:v13 secondaryColor:v14 outerBorderColor:v11 useInvertedInactiveState:0];
    defaultTheme = v5->_defaultTheme;
    v5->_defaultTheme = (LPAudioPlayButtonTheme *)v15;

    v17 = [LPAudioPlayButtonTheme alloc];
    v18 = +[LPResources appleMusicKeyColor];
    v19 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v20 = [(LPAudioPlayButtonTheme *)v17 initWithKeyColor:v18 secondaryColor:v19 outerBorderColor:v11 useInvertedInactiveState:0];
    appleMusicTheme = v5->_appleMusicTheme;
    v5->_appleMusicTheme = (LPAudioPlayButtonTheme *)v20;

    v22 = [LPAudioPlayButtonTheme alloc];
    v23 = [MEMORY[0x1E4FB1618] colorWithRed:0.447 green:0.141 blue:0.847 alpha:1.0];
    v24 = [MEMORY[0x1E4FB1618] whiteColor];
    uint64_t v25 = [(LPAudioPlayButtonTheme *)v22 initWithKeyColor:v23 secondaryColor:v24 outerBorderColor:v11 useInvertedInactiveState:0];
    podcastsTheme = v5->_podcastsTheme;
    v5->_podcastsTheme = (LPAudioPlayButtonTheme *)v25;

    v27 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    v28 = [LPAudioPlayButtonTheme alloc];
    v29 = [MEMORY[0x1E4FB1618] labelColor];
    uint64_t v30 = [(LPAudioPlayButtonTheme *)v28 initWithKeyColor:v29 secondaryColor:v27 outerBorderColor:v11 useInvertedInactiveState:0];
    audioBookTheme = v5->_audioBookTheme;
    v5->_audioBookTheme = (LPAudioPlayButtonTheme *)v30;

    v32 = [LPAudioPlayButtonTheme alloc];
    v33 = [MEMORY[0x1E4FB1618] whiteColor];
    v34 = [MEMORY[0x1E4FB1618] whiteColor];
    v35 = [v34 colorWithAlphaComponent:0.1];
    v36 = [MEMORY[0x1E4FB1618] whiteColor];
    v37 = [v36 colorWithAlphaComponent:0.1];
    uint64_t v38 = [(LPAudioPlayButtonTheme *)v32 initWithKeyColor:v33 secondaryColor:v35 outerBorderColor:v37 useInvertedInactiveState:1];
    lyricExcerptTheme = v5->_lyricExcerptTheme;
    v5->_lyricExcerptTheme = (LPAudioPlayButtonTheme *)v38;

    v40 = v5;
  }

  return v5;
}

- (LPSize)size
{
  return self->_size;
}

- (void)setSize:(id)a3
{
}

- (LPPointUnit)glyphSize
{
  return self->_glyphSize;
}

- (void)setGlyphSize:(id)a3
{
}

- (LPAudioPlayButtonTheme)defaultTheme
{
  return self->_defaultTheme;
}

- (LPAudioPlayButtonTheme)appleMusicTheme
{
  return self->_appleMusicTheme;
}

- (LPAudioPlayButtonTheme)podcastsTheme
{
  return self->_podcastsTheme;
}

- (LPAudioPlayButtonTheme)audioBookTheme
{
  return self->_audioBookTheme;
}

- (LPAudioPlayButtonTheme)lyricExcerptTheme
{
  return self->_lyricExcerptTheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricExcerptTheme, 0);
  objc_storeStrong((id *)&self->_audioBookTheme, 0);
  objc_storeStrong((id *)&self->_podcastsTheme, 0);
  objc_storeStrong((id *)&self->_appleMusicTheme, 0);
  objc_storeStrong((id *)&self->_defaultTheme, 0);
  objc_storeStrong((id *)&self->_glyphSize, 0);

  objc_storeStrong((id *)&self->_size, 0);
}

@end