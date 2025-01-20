@interface VCTailspinUtil
+ (BOOL)tailspinDumpOutput:(int)a3 reason:(id)a4;
@end

@implementation VCTailspinUtil

+ (BOOL)tailspinDumpOutput:(int)a3 reason:(id)a4
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *MEMORY[0x1E4FBA9B0];
  v6[0] = *MEMORY[0x1E4FBA9B8];
  v6[1] = v4;
  v7[0] = a4;
  v7[1] = &unk_1F3DC4638;
  v6[2] = *MEMORY[0x1E4FBA9C8];
  v7[2] = [NSNumber numberWithInt:getpid()];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  return tailspin_dump_output_with_options_sync();
}

@end