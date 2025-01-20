@interface GKUtils
+ (BOOL)applicationLinkedOnOrAfter:(unsigned int)a3 macVersion:(unsigned int)a4;
@end

@implementation GKUtils

+ (BOOL)applicationLinkedOnOrAfter:(unsigned int)a3 macVersion:(unsigned int)a4
{
  return MEMORY[0x1F40CBEC8]((*(void *)&a3 << 32) | 2, a2);
}

@end