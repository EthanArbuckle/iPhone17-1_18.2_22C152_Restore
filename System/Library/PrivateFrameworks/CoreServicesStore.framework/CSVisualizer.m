@interface CSVisualizer
@end

@implementation CSVisualizer

void __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke(void *a1, unsigned int *a2, uint64_t a3)
{
  int v5 = 4 * *a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke_2;
  v9[3] = &unk_1E5D2AA68;
  int v13 = v5;
  uint64_t v14 = a1[8];
  v7 = (atomic_ullong *)a1[6];
  uint64_t v6 = a1[7];
  v8 = (void *)a1[5];
  v9[4] = a1[4];
  uint64_t v11 = v6;
  id v10 = v8;
  uint64_t v12 = a3;
  CSStore2::Store::enumerateUnits(v7, a2, v9);
}

void __57___CSVisualizer_enumerateReferencesToUnit_inTable_block___block_invoke_2(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  uint64_t v6 = (void *)MEMORY[0x1AD0DB160]();
  if (*(_DWORD *)(a1 + 64) != *(_DWORD *)(a1 + 68) || 4 * *a2 != *(_DWORD *)(a1 + 72))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "descriptionOfUnit:inTable:", (4 * *a2));
    if (v7
      && [*(id *)(a1 + 48) unitDescription:v7 referencesUnit:*(unsigned int *)(a1 + 72) inTable:*(unsigned int *)(a1 + 68)])
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      *a3 = 0;
      **(unsigned char **)(a1 + 56) = 0;
    }
  }
}

uint64_t __31___CSVisualizer_breakDownUsage__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) breakDownTable:a2 inStore:*(void *)(a1 + 40) buffer:*(void *)(a1 + 48)];
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke(uint64_t a1, int a2, int a3, unsigned int a4)
{
  CSStore2::Array::Get((CSStore2::Array *)&v25, *(CSStore2::Store **)(a1 + 32), a4);
  if ((_BYTE)v27)
  {
    uint64_t v4 = v26;
    uint64_t v5 = DWORD2(v26);
    uint64_t v6 = (void *)MEMORY[0x1AD0DB160]();
    id v7 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    v25 = &unk_1EFE40808;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v8 = v7;
    *((void *)&v26 + 1) = v8;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(void *)&long long v32 = 0;
    DWORD2(v32) = 1065353216;
    long long v33 = 0u;
    long long v34 = 0u;
    LODWORD(v35) = 1065353216;
    WORD4(v35) = 0;
    *(void *)&long long v36 = 0;
    WORD4(v36) = 257;
    BYTE10(v36) = 0;
    v41 = &v26;
    v9 = [NSNumber numberWithBool:(*(_DWORD *)v4 >> 29) & 1];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, &cfstr_Packed.isa, v9);

    unsigned int v10 = *(_DWORD *)v4 & 0x1FFFFFFF;
    if (v10 >= v5) {
      uint64_t v11 = v5;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t v12 = [NSNumber numberWithUnsignedInt:v5];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, &cfstr_Capacity.isa, v12);

    int v13 = [NSNumber numberWithUnsignedInt:v11];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, &cfstr_Count.isa, v13);

    BOOL v15 = v5 > v10 && (v5 - v11) > 4;
    v16 = [NSNumber numberWithBool:v15];
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)&v25, &cfstr_Oversized.isa, v16);

    id v17 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v18 = v17;
    if (v17)
    {
      [v17 appendString:@"{ "];
      id v19 = v18;
      uint64_t v20 = v4 + 4;
      if ((*(unsigned char *)(v4 + 3) & 0x20) != 0)
      {
        if (v11)
        {
          uint64_t v23 = 0;
          do
          {
            if (v23) {
              [v19 appendString:@", "];
            }
            objc_msgSend(v19, "appendFormat:", @"0x%llx", *(unsigned __int16 *)(v20 + v23));
            v23 += 2;
          }
          while (2 * v11 != v23);
        }
      }
      else if (v11)
      {
        uint64_t v21 = 0;
        do
        {
          if (v21) {
            [v19 appendString:@", "];
          }
          objc_msgSend(v19, "appendFormat:", @"0x%llx", *(unsigned int *)(v20 + v21));
          v21 += 4;
        }
        while (4 * v11 != v21);
      }

      [v19 appendString:@" }"];
      CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)&v25, &cfstr_Values.isa, (NSString *)v19);
    }

    v22 = (void *)[v8 copy];
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)&v25);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_2(uint64_t a1, int a2, int a3, unsigned int a4)
{
  CSStore2::String::Get(v9, *(CSStore2::Store **)(a1 + 32), a4);
  if (v10)
  {
    v7[0] = v9[0];
    v7[1] = v9[1];
    char v8 = 1;
    uint64_t v4 = CSStore2::String::getNSStringNoCopy((CSStore2::String *)v7);
    uint64_t v5 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v5 = 0;
    LOBYTE(v7[0]) = 0;
    char v8 = 0;
  }

  return v5;
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_3(uint64_t a1, int a2, int a3, unsigned int a4)
{
  uint64_t v4 = CSStore2::String::Get(v20, *(CSStore2::Store **)(a1 + 32), a4);
  if (v20[32])
  {
    *(_OWORD *)v16 = *(_OWORD *)v20;
    *(_OWORD *)id v17 = *(_OWORD *)&v20[16];
    char v18 = 1;
    uint64_t v5 = (void *)MEMORY[0x1AD0DB160](v4);
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    *(void *)uint64_t v20 = &unk_1EFE40808;
    memset(&v20[8], 0, 32);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = v6;
    *(void *)&v20[16] = v7;
    *(_OWORD *)&v20[24] = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    *(void *)&long long v25 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    DWORD2(v25) = 1065353216;
    LODWORD(v28) = 1065353216;
    WORD4(v28) = 0;
    *(void *)&long long v29 = 0;
    WORD4(v29) = 257;
    BYTE10(v29) = 0;
    long long v34 = &v20[8];
    if (!v16[0] || BYTE4(v16[1]))
    {
      if (BYTE4(v16[1]))
      {
        CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)v20, &cfstr_Retaincount.isa, &cfstr_NAPacked.isa);
        goto LABEL_11;
      }
    }
    else
    {
      StringCacheEntry = CSStore2::getStringCacheEntry(v16[0], (const CSStore2::Store *)LODWORD(v16[1]));
      if (StringCacheEntry && *(unsigned char *)StringCacheEntry)
      {
        objc_msgSend(NSNumber, "numberWithUnsignedChar:");
        v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, &cfstr_Retaincount.isa, v9);

LABEL_11:
        uint64_t v11 = [NSNumber numberWithUnsignedInt:LODWORD(v17[1])];
        CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, &cfstr_Length_0.isa, v11);

        CSStore2::String::getNSStringNoCopy((CSStore2::String *)v16);
        uint64_t v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::string((CSStore2::AttributedStringWriter *)v20, &cfstr_Characters.isa, v12);

        if (BYTE4(v16[1])) {
          int v13 = v17;
        }
        else {
          int v13 = (char **)v17[0];
        }
        objc_msgSend(NSNumber, "numberWithUnsignedShort:", CSStore2::_StringFunctions::getHashCode((CSStore2::_StringFunctions *)v13, (const char *)LODWORD(v17[1])));
        uint64_t v14 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v20, &cfstr_Hashcode.isa, v14);

        char v10 = (void *)[v7 copy];
        CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)v20);

        goto LABEL_15;
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3321888768;
    v19[2] = ___ZNK8CSStore26String19getDebugDescriptionEv_block_invoke;
    v19[3] = &__block_descriptor_40_ea8_32c52_ZTSKZNK8CSStore26String19getDebugDescriptionEvE3__0_e5_v8__0l;
    v19[4] = v20;
    CSStore2::AttributedStringWriter::withAppliedAttribute((uint64_t)v20, @"_CSVNum", (uint64_t)&unk_1EFE439E0, (uint64_t)v19);
    goto LABEL_11;
  }
  char v10 = 0;
  LOBYTE(v16[0]) = 0;
  char v18 = 0;
LABEL_15:

  return v10;
}

id __42___CSVisualizer_setStandardTableFunctions__block_invoke_4(uint64_t a1, int a2, int a3, unsigned int a4)
{
  uint64_t v4 = CSStore2::Dictionary::Get((CSStore2::Dictionary *)v15, *(CSStore2::Store **)(a1 + 32), a4);
  if ((_BYTE)v16)
  {
    long long v12 = *(_OWORD *)v15;
    uint64_t v13 = *(void *)&v15[16];
    char v14 = 1;
    uint64_t v5 = (void *)MEMORY[0x1AD0DB160](v4);
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    *(void *)BOOL v15 = &unk_1EFE40808;
    *(_OWORD *)&v15[8] = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v6;
    *(void *)&v15[16] = v7;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    *(void *)&long long v21 = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    DWORD2(v21) = 1065353216;
    LODWORD(v24) = 1065353216;
    WORD4(v24) = 0;
    *(void *)&long long v25 = 0;
    WORD4(v25) = 257;
    BYTE10(v25) = 0;
    long long v30 = &v15[8];
    CSStore2::Dictionary::getDescriptionOfContents((CSStore2::Dictionary *)&v12, 0);
    char v8 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      CSStore2::AttributedStringWriter::attributedString((CSStore2::AttributedStringWriter *)v15, (NSAttributedString *)@"values", v8);
    }

    objc_msgSend(NSNumber, "numberWithUnsignedInt:", CSStore2::Dictionary::getCount((CSStore2::Dictionary *)v12, *(_DWORD *)(*((void *)&v12 + 1) + 4)));
    v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    CSStore2::AttributedStringWriter::number((CSStore2::AttributedStringWriter *)v15, &cfstr_Count.isa, v9);

    char v10 = (void *)[v7 copy];
    CSStore2::AttributedStringWriter::~AttributedStringWriter((CSStore2::AttributedStringWriter *)v15);
  }
  else
  {
    char v10 = 0;
    LOBYTE(v12) = 0;
    char v14 = 0;
  }

  return v10;
}

void __41___CSVisualizer_getUnit_inTable_fromURL___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  v3 = [v7 name];
  if (![v3 isEqual:@"t"]) {
    goto LABEL_5;
  }
  uint64_t v4 = [v7 value];

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    if (*(void *)(a1 + 48))
    {
      v3 = [v7 value];
      **(_DWORD **)(a1 + 48) = [v3 longLongValue];
LABEL_5:
    }
  }
  uint64_t v5 = [v7 name];
  if (![v5 isEqual:@"u"])
  {
LABEL_10:

    goto LABEL_11;
  }
  id v6 = [v7 value];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (*(void *)(a1 + 56))
    {
      uint64_t v5 = [v7 value];
      **(_DWORD **)(a1 + 56) = [v5 longLongValue];
      goto LABEL_10;
    }
  }
LABEL_11:
}

uint64_t __56___CSVisualizer_unitDescription_referencesUnit_inTable___block_invoke(uint64_t result, int a2, int a3, unsigned char *a4)
{
  if (*(_DWORD *)(result + 40) == a2 && *(_DWORD *)(result + 44) == a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _OWORD v7[2] = __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke_2;
  v7[3] = &unk_1E5D2AAB8;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a5;
  [a2 enumerateKeysAndObjectsUsingBlock:v7];
}

void __67___CSVisualizer_enumerateReferencesToUnitsInUnitDescription_block___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = 0;
      if (+[_CSVisualizer getUnit:&v9 inTable:(char *)&v9 + 4 fromURL:v8])
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
  **(unsigned char **)(a1 + 40) = *a4;
}

void __47___CSVisualizer_breakDownTable_inStore_buffer___block_invoke(uint64_t a1, _DWORD *a2)
{
  uint64_t v4 = 2 * (*(unsigned char *)(a1 + 48) & 0x1Fu);
  if (a2)
  {
    uint64_t v5 = **(void **)(a1 + 32);
    if (v5) {
      unint64_t v6 = *(void *)(v5 + 8);
    }
    else {
      unint64_t v6 = 0;
    }
    uint64_t v7 = 0xFFFFFFFFLL;
    BOOL v8 = (unint64_t)a2 >= v6;
    unint64_t v9 = (unint64_t)a2 - v6;
    if (v8 && !HIDWORD(v9))
    {
      BOOL v10 = (v9 + 1) > *(_DWORD *)(*(void *)(v5 + 8) + 12) || v9 == -1;
      uint64_t v7 = v9;
      if (v10) {
        uint64_t v7 = 0xFFFFFFFFLL;
      }
    }
  }
  else
  {
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  *(void *)(*(void *)(a1 + 40) + v7) = 0x101010101010101 * v4;
  int v11 = v4 | 0x40;
  long long v12 = a2 + 2;
  uint64_t v13 = **(void **)(a1 + 32);
  if (v13) {
    unint64_t v14 = *(void *)(v13 + 8);
  }
  else {
    unint64_t v14 = 0;
  }
  uint64_t v15 = 0xFFFFFFFFLL;
  BOOL v8 = (unint64_t)v12 >= v14;
  unint64_t v16 = (unint64_t)v12 - v14;
  if (v8 && !HIDWORD(v16))
  {
    if ((v16 + 1) > *(_DWORD *)(*(void *)(v13 + 8) + 12) || v16 == -1) {
      uint64_t v15 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v15 = v16;
    }
  }
  memset((void *)(*(void *)(a1 + 40) + v15), v11, a2[1]);
  if (*(unsigned char *)(a1 + 48) == 8)
  {
    CSStore2::Dictionary::Get((CSStore2::Dictionary *)&v54, *(CSStore2::Store **)(a1 + 32), 4 * *a2);
    if ((_BYTE)v57)
    {
      uint64_t v18 = *(unsigned int *)(v55 + 4);
      if (v18 != -1)
      {
        long long v19 = v54;
        unint64_t v20 = *(void *)(*v54 + 8);
        unsigned int v21 = *(_DWORD *)(v20 + 12);
        if (v21 > v18)
        {
          uint64_t v22 = *(void *)(a1 + 40);
          long long v23 = (_DWORD *)(v20 + v18);
          BOOL v24 = v20 + v18 < v20;
          BOOL v25 = (int)v18 + 1 > v21 || v18 == -1;
          uint64_t v26 = *(unsigned int *)(v55 + 4);
          if (v25) {
            uint64_t v26 = 0xFFFFFFFFLL;
          }
          if (v24) {
            uint64_t v26 = 0xFFFFFFFFLL;
          }
          *(_DWORD *)(v22 + v26) = 269488144;
          v54 = (uint64_t *)MEMORY[0x1E4F143A8];
          uint64_t v55 = 3221225472;
          v56 = ___ZN8CSStore27HashMapIjjNS_10Dictionary10_FunctionsELy0EE14WriteBreakdownERKNS_5StoreEPKS3_hPh_block_invoke;
          v57 = &__block_descriptor_41_e21_v32__0I8I12B16B20_B24l;
          char v59 = 8;
          uint64_t v58 = v22;
          long long v27 = &v54;
          long long v28 = v27;
          unsigned __int8 v60 = 0;
          long long v29 = v23 + 1;
          uint64_t v30 = *v19;
          if (*v19) {
            unint64_t v31 = *(void *)(v30 + 8);
          }
          else {
            unint64_t v31 = 0;
          }
          uint64_t v32 = 0xFFFFFFFFLL;
          BOOL v8 = (unint64_t)v29 >= v31;
          unint64_t v33 = (unint64_t)v29 - v31;
          if (v8 && !HIDWORD(v33))
          {
            if ((v33 + 1) > *(_DWORD *)(*(void *)(v30 + 8) + 12) || v33 == -1) {
              uint64_t v32 = 0xFFFFFFFFLL;
            }
            else {
              uint64_t v32 = v33;
            }
          }
          ((void (*)(uint64_t *, uint64_t, void, uint64_t, uint64_t, unsigned __int8 *))v56)(v27, v32, (8 * *v23), 1, 1, &v60);
          unint64_t v35 = *v23;
          if (v35) {
            BOOL v36 = v60 == 0;
          }
          else {
            BOOL v36 = 0;
          }
          if (v36)
          {
            unint64_t v37 = 0;
            do
            {
              long long v38 = &v23[2 * v37];
              uint64_t v39 = v38[2];
              if (v39 == -1)
              {
                unint64_t v43 = 0;
              }
              else
              {
                uint64_t v40 = *(void *)(*v19 + 8);
                BOOL v41 = *(_DWORD *)(v40 + 12) > v39;
                unint64_t v42 = v40 + v39;
                if (v41) {
                  unint64_t v43 = v42;
                }
                else {
                  unint64_t v43 = 0;
                }
              }
              v44 = v38 + 1;
              int v45 = v38[1];
              if (v45)
              {
                v46 = (_DWORD *)(v43 + 4);
                unint64_t v47 = 1;
                do
                {
                  if (*(v46 - 1)) {
                    BOOL v48 = *v46 != 0;
                  }
                  else {
                    BOOL v48 = 0;
                  }
                  uint64_t v49 = *v19;
                  if (*v19) {
                    unint64_t v50 = *(void *)(v49 + 8);
                  }
                  else {
                    unint64_t v50 = 0;
                  }
                  uint64_t v51 = 0xFFFFFFFFLL;
                  BOOL v8 = v43 >= v50;
                  unint64_t v52 = v43 - v50;
                  if (v8 && !HIDWORD(v52))
                  {
                    if ((v52 + 1) > *(_DWORD *)(*(void *)(v49 + 8) + 12) || v52 == -1) {
                      uint64_t v51 = 0xFFFFFFFFLL;
                    }
                    else {
                      uint64_t v51 = v52;
                    }
                  }
                  ((void (*)(uint64_t *, uint64_t, uint64_t, void, BOOL, unsigned __int8 *))v56)(v28, v51, 8, 0, v48, &v60);
                  int v45 = v60;
                  if (v47 >= *v44) {
                    break;
                  }
                  ++v47;
                  v46 += 2;
                  v43 += 8;
                }
                while (!v60);
                unint64_t v35 = *v23;
              }
              ++v37;
            }
            while (v37 < v35 && !v45);
          }
        }
      }
    }
  }
}

void __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  BOOL v8 = v7;
  if (v7) {
    unint64_t v9 = v7;
  }
  else {
    unint64_t v9 = &unk_1EFE43A58;
  }
  if ([v9 unsignedLongLongValue] == 1)
  {
    BOOL v10 = [*(id *)(a1 + 32) attribute:@"_CSVIsRelated" atIndex:a3 effectiveRange:0];
    int v11 = v10;
    if (v10 && (long long v12 = (CSStore2 *)[v10 BOOLValue], v12))
    {
      uint64_t v13 = CSStore2::GetLog(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v31.location = a3;
        v31.length = a4;
        long long v27 = NSStringFromRange(v31);
        int v28 = 138543362;
        long long v29 = v27;
        _os_log_debug_impl(&dword_1A7DB2000, v13, OS_LOG_TYPE_DEBUG, "Skipping appearance of title in range %{public}@ because it's in a range marked as a related unit", (uint8_t *)&v28, 0xCu);
      }
    }
    else
    {
      unint64_t v14 = *(void **)(*(void *)(a1 + 40) + 8);
      unint64_t v16 = (char *)v14[7];
      unint64_t v15 = v14[8];
      if ((unint64_t)v16 >= v15)
      {
        uint64_t v18 = (char *)v14[6];
        uint64_t v19 = (v16 - v18) >> 4;
        unint64_t v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 60) {
          abort();
        }
        uint64_t v21 = v15 - (void)v18;
        if (v21 >> 3 > v20) {
          unint64_t v20 = v21 >> 3;
        }
        BOOL v22 = (unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0;
        unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
        if (!v22) {
          unint64_t v23 = v20;
        }
        if (v23)
        {
          unint64_t v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<NSString *,objc_object *>>>(v23);
          uint64_t v18 = (char *)v14[6];
          unint64_t v16 = (char *)v14[7];
        }
        else
        {
          uint64_t v24 = 0;
        }
        BOOL v25 = (NSUInteger *)(v23 + 16 * v19);
        unint64_t v26 = v23 + 16 * v24;
        NSUInteger *v25 = a3;
        v25[1] = a4;
        long long v17 = v25 + 2;
        if (v16 != v18)
        {
          do
          {
            *((_OWORD *)v25 - 1) = *((_OWORD *)v16 - 1);
            v25 -= 2;
            v16 -= 16;
          }
          while (v16 != v18);
          uint64_t v18 = (char *)v14[6];
        }
        v14[6] = v25;
        v14[7] = v17;
        v14[8] = v26;
        if (v18) {
          operator delete(v18);
        }
      }
      else
      {
        *(void *)unint64_t v16 = a3;
        *((void *)v16 + 1) = a4;
        long long v17 = v16 + 16;
      }
      v14[7] = v17;
    }
  }
}

void __61___CSVisualizer_enumerateValuesForTitlesInDescription_block___block_invoke_50(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4, unsigned char *a5)
{
  unint64_t v9 = [a2 objectForKeyedSubscript:@"_CSVOutputType"];
  if (!v9) {
    unint64_t v9 = &unk_1EFE43A58;
  }
  id v13 = v9;
  int v10 = [v9 unsignedLongLongValue];
  if (v10 == 1)
  {
    *a5 = 1;
  }
  else if (v10 == 3)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
    v12.location = *(void *)(v11 + 48);
    if (v12.location == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)(v11 + 48) = a3;
      *(void *)(v11 + 56) = a4;
    }
    else
    {
      v12.length = *(void *)(v11 + 56);
      v15.location = a3;
      v15.length = a4;
      *(NSRange *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = NSUnionRange(v12, v15);
    }
  }
}

uint64_t __52___CSVisualizer_rangeOfValueForTitle_inDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  uint64_t result = [*(id *)(a1 + 32) caseInsensitiveCompare:a2];
  if (!result)
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    *(void *)(v13 + 48) = a6;
    *(void *)(v13 + 56) = a7;
    *a8 = 1;
  }
  return result;
}

id __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = 0;

  return v1;
}

id __49___CSVisualizer_Deprecated__setHandler_forTable___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v1 = 0;

  return v1;
}

void __45___CSVisualizer_Deprecated__handlerForTable___block_invoke(uint64_t a1, uint64_t a2, void **a3, void **a4)
{
  if (a3)
  {
    BOOL v8 = [*(id *)(a1 + 32) getSummary];
    if (v8)
    {
      id v14 = v8;
      uint64_t v9 = v8[2](v8, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
      int v10 = *a3;
      *a3 = (void *)v9;

      BOOL v8 = (void (**)(void, void, void, void))v14;
    }
  }
  if (a4)
  {
    uint64_t v11 = [*(id *)(a1 + 32) getDescription];
    if (v11)
    {
      id v15 = v11;
      uint64_t v12 = v11[2](v11, *(void *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
      uint64_t v13 = *a4;
      *a4 = (void *)v12;

      uint64_t v11 = (void (**)(void, void, void, void))v15;
    }
  }
}

@end