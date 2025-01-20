@interface SFCardSection(CRCardSection)
- (BOOL)hasNextCard;
- (id)actionCommands;
- (id)backingCardSection;
- (id)cardSectionIdentifier;
- (id)parametersForInteraction:()CRCardSection;
- (uint64_t)resolvedCardSections;
- (void)cardSectionIdentifier;
@end

@implementation SFCardSection(CRCardSection)

- (id)backingCardSection
{
  if ([a1 conformsToProtocol:&unk_26DB19740]) {
    id v2 = a1;
  }
  else {
    id v2 = 0;
  }
  return v2;
}

- (id)parametersForInteraction:()CRCardSection
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 intent];
  v30 = [v4 intentResponse];
  v31 = v5;
  v6 = [v5 _intentInstanceDescription];
  v7 = [v6 name];
  v29 = [v6 responseName];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v8 = [a1 backingCardSection];
  v9 = [v8 parameterKeyPaths];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (!v10)
  {

LABEL_23:
    if ([v31 _type] == 2) {
      id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    }
    else {
      id v12 = 0;
    }
    goto LABEL_26;
  }
  uint64_t v11 = v10;
  v27 = v6;
  id v28 = v4;
  id v12 = 0;
  uint64_t v13 = *(void *)v33;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v33 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      uint64_t v16 = [v15 rangeOfString:@"."];
      if (v16 == 0x7FFFFFFFFFFFFFFFLL && v17 == 0)
      {
        v21 = 0;
        v22 = 0;
      }
      else
      {
        uint64_t v19 = v16;
        uint64_t v20 = v17;
        v21 = [v15 substringToIndex:v16];
        v22 = [v15 substringFromIndex:v19 + v20];
      }
      if (([v21 isEqualToString:v7] & 1) != 0
        || [v21 isEqualToString:v29])
      {
        uint64_t v23 = [MEMORY[0x263F0FCE0] parameterForClass:objc_opt_class() keyPath:v22];
        if (v23)
        {
          v24 = (void *)v23;
          if (!v12) {
            id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
          }
          [v12 addObject:v24];
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  }
  while (v11);

  v6 = v27;
  id v4 = v28;
  if (!v12) {
    goto LABEL_23;
  }
LABEL_26:
  v25 = (void *)[v12 copy];

  return v25;
}

- (id)actionCommands
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263EFF980];
  v3 = [a1 backingCardSection];
  id v4 = [v3 commands];
  v5 = [v2 arrayWithArray:v4];

  v6 = [a1 backingCardSection];
  v7 = [v6 nextCard];

  if (v7)
  {
    v8 = objc_alloc_init(CRNextCardCommand);
    v9 = [a1 backingCardSection];
    uint64_t v10 = [v9 nextCard];
    [(CRNextCardCommand *)v8 setNextCard:v10];

    [v5 addObject:v8];
  }
  uint64_t v11 = [a1 backingCardSection];
  id v12 = [v11 punchoutOptions];

  if (v12)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v19 = objc_alloc_init(CRPunchoutCommand);
          -[CRPunchoutCommand setPunchout:](v19, "setPunchout:", v18, (void)v22);
          [v5 addObject:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
  }
  uint64_t v20 = objc_msgSend(v5, "copy", (void)v22);

  return v20;
}

- (BOOL)hasNextCard
{
  v1 = [a1 backingCardSection];
  id v2 = [v1 nextCard];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)cardSectionIdentifier
{
  id v2 = [a1 cardSectionId];
  BOOL v3 = v2;
  if (!v2 || ![v2 length] || objc_msgSend(v3, "isEqualToString:", @"0"))
  {
    id v4 = [MEMORY[0x263F08C38] UUID];
    v5 = [v4 UUIDString];

    v6 = CRLogContextCards;
    if (os_log_type_enabled((os_log_t)CRLogContextCards, OS_LOG_TYPE_ERROR)) {
      [(SFCardSection(CRCardSection) *)(uint64_t)a1 cardSectionIdentifier];
    }
    [a1 setCardSectionId:v5];
  }
  v7 = [a1 cardSectionId];

  return v7;
}

- (uint64_t)resolvedCardSections
{
  return 0;
}

- (void)cardSectionIdentifier
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_226EA8000, log, OS_LOG_TYPE_ERROR, "Card section %@ does not have a card section identifier. This is a requirement. Category CRCardSection on SFCardSection is setting one (%@) on the client's behalf as a workaround", (uint8_t *)&v3, 0x16u);
}

@end