@interface MFAtomFieldEditor
@end

@implementation MFAtomFieldEditor

void __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  v16 = objc_alloc_init(_MFAtomViewTextSelectionRect);
  -[_MFAtomViewTextSelectionRect setRect:](v16, "setRect:", a5, a6, a7, a8);
  [(_MFAtomViewTextSelectionRect *)v16 setWritingDirection:a2];
  [(_MFAtomViewTextSelectionRect *)v16 setContainsStart:a3];
  [(_MFAtomViewTextSelectionRect *)v16 setContainsEnd:a4];
  [*(id *)(a1 + 32) addObject:v16];
}

void __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 56);
  BOOL v9 = a3 == v8;
  uint64_t v10 = a3 + a4;
  uint64_t v11 = *(void *)(a1 + 64) + v8;
  BOOL v12 = a3 + a4 == v11;
  id v31 = v7;
  v13 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  v30 = v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = [v13 atomView];
    v15 = *(void **)(a1 + 32);
    [v14 selectionBounds];
    objc_msgSend(v15, "convertRect:fromView:", v14);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_3;
    aBlock[3] = &__block_descriptor_64_e39__CGRect__CGPoint_dd__CGSize_dd__12__0B8l;
    aBlock[4] = v16;
    aBlock[5] = v17;
    aBlock[6] = v18;
    aBlock[7] = v19;
    v20 = (void (**)(void, void))_Block_copy(aBlock);
    v21 = *(void **)(a1 + 32);
    v22 = [v21 beginningOfDocument];
    v23 = [v21 positionFromPosition:v22 offset:a3];
    uint64_t v24 = [v21 baseWritingDirectionForPosition:v23 inDirection:0];

    if (a3 == v8)
    {
      ((void (**)(void, BOOL))v20)[2](v20, v24 == 1);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    if (v10 == v11)
    {
      ((void (**)(void, BOOL))v20)[2](v20, v24 != 1);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    v25 = *(void **)(a1 + 32);
    v26 = [v25 beginningOfDocument];
    v14 = [v25 positionFromPosition:v26 offset:a3];

    v20 = [*(id *)(a1 + 32) positionFromPosition:v14 offset:a4];
    v27 = [*(id *)(a1 + 32) textRangeFromPosition:v14 toPosition:v20];
    v35.receiver = *(id *)(a1 + 32);
    v35.super_class = (Class)_MFAtomFieldEditor;
    v28 = objc_msgSendSuper2(&v35, sel_selectionRectsForRange_, v27);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_4;
    v32[3] = &__block_descriptor_34_e29_B16__0__UITextSelectionRect_8l;
    BOOL v33 = v9;
    BOOL v34 = v12;
    v29 = objc_msgSend(v28, "ef_filter:", v32);

    [*(id *)(a1 + 40) addObjectsFromArray:v29];
  }
}

double __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_3(uint64_t a1, int a2)
{
  double result = *(double *)(a1 + 32);
  if (a2) {
    return result + *(double *)(a1 + 48);
  }
  return result;
}

BOOL __45___MFAtomFieldEditor_selectionRectsForRange___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  BOOL v5 = (*(unsigned char *)(a1 + 32) || ([v3 containsStart] & 1) == 0)
    && (*(unsigned char *)(a1 + 33) || ([v4 containsEnd] & 1) == 0);

  return v5;
}

@end