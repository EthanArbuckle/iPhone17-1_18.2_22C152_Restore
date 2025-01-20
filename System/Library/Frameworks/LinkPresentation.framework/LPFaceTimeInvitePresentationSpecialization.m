@interface LPFaceTimeInvitePresentationSpecialization
+ (id)captionButtonProperties;
+ (id)collapsedButtonIcon;
@end

@implementation LPFaceTimeInvitePresentationSpecialization

+ (id)captionButtonProperties
{
  v2 = objc_alloc_init(LPCaptionButtonPresentationProperties);
  v3 = LPLocalizedString(@"Join");
  [(LPCaptionButtonPresentationProperties *)v2 setText:v3];

  [(LPCaptionButtonPresentationProperties *)v2 setType:1];
  v4 = objc_alloc_init(LPCaptionButtonCollapsedPresentationProperties);
  v5 = [(id)objc_opt_class() collapsedButtonIcon];
  [(LPCaptionButtonCollapsedPresentationProperties *)v4 setIcon:v5];

  [(LPCaptionButtonCollapsedPresentationProperties *)v4 setLayoutRatioThreshold:0.349999994];
  [(LPCaptionButtonPresentationProperties *)v2 setCollapsedButton:v4];

  return v2;
}

+ (id)collapsedButtonIcon
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = (id)*MEMORY[0x1E4FB2928];
  v3 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v2 scale:2];
  v4 = (void *)MEMORY[0x1E4FB1830];
  v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v12[0] = v5;
  v6 = [MEMORY[0x1E4FB1618] systemGreenColor];
  v12[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v4 configurationWithPaletteColors:v7];
  v9 = [v3 configurationByApplyingConfiguration:v8];

  v10 = +[LPImage _systemImageNamed:@"video.circle.fill" withSymbolConfiguration:v9];

  return v10;
}

@end