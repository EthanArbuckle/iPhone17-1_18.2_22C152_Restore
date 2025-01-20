@interface NSURL(GSAdditions)
- (void)gs_chmod:()GSAdditions;
@end

@implementation NSURL(GSAdditions)

- (void)gs_chmod:()GSAdditions
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v9 = *MEMORY[0x1E4F28330];
  v6 = [NSNumber numberWithUnsignedShort:a3];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  v8 = [a1 path];
  [v5 setAttributes:v7 ofItemAtPath:v8 error:0];
}

@end