@interface _DPErrorUtilities
+ (BOOL)isCoreDataFatalError:(id)a3;
@end

@implementation _DPErrorUtilities

+ (BOOL)isCoreDataFatalError:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F1BF50]];

  LOBYTE(v3) = [v4 isEqualToValue:&unk_1F372C6A8];
  return (char)v3;
}

@end