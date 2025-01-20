@interface LSDisplayHumanReadableData
@end

@implementation LSDisplayHumanReadableData

void ___LSDisplayHumanReadableData_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x18530F680]();
  v5 = [*(id *)(a1 + 32) descriptionOfUnit:a2 inTable:*(unsigned int *)(a1 + 72)];
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(unsigned int *)(a1 + 72);
    int v10 = *(_DWORD *)(a1 + 76);
    v55 = *(FILE **)(a1 + 64);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    v50 = v5;
    id v54 = v5;
    id v52 = v7;
    id v12 = v8;
    v51 = (void *)MEMORY[0x18530F680]();
    v53 = v12;
    if (!v12 || (id v56 = v54, objc_msgSend(v12, "evaluateWithObject:")))
    {
      if ((v10 & 0x10) != 0)
      {
        id v56 = v54;
        id v36 = v52;
        id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        if (v36) {
          uint64_t v38 = [v36 count];
        }
        else {
          uint64_t v38 = -1;
        }
        v39 = (void *)MEMORY[0x1E4F5D0F8];
        uint64_t v61 = MEMORY[0x1E4F143A8];
        uint64_t v62 = 3221225472;
        uint64_t v63 = (uint64_t)___ZN14LaunchServices21DatabaseVisualizationL34getPropertyListFromUnitDescriptionEjjP18NSAttributedStringP5NSSetIP8NSStringE_block_invoke;
        v64 = (__n128 (*)(__n128 *, __n128 *))&unk_1E522E740;
        v40 = (void (*)(uint64_t))v36;
        v65 = v40;
        id v41 = v37;
        v66 = v41;
        __p = (void *)v38;
        [v39 enumerateValuesForTitlesInDescription:v56 block:&v61];
        v42 = [NSNumber numberWithUnsignedInt:v9];
        [v41 setObject:v42 forKeyedSubscript:@"tableID"];

        v43 = [NSNumber numberWithUnsignedInt:a2];
        [v41 setObject:v43 forKeyedSubscript:@"unitID"];

        v44 = v66;
        id v45 = v41;

        v46 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v45 options:0 error:0];
        if (v46)
        {
          if (!*(unsigned char *)(v11 + 24)) {
            fputc(44, v55);
          }
          *(unsigned char *)(v11 + 24) = 0;
          id v47 = v46;
          fwrite((const void *)[v47 bytes], 1uLL, objc_msgSend(v47, "length"), v55);
        }
      }
      else
      {
        v14 = CSStore2::AttributedStringWriter::Separator((CSStore2::AttributedStringWriter *)0x2D, 0, v13);
        v15 = v55;
        objc_msgSend(v14, "cs_writeToFileHandle:", v55);

        fputc(10, v55);
        id v56 = v54;
        if (v53)
        {
          id v16 = (id)[v54 mutableCopy];
          uint64_t v17 = MEMORY[0x18530F680]();
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v56 = v16;
          v18 = objc_msgSend(v16, "cs_rangesMatchingPredicate:", v53);
          context = (void *)v17;
          v49 = v4;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:&v61 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v58;
            uint64_t v21 = *MEMORY[0x1E4F5D118];
            uint64_t v22 = *MEMORY[0x1E4F5D108];
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v58 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v24 = [*(id *)(*((void *)&v57 + 1) + 8 * i) rangeValue];
                uint64_t v26 = v25;
                objc_msgSend(v56, "addAttribute:value:range:", v21, &unk_1ECB43858, v24, v25);
                objc_msgSend(v56, "addAttribute:value:range:", v22, &unk_1ECB43870, v24, v26);
              }
              uint64_t v19 = [v18 countByEnumeratingWithState:&v57 objects:&v61 count:16];
            }
            while (v19);
          }

          v4 = v49;

          v15 = v55;
        }
        if (v52)
        {
          uint64_t v27 = [v52 count];
          uint64_t v61 = 0;
          uint64_t v62 = (uint64_t)&v61;
          uint64_t v63 = 0x4812000000;
          v64 = __Block_byref_object_copy__67;
          v65 = __Block_byref_object_dispose__68;
          v66 = &unk_182B5933F;
          v68 = 0;
          uint64_t v69 = 0;
          __p = 0;
          v28 = (void *)MEMORY[0x1E4F5D0F8];
          *(void *)&long long v57 = MEMORY[0x1E4F143A8];
          *((void *)&v57 + 1) = 3221225472;
          *(void *)&long long v58 = ___ZN14LaunchServices21DatabaseVisualizationL20writeUnitDescriptionEP7__sFILEjjP18NSAttributedStringP5NSSetIP8NSStringEP11NSPredicatejPb_block_invoke;
          *((void *)&v58 + 1) = &unk_1E522E718;
          *(void *)&long long v59 = v52;
          *((void *)&v59 + 1) = &v61;
          *(void *)&long long v60 = v27;
          uint64_t v29 = [v28 enumerateValuesForTitlesInDescription:v56 block:&v57];
          v30 = *(uint64_t **)(v62 + 48);
          v31 = *(uint64_t **)(v62 + 56);
          while (v30 != v31)
          {
            uint64_t v32 = *v30;
            uint64_t v33 = v30[1];
            v34 = (void *)MEMORY[0x18530F680](v29);
            v35 = objc_msgSend(v56, "attributedSubstringFromRange:", v32, v33);
            objc_msgSend(v35, "cs_writeToFileHandle:", v55);
            fputc(10, v55);

            v30 += 2;
          }

          _Block_object_dispose(&v61, 8);
          if (__p)
          {
            v68 = __p;
            operator delete(__p);
          }
        }
        else
        {
          objc_msgSend(v56, "cs_writeToFileHandle:", v15);
          fputc(10, v55);
        }
      }
    }

    v6 = v50;
  }
}

@end