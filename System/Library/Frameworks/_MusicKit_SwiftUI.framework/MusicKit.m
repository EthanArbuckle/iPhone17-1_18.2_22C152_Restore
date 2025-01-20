@interface MusicKit
@end

@implementation MusicKit

void __88__MusicKit_SPI_SKCloudServiceSetupViewController__musicKit_underlyingOptionsForOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([v10 isEqualToString:@"musicKit_action"])
  {
    id v6 = (id)*MEMORY[0x263F18018];
    if ([v5 isNSString])
    {
      uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_musicKit_underlyingActionForAction:", v5);
      goto LABEL_4;
    }
LABEL_13:
    id v8 = 0;
    if (!v6) {
      goto LABEL_22;
    }
    goto LABEL_14;
  }
  if ([v10 isEqualToString:@"musicKit_iTunesItemIdentifier"])
  {
    v9 = (id *)MEMORY[0x263F18030];
LABEL_12:
    id v6 = *v9;
    goto LABEL_13;
  }
  if ([v10 isEqualToString:@"musicKit_affiliateToken"])
  {
    v9 = (id *)MEMORY[0x263F18020];
    goto LABEL_12;
  }
  if ([v10 isEqualToString:@"musicKit_campaignToken"])
  {
    v9 = (id *)MEMORY[0x263F18028];
    goto LABEL_12;
  }
  if (![v10 isEqualToString:@"musicKit_messageIdentifier"])
  {
    id v8 = 0;
    goto LABEL_22;
  }
  id v6 = (id)*MEMORY[0x263F18038];
  if (![v5 isNSString]) {
    goto LABEL_13;
  }
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "_musicKit_underlyingMessageIdentifierForMessageIdentifier:", v5);
LABEL_4:
  id v8 = (id)v7;
  if (!v6)
  {
LABEL_22:
    id v6 = v10;
    if (v8) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_14:
  if (v8) {
    goto LABEL_15;
  }
LABEL_23:
  id v8 = v5;
LABEL_15:
  [*(id *)(a1 + 40) setObject:v8 forKey:v6];
}

@end