void SyriacShapingEngine::~SyriacShapingEngine(SyriacShapingEngine *this)
{
  JUMPOUT(0x1853275C0);
}

void JoiningScriptShapingEngine::~JoiningScriptShapingEngine(JoiningScriptShapingEngine *this)
{
}

uint64_t JoiningScriptShapingEngine::ApplyScriptShaping(JoiningScriptShapingEngine *this, const OTL::GSUB *a2, OTL::GlyphLookups *a3, BOOL *a4)
{
  if (!*((void *)this + 1)) {
    return 0;
  }
  *(_WORD *)(*((void *)this + 2) + 632) = 257;
  if (a4) {
    *a4 = JoiningScriptShapingEngine::ApplyStretching((TRunGlue **)this, a2);
  }
  (*(void (**)(JoiningScriptShapingEngine *, const OTL::GSUB *, OTL::GlyphLookups *))(*(void *)this + 24))(this, a2, a3);
  return 1;
}

uint64_t JoiningScriptShapingEngine::ApplyStretching(TRunGlue **this, const OTL::GSUB *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[8] = v5;
  long long v23 = v5;
  v22[6] = v5;
  v22[7] = v5;
  v22[4] = v5;
  v22[5] = v5;
  v22[2] = v5;
  v22[3] = v5;
  v22[0] = v5;
  v22[1] = v5;
  int v18 = 1937007464;
  OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)v19, &v18, v19);
  OTL::GCommon::GetLookups((uint64_t)a2, (uint64_t)v19, (uint64_t)v22);
  v17[0] = (void **)v19;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100](v17);
  if (!BYTE8(v23)) {
    return 0;
  }
  memset(v20, 170, sizeof(v20));
  memset(v19, 0, sizeof(v19));
  v21 = v20;
  uint64_t v6 = TRunGlue::length(this[2]);
  v8 = (unsigned int *)*((void *)&v22[0] + 1);
  v7 = *(unsigned int **)&v22[0];
  if (*(void *)&v22[0] != *((void *)&v22[0] + 1))
  {
    uint64_t v9 = v6;
    do
    {
      unsigned int v10 = *v7++;
      unint64_t v2 = v2 & 0xFFFFFFFF00000000 | v10;
      OTL::GlyphLookups::SetLookupInRange<false>((uint64_t *)v19, v2, 0, v9);
    }
    while (v7 != v8);
  }
  v11 = this[2];
  v12 = (void **)*((void *)v11 + 13);
  unint64_t v13 = TRunGlue::length(v11);
  std::vector<TGlyphAuxDataListEntry,TInlineBufferAllocator<TGlyphAuxDataListEntry,30ul>>::resize((uint64_t)v12, v13);
  v17[0] = v12;
  v17[1] = (void **)0xAAAAAAAA00000001;
  LOBYTE(v18) = 0;
  unsigned int v14 = OTL::GSUB::ApplyLookups(a2, this[2], *((_DWORD *)this[2] + 6), (unsigned __int16 **)v19, &v18, (uint64_t)JoiningScriptShapingEngine::ApplyStretching(OTL::GSUB const&)::$_0::__invoke, (uint64_t)v17);
  if ((_BYTE)v18) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  v17[0] = (void **)v19;
  std::vector<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,TInlineBufferAllocator<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,30ul>>::__destroy_vector::operator()[abi:nn180100](v17);
  if (BYTE8(v23))
  {
    v19[0] = (void **)v22;
    std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100](v19);
  }
  return v15;
}

uint64_t JoiningScriptShapingEngine::MakePositioningAdjustments(JoiningScriptShapingEngine *this)
{
  v1 = (TRunGlue *)*((void *)this + 2);
  uint64_t v10 = *((void *)this + 1);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v22 = 0;
  long long v21 = 0u;
  *(void *)&long long v21 = *(void *)(v10 + 16);
  uint64_t result = TRunGlue::length(v1);
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    long long v5 = (CGSize *)MEMORY[0x1E4F1DB30];
    do
    {
      v8 = v1;
      uint64_t v9 = v4;
      uint64_t result = TRunGlue::TGlyph::IsDeleted((TRunGlue::TGlyph *)&v8);
      if ((result & 1) == 0)
      {
        uint64_t StringIndex = TRunGlue::GetStringIndex(v8, v9);
        UChar32 FullChar = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v10, &StringIndex, 0);
        uint64_t result = u_getCombiningClass(FullChar);
        if (result) {
          uint64_t result = (uint64_t)TRunGlue::SetAdvance(v8, v9, *v5);
        }
      }
      ++v4;
    }
    while (v3 != v4);
  }
  return result;
}

void JoiningScriptShapingEngine::SetFeatures(JoiningScriptShapingEngine *this, const OTL::GSUB *a2, unsigned __int16 **a3)
{
  uint64_t v4 = 0;
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v86[10] = v5;
  v86[11] = v5;
  v86[8] = v5;
  v86[9] = v5;
  v86[6] = v5;
  v86[7] = v5;
  v86[4] = v5;
  v86[5] = v5;
  v86[2] = v5;
  v86[3] = v5;
  v86[0] = v5;
  v86[1] = v5;
  do
  {
    uint64_t v6 = &v86[v4];
    *uint64_t v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    v6[5] = (char *)&v86[v4 + 1] + 8;
    v4 += 3;
  }
  while (v4 != 12);
  v7 = (TRunGlue *)*((void *)this + 2);
  uint64_t v8 = TRunGlue::length(v7);
  uint64_t v9 = (int *)*((void *)this + 2);
  unint64_t v80 = v9[6];
  uint64_t v10 = (__int32 *)&JoiningScriptShapingEngine::SetFeatures(OTL::GSUB const&,OTL::GlyphLookups &)::rtlTagArray;
  if ((int)v80 < 1)
  {
    v75 = v7;
    v81 = (TRunGlue *)(v8 - 1);
    uint64_t v78 = -1;
    __int16 v76 = 2;
    __int16 v77 = 1;
  }
  else
  {
    uint64_t v78 = TRunGlue::length((TRunGlue *)v9);
    v81 = 0;
    if (*((_DWORD *)a2 + 18) != 1634885986) {
      uint64_t v10 = (__int32 *)"lositinianifidem";
    }
    __int16 v76 = 1;
    __int16 v77 = 2;
    v75 = (TRunGlue *)v9;
  }
  uint64_t v11 = 0;
  __s = v10;
  do
  {
    unint64_t v105 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v103 = v12;
    long long v104 = v12;
    v101[3] = v12;
    long long v102 = v12;
    v101[1] = v12;
    v101[2] = v12;
    v101[0] = v12;
    v98 = 0;
    v99 = 0;
    uint64_t v100 = 0;
    v106 = v101;
    LODWORD(v87) = v10[v11];
    OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)&v89, &v87, (_DWORD *)&v87 + 1);
    OTL::GCommon::GetLookups((uint64_t)a2, (uint64_t)&v89, (uint64_t)&v98, 0);
    v88[0] = (uint64_t)&v89;
    std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v88);
    long long v14 = v98;
    long long v13 = v99;
    if (v98 != v99)
    {
      long long v15 = (char **)&v86[3 * v11];
      long long v16 = v15[1];
      do
      {
        int v17 = *(_DWORD *)v14;
        unint64_t v18 = (unint64_t)v15[2];
        if ((unint64_t)v16 >= v18)
        {
          uint64_t v19 = (v16 - *v15) >> 2;
          if ((unint64_t)(v19 + 1) >> 62) {
            abort();
          }
          uint64_t v20 = v18 - (void)*v15;
          uint64_t v21 = v20 >> 1;
          if (v20 >> 1 <= (unint64_t)(v19 + 1)) {
            uint64_t v21 = v19 + 1;
          }
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v22 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v22 = v21;
          }
          *((void *)&v90[1] + 1) = v15 + 3;
          if (v22) {
            long long v23 = (char *)TInlineBufferAllocator<std::pair<unsigned short,unsigned short>,4ul>::allocate((uint64_t)(v15 + 3), v22);
          }
          else {
            long long v23 = 0;
          }
          uint64_t v24 = &v23[4 * v19];
          v25 = &v23[4 * v22];
          *(void *)&v90[1] = v25;
          *(_DWORD *)uint64_t v24 = v17;
          long long v16 = v24 + 4;
          *((void *)&v90[0] + 1) = v24 + 4;
          v27 = *v15;
          unint64_t v26 = (unint64_t)v15[1];
          if ((char *)v26 == *v15)
          {
            int64x2_t v29 = vdupq_n_s64(v26);
          }
          else
          {
            do
            {
              int v28 = *(_DWORD *)(v26 - 4);
              v26 -= 4;
              *((_DWORD *)v24 - 1) = v28;
              v24 -= 4;
            }
            while ((char *)v26 != v27);
            int64x2_t v29 = *(int64x2_t *)v15;
            long long v16 = (char *)*((void *)&v90[0] + 1);
            v25 = *(char **)&v90[1];
          }
          *long long v15 = v24;
          v15[1] = v16;
          v90[0] = v29;
          v30 = v15[2];
          v15[2] = v25;
          *(void *)&v90[1] = v30;
          v89 = (TRunGlue **)v29.i64[0];
          std::__split_buffer<std::pair<unsigned short,unsigned short>,TInlineBufferAllocator<std::pair<unsigned short,unsigned short>,4ul> &>::~__split_buffer((uint64_t)&v89);
        }
        else
        {
          *(_DWORD *)long long v16 = v17;
          v16 += 4;
        }
        v15[1] = v16;
        long long v14 = (TRunGlue *)((char *)v14 + 4);
      }
      while (v14 != v13);
    }
    v89 = &v98;
    std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v89);
    ++v11;
    uint64_t v10 = __s;
  }
  while (v11 != 4);
  uint64_t v31 = 0;
  *(_OWORD *)v88 = xmmword_184BA9640;
  do
  {
    v32 = wmemchr(v10, *((_DWORD *)v88 + v31), 4uLL);
    if (v32) {
      v33 = v32;
    }
    else {
      v33 = __s + 4;
    }
    v34 = (unsigned int **)&v86[3 * (v33 - v10)];
    v35 = *v34;
    v36 = v34[1];
    while (v35 != v36)
    {
      unsigned int v37 = *v35;
      v38 = *a3;
      v39 = a3[1];
      if (*a3 != v39)
      {
        while (*v38 != (unsigned __int16)v37 || v38[1] != HIWORD(v37))
        {
          v38 += 52;
          if (v38 == v39) {
            goto LABEL_43;
          }
        }
      }
      if (v38 == v39)
      {
LABEL_43:
        v98 = 0;
        v99 = 0;
        uint64_t v100 = 0;
        *(void *)&long long v102 = v101;
        LODWORD(v89) = v37;
        memset(v90, 0, 24);
        *((void *)&v91 + 1) = (char *)&v90[1] + 8;
        std::vector<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,TInlineBufferAllocator<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,30ul>>::emplace_back<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>>((uint64_t *)a3, (uint64_t)&v89);
        v87 = (TRunGlue **)v90;
        std::vector<CFRange,TInlineBufferAllocator<CFRange,4ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v87);
        v87 = &v98;
        std::vector<CFRange,TInlineBufferAllocator<CFRange,4ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v87);
      }
      ++v35;
    }
    ++v31;
    uint64_t v10 = __s;
  }
  while (v31 != 4);
  unint64_t v41 = v80;
  uint64_t v42 = *((void *)this + 1);
  memset(v90, 0, sizeof(v90));
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v97 = 0;
  long long v96 = 0u;
  uint64_t v43 = *(void *)(v42 + 16);
  v89 = (TRunGlue **)v42;
  *(void *)&long long v96 = v43;
  if ((int)v80 > 0) {
    int v44 = 1;
  }
  else {
    int v44 = 2;
  }
  int __sa = v44;
  if ((int)v80 <= 0) {
    int v45 = 1;
  }
  else {
    int v45 = 2;
  }
  int v83 = v45;
  v98 = v75;
  v99 = v81;
  v46 = (TRunGlue *)v78;
  if (v81 != (TRunGlue *)v78)
  {
    uint64_t v47 = 0;
    BOOL v48 = 0;
    BOOL v49 = 0;
    unsigned __int16 v50 = 0;
    uint64_t v51 = -1;
    while (1)
    {
      BOOL IsDeleted = TRunGlue::TGlyph::IsDeleted((TRunGlue::TGlyph *)&v98);
      v53 = v99;
      if (!IsDeleted)
      {
        v88[0] = TRunGlue::GetStringIndex(v98, (uint64_t)v99);
        unint64_t FullChar = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v89, v88, 0);
        int v55 = JoiningScriptShapingEngine::shapeTypes[u_getIntPropertyValue(FullChar, UCHAR_JOINING_TYPE)];
        __int16 GlyphProps = TRunGlue::GetGlyphProps(v98, (uint64_t)v99);
        if (v88[0] == v51) {
          int v57 = 4;
        }
        else {
          int v57 = v55;
        }
        if ((GlyphProps & 0x300) != 0)
        {
          int v58 = 4;
        }
        else
        {
          uint64_t v51 = v88[0];
          int v58 = v57;
        }
        if ((v58 & 4) != 0)
        {
          if (v47 >= 1
            && FullChar >= 0x180B
            && (FullChar >> 1 < 0xC07 || FullChar == 6159))
          {
            v53 = v99;
            v68 = v81;
            v69 = (char *)v81 + v47;
            if ((uint64_t)v99 < (uint64_t)v81) {
              v68 = v99;
            }
            if ((uint64_t)v69 <= (uint64_t)((char *)v99 + 1)) {
              v69 = (char *)v99 + 1;
            }
            uint64_t v47 = v69 - (char *)v68;
            v81 = v68;
          }
          else
          {
            v53 = v99;
            if (!*((unsigned char *)this + 24))
            {
              int GlyphID = TRunGlue::GetGlyphID(v98, (uint64_t)v99);
              v53 = v99;
              unint64_t v41 = v80;
              if (!GlyphID)
              {
                TRunGlue::Delete(*((void **)this + 2), (uint64_t)v99, 0);
                v53 = v99;
              }
              goto LABEL_84;
            }
          }
          unint64_t v41 = v80;
        }
        else
        {
          BOOL v59 = (v58 & 8) == 0;
          int v60 = v49 && (v58 & v83) != 0;
          if ((v59 & v60) != 0) {
            __int16 v61 = v77;
          }
          else {
            __int16 v61 = 0;
          }
          BOOL v49 = (v58 & __sa) != 0;
          if (v47 >= 1)
          {
            __int16 v62 = v76;
            if ((v60 & v48) == 0) {
              __int16 v62 = 0;
            }
            v63 = (unsigned int **)&v86[3 * (unsigned __int16)(v62 + v50)];
            v64 = *v63;
            v65 = v63[1];
            if (*v63 != v65)
            {
              do
              {
                unsigned int v66 = *v64++;
                unint64_t FullChar = FullChar & 0xFFFFFFFF00000000 | v66;
                OTL::GlyphLookups::SetLookupInRange<true>((uint64_t *)a3, FullChar, (uint64_t)v81, v47);
              }
              while (v64 != v65);
            }
          }
          v53 = v99;
          unsigned __int16 v50 = v61;
          BOOL v48 = v59;
          v81 = v99;
          uint64_t v47 = 1;
          unint64_t v41 = v80;
          v46 = (TRunGlue *)v78;
        }
      }
LABEL_84:
      v99 = (TRunGlue *)((char *)v53 + v41);
      if ((TRunGlue *)((char *)v53 + v41) == v46)
      {
        if (v47 > 0)
        {
          v70 = (unsigned int **)&v86[3 * v50];
          v71 = *v70;
          v72 = v70[1];
          if (*v70 != v72)
          {
            do
            {
              unsigned int v73 = *v71++;
              unint64_t v41 = v41 & 0xFFFFFFFF00000000 | v73;
              OTL::GlyphLookups::SetLookupInRange<true>((uint64_t *)a3, v41, (uint64_t)v81, v47);
            }
            while (v71 != v72);
          }
        }
        break;
      }
    }
  }
  for (uint64_t i = 9; i != -3; i -= 3)
  {
    v89 = (TRunGlue **)&v86[i];
    std::vector<std::pair<UScriptCode,long>,TInlineBufferAllocator<std::pair<UScriptCode,long>,1ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v89);
  }
}

CFIndex JoiningScriptShapingEngine::FinishStretching(JoiningScriptShapingEngine *this, const TCharStream *a2, TRunGlue *a3)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  TRunGlue::UpdateAdvancesIfNeeded(a2);
  long long v5 = (void *)*((void *)a2 + 13);
  uint64_t v6 = v5[1] - *v5;
  CFIndex result = TRunGlue::length(a2);
  if (result == v6 >> 4)
  {
    uint64_t v8 = *((int *)a2 + 6);
    v64 = this;
    long long v75 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v9 = *((void *)this + 2);
    uint64_t v76 = 0;
    *(void *)&long long v75 = v9;
    CFIndex result = TRunGlue::length(a2);
    CFIndex v10 = 0;
    if ((int)v8 <= 0)
    {
      uint64_t v11 = result;
      CFIndex v10 = TRunGlue::length(a2) - 1;
      CFIndex result = v11;
    }
    if ((v10 & 0x8000000000000000) == 0 && result > v10)
    {
      double v12 = (double)(int)v8;
      if ((int)v8 >= 1) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = -1;
      }
      uint64_t v60 = v13 - v8;
      uint64_t v14 = 16 * v8;
      long long v15 = (CGSize *)MEMORY[0x1E4F1DB30];
      uint64_t v62 = v8;
      BOOL v59 = v5;
      uint64_t v61 = 16 * v8;
      do
      {
        uint64_t v16 = *v5 + 16 * v10;
        int v19 = *(_DWORD *)(v16 + 8);
        int v17 = (_DWORD *)(v16 + 8);
        int v18 = v19;
        if (v19)
        {
          uint64_t v20 = 1;
          if (result <= v10) {
            goto LABEL_27;
          }
          uint64_t v21 = v10;
          while (*v17 == v18)
          {
            if (v21 >= v10) {
              CFIndex v22 = v10;
            }
            else {
              CFIndex v22 = v21;
            }
            uint64_t v23 = v10 + v20;
            if (v10 + v20 <= v21 + 1) {
              uint64_t v23 = v21 + 1;
            }
            uint64_t v20 = v23 - v22;
            v21 += v8;
            if (v21 >= 0)
            {
              int v17 = (_DWORD *)((char *)v17 + v14);
              CFIndex v10 = v22;
              if (result > v21) {
                continue;
              }
            }
            goto LABEL_23;
          }
          CFIndex v22 = v10;
          if (*v17)
          {
LABEL_23:
            if ((int)v8 < 1) {
              uint64_t v24 = -1;
            }
            else {
              uint64_t v24 = v20;
            }
            CFIndex v10 = v22 - v8 + v24;
          }
          else
          {
LABEL_27:
            if ((int)v8 < 1) {
              uint64_t v25 = -1;
            }
            else {
              uint64_t v25 = v20;
            }
            uint64_t v26 = v25 + v10;
            if (v25 + v10 >= 0 && result > v26)
            {
              uint64_t v27 = 0;
              double v28 = 0.0;
              uint64_t v29 = v25 + v10;
              uint64_t v63 = result;
              while (1)
              {
                *(void *)&long long v78 = TRunGlue::GetStringIndex(a2, v29);
                UChar32 FullChar = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v64, (uint64_t *)&v78, 0);
                if (((1 << u_charType(FullChar)) & 0xE3E) == 0) {
                  break;
                }
                if (v29 >= v26) {
                  CFIndex v31 = v26;
                }
                else {
                  CFIndex v31 = v29;
                }
                uint64_t v32 = v26 + v27;
                if (v26 + v27 <= v29 + 1) {
                  uint64_t v32 = v29 + 1;
                }
                uint64_t v27 = v32 - v31;
                double v28 = v28 + TRunGlue::GetAdvance(a2, v29);
                if (v27 >= 256) {
                  goto LABEL_45;
                }
                v29 += v8;
                CFIndex result = v63;
                if (v29 >= 0)
                {
                  uint64_t v26 = v31;
                  if (v63 > v29) {
                    continue;
                  }
                }
                goto LABEL_44;
              }
              CFIndex v31 = v26;
              CFIndex result = v63;
LABEL_44:
              uint64_t v26 = v31;
              uint64_t v14 = v61;
              if (v27)
              {
LABEL_45:
                if (v20 < 1)
                {
                  double v34 = 0.0;
                }
                else
                {
                  uint64_t v33 = 0;
                  double v34 = 0.0;
                  do
                  {
                    double v34 = v34 + TRunGlue::GetAdvance(a2, v10 + v33);
                    v33 += 2;
                  }
                  while (v33 < v20);
                }
                if (v28 >= v34) {
                  double v35 = v28;
                }
                else {
                  double v35 = v34;
                }
                if ((int)v8 < 1) {
                  double v35 = 0.0;
                }
                double v36 = v28 - v34;
                if (v20 >= 0) {
                  uint64_t v37 = v20;
                }
                else {
                  uint64_t v37 = v20 + 1;
                }
                double v38 = v36 / (double)(v37 >> 1);
                if ((unint64_t)(v20 + 1) < 3) {
                  double v38 = v28 - v34;
                }
                if (v36 <= 0.0) {
                  double v39 = v35 + v36 * v12 * 0.5;
                }
                else {
                  double v39 = v35;
                }
                if (v36 <= 0.0) {
                  double v40 = 0.0;
                }
                else {
                  double v40 = v38;
                }
                uint64_t v41 = v10 + v20 - 1;
                double v42 = v39 - TRunGlue::GetAdvance(a2, v41);
                v82.y = 0.0;
                v82.x = v42;
                TRunGlue::SetOrigin(a2, v41, v82);
                TRunGlue::SetAdvance(a2, v41, *v15);
                if (v41 <= v10)
                {
LABEL_88:
                  if (*((void *)a2 + 19))
                  {
                    if (v10 >= v31) {
                      v56.location = v31;
                    }
                    else {
                      v56.location = v10;
                    }
                    uint64_t v57 = v31 + v27;
                    if (v31 + v27 <= v20 + v10) {
                      uint64_t v57 = v20 + v10;
                    }
                    v56.length = v57 - v56.location;
                    TRunGlue::ClearSafeToBreakAfter((uint64_t)a2, v56);
                  }
                  if ((int)v8 < 1) {
                    uint64_t v58 = -1;
                  }
                  else {
                    uint64_t v58 = v27;
                  }
                  CFIndex v10 = v58 - v8 + v31;
                  long long v5 = v59;
                  CFIndex result = v63;
                  uint64_t v14 = v61;
                  goto LABEL_99;
                }
                uint64_t v43 = v10 + v20 - 2;
                while (2)
                {
                  double Advance = TRunGlue::GetAdvance(a2, v43);
                  if (Advance == 0.0) {
                    double v45 = 0.0;
                  }
                  else {
                    double v45 = v40 / Advance;
                  }
                  uint64_t v46 = vcvtmd_s64_f64(v45);
                  if (v46)
                  {
                    *(void *)&long long v47 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v79[3] = v47;
                    long long v80 = v47;
                    v79[1] = v47;
                    v79[2] = v47;
                    long long v78 = v47;
                    v79[0] = v47;
                    __int16 GlyphID = TRunGlue::GetGlyphID(a2, v43);
                    long long v78 = 0uLL;
                    *(void *)&v79[0] = 0;
                    *((void *)&v80 + 1) = (char *)v79 + 8;
                    std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__vallocate[abi:nn180100](&v78, v46);
                    BOOL v49 = (_WORD *)*((void *)&v78 + 1);
                    uint64_t v50 = *((void *)&v78 + 1) + 2 * v46;
                    uint64_t v51 = 2 * v46;
                    do
                    {
                      *v49++ = GlyphID;
                      v51 -= 2;
                    }
                    while (v51);
                    *((void *)&v78 + 1) = v50;
                    uint64_t v8 = v62;
                    if ((TRunGlue::DoGlyphInsertion(a2, (const unsigned __int16 *)v78, (unsigned __int16)v46, 0, 1, v43, v43, 0, 0) & 1) == 0)
                    {
                      __int16 v77 = (void **)&v78;
                      std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__destroy_vector::operator()[abi:nn180100](&v77);
                      goto LABEL_88;
                    }
                    if (v31 <= v10) {
                      uint64_t v52 = 0;
                    }
                    else {
                      uint64_t v52 = v46;
                    }
                    v31 += v52;
                    v20 += v46;
                    v63 += v46;
                    __int16 v77 = (void **)&v78;
                    std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__destroy_vector::operator()[abi:nn180100](&v77);
                    if ((v46 & 0x8000000000000000) == 0)
                    {
                      uint64_t v53 = v46 + 1;
LABEL_82:
                      double v54 = v40 / (double)v53;
                      do
                      {
                        double v42 = v42 - v54;
                        v83.y = 0.0;
                        v83.x = v42;
                        TRunGlue::SetOrigin(a2, v43 + v46, v83);
                        TRunGlue::SetAdvance(a2, v43 + v46, *v15);
                        unint64_t v55 = v46-- + 1;
                      }
                      while (v55 > 1);
                      uint64_t v8 = v62;
                    }
                    v41 -= 2;
                    double v42 = v42 - TRunGlue::GetAdvance(a2, v41);
                    v84.y = 0.0;
                    v84.x = v42;
                    TRunGlue::SetOrigin(a2, v41, v84);
                    TRunGlue::SetAdvance(a2, v41, *v15);
                    v43 -= 2;
                    if (v41 <= v10) {
                      goto LABEL_88;
                    }
                    continue;
                  }
                  break;
                }
                uint64_t v53 = 1;
                goto LABEL_82;
              }
            }
            CFIndex v10 = v60 + v26;
          }
        }
LABEL_99:
        v10 += v8;
      }
      while (v10 >= 0 && result > v10);
    }
  }
  return result;
}

uint64_t JoiningScriptShapingEngine::ApplyStretching(OTL::GSUB const&)::$_0::__invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    if (a4 <= 0)
    {
      int v4 = *(_DWORD *)(result + 8);
    }
    else
    {
      int v4 = *(_DWORD *)(result + 8);
      long long v5 = (_DWORD *)(**(void **)result + 16 * a2 + 8);
      do
      {
        *long long v5 = v4;
        v5 += 4;
        --a4;
      }
      while (a4);
    }
    *(_DWORD *)(result + 8) = v4 + 1;
  }
  return result;
}

uint64_t IndicShapingEngine::FindSyllableEnd(TRunGlue **this, uint64_t a2, int a3)
{
  uint64_t v6 = TRunGlue::length(this[1]);
  char v7 = 0;
  int v8 = 0;
  uint64_t v9 = a2 + 31;
  if (a2 + 31 >= v6) {
    uint64_t v9 = v6;
  }
  uint64_t v40 = v9;
  if (a2 <= v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = a2;
  }
  int v38 = a3;
  uint64_t v39 = a2 + 1;
  uint64_t v41 = 16 * a2;
  uint64_t v35 = 4 * a2;
  uint64_t v36 = v10;
  uint64_t v37 = a2;
  do
  {
    uint64_t v11 = 0;
    char v12 = 0;
    uint64_t v13 = v41;
    uint64_t v14 = a2;
    while (v10 != v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)this[3] + v13;
      *(_DWORD *)(v16 + 12) = a3;
      unsigned __int16 v17 = *(_DWORD *)(v16 + 8);
      uint64_t v18 = v17;
      if (v17 == 6)
      {
        char v12 = 1;
      }
      else if (v17 == 5)
      {
        int v8 = 1;
      }
      else if ((v12 & ((v17 & 0xFFFE) == 8)) != 0)
      {
        goto LABEL_17;
      }
      int v19 = stateTable[16 * v11 + v17];
      uint64_t v11 = stateTable[16 * v11 + v18];
      uint64_t v14 = v15 + 1;
      v13 += 16;
      if (v19 < 0) {
        goto LABEL_17;
      }
    }
    uint64_t v15 = v10;
LABEL_17:
    if (v7 & 1 | ((v8 & 1) == 0)) {
      break;
    }
    uint64_t v20 = v40 >= v15 + 1 ? v15 + 1 : v40;
    if (v39 == v20) {
      break;
    }
    int v42 = v8;
    char v21 = 0;
    CFIndex v22 = this[1];
    uint64_t v23 = **((void **)v22 + 13);
    int v24 = *(_DWORD *)(v23 + 16 * a2 + 8);
    uint64_t v25 = v20 - 1;
    uint64_t v26 = v35;
    do
    {
      int v27 = v24;
      uint64_t v28 = a2 + 1;
      int v24 = *(_DWORD *)(v23 + 4 * v26 + 24);
      if ((unsigned __int16)v27 == 7 && (unsigned __int16)*(_DWORD *)(v23 + 4 * v26 + 24) == 5)
      {
        uint64_t StringIndex = TRunGlue::GetStringIndex(v22, a2);
        uint64_t v30 = TRunGlue::GetStringIndex(v22, a2 + 1);
        TRunGlue::SetStringIndex(v22, a2, v30);
        TRunGlue::SetStringIndex(v22, a2 + 1, StringIndex);
        TRunGlue::Rotate(this[1], a2, a2 + 1, a2 + 2, 0);
        CFIndex v31 = (int *)((char *)this[4] + v26);
        int v32 = *v31;
        *CFIndex v31 = v31[1];
        v31[1] = v32;
        uint64_t v23 = **((void **)v22 + 13);
        uint64_t v33 = (_DWORD *)(v23 + 4 * v26);
        v33[2] = v24;
        v33[3] = 0;
        v33[6] = v27;
        v33[7] = 0;
        char v21 = 1;
      }
      v26 += 4;
      ++a2;
    }
    while (v25 != v28);
    char v7 = 1;
    a2 = v37;
    a3 = v38;
    int v8 = v42;
    uint64_t v10 = v36;
  }
  while ((v21 & 1) != 0);
  return v15;
}

void IndicShapingEngine::SetFeatures(IndicShapingEngine *this, char *a2)
{
  v39[21] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (IndicClassTable *)*((void *)this + 63);
  if (!v3) {
    uint64_t v3 = (IndicClassTable *)*((void *)this + 62);
  }
  int v4 = (TRunGlue *)*((void *)this + 1);
  uint64_t v26 = *((void *)this + 2);
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
  uint64_t v38 = 0;
  long long v37 = 0u;
  *(void *)&long long v37 = *(void *)(v26 + 16);
  uint64_t v5 = TRunGlue::length(v4);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      v39[0] = TRunGlue::GetStringIndex(v4, i);
      int FullChar = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v26, v39, 0);
      int CharClass = IndicClassTable::getCharClass(v3, FullChar);
      uint64_t v11 = **((void **)v4 + 13) + v7;
      *(_DWORD *)(v11 + 8) = CharClass;
      *(_DWORD *)(v11 + 12) = 0;
      v7 += 16;
    }
  }
  char v12 = this;
  if (*(_DWORD *)(*((void *)this + 64) + 72) == 1802396769)
  {
    uint64_t v13 = (TRunGlue *)*((void *)this + 1);
    uint64_t v14 = TRunGlue::length(v13);
    if (v14 >= 3)
    {
      uint64_t v15 = v14;
      uint64_t v16 = 0;
      uint64_t v17 = **((void **)v13 + 13);
      do
      {
        if ((*(unsigned char *)(v17 + 16 * v16 + 11) & 0x40) != 0)
        {
          uint64_t v18 = v16 + 1;
          int v19 = *(_DWORD *)(v17 + 16 * (v16 + 1) + 8);
          if ((unsigned __int16)v19 == 7 && (int v20 = *(_DWORD *)(v17 + 16 * (v16 + 2) + 8), (unsigned __int16)v20 == 8))
          {
            uint64_t StringIndex = TRunGlue::GetStringIndex(v13, v16 + 1);
            uint64_t v22 = TRunGlue::GetStringIndex(v13, v16 + 2);
            TRunGlue::SetStringIndex(v13, v16 + 1, v22);
            TRunGlue::SetStringIndex(v13, v16 + 2, StringIndex);
            TRunGlue::Rotate(*((TRunGlue **)this + 1), v16 + 1, v16 + 2, v16 + 3, 0);
            *(int32x2_t *)(*((void *)this + 4) + 4 * v18) = vrev64_s32(*(int32x2_t *)(*((void *)this + 4) + 4 * v18));
            uint64_t v17 = **((void **)v13 + 13);
            uint64_t v23 = v17 + 16 * v18;
            char v12 = this;
            *(_DWORD *)(v23 + 8) = v20;
            *(_DWORD *)(v23 + 12) = 0;
            uint64_t v24 = v17 + 16 * (v16 + 2);
            *(_DWORD *)(v24 + 8) = v19;
            *(_DWORD *)(v24 + 12) = 0;
            v16 += 2;
          }
          else
          {
            char v12 = this;
          }
        }
        ++v16;
      }
      while (v15 - v16 >= 3);
    }
  }
  if (*((unsigned char *)v12 + 888))
  {
    strcpy(a2, "tkunnhkafhprfrkrferpfwlbflahftsputavtcjc");
    a2[41] = 0;
    *((_WORD *)a2 + 21) = 0;
    operator new();
  }
  strcpy(a2, "tkunnhkafhprfwlbflahftsputavtiniserpsvbaswlbstspnlah");
  a2[53] = 0;
  *((_WORD *)a2 + 27) = 0;
  operator new();
}

void OpenTypeReorderingOutput::writeChar(OpenTypeReorderingOutput *this, int a2, uint64_t a3, const unsigned int *a4, int a5, uint64_t a6)
{
  if ((a6 & 0x8000000000000000) == 0)
  {
    uint64_t v10 = *((void *)this + 3);
    if ((v10 & 0x8000000000000000) == 0)
    {
      *((_DWORD *)this + 8) |= 1 << (a3 - v10);
      uint64_t v11 = *((void *)this + 5);
      if (v11 <= a3) {
        uint64_t v11 = a3;
      }
      *((void *)this + 5) = v11;
    }
  }
  uint64_t InsertedIndex = OpenTypeReorderingOutput::getInsertedIndex(this, a2, a3, a6);
  uint64_t v13 = InsertedIndex;
  unint64_t v14 = *((void *)this + 12);
  uint64_t v15 = (uint64_t *)*((void *)this + 11);
  if ((unint64_t)v15 >= v14)
  {
    uint64_t v17 = (uint64_t *)*((void *)this + 10);
    uint64_t v18 = v15 - v17;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 61) {
      goto LABEL_68;
    }
    uint64_t v20 = v14 - (void)v17;
    if (v20 >> 2 > v19) {
      unint64_t v19 = v20 >> 2;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      uint64_t v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<long>>((uint64_t)this + 96, v21);
      uint64_t v17 = (uint64_t *)*((void *)this + 10);
      uint64_t v15 = (uint64_t *)*((void *)this + 11);
    }
    else
    {
      uint64_t v22 = 0;
    }
    uint64_t v23 = (uint64_t *)&v22[8 * v18];
    uint64_t v24 = &v22[8 * v21];
    *uint64_t v23 = v13;
    uint64_t v16 = v23 + 1;
    while (v15 != v17)
    {
      uint64_t v25 = *--v15;
      *--uint64_t v23 = v25;
    }
    *((void *)this + 10) = v23;
    *((void *)this + 11) = v16;
    *((void *)this + 12) = v24;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *uint64_t v15 = InsertedIndex;
    uint64_t v16 = v15 + 1;
  }
  unint64_t v26 = *((void *)this + 9);
  *((void *)this + 11) = v16;
  long long v27 = (int *)*((void *)this + 8);
  if ((unint64_t)v27 >= v26)
  {
    long long v29 = (int *)*((void *)this + 7);
    uint64_t v30 = v27 - v29;
    unint64_t v31 = v30 + 1;
    if ((unint64_t)(v30 + 1) >> 62) {
      goto LABEL_68;
    }
    uint64_t v32 = v26 - (void)v29;
    if (v32 >> 1 > v31) {
      unint64_t v31 = v32 >> 1;
    }
    if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v33 = v31;
    }
    if (v33)
    {
      long long v34 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)this + 72, v33);
      long long v29 = (int *)*((void *)this + 7);
      long long v27 = (int *)*((void *)this + 8);
    }
    else
    {
      long long v34 = 0;
    }
    long long v35 = (int *)&v34[4 * v30];
    long long v36 = &v34[4 * v33];
    int *v35 = a2;
    long long v28 = v35 + 1;
    while (v27 != v29)
    {
      int v37 = *--v27;
      *--long long v35 = v37;
    }
    *((void *)this + 7) = v35;
    *((void *)this + 8) = v28;
    *((void *)this + 9) = v36;
    if (v29) {
      operator delete(v29);
    }
  }
  else
  {
    int *v27 = a2;
    long long v28 = v27 + 1;
  }
  unint64_t v38 = *((void *)this + 15);
  *((void *)this + 8) = v28;
  uint64_t v39 = (char *)*((void *)this + 14);
  if ((unint64_t)v39 >= v38)
  {
    uint64_t v41 = (char *)*((void *)this + 13);
    uint64_t v42 = (v39 - v41) >> 2;
    unint64_t v43 = v42 + 1;
    if ((unint64_t)(v42 + 1) >> 62) {
      goto LABEL_68;
    }
    uint64_t v44 = v38 - (void)v41;
    if (v44 >> 1 > v43) {
      unint64_t v43 = v44 >> 1;
    }
    if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v45 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v45 = v43;
    }
    if (v45)
    {
      uint64_t v46 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)this + 120, v45);
      uint64_t v41 = (char *)*((void *)this + 13);
      uint64_t v39 = (char *)*((void *)this + 14);
    }
    else
    {
      uint64_t v46 = 0;
    }
    long long v47 = &v46[4 * v42];
    BOOL v48 = &v46[4 * v45];
    *(_DWORD *)long long v47 = a5;
    uint64_t v40 = v47 + 4;
    while (v39 != v41)
    {
      int v49 = *((_DWORD *)v39 - 1);
      v39 -= 4;
      *((_DWORD *)v47 - 1) = v49;
      v47 -= 4;
    }
    *((void *)this + 13) = v47;
    *((void *)this + 14) = v40;
    *((void *)this + 15) = v48;
    if (v41) {
      operator delete(v41);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v39 = a5;
    uint64_t v40 = v39 + 4;
  }
  unint64_t v50 = *((void *)this + 18);
  *((void *)this + 14) = v40;
  uint64_t v51 = (void *)*((void *)this + 17);
  if ((unint64_t)v51 < v50)
  {
    *uint64_t v51 = *((void *)this + 6);
    v51[1] = a4;
    uint64_t v52 = v51 + 2;
    goto LABEL_67;
  }
  uint64_t v53 = *((void *)this + 16);
  uint64_t v54 = ((uint64_t)v51 - v53) >> 4;
  unint64_t v55 = v54 + 1;
  if ((unint64_t)(v54 + 1) >> 60) {
LABEL_68:
  }
    abort();
  uint64_t v56 = v50 - v53;
  if (v56 >> 3 > v55) {
    unint64_t v55 = v56 >> 3;
  }
  if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v57 = v55;
  }
  uint64_t v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CGSize>>((uint64_t)this + 144, v57);
  BOOL v59 = &v58[16 * v54];
  uint64_t v61 = &v58[16 * v60];
  *(void *)BOOL v59 = *((void *)this + 6);
  *((void *)v59 + 1) = a4;
  uint64_t v52 = v59 + 16;
  uint64_t v63 = (char *)*((void *)this + 16);
  uint64_t v62 = (char *)*((void *)this + 17);
  if (v62 != v63)
  {
    do
    {
      *((_OWORD *)v59 - 1) = *((_OWORD *)v62 - 1);
      v59 -= 16;
      v62 -= 16;
    }
    while (v62 != v63);
    uint64_t v62 = (char *)*((void *)this + 16);
  }
  *((void *)this + 16) = v59;
  *((void *)this + 17) = v52;
  *((void *)this + 18) = v61;
  if (v62) {
    operator delete(v62);
  }
LABEL_67:
  *((void *)this + 17) = v52;
}

void OpenTypeReorderingOutput::forEachUnwrittenIndex(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[14] = v3;
  v28[13] = v3;
  v28[12] = v3;
  v28[11] = v3;
  v28[10] = v3;
  v28[9] = v3;
  v28[8] = v3;
  v28[7] = v3;
  v28[6] = v3;
  v28[5] = v3;
  v28[4] = v3;
  v28[3] = v3;
  v28[2] = v3;
  v28[1] = v3;
  v28[0] = v3;
  unint64_t v26 = 0;
  long long v27 = 0;
  uint64_t v25 = 0;
  long long v29 = v28;
  uint64_t v4 = a2 - *(void *)(a1 + 24);
  if (v4 >= 1)
  {
    uint64_t v7 = 0;
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (((*(_DWORD *)(a1 + 32) >> i) & 1) == 0)
      {
        uint64_t v9 = (void *)(*(void *)(a1 + 24) + i);
        if (v7 >= v27)
        {
          uint64_t v11 = v25;
          uint64_t v12 = v7 - v25;
          unint64_t v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) >> 61) {
            abort();
          }
          uint64_t v14 = (char *)v27 - (char *)v25;
          if (((char *)v27 - (char *)v25) >> 2 > v13) {
            unint64_t v13 = v14 >> 2;
          }
          if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v13;
          }
          v24[4] = (void **)v28;
          if (v15)
          {
            uint64_t v16 = (char *)TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>::allocate((uint64_t)v28, v15);
            uint64_t v11 = v25;
            uint64_t v7 = v26;
          }
          else
          {
            uint64_t v16 = 0;
          }
          uint64_t v17 = &v16[8 * v12];
          *(void *)uint64_t v17 = v9;
          if (v7 == v11)
          {
            unint64_t v19 = &v16[8 * v12];
          }
          else
          {
            uint64_t v18 = v7;
            unint64_t v19 = &v16[8 * v12];
            do
            {
              uint64_t v20 = (uint64_t)*--v18;
              *((void *)v19 - 1) = v20;
              v19 -= 8;
            }
            while (v18 != v11);
          }
          uint64_t v10 = (void **)(v17 + 8);
          uint64_t v25 = (void **)v19;
          unint64_t v26 = (void **)(v17 + 8);
          unint64_t v21 = v27;
          long long v27 = (void **)&v16[8 * v15];
          v24[2] = v7;
          v24[3] = v21;
          v24[0] = v11;
          v24[1] = v11;
          std::__split_buffer<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul> &>::~__split_buffer((uint64_t)v24);
          uint64_t v7 = v10;
        }
        else
        {
          *v7++ = v9;
          uint64_t v10 = v7;
        }
        unint64_t v26 = v10;
      }
    }
    for (j = (uint64_t *)v25; j != (uint64_t *)v7; ++j)
    {
      uint64_t v23 = *j;
      std::function<void ()(long)>::operator()(a3, v23);
    }
  }
  v24[0] = (void **)&v25;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100](v24);
}

void IndicShapingEngine::~IndicShapingEngine(IndicShapingEngine *this)
{
  *(void *)this = &unk_1ED05E6F0;
  unint64_t v2 = (void **)((char *)this + 520);
  uint64_t v4 = (void **)((char *)this + 808);
  std::vector<PostGSUBFixups::Adjustment,TInlineBufferAllocator<PostGSUBFixups::Adjustment,2ul>>::__destroy_vector::operator()[abi:nn180100](&v4);
  uint64_t v4 = v2;
  std::vector<PostGSUBFixups::FixupData,TInlineBufferAllocator<PostGSUBFixups::FixupData,8ul>>::__destroy_vector::operator()[abi:nn180100](&v4);
  uint64_t v3 = *((void *)this + 63);
  *((void *)this + 63) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  OpenTypeShapingEngine::~OpenTypeShapingEngine(this);
}

{
  void **v2;
  uint64_t v3;
  void **v4;

  *(void *)this = &unk_1ED05E6F0;
  unint64_t v2 = (void **)((char *)this + 520);
  uint64_t v4 = (void **)((char *)this + 808);
  std::vector<PostGSUBFixups::Adjustment,TInlineBufferAllocator<PostGSUBFixups::Adjustment,2ul>>::__destroy_vector::operator()[abi:nn180100](&v4);
  uint64_t v4 = v2;
  std::vector<PostGSUBFixups::FixupData,TInlineBufferAllocator<PostGSUBFixups::FixupData,8ul>>::__destroy_vector::operator()[abi:nn180100](&v4);
  uint64_t v3 = *((void *)this + 63);
  *((void *)this + 63) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  OpenTypeShapingEngine::~OpenTypeShapingEngine(this);
  MEMORY[0x1853275C0]();
}

void std::vector<PostGSUBFixups::Adjustment,TInlineBufferAllocator<PostGSUBFixups::Adjustment,2ul>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  v1 = *a1;
  unint64_t v2 = (void **)**a1;
  if (v2)
  {
    v1[1] = v2;
    uint64_t v3 = v1 + 9;
    if (v1 + 3 <= v2)
    {
      BOOL v4 = v3 >= v2;
      BOOL v5 = v3 == v2;
    }
    else
    {
      BOOL v4 = 0;
      BOOL v5 = 0;
    }
    if (!v5 && v4)
    {
      if (v1[2] == v1[9]) {
        *uint64_t v3 = v2;
      }
    }
    else
    {
      operator delete(v2);
    }
  }
}

void std::vector<PostGSUBFixups::FixupData,TInlineBufferAllocator<PostGSUBFixups::FixupData,8ul>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  v1 = *a1;
  unint64_t v2 = (void **)**a1;
  if (v2)
  {
    v1[1] = v2;
    uint64_t v3 = v1 + 35;
    if (v1 + 3 <= v2)
    {
      BOOL v4 = v3 >= v2;
      BOOL v5 = v3 == v2;
    }
    else
    {
      BOOL v4 = 0;
      BOOL v5 = 0;
    }
    if (!v5 && v4)
    {
      if (v1[2] == v1[35]) {
        *uint64_t v3 = v2;
      }
    }
    else
    {
      operator delete(v2);
    }
  }
}

void std::__function::__func<IndicShapingEngine::SetV1Features(unsigned int *)::$_1,std::allocator<IndicShapingEngine::SetV1Features(unsigned int *)::$_1>,void ()(long)>::~__func()
{
}

__n128 std::__function::__func<IndicShapingEngine::SetV1Features(unsigned int *)::$_1,std::allocator<IndicShapingEngine::SetV1Features(unsigned int *)::$_1>,void ()(long)>::__clone(uint64_t a1)
{
  unint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)unint64_t v2 = &unk_1ED061040;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<IndicShapingEngine::SetV1Features(unsigned int *)::$_1,std::allocator<IndicShapingEngine::SetV1Features(unsigned int *)::$_1>,void ()(long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1ED061040;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<IndicShapingEngine::SetV1Features(unsigned int *)::$_1,std::allocator<IndicShapingEngine::SetV1Features(unsigned int *)::$_1>,void ()(long)>::operator()(uint64_t a1, uint64_t *a2)
{
}

void std::__function::__func<IndicShapingEngine::SetV2Features(unsigned int *)::$_4,std::allocator<IndicShapingEngine::SetV2Features(unsigned int *)::$_4>,void ()(long)>::~__func()
{
}

__n128 std::__function::__func<IndicShapingEngine::SetV2Features(unsigned int *)::$_4,std::allocator<IndicShapingEngine::SetV2Features(unsigned int *)::$_4>,void ()(long)>::__clone(uint64_t a1)
{
  unint64_t v2 = (char *)operator new(0x28uLL);
  *(void *)unint64_t v2 = &unk_1ED061088;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 std::__function::__func<IndicShapingEngine::SetV2Features(unsigned int *)::$_4,std::allocator<IndicShapingEngine::SetV2Features(unsigned int *)::$_4>,void ()(long)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1ED061088;
  __n128 result = *(__n128 *)(a1 + 8);
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<IndicShapingEngine::SetV2Features(unsigned int *)::$_4,std::allocator<IndicShapingEngine::SetV2Features(unsigned int *)::$_4>,void ()(long)>::operator()(uint64_t a1, uint64_t *a2)
{
}

void IndicClassTable::IndicClassTable(IndicClassTable *this, const IndicClassTable *a2, const __CTFont *a3, OTL::GSUB *a4)
{
  uint64_t v4 = MEMORY[0x1F4188790](this, a2);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v12 = *(_DWORD *)(v9 + 12);
  *(_DWORD *)(v4 + 8) = *(_DWORD *)(v9 + 8);
  *(_DWORD *)(v4 + 12) = v12;
  *(void *)(v4 + 16) = 0;
  *(void *)uint64_t v4 = &unk_1ED05E460;
  *(_WORD *)(v4 + 24) = *(_WORD *)(v9 + 24);
  *(void *)(v4 + 32) = *(void *)(v9 + 32);
  *(_DWORD *)(v4 + 40) = *(_DWORD *)(v9 + 40);
  *(void *)(v4 + 48) = v9;
  *(void *)(v4 + 56) = *(void *)(v9 + 56);
  *(void *)(v4 + 64) = 0;
  unint64_t v13 = (atomic_ullong *)(v4 + 64);
  *(void *)(v4 + 72) = 0;
  uint64_t v14 = wmemchr(IndicClassTableCache::kScriptTags, *(_DWORD *)(v5 + 72), 9uLL);
  unint64_t v15 = (__int32 *)&devaCharClasses;
  if (v14) {
    unint64_t v15 = v14;
  }
  uint64_t v16 = (char *)v15 - (char *)IndicClassTableCache::kScriptTags;
  if (v16 == 36) {
    goto LABEL_4;
  }
  uint64_t v17 = v16 >> 2;
  uint64_t v18 = *(void *)(v8 + 40);
  TBaseFont::RetainedObject(*(os_unfair_lock_s **)(v18 + 400), 3, (const void *)(v16 >> 2), &v22);

  unint64_t explicit = atomic_load_explicit(v13, memory_order_acquire);
  if (!explicit)
  {

    unint64_t explicit = atomic_load_explicit(v13, memory_order_acquire);
    if (!explicit)
    {
LABEL_4:
      *(void *)(v11 + 16) = *(void *)(v10 + 16);
      return;
    }
    TBaseFont::SetObject(*(os_unfair_lock_s **)(v18 + 400), 3, (const void *)v17, (const void *)atomic_load_explicit(v13, memory_order_acquire));
  }
  unint64_t v20 = atomic_load_explicit((atomic_ullong *volatile)(explicit + 8 + 8 * v17), memory_order_acquire);
  *(void *)(v11 + 16) = v20;
  if (!v20)
  {
    *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26[8] = v21;
    v26[9] = v21;
    v26[6] = v21;
    v26[7] = v21;
    v26[4] = v21;
    v26[5] = v21;
    v26[2] = v21;
    v26[3] = v21;
    int v24 = 1819239276;
    v26[0] = v21;
    v26[1] = v21;
    OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)&v22, &v24, v25);
    OTL::GCommon::GetLookups(v6, (uint64_t)&v22, (uint64_t)v26);
    __dst = &v22;
    std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100](&__dst);
    operator new[]();
  }
}

uint64_t hasForm(const TBaseFont *a1, OTL::GSUB *a2, const unsigned __int16 (*a3)[2], __int16 a4, int a5)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  LOWORD(v37) = (_WORD)a3;
  HIWORD(v37) = a4;
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43[6] = v7;
  v43[5] = v7;
  v43[4] = v7;
  v43[3] = v7;
  v43[2] = v7;
  v43[1] = v7;
  v43[0] = v7;
  unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v45 = v43;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  int v36 = a5;
  OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>(v39, &v36, &v37);
  BOOL Lookups = OTL::GCommon::GetLookups((uint64_t)a2, (uint64_t)v39, (uint64_t)&v40, 0);
  unint64_t v38 = v39;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v38);
  uint64_t v9 = 0;
  if (Lookups)
  {
    lock = (os_unfair_lock_s *)((char *)a1 + 356);
    os_unfair_lock_lock_with_options();
    char v32 = 0;
    uint64_t v30 = a1;
    while (1)
    {
      uint64_t v10 = v40;
      unint64_t v33 = v41;
      if (v40 != v41)
      {
        do
        {
          long long v34 = v10;
          uint64_t v11 = TBaseFont::NthLookup<OTL::GSUB>((uint64_t)a1, a2, *v10);
          if (v11)
          {
            int v12 = v11;
            uint64_t v35 = (unsigned __int16)(-21845 * ((*((_DWORD *)v11 + 24) - *((_DWORD *)v11 + 22)) >> 4));
            if (-21845 * (unsigned __int16)((*((_DWORD *)v11 + 24) - *((_DWORD *)v11 + 22)) >> 4))
            {
              unint64_t v13 = 0;
              while (2)
              {
                uint64_t v14 = *((void *)v12 + 11);
                unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v12 + 12) - v14) >> 4);
                uint64_t v16 = v15 <= v13 ? 0 : v14 + 48 * v13 + 8;
                if (v15 > v13)
                {
                  char v17 = 0;
                  uint64_t v18 = 0;
                  uint64_t v19 = v14 + 48 * v13;
                  unint64_t v20 = (uint64_t (**)(void *, void))(v19 + 24);
                  long long v21 = (uint64_t *)(v19 + 32);
                  do
                  {
                    char v22 = v17;
                    uint64_t v23 = *v20;
                    int v24 = (void *)(v16 + (*v21 >> 1));
                    if (*v21) {
                      uint64_t v23 = *(uint64_t (**)(void *, void))(*v24 + v23);
                    }
                    unsigned int v25 = v23(v24, *((unsigned __int16 *)&v37 + v18));
                    if (v25)
                    {
                      uint64_t v26 = *((void *)v12 + 11);
                      uint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((*((void *)v12 + 12) - v26) >> 4) <= v13
                          ? 0
                          : *(ChainContextSubstFormat1 **)(v26 + 48 * v13);
                      if (OTL::GSUB::WouldSubstituteSubtable(a2, (int)v12, *((unsigned __int16 *)v12 + 8), v27, v25, (unsigned __int16 *)&v37 + v18, 2 - (int)v18))
                      {
                        uint64_t v9 = 1;
                        goto LABEL_25;
                      }
                    }
                    char v17 = 1;
                    uint64_t v18 = 1;
                  }
                  while ((v22 & 1) == 0);
                  if (++v13 != v35) {
                    continue;
                  }
                }
                break;
              }
            }
          }
          uint64_t v10 = v34 + 2;
          a1 = v30;
        }
        while (v34 + 2 != v33);
      }
      if (v32) {
        break;
      }
      HIDWORD(v28) = v37;
      LODWORD(v28) = v37;
      int v37 = v28 >> 16;
      char v32 = 1;
    }
    uint64_t v9 = 0;
LABEL_25:
    os_unfair_lock_unlock(lock);
  }
  v39[0] = (char *)&v40;
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v39);
  return v9;
}

void IndicClassTable::~IndicClassTable(id *this)
{
  *this = &unk_1ED05E460;
}

{
  uint64_t vars8;

  *this = &unk_1ED05E460;

  JUMPOUT(0x1853275C0);
}

uint64_t IndicClassTable::getCharClass(IndicClassTable *this, int a2)
{
  switch(a2)
  {
    case 160:
      return 2147483663;
    case 8204:
      return 9;
    case 8205:
      return 2147483656;
  }
  unsigned int v4 = *((unsigned __int16 *)this + 4);
  BOOL v5 = a2 >= v4;
  unsigned int v6 = a2 - v4;
  if (!v5
    || *((unsigned __int16 *)this + 5) < a2
    || (uint64_t result = *(unsigned int *)(*((void *)this + 2) + 4 * v6), !result))
  {
    uint64_t v7 = *((void *)this + 7);
    if (v7)
    {
      unsigned int v8 = *((unsigned __int16 *)this + 20);
      BOOL v5 = a2 >= v8;
      unsigned int v9 = a2 - v8;
      if (v5 && *((unsigned __int16 *)this + 21) >= a2) {
        return *(unsigned int *)(v7 + 4 * v9);
      }
    }
    uint64_t result = 2147483651;
    if (a2 > 8209)
    {
      if (a2 > 9675)
      {
        if (a2 > 70400)
        {
          if ((a2 - 70459) < 2) {
            return 5;
          }
          if (a2 != 70401)
          {
            if (a2 == 70403) {
              return 1048588;
            }
            return 0;
          }
          return 3145729;
        }
        if ((a2 - 9676) > 0x32) {
          return 0;
        }
        uint64_t v11 = 1 << (a2 + 52);
        uint64_t v12 = 0x7800000000001;
        goto LABEL_43;
      }
      if ((a2 - 8304) > 0x19 || ((1 << (a2 - 112)) & 0x3FF03F1) == 0)
      {
        if ((a2 - 8210) > 0x10 || ((1 << (a2 - 18)) & 0x1000F) == 0)
        {
          if (a2 == 8432) {
            return 3145740;
          }
          return 0;
        }
        return result;
      }
    }
    else
    {
      char v10 = a2 + 48;
      if ((a2 - 7376) <= 0x27)
      {
        if (((1 << v10) & 0x9021FFFFF7) != 0) {
          return 13;
        }
        if (((1 << v10) & 0x1E000000) != 0) {
          return 14;
        }
        if (((1 << v10) & 0x6000000000) != 0) {
          return 2147483652;
        }
      }
      if ((a2 - 160) > 0x37) {
        return 0;
      }
      if (((1 << (a2 + 96)) & 0x20C0000) == 0)
      {
        uint64_t v11 = 1 << (a2 + 96);
        uint64_t v12 = 0x80000000000001;
LABEL_43:
        if ((v11 & v12) == 0) {
          return 0;
        }
        return result;
      }
    }
    return 10;
  }
  return result;
}

uint64_t IndicClassTable::getReorderClass(IndicClassTable *this, int a2, uint64_t a3)
{
  if ((a2 & 0x700000) != 0x100000) {
    return 0;
  }
  int v3 = *((_DWORD *)this + 3) & 0x30000;
  if (v3 == 0x10000) {
    return 4;
  }
  if (v3 == 0x20000) {
    return 3;
  }
  return (*(uint64_t (**)(void, uint64_t))(**((void **)this + 6) + 16))(*((void *)this + 6), a3);
}

uint64_t IndicClassTable::getReorderClassInternal(IndicClassTable *this)
{
  return 0;
}

double IndicReorderingOutput::reset(IndicReorderingOutput *this, uint64_t a2)
{
  ++*((void *)this + 6);
  *((void *)this + 3) = a2;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 55) = *((void *)this + 54);
  *((void *)this + 122) = -1;
  *((void *)this + 123) = -1;
  *((void *)this + 133) = 0;
  *((_WORD *)this + 528) = 0;
  *((_WORD *)this + 524) = 0;
  *((void *)this + 129) = -1;
  *((void *)this + 134) = -1;
  *((_WORD *)this + 504) = 0;
  *((_WORD *)this + 500) = 0;
  *((void *)this + 130) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 1016) = 0u;
  return result;
}

int64x2_t *IndicReorderingOutput::saveMatra(int64x2_t *this, const IndicClassTable *a2, uint64_t a3, uint64_t a4, int a5, const unsigned int *a6, uint64_t a7)
{
  int v11 = a3;
  uint64_t v12 = this;
  switch(((a5 & 0x700000u) - 0x100000) >> 20)
  {
    case 0u:
      this = (int64x2_t *)IndicClassTable::getReorderClass(a2, a5, a3);
      int v13 = (int)this;
      char v14 = 9;
      break;
    case 1u:
      int v13 = 0;
      char v14 = 8;
      break;
    case 2u:
      int v13 = 0;
      char v14 = 6;
      break;
    case 3u:
      int v13 = 0;
      char v14 = 5;
      break;
    default:
      char v14 = 0;
      int v13 = 0;
      break;
  }
  unint64_t v15 = v12[27].u64[1];
  unint64_t v16 = v12[28].u64[0];
  if (v15 >= v16)
  {
    uint64_t v18 = v12[27].i64[0];
    uint64_t v19 = (uint64_t)(v15 - v18) >> 6;
    unint64_t v20 = v19 + 1;
    if ((unint64_t)(v19 + 1) >> 58) {
      abort();
    }
    uint64_t v21 = v16 - v18;
    if (v21 >> 5 > v20) {
      unint64_t v20 = v21 >> 5;
    }
    if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v22 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v22 = v20;
    }
    int v36 = &v12[28].i64[1];
    if (v22) {
      uint64_t v23 = TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>::allocate((uint64_t)&v12[28].i64[1], v22);
    }
    else {
      uint64_t v23 = 0;
    }
    int v24 = &v23[64 * v19];
    *int v24 = v14;
    *((_DWORD *)v24 + 1) = v13;
    *((_DWORD *)v24 + 2) = v11;
    *((void *)v24 + 2) = a4;
    *((void *)v24 + 3) = a7;
    *((void *)v24 + 4) = a6;
    *((_DWORD *)v24 + 10) = a5;
    *((void *)v24 + 6) = -1;
    *((void *)v24 + 7) = -1;
    uint64_t v25 = v12[27].i64[0];
    unint64_t v26 = v12[27].u64[1];
    if (v26 == v25)
    {
      int64x2_t v31 = vdupq_n_s64(v26);
      uint64_t v27 = &v23[64 * v19];
    }
    else
    {
      uint64_t v27 = &v23[64 * v19];
      do
      {
        long long v28 = *(_OWORD *)(v26 - 64);
        long long v29 = *(_OWORD *)(v26 - 48);
        long long v30 = *(_OWORD *)(v26 - 16);
        *((_OWORD *)v27 - 2) = *(_OWORD *)(v26 - 32);
        *((_OWORD *)v27 - 1) = v30;
        *((_OWORD *)v27 - 4) = v28;
        *((_OWORD *)v27 - 3) = v29;
        v27 -= 64;
        v26 -= 64;
      }
      while (v26 != v25);
      int64x2_t v31 = v12[27];
    }
    char v17 = v24 + 64;
    v12[27].i64[0] = (uint64_t)v27;
    v12[27].i64[1] = (uint64_t)(v24 + 64);
    int64x2_t v34 = v31;
    uint64_t v32 = v12[28].i64[0];
    v12[28].i64[0] = (uint64_t)&v23[64 * v22];
    uint64_t v35 = v32;
    uint64_t v33 = v31.i64[0];
    this = (int64x2_t *)std::__split_buffer<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul> &>::~__split_buffer((uint64_t)&v33);
  }
  else
  {
    *(unsigned char *)unint64_t v15 = v14;
    *(_DWORD *)(v15 + 4) = v13;
    *(_DWORD *)(v15 + 8) = v11;
    *(void *)(v15 + 16) = a4;
    *(void *)(v15 + 24) = a7;
    *(void *)(v15 + 32) = a6;
    *(_DWORD *)(v15 + 40) = a5;
    char v17 = (char *)(v15 + 64);
    *(void *)(v15 + 48) = -1;
    *(void *)(v15 + 56) = -1;
  }
  v12[27].i64[1] = (uint64_t)v17;
  return this;
}

uint64_t IndicReorderingOutput::noteMatra(int64x2_t *this, const IndicClassTable *a2, int a3, uint64_t a4, const unsigned int *a5)
{
  unint64_t CharClass = IndicClassTable::getCharClass(a2, a3);
  int v11 = CharClass;
  if ((unsigned __int16)CharClass == 5)
  {
    unint64_t v25 = this[27].u64[1];
    unint64_t v28 = this[28].u64[0];
    if (v25 < v28)
    {
      char v27 = 11;
      goto LABEL_23;
    }
    uint64_t v37 = this[27].i64[0];
    uint64_t v38 = (uint64_t)(v25 - v37) >> 6;
    unint64_t v39 = v38 + 1;
    if (!((unint64_t)(v38 + 1) >> 58))
    {
      uint64_t v40 = v28 - v37;
      if (v40 >> 5 > v39) {
        unint64_t v39 = v40 >> 5;
      }
      if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v35 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v35 = v39;
      }
      unint64_t v57 = &this[28].i8[8];
      if (v35) {
        int v36 = TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>::allocate((uint64_t)&this[28].i64[1], v35);
      }
      else {
        int v36 = 0;
      }
      uint64_t v41 = &v36[64 * v38];
      *uint64_t v41 = 11;
      *((_DWORD *)v41 + 1) = 0;
      *((_DWORD *)v41 + 2) = a3;
      *((void *)v41 + 2) = a4;
      *((void *)v41 + 3) = 0;
      *((void *)v41 + 4) = a5;
      *((_DWORD *)v41 + 10) = v11;
      *((void *)v41 + 6) = -1;
      *((void *)v41 + 7) = -1;
      uint64_t v48 = this[27].i64[0];
      unint64_t v43 = this[27].u64[1];
      if (v43 != v48)
      {
        unint64_t v44 = &v36[64 * v38];
        do
        {
          long long v49 = *(_OWORD *)(v43 - 64);
          long long v50 = *(_OWORD *)(v43 - 48);
          long long v51 = *(_OWORD *)(v43 - 16);
          *((_OWORD *)v44 - 2) = *(_OWORD *)(v43 - 32);
          *((_OWORD *)v44 - 1) = v51;
          *((_OWORD *)v44 - 4) = v49;
          *((_OWORD *)v44 - 3) = v50;
          v44 -= 64;
          v43 -= 64;
        }
        while (v43 != v48);
        goto LABEL_51;
      }
LABEL_52:
      int64x2_t v52 = vdupq_n_s64(v43);
      unint64_t v44 = v41;
      goto LABEL_53;
    }
LABEL_57:
    abort();
  }
  if ((unsigned __int16)CharClass == 10)
  {
    unint64_t v25 = this[27].u64[1];
    unint64_t v26 = this[28].u64[0];
    if (v25 < v26)
    {
      char v27 = 1;
LABEL_23:
      *(unsigned char *)unint64_t v25 = v27;
      *(_DWORD *)(v25 + 4) = 0;
      *(_DWORD *)(v25 + 8) = a3;
      *(void *)(v25 + 16) = a4;
      *(void *)(v25 + 24) = 0;
      *(void *)(v25 + 32) = a5;
      *(_DWORD *)(v25 + 40) = CharClass;
      uint64_t v29 = v25 + 64;
      *(void *)(v25 + 48) = -1;
      *(void *)(v25 + 56) = -1;
LABEL_54:
      this[27].i64[1] = v29;
      return 1;
    }
    uint64_t v31 = this[27].i64[0];
    uint64_t v32 = (uint64_t)(v25 - v31) >> 6;
    unint64_t v33 = v32 + 1;
    if (!((unint64_t)(v32 + 1) >> 58))
    {
      uint64_t v34 = v26 - v31;
      if (v34 >> 5 > v33) {
        unint64_t v33 = v34 >> 5;
      }
      if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v35 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v35 = v33;
      }
      unint64_t v57 = &this[28].i8[8];
      if (v35) {
        int v36 = TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>::allocate((uint64_t)&this[28].i64[1], v35);
      }
      else {
        int v36 = 0;
      }
      uint64_t v41 = &v36[64 * v32];
      *uint64_t v41 = 1;
      *((_DWORD *)v41 + 1) = 0;
      *((_DWORD *)v41 + 2) = a3;
      *((void *)v41 + 2) = a4;
      *((void *)v41 + 3) = 0;
      *((void *)v41 + 4) = a5;
      *((_DWORD *)v41 + 10) = v11;
      *((void *)v41 + 6) = -1;
      *((void *)v41 + 7) = -1;
      uint64_t v42 = this[27].i64[0];
      unint64_t v43 = this[27].u64[1];
      if (v43 != v42)
      {
        unint64_t v44 = &v36[64 * v32];
        do
        {
          long long v45 = *(_OWORD *)(v43 - 64);
          long long v46 = *(_OWORD *)(v43 - 48);
          long long v47 = *(_OWORD *)(v43 - 16);
          *((_OWORD *)v44 - 2) = *(_OWORD *)(v43 - 32);
          *((_OWORD *)v44 - 1) = v47;
          *((_OWORD *)v44 - 4) = v45;
          *((_OWORD *)v44 - 3) = v46;
          v44 -= 64;
          v43 -= 64;
        }
        while (v43 != v42);
LABEL_51:
        int64x2_t v52 = this[27];
LABEL_53:
        uint64_t v29 = (uint64_t)(v41 + 64);
        this[27].i64[0] = (uint64_t)v44;
        this[27].i64[1] = (uint64_t)(v41 + 64);
        int64x2_t v55 = v52;
        uint64_t v53 = this[28].i64[0];
        this[28].i64[0] = (uint64_t)&v36[64 * v35];
        uint64_t v56 = v53;
        uint64_t v54 = v52.i64[0];
        std::__split_buffer<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul> &>::~__split_buffer((uint64_t)&v54);
        goto LABEL_54;
      }
      goto LABEL_52;
    }
    goto LABEL_57;
  }
  if ((unsigned __int16)CharClass != 6) {
    return 0;
  }
  if ((CharClass & 0xF0000) != 0)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *((void *)a2 + 4);
    uint64_t v14 = v13 + 6 * ((CharClass >> 16) & 0xF);
    uint64_t v15 = -6;
    do
    {
      uint64_t v16 = v12;
      int v17 = *(unsigned __int16 *)(v14 + v15);
      if (*(_WORD *)(v14 + v15)) {
        ++v12;
      }
      v15 += 2;
    }
    while (v15);
    if (v12)
    {
      uint64_t v18 = 0;
      if (v17) {
        uint64_t v19 = v16 + 1;
      }
      else {
        uint64_t v19 = v16;
      }
      uint64_t v20 = -v19;
      uint64_t v21 = v13 + 6 * ((CharClass >> 16) & 0xF) + 2 * v19 - 8;
      do
      {
        uint64_t v22 = *(unsigned __int16 *)(v21 + 2 * v18);
        int v23 = IndicClassTable::getCharClass(a2, *(unsigned __int16 *)(v21 + 2 * v18));
        if (v18) {
          uint64_t v24 = 0x8000000000000000;
        }
        else {
          uint64_t v24 = 0x4000000000000000;
        }
        IndicReorderingOutput::saveMatra(this, a2, v22, a4, v23, a5, v24);
        --v18;
      }
      while (v20 != v18);
    }
  }
  else
  {
    IndicReorderingOutput::saveMatra(this, a2, (unsigned __int16)a3, a4, CharClass, a5, 0);
  }
  return 1;
}

uint64_t IndicReorderingOutput::assignReorderClasses(uint64_t this, const IndicClassTable *a2)
{
  unint64_t v2 = *(unsigned __int8 **)(this + 432);
  for (uint64_t i = *(unsigned __int8 **)(this + 440); v2 != i; v2 += 64)
  {
    if (!*((_DWORD *)v2 + 1))
    {
      int v4 = *v2;
      if ((v4 - 6) >= 2)
      {
        if (v4 != 8) {
          continue;
        }
        int v8 = *((_DWORD *)a2 + 3) & 0xC0000;
        switch(v8)
        {
          case 262144:
            int v7 = 4;
            break;
          case 786432:
            int v7 = 2;
            break;
          case 524288:
            int v7 = 3;
            break;
          default:
            continue;
        }
      }
      else
      {
        int v5 = *((_DWORD *)a2 + 3) & 0x300000;
        if (v5 == 0x200000) {
          int v6 = 2;
        }
        else {
          int v6 = 4;
        }
        if (v5 == 3145728) {
          int v6 = 1;
        }
        if (v5 == 0x100000) {
          int v7 = 3;
        }
        else {
          int v7 = v6;
        }
      }
      *((_DWORD *)v2 + 1) = v7;
    }
  }
  return this;
}

uint64_t IndicReorderingOutput::finishMatras(IndicReorderingOutput *this, uint64_t a2, int a3)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v6 = (unsigned __int8 *)*((void *)this + 54);
  int v5 = (unsigned __int8 *)*((void *)this + 55);
  int v7 = v5 - 64;
  BOOL v8 = v6 != v5 && v7 > v6;
  if (v8)
  {
    unsigned int v9 = v6 + 64;
    do
    {
      long long v11 = *((_OWORD *)v9 - 2);
      long long v10 = *((_OWORD *)v9 - 1);
      long long v13 = *((_OWORD *)v9 - 4);
      long long v12 = *((_OWORD *)v9 - 3);
      long long v14 = *((_OWORD *)v7 + 3);
      long long v16 = *(_OWORD *)v7;
      long long v15 = *((_OWORD *)v7 + 1);
      *((_OWORD *)v9 - 2) = *((_OWORD *)v7 + 2);
      *((_OWORD *)v9 - 1) = v14;
      *((_OWORD *)v9 - 4) = v16;
      *((_OWORD *)v9 - 3) = v15;
      *(_OWORD *)int v7 = v13;
      *((_OWORD *)v7 + 1) = v12;
      *((_OWORD *)v7 + 2) = v11;
      *((_OWORD *)v7 + 3) = v10;
      v7 -= 64;
      BOOL v17 = v9 >= v7;
      v9 += 64;
    }
    while (!v17);
    int v6 = (unsigned __int8 *)*((void *)this + 54);
    int v5 = (unsigned __int8 *)*((void *)this + 55);
  }
  uint64_t v18 = a3 ^ 1u;
  uint64_t v39 = v18;
  char v41 = 0;
  __int16 v40 = 0;
  if (v6 != v5)
  {
    uint64_t v19 = v6;
    while ((IndicReorderingOutput::DuplicateMarkFinder::operator()(&v39, *v19) & 1) == 0)
    {
      v19 += 64;
      if (v19 == v5) {
        goto LABEL_36;
      }
    }
    if (v19 != v5)
    {
      if (*v19 == 9)
      {
        uint64_t v20 = v19 + 64;
        while (2)
        {
          uint64_t v21 = v20;
          do
          {
            if (v21 == v5)
            {
              uint64_t v39 = v18;
              char v41 = 0;
              __int16 v40 = 0;
              while ((IndicReorderingOutput::DuplicateMarkFinder::operator()(&v39, *v19) & 1) == 0)
              {
                v19 += 64;
                if (v19 == v5) {
                  goto LABEL_30;
                }
              }
              goto LABEL_31;
            }
            int v22 = *(v21 - 64);
            int v24 = *v21;
            v21 += 64;
            int v23 = v24;
          }
          while (v22 != 9 || v23 != 9);
          v19 += 64;
          v20 += 64;
          if (v19 != v5) {
            continue;
          }
          break;
        }
LABEL_30:
        uint64_t v19 = v5;
      }
LABEL_31:
      if (v19 != v5 && *v19 <= 9u)
      {
        a2 = *((void *)v19 + 2);
        do
        {
          v5 -= 64;
          *((void *)this + 55) = v5;
        }
        while (*((void *)v5 - 6) >= a2);
        int v6 = (unsigned __int8 *)*((void *)this + 54);
      }
    }
LABEL_36:
    if (v6 != v5)
    {
      uint64_t v26 = 0;
      char v27 = v6;
      do
      {
        int v28 = *v27;
        if (v28 == 1)
        {
          uint64_t v29 = v6;
          if (v6 != v27)
          {
            uint64_t v30 = v26;
            uint64_t v29 = v6;
            while (1)
            {
              unsigned int v31 = *v29;
              BOOL v8 = v31 > 9;
              int v32 = (1 << v31) & 0x360;
              if (!v8 && v32 != 0) {
                break;
              }
              v29 += 64;
              v30 -= 64;
              if (!v30)
              {
                uint64_t v29 = v27;
                break;
              }
            }
          }
          for (uint64_t i = v27 + 64; i != v5; i += 64)
          {
            unsigned int v35 = *i;
            BOOL v8 = v35 > 9;
            int v36 = (1 << v35) & 0x360;
            if (!v8 && v36 != 0)
            {
              if (v29 != v27 && i != v5)
              {
                a2 = *((void *)i + 2);
                do
                {
                  v5 -= 64;
                  *((void *)this + 55) = v5;
                }
                while (*((void *)v5 - 6) >= a2);
                return a2;
              }
              break;
            }
          }
        }
        else if (v28 == 11)
        {
          if (v27 == v6)
          {
            *int v6 = 0;
          }
          else
          {
            unsigned __int8 *v27 = *(v27 - 64);
            *((_DWORD *)v27 + 1) = *((_DWORD *)v27 - 15);
          }
        }
        v27 += 64;
        v26 += 64;
      }
      while (v27 != v5);
    }
  }
  return a2;
}

uint64_t IndicReorderingOutput::noteVowelModifier(int64x2_t *this, const IndicClassTable *a2, int a3, uint64_t a4, const unsigned int *a5)
{
  uint64_t result = IndicClassTable::getCharClass(a2, a3);
  if ((unsigned __int16)result == 1)
  {
    int v10 = result;
    int v11 = result & 0x700000;
    if ((result & 0x700000) == 0x200000) {
      char v12 = 3;
    }
    else {
      char v12 = 0;
    }
    if (v11 == 3145728) {
      char v13 = 2;
    }
    else {
      char v13 = v12;
    }
    if (v11 == 0x100000) {
      char v14 = 4;
    }
    else {
      char v14 = v13;
    }
    unint64_t v15 = this[27].u64[1];
    unint64_t v16 = this[28].u64[0];
    if (v15 >= v16)
    {
      uint64_t v18 = this[27].i64[0];
      uint64_t v19 = (uint64_t)(v15 - v18) >> 6;
      unint64_t v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 58) {
        abort();
      }
      uint64_t v21 = v16 - v18;
      if (v21 >> 5 > v20) {
        unint64_t v20 = v21 >> 5;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v22 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v20;
      }
      int v36 = &this[28].i8[8];
      if (v22) {
        int v23 = TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>::allocate((uint64_t)&this[28].i64[1], v22);
      }
      else {
        int v23 = 0;
      }
      int v24 = &v23[64 * v19];
      *int v24 = v14;
      *((_DWORD *)v24 + 1) = 0;
      *((_DWORD *)v24 + 2) = a3;
      *((void *)v24 + 2) = a4;
      *((void *)v24 + 3) = 0;
      *((void *)v24 + 4) = a5;
      *((_DWORD *)v24 + 10) = v10;
      *((void *)v24 + 6) = -1;
      *((void *)v24 + 7) = -1;
      uint64_t v25 = this[27].i64[0];
      unint64_t v26 = this[27].u64[1];
      if (v26 == v25)
      {
        int64x2_t v31 = vdupq_n_s64(v26);
        char v27 = &v23[64 * v19];
      }
      else
      {
        char v27 = &v23[64 * v19];
        do
        {
          long long v28 = *(_OWORD *)(v26 - 64);
          long long v29 = *(_OWORD *)(v26 - 48);
          long long v30 = *(_OWORD *)(v26 - 16);
          *((_OWORD *)v27 - 2) = *(_OWORD *)(v26 - 32);
          *((_OWORD *)v27 - 1) = v30;
          *((_OWORD *)v27 - 4) = v28;
          *((_OWORD *)v27 - 3) = v29;
          v27 -= 64;
          v26 -= 64;
        }
        while (v26 != v25);
        int64x2_t v31 = this[27];
      }
      BOOL v17 = v24 + 64;
      this[27].i64[0] = (uint64_t)v27;
      this[27].i64[1] = (uint64_t)(v24 + 64);
      int64x2_t v34 = v31;
      uint64_t v32 = this[28].i64[0];
      this[28].i64[0] = (uint64_t)&v23[64 * v22];
      uint64_t v35 = v32;
      uint64_t v33 = v31.i64[0];
      uint64_t result = std::__split_buffer<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul> &>::~__split_buffer((uint64_t)&v33);
    }
    else
    {
      *(unsigned char *)unint64_t v15 = v14;
      *(_DWORD *)(v15 + 4) = 0;
      *(_DWORD *)(v15 + 8) = a3;
      *(void *)(v15 + 16) = a4;
      *(void *)(v15 + 24) = 0;
      *(void *)(v15 + 32) = a5;
      *(_DWORD *)(v15 + 40) = result;
      BOOL v17 = (char *)(v15 + 64);
      *(void *)(v15 + 48) = -1;
      *(void *)(v15 + 56) = -1;
    }
    this[27].i64[1] = (uint64_t)v17;
  }
  return result;
}

uint64_t IndicReorderingOutput::noteSyllableModifier(int64x2_t *this, const IndicClassTable *a2, int a3, uint64_t a4, const unsigned int *a5)
{
  uint64_t result = IndicClassTable::getCharClass(a2, a3);
  if ((result & 0xFFFE) == 0xC)
  {
    int v10 = result;
    if ((result & 0x700000) == 0x300000) {
      char v11 = 7;
    }
    else {
      char v11 = 0;
    }
    if (a3 == 2817) {
      int v12 = 2;
    }
    else {
      int v12 = 5;
    }
    unint64_t v13 = this[27].u64[1];
    unint64_t v14 = this[28].u64[0];
    if (v13 >= v14)
    {
      uint64_t v16 = this[27].i64[0];
      uint64_t v17 = (uint64_t)(v13 - v16) >> 6;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 58) {
        abort();
      }
      uint64_t v19 = v14 - v16;
      if (v19 >> 5 > v18) {
        unint64_t v18 = v19 >> 5;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFC0) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      int64x2_t v34 = &this[28].i8[8];
      if (v20) {
        uint64_t v21 = TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>::allocate((uint64_t)&this[28].i64[1], v20);
      }
      else {
        uint64_t v21 = 0;
      }
      unint64_t v22 = &v21[64 * v17];
      *unint64_t v22 = v11;
      *((_DWORD *)v22 + 1) = v12;
      *((_DWORD *)v22 + 2) = a3;
      *((void *)v22 + 2) = a4;
      *((void *)v22 + 3) = 0;
      *((void *)v22 + 4) = a5;
      *((_DWORD *)v22 + 10) = v10;
      *((void *)v22 + 6) = -1;
      *((void *)v22 + 7) = -1;
      uint64_t v23 = this[27].i64[0];
      unint64_t v24 = this[27].u64[1];
      if (v24 == v23)
      {
        int64x2_t v29 = vdupq_n_s64(v24);
        uint64_t v25 = &v21[64 * v17];
      }
      else
      {
        uint64_t v25 = &v21[64 * v17];
        do
        {
          long long v26 = *(_OWORD *)(v24 - 64);
          long long v27 = *(_OWORD *)(v24 - 48);
          long long v28 = *(_OWORD *)(v24 - 16);
          *((_OWORD *)v25 - 2) = *(_OWORD *)(v24 - 32);
          *((_OWORD *)v25 - 1) = v28;
          *((_OWORD *)v25 - 4) = v26;
          *((_OWORD *)v25 - 3) = v27;
          v25 -= 64;
          v24 -= 64;
        }
        while (v24 != v23);
        int64x2_t v29 = this[27];
      }
      unint64_t v15 = v22 + 64;
      this[27].i64[0] = (uint64_t)v25;
      this[27].i64[1] = (uint64_t)(v22 + 64);
      int64x2_t v32 = v29;
      uint64_t v30 = this[28].i64[0];
      this[28].i64[0] = (uint64_t)&v21[64 * v20];
      uint64_t v33 = v30;
      uint64_t v31 = v29.i64[0];
      uint64_t result = std::__split_buffer<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul> &>::~__split_buffer((uint64_t)&v31);
    }
    else
    {
      *(unsigned char *)unint64_t v13 = v11;
      *(_DWORD *)(v13 + 4) = v12;
      *(_DWORD *)(v13 + 8) = a3;
      *(void *)(v13 + 16) = a4;
      *(void *)(v13 + 24) = 0;
      *(void *)(v13 + 32) = a5;
      *(_DWORD *)(v13 + 40) = result;
      unint64_t v15 = (char *)(v13 + 64);
      *(void *)(v13 + 48) = -1;
      *(void *)(v13 + 56) = -1;
    }
    this[27].i64[1] = (uint64_t)v15;
  }
  return result;
}

char **IndicReorderingOutput::noteBaseConsonant(char **this, int a2)
{
  unint64_t v2 = this;
  uint64_t v3 = (this[8] - this[7]) >> 2;
  this[122] = (char *)v3;
  if (a2)
  {
    int v4 = (unsigned __int8 *)this[54];
    int v5 = (unsigned __int8 *)this[55];
    LOBYTE(v6[0]) = 5;
    *(_WORD *)((char *)v6 + 1) = -21846;
    BYTE3(v6[0]) = -86;
    HIDWORD(v6[0]) = 0;
    v6[1] = (char *)v3;
    v6[2] = (char *)this;
    while (v4 != v5)
    {
      this = IndicReorderingOutput::TargetNoter::operator()(v6, v4);
      v4 += 64;
    }
  }
  else
  {
    this = IndicReorderingOutput::noteMpreTarget(this);
    if (*((_WORD *)v2 + 500)) {
      v2[129] = (char *)((v2[8] - v2[7]) >> 2);
    }
  }
  return this;
}

char **IndicReorderingOutput::noteMpreTarget(char **this)
{
  uint64_t v1 = (this[8] - this[7]) >> 2;
  unint64_t v2 = (unsigned __int8 *)this[54];
  uint64_t v3 = (unsigned __int8 *)this[55];
  LOBYTE(v4[0]) = 5;
  *(_WORD *)((char *)v4 + 1) = -21846;
  BYTE3(v4[0]) = -86;
  HIDWORD(v4[0]) = 0;
  v4[1] = (char *)v1;
  v4[2] = (char *)this;
  while (v2 != v3)
  {
    this = IndicReorderingOutput::TargetNoter::operator()(v4, v2);
    v2 += 64;
  }
  return this;
}

char **IndicReorderingOutput::writeRephFixup(char **this)
{
  if (*((_WORD *)this + 524))
  {
    uint64_t v1 = (uint64_t)this[134];
    if ((v1 & 0x8000000000000000) == 0)
    {
      if (*((_WORD *)this + 529)) {
        uint64_t v2 = 3;
      }
      else {
        uint64_t v2 = 2;
      }
      return PostGSUBFixups::add((char **)this[124], v1, (uint64_t)this[123], v2, 0);
    }
  }
  return this;
}

uint64_t IndicReorderingOutput::MarkWriter::operator()(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = *((_DWORD *)a1 + 1);
  if (*a1)
  {
    if (v4) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = *a2 == *a1;
    }
    if (!v5 || *((_DWORD *)a2 + 1) != 0) {
      return 0;
    }
  }
  else
  {
    if (v4) {
      BOOL v8 = *((_DWORD *)a2 + 1) == v4;
    }
    else {
      BOOL v8 = 0;
    }
    if (!v8) {
      return 0;
    }
  }
  uint64_t v9 = *((void *)a2 + 7);
  uint64_t v10 = *((void *)a1 + 1);
  uint64_t v11 = (uint64_t)(*(void *)(v10 + 64) - *(void *)(v10 + 56)) >> 2;
  if (v9 < 0)
  {
    *((void *)a2 + 6) = v11;
  }
  else
  {
    PostGSUBFixups::add(*(char ***)(v10 + 992), v9, v11, 1, 0);
    uint64_t v10 = *((void *)a1 + 1);
  }
  OpenTypeReorderingOutput::writeChar((OpenTypeReorderingOutput *)v10, *((_DWORD *)a2 + 2), *((void *)a2 + 2), *((const unsigned int **)a2 + 4), *((_DWORD *)a2 + 10), *((void *)a2 + 3));
  return 1;
}

uint64_t IndicReorderingOutput::writeMpre(IndicReorderingOutput *this)
{
  v5[0] = 2863311365;
  v5[1] = this;
  uint64_t v1 = (unsigned __int8 *)*((void *)this + 54);
  uint64_t v2 = (unsigned __int8 *)*((void *)this + 55);
  if (v1 == v2)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    int v3 = 0;
    do
    {
      v3 |= IndicReorderingOutput::MarkWriter::operator()((unsigned __int8 *)v5, v1);
      v1 += 64;
    }
    while (v1 != v2);
  }
  return v3 & 1;
}

uint64_t IndicReorderingOutput::writeMabove(unsigned __int8 **this)
{
  std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(this[54], this[55], 6, (uint64_t)this);
  uint64_t v2 = this[54];
  int v3 = this[55];

  return std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(v2, v3, 7, (uint64_t)this);
}

uint64_t std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  v7[0] = a3;
  v7[1] = a4;
  if (a1 != a2)
  {
    BOOL v5 = a1;
    do
    {
      IndicReorderingOutput::MarkWriter::operator()((unsigned __int8 *)v7, v5);
      v5 += 64;
    }
    while (v5 != a2);
    return v7[0];
  }
  return a3;
}

uint64_t IndicReorderingOutput::writeMpost(unsigned __int8 **this)
{
  std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(this[54], this[55], 0x200000000, (uint64_t)this);
  std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(this[54], this[55], 0x300000000, (uint64_t)this);
  uint64_t v2 = this[54];
  int v3 = this[55];

  return std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(v2, v3, 0x400000000, (uint64_t)this);
}

uint64_t IndicReorderingOutput::writeVMpost(unsigned __int8 **this)
{
  std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(this[54], this[55], 2863311364, (uint64_t)this);
  uint64_t v2 = this[54];
  int v3 = this[55];

  return std::for_each[abi:nn180100]<std::__wrap_iter<IndicReorderingOutput::MarkInfo *>,IndicReorderingOutput::MarkWriter>(v2, v3, 0x500000000, (uint64_t)this);
}

void IndicReorderingOutput::writePreBaseConsonant(IndicReorderingOutput *this)
{
  int v1 = *((unsigned __int16 *)this + 500);
  if (*((_WORD *)this + 500))
  {
    uint64_t v3 = *((void *)this + 129);
    if (v3 < 0)
    {
      if ((*((void *)this + 122) & 0x8000000000000000) == 0)
      {
        PostGSUBFixups::add(*((char ***)this + 124), *((void *)this + 122), (uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 2, 2, 0x20000000);
        int v1 = *((unsigned __int16 *)this + 500);
      }
      OpenTypeReorderingOutput::writeChar(this, v1, *((void *)this + 127), *((const unsigned int **)this + 130), *((_DWORD *)this + 251), *((void *)this + 128));
      int v4 = *((unsigned __int16 *)this + 504);
      uint64_t v5 = *((void *)this + 127) - 1;
      int v6 = (const unsigned int *)*((void *)this + 130);
      uint64_t v9 = this;
      int v7 = 7;
      uint64_t v8 = 0;
    }
    else
    {
      PostGSUBFixups::add(*((char ***)this + 124), v3, (uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 2, 2, 0x10000000);
      OpenTypeReorderingOutput::writeChar(this, *((unsigned __int16 *)this + 504), *((void *)this + 127) - 1, *((const unsigned int **)this + 130), 7, 0);
      int v4 = *((unsigned __int16 *)this + 500);
      uint64_t v5 = *((void *)this + 127);
      int v6 = (const unsigned int *)*((void *)this + 130);
      int v7 = *((_DWORD *)this + 251);
      uint64_t v8 = *((void *)this + 128);
      uint64_t v9 = this;
    }
    OpenTypeReorderingOutput::writeChar(v9, v4, v5, v6, v7, v8);
  }
}

void IndicReorderingOutput::writeReph(IndicReorderingOutput *this)
{
  int v1 = *((unsigned __int16 *)this + 524);
  if (*((_WORD *)this + 524))
  {
    *((void *)this + 123) = (uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 2;
    OpenTypeReorderingOutput::writeChar(this, v1, *((void *)this + 133), *((const unsigned int **)this + 135), *((_DWORD *)this + 263), 0);
    OpenTypeReorderingOutput::writeChar(this, *((unsigned __int16 *)this + 528), *((void *)this + 133) + 1, *((const unsigned int **)this + 135), 7, 0);
    int v3 = *((unsigned __int16 *)this + 529);
    if (*((_WORD *)this + 529))
    {
      uint64_t v4 = *((void *)this + 133) + 2;
      uint64_t v5 = (const unsigned int *)*((void *)this + 135);
      int v6 = *((_DWORD *)this + 265);
      OpenTypeReorderingOutput::writeChar(this, v3, v4, v5, v6, 0);
    }
  }
}

void IndicReorderingOutput::~IndicReorderingOutput(IndicReorderingOutput *this)
{
  *(void *)this = &unk_1ED05EB08;
  std::vector<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>>::__destroy_vector::operator()[abi:nn180100]((uint64_t)this + 432);

  OpenTypeReorderingOutput::~OpenTypeReorderingOutput(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_1ED05EB08;
  std::vector<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>>::__destroy_vector::operator()[abi:nn180100]((uint64_t)this + 432);
  OpenTypeReorderingOutput::~OpenTypeReorderingOutput(this);

  JUMPOUT(0x1853275C0);
}

char *TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>::allocate(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (char *)(a1 + 512);
  uint64_t result = *(char **)(a1 + 512);
  uint64_t v4 = &result[64 * a2];
  if (v4 <= v2)
  {
    *(void *)uint64_t v2 = v4;
  }
  else
  {
    if (a2 >> 58) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    return (char *)operator new(a2 << 6);
  }
  return result;
}

uint64_t std::__split_buffer<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul> &>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 63) & 0xFFFFFFFFFFFFFFC0);
  }
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1)
  {
    unint64_t v5 = *(void *)(a1 + 32);
    int v6 = (void *)(v5 + 512);
    if (v5 <= (unint64_t)v4 && v6 > v4)
    {
      if (*(void *)(a1 + 24) == *v6) {
        *int v6 = v4;
      }
    }
    else
    {
      operator delete(v4);
    }
  }
  return a1;
}

uint64_t IndicReorderingOutput::DuplicateMarkFinder::operator()(unsigned char *a1, unsigned __int8 a2)
{
  uint64_t v2 = 0;
  if (a2 && a2 != 11)
  {
    if (*a1 && (a2 - 5) < 5u && ((0x1Bu >> (a2 - 5)) & 1) != 0) {
      return 0;
    }
    uint64_t v3 = &a1[a2];
    int v5 = v3[1];
    uint64_t v4 = v3 + 1;
    if (!v5)
    {
      if (a2 > 9u || ((1 << a2) & 0x360) == 0 || a2 > 8u)
      {
LABEL_18:
        uint64_t v2 = 0;
        *uint64_t v4 = 1;
        return v2;
      }
      uint64_t v6 = a2 + 2;
      while (1)
      {
        unsigned int v7 = (v6 - 1);
        BOOL v8 = v7 > 9;
        int v9 = (1 << v7) & 0x360;
        BOOL v10 = v8 || v9 == 0;
        if (!v10 && a1[v6]) {
          break;
        }
        if (++v6 == 11) {
          goto LABEL_18;
        }
      }
    }
    return 1;
  }
  return v2;
}

char **IndicReorderingOutput::TargetNoter::operator()(char **result, unsigned __int8 *a2)
{
  int v2 = *((_DWORD *)result + 1);
  if (*(unsigned char *)result)
  {
    if (v2) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = *a2 == *(unsigned __int8 *)result;
    }
    if (!v3 || *((_DWORD *)a2 + 1) != 0) {
      return result;
    }
LABEL_15:
    uint64_t v6 = *((void *)a2 + 6);
    if ((v6 & 0x8000000000000000) == 0) {
      return PostGSUBFixups::add(*((char ***)result[2] + 124), (uint64_t)result[1], v6, 1, 0);
    }
    *((void *)a2 + 7) = result[1];
    return result;
  }
  if (v2) {
    BOOL v5 = *((_DWORD *)a2 + 1) == v2;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    goto LABEL_15;
  }
  return result;
}

void std::vector<IndicReorderingOutput::MarkInfo,TInlineBufferAllocator<IndicReorderingOutput::MarkInfo,8ul>>::__destroy_vector::operator()[abi:nn180100](uint64_t a1)
{
  int v2 = *(void **)a1;
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    BOOL v3 = (void *)(a1 + 536);
    if (a1 + 24 <= (unint64_t)v2)
    {
      BOOL v4 = v3 >= v2;
      BOOL v5 = v3 == v2;
    }
    else
    {
      BOOL v4 = 0;
      BOOL v5 = 0;
    }
    if (!v5 && v4)
    {
      if (*(void *)(a1 + 16) == *(void *)(a1 + 536)) {
        *BOOL v3 = v2;
      }
    }
    else
    {
      operator delete(v2);
    }
  }
}

uint64_t *DevanagariShapingEngine::GetStaticClassTable(DevanagariShapingEngine *this)
{
  {
    qword_1E8F8ADE8 = 0x111A0FFF097F0900;
    unk_1E8F8ADF0 = &devaCharClasses;
    DevanagariShapingEngine::GetStaticClassTable(void)::devaClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8ADF8 = 2381;
    qword_1E8F8AE00 = 0;
    dword_1E8F8AE08 = -1459640096;
    qword_1E8F8AE10 = (uint64_t)&DevanagariShapingEngine::GetStaticClassTable(void)::devaClassTable;
    unk_1E8F8AE18 = &devaExtendedCharClasses;
    qword_1E8F8AE20 = 0;
    unk_1E8F8AE28 = 0;
    byte_1E8F8AE30 = 1;
  }
  return &DevanagariShapingEngine::GetStaticClassTable(void)::devaClassTable;
}

void DevanagariShapingEngine::~DevanagariShapingEngine(DevanagariShapingEngine *this)
{
  *(void *)this = &unk_1ED05E6F0;
  int v2 = (void **)((char *)this + 520);
  BOOL v4 = (void **)((char *)this + 808);
  std::vector<PostGSUBFixups::Adjustment,TInlineBufferAllocator<PostGSUBFixups::Adjustment,2ul>>::__destroy_vector::operator()[abi:nn180100](&v4);
  BOOL v4 = v2;
  std::vector<PostGSUBFixups::FixupData,TInlineBufferAllocator<PostGSUBFixups::FixupData,8ul>>::__destroy_vector::operator()[abi:nn180100](&v4);
  uint64_t v3 = *((void *)this + 63);
  *((void *)this + 63) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  OpenTypeShapingEngine::~OpenTypeShapingEngine(this);
}

{
  uint64_t vars8;

  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

uint64_t *GujaratiShapingEngine::GetStaticClassTable(GujaratiShapingEngine *this)
{
  {
    qword_1E8F8ACF0 = 0x1150FFF0AFF0A80;
    unk_1E8F8ACF8 = &gujrCharClasses;
    GujaratiShapingEngine::GetStaticClassTable(void)::gujrClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8AD00 = 2765;
    qword_1E8F8AD08 = 0;
    dword_1E8F8AD10 = 0;
    qword_1E8F8AD18 = (uint64_t)&GujaratiShapingEngine::GetStaticClassTable(void)::gujrClassTable;
    unk_1E8F8AD20 = 0;
    qword_1E8F8AD28 = 0;
    unk_1E8F8AD30 = 0;
    byte_1E8F8AD38 = 1;
  }
  return &GujaratiShapingEngine::GetStaticClassTable(void)::gujrClassTable;
}

void GujaratiShapingEngine::~GujaratiShapingEngine(GujaratiShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

uint64_t *GurmukhiShapingEngine::GetStaticClassTable(GurmukhiShapingEngine *this)
{
  {
    qword_1E8F8AB48 = 0x43050FFF0A760A00;
    unk_1E8F8AB50 = &guruCharClasses;
    GurmukhiShapingEngine::GetStaticClassTable(void)::guruClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8AB58 = 2637;
    qword_1E8F8AB60 = 0;
    dword_1E8F8AB68 = 0;
    qword_1E8F8AB70 = (uint64_t)&GurmukhiShapingEngine::GetStaticClassTable(void)::guruClassTable;
    unk_1E8F8AB78 = 0;
    qword_1E8F8AB80 = 0;
    unk_1E8F8AB88 = 0;
    byte_1E8F8AB90 = 1;
  }
  return &GurmukhiShapingEngine::GetStaticClassTable(void)::guruClassTable;
}

void GurmukhiShapingEngine::~GurmukhiShapingEngine(GurmukhiShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

uint64_t *BengaliShapingEngine::GetStaticClassTable(BengaliShapingEngine *this)
{
  {
    qword_1E8F8AD80 = 0x22090FFF09FF0980;
    unk_1E8F8AD88 = &bengCharClasses;
    BengaliShapingEngine::GetStaticClassTable(void)::bengClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8AD90 = 2509;
    qword_1E8F8AD98 = (uint64_t)&bengSplitTable;
    dword_1E8F8ADA0 = 0;
    qword_1E8F8ADA8 = (uint64_t)&BengaliShapingEngine::GetStaticClassTable(void)::bengClassTable;
    unk_1E8F8ADB0 = 0;
    qword_1E8F8ADB8 = 0;
    unk_1E8F8ADC0 = 0;
    byte_1E8F8ADC8 = 1;
  }
  return &BengaliShapingEngine::GetStaticClassTable(void)::bengClassTable;
}

void BengaliShapingEngine::~BengaliShapingEngine(BengaliShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

uint64_t KannadaClassTable::getReorderClassInternal(KannadaClassTable *this, int a2)
{
  if ((a2 - 3262) > 0x18) {
    return 0;
  }
  int v2 = 1 << (a2 + 66);
  if ((v2 & 0x1800060) != 0) {
    return 3;
  }
  if ((v2 & 0x19) != 0) {
    return 2;
  }
  else {
    return 0;
  }
}

uint64_t *KannadaShapingEngine::GetStaticClassTable(KannadaShapingEngine *this)
{
  {
    qword_1E8F8AC30 = 0x842B10030CF20C80;
    unk_1E8F8AC38 = &kndaCharClasses;
    word_1E8F8AC40 = 3277;
    qword_1E8F8AC48 = (uint64_t)&kndaSplitTable;
    dword_1E8F8AC50 = 0;
    qword_1E8F8AC58 = (uint64_t)&KannadaShapingEngine::GetStaticClassTable(void)::kndaClassTable;
    unk_1E8F8AC60 = 0;
    qword_1E8F8AC68 = 0;
    unk_1E8F8AC70 = 0;
    byte_1E8F8AC78 = 1;
    KannadaShapingEngine::GetStaticClassTable(void)::kndaClassTable = (uint64_t)&unk_1ED05E648;
  }
  return &KannadaShapingEngine::GetStaticClassTable(void)::kndaClassTable;
}

void KannadaShapingEngine::~KannadaShapingEngine(KannadaShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

void KannadaClassTable::~KannadaClassTable(id *this)
{
  *this = &unk_1ED05E460;
}

{
  uint64_t vars8;

  *this = &unk_1ED05E460;

  JUMPOUT(0x1853275C0);
}

uint64_t *OriyaShapingEngine::GetStaticClassTable(OriyaShapingEngine *this)
{
  {
    qword_1E8F8AAE0 = 0x23390FFF0B770B00;
    unk_1E8F8AAE8 = &oryaCharClasses;
    OriyaShapingEngine::GetStaticClassTable(void)::oryaClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8AAF0 = 2893;
    qword_1E8F8AAF8 = (uint64_t)"G\vV\v";
    dword_1E8F8AB00 = 0;
    qword_1E8F8AB08 = (uint64_t)&OriyaShapingEngine::GetStaticClassTable(void)::oryaClassTable;
    unk_1E8F8AB10 = 0;
    qword_1E8F8AB18 = 0;
    unk_1E8F8AB20 = 0;
    byte_1E8F8AB28 = 1;
  }
  return &OriyaShapingEngine::GetStaticClassTable(void)::oryaClassTable;
}

void OriyaShapingEngine::~OriyaShapingEngine(OriyaShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

uint64_t TeluguClassTable::getReorderClassInternal(TeluguClassTable *this, int a2)
{
  if ((a2 - 3137) > 0x15) {
    return 0;
  }
  int v2 = 1 << (a2 - 65);
  if ((v2 & 0x200003) != 0) {
    return 2;
  }
  if ((v2 & 0xC) != 0) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t *TeluguShapingEngine::GetStaticClassTable(TeluguShapingEngine *this)
{
  {
    qword_1E8F8ABD8 = 0x802B30030C7F0C00;
    unk_1E8F8ABE0 = &teluCharClasses;
    word_1E8F8ABE8 = 3149;
    qword_1E8F8ABF0 = (uint64_t)&teluSplitTable;
    dword_1E8F8ABF8 = 0;
    qword_1E8F8AC00 = (uint64_t)&TeluguShapingEngine::GetStaticClassTable(void)::teluClassTable;
    unk_1E8F8AC08 = 0;
    qword_1E8F8AC10 = 0;
    unk_1E8F8AC18 = 0;
    byte_1E8F8AC20 = 1;
    TeluguShapingEngine::GetStaticClassTable(void)::teluClassTable = (uint64_t)&unk_1ED05E620;
  }
  return &TeluguShapingEngine::GetStaticClassTable(void)::teluClassTable;
}

void TeluguShapingEngine::~TeluguShapingEngine(TeluguShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

void TeluguClassTable::~TeluguClassTable(id *this)
{
  *this = &unk_1ED05E460;
}

{
  uint64_t vars8;

  *this = &unk_1ED05E460;

  JUMPOUT(0x1853275C0);
}

uint64_t *MalayalamShapingEngine::GetStaticClassTable(MalayalamShapingEngine *this)
{
  {
    qword_1E8F8AEC0 = 0x4B094FFF0D7F0D00;
    unk_1E8F8AEC8 = &mlymCharClasses;
    MalayalamShapingEngine::GetStaticClassTable(void)::mlymClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8AED0 = 3405;
    qword_1E8F8AED8 = (uint64_t)"F\r>\r";
    dword_1E8F8AEE0 = 0;
    qword_1E8F8AEE8 = (uint64_t)&MalayalamShapingEngine::GetStaticClassTable(void)::mlymClassTable;
    unk_1E8F8AEF0 = 0;
    qword_1E8F8AEF8 = 0;
    unk_1E8F8AF00 = 0;
    byte_1E8F8AF08 = 1;
  }
  return &MalayalamShapingEngine::GetStaticClassTable(void)::mlymClassTable;
}

void MalayalamShapingEngine::~MalayalamShapingEngine(MalayalamShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

uint64_t *TamilShapingEngine::GetStaticClassTable(TamilShapingEngine *this)
{
  {
    qword_1E8F8AC98 = 0x8154FFF0BFA0B80;
    unk_1E8F8ACA0 = &tamlCharClasses;
    TamilShapingEngine::GetStaticClassTable(void)::tamlClassTable = (uint64_t)&unk_1ED05E460;
    word_1E8F8ACA8 = 3021;
    qword_1E8F8ACB0 = (uint64_t)&tamlSplitTable;
    dword_1E8F8ACB8 = 0;
    qword_1E8F8ACC0 = (uint64_t)&TamilShapingEngine::GetStaticClassTable(void)::tamlClassTable;
    unk_1E8F8ACC8 = 0;
    qword_1E8F8ACD0 = 0;
    unk_1E8F8ACD8 = 0;
    byte_1E8F8ACE0 = 1;
  }
  return &TamilShapingEngine::GetStaticClassTable(void)::tamlClassTable;
}

void TamilShapingEngine::~TamilShapingEngine(TamilShapingEngine *this)
{
  DevanagariShapingEngine::~DevanagariShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

void *__CTEmojiImageSourceCopyImageStrikes(CGImageSource *a1)
{
  size_t Count = CGImageSourceGetCount(a1);
  uint64_t v25 = objc_opt_new();
  if (Count)
  {
    size_t v2 = 0;
    uint64_t v22 = *MEMORY[0x1E4F2FB80];
    uint64_t v23 = *MEMORY[0x1E4F2FD40];
    uint64_t v21 = *MEMORY[0x1E4F2FDA0];
    uint64_t v3 = *MEMORY[0x1E4F2FDB0];
    BOOL v4 = (double *)MEMORY[0x1E4F1DB30];
    do
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, v2, 0);
      CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(a1, v2, 0);
      unsigned int v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:v23];
      BOOL v8 = [(__CFDictionary *)v6 objectForKeyedSubscript:v22];
      int v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [MEMORY[0x1E4F1C9E8] dictionary];
      }
      uint64_t v11 = v10;

      double v12 = *v4;
      double v13 = v4[1];
      unint64_t v14 = [v7 objectForKeyedSubscript:v21];
      unint64_t v15 = v14;
      if (v14)
      {
        [v14 doubleValue];
        double v12 = v16;
      }
      uint64_t v17 = [v7 objectForKeyedSubscript:v3];

      if (v17)
      {
        [v17 doubleValue];
        double v13 = v18;
      }
      uint64_t v19 = -[CTEmojiImageStrike initWithImage:alignmentInset:provenanceInfo:]([CTEmojiImageStrike alloc], "initWithImage:alignmentInset:provenanceInfo:", ImageAtIndex, v11, v12, v13);
      [v25 addObject:v19];
      CGImageRelease(ImageAtIndex);

      ++v2;
    }
    while (Count != v2);
  }
  return v25;
}

uint64_t __CTEmojiImageSourceGetImageIndex(CGImageSource *a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  size_t Count = CGImageSourceGetCount(a1);
  if (!Count)
  {
    CFDictionaryRef v16 = 0;
    goto LABEL_24;
  }
  size_t v13 = Count;
  *(void *)&long long v42 = a2;
  *((void *)&v42 + 1) = a3;
  size_t v14 = 0;
  uint64_t v15 = 0;
  CFDictionaryRef v16 = 0;
  double v17 = ceil(a5 * a6);
  uint64_t v18 = *MEMORY[0x1E4F2FCE8];
  uint64_t v43 = *MEMORY[0x1E4F2FD00];
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  double v20 = 0.0;
  double v21 = 0.0;
  do
  {
    CFDictionaryRef v22 = CGImageSourceCopyPropertiesAtIndex(a1, v14, 0);
    uint64_t v23 = [(__CFDictionary *)v22 objectForKeyedSubscript:v18];
    unint64_t v24 = v23;
    if (!v23) {
      goto LABEL_14;
    }
    [v23 doubleValue];
    double v26 = v25;
    if (v25 < v17)
    {
      if (v21 == 0.0)
      {
        uint64_t v27 = v15;
      }
      else
      {
        uint64_t v27 = v15;
        if (v15 & 1 | (v25 <= v21)) {
          goto LABEL_14;
        }
      }
LABEL_13:
      long long v28 = -[__CFDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v43, (void)v42);
      [v28 doubleValue];
      double v20 = v29;

      CFDictionaryRef v30 = v22;
      uint64_t v19 = v14;
      CFDictionaryRef v16 = v30;
      double v21 = v26;
      uint64_t v15 = v27;
      goto LABEL_14;
    }
    uint64_t v27 = 1;
    if (v21 == 0.0 || ((v15 ^ 1) & 1) != 0 || v25 < v21) {
      goto LABEL_13;
    }
LABEL_14:

    ++v14;
  }
  while (v13 != v14);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  if (v42 != 0)
  {
    if (v21 <= a5) {
      double v31 = 1.0;
    }
    else {
      double v31 = a5 / v21;
    }
    if ((void)v42)
    {
      if (v20 >= v21)
      {
        if (v21 < v20) {
          a5 = v21 * v31;
        }
      }
      else
      {
        a4 = v20 * v31;
      }
      *(double *)long long v42 = a4;
      *(double *)(v42 + 8) = a5;
    }
    if (*((void *)&v42 + 1))
    {
      uint64_t v33 = [(__CFDictionary *)v16 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];
      double v34 = *MEMORY[0x1E4F1DAD8];
      double v35 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      int v36 = [v33 objectForKeyedSubscript:*MEMORY[0x1E4F2FDA0]];
      uint64_t v37 = v36;
      if (v36)
      {
        [v36 doubleValue];
        double v34 = floor(v38 * v31 + 0.5);
      }
      uint64_t v39 = objc_msgSend(v33, "objectForKeyedSubscript:", *MEMORY[0x1E4F2FDB0], (void)v42);

      if (v39)
      {
        [v39 doubleValue];
        double v35 = -floor(v40 * v31 + 0.5);
      }
      long long v45 = @"__NSEmojiImagePropertyKeyOrigin";
      *(double *)unint64_t v44 = v34;
      *(double *)&v44[1] = v35;
      char v41 = [MEMORY[0x1E4F29238] valueWithBytes:v44 objCType:"{CGPoint=dd}"];
      v46[0] = v41;
      **((void **)&v42 + 1) = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    }
  }
LABEL_25:

  return v19;
}

void TAATKernEngine::KernOrderedList::ProcessGlyphsT<TRunGlue::TGlyph>(uint64_t a1, unsigned char *a2)
{
  if (*(void *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 8);
    BOOL v5 = **(TRunGlue ***)a1;
    uint64_t v6 = TRunGlue::length(v5);
    if (*((void *)v5 + 19))
    {
      TRunGlue::FocusOnIndex(v5, 0);
      unsigned int v7 = (unsigned __int16 *)(*((void *)v5 + 22) - 2 * *((void *)v5 + 20));
    }
    else
    {
      unsigned int v7 = (unsigned __int16 *)(*((void *)v5 + 22) + 2 * *((void *)v5 + 20));
    }
    if (v6 >= 2)
    {
      uint64_t v8 = v4 + 8;
      uint64_t v9 = v4 + 10;
      uint64_t v10 = *v7;
      for (uint64_t i = 1; i != v6; ++i)
      {
        uint64_t GlyphID = TRunGlue::GetGlyphID(v5, i);
        if (GlyphID == 0xFFFF || (uint64_t v13 = GlyphID, TRunGlue::IsDeleted(v5, i)))
        {
          uint64_t v13 = v10;
          goto LABEL_10;
        }
        if (*(unsigned __int16 *)(a1 + 50) >= (unsigned __int16)v10)
        {
          if (*(_WORD *)(*(void *)(a1 + 56) + 2 * (unsigned __int16)v10))
          {
            unsigned int v14 = *(unsigned __int16 *)(a1 + 48);
            if (v14 > (unsigned __int16)(*(_WORD *)(*(void *)(a1 + 56) + 2 * (unsigned __int16)v10) - 1))
            {
              unsigned __int16 v15 = *(_WORD *)(*(void *)(a1 + 56) + 2 * (unsigned __int16)v10) - 1;
              CFDictionaryRef v16 = (unsigned __int16 *)(v9 + 6 * v15);
              do
              {
                unsigned int v17 = bswap32(*(v16 - 1)) >> 16;
                if (v17 == (unsigned __int16)v10)
                {
                  if (v13 <= bswap32(*v16) >> 16) {
                    goto LABEL_22;
                  }
                }
                else if (v17 >= (unsigned __int16)v10)
                {
LABEL_22:
                  unsigned int v18 = v15;
                  uint64_t v19 = (unsigned __int16 *)(v8 + 6 * v15);
                  if ((unsigned __int16)v10 == bswap32(*v19) >> 16 && v13 == bswap32(v19[1]) >> 16)
                  {
                    unsigned int v20 = *(unsigned __int16 *)(v8 + 6 * v18 + 4);
                    if (v20)
                    {
                      TAATKernEngine::HandleKern<TRunGlue::TGlyph>(*(void *)a1, (uint64_t)v5, i, (int)bswap32(v20) >> 16, *(_WORD *)(a1 + 24));
                      *a2 = 1;
                    }
                  }
                  break;
                }
                ++v15;
                v16 += 3;
              }
              while (v14 != v15);
            }
          }
        }
LABEL_10:
        uint64_t v10 = v13;
      }
    }
  }
}

uint64_t std::vector<std::pair<long,TAATDeltaXListEntry>>::erase(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v3 = *(void *)(result + 8);
    if (a3 != v3)
    {
      uint64_t v4 = 16 * ((a3 - a2) >> 4);
      do
      {
        *(void *)a2 = *(void *)(a2 + v4);
        *(_WORD *)(a2 + 8) = *(_WORD *)(a2 + v4 + 8);
        a2 += 16;
      }
      while (a2 + v4 != v3);
    }
    *(void *)(result + 8) = a2;
  }
  return result;
}

void TAATKernEngine::HandleKern<TRunGlue::TGlyph>(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __int16 a5)
{
  int v8 = (int)(*(double *)(a1 + 24) * (double)a4);
  if ((a5 & 0x4000) != 0)
  {
    uint64_t v28 = a3;
    double v29 = &v28;
    double v12 = std::__tree<std::__value_type<long,TAATDeltaYListEntry>,std::__map_value_compare<long,std::__value_type<long,TAATDeltaYListEntry>,std::less<long>,true>,std::allocator<std::__value_type<long,TAATDeltaYListEntry>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t **)(a1 + 56), &v28, (uint64_t)&std::piecewise_construct, &v29);
    if (v8 == -32768)
    {
      LOWORD(v8) = 0;
      *((unsigned char *)v12 + 42) = 1;
    }
    else if ((a5 & 0x800) == 0)
    {
      LOWORD(v8) = *((_WORD *)v12 + 20) + v8;
    }
    *((_WORD *)v12 + 20) = v8;
  }
  else
  {
    if ((a5 & 0x800) != 0)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v9 = a1 + 32;
      if (v10 != v11)
      {
        while (*(void *)v10 != a3)
        {
          v10 += 16;
          if (v10 == v11)
          {
            uint64_t v10 = *(void *)(a1 + 40);
            goto LABEL_18;
          }
        }
        if (v10 != v11)
        {
          for (uint64_t i = v10 + 16; i != v11; i += 16)
          {
            if (*(void *)i != a3)
            {
              *(void *)uint64_t v10 = *(void *)i;
              *(_WORD *)(v10 + 8) = *(_WORD *)(i + 8);
              v10 += 16;
            }
          }
        }
      }
LABEL_18:
      std::vector<std::pair<long,TAATDeltaXListEntry>>::erase(v9, v10, v11);
    }
    unint64_t v14 = *(void *)(a1 + 48);
    unint64_t v15 = *(void *)(a1 + 40);
    if (v15 >= v14)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = (uint64_t)(v15 - v17) >> 4;
      unint64_t v19 = v18 + 1;
      if ((unint64_t)(v18 + 1) >> 60) {
        abort();
      }
      uint64_t v20 = v14 - v17;
      if (v20 >> 3 > v19) {
        unint64_t v19 = v20 >> 3;
      }
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v21 = v19;
      }
      CFDictionaryRef v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CGSize>>(a1 + 48, v21);
      uint64_t v23 = &v22[16 * v18];
      double v25 = &v22[16 * v24];
      *(void *)uint64_t v23 = a3;
      *((_WORD *)v23 + 4) = v8;
      CFDictionaryRef v16 = v23 + 16;
      uint64_t v27 = *(char **)(a1 + 32);
      double v26 = *(char **)(a1 + 40);
      if (v26 != v27)
      {
        do
        {
          *((_OWORD *)v23 - 1) = *((_OWORD *)v26 - 1);
          v23 -= 16;
          v26 -= 16;
        }
        while (v26 != v27);
        double v26 = *(char **)(a1 + 32);
      }
      *(void *)(a1 + 32) = v23;
      *(void *)(a1 + 40) = v16;
      *(void *)(a1 + 48) = v25;
      if (v26) {
        operator delete(v26);
      }
    }
    else
    {
      *(void *)unint64_t v15 = a3;
      *(_WORD *)(v15 + 8) = v8;
      CFDictionaryRef v16 = (char *)(v15 + 16);
    }
    *(void *)(a1 + 40) = v16;
  }
}

void TAATControlPointAccess::TAATControlPointAccess(TAATControlPointAccess *this, const TBaseFont *a2)
{
  *(void *)this = 0;
  *((_WORD *)this + 4) = -1;
  *((void *)this + 2) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((void *)this + 133) = (char *)this + 40;
  *((_OWORD *)this + 67) = 0u;
  *((unsigned char *)this + 1088) = 0;
  if (TBaseFont::GetInitializedGraphicsFont(a2))
  {
    uint64_t ParserFont = CGFontGetParserFont();
    *(void *)this = ParserFont;
    if (ParserFont) {
      return;
    }
  }
  else
  {
    *(void *)this = 0;
  }
  id v13 = (id)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(id *__return_ptr, const TBaseFont *, uint64_t))(*(void *)a2 + 480))(&v13, a2, 1751474532);
  CFDataRef v5 = (const __CFData *)(id)atomic_load_explicit((atomic_ullong *volatile)&v13, memory_order_acquire);
  CFDataRef v6 = v5;
  if (v5) {
    BytePtr = CFDataGetBytePtr(v5);
  }
  else {
    BytePtr = 0;
  }

  id v8 = (id)atomic_load_explicit((atomic_ullong *volatile)&v13, memory_order_acquire);
  CFDataRef v9 = (const __CFData *)v8;
  if (v9)
  {
    CFDataRef v10 = v9;
    uint64_t v11 = CFDataGetBytePtr(v9);

    if (v11) {
      v11 += CFDataGetLength((CFDataRef)v8);
    }
  }
  else
  {

    uint64_t v11 = 0;
  }

  if (BytePtr)
  {
    if (BytePtr + 54 <= v11)
    {
      *((unsigned char *)this + 1088) = *((_WORD *)BytePtr + 25) != 0;
      (*(void (**)(id *__return_ptr, const TBaseFont *, uint64_t))(*(void *)a2 + 480))(&v12, a2, 1819239265);

      (*(void (**)(id *__return_ptr, const TBaseFont *, uint64_t))(*(void *)a2 + 480))(&v12, a2, 1735162214);
    }
  }
}

double TAATControlPointAccess::GetControlPointCoordinates(TAATControlPointAccess *this, int a2, unsigned int a3)
{
  if (*(void *)this)
  {
    if (*((unsigned __int16 *)this + 4) != a2)
    {
      uint64_t v6 = *((void *)this + 2);
      unint64_t v7 = (unint64_t)(*((void *)this + 3) - v6) >> 4;
      unsigned int v89 = v7;
      unint64_t v8 = (*((void *)this + 4) - v6) >> 4;
      if (v8 <= 0x40) {
        LODWORD(v8) = 64;
      }
      if (v7 < v8)
      {
        unsigned int v89 = v8;
        std::vector<CGPoint,TInlineBufferAllocator<CGPoint,64ul>>::resize((uint64_t)this + 16, v8);
      }
      if (!FPFontGetControlPoints()) {
        goto LABEL_33;
      }
      uint64_t v9 = *((void *)this + 3) - *((void *)this + 2);
      std::vector<CGPoint,TInlineBufferAllocator<CGPoint,64ul>>::resize((uint64_t)this + 16, v89);
      if (v89 > (unint64_t)(v9 >> 4) && (FPFontGetControlPoints() & 1) == 0) {
        goto LABEL_33;
      }
      *((_WORD *)this + 4) = a2;
    }
    uint64_t v10 = *((void *)this + 2);
    if (a3 < (unint64_t)((*((void *)this + 3) - v10) >> 4))
    {
      uint64_t v11 = (double *)(v10 + 16 * a3);
      return *v11;
    }
LABEL_33:
    uint64_t v11 = (double *)MEMORY[0x1E4F1DAD8];
    return *v11;
  }
  int v12 = *((unsigned __int8 *)this + 1088);
  CFDataRef v13 = (const __CFData *)(id)atomic_load_explicit((atomic_ullong *volatile)this + 134, memory_order_acquire);
  CFDataRef v14 = v13;
  if (!v12)
  {
    if (v13)
    {
      BytePtr = CFDataGetBytePtr(v13);

      if (!BytePtr) {
        goto LABEL_33;
      }
      id v16 = (id)atomic_load_explicit((atomic_ullong *volatile)this + 134, memory_order_acquire);
      CFDataRef v17 = (const __CFData *)v16;
      if (v17)
      {
        CFDataRef v25 = v17;
        double v26 = CFDataGetBytePtr(v17);

        if (v26)
        {
          unint64_t v27 = (unint64_t)&v26[CFDataGetLength((CFDataRef)v16)];

          uint64_t v28 = &BytePtr[2 * a2];
          if ((unint64_t)(v28 + 4) > v27) {
            goto LABEL_33;
          }
          uint64_t v29 = bswap32(*(unsigned __int16 *)v28) >> 16;
          uint64_t v22 = 2 * v29;
          uint64_t v23 = 2 * ((bswap32(*((unsigned __int16 *)v28 + 1)) >> 16) - v29);
          if (!v23) {
            goto LABEL_33;
          }
          goto LABEL_27;
        }
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_29:
    double v34 = 0;
LABEL_32:

    goto LABEL_33;
  }
  if (!v13) {
    goto LABEL_29;
  }
  unint64_t v15 = CFDataGetBytePtr(v13);

  if (!v15) {
    goto LABEL_33;
  }
  id v16 = (id)atomic_load_explicit((atomic_ullong *volatile)this + 134, memory_order_acquire);
  CFDataRef v17 = (const __CFData *)v16;
  if (!v17)
  {
LABEL_30:

    goto LABEL_31;
  }
  CFDataRef v18 = v17;
  unint64_t v19 = CFDataGetBytePtr(v17);

  if (!v19)
  {
LABEL_31:
    double v34 = v16;
    goto LABEL_32;
  }
  unint64_t v20 = (unint64_t)&v19[CFDataGetLength((CFDataRef)v16)];

  unint64_t v21 = (unsigned int *)&v15[4 * a2];
  if ((unint64_t)(v21 + 2) > v20) {
    goto LABEL_33;
  }
  uint64_t v22 = bswap32(*v21);
  uint64_t v23 = bswap32(v21[1]) - v22;
  if (!v23) {
    goto LABEL_33;
  }
LABEL_27:
  CFDictionaryRef v30 = (atomic_ullong *)((char *)this + 1080);
  CFDataRef v31 = (const __CFData *)(id)atomic_load_explicit((atomic_ullong *volatile)this + 135, memory_order_acquire);
  CFDataRef v32 = v31;
  if (v31) {
    uint64_t v33 = CFDataGetBytePtr(v31);
  }
  else {
    uint64_t v33 = 0;
  }

  id v37 = (id)atomic_load_explicit(v30, memory_order_acquire);
  CFDataRef v38 = (const __CFData *)v37;
  if (v38)
  {
    CFDataRef v39 = v38;
    double v40 = CFDataGetBytePtr(v38);

    if (v40) {
      v40 += CFDataGetLength((CFDataRef)v37);
    }
  }
  else
  {

    double v40 = 0;
  }

  if (!v33) {
    goto LABEL_33;
  }
  char v41 = &v33[v22];
  long long v42 = &v33[v22 + v23];
  if (v42 < &v33[v22] || v42 > v40) {
    goto LABEL_33;
  }
  unsigned int v43 = *(unsigned __int16 *)v41;
  int v44 = (int)bswap32(v43) >> 16;
  double v35 = *MEMORY[0x1E4F1DAD8];
  if ((v44 & 0x80000000) == 0)
  {
    unint64_t v45 = (unint64_t)&v41[v23];
    long long v46 = (unsigned __int16 *)(v41 + 10);
    unint64_t v47 = (unint64_t)&v41[2 * (unsigned __int16)v44 + 10];
    unint64_t v48 = v41 + 12 <= &v41[v23] ? (unint64_t)(v23 - 10) >> 1 : 0;
    BOOL v49 = v47 <= v45 && v47 >= (unint64_t)v46;
    if (v49 || v48 == (unsigned __int16)v44)
    {
      if (v43)
      {
        LOWORD(v51) = 0;
        int v52 = 0x10000;
        do
        {
          unsigned int v53 = *v46++;
          unsigned int v54 = bswap32(v53) >> 16;
          if (v54 <= (unsigned __int16)v51) {
            unsigned int v51 = (unsigned __int16)v51;
          }
          else {
            unsigned int v51 = v54;
          }
          BOOL v55 = (unsigned __int16)v44 <= v52 >> 16;
          v52 += 0x10000;
        }
        while (!v55);
        unsigned __int16 v56 = v51 + 1;
        if (((v51 + 1) & 0x10000) != 0) {
          return v35;
        }
      }
      else
      {
        unsigned __int16 v56 = 1;
      }
      unint64_t v57 = (unsigned __int16 *)((char *)v46 + (bswap32(*v46) >> 16));
      uint64_t v58 = operator new(v56);
      bzero(v58, v56);
      BOOL v59 = (__int16 *)operator new(2 * v56);
      bzero(v59, 2 * v56);
      uint64_t v60 = operator new(2 * v56);
      bzero(v60, 2 * v56);
      unint64_t v61 = (unint64_t)&v58[v56];
      uint64_t v62 = v58;
      uint64_t v63 = v57 + 1;
      while (v63 >= v57 + 1 && (unint64_t)v63 + 1 <= v45)
      {
        if ((*(unsigned char *)v63 & 8) != 0)
        {
          if (v62 >= v58)
          {
            LOWORD(v65) = 0;
            unsigned int v66 = *((unsigned __int8 *)v63 + 1);
            while (1)
            {
              v64 = v62 + 1;
              if ((unint64_t)(v62 + 1) > v61) {
                break;
              }
              *uint64_t v62 = *(unsigned char *)v63;
              unsigned int v65 = (unsigned __int16)(v65 + 1);
              ++v62;
              if (v65 > v66)
              {
                ++v63;
                uint64_t v62 = v64;
                goto LABEL_76;
              }
            }
          }
          break;
        }
        *v62++ = *(unsigned char *)v63;
        uint64_t v63 = (unsigned __int16 *)((char *)v63 + 1);
        v64 = v62;
LABEL_76:
        if ((unint64_t)v64 >= v61)
        {
          __int16 v67 = 0;
          long long v68 = v58;
          uint64_t v69 = v56;
          long long v70 = v59;
          long long v71 = v63;
          do
          {
            char v73 = *v68++;
            char v72 = v73;
            if ((v73 & 2) != 0)
            {
              if (v71 < v63 || v71 == (unsigned __int16 *)-1 || (unint64_t)v71 + 1 > v45) {
                goto LABEL_111;
              }
              int v77 = *(unsigned __int8 *)v71;
              long long v71 = (unsigned __int16 *)((char *)v71 + 1);
              int v76 = v77;
              if ((v72 & 0x10) != 0) {
                LOWORD(v75) = v76;
              }
              else {
                unsigned int v75 = -v76;
              }
            }
            else if ((v72 & 0x10) != 0)
            {
              LOWORD(v75) = 0;
            }
            else
            {
              if (v71 < v63 || (unint64_t)v71 > 0xFFFFFFFFFFFFFFFDLL || (unint64_t)(v71 + 1) > v45) {
                goto LABEL_111;
              }
              unsigned int v74 = *v71++;
              unsigned int v75 = bswap32(v74) >> 16;
            }
            v67 += v75;
            *v70++ = v67;
            --v69;
          }
          while (v69);
          if (v71)
          {
            __int16 v78 = 0;
            v79 = v58;
            uint64_t v80 = v56;
            uint64_t v81 = v60;
            CGPoint v82 = v71;
            do
            {
              char v84 = *v79++;
              char v83 = v84;
              if ((v84 & 4) != 0)
              {
                if (v82 < v71 || v82 == (unsigned __int16 *)-1 || (unint64_t)v82 + 1 > v45) {
                  goto LABEL_111;
                }
                int v88 = *(unsigned __int8 *)v82;
                CGPoint v82 = (unsigned __int16 *)((char *)v82 + 1);
                int v87 = v88;
                if ((v83 & 0x20) != 0) {
                  LOWORD(v86) = v87;
                }
                else {
                  unsigned int v86 = -v87;
                }
              }
              else if ((v83 & 0x20) != 0)
              {
                LOWORD(v86) = 0;
              }
              else
              {
                if (v82 < v71 || (unint64_t)v82 > 0xFFFFFFFFFFFFFFFDLL || (unint64_t)(v82 + 1) > v45) {
                  goto LABEL_111;
                }
                unsigned int v85 = *v82++;
                unsigned int v86 = bswap32(v85) >> 16;
              }
              v78 += v86;
              *v81++ = v78;
              --v80;
            }
            while (v80);
            if (v56 > a3 && v82) {
              double v35 = (double)v59[a3];
            }
          }
          break;
        }
      }
LABEL_111:
      operator delete(v60);
      operator delete(v59);
      operator delete(v58);
    }
  }
  return v35;
}

void std::vector<CGPoint,TInlineBufferAllocator<CGPoint,64ul>>::resize(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(unint64_t **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = (v4 - *(void *)a1) >> 4;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    CFDataRef v14 = &v3[2 * a2];
    goto LABEL_15;
  }
  unint64_t v6 = a2 - v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (a2 - v5 <= (v7 - v4) >> 4)
  {
    bzero(*(void **)(a1 + 8), 16 * v6);
    CFDataRef v14 = (unint64_t *)(v4 + 16 * v6);
LABEL_15:
    *(void *)(a1 + 8) = v14;
    return;
  }
  if (a2 >> 60) {
    abort();
  }
  uint64_t v8 = v7 - (void)v3;
  uint64_t v9 = v8 >> 3;
  if (v8 >> 3 <= a2) {
    uint64_t v9 = a2;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0) {
    unint64_t v10 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v11 = (unint64_t *)(a1 + 1048);
  int v12 = *(char **)(a1 + 1048);
  unint64_t v13 = (unint64_t)&v12[16 * v10];
  if (v13 <= a1 + 1048)
  {
    unint64_t *v11 = v13;
  }
  else
  {
    if (v10 >> 60) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    int v12 = (char *)operator new(16 * v10);
  }
  unint64_t v15 = &v12[16 * v5];
  id v16 = &v12[16 * v10];
  bzero(v15, 16 * v6);
  CFDataRef v17 = &v15[16 * v6];
  unint64_t v19 = *(unint64_t **)a1;
  CFDataRef v18 = *(unint64_t **)(a1 + 8);
  if (v18 != *(unint64_t **)a1)
  {
    do
    {
      *((_OWORD *)v15 - 1) = *((_OWORD *)v18 - 1);
      v15 -= 16;
      v18 -= 2;
    }
    while (v18 != v19);
    CFDataRef v18 = *(unint64_t **)a1;
  }
  *(void *)a1 = v15;
  *(void *)(a1 + 8) = v17;
  uint64_t v20 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v16;
  if (v18)
  {
    if (a1 + 24 <= (unint64_t)v18 && v11 > v18)
    {
      if (v20 == *v11) {
        unint64_t *v11 = (unint64_t)v18;
      }
    }
    else
    {
      operator delete(v18);
    }
  }
}

CFArrayRef CTFontManagerCopyAvailablePostScriptNames(void)
{
  TDescriptorSource::TDescriptorSource((TDescriptorSource *)&v3);
  TDescriptorSource::CopyAvailablePostScriptNames(&v3, (CFArrayRef *)&v4);
  if (atomic_load_explicit((atomic_ullong *volatile)&v4, memory_order_acquire)) {
    CFArrayRef v0 = (CFArrayRef)atomic_exchange((atomic_ullong *volatile)&v4, 0);
  }
  else {
    CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
  }
  id v5 = v0;
  CFArrayRef v1 = (const __CFArray *)atomic_exchange((atomic_ullong *volatile)&v5, 0);

  return v1;
}

CFArrayRef CTFontManagerCopyAvailableFontFamilyNames(void)
{
  TDescriptorSource::TDescriptorSource((TDescriptorSource *)v3);
  TDescriptorSource::CopyAvailableFamilyNames(&v4);
  if (atomic_load_explicit((atomic_ullong *volatile)&v4, memory_order_acquire)) {
    CFArrayRef v0 = (CFArrayRef)atomic_exchange((atomic_ullong *volatile)&v4, 0);
  }
  else {
    CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
  }
  id v5 = v0;
  CFArrayRef v1 = (const __CFArray *)atomic_exchange((atomic_ullong *volatile)&v5, 0);

  return v1;
}

BOOL CTFontManagerRegisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerRegisterActionFontsForURL(fontURL, scope, 1, error);
}

BOOL _CTFontManagerRegisterActionFontsForURL(void *a1, int a2, int a3, void *a4)
{
  id v5 = (CFAllocatorRef *)MEMORY[0x1E4F1CF80];
  if (a1)
  {
    values = a1;
    CFArrayRef v8 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    CFArrayRef v9 = v8;
    if (!v8)
    {
      BOOL v10 = 0;
      unsigned int v11 = 12;
      goto LABEL_14;
    }
    unint64_t v18 = 0;
    id v19 = 0;
    values = &v19;
    BOOL v10 = _CTFontManagerRegisterActionFontsForURLs(v8, a2, a3, &v18);

    unsigned int v11 = 0;
    if (a4 && !v10)
    {
      CFArrayRef v12 = (const __CFArray *)(id)atomic_load_explicit((atomic_ullong *volatile)&v19, memory_order_acquire);
      if (v12)
      {
        CFArrayRef v13 = v12;
        CFIndex Count = CFArrayGetCount(v12);

        if (Count)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)atomic_load_explicit((atomic_ullong *volatile)&v19, memory_order_acquire), 0);
          unsigned int v11 = 0;
          *a4 = CFRetain(ValueAtIndex);
          goto LABEL_13;
        }
      }
      else
      {
      }
      CFLog();
      unsigned int v11 = 22;
    }
LABEL_13:

LABEL_14:
    if (!a4) {
      return v10;
    }
    goto LABEL_15;
  }
  BOOL v10 = 0;
  unsigned int v11 = 22;
  if (!a4) {
    return v10;
  }
LABEL_15:
  if (v11) {
    *a4 = CFErrorCreate(*v5, (CFErrorDomain)*MEMORY[0x1E4F1D160], v11, 0);
  }
  return v10;
}

BOOL CTFontManagerUnregisterFontsForURL(CFURLRef fontURL, CTFontManagerScope scope, CFErrorRef *error)
{
  return _CTFontManagerRegisterActionFontsForURL(fontURL, scope, 0, error);
}

BOOL CTFontManagerRegisterFontsForURLs(CFArrayRef fontURLs, CTFontManagerScope scope, CFArrayRef *errors)
{
  return _CTFontManagerRegisterActionFontsForURLs(fontURLs, scope, 1, errors);
}

BOOL _CTFontManagerRegisterActionFontsForURLs(const __CFArray *a1, int a2, int a3, void *a4)
{
  if (a1 && CFArrayGetCount(a1))
  {
    unint64_t v27 = a4;
    if (a2)
    {
      EnsureGSFontInitialized();
      if (a2 != 1)
      {
        CFLog();
        int v11 = 0;
        int v12 = 307;
        goto LABEL_13;
      }
    }
    else
    {
      if (_CTFontManagerRegisterActionFontsForURLs(__CFArray const*,CTFontManagerScope,BOOL,Action,__CFArray const**)::logOnce != -1) {
        dispatch_once(&_CTFontManagerRegisterActionFontsForURLs(__CFArray const*,CTFontManagerScope,BOOL,Action,__CFArray const**)::logOnce, &__block_literal_global_8);
      }
      EnsureGSFontInitialized();
    }
    int v12 = 0;
    int v11 = 1;
LABEL_13:
    CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFDataRef v14 = (const CFArrayCallBacks *)MEMORY[0x1E4F1D510];
    id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    CFArrayRef v15 = CFArrayCreateMutable(v13, 0, v14);
    if (v11)
    {
      CFIndex Count = CFArrayGetCount(a1);
      if (!Count)
      {
        BOOL v10 = 1;
LABEL_31:
        if (CFArrayGetCount(v15) >= 1)
        {
          if (a3)
          {
            CFArrayRef v24 = v15;
            CFArrayRef v25 = 0;
          }
          else
          {
            CFArrayRef v24 = 0;
            CFArrayRef v25 = v15;
          }
          CTFontManagerInstalledFontsChanged(v24, v25);
        }

        return v10;
      }
      CFIndex v17 = Count;
      int v12 = 0;
      for (CFIndex i = 0; i != v17; ++i)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(a1, i);
        if (a3 == 1) {
          int v20 = GSFontRegisterURL();
        }
        else {
          int v20 = GSFontUnregisterURL();
        }
        int v21 = v20;
        if (v20)
        {
          id v29 = (id)0xAAAAAAAAAAAAAAAALL;
          values = ValueAtIndex;
          CFArrayRef v22 = CFArrayCreate(v13, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
          CreateErrorForFailureToActOnFontURLs((CFErrorRef *)&v29, a3, (unint64_t)v22, v21);

          id v23 = (id)atomic_load_explicit((atomic_ullong *volatile)&v29, memory_order_acquire);
          CFArrayAppendValue((CFMutableArrayRef)atomic_load_explicit((atomic_ullong *volatile)&Mutable, memory_order_acquire), v23);

          if (!v12) {
            int v12 = v21;
          }
        }
        else
        {
          CFArrayAppendValue(v15, ValueAtIndex);
        }
      }
    }
    else
    {
      CreateErrorForFailureToActOnFontURLs((CFErrorRef *)&v28, a3, (unint64_t)a1, v12);
      CFArrayAppendValue((CFMutableArrayRef)atomic_load_explicit((atomic_ullong *volatile)&Mutable, memory_order_acquire), (const void *)atomic_load_explicit((atomic_ullong *volatile)&v28, memory_order_acquire));
    }
    BOOL v10 = v12 == 0;
    if (v27 && v12)
    {
      BOOL v10 = 0;
      void *v27 = atomic_exchange((atomic_ullong *volatile)&Mutable, 0);
    }
    goto LABEL_31;
  }
  if (a4)
  {
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFErrorRef v9 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D160], 22, 0);
    values = v9;
    id Mutable = CFArrayCreate(v8, (const void **)&values, 1, MEMORY[0x1E4F1D510]);
    *a4 = atomic_exchange((atomic_ullong *volatile)&Mutable, 0);
  }
  return 0;
}

BOOL CTFontManagerUnregisterFontsForURLs(CFArrayRef fontURLs, CTFontManagerScope scope, CFArrayRef *errors)
{
  return _CTFontManagerRegisterActionFontsForURLs(fontURLs, scope, 0, errors);
}

BOOL CTFontManagerRegisterGraphicsFont(CGFontRef font, CFErrorRef *error)
{
  if (font)
  {
    BOOL v9 = -86;
    id v8 = (id)0xAAAAAAAAAAAAAAAALL;
    CreateFontURLFromFont(font, &v9, (atomic_ullong *)&v8);
    EnsureGSFontInitialized();
    int v4 = GSFontRegisterCGFont();
    BOOL v5 = v4 == 0;
    if (v4)
    {
      if (error) {
        *error = CreateErrorForFailureToActOnGraphicsFont(1, font, v4);
      }
    }
    else
    {
      values = (void *)atomic_load_explicit((atomic_ullong *volatile)&v8, memory_order_acquire);
      CFArrayRef v6 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      CTFontManagerInstalledFontsChanged(v6, 0);
    }
  }
  else
  {
    BOOL v5 = 0;
    if (error) {
      *error = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D160], 22, 0);
    }
  }
  return v5;
}

void CTFontManagerInstalledFontsChanged(const void *a1, CFArrayRef theArray)
{
  atomic_fetch_add_explicit(&TGenerationSeed::sGeneration, 1u, memory_order_relaxed);
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0; i != v5; ++i)
      {
        CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(theArray, i);
        TDescriptorSource::TDescriptorSource((TDescriptorSource *)&Mutable);
        TDescriptorSource::PurgeFromCaches((TDescriptorSource *)&Mutable, ValueAtIndex);
      }
    }
  }
  id Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  id v10 = (id)atomic_exchange((atomic_ullong *volatile)&Mutable, 0);

  id v8 = (__CFDictionary *)atomic_exchange((atomic_ullong *volatile)&v10, 0);
  if (v8)
  {
    if (a1) {
      CFDictionaryAddValue(v8, @"CTFontManagerAvailableFontURLsAdded", a1);
    }
    if (theArray) {
      CFDictionaryAddValue(v8, @"CTFontManagerAvailableFontURLsRemoved", theArray);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __CTFontManagerInstalledFontsChanged_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v8;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

CFErrorRef CreateErrorForFailureToActOnGraphicsFont(int a1, void *a2, int a3)
{
  userInfoKeys[2] = *(void **)MEMORY[0x1E4F143B8];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFArrayRef v6 = "register";
  if (!a1) {
    CFArrayRef v6 = "unregister";
  }
  uint64_t v7 = (__CFString *)CFStringCreateWithFormat(v5, 0, @"Could not %s the CGFont '%@'", v6, a2);
  userInfoKeys[0] = *(void **)MEMORY[0x1E4F1D140];
  userInfoKeys[1] = @"CTFailedCGFont";
  userInfoValues[0] = v7;
  userInfoValues[1] = a2;
  CFErrorRef v8 = CFErrorCreateWithUserInfoKeysAndValues(v5, @"com.apple.CoreText.CTFontManagerErrorDomain", a3, (const void *const *)userInfoKeys, (const void *const *)userInfoValues, 2);

  return v8;
}

BOOL CTFontManagerUnregisterGraphicsFont(CGFontRef font, CFErrorRef *error)
{
  if (font)
  {
    BOOL v9 = -86;
    id v8 = (id)0xAAAAAAAAAAAAAAAALL;
    CreateFontURLFromFont(font, &v9, (atomic_ullong *)&v8);
    EnsureGSFontInitialized();
    int v4 = GSFontUnregisterCGFont();
    BOOL v5 = v4 == 0;
    if (v4)
    {
      if (error) {
        *error = CreateErrorForFailureToActOnGraphicsFont(0, font, v4);
      }
    }
    else
    {
      values = (void *)atomic_load_explicit((atomic_ullong *volatile)&v8, memory_order_acquire);
      CFArrayRef v6 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&values, 1, MEMORY[0x1E4F1D510]);
      CTFontManagerInstalledFontsChanged(0, v6);
    }
  }
  else
  {
    BOOL v5 = 0;
    if (error) {
      *error = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFErrorDomain)*MEMORY[0x1E4F1D160], 22, 0);
    }
  }
  return v5;
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromURL(CFURLRef fileURL)
{
  id FontsWithURL = (id)CGFontCreateFontsWithURL();
  CFArrayRef v1 = (void *)atomic_exchange((atomic_ullong *volatile)&FontsWithURL, 0);

  CFArrayRef v2 = v1;
  CFArrayRef v3 = v2;
  if (v2)
  {
    CFIndex Count = CFArrayGetCount(v2);

    if (Count < 1)
    {
      CFArrayRef v3 = 0;
      goto LABEL_15;
    }
    id FontsWithURL = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (v1)
    {
      CFIndex v5 = CFArrayGetCount((CFArrayRef)v1);
      if (v5)
      {
        CFIndex v6 = v5;
        for (CFIndex i = 0; i != v6; ++i)
        {
          CFURLRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v1, i);
          uint64_t BaseFont = 0xAAAAAAAAAAAAAAAALL;
          uint64_t BaseFont = TDescriptor::CreateBaseFont((uint64_t)ValueAtIndex, (CGFont *)1);
          if (BaseFont) {
            TCFBase_NEW<CTFontDescriptor,TBaseFont const*&>(&BaseFont, &v12);
          }
          else {
            id v12 = 0;
          }
          BOOL v9 = (void *)atomic_exchange((atomic_ullong *volatile)&v12, 0);

          if (v9)
          {
            id v10 = v9;
            CFArrayAppendValue((CFMutableArrayRef)atomic_load_explicit((atomic_ullong *volatile)&FontsWithURL, memory_order_acquire), v10);
          }
        }
      }
    }
    CFArrayRef v3 = (const __CFArray *)atomic_exchange((atomic_ullong *volatile)&FontsWithURL, 0);
    CFArrayRef v2 = (const __CFArray *)FontsWithURL;
  }

LABEL_15:
  return v3;
}

CTFontDescriptorRef CTFontManagerCreateFontDescriptorFromData(CFDataRef data)
{
  id v5 = (id)0xAAAAAAAAAAAAAAAALL;
  CreateFontWithData(data, (atomic_ullong *)&v5);
  if (atomic_load_explicit((atomic_ullong *volatile)&v5, memory_order_acquire))
  {
    id v4 = (id)0xAAAAAAAAAAAAAAAALL;
    atomic_load_explicit((atomic_ullong *volatile)&v5, memory_order_acquire);
    TCFBase_NEW<CTFontDescriptor,CGFont *&,is_inmemory_t const&>(&v3);
    id v4 = (id)atomic_exchange((atomic_ullong *volatile)&v3, 0);

    CFArrayRef v1 = (const __CTFontDescriptor *)atomic_exchange((atomic_ullong *volatile)&v4, 0);
  }
  else
  {
    CFArrayRef v1 = 0;
  }

  return v1;
}

unint64_t CTFontManagerCreateMemorySafeFontDescriptorFromData(const __CFData *a1)
{
  id v5 = (id)0xAAAAAAAAAAAAAAAALL;
  CreateMemorySafeFontWithData(a1, (atomic_ullong *)&v5);
  if (atomic_load_explicit((atomic_ullong *volatile)&v5, memory_order_acquire))
  {
    id v4 = (id)0xAAAAAAAAAAAAAAAALL;
    atomic_load_explicit((atomic_ullong *volatile)&v5, memory_order_acquire);
    TCFBase_NEW<CTFontDescriptor,CGFont *&,is_inmemory_t const&>(&v3);
    id v4 = (id)atomic_exchange((atomic_ullong *volatile)&v3, 0);

    unint64_t v1 = atomic_exchange((atomic_ullong *volatile)&v4, 0);
  }
  else
  {
    unint64_t v1 = 0;
  }

  return v1;
}

CFArrayRef CTFontManagerCreateFontDescriptorsFromData(CFDataRef data)
{
  id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  CFArrayRef FontsFromData = (const __CFArray *)CGFontCreateFontsFromData();
  CFArrayRef v2 = FontsFromData;
  if (FontsFromData)
  {
    CFIndex Count = CFArrayGetCount(FontsFromData);
    if (Count)
    {
      CFIndex v4 = Count;
      for (CFIndex i = 0; i != v4; ++i)
      {
        CFURLRef ValueAtIndex = (const void *)0xAAAAAAAAAAAAAAAALL;
        CFURLRef ValueAtIndex = CFArrayGetValueAtIndex(v2, i);
        TCFBase_NEW<CTFontDescriptor,CGFont *&,is_inmemory_t const&>(&v10);
        CFIndex v6 = (void *)atomic_exchange((atomic_ullong *volatile)&v10, 0);

        if (v6)
        {
          id v7 = v6;
          CFArrayAppendValue((CFMutableArrayRef)atomic_load_explicit((atomic_ullong *volatile)&Mutable, memory_order_acquire), v7);
        }
      }
    }
  }
  CFArrayRef v8 = (const __CFArray *)atomic_exchange((atomic_ullong *volatile)&Mutable, 0);

  return v8;
}

void __CTFontManagerInstalledFontsChanged_block_invoke(uint64_t a1)
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"CTFontManagerFontChangedNotification", 0, *(CFDictionaryRef *)(a1 + 32), 0);
  id v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

void CTFontManagerRegisterFontURLs(CFArrayRef fontURLs, CTFontManagerScope scope, BOOL enabled, void *registrationHandler)
{
}

void _CTFontManagerRegisterActionFontURLs(void *a1, int a2, uint64_t a3, int a4, int a5, void *a6, void (**a7)(void, void, void))
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    int v11 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = a1;
    uint64_t v12 = [a1 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(obj);
          }
          CFIndex v17 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:*(void *)(*((void *)&v27 + 1) + 8 * i) forKey:@"NSCTFontFileURLAttribute"];
          unint64_t v18 = v17;
          if (a5 == 1) {
            [v17 setObject:MEMORY[0x1E4F1CC38] forKey:@"CTFontIgnoreURLLocationAttribute"];
          }
          if (a6)
          {
            id v19 = (void *)[a6 objectAtIndex:v14 + i];
            objc_msgSend(v18, "setObject:forKey:", objc_msgSend(v19, "objectAtIndexedSubscript:", 0), @"CTFontRegistrationUserInfoAttribute");
            objc_msgSend(v18, "setObject:forKey:", objc_msgSend(v19, "objectAtIndexedSubscript:", 1), @"CTFontAssetDataAttribute");
          }
          [v11 addObject:v18];
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        v14 += i;
      }
      while (v13);
    }
    v25[1] = (id)MEMORY[0x1E4F143A8];
    v25[2] = (id)3221225472;
    v25[3] = ___ZL36_CTFontManagerRegisterActionFontURLsPK9__CFArray18CTFontManagerScopeb6Action8URLTrustS1_U13block_pointerFbS1_bE_block_invoke;
    v25[4] = &unk_1E5290658;
    v25[5] = obj;
    v25[6] = a7;
    int v26 = a4;
    if (a4 == 1) {
      FSFontProviderRegisterFonts();
    }
    else {
      FSFontProviderUnregisterFonts();
    }
  }
  else
  {
    unint64_t v24 = 0;
    v25[0] = 0;
    _CTFontManagerRegisterActionFontsForURLs((const __CFArray *)a1, a2, a4, &v24);

    if (a7)
    {
      if (atomic_load_explicit((atomic_ullong *volatile)v25, memory_order_acquire)) {
        CFArrayRef v20 = (CFArrayRef)atomic_exchange((atomic_ullong *volatile)v25, 0);
      }
      else {
        CFArrayRef v20 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
      }
      ((void (**)(void, CFArrayRef, uint64_t))a7)[2](a7, v20, 1);
    }
  }
}

void CTFontManagerUnregisterFontURLs(CFArrayRef fontURLs, CTFontManagerScope scope, void *registrationHandler)
{
}

void CTFontManagerRegisterFontDescriptors(CFArrayRef fontDescriptors, CTFontManagerScope scope, BOOL enabled, void *registrationHandler)
{
}

void _CTFontManagerRegisterActionFontDescriptors(CFArrayRef theArray, int a2, unsigned int a3, int a4, uint64_t a5)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    CFArrayRef v8 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:CFArrayGetCount(theArray)];
    if (theArray)
    {
      CFIndex Count = CFArrayGetCount(theArray);
      if (Count)
      {
        CFIndex v10 = Count;
        for (CFIndex i = 0; i != v10; ++i)
        {
          CFURLRef ValueAtIndex = (atomic_ullong **)CFArrayGetValueAtIndex(theArray, i);
          SupportedAttributes = ExtractSupportedAttributes(ValueAtIndex[5], 1);
          if (SupportedAttributes) {
            [v8 addObject:SupportedAttributes];
          }
        }
      }
    }
    v30[6] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
    v30[7] = (void (*)(void, void, void))3221225472;
    v30[8] = (void (*)(void, void, void))___ZL43_CTFontManagerRegisterActionFontDescriptorsPK9__CFArray18CTFontManagerScopeb6ActionU13block_pointerFbS1_bE_block_invoke;
    v30[9] = (void (*)(void, void, void))&unk_1E5290658;
    v30[10] = (void (*)(void, void, void))theArray;
    v30[11] = (void (*)(void, void, void))a5;
    int v31 = a4;
    if (a4 == 1) {
      FSFontProviderRegisterFonts();
    }
    else {
      FSFontProviderUnregisterFonts();
    }
  }
  else
  {
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](theArray, "count"));
    id v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](theArray, "count"));
    CFIndex v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[__CFArray count](theArray, "count"));
    if (theArray)
    {
      CFIndex v18 = CFArrayGetCount(theArray);
      if (v18)
      {
        CFIndex v19 = v18;
        for (CFIndex j = 0; j != v19; ++j)
        {
          int v21 = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(theArray, j);
          CFTypeRef v22 = CTFontDescriptorCopyAttribute(v21, @"NSCTFontFileURLAttribute");
          CFTypeRef v23 = (id)CFMakeCollectable(v22);
          if (v23)
          {
            CFTypeRef v24 = v23;
            [v15 addObject:v23];
            [v17 setObject:v21 forKeyedSubscript:v24];
          }
          else
          {
            [v16 addObject:v21];
          }
        }
      }
    }
    uint64_t v25 = [v16 count];
    if (a5 && v25)
    {
      uint64_t v33 = @"CTFontManagerErrorFontDescriptors";
      v34[0] = v16;
      uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
      uint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreText.CTFontManagerErrorDomain" code:303 userInfo:v26];
      (*(void (**)(uint64_t, uint64_t, BOOL))(a5 + 16))(a5, [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1], objc_msgSend(v15, "count") == 0);
    }
    if ([v15 count])
    {
      v30[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
      v30[1] = (void (*)(void, void, void))3221225472;
      v30[2] = (void (*)(void, void, void))___ZL43_CTFontManagerRegisterActionFontDescriptorsPK9__CFArray18CTFontManagerScopeb6ActionU13block_pointerFbS1_bE_block_invoke_2;
      v30[3] = (void (*)(void, void, void))&unk_1E5290680;
      v30[4] = (void (*)(void, void, void))v17;
      v30[5] = (void (*)(void, void, void))a5;
      _CTFontManagerRegisterActionFontURLs(v15, a2, a3, a4, 1, 0, v30);
    }
  }
}

void CTFontManagerUnregisterFontDescriptors(CFArrayRef fontDescriptors, CTFontManagerScope scope, void *registrationHandler)
{
}

void CTFontManagerRegisterFontsWithAssetNames(CFArrayRef fontAssetNames, CFBundleRef bundle, CTFontManagerScope scope, BOOL enabled, void *registrationHandler)
{
  BOOL v6 = enabled;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  BOOL v9 = (void *)[(__CFArray *)fontAssetNames mutableCopy];
  if (bundle
    && (CFIndex v10 = (void *)[MEMORY[0x1E4F28B50] bundleWithIdentifier:CFBundleGetIdentifier(bundle)]) != 0)
  {
    uint64_t v11 = (uint64_t)v10;
    int v12 = objc_msgSend(v10, "isEqual:", objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"));
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] mainBundle];
    int v12 = 1;
  }
  if (scope == kCTFontManagerScopePersistent && v12)
  {
    BOOL v34 = v6;
    double v35 = (void (**)(void *, uint64_t, BOOL))registrationHandler;
    CFDataRef v39 = v9;
    id v48 = 0;
    BOOL v49 = &v48;
    uint64_t v50 = 0x3052000000;
    unsigned int v51 = __Block_byref_object_copy__2;
    int v52 = __Block_byref_object_dispose__2;
    uint64_t v13 = (objc_class *)_MergedGlobals_36;
    uint64_t v53 = _MergedGlobals_36;
    if (!_MergedGlobals_36)
    {
      v47[0] = (id)MEMORY[0x1E4F143A8];
      v47[1] = (id)3221225472;
      v47[2] = ___ZL19getNSDataAssetClassv_block_invoke;
      v47[3] = &unk_1E528A348;
      v47[4] = &v48;
      ___ZL19getNSDataAssetClassv_block_invoke((uint64_t)v47);
      uint64_t v13 = (objc_class *)v49[5];
    }
    _Block_object_dispose(&v48, 8);
    CFDataRef v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](fontAssetNames, "count"));
    id v37 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[__CFArray count](fontAssetNames, "count"));
    int v36 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[__CFArray count](fontAssetNames, "count"));
    if (v13)
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v14 = [(__CFArray *)fontAssetNames countByEnumeratingWithState:&v43 objects:v61 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v44 != v16) {
              objc_enumerationMutation(fontAssetNames);
            }
            uint64_t v18 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            uint64_t v19 = [[v13 alloc] initWithName:v18 bundle:v11];
            if (v19)
            {
              CFArrayRef v20 = (void *)v19;
              CFUUIDRef v21 = CFUUIDCreate(0);
              if (v21)
              {
                CFUUIDRef v22 = v21;
                CFStringRef v23 = CFUUIDCreateString(0, v21);
                if (v23)
                {
                  CFStringRef v24 = v23;
                  uint64_t v25 = [MEMORY[0x1E4F1CB10] fileURLWithPath:-[NSString stringByAppendingPathComponent:](NSTemporaryDirectory(), "stringByAppendingPathComponent:", objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", v18, v23))];
                  CFRelease(v24);
                  CFRelease(v22);
                  if (v25)
                  {
                    if (objc_msgSend((id)objc_msgSend(v20, "data"), "writeToURL:atomically:", v25, 1))
                    {
                      uint64_t v26 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v25 options:8 error:0];
                      if (v26)
                      {
                        long long v27 = (void *)v26;
                        [v39 removeObject:v18];
                        [v38 addObject:v25];
                        v60[0] = v18;
                        v60[1] = v27;
                        objc_msgSend(v37, "addObject:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v60, 2));
                        [v36 setObject:v18 forKeyedSubscript:v25];
                      }
                    }
                  }
                }
                else
                {
                  CFRelease(v22);
                }
              }
            }
          }
          uint64_t v15 = [(__CFArray *)fontAssetNames countByEnumeratingWithState:&v43 objects:v61 count:16];
        }
        while (v15);
      }
    }
    BOOL v9 = v39;
    uint64_t v28 = [v39 count];
    if (v35 && v28)
    {
      id v48 = 0;
      if ([v39 count] == 1)
      {
        CTCopyLocalizedString(@"The font resource \"%@\" could not be found in an asset catalog.", @"CTFontManagerErrors", &v42);
        CreateLocalizedStringWithFormat((const __CFString *)atomic_load_explicit((atomic_ullong *volatile)&v42, memory_order_acquire), v47, [v39 objectAtIndexedSubscript:0], v33);
      }
      else
      {
        CTCopyLocalizedString(@"%1$d font resources could not be found in an asset catalog: %2$@", @"CTFontManagerErrors", &v42);
        CreateLocalizedStringWithFormat((const __CFString *)atomic_load_explicit((atomic_ullong *volatile)&v42, memory_order_acquire), v47, [v39 count], objc_msgSend(v39, "componentsJoinedByString:", @", "));
      }

      v59[0] = v39;
      uint64_t v31 = *MEMORY[0x1E4F1D170];
      v58[0] = @"CTFontManagerErrorFontAssetNameKey";
      v58[1] = v31;
      v59[1] = atomic_load_explicit((atomic_ullong *volatile)&v48, memory_order_acquire);
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
      uint64_t v57 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.CoreText.CTFontManagerErrorDomain" code:107 userInfo:v32];
      v35[2](v35, [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1], objc_msgSend(v38, "count") == 0);
    }
    if ([v38 count])
    {
      v41[0] = (void (*)(void, void, void))MEMORY[0x1E4F143A8];
      v41[1] = (void (*)(void, void, void))3221225472;
      v41[2] = (void (*)(void, void, void))__CTFontManagerRegisterFontsWithAssetNames_block_invoke;
      v41[3] = (void (*)(void, void, void))&unk_1E5290608;
      v41[5] = (void (*)(void, void, void))v38;
      v41[6] = (void (*)(void, void, void))v35;
      v41[4] = (void (*)(void, void, void))v36;
      _CTFontManagerRegisterActionFontURLs(v38, 2, v34, 1, 1, v37, v41);
    }
  }
  else
  {
    BOOL v55 = @"CTFontManagerErrorFontAssetNameKey";
    unsigned __int16 v56 = v9;
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
    uint64_t v30 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F1D160] code:22 userInfo:v29];
    if (registrationHandler)
    {
      uint64_t v54 = v30;
      (*((void (**)(void *, uint64_t, uint64_t))registrationHandler + 2))(registrationHandler, [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1], 1);
    }
  }
}

uint64_t __CTFontManagerRegisterFontsWithAssetNames_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48))
  {
    BOOL v6 = TransformErrorsWithURLKeyIntoKey(a2, @"CTFontManagerErrorFontAssetNameKey", *(void **)(a1 + 32));
    if (v6) {
      id v7 = v6;
    }
    else {
      id v7 = a2;
    }
    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v7, a3);
  }
  if (a3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    CFArrayRef v8 = *(void **)(a1 + 40);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", *(void *)(*((void *)&v14 + 1) + 8 * i), 0);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  return 1;
}

void *TransformErrorsWithURLKeyIntoKey(void *a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  CFArrayRef v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = a1;
  uint64_t v19 = [a1 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        BOOL v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v7 = (id)objc_msgSend((id)objc_msgSend(v6, "userInfo"), "mutableCopy");
        CFArrayRef v8 = (void *)[MEMORY[0x1E4F1CA48] array];
        uint64_t v9 = objc_msgSend((id)objc_msgSend(v6, "userInfo"), "objectForKeyedSubscript:", @"CTFontManagerErrorFontURLs");
        if (!v9)
        {
          CFLog();
          return 0;
        }
        uint64_t v10 = v9;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              objc_msgSend(v8, "addObject:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v21 + 1) + 8 * j)));
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v12);
        }
        [v7 removeObjectForKey:@"CTFontManagerErrorFontURLs"];
        [v7 setObject:v8 forKeyedSubscript:a2];
        objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", objc_msgSend(v6, "domain"), objc_msgSend(v6, "code"), v7));
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
  return v20;
}

CFArrayRef CTFontManagerCopyRegisteredFontDescriptors(CTFontManagerScope scope, BOOL enabled)
{
  if (scope == kCTFontManagerScopePersistent && (CFArrayRef v2 = (const __CFArray *)FSFontProviderRegisteredFontsInfo()) != 0)
  {
    CFArrayRef v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, MEMORY[0x1E4F1D510]);
    CFIndex v6 = CFArrayGetCount(v3);
    if (v6)
    {
      CFIndex v7 = v6;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, i);
        CTFontDescriptorRef v10 = CTFontDescriptorCreateWithAttributes(ValueAtIndex);
        if (v10)
        {
          CTFontDescriptorRef v11 = v10;
          CFArrayAppendValue(Mutable, v10);
          CFRelease(v11);
        }
      }
    }
  }
  else
  {
    CFLog();
    id v14 = 0;
    if (atomic_load_explicit((atomic_ullong *volatile)&v14, memory_order_acquire)) {
      CFArrayRef v12 = (CFArrayRef)atomic_exchange((atomic_ullong *volatile)&v14, 0);
    }
    else {
      CFArrayRef v12 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 0, MEMORY[0x1E4F1D510]);
    }
    id v15 = v12;
    id Mutable = (__CFArray *)atomic_exchange((atomic_ullong *volatile)&v15, 0);
  }
  return Mutable;
}

void CTFontManagerRequestFonts(CFArrayRef fontDescriptors, void *completionHandler)
{
  if (fontDescriptors)
  {
    CFIndex Count = CFArrayGetCount(fontDescriptors);
    id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Count, MEMORY[0x1E4F1D510]);
    CFIndex v5 = CFArrayGetCount(fontDescriptors);
    if (v5)
    {
      CFIndex v6 = v5;
      for (CFIndex i = 0; i != v6; ++i)
      {
        CFDictionaryRef ValueAtIndex = (atomic_ullong **)CFArrayGetValueAtIndex(fontDescriptors, i);
        CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors((CTFontDescriptorRef)ValueAtIndex, 0);
        if (!MatchingFontDescriptors)
        {
          SupportedAttributes = ExtractSupportedAttributes(ValueAtIndex[5], 0);
          if (SupportedAttributes) {
            CFArrayAppendValue(Mutable, SupportedAttributes);
          }
        }
      }
    }
    CFRetain(fontDescriptors);
    FSFontProviderRequestFonts();
  }
  else if (completionHandler)
  {
    CTFontDescriptorRef v11 = (void (*)(void *, void))*((void *)completionHandler + 2);
    v11(completionHandler, 0);
  }
}

void *ExtractSupportedAttributes(atomic_ullong *a1, char a2)
{
  v12[8] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFIndex v4 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  v12[0] = @"NSFontNameAttribute";
  v12[1] = objc_opt_class();
  v12[2] = @"NSFontFamilyAttribute";
  v12[3] = objc_opt_class();
  v12[4] = @"NSCTFontFileURLAttribute";
  v12[5] = objc_opt_class();
  v12[6] = @"CTFontRegistrationUserInfoAttribute";
  uint64_t v5 = 0;
  v12[7] = objc_opt_class();
  do
  {
    CFIndex v6 = (const void *)v12[v5];
    atomic_load_explicit(a1 + 1, memory_order_acquire);
    CFDictionaryRef explicit = (const __CFDictionary *)atomic_load_explicit(a1 + 1, memory_order_acquire);
    if (explicit) {
      Value = CFDictionaryGetValue(explicit, v6);
    }
    else {
      Value = 0;
    }
    if (objc_opt_isKindOfClass()) {
      [v4 setObject:Value forKeyedSubscript:v12[v5]];
    }
    v5 += 2;
  }
  while (v5 != 8);
  if ((a2 & 1) != 0 && (a1[2] & 0x80000000) != 0)
  {
    TDescriptor::CopyAttribute(a1, @"NSCTFontFileURLAttribute", &v11);
    uint64_t v9 = (void *)atomic_exchange((atomic_ullong *volatile)&v11, 0);

    if (v9) {
      [v4 setObject:v9 forKeyedSubscript:@"NSCTFontFileURLAttribute"];
    }
  }
  return v4;
}

void __CTFontManagerRequestFonts_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    if (a2)
    {
      id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      CFArrayRef v5 = *(const __CFArray **)(a1 + 40);
      if (v5)
      {
        CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 40));
        if (Count)
        {
          CFIndex v7 = Count;
          for (CFIndex i = 0; i != v7; ++i)
          {
            CFDictionaryRef ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v5, i);
            CFArrayRef MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(ValueAtIndex, 0);
            if (!MatchingFontDescriptors) {
              CFArrayAppendValue(Mutable, ValueAtIndex);
            }
          }
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
    }
  }
  id v11 = *(const void **)(a1 + 40);

  CFRelease(v11);
}

uint64_t ___ZL40_CTFontManagerRegisterActionFontsForURLsPK9__CFArray18CTFontManagerScopeb6ActionPS1__block_invoke()
{
  return CFLog();
}

void CreateErrorForFailureToActOnFontURLs(CFErrorRef *a1, int a2, unint64_t a3, int a4)
{
  userInfoKeys[2] = *(void **)MEMORY[0x1E4F143B8];
  id v8 = (id)0xAAAAAAAAAAAAAAAALL;
  if (a2) {
    CFStringRef v7 = @"Font registration was unsuccessful.";
  }
  else {
    CFStringRef v7 = @"Font unregistration was unsuccessful.";
  }
  CTCopyLocalizedString(v7, @"CTFontManagerErrors", &v8);
  userInfoKeys[0] = *(void **)MEMORY[0x1E4F1D170];
  userInfoKeys[1] = @"CTFontManagerErrorFontURLs";
  userInfoValues = (void *)0xAAAAAAAAAAAAAAAALL;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  userInfoValues = (void *)atomic_load_explicit((atomic_ullong *volatile)&v8, memory_order_acquire);
  unint64_t v10 = a3;
  *a1 = CFErrorCreateWithUserInfoKeysAndValues((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.CoreText.CTFontManagerErrorDomain", a4, (const void *const *)userInfoKeys, (const void *const *)&userInfoValues, 2);
}

uint64_t ___ZL36_CTFontManagerRegisterActionFontURLsPK9__CFArray18CTFontManagerScopeb6Action8URLTrustS1_U13block_pointerFbS1_bE_block_invoke(uint64_t result, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 40))
  {
    uint64_t v3 = result;
    CFIndex v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a2);
          }
          [v4 addObject:externalizeError(*(void **)(*((void *)&v9 + 1) + 8 * v8++), @"CTFontManagerErrorFontURLs", *(void **)(v3 + 32), *(unsigned int *)(v3 + 48))];
        }
        while (v6 != v8);
        uint64_t v6 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    return (*(uint64_t (**)(void))(*(void *)(v3 + 40) + 16))();
  }
  return result;
}

uint64_t externalizeError(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = a1;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)[a1 userInfo];
  if (v8)
  {
    long long v9 = v8;
    uint64_t v10 = *MEMORY[0x1E4F622C8];
    uint64_t v11 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F622C8]];
    if (v11)
    {
      long long v12 = (void *)v11;
      uint64_t v37 = a2;
      unsigned int v38 = a4;
      id v13 = (id)[v9 mutableCopy];
      uint64_t v14 = (void *)[MEMORY[0x1E4F1CA48] array];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v15 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v40;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v40 != v17) {
                objc_enumerationMutation(v12);
              }
              objc_msgSend(v14, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", (int)objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "intValue")));
            }
            uint64_t v16 = [v12 countByEnumeratingWithState:&v39 objects:v46 count:16];
          }
          while (v16);
        }
      }
      else
      {
        objc_msgSend(v14, "addObject:", objc_msgSend(a3, "objectAtIndexedSubscript:", (int)objc_msgSend(v12, "intValue")));
      }
      a2 = v37;
      [v13 setObject:v14 forKey:v37];
      [v13 removeObjectForKey:v10];
      a4 = v38;
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v19 = *MEMORY[0x1E4F28A50];
    uint64_t v20 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];
    if (v20)
    {
      uint64_t v21 = v20;
      if (!v13) {
        id v13 = (id)[v9 mutableCopy];
      }
      objc_msgSend(v13, "setObject:forKey:", externalizeError(v21, a2, a3, a4), v19);
    }
    if (v13)
    {
      long long v22 = (void *)[v7 domain];
      uint64_t v23 = [v7 code];
      if ([v22 isEqualToString:*MEMORY[0x1E4F622A8]])
      {
        if ((unint64_t)(v23 - 1) >= 0xA)
        {
          uint64_t v36 = v23;
          CFLog();
          uint64_t v24 = 301;
        }
        else
        {
          uint64_t v24 = qword_184BAAF00[v23 - 1];
        }
        long long v25 = (__CFError *)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.CoreText.CTFontManagerErrorDomain", v24, v13, v36);
        id v45 = (id)0xAAAAAAAAAAAAAAAALL;
        CFDictionaryRef v26 = CFErrorCopyUserInfo(v25);
        TCFMutableDictionary::TCFMutableDictionary((TCFMutableDictionary *)&v45, v26);

        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)atomic_load_explicit((atomic_ullong *volatile)&v45, memory_order_acquire), @"CTFontManagerErrorFontURLs");
        if (Value) {
          CFIndex Count = CFArrayGetCount(Value);
        }
        else {
          CFIndex Count = 0;
        }
        uint64_t v29 = (const void *)*MEMORY[0x1E4F1D178];
        if (a4) {
          CFStringRef v30 = @"Font registration was unsuccessful.";
        }
        else {
          CFStringRef v30 = @"Font unregistration was unsuccessful.";
        }
        CTCopyLocalizedString(v30, @"CTFontManagerErrors", &v44);
        CFDictionarySetValue((CFMutableDictionaryRef)atomic_load_explicit((atomic_ullong *volatile)&v45, memory_order_acquire), v29, (const void *)atomic_load_explicit((atomic_ullong *volatile)&v44, memory_order_acquire));

        CFIndex Code = CFErrorGetCode(v25);
        CFIndex v32 = Code;
        if (Code <= 201)
        {
          switch(Code)
          {
            case 'e':
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file does not exist at the specified URL.";
              break;
            case 'f':
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file cannot be accessed due to insufficient permissions.";
              break;
            case 'g':
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file is not a recognized or supported font file format.";
              break;
            case 'h':
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file contains invalid font data that could cause system problems.";
              break;
            case 'i':
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file has already been registered in the specified scope.";
              break;
            case 'j':
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The operation failed due to a system limitation.";
              break;
            default:
              if (Code != 201) {
                goto LABEL_53;
              }
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file is not registered in the specified scope.";
              break;
          }
        }
        else
        {
          switch(Code)
          {
            case 301:
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file could not be processed due to an unexpected FontProvider error.";
              break;
            case 302:
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file could not be processed because the provider does not have a necessary entitlement.";
              break;
            case 303:
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The font descriptor does not have information to specify a font file.";
              break;
            case 304:
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The operation was cancelled by the user.";
              break;
            case 305:
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file could not be registered because of a duplicated font name.";
              break;
            case 306:
              uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
              CFStringRef v34 = @"The file is not in an allowed location. It must be either in the application's bundle or an on-demand resource.";
              break;
            default:
              if (Code == 202)
              {
                uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
                CFStringRef v34 = @"The file is actively in use and cannot be unregistered.";
              }
              else
              {
                if (Code != 203) {
                  goto LABEL_53;
                }
                uint64_t v33 = (const void *)*MEMORY[0x1E4F1D170];
                CFStringRef v34 = @"The file is required by the system and cannot be unregistered.";
              }
              break;
          }
        }
        CTCopyLocalizedString(v34, @"CTFontManagerErrors", &v43);
        CreateLocalizedStringWithFormat((const __CFString *)atomic_load_explicit((atomic_ullong *volatile)&v43, memory_order_acquire), &v44, Count);
        CFDictionarySetValue((CFMutableDictionaryRef)atomic_load_explicit((atomic_ullong *volatile)&v45, memory_order_acquire), v33, (const void *)atomic_load_explicit((atomic_ullong *volatile)&v44, memory_order_acquire));

LABEL_53:
        id v44 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.CoreText.CTFontManagerErrorDomain", v32, (CFDictionaryRef)atomic_load_explicit((atomic_ullong *volatile)&v45, memory_order_acquire));

        uint64_t v7 = (id)CFMakeCollectable((CFTypeRef)atomic_exchange((atomic_ullong *volatile)&v44, 0));
      }
      else
      {
        return [MEMORY[0x1E4F28C58] errorWithDomain:v22 code:v23 userInfo:v13];
      }
    }
  }
  return (uint64_t)v7;
}

uint64_t ___ZL43_CTFontManagerRegisterActionFontDescriptorsPK9__CFArray18CTFontManagerScopeb6ActionU13block_pointerFbS1_bE_block_invoke(uint64_t result, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 40))
  {
    uint64_t v3 = result;
    CFIndex v4 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(a2);
          }
          [v4 addObject:externalizeError(*(void **)(*((void *)&v9 + 1) + 8 * v8++), @"CTFontManagerErrorFontDescriptors", *(void **)(v3 + 32), *(unsigned int *)(v3 + 48))];
        }
        while (v6 != v8);
        uint64_t v6 = [a2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    return (*(uint64_t (**)(void))(*(void *)(v3 + 40) + 16))();
  }
  return result;
}

uint64_t ___ZL43_CTFontManagerRegisterActionFontDescriptorsPK9__CFArray18CTFontManagerScopeb6ActionU13block_pointerFbS1_bE_block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = TransformErrorsWithURLKeyIntoKey(a2, @"CTFontManagerErrorFontDescriptors", *(void **)(a1 + 32));
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = a2;
    }
    (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, a3);
  }
  return 1;
}

void __Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

Class ___ZL19getNSDataAssetClassv_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v6[0] = 0;
  if (!qword_1EB2CE910)
  {
    v6[1] = (void *)MEMORY[0x1E4F143A8];
    v6[2] = (void *)3221225472;
    v6[3] = ___ZL20UIKitCoreLibraryCorePPc_block_invoke;
    v6[4] = &__block_descriptor_40_e5_v8__0l;
    v6[5] = v6;
    long long v7 = xmmword_1E52906A0;
    uint64_t v8 = 0;
    qword_1EB2CE910 = _sl_dlopen();
  }
  if (!qword_1EB2CE910)
  {
    uint64_t v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"void *UIKitCoreLibrary()"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"CTFontManager.cpp", 1177, @"%s", v6[0]);
    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("NSDataAsset");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "Class getNSDataAssetClass()_block_invoke"), @"CTFontManager.cpp", 1178, @"Unable to find class %s", "NSDataAsset");
LABEL_10:
    __break(1u);
  }
  _MergedGlobals_36 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t ___ZL20UIKitCoreLibraryCorePPc_block_invoke()
{
  uint64_t result = _sl_dlopen();
  qword_1EB2CE910 = result;
  return result;
}

void OpenTypeReorderingOutput::OpenTypeReorderingOutput(OpenTypeReorderingOutput *this, TRunGlue *a2)
{
  *(void *)this = &unk_1ED05F240;
  *((void *)this + 1) = a2;
  *((void *)this + 3) = -1;
  *((_DWORD *)this + 8) = 0;
  *((void *)this + 5) = -1;
  *((void *)this + 6) = -1;
  CFArrayRef v2 = (void **)((char *)this + 80);
  uint64_t v3 = (void **)((char *)this + 128);
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 184) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  uint64_t v4 = (std::vector<unsigned int> *)((char *)this + 104);
  *(_OWORD *)((char *)this + 56) = 0u;
  uint64_t v5 = (std::vector<unsigned int> *)((char *)this + 56);
  *(_OWORD *)((char *)this + 232) = 0u;
  *((void *)this + 35) = (char *)this + 248;
  *((void *)this + 36) = 0;
  *((void *)this + 37) = 0;
  *((void *)this + 38) = 0;
  *((void *)this + 47) = (char *)this + 312;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *((void *)this + 2) = *((void *)a2 + 1);
  std::vector<unsigned int>::size_type v6 = TRunGlue::length(a2);
  std::vector<unsigned int>::reserve(v5, v6);
  std::vector<long>::reserve(v2, v6);
  std::vector<unsigned int>::reserve(v4, v6);
  std::vector<std::pair<long,unsigned int const*>>::reserve(v3, v6);
}

void std::vector<long>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    std::vector<unsigned int>::size_type v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<long>>(v3, a2);
    long long v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    long long v10 = (char *)*a1;
    long long v11 = (char *)a1[1];
    long long v12 = v7;
    if (v11 != *a1)
    {
      long long v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<std::pair<long,unsigned int const*>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    std::vector<unsigned int>::size_type v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CGSize>>(v3, a2);
    long long v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    uint64_t v9 = &v6[16 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    long long v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void OpenTypeReorderingOutput::~OpenTypeReorderingOutput(OpenTypeReorderingOutput *this)
{
  *(void *)this = &unk_1ED05F240;
  CFArrayRef v2 = (void *)*((void *)this + 51);
  if (v2)
  {
    *((void *)this + 52) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 48);
  if (v3)
  {
    *((void *)this + 49) = v3;
    operator delete(v3);
  }
  long long v11 = (void **)((char *)this + 288);
  std::vector<CFRange,TInlineBufferAllocator<CFRange,4ul>>::__destroy_vector::operator()[abi:nn180100](&v11);
  long long v11 = (void **)((char *)this + 224);
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,8ul>>::__destroy_vector::operator()[abi:nn180100](&v11);
  uint64_t v4 = (void *)*((void *)this + 25);
  if (v4)
  {
    *((void *)this + 26) = v4;
    operator delete(v4);
  }
  int64_t v5 = (void *)*((void *)this + 22);
  if (v5)
  {
    *((void *)this + 23) = v5;
    operator delete(v5);
  }
  std::vector<unsigned int>::size_type v6 = (void *)*((void *)this + 19);
  if (v6)
  {
    *((void *)this + 20) = v6;
    operator delete(v6);
  }
  long long v7 = (void *)*((void *)this + 16);
  if (v7)
  {
    *((void *)this + 17) = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)*((void *)this + 13);
  if (v8)
  {
    *((void *)this + 14) = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)*((void *)this + 10);
  if (v9)
  {
    *((void *)this + 11) = v9;
    operator delete(v9);
  }
  long long v10 = (void *)*((void *)this + 7);
  if (v10)
  {
    *((void *)this + 8) = v10;
    operator delete(v10);
  }
}

{
  uint64_t vars8;

  OpenTypeReorderingOutput::~OpenTypeReorderingOutput(this);

  JUMPOUT(0x1853275C0);
}

uint64_t OpenTypeReorderingOutput::finalizeOutput(OpenTypeReorderingOutput *this)
{
  int64_t v2 = (uint64_t)(*((void *)this + 8) - *((void *)this + 7)) >> 2;
  uint64_t v3 = *((void *)this + 29) - *((void *)this + 28);
  int64_t v4 = v3 >> 2;
  std::vector<unsigned short>::resize((uint64_t)this + 152, v2);
  std::vector<unsigned int>::resize((std::vector<unsigned int> *)((char *)this + 176), v2);
  std::vector<CGSize>::resize((uint64_t)this + 200, v2);
  if (v3 >= 1)
  {
    std::vector<unsigned short>::resize((uint64_t)this + 384, v3 >> 2);
    std::vector<CGSize>::resize((uint64_t)this + 408, v3 >> 2);
  }
  uint64_t v5 = TRunGlue::length(*((TRunGlue **)this + 1));
  if (v5 >= v2) {
    uint64_t v6 = v2;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v9 = (TRunGlue *)*((void *)this + 1);
      *(_WORD *)(*((void *)this + 19) + 2 * i) = TRunGlue::GetGlyphID(v9, i);
      *(_DWORD *)(*((void *)this + 22) + 4 * i) = TRunGlue::GetGlyphProps(v9, i);
      double Advance = TRunGlue::GetAdvance(v9, i);
      uint64_t v11 = *((void *)this + 25) + v7;
      *(double *)uint64_t v11 = Advance;
      *(void *)(v11 + 8) = v12;
      v7 += 16;
    }
  }
  uint64_t v13 = *(const TFont **)(*((void *)this + 1) + 616);
  GetGlyphsForLongCharacters(v13, *((const unsigned int **)this + 28), *((unsigned __int16 **)this + 48), v4);
  TFont::GetUnsummedAdvancesForGlyphs((uint64_t)v13, *((void *)this + 48), *((double **)this + 51), 2, v4, 0, 0);
  return v4;
}

void std::vector<unsigned int>::resize(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __sz)
{
  std::vector<unsigned int>::size_type v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2) {
      this->__end_ = &this->__begin_[__sz];
    }
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v2);
  }
}

uint64_t OpenTypeReorderingOutput::getInsertedIndex(OpenTypeReorderingOutput *this, int a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v8 = (char *)*((void *)this + 28);
    uint64_t v9 = (char *)*((void *)this + 29);
    uint64_t v10 = (v9 - v8) >> 2;
    unint64_t v11 = *((void *)this + 30);
    if ((unint64_t)v9 >= v11)
    {
      if ((unint64_t)(v10 + 1) >> 62) {
        goto LABEL_50;
      }
      unint64_t v13 = v11 - (void)v8;
      unint64_t v14 = (uint64_t)(v11 - (void)v8) >> 1;
      if (v14 <= v10 + 1) {
        unint64_t v14 = v10 + 1;
      }
      if (v13 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      if (v15)
      {
        uint64_t v16 = (char *)*((void *)this + 35);
        uint64_t v17 = &v16[4 * v15];
        if (v17 <= (char *)this + 280)
        {
          *((void *)this + 35) = v17;
        }
        else
        {
          if (v15 >> 62) {
            goto LABEL_51;
          }
          uint64_t v16 = (char *)operator new(4 * v15);
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      uint64_t v18 = &v16[4 * v10];
      *(_DWORD *)uint64_t v18 = a2;
      uint64_t v19 = v18;
      while (v9 != v8)
      {
        int v20 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v19 - 1) = v20;
        v19 -= 4;
      }
      uint64_t v12 = v18 + 4;
      *((void *)this + 28) = v19;
      *((void *)this + 29) = v18 + 4;
      *((void *)this + 30) = &v16[4 * v15];
      if (v8)
      {
        if ((char *)this + 248 > v8 || (uint64_t v21 = (void **)((char *)this + 280), (char *)this + 280 <= v8))
        {
          operator delete(v8);
        }
        else if (&v8[v13] == *v21)
        {
          const __CTFontDescriptor *v21 = v8;
        }
      }
    }
    else
    {
      *(_DWORD *)uint64_t v9 = a2;
      uint64_t v12 = v9 + 4;
    }
    *((void *)this + 29) = v12;
    uint64_t v23 = (char *)*((void *)this + 37);
    unint64_t v22 = *((void *)this + 38);
    if ((unint64_t)v23 < v22)
    {
      *(void *)uint64_t v23 = a3;
      uint64_t v24 = v23 + 8;
LABEL_48:
      *((void *)this + 37) = v24;
      return v10 | a4;
    }
    long long v25 = (char *)*((void *)this + 36);
    uint64_t v26 = (v23 - v25) >> 3;
    if (!((unint64_t)(v26 + 1) >> 61))
    {
      unint64_t v27 = v22 - (void)v25;
      unint64_t v28 = (uint64_t)(v22 - (void)v25) >> 2;
      if (v28 <= v26 + 1) {
        unint64_t v28 = v26 + 1;
      }
      if (v27 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v28;
      }
      if (!v29)
      {
        CFStringRef v30 = 0;
        goto LABEL_39;
      }
      CFStringRef v30 = (char *)*((void *)this + 47);
      uint64_t v31 = &v30[8 * v29];
      if (v31 <= (char *)this + 376)
      {
        *((void *)this + 47) = v31;
        goto LABEL_39;
      }
      if (!(v29 >> 61))
      {
        CFStringRef v30 = (char *)operator new(8 * v29);
LABEL_39:
        CFIndex v32 = &v30[8 * v26];
        *(void *)CFIndex v32 = a3;
        uint64_t v33 = v32;
        while (v23 != v25)
        {
          uint64_t v34 = *((void *)v23 - 1);
          v23 -= 8;
          *((void *)v33 - 1) = v34;
          v33 -= 8;
        }
        uint64_t v24 = v32 + 8;
        *((void *)this + 36) = v33;
        *((void *)this + 37) = v32 + 8;
        *((void *)this + 38) = &v30[8 * v29];
        if (v25)
        {
          if ((char *)this + 312 > v25 || (double v35 = (void **)((char *)this + 376), (char *)this + 376 <= v25))
          {
            operator delete(v25);
          }
          else if (&v25[v27] == *v35)
          {
            int *v35 = v25;
          }
        }
        goto LABEL_48;
      }
LABEL_51:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_50:
    abort();
  }
  return a3;
}

uint64_t OpenTypeReorderingOutput::reset(uint64_t this, uint64_t a2)
{
  *(void *)(this + 24) = a2;
  *(_DWORD *)(this + 32) = 0;
  return this;
}

void std::vector<unsigned int,TInlineBufferAllocator<unsigned int,8ul>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  unint64_t v1 = *a1;
  std::vector<unsigned int>::size_type v2 = (void **)**a1;
  if (v2)
  {
    v1[1] = v2;
    uint64_t v3 = v1 + 7;
    if (v1 + 3 <= v2)
    {
      BOOL v4 = v3 >= v2;
      BOOL v5 = v3 == v2;
    }
    else
    {
      BOOL v4 = 0;
      BOOL v5 = 0;
    }
    if (!v5 && v4)
    {
      if (v1[2] == v1[7]) {
        *uint64_t v3 = v2;
      }
    }
    else
    {
      operator delete(v2);
    }
  }
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  BOOL v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    std::vector<unsigned int>::pointer begin = this->__begin_;
    uint64_t v9 = (char *)end - (char *)this->__begin_;
    unint64_t v10 = __n + (v9 >> 2);
    if (v10 >> 62) {
      abort();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)p_end_cap, v13);
      std::vector<unsigned int>::pointer begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      unint64_t v14 = 0;
    }
    unint64_t v15 = &v14[4 * v11];
    uint64_t v16 = (unsigned int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    uint64_t v17 = (unsigned int *)&v15[4 * __n];
    while (end != begin)
    {
      int v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void OpenTypeShapingEngine::OpenTypeShapingEngine(OpenTypeShapingEngine *this, const TCharStream *a2, TRunGlue *a3)
{
  *(void *)this = &unk_1ED05EB30;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = a2;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((void *)this + 22) = (char *)this + 56;
  *((void *)this + 24) = 0;
  *((void *)this + 23) = (char *)this + 192;
  BOOL v4 = (uint64_t **)((char *)this + 184);
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  BOOL v5 = (void *)((char *)this + 208);
  *((void *)this + 27) = 0;
  *((void *)this + 28) = 0;
  *((void *)this + 59) = (char *)this + 232;
  uint64_t v6 = *((void *)a3 + 5);
  if (v6 == -1)
  {
    TRunGlue::ComputeEndIndex(a3);
    uint64_t v6 = *((void *)a3 + 5);
    a2 = (const TCharStream *)*((void *)this + 2);
  }
  *((void *)this + 60) = v6;
  *((unsigned char *)this + 488) = 0;
  if (a2)
  {
    *((unsigned char *)this + 488) = TRunGlue::FilterSurrogates(*((TRunGlue **)this + 1), (uint64_t)a2, 0);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v8 = (TRunGlue *)*((void *)this + 1);
    uint64_t v17 = *((void *)this + 2);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v29 = 0;
    *(void *)&long long v28 = *(void *)(v17 + 16);
    unint64_t v9 = TRunGlue::length(v8);
    std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::resize((uint64_t)this + 32, v9);
    std::vector<long,TInlineBufferAllocator<long,30ul>>::resize((uint64_t)v5, v9);
    unint64_t v10 = (TRunGlue *)*((void *)this + 1);
    uint64_t v11 = TRunGlue::length(v10);
    if (v11)
    {
      uint64_t v12 = v11;
      for (uint64_t i = 0; i != v12; ++i)
      {
        uint64_t StringIndex = TRunGlue::GetStringIndex(v10, i);
        uint64_t v16 = StringIndex;
        if (*((unsigned char *)this + 488))
        {
          uint64_t v15 = StringIndex - *((void *)this + 60);
          CFStringRef v30 = &v15;
          std::__tree<std::__value_type<long,long>,std::__map_value_compare<long,std::__value_type<long,long>,std::less<long>,true>,std::allocator<std::__value_type<long,long>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>(v4, &v15, (uint64_t)&std::piecewise_construct, &v30)[5] = i;
        }
        *(void *)(*v5 + 8 * i) = i;
        *(_DWORD *)(*((void *)this + 4) + 4 * i) = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v17, &v16, 0);
      }
    }
  }
}

void OpenTypeShapingEngine::~OpenTypeShapingEngine(OpenTypeShapingEngine *this)
{
  *(void *)this = &unk_1ED05EB30;
  std::vector<unsigned int>::size_type v2 = (void **)((char *)this + 208);
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100](&v2);
  std::__tree<std::__value_type<long,TAATDeltaYListEntry>,std::__map_value_compare<long,std::__value_type<long,TAATDeltaYListEntry>,std::less<long>,true>,std::allocator<std::__value_type<long,TAATDeltaYListEntry>>>::destroy((uint64_t)this + 184, *((void **)this + 24));
  std::vector<unsigned int>::size_type v2 = (void **)((char *)this + 32);
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100](&v2);
}

uint64_t OpenTypeShapingEngine::ApplyScriptShaping(OpenTypeShapingEngine *this, unsigned int *a2)
{
  uint64_t v3 = (TRunGlue *)*((void *)this + 1);
  if ((*((_DWORD *)v3 + 6) & 0x80000000) != 0
    || *((void *)this + 4) == *((void *)this + 5)
    || *((void *)this + 26) == *((void *)this + 27))
  {
    char v9 = 0;
    return v9 & 1;
  }
  int64_t v5 = TRunGlue::length(v3);
  uint64_t v6 = *(void *)(*((void *)this + 1) + 104);
  *((void *)this + 3) = v6;
  std::vector<TGlyphAuxDataListEntry,TInlineBufferAllocator<TGlyphAuxDataListEntry,30ul>>::resize(v6, v5);
  unsigned __int16 v56 = (OpenTypeReorderingOutput *)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(OpenTypeReorderingOutput **__return_ptr, OpenTypeShapingEngine *, unsigned int *))(*(void *)this + 16))(&v56, this, a2);
  OpenTypeReorderingOutput::finalizeOutput(v56);
  uint64_t v7 = v56;
  uint64_t v8 = *((void *)v56 + 8) - *((void *)v56 + 7);
  if (v8 >> 2 < v5)
  {
    char v9 = 0;
    CFIndex v11 = 0;
    uint64_t v49 = *((void *)this + 1);
    goto LABEL_72;
  }
  if (v8 < 1)
  {
    char v9 = 0;
    goto LABEL_65;
  }
  char v9 = 0;
  uint64_t v10 = 0;
  CFIndex v11 = 0;
  if (v8 >> 2 <= 1) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = v8 >> 2;
  }
  uint64_t v55 = v12;
  while (1)
  {
    uint64_t v13 = *((void *)v7 + 10);
    if (v11 >= (unint64_t)((*((void *)v7 + 11) - v13) >> 3))
    {
      uint64_t v14 = -1;
    }
    else
    {
      uint64_t v14 = *(void *)(v13 + 8 * v11);
      if ((unint64_t)v14 >> 61)
      {
        uint64_t v16 = (char *)v7 + 288;
        uint64_t v15 = *((void *)v7 + 36);
        if ((v14 & 0x1FFFFFFFFFFFFFFFuLL) < (*((void *)v16 + 1) - v15) >> 3) {
          uint64_t v14 = *(void *)(v15 + 8 * v14);
        }
      }
    }
    if (v14 >= v5) {
      break;
    }
    uint64_t v17 = *(void *)(*((void *)this + 26) + 8 * v14);
    uint64_t StringIndex = TRunGlue::GetStringIndex(*((TRunGlue **)this + 1), v17);
    unint64_t v19 = *(void *)(*((void *)v56 + 10) + 8 * v11);
    if ((v19 & 0x8000000000000000) != 0)
    {
      int GlyphProps = TRunGlue::GetGlyphProps(*((TRunGlue **)this + 1), v17);
      uint64_t v21 = *(void *)(*((void *)v56 + 10) + 8 * v11);
      v57.location = v11;
      v57.length = 1;
      TRunGlue::InsertGlyphs(*((TRunGlue **)this + 1), v57);
      long long v22 = (TRunGlue *)*((void *)this + 1);
      uint64_t v23 = *((void *)v22 + 19);
      if (v23) {
        *(_DWORD *)(v23 + 256) = 2;
      }
      uint64_t v24 = v10++;
      if ((v21 & 0x2000000000000000) != 0)
      {
        if (v11 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v11;
        }
        uint64_t v26 = v25 - 1;
        if ((TRunGlue::GetGlyphProps(v22, v25 - 1) & 0x300) == 0)
        {
          uint64_t v27 = GlyphProps | 0x80u;
          goto LABEL_34;
        }
      }
      else
      {
        int v54 = GlyphProps;
        int64_t v28 = v5;
        CFIndex v29 = v10 + v5;
        uint64_t v26 = v11;
        if (v11 + 1 >= v29)
        {
          int64_t v5 = v28;
          uint64_t v26 = v24 + v28;
        }
        else
        {
          do
          {
            uint64_t v30 = TRunGlue::GetStringIndex(*((TRunGlue **)this + 1), v26 + 1);
            uint64_t v31 = v26 + 2;
            ++v26;
          }
          while (v30 != StringIndex && v31 < v29);
          long long v22 = (TRunGlue *)*((void *)this + 1);
          int64_t v5 = v28;
        }
        uint64_t v27 = v54 | 0x80u;
LABEL_34:
        TRunGlue::SetGlyphProps(v22, v26, v27);
      }
      OpenTypeShapingEngine::AdjustIndices((uint64_t *)this, v11 + 1, v10 + v5);
      char v9 = 1;
      uint64_t v12 = v55;
      goto LABEL_36;
    }
    if (v17 > v11)
    {
      TRunGlue::Rotate(*((TRunGlue **)this + 1), v11, v17, v17 + 1, 0);
      OpenTypeShapingEngine::AdjustIndices((uint64_t *)this, v11 + 1, v17 + 1);
      char v9 = 1;
    }
LABEL_36:
    uint64_t v33 = (TRunGlue *)*((void *)this + 1);
    if (!(v19 >> 61))
    {
      if (v11 == v17) {
        TRunGlue::ClearGlyphCombiningMark(*((void **)this + 1), v11);
      }
      goto LABEL_59;
    }
    uint64_t v34 = TRunGlue::GetGlyphProps(*((TRunGlue **)this + 1), v11);
    if ((v34 & 0x80) == 0)
    {
      double v35 = v56;
LABEL_39:
      unint64_t v36 = *(void *)(*((void *)v35 + 10) + 8 * v11);
      unint64_t v37 = v36 >> 61;
      if (v36 >> 61)
      {
        uint64_t v39 = *((void *)v35 + 36);
        if ((v36 & 0x1FFFFFFFFFFFFFFFLL) < (*((void *)v35 + 37) - v39) >> 3) {
          unint64_t v36 = *(void *)(v39 + 8 * v36);
        }
        LODWORD(v37) = 512;
        int v38 = -129;
      }
      else
      {
        int v38 = -1;
      }
      TRunGlue::SetGlyphProps(v33, v11, v37 | v34 & 0xFF0000 | *(_DWORD *)(*((void *)v35 + 22) + 4 * v36) & v38);
      goto LABEL_50;
    }
    if ((v19 & 0x8000000000000000) != 0)
    {
      double v35 = v56;
      if (*(_DWORD *)(*((void *)v56 + 7) + 4 * v11) == 9676) {
        goto LABEL_39;
      }
    }
LABEL_50:
    TRunGlue::SetStringIndex(v33, v11, StringIndex);
    TRunGlue::SetAttachmentCount(v33, v11, (*(_DWORD *)(*((void *)v56 + 7) + 4 * v11) - 0x10000) < 0x100000);
    unint64_t v40 = *(void *)(*((void *)v56 + 10) + 8 * v11);
    if (v40 >> 61 && (v40 & 0x1FFFFFFFFFFFFFFFLL) < (uint64_t)(*((void *)v56 + 29) - *((void *)v56 + 28)) >> 2)
    {
      long long v41 = (char *)v56 + 384;
      v40 &= 0x1FFFFFFFFFFFFFFFuLL;
    }
    else
    {
      long long v41 = (char *)v56 + 152;
    }
    TRunGlue::SetGlyphID<true>(v33, v11, *(unsigned __int16 *)(*(void *)v41 + 2 * v40));
    unint64_t v42 = *(void *)(*((void *)v56 + 10) + 8 * v11);
    if (v42 >> 61 && (v42 & 0x1FFFFFFFFFFFFFFFLL) < (uint64_t)(*((void *)v56 + 29) - *((void *)v56 + 28)) >> 2)
    {
      id v43 = (char *)v56 + 408;
      v42 &= 0x1FFFFFFFFFFFFFFFuLL;
    }
    else
    {
      id v43 = (char *)v56 + 200;
    }
    TRunGlue::SetAdvance(v33, v11, *(CGSize *)(*(void *)v43 + 16 * v42));
    TRunGlue::SetOrigin(v33, v11, *MEMORY[0x1E4F1DAD8]);
LABEL_59:
    id v44 = (uint64_t *)(*((void *)v56 + 16) + 16 * v11);
    uint64_t v45 = *v44;
    uint64_t v46 = **((void **)v33 + 13) + 16 * v11;
    *(void *)uint64_t v46 = v44[1];
    uint64_t v7 = v56;
    *(_DWORD *)(v46 + 8) = *(_DWORD *)(*((void *)v56 + 13) + 4 * v11);
    *(_DWORD *)(v46 + 12) = v45;
    if (++v11 == v12) {
      goto LABEL_65;
    }
  }
  uint64_t v49 = *((void *)this + 1);
  if (v9)
  {
    uint64_t v50 = *(void *)(v49 + 152);
    if (v50) {
      *(_DWORD *)(v50 + 256) = 2;
    }
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
  }
LABEL_72:
  uint64_t v51 = TRunGlue::length((TRunGlue *)v49);
  uint64_t v52 = v51 - v11;
  if (v51 > v11)
  {
    uint64_t v53 = (void *)(**(void **)(v49 + 104) + 16 * v11);
    do
    {
      void *v53 = 0;
      v53 += 2;
      --v52;
    }
    while (v52);
  }
LABEL_65:
  id v48 = v56;
  unsigned __int16 v56 = 0;
  if (v48) {
    (*(void (**)(OpenTypeReorderingOutput *))(*(void *)v48 + 8))(v48);
  }
  return v9 & 1;
}

uint64_t *OpenTypeShapingEngine::AdjustIndices(uint64_t *this, uint64_t a2, uint64_t a3)
{
  if (a2 < a3)
  {
    uint64_t v4 = a2;
    uint64_t v5 = (uint64_t)this;
    uint64_t v6 = (uint64_t **)(this + 23);
    uint64_t v7 = (uint64_t **)(this + 24);
    do
    {
      this = (uint64_t *)TRunGlue::GetStringIndex(*(TRunGlue **)(v5 + 8), v4);
      uint64_t v8 = (uint64_t)this - *(void *)(v5 + 480);
      if (*(unsigned char *)(v5 + 488))
      {
        char v9 = *v7;
        uint64_t v10 = v7;
        CFIndex v11 = v7;
        if (*v7)
        {
          while (1)
          {
            while (1)
            {
              CFIndex v11 = (uint64_t **)v9;
              uint64_t v12 = v9[4];
              if (v12 <= v8) {
                break;
              }
              char v9 = *v11;
              uint64_t v10 = v11;
              if (!*v11) {
                goto LABEL_11;
              }
            }
            if (v12 >= v8) {
              break;
            }
            char v9 = v11[1];
            if (!v9)
            {
              uint64_t v10 = v11 + 1;
              goto LABEL_11;
            }
          }
        }
        else
        {
LABEL_11:
          uint64_t v13 = (uint64_t *)operator new(0x30uLL);
          v13[4] = v8;
          v13[5] = 0;
          this = std::__tree<std::__value_type<long,TAATDeltaYListEntry>,std::__map_value_compare<long,std::__value_type<long,TAATDeltaYListEntry>,std::less<long>,true>,std::allocator<std::__value_type<long,TAATDeltaYListEntry>>>::__insert_node_at(v6, (uint64_t)v11, v10, v13);
          CFIndex v11 = (uint64_t **)v13;
        }
        uint64_t v8 = (uint64_t)v11[5];
      }
      ++*(void *)(*(void *)(v5 + 208) + 8 * v8);
      ++v4;
    }
    while (v4 != a3);
  }
  return this;
}

uint64_t OpenTypeShapingEngine::SetSafeToBreakAfterEachSyllable(uint64_t this)
{
  unint64_t v1 = *(uint64_t **)(this + 24);
  if (v1)
  {
    uint64_t v2 = this;
    if (*(void *)(*(void *)(this + 8) + 152))
    {
      uint64_t v3 = *v1;
      if (*v1)
      {
        uint64_t v4 = v1[1];
        uint64_t v5 = (v4 - v3) >> 4;
        if (v4 - v3 < 1)
        {
          v6.location = 0;
        }
        else
        {
          v6.location = 0;
          CFIndex v7 = 0;
          CFIndex v8 = 0;
          do
          {
            char v9 = (int *)(v3 + 28 + 16 * v7);
            while (++v8 < v5)
            {
              int v10 = *v9;
              v9 += 4;
              if (v10 != *(_DWORD *)(v3 + 16 * v7 + 12))
              {
                v6.length = v8 - v6.location;
                this = TRunGlue::ClearSafeToBreakAfter(*(void *)(v2 + 8), v6);
                v6.location = v8;
                goto LABEL_11;
              }
            }
            CFIndex v8 = v7 + 1;
LABEL_11:
            CFIndex v7 = v8;
          }
          while (v8 < v5);
        }
        if (v4 != v3)
        {
          uint64_t v11 = *(void *)(v2 + 8);
          v6.length = v5 - v6.location;
          return TRunGlue::ClearSafeToBreakAfter(v11, v6);
        }
      }
    }
  }
  return this;
}

uint64_t *std::__tree<std::__value_type<long,long>,std::__map_value_compare<long,std::__value_type<long,long>,std::less<long>,true>,std::allocator<std::__value_type<long,long>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  CFIndex v7 = a1 + 1;
  CFRange v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        char v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        CFRange v6 = *v9;
        CFIndex v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      CFRange v6 = v9[1];
      if (!v6)
      {
        CFIndex v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    char v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<long,TAATDeltaYListEntry>,std::__map_value_compare<long,std::__value_type<long,TAATDeltaYListEntry>,std::less<long>,true>,std::allocator<std::__value_type<long,TAATDeltaYListEntry>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void OpenTypeClassTable::AddShapingGlyphs(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(unsigned __int16 *)(a1 + 8);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 10) - v6;
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[2] = v8;
  v16[3] = v8;
  v16[0] = v8;
  v16[1] = v8;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  uint64_t v17 = v16;
  if (v7 != -1)
  {
    std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__vallocate[abi:nn180100](&v13, v7 + 1);
    char v9 = (char *)v14;
    bzero(v14, 2 * v7 + 2);
    uint64_t v14 = &v9[2 * v7 + 2];
    uint64_t v5 = v13;
  }
  (*(void (**)(void, uint64_t, uint64_t, __int16 *))(**(void **)(a2 + 400) + 672))(*(void *)(a2 + 400), v6, v7 + 1, v5);
  uint64_t v10 = v13;
  uint64_t v11 = (__int16 *)v14;
  while (v10 != v11)
  {
    if (*v10) {
      std::function<void ()(unsigned short,unsigned short)>::operator()(a3, *v10, *v10);
    }
    ++v10;
  }
  uint64_t v12 = &v13;
  std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
}

void TRubyAnnotation::TRubyAnnotation(TRubyAnnotation *this, CTRubyAlignment a2, CTRubyOverhang a3, CTRubyPosition a4, __CFString *a5, id a6)
{
  *(unsigned char *)this = a2;
  *((unsigned char *)this + 1) = a3;
  *((void *)this + 1) = 0x3FE0000000000000;
  *((unsigned char *)this + ++*(void *)(this + 48) = a4;
  *((void *)this + 7) = 0;
  uint64_t v8 = 0;
  *((void *)this + 8) = a6;
  *((_WORD *)this + 36) = 256;
  do
  {
    if (v8 == *((unsigned __int8 *)this + 48)) {
      CFStringRef v9 = a5;
    }
    else {
      CFStringRef v9 = 0;
    }
    *((void *)this + v8++ + 2) = v9;
  }
  while (v8 != 4);
  TRubyAnnotation::SetExtrasForTextAttributes((atomic_ullong *)this);
}

void TRubyAnnotation::SetExtrasForTextAttributes(atomic_ullong *this)
{
  CFDictionaryRef v2 = (const __CFDictionary *)(id)atomic_load_explicit(this + 8, memory_order_acquire);
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"CTRubyAnnotationSizeFactor");

    if (Value) {
      CFNumberGetValue(Value, kCFNumberDoubleType, this + 1);
    }
  }
  else
  {
  }
  CFDictionaryRef v5 = (const __CFDictionary *)(id)atomic_load_explicit(this + 8, memory_order_acquire);
  if (v5)
  {
    CFDictionaryRef v6 = v5;
    CFBooleanRef v7 = (const __CFBoolean *)CFDictionaryGetValue(v5, @"CTRubyAnnotationScaleToFit");

    if (v7) {
      *((unsigned char *)this + 72) = CFBooleanGetValue(v7) != 0;
    }
  }
  else
  {
  }
  CFDictionaryRef v8 = (const __CFDictionary *)(id)atomic_load_explicit(this + 8, memory_order_acquire);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    CFBooleanRef v10 = (const __CFBoolean *)CFDictionaryGetValue(v8, @"CTRubyAnnotationDrawBaseText");

    if (v10) {
      *((unsigned char *)this + 73) = CFBooleanGetValue(v10) != 0;
    }
  }
  else
  {
  }
}

void TRubyAnnotation::TRubyAnnotation(TRubyAnnotation *this, CTRubyAlignment a2, CTRubyOverhang a3, CTRubyPosition a4, id a5)
{
  *(unsigned char *)this = a2;
  *((unsigned char *)this + 1) = a3;
  *((void *)this + 1) = 0x3FE0000000000000;
  *((unsigned char *)this + ++*(void *)(this + 48) = a4;
  *((void *)this + 7) = a5;
  *((void *)this + 8) = CFAttributedStringGetAttributes((CFAttributedStringRef)a5, 0, 0);
  *((_WORD *)this + 36) = 256;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  TRubyAnnotation::SetExtrasForTextAttributes((atomic_ullong *)this);
}

void TRubyAnnotation::TRubyAnnotation(TRubyAnnotation *this, CFTypeRef cf)
{
  *(_WORD *)this = 0;
  *((void *)this + 1) = 0x3FE0000000000000;
  *((unsigned char *)this + ++*(void *)(this + 48) = 0;
  *((void *)this + 7) = 0;
  uint64_t v4 = (atomic_ullong *)((char *)this + 56);
  *((void *)this + 8) = 0;
  *((_WORD *)this + 36) = 256;
  CFTypeID v5 = CFGetTypeID(cf);
  if (v5 == CTRubyAnnotationGetTypeID())
  {
    uint64_t v6 = *((void *)cf + 5);
    *(_WORD *)this = *(_WORD *)v6;
    *((void *)this + 1) = *(void *)(v6 + 8);
    *((unsigned char *)this + ++*(void *)(this + 48) = *(unsigned char *)(v6 + 48);
    TCFRef<__CTFont const*>::Retain(v4, (id)atomic_load_explicit((atomic_ullong *volatile)(v6 + 56), memory_order_acquire));
    TCFRef<__CTFont const*>::Retain((atomic_ullong *)this + 8, (id)atomic_load_explicit((atomic_ullong *volatile)(v6 + 64), memory_order_acquire));
    uint64_t v7 = 0;
    *((_WORD *)this + 36) = *(_WORD *)(v6 + 72);
    do
    {
      *(void *)((char *)this + v7 + 16) = *(id *)(v6 + 16 + v7);
      v7 += 8;
    }
    while (v7 != 32);
  }
  else
  {
    *((_OWORD *)this + 1) = 0u;
    *((_OWORD *)this + 2) = 0u;
  }
}

void TRubyAnnotation::TRubyAnnotation(TRubyAnnotation *this, const TRubyAnnotation *a2)
{
  *(_WORD *)this = *(_WORD *)a2;
  *((void *)this + 1) = *((void *)a2 + 1);
  *((unsigned char *)this + ++*(void *)(this + 48) = *((unsigned char *)a2 + 48);
  *((void *)this + 7) = (id)atomic_load_explicit((atomic_ullong *volatile)a2 + 7, memory_order_acquire);
  *((void *)this + 8) = (id)atomic_load_explicit((atomic_ullong *volatile)a2 + 8, memory_order_acquire);
  *((_WORD *)this + 36) = *((_WORD *)a2 + 36);
  for (uint64_t i = 16; i != 48; i += 8)
    *(void *)((char *)this + i) = *(id *)((char *)a2 + i);
}

void TRubyAnnotation::~TRubyAnnotation(id *this)
{
  for (uint64_t i = 2; i != 6; ++i)
}

CFHashCode TRubyAnnotation::Hash(TRubyAnnotation *this)
{
  uint64_t v2 = 0;
  uint64_t v4 = *((void *)this + 1) + 2654435769;
  if (*((double *)this + 1) == 0.0) {
    uint64_t v4 = 2654435769;
  }
  unint64_t v3 = (*((unsigned __int8 *)this + 1)
      + ((*(unsigned __int8 *)this + 2654435769) << 6)
      + (((unint64_t)*(unsigned __int8 *)this + 2654435769u) >> 2)
      + 2654435769u) ^ (*(unsigned __int8 *)this + 2654435769);
  unint64_t v5 = (v4 + (v3 << 6) + (v3 >> 2)) ^ v3;
  uint64_t v6 = (char *)this + 16;
  do
  {
    uint64_t v7 = *(const void **)&v6[v2];
    if (v7) {
      v5 ^= (v5 << 6) + 2654435769u + (v5 >> 2) + CFHash(v7);
    }
    v2 += 8;
  }
  while (v2 != 32);
  CFDictionaryRef v8 = (atomic_ullong *)((char *)this + 56);
  if (atomic_load_explicit((atomic_ullong *volatile)this + 7, memory_order_acquire)
    || (CFDictionaryRef v8 = (atomic_ullong *)((char *)this + 64),
        atomic_load_explicit((atomic_ullong *volatile)this + 8, memory_order_acquire)))
  {
    unint64_t v9 = ((v5 << 6) + 2654435769u + (v5 >> 2) + *((unsigned __int8 *)this + 48)) ^ v5;
    return (CFHash((CFTypeRef)atomic_load_explicit(v8, memory_order_acquire)) + 2654435769u + (v9 << 6) + (v9 >> 2)) ^ v9;
  }
  return v5;
}

void ThaiClassTable::~ThaiClassTable(ThaiClassTable *this)
{
}

void ThaiShapingEngine::SetFeatures(ThaiShapingEngine *this, unsigned int *a2)
{
  *a2 = 0;
  operator new();
}

uint64_t *ThaiShapingEngine::GetClassTable(ThaiShapingEngine *this)
{
  return &GetThaiClassTable(void)::thaiClassTable;
}

uint64_t *GetThaiClassTable(void)
{
  {
    qword_1E8F8ABA8 = 243207680;
    unk_1E8F8ABB0 = &thaiCharClasses;
    GetThaiClassTable(void)::thaiClassTable = (uint64_t)&unk_1ED05E440;
    dword_1E8F8ABB8 = 238161485;
  }
  return &GetThaiClassTable(void)::thaiClassTable;
}

void ThaiShapingEngine::~ThaiShapingEngine(ThaiShapingEngine *this)
{
  OpenTypeShapingEngine::~OpenTypeShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

unint64_t CTCreatePathMaskedByLines(const CGPath *a1, const __CFArray *a2, uint64_t a3, CGFloat a4)
{
  if (!a3) {
    return 0;
  }
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(a1, 0, a4, kCGLineCapButt, kCGLineJoinMiter, 10.0);
  id Mutable = CGPathCreateMutable();
  CFIndex Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    CFIndex v10 = Count;
    CFIndex v11 = 0;
    uint64_t v12 = (double *)(a3 + 8);
    do
    {
      uint64_t v13 = (TLine *)*((void *)CFArrayGetValueAtIndex(a2, v11) + 5);
      CGFloat v14 = *(v12 - 1);
      CGFloat v15 = *v12;
      *(void *)&long long v16 = -1;
      *((void *)&v16 + 1) = -1;
      *(_OWORD *)&m.c = v16;
      *(_OWORD *)&m.tx = v16;
      *(_OWORD *)&m.a = v16;
      CGAffineTransformMakeTranslation(&m, v14, v15);
      TLine::CopyPath(v13, &v19);
      CGPathAddPath(Mutable, &m, (CGPathRef)atomic_load_explicit((atomic_ullong *volatile)&v19, memory_order_acquire));

      ++v11;
      v12 += 2;
    }
    while (v10 != v11);
  }
  m.a = -3.72066208e-103;
  CreateMaskedPath(CopyByStrokingPath, Mutable, a4, 0, 0, &m);
  unint64_t v17 = atomic_exchange((atomic_ullong *volatile)&m, 0);

  return v17;
}

uint64_t *LaoShapingEngine::GetClassTable(LaoShapingEngine *this)
{
  return &GetLaoClassTable(void)::laoClassTable;
}

uint64_t *GetLaoClassTable(void)
{
  {
    qword_1E8F8AAB0 = 251596416;
    unk_1E8F8AAB8 = &laoCharClasses;
    GetLaoClassTable(void)::laoClassTable = (uint64_t)&unk_1ED05E440;
    dword_1E8F8AAC0 = 246550221;
  }
  return &GetLaoClassTable(void)::laoClassTable;
}

void LaoShapingEngine::~LaoShapingEngine(LaoShapingEngine *this)
{
  OpenTypeShapingEngine::~OpenTypeShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

double KhmerShapingEngine::GetPresentationFeatures(KhmerShapingEngine *this, char *a2, uint64_t (**a3)(KhmerShapingEngine *this))
{
  strcpy(a2, "serpswlbsvbastspgilc");
  *(void *)&double result = 1668049255;
  a2[21] = 0;
  *((_WORD *)a2 + 11) = 0;
  *a3 = KhmerShapingEngine::IsRequiredPresentationFeature;
  return result;
}

uint64_t KhmerShapingEngine::IsRequiredPresentationFeature(KhmerShapingEngine *this)
{
  return 1;
}

void KhmerShapingEngine::SetFeatures(KhmerShapingEngine *this, char *a2)
{
  a2[21] = 0;
  *((_WORD *)a2 + 11) = 0;
  operator new();
}

uint64_t *KhmerShapingEngine::GetClassTable(KhmerShapingEngine *this)
{
  return &GetKhmerClassTable(void)::khmerClassTable;
}

uint64_t *GetKhmerClassTable(void)
{
  {
    qword_1E8F8AD60 = 402593664;
    unk_1E8F8AD68 = &khmerCharClasses;
    GetKhmerClassTable(void)::khmerClassTable = (uint64_t)&unk_1ED05E488;
  }
  return &GetKhmerClassTable(void)::khmerClassTable;
}

void KhmerShapingEngine::~KhmerShapingEngine(KhmerShapingEngine *this)
{
  OpenTypeShapingEngine::~OpenTypeShapingEngine(this);

  JUMPOUT(0x1853275C0);
}

void KhmerClassTable::~KhmerClassTable(KhmerClassTable *this)
{
}

uint64_t TPathProcessor::SortRangeInfo(TPathProcessor *this, double *a2, const void *a3)
{
  if (*(double *)this < *a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return *(double *)this > *a2;
  }
}

void TPathProcessor::SlicePathH(void *info, BOOL a2, uint64_t *a3, double a4, double a5)
{
  uint64_t v6 = *(const CGPath **)info;
  if (v6)
  {
    double v8 = a5;
    double v9 = a4;
    if (a4 >= a5)
    {
      a4 = a5;
      a5 = v9;
    }
    *((double *)info + 2) = a4;
    *((double *)info + 3) = a5;
    *((void *)info + 11) = 0;
    *((void *)info + 4) = 0;
    *((void *)info + 10) = *((void *)info + 1);
    CGPathApply(v6, info, (CGPathApplierFunction)TPathProcessor::ProcessPathElementApplier);
    uint64_t v11 = *a3;
    if (*a3 >= 1)
    {
      uint64_t v12 = 0;
      do
      {
        if (*a3 <= v12)
        {
          CFDictionaryRef explicit = 0;
        }
        else
        {
          *((void *)info + 10) = *(void *)(a3[10] + 8 * v12);
          CFDictionaryRef explicit = (const CGPath *)atomic_load_explicit((atomic_ullong *volatile)(a3[1] + 8 * v12), memory_order_acquire);
        }
        CGPathApply(explicit, info, (CGPathApplierFunction)TPathProcessor::ProcessPathElementApplier);
        ++v12;
      }
      while (v11 != v12);
    }
    size_t v14 = *((void *)info + 11);
    if (v14)
    {
      qsort(*((void **)info + 5), v14, 0x10uLL, (int (__cdecl *)(const void *, const void *))TPathProcessor::SortRangeInfo);
      uint64_t v15 = *((void *)info + 11);
      if (v15 < 2) {
        goto LABEL_32;
      }
      uint64_t v16 = 0;
      unint64_t v17 = (double *)*((void *)info + 5);
      uint64_t v18 = &v17[2 * v15];
      id v19 = v17 + 2;
      double v20 = v17[1];
      uint64_t v21 = v17;
      do
      {
        if (v20 >= *v19)
        {
          double v22 = v19[1];
          if (v20 >= v22) {
            double v22 = v20;
          }
        }
        else
        {
          double *v21 = v20;
          v21[1] = *v19;
          double v22 = v19[1];
          v21 += 2;
          ++v16;
        }
        v19 += 2;
        double v20 = v22;
      }
      while (v19 < v18);
      if (v16)
      {
        uint64_t v23 = 0;
        uint64_t v24 = 0;
        double v25 = (v9 + v8) * 0.5;
        uint64_t v26 = v17;
        do
        {
          double v27 = (*v17 + v17[1]) * 0.5;
          v31.x = v27;
          v31.y = v25;
          if (CGPathContainsPoint(*(CGPathRef *)info, 0, v31, a2))
          {
            if (v11 < 1)
            {
LABEL_27:
              if (v17 != v26) {
                *(_OWORD *)uint64_t v26 = *(_OWORD *)v17;
              }
              v26 += 2;
              ++v24;
            }
            else
            {
              uint64_t v28 = 0;
              while (1)
              {
                if (*a3 > v28)
                {
                  int v29 = *(_DWORD *)(a3[19] + 4 * v28);
                  uint64_t v30 = (const CGPath *)atomic_load_explicit((atomic_ullong *volatile)(a3[1] + 8 * v28), memory_order_acquire);
                  if (v30)
                  {
                    v32.x = v27;
                    v32.y = v25;
                    if (CGPathContainsPoint(v30, 0, v32, v29 == 0)) {
                      break;
                    }
                  }
                }
                if (v11 == ++v28) {
                  goto LABEL_27;
                }
              }
            }
          }
          v17 += 2;
          ++v23;
        }
        while (v23 != v16);
      }
      else
      {
LABEL_32:
        uint64_t v24 = 0;
      }
      *((void *)info + 4) = v24;
    }
  }
}

double *TPathProcessor::ProcessPathElementApplier(CGPoint *this, void *a2, CGPathElement *a3)
{
  uint64_t v4 = (CGPoint *)a2[1];
  switch(*(_DWORD *)a2)
  {
    case 0:
      this[4] = *v4;
      this[3] = *v4;
      break;
    case 1:
      TPathProcessor::RemoveRangeForLine((TPathProcessor *)this, this[4], *v4, (uint64_t)a2, (double *)a3);
      CGPoint v5 = *v4;
      goto LABEL_6;
    case 2:
      CGPoint v11 = this[4];
      double y = v4->y;
      CGPoint v14 = v4[1];
      v12.CGFloat x = (v11.x + v4->x * 2.0) / 3.0;
      v12.double y = (v11.y + y * 2.0) / 3.0;
      v13.CGFloat x = (v14.x + v4->x * 2.0) / 3.0;
      v13.double y = (v14.y + y * 2.0) / 3.0;
      TPathProcessor::RemoveRangeForCurve(&this->x, v11, v12, v13, v14, (uint64_t)a2, (double *)a3);
      CGPoint v5 = v4[1];
      goto LABEL_6;
    case 3:
      TPathProcessor::RemoveRangeForCurve(&this->x, this[4], *v4, v4[1], v4[2], (uint64_t)a2, (double *)a3);
      CGPoint v5 = v4[2];
LABEL_6:
      this[4] = v5;
      break;
    case 4:
      TPathProcessor::RemoveRangeForLine((TPathProcessor *)this, this[4], this[3], (uint64_t)a2, (double *)a3);
      break;
    default:
      break;
  }
  CGFloat x = this[4].x;
  CGFloat v8 = this[4].y;

  return TPathProcessor::RemoveRangeForPoint(&this->x, *(CGPoint *)&x);
}

uint64_t TPathProcessor::RemoveRangeForLine(TPathProcessor *this, CGPoint a2, CGPoint a3, uint64_t a4, double *a5)
{
  double y = a3.y;
  double x = a3.x;
  double v7 = a2.y;
  double v8 = a2.x;
  double v35 = -1.79769313e308;
  *(double *)&uint64_t v36 = 1.79769313e308;
  double v10 = *((double *)this + 10);
  if (v10 == 0.0)
  {
    double v11 = v8;
    uint64_t result = TPathProcessor::CalculateExcludeRange((TPathProcessor *)&v36, a2, a3, *((CGFloat *)this + 2), *((CGFloat *)this + 3), &v35, a5);
    if ((result & 1) == 0) {
      return result;
    }
  }
  else
  {
    double v13 = v10 * 0.5;
    double v14 = sqrt((a3.y - a2.y) * (a3.y - a2.y) + (a3.x - v8) * (a3.x - v8));
    double v15 = (y - a2.y) * v13 / v14;
    CGFloat v16 = -((a3.x - v8) * v13) / v14;
    v38.double x = v8 + v15;
    v38.double y = a2.y + v16;
    CGFloat v31 = v7 + v16;
    CGFloat v32 = v8 + v15;
    v42.double x = a3.x + v15;
    v42.double y = y + v16;
    CGFloat v33 = y + v16;
    CGFloat v34 = x + v15;
    CGFloat v17 = *((double *)this + 2);
    CGFloat v18 = *((double *)this + 3);
    int v19 = TPathProcessor::CalculateExcludeRange((TPathProcessor *)&v36, v38, v42, v17, v18, &v35, a5);
    CGFloat v20 = v8 - v15;
    CGFloat v21 = v7 - v16;
    CGFloat v22 = x - v15;
    CGFloat v23 = y - v16;
    v39.double x = v20;
    v39.double y = v21;
    v43.double x = v22;
    v43.double y = v23;
    char v25 = TPathProcessor::CalculateExcludeRange((TPathProcessor *)&v36, v39, v43, v17, v18, &v35, v24);
    v40.double x = v20;
    v40.double y = v21;
    v44.double y = v31;
    v44.double x = v32;
    char v27 = TPathProcessor::CalculateExcludeRange((TPathProcessor *)&v36, v40, v44, v17, v18, &v35, v26);
    v41.double x = v22;
    v41.double y = v23;
    v45.double y = v33;
    v45.double x = v34;
    uint64_t result = TPathProcessor::CalculateExcludeRange((TPathProcessor *)&v36, v41, v45, v17, v18, &v35, v28);
    if ((result & 1) == 0 && (v27 & 1) == 0 && (v25 & 1) == 0 && !v19) {
      return result;
    }
  }
  double v30 = v35;
  double v29 = *(double *)&v36;

  return (uint64_t)TPathProcessor::RemoveRange((uint64_t)this, v29, v30);
}

double *TPathProcessor::RemoveRangeForCurve(double *this, CGPoint a2, CGPoint a3, CGPoint a4, CGPoint a5, uint64_t a6, double *a7)
{
  double y = a2.y;
  double x = a2.x;
  if (a5.y >= a4.y) {
    double v9 = a4.y;
  }
  else {
    double v9 = a5.y;
  }
  if (a3.y < a2.y) {
    a2.double y = a3.y;
  }
  if (v9 < a2.y) {
    a2.double y = v9;
  }
  double v10 = this[10] * 0.5;
  if (a2.y - v10 <= this[3])
  {
    double v11 = (TPathProcessor *)this;
    if (y >= a3.y) {
      double v12 = y;
    }
    else {
      double v12 = a3.y;
    }
    if (a4.y >= a5.y) {
      double v13 = a4.y;
    }
    else {
      double v13 = a5.y;
    }
    if (v12 < v13) {
      double v12 = v13;
    }
    if (v12 + v10 >= this[2])
    {
      double v14 = a3.x - x;
      CGFloat v15 = a4.x - a3.x;
      double v16 = a4.x - a3.x - (a3.x - x);
      double v17 = a5.x - a4.x - v15;
      double v18 = a3.y - y;
      CGFloat v19 = a4.y - a3.y;
      double v20 = a4.y - a3.y - (a3.y - y);
      double v21 = a5.y - a4.y - v19;
      double v22 = v20 * v20 + v16 * v16;
      if (v22 <= v21 * v21 + v17 * v17) {
        double v22 = v21 * v21 + v17 * v17;
      }
      double v23 = v22 * 9.0 * 0.0625;
      if (v23 > 0.25)
      {
        double v24 = v21 - v20;
        double v25 = v24 + (v18 + v20) * 3.0;
        double v26 = (v20 + v24) * 6.0;
        double v27 = v24 * 6.0;
        double v28 = v17 - v16;
        double v29 = v28 + (v14 + v16) * 3.0;
        double v30 = (v16 + v28) * 6.0;
        double v31 = v28 * 6.0;
        int v32 = 1;
        do
        {
          int v33 = v32;
          double v31 = v31 * 0.125;
          double v30 = v30 * 0.25 - v31;
          double v29 = v29 * 0.5 - v30 * 0.5;
          double v27 = v27 * 0.125;
          double v26 = v26 * 0.25 - v27;
          double v25 = v25 * 0.5 - v26 * 0.5;
          v32 *= 2;
          double v23 = v23 * 0.0625;
        }
        while (v23 > 0.25 && v32 <= 0x10000);
        if (v32 >= 2)
        {
          unsigned int v34 = (2 * v33) | 1;
          double v35 = y;
          double v36 = x;
          do
          {
            double x = v36 + v29;
            double v29 = v30 + v29;
            double v30 = v31 + v30;
            double y = v35 + v25;
            double v25 = v26 + v25;
            double v26 = v27 + v26;
            v44.double x = x;
            v44.double y = y;
            TPathProcessor::RemoveRangeForLine(v11, *(CGPoint *)&v36, v44, a6, a7);
            v43.double x = x;
            v43.double y = y;
            TPathProcessor::RemoveRangeForPoint((double *)v11, v43);
            --v34;
            double v35 = y;
            double v36 = x;
          }
          while (v34 > 2);
        }
      }
      double v37 = x;
      double v38 = y;
      CGFloat v39 = a5.x;
      CGFloat v40 = a5.y;
      return (double *)TPathProcessor::RemoveRangeForLine(v11, *(CGPoint *)&v37, *(CGPoint *)&v39, a6, a7);
    }
  }
  return this;
}

double *TPathProcessor::RemoveRangeForPoint(double *this, CGPoint a2)
{
  double v2 = this[10];
  if (v2 <= 0.0) {
    return this;
  }
  double v3 = v2 * 0.5;
  double v4 = this[2];
  if (a2.y >= v4 && a2.y <= this[3]) {
    return (double *)TPathProcessor::RemoveRange((uint64_t)this, a2.x - v3, a2.x + v3);
  }
  double v5 = v4 - a2.y;
  BOOL v6 = a2.y < v4 && v5 < v3;
  if (v6 || ((v7 = this[3], double v5 = a2.y - v7, a2.y > v7) ? (v8 = v5 < v3) : (v8 = 0), v8))
  {
    double v3 = sqrt(v3 * v3 - v5 * v5);
    return (double *)TPathProcessor::RemoveRange((uint64_t)this, a2.x - v3, a2.x + v3);
  }
  return this;
}

uint64_t TPathProcessor::CalculateExcludeRange(TPathProcessor *this, CGPoint a2, CGPoint a3, CGFloat a4, CGFloat a5, double *a6, double *a7)
{
  if (a2.y <= a4 && a3.y <= a4) {
    return 0;
  }
  BOOL v8 = a2.y < a5 || a3.y < a5;
  if (!v8) {
    return 0;
  }
  if (a2.y <= a3.y)
  {
    double x = a3.x;
    double y = a3.y;
    a3 = a2;
  }
  else
  {
    double x = a2.x;
    double y = a2.y;
  }
  if (a3.y < a4 || a3.y > a5 || y < a4 || y > a5)
  {
    if ((*(void *)&a3.y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    {
      if ((*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        double v12 = (x + a3.x) * 0.5;
        double v13 = v12;
        goto LABEL_32;
      }
      BOOL v8 = a3.y < a4;
      double v14 = a3.x - x;
      double v15 = a3.y - y;
      double v12 = a3.x;
      if (v8) {
        double v12 = x - (a4 - y) * v14 / v15;
      }
      if (y > a5)
      {
        double v13 = x - (a5 - y) * v14 / v15;
        goto LABEL_32;
      }
    }
    else
    {
      double v12 = a3.x;
      if (a3.y < a4) {
        double v12 = a3.x + (x - a3.x) * (a4 - a3.y) / (y - a3.y);
      }
      if (y > a5)
      {
        double v13 = a3.x + (x - a3.x) * (a5 - a3.y) / (y - a3.y);
LABEL_32:
        if ((*(void *)&a3.x & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000) {
          a3.double x = v12;
        }
        if ((*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000) {
          double x = v13;
        }
        goto LABEL_36;
      }
    }
    double v13 = x;
    goto LABEL_32;
  }
LABEL_36:
  if (x >= a3.x) {
    double v16 = a3.x;
  }
  else {
    double v16 = x;
  }
  if (v16 < *(double *)this) {
    *(double *)this = v16;
  }
  if (x >= a3.x) {
    double v17 = x;
  }
  else {
    double v17 = a3.x;
  }
  if (v17 > *a6) {
    *a6 = v17;
  }
  return 1;
}

char *TPathProcessor::RemoveRange(uint64_t a1, double a2, double a3)
{
  unint64_t v6 = *(void *)(a1 + 88);
  uint64_t result = *(char **)(a1 + 40);
  if (v6 % 0x1E)
  {
    if (!result) {
      return result;
    }
    goto LABEL_3;
  }
  if (!result)
  {
    uint64_t result = (char *)malloc_type_realloc(0, 0x1E0uLL, 0xFE0C88B4uLL);
    goto LABEL_12;
  }
  unint64_t v10 = v6 / 0x1E + 1;
  if (!is_mul_ok(v10, 0x1EuLL))
  {
    free(result);
LABEL_10:
    uint64_t result = 0;
    goto LABEL_12;
  }
  unint64_t v11 = 30 * v10;
  if (v11 >> 60) {
    goto LABEL_10;
  }
  uint64_t result = (char *)reallocf(result, 16 * v11);
LABEL_12:
  *(void *)(a1 + 40) = result;
  if (!result) {
    return result;
  }
LABEL_3:
  uint64_t v8 = *(void *)(a1 + 88);
  double v9 = (double *)&result[16 * v8];
  *double v9 = a2;
  v9[1] = a3;
  *(void *)(a1 + 88) = v8 + 1;
  return result;
}

__CFArray *CreateRectArrayFromPath(CFTypeRef cf, BOOL a2, uint64_t *a3, double *a4, double a5, double a6, double a7)
{
  long long v27 = unk_184BAB720;
  long long v28 = xmmword_184BAB730;
  cfa[0] = (CFTypeRef)__const_CreateRectArrayFromPath_pathProcessor;
  long long v25 = unk_184BAB700;
  cfa[1] = *(CFTypeRef *)&a5;
  uint64_t v29 = -1;
  uint64_t v30 = 0;
  capacity[0] = 0;
  capacity[1] = 0;
  if (cf) {
    CFRetain(cf);
  }
  cfa[0] = cf;
  TPathProcessor::SlicePathH(cfa, a2, a3, a6, a7);
  CFIndex v13 = capacity[0];
  id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], capacity[0], MEMORY[0x1E4F1D510]);
  if (v13)
  {
    uint64_t v15 = 0;
    double Width = 0.0;
    do
    {
      double v17 = *(double *)(capacity[1] + v15);
      double v18 = *(double *)(capacity[1] + v15 + 8) - v17;
      CGFloat v19 = *(double *)&v25;
      double v20 = *((double *)&v25 + 1) - *(double *)&v25;
      v31.origin.double x = v17;
      *(void *)&v31.origin.double y = v25;
      v31.size.width = v18;
      v31.size.height = *((double *)&v25 + 1) - *(double *)&v25;
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v31);
      if (DictionaryRepresentation)
      {
        CFDictionaryRef v22 = DictionaryRepresentation;
        CFArrayAppendValue(Mutable, DictionaryRepresentation);
        CFRelease(v22);
      }
      v32.origin.double x = v17;
      v32.origin.double y = v19;
      v32.size.width = v18;
      v32.size.height = v20;
      if (Width < CGRectGetWidth(v32))
      {
        v33.origin.double x = v17;
        v33.origin.double y = v19;
        v33.size.width = v18;
        v33.size.height = v20;
        double Width = CGRectGetWidth(v33);
      }
      v15 += 16;
      --v13;
    }
    while (v13);
    if (a4) {
      goto LABEL_11;
    }
  }
  else
  {
    double Width = 0.0;
    if (a4) {
LABEL_11:
    }
      *a4 = Width;
  }
  if (cfa[0]) {
    CFRelease(cfa[0]);
  }
  free((void *)capacity[1]);
  return Mutable;
}

__CFArray *CreateRectArrayFromPathVertical(uint64_t a1, BOOL a2, uint64_t *a3, double a4, double a5, double a6)
{
  v27[0] = kRotateRightTransform;
  v27[1] = unk_184BAB760;
  v27[2] = xmmword_184BAB770;
  unint64_t v11 = (void *)MEMORY[0x185326E30](a1, v27);
  double v12 = v11;
  long long v23 = unk_184BAB7B0;
  long long v24 = xmmword_184BAB7C0;
  cf[0] = (CFTypeRef)__const_CreateRectArrayFromPathVertical_pathProcessor;
  long long v21 = unk_184BAB790;
  cf[1] = *(CFTypeRef *)&a4;
  uint64_t v25 = -1;
  uint64_t v26 = 0;
  capacity[0] = 0;
  capacity[1] = 0;
  if (v11) {
    CFRetain(v11);
  }
  cf[0] = v12;
  TPathProcessor::SlicePathH(cf, a2, a3, -a5, -a6);
  CFIndex v13 = capacity[0];
  id Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], capacity[0], MEMORY[0x1E4F1D510]);
  if (v13)
  {
    uint64_t v15 = 0;
    do
    {
      v28.origin.double x = *(CGFloat *)(capacity[1] + v15);
      v28.size.width = *(double *)(capacity[1] + v15 + 8) - v28.origin.x;
      *(void *)&v28.origin.double y = v21;
      v28.size.height = *((double *)&v21 + 1) - *(double *)&v21;
      CGAffineTransform v19 = *(CGAffineTransform *)kRotateLeftTransform;
      CGRect v29 = CGRectApplyAffineTransform(v28, &v19);
      CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v29);
      if (DictionaryRepresentation)
      {
        CFDictionaryRef v17 = DictionaryRepresentation;
        CFArrayAppendValue(Mutable, DictionaryRepresentation);
        CFRelease(v17);
      }
      v15 += 16;
      --v13;
    }
    while (v13);
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  free((void *)capacity[1]);

  return Mutable;
}

__CFArray *CTFramesetterCreateCGRectArray(__CFArray *a1, const __CFDictionary *a2, CFArrayRef theArray, double a4, double a5)
{
  RectArrayFromPath = a1;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13[11] = v9;
    v13[12] = v9;
    v13[9] = v9;
    v13[10] = v9;
    v13[8] = v9;
    v13[6] = v9;
    v13[7] = v9;
    v13[4] = v9;
    v13[5] = v9;
    v13[2] = v9;
    v13[3] = v9;
    v13[0] = v9;
    v13[1] = v9;
    TClippingPathInfo::TClippingPathInfo((TClippingPathInfo *)v13, theArray, 0);
    CTFramePathFillRule v12 = -1431655766;
    double PathWidthAndFillRule = GetPathWidthAndFillRule(a2, &v12);
    RectArrayFromPath = CreateRectArrayFromPath(RectArrayFromPath, v12 == kCTFramePathFillEvenOdd, (uint64_t *)v13, 0, PathWidthAndFillRule, a4, a5);
    TClippingPathInfo::~TClippingPathInfo((TClippingPathInfo *)v13);
  }
  return RectArrayFromPath;
}

double GetPathWidthAndFillRule(const __CFDictionary *a1, CTFramePathFillRule *a2)
{
  if (a1)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"CTFramePathFillRule");
    if (Value)
    {
      int valuePtr = -1431655766;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      CTFramePathFillRule v5 = valuePtr;
    }
    else
    {
      CTFramePathFillRule v5 = kCTFramePathFillEvenOdd;
    }
    double v9 = 0.0;
    CFNumberRef v7 = (const __CFNumber *)CFDictionaryGetValue(a1, @"CTFramePathWidth");
    double v6 = 0.0;
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberDoubleType, &v9);
      if (v9 >= 0.0) {
        double v6 = v9;
      }
    }
  }
  else
  {
    CTFramePathFillRule v5 = kCTFramePathFillEvenOdd;
    double v6 = 0.0;
  }
  *a2 = v5;
  return v6;
}

__CFArray *CTFramesetterCreateCGRectArrayVertical(__CFArray *a1, const __CFDictionary *a2, CFArrayRef theArray, double a4, double a5)
{
  RectArrayFromPathVertical = a1;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13[11] = v9;
    v13[12] = v9;
    v13[9] = v9;
    v13[10] = v9;
    v13[8] = v9;
    v13[6] = v9;
    v13[7] = v9;
    v13[4] = v9;
    v13[5] = v9;
    v13[2] = v9;
    v13[3] = v9;
    v13[0] = v9;
    v13[1] = v9;
    TClippingPathInfo::TClippingPathInfo((TClippingPathInfo *)v13, theArray, 1);
    CTFramePathFillRule v12 = -1431655766;
    double PathWidthAndFillRule = GetPathWidthAndFillRule(a2, &v12);
    RectArrayFromPathVertical = CreateRectArrayFromPathVertical((uint64_t)RectArrayFromPathVertical, v12 == kCTFramePathFillEvenOdd, (uint64_t *)v13, PathWidthAndFillRule, a4, a5);
    TClippingPathInfo::~TClippingPathInfo((TClippingPathInfo *)v13);
  }
  return RectArrayFromPathVertical;
}

void TClippingPathInfo::TClippingPathInfo(TClippingPathInfo *this, CFArrayRef theArray, int a3)
{
  *((void *)this + 1) = 0;
  double v4 = (void *)((char *)this + 8);
  uint64_t v58 = (char *)this + 32;
  *((void *)this + 9) = (char *)this + 32;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 10) = 0;
  uint64_t v60 = (void **)((char *)this + 80);
  unsigned __int16 v56 = (char *)this + 104;
  *((void *)this + 18) = (char *)this + 104;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 19) = 0;
  unint64_t v61 = (void **)((char *)this + 152);
  *((void *)this + 20) = 0;
  *((void *)this + 21) = 0;
  CFRange v57 = (CTFramePathFillRule *)((char *)this + 176);
  *((void *)this + 25) = (char *)this + 176;
  if (theArray)
  {
    uint64_t v62 = (unint64_t *)((char *)this + 144);
    uint64_t v63 = (atomic_ullong *)((char *)this + 72);
    *(void *)this = CFArrayGetCount(theArray);
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count)
    {
      CFIndex v6 = 0;
      BOOL v59 = (CTFramePathFillRule *)((char *)this + 196);
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (void *)CFArrayGetValueAtIndex(theArray, v6);
        v68[0] = 0;
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID())
        {
          CFNumberRef Value = (void *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"CTFramePathClippingPath");
          TCFRef<__CTFont const*>::Retain((atomic_ullong *)v68, Value);
        }
        else
        {
          CFTypeID v10 = CFGetTypeID(ValueAtIndex);
          if (v10 == CGPathGetTypeID()) {
            TCFRef<__CTFont const*>::Retain((atomic_ullong *)v68, ValueAtIndex);
          }
          else {
            CFLog();
          }
          CFDictionaryRef ValueAtIndex = 0;
        }
        if (!atomic_load_explicit((atomic_ullong *volatile)v68, memory_order_acquire)) {
          goto LABEL_87;
        }
        if (a3)
        {
          unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)v68, memory_order_acquire);
          v66[0] = kRotateRightTransform;
          v66[1] = unk_184BAB760;
          v66[2] = xmmword_184BAB770;
          *(void *)__int16 v67 = MEMORY[0x185326E30](explicit, v66);
        }
        CFIndex v13 = (void *)*((void *)this + 2);
        unint64_t v12 = *((void *)this + 3);
        if ((unint64_t)v13 >= v12)
        {
          uint64_t v15 = ((uint64_t)v13 - *v4) >> 3;
          if ((unint64_t)(v15 + 1) >> 61) {
            goto LABEL_91;
          }
          uint64_t v16 = v12 - *v4;
          uint64_t v17 = v16 >> 2;
          if (v16 >> 2 <= (unint64_t)(v15 + 1)) {
            uint64_t v17 = v15 + 1;
          }
          unint64_t v18 = (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v17;
          if (v18)
          {
            CGAffineTransform v19 = (char *)*v63;
            unint64_t v20 = *v63 + 8 * v18;
            if (v20 <= (unint64_t)v63)
            {
              *uint64_t v63 = v20;
            }
            else
            {
              if (v18 >> 61) {
                goto LABEL_92;
              }
              CGAffineTransform v19 = (char *)operator new(8 * v18);
            }
          }
          else
          {
            CGAffineTransform v19 = 0;
          }
          long long v21 = &v19[8 * v15];
          CFDictionaryRef v22 = &v19[8 * v18];
          *(void *)long long v21 = atomic_exchange((atomic_ullong *volatile)v68, 0);
          uint64_t v14 = v21 + 8;
          long long v23 = (atomic_ullong *)*((void *)this + 1);
          long long v24 = (atomic_ullong *)*((void *)this + 2);
          if (v24 == v23)
          {
            *((void *)this + 1) = v21;
            *((void *)this + 2) = v14;
            uint64_t v26 = *((void *)this + 3);
            *((void *)this + 3) = v22;
          }
          else
          {
            do
            {
              *((void *)v21 - 1) = atomic_exchange(--v24, 0);
              v21 -= 8;
            }
            while (v24 != v23);
            long long v24 = (atomic_ullong *)*((void *)this + 1);
            uint64_t v25 = (atomic_ullong *)*((void *)this + 2);
            *((void *)this + 1) = v21;
            *((void *)this + 2) = v14;
            uint64_t v26 = *((void *)this + 3);
            *((void *)this + 3) = v22;
            if (v25 != v24)
            {
              do
              {
                long long v27 = v25 - 1;

                uint64_t v25 = v27;
              }
              while (v27 != v24);
            }
          }
          if (v24)
          {
            if (v58 > (char *)v24 || v63 <= v24)
            {
              operator delete(v24);
            }
            else if (v26 == *v63)
            {
              *uint64_t v63 = (atomic_ullong)v24;
            }
          }
        }
        else
        {
          *CFIndex v13 = atomic_exchange((atomic_ullong *volatile)v68, 0);
          uint64_t v14 = v13 + 1;
        }
        *((void *)this + 2) = v14;
        v67[0] = -1431655766;
        double PathWidthAndFillRule = GetPathWidthAndFillRule((const __CFDictionary *)ValueAtIndex, v67);
        uint64_t v30 = (CTFramePathFillRule *)*((void *)this + 20);
        unint64_t v29 = *((void *)this + 21);
        if ((unint64_t)v30 >= v29)
        {
          CGRect v32 = (CTFramePathFillRule *)*v61;
          uint64_t v33 = ((char *)v30 - (unsigned char *)*v61) >> 2;
          if ((unint64_t)(v33 + 1) >> 62) {
            goto LABEL_91;
          }
          unint64_t v34 = v29 - (void)v32;
          unint64_t v35 = (uint64_t)(v29 - (void)v32) >> 1;
          if (v35 <= v33 + 1) {
            unint64_t v35 = v33 + 1;
          }
          unint64_t v36 = v34 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v35;
          if (v36)
          {
            double v37 = (char *)*((void *)this + 25);
            double v38 = &v37[4 * v36];
            if (v38 <= (char *)v59)
            {
              *((void *)this + 25) = v38;
            }
            else
            {
              if (v36 >> 62) {
                goto LABEL_92;
              }
              double v37 = (char *)operator new(4 * v36);
            }
          }
          else
          {
            double v37 = 0;
          }
          CGFloat v39 = (CTFramePathFillRule *)&v37[4 * v33];
          CTFramePathFillRule *v39 = v67[0];
          CGFloat v40 = v39;
          while (v30 != v32)
          {
            int v41 = *((_DWORD *)v30-- - 1);
            *((_DWORD *)v40-- - 1) = v41;
          }
          CGRect v31 = v39 + 1;
          *((void *)this + 19) = v40;
          *((void *)this + 20) = v39 + 1;
          *((void *)this + 21) = &v37[4 * v36];
          if (v32)
          {
            if (v57 > v32 || v59 <= v32)
            {
              operator delete(v32);
            }
            else if ((CTFramePathFillRule *)((char *)v32 + v34) == *((CTFramePathFillRule **)this + 25))
            {
              *((void *)this + 25) = v32;
            }
          }
        }
        else
        {
          CTFramePathFillRule *v30 = v67[0];
          CGRect v31 = v30 + 1;
        }
        *((void *)this + 20) = v31;
        CGPoint v43 = (char *)*((void *)this + 11);
        unint64_t v42 = *((void *)this + 12);
        if ((unint64_t)v43 >= v42) {
          break;
        }
        *(double *)CGPoint v43 = PathWidthAndFillRule;
        CGPoint v44 = v43 + 8;
LABEL_86:
        *((void *)this + 11) = v44;
LABEL_87:

        if (++v6 == Count) {
          return;
        }
      }
      CGPoint v45 = (char *)*v60;
      uint64_t v46 = (v43 - (unsigned char *)*v60) >> 3;
      if ((unint64_t)(v46 + 1) >> 61) {
LABEL_91:
      }
        abort();
      unint64_t v47 = v42 - (void)v45;
      unint64_t v48 = (uint64_t)(v42 - (void)v45) >> 2;
      if (v48 <= v46 + 1) {
        unint64_t v48 = v46 + 1;
      }
      if (v47 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v49 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v49 = v48;
      }
      if (v49)
      {
        uint64_t v50 = (void **)v62;
        uint64_t v51 = (char *)*v62;
        unint64_t v52 = *v62 + 8 * v49;
        if (v52 <= (unint64_t)v62)
        {
          *uint64_t v62 = v52;
          goto LABEL_77;
        }
        if (v49 >> 61) {
LABEL_92:
        }
          std::__throw_bad_array_new_length[abi:nn180100]();
        uint64_t v51 = (char *)operator new(8 * v49);
      }
      else
      {
        uint64_t v51 = 0;
      }
      uint64_t v50 = (void **)v62;
LABEL_77:
      uint64_t v53 = (double *)&v51[8 * v46];
      double *v53 = PathWidthAndFillRule;
      int v54 = v53;
      while (v43 != v45)
      {
        uint64_t v55 = *((void *)v43 - 1);
        v43 -= 8;
        *((void *)v54-- - 1) = v55;
      }
      CGPoint v44 = v53 + 1;
      *((void *)this + 10) = v54;
      *((void *)this + 11) = v53 + 1;
      *((void *)this + 12) = &v51[8 * v49];
      if (v45)
      {
        if (v56 > v45 || v50 <= (void **)v45)
        {
          operator delete(v45);
        }
        else if (&v45[v47] == *v50)
        {
          *uint64_t v50 = v45;
        }
      }
      goto LABEL_86;
    }
  }
  else
  {
    *(void *)this = 0;
  }
}

BOOL CTFramesetterFindRectPosition(const CGPath *a1, const __CFDictionary *a2, const __CFArray *a3, int a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  BoundingBoCGFloat x = CGPathGetBoundingBox(a1);
  if (BoundingBox.size.width < a8 || BoundingBox.size.height < a7) {
    return 0;
  }
  CGFloat x = BoundingBox.origin.x;
  CGFloat y = BoundingBox.origin.y;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  if (CGRectGetMinY(BoundingBox) > a6) {
    return 0;
  }
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.CGFloat width = width;
  v65.size.CGFloat height = height;
  if (a6 + a7 > CGRectGetMaxY(v65)) {
    return 0;
  }
  v22.CGFloat width = NAN;
  v22.CGFloat height = NAN;
  rect.origin = (CGPoint)v22;
  rect.size = v22;
  v22.CGFloat width = -3.72066208e-103;
  v22.CGFloat height = -3.72066208e-103;
  CGSize v61 = v22;
  CGSize v62 = v22;
  CGSize v59 = v22;
  CGSize v60 = v22;
  CGSize v57 = v22;
  CGSize v58 = v22;
  CGSize v55 = v22;
  CGSize v56 = v22;
  v54[3] = v22;
  v54[4] = v22;
  v54[1] = v22;
  v54[2] = v22;
  v54[0] = v22;
  TClippingPathInfo::TClippingPathInfo((TClippingPathInfo *)v54, a3, 0);
  CTFramePathFillRule v52 = -1431655766;
  double PathWidthAndFillRule = GetPathWidthAndFillRule(a2, &v52);
  uint64_t v23 = *(void *)&v54[0];
  double v24 = -1.0;
  if (a4) {
    double v24 = 1.0;
  }
  double v47 = v24;
  double v50 = a7;
  do
  {
    double MaxY = a6;
    while (v23 >= 1)
    {
      char v26 = 0;
      uint64_t v27 = 0;
      double v28 = NAN;
      do
      {
        if (*(uint64_t *)&v54[0] <= v27)
        {
          unint64_t explicit = 0;
        }
        else
        {
          double v28 = *(double *)(*(void *)&v55.width + 8 * v27);
          unint64_t explicit = (const CGPath *)atomic_load_explicit((atomic_ullong *volatile)(*((void *)&v54[0] + 1) + 8 * v27), memory_order_acquire);
        }
        if (CGPathIsRect(explicit, &rect))
        {
          CGRect rect = CGRectInset(rect, v28 * -0.5, v28 * -0.5);
          double MinX = CGRectGetMinX(rect);
          v66.origin.CGFloat x = x;
          v66.origin.CGFloat y = y;
          v66.size.CGFloat width = width;
          v66.size.CGFloat height = height;
          if (MinX <= CGRectGetMinX(v66) + a8)
          {
            double MaxX = CGRectGetMaxX(rect);
            v67.origin.CGFloat x = x;
            v67.origin.CGFloat y = y;
            v67.size.CGFloat width = width;
            v67.size.CGFloat height = height;
            if (MaxX >= CGRectGetMaxX(v67) - a8 && MaxY + v50 > CGRectGetMinY(rect) && MaxY < CGRectGetMaxY(rect))
            {
              CGFloat v32 = rect.origin.x;
              CGFloat v33 = rect.origin.y;
              CGFloat v34 = rect.size.width;
              CGFloat v35 = rect.size.height;
              if (a4) {
                double MaxY = CGRectGetMaxY(*(CGRect *)&v32);
              }
              else {
                double MaxY = CGRectGetMinY(*(CGRect *)&v32) - v50;
              }
              char v26 = 1;
            }
          }
        }
        ++v27;
      }
      while (v23 != v27);
      if ((v26 & 1) == 0) {
        goto LABEL_32;
      }
    }
    double MaxY = a6;
LABEL_32:
    v68.origin.CGFloat x = x;
    v68.origin.CGFloat y = y;
    v68.size.CGFloat width = width;
    v68.size.CGFloat height = height;
    if (MaxY < CGRectGetMinY(v68)
      || (v69.origin.CGFloat x = x,
          v69.origin.CGFloat y = y,
          v69.size.CGFloat width = width,
          v69.size.CGFloat height = height,
          MaxY + v50 > CGRectGetMaxY(v69)))
    {
      BOOL v20 = 0;
      goto LABEL_57;
    }
    double v51 = NAN;
    CTFramePathFillRule v36 = v52;
    double v37 = CreateRectArrayFromPath(a1, v52 == kCTFramePathFillEvenOdd, (uint64_t *)v54, &v51, PathWidthAndFillRule, MaxY, MaxY + v50);
    CFArrayRef Count = v37;
    CFArrayRef v39 = Count;
    if (Count) {
      CFArrayRef Count = (const __CFArray *)CFArrayGetCount(Count);
    }
    BOOL v20 = v51 >= a8 && (uint64_t)Count > 0;

    if (v20)
    {
      if (a5) {
        *a5 = MaxY;
      }
LABEL_56:

      goto LABEL_57;
    }
    double v41 = v47 + MaxY;
    v70.origin.CGFloat x = x;
    v70.origin.CGFloat y = y;
    v70.size.CGFloat width = width;
    v70.size.CGFloat height = height;
    if (v47 + MaxY < CGRectGetMinY(v70)) {
      goto LABEL_56;
    }
    v71.origin.CGFloat x = x;
    v71.origin.CGFloat y = y;
    v71.size.CGFloat width = width;
    v71.size.CGFloat height = height;
    if (v41 + v50 > CGRectGetMaxY(v71)) {
      goto LABEL_56;
    }
    a6 = v47 + MaxY;
    unint64_t v42 = CreateRectArrayFromPath(a1, v36 == kCTFramePathFillEvenOdd, (uint64_t *)v54, &v51, PathWidthAndFillRule, v41, v41 + v50);
    CFArrayRef v43 = v42;
    CFArrayRef v44 = v43;
    if (v43) {
      CFIndex v45 = CFArrayGetCount(v43);
    }
    else {
      CFIndex v45 = 0;
    }
    double v46 = v51;
  }
  while (v45 < 1 || v46 < a8);
  if (a5) {
    *a5 = a6;
  }
  BOOL v20 = 1;
LABEL_57:
  TClippingPathInfo::~TClippingPathInfo((TClippingPathInfo *)v54);
  return v20;
}

void TBaselineEngine::GetBaselineInfo(uint64_t a1, int a2, uint64_t a3)
{
  id v21 = (id)0xAAAAAAAAAAAAAAAALL;
  (*(void (**)(id *__return_ptr))(**(void **)(a1 + 400) + 480))(&v21);
  if (atomic_load_explicit((atomic_ullong *volatile)&v21, memory_order_acquire))
  {
    CFDataRef v6 = (const __CFData *)(id)atomic_load_explicit((atomic_ullong *volatile)&v21, memory_order_acquire);
    CFDataRef v7 = v6;
    if (v6) {
      BytePtr = (unsigned __int16 *)CFDataGetBytePtr(v6);
    }
    else {
      BytePtr = 0;
    }

    id v12 = (id)atomic_load_explicit((atomic_ullong *volatile)&v21, memory_order_acquire);
    CFDataRef v13 = (const __CFData *)v12;
    if (v13)
    {
      CFDataRef v14 = v13;
      uint64_t v15 = CFDataGetBytePtr(v13);

      if (v15) {
        v15 += CFDataGetLength((CFDataRef)v12);
      }
    }
    else
    {

      uint64_t v15 = 0;
    }

    TAATBslnEngine::GetBaselineInfo(BytePtr, (unint64_t)v15, (const TBaseFont **)a1, a3);
  }
  else
  {
    (*(void (**)(id *__return_ptr))(**(void **)(a1 + 400) + 480))(v22);

    if (atomic_load_explicit((atomic_ullong *volatile)&v21, memory_order_acquire))
    {
      CFDataRef v9 = (const __CFData *)(id)atomic_load_explicit((atomic_ullong *volatile)&v21, memory_order_acquire);
      CFDataRef v10 = v9;
      if (v9) {
        unint64_t v11 = CFDataGetBytePtr(v9);
      }
      else {
        unint64_t v11 = 0;
      }

      id v16 = (id)atomic_load_explicit((atomic_ullong *volatile)&v21, memory_order_acquire);
      CFDataRef v17 = (const __CFData *)v16;
      if (v17)
      {
        CFDataRef v18 = v17;
        CGAffineTransform v19 = CFDataGetBytePtr(v17);

        if (v19) {
          v19 += CFDataGetLength((CFDataRef)v16);
        }
      }
      else
      {

        CGAffineTransform v19 = 0;
      }

      *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v24 = v20;
      long long v25 = v20;
      *(_OWORD *)CGSize v22 = v20;
      long long v23 = v20;
      OTL::BASE::BASE((uint64_t)v22, (uint64_t)v11, (unint64_t)v19);
      if (v22[0]) {
        TOpenTypeBaselineEngine::GetBaselineInfo((unint64_t *)v22, (TFont *)a1, a2, a3, 0);
      }
    }
    else if ((*(unsigned char *)a1 & 1) == 0)
    {
      TBaselineEngineImplementation::SynthesizeMissingBaselines(a1, a3, 0.0);
    }
  }
}

uint64_t TBaselineEngineImplementation::AlignBaselinesForRuns(TBaselineEngineImplementation *this)
{
  uint64_t result = (*(uint64_t (**)(TBaselineEngineImplementation *))(*(void *)this + 24))(this);
  if (result)
  {
    uint64_t v3 = *((void *)this + 1);
    if (*(uint64_t *)(v3 + 56) < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v4 = *(void *)(v3 + 40);
      uint64_t v5 = *(void *)(v4 + 184);
      if (!v5 || (unsigned int v6 = *(unsigned __int8 *)(v5 + 280), v6 == 255))
      {
        unsigned int v6 = *(unsigned __int8 *)(v3 + 36);
        if (v6 == 3)
        {
          if ((*(_WORD *)(v4 + 178) & 0x2000) != 0) {
            unsigned int v6 = 0;
          }
          else {
            unsigned int v6 = 3;
          }
        }
        else if (v6 == 5 || v6 == 2)
        {
          int v8 = *(_DWORD *)(v3 + 32);
          if (v8 > 1784769902)
          {
            BOOL v9 = v8 == 1801547361;
            int v10 = 1784769903;
          }
          else
          {
            BOOL v9 = v8 == 1751215719;
            int v10 = 1751215721;
          }
          if (v9 || v8 == v10)
          {
            unsigned int v12 = v6 == 2 ? 6 : 7;
            if (TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs((uint64_t)this, v12)) {
              return 1;
            }
          }
        }
      }
      return TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs((uint64_t)this, v6);
    }
  }
  return result;
}

void TBaselineEngineImplementation::SynthesizeMissingBaselines(uint64_t a1, uint64_t a2, double a3)
{
  double TypoAscentDescent = TBaselineEngineImplementation::GetTypoAscentDescent((TBaseFont **)a1, (const TFont *)a2);
  double v8 = v7;
  if (a3 != 0.0 || (*(unsigned char *)a1 & 1) == 0) {
    goto LABEL_14;
  }
  if ((*(unsigned int (**)(void, uint64_t))(**(void **)(a1 + 400) + 472))(*(void *)(a1 + 400), 1986884728))
  {
    BOOL v9 = (int *)(a1 + 48);
    int v10 = *(_DWORD *)(a1 + 48);
LABEL_6:
    inited = v9;
    if (!v10) {
      inited = TFont::InitStrikeMetrics((TFont *)a1);
    }
    double v13 = *((double *)inited + 6);
    if (!*v9) {
      BOOL v9 = TFont::InitStrikeMetrics((TFont *)a1);
    }
    a3 = v13 * (double)*v9 * -0.5 - v8;
    goto LABEL_14;
  }
  int v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 400) + 472))(*(void *)(a1 + 400), 1448038983);
  BOOL v9 = (int *)(a1 + 48);
  int v10 = *(_DWORD *)(a1 + 48);
  if (v11) {
    goto LABEL_6;
  }
  if (!v10) {
    BOOL v9 = TFont::InitStrikeMetrics((TFont *)a1);
  }
  a3 = *((double *)v9 + 4) * -0.5;
LABEL_14:
  if (!*(unsigned char *)(a2 + 88))
  {
    *(double *)(a2 + 80) = TypoAscentDescent + a3;
    *(unsigned char *)(a2 + 88) = 1;
  }
  if (!*(unsigned char *)(a2 + 40))
  {
    char v14 = (*(uint64_t (**)(void))(**(void **)(a1 + 400) + 736))(*(void *)(a1 + 400));
    double v15 = v8;
    if ((v14 & 1) == 0)
    {
      id v16 = *(_DWORD *)(a1 + 48) ? (int *)(a1 + 48) : TFont::InitStrikeMetrics((TFont *)a1);
      double v15 = *((double *)v16 + 4) * -0.15;
      if (v15 >= 0.0) {
        double v15 = v8 * 0.5;
      }
    }
    *(double *)(a2 + 32) = a3 + v15;
    *(unsigned char *)(a2 + 40) = 1;
  }
  if (!*(unsigned char *)(a2 + 8))
  {
    *(double *)a2 = a3;
    *(unsigned char *)(a2 + 8) = 1;
  }
  if (!*(unsigned char *)(a2 + 24) && *(unsigned char *)(a2 + 88))
  {
    *(double *)(a2 + 16) = (*(double *)(a2 + 80) + *(double *)(a2 + 32)) * 0.5;
    *(unsigned char *)(a2 + 24) = 1;
  }
  if (!*(unsigned char *)(a2 + 56))
  {
    if (*(_DWORD *)(a1 + 48)) {
      CFDataRef v17 = (int *)(a1 + 48);
    }
    else {
      CFDataRef v17 = TFont::InitStrikeMetrics((TFont *)a1);
    }
    *(double *)(a2 + ++*(void *)(this + 48) = a3 + *((double *)v17 + 4);
    *(unsigned char *)(a2 + 56) = 1;
  }
  if (!*(unsigned char *)(a2 + 72))
  {
    uint64_t v18 = *(void *)(a1 + 400);
    TFont::GetScaledMatrix((TFont *)a1, &v19);
    *(double *)(a2 + 64) = a3
                         + (*(double (**)(uint64_t, CGAffineTransform *))(*(void *)v18 + 608))(v18, &v19)
                         * 0.5;
    *(unsigned char *)(a2 + 72) = 1;
  }
}

void *TBaselineEngineImplementation::TBaselineEngineImplementation(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = &unk_1ED05F2F8;
  a1[1] = a2;
  if (a3)
  {
    uint64_t v4 = *(void *)(*(void *)(atomic_load_explicit((atomic_ullong *volatile)(*(void *)(a2 + 40) + 56), memory_order_acquire)+ 40)+ 400);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v4 + 480))(v4, a3);
  }
  else
  {
    a1[2] = 0;
  }
  CFDataRef v5 = (const __CFData *)(id)atomic_load_explicit(a1 + 2, memory_order_acquire);
  CFDataRef v6 = v5;
  if (v5) {
    BytePtr = CFDataGetBytePtr(v5);
  }
  else {
    BytePtr = 0;
  }

  a1[3] = BytePtr;
  id v8 = (id)atomic_load_explicit(a1 + 2, memory_order_acquire);
  CFDataRef v9 = (const __CFData *)v8;
  if (v9)
  {
    CFDataRef v10 = v9;
    int v11 = CFDataGetBytePtr(v9);

    if (v11) {
      v11 += CFDataGetLength((CFDataRef)v8);
    }
  }
  else
  {

    int v11 = 0;
  }

  a1[4] = v11;
  return a1;
}

void TBaselineEngineImplementation::~TBaselineEngineImplementation(id *this)
{
  *this = &unk_1ED05F2F8;
}

{
  uint64_t vars8;

  *this = &unk_1ED05F2F8;

  JUMPOUT(0x1853275C0);
}

uint64_t TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(uint64_t a1, unsigned int a2)
{
  v7[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = v2 + 208;
  if (!*(unsigned char *)(v2 + 208 + 16 * a2 + 8)) {
    return 0;
  }
  uint64_t v4 = v2 + 80;
  if (!*(unsigned char *)(v4 + 16 * a2 + 8)) {
    return 0;
  }
  double v5 = *(double *)(v3 + 16 * a2) - *(double *)(v4 + 16 * a2);
  if (v5 != 0.0)
  {
    v7[0] = &unk_1ED061310;
    *(double *)&v7[1] = v5;
    v7[3] = v7;
    TBaselineEngineImplementation::ApplyToRuns(a1, (uint64_t)v7);
    std::__function::__value_func<BOOL ()(TRun &)>::~__value_func[abi:nn180100](v7);
  }
  return 1;
}

double TBaselineEngineImplementation::GetTypoAscentDescent(TBaseFont **this, const TFont *a2)
{
  uint64_t v4 = -1;
  double v5 = NAN;
  if (TFont::GetTypoMetrics(this, &v5, (double *)&v4, 0)) {
    return v5;
  }
  else {
    return TFont::GetHorizontalAscentDescent(this);
  }
}

BOOL TBaselineEngineImplementation::ApplyToRuns(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  if (v2[7] < 1 || (uint64_t v3 = v2[9], v3 < 1))
  {
    LOBYTE(v6) = 0;
    return v6 & 1;
  }
  else
  {
    int v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = v2[8];
    uint64_t v9 = *v2;
    uint64_t v10 = v3 + v8;
    uint64_t v11 = v2[6];
    for (uint64_t i = *(void *)(*v2 + 16) + 8 * v11; ; uint64_t i = v30 + 8 * v11)
    {
      double v13 = *(void **)(*(void *)i + 48);
      uint64_t v14 = v13[26];
      if (v8 != v7)
      {
        uint64_t v15 = *(void *)(*(void *)(v13[27] + 48) + 8 * v13[25] + 8 * (v8 - v7));
        uint64_t v16 = v13[1];
        uint64_t v17 = v15 - v16;
        if (v15 >= v16 && v17 < v13[2])
        {
          if (v15 == v16) {
            return v6 & 1;
          }
          TLine::SplitRun(v9, v11, v17);
          uint64_t v18 = *(void *)(a1 + 8);
          uint64_t v20 = *(void *)(v18 + 48);
          uint64_t v19 = *(void *)(v18 + 56);
          if (v20 <= v11 && v19 + v20 > v11) {
            *(void *)(v18 + 56) = v19 + 1;
          }
          double v13 = *(void **)(*(void *)(*(void *)(v9 + 16) + 8 * v11) + 48);
          uint64_t v14 = v13[26];
          int v6 = 1;
        }
      }
      if (v10 - v7 < v14)
      {
        uint64_t v22 = *(void *)(*(void *)(v13[27] + 48) + 8 * v13[25] + 8 * (v10 - v7));
        uint64_t v23 = v13[1];
        uint64_t v24 = v22 - v23;
        if (v22 >= v23 && v24 < v13[2])
        {
          if (v22 == v23) {
            return v6 & 1;
          }
          TLine::SplitRun(v9, v11, v24);
          uint64_t v25 = *(void *)(a1 + 8);
          uint64_t v27 = *(void *)(v25 + 48);
          uint64_t v26 = *(void *)(v25 + 56);
          if (v27 <= v11 && v26 + v27 > v11) {
            *(void *)(v25 + 56) = v26 + 1;
          }
          uint64_t v14 = *(void *)(*(void *)(*(void *)(*(void *)(v9 + 16) + 8 * v11) + 48) + 208);
          int v6 = 1;
        }
      }
      uint64_t v29 = *(void *)(a2 + 24);
      if (!v29) {
        break;
      }
      v6 |= (*(uint64_t (**)(uint64_t))(*(void *)v29 + 48))(v29);
      v8 += v14;
      if (v8 >= v10) {
        return v6 & 1;
      }
      ++v11;
      uint64_t v30 = *(void *)(v9 + 16);
      if (v11 >= (*(void *)(v9 + 24) - v30) >> 3) {
        return v6 & 1;
      }
      v7 += v14;
    }
    CGFloat v32 = (TBaselineEngineImplementation *)std::__throw_bad_function_call[abi:nn180100]();
    return TBaselineEngineImplementation::CanProcess(v32);
  }
}

BOOL TBaselineEngineImplementation::CanProcess(TBaselineEngineImplementation *this)
{
  return *((void *)this + 3) != 0;
}

void anonymous namespace'::BaselineRunComparator::~BaselineRunComparator(_anonymous_namespace_::BaselineRunComparator *this)
{
}

BOOL anonymous namespace'::BaselineRunComparator::RunsSimilar(_anonymous_namespace_::BaselineRunComparator *this, const TRun *a2, const TRun *a3)
{
  int v6 = (unsigned char *)*((void *)a2 + 23);
  if (v6) {
    int v7 = v6[280];
  }
  else {
    int v7 = 255;
  }
  uint64_t v8 = (unsigned char *)*((void *)a3 + 23);
  if (v8) {
    int v9 = v8[280];
  }
  else {
    int v9 = 255;
  }
  if (v7 != v9) {
    return 0;
  }
  if (v6)
  {
    if (v6[128]) {
      uint64_t v10 = *((void *)a2 + 23);
    }
    else {
      uint64_t v10 = 0;
    }
    if (v8) {
      goto LABEL_13;
    }
LABEL_17:
    uint64_t v11 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = 0;
  if (!v8) {
    goto LABEL_17;
  }
LABEL_13:
  if (v8[128]) {
    uint64_t v11 = *((void *)a3 + 23);
  }
  else {
    uint64_t v11 = 0;
  }
LABEL_18:
    return 0;
  if (v6)
  {
    if (v6[264]) {
      uint64_t v12 = (uint64_t)(v6 + 136);
    }
    else {
      uint64_t v12 = 0;
    }
    if (v8) {
      goto LABEL_24;
    }
LABEL_28:
    uint64_t v13 = 0;
    goto LABEL_29;
  }
  uint64_t v12 = 0;
  if (!v8) {
    goto LABEL_28;
  }
LABEL_24:
  if (v8[264]) {
    uint64_t v13 = (uint64_t)(v8 + 136);
  }
  else {
    uint64_t v13 = 0;
  }
LABEL_29:
    return 0;

  return TRunComparator::RunsSimilar(this, a2, a3);
}

uint64_t anonymous namespace'::BaselineRunComparator::EqualBaselineInfo(uint64_t a1, uint64_t a2)
{
  if (a1 == a2) {
    return 1;
  }
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = 0;
    while (1)
    {
      int v4 = *(unsigned __int8 *)(a2 + v3 + 8);
      if (*(unsigned char *)(a1 + v3 + 8)) {
        BOOL v5 = v4 == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        if ((*(unsigned char *)(a1 + v3 + 8) != 0) != (v4 != 0)) {
          return 0;
        }
      }
      else if (*(double *)(a1 + v3) != *(double *)(a2 + v3))
      {
        return 0;
      }
      v3 += 16;
      if (v3 == 128) {
        return 1;
      }
    }
  }
  return v2;
}

void std::__function::__func<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0,std::allocator<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0>,BOOL ()(TRun &)>::~__func()
{
}

void *std::__function::__func<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0,std::allocator<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0>,BOOL ()(TRun &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1ED061310;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0,std::allocator<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0>,BOOL ()(TRun &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1ED061310;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0,std::allocator<TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs(BaselineClass)::$_0>,BOOL ()(TRun &)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 160);
  if (v3)
  {
    double v4 = *(double *)(v3 + 48);
    double v5 = v4 + *(double *)(a1 + 8);
  }
  else
  {
    double v4 = 0.0;
    double v5 = *(double *)(a1 + 8) + 0.0;
  }
  if (v4 != v5)
  {
    *(double *)(TAttributes::EnsureRareData((TAttributes *)(a2 + 40)) + ++*(void *)(this + 48) = v5;
    *(unsigned char *)(a2 + 89) = 1;
  }
  return 1;
}

void *std::__function::__value_func<BOOL ()(TRun &)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *TAATBslnEngine::TAATBslnEngine(void *a1, uint64_t a2)
{
  uint64_t v3 = TBaselineEngineImplementation::TBaselineEngineImplementation(a1, a2, 1651731566);
  *uint64_t v3 = &unk_1ED05DF70;
  v3[5] = 0;
  uint64_t v4 = *(void *)(v3[1] + 40);
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(v4 + 56), memory_order_acquire);
  int v6 = (unsigned int *)v3[3];
  if (!v6 || (**(unsigned char **)(explicit + 40) & 1) != 0) {
    goto LABEL_13;
  }
  uint64_t v7 = a1[1];
  uint64_t v8 = *(long long **)(*(void *)(v7 + 40) + 184);
  if (v8 && *((unsigned char *)v8 + 128))
  {
    uint64_t v9 = v7 + 80;
    long long v10 = *v8;
    long long v11 = v8[1];
    long long v12 = v8[3];
    *(_OWORD *)(v7 + 112) = v8[2];
    *(_OWORD *)(v7 + 128) = v12;
    *(_OWORD *)(v7 + 80) = v10;
    *(_OWORD *)(v7 + 96) = v11;
    long long v13 = v8[4];
    long long v14 = v8[5];
    long long v15 = v8[7];
    *(_OWORD *)(v7 + 176) = v8[6];
    *(_OWORD *)(v7 + 192) = v15;
    *(_OWORD *)(v7 + 144) = v13;
    *(_OWORD *)(v7 + 160) = v14;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v9 = v7 + 80;
    uint64_t v17 = v7 + 88;
    do
    {
      if (*(unsigned char *)(v17 + v16)) {
        *(unsigned char *)(v17 + v16) = 0;
      }
      v16 += 16;
    }
    while (v16 != 128);
  }
  if ((int)bswap32(*v6) < 0x10000
    || (TAATBslnEngine::GetBaselineInfo((unsigned __int16 *)v6, a1[4], *(const TBaseFont ***)(atomic_load_explicit((atomic_ullong *volatile)(v4 + 56), memory_order_acquire) + 40), v9) & 1) == 0)
  {
    uint64_t v18 = (atomic_ullong *)(v4 + 56);
    atomic_load_explicit(v18, memory_order_acquire);
    CFLog();
    uint64_t v19 = *(void *)(*(void *)(atomic_load_explicit(v18, memory_order_acquire) + 40) + 400);
    (*(void (**)(uint64_t))(*(void *)v19 + 488))(v19);
LABEL_13:
    a1[3] = 0;
  }
  return a1;
}

uint64_t TAATBslnEngine::GetBaselineInfo(unsigned __int16 *a1, unint64_t a2, const TBaseFont **this, uint64_t a4)
{
  __b[137] = *(id *)MEMORY[0x1E4F143B8];
  if (*(unsigned char *)this) {
    return 0;
  }
  *(void *)&long long v8 = -1;
  *((void *)&v8 + 1) = -1;
  *(_OWORD *)&v46.c = v8;
  *(_OWORD *)&v46.tCGFloat x = v8;
  *(_OWORD *)&v46.a = v8;
  TFont::GetScaledMatrix((TFont *)this, &v46);
  switch(bswap32(a1[2]) >> 16)
  {
    case 0u:
LABEL_3:
      if ((unint64_t)(a1 + 36) > a2) {
        goto LABEL_36;
      }
      uint64_t v9 = 0;
      double b = v46.b;
      double d = v46.d;
      tCGFloat y = v46.ty;
      do
      {
        if ((unint64_t)(v9 - 6) >= 0x1A)
        {
          uint64_t v13 = a4 + 16 * bslnToBaselineMap[v9];
          if (!*(unsigned char *)(v13 + 8))
          {
            *(double *)uint64_t v13 = ty + d * (double)((int)bswap32(a1[v9 + 4]) >> 16) + b * 0.0;
            *(unsigned char *)(v13 + 8) = 1;
          }
        }
        ++v9;
      }
      while (v9 != 32);
      goto LABEL_44;
    case 1u:
      if ((unint64_t)(a1 + 37) <= a2)
      {
        uint64_t v14 = 0;
        switch(bswap32(a1[36]) >> 16)
        {
          case 0u:
            goto LABEL_3;
          case 2u:
          case 4u:
          case 6u:
            if ((unint64_t)(a1 + 39) > a2) {
              return 0;
            }
            uint64_t v18 = a1 + 42;
            unsigned int v19 = bswap32(a1[37]) >> 16;
            unsigned int v20 = a1[38];
            goto LABEL_64;
          case 8u:
            CFArrayRef v39 = a1 + 39;
            if ((unint64_t)(a1 + 39) <= a2)
            {
              uint64_t v40 = bswap32(a1[38]) >> 16;
              unint64_t v41 = (unint64_t)&v39[v40];
              unint64_t v42 = (unint64_t)(a1 + 40) <= a2 ? (a2 - (unint64_t)v39) >> 1 : 0;
              BOOL v43 = v41 <= a2 && v41 >= (unint64_t)v39;
              if (v43 || v42 == v40) {
                goto LABEL_3;
              }
            }
            return 0;
          case 0xAu:
            uint64_t v18 = a1 + 40;
            if ((unint64_t)(a1 + 40) > a2) {
              return 0;
            }
            unsigned int v19 = bswap32(a1[37]) >> 16;
            unsigned int v20 = a1[39];
LABEL_64:
            unint64_t v44 = (unint64_t)v18 + (bswap32(v20) >> 16) * (unint64_t)v19;
            if (v44 >= (unint64_t)v18 && v44 <= a2) {
              goto LABEL_3;
            }
            return 0;
          default:
            return v14;
        }
      }
      return 0;
    case 2u:
LABEL_35:
      if ((unint64_t)(a1 + 37) > a2) {
        goto LABEL_36;
      }
      double v28 = this[50];
      if (!v28) {
        goto LABEL_36;
      }
      uint64_t v29 = a1 + 5;
      unsigned int v30 = bswap32(a1[4]) >> 16;
      memset(__b, 170, 0x448uLL);
      TAATControlPointAccess::TAATControlPointAccess((TAATControlPointAccess *)__b, v28);
      for (uint64_t i = 0; i != 32; ++i)
      {
        if ((unint64_t)(i - 6) >= 0x1A)
        {
          uint64_t v32 = bslnToBaselineMap[i];
          double ControlPointCoordinates = TAATControlPointAccess::GetControlPointCoordinates((TAATControlPointAccess *)__b, v30, bswap32(v29[i]) >> 16);
          uint64_t v35 = a4 + 16 * v32;
          if (!*(unsigned char *)(v35 + 8))
          {
            *(double *)uint64_t v35 = v46.ty + v34 * v46.d + v46.b * ControlPointCoordinates;
            *(unsigned char *)(v35 + 8) = 1;
          }
        }
      }

      double v47 = &__b[2];
      std::vector<CGPoint,TInlineBufferAllocator<CGPoint,64ul>>::__destroy_vector::operator()[abi:nn180100](&v47);
LABEL_44:
      uint64_t v14 = 1;
      break;
    case 3u:
      if ((unint64_t)(a1 + 38) <= a2)
      {
        uint64_t v14 = 0;
        switch(bswap32(a1[37]) >> 16)
        {
          case 0u:
            goto LABEL_35;
          case 2u:
          case 4u:
          case 6u:
            if ((unint64_t)(a1 + 40) > a2) {
              goto LABEL_36;
            }
            long long v15 = a1 + 43;
            unsigned int v16 = bswap32(a1[38]) >> 16;
            unsigned int v17 = a1[39];
            goto LABEL_31;
          case 8u:
            id v21 = a1 + 40;
            if ((unint64_t)(a1 + 40) <= a2)
            {
              uint64_t v22 = bswap32(a1[39]) >> 16;
              unint64_t v23 = (unint64_t)&v21[v22];
              unint64_t v24 = (unint64_t)(a1 + 41) <= a2 ? (a2 - (unint64_t)v21) >> 1 : 0;
              BOOL v25 = v23 <= a2 && v23 >= (unint64_t)v21;
              if (v25 || v24 == v22) {
                goto LABEL_35;
              }
            }
            goto LABEL_36;
          case 0xAu:
            long long v15 = a1 + 41;
            if ((unint64_t)(a1 + 41) > a2) {
              goto LABEL_36;
            }
            unsigned int v16 = bswap32(a1[38]) >> 16;
            unsigned int v17 = a1[40];
LABEL_31:
            unint64_t v26 = (unint64_t)v15 + (bswap32(v17) >> 16) * (unint64_t)v16;
            if (v26 >= (unint64_t)v15 && v26 <= a2) {
              goto LABEL_35;
            }
            goto LABEL_36;
          default:
            goto LABEL_45;
        }
      }
      goto LABEL_36;
    default:
LABEL_36:
      uint64_t v14 = 0;
      break;
  }
LABEL_45:
  uint64_t v36 = 0;
  LODWORD(__b[0]) = 67306754;
  do
  {
    uint64_t v37 = a4 + 16 * *((unsigned __int8 *)__b + v36);
    if (*(unsigned char *)(v37 + 8) && *(double *)v37 == 0.0) {
      *(unsigned char *)(v37 + 8) = 0;
    }
    ++v36;
  }
  while (v36 != 4);
  TBaselineEngineImplementation::SynthesizeMissingBaselines((uint64_t)this, a4, 0.0);
  return v14;
}

void TAATBslnEngine::~TAATBslnEngine(TAATBslnEngine *this)
{
  *(void *)this = &unk_1ED05DF70;
  uint64_t v4 = (void **)*((void *)this + 5);
  uint64_t v2 = (void *)((char *)this + 40);
  uint64_t v3 = v4;
  *uint64_t v2 = 0;
  if (v4) {
    std::default_delete<TAATControlPointAccess>::operator()[abi:nn180100]((uint64_t)v2, v3);
  }
  *(void *)this = &unk_1ED05F2F8;
}

{
  uint64_t vars8;

  TAATBslnEngine::~TAATBslnEngine(this);

  JUMPOUT(0x1853275C0);
}

BOOL TAATBslnEngine::AlignBaselinesForRuns(TAATBslnEngine *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (v1)
  {
    uint64_t v2 = *((void *)this + 1);
    if (*(uint64_t *)(v2 + 56) >= 1)
    {
      uint64_t v3 = *(void *)(v2 + 40);
      uint64_t v4 = *(void *)(v3 + 184);
      if (v4)
      {
        unsigned int v5 = *(unsigned __int8 *)(v4 + 280);
        if (v5 != 255)
        {
LABEL_15:
          TBaselineEngineImplementation::ApplySameBaselineToAllGlyphs((uint64_t)this, v5);
          return v1 != 0;
        }
      }
      unsigned int v5 = *(unsigned __int8 *)(v2 + 36);
      if (v5 != 255)
      {
        if (v5 == 3)
        {
          if ((*(_WORD *)(v3 + 178) & 0x2000) != 0) {
            unsigned int v5 = 0;
          }
          else {
            unsigned int v5 = 3;
          }
        }
        goto LABEL_15;
      }
      unsigned int v6 = bswap32(*(unsigned __int16 *)(v1 + 6)) >> 16;
      if (v6 > 0x1F) {
        unsigned int v7 = 0;
      }
      else {
        unsigned int v7 = bslnToBaselineMap[v6];
      }
      switch(bswap32(*(unsigned __int16 *)(v1 + 4)) >> 16)
      {
        case 0u:
        case 2u:
          unsigned int v5 = v7;
          goto LABEL_15;
        case 1u:
          uint64_t v9 = (const SFNTLookupTable *)(v1 + 72);
          goto LABEL_19;
        case 3u:
          uint64_t v9 = (const SFNTLookupTable *)(v1 + 74);
LABEL_19:
          TAATBslnEngine::ProcessBSLNFormatsWithMap((uint64_t)this, v9, v7);
          break;
        default:
          return v1 != 0;
      }
    }
  }
  return v1 != 0;
}

uint64_t TAATBslnEngine::ProcessBSLNFormatsWithMap(uint64_t a1, const SFNTLookupTable *a2, char a3)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  char v12 = a3;
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v10 = v4;
  long long v9 = v4;
  unsigned int v5 = *(SFNTLookupTable **)(a1 + 32);
  v8[0] = TAATLookupTable::BadTable;
  v8[1] = 0;
  *((void *)&v10 + 1) = 0;
  unint64_t v11 = 0xAAAAAAAAAAAAFFFFLL;
  TAATLookupTable::SetTable((uint64_t)v8, a2, v5);
  unsigned int v6 = operator new(0x20uLL);
  *unsigned int v6 = &unk_1ED060D28;
  v6[1] = &v12;
  v6[2] = v8;
  v6[3] = a1;
  v13[3] = v6;
  TBaselineEngineImplementation::ApplyToRuns(a1, (uint64_t)v13);
  std::__function::__value_func<BOOL ()(TRun &)>::~__value_func[abi:nn180100](v13);
  return 1;
}

void std::__function::__func<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1,std::allocator<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1>,BOOL ()(TRun &)>::~__func()
{
}

__n128 std::__function::__func<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1,std::allocator<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1>,BOOL ()(TRun &)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x20uLL);
  *(void *)uint64_t v2 = &unk_1ED060D28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1,std::allocator<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1>,BOOL ()(TRun &)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1ED060D28;
  __n128 result = *(__n128 *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1,std::allocator<TAATBslnEngine::ProcessBSLNFormatsWithMap(SFNTLookupTable const*,BaselineClass)::$_1>,BOOL ()(TRun &)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 208);
  uint64_t v5 = *(void *)(*(void *)(a2 + 216) + 16) + 2 * *(void *)(a2 + 200);
  double v6 = 0.0;
  double v7 = 0.0;
  if (v4 < 1)
  {
LABEL_13:
    uint64_t v21 = *(void *)(a2 + 160);
    if (v21) {
      double v6 = *(double *)(v21 + 48);
    }
    if (v6 != v7 + v6)
    {
      *(double *)(TAttributes::EnsureRareData((TAttributes *)(a2 + 40)) + ++*(void *)(this + 48) = v7 + v6;
      *(unsigned char *)(a2 + 89) = 1;
    }
    if (v4 < 1) {
      return 1;
    }
    uint64_t v22 = 0;
    unint64_t v23 = (double *)MEMORY[0x1E4F1DAD8];
    while (1)
    {
      uint64_t v24 = *(unsigned __int16 *)(v5 + 2 * v22);
      uint64_t v25 = *(void *)(a1 + 16);
      uint64_t v26 = *(void *)(a1 + 24);
      uint64_t v27 = **(unsigned __int8 **)(a1 + 8);
      unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
      double v28 = *(uint64_t (**)(void *, uint64_t, unint64_t *))v25;
      uint64_t v29 = *(void *)(v25 + 8);
      unsigned int v30 = (void *)(v25 + (v29 >> 1));
      if (v29) {
        double v28 = *(uint64_t (**)(void *, uint64_t, unint64_t *))(*v30 + v28);
      }
      CGRect v31 = (unsigned __int16 *)v28(v30, v24, &v42);
      if (v31)
      {
        unsigned int v32 = bswap32(*v31) >> 16;
        if (v32 <= 0x1F) {
          uint64_t v27 = bslnToBaselineMap[v32];
        }
      }
      uint64_t v33 = *(void *)(v26 + 8) + 16 * v27;
      if (!*(unsigned char *)(v33 + 216) || !*(unsigned char *)(v33 + 88)) {
        break;
      }
      double v34 = *(double *)(v33 + 208) - *(double *)(v33 + 80);
      if (v34 != v7)
      {
        if ((*(unsigned char *)(a2 + 225) & 0x10) != 0)
        {
          [*(id *)(a2 + 216) originAtIndex:v22 + *(void *)(a2 + 200)];
          double v36 = v37;
        }
        else
        {
          double v36 = *v23;
          double v35 = v23[1];
        }
        double v38 = v34 - v7 + v35;
        objc_msgSend(*(id *)(a2 + 216), "setOrigin:atIndex:", v22 + *(void *)(a2 + 200), v36, v38);
        if (v36 != *v23 || v38 != v23[1]) {
          *(unsigned char *)(a2 + 225) |= 0x10u;
        }
      }
      if (v4 == ++v22) {
        return 1;
      }
    }
  }
  else
  {
    long long v8 = (unsigned __int16 *)(*(void *)(*(void *)(a2 + 216) + 16) + 2 * *(void *)(a2 + 200));
    uint64_t v9 = *(void *)(a2 + 208);
    while (1)
    {
      unsigned int v11 = *v8++;
      uint64_t v10 = v11;
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      uint64_t v14 = **(unsigned __int8 **)(a1 + 8);
      unint64_t v42 = 0xAAAAAAAAAAAAAAAALL;
      long long v15 = *(uint64_t (**)(void *, uint64_t, unint64_t *))v12;
      uint64_t v16 = *(void *)(v12 + 8);
      unsigned int v17 = (void *)(v12 + (v16 >> 1));
      if (v16) {
        long long v15 = *(uint64_t (**)(void *, uint64_t, unint64_t *))(*v17 + v15);
      }
      uint64_t v18 = (unsigned __int16 *)v15(v17, v10, &v42);
      if (v18)
      {
        unsigned int v19 = bswap32(*v18) >> 16;
        if (v19 <= 0x1F) {
          uint64_t v14 = bslnToBaselineMap[v19];
        }
      }
      uint64_t v20 = *(void *)(v13 + 8) + 16 * v14;
      if (!*(unsigned char *)(v20 + 216) || !*(unsigned char *)(v20 + 88)) {
        break;
      }
      if (*(double *)(v20 + 208) - *(double *)(v20 + 80) < v7) {
        double v7 = *(double *)(v20 + 208) - *(double *)(v20 + 80);
      }
      if (!--v9) {
        goto LABEL_13;
      }
    }
  }
  std::__throw_bad_optional_access[abi:nn180100]();
  return (uint64_t)TOpenTypeBaselineEngine::TOpenTypeBaselineEngine(v40, v41);
}

void *TOpenTypeBaselineEngine::TOpenTypeBaselineEngine(void *a1, uint64_t a2)
{
  uint64_t v3 = TBaselineEngineImplementation::TBaselineEngineImplementation(a1, a2, 1111577413);
  *uint64_t v3 = &unk_1ED05F210;
  uint64_t v4 = (unint64_t *)OTL::BASE::BASE((uint64_t)(v3 + 5), a1[3], a1[4]);
  if (!a1[5]) {
    goto LABEL_12;
  }
  uint64_t v5 = a1[1];
  uint64_t v6 = *(void *)(v5 + 40);
  double v7 = *(long long **)(v6 + 184);
  if (v7 && *((unsigned char *)v7 + 128))
  {
    uint64_t v8 = v5 + 80;
    long long v9 = *v7;
    long long v10 = v7[1];
    long long v11 = v7[3];
    *(_OWORD *)(v5 + 112) = v7[2];
    *(_OWORD *)(v5 + 128) = v11;
    *(_OWORD *)(v5 + 80) = v9;
    *(_OWORD *)(v5 + 96) = v10;
    long long v12 = v7[4];
    long long v13 = v7[5];
    long long v14 = v7[7];
    *(_OWORD *)(v5 + 176) = v7[6];
    *(_OWORD *)(v5 + 192) = v14;
    *(_OWORD *)(v5 + 144) = v12;
    *(_OWORD *)(v5 + 160) = v13;
    uint64_t v6 = *(void *)(a1[1] + 40);
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v8 = v5 + 80;
    uint64_t v16 = v5 + 88;
    do
    {
      if (*(unsigned char *)(v16 + v15)) {
        *(unsigned char *)(v16 + v15) = 0;
      }
      v15 += 16;
    }
    while (v15 != 128);
  }
  char v21 = -1;
  unsigned int v17 = (atomic_ullong *)(v6 + 56);
  TOpenTypeBaselineEngine::GetBaselineInfo(v4, *(TFont **)(atomic_load_explicit((atomic_ullong *volatile)(v6 + 56), memory_order_acquire) + 40), *(_DWORD *)(a1[1] + 32), v8, &v21);
  if (!v18)
  {
    atomic_load_explicit(v17, memory_order_acquire);
    CFLog();
    uint64_t v19 = *(void *)(*(void *)(atomic_load_explicit(v17, memory_order_acquire) + 40) + 400);
    (*(void (**)(uint64_t))(*(void *)v19 + 488))(v19);
LABEL_12:
    a1[3] = 0;
    return a1;
  }
  *(unsigned char *)(a1[1] + 36) = v21;
  return a1;
}

void TOpenTypeBaselineEngine::GetBaselineInfo(unint64_t *a1, TFont *this, int a3, uint64_t a4, char *a5)
{
  double v7 = this;
  uint64_t v177 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  unsigned int v10 = *(unsigned __int16 *)(*a1 + 4);
  long long v11 = (unsigned __int16 *)(*a1 + __rev16(v10));
  if ((unint64_t)(v11 + 2) > v9 || v10 == 0) {
    long long v13 = 0;
  }
  else {
    long long v13 = v11;
  }
  if (!v13) {
    goto LABEL_80;
  }
  long long v14 = (unsigned __int16 *)((char *)v13 + __rev16(*v13));
  if (!*v13) {
    long long v14 = 0;
  }
  uint64_t v15 = v14 + 1;
  if (v8 <= (unint64_t)v14 && (unint64_t)v15 <= v9)
  {
    uint64_t v17 = bswap32(*v14) >> 16;
    unint64_t v18 = (unint64_t)&v15[2 * v17];
    unint64_t v19 = (unint64_t)(v14 + 3) <= v9 ? (v9 - (unint64_t)v15) >> 2 : 0;
    BOOL v20 = v18 <= v9 && v18 >= (unint64_t)v15;
    if (v20 || v19 == v17)
    {
      uint64_t v22 = (unsigned __int16 *)((char *)v13 + __rev16(v13[1]));
      if (!v13[1]) {
        uint64_t v22 = 0;
      }
      unint64_t v23 = v22 + 1;
      if (v8 <= (unint64_t)v22 && (unint64_t)v23 <= v9)
      {
        uint64_t v25 = bswap32(*v22) >> 16;
        unint64_t v26 = (unint64_t)&v23[3 * v25];
        if (v26 >= (unint64_t)v23 && v26 <= v9) {
          goto LABEL_80;
        }
        unint64_t v28 = (v9 - (unint64_t)v23) / 6;
        if ((unint64_t)(v22 + 4) > v9) {
          unint64_t v28 = 0;
        }
        if (v28 == v25)
        {
LABEL_80:
          unsigned int v29 = *(unsigned __int16 *)(v8 + 6);
          unint64_t v30 = v8 + __rev16(v29);
          BOOL v31 = v30 + 4 > v9 || v29 == 0;
          unsigned int v32 = v31 ? 0 : (unsigned __int16 *)v30;
          if (!v32) {
            goto LABEL_322;
          }
          uint64_t v33 = (unsigned __int16 *)((char *)v32 + __rev16(*v32));
          if (!*v32) {
            uint64_t v33 = 0;
          }
          double v34 = v33 + 1;
          if (v8 <= (unint64_t)v33 && (unint64_t)v34 <= v9)
          {
            uint64_t v36 = bswap32(*v33) >> 16;
            unint64_t v37 = (unint64_t)&v34[2 * v36];
            unint64_t v38 = (unint64_t)(v33 + 3) <= v9 ? (v9 - (unint64_t)v34) >> 2 : 0;
            BOOL v39 = v37 <= v9 && v37 >= (unint64_t)v34;
            if (v39 || v38 == v36)
            {
              uint64_t v41 = (unsigned __int16 *)((char *)v32 + __rev16(v32[1]));
              if (!v32[1]) {
                uint64_t v41 = 0;
              }
              unint64_t v42 = v41 + 1;
              if (v8 <= (unint64_t)v41 && (unint64_t)v42 <= v9)
              {
                uint64_t v44 = bswap32(*v41) >> 16;
                unint64_t v45 = (unint64_t)&v42[3 * v44];
                if (v45 >= (unint64_t)v42 && v45 <= v9) {
                  goto LABEL_322;
                }
                unint64_t v47 = (v9 - (unint64_t)v42) / 6;
                if ((unint64_t)(v41 + 4) > v9) {
                  unint64_t v47 = 0;
                }
                if (v47 == v44)
                {
LABEL_322:
                  unint64_t v48 = (*(unsigned char *)this & 1) != 0 ? v32 : v13;
                  if (v48)
                  {
                    v166 = v13;
                    unint64_t v49 = (char *)v48 + __rev16(*v48);
                    double v50 = *v48 ? v49 : 0;
                    v171 = v50;
                    v165 = v48;
                    double v51 = (char *)v48 + __rev16(v48[1]);
                    CTFramePathFillRule v52 = v48[1] ? v51 : 0;
                    if (a3)
                    {
                      *(void *)&long long v53 = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      *(_OWORD *)__p = v53;
                      *(_OWORD *)v174 = v53;
                      unint64_t v175 = 0xAAAAAAAAFFFFFFFFLL;
                      OTL::BASE::MapOfBaseScriptTableOffsets((uint64_t *)__p, v52);
                      uint64_t v54 = 0;
                      *(_DWORD *)v176 = a3;
                      *(void *)&v176[4] = 0x6C61746E44464C54;
                      CGSize v55 = __p[0];
                      CGSize v56 = __p[1];
                      while (1)
                      {
                        Script = OTL::BASE::FindScript((uint64_t)v55, (unint64_t)v56, *(_DWORD *)&v176[v54]);
                        if (Script)
                        {
                          if (*((_WORD *)Script + 10)) {
                            break;
                          }
                        }
                        v54 += 4;
                        if (v54 == 12)
                        {
                          std::__hash_table<EncoderAttempt,std::hash<EncoderAttempt>,std::equal_to<EncoderAttempt>,std::allocator<EncoderAttempt>>::~__hash_table((uint64_t)__p);
                          goto LABEL_93;
                        }
                      }
                      unsigned int v58 = __rev16(*((unsigned __int16 *)Script + 10));
                      std::__hash_table<EncoderAttempt,std::hash<EncoderAttempt>,std::equal_to<EncoderAttempt>,std::allocator<EncoderAttempt>>::~__hash_table((uint64_t)__p);
                    }
                    else
                    {
LABEL_93:
                      if (!*(_WORD *)v52 || !*((_WORD *)v52 + 3)) {
                        return;
                      }
                      unsigned int v58 = __rev16(*((unsigned __int16 *)v52 + 3));
                    }
                    CGSize v59 = &v52[v58];
                    CGSize v60 = (unsigned __int16 *)(v59 + 6);
                    if ((unint64_t)(v59 + 4) >= v8 && (unint64_t)v60 <= v9)
                    {
                      uint64_t v62 = bswap32(*((unsigned __int16 *)v59 + 2)) >> 16;
                      unint64_t v63 = (unint64_t)&v60[3 * v62];
                      if (v63 >= (unint64_t)v60 && v63 <= v9) {
                        goto LABEL_128;
                      }
                      unint64_t v65 = (v9 - (unint64_t)v60) / 6;
                      if ((unint64_t)(v59 + 12) > v9) {
                        unint64_t v65 = 0;
                      }
                      if (v65 == v62)
                      {
LABEL_128:
                        unsigned int v66 = *(unsigned __int16 *)v59;
                        CGRect v67 = &v59[__rev16(v66)];
                        CGRect v68 = v66 ? (unsigned __int16 *)v67 : 0;
                        v172 = v68;
                        if (v66)
                        {
                          CGRect v69 = v67 + 2;
                          CGRect v70 = (unsigned __int16 *)(v67 + 4);
                          if ((unint64_t)(v67 + 2) >= v8 && (unint64_t)v70 <= v9)
                          {
                            unsigned int v72 = *((unsigned __int16 *)v67 + 1);
                            uint64_t v73 = __rev16(v72);
                            unint64_t v74 = (unint64_t)&v70[v73];
                            unint64_t v75 = (unint64_t)(v67 + 6) <= v9 ? (v9 - (unint64_t)v70) >> 1 : 0;
                            BOOL v76 = v74 <= v9 && v74 >= (unint64_t)v70;
                            BOOL v77 = v76 || v75 == v73;
                            if (v77 && v72 == *(unsigned __int16 *)v171)
                            {
                              if (a5)
                              {
                                unsigned int v78 = bswap32(*(unsigned __int16 *)v67);
                                if (v73 <= HIWORD(v78)) {
                                  v79 = 0;
                                }
                                else {
                                  v79 = (TOpenTypeBaselineEngine *)bswap32(*(_DWORD *)&v171[4 * HIWORD(v78) + 2]);
                                }
                                __int16 v80 = TOpenTypeBaselineEngine::BaselineClassForTag(v79);
                                if ((v80 & 0xFF00) != 0) {
                                  char v81 = v80;
                                }
                                else {
                                  char v81 = -1;
                                }
                                *a5 = v81;
                              }
                              CGPoint v82 = (int *)((char *)v7 + 48);
                              initedouble d = (int *)((char *)v7 + 48);
                              if (!*((_DWORD *)v7 + 12)) {
                                initedouble d = TFont::InitStrikeMetrics(v7);
                              }
                              double v84 = *((double *)inited + 6);
                              if (!*v82) {
                                CGPoint v82 = TFont::InitStrikeMetrics(v7);
                              }
                              unsigned int v163 = *v82;
                              *(void *)v176 = 0xAAAAAAAAAAAAAAAALL;
                              unint64_t VariationValues = TFont::GetVariationValues((atomic_ullong *)v7, (unint64_t *)v176);
                              *(_OWORD *)__p = 0u;
                              *(_OWORD *)v174 = 0u;
                              unint64_t v175 = 0xAAAAAAAA3F800000;
                              if (*v69)
                              {
                                unsigned int v86 = 0;
                                unint64_t v87 = 0;
                                uint64_t v88 = 0;
                                unsigned int v89 = __rev16((unsigned __int16)*v69);
                                if (v89 <= 1) {
                                  uint64_t v90 = 1;
                                }
                                else {
                                  uint64_t v90 = v89;
                                }
                                v169 = v69;
                                v170 = v7;
                                while (1)
                                {
                                  if (bswap32((unsigned __int16)*v69) >> 16 <= (unsigned __int16)v88) {
                                    goto LABEL_228;
                                  }
                                  unint64_t v91 = (unint64_t)v172 + __rev16(v172[v88 + 2]);
                                  BOOL v92 = !v172[v88 + 2] || v8 > v91;
                                  if (v92 || v91 + 4 > v9) {
                                    goto LABEL_228;
                                  }
                                  unint64_t v94 = bswap32(*(_DWORD *)&v171[4 * v88 + 2]);
                                  if (v87)
                                  {
                                    uint8x8_t v95 = (uint8x8_t)vcnt_s8((int8x8_t)v87);
                                    v95.i16[0] = vaddlv_u8(v95);
                                    if (v95.u32[0] > 1uLL)
                                    {
                                      unint64_t v96 = v94;
                                      if (v87 <= v94) {
                                        unint64_t v96 = v94 % v87;
                                      }
                                    }
                                    else
                                    {
                                      unint64_t v96 = (v87 - 1) & v94;
                                    }
                                    uint64_t v97 = (uint64_t **)*((void *)__p[0] + v96);
                                    if (v97)
                                    {
                                      for (uint64_t i = *v97; i; uint64_t i = (uint64_t *)*i)
                                      {
                                        unint64_t v99 = i[1];
                                        if (v99 == v94)
                                        {
                                          if (*((_DWORD *)i + 4) == v94)
                                          {
                                            i[3] = v91;
                                            CGRect v69 = v169;
                                            double v7 = v170;
                                            goto LABEL_228;
                                          }
                                        }
                                        else
                                        {
                                          if (v95.u32[0] > 1uLL)
                                          {
                                            if (v99 >= v87) {
                                              v99 %= v87;
                                            }
                                          }
                                          else
                                          {
                                            v99 &= v87 - 1;
                                          }
                                          if (v99 != v96) {
                                            break;
                                          }
                                        }
                                      }
                                    }
                                  }
                                  else
                                  {
                                    unint64_t v96 = 0xAAAAAAAAAAAAAAAALL;
                                  }
                                  uint64_t v100 = operator new(0x20uLL);
                                  *uint64_t v100 = 0;
                                  v100[1] = v94;
                                  *((_DWORD *)v100 + 4) = v94;
                                  v100[3] = v91;
                                  float v101 = (float)((unint64_t)v86 + 1);
                                  if (!v87 || (float)(*(float *)&v175 * (float)v87) < v101) {
                                    break;
                                  }
LABEL_218:
                                  v117 = __p[0];
                                  v118 = (void *)*((void *)__p[0] + v96);
                                  CGRect v69 = v169;
                                  if (v118)
                                  {
                                    *uint64_t v100 = *v118;
                                    double v7 = v170;
LABEL_226:
                                    void *v118 = v100;
                                    goto LABEL_227;
                                  }
                                  *uint64_t v100 = v174[0];
                                  v174[0] = v100;
                                  v117[v96] = v174;
                                  double v7 = v170;
                                  if (*v100)
                                  {
                                    unint64_t v119 = *(void *)(*v100 + 8);
                                    if ((v87 & (v87 - 1)) != 0)
                                    {
                                      if (v119 >= v87) {
                                        v119 %= v87;
                                      }
                                    }
                                    else
                                    {
                                      v119 &= v87 - 1;
                                    }
                                    v118 = (char *)__p[0] + 8 * v119;
                                    goto LABEL_226;
                                  }
LABEL_227:
                                  unsigned int v86 = ++v174[1];
LABEL_228:
                                  if (++v88 == v90) {
                                    goto LABEL_239;
                                  }
                                }
                                BOOL v102 = (v87 & (v87 - 1)) != 0;
                                if (v87 < 3) {
                                  BOOL v102 = 1;
                                }
                                unint64_t v103 = v102 | (2 * v87);
                                unint64_t v104 = vcvtps_u32_f32(v101 / *(float *)&v175);
                                if (v103 <= v104) {
                                  int8x8_t prime = (int8x8_t)v104;
                                }
                                else {
                                  int8x8_t prime = (int8x8_t)v103;
                                }
                                if (*(void *)&prime == 1)
                                {
                                  int8x8_t prime = (int8x8_t)2;
                                }
                                else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
                                {
                                  int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
                                  unint64_t v87 = (unint64_t)__p[1];
                                }
                                if (*(void *)&prime > v87) {
                                  goto LABEL_184;
                                }
                                if (*(void *)&prime < v87)
                                {
                                  unint64_t v112 = vcvtps_u32_f32((float)(unint64_t)v174[1] / *(float *)&v175);
                                  if (v87 < 3
                                    || (uint8x8_t v113 = (uint8x8_t)vcnt_s8((int8x8_t)v87),
                                        v113.i16[0] = vaddlv_u8(v113),
                                        v113.u32[0] > 1uLL))
                                  {
                                    unint64_t v112 = std::__next_prime(v112);
                                  }
                                  else
                                  {
                                    uint64_t v114 = 1 << -(char)__clz(v112 - 1);
                                    if (v112 >= 2) {
                                      unint64_t v112 = v114;
                                    }
                                  }
                                  if (*(void *)&prime <= v112) {
                                    int8x8_t prime = (int8x8_t)v112;
                                  }
                                  if (*(void *)&prime >= v87)
                                  {
                                    unint64_t v87 = (unint64_t)__p[1];
                                  }
                                  else
                                  {
                                    if (prime)
                                    {
LABEL_184:
                                      if (*(void *)&prime >> 61) {
                                        std::__throw_bad_array_new_length[abi:nn180100]();
                                      }
                                      v106 = operator new(8 * *(void *)&prime);
                                      uint64_t v107 = __p[0];
                                      __p[0] = v106;
                                      if (v107) {
                                        operator delete(v107);
                                      }
                                      uint64_t v108 = 0;
                                      __p[1] = (void *)prime;
                                      do
                                        *((void *)__p[0] + v108++) = 0;
                                      while (*(void *)&prime != v108);
                                      v109 = (void **)v174[0];
                                      if (v174[0])
                                      {
                                        unint64_t v110 = *((void *)v174[0] + 1);
                                        uint8x8_t v111 = (uint8x8_t)vcnt_s8(prime);
                                        v111.i16[0] = vaddlv_u8(v111);
                                        if (v111.u32[0] > 1uLL)
                                        {
                                          if (v110 >= *(void *)&prime) {
                                            v110 %= *(void *)&prime;
                                          }
                                        }
                                        else
                                        {
                                          v110 &= *(void *)&prime - 1;
                                        }
                                        *((void *)__p[0] + v110) = v174;
                                        for (uint64_t j = *v109; j; v110 = v116)
                                        {
                                          unint64_t v116 = j[1];
                                          if (v111.u32[0] > 1uLL)
                                          {
                                            if (v116 >= *(void *)&prime) {
                                              v116 %= *(void *)&prime;
                                            }
                                          }
                                          else
                                          {
                                            v116 &= *(void *)&prime - 1;
                                          }
                                          if (v116 != v110)
                                          {
                                            if (!*((void *)__p[0] + v116))
                                            {
                                              *((void *)__p[0] + v116) = v109;
                                              goto LABEL_209;
                                            }
                                            *v109 = (void *)*j;
                                            void *j = **((void **)__p[0] + v116);
                                            **((void **)__p[0] + v116) = j;
                                            uint64_t j = v109;
                                          }
                                          unint64_t v116 = v110;
LABEL_209:
                                          v109 = (void **)j;
                                          uint64_t j = (void *)*j;
                                        }
                                      }
                                      unint64_t v87 = (unint64_t)prime;
                                      goto LABEL_213;
                                    }
                                    v120 = __p[0];
                                    __p[0] = 0;
                                    if (v120) {
                                      operator delete(v120);
                                    }
                                    unint64_t v87 = 0;
                                    __p[1] = 0;
                                  }
                                }
LABEL_213:
                                if ((v87 & (v87 - 1)) != 0)
                                {
                                  if (v87 <= v94) {
                                    unint64_t v96 = v94 % v87;
                                  }
                                  else {
                                    unint64_t v96 = v94;
                                  }
                                }
                                else
                                {
                                  unint64_t v96 = (v87 - 1) & v94;
                                }
                                goto LABEL_218;
                              }
LABEL_239:
                              double v121 = v84 * (double)v163;
                              if (*(unsigned char *)v7)
                              {
                                v125 = (const __int16 *)VariationValues;
                                v127 = (unsigned __int16 *)((char *)v165 + __rev16(*v165));
                                if (*v165) {
                                  v128 = v127;
                                }
                                else {
                                  v128 = 0;
                                }
                                unsigned int v130 = *v128;
                                v129 = v128 + 1;
                                uint64_t v131 = __rev16(v130);
                                v123 = (const OTL::BASE *)a1;
                                uint64_t v122 = a4;
                                if (v130)
                                {
                                  uint64_t v132 = 4 * v131;
                                  v133 = v129;
                                  while (*(_DWORD *)v133 != 1868915817)
                                  {
                                    v133 += 2;
                                    v132 -= 4;
                                    if (!v132)
                                    {
                                      v133 = &v129[2 * v131];
                                      break;
                                    }
                                  }
                                }
                                else
                                {
                                  v133 = v129;
                                }
                                if (v131 == ((char *)v133 - (char *)v129) >> 2) {
                                  double v126 = 0.0;
                                }
                                else {
                                  double v126 = v121 * -0.5;
                                }
                                *(double *)(a4 + 32) = v126;
                                LOBYTE(v124) = 1;
                                uint64_t v134 = 2;
                              }
                              else
                              {
                                v123 = (const OTL::BASE *)a1;
                                uint64_t v122 = a4;
                                int v124 = *(unsigned __int8 *)(a4 + 40);
                                v125 = (const __int16 *)VariationValues;
                                if (*(unsigned char *)(a4 + 40))
                                {
                                  double v126 = 0.0;
                                  if (*(unsigned char *)(a4 + 88)) {
                                    goto LABEL_263;
                                  }
                                }
                                else if (!*(unsigned char *)(a4 + 88))
                                {
LABEL_256:
                                  double v126 = 0.0;
                                  goto LABEL_263;
                                }
                                if (*(unsigned char *)(a4 + 24)) {
                                  *(unsigned char *)(a4 + 24) = 0;
                                }
                                if (v124)
                                {
                                  *(unsigned char *)(a4 + 40) = 0;
                                  goto LABEL_256;
                                }
                                double v126 = 0.0;
                                uint64_t v134 = 5;
                              }
                              *(unsigned char *)(v122 + 16 * v134 + 8) = v124;
LABEL_263:
                              v135 = (unsigned int *)v174[0];
                              if (v174[0])
                              {
                                unint64_t v136 = *(void *)v176;
                                do
                                {
                                  v137 = (OTL::BaseCoordTable *)*((void *)v135 + 3);
                                  unsigned __int16 v138 = TOpenTypeBaselineEngine::BaselineClassForTag((TOpenTypeBaselineEngine *)v135[4]);
                                  if (v138 >= 0x100u && !*(unsigned char *)(v122 + 16 * v138 + 8))
                                  {
                                    uint64_t v139 = v138;
                                    OTL::BaseCoordTable::GetCoord(v137, v123, v7, v136, v125);
                                    uint64_t v141 = v122 + 16 * v139;
                                    *(double *)uint64_t v141 = v126 + v140;
                                    *(unsigned char *)(v141 + 8) = 1;
                                  }
                                  v135 = *(unsigned int **)v135;
                                }
                                while (v135);
                              }
                              v142 = (_WORD *)((char *)v166 + __rev16((unsigned __int16)*v166));
                              if (*v166) {
                                v143 = v142;
                              }
                              else {
                                v143 = 0;
                              }
                              unsigned int v145 = *v143;
                              v144 = v143 + 1;
                              uint64_t v146 = __rev16(v145);
                              if (v145)
                              {
                                uint64_t v147 = 4 * v146;
                                v148 = v144;
                                while (*(_DWORD *)v148 != 1868915817)
                                {
                                  v148 += 2;
                                  v147 -= 4;
                                  if (!v147)
                                  {
                                    v148 = &v144[2 * v146];
                                    break;
                                  }
                                }
                              }
                              else
                              {
                                v148 = v144;
                              }
                              if (v146 == ((char *)v148 - (char *)v144) >> 2)
                              {
                                if (!(*(unsigned int (**)(void))(**((void **)v7 + 50) + 736))(*((void *)v7 + 50))) {
                                  goto LABEL_290;
                                }
                                if (*(unsigned char *)v7)
                                {
                                  *(double *)(v122 + 80) = v121 + v126;
                                  v150 = (unsigned char *)(v122 + 88);
                                }
                                else
                                {
                                  *(double *)(v122 + 80) = TBaselineEngineImplementation::GetTypoAscentDescent((TBaseFont **)v7, v85);
                                  *(unsigned char *)(v122 + 88) = 1;
                                  *(void *)(v122 + 32) = v149;
                                  v150 = (unsigned char *)(v122 + 40);
                                }
                              }
                              else
                              {
                                v150 = (unsigned char *)(v122 + 88);
                                if (*(unsigned char *)(v122 + 88)) {
                                  goto LABEL_290;
                                }
                                if (*(unsigned char *)v7)
                                {
                                  double v151 = v121 + v126;
                                }
                                else
                                {
                                  if (!*(unsigned char *)(v122 + 40)) {
                                    goto LABEL_319;
                                  }
                                  double v151 = v121 + *(double *)(v122 + 32);
                                }
                                *(double *)(v122 + 80) = v151;
                              }
                              unsigned char *v150 = 1;
LABEL_290:
                              if (*(unsigned char *)(v122 + 120) || (*(unsigned char *)v7 & 1) != 0 || !*(unsigned char *)(v122 + 104)) {
                                goto LABEL_313;
                              }
                              if (*(unsigned char *)(v122 + 40)) {
                                double v152 = *(double *)(v122 + 32);
                              }
                              else {
                                double v152 = 1.79769313e308;
                              }
                              if (*(unsigned char *)(v122 + 88)) {
                                double v153 = *(double *)(v122 + 80);
                              }
                              else {
                                double v153 = 1.79769313e308;
                              }
                              BOOL v154 = v152 != 1.79769313e308 && v153 == 1.79769313e308;
                              double v155 = -0.0;
                              if (v154) {
                                double v155 = v121;
                              }
                              double v156 = v152 + v155;
                              if (v153 != 1.79769313e308 && v156 != 1.79769313e308) {
                                goto LABEL_312;
                              }
                              double TypoAscentDescent = TBaselineEngineImplementation::GetTypoAscentDescent((TBaseFont **)v7, v85);
                              if (v156 == 1.79769313e308) {
                                double v156 = v158;
                              }
                              if (v153 == 1.79769313e308) {
                                double v153 = TypoAscentDescent;
                              }
                              if (*(unsigned char *)(v122 + 104))
                              {
LABEL_312:
                                *(double *)(v122 + 112) = v153 - (*(double *)(v122 + 96) - v156);
                                *(unsigned char *)(v122 + 120) = 1;
LABEL_313:
                                TBaselineEngineImplementation::SynthesizeMissingBaselines((uint64_t)v7, v122, v126);
                                v159 = v174[0];
                                if (v174[0])
                                {
                                  do
                                  {
                                    v160 = (void *)*v159;
                                    operator delete(v159);
                                    v159 = v160;
                                  }
                                  while (v160);
                                }
                                v161 = __p[0];
                                __p[0] = 0;
                                if (v161) {
                                  operator delete(v161);
                                }
                                return;
                              }
LABEL_319:
                              std::__throw_bad_optional_access[abi:nn180100]();
                              TOpenTypeBaselineEngine::~TOpenTypeBaselineEngine(v162);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void TOpenTypeBaselineEngine::~TOpenTypeBaselineEngine(id *this)
{
  *this = &unk_1ED05F2F8;
}

{
  uint64_t vars8;

  *this = &unk_1ED05F2F8;

  JUMPOUT(0x1853275C0);
}

uint64_t TOpenTypeBaselineEngine::BaselineClassForTag(TOpenTypeBaselineEngine *this)
{
  if ((int)this <= 1768187246)
  {
    switch(this)
    {
      case 0x68616E67:
        int v1 = 1;
        int v2 = 3;
        return v2 | (v1 << 8);
      case 0x69636662:
        int v1 = 1;
        int v2 = 6;
        return v2 | (v1 << 8);
      case 0x69636674:
        int v1 = 1;
        int v2 = 7;
        return v2 | (v1 << 8);
    }
LABEL_16:
    int v2 = 0;
    int v1 = 0;
    return v2 | (v1 << 8);
  }
  if ((int)this > 1835103335)
  {
    if (this == 1835103336)
    {
      int v1 = 1;
      int v2 = 4;
      return v2 | (v1 << 8);
    }
    if (this == 1919905134)
    {
      int v2 = 0;
      int v1 = 1;
      return v2 | (v1 << 8);
    }
    goto LABEL_16;
  }
  if (this == 1768187247)
  {
    int v1 = 1;
    int v2 = 2;
    return v2 | (v1 << 8);
  }
  if (this != 1768191088) {
    goto LABEL_16;
  }
  int v1 = 1;
  int v2 = 5;
  return v2 | (v1 << 8);
}

void OTL::BASE::MapOfBaseScriptTableOffsets(uint64_t *a1, _WORD *a2)
{
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  a1[4] = 0xAAAAAAAA3F800000;
  if (*a2)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    uint64_t v6 = 0;
    LODWORD(v7) = __rev16((unsigned __int16)*a2);
    if (v7 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v7;
    }
    uint64_t v39 = v7;
    unint64_t v8 = a1 + 2;
    while (1)
    {
      unint64_t v9 = &a2[3 * v6];
      unint64_t v10 = bswap32(*(_DWORD *)(v9 + 1));
      __int16 v11 = v9[3];
      if (v5)
      {
        uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v5);
        v12.i16[0] = vaddlv_u8(v12);
        if (v12.u32[0] > 1uLL)
        {
          unint64_t v13 = v10;
          if (v5 <= v10) {
            unint64_t v13 = v10 % v5;
          }
        }
        else
        {
          unint64_t v13 = (v5 - 1) & v10;
        }
        long long v14 = *(uint64_t ***)(*a1 + 8 * v13);
        if (v14)
        {
          for (uint64_t i = *v14; i; uint64_t i = (uint64_t *)*i)
          {
            unint64_t v16 = i[1];
            if (v16 == v10)
            {
              if (*((_DWORD *)i + 4) == v10)
              {
                *((_WORD *)i + 10) = v11;
                goto LABEL_79;
              }
            }
            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v16 >= v5) {
                  v16 %= v5;
                }
              }
              else
              {
                v16 &= v5 - 1;
              }
              if (v16 != v13) {
                break;
              }
            }
          }
        }
      }
      else
      {
        unint64_t v13 = 0xAAAAAAAAAAAAAAAALL;
      }
      uint64_t v17 = operator new(0x18uLL);
      *uint64_t v17 = 0;
      v17[1] = v10;
      *((_DWORD *)v17 + 4) = v10;
      *((_WORD *)v17 + 10) = v11;
      float v18 = (float)(unint64_t)(v4 + 1);
      float v19 = *((float *)a1 + 8);
      if (!v5 || (float)(v19 * (float)v5) < v18) {
        break;
      }
LABEL_69:
      uint64_t v35 = *a1;
      uint64_t v36 = *(void **)(*a1 + 8 * v13);
      if (v36)
      {
        *uint64_t v17 = *v36;
      }
      else
      {
        *uint64_t v17 = *v8;
        void *v8 = v17;
        *(void *)(v35 + 8 * v13) = v8;
        if (!*v17) {
          goto LABEL_78;
        }
        unint64_t v37 = *(void *)(*v17 + 8);
        if ((v5 & (v5 - 1)) != 0)
        {
          if (v37 >= v5) {
            v37 %= v5;
          }
        }
        else
        {
          v37 &= v5 - 1;
        }
        uint64_t v36 = (void *)(*a1 + 8 * v37);
      }
      void *v36 = v17;
LABEL_78:
      uint64_t v4 = a1[3] + 1;
      a1[3] = v4;
LABEL_79:
      if (++v6 == v39) {
        return;
      }
    }
    BOOL v20 = (v5 & (v5 - 1)) != 0;
    if (v5 < 3) {
      BOOL v20 = 1;
    }
    unint64_t v21 = v20 | (2 * v5);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      int8x8_t prime = (int8x8_t)v22;
    }
    else {
      int8x8_t prime = (int8x8_t)v21;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v5 = a1[1];
    }
    if (*(void *)&prime > v5) {
      goto LABEL_35;
    }
    if (*(void *)&prime < v5)
    {
      unint64_t v30 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v5 < 3 || (uint8x8_t v31 = (uint8x8_t)vcnt_s8((int8x8_t)v5), v31.i16[0] = vaddlv_u8(v31), v31.u32[0] > 1uLL))
      {
        unint64_t v30 = std::__next_prime(v30);
      }
      else
      {
        uint64_t v32 = 1 << -(char)__clz(v30 - 1);
        if (v30 >= 2) {
          unint64_t v30 = v32;
        }
      }
      if (*(void *)&prime <= v30) {
        int8x8_t prime = (int8x8_t)v30;
      }
      if (*(void *)&prime >= v5)
      {
        unint64_t v5 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_35:
          if (*(void *)&prime >> 61) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v24 = operator new(8 * *(void *)&prime);
          uint64_t v25 = (void *)*a1;
          *a1 = (uint64_t)v24;
          if (v25) {
            operator delete(v25);
          }
          uint64_t v26 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(void *)(*a1 + 8 * v26++) = 0;
          while (*(void *)&prime != v26);
          uint64_t v27 = (void *)*v8;
          if (*v8)
          {
            unint64_t v28 = v27[1];
            uint8x8_t v29 = (uint8x8_t)vcnt_s8(prime);
            v29.i16[0] = vaddlv_u8(v29);
            if (v29.u32[0] > 1uLL)
            {
              if (v28 >= *(void *)&prime) {
                v28 %= *(void *)&prime;
              }
            }
            else
            {
              v28 &= *(void *)&prime - 1;
            }
            *(void *)(*a1 + 8 * v28) = v8;
            uint64_t v33 = (void *)*v27;
            if (*v27)
            {
              do
              {
                unint64_t v34 = v33[1];
                if (v29.u32[0] > 1uLL)
                {
                  if (v34 >= *(void *)&prime) {
                    v34 %= *(void *)&prime;
                  }
                }
                else
                {
                  v34 &= *(void *)&prime - 1;
                }
                if (v34 != v28)
                {
                  if (!*(void *)(*a1 + 8 * v34))
                  {
                    *(void *)(*a1 + 8 * v34) = v27;
                    goto LABEL_60;
                  }
                  void *v27 = *v33;
                  void *v33 = **(void **)(*a1 + 8 * v34);
                  **(void **)(*a1 + 8 * v34) = v33;
                  uint64_t v33 = v27;
                }
                unint64_t v34 = v28;
LABEL_60:
                uint64_t v27 = v33;
                uint64_t v33 = (void *)*v33;
                unint64_t v28 = v34;
              }
              while (v33);
            }
          }
          unint64_t v5 = (unint64_t)prime;
          goto LABEL_64;
        }
        unint64_t v38 = (void *)*a1;
        *a1 = 0;
        if (v38) {
          operator delete(v38);
        }
        unint64_t v5 = 0;
        a1[1] = 0;
      }
    }
LABEL_64:
    if ((v5 & (v5 - 1)) != 0)
    {
      if (v5 <= v10) {
        unint64_t v13 = v10 % v5;
      }
      else {
        unint64_t v13 = v10;
      }
    }
    else
    {
      unint64_t v13 = (v5 - 1) & v10;
    }
    goto LABEL_69;
  }
}

uint64_t *OTL::BASE::FindScript(uint64_t a1, unint64_t a2, unsigned int a3)
{
  unsigned int v3 = a3;
  if (!result)
  {
    if ((v3 << 24) - 973078528 >= 0xF7000001)
    {
      signed int v7 = v3 & 0xFFFFFF00 | 0x20;
      if (v7 > 1835822367)
      {
        if (v7 <= 1869773087)
        {
          if (v7 == 1835822368)
          {
            unsigned int v3 = 1835825517;
          }
          else if (v7 == 1836674336)
          {
            unsigned int v3 = 1836674418;
          }
        }
        else
        {
          switch(v7)
          {
            case 1869773088:
              unsigned int v3 = 1869773153;
              break;
            case 1952803872:
              unsigned int v3 = 1952803957;
              break;
            case 1953328160:
              unsigned int v3 = 1952542060;
              break;
          }
        }
      }
      else if (v7 <= 1735029279)
      {
        if (v7 == 1651402528)
        {
          unsigned int v3 = 1650814567;
        }
        else if (v7 == 1684370976)
        {
          unsigned int v3 = 1684371041;
        }
      }
      else
      {
        switch(v7)
        {
          case 1735029280:
            unsigned int v3 = 1735748210;
            break;
          case 1735750176:
            unsigned int v3 = 1735750261;
            break;
          case 1802396704:
            unsigned int v3 = 1802396769;
            break;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void OTL::BaseCoordTable::GetCoord(OTL::BaseCoordTable *this, const OTL::BASE *a2, const TFont *a3, unint64_t a4, const __int16 *a5)
{
  unsigned int v8 = bswap32(*(unsigned __int16 *)this) >> 16;
  switch(v8)
  {
    case 3u:
      if (*(void *)a2 <= (unint64_t)this && (unint64_t)this + 6 <= *((void *)a2 + 1))
      {
        unint64_t v13 = (_DWORD *)((char *)a3 + 48);
        if (!*((_DWORD *)a3 + 12)) {
          TFont::InitStrikeMetrics(a3);
        }
        if (a4)
        {
          if (!*v13) {
            TFont::InitStrikeMetrics(a3);
          }
          if (*((_WORD *)this + 2))
          {
            long long v14 = (unsigned __int16 *)((char *)this + __rev16(*((unsigned __int16 *)this + 2)));
            if ((unint64_t)(v14 + 3) <= *((void *)a2 + 1) && v14[2] == 128) {
              ItemVariationStore::ValueForDeltaSet((const OTL::BASE *)((char *)a2 + 16), bswap32(*v14) >> 16, bswap32(v14[1]) >> 16, a4, a5, 0);
            }
          }
        }
      }
      break;
    case 2u:
      if (*(void *)a2 <= (unint64_t)this && (unint64_t)this + 8 <= *((void *)a2 + 1))
      {
        if (!*((_DWORD *)a3 + 12)) {
          TFont::InitStrikeMetrics(a3);
        }
        unint64_t v16 = bswap32(*((unsigned __int16 *)this + 3)) >> 16;
        memset(v17, 170, sizeof(v17));
        TFont::GetControlPoints((TBaseFont **)a3, v16 + 1, v17);
        if (v16 < ((char *)v17[1] - (char *)v17[0]) >> 4 || v17[0]) {
          operator delete(v17[0]);
        }
      }
      break;
    case 1u:
      BOOL v9 = *(void *)a2 > (unint64_t)this || (unint64_t)this + 4 > *((void *)a2 + 1);
      if (!v9 && !*((_DWORD *)a3 + 12)) {
        TFont::InitStrikeMetrics(a3);
      }
      break;
  }
}

uint64_t OTL::BASE::ValueForTag(OTL::BASE *this, atomic_ullong *a2, unsigned int a3, int a4)
{
  unint64_t v4 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  unint64_t v8 = *((void *)this + 1);
  unsigned int v9 = (*(unsigned char *)a2 & 1) != 0 ? *(unsigned __int16 *)(v4 + 6) : *(unsigned __int16 *)(v4 + 4);
  unint64_t v10 = (unsigned __int16 *)(v4 + __rev16(v9));
  if (!v9 || (unint64_t)(v10 + 2) > v8) {
    return 0;
  }
  uint8x8_t v12 = (char *)v10 + __rev16(*v10);
  unint64_t v13 = *v10 ? v12 : 0;
  long long v14 = v13 + 2;
  if (v4 > (unint64_t)v13 || (unint64_t)v14 > v8) {
    return 0;
  }
  uint64_t v16 = __rev16(*(unsigned __int16 *)v13);
  unint64_t v17 = (unint64_t)&v14[4 * v16];
  unint64_t v18 = (unint64_t)(v13 + 6) <= v8 ? (v8 - (unint64_t)v14) >> 2 : 0;
  BOOL v19 = v17 <= v8 && v17 >= (unint64_t)v14;
  if (!v19 && v18 != v16) {
    return 0;
  }
  if (*(_WORD *)v13)
  {
    uint64_t v21 = 4 * v16;
    unint64_t v22 = (unsigned int *)(v13 + 2);
    while (bswap32(*v22) != a4)
    {
      ++v22;
      v21 -= 4;
      if (!v21)
      {
        unint64_t v22 = (unsigned int *)&v14[4 * v16];
        break;
      }
    }
  }
  else
  {
    unint64_t v22 = (unsigned int *)(v13 + 2);
  }
  unint64_t v23 = (char *)v22 - v14;
  if (v16 == ((char *)v22 - v14) >> 2) {
    return 0;
  }
  unsigned int v24 = v10[1];
  uint64_t v25 = (char *)v10 + __rev16(v24);
  uint64_t v26 = v24 ? v25 : 0;
  uint64_t v27 = v26 + 2;
  if (v4 > (unint64_t)v26 || (unint64_t)v27 > v8) {
    return 0;
  }
  uint64_t v29 = bswap32(*(unsigned __int16 *)v26) >> 16;
  unint64_t v30 = (unint64_t)&v27[3 * v29];
  if (v30 < (unint64_t)v27 || v30 > v8)
  {
    unint64_t v32 = (v8 - (unint64_t)v27) / 6;
    unint64_t v33 = (unint64_t)(v26 + 8) <= v8 ? v32 : 0;
    if (v33 != v29) {
      return 0;
    }
  }
  *(void *)&long long v34 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)CGSize v60 = v34;
  long long v61 = v34;
  unint64_t v62 = 0xAAAAAAAAFFFFFFFFLL;
  OTL::BASE::MapOfBaseScriptTableOffsets((uint64_t *)v60, v26);
  Script = OTL::BASE::FindScript(v60[0], v60[1], a3);
  if (!Script || !*((_WORD *)Script + 10))
  {
    std::__hash_table<EncoderAttempt,std::hash<EncoderAttempt>,std::equal_to<EncoderAttempt>,std::allocator<EncoderAttempt>>::~__hash_table((uint64_t)v60);
    return 0;
  }
  uint64_t v36 = &v26[__rev16(*((unsigned __int16 *)Script + 10))];
  std::__hash_table<EncoderAttempt,std::hash<EncoderAttempt>,std::equal_to<EncoderAttempt>,std::allocator<EncoderAttempt>>::~__hash_table((uint64_t)v60);
  unint64_t v37 = *(void *)this;
  unint64_t v38 = *((void *)this + 1);
  uint64_t v39 = (unsigned __int16 *)(v36 + 6);
  if ((unint64_t)(v36 + 4) < *(void *)this || (unint64_t)v39 > v38) {
    return 0;
  }
  uint64_t v41 = bswap32(*((unsigned __int16 *)v36 + 2)) >> 16;
  unint64_t v42 = (unint64_t)&v39[3 * v41];
  if (v42 < (unint64_t)v39 || v42 > v38)
  {
    unint64_t v44 = (v38 - (unint64_t)v39) / 6;
    if ((unint64_t)(v36 + 12) > v38) {
      unint64_t v44 = 0;
    }
    if (v44 != v41) {
      return 0;
    }
  }
  if (!*(_WORD *)v36) {
    return 0;
  }
  unint64_t v45 = &v36[__rev16(*(unsigned __int16 *)v36)];
  unint64_t v46 = (unint64_t)(v45 + 4);
  if ((unint64_t)(v45 + 2) < v37 || v46 > v38) {
    return 0;
  }
  unsigned int v48 = *((unsigned __int16 *)v45 + 1);
  uint64_t v49 = __rev16(v48);
  unint64_t v50 = v46 + 2 * v49;
  unint64_t v51 = (unint64_t)(v45 + 6) <= v38 ? (v38 - v46) >> 1 : 0;
  BOOL v52 = v50 <= v38 && v50 >= v46;
  if (!v52 && v51 != v49) {
    return 0;
  }
  uint64_t result = 0;
  if (v48 == *(unsigned __int16 *)v13)
  {
    unint64_t v55 = v23 >> 2;
    if (v49 > (unsigned __int16)(v23 >> 2))
    {
      if (*(_WORD *)&v45[2 * (unsigned __int16)v55 + 4])
      {
        CGSize v56 = (OTL::BaseCoordTable *)&v45[__rev16(*(unsigned __int16 *)&v45[2 * (unsigned __int16)v55 + 4])];
        if (v37 <= (unint64_t)v56 && (unint64_t)v56 + 4 <= v38)
        {
          v60[0] = 0xAAAAAAAAAAAAAAAALL;
          unint64_t VariationValues = (const __int16 *)TFont::GetVariationValues(a2, v60);
          OTL::BaseCoordTable::GetCoord(v56, this, (const TFont *)a2, v60[0], VariationValues);
          return v59;
        }
      }
      return 0;
    }
  }
  return result;
}

void std::__function::__func<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0,std::allocator<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0>,BOOL ()(TRun &)>::~__func()
{
}

void *std::__function::__func<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0,std::allocator<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0>,BOOL ()(TRun &)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_1ED061280;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0,std::allocator<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0>,BOOL ()(TRun &)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1ED061280;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0,std::allocator<TOpenTypeBaselineEngine::ApplyScriptSpecificMetrics(void)::$_0>,BOOL ()(TRun &)>::operator()(uint64_t a1, atomic_ullong *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(atomic_ullong **)(atomic_load_explicit(a2 + 7, memory_order_acquire) + 40);
  atomic_ullong v4 = v3[50];
  if (!v4 || !(*(unsigned int (**)(atomic_ullong))(*(void *)v4 + 384))(v4)) {
    return 0;
  }
  unsigned int v6 = *(_DWORD *)(*(void *)(v2 + 8) + 32);
  signed int v7 = (OTL::BASE *)(v2 + 40);
  if (*(_DWORD *)v3) {
    int v8 = 1986098019;
  }
  else {
    int v8 = 1751216995;
  }
  double v9 = COERCE_DOUBLE(OTL::BASE::ValueForTag(v7, v3, v6, v8));
  BOOL v11 = v10 != 0;
  if (v10 && v9 > 0.0) {
    *(double *)(TRun::EnsureRareData((TRun *)a2) + 32) = v9;
  }
  if (*(_DWORD *)v3) {
    int v12 = 1986294627;
  }
  else {
    int v12 = 1751413603;
  }
  double v13 = COERCE_DOUBLE(OTL::BASE::ValueForTag(v7, v3, v6, v12));
  if (v14)
  {
    BOOL v11 = 1;
    if (v13 != 0.0) {
      *(double *)(TRun::EnsureRareData((TRun *)a2) + 40) = fabs(v13);
    }
  }
  if (*(_DWORD *)v3) {
    int v15 = 1986815856;
  }
  else {
    int v15 = 1751934832;
  }
  double v16 = COERCE_DOUBLE(OTL::BASE::ValueForTag(v7, v3, v6, v15));
  if (v17)
  {
    if (v16 > 0.0) {
      *(double *)(TRun::EnsureRareData((TRun *)a2) + ++*(void *)(this + 48) = v16;
    }
    return 1;
  }
  return v11;
}

void *TGenericBaselineEngine::TGenericBaselineEngine(void *a1, uint64_t a2)
{
  uint64_t v3 = TBaselineEngineImplementation::TBaselineEngineImplementation(a1, a2, 0);
  *uint64_t v3 = &unk_1ED05F0B8;
  uint64_t v4 = v3[1];
  uint64_t v5 = *(void *)(v4 + 40);
  unsigned int v6 = *(long long **)(v5 + 184);
  if (v6 && *((unsigned char *)v6 + 128))
  {
    uint64_t v7 = v4 + 80;
    long long v8 = *v6;
    long long v9 = v6[1];
    long long v10 = v6[3];
    *(_OWORD *)(v4 + 112) = v6[2];
    *(_OWORD *)(v4 + 128) = v10;
    *(_OWORD *)(v4 + 80) = v8;
    *(_OWORD *)(v4 + 96) = v9;
    long long v11 = v6[4];
    long long v12 = v6[5];
    long long v13 = v6[7];
    *(_OWORD *)(v4 + 176) = v6[6];
    *(_OWORD *)(v4 + 192) = v13;
    *(_OWORD *)(v4 + 144) = v11;
    *(_OWORD *)(v4 + 160) = v12;
    uint64_t v5 = *(void *)(a1[1] + 40);
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v7 = v4 + 80;
    uint64_t v15 = v4 + 88;
    do
    {
      if (*(unsigned char *)(v15 + v14)) {
        *(unsigned char *)(v15 + v14) = 0;
      }
      v14 += 16;
    }
    while (v14 != 128);
  }
  double v16 = *(unsigned char **)(atomic_load_explicit((atomic_ullong *volatile)(v5 + 56), memory_order_acquire) + 40);
  if ((*v16 & 1) == 0) {
    TBaselineEngineImplementation::SynthesizeMissingBaselines((uint64_t)v16, v7, 0.0);
  }
  return a1;
}

uint64_t TGenericBaselineEngine::CanProcess(TGenericBaselineEngine *this)
{
  return 1;
}

void TGenericBaselineEngine::~TGenericBaselineEngine(id *this)
{
  *this = &unk_1ED05F2F8;
}

{
  uint64_t vars8;

  *this = &unk_1ED05F2F8;

  JUMPOUT(0x1853275C0);
}

void TAATAnkrTable::TAATAnkrTable(TAATAnkrTable *this, const TFont *a2)
{
  (*(void (**)(void, uint64_t))(**((void **)a2 + 50) + 480))(*((void *)a2 + 50), 1634626418);
  CFDataRef v4 = (const __CFData *)(id)atomic_load_explicit((atomic_ullong *volatile)this, memory_order_acquire);
  CFDataRef v5 = v4;
  if (v4) {
    BytePtr = CFDataGetBytePtr(v4);
  }
  else {
    BytePtr = 0;
  }

  *((void *)this + 1) = BytePtr;
  id v7 = (id)atomic_load_explicit((atomic_ullong *volatile)this, memory_order_acquire);
  CFDataRef v8 = (const __CFData *)v7;
  if (v8)
  {
    CFDataRef v9 = v8;
    long long v10 = (SFNTLookupTable *)CFDataGetBytePtr(v8);

    if (v10) {
      long long v10 = (SFNTLookupTable *)((char *)v10 + CFDataGetLength((CFDataRef)v7));
    }
  }
  else
  {

    long long v10 = 0;
  }

  *((void *)this + 3) = TAATLookupTable::BadTable;
  *((void *)this + 2) = v10;
  *((void *)this + 4) = 0;
  *((void *)this + 8) = 0;
  *((_WORD *)this + 36) = -1;
  uint64_t v11 = *((void *)this + 1);
  if (v11)
  {
    if (v11 + 12 > (unint64_t)v10 || *(_WORD *)v11)
    {
      long long v12 = TFont::DebugDescription(a2);
      CFLog();

      (*(void (**)(void))(**((void **)a2 + 50) + 488))(*((void *)a2 + 50));
      *((void *)this + 1) = 0;
    }
    else
    {
      TAATLookupTable::SetTable((uint64_t)this + 24, (const SFNTLookupTable *)(v11 + bswap32(*(_DWORD *)(v11 + 4))), v10);
      *((void *)this + 10) = *((void *)this + 1) + bswap32(*(_DWORD *)(*((void *)this + 1) + 8));
    }
  }
}

double TAATAnkrTable::GetControlPointCoordinates(TAATAnkrTable *this, uint64_t a2, unsigned int a3)
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v6 = (uint64_t (*)(void *, uint64_t, unint64_t *))*((void *)this + 3);
  uint64_t v7 = *((void *)this + 4);
  CFDataRef v8 = (void *)((char *)this + (v7 >> 1) + 24);
  if (v7) {
    unsigned int v6 = *(uint64_t (**)(void *, uint64_t, unint64_t *))(*v8 + v6);
  }
  CFDataRef v9 = (unsigned __int16 *)v6(v8, a2, &v18);
  if (v9)
  {
    long long v10 = (unsigned int *)(*((void *)this + 10) + (bswap32(*v9) >> 16));
    unint64_t v11 = *((void *)this + 1);
    unint64_t v12 = *((void *)this + 2);
    if (v11 <= (unint64_t)v10 && (unint64_t)(v10 + 2) <= v12)
    {
      uint64_t v14 = &v10[a3 + 1];
      if (bswap32(*v10) > a3 && v11 <= (unint64_t)v14 && (unint64_t)(v14 + 1) <= v12) {
        return (double)((int)bswap32(*(unsigned __int16 *)v14) >> 16);
      }
    }
  }
  return v5;
}

uint64_t TBaselineAttributes::BaselineClassFromName(CFTypeRef cf1, const __CFString *a2)
{
  uint64_t v3 = 0;
  v8[16] = *MEMORY[0x1E4F143B8];
  v8[1] = 0xAAAAAAAAAAAAAA00;
  v8[3] = 0xAAAAAAAAAAAAAA01;
  v8[5] = 0xAAAAAAAAAAAAAA02;
  v8[7] = 0xAAAAAAAAAAAAAA05;
  v8[9] = 0xAAAAAAAAAAAAAA03;
  v8[11] = 0xAAAAAAAAAAAAAA04;
  v8[13] = 0xAAAAAAAAAAAAAA06;
  v8[0] = @"CTBaselineClassRoman";
  void v8[2] = @"CTBaselineClassIdeographicCentered";
  v8[4] = @"CTBaselineClassIdeographicLow";
  v8[6] = @"CTBaselineClassIdeographicHigh";
  v8[8] = @"CTBaselineClassHanging";
  v8[10] = @"CTBaselineClassMath";
  v8[12] = @"CTBaselineClassICFBottom";
  v8[14] = @"CTBaselineClassICFTop";
  v8[15] = 0xAAAAAAAAAAAAAA07;
  while (1)
  {
    CFTypeRef v4 = (CFTypeRef)v8[v3];
    int v5 = LOBYTE(v8[v3 + 1]);
    if (v4 == cf1 || cf1 && v4 && CFEqual(cf1, v4)) {
      break;
    }
    v3 += 2;
    if (v3 == 16)
    {
      int v5 = 0;
      int v6 = 0;
      return v5 | (v6 << 8);
    }
  }
  int v6 = 1;
  return v5 | (v6 << 8);
}

double TAATOpbdTable::LookupByDistance(TAATOpbdTable *this, uint64_t a2)
{
  double DefaultBounds = TAATOpbdTable::GetDefaultBounds(this, a2);
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  SideValues = TAATOpbdTable::GetSideValues(this, a2);
  if (SideValues && (**(unsigned char **)this & 1) == 0)
  {
    CGFloat v12 = -(*((double *)this + 1) * (double)((int)bswap32(*(unsigned __int16 *)SideValues) >> 16));
    v14.size.CGFloat width = v8 - (v12 - DefaultBounds);
    v14.origin.CGFloat x = v12;
    v14.origin.CGFloat y = v6;
    v14.size.CGFloat height = v10;
    CGRectGetMaxX(v14);
    return v12;
  }
  return DefaultBounds;
}

double TAATOpbdTable::LookupByControlPoint(TAATControlPointAccess **this, uint64_t a2)
{
  double DefaultBounds = TAATOpbdTable::GetDefaultBounds((TAATOpbdTable *)this, a2);
  SideValues = TAATOpbdTable::GetSideValues((TAATOpbdTable *)this, a2);
  if (SideValues)
  {
    CGFloat v6 = (unsigned __int16 *)SideValues;
    unsigned int v7 = *(unsigned __int16 *)SideValues;
    if (v7 != 0xFFFF) {
      double DefaultBounds = *((double *)this + 1)
    }
                    * TAATControlPointAccess::GetControlPointCoordinates(this[8], a2, __rev16(v7));
    unsigned int v8 = v6[2];
    if (v8 != 0xFFFF) {
      TAATControlPointAccess::GetControlPointCoordinates(this[8], a2, __rev16(v8));
    }
    unsigned int v9 = v6[3];
    if (v9 != 0xFFFF) {
      TAATControlPointAccess::GetControlPointCoordinates(this[8], a2, __rev16(v9));
    }
    unsigned int v10 = v6[1];
    if (v10 != 0xFFFF) {
      TAATControlPointAccess::GetControlPointCoordinates(this[8], a2, __rev16(v10));
    }
  }
  return DefaultBounds;
}

double TAATOpbdTable::InvalidLookup(TAATOpbdTable *this)
{
  return *MEMORY[0x1E4F1DB20];
}

unsigned __int8 *TAATOpbdTable::GetSideValues(TAATOpbdTable *this, uint64_t a2)
{
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v22 = v4;
  long long v21 = v4;
  double v5 = (SFNTLookupTable *)*((void *)this + 5);
  CGFloat v6 = (const SFNTLookupTable *)(*((void *)this + 4) + 6);
  BOOL v19 = TAATLookupTable::BadTable;
  uint64_t v20 = 0;
  *((void *)&v22 + 1) = 0;
  unint64_t v23 = 0xAAAAAAAAAAAAFFFFLL;
  TAATLookupTable::SetTable((uint64_t)&v19, v6, v5);
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  unsigned int v7 = v19;
  unsigned int v8 = (TAATLookupTable *)((char *)&v19 + (v20 >> 1));
  if (v20) {
    unsigned int v7 = *(uint64_t (**)(TAATLookupTable *, unsigned __int16, unint64_t *))(*(void *)v8
  }
                                                                                           + v19);
  uint64_t result = (unsigned __int8 *)v7(v8, a2, &v18);
  if (result)
  {
    unint64_t v10 = v18;
    unint64_t v12 = *((void *)this + 4);
    unint64_t v11 = *((void *)this + 5);
    unint64_t v13 = (unint64_t)&result[v18];
    BOOL v14 = v12 <= (unint64_t)result && v13 >= (unint64_t)result;
    if (!v14 || v13 > v11) {
      return 0;
    }
    if (v18)
    {
      LODWORD(v16) = 0;
      do
      {
        unsigned int v17 = *result++;
        uint64_t v16 = v17 | (v16 << 8);
        --v10;
      }
      while (v10);
    }
    else
    {
      uint64_t v16 = 0;
    }
    uint64_t result = (unsigned __int8 *)(v12 + v16);
    if (v12 + v16 + 8 > v11) {
      return 0;
    }
  }
  return result;
}

BOOL TRunComparator::RunsSimilar(TRunComparator *this, const TRun *a2, const TRun *a3)
{
  if (*((unsigned __int8 *)a2 + 224) != *((unsigned __int8 *)a3 + 224) || *((_DWORD *)a2 + 76) != *((_DWORD *)a3 + 76)) {
    return 0;
  }
  id v11 = (id)0xAAAAAAAAAAAAAAAALL;
  TAttributes::OriginalFont((atomic_ullong *)a2 + 5, (atomic_ullong *)&v11);
  id v10 = (id)0xAAAAAAAAAAAAAAAALL;
  TAttributes::OriginalFont((atomic_ullong *)a3 + 5, (atomic_ullong *)&v10);
  if (atomic_load_explicit((atomic_ullong *volatile)&v11, memory_order_acquire)) {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&v11, memory_order_acquire);
  }
  else {
    unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)a2 + 7, memory_order_acquire);
  }
  unsigned int v7 = *(TFont **)(explicit + 40);
  unsigned int v8 = (atomic_ullong *)&v10;
  if (!atomic_load_explicit((atomic_ullong *volatile)&v10, memory_order_acquire)) {
    unsigned int v8 = (atomic_ullong *)((char *)a3 + 56);
  }
  BOOL v6 = TFont::Compare(v7, *(const TFont **)(atomic_load_explicit(v8, memory_order_acquire) + 40), 0) != 0;

  return v6;
}

void TScriptRun::GetScriptRunsForLine(TLine *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *((void *)a1 + 3) - *((void *)a1 + 2);
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    unsigned __int8 v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = v4 >> 3;
    uint64_t v9 = 2863311360;
    uint64_t v73 = v4 >> 3;
    while (1)
    {
      uint64_t v10 = *((void *)a1 + 2);
      uint64_t v11 = *(void *)(*(void *)(v10 + 8 * v5) + 40);
      unint64_t v13 = *(void ***)(v11 + 8);
      uint64_t v12 = *(void *)(v11 + 16);
      if (v5 + 1 >= v8)
      {
        BOOL v71 = 0;
        uint64_t v70 = v5 + 1;
      }
      else
      {
        uint64_t v75 = v7;
        uint64_t v14 = *(void *)(*(void *)(v10 + 8 * (v5 + 1)) + 40);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 16))(a3, v11, v14))
        {
          uint64_t v15 = v5 + 2;
          while (1)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)(v14 + 8);
            uint64_t v18 = (uint64_t)v13 + v12;
            if (v17 < (uint64_t)v13) {
              unint64_t v13 = *(void ***)(v14 + 8);
            }
            uint64_t v19 = *(void *)(v14 + 16) + v17;
            if (v18 > v19) {
              uint64_t v19 = v18;
            }
            uint64_t v12 = v19 - (void)v13;
            uint64_t v20 = v73;
            if (v73 == v16) {
              break;
            }
            uint64_t v14 = *(void *)(*(void *)(*((void *)a1 + 2) + 8 * v16) + 40);
            int v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a3 + 16))(a3, v11, v14);
            uint64_t v15 = v16 + 1;
            if (!v21)
            {
              uint64_t v22 = v16;
              uint64_t v20 = v73;
              goto LABEL_16;
            }
          }
          uint64_t v22 = v73;
LABEL_16:
          uint64_t v70 = v22;
          BOOL v71 = v16 < v20;
        }
        else
        {
          BOOL v71 = 1;
          uint64_t v70 = v5 + 1;
        }
        uint64_t v7 = v75;
      }
      *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v103[13] = v23;
      v103[14] = v23;
      v103[11] = v23;
      v103[12] = v23;
      v103[9] = v23;
      v103[10] = v23;
      v103[7] = v23;
      v103[8] = v23;
      v103[5] = v23;
      v103[6] = v23;
      v103[3] = v23;
      v103[4] = v23;
      v103[1] = v23;
      v103[2] = v23;
      long long v102 = v23;
      v103[0] = v23;
      unint64_t v101 = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v86[8] = v23;
      uint64_t v83 = (uint64_t)v13 + v12;
      double v84 = v13;
      v86[16] = 0;
      uint64_t v85 = 0;
      *(void *)unsigned int v86 = 0;
      *(void *)&v86[5] = 0;
      unint64_t v87 = a1;
      uint64_t v88 = a2;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      uint64_t v100 = 0;
      uint64_t v24 = *(void *)(a2 + 16);
      long long v102 = 0uLL;
      unint64_t v101 = 0;
      *(void *)&long long v99 = v24;
      unint64_t v104 = v103;
      unint64_t v74 = v9 | v7 | v6 | 0xAAAAAA0000000000;
      while (TScriptRun::NextRun((uint64_t)&v83, v74))
      {
        int v76 = *(_DWORD *)&v86[8];
        uint64_t v25 = v84;
        if (v85 < 1)
        {
          uint64_t v42 = 0;
          unint64_t v28 = v84;
        }
        else
        {
          uint64_t v26 = (void **)((char *)v84 + v85);
          uint64_t v27 = (uint64_t)v84;
          unint64_t v28 = v84;
          while (1)
          {
            uint64_t v29 = *(void **)(*(void *)(*((void *)a1 + 2) + 8 * TLine::FindRunWithCharIndex(a1, v27, 1)) + 40);
            unint64_t v30 = (void **)v29[1];
            uint8x8_t v31 = (void **)((char *)v30 + v29[2]);
            if ((uint64_t)v31 >= (uint64_t)v26) {
              unint64_t v32 = v26;
            }
            else {
              unint64_t v32 = (void **)((char *)v30 + v29[2]);
            }
            uint64_t v33 = (char *)v32 - (char *)v25;
            BOOL v34 = (uint64_t)v30 <= (uint64_t)v25 && (uint64_t)v25 < (uint64_t)v31;
            if (v34) {
              uint64_t v35 = v25;
            }
            else {
              uint64_t v35 = 0;
            }
            if (!v34) {
              uint64_t v33 = 0;
            }
            uint64_t v36 = (char *)v32 - (char *)v30;
            if ((uint64_t)v25 <= (uint64_t)v30 && (uint64_t)v30 < (uint64_t)v26)
            {
              uint64_t v38 = v36;
            }
            else
            {
              unint64_t v30 = v35;
              uint64_t v38 = v33;
            }
            uint64_t v39 = (uint64_t)v30 >= (uint64_t)v28 ? v28 : v30;
            uint64_t v40 = (uint64_t)v30 + v38;
            uint64_t v41 = v27 <= v40 ? v40 : v27;
            uint64_t v42 = v41 - (void)v39;
            if ((uint64_t)v26 <= v40) {
              break;
            }
            while (1)
            {
              BOOL v43 = (void *)v29[3];
              if (!v43)
              {
                unint64_t v28 = v39;
                goto LABEL_83;
              }
              uint64_t v44 = v43[1];
              uint64_t v45 = v43[2] + v44;
              if (v45 >= (uint64_t)v26) {
                unint64_t v46 = (char *)v26;
              }
              else {
                unint64_t v46 = (char *)(v43[2] + v44);
              }
              unint64_t v47 = (char *)(v46 - (char *)v25);
              BOOL v48 = v44 <= (uint64_t)v25 && (uint64_t)v25 < v45;
              if (v48) {
                uint64_t v49 = v25;
              }
              else {
                uint64_t v49 = 0;
              }
              if (!v48) {
                unint64_t v47 = 0;
              }
              unint64_t v50 = &v46[-v44];
              BOOL v51 = (uint64_t)v25 <= v44 && v44 < (uint64_t)v26;
              BOOL v52 = v51 ? (void **)v43[1] : v49;
              uint64_t v53 = (uint64_t)(v51 ? v50 : v47);
              if (!TFont::Compare(*(TFont **)(atomic_load_explicit(v29 + 7, memory_order_acquire) + 40), *(const TFont **)(atomic_load_explicit(v43 + 7, memory_order_acquire) + 40), 0))break; {
              if ((uint64_t)v52 >= (uint64_t)v39)
              }
                unint64_t v28 = v39;
              else {
                unint64_t v28 = v52;
              }
              uint64_t v54 = (char *)v39 + v42;
              if ((uint64_t)v39 + v42 <= (uint64_t)v52 + v53) {
                uint64_t v54 = (char *)v52 + v53;
              }
              uint64_t v42 = v54 - (char *)v28;
              uint64_t v29 = v43;
              uint64_t v39 = v28;
              if ((uint64_t)v26 <= (uint64_t)((char *)v52 + v53)) {
                goto LABEL_83;
              }
            }
            uint64_t v80 = v42;
            int v82 = -1431655766;
            v79 = v39;
            int v81 = v76;
            CGSize v56 = (char *)*a4;
            unint64_t v55 = (char *)a4[1];
            if (v55 != (char *)*a4)
            {
              unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v55[-*a4] >> 3);
              do
              {
                unint64_t v58 = v57 >> 1;
                uint64_t v59 = (uint64_t *)&v56[24 * (v57 >> 1)];
                uint64_t v61 = *v59;
                CGSize v60 = (char *)(v59 + 3);
                v57 += ~(v57 >> 1);
                if (v61 < (uint64_t)v39) {
                  CGSize v56 = v60;
                }
                else {
                  unint64_t v57 = v58;
                }
              }
              while (v57);
              unint64_t v55 = v56;
            }
            std::vector<TScriptRunInfo,TInlineBufferAllocator<TScriptRunInfo,30ul>>::insert(a4, v55, (unint64_t)&v79);
            unint64_t v28 = (void **)((char *)v39 + v42);
            uint64_t v42 = 0;
LABEL_83:
            uint64_t v27 = (uint64_t)v28 + v42;
            if ((uint64_t)((char *)v28 + v42) >= (uint64_t)v26) {
              goto LABEL_87;
            }
          }
          unint64_t v28 = v39;
        }
LABEL_87:
        uint64_t v80 = v42;
        int v82 = -1431655766;
        v79 = v28;
        int v81 = v76;
        unint64_t v63 = (char *)*a4;
        unint64_t v62 = (char *)a4[1];
        if (v62 != (char *)*a4)
        {
          unint64_t v64 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v62[-*a4] >> 3);
          do
          {
            unint64_t v65 = v64 >> 1;
            unsigned int v66 = (uint64_t *)&v63[24 * (v64 >> 1)];
            uint64_t v68 = *v66;
            CGRect v67 = (char *)(v66 + 3);
            v64 += ~(v64 >> 1);
            if (v68 < (uint64_t)v28) {
              unint64_t v63 = v67;
            }
            else {
              unint64_t v64 = v65;
            }
          }
          while (v64);
          unint64_t v62 = v63;
        }
        std::vector<TScriptRunInfo,TInlineBufferAllocator<TScriptRunInfo,30ul>>::insert(a4, v62, (unint64_t)&v79);
      }
      if (!v71) {
        break;
      }
      unsigned __int8 v6 = v86[12];
      uint64_t v9 = *(_DWORD *)&v86[12] & 0xFFFFFF00;
      uint64_t v7 = *(void *)&v86[12] & 0xFF00000000;
      v79 = (void **)&v101;
      std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100](&v79);
      uint64_t v8 = v73;
      uint64_t v5 = v70;
      if (v70 >= v73) {
        return;
      }
    }
    v79 = (void **)&v101;
    std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100](&v79);
  }
}

void *std::vector<TScriptRunInfo,TInlineBufferAllocator<TScriptRunInfo,30ul>>::insert(void *result, char *__src, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v4 = __src;
  uint64_t v5 = (char **)result;
  unsigned __int8 v6 = (char *)result[1];
  unint64_t v7 = result[2];
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v12 = (char *)*result;
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v6[-*result] >> 3) + 1;
    unint64_t v39 = 0xAAAAAAAAAAAAAAAALL;
    if (v13 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    uint64_t v14 = __src - v12;
    int64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((__src - v12) >> 3);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)v12) >> 3);
    if (2 * v16 > v13) {
      unint64_t v13 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v13;
    }
    uint64_t v41 = result + 3;
    if (v17) {
      uint64_t v18 = TInlineBufferAllocator<std::pair<double,CFRange>,30ul>::allocate((uint64_t)(result + 3), v17);
    }
    else {
      uint64_t v18 = 0;
    }
    int v21 = &v18[24 * v15];
    uint64_t v22 = &v18[24 * v17];
    uint64_t v40 = v22;
    if (v15 == v17)
    {
      if (v14 < 1)
      {
        if (v12 == v4) {
          unint64_t v24 = 1;
        }
        else {
          unint64_t v24 = 2 * v15;
        }
        unint64_t v46 = v5 + 3;
        uint64_t v25 = TInlineBufferAllocator<std::pair<double,CFRange>,30ul>::allocate((uint64_t)(v5 + 3), v24);
        uint64_t v26 = &v25[24 * (v24 >> 2)];
        unint64_t v37 = v25;
        uint64_t v38 = v26;
        uint64_t v42 = v18;
        BOOL v43 = &v18[24 * v15];
        uint64_t v40 = &v25[24 * v24];
        uint64_t v44 = v43;
        uint64_t v45 = v22;
        std::__split_buffer<std::pair<double,CFRange>,TInlineBufferAllocator<std::pair<double,CFRange>,30ul> &>::~__split_buffer((uint64_t)&v42);
        int v21 = v26;
      }
      else
      {
        uint64_t v23 = v15 + 2;
        if (v15 >= -1) {
          uint64_t v23 = v15 + 1;
        }
        v21 -= 24 * (v23 >> 1);
      }
    }
    long long v27 = *(_OWORD *)a3;
    *((void *)v21 + 2) = *(void *)(a3 + 16);
    *(_OWORD *)int v21 = v27;
    unint64_t v28 = v21 + 24;
    unint64_t v39 = (unint64_t)(v21 + 24);
    uint64_t v29 = *v5;
    if (*v5 != v4)
    {
      unint64_t v30 = v4;
      do
      {
        long long v31 = *(_OWORD *)(v30 - 24);
        *((_DWORD *)v21 - 2) = *((_DWORD *)v30 - 2);
        *(_OWORD *)(v21 - 24) = v31;
        v21 -= 24;
        v30 -= 24;
      }
      while (v30 != v29);
      unint64_t v28 = (char *)v39;
    }
    unint64_t v32 = v5[1];
    int64_t v33 = v32 - v4;
    if (v32 != v4)
    {
      memmove(v28, v4, v33 - 4);
      uint64_t v4 = v5[1];
    }
    BOOL v34 = *v5;
    *uint64_t v5 = v21;
    v5[1] = &v28[v33];
    uint64_t v35 = v5[2];
    void v5[2] = v40;
    unint64_t v39 = (unint64_t)v4;
    uint64_t v40 = v35;
    unint64_t v37 = v34;
    uint64_t v38 = v34;
    return (void *)std::__split_buffer<std::pair<double,CFRange>,TInlineBufferAllocator<std::pair<double,CFRange>,30ul> &>::~__split_buffer((uint64_t)&v37);
  }
  else if (__src == v6)
  {
    long long v20 = *(_OWORD *)a3;
    *((void *)__src + 2) = *(void *)(a3 + 16);
    *(_OWORD *)__src = v20;
    result[1] = __src + 24;
  }
  else
  {
    uint64_t v8 = __src + 24;
    uint64_t v9 = v6 - 24;
    uint64_t v10 = result[1];
    while (v9 < v6)
    {
      long long v11 = *(_OWORD *)v9;
      *(void *)(v10 + 16) = *((void *)v9 + 2);
      *(_OWORD *)uint64_t v10 = v11;
      v10 += 24;
      v9 += 24;
    }
    result[1] = v10;
    if (v6 != v8) {
      uint64_t result = memmove(v8, __src, v6 - v8 - 4);
    }
    if ((unint64_t)v4 <= v3) {
      v3 += 24 * ((unint64_t)v5[1] > v3);
    }
    long long v19 = *(_OWORD *)v3;
    *((_DWORD *)v4 + 4) = *(_DWORD *)(v3 + 16);
    *(_OWORD *)uint64_t v4 = v19;
  }
  return result;
}

uint64_t DestroyTable(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = 0;
    while (1)
    {
      if (*(void *)(v1 + v2))
      {
        *(void *)(v1 + v2) = 0;
        (*(void (**)(void))(v1 + v2 + 8))();
      }
      v2 += 16;
      if (v2 == 144)
      {
        JUMPOUT(0x1853275C0);
      }
    }
  }
  return result;
}

BOOL DictHasUnmatchedNames(NSDictionary *a1, NSString *a2, NSString *a3, NSString *a4)
{
  if (!a4) {
    return 0;
  }
  unint64_t v7 = [(NSDictionary *)a1 objectForKey:a2];
  if ([(NSString *)a4 isEqualToString:v7]) {
    return 0;
  }
  unint64_t v9 = [(NSDictionary *)a1 objectForKey:a3];
  return ![(NSString *)a4 isEqualToString:v9] && (v7 | v9) != 0;
}

CFTypeRef CTFontDescriptorCopyDownloadableFontAttributesForRequests(const __CFArray *a1)
{
  return CopyDownloadableFontAttributesForRequests(a1, 0);
}

CFTypeRef CopyDownloadableFontAttributesForRequests(const __CFArray *a1, unint64_t a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  self;
  char v56 = a2;
  if ([(__CFArray *)a1 count] == 1) {
    LOBYTE(v4) = (a2 & 0x1000 | objc_msgSend((id)-[__CFArray firstObject](a1, "firstObject"), "objectForKey:", @"NSFontNameAttribute")) != 0;
  }
  else {
    uint64_t v4 = (a2 >> 12) & 1;
  }
  char v50 = v4;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  CFArrayRef obj = a1;
  uint64_t v5 = [(__CFArray *)a1 countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (!v5)
  {
    unsigned int v13 = 2;
    goto LABEL_26;
  }
  LOBYTE(v6) = 0;
  uint64_t v7 = *(void *)v75;
  LOBYTE(v8) = 1;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v75 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      if (v8)
      {
        int v8 = objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v74 + 1) + 8 * i), "objectForKey:", @"NSCTFontDownloadedAttribute"), "BOOLValue");
        if ((v6 & 1) == 0) {
          goto LABEL_11;
        }
      }
      else
      {
        int v8 = 0;
        if ((v6 & 1) == 0)
        {
LABEL_11:
          int v6 = objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"CTFontAllowCellularDownloadAttribute"), "BOOLValue");
          continue;
        }
      }
      int v6 = 1;
    }
    uint64_t v5 = [(__CFArray *)obj countByEnumeratingWithState:&v74 objects:v82 count:16];
  }
  while (v5);
  if (v8) {
    int v11 = 6;
  }
  else {
    int v11 = 4;
  }
  if (v8) {
    int v12 = 2;
  }
  else {
    int v12 = 0;
  }
  if (v6) {
    unsigned int v13 = v11;
  }
  else {
    unsigned int v13 = v12;
  }
LABEL_26:
  uint64_t v73 = 0;
  id v49 = +[FontAssetDownloadManager availableMobileAssetsWithOptions:manager:error:]((uint64_t)FontAssetDownloadManager, v13, 0, &v73);
  cf = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v48 = [v49 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (!v48) {
    goto LABEL_91;
  }
  unsigned int v52 = 0;
  int v45 = (v13 >> 1) & 1;
  uint64_t v47 = *(void *)v70;
  while (2)
  {
    uint64_t v14 = 0;
    while (2)
    {
      if (*(void *)v70 != v47)
      {
        uint64_t v15 = v14;
        objc_enumerationMutation(v49);
        uint64_t v14 = v15;
      }
      uint64_t v46 = v14;
      uint64_t v59 = *(void **)(*((void *)&v69 + 1) + 8 * v14);
      unint64_t v16 = (void *)[v59 attributes];
      unint64_t v17 = (void *)[v16 objectForKey:@"FontDesignLanguages"];
      id v53 = (id)[v16 objectForKey:@"FontInfo4"];
      uint64_t v54 = [v16 objectForKeyedSubscript:@"_DownloadSize"];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      uint64_t v57 = [v53 countByEnumeratingWithState:&v65 objects:v80 count:16];
      ++v52;
      if (v57)
      {
        uint64_t v55 = *(void *)v66;
        unsigned int v18 = v45;
        char v19 = v45;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v66 != v55)
            {
              uint64_t v21 = v20;
              objc_enumerationMutation(v53);
              uint64_t v20 = v21;
            }
            uint64_t v58 = v20;
            uint64_t v22 = *(NSDictionary **)(*((void *)&v65 + 1) + 8 * v20);
            if ((v56 & 2) == 0)
            {
              uint64_t v23 = (void *)[*(id *)(*((void *)&v65 + 1) + 8 * v20) objectForKey:@"FontFamilyName"];
              if (![v23 length] || objc_msgSend(v23, "characterAtIndex:", 0) == 46) {
                goto LABEL_87;
              }
            }
            long long v63 = 0u;
            long long v64 = 0u;
            long long v61 = 0u;
            long long v62 = 0u;
            uint64_t v24 = [(__CFArray *)obj countByEnumeratingWithState:&v61 objects:v79 count:16];
            if (!v24) {
              goto LABEL_87;
            }
            uint64_t v25 = *(void *)v62;
            while (2)
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v62 != v25) {
                  objc_enumerationMutation(obj);
                }
                long long v27 = *(void **)(*((void *)&v61 + 1) + 8 * v26);
                unint64_t v28 = (void *)[v27 objectForKey:@"NSCTFontDownloadedAttribute"];
                uint64_t v29 = v28;
                if (v28)
                {
                  if (v19)
                  {
                    char v19 = 1;
                    if ((v18 ^ [v28 BOOLValue])) {
                      goto LABEL_52;
                    }
                  }
                  else
                  {
                    self;
                    unint64_t v30 = [v59 state];
                    if (v30 <= 6 && ((1 << v30) & 0x6C) != 0)
                    {
                      char v19 = 1;
                      unsigned int v18 = 1;
                      if (([v29 BOOLValue] & 1) == 0) {
                        goto LABEL_52;
                      }
                    }
                    else
                    {
                      unsigned int v18 = 0;
                      char v19 = 1;
                      if ([v29 BOOLValue]) {
                        goto LABEL_52;
                      }
                    }
                  }
                }
                if (+[FontAssetDownloadManager fontInfo:andAssetDesignLanguages:matchesRequest:]((uint64_t)FontAssetDownloadManager, v22, (uint64_t)v17, v27))
                {
                  self;
                  unint64_t v32 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  objc_msgSend(v32, "setObject:forKey:", -[NSDictionary objectForKey:](v22, "objectForKey:", @"PostScriptFontName"), @"NSFontNameAttribute");
                  uint64_t v33 = [(NSDictionary *)v22 objectForKey:@"FontFamilyName"];
                  if (v33) {
                    [v32 setObject:v33 forKey:@"NSFontFamilyAttribute"];
                  }
                  uint64_t v34 = [(NSDictionary *)v22 objectForKey:@"PreferredFamilyName"];
                  if (v34) {
                    [v32 setObject:v34 forKey:@"NSFontFamilyAttribute"];
                  }
                  uint64_t v35 = [(NSDictionary *)v22 objectForKey:@"FontStyleName"];
                  if (v35) {
                    [v32 setObject:v35 forKey:@"NSFontFaceAttribute"];
                  }
                  uint64_t v36 = [(NSDictionary *)v22 objectForKey:@"PreferredStyleName"];
                  if (v36) {
                    [v32 setObject:v36 forKey:@"NSFontFaceAttribute"];
                  }
                  id v37 = [(NSDictionary *)v22 objectForKey:@"FontDesignLanguages"];
                  if ([v37 count] || (id v37 = v17, objc_msgSend(v17, "count"))) {
                    [v32 setObject:v37 forKey:@"NSCTFontDesignLanguagesAttribute"];
                  }
                  [v32 setObject:MEMORY[0x1E4F1CC38] forKey:@"NSCTFontDownloadableAttribute"];
                  CFDictionaryRef v38 = [(NSDictionary *)v22 objectForKey:@"DisplayNames"];
                  CopyValueForCurrentUser(v38, 0, (atomic_ullong *)&v78);
                  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)&v78, memory_order_acquire);

                  if (explicit) {
                    [v32 setObject:explicit forKey:@"NSFontVisibleNameAttribute"];
                  }
                  uint64_t v40 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                  if ([(__CFDictionary *)v38 count]) {
                    [v40 setObject:v38 forKey:@"NSFontVisibleNameAttribute"];
                  }
                  id v41 = [(NSDictionary *)v22 objectForKey:@"LocalizedFamilyNames"];
                  if ([v41 count]) {
                    [v40 setObject:v41 forKey:@"NSFontFamilyAttribute"];
                  }
                  id v42 = [(NSDictionary *)v22 objectForKey:@"LocalizedStyleNames"];
                  if ([v42 count]) {
                    [v40 setObject:v42 forKey:@"NSFontFaceAttribute"];
                  }
                  if ([v40 count]) {
                    [v32 setObject:v40 forKey:0x1ED075BF8];
                  }
                  if ((v19 & 1) == 0)
                  {
                    self;
                    unint64_t v43 = [v59 state];
                    if (v43 > 6) {
                      unsigned int v18 = 0;
                    }
                    else {
                      unsigned int v18 = (0x6Cu >> v43) & 1;
                    }
                  }
                  if (v54) {
                    [v32 setObject:v54 forKey:@"_DownloadSize"];
                  }
                  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", v18 & 1), @"NSCTFontDownloadedAttribute");
                  objc_msgSend(v32, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v52), @"LocalID");
                  [cf addObject:v32];
                  if ((v50 & 1) == 0)
                  {
                    char v19 = 1;
                    goto LABEL_87;
                  }
                  goto LABEL_91;
                }
LABEL_52:
                ++v26;
              }
              while (v24 != v26);
              uint64_t v31 = [(__CFArray *)obj countByEnumeratingWithState:&v61 objects:v79 count:16];
              uint64_t v24 = v31;
              if (v31) {
                continue;
              }
              break;
            }
LABEL_87:
            uint64_t v20 = v58 + 1;
          }
          while (v58 + 1 != v57);
          uint64_t v57 = [v53 countByEnumeratingWithState:&v65 objects:v80 count:16];
        }
        while (v57);
      }
      uint64_t v14 = v46 + 1;
      if (v46 + 1 != v48) {
        continue;
      }
      break;
    }
    uint64_t v48 = [v49 countByEnumeratingWithState:&v69 objects:v81 count:16];
    if (v48) {
      continue;
    }
    break;
  }
LABEL_91:
  if (![cf count]) {
    return 0;
  }

  return CFRetain(cf);
}

void TDescriptorSource::CopyDownloadableDescriptorsForRequest(TDescriptorSource *this@<X0>, const __CFDictionary *a2@<X1>, void *a3@<X8>)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v18[0] = this;
  CFTypeRef v4 = CopyDownloadableFontAttributesForRequests((const __CFArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1], (unint64_t)a2);
  uint64_t v5 = (id)CFMakeCollectable(v4);
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = CTFontDescriptorCreateWithAttributesAndOptions(*(void *)(*((void *)&v13 + 1) + 8 * v9), 0x40000000);
        if (v10)
        {
          int v11 = (const void *)v10;
          [v6 addObject:v10];
          CFRelease(v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  id v12 = v6;
  *a3 = atomic_exchange((atomic_ullong *volatile)&v12, 0);
}

void *CTFontDescriptorDownloadMatchingFontDescriptors(void *result, uint64_t a2, const void *a3)
{
  if ((a2 & 1) == 0) {
    return (void *)CTFontDescriptorMatchFontDescriptorsWithProgressHandlerCore(result, 0, a2, a3);
  }
  return result;
}

BOOL CTFontDescriptorRequiresFontAssetRequest(const __CTFontDescriptor *a1)
{
  CFDictionaryRef v1 = CTFontDescriptorCopyAttributes(a1);
  id v10 = (id)0xAAAAAAAAAAAAAAAALL;
  TCFMutableDictionary::TCFMutableDictionary((TCFMutableDictionary *)&v10, v1);
  unint64_t explicit = (__CFDictionary *)atomic_load_explicit((atomic_ullong *volatile)&v10, memory_order_acquire);
  CFDictionarySetValue(explicit, @"NSCTFontDownloadableAttribute", (const void *)*MEMORY[0x1E4F1CFD0]);
  unint64_t v3 = (__CFDictionary *)atomic_load_explicit((atomic_ullong *volatile)&v10, memory_order_acquire);
  CFDictionarySetValue(v3, @"NSCTFontDownloadedAttribute", (const void *)*MEMORY[0x1E4F1CFC8]);
  id v9 = (id)0xAAAAAAAAAAAAAAAALL;
  TDescriptorSource::CopyDownloadableDescriptorsForRequest((TDescriptorSource *)atomic_load_explicit((atomic_ullong *volatile)&v10, memory_order_acquire), (const __CFDictionary *)0x1000, &v9);
  CFArrayRef v4 = (const __CFArray *)(id)atomic_load_explicit((atomic_ullong *volatile)&v9, memory_order_acquire);
  CFArrayRef v5 = v4;
  if (v4) {
    CFIndex Count = CFArrayGetCount(v4);
  }
  else {
    CFIndex Count = 0;
  }
  BOOL v7 = Count > 0;

  return v7;
}

void sub_184B76B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, id a10)
{
  id v12 = v11;

  _Unwind_Resume(a1);
}

uint64_t GSFontLibraryCore(char **a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = 0;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v1 = GSFontLibraryCore(char **)::frameworkLibrary;
  uint64_t v6 = GSFontLibraryCore(char **)::frameworkLibrary;
  if (!GSFontLibraryCore(char **)::frameworkLibrary)
  {
    long long v7 = xmmword_1E5290938;
    v4[3] = _sl_dlopen();
    GSFontLibraryCore(char **)::frameworkLibrarCGFloat y = v4[3];
    uint64_t v1 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_184B76CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getGSFontUpdateFontAssetLastAccessedTimeSymbolLoc(void)
{
  uint64_t v3 = 0;
  CFArrayRef v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = getGSFontUpdateFontAssetLastAccessedTimeSymbolLoc(void)::ptr;
  uint64_t v6 = getGSFontUpdateFontAssetLastAccessedTimeSymbolLoc(void)::ptr;
  if (!getGSFontUpdateFontAssetLastAccessedTimeSymbolLoc(void)::ptr)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = ___ZL49getGSFontUpdateFontAssetLastAccessedTimeSymbolLocv_block_invoke;
    v2[3] = &unk_1E5290978;
    v2[4] = &v3;
    ___ZL49getGSFontUpdateFontAssetLastAccessedTimeSymbolLocv_block_invoke(v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_184B76DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL17GSFontLibraryCorePPc_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  GSFontLibraryCore(char **)::frameworkLibrarCGFloat y = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *___ZL49getGSFontUpdateFontAssetLastAccessedTimeSymbolLocv_block_invoke(void *a1)
{
  long long v7 = 0;
  uint64_t v3 = GSFontLibraryCore(&v7);
  if (!v3)
  {
    a1 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"void *GSFontLibrary()"];
    CFArrayRef v4 = (char *)objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v6, @"TDescriptorSourceDownloadableAsset.cpp", 51, @"%s", v7);
    __break(1u);
    goto LABEL_5;
  }
  uint64_t v1 = (void *)v3;
  CFArrayRef v4 = v7;
  if (v7) {
LABEL_5:
  }
    free(v4);
  uint64_t result = dlsym(v1, "GSFontUpdateFontAssetLastAccessedTime");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  getGSFontUpdateFontAssetLastAccessedTimeSymbolLoc(void)::ptr = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

dispatch_queue_t ___ZL48CTFontDescriptorGetDownloadProgressCallbackQueuev_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.CoreText.downloadProgressCallback", 0);
  qword_1EB2CE940 = (uint64_t)result;
  return result;
}

CFIndex TCFBidiLevelsProvider::GetLevels(TCFBidiLevelsProvider *this, CFRange a2, CTWritingDirection a3)
{
  CFIndex location = a2.location;
  CFIndex v5 = *((void *)this + 2);
  CFIndex v6 = *((void *)this + 3) + v5;
  if (a2.location + a2.length >= v6) {
    CFIndex v7 = *((void *)this + 3) + v5;
  }
  else {
    CFIndex v7 = a2.location + a2.length;
  }
  CFIndex v8 = v7 - v5;
  BOOL v9 = a2.location <= v5 && v5 < a2.location + a2.length;
  if (v9) {
    CFIndex v10 = *((void *)this + 2);
  }
  else {
    CFIndex v10 = 0;
  }
  if (!v9) {
    CFIndex v8 = 0;
  }
  CFIndex v11 = v7 - a2.location;
  BOOL v12 = v5 <= a2.location && a2.location < v6;
  if (v12) {
    CFIndex v10 = a2.location;
  }
  if (v12) {
    CFIndex v13 = v11;
  }
  else {
    CFIndex v13 = v8;
  }
  if (v10 != a2.location || v13 != a2.length)
  {
    TCFBidiLevelsProvider::Configure((atomic_ullong *)this, a2, a3, 0);
    CFIndex v5 = *((void *)this + 2);
  }
  return *((void *)this + 4) + location - v5;
}

void TCFBidiLevelsProvider::Configure(atomic_ullong *this, CFRange a2, int a3, uint64_t *a4)
{
  CFIndex length = a2.length;
  CFIndex location = a2.location;
  parEndIndeCGFloat x = 0xAAAAAAAAAAAAAAAALL;
  parBeginIndeCGFloat x = 0xAAAAAAAAAAAAAAAALL;
  CFStringRef String = CFAttributedStringGetString((CFAttributedStringRef)atomic_load_explicit(this + 1, memory_order_acquire));
  v56.CFIndex location = location;
  v56.CFIndex length = length;
  CFStringGetParagraphBounds(String, v56, &parBeginIndex, &parEndIndex, 0);
  if (a4) {
    *a4 = parBeginIndex;
  }
  CFIndex v10 = this[2];
  CFIndex v11 = this[3] + v10;
  if (location + length >= v11) {
    CFIndex v12 = this[3] + v10;
  }
  else {
    CFIndex v12 = location + length;
  }
  if (v10 <= location && location < v11)
  {
    CFIndex v15 = v12 - location;
    CFIndex v14 = location;
  }
  else
  {
    CFIndex v14 = 0;
    CFIndex v15 = 0;
    if (location <= v10 && v10 < location + length)
    {
      CFIndex v15 = v12 - v10;
      CFIndex v14 = this[2];
    }
  }
  if (v14 != location || v15 != length)
  {
    size_t v16 = parEndIndex - parBeginIndex;
    this[2] = parBeginIndex;
    this[3] = v16;
    atomic_ullong v18 = this[4];
    unint64_t v17 = (char *)this[5];
    char v19 = &v17[-v18];
    size_t v20 = v16 - (void)&v17[-v18];
    if (v16 <= (unint64_t)&v17[-v18])
    {
      if (v16 < (unint64_t)&v17[-v18]) {
        this[5] = v18 + v16;
      }
    }
    else
    {
      atomic_ullong v21 = this[6];
      if (v21 - (uint64_t)v17 >= v20)
      {
        atomic_ullong v26 = v16 + v18;
        bzero(v17, v16 - (void)&v17[-v18]);
        this[5] = v26;
      }
      else
      {
        if ((v16 & 0x8000000000000000) != 0) {
          goto LABEL_70;
        }
        unint64_t v22 = v21 - v18;
        uint64_t v23 = 2 * v22;
        if (2 * v22 <= v16) {
          uint64_t v23 = v16;
        }
        if (v22 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v24 = v23;
        }
        uint64_t v55 = (char *)(this + 7);
        atomic_ullong v25 = this[11];
        if (v25 + v24 <= (unint64_t)this + 86) {
          this[11] = v25 + v24;
        }
        else {
          atomic_ullong v25 = (atomic_ullong)operator new(v24);
        }
        long long v27 = &v19[v25];
        unint64_t v28 = (char *)(v25 + v24);
        uint64_t v54 = v28;
        uint64_t v29 = (char *)(v25 + v16);
        bzero(v27, v20);
        v53.i64[1] = (uint64_t)v29;
        atomic_ullong v31 = this[4];
        unint64_t v30 = this[5];
        if (v30 == v31)
        {
          int64x2_t v33 = vdupq_n_s64(v30);
        }
        else
        {
          do
          {
            char v32 = *(unsigned char *)--v30;
            *--long long v27 = v32;
          }
          while (v30 != v31);
          int64x2_t v33 = *((int64x2_t *)this + 2);
          uint64_t v29 = (char *)v53.i64[1];
          unint64_t v28 = v54;
        }
        this[4] = (atomic_ullong)v27;
        this[5] = (atomic_ullong)v29;
        int64x2_t v53 = v33;
        atomic_ullong v34 = this[6];
        this[6] = (atomic_ullong)v28;
        uint64_t v54 = (char *)v34;
        uint64_t valuePtr = v33.i64[0];
        std::__split_buffer<char,TInlineBufferAllocator<char,30ul> &>::~__split_buffer((uint64_t)&valuePtr);
      }
    }
    if (a3 != -1)
    {
LABEL_68:
      atomic_load_explicit(this + 1, memory_order_acquire);
      CFAttributedStringGetBidiLevelsAndResolvedDirections();
      return;
    }
    CFNumberRef Attribute = (const __CFNumber *)CFAttributedStringGetAttribute((CFAttributedStringRef)atomic_load_explicit(this + 1, memory_order_acquire), this[2], @"CTFallbackWritingDirection", 0);
    CFNumberRef v36 = Attribute;
    if (Attribute)
    {
      CFTypeID v37 = CFGetTypeID(Attribute);
      if (v37 == CFNumberGetTypeID())
      {
        LODWORD(valuePtr) = -1431655766;
        CFNumberGetValue(v36, kCFNumberIntType, &valuePtr);
        LODWORD(v36) = valuePtr;
      }
      else
      {
        LODWORD(v36) = 0;
      }
    }
    CFDictionaryRef v38 = (atomic_ullong *)this[12];
    unint64_t v39 = this[14];
    if (v39 - (unint64_t)v38 >= v16)
    {
      atomic_ullong v40 = this[13];
      size_t v41 = v40 - (void)v38;
      if (v40 - (uint64_t)v38 >= v16) {
        size_t v42 = v16;
      }
      else {
        size_t v42 = v40 - (void)v38;
      }
      if (v42) {
        memset(v38, (int)v36, v42);
      }
      BOOL v43 = v16 >= v41;
      size_t v44 = v16 - v41;
      if (v44 != 0 && v43)
      {
        int v45 = (char *)this[13];
        memset(v45, (int)v36, v44);
        uint64_t v46 = &v45[v44];
      }
      else
      {
        uint64_t v46 = (char *)(this[12] + v16);
      }
      goto LABEL_67;
    }
    if (v38)
    {
      this[13] = (atomic_ullong)v38;
      if (this + 15 > v38 || (atomic_ullong *)((char *)this + 150) <= v38)
      {
        operator delete(v38);
      }
      else if (v39 == this[19])
      {
        this[19] = (atomic_ullong)v38;
      }
      unint64_t v39 = 0;
      this[12] = 0;
      this[13] = 0;
      this[14] = 0;
    }
    if ((v16 & 0x8000000000000000) == 0)
    {
      uint64_t v47 = 2 * v39;
      if (2 * v39 <= v16) {
        uint64_t v47 = v16;
      }
      size_t v48 = v39 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v47;
      if ((v48 & 0x8000000000000000) == 0)
      {
        id v49 = (char *)this[19];
        if (&v49[v48] <= (char *)this + 150) {
          this[19] = (atomic_ullong)&v49[v48];
        }
        else {
          id v49 = (char *)operator new(v48);
        }
        this[12] = (atomic_ullong)v49;
        this[14] = (atomic_ullong)&v49[v48];
        memset(v49, (int)v36, v16);
        uint64_t v46 = &v49[v16];
LABEL_67:
        this[13] = (atomic_ullong)v46;
        goto LABEL_68;
      }
    }
LABEL_70:
    abort();
  }
}

uint64_t TCFBidiLevelsProvider::GetDefaultParagraphDirection(atomic_ullong *this, CFRange a2)
{
  uint64_t v7 = 0;
  a2.CFIndex length = 1;
  TCFBidiLevelsProvider::Configure(this, a2, -1, &v7);
  unint64_t v3 = v7 - this[2];
  atomic_ullong v4 = this[12];
  if (v3 >= this[13] - v4) {
    return 0;
  }
  else {
    return *(char *)(v4 + v3);
  }
}

void TCFBidiLevelsProvider::~TCFBidiLevelsProvider(TCFBidiLevelsProvider *this)
{
  *(void *)this = &unk_1ED05EB98;
  uint64_t v2 = (id *)((char *)this + 8);
  unint64_t v3 = (void **)((char *)this + 96);
  std::vector<char,TInlineBufferAllocator<char,30ul>>::__destroy_vector::operator()[abi:nn180100](&v3);
  unint64_t v3 = (void **)((char *)this + 32);
  std::vector<char,TInlineBufferAllocator<char,30ul>>::__destroy_vector::operator()[abi:nn180100](&v3);
}

{
  id *v2;
  void **v3;

  *(void *)this = &unk_1ED05EB98;
  uint64_t v2 = (id *)((char *)this + 8);
  unint64_t v3 = (void **)((char *)this + 96);
  std::vector<char,TInlineBufferAllocator<char,30ul>>::__destroy_vector::operator()[abi:nn180100](&v3);
  unint64_t v3 = (void **)((char *)this + 32);
  std::vector<char,TInlineBufferAllocator<char,30ul>>::__destroy_vector::operator()[abi:nn180100](&v3);

  MEMORY[0x1853275C0](this, 0x10F1C409899A524);
}

BOOL CharacterSequence::IsProhibitedAfterAdding(CharacterSequence *this, int a2)
{
  uint64_t v2 = *((void *)this + 2);
  BOOL result = 0;
  if (v2 != 3)
  {
    *((void *)this + 2) = v2 + 1;
    *((_DWORD *)this + v2) = a2;
    if ((unint64_t)(v2 + 1) >= 2)
    {
      BOOL v5 = 0;
      if (IsProhibitedSequence(*(_DWORD *)this, *((_DWORD *)this + 1), &v5)
        || v5
        && *((void *)this + 2) >= 3uLL
        && *(_DWORD *)this == 2352
        && *((_DWORD *)this + 1) == 2381
        && *((_DWORD *)this + 2) == 2311)
      {
        return 1;
      }
    }
  }
  return result;
}

uint64_t UniversalShapingEngine::ApplyScriptShaping(UniversalShapingEngine *this, const OTL::GSUB *a2, OTL::GlyphLookups *a3)
{
  uint64_t v4 = MEMORY[0x1F4188790](this, a2);
  CFIndex v6 = v5;
  v379 = v7;
  uint64_t v8 = v4;
  v439[1] = *MEMORY[0x1E4F143B8];
  unsigned __int8 v412 = 0;
  CFIndex v10 = *v5;
  BOOL v9 = v5[1];
  if (v9 != *v5)
  {
    do
    {
      CFIndex v11 = v9 - 52;
      v415 = v9 - 48;
      std::vector<CFRange,TInlineBufferAllocator<CFRange,4ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v415);
      BOOL v9 = v11;
    }
    while (v11 != v10);
  }
  v377 = v6;
  v6[1] = v10;
  v412 |= TRunGlue::FilterSurrogates(*(TRunGlue **)(v8 + 8), *(void *)v8, 0);
  CFIndex v12 = *(TRunGlue **)(v8 + 8);
  uint64_t v13 = *((void *)v12 + 13);
  unint64_t v14 = TRunGlue::length(v12);
  v397 = (void *)v13;
  std::vector<TGlyphAuxDataListEntry,TInlineBufferAllocator<TGlyphAuxDataListEntry,30ul>>::resize(v13, v14);
  memset(v438, 170, sizeof(v438));
  __p = 0;
  v436 = 0;
  uint64_t v437 = 0;
  v439[0] = v438;
  v433[0] = &unk_1ED061238;
  v433[1] = &__p;
  v434 = v433;
  long long v416 = 0u;
  memset(v417, 0, 168);
  CFIndex v15 = *(TRunGlue **)(v8 + 8);
  uint64_t v16 = *(void *)(*(void *)v8 + 16);
  v415 = *(unsigned __int16 **)v8;
  *(void *)&v417[9] = v16;
  uint64_t v17 = TRunGlue::length(v15);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = 0;
    for (int64_t i = 0; i != v18; ++i)
    {
      uint64_t StringIndex = TRunGlue::GetStringIndex(v15, i);
      unsigned int FullChar = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v415, &StringIndex, 0);
      int CharClass = UniversalClassTable::getCharClass(*(UniversalClassTable **)(v8 + 16), FullChar);
      uint64_t v22 = **((void **)v15 + 13) + v19;
      *(_DWORD *)(v22 + 8) = CharClass;
      *(_DWORD *)(v22 + 12) = 0;
      v19 += 16;
    }
  }
  uint64_t v23 = *(TRunGlue **)(v8 + 8);
  TRunGlue::length(v23);
  size_t v24 = *(int **)(v8 + 8);
  uint64_t v25 = v24[6];
  int64_t v398 = v8;
  if ((v25 & 0x80000000) != 0)
  {
    uint64_t v23 = *(TRunGlue **)(v8 + 8);
    int64_t j = TRunGlue::length((TRunGlue *)v24) - 1;
    size_t v24 = *(int **)(v8 + 8);
  }
  else
  {
    int64_t j = 0;
  }
  uint64_t v27 = TRunGlue::length((TRunGlue *)v24);
  if (v27 < 1) {
    goto LABEL_532;
  }
  unint64_t v28 = v23;
  uint64_t v29 = 16 * v25;
  uint64_t v382 = -v25;
  uint64_t v378 = 2 * v25;
  do
  {
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    uint64_t v385 = v27;
    uint64_t v33 = 31;
    if ((unint64_t)v27 < 0x1F) {
      uint64_t v33 = v27;
    }
    uint64_t v380 = v33 * v25;
    int64_t v34 = v33 * v25 + j;
    *(void *)v419 = 0;
    unint64_t v420 = 0xAAAAAAAA00000000;
    uint64_t v421 = 0;
    int64_t v35 = -v34;
    uint64_t v36 = v25 - v34;
    int64_t v383 = v25 - j + v382 * v33;
    uint64_t v384 = v25 - v34;
    uint64_t v381 = v382 * (v33 - 1) - j;
    int64_t v37 = j;
    uint64_t v388 = j;
    int64_t v386 = -v34;
LABEL_14:
    while (2)
    {
      int v389 = v30;
      int64_t v38 = v37;
      int v387 = v31;
LABEL_15:
      int v394 = v32;
      uint64_t v39 = 0;
      uint64_t v392 = v36 + v38;
      uint64_t v40 = (16 * v38) | 8;
      int64_t v41 = v35 + v38;
      int64_t v42 = v38;
      uint64_t v43 = (16 * (v25 + v38)) | 8;
      while (1)
      {
        if (!(v41 + v39)) {
          goto LABEL_374;
        }
        size_t v44 = v28;
        *(void *)v413 = TRunGlue::GetStringIndex(v28, v38 + v39);
        UChar32 c = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v415, (uint64_t *)v413, 0);
        if (CharacterSequence::IsProhibitedAfterAdding((CharacterSequence *)v419, c))
        {
          uint64_t v179 = v388;
          int64_t v34 = v388 + v25;
          unint64_t v28 = v44;
          goto LABEL_375;
        }
        uint64_t v45 = **((void **)v44 + 13);
        int v46 = *(_DWORD *)(v45 + v40);
        unint64_t v28 = v44;
        if (v46 != 12) {
          break;
        }
        if (!v394)
        {
          int v32 = 0;
          int64_t v35 = -v34;
          int v50 = v389;
          LOBYTE(v31) = v387;
          goto LABEL_144;
        }
        if (!(v392 + v39)) {
          goto LABEL_374;
        }
        v42 += v25;
        *(void *)v413 = TRunGlue::GetStringIndex(v44, v25 + v38 + v39);
        UChar32 v47 = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v415, (uint64_t *)v413, 0);
        int8_t v48 = u_charType(v47);
        unint64_t v28 = v44;
        v39 += v25;
        v40 += v29;
        v43 += v29;
        if (((1 << v48) & 0x140) == 0)
        {
          int64_t v34 = v38 + v39;
          goto LABEL_374;
        }
      }
      int v32 = v394;
      switch(*(_DWORD *)(v45 + v40))
      {
        case 1u:
        case 4u:
          int v31 = v387;
          if (v394)
          {
            int64_t v49 = v38 + v39;
LABEL_26:
            int64_t v35 = -v34;
            int v50 = v389;
            goto LABEL_146;
          }
          uint64_t v36 = v25 - v34;
          int64_t v35 = -v34;
          if (!(v384 + v38 + v39)) {
            goto LABEL_344;
          }
          int64_t v37 = v25 + v38 + v39;
          double v153 = (unsigned __int8 *)(v45 + v43);
          while (1)
          {
            int v154 = *v153;
            if (v154 != 21) {
              break;
            }
            v153 += v29;
            v39 += v25;
            if (v34 - (v25 + v38) == v39) {
              goto LABEL_332;
            }
          }
          if (v154 == 22) {
            int64_t v37 = v378 + v38 + v39;
          }
LABEL_332:
          if (v37 == v34)
          {
LABEL_344:
            int v30 = 1;
          }
          else
          {
LABEL_333:
            int64_t v155 = v25 + v37;
            double v156 = (int *)(v45 + 8 + 16 * v37);
            do
            {
              int v157 = *v156;
              if ((*v156 & 0x2FF) == 0x208)
              {
                int v30 = 1;
                int64_t v37 = v155;
                if (v34 != v155) {
                  goto LABEL_333;
                }
                goto LABEL_345;
              }
              double v156 = (int *)((char *)v156 + v29);
              BOOL v158 = v157 != 21 || v34 == v155;
              v155 += v25;
            }
            while (!v158);
            if (v37 == v34) {
              goto LABEL_344;
            }
            uint64_t v159 = v45 + 8;
            do
            {
              int64_t v160 = v25 + v37;
              v161 = (int *)(v159 + 16 * v37);
              while (1)
              {
                int v162 = *v161;
                if ((*v161 & 0x4FF) == 0x408) {
                  break;
                }
                v161 = (int *)((char *)v161 + v29);
                BOOL v163 = v162 != 21 || v34 == v160;
                v160 += v25;
                if (v163)
                {
                  int v30 = 1;
                  int v32 = 1;
                  goto LABEL_14;
                }
              }
              int v30 = 1;
              int64_t v37 = v160;
            }
            while (v34 != v160);
          }
LABEL_345:
          int64_t v37 = v34;
          int v32 = 1;
          continue;
        case 2u:
          goto LABEL_100;
        case 9u:
        case 0xAu:
          int64_t v49 = v38 + v39;
          LOBYTE(v31) = v387;
          if (v394 != 1)
          {
            v38 += v39;
            goto LABEL_102;
          }
          if (v384 + v38 + v39)
          {
            BOOL v51 = v28;
            *(void *)v413 = TRunGlue::GetStringIndex(v28, v25 + v38 + v39);
            UChar32 c = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&v415, (uint64_t *)v413, 0);
            BOOL IsProhibitedAfterAdding = CharacterSequence::IsProhibitedAfterAdding((CharacterSequence *)v419, c);
            unint64_t v28 = v51;
            LOBYTE(v31) = v387;
            if (IsProhibitedAfterAdding)
            {
              int64_t v34 = v25 + v38 + v39;
              goto LABEL_374;
            }
          }
          uint64_t v53 = 0;
          int v54 = 0;
          LODWORD(v55) = 0;
          break;
        case 0xDu:
          v38 += v39;
          int64_t v35 = -v34;
          int v50 = v389;
          LOBYTE(v31) = v387;
          goto LABEL_139;
        case 0xFu:
          LOBYTE(v31) = v387;
          if ((v394 != 0) | v387 & 1) {
            goto LABEL_101;
          }
          int v32 = 0;
          int v31 = 1;
          int v389 = 6;
          goto LABEL_329;
        case 0x14u:
          LOBYTE(v31) = v387;
          v38 += v39;
          int64_t v35 = -v34;
          int v50 = v389;
          if ((v394 != 0) | v387 & 1) {
            goto LABEL_144;
          }
          int v32 = 0;
          int v31 = 1;
          int64_t v42 = v38;
          goto LABEL_329;
        default:
          if (c == 8288 || (v46 ? (BOOL v75 = v46 == 14) : (BOOL v75 = 1), v75))
          {
LABEL_100:
            LOBYTE(v31) = v387;
            if (!((v394 != 0) | v387 & 1))
            {
              int64_t v175 = v25 + v38 + v39;
              if (v175 == v34)
              {
                int v389 = 0;
                goto LABEL_374;
              }
              uint64_t v179 = v388;
              while (1)
              {
                int v176 = *(unsigned __int8 *)(v45 + v43);
                if (v176 != 21) {
                  break;
                }
                v45 += v29;
                v39 += v25;
                if (v388 + v380 - (v25 + v38) == v39)
                {
                  int v389 = 0;
                  int64_t v34 = v175;
                  goto LABEL_375;
                }
              }
              if (v176 == 22) {
                int64_t v34 = v378 + v38 + v39;
              }
              else {
                int64_t v34 = v175;
              }
              int v177 = 0;
LABEL_397:
              int v389 = v177;
              goto LABEL_375;
            }
LABEL_101:
            v38 += v39;
LABEL_102:
            int64_t v35 = -v34;
            int v50 = v389;
            goto LABEL_144;
          }
          int64_t v49 = v38 + v39;
          int v31 = v387;
          switch((char)v46)
          {
            case 16:
              int64_t v35 = -v34;
              int v50 = v389;
              if (v394) {
                goto LABEL_146;
              }
              int64_t v184 = v25 + v38 + v39;
              if (v184 == v34) {
                goto LABEL_439;
              }
              uint64_t v185 = v45;
              while (1)
              {
                int v186 = *(unsigned __int8 *)(v185 + v43);
                if (v186 != 21) {
                  break;
                }
                v185 += v29;
                v39 += v25;
                if (v388 + v380 - (v25 + v38) == v39) {
                  goto LABEL_427;
                }
              }
              if (v186 == 22) {
                int64_t v184 = v378 + v38 + v39;
              }
LABEL_427:
              if (v184 == v34) {
                goto LABEL_439;
              }
              while (1)
              {
                int64_t v195 = v25 + v184;
                v196 = (int *)(v45 + 8 + 16 * v184);
                while (1)
                {
                  int v197 = *v196;
                  if ((*v196 & 0x2FF) == 0x208) {
                    break;
                  }
                  v196 = (int *)((char *)v196 + v29);
                  BOOL v198 = v197 != 21 || v34 == v195;
                  v195 += v25;
                  if (v198)
                  {
                    if (v184 != v34)
                    {
                      uint64_t v199 = v45 + 8;
                      do
                      {
                        int64_t v200 = v25 + v184;
                        v201 = (int *)(v199 + 16 * v184);
                        while (1)
                        {
                          int v202 = *v201;
                          if ((*v201 & 0x4FF) == 0x408) {
                            break;
                          }
                          v201 = (int *)((char *)v201 + v29);
                          BOOL v203 = v202 != 21 || v34 == v200;
                          v200 += v25;
                          if (v203)
                          {
                            int v204 = 4;
LABEL_451:
                            int v389 = v204;
                            int64_t v34 = v184;
                            goto LABEL_374;
                          }
                        }
                        int64_t v184 = v200;
                      }
                      while (v34 != v200);
                    }
LABEL_439:
                    int v165 = 4;
LABEL_369:
                    int v389 = v165;
                    goto LABEL_374;
                  }
                }
                int64_t v184 = v195;
                if (v34 == v195) {
                  goto LABEL_439;
                }
              }
            case 17:
            case 18:
            case 19:
            case 20:
            case 22:
            case 24:
              v38 += v39;
              goto LABEL_102;
            case 21:
              goto LABEL_329;
            case 23:
            case 25:
              int64_t v35 = -v34;
              int v50 = v389;
              if (v394) {
                goto LABEL_146;
              }
              int64_t v178 = v38 + v39;
              uint64_t v179 = v388;
              while (1)
              {
                uint64_t v180 = 0;
                v181 = (unsigned __int8 *)(v45 + 8 + 16 * v178);
                while (1)
                {
                  int v182 = *v181;
                  if (v182 != 21) {
                    break;
                  }
                  v181 += v29;
                  v180 -= v25;
                  if (v178 - v34 == v180) {
                    goto LABEL_407;
                  }
                }
                if (v182 != 25) {
                  break;
                }
                uint64_t v183 = v25 + v178;
                int64_t v178 = v25 + v178 - v180;
                if (v183 - v34 == v180) {
                  goto LABEL_408;
                }
              }
LABEL_407:
              if (v178 != v34)
              {
                uint64_t v187 = 0;
                uint64_t v188 = 0;
                v189 = (unsigned __int8 *)(v45 + 8 + 16 * v178);
                v190 = (unsigned __int8 *)(v45 + 8 + 16 * (v25 + v178));
                while (1)
                {
                  int v191 = *v189;
                  if (v191 != 21) {
                    break;
                  }
                  v189 += v29;
                  v188 -= v25;
                  v187 += v25;
                  v190 += v29;
                  if (v178 - v34 == v188) {
                    goto LABEL_424;
                  }
                }
                if (v191 != 23)
                {
LABEL_424:
                  int v389 = 5;
                  int64_t v34 = v178;
                  goto LABEL_375;
                }
                uint64_t v192 = v25 + v178;
                if (v25 + v178 - v34 != v188)
                {
                  int64_t v184 = v192 - v188;
                  uint64_t v193 = v388 + v380 - v192;
                  while (1)
                  {
                    int v194 = *v190;
                    if (v194 != 21) {
                      break;
                    }
                    v190 += v29;
                    v187 += v25;
                    if (v193 == v187) {
                      goto LABEL_454;
                    }
                  }
                  int64_t v205 = v378 + v178 + v187;
                  if (v194 == 22) {
                    int64_t v184 = v205;
                  }
LABEL_454:
                  if (v184 != v34)
                  {
                    int64_t v206 = -v184;
                    v207 = (unsigned __int8 *)(v45 + 16 * v184 + 8);
                    while (1)
                    {
                      int v208 = *v207;
                      if (v208 != 21) {
                        break;
                      }
                      v207 += v29;
                      v206 -= v25;
                      if (v386 == v206) {
                        goto LABEL_461;
                      }
                    }
                    int64_t v209 = v25 - v206;
                    if (v208 == 28) {
                      int64_t v184 = v209;
                    }
LABEL_461:
                    if (v184 != v34)
                    {
                      int64_t v210 = -v184;
                      v211 = (unsigned __int8 *)(v45 + 16 * v184 + 8);
                      while (1)
                      {
                        int v212 = *v211;
                        if (v212 != 21) {
                          break;
                        }
                        v211 += v29;
                        v210 -= v25;
                        if (v386 == v210) {
                          goto LABEL_468;
                        }
                      }
                      int64_t v213 = v25 - v210;
                      if (v212 == 27) {
                        int64_t v184 = v213;
                      }
LABEL_468:
                      if (v184 != v34)
                      {
                        while (1)
                        {
                          uint64_t v214 = 0;
                          v215 = (unsigned __int8 *)(v45 + 8 + 16 * v184);
                          while (1)
                          {
                            int v216 = *v215;
                            if (v216 != 21) {
                              break;
                            }
                            v215 += v29;
                            v214 -= v25;
                            if (v184 - v34 == v214) {
                              goto LABEL_476;
                            }
                          }
                          if (v216 != 26)
                          {
LABEL_476:
                            if (v184 != v34)
                            {
                              uint64_t v218 = v45 + 8;
                              while (1)
                              {
                                uint64_t v219 = 0;
                                v220 = (unsigned __int8 *)(v218 + 16 * v184);
                                while (1)
                                {
                                  int v221 = *v220;
                                  if (v221 != 21) {
                                    break;
                                  }
                                  v220 += v29;
                                  v219 -= v25;
                                  if (v184 - v34 == v219) {
                                    goto LABEL_531;
                                  }
                                }
                                if (v221 != 24)
                                {
LABEL_531:
                                  int v204 = 5;
                                  goto LABEL_451;
                                }
                                uint64_t v222 = v25 + v184;
                                if (v222 - v34 == v219) {
                                  break;
                                }
                                int64_t v184 = v222 - v219;
                                while (1)
                                {
                                  uint64_t v223 = 0;
                                  v224 = (unsigned __int8 *)(v218 + 16 * v184);
                                  while (1)
                                  {
                                    int v225 = *v224;
                                    if (v225 != 21) {
                                      break;
                                    }
                                    v224 += v29;
                                    v223 -= v25;
                                    if (v184 - v34 == v223) {
                                      goto LABEL_493;
                                    }
                                  }
                                  if (v225 != 25) {
                                    break;
                                  }
                                  uint64_t v226 = v25 + v184;
                                  int64_t v184 = v25 + v184 - v223;
                                  int v389 = 5;
                                  if (v226 - v34 == v223) {
                                    goto LABEL_374;
                                  }
                                }
LABEL_493:
                                if (v184 == v34) {
                                  break;
                                }
                                uint64_t v227 = 0;
                                uint64_t v228 = 0;
                                v229 = (unsigned __int8 *)(v218 + 16 * v184);
                                v230 = (unsigned __int8 *)(v218 + 16 * (v25 + v184));
                                while (1)
                                {
                                  int v231 = *v229;
                                  if (v231 != 21) {
                                    break;
                                  }
                                  v229 += v29;
                                  v228 -= v25;
                                  v227 += v25;
                                  v230 += v29;
                                  if (v184 - v34 == v228) {
                                    goto LABEL_529;
                                  }
                                }
                                if (v231 == 23)
                                {
                                  uint64_t v232 = v25 + v184;
                                  if (v25 + v184 - v34 == v228) {
                                    break;
                                  }
                                  int64_t v233 = v232 - v228;
                                  uint64_t v234 = v388 + v380 - v232;
                                  while (1)
                                  {
                                    int v235 = *v230;
                                    if (v235 != 21) {
                                      break;
                                    }
                                    v230 += v29;
                                    v227 += v25;
                                    if (v234 == v227) {
                                      goto LABEL_506;
                                    }
                                  }
                                  uint64_t v236 = v378 + v184 + v227;
                                  if (v235 == 22) {
                                    int64_t v233 = v236;
                                  }
LABEL_506:
                                  if (v233 == v34) {
                                    break;
                                  }
                                  uint64_t v237 = -v233;
                                  v238 = (unsigned __int8 *)(v218 + 16 * v233);
                                  while (1)
                                  {
                                    int v239 = *v238;
                                    if (v239 != 21) {
                                      break;
                                    }
                                    v238 += v29;
                                    v237 -= v25;
                                    if (v386 == v237) {
                                      goto LABEL_513;
                                    }
                                  }
                                  uint64_t v240 = v25 - v237;
                                  if (v239 == 28) {
                                    int64_t v233 = v240;
                                  }
LABEL_513:
                                  if (v233 == v34) {
                                    break;
                                  }
                                  uint64_t v241 = -v233;
                                  v242 = (unsigned __int8 *)(v218 + 16 * v233);
                                  while (1)
                                  {
                                    int v243 = *v242;
                                    if (v243 != 21) {
                                      break;
                                    }
                                    v242 += v29;
                                    v241 -= v25;
                                    if (v386 == v241) {
                                      goto LABEL_520;
                                    }
                                  }
                                  uint64_t v244 = v25 - v241;
                                  if (v243 == 27) {
                                    int64_t v233 = v244;
                                  }
LABEL_520:
                                  if (v233 == v34) {
                                    break;
                                  }
                                  while (1)
                                  {
                                    uint64_t v245 = 0;
                                    v246 = (unsigned __int8 *)(v218 + 16 * v233);
                                    while (1)
                                    {
                                      int v247 = *v246;
                                      if (v247 != 21) {
                                        break;
                                      }
                                      v246 += v29;
                                      v245 -= v25;
                                      if (v233 - v34 == v245) {
                                        goto LABEL_528;
                                      }
                                    }
                                    if (v247 != 26) {
                                      break;
                                    }
                                    uint64_t v248 = v25 + v233;
                                    int64_t v233 = v25 + v233 - v245;
                                    int v389 = 5;
                                    if (v248 - v34 == v245) {
                                      goto LABEL_374;
                                    }
                                  }
LABEL_528:
                                  int64_t v184 = v233;
                                }
LABEL_529:
                                int v389 = 5;
                                if (v184 == v34) {
                                  goto LABEL_374;
                                }
                              }
                            }
                            int v165 = 5;
                            goto LABEL_369;
                          }
                          uint64_t v217 = v25 + v184;
                          int64_t v184 = v25 + v184 - v214;
                          int v389 = 5;
                          if (v217 - v34 == v214) {
                            goto LABEL_374;
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_408:
              int v177 = 5;
              goto LABEL_397;
            default:
              if (v46 != 3)
              {
                BOOL v76 = v46 == 11 && v394 == 3;
                int64_t v35 = -v34;
                int v50 = v389;
                if (!v76)
                {
                  v38 += v39;
                  goto LABEL_144;
                }
LABEL_115:
                char v77 = 0;
                int64_t v78 = v49;
                while (1)
                {
                  int v79 = *(unsigned __int8 *)(v45 + 16 * v78 + 8);
                  if (v79 == 11)
                  {
                    if (v77) {
                      goto LABEL_135;
                    }
                    v78 += v25;
                  }
                  else
                  {
                    if (v79 != 13)
                    {
                      if (v79 == 3 && (v77 & 1) != 0)
                      {
                        int64_t v49 = v78 + v25;
                        if (v78 + v25 == v34) {
                          goto LABEL_374;
                        }
                        uint64_t v80 = -v78;
                        int v81 = (unsigned __int8 *)(v45 + 8 + 16 * v49);
                        while (1)
                        {
                          int v82 = *v81;
                          if (v82 != 21) {
                            break;
                          }
                          v81 += v29;
                          v80 -= v25;
                          if (v381 == v80) {
                            goto LABEL_133;
                          }
                        }
                        int64_t v83 = v378 - v80;
                        if (v82 == 22) {
                          int64_t v49 = v83;
                        }
LABEL_133:
                        if (v49 == v34) {
                          goto LABEL_374;
                        }
                        goto LABEL_115;
                      }
LABEL_135:
                      if (v49 == v34) {
                        goto LABEL_374;
                      }
                      if (*(unsigned char *)(v45 + 16 * v49 + 8) != 11)
                      {
                        int v32 = 5;
                        goto LABEL_146;
                      }
                      int v32 = 4;
                      int v389 = 2;
                      int64_t v42 = v49;
LABEL_329:
                      int64_t v37 = v42 + v25;
                      int64_t v35 = -v34;
                      int v30 = v389;
                      uint64_t v36 = v25 - v34;
                      goto LABEL_14;
                    }
                    v78 += v25;
                    if (v78 == v34 || *(unsigned char *)(v45 + 16 * v78 + 8) == 13) {
                      goto LABEL_135;
                    }
                  }
                  char v77 = 1;
                  if (v78 == v34) {
                    goto LABEL_135;
                  }
                }
              }
              int64_t v35 = -v34;
              int v50 = v389;
              if (!v394)
              {
                uint64_t v36 = v25 - v34;
                if (v384 + v38 + v39)
                {
                  int64_t v37 = v25 + v38 + v39;
                  do
                  {
                    int v164 = *(unsigned __int8 *)(v45 + v43);
                    if (v164 != 21)
                    {
                      if (v164 == 22) {
                        int64_t v37 = v378 + v38 + v39;
                      }
                      int v30 = 3;
                      int v32 = 3;
                      goto LABEL_14;
                    }
                    v45 += v29;
                    v39 += v25;
                    int v30 = 3;
                  }
                  while (v34 - (v25 + v38) != v39);
                }
                else
                {
                  int v30 = 3;
                  int64_t v37 = v34;
                }
                int v32 = 3;
                continue;
              }
              while (1)
              {
LABEL_146:
                if (v50 != 1)
                {
                  int64_t v38 = v49;
                  goto LABEL_195;
                }
                if (v49 == v34) {
                  goto LABEL_368;
                }
                uint64_t v84 = **((void **)v28 + 13);
                int64_t v85 = v25 + v49;
                unsigned int v86 = (int *)(v84 + 16 * v49 + 8);
                while (1)
                {
                  int v87 = *v86;
                  if ((*v86 & 0x8FF) == 0x807) {
                    break;
                  }
                  unsigned int v86 = (int *)((char *)v86 + v29);
                  BOOL v88 = v87 != 21 || v34 == v85;
                  v85 += v25;
                  if (v88)
                  {
                    int64_t v85 = v49;
                    break;
                  }
                }
                if (v85 == v34) {
                  goto LABEL_368;
                }
                uint64_t v89 = v25 + v85;
                long long v90 = (int *)(v84 + 16 * v85 + 8);
                while (1)
                {
                  int v91 = *v90;
                  if ((*v90 & 0x2FF) == 0x207) {
                    break;
                  }
                  long long v90 = (int *)((char *)v90 + v29);
                  BOOL v92 = v91 != 21 || v34 == v89;
                  v89 += v25;
                  if (v92)
                  {
                    uint64_t v89 = v85;
                    break;
                  }
                }
                if (v89 == v34) {
                  goto LABEL_368;
                }
                int64_t v93 = v25 + v89;
                long long v94 = (int *)(v84 + 16 * v89 + 8);
                while (1)
                {
                  int v95 = *v94;
                  if ((*v94 & 0x4FF) == 0x407) {
                    break;
                  }
                  long long v94 = (int *)((char *)v94 + v29);
                  BOOL v96 = v95 != 21 || v34 == v93;
                  v93 += v25;
                  if (v96)
                  {
                    int64_t v93 = v89;
                    break;
                  }
                }
                if (v93 == v34) {
                  goto LABEL_368;
                }
                int64_t v38 = v25 + v93;
                long long v97 = (int *)(v84 + 16 * v93 + 8);
                while (1)
                {
                  int v98 = *v97;
                  if ((*v97 & 0x1FF) == 0x107) {
                    break;
                  }
                  long long v97 = (int *)((char *)v97 + v29);
                  BOOL v99 = v98 != 21 || v34 == v38;
                  v38 += v25;
                  if (v99)
                  {
                    int64_t v38 = v93;
                    break;
                  }
                }
                if (v38 == v34)
                {
LABEL_368:
                  int v165 = 1;
                  goto LABEL_369;
                }
LABEL_184:
                int64_t v100 = v25 + v38;
                unint64_t v101 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v102 = *v101;
                  if ((*v101 & 0x8FF) == 0x812)
                  {
                    int64_t v38 = v100;
                    if (v34 == v100) {
                      goto LABEL_368;
                    }
                    goto LABEL_184;
                  }
                  unint64_t v101 = (int *)((char *)v101 + v29);
                  BOOL v103 = v102 != 21 || v34 == v100;
                  v100 += v25;
                }
                while (!v103);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_199:
                int64_t v104 = v25 + v38;
                uint64_t v105 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v106 = *v105;
                  if ((*v105 & 0x2FF) == 0x212)
                  {
                    int64_t v38 = v104;
                    if (v34 == v104) {
                      goto LABEL_368;
                    }
                    goto LABEL_199;
                  }
                  uint64_t v105 = (int *)((char *)v105 + v29);
                  BOOL v107 = v106 != 21 || v34 == v104;
                  v104 += v25;
                }
                while (!v107);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_210:
                int64_t v108 = v25 + v38;
                v109 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v110 = *v109;
                  if ((*v109 & 0x4FF) == 0x412)
                  {
                    int64_t v38 = v108;
                    if (v34 == v108) {
                      goto LABEL_368;
                    }
                    goto LABEL_210;
                  }
                  v109 = (int *)((char *)v109 + v29);
                  BOOL v111 = v110 != 21 || v34 == v108;
                  v108 += v25;
                }
                while (!v111);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_221:
                int64_t v112 = v25 + v38;
                uint8x8_t v113 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v114 = *v113;
                  if ((*v113 & 0x1FF) == 0x112)
                  {
                    int64_t v38 = v112;
                    if (v34 == v112) {
                      goto LABEL_368;
                    }
                    goto LABEL_221;
                  }
                  uint8x8_t v113 = (int *)((char *)v113 + v29);
                  BOOL v115 = v114 != 21 || v34 == v112;
                  v112 += v25;
                }
                while (!v115);
                if (v38 == v34) {
                  goto LABEL_368;
                }
                int64_t v116 = -v38;
                v117 = (unsigned __int8 *)(v84 + 16 * v38 + 8);
                while (1)
                {
                  int v118 = *v117;
                  if (v118 != 21) {
                    break;
                  }
                  v117 += v29;
                  v116 -= v25;
                  if (v35 == v116) {
                    goto LABEL_238;
                  }
                }
                int64_t v119 = v25 - v116;
                if (v118 == 10) {
                  int64_t v38 = v119;
                }
LABEL_238:
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_239:
                int64_t v120 = v25 + v38;
                double v121 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v122 = *v121;
                  if ((*v121 & 0x8FF) == 0x813)
                  {
                    int64_t v38 = v120;
                    if (v34 == v120) {
                      goto LABEL_368;
                    }
                    goto LABEL_239;
                  }
                  double v121 = (int *)((char *)v121 + v29);
                  BOOL v123 = v122 != 21 || v34 == v120;
                  v120 += v25;
                }
                while (!v123);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_250:
                int64_t v124 = v25 + v38;
                v125 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v126 = *v125;
                  if ((*v125 & 0x2FF) == 0x213)
                  {
                    int64_t v38 = v124;
                    if (v34 == v124) {
                      goto LABEL_368;
                    }
                    goto LABEL_250;
                  }
                  v125 = (int *)((char *)v125 + v29);
                  BOOL v127 = v126 != 21 || v34 == v124;
                  v124 += v25;
                }
                while (!v127);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_261:
                int64_t v128 = v25 + v38;
                v129 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v130 = *v129;
                  if ((*v129 & 0x4FF) == 0x413)
                  {
                    int64_t v38 = v128;
                    if (v34 == v128) {
                      goto LABEL_368;
                    }
                    goto LABEL_261;
                  }
                  v129 = (int *)((char *)v129 + v29);
                  BOOL v131 = v130 != 21 || v34 == v128;
                  v128 += v25;
                }
                while (!v131);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_272:
                int64_t v132 = v25 + v38;
                v133 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v134 = *v133;
                  if ((*v133 & 0x1FF) == 0x113)
                  {
                    int64_t v38 = v132;
                    if (v34 == v132) {
                      goto LABEL_368;
                    }
                    goto LABEL_272;
                  }
                  v133 = (int *)((char *)v133 + v29);
                  BOOL v135 = v134 != 21 || v34 == v132;
                  v132 += v25;
                }
                while (!v135);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_283:
                int64_t v136 = v25 + v38;
                v137 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v138 = *v137;
                  if ((*v137 & 0x2FF) == 0x205)
                  {
                    int64_t v38 = v136;
                    if (v34 == v136) {
                      goto LABEL_368;
                    }
                    goto LABEL_283;
                  }
                  v137 = (int *)((char *)v137 + v29);
                  BOOL v139 = v138 != 21 || v34 == v136;
                  v136 += v25;
                }
                while (!v139);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_294:
                int64_t v140 = v25 + v38;
                uint64_t v141 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v142 = *v141;
                  if ((*v141 & 0x4FF) == 0x405)
                  {
                    int64_t v38 = v140;
                    if (v34 == v140) {
                      goto LABEL_368;
                    }
                    goto LABEL_294;
                  }
                  uint64_t v141 = (int *)((char *)v141 + v29);
                  BOOL v143 = v142 != 21 || v34 == v140;
                  v140 += v25;
                }
                while (!v143);
                if (v38 == v34) {
                  goto LABEL_368;
                }
LABEL_305:
                int64_t v144 = v25 + v38;
                unsigned int v145 = (int *)(v84 + 8 + 16 * v38);
                do
                {
                  int v146 = *v145;
                  if ((*v145 & 0x1FF) == 0x105)
                  {
                    int64_t v38 = v144;
                    if (v34 == v144) {
                      goto LABEL_368;
                    }
                    goto LABEL_305;
                  }
                  unsigned int v145 = (int *)((char *)v145 + v29);
                  BOOL v147 = v146 != 21 || v34 == v144;
                  v144 += v25;
                }
                while (!v147);
                if (v38 == v34) {
                  goto LABEL_368;
                }
                uint64_t v148 = v84 + 8;
                while (1)
                {
                  uint64_t v149 = 0;
                  v150 = (unsigned __int8 *)(v148 + 16 * v38);
                  while (1)
                  {
                    int v151 = *v150;
                    if (v151 != 21) {
                      break;
                    }
                    v150 += v29;
                    v149 -= v25;
                    if (v35 + v38 == v149) {
                      goto LABEL_195;
                    }
                  }
                  if (v151 != 6) {
                    break;
                  }
                  uint64_t v152 = v25 + v38;
                  int64_t v38 = v25 + v38 - v149;
                  if (v35 + v152 == v149) {
                    goto LABEL_368;
                  }
                }
LABEL_195:
                if (v38 == v34) {
                  goto LABEL_374;
                }
                uint64_t v45 = **((void **)v28 + 13);
                if (*(unsigned char *)(v45 + 16 * v38 + 8) != 13)
                {
                  int64_t v34 = v38;
                  goto LABEL_374;
                }
LABEL_139:
                if ((v32 != 0) | v31 & 1) {
                  break;
                }
                int v32 = 0;
LABEL_144:
                if (!((v32 != 0) | v31 & 1))
                {
                  v166 = v28;
                  int8_t v167 = u_charType(c);
                  unint64_t v28 = v166;
                  if (((1 << v167) & 0x140) != 0) {
                    int v50 = 6;
                  }
                  int v389 = v50;
                  int64_t v34 = v38 + v25;
                  goto LABEL_374;
                }
                int64_t v49 = v38;
              }
              v38 += v25;
              uint64_t v179 = v388;
              if (v38 == v34) {
                goto LABEL_375;
              }
              uint64_t v36 = v25 - v34;
              if (*(unsigned char *)(v45 + 16 * v38 + 8) == 13)
              {
                int64_t v34 = v38;
                goto LABEL_375;
              }
              break;
          }
          goto LABEL_15;
      }
      break;
    }
    while (1)
    {
      int64_t v56 = v49;
LABEL_32:
      uint64_t v57 = 0;
      int v58 = v55;
      uint64_t v59 = 16 * v56;
      uint64_t v60 = (16 * (v25 + v56)) | 8;
      uint64_t v55 = v53;
      while (1)
      {
        uint64_t v53 = v55;
        if (v34 == v49) {
          goto LABEL_70;
        }
        uint64_t v61 = **((void **)v28 + 13);
        int v62 = *(unsigned __int8 *)(v61 + v59 + 8);
        if (v62 != 13) {
          break;
        }
        if (!(v383 + v49)) {
          goto LABEL_70;
        }
        v49 += v25;
        int v63 = *(unsigned __int8 *)(v61 + ((16 * v25) | 8) + v59);
        v59 += v29;
        v57 += v25;
        v60 += v29;
        uint64_t v55 = 1;
        if ((v58 & (v63 != 13)) == 0)
        {
          int64_t v56 = v49;
          if (v63 != 13) {
            goto LABEL_32;
          }
          goto LABEL_71;
        }
      }
      if (v62 != 1)
      {
        if (v62 == 8)
        {
          if ((v54 & v58 & 1) == 0) {
            goto LABEL_71;
          }
        }
        else
        {
          if (v62 == 10)
          {
            if ((v54 | v58)) {
              goto LABEL_71;
            }
            int v54 = 0;
            goto LABEL_54;
          }
          if ((v54 | v58) & 1 | (v62 != 9)) {
            goto LABEL_71;
          }
        }
        int v54 = 1;
LABEL_54:
        v49 += v25;
        LODWORD(v55) = 1;
        continue;
      }
      if (v54 & 1 | ((v58 & 1) == 0)) {
        goto LABEL_71;
      }
      if (!(v383 + v49)) {
        goto LABEL_69;
      }
      v49 += v25;
      long long v64 = (unsigned __int8 *)(v61 + v60);
      while (1)
      {
        int v65 = *v64;
        if (v65 != 21) {
          break;
        }
        v64 += v29;
        v57 += v25;
        if (v34 - (v25 + v56) == v57) {
          goto LABEL_57;
        }
      }
      if (v65 == 22) {
        int64_t v49 = v378 + v56 + v57;
      }
LABEL_57:
      if (v49 == v34)
      {
LABEL_69:
        LOBYTE(v53) = 0;
        int v54 = 1;
      }
      else
      {
LABEL_58:
        int64_t v66 = v25 + v49;
        long long v67 = (int *)(v61 + 8 + 16 * v49);
        do
        {
          int v68 = *v67;
          if ((*v67 & 0x2FF) == 0x208)
          {
            int v54 = 1;
            int64_t v49 = v66;
            if (v34 != v66) {
              goto LABEL_58;
            }
            goto LABEL_84;
          }
          long long v67 = (int *)((char *)v67 + v29);
          BOOL v69 = v68 != 21 || v34 == v66;
          v66 += v25;
        }
        while (!v69);
        if (v49 == v34) {
          goto LABEL_69;
        }
        uint64_t v70 = v61 + 8;
        do
        {
          int64_t v71 = v25 + v49;
          long long v72 = (int *)(v70 + 16 * v49);
          while (1)
          {
            int v73 = *v72;
            if ((*v72 & 0x4FF) == 0x408) {
              break;
            }
            long long v72 = (int *)((char *)v72 + v29);
            BOOL v74 = v73 != 21 || v34 == v71;
            v71 += v25;
            int v54 = 1;
            if (v74)
            {
              LOBYTE(v53) = 0;
              goto LABEL_71;
            }
          }
          int v54 = 1;
          int64_t v49 = v71;
        }
        while (v34 != v71);
LABEL_84:
        LOBYTE(v53) = 0;
      }
LABEL_70:
      int64_t v49 = v34;
LABEL_71:
      if ((v58 & v54 & 1) == 0) {
        break;
      }
      uint64_t v53 = 0;
      int v54 = 0;
      LODWORD(v55) = 0;
      if (v49 == v34)
      {
        int v32 = 2;
        int64_t v49 = v34;
        goto LABEL_26;
      }
    }
    int64_t v35 = -v34;
    int v50 = v389;
    if (!(_BYTE)v53)
    {
      int v32 = 2;
      goto LABEL_146;
    }
    int64_t v34 = v49;
LABEL_374:
    uint64_t v179 = v388;
LABEL_375:
    if (v179 >= v34 - v25) {
      uint64_t v168 = v34 - v25;
    }
    else {
      uint64_t v168 = v179;
    }
    if (v179 - (v34 - v25) >= 0) {
      uint64_t v169 = v179 - (v34 - v25);
    }
    else {
      uint64_t v169 = v34 - v25 - v179;
    }
    uint64_t v170 = TRunGlue::GetStringIndex(v28, v179);
    int64_t i = v398;
    uint64_t v171 = TRunGlue::GetStringIndex(*(TRunGlue **)(v398 + 8), v34 - v25);
    uint64_t v172 = *(void *)(v398 + 8);
    if (*(void *)(v172 + 152))
    {
      TRunGlue::FocusOnIndex(*(TRunGlue **)(v398 + 8), v34 - v25);
      uint64_t v173 = [*(id *)(*(void *)(v172 + 152) + 216) attachmentCountAtIndex:v34 - v25 - *(void *)(v172 + 160) + *(void *)(*(void *)(v172 + 152) + 200)];
    }
    else
    {
      uint64_t v173 = 0;
    }
    uint64_t v174 = v169 + 1;
    uint64_t StringIndex = v170;
    *(void *)&long long v400 = v171 - v170 + v173 + 1;
    *((void *)&v400 + 1) = v168;
    *(void *)&long long v401 = v174;
    DWORD2(v401) = v389;
    if (!v434) {
      std::__throw_bad_function_call[abi:nn180100]();
    }
    (*(void (**)(void *, uint64_t *))(*v434 + 48))(v434, &StringIndex);
    unint64_t v28 = *(TRunGlue **)(v398 + 8);
    int64_t j = v34;
    uint64_t v27 = v385 - v174;
  }
  while (v385 > v174);
LABEL_532:
  if (v434 == v433)
  {
    (*(void (**)(void *))(v433[0] + 32))(v433);
    int64_t v249 = v398;
  }
  else
  {
    int64_t v249 = v398;
    if (v434) {
      (*(void (**)(void))(*v434 + 40))();
    }
  }
  v250 = *(int **)(v249 + 8);
  uint64_t StringIndex = *(void *)v249;
  long long v400 = 0u;
  long long v401 = 0u;
  uint64_t v411 = 0;
  long long v410 = 0u;
  long long v409 = 0u;
  long long v408 = 0u;
  long long v407 = 0u;
  long long v406 = 0u;
  long long v405 = 0u;
  long long v403 = 0u;
  long long v404 = 0u;
  long long v402 = 0u;
  *(void *)&long long v410 = *(void *)(StringIndex + 16);
  unint64_t v251 = v250[6];
  v431[0] = -1;
  v252 = (int64_t *)__p;
  p_CFIndex location = &v436->location;
  if (__p != v436)
  {
    int64_t j = 1;
    while (2)
    {
      if (*((_DWORD *)v252 + 8) == 6)
      {
        v419[0] = 9676;
        int64_t i = *v252;
        uint64_t v254 = *(void *)(v398 + 8);
        int64_t v255 = *(void *)(v254 + 40);
        if (v255 == -1)
        {
          TRunGlue::ComputeEndIndex(*(void **)(v398 + 8));
          int64_t v255 = *(void *)(v254 + 40);
        }
        if (i <= v255
          || (v415 = (unsigned __int16 *)(i - 1),
              int v256 = TCharStreamIterator::GetFullChar((TCharStreamIterator *)&StringIndex, (uint64_t *)&v415, 0),
              v256 != v419[0]))
        {
          unsigned __int16 v257 = v431[0];
          uint64_t v258 = *(void *)(v398 + 8);
          if (v431[0] == 0xFFFF)
          {
            GetGlyphsForLongCharacters(*(const TFont **)(v258 + 616), v419, v431, 1);
            uint64_t v258 = *(void *)(v398 + 8);
            unsigned __int16 v257 = v431[0];
          }
          uint64_t v259 = v252[2];
          LOWORD(v415) = v257;
          char v260 = TRunGlue::DoGlyphInsertion((TRunGlue *)v258, (const unsigned __int16 *)&v415, 1u, *(_DWORD *)(v258 + 24) >= 0, 0, v259, v259, 1, 0);
          v412 |= v260;
          v261 = (CFRange *)__p;
          v262 = v436;
          if (__p != v436)
          {
            v263 = (CFRange *)((char *)__p + 24);
            while (1)
            {
              uint64_t length = v263[-1].length;
              if (length > v259) {
                break;
              }
              CFIndex location = v263->location;
              v265 = v263;
              if (v263->location + length > v259) {
                goto LABEL_550;
              }
LABEL_551:
              v261 = (CFRange *)((char *)v261 + 40);
              v267 = v263 + 1;
              v263 = (CFRange *)((char *)v263 + 40);
              if (v267 == v262) {
                goto LABEL_552;
              }
            }
            v265 = v261 + 1;
            CFIndex location = v263[-1].length;
LABEL_550:
            v265->CFIndex location = location + 1;
            goto LABEL_551;
          }
LABEL_552:
          uint64_t v268 = v252[3] - 1;
          if ((int)v251 > 0) {
            uint64_t v268 = 0;
          }
          *(_DWORD *)(*v397 + 16 * (v268 + v252[2]) + 8) = 1;
        }
      }
      v252 += 5;
      if (v252 != p_location) {
        continue;
      }
      break;
    }
    int64_t v249 = v398;
    v250 = *(int **)(v398 + 8);
  }
  v269 = v397;
  if (TRunGlue::length((TRunGlue *)v250) >= 1)
  {
    for (int64_t j = 0; j < TRunGlue::length(*(TRunGlue **)(v249 + 8)); ++j)
    {
      if ((*(unsigned char *)(*v269 + 16 * j + 9) & 0x10) != 0)
      {
        v432[0] = TRunGlue::GetStringIndex(*(TRunGlue **)(v249 + 8), j);
        v270 = (UniversalClassTable *)TCharStreamIterator::GetFullChar((TCharStreamIterator *)&StringIndex, v432, 0);
        *(void *)v419 = 0xAAAAAAAAAAAAAAAALL;
        LODWORD(v420) = -1431655766;
        *(void *)v419 = UniversalClassTable::getSplitMatra(v270);
        LODWORD(v420) = v271;
        if (v271) {
          int64_t i = 3;
        }
        else {
          int64_t i = 2;
        }
        *(void *)&long long v272 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v272 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v417[2] = v272;
        v417[3] = v272;
        v417[0] = v272;
        v417[1] = v272;
        v415 = 0;
        long long v416 = 0uLL;
        *(void *)&v417[4] = v417;
        std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__vallocate[abi:nn180100](&v415, i);
        uint64_t v273 = v416;
        bzero((void *)v416, ((2 * (_BYTE)i + 6) & 6) + 2);
        *(void *)&long long v416 = v273 + 2 * i;
        if (GetGlyphsForLongCharacters(*(const TFont **)(*(void *)(v249 + 8) + 616), v419, v415, i) == i)
        {
          unsigned __int8 v412 = 1;
          TRunGlue::SetGlyphID<true>(*(TRunGlue **)(v249 + 8), j, *v415);
          if ((v251 & 0x80000000) != 0)
          {
            v275 = &v419[i - 1];
            if (v275 > v419)
            {
              v276 = &v419[1];
              do
              {
                unsigned int v277 = *(v276 - 1);
                *(v276 - 1) = *v275;
                *v275-- = v277;
                BOOL v278 = v276++ >= v275;
              }
              while (!v278);
            }
            v274 = v415;
            v279 = (unsigned __int16 *)(v416 - 2);
            if (v415 + 1 != (unsigned __int16 *)v416 && v279 > v415 + 1)
            {
              v281 = v415 + 2;
              do
              {
                unsigned __int16 v282 = *(v281 - 1);
                *(v281 - 1) = *v279;
                *v279-- = v282;
                BOOL v278 = v281++ >= v279;
              }
              while (!v278);
            }
          }
          else
          {
            v274 = v415;
          }
          int64_t v283 = i - 1;
          if (TRunGlue::DoGlyphInsertion(*(TRunGlue **)(v249 + 8), v274 + 1, (unsigned __int16)(i - 1), (v251 >> 31) & 1, 0, j, j, 0, 0))
          {
            v284 = (CFRange *)__p;
            v285 = v436;
            if (__p != v436)
            {
              v286 = (CFRange *)((char *)__p + 24);
              while (1)
              {
                int64_t v287 = v286[-1].length;
                if (v287 > j) {
                  break;
                }
                CFIndex v289 = v286->location;
                v288 = v286;
                if (v286->location + v287 > j) {
                  goto LABEL_584;
                }
LABEL_585:
                v284 = (CFRange *)((char *)v284 + 40);
                v290 = v286 + 1;
                v286 = (CFRange *)((char *)v286 + 40);
                if (v290 == v285) {
                  goto LABEL_586;
                }
              }
              v288 = v284 + 1;
              CFIndex v289 = v286[-1].length;
LABEL_584:
              v288->CFIndex location = v289 + v283;
              goto LABEL_585;
            }
LABEL_586:
            int64_t v291 = v249;
            uint64_t v292 = (16 * j) | 8;
            v293 = v419;
            do
            {
              uint64_t v294 = *v397;
              unsigned int v295 = *v293++;
              *(_DWORD *)(v294 + v292) = UniversalClassTable::getCharClass(*(UniversalClassTable **)(v291 + 16), v295);
              v292 += 16;
              --i;
            }
            while (i);
            j += v283;
            int64_t v249 = v291;
          }
        }
        *(void *)v413 = &v415;
        std::vector<unsigned short,TInlineBufferAllocator<unsigned short,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
        v269 = v397;
      }
    }
  }
  qmemcpy(v432, "pmcclcolartlmrtltkunnhka", sizeof(v432));
  qmemcpy(v431, "pmcclcolaltrmltrtkunnhka", 24);
  *(void *)&long long v296 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v296 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v428 = v296;
  long long v427 = v296;
  long long v426 = v296;
  long long v425 = v296;
  long long v424 = v296;
  long long v423 = v296;
  long long v422 = v296;
  unint64_t v429 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v421 = 0;
  v430 = &v422;
  if ((int)v251 <= 0) {
    v297 = v431;
  }
  else {
    v297 = v432;
  }
  *(void *)v419 = 0;
  unint64_t v420 = 0;
  OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)&v415, v297, v297 + 6);
  OTL::GCommon::GetLookups((uint64_t)v379, (uint64_t)&v415, (uint64_t)v419, 0);
  *(void *)v413 = &v415;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  memset(v417, 170, sizeof(v417));
  v415 = 0;
  long long v416 = 0uLL;
  v418 = v417;
  v298 = (CFRange *)__p;
  v299 = v436;
  while (v298 != v299)
  {
    v300 = *(unsigned int **)v419;
    v301 = (unsigned int *)v420;
    if (*(void *)v419 != v420)
    {
      uint64_t v302 = v298[1].location;
      int64_t j = v298[1].length;
      do
      {
        unsigned int v303 = *v300++;
        int64_t i = i & 0xFFFFFFFF00000000 | v303;
        OTL::GlyphLookups::SetLookupInRange<false>((uint64_t *)&v415, i, v302, j);
      }
      while (v300 != v301);
    }
    v298 = (CFRange *)((char *)v298 + 40);
  }
  *(void *)v413 = &__p;
  *(void *)&v413[8] = v397;
  *(void *)&v413[16] = 0xAAAAAAAA00000000;
  OTL::GSUB::ApplyLookups(v379, *(TRunGlue **)(v398 + 8), *(_DWORD *)(*(void *)(v398 + 8) + 24), &v415, &v412, (uint64_t)UniversalShapingEngine::ApplyLookups<TInlineVector<UniversalShapingEngine::Syllable,30ul>>(OTL::GSUB const&,OTL::GlyphLookups &,TInlineVector<UniversalShapingEngine::Syllable,30ul> &,SyncState *,TGlyphAuxDataList &,unsigned int)const::{lambda(void *,CFRange,long)#1}::__invoke, (uint64_t)v413);
  *(void *)v413 = &v415;
  std::vector<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,TInlineBufferAllocator<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  v415 = (unsigned __int16 *)v419;
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v415);
  *(void *)&long long v304 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v304 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v428 = v304;
  long long v427 = v304;
  long long v426 = v304;
  long long v425 = v304;
  long long v424 = v304;
  long long v423 = v304;
  long long v422 = v304;
  unint64_t v429 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v421 = 0;
  *(void *)v419 = 0;
  unint64_t v420 = 0;
  v430 = &v422;
  LODWORD(v432[0]) = 1919969382;
  OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)&v415, v432, (_DWORD *)v432 + 1);
  OTL::GCommon::GetLookups((uint64_t)v379, (uint64_t)&v415, (uint64_t)v419, 0);
  *(void *)v413 = &v415;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  memset(v417, 170, sizeof(v417));
  v415 = 0;
  long long v416 = 0uLL;
  v418 = v417;
  v305 = (CFRange *)__p;
  v306 = v436;
  while (v305 != v306)
  {
    uint64_t v307 = v305[1].length;
    uint64_t v308 = v307 - 3;
    if (v307 >= 3)
    {
      if ((v251 & 0x80000000) == 0 || v307 == 3) {
        uint64_t v308 = 0;
      }
      v310 = *(unsigned int **)v419;
      int64_t i = v420;
      if (*(void *)v419 != v420)
      {
        uint64_t v311 = v305[1].location + v308;
        do
        {
          unsigned int v312 = *v310++;
          int64_t j = j & 0xFFFFFFFF00000000 | v312;
          OTL::GlyphLookups::SetLookupInRange<false>((uint64_t *)&v415, j, v311, 3);
        }
        while (v310 != (unsigned int *)i);
      }
    }
    v305 = (CFRange *)((char *)v305 + 40);
  }
  *(void *)v413 = &__p;
  *(void *)&v413[8] = v397;
  *(void *)&v413[16] = 0xAAAAAAAA0000000FLL;
  OTL::GSUB::ApplyLookups(v379, *(TRunGlue **)(v398 + 8), *(_DWORD *)(*(void *)(v398 + 8) + 24), &v415, &v412, (uint64_t)UniversalShapingEngine::ApplyLookups<TInlineVector<UniversalShapingEngine::Syllable,30ul>>(OTL::GSUB const&,OTL::GlyphLookups &,TInlineVector<UniversalShapingEngine::Syllable,30ul> &,SyncState *,TGlyphAuxDataList &,unsigned int)const::{lambda(void *,CFRange,long)#1}::__invoke, (uint64_t)v413);
  *(void *)v413 = &v415;
  std::vector<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,TInlineBufferAllocator<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  v415 = (unsigned __int16 *)v419;
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v415);
  *(void *)&long long v313 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v313 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v428 = v313;
  long long v427 = v313;
  long long v426 = v313;
  long long v425 = v313;
  long long v424 = v313;
  long long v423 = v313;
  long long v422 = v313;
  unint64_t v429 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v421 = 0;
  v430 = &v422;
  LODWORD(v432[0]) = 1886545254;
  *(void *)v419 = 0;
  unint64_t v420 = 0;
  OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)&v415, v432, (_DWORD *)v432 + 1);
  OTL::GCommon::GetLookups((uint64_t)v379, (uint64_t)&v415, (uint64_t)v419, 0);
  *(void *)v413 = &v415;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  memset(v417, 170, sizeof(v417));
  v415 = 0;
  long long v416 = 0uLL;
  v418 = v417;
  v314 = (CFRange *)__p;
  v315 = v436;
  while (v314 != v315)
  {
    v316 = *(unsigned int **)v419;
    v317 = (unsigned int *)v420;
    if (*(void *)v419 != v420)
    {
      uint64_t v318 = v314[1].location;
      uint64_t v319 = v314[1].length;
      do
      {
        unsigned int v320 = *v316++;
        int64_t i = i & 0xFFFFFFFF00000000 | v320;
        OTL::GlyphLookups::SetLookupInRange<false>((uint64_t *)&v415, i, v318, v319);
      }
      while (v316 != v317);
    }
    v314 = (CFRange *)((char *)v314 + 40);
  }
  *(void *)&v413[16] = 0xAAAAAAAA00020812;
  *(void *)v413 = &__p;
  *(void *)&v413[8] = v397;
  OTL::GSUB::ApplyLookups(v379, *(TRunGlue **)(v398 + 8), *(_DWORD *)(*(void *)(v398 + 8) + 24), &v415, &v412, (uint64_t)UniversalShapingEngine::ApplyLookups<TInlineVector<UniversalShapingEngine::Syllable,30ul>>(OTL::GSUB const&,OTL::GlyphLookups &,TInlineVector<UniversalShapingEngine::Syllable,30ul> &,SyncState *,TGlyphAuxDataList &,unsigned int)const::{lambda(void *,CFRange,long)#1}::__invoke, (uint64_t)v413);
  *(void *)v413 = &v415;
  std::vector<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,TInlineBufferAllocator<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  v415 = (unsigned __int16 *)v419;
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v415);
  *(void *)&long long v321 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v321 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v428 = v321;
  long long v427 = v321;
  long long v426 = v321;
  long long v425 = v321;
  long long v424 = v321;
  long long v423 = v321;
  long long v422 = v321;
  unint64_t v429 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v421 = 0;
  *(void *)v419 = 0;
  unint64_t v420 = 0;
  v430 = &v422;
  qmemcpy(v413, "frkrfvbafwlbflahftsputavtcjc", sizeof(v413));
  OTL::FeatureBuffer::FeatureBuffer<unsigned int const*>((char **)&v415, v413, v414);
  OTL::GCommon::GetLookups((uint64_t)v379, (uint64_t)&v415, (uint64_t)v419, 0);
  v432[0] = (uint64_t)&v415;
  std::vector<std::pair<unsigned int,unsigned int>,TInlineBufferAllocator<std::pair<unsigned int,unsigned int>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v432);
  memset(v417, 170, sizeof(v417));
  v415 = 0;
  long long v416 = 0uLL;
  v418 = v417;
  v322 = (CFRange *)__p;
  v323 = v436;
  while (v322 != v323)
  {
    v324 = *(unsigned int **)v419;
    v325 = (unsigned int *)v420;
    if (*(void *)v419 != v420)
    {
      uint64_t v326 = v322[1].location;
      uint64_t v327 = v322[1].length;
      do
      {
        unsigned int v328 = *v324++;
        int64_t i = i & 0xFFFFFFFF00000000 | v328;
        OTL::GlyphLookups::SetLookupInRange<false>((uint64_t *)&v415, i, v326, v327);
      }
      while (v324 != v325);
    }
    v322 = (CFRange *)((char *)v322 + 40);
  }
  *(void *)&v413[16] = 0xAAAAAAAA00000000;
  v330 = v397;
  v329 = (uint64_t *)v398;
  *(void *)v413 = &__p;
  *(void *)&v413[8] = v397;
  OTL::GSUB::ApplyLookups(v379, *(TRunGlue **)(v398 + 8), *(_DWORD *)(*(void *)(v398 + 8) + 24), &v415, &v412, (uint64_t)UniversalShapingEngine::ApplyLookups<TInlineVector<UniversalShapingEngine::Syllable,30ul>>(OTL::GSUB const&,OTL::GlyphLookups &,TInlineVector<UniversalShapingEngine::Syllable,30ul> &,SyncState *,TGlyphAuxDataList &,unsigned int)const::{lambda(void *,CFRange,long)#1}::__invoke, (uint64_t)v413);
  *(void *)v413 = &v415;
  std::vector<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,TInlineBufferAllocator<std::pair<std::pair<unsigned short,unsigned short>,TInlineVector<CFRange,4ul>>,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)v413);
  v415 = (unsigned __int16 *)v419;
  std::vector<unsigned int,TInlineBufferAllocator<unsigned int,30ul>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v415);
  v331 = (CFRange *)__p;
  v393 = v436;
  if (__p == v436) {
    goto LABEL_712;
  }
  char v391 = 0;
  do
  {
    uint64_t v333 = v331[1].location;
    uint64_t v332 = v331[1].length;
    uint64_t v334 = v332 - 1;
    if ((int)v251 > 0) {
      uint64_t v334 = 0;
    }
    uint64_t v335 = v334 + v333;
    if (*(unsigned char *)(*v330 + 16 * (v334 + v333) + 8) == 15)
    {
      uint64_t v336 = TRunGlue::GlyphRangeForGlyphIndex(*(TRun ***)(v398 + 8), v335);
      uint64_t v338 = v336;
      uint64_t v395 = v337;
      if ((int)v251 <= 0) {
        uint64_t v339 = -1;
      }
      else {
        uint64_t v339 = v337;
      }
      uint64_t v340 = v339 + v336;
      uint64_t v341 = v332 + v333;
      if (v333 <= v339 + v336 && v341 > v340)
      {
        do
        {
          if (TRunGlue::IsDeleted(*(TRunGlue **)(v398 + 8), v340)) {
            goto LABEL_648;
          }
          int v343 = *(_DWORD *)(*v330 + 16 * v340 + 8);
          if (v343 == 1 || v343 == 4) {
            goto LABEL_648;
          }
          if (v343 != 10) {
            break;
          }
          if ((v343 & 0x100FF) != 0xA)
          {
LABEL_648:
            uint64_t v345 = v340;
          }
          else
          {
            uint64_t v345 = v340 + v251;
            if (v333 > (uint64_t)(v340 + v251) || v341 <= v345 || *(unsigned char *)(*v330 + 16 * v345 + 8) != 13) {
              break;
            }
          }
          uint64_t v340 = v345 + v251;
        }
        while (v333 <= (uint64_t)(v345 + v251) && v341 > v340);
      }
      uint64_t v347 = TRunGlue::GlyphRangeForGlyphIndex(*(TRun ***)(v398 + 8), v340 - v251);
      if ((int)v251 < 1)
      {
        uint64_t v349 = v335 + 1;
        uint64_t v350 = v347;
        uint64_t v348 = v338;
      }
      else
      {
        uint64_t v348 = v338 + v395;
        uint64_t v349 = v347 + v346;
        uint64_t v350 = v335;
      }
      TRunGlue::Rotate(*(TRunGlue **)(v398 + 8), v350, v348, v349, v397);
      char v391 = 1;
    }
    else
    {
      uint64_t v341 = v332 + v333;
    }
    if (v333 <= v335 && v341 > v335)
    {
      uint64_t v352 = 0;
      char v396 = 0;
      if ((int)v251 <= 0) {
        uint64_t v353 = -1;
      }
      else {
        uint64_t v353 = v332;
      }
      uint64_t v354 = v353 + v333;
      uint64_t v355 = (16 * v335) | 8;
      uint64_t v356 = v335;
      while (1)
      {
        if (!TRunGlue::IsDeleted(*(TRunGlue **)(v398 + 8), v356))
        {
          int v357 = *(_DWORD *)(*v397 + v355);
          int v358 = v357;
          if (v357 > 0x11u)
          {
            if (v357 - 18 < 2 && (v357 & 0x800) != 0)
            {
              if (*(_DWORD *)&v396 & ((v357 & 0x20000u) >> 17))
              {
                char v396 = 1;
              }
              else
              {
                if (v335 >= v356) {
                  uint64_t v366 = v356;
                }
                else {
                  uint64_t v366 = v335;
                }
                if (v352 >= 0) {
                  uint64_t v367 = v352;
                }
                else {
                  uint64_t v367 = -v352;
                }
                char v396 = 1;
                if (v366 <= v354 && v366 + v367 + 1 > v354)
                {
                  uint64_t v368 = v356 + 1;
                  if ((int)v251 < 1)
                  {
                    uint64_t v369 = v356;
                    uint64_t v370 = v356 + 1;
                    uint64_t v368 = v354 + 1;
                  }
                  else
                  {
                    uint64_t v369 = v354;
                    uint64_t v370 = v356;
                  }
                  TRunGlue::Rotate(*(TRunGlue **)(v398 + 8), v369, v370, v368, v397);
                  char v396 = 1;
                  char v391 = 1;
                }
              }
            }
            goto LABEL_668;
          }
          if (v357 == 1 || v357 == 4)
          {
            if (v333 <= v354 && v341 > v354) {
              goto LABEL_668;
            }
            uint64_t v360 = TRunGlue::GlyphRangeForGlyphIndex(*(TRun ***)(v398 + 8), v356);
            uint64_t v362 = v361 - 1;
            if ((int)v251 > 0) {
              uint64_t v362 = 0;
            }
          }
          else
          {
            int v363 = v357 & 0x100FF;
            if (v358 != 10 || v363 != 10) {
              goto LABEL_668;
            }
            uint64_t v360 = TRunGlue::GlyphRangeForGlyphIndex(*(TRun ***)(v398 + 8), v356);
            if ((int)v251 <= 0) {
              uint64_t v362 = -1;
            }
            else {
              uint64_t v362 = v365;
            }
          }
          uint64_t v354 = v362 + v360;
        }
LABEL_668:
        v356 += v251;
        if (v333 <= v356)
        {
          v352 -= v251;
          v355 += 16 * v251;
          if (v341 > v356) {
            continue;
          }
        }
        break;
      }
    }
    v331 = (CFRange *)((char *)v331 + 40);
    v330 = v397;
  }
  while (v331 != v393);
  v329 = (uint64_t *)v398;
  if (v391)
  {
    unsigned __int8 v412 = 1;
    if (*(void *)(*(void *)(v398 + 8) + 152))
    {
      v371 = (CFRange *)__p;
      v372 = v436;
      while (v371 != v372)
      {
        TRunGlue::ClearSafeToBreakAfter(*(void *)(v398 + 8), v371[1]);
        v371 = (CFRange *)((char *)v371 + 40);
      }
    }
  }
LABEL_712:
  if (*(unsigned char *)(v329[2] + 8))
  {
    *(void *)&v417[0] = 0xAAAAAAAAAAAAAA01;
    uint64_t v374 = *v329;
    uint64_t v373 = v329[1];
    v415 = (unsigned __int16 *)&unk_1ED05F298;
    *(void *)&long long v416 = v374;
    *((void *)&v416 + 1) = v373;
    if (v374)
    {
      *(_WORD *)(v373 + 632) = 257;
      off_1ED05F2B0((JoiningScriptShapingEngine *)&v415, v379, v377);
      char v375 = 1;
    }
    else
    {
      char v375 = 0;
    }
    v412 |= v375;
  }
  if (__p)
  {
    v436 = (CFRange *)__p;
    if (v438 > __p || v439 <= __p) {
      operator delete(__p);
    }
  }
  return v412;
}

void std::__function::__func<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0,std::allocator<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0>,void ()(UniversalShapingEngine::Syllable)>::~__func()
{
}

void *std::__function::__func<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0,std::allocator<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0>,void ()(UniversalShapingEngine::Syllable)>::__clone(uint64_t a1)
{
  BOOL result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *BOOL result = &unk_1ED061238;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0,std::allocator<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0>,void ()(UniversalShapingEngine::Syllable)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1ED061238;
  a2[1] = v2;
  return result;
}

void std::__function::__func<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0,std::allocator<UniversalShapingEngine::ApplyScriptShaping(OTL::GSUB const&,OTL::GlyphLookups *)::$_0>,void ()(UniversalShapingEngine::Syllable)>::operator()(uint64_t a1, long long *a2)
{
  long long v22 = *a2;
  long long v23 = a2[1];
  uint64_t v24 = *((void *)a2 + 4);
  uint64_t v2 = *(char ***)(a1 + 8);
  unint64_t v3 = (unint64_t)v2[1];
  unint64_t v4 = (unint64_t)v2[2];
  if (v3 >= v4)
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v3 - (void)*v2) >> 3);
    unint64_t v9 = v8 + 1;
    if (v8 + 1 > 0x666666666666666) {
      abort();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v4 - (void)*v2) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x333333333333333) {
      unint64_t v11 = 0x666666666666666;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      CFIndex v12 = v2[153];
      unint64_t v13 = (unint64_t)&v12[40 * v11];
      if (v13 <= (unint64_t)(v2 + 153))
      {
        v2[153] = (char *)v13;
      }
      else
      {
        if (v11 > 0x666666666666666) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        CFIndex v12 = (char *)operator new(40 * v11);
      }
    }
    else
    {
      CFIndex v12 = 0;
    }
    unint64_t v14 = &v12[40 * v8];
    *(_OWORD *)unint64_t v14 = v22;
    *((_OWORD *)v14 + 1) = v23;
    *((void *)v14 + 4) = v24;
    uint64_t v16 = *v2;
    CFIndex v15 = v2[1];
    uint64_t v17 = v14;
    if (v15 != *v2)
    {
      do
      {
        long long v18 = *(_OWORD *)(v15 - 40);
        long long v19 = *(_OWORD *)(v15 - 24);
        *((void *)v17 - 1) = *((void *)v15 - 1);
        *(_OWORD *)(v17 - 24) = v19;
        *(_OWORD *)(v17 - 40) = v18;
        v17 -= 40;
        v15 -= 40;
      }
      while (v15 != v16);
      CFIndex v15 = *v2;
    }
    uint64_t v7 = v14 + 40;
    *uint64_t v2 = v17;
    v2[1] = v14 + 40;
    size_t v20 = v2[2];
    v2[2] = &v12[40 * v11];
    if (v15)
    {
      if (v2 + 3 > (char **)v15 || (atomic_ullong v21 = v2 + 153, v2 + 153 <= (char **)v15))
      {
        operator delete(v15);
      }
      else if (v20 == *v21)
      {
        char *v21 = v15;
      }
    }
  }
  else
  {
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(v3 + 32) = *((void *)a2 + 4);
    *(_OWORD *)unint64_t v3 = v5;
    *(_OWORD *)(v3 + 16) = v6;
    uint64_t v7 = (char *)(v3 + 40);
  }
  v2[1] = v7;
}

_DWORD *UniversalShapingEngine::ApplyLookups<TInlineVector<UniversalShapingEngine::Syllable,30ul>>(OTL::GSUB const&,OTL::GlyphLookups &,TInlineVector<UniversalShapingEngine::Syllable,30ul> &,SyncState *,TGlyphAuxDataList &,unsigned int)const::{lambda(void *,CFRange,long)#1}::__invoke(_DWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 - a3 >= 1)
  {
    unint64_t v4 = **(void ***)result;
    long long v5 = *(void **)(*(void *)result + 8);
    if (v4 != v5)
    {
      long long v6 = v4 + 3;
      while (1)
      {
        uint64_t v7 = *(v6 - 1);
        if (v7 > a2) {
          break;
        }
        uint64_t v9 = *v6;
        unint64_t v8 = v6;
        if (*v6 + v7 > a2) {
          goto LABEL_7;
        }
LABEL_8:
        v4 += 5;
        unint64_t v10 = v6 + 2;
        v6 += 5;
        if (v10 == v5) {
          goto LABEL_9;
        }
      }
      unint64_t v8 = v4 + 2;
      uint64_t v9 = *(v6 - 1);
LABEL_7:
      void *v8 = v9 + a4 - a3;
      goto LABEL_8;
    }
  }
LABEL_9:
  int v11 = result[4];
  CFIndex v12 = (int *)(**((void **)result + 1) + 16 * a2 + 8);
  if (!v11) {
    int v11 = *v12 | 0x10000;
  }
  *CFIndex v12 = v11;
  return result;
}

void TAATLtagTable::TAATLtagTable(TAATLtagTable *this, const TBaseFont *a2)
{
  CFDataRef CommonTable = (const __CFData *)TBaseFont::GetCommonTable(a2, 1634497633, 0);
  *(void *)this = CommonTable;
  long long v5 = (const UInt8 **)((char *)this + 8);
  if (CommonTable)
  {
    BytePtr = CFDataGetBytePtr(CommonTable);
    CFDataRef v7 = *(const __CFData **)this;
    *((void *)this + 1) = BytePtr;
    if (v7)
    {
      unint64_t v8 = CFDataGetBytePtr(v7);
      if (v8) {
        unint64_t v9 = (unint64_t)&v8[CFDataGetLength(v7)];
      }
      else {
        unint64_t v9 = 0;
      }
      BytePtr = *v5;
    }
    else
    {
      unint64_t v9 = 0;
    }
    *((void *)this + 2) = v9;
    if (BytePtr && ((unint64_t)(BytePtr + 12) > v9 || *(_DWORD *)BytePtr != 0x1000000)) {
      (*(void (**)(const TBaseFont *, uint64_t))(*(void *)a2 + 488))(a2, 1819566439);
    }
  }
  else
  {
    *long long v5 = 0;
    *((void *)this + 2) = 0;
  }
}

void TAATLtagTable::CopyLanguageTags(TAATLtagTable *this@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *((void *)this + 1);
  if (v3)
  {
    unint64_t v5 = v3 + 12;
    unsigned int v6 = bswap32(*(_DWORD *)(v3 + 8));
    unint64_t v7 = *((void *)this + 2);
    unint64_t v8 = v3 + 12 + 4 * v6;
    if (v3 + 16 <= v7) {
      unsigned int v9 = (v7 - (v3 + 12)) >> 2;
    }
    else {
      unsigned int v9 = 0;
    }
    if (v8 <= v7 && v8 >= v5) {
      unsigned int v9 = v6;
    }
    if (v9 >= 0xFFFF) {
      CFIndex v11 = 0xFFFFLL;
    }
    else {
      CFIndex v11 = v9;
    }
    CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    id Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v14 = *((void *)this + 1);
        unsigned int v15 = bswap32(*(_DWORD *)(v14 + 4 * i + 12));
        uint64_t v16 = HIWORD(v15);
        CFIndex v17 = (unsigned __int16)v15;
        if ((unsigned __int16)v15 + v16) {
          BOOL v18 = v14 + (unint64_t)(unsigned __int16)v15 + v16 > *((void *)this + 2);
        }
        else {
          BOOL v18 = 1;
        }
        if (!v18)
        {
          long long v19 = (const UInt8 *)(v14 + v16);
          TaggedPointerCFStringRef String = (id)_CFStringCreateTaggedPointerString();
          if (atomic_load_explicit((atomic_ullong *volatile)&TaggedPointerString, memory_order_acquire)
            || ((id)atomic_exchange((atomic_ullong *volatile)&TaggedPointerString, (unint64_t)CFStringCreateWithBytes(v12, v19, v17, 0x8000100u, 0)), atomic_load_explicit((atomic_ullong *volatile)&TaggedPointerString, memory_order_acquire)))
          {
            CanonicalLanguageIdentifierFromCFStringRef String = (__CFString *)CFLocaleCreateCanonicalLanguageIdentifierFromString(v12, (CFStringRef)atomic_load_explicit((atomic_ullong *volatile)&TaggedPointerString, memory_order_acquire));
            if (CanonicalLanguageIdentifierFromString)
            {
              int valuePtr = i;
              CFNumberRef v21 = CFNumberCreate(v12, kCFNumberIntType, &valuePtr);
              if (v21)
              {
                long long v22 = CanonicalLanguageIdentifierFromString;
                CFDictionaryAddValue((CFMutableDictionaryRef)atomic_load_explicit((atomic_ullong *volatile)&Mutable, memory_order_acquire), v22, v21);
              }
            }
          }
        }
      }
    }
    *a2 = atomic_exchange((atomic_ullong *volatile)&Mutable, 0);
  }
  else
  {
    *a2 = 0;
  }
}

uint64_t sub_184B7A248()
{
  return MEMORY[0x1F40E37E8]();
}

uint64_t sub_184B7A258()
{
  return MEMORY[0x1F40E3808]();
}

uint64_t sub_184B7A268()
{
  return MEMORY[0x1F40E3810]();
}

uint64_t sub_184B7A278()
{
  return MEMORY[0x1F40E4D50]();
}

uint64_t sub_184B7A288()
{
  return MEMORY[0x1F40E4DA0]();
}

uint64_t sub_184B7A298()
{
  return MEMORY[0x1F40E4DC0]();
}

uint64_t sub_184B7A2A8()
{
  return MEMORY[0x1F41878F0]();
}

uint64_t sub_184B7A2B8()
{
  return MEMORY[0x1F40E6198]();
}

uint64_t sub_184B7A2C8()
{
  return MEMORY[0x1F40E61D0]();
}

uint64_t sub_184B7A2D8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_184B7A2E8()
{
  return MEMORY[0x1F4185568]();
}

uint64_t sub_184B7A2F8()
{
  return MEMORY[0x1F4185598]();
}

uint64_t sub_184B7A308()
{
  return MEMORY[0x1F4185690]();
}

uint64_t sub_184B7A318()
{
  return MEMORY[0x1F41856C0]();
}

uint64_t sub_184B7A328()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_184B7A338()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_184B7A348()
{
  return MEMORY[0x1F4185EC8]();
}

uint64_t sub_184B7A358()
{
  return MEMORY[0x1F4185EF8]();
}

uint64_t sub_184B7A368()
{
  return MEMORY[0x1F4185FC8]();
}

uint64_t sub_184B7A378()
{
  return MEMORY[0x1F4185FF0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D7160](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1F40D7170](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7178](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7198](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1F40D71C8](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1F40D71D8]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7240](alloc, str, attributes);
}

CFAttributedStringRef CFAttributedStringCreateCopy(CFAllocatorRef alloc, CFAttributedStringRef aStr)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7248](alloc, aStr);
}

CFMutableAttributedStringRef CFAttributedStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFAttributedStringRef aStr)
{
  return (CFMutableAttributedStringRef)MEMORY[0x1F40D7258](alloc, maxLength, aStr);
}

CFAttributedStringRef CFAttributedStringCreateWithSubstring(CFAllocatorRef alloc, CFAttributedStringRef aStr, CFRange range)
{
  return (CFAttributedStringRef)MEMORY[0x1F40D7260](alloc, aStr, range.location, range.length);
}

CFTypeRef CFAttributedStringGetAttribute(CFAttributedStringRef aStr, CFIndex loc, CFStringRef attrName, CFRange *effectiveRange)
{
  return (CFTypeRef)MEMORY[0x1F40D7270](aStr, loc, attrName, effectiveRange);
}

CFDictionaryRef CFAttributedStringGetAttributes(CFAttributedStringRef aStr, CFIndex loc, CFRange *effectiveRange)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7280](aStr, loc, effectiveRange);
}

uint64_t CFAttributedStringGetBidiLevelsAndResolvedDirections()
{
  return MEMORY[0x1F40D7290]();
}

CFIndex CFAttributedStringGetLength(CFAttributedStringRef aStr)
{
  return MEMORY[0x1F40D7298](aStr);
}

CFStringRef CFAttributedStringGetString(CFAttributedStringRef aStr)
{
  return (CFStringRef)MEMORY[0x1F40D72A0](aStr);
}

void CFAttributedStringRemoveAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName)
{
}

void CFAttributedStringReplaceAttributedString(CFMutableAttributedStringRef aStr, CFRange range, CFAttributedStringRef replacement)
{
}

void CFAttributedStringReplaceString(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef replacement)
{
}

void CFAttributedStringSetAttribute(CFMutableAttributedStringRef aStr, CFRange range, CFStringRef attrName, CFTypeRef value)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1F40D72D8](arg);
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x1F40D73A8](allocator, bytes, numBits);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1F40D73B8](allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1F40D73C8](bv, idx);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return MEMORY[0x1F40D73D8](bv);
}

void CFBitVectorSetAllBits(CFMutableBitVectorRef bv, CFBit value)
{
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetBits(CFMutableBitVectorRef bv, CFRange range, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1F40D7430](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x1F40D7448](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x1F40D7490](locArray, prefArray);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1F40D74B0]();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1F40D7568](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7578](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1F40D7598]();
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7708](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7718](alloc);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1F40D7720](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithBitmapRepresentation(CFAllocatorRef alloc, CFDataRef theData)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7728](alloc, theData);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInRange(CFAllocatorRef alloc, CFRange theRange)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7730](alloc, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7738](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1F40D7740](theSetIdentifier);
}

CFTypeID CFCharacterSetGetTypeID(void)
{
  return MEMORY[0x1F40D7748]();
}

uint64_t CFCharacterSetInitInlineBuffer()
{
  return MEMORY[0x1F40D7758]();
}

void CFCharacterSetIntersect(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1F40D7770](theSet, theChar);
}

Boolean CFCharacterSetIsLongCharacterMember(CFCharacterSetRef theSet, UTF32Char theChar)
{
  return MEMORY[0x1F40D7778](theSet, *(void *)&theChar);
}

Boolean CFCharacterSetIsSupersetOfSet(CFCharacterSetRef theSet, CFCharacterSetRef theOtherset)
{
  return MEMORY[0x1F40D7780](theSet, theOtherset);
}

void CFCharacterSetRemoveCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
}

void CFCharacterSetRemoveCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1F40D77A8](cf);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1F40D7808](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1F40D7818](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1F40D7858](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1F40D7968](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7978](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7990](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D79A8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1F40D79C0](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1F40D7A00]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1F40D7A18](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1F40D7A68](cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7A90](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1F40D7A98](allocator, domain, code, userInfo);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x1F40D7AA0](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1F40D7AA8](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B68](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1F40D7BA0](cf);
}

CFArrayRef CFLocaleCopyAvailableLocaleIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x1F40D7BB0]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BB8]();
}

CFArrayRef CFLocaleCopyISOLanguageCodes(void)
{
  return (CFArrayRef)MEMORY[0x1F40D7BD0]();
}

CFArrayRef CFLocaleCopyPreferredLanguages(void)
{
  return (CFArrayRef)MEMORY[0x1F40D7BD8]();
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1F40D7BE0](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BE8](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7BF8](allocator, localeIdentifier);
}

CFDictionaryRef CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocatorRef allocator, CFLocaleIdentifier localeID)
{
  return (CFDictionaryRef)MEMORY[0x1F40D7C00](allocator, localeID);
}

CFLocaleIdentifier CFLocaleCreateLocaleIdentifierFromComponents(CFAllocatorRef allocator, CFDictionaryRef dictionary)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C10](allocator, dictionary);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x1F40D7C20](locale);
}

uint64_t CFLocaleGetLanguageRegionEncodingForLocaleIdentifier()
{
  return MEMORY[0x1F40D7C30]();
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x1F40D7C48](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x1F40D7C50]();
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D7CA0](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1F40D7D68]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1F40D7D78](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1F40D7E10]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1F40D7E20](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1F40D7F70](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1F40D81F8](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1F40D8200](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8210](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1F40D8218](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1F40D8220](theSet);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

void CFStringCapitalize(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D8388](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptionsAndLocale(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions, CFLocaleRef locale)
{
  return MEMORY[0x1F40D8398](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions, locale);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1F40D83D0](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1F40D83F0](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1F40D83F8](alloc, theString, *(void *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8408](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1F40D8410](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1F40D8438](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8440](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8448](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8458](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1F40D8460](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1F40D8490](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1F40D84A8](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x1F40D84C8](theString, stringToFind, compareOptions);
  result.uint64_t length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1F40D84D0](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84D8](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1F40D84E0](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1F40D8500](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1F40D8528](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x1F40D8548](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1F40D8568](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8590](length, *(void *)&encoding);
}

void CFStringGetParagraphBounds(CFStringRef string, CFRange range, CFIndex *parBeginIndex, CFIndex *parEndIndex, CFIndex *contentsEndIndex)
{
}

uint64_t CFStringGetRangeOfCharacterClusterAtIndex()
{
  return MEMORY[0x1F40D85D0]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1F40D8600](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1F40D8608](theString, suffix);
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1F40D8740](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1F40D8760](anURL, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D8848](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D8870](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(void *)&encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1F40D88A0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1F40D88C0](allocator, URLString, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x1F40D88F0](anURL);
}

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFIndex v3 = MEMORY[0x1F40D88F8](url, component, rangeIncludingSeparators);
  result.uint64_t length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1F40D8900](url, buffer, bufferLength);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1F40D8908](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1F40D8918](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1F40D8928]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t CFUniCharIsMemberOf()
{
  return MEMORY[0x1F40D8A10]();
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1F40D8AB0](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1F40D8AD0](stream);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97A8](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1F40D9808](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1F40D9818](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1F40D9970](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  MEMORY[0x1F40D99F0](color);
  return result;
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return (CGColorRef)MEMORY[0x1F40D9A08](colorName);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1F40D9A30]();
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1F40D9A60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9AF8]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1F40D9B60](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1F40D9BE0](space);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
}

uint64_t CGContextClear()
{
  return MEMORY[0x1F40D9D30]();
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
}

void CGContextFillPath(CGContextRef c)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

uint64_t CGContextGetAlpha()
{
  return MEMORY[0x1F40D9F50]();
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9F68](retstr, c);
}

uint64_t CGContextGetCharacterSpacing()
{
  return MEMORY[0x1F40D9F70]();
}

uint64_t CGContextGetFillColorAsColor()
{
  return MEMORY[0x1F40D9F98]();
}

uint64_t CGContextGetFontSize()
{
  return MEMORY[0x1F40D9FB0]();
}

uint64_t CGContextGetShouldDrawBitmapRuns()
{
  return MEMORY[0x1F40DA008]();
}

uint64_t CGContextGetStyle()
{
  return MEMORY[0x1F40DA018]();
}

CGAffineTransform *__cdecl CGContextGetTextMatrix(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40DA020](retstr, c);
}

CGPoint CGContextGetTextPosition(CGContextRef c)
{
  MEMORY[0x1F40DA028](c);
  result.CGFloat y = v2;
  result.CGFloat x = v1;
  return result;
}

uint64_t CGContextGetType()
{
  return MEMORY[0x1F40DA030]();
}

CGAffineTransform *__cdecl CGContextGetUserSpaceToDeviceSpaceTransform(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x1F40DA038](retstr, c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
}

uint64_t CGContextSetCTM()
{
  return MEMORY[0x1F40DA0F0]();
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetFont(CGContextRef c, CGFontRef font)
{
}

void CGContextSetFontSize(CGContextRef c, CGFloat size)
{
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
}

uint64_t CGContextSetShouldDrawBitmapRuns()
{
  return MEMORY[0x1F40DA1E8]();
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
}

uint64_t CGContextSetStyle()
{
  return MEMORY[0x1F40DA228]();
}

void CGContextSetTextDrawingMode(CGContextRef c, CGTextDrawingMode mode)
{
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
}

void CGContextShowGlyphsAtPositions(CGContextRef c, const CGGlyph *glyphs, const CGPoint *Lpositions, size_t count)
{
}

uint64_t CGContextShowGlyphsAtPositionsWithString()
{
  return MEMORY[0x1F40DA260]();
}

void CGContextShowGlyphsWithAdvances(CGContextRef c, const CGGlyph *glyphs, const CGSize *advances, size_t count)
{
}

void CGContextStrokePath(CGContextRef c)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA300](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1F40DA310](info, data, size, releaseData);
}

uint64_t CGFontCopyCharacterSet()
{
  return MEMORY[0x1F40DA3B8]();
}

uint64_t CGFontCopyFamilyName()
{
  return MEMORY[0x1F40DA3C0]();
}

CFStringRef CGFontCopyFullName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DA3C8](font);
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x1F40DA3D0](font, glyph);
}

uint64_t CGFontCopyName()
{
  return MEMORY[0x1F40DA3D8]();
}

CFStringRef CGFontCopyPostScriptName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x1F40DA3E8](font);
}

CFDataRef CGFontCopyTableForTag(CGFontRef font, uint32_t tag)
{
  return (CFDataRef)MEMORY[0x1F40DA3F0](font, *(void *)&tag);
}

CFArrayRef CGFontCopyTableTags(CGFontRef font)
{
  return (CFArrayRef)MEMORY[0x1F40DA3F8](font);
}

uint64_t CGFontCopyURL()
{
  return MEMORY[0x1F40DA400]();
}

CFDictionaryRef CGFontCopyVariations(CGFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x1F40DA408](font);
}

CGFontRef CGFontCreateCopyWithVariations(CGFontRef font, CFDictionaryRef variations)
{
  return (CGFontRef)MEMORY[0x1F40DA410](font, variations);
}

uint64_t CGFontCreateFontsFromData()
{
  return MEMORY[0x1F40DA418]();
}

uint64_t CGFontCreateFontsWithURL()
{
  return MEMORY[0x1F40DA420]();
}

uint64_t CGFontCreateGlyphPath()
{
  return MEMORY[0x1F40DA428]();
}

CGFontRef CGFontCreateWithDataProvider(CGDataProviderRef provider)
{
  return (CGFontRef)MEMORY[0x1F40DA430](provider);
}

CGFontRef CGFontCreateWithFontName(CFStringRef name)
{
  return (CGFontRef)MEMORY[0x1F40DA438](name);
}

uint64_t CGFontCreateWithParserFont()
{
  return MEMORY[0x1F40DA448]();
}

uint64_t CGFontCreateWithPathAndName()
{
  return MEMORY[0x1F40DA450]();
}

uint64_t CGFontCreateWithVariations()
{
  return MEMORY[0x1F40DA458]();
}

uint64_t CGFontDBGetLocal()
{
  return MEMORY[0x1F40DA478]();
}

uint64_t CGFontDBPurgeFont()
{
  return MEMORY[0x1F40DA488]();
}

int CGFontGetCapHeight(CGFontRef font)
{
  return MEMORY[0x1F40DA4B0](font);
}

CGRect CGFontGetFontBBox(CGFontRef font)
{
  MEMORY[0x1F40DA4C0](font);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

uint64_t CGFontGetGlyphAdvancesForStyle()
{
  return MEMORY[0x1F40DA4C8]();
}

BOOL CGFontGetGlyphBBoxes(CGFontRef font, const CGGlyph *glyphs, size_t count, CGRect *bboxes)
{
  return MEMORY[0x1F40DA4D0](font, glyphs, count, bboxes);
}

uint64_t CGFontGetGlyphBBoxesForStyle()
{
  return MEMORY[0x1F40DA4D8]();
}

uint64_t CGFontGetGlyphVerticalAdvances()
{
  return MEMORY[0x1F40DA4E8]();
}

uint64_t CGFontGetGlyphVerticalOffsets()
{
  return MEMORY[0x1F40DA4F0]();
}

CGGlyph CGFontGetGlyphWithGlyphName(CGFontRef font, CFStringRef name)
{
  return MEMORY[0x1F40DA4F8](font, name);
}

uint64_t CGFontGetGlyphsForCIDs()
{
  return MEMORY[0x1F40DA500]();
}

uint64_t CGFontGetGlyphsForUnichars()
{
  return MEMORY[0x1F40DA508]();
}

uint64_t CGFontGetHMetrics()
{
  return MEMORY[0x1F40DA510]();
}

CGFloat CGFontGetItalicAngle(CGFontRef font)
{
  MEMORY[0x1F40DA518](font);
  return result;
}

uint64_t CGFontGetMaxUnichars()
{
  return MEMORY[0x1F40DA520]();
}

size_t CGFontGetNumberOfGlyphs(CGFontRef font)
{
  return MEMORY[0x1F40DA528](font);
}

uint64_t CGFontGetParserFont()
{
  return MEMORY[0x1F40DA530]();
}

uint64_t CGFontGetRegistryOrderingSupplement()
{
  return MEMORY[0x1F40DA538]();
}

uint64_t CGFontGetUnderlinePosition()
{
  return MEMORY[0x1F40DA548]();
}

uint64_t CGFontGetUnderlineThickness()
{
  return MEMORY[0x1F40DA550]();
}

uint64_t CGFontGetUnicharsForGlyph()
{
  return MEMORY[0x1F40DA558]();
}

int CGFontGetUnitsPerEm(CGFontRef font)
{
  return MEMORY[0x1F40DA560](font);
}

uint64_t CGFontGetVMetrics()
{
  return MEMORY[0x1F40DA568]();
}

uint64_t CGFontGetVariationAxes()
{
  return MEMORY[0x1F40DA570]();
}

uint64_t CGFontGetVariations()
{
  return MEMORY[0x1F40DA578]();
}

int CGFontGetXHeight(CGFontRef font)
{
  return MEMORY[0x1F40DA580](font);
}

uint64_t CGFontIsBitmapOnly()
{
  return MEMORY[0x1F40DA590]();
}

uint64_t CGFontIsFixedPitch()
{
  return MEMORY[0x1F40DA598]();
}

uint64_t CGFontNameTableCopyLocales()
{
  return MEMORY[0x1F40DA5A0]();
}

uint64_t CGFontNameTableCopyNameForLocaleIdentifier()
{
  return MEMORY[0x1F40DA5A8]();
}

uint64_t CGFontNameTableCopyRootName()
{
  return MEMORY[0x1F40DA5B0]();
}

uint64_t CGFontNameTableCreate()
{
  return MEMORY[0x1F40DA5B8]();
}

uint64_t CGFontNameTableRelease()
{
  return MEMORY[0x1F40DA5C0]();
}

uint64_t CGFontURLCreate()
{
  return MEMORY[0x1F40DA5D8]();
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1F40DA868](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1F40E9738](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1F40E9760](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1F40DA8E0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1F40DA8F0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1F40DA908](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1F40DA948](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1F40DA9B8](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1F40DAA98](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1F40E9938](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1F40E9968](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E9998](data, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1F40E99A8](provider, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x1F40E99F8](isrc);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

uint64_t CGPathApplyWithBlock2()
{
  return MEMORY[0x1F40DAFF8]();
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x1F40DB008](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x1F40DB038](path, transform, *(void *)&lineCap, *(void *)&lineJoin, lineWidth, miterLimit);
}

CGPathRef CGPathCreateCopyBySubtractingPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x1F40DB040](path, maskPath, evenOddFillRule);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB048](path, transform);
}

CGPathRef CGPathCreateCopyByUnioningPath(CGPathRef path, CGPathRef maskPath, BOOL evenOddFillRule)
{
  return (CGPathRef)MEMORY[0x1F40DB050](path, maskPath, evenOddFillRule);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1F40DB068]();
}

CFArrayRef CGPathCreateSeparateComponents(CGPathRef path, BOOL evenOddFillRule)
{
  return (CFArrayRef)MEMORY[0x1F40DB080](path, evenOddFillRule);
}

uint64_t CGPathCreateWithContinuousRoundedRect()
{
  return MEMORY[0x1F40DB090]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1F40DB0A8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0D0](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  MEMORY[0x1F40DB0F0](path);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v2;
  result.origin.CGFloat x = v1;
  return result;
}

CFTypeID CGPathGetTypeID(void)
{
  return MEMORY[0x1F40DB0F8]();
}

BOOL CGPathIsRect(CGPathRef path, CGRect *rect)
{
  return MEMORY[0x1F40DB138](path, rect);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB230]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB238]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2B8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1F40DB2E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1F40DB2F0](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

uint64_t FPFontCopyFamilyName()
{
  return MEMORY[0x1F4119BB0]();
}

uint64_t FPFontCopyMetadata()
{
  return MEMORY[0x1F4119BD8]();
}

uint64_t FPFontCopyPath()
{
  return MEMORY[0x1F4119BE8]();
}

uint64_t FPFontCopyPostScriptName()
{
  return MEMORY[0x1F4119BF0]();
}

uint64_t FPFontCreateCopyWithVariation()
{
  return MEMORY[0x1F4119C18]();
}

uint64_t FPFontCreateMemorySafeFontsFromData()
{
  return MEMORY[0x1F4119C38]();
}

uint64_t FPFontCreateWithData()
{
  return MEMORY[0x1F4119C50]();
}

uint64_t FPFontGetControlPoints()
{
  return MEMORY[0x1F4119C78]();
}

uint64_t FPFontGetDefaultInstance()
{
  return MEMORY[0x1F4119C80]();
}

uint64_t FPFontGetFormat()
{
  return MEMORY[0x1F4119C90]();
}

uint64_t FPFontGetGlyphIdealAdvanceWidths()
{
  return MEMORY[0x1F4119CA8]();
}

uint64_t FPFontGetOS2UnicodeRanges()
{
  return MEMORY[0x1F4119D10]();
}

uint64_t FPFontGetStrikeout()
{
  return MEMORY[0x1F4119D30]();
}

uint64_t FPFontGetTypoMetrics()
{
  return MEMORY[0x1F4119D48]();
}

uint64_t FPFontGetVariationAxisFlags()
{
  return MEMORY[0x1F4119D78]();
}

uint64_t FPFontGetVariationAxisNameID()
{
  return MEMORY[0x1F4119D80]();
}

uint64_t FPFontGetVariationScalar()
{
  return MEMORY[0x1F4119D88]();
}

uint64_t FPFontGetVariationScalars()
{
  return MEMORY[0x1F4119D90]();
}

uint64_t FPFontGetVariationValues()
{
  return MEMORY[0x1F4119D98]();
}

uint64_t FPFontGetWinMetrics()
{
  return MEMORY[0x1F4119DA0]();
}

uint64_t FPFontHasNamedInstanceWithOpticalSize()
{
  return MEMORY[0x1F4119DA8]();
}

uint64_t FPFontIsNamedInstance()
{
  return MEMORY[0x1F4119DB8]();
}

uint64_t FPFontIsSuitcase()
{
  return MEMORY[0x1F4119DC0]();
}

uint64_t FPFontPurgeCaches()
{
  return MEMORY[0x1F4119DC8]();
}

uint64_t FPFontRelease()
{
  return MEMORY[0x1F4119DD0]();
}

uint64_t FSFontCopyFontNamesForFamily()
{
  return MEMORY[0x1F4119B58]();
}

uint64_t FSFontIsHidden()
{
  return MEMORY[0x1F4119B60]();
}

uint64_t FSFontProviderRegisterFonts()
{
  return MEMORY[0x1F4119B68]();
}

uint64_t FSFontProviderRegisteredFontsInfo()
{
  return MEMORY[0x1F4119B70]();
}

uint64_t FSFontProviderRequestFonts()
{
  return MEMORY[0x1F4119B78]();
}

uint64_t FSFontProviderSynchronizeFontAsset()
{
  return MEMORY[0x1F4119B80]();
}

uint64_t FSFontProviderUnregisterFonts()
{
  return MEMORY[0x1F4119B88]();
}

uint64_t FSGetMaxSupportedFontAssetCompatibilityVersion()
{
  return MEMORY[0x1F4119B90]();
}

uint64_t GSFontCopyFamilyNames()
{
  return MEMORY[0x1F4119E00]();
}

uint64_t GSFontCopyFontFilePath()
{
  return MEMORY[0x1F4119E08]();
}

uint64_t GSFontCopyNormalizedAdditionalFontName()
{
  return MEMORY[0x1F4119E28]();
}

uint64_t GSFontGetCacheDictionary()
{
  return MEMORY[0x1F4119E40]();
}

uint64_t GSFontRegisterCGFont()
{
  return MEMORY[0x1F4119E78]();
}

uint64_t GSFontRegisterURL()
{
  return MEMORY[0x1F4119E80]();
}

uint64_t GSFontUnregisterCGFont()
{
  return MEMORY[0x1F4119EB0]();
}

uint64_t GSFontUnregisterURL()
{
  return MEMORY[0x1F4119EB8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSFreeMapTable(NSMapTable *table)
{
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1F40E7180](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t OTSVGDocumentCreate()
{
  return MEMORY[0x1F4139EC0]();
}

uint64_t OTSVGDocumentRelease()
{
  return MEMORY[0x1F4139EC8]();
}

uint64_t OTSVGGlyphRecordingCreate()
{
  return MEMORY[0x1F4139ED0]();
}

uint64_t OTSVGGlyphRecordingGetBoundingRect()
{
  return MEMORY[0x1F4139ED8]();
}

uint64_t OTSVGGlyphRecordingPlaybackRecordingsAtPositions()
{
  return MEMORY[0x1F4139EE0]();
}

uint64_t OTSVGGlyphRecordingRelease()
{
  return MEMORY[0x1F4139EE8]();
}

uint64_t OTSVGTableCreateFromData()
{
  return MEMORY[0x1F4139EF0]();
}

uint64_t OTSVGTableEnumerateGlyphs()
{
  return MEMORY[0x1F4139EF8]();
}

uint64_t OTSVGTableGetDocumentIndexForGlyph()
{
  return MEMORY[0x1F4139F00]();
}

uint64_t OTSVGTableRelease()
{
  return MEMORY[0x1F4139F08]();
}

uint64_t XTCopyAvailableFontURLs()
{
  return MEMORY[0x1F4119B98]();
}

uint64_t _AXSEnhanceTextLegibilityEnabled()
{
  return MEMORY[0x1F4178A88]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFAppVersionCheckLessThan()
{
  return MEMORY[0x1F40D8B20]();
}

uint64_t _CFCharacterSetCompact()
{
  return MEMORY[0x1F40D8CB0]();
}

uint64_t _CFExecutableLinkedOnOrAfter()
{
  return MEMORY[0x1F40D8DB8]();
}

uint64_t _CFIsDeallocating()
{
  return MEMORY[0x1F40D8E18]();
}

uint64_t _CFLocaleCopyNumberingSystemForLocaleIdentifier()
{
  return MEMORY[0x1F40D8E48]();
}

uint64_t _CFLocaleCopyPreferred()
{
  return MEMORY[0x1F40D8E50]();
}

uint64_t _CFNonObjCEqual()
{
  return MEMORY[0x1F40D8EA8]();
}

uint64_t _CFNonObjCRelease()
{
  return MEMORY[0x1F40D8EB8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1F40D90D0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1F40D90E8]();
}

uint64_t _CFStringCreateTaggedPointerString()
{
  return MEMORY[0x1F40D9138]();
}

uint64_t _CFTryRetain()
{
  return MEMORY[0x1F40D91E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1F417EC38]();
}

uint64_t std::__sort<std::__less<unsigned int,unsigned int> &,unsigned int *>()
{
  return MEMORY[0x1F417EC58]();
}

uint64_t std::__sort<std::__less<long,long> &,long *>()
{
  return MEMORY[0x1F417EC60]();
}

uint64_t std::__sort<std::__less<unsigned short,unsigned short> &,unsigned short *>()
{
  return MEMORY[0x1F417EC78]();
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1F417EF80](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void abort(void)
{
}

long double acos(long double __x)
{
  MEMORY[0x1F40CA330](__x);
  return result;
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

long double cbrt(long double __x)
{
  MEMORY[0x1F40CA688](__x);
  return result;
}

id class_createInstance(Class cls, size_t extraBytes)
{
  return (id)MEMORY[0x1F4181510](cls, extraBytes);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A0](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x1F417F0A8](*(void *)&algorithm);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1F40CBA68](key);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CBEC8]();
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1F40CC528](mhp, segname, sectname, size);
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x1F40CC630](__x, __y);
  return result;
}

size_t malloc_good_size(size_t size)
{
  return MEMORY[0x1F40CCB58](size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1F4181690](cls, bytes);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1F41816D8](obj);
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1F4181788](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void *__cdecl object_getIndexedIvars(id a1)
{
  return (void *)MEMORY[0x1F4181A68](a1);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1F40CDA00](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x1F40CDA08](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40CDA20](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1F40CDB30]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40CDB70](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

double strtod_l(const char *a1, char **a2, locale_t a3)
{
  MEMORY[0x1F40CE268](a1, a2, a3);
  return result;
}

uint64_t strtol_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1F40CE2A8](a1, a2, *(void *)&a3, a4);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

UCharDirection u_charDirection(UChar32 c)
{
  return MEMORY[0x1F417F700](*(void *)&c);
}

UChar32 u_charMirror(UChar32 c)
{
  return MEMORY[0x1F417F708](*(void *)&c);
}

int8_t u_charType(UChar32 c)
{
  return MEMORY[0x1F417F718](*(void *)&c);
}

UChar32 u_getBidiPairedBracket(UChar32 c)
{
  return MEMORY[0x1F417F738](*(void *)&c);
}

const USet *__cdecl u_getBinaryPropertySet(UProperty property, UErrorCode *pErrorCode)
{
  return (const USet *)MEMORY[0x1F417F740](*(void *)&property, pErrorCode);
}

uint8_t u_getCombiningClass(UChar32 c)
{
  return MEMORY[0x1F417F748](*(void *)&c);
}

int32_t u_getIntPropertyValue(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F760](*(void *)&c, *(void *)&which);
}

double u_getNumericValue(UChar32 c)
{
  MEMORY[0x1F417F768](*(void *)&c);
  return result;
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x1F417F780](*(void *)&c, *(void *)&which);
}

UBool u_isMirrored(UChar32 c)
{
  return MEMORY[0x1F417F788](*(void *)&c);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x1F417F7A0](*(void *)&c);
}

UBool u_isWhitespace(UChar32 c)
{
  return MEMORY[0x1F417F7A8](*(void *)&c);
}

UBool u_isbase(UChar32 c)
{
  return MEMORY[0x1F417F7C0](*(void *)&c);
}

uint64_t u_shapeArabic()
{
  return MEMORY[0x1F417F810]();
}

UChar *__cdecl u_uastrcpy(UChar *dst, const char *src)
{
  return (UChar *)MEMORY[0x1F417F8C0](dst, src);
}

uint64_t ubidi_close()
{
  return MEMORY[0x1F417F970]();
}

uint64_t ubidi_getLevels()
{
  return MEMORY[0x1F417F990]();
}

uint64_t ubidi_getParagraph()
{
  return MEMORY[0x1F417F9B0]();
}

uint64_t ubidi_open()
{
  return MEMORY[0x1F417F9D0]();
}

uint64_t ubidi_setPara()
{
  return MEMORY[0x1F417F9F8]();
}

uint64_t ubrk_close()
{
  return MEMORY[0x1F417FA30]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x1F417FA80]();
}

uint64_t ubrk_preceding()
{
  return MEMORY[0x1F417FA88]();
}

uint64_t ubrk_setUText()
{
  return MEMORY[0x1F417FAA8]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1F4180108]();
}

uint64_t uloc_getISO3Language()
{
  return MEMORY[0x1F4180178]();
}

uint64_t uloc_getKeywordValue()
{
  return MEMORY[0x1F4180188]();
}

uint64_t uloc_getScript()
{
  return MEMORY[0x1F41801A8]();
}

uint64_t ulocdata_close()
{
  return MEMORY[0x1F41801E8]();
}

uint64_t ulocdata_getDelimiter()
{
  return MEMORY[0x1F41801F8]();
}

uint64_t ulocdata_getExemplarSet()
{
  return MEMORY[0x1F4180200]();
}

uint64_t ulocdata_open()
{
  return MEMORY[0x1F4180210]();
}

uint64_t unorm2_composePair()
{
  return MEMORY[0x1F4180218]();
}

uint64_t unorm2_getDecomposition()
{
  return MEMORY[0x1F4180220]();
}

uint64_t unorm2_getNFCInstance()
{
  return MEMORY[0x1F4180230]();
}

uint64_t unorm2_getNFDInstance()
{
  return MEMORY[0x1F4180238]();
}

uint64_t unorm2_isNormalized()
{
  return MEMORY[0x1F4180250]();
}

uint64_t unorm2_normalize()
{
  return MEMORY[0x1F4180258]();
}

uint64_t uscript_getCode()
{
  return MEMORY[0x1F41805C8]();
}

uint64_t uscript_getSampleString()
{
  return MEMORY[0x1F41805D8]();
}

uint64_t uscript_getScript()
{
  return MEMORY[0x1F41805E0]();
}

uint64_t uscript_getShortName()
{
  return MEMORY[0x1F41805F0]();
}

uint64_t uscript_hasScript()
{
  return MEMORY[0x1F41805F8]();
}

uint64_t uscript_isCased()
{
  return MEMORY[0x1F4180600]();
}

uint64_t uset_add()
{
  return MEMORY[0x1F4180680]();
}

uint64_t uset_addAll()
{
  return MEMORY[0x1F4180688]();
}

uint64_t uset_applyIntPropertyValue()
{
  return MEMORY[0x1F41806A8]();
}

uint64_t uset_close()
{
  return MEMORY[0x1F41806D0]();
}

uint64_t uset_contains()
{
  return MEMORY[0x1F41806E0]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1F41806F0]();
}

uint64_t uset_getItem()
{
  return MEMORY[0x1F41806F8]();
}

uint64_t uset_getItemCount()
{
  return MEMORY[0x1F4180700]();
}

uint64_t uset_openEmpty()
{
  return MEMORY[0x1F4180718]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}

uint64_t uset_size()
{
  return MEMORY[0x1F4180740]();
}

UChar32 utext_char32At(UText *ut, int64_t nativeIndex)
{
  return MEMORY[0x1F4180778](ut, nativeIndex);
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x1F4180780](ut);
}

int64_t utext_getNativeIndex(const UText *ut)
{
  return MEMORY[0x1F4180798](ut);
}

int64_t utext_getPreviousNativeIndex(UText *ut)
{
  return MEMORY[0x1F41807A0](ut);
}

UChar32 utext_next32(UText *ut)
{
  return MEMORY[0x1F41807B8](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x1F41807C0](ut, s, length, status);
}

UChar32 utext_previous32(UText *ut)
{
  return MEMORY[0x1F41807D0](ut);
}

void utext_setNativeIndex(UText *ut, int64_t nativeIndex)
{
}

UText *__cdecl utext_setup(UText *ut, int32_t extraSpace, UErrorCode *status)
{
  return (UText *)MEMORY[0x1F41807E0](ut, *(void *)&extraSpace, status);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1F40CE8B0](__s, *(void *)&__c, __n);
}

uint64_t CEMStringIsSingleEmoji_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_CoreEmoji)) {
    dlopenHelper_CoreEmoji(a1);
  }
  return MEMORY[0x1F4113C90]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_InternationalSupport(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_MobileAsset(double a1)
{
  return a1;
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_CoreEmoji(double a1)
{
  return a1;
}

double gotLoadHelper_x8__InternationalSupportVersionNumber(double result)
{
  if (!atomic_load(&dlopenHelperFlag_InternationalSupport)) {
    return dlopenHelper_InternationalSupport(result);
  }
  return result;
}

double gotLoadHelper_x8__CEMStringIsSingleEmoji(double result)
{
  if (!atomic_load(&dlopenHelperFlag_CoreEmoji)) {
    return dlopenHelper_CoreEmoji(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___MAAsset(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___MADownloadOptions(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___MAAssetQuery(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__ASAttributeDownloadSize(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__ASDownloadPriorityHigh(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__ASDownloadOptionPriority(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__ASDownloadOptionAllowBatteryPower(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}

double gotLoadHelper_x8__OBJC_CLASS___ASAsset(double result)
{
  if (!atomic_load(&dlopenHelperFlag_MobileAsset)) {
    return dlopenHelper_MobileAsset(result);
  }
  return result;
}