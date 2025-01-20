@interface CPUITableCellConfiguration
+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11;
+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11 playingIndicatorLeadingSide:(BOOL)a12;
+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11 playingIndicatorLeadingSide:(BOOL)a12 isEnabled:(BOOL)a13;
+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 playbackState:(int64_t)a11 playingIndicatorLeadingSide:(BOOL)a12 isEnabled:(BOOL)a13;
- (BOOL)currentlyPlaying;
- (BOOL)enabled;
- (BOOL)playingIndicatorLeadingSide;
- (BOOL)shouldShowPlaybackProgress;
- (BOOL)showActivityIndicator;
- (BOOL)showExplicit;
- (CPUITableCellAccessory)accessory;
- (NSString)detailText;
- (NSString)text;
- (UIImage)image;
- (double)playbackProgress;
- (int64_t)playbackState;
- (void)setAccessory:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setPlaybackProgress:(double)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setPlayingIndicatorLeadingSide:(BOOL)a3;
- (void)setShouldShowPlaybackProgress:(BOOL)a3;
- (void)setShowActivityIndicator:(BOOL)a3;
- (void)setShowExplicit:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation CPUITableCellConfiguration

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 playbackState:(int64_t)a11 playingIndicatorLeadingSide:(BOOL)a12 isEnabled:(BOOL)a13
{
  BOOL v24 = a8;
  BOOL v14 = a6;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = objc_opt_new();
  [v22 setText:v21];

  [v22 setDetailText:v20];
  [v22 setImage:v19];

  [v22 setShowExplicit:v14];
  [v22 setAccessory:v18];

  [v22 setShouldShowPlaybackProgress:a9];
  [v22 setPlaybackProgress:a10];
  [v22 setPlaybackState:a11];
  [v22 setShowActivityIndicator:v24];
  [v22 setPlayingIndicatorLeadingSide:a12];
  [v22 setEnabled:a13];
  return v22;
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11 playingIndicatorLeadingSide:(BOOL)a12 isEnabled:(BOOL)a13
{
  LOWORD(v15) = __PAIR16__(a13, a12);
  LOBYTE(v14) = a9;
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:playbackState:playingIndicatorLeadingSide:isEnabled:", a3, a4, a5, a6, a7, a8, a10, v14, a11, v15);
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11 playingIndicatorLeadingSide:(BOOL)a12
{
  BYTE3(v13) = 1;
  *(_WORD *)((char *)&v13 + 1) = __PAIR16__(a12, a11);
  LOBYTE(v13) = a9;
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:playingIndicatorLeadingSide:isEnabled:", a3, a4, a5, a6, a7, a8, a10, v13);
}

+ (id)configurationWithText:(id)a3 detailText:(id)a4 image:(id)a5 showExplicit:(BOOL)a6 accessory:(id)a7 showActivityIndicator:(BOOL)a8 showPlaybackProgress:(BOOL)a9 playbackProgress:(double)a10 currentlyPlaying:(BOOL)a11
{
  BYTE2(v12) = 1;
  LOWORD(v12) = __PAIR16__(a11, a9);
  return (id)objc_msgSend(a1, "configurationWithText:detailText:image:showExplicit:accessory:showActivityIndicator:showPlaybackProgress:playbackProgress:currentlyPlaying:playingIndicatorLeadingSide:", a3, a4, a5, a6, a7, a8, a10, v12);
}

- (BOOL)currentlyPlaying
{
  return (unint64_t)([(CPUITableCellConfiguration *)self playbackState] - 1) < 2;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSString)detailText
{
  return self->_detailText;
}

- (void)setDetailText:(id)a3
{
}

- (CPUITableCellAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (BOOL)showExplicit
{
  return self->_showExplicit;
}

- (void)setShowExplicit:(BOOL)a3
{
  self->_showExplicit = a3;
}

- (double)playbackProgress
{
  return self->_playbackProgress;
}

- (void)setPlaybackProgress:(double)a3
{
  self->_playbackProgress = a3;
}

- (BOOL)shouldShowPlaybackProgress
{
  return self->_shouldShowPlaybackProgress;
}

- (void)setShouldShowPlaybackProgress:(BOOL)a3
{
  self->_shouldShowPlaybackProgress = a3;
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (void)setPlaybackState:(int64_t)a3
{
  self->_playbackState = a3;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  self->_showActivityIndicator = a3;
}

- (BOOL)playingIndicatorLeadingSide
{
  return self->_playingIndicatorLeadingSide;
}

- (void)setPlayingIndicatorLeadingSide:(BOOL)a3
{
  self->_playingIndicatorLeadingSide = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end