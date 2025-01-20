@interface CRMockAsyncCard
- (BOOL)asynchronous;
- (void)loadCardWithCompletion:(id)a3;
@end

@implementation CRMockAsyncCard

- (BOOL)asynchronous
{
  return 1;
}

- (void)loadCardWithCompletion:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v28 = a3;
  v3 = objc_alloc_init(CRBasicCard);
  id v4 = objc_alloc_init(MEMORY[0x263F67AA0]);
  [v4 setTitle:@"Title"];
  id v5 = objc_alloc_init(MEMORY[0x263F67A00]);
  v6 = [MEMORY[0x263F679F0] textWithString:@"Text1"];
  [v5 setLeadingText:v6];

  v7 = [v5 leadingText];
  [v7 setMaxLines:1];

  id v8 = objc_alloc_init(MEMORY[0x263F67A00]);
  v9 = [MEMORY[0x263F679F0] textWithString:@"Text2"];
  [v8 setLeadingText:v9];

  v10 = [v8 leadingText];
  [v10 setMaxLines:1];

  id v11 = objc_alloc_init(MEMORY[0x263F67A00]);
  v12 = [MEMORY[0x263F679F0] textWithString:@"More Info..."];
  [v11 setLeadingText:v12];

  v13 = (void *)MEMORY[0x263F679B0];
  v14 = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Main_Page"];
  v15 = [v13 punchoutWithURL:v14];
  v33[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:1];
  [v11 setPunchoutOptions:v16];

  v17 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v4];
  v32[0] = v17;
  v18 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v5];
  v32[1] = v18;
  v19 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v8];
  v32[2] = v19;
  v20 = +[CRBasicCardSection basicCardSectionWithBackingCardSection:v11];
  v32[3] = v20;
  v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:4];
  [(CRBasicCard *)v3 setCardSections:v21];

  v22 = [(CRBasicCard *)self interactions];
  [(CRBasicCard *)v3 setInteractions:v22];

  v23 = [(CRBasicCard *)self dismissalCommands];
  [(CRBasicCard *)v3 setDismissalCommands:v23];

  dispatch_time_t v24 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CRMockAsyncCard_loadCardWithCompletion___block_invoke;
  block[3] = &unk_2647EEF78;
  v30 = v3;
  id v31 = v28;
  v25 = v3;
  id v26 = v28;
  dispatch_after(v24, MEMORY[0x263EF83A0], block);
}

uint64_t __42__CRMockAsyncCard_loadCardWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end