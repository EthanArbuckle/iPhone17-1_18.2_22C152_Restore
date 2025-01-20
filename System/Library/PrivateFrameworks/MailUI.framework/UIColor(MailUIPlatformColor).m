@interface UIColor(MailUIPlatformColor)
+ (uint64_t)colorNamed:()MailUIPlatformColor bundle:;
@end

@implementation UIColor(MailUIPlatformColor)

+ (uint64_t)colorNamed:()MailUIPlatformColor bundle:
{
  return [MEMORY[0x1E4FB1618] colorNamed:a3 inBundle:a4 compatibleWithTraitCollection:0];
}

@end