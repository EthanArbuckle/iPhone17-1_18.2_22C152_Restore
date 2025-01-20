@interface NSHashTable(HMFoundation)
- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation;
@end

@implementation NSHashTable(HMFoundation)

- (void)hmf_enumerateWithAutoreleasePoolUsingBlock:()HMFoundation
{
  v4 = a3;
  v5 = (void *)MEMORY[0x19F3A87A0]();
  char v10 = 0;
  v6 = [a1 objectEnumerator];
  v7 = 0;
  while (1)
  {
    v8 = v7;
    v9 = (void *)MEMORY[0x19F3A87A0]();
    v7 = [v6 nextObject];

    if (!v7) {
      break;
    }
    v4[2](v4, v7, &v10);
    if (v10) {
      goto LABEL_6;
    }
  }
LABEL_6:
}

@end