@interface FPConflictLoser
+ (id)gsNamespace;
@end

@implementation FPConflictLoser

+ (id)gsNamespace
{
  return (id)*MEMORY[0x1E4F63BD0];
}

@end