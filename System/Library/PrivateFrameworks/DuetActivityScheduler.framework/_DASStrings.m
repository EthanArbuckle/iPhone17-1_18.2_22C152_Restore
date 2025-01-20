@interface _DASStrings
+ (id)fileProtectionStringNone;
@end

@implementation _DASStrings

+ (id)fileProtectionStringNone
{
  return (id)*MEMORY[0x1E4F28378];
}

@end