@interface LARight
- (id)_authOptionsWithLocalizedReason:(void *)a3 presentationContext:;
@end

@implementation LARight

- (id)_authOptionsWithLocalizedReason:(void *)a3 presentationContext:
{
  v14[1] = *MEMORY[0x263EF8340];
  v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [NSNumber numberWithInteger:*MEMORY[0x263F523B0]];
    v8 = (void *)v7;
    v9 = &stru_26F31E768;
    if (v5) {
      v9 = v5;
    }
    uint64_t v13 = v7;
    v14[0] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:&v13 count:1];
    a1 = (void *)[v10 mutableCopy];

    if (v6)
    {
      v11 = [NSNumber numberWithInteger:*MEMORY[0x263F52410]];
      [a1 setObject:v6 forKeyedSubscript:v11];
    }
  }

  return a1;
}

@end