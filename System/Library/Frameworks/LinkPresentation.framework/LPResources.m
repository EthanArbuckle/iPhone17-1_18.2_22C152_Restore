@interface LPResources
+ (id)_safariAppIconForSize:(double)a3;
+ (id)appClipIcon;
+ (id)appleMusicKeyColor;
+ (id)arKitButton;
+ (id)chevron;
+ (id)closeQuote;
+ (id)faceTimeBackgroundColor;
+ (id)faceTimeIcon;
+ (id)fileIcon;
+ (id)freeformIcon;
+ (id)iCloudDriveIcon;
+ (id)iCloudIcon;
+ (id)keynoteIcon;
+ (id)linkBackgroundColor;
+ (id)linkIcon;
+ (id)linkMediaBackgroundColor;
+ (id)mapIcon;
+ (id)metadataExtractorJS;
+ (id)muteButton;
+ (id)notesIcon;
+ (id)numbersIcon;
+ (id)openQuote;
+ (id)pagesIcon;
+ (id)passwordsInviteIcon;
+ (id)pauseButton;
+ (id)playButton;
+ (id)remindersIcon;
+ (id)safariAppIcon;
+ (id)safariAppIconBadge;
+ (id)safariIcon;
+ (id)searchGlyph;
+ (id)tapToLoadHighlightColor;
+ (id)telephoneIcon;
+ (id)textIcon;
+ (id)transportBicycleIcon;
+ (id)transportDriveIcon;
+ (id)transportTransitIcon;
+ (id)transportWalkIcon;
+ (id)tweetBackgroundColor;
+ (id)unmuteButton;
+ (id)weiboBackgroundColor;
+ (void)clearCachedResources;
@end

@implementation LPResources

+ (id)metadataExtractorJS
{
  if (metadataExtractorJS_onceToken != -1) {
    dispatch_once(&metadataExtractorJS_onceToken, &__block_literal_global_25);
  }
  v2 = (void *)metadataExtractorJS_metadataExtractorJS;

  return v2;
}

void __34__LPResources_metadataExtractorJS__block_invoke()
{
  id v0 = [NSString alloc];
  id v1 = objc_alloc(MEMORY[0x1E4FB1350]);
  linkPresentationBundle();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithName:bundle:", @"MetadataExtractor");
  v3 = [v2 data];
  uint64_t v4 = [v0 initWithData:v3 encoding:4];
  v5 = (void *)metadataExtractorJS_metadataExtractorJS;
  metadataExtractorJS_metadataExtractorJS = v4;
}

+ (id)chevron
{
  v2 = +[LPImage _systemImageNamed:@"chevron.forward"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_5);

  return v2;
}

id __22__LPResources_chevron__block_invoke()
{
  return +[LPImage _PNGImageNamed:@"Chevron" template:1 properties:0];
}

+ (id)safariIcon
{
  v2 = +[LPImage _systemImageNamed:@"safari"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_14);

  return v2;
}

id __25__LPResources_safariIcon__block_invoke()
{
  id v0 = +[LPImage _PNGImageNamed:@"Safari"];
  id v1 = [v0 _asTemplate];

  objc_msgSend(v1, "set_fallbackIcon:", 1);

  return v1;
}

+ (id)pagesIcon
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)pagesIcon;
  if (!pagesIcon)
  {
    v3 = imagePropertiesForLocalApplicationIcon();
    uint64_t v4 = +[LPImage _PNGImageNamed:@"Pages" template:0 properties:v3];
    v5 = (void *)pagesIcon;
    pagesIcon = v4;

    id v6 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/pages.png");
    v11 = v6;
    v7 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/pages@2x.png");
    v12 = v7;
    v8 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/pages@3x.png");
    v13 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
    objc_msgSend((id)pagesIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)pagesIcon;
  }

  return v2;
}

+ (id)notesIcon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)notesIcon;
  if (!notesIcon)
  {
    uint64_t v3 = +[LPImage _PNGImageNamed:@"Notes" template:0 properties:0];
    uint64_t v4 = (void *)notesIcon;
    notesIcon = v3;

    objc_msgSend((id)notesIcon, "set_precomposedAppIcon:", 1);
    v5 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/notes.png");
    v10 = v5;
    id v6 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/notes@2x.png");
    v11 = v6;
    v7 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/notes@3x.png");
    v12 = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];
    objc_msgSend((id)notesIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)notesIcon;
  }

  return v2;
}

+ (id)numbersIcon
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)numbersIcon;
  if (!numbersIcon)
  {
    uint64_t v3 = imagePropertiesForLocalApplicationIcon();
    uint64_t v4 = +[LPImage _PNGImageNamed:@"Numbers" template:0 properties:v3];
    v5 = (void *)numbersIcon;
    numbersIcon = v4;

    id v6 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/numbers.png");
    v11 = v6;
    v7 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/numbers@2x.png");
    v12 = v7;
    v8 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/numbers@3x.png");
    uint64_t v13 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
    objc_msgSend((id)numbersIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)numbersIcon;
  }

  return v2;
}

+ (id)keynoteIcon
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)keynoteIcon;
  if (!keynoteIcon)
  {
    uint64_t v3 = imagePropertiesForLocalApplicationIcon();
    uint64_t v4 = +[LPImage _PNGImageNamed:@"Keynote" template:0 properties:v3];
    v5 = (void *)keynoteIcon;
    keynoteIcon = v4;

    id v6 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/keynote.png");
    v11 = v6;
    v7 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/keynote@2x.png");
    v12 = v7;
    v8 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/keynote@3x.png");
    uint64_t v13 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
    objc_msgSend((id)keynoteIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)keynoteIcon;
  }

  return v2;
}

+ (id)iCloudDriveIcon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)iCloudDriveIcon;
  if (!iCloudDriveIcon)
  {
    uint64_t v3 = +[LPImage _PNGImageNamed:@"iCloudDrive" template:0 properties:0];
    uint64_t v4 = (void *)iCloudDriveIcon;
    iCloudDriveIcon = v3;

    objc_msgSend((id)iCloudDriveIcon, "set_precomposedAppIcon:", 1);
    v5 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/icloud.png");
    v10 = v5;
    id v6 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/icloud@2x.png");
    v11 = v6;
    v7 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/icloud@3x.png");
    v12 = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];
    objc_msgSend((id)iCloudDriveIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)iCloudDriveIcon;
  }

  return v2;
}

+ (id)remindersIcon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)remindersIcon;
  if (!remindersIcon)
  {
    uint64_t v3 = +[LPImage _PNGImageNamed:@"Reminders" template:0 properties:0];
    uint64_t v4 = (void *)remindersIcon;
    remindersIcon = v3;

    objc_msgSend((id)remindersIcon, "set_precomposedAppIcon:", 1);
    v5 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/reminders.png");
    v10 = v5;
    id v6 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/reminders@2x.png");
    v11 = v6;
    v7 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/reminders@3x.png");
    v12 = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];
    objc_msgSend((id)remindersIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)remindersIcon;
  }

  return v2;
}

+ (id)searchGlyph
{
  v2 = +[LPImage _systemImageNamed:@"magnifyingglass"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_95);

  return v2;
}

id __26__LPResources_searchGlyph__block_invoke()
{
  return +[LPImage _PNGImageNamed:@"Search" template:1 properties:0];
}

+ (id)playButton
{
  v2 = +[LPImage _systemImageNamed:@"play.fill"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_103);

  return v2;
}

id __25__LPResources_playButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:@"Play"];
}

+ (id)pauseButton
{
  v2 = +[LPImage _systemImageNamed:@"pause.fill"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_111);

  return v2;
}

id __26__LPResources_pauseButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:@"Pause"];
}

+ (id)muteButton
{
  v2 = +[LPImage _systemImageNamed:@"speaker.slash.fill"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_119_0);

  return v2;
}

id __25__LPResources_muteButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:@"Mute"];
}

+ (id)unmuteButton
{
  v2 = +[LPImage _systemImageNamed:@"speaker.wave.2.fill"];
  objc_msgSend(v2, "set_alternateHTMLImageGenerator:", &__block_literal_global_127_0);

  return v2;
}

id __27__LPResources_unmuteButton__block_invoke()
{
  return +[LPImage _PNGImageNamed:@"Unmute"];
}

+ (id)arKitButton
{
  return +[LPImage _systemImageNamed:@"arkit"];
}

+ (id)faceTimeIcon
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)faceTimeIcon;
  if (!faceTimeIcon)
  {
    uint64_t v3 = +[LPImage _systemImageNamed:@"video.fill"];
    uint64_t v4 = (void *)faceTimeIcon;
    faceTimeIcon = v3;

    v5 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/FaceTime_icon_white_1x.png");
    v10 = v5;
    id v6 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/FaceTime_icon_white_2x.png");
    v11 = v6;
    v7 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/FaceTime_icon_white_3x.png");
    v12 = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];
    objc_msgSend((id)faceTimeIcon, "set_remoteURLsForEmailCompatibleOutput:", v8, v10, v11);

    v2 = (void *)faceTimeIcon;
  }

  return v2;
}

+ (id)freeformIcon
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)freeformIcon;
  if (!freeformIcon)
  {
    uint64_t v3 = imagePropertiesForLocalApplicationIcon();
    uint64_t v4 = +[LPImage _PNGImageNamed:@"Freeform" template:0 properties:v3];
    v5 = (void *)freeformIcon;
    freeformIcon = v4;

    id v6 = remoteURL(1, @"https://www.icloud.com/mail_resources/app_icons/freeform.png");
    v11 = v6;
    v7 = remoteURL(2, @"https://www.icloud.com/mail_resources/app_icons/freeform@2x.png");
    v12 = v7;
    v8 = remoteURL(3, @"https://www.icloud.com/mail_resources/app_icons/freeform@3x.png");
    uint64_t v13 = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:3];
    objc_msgSend((id)freeformIcon, "set_remoteURLsForEmailCompatibleOutput:", v9, v11, v12);

    v2 = (void *)freeformIcon;
  }

  return v2;
}

+ (id)_safariAppIconForSize:(double)a3
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:@"com.apple.mobilesafari"];
  id v5 = objc_alloc(MEMORY[0x1E4F6F258]);
  objc_msgSend(MEMORY[0x1E4FB1BA8], "_lp_mainScreenScale");
  v7 = objc_msgSend(v5, "initWithSize:scale:", a3, a3, v6);
  [v7 setShouldApplyMask:0];
  v8 = [v4 prepareImageForDescriptor:v7];
  uint64_t v9 = [v8 CGImage];
  v10 = [LPImage alloc];
  v11 = imagePropertiesForLocalApplicationIcon();
  id v12 = [(LPImage *)v10 _initWithCGImage:v9 properties:v11];

  return v12;
}

+ (id)safariAppIconBadge
{
  uint64_t v3 = (void *)safariAppIconBadge;
  if (!safariAppIconBadge)
  {
    +[LPTheme badgeIconSizeInPoints];
    uint64_t v4 = objc_msgSend(a1, "_safariAppIconForSize:");
    id v5 = (void *)safariAppIconBadge;
    safariAppIconBadge = v4;

    uint64_t v3 = (void *)safariAppIconBadge;
  }

  return v3;
}

+ (id)safariAppIcon
{
  uint64_t v3 = (void *)safariAppIcon;
  if (!safariAppIcon)
  {
    +[LPTheme largestIconSizeInPoints];
    uint64_t v4 = objc_msgSend(a1, "_safariAppIconForSize:");
    id v5 = (void *)safariAppIcon;
    safariAppIcon = v4;

    uint64_t v3 = (void *)safariAppIcon;
  }

  return v3;
}

+ (id)fileIcon
{
  return +[LPImage _systemImageNamed:@"doc"];
}

+ (id)textIcon
{
  return +[LPImage _systemImageNamed:@"text.cursor"];
}

+ (id)iCloudIcon
{
  return +[LPImage _systemImageNamed:@"icloud"];
}

+ (id)mapIcon
{
  return +[LPImage _systemImageNamed:@"map"];
}

+ (id)linkIcon
{
  return +[LPImage _systemImageNamed:@"link"];
}

+ (id)telephoneIcon
{
  return +[LPImage _systemImageNamed:@"phone"];
}

+ (id)transportDriveIcon
{
  return +[LPImage _systemImageNamed:@"car.fill"];
}

+ (id)transportTransitIcon
{
  return +[LPImage _systemImageNamed:@"tram.fill"];
}

+ (id)transportBicycleIcon
{
  return +[LPImage _systemImageNamed:@"bicycle"];
}

+ (id)transportWalkIcon
{
  return +[LPImage _systemImageNamed:@"figure.walk"];
}

+ (id)openQuote
{
  return +[LPImage _PDFImageNamed:@"OpenQuote" template:1];
}

+ (id)closeQuote
{
  return +[LPImage _PDFImageNamed:@"CloseQuote" template:1];
}

+ (id)appClipIcon
{
  return +[LPImage _systemImageNamed:@"bolt.fill"];
}

+ (id)passwordsInviteIcon
{
  v2 = [MEMORY[0x1E4FB1618] tintColor];
  uint64_t v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:(uint64_t)*MEMORY[0x1E4FB29C8] weight:60.0];
  uint64_t v4 = [MEMORY[0x1E4FB1830] configurationWithHierarchicalColor:v2];
  id v5 = [v3 configurationByApplyingConfiguration:v4];

  double v6 = +[LPImage _systemImageNamed:@"person.2.badge.key.fill" withSymbolConfiguration:v5];
  objc_msgSend(v6, "set_isNonFallbackSymbolImage:", 1);

  return v6;
}

+ (id)linkBackgroundColor
{
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.898 green:0.901 blue:0.914 alpha:1.0];
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.361 green:0.333 blue:0.325 alpha:1.0];
  uint64_t v4 = (void *)linkBackgroundColor_color;
  if (!linkBackgroundColor_color)
  {
    uint64_t v5 = dynamicColorWithVariants(@"LPLinkBackgroundColor", v2, 0, v3, 0);
    double v6 = (void *)linkBackgroundColor_color;
    linkBackgroundColor_color = v5;

    uint64_t v4 = (void *)linkBackgroundColor_color;
  }
  id v7 = v4;

  return v7;
}

+ (id)linkMediaBackgroundColor
{
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:0.965 alpha:1.0];
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.255 green:0.235 blue:0.227 alpha:1.0];
  uint64_t v4 = (void *)linkMediaBackgroundColor_color;
  if (!linkMediaBackgroundColor_color)
  {
    uint64_t v5 = dynamicColorWithVariants(@"LPLinkMediaBackgroundColor", v2, 0, v3, 0);
    double v6 = (void *)linkMediaBackgroundColor_color;
    linkMediaBackgroundColor_color = v5;

    uint64_t v4 = (void *)linkMediaBackgroundColor_color;
  }
  id v7 = v4;

  return v7;
}

+ (id)tapToLoadHighlightColor
{
  v2 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.7];
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.2];
  uint64_t v4 = (void *)tapToLoadHighlightColor_color;
  if (!tapToLoadHighlightColor_color)
  {
    uint64_t v5 = dynamicColorWithVariants(@"LPTapToLoadHighlightColor", v2, 0, v3, 0);
    double v6 = (void *)tapToLoadHighlightColor_color;
    tapToLoadHighlightColor_color = v5;

    uint64_t v4 = (void *)tapToLoadHighlightColor_color;
  }
  id v7 = v4;

  return v7;
}

+ (id)tweetBackgroundColor
{
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.92 green:0.97 blue:1.0 alpha:1.0];
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.878 green:0.929 blue:0.961 alpha:1.0];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.012 green:0.153 blue:0.247 alpha:1.0];
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.051 green:0.192 blue:0.282 alpha:1.0];
  double v6 = (void *)tweetBackgroundColor_color;
  if (!tweetBackgroundColor_color)
  {
    uint64_t v7 = dynamicColorWithVariants(@"LPTweetBackgroundColor", v2, v3, v4, v5);
    v8 = (void *)tweetBackgroundColor_color;
    tweetBackgroundColor_color = v7;

    double v6 = (void *)tweetBackgroundColor_color;
  }
  id v9 = v6;

  return v9;
}

+ (id)weiboBackgroundColor
{
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.929 blue:0.878 alpha:1.0];
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.961 green:0.89 blue:0.839 alpha:1.0];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.259 green:0.196 blue:0.196 alpha:1.0];
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.298 green:0.231 blue:0.231 alpha:1.0];
  double v6 = (void *)weiboBackgroundColor_color;
  if (!weiboBackgroundColor_color)
  {
    uint64_t v7 = dynamicColorWithVariants(@"LPWeiboBackgroundColor", v2, v3, v4, v5);
    v8 = (void *)weiboBackgroundColor_color;
    weiboBackgroundColor_color = v7;

    double v6 = (void *)weiboBackgroundColor_color;
  }
  id v9 = v6;

  return v9;
}

+ (id)appleMusicKeyColor
{
  v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.98 green:0.137 blue:0.231 alpha:1.0];
  uint64_t v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.839 green:0.0 blue:0.09 alpha:1.0];
  uint64_t v4 = [MEMORY[0x1E4FB1618] colorWithRed:0.98 green:0.176 blue:0.282 alpha:1.0];
  uint64_t v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.98 green:0.345 blue:0.416 alpha:1.0];
  double v6 = (void *)appleMusicKeyColor_color;
  if (!appleMusicKeyColor_color)
  {
    uint64_t v7 = dynamicColorWithVariants(@"LPAppleMusicKeyColor", v2, v3, v4, v5);
    v8 = (void *)appleMusicKeyColor_color;
    appleMusicKeyColor_color = v7;

    double v6 = (void *)appleMusicKeyColor_color;
  }
  id v9 = v6;

  return v9;
}

+ (void)clearCachedResources
{
  v2 = (void *)pagesIcon;
  pagesIcon = 0;

  uint64_t v3 = (void *)notesIcon;
  notesIcon = 0;

  uint64_t v4 = (void *)numbersIcon;
  numbersIcon = 0;

  uint64_t v5 = (void *)keynoteIcon;
  keynoteIcon = 0;

  double v6 = (void *)iCloudDriveIcon;
  iCloudDriveIcon = 0;

  uint64_t v7 = (void *)remindersIcon;
  remindersIcon = 0;

  v8 = (void *)freeformIcon;
  freeformIcon = 0;
}

+ (id)faceTimeBackgroundColor
{
  id v2 = objc_msgSend(self, sel_systemGreenColor);

  return v2;
}

@end