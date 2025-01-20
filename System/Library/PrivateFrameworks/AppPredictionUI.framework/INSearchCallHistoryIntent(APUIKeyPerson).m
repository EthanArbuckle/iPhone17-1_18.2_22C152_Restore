@interface INSearchCallHistoryIntent(APUIKeyPerson)
- (id)apui_keyPeople;
@end

@implementation INSearchCallHistoryIntent(APUIKeyPerson)

- (id)apui_keyPeople
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = [a1 recipient];
  v2 = (void *)v1;
  if (v1)
  {
    v5[0] = v1;
    v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end