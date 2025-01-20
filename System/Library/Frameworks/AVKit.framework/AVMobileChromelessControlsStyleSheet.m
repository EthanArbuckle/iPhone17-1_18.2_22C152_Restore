@interface AVMobileChromelessControlsStyleSheet
- (AVMobileChromelessControlsStyleSheet)initWithTraitCollection:(id)a3;
- (UIEdgeInsets)embeddedInlineInsets;
- (UIEdgeInsets)landscapeFullscreenInsets;
- (UIEdgeInsets)portraitFullscreenInsets;
- (UIFont)buttonFont;
- (UIFont)contentTabLabelFont;
- (UIFont)contentTagFont;
- (UIFont)infoAffordanceButtonFont;
- (UIFont)playPauseButtonFont;
- (UIFont)prominentContentTagFont;
- (UIFont)secondaryPlaybackControlsFont;
- (UIFont)subtitleFont;
- (UIFont)timeLabelFont;
- (UIFont)titleFont;
- (double)standardPaddingFullScreen;
- (double)standardPaddingInline;
- (void)_loadFontsIfNeeded;
@end

@implementation AVMobileChromelessControlsStyleSheet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_contentTabLabelFont, 0);
  objc_storeStrong((id *)&self->_playPauseButtonFont, 0);
  objc_storeStrong((id *)&self->_secondaryPlaybackControlsFont, 0);
  objc_storeStrong((id *)&self->_prominentContentTagFont, 0);
  objc_storeStrong((id *)&self->_contentTagFont, 0);
  objc_storeStrong((id *)&self->_infoAffordanceButtonFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);

  objc_storeStrong((id *)&self->_timeLabelFont, 0);
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (double)standardPaddingInline
{
  return self->_standardPaddingInline;
}

- (double)standardPaddingFullScreen
{
  return self->_standardPaddingFullScreen;
}

- (UIEdgeInsets)embeddedInlineInsets
{
  double top = self->_embeddedInlineInsets.top;
  double left = self->_embeddedInlineInsets.left;
  double bottom = self->_embeddedInlineInsets.bottom;
  double right = self->_embeddedInlineInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)portraitFullscreenInsets
{
  double top = self->_portraitFullscreenInsets.top;
  double left = self->_portraitFullscreenInsets.left;
  double bottom = self->_portraitFullscreenInsets.bottom;
  double right = self->_portraitFullscreenInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)landscapeFullscreenInsets
{
  double top = self->_landscapeFullscreenInsets.top;
  double left = self->_landscapeFullscreenInsets.left;
  double bottom = self->_landscapeFullscreenInsets.bottom;
  double right = self->_landscapeFullscreenInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIFont)contentTabLabelFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  contentTabLabelFont = self->_contentTabLabelFont;

  return contentTabLabelFont;
}

- (void)_loadFontsIfNeeded
{
  v44[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a1[21])
    {
      uint64_t v2 = *MEMORY[0x1E4FB28E0];
      v3 = (void *)MEMORY[0x1E4FB08E0];
      v4 = [a1 traitCollection];
      v39 = [v3 preferredFontForTextStyle:v2 compatibleWithTraitCollection:v4];

      [v39 pointSize];
      double v6 = v5;
      double v7 = *MEMORY[0x1E4FB09D8];
      v8 = objc_msgSend(MEMORY[0x1E4FB08E0], "monospacedDigitSystemFontOfSize:weight:");
      uint64_t v9 = *MEMORY[0x1E4FB0960];
      v43[0] = *MEMORY[0x1E4FB0968];
      v43[1] = v9;
      v44[0] = &unk_1F094A1F0;
      v44[1] = &unk_1F094A208;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
      v42 = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
      v12 = [v8 fontDescriptor];
      uint64_t v13 = *MEMORY[0x1E4FB0920];
      v40[0] = *MEMORY[0x1E4FB0910];
      v40[1] = v13;
      v41[0] = v11;
      v14 = [NSNumber numberWithDouble:v6];
      v41[1] = v14;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
      v16 = [v12 fontDescriptorByAddingAttributes:v15];

      uint64_t v17 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v16 size:v6];
      v18 = (void *)a1[21];
      a1[21] = v17;

      double v19 = *MEMORY[0x1E4FB09B8];
      uint64_t v20 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2990] weight:*MEMORY[0x1E4FB09B8]];
      v21 = (void *)a1[22];
      a1[22] = v20;

      double v22 = *MEMORY[0x1E4FB09E0];
      uint64_t v23 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] weight:*MEMORY[0x1E4FB09E0]];
      v24 = (void *)a1[23];
      a1[23] = v23;

      uint64_t v25 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28D0] weight:v22];
      v26 = (void *)a1[24];
      a1[24] = v25;

      uint64_t v27 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:v19];
      v28 = (void *)a1[26];
      a1[26] = v27;

      uint64_t v29 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.0 weight:v22];
      v30 = (void *)a1[25];
      a1[25] = v29;

      uint64_t v31 = [MEMORY[0x1E4FB08E0] systemFontOfSize:39.0 weight:*MEMORY[0x1E4FB09A8]];
      v32 = (void *)a1[28];
      a1[28] = v31;

      uint64_t v33 = [MEMORY[0x1E4FB08E0] systemFontOfSize:31.0 weight:v7];
      v34 = (void *)a1[27];
      a1[27] = v33;

      uint64_t v35 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2948] variant:1024 maximumContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      v36 = (void *)a1[29];
      a1[29] = v35;

      uint64_t v37 = objc_msgSend(MEMORY[0x1E4FB08E0], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E4FB2998], v7);
      v38 = (void *)a1[30];
      a1[30] = v37;
    }
  }
}

- (UIFont)secondaryPlaybackControlsFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  secondaryPlaybackControlsFont = self->_secondaryPlaybackControlsFont;

  return secondaryPlaybackControlsFont;
}

- (UIFont)playPauseButtonFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  playPauseButtonFont = self->_playPauseButtonFont;

  return playPauseButtonFont;
}

- (UIFont)titleFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  titleFont = self->_titleFont;

  return titleFont;
}

- (UIFont)timeLabelFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  timeLabelFont = self->_timeLabelFont;

  return timeLabelFont;
}

- (UIFont)subtitleFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  subtitleFont = self->_subtitleFont;

  return subtitleFont;
}

- (UIFont)prominentContentTagFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  prominentContentTagFont = self->_prominentContentTagFont;

  return prominentContentTagFont;
}

- (UIFont)infoAffordanceButtonFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  infoAffordanceButtonFont = self->_infoAffordanceButtonFont;

  return infoAffordanceButtonFont;
}

- (UIFont)contentTagFont
{
  -[AVMobileChromelessControlsStyleSheet _loadFontsIfNeeded](self);
  contentTagFont = self->_contentTagFont;

  return contentTagFont;
}

- (AVMobileChromelessControlsStyleSheet)initWithTraitCollection:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromelessControlsStyleSheet;
  double v5 = [(AVMobileControlsStyleSheet *)&v9 initWithTraitCollection:v4];
  if (v5)
  {
    if ([v4 userInterfaceIdiom])
    {
      *((void *)v5 + 19) = 0x4020000000000000;
      *((void *)v5 + 20) = 0x4018000000000000;
      *(_OWORD *)(v5 + 56) = xmmword_1B0721300;
      *(_OWORD *)(v5 + 72) = xmmword_1B0721310;
      double v6 = v5 + 88;
      *((void *)v5 + 11) = 0x4047000000000000;
      long long v7 = xmmword_1B0721320;
    }
    else
    {
      *((void *)v5 + 19) = 0x4020000000000000;
      *((void *)v5 + 20) = 0x4018000000000000;
      *(_OWORD *)(v5 + 56) = xmmword_1B0721330;
      *(_OWORD *)(v5 + 72) = xmmword_1B0721340;
      double v6 = v5 + 88;
      *((void *)v5 + 11) = 0x4045C00000000000;
      long long v7 = xmmword_1B0721350;
    }
    *(_OWORD *)(v6 + 8) = v7;
    *((void *)v6 + 3) = v7;
    *(_OWORD *)(v5 + 120) = xmmword_1B0721360;
    *(_OWORD *)(v5 + 136) = xmmword_1B0721370;
  }

  return (AVMobileChromelessControlsStyleSheet *)v5;
}

@end