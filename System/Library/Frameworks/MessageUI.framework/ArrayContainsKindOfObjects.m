@interface ArrayContainsKindOfObjects
@end

@implementation ArrayContainsKindOfObjects

uint64_t ___ArrayContainsKindOfObjects_block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end