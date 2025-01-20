@interface HKFactorization
@end

@implementation HKFactorization

uint64_t __30___HKFactorization_unitString__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 unitString];
  uint64_t v6 = v5;
  if (v5)
  {
    if (a3 >= 1)
    {
      uint64_t v9 = v5;
      if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        [*(id *)(a1 + 32) appendString:@"·"];
        uint64_t v6 = v9;
      }
      [*(id *)(a1 + 32) appendString:v6];
      if ((unint64_t)a3 >= 2) {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"^%ld", a3);
      }
      uint64_t v7 = *(void *)(a1 + 48);
LABEL_8:
      ++*(void *)(*(void *)(v7 + 8) + 24);
      goto LABEL_10;
    }
    if (a3 < 0)
    {
      uint64_t v10 = v5;
      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
      {
        [*(id *)(a1 + 40) appendString:@"·"];
        uint64_t v6 = v10;
      }
      [*(id *)(a1 + 40) appendString:v6];
      if (a3 != -1) {
        objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"^%ld", -a3);
      }
      uint64_t v7 = *(void *)(a1 + 56);
      goto LABEL_8;
    }
  }
LABEL_10:

  return MEMORY[0x1F41817F8]();
}

uint64_t __33___HKFactorization_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _multiplyByFactor:a2 exponent:a3];
}

void __37___HKFactorization__raiseToExponent___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v3 = NSNumber;
  v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40) * a3;
  id v6 = a2;
  id v7 = [v3 numberWithInteger:v5];
  [v4 setObject:v7 forKey:v6];
}

uint64_t __45___HKFactorization__multiplyByFactorization___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _multiplyByFactor:a2 exponent:a3];
}

void __24___HKFactorization_hash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 hash];
  uint64_t v7 = [v5 hash];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v7 ^ v6;
}

void __36___HKFactorization_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 addObject:a2];
  [*(id *)(a1 + 40) addObject:v6];
}

@end