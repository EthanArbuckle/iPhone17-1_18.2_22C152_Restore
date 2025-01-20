@interface AFSpeakableUtteranceParser
@end

@implementation AFSpeakableUtteranceParser

void __80__AFSpeakableUtteranceParser_AssistantUIAdditions___domainsForStringWithFormat___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([v12 isEqualToString:@"@"])
  {
    uint64_t v3 = *(void *)(a1 + 40);
LABEL_5:
    *(unsigned char *)(*(void *)(v3 + 8) + 24) = 1;
    goto LABEL_6;
  }
  if ([v12 isEqualToString:@"{"])
  {
    uint64_t v3 = *(void *)(a1 + 48);
    goto LABEL_5;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    && *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    int v4 = [v12 isEqualToString:@"#"];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void *)(v5 + 40);
    if (v4)
    {
      if (v6)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:");
        uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
        v8 = *(void **)(v7 + 40);
        *(void *)(v7 + 40) = 0;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      }
    }
    else if (v6)
    {
      [*(id *)(v5 + 40) appendString:v12];
    }
    else
    {
      uint64_t v9 = [objc_alloc(MEMORY[0x263F089D8]) initWithString:v12];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
  }
LABEL_6:
}

@end