@interface NSError(FBSSceneEvent)
+ (uint64_t)sceneMessageErrorWithCode:()FBSSceneEvent;
@end

@implementation NSError(FBSSceneEvent)

+ (uint64_t)sceneMessageErrorWithCode:()FBSSceneEvent
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"FBSSceneMessage" code:a3 userInfo:0];
}

@end