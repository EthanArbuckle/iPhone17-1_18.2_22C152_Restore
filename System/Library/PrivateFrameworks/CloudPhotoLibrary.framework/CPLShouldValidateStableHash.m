@interface CPLShouldValidateStableHash
@end

@implementation CPLShouldValidateStableHash

void ___CPLShouldValidateStableHash_block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _CPLShouldValidateStableHash_result = [v0 BOOLForKey:@"CPLShouldValidateStableHashOnUpload"];
}

@end