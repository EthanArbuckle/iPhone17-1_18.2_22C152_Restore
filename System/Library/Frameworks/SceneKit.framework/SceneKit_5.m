void OpenSubdiv::v3_1_1::Far::PrimvarRefiner::interpFVarFromVerts<(OpenSubdiv::v3_1_1::Sdc::SchemeType)2,OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index,OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index>(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  _DWORD *v7;
  void *v8;
  BOOL v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  float **v22;
  int *v23;
  float v24;
  uint64_t v25;
  uint64_t *v26;
  float *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  float v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _DWORD *v47;
  int v48;
  int v49;
  int v50;
  uint64_t v51;
  float v52;
  float v53;
  float v54;
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *v55;
  int v56;
  unsigned int v57;
  float FractionalWeight;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel *v69;
  int v70;
  void *v71;
  void *v72;
  uint64_t v73;
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *v74;
  BOOL v75;
  float *v76;
  unint64_t v77;
  float *v78;
  _DWORD v79[5];
  float v80;
  float *v81;
  uint64_t v82;
  void v83[2];
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89[2];
  uint64_t v90;
  int *v91;
  unsigned int v92;
  int v93;
  uint64_t v94;
  void *__p;
  uint64_t *v96;
  int v97;
  int v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x263EF8340];
  v7 = *(_DWORD **)a1;
  v8 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  v88 = *(_DWORD *)(*(void *)a1 + 4);
  v72 = v8;
  v67 = v8[1];
  v65 = v8[2];
  v69 = *(OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel **)(*(void *)(v67 + 456) + 8 * a5);
  if (*((unsigned char *)v69 + 12)) {
    v9 = 1;
  }
  else {
    v9 = *v7 == 0;
  }
  v75 = v9;
  v74 = *(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement **)(v8[60] + 8 * a5);
  v71 = *(void **)(*(void *)(v65 + 456) + 8 * a5);
  v10 = *(_DWORD *)(v67 + 20);
  v96 = &v99;
  v97 = 2 * v10;
  v98 = 32;
  v100 = 0;
  if (2 * v10 >= 0x21)
  {
    v100 = operator new(8 * v10);
    v96 = (uint64_t *)v100;
    v98 = 2 * v10;
    v10 = *(_DWORD *)(v67 + 20);
  }
  v11 = 0;
  v91 = (int *)&v94;
  v92 = v10;
  v93 = 16;
  __p = 0;
  if (v10 >= 0x11)
  {
    v11 = operator new(4 * v10);
    __p = v11;
    v91 = (int *)v11;
    v93 = v10;
  }
  v83[0] = v67;
  v83[1] = v65;
  if (*(int *)(v67 + 8) >= 1)
  {
    v12 = 0;
    while (1)
    {
      v70 = *(_DWORD *)(v72[30] + 4 * v12);
      if (v70 != -1)
      {
        v13 = *(int *)(*((void *)v69 + 12) + 4 * v12);
        v14 = (_DWORD *)(*((void *)v69 + 18) + 4 * v13);
        v15 = *(int *)(v71[12] + 4 * v70);
        v16 = (int *)(v71[18] + 4 * v15);
        v17 = *v16;
        v18 = v71[21];
        v19 = v75;
        if (*(unsigned char *)(v18 + v17)) {
          v19 = 0;
        }
        if (v19)
        {
          v20 = (v17 + *(_DWORD *)(a4 + 8));
          v76 = *(float **)a4;
          v77 = v20;
          v21 = (*(_DWORD *)(a3 + 8) + *v14);
          v81 = *(float **)a3;
          v82 = v21;
          v22 = &v76;
          v23 = (int *)&v81;
          v24 = 1.0;
        }
        else
        {
          if (*(unsigned char *)(v18 + v17))
          {
            v73 = *(unsigned __int16 *)(v71[9] + 2 * v70);
            if (*(_WORD *)(v71[9] + 2 * v70))
            {
              v45 = 0;
              v66 = *((void *)v69 + 21) + v13;
              v68 = v18 + v15;
              do
              {
                v46 = *(unsigned __int16 *)(*((void *)v74 + 5)
                                          + 2
                                          * (*(_DWORD *)(*(void *)(*((void *)v74 + 4) + 96) + 4 * v70)
                                           + (unsigned __int16)v45));
                if (v45 != v46) {
                  _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_3();
                }
                v47 = v14;
                v48 = v14[v46];
                v49 = v16[v45];
                v50 = *(_DWORD *)(a4 + 8);
                if (!v75 && (*(unsigned char *)(v68 + v45) & 8) != 0)
                {
                  OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::getVertexCreaseEndValues(v69, v12, v46, v89);
                  if ((*(unsigned char *)(v66 + v46) & 0x10) != 0)
                  {
                    if ((*(unsigned char *)(v66 + v46) & 0x20) != 0)
                    {
                      v57 = v46 == 0;
                      v55 = v74;
                      v56 = v12;
                    }
                    else
                    {
                      v55 = v74;
                      v56 = v12;
                      v57 = v46;
                    }
                    FractionalWeight = OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::getFractionalWeight(v55, v56, v57, v70);
                    v54 = FractionalWeight + (float)((float)(1.0 - FractionalWeight) * 0.75);
                    v53 = (float)(1.0 - FractionalWeight) * 0.125;
                  }
                  else
                  {
                    v53 = 0.125;
                    v54 = 0.75;
                  }
                  v59 = (*(_DWORD *)(a4 + 8) + v49);
                  v76 = *(float **)a4;
                  v77 = v59;
                  v60 = (*(_DWORD *)(a3 + 8) + v89[0]);
                  v81 = *(float **)a3;
                  v82 = v60;
                  OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v76, (uint64_t)&v81, v53);
                  v61 = (*(_DWORD *)(a4 + 8) + v49);
                  v76 = *(float **)a4;
                  v77 = v61;
                  v62 = (*(_DWORD *)(a3 + 8) + v89[1]);
                  v81 = *(float **)a3;
                  v82 = v62;
                  OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v76, (uint64_t)&v81, v53);
                  v63 = (*(_DWORD *)(a4 + 8) + v49);
                  v76 = *(float **)a4;
                  v77 = v63;
                  v64 = (*(_DWORD *)(a3 + 8) + v48);
                  v81 = *(float **)a3;
                  v82 = v64;
                  v52 = v54;
                }
                else
                {
                  v76 = *(float **)a4;
                  v77 = (v50 + v49);
                  v51 = (*(_DWORD *)(a3 + 8) + v48);
                  v81 = *(float **)a3;
                  v82 = v51;
                  v52 = 1.0;
                }
                OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v76, (uint64_t)&v81, v52);
                ++v45;
                v14 = v47;
              }
              while (v73 != v45);
            }
            goto LABEL_28;
          }
          v25 = *(int *)(*(void *)(v67 + 336) + 8 * v12);
          v80 = 0.0;
          v26 = v96;
          v27 = (float *)v96 + v25;
          v76 = &v80;
          v77 = (unint64_t)v96;
          v78 = v27;
          memset(v79, 0, 13);
          v84 = v12;
          v85 = v70;
          v86 = *(_DWORD *)(*(void *)(v83[0] + 336) + 8 * v12);
          v87 = *(_DWORD *)(*(void *)(v83[0] + 264) + 8 * v12);
          OpenSubdiv::v3_1_1::Sdc::Scheme<(OpenSubdiv::v3_1_1::Sdc::SchemeType)2>::ComputeVertexVertexMask<OpenSubdiv::v3_1_1::Vtr::internal::VertexInterface,OpenSubdiv::v3_1_1::Far::PrimvarRefiner::Mask>(&v88, (uint64_t)v83, (uint64_t)&v76, (*(unsigned __int16 *)(*(void *)(v67 + 432) + 2 * v12) >> 7) & 0xF, (*(unsigned __int16 *)(*(void *)(v65 + 432) + 2 * v70) >> 7) & 0xF);
          v28 = *v14;
          v29 = *v16;
          if (v79[2] >= 1)
          {
            if (!LOBYTE(v79[3])) {
              _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_1();
            }
            v30 = *(void *)(v67 + 264);
            v31 = *(unsigned int *)(v30 + 8 * v12);
            if ((int)v31 >= 1)
            {
              v32 = (int *)(*(void *)(v67 + 288) + 4 * *(int *)(v30 + 4 * ((2 * v12) | 1)));
              do
              {
                v33 = *v32++;
                v34 = *(int *)(v72[21] + 4 * v33);
                if (v34 == -1) {
                  _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_2();
                }
                v35 = *(_DWORD *)(v71[12] + 4 * v34);
                v36 = *(_DWORD *)(a4 + 8);
                v81 = *(float **)a4;
                v82 = (v36 + v29);
                *(void *)v89 = v81;
                v90 = (v36 + v35);
                v37 = *v27++;
                OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v81, (uint64_t)v89, v37);
                --v31;
              }
              while (v31);
            }
          }
          if (v79[1] >= 1)
          {
            v38 = v25;
            OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::getVertexEdgeValues(v69, v12, v91);
            if ((int)v25 >= 1)
            {
              v39 = 0;
              v40 = 4 * v38;
              do
              {
                v41 = (*(_DWORD *)(a4 + 8) + v29);
                v81 = *(float **)a4;
                v82 = v41;
                v42 = (*(_DWORD *)(a3 + 8) + v91[v39 / 4]);
                *(void *)v89 = *(void *)a3;
                v90 = v42;
                OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v81, (uint64_t)v89, *(float *)((char *)v26 + v39));
                v39 += 4;
              }
              while (v40 != v39);
            }
          }
          v43 = (*(_DWORD *)(a4 + 8) + v29);
          v81 = *(float **)a4;
          v82 = v43;
          v44 = (*(_DWORD *)(a3 + 8) + v28);
          *(void *)v89 = *(void *)a3;
          v90 = v44;
          v24 = v80;
          v22 = &v81;
          v23 = v89;
        }
        OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)v22, (uint64_t)v23, v24);
      }
LABEL_28:
      if (++v12 >= *(int *)(v67 + 8))
      {
        v11 = __p;
        break;
      }
    }
  }
  operator delete(v11);
  operator delete(v100);
}

void OpenSubdiv::v3_1_1::Far::PrimvarRefiner::interpFVarFromEdges<(OpenSubdiv::v3_1_1::Sdc::SchemeType)0,OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index,OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index>(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  v8 = 0;
  uint64_t v44 = *MEMORY[0x263EF8340];
  v31 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  uint64_t v32 = v31[1];
  uint64_t v9 = *(void *)(v31[60] + 8 * a5);
  v10 = *(void **)(*(void *)(v32 + 456) + 8 * a5);
  v11 = *(void **)(*(void *)(v31[2] + 456) + 8 * a5);
  uint64_t v12 = *(unsigned int *)(v32 + 16);
  v39 = &v42;
  int v40 = v12;
  int v41 = 8;
  __p = 0;
  if (v12 >= 9)
  {
    v8 = operator new(4 * v12);
    __p = v8;
    v39 = (uint64_t *)v8;
    int v41 = v12;
  }
  if (*(int *)(v32 + 4) >= 1)
  {
    v30 = v11;
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(int *)(v31[27] + 4 * v13);
      if (v14 != -1)
      {
        v15 = (int *)(v30[18] + 4 * *(int *)(v30[12] + 4 * v14));
        if (*(unsigned char *)(v30[21] + *v15))
        {
          uint64_t v21 = v30[9];
          uint64_t v22 = *(unsigned __int16 *)(v21 + 2 * v14);
          if (*(_WORD *)(v21 + 2 * v14))
          {
            uint64_t v23 = 0;
            do
            {
              uint64_t v24 = *(unsigned __int16 *)(*(void *)(v9 + 40)
                                        + 2 * (v23 + *(int *)(*(void *)(*(void *)(v9 + 32) + 96) + 4 * v14)));
              if (v23 != v24) {
                _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_2();
              }
              OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::getEdgeFaceValues(v10, v13, v24, &v37);
              int v25 = v15[v23];
              uint64_t v26 = (*((_DWORD *)a4 + 2) + v25);
              uint64_t v35 = *a4;
              uint64_t v36 = v26;
              uint64_t v27 = (*((_DWORD *)a3 + 2) + v37);
              uint64_t v33 = *a3;
              uint64_t v34 = v27;
              OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v35, (uint64_t)&v33, 0.5);
              uint64_t v28 = (*((_DWORD *)a4 + 2) + v25);
              uint64_t v35 = *a4;
              uint64_t v36 = v28;
              uint64_t v29 = (*((_DWORD *)a3 + 2) + v38);
              uint64_t v33 = *a3;
              uint64_t v34 = v29;
              OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v35, (uint64_t)&v33, 0.5);
              ++v23;
            }
            while (v22 != v23);
          }
        }
        else
        {
          OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::getEdgeFaceValues(v10, v13, 0, &v37);
          int v16 = *v15;
          uint64_t v17 = (*((_DWORD *)a4 + 2) + *v15);
          uint64_t v35 = *a4;
          uint64_t v36 = v17;
          uint64_t v18 = (*((_DWORD *)a3 + 2) + v37);
          uint64_t v33 = *a3;
          uint64_t v34 = v18;
          OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v35, (uint64_t)&v33, 0.5);
          uint64_t v19 = (*((_DWORD *)a4 + 2) + v16);
          uint64_t v35 = *a4;
          uint64_t v36 = v19;
          uint64_t v20 = (*((_DWORD *)a3 + 2) + v38);
          uint64_t v33 = *a3;
          uint64_t v34 = v20;
          OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v35, (uint64_t)&v33, 0.5);
        }
      }
      ++v13;
    }
    while (v13 < *(int *)(v32 + 4));
    v8 = __p;
  }
  operator delete(v8);
}

void OpenSubdiv::v3_1_1::Far::PrimvarRefiner::interpFVarFromVerts<(OpenSubdiv::v3_1_1::Sdc::SchemeType)0,OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index,OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index>(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  v7 = *(void **)(*(void *)(*(void *)a1 + 64) + 8 * (a2 - 1));
  uint64_t v8 = v7[2];
  v49 = v7;
  uint64_t v50 = v7[1];
  uint64_t v9 = v7[60];
  uint64_t v10 = *(void *)(v8 + 456);
  v51 = *(OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel **)(*(void *)(v50 + 456) + 8 * a5);
  if (*((unsigned char *)v51 + 12)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = **(_DWORD **)a1 == 0;
  }
  BOOL v55 = v11;
  v54 = *(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement **)(v9 + 8 * a5);
  v47 = *(void **)(v10 + 8 * a5);
  unsigned int v12 = *(_DWORD *)(v50 + 20);
  v66 = &v69;
  int v67 = 2 * v12;
  int v68 = 32;
  v70 = 0;
  if (2 * v12 >= 0x21)
  {
    v70 = operator new(8 * v12);
    v66 = (uint64_t *)v70;
    int v68 = 2 * v12;
    unsigned int v12 = *(_DWORD *)(v50 + 20);
  }
  uint64_t v13 = 0;
  v61 = &v64;
  unsigned int v62 = v12;
  int v63 = 16;
  __p = 0;
  if (v12 >= 0x11)
  {
    uint64_t v13 = operator new(4 * v12);
    __p = v13;
    v61 = (uint64_t *)v13;
    int v63 = v12;
  }
  if (*(int *)(v50 + 8) >= 1)
  {
    uint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *(int *)(v49[30] + 4 * v14);
      if (v15 != -1)
      {
        uint64_t v16 = *(int *)(*((void *)v51 + 12) + 4 * v14);
        uint64_t v17 = (_DWORD *)(*((void *)v51 + 18) + 4 * v16);
        uint64_t v18 = *(int *)(v47[12] + 4 * v15);
        uint64_t v19 = (int *)(v47[18] + 4 * v18);
        uint64_t v20 = *v19;
        uint64_t v21 = v47[21];
        BOOL v22 = v55;
        if (*(unsigned char *)(v21 + v20)) {
          BOOL v22 = 0;
        }
        if (v22)
        {
          uint64_t v23 = (v20 + *((_DWORD *)a4 + 2));
          uint64_t v58 = *a4;
          uint64_t v59 = v23;
          int v24 = *v17;
        }
        else
        {
          if (*(unsigned char *)(v21 + v20))
          {
            uint64_t v53 = *(unsigned __int16 *)(v47[9] + 2 * v15);
            if (*(_WORD *)(v47[9] + 2 * v15))
            {
              uint64_t v27 = 0;
              uint64_t v48 = *((void *)v51 + 21) + v16;
              uint64_t v52 = v21 + v18;
              do
              {
                uint64_t v28 = *(unsigned __int16 *)(*((void *)v54 + 5)
                                          + 2
                                          * (*(_DWORD *)(*(void *)(*((void *)v54 + 4) + 96) + 4 * v15)
                                           + (unsigned __int16)v27));
                if (v27 != v28) {
                  _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_3();
                }
                uint64_t v29 = v17;
                int v30 = v17[v28];
                int v31 = v19[v27];
                int v32 = *((_DWORD *)a4 + 2);
                if (!v55 && (*(unsigned char *)(v52 + v27) & 8) != 0)
                {
                  OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::getVertexCreaseEndValues(v51, v14, v28, v60);
                  if ((*(unsigned char *)(v48 + v28) & 0x10) != 0)
                  {
                    if ((*(unsigned char *)(v48 + v28) & 0x20) != 0)
                    {
                      unsigned int v39 = v28 == 0;
                      int v37 = v54;
                      int v38 = v14;
                    }
                    else
                    {
                      int v37 = v54;
                      int v38 = v14;
                      unsigned int v39 = v28;
                    }
                    float FractionalWeight = OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::getFractionalWeight(v37, v38, v39, v15);
                    float v36 = FractionalWeight + (float)((float)(1.0 - FractionalWeight) * 0.75);
                    float v35 = (float)(1.0 - FractionalWeight) * 0.125;
                  }
                  else
                  {
                    float v35 = 0.125;
                    float v36 = 0.75;
                  }
                  uint64_t v41 = (*((_DWORD *)a4 + 2) + v31);
                  uint64_t v58 = *a4;
                  uint64_t v59 = v41;
                  uint64_t v42 = (*((_DWORD *)a3 + 2) + v60[0]);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v42;
                  OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v58, (uint64_t)&v56, v35);
                  uint64_t v43 = (*((_DWORD *)a4 + 2) + v31);
                  uint64_t v58 = *a4;
                  uint64_t v59 = v43;
                  uint64_t v44 = (*((_DWORD *)a3 + 2) + v60[1]);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v44;
                  OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v58, (uint64_t)&v56, v35);
                  uint64_t v45 = (*((_DWORD *)a4 + 2) + v31);
                  uint64_t v58 = *a4;
                  uint64_t v59 = v45;
                  uint64_t v46 = (*((_DWORD *)a3 + 2) + v30);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v46;
                  float v34 = v36;
                }
                else
                {
                  uint64_t v58 = *a4;
                  uint64_t v59 = (v32 + v31);
                  uint64_t v33 = (*((_DWORD *)a3 + 2) + v30);
                  uint64_t v56 = *a3;
                  uint64_t v57 = v33;
                  float v34 = 1.0;
                }
                OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v58, (uint64_t)&v56, v34);
                ++v27;
                uint64_t v17 = v29;
              }
              while (v53 != v27);
            }
            goto LABEL_18;
          }
          int v24 = *v17;
          uint64_t v25 = (*((_DWORD *)a4 + 2) + v20);
          uint64_t v58 = *a4;
          uint64_t v59 = v25;
        }
        uint64_t v26 = (*((_DWORD *)a3 + 2) + v24);
        uint64_t v56 = *a3;
        uint64_t v57 = v26;
        OpenSubdiv::v3_1_1::Far::internal::StencilBuilder::Index::AddWithWeight((uint64_t)&v58, (uint64_t)&v56, 1.0);
      }
LABEL_18:
      if (++v14 >= *(int *)(v50 + 8))
      {
        uint64_t v13 = __p;
        break;
      }
    }
  }
  operator delete(v13);
  operator delete(v70);
}

void OpenSubdiv::v3_1_1::Far::StencilTableFactory::appendLocalPointStencilTable()
{
}

{
  __assert_rtn("appendLocalPointStencilTable", "stencilTableFactory.cpp", 312, "0");
}

uint64_t OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis(uint64_t a1)
{
  MEMORY[0x270FA5388](a1);
  signed int v5 = v4;
  int v7 = v6;
  uint64_t v179 = v8;
  uint64_t v9 = v2;
  uint64_t v10 = v1;
  uint64_t v11 = 0;
  uint64_t v223 = *MEMORY[0x263EF8340];
  do
  {
    uint64_t v12 = v1 + v11;
    *(_DWORD *)uint64_t v12 = 0;
    *(void *)(v12 + 8) = v1 + v11 + 24;
    *(void *)(v12 + 344) = 0;
    *(void *)(v12 + 16) = 0x2800000028;
    v11 += 352;
  }
  while (v11 != 1408);
  do
  {
    uint64_t v13 = v1 + v11;
    *(_DWORD *)uint64_t v13 = 0;
    *(void *)(v13 + 8) = v1 + v11 + 24;
    *(void *)(v13 + 344) = 0;
    *(void *)(v13 + 16) = 0x2800000028;
    v11 += 352;
  }
  while (v13 + 352 != v1 + 2816);
  uint64_t v14 = 2816;
  do
  {
    uint64_t v15 = v1 + v14;
    *(_DWORD *)uint64_t v15 = 0;
    *(void *)(v15 + 8) = v1 + v14 + 24;
    *(void *)(v15 + 344) = 0;
    *(void *)(v15 + 16) = 0x2800000028;
    v14 += 352;
  }
  while (v15 + 352 != v1 + 4224);
  uint64_t v16 = 4224;
  do
  {
    uint64_t v17 = v1 + v16;
    *(_DWORD *)uint64_t v17 = 0;
    *(void *)(v17 + 8) = v1 + v16 + 24;
    *(void *)(v17 + 344) = 0;
    *(void *)(v17 + 16) = 0x2800000028;
    v16 += 352;
  }
  while (v17 + 352 != v1 + 5632);
  uint64_t v18 = 5632;
  do
  {
    uint64_t v19 = v1 + v18;
    *(_DWORD *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = v1 + v18 + 24;
    *(void *)(v19 + 344) = 0;
    *(void *)(v19 + 16) = 0x2800000028;
    v18 += 352;
  }
  while (v19 + 352 != v1 + 7040);
  uint64_t v20 = *((void *)v2 + 6) + 4 * *(int *)(*((void *)v2 + 3) + 4 * ((2 * v3) | 1));
  uint64_t FaceFVarValues = v20;
  if ((v4 & 0x80000000) == 0) {
    uint64_t FaceFVarValues = OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceFVarValues(v2, v3, v4);
  }
  uint64_t v21 = 0;
  uint64_t v22 = *((int *)v9 + 5);
  do
  {
    uint64_t v23 = &(&v203)[v21];
    *uint64_t v23 = &v206[v21 * 8];
    v23[1] = 0x2800000000;
    v23[22] = 0;
    v21 += 23;
  }
  while (v21 != 92);
  BOOL v24 = v5 >= 0;
  unsigned int v25 = 2 * (v22 + v24);
  uint64_t v178 = v10;
  int v177 = v7;
  v175 = (void **)(v10 + 2816);
  uint64_t v174 = v22 + v24;
  if (v22 + v24)
  {
    if (v205 < v25)
    {
      operator delete(v207);
      v203 = v206;
      unsigned int v205 = 40;
      v207 = operator new(4 * v25);
      v203 = v207;
      unsigned int v205 = v25;
    }
    unsigned int v204 = v25;
    if (v210 < v25)
    {
      operator delete(v212);
      v208 = v211;
      unsigned int v210 = 40;
      v212 = operator new(4 * v25);
      v208 = v212;
      unsigned int v210 = v25;
    }
    unsigned int v209 = v25;
    if (v215 < v25)
    {
      operator delete(v217);
      v213 = v216;
      unsigned int v215 = 40;
      v217 = operator new(4 * v25);
      v213 = v217;
      unsigned int v215 = v25;
    }
    unsigned int v214 = v25;
    if (v220 < v25)
    {
      operator delete(v222);
      v218 = v221;
      unsigned int v220 = 40;
      v222 = operator new(4 * v25);
      v218 = v222;
      unsigned int v220 = v25;
    }
  }
  else
  {
    operator delete(v207);
    v203 = v206;
    unsigned int v204 = v25;
    unsigned int v205 = 40;
    operator delete(v212);
    v208 = v211;
    unsigned int v209 = v25;
    unsigned int v210 = 40;
    operator delete(v217);
    v213 = v216;
    unsigned int v215 = 40;
    unsigned int v214 = v25;
    operator delete(v222);
    v218 = v221;
    unsigned int v220 = 40;
  }
  uint64_t v26 = 0;
  unsigned int v219 = v25;
  unsigned int v182 = 4;
  while (v26 != 4)
  {
    *(_DWORD *)(v10 + 4 * v26 + 7040) = *(_DWORD *)(v20 + 4 * v26) + v177;
    uint64_t v27 = (unsigned __int16 *)(v179 + 6 * v26);
    int v28 = *(_DWORD *)(v20 + 4 * v26);
    uint64_t v29 = (uint64_t *)&(&v203)[23 * v26];
    if (*v27)
    {
      int v30 = OpenSubdiv::v3_1_1::Vtr::internal::Level::gatherQuadRegularPartialRingAroundVertex(v9, v28, v27, *v29, v5);
      if ((v30 & 1) == 0) {
        goto LABEL_28;
      }
    }
    else
    {
      int v30 = OpenSubdiv::v3_1_1::Vtr::internal::Level::gatherQuadRegularRingAroundVertex(v9, v28, (int *)*v29, v5);
      if ((v30 & 1) == 0)
      {
LABEL_28:
        char v31 = 0;
        if (v30 >= 0) {
          int v32 = v30;
        }
        else {
          int v32 = v30 + 1;
        }
        int v33 = v32 >> 1;
        float v34 = 6.2832 / (float)v33;
        int v35 = v33;
        goto LABEL_37;
      }
    }
    uint64_t v36 = v30 - 1;
    if ((int)v36 >= 0) {
      int v37 = v30 - 1;
    }
    else {
      int v37 = v30;
    }
    int v33 = v37 >> 1;
    int v35 = v33 + 1;
    float v34 = 3.1416 / (float)v33;
    *(_DWORD *)(*v29 + 4 * v30) = *(_DWORD *)(*v29 + 4 * v36);
    char v31 = 1;
LABEL_37:
    v192[v26] = v31;
    *((_DWORD *)&v202[357] + v26) = v33;
    *((_DWORD *)&v202[359] + v26) = v35;
    *((float *)&v202[353] + v26) = v34;
    if (v35 >= 1)
    {
      int v38 = 0;
      uint64_t v39 = 0;
      unsigned int v182 = v182 + v30 - 3;
      uint64_t v40 = *v29;
      uint64_t v41 = 2 * v35;
      while (1)
      {
        if (*(_DWORD *)(v40 + 4 * v39) == *(_DWORD *)(FaceFVarValues + 4 * ((v26 + 1) & 3)))
        {
          uint64_t v42 = v39 + 2;
          if (v41 - 2 == v39) {
            uint64_t v42 = 0;
          }
          if (*(_DWORD *)(v40 + 4 * v42) == *(_DWORD *)(FaceFVarValues + 4 * (((_BYTE)v26 - 1) & 3))) {
            break;
          }
        }
        v39 += 2;
        ++v38;
        if (v41 == v39) {
          goto LABEL_46;
        }
      }
      *((_DWORD *)&v202[355] + v26++) = v38;
      if (v39 != -2) {
        continue;
      }
    }
LABEL_46:
    OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis();
  }
  for (uint64_t i = 0; i != 176; i += 44)
  {
    uint64_t v44 = &v202[i + 177];
    *(_DWORD *)uint64_t v44 = 0;
    v44[1] = &v202[i + 180];
    v44[43] = 0;
    v44[2] = (void *)0x2800000028;
  }
  for (uint64_t j = 0; j != 176; j += 44)
  {
    uint64_t v46 = &v202[j + 1];
    *(_DWORD *)uint64_t v46 = 0;
    v46[1] = &v202[j + 4];
    v46[43] = 0;
    v46[2] = (void *)0x2800000028;
  }
  v47 = v201;
  v198 = v201;
  unsigned int v199 = v174;
  int v200 = 10;
  v202[0] = 0;
  LODWORD(v48) = v174;
  if (v174 >= 0xB)
  {
    v47 = operator new(352 * v174);
    v202[0] = v47;
    v198 = v47;
    int v200 = v174;
    LODWORD(v48) = v199;
  }
  if (v48)
  {
    uint64_t v48 = v48;
    do
    {
      *(_DWORD *)v47 = 0;
      v47[1] = v47 + 3;
      v47[43] = 0;
      v47[2] = 0x2800000028;
      v47 += 44;
      --v48;
    }
    while (v48);
  }
  unsigned int v49 = 4 * v174;
  uint64_t v50 = v196;
  v193 = v196;
  unsigned int v194 = 4 * v174;
  int v195 = 40;
  v197 = 0;
  if ((4 * v174) >= 0x29)
  {
    uint64_t v50 = operator new(352 * v49);
    v197 = v50;
    v193 = v50;
    int v195 = 4 * v174;
    unsigned int v49 = v194;
  }
  if (v49)
  {
    uint64_t v51 = v49;
    do
    {
      *(_DWORD *)uint64_t v50 = 0;
      v50[1] = v50 + 3;
      v50[43] = 0;
      v50[2] = 0x2800000028;
      v50 += 44;
      --v51;
    }
    while (v51);
  }
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  do
  {
    v187 = v52;
    int v189 = *(_DWORD *)(FaceFVarValues + 4 * v53);
    uint64_t v180 = v53;
    uint64_t v54 = *((unsigned int *)&v202[359] + v53);
    uint64_t v190 = v54;
    if ((int)v54 >= 1)
    {
      BOOL v55 = 0;
      float v56 = 1.0 / (float)((float)(int)v54 + 5.0);
      float v57 = v56 * (float)(int)v54;
      v183 = (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(352 * v54);
      v185 = (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&(&v203)[23 * v53];
      int v58 = -1;
      uint64_t v59 = 2;
      uint64_t v60 = 4;
      do
      {
        int v61 = ((int)v54 + v58) % (int)v54;
        uint64_t v62 = *(void *)v185;
        int v63 = (int *)(*(void *)v185 + v60);
        int v64 = *(v63 - 1);
        int v65 = *v63;
        if ((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v183 - 352) == v55) {
          uint64_t v66 = 0;
        }
        else {
          uint64_t v66 = v59;
        }
        int v67 = *(_DWORD *)(v62 + 4 * v66);
        int v68 = *(_DWORD *)(v62 + 8 * v61);
        int v69 = *(_DWORD *)(v62 + 8 * v61 + 4);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)((char *)v55 + (void)v198), 4u);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v55 + (void)v198), v189, v57);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v55 + (void)v198), v67, v56 + v56);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v55 + (void)v198), v64, v56 + v56);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v55 + (void)v198), v65, v56);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)&v193[(unint64_t)v55 + (void)v187], 4u);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v193[(unint64_t)v55 + (void)v187], v67, 0.33333);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v193[(unint64_t)v55 + (void)v187], v68, -0.33333);
        int v70 = v65;
        uint64_t v54 = v190;
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v193[(unint64_t)v55 + (void)v187], v70, 0.16667);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v193[(unint64_t)v55 + (void)v187], v69, -0.16667);
        BOOL v55 = (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v55 + 352);
        v60 += 8;
        ++v58;
        v59 += 2;
      }
      while (v183 != v55);
    }
    if ((*(unsigned char *)(v179 + 6 * v53 + 4) & 2) != 0)
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)(v178 + 352 * v53), v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + 352 * v53), v189, 1.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(&v202[44 * v53 + 177], v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[44 * v53 + 177], *(_DWORD *)(FaceFVarValues + 4 * v53), 0.66667);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[44 * v53 + 177], *(_DWORD *)(FaceFVarValues + 4 * (((_BYTE)v53 + 1) & 3)), 0.33333);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(&v202[44 * v53 + 1], v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[44 * v53 + 1], *(_DWORD *)(FaceFVarValues + 4 * v53), 0.66667);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[44 * v53 + 1], *(_DWORD *)(FaceFVarValues + 4 * (((_BYTE)v53 - 1) & 3)), 0.33333);
    }
    else if (v192[v53])
    {
      uint64_t v71 = (int **)&(&v203)[23 * v53];
      int v72 = **v71;
      int v73 = (*v71)[2 * (int)v54 - 1];
      v74 = (void **)(v178 + 352 * v53);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v74, v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v74, v72, 0.16667);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v74, v73, 0.16667);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v74, v189, 0.66667);
      float v75 = (float)*((int *)&v202[357] + v53);
      float v76 = *((float *)&v202[353] + v53);
      __float2 v77 = __sincosf_stret(v76);
      float v78 = 1.0 / (float)(v77.__cosval + (float)(v75 * 3.0));
      LODWORD(v74) = (*v71)[1];
      float v79 = (float)(v78 * (float)-(float)((float)((float)(v77.__cosval * 2.0) + 1.0) * sqrtf(v77.__cosval + 1.0)))
          / sqrtf(1.0 - v77.__cosval);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(&v202[44 * v53 + 177], v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[44 * v53 + 177], v72, 0.16667);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[44 * v53 + 177], v73, -0.16667);
      v80 = &v202[44 * v53 + 1];
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v80, v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v80, v189, (float)(v77.__sinval * -4.0) * v78);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v80, v72, v79);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v80, (int)v74, v77.__sinval * v78);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v80, v73, v79);
      if ((int)v190 >= 3)
      {
        unint64_t v81 = 0;
        int v82 = 1;
        do
        {
          float v83 = sinf(v76 * (float)v82);
          float v84 = v78 * (float)(v83 * 4.0);
          float v85 = v78 * (float)(v83 + sinf(v76 * (float)++v82));
          v86 = &(*v71)[v81 / 4];
          int v87 = v86[3];
          OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v80, v86[2], v84);
          OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v80, v87, v85);
          v81 += 8;
        }
        while (8 * (v190 - 1) - 8 != v81);
      }
      uint64_t v88 = *(unsigned int *)v80;
      if ((int)v88 >= 1)
      {
        v89 = (float *)((char *)v202[44 * v53 + 2] + 4);
        do
        {
          float *v89 = *v89 * 0.33333;
          v89 += 2;
          --v88;
        }
        while (v88);
      }
    }
    else
    {
      if ((int)v54 <= 0) {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis();
      }
      float v90 = *((float *)&v202[353] + v53);
      float v91 = (float)(int)v54;
      if (v54 > 0x1D)
      {
        float v95 = cosf(6.2832 / v91);
        float v94 = 1.0;
        float v92 = 1.0
            / (float)((float)((float)((float)(v95 + 5.0) + sqrtf((float)(v95 + 9.0) * (float)(v95 + 1.0))) * v91)
                    * 0.0625);
        unsigned int v93 = v182;
      }
      else
      {
        float v92 = OpenSubdiv::v3_1_1::Far::computeCoefficient(int)::efTable[v54];
        unsigned int v93 = v182;
        float v94 = 1.0;
      }
      float v96 = v94 / v91;
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)(v178 + 352 * v53), v93);
      v97 = &v202[44 * v53 + 177];
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v97, v93);
      v98 = &v202[44 * v53 + 1];
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v98, v93);
      uint64_t v99 = 0;
      uint64_t v100 = 0;
      float v101 = v92 * 0.5;
      int v102 = v54 - 1;
      do
      {
        int v103 = v102 + v100 - (v102 + (int)v100) / (int)v54 * v190;
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + 352 * v53), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v198[v99], v96);
        __float2 v104 = __sincosf_stret(v90 * (float)(int)v100);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v97, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v198[v99], v101 * v104.__cosval);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v97, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v198[352 * v103], v101 * v104.__cosval);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v98, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v198[v99], v101 * v104.__sinval);
        v105 = (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v198[352 * v103];
        LODWORD(v54) = v190;
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v98, v105, v101 * v104.__sinval);
        ++v100;
        v99 += 352;
      }
      while (v190 != v100);
    }
    ++v53;
    uint64_t v52 = (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v187 + 352 * v174);
  }
  while (v180 != 3);
  unint64_t v106 = 0;
  uint64_t v107 = 0;
  uint64_t v108 = v178;
  v109 = (char *)(v179 + 4);
  do
  {
    char v110 = *v109;
    v109 += 6;
    if ((v110 & 2) != 0)
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)(v178 + v106 + 1408), (int *)&v202[v106 / 8 + 177]);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)(v178 + v106 + 2816), (int *)&v202[v106 / 8 + 1]);
    }
    else
    {
      int v111 = *((_DWORD *)&v202[355] + v107);
      float v112 = *((float *)&v202[353] + v107);
      float v113 = v112 * (float)v111;
      float v114 = v112 * (float)((v111 + 1) % *((_DWORD *)&v202[359] + v107));
      if (v192[v107] && *((int *)&v202[357] + v107) < 2)
      {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)(v178 + v106 + 1408), v182);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 1408), *(_DWORD *)(FaceFVarValues + 4 * v107), 0.66667);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 1408), *(_DWORD *)(FaceFVarValues + 4 * (((_BYTE)v107 + 1) & 3)), 0.33333);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)(v178 + v106 + 2816), v182);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 2816), *(_DWORD *)(FaceFVarValues + 4 * v107), 0.66667);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 2816), *(_DWORD *)(FaceFVarValues + 4 * (((_BYTE)v107 - 1) & 3)), 0.33333);
      }
      else
      {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)(v178 + v106 + 1408), (int *)(v178 + v106));
        __float2 v115 = __sincosf_stret(v113);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 1408), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[v106 / 8 + 177], v115.__cosval);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 1408), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[v106 / 8 + 1], v115.__sinval);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)(v178 + v106 + 2816), (int *)(v178 + v106));
        __float2 v116 = __sincosf_stret(v114);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 2816), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[v106 / 8 + 177], v116.__cosval);
        OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + v106 + 2816), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v202[v106 / 8 + 1], v116.__sinval);
      }
    }
    ++v107;
    v106 += 352;
  }
  while (v107 != 4);
  uint64_t v117 = 0;
  uint64_t v118 = 0;
  float v119 = -2.0;
  v120 = v175;
  while (2)
  {
    uint64_t v191 = v118 + 1;
    uint64_t v121 = (v118 + 1) & 3;
    uint64_t v122 = ((_BYTE)v118 - 1) & 3;
    int v123 = *((_DWORD *)&v202[355] + v118);
    v124 = (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v193[352 * v123 + v117];
    v125 = (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v193[352
                                                                     * ((v123 + 1) % *((_DWORD *)&v202[359] + v118))
                                                                     + v117];
    float v126 = cosf(*((float *)&v202[353] + v118));
    float v127 = cosf(*((float *)&v202[353] + v122));
    float v128 = cosf(*((float *)&v202[353] + v121));
    float v129 = (float)(v126 * v119) + 3.0;
    float v130 = v129 - v128;
    float v131 = v126 + v126;
    float v132 = v129 - v127;
    if (!v192[v118])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v120 + 176, v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 352), v128 / 3.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 176), v130 / 3.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v108 + 352 * v121 + 2816), v131 / 3.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), v124, 0.33333);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v120 + 352, v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 352), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 352), v127 / 3.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 352), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v120, v132 / 3.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 352), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v108 + 352 * (((_BYTE)v118 - 1) & 3) + 1408), v131 / 3.0);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 352), v125, -0.33333);
      goto LABEL_100;
    }
    int v133 = *((_DWORD *)&v202[357] + v118);
    v134 = v120 + 176;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v120 + 176, v182);
    if (v133 < 2)
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), *(_DWORD *)(FaceFVarValues + 4 * v118), 0.44444);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), *(_DWORD *)(FaceFVarValues + 4 * (((_BYTE)v118 + 2) & 3)), 0.11111);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), *(_DWORD *)(FaceFVarValues + 4 * v121), 0.22222);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), *(_DWORD *)(FaceFVarValues + 4 * v122), 0.22222);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)v120 + 704, (int *)v120 + 352);
      uint64_t v108 = v178;
LABEL_100:
      v147 = (char *)v120;
LABEL_101:
      uint64_t v148 = v191;
      goto LABEL_102;
    }
    v135 = v125;
    v136 = (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 352);
    float v137 = v128 / 3.0;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 352), v128 / 3.0);
    float v138 = v130 / 3.0;
    v188 = (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 176);
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 - 176), v130 / 3.0);
    uint64_t v108 = v178;
    float v139 = v131 / 3.0;
    v186 = (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + 352 * v121 + 2816);
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), v186, v131 / 3.0);
    v140 = v124;
    v141 = v135;
    v184 = v140;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v120 + 176), v140, 0.33333);
    v142 = (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v120;
    v143 = v120 + 352;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v143, v182);
    float v144 = v127 / 3.0;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v136, v144);
    float v145 = v132 / 3.0;
    v176 = v142;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v142, v145);
    v146 = (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)(v178 + 352 * v122 + 1408);
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v146, v131 / 3.0);
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v141, -0.33333);
    if (v192[v122])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v134, v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v134, v136, v137);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v134, v188, v138);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v134, v186, v139);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v134, v184, 0.33333);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)v143, (int *)v134);
      v147 = (char *)v142;
      float v119 = -2.0;
      goto LABEL_101;
    }
    v149 = v141;
    v147 = (char *)v176;
    float v119 = -2.0;
    uint64_t v148 = v191;
    if (v192[v121])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v143, v182);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v136, v144);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v176, v145);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v146, v139);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v143, v149, -0.33333);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=((int *)v134, (int *)v143);
    }
LABEL_102:
    v117 += 352 * v174;
    v120 = (void **)(v147 + 352);
    uint64_t v118 = v148;
    if (v148 != 4) {
      continue;
    }
    break;
  }
  for (uint64_t k = 0; k != 4; ++k)
  {
    uint64_t v151 = *(unsigned int *)(v108 + 352 * k);
    if ((int)v151 >= 1)
    {
      v152 = *(_DWORD **)(v108 + 352 * k + 8);
      do
      {
        *v152 += v177;
        v152 += 2;
        --v151;
      }
      while (v151);
    }
    uint64_t v153 = *(unsigned int *)(v108 + 352 * k + 1408);
    if ((int)v153 >= 1)
    {
      v154 = *(_DWORD **)(v108 + 352 * k + 1416);
      do
      {
        *v154 += v177;
        v154 += 2;
        --v153;
      }
      while (v153);
    }
    uint64_t v155 = *(unsigned int *)(v108 + 352 * k + 2816);
    if ((int)v155 >= 1)
    {
      v156 = *(_DWORD **)(v108 + 352 * k + 2824);
      do
      {
        *v156 += v177;
        v156 += 2;
        --v155;
      }
      while (v155);
    }
    uint64_t v157 = *(unsigned int *)(v108 + 352 * k + 4224);
    if ((int)v157 >= 1)
    {
      v158 = *(_DWORD **)(v108 + 352 * k + 4232);
      do
      {
        *v158 += v177;
        v158 += 2;
        --v157;
      }
      while (v157);
    }
    uint64_t v159 = *(unsigned int *)(v108 + 352 * k + 5632);
    if ((int)v159 >= 1)
    {
      v160 = *(_DWORD **)(v108 + 352 * k + 5640);
      do
      {
        *v160 += v177;
        v160 += 2;
        --v159;
      }
      while (v159);
    }
  }
  if (v194)
  {
    unint64_t v161 = 0;
    uint64_t v162 = 344;
    do
    {
      v163 = &v193[v162];
      v164 = &v193[v162 - 336];
      operator delete(*(void **)&v193[v162]);
      void *v164 = v163 - 320;
      *((_DWORD *)v163 - 81) = 40;
      ++v161;
      v162 += 352;
    }
    while (v161 < v194);
  }
  operator delete(v197);
  if (v199)
  {
    unint64_t v165 = 0;
    uint64_t v166 = 344;
    do
    {
      v167 = &v198[v166];
      v168 = &v198[v166 - 336];
      operator delete(*(void **)&v198[v166]);
      void *v168 = v167 - 320;
      *((_DWORD *)v167 - 81) = 40;
      ++v165;
      v166 += 352;
    }
    while (v165 < v199);
  }
  operator delete(v202[0]);
  unint64_t v169 = 1408;
  do
  {
    operator delete(v202[v169 / 8]);
    *(void *)&v201[v169 + 3184] = &v201[v169 + 3200];
    *(_DWORD *)&v201[v169 + 3196] = 40;
    v169 -= 352;
  }
  while (v169);
  uint64_t v170 = 176;
  do
  {
    operator delete(v202[v170 + 176]);
    v202[v170 + 134] = &v202[v170 + 136];
    HIDWORD(v202[v170 + 135]) = 40;
    v170 -= 44;
  }
  while (v170 * 8);
  uint64_t v171 = 92;
  do
  {
    v172 = (char *)&(&v203)[v171];
    operator delete(v202[v171 + 360]);
    *((void *)v172 - 23) = v172 - 168;
    *((_DWORD *)v172 - 43) = 40;
    v171 -= 23;
  }
  while (v171 * 8);
  return v178;
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(void **this, unsigned int a2)
{
  *(_DWORD *)this = 0;
  if (*((_DWORD *)this + 4) < (signed int)a2)
  {
    if (a2)
    {
      if (*((_DWORD *)this + 5) < a2)
      {
        operator delete(this[43]);
        this[1] = this + 3;
        *((_DWORD *)this + 5) = 40;
        int v4 = operator new(8 * a2);
        this[43] = v4;
        this[1] = v4;
        *((_DWORD *)this + 5) = a2;
      }
    }
    else
    {
      operator delete(this[43]);
      this[1] = this + 3;
      *((_DWORD *)this + 5) = 40;
    }
    *((_DWORD *)this + 4) = a2;
  }
}

float OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight(OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *this, int a2, float result)
{
  int v3 = *(_DWORD *)this;
  if (*(int *)this < 1)
  {
LABEL_5:
    if (v3 >= *((_DWORD *)this + 4)) {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight();
    }
    uint64_t v6 = *((void *)this + 1) + 8 * v3;
    *(_DWORD *)uint64_t v6 = a2;
    *(float *)(v6 + 4) = result;
    *(_DWORD *)this = v3 + 1;
  }
  else
  {
    int v4 = (float *)(*((void *)this + 1) + 4);
    uint64_t v5 = *(unsigned int *)this;
    while (*((_DWORD *)v4 - 1) != a2)
    {
      v4 += 2;
      if (!--v5) {
        goto LABEL_5;
      }
    }
    result = *v4 + result;
    *int v4 = result;
  }
  return result;
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight(OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *this, const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *a2, float a3)
{
  if (*(int *)a2 >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight(this, *(_DWORD *)(*((void *)a2 + 1) + v6), *(float *)(*((void *)a2 + 1) + v6 + 4) * a3);
      ++v7;
      v6 += 8;
    }
    while (v7 < *(int *)a2);
  }
}

int *OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(int *a1, int *a2)
{
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)a1, a2[4]);
  int v4 = *a2;
  *a1 = *a2;
  if (v4 > a1[4]) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=();
  }
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      *(void *)(*((void *)a1 + 1) + 8 * v5) = *(void *)(*((void *)a2 + 1) + 8 * v5);
      ++v5;
    }
    while (v5 < *a1);
  }
  return a1;
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis()
{
}

{
  __assert_rtn("ProtoBasis", "gregoryBasis.cpp", 169, "cornerPatchFace[corner] != -1");
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight()
{
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=()
{
  __assert_rtn("operator=", "gregoryBasis.h", 108, "_size <= (int)_stencils.GetSize()");
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  *(void *)result = &unk_26BF6C668;
  *(void *)(result + 8) = a2;
  *(void *)(result + 16) = a3;
  int v4 = *a4;
  *(_OWORD *)(result + 120) = 0u;
  *(_DWORD *)(result + 24) = v4;
  *(_DWORD *)(result + 32) = -1;
  *(_WORD *)(result + 36) = 0;
  *(void *)(result + 104) = 0;
  *(_DWORD *)(result + 112) = 0;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 84) = 0u;
  *(_OWORD *)(result + 136) = 0u;
  *(_OWORD *)(result + 152) = 0u;
  *(_OWORD *)(result + 168) = 0u;
  *(_OWORD *)(result + 184) = 0u;
  *(_OWORD *)(result + 200) = 0u;
  *(_OWORD *)(result + 216) = 0u;
  *(_OWORD *)(result + 232) = 0u;
  *(_OWORD *)(result + 248) = 0u;
  *(_OWORD *)(result + 264) = 0u;
  *(_OWORD *)(result + 280) = 0u;
  *(_OWORD *)(result + 296) = 0u;
  *(_OWORD *)(result + 312) = 0u;
  *(_OWORD *)(result + 328) = 0u;
  *(_OWORD *)(result + 344) = 0u;
  *(_OWORD *)(result + 360) = 0u;
  *(_OWORD *)(result + 376) = 0u;
  *(_OWORD *)(result + 392) = 0u;
  *(_OWORD *)(result + 408) = 0u;
  *(_OWORD *)(result + 424) = 0u;
  *(_OWORD *)(result + 440) = 0u;
  *(_OWORD *)(result + 456) = 0u;
  *(_OWORD *)(result + 472) = 0u;
  *(_OWORD *)(result + 488) = 0u;
  if (*(void *)(a3 + 8)) {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement();
  }
  *(_DWORD *)(a3 + 12) = *(_DWORD *)(a2 + 12) + 1;
  return result;
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::~Refinement(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  *(void *)this = &unk_26BF6C668;
  int v4 = (char *)this + 480;
  v2 = (OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement **)*((void *)this + 60);
  uint64_t v3 = *((void *)v4 + 1);
  if ((int)((unint64_t)(v3 - (void)v2) >> 3) >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      if (v2[v5])
      {
        OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::~FVarRefinement(v2[v5]);
        MEMORY[0x210534FE0]();
        v2 = (OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement **)*((void *)this + 60);
        uint64_t v3 = *((void *)this + 61);
      }
      ++v5;
    }
    while (v5 < (int)((unint64_t)(v3 - (void)v2) >> 3));
  }
  if (v2)
  {
    *((void *)this + 61) = v2;
    operator delete(v2);
  }
  uint64_t v6 = (void *)*((void *)this + 57);
  if (v6)
  {
    *((void *)this + 58) = v6;
    operator delete(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 54);
  if (v7)
  {
    *((void *)this + 55) = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)*((void *)this + 51);
  if (v8)
  {
    *((void *)this + 52) = v8;
    operator delete(v8);
  }
  uint64_t v9 = (void *)*((void *)this + 48);
  if (v9)
  {
    *((void *)this + 49) = v9;
    operator delete(v9);
  }
  uint64_t v10 = (void *)*((void *)this + 45);
  if (v10)
  {
    *((void *)this + 46) = v10;
    operator delete(v10);
  }
  uint64_t v11 = (void *)*((void *)this + 42);
  if (v11)
  {
    *((void *)this + 43) = v11;
    operator delete(v11);
  }
  uint64_t v12 = (void *)*((void *)this + 39);
  if (v12)
  {
    *((void *)this + 40) = v12;
    operator delete(v12);
  }
  uint64_t v13 = (void *)*((void *)this + 36);
  if (v13)
  {
    *((void *)this + 37) = v13;
    operator delete(v13);
  }
  uint64_t v14 = (void *)*((void *)this + 33);
  if (v14)
  {
    *((void *)this + 34) = v14;
    operator delete(v14);
  }
  uint64_t v15 = (void *)*((void *)this + 30);
  if (v15)
  {
    *((void *)this + 31) = v15;
    operator delete(v15);
  }
  uint64_t v16 = (void *)*((void *)this + 27);
  if (v16)
  {
    *((void *)this + 28) = v16;
    operator delete(v16);
  }
  uint64_t v17 = (void *)*((void *)this + 24);
  if (v17)
  {
    *((void *)this + 25) = v17;
    operator delete(v17);
  }
  uint64_t v18 = (void *)*((void *)this + 21);
  if (v18)
  {
    *((void *)this + 22) = v18;
    operator delete(v18);
  }
  uint64_t v19 = (void *)*((void *)this + 18);
  if (v19)
  {
    *((void *)this + 19) = v19;
    operator delete(v19);
  }
  uint64_t v20 = (void *)*((void *)this + 15);
  if (v20)
  {
    *((void *)this + 16) = v20;
    operator delete(v20);
  }
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::initializeSparseSelectionTags(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  v2 = (int *)*((void *)this + 1);
  unint64_t v3 = *v2;
  uint64_t v4 = *((void *)this + 51);
  unint64_t v5 = *((void *)this + 52) - v4;
  if (v3 <= v5)
  {
    if (v3 < v5) {
      *((void *)this + 52) = v4 + v3;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Refinement::SparseTag>::__append((void *)this + 51, v3 - v5);
    v2 = (int *)*((void *)this + 1);
  }
  unint64_t v6 = v2[1];
  uint64_t v7 = *((void *)this + 54);
  unint64_t v8 = *((void *)this + 55) - v7;
  if (v6 <= v8)
  {
    if (v6 < v8) {
      *((void *)this + 55) = v7 + v6;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Refinement::SparseTag>::__append((void *)this + 54, v6 - v8);
    v2 = (int *)*((void *)this + 1);
  }
  unint64_t v9 = v2[2];
  uint64_t v10 = *((void *)this + 57);
  unint64_t v11 = *((void *)this + 58) - v10;
  if (v9 <= v11)
  {
    if (v9 < v11) {
      *((void *)this + 58) = v10 + v9;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Refinement::SparseTag>::__append((void *)this + 57, v9 - v11);
  }
}

void *OpenSubdiv::v3_1_1::Vtr::internal::Refinement::refine(std::vector<unsigned int> *this, char a2)
{
  std::vector<unsigned int>::pointer end = this->__end_;
  if (!end || !this->__end_cap_.__value_) {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::refine();
  }
  BYTE4(this[1].__end_) = (a2 & 1) == 0;
  BYTE5(this[1].__end_) = (a2 & 2) != 0;
  uint64_t v5 = (*((void *)end + 58) - *((void *)end + 57)) >> 3;
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateParentToChildMapping((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
  value = this->__end_cap_.__value_;
  int begin_high = HIDWORD(this[2].__begin_);
  int v8 = LODWORD(this[2].__begin_) + HIDWORD(this[1].__end_cap_.__value_);
  unsigned int *value = this[1].__end_cap_.__value_;
  value[1] = v8;
  value[2] = LODWORD(this[2].__end_) + begin_high + HIDWORD(this[2].__end_);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateChildToParentMapping(this, v9, v10);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceTagVectors((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeTagVectors((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagVectors((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
  if ((a2 & 4) != 0) {
    char v11 = 1;
  }
  else {
    char v11 = -1;
  }
  v13[0] = v11;
  if ((int)v5 < 1)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideTopology((uint64_t)this, v13);
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideEdgeSharpness((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideVertexSharpness((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
    return (void *)OpenSubdiv::v3_1_1::Vtr::internal::Refinement::reclassifySemisharpVertices((uint64_t)this);
  }
  else
  {
    v13[0] = v11 | 0x10;
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideTopology((uint64_t)this, v13);
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideEdgeSharpness((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideVertexSharpness((OpenSubdiv::v3_1_1::Vtr::internal::Refinement *)this);
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::reclassifySemisharpVertices((uint64_t)this);
    return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideFVarChannels(this);
  }
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateParentToChildMapping(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  (*(void (**)(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *))(*(void *)this + 16))(this);
  if (!*((unsigned char *)this + 36))
  {
    if (*((void *)this + 58) == *((void *)this + 57)) {
      OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateParentToChildMapping();
    }
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseVertexChildren(this);
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseEdgeChildren(this);
    (*(void (**)(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *))(*(void *)this + 24))(this);
  }

  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateParentChildIndices((uint64_t)this);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateChildToParentMapping(std::vector<unsigned int> *this, uint8x8_t a2, uint8x8_t a3)
{
  v7[1] = *MEMORY[0x263EF8340];
  a3.i32[0] = HIDWORD(v7[0]);
  a2.i32[0] = v7[0];
  int16x8_t v4 = (int16x8_t)vmovl_u8(a2);
  *(int8x8_t *)v4.i8 = vorr_s8((int8x8_t)(v4.i64[0] & 0xFFE0FFE0FFE0FFE0), (int8x8_t)0x18001000080000);
  v4.i32[0] = vmovn_s16(v4).u32[0];
  int16x8_t v5 = (int16x8_t)vmovl_u8(a3);
  *(int8x8_t *)v5.i8 = vorr_s8((int8x8_t)(v5.i64[0] & 0xFFE0FFE0FFE0FFE0), (int8x8_t)0x19001100090001);
  v4.i32[1] = vmovn_s16(v5).u32[0];
  v7[0] = v4.i64[0];
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceParentVectors(this, v7);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeParentVectors(this, v7);
  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentVectors((uint64_t)this, v7);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideTopology(uint64_t result, char *a2)
{
  uint64_t v3 = result;
  char v4 = *a2;
  if (*a2)
  {
    result = (*(uint64_t (**)(uint64_t))(*(void *)result + 32))(result);
    char v4 = *a2;
    if ((*a2 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 40))(v3);
  char v4 = *a2;
  if ((*a2 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 48))(v3);
  char v4 = *a2;
  if ((*a2 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 56))(v3);
  char v4 = *a2;
  if ((*a2 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 64))(v3);
  if ((*a2 & 0x20) != 0) {
LABEL_7:
  }
    result = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 72))(v3);
LABEL_8:
  if (*(_DWORD *)(v3 + 28)) {
    int v5 = 6;
  }
  else {
    int v5 = 4;
  }
  if (*(_DWORD *)(*(void *)(v3 + 8) + 20) > v5) {
    int v5 = *(_DWORD *)(*(void *)(v3 + 8) + 20);
  }
  *(_DWORD *)(*(void *)(v3 + 16) + 20) = v5;
  return result;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideFVarChannels(void *this)
{
  if (*(void *)(this[2] + 464) != *(void *)(this[2] + 456)) {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideFVarChannels();
  }
  if (this[61] != this[60]) {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideFVarChannels();
  }
  if ((int)((*(void *)(this[1] + 464) - *(void *)(this[1] + 456)) >> 3) >= 1) {
    operator new();
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateParentChildIndices(uint64_t this)
{
  int v1 = *(unsigned __int8 *)(this + 36);
  *(_DWORD *)(this + 64) = 0;
  v2 = *(int **)(this + 120);
  unint64_t v3 = *(void *)(this + 128) - (void)v2;
  unint64_t v4 = v3 >> 2;
  if (v1)
  {
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        v2[v5] = v5;
        ++v5;
      }
      while ((v3 >> 2) != v5);
    }
    *(_DWORD *)(this + 40) = v4;
    *(_DWORD *)(this + 68) = 0;
    uint64_t v6 = *(void *)(this + 144);
    unint64_t v7 = *(void *)(this + 152) - v6;
    unint64_t v8 = v7 >> 2;
    if ((int)(v7 >> 2) >= 1)
    {
      uint64_t v9 = 0;
      uint64_t v10 = (v7 >> 2);
      do
      {
        *(_DWORD *)(v6 + 4 * v9) = v9;
        ++v9;
      }
      while (v10 != v9);
    }
    *(_DWORD *)(this + 44) = v8;
    *(_DWORD *)(this + 72) = v8;
    char v11 = *(_DWORD **)(this + 192);
    unint64_t v12 = *(void *)(this + 200) - (void)v11;
    unint64_t v13 = v12 >> 2;
    if ((int)(v12 >> 2) >= 1)
    {
      uint64_t v14 = (v12 >> 2);
      do
      {
        *v11++ = v8;
        LODWORD(v8) = v8 + 1;
        --v14;
      }
      while (v14);
    }
    *(_DWORD *)(this + 48) = v13;
    if (*(unsigned char *)(this + 37))
    {
      *(_DWORD *)(this + 76) = 0;
      uint64_t v15 = *(void *)(this + 168);
      unint64_t v16 = *(void *)(this + 176) - v15;
      unint64_t v17 = v16 >> 2;
      if ((int)(v16 >> 2) < 1)
      {
        int v20 = 0;
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = (v16 >> 2);
        do
        {
          *(_DWORD *)(v15 + 4 * v18) = v18;
          ++v18;
        }
        while (v19 != v18);
        int v20 = *(_DWORD *)(this + 76);
      }
      *(_DWORD *)(this + 52) = v17;
      int v30 = v20 + v17;
      *(_DWORD *)(this + 80) = v30;
      char v31 = *(_DWORD **)(this + 216);
      unint64_t v32 = *(void *)(this + 224) - (void)v31;
      unint64_t v33 = v32 >> 2;
      if ((int)(v32 >> 2) >= 1)
      {
        uint64_t v34 = (v32 >> 2);
        do
        {
          *v31++ = v30++;
          --v34;
        }
        while (v34);
        int v30 = *(_DWORD *)(this + 80);
      }
      *(_DWORD *)(this + 56) = v33;
      int v35 = v30 + v33;
      *(_DWORD *)(this + 84) = v30 + v33;
      uint64_t v36 = *(_DWORD **)(this + 240);
      unint64_t v37 = *(void *)(this + 248) - (void)v36;
      unint64_t v38 = v37 >> 2;
      if ((int)(v37 >> 2) >= 1)
      {
        uint64_t v39 = (v37 >> 2);
        do
        {
          *v36++ = v35++;
          --v39;
        }
        while (v39);
      }
      *(_DWORD *)(this + 60) = v38;
    }
    else
    {
      *(_DWORD *)(this + 84) = 0;
      uint64_t v24 = *(void *)(this + 240);
      unint64_t v25 = *(void *)(this + 248) - v24;
      unint64_t v26 = v25 >> 2;
      if ((int)(v25 >> 2) < 1)
      {
        int v29 = 0;
      }
      else
      {
        uint64_t v27 = 0;
        uint64_t v28 = (v25 >> 2);
        do
        {
          *(_DWORD *)(v24 + 4 * v27) = v27;
          ++v27;
        }
        while (v28 != v27);
        int v29 = *(_DWORD *)(this + 84);
      }
      *(_DWORD *)(this + 60) = v26;
      int v63 = v29 + v26;
      *(_DWORD *)(this + 76) = v63;
      int v64 = *(_DWORD **)(this + 168);
      unint64_t v65 = *(void *)(this + 176) - (void)v64;
      unint64_t v66 = v65 >> 2;
      if ((int)(v65 >> 2) >= 1)
      {
        uint64_t v67 = (v65 >> 2);
        do
        {
          *v64++ = v63++;
          --v67;
        }
        while (v67);
        int v63 = *(_DWORD *)(this + 76);
      }
      *(_DWORD *)(this + 52) = v66;
      int v68 = v63 + v66;
      *(_DWORD *)(this + 80) = v63 + v66;
      int v69 = *(_DWORD **)(this + 216);
      unint64_t v70 = *(void *)(this + 224) - (void)v69;
      unint64_t v71 = v70 >> 2;
      if ((int)(v70 >> 2) >= 1)
      {
        uint64_t v72 = (v70 >> 2);
        do
        {
          *v69++ = v68++;
          --v72;
        }
        while (v72);
      }
      *(_DWORD *)(this + 56) = v71;
    }
  }
  else
  {
    if ((int)v4 < 1)
    {
      int v23 = 0;
    }
    else
    {
      int v21 = 0;
      uint64_t v22 = (v3 >> 2);
      do
      {
        if (*v2) {
          int v23 = v21 + 1;
        }
        else {
          int v23 = v21;
        }
        if (!*v2) {
          int v21 = -1;
        }
        *v2++ = v21;
        int v21 = v23;
        --v22;
      }
      while (v22);
    }
    *(_DWORD *)(this + 40) = v23;
    *(_DWORD *)(this + 68) = 0;
    uint64_t v40 = *(int **)(this + 144);
    unint64_t v41 = *(void *)(this + 152) - (void)v40;
    if ((int)(v41 >> 2) < 1)
    {
      int v44 = 0;
    }
    else
    {
      int v42 = 0;
      uint64_t v43 = (v41 >> 2);
      do
      {
        if (*v40) {
          int v44 = v42 + 1;
        }
        else {
          int v44 = v42;
        }
        if (!*v40) {
          int v42 = -1;
        }
        *v40++ = v42;
        int v42 = v44;
        --v43;
      }
      while (v43);
    }
    *(_DWORD *)(this + 44) = v44;
    *(_DWORD *)(this + 72) = v44;
    uint64_t v45 = *(int **)(this + 192);
    unint64_t v46 = *(void *)(this + 200) - (void)v45;
    if ((int)(v46 >> 2) < 1)
    {
      int v47 = 0;
    }
    else
    {
      int v47 = 0;
      uint64_t v48 = (v46 >> 2);
      do
      {
        int v49 = v47 + v44;
        if (*v45)
        {
          ++v47;
          int v50 = v49;
        }
        else
        {
          int v50 = -1;
        }
        *v45++ = v50;
        --v48;
      }
      while (v48);
    }
    *(_DWORD *)(this + 48) = v47;
    if (*(unsigned char *)(this + 37))
    {
      *(_DWORD *)(this + 76) = 0;
      uint64_t v51 = *(int **)(this + 168);
      unint64_t v52 = *(void *)(this + 176) - (void)v51;
      if ((int)(v52 >> 2) < 1)
      {
        int v56 = 0;
        int v53 = 0;
      }
      else
      {
        int v53 = 0;
        uint64_t v54 = (v52 >> 2);
        do
        {
          if (*v51) {
            int v55 = v53;
          }
          else {
            int v55 = -1;
          }
          if (*v51) {
            ++v53;
          }
          *v51++ = v55;
          --v54;
        }
        while (v54);
        int v56 = *(_DWORD *)(this + 76);
      }
      *(_DWORD *)(this + 52) = v53;
      int v73 = v56 + v53;
      *(_DWORD *)(this + 80) = v73;
      v74 = *(int **)(this + 216);
      unint64_t v75 = *(void *)(this + 224) - (void)v74;
      if ((int)(v75 >> 2) < 1)
      {
        int v76 = 0;
      }
      else
      {
        int v76 = 0;
        uint64_t v77 = (v75 >> 2);
        do
        {
          int v78 = v76 + v73;
          if (*v74)
          {
            ++v76;
            int v79 = v78;
          }
          else
          {
            int v79 = -1;
          }
          *v74++ = v79;
          --v77;
        }
        while (v77);
        int v73 = *(_DWORD *)(this + 80);
      }
      *(_DWORD *)(this + 56) = v76;
      int v80 = v73 + v76;
      *(_DWORD *)(this + 84) = v80;
      unint64_t v81 = *(int **)(this + 240);
      unint64_t v82 = *(void *)(this + 248) - (void)v81;
      if ((int)(v82 >> 2) < 1)
      {
        int v83 = 0;
      }
      else
      {
        int v83 = 0;
        uint64_t v84 = (v82 >> 2);
        do
        {
          int v85 = v83 + v80;
          if (*v81)
          {
            ++v83;
            int v86 = v85;
          }
          else
          {
            int v86 = -1;
          }
          *v81++ = v86;
          --v84;
        }
        while (v84);
      }
      *(_DWORD *)(this + 60) = v83;
    }
    else
    {
      *(_DWORD *)(this + 84) = 0;
      float v57 = *(int **)(this + 240);
      unint64_t v58 = *(void *)(this + 248) - (void)v57;
      if ((int)(v58 >> 2) < 1)
      {
        int v62 = 0;
        int v59 = 0;
      }
      else
      {
        int v59 = 0;
        uint64_t v60 = (v58 >> 2);
        do
        {
          if (*v57) {
            int v61 = v59;
          }
          else {
            int v61 = -1;
          }
          if (*v57) {
            ++v59;
          }
          *v57++ = v61;
          --v60;
        }
        while (v60);
        int v62 = *(_DWORD *)(this + 84);
      }
      *(_DWORD *)(this + 60) = v59;
      int v87 = v62 + v59;
      *(_DWORD *)(this + 76) = v87;
      uint64_t v88 = *(int **)(this + 168);
      unint64_t v89 = *(void *)(this + 176) - (void)v88;
      if ((int)(v89 >> 2) < 1)
      {
        int v90 = 0;
      }
      else
      {
        int v90 = 0;
        uint64_t v91 = (v89 >> 2);
        do
        {
          int v92 = v90 + v87;
          if (*v88)
          {
            ++v90;
            int v93 = v92;
          }
          else
          {
            int v93 = -1;
          }
          *v88++ = v93;
          --v91;
        }
        while (v91);
        int v87 = *(_DWORD *)(this + 76);
      }
      *(_DWORD *)(this + 52) = v90;
      int v94 = v87 + v90;
      *(_DWORD *)(this + 80) = v94;
      float v95 = *(int **)(this + 216);
      unint64_t v96 = *(void *)(this + 224) - (void)v95;
      if ((int)(v96 >> 2) < 1)
      {
        int v97 = 0;
      }
      else
      {
        int v97 = 0;
        uint64_t v98 = (v96 >> 2);
        do
        {
          int v99 = v97 + v94;
          if (*v95)
          {
            ++v97;
            int v100 = v99;
          }
          else
          {
            int v100 = -1;
          }
          *v95++ = v100;
          --v98;
        }
        while (v98);
      }
      *(_DWORD *)(this + 56) = v97;
    }
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceParentVectors(std::vector<unsigned int> *a1, unsigned char *a2)
{
  std::vector<unsigned int>::size_type v4 = *(int *)a1->__end_cap_.__value_;
  std::vector<unsigned int>::pointer begin = a1[14].__begin_;
  uint64_t v6 = (char *)((char *)a1[14].__end_ - (char *)begin);
  BOOL v7 = v4 >= (unint64_t)v6;
  unint64_t v8 = v4 - (void)v6;
  if (v8 != 0 && v7)
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)&a1[14].__begin_, v8);
    std::vector<unsigned int>::size_type v4 = *(int *)a1->__end_cap_.__value_;
  }
  else if (!v7)
  {
    a1[14].__end_ = (std::vector<unsigned int>::pointer)((char *)begin + v4);
  }
  std::vector<int>::resize(a1 + 11, v4);

  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceParentFromParentFaces((uint64_t)a1, a2);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeParentVectors(std::vector<unsigned int> *a1, unsigned char *a2)
{
  std::vector<unsigned int>::size_type v4 = *((int *)a1->__end_cap_.__value_ + 1);
  std::vector<unsigned int>::pointer begin = a1[15].__begin_;
  uint64_t v6 = (char *)((char *)a1[15].__end_ - (char *)begin);
  BOOL v7 = v4 >= (unint64_t)v6;
  unint64_t v8 = v4 - (void)v6;
  if (v8 != 0 && v7)
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)&a1[15].__begin_, v8);
    std::vector<unsigned int>::size_type v4 = *((int *)a1->__end_cap_.__value_ + 1);
  }
  else if (!v7)
  {
    a1[15].__end_ = (std::vector<unsigned int>::pointer)((char *)begin + v4);
  }
  std::vector<int>::resize(a1 + 12, v4);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeParentFromParentFaces((uint64_t)a1, a2);

  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeParentFromParentEdges((uint64_t)a1, a2);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentVectors(uint64_t a1, unsigned char *a2)
{
  int v4 = *(unsigned __int8 *)(a1 + 36);
  uint64_t v5 = (void *)(a1 + 384);
  unint64_t v6 = *(int *)(*(void *)(a1 + 16) + 8);
  uint64_t v7 = *(void *)(a1 + 384);
  unint64_t v8 = *(void *)(a1 + 392) - v7;
  if (v4)
  {
    if (v6 > v8)
    {
      uint64_t v9 = a2;
LABEL_6:
      std::vector<OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::ETag>::__append(v5, v6 - v8, v9);
      goto LABEL_9;
    }
  }
  else if (v6 > v8)
  {
    uint64_t v9 = a2 + 4;
    goto LABEL_6;
  }
  if (v6 < v8) {
    *(void *)(a1 + 392) = v7 + v6;
  }
LABEL_9:
  std::vector<int>::resize((std::vector<unsigned int> *)(a1 + 312), *(int *)(*(void *)(a1 + 16) + 8));
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentFromParentFaces(a1, a2);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentFromParentEdges(a1, a2);

  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentFromParentVertices(a1, a2);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceParentFromParentFaces(uint64_t result, unsigned char *a2)
{
  int v2 = **(_DWORD **)(result + 8);
  if (*(unsigned char *)(result + 36))
  {
    if (v2 >= 1)
    {
      uint64_t v3 = 0;
      int v4 = *(_DWORD *)(result + 64);
      do
      {
        int v5 = *(_DWORD *)(*(void *)(result + 88) + 8 * v3);
        if (v5 == 4)
        {
          *(unsigned char *)(*(void *)(result + 336) + v4) = *a2;
          uint64_t v6 = v4 + 1;
          *(unsigned char *)(*(void *)(result + 336) + v6) = a2[1];
          uint64_t v7 = v4 + 2;
          *(unsigned char *)(*(void *)(result + 336) + v7) = a2[2];
          uint64_t v8 = v4 + 3;
          *(unsigned char *)(*(void *)(result + 336) + v8) = a2[3];
          uint64_t v9 = *(void *)(result + 264);
          *(_DWORD *)(v9 + 4 * v4) = v3;
          *(_DWORD *)(v9 + 4 * v6) = v3;
          *(_DWORD *)(v9 + 4 * v7) = v3;
          *(_DWORD *)(v9 + 4 * v8) = v3;
          v4 += 4;
        }
        else if (v5 >= 1)
        {
          int v10 = 0;
          uint64_t v11 = v4;
          do
          {
            if (v5 <= 4) {
              int v12 = v10;
            }
            else {
              int v12 = 0;
            }
            *(unsigned char *)(*(void *)(result + 336) + v11) = a2[v12];
            *(_DWORD *)(*(void *)(result + 264) + 4 * v11) = v3;
            ++v10;
            ++v11;
          }
          while (v5 != v10);
          v4 += v10;
        }
        ++v3;
      }
      while (v3 < **(int **)(result + 8));
    }
  }
  else if (v2 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = (unsigned int *)(*(void *)(result + 88) + 8 * v13);
      uint64_t v15 = *v14;
      unint64_t v16 = (int *)(*(void *)(result + 120) + 4 * (int)v14[1]);
      if ((*(unsigned char *)(*(void *)(result + 408) + v13) & 1) != 0 && v15 == 4)
      {
        *(unsigned char *)(*(void *)(result + 336) + *v16) = *a2;
        *(unsigned char *)(*(void *)(result + 336) + v16[1]) = a2[1];
        *(unsigned char *)(*(void *)(result + 336) + v16[2]) = a2[2];
        *(unsigned char *)(*(void *)(result + 336) + v16[3]) = a2[3];
        uint64_t v17 = *(void *)(result + 264);
        *(_DWORD *)(v17 + 4 * *v16) = v13;
        *(_DWORD *)(v17 + 4 * v16[1]) = v13;
        *(_DWORD *)(v17 + 4 * v16[2]) = v13;
        *(_DWORD *)(v17 + 4 * v16[3]) = v13;
      }
      else if ((int)v15 >= 1)
      {
        uint64_t v18 = 0;
        BOOL v19 = (*(unsigned char *)(*(void *)(result + 408) + v13) & 1) == 0;
        do
        {
          uint64_t v20 = v16[v18];
          if (v20 != -1)
          {
            if ((int)v15 <= 4) {
              uint64_t v21 = v18;
            }
            else {
              uint64_t v21 = 0;
            }
            *(unsigned char *)(*(void *)(result + 336) + v20) = a2[4 * v19 + v21];
            *(_DWORD *)(*(void *)(result + 264) + 4 * v16[v18]) = v13;
          }
          ++v18;
        }
        while (v15 != v18);
      }
      ++v13;
    }
    while (v13 < **(int **)(result + 8));
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeParentFromParentFaces(uint64_t result, unsigned char *a2)
{
  int v2 = **(_DWORD **)(result + 8);
  if (*(unsigned char *)(result + 36))
  {
    if (v2 >= 1)
    {
      uint64_t v3 = 0;
      int v4 = *(_DWORD *)(result + 68);
      do
      {
        int v5 = *(_DWORD *)(*(void *)(result + 104) + 8 * v3);
        if (v5 == 4)
        {
          *(unsigned char *)(*(void *)(result + 360) + v4) = *a2;
          uint64_t v6 = v4 + 1;
          *(unsigned char *)(*(void *)(result + 360) + v6) = a2[1];
          uint64_t v7 = v4 + 2;
          *(unsigned char *)(*(void *)(result + 360) + v7) = a2[2];
          uint64_t v8 = v4 + 3;
          *(unsigned char *)(*(void *)(result + 360) + v8) = a2[3];
          uint64_t v9 = *(void *)(result + 288);
          *(_DWORD *)(v9 + 4 * v4) = v3;
          *(_DWORD *)(v9 + 4 * v6) = v3;
          *(_DWORD *)(v9 + 4 * v7) = v3;
          *(_DWORD *)(v9 + 4 * v8) = v3;
          v4 += 4;
        }
        else if (v5 >= 1)
        {
          int v10 = 0;
          uint64_t v11 = v4;
          do
          {
            if (v5 <= 4) {
              int v12 = v10;
            }
            else {
              int v12 = 0;
            }
            *(unsigned char *)(*(void *)(result + 360) + v11) = a2[v12];
            *(_DWORD *)(*(void *)(result + 288) + 4 * v11) = v3;
            ++v10;
            ++v11;
          }
          while (v5 != v10);
          v4 += v10;
        }
        ++v3;
      }
      while (v3 < **(int **)(result + 8));
    }
  }
  else if (v2 >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = (unsigned int *)(*(void *)(result + 104) + 8 * v13);
      uint64_t v15 = *v14;
      unint64_t v16 = (int *)(*(void *)(result + 144) + 4 * (int)v14[1]);
      if ((*(unsigned char *)(*(void *)(result + 408) + v13) & 1) != 0 && v15 == 4)
      {
        *(unsigned char *)(*(void *)(result + 360) + *v16) = *a2;
        *(unsigned char *)(*(void *)(result + 360) + v16[1]) = a2[1];
        *(unsigned char *)(*(void *)(result + 360) + v16[2]) = a2[2];
        *(unsigned char *)(*(void *)(result + 360) + v16[3]) = a2[3];
        uint64_t v17 = *(void *)(result + 288);
        *(_DWORD *)(v17 + 4 * *v16) = v13;
        *(_DWORD *)(v17 + 4 * v16[1]) = v13;
        *(_DWORD *)(v17 + 4 * v16[2]) = v13;
        *(_DWORD *)(v17 + 4 * v16[3]) = v13;
      }
      else if ((int)v15 >= 1)
      {
        uint64_t v18 = 0;
        BOOL v19 = (*(unsigned char *)(*(void *)(result + 408) + v13) & 1) == 0;
        do
        {
          uint64_t v20 = v16[v18];
          if (v20 != -1)
          {
            if ((int)v15 <= 4) {
              uint64_t v21 = v18;
            }
            else {
              uint64_t v21 = 0;
            }
            *(unsigned char *)(*(void *)(result + 360) + v20) = a2[4 * v19 + v21];
            *(_DWORD *)(*(void *)(result + 288) + 4 * v16[v18]) = v13;
          }
          ++v18;
        }
        while (v15 != v18);
      }
      ++v13;
    }
    while (v13 < **(int **)(result + 8));
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeParentFromParentEdges(uint64_t result, unsigned char *a2)
{
  int v2 = *(_DWORD *)(*(void *)(result + 8) + 4);
  if (*(unsigned char *)(result + 36))
  {
    if (v2 >= 1)
    {
      int v3 = 0;
      uint64_t v4 = *(int *)(result + 72);
      do
      {
        *(unsigned char *)(*(void *)(result + 360) + v4) = *a2;
        *(unsigned char *)(*(void *)(result + 360) + v4 + 1) = a2[1];
        int v5 = (_DWORD *)(*(void *)(result + 288) + 4 * v4);
        *int v5 = v3;
        v5[1] = v3++;
        v4 += 2;
      }
      while (v3 < *(_DWORD *)(*(void *)(result + 8) + 4));
    }
  }
  else if (v2 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = (int *)(*(void *)(result + 192) + 8 * v6);
      if (*(unsigned char *)(*(void *)(result + 432) + v6))
      {
        *(unsigned char *)(*(void *)(result + 360) + *v7) = *a2;
        *(unsigned char *)(*(void *)(result + 360) + v7[1]) = a2[1];
        uint64_t v12 = *(void *)(result + 288);
        *(_DWORD *)(v12 + 4 * *v7) = v6;
        *(_DWORD *)(v12 + 4 * v7[1]) = v6;
      }
      else
      {
        uint64_t v8 = 0;
        char v9 = 1;
        do
        {
          char v10 = v9;
          uint64_t v11 = v7[v8];
          if (v11 != -1)
          {
            *(unsigned char *)(*(void *)(result + 360) + v11) = a2[v8 + 4];
            *(_DWORD *)(*(void *)(result + 288) + 4 * v7[v8]) = v6;
          }
          char v9 = 0;
          uint64_t v8 = 1;
        }
        while ((v10 & 1) != 0);
      }
      ++v6;
    }
    while (v6 < *(int *)(*(void *)(result + 8) + 4));
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentFromParentFaces(uint64_t result, unsigned char *a2)
{
  if (*(_DWORD *)(result + 52))
  {
    int v2 = *(int **)(result + 8);
    int v3 = *v2;
    if (*(unsigned char *)(result + 36))
    {
      if (v3 >= 1)
      {
        uint64_t v4 = 0;
        uint64_t v5 = *(void *)(result + 312) + 4 * *(int *)(result + 76);
        do
        {
          *(_DWORD *)(v5 + 4 * v4) = v4;
          ++v4;
        }
        while ((int)v4 < *v2);
      }
    }
    else if (v3 >= 1)
    {
      for (uint64_t i = 0; i < v3; ++i)
      {
        uint64_t v7 = *(int *)(*(void *)(result + 168) + 4 * i);
        if (v7 != -1)
        {
          if (*(unsigned char *)(*(void *)(result + 408) + i))
          {
            *(unsigned char *)(*(void *)(result + 384) + v7) = *a2;
            int v2 = *(int **)(result + 8);
          }
          *(_DWORD *)(*(void *)(result + 312) + 4 * v7) = i;
          int v3 = *v2;
        }
      }
    }
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentFromParentEdges(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  int v3 = *(_DWORD *)(v2 + 4);
  if (*(unsigned char *)(result + 36))
  {
    if (v3 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = *(void *)(result + 312) + 4 * *(int *)(result + 80);
      do
      {
        *(_DWORD *)(v5 + 4 * v4) = v4;
        ++v4;
      }
      while ((int)v4 < *(_DWORD *)(v2 + 4));
    }
  }
  else if (v3 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(int *)(*(void *)(result + 216) + 4 * v6);
      if (v7 != -1)
      {
        if (*(unsigned char *)(*(void *)(result + 432) + v6))
        {
          *(unsigned char *)(*(void *)(result + 384) + v7) = *a2;
          uint64_t v2 = *(void *)(result + 8);
        }
        *(_DWORD *)(*(void *)(result + 312) + 4 * v7) = v6;
      }
      ++v6;
    }
    while (v6 < *(int *)(v2 + 4));
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexParentFromParentVertices(uint64_t result, unsigned char *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  int v3 = *(_DWORD *)(v2 + 8);
  if (*(unsigned char *)(result + 36))
  {
    if (v3 >= 1)
    {
      uint64_t v4 = 0;
      uint64_t v5 = *(void *)(result + 312) + 4 * *(int *)(result + 84);
      do
      {
        *(_DWORD *)(v5 + 4 * v4) = v4;
        ++v4;
      }
      while ((int)v4 < *(_DWORD *)(v2 + 8));
    }
  }
  else if (v3 >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(int *)(*(void *)(result + 240) + 4 * v6);
      if (v7 != -1)
      {
        if (*(unsigned char *)(*(void *)(result + 456) + v6))
        {
          *(unsigned char *)(*(void *)(result + 384) + v7) = *a2;
          uint64_t v2 = *(void *)(result + 8);
        }
        *(_DWORD *)(*(void *)(result + 312) + 4 * v7) = v6;
      }
      ++v6;
    }
    while (v6 < *(int *)(v2 + 8));
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceTagVectors(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  uint64_t v2 = (int *)*((void *)this + 2);
  uint64_t v3 = *((void *)v2 + 12);
  unint64_t v4 = *v2;
  unint64_t v5 = *((void *)v2 + 13) - v3;
  if (v4 <= v5)
  {
    if (v4 < v5) {
      *((void *)v2 + 13) = v3 + v4;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)v2 + 12, v4 - v5);
  }

  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceTagsFromParentFaces((uint64_t)this);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeTagVectors(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *(void *)(v2 + 240);
  unint64_t v4 = *(int *)(v2 + 4);
  unint64_t v5 = *(void *)(v2 + 248) - v3;
  if (v4 <= v5)
  {
    if (v4 < v5) {
      *(void *)(v2 + 248) = v3 + v4;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)(v2 + 240), v4 - v5);
  }
  uint64_t v6 = *((int *)this + 11);
  if ((int)v6 >= 1)
  {
    uint64_t v7 = *((int *)this + 17);
    uint64_t v8 = v7 + v6;
    do
      *(unsigned char *)(*(void *)(*((void *)this + 2) + 240) + v7++) = 0;
    while (v7 < v8);
  }

  return OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeTagsFromParentEdges((uint64_t)this);
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagVectors(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag>::resize(*((void *)this + 2) + 432, *(int *)(*((void *)this + 2) + 8));
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagsFromParentFaces((uint64_t)this);
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagsFromParentEdges(this);
  uint64_t result = OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagsFromParentVertices((uint64_t)this);
  if (!*((unsigned char *)this + 36))
  {
    uint64_t v3 = *((void *)this + 2);
    if (*(int *)(v3 + 8) >= 1)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(unsigned char *)(*((void *)this + 48) + v4))
        {
          *(_WORD *)(*(void *)(v3 + 432) + 2 * v4) |= 0x800u;
          uint64_t v3 = *((void *)this + 2);
        }
        ++v4;
      }
      while (v4 < *(int *)(v3 + 8));
    }
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateFaceTagsFromParentFaces(uint64_t this)
{
  uint64_t v1 = *(int *)(this + 40);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(this + 64);
    uint64_t v3 = v1 + v2;
    do
    {
      *(unsigned char *)(*(void *)(*(void *)(this + 16) + 96) + v2) = *(unsigned char *)(*(void *)(*(void *)(this + 8) + 96)
                                                                             + *(int *)(*(void *)(this + 264) + 4 * v2));
      ++v2;
    }
    while (v2 < v3);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateEdgeTagsFromParentEdges(uint64_t this)
{
  uint64_t v1 = *(int *)(this + 48);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(this + 72);
    uint64_t v3 = v1 + v2;
    do
    {
      *(unsigned char *)(*(void *)(*(void *)(this + 16) + 240) + v2) = *(unsigned char *)(*(void *)(*(void *)(this + 8) + 240)
                                                                              + *(int *)(*(void *)(this + 288) + 4 * v2));
      ++v2;
    }
    while (v2 < v3);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagsFromParentFaces(uint64_t this)
{
  uint64_t v1 = *(int *)(this + 52);
  if (v1)
  {
    uint64_t v2 = *(int *)(this + 76);
    uint64_t v3 = v2 + v1;
    if (*(int *)(*(void *)(this + 8) + 12) <= 0)
    {
      if ((int)v1 >= 1)
      {
        do
        {
          *(_WORD *)(*(void *)(*(void *)(this + 16) + 432) + 2 * v2) = 128;
          if (*(_DWORD *)(*(void *)(*(void *)(this + 8) + 24) + 8 * *(int *)(*(void *)(this + 312) + 4 * v2)) != *(_DWORD *)(this + 32)) {
            *(_WORD *)(*(void *)(*(void *)(this + 16) + 432) + 2 * v2) |= 2u;
          }
          ++v2;
        }
        while (v2 < v3);
      }
    }
    else if ((int)v1 >= 1)
    {
      do
        *(_WORD *)(*(void *)(*(void *)(this + 16) + 432) + 2 * v2++) = 128;
      while (v2 < (int)v3);
    }
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagsFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    uint64_t v2 = 0;
    unsigned int v3 = 0;
    do
    {
      uint64_t v4 = *(int *)(this[27] + 4 * v2);
      if (v4 != -1)
      {
        unsigned int v5 = *(unsigned __int8 *)(*(void *)(v1 + 240) + v2);
        unsigned int v6 = v3 & 0xFFFF883A | v5 & 1 | (4 * ((v5 >> 1) & 1)) & 0xFFFFFFBF | (((v5 >> 3) & 1) << 6);
        unsigned int v7 = v5 >> 2;
        int v8 = (~v5 & 5) == 0;
        if ((v5 & 0xC) != 0) {
          int v9 = 512;
        }
        else {
          int v9 = 128;
        }
        unsigned int v3 = v6 & 0xFFFFCFFF | (v8 << 14) | ((v7 & 1) << 12) & 0xDFFF | ((v7 & 1) << 13) | v9;
        *(_WORD *)(*(void *)(this[2] + 432) + 2 * v4) = v3;
        uint64_t v1 = this[1];
      }
      ++v2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateVertexTagsFromParentVertices(uint64_t this)
{
  uint64_t v1 = *(int *)(this + 60);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(this + 84);
    uint64_t v3 = v1 + v2;
    do
    {
      *(_WORD *)(*(void *)(*(void *)(this + 16) + 432) + 2 * v2) = *(_WORD *)(*(void *)(*(void *)(this + 8)
                                                                                              + 432)
                                                                                  + 2
                                                                                  * *(int *)(*(void *)(this + 312)
                                                                                           + 4 * v2));
      ++v2;
    }
    while (v2 < v3);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideEdgeSharpness(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v26 = *((_DWORD *)this + 6);
  char v2 = v26;
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = *(void *)(v3 + 216);
  v3 += 216;
  *(void *)(v3 + 8) = v4;
  std::vector<float>::resize(v3, *(int *)(v3 - 212), &OpenSubdiv::v3_1_1::Sdc::Crease::SHARPNESS_SMOOTH);
  uint64_t v27 = (float *)&v29;
  uint64_t v28 = 0x1000000000;
  __p = 0;
  if ((v2 & 0x60) != 0 && (uint64_t v5 = *(unsigned int *)(*((void *)this + 1) + 20), v5 >= 0x11))
  {
    operator delete(0);
    unsigned int v6 = operator new(4 * v5);
    __p = v6;
    uint64_t v27 = (float *)v6;
    HIDWORD(v28) = v5;
  }
  else
  {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *((int *)this + 12);
  if ((int)v7 >= 1)
  {
    uint64_t v8 = *((int *)this + 18);
    uint64_t v9 = v7 + v8;
    while (1)
    {
      uint64_t v10 = *((void *)this + 2);
      uint64_t v11 = *(void *)(v10 + 216);
      uint64_t v12 = *(void *)(v10 + 240);
      if ((*(unsigned char *)(v12 + v8) & 4) != 0)
      {
        *(_DWORD *)(v11 + 4 * v8) = 1092616192;
      }
      else if ((*(unsigned char *)(v12 + v8) & 8) != 0)
      {
        uint64_t v13 = *(int *)(*((void *)this + 36) + 4 * v8);
        uint64_t v14 = (void *)*((void *)this + 1);
        uint64_t v15 = v14[27];
        float v16 = *(float *)(v15 + 4 * v13);
        if ((v26 & 0x60) != 0)
        {
          uint64_t v17 = *(int *)(v14[15]
                       + 8 * v13
                       + 4 * (((unint64_t)*(unsigned __int8 *)(*((void *)this + 45) + v8) >> 3) & 3));
          uint64_t v18 = v14[42];
          int v19 = *(_DWORD *)(v18 + 8 * v17);
          uint64_t v20 = v27;
          if (v19 >= 1)
          {
            uint64_t v21 = (int *)(v14[45] + 4 * *(int *)(v18 + 8 * v17 + 4));
            uint64_t v22 = *(unsigned int *)(v18 + 8 * v17);
            int v23 = v27;
            do
            {
              uint64_t v24 = *v21++;
              *v23++ = *(float *)(v15 + 4 * v24);
              --v22;
            }
            while (v22);
          }
          float v25 = OpenSubdiv::v3_1_1::Sdc::Crease::SubdivideEdgeSharpnessAtVertex((OpenSubdiv::v3_1_1::Sdc::Crease *)&v26, v16, v19, v20);
          goto LABEL_14;
        }
        if (v16 <= 0.0) {
          goto LABEL_21;
        }
        float v25 = 10.0;
        if (v16 >= 10.0)
        {
LABEL_14:
          *(float *)(v11 + 4 * v8) = v25;
          if (v25 > 0.0) {
            goto LABEL_23;
          }
        }
        else
        {
          if (v16 > 1.0)
          {
            float v25 = v16 + -1.0;
            goto LABEL_14;
          }
LABEL_21:
          *(_DWORD *)(v11 + 4 * v8) = 0;
        }
        *(unsigned char *)(v12 + v8) &= ~8u;
      }
LABEL_23:
      if (++v8 >= v9)
      {
        unsigned int v6 = __p;
        break;
      }
    }
  }
  operator delete(v6);
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideVertexSharpness(OpenSubdiv::v3_1_1::Vtr::internal::Refinement *this)
{
  uint64_t v2 = *((void *)this + 2);
  *(void *)(v2 + 416) = *(void *)(v2 + 408);
  std::vector<float>::resize(v2 + 408, *(int *)(v2 + 8), &OpenSubdiv::v3_1_1::Sdc::Crease::SHARPNESS_SMOOTH);
  uint64_t v3 = *((int *)this + 15);
  if ((int)v3 >= 1)
  {
    uint64_t v4 = *((int *)this + 21);
    uint64_t v5 = v3 + v4;
    do
    {
      uint64_t v6 = *((void *)this + 2);
      uint64_t v7 = *(void *)(v6 + 408);
      uint64_t v8 = *(void *)(v6 + 432);
      __int16 v9 = *(_WORD *)(v8 + 2 * v4);
      if ((v9 & 0x10) != 0)
      {
        *(_DWORD *)(v7 + 4 * v4) = 1092616192;
      }
      else if ((v9 & 0x20) != 0)
      {
        float v10 = *(float *)(*(void *)(*((void *)this + 1) + 408) + 4 * *(int *)(*((void *)this + 39) + 4 * v4));
        if (v10 <= 0.0) {
          goto LABEL_12;
        }
        float v11 = 10.0;
        if (v10 >= 10.0)
        {
LABEL_9:
          *(float *)(v7 + 4 * v4) = v11;
          if (v11 > 0.0) {
            goto LABEL_14;
          }
        }
        else
        {
          if (v10 > 1.0)
          {
            float v11 = v10 + -1.0;
            goto LABEL_9;
          }
LABEL_12:
          *(_DWORD *)(v7 + 4 * v4) = 0;
        }
        *(_WORD *)(v8 + 2 * v4) &= ~0x20u;
      }
LABEL_14:
      ++v4;
    }
    while (v4 < v5);
  }
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::Refinement::reclassifySemisharpVertices(uint64_t this)
{
  uint64_t v1 = this;
  int v42 = *(_DWORD *)(this + 24);
  uint64_t v2 = *(int *)(this + 56);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = *(int *)(this + 80);
    uint64_t v4 = v2 + v3;
    do
    {
      uint64_t v5 = *(void *)(v1 + 16);
      uint64_t v6 = *(void *)(v5 + 432);
      __int16 v7 = *(_WORD *)(v6 + 2 * v3);
      if ((v7 & 0x40) != 0)
      {
        uint64_t v8 = (int *)(*(void *)(v1 + 192) + 8 * *(int *)(*(void *)(v1 + 312) + 4 * v3));
        if (*(unsigned char *)(*(void *)(v1 + 384) + v3))
        {
          uint64_t v11 = *v8;
          if (v11 != -1 && (*(unsigned char *)(*(void *)(v5 + 240) + v11) & 8) != 0)
          {
            __int16 v13 = v7 & 0xF83F | 0x40;
            __int16 v14 = 512;
          }
          else
          {
            uint64_t v12 = v8[1];
            if (v12 == -1)
            {
              __int16 v13 = v7 & 0xF83F;
              __int16 v14 = 128;
            }
            else
            {
              __int16 v13 = v7 & 0xF83F;
              if ((*(unsigned char *)(*(void *)(v5 + 240) + v12) & 8) != 0)
              {
                v13 |= 0x40u;
                __int16 v14 = 512;
              }
              else
              {
                __int16 v14 = 128;
              }
            }
          }
          __int16 v10 = v14 | v13;
        }
        else
        {
          int v9 = ((*(unsigned __int8 *)(*(void *)(v5 + 240) + v8[1]) >> 3) & 1)
             + ((*(unsigned __int8 *)(*(void *)(v5 + 240) + *v8) >> 3) & 1);
          *(_WORD *)(v6 + 2 * v3) = v7 & 0xFFBF | ((v9 != 0) << 6);
          this = OpenSubdiv::v3_1_1::Sdc::Crease::DetermineVertexVertexRule((OpenSubdiv::v3_1_1::Sdc::Crease *)&v42, 0.0, v9);
          __int16 v10 = *(_WORD *)(v6 + 2 * v3) & 0xF87F | ((this & 0xF) << 7);
        }
        *(_WORD *)(v6 + 2 * v3) = v10;
      }
      ++v3;
    }
    while (v3 < v4);
  }
  uint64_t v15 = *(int *)(v1 + 60);
  if ((int)v15 >= 1)
  {
    uint64_t v16 = *(int *)(v1 + 84);
    uint64_t v17 = v15 + v16;
    do
    {
      uint64_t v18 = *(int *)(*(void *)(v1 + 312) + 4 * v16);
      int v19 = *(void **)(v1 + 8);
      unsigned int v20 = *(unsigned __int16 *)(v19[54] + 2 * v18);
      if ((v20 & 0x60) == 0) {
        goto LABEL_34;
      }
      uint64_t v21 = *(void **)(v1 + 16);
      uint64_t v22 = v21[54];
      __int16 v23 = *(_WORD *)(v22 + 2 * v16);
      if ((v20 & 0x40) == 0 && (((v23 & 0x20) == 0) & (v20 >> 5)) == 0) {
        goto LABEL_34;
      }
      uint64_t v24 = v21[45];
      if ((int)((unint64_t)(v21[46] - v24) >> 2) < 1)
      {
        uint64_t v31 = v19[42];
        uint64_t v32 = *(unsigned int *)(v31 + 8 * v18);
        if ((int)v32 >= 1)
        {
          uint64_t v33 = *(int *)(v31 + 8 * v18 + 4);
          uint64_t v34 = (int *)(v19[45] + 4 * v33);
          int v35 = (unsigned __int16 *)(v19[48] + 2 * v33);
          int32x2_t v28 = 0;
          uint64_t v36 = v21[30];
          do
          {
            uint64_t v37 = *v34++;
            uint64_t v38 = *(void *)(v1 + 192) + 8 * v37;
            LODWORD(v37) = *v35++;
            int32x2_t v28 = vadd_s32(v28, (int32x2_t)(*(void *)&vshl_u32((uint32x2_t)vand_s8((int8x8_t)vdup_n_s32(*(unsigned __int8 *)(v36 + *(int *)(v38 + 4 * v37))), (int8x8_t)0xFF000000FFLL), (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1));
            --v32;
          }
          while (v32);
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v25 = v21[42];
        uint64_t v26 = *(unsigned int *)(v25 + 8 * (int)v16);
        if ((int)v26 >= 1)
        {
          uint64_t v27 = (int *)(v24 + 4 * *(int *)(v25 + 8 * v16 + 4));
          int32x2_t v28 = 0;
          uint64_t v29 = v21[30];
          do
          {
            uint64_t v30 = *v27++;
            int32x2_t v28 = vadd_s32(v28, (int32x2_t)(*(void *)&vshl_u32((uint32x2_t)vand_s8((int8x8_t)vdup_n_s32(*(unsigned __int8 *)(v29 + v30)), (int8x8_t)0xFF000000FFLL), (uint32x2_t)0xFFFFFFFEFFFFFFFDLL) & 0xFFFFFFC1FFFFFFC1));
            --v26;
          }
          while (v26);
LABEL_30:
          __int32 v39 = v28.i32[0];
          __int16 v40 = (v28.i32[0] > 0) << 6;
          __int32 v41 = v28.i32[1];
          goto LABEL_32;
        }
      }
      __int32 v41 = 0;
      __int32 v39 = 0;
      __int16 v40 = 0;
LABEL_32:
      *(_WORD *)(v22 + 2 * v16) = v40 | v23 & 0xFFBF;
      if ((v23 & 0x30) == 0)
      {
        this = OpenSubdiv::v3_1_1::Sdc::Crease::DetermineVertexVertexRule((OpenSubdiv::v3_1_1::Sdc::Crease *)&v42, 0.0, v41 + v39);
        *(_WORD *)(v22 + 2 * v16) = ((this & 0xF) << 7) | *(_WORD *)(v22 + 2 * v16) & 0xF87F;
      }
LABEL_34:
      ++v16;
    }
    while (v16 < v17);
  }
  return this;
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

void *OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseVertexChildren(void *this)
{
  uint64_t v1 = this[57];
  if (this[58] == v1) {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseVertexChildren();
  }
  uint64_t v2 = this[1];
  int v3 = *(_DWORD *)(v2 + 8);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i < v3; ++i)
    {
      if (*(unsigned char *)(v1 + i))
      {
        *(_DWORD *)(this[30] + 4 * i) = 2;
        int v3 = *(_DWORD *)(v2 + 8);
      }
    }
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseEdgeChildren(void *this)
{
  if (this[55] == this[54]) {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseEdgeChildren();
  }
  uint64_t v1 = this[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    for (uint64_t i = 0; i < *(int *)(v1 + 4); ++i)
    {
      int v3 = (_DWORD *)(this[24] + 8 * i);
      uint64_t v4 = this[54];
      if (*(unsigned char *)(v4 + i))
      {
        int v7 = 2;
        *int v3 = 2;
      }
      else
      {
        uint64_t v5 = (int *)(*(void *)(v1 + 120) + 8 * i);
        uint64_t v6 = this[57];
        if (*(unsigned char *)(v6 + *v5))
        {
          *int v3 = 1;
          *(_DWORD *)(this[27] + 4 * i) = 1;
        }
        if ((*(unsigned char *)(v6 + v5[1]) & 1) == 0) {
          goto LABEL_11;
        }
        int v7 = 1;
      }
      v3[1] = v7;
      *(_DWORD *)(this[27] + 4 * i) = v7;
LABEL_11:
      uint64_t v8 = *(void *)(v1 + 168);
      uint64_t v9 = *(void *)(v1 + 144);
      uint64_t v10 = *(int *)(v9 + ((8 * i) | 4));
      uint64_t v11 = *(unsigned int *)(v9 + 8 * i);
      if (v11 == 2)
      {
        char v12 = *(unsigned char *)(v4 + i) & 0xE1 | (2
                                         * ((*(unsigned char *)(this[51] + *(int *)(v8 + 4 * v10 + 4)) ^ *(unsigned char *)(this[51] + *(int *)(v8 + 4 * v10))) & 1));
      }
      else if ((int)v11 > 1)
      {
        __int16 v13 = (int *)(v8 + 4 * v10);
        uint64_t v15 = *v13;
        __int16 v14 = v13 + 1;
        int v16 = *(unsigned __int8 *)(this[51] + v15);
        char v17 = *(unsigned char *)(v4 + i) & 0xE1;
        *(unsigned char *)(v4 + i) = v17;
        uint64_t v18 = v11 - 1;
        while (1)
        {
          uint64_t v19 = *v14++;
          if ((*(unsigned __int8 *)(this[51] + v19) ^ v16)) {
            break;
          }
          if (!--v18) {
            goto LABEL_21;
          }
        }
        char v12 = v17 | 2;
      }
      else
      {
        char v12 = *(unsigned char *)(v4 + i) & 0xE1;
      }
      *(unsigned char *)(v4 + i) = v12;
LABEL_21:
      uint64_t v1 = this[1];
    }
  }
  return this;
}

void std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Refinement::SparseTag>::__append(void *a1, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v5 = (unsigned char *)a1[1];
  uint64_t v4 = a1[2];
  if (v4 - (uint64_t)v5 >= a2)
  {
    if (a2)
    {
      uint64_t v11 = &v5[a2];
      do
      {
        *v5++ &= 0xE0u;
        --v2;
      }
      while (v2);
      uint64_t v5 = v11;
    }
    a1[1] = v5;
  }
  else
  {
    uint64_t v6 = &v5[-*a1];
    unint64_t v7 = (unint64_t)&v6[a2];
    if ((uint64_t)&v6[a2] < 0) {
      abort();
    }
    unint64_t v8 = v4 - *a1;
    if (2 * v8 > v7) {
      unint64_t v7 = 2 * v8;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v9 = v7;
    }
    if (v9) {
      uint64_t v10 = operator new(v9);
    }
    else {
      uint64_t v10 = 0;
    }
    char v12 = &v6[(void)v10];
    __int16 v13 = &v6[(void)v10 + v2];
    __int16 v14 = &v6[(void)v10];
    do
    {
      *v14++ &= 0xE0u;
      --v2;
    }
    while (v2);
    uint64_t v15 = (unsigned char *)*a1;
    if (v5 != (unsigned char *)*a1)
    {
      do
      {
        char v16 = *--v5;
        *--char v12 = v16;
      }
      while (v5 != v15);
      uint64_t v5 = (unsigned char *)*a1;
    }
    *a1 = v12;
    a1[1] = v13;
    a1[2] = (char *)v10 + v9;
    if (v5)
    {
      operator delete(v5);
    }
  }
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  unint64_t v7 = v8;
  size_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (unsigned char *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      char v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      size_t v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    uint64_t v10 = (char *)v9 - (unsigned char *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      abort();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (unsigned char *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(v6, v14);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t v18 = &v15[4 * v12];
    uint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    uint64_t v21 = v18;
    do
    {
      *(_DWORD *)uint64_t v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    uint64_t v22 = &v15[4 * v14];
    __int16 v23 = (char *)*a1;
    for (uint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
    {
      operator delete(v23);
    }
  }
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement()
{
  __assert_rtn("Refinement", "refinement.cpp", 68, "(childArg.getDepth() == 0) && (childArg.getNumVertices() == 0)");
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::refine()
{
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::populateParentToChildMapping()
{
  __assert_rtn("populateParentToChildMapping", "refinement.cpp", 194, "\"Unsupported empty sparse refinement detected in Refinement\" == 0");
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::subdivideFVarChannels()
{
  __assert_rtn("subdivideFVarChannels", "refinement.cpp", 1068, "this->_fvarChannels.size() == 0");
}

{
  __assert_rtn("subdivideFVarChannels", "refinement.cpp", 1067, "_child->_fvarChannels.size() == 0");
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseVertexChildren()
{
}

void OpenSubdiv::v3_1_1::Vtr::internal::Refinement::markSparseEdgeChildren()
{
}

void *OpenSubdiv::v3_1_1::Far::SetErrorCallback(void *result)
{
  OpenSubdiv::v3_1_1::Far::errorFunc = result;
  return result;
}

void *OpenSubdiv::v3_1_1::Far::SetWarningCallback(void *this, void (*a2)(const char *))
{
  OpenSubdiv::v3_1_1::Far::warningFunc = this;
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::Error(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = MEMORY[0x270FA5388](a1);
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!v9) {
    OpenSubdiv::v3_1_1::Far::Error();
  }
  uint64_t v11 = v9;
  vsnprintf(__str, 0x2800uLL, v10, &a9);
  if (OpenSubdiv::v3_1_1::Far::errorFunc) {
    return OpenSubdiv::v3_1_1::Far::errorFunc(v11, __str);
  }
  else {
    return printf("%s: %s\n", OpenSubdiv::v3_1_1::Far::Error(OpenSubdiv::v3_1_1::Far::ErrorType,char const*,...)::errorTypeLabel[v11], __str);
  }
}

uint64_t OpenSubdiv::v3_1_1::Far::Warning(OpenSubdiv::v3_1_1::Far *this, const char *a2, ...)
{
  va_start(va, a2);
  unint64_t v2 = (const char *)MEMORY[0x270FA5388](this);
  uint64_t v5 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x2800uLL, v2, va);
  if (OpenSubdiv::v3_1_1::Far::warningFunc) {
    return OpenSubdiv::v3_1_1::Far::warningFunc(__str);
  }
  else {
    return fprintf((FILE *)*MEMORY[0x263EF8358], "Warning: %s\n", __str);
  }
}

void OpenSubdiv::v3_1_1::Far::Error()
{
  __assert_rtn("Error", "error.cpp", 74, "err!=FAR_NO_ERROR");
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::FVarRefinement(void *this, const OpenSubdiv::v3_1_1::Vtr::internal::Refinement *a2, OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel *a3, OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel *a4)
{
  *this = a2;
  this[1] = *((void *)a2 + 1);
  this[2] = a3;
  this[3] = *((void *)a2 + 2);
  this[4] = a4;
  this[6] = 0;
  this[7] = 0;
  this[5] = 0;
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::~FVarRefinement(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  unint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::applyRefinement(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  *(_WORD *)(*((void *)this + 4) + 8) = *(_WORD *)(*((void *)this + 2) + 8);
  uint64_t v2 = *((void *)this + 2);
  uint64_t v3 = *((void *)this + 4);
  *(unsigned char *)(v3 + 12) = *(unsigned char *)(v2 + 12);
  *(_WORD *)(v3 + 13) = *(_WORD *)(v2 + 13);
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::estimateAndAllocateChildValues(this);
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValues(this);
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::trimAndFinalizeChildValues(this);
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateEdgeTags(this);
  OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags((int **)this);
  uint64_t v4 = *((void *)this + 4);
  if (!*(unsigned char *)(v4 + 13))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases(this);
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::reclassifySemisharpValues(this);
    uint64_t v4 = *((void *)this + 4);
  }
  if (*(_DWORD *)(v4 + 16) <= *(_DWORD *)(*((void *)this + 3) + 8))
  {
    return OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::initializeFaceValuesFromFaceVertices((void **)v4);
  }
  else
  {
    return OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::initializeFaceValuesFromVertexFaceSiblings((void *)v4);
  }
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::estimateAndAllocateChildValues(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  uint64_t v2 = *(void *)this;
  int v3 = *(_DWORD *)(*(void *)this + 52);
  uint64_t v4 = *(int *)(*(void *)this + 56);
  if ((int)v4 >= 1)
  {
    uint64_t v5 = *(int *)(v2 + 80);
    uint64_t v6 = v4 + v5;
    do
    {
      uint64_t v7 = *(int *)(*(void *)(v2 + 312) + 4 * v5);
      if (*(unsigned char *)(*(void *)(*((void *)this + 2) + 48) + v7)) {
        int v8 = *(_DWORD *)(*(void *)(*((void *)this + 1) + 144) + 8 * v7);
      }
      else {
        int v8 = 1;
      }
      v3 += v8;
      ++v5;
    }
    while (v5 < v6);
  }
  uint64_t v9 = *(int *)(v2 + 60);
  if ((int)v9 >= 1)
  {
    uint64_t v10 = *(int *)(v2 + 84);
    uint64_t v11 = v9 + v10;
    do
    {
      if (*(unsigned char *)(*(void *)(v2 + 384) + v10)) {
        OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::estimateAndAllocateChildValues();
      }
      v3 += *(unsigned __int16 *)(*(void *)(*((void *)this + 2) + 72)
                                + 2 * *(int *)(*(void *)(v2 + 312) + 4 * v10++));
    }
    while (v10 < v11);
  }
  OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::resizeComponents(*((std::vector<unsigned int> **)this + 4));
  uint64_t v12 = *((void *)this + 4);
  uint64_t v13 = *(void *)(v12 + 168);
  unint64_t v14 = *(void *)(v12 + 176) - v13;
  if (v3 <= v14)
  {
    if (v3 < v14) {
      *(void *)(v12 + 176) = v13 + v3;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)(v12 + 168), v3 - v14);
  }
  __int16 v15 = 0;
  std::vector<unsigned short>::resize((uint64_t)this + 40, v3, &v15);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValues(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  *(_DWORD *)(*((void *)this + 4) + 16) = 0;
  if (*(unsigned char *)(*(void *)this + 37))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromFaceVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromEdgeVertices((uint64_t)this);
    return OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromFaceVertices(this);
    return (void *)OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromEdgeVertices((uint64_t)this);
  }
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::trimAndFinalizeChildValues(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  uint64_t v2 = *((void *)this + 4);
  uint64_t v3 = *(void *)(v2 + 168);
  unint64_t v4 = *(int *)(v2 + 16);
  unint64_t v5 = *(void *)(v2 + 176) - v3;
  if (v4 <= v5)
  {
    if (v4 < v5) {
      *(void *)(v2 + 176) = v3 + v4;
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)(v2 + 168), v4 - v5);
    uint64_t v2 = *((void *)this + 4);
  }
  if (!*(unsigned char *)(v2 + 13))
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::FVarLevel::CreaseEndPair>::resize(v2 + 192, *(int *)(v2 + 16));
    uint64_t v2 = *((void *)this + 4);
  }
  std::vector<unsigned short>::resize((uint64_t)this + 40, *(int *)(v2 + 16));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 4) + 144), *(int *)(*((void *)this + 4) + 16));
  uint64_t v6 = *((void *)this + 4);
  if (*(int *)(v6 + 16) >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)(v6 + 144);
    do
    {
      *(_DWORD *)(v8 + 4 * v7) = v7;
      ++v7;
    }
    while (v7 < *(int *)(v6 + 16));
  }
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateEdgeTags(void *this)
{
  LODWORD(v1) = *(_DWORD *)(*this + 44);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = 0;
    do
      *(unsigned char *)(*(void *)(this[4] + 48) + v2++) = 0;
    while (v2 < *(int *)(*this + 44));
    LODWORD(v1) = *(_DWORD *)(*this + 44);
  }
  if ((int)v1 < *(_DWORD *)(this[3] + 4))
  {
    uint64_t v1 = (int)v1;
    do
    {
      *(unsigned char *)(*(void *)(this[4] + 48) + v1) = *(unsigned char *)(*(void *)(this[2] + 48)
                                                              + *(int *)(*(void *)(*this + 288) + 4 * v1));
      ++v1;
    }
    while (v1 < *(int *)(this[3] + 4));
  }
  return this;
}

int **OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags(int **this)
{
  uint64_t v1 = this;
  uint64_t v2 = *this;
  int v3 = (*this)[13];
  if (v3 >= 1)
  {
    int v4 = v2[19];
    int v5 = v3 + v4;
    uint64_t v6 = *(int *)(*((void *)this[4] + 12) + 4 * v4);
    do
    {
      *(unsigned char *)(*((void *)this[4] + 21) + v6) = 0;
      ++v4;
      ++v6;
    }
    while (v4 < v5);
    uint64_t v2 = *this;
  }
  uint64_t v7 = v2[14];
  if ((int)v7 >= 1)
  {
    uint64_t v8 = v2[20];
    uint64_t v9 = v7 + v8;
    if (*((unsigned char *)this[2] + 13)) {
      int v10 = 1;
    }
    else {
      int v10 = 9;
    }
    do
    {
      uint64_t v11 = v1[4];
      uint64_t v12 = *((void *)v11 + 9);
      if (*(_WORD *)(v12 + 2 * v8))
      {
        if ((*(unsigned char *)(*((void *)v1[2] + 6) + *(int *)(*((void *)*v1 + 39) + 4 * v8)) & 9) != 0) {
          int v13 = v10;
        }
        else {
          int v13 = 0;
        }
        this = (int **)memset((void *)(*((void *)v11 + 21) + *(int *)(*((void *)v11 + 12) + 4 * v8)), v13, *(unsigned __int16 *)(v12 + 2 * v8));
      }
      ++v8;
    }
    while (v8 < v9);
    uint64_t v2 = *v1;
  }
  uint64_t v14 = v2[15];
  if ((int)v14 >= 1)
  {
    uint64_t v15 = v2[21];
    uint64_t v16 = v14 + v15;
    do
    {
      if (*(unsigned char *)(*((void *)*v1 + 48) + v15)) {
        OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags();
      }
      uint64_t v17 = *(int *)(*((void *)*v1 + 39) + 4 * v15);
      this = (int **)memcpy((void *)(*((void *)v1[4] + 21) + *(int *)(*((void *)v1[4] + 12) + 4 * v15++)), (const void *)(*((void *)v1[2] + 21) + *(int *)(*((void *)v1[2] + 12) + 4 * v17)), *(unsigned __int16 *)(*((void *)v1[2] + 9) + 2 * v17));
    }
    while (v15 < v16);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases(void *this)
{
  uint64_t v1 = this[4];
  if (*(unsigned char *)(v1 + 13)) {
    OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases();
  }
  uint64_t v2 = *this;
  if (*(_DWORD *)(*this + 32) == 4) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 3;
  }
  uint64_t v4 = *(int *)(v2 + 56);
  if ((int)v4 >= 1)
  {
    uint64_t v5 = *(int *)(v2 + 80);
    uint64_t v6 = v4 + v5;
    uint64_t v7 = *(void *)(v1 + 72);
    uint64_t v8 = *(void *)(v1 + 96);
    uint64_t v9 = *(void *)(v1 + 168);
    do
    {
      uint64_t v10 = *(int *)(v8 + 4 * v5);
      uint64_t v11 = (char *)(v9 + v10);
      if ((*(unsigned char *)(v9 + v10) & 1) != 0 && (*(unsigned char *)(*(void *)(v2 + 384) + v5) & 1) == 0)
      {
        uint64_t v12 = *(unsigned __int16 *)(v7 + 2 * v5);
        if (*(_WORD *)(v7 + 2 * v5))
        {
          __int16 v13 = 0;
          uint64_t v14 = (_WORD *)(*(void *)(v1 + 192) + 4 * v10 + 2);
          do
          {
            char v15 = *v11++;
            if ((v15 & 0x18) != 0)
            {
              *(v14 - 1) = v13;
              *uint64_t v14 = v3 - 1 + v13;
            }
            v13 += v3;
            v14 += 2;
            --v12;
          }
          while (v12);
        }
      }
      ++v5;
    }
    while (v5 < v6);
  }
  uint64_t v16 = *(int *)(v2 + 60);
  if ((int)v16 >= 1)
  {
    uint64_t v17 = *(int *)(v2 + 84);
    uint64_t v18 = v16 + v17;
    do
    {
      uint64_t v19 = (void *)this[4];
      uint64_t v20 = *(int *)(v19[12] + 4 * v17);
      uint64_t v21 = (char *)(v19[21] + v20);
      if ((*v21 & 1) != 0 && (*(unsigned char *)(*(void *)(*this + 384) + v17) & 1) == 0)
      {
        uint64_t v22 = *(unsigned __int16 *)(v19[9] + 2 * v17);
        if (*(_WORD *)(v19[9] + 2 * v17))
        {
          __int16 v23 = (_DWORD *)(*(void *)(this[2] + 192)
                         + 4
                         * *(int *)(*(void *)(this[2] + 96) + 4 * *(int *)(*(void *)(*this + 312) + 4 * v17)));
          uint64_t v24 = (_DWORD *)(v19[24] + 4 * v20);
          do
          {
            char v25 = *v21++;
            if ((v25 & 0x18) != 0) {
              *uint64_t v24 = *v23;
            }
            ++v24;
            ++v23;
            --v22;
          }
          while (v22);
        }
      }
      ++v17;
    }
    while (v17 < v18);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::reclassifySemisharpValues(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this)
{
  uint64_t v2 = 0;
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v3 = *(unsigned __int8 *)(*((void *)this + 2) + 14);
  uint64_t v4 = *(unsigned int *)(*((void *)this + 3) + 20);
  __int16 v40 = &v41;
  __p = 0;
  if (v4 >= 0x11)
  {
    uint64_t v2 = operator new(4 * v4);
    __p = v2;
    __int16 v40 = (uint64_t *)v2;
  }
  uint64_t v5 = *(int *)(*(void *)this + 60);
  if ((int)v5 >= 1)
  {
    uint64_t v6 = *(int *)(*(void *)this + 84);
    uint64_t v7 = v5 + v6;
    while (1)
    {
      uint64_t v8 = (void *)*((void *)this + 4);
      uint64_t v9 = *(int *)(v8[12] + 4 * v6);
      uint64_t v10 = (char *)(v8[21] + v9);
      if ((*v10 & 1) == 0) {
        goto LABEL_9;
      }
      uint64_t v11 = *(void *)this;
      if (*(unsigned char *)(*(void *)(*(void *)this + 384) + v6)) {
        goto LABEL_9;
      }
      uint64_t v12 = *(int *)(*(void *)(v11 + 312) + 4 * v6);
      __int16 v13 = (void *)*((void *)this + 1);
      if ((*(_WORD *)(v13[54] + 2 * v12) & 0x60) == 0) {
        goto LABEL_9;
      }
      uint64_t v14 = (void *)*((void *)this + 3);
      __int16 v15 = *(_WORD *)(v14[54] + 2 * v6);
      if ((v15 & 0x30) != 0) {
        goto LABEL_9;
      }
      uint64_t v16 = *(unsigned __int16 *)(v8[9] + 2 * v6);
      if ((v15 & 0x40) == 0)
      {
        if (*(_WORD *)(v8[9] + 2 * v6))
        {
          do
          {
            if ((*v10 & 0x10) != 0) {
              char *v10 = *v10 & 0xC7 | 8;
            }
            ++v10;
            --v16;
          }
          while (v16);
        }
        goto LABEL_9;
      }
      uint64_t v17 = v8[24];
      uint64_t v18 = v14[45];
      if (((v14[46] - v18) & 0x3FFFFFFFCLL) != 0)
      {
        uint64_t v20 = v14[42];
        uint64_t v19 = (uint64_t *)(v18 + 4 * *(int *)(v20 + 8 * v6 + 4));
        LODWORD(v20) = *(_DWORD *)(v20 + 8 * (int)v6);
      }
      else
      {
        uint64_t v21 = v13[42];
        uint64_t v20 = *(unsigned int *)(v21 + 8 * v12);
        uint64_t v19 = v40;
        if ((int)v20 >= 1)
        {
          uint64_t v22 = 0;
          uint64_t v23 = *(int *)(v21 + 8 * v12 + 4);
          uint64_t v24 = v13[45] + 4 * v23;
          uint64_t v25 = v13[48] + 2 * v23;
          uint64_t v26 = *(void *)(v11 + 192);
          do
          {
            *((_DWORD *)v40 + v22) = *(_DWORD *)(v26
                                               + 8 * *(int *)(v24 + 4 * v22)
                                               + 4 * *(unsigned __int16 *)(v25 + 2 * v22));
            ++v22;
          }
          while (v20 != v22);
        }
      }
      if (v16) {
        break;
      }
LABEL_9:
      if (++v6 >= v7)
      {
        uint64_t v2 = __p;
        goto LABEL_51;
      }
    }
    uint64_t v27 = 0;
    uint64_t v28 = v17 + 4 * v9;
    while (1)
    {
      char v29 = v10[v27];
      if ((v29 & 0x30) == 0x10)
      {
        uint64_t v30 = (unsigned __int16 *)(v28 + 4 * v27);
        uint64_t v31 = *v30;
        unint64_t v32 = v30[1];
        if (v32 <= v31)
        {
          if (v31 <= v32) {
            goto LABEL_41;
          }
          if ((int)v31 + 1 < (int)v20)
          {
            do
            {
              char v36 = *(unsigned char *)(*(void *)(*((void *)this + 3) + 240) + *((int *)v19 + v31 + 1));
              if ((v36 & 8) != 0) {
                break;
              }
              uint64_t v37 = v31 + 2;
              ++v31;
            }
            while (v37 < (int)v20);
            if ((v36 & 8) != 0) {
              goto LABEL_42;
            }
          }
          unint64_t v38 = 0;
          do
          {
            char v34 = *(unsigned char *)(*(void *)(*((void *)this + 3) + 240) + *((int *)v19 + v38));
            if ((v34 & 8) != 0) {
              break;
            }
            BOOL v35 = v38++ >= v32;
          }
          while (!v35);
        }
        else
        {
          unint64_t v33 = v31 + 1;
          do
          {
            char v34 = *(unsigned char *)(*(void *)(*((void *)this + 3) + 240) + *((int *)v19 + v33));
            if ((v34 & 8) != 0) {
              break;
            }
            BOOL v35 = v33++ >= v32;
          }
          while (!v35);
        }
        if ((v34 & 8) == 0) {
LABEL_41:
        }
          v10[v27] = v29 & 0xC7 | 8;
      }
LABEL_42:
      if (++v27 == v16)
      {
        if (v3 && v16 == 2)
        {
          char v39 = *v10;
          if ((*v10 & 0x20) != 0 && (v10[1] & 0x10) == 0)
          {
LABEL_50:
            char *v10 = v39 & 0xDF;
          }
          else if ((*v10 & 0x10) == 0 && (v10[1] & 0x20) != 0)
          {
            char v39 = *++v10;
            goto LABEL_50;
          }
        }
        goto LABEL_9;
      }
    }
  }
LABEL_51:
  operator delete(v2);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromFaceVertices(void *this)
{
  uint64_t v1 = *(int *)(*this + 52);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = *(int *)(*this + 76);
    uint64_t v3 = v1 + v2;
    uint64_t v4 = this[4];
    uint64_t v5 = *(void *)(v4 + 96);
    uint64_t v6 = *(void *)(v4 + 72);
    int v7 = *(_DWORD *)(v4 + 16);
    do
    {
      *(_DWORD *)(v5 + 4 * v2) = v7;
      *(_WORD *)(v6 + 2 * v2) = 1;
      int v7 = *(_DWORD *)(v4 + 16) + 1;
      *(_DWORD *)(v4 + 16) = v7;
      ++v2;
    }
    while (v2 < v3);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromEdgeVertices(uint64_t this)
{
  uint64_t v1 = *(int *)(*(void *)this + 56);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = (OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *)this;
    uint64_t v3 = *(int *)(*(void *)this + 80);
    uint64_t v4 = v1 + v3;
    uint64_t v5 = *(void *)(this + 32);
    do
    {
      uint64_t v6 = *(int *)(*(void *)(*(void *)v2 + 312) + 4 * v3);
      *(_DWORD *)(*(void *)(v5 + 96) + 4 * v3) = *(_DWORD *)(v5 + 16);
      if (*(unsigned char *)(*(void *)(*((void *)v2 + 2) + 48) + v6))
      {
        this = OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex(v2, v3, v6);
        uint64_t v5 = *((void *)v2 + 4);
        uint64_t v7 = *(void *)(v5 + 72);
      }
      else
      {
        uint64_t v7 = *(void *)(v5 + 72);
        this = 1;
      }
      *(_WORD *)(v7 + 2 * v3) = this;
      *(_DWORD *)(v5 + 16) += this;
      ++v3;
    }
    while (v3 < v4);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices(void *this)
{
  uint64_t v1 = *this;
  uint64_t v2 = *(int *)(*this + 60);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = *(int *)(v1 + 84);
    uint64_t v4 = v2 + v3;
    uint64_t v5 = *(void *)(v1 + 312);
    uint64_t v6 = this[4];
    uint64_t v7 = *(void *)(v6 + 96);
    uint64_t v8 = (void *)this[2];
    uint64_t v9 = v8[12];
    uint64_t v10 = v8[21];
    int v11 = *(_DWORD *)(v6 + 16);
    do
    {
      uint64_t v12 = *(int *)(v5 + 4 * v3);
      *(_DWORD *)(v7 + 4 * v3) = v11;
      if (*(unsigned char *)(v10 + *(int *)(v9 + 4 * v12)))
      {
        if (*(unsigned char *)(*(void *)(v1 + 384) + v3)) {
          OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices();
        }
        unint64_t v13 = *(unsigned __int16 *)(v8[9] + 2 * v12);
        if (v13 >= 2)
        {
          uint64_t v14 = this[5] + 2 * v11;
          for (uint64_t i = 1; i != v13; ++i)
            *(_WORD *)(v14 + 2 * i) = i;
          uint64_t v16 = *(void *)(*(void *)v6 + 264);
          uint64_t v17 = *(unsigned int *)(v16 + 8 * v3);
          if ((int)v17 >= 1)
          {
            uint64_t v18 = (__int16 *)(v8[15] + 2 * *(int *)(*(void *)(*v8 + 264) + 4 * (int)((2 * v12) | 1)));
            uint64_t v19 = (_WORD *)(*(void *)(v6 + 120) + 2 * *(int *)(v16 + 8 * (int)v3 + 4));
            do
            {
              __int16 v20 = *v18++;
              *v19++ = v20;
              --v17;
            }
            while (v17);
          }
        }
      }
      else
      {
        LODWORD(v13) = 1;
      }
      *(_WORD *)(*(void *)(v6 + 72) + 2 * v3) = v13;
      int v11 = *(_DWORD *)(v6 + 16) + v13;
      *(_DWORD *)(v6 + 16) = v11;
      ++v3;
    }
    while (v3 < v4);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this, int a2, int a3)
{
  uint64_t v4 = *((void *)this + 1);
  uint64_t v5 = *(void *)(v4 + 144);
  uint64_t result = *(unsigned int *)(v5 + 8 * a3);
  if (result != 1)
  {
    uint64_t v7 = *(void *)(v4 + 168);
    uint64_t v8 = *(int *)(v5 + 8 * a3 + 4);
    uint64_t v9 = (void *)*((void *)this + 4);
    if ((int)result >= 1)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *((void *)this + 5) + 2 * *(int *)(v9[12] + 4 * a2);
      do
      {
        *(_WORD *)(v11 + 2 * v10) = v10;
        ++v10;
      }
      while (result != v10);
    }
    uint64_t v12 = *((void *)this + 3);
    uint64_t v13 = *(void *)(v12 + 264);
    uint64_t v14 = *(unsigned int *)(v13 + 8 * a2);
    uint64_t v15 = *(void *)(*v9 + 264);
    if (v14 != *(_DWORD *)(v15 + 8 * a2)) {
      OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex();
    }
    if ((int)v14 < (int)result) {
      OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex();
    }
    if ((int)v14 >= 1)
    {
      uint64_t v16 = 0;
      uint64_t v17 = v7 + 4 * v8;
      uint64_t v18 = *(void *)(v12 + 288);
      uint64_t v19 = (8 * a2) | 4;
      uint64_t v20 = v18 + 4 * *(int *)(v13 + v19);
      uint64_t v21 = v9[15] + 2 * *(int *)(v15 + v19);
      uint64_t v22 = *(void *)(*(void *)this + 264);
      do
      {
        int v23 = *(_DWORD *)(v22 + 4 * *(int *)(v20 + 4 * v16));
        if (result == 2)
        {
          if (v23 == *(_DWORD *)(v17 + 4)) {
            *(_WORD *)(v21 + 2 * v16) = 1;
          }
        }
        else if ((int)result >= 1)
        {
          for (uint64_t i = 0; i != result; ++i)
          {
            if (v23 == *(_DWORD *)(v17 + 4 * i)) {
              *(_WORD *)(v21 + 2 * v16) = i;
            }
          }
        }
        ++v16;
      }
      while (v16 != v14);
    }
  }
  return result;
}

float OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::getFractionalWeight(OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement *this, int a2, unsigned int a3, int a4)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v6 = (int *)v65;
  int v63 = v65;
  uint64_t v64 = 0x1000000000;
  unint64_t v66 = 0;
  uint64_t v7 = *((void *)this + 1);
  uint64_t v8 = *(void *)(v7 + 360);
  uint64_t v9 = a2;
  uint64_t v10 = (2 * a2) | 1;
  uint64_t v11 = *(void *)(v7 + 336);
  uint64_t v12 = *(int *)(v11 + 4 * v10);
  uint64_t v13 = (int *)(v8 + 4 * v12);
  uint64_t v14 = *(unsigned int *)(v11 + 8 * a2);
  uint64_t v15 = (void *)*((void *)this + 3);
  uint64_t v16 = v15[45];
  if (((v15[46] - v16) & 0x3FFFFFFFCLL) != 0)
  {
    uint64_t v6 = (int *)(v16 + 4 * *(int *)(v15[42] + 8 * a4 + 4));
    goto LABEL_11;
  }
  if (!v14)
  {
    uint64_t v18 = a2;
    operator delete(0);
    uint64_t v9 = v18;
    uint64_t v64 = 0x1000000000;
    uint64_t v19 = (float *)v61;
    unint64_t v58 = (float *)v61;
    int v59 = 0;
    int v60 = 32;
    int v62 = 0;
    int v63 = v65;
    goto LABEL_13;
  }
  if (v14 <= 0x10)
  {
    LODWORD(v64) = v14;
    uint64_t v17 = *(void *)(*((void *)this + 1) + 384)
        + 2 * *(int *)(*(void *)(*((void *)this + 1) + 336) + 4 * v10);
  }
  else
  {
    uint64_t v55 = a2;
    operator delete(0);
    uint64_t v6 = (int *)operator new(4 * v14);
    unint64_t v66 = v6;
    int v63 = v6;
    LODWORD(v64) = v14;
    HIDWORD(v64) = v14;
    if ((int)v14 < 1)
    {
      uint64_t v9 = v55;
      goto LABEL_11;
    }
    uint64_t v17 = *(void *)(*((void *)this + 1) + 384)
        + 2 * *(int *)(*(void *)(*((void *)this + 1) + 336) + 4 * v10);
    uint64_t v9 = v55;
  }
  uint64_t v20 = 0;
  uint64_t v21 = *(void *)(*(void *)this + 192);
  do
  {
    v6[v20] = *(_DWORD *)(v21 + 8 * v13[v20] + 4 * *(unsigned __int16 *)(v17 + 2 * v20));
    ++v20;
  }
  while (v14 != v20);
LABEL_11:
  uint64_t v19 = (float *)v61;
  unint64_t v58 = (float *)v61;
  int v59 = 2 * v14;
  int v60 = 32;
  int v62 = 0;
  if ((2 * v14) >= 0x21)
  {
    unsigned int v22 = a3;
    uint64_t v23 = v9;
    uint64_t v24 = (float *)operator new(4 * (2 * v14));
    uint64_t v9 = v23;
    a3 = v22;
    uint64_t v19 = v24;
    int v62 = v24;
    unint64_t v58 = v24;
    int v60 = 2 * v14;
  }
LABEL_13:
  uint64_t v25 = (unsigned __int16 *)(*(void *)(*((void *)this + 2) + 192)
                           + 4 * *(int *)(*(void *)(*((void *)this + 2) + 96) + 4 * v9)
                           + 4 * a3);
  uint64_t v26 = *v25;
  uint64_t v27 = v25[1];
  uint64_t v28 = (v27 - v26);
  if (v27 <= v26)
  {
    uint64_t v29 = *((void *)this + 1);
    if (v26 <= v27)
    {
      LODWORD(v28) = 0;
      uint64_t v31 = *((void *)this + 3);
    }
    else
    {
      uint64_t v39 = *(void *)(v29 + 216);
      uint64_t v31 = *((void *)this + 3);
      uint64_t v40 = *(void *)(v31 + 216);
      if ((int)v26 + 1 >= (int)v14)
      {
        uint64_t v41 = 0;
      }
      else
      {
        uint64_t v41 = (v14 + ~v26);
        int v42 = (int *)(4 * v12 + 4 * v26 + v8 + 4);
        uint64_t v43 = &v6[v26 + 1];
        uint64_t v44 = v41;
        uint64_t v45 = v19;
        do
        {
          uint64_t v46 = *v42++;
          *uint64_t v45 = *(float *)(v39 + 4 * v46);
          uint64_t v47 = *v43++;
          v45[(int)v14] = *(float *)(v40 + 4 * v47);
          ++v45;
          --v44;
        }
        while (v44);
      }
      uint64_t v48 = v27 + 1;
      int v49 = &v19[v41];
      LODWORD(v28) = v27 + v41 + 1;
      do
      {
        uint64_t v50 = *v13++;
        float *v49 = *(float *)(v39 + 4 * v50);
        uint64_t v51 = *v6++;
        v49[(int)v14] = *(float *)(v40 + 4 * v51);
        ++v49;
        --v48;
      }
      while (v48);
    }
  }
  else
  {
    uint64_t v29 = *((void *)this + 1);
    uint64_t v30 = *(void *)(v29 + 216);
    uint64_t v31 = *((void *)this + 3);
    uint64_t v32 = *(void *)(v31 + 216);
    unint64_t v33 = &v6[v26 + 1];
    char v34 = (int *)(4 * v12 + 4 * v26 + v8 + 4);
    uint64_t v35 = v28;
    char v36 = v19;
    do
    {
      uint64_t v37 = *v34++;
      *char v36 = *(float *)(v30 + 4 * v37);
      uint64_t v38 = *v33++;
      v36[(int)v14] = *(float *)(v32 + 4 * v38);
      ++v36;
      --v35;
    }
    while (v35);
  }
  int v57 = *(_DWORD *)(*(void *)this + 24);
  double v52 = OpenSubdiv::v3_1_1::Sdc::Crease::ComputeFractionalWeightAtVertex((OpenSubdiv::v3_1_1::Sdc::Crease *)&v57, *(float *)(*(void *)(v29 + 408) + 4 * v9), *(float *)(*(void *)(v31 + 408) + 4 * a4), v28, v19, &v19[(int)v14]);
  float v53 = *(float *)&v52;
  operator delete(v62);
  operator delete(v66);
  return v53;
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::estimateAndAllocateChildValues()
{
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueTags()
{
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::propagateValueCreases()
{
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesFromVertexVertices()
{
}

void OpenSubdiv::v3_1_1::Vtr::internal::FVarRefinement::populateChildValuesForEdgeVertex()
{
  __assert_rtn("populateChildValuesForEdgeVertex", "fvarRefinement.cpp", 221, "cVertFaces.size() >= cValueCount");
}

{
  __assert_rtn("populateChildValuesForEdgeVertex", "fvarRefinement.cpp", 220, "cVertFaces.size() == cVertFaceSiblings.size()");
}

double OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::TriRefinement(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4 = (void *)OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement(a1, a2, a3, a4);
  *uint64_t v4 = &unk_26BF6C6C8;
  v4[65] = 0;
  v4[63] = 0;
  v4[64] = 0;
  *(void *)&double result = 0x300000001;
  *(void *)((char *)v4 + 28) = 0x300000001;
  return result;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::~TriRefinement(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  *(void *)this = &unk_26BF6C6C8;
  uint64_t v2 = (void *)*((void *)this + 63);
  if (v2)
  {
    *((void *)this + 64) = v2;
    operator delete(v2);
  }

  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::~Refinement(this);
}

{
  uint64_t vars8;

  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::~TriRefinement(this);

  JUMPOUT(0x210534FE0);
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::allocateParentChildIndices(std::vector<int> *this)
{
  std::vector<int>::pointer end = this->__end_;
  uint64_t v4 = *((void *)end + 9);
  uint64_t v3 = *((void *)end + 10);
  uint64_t v6 = *((void *)end + 15);
  uint64_t v5 = *((void *)end + 16);
  uint64_t v8 = *end;
  std::vector<int>::size_type v7 = end[1];
  std::vector<int>::size_type v9 = end[2];
  std::vector<int>::value_type __x = 4;
  std::vector<int>::resize(this + 21, 2 * v8, &__x);
  std::vector<int>::pointer v10 = this->__end_;
  std::vector<int>::pointer begin = this[21].__begin_;
  if (*v10 >= 1)
  {
    int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = begin + 1;
    do
    {
      *uint64_t v14 = v12;
      v14 += 2;
      ++v13;
      v12 += 4;
    }
    while (v13 < *v10);
  }
  unint64_t v15 = (unint64_t)((char *)this[21].__end_ - (char *)begin) >> 2;
  this[3].__end_cap_.__value_ = begin;
  LODWORD(this[4].__begin_) = v15;
  uint64_t v16 = (int *)*((void *)v10 + 3);
  uint64_t v17 = (*((void *)v10 + 4) - (void)v16) >> 2;
  this[4].__end_ = v16;
  LODWORD(this[4].__end_cap_.__value_) = v17;
  std::vector<int>::value_type v18 = 0;
  std::vector<int>::resize(this + 5, 4 * v8, &v18);
  std::vector<int>::resize(this + 6, (int)((v3 - v4) >> 2), &v18);
  std::vector<int>::resize(this + 8, (int)((v5 - v6) >> 2), &v18);
  std::vector<int>::resize(this + 7, 0, &v18);
  std::vector<int>::resize(this + 9, v7, &v18);
  std::vector<int>::resize(this + 10, v9, &v18);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  uint64_t v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexCountsAndOffsets(this);
    uint64_t v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  }
  std::vector<int>::resize(v2 + 2, 3 * SLODWORD(v2->__begin_));

  return OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces(this);
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexCountsAndOffsets(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  uint64_t v2 = (std::vector<int> *)*((void *)this + 2);
  uint64_t begin_low = SLODWORD(v2->__begin_);
  std::vector<int>::value_type __x = 3;
  std::vector<int>::resize(v2 + 1, 2 * begin_low, &__x);
  uint64_t v4 = (int *)*((void *)this + 2);
  if (*v4 >= 1)
  {
    int v5 = 0;
    uint64_t v6 = 0;
    std::vector<int>::size_type v7 = (_DWORD *)(*((void *)v4 + 3) + 4);
    do
    {
      _DWORD *v7 = v5;
      v7 += 2;
      ++v6;
      v5 += 3;
    }
    while (v6 < *v4);
  }
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces(void *this)
{
  uint64_t v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)v1 + 6);
    uint64_t v4 = *((void *)v1 + 9);
    uint64_t v5 = this[15];
    uint64_t v6 = (int *)(this[11] + 4);
    std::vector<int>::size_type v7 = (int *)(*((void *)v1 + 3) + 4);
    do
    {
      if (*(v7 - 1) != 3) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces();
      }
      if (*(v6 - 1) != 4) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces();
      }
      uint64_t v8 = *v7;
      std::vector<int>::size_type v9 = (int *)(v3 + 4 * v8);
      std::vector<int>::pointer v10 = (int *)(v4 + 4 * v8);
      uint64_t v11 = this[27];
      int v12 = *(_DWORD *)(v11 + 4 * *v10);
      int v13 = *(_DWORD *)(v11 + 4 * v10[1]);
      uint64_t v14 = (_DWORD *)(v5 + 4 * *v6);
      int v15 = *(_DWORD *)(v11 + 4 * v10[2]);
      if (*v14 != -1)
      {
        uint64_t v16 = (_DWORD *)(*(void *)(this[2] + 48)
                       + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * *v14) | 1)));
        *uint64_t v16 = *(_DWORD *)(this[30] + 4 * *v9);
        v16[1] = v12;
        v16[2] = v15;
      }
      int v17 = v14[1];
      if (v17 != -1)
      {
        std::vector<int>::value_type v18 = (_DWORD *)(*(void *)(this[2] + 48)
                       + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v17) | 1)));
        *std::vector<int>::value_type v18 = v12;
        v18[1] = *(_DWORD *)(this[30] + 4 * v9[1]);
        v18[2] = v13;
      }
      int v19 = v14[2];
      if (v19 != -1)
      {
        uint64_t v20 = (_DWORD *)(*(void *)(this[2] + 48)
                       + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v19) | 1)));
        *uint64_t v20 = v15;
        v20[1] = v13;
        v20[2] = *(_DWORD *)(this[30] + 4 * v9[2]);
      }
      int v21 = v14[3];
      if (v21 != -1)
      {
        unsigned int v22 = (_DWORD *)(*(void *)(this[2] + 48)
                       + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v21) | 1)));
        *unsigned int v22 = v13;
        v22[1] = v15;
        v22[2] = v12;
      }
      v7 += 2;
      ++v2;
      v6 += 2;
    }
    while (v2 < *v1);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  uint64_t v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVertexCountsAndOffsets(this);
    uint64_t v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  }
  std::vector<int>::resize(v2 + 3, 3 * SLODWORD(v2->__begin_));

  return OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces(this);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces(void *this)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)v1 + 3);
    uint64_t v4 = *((void *)v1 + 6);
    uint64_t v5 = *((void *)v1 + 9);
    uint64_t v6 = this[11];
    uint64_t v7 = this[15];
    uint64_t v8 = this[13];
    uint64_t v9 = this[18];
    do
    {
      if (*(_DWORD *)(v6 + 8 * v2) != 4) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces();
      }
      if (*(_DWORD *)(v8 + 8 * v2) != 3) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces();
      }
      uint64_t v10 = (8 * v2) | 4;
      uint64_t v11 = *(int *)(v3 + v10);
      int v12 = (_DWORD *)(v4 + 4 * v11);
      int v13 = (int *)(v5 + 4 * v11);
      uint64_t v14 = (_DWORD *)(v7 + 4 * *(int *)(v6 + v10));
      int v15 = (_DWORD *)(v9 + 4 * *(int *)(v8 + v10));
      uint64_t v16 = this[24];
      uint64_t v17 = *((void *)v1 + 15);
      for (uint64_t i = 4; i != 28; i += 8)
      {
        uint64_t v20 = *v13++;
        uint64_t v19 = v20;
        int v21 = (_DWORD *)(v17 + 8 * v20);
        BOOL v22 = *v21 != v21[1] && *v12 != *v21;
        uint64_t v23 = v16 + 8 * v19;
        int v24 = *(_DWORD *)(v23 + 4 * v22);
        uint64_t v25 = (int *)((char *)&v34 + i);
        LODWORD(v23) = *(_DWORD *)(v23 + 4 * !v22);
        *(v25 - 1) = v24;
        *uint64_t v25 = v23;
        ++v12;
      }
      if (*v14 != -1)
      {
        uint64_t v26 = (_DWORD *)(*(void *)(this[2] + 72)
                       + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * *v14) | 1)));
        int v27 = v37;
        *uint64_t v26 = v34;
        v26[1] = *v15;
        v26[2] = v27;
      }
      int v28 = v14[1];
      if (v28 != -1)
      {
        uint64_t v29 = *(void *)(this[2] + 72) + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v28) | 1));
        *(void *)uint64_t v29 = v35;
        *(_DWORD *)(v29 + 8) = v15[1];
      }
      int v30 = v14[2];
      if (v30 != -1)
      {
        uint64_t v31 = *(void *)(this[2] + 72) + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v30) | 1));
        *(_DWORD *)uint64_t v31 = v15[2];
        *(void *)(v31 + 4) = v36;
      }
      int v32 = v14[3];
      if (v32 != -1)
      {
        unint64_t v33 = (_DWORD *)(*(void *)(this[2] + 72)
                       + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v32) | 1)));
        *unint64_t v33 = v15[2];
        v33[1] = *v15;
        v33[2] = v15[1];
      }
      ++v2;
    }
    while (v2 < *v1);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 120), 2 * *(int *)(*((void *)this + 2) + 4));
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces(this);

  return OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentEdges(this);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces(void *this)
{
  uint64_t v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *((void *)v1 + 9);
    uint64_t v4 = this[18];
    uint64_t v5 = (int *)(this[13] + 4);
    uint64_t v6 = (int *)(*((void *)v1 + 3) + 4);
    do
    {
      if (*(v6 - 1) != 3) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces();
      }
      if (*(v5 - 1) != 3) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces();
      }
      uint64_t v7 = (int *)(v3 + 4 * *v6);
      uint64_t v8 = this[27];
      int v9 = *(_DWORD *)(v8 + 4 * *v7);
      int v10 = *(_DWORD *)(v8 + 4 * v7[1]);
      uint64_t v11 = (int *)(v4 + 4 * *v5);
      int v12 = *(_DWORD *)(v8 + 4 * v7[2]);
      uint64_t v13 = *v11;
      if (v13 != -1)
      {
        uint64_t v14 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v13);
        *uint64_t v14 = v9;
        v14[1] = v12;
      }
      uint64_t v15 = v11[1];
      if (v15 != -1)
      {
        uint64_t v16 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v15);
        *uint64_t v16 = v10;
        v16[1] = v9;
      }
      uint64_t v17 = v11[2];
      if (v17 != -1)
      {
        std::vector<int>::value_type v18 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v17);
        *std::vector<int>::value_type v18 = v12;
        v18[1] = v10;
      }
      v6 += 2;
      ++v2;
      v5 += 2;
    }
    while (v2 < *v1);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (int *)(this[24] + 4);
    uint64_t v4 = (int *)(*(void *)(v1 + 120) + 4);
    do
    {
      uint64_t v5 = *(v3 - 1);
      if (v5 != -1)
      {
        uint64_t v6 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v5);
        *uint64_t v6 = *(_DWORD *)(this[27] + 4 * v2);
        v6[1] = *(_DWORD *)(this[30] + 4 * *(v4 - 1));
      }
      uint64_t v7 = *v3;
      if (v7 != -1)
      {
        uint64_t v8 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v7);
        _DWORD *v8 = *(_DWORD *)(this[27] + 4 * v2);
        v8[1] = *(_DWORD *)(this[30] + 4 * *v4);
      }
      ++v2;
      v3 += 2;
      v4 += 2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  int v2 = 2
     * (((*(void *)(*((void *)this + 1) + 176) - *(void *)(*((void *)this + 1) + 168)) >> 2)
      + ((*((void *)this + 19) - *((void *)this + 18)) >> 2));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 144), 2 * *(int *)(*((void *)this + 2) + 4));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 168), v2);
  std::vector<unsigned short>::resize(*((void *)this + 2) + 192, v2);
  *(_DWORD *)(*((void *)this + 2) + 16) = *(_DWORD *)(*((void *)this + 1) + 16);
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces(this);
  OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentEdges(this);
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = (int *)(*(void *)(v3 + 144) + 4 * (2 * *(_DWORD *)(v3 + 4) - 2));
  std::vector<unsigned int>::size_type v5 = v4[1] + (uint64_t)*v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v3 + 168), v5);
  uint64_t v6 = *((void *)this + 2) + 192;

  std::vector<unsigned short>::resize(v6, v5);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces(void *this)
{
  uint64_t v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = this[11];
    uint64_t v4 = this[15];
    uint64_t v5 = this[13];
    uint64_t v6 = this[18];
    do
    {
      if (*(_DWORD *)(v3 + 8 * v2) != 4) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces();
      }
      if (*(_DWORD *)(v5 + 8 * v2) != 3) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces();
      }
      uint64_t v7 = 0;
      uint64_t v8 = (8 * v2) | 4;
      uint64_t v9 = v4 + 4 * *(int *)(v3 + v8);
      uint64_t v10 = v6 + 4 * *(int *)(v5 + v8);
      int v11 = *(_DWORD *)(v9 + 12);
      unsigned int v12 = 1;
      do
      {
        uint64_t v13 = *(int *)(v10 + v7);
        if (v13 != -1)
        {
          uint64_t v14 = this[2];
          uint64_t v15 = *(void *)(v14 + 144);
          uint64_t v16 = (_DWORD *)(v15 + 8 * v13);
          *uint64_t v16 = 2;
          if (v13) {
            int v17 = *(v16 - 1) + *(v16 - 2);
          }
          else {
            int v17 = 0;
          }
          unsigned int v18 = v12 % 3;
          int v19 = 2 * v13;
          v16[1] = v17;
          int v20 = *(_DWORD *)(v14 + 16);
          if (v20 <= 2) {
            int v20 = 2;
          }
          *(_DWORD *)(v14 + 16) = v20;
          uint64_t v21 = *(int *)(v15 + 4 * (v19 | 1));
          BOOL v22 = (_DWORD *)(*(void *)(v14 + 168) + 4 * v21);
          uint64_t v23 = (_WORD *)(*(void *)(v14 + 192) + 2 * v21);
          int v24 = *(_DWORD *)(v9 + v7);
          if (v24 == -1)
          {
            uint64_t v25 = 0;
          }
          else
          {
            *BOOL v22 = v24;
            *uint64_t v23 = v18;
            uint64_t v25 = 1;
          }
          if (v11 != -1)
          {
            v22[v25] = v11;
            v23[v25] = v18;
            LODWORD(v25) = v25 + 1;
          }
          *uint64_t v16 = v25;
        }
        ++v12;
        v7 += 4;
      }
      while (v7 != 12);
      ++v2;
    }
    while (v2 < *v1);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[24];
    do
    {
      uint64_t v5 = (_DWORD *)(v4 + 8 * v3);
      if (*v5 != -1 || v5[1] != -1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = *(void *)(v1 + 144);
        uint64_t v8 = *(int *)(v7 + ((8 * v3) | 4));
        uint64_t v9 = *(unsigned int *)(v7 + 8 * v3);
        uint64_t v10 = *(void *)(v1 + 168) + 4 * v8;
        uint64_t v11 = *(void *)(v1 + 192) + 2 * v8;
        unsigned int v12 = (_DWORD *)(*(void *)(v1 + 120) + 8 * v3);
        char v13 = 1;
        do
        {
          char v14 = v13;
          uint64_t v15 = (int)v5[v6];
          if (v15 != -1)
          {
            uint64_t v16 = this[2];
            uint64_t v17 = *(void *)(v16 + 144);
            unsigned int v18 = (_DWORD *)(v17 + 8 * v15);
            *unsigned int v18 = v9;
            if (v15) {
              int v19 = *(v18 - 1) + *(v18 - 2);
            }
            else {
              int v19 = 0;
            }
            v18[1] = v19;
            int v20 = *(_DWORD *)(v16 + 16);
            if (v20 <= (int)v9) {
              int v20 = v9;
            }
            *(_DWORD *)(v16 + 16) = v20;
            if ((int)v9 < 1)
            {
              int v21 = 0;
            }
            else
            {
              int v21 = 0;
              uint64_t v22 = *(int *)(v17 + 4 * (int)((2 * v15) | 1));
              uint64_t v23 = *(void *)(v16 + 168) + 4 * v22;
              uint64_t v24 = *(void *)(v16 + 192) + 2 * v22;
              uint64_t v25 = *(void *)(v1 + 24);
              uint64_t v26 = this[11];
              uint64_t v27 = this[15];
              uint64_t v28 = v9;
              uint64_t v29 = (int *)v10;
              int v30 = (unsigned __int16 *)v11;
              do
              {
                uint64_t v32 = *v29++;
                uint64_t v31 = v32;
                LODWORD(v32) = *v30++;
                uint64_t v33 = v32;
                uint64_t v34 = (2 * v31) | 1;
                BOOL v35 = v6;
                if (*v12 != v12[1]) {
                  BOOL v35 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(v25 + 4 * v34) + 4 * v33) != v12[v6];
                }
                uint64_t v36 = v27 + 4 * *(int *)(v26 + 4 * v34);
                unsigned int v37 = v35 + v33;
                if (v37 == *(_DWORD *)(v25 + 8 * v31)) {
                  unsigned int v38 = 0;
                }
                else {
                  unsigned int v38 = v37;
                }
                int v39 = *(_DWORD *)(v36 + 4 * v38);
                if (v39 != -1)
                {
                  *(_DWORD *)(v23 + 4 * v21) = v39;
                  *(_WORD *)(v24 + 2 * v21++) = v33;
                }
                --v28;
              }
              while (v28);
            }
            *unsigned int v18 = v21;
          }
          char v13 = 0;
          uint64_t v6 = 1;
        }
        while ((v14 & 1) != 0);
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  int v2 = ((*(void *)(*((void *)this + 1) + 296) - *(void *)(*((void *)this + 1) + 288)) >> 2)
     + 3 * ((*(void *)(*((void *)this + 1) + 176) - *(void *)(*((void *)this + 1) + 168)) >> 2);
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 264), 2 * *(int *)(*((void *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 288), v2);
  std::vector<unsigned short>::resize(*((void *)this + 2) + 312, v2);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges(this);
  }
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = (int *)(*(void *)(v3 + 264) + 4 * (2 * *(_DWORD *)(v3 + 8) - 2));
  std::vector<unsigned int>::size_type v5 = v4[1] + (uint64_t)*v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v3 + 288), v5);
  uint64_t v6 = *((void *)this + 2) + 312;

  std::vector<unsigned short>::resize(v6, v5);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentVertices(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 288);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 264) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 312);
        uint64_t v11 = (void *)this[2];
        unsigned int v12 = (_DWORD *)(v11[33] + 8 * v5);
        *unsigned int v12 = v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = this[11];
          uint64_t v20 = this[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            __int16 v23 = v22;
            int v24 = *(_DWORD *)(v20 + 4 * *(int *)(v19 + 8 * v21 + 4) + 4 * v22);
            if (v24 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v24;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            --v8;
          }
          while (v8);
        }
        *unsigned int v12 = v14;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 192);
        uint64_t v11 = (void *)this[2];
        unsigned int v12 = (_DWORD *)(v11[33] + 8 * v5);
        *unsigned int v12 = 2 * v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = this[11];
          uint64_t v20 = this[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            if (*(_DWORD *)(v19 + 8 * v22) != 4) {
              OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges();
            }
            unsigned int v24 = *v16++;
            uint64_t v23 = v24;
            unsigned int v25 = v24 + 1 - 3 * ((1431655766 * (unint64_t)(v24 + 1)) >> 32);
            uint64_t v26 = v20 + 4 * *(int *)(v19 + 8 * v21 + 4);
            int v27 = *(_DWORD *)(v26 + 4 * v25);
            if (v27 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v27;
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            int v28 = *(_DWORD *)(v26 + 12);
            if (v28 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v28;
              *(_WORD *)(v18 + 2 * v14++) = v23
                                            + 2
                                            - 3 * ((1431655766 * (unint64_t)(v23 + 2)) >> 32);
            }
            int v29 = *(_DWORD *)(v26 + 4 * v23);
            if (v29 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v29;
              *(_WORD *)(v18 + 2 * v14++) = v25;
            }
            --v8;
          }
          while (v8);
        }
        *unsigned int v12 = v14;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement *this)
{
  uint64_t v2 = *((void *)this + 1);
  int v3 = ((*(void *)(v2 + 368) - *(void *)(v2 + 360)) >> 2)
     + 2 * (*(_DWORD *)(v2 + 4) + ((*(void *)(v2 + 176) - *(void *)(v2 + 168)) >> 2));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 336), 2 * *(int *)(*((void *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 360), v3);
  std::vector<unsigned short>::resize(*((void *)this + 2) + 384, v3);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentEdges(this);
  }
  uint64_t v4 = *((void *)this + 2);
  uint64_t v5 = (int *)(*(void *)(v4 + 336) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  std::vector<unsigned int>::size_type v6 = v5[1] + (uint64_t)*v5;
  std::vector<int>::resize((std::vector<unsigned int> *)(v4 + 360), v6);
  uint64_t v7 = *((void *)this + 2) + 384;

  std::vector<unsigned short>::resize(v7, v6);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentVertices(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 360);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 336) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 384);
        uint64_t v11 = this[2];
        uint64_t v12 = *(void *)(v11 + 336);
        int v13 = (_DWORD *)(v12 + 8 * v5);
        *int v13 = v8;
        if (v5) {
          int v14 = *(v13 - 1) + *(v13 - 2);
        }
        else {
          int v14 = 0;
        }
        v13[1] = v14;
        int v15 = *(_DWORD *)(v11 + 20);
        if (v15 <= (int)v8) {
          int v15 = v8;
        }
        *(_DWORD *)(v11 + 20) = v15;
        if ((int)v8 < 1)
        {
          int v16 = 0;
        }
        else
        {
          int v16 = 0;
          uint64_t v17 = (int *)(v6 + 4 * v9);
          uint64_t v18 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v19 = *(int *)(v12 + 4 * (int)((2 * v5) | 1));
          uint64_t v20 = *(void *)(v11 + 360) + 4 * v19;
          uint64_t v21 = *(void *)(v11 + 384) + 2 * v19;
          uint64_t v22 = this[24];
          do
          {
            uint64_t v23 = *v17++;
            uint64_t v24 = v22 + 8 * v23;
            LODWORD(v23) = *v18++;
            int v25 = *(_DWORD *)(v24 + 4 * v23);
            if (v25 != -1)
            {
              *(_DWORD *)(v20 + 4 * v16) = v25;
              *(_WORD *)(v21 + 2 * v16++) = 1;
            }
            --v8;
          }
          while (v8);
        }
        *int v13 = v16;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexEdgesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = *(unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *(int *)(*(void *)(v1 + 144) + 8 * v3 + 4);
        uint64_t v9 = *(void *)(v1 + 192);
        uint64_t v10 = *(void *)(v1 + 120);
        uint64_t v11 = this[24];
        uint64_t v12 = this[2];
        int v13 = v7 + 2;
        uint64_t v14 = *(void *)(v12 + 336);
        int v15 = (_DWORD *)(v14 + 8 * v5);
        _DWORD *v15 = v7 + 2;
        if (v5) {
          int v16 = *(v15 - 1) + *(v15 - 2);
        }
        else {
          int v16 = 0;
        }
        v15[1] = v16;
        if (*(_DWORD *)(v12 + 20) > v13) {
          int v13 = *(_DWORD *)(v12 + 20);
        }
        *(_DWORD *)(v12 + 20) = v13;
        if ((int)v7 < 1)
        {
          int v19 = 0;
        }
        else
        {
          uint64_t v17 = 0;
          BOOL v18 = 0;
          int v19 = 0;
          uint64_t v20 = v6 + 4 * v8;
          uint64_t v21 = v9 + 2 * v8;
          uint64_t v22 = (_DWORD *)(v10 + 8 * v3);
          uint64_t v23 = v11 + 8 * v3;
          uint64_t v24 = *(int *)(v14 + 4 * (int)((2 * v5) | 1));
          uint64_t v25 = *(void *)(v12 + 360) + 4 * v24;
          uint64_t v26 = *(void *)(v12 + 384) + 2 * v24;
          uint64_t v27 = this[13];
          uint64_t v28 = this[18];
          int v29 = -1;
          do
          {
            uint64_t v30 = *(unsigned __int16 *)(v21 + 2 * v17);
            uint64_t v31 = (2 * *(int *)(v20 + 4 * v17)) | 1;
            uint64_t v32 = v28 + 4 * *(int *)(v27 + 4 * v31);
            if (v17)
            {
              int v33 = *(_DWORD *)(v32
                              + 4
                              * (v30
                                             + 1
                                             - 3 * ((1431655766 * (unint64_t)(v30 + 1)) >> 32)));
              int v34 = *(_DWORD *)(v32 + 4 * v30);
            }
            else
            {
              if (*v22 != v22[1]) {
                BOOL v18 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(*(void *)(v1 + 24) + 4 * v31) + 4 * v30) != *v22;
              }
              int v35 = *(_DWORD *)(v23 + 4 * !v18);
              int v29 = *(_DWORD *)(v23 + 4 * v18);
              int v33 = *(_DWORD *)(v32
                              + 4
                              * (v30
                                             + 1
                                             - 3 * ((1431655766 * (unint64_t)(v30 + 1)) >> 32)));
              int v34 = *(_DWORD *)(v32 + 4 * v30);
              if (v35 != -1)
              {
                *(_DWORD *)(v25 + 4 * v19) = v35;
                *(_WORD *)(v26 + 2 * v19++) = 0;
              }
            }
            if (v33 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v33;
              *(_WORD *)(v26 + 2 * v19++) = 1;
            }
            if (v34 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v34;
              *(_WORD *)(v26 + 2 * v19++) = 0;
            }
            if (!v17 && v29 != -1)
            {
              *(_DWORD *)(v25 + 4 * v19) = v29;
              *(_WORD *)(v26 + 2 * v19++) = 0;
            }
            ++v17;
          }
          while (v7 != v17);
        }
        _DWORD *v15 = v19;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren(void *this)
{
  if (this[52] == this[51]) {
    OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren();
  }
  uint64_t v1 = (int *)this[1];
  if (*v1 >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    *(void *)&long long v4 = 0x200000002;
    *((void *)&v4 + 1) = 0x200000002;
    do
    {
      uint64_t v5 = (_DWORD *)(this[11] + v2);
      if (*v5 != 4) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren();
      }
      uint64_t v6 = this[13];
      if (*(_DWORD *)(v6 + v2) != 3) {
        OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren();
      }
      uint64_t v7 = this[15] + 4 * (int)v5[1];
      uint64_t v8 = this[18] + 4 * *(int *)(v6 + v2 + 4);
      uint64_t v9 = this[51];
      if (*(unsigned char *)(v9 + v3))
      {
        *(_OWORD *)uint64_t v7 = v4;
        *(_DWORD *)uint64_t v8 = 2;
        *(void *)(v8 + 4) = 0x200000002;
        *(unsigned char *)(v9 + v3) &= 0xE1u;
      }
      else
      {
        uint64_t v10 = *(int *)(*((void *)v1 + 3) + v2 + 4);
        uint64_t v11 = (int *)(*((void *)v1 + 6) + 4 * v10);
        if ((*(unsigned char *)(this[57] + v11[1]) & 1)
           + (*(unsigned char *)(this[57] + *v11) & 1)
           + (*(unsigned char *)(this[57] + v11[2]) & 1))
        {
          int v12 = *(unsigned char *)(this[54] + *(int *)(*((void *)v1 + 9) + 4 * v10 + 4)) & 0xE | (*(unsigned __int8 *)(this[54] + *(int *)(*((void *)v1 + 9) + 4 * v10)) >> 1) & 0xF | (2 * *(unsigned __int8 *)(this[54] + *(int *)(*((void *)v1 + 9) + 4 * v10 + 8))) & 0xC;
          *(unsigned char *)(v9 + v3) = *(unsigned char *)(v9 + v3) & 0xE1 | (2 * v12);
          if (v12)
          {
            *(_DWORD *)(v7 + 12) = 1;
            *(_DWORD *)uint64_t v8 = 1;
            *(void *)(v8 + 4) = 0x100000001;
          }
          uint64_t v13 = this[57];
          if (*(unsigned char *)(v13 + *v11))
          {
            *(_DWORD *)uint64_t v7 = 1;
            *(_DWORD *)uint64_t v8 = 1;
          }
          if (*(unsigned char *)(v13 + v11[1]))
          {
            *(_DWORD *)(v7 + 4) = 1;
            *(_DWORD *)(v8 + 4) = 1;
          }
          if (*(unsigned char *)(v13 + v11[2]))
          {
            *(_DWORD *)(v7 + 8) = 1;
            *(_DWORD *)(v8 + 8) = 1;
          }
        }
      }
      ++v3;
      uint64_t v1 = (int *)this[1];
      v2 += 8;
    }
    while (v3 < *v1);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceVerticesFromParentFaces()
{
  __assert_rtn("populateFaceVerticesFromParentFaces", "triRefinement.cpp", 149, "pFaceChildren.size() == 4");
}

{
  __assert_rtn("populateFaceVerticesFromParentFaces", "triRefinement.cpp", 148, "pFaceVerts.size() == 3");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateFaceEdgesFromParentFaces()
{
  __assert_rtn("populateFaceEdgesFromParentFaces", "triRefinement.cpp", 226, "pFaceChildEdges.size() == 3");
}

{
  __assert_rtn("populateFaceEdgesFromParentFaces", "triRefinement.cpp", 225, "pFaceChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeVerticesFromParentFaces()
{
  __assert_rtn("populateEdgeVerticesFromParentFaces", "triRefinement.cpp", 296, "pFaceChildEdges.size() == 3");
}

{
  __assert_rtn("populateEdgeVerticesFromParentFaces", "triRefinement.cpp", 295, "pFaceEdges.size() == 3");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateEdgeFacesFromParentFaces()
{
  __assert_rtn("populateEdgeFacesFromParentFaces", "triRefinement.cpp", 394, "pFaceChildEdges.size() == 3");
}

{
  __assert_rtn("populateEdgeFacesFromParentFaces", "triRefinement.cpp", 393, "pFaceChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::populateVertexFacesFromParentEdges()
{
  __assert_rtn("populateVertexFacesFromParentEdges", "triRefinement.cpp", 579, "pFaceChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::TriRefinement::markSparseFaceChildren()
{
}

{
  __assert_rtn("markSparseFaceChildren", "triRefinement.cpp", 866, "fChildEdges.size() == 3");
}

{
  __assert_rtn("markSparseFaceChildren", "triRefinement.cpp", 865, "fChildFaces.size() == 4");
}

void OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetCommonShaderSource(std::string *a1@<X8>)
{
  std::string::basic_string[abi:nn180100]<0>(&v9, "#define OSD_METAL_IOS 1\n");
  std::string::basic_string[abi:nn180100]<0>(__p, aLine0OsdMtlpat);
  if ((v8 & 0x80u) == 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  if ((v8 & 0x80u) == 0) {
    std::string::size_type v4 = v8;
  }
  else {
    std::string::size_type v4 = (std::string::size_type)__p[1];
  }
  uint64_t v5 = std::string::append(&v9, (const std::string::value_type *)v3, v4);
  if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(a1, v5->__r_.__value_.__l.__data_, v5->__r_.__value_.__l.__size_);
  }
  else
  {
    long long v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
    a1->__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v6;
  }
  if ((char)v8 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_20B575ED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetPatchBasisShaderSource(OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource *this)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:nn180100]((uint64_t)v6);
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v7, (uint64_t)"#define OSD_PATCH_BASIS_METAL 1\n", 32);
  std::string::basic_string[abi:nn180100]<0>(__p, aCopyright2016P);
  if ((v5 & 0x80u) == 0) {
    uint64_t v1 = __p;
  }
  else {
    uint64_t v1 = (void **)__p[0];
  }
  if ((v5 & 0x80u) == 0) {
    uint64_t v2 = v5;
  }
  else {
    uint64_t v2 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v7, (uint64_t)v1, v2);
  if ((char)v5 < 0) {
    operator delete(__p[0]);
  }
  std::stringbuf::str();
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v6);
}

void sub_20B575FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void *OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = a1 - 2;
  if ((a1 - 2) >= 8 || ((0xF7u >> v2) & 1) == 0) {
    OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine();
  }
  uint64_t v3 = off_26400BA38[v2];

  return std::string::basic_string[abi:nn180100]<0>(a2, v3);
}

void *OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource@<X0>(int a1@<W0>, void *a2@<X8>)
{
  int v2 = a1 - 2;
  if ((a1 - 2) >= 8 || ((0xF7u >> v2) & 1) == 0) {
    OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource();
  }
  uint64_t v3 = (char *)*((void *)&off_26400BA78 + v2);

  return std::string::basic_string[abi:nn180100]<0>(a2, v3);
}

uint64_t OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetHullShaderSource(int a1)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:nn180100]((uint64_t)v10);
  OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine(a1, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)p_p, size);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  OpenSubdiv::v3_1_1::Osd::MTLPatchShaderSource::GetCommonShaderSource(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v4 = &__p;
  }
  else {
    std::string::size_type v4 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v5 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v5 = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)v4, v5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource(a1, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v6 = &__p;
  }
  else {
    long long v6 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v7 = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:nn180100]<char,std::char_traits<char>>(v11, (uint64_t)v6, v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::stringbuf::str();
  return std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)v10);
}

void sub_20B5761B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
}

void OpenSubdiv::v3_1_1::Osd::GetPatchTypeDefine()
{
}

void OpenSubdiv::v3_1_1::Osd::GetPatchTypeSource()
{
}

OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory *OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::EndCapBSplineBasisPatchFactory(OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory *this, const OpenSubdiv::v3_1_1::Far::TopologyRefiner *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3, OpenSubdiv::v3_1_1::Far::StencilTable *a4)
{
  *(void *)this = a3;
  *((void *)this + 1) = a4;
  *((void *)this + 2) = a2;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  unint64_t v4 = *((unsigned __int8 *)a2 + 8);
  if (v4) {
    OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::EndCapBSplineBasisPatchFactory();
  }
  uint64_t v7 = **(int **)(*((void *)a2 + 11) + 24 * ((v4 >> 2) & 0xF));
  std::vector<int>::size_type v8 = 7 * v7;
  int v9 = 112 * v7;
  if (v9 >= 104857600) {
    int v10 = 104857600;
  }
  else {
    int v10 = v9;
  }
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 16), v8);
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 64), v10);
  std::vector<float>::reserve((void **)a3 + 11, v10);
  uint64_t v11 = *((void *)this + 1);
  if (v11)
  {
    std::vector<unsigned int>::reserve((std::vector<int> *)(v11 + 16), v8);
    std::vector<unsigned int>::reserve((std::vector<int> *)(v11 + 64), v8);
    std::vector<float>::reserve((void **)(v11 + 88), v8);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::GetPatchPoints(uint64_t a1, void *a2, int a3, __int16 *a4, unsigned int a5, unsigned int a6)
{
  uint64_t v8 = a2[3];
  int v9 = (int32x4_t *)(a2[6] + 4 * *(int *)(v8 + 8 * a3 + 4));
  int v10 = *(_DWORD *)(v8 + 8 * a3);
  if ((a6 & 0x80000000) == 0) {
    return OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPointsFromGregoryBasis(a1);
  }
  unint64_t v11 = 0;
  int v12 = -1;
  do
  {
    __int16 v14 = *(_WORD *)(a2[54] + 2 * v9->i32[v11]);
    if ((v14 & 0x780) != 0x80 || (__int16 v15 = *a4) != 0) {
      LOBYTE(v15) = 1;
    }
    if ((v14 & 2) != 0)
    {
      if (v12 < 0) {
        int v12 = v11;
      }
      else {
        LOBYTE(v15) = 1;
      }
    }
    if (v11 > 2) {
      break;
    }
    ++v11;
    a4 += 3;
  }
  while ((v15 & 1) == 0);
  if ((v15 & 1) == 0) {
    return OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(a1, (uint64_t)a2, a3, v12, v9, v10, a5, a6);
  }
  else {
    return OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPointsFromGregoryBasis(a1);
  }
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPointsFromGregoryBasis(uint64_t a1)
{
  double v2 = MEMORY[0x270FA5388](a1);
  int v4 = v3;
  uint64_t v98 = v5;
  uint64_t v7 = v6;
  v122[16] = *MEMORY[0x263EF8340];
  uint64_t v8 = *(OpenSubdiv::v3_1_1::Far::TopologyRefiner **)(v6 + 16);
  if (v1 < 0) {
    int NumFVarValuesTotal = *((_DWORD *)v8 + 5);
  }
  else {
    int NumFVarValuesTotal = OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(v8, v1);
  }
  int v97 = v4;
  int v10 = 0;
  unint64_t v11 = (void *)(v7 + 48);
  int v12 = *(_DWORD *)(v7 + 24);
  uint64_t v13 = *(char **)(v7 + 40);
  do
  {
    int v14 = v12 + NumFVarValuesTotal;
    if ((unint64_t)v13 >= *v11)
    {
      int v16 = *(char **)(v7 + 32);
      uint64_t v17 = (v13 - v16) >> 2;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 62) {
LABEL_105:
      }
        abort();
      uint64_t v19 = *v11 - (void)v16;
      if (v19 >> 1 > v18) {
        unint64_t v18 = v19 >> 1;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        uint64_t v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(v7 + 48, v20);
        int v16 = *(char **)(v7 + 32);
        uint64_t v13 = *(char **)(v7 + 40);
      }
      else
      {
        uint64_t v21 = 0;
      }
      uint64_t v22 = &v21[4 * v17];
      *(_DWORD *)uint64_t v22 = v14;
      __int16 v15 = v22 + 4;
      while (v13 != v16)
      {
        int v23 = *((_DWORD *)v13 - 1);
        v13 -= 4;
        *((_DWORD *)v22 - 1) = v23;
        v22 -= 4;
      }
      *(void *)(v7 + 32) = v22;
      *(void *)(v7 + 40) = v15;
      *(void *)(v7 + 48) = &v21[4 * v20];
      if (v16) {
        operator delete(v16);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v13 = v14;
      __int16 v15 = v13 + 4;
    }
    *(void *)(v7 + 40) = v15;
    int v12 = *(_DWORD *)(v7 + 24) + 1;
    *(_DWORD *)(v7 + 24) = v12;
    ++v10;
    uint64_t v13 = v15;
  }
  while (v10 != 16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis(v99, v2);
  v122[0] = v99;
  v122[1] = &v104;
  v122[2] = &v109;
  v122[3] = &v101;
  v122[4] = &v108;
  v122[5] = &v112;
  v122[6] = &v113;
  v122[7] = &v105;
  v122[8] = &v107;
  v122[9] = v115;
  v122[10] = &v114;
  v122[11] = &v110;
  v122[12] = v103;
  v122[13] = v111;
  v122[14] = &v106;
  v122[15] = &v102;
  unsigned int v24 = v100;
  uint64_t v25 = &v118;
  uint64_t v118 = &v120;
  uint64_t v119 = 0x1000000010;
  uint64_t v26 = 16;
  uint64_t v121 = 0;
  do
  {
    *((_DWORD *)v25 + 4) = 0;
    v25[3] = (uint64_t *)(v25 + 5);
    v25[45] = 0;
    v25[4] = (uint64_t *)0x2800000028;
    v25 += 44;
    --v26;
  }
  while (v26);
  uint64_t v27 = 0;
  uint64_t v28 = (char *)&unk_20B5F0AC0;
  do
  {
    uint64_t v29 = 0;
    uint64_t v30 = 4 * v27;
    uint64_t v31 = v122;
    do
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear((void **)&v118[44 * v29 + 44 * v30], v24);
      for (uint64_t i = 0; i != 16; i += 4)
      {
        float v33 = *(float *)&v28[i];
        if (v33 != 0.0) {
          OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v118[44 * v29 + 44 * v30], (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v31[i], v33);
        }
      }
      ++v29;
      ++v31;
    }
    while (v29 != 4);
    ++v27;
    v28 += 16;
  }
  while (v27 != 4);
  uint64_t v34 = 0;
  for (uint64_t j = 0; j != 4; ++j)
  {
    uint64_t v36 = 0;
    unsigned int v37 = (char *)&unk_20B5F0AC0;
    do
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v116, v24);
      uint64_t v39 = 0;
      uint64_t v40 = v34;
      do
      {
        float v41 = *(float *)&v37[v39];
        if (v41 != 0.0) {
          OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v116, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)((char *)v118 + v40), v41);
        }
        v40 += 352;
        v39 += 4;
      }
      while (v39 != 16);
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v116, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v7, v38);
      operator delete(__p);
      ++v36;
      v37 += 16;
    }
    while (v36 != 4);
    v34 += 1408;
  }
  if (*(void *)(v7 + 8))
  {
    for (uint64_t k = 0; k != 16; ++k)
    {
      int v43 = *(_DWORD *)(v98 + 4 * dword_20B5F0B00[k]);
      uint64_t v44 = *(void **)(v7 + 8);
      uint64_t v45 = (char *)v44[3];
      unint64_t v46 = v44[4];
      if ((unint64_t)v45 >= v46)
      {
        uint64_t v48 = (char *)v44[2];
        uint64_t v49 = (v45 - v48) >> 2;
        unint64_t v50 = v49 + 1;
        if ((unint64_t)(v49 + 1) >> 62) {
          goto LABEL_105;
        }
        uint64_t v51 = v46 - (void)v48;
        if (v51 >> 1 > v50) {
          unint64_t v50 = v51 >> 1;
        }
        if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v52 = v50;
        }
        if (v52)
        {
          float v53 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(v44 + 4), v52);
          uint64_t v48 = (char *)v44[2];
          uint64_t v45 = (char *)v44[3];
        }
        else
        {
          float v53 = 0;
        }
        uint64_t v54 = &v53[4 * v49];
        *(_DWORD *)uint64_t v54 = 1;
        uint64_t v47 = v54 + 4;
        while (v45 != v48)
        {
          int v55 = *((_DWORD *)v45 - 1);
          v45 -= 4;
          *((_DWORD *)v54 - 1) = v55;
          v54 -= 4;
        }
        v44[2] = v54;
        v44[3] = v47;
        v44[4] = &v53[4 * v52];
        if (v48) {
          operator delete(v48);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v45 = 1;
        uint64_t v47 = v45 + 4;
      }
      int v56 = v43 + v97;
      v44[3] = v47;
      int v57 = *(void **)(v7 + 8);
      unint64_t v58 = (char *)v57[9];
      unint64_t v59 = v57[10];
      if ((unint64_t)v58 >= v59)
      {
        int v61 = (char *)v57[8];
        uint64_t v62 = (v58 - v61) >> 2;
        unint64_t v63 = v62 + 1;
        if ((unint64_t)(v62 + 1) >> 62) {
          goto LABEL_105;
        }
        uint64_t v64 = v59 - (void)v61;
        if (v64 >> 1 > v63) {
          unint64_t v63 = v64 >> 1;
        }
        if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v65 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v65 = v63;
        }
        if (v65)
        {
          unint64_t v66 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(v57 + 10), v65);
          int v61 = (char *)v57[8];
          unint64_t v58 = (char *)v57[9];
        }
        else
        {
          unint64_t v66 = 0;
        }
        uint64_t v67 = &v66[4 * v62];
        *(_DWORD *)uint64_t v67 = v56;
        int v60 = v67 + 4;
        while (v58 != v61)
        {
          int v68 = *((_DWORD *)v58 - 1);
          v58 -= 4;
          *((_DWORD *)v67 - 1) = v68;
          v67 -= 4;
        }
        v57[8] = v67;
        v57[9] = v60;
        v57[10] = &v66[4 * v65];
        if (v61) {
          operator delete(v61);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v58 = v56;
        int v60 = v58 + 4;
      }
      v57[9] = v60;
      int v69 = *(void **)(v7 + 8);
      unint64_t v70 = (char *)v69[12];
      unint64_t v71 = v69[13];
      if ((unint64_t)v70 >= v71)
      {
        int v73 = (char *)v69[11];
        uint64_t v74 = (v70 - v73) >> 2;
        unint64_t v75 = v74 + 1;
        if ((unint64_t)(v74 + 1) >> 62) {
          goto LABEL_105;
        }
        uint64_t v76 = v71 - (void)v73;
        if (v76 >> 1 > v75) {
          unint64_t v75 = v76 >> 1;
        }
        if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v77 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v77 = v75;
        }
        if (v77)
        {
          int v78 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(v69 + 13), v77);
          int v73 = (char *)v69[11];
          unint64_t v70 = (char *)v69[12];
        }
        else
        {
          int v78 = 0;
        }
        int v79 = &v78[4 * v74];
        *(_DWORD *)int v79 = 1065353216;
        uint64_t v72 = v79 + 4;
        while (v70 != v73)
        {
          int v80 = *((_DWORD *)v70 - 1);
          v70 -= 4;
          *((_DWORD *)v79 - 1) = v80;
          v79 -= 4;
        }
        v69[11] = v79;
        v69[12] = v72;
        v69[13] = &v78[4 * v77];
        if (v73) {
          operator delete(v73);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v70 = 1065353216;
        uint64_t v72 = v70 + 4;
      }
      v69[12] = v72;
    }
  }
  uint64_t v81 = *(int *)(v7 + 28);
  *(_DWORD *)(v7 + 28) = v81 + 1;
  uint64_t v82 = *(void *)(v7 + 32);
  if (v119)
  {
    unint64_t v83 = 0;
    uint64_t v84 = 43;
    do
    {
      int v85 = &v118[v84];
      int v86 = &v118[v84 - 42];
      operator delete((void *)v118[v84]);
      uint64_t *v86 = (uint64_t)(v85 - 40);
      *((_DWORD *)v85 - 81) = 40;
      ++v83;
      v84 += 44;
    }
    while (v83 < v119);
  }
  operator delete(v121);
  for (uint64_t m = 0; m != -1408; m -= 352)
  {
    uint64_t v88 = &v99[m];
    operator delete(*(void **)&v115[m + 1752]);
    *((void *)v88 + 837) = &v115[m + 1432];
    *((_DWORD *)v88 + 1677) = 40;
  }
  for (uint64_t n = 0; n != -1408; n -= 352)
  {
    int v90 = &v99[n];
    operator delete(*(void **)&v115[n + 344]);
    *((void *)v90 + 661) = &v115[n + 24];
    *((_DWORD *)v90 + 1325) = 40;
  }
  for (iuint64_t i = 0; ii != -1408; ii -= 352)
  {
    int v92 = &v99[ii];
    operator delete(*(void **)&v111[ii + 344]);
    *((void *)v92 + 485) = v92 + 3896;
    *((_DWORD *)v92 + 973) = 40;
  }
  uint64_t v93 = 1408;
  do
  {
    int v94 = &v99[v93];
    operator delete(*(void **)&v103[v93 + 344]);
    *((void *)v94 + 133) = v94 + 1080;
    *((_DWORD *)v94 + 269) = 40;
    v93 -= 352;
  }
  while (v93);
  uint64_t v95 = 1408;
  do
  {
    operator delete(*(void **)&v99[v95 - 8]);
    *(void *)&v99[v95 - 344] = &v99[v95 - 328];
    *(_DWORD *)&v99[v95 - 332] = 40;
    v95 -= 352;
  }
  while (v95);
  return v82 + (v81 << 6);
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(uint64_t a1, uint64_t a2, int a3, int a4, int32x4_t *a5, int a6, unsigned int a7, unsigned int a8)
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  unsigned int v16 = 2 * *(_DWORD *)(a2 + 20) + 16;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v131, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v128, v16);
  int v17 = OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v125, v16);
  int v109 = a4;
  int v107 = a8;
  OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils(v17, (OpenSubdiv::v3_1_1::Vtr::internal::Level *)a2, (uint64_t)a5, a6, a4, a8, (OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v131, (int *)&v128, (int *)&v125);
  uint64_t v18 = v131;
  if (v131 >= 1)
  {
    uint64_t v19 = v132;
    do
    {
      *v19 += a7;
      v19 += 2;
      --v18;
    }
    while (v18);
  }
  uint64_t v20 = v128;
  if ((int)v128 >= 1)
  {
    uint64_t v21 = v129;
    do
    {
      *v21 += a7;
      v21 += 2;
      --v20;
    }
    while (v20);
  }
  uint64_t v22 = v125;
  if ((int)v125 >= 1)
  {
    int v23 = v126;
    do
    {
      *v23 += a7;
      v23 += 2;
      --v22;
    }
    while (v22);
  }
  uint64_t v24 = 0;
  uint64_t v108 = a5;
  uint64_t v25 = *(void *)(a2 + 24);
  uint64_t v26 = *(int *)(v25 + 4 * ((2 * a3) | 1));
  v124[0] = vaddq_s32(*a5, vdupq_n_s32(a7));
  uint64_t v27 = *(void *)(a2 + 48);
  uint64_t v28 = v27 + 4 * v26;
  uint64_t v29 = 4;
  do
  {
    uint64_t v30 = *(int *)(v28 + 4 * v24);
    int v31 = 2 * v30;
    uint64_t v32 = *(void *)(a2 + 264);
    uint64_t v33 = v32 + 8 * v30;
    uint64_t v34 = *(void *)(a2 + 288) + 4 * *(int *)(v33 + 4);
    uint64_t v35 = *(unsigned int *)(v32 + 4 * v31);
    v123[0] = v34;
    v123[1] = v35;
    uint64_t v36 = *(void *)(a2 + 312) + 2 * *(int *)(v33 + 4);
    if (v24 == a4)
    {
      if ((int)v35 < 1)
      {
LABEL_16:
        LODWORD(v37) = -1;
      }
      else
      {
        uint64_t v37 = 0;
        while (*(_DWORD *)(v34 + 4 * v37) != a3)
        {
          if (v35 == ++v37) {
            goto LABEL_16;
          }
        }
      }
      *((_DWORD *)v124 + v29) = *(_DWORD *)(v27
                                          + 4
                                          * *(int *)(v25 + 8 * *(int *)(v34 + 4 * (((int)v37 + 1) % (int)v35)) + 4)
                                          + 4
                                          * ((*(_WORD *)(v36 + 2 * (((int)v37 + 1) % (int)v35)) - 1) & 3))
                              + a7;
      unsigned int v38 = (_DWORD *)(v27
                     + 4 * *(int *)(v25 + 8 * *(int *)(v34 + 4 * (((int)v35 + (int)v37 - 1) % (int)v35)) + 4)
                     + 4 * ((*(_WORD *)(v36 + 2 * (((int)v35 + (int)v37 - 1) % (int)v35)) + 1) & 3));
    }
    else
    {
      char IndexIn4Tuple = OpenSubdiv::v3_1_1::Vtr::ConstArray<int>::FindIndexIn4Tuple((uint64_t)v123, a3);
      char v40 = *(_WORD *)(v36 + 2 * ((IndexIn4Tuple + 2) & 3));
      uint64_t v25 = *(void *)(a2 + 24);
      uint64_t v27 = *(void *)(a2 + 48);
      uint64_t v41 = v27 + 4 * *(int *)(v25 + 8 * *(int *)(v123[0] + 4 * ((IndexIn4Tuple + 2) & 3)) + 4);
      int v42 = (_DWORD *)v124 + v29;
      unsigned int v43 = *(_DWORD *)(v41 + 4 * ((v40 + 2) & 3)) + a7;
      *int v42 = *(_DWORD *)(v41 + 4 * ((v40 + 1) & 3)) + a7;
      v42[1] = v43;
      unsigned int v38 = (_DWORD *)(v41 + 4 * ((v40 - 1) & 3));
    }
    *((_DWORD *)v124 + v29 + 2) = *v38 + a7;
    v29 += 3;
    ++v24;
  }
  while (v24 != 4);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v117, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v111, v16);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v128, 12.0);
  *(void *)uint64_t v106 = a4;
  uint64_t v44 = (int *)((char *)&OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,int,OpenSubdiv::v3_1_1::Vtr::ConstArray<int>,int,int)::rotation
              + 64 * (uint64_t)a4);
  int v45 = *((_DWORD *)v124 + *v44);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v45, -5.3333);
  int v46 = *((_DWORD *)v124 + v44[1]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v46, -2.6667);
  int v47 = *((_DWORD *)v124 + v44[2]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v47, -0.66667);
  int v48 = *((_DWORD *)v124 + v44[3]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v48, -1.3333);
  int v49 = *((_DWORD *)v124 + v44[6]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v49, -0.33333);
  int v50 = *((_DWORD *)v124 + v44[7]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, v50, -0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v128, -6.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v45, 2.6667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v46, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v47, 0.33333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v48, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v49, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, v50, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(v117, v121);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v117, *((_DWORD *)v124 + v44[8]), 1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v117, v49, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v125, 12.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v45, -5.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v46, -1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v47, -0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v48, -2.6667);
  int v51 = *((_DWORD *)v124 + v44[4]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v51, -0.33333);
  int v52 = *((_DWORD *)v124 + v44[15]);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, v52, -0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v125, -6.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v45, 2.6667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v46, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v47, 0.33333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v48, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v51, 0.66667);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, v52, 1.3333);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(v111, v115);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v111, *((_DWORD *)v124 + v44[14]), 1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v111, v51, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v131, 36.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v45, -16.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v46, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v48, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v115, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v121, -4.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, v47, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v119, -1.0);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v123, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v113, -1.0);
  uint64_t v54 = *(OpenSubdiv::v3_1_1::Far::TopologyRefiner **)(a1 + 16);
  if (v107 < 0) {
    int NumFVarValuesTotal = *((_DWORD *)v54 + 5);
  }
  else {
    int NumFVarValuesTotal = OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(v54, v107);
  }
  int v56 = (OpenSubdiv::v3_1_1::Far::GregoryBasis *)(v108->i32[v109] + a7);
  int v57 = v109 + 1;
  unsigned int v58 = (v109 + 1) & 3;
  unint64_t v59 = (OpenSubdiv::v3_1_1::Far::GregoryBasis *)(v108->i32[v58] + a7);
  int v60 = v109 + 3;
  __int32 v110 = v108->i32[(v109 + 3) & 3];
  int v61 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v61 + 1;
  int v62 = 3 * v106[0];
  *((_DWORD *)&v124[1] + 3 * *(void *)v106 + 2) = v61 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v121, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v53);
  uint64_t v64 = *(void **)(a1 + 8);
  if (v64) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v56, v64, v63);
  }
  int v65 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v65 + 1;
  int v66 = v65 + NumFVarValuesTotal;
  if (v57 <= 0) {
    int v67 = -(-v57 & 3);
  }
  else {
    int v67 = v58;
  }
  int v68 = 3 * v67;
  *((_DWORD *)&v124[1] + 3 * v67) = v66;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v119, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v63);
  unint64_t v70 = *(void **)(a1 + 8);
  if (v70) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v59, v70, v69);
  }
  int v71 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v71 + 1;
  *((_DWORD *)&v124[1] + v68 + 1) = v71 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v117, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v69);
  int v73 = *(void **)(a1 + 8);
  if (v73) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v59, v73, v72);
  }
  uint64_t v74 = (OpenSubdiv::v3_1_1::Far::GregoryBasis *)(v110 + a7);
  int v75 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v75 + 1;
  *((_DWORD *)&v124[1] + v62) = v75 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v115, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v72);
  unint64_t v77 = *(void **)(a1 + 8);
  if (v77) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v56, v77, v76);
  }
  int v78 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v78 + 1;
  int v79 = v78 + NumFVarValuesTotal;
  if (v60 <= 0) {
    int v80 = -(-v60 & 3);
  }
  else {
    int v80 = v60 & 3;
  }
  int v81 = 3 * v80;
  *((_DWORD *)&v124[1] + 3 * v80 + 2) = v79;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v113, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v76);
  unint64_t v83 = *(void **)(a1 + 8);
  if (v83) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v74, v83, v82);
  }
  int v84 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v84 + 1;
  *((_DWORD *)&v124[1] + v81 + 1) = v84 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v111, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v82);
  int v86 = *(void **)(a1 + 8);
  if (v86) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v74, v86, v85);
  }
  int v87 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 24) = v87 + 1;
  *((_DWORD *)&v124[1] + v62 + 1) = v87 + NumFVarValuesTotal;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)v123, *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)a1, v85);
  unint64_t v89 = *(void **)(a1 + 8);
  if (v89) {
    OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(v56, v89, v88);
  }
  uint64_t v90 = 0;
  uint64_t v91 = (void *)(a1 + 48);
  int v92 = *(char **)(a1 + 40);
  do
  {
    uint64_t v93 = OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::getPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,int,OpenSubdiv::v3_1_1::Vtr::ConstArray<int>,int,int)::permuteRegular[v90];
    if ((unint64_t)v92 >= *v91)
    {
      uint64_t v95 = *(char **)(a1 + 32);
      uint64_t v96 = (v92 - v95) >> 2;
      unint64_t v97 = v96 + 1;
      if ((unint64_t)(v96 + 1) >> 62) {
        abort();
      }
      uint64_t v98 = *v91 - (void)v95;
      if (v98 >> 1 > v97) {
        unint64_t v97 = v98 >> 1;
      }
      if ((unint64_t)v98 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v99 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v99 = v97;
      }
      if (v99)
      {
        int v100 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(a1 + 48, v99);
        uint64_t v95 = *(char **)(a1 + 32);
        int v92 = *(char **)(a1 + 40);
      }
      else
      {
        int v100 = 0;
      }
      uint64_t v101 = &v100[4 * v96];
      *(_DWORD *)uint64_t v101 = *((_DWORD *)v124 + v93);
      int v94 = v101 + 4;
      while (v92 != v95)
      {
        int v102 = *((_DWORD *)v92 - 1);
        v92 -= 4;
        *((_DWORD *)v101 - 1) = v102;
        v101 -= 4;
      }
      *(void *)(a1 + 32) = v101;
      *(void *)(a1 + 40) = v94;
      *(void *)(a1 + 48) = &v100[4 * v99];
      if (v95) {
        operator delete(v95);
      }
    }
    else
    {
      *(_DWORD *)int v92 = *((_DWORD *)v124 + v93);
      int v94 = v92 + 4;
    }
    *(void *)(a1 + 40) = v94;
    ++v90;
    int v92 = v94;
  }
  while (v90 != 16);
  uint64_t v103 = *(int *)(a1 + 28);
  *(_DWORD *)(a1 + 28) = v103 + 1;
  uint64_t v104 = *(void *)(a1 + 32);
  operator delete(__p);
  operator delete(v114);
  operator delete(v116);
  operator delete(v118);
  operator delete(v120);
  operator delete(v122);
  operator delete((void *)v123[43]);
  operator delete(v127);
  operator delete(v130);
  operator delete(v133);
  return v104 + (v103 << 6);
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(OpenSubdiv::v3_1_1::Far::GregoryBasis *this, const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3)
{
  uint64_t v5 = *(unsigned int *)this;
  uint64_t v6 = (char *)a2 + 32;
  unint64_t v7 = *((void *)a2 + 4);
  uint64_t v8 = (char *)*((void *)a2 + 3);
  if ((unint64_t)v8 >= v7)
  {
    int v10 = (char *)*((void *)a2 + 2);
    uint64_t v11 = (v8 - v10) >> 2;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62) {
LABEL_53:
    }
      abort();
    uint64_t v13 = v7 - (void)v10;
    if (v13 >> 1 > v12) {
      unint64_t v12 = v13 >> 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v14 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    if (v14)
    {
      __int16 v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)v6, v14);
      int v10 = (char *)*((void *)a2 + 2);
      uint64_t v8 = (char *)*((void *)a2 + 3);
    }
    else
    {
      __int16 v15 = 0;
    }
    unsigned int v16 = &v15[4 * v11];
    int v17 = &v15[4 * v14];
    *(_DWORD *)unsigned int v16 = v5;
    int v9 = v16 + 4;
    while (v8 != v10)
    {
      int v18 = *((_DWORD *)v8 - 1);
      v8 -= 4;
      *((_DWORD *)v16 - 1) = v18;
      v16 -= 4;
    }
    *((void *)a2 + 2) = v16;
    *((void *)a2 + 3) = v9;
    *((void *)a2 + 4) = v17;
    if (v10) {
      operator delete(v10);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v8 = v5;
    int v9 = v8 + 4;
  }
  *((void *)a2 + 3) = v9;
  if ((int)v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      int v20 = *(_DWORD *)(*((void *)this + 1) + 8 * i);
      uint64_t v22 = (char *)*((void *)a2 + 9);
      unint64_t v21 = *((void *)a2 + 10);
      if ((unint64_t)v22 >= v21)
      {
        uint64_t v24 = (char *)*((void *)a2 + 8);
        uint64_t v25 = (v22 - v24) >> 2;
        unint64_t v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62) {
          goto LABEL_53;
        }
        uint64_t v27 = v21 - (void)v24;
        if (v27 >> 1 > v26) {
          unint64_t v26 = v27 >> 1;
        }
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v28 = v26;
        }
        if (v28)
        {
          uint64_t v29 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)a2 + 80, v28);
          uint64_t v24 = (char *)*((void *)a2 + 8);
          uint64_t v22 = (char *)*((void *)a2 + 9);
        }
        else
        {
          uint64_t v29 = 0;
        }
        uint64_t v30 = &v29[4 * v25];
        *(_DWORD *)uint64_t v30 = v20;
        int v23 = v30 + 4;
        while (v22 != v24)
        {
          int v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30 - 1) = v31;
          v30 -= 4;
        }
        *((void *)a2 + 8) = v30;
        *((void *)a2 + 9) = v23;
        *((void *)a2 + 10) = &v29[4 * v28];
        if (v24) {
          operator delete(v24);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v22 = v20;
        int v23 = v22 + 4;
      }
      *((void *)a2 + 9) = v23;
      int v32 = *(_DWORD *)(*((void *)this + 1) + 8 * i + 4);
      uint64_t v34 = (char *)*((void *)a2 + 12);
      unint64_t v33 = *((void *)a2 + 13);
      if ((unint64_t)v34 >= v33)
      {
        uint64_t v36 = (char *)*((void *)a2 + 11);
        uint64_t v37 = (v34 - v36) >> 2;
        unint64_t v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 62) {
          goto LABEL_53;
        }
        uint64_t v39 = v33 - (void)v36;
        if (v39 >> 1 > v38) {
          unint64_t v38 = v39 >> 1;
        }
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v40 = v38;
        }
        if (v40)
        {
          uint64_t v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)a2 + 104, v40);
          uint64_t v36 = (char *)*((void *)a2 + 11);
          uint64_t v34 = (char *)*((void *)a2 + 12);
        }
        else
        {
          uint64_t v41 = 0;
        }
        int v42 = &v41[4 * v37];
        *(_DWORD *)int v42 = v32;
        uint64_t v35 = v42 + 4;
        while (v34 != v36)
        {
          int v43 = *((_DWORD *)v34 - 1);
          v34 -= 4;
          *((_DWORD *)v42 - 1) = v43;
          v42 -= 4;
        }
        *((void *)a2 + 11) = v42;
        *((void *)a2 + 12) = v35;
        *((void *)a2 + 13) = &v41[4 * v40];
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v34 = v32;
        uint64_t v35 = v34 + 4;
      }
      *((void *)a2 + 12) = v35;
    }
  }
}

void OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils(int a1, OpenSubdiv::v3_1_1::Vtr::internal::Level *this, uint64_t a3, int a4, int a5, unsigned int a6, OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *a7, int *a8, int *a9)
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  int v15 = *((_DWORD *)this + 5);
  unsigned int v16 = v64;
  int v62 = (int *)v64;
  uint64_t v63 = 0x2800000000;
  int v65 = 0;
  unsigned int v17 = 2 * v15;
  if (v15)
  {
    if (v17 < 0x29) {
      goto LABEL_6;
    }
    operator delete(0);
    int v62 = (int *)v64;
    HIDWORD(v63) = 40;
    unsigned int v16 = operator new(4 * v17);
    int v65 = v16;
    int v18 = v17;
  }
  else
  {
    operator delete(0);
    int v18 = 40;
  }
  int v62 = (int *)v16;
  HIDWORD(v63) = v18;
LABEL_6:
  LODWORD(v63) = v17;
  int v19 = OpenSubdiv::v3_1_1::Vtr::internal::Level::gatherQuadRegularRingAroundVertex(this, *(_DWORD *)(a3 + 4 * a5), (int *)v16, a6);
  if (v19) {
    OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils();
  }
  int v47 = a8;
  if (v19 >= 0) {
    int v20 = v19;
  }
  else {
    int v20 = v19 + 1;
  }
  if (v19 < 2) {
    goto LABEL_32;
  }
  uint64_t v21 = 0;
  uint64_t v22 = (v20 >> 1);
  unsigned int v23 = v19 + 1;
  int v24 = a5 + 3 <= 0 ? -(-(a5 + 3) & 3) : (a5 + 3) & 3;
  int v25 = a5 + 1 <= 0 ? -(-(a5 + 1) & 3) : (a5 + 1) & 3;
  unint64_t v26 = v62;
  int v27 = *(_DWORD *)(a3 + 4 * v25);
  int v28 = *(_DWORD *)(a3 + 4 * v24);
  int v29 = -1;
  int v30 = -1;
  do
  {
    int v32 = *v26;
    v26 += 2;
    int v31 = v32;
    if (v32 == v27) {
      int v29 = v21;
    }
    if (v31 == v28) {
      int v30 = v21;
    }
    ++v21;
  }
  while (v22 != v21);
  if (v29 < 0 || v30 < 0) {
LABEL_32:
  }
    OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils();
  LODWORD(v59[0]) = 0;
  v59[1] = &v60;
  int v61 = 0;
  v59[2] = (void *)0x2800000028;
  LODWORD(v56[0]) = 0;
  v56[1] = &v57;
  unsigned int v58 = 0;
  v56[2] = (void *)0x2800000028;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v59, v23);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Clear(v56, v23);
  float v33 = (float)(int)v22;
  float v34 = cosf(6.2832 / (float)(int)v22);
  uint64_t v35 = 0;
  uint64_t v49 = a3;
  uint64_t v36 = 0;
  float v37 = 1.0
      / (float)((float)((float)((float)(v34 + 5.0) + sqrtf((float)(v34 + 9.0) * (float)(v34 + 1.0))) * (float)(int)v22)
              * 0.0625);
  uint64_t v48 = a5;
  int v50 = a7;
  do
  {
    uint64_t v38 = v36 + 1;
    if (v22 - 1 == v36) {
      int v39 = 0;
    }
    else {
      int v39 = v36 + 1;
    }
    int v40 = v62[v35];
    int v41 = v62[v35 + 1];
    int v42 = v62[2 * v39];
    int v51 = 0;
    int v52 = &v54;
    std::string __p = 0;
    uint64_t v53 = 0x2800000004;
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, *(_DWORD *)(v49 + 4 * v48), v33 / (float)(v33 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v42, 2.0 / (float)(v33 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v40, 2.0 / (float)(v33 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v41, 1.0 / (float)((float)(int)v22 + 5.0));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight(v50, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, 1.0 / v33);
    __float2 v43 = __sincosf_stret((float)((float)(int)v36 * 6.2832) / v33);
    __float2 v44 = __sincosf_stret((float)((float)v39 * 6.2832) / v33);
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v59, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v37 * (float)((float)(v44.__cosval * 0.5) + (float)(v43.__cosval * 0.5)));
    OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v56, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)&v51, v37 * (float)((float)(v44.__sinval * 0.5) + (float)(v43.__sinval * 0.5)));
    operator delete(__p);
    v35 += 2;
    ++v36;
  }
  while (v22 != v38);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(v47, (int *)v50);
  __float2 v45 = __sincosf_stret((float)((float)v29 * 6.2832) / v33);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v47, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v59, v45.__cosval);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v47, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v56, v45.__sinval);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::operator=(a9, (int *)v50);
  __float2 v46 = __sincosf_stret((float)((float)v30 * 6.2832) / v33);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)a9, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v59, v46.__cosval);
  OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::AddWithWeight((OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)a9, (const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *)v56, v46.__sinval);
  operator delete(v58);
  operator delete(v61);
  operator delete(v65);
}

void OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable(OpenSubdiv::v3_1_1::Far::GregoryBasis *this, void *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3)
{
  int v4 = (int)this;
  uint64_t v5 = (uint64_t)(a2 + 4);
  unint64_t v6 = a2[4];
  unint64_t v7 = (char *)a2[3];
  if ((unint64_t)v7 >= v6)
  {
    int v9 = (char *)a2[2];
    uint64_t v10 = (v7 - v9) >> 2;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 62) {
      goto LABEL_50;
    }
    uint64_t v12 = v6 - (void)v9;
    if (v12 >> 1 > v11) {
      unint64_t v11 = v12 >> 1;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(v5, v13);
      int v9 = (char *)a2[2];
      unint64_t v7 = (char *)a2[3];
    }
    else
    {
      unint64_t v14 = 0;
    }
    int v15 = &v14[4 * v10];
    unsigned int v16 = &v14[4 * v13];
    *(_DWORD *)int v15 = 1;
    uint64_t v8 = v15 + 4;
    while (v7 != v9)
    {
      int v17 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v17;
      v15 -= 4;
    }
    a2[2] = v15;
    a2[3] = v8;
    a2[4] = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    *(_DWORD *)unint64_t v7 = 1;
    uint64_t v8 = v7 + 4;
  }
  unint64_t v18 = a2[10];
  a2[3] = v8;
  int v19 = (char *)a2[9];
  if ((unint64_t)v19 >= v18)
  {
    uint64_t v21 = (char *)a2[8];
    uint64_t v22 = (v19 - v21) >> 2;
    unint64_t v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) >> 62) {
      goto LABEL_50;
    }
    uint64_t v24 = v18 - (void)v21;
    if (v24 >> 1 > v23) {
      unint64_t v23 = v24 >> 1;
    }
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v23;
    }
    if (v25)
    {
      unint64_t v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 10), v25);
      uint64_t v21 = (char *)a2[8];
      int v19 = (char *)a2[9];
    }
    else
    {
      unint64_t v26 = 0;
    }
    int v27 = &v26[4 * v22];
    int v28 = &v26[4 * v25];
    *(_DWORD *)int v27 = v4;
    int v20 = v27 + 4;
    while (v19 != v21)
    {
      int v29 = *((_DWORD *)v19 - 1);
      v19 -= 4;
      *((_DWORD *)v27 - 1) = v29;
      v27 -= 4;
    }
    a2[8] = v27;
    a2[9] = v20;
    a2[10] = v28;
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    *(_DWORD *)int v19 = v4;
    int v20 = v19 + 4;
  }
  unint64_t v30 = a2[13];
  a2[9] = v20;
  int v31 = (char *)a2[12];
  if ((unint64_t)v31 < v30)
  {
    *(_DWORD *)int v31 = 1065353216;
    int v32 = v31 + 4;
    goto LABEL_49;
  }
  float v33 = (char *)a2[11];
  uint64_t v34 = (v31 - v33) >> 2;
  unint64_t v35 = v34 + 1;
  if ((unint64_t)(v34 + 1) >> 62) {
LABEL_50:
  }
    abort();
  uint64_t v36 = v30 - (void)v33;
  if (v36 >> 1 > v35) {
    unint64_t v35 = v36 >> 1;
  }
  if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v37 = v35;
  }
  if (v37)
  {
    uint64_t v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a2 + 13), v37);
    float v33 = (char *)a2[11];
    int v31 = (char *)a2[12];
  }
  else
  {
    uint64_t v38 = 0;
  }
  int v39 = &v38[4 * v34];
  int v40 = &v38[4 * v37];
  *(_DWORD *)int v39 = 1065353216;
  int v32 = v39 + 4;
  while (v31 != v33)
  {
    int v41 = *((_DWORD *)v31 - 1);
    v31 -= 4;
    *((_DWORD *)v39 - 1) = v41;
    v39 -= 4;
  }
  a2[11] = v39;
  a2[12] = v32;
  a2[13] = v40;
  if (v33) {
    operator delete(v33);
  }
LABEL_49:
  a2[12] = v32;
}

OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *OpenSubdiv::v3_1_1::Far::GregoryBasis::Point::Point(OpenSubdiv::v3_1_1::Far::GregoryBasis::Point *this, unsigned int a2)
{
  *(_DWORD *)this = 0;
  int v4 = (char *)this + 24;
  *((void *)this + 1) = (char *)this + 24;
  *((void *)this + 2) = 0x2800000000;
  *((void *)this + 43) = 0;
  if (!a2)
  {
    operator delete(0);
    int v5 = 40;
    goto LABEL_5;
  }
  if (a2 >= 0x29)
  {
    operator delete(0);
    *((void *)this + 1) = v4;
    *((_DWORD *)this + 5) = 40;
    int v4 = (char *)operator new(8 * a2);
    *((void *)this + 43) = v4;
    int v5 = a2;
LABEL_5:
    *((void *)this + 1) = v4;
    *((_DWORD *)this + 5) = v5;
  }
  *((_DWORD *)this + 4) = a2;
  return this;
}

void OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::EndCapBSplineBasisPatchFactory()
{
}

void OpenSubdiv::v3_1_1::Far::EndCapBSplineBasisPatchFactory::computeLimitStencils()
{
}

{
  __assert_rtn("computeLimitStencils", "endCapBSplineBasisPatchFactory.cpp", 234, "(ringSize & 1) == 0");
}

OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory *OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::EndCapGregoryBasisPatchFactory(OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory *this, const OpenSubdiv::v3_1_1::Far::TopologyRefiner *a2, OpenSubdiv::v3_1_1::Far::StencilTable *a3, OpenSubdiv::v3_1_1::Far::StencilTable *a4, char a5)
{
  *(void *)this = a3;
  *((void *)this + 1) = a4;
  *((void *)this + 2) = a2;
  *((unsigned char *)this + 24) = a5;
  *((_DWORD *)this + 7) = 0;
  *((_DWORD *)this + 8) = 0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  unint64_t v5 = *((unsigned __int8 *)a2 + 8);
  if (v5) {
    OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::EndCapGregoryBasisPatchFactory();
  }
  uint64_t v8 = **(int **)(*((void *)a2 + 11) + 24 * ((v5 >> 2) & 0xF));
  std::vector<int>::size_type v9 = 20 * v8;
  int v10 = 320 * v8;
  if (v10 >= 104857600) {
    int v11 = 104857600;
  }
  else {
    int v11 = v10;
  }
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 16), v9);
  std::vector<unsigned int>::reserve((std::vector<int> *)((char *)a3 + 64), v11);
  std::vector<float>::reserve((void **)a3 + 11, v11);
  uint64_t v12 = *((void *)this + 1);
  if (v12)
  {
    std::vector<unsigned int>::reserve((std::vector<int> *)(v12 + 16), v9);
    std::vector<unsigned int>::reserve((std::vector<int> *)(v12 + 64), v9);
    std::vector<float>::reserve((void **)(v12 + 88), v9);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::addPatchBasis(uint64_t a1)
{
  double v1 = MEMORY[0x270FA5388](a1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  OpenSubdiv::v3_1_1::Far::GregoryBasis::ProtoBasis::ProtoBasis(v27, v1);
  uint64_t v7 = 0;
  uint64_t v8 = (unsigned char *)(v3 + 2);
  uint64_t v9 = 5632;
  uint64_t v10 = 7040;
  uint64_t v11 = 4224;
  do
  {
    if (*(v8 - 2))
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v7], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      uint64_t v12 = *(void **)(v5 + 8);
      if (v12) {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v12, v6);
      }
    }
    if (*(v8 - 1))
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v7 + 1408], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      unint64_t v13 = *(void **)(v5 + 8);
      if (v13) {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v13, v6);
      }
    }
    if (*v8)
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v7 + 2816], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      unint64_t v14 = *(void **)(v5 + 8);
      if (v14) {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v14, v6);
      }
    }
    if (v8[1])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v11], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      int v15 = *(void **)(v5 + 8);
      if (v15) {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v15, v6);
      }
    }
    if (v8[2])
    {
      OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)&v27[v9], *(const OpenSubdiv::v3_1_1::Far::GregoryBasis::Point **)v5, v6);
      unsigned int v16 = *(void **)(v5 + 8);
      if (v16) {
        OpenSubdiv::v3_1_1::Far::GregoryBasis::AppendToStencilTable((OpenSubdiv::v3_1_1::Far::GregoryBasis *)*(unsigned int *)&v27[v10], v16, v6);
      }
    }
    v7 += 352;
    v8 += 5;
    v9 += 352;
    v10 += 4;
    v11 += 352;
  }
  while (v7 != 1408);
  for (uint64_t i = 0; i != -1408; i -= 352)
  {
    unint64_t v18 = &v27[i];
    operator delete(*(void **)&v27[i + 7032]);
    *((void *)v18 + 837) = &v27[i + 6712];
    *((_DWORD *)v18 + 1677) = 40;
  }
  for (uint64_t j = 0; j != -1408; j -= 352)
  {
    int v20 = &v27[j];
    operator delete(*(void **)&v27[j + 5624]);
    *((void *)v20 + 661) = &v27[j + 5304];
    *((_DWORD *)v20 + 1325) = 40;
  }
  for (uint64_t k = 0; k != -1408; k -= 352)
  {
    uint64_t v22 = &v27[k];
    operator delete(*(void **)&v27[k + 4216]);
    *((void *)v22 + 485) = v22 + 3896;
    *((_DWORD *)v22 + 973) = 40;
  }
  uint64_t v23 = 1408;
  do
  {
    uint64_t v24 = &v27[v23];
    operator delete(*(void **)&v27[v23 + 1400]);
    *((void *)v24 + 133) = v24 + 1080;
    *((_DWORD *)v24 + 269) = 40;
    v23 -= 352;
  }
  while (v23);
  uint64_t v25 = 1408;
  do
  {
    operator delete(*(void **)&v27[v25 - 8]);
    *(void *)&v27[v25 - 344] = &v27[v25 - 328];
    *(_DWORD *)&v27[v25 - 332] = 40;
    v25 -= 352;
  }
  while (v25);
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6)
{
  int v10 = 0;
  v71[3] = *MEMORY[0x263EF8340];
  uint64_t v11 = (void *)(a1 + 56);
  uint64_t v12 = *(char **)(a1 + 48);
  do
  {
    if ((unint64_t)v12 >= *v11)
    {
      unint64_t v14 = *(char **)(a1 + 40);
      uint64_t v15 = (v12 - v14) >> 2;
      unint64_t v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 62) {
        goto LABEL_70;
      }
      uint64_t v17 = *v11 - (void)v14;
      if (v17 >> 1 > v16) {
        unint64_t v16 = v17 >> 1;
      }
      if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v18 = v16;
      }
      if (v18)
      {
        int v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)v11, v18);
        unint64_t v14 = *(char **)(a1 + 40);
        uint64_t v12 = *(char **)(a1 + 48);
      }
      else
      {
        int v19 = 0;
      }
      int v20 = &v19[4 * v15];
      *(_DWORD *)int v20 = -1;
      unint64_t v13 = v20 + 4;
      while (v12 != v14)
      {
        int v21 = *((_DWORD *)v12 - 1);
        v12 -= 4;
        *((_DWORD *)v20 - 1) = v21;
        v20 -= 4;
      }
      *(void *)(a1 + 40) = v20;
      *(void *)(a1 + 48) = v13;
      *(void *)(a1 + 56) = &v19[4 * v18];
      if (v14) {
        operator delete(v14);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v12 = -1;
      unint64_t v13 = v12 + 4;
    }
    *(void *)(a1 + 48) = v13;
    ++v10;
    uint64_t v12 = v13;
  }
  while (v10 != 20);
  uint64_t v22 = *(void *)(a1 + 40) + 80 * *(int *)(a1 + 32);
  uint64_t v23 = *(OpenSubdiv::v3_1_1::Far::TopologyRefiner **)(a1 + 16);
  if (a6 < 0) {
    int NumFVarValuesTotal = *((_DWORD *)v23 + 5);
  }
  else {
    int NumFVarValuesTotal = OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(v23, a6);
  }
  if (!*(unsigned char *)(a1 + 24)) {
    goto LABEL_59;
  }
  uint64_t v25 = *(void *)(a2 + 24);
  if (*(_DWORD *)(v25 + 8 * a3) != 4) {
    OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints();
  }
  unsigned int v26 = a6;
  uint64_t v27 = *(void *)(a2 + 72) + 4 * *(int *)(v25 + 8 * a3 + 4);
  int v28 = *(_DWORD *)(a2 + 12);
  OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceETags((void *)a2, a3, v70, v26);
  uint64_t v29 = 0;
  int v68 = v28 << 28;
  unint64_t v30 = (char *)&OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::gregoryEdgeVerts;
  do
  {
    if ((v70[v29] & 2) != 0) {
      goto LABEL_41;
    }
    uint64_t v31 = *(int *)(v27 + 4 * v29);
    uint64_t v32 = *(void *)(a2 + 144);
    uint64_t v33 = *(unsigned int *)(v32 + 8 * v31);
    if ((int)v33 < 1)
    {
LABEL_30:
      int v36 = 0;
    }
    else
    {
      uint64_t v34 = 0;
      uint64_t v35 = *(void *)(a2 + 168) + 4 * *(int *)(v32 + 4 * (int)((2 * v31) | 1));
      while (*(_DWORD *)(v35 + 4 * v34) != a3)
      {
        if (v33 == ++v34) {
          goto LABEL_30;
        }
      }
      int v36 = *(_DWORD *)(v35 + 4 * (((int)v34 + 1) % (int)v33));
    }
    if (v36 == -1 || v36 >= a3) {
      goto LABEL_41;
    }
    if (*(void *)(a1 + 64) == *(void *)(a1 + 72)) {
      break;
    }
    uint64_t v37 = *(void *)(a2 + 24);
    uint64_t v38 = *(int *)(v37 + 8 * v36 + 4);
    uint64_t v39 = *(unsigned int *)(v37 + 8 * v36);
    v71[0] = *(void *)(a2 + 72) + 4 * v38;
    v71[1] = v39;
    int IndexIn4Tuple = OpenSubdiv::v3_1_1::Vtr::ConstArray<int>::FindIndexIn4Tuple((uint64_t)v71, v31);
    if (IndexIn4Tuple == -1) {
      OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints();
    }
    int v41 = IndexIn4Tuple;
    int __key = v36 | v68;
    int v42 = bsearch(&__key, *(const void **)(a1 + 64), (uint64_t)(*(void *)(a1 + 72) - *(void *)(a1 + 64)) >> 2, 4uLL, (int (__cdecl *)(const void *, const void *))OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::LevelAndFaceIndex::compare);
    if (!v42) {
      break;
    }
    uint64_t v43 = *(void *)(a1 + 64);
    unint64_t v44 = ((unint64_t)v42 - v43) >> 2;
    if ((v44 & 0x80000000) != 0 || (int)v44 >= (int)((unint64_t)(*(void *)(a1 + 72) - v43) >> 2)) {
      OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints();
    }
    uint64_t v45 = *(void *)(a1 + 40) + ((uint64_t)((unint64_t)(5 * v44) << 34) >> 30);
    __float2 v46 = (int *)((char *)&OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::gregoryEdgeVerts
                + 16 * v41);
    for (uint64_t i = 12; i != -4; i -= 4)
    {
      uint64_t v48 = *v46++;
      *(_DWORD *)(v22 + 4 * *(int *)&v30[i]) = *(_DWORD *)(v45 + 4 * v48);
    }
LABEL_41:
    ++v29;
    v30 += 16;
  }
  while (v29 != 4);
  int v49 = v68 | a3;
  unint64_t v50 = *(void *)(a1 + 80);
  int v51 = *(int **)(a1 + 72);
  if ((unint64_t)v51 < v50)
  {
    int *v51 = v49;
    int v52 = v51 + 1;
    goto LABEL_58;
  }
  uint64_t v53 = *(int **)(a1 + 64);
  uint64_t v54 = v51 - v53;
  unint64_t v55 = v54 + 1;
  if ((unint64_t)(v54 + 1) >> 62) {
LABEL_70:
  }
    abort();
  uint64_t v56 = v50 - (void)v53;
  if (v56 >> 1 > v55) {
    unint64_t v55 = v56 >> 1;
  }
  if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v57 = v55;
  }
  if (v57)
  {
    unsigned int v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>(a1 + 80, v57);
    uint64_t v53 = *(int **)(a1 + 64);
    int v51 = *(int **)(a1 + 72);
  }
  else
  {
    unsigned int v58 = 0;
  }
  unint64_t v59 = (int *)&v58[4 * v54];
  uint64_t v60 = &v58[4 * v57];
  *unint64_t v59 = v49;
  int v52 = v59 + 1;
  while (v51 != v53)
  {
    int v61 = *--v51;
    *--unint64_t v59 = v61;
  }
  *(void *)(a1 + 64) = v59;
  *(void *)(a1 + 72) = v52;
  *(void *)(a1 + 80) = v60;
  if (v53) {
    operator delete(v53);
  }
LABEL_58:
  *(void *)(a1 + 72) = v52;
LABEL_59:
  uint64_t v62 = 0;
  uint64_t v63 = v71;
  uint64_t v64 = v22;
  do
  {
    for (uint64_t j = 0; j != 5; ++j)
    {
      if (*(_DWORD *)(v64 + 4 * j) == -1)
      {
        *(_DWORD *)(v64 + 4 * j) = *(_DWORD *)(a1 + 28) + NumFVarValuesTotal;
        ++*(_DWORD *)(a1 + 28);
        char v66 = 1;
      }
      else
      {
        char v66 = 0;
      }
      *((unsigned char *)v63 + j) = v66;
    }
    ++v62;
    uint64_t v63 = (void *)((char *)v63 + 5);
    v64 += 20;
  }
  while (v62 != 4);
  OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::addPatchBasis(a1);
  ++*(_DWORD *)(a1 + 32);
  return v22;
}

uint64_t OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints(OpenSubdiv::v3_1_1::Vtr::internal::Level const*,int,OpenSubdiv::v3_1_1::Vtr::internal::Level::VSpan const*,int,int)::LevelAndFaceIndex::compare(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::EndCapGregoryBasisPatchFactory()
{
}

void OpenSubdiv::v3_1_1::Far::EndCapGregoryBasisPatchFactory::GetPatchPoints()
{
  __assert_rtn("GetPatchPoints", "endCapGregoryBasisPatchFactory.cpp", 191, "aedge!=Vtr::INDEX_INVALID");
}

{
  __assert_rtn("GetPatchPoints", "endCapGregoryBasisPatchFactory.cpp", 205, "adjPatchIndex>=0 && adjPatchIndex<(int)_levelAndFaceIndices.size()");
}

{
  __assert_rtn("GetPatchPoints", "endCapGregoryBasisPatchFactory.cpp", 156, "fedges.size()==4");
}

void OpenSubdiv::v3_1_1::Vtr::internal::SparseSelector::selectFace(OpenSubdiv::v3_1_1::Vtr::internal::Refinement **this, int a2)
{
  if (!*((unsigned char *)this + 8))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::Refinement::initializeSparseSelectionTags(*this);
    *((unsigned char *)this + 8) = 1;
  }
  uint64_t v4 = *((void *)*this + 51);
  if ((*(unsigned char *)(v4 + a2) & 1) == 0)
  {
    *(unsigned char *)(v4 + a2) |= 1u;
    uint64_t v5 = (void *)*((void *)*this + 1);
    uint64_t v6 = v5[3];
    uint64_t v7 = *(unsigned int *)(v6 + 8 * a2);
    if ((int)v7 >= 1)
    {
      uint64_t v8 = *(int *)(v6 + 8 * a2 + 4);
      uint64_t v9 = (int *)(v5[9] + 4 * v8);
      int v10 = (int *)(v5[6] + 4 * v8);
      do
      {
        uint64_t v11 = *v9++;
        *(unsigned char *)(*((void *)*this + 54) + v11) |= 1u;
        uint64_t v12 = *v10++;
        *(unsigned char *)(*((void *)*this + 57) + v12) |= 1u;
        --v7;
      }
      while (v7);
    }
  }
}

double OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::QuadRefinement(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4 = (void *)OpenSubdiv::v3_1_1::Vtr::internal::Refinement::Refinement(a1, a2, a3, a4);
  *uint64_t v4 = &unk_26BF6C728;
  *(void *)&double result = 0x400000000;
  *(void *)((char *)v4 + 28) = 0x400000000;
  return result;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::~QuadRefinement(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  OpenSubdiv::v3_1_1::Vtr::internal::Refinement::~Refinement(this);

  JUMPOUT(0x210534FE0);
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::allocateParentChildIndices(std::vector<int> *this)
{
  std::vector<int>::pointer end = this->__end_;
  uint64_t v3 = *((void *)end + 7) - *((void *)end + 6);
  uint64_t v4 = *((void *)end + 10) - *((void *)end + 9);
  uint64_t v5 = *((void *)end + 16) - *((void *)end + 15);
  std::vector<int>::size_type v6 = *end;
  std::vector<int>::size_type v7 = end[1];
  std::vector<int>::size_type v8 = end[2];
  std::vector<int>::value_type __x = 0;
  uint64_t v9 = (int *)*((void *)end + 3);
  uint64_t v10 = (*((void *)end + 4) - (void)v9) >> 2;
  this[3].__end_cap_.__value_ = v9;
  LODWORD(this[4].__begin_) = v10;
  uint64_t v11 = (int *)*((void *)end + 3);
  uint64_t v12 = (*((void *)end + 4) - (void)v11) >> 2;
  this[4].__end_ = v11;
  LODWORD(this[4].__end_cap_.__value_) = v12;
  std::vector<int>::resize(this + 5, (int)(v3 >> 2), &__x);
  std::vector<int>::resize(this + 6, (int)(v4 >> 2), &__x);
  std::vector<int>::resize(this + 8, (int)(v5 >> 2), &__x);
  std::vector<int>::resize(this + 7, v6, &__x);
  std::vector<int>::resize(this + 9, v7, &__x);
  std::vector<int>::resize(this + 10, v8, &__x);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  uint64_t v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexCountsAndOffsets(this);
    uint64_t v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  }
  std::vector<int>::resize(v2 + 2, 4 * SLODWORD(v2->__begin_));

  return OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVerticesFromParentFaces(this);
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexCountsAndOffsets(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 24), 2 * **((int **)this + 2));
  uint64_t v2 = (int *)*((void *)this + 2);
  if (*v2 >= 1)
  {
    int v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = (_DWORD *)(*((void *)v2 + 3) + 4);
    do
    {
      *(v5 - 1) = 4;
      *uint64_t v5 = v3;
      ++v4;
      v3 += 4;
      v5 += 2;
    }
    while (v4 < *v2);
  }
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVerticesFromParentFaces(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = *(void *)(v1 + 48);
    uint64_t v6 = *(void *)(v1 + 72);
    uint64_t v7 = this[11];
    uint64_t v8 = this[15];
    do
    {
      uint64_t v9 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v9 >= 1)
      {
        uint64_t v10 = 0;
        uint64_t v11 = (8 * v3) | 4;
        uint64_t v12 = *(int *)(v4 + v11);
        uint64_t v13 = v5 + 4 * v12;
        uint64_t v14 = v6 + 4 * v12;
        uint64_t v15 = v8 + 4 * *(int *)(v7 + v11);
        do
        {
          int v16 = *(_DWORD *)(v15 + 4 * v10);
          if (v16 != -1)
          {
            if (v10) {
              int v17 = v10;
            }
            else {
              int v17 = v9;
            }
            int v18 = *(_DWORD *)(this[21] + 4 * v3);
            LODWORD(v19) = v17 - 1;
            uint64_t v20 = this[27];
            int v21 = *(_DWORD *)(v20 + 4 * *(int *)(v14 + 4 * (v17 - 1)));
            int v22 = *(_DWORD *)(this[30] + 4 * *(int *)(v13 + 4 * v10));
            int v23 = *(_DWORD *)(v20 + 4 * *(int *)(v14 + 4 * v10));
            uint64_t v24 = (_DWORD *)(*(void *)(this[2] + 48)
                           + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v16) | 1)));
            if (v9 == 4)
            {
              uint64_t v19 = (int)v19;
              LODWORD(v25) = v17 - 2;
              if (!v19) {
                LODWORD(v25) = 3;
              }
              v24[v10] = v22;
              if (v25) {
                int v26 = v25 - 1;
              }
              else {
                int v26 = 3;
              }
              v24[v26] = v23;
              uint64_t v25 = (int)v25;
            }
            else
            {
              *uint64_t v24 = v22;
              v24[1] = v23;
              uint64_t v25 = 2;
              uint64_t v19 = 3;
            }
            v24[v25] = v18;
            v24[v19] = v21;
          }
          ++v10;
        }
        while (v9 != v10);
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  int v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  if (v2[1].__end_ == v2[1].__begin_)
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceVertexCountsAndOffsets(this);
    int v2 = (std::vector<unsigned int> *)*((void *)this + 2);
  }
  std::vector<int>::resize(v2 + 3, 4 * SLODWORD(v2->__begin_));

  return OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceEdgesFromParentFaces(this);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateFaceEdgesFromParentFaces(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = *(void *)(v1 + 48);
    uint64_t v6 = *(void *)(v1 + 72);
    uint64_t v7 = this[11];
    uint64_t v8 = this[15];
    uint64_t v9 = this[13];
    uint64_t v10 = this[18];
    do
    {
      uint64_t v11 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v11 >= 1)
      {
        uint64_t v12 = 0;
        uint64_t v13 = (8 * v3) | 4;
        uint64_t v14 = *(int *)(v4 + v13);
        uint64_t v15 = v5 + 4 * v14;
        uint64_t v16 = v6 + 4 * v14;
        uint64_t v17 = v8 + 4 * *(int *)(v7 + v13);
        uint64_t v18 = v10 + 4 * *(int *)(v9 + v13);
        do
        {
          int v19 = *(_DWORD *)(v17 + 4 * v12);
          if (v19 != -1)
          {
            if (v12) {
              int v20 = v12;
            }
            else {
              int v20 = v11;
            }
            LODWORD(v21) = v20 - 1;
            uint64_t v22 = *(int *)(v16 + 4 * (v20 - 1));
            uint64_t v23 = *(void *)(v1 + 120);
            uint64_t v24 = (_DWORD *)(v23 + 8 * v22);
            uint64_t v25 = *(int *)(v16 + 4 * v12);
            int v26 = *(_DWORD *)(v15 + 4 * v12);
            uint64_t v27 = (_DWORD *)(v23 + 8 * v25);
            BOOL v29 = *v24 == v24[1] || *v24 != v26;
            BOOL v31 = *v27 != v27[1] && *v27 != v26;
            uint64_t v32 = this[24];
            int v33 = *(_DWORD *)(v32 + 8 * v22 + 4 * v29);
            int v34 = *(_DWORD *)(v32 + 8 * v25 + 4 * v31);
            int v35 = *(_DWORD *)(v18 + 4 * (int)v21);
            int v36 = *(_DWORD *)(v18 + 4 * v12);
            uint64_t v37 = (_DWORD *)(*(void *)(this[2] + 72)
                           + 4 * *(int *)(*(void *)(this[2] + 24) + 4 * ((2 * v19) | 1)));
            if (v11 == 4)
            {
              uint64_t v21 = (int)v21;
              LODWORD(v38) = v20 - 2;
              if (!v21) {
                LODWORD(v38) = 3;
              }
              v37[v12] = v34;
              if (v38) {
                int v39 = v38 - 1;
              }
              else {
                int v39 = 3;
              }
              v37[v39] = v36;
              uint64_t v38 = (int)v38;
            }
            else
            {
              *uint64_t v37 = v34;
              v37[1] = v36;
              uint64_t v38 = 2;
              uint64_t v21 = 3;
            }
            v37[v38] = v35;
            v37[v21] = v33;
          }
          ++v12;
        }
        while (v11 != v12);
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVertexRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 120), 2 * *(int *)(*((void *)this + 2) + 4));
  OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentFaces(this);

  return OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentEdges(this);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentFaces(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = *(void *)(v1 + 24);
    uint64_t v5 = *(void *)(v1 + 72);
    uint64_t v6 = this[13];
    uint64_t v7 = this[18];
    do
    {
      uint64_t v8 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = (8 * v3) | 4;
        uint64_t v10 = (int *)(v5 + 4 * *(int *)(v4 + v9));
        uint64_t v11 = (int *)(v7 + 4 * *(int *)(v6 + v9));
        do
        {
          uint64_t v13 = *v11++;
          uint64_t v12 = v13;
          if (v13 != -1)
          {
            uint64_t v14 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v12);
            *uint64_t v14 = *(_DWORD *)(this[21] + 4 * v3);
            v14[1] = *(_DWORD *)(this[27] + 4 * *v10);
          }
          ++v10;
          --v8;
        }
        while (v8);
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeVerticesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  if (*(int *)(v1 + 4) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = *(void *)(v1 + 120);
    uint64_t v4 = this[24];
    do
    {
      uint64_t v5 = 0;
      char v6 = 1;
      do
      {
        char v7 = v6;
        uint64_t v8 = *(int *)(v4 + 8 * v2 + 4 * v5);
        if (v8 != -1)
        {
          uint64_t v9 = (_DWORD *)(*(void *)(this[2] + 120) + 8 * v8);
          *uint64_t v9 = *(_DWORD *)(this[27] + 4 * v2);
          v9[1] = *(_DWORD *)(this[30] + 4 * *(int *)(v3 + 8 * v2 + 4 * v5));
        }
        char v6 = 0;
        uint64_t v5 = 1;
      }
      while ((v7 & 1) != 0);
      ++v2;
    }
    while (v2 < *(int *)(v1 + 4));
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  int v2 = 2
     * (((*(void *)(*((void *)this + 1) + 176) - *(void *)(*((void *)this + 1) + 168)) >> 2)
      + ((*(void *)(*((void *)this + 1) + 56) - *(void *)(*((void *)this + 1) + 48)) >> 2));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 144), 2 * *(int *)(*((void *)this + 2) + 4));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 168), v2);
  std::vector<unsigned short>::resize(*((void *)this + 2) + 192, v2);
  *(_DWORD *)(*((void *)this + 2) + 16) = *(_DWORD *)(*((void *)this + 1) + 16);
  OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentFaces(this);
  OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentEdges(this);
  uint64_t v3 = *((void *)this + 2);
  uint64_t v4 = (int *)(*(void *)(v3 + 144) + 4 * (2 * *(_DWORD *)(v3 + 4) - 2));
  std::vector<unsigned int>::size_type v5 = v4[1] + (uint64_t)*v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v3 + 168), v5);
  uint64_t v6 = *((void *)this + 2) + 192;

  std::vector<unsigned short>::resize(v6, v5);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentFaces(void *this)
{
  uint64_t v1 = (int *)this[1];
  int v2 = *v1;
  if (*v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[11];
    uint64_t v5 = this[15];
    uint64_t v6 = this[13];
    uint64_t v7 = this[18];
    do
    {
      uint64_t v8 = *(unsigned int *)(v4 + 8 * v3);
      if ((int)v8 >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = (8 * v3) | 4;
        uint64_t v11 = v5 + 4 * *(int *)(v4 + v10);
        uint64_t v12 = v7 + 4 * *(int *)(v6 + v10);
        do
        {
          uint64_t v13 = *(int *)(v12 + 4 * v9);
          if (v13 == -1)
          {
            ++v9;
          }
          else
          {
            uint64_t v14 = this[2];
            uint64_t v15 = *(void *)(v14 + 144);
            uint64_t v16 = (_DWORD *)(v15 + 8 * v13);
            *uint64_t v16 = 2;
            if (v13) {
              int v17 = *(v16 - 1) + *(v16 - 2);
            }
            else {
              int v17 = 0;
            }
            int v18 = 2 * v13;
            v16[1] = v17;
            int v19 = *(_DWORD *)(v14 + 16);
            if (v19 <= 2) {
              int v19 = 2;
            }
            *(_DWORD *)(v14 + 16) = v19;
            uint64_t v20 = *(int *)(v15 + 4 * (v18 | 1));
            uint64_t v21 = (_DWORD *)(*(void *)(v14 + 168) + 4 * v20);
            uint64_t v22 = (__int16 *)(*(void *)(v14 + 192) + 2 * v20);
            uint64_t v23 = v9 + 1;
            if (v9 + 1 >= v8) {
              unsigned int v24 = 0;
            }
            else {
              unsigned int v24 = v9 + 1;
            }
            int v25 = *(_DWORD *)(v11 + 4 * v9);
            if (v25 == -1)
            {
              uint64_t v27 = 0;
            }
            else
            {
              *uint64_t v21 = v25;
              if (v8 == 4) {
                __int16 v26 = v24;
              }
              else {
                __int16 v26 = 1;
              }
              *uint64_t v22 = v26;
              uint64_t v27 = 1;
            }
            int v28 = *(_DWORD *)(v11 + 4 * v24);
            if (v28 != -1)
            {
              v21[v27] = v28;
              __int16 v29 = ((_BYTE)v24 + 2) & 3;
              if (v8 != 4) {
                __int16 v29 = 2;
              }
              v22[v27] = v29;
              LODWORD(v27) = v27 + 1;
            }
            *uint64_t v16 = v27;
            uint64_t v9 = v23;
          }
        }
        while (v9 != v8);
        int v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateEdgeFacesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[24];
    do
    {
      uint64_t v5 = (_DWORD *)(v4 + 8 * v3);
      if (*v5 != -1 || v5[1] != -1)
      {
        uint64_t v6 = 0;
        uint64_t v7 = *(void *)(v1 + 144);
        uint64_t v8 = *(int *)(v7 + ((8 * v3) | 4));
        uint64_t v9 = *(unsigned int *)(v7 + 8 * v3);
        uint64_t v10 = *(void *)(v1 + 168) + 4 * v8;
        uint64_t v11 = *(void *)(v1 + 192) + 2 * v8;
        uint64_t v12 = (_DWORD *)(*(void *)(v1 + 120) + 8 * v3);
        char v13 = 1;
        do
        {
          char v14 = v13;
          uint64_t v15 = (int)v5[v6];
          if (v15 != -1)
          {
            uint64_t v16 = this[2];
            uint64_t v17 = *(void *)(v16 + 144);
            int v18 = (_DWORD *)(v17 + 8 * v15);
            *int v18 = v9;
            if (v15) {
              int v19 = *(v18 - 1) + *(v18 - 2);
            }
            else {
              int v19 = 0;
            }
            v18[1] = v19;
            int v20 = *(_DWORD *)(v16 + 16);
            if (v20 <= (int)v9) {
              int v20 = v9;
            }
            *(_DWORD *)(v16 + 16) = v20;
            if ((int)v9 < 1)
            {
              int v21 = 0;
            }
            else
            {
              int v21 = 0;
              uint64_t v22 = *(int *)(v17 + 4 * (int)((2 * v15) | 1));
              uint64_t v23 = *(void *)(v16 + 168) + 4 * v22;
              uint64_t v24 = *(void *)(v16 + 192) + 2 * v22;
              uint64_t v25 = *(void *)(v1 + 24);
              uint64_t v26 = this[11];
              uint64_t v27 = this[15];
              uint64_t v28 = v9;
              __int16 v29 = (int *)v10;
              unint64_t v30 = (unsigned __int16 *)v11;
              do
              {
                uint64_t v32 = *v29++;
                uint64_t v31 = v32;
                LODWORD(v32) = *v30++;
                unsigned int v33 = v32;
                uint64_t v34 = (2 * v31) | 1;
                BOOL v35 = v6;
                if (*v12 != v12[1]) {
                  BOOL v35 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(v25 + 4 * v34) + 4 * v33) != v12[v6];
                }
                int v36 = 2 * v31;
                uint64_t v37 = v27 + 4 * *(int *)(v26 + 4 * v34);
                if (v35 + v33 == *(_DWORD *)(v26 + 4 * v36)) {
                  unsigned int v38 = 0;
                }
                else {
                  unsigned int v38 = v35 + v33;
                }
                int v39 = *(_DWORD *)(v37 + 4 * v38);
                if (v39 != -1)
                {
                  int v40 = *(_DWORD *)(v25 + 4 * v36);
                  *(_DWORD *)(v23 + 4 * v21) = v39;
                  if (v35) {
                    __int16 v41 = 3;
                  }
                  else {
                    __int16 v41 = 0;
                  }
                  if (v40 != 4) {
                    LOWORD(v33) = v41;
                  }
                  *(_WORD *)(v24 + 2 * v21++) = v33;
                }
                --v28;
              }
              while (v28);
            }
            *int v18 = v21;
          }
          char v13 = 0;
          uint64_t v6 = 1;
        }
        while ((v14 & 1) != 0);
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFaceRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  int v2 = (void *)*((void *)this + 1);
  int v3 = (((v2[22] - v2[21]) >> 1) & 0xFFFFFFFE) + ((v2[7] - v2[6]) >> 2) + ((v2[37] - v2[36]) >> 2);
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 264), 2 * *(int *)(*((void *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 288), v3);
  std::vector<unsigned short>::resize(*((void *)this + 2) + 312, v3);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentEdges(this);
  }
  uint64_t v4 = *((void *)this + 2);
  uint64_t v5 = (int *)(*(void *)(v4 + 264) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  std::vector<unsigned int>::size_type v6 = v5[1] + (uint64_t)*v5;
  std::vector<int>::resize((std::vector<unsigned int> *)(v4 + 288), v6);
  uint64_t v7 = *((void *)this + 2) + 312;

  std::vector<unsigned short>::resize(v7, v6);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentVertices(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 288);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 264) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 312);
        uint64_t v11 = (void *)this[2];
        uint64_t v12 = (_DWORD *)(v11[33] + 8 * v5);
        *uint64_t v12 = v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = this[11];
          uint64_t v20 = this[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            __int16 v23 = v22;
            int v24 = *(_DWORD *)(v20 + 4 * *(int *)(v19 + 8 * v21 + 4) + 4 * v22);
            if (v24 != -1)
            {
              int v25 = *(_DWORD *)(v19 + 8 * v21);
              *(_DWORD *)(v17 + 4 * v14) = v24;
              if (v25 != 4) {
                __int16 v23 = 0;
              }
              *(_WORD *)(v18 + 2 * v14++) = v23;
            }
            --v8;
          }
          while (v8);
        }
        *uint64_t v12 = v14;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentFaces(void *this)
{
  uint64_t v1 = (int *)this[1];
  int v2 = *v1;
  if (*v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[21];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = (unsigned int *)(this[11] + 8 * v3);
        uint64_t v7 = this[15];
        uint64_t v8 = *v6;
        uint64_t v9 = (int)v6[1];
        uint64_t v10 = (void *)this[2];
        uint64_t v11 = (_DWORD *)(v10[33] + 8 * v5);
        _DWORD *v11 = v8;
        if (v5) {
          int v12 = *(v11 - 1) + *(v11 - 2);
        }
        else {
          int v12 = 0;
        }
        v11[1] = v12;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          uint64_t v13 = 0;
          int v14 = 0;
          uint64_t v15 = v7 + 4 * v9;
          uint64_t v16 = v10[36] + 4 * v12;
          uint64_t v17 = v10[39] + 2 * v12;
          do
          {
            int v18 = *(_DWORD *)(v15 + 4 * v13);
            if (v18 != -1)
            {
              *(_DWORD *)(v16 + 4 * v14) = v18;
              __int16 v19 = ((_BYTE)v13 + 2) & 3;
              if (v8 != 4) {
                __int16 v19 = 2;
              }
              *(_WORD *)(v17 + 2 * v14++) = v19;
            }
            ++v13;
          }
          while (v8 != v13);
        }
        _DWORD *v11 = v14;
        int v2 = *v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexFacesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 192);
        uint64_t v11 = (void *)this[2];
        int v12 = (_DWORD *)(v11[33] + 8 * v5);
        *int v12 = 2 * v8;
        if (v5) {
          int v13 = *(v12 - 1) + *(v12 - 2);
        }
        else {
          int v13 = 0;
        }
        v12[1] = v13;
        if ((int)v8 < 1)
        {
          int v14 = 0;
        }
        else
        {
          int v14 = 0;
          uint64_t v15 = (int *)(v6 + 4 * v9);
          uint64_t v16 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v17 = v11[36] + 4 * v13;
          uint64_t v18 = v11[39] + 2 * v13;
          uint64_t v19 = this[11];
          uint64_t v20 = this[15];
          do
          {
            uint64_t v22 = *v15++;
            uint64_t v21 = v22;
            LODWORD(v22) = *v16++;
            uint64_t v23 = v22;
            uint64_t v24 = v20 + 4 * *(int *)(v19 + 8 * v21 + 4);
            int v25 = *(_DWORD *)(v19 + 8 * v21);
            if (v22 + 1 == v25) {
              unsigned int v26 = 0;
            }
            else {
              unsigned int v26 = v23 + 1;
            }
            int v27 = *(_DWORD *)(v24 + 4 * v26);
            if (v27 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v27;
              if (v25 == 4) {
                __int16 v28 = v23;
              }
              else {
                __int16 v28 = 3;
              }
              *(_WORD *)(v18 + 2 * v14++) = v28;
            }
            int v29 = *(_DWORD *)(v24 + 4 * v23);
            if (v29 != -1)
            {
              *(_DWORD *)(v17 + 4 * v14) = v29;
              if (v25 == 4) {
                __int16 v30 = v26;
              }
              else {
                __int16 v30 = 1;
              }
              *(_WORD *)(v18 + 2 * v14++) = v30;
            }
            --v8;
          }
          while (v8);
        }
        *int v12 = v14;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgeRelation(OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement *this)
{
  uint64_t v2 = *((void *)this + 1);
  int v3 = ((*(void *)(v2 + 56) - *(void *)(v2 + 48)) >> 2)
     + 2 * *(_DWORD *)(v2 + 4)
     + ((*(void *)(v2 + 176) - *(void *)(v2 + 168)) >> 2)
     + ((*(void *)(v2 + 368) - *(void *)(v2 + 360)) >> 2);
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 336), 2 * *(int *)(*((void *)this + 2) + 8));
  std::vector<int>::resize((std::vector<unsigned int> *)(*((void *)this + 2) + 360), v3);
  std::vector<unsigned short>::resize(*((void *)this + 2) + 384, v3);
  if (*((_DWORD *)this + 21))
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentEdges(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentVertices(this);
  }
  else
  {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentVertices(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentFaces(this);
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentEdges(this);
  }
  uint64_t v4 = *((void *)this + 2);
  uint64_t v5 = (int *)(*(void *)(v4 + 336) + 4 * (2 * *(_DWORD *)(v4 + 8) - 2));
  std::vector<unsigned int>::size_type v6 = v5[1] + (uint64_t)*v5;
  std::vector<int>::resize((std::vector<unsigned int> *)(v4 + 360), v6);
  uint64_t v7 = *((void *)this + 2) + 384;

  std::vector<unsigned short>::resize(v7, v6);
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentVertices(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 8);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[30];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 360);
        uint64_t v7 = (unsigned int *)(*(void *)(v1 + 336) + 8 * v3);
        uint64_t v8 = *v7;
        uint64_t v9 = (int)v7[1];
        uint64_t v10 = *(void *)(v1 + 384);
        uint64_t v11 = this[2];
        uint64_t v12 = *(void *)(v11 + 336);
        int v13 = (_DWORD *)(v12 + 8 * v5);
        *int v13 = v8;
        if (v5) {
          int v14 = *(v13 - 1) + *(v13 - 2);
        }
        else {
          int v14 = 0;
        }
        v13[1] = v14;
        int v15 = *(_DWORD *)(v11 + 20);
        if (v15 <= (int)v8) {
          int v15 = v8;
        }
        *(_DWORD *)(v11 + 20) = v15;
        if ((int)v8 < 1)
        {
          int v16 = 0;
        }
        else
        {
          int v16 = 0;
          uint64_t v17 = (int *)(v6 + 4 * v9);
          uint64_t v18 = (unsigned __int16 *)(v10 + 2 * v9);
          uint64_t v19 = *(int *)(v12 + 4 * (int)((2 * v5) | 1));
          uint64_t v20 = *(void *)(v11 + 360) + 4 * v19;
          uint64_t v21 = *(void *)(v11 + 384) + 2 * v19;
          uint64_t v22 = this[24];
          do
          {
            uint64_t v24 = *v17++;
            uint64_t v23 = v24;
            LODWORD(v24) = *v18++;
            int v25 = *(_DWORD *)(v22 + 8 * v23 + 4 * v24);
            if (v25 != -1)
            {
              *(_DWORD *)(v20 + 4 * v16) = v25;
              *(_WORD *)(v21 + 2 * v16++) = 1;
            }
            --v8;
          }
          while (v8);
        }
        *int v13 = v16;
        int v2 = *(_DWORD *)(v1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentFaces(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)v1;
  if (*(int *)v1 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[21];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        int v6 = *(_DWORD *)(*(void *)(v1 + 24) + 8 * v3);
        uint64_t v7 = *(int *)(this[13] + 8 * v3 + 4);
        uint64_t v8 = this[18];
        uint64_t v9 = this[2];
        uint64_t v10 = *(void *)(v9 + 336);
        uint64_t v11 = (int *)(v10 + 8 * v5);
        int *v11 = v6;
        if (v5) {
          int v12 = *(v11 - 1) + *(v11 - 2);
        }
        else {
          int v12 = 0;
        }
        v11[1] = v12;
        int v13 = *(_DWORD *)(v9 + 20);
        if (v13 <= v6) {
          int v13 = v6;
        }
        *(_DWORD *)(v9 + 20) = v13;
        if (v6 < 1)
        {
          int v15 = 0;
        }
        else
        {
          int v14 = 0;
          int v15 = 0;
          uint64_t v16 = v8 + 4 * v7;
          uint64_t v17 = *(int *)(v10 + 4 * (int)((2 * v5) | 1));
          uint64_t v18 = *(void *)(v9 + 360) + 4 * v17;
          uint64_t v19 = *(void *)(v9 + 384) + 2 * v17;
          do
          {
            if (v14) {
              int v20 = v14;
            }
            else {
              int v20 = v6;
            }
            int v21 = *(_DWORD *)(v16 + 4 * (v20 - 1));
            if (v21 != -1)
            {
              *(_DWORD *)(v18 + 4 * v15) = v21;
              *(_WORD *)(v19 + 2 * v15++) = 0;
            }
            ++v14;
          }
          while (v6 != v14);
        }
        int *v11 = v15;
        int v2 = *(_DWORD *)v1;
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

void *OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::populateVertexEdgesFromParentEdges(void *this)
{
  uint64_t v1 = this[1];
  int v2 = *(_DWORD *)(v1 + 4);
  if (v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = this[27];
    do
    {
      uint64_t v5 = *(int *)(v4 + 4 * v3);
      if (v5 != -1)
      {
        uint64_t v6 = *(void *)(v1 + 168);
        uint64_t v7 = *(unsigned int *)(*(void *)(v1 + 144) + 8 * v3);
        uint64_t v8 = *(int *)(*(void *)(v1 + 144) + 8 * v3 + 4);
        uint64_t v9 = *(void *)(v1 + 192);
        uint64_t v10 = *(void *)(v1 + 120);
        uint64_t v11 = this[24];
        uint64_t v12 = this[2];
        int v13 = v7 + 2;
        uint64_t v14 = *(void *)(v12 + 336);
        int v15 = (int *)(v14 + 8 * v5);
        int *v15 = v7 + 2;
        if (v5) {
          int v16 = *(v15 - 1) + *(v15 - 2);
        }
        else {
          int v16 = 0;
        }
        uint64_t v17 = (int *)(v11 + 8 * v3);
        int v18 = 2 * v5;
        v15[1] = v16;
        if (*(_DWORD *)(v12 + 20) > v13) {
          int v13 = *(_DWORD *)(v12 + 20);
        }
        *(_DWORD *)(v12 + 20) = v13;
        uint64_t v19 = *(int *)(v14 + 4 * (v18 | 1));
        int v20 = (int *)(*(void *)(v12 + 360) + 4 * v19);
        int v21 = (__int16 *)(*(void *)(v12 + 384) + 2 * v19);
        if (*v17 == -1)
        {
          int v22 = 0;
        }
        else
        {
          *int v20 = *v17;
          *int v21 = 0;
          int v22 = 1;
        }
        int v23 = v17[1];
        if (v23 != -1)
        {
          v20[v22] = v23;
          v21[v22++] = 0;
        }
        if ((int)v7 >= 1)
        {
          uint64_t v24 = 0;
          uint64_t v25 = v6 + 4 * v8;
          uint64_t v26 = v9 + 2 * v8;
          uint64_t v27 = this[13];
          uint64_t v28 = this[18];
          int v29 = (_DWORD *)(v10 + 8 * v3);
          do
          {
            uint64_t v30 = *(unsigned __int16 *)(v26 + 2 * v24);
            uint64_t v31 = (2 * *(int *)(v25 + 4 * v24)) | 1;
            int v32 = *(_DWORD *)(v28 + 4 * *(int *)(v27 + 4 * v31) + 4 * v30);
            if (v32 != -1)
            {
              v20[v22] = v32;
              v21[v22++] = 1;
              if (!v24 && v22 == 3)
              {
                if (*v29 == v29[1])
                {
                  int v33 = v20[1];
                  __int16 v34 = v21[1];
                }
                else
                {
                  int v35 = *(_DWORD *)(*(void *)(v1 + 48) + 4 * *(int *)(*(void *)(v1 + 24) + 4 * v31) + 4 * v30);
                  int v33 = v20[1];
                  __int16 v34 = v21[1];
                  if (v35 == *v29)
                  {
                    int v36 = *v20;
                    *int v20 = v33;
                    __int16 v37 = *v21;
                    *int v21 = v34;
                    __int16 v34 = v37;
                    int v33 = v36;
                  }
                }
                v20[1] = v20[2];
                v20[2] = v33;
                v21[1] = v21[2];
                v21[2] = v34;
                int v22 = 3;
              }
            }
            ++v24;
          }
          while (v7 != v24);
        }
        int *v15 = v22;
        int v2 = *(_DWORD *)(v1 + 4);
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren(uint64_t this)
{
  if (*(void *)(this + 416) == *(void *)(this + 408)) {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren();
  }
  if (*(_DWORD *)(this + 28)) {
    OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren();
  }
  uint64_t v1 = *(int **)(this + 8);
  if (*v1 >= 1)
  {
    for (uint64_t i = 0; i < *v1; ++i)
    {
      uint64_t v3 = (2 * i) | 1;
      uint64_t v4 = (_DWORD *)(*(void *)(this + 120) + 4 * *(int *)(*(void *)(this + 88) + 4 * v3));
      uint64_t v5 = (_DWORD *)(*(void *)(this + 144) + 4 * *(int *)(*(void *)(this + 104) + 4 * v3));
      uint64_t v6 = *((void *)v1 + 3);
      uint64_t v7 = *(unsigned int *)(v6 + 8 * i);
      uint64_t v8 = *(void *)(this + 408);
      if (*(unsigned char *)(v8 + i))
      {
        if ((int)v7 >= 1)
        {
          do
          {
            *v4++ = 2;
            *v5++ = 2;
            --v7;
          }
          while (v7);
        }
        *(_DWORD *)(*(void *)(this + 168) + 4 * i) = 2;
        char v22 = *(unsigned char *)(v8 + i) & 0xE1;
      }
      else
      {
        if ((int)v7 < 1) {
          goto LABEL_24;
        }
        uint64_t v9 = 0;
        int v10 = 0;
        uint64_t v11 = *((void *)v1 + 6) + 4 * *(int *)(v6 + 4 * v3);
        uint64_t v12 = *(void *)(this + 456);
        do
        {
          if (*(unsigned char *)(v12 + *(int *)(v11 + 4 * v9)))
          {
            int v10 = 1;
            v4[v9] = 1;
            if (v9) {
              int v13 = v9;
            }
            else {
              int v13 = v7;
            }
            v5[v9] = 1;
            v5[v13 - 1] = 1;
          }
          ++v9;
        }
        while (v7 != v9);
        if (!v10) {
          goto LABEL_24;
        }
        *(_DWORD *)(*(void *)(this + 168) + 4 * i) = 1;
        uint64_t v14 = (int *)(*((void *)v1 + 9) + 4 * *(int *)(v6 + 4 * v3));
        uint64_t v15 = *(unsigned int *)(v6 + 8 * i);
        if (v15 == 3)
        {
          int v21 = *(unsigned char *)(*(void *)(this + 432) + v14[1]) & 0xE | (*(unsigned __int8 *)(*(void *)(this + 432) + *v14) >> 1) & 0xF | (2 * *(unsigned __int8 *)(*(void *)(this + 432) + v14[2])) & 0xC;
          char v20 = *(unsigned char *)(v8 + i);
        }
        else
        {
          if (v15 != 4)
          {
            int v23 = *(unsigned char *)(v8 + i) & 0xE1;
            *(unsigned char *)(v8 + i) &= 0xE1u;
            if ((int)v15 >= 1)
            {
              do
              {
                uint64_t v24 = *v14++;
                v23 |= *(unsigned char *)(*(void *)(this + 432) + v24) & 0x1E;
                *(unsigned char *)(v8 + i) = v23;
                --v15;
              }
              while (v15);
            }
            goto LABEL_24;
          }
          uint64_t v16 = *(void *)(this + 432);
          unsigned int v17 = *(unsigned __int8 *)(v16 + *v14);
          int v18 = *(unsigned char *)(v16 + v14[1]) & 0xE;
          int v19 = (2 * *(unsigned __int8 *)(v16 + v14[2])) & 0xC;
          LOBYTE(v16) = 4 * *(unsigned char *)(v16 + v14[3]);
          char v20 = *(unsigned char *)(v8 + i);
          int v21 = v18 | (v17 >> 1) & 0xF | v19 | v16 & 8;
        }
        char v22 = v20 & 0xE1 | (2 * (v21 & 0xF));
      }
      *(unsigned char *)(v8 + i) = v22;
LABEL_24:
      uint64_t v1 = *(int **)(this + 8);
    }
  }
  return this;
}

void OpenSubdiv::v3_1_1::Vtr::internal::QuadRefinement::markSparseFaceChildren()
{
}

{
  __assert_rtn("markSparseFaceChildren", "quadRefinement.cpp", 931, "_splitType == Sdc::SPLIT_TO_QUADS");
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::TopologyRefiner(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 8) & 0xC0 | 1;
  *(unsigned char *)(a1 + 12) &= 0xC0u;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a1 + 16) & 0xF000 | 0xF0;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level *>::reserve((void **)(a1 + 40), 0xAuLL);
  operator new();
}

{
  OpenSubdiv::v3_1_1::Far::TopologyRefiner::TopologyRefiner(a1, a2, a3);
}

void std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level *>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 3)
  {
    if (a2 >> 61) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    uint64_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    int v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      int v10 = (char *)*a1;
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

void std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 24;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v3, a2);
    uint64_t v7 = &v6[24 * v5];
    uint64_t v9 = &v6[24 * v8];
    uint64_t v11 = (char *)*a1;
    int v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      int v10 = (char *)*a1;
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

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this)
{
  std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::resize((uint64_t)this + 88, (uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 3);
  int v2 = (void *)*((void *)this + 11);
  v2[1] = 0;
  uint64_t v3 = (void *)*((void *)this + 5);
  void *v2 = *v3;
  v2[2] = 0;
  uint64_t v4 = (void *)*((void *)this + 8);
  unint64_t v5 = *((void *)this + 9) - (void)v4;
  unint64_t v6 = v5 >> 3;
  if ((v5 >> 3))
  {
    v2[2] = *v4;
    if ((int)v6 >= 2)
    {
      uint64_t v7 = (v5 >> 3) - 1;
      uint64_t v8 = v2 + 5;
      uint64_t v9 = v3 + 1;
      int v10 = v4 + 1;
      do
      {
        *(v8 - 1) = *(v10 - 1);
        uint64_t v11 = *v9++;
        *(v8 - 2) = v11;
        uint64_t v12 = *v10++;
        void *v8 = v12;
        v8 += 3;
        --v7;
      }
      while (v7);
    }
    long long v13 = &v2[3 * (int)v6];
    v13[1] = *(void *)((char *)v4 + ((uint64_t)((v5 << 29) - 0x100000000) >> 29));
    *long long v13 = *(void *)((char *)v3 + ((uint64_t)(v5 << 29) >> 29));
    v13[2] = 0;
  }
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::~TopologyRefiner(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this)
{
  uint64_t v3 = *((void *)this + 5);
  uint64_t v2 = *((void *)this + 6);
  if ((int)((unint64_t)(v2 - v3) >> 3) >= 1)
  {
    uint64_t v4 = 0;
    do
    {
      unint64_t v5 = *(OpenSubdiv::v3_1_1::Vtr::internal::Level **)(v3 + 8 * v4);
      if (v5)
      {
        OpenSubdiv::v3_1_1::Vtr::internal::Level::~Level(v5);
        MEMORY[0x210534FE0]();
        uint64_t v3 = *((void *)this + 5);
        uint64_t v2 = *((void *)this + 6);
      }
      ++v4;
    }
    while (v4 < (int)((unint64_t)(v2 - v3) >> 3));
  }
  unint64_t v6 = (void *)*((void *)this + 8);
  uint64_t v7 = *((void *)this + 9);
  if ((int)((unint64_t)(v7 - (void)v6) >> 3) >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v6[v8];
      if (v9)
      {
        (*(void (**)(void))(*(void *)v9 + 8))(v6[v8]);
        unint64_t v6 = (void *)*((void *)this + 8);
        uint64_t v7 = *((void *)this + 9);
      }
      ++v8;
    }
    while (v8 < (int)((unint64_t)(v7 - (void)v6) >> 3));
  }
  int v10 = (void *)*((void *)this + 11);
  if (v10)
  {
    *((void *)this + 12) = v10;
    operator delete(v10);
    unint64_t v6 = (void *)*((void *)this + 8);
  }
  if (v6)
  {
    *((void *)this + 9) = v6;
    operator delete(v6);
  }
  uint64_t v11 = (void *)*((void *)this + 5);
  if (v11)
  {
    *((void *)this + 6) = v11;
    operator delete(v11);
  }
}

int32x2_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::initializeInventory(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this)
{
  uint64_t v1 = (uint64_t *)*((void *)this + 5);
  uint64_t v2 = (uint64_t)(*((void *)this + 6) - (void)v1) >> 3;
  if (v2)
  {
    if (v2 != 1) {
      OpenSubdiv::v3_1_1::Far::TopologyRefiner::initializeInventory();
    }
    uint64_t v3 = *v1;
    int32x2_t result = vrev64_s32(*(int32x2_t *)(v3 + 4));
    *(int32x2_t *)((char *)this + 20) = result;
    uint64_t v5 = (*(void *)(v3 + 56) - *(void *)(v3 + 48)) >> 2;
    *((_DWORD *)this + 7) = *(_DWORD *)v3;
    *((_DWORD *)this + 8) = v5;
    *((_DWORD *)this + 9) = *(_DWORD *)(v3 + 20);
  }
  else
  {
    *(void *)((char *)this + 28) = 0;
    *(void *)((char *)this + 20) = 0;
    *((_DWORD *)this + 9) = 0;
  }
  return result;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::updateInventory(uint64_t this, const OpenSubdiv::v3_1_1::Vtr::internal::Level *a2)
{
  *(int32x2_t *)(this + 20) = vadd_s32(*(int32x2_t *)(this + 20), vrev64_s32(*(int32x2_t *)((char *)a2 + 4)));
  int v2 = *(_DWORD *)(this + 32) + ((*((void *)a2 + 7) - *((void *)a2 + 6)) >> 2);
  *(_DWORD *)(this + 28) += *(_DWORD *)a2;
  *(_DWORD *)(this + 32) = v2;
  int v3 = *((_DWORD *)a2 + 5);
  if (*(_DWORD *)(this + 36) > v3) {
    int v3 = *(_DWORD *)(this + 36);
  }
  *(_DWORD *)(this + 36) = v3;
  return this;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendLevel(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this, OpenSubdiv::v3_1_1::Vtr::internal::Level *a2)
{
  unint64_t v6 = *((void *)this + 7);
  uint64_t v4 = (char *)this + 56;
  unint64_t v5 = v6;
  uint64_t v7 = (void *)*((void *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = *((void *)this + 5);
    uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - v9;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v10];
    uint64_t v16 = &v14[8 * v13];
    *(void *)uint64_t v15 = a2;
    uint64_t v8 = v15 + 8;
    int v18 = (char *)*((void *)this + 5);
    unsigned int v17 = (char *)*((void *)this + 6);
    if (v17 != v18)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      unsigned int v17 = (char *)*((void *)this + 5);
    }
    *((void *)this + 5) = v15;
    *((void *)this + 6) = v8;
    *((void *)this + 7) = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    void *v7 = a2;
    uint64_t v8 = v7 + 1;
  }
  *((void *)this + 6) = v8;

  return OpenSubdiv::v3_1_1::Far::TopologyRefiner::updateInventory((uint64_t)this, a2);
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::appendRefinement(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this, OpenSubdiv::v3_1_1::Vtr::internal::Refinement *a2)
{
  unint64_t v6 = *((void *)this + 10);
  uint64_t v4 = (char *)this + 80;
  unint64_t v5 = v6;
  uint64_t v7 = (void *)*((void *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = *((void *)this + 8);
    uint64_t v10 = ((uint64_t)v7 - v9) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - v9;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v10];
    uint64_t v16 = &v14[8 * v13];
    *(void *)uint64_t v15 = a2;
    uint64_t v8 = v15 + 8;
    int v18 = (char *)*((void *)this + 8);
    unsigned int v17 = (char *)*((void *)this + 9);
    if (v17 != v18)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v15 - 1) = v19;
        v15 -= 8;
      }
      while (v17 != v18);
      unsigned int v17 = (char *)*((void *)this + 8);
    }
    *((void *)this + 8) = v15;
    *((void *)this + 9) = v8;
    *((void *)this + 10) = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    void *v7 = a2;
    uint64_t v8 = v7 + 1;
  }
  *((void *)this + 9) = v8;
}

void std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::__append((char **)a1, v4);
  }
  else if (!v3)
  {
    *(void *)(a1 + 8) = *(void *)a1 + 24 * a2;
  }
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefiner::GetNumFVarValuesTotal(OpenSubdiv::v3_1_1::Far::TopologyRefiner *this, int a2)
{
  uint64_t v2 = *((void *)this + 5);
  if ((int)((unint64_t)(*((void *)this + 6) - v2) >> 3) < 1) {
    return 0;
  }
  uint64_t v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    uint64_t v6 = OpenSubdiv::v3_1_1::Vtr::internal::Level::getNumFVarValues(*(OpenSubdiv::v3_1_1::Vtr::internal::Level **)(v2 + 8 * v5++), a2)+ v6;
    uint64_t v2 = *((void *)this + 5);
  }
  while (v5 < (int)((unint64_t)(*((void *)this + 6) - v2) >> 3));
  return v6;
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::RefineUniform(unsigned int *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!*(_DWORD *)(**((void **)a1 + 5) + 8))
  {
    uint64_t v10 = "Failure in TopologyRefiner::RefineUniform() -- base level is uninitialized.";
    goto LABEL_5;
  }
  if (*((void *)a1 + 9) != *((void *)a1 + 8))
  {
    uint64_t v10 = "Failure in TopologyRefiner::RefineUniform() -- previous refinements already applied.";
LABEL_5:
    OpenSubdiv::v3_1_1::Far::Error(4, (uint64_t)v10, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  *((unsigned char *)a1 + 12) = a2;
  int v11 = a2 & 0xF;
  *((unsigned char *)a1 + 8) = a1[2] & 0xC3 | (4 * (a2 & 0xF)) | 1;
  OpenSubdiv::v3_1_1::Sdc::SchemeTypeTraits::GetTopologicalSplitType((OpenSubdiv::v3_1_1::Sdc *)*a1);
  if (v11) {
    operator new();
  }

  OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1);
}

uint64_t OpenSubdiv::v3_1_1::Far::internal::FeatureMask::InitializeFeatures(uint64_t result, _WORD *a2, OpenSubdiv::v3_1_1::Sdc *a3)
{
  unint64_t v4 = (_WORD *)result;
  int v5 = 15;
  if ((*a2 & 0x100) != 0)
  {
    int32x2_t result = OpenSubdiv::v3_1_1::Sdc::SchemeTypeTraits::GetRegularFaceSize(a3);
    BOOL v6 = result == 4;
    if (result == 4) {
      int v5 = 11;
    }
    else {
      int v5 = 15;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  int v7 = v5 | *v4 & 0xFFF0;
  *unint64_t v4 = v5 | *v4 & 0xFFF0;
  if (v6 | ((unsigned __int16)(*a2 & 0x200) >> 9)) {
    int v8 = 0;
  }
  else {
    int v8 = 16;
  }
  unsigned int v9 = v8 | v7 & 0xFFFFFFEF;
  *unint64_t v4 = v9;
  unsigned int v10 = (v9 & 0xFFFFFC1F | ((unsigned __int16)*a2 >> 4) & 0x20) ^ 0x3E0;
  *unint64_t v4 = v10;
  *unint64_t v4 = v10 & 0xFBFF | *a2 & 0x400;
  return result;
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::RefineAdaptive(unsigned int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v18 = a2;
  if (!*(_DWORD *)(**((void **)a1 + 5) + 8))
  {
    unsigned int v10 = "Failure in TopologyRefiner::RefineAdaptive() -- base level is uninitialized.";
    goto LABEL_15;
  }
  if (*((void *)a1 + 9) != *((void *)a1 + 8))
  {
    unsigned int v10 = "Failure in TopologyRefiner::RefineAdaptive() -- previous refinements already applied.";
LABEL_15:
    OpenSubdiv::v3_1_1::Far::Error(4, (uint64_t)v10, a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  if (*a1 != 1)
  {
    unsigned int v10 = "Failure in TopologyRefiner::RefineAdaptive() -- currently only supported for Catmark scheme.";
    goto LABEL_15;
  }
  *((unsigned char *)a1 + 8) &= ~1u;
  *((_WORD *)a1 + 8) = a2;
  int v11 = a2 & 0xF;
  OpenSubdiv::v3_1_1::Far::internal::FeatureMask::InitializeFeatures((uint64_t)&v17, &v18, (OpenSubdiv::v3_1_1::Sdc *)1);
  if ((v17 & 0x400) != 0)
  {
    uint64_t v12 = *(uint64_t **)(**((void **)a1 + 5) + 456);
    unint64_t v13 = *(void *)(**((void **)a1 + 5) + 464) - (void)v12;
    if ((int)(v13 >> 3) < 1) {
      goto LABEL_11;
    }
    char v14 = 0;
    uint64_t v15 = (v13 >> 3);
    do
    {
      uint64_t v16 = *v12++;
      v14 |= *(unsigned char *)(v16 + 12) == 0;
      --v15;
    }
    while (v15);
    if ((v14 & 1) == 0) {
LABEL_11:
    }
      LOWORD(v17) = v17 & 0xFBFF;
  }
  OpenSubdiv::v3_1_1::Sdc::SchemeTypeTraits::GetTopologicalSplitType((OpenSubdiv::v3_1_1::Sdc *)*a1);
  if (v11) {
    operator new();
  }
  *((unsigned char *)a1 + 8) = ((a1[18] - a1[16]) >> 1) & 0x3C | a1[2] & 0xC3;
  OpenSubdiv::v3_1_1::Far::TopologyRefiner::assembleFarLevels((OpenSubdiv::v3_1_1::Far::TopologyRefiner *)a1);
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents(int a1, OpenSubdiv::v3_1_1::Vtr::internal::Refinement **this, _DWORD *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (*a3)
  {
    unint64_t v4 = (int *)*((void *)*this + 1);
    uint64_t v5 = (*a3 & 0x400) != 0 ? (*((void *)v4 + 58) - *((void *)v4 + 57)) >> 3 : 0;
    if (*v4 >= 1)
    {
      uint64_t v6 = 0;
      int v7 = v4[3];
      int v42 = v7;
      int v43 = *((_DWORD *)*this + 8);
      do
      {
        if (*(unsigned char *)(*((void *)v4 + 12) + v6)) {
          goto LABEL_72;
        }
        uint64_t v8 = *((void *)v4 + 3);
        uint64_t v9 = 2 * v6;
        if (!v7)
        {
          uint64_t v10 = *(unsigned int *)(v8 + 8 * v6);
          if (v10 != v43)
          {
            if ((int)v10 >= 1)
            {
              uint64_t v31 = 0;
              uint64_t v32 = *((void *)v4 + 6) + 4 * *(int *)(v8 + ((8 * v6) | 4));
              do
              {
                uint64_t v33 = *(int *)(v32 + 4 * v31);
                uint64_t v34 = *((void *)v4 + 33);
                uint64_t v35 = *(unsigned int *)(v34 + 8 * v33);
                if ((int)v35 >= 1)
                {
                  int v36 = (int *)(*((void *)v4 + 36) + 4 * *(int *)(v34 + 8 * v33 + 4));
                  do
                  {
                    int v37 = *v36++;
                    OpenSubdiv::v3_1_1::Vtr::internal::SparseSelector::selectFace(this, v37);
                    --v35;
                  }
                  while (v35);
                }
                ++v31;
              }
              while (v31 != v10);
            }
            goto LABEL_72;
          }
        }
        uint64_t v11 = *(unsigned int *)(v8 + 8 * v6);
        OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceVTags(v4, v6, &v46, 0xFFFFFFFF);
        unsigned int v12 = OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag::BitwiseOr(&v46, v11);
        if ((v12 & 0x800) != 0) {
          goto LABEL_16;
        }
        if ((v12 & 1) != 0 && (*(_WORD *)a3 & 0x200) != 0) {
          goto LABEL_71;
        }
        if (v12 & 2) != 0 && (*(_WORD *)a3)
        {
          if ((v12 & 0x780) == 0x80) {
            goto LABEL_71;
          }
          if (v4[3] <= 1 && (int)v11 >= 1)
          {
            int v39 = &v46;
            do
            {
              __int16 v40 = *v39++;
              if ((v40 & 0x782) == 0x82) {
                goto LABEL_71;
              }
              --v11;
            }
            while (v11);
          }
        }
        if ((v12 & 0x780) == 0x80)
        {
LABEL_16:
          LOWORD(v13) = *(_WORD *)a3;
          goto LABEL_17;
        }
        if ((v12 & 0x80) == 0) {
          goto LABEL_71;
        }
        if ((v12 & 0x60) != 0)
        {
          if ((~*(unsigned __int16 *)a3 & 0xC) == 0) {
            goto LABEL_71;
          }
          int isSingleCreasePatch = OpenSubdiv::v3_1_1::Vtr::internal::Level::isSingleCreasePatch((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v6, 0, 0);
          LOWORD(v13) = *(_WORD *)a3;
          if (isSingleCreasePatch)
          {
            if ((v13 & 4) != 0) {
              goto LABEL_71;
            }
          }
          else if ((v13 & 8) != 0)
          {
            goto LABEL_71;
          }
        }
        else
        {
          if ((v12 & 0x1010) == 0) {
            goto LABEL_16;
          }
          if ((v12 & 0x4000) != 0)
          {
            if (((v12 >> 7) & 0xF) >= 8)
            {
              LOWORD(v13) = *(_WORD *)a3;
              if ((*(_WORD *)a3 & 0x100) != 0) {
                goto LABEL_71;
              }
            }
            else if (((v12 >> 7) & 4) != 0)
            {
              int v13 = *(unsigned __int16 *)a3;
              if ((v12 & 4) != 0) {
                int v41 = 2;
              }
              else {
                int v41 = 128;
              }
              if ((v13 & v41) != 0) {
                goto LABEL_71;
              }
            }
            else
            {
              if (((v12 >> 7) & 2) == 0) {
                goto LABEL_16;
              }
              LOWORD(v13) = *(_WORD *)a3;
              if ((*(_WORD *)a3 & 0x40) != 0) {
                goto LABEL_71;
              }
            }
          }
          else
          {
            if ((v12 & 4) != 0)
            {
              if ((v12 & 0x400) == 0) {
                goto LABEL_16;
              }
              LOWORD(v13) = *(_WORD *)a3;
              if ((v12 & 8) != 0) {
                goto LABEL_17;
              }
            }
            else
            {
              LOWORD(v13) = *(_WORD *)a3;
              if ((v12 & 0x400) == 0)
              {
                if ((v13 & 0x10) != 0) {
                  goto LABEL_71;
                }
                goto LABEL_17;
              }
            }
            if ((v13 & 0x20) != 0) {
              goto LABEL_71;
            }
          }
        }
LABEL_17:
        if ((v13 & 0x400) != 0 && (int)v5 >= 1)
        {
          int v14 = 0;
          LOBYTE(v15) = 0;
          uint64_t v44 = v9 | 1;
          while (1)
          {
            if (OpenSubdiv::v3_1_1::Vtr::internal::Level::doesFaceFVarTopologyMatch((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v6, v14))
            {
              goto LABEL_53;
            }
            uint64_t v16 = *((void *)v4 + 3);
            uint64_t v17 = *(int *)(v16 + 4 * v44);
            uint64_t v18 = *((void *)v4 + 6);
            uint64_t v19 = *(unsigned int *)(v16 + 4 * v9);
            if (OpenSubdiv::v3_1_1::Vtr::internal::Level::doesFaceFVarTopologyMatch((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v6, v14))
            {
              OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents();
            }
            uint64_t v20 = v5;
            uint64_t v21 = v9;
            if ((int)v19 >= 1)
            {
              char v22 = (int *)(v18 + 4 * v17);
              int v23 = &v46;
              uint64_t v24 = v19;
              do
              {
                int v25 = *v22++;
                *v23++ = OpenSubdiv::v3_1_1::Vtr::internal::Level::getVertexCompositeFVarVTag((OpenSubdiv::v3_1_1::Vtr::internal::Level *)v4, v25, v14);
                --v24;
              }
              while (v24);
            }
            unsigned int v26 = OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag::BitwiseOr(&v46, v19);
            if ((v26 & 1) != 0 && (*(_WORD *)a3 & 0x200) != 0)
            {
              LOBYTE(v15) = 1;
              uint64_t v9 = v21;
LABEL_38:
              uint64_t v5 = v20;
              goto LABEL_53;
            }
            if ((v26 & 2) != 0)
            {
              LOBYTE(v15) = 1;
              uint64_t v9 = v21;
              if ((v26 & 0x80) == 0) {
                goto LABEL_38;
              }
              uint64_t v5 = v20;
              if (*(_WORD *)a3) {
                goto LABEL_53;
              }
            }
            else
            {
              uint64_t v9 = v21;
              uint64_t v5 = v20;
              if ((v26 & 0x80) == 0)
              {
                LOBYTE(v15) = 1;
                goto LABEL_53;
              }
            }
            if ((v26 & 0x4000) == 0) {
              break;
            }
            if (((v26 >> 7) & 0xF) < 8)
            {
              if (((v26 >> 7) & 4) != 0)
              {
                if ((v26 & 4) != 0) {
                  __int16 v30 = 2;
                }
                else {
                  __int16 v30 = 128;
                }
                LOBYTE(v15) = (unsigned __int16)(*(_WORD *)a3 & v30) != 0;
                goto LABEL_53;
              }
              if (((v26 >> 7) & 2) != 0)
              {
                int v15 = (*(unsigned __int16 *)a3 >> 6) & 1;
                goto LABEL_53;
              }
              goto LABEL_44;
            }
            int v15 = HIBYTE(*(unsigned __int16 *)a3) & 1;
LABEL_53:
            if ((v15 & 1) == 0 && ++v14 < (int)v5) {
              continue;
            }
            int v7 = v42;
            if ((v15 & 1) == 0) {
              goto LABEL_72;
            }
LABEL_71:
            OpenSubdiv::v3_1_1::Vtr::internal::SparseSelector::selectFace(this, v6);
            goto LABEL_72;
          }
          if ((v26 & 4) == 0)
          {
            unsigned int v27 = *(unsigned __int16 *)a3;
            int v28 = (v27 >> 4) & 1;
            int v29 = (v27 >> 5) & 1;
            if ((v26 & 0x400) != 0) {
              LOBYTE(v15) = v29;
            }
            else {
              LOBYTE(v15) = v28;
            }
            goto LABEL_53;
          }
          if ((v26 & 0x400) != 0)
          {
            LOBYTE(v15) = (v26 & 8) == 0 && (*(_WORD *)a3 & 0x20) != 0;
            goto LABEL_53;
          }
LABEL_44:
          LOBYTE(v15) = 0;
          goto LABEL_53;
        }
LABEL_72:
        ++v6;
      }
      while (v6 < *v4);
    }
  }
}

void std::vector<OpenSubdiv::v3_1_1::Far::TopologyLevel>::__append(char **a1, unint64_t a2)
{
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v5 - v6) >> 3) >= a2)
  {
    a1[1] = &v6[24 * (24 * a2 / 0x18)];
  }
  else
  {
    int v7 = *a1;
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v6 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - v7) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      unsigned int v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v4, v11);
      int v7 = *a1;
      uint64_t v6 = a1[1];
    }
    else
    {
      unsigned int v12 = 0;
    }
    int v13 = &v12[24 * v8];
    int v14 = &v12[24 * v11];
    int v15 = &v13[24 * (24 * a2 / 0x18)];
    if (v6 != v7)
    {
      do
      {
        long long v16 = *(_OWORD *)(v6 - 24);
        *((void *)v13 - 1) = *((void *)v6 - 1);
        *(_OWORD *)(v13 - 24) = v16;
        v13 -= 24;
        v6 -= 24;
      }
      while (v6 != v7);
      int v7 = *a1;
    }
    *a1 = v13;
    a1[1] = v15;
    a1[2] = v14;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::initializeInventory()
{
  __assert_rtn("initializeInventory", "topologyRefiner.cpp", 103, "_levels.size() == 1");
}

void OpenSubdiv::v3_1_1::Far::TopologyRefiner::selectFeatureAdaptiveComponents()
{
}

double OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory::EndCapLegacyGregoryPatchFactory(OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory *this, const OpenSubdiv::v3_1_1::Far::TopologyRefiner *a2)
{
  *(void *)this = a2;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  return result;
}

char *OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory::GetPatchPoints(void *a1, OpenSubdiv::v3_1_1::Vtr::internal::Level *this, int a3, int a4, int a5, int a6)
{
  if (a6 < 0)
  {
    uint64_t v12 = *((void *)this + 3);
    uint64_t FaceFVarValues = (int *)(*((void *)this + 6) + 4 * *(int *)(v12 + 8 * a3 + 4));
    unint64_t v11 = (int *)*(unsigned int *)(v12 + 8 * a3);
  }
  else
  {
    uint64_t FaceFVarValues = (int *)OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceFVarValues(this, a3, a6);
  }
  int v66 = a3;
  v67[0] = FaceFVarValues;
  v67[1] = v11;
  uint64_t v13 = 0;
  if ((OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceCompositeVTag((uint64_t)this, v67) & 4) != 0)
  {
    int v15 = (char **)(a1 + 5);
    uint64_t v31 = (char *)a1[5];
    uint64_t v32 = (void **)(a1 + 4);
    uint64_t v33 = a1 + 6;
    do
    {
      int v34 = v67[0][v13] + a5;
      if ((unint64_t)v31 >= *v33)
      {
        int v36 = (char *)*v32;
        uint64_t v37 = (v31 - (unsigned char *)*v32) >> 2;
        unint64_t v38 = v37 + 1;
        if ((unint64_t)(v37 + 1) >> 62) {
          goto LABEL_76;
        }
        uint64_t v39 = *v33 - (void)v36;
        if (v39 >> 1 > v38) {
          unint64_t v38 = v39 >> 1;
        }
        if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v40 = v38;
        }
        if (v40)
        {
          int v41 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 6), v40);
          uint64_t v31 = *v15;
          int v36 = (char *)*v32;
        }
        else
        {
          int v41 = 0;
        }
        int v42 = &v41[4 * v37];
        *(_DWORD *)int v42 = v34;
        uint64_t v35 = v42 + 4;
        while (v31 != v36)
        {
          int v43 = *((_DWORD *)v31 - 1);
          v31 -= 4;
          *((_DWORD *)v42 - 1) = v43;
          v42 -= 4;
        }
        *uint64_t v32 = v42;
        char *v15 = v35;
        *uint64_t v33 = &v41[4 * v40];
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v31 = v34;
        uint64_t v35 = v31 + 4;
      }
      char *v15 = v35;
      ++v13;
      uint64_t v31 = v35;
    }
    while (v13 != 4);
    unint64_t v44 = a1[12];
    uint64_t v45 = (char *)a1[11];
    if ((unint64_t)v45 >= v44)
    {
      uint64_t v53 = (char *)a1[10];
      uint64_t v54 = (v45 - v53) >> 2;
      unint64_t v55 = v54 + 1;
      if ((unint64_t)(v54 + 1) >> 62) {
        goto LABEL_76;
      }
      uint64_t v56 = v44 - (void)v53;
      if (v56 >> 1 > v55) {
        unint64_t v55 = v56 >> 1;
      }
      if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v57 = v55;
      }
      if (v57)
      {
        unsigned int v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 12), v57);
        uint64_t v53 = (char *)a1[10];
        uint64_t v45 = (char *)a1[11];
      }
      else
      {
        unsigned int v58 = 0;
      }
      uint64_t v62 = (int *)&v58[4 * v54];
      uint64_t v63 = &v58[4 * v57];
      *uint64_t v62 = v66;
      unsigned __int16 v46 = v62 + 1;
      while (v45 != v53)
      {
        int v64 = *((_DWORD *)v45 - 1);
        v45 -= 4;
        *--uint64_t v62 = v64;
      }
      a1[10] = v62;
      a1[11] = v46;
      a1[12] = v63;
      if (v53) {
        operator delete(v53);
      }
    }
    else
    {
      *(_DWORD *)uint64_t v45 = v66;
      unsigned __int16 v46 = v45 + 4;
    }
    a1[11] = v46;
    return *v15 - 16;
  }
  int v15 = (char **)(a1 + 2);
  int v14 = (char *)a1[2];
  long long v16 = (void **)(a1 + 1);
  uint64_t v17 = a1 + 3;
  do
  {
    int v18 = v67[0][v13] + a5;
    if ((unint64_t)v14 >= *v17)
    {
      uint64_t v20 = (char *)*v16;
      uint64_t v21 = (v14 - (unsigned char *)*v16) >> 2;
      unint64_t v22 = v21 + 1;
      if ((unint64_t)(v21 + 1) >> 62) {
        goto LABEL_76;
      }
      uint64_t v23 = *v17 - (void)v20;
      if (v23 >> 1 > v22) {
        unint64_t v22 = v23 >> 1;
      }
      if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v24 = v22;
      }
      if (v24)
      {
        int v25 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 3), v24);
        int v14 = *v15;
        uint64_t v20 = (char *)*v16;
      }
      else
      {
        int v25 = 0;
      }
      unsigned int v26 = &v25[4 * v21];
      *(_DWORD *)unsigned int v26 = v18;
      uint64_t v19 = v26 + 4;
      while (v14 != v20)
      {
        int v27 = *((_DWORD *)v14 - 1);
        v14 -= 4;
        *((_DWORD *)v26 - 1) = v27;
        v26 -= 4;
      }
      *long long v16 = v26;
      char *v15 = v19;
      *uint64_t v17 = &v25[4 * v24];
      if (v20) {
        operator delete(v20);
      }
    }
    else
    {
      *(_DWORD *)int v14 = v18;
      uint64_t v19 = v14 + 4;
    }
    char *v15 = v19;
    ++v13;
    int v14 = v19;
  }
  while (v13 != 4);
  unint64_t v28 = a1[9];
  int v29 = (char *)a1[8];
  if ((unint64_t)v29 >= v28)
  {
    uint64_t v47 = (char *)a1[7];
    uint64_t v48 = (v29 - v47) >> 2;
    unint64_t v49 = v48 + 1;
    if (!((unint64_t)(v48 + 1) >> 62))
    {
      uint64_t v50 = v28 - (void)v47;
      if (v50 >> 1 > v49) {
        unint64_t v49 = v50 >> 1;
      }
      if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v51 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v51 = v49;
      }
      if (v51)
      {
        int v52 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)(a1 + 9), v51);
        uint64_t v47 = (char *)a1[7];
        int v29 = (char *)a1[8];
      }
      else
      {
        int v52 = 0;
      }
      unint64_t v59 = (int *)&v52[4 * v48];
      uint64_t v60 = &v52[4 * v51];
      *unint64_t v59 = v66;
      __int16 v30 = v59 + 1;
      while (v29 != v47)
      {
        int v61 = *((_DWORD *)v29 - 1);
        v29 -= 4;
        *--unint64_t v59 = v61;
      }
      a1[7] = v59;
      a1[8] = v30;
      a1[9] = v60;
      if (v47) {
        operator delete(v47);
      }
      goto LABEL_67;
    }
LABEL_76:
    abort();
  }
  *(_DWORD *)int v29 = v66;
  __int16 v30 = v29 + 4;
LABEL_67:
  a1[8] = v30;
  return *v15 - 16;
}

void OpenSubdiv::v3_1_1::Far::EndCapLegacyGregoryPatchFactory::Finalize(void *a1, int a2, std::vector<unsigned int> *this, std::vector<unsigned int> *a4, unsigned int *a5)
{
  unint64_t v8 = a1;
  uint64_t v10 = a1[7];
  uint64_t v9 = a1[8];
  uint64_t v11 = v9 - v10;
  uint64_t v37 = a1[10];
  uint64_t v39 = a1[11];
  unint64_t v12 = (v39 - v37) >> 2;
  unint64_t v13 = v12 + ((v9 - v10) >> 2);
  int v14 = *(OpenSubdiv::v3_1_1::Far **)(*(void *)(*a1 + 40)
                                    + 8 * (((unint64_t)*(unsigned __int8 *)(*a1 + 8) >> 2) & 0xF));
  std::vector<int>::resize(this, 4 * v13);
  if (v13)
  {
    std::vector<unsigned int>::pointer begin = this->__begin_;
    if (v9 != v10)
    {
      uint64_t v16 = 0;
      if ((unint64_t)(v11 >> 2) <= 1) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v11 >> 2;
      }
      do
      {
        OpenSubdiv::v3_1_1::Far::getQuadOffsets(v14, (const OpenSubdiv::v3_1_1::Vtr::internal::Level *)*(unsigned int *)(v8[7] + 4 * v16), (uint64_t)begin, a5);
        begin += 4;
        ++v16;
      }
      while (v17 != v16);
    }
    if (v39 != v37)
    {
      uint64_t v18 = 0;
      if (v12 <= 1) {
        unint64_t v12 = 1;
      }
      do
      {
        OpenSubdiv::v3_1_1::Far::getQuadOffsets(v14, (const OpenSubdiv::v3_1_1::Vtr::internal::Level *)*(unsigned int *)(v8[10] + 4 * v18), (uint64_t)begin, a5);
        begin += 4;
        ++v18;
      }
      while (v12 != v18);
    }
  }
  uint64_t v19 = (2 * a2) | 1;
  std::vector<int>::resize(a4, *(int *)(*v8 + 20) * v19);
  uint64_t v20 = 0;
  int v21 = 0;
  unint64_t v22 = ((unint64_t)*(unsigned __int8 *)(*v8 + 8) >> 2) & 0xF;
  uint64_t v23 = (int)v19;
  uint64_t v24 = (v22 + 1);
  unint64_t v25 = (8 * ((unint64_t)(2 * a2) >> 1)) | 4;
  unint64_t v40 = v22;
  int v41 = v8;
  uint64_t v38 = v24;
  do
  {
    unsigned int v26 = *(OpenSubdiv::v3_1_1::Vtr::internal::Level **)(*(void *)(*v8 + 40) + 8 * v20);
    int v27 = *((_DWORD *)v26 + 2);
    if (v20 == v22 && v27 >= 1)
    {
      uint64_t v43 = v20;
      int v28 = 0;
      uint64_t v29 = v21 * (int)v23;
      uint64_t v30 = 4 * v29 + 4;
      do
      {
        std::vector<unsigned int>::pointer v31 = a4->__begin_;
        uint64_t v32 = (int *)&a4->__begin_[v29];
        *uint64_t v32 = 0;
        int v33 = OpenSubdiv::v3_1_1::Vtr::internal::Level::gatherQuadRegularRingAroundVertex(v26, v28, v32 + 1, 0xFFFFFFFF);
        if (v33 >= 1)
        {
          uint64_t v34 = v33;
          std::vector<unsigned int>::pointer v35 = (std::vector<unsigned int>::pointer)((char *)v31 + v30);
          do
          {
            *v35++ += v21;
            --v34;
          }
          while (v34);
        }
        if (v33)
        {
          v32[v33 + 1] = v32[v33];
          int v33 = ~v33;
        }
        if (v33 >= 0) {
          int v36 = v33;
        }
        else {
          int v36 = v33 + 1;
        }
        *uint64_t v32 = v36 >> 1;
        v29 += v23;
        ++v28;
        int v27 = *((_DWORD *)v26 + 2);
        v30 += v25;
      }
      while (v28 < v27);
      unint64_t v8 = v41;
      uint64_t v20 = v43;
      uint64_t v24 = v38;
      unint64_t v22 = v40;
    }
    v21 += v27;
    ++v20;
  }
  while (v20 != v24);
}

uint64_t OpenSubdiv::v3_1_1::Far::getQuadOffsets(OpenSubdiv::v3_1_1::Far *this, const OpenSubdiv::v3_1_1::Vtr::internal::Level *a2, uint64_t a3, unsigned int *a4)
{
  int v5 = (int)a2;
  if ((a4 & 0x80000000) != 0) {
    uint64_t result = *((void *)this + 6) + 4 * *(int *)(*((void *)this + 3) + 4 * ((2 * (int)a2) | 1));
  }
  else {
    uint64_t result = OpenSubdiv::v3_1_1::Vtr::internal::Level::getFaceFVarValues(this, (int)a2, (int)a4);
  }
  uint64_t v8 = 0;
  uint64_t v9 = *((void *)this + 36);
  uint64_t v10 = *((void *)this + 33);
  uint64_t v11 = *((void *)this + 42);
  do
  {
    uint64_t v12 = *(int *)(result + 4 * v8);
    int v13 = 2 * v12;
    uint64_t v14 = *(unsigned int *)(v10 + 8 * v12);
    if ((int)v14 < 1) {
LABEL_12:
    }
      OpenSubdiv::v3_1_1::Far::getQuadOffsets();
    uint64_t v15 = 0;
    uint64_t v16 = v9 + 4 * *(int *)(v10 + 8 * v12 + 4);
    int v17 = *(_DWORD *)(v11 + 4 * v13);
    while (*(_DWORD *)(v16 + 4 * v15) != v5)
    {
      if (v14 == ++v15) {
        goto LABEL_12;
      }
    }
    *(_DWORD *)(a3 + 4 * v8++) = v15 | ((((int)v15 + 1) % v17) << 8);
  }
  while (v8 != 4);
  return result;
}

void OpenSubdiv::v3_1_1::Far::getQuadOffsets()
{
  __assert_rtn("getQuadOffsets", "endCapLegacyGregoryPatchFactory.cpp", 92, "thisFaceInVFaces != -1");
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::resizeComponentTopology(uint64_t a1, int *a2)
{
  unint64_t v4 = *a2;
  uint64_t v5 = **(void **)(a1 + 40);
  *(_DWORD *)(v5 + 8) = v4;
  std::vector<int>::resize((std::vector<unsigned int> *)(v5 + 264), 2 * v4);
  std::vector<int>::resize((std::vector<unsigned int> *)(v5 + 336), 2 * v4);
  std::vector<float>::resize(v5 + 408, v4);
  std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::VTag>::resize(v5 + 432, v4);
  bzero(*(void **)(v5 + 432), 2 * *(int *)(v5 + 8));
  unint64_t v6 = a2[1];
  int v7 = **(std::vector<unsigned int> ***)(a1 + 40);
  LODWORD(v7->__begin_) = v6;
  std::vector<int>::resize(v7 + 1, 2 * v6);
  std::vector<unsigned int>::pointer begin = (char *)v7[4].__begin_;
  unint64_t v9 = (char *)v7[4].__end_ - begin;
  if (v6 <= v9)
  {
    if (v6 < v9) {
      v7[4].__end_ = (std::vector<unsigned int>::pointer)&begin[v6];
    }
  }
  else
  {
    std::vector<OpenSubdiv::v3_1_1::Vtr::internal::Level::FTag>::__append((void **)&v7[4].__begin_, v6 - v9);
    std::vector<unsigned int>::pointer begin = (char *)v7[4].__begin_;
  }
  bzero(begin, SLODWORD(v7->__begin_));
  if (a2[1] >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = *((void *)a2 + 1);
    uint64_t v12 = **(void **)(a1 + 40);
    int v13 = *(_DWORD **)(v12 + 24);
    do
    {
      int v14 = *(_DWORD *)(v11 + 4 * v10);
      *int v13 = v14;
      if (v10) {
        int v15 = *(v13 - 1) + *(v13 - 2);
      }
      else {
        int v15 = 0;
      }
      v13[1] = v15;
      if (*(_DWORD *)(v12 + 20) > v14) {
        int v14 = *(_DWORD *)(v12 + 20);
      }
      *(_DWORD *)(v12 + 20) = v14;
      ++v10;
      v13 += 2;
    }
    while (v10 < a2[1]);
  }
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::assignComponentTopology(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a2 + 4) >= 1)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    uint64_t v4 = **(void **)(a1 + 40);
    uint64_t v5 = *(void *)(v4 + 24);
    uint64_t v6 = *(void *)(v4 + 48);
    int v7 = *(unsigned __int8 *)(a2 + 88);
    uint64_t v8 = *(void *)(a2 + 16);
    do
    {
      unint64_t v9 = (unsigned int *)(v5 + 8 * v2);
      uint64_t v10 = *v9;
      uint64_t v11 = (_DWORD *)(v6 + 4 * (int)v9[1]);
      if (v7)
      {
        _DWORD *v11 = *(_DWORD *)(v8 + 4 * v3++);
        if ((int)v10 >= 2)
        {
          unint64_t v12 = v10 + 1;
          int v13 = (int *)(v8 + 4 * v3);
          do
          {
            int v14 = *v13++;
            v11[(v12-- - 2)] = v14;
            ++v3;
          }
          while (v12 > 2);
        }
      }
      else if ((int)v10 >= 1)
      {
        int v15 = (int *)(v8 + 4 * v3);
        v3 += v10;
        do
        {
          int v16 = *v15++;
          *v11++ = v16;
          --v10;
        }
        while (v10);
      }
      ++v2;
    }
    while (v2 < *(int *)(a2 + 4));
  }
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::assignComponentTags(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*(int *)(a2 + 24) >= 1)
  {
    uint64_t v4 = *(void *)(a2 + 32);
    if (v4)
    {
      if (*(void *)(a2 + 40))
      {
        uint64_t v5 = 0;
        uint64_t v6 = (int *)(v4 + 4);
        do
        {
          int Edge = OpenSubdiv::v3_1_1::Vtr::internal::Level::findEdge(**(OpenSubdiv::v3_1_1::Vtr::internal::Level ***)(a1 + 40), *(v6 - 1), *v6);
          if (Edge == -1)
          {
            snprintf(__str, 0x400uLL, "Edge %d specified to be sharp does not exist (%d, %d)", v5, *(v6 - 1), *v6);
            OpenSubdiv::v3_1_1::Far::Warning((OpenSubdiv::v3_1_1::Far *)"%s", v8, __str);
          }
          else
          {
            *(_DWORD *)(*(void *)(**(void **)(a1 + 40) + 216) + 4 * Edge) = *(_DWORD *)(*(void *)(a2 + 40)
                                                                                              + 4 * v5);
          }
          ++v5;
          v6 += 2;
        }
        while (v5 < *(int *)(a2 + 24));
      }
    }
  }
  if (*(int *)(a2 + 48) >= 1 && *(void *)(a2 + 56) && *(void *)(a2 + 64))
  {
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = *(unsigned int *)(*(void *)(a2 + 56) + 4 * v9);
      if ((v10 & 0x80000000) != 0 || (uint64_t v11 = **(void **)(a1 + 40), (int)v10 >= *(_DWORD *)(v11 + 8)))
      {
        snprintf(__str, 0x400uLL, "Vertex %d specified to be sharp does not exist", *(_DWORD *)(*(void *)(a2 + 56) + 4 * v9));
        OpenSubdiv::v3_1_1::Far::Warning((OpenSubdiv::v3_1_1::Far *)"%s", v12, __str);
      }
      else
      {
        *(_DWORD *)(*(void *)(v11 + 408) + 4 * v10) = *(_DWORD *)(*(void *)(a2 + 64) + 4 * v9);
      }
      ++v9;
    }
    while (v9 < *(int *)(a2 + 48));
  }
  if (*(int *)(a2 + 72) >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v14 = *(int *)(*(void *)(a2 + 80) + 4 * v13);
      uint64_t v15 = *(void *)(**(void **)(a1 + 40) + 96);
      *(unsigned char *)(v15 + v14) |= 1u;
      *(unsigned char *)(a1 + 8) |= 2u;
      ++v13;
    }
    while (v13 < *(int *)(a2 + 72));
  }
  return 1;
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::reportInvalidTopology(uint64_t a1, const char *a2)
{
  return OpenSubdiv::v3_1_1::Far::Warning((OpenSubdiv::v3_1_1::Far *)"%s", a2, a2);
}

uint64_t OpenSubdiv::v3_1_1::Far::TopologyRefinerFactory<OpenSubdiv::v3_1_1::Far::TopologyDescriptor>::assignFaceVaryingTopology(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a2 + 92) >= 1) {
    OpenSubdiv::v3_1_1::Vtr::internal::Level::createFVarChannel();
  }
  return 1;
}

void OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::~CPUMTLVertexBuffer(id *this)
{
}

BOOL OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::allocate(OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *this, MTLContext *a2)
{
  int v3 = (void *)[a2->var0 newBufferWithLength:4 * *((_DWORD *)this + 1) * *(_DWORD *)this options:0];
  uint64_t v4 = v3;
  *((void *)this + 1) = v3;
  if (v3)
  {
    *((unsigned char *)this + 16) = 1;
    [v3 setLabel:@"OSD VertexBuffer"];
  }
  return v4 != 0;
}

void OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::Create(OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *this, int a2, int a3, MTLContext *a4)
{
}

void sub_20B57C04C(_Unwind_Exception *a1)
{
  MEMORY[0x210534FE0](v1, 0x1080C40E0210B95);
  _Unwind_Resume(a1);
}

void *OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer::UpdateData(OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer *this, const float *a2, uint64_t a3, uint64_t a4, MTLContext *a5)
{
  int v5 = a4;
  *((unsigned char *)this + 16) = 1;
  uint64_t v8 = (void *)(objc_msgSend(*((id *)this + 1), "contents", a3, a4, a5) + 4 * *(_DWORD *)this * (int)a3);
  size_t v9 = 4 * *(_DWORD *)this * v5;

  return memcpy(v8, a2, v9);
}

uint64_t AnimCodec::AnimDecoder::getInfo(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  return AnimCodec::AnimDecoder::getInfo(a1, a2, &v5, &v4, a3);
}

uint64_t AnimCodec::AnimDecoder::getInfo(uint64_t a1, unint64_t a2, uint64_t *a3, _DWORD *a4, uint64_t a5)
{
  if (a2 < 0x18) {
    return 3;
  }
  for (uint64_t i = 0; i != 4; ++i)
  {
    *a3 = i + 1;
    *((unsigned char *)&v24 + i) = *(unsigned char *)(a1 + i);
  }
  if (v24 != 179426549) {
    return 3;
  }
  for (uint64_t j = 0; j != 4; ++j)
  {
    *a3 = j + 5;
    *((unsigned char *)&v24 + j) = *(unsigned char *)(a1 + 4 + j);
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *a4 = v24;
  *a3 = 9;
  *(unsigned char *)(a5 + 8) = *(unsigned char *)(a1 + 8);
  uint64_t v9 = (*a3)++;
  *(unsigned char *)(a5 + 9) = *(unsigned char *)(a1 + v9);
  uint64_t v10 = *a3;
  uint64_t v11 = a1 + *a3;
  uint64_t v12 = *a3 + 1;
  char v13 = 1;
  do
  {
    *a3 = v12 + v7;
    char v14 = v13;
    *((unsigned char *)&v24 + v8) = *(unsigned char *)(v11 + v7++);
    uint64_t v8 = 1;
    char v13 = 0;
  }
  while ((v14 & 1) != 0);
  uint64_t v15 = 0;
  *(_WORD *)(a5 + 10) = v24;
  uint64_t v16 = -v7;
  do
  {
    *a3 = v10 + v7 + 1 + v15;
    *((unsigned char *)&v24 + v15) = *(unsigned char *)(a1 + v10 + v15 + v7);
    ++v15;
    --v16;
  }
  while (v15 != 4);
  uint64_t v17 = 0;
  *(_DWORD *)a5 = v24;
  uint64_t v18 = -v16;
  do
  {
    *a3 = v10 + v18 + 1;
    char v19 = *(unsigned char *)(a1 + v10 + v18++);
    *((unsigned char *)&v24 + v17++) = v19;
  }
  while (v17 != 4);
  *(_DWORD *)(a5 + 4) = v24;
  uint64_t v20 = v10 + v18;
  *a3 = v20 + 1;
  int v21 = *(unsigned __int8 *)(v20 + a1);
  *a3 = v20 + 2;
  int v22 = *(unsigned __int8 *)(v20 + a1 + 1);
  *a3 = v20 + 4;
  *(_DWORD *)(a5 + 12) = v21;
  *(_DWORD *)(a5 + 16) = v22;
  if (v20 != 20) {
    AnimCodec::AnimDecoder::getInfo();
  }
  return 0;
}

uint64_t AnimCodec::AnimDecoder::decompress(AnimCodec::AnimDecoder *this, const unsigned __int8 *a2, unint64_t a3, AnimCodec *a4, int *a5, uint64_t a6, const int *a7, int a8, unint64_t a9, int *a10)
{
  v28[0] = a2;
  v28[1] = a3;
  uint64_t v29 = 0;
  int v27 = 0;
  uint64_t Info = AnimCodec::AnimDecoder::getInfo((uint64_t)a2, a3, &v29, &v27, (uint64_t)&v30);
  if (!Info)
  {
    if (v32 == 1 && v33 == 0)
    {
      uint64_t Info = 2;
      if (a6)
      {
        if (a7)
        {
          int v18 = v31;
          if (v31)
          {
            if (v30 <= a3
              && (int v19 = v27,
                  v19 == AnimCodec::ComputeCRC32(v28[0] + 8, (const unsigned __int8 *)(v30 - 8))))
            {
              uint64_t v26 = 0;
              memset(v25, 0, sizeof(v25));
              memset(&__p, 0, sizeof(__p));
              uint64_t Info = AnimCodec::ComputeAdjacencyInfo(a4, a5, a7, a8, a9, (std::vector<unsigned int> *)v25, v20);
              if (!Info)
              {
                uint64_t v21 = AnimCodec::ComputeTraversalOrder((AnimCodec::StaticAdjacencyInformation *)v25, &__p);
                uint64_t Info = v21;
                if (!v21) {
                  uint64_t Info = AnimCodec::AnimDecoder::decompress(v21, (AnimCodec::StaticAdjacencyInformation *)v25, &__p, v22, a6, v18, (uint64_t)v28, (uint64_t)a10);
                }
              }
              if (__p.__begin_)
              {
                __p.__end_ = __p.__begin_;
                operator delete(__p.__begin_);
              }
              vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v25);
            }
            else
            {
              return 3;
            }
          }
        }
      }
    }
    else
    {
      return 4;
    }
  }
  return Info;
}

uint64_t AnimCodec::AnimDecoder::decompress(uint64_t a1, AnimCodec::StaticAdjacencyInformation *a2, void *a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a7 + 16);
  unsigned int v13 = *(_DWORD *)(a7 + 8) - v12;
  uint64_t v14 = *(void *)a7 + v12;
  unsigned int v80 = v13;
  uint64_t v81 = v14;
  AnimCodec::ArithmeticDecoder::start((AnimCodec::ArithmeticDecoder *)&v80);
  uint64_t v62 = a2;
  unint64_t v15 = *((void *)a2 + 4) - *((void *)a2 + 3);
  unint64_t v16 = v15 >> 2;
  if ((int)(v15 >> 2) < 1) {
    return 2;
  }
  __int16 v79 = 0x8000;
  uint64_t v76 = 0;
  unint64_t v77 = 0;
  uint64_t v78 = 0;
  int v73 = 0;
  uint64_t v74 = 0;
  uint64_t v75 = 0;
  unint64_t v70 = 0;
  int v71 = 0;
  uint64_t v72 = 0;
  std::vector<unsigned int> __p = 0;
  int v68 = 0;
  uint64_t v69 = 0;
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v76, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v73, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v70, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&__p, 31 * a5);
  memset(&v66, 0, sizeof(v66));
  memset(&v65, 0, sizeof(v65));
  memset(&v64, 0, sizeof(v64));
  std::vector<int>::resize(&v66, a5);
  std::vector<int>::resize(&v65, a5);
  std::vector<int>::resize(&v64, a5);
  if (a6 < 1)
  {
    uint64_t v55 = 0;
    goto LABEL_47;
  }
  uint64_t v57 = a6;
  uint64_t v58 = 0;
  uint64_t v60 = (v15 >> 2);
  uint64_t v61 = 4 * a5;
  uint64_t v17 = a3;
  do
  {
    uint64_t v18 = 0;
    char v63 = 1;
    do
    {
      int v19 = *(_DWORD *)(*v17 + 4 * v18);
      if (a5 >= 1) {
        bzero(v65.__begin_, v61);
      }
      int started = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(v62, v19);
      int v21 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(v62, v19);
      if (v21 > started)
      {
        unsigned int v22 = 0;
        uint64_t v23 = *((void *)v62 + 6);
        std::vector<unsigned int>::pointer begin = v65.__begin_;
        uint64_t v25 = started;
        while (1)
        {
          int v26 = *(_DWORD *)(v23 + 4 * v25);
          if (v26 < 0) {
            break;
          }
          if (v26 >= (int)v16)
          {
            uint64_t v55 = 2;
            goto LABEL_47;
          }
          if (a5 >= 1)
          {
            int v27 = (int *)(a8 + 4 * v26 * a5);
            uint64_t v28 = a5;
            std::vector<unsigned int>::pointer v29 = begin;
            do
            {
              int v30 = *v27++;
              *v29++ += v30;
              --v28;
            }
            while (v28);
          }
          ++v22;
          ++v25;
          if (v22 == v21 - started)
          {
            unsigned int v22 = v21 - started;
            break;
          }
        }
        if (v22 < 2) {
          goto LABEL_20;
        }
        if (a5 < 1)
        {
          BOOL v54 = AnimCodec::ArithmeticDecoder::decode(&v80, &v79) != (v63 & 1);
          goto LABEL_40;
        }
        std::vector<unsigned int>::pointer v31 = v65.__begin_;
        uint64_t v32 = a5;
        do
        {
          char *v31 = (int)(*v31 + (v22 >> 1)) / (int)v22;
          ++v31;
          --v32;
        }
        while (v32);
      }
LABEL_20:
      int v33 = AnimCodec::ArithmeticDecoder::decode(&v80, &v79);
      int v34 = v63 & 1;
      BOOL v35 = v33 == v34;
      BOOL v36 = v33 != v34;
      if (v35)
      {
        if (a5 < 1)
        {
          char v63 = 0;
          goto LABEL_41;
        }
        char v63 = v36;
        uint64_t v37 = 0;
        do
        {
          if (AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)v70 + v37))
          {
            BOOL v38 = AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)v76 + v37);
            BOOL v39 = AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + (31 * v37));
            int v40 = v39 + 2 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v39 + 1);
            int v41 = v40 + 4 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v40 + 3);
            int v42 = v41 + 8 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v41 + 7);
            int v43 = v42 + 16 * AnimCodec::ArithmeticDecoder::decode(&v80, (_WORD *)__p + 31 * (int)v37 + v42 + 15);
            if (v43 > 30) {
              int v44 = AnimCodec::ArithmeticDecoder::decodeExpGolomb(&v80, 6, (_WORD *)v73 + v37) + 32;
            }
            else {
              int v44 = v43 + 1;
            }
            if (!v38) {
              int v44 = -v44;
            }
          }
          else
          {
            int v44 = 0;
          }
          v64.__begin_[v37++] = v44;
        }
        while (v37 != a5);
        uint64_t v17 = a3;
        goto LABEL_34;
      }
      if (a5 >= 1)
      {
        char v63 = v36;
        bzero(v64.__begin_, v61);
LABEL_34:
        std::vector<unsigned int>::pointer v45 = v65.__begin_;
        std::vector<unsigned int>::pointer v46 = v64.__begin_;
        std::vector<unsigned int>::pointer v47 = v66.__begin_;
        uint64_t v48 = 4 * v19 * a5;
        uint64_t v49 = a5;
        do
        {
          int v51 = *v45++;
          int v50 = v51;
          int v52 = *v46++;
          unsigned int v53 = v52 + v50;
          *v47++ = v53;
          *(_DWORD *)(a8 + v48) = v53;
          v48 += 4;
          --v49;
        }
        while (v49);
        goto LABEL_41;
      }
      BOOL v54 = 1;
LABEL_40:
      char v63 = v54;
LABEL_41:
      ++v18;
    }
    while (v18 != v60);
    uint64_t v55 = 0;
    a8 += 4 * (int)v16 * a5;
    ++v58;
  }
  while (v58 != v57);
LABEL_47:
  if (v64.__begin_)
  {
    v64.__end_ = v64.__begin_;
    operator delete(v64.__begin_);
  }
  if (v65.__begin_)
  {
    v65.__end_ = v65.__begin_;
    operator delete(v65.__begin_);
  }
  if (v66.__begin_)
  {
    v66.__end_ = v66.__begin_;
    operator delete(v66.__begin_);
  }
  if (__p)
  {
    int v68 = __p;
    operator delete(__p);
  }
  if (v70)
  {
    int v71 = v70;
    operator delete(v70);
  }
  if (v73)
  {
    uint64_t v74 = v73;
    operator delete(v73);
  }
  if (v76)
  {
    unint64_t v77 = v76;
    operator delete(v76);
  }
  return v55;
}

void std::vector<AnimCodec::ArithmeticContext>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    std::vector<AnimCodec::ArithmeticContext>::__append((char **)a1, a2 - v2);
  }
}

uint64_t AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(AnimCodec::StaticAdjacencyInformation *this, int a2)
{
  if ((int)((*((void *)this + 4) - *((void *)this + 3)) >> 2) <= a2) {
    AnimCodec::StaticAdjacencyInformation::neighborsStartIndex();
  }
  return *(unsigned int *)(*(void *)this + 4 * a2);
}

uint64_t AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(AnimCodec::StaticAdjacencyInformation *this, int a2)
{
  uint64_t v2 = *((void *)this + 3);
  if ((int)((unint64_t)(*((void *)this + 4) - v2) >> 2) <= a2) {
    AnimCodec::StaticAdjacencyInformation::neighborsEndIndex();
  }
  return (*(_DWORD *)(v2 + 4 * a2) + *(_DWORD *)(*(void *)this + 4 * a2));
}

BOOL AnimCodec::ArithmeticDecoder::decode(unsigned int *a1, _WORD *a2)
{
  unsigned int v2 = a1[7];
  unsigned int v3 = a1[8];
  if (v2 > 0x40000000)
  {
    unsigned int v10 = a1[7];
  }
  else
  {
    int v4 = a1[10];
    do
    {
      v3 *= 2;
      a1[10] = --v4;
      if (!v4)
      {
        uint64_t v5 = *((void *)a1 + 2);
        *((void *)a1 + 2) = v5 + 1;
        unint64_t v6 = *a1;
        if (v5 + 1 >= v6) {
          int v7 = 65280;
        }
        else {
          int v7 = *(unsigned __int8 *)(*((void *)a1 + 1) + v5 + 1) << 8;
        }
        unint64_t v8 = v5 + 2;
        *((void *)a1 + 2) = v8;
        if (v8 >= v6) {
          int v9 = 255;
        }
        else {
          int v9 = *(unsigned __int8 *)(*((void *)a1 + 1) + v8);
        }
        v3 |= v7 | v9;
        int v4 = 16;
        a1[10] = 16;
      }
      unsigned int v10 = 2 * v2;
      BOOL v11 = v2 >= 0x20000001;
      v2 *= 2;
    }
    while (!v11);
  }
  unsigned int v12 = (unsigned __int16)*a2;
  unsigned int v13 = (HIWORD(v10) * v12) & 0xFFFF0000;
  unsigned int v14 = v10 - v13;
  BOOL v15 = v3 >= v13;
  *a2 = *((_WORD *)a1 + ((v12 >> 7) & 0x1FE | v15) + 24) + v12;
  if (v3 < v13) {
    unsigned int v16 = v13;
  }
  else {
    unsigned int v16 = v14;
  }
  if (v3 < v13) {
    unsigned int v13 = 0;
  }
  a1[7] = v16;
  a1[8] = v3 - v13;
  return v15;
}

uint64_t AnimCodec::ArithmeticDecoder::decodeExpGolomb(unsigned int *a1, int a2, _WORD *a3)
{
  int v6 = 0;
  if (AnimCodec::ArithmeticDecoder::decode(a1, a3))
  {
    int v7 = a2;
    do
    {
      a2 = v7 + 1;
      v6 |= 1 << v7;
      BOOL v8 = AnimCodec::ArithmeticDecoder::decode(a1, a3);
      int v7 = a2;
    }
    while (v8);
  }
  int v9 = 0;
  if (a2)
  {
    int v10 = a2 - 1;
    do
    {
      __int16 v12 = 0x8000;
      v9 |= AnimCodec::ArithmeticDecoder::decode(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t AnimCodec::ComputeAdjacencyInfo(AnimCodec *this, int *a2, const int *a3, int a4, int a5, std::vector<unsigned int> *a6, AnimCodec::StaticAdjacencyInformation *a7)
{
  uint64_t result = 2;
  if (this && a2 && (int)a3 >= 1)
  {
    AnimCodec::StaticAdjacencyInformation::resize(a6, (int)a3);
    if (a5 >= 1)
    {
      uint64_t v12 = a5;
      unsigned int v13 = a2;
      do
      {
        int v14 = *v13++;
        AnimCodec::StaticAdjacencyInformation::incrementNeighborCount(a6, v14, 2);
        --v12;
      }
      while (v12);
    }
    AnimCodec::StaticAdjacencyInformation::updateShift(a6);
    if (a4 < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v15 = 0;
      uint64_t v16 = 0;
      uint64_t v28 = a2;
      std::vector<unsigned int>::pointer v29 = a2 + 1;
      uint64_t v17 = a4;
      while (1)
      {
        int v18 = *((_DWORD *)this + v15);
        uint64_t v19 = (v18 - 1);
        if (v18 < 1) {
          break;
        }
        if (v18 == 1)
        {
          uint64_t v20 = v16;
        }
        else
        {
          uint64_t v20 = (v18 + v16);
          if ((int)v20 > a5) {
            return 2;
          }
          int v21 = this;
          uint64_t v22 = (int)v16;
          uint64_t v23 = (int *)&v29[(int)v16];
          do
          {
            int v24 = *(v23 - 1);
            int v25 = *v23;
            if (v24 != *v23)
            {
              AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, *(v23 - 1), *v23);
              AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, v25, v24);
            }
            ++v23;
            --v19;
          }
          while (v19);
          int v26 = v28[v22];
          int v27 = v28[(int)v20 - 1];
          this = v21;
          if (v26 != v27)
          {
            AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, v28[v22], v28[(int)v20 - 1]);
            AnimCodec::StaticAdjacencyInformation::insertNeighbor((AnimCodec::StaticAdjacencyInformation *)a6, v27, v26);
          }
        }
        ++v15;
        uint64_t v16 = v20;
        if (v15 == v17) {
          return 0;
        }
      }
      return 2;
    }
  }
  return result;
}

uint64_t AnimCodec::ComputeTraversalOrder(AnimCodec::StaticAdjacencyInformation *a1, std::vector<unsigned int> *this)
{
  unint64_t v2 = *((void *)a1 + 4) - *((void *)a1 + 3);
  unint64_t v3 = v2 >> 2;
  if ((int)(v2 >> 2) < 1) {
    return 2;
  }
  long long v41 = 0u;
  memset(v40, 0, sizeof(v40));
  std::vector<unsigned int>::size_type v6 = (v2 >> 2);
  std::vector<int>::resize(this, v6);
  std::vector<unsigned int> __p = 0;
  unint64_t v38 = 0;
  uint64_t v39 = 0;
  std::vector<BOOL>::resize((uint64_t)&__p, v6, 0);
  if (v38)
  {
    int v42 = __p;
    int v43 = 0;
    std::__fill_n[abi:nn180100]<true,std::vector<BOOL>>(&v42, v38);
  }
  int v7 = 0;
  int v8 = 0;
  LODWORD(v42) = 0;
  while (1)
  {
    unint64_t v9 = (unint64_t)v8 >> 6;
    uint64_t v10 = *((void *)__p + v9);
    if ((v10 & (1 << v8)) != 0)
    {
      *((void *)__p + v9) = v10 & ~(1 << v8);
      this->__begin_[v7] = v8;
      std::deque<int>::push_back(v40, &v42);
      uint64_t v11 = *((void *)&v41 + 1);
      ++v7;
      if (*((void *)&v41 + 1)) {
        break;
      }
    }
LABEL_20:
    int v8 = v42 + 1;
    LODWORD(v42) = v8;
    if (v8 >= (int)v3)
    {
      uint64_t v20 = 0;
      do
      {
        unint64_t v21 = (int)this->__begin_[v20];
        *(void *)((char *)__p + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
        int started = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(a1, v21);
        int v23 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(a1, v21);
        uint64_t v24 = *((void *)a1 + 6);
        if (started >= v23)
        {
          uint64_t v25 = started;
          uint64_t v26 = v23;
        }
        else
        {
          uint64_t v25 = started;
          uint64_t v26 = v23;
          int v27 = (char *)__p;
          uint64_t v28 = (int *)(v24 + 4 * started);
          uint64_t v29 = v23 - (uint64_t)started;
          do
          {
            if (((*(void *)&v27[((unint64_t)*v28 >> 3) & 0x1FFFFFFFFFFFFFF8] >> *v28) & 1) == 0) {
              *uint64_t v28 = -1;
            }
            ++v28;
            --v29;
          }
          while (v29);
        }
        int v30 = (int *)(v24 + 4 * v25);
        std::vector<unsigned int>::pointer v31 = (int *)(v24 + 4 * v26);
        unint64_t v32 = 126 - 2 * __clz(v31 - v30);
        if (v23 == started) {
          uint64_t v33 = 0;
        }
        else {
          uint64_t v33 = v32;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(v30, v31, (uint64_t)&v42, v33, 1);
        ++v20;
      }
      while (v20 != v6);
      uint64_t v34 = 2 * (v7 != v3);
      goto LABEL_35;
    }
  }
  while (1)
  {
    int v12 = *(_DWORD *)(*(void *)(*((void *)&v40[0] + 1) + (((unint64_t)v41 >> 7) & 0x1FFFFFFFFFFFFF8))
                    + 4 * (v41 & 0x3FF));
    *(void *)&long long v41 = v41 + 1;
    *((void *)&v41 + 1) = v11 - 1;
    if ((unint64_t)v41 >= 0x800)
    {
      operator delete(**((void ***)&v40[0] + 1));
      *((void *)&v40[0] + 1) += 8;
      *(void *)&long long v41 = v41 - 1024;
    }
    int v13 = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(a1, v12);
    int v14 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(a1, v12);
    int v15 = v14 - v13;
    if (v14 > v13) {
      break;
    }
LABEL_19:
    uint64_t v11 = *((void *)&v41 + 1);
    if (!*((void *)&v41 + 1)) {
      goto LABEL_20;
    }
  }
  uint64_t v16 = 4 * v13;
  while (1)
  {
    int v36 = 0;
    unint64_t v17 = *(unsigned int *)(*((void *)a1 + 6) + v16);
    int v36 = v17;
    if ((v17 & 0x80000000) != 0) {
      break;
    }
    if ((int)v17 >= (int)v3 || v17 == v12) {
      break;
    }
    uint64_t v19 = *((void *)__p + (v17 >> 6));
    if ((v19 & (1 << v17)) != 0)
    {
      *((void *)__p + (v17 >> 6)) = v19 & ~(1 << v17);
      this->__begin_[v7] = v17;
      std::deque<int>::push_back(v40, &v36);
      ++v7;
    }
    v16 += 4;
    if (!--v15) {
      goto LABEL_19;
    }
  }
  uint64_t v34 = 2;
LABEL_35:
  if (__p) {
    operator delete(__p);
  }
  std::deque<int>::~deque[abi:nn180100](v40);
  return v34;
}

void AnimCodec::StaticAdjacencyInformation::resize(std::vector<unsigned int> *this, int a2)
{
  std::vector<int>::resize(this, a2 + 1);
  std::vector<int>::resize(this + 1, a2);
  uint64_t v4 = (char *)this->__end_ - (char *)this->__begin_;
  if (v4 >= 1) {
    bzero(this->__begin_, 4 * (((unint64_t)v4 >> 2) - ((unint64_t)v4 > 3)) + 4);
  }
  std::vector<unsigned int>::pointer begin = (char *)this[1].__begin_;
  uint64_t v6 = (char *)this[1].__end_ - begin;
  if (v6 >= 1)
  {
    bzero(begin, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
  }
}

void *AnimCodec::StaticAdjacencyInformation::incrementNeighborCount(void *this, int a2, int a3)
{
  if ((int)((this[4] - this[3]) >> 2) <= a2) {
    AnimCodec::StaticAdjacencyInformation::incrementNeighborCount();
  }
  *(_DWORD *)(*this + 4 * (a2 + 1)) += a3;
  return this;
}

void AnimCodec::StaticAdjacencyInformation::updateShift(std::vector<unsigned int> *this)
{
  std::vector<unsigned int>::pointer begin = this->__begin_;
  std::vector<unsigned int>::pointer end = this->__end_;
  unint64_t v3 = (char *)end - (char *)this->__begin_;
  if ((int)(v3 >> 2) >= 2)
  {
    uint64_t v4 = (v3 >> 2);
    unsigned int v7 = *begin;
    uint64_t v5 = begin + 1;
    unsigned int v6 = v7;
    uint64_t v8 = v4 - 1;
    do
    {
      v6 += *v5;
      *v5++ = v6;
      --v8;
    }
    while (v8);
  }
  std::vector<int>::resize(this + 2, (int)*(end - 1));
}

AnimCodec::StaticAdjacencyInformation *AnimCodec::StaticAdjacencyInformation::insertNeighbor(AnimCodec::StaticAdjacencyInformation *this, int a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(*((void *)this + 3) + 4 * a2);
  if ((int)v3 < 1) {
    return (AnimCodec::StaticAdjacencyInformation *)AnimCodec::StaticAdjacencyInformation::addNeighbor(this, a2, a3);
  }
  uint64_t v4 = (int *)(*((void *)this + 6) + 4 * *(int *)(*(void *)this + 4 * a2));
  while (1)
  {
    int v5 = *v4++;
    if (v5 == a3) {
      break;
    }
    if (!--v3) {
      return (AnimCodec::StaticAdjacencyInformation *)AnimCodec::StaticAdjacencyInformation::addNeighbor(this, a2, a3);
    }
  }
  return this;
}

uint64_t AnimCodec::StaticAdjacencyInformation::addNeighbor(AnimCodec::StaticAdjacencyInformation *this, int a2, int a3)
{
  int v6 = *(_DWORD *)(*((void *)this + 3) + 4 * a2);
  uint64_t result = AnimCodec::StaticAdjacencyInformation::maxNeighborCount(this, a2);
  if (v6 >= (int)result) {
    AnimCodec::StaticAdjacencyInformation::addNeighbor();
  }
  int v8 = *(_DWORD *)(*(void *)this + 4 * a2);
  uint64_t v9 = *((void *)this + 3);
  int v10 = *(_DWORD *)(v9 + 4 * a2);
  *(_DWORD *)(v9 + 4 * a2) = v10 + 1;
  *(_DWORD *)(*((void *)this + 6) + 4 * (v10 + v8)) = a3;
  return result;
}

uint64_t AnimCodec::StaticAdjacencyInformation::maxNeighborCount(AnimCodec::StaticAdjacencyInformation *this, int a2)
{
  if ((int)((*((void *)this + 4) - *((void *)this + 3)) >> 2) <= a2) {
    AnimCodec::StaticAdjacencyInformation::maxNeighborCount();
  }
  return (*(_DWORD *)(*(void *)this + 4 * a2 + 4) - *(_DWORD *)(*(void *)this + 4 * a2));
}

void std::vector<BOOL>::resize(uint64_t a1, unint64_t a2, int a3)
{
  unint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    *(void *)(a1 + 8) = a2;
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 16);
    unint64_t v9 = v8 << 6;
    if (v8 << 6 < v6 || v5 > (v8 << 6) - v6)
    {
      unint64_t v21 = 0;
      long long v22 = 0uLL;
      if ((a2 & 0x8000000000000000) != 0) {
        abort();
      }
      unint64_t v11 = v8 << 7;
      if (v11 <= ((a2 + 63) & 0xFFFFFFFFFFFFFFC0)) {
        unint64_t v11 = (a2 + 63) & 0xFFFFFFFFFFFFFFC0;
      }
      if (v9 <= 0x3FFFFFFFFFFFFFFELL) {
        unint64_t v12 = v11;
      }
      else {
        unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      std::vector<BOOL>::reserve(&v21, v12);
      int v13 = *(unint64_t **)a1;
      unint64_t v14 = *(void *)(a1 + 8);
      *(void *)&long long v22 = v14 + v6;
      int v23 = v21;
      int v24 = 0;
      std::__copy_aligned[abi:nn180100]<std::vector<BOOL>,true>(v13, 0, (uint64_t)&v13[v14 >> 6], v14 & 0x3F, (uint64_t)&v23, (uint64_t)&v19);
      unint64_t v17 = v19;
      LODWORD(v18) = v20;
      int v15 = *(char **)a1;
      *(void *)a1 = v21;
      unint64_t v21 = v15;
      long long v16 = *(_OWORD *)(a1 + 8);
      *(_OWORD *)(a1 + 8) = v22;
      long long v22 = v16;
      if (v15) {
        operator delete(v15);
      }
    }
    else
    {
      unint64_t v17 = (char *)(*(void *)a1 + 8 * (v5 >> 6));
      uint64_t v18 = *(void *)(a1 + 8) & 0x3FLL;
      *(void *)(a1 + 8) = a2;
    }
    if (a2 != v5)
    {
      if (a3)
      {
        unint64_t v21 = v17;
        LODWORD(v22) = v18;
        std::__fill_n[abi:nn180100]<true,std::vector<BOOL>>(&v21, v6);
      }
      else
      {
        unint64_t v21 = v17;
        LODWORD(v22) = v18;
        std::__fill_n[abi:nn180100]<false,std::vector<BOOL>>((uint64_t)&v21, v6);
      }
    }
  }
}

unint64_t *std::__copy_aligned[abi:nn180100]<std::vector<BOOL>,true>@<X0>(unint64_t *__src@<X0>, unsigned int a2@<W1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  int64_t v8 = a4 - (unint64_t)a2 + 8 * (a3 - (void)__src);
  if (v8 <= 0)
  {
    long long v16 = *(unint64_t **)a5;
  }
  else
  {
    unint64_t v9 = __src;
    __src = *(unint64_t **)a5;
    if (a2)
    {
      if (v8 >= (unint64_t)(64 - a2)) {
        int64_t v10 = 64 - a2;
      }
      else {
        int64_t v10 = v8;
      }
      v8 -= v10;
      uint64_t v11 = *v9++;
      *__src = *__src & ~((0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2)) | v11 & (0xFFFFFFFFFFFFFFFFLL >> (64 - a2 - v10)) & (-1 << a2);
      unint64_t v12 = v10 + *(unsigned int *)(a5 + 8);
      __src = (unint64_t *)((char *)__src + ((v12 >> 3) & 0x3FFFFFF8));
      *(void *)a5 = __src;
      *(_DWORD *)(a5 + 8) = v12 & 0x3F;
    }
    if (v8 >= 0) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = v8 + 63;
    }
    uint64_t v14 = v13 >> 6;
    if ((unint64_t)(v8 + 63) >= 0x7F)
    {
      memmove(__src, v9, 8 * v14);
      __src = *(unint64_t **)a5;
    }
    uint64_t v15 = v8 - (v14 << 6);
    long long v16 = &__src[v14];
    *(void *)a5 = v16;
    if (v15 >= 1)
    {
      *long long v16 = *v16 & ~(0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8)) | v9[v14] & (0xFFFFFFFFFFFFFFFFLL >> (((_BYTE)v14 << 6) - v8));
      *(_DWORD *)(a5 + 8) = v15;
    }
  }
  *(void *)a6 = v16;
  *(_DWORD *)(a6 + 8) = *(_DWORD *)(a5 + 8);
  return __src;
}

void *std::__fill_n[abi:nn180100]<true,std::vector<BOOL>>(void *result, unint64_t a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = result;
  int v4 = *((_DWORD *)result + 2);
  unint64_t v5 = (void *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    unint64_t v2 = a2 - v6;
    *uint64_t result = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    uint64_t result = memset(v5, 255, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int64_t v8 = &v5[v7];
    *uint64_t v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void std::__fill_n[abi:nn180100]<false,std::vector<BOOL>>(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(_DWORD *)(a1 + 8);
  unint64_t v5 = *(void **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2) {
      unint64_t v6 = a2;
    }
    else {
      unint64_t v6 = (64 - v4);
    }
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    unint64_t v2 = a2 - v6;
    *(void *)a1 = v5;
  }
  unint64_t v7 = v2 >> 6;
  if (v2 >= 0x40) {
    bzero(v5, 8 * v7);
  }
  if ((v2 & 0x3F) != 0)
  {
    int64_t v8 = &v5[v7];
    *(void *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

void std::deque<int>::push_back(void *a1, _DWORD *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 7) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<int>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(_DWORD *)(*(void *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
}

void std::deque<int>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x400;
  unint64_t v4 = v2 - 1024;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_29:
      *(void *)unint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v29 = 1;
      }
      else {
        unint64_t v29 = (uint64_t)&v8[-*a1] >> 2;
      }
      int v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v5, v29);
      std::vector<unsigned int>::pointer v31 = &v30[8 * (v29 >> 2)];
      uint64_t v33 = &v30[8 * v32];
      uint64_t v34 = (uint64_t *)a1[1];
      unint64_t v8 = v31;
      uint64_t v35 = a1[2] - (void)v34;
      if (v35)
      {
        unint64_t v8 = &v31[v35 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v36 = 8 * (v35 >> 3);
        uint64_t v37 = &v30[8 * (v29 >> 2)];
        do
        {
          uint64_t v38 = *v34++;
          *(void *)uint64_t v37 = v38;
          v37 += 8;
          v36 -= 8;
        }
        while (v36);
      }
      goto LABEL_26;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      unint64_t v9 = (char *)a1[1];
    }
    unint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_29;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<int *>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<int *>::push_front((uint64_t)a1, &v54);
    int v40 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v41 = *v40;
    unint64_t v9 = (char *)(v40 + 1);
    uint64_t v10 = v41;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_29;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      int v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(a1 + 3), v46);
      std::vector<unsigned int>::pointer v31 = &v30[8 * (v46 >> 2)];
      uint64_t v33 = &v30[8 * v47];
      uint64_t v48 = (uint64_t *)a1[1];
      unint64_t v8 = v31;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        unint64_t v8 = &v31[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        int v51 = &v30[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)int v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_26:
      uint64_t v39 = (char *)*a1;
      *a1 = v30;
      a1[1] = v31;
      a1[2] = v8;
      a1[3] = v33;
      if (v39)
      {
        operator delete(v39);
        unint64_t v8 = (char *)a1[2];
      }
      goto LABEL_29;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  uint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  unsigned int v53 = operator new(0x1000uLL);
  std::__split_buffer<int *>::push_back(&v54, &v53);
  int v27 = (char *)a1[2];
  if (v27 == (char *)a1[1])
  {
    uint64_t v28 = (char *)a1[2];
  }
  else
  {
    do
    {
      v27 -= 8;
      std::__split_buffer<int *>::push_front((uint64_t)&v54, v27);
    }
    while (v27 != (char *)a1[1]);
    uint64_t v28 = (char *)a1[2];
  }
  int v42 = (char *)*a1;
  long long v43 = v54;
  long long v44 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  uint64_t v45 = a1[3];
  *(_OWORD *)a1 = v43;
  *((_OWORD *)a1 + 1) = v44;
  *(void *)&long long v55 = v28;
  *((void *)&v55 + 1) = v45;
  if (v28 != v27) {
    *(void *)&long long v55 = &v28[(v27 - v28 + 7) & 0xFFFFFFFFFFFFFFF8];
  }
  if (v42) {
    operator delete(v42);
  }
}

void std::__split_buffer<int *>::push_back(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      int v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        unint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<int *>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      int64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        int64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

int *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *,int *>(int *a1, int *a2, int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v6 = a2;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 5)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      unint64_t v12 = &a1[v10];
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = v6;
    if (v6 != a3)
    {
      uint64_t v14 = v6;
      do
      {
        int v15 = *v14;
        if (*v14 > *a1)
        {
          *uint64_t v14 = *a1;
          *a1 = v15;
          std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 5)
    {
      uint64_t v16 = (unint64_t)v8 >> 2;
      do
      {
        uint64_t v17 = 0;
        int v18 = *a1;
        uint64_t v19 = a1;
        do
        {
          uint64_t v20 = &v19[v17 + 1];
          uint64_t v21 = (2 * v17) | 1;
          uint64_t v17 = 2 * v17 + 2;
          if (v17 >= v16)
          {
            int v22 = *v20;
            uint64_t v17 = v21;
          }
          else
          {
            int v22 = *v20;
            int v23 = v20[1];
            if (*v20 >= v23) {
              int v22 = v20[1];
            }
            if (*v20 <= v23) {
              uint64_t v17 = v21;
            }
            else {
              ++v20;
            }
          }
          *uint64_t v19 = v22;
          uint64_t v19 = v20;
        }
        while (v17 <= (uint64_t)((unint64_t)(v16 - 2) >> 1));
        if (v20 == --v6)
        {
          *uint64_t v20 = v18;
        }
        else
        {
          *uint64_t v20 = *v6;
          *uint64_t v6 = v18;
          uint64_t v24 = (char *)v20 - (char *)a1 + 4;
          if (v24 >= 5)
          {
            unint64_t v25 = (((unint64_t)v24 >> 2) - 2) >> 1;
            uint64_t v26 = &a1[v25];
            int v27 = *v26;
            int v28 = *v20;
            if (*v26 > *v20)
            {
              do
              {
                *uint64_t v20 = v27;
                uint64_t v20 = v26;
                if (!v25) {
                  break;
                }
                unint64_t v25 = (v25 - 1) >> 1;
                uint64_t v26 = &a1[v25];
                int v27 = *v26;
              }
              while (*v26 > v28);
              *uint64_t v20 = v28;
            }
          }
        }
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 2)
    {
      uint64_t v6 = v4 >> 1;
      uint64_t v7 = (v4 >> 1) + 1;
      uint64_t v8 = (int *)(result + 4 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 >= a3)
      {
        int v10 = *v8;
      }
      else
      {
        int v10 = *v8;
        int v11 = v8[1];
        if (*v8 >= v11) {
          int v10 = v8[1];
        }
        if (*v8 > v11)
        {
          ++v8;
          uint64_t v7 = v9;
        }
      }
      int v12 = *a4;
      if (v10 <= *a4)
      {
        do
        {
          *a4 = v10;
          a4 = v8;
          if (v5 < v7) {
            break;
          }
          uint64_t v13 = (2 * v7) | 1;
          uint64_t v8 = (int *)(result + 4 * v13);
          uint64_t v7 = 2 * v7 + 2;
          if (v7 >= a3)
          {
            int v10 = *v8;
            uint64_t v7 = v13;
          }
          else
          {
            int v10 = *v8;
            int v14 = v8[1];
            if (*v8 >= v14) {
              int v10 = v8[1];
            }
            if (*v8 <= v14) {
              uint64_t v7 = v13;
            }
            else {
              ++v8;
            }
          }
        }
        while (v10 <= v12);
        *a4 = v12;
      }
    }
  }
  return result;
}

int *std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(int *result, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = result;
LABEL_2:
  int v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = a2 - v11;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          int v22 = *(a2 - 1);
          int v23 = *v11;
          if (v22 > *v11)
          {
            int *v11 = v22;
            *(a2 - 1) = v23;
          }
          break;
        case 3uLL:
          int v24 = v11[1];
          int v25 = *(a2 - 1);
          if (v24 <= v25) {
            int v26 = *(a2 - 1);
          }
          else {
            int v26 = v11[1];
          }
          if (v24 >= v25) {
            int v24 = *(a2 - 1);
          }
          *(a2 - 1) = v24;
          v11[1] = v26;
          int v27 = *(a2 - 1);
          if (v27 <= *v11) {
            int v28 = *v11;
          }
          else {
            int v28 = *(a2 - 1);
          }
          if (v27 >= *v11) {
            int v27 = *v11;
          }
          *(a2 - 1) = v27;
          int v30 = *v11;
          int v29 = v11[1];
          if (v28 <= v29) {
            int v30 = v11[1];
          }
          if (v28 < v29) {
            int v29 = v28;
          }
          int *v11 = v30;
          v11[1] = v29;
          break;
        case 4uLL:
          int v32 = v11[1];
          int v31 = v11[2];
          if (*v11 <= v31) {
            int v33 = v11[2];
          }
          else {
            int v33 = *v11;
          }
          if (*v11 < v31) {
            int v31 = *v11;
          }
          v11[2] = v31;
          int *v11 = v33;
          int v34 = *(a2 - 1);
          if (v32 <= v34) {
            int v35 = *(a2 - 1);
          }
          else {
            int v35 = v32;
          }
          if (v32 < v34) {
            int v34 = v32;
          }
          *(a2 - 1) = v34;
          int v36 = *v11;
          if (*v11 <= v35) {
            int v37 = v35;
          }
          else {
            int v37 = *v11;
          }
          if (v36 >= v35) {
            int v36 = v35;
          }
          int *v11 = v37;
          v11[1] = v36;
          int v38 = v11[2];
          int v39 = *(a2 - 1);
          if (v38 <= v39) {
            int v40 = *(a2 - 1);
          }
          else {
            int v40 = v11[2];
          }
          if (v38 >= v39) {
            int v38 = *(a2 - 1);
          }
          *(a2 - 1) = v38;
          int v41 = v11[1];
          if (v41 <= v40) {
            int v42 = v40;
          }
          else {
            int v42 = v11[1];
          }
          if (v41 >= v40) {
            int v41 = v40;
          }
          v11[1] = v42;
          v11[2] = v41;
          break;
        case 5uLL:
          int v43 = *v11;
          int v44 = v11[1];
          if (*v11 <= v44) {
            int v45 = v11[1];
          }
          else {
            int v45 = *v11;
          }
          if (v43 >= v44) {
            int v43 = v11[1];
          }
          int *v11 = v45;
          v11[1] = v43;
          int v46 = v11[3];
          int v47 = *(a2 - 1);
          if (v46 <= v47) {
            int v48 = *(a2 - 1);
          }
          else {
            int v48 = v11[3];
          }
          if (v46 >= v47) {
            int v46 = *(a2 - 1);
          }
          *(a2 - 1) = v46;
          v11[3] = v48;
          int v49 = *(a2 - 1);
          int v50 = v11[2];
          if (v49 <= v50) {
            int v51 = v11[2];
          }
          else {
            int v51 = *(a2 - 1);
          }
          if (v49 >= v50) {
            int v49 = v11[2];
          }
          *(a2 - 1) = v49;
          int v53 = v11[2];
          int v52 = v11[3];
          int v54 = v11[1];
          if (v51 <= v52) {
            int v53 = v11[3];
          }
          if (v51 < v52) {
            int v52 = v51;
          }
          v11[2] = v53;
          v11[3] = v52;
          int v55 = *(a2 - 1);
          if (v54 <= v55) {
            int v56 = *(a2 - 1);
          }
          else {
            int v56 = v54;
          }
          if (v54 < v55) {
            int v55 = v54;
          }
          *(a2 - 1) = v55;
          int v57 = *v11;
          int v59 = v11[2];
          int v58 = v11[3];
          if (v58 <= *v11) {
            int v60 = *v11;
          }
          else {
            int v60 = v11[3];
          }
          if (v58 >= v57) {
            int v58 = *v11;
          }
          if (v60 <= v59) {
            int v57 = v11[2];
          }
          if (v60 < v59) {
            int v59 = v60;
          }
          if (v58 <= v56) {
            int v61 = v56;
          }
          else {
            int v61 = v58;
          }
          if (v58 >= v56) {
            int v58 = v56;
          }
          if (v61 <= v59) {
            int v56 = v59;
          }
          int *v11 = v57;
          v11[1] = v56;
          if (v61 >= v59) {
            int v62 = v59;
          }
          else {
            int v62 = v61;
          }
          v11[2] = v62;
          v11[3] = v58;
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 95) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *,int *>(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[v15 >> 1];
    if ((unint64_t)v14 >= 0x201)
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v11, &v11[v15 >> 1], a2 - 1);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v11 + 1, v17 - 1, a2 - 2);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v11 + 2, &v11[v16 + 1], a2 - 3);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v17 - 1, v17, &v11[v16 + 1]);
      int v18 = *v11;
      int *v11 = *v17;
      *uint64_t v17 = v18;
      if (a5) {
        goto LABEL_14;
      }
    }
    else
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(&v11[v15 >> 1], v11, a2 - 1);
      if (a5) {
        goto LABEL_14;
      }
    }
    if (*(v11 - 1) <= *v11)
    {
      uint64_t result = std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(v11, a2);
      int v11 = result;
      goto LABEL_19;
    }
LABEL_14:
    uint64_t v19 = std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(v11, a2);
    if ((v20 & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v21 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v11, v19);
    int v11 = v19 + 1;
    uint64_t result = (int *)std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(v19 + 1, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v19;
      if (v21) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v21)
    {
LABEL_17:
      uint64_t result = (int *)std::__introsort<std::_ClassicAlgPolicy,std::greater<int> &,int *,false>(v10, v19, a3, -v13, a5 & 1);
      int v11 = v19 + 1;
LABEL_19:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  char v63 = v11 + 1;
  BOOL v65 = v11 == a2 || v63 == a2;
  if (a5)
  {
    if (!v65)
    {
      uint64_t v66 = 0;
      int v67 = v11;
      do
      {
        int v69 = *v67;
        int v68 = v67[1];
        int v67 = v63;
        if (v68 > v69)
        {
          uint64_t v70 = v66;
          while (1)
          {
            *(int *)((char *)v11 + v70 + 4) = v69;
            if (!v70) {
              break;
            }
            int v69 = *(int *)((char *)v11 + v70 - 4);
            v70 -= 4;
            if (v68 <= v69)
            {
              int v71 = (int *)((char *)v11 + v70 + 4);
              goto LABEL_125;
            }
          }
          int v71 = v11;
LABEL_125:
          *int v71 = v68;
        }
        char v63 = v67 + 1;
        v66 += 4;
      }
      while (v67 + 1 != a2);
    }
  }
  else if (!v65)
  {
    do
    {
      int v73 = *v10;
      int v72 = v10[1];
      int v10 = v63;
      if (v72 > v73)
      {
        do
        {
          *char v63 = v73;
          int v73 = *(v63 - 2);
          --v63;
        }
        while (v72 > v73);
        *char v63 = v72;
      }
      char v63 = v10 + 1;
    }
    while (v10 + 1 != a2);
  }
  return result;
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(int *a1, int *a2, int *a3)
{
  int v3 = *a2;
  int v4 = *a1;
  int v5 = *a3;
  if (*a2 > *a1)
  {
    if (v5 > v3)
    {
      *a1 = v5;
      *a3 = v4;
      return 1;
    }
    *a1 = v3;
    *a2 = v4;
    if (*a3 <= v4) {
      return 1;
    }
    *a2 = *a3;
    *a3 = v4;
    return 2;
  }
  if (v5 > v3)
  {
    *a2 = v5;
    *a3 = v3;
    int v6 = *a1;
    if (*a2 <= *a1) {
      return 1;
    }
    *a1 = *a2;
    *a2 = v6;
    return 2;
  }
  return 0;
}

int *std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(int *a1, int *a2)
{
  int v2 = *a1;
  if (*a1 <= *(a2 - 1))
  {
    int v5 = a1 + 1;
    do
    {
      int v3 = v5;
      if (v5 >= a2) {
        break;
      }
      ++v5;
    }
    while (v2 <= *v3);
  }
  else
  {
    int v3 = a1;
    do
    {
      int v4 = v3[1];
      ++v3;
    }
    while (v2 <= v4);
  }
  if (v3 < a2)
  {
    do
      int v6 = *--a2;
    while (v2 > v6);
  }
  if (v3 < a2)
  {
    int v7 = *v3;
    int v8 = *a2;
    do
    {
      *int v3 = v8;
      *a2 = v7;
      do
      {
        int v9 = v3[1];
        ++v3;
        int v7 = v9;
      }
      while (v2 <= v9);
      do
      {
        int v10 = *--a2;
        int v8 = v10;
      }
      while (v2 > v10);
    }
    while (v3 < a2);
  }
  if (v3 - 1 != a1) {
    *a1 = *(v3 - 1);
  }
  *(v3 - 1) = v2;
  return v3;
}

int *std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,int *,std::greater<int> &>(int *a1, int *a2)
{
  uint64_t v2 = 0;
  int v3 = *a1;
  do
    int v4 = a1[++v2];
  while (v4 > v3);
  int v5 = &a1[v2];
  int v6 = &a1[v2 - 1];
  if (v2 == 1)
  {
    do
    {
      if (v5 >= a2) {
        break;
      }
      int v8 = *--a2;
    }
    while (v8 <= v3);
  }
  else
  {
    do
      int v7 = *--a2;
    while (v7 <= v3);
  }
  if (v5 < a2)
  {
    int v9 = *a2;
    int v10 = &a1[v2];
    int v11 = a2;
    do
    {
      int *v10 = v9;
      int *v11 = v4;
      do
      {
        int v12 = v10[1];
        ++v10;
        int v4 = v12;
      }
      while (v12 > v3);
      do
      {
        int v13 = *--v11;
        int v9 = v13;
      }
      while (v13 <= v3);
    }
    while (v10 < v11);
    int v6 = v10 - 1;
  }
  if (v6 != a1) {
    *a1 = *v6;
  }
  *int v6 = v3;
  return v6;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,std::greater<int> &,int *>(_DWORD *a1, int *a2)
{
  uint64_t v2 = 1;
  switch(a2 - a1)
  {
    case 0:
    case 1:
      return v2;
    case 2:
      int v3 = *(a2 - 1);
      int v4 = *a1;
      if (v3 > *a1)
      {
        *a1 = v3;
        *(a2 - 1) = v4;
      }
      return 1;
    case 3:
      int v20 = a1[1];
      int v21 = *(a2 - 1);
      if (v20 <= v21) {
        int v22 = *(a2 - 1);
      }
      else {
        int v22 = a1[1];
      }
      if (v20 >= v21) {
        int v20 = *(a2 - 1);
      }
      *(a2 - 1) = v20;
      a1[1] = v22;
      int v23 = *(a2 - 1);
      if (v23 <= *a1) {
        int v24 = *a1;
      }
      else {
        int v24 = *(a2 - 1);
      }
      if (v23 >= *a1) {
        int v23 = *a1;
      }
      *(a2 - 1) = v23;
      int v26 = *a1;
      int v25 = a1[1];
      if (v24 <= v25) {
        int v26 = a1[1];
      }
      if (v24 < v25) {
        int v25 = v24;
      }
      *a1 = v26;
      a1[1] = v25;
      return 1;
    case 4:
      int v48 = a1[1];
      int v47 = a1[2];
      if (*a1 <= v47) {
        int v49 = a1[2];
      }
      else {
        int v49 = *a1;
      }
      if (*a1 < v47) {
        int v47 = *a1;
      }
      a1[2] = v47;
      *a1 = v49;
      int v50 = *(a2 - 1);
      if (v48 <= v50) {
        int v51 = *(a2 - 1);
      }
      else {
        int v51 = v48;
      }
      if (v48 < v50) {
        int v50 = v48;
      }
      *(a2 - 1) = v50;
      int v52 = *a1;
      if (*a1 <= v51) {
        int v53 = v51;
      }
      else {
        int v53 = *a1;
      }
      if (v52 >= v51) {
        int v52 = v51;
      }
      *a1 = v53;
      a1[1] = v52;
      int v54 = a1[2];
      int v55 = *(a2 - 1);
      if (v54 <= v55) {
        int v56 = *(a2 - 1);
      }
      else {
        int v56 = a1[2];
      }
      if (v54 >= v55) {
        int v54 = *(a2 - 1);
      }
      *(a2 - 1) = v54;
      int v57 = a1[1];
      if (v57 <= v56) {
        int v58 = v56;
      }
      else {
        int v58 = a1[1];
      }
      if (v57 >= v56) {
        int v57 = v56;
      }
      a1[1] = v58;
      a1[2] = v57;
      return 1;
    case 5:
      int v27 = *a1;
      int v28 = a1[1];
      if (*a1 <= v28) {
        int v29 = a1[1];
      }
      else {
        int v29 = *a1;
      }
      if (v27 >= v28) {
        int v27 = a1[1];
      }
      *a1 = v29;
      a1[1] = v27;
      int v30 = a1[3];
      int v31 = *(a2 - 1);
      if (v30 <= v31) {
        int v32 = *(a2 - 1);
      }
      else {
        int v32 = a1[3];
      }
      if (v30 >= v31) {
        int v30 = *(a2 - 1);
      }
      *(a2 - 1) = v30;
      a1[3] = v32;
      int v33 = *(a2 - 1);
      int v34 = a1[2];
      if (v33 <= v34) {
        int v35 = a1[2];
      }
      else {
        int v35 = *(a2 - 1);
      }
      if (v33 >= v34) {
        int v33 = a1[2];
      }
      *(a2 - 1) = v33;
      int v37 = a1[2];
      int v36 = a1[3];
      int v38 = a1[1];
      if (v35 <= v36) {
        int v37 = a1[3];
      }
      if (v35 < v36) {
        int v36 = v35;
      }
      a1[2] = v37;
      a1[3] = v36;
      int v39 = *(a2 - 1);
      if (v38 <= v39) {
        int v40 = *(a2 - 1);
      }
      else {
        int v40 = v38;
      }
      if (v38 < v39) {
        int v39 = v38;
      }
      *(a2 - 1) = v39;
      int v41 = *a1;
      int v43 = a1[2];
      int v42 = a1[3];
      if (v42 <= *a1) {
        int v44 = *a1;
      }
      else {
        int v44 = a1[3];
      }
      if (v42 >= v41) {
        int v42 = *a1;
      }
      if (v44 <= v43) {
        int v41 = a1[2];
      }
      if (v44 < v43) {
        int v43 = v44;
      }
      if (v42 <= v40) {
        int v45 = v40;
      }
      else {
        int v45 = v42;
      }
      if (v42 >= v40) {
        int v42 = v40;
      }
      if (v45 <= v43) {
        int v40 = v43;
      }
      *a1 = v41;
      a1[1] = v40;
      if (v45 >= v43) {
        int v46 = v43;
      }
      else {
        int v46 = v45;
      }
      a1[2] = v46;
      a1[3] = v42;
      return 1;
    default:
      int v6 = a1 + 2;
      int v5 = a1[2];
      int v8 = *a1;
      int v7 = a1[1];
      if (v7 <= v5) {
        int v9 = a1[2];
      }
      else {
        int v9 = a1[1];
      }
      if (v7 < v5) {
        int v5 = a1[1];
      }
      if (v5 <= v8) {
        int v10 = *a1;
      }
      else {
        int v10 = v5;
      }
      if (v5 >= v8) {
        int v5 = *a1;
      }
      *int v6 = v5;
      if (v10 <= v9) {
        int v11 = v9;
      }
      else {
        int v11 = v8;
      }
      if (v10 >= v9) {
        int v10 = v9;
      }
      *a1 = v11;
      a1[1] = v10;
      int v12 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      int v13 = 0;
      uint64_t v14 = 12;
      break;
  }
  while (1)
  {
    int v15 = *v12;
    int v16 = *v6;
    if (*v12 > v16)
    {
      uint64_t v17 = v14;
      while (1)
      {
        *(_DWORD *)((char *)a1 + v17) = v16;
        uint64_t v18 = v17 - 4;
        if (v17 == 4) {
          break;
        }
        int v16 = *(_DWORD *)((char *)a1 + v17 - 8);
        v17 -= 4;
        if (v15 <= v16)
        {
          uint64_t v19 = (_DWORD *)((char *)a1 + v18);
          goto LABEL_27;
        }
      }
      uint64_t v19 = a1;
LABEL_27:
      *uint64_t v19 = v15;
      if (++v13 == 8) {
        return v12 + 1 == a2;
      }
    }
    int v6 = v12;
    v14 += 4;
    if (++v12 == a2) {
      return 1;
    }
  }
}

uint64_t std::deque<int>::~deque[abi:nn180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  int v3 = (void **)a1[2];
  unint64_t v4 = (char *)v3 - (char *)v2;
  if (v3 == v2)
  {
    int v5 = a1 + 5;
  }
  else
  {
    int v5 = a1 + 5;
    unint64_t v6 = a1[4];
    int v7 = &v2[v6 >> 10];
    uint64_t v8 = (uint64_t)*v7;
    uint64_t v9 = (uint64_t)*v7 + 4 * (v6 & 0x3FF);
    while ((void *)v9 != *(char **)((char *)v2 + (((a1[5] + v6) >> 7) & 0x1FFFFFFFFFFFFF8))
                        + 4 * ((a1[5] + v6) & 0x3FF))
    {
      v9 += 4;
      if (v9 - v8 == 4096)
      {
        uint64_t v10 = (uint64_t)v7[1];
        ++v7;
        uint64_t v8 = v10;
        uint64_t v9 = v10;
      }
    }
  }
  *int v5 = 0;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      int v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v11 = v4 >> 3;
  if (v11 == 1)
  {
    uint64_t v12 = 512;
  }
  else
  {
    if (v11 != 2) {
      goto LABEL_15;
    }
    uint64_t v12 = 1024;
  }
  a1[4] = v12;
LABEL_15:
  while (v2 != v3)
  {
    int v13 = *v2++;
    operator delete(v13);
  }

  return std::__split_buffer<int *>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<int *>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

void std::vector<AnimCodec::ArithmeticContext>::__append(char **a1, unint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int v5 = v6;
  int v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_20B5F0CC0, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    uint64_t v10 = a2 + (v9 >> 1);
    if (v10 < 0) {
      abort();
    }
    uint64_t v11 = v9 >> 1;
    unint64_t v12 = v5 - v8;
    if (v12 > v10) {
      uint64_t v10 = v12;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(v4, v13);
      uint64_t v8 = *a1;
      int v7 = a1[1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    int v15 = &v14[2 * v11];
    int v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_20B5F0CC0, 2 * a2);
    uint64_t v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      __int16 v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void AnimCodec::AnimDecoder::getInfo()
{
  __assert_rtn("getInfo", "AnimDecoder.cpp", 47, "headerSizeInBytes == HeaderSizeInBytes");
}

void AnimCodec::StaticAdjacencyInformation::neighborsStartIndex()
{
}

void AnimCodec::StaticAdjacencyInformation::neighborsEndIndex()
{
}

void AnimCodec::StaticAdjacencyInformation::incrementNeighborCount()
{
}

void AnimCodec::StaticAdjacencyInformation::addNeighbor()
{
}

void AnimCodec::StaticAdjacencyInformation::maxNeighborCount()
{
}

uint64_t AnimCodec::AnimEncoder::compress(uint64_t a1, AnimCodec *this, int *a3, uint64_t a4, uint64_t a5, int *a6, AnimCodec::StaticAdjacencyInformation *a7, int a8, uint64_t a9, uint64_t a10, unint64_t a11, uint64_t *a12, _DWORD *a13)
{
  uint64_t v13 = 2;
  if (a5 && a6 && a9)
  {
    int v14 = a5;
    if (4 * a5 * (uint64_t)a6 * a9 + 1024 >= a11 && HIDWORD(a11) == 0)
    {
      uint64_t v21 = 0;
      memset(v20, 0, sizeof(v20));
      memset(&__p, 0, sizeof(__p));
      uint64_t v13 = AnimCodec::ComputeAdjacencyInfo(this, a3, a6, (int)a7, a8, (std::vector<unsigned int> *)v20, a7);
      if (!v13)
      {
        uint64_t v13 = AnimCodec::ComputeTraversalOrder((AnimCodec::StaticAdjacencyInformation *)v20, &__p);
        if (!v13) {
          uint64_t v13 = AnimCodec::AnimEncoder::compress(a1, a4, (AnimCodec::StaticAdjacencyInformation *)v20, &__p, v14, a9, a10, a11, a12, a13);
        }
      }
      if (__p.__begin_)
      {
        __p.__end_ = __p.__begin_;
        operator delete(__p.__begin_);
      }
      vmesh::StaticAdjacencyInformation<Pair>::~StaticAdjacencyInformation((uint64_t)v20);
    }
    else
    {
      return 1;
    }
  }
  return v13;
}

uint64_t AnimCodec::AnimEncoder::compress(uint64_t a1, uint64_t a2, AnimCodec::StaticAdjacencyInformation *a3, void *a4, int a5, int a6, uint64_t a7, unint64_t a8, uint64_t *a9, _DWORD *a10)
{
  v15[0] = a7;
  v15[1] = a8;
  *(_DWORD *)a7 = 179426549;
  *(_DWORD *)(a7 + 8) = 1;
  *(_DWORD *)(a7 + 16) = a6;
  *(unsigned char *)(a7 + 20) = *a10;
  *(unsigned char *)(a7 + 21) = a10[1];
  *(_WORD *)(a7 + 22) = 0;
  uint64_t v16 = 24;
  uint64_t result = AnimCodec::AnimEncoder::compress(a1, a2, a3, a4, a5, a6, (uint64_t)v15);
  if (!result)
  {
    unint64_t v12 = v16;
    *a9 = v16;
    if (v12 <= a8)
    {
      uint64_t v13 = v15[0];
      *(_DWORD *)(v15[0] + 12) = v12;
      int v14 = AnimCodec::ComputeCRC32(v13 + 8, (const unsigned __int8 *)(*a9 - 8));
      uint64_t result = 0;
      *(_DWORD *)(v13 + 4) = v14;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t AnimCodec::AnimEncoder::compress(uint64_t a1, uint64_t a2, AnimCodec::StaticAdjacencyInformation *a3, void *a4, int a5, int a6, uint64_t a7)
{
  uint64_t v7 = a7;
  uint64_t v12 = *(void *)(a7 + 16);
  int v13 = *(_DWORD *)(a7 + 8) - v12;
  uint64_t v14 = *(void *)a7 + v12;
  int v79 = v13;
  uint64_t v80 = v14;
  AnimCodec::ArithmeticEncoder::start((uint64_t)&v79);
  unint64_t v15 = *((void *)a3 + 4) - *((void *)a3 + 3);
  if ((int)(v15 >> 2) < 1) {
    return 2;
  }
  unint64_t v59 = v15 >> 2;
  __int16 v78 = 0x8000;
  uint64_t v75 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  int v72 = 0;
  int v73 = 0;
  uint64_t v74 = 0;
  int v69 = 0;
  uint64_t v70 = 0;
  uint64_t v71 = 0;
  std::vector<unsigned int> __p = 0;
  int v67 = 0;
  uint64_t v68 = 0;
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v75, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v72, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&v69, a5);
  std::vector<AnimCodec::ArithmeticContext>::resize((uint64_t)&__p, 31 * a5);
  memset(&v65, 0, sizeof(v65));
  memset(&v64, 0, sizeof(v64));
  memset(&v63, 0, sizeof(v63));
  std::vector<int>::resize(&v65, a5);
  std::vector<int>::resize(&v64, a5);
  std::vector<int>::resize(&v63, a5);
  if (a6 < 1)
  {
LABEL_41:
    uint64_t v54 = 0;
    *(void *)(v7 + 16) += AnimCodec::ArithmeticEncoder::stop((AnimCodec::ArithmeticEncoder *)&v79);
  }
  else
  {
    uint64_t v57 = v7;
    uint64_t v58 = 0;
    uint64_t v60 = (v15 >> 2);
    int v61 = a3;
    uint64_t v16 = a5;
    uint64_t v56 = a6;
LABEL_4:
    uint64_t v17 = 0;
    char v18 = 1;
LABEL_5:
    char v19 = v18;
    int v20 = *(_DWORD *)(*a4 + 4 * v17);
    if (a5 >= 1)
    {
      std::vector<unsigned int>::pointer begin = v65.__begin_;
      std::vector<unsigned int>::pointer v22 = v64.__begin_;
      int v23 = (unsigned int *)(a2 + 4 * v20 * a5);
      uint64_t v24 = v16;
      do
      {
        unsigned int v25 = *v23++;
        *begin++ = v25;
        *v22++ = 0;
        --v24;
      }
      while (v24);
    }
    int started = AnimCodec::StaticAdjacencyInformation::neighborsStartIndex(a3, v20);
    int v27 = AnimCodec::StaticAdjacencyInformation::neighborsEndIndex(a3, v20);
    if (v27 <= started) {
      goto LABEL_21;
    }
    unsigned int v28 = 0;
    uint64_t v29 = *((void *)a3 + 6);
    std::vector<unsigned int>::pointer v30 = v64.__begin_;
    uint64_t v31 = started;
    while (1)
    {
      int v32 = *(_DWORD *)(v29 + 4 * v31);
      if (v32 < 0) {
        goto LABEL_17;
      }
      if (v32 >= (int)v59) {
        break;
      }
      if (a5 >= 1)
      {
        uint64_t v33 = 4 * v32 * a5;
        uint64_t v34 = v16;
        std::vector<unsigned int>::pointer v35 = v30;
        do
        {
          *v35++ += *(_DWORD *)(a2 + v33);
          v33 += 4;
          --v34;
        }
        while (v34);
      }
      ++v28;
      ++v31;
      if (v28 == v27 - started)
      {
        unsigned int v28 = v27 - started;
LABEL_17:
        if (v28 >= 2)
        {
          if (a5 >= 1)
          {
            std::vector<unsigned int>::pointer v36 = v64.__begin_;
            uint64_t v37 = v16;
            do
            {
              *std::vector<unsigned int>::pointer v36 = (int)(*v36 + (v28 >> 1)) / (int)v28;
              ++v36;
              --v37;
            }
            while (v37);
            goto LABEL_21;
          }
LABEL_25:
          char v18 = 1;
          goto LABEL_26;
        }
LABEL_21:
        if (a5 < 1) {
          goto LABEL_25;
        }
        std::vector<unsigned int>::pointer v38 = v65.__begin_;
        std::vector<unsigned int>::pointer v39 = v64.__begin_;
        char v18 = 1;
        uint64_t v40 = v16;
        std::vector<unsigned int>::pointer v41 = v63.__begin_;
        do
        {
          int v43 = *v38++;
          int v42 = v43;
          int v44 = *v39++;
          unsigned int v45 = v42 - v44;
          *v41++ = v45;
          v18 &= v45 == 0;
          --v40;
        }
        while (v40);
LABEL_26:
        AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v19 ^ v18) & 1, &v78);
        if ((v18 & 1) == 0 && a5 >= 1)
        {
          uint64_t v46 = 0;
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          do
          {
            unsigned int v49 = v63.__begin_[v47];
            int v50 = (char *)v69 + v46;
            if (v49)
            {
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, v50);
              int v51 = (char *)v75 + v46;
              if ((v49 & 0x80000000) != 0)
              {
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 0, v51);
                unsigned int v49 = -v49;
              }
              else
              {
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, v51);
              }
              if (v49 > 0x1F)
              {
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + v48);
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 2));
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 6));
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 14));
                AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, 1, (_WORD *)__p + (v48 + 30));
                AnimCodec::ArithmeticEncoder::encodeExpGolomb((uint64_t)&v79, v49 - 32, 6, (char *)v72 + v46);
                goto LABEL_38;
              }
              unsigned int v53 = v49 - 1;
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v49 - 1) & 1, (_WORD *)__p + v48);
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, ((v49 - 1) >> 1) & 1, (_WORD *)__p + v48 + (((_BYTE)v49 + 1) & 1) + 1);
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v53 >> 2) & 1, (_WORD *)__p + v48 + (v53 & 3) + 3);
              AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, (v53 >> 3) & 1, (_WORD *)__p + v48 + (v53 & 7) + 7);
              unsigned int v52 = (v49 - 1) >> 4;
              int v50 = (char *)__p + 2 * v48 + 2 * ((v49 - 1) & 0xF) + 30;
            }
            else
            {
              unsigned int v52 = 0;
            }
            AnimCodec::ArithmeticEncoder::encode((uint64_t)&v79, v52, v50);
LABEL_38:
            v48 += 31;
            v46 += 2;
            ++v47;
          }
          while (31 * a5 != v48);
        }
        ++v17;
        a3 = v61;
        uint64_t v16 = a5;
        if (v17 == v60)
        {
          uint64_t v7 = v57;
          a2 += 4 * (int)v59 * a5;
          if (++v58 == v56) {
            goto LABEL_41;
          }
          goto LABEL_4;
        }
        goto LABEL_5;
      }
    }
    uint64_t v54 = 2;
  }
  if (v63.__begin_)
  {
    v63.__end_ = v63.__begin_;
    operator delete(v63.__begin_);
  }
  if (v64.__begin_)
  {
    v64.__end_ = v64.__begin_;
    operator delete(v64.__begin_);
  }
  if (v65.__begin_)
  {
    v65.__end_ = v65.__begin_;
    operator delete(v65.__begin_);
  }
  if (__p)
  {
    int v67 = __p;
    operator delete(__p);
  }
  if (v69)
  {
    uint64_t v70 = v69;
    operator delete(v69);
  }
  if (v72)
  {
    int v73 = v72;
    operator delete(v72);
  }
  if (v75)
  {
    uint64_t v76 = v75;
    operator delete(v75);
  }
  return v54;
}

uint64_t AnimCodec::ArithmeticEncoder::encode(uint64_t result, int a2, _WORD *a3)
{
  unsigned int v3 = (unsigned __int16)*a3;
  int v4 = *(_DWORD *)(result + 28);
  unsigned int v5 = (v4 * v3) >> 16;
  if (a2)
  {
    *(_DWORD *)(result + 24) += v5;
    unsigned int v5 = v4 - v5;
    __int16 v6 = v3 - *(_WORD *)(result + 2 * (v3 >> 8) + 48);
  }
  else
  {
    __int16 v6 = *(_WORD *)(result + 2 * ((unsigned __int16)~(_WORD)v3 >> 8) + 48) + v3;
  }
  *(_DWORD *)(result + 28) = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    unsigned int v7 = *(_DWORD *)(result + 24);
    int v8 = *(_DWORD *)(result + 40);
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      *(_DWORD *)(result + 24) = v7;
      *(_DWORD *)(result + 28) = v5;
      *(_DWORD *)(result + 40) = ++v8;
      if (v8 == 8) {
        break;
      }
LABEL_17:
      if (v5 > 0x4000) {
        return result;
      }
    }
    if (HIBYTE(v7))
    {
      uint64_t v10 = *(void *)(result + 16) + *(void *)(result + 8);
      ++*(unsigned char *)(v10 - 1);
      uint64_t v11 = *(void *)(result + 16);
      if (*(_DWORD *)(result + 44))
      {
        do
        {
          *(unsigned char *)(*(void *)(result + 8) + v11) = 0;
          int v12 = *(_DWORD *)(result + 44);
          uint64_t v11 = *(void *)(result + 16) + 1;
          *(void *)(result + 16) = v11;
          *(_DWORD *)(result + 44) = --v12;
        }
        while (v12);
      }
    }
    else
    {
      int v9 = *(_DWORD *)(result + 44);
      if ((v7 + v5) >> 24)
      {
        *(_DWORD *)(result + 44) = v9 + 1;
LABEL_16:
        int v8 = 0;
        unsigned int v7 = (unsigned __int16)v7;
        *(_DWORD *)(result + 24) = (unsigned __int16)v7;
        *(_DWORD *)(result + 40) = 0;
        goto LABEL_17;
      }
      uint64_t v11 = *(void *)(result + 16);
      if (v9)
      {
        do
        {
          *(unsigned char *)(*(void *)(result + 8) + v11) = -1;
          int v13 = *(_DWORD *)(result + 44);
          uint64_t v11 = *(void *)(result + 16) + 1;
          *(void *)(result + 16) = v11;
          *(_DWORD *)(result + 44) = --v13;
        }
        while (v13);
      }
    }
    *(unsigned char *)(*(void *)(result + 8) + v11) = *(_WORD *)(result + 26);
    ++*(void *)(result + 16);
    LOWORD(v7) = *(_WORD *)(result + 24);
    unsigned int v5 = *(_DWORD *)(result + 28);
    goto LABEL_16;
  }
  return result;
}

uint64_t AnimCodec::ArithmeticEncoder::encodeExpGolomb(uint64_t a1, unsigned int a2, int a3, _WORD *a4)
{
  int v5 = a3;
  unsigned int v6 = a2;
  for (int i = 1 << a3; v6 >= 1 << v5; int i = 1 << v5)
  {
    AnimCodec::ArithmeticEncoder::encode(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  uint64_t result = AnimCodec::ArithmeticEncoder::encode(a1, 0, a4);
  if (v5)
  {
    int v10 = v5 - 1;
    do
    {
      __int16 v11 = 0x8000;
      uint64_t result = AnimCodec::ArithmeticEncoder::encode(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
}

unint64_t AnimCodec::ArithmeticEncoder::stop(AnimCodec::ArithmeticEncoder *this)
{
  int v1 = 0;
  int v2 = *((_DWORD *)this + 10);
  int v3 = *((_DWORD *)this + 6);
  do
  {
    if ((v3 | ((2 << v1) - 1)) > *((_DWORD *)this + 7) - 1) {
      break;
    }
    ++v1;
  }
  while (v1 != 16);
  unsigned int v4 = v3 | ~(-1 << v1);
  *((_DWORD *)this + 6) = v4;
  if (v2 <= 7)
  {
    int v5 = v2 - 8;
    do
      unsigned int v4 = (2 * v4) | 1;
    while (!__CFADD__(v5++, 1));
    *((_DWORD *)this + 6) = v4;
    *((_DWORD *)this + 10) = 8;
  }
  if (HIBYTE(v4))
  {
    uint64_t v7 = *((void *)this + 2) + *((void *)this + 1);
    ++*(unsigned char *)(v7 - 1);
    if (*((_DWORD *)this + 11))
    {
      uint64_t v8 = *((void *)this + 2);
      do
      {
        *(unsigned char *)(*((void *)this + 1) + v8) = 0;
        int v9 = *((_DWORD *)this + 11);
        uint64_t v8 = *((void *)this + 2) + 1;
        *((void *)this + 2) = v8;
        *((_DWORD *)this + 11) = --v9;
      }
      while (v9);
    }
  }
  else if (*((_DWORD *)this + 11))
  {
    uint64_t v10 = *((void *)this + 2);
    do
    {
      *(unsigned char *)(*((void *)this + 1) + v10) = -1;
      int v11 = *((_DWORD *)this + 11);
      uint64_t v10 = *((void *)this + 2) + 1;
      *((void *)this + 2) = v10;
      *((_DWORD *)this + 11) = --v11;
    }
    while (v11);
  }
  *(unsigned char *)(*((void *)this + 1) + *((void *)this + 2)) = *((_WORD *)this + 13);
  uint64_t v12 = *((void *)this + 1);
  uint64_t v13 = *((void *)this + 2) + 1;
  *((void *)this + 2) = v13;
  *(unsigned char *)(v12 + v13) = BYTE1(*((_DWORD *)this + 6));
  unint64_t v14 = *((void *)this + 2) + 1;
  *((void *)this + 2) = v14;
  if (v2 >= 1)
  {
    *(unsigned char *)(*((void *)this + 1) + v14) = *((_DWORD *)this + 6);
    unint64_t v14 = *((void *)this + 2) + 1;
    *((void *)this + 2) = v14;
  }
  if (v14 >= 2)
  {
    uint64_t v15 = *((void *)this + 1) - 1;
    while (*(unsigned __int8 *)(v15 + v14) == 255)
    {
      *((void *)this + 2) = --v14;
      if (v14 <= 1) {
        return 1;
      }
    }
  }
  return v14;
}

uint64_t AnimCodec::ArithmeticEncoder::start(uint64_t this)
{
  uint64_t v1 = 0;
  *(void *)&long long v2 = 0xFFFF00000000;
  *((void *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(this + 24) = v2;
  *(void *)(this + 16) = 0;
  *(void *)(this + 40) = 0;
  uint64_t v3 = 0x217u;
  do
  {
    *(_WORD *)(this + v1 * 2 + 48) = word_20B5F0CD8[v1];
    *(_WORD *)(this + v3 * 2) = word_20B5F0CD8[v3 - 280];
    --v3;
    ++v1;
  }
  while (v1 != 256);
  return this;
}

void *AnimCodec::ArithmeticDecoder::start(AnimCodec::ArithmeticDecoder *this)
{
  *(void *)&long long v1 = 0xFFFF000000000000;
  *((void *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)((char *)this + 24) = v1;
  *((void *)this + 5) = 16;
  unsigned int v2 = *(_DWORD *)this;
  if (*(int *)this < 1)
  {
    int v4 = -16777216;
    goto LABEL_7;
  }
  uint64_t v3 = (unsigned __int8 *)*((void *)this + 1);
  int v4 = *v3 << 24;
  *((_DWORD *)this + 8) = v4;
  if (v2 == 1)
  {
LABEL_7:
    int v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  int v5 = v4 | (v3[1] << 16);
  *((_DWORD *)this + 8) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    int v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  int v6 = v5 | (v3[2] << 8);
  *((_DWORD *)this + 8) = v6;
  if (v2 == 3)
  {
LABEL_9:
    int v7 = 255;
    goto LABEL_10;
  }
  int v7 = v3[3];
LABEL_10:
  *((_DWORD *)this + 8) = v7 | v6;
  *((void *)this + 2) = 3;
  return memcpy((char *)this + 48, &unk_20B5F0ED8, 0x400uLL);
}

uint64_t AnimCodec::ComputeCRC32(uint64_t this, const unsigned __int8 *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v2 = (unsigned __int8 *)this;
  LODWORD(this) = -1;
  do
  {
    int v3 = *v2++;
    this = (dword_20B5F12D8[v3 ^ BYTE3(this)] ^ (this << 8));
    --a2;
  }
  while (a2);
  return this;
}

void C3DShapeMeshCreationInitProfile_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  unsigned int v2 = "profilePath.points";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DMeshCreateText_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DMeshCreateTextFrame: C3DTextFrameRef object is NULL, will create NULL mesh\n", v1, 2u);
}

void Token::str()
{
}

void C3DSceneSourceGetFileFormat_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: unabled to create a read stream at %@", (uint8_t *)&v2, 0xCu);
}

void C3DSceneSourceCreateSceneAtIndex_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: failed to load %@ - unknown file format.", (uint8_t *)&v3, 0xCu);
}

void C3D::CopyTextureComputePass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. renderStartIndex is not taken into account in this pass", a5, a6, a7, a8, 2u);
}

void SCNMTLComputeCommandEncoder::dispatchOnTextureCube(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::SmartPtr<SCNMTLRenderPipeline *,C3D::detail::NSRetainFct,C3D::detail::NSReleaseFct>::operator SCNMTLRenderPipeline *(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNMTLRenderCommandEncoder::setFragmentTexture(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNMTLComputeCommandEncoder::_bindPendingTextures(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "firstIndexOfRange == UINT_MAX";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void SCNMTLRenderCommandEncoder::applyChangedStates(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ShaderConverter::Parse()
{
  __assert_rtn("Parse", "C3DShaderConverter.mm", 1258, "mpTokenizer == nullptr");
}

void __CopyParticles_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "invLifeSpanArray";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __CopyParticles_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "dstParticles != srcParticles";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3DParticleSystemInstanceDraw_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: ParticleSystem: mismatch in meshes and meshElements", v1, 2u);
}

void C3DParticleSystemInstancePushRendererElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "sequence->count + count <= sequence->allocatedCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Not enough space allocated", (uint8_t *)&v3);
}

void C3DParticleSystemInstancePushRendererElements_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sequence->count + count <= sequence->allocatedCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Not enough space allocated", a1);
}

void C3DColor4InitWithPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DColor4InitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DCGColorGetComponentsInColorSpace_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGetColorMatchingComputeKernelParameters_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Color matching for %@ → %@ could be done more efficiently by switching to a _sRGB variant of the MTLPixelFormat");
}

void C3DGetColorMatchingComputeKernelParameters_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: No conversion info for %@ → %@, texture will be copied");
}

void C3DGetColorMatchingComputeKernelParameters_cold_4()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Failed to compute color conversion parameters for %@ → %@");
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_1(int a1, uint64_t *a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  v4[0] = 67109376;
  v4[1] = a1;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Unsupported conversion info - stage %d of %d will be ignored!", (uint8_t *)v4, 0xEu);
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Unsupported conversion info - unsupported TRC type %d", (uint8_t *)v2, 8u);
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_cold_3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "trcOther == trc";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Unsupported conversion info - different TRCs for input components", buf, 0xCu);
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_29_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Unsupported conversion info - %d color matrices", (uint8_t *)v3, 8u);
}

void __C3DGetColorMatchingComputeKernelParameters_block_invoke_32_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DGeometryCFFinalize_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "!geometry->_trackedNodes || !CFSetGetCount(geometry->_trackedNodes)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. No node should be tracked anymore by the geometry %@", (uint8_t *)&v2, 0x16u);
}

void C3DGeometryGetName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DGeometryFillLibraryForSerialization_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DGeometryFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Geometry deserialization: cannot find the specified material", v2, v3, v4, v5, v6);
}

void _C3DGeometryFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Geometry deserialization: cannot find the mesh ID", v2, v3, v4, v5, v6);
}

void _C3DGeometryFinalizeDeserialization_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Geometry deserialization: cannot find the specified mesh", v2, v3, v4, v5, v6);
}

void _C3DGeometryFinalizeDeserialization_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _loadBindInfos_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Could not deserialize the property %@ in the serialized effect %@", (uint8_t *)&v3, 0x16u);
}

void C3DGeometryAppendMaterial_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryCreateCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryCopy_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryCopy_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryTrackNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryTrackNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryUntrackNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryUntrackNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryGeneratePoints_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot use volume generation on a generic mesh. fallbacking on surface", v2, v3, v4, v5, v6);
}

void C3DGeometryGeneratePoints_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot generate points : mismatch between vertices and normals count", v2, v3, v4, v5, v6);
}

void _C3DImageToMDLTexture(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20B249000, a1, a3, "Error: C3DImageToMDLTexture not supported for image 3D", v3);
}

void loadMDLAssetWithURL_cold_1()
{
  uint64_t v0 = (void *)[MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "MDLAssetLoadingOption getMDLAssetLoadingOptionDefaultUSDColorSpace()"), @"SCNModelIOPrivate.mm", 42, @"%s", dlerror());
  __break(1u);
}

void anonymous namespace'::add_corners(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "positionAttribute";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void ___ZL53getMDLAssetLoadingOptionDefaultUSDColorSpaceSymbolLocv_block_invoke_cold_1(void *a1)
{
  uint64_t v2 = (void *)[MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "void *ModelIOLibrary()"), @"SCNModelIOPrivate.mm", 41, @"%s", *a1);
  __break(1u);
}

void C3D::SSAORaytracePass::execute(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: No point of view set for tone mapping pass", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: No camera set for tone mapping pass", v1, 2u);
}

void C3DMeshElementCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementCreateByMergingElements_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DMeshElementCreateByMergingElements - merging elements with different byte per index", v2, v3, v4, v5, v6);
}

void C3DMeshElementCreateByMergingElements_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DMeshElementCreateByMergingElements - strip not supported", v2, v3, v4, v5, v6);
}

void C3DMeshElementCreateByMergingElements_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementGetIndexCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __SetIndexes_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DMeshElementSetPrimitives invalid index buffer size", v2, v3, v4, v5, v6);
}

void C3DMeshElementGetContent_cold_1(unsigned __int8 a1, int a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "channel >= 0 && channel < channelCount";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Mesh element has %d channels but channel %d was requested", (uint8_t *)&v3, 0x18u);
}

void __readIndexInBuffer_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  int v3 = "false";
  __int16 v4 = 2080;
  __int16 v5 = "__readIndexInBuffer";
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s - unsupported index size (%ld)", (uint8_t *)&v2, 0x20u);
}

void C3DMeshElementGetIndexCountWithTypeAndPrimitiveCount_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DMeshElementGetIndexCount:primitive type not handled", v2, v3, v4, v5, v6);
}

void C3DMeshElementGetChannelsDefineSameTopology_cold_1()
{
}

void C3DIndicesContentArrayEnumeratePrimitives_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIndicesContentArrayEnumeratePrimitives_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unexpected vertex count", buf, 2u);
}

void __C3DIndicesContentEnumerateTriangulatedPrimitives_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: unexpected vertex count", v2, v3, v4, v5, v6);
}

void C3DIndicesContentGetTriangleIndex_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIndicesContentEnumeratePrimitivesByEvaluatingPrimitiveRanges_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMeshElementInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh element deserialization: no faces count", v2, v3, v4, v5, v6);
}

void _C3DMeshElementInitWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh element deserialization: no mesh element type", v2, v3, v4, v5, v6);
}

void _C3DMeshElementInitWithPropertyList_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh element deserialization: no serialized indices", v2, v3, v4, v5, v6);
}

void _C3DMeshElementInitWithPropertyList_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not read the indexes", v2, v3, v4, v5, v6);
}

void _C3DMeshElementInitWithPropertyList_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh element deserialization: no bytes per index", v2, v3, v4, v5, v6);
}

void _C3DMeshElementInitWithPropertyList_cold_6(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DMeshElementInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void C3DTransformBoundingSphere_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformBoundingSphere_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MakeNormalMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __MakeNormalMatrix_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __CompareMaterials_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __CompareMaterials_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DCreateFlattenedGeometryFromNodeHierarchy_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "componentsCount!=0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. __AllocateNewSource - componentsCount is zero", a1);
}

void __CreateAndDispatchRendererElements_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "element";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _finalizeSplit_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "w == dataLength";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. _createSubSource - inconsistent data length", a1);
}

void _finalizeSplit_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _finalizeSplit_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "oldIndexToNewIndex[sourceIndex]";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. inconsistency in _finalizeSplit", a1);
}

void C3DVRAMResourceGetID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DVRAMResourceSetID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshCreateWithMeshSourcesAndMeshElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshCreateByMergingMeshes_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Unsupported element type in C3DMeshCreateByMergingMeshes", a1);
}

void C3DMeshSubdivide_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "D!=-1 && E!=-1 && F !=-1";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. inconsistency (2) in C3DMeshSubdivide", a1);
}

void C3DMeshSubdivide_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DMeshSubdivide inconsistency", buf, 2u);
}

void __TransformAndAppendMeshSource_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSourceAccessorCopyDataToAccessor failed", v2, v3, v4, v5, v6);
}

void __C3DWarmupGeometryVRAMResourcesForEngineContext_block_invoke_2_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: WARNING: NULL data in mesh source (warming geometry)", buf, 2u);
}

void C3DWarmupSceneVRAMResourcesForEngineContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateTangentsWithGeometryOptimized_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: invalid geometry detected - skip C3DCreateTangentsWithGeometryOptimized", v2, v3, v4, v5, v6);
}

void C3DCreateTangentsWithGeometryOptimized_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot generate valid tangents without valid normals", v2, v3, v4, v5, v6);
}

void C3DCreateTangentsWithGeometryOptimized_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot generate valid tangents without valid texture coordinates", v2, v3, v4, v5, v6);
}

void C3DCreateTangentsWithGeometryOptimized_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot generate tangents without valid positions", v2, v3, v4, v5, v6);
}

void C3DCreateTangentsWithGeometryOptimized_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateTangentsWithGeometryOptimized_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateTangentsWithGeometryOptimized_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateTangentsWithGeometryOptimized_cold_8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateTangentsWithGeometry_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateTangentsWithGeometry_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateNormalsForMorphTargetWithBaseMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateNormalsForMorphTargetWithBaseMesh_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshUnifyNormals_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: target mesh has a different number of vertices (%d != %d)", (uint8_t *)v3, 0xEu);
}

void C3DMeshCreateTangentsIfNeeded_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot generate tangents without positions", v2, v3, v4, v5, v6);
}

void C3DMeshCreateTangentsIfNeeded_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: error in C3DMeshCreateTangentsIfNeeded", v2, v3, v4, v5, v6);
}

void C3DMeshCreateTangentsIfNeeded_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot generate tangents without texture coordinates", v2, v3, v4, v5, v6);
}

void C3DNodeGetProjectionInfos_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAdjustZRangeOfProjectionInfos_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: C3DAdjustZRangeOfProjectionInfos - no root node", v2, v3, v4, v5, v6);
}

void C3DAdjustZRangeOfProjectionInfos_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: C3DAdjustZRangeOfProjectionInfos - no world matrix", v2, v3, v4, v5, v6);
}

void C3DAdjustZRangeOfProjectionInfos_cold_3(os_log_t log, float a2, double a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = 136315650;
  uint64_t v4 = "shortestPosition <= farthestPosition";
  __int16 v5 = 2048;
  double v6 = a3;
  __int16 v7 = 2048;
  double v8 = a2;
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. We badly computed zFar (%f) and zNear (%f) in this scene", (uint8_t *)&v3, 0x20u);
}

void C3DAdjustZRangeOfProjectionInfos_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: C3DAdjustZRangeOfProjectionInfos - no scene or no point of view", v2, v3, v4, v5, v6);
}

void C3DMeshElementCreateIntervalList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Given sources must be of the same length for interval list creation", v2, v3, v4, v5, v6);
}

void __MergeRendererElementsSharingSameMaterial_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "material == elt->material";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. different material!!!!", a1);
}

void ___unifyNormalsOptimized_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::DeferredShadowPass::compile(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: DeferredShadowPass Setup - no light", v1, 2u);
}

void C3D::DeferredShadowPass::execute(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _willExecuteDeferredShadows - no light", v1, 2u);
}

void C3DHitTestResultGetNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DHitTestResultGetTextureCoordinates_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementGetPrimitiveGroupBoundingBoxes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIndicesContentGetTriangleIndex_cold_1_0(unsigned __int8 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid bytes per index (%d)", (uint8_t *)v3, 8u);
}

void __ProcessTriangleRange_Mask_Ind16VrtFloat3CullBack_cold_1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "ctx->_currentIndicesContent.indicesOffset == 0 && ctx->_currentIndicesContent.indicesStride == 1";
  __int16 v3 = 2080;
  uint64_t v4 = "__ProcessTriangleRange_Mask_Ind16VrtFloat3CullBack";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Update %s to support mesh element channels", (uint8_t *)&v1, 0x16u);
}

void __ProcessTriangleRange_Ind16VrtFloat3CullBack_cold_1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "ctx->_currentIndicesContent.indicesOffset == 0 && ctx->_currentIndicesContent.indicesStride == 1";
  __int16 v3 = 2080;
  uint64_t v4 = "__ProcessTriangleRange_Ind16VrtFloat3CullBack";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Update %s to support mesh element channels", (uint8_t *)&v1, 0x16u);
}

void __ProcessSkinnedGeometryForJointIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSceneCreateHitTestResultsWithSegment_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSceneCreateHitTestResultsWithSegment_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DListGetLastLinkableObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DListRemoveLinkableObject_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: inconsistency in lru list (2)", v1, 2u);
}

void C3DListRemoveLinkableObject_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: inconsistency in lru list", v1, 2u);
}

void __scn_default_log_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_20B249000, log, OS_LOG_TYPE_DEBUG, "Welcome to SceneKit 603.200 (Nov 10 2024 03:16:05)", v1, 2u);
}

void SCNMTLComputeCommandEncoder::endEncoding(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "_encoder != nil";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3D::SmartPtr<SCNMTLComputePipeline *,C3D::detail::NSRetainFct,C3D::detail::NSReleaseFct>::operator SCNMTLComputePipeline *(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "_ptr != NULL";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Dereferencing null pointer", (uint8_t *)&v3);
}

void C3DNodeIterateTree_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "callbacks";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DNodeIterateTree : no callbacks", (uint8_t *)&v1, 0xCu);
}

void C3DNodeIterateTree_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "node";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DNodeIterateTree : null node", (uint8_t *)&v1, 0xCu);
}

void C3DPlaneMakeWithVectors_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DPlaneMakeWithVectors_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DPlaneMakeWithVectors_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueCreateFloor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueCreateFloor_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _willExecuteRenderFloor(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __computeFloorOpacity(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCreateCopy_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: object %@ doesn't conform to the copying protocol", (uint8_t *)&v2, 0xCu);
}

void C3DRemoveSceneRef_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: invalid ref count for entity %@", (uint8_t *)&v2, 0xCu);
}

void C3DGetScene_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::ShadowMapPass::ShadowMapPass(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. ShadowMapPass::setup() - Light missing from light node", a5, a6, a7, a8, 2u);
}

void C3DSphereMake_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DStackCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DStackPop_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DStackSetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DStackGetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _createConstraintFromDefinition(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "jointDef->bodyA";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNMTLComputeCommandEncoder::dispatchOnGrid1D(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "_computePipelineState";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNMTLBlitCommandEncoder::beginEncoding(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void SCNMTLBlitCommandEncoder::endEncoding(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::FinalPass::setup(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Authoring pass can't find input depth pass.", v1, 2u);
}

void C3D::FinalPass::setup(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3D::FinalPass::_createCustomTechniquePassesIfNeeded(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: C3DEngineContextRenderTechnique - unknown draw instruction", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: Unsupported draw instruction kC3DFXDrawGeometry", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: Unsupported draw instruction kC3DFXDrawMetalCustom", v4);
}

void C3D::FinalPass::_createCustomTechniquePassesIfNeeded(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3D::FinalPass::_setupTechniquePassCommonData(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Unreachable code: Invalid semantic for attachment id", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Unreachable code: Invalid render buffer type for attachment id", v4);
}

{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Unreachable code: Invalid render buffer type for attachment type", v4);
}

void C3D::FinalPass::_setupTechniquePassCommonData(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "param.name";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inputIndex < passOutput.size()";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Render target not found", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "attachmentID < fboDesc->colorsDescriptionCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. attachementID out of bounds", a1);
}

void C3D::Array<C3D::Pass *,0u,C3D::StackAllocator>::Array(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::Hash<C3D::FinalPass::RenderTarget,C3D::StackAllocator>::_allocate()
{
  __assert_rtn("_allocate", "C3DHash.hpp", 268, "(new_size & (new_size - 1)) == 0");
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "!isnan(t)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. bad time", buf, 0xCu);
}

void C3DAnimationClusterCreateWithAnimationGroup_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getAnimations_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "CFGetTypeID(animation) == C3DKeyframedAnimationGetTypeID()";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. unexpected animation class", buf, 0xCu);
}

void _getNextKeyTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationClusterCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationClusterCopy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingSystemAdd_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingSystemUpdateBoundingBox_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: invalid spatial handle (%d) given", (uint8_t *)v2, 8u);
}

void C3DCullingSystemUpdateFlags_cold_1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. invalid spatial handle (%d) given", v2, v3, v4, v5, 2u);
}

void __C3DCullingSystem::remove(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DCullingSystem::remove()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. invalid spatial handle (%d) given", v2, v3, v4, v5, 2u);
}

void C3DCullingSystem_AABBRange_x8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t C3D::RenderGraphResourceManager::set(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

void C3DMeshSourceCreateWithData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateWithData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateWithAccessor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateDeltaSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateDeltaSource_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateDeltaSource_cold_3(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Morph: target vertex count do not match base vertex count (%d != %d)", (uint8_t *)v3, 0xEu);
}

void C3DMeshSourceCreateAbsoluteSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreatePackedCopy_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: MeshSource packing only supports non interleaved float sources", v2, v3, v4, v5, v6);
}

void C3DMeshSourceCreatePackedCopy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreatePackedCopy_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateUnpackedCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateCopyWithComponentsBaseType_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Conversion of an interleaved source is not supported, please convert your sources before interleaving", v2, v3, v4, v5, v6);
}

void C3DMeshSourceCreateCopyWithComponentsBaseType_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DMeshSourceCreateCopyWithComponentsBaseType: unsupported type", buf, 2u);
}

void C3DMeshSourceCreateCopyWithComponentsBaseType_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Conversion from other types than float is not supported", v2, v3, v4, v5, v6);
}

void C3DMeshSourceCreateCopyWithBaseType_cold_1(__int16 a1, __int16 a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138412546;
  uint8_t v6 = C3DBaseTypeStringDescription(a1);
  __int16 v7 = 2112;
  double v8 = C3DBaseTypeStringDescription(a2);
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: Conversion from %@ to %@ to is not supported", (uint8_t *)&v5, 0x16u);
}

void _C3DMeshSourceInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: no meshSource deserialize => semantic in mesh source", v2, v3, v4, v5, v6);
}

void _C3DMeshSourceInitWithPropertyList_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DMeshSourceInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void _C3DMeshSourceCopyPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DMeshSourceCopyPropertyList unsupported semantic", v2, v3, v4, v5, v6);
}

void C3D::CopyProbeFromOldTextureToNewTexture(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "!newIndex && !oldIndex";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Cube conversion can only happen for global probe", (uint8_t *)&v3);
}

void C3D::ComputeProbeFromTextureOrPreviousPass(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "customEnvResource";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3D::Array<unsigned int,0u,C3D::MallocAllocator>::operator[]()
{
  int v2 = 136315906;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_2_2(&dword_20B249000, v0, v1, "Assertion '%s' failed. Out of bound Array:%p access %d size %d", v2, v3, v4, v5);
}

void __CreateProbeArrayResourceIfNeeded_block_invoke_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "probeIndex != (uint32_t)kProbeSliceIndexInvalid";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Bad index", a1);
}

void __CreateProbeArrayResourceIfNeeded_block_invoke_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DLightGetProbeType(light) == kC3DLightProbeTypeRadiance";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Wrong probe type", a1);
}

void _configureStageInputOutputDescriptorWithDeformerFunction()
{
}

void _C3DAnimationManagerAddAnimationNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerAddAnimationNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerAddAnimationNode_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerAddAnimationNode_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DAnimationManagerAddAnimationNodeToAnimationStackWithKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DAnimationManagerAddAnimationNodeToAnimationStackWithKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DAnimationManagerAddAnimationNodeToAnimationStackWithKey_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationManagerTriggerCallbacks_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerGetAnimationNodeForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerGetAnimationNodeForKey_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerDiscardAnimationNodeFromStack_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerDiscardAnimationNodeFromStack_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerDiscardAnimationNodeFromStack_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationManagerSetSystemTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerUpdateConstantCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerApplyStack_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "manager";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void _C3DAnimationManagerApplyStack_cold_2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "stackItem->_modelValueItem";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DAnimationManagerNeedsRedraw_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerGetAnimationPerKeyDictionaryForObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationManagerAddAnimationForKey_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationManagerSetModelValueStorage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationManagerAddBinding_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  C3DEntityGetName(a1);
  OUTLINED_FUNCTION_1_3();
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: Binding: Unable to resolve destination keypath: %@(%@)", v5, 0x16u);
}

void C3DAnimationManagerAddBinding_cold_2()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1_3();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_20B249000, v1, OS_LOG_TYPE_ERROR, "Error: Binding: Unable to resolve destination keypath: %@(%@)", v2, 0x16u);
}

void _commonAncessor_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _resolveAnimationGroupTargets - can't find common ancessor", v1, 2u);
}

void C3DAnimationManagerRemoveAnimationNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationManagerRemoveAnimationNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DPreviousKeyFrameIndexForTime_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "middle >= 0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. _C3DPreviousKeyIndexForTime - unexpected integer division", a1);
}

void _C3DKeyframeControllerSetupWithCapacity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DKeyframeControllerSetupWithCapacity_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframeControllerSetKeyframeAtIndex_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DKeyframeControllerRef - index out of bounds", v2, v3, v4, v5, v6);
}

void C3DKeyframeControllerSetKeyframeAtIndex_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DKeyframeControllerSetKeyframeAtIndex - time is NaN", v2, v3, v4, v5, v6);
}

void C3DKeyframeControllerSetKeyframeAtIndex_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframeControllerEvaluateAtTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframeControllerEvaluateAtTime_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframeControllerEvaluateAtTime_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DKeyframeControllerInitWithPropertyList_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _C3DKeyframeControllerCreateKeyframeArray unknown key type", buf, 2u);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "CFGetTypeID(value) == CFNumberGetTypeID()";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. _C3DKeyframeControllerFlattenKeyframeData bad value type", a1);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_4(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "CFGetTypeID(value) == CFBooleanGetTypeID()";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. _C3DKeyframeControllerFlattenKeyframeData bad value type", a1);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _C3DKeyframeControllerFlattenKeyframeData unexpected value", buf, 2u);
}

void _C3DKeyframeControllerInitWithPropertyList_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DKeyframeControllerInitWithPropertyList_cold_10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DKeyframeControllerInitWithPropertyList_cold_12()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: failed to deserialize animation data", v2, v3, v4, v5, v6);
}

void SCNMTLComputeCommandEncoder::beginEncoding(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderGraph::addDependency(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LOWORD(v3) = 1024;
  HIWORD(v3) = a2;
  OUTLINED_FUNCTION_6(&dword_20B249000, a2, a3, "Error: Output buffer parameters for port %d isn't compatible with input port %d\n", 67109376, v3);
}

void C3D::RenderGraph::addDependency(uint64_t a1, void (****a2)(void))
{
  OUTLINED_FUNCTION_8();
  (*v3)();
  (***a2)();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v4, v5, "Error: Can't add dependency %s on %s\n", v6, v7, v8, v9, 2u);
}

void C3D::RenderGraph::addDependency()
{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 251, "n2Port == kPartialDependencyPort || node2.pass->descriptor().outputCount() > n2Port");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 250, "n1Port == kPartialDependencyPort || node1.pass->descriptor().inputCount() > n1Port");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 245, "_renderGraph->size() > n2");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 244, "_renderGraph->size() > n1");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 276, "a->identifier() != kInvalidPass");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 277, "b->identifier() != kInvalidPass");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 284, "(*_renderGraph).size() > n2");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 283, "(*_renderGraph).size() > n1");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 311, "a->identifier() != kInvalidPass");
}

{
  __assert_rtn("addDependency", "C3DRenderGraph.mm", 312, "b->identifier() != kInvalidPass");
}

void C3D::RenderGraph::removeInvalidPasses(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_3(a1, a2);
  uint64_t v4 = (*v3)(v2);
  OUTLINED_FUNCTION_11(v4, 4.8149e-34);
  OUTLINED_FUNCTION_5(&dword_20B249000, v5, v6, "Error: Pass %s is not linked to the rendering graph and will be ignored check it's input/output");
}

void C3D::RenderGraph::sort()
{
}

{
  void (**v0)(void);
  void (**v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  (*v0)();
  OUTLINED_FUNCTION_8();
  (*v1)();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: ** Cycle detected ** involving pass %s and input pass %s", v4, v5, v6, v7, 2u);
}

void C3D::RenderGraph::sort(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderGraph::resolvePartialCompatibility(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inputParam.type == outputParam->type";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Can't dispatchToOutput to output of different type", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "strlen(inputParam.name) != 0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Can't dispatch input to output with multiple output without a named input.", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid pass", a1);
}

void C3D::RenderGraph::resolvePartialCompatibility(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = scn_default_log();
  os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
  uint64_t v5 = *a2;
  *(_DWORD *)a1 = 136315394;
  *(void *)(a1 + 4) = "outputParam";
  *(_WORD *)(a1 + 12) = 2080;
  *(void *)(a1 + 14) = v5;
  OUTLINED_FUNCTION_14(&dword_20B249000, v6, v7, "Assertion '%s' failed. Can't dispatch input to output, unable to find output named %s.");
  __break(1u);
}

void C3D::RenderGraph::resolvePartialCompatibility(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_3(a1, a2);
  uint64_t v4 = (*v3)(v2);
  OUTLINED_FUNCTION_11(v4, 4.8149e-34);
  OUTLINED_FUNCTION_5(&dword_20B249000, v5, v6, "Error: ReadWrite pass %s can't be the present on first stage since it will load it's input.");
}

void C3D::RenderGraph::validate(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Unresolved dependency", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Incompatible passes", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "false";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid pass parameter", a1);
}

void C3D::RenderGraph::validate(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = OUTLINED_FUNCTION_2_3(a1, a2);
  uint64_t v4 = (*v3)(v2);
  OUTLINED_FUNCTION_11(v4, 4.8149e-34);
  OUTLINED_FUNCTION_5(&dword_20B249000, v5, v6, "Error: Invalid input parameter for pass %s");
}

{
  uint64_t v2;
  uint64_t (**v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v2 = OUTLINED_FUNCTION_2_3(a1, a2);
  uint64_t v4 = (*v3)(v2);
  OUTLINED_FUNCTION_11(v4, 4.8149e-34);
  OUTLINED_FUNCTION_5(&dword_20B249000, v5, v6, "Error: Invalid output parameter for pass %s");
}

{
  uint64_t v2;
  uint64_t (**v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  uint64_t v2 = OUTLINED_FUNCTION_2_3(a1, a2);
  uint64_t v4 = (*v3)(v2);
  OUTLINED_FUNCTION_11(v4, 4.8149e-34);
  OUTLINED_FUNCTION_5(&dword_20B249000, v5, v6, "Error: ReadWrite pass %s must have compatible input/output.");
}

void C3D::RenderGraph::allocateResources(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->texture";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid resource, texture is NULL", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->poolSubBuffer.buffer";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid resource, buffer is NULL", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "res->usedCount >= 0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid used count for pass internal resource", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "inputRes";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "resDestination == outputRes";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. node output resource should match destination node input resource", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "node.resource().outputCount() == node.descriptor().outputCount()";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Pass output resources should be allocated", a1);
}

void C3D::RenderGraph::allocateResources()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: ", v2, v3, v4, v5, v6);
}

void C3D::RenderGraph::allocateResources(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 8);
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2080;
  uint64_t v6 = v3;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Resource allocated for output index %d:%s but resource is tagged as \"used internally\"", (uint8_t *)v4, 0x12u);
}

void C3D::__setupRenderEncoder(uint64_t a1, unsigned __int16 *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_8();
  uint64_t v6 = (*v5)();
  int v7 = *a2;
  int v8 = 136315650;
  uint64_t v9 = "simd_all(viewport != -1)";
  __int16 v10 = 2080;
  uint64_t v11 = v6;
  __int16 v12 = 1024;
  int v13 = v7;
  _os_log_fault_impl(&dword_20B249000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Pass %s has specific viewport but it's not specified for index : %d", (uint8_t *)&v8, 0x1Cu);
}

void C3D::__setupRenderEncoder()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Layered rendering is lacking a multiple output vertex streams generator", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Multi-viewport rendering is lacking a multiple output vertex streams generator", v2, v3, v4, v5, v6);
}

void SCNMTLRenderCommandEncoder::setVertexAmplificationCount()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Vertex amplification shouldn't be active", v2, v3, v4, v5, v6);
}

void C3D::__renderSlice(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "nextInput.textureDesc.sampleCount != 1";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid sample count", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "output.textureDesc.sampleCount != 1";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Invalid sample count", a1);
}

void C3D::__renderSlice(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 1;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid buffer type: %hhu", buf, 8u);
}

void SCNMTLRenderCommandEncoder::useCommandEncoder(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void SCNMTLRenderCommandEncoder::endEncoding(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderGraph::execute(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "outputResource->type == output.type";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Mismatch between resource type and resource description type, forgot useInternally ?", a1);
}

void C3D::RenderGraph::addPass()
{
}

void C3D::RenderGraph::addPass(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderGraph::createResource(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Depth resolve texture type must not be multisampled", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Depth resolved texture must have sample count 0 or 1", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Texture pool allocator failed, texture is NULL", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Texture pool allocator failed, texture is NULL", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Only color attachement can use drawable texture", a5, a6, a7, a8, 2u);
}

void C3D::Array<C3D::RefCountedResource,0u,C3D::ScratchAllocator>::back(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::Array<C3D::RenderGraph::Link,0u,C3D::ScratchAllocator>::operator=(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Array capacity inconsistency", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. NULL allocator", a5, a6, a7, a8, 2u);
}

void C3D::Array<C3D::RenderGraph::GraphNode *,0u,C3D::StackAllocator>::pop_back(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderGraph::spriteKitTransitionEnd(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderGraph::logDependencyInputMismatch(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Buffers have different length %lu <-> %lu", (uint8_t *)&v5, 0x16u);
}

void C3D::RenderGraph::logDependencyInputMismatch()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: Texture mipmap count mismatch %d <-> %d", v2, v3);
}

{
  unsigned __int16 *v0;
  unsigned __int16 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  SCNMTLPixelFormatToString(*v1);
  SCNMTLPixelFormatToString(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: Texture pixel format mismatch %@ <-> %@", v4, v5, v6, v7, v8);
}

{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  SCNMTLCPUCacheModeToString(*v1);
  SCNMTLCPUCacheModeToString(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: Texture CPU cache mode mismatch %@ <-> %@", v4, v5, v6, v7, v8);
}

{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  SCNMTLStorageModeToString(*v1);
  SCNMTLStorageModeToString(*v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: Texture storage mode mismatch %@ <-> %@", v4, v5, v6, v7, v8);
}

{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  SCNMTLTextureTypeToString(v1);
  SCNMTLTextureTypeToString(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: Texture type mismatch %@ <-> %@", v4, v5, v6, v7, v8);
}

{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_9();
  SCNMTLTextureTypeToString(v1);
  SCNMTLTextureTypeToString(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: Texture type mismatch %@ <-> %@", v4, v5, v6, v7, v8);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: Texture depth mismatch %hu <-> %hu", v2, v3);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: Texture height mismatch %hu <-> %hu", v2, v3);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  OUTLINED_FUNCTION_13(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: Texture width mismatch %hu <-> %hu", v2, v3);
}

{
  unsigned __int8 *v0;
  unsigned __int8 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9();
  C3D::ResourceTypeDescription(*v1);
  C3D::ResourceTypeDescription(*v0);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_20B249000, v2, v3, "Error: Types mismatch %s <-> %s", v4, v5, v6, v7, 2u);
}

void C3D::ScratchAllocator::ScratchAllocator(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void VMAllocateChunk()
{
}

{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 159, "n");
}

{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 171, "chunk->data");
}

{
  __assert_rtn("VMAllocateChunk", "C3DScratchAllocator.cpp", 158, "!chunk->next");
}

void VMAllocateChunk(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: vm_allocate failed allocating %zu bytes", (uint8_t *)&v2, 0xCu);
}

void C3DScratchAllocator::Allocate()
{
}

void _fillVertexDescriptor(__int16 a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = C3DBaseTypeStringDescription(a1);
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: format %@ not convertible to MTLVertexFormat", (uint8_t *)&v3, 0xCu);
}

void _fillVertexDescriptor()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1_2();
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Semantic %d is not meant to be passed to shaders", (uint8_t *)v1, 0x12u);
}

void _C3DTimingFunctionInitWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DTimingFunctionInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void _C3DTimingFunctionCopyPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTimingFunctionGetControlPoints_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueCreateWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueSetDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueCompile_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DFXTechniqueCompile - invalid description (sequence missing or empty) %@", v2, v3, v4, v5, v6);
}

void C3DFXTechniqueCompile_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueAppendPass_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DFXTechniqueAppendPass out of capacity", v1, 2u);
}

void C3DFXTechniqueAppendPass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueAppendPass_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueGetPassAtIndex_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "index < technique->_count";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DFXTechniqueGetPassAtIndex index %ld is out of bounds (%ld)", (uint8_t *)&v4, 0x20u);
}

void C3DFXTechniqueDeclareSymbol_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "CFDictionaryGetValue(technique->_parameterStorage->parameters, symbolName) == 0";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Cannot declare twice the same symbol (%@)", (uint8_t *)&v2, 0x16u);
}

void C3DFXTechniqueDeclareSymbol_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueDeclareSymbol_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DFXTechniqueSetValueForSymbol - unknown param named %@", v2, v3, v4, v5, v6);
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DFXTechniqueSetValueForSymbol - expect an image for paramName %@", v2, v3, v4, v5, v6);
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueSetValueForSymbolWithCount_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXTechniqueGetValueOffsetForSymbol_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DFXTechniqueGetValueForSymbol - unknown param named %@", v2, v3, v4, v5, v6);
}

void C3DFXTechniqueCreateBySequencingTechniques_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!dstPass->_customExecuteBlock";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. _customExecuteBlock not nil", a1);
}

void C3DFXTechniqueCreateBySequencingTechniques_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "!dstPass->_customInitializeBlock";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. _customInitializeBlock not nil", a1);
}

void C3DFXTechniqueCreateBySequencingTechniques_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sourcePass->_inputCount == dstPass->_inputCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. unexpected pass inputs in merge", a1);
}

void C3DFXTechniqueAddSubTechnique_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationStackInit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationStackSetTarget_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationStackAppendAnimationNode_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "animationCluster->_keyframes->_valueSize[index] == C3DSizeOfBaseType(target->_baseType)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. unexpected size", buf, 0xCu);
}

void C3DAnimationStackAppendAnimationNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationStackAppendAnimationNode_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationStackAppendAnimationNode_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DES2SlotToAttachmentID_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DES2SlotToAttachmentID : unknown slot", v1, 2u);
}

void C3DKeyframedAnimationEvaluate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframedAnimationEvaluate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframedAnimationCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DKeyframedAnimationCopy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DKeyframedAnimationInitWithPropertyList_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _C3DKeyframedAnimationInitWithPropertyList plist invalid", v1, 2u);
}

void _C3DKeyframedAnimationInitWithPropertyList_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _C3DKeyframedAnimationInitWithPropertyList serializedData invalid", v1, 2u);
}

void C3DAnimationPlayerSetAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationNodeAddChild_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationNodeSetRepeatStep_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationNodeCreateWithAnimationGroupAndAddToAnimationManager_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationNodeCreateWithAnimationCluster_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationNodeCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getCIFilterParameterValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _applyCIFilter_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _applyCIFilter_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "image";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void _applyCIFilter_cold_3(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "texture";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void _createShapeForGeometry()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Warning: SCNPhysicsShape does not support a SCNCone with TopRadius != 0.0", v2, v3, v4, v5, v6);
}

void _createShapeForNode()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Compound shapes cannot be created without shapes", v2, v3, v4, v5, v6);
}

void __fillMeshElementInfo(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Unsupported indices stride", (uint8_t *)&v1, 0xCu);
}

void C3DWrapModeToMTLAddressMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFilterModeToMTLFilter_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DImageTypeToMTLTextureType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullModeToMTLCullMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFillModeToMTLFillMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBlendFactorToMTLBlendFactor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBlendOpToMTLBlendOperation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DComparisonFuncToMTLCompareFunction_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DStencilOpToMTLStencilOperation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementTypeToMTLPrimitiveType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementTypeToMTLPrimitiveType_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNMTLVertexFormatToC3DBaseType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNMTLDataTypeFromC3DBaseType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNMTLFunctionTypeToProgramStage_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Kernel functions have no corresponding program stage", v1, 2u);
}

void C3DCreateImageWithTexture_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 134217984;
  uint64_t v4 = [a1 pixelFormat];
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Unexpected pixel format %lu", (uint8_t *)&v3, 0xCu);
}

void C3DMeshSourceCreateWithMTLBuffer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceCreateWithMTLBuffer_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNSampleCountForAntialiasingMode_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unexpected antialiasing mode (%d)", (uint8_t *)v2, 8u);
}

void C3DImageGetURL_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DImageCreateTextureRawData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DImageCreateVerticalStripCubemapWithFaceImages_cold_1(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Cannot build cubemap from array of images because image at index %d is NULL", (uint8_t *)v2, 8u);
}

void C3DImageCreateVerticalStripCubemapWithFaceImages_cold_2(unsigned __int8 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Cannot build cubemap from array of images because conversion to CGImageRef of image at index %d failed", (uint8_t *)v2, 8u);
}

void C3DImageGetSize_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Failed to load %@", v2, v3, v4, v5, v6);
}

void C3DImageCopyCGImage_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Failed to create image source from data %@", v2, v3, v4, v5, v6);
}

void C3DImageCopyCGImage_cold_2(CGImageSource *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  CGImageSourceStatus StatusAtIndex = CGImageSourceGetStatusAtIndex(a1, 0);
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to create image from image source %@ (status: %d)", (uint8_t *)&v3, 0x12u);
}

void C3DImageCopyCGImage_cold_3(CGImageSource *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 138412802;
  uint8_t v6 = a1;
  __int16 v7 = 1024;
  CGImageSourceStatus StatusAtIndex = CGImageSourceGetStatusAtIndex(a1, 0);
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: Failed to create image from image source %@ (status: %d) (%@)", (uint8_t *)&v5, 0x1Cu);
}

void C3DImageCreateVerticalStripCubemapWithImage_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot build column cubemap from non-cubemap image", v2, v3, v4, v5, v6);
}

void __ImageResize_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: unable to get a CGImageRef from image", v2, v3, v4, v5, v6);
}

void C3DImageGetCatalogTextureName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DImageCopyUSDZEmbeddedData_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to resolve image inside %@", v2, v3, v4, v5, v6);
}

void C3DImageCopyUSDZEmbeddedData_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to map image data for image inside %@", v2, v3, v4, v5, v6);
}

void C3DImageCacheBitmap_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to create a CGBitmapContext from a CGImage for %@", v2, v3, v4, v5, v6);
}

void C3DImageCacheBitmap_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DImageEnumerateCubeMapFacePixelBuffers_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Unknown cubemap image type", v2, v3, v4, v5, v6);
}

void C3DImageEnumerateCubeMapFacePixelBuffers_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Cannot support rotation layout for compressed texture", buf, 2u);
}

void C3DImageEnumerateTexture3DSlicePixelBuffers_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Unknown Texture3D image type", v2, v3, v4, v5, v6);
}

void _C3DImageInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to load image with description: %@", v2, v3, v4, v5, v6);
}

void _C3DImageInitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DImageCopyPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DImageCopyPropertyList error retrieving path", v2, v3, v4, v5, v6);
}

void SCNMTLBlitCommandEncoder::copyTextureToTexture(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. depth must match to copy", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. height must match to copy", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. width must match to copy", a5, a6, a7, a8, 2u);
}

void C3DTextureSamplerSetAnisotropy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DTextureSamplerInitWithPropertyList_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DTextureSamplerInitWithPropertyList_cold_5(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DTextureSamplerInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void _C3DTextureSamplerCopyPropertyList_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Could not serialize an integer", v1, 2u);
}

void _C3DBezierCurveGeometryCreateCopy_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "object";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3D::FloorPass::setup(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "floor";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DEngineContextGetStats_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextGetScene_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextRenderScene_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextRenderScene_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextSetGLContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextGetPointOfView_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextGetViewportAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextGetEyeMatrix4x4_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextComputeJitterMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextGetTAAJitter_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineStatsResetResourceStats_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineStatsMergeResourceStats_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _loadKTX_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Unsupported format in KTX file", v1, 2u);
}

void _loadKTX_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Only big endian ktx are supported", v1, 2u);
}

void _createKTXDataRepresentation_cold_1(uint64_t a1)
{
  SCNMTLPixelFormatToString(a1);
  OUTLINED_FUNCTION_0_4(&dword_20B249000, v1, v2, "Error: Unsupported pixel format %@ (%u) in KTX encoder", v3, v4, v5, v6, 2u);
}

void _createKTXDataRepresentation_cold_2(void *a1)
{
  SCNMTLTextureTypeToString([a1 textureType]);
  [a1 textureType];
  OUTLINED_FUNCTION_0_4(&dword_20B249000, v2, v3, "Error: Unsupported texture type %@ (%u) in KTX encoder", v4, v5, v6, v7, 2u);
}

void _C3DRendererElementSync_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStateCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStateBindProgramRendererElement_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "CFArrayGetCount(shaderModifiers)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. unoptimal : don't keep empty arrays", buf, 0xCu);
}

void C3DRendererElementStateDrawRendererElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStateProcessRendererElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStateProcessRendererElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStateProcessRendererElement_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStateProcessRendererElement_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetMatrix4x4UniformAtLocation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextExecuteSlotTextureProxy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetupResidentMeshSourceAtLocation_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextSetupResidentMeshSourceAtLocation:not handling type, using float as default", v2, v3, v4, v5, v6);
}

void C3DRendererContextSetupResidentMeshSourceAtLocation_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextSetupResidentMeshSourceAtLocation - double not supported", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateProgramObjectForProgram_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram unsupported program", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateProgramObjectForProgram_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram : missing vertex shader", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateProgramObjectForProgram_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram : missing fragment shader", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateProgramObjectForProgram_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextCreateProgramObjectForProgram metal program unsupported", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateProgramObjectForProgram_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __FillProgramObjectLocations_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: __FillProgramObjectLocations uniform index out of bounds", buf, 2u);
}

void __FillProgramObjectLocations_cold_2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "nextFreeIndex < bufferCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. fillProgramLocation: index out of bounds", buf, 0xCu);
}

void C3DRendererContextDeleteBufferObject_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextApplyTextureSampler_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextCreateTextureWithImage_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t URL = C3DImageGetURL(a1);
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Cannot load image %@.", (uint8_t *)&v3, 0xCu);
}

void C3DRendererContextCreateTextureWithImage_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererCreateTextureWithImage : error while getting bitmap bytes", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateTextureWithImage_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Invalid texture type: GL_BGR is not supported on OpenGL ES", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateTextureWithImage_cold_4()
{
  OUTLINED_FUNCTION_2();
}

void C3DRendererContextCreateTextureWithImage_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextCreateTextureWithImage_cold_7(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: image copy did fail: %@\n", (uint8_t *)&v2, 0xCu);
}

void C3DRendererContextCreateRenderTargetWithDescription_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _createRBOForRenderTargetDescription - fbo size is zero", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateRenderTargetWithDescription_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _createTextureForRenderTarget - fbo size is zero", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateRenderTargetWithDescription_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetupFramebuffer_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextSetupFramebuffer invoked twice on a Framebuffer", v2, v3, v4, v5, v6);
}

void C3DRendererContextSetupFramebuffer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextUnbindFramebuffer_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: C3DRendererContextUnbindFramebuffer - no fbo bound", v2, v3, v4, v5, v6);
}

void C3DRendererContextUnbindFramebuffer_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetRasterizerStates_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __drawCall_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: NOT IMPLEMENTED", v2, v3, v4, v5, v6);
}

void __drawCall_cold_2()
{
}

void C3DRendererContextSetLight_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetLight_cold_2(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "lightIndex < C3D_MAX_LIGHTS";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Wrong light index %d", (uint8_t *)&v2, 0x12u);
}

void C3DRendererContextSetLight_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextBindCommonProfile_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Physically based lighting model is not supported by the OpenGL renderer, using Phong instead", v2, v3, v4, v5, v6);
}

void __SetupCommonProfileEffectProperty_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_20B249000, v0, v1, "Error: Max number of texture unit (%d) is reached - can't bind a new texture", v2, v3, v4, v5, v6);
}

void __SetupCommonProfileEffectProperty_cold_2()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_20B249000, v0, v1, "Error: We do not handle property %d to get the program attribute enum for the texture (using default: diffuse)\n", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateBufferObjectForMeshSource_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DRendererContextCreateBufferObjectForMeshSource - mesh source has no data", v2, v3, v4, v5, v6);
}

void C3DRendererContextCreateBufferObjectForMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextBindMeshElement_cold_1()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_20B249000, v0, v1, "Error: C3DRendererContextBindMeshElement unsupported byte per index (%d)", v2, v3, v4, v5, v6);
}

void C3DRendererContextBindMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextMapVolatileMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextMapVolatileMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextMapVolatileMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextMapVolatileMeshElement_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextUnmapVolatileMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL17__renderToTexturePU45objcproto34SCNMaterialPropertyTextureProvider11objc_objectPU21objcproto10MTLTexture11objc_objectPU51objcproto40SCNMaterialPropertyTextureProviderHelper11objc_objectP19SCNMTLRenderContext_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL17__renderToTexturePU45objcproto34SCNMaterialPropertyTextureProvider11objc_objectPU21objcproto10MTLTexture11objc_objectPU51objcproto40SCNMaterialPropertyTextureProviderHelper11objc_objectP19SCNMTLRenderContext_block_invoke_72_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetGLContext_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "context";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DParticleManagerGetSharedQuadsMeshElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleManagerComputeTechniqueForSystem_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: ParticleSystem shaders missing : %@", (uint8_t *)&v2, 0xCu);
}

void C3DParticleManagerComputeTechniqueForSystem_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _willExecuteParticleSystemPass_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "cullingContext";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void _executeParticleSystemPass_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "CFGetTypeID(instance) == C3DParticleSystemInstanceGetTypeID()";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. ParticleSystemInstance: wrong instance stored in rendererElement", (uint8_t *)&v1, 0xCu);
}

void C3DConvert_uchar4n_to_float4_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: not implemented", v2, v3, v4, v5, v6);
}

void C3DConvertBatch_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "dst.count == src.count";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. src and dst count must be equal", (uint8_t *)&v1, 0xCu);
}

void C3DConvertFloatingTypeToFloat4_cold_1(__int16 a1)
{
  C3DBaseTypeStringDescription(a1);
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: unsupported conversion %@ -> float4", v3, v4, v5, v6, 2u);
}

void C3DConvertGetReadToFloat4Function_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "srcType < kC3DBaseTypeCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. unknown type", (uint8_t *)&v1, 0xCu);
}

void C3DFramebufferSetFBO_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DFramebufferCleanup_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFramebufferDescriptionSetSampleCount_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "description->colorsDescription[i].renderToTexture == false";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. can't render to texture if multisampled", buf, 0xCu);
}

void C3DFramebufferDescriptionSetSampleCount_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFramebufferDescriptionSetSampleCount_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _processRendererElement(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DEngineContextRenderTechnique - unknown draw instruction", buf, 2u);
}

void _processRendererElement(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Fully transparents objects should have been removed from the pipeline already", a5, a6, a7, a8, 2u);
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Hidden nodes should have been removed from the pipeline already", a5, a6, a7, a8, 2u);
}

void SCNMTLRenderCommandEncoder::setVertexTexture(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___Z18__slideWithinWorldP15__C3DConstraintP18__C3DEngineContextP18__C3DCullingSystemP9__C3DNodefDv3_fS7__block_invoke_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "vertices.type == kC3DBaseTypeVector3";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed.  - Only vector3 type is supported.", buf, 0xCu);
}

void ___Z18__slideWithinWorldP15__C3DConstraintP18__C3DEngineContextP18__C3DCullingSystemP9__C3DNodefDv3_fS7__block_invoke_9_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DConstaintSliderSetCategoryBitMask_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___Z31C3DConstraintApplyAvoidOccluderP18__C3DEngineContextP25__C3DConstraintControllerPKvP16__C3DModelTargetf_block_invoke_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "positions.type == kC3DBaseTypeVector3";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed.  - Only vector3 type is supported.", buf, 0xCu);
}

void __StoreTexture_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __ResourceManagerDeleteTexture_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: __ResourceManagerDeleteTexture: texture to be deleted not found, bail out", v2, v3, v4, v5, v6);
}

void __ResourceManagerDeleteTexture_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DResourceManagerDeleteTexture can't find image source", v2, v3, v4, v5, v6);
}

void __ResourceManagerDeleteTexture_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DResourceManagerDeleteTexture source does not match to any stored texture (no texture samplers associated)", v2, v3, v4, v5, v6);
}

void C3DResourceManagerMakeImageResident_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Failed to load texture named %@ : %@", (uint8_t *)&v4, 0x16u);
}

void C3DResourceManagerMakeImageProxyResident_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DResourceManagerMakeProgramResident_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DResourceManagerMakeProgramResident failed to compile program - fallback on default program", v2, v3, v4, v5, v6);
}

void C3DResourceManagerMakeProgramResident_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __ResourceManagerReleaseResidentVRAMResource_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __HandleVRAMResourcesRemovalFromCommands_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "textureProxy";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void _C3DResourceManagerUninstallRendererContext_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: rendererContext is not tracked by the resource manager", v2, v3, v4, v5, v6);
}

void __deleteTextureProxies_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __ResourceManagerRemoveResidentMeshSourceData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __RemoveVRAMResourceFromDic_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTextureCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DImageProxyCreateTextureProxy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DImageProxyGetCaptureDeviceInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEnginePipelineSyncNodeAttribute_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unsupported node attribute '%@'", (uint8_t *)&v2, 0xCu);
}

void C3DEnginePipelineSyncNodeAttribute_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __HandleNodeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __HandleMaterialDidChangeNotifications_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __ApplyMaterialDidChange_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __HandleGeometryDidChangeNotifications_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __HandleLightDidChangeNotifications_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __HandleNodeWillDieNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DEnginePipelineAllocateAndTrackRendererElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEnginePipelineReset_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEnginePipelineRenderSubTree_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEnginePipelineGetRenderComponentsForRenderPass_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unexpected renderer element with no material/technique/program", v1, 2u);
}

void C3DEnginePipelineGetRenderComponentsForRenderPass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererContextSetTypedBytesUniformAtLocation_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: C3DRendererContextSetValueUniformAtLocation not implemented for this type (%d) yet", (uint8_t *)v2, 8u);
}

void C3DRendererContextSetValueUniformAtLocation_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: uniform has incorrect type", v1, 2u);
}

void C3DFXProgramDelegateGetUserInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXProgramGetProfile_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNSetShaderCollectionEnabled_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unable to create the shader cache folder at %@ (%@)", (uint8_t *)&v4, 0x16u);
}

void _C3DInitNumberArrayWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not deserialize a number array (nil buffer or serialized data)", v2, v3, v4, v5, v6);
}

void _C3DInitNumberArrayWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Could not deserialize a number (%@) in a number array", v2, v3, v4, v5, v6);
}

void _C3DInitNumberArrayWithPropertyList_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not deserialize a number array (unexpected type)", v2, v3, v4, v5, v6);
}

void C3DBaseTypeForCFNumberType_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DBaseTypeForCFNumberType: Type not supported", v2, v3, v4, v5, v6);
}

void C3DConvertToPlatformIndependentData_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DConvertToPlatformIndependentData - Type not supported", v2, v3, v4, v5, v6);
}

void C3DConvertToPlatformIndependentData_cold_2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DConvertToPlatformIndependentData - archiving pointers makes no sense", buf, 2u);
}

void C3DConvertToPlatformIndependentData_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DConvertToPlatformIndependentData_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DConvertFromPlatformIndependentData_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DConvertFromPlatformIndependentData: Not enough room for the specified count & stride to read", v2, v3, v4, v5, v6);
}

void C3DConvertFromPlatformIndependentData_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DConvertFromPlatformIndependentData: Not enough room for the specified count & stride to write", v2, v3, v4, v5, v6);
}

void C3DConvertFromPlatformIndependentData_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DConvertFromPlatformIndependentData - Type not supported", v2, v3, v4, v5, v6);
}

void C3DSizeOfBaseType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBaseTypeGetComponentType_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: unknown type", v2, v3, v4, v5, v6);
}

void C3DBaseTypeGetCompoundType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBaseTypeGetCompoundType_cold_2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_7()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_8()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_9()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_10()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_11()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeGetCompoundType_cold_12()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4_2(&dword_20B249000, v0, v1, "Unreachable code: Compound type %s%d is not supported", v2, v3, v4, v5, 2u);
}

void C3DBaseTypeDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBaseTypeFromDescription_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DBaseTypeFromDescription - Type not supported", v2, v3, v4, v5, v6);
}

void C3DBaseTypeFromDescription_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Warning: C3DBaseTypeFromDescription - signed/unsigned ambiguity", v2, v3, v4, v5, v6);
}

void C3DAddBaseType_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DAddBaseType - unknown type", v2, v3, v4, v5, v6);
}

void C3DAddBaseType_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAddBaseType_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DAddBaseType - addition of half float not supported", v2, v3, v4, v5, v6);
}

void C3DAddBaseType_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAddBaseType_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAddBaseType_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSubBaseType_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSubBaseType - unknown type", v2, v3, v4, v5, v6);
}

void C3DSubBaseType_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSubBaseType_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSubBaseType - substraction of half float not supported", v2, v3, v4, v5, v6);
}

void C3DCreateCStringFromStringWithEncoding_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Conversion to C string failed", v2, v3, v4, v5, v6);
}

void C3DCreateCStringFromStringWithEncoding_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIOSurfaceToTexImage_cold_1()
{
  __assert_rtn("C3DIOSurfaceToTexImage", "C3DUtils.m", 2657, "internalformat == GL_RGBA");
}

void C3DStringNamed_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to load resource named %@", v2, v3, v4, v5, v6);
}

void C3DDictionaryNamed_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to load dictionary named %@", v2, v3, v4, v5, v6);
}

void C3DJsonNamed_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to load json named %@", v2, v3, v4, v5, v6);
}

void C3DJsonNamed_cold_2()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: failed to load json named %@ (reason: %@)");
}

void C3DDataFromMTLBuffer_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Warning: C3DDataFromMTLBuffer - can't read private MTL buffer", v2, v3, v4, v5, v6);
}

void C3DDeduceSphericalHarmonicsOrderFromDataLength_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_1_2();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_20B249000, v1, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Spherical Harmonics Data seems malformed: order(%d) !=> length(%zu)", (uint8_t *)v2, 0x1Cu);
}

void C3DDeduceSphericalHarmonicsOrderFromDataLength_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXShaderGetStage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXShaderGetSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _resizeProbesData_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unsupported SH order", v1, 2u);
}

void _resizeProbesData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _resizeProbesData_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _computeNeighbourIndexes_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_tetrahedrons[tetraderonIndex].neighbourIndexes[otherTetraderonFaceIndex] == -1";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. overwrite a neighbour index", a1);
}

void _computeNeighbourIndexes_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "tetrahedronIndexes";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. _computeNeighbourIndexes - missing tetrahedron", a1);
}

void C3DLightProbesSystemSetProbeData_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: SH order unsupported : %d", (uint8_t *)v2, 8u);
}

void C3DLightProbesSystemSetProbeData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightProbesBeginQueries_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "tetrahedronIsValid[indexValid]";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. will make an invalid tetrahedron valid", a1);
}

void C3DLightProbesBeginQueries_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "validTetraCount <= (uint32_t)indexToRecycle";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. validTetraCount > indexToRecycle", a1);
}

void C3DLightProbesBeginQueries_cold_3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: tetrahedrisation: index out of bounds", buf, 2u);
}

void C3DLightProbesBeginQueries_cold_4(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "vCount <=2";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. _faceHasEdgeSharedWithMoreThanTwoOtherOpenFace", a1);
}

void C3DLightProbesBeginQueries_cold_5(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _buildTetrahedrons - failed with first tetrahedron", v1, 2u);
}

void __lookupTetrahedron_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightProbesQuerySH2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightProbesSetGlobalSH3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DEffectCommonProfileReleaseSlot_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __PostCommonProfileDidChangeNotification_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: orphan effect common profile detected", v1, 2u);
}

void C3DEffectCommonProfileGetHashCode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __PostParentDidChangeNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEffectSlotSetHasNoContents_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DEffectCommonProfileInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: No function %@ in the common profile %@");
}

void _C3DEffectCommonProfileInitWithPropertyList_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DEffectCommonProfileCopyPropertyList_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "key";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DEffectCommonProfileCopyPropertyList_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "imageID < INT_MAX";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Too many objects", a1);
}

void __DeserializeColor_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DEffectCommonProfile DeserializeColor: No property for the key %@", v2, v3, v4, v5, v6);
}

void __DeserializeColor_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Could not deserialize the color %@", v2, v3, v4, v5, v6);
}

void __DeserializeUVSet_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Common profile deserialization: could not read the property %@", v2, v3, v4, v5, v6);
}

void __DeserializeUVSet_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Common profile deserialization: property found for the key %@", v2, v3, v4, v5, v6);
}

void __DeserializeTextureSampler_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Could not deserialize the texture sampler %@", v2, v3, v4, v5, v6);
}

void __DeserializeImage_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Cannot find the image ID for the key %@ in the dictionary %@");
}

void __DeserializeImage_cold_2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Cannot find the specified image", v1, 2u);
}

void __DeserializeImage_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void vmesh::SubdivideMidPoint()
{
}

void _ZN5vmesh19InterpolateMidPointIDv3_fEEvRNSt3__16vectorIT_NS2_9allocatorIS4_EEEERKNS_26StaticAdjacencyInformationI4PairEE_cold_1()
{
  __assert_rtn("InterpolateMidPoint", "VMesh.hpp", 232, "neighbor.b >= 0 && neighbor.b < int32_t(signal.size())");
}

void _ZN5vmesh19InterpolateMidPointIDv3_fEEvRNSt3__16vectorIT_NS2_9allocatorIS4_EEEERKNS_26StaticAdjacencyInformationI4PairEE_cold_2()
{
  __assert_rtn("InterpolateMidPoint", "VMesh.hpp", 231, "neighbor.a >= 0 && neighbor.a < int32_t(signal.size())");
}

void vmesh::InterpolateNormals()
{
  __assert_rtn("InterpolateNormals", "VMesh.cpp", 496, "neighbor.b >= 0 && neighbor.b < int32_t(normals.size())");
}

{
  __assert_rtn("InterpolateNormals", "VMesh.cpp", 495, "neighbor.a >= 0 && neighbor.a < int32_t(normals.size())");
}

void vmesh::StaticAdjacencyInformation<Pair>::neighborsStartIndex()
{
}

void vmesh::StaticAdjacencyInformation<Pair>::neighborsEndIndex()
{
}

void vmesh::TriangleMesh::loadBaseMeshFromVectors()
{
}

{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 532, "(idxVec.size() % 3) == 0");
}

{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 520, "normalVec.size() == pointCountInVec");
}

{
  __assert_rtn("loadBaseMeshFromVectors", "VMesh.cpp", 515, "uvVec.size() == pointCountInVec");
}

void C3DLODGetEntity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DSubdivisionOsdGPURefine(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void __C3DSubdivisionOsdGPUCreateSynchronizeCoarsePositionsPipeline(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithData(id *a1)
{
  [*a1 status];
  [*a1 error];
  [*a1 logs];
  OUTLINED_FUNCTION_6_0(&dword_20B249000, v2, v3, "Error: OpenSubdiv unarchiver command buffer execution failed with status %d, error: %@\n%@", v4, v5, v6, v7, 2u);
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithData(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DSubdivisionOsdGPURuntimeDataDecodeRefiner()
{
  __assert_rtn("__C3DSubdivisionOsdGPURuntimeDataDecodeEvaluatorInput", "C3DGeometryOpenSubdivSupport_Metal.mm", 685, "dstLength == sizeof(OpenSubdiv::Osd::BufferDescriptor)");
}

{
  __assert_rtn("__C3DSubdivisionOsdGPURuntimeDataDecodeEvaluatorInput", "C3DGeometryOpenSubdivSupport_Metal.mm", 684, "srcLength == sizeof(OpenSubdiv::Osd::BufferDescriptor)");
}

void __C3DSubdivisionOsdGPURuntimeDataInitializePerPatchComputePipelines(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Unreachable code: Unsupported patch type", v4);
}

void C3DSubdivisionOsdGPUGetPerPatchTypeSources_cold_1()
{
}

void C3DSubdivisionOsdGPUGetProgramGeneratorResources_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Unsupported patch type", v1, 2u);
}

void C3DPatchTypeToOsdPatchType()
{
}

void C3DGeometryOpenSubdivGetGPUContext_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DGeometryOpenSubdivGetGPUContext_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t Name = C3DEntityGetName(*(void *)(a1 + 40));
  int v4 = 138412290;
  uint64_t v5 = Name;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Invalidating OpenSubdiv runtime data of geometry %@", (uint8_t *)&v4, 0xCu);
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithGeometry(int *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109376;
  v3[1] = 12;
  __int16 v4 = 1024;
  int v5 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: OSD_MAX_VALENCE is set to %d and current mesh has a max valence of %d", (uint8_t *)v3, 0xEu);
}

void C3DSubdivisionOsdGPURuntimeDataCreateWithGeometry(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSubdivisionOsdGPUSynchroniseCoarseMeshForDeformers_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSubdivisionOsdGPUDraw_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSubdivisionOsdGPUDraw_cold_4(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  int v2 = "__C3DSubdivisionOsdGPUHasPatchOfType(osdRuntimeData, c3dPatchType)";
  __int16 v3 = 2080;
  __int16 v4 = "C3DSubdivisionOsdGPUDraw";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s called but there's no patch to draw.", (uint8_t *)&v1, 0x16u);
}

void C3DGeometryOpenSubdivGPUUpdateAuthoringEnvironmentData_cold_1()
{
  __assert_rtn("C3DGeometryOpenSubdivGPUUpdateAuthoringEnvironmentData", "C3DGeometryOpenSubdivSupport_Metal.mm", 3623, "useDeindexedData == false");
}

void C3DGetPatchTypeDescription()
{
}

void C3DPatchTypeFromOsdPatchType()
{
}

void ___ZL49C3DSubdivisionOsdGPURuntimeDataCreateWithGeometryP13__C3DGeometryP18__C3DEngineContextRK36C3DSubdivisionOsdGPUSubdivParametersP21SCNMTLResourceManagerPU26objcproto15MTLCommandQueue11objc_objectU13block_pointerFvPU27objcproto16MTLCommandBuffer11objc_objectbE_block_invoke_cold_1(void *a1)
{
  [a1 status];
  [a1 error];
  [a1 logs];
  OUTLINED_FUNCTION_6_0(&dword_20B249000, v2, v3, "Error: OpenSubdiv command buffer execution failed with status %d, error: %@\n%@", v4, v5, v6, v7, 2u);
}

void ___ZL49C3DSubdivisionOsdGPURuntimeDataCreateWithGeometryP13__C3DGeometryP18__C3DEngineContextRK36C3DSubdivisionOsdGPUSubdivParametersP21SCNMTLResourceManagerPU26objcproto15MTLCommandQueue11objc_objectU13block_pointerFvPU27objcproto16MTLCommandBuffer11objc_objectbE_block_invoke_527_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZL49C3DSubdivisionOsdGPURuntimeDataCreateWithGeometryP13__C3DGeometryP18__C3DEngineContextRK36C3DSubdivisionOsdGPUSubdivParametersP21SCNMTLResourceManagerPU26objcproto15MTLCommandQueue11objc_objectU13block_pointerFvPU27objcproto16MTLCommandBuffer11objc_objectbE_block_invoke_527_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void OpenSubdiv::v3_1_1::Osd::Mesh<OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer,OpenSubdiv::v3_1_1::Osd::MTLStencilTable,OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator,OpenSubdiv::v3_1_1::Osd::MTLPatchTable,OpenSubdiv::v3_1_1::Osd::MTLContext>::Mesh()
{
}

void OpenSubdiv::v3_1_1::Osd::Mesh<OpenSubdiv::v3_1_1::Osd::CPUMTLVertexBuffer,OpenSubdiv::v3_1_1::Osd::MTLStencilTable,OpenSubdiv::v3_1_1::Osd::MTLComputeEvaluator,OpenSubdiv::v3_1_1::Osd::MTLPatchTable,OpenSubdiv::v3_1_1::Osd::MTLContext>::initializeContext()
{
}

void __C3DSubdivisionOsdGPURuntimeDataEncodeMTLBuffer()
{
  __assert_rtn("__C3DSubdivisionOsdGPURuntimeDataEncodeMTLBuffer", "C3DGeometryOpenSubdivSupport_Metal.mm", 436, "encodedLength <= buffer.length");
}

void C3DMeshSourcePrepareAppend_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceAppendVector3_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: C3DMeshSourceAppendVector3 - Type not supported", v4);
}

void C3DMeshSourceAppendVector2_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_1_1(a1, a2);
  OUTLINED_FUNCTION_2_0(&dword_20B249000, v2, v3, "Error: C3DMeshSourceAppendVector2 - Type not supported", v4);
}

void C3DMeshSourceCreateVolatile_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DMeshSourceCreate: unsupported type", v1, 2u);
}

void C3DMeshSourceCreateVolatile_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshSourceSetVolatileData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEdgeArrayCreateFromMeshElement_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "edgeCount == edges->_count";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. memory smasher found in C3DEdgeArrayCreateFromMeshElement (%ld != %ld)", (uint8_t *)&v4, 0x20u);
}

void C3DEdgeArrayCreateFromMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEdgeArrayGetEdgeAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTriangulationInfoCreateFromMeshElement_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "edgeIndexesPerFaceCounter[j] <= 2";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DTriangulationInfoCreateFromMeshElement - edge out of bounds", buf, 0xCu);
}

void C3DTriangulationInfoCreateFromMeshElement_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTriangulationInfoGetEdgesAtFaceIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementEditorCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshElementEditorCreateWithMeshElementAndCapacity_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DMeshElementEditorCreateWithMeshElement: mesh element is not a triangle array", v2, v3, v4, v5, v6);
}

void _C3DMeshElementEditorIncreaseBytesPerIndexIfNeeded_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DMeshElementEditorIncreaseBytesPerIndexIfNeeded unknown bytes per index", v2, v3, v4, v5, v6);
}

void C3DMeshElementEditorGetIndex_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DMeshElementEditorSetIndex unknown bytes per index", v2, v3, v4, v5, v6);
}

void C3DMeshElementEditorSubdivideTriangleAtIndex_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DMeshElementEditorSubdivideTriangleAtIndex: triangleIndex out of bounds", v2, v3, v4, v5, v6);
}

void C3DMeshElementEditorSubdivideTriangleAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _addLightsInFrustum(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "outData->parameters.probe.index >= 0";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Slice index should have been attributed already", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DLightGetType(light) == kC3DLightTypeProbe";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Wrong light type", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "shadowMapName";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Null argument", a1);
}

void ___Z19_addLightsInFrustumP19SCNMTLClusterSystem11scn_frustumhRKN13SCNMTLCluster7ContextEPNS_4InfoE_block_invoke_5_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DLightGetProbeType(lights[i]) == kC3DLightProbeTypeRadiance";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Wrong probe type", a1);
}

void __append(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.nextIndex[i] <= newIndicesCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. nextIndex out of range", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.packedIndices.data[pl - 1] == li";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. previous light was not of the same index", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "pl != 0";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. end index should be set already", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.packedIndices.data[fl - 1] == li";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. first light was not of the same index", a1);
}

void __addFroxelLightIndicesInBuffer(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "ctx.nextIndex[i] <= indicesCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. nextIndex out of range", a1);
}

void __compactLightIndices()
{
  __assert_rtn("__compactLightIndices", "SCNMTLClusterSystem.mm", 1474, "clusterCellSize == sizeof(simd_ushort2)");
}

{
  __assert_rtn("__compactLightIndices", "SCNMTLClusterSystem.mm", 1452, "clusterCellSize == sizeof(simd_ushort2)");
}

void __compactLightIndices(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "count > 0";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Should be non empty", a1);
}

void SCNMTLClusterSystem::compute(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "i < lightRange.y";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. range overflow", a1);
}

void _insertRange_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Index %ld out of range bounds [0...%ld]", v2, v3);
}

void rangeAtIndex_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: Index %ld out of bounds [0...%ld]", v2, v3);
}

void _C3DAnimationInitWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DAnimationInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void C3DAnimationCreateWithPropertyList_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to deserialize an animation because it is of an unknown type (%@)", (uint8_t *)&v2, 0xCu);
}

void C3DAnimationSetup_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: C3DAnimationSetup - unknown animation class", v2, v3, v4, v5, v6);
}

void C3DSimpleAnimationEvaluate_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSimpleAnimationEvaluate - invalid evaluation function", v2, v3, v4, v5, v6);
}

void C3DSimpleAnimationEvaluate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSimpleAnimationEvaluate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSimpleAnimationCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DSimpleAnimationInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DSimpleAnimationInitWithPropertyList - no base type", v2, v3, v4, v5, v6);
}

void _C3DSimpleAnimationInitWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: SimpleAnimation deserialization: could not deserialize the animation", v2, v3, v4, v5, v6);
}

void __C3DLightDidChange_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightSetIESProfileURL_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to load IES profile : %@", (uint8_t *)&v2, 0xCu);
}

void C3DLightGetIESProfileURL_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightGetProjectionInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightAddLightSHContribution_cold_1()
{
}

void C3DLightAddLightSHContribution_cold_2()
{
}

void C3DLightAddLightSHContribution_cold_3()
{
}

void C3DLightAddLightSHContribution_cold_4()
{
}

void C3DLightAddLightSHContribution_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DLightInitWithPropertyList_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(&dword_20B249000, v0, OS_LOG_TYPE_ERROR, "Error: While deserializing a light: no value for the key %@ (serializedData : %@)", (uint8_t *)v1, 0x16u);
}

void _C3DLightInitWithPropertyList_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_1_6();
  _os_log_error_impl(&dword_20B249000, v0, OS_LOG_TYPE_ERROR, "Error: While deserializing a light: could not decode the number for the key %@ (serializedData : %@)", (uint8_t *)v1, 0x16u);
}

void _C3DLightInitWithPropertyList_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: While deserializing a light: could not decode the shadowcolor", v1, 2u);
}

void _C3DLightInitWithPropertyList_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: While deserializing a light: could not decode the color", v1, 2u);
}

void _C3DLightInitWithPropertyList_cold_5(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DLightInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void C3DCameraNeedsPostProcess_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DProjectionInfosSetZFar_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DProjectionInfosUnproject_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: error in C3DProjectionInfosUnproject", buf, 2u);
}

void C3DProjectionInfosUnproject_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DProjectionInfosUnproject : invalid viewport dimension", v1, 2u);
}

void _C3DCameraInitWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DCameraInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void C3DNodeGetWorldMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeAddChildNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeCreateSubdividedCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeInsertChildNodeAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeInsertChildNodeAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeInsertChildNodeAfterChild_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeRemoveFromParentNode_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "prevChild";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DNodeRemoveFromParentNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeGetWorldPosition_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeGetWorldOrientation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeComputeWorldMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeGetNodeWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeCopyNodesWithAttribute_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __UpdateNodeVisibilityIfNeeded_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeIsAncestor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeFindCommonAncestor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeAddParticleSystem_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeAddAudioPlayer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __UpdateAudioTransform_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DNodeSetLayerIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DNodeCFFinalize_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: inconsistency in scene graph found in C3DNode finalize", buf, 2u);
}

void _C3DNodeInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DNodeInitWithPropertyList_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DNodeInitWithPropertyList_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: loading pivot from compressed collada file is not supported anymore - use SCN file format instead", v2, v3, v4, v5, v6);
}

void _C3DNodeInitWithPropertyList_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not read a matrix", v2, v3, v4, v5, v6);
}

void _C3DNodeInitWithPropertyList_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not read the axis angle", v2, v3, v4, v5, v6);
}

void _C3DNodeInitWithPropertyList_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not read Euler", v2, v3, v4, v5, v6);
}

void _C3DNodeInitWithPropertyList_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not read a quaternion", v2, v3, v4, v5, v6);
}

void _C3DNodeInitWithPropertyList_cold_8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DNodeInitWithPropertyList_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DNodeFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Node deserialization: cannot retrieve the lightmap image ID", v2, v3, v4, v5, v6);
}

void _C3DNodeFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Node deserialization: cannot retrieve the lightmap image", v2, v3, v4, v5, v6);
}

void _C3DNodeFinalizeDeserialization_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Node deserialization: cannot retrieve the object ID", v2, v3, v4, v5, v6);
}

void _serializeNodeAttribute_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DNodeGetBoundingSphere_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __BuildSemanticInfosForData_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "semantic != kC3DMeshSourceSemanticPosition || data->sourcesSemanticInfos[semantic].count == 0";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. No double position sources allowed", a1);
}

void __BuildSemanticInfosForData_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "data->sourcesSemanticInfos[semantic].index == -1";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Mesh sources with same semantic non contiguous", a1);
}

void __BuildSemanticInfosForData_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "semantic > currentSemantic";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Mesh sources are not sorted correctly", a1);
}

void __DropOriginalTopology_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __DropOriginalTopology_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshApplySources_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMeshFinalizeDeserialization_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMeshFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh deserialization: cannot find the specified source", v2, v3, v4, v5, v6);
}

void _C3DMeshFinalizeDeserialization_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh deserialization: cannot init a mesh element", v2, v3, v4, v5, v6);
}

void _C3DMeshFinalizeDeserialization_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Mesh deserialization: cannot deserialize a source", v2, v3, v4, v5, v6);
}

void __DeserializePrimarySource_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot find the specified primary source", v2, v3, v4, v5, v6);
}

void __DeserializePrimarySource_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot find the specified source", v2, v3, v4, v5, v6);
}

void __DeserializePrimarySource_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DSourceAccessorGetSource(accessor) == (C3DGenericSourceRef) primarySource";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. This accessor doesn't point back to the primary source", a1);
}

void C3DMeshCopyBoundingVolumes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshGetElementAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshGetElementAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DMeshRemoveSourceWithSemanticAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DMeshSetSourceWithInputSetAndDataKind_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DMeshSetSourceWithInputSetAndDataKind_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __indexOfSourceWithSemanticAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshHasSourcesWithSemantic_cold_1(uint64_t a1)
{
  uint64_t v2 = scn_default_log();
  OUTLINED_FUNCTION_6_2(v2);
  *(_DWORD *)a1 = 136315138;
  *(void *)(a1 + 4) = "__meshDataForDataKind";
  OUTLINED_FUNCTION_3_3(&dword_20B249000, v3, v4, "Unreachable code: Internal consistency error in %s");
  __break(1u);
}

void C3DMeshGetChannelForSourceAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshGetChannelForSourceWithSemanticAtIndex_cold_1(char a1, int a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v5 = 136315650;
  uint8_t v6 = "sourceIndex != kCFNotFound";
  __int16 v7 = 2112;
  __int16 v8 = C3DMeshSourceSemanticToSemanticString(a1);
  __int16 v9 = 1024;
  int v10 = a2;
  _os_log_fault_impl(&dword_20B249000, a3, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Could not find source with semantic %@ at index %d", (uint8_t *)&v5, 0x1Cu);
}

void __C3DMeshFixAccessorLinks_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: __C3DMeshCopy - unable to resolve interleaved mesh", buf, 2u);
}

void C3DMeshGetIndexOfElement_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshGetMeshElements_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMeshInitWithPropertyList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMeshCopyPropertyList_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "source";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DMeshCopyPropertyList_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DGenericSourceIsPrimary(primarySource)";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. This source should be a primary one", a1);
}

void _C3DMeshCopyPropertyList_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "sourceID <= INT_MAX";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Too many objects in the library", a1);
}

void C3D::flattenedNodesForSelectedNodes(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3DMaterialSetFillMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMaterialGetBlendStates_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Blend mode not implemented.", v1, 2u);
}

void C3DMaterialGetBlendStates_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMaterialGetBlendStates_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMaterialInitWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DMaterialInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void C3DSceneNodeWasAdded_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "player != NULL";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. There should only be valid audio sources in this array", buf, 0xCu);
}

void C3DScenePostPipelineEvent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSceneSetLayerRootNode_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2_6();
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Only %d layers are available, but layer %d requested", (uint8_t *)v1, 0x18u);
}

void _C3DSceneInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not read the animations manager", v2, v3, v4, v5, v6);
}

void _C3DSceneInitWithPropertyList_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DSceneInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void _C3DSceneFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Scene deserialization : cannot finalize the deserialization of the animation manager", v2, v3, v4, v5, v6);
}

void _C3DSceneFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: ... and we do not even have a root node, so bailing out", v2, v3, v4, v5, v6);
}

void _C3DSceneFinalizeDeserialization_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _copySerializedHierarchy_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSceneRef _copySerializedHierarchy: lib entry not found", v2, v3, v4, v5, v6);
}

void _copySerializedHierarchy_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _deserializeHierarchy_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _deserializeHierarchy: no nodeID specified!\n", v2, v3, v4, v5, v6);
}

void _deserializeHierarchy_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Library could not remap the ID %@", (uint8_t *)&v2, 0xCu);
}

void _deserializeHierarchy_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _deserializeHierarchy: could not find the specified node in the library\n", v2, v3, v4, v5, v6);
}

void _C3DSceneEnumerateSubEntities_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: You can't change the sceneRef of a scene", v2, v3, v4, v5, v6);
}

void C3DPhysicsWorldAddBodyToWorld(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void btC3DCollisionDispatcher::updateContact(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void btC3DCollisionDispatcher::deleteContact(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNCreateGLESContext_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: failed to create a GL context", v1, 2u);
}

void C3D::PassDescriptor::inputAtIndex()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. Pass input descriptor out of bound access %d", v2, v3, v4, v5, 2u);
}

void C3D::PassDescriptor::outputAtIndex()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. Pass output descriptor out of bound access %d", v2, v3, v4, v5, 2u);
}

void C3D::PassResource::inputAtIndex()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. input resource index out of bound %d", v2, v3, v4, v5, 2u);
}

void C3D::PassResource::outputAtIndex()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. output resource index out of bound %d", v2, v3, v4, v5, 2u);
}

void C3D::Pass::addDependency(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Adding dependency on self", a5, a6, a7, a8, 2u);
}

void C3D::Pass::drawableInfo(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::Pass::inputBufferParameterAtIndex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::Pass::outputBufferParameterAtIndex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::Pass::outputTextureAtIndex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::CachedFXPassName(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DPassGetInputTextureNamed_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void VertexCache<unsigned char>::computeACMR()
{
}

void C3DFramebufferRegistryPrepareFramebufferWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _addRenderTargetIfNeeded_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFramebufferRegistryFinalizeAndGetFramebuffer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFramebufferRegistryRetainTextureWithName_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. C3DFramebufferRegistryRetainTextureWithName retainCount==0", a5, a6, a7, a8, 2u);
}

void C3DFramebufferRegistryRetainTextureWithName_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _removeReference_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. _removeReference - index==0", a5, a6, a7, a8, 2u);
}

void C3DFramebufferRegistryReleaseFramebuffer_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __rayIntersectSphere_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitLife_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitLifeWithVariation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitBirthTime_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitMass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitSize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitBounce_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitFriction_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitCharge_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitColor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitRotationAxis_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParticleInitFrame_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __reserveData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __updateWorldData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __updateWorldData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __lightOptimizedType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemAdd_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20B249000, a1, a3, "Error: Node is already registered to the light system", v3);
}

void __runtimeIndex_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 256;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Too many effective lights at once. Limit is %d", (uint8_t *)v1, 8u);
}

void _ComputeRuntimeDataForIndex_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Missing shadow %@", (uint8_t *)&v3, 0xCu);
}

void C3DLightingSystemBeginQueries_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemGetIrradianceProbesCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemGetLightingSetProgramHashCodes_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "((rInd > 0) && (rInd <= pipelineData->_runtimeLightsCount)) || (rInd == kDefaultRuntimeIndex)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Invalid runtime light index", buf, 0xCu);
}

void C3DLightingSystemGetLightingSetDesc_cold_1(uint8_t *a1, unsigned char *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20B249000, a3, (uint64_t)a3, "Error: Invalid runtime light index", a1);
}

void C3DLightingSystemComputeShadowMatrices_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)int v3 = 0;
  OUTLINED_FUNCTION_0_1(&dword_20B249000, a1, a3, "Error: The shadow node is not registered", v3);
}

void C3DLightingSystemComputeShadowMatrices_cold_2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 256;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Too many shadow caster lights at once. Limit is %d", (uint8_t *)v1, 8u);
}

void C3DLightingSystemComputeShadowMatrices_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemComputeShadowMatrices_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemComputeShadowMatrices_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemComputeShadowMatrices_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemGetActiveShadowCasterData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLightingSystemGetActiveShadowCasterData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _copyAnimations_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: error while transposing animations to cloned tree", v2, v3, v4, v5, v6);
}

void _findClone_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: error while transposing skeleton or morph target", v2, v3, v4, v5, v6);
}

void createGLFramebufferInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createGLFramebufferInfo_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createGLFramebufferInfo_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNLightTypeToC3DLightType_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: unknown light type %@", v2, v3, v4, v5, v6);
}

void SCNDecodeUnsafeObjectForKey_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: exception decoding unsecure object for key: %@", v2, v3, v4, v5, v6);
}

void SCNEncodeC3DAnimationForKey_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: SCNEncodeAnimations unknown animation: %@", v2, v3, v4, v5, v6);
}

void SCNDecodeC3DAnimationForKey_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: can't deserialize animation %@", v2, v3, v4, v5, v6);
}

void SCNDecodeC3DAnimationForKey_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to deserialize animation %@", v2, v3, v4, v5, v6);
}

void _SCNDecodeImageContents_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: SCNDecodemage: invalid archive", v1, 2u);
}

void _C3DToCAFillMode_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: unknown fill mode", v2, v3, v4, v5, v6);
}

void CABasicAnimationToC3DAnimation_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: animating between instances is not supported", v2, v3, v4, v5, v6);
}

void CAKeyframeAnimationToC3DAnimation_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: CAKeyframeAnimationToC3DAnimation :: too large value to animate : %d bytes", (uint8_t *)v2, 8u);
}

void CAKeyframeAnimationToC3DAnimation_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: CAKeyframeAnimation has no keyframe - skipping conversion", v2, v3, v4, v5, v6);
}

void _CAAnimationToC3DAnimation_cold_1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: Unsupported CAPropertyAnimation subclass (%@)", v3, v4, v5, v6, v7);
}

void _CAAnimationToC3DAnimation_cold_2()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_5(&dword_20B249000, v1, v2, "Error: Unsupported CAAnimation class (%@)", v3, v4, v5, v6, v7);
}

void _C3DAnimationToCAAnimation_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DAnimationToCAAnimation: unsupported animation type \"%@\"", v2, v3, v4, v5, v6);
}

void SCNAddAnimation_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: can't add a NULL animation to %@", v2, v3, v4, v5, v6);
}

void SCNAddAnimation_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNRemoveAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNFadeAndRemoveAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNRemoveAllAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNFadeAndRemoveAllAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::RenderProbePass::RenderProbePass(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "C3DNodeGetLight(_drawNodesParameters.pointOfView)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void SCNStandardConstants::_setPropertyFlags(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "*texcoord_io_index < kSCNTexcoordCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. too many io texcoord needed", (uint8_t *)&v1, 0xCu);
}

void C3DParticleSystemGetRenderingMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendController_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendController_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendController_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __addPrimaryData_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Too many properties added to this ParticleSystem", v1, 2u);
}

void C3DParticleSystemGetConstantDataPtrForSemantic_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLibraryCreateEntryIdentifier_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DLibraryCreateEntryIdentifier - unknown type", v1, 2u);
}

void C3DLibraryGetRemappedID_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: library does not contain an entry %d with kind %d", (uint8_t *)v3, 0xEu);
}

void C3DLibraryGetRemappedID_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLibraryTrackID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLibraryGetEntry_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLibraryGetEntryWithUniqueID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLibraryGetEntryWithUniqueID_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DLibraryGetEntryWithDocumentID_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DLibraryInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DLibraryFinalizeDeserialization_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Library deserialization: could not finalize the deserialization of a substorage", v1, 2u);
}

void _C3DLibraryFinalizeDeserialization_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DLibraryFinalizeDeserialization_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __finalizeDeserialization_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __finalizeDeserialization_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFloorGetReflectivity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DFloorInitWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DFloorInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void C3D::SmartPtr<__C3DArray *,C3D::detail::CFRetainFct,C3D::detail::CFReleaseFct>::operator __C3DArray *(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_ptr != NULL";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Dereferencing null pointer", (uint8_t *)&v1, 0xCu);
}

void C3DProgramHashCodeStoreRegisterProgramForRendererElementAndHashPass_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "programIndex < 0xffffffff";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DProgramHashCodeStoreRegisterProgramForRendererElement - programIndex out of uint32_t. will crash soon", (uint8_t *)&v1, 0xCu);
}

void C3DProgramHashCodeStoreRegisterProgramForRendererElementAndHashPass_cold_2(int *a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DProgramHashCodeStoreRegisterProgramForRendererElement - index out of capacity (%d > %d)", (uint8_t *)v4, 0xEu);
}

void C3DMeshCreateFromProfile_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGeometryInitSubdivTopologyInfoIfNeeded()
{
  __assert_rtn("C3DGeometryInitSubdivTopologyInfoIfNeeded", "C3DGeometryOpenSubdivSupportInternal.cpp", 811, "vertIndicesPerFaceCurrentIndex == topologyInfo->totalIndexCount");
}

{
  __assert_rtn("C3DGeometryInitSubdivTopologyInfoIfNeeded", "C3DGeometryOpenSubdivSupportInternal.cpp", 772, "(int32_t)vertexCountPerFaceCurrentIndex == topologyInfo->topologyDescriptor.numFaces");
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Warning: Subdivision process might lead to gaps in surface because vertex welding is disabled when subdividing on the GPU", v2, v3, v4, v5, v6);
}

{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Trying to subdivide a mesh that does not have exactly 1 position source.", v2, v3, v4, v5, v6);
}

void __C3DGeometryOsdGetPrimvarDataTypeHash_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Unreachable code: Could not find mesh source indexing info for source %p", v2, v3, v4, v5, v6);
}

void C3DGeometryOsdGetTextureCoordinatesDataType(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _Z68C3DSubdivCPUPrimvarDataCopyCrossNormalizedDataAtIndexToBufferAtIndexIDv2_fEvRNSt3__16vectorI16C3DSubdivCPUDataIT_ENS1_9allocatorIS5_EEEES9_iPfi_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Does not make sense", v2, v3, v4, v5, v6);
}

void C3DGeometrySubdivTopologyInfoInitCreasesAndCorners(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3DSubdivInitCPUPrimvarContext(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "currentIndex == topologyInfo->totalIndexCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Error while building face-varying channel.", a1);
}

void ___Z30C3DSubdivInitCPUPrimvarContextP26C3DSubdivCPUPrimvarContextPK26C3DGeometrySubdivisionInfoP9__C3DMesh_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_7_1();
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Semantic %d can not be a primvar", (uint8_t *)v1, 0x12u);
}

void C3DSubdivSourceGetPrimvarDataType()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_7_1();
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Semantic %d can not be a primvar", (uint8_t *)v1, 0x12u);
}

void __C3DSubdivFeedCPUPrimvar(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSubdivInitGPUPrimvarDescriptor(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "overallVertexIndex == topologyInfo->totalIndexCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Error while building face-varying channel.", a1);
}

void ___Z33C3DSubdivInitGPUPrimvarDescriptorP29C3DSubdivGPUPrimvarDescriptorPK26C3DGeometrySubdivisionInfoP9__C3DMesh_block_invoke_cold_1(uint8_t *a1)
{
  uint64_t v2 = scn_default_log();
  os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);
  *(_WORD *)a1 = 0;
  _os_log_error_impl(&dword_20B249000, v2, OS_LOG_TYPE_ERROR, "Unreachable code: Internal consistency error", a1, 2u);
  __break(1u);
}

void ___Z33C3DSubdivInitGPUPrimvarDescriptorP29C3DSubdivGPUPrimvarDescriptorPK26C3DGeometrySubdivisionInfoP9__C3DMesh_block_invoke_cold_2(char a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  C3DMeshSourceSemanticToSemanticString(a1);
  OUTLINED_FUNCTION_3_2();
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid GPU primvar semantic '%@'", v3, 0xCu);
}

void C3DSubdivComputeElementToFaceRangeTable(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "subdividedElementIndexForFace < subdividedElementCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Internal consistency error", a1);
}

void C3DSubdivComputeElementToPatchRangeTable(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Internal consistency error - Unexpected element type", buf, 2u);
}

void C3DSubdivCreateMesh(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "indexBufferIndex == indexBufferIndexCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Internal consistency error", a1);
}

void C3DSubdivCreateMesh()
{
  __assert_rtn("C3DSubdivCreateMesh", "C3DGeometryOpenSubdivSupportInternal.cpp", 1746, "faceVertexIndices.size() == 4");
}

{
  __assert_rtn("C3DSubdivCreateMesh", "C3DGeometryOpenSubdivSupportInternal.cpp", 1726, "faceVertexIndices.size() == 4");
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE11InterpolateEiPN10OpenSubdiv6v3_1_13Far14PrimvarRefinerEPNS4_15TopologyRefinerE_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _ZN23C3DSubdivCPUPrimvarDataIDv3_fE11InterpolateEiPN10OpenSubdiv6v3_1_13Far14PrimvarRefinerEPNS4_15TopologyRefinerE_cold_1()
{
  __assert_rtn("InterpolateVarying", "primvarRefiner.h", 407, "level>0 && level<=(int)_refiner._refinements.size()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner11InterpolateIP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS6_NS8_9allocatorIS6_EEEEEEviRKT_RT0__cold_1()
{
  __assert_rtn("Interpolate", "primvarRefiner.h", 268, "level>0 && level<=(int)_refiner._refinements.size()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner22InterpolateFaceVaryingIP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS6_NS8_9allocatorIS6_EEEEEEviRKT_RT0_i_cold_1()
{
  __assert_rtn("InterpolateFaceVarying", "primvarRefiner.h", 293, "level>0 && level<=(int)_refiner._refinements.size()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_1()
{
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_2()
{
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_1()
{
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner15interpFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1__cold_2()
{
}

void OpenSubdiv::v3_1_1::Sdc::Scheme<(OpenSubdiv::v3_1_1::Sdc::SchemeType)1>::ComputeVertexVertexMask<OpenSubdiv::v3_1_1::Vtr::internal::VertexInterface,OpenSubdiv::v3_1_1::Far::PrimvarRefiner::Mask>()
{
  __assert_rtn("assignSmoothMaskForVertex", "catmarkScheme.h", 182, "vertex.GetNumFaces() == vertex.GetNumEdges()");
}

{
  __assert_rtn("CombineVertexVertexMasks", "scheme.h", 289, "this->AreFaceWeightsForFaceCenters() == dst.AreFaceWeightsForFaceCenters()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_1()
{
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromEdgesILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_2()
{
  __assert_rtn("interpFVarFromEdges", "primvarRefiner.h", 822, "eFaceIndex == i");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_1()
{
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_2()
{
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner19interpFVarFromVertsILNS0_3Sdc10SchemeTypeE1EP16C3DSubdivCPUDataIDv2_fENSt3__16vectorIS8_NSA_9allocatorIS8_EEEEEEviRKT0_RT1_i_cold_3()
{
  __assert_rtn("interpFVarFromVerts", "primvarRefiner.h", 961, "pSibling == cSibling");
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE17CreateMeshSourcesERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEPNS4_14PrimvarRefinerEbPK22C3DSubdivisionSettingsP31C3DSubdivCPUMeshCreationContext_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE17CreateMeshSourcesERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEPNS4_14PrimvarRefinerEbPK22C3DSubdivisionSettingsP31C3DSubdivCPUMeshCreationContext_cold_2()
{
  __assert_rtn("CreateMeshSources", "C3DGeometryOpenSubdivSupportInternal.cpp", 463, "faceVertexCount == 4");
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE17CreateMeshSourcesERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEPNS4_14PrimvarRefinerEbPK22C3DSubdivisionSettingsP31C3DSubdivCPUMeshCreationContext_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _ZN23C3DSubdivCPUPrimvarDataIDv2_fE26_CreateMeshSourceForSourceERKN10OpenSubdiv6v3_1_13Far13TopologyLevelEbPK15__C3DMeshSourceP31C3DSubdivCPUMeshCreationContext_cold_1()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_0(&dword_20B249000, v0, v1, "Error: Position must be float3 to be subdivided. Actual type is %d", v2, v3, v4, v5, v6);
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner5limitILNS0_3Sdc10SchemeTypeE1ENSt3__16vectorI16C3DSubdivCPUDataIDv2_fENS6_9allocatorISA_EEEESD_SD_SD_EEvRKT0_RT1_PT2_PT3__cold_1()
{
  __assert_rtn("limit", "primvarRefiner.h", 1116, "tan1Mask.GetNumEdgeWeights() == tan2Mask.GetNumEdgeWeights()");
}

void _ZNK10OpenSubdiv6v3_1_13Far14PrimvarRefiner5limitILNS0_3Sdc10SchemeTypeE1ENSt3__16vectorI16C3DSubdivCPUDataIDv2_fENS6_9allocatorISA_EEEESD_SD_SD_EEvRKT0_RT1_PT2_PT3__cold_2()
{
  __assert_rtn("limit", "primvarRefiner.h", 1115, "tan1Mask.GetNumFaceWeights() == tan2Mask.GetNumFaceWeights()");
}

void OpenSubdiv::v3_1_1::Sdc::Scheme<(OpenSubdiv::v3_1_1::Sdc::SchemeType)2>::ComputeVertexLimitMask<OpenSubdiv::v3_1_1::Vtr::internal::VertexInterface,OpenSubdiv::v3_1_1::Far::PrimvarRefiner::Mask>()
{
  __assert_rtn("assignSmoothLimitMask", "loopScheme.h", 274, "valence != 2");
}

void C3DSkinnerSetOwnerNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DSkinnerUpdateBoundingBox_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DSkinnerUpdateBoundingBox - skinned node has no mesh", v2, v3, v4, v5, v6);
}

void _C3DSkinnerUpdateBoundingBox_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DSkinnerUpdateBoundingBox - skinned node has no position source", v2, v3, v4, v5, v6);
}

void _C3DSkinnerUpdateBoundingBox_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DSkinnerUpdateBoundingBox invalid mesh source", v2, v3, v4, v5, v6);
}

void _C3DSkinnerUpdateBoundingBox_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: We did not succeed in locating all the joints, so do not update the geometry as it might be worse if we use the wrong bones.", v2, v3, v4, v5, v6);
}

void __C3DSkinnerPrepareSkinnedMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DSkinnerPrepareSkinnedMesh_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DSkinnerPrepareSkinnedMesh_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unknown skinning calculation mode.", v2, v3, v4, v5, v6);
}

void __C3DSkinnerPrepareSkinnedMesh_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerGetEffectiveCalculationMode_cold_2()
{
  OUTLINED_FUNCTION_2();
}

void _computeJointMatrices_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "joint";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DSkinnerUpdateCurrentMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateCurrentMesh_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateCurrentMesh_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateCurrentMesh_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateCurrentMesh_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerGetSkinnedMeshLegacy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSkinnerUpdateJointsAndBoundingBox skinner has no mesh", v2, v3, v4, v5, v6);
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerUpdateJointsAndBoundingBox_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinnerAdjustTransformIfUsesNodeTransformCalculationMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DSkinnerFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Skinner deserialization: cannot find a joint", v2, v3, v4, v5, v6);
}

void _C3DSkinnerFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Skinner deserialization: cannot find the skin", v2, v3, v4, v5, v6);
}

void __EntryNumberCreate_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSkinner serialization: lib entry not found", v2, v3, v4, v5, v6);
}

void __EntryNumberCreate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __EntryForEntryNumber_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSkinner deserialization: lib entry not found", v2, v3, v4, v5, v6);
}

void __EntryForEntryNumber_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSkinner deserialization: Could not get a valid number value", v2, v3, v4, v5, v6);
}

void C3DSkinCreateWithSkinnableMesh_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinCopyInverseBindMatricesPtr_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinFillJointWeightsBuffers_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSkinFillJointWeightsBuffers_cold_2(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  uint64_t v2 = "count == dstJoints.count && (!dstWeights.ptr || (count == dstWeights.count))";
  __int16 v3 = 2080;
  uint64_t v4 = "C3DSkinFillJointWeightsBuffers";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. inconsistency in %s", (uint8_t *)&v1, 0x16u);
}

void _C3DSkinInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: No jointsCount in the skin %@", v2, v3, v4, v5, v6);
}

void _C3DSkinInitWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Unable to read the jointsCount in the skin %@", v2, v3, v4, v5, v6);
}

void _C3DSkinInitWithPropertyList_cold_3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: No inverseBindMatrices in the skin %@", v2, v3, v4, v5, v6);
}

void _C3DSkinInitWithPropertyList_cold_4()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: No defaultShapeMatrix in the skin %@", v2, v3, v4, v5, v6);
}

void _C3DSkinInitWithPropertyList_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DSkinCopyPropertyList_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: A vertex weight index does not fit on an int", buf, 2u);
}

void _C3DSkinFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Skin deserialization: no weightsCount in %@", v2, v3, v4, v5, v6);
}

void _C3DSkinFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Skin deserialization: no jointsForVertexWeights in %@", v2, v3, v4, v5, v6);
}

void _C3DSkinFinalizeDeserialization_cold_3()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: Skin deserialization: no vertexWeights in %@", v2, v3, v4, v5, v6);
}

void _C3DSkinFinalizeDeserialization_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DSkinFinalizeDeserialization_cold_5(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Skin: Could not remap the ID for geometry %d", (uint8_t *)v3, 8u);
}

void _C3DSourceAccessorInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: GenericSource deserialize => no data type", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorInitWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: GenericSource deserialize => no count, bailing out", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorInitWithPropertyList_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: GenericSource deserialize => no comp/value, bailing out", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorInitWithPropertyList_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: GenericSource deserialize => no padding, bailing out", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorInitWithPropertyList_cold_7(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DSourceAccessorInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void _C3DSourceAccessorCopyPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Accessor serialization failed", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorCopyPropertyList_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not serialize the accessor's type", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorCopyPropertyList_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: accessor->_count too big", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorCopyPropertyList_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: accessor->_offset too big", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorCopyPropertyList_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: accessor->_padding too big", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Accessor deserialization: : no serialized data", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorFinalizeDeserialization_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Accessor deserialization: Could not find the source ID", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorFinalizeDeserialization_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Accessor deserialization: Could not find a valid source type", v2, v3, v4, v5, v6);
}

void _C3DSourceAccessorFinalizeDeserialization_cold_4(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Accessor deserialization: Could not remap the ID for source %d", (uint8_t *)v1, 8u);
}

void _C3DSourceAccessorFinalizeDeserialization_cold_5(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Accessor deserialization: Could not remap the ID for source %d", (uint8_t *)v2, 8u);
}

void C3DSourceAccessorGetData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSourceAccessorGetValuePtrAtIndex_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DSourceAccessorGetValuePtrAtIndex - no data", v2, v3, v4, v5, v6);
}

void C3DSourceAccessorGetValuePtrAtIndex_cold_2()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: C3DSourceAccessorGetValuePtrAtIndex - index out of bounds : %d > %d", v2, v3);
}

void C3DSourceAccessorGetMutableValuePtrAtIndex_cold_1()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: C3DSourceAccessorGetMutableValuePtrAtIndex - index out of bounds : %d > %d", v2, v3);
}

void C3DSourceAccessorGetVolatileValuePtrAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSourceAccessorGetVolatileValuePtrAtIndex_cold_2()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: C3DSourceAccessorGetVolatileValuePtrAtIndex - index out of bounds : %d > %d", v2, v3);
}

void C3DSourceAccessorCopyDataToAccessor_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: The destination does not have enough room to copy this data", v2, v3, v4, v5, v6);
}

void C3DSourceAccessorCopyDataToAccessor_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: error in C3DSourceAccessorCopyDataToAccessor", v2, v3, v4, v5, v6);
}

void _C3DGenericSourceInitWithPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: ERROR: GenericSource deserialize => no data type, bailing out", v2, v3, v4, v5, v6);
}

void _C3DGenericSourceInitWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: ERROR: GenericSource deserialize => no count, bailing out", v2, v3, v4, v5, v6);
}

void _C3DGenericSourceInitWithPropertyList_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: ERROR: GenericSource deserialize => no stride, bailing out", v2, v3, v4, v5, v6);
}

void _C3DGenericSourceInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DGenericSourceInitWithPropertyList_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not deserialize an accessor", v2, v3, v4, v5, v6);
}

void _C3DGenericSourceInitWithPropertyList_cold_6(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DGenericSourceInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void _C3DGenericSourceCopyPropertyList_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not serialize an accessor", v2, v3, v4, v5, v6);
}

void _C3DGenericSourceFinalizeDeserialization_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot finalize the deserialization of mesh source: accessor data missing", v2, v3, v4, v5, v6);
}

void C3DGenericSourceCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGenericSourceSetData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGenericSourceSetData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGenericSourceSetVolatileData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGenericSourceSetVolatileData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGenericSourceCreateDeserializedDataWithAccessors_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "C3DSourceAccessorGetSource(accessor) == (C3DGenericSourceRef) genericsource";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. This accessor doesn't point back to the primary source", buf, 0xCu);
}

void C3DResourceCacheCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DResourceCacheCopyResourceOrCreateIfNeededForSource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DResourceCacheCopyResourceOrCreateIfNeededForSource_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DResourceCacheCopySourceForResource_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::DrawNodesPass::setup(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::DrawNodesPass::_renderEye(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::DrawNodesPass::_setupPointOfView(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::DrawNodesPass::_setupPointOfViewMatrices(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationGroupAddAnimation_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationGroupAddAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationGroupAddAnimations_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationGroupCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationGroupInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Could not deserialize an animation: animation not found in %@", (uint8_t *)&v2, 0xCu);
}

void _C3DAnimationGroupInitWithPropertyList_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Could not deserialize an animation: targetPath not found in %@", (uint8_t *)&v2, 0xCu);
}

void _C3DAnimationGroupInitWithPropertyList_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationGroupInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationGroupInitWithPropertyList_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationGroupCopyPropertyList_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: _C3DAnimationChannelCopyPropertyList - no target path", buf, 2u);
}

void C3D::SSAOUpSamplePass::execute(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: No point of view set for tone mapping pass", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: No camera set for tone mapping pass", v1, 2u);
}

void C3D::JitteringPass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___Z90C3DWrapDeformerComputeSharedBindingPointIndicesAndBarycentricCoordsFromSandwichedPositions34SCNGeometryWrapDeformerBindingMode13simd_float4x4jP9__C3DMeshS2_S2_PK15__C3DMeshSourceS5_S5_ll38SCNWrapDeformerBarycentricCoordsPolicyPhPtPjPfS8_SA_PSA_SB_PmSB_SB_SC__block_invoke_2_cold_1()
{
  __assert_rtn("C3DWrapDeformerComputeSharedBindingPointIndicesAndBarycentricCoordsFromSandwichedPositions_block_invoke_2", "SCNGeometryWrapDeformerUtils.mm", 1055, "faceVertexCount == 4");
}

void __adjustDistanceByAligningProjection()
{
}

void ___ZL10__bindToUVDv2_fP9__C3DMeshPK15__C3DMeshSourceS4_llPDv3_fS6_PDv3_j_block_invoke_cold_1()
{
  __assert_rtn("__bindToUV_block_invoke", "SCNGeometryWrapDeformerUtils.mm", 193, "faceVertexCount == 4");
}

void __computeBarycentricCoordinates2D()
{
}

void C3D::ScenePass::setup(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "previousFilterPass";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3D::ScenePass::_shouldPushNodeToVisible(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Top level filtered node must have a filter", a5, a6, a7, a8, 2u);
}

void C3DParametricGeometryGeneratePoints_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: NOT IMPLEMENTED YET", v1, 2u);
}

void C3DParametricGeometryValidate_cold_1()
{
  __assert_rtn("_C3DParametricGeometryCreateCacheHash_not_thread_safe", "C3DParametricGeometry.c", 175, "size <= sizeof(C3DParametricGeometryType) + sizeof(C3DParametricGeometryParameters)");
}

void C3DParametricGeometryGetType_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: C3DParametricGeometryGetType - unknown type", v1, 2u);
}

void C3DParametricGeometryGetChamferRadius_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DParametricGeometryCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParametricGeometryCopy_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DParametricGeometryCacheIncrRetainCountForHash_not_thread_safe_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DParametricGeometryIsHemispheric_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DParametricGeometryReleaseCachedMesh_not_thread_safe_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGLSLProfileBindProfileInputs_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DGLSLProfileBindProfileInputs - profile has no technique", v1, 2u);
}

void C3DValueSetValueFromString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DValueConcat_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DValueConcat_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DValueConcat_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DValueConcat_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DValueConcat_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXSamplerSetTextureSampler_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIOFinalizeLoadScene_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: __OptimizeMesh:bytesPerIndex != 1, 2, or 4 during conversion, this should not happen !!", buf, 2u);
}

void C3D::CIFilterPass::execute(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DIOCreateSceneWithData_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: This file cannot be opened (version is too old)", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: This file cannot be opened (version of this c3d is too recent for this version of the framework)", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot get the library in the serialized data", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot finalize scene deserialization", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot initialize scene", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: cannot initialize library", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not find the zipped data", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not unzip the zipped data", v2, v3, v4, v5, v6);
}

void _C3DIOCreateSceneWithData_cold_9(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Error loading the unzipped data: %@", (uint8_t *)&v3, 0xCu);
}

void _C3DCreatePropertyListFromScene_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not get the data for the serialized property list", v2, v3, v4, v5, v6);
}

void _C3DCreatePropertyListFromScene_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: can't serize plist :%@", (uint8_t *)&v2, 0xCu);
}

void _C3DCreatePropertyListFromScene_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Could not zip the serialized property list", v2, v3, v4, v5, v6);
}

void C3DEntityRemoveAllAnimations_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DEntityCFInit_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: _C3DEntityCFInit", v1, 2u);
}

void _C3DEntityCFFinalize_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: _C3DEntityCFFinalize", v1, 2u);
}

void C3DEntityGetAttribute_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEntityInitWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "C3DEntityInitWithPropertyList";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid propertylist in %s", (uint8_t *)&v1, 0xCu);
}

void __CFTypeIsC3DEntity_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DEntityGetSubAttributeOrderedDictionary_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEntityRemoveBindingWithKeyPath_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEntityAddAction_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEntitySetValueForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineNotificationQueueEnqueueEvent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineNotificationQueueEnqueueEvent_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineNotificationQueueStartObserving_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __EnqueueNotification_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unknown notification name", v1, 2u);
}

void C3DDynamicBatchingSystemSetMaxBatchSize_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "dynamicBatchingSystem->_currentBatchInstancesCount == 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Can't change max batch size while in batch", (uint8_t *)&v1, 0xCu);
}

void _initializeRenderFromLightPass_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _initializeRenderFromLightPass - no light", v2, v3, v4, v5, v6);
}

void _initializeDeferredShadows_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _initializeDeferredShadows - no light", v2, v3, v4, v5, v6);
}

void _willExecuteDeferredShadows_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _willExecuteDeferredShadows - no light", v2, v3, v4, v5, v6);
}

void _setupDeferredShadows_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _setupDeferredShadows - no light", v2, v3, v4, v5, v6);
}

void ___ZL21SCNLoadUsdKitIfNeededv_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Could not load UsdKit", v1, 2u);
}

void __morphWeightsHaveChanged_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMorphUpdateCPUMeshIncrementally_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "element";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __blendsparse_dst_float_src_float_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMorphGetWeightCount_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMorphConvertToSparse_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "morph->_calculationMode == kC3DMorpherCalculationModeAdditive";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. sparse targets should be in additive mode", a1);
}

void C3DMorphConvertToSparse_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DMeshGetElementsCount(targetMesh) == 1";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. sparse target should only contain 1 mesh element", a1);
}

void C3DMorphConvertToSparse_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "channels[i] == channels[0]";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. It doesn't make sense to call C3DMeshElementCreateIntervalList for sources with different channels", a1);
}

void C3DMorphGetIndexOfTargetWithName_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "name";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void _C3DMorphInitWithPropertyList_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMorphInitWithPropertyList_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMorphInitWithPropertyList_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMorphFinalizeDeserialization_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Could not remap the ID for mesh %d", (uint8_t *)v3, 8u);
}

void _C3DMorphFinalizeDeserialization_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Could not remap the ID for weights source %d", (uint8_t *)v3, 8u);
}

void __evaluateRuntimeWeightsForInBetween_cold_1(int a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Internal consistency error. There should be %d runtime morph target weights, but we the current morph weight index is %d.", (uint8_t *)v3, 0xEu);
}

void C3DMorpherBeginIncrementalPass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMorpherPrepareMorphedMesh_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "_C3DMorpherPrepareMorphedMesh";
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: %s should never be called when using the new deformer pipeline", (uint8_t *)&v1, 0xCu);
}

void _C3DMorpherFinalizeDeserialization_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMorpherFinalizeDeserialization_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DMorpherFinalizeDeserialization_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXContextSetPostProcessTechnique_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXContextIsMainPass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXContextGetCurrentPassInstance_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXContextSetup_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: _C3DFXSetupPasses : no context", v2, v3, v4, v5, v6);
}

void __C3DFXContextSetup_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: shadows are only supported by spot lights and directional lights", v2, v3, v4, v5, v6);
}

void C3DEngineContextRenderSubTechnique_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "pass->_drawInstruction != kC3DFXDrawScene";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. sub techniques of type draw scene is not supported", a1);
}

void C3DEngineContextRenderSubTechnique_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DEngineContextRenderSubTechnique_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DEngineContextRenderPassInstance_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DEngineContextRenderTechnique - unknown draw instruction", v2, v3, v4, v5, v6);
}

void __C3DEngineContextRenderPassInstance_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: pass %@ has no program set", (uint8_t *)&v2, 0xCu);
}

void __C3DEngineContextRenderPassInstance_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DEngineContextRenderPassInstance_cold_4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DFXRenderPassWillExecute: invalid framebuffer", v2, v3, v4, v5, v6);
}

void __C3DEngineContextRenderPassInstance_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: failed to bind program for pass %@", (uint8_t *)&v2, 0xCu);
}

void __appendTechnique_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "store";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __appendTechnique_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "pipeline";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __appendTechnique_cold_3(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "scene";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DEngineContextRenderMainTechnique_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "passInstance";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DEngineContextRenderMainTechnique_cold_2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "engineContext";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void C3DEngineContextRenderMainTechnique_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXContextSetCurrentColor_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXContextSetCurrentDepth_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3D::CustomPass::name(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "_fxPass";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Override custom pass name if it doesn't have any fxPass", (uint8_t *)&v1, 0xCu);
}

void C3D::CustomPass::execute(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "_fxPass";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Override custom pass execute if it doesn't have any fxPass", (uint8_t *)&v1, 0xCu);
}

void __HandleProfileWillDieNotification_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXGLSLProgramSetUniformIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXGLSLProgramSetUniformIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXGLSLProgramSetAttributeIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DVertexAttribFromParameterSemantic_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererDelegateCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererDelegateFireWithNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNMTLTexturePool::allocate(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Could not create texture with descriptor : %@", (uint8_t *)&v2, 0xCu);
}

void SCNMTLTexturePool::allocateWithStagingBuffer(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "(tex.pixelFormat == MTLPixelFormatR16Uint) || (tex.pixelFormat == MTLPixelFormatRG16Uint) || (tex.pixelFormat == "
       "MTLPixelFormatRGBA16Uint)";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Only uint16 format are supported for the compute path of the copy buffer to texture", (uint8_t *)&v3);
}

void SCNMTLTexturePool::free(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Wrong texture given to the cache %@", (uint8_t *)&v2, 0xCu);
}

void SCNMTLComputeCommandEncoder::dispatchOnGrid3D(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "_computePipelineState";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void __ReplaceCodeWithModifiers_cold_1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Invalid shader modifier : no code provided", buf, 2u);
}

void _willExecuteDof_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: DOF pass: no point of view", v1, 2u);
}

void _willExecuteDof_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: DOF pass: no camera", v1, 2u);
}

void C3DExecuteProgressBlocks_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "progress.fractionCompleted <= 1.0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Progress fraction is greater than 1.0", buf, 0xCu);
}

void C3DExecuteProgressBlocks_cold_2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "progress == nil || (progress == [NSProgress currentProgress])";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Progress not current.", buf, 0xCu);
}

void C3DExecuteIncrementalProgressBlock_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DExecuteIncrementalProgressBlock_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DExecuteIncrementalProgressBlock_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _createSCNGeometrySubArrayFromC3DGeometryArray_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DProgramHashCodeCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DProgramHashCodeCFFinalize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __UpdateHashCodeWithTextureType_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DProgramHashCodeGetUVSetInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DProgramHashCodeGetCustomSlotSortedName_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: invalid custom texture slot.", v1, 2u);
}

void C3DProgramHashCodeCreate_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "programHashCode->_desc.effectSlotsHash[i] <= ((1 << (kC3DEffectSlotHashIndexMax + 1)) - 1)";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. effect slot hash out of bounds", buf, 0xCu);
}

void C3DResourceManagerRegistryReleaseContext_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  int v2 = "retainCount >= 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DResourceManagerRegistryReleaseContext invalid retainCount", (uint8_t *)&v1, 0xCu);
}

void C3DTransactionCheckUncommitted_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionCheckUncommitted_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Transaction stack contains an uncommited transaction.", v2, v3, v4, v5, v6);
}

void C3DTransactionCheckUncommitted_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Unflushed transaction present.", v2, v3, v4, v5, v6);
}

void C3DTransactionFlush_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionCommit_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DTransactionCommit - transaction already committed", v2, v3, v4, v5, v6);
}

void C3DTransactionCommit_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: unexpected transaction commit (missing begin?)", v2, v3, v4, v5, v6);
}

void C3DTransactionCommit_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionTestForDidComplete_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: C3DTransactionRemoveChild - inconsistency", v2, v3, v4, v5, v6);
}

void C3DTransactionTestForDidComplete_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionTestForDidComplete_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionAllowImmediate_cold_1(id *a1, id **a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  ObjCWrapper = C3DEntityGetObjCWrapper(a1);
  uint8_t v6 = C3DEntityGetObjCWrapper(*a2);
  int v7 = 138412546;
  __int16 v8 = ObjCWrapper;
  __int16 v9 = 2112;
  int v10 = v6;
  _os_log_error_impl(&dword_20B249000, a3, OS_LOG_TYPE_ERROR, "Error: Scene %@ is modified within a rendering callback of another scene (%@). This is not allowed and may lead to crash", (uint8_t *)&v7, 0x16u);
}

void C3DTransactionAnimationDidComplete_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionAnimationDidInterrupt_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionAddCommandBlock_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransactionAddCommandBlock_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CPP3DAudioContext::Init(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "mainMixerNode";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void CPP3DAudioEngine::GetAVEngine(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Error starting the audio engine: %@", (uint8_t *)&v4, 0xCu);
}

void __appendVerticesAndIndices_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendVerticesAndIndices_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendVerticesAndIndices_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendVerticesAndIndices_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendVerticesAndIndices_cold_5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Cannot append manipulator vertex data because we encountered an overflow and we are not allowed to flush", v2, v3, v4, v5, v6);
}

void __createGLInfoIfNeeded_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __createGLInfoIfNeeded_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unknown use of manipulators", v2, v3, v4, v5, v6);
}

void __createGLInfoIfNeeded_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendRect2D_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __appendRect2D_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAuthoringEnvironmentBeginTimedRecord_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __displayRangeTimeRecord_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. start != end", a5, a6, a7, a8, 2u);
}

void __createAlphabetTextureIfNeeded_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Unable to create context", v2, v3, v4, v5, v6);
}

void __AppendArgument_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Argument type not supported %d", (uint8_t *)v2, 8u);
}

void __UnifyModifierVaryings_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "modifier";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Null argument", a1);
}

void __InjectModifiers_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: Invalid shader modifier : no code provided", v2, v3, v4, v5, v6);
}

void __InjectModifiers_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIOCopyURLForInitialURL_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Unable to resolve URL %@", buf, 0xCu);
}

void C3DAvoidOccluderConstraintDelegateCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAvoidOccluderConstraintDelegateShouldAvoidOccluder_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DGlyphCreate_cold_1()
{
  __assert_rtn("C3DGlyphCreate", "C3DGlyph.c", 44, "shapeParams.cgPath == NULL");
}

void C3DCreateProgram_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _create_and_compile_shader_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _create_and_compile_shader_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DRasterizerStatesCFFinalize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DRasterizerStatesCFFinalize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRasterizerStatesGetDesc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DShapeBuildConnectedComponents_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "boundaryCount > 1";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. realloc has an allocation size of 0 bytes", buf, 0xCu);
}

void C3DAppendPointToPath_cold_1()
{
  __assert_rtn("C3DAppendPointToPath", "C3DShapeUtils.c", 443, "origin != C3DShapeVertexOriginCurveStart");
}

void C3DParticleModifier_PhysicsField_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DParticleModifier_PhysicsField - no aether", v1, 2u);
}

void C3DShapeTriangulationGetNewTriangle_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "triangulation->triangleCount < triangulation->maxTriangleCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Cannot produce any additional triangle.", (uint8_t *)&v1, 0xCu);
}

void C3DShapeTriangulationTriangleContainingPoint_cold_1()
{
}

void C3DShapeTriangulationTriangleContainingPoint_cold_2()
{
}

void C3DPointFallsOnTriangleEdgeAndLinks_cold_1()
{
}

void C3DVertexNotSharedByTriangles_cold_1()
{
}

void C3DVertexNotSharedByTriangles_cold_2()
{
}

void C3DVertexNotSharedByTriangles_cold_3()
{
}

void C3DShapeConnectedComponentTriangulatePseudopolygon_cold_1()
{
}

void C3DShapeConnectedComponentTriangulatePseudopolygon_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DShapeConnectedComponentTriangulatePseudopolygon - neighbor index out of bounds", v1, 2u);
}

void C3DShapeTriangulationAddEdge_cold_1()
{
  __assert_rtn("C3DShapeTriangulationAddEdge", "C3DShapeTriangulation.c", 846, "recycledTriangles.count == 0");
}

void C3DSpokeCreate_cold_1()
{
  __assert_rtn("C3DSpokeCreate", "C3DShapeStraightSkeleton.c", 382, "CGPointEqualToPoint(origin, prev) == false");
}

void C3DSpokeCreate_cold_2()
{
  __assert_rtn("C3DSpokeCreate", "C3DShapeStraightSkeleton.c", 383, "CGPointEqualToPoint(origin, next) == false");
}

void C3DSpokeCreate_cold_3()
{
}

void C3DSpokeCreate_cold_4()
{
}

void intersectionForSpokeAndSpoke_cold_1()
{
}

void intersectionForSpokeAndSpoke_cold_2()
{
}

void intersectionForSpokeAndEdge_cold_1()
{
  __assert_rtn("intersectionForSpokeAndEdge", "C3DShapeStraightSkeleton.c", 476, "spoke != edgeStart");
}

void intersectionForSpokeAndEdge_cold_2()
{
  __assert_rtn("intersectionForSpokeAndEdge", "C3DShapeStraightSkeleton.c", 477, "spoke != edgeEnd");
}

void splitJoinFace_cold_1()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 754, "spoke->boundaryOfVerticesIndex != INVALID_INDEX");
}

void splitJoinFace_cold_2()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 755, "other->boundaryOfVerticesIndex != INVALID_INDEX");
}

void splitJoinFace_cold_3()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 769, "d != INVALID_INDEX");
}

void splitJoinFace_cold_4()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 770, "f != INVALID_INDEX");
}

void splitJoinFace_cold_5()
{
  __assert_rtn("splitJoinFace", "C3DShapeStraightSkeleton.c", 749, "event.type == C3DStraightSkeletonEventSplit");
}

void C3DOffsetBuild_cold_1()
{
  __assert_rtn("C3DOffsetBuild", "C3DShapeStraightSkeleton.c", 1026, "newFace.boundaries == NULL");
}

void C3DOffsetBuild_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "bestSplitEvents";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", (uint8_t *)&v1, 0xCu);
}

void C3DRenderBufferGetSlotForOutputBufferType_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: C3DRenderBufferGetSlotForOutputBufferType : unsupported type %d", (uint8_t *)v2, 8u);
}

void __C3DShaderModifierCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DShaderModifierCreate_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: modifier without code is invalid", v1, 2u);
}

void C3DShaderModifierGetDeclaration_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNCopyValueFromObjCValue_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: unexpected value (%@)", (uint8_t *)&v2, 0xCu);
}

void SCNCopyValueFromObjCProperty_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: unexpected returned value for property %@ of object %@", (uint8_t *)&v3, 0x16u);
}

void SCNObject_resolveInstanceMethod_cold_1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: can't generate implementation for property of type %d", (uint8_t *)v2, 8u);
}

void __analyseUniformDeclaration_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: syntax error in the uniform declaration : %@", (uint8_t *)&v2, 0xCu);
}

void C3DConstraintControllerInitializeConstraint_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DConstraintApply_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DConstraintApplyIK_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DConstraintApplyIK root and leaf nodes are the same node", v1, 2u);
}

void C3DConstraintApplyIK_cold_2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DConstraintApplyIK leef is not a child of root", v1, 2u);
}

void C3DConstraintApplyIK_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DConstraintManagerSetConstraintsForKey_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "path";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void C3DModelPathResolveCommonProfileProperty_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: C3DModelPathResolveCommonProfileProperty unknown path %@", v2, v3, v4, v5, v6);
}

void C3DModelPathResolveCommonProfileProperty_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveCommonProfileTexture unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveColor4_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveColor4 unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveMatrix_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveMatrix unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveTransform_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveTransform unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolverRegistryResolveSubPath_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveVector4 unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveVector3_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveVector3 unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolverRegistryResolvePathWithClassName_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolverRegistryResolvePathWithClassName unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveEntity_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DModelPathResolveNode_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveNode unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveMorph_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveMorpher unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolverRegistryResolveKeyAndSubscriptIndexWithClassName_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Unreachable code: Support for subscript model path is not implemented for %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveMorphKeyAndSubscriptIndex_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveMorpher unknown key subscript %@[%ld]");
}

void _C3DModelPathResolveMorphKeyAndSubscriptKey_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_0(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveMorpher unknown key subscript %@[%@]");
}

void C3DModelPathResolverRegisterProperty_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "CFDictionaryGetCountOfKey(_currentClassRegistry, propertyName) == 0";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Cannot register twice the same propertyName : %@", (uint8_t *)&v2, 0x16u);
}

void C3DModelPathResolverRegisterProperty_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DModelPathResolveRotation_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveRotation unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveDynamicParameter_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveDynamicParameter unknown path %@", v2, v3, v4, v5, v6);
}

void _C3DModelPathResolveArray_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DModelPathResolveArray_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DModelPathResolveCommonProfile_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _C3DModelPathResolveCommonProfile unknown path %@", v2, v3, v4, v5, v6);
}

void C3DModelTargetGetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SCNVideoTextureSourceCreateMetalTexture_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Invalid pixel buffer pixel format: %s", (uint8_t *)&v2, 0xCu);
}

void SCNVideoTextureSourceCreateMetalTexture_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: CVMetalTextureCacheCreateTextureFromImage failed with status %d", (uint8_t *)v2, 8u);
}

void C3DModelValueStorageItemRelease_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DModelValueStorageAddAndRetainModelValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DModelValueStorageAddAndRetainModelValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DModelValueStorageUpdateModelValueFromPresentationValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DModelValueStorageGetModelValueForAddressIfAny_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DModelValueStorageUpdateItemModelValueWithValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformTreeAddNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DTransformTree::add(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DTransformTree::remove(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_handles[ node->_transformHandle ].index >= minIndexToDestroyPerLevel[ l ]";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_handles[ node->_transformHandle ].level == l";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "firstChildToRemainAfterDeletion != INT32_MAX";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "lastChild.index >= firstChild.index";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "lastChild.level == firstChild.level";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "lastChild.index != kC3DTransformIndexInvalid";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "firstChild.index != kC3DTransformIndexInvalid";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Null argument", a1);
}

void __C3DTransformTree::remove()
{
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_2_1(&dword_20B249000, v0, v1, "Assertion '%s' failed. invalid handle (%d) given", v2, v3, v4, v5, v6);
}

void __C3DTransformTree::update(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformTreeUpdateCullingHandle_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DTransformTree::_fixupParentAndSiblings(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformLevel::moveData(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. can't move negative number of data", a5, a6, a7, a8, 2u);
}

void C3DTransformLevel::offsetChildIndices(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DTransformTree::_findFirstChildInRange(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void getFloat(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void computeFilterPos(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "end != index - 1";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

{
  *(_DWORD *)buf = 136315138;
  *a2 = "start != index";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Null argument", buf, 0xCu);
}

void computeFilterPos(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void getCandelaValue(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", a5, a6, a7, a8, 2u);
}

void C3DIESInfoGenerateTexture2D_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIESInfoGenerateTexture2D_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIESInfoGenerateTexture2D_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationEventsAddEvent_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAnimationEventsAddEvent_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimationEventsTriggerEventsWithTimeChanges_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "index < events->_eventCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. _C3DAnimationEventsTriggerEventAtIndex - index out of bounds", buf, 0xCu);
}

void _C3DAnimationEventsTriggerEventsWithTimeChanges_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __C3DRendererElementStoreDeallocateSpan_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStoreAllocateSpanForNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AllocateSpansAndInitializeRendererElementsForNodeGeometryLOD_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStoreDeallocateSpanForNode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStoreDeallocateSpanForNode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DRendererElementStoreGetElementInSpanAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DIndexStoreGetIndexForKey_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _getNextFreeIndex_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: indexstore::_getNextFreeIndex - no more free index", v1, 2u);
}

void C3DIndexStoreGetOrderedIndexForKey_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "alignedIndex >= 0 && alignedIndex < bufferLength";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DIndexStoreGetOrderedIndexForKey index out of bounds", buf, 0xCu);
}

void C3DAllocatorNew_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DAllocatorDelete_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DAllocatorDelete - unknown address", v1, 2u);
}

void _pipelineDescriptorForPipelineDesc_cold_1()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
}

void _pipelineDescriptorForPipelineDesc_cold_2()
{
  OUTLINED_FUNCTION_3_4(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_2_5();
}

void _pipelineDescriptorForPipelineDesc_cold_3()
{
  OUTLINED_FUNCTION_4_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_6();
}

void _pipelineDescriptorForPipelineDesc_cold_4()
{
  OUTLINED_FUNCTION_4_5(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_3_6();
}

void C3DMeshBuildRenderableData_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: Failed to build renderable data for mesh %p", (uint8_t *)&v2, 0xCu);
}

void C3DMeshBuildRenderableData_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshBuildRenderableData_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DMeshBuildRenderableData_cold_5(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: Inconsistent index count after triangulation.", buf, 2u);
}

void C3DMeshBuildRenderableData_cold_6(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "__C3DMeshElementCreateRenderablePrimitiveTypeCopy";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: %s - Invalid polygon edge count (%u)", (uint8_t *)&v2, 0x12u);
}

void C3DMeshBuildRenderableData_cold_7()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_2_9();
  int v2 = "__C3DMeshElementCreateRenderablePrimitiveTypeCopy";
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s - Cannot create a renderable topology from indexed vertices", (uint8_t *)v1, 0x16u);
}

void __C3DMeshDeindex(unsigned __int8 a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Requested channel (%d) does not exist in element (%p)", (uint8_t *)v3, 0x12u);
}

void __C3DMeshDeindex(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_0(&dword_20B249000, a1, a3, "Assertion '%s' failed. Deindexing failed - Count of deindexed mesh sources does not match count of indexed mesh sources", a5, a6, a7, a8, 2u);
}

void __C3DMeshDeindex(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "overallVertexIndex == (CFIndex)effectiveIndexCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Deindexing failed - Vertex count inconsistency", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "value == sourceInfo.dataVectorCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Deindexer failed - Hash value inconsistency", a1);
}

{
  *(_DWORD *)a1 = 136315138;
  *a2 = "indexBufferWriteOffset == effectivePrimitiveCount * bytesPerIndex";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Deindexing failed - Polygon edge counts inconsistency", a1);
}

void __writeIndexInBuffer()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_3_7();
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s - unsupported index size (%ld)", (uint8_t *)v1, 0x20u);
}

void __C3DMeshDeindexerKeyComparator::operator()(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __readIndexInBuffer()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_3_7();
  _os_log_fault_impl(&dword_20B249000, v0, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. %s - unsupported index size (%ld)", (uint8_t *)v1, 0x20u);
}

void C3D::ConvertCubeComputePass::compile(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  __int16 v4 = "computeFunction";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

void C3DAnimatableParamControllerGetParamDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _C3DAnimatableParamControllerSetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __allocateChunk()
{
}

{
  __assert_rtn("__allocateChunk", "C3DStackAllocator.cpp", 39, "n");
}

{
  __assert_rtn("__allocateChunk", "C3DStackAllocator.cpp", 43, "chunk->data");
}

void C3DStackAllocatorAllocateAligned_cold_1()
{
}

void C3DStackAllocatorAllocateAligned_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "allocator->_framesCount > 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. You have to push frames before allocating memory.", (uint8_t *)&v1, 0xCu);
}

void C3DStackAllocatorPushFrame_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: C3DStackAllocator: Max Restore Points reached!!!!", v1, 2u);
}

void C3DStackAllocatorPopFrame_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "allocator->_framesCount > 0";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. C3DStackAllocator: You cannot pop frames without pushing first.", (uint8_t *)&v1, 0xCu);
}

void C3DCullingContextForcePushGeometryRenderableElementsToVisible_cold_2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "sequence->count + count <= sequence->allocatedCount";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Not enough space allocated", buf, 0xCu);
}

void __shouldPushRenderableElementsToVisible_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingContextSetupLOD_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingContextSetupPointOfViewMatrices_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingContextSetupCullingMatricesAndPlanes_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingContextInitialize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DCullingContextInitialize_cold_3(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "passInstance->_cullingData[eye] == NULL";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. leaking culling data", buf, 0xCu);
}

void C3DFXMetalProgramUpdateHashWithCommonProfileHashCode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXMetalProgramGetHash_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __updateRequireLighting_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassSetupWithPropertyList_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 4;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: too many blend states: max render target is %d", (uint8_t *)v1, 8u);
}

void C3DFXPassSetupWithPropertyList_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: unknown cull mode named %@", v2, v3, v4, v5, v6);
}

void _depthFuncNameToDepthFunc_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: unknown depth comparison function named %@", v2, v3, v4, v5, v6);
}

void _parseTargets_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _bufferTypeFromName - unknown output type: %@", v2, v3, v4, v5, v6);
}

void C3DFXPassAddInputWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassInitialize_cold_1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "input->_semantic != kC3DFXSemanticNone";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. attributes should have a semantic", buf, 0xCu);
}

void C3DFXPassInitialize_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassInitialize_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassInitialize_cold_4()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: failed to load program %@", v2, v3, v4, v5, v6);
}

void C3DFXPassInitialize_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassInitialize_cold_6(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 56);
  uint64_t v2 = *(void *)(*(void *)a1 + 64);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v2;
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Error: failed to load program %@ %@", (uint8_t *)&v4, 0x16u);
}

void C3DFXPassInitialize_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassAddInputsWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertInputsDescriptionToInputs_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DFXPassAddOutputsWithDescription_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _convertOutputsDescriptionToOutputs_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: _convertOutputsDescriptionToOutputs - unknown output type: %@", v2, v3, v4, v5, v6);
}

void __RendererElementWillDie_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _blendFactorFromString_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: unknown blend factor named %@", v2, v3, v4, v5, v6);
}

void _blendOpFromString_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: unknown blend op named %@", v2, v3, v4, v5, v6);
}

void _setupInput_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: description for input named %@ is missing", v2, v3, v4, v5, v6);
}

void _setupInput_cold_2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: 'type' is required for symbol %@", v2, v3, v4, v5, v6);
}

void _setupInput_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBlendFactorToString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBlendOpToString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBlendStatesGetDesc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DBlendStatesGetDesc_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _updateMatrix_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _updateMatrix_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _updateAffine_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _updateAffine_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _updateAffineScale_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _updateAffineScale_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformSetScale_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformSetScale_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DTransformGetValue_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DTransformGetValue - unexpected semantic", v1, 2u);
}

void C3DTransformGetValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __setQuaternionValue_cold_1()
{
  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_3_0(&dword_20B249000, v0, v1, "Error: C3DTransformSetValue unexptected component index %d", v2, v3, v4, v5, v6);
}

void __setQuaternionValue_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __setValueError_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: C3DTransformSetValue - unexpected semantic", v1, 2u);
}

void C3DTransformSetValue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ____arrayOfC3DModifiersFromDictionary_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_1_4(&dword_20B249000, v0, v1, "Error: ShaderModifiers - unkwnown entrypoint '%@'", v2, v3, v4, v5, v6);
}

void C3DArrayGetCount_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DArrayGetValuePtrAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CATextTruncationModeFromC3DTextTruncationMode_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: CATextAlignmentModeFromC3DTextAlignmentMode unknown mode", v1, 2u);
}

void __AddToFreeList_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AddToFreeList_cold_2(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "(freeSpan->start.index + freeSpan->count) <= page->capacity";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. page overflow", buf, 0xCu);
}

void __AddToFreeList_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AllocateNewSpanInPage_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __AllocateNewSpanInPage_cold_3(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "spanSize <= page->freeMaxSpan";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. wrong page selected for span size %d", (uint8_t *)&v2, 0x12u);
}

void __AllocateNewSpan_cold_1(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = 0x10000;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Error: RendererElementStore does not support span of more than %d", (uint8_t *)v1, 8u);
}

void __DeallocateSpan_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSpanAllocatorGetElementInSpanAtIndex_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DSpanAllocatorGetElementInSpanAtIndex_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fillPositions(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "vertexCount == CFIndex(baseMesh.pointCount())";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Morph target has a vertex count different from the base geometry", (uint8_t *)&v1, 0xCu);
}

void AnimCodec::Mesh<float>::point()
{
}

void fillMesh()
{
}

void ___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2_cold_1()
{
}

void ___Z8fillMeshRN9AnimCodec4MeshIfEEP9__C3DMesh_block_invoke_2_cold_2()
{
}

void SCNEncodeMorpherUsingAnimCodec_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: AnimCodec - Failed to compress mesh", v2, v3, v4, v5, v6);
}

void SCNDecodeMorpherUsingAnimCodec_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: AnimCodec - Can't decode metadata", v2, v3, v4, v5, v6);
}

void SCNDecodeMorpherUsingAnimCodec_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: AnimCodec - Failed to decompress animation", v2, v3, v4, v5, v6);
}

void SCNDecodeMorpherUsingAnimCodec_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Error: AnimCodec - Failed to parse header", v2, v3, v4, v5, v6);
}

void C3DGeometryOpenSubdivAuthoringEnvironmentEnumerateCreases_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "C3DMeshElementGetIndicesChannelCount(creaseElement) == 1";
  _os_log_fault_impl(&dword_20B249000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Found crease element with more than 1 channel", (uint8_t *)&v1, 0xCu);
}

void C3DShapeGeometryValidate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DShapeGeometryValidate_cold_2()
{
  __assert_rtn("C3DShapeGeometryValidate", "C3DShapeGeometry.m", 173, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShapeGeometryGetChamferMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void C3DShapeGeometryMeshForBoundingBox_cold_1()
{
  __assert_rtn("C3DShapeGeometryMeshForBoundingBox", "C3DShapeGeometry.m", 905, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShapeGeometryGetBoundingBox_cold_1()
{
  __assert_rtn("C3DShapeGeometryGetBoundingBox", "C3DShapeGeometry.m", 926, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShapeGeometryGetBoundingSphere_cold_1()
{
  __assert_rtn("C3DShapeGeometryGetBoundingSphere", "C3DShapeGeometry.m", 932, "CFGetTypeID(geometry) == C3DShapeGeometryGetTypeID()");
}

void C3DShaderAddStandardUniform_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "CFDictionaryGetValue(dic, uniformName) == NULL";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. uniform %@ already set", (uint8_t *)&v2, 0x16u);
}

CFTimeInterval CACurrentMediaTime(void)
{
  MEMORY[0x270EFB790]();
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x270EFB8F0](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x270EFB948](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x270EFB950](retstr, tx, ty, tz);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
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
  return MEMORY[0x270EE42E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x270EE42F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4310](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
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

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

void CFBagAddValue(CFMutableBagRef theBag, const void *value)
{
}

CFMutableBagRef CFBagCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFBagCallBacks *callBacks)
{
  return (CFMutableBagRef)MEMORY[0x270EE4468](allocator, capacity, callBacks);
}

CFIndex CFBagGetCountOfValue(CFBagRef theBag, const void *value)
{
  return MEMORY[0x270EE4480](theBag, value);
}

void CFBagRemoveValue(CFMutableBagRef theBag, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x270EE4548](bundle);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

void CFBundleGetPackageInfo(CFBundleRef bundle, UInt32 *packageType, UInt32 *packageCreator)
{
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x270EE47A0]();
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x270EE47B0](type_id);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x270EE47D0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x270EE48D8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x270EE4900](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

CFIndex CFDictionaryGetCountOfKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE4938](theDict, key);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyRecoverySuggestion(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49B0](err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x270EE49B8](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x270EE49D8](err);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x270EE4A18](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x270EE4A20](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B98]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterPostNotificationWithOptions(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, CFOptionFlags options)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x270EE4D60](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x270EE4D90](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x270EE4DB8](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE4DC0](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x270EE4E50](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x270EE4E88](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F68](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x270EE4F80](theSet, value);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
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

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFComparisonResult CFStringCompareWithOptions(CFStringRef theString1, CFStringRef theString2, CFRange rangeToCompare, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5058](theString1, theString2, rangeToCompare.location, rangeToCompare.length, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x270EE5090](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.locatiouint64_t n = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  MEMORY[0x270EE51A8](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x270EE5228](theString, prefix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

void CFStringUppercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x270EE5320](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5350](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5368](anURL);
}

CFStringRef CFURLCopyStrictPath(CFURLRef anURL, Boolean *isAbsolute)
{
  return (CFStringRef)MEMORY[0x270EE5370](anURL, isAbsolute);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x270EE5398](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A0](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x270EE53A8](allocator, url);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE53F0](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE5400](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5440](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x270EE5448]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x270EE5450](anURL);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5538](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x270EE59E8](data, width, height, bitsPerComponent, bytesPerRow, space, *(void *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x270EE5A20](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x270EE5A28](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x270EE5A30](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x270EE5A38](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5A40](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x270EE5A48](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x270EE5A50](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x270EE5A58](context);
}

CGColorConversionInfoRef CGColorConversionInfoCreateFromList(CFDictionaryRef options, CGColorSpaceRef a2, CGColorConversionInfoTransformType a3, CGColorRenderingIntent a4, ...)
{
  return (CGColorConversionInfoRef)MEMORY[0x270EE5B40](options, a2, *(void *)&a3, *(void *)&a4);
}

uint64_t CGColorConversionInfoIterateFunctionsWithCallbacks()
{
  return MEMORY[0x270EE5B48]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x270EE5BF8]();
}

uint64_t CGColorMatrixGetMatrix()
{
  return MEMORY[0x270EE5C00]();
}

void CGColorRelease(CGColorRef color)
{
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x270EE5C20](color);
}

CFPropertyListRef CGColorSpaceCopyPropertyList(CGColorSpaceRef space)
{
  return (CFPropertyListRef)MEMORY[0x270EE5C40](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5C68]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CA8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CB8](plist);
}

uint64_t CGColorSpaceEqualToColorSpaceIgnoringRange()
{
  return MEMORY[0x270EE5CC8]();
}

CGColorSpaceRef CGColorSpaceGetBaseColorSpace(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5CD8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D18](space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return MEMORY[0x270EE5D58](a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t CGColorTRCGetFunction()
{
  return MEMORY[0x270EE5D88]();
}

uint64_t CGColorTRCGetGammaID()
{
  return MEMORY[0x270EE5D90]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x270EE5D98]();
}

uint64_t CGColorTransformConvertColorComponents()
{
  return MEMORY[0x270EE5DA0]();
}

uint64_t CGColorTransformConvertData()
{
  return MEMORY[0x270EE5DA8]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x270EE5DB0]();
}

uint64_t CGColorTransformGetColorSpace()
{
  return MEMORY[0x270EE5DB8]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextFlush(CGContextRef c)
{
}

void CGContextRelease(CGContextRef c)
{
}

CGContextRef CGContextRetain(CGContextRef c)
{
  return (CGContextRef)MEMORY[0x270EE6088](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorSpace(CGContextRef c, CGColorSpaceRef space)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x270EE62E0](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CFStringRef CGFontCopyFullName(CGFontRef font)
{
  return (CFStringRef)MEMORY[0x270EE63F0](font);
}

CFStringRef CGFontCopyGlyphNameForGlyph(CGFontRef font, CGGlyph glyph)
{
  return (CFStringRef)MEMORY[0x270EE63F8](font, glyph);
}

void CGFontRelease(CGFontRef font)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x270EE6738](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(void *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x270EF4F38](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x270EF4F48](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x270EE6858]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x270EF5000](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5040](url, options);
}

CGImageSourceStatus CGImageSourceGetStatusAtIndex(CGImageSourceRef isrc, size_t index)
{
  return MEMORY[0x270EF5060](isrc, index);
}

CFStringRef CGImageSourceGetType(CGImageSourceRef isrc)
{
  return (CFStringRef)MEMORY[0x270EF5068](isrc);
}

void CGPathAddArcToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)
{
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
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

void CGPathApplyWithBlock(CGPathRef path, CGPathApplyBlock block)
{
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE6FD8](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x270EE7030]();
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  MEMORY[0x270EE7070](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x270EE7228]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x270EE7C48](sbuf);
}

uint64_t CSIsNull()
{
  return MEMORY[0x270F236B0]();
}

uint64_t CSRelease()
{
  return MEMORY[0x270F236D8]();
}

uint64_t CSSymbolGetRange()
{
  return MEMORY[0x270F23740]();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return MEMORY[0x270F23830]();
}

uint64_t CSSymbolicatorForeachSymbolWithMangledNameAtTime()
{
  return MEMORY[0x270F23870]();
}

uint64_t CSSymbolicatorGetTask()
{
  return MEMORY[0x270F238F8]();
}

CGFontRef CTFontCopyGraphicsFont(CTFontRef font, CTFontDescriptorRef *attributes)
{
  return (CGFontRef)MEMORY[0x270EE9A50](font, attributes);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x270EE9AD0](font, glyph, matrix);
}

void CTFontDrawGlyphs(CTFontRef font, const CGGlyph *glyphs, const CGPoint *positions, size_t count, CGContextRef context)
{
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  MEMORY[0x270EE9BE0](font, *(void *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  MEMORY[0x270EE9BE8](font);
  return result;
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  MEMORY[0x270EE9BF0](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  MEMORY[0x270EE9C10](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x270EE9C28](font, characters, glyphs, count);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  MEMORY[0x270EE9C38](font);
  return result;
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x270EE9D18](frame);
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x270EE9D38](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x270EE9D40](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  MEMORY[0x270EE9D48](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x270EE9DC0](line);
}

void CTRunGetAdvances(CTRunRef run, CFRange range, CGSize *buffer)
{
}

CFDictionaryRef CTRunGetAttributes(CTRunRef run)
{
  return (CFDictionaryRef)MEMORY[0x270EE9E50](run);
}

CFIndex CTRunGetGlyphCount(CTRunRef run)
{
  return MEMORY[0x270EE9E68](run);
}

void CTRunGetGlyphs(CTRunRef run, CFRange range, CGGlyph *buffer)
{
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x270EE9FC8](buffer, *(void *)&attachmentMode);
}

CGColorSpaceRef CVImageBufferCreateColorSpaceFromAttachments(CFDictionaryRef attachments)
{
  return (CGColorSpaceRef)MEMORY[0x270EEA0A0](attachments);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x270EEA0E0](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x270EEA190](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1B0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA1E8](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA240](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x270EEA260](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x270EEA288](allocator, pixelBufferPool, pixelBufferOut);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x270EEA330](pixelBuffer, unlockFlags);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t MTLDataTypeGetAlignment()
{
  return MEMORY[0x270EF5E28]();
}

uint64_t MTLDataTypeString()
{
  return MEMORY[0x270EF5E50]();
}

uint64_t MTLPixelFormatGetInfo()
{
  return MEMORY[0x270EF5ED8]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLPixelFormatGetName()
{
  return MEMORY[0x270EF5EF0]();
}

uint64_t MTLValidationEnabled()
{
  return MEMORY[0x270EF5FD8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x270EF2A70]();
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x270EF2A80](retstr, table);
}

void NSLog(NSString *format, ...)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x270EF2B60](enumerator, key, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x270EF2BE8](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x270F05EA0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x270F06030]();
}

void UIGraphicsPopContext(void)
{
}

void UIGraphicsPushContext(CGContextRef context)
{
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x270F06078](image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x270EE56F8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x270F06310]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x270F98250](this, __pos1, __n1, __s);
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

std::string *__cdecl std::string::assign(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C8](this, __str, __pos, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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
  return MEMORY[0x270F98790]();
}

{
  return MEMORY[0x270F987A8]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x270F98C18]();
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E20](retstr, __val);
}

void std::terminate(void)
{
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
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

double __exp10(double a1)
{
  MEMORY[0x270ED7DC8](a1);
  return result;
}

uint64_t __invert_d4()
{
  return MEMORY[0x270ED7E08]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  MEMORY[0x270ED7E18]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

simd_float4x4 __invert_f4(simd_float4x4 a1)
{
  MEMORY[0x270ED7E20]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
  result.columns[3].i64[1] = v8;
  result.columns[3].i64[0] = v7;
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strcat_chk()
{
  return MEMORY[0x270ED7EC8]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x270ED7ED0]();
}

double __tanpi(double a1)
{
  MEMORY[0x270ED7EF8](a1);
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void abort(void)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x270ED8480](a1, *(void *)&a2);
}

float acosf(float a1)
{
  MEMORY[0x270ED8598](a1);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

float asinf(float a1)
{
  MEMORY[0x270ED8618](a1);
  return result;
}

long double atan(long double __x)
{
  MEMORY[0x270ED86A0](__x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
}

float atanf(float a1)
{
  MEMORY[0x270ED86C0](a1);
  return result;
}

double atof(const char *a1)
{
  MEMORY[0x270ED86E0](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x270ED8798](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
}

float cbrtf(float a1)
{
  MEMORY[0x270ED87C0](a1);
  return result;
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x270F9A418](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x270F9A430](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x270F9A438](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A450](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x270F9A460](cls, name);
}

objc_property_t class_getProperty(Class cls, const char *name)
{
  return (objc_property_t)MEMORY[0x270F9A488](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x270F9A490](cls);
}

uint64_t clear_mapped_memory()
{
  return MEMORY[0x270F23928]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x270F98F68](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F78](stream, *(void *)&operation, *(void *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x270F98F80](stream, *(void *)&flags);
}

long double cos(long double __x)
{
  MEMORY[0x270ED9128](__x);
  return result;
}

float cosf(float a1)
{
  MEMORY[0x270ED9130](a1);
  return result;
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

uint64_t create_mapped_memory_cache_for_task()
{
  return MEMORY[0x270F23930]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C698](strm, *(void *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C6A8](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x270F9C6B0](strm, *(void *)&level, *(void *)&method, *(void *)&windowBits, *(void *)&memLevel, *(void *)&strategy, version, *(void *)&stream_size);
}

uint64_t destroy_mapped_memory_cache()
{
  return MEMORY[0x270F23940]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x270ED9278](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x270ED92B0](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
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
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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
  return MEMORY[0x270ED95A8](when, delta);
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

float expf(float a1)
{
  MEMORY[0x270ED9870](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x270ED9A18](*(void *)&a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

void glActiveTexture(GLenum texture)
{
}

void glAttachShader(GLuint program, GLuint shader)
{
}

void glBindAttribLocation(GLuint program, GLuint index, const GLchar *name)
{
}

void glBindBuffer(GLenum target, GLuint buffer)
{
}

void glBindFramebuffer(GLenum target, GLuint framebuffer)
{
}

void glBindRenderbuffer(GLenum target, GLuint renderbuffer)
{
}

void glBindTexture(GLenum target, GLuint texture)
{
}

void glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glBlendEquation(GLenum mode)
{
}

void glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)
{
}

void glBlendFunc(GLenum sfactor, GLenum dfactor)
{
}

void glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)
{
}

void glBufferData(GLenum target, GLsizeiptr size, const GLvoid *data, GLenum usage)
{
}

void glClear(GLbitfield mask)
{
}

void glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)
{
}

void glCompileShader(GLuint shader)
{
}

void glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data)
{
}

GLuint glCreateProgram(void)
{
  return MEMORY[0x270EF9868]();
}

GLuint glCreateShader(GLenum type)
{
  return MEMORY[0x270EF9870](*(void *)&type);
}

void glCullFace(GLenum mode)
{
}

void glDeleteBuffers(GLsizei n, const GLuint *buffers)
{
}

void glDeleteFramebuffers(GLsizei n, const GLuint *framebuffers)
{
}

void glDeleteProgram(GLuint program)
{
}

void glDeleteRenderbuffers(GLsizei n, const GLuint *renderbuffers)
{
}

void glDeleteShader(GLuint shader)
{
}

void glDeleteTextures(GLsizei n, const GLuint *textures)
{
}

void glDepthFunc(GLenum func)
{
}

void glDepthMask(GLBOOLean flag)
{
}

void glDisable(GLenum cap)
{
}

uint64_t glDiscardFramebufferEXT()
{
  return MEMORY[0x270EF98E0]();
}

void glDrawArrays(GLenum mode, GLint first, GLsizei count)
{
}

void glDrawElements(GLenum mode, GLsizei count, GLenum type, const GLvoid *indices)
{
}

void glEnable(GLenum cap)
{
}

void glEnableVertexAttribArray(GLuint index)
{
}

void glFlush(void)
{
}

void glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)
{
}

void glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)
{
}

void glFrontFace(GLenum mode)
{
}

void glGenBuffers(GLsizei n, GLuint *buffers)
{
}

void glGenFramebuffers(GLsizei n, GLuint *framebuffers)
{
}

void glGenRenderbuffers(GLsizei n, GLuint *renderbuffers)
{
}

void glGenTextures(GLsizei n, GLuint *textures)
{
}

void glGenerateMipmap(GLenum target)
{
}

void glGetActiveAttrib(GLuint program, GLuint index, GLsizei bufsize, GLsizei *length, GLint *size, GLenum *type, GLchar *name)
{
}

void glGetActiveUniform(GLuint program, GLuint index, GLsizei bufsize, GLsizei *length, GLint *size, GLenum *type, GLchar *name)
{
}

int glGetAttribLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF9980](*(void *)&program, name);
}

GLenum glGetError(void)
{
  return MEMORY[0x270EF9990]();
}

void glGetFloatv(GLenum pname, GLfloat *params)
{
}

void glGetIntegerv(GLenum pname, GLint *params)
{
}

void glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetProgramiv(GLuint program, GLenum pname, GLint *params)
{
}

void glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint *params)
{
}

void glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei *length, GLchar *infolog)
{
}

void glGetShaderiv(GLuint shader, GLenum pname, GLint *params)
{
}

int glGetUniformLocation(GLuint program, const GLchar *name)
{
  return MEMORY[0x270EF99E8](*(void *)&program, name);
}

GLBOOLean glIsEnabled(GLenum cap)
{
  return MEMORY[0x270EF99F8](*(void *)&cap);
}

void glLinkProgram(GLuint program)
{
}

void glPixelStorei(GLenum pname, GLint param)
{
}

void glPolygonOffset(GLfloat factor, GLfloat units)
{
}

void glPopGroupMarkerEXT(void)
{
}

void glPushGroupMarkerEXT(GLsizei length, const char *marker)
{
}

void glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid *pixels)
{
}

void glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)
{
}

uint64_t glResolveMultisampleFramebufferAPPLE()
{
  return MEMORY[0x270EF9A58]();
}

void glScissor(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

void glShaderSource(GLuint shader, GLsizei count, const GLchar *const *string, const GLint *length)
{
}

void glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)
{
}

void glStencilMask(GLuint mask)
{
}

void glStencilMaskSeparate(GLenum face, GLuint mask)
{
}

void glStencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass)
{
}

void glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glTexParameterf(GLenum target, GLenum pname, GLfloat param)
{
}

void glTexParameteri(GLenum target, GLenum pname, GLint param)
{
}

void glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const GLvoid *pixels)
{
}

void glUniform1f(GLint location, GLfloat x)
{
}

void glUniform1fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform1i(GLint location, GLint x)
{
}

void glUniform2fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform2i(GLint location, GLint x, GLint y)
{
}

void glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)
{
}

void glUniform3fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform3i(GLint location, GLint x, GLint y, GLint z)
{
}

void glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
}

void glUniform4fv(GLint location, GLsizei count, const GLfloat *v)
{
}

void glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)
{
}

void glUniformMatrix4fv(GLint location, GLsizei count, GLBOOLean transpose, const GLfloat *value)
{
}

void glUseProgram(GLuint program)
{
}

void glVertexAttribDivisor(GLuint index, GLuint divisor)
{
}

void glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLBOOLean normalized, GLsizei stride, const GLvoid *ptr)
{
}

void glViewport(GLint x, GLint y, GLsizei width, GLsizei height)
{
}

long double hypot(long double __x, long double __y)
{
  MEMORY[0x270ED9E58](__x, __y);
  return result;
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x270F9C730](strm, *(void *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x270F9C738](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x270F9C740](strm, *(void *)&windowBits, version, *(void *)&stream_size);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double ldexp(long double __x, int __e)
{
  MEMORY[0x270EDA028](*(void *)&__e, __x);
  return result;
}

float ldexpf(float a1, int a2)
{
  MEMORY[0x270EDA030](*(void *)&a2, a1);
  return result;
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

float log2f(float a1)
{
  MEMORY[0x270EDA0E0](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A8](size, type_id);
}

uint64_t mapped_memory_read()
{
  return MEMORY[0x270F23950]();
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x270F9A4F0](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x270F9A4F8](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x270F9A668](name);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x270F9A680](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x270EDAB40]();
}

uint64_t os_workgroup_attr_set_flags()
{
  return MEMORY[0x270EDAB68]();
}

uint64_t os_workgroup_create()
{
  return MEMORY[0x270EDAB88]();
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x270EDABC8](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  MEMORY[0x270EDAD00](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

uint64_t proc_disable_wakemon()
{
  return MEMORY[0x270EDAD38]();
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA90](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x270F9AA98](property);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x270EDAE30](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE38](a1, *(void *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_getname_np(pthread_t a1, char *a2, size_t a3)
{
  return MEMORY[0x270EDAEE0](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x270EDAF40]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_setpolicy_np(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF88](a1, *(void *)&a2);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int pthread_rwlockattr_destroy(pthread_rwlockattr_t *a1)
{
  return MEMORY[0x270EDB000](a1);
}

int pthread_rwlockattr_init(pthread_rwlockattr_t *a1)
{
  return MEMORY[0x270EDB008](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

uint64_t pthread_set_fixedpriority_self()
{
  return MEMORY[0x270EDB018]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

int rand(void)
{
  return MEMORY[0x270EDB0D8]();
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270EDB170](a1, a2);
}

long double sin(long double __x)
{
  MEMORY[0x270EDB4E8](__x);
  return result;
}

float sinf(float a1)
{
  MEMORY[0x270EDB4F0](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x270EDB658](__s1, __n);
}

double strtod(const char *a1, char **a2)
{
  MEMORY[0x270EDB6A8](a1, a2);
  return result;
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

float tanf(float a1)
{
  MEMORY[0x270EDB818](a1);
  return result;
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

uint64_t vImageDecodeVectorHalf()
{
  return MEMORY[0x270EDF1B8]();
}

uint64_t vImageEncodeVectorHalf()
{
  return MEMORY[0x270EDF1D8]();
}

uint64_t vImageEncodeVectorOptionsCreate()
{
  return MEMORY[0x270EDF1E0]();
}

uint64_t vImageEncodeVectorOptionsFree()
{
  return MEMORY[0x270EDF1E8]();
}

uint64_t vImageEncodeVectorOptionsSetQuantization()
{
  return MEMORY[0x270EDF1F0]();
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x270EDBBE8](__s, *(void *)&__c, __n);
}