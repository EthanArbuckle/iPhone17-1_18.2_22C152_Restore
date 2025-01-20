@interface INAddTasksIntent
@end

@implementation INAddTasksIntent

void __57__INAddTasksIntent_ACSCardRequesting__requestCard_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v18[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  v6 = [v5 title];
  v7 = [v6 spokenPhrase];

  v8 = objc_msgSend(MEMORY[0x263F67870], "acs_uniquelyIdentifiedCardSection");
  id v9 = objc_alloc_init(MEMORY[0x263F679F0]);
  id v10 = objc_alloc_init(MEMORY[0x263F678B8]);
  [v10 setIsBold:1];
  [v10 setText:v7];
  [v10 setTextColor:0];
  v18[0] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  [v9 setFormattedTextPieces:v11];

  [v8 setTitle:v9];
  if ([v5 taskType] == 2)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F677B8]);
    unint64_t v13 = [v5 status];
    if (v13 <= 2) {
      [v12 setIsSelected:(v13 & 7) == 2];
    }
    [v8 setButton:v12];
  }
  v14 = NSStringFromSelector(sel_addedTasks);
  v15 = [MEMORY[0x263F0FCE0] parameterForClass:objc_opt_class() keyPath:v14];
  [v15 setIndex:a3 forSubKeyPath:v14];
  v17 = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  objc_msgSend(v8, "acs_setParameters:", v16);

  [*(id *)(a1 + 32) addObject:v8];
}

@end