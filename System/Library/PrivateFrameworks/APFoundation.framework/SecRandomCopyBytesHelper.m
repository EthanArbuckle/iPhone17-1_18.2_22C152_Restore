@interface SecRandomCopyBytesHelper
+ (int)copyBytes:(void *)a3 withLength:(unint64_t)a4;
@end

@implementation SecRandomCopyBytesHelper

+ (int)copyBytes:(void *)a3 withLength:(unint64_t)a4
{
  return SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E4F3BC60], a4, a3);
}

@end