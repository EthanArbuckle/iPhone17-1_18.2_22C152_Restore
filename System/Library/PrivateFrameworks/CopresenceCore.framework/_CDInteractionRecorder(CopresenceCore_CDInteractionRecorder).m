@interface _CDInteractionRecorder(CopresenceCore_CDInteractionRecorder)
+ (uint64_t)sharedInstance;
@end

@implementation _CDInteractionRecorder(CopresenceCore_CDInteractionRecorder)

+ (uint64_t)sharedInstance
{
  return [MEMORY[0x1E4F5B3F8] interactionRecorder];
}

@end