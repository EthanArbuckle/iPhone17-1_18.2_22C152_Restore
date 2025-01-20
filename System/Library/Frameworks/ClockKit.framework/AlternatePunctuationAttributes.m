@interface AlternatePunctuationAttributes
@end

@implementation AlternatePunctuationAttributes

void ___AlternatePunctuationAttributes_block_invoke()
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F83518];
  uint64_t v0 = *MEMORY[0x263F83530];
  v5[0] = *MEMORY[0x263F83548];
  v5[1] = v0;
  v6[0] = &unk_26CCDBF98;
  v6[1] = &unk_26CCDBFB0;
  v1 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];
  v7 = v1;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v7 count:1];
  v9[0] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v4 = (void *)_AlternatePunctuationAttributes___altPunctAttr;
  _AlternatePunctuationAttributes___altPunctAttr = v3;
}

@end