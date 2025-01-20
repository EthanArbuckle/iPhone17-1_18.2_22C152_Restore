@interface NSSet
@end

@implementation NSSet

id __44__NSSet_CRKAdditions__crk_filterUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(unsigned int (**)(uint64_t, id))(v2 + 16);
  id v4 = a2;
  if (v3(v2, v4)) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end