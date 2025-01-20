@interface StringEscapingGlobPatternsForLikePredicate
@end

@implementation StringEscapingGlobPatternsForLikePredicate

void ___StringEscapingGlobPatternsForLikePredicate_block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v7 = v3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if ([(__CFString *)v3 isEqualToString:@"\\""])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_20;
    }
    if ([(__CFString *)v7 isEqualToString:@"*"]) {
      goto LABEL_9;
    }
    if (![(__CFString *)v7 isEqualToString:@"?"])
    {
      if ([(__CFString *)v7 isEqualToString:@"~"])
      {
        [*(id *)(a1 + 32) appendString:@"~"];
        v4 = *(void **)(a1 + 32);
        v5 = @"~";
        goto LABEL_19;
      }
      if ([(__CFString *)v7 isEqualToString:@"%"])
      {
        [*(id *)(a1 + 32) appendString:@"~"];
LABEL_9:
        v4 = *(void **)(a1 + 32);
        v5 = @"%";
LABEL_19:
        [v4 appendString:v5];
        goto LABEL_20;
      }
      int v6 = [(__CFString *)v7 isEqualToString:@"_"];
      v4 = *(void **)(a1 + 32);
      if (!v6)
      {
        v5 = v7;
        goto LABEL_19;
      }
      [v4 appendString:@"~"];
    }
    v4 = *(void **)(a1 + 32);
    v5 = @"_";
    goto LABEL_19;
  }
  if (([(__CFString *)v3 isEqualToString:@"%"] & 1) != 0
    || [(__CFString *)v7 isEqualToString:@"_"])
  {
    [*(id *)(a1 + 32) appendString:@"~"];
  }
  [*(id *)(a1 + 32) appendString:v7];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_20:
}

@end