@interface CNUILikenessFingerprintGroupImpl
@end

@implementation CNUILikenessFingerprintGroupImpl

uint64_t __48___CNUILikenessFingerprintGroupImpl_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 description];
}

uint64_t __58___CNUILikenessFingerprintGroupImpl_hasContactIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasContactIdentifier:*(void *)(a1 + 32)];
}

@end