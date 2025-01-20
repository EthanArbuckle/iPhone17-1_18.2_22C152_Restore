@interface ASCompetitionScoreViewConfiguration
+ (id)companionFriendListConfiguration;
+ (id)companionTotalScoreFriendDetailConfiguration;
+ (id)companionTotalWinsFriendDetailConfiguration;
+ (id)companionTotalWinsStandaloneFriendDetailConfiguration;
+ (id)gizmoTodayScoreConfiguration;
+ (id)gizmoTotalScoreConfiguration;
+ (id)gizmoTotalScoreFriendDetailConfiguration;
+ (id)gizmoTotalWinsConfiguration;
+ (id)gizmoTotalWinsStandaloneConfiguration;
- (BOOL)showsAchievementThumbnail;
- (BOOL)showsNames;
- (BOOL)showsPrimaryScoreUnits;
- (BOOL)showsScoreTypeHeader;
- (BOOL)showsTodaySecondaryScore;
- (BOOL)uppercaseNames;
- (BOOL)wantsScaledBaselineAlignment;
- (BOOL)zeroPadPrimaryScore;
- (CGSize)achievementThumbnailSize;
- (UIFont)headerFont;
- (UIFont)nameFont;
- (UIFont)primaryScoreFont;
- (UIFont)primaryScoreUnitFont;
- (UIFont)secondaryScoreFont;
- (double)achievementThumbnailTopMargin;
- (double)bottomMargin;
- (double)headerBaselineOffset;
- (double)minimumMiddleMargin;
- (double)nameBaselineOffset;
- (double)opponentScoreViewWidth;
- (double)primaryScoreBaselineOffset;
- (double)secondaryScoreBaselineOffset;
- (double)sideMargin;
- (int64_t)achievementThumbnailAlignment;
- (int64_t)achievementThumbnailQuality;
- (int64_t)alignment;
- (int64_t)division;
- (int64_t)primaryScoreSource;
- (void)setAchievementThumbnailAlignment:(int64_t)a3;
- (void)setAchievementThumbnailQuality:(int64_t)a3;
- (void)setAchievementThumbnailSize:(CGSize)a3;
- (void)setAchievementThumbnailTopMargin:(double)a3;
- (void)setAlignment:(int64_t)a3;
- (void)setBottomMargin:(double)a3;
- (void)setDivision:(int64_t)a3;
- (void)setHeaderBaselineOffset:(double)a3;
- (void)setHeaderFont:(id)a3;
- (void)setMinimumMiddleMargin:(double)a3;
- (void)setNameBaselineOffset:(double)a3;
- (void)setNameFont:(id)a3;
- (void)setOpponentScoreViewWidth:(double)a3;
- (void)setPrimaryScoreBaselineOffset:(double)a3;
- (void)setPrimaryScoreFont:(id)a3;
- (void)setPrimaryScoreSource:(int64_t)a3;
- (void)setPrimaryScoreUnitFont:(id)a3;
- (void)setSecondaryScoreBaselineOffset:(double)a3;
- (void)setSecondaryScoreFont:(id)a3;
- (void)setShowsAchievementThumbnail:(BOOL)a3;
- (void)setShowsNames:(BOOL)a3;
- (void)setShowsPrimaryScoreUnits:(BOOL)a3;
- (void)setShowsScoreTypeHeader:(BOOL)a3;
- (void)setShowsTodaySecondaryScore:(BOOL)a3;
- (void)setSideMargin:(double)a3;
- (void)setUppercaseNames:(BOOL)a3;
- (void)setWantsScaledBaselineAlignment:(BOOL)a3;
- (void)setZeroPadPrimaryScore:(BOOL)a3;
@end

@implementation ASCompetitionScoreViewConfiguration

+ (id)gizmoTotalScoreConfiguration
{
  v2 = objc_alloc_init(ASCompetitionScoreViewConfiguration);
  [(ASCompetitionScoreViewConfiguration *)v2 setShowsScoreTypeHeader:0];
  v3 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
  [(ASCompetitionScoreViewConfiguration *)v2 setNameFont:v3];

  [(ASCompetitionScoreViewConfiguration *)v2 setNameBaselineOffset:19.5];
  [(ASCompetitionScoreViewConfiguration *)v2 setShowsNames:1];
  [(ASCompetitionScoreViewConfiguration *)v2 setUppercaseNames:1];
  v4 = objc_msgSend(MEMORY[0x263F81708], "fu_sausageFontOfSize:", 25.0);
  [(ASCompetitionScoreViewConfiguration *)v2 setPrimaryScoreFont:v4];

  [(ASCompetitionScoreViewConfiguration *)v2 setPrimaryScoreBaselineOffset:22.5];
  [(ASCompetitionScoreViewConfiguration *)v2 setPrimaryScoreSource:0];
  [(ASCompetitionScoreViewConfiguration *)v2 setShowsPrimaryScoreUnits:0];
  [(ASCompetitionScoreViewConfiguration *)v2 setZeroPadPrimaryScore:1];
  [(ASCompetitionScoreViewConfiguration *)v2 setShowsAchievementThumbnail:0];
  [(ASCompetitionScoreViewConfiguration *)v2 setBottomMargin:10.0];
  [(ASCompetitionScoreViewConfiguration *)v2 setSideMargin:10.0];
  [(ASCompetitionScoreViewConfiguration *)v2 setMinimumMiddleMargin:8.0];
  [(ASCompetitionScoreViewConfiguration *)v2 setAlignment:1];
  [(ASCompetitionScoreViewConfiguration *)v2 setDivision:1];
  [(ASCompetitionScoreViewConfiguration *)v2 setWantsScaledBaselineAlignment:0];
  return v2;
}

+ (id)gizmoTotalScoreFriendDetailConfiguration
{
  v2 = [a1 gizmoTotalScoreConfiguration];
  v3 = [MEMORY[0x263F81708] systemFontOfSize:13.0];
  [v2 setHeaderFont:v3];

  [v2 setHeaderBaselineOffset:19.5];
  [v2 setNameBaselineOffset:21.0];
  [v2 setShowsScoreTypeHeader:1];
  return v2;
}

+ (id)gizmoTodayScoreConfiguration
{
  v2 = [a1 gizmoTotalScoreFriendDetailConfiguration];
  [v2 setShowsNames:0];
  [v2 setPrimaryScoreSource:1];
  return v2;
}

+ (id)gizmoTotalWinsConfiguration
{
  v2 = [a1 gizmoTotalScoreFriendDetailConfiguration];
  [v2 setShowsNames:0];
  [v2 setPrimaryScoreSource:2];
  objc_msgSend(v2, "setAchievementThumbnailSize:", 20.0, 20.0);
  [v2 setAchievementThumbnailTopMargin:5.5];
  [v2 setShowsAchievementThumbnail:1];
  [v2 setAchievementThumbnailAlignment:0];
  [v2 setAchievementThumbnailQuality:0];
  return v2;
}

+ (id)gizmoTotalWinsStandaloneConfiguration
{
  v2 = [a1 gizmoTotalWinsConfiguration];
  [v2 setShowsNames:1];
  return v2;
}

+ (id)companionTotalScoreFriendDetailConfiguration
{
  v20[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  v4 = objc_msgSend(MEMORY[0x263F81708], "fu_sausageFontOfSize:", 30.0);
  uint64_t v19 = *MEMORY[0x263F81748];
  uint64_t v5 = *MEMORY[0x263F817B0];
  v16[0] = *MEMORY[0x263F817B8];
  v16[1] = v5;
  v17[0] = &unk_26E806DA8;
  v17[1] = &unk_26E806DC0;
  v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  v18 = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
  v20[0] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v20 forKeys:&v19 count:1];

  v9 = [v4 fontDescriptor];
  v10 = [v9 fontDescriptorByAddingAttributes:v8];

  v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
  v12 = objc_alloc_init(ASCompetitionScoreViewConfiguration);
  [(ASCompetitionScoreViewConfiguration *)v12 setShowsScoreTypeHeader:0];
  v13 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:0.0];
  [(ASCompetitionScoreViewConfiguration *)v12 setNameFont:v13];

  [(ASCompetitionScoreViewConfiguration *)v12 setNameBaselineOffset:20.5];
  [(ASCompetitionScoreViewConfiguration *)v12 setShowsNames:1];
  [(ASCompetitionScoreViewConfiguration *)v12 setUppercaseNames:0];
  [(ASCompetitionScoreViewConfiguration *)v12 setPrimaryScoreFont:v4];
  [(ASCompetitionScoreViewConfiguration *)v12 setPrimaryScoreBaselineOffset:30.0];
  [(ASCompetitionScoreViewConfiguration *)v12 setPrimaryScoreSource:0];
  [(ASCompetitionScoreViewConfiguration *)v12 setShowsPrimaryScoreUnits:1];
  [(ASCompetitionScoreViewConfiguration *)v12 setPrimaryScoreUnitFont:v11];
  [(ASCompetitionScoreViewConfiguration *)v12 setZeroPadPrimaryScore:0];
  [(ASCompetitionScoreViewConfiguration *)v12 setShowsTodaySecondaryScore:1];
  v14 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:0.0];
  [(ASCompetitionScoreViewConfiguration *)v12 setSecondaryScoreFont:v14];

  [(ASCompetitionScoreViewConfiguration *)v12 setSecondaryScoreBaselineOffset:20.5];
  [(ASCompetitionScoreViewConfiguration *)v12 setShowsAchievementThumbnail:0];
  [(ASCompetitionScoreViewConfiguration *)v12 setBottomMargin:19.0];
  [(ASCompetitionScoreViewConfiguration *)v12 setSideMargin:0.0];
  [(ASCompetitionScoreViewConfiguration *)v12 setMinimumMiddleMargin:19.0];
  [(ASCompetitionScoreViewConfiguration *)v12 setAlignment:0];
  [(ASCompetitionScoreViewConfiguration *)v12 setDivision:2];
  [(ASCompetitionScoreViewConfiguration *)v12 setWantsScaledBaselineAlignment:1];

  return v12;
}

+ (id)companionFriendListConfiguration
{
  v2 = [a1 companionTotalScoreFriendDetailConfiguration];
  [v2 setDivision:0];
  [v2 setNameBaselineOffset:30.0];
  [v2 setMinimumMiddleMargin:19.0];
  [v2 setSideMargin:19.0];
  return v2;
}

+ (id)companionTotalWinsFriendDetailConfiguration
{
  v2 = [a1 companionTotalScoreFriendDetailConfiguration];
  [v2 setPrimaryScoreSource:2];
  [v2 setShowsPrimaryScoreUnits:0];
  [v2 setShowsNames:0];
  [v2 setShowsTodaySecondaryScore:0];
  [v2 setBottomMargin:19.0];
  [v2 setPrimaryScoreBaselineOffset:29.0];
  [v2 setShowsAchievementThumbnail:1];
  [v2 setAchievementThumbnailAlignment:1];
  [v2 setAchievementThumbnailQuality:1];
  objc_msgSend(v2, "setAchievementThumbnailSize:", 41.0, 41.0);
  return v2;
}

+ (id)companionTotalWinsStandaloneFriendDetailConfiguration
{
  v2 = [a1 companionTotalWinsFriendDetailConfiguration];
  [v2 setShowsNames:1];
  return v2;
}

- (UIFont)headerFont
{
  return self->_headerFont;
}

- (void)setHeaderFont:(id)a3
{
}

- (double)headerBaselineOffset
{
  return self->_headerBaselineOffset;
}

- (void)setHeaderBaselineOffset:(double)a3
{
  self->_headerBaselineOffset = a3;
}

- (BOOL)showsScoreTypeHeader
{
  return self->_showsScoreTypeHeader;
}

- (void)setShowsScoreTypeHeader:(BOOL)a3
{
  self->_showsScoreTypeHeader = a3;
}

- (UIFont)nameFont
{
  return self->_nameFont;
}

- (void)setNameFont:(id)a3
{
}

- (double)nameBaselineOffset
{
  return self->_nameBaselineOffset;
}

- (void)setNameBaselineOffset:(double)a3
{
  self->_nameBaselineOffset = a3;
}

- (BOOL)showsNames
{
  return self->_showsNames;
}

- (void)setShowsNames:(BOOL)a3
{
  self->_showsNames = a3;
}

- (BOOL)uppercaseNames
{
  return self->_uppercaseNames;
}

- (void)setUppercaseNames:(BOOL)a3
{
  self->_uppercaseNames = a3;
}

- (int64_t)primaryScoreSource
{
  return self->_primaryScoreSource;
}

- (void)setPrimaryScoreSource:(int64_t)a3
{
  self->_primaryScoreSource = a3;
}

- (UIFont)primaryScoreFont
{
  return self->_primaryScoreFont;
}

- (void)setPrimaryScoreFont:(id)a3
{
}

- (UIFont)primaryScoreUnitFont
{
  return self->_primaryScoreUnitFont;
}

- (void)setPrimaryScoreUnitFont:(id)a3
{
}

- (double)primaryScoreBaselineOffset
{
  return self->_primaryScoreBaselineOffset;
}

- (void)setPrimaryScoreBaselineOffset:(double)a3
{
  self->_primaryScoreBaselineOffset = a3;
}

- (BOOL)showsPrimaryScoreUnits
{
  return self->_showsPrimaryScoreUnits;
}

- (void)setShowsPrimaryScoreUnits:(BOOL)a3
{
  self->_showsPrimaryScoreUnits = a3;
}

- (BOOL)zeroPadPrimaryScore
{
  return self->_zeroPadPrimaryScore;
}

- (void)setZeroPadPrimaryScore:(BOOL)a3
{
  self->_zeroPadPrimaryScore = a3;
}

- (double)achievementThumbnailTopMargin
{
  return self->_achievementThumbnailTopMargin;
}

- (void)setAchievementThumbnailTopMargin:(double)a3
{
  self->_achievementThumbnailTopMargin = a3;
}

- (CGSize)achievementThumbnailSize
{
  double width = self->_achievementThumbnailSize.width;
  double height = self->_achievementThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAchievementThumbnailSize:(CGSize)a3
{
  self->_achievementThumbnailSize = a3;
}

- (BOOL)showsAchievementThumbnail
{
  return self->_showsAchievementThumbnail;
}

- (void)setShowsAchievementThumbnail:(BOOL)a3
{
  self->_showsAchievementThumbnail = a3;
}

- (int64_t)achievementThumbnailAlignment
{
  return self->_achievementThumbnailAlignment;
}

- (void)setAchievementThumbnailAlignment:(int64_t)a3
{
  self->_achievementThumbnailAlignment = a3;
}

- (int64_t)achievementThumbnailQuality
{
  return self->_achievementThumbnailQuality;
}

- (void)setAchievementThumbnailQuality:(int64_t)a3
{
  self->_achievementThumbnailQuality = a3;
}

- (UIFont)secondaryScoreFont
{
  return self->_secondaryScoreFont;
}

- (void)setSecondaryScoreFont:(id)a3
{
}

- (double)secondaryScoreBaselineOffset
{
  return self->_secondaryScoreBaselineOffset;
}

- (void)setSecondaryScoreBaselineOffset:(double)a3
{
  self->_secondaryScoreBaselineOffset = a3;
}

- (BOOL)showsTodaySecondaryScore
{
  return self->_showsTodaySecondaryScore;
}

- (void)setShowsTodaySecondaryScore:(BOOL)a3
{
  self->_showsTodaySecondaryScore = a3;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(int64_t)a3
{
  self->_alignment = a3;
}

- (int64_t)division
{
  return self->_division;
}

- (void)setDivision:(int64_t)a3
{
  self->_division = a3;
}

- (double)sideMargin
{
  return self->_sideMargin;
}

- (void)setSideMargin:(double)a3
{
  self->_sideMargin = a3;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)minimumMiddleMargin
{
  return self->_minimumMiddleMargin;
}

- (void)setMinimumMiddleMargin:(double)a3
{
  self->_minimumMiddleMargin = a3;
}

- (double)opponentScoreViewWidth
{
  return self->_opponentScoreViewWidth;
}

- (void)setOpponentScoreViewWidth:(double)a3
{
  self->_opponentScoreViewWidth = a3;
}

- (BOOL)wantsScaledBaselineAlignment
{
  return self->_wantsScaledBaselineAlignment;
}

- (void)setWantsScaledBaselineAlignment:(BOOL)a3
{
  self->_wantsScaledBaselineAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryScoreFont, 0);
  objc_storeStrong((id *)&self->_primaryScoreUnitFont, 0);
  objc_storeStrong((id *)&self->_primaryScoreFont, 0);
  objc_storeStrong((id *)&self->_nameFont, 0);
  objc_storeStrong((id *)&self->_headerFont, 0);
}

@end