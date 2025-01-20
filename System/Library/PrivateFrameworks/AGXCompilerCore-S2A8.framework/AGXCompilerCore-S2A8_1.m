uint64_t sub_22B26C064(void *a1, unint64_t *a2, unsigned int a3, uint64_t a4)
{
  const char *String;
  uint64_t v9;
  BOOL v10;
  void *v14;
  size_t v15;
  void *v16;
  size_t v17;
  BOOL v19;
  uint64_t result;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  llvm::MDString *v25;
  void *v26;
  uint64_t v27;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v35;
  int v36;
  unint64_t *v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  char v41;
  unsigned __int8 **v42;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  int v49;
  unint64_t *v50;
  void *__p[2];
  uint64_t v52;
  void v53[4];
  __int16 v54;
  uint64_t v55;
  const char *v56;
  long long v57;
  uint64_t v58;
  uint64_t v59;

  if (a4)
  {
    String = (const char *)llvm::MDString::getString(*(llvm::MDString **)(a4 - 8 * *(unsigned int *)(a4 + 8) + 8));
    if (v9 > 10)
    {
      if (v9 == 11)
      {
        if (*(void *)String == 0x747865742E726961 && *(void *)(String + 3) == 0x657275747865742ELL)
        {
          if (!a2[1]) {
            return 1;
          }
          v48 = *(void *)(a1[9] + 8 * a3);
          BYTE4(v55) = 0;
          LOBYTE(v55) = 0;
          LODWORD(v53[0]) = 0;
          LODWORD(__p[0]) = 0;
          LOWORD(v57) = 0;
          *(void *)((char *)&v57 + 4) = 0xFFFFFFFFLL;
          v58 = 0;
          if (!sub_22B243AD8(v48, v53, __p, (unsigned char *)&v57 + 1, &v57, (BOOL *)&v55 + 4, &v55)) {
            goto LABEL_28;
          }
          v49 = BYTE4(v55);
          v50 = a2;
          if (BYTE4(v55)) {
            v50 = *(unint64_t **)(**(void **)(*a2 + 16) + 16);
          }
          v59 = **(void **)(*v50 + 16);
          v39 = (*(uint64_t (**)(void *, void))(*a1 + 208))(a1, LODWORD(v53[0]));
          v40 = __p[0];
          *((_DWORD *)a1 + 571) += LODWORD(__p[0]);
          *((unsigned char *)a1 + 2384) |= v55;
          LODWORD(v56) = (unsigned __int16)v39;
          HIDWORD(v56) = v40;
          sub_22B22D934(a1 + 105, (unsigned __int16)v39, (uint64_t)&v56);
          if ((_BYTE)v57)
          {
            if (v49)
            {
              *((_DWORD *)a1 + 606) |= ~(-1 << v40) << v39;
              v41 = 1;
            }
            else
            {
              v41 = 0;
              *((_DWORD *)a1 + 606) |= 1 << v39;
            }
          }
          else
          {
            v41 = v49 != 0;
          }
          v42 = (unsigned __int8 **)(a1 + 245);
        }
        else
        {
          if (*(void *)String != 0x706D61732E726961 || *(void *)(String + 3) != 0x72656C706D61732ELL) {
            goto LABEL_28;
          }
          if (!a2[1]) {
            return 1;
          }
          v35 = *(void *)(a1[9] + 8 * a3);
          LODWORD(v53[0]) = 0;
          LODWORD(__p[0]) = 0;
          BYTE4(v55) = 0;
          if ((sub_22B243944(v35, v53, __p, (BOOL *)&v55 + 4) & 1) == 0) {
            goto LABEL_28;
          }
          v36 = BYTE4(v55);
          v37 = a2;
          if (BYTE4(v55)) {
            v37 = *(unint64_t **)(**(void **)(*a2 + 16) + 16);
          }
          v38 = *v37;
          v39 = (*(uint64_t (**)(void *, void))(*a1 + 208))(a1, LODWORD(v53[0]));
          v40 = __p[0];
          *((_DWORD *)a1 + 572) += LODWORD(__p[0]);
          *(void *)&v57 = 0;
          *((void *)&v57 + 1) = **(void **)(v38 + 16);
          LODWORD(v56) = (unsigned __int16)v39;
          HIDWORD(v56) = v40;
          sub_22B236DA4(a1 + 108, (unsigned __int16)v39, (uint64_t)&v56);
          v41 = v36 != 0;
          v42 = (unsigned __int8 **)(a1 + 251);
        }
        if (sub_22B23F17C(a1, a2, v39, v40, v41, v42)) {
          return 1;
        }
        goto LABEL_28;
      }
      if (v9 != 19)
      {
        if (v9 != 22) {
          goto LABEL_28;
        }
        v10 = *(void *)String == 0x63616E692E726961 && *((void *)String + 1) == 0x656C626973736563;
        if (!v10 || *(void *)(String + 14) != 0x7475706E695F656CLL) {
          goto LABEL_28;
        }
        llvm::UndefValue::get();
LABEL_97:
        llvm::Value::replaceAllUsesWith();
        return 1;
      }
      if (*(void *)String != 0x69646E692E726961
        || *((void *)String + 1) != 0x6675625F74636572
        || *(void *)(String + 11) != 0x7265666675625F74)
      {
        goto LABEL_28;
      }
LABEL_90:
      sub_22B23C5E8((uint64_t)a1, (uint64_t *)a2, a3, a4, 0xFFFFFFFF);
      return 1;
    }
    if (v9 != 9)
    {
      if (v9 != 10) {
        goto LABEL_28;
      }
      if (*(void *)String != 0x666675622E726961 || *((_WORD *)String + 4) != 29285) {
        goto LABEL_28;
      }
      goto LABEL_90;
    }
  }
  else
  {
    String = "air.byval";
  }
  if (*(void *)String == 0x617679622E726961 && String[8] == 108)
  {
    v30 = *a2;
    v56 = "agc.byval.";
    *((void *)&v57 + 1) = a3;
    LOWORD(v59) = 2051;
    v31 = sub_22B22A000(a1, v30, (uint64_t)&v56, a3, 0);
    v32 = (void *)((char *)a1 + *(void *)(*a1 - 24));
    LOWORD(v59) = 257;
    sub_22B1D4240(v32 + 1, **(llvm::Type ***)(*(void *)v31 + 16), v31, 0, (uint64_t)&v56);
    goto LABEL_97;
  }
LABEL_28:
  v14 = (void *)llvm::MDString::getString(*(llvm::MDString **)(a4 - 8 * *(unsigned int *)(a4 + 8) + 8));
  v16 = v14;
  v17 = v15;
  if (v15 == 11)
  {
    if (*v14 != 0x66696E752E726961 || *(void *)((char *)v14 + 3) != 0x6D726F66696E752ELL) {
      return 0;
    }
  }
  else
  {
    if (v15 != 19) {
      return 0;
    }
    v19 = *v14 == 0x616665642E726961 && v14[1] == 0x66696E755F746C75;
    if (!v19 || *(void *)((char *)v14 + 11) != 0x6D726F66696E755FLL) {
      return 0;
    }
  }
  v55 = 0;
  v22 = *(_DWORD *)(a4 + 8);
  if (v22 >= 3)
  {
    v23 = 2;
    do
    {
      v24 = v23 + 1;
      v25 = *(llvm::MDString **)(a4 - 8 * *(unsigned int *)(a4 + 8) + 8 * v23);
      if (v25 && !*(unsigned char *)v25)
      {
        v26 = (void *)llvm::MDString::getString(v25);
        if (v27 == 11)
        {
          if (*v26 != 0x646E69622E726961 || *(void *)((char *)v26 + 3) != 0x676E69646E69622ELL) {
            goto LABEL_48;
          }
          LODWORD(v56) = v23 + 1;
          if (!sub_22B2437A8(0, a4, (unsigned int *)&v56, &v55)) {
            return 0;
          }
        }
        else
        {
          if (v27 != 15) {
            goto LABEL_48;
          }
          if (*v26 != 0x666675622E726961 || *(void *)((char *)v26 + 7) != 0x657A69735F726566) {
            goto LABEL_48;
          }
          LODWORD(v56) = v23 + 1;
          if ((sub_22B2437A8(0, a4, (unsigned int *)&v56, (_DWORD *)&v55 + 1) & 1) == 0) {
            return 0;
          }
        }
        v24 = v23 + 2;
      }
LABEL_48:
      v23 = v24;
    }
    while (v24 < v22);
  }
  v45 = *a2;
  v53[0] = "agc.buffer_pointers";
  v53[2] = ".";
  v54 = 771;
  if (v16)
  {
    sub_22B1E2118(__p, v16, v17);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v52 = 0;
  }
  v56 = (const char *)v53;
  *((void *)&v57 + 1) = __p;
  LOWORD(v59) = 1026;
  v46 = sub_22B22A000(a1, v45, (uint64_t)&v56, v55, SHIDWORD(v55));
  if (SHIBYTE(v52) < 0) {
    operator delete(__p[0]);
  }
  v47 = (void *)((char *)a1 + *(void *)(*a1 - 24));
  LOWORD(v59) = 257;
  result = sub_22B1D4240(v47 + 1, **(llvm::Type ***)(*(void *)v46 + 16), v46, 0, (uint64_t)&v56);
  if (result) {
    goto LABEL_97;
  }
  return result;
}

uint64_t sub_22B26C814(uint64_t result)
{
  uint64_t v1 = *(void *)(result + *(void *)(*(void *)result - 24) + 320);
  uint64_t v2 = v1 + 24;
  uint64_t v3 = *(void *)(v1 + 32);
  if (v3 != v1 + 24)
  {
    while (1)
    {
      uint64_t v4 = v3 ? v3 - 56 : 0;
      result = llvm::GlobalValue::isDeclaration((llvm::GlobalValue *)v4);
      if ((result & 1) == 0) {
        break;
      }
LABEL_6:
      uint64_t v3 = *(void *)(v3 + 8);
      if (v3 == v2) {
        return result;
      }
    }
    if (*(_WORD *)(v4 + 18))
    {
      result = llvm::Function::BuildLazyArguments((llvm::Function *)v4);
      uint64_t v5 = *(void *)(v4 + 88);
      if (*(_WORD *)(v4 + 18))
      {
        result = llvm::Function::BuildLazyArguments((llvm::Function *)v4);
        uint64_t v6 = *(void *)(v4 + 88);
LABEL_13:
        uint64_t v7 = v6 + 40 * *(void *)(v4 + 96);
        while (v5 != v7)
        {
          unsigned int v8 = *(_DWORD *)(*(void *)v5 + 8);
          if (v8 == 15)
          {
            if ((v8 & 0xFE) == 0x12) {
              unsigned int v8 = *(_DWORD *)(**(void **)(*(void *)v5 + 16) + 8);
            }
            if (v8 <= 0xFF) {
              result = llvm::Function::addParamAttr();
            }
          }
          v5 += 40;
        }
        goto LABEL_6;
      }
    }
    else
    {
      uint64_t v5 = *(void *)(v4 + 88);
    }
    uint64_t v6 = v5;
    goto LABEL_13;
  }
  return result;
}

void sub_22B26C92C(void *a1)
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  uint64_t v1 = (char *)a1 + *(void *)(*a1 - 24);
  uint64_t v2 = *((unsigned int *)v1 + 150);
  if (v2)
  {
    uint64_t v4 = (uint64_t *)*((void *)v1 + 74);
    uint64_t v5 = &v4[v2];
    uint64_t v6 = a1 + 43;
    uint64_t v7 = (llvm::DataLayout *)(a1 + 21);
    do
    {
      uint64_t Impl = *v4;
      uint64_t v9 = *(unsigned int *)(*v4 + 8);
      if (v9 >= 3)
      {
        v10 = *(unsigned __int8 **)(Impl - 8 * v9);
        if (v10)
        {
          if (*v10 - 1 <= 1)
          {
            v11 = (llvm::GlobalObject *)*((void *)v10 + 16);
            if (v11)
            {
              if (*((unsigned char *)v11 + 16) == 3 && (*((unsigned char *)v11 + 34) & 0x40) != 0)
              {
                Sectionuint64_t Impl = (void *)llvm::GlobalObject::getSectionImpl(v11);
                if (v13 == 15
                  && *SectionImpl == 0x625F726566667562
                  && *(void *)((char *)SectionImpl + 7) == 0x73676E69646E6962)
                {
                  uint64_t v15 = *(void *)v11;
                  int v16 = *(_DWORD *)(*(void *)v11 + 8);
                  if (v16 == 15)
                  {
                    if ((v16 & 0xFE) == 0x12) {
                      int v16 = *(_DWORD *)(**(void **)(v15 + 16) + 8);
                    }
                    if ((v16 & 0xFFFFFF00) == 0x4000)
                    {
                      uint64_t v17 = **(void **)(v15 + 16);
                      unsigned int v18 = *(_DWORD *)(v17 + 8);
                      if (v18 == 15)
                      {
                        if ((v18 & 0xFE) == 0x12) {
                          unsigned int v18 = *(_DWORD *)(**(void **)(v17 + 16) + 8);
                        }
                        if ((v18 >> 8) - 1 <= 1)
                        {
                          for (uint64_t i = *((void *)v11 + 1); i; uint64_t i = *(void *)(i + 8))
                          {
                            if (*(unsigned char *)(*(void *)(i + 24) + 16) != 60) {
                              goto LABEL_33;
                            }
                          }
                          int v20 = 0;
                          int v93 = 0;
                          if (*(_DWORD *)(Impl + 8) != 4
                            || (LODWORD(v94) = 3, sub_22B2437A8(0, Impl, (unsigned int *)&v94, &v93))
                            && (int v20 = v93, v93 != -1))
                          {
                            v21 = *(llvm::Type ***)(v17 + 16);
                            v22 = *v21;
                            int v23 = *((unsigned __int8 *)*v21 + 8);
                            v24 = v23 == 16 ? *v21 : 0;
                            if (v23 != 7 && (!v24 || (*((unsigned char *)v24 + 9) & 1) != 0))
                            {
                              int v86 = v20;
                              v69 = v22;
                              int v91 = 0;
                              int v92 = 0;
                              LODWORD(v94) = 1;
                              sub_22B2437A8(0, Impl, (unsigned int *)&v94, &v92);
                              LODWORD(v94) = 2;
                              sub_22B2437A8(0, Impl, (unsigned int *)&v94, &v91);
                              if (*(unsigned char *)(*(void *)((char *)v6 + *(void *)(*a1 - 24)) + 1685)) {
                                BOOL v25 = 0;
                              }
                              else {
                                BOOL v25 = v92 == 5;
                              }
                              if (v25 && v91 < 0 && ((a1[284] >> SBYTE2(v91)) & 1) != 0)
                              {
                                unint64_t v94 = llvm::ValueAsMetadata::get();
                                long long v95 = *(_OWORD *)(Impl - 8 * *(unsigned int *)(Impl + 8) + 8);
                                llvm::ConstantInt::get();
                                uint64_t v96 = llvm::ValueAsMetadata::get();
                                uint64_t Impl = llvm::MDTuple::getImpl();
                                goto LABEL_33;
                              }
                              if (v86) {
                                goto LABEL_33;
                              }
                              unint64_t v26 = *((void *)v11 + 1);
                              if (v26)
                              {
                                v27 = 0;
                                v28 = 0;
                                v29 = 0;
                                v70 = v6;
                                do
                                {
                                  uint64_t v30 = *(void *)(v26 + 24);
                                  if (v28 >= v29)
                                  {
                                    uint64_t v31 = (v28 - v27) >> 4;
                                    unint64_t v32 = v31 + 1;
                                    if ((unint64_t)(v31 + 1) >> 60) {
LABEL_127:
                                    }
                                      abort();
                                    unint64_t v33 = v29 - v27;
                                    unint64_t v34 = (v29 - v27) >> 3;
                                    if (v34 > v32) {
                                      unint64_t v32 = v34;
                                    }
                                    BOOL v35 = v33 >= 0x7FFFFFFFFFFFFFF0;
                                    unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
                                    if (!v35) {
                                      unint64_t v36 = v32;
                                    }
                                    unint64_t v82 = v36;
                                    unint64_t v87 = v26;
                                    if (v36)
                                    {
                                      uint64_t v71 = (v28 - v27) >> 4;
                                      uint64_t v74 = *(void *)(v26 + 24);
                                      __p = v27;
                                      if (v36 >> 60) {
LABEL_128:
                                      }
                                        sub_22B1E33E4();
                                      v37 = (char *)operator new(16 * v36);
                                      v27 = __p;
                                      uint64_t v31 = v71;
                                      uint64_t v30 = v74;
                                    }
                                    else
                                    {
                                      v37 = 0;
                                    }
                                    v38 = &v37[16 * v31];
                                    *(void *)v38 = v30;
                                    *((void *)v38 + 1) = 0;
                                    if (v28 == v27)
                                    {
                                      v41 = &v37[16 * v31];
                                      unint64_t v40 = v82;
                                    }
                                    else
                                    {
                                      v39 = &v37[16 * v31];
                                      unint64_t v40 = v82;
                                      do
                                      {
                                        v41 = v39 - 16;
                                        *((_OWORD *)v39 - 1) = *((_OWORD *)v28 - 1);
                                        v28 -= 16;
                                        v39 -= 16;
                                      }
                                      while (v28 != v27);
                                    }
                                    v29 = &v37[16 * v40];
                                    v28 = v38 + 16;
                                    if (v27)
                                    {
                                      v83 = &v37[16 * v40];
                                      operator delete(v27);
                                      v29 = v83;
                                    }
                                    v27 = v41;
                                    uint64_t v6 = v70;
                                    unint64_t v26 = v87;
                                  }
                                  else
                                  {
                                    *(void *)v28 = v30;
                                    *((void *)v28 + 1) = 0;
                                    v28 += 16;
                                  }
                                  unint64_t v26 = *(void *)(v26 + 8);
                                }
                                while (v26);
                                v84 = v29;
                                if (v27 != v28)
                                {
                                  unint64_t v26 = 0;
                                  v42 = v27;
                                  v27 = v28;
                                  while (1)
                                  {
                                    uint64_t v43 = *((void *)v27 - 2);
                                    v27 -= 16;
                                    uint64_t v44 = *(void *)(v43 + 8);
                                    if (v44) {
                                      break;
                                    }
LABEL_113:
                                    if (v42 == v27) {
                                      goto LABEL_119;
                                    }
                                  }
                                  unint64_t v45 = *((void *)v27 + 1);
                                  unint64_t v65 = v45;
                                  while (2)
                                  {
                                    uint64_t v46 = *(void *)(v44 + 24);
                                    int v47 = *(unsigned __int8 *)(v46 + 16);
                                    switch(v47)
                                    {
                                      case 'M':
                                        uint64_t v67 = v44;
                                        v72 = v42;
                                        v75 = *(void **)(v44 + 24);
                                        unint64_t v88 = v26;
                                        __pa = v27;
                                        if (*(unsigned char *)(*(void *)v46 + 8) != 15
                                          || (unint64_t v94 = sub_22B1D8210(v7, v69),
                                              *(void *)&long long v95 = v48,
                                              unint64_t v66 = llvm::TypeSize::operator unsigned long long(),
                                              unint64_t v94 = sub_22B1D8210(v7, **(llvm::Type ***)(*v75 + 16)),
                                              *(void *)&long long v95 = v49,
                                              llvm::TypeSize::operator unsigned long long() > v66))
                                        {
                                          v42 = v72;
                                          if (v72) {
                                            goto LABEL_123;
                                          }
                                          goto LABEL_33;
                                        }
                                        v42 = v72;
                                        uint64_t v50 = v75[1];
                                        v27 = __pa;
                                        unint64_t v26 = v88;
                                        uint64_t v44 = v67;
                                        unint64_t v45 = v65;
                                        if (v50)
                                        {
                                          while (*(unsigned char *)(*(void *)(v50 + 24) + 16) == 60)
                                          {
                                            uint64_t v50 = *(void *)(v50 + 8);
                                            if (!v50) {
                                              goto LABEL_79;
                                            }
                                          }
                                          goto LABEL_122;
                                        }
LABEL_79:
                                        if (v26 <= v45) {
                                          unint64_t v26 = v45;
                                        }
                                        break;
                                      case '>':
                                        uint64_t v51 = *(_DWORD *)(v46 + 20) & 0x7FFFFFF;
                                        uint64_t v52 = *(void *)(v46 - 32 * v51 + 32);
                                        if (v52) {
                                          BOOL v53 = *(unsigned char *)(v52 + 16) == 16;
                                        }
                                        else {
                                          BOOL v53 = 0;
                                        }
                                        if (!v53) {
                                          goto LABEL_122;
                                        }
                                        v54 = (void *)(v52 + 24);
                                        if (*(_DWORD *)(v52 + 32) >= 0x41u) {
                                          v54 = (void *)*v54;
                                        }
                                        unint64_t v55 = *v54 + v45;
                                        if (v51 == 2)
                                        {
                                          if (v27 >= v84)
                                          {
                                            uint64_t v76 = *(void *)(v44 + 24);
                                            uint64_t v68 = v44;
                                            unint64_t v89 = v26;
                                            __pb = v27;
                                            uint64_t v56 = (v27 - v42) >> 4;
                                            unint64_t v57 = v56 + 1;
                                            if ((unint64_t)(v56 + 1) >> 60) {
                                              goto LABEL_127;
                                            }
                                            v73 = v42;
                                            if ((v84 - v42) >> 3 > v57) {
                                              unint64_t v57 = (v84 - v42) >> 3;
                                            }
                                            if ((unint64_t)(v84 - v42) >= 0x7FFFFFFFFFFFFFF0) {
                                              unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
                                            }
                                            unint64_t v85 = v57;
                                            if (v57)
                                            {
                                              if (v57 >> 60) {
                                                goto LABEL_128;
                                              }
                                              v58 = (char *)operator new(16 * v57);
                                            }
                                            else
                                            {
                                              v58 = 0;
                                            }
                                            v59 = &v58[16 * v56];
                                            *(void *)v59 = v76;
                                            *((void *)v59 + 1) = v55;
                                            if (__pb == v73)
                                            {
                                              v62 = &v58[16 * v56];
                                            }
                                            else
                                            {
                                              v60 = &v58[16 * v56];
                                              v61 = __pb;
                                              do
                                              {
                                                v62 = v60 - 16;
                                                *((_OWORD *)v60 - 1) = *((_OWORD *)v61 - 1);
                                                v61 -= 16;
                                                v60 -= 16;
                                              }
                                              while (v61 != v73);
                                            }
                                            __pc = v59 + 16;
                                            v84 = &v58[16 * v85];
                                            if (v73) {
                                              operator delete(v73);
                                            }
                                            v42 = v62;
                                            uint64_t v6 = v70;
                                            v27 = __pc;
                                            unint64_t v26 = v89;
                                            uint64_t v44 = v68;
                                            unint64_t v45 = v65;
                                          }
                                          else
                                          {
                                            *(void *)v27 = v46;
                                            *((void *)v27 + 1) = v55;
                                            v27 += 16;
                                          }
                                        }
                                        else if (v26 <= v55)
                                        {
                                          unint64_t v26 = *v54 + v45;
                                        }
                                        break;
                                      case '<':
                                        goto LABEL_79;
                                      default:
                                        goto LABEL_122;
                                    }
                                    uint64_t v44 = *(void *)(v44 + 8);
                                    if (!v44) {
                                      goto LABEL_113;
                                    }
                                    continue;
                                  }
                                }
                                unint64_t v26 = 0;
                              }
                              else
                              {
                                v27 = 0;
                              }
LABEL_119:
                              unint64_t v90 = v26;
                              __pd = v27;
                              unint64_t v63 = sub_22B1D8210(v7, v69);
                              unint64_t v94 = v63 + v63 * v90;
                              *(void *)&long long v95 = v64;
                              if ((unint64_t)llvm::TypeSize::operator unsigned long long() <= 0xFFFFFFFE)
                              {
                                unint64_t v94 = llvm::ValueAsMetadata::get();
                                long long v95 = *(_OWORD *)(Impl - 8 * *(unsigned int *)(Impl + 8) + 8);
                                llvm::ConstantInt::get();
                                uint64_t v96 = llvm::ValueAsMetadata::get();
                                uint64_t Impl = llvm::MDTuple::getImpl();
                              }
                              v42 = __pd;
LABEL_122:
                              if (v42) {
LABEL_123:
                              }
                                operator delete(v42);
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
LABEL_33:
      *v4++ = Impl;
    }
    while (v4 != v5);
  }
}

uint64_t sub_22B26D160(uint64_t result, int a2, int a3)
{
  uint64_t v5 = result;
  if ((a2 & 1) != 0 || a3)
  {
    result = llvm::Module::getOrInsertNamedMetadata();
    if (a2)
    {
      result = llvm::Module::getOrInsertNamedMetadata();
      *(unsigned char *)(v5 + 36) = 1;
    }
    if (a3)
    {
      return llvm::Module::getOrInsertNamedMetadata();
    }
  }
  return result;
}

uint64_t sub_22B26D248(uint64_t a1)
{
  if (*(char *)(a1 + 383) < 0) {
    operator delete(*(void **)(a1 + 360));
  }
  if (*(char *)(a1 + 359) < 0) {
    operator delete(*(void **)(a1 + 336));
  }
  if (*(char *)(a1 + 335) < 0) {
    operator delete(*(void **)(a1 + 312));
  }
  if (*(char *)(a1 + 311) < 0) {
    operator delete(*(void **)(a1 + 288));
  }
  uint64_t v3 = (void **)(a1 + 264);
  sub_22B26D344(&v3);
  if (*(char *)(a1 + 255) < 0) {
    operator delete(*(void **)(a1 + 232));
  }
  if (*(char *)(a1 + 223) < 0) {
    operator delete(*(void **)(a1 + 200));
  }
  if (*(char *)(a1 + 199) < 0) {
    operator delete(*(void **)(a1 + 176));
  }
  if (*(char *)(a1 + 167) < 0) {
    operator delete(*(void **)(a1 + 144));
  }
  if (*(char *)(a1 + 135) < 0) {
    operator delete(*(void **)(a1 + 112));
  }
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  return a1;
}

void sub_22B26D344(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t **sub_22B26D3D0(uint64_t **a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (uint64_t **)v5;
        unsigned int v8 = v5 + 4;
        if (!sub_22B1DF088(a2, v5 + 4)) {
          break;
        }
        uint64_t v5 = *v6;
        uint64_t v9 = v6;
        if (!*v6) {
          goto LABEL_9;
        }
      }
      if (!sub_22B1DF088(v8, a2)) {
        break;
      }
      uint64_t v9 = v6 + 1;
      uint64_t v5 = v6[1];
      if (!v5) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_9:
    v10 = (uint64_t *)v6;
    uint64_t v6 = (uint64_t **)operator new(0x40uLL);
    *((_OWORD *)v6 + 2) = *(_OWORD *)a3;
    v6[6] = *(uint64_t **)(a3 + 16);
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *((unsigned char *)v6 + 56) = 0;
    *uint64_t v6 = 0;
    v6[1] = 0;
    v6[2] = v10;
    *uint64_t v9 = (uint64_t *)v6;
    v11 = (uint64_t *)**a1;
    v12 = (uint64_t *)v6;
    if (v11)
    {
      *a1 = v11;
      v12 = *v9;
    }
    sub_22B1E313C(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v6;
}

uint64_t sub_22B26D4C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a1 + 335) < 0)
  {
    if (!*(void *)(a1 + 320)) {
      return flatbuffers::GenerateText();
    }
  }
  else if (!*(unsigned char *)(a1 + 335))
  {
    return flatbuffers::GenerateText();
  }
  std::operator+<char>();
  if (*(char *)(a3 + 23) < 0) {
    operator delete(*(void **)a3);
  }
  *(_OWORD *)a3 = v5;
  *(void *)(a3 + 16) = v6;
  return flatbuffers::GenerateText();
}

uint64_t sub_22B26D560(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v3 = *(void ****)(result + 272);
    uint64_t v2 = *(void ****)(result + 280);
    while (v3 != v2)
    {
      uint64_t v4 = *v3;
      if (*v3)
      {
        unint64_t v32 = *v3;
        sub_22B26D344(&v32);
        MEMORY[0x230F43600](v4, 0x1020C4016EE4530);
        uint64_t v2 = *(void ****)(v1 + 280);
      }
      ++v3;
    }
    uint64_t v5 = *(void *)(v1 + 1176);
    if (v5)
    {
      uint64_t v6 = *(void *)(v1 + 1184);
      uint64_t v7 = *(void **)(v1 + 1176);
      if (v6 != v5)
      {
        do
        {
          if (*(char *)(v6 - 17) < 0) {
            operator delete(*(void **)(v6 - 40));
          }
          v6 -= 72;
        }
        while (v6 != v5);
        uint64_t v7 = *(void **)(v1 + 1176);
      }
      *(void *)(v1 + 1184) = v5;
      operator delete(v7);
    }
    if (*(char *)(v1 + 1175) < 0) {
      operator delete(*(void **)(v1 + 1152));
    }
    sub_22B26D248(v1 + 728);
    sub_22B1E30E0(*(char **)(v1 + 712));
    unint64_t v32 = (void **)(v1 + 680);
    sub_22B26D344(&v32);
    sub_22B26DB08(*(char **)(v1 + 664));
    sub_22B1D3328(*(void **)(v1 + 640));
    if (*(char *)(v1 + 631) < 0) {
      operator delete(*(void **)(v1 + 608));
    }
    if (*(char *)(v1 + 607) < 0) {
      operator delete(*(void **)(v1 + 584));
    }
    sub_22B1EDBB8(*(void **)(v1 + 536));
    sub_22B1EDBB8(*(void **)(v1 + 504));
    unsigned int v8 = *(void **)(v1 + 456);
    if (v8)
    {
      *(void *)(v1 + 464) = v8;
      operator delete(v8);
    }
    uint64_t v9 = *(void **)(v1 + 432);
    if (v9)
    {
      *(void *)(v1 + 440) = v9;
      operator delete(v9);
    }
    sub_22B1EDAB0((void *)(v1 + 336));
    if (*(char *)(v1 + 335) < 0) {
      operator delete(*(void **)(v1 + 312));
    }
    v10 = *(void **)(v1 + 272);
    if (v10)
    {
      *(void *)(v1 + 280) = v10;
      operator delete(v10);
    }
    v12 = *(uint64_t **)(v1 + 248);
    v11 = *(uint64_t **)(v1 + 256);
    if (v12 != v11)
    {
      do
      {
        uint64_t v13 = *v12;
        if (*v12)
        {
          uint64_t v15 = *(uint64_t **)(v13 + 176);
          v14 = *(uint64_t **)(v13 + 184);
          if (v15 != v14)
          {
            do
            {
              uint64_t v16 = *v15;
              if (*v15)
              {
                sub_22B26DB6C(v16 + 72);
                unint64_t v32 = (void **)(v16 + 48);
                sub_22B26D344(&v32);
                if (*(char *)(v16 + 47) < 0) {
                  operator delete(*(void **)(v16 + 24));
                }
                if (*(char *)(v16 + 23) < 0) {
                  operator delete(*(void **)v16);
                }
                MEMORY[0x230F43600](v16, 0x10B2C40EE200C30);
                v14 = *(uint64_t **)(v13 + 184);
              }
              ++v15;
            }
            while (v15 != v14);
            uint64_t v15 = *(uint64_t **)(v13 + 176);
          }
          if (v15)
          {
            *(void *)(v13 + 184) = v15;
            operator delete(v15);
          }
          sub_22B1E30E0(*(char **)(v13 + 160));
          sub_22B26DB6C(v13 + 72);
          unint64_t v32 = (void **)(v13 + 48);
          sub_22B26D344(&v32);
          if (*(char *)(v13 + 47) < 0) {
            operator delete(*(void **)(v13 + 24));
          }
          if (*(char *)(v13 + 23) < 0) {
            operator delete(*(void **)v13);
          }
          MEMORY[0x230F43600](v13, 0x10B2C401A85D49FLL);
          v11 = *(uint64_t **)(v1 + 256);
        }
        ++v12;
      }
      while (v12 != v11);
      v12 = *(uint64_t **)(v1 + 248);
    }
    if (v12)
    {
      *(void *)(v1 + 256) = v12;
      operator delete(v12);
    }
    sub_22B1E30E0(*(char **)(v1 + 232));
    unsigned int v18 = *(uint64_t **)(v1 + 200);
    uint64_t v17 = *(uint64_t **)(v1 + 208);
    if (v18 != v17)
    {
      do
      {
        uint64_t v19 = *v18;
        if (*v18)
        {
          v21 = *(uint64_t **)(v19 + 208);
          int v20 = *(uint64_t **)(v19 + 216);
          if (v21 != v20)
          {
            do
            {
              uint64_t v22 = *v21;
              if (*v21)
              {
                sub_22B26DB6C(v22 + 88);
                unint64_t v32 = (void **)(v22 + 24);
                sub_22B26D344(&v32);
                if (*(char *)(v22 + 23) < 0) {
                  operator delete(*(void **)v22);
                }
                MEMORY[0x230F43600](v22, 0x10B2C4072A4B994);
                int v20 = *(uint64_t **)(v19 + 216);
              }
              ++v21;
            }
            while (v21 != v20);
            v21 = *(uint64_t **)(v19 + 208);
          }
          if (v21)
          {
            *(void *)(v19 + 216) = v21;
            operator delete(v21);
          }
          sub_22B1E30E0(*(char **)(v19 + 192));
          sub_22B26DB6C(v19 + 72);
          unint64_t v32 = (void **)(v19 + 48);
          sub_22B26D344(&v32);
          if (*(char *)(v19 + 47) < 0) {
            operator delete(*(void **)(v19 + 24));
          }
          if (*(char *)(v19 + 23) < 0) {
            operator delete(*(void **)v19);
          }
          MEMORY[0x230F43600](v19, 0x10B2C409EE52067);
          uint64_t v17 = *(uint64_t **)(v1 + 208);
        }
        ++v18;
      }
      while (v18 != v17);
      unsigned int v18 = *(uint64_t **)(v1 + 200);
    }
    if (v18)
    {
      *(void *)(v1 + 208) = v18;
      operator delete(v18);
    }
    sub_22B1E30E0(*(char **)(v1 + 184));
    v24 = *(uint64_t **)(v1 + 152);
    int v23 = *(uint64_t **)(v1 + 160);
    if (v24 != v23)
    {
      do
      {
        uint64_t v25 = *v24;
        if (*v24)
        {
          uint64_t v26 = *(void *)(v25 + 224);
          *(void *)(v25 + 224) = 0;
          if (v26)
          {
            if (*(char *)(v26 + 23) < 0) {
              operator delete(*(void **)v26);
            }
            MEMORY[0x230F43600](v26, 0x1012C40EC159624);
          }
          v28 = *(uint64_t **)(v25 + 176);
          v27 = *(uint64_t **)(v25 + 184);
          if (v28 != v27)
          {
            do
            {
              uint64_t v29 = *v28;
              if (*v28)
              {
                if (*(char *)(v29 + 207) < 0) {
                  operator delete(*(void **)(v29 + 184));
                }
                sub_22B26DB6C(v29 + 72);
                unint64_t v32 = (void **)(v29 + 48);
                sub_22B26D344(&v32);
                if (*(char *)(v29 + 47) < 0) {
                  operator delete(*(void **)(v29 + 24));
                }
                if (*(char *)(v29 + 23) < 0) {
                  operator delete(*(void **)v29);
                }
                MEMORY[0x230F43600](v29, 0x10B2C40559199D4);
                v27 = *(uint64_t **)(v25 + 184);
              }
              ++v28;
            }
            while (v28 != v27);
            v28 = *(uint64_t **)(v25 + 176);
          }
          if (v28)
          {
            *(void *)(v25 + 184) = v28;
            operator delete(v28);
          }
          sub_22B1E30E0(*(char **)(v25 + 160));
          sub_22B26DB6C(v25 + 72);
          unint64_t v32 = (void **)(v25 + 48);
          sub_22B26D344(&v32);
          if (*(char *)(v25 + 47) < 0) {
            operator delete(*(void **)(v25 + 24));
          }
          if (*(char *)(v25 + 23) < 0) {
            operator delete(*(void **)v25);
          }
          MEMORY[0x230F43600](v25, 0x10B2C4058EA06FBLL);
          int v23 = *(uint64_t **)(v1 + 160);
        }
        ++v24;
      }
      while (v24 != v23);
      v24 = *(uint64_t **)(v1 + 152);
    }
    if (v24)
    {
      *(void *)(v1 + 160) = v24;
      operator delete(v24);
    }
    sub_22B1E30E0(*(char **)(v1 + 136));
    uint64_t v31 = *(void **)(v1 + 104);
    uint64_t v30 = *(void **)(v1 + 112);
    if (v31 != v30)
    {
      do
      {
        if (*v31)
        {
          MEMORY[0x230F43600](*v31, 0x1020C4001A1C0B8);
          uint64_t v30 = *(void **)(v1 + 112);
        }
        ++v31;
      }
      while (v31 != v30);
      uint64_t v31 = *(void **)(v1 + 104);
    }
    if (v31)
    {
      *(void *)(v1 + 112) = v31;
      operator delete(v31);
    }
    sub_22B1E30E0(*(char **)(v1 + 88));
    unint64_t v32 = (void **)(v1 + 56);
    sub_22B26D344(&v32);
    if (*(char *)(v1 + 55) < 0) {
      operator delete(*(void **)(v1 + 32));
    }
    JUMPOUT(0x230F43600);
  }
  return result;
}

void sub_22B26DB08(char *a1)
{
  if (a1)
  {
    sub_22B26DB08(*(void *)a1);
    sub_22B26DB08(*((void *)a1 + 1));
    sub_22B1E30E0(*((char **)a1 + 8));
    if (a1[55] < 0) {
      operator delete(*((void **)a1 + 4));
    }
    operator delete(a1);
  }
}

uint64_t sub_22B26DB6C(uint64_t a1)
{
  uint64_t v3 = *(uint64_t **)(a1 + 24);
  uint64_t v2 = *(uint64_t **)(a1 + 32);
  if (v3 != v2)
  {
    do
    {
      uint64_t v4 = *v3;
      if (*v3)
      {
        if (*(char *)(v4 + 55) < 0) {
          operator delete(*(void **)(v4 + 32));
        }
        MEMORY[0x230F43600](v4, 0x1032C40E9BF265ALL);
        uint64_t v2 = *(uint64_t **)(a1 + 32);
      }
      ++v3;
    }
    while (v3 != v2);
    uint64_t v3 = *(uint64_t **)(a1 + 24);
  }
  if (v3)
  {
    *(void *)(a1 + 32) = v3;
    operator delete(v3);
  }
  sub_22B1E30E0(*(char **)(a1 + 8));
  return a1;
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

uint64_t LLVMAGXRuntimeMajorVersion()
{
  return MEMORY[0x270F92B20]();
}

uint64_t LLVMAGXRuntimeMinorVersion()
{
  return MEMORY[0x270F92B28]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t flatbuffers::GenerateText()
{
  return MEMORY[0x270F99B08]();
}

uint64_t flatbuffers::Parser::Deserialize(flatbuffers::Parser *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F99B10](this, a2);
}

uint64_t llvm::AllocaInst::AllocaInst()
{
  return MEMORY[0x270F92EF8]();
}

uint64_t llvm::BasicBlock::eraseFromParent(llvm::BasicBlock *this)
{
  return MEMORY[0x270F92F18](this);
}

uint64_t llvm::BasicBlock::splitBasicBlock()
{
  return MEMORY[0x270F92F20]();
}

uint64_t llvm::BasicBlock::dropAllReferences(llvm::BasicBlock *this)
{
  return MEMORY[0x270F92F28](this);
}

uint64_t llvm::BasicBlock::removePredecessor(llvm::BasicBlock *this, llvm::BasicBlock *a2)
{
  return MEMORY[0x270F92F30](this, a2);
}

uint64_t llvm::BasicBlock::BasicBlock()
{
  return MEMORY[0x270F92F38]();
}

uint64_t llvm::BranchInst::BranchInst()
{
  return MEMORY[0x270F92F48]();
}

{
  return MEMORY[0x270F92F58]();
}

uint64_t llvm::ConstantFP::get()
{
  return MEMORY[0x270F92F80]();
}

uint64_t llvm::DILocation::getImpl()
{
  return MEMORY[0x270F92F98]();
}

uint64_t llvm::DataLayout::reset()
{
  return MEMORY[0x270F92FA8]();
}

void llvm::DataLayout::~DataLayout(llvm::DataLayout *this)
{
}

void llvm::ModulePass::~ModulePass(llvm::ModulePass *this)
{
}

uint64_t llvm::ReturnInst::ReturnInst()
{
  return MEMORY[0x270F92FF8]();
}

uint64_t llvm::StructType::get()
{
  return MEMORY[0x270F93010]();
}

{
  return MEMORY[0x270F93018]();
}

uint64_t llvm::StructType::create()
{
  return MEMORY[0x270F93030]();
}

uint64_t llvm::StructType::setBody()
{
  return MEMORY[0x270F93040]();
}

uint64_t llvm::SwitchInst::addCase()
{
  return MEMORY[0x270F93050]();
}

uint64_t llvm::SwitchInst::SwitchInst()
{
  return MEMORY[0x270F93058]();
}

uint64_t llvm::UndefValue::get()
{
  return MEMORY[0x270F93088]();
}

uint64_t llvm::VectorType::get()
{
  return MEMORY[0x270F93090]();
}

uint64_t llvm::APFloatBase::IEEEdouble(llvm::APFloatBase *this)
{
  return MEMORY[0x270F930A0](this);
}

uint64_t llvm::APFloatBase::PPCDoubleDouble(llvm::APFloatBase *this)
{
  return MEMORY[0x270F930C0](this);
}

uint64_t llvm::BitCastInst::BitCastInst()
{
  return MEMORY[0x270F93190]();
}

uint64_t llvm::ConstantInt::get()
{
  return MEMORY[0x270F931A8]();
}

{
  return MEMORY[0x270F931B8]();
}

uint64_t llvm::ConstantInt::getSigned()
{
  return MEMORY[0x270F931F0]();
}

uint64_t llvm::Instruction::moveBefore()
{
  return MEMORY[0x270F93240]();
}

uint64_t llvm::Instruction::insertAfter()
{
  return MEMORY[0x270F93250]();
}

uint64_t llvm::Instruction::setMetadata()
{
  return MEMORY[0x270F93260]();
}

uint64_t llvm::Instruction::insertBefore()
{
  return MEMORY[0x270F93270]();
}

uint64_t llvm::Instruction::eraseFromParent(llvm::Instruction *this)
{
  return MEMORY[0x270F93278](this);
}

uint64_t llvm::Instruction::setFastMathFlags()
{
  return MEMORY[0x270F93288]();
}

uint64_t llvm::Instruction::setHasApproxFunc(llvm::Instruction *this)
{
  return MEMORY[0x270F93290](this);
}

uint64_t llvm::Instruction::setHasAllowReassoc(llvm::Instruction *this)
{
  return MEMORY[0x270F93298](this);
}

uint64_t llvm::Instruction::setFast(llvm::Instruction *this)
{
  return MEMORY[0x270F932C0](this);
}

uint64_t llvm::Instruction::Instruction()
{
  return MEMORY[0x270F932D0]();
}

uint64_t llvm::IntegerType::get()
{
  return MEMORY[0x270F932E0]();
}

uint64_t llvm::LLVMContext::setLLVMRemarkStreamer()
{
  return MEMORY[0x270F93300]();
}

uint64_t llvm::LLVMContext::LLVMContext(llvm::LLVMContext *this)
{
  return MEMORY[0x270F93330](this);
}

void llvm::LLVMContext::~LLVMContext(llvm::LLVMContext *this)
{
}

uint64_t llvm::NamedMDNode::addOperand()
{
  return MEMORY[0x270F93358]();
}

uint64_t llvm::NamedMDNode::eraseFromParent(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F93370](this);
}

uint64_t llvm::PointerType::get()
{
  return MEMORY[0x270F933C8]();
}

uint64_t llvm::PointerType::get(llvm::PointerType *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F933D0](this, a2);
}

uint64_t llvm::ValueMapper::mapConstant()
{
  return MEMORY[0x270F933F8]();
}

uint64_t llvm::ValueMapper::remapInstruction(llvm::ValueMapper *this, llvm::Instruction *a2)
{
  return MEMORY[0x270F93408](this, a2);
}

uint64_t llvm::ValueMapper::ValueMapper()
{
  return MEMORY[0x270F93418]();
}

void llvm::ValueMapper::~ValueMapper(llvm::ValueMapper *this)
{
}

uint64_t llvm::raw_ostream::flush_nonempty(llvm::raw_ostream *this)
{
  return MEMORY[0x270F93430](this);
}

uint64_t llvm::raw_ostream::write(llvm::raw_ostream *this, const char *a2)
{
  return MEMORY[0x270F93440](this, a2);
}

void llvm::raw_ostream::~raw_ostream(llvm::raw_ostream *this)
{
}

uint64_t llvm::ConstantExpr::getBitCast()
{
  return MEMORY[0x270F934E0]();
}

uint64_t llvm::ConstantExpr::getIntToPtr()
{
  return MEMORY[0x270F934E8]();
}

uint64_t llvm::ConstantExpr::getPtrToInt()
{
  return MEMORY[0x270F934F0]();
}

uint64_t llvm::ConstantExpr::getPointerCast()
{
  return MEMORY[0x270F93508]();
}

uint64_t llvm::ConstantExpr::getGetElementPtr()
{
  return MEMORY[0x270F93520]();
}

uint64_t llvm::FunctionType::get()
{
  return MEMORY[0x270F93588]();
}

{
  return MEMORY[0x270F93590]();
}

uint64_t llvm::GlobalObject::setSection()
{
  return MEMORY[0x270F93598]();
}

uint64_t llvm::GlobalObject::setAlignment()
{
  return MEMORY[0x270F935A8]();
}

uint64_t llvm::IntEqClasses::uncompress(llvm::IntEqClasses *this)
{
  return MEMORY[0x270F935C8](this);
}

uint64_t llvm::IntEqClasses::grow(llvm::IntEqClasses *this)
{
  return MEMORY[0x270F935D0](this);
}

uint64_t llvm::IntEqClasses::join(llvm::IntEqClasses *this)
{
  return MEMORY[0x270F935D8](this);
}

uint64_t llvm::IntEqClasses::compress(llvm::IntEqClasses *this)
{
  return MEMORY[0x270F935E0](this);
}

uint64_t llvm::MemoryBuffer::getMemBuffer()
{
  return MEMORY[0x270F935F0]();
}

uint64_t llvm::PassRegistry::getPassRegistry(llvm::PassRegistry *this)
{
  return MEMORY[0x270F93620](this);
}

uint64_t llvm::verifyModule()
{
  return MEMORY[0x270F93658]();
}

uint64_t llvm::AtomicRMWInst::AtomicRMWInst()
{
  return MEMORY[0x270F93668]();
}

uint64_t llvm::AttributeList::get()
{
  return MEMORY[0x270F93678]();
}

uint64_t llvm::ConstantArray::get()
{
  return MEMORY[0x270F93698]();
}

uint64_t llvm::GetStatistics(llvm *this)
{
  return MEMORY[0x270F936A8](this);
}

uint64_t llvm::IRBuilderBase::CreateSelect()
{
  return MEMORY[0x270F936C8]();
}

uint64_t llvm::IRBuilderBase::CreateFCmpHelper()
{
  return MEMORY[0x270F936F0]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPCast()
{
  return MEMORY[0x270F93740]();
}

uint64_t llvm::IRBuilderBase::CreateConstrainedFPBinOp()
{
  return MEMORY[0x270F93748]();
}

uint64_t llvm::StringMapImpl::RehashTable(llvm::StringMapImpl *this)
{
  return MEMORY[0x270F93788](this);
}

uint64_t llvm::StringMapImpl::LookupBucketFor()
{
  return MEMORY[0x270F93790]();
}

uint64_t llvm::StringMapImpl::RemoveKey()
{
  return MEMORY[0x270F937A0]();
}

uint64_t llvm::UnaryOperator::Create()
{
  return MEMORY[0x270F937B8]();
}

uint64_t llvm::getNamedTimer()
{
  return MEMORY[0x270F937C0]();
}

uint64_t llvm::initializeIPO(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F937C8](this, a2);
}

uint64_t llvm::BinaryOperator::Create()
{
  return MEMORY[0x270F937D8]();
}

uint64_t llvm::BinaryOperator::CreateNeg()
{
  return MEMORY[0x270F937E0]();
}

uint64_t llvm::BinaryOperator::CreateNot()
{
  return MEMORY[0x270F937E8]();
}

uint64_t llvm::ConstantStruct::get()
{
  return MEMORY[0x270F93800]();
}

uint64_t llvm::ConstantVector::get()
{
  return MEMORY[0x270F93808]();
}

uint64_t llvm::GlobalVariable::setInitializer()
{
  return MEMORY[0x270F93858]();
}

uint64_t llvm::GlobalVariable::eraseFromParent(llvm::GlobalVariable *this)
{
  return MEMORY[0x270F93860](this);
}

uint64_t llvm::GlobalVariable::copyAttributesFrom(llvm::GlobalVariable *this, const llvm::GlobalVariable *a2)
{
  return MEMORY[0x270F93878](this, a2);
}

uint64_t llvm::GlobalVariable::GlobalVariable()
{
  return MEMORY[0x270F93888]();
}

uint64_t llvm::createSROAPass(llvm *this)
{
  return MEMORY[0x270F938F0](this);
}

uint64_t llvm::initializeCore(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F93908](this, a2);
}

uint64_t llvm::FixedVectorType::get()
{
  return MEMORY[0x270F93990]();
}

void llvm::IRBuilderFolder::~IRBuilderFolder(llvm::IRBuilderFolder *this)
{
}

uint64_t llvm::InsertValueInst::init()
{
  return MEMORY[0x270F939A0]();
}

uint64_t llvm::ResetStatistics(llvm *this)
{
  return MEMORY[0x270F93B70](this);
}

void llvm::SmallVectorBase<unsigned int>::mallocForGrow()
{
  while (1)
    ;
}

void llvm::SmallVectorBase<unsigned int>::grow_pod()
{
  while (1)
    ;
}

void llvm::SmallVectorBase<unsigned long long>::grow_pod()
{
  while (1)
    ;
}

uint64_t llvm::ValueAsMetadata::get()
{
  return MEMORY[0x270F93BC8]();
}

uint64_t llvm::ValueHandleBase::AddToUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x270F93BD0](this);
}

uint64_t llvm::ValueHandleBase::RemoveFromUseList(llvm::ValueHandleBase *this)
{
  return MEMORY[0x270F93BD8](this);
}

uint64_t llvm::ValueHandleBase::AddToExistingUseList(llvm::ValueHandleBase *this, llvm::ValueHandleBase **a2)
{
  return MEMORY[0x270F93BE0](this, a2);
}

uint64_t llvm::allocate_buffer(llvm *this)
{
  return MEMORY[0x270F93BE8](this);
}

uint64_t llvm::EnableStatistics(llvm *this)
{
  return MEMORY[0x270F93BF8](this);
}

uint64_t llvm::ExtractValueInst::getIndexedType()
{
  return MEMORY[0x270F93C00]();
}

uint64_t llvm::ExtractValueInst::init()
{
  return MEMORY[0x270F93C08]();
}

uint64_t llvm::MetadataTracking::track()
{
  return MEMORY[0x270F93C30]();
}

uint64_t llvm::MetadataTracking::retrack()
{
  return MEMORY[0x270F93C38]();
}

uint64_t llvm::MetadataTracking::untrack()
{
  return MEMORY[0x270F93C40]();
}

uint64_t llvm::NamedRegionTimer::NamedRegionTimer()
{
  return MEMORY[0x270F93C48]();
}

uint64_t llvm::enableTimePasses(llvm *this)
{
  return MEMORY[0x270F93C70](this);
}

uint64_t llvm::initializeTarget(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F93C88](this, a2);
}

uint64_t llvm::parseBitcodeFile()
{
  return MEMORY[0x270F93C98]();
}

uint64_t llvm::AtomicCmpXchgInst::AtomicCmpXchgInst()
{
  return MEMORY[0x270F93CB0]();
}

uint64_t llvm::GetElementPtrInst::setIsInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x270F93CE8](this);
}

uint64_t llvm::GetElementPtrInst::getIndexedType()
{
  return MEMORY[0x270F93CF0]();
}

uint64_t llvm::GetElementPtrInst::init()
{
  return MEMORY[0x270F93D00]();
}

uint64_t llvm::InsertElementInst::InsertElementInst()
{
  return MEMORY[0x270F93D10]();
}

uint64_t llvm::ShuffleVectorInst::getShuffleMask()
{
  return MEMORY[0x270F93D28]();
}

uint64_t llvm::ShuffleVectorInst::ShuffleVectorInst()
{
  return MEMORY[0x270F93D30]();
}

uint64_t llvm::deallocate_buffer(llvm *this, void *a2)
{
  return MEMORY[0x270F93D60](this, a2);
}

uint64_t llvm::ConstantDataVector::getSplat()
{
  return MEMORY[0x270F93DA0]();
}

uint64_t llvm::ExtractElementInst::ExtractElementInst()
{
  return MEMORY[0x270F93DC0]();
}

uint64_t llvm::initializeAnalysis(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F93E38](this, a2);
}

uint64_t llvm::ConstantPointerNull::get(llvm::ConstantPointerNull *this, llvm::PointerType *a2)
{
  return MEMORY[0x270F93E58](this, a2);
}

uint64_t llvm::SmallPtrSetImplBase::insert_imp_big(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x270F93E90](this, a2);
}

uint64_t llvm::SmallPtrSetImplBase::CopyFrom(llvm::SmallPtrSetImplBase *this, const llvm::SmallPtrSetImplBase *a2)
{
  return MEMORY[0x270F93EA8](this, a2);
}

uint64_t llvm::createGlobalDCEPass(llvm *this)
{
  return MEMORY[0x270F93ED0](this);
}

uint64_t llvm::parseAssemblyString()
{
  return MEMORY[0x270F93EF8]();
}

uint64_t llvm::initializeScalarOpts(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F93F90](this, a2);
}

void llvm::SymbolTableListTraits<llvm::BasicBlock>::transferNodesFromList()
{
  while (1)
    ;
}

void llvm::SymbolTableListTraits<llvm::Instruction>::addNodeToList()
{
  while (1)
    ;
}

void llvm::SymbolTableListTraits<llvm::Function>::addNodeToList()
{
  while (1)
    ;
}

void llvm::SymbolTableListTraits<llvm::Function>::removeNodeFromList()
{
  while (1)
    ;
}

uint64_t llvm::initializeInstCombine(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F94010](this, a2);
}

uint64_t llvm::ConstantFoldTerminator()
{
  return MEMORY[0x270F94020]();
}

uint64_t llvm::initializeVectorization(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F940E0](this, a2);
}

void llvm::IRBuilderDefaultInserter::~IRBuilderDefaultInserter(llvm::IRBuilderDefaultInserter *this)
{
}

uint64_t llvm::initializeTransformUtils(llvm *this, llvm::PassRegistry *a2)
{
  return MEMORY[0x270F94130](this, a2);
}

uint64_t llvm::MergeBlockIntoPredecessor()
{
  return MEMORY[0x270F94138]();
}

uint64_t llvm::createGlobalOptimizerPass(llvm *this)
{
  return MEMORY[0x270F94148](this);
}

uint64_t llvm::TargetLibraryInfoWrapperPass::TargetLibraryInfoWrapperPass()
{
  return MEMORY[0x270F941C0]();
}

uint64_t llvm::createAlwaysInlinerLegacyPass(llvm *this)
{
  return MEMORY[0x270F941E8](this);
}

uint64_t llvm::createDeadCodeEliminationPass(llvm *this)
{
  return MEMORY[0x270F941F0](this);
}

uint64_t llvm::createInstructionCombiningPass(llvm *this)
{
  return MEMORY[0x270F94238](this);
}

uint64_t llvm::AGX::AGXCompiler::createCompilePlan()
{
  return MEMORY[0x270F94258]();
}

uint64_t llvm::AGX::AGXCompiler::getLastDiagnostics(llvm::AGX::AGXCompiler *this)
{
  return MEMORY[0x270F94260](this);
}

uint64_t llvm::AGX::AGXCompiler::create()
{
  return MEMORY[0x270F94268]();
}

uint64_t llvm::AGX::AGXCompiler::AGXCompiler()
{
  return MEMORY[0x270F94270]();
}

void llvm::AGX::AGXCompiler::~AGXCompiler(llvm::AGX::AGXCompiler *this)
{
}

uint64_t llvm::AGX::CompileReply::getDiagnostics(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x270F94280](this);
}

uint64_t llvm::AGX::CompileReply::getBinary(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x270F94288](this);
}

uint64_t llvm::AGX::CompileReply::CompileReply()
{
  return MEMORY[0x270F94290]();
}

void llvm::AGX::CompileReply::~CompileReply(llvm::AGX::CompileReply *this)
{
}

uint64_t llvm::AGX::AGXCompilePlan::execute()
{
  return MEMORY[0x270F942A0]();
}

uint64_t llvm::AGX::AGXCompilePlan::AGXCompilePlan()
{
  return MEMORY[0x270F942A8]();
}

void llvm::AGX::AGXCompilePlan::~AGXCompilePlan(llvm::AGX::AGXCompilePlan *this)
{
}

uint64_t llvm::AGX::CompileRequest::addDMAListEntry(llvm::AGX::CompileRequest *this)
{
  return MEMORY[0x270F942B8](this);
}

uint64_t llvm::AGX::CompileRequest::setLoggingStream()
{
  return MEMORY[0x270F942C0]();
}

uint64_t llvm::AGX::CompileRequest::CompileRequest()
{
  return MEMORY[0x270F942C8]();
}

void llvm::AGX::CompileRequest::~CompileRequest(llvm::AGX::CompileRequest *this)
{
}

uint64_t llvm::AGX::operator<<()
{
  return MEMORY[0x270F942D8]();
}

{
  return MEMORY[0x270F942E0]();
}

uint64_t llvm::RecursivelyDeleteTriviallyDeadInstructions()
{
  return MEMORY[0x270F94740]();
}

uint64_t llvm::Type::getFloatTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94780](this, a2);
}

uint64_t llvm::Type::getInt16Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94788](this, a2);
}

uint64_t llvm::Type::getInt32Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94790](this, a2);
}

uint64_t llvm::Type::getInt64Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94798](this, a2);
}

uint64_t llvm::Type::getInt8PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947B0](this, a2);
}

uint64_t llvm::Type::getInt32PtrTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947D0](this, a2);
}

uint64_t llvm::Type::getHalfTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947F0](this, a2);
}

uint64_t llvm::Type::getInt1Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F947F8](this, a2);
}

uint64_t llvm::Type::getInt8Ty(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94800](this, a2);
}

uint64_t llvm::Type::getVoidTy(llvm::Type *this, llvm::LLVMContext *a2)
{
  return MEMORY[0x270F94810](this, a2);
}

uint64_t llvm::User::getDescriptor(llvm::User *this)
{
  return MEMORY[0x270F94818](this);
}

uint64_t llvm::User::allocHungoffUses(llvm::User *this)
{
  return MEMORY[0x270F94820](this);
}

uint64_t llvm::User::operator new(llvm::User *this)
{
  return MEMORY[0x270F94838](this);
}

{
  return MEMORY[0x270F94840](this);
}

{
  return MEMORY[0x270F94848](this);
}

uint64_t llvm::errs(llvm *this)
{
  return MEMORY[0x270F94858](this);
}

void llvm::Regex::~Regex(llvm::Regex *this)
{
}

uint64_t llvm::Timer::clear(llvm::Timer *this)
{
  return MEMORY[0x270F94AC8](this);
}

uint64_t llvm::Timer::stopTimer(llvm::Timer *this)
{
  return MEMORY[0x270F94AD0](this);
}

uint64_t llvm::Value::replaceAllUsesWith()
{
  return MEMORY[0x270F94AF8]();
}

uint64_t llvm::Value::setName()
{
  return MEMORY[0x270F94B10]();
}

uint64_t llvm::Value::takeName()
{
  return MEMORY[0x270F94B18]();
}

uint64_t llvm::Linker::linkModules()
{
  return MEMORY[0x270F94B70]();
}

uint64_t llvm::Module::setDataLayout()
{
  return MEMORY[0x270F94BF8]();
}

uint64_t llvm::Module::eraseNamedMetadata(llvm::Module *this, llvm::NamedMDNode *a2)
{
  return MEMORY[0x270F94C40](this, a2);
}

uint64_t llvm::Module::getOrInsertFunction()
{
  return MEMORY[0x270F94C48]();
}

{
  return MEMORY[0x270F94C50]();
}

uint64_t llvm::Module::getOrInsertNamedMetadata()
{
  return MEMORY[0x270F94C70]();
}

uint64_t llvm::Module::Module()
{
  return MEMORY[0x270F94CA8]();
}

void llvm::Module::~Module(llvm::Module *this)
{
}

uint64_t llvm::Triple::Triple()
{
  return MEMORY[0x270F94CF8]();
}

uint64_t llvm::detail::IEEEFloat::IEEEFloat(llvm::detail::IEEEFloat *this, double a2)
{
  return MEMORY[0x270F94E50](this, a2);
}

void llvm::detail::IEEEFloat::~IEEEFloat(llvm::detail::IEEEFloat *this)
{
}

uint64_t llvm::legacy::PassManager::run(llvm::legacy::PassManager *this, llvm::Module *a2)
{
  return MEMORY[0x270F94E80](this, a2);
}

uint64_t llvm::legacy::PassManager::PassManager(llvm::legacy::PassManager *this)
{
  return MEMORY[0x270F94E88](this);
}

uint64_t llvm::APFloat::Storage::Storage()
{
  return MEMORY[0x270F94F18]();
}

uint64_t llvm::APFloat::convert()
{
  return MEMORY[0x270F94F20]();
}

uint64_t llvm::CmpInst::CmpInst()
{
  return MEMORY[0x270F94F28]();
}

uint64_t llvm::MDTuple::getImpl()
{
  return MEMORY[0x270F94F30]();
}

uint64_t llvm::PHINode::growOperands(llvm::PHINode *this)
{
  return MEMORY[0x270F94F40](this);
}

uint64_t llvm::parseIR()
{
  return MEMORY[0x270F94F50]();
}

uint64_t llvm::remarks::RemarkStreamer::RemarkStreamer()
{
  return MEMORY[0x270F94F58]();
}

uint64_t llvm::remarks::YAMLRemarkSerializer::YAMLRemarkSerializer()
{
  return MEMORY[0x270F94F60]();
}

uint64_t llvm::CallInst::init()
{
  return MEMORY[0x270F94F90]();
}

uint64_t llvm::CastInst::CreateFPCast()
{
  return MEMORY[0x270F94FA0]();
}

uint64_t llvm::CastInst::CreateIntegerCast()
{
  return MEMORY[0x270F94FB0]();
}

uint64_t llvm::CastInst::CreatePointerCast()
{
  return MEMORY[0x270F94FB8]();
}

uint64_t llvm::CastInst::CreateTruncOrBitCast()
{
  return MEMORY[0x270F94FD0]();
}

uint64_t llvm::CastInst::Create()
{
  return MEMORY[0x270F94FE0]();
}

uint64_t llvm::Constant::getNullValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x270F94FE8](this, a2);
}

uint64_t llvm::Constant::getAllOnesValue(llvm::Constant *this, llvm::Type *a2)
{
  return MEMORY[0x270F94FF8](this, a2);
}

uint64_t llvm::DebugLoc::DebugLoc()
{
  return MEMORY[0x270F95018]();
}

uint64_t llvm::Function::addParamAttr()
{
  return MEMORY[0x270F95030]();
}

uint64_t llvm::Function::removeFnAttr()
{
  return MEMORY[0x270F95040]();
}

uint64_t llvm::Function::setSubprogram()
{
  return MEMORY[0x270F95068]();
}

uint64_t llvm::Function::eraseFromParent(llvm::Function *this)
{
  return MEMORY[0x270F95070](this);
}

uint64_t llvm::Function::addFnAttr()
{
  return MEMORY[0x270F950A8]();
}

{
  return MEMORY[0x270F950B8]();
}

uint64_t llvm::LoadInst::LoadInst()
{
  return MEMORY[0x270F950C8]();
}

uint64_t llvm::MDString::get()
{
  return MEMORY[0x270F950D0]();
}

uint64_t llvm::ArrayType::get(llvm::ArrayType *this, llvm::Type *a2)
{
  return MEMORY[0x270F95118](this, a2);
}

uint64_t llvm::StoreInst::StoreInst()
{
  return MEMORY[0x270F95438]();
}

uint64_t llvm::BasicBlock::getFirstNonPHI(llvm::BasicBlock *this)
{
  return MEMORY[0x270F95470](this);
}

uint64_t llvm::BasicBlock::getFirstInsertionPt(llvm::BasicBlock *this)
{
  return MEMORY[0x270F95490](this);
}

uint64_t llvm::BasicBlock::getSinglePredecessor(llvm::BasicBlock *this)
{
  return MEMORY[0x270F954A0](this);
}

uint64_t llvm::BasicBlock::getModule(llvm::BasicBlock *this)
{
  return MEMORY[0x270F954B0](this);
}

uint64_t llvm::ConstantFP::isExactlyValue()
{
  return MEMORY[0x270F954B8]();
}

uint64_t llvm::DataLayout::getABITypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F954F0](this, a2);
}

uint64_t llvm::DataLayout::getStructLayout()
{
  return MEMORY[0x270F954F8]();
}

uint64_t llvm::DataLayout::getPrefTypeAlign(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F95500](this, a2);
}

uint64_t llvm::DataLayout::getABITypeAlignment(llvm::DataLayout *this, llvm::Type *a2)
{
  return MEMORY[0x270F95508](this, a2);
}

uint64_t llvm::DataLayout::getPointerAlignElem(llvm::DataLayout *this)
{
  return MEMORY[0x270F95510](this);
}

uint64_t llvm::DataLayout::getIndexedOffsetInType()
{
  return MEMORY[0x270F95528]();
}

uint64_t llvm::StructType::getTypeAtIndex()
{
  return MEMORY[0x270F95538]();
}

uint64_t llvm::GEPOperator::getSourceElementType(llvm::GEPOperator *this)
{
  return MEMORY[0x270F95550](this);
}

uint64_t llvm::GlobalValue::isDeclaration(llvm::GlobalValue *this)
{
  return MEMORY[0x270F95570](this);
}

uint64_t llvm::GlobalValue::hasExternalWeakLinkage(llvm::GlobalValue *this)
{
  return MEMORY[0x270F95598](this);
}

uint64_t llvm::Instruction::getSuccessor(llvm::Instruction *this)
{
  return MEMORY[0x270F955B0](this);
}

uint64_t llvm::Instruction::getFastMathFlags(llvm::Instruction *this)
{
  return MEMORY[0x270F955C8](this);
}

uint64_t llvm::Instruction::getNumSuccessors(llvm::Instruction *this)
{
  return MEMORY[0x270F955D0](this);
}

uint64_t llvm::Instruction::clone(llvm::Instruction *this)
{
  return MEMORY[0x270F955E8](this);
}

uint64_t llvm::NamedMDNode::getOperand(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F95628](this);
}

uint64_t llvm::NamedMDNode::getNumOperands(llvm::NamedMDNode *this)
{
  return MEMORY[0x270F95640](this);
}

uint64_t llvm::AttributeSet::addAttribute()
{
  return MEMORY[0x270F956A8]();
}

uint64_t llvm::AttributeSet::removeAttribute()
{
  return MEMORY[0x270F956B8]();
}

uint64_t llvm::DILocalScope::getNonLexicalBlockFileScope(llvm::DILocalScope *this)
{
  return MEMORY[0x270F956F0](this);
}

uint64_t llvm::GlobalObject::getSectionImpl(llvm::GlobalObject *this)
{
  return MEMORY[0x270F956F8](this);
}

uint64_t llvm::MemoryBuffer::getMemBufferRef(llvm::MemoryBuffer *this)
{
  return MEMORY[0x270F95708](this);
}

uint64_t llvm::SMDiagnostic::print(llvm::SMDiagnostic *this, const char *a2, llvm::raw_ostream *a3)
{
  return MEMORY[0x270F95728](this, a2, a3);
}

uint64_t llvm::AttributeList::getFnAttrs(llvm::AttributeList *this)
{
  return MEMORY[0x270F95740](this);
}

uint64_t llvm::AttributeList::addAttributeAtIndex()
{
  return MEMORY[0x270F95778]();
}

uint64_t llvm::AttributeList::hasFnAttr()
{
  return MEMORY[0x270F957C0]();
}

uint64_t llvm::IRBuilderBase::getCurrentDebugLocation(llvm::IRBuilderBase *this)
{
  return MEMORY[0x270F957C8](this);
}

uint64_t llvm::StringMapImpl::FindKey()
{
  return MEMORY[0x270F957D0]();
}

uint64_t llvm::TargetExtType::getLayoutType(llvm::TargetExtType *this)
{
  return MEMORY[0x270F957D8](this);
}

uint64_t llvm::GetElementPtrInst::isInBounds(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x270F95820](this);
}

uint64_t llvm::GetElementPtrInst::hasAllConstantIndices(llvm::GetElementPtrInst *this)
{
  return MEMORY[0x270F95828](this);
}

uint64_t llvm::SmallPtrSetImplBase::FindBucketFor(llvm::SmallPtrSetImplBase *this, const void *a2)
{
  return MEMORY[0x270F95860](this, a2);
}

uint64_t llvm::AGX::Diagnostic::getMessage(llvm::AGX::Diagnostic *this)
{
  return MEMORY[0x270F958A8](this);
}

uint64_t llvm::AGX::AGXCompiler::isValid(llvm::AGX::AGXCompiler *this)
{
  return MEMORY[0x270F958B0](this);
}

uint64_t llvm::AGX::CompileReply::isValid(llvm::AGX::CompileReply *this)
{
  return MEMORY[0x270F958B8](this);
}

uint64_t llvm::AGX::AGXCompilePlan::isValid(llvm::AGX::AGXCompilePlan *this)
{
  return MEMORY[0x270F958C0](this);
}

uint64_t llvm::Use::getOperandNo(llvm::Use *this)
{
  return MEMORY[0x270F958D0](this);
}

uint64_t llvm::Type::isIntegerTy(llvm::Type *this)
{
  return MEMORY[0x270F95980](this);
}

uint64_t llvm::Type::getPointerTo(llvm::Type *this)
{
  return MEMORY[0x270F95988](this);
}

uint64_t llvm::Type::isSizedDerivedType()
{
  return MEMORY[0x270F959A0]();
}

uint64_t llvm::Type::getScalarSizeInBits(llvm::Type *this)
{
  return MEMORY[0x270F959A8](this);
}

uint64_t llvm::Type::getPrimitiveSizeInBits(llvm::Type *this)
{
  return MEMORY[0x270F959B0](this);
}

uint64_t llvm::Type::print(llvm::Type *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x270F959B8](this, a2);
}

uint64_t llvm::APInt::countLeadingZerosSlowCase(llvm::APInt *this)
{
  return MEMORY[0x270F95A38](this);
}

uint64_t llvm::Twine::str(llvm::Twine *this)
{
  return MEMORY[0x270F95B40](this);
}

uint64_t llvm::Value::getContext(llvm::Value *this)
{
  return MEMORY[0x270F95B58](this);
}

uint64_t llvm::Value::getNumUses(llvm::Value *this)
{
  return MEMORY[0x270F95B60](this);
}

uint64_t llvm::Value::stripPointerCasts(llvm::Value *this)
{
  return MEMORY[0x270F95B78](this);
}

uint64_t llvm::Value::print(llvm::Value *this, llvm::raw_ostream *a2)
{
  return MEMORY[0x270F95BA0](this, a2);
}

uint64_t llvm::Value::getName(llvm::Value *this)
{
  return MEMORY[0x270F95BA8](this);
}

uint64_t llvm::Module::getFunction()
{
  return MEMORY[0x270F95BC8]();
}

uint64_t llvm::Module::getDataLayout(llvm::Module *this)
{
  return MEMORY[0x270F95BD8](this);
}

uint64_t llvm::Module::getNamedMetadata(llvm::Module *this, const llvm::Twine *a2)
{
  return MEMORY[0x270F95BF8](this, a2);
}

uint64_t llvm::Module::getGlobalVariable()
{
  return MEMORY[0x270F95C10]();
}

uint64_t llvm::Module::print()
{
  return MEMORY[0x270F95C18]();
}

uint64_t llvm::Argument::hasNoAliasAttr(llvm::Argument *this)
{
  return MEMORY[0x270F95DC0](this);
}

uint64_t llvm::CallBase::paramHasAttr()
{
  return MEMORY[0x270F95DD0]();
}

uint64_t llvm::CallBase::hasReadingOperandBundles(llvm::CallBase *this)
{
  return MEMORY[0x270F95DE8](this);
}

uint64_t llvm::CallBase::hasFnAttrOnCalledFunction()
{
  return MEMORY[0x270F95DF0]();
}

uint64_t llvm::CallBase::getNumSubclassExtraOperandsDynamic(llvm::CallBase *this)
{
  return MEMORY[0x270F95DF8](this);
}

uint64_t llvm::Constant::isNullValue(llvm::Constant *this)
{
  return MEMORY[0x270F95E08](this);
}

uint64_t llvm::Constant::isZeroValue(llvm::Constant *this)
{
  return MEMORY[0x270F95E10](this);
}

uint64_t llvm::Constant::getAggregateElement(llvm::Constant *this)
{
  return MEMORY[0x270F95E30](this);
}

uint64_t llvm::Constant::removeDeadConstantUsers(llvm::Constant *this)
{
  return MEMORY[0x270F95E38](this);
}

uint64_t llvm::Function::getSubprogram(llvm::Function *this)
{
  return MEMORY[0x270F95E58](this);
}

uint64_t llvm::Function::getFnAttribute()
{
  return MEMORY[0x270F95E60]();
}

uint64_t llvm::Function::hasFnAttribute()
{
  return MEMORY[0x270F95E68]();
}

uint64_t llvm::Function::BuildLazyArguments(llvm::Function *this)
{
  return MEMORY[0x270F95E80](this);
}

uint64_t llvm::MDString::getString(llvm::MDString *this)
{
  return MEMORY[0x270F95E90](this);
}

uint64_t llvm::TypeSize::operator unsigned long long()
{
  return MEMORY[0x270F95EA0]();
}

uint64_t llvm::Attribute::getValueAsString(llvm::Attribute *this)
{
  return MEMORY[0x270F95EC8](this);
}

uint64_t llvm::Attribute::isStringAttribute(llvm::Attribute *this)
{
  return MEMORY[0x270F95ED0](this);
}

uint64_t llvm::StringRef::find()
{
  return MEMORY[0x270F95F48]();
}

std::string::size_type std::string::find(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x270F98230](this, __s, __pos, __n);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F98480](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

void std::string::~string(std::string *this)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x270F98880]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E30](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t analytics_send_event()
{
  return MEMORY[0x270F18A68]();
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x270ED8ED0](a1, *(void *)&a2, *(void *)&a3);
}

uint64_t createCompilerHelper()
{
  return MEMORY[0x270F49518]();
}

uint64_t deleteCompilerHelper()
{
  return MEMORY[0x270F49520]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x270EDA518](a1, a2);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB530](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA58](a1, a2, a3);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDBF20](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x270EDBF40](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_release(xpc_object_t object)
{
}