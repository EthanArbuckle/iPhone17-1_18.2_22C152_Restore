@interface GKTextStylePad
+ (double)standardFontSize;
- (id)cellActionItem;
- (id)header1;
- (id)header2;
- (id)header3;
- (id)header4;
- (id)sectionCaptionSmall;
- (id)smallInfo;
@end

@implementation GKTextStylePad

+ (double)standardFontSize
{
  return 18.0;
}

- (id)header1
{
  id v4 = [(GKTextStyle *)self copy];
  v5 = [(GKTextStyle *)self palette];
  v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:48.0];
  return v4;
}

- (id)header2
{
  id v4 = [(GKTextStyle *)self copy];
  v5 = [(GKTextStyle *)self palette];
  v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:41.0];
  return v4;
}

- (id)header3
{
  id v4 = [(GKTextStyle *)self copy];
  v5 = [(GKTextStyle *)self palette];
  v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicLightSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:32.0];
  return v4;
}

- (id)header4
{
  id v4 = [(GKTextStyle *)self copy];
  v5 = [(GKTextStyle *)self palette];
  v6 = [v5 emphasizedTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:18.0];
  return v4;
}

- (id)smallInfo
{
  id v4 = [(GKTextStyle *)self copy];
  v5 = [(GKTextStyle *)self palette];
  v6 = [v5 standardTextColor];
  [v4 setColor:v6];

  [v4 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v4 setFontSize:a2 rebaseSelector:14.0];
  return v4;
}

- (id)sectionCaptionSmall
{
  id v3 = [(GKTextStyle *)self copy];
  [v3 setFontName:@"GKMagicSystemFont" rebaseSelector:a2];
  [v3 setFontSize:a2 rebaseSelector:10.0];
  return v3;
}

- (id)cellActionItem
{
  id v4 = [(GKTextStyle *)self copy];
  v5 = [(GKTextStyle *)self palette];
  v6 = [v5 emphasizedTextOnDarkBackgroundColor];
  [v4 setColor:v6];

  [v4 setFontSize:a2 rebaseSelector:18.0];
  [v4 setTextAlignment:1];
  return v4;
}

@end