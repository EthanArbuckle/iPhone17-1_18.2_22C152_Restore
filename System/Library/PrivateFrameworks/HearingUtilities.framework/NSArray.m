@interface NSArray
@end

@implementation NSArray

uint64_t __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  v9 = v4;
  if (!*(void *)(*(void *)(a1[4] + 8) + 40))
  {
    char v6 = [v4 isStreamOrMixingStream];
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
      v5 = v9;
    }
  }
  if ([v5 isSelected])
  {
    if ([v9 isStreamOrMixingStream]) {
      uint64_t v7 = a1[5];
    }
    else {
      uint64_t v7 = a1[6];
    }
    objc_storeStrong((id *)(*(void *)(v7 + 8) + 40), a2);
  }

  return MEMORY[0x270F9A758]();
}

void __77__NSArray__AX_HA_PROGRAMS_ARRAY___setProgram_withOtherSidePrograms_selected___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v5 = v4;
  id v9 = v4;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    char v6 = [v4 isStreamOrMixingStream];
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      v5 = v9;
    }
  }
  int v7 = [v5 index];
  if (v7 != [*(id *)(a1 + 32) index] && objc_msgSend(v9, "isSelected"))
  {
    if ([v9 isMixingStream]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
    if ([v9 isStreamOrMixingStream]) {
      uint64_t v8 = *(void *)(a1 + 56);
    }
    else {
      uint64_t v8 = *(void *)(a1 + 64);
    }
    objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), a2);
  }
}

void __61__NSArray__AX_HA_PROGRAMS_ARRAY___programThatMatchesProgram___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  int v7 = [v8 index];
  if (v7 == [*(id *)(a1 + 32) index])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end