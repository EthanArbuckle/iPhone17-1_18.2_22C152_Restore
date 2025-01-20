@interface WFParameterValueRegistry(ActionKit)
+ (id)allParameterValueClassesInActionKit;
@end

@implementation WFParameterValueRegistry(ActionKit)

+ (id)allParameterValueClassesInActionKit
{
  v2[12] = *MEMORY[0x263EF8340];
  v2[0] = +[WFPHAssetCollectionState processingValueClass];
  v2[1] = +[WFNSUnitSubstitutableState processingValueClass];
  v2[2] = +[WFPlaylistSubstitutableState processingValueClass];
  v2[3] = +[WFTrelloBoardSubstitutableState processingValueClass];
  v2[4] = +[WFTrelloListSubstitutableState processingValueClass];
  v2[5] = +[WFTrelloBoardSubstitutableState processingValueClass];
  v2[6] = +[WFMediaRouteState processingValueClass];
  v2[7] = +[WFTumblrBlogSubstitutableState processingValueClass];
  v2[8] = +[WFFIUIWorkoutActivityTypeSubstitutableState processingValueClass];
  v2[9] = +[WFSSHKeyParameterState processingValueClass];
  v2[10] = +[WFLinkDynamicOptionSubstitutableState processingValueClass];
  v2[11] = objc_opt_class();
  v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v2 count:12];
  return v0;
}

@end