@interface MPAdvanceRepeatModeCommand
- (id)newCommandEventWithPreservesRepeatMode:(BOOL)a3;
@end

@implementation MPAdvanceRepeatModeCommand

- (id)newCommandEventWithPreservesRepeatMode:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MPRemoteCommand *)self mediaRemoteCommandType];
  uint64_t v10 = *MEMORY[0x1E4F772C0];
  v6 = [NSNumber numberWithBool:v3];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = [(MPRemoteCommand *)self newCommandEventWithCommandType:v5 options:v7];

  return v8;
}

@end