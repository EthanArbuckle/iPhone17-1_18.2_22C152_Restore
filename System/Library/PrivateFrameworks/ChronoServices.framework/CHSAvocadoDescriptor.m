@interface CHSAvocadoDescriptor
+ (void)load;
@end

@implementation CHSAvocadoDescriptor

+ (void)load
{
  v2 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v3 = objc_opt_class();
  [v2 setClass:v3 forClassName:@"CHSAvocadoDescriptor"];
}

@end