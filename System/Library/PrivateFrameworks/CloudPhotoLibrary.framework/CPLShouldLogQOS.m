@interface CPLShouldLogQOS
@end

@implementation CPLShouldLogQOS

void ____CPLShouldLogQOS_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  __CPLShouldLogQOS_debugQOS = [v0 BOOLForKey:@"CPLDebugQOS"];
}

@end