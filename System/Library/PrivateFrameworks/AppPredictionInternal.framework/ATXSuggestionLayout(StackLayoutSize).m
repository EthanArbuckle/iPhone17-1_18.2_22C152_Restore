@interface ATXSuggestionLayout(StackLayoutSize)
+ (id)uiLayoutTypesForStackLayoutSize:()StackLayoutSize;
@end

@implementation ATXSuggestionLayout(StackLayoutSize)

+ (id)uiLayoutTypesForStackLayoutSize:()StackLayoutSize
{
  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F27F2460, &unk_1F27F2478, &unk_1F27F2490, 0, v9, v10, v11, v12, v13);
      goto LABEL_7;
    case 1:
      v4 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F27F2490, &unk_1F27F24A8, &unk_1F27F24C0, &unk_1F27F24D8, &unk_1F27F24F0, &unk_1F27F2508, &unk_1F27F2520, &unk_1F27F2538, 0);
      goto LABEL_7;
    case 2:
      v4 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F27F2550, &unk_1F27F2568, 0, v8, v9, v10, v11, v12, v13);
      goto LABEL_7;
    case 3:
      v3 = objc_opt_new();
      break;
    case 4:
      v4 = (void *)MEMORY[0x1D25F6CC0]();
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1F27F2580, 0, v7, v8, v9, v10, v11, v12, v13);
LABEL_7:
      v3 = (void *)v5;
      break;
    default:
      break;
  }
  return v3;
}

@end