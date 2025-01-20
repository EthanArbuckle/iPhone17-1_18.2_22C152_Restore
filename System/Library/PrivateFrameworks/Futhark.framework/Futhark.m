const char *FKGetBuildTimestamp()
{
  return "Wed Dec 31 16:00:00 1969";
}

const char *FKGetBuildGitHash()
{
  return "<FK_GIT_HASH>";
}

const char *FKGetFrameworkVersion()
{
  return "Futhark-110";
}

uint64_t FKGetBuildAPIVersion()
{
  return 10;
}

uint64_t createOrResetSessions(uint64_t a1, int a2, int a3, int a4)
{
  LODWORD(v4) = a4;
  if (a4 < 1) {
    goto LABEL_8;
  }
  uint64_t v8 = 0;
  uint64_t v10 = 4;
  do
  {
    uint64_t v11 = *(void *)(a1 + 8 * v8);
    if (v11)
    {
      FKSessionReset(v11, a2 >> v8, a3 >> v8);
    }
    else
    {
      v12 = FKSessionCreate(a2 >> v8, a3 >> v8);
      *(void *)(a1 + 8 * v8) = v12;
      if (!v12) {
        return v10;
      }
    }
    ++v8;
  }
  while (v4 != v8);
  if (a4 <= 7)
  {
LABEL_8:
    uint64_t v4 = (int)v4;
    do
    {
      v13 = *(void ***)(a1 + 8 * v4);
      if (v13)
      {
        FKSessionDestroy(v13);
        *(void *)(a1 + 8 * v4) = 0;
      }
      ++v4;
    }
    while (v4 != 8);
  }
  return 0;
}

uint64_t getNumSharedConcomps(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(v6 + 312);
  int v8 = *(_DWORD *)(a1 + 8);
  uint64_t v9 = v7 + 104 * v8;
  int v11 = *(_DWORD *)(v9 + 20);
  uint64_t v10 = (_DWORD *)(v9 + 20);
  if (v11 < 1) {
    return 0;
  }
  int v13 = 0;
  int v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = *(void *)(a2 + 16);
  uint64_t v17 = *(void *)(v16 + 312);
  int v18 = *(_DWORD *)(a2 + 8);
  v19 = (_DWORD *)(v17 + 104 * v18 + 20);
  v20 = (void *)(v7 + 104 * v8 + 8);
  v21 = (void *)(v17 + 104 * v18 + 8);
  v30 = v19;
  uint64_t v31 = a2;
  do
  {
    if (v13 >= *v19) {
      break;
    }
    v22 = (_WORD *)(*(void *)(v6 + 280) + 100 * *(int *)(*v20 + 4 * v14));
    v23 = (_WORD *)(*(void *)(v16 + 280) + 100 * *(int *)(*v21 + 4 * v13));
    int v24 = *(_DWORD *)(a1 + 24);
    int v25 = *(_DWORD *)(a2 + 24);
    unsigned int v26 = (unsigned __int16)((unsigned __int16)v22[41] << v24);
    if (v26 >= (unsigned __int16)((unsigned __int16)v23[41] << v25))
    {
      if ((unsigned __int16)((unsigned __int16)v23[41] << v25) > (unsigned __int16)((unsigned __int16)v22[40] << v24))
      {
        BOOL v28 = concompsOverlap(v22, v6, v23, v16, a3, a4, a5, a6);
        v19 = v30;
        a2 = v31;
        uint64_t v15 = (v15 + v28);
      }
      ++v13;
    }
    else
    {
      if (v26 > (unsigned __int16)((unsigned __int16)v23[40] << v25))
      {
        BOOL v27 = concompsOverlap(v22, v6, v23, v16, a3, a4, a5, a6);
        v19 = v30;
        a2 = v31;
        uint64_t v15 = (v15 + v27);
      }
      ++v14;
    }
  }
  while (v14 < *v10);
  return v15;
}

uint64_t sortSequencesInSensibleOrder(void *a1)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 count];
  uint64_t v3 = [a1 sortUsingComparator:&__block_literal_global_238];
  uint64_t v4 = v2;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v58 - v5;
  uint64_t v59 = (int)v2;
  uint64_t v60 = v2;
  int v62 = v2;
  if ((int)v2 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      *(_DWORD *)&v6[4 * v7] = v7;
      ++v7;
    }
    while (v2 != v7);
    uint64_t v8 = 0;
    uint64_t v9 = 1;
    int v62 = v60;
    while (1)
    {
      uint64_t v10 = [a1 objectAtIndex:v8];
      uint64_t v61 = v8;
      uint64_t v63 = v8 + 1;
      uint64_t v64 = v9;
      if (v8 + 1 < v59)
      {
        uint64_t v11 = v10;
        while (1)
        {
          uint64_t v12 = [a1 objectAtIndex:v9];
          uint64_t v13 = *(void *)(*(void *)(v11 + 16) + 312) + 104 * *(int *)(v11 + 8);
          char v14 = *(_DWORD *)(v11 + 24);
          int v15 = *(_DWORD *)(v13 + 52) << v14;
          unsigned int v16 = (*(unsigned __int16 *)(v13 + 30) + *(unsigned __int16 *)(v13 + 28) + 1) >> 1 << v14;
          uint64_t v17 = *(void *)(*(void *)(v12 + 16) + 312) + 104 * *(int *)(v12 + 8);
          int v18 = *(_DWORD *)(v12 + 24);
          int v19 = *(_DWORD *)(v17 + 52) << v18;
          unsigned int v20 = (*(unsigned __int16 *)(v17 + 30) + *(unsigned __int16 *)(v17 + 28) + 1) >> 1 << v18;
          int v21 = v19 + v15;
          if (v19 + v15 < 0 != __OFADD__(v19, v15)) {
            ++v21;
          }
          int v22 = v21 >> 1;
          int v23 = v20 - v16;
          if (v23 < 0) {
            int v23 = -v23;
          }
          if (v23 < 4 * v22)
          {
            int v24 = (void *)v12;
            [(id)v11 boundingBox];
            double v26 = v25;
            [v24 boundingBox];
            double v28 = v27;
            [v24 boundingBox];
            if (v26 <= v28 + v29 * 2.0)
            {
              [v24 boundingBox];
              double v31 = v30;
              [(id)v11 boundingBox];
              double v33 = v32;
              [(id)v11 boundingBox];
              if (v31 <= v33 + v34 * 2.0)
              {
                [(id)v11 boundingBox];
                double v36 = v35;
                [v24 boundingBox];
                double v38 = v37;
                [v24 boundingBox];
                if (v36 <= v38 + v39)
                {
                  [v24 boundingBox];
                  double v41 = v40;
                  [(id)v11 boundingBox];
                  double v43 = v42;
                  [(id)v11 boundingBox];
                  if (v41 <= v43 + v44) {
                    break;
                  }
                }
              }
            }
          }
LABEL_30:
          if (++v9 == v4) {
            goto LABEL_31;
          }
        }
        if (fabsf((float)(v19 - v15) / (float)v22) <= 0.33) {
          break;
        }
      }
LABEL_31:
      uint64_t v9 = v64 + 1;
      uint64_t v8 = v63;
      if (v63 == v4) {
        goto LABEL_32;
      }
    }
    int v45 = *(_DWORD *)&v6[4 * v61];
    int v46 = *(_DWORD *)&v6[4 * v9];
    if (v45 == v46) {
      goto LABEL_30;
    }
    if (v46 >= v45) {
      int v47 = *(_DWORD *)&v6[4 * v61];
    }
    else {
      int v47 = *(_DWORD *)&v6[4 * v9];
    }
    if (v46 > v45) {
      int v45 = *(_DWORD *)&v6[4 * v9];
    }
    v48 = (int *)v6;
    uint64_t v49 = v4;
    while (1)
    {
      int v50 = *v48;
      int v51 = v47;
      if (*v48 == v45) {
        goto LABEL_27;
      }
      if (v50 > v45) {
        break;
      }
LABEL_28:
      ++v48;
      if (!--v49)
      {
        --v62;
        goto LABEL_30;
      }
    }
    int v51 = v50 - 1;
LABEL_27:
    int *v48 = v51;
    goto LABEL_28;
  }
LABEL_32:
  uint64_t result = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v59];
  v53 = (void *)result;
  if (v62 >= 1)
  {
    for (int i = 0; i != v62; ++i)
    {
      if ((int)v60 >= 1)
      {
        uint64_t v55 = 0;
        int v56 = 1;
        do
        {
          if (*(_DWORD *)&v6[4 * v55] == i)
          {
            uint64_t result = objc_msgSend(v53, "addObject:", objc_msgSend(a1, "objectAtIndexedSubscript:", v55));
            if (v56)
            {
              uint64_t result = [a1 objectAtIndexedSubscript:v55];
              int v56 = 0;
              *(unsigned char *)(*(void *)(*(void *)(result + 16) + 312) + 104 * *(int *)(result + 8) + 94) = 1;
            }
          }
          ++v55;
        }
        while (v4 != v55);
      }
    }
  }
  if ((int)v60 >= 1)
  {
    uint64_t v57 = 0;
    do
    {
      uint64_t result = objc_msgSend(a1, "setObject:atIndexedSubscript:", objc_msgSend(v53, "objectAtIndexedSubscript:", v57), v57);
      ++v57;
    }
    while (v4 != v57);
  }
  return result;
}

void sub_1DCC5CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t runDetectionOnSession(uint64_t result, int a2, int a3, int *a4)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  size_t v4 = *(void *)(result + 8 * a2 + 8);
  long long v64 = *(_OWORD *)(v4 + 168);
  long long v65 = *(_OWORD *)(v4 + 184);
  if (*(void *)(v4 + 200))
  {
    uint64_t v8 = (char *)result;
    uint64_t v9 = a2;
    uint64_t v10 = mach_absolute_time();
    int v63 = a3;
    switch([v8 thresholdingAlgorithm])
    {
      case 0:
        goto LABEL_6;
      case 1:
        long long v68 = v64;
        long long v69 = v65;
        FKThresholdBlockAverage(v4, (uint64_t *)&v68);
        goto LABEL_11;
      case 2:
        int v11 = [v8 enableBinarizerFiltering];
        goto LABEL_9;
      case 3:
        long long v68 = v64;
        long long v69 = v65;
        objc_msgSend(v8, "setBinarizerLimit:", FKThresholdCalculateOtsuLimit(v4, &v68));
LABEL_6:
        int v12 = [v8 binarizerLimit];
        long long v68 = v64;
        long long v69 = v65;
        FKThreshold(v4, (uint64_t *)&v68, v12);
        goto LABEL_11;
      default:
        int v11 = [v8 enableBinarizerFiltering];
        if (a3 < 1)
        {
LABEL_9:
          int v15 = [v8 contrastLimit];
          long long v68 = v64;
          long long v69 = v65;
          uint64_t v13 = v4;
          int v14 = v11;
          int v16 = 1;
        }
        else
        {
          long long v68 = v64;
          long long v69 = v65;
          uint64_t v13 = v4;
          int v14 = v11;
          int v15 = a3;
          int v16 = 4;
        }
        FKThresholdMinMaxBlock(v13, &v68, v14, v15, v16);
LABEL_11:
        uint64_t v17 = mach_absolute_time();
        int v18 = dword_1EAAFFCAC;
        if (!dword_1EAAFFCAC)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          int v18 = dword_1EAAFFCAC;
        }
        *(_DWORD *)&v8[4 * v9 + 160] = (v17 - v10)
                                     * getTimeInMicro_sTimebaseInfo
                                     / (1000 * v18);
        uint64_t v19 = mach_absolute_time();
        FKComponentsFind(v4);
        uint64_t v20 = mach_absolute_time();
        int v21 = dword_1EAAFFCAC;
        if (!dword_1EAAFFCAC)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          int v21 = dword_1EAAFFCAC;
        }
        int v22 = &v8[4 * v9];
        *((_DWORD *)v22 + 48) = (v20 - v19) * getTimeInMicro_sTimebaseInfo / (1000 * v21);
        uint64_t v23 = mach_absolute_time();
        [v8 detectDiacritics];
        FKSequencesFind((int *)v4);
        uint64_t v24 = mach_absolute_time();
        int v25 = dword_1EAAFFCAC;
        if (!dword_1EAAFFCAC)
        {
          mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
          int v25 = dword_1EAAFFCAC;
        }
        double v26 = &v8[48 * (int)v9];
        double v27 = (uint64_t *)(v26 + 288);
        *((_DWORD *)v22 + 56) = (v24 - v23) * getTimeInMicro_sTimebaseInfo / (1000 * v25);
        *((_DWORD *)v22 + 64) = 0;
        double v28 = (uint64_t *)(v26 + 296);
        uint64_t result = FKSessionGetMemoryUsage(v4, (void *)v26 + 37, (uint64_t *)v26 + 38, (uint64_t *)v26 + 39, (uint64_t *)v26 + 40);
        double v29 = (uint64_t *)(v26 + 328);
        if (a2 >= 1)
        {
          uint64_t v30 = *v28;
          *double v27 = *v28;
          *double v29 = v30 + result;
          if (!a4) {
            return result;
          }
          int v62 = a4;
          *a4 = 0;
          uint64_t v31 = mach_absolute_time();
          int v32 = [v8 contrastLimit];
          if (v63)
          {
            int v33 = *(_DWORD *)(v4 + 324);
          }
          else
          {
            int v33 = *(_DWORD *)(v4 + 324);
            if (v33 == -1) {
              goto LABEL_40;
            }
            int v43 = 0;
            int v44 = *(_DWORD *)(v4 + 288) - *(_DWORD *)(v4 + 292);
            int v45 = *(_DWORD *)(v4 + 324);
            do
            {
              int v46 = (int *)(*(void *)(v4 + 312) + 104 * v45);
              v43 += v46[5];
              int v45 = *v46;
            }
            while (v45 != -1);
            if (!v43) {
              goto LABEL_40;
            }
            int v47 = v44 >= 1000 ? 4 : 10;
            if (v44 / v43 < v47)
            {
LABEL_40:
              int v48 = 0;
              uint64_t v49 = v62;
              goto LABEL_61;
            }
          }
          int v60 = v32;
          uint64_t v61 = v31;
          bzero(&v68, 0x400uLL);
          if (v33 == -1)
          {
            int v35 = 0;
            int v34 = 0;
          }
          else
          {
            int v34 = 0;
            int v35 = 0;
            do
            {
              uint64_t v36 = *(void *)(v4 + 312);
              double v37 = (int *)(v36 + 104 * v33);
              if (v37[5] >= 1)
              {
                uint64_t v38 = 0;
                double v39 = (void *)(v36 + 104 * v33 + 8);
                do
                {
                  uint64_t v40 = *(void *)(v4 + 280) + 100 * *(int *)(*v39 + 4 * v38);
                  long long v41 = *(_OWORD *)(v4 + 184);
                  long long v66 = *(_OWORD *)(v4 + 168);
                  long long v67 = v41;
                  int v42 = FKThresholdCalculateContrast(v4, &v66, *(void *)(v40 + 80));
                  if (v42)
                  {
                    v34 += v42;
                    ++v35;
                    ++*((_DWORD *)&v68 + v42);
                  }
                  ++v38;
                }
                while (v38 < v37[5]);
              }
              int v33 = *v37;
            }
            while (*v37 != -1);
          }
          uint64_t v50 = 0;
          int32x4_t v51 = 0uLL;
          int v48 = v63;
          do
          {
            int32x4_t v51 = vmaxq_s32(v51, *(int32x4_t *)((char *)&v68 + v50));
            v50 += 16;
          }
          while (v50 != 1024);
          uint64_t v49 = v62;
          uint64_t v31 = v61;
          if (v35 >= 30 && vmaxvq_s32(v51) >= 10)
          {
            if (v34 < 20)
            {
              unsigned int v55 = 0;
              int v54 = v60;
            }
            else
            {
              unint64_t v52 = 0;
              int v53 = 0;
              int v54 = v60;
              do
              {
                unsigned int v55 = v52 + 1;
                if (v52 > 0xFE) {
                  break;
                }
                v53 += *((_DWORD *)&v68 + v52) * v52;
                ++v52;
              }
              while (v53 < v34 / 20);
            }
            if (v55 >= 0xFF) {
              uint64_t v56 = 255;
            }
            else {
              uint64_t v56 = v55;
            }
            if (v56 && *((_DWORD *)&v68 + v56))
            {
              do
              {
                if (*((int *)&v67 + v56 + 3) < 1) {
                  goto LABEL_60;
                }
                --v56;
              }
              while ((unint64_t)(v56 + 1) > 1);
              LODWORD(v56) = 0;
            }
LABEL_60:
            uint64_t v57 = 1374389535 * (10 * v54 + 90 * (int)v56);
            int v48 = (v57 >> 37) + ((unint64_t)v57 >> 63);
          }
LABEL_61:
          *uint64_t v49 = v48;
          uint64_t result = mach_absolute_time();
          uint64_t v58 = result;
          int v59 = dword_1EAAFFCAC;
          if (!dword_1EAAFFCAC)
          {
            uint64_t result = mach_timebase_info((mach_timebase_info_t)&getTimeInMicro_sTimebaseInfo);
            int v59 = dword_1EAAFFCAC;
          }
          *(_DWORD *)&v8[4 * v9 + 160] += (v58 - v31)
                                        * getTimeInMicro_sTimebaseInfo
                                        / (1000 * v59);
          return result;
        }
        *double v27 = 0;
        *double v29 = result;
        if (a4) {
          *a4 = 0;
        }
        break;
    }
  }
  return result;
}

BOOL concompsOverlap(_WORD *a1, uint64_t a2, _WORD *a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  LOWORD(a5) = a1[40];
  double v8 = (double)*(unint64_t *)&a5;
  LOWORD(a6) = a1[41];
  LOWORD(a7) = a1[42];
  *(double *)&unint64_t v9 = (double)*(unint64_t *)&a7;
  LOWORD(a8) = a1[43];
  *(double *)&unint64_t v10 = (double)*(int *)(a2 + 28);
  CGFloat v11 = v8 / *(double *)&v10;
  double v12 = (double)*(int *)(a2 + 32);
  CGFloat v13 = *(double *)&v9 / v12;
  CGFloat v14 = ((double)*(unint64_t *)&a6 - v8 + 1.0) / *(double *)&v10;
  *(double *)&unint64_t v15 = (double)*(unint64_t *)&a8 - *(double *)&v9 + 1.0;
  CGFloat v16 = *(double *)&v15 / v12;
  LOWORD(v15) = a3[40];
  double v17 = (double)v15;
  LOWORD(v9) = a3[41];
  LOWORD(v10) = a3[42];
  double v18 = (double)v10;
  LOWORD(v10) = a3[43];
  int v19 = *(_DWORD *)(a4 + 28);
  int v20 = *(_DWORD *)(a4 + 32);
  CGFloat v21 = v17 / (double)v19;
  CGFloat v22 = v18 / (double)v20;
  double v23 = ((double)v9 - v17 + 1.0) / (double)v19;
  CGFloat v24 = ((double)v10 - v18 + 1.0) / (double)v20;
  v31.origin.x = v11;
  v31.origin.y = v13;
  v31.size.double width = v14;
  v31.size.double height = v16;
  v34.origin.x = v21;
  v34.origin.y = v22;
  v34.size.double width = v23;
  v34.size.double height = v24;
  CGRect v32 = CGRectIntersection(v31, v34);
  double height = v32.size.height;
  double width = v32.size.width;
  v32.origin.x = v11;
  v32.origin.y = v13;
  v32.size.double width = v14;
  v32.size.double height = v16;
  v35.origin.x = v21;
  v35.origin.y = v22;
  v35.size.double width = v23;
  v35.size.double height = v24;
  CGRect v33 = CGRectUnion(v32, v35);
  float v25 = v14;
  if (v23 < v25)
  {
    float v26 = v23;
    float v25 = v26;
  }
  float v27 = width * height / (v33.size.height * v25);
  return v27 > 0.8;
}

uint64_t __sortSequencesInApproximateScanOrder_block_invoke(uint64_t a1, void *a2, void *a3)
{
  [a2 boundingBox];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [a3 boundingBox];
  if (v13 >= v7 + v11) {
    return -1;
  }
  if (v7 >= v13 + v15) {
    return 1;
  }
  if (v12 >= v5 + v9) {
    return -1;
  }
  if (v5 >= v12 + v14) {
    return 1;
  }
  float v16 = v7 + v11 * 0.5;
  float v17 = v13 + v15 * 0.5;
  if (v17 < v16) {
    return 1;
  }
  else {
    return -1;
  }
}

int *FKRecognizeGetCandidates(uint64_t a1, int *a2, _DWORD *a3)
{
  uint64_t v5 = 0;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v60 = 0;
  memset(v59, 0, sizeof(v59));
  float v6 = *(float *)(a1 + 48) + *(float *)(a1 + 48);
  uint64_t v7 = 1;
  int __base = *(_DWORD *)(a1 + 40);
  float v58 = v6;
  do
  {
    int v8 = *(_DWORD *)(a1 + v5 + 24);
    float v9 = *(float *)(a1 + v5 + 48);
    if (v8 == 9475298)
    {
      int v12 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84) + 1;
      int v13 = 3 * ((v12 << 8) / (v12 - *(unsigned __int16 *)(a1 + 80) + *(unsigned __int16 *)(a1 + 82) + 1));
      int v14 = v13 - 384;
      int v15 = v13 - 383;
      if (v14 >= 0) {
        int v15 = v14;
      }
      int v16 = v15 >> 1;
      if (v16 <= -128) {
        int v16 = -128;
      }
      if (v16 >= 127) {
        int v16 = 127;
      }
      if ((v16 + 128) >= 0xAB)
      {
        if ((int)v7 > 14) {
          goto LABEL_46;
        }
        CGFloat v22 = (float *)(&__base + 2 * (int)v7);
        *(_DWORD *)CGFloat v22 = 49;
        v22[1] = (float)(v9 * 5.0) * 0.125;
        if (v7 != 14)
        {
          double v18 = (float *)(&__base + 2 * (int)v7);
          *((_DWORD *)v18 + 2) = 108;
          v18[3] = (float)(v9 + v9) * 0.125;
          if ((int)v7 <= 12)
          {
            float v19 = v9 * 0.125;
            int v20 = 55;
LABEL_25:
            *((_DWORD *)v18 + 4) = v20;
            v18[5] = v19;
LABEL_26:
            uint64_t v7 = (v7 + 3);
            goto LABEL_46;
          }
        }
      }
      else
      {
        if ((int)v7 > 14) {
          goto LABEL_46;
        }
        float v17 = (float *)(&__base + 2 * (int)v7);
        *(_DWORD *)float v17 = 55;
        v17[1] = (float)(v9 * 5.0) * 0.125;
        if (v7 != 14)
        {
          double v18 = (float *)(&__base + 2 * (int)v7);
          *((_DWORD *)v18 + 2) = 49;
          v18[3] = (float)(v9 + v9) * 0.125;
          if ((int)v7 <= 12)
          {
            float v19 = v9 * 0.125;
            int v20 = 108;
            goto LABEL_25;
          }
        }
      }
      goto LABEL_45;
    }
    if (v8 == 124)
    {
      if ((int)v7 > 14) {
        goto LABEL_46;
      }
      double v10 = (float *)(&__base + 2 * (int)v7);
      *(_DWORD *)double v10 = 108;
      v10[1] = v9;
      if (v7 != 14)
      {
        double v11 = (float *)(&__base + 2 * (int)v7);
        *((_DWORD *)v11 + 2) = 73;
        v11[3] = v9;
        if ((int)v7 <= 12)
        {
          *((_DWORD *)v11 + 4) = 49;
          v11[5] = v9;
          goto LABEL_26;
        }
      }
LABEL_45:
      uint64_t v7 = 15;
      goto LABEL_46;
    }
    if ((int)v7 <= 14)
    {
      double v23 = &__base + 2 * (int)v7;
      int *v23 = v8;
      *((float *)v23 + 1) = v9;
      uint64_t v21 = (v7 + 1);
    }
    else
    {
      uint64_t v21 = v7;
    }
    if (v8 > 255 || !index("cmosuvwxyz", v8 | 0x20u))
    {
      if (v8 == 48)
      {
        if ((int)v21 > 14) {
          goto LABEL_43;
        }
        float v27 = v9 * 0.5;
        double v28 = (float *)(&__base + 2 * (int)v21);
        *(_DWORD *)double v28 = 111;
        v28[1] = v9 * 0.5;
        if (v21 == 14) {
          goto LABEL_45;
        }
        double v29 = (float *)(&__base + 2 * (int)v21);
        int v30 = 79;
      }
      else
      {
        if (v8 != 53)
        {
          if (v8 == 49 && (int)v21 <= 14)
          {
            float v26 = (float *)(&__base + 2 * (int)v21);
            *(_DWORD *)float v26 = 108;
            v26[1] = v9 * 0.25;
            uint64_t v7 = (v21 + 1);
            goto LABEL_46;
          }
LABEL_43:
          uint64_t v7 = v21;
          goto LABEL_46;
        }
        if ((int)v21 > 14) {
          goto LABEL_43;
        }
        float v27 = v9 * 0.25;
        CGRect v31 = (float *)(&__base + 2 * (int)v21);
        *(_DWORD *)CGRect v31 = 115;
        v31[1] = v9 * 0.25;
        if (v21 == 14) {
          goto LABEL_45;
        }
        double v29 = (float *)(&__base + 2 * (int)v21);
        int v30 = 83;
      }
      *((_DWORD *)v29 + 2) = v30;
      v29[3] = v27;
      goto LABEL_50;
    }
    if ((int)v21 > 14) {
      goto LABEL_43;
    }
    CGFloat v24 = &__base + 2 * (int)v21;
    *CGFloat v24 = v8 ^ 0x20;
    *((float *)v24 + 1) = v9;
    uint64_t v7 = (int)v21 + 1;
    if ((v8 | 0x20) == 0x6F && v21 != 14)
    {
      float v25 = (float *)(&__base + 2 * v7);
      *(_DWORD *)float v25 = 48;
      v25[1] = v9;
LABEL_50:
      uint64_t v7 = (v21 + 2);
    }
LABEL_46:
    v5 += 4;
  }
  while (v5 != 16);
  if ((int)v7 < 15)
  {
    float v33 = *(float *)(a1 + 44) / 10.0;
    CGRect v34 = (float *)(&__base + 2 * (int)v7);
    *CGRect v34 = 1.7609e-38;
    v34[1] = v33;
    int v35 = v7 + 1;
    qsort(&__base, (int)v7 + 1, 8uLL, (int (__cdecl *)(const void *, const void *))clistCompare);
    BOOL v36 = (int)v7 < 1;
    LODWORD(v7) = v7 + 1;
    uint64_t result = a2;
    if (!v36) {
      goto LABEL_54;
    }
  }
  else
  {
    qsort(&__base, v7, 8uLL, (int (__cdecl *)(const void *, const void *))clistCompare);
    uint64_t result = a2;
LABEL_54:
    uint64_t v37 = 0;
    uint64_t v38 = v59;
    int v39 = 1;
    int v35 = v7;
    do
    {
      uint64_t v40 = v37 + 1;
      if (v37 + 1 >= v35)
      {
        int v41 = 0;
      }
      else
      {
        int v41 = 0;
        int v42 = v38;
        int v43 = v39;
        int v44 = &__base + 2 * v37;
        do
        {
          if (*v44 == *(_DWORD *)v42)
          {
            ++v41;
          }
          else if (v41)
          {
            *((void *)&__base + v43 - v41) = *v42;
          }
          ++v43;
          ++v42;
        }
        while (v35 > v43);
      }
      v35 -= v41;
      ++v39;
      uint64_t v38 = (_OWORD *)((char *)v38 + 8);
      uint64_t v37 = v40;
    }
    while (v40 < v35 - 1);
  }
  if (v35 < 1)
  {
    float v52 = 0.0;
  }
  else
  {
    uint64_t v45 = v35;
    int v46 = &v58;
    float v47 = 0.0;
    uint64_t v48 = v35;
    do
    {
      float v49 = *v46;
      v46 += 2;
      float v47 = v47 + v49;
      --v48;
    }
    while (v48);
    double v50 = v47;
    int32x4_t v51 = &v58;
    float v52 = 0.0;
    int v53 = result;
    do
    {
      *a3++ = *((_DWORD *)v51 - 1);
      float v54 = *v51;
      v51 += 2;
      int v55 = (int)(v54 * 100.0 / v50);
      *v53++ = v55;
      float v52 = v52 + (float)v55;
      --v45;
    }
    while (v45);
  }
  *uint64_t result = (int)(float)((float)(100.0 - v52) + (float)*result);
  return result;
}

float FKRecognizeConcomp(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 52) = 0;
  *(void *)(a2 + 44) = 0;
  *(_DWORD *)(a2 + 60) = 0;
  uint64_t v4 = *(void *)(a1 + 344);
  int v5 = *(unsigned __int16 *)(a2 + 82) - *(unsigned __int16 *)(a2 + 80) + 1;
  int v6 = *(unsigned __int16 *)(a2 + 86) - *(unsigned __int16 *)(a2 + 84) + 1;
  scaleCC(a1, a2, *(char **)(v4 + 32));
  **(float **)(v4 + 200) = (float)v5 / (float)v6;
  if (!espresso_plan_execute_sync())
  {
    int v8 = (void *)(*(void *)(a1 + 344) + 368);
    *(float *)&double v7 = extractCandidates(a1, (float32x4_t *)a2, 0, v8, v7);
  }
  return *(float *)&v7;
}

float extractCandidates(uint64_t a1, float32x4_t *a2, int a3, void *a4, double a5)
{
  unint64_t v6 = a4[12];
  if (v6)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *a4 + 4 * a4[18] * a3;
    __s1 = (char *)(a1 + 40);
    while (1)
    {
      float v11 = *(float *)(v10 + 4 * v9);
      uint64_t v12 = FKRecognitionLabels[v9];
      if (v12 != 8158332) {
        break;
      }
      *(float *)&a5 = v11 + a2[2].f32[3];
      a2[2].i32[3] = LODWORD(a5);
LABEL_14:
      if (v6 <= ++v9) {
        goto LABEL_59;
      }
    }
    LODWORD(a5) = a2[3].i32[3];
    if (v11 < *(float *)&a5 || v12 == 26996 && (a2[4].i32[0] == -1 || a2[4].i32[1] != -1)) {
      goto LABEL_14;
    }
    *(_DWORD *)__s2 = FKRecognitionLabels[v9];
    int v13 = *(_DWORD *)(a1 + 36);
    if (v13)
    {
      if (v13 == 4544069) {
        goto LABEL_13;
      }
      if ((v12 & 0x808080) == 0)
      {
        if (v12 == 92) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
    }
    if (!strstr(__s1, __s2))
    {
      if (!v13 || v13 == 4412225) {
        goto LABEL_18;
      }
      if (v12 > 10524385)
      {
        if (v12 == 10524386 || v12 == 10715362) {
          goto LABEL_13;
        }
        uint64_t v14 = 10649826;
      }
      else
      {
        if (v12 == 45250 || v12 == 8755426) {
          goto LABEL_13;
        }
        uint64_t v14 = 9475298;
      }
      if (v12 != v14)
      {
LABEL_18:
        if (v12 <= 41410)
        {
          if (v12 <= 35266)
          {
            if (v12 != 33219 && v12 != 33987 && v12 != 34243) {
              goto LABEL_14;
            }
            LODWORD(v12) = 65;
            goto LABEL_13;
          }
          if (v12 <= 38594)
          {
            if (v12 == 35267)
            {
              LODWORD(v12) = 69;
              goto LABEL_13;
            }
            if (v12 != 37827) {
              goto LABEL_14;
            }
            goto LABEL_55;
          }
          if (v12 == 38595)
          {
LABEL_55:
            LODWORD(v12) = 79;
            goto LABEL_13;
          }
          uint64_t v16 = 39107;
LABEL_52:
          if (v12 != v16) {
            goto LABEL_14;
          }
          LODWORD(v12) = 48;
          goto LABEL_13;
        }
        if (v12 <= 43458)
        {
          if (v12 == 41411 || v12 == 42179)
          {
            LODWORD(v12) = 97;
          }
          else
          {
            BOOL v15 = v12 == 42435;
            LODWORD(v12) = 97;
            if (!v15) {
              goto LABEL_14;
            }
          }
          goto LABEL_13;
        }
        if (v12 > 46786)
        {
          if (v12 != 46787)
          {
            uint64_t v16 = 47299;
            goto LABEL_52;
          }
        }
        else
        {
          if (v12 == 43459)
          {
            LODWORD(v12) = 101;
            goto LABEL_13;
          }
          if (v12 != 46019) {
            goto LABEL_14;
          }
        }
        LODWORD(v12) = 111;
      }
    }
LABEL_13:
    *(float *)&a5 = candlistInsert(a2, v12, 1, v11);
    unint64_t v6 = a4[12];
    goto LABEL_14;
  }
LABEL_59:
  unsigned int v17 = a2[1].u32[2];
  return ccSetStr(a2, v17, 1, a5);
}

uint64_t FKPrintRender(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = v7;
  scaleCC(a1, a2, v7);
  for (int i = 0; i != 16; ++i)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = 799063683 * (int)llroundf(*(float *)&v2[v4] * 255.0);
      printf("%s", off_1E6CAACC8[(int)((v5 >> 35) + ((unint64_t)v5 >> 63))]);
      v4 += 4;
    }
    while (v4 != 64);
    uint64_t result = putchar(10);
    v2 += v4;
  }
  return result;
}

void scaleCC(uint64_t a1, uint64_t a2, char *a3)
{
  int v6 = *(unsigned __int16 *)(a2 + 82);
  int v7 = *(unsigned __int16 *)(a2 + 80);
  int v8 = *(unsigned __int16 *)(a2 + 86);
  int v9 = *(unsigned __int16 *)(a2 + 84);
  bzero(a3, 0x400uLL);
  int v10 = *(_DWORD *)(a2 + 12);
  if (v10 != -1)
  {
    int v11 = *(unsigned __int16 *)(a2 + 80);
    float v12 = 16.0 / (float)(v6 - v7 + 1);
    __int16 v13 = *(_WORD *)(a2 + 84);
    uint64_t v14 = *(void *)(a1 + 256);
    uint64_t v15 = *(void *)(a1 + 264);
    float v16 = 16.0 / (float)(v8 - v9 + 1);
    do
    {
      unsigned int v17 = (_WORD *)(v14 + 8 * v10);
      unsigned int v18 = (unsigned __int16)v17[3];
      unsigned __int16 v19 = *(v17 - 1) + 1;
      if (v18 >= v19)
      {
        unsigned int v20 = (unsigned __int16)(*(_WORD *)(v15 + 2 * (v10 >> 6)) - v13 + (*v17 >> 2));
        float v21 = (float)((float)v20 * v16) + 0.0;
        float v22 = (float)((float)(int)(v20 + 1) * v16) + 0.0;
        int v23 = v18 - v11;
        int v24 = v19 - v11;
        unsigned int v25 = vcvtms_s32_f32(v21);
        float v26 = ceilf(v22);
        float v27 = (float)(int)floorf(v21);
        do
        {
          int v28 = v24 + 1;
          if (v26 > v27)
          {
            float v29 = (float)((float)v24 * v12) + 0.0;
            float v30 = (float)((float)v28 * v12) + 0.0;
            signed int v31 = vcvtms_s32_f32(v29);
            float v32 = ceilf(v30);
            uint64_t v33 = v31;
            float v34 = (float)(int)floorf(v29);
            int v35 = v31 + 1;
            int v36 = 16 * v25;
            int v37 = v25;
            float v38 = v27;
            do
            {
              float v39 = (float)++v37;
              if (v32 > v34)
              {
                uint64_t v40 = (float *)&a3[4 * v33 + 4 * v36];
                if (v22 <= v39) {
                  float v41 = v22;
                }
                else {
                  float v41 = (float)v37;
                }
                if (v21 >= v38) {
                  float v38 = v21;
                }
                float v42 = v41 - v38;
                int v43 = v35;
                float v44 = v34;
                do
                {
                  float v45 = (float)v43;
                  if (v30 <= (float)v43) {
                    float v46 = (float)((float)v28 * v12) + 0.0;
                  }
                  else {
                    float v46 = (float)v43;
                  }
                  if (v29 >= v44) {
                    float v44 = (float)((float)v24 * v12) + 0.0;
                  }
                  *uint64_t v40 = *v40 + (float)((float)(v46 - v44) * v42);
                  ++v40;
                  ++v43;
                  float v44 = v45;
                }
                while (v32 > v45);
              }
              v36 += 16;
              float v38 = (float)v37;
            }
            while (v26 > v39);
          }
        }
        while (v24++ < v23);
      }
      int v48 = *(unsigned __int16 *)(v14 + 8 * v10 + 4);
      v10 -= v48;
      if (v48) {
        BOOL v49 = v10 == -1;
      }
      else {
        BOOL v49 = 1;
      }
    }
    while (!v49);
  }
}

uint64_t FKRecognizeGetLangExtrachars(uint64_t a1)
{
  char v1 = 0;
  unint64_t v2 = 0;
  int v3 = 0;
  while (1)
  {
    int v4 = *(unsigned __int8 *)(a1 + v2);
    if (!*(unsigned char *)(a1 + v2) || v4 == 45) {
      break;
    }
    int v5 = (char)v4 << v1;
    if (v2 >= 3) {
      int v5 = 0;
    }
    v3 += v5;
    ++v2;
    v1 += 8;
  }
  if (v3 == 28261)
  {
    uint64_t v6 = 0;
    return languageExtrachars[2 * v6 + 1];
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = &dword_1E6CAAD08;
    while (v7 != -14)
    {
      int v9 = *v8;
      v8 += 4;
      --v7;
      if (v9 == v3)
      {
        uint64_t v6 = -v7;
        return languageExtrachars[2 * v6 + 1];
      }
    }
    return 0;
  }
}

uint64_t FKRecognizeAddLanguage(uint64_t a1, unsigned char *a2)
{
  if (!a2) {
    return 0;
  }
  if (*a2 == 59)
  {
    int v3 = a2 + 1;
  }
  else
  {
    uint64_t result = FKRecognizeGetLangExtrachars((uint64_t)a2);
    int v3 = (unsigned __int8 *)result;
    if (!result) {
      return result;
    }
  }
  *(_DWORD *)__src = 0;
  int v5 = *v3;
  if (*v3)
  {
    uint64_t v6 = (char *)(a1 + 40 + strlen((const char *)(a1 + 40)));
    do
    {
      while (1)
      {
        int v7 = v3[1];
        if ((v7 & 0xC0) == 0x80)
        {
          int v9 = v3[2];
          v3 += 2;
          int v8 = v9;
          int v10 = v9 & 0xC0;
          if (v10 == 128) {
            ++v3;
          }
          else {
            int v8 = 0;
          }
        }
        else
        {
          int v8 = 0;
          int v7 = 0;
          ++v3;
        }
        int v11 = (v7 << 8) | (v8 << 16) | v5;
        *(_DWORD *)__src = v11;
        if (!v11 || (uint64_t)&v6[-a1 - 40] > 124) {
          return 1;
        }
        *(_DWORD *)__s2 = v11;
        int v12 = *(_DWORD *)(a1 + 36);
        if (!v12) {
          break;
        }
        if (v12 == 4544069) {
          goto LABEL_31;
        }
        if ((v11 & 0x808080) != 0) {
          break;
        }
        if (v11 != 92) {
          goto LABEL_31;
        }
LABEL_33:
        strcpy(v6, __src);
        v6 += strlen(__src);
        int v5 = *v3;
        if (!*v3) {
          return 1;
        }
      }
      if (!strstr((char *)(a1 + 40), __s2))
      {
        if (!v12 || v12 == 4412225) {
          goto LABEL_33;
        }
        if (v11 > 10524385)
        {
          if (v11 == 10524386 || v11 == 10649826) {
            goto LABEL_31;
          }
          int v13 = 10715362;
        }
        else
        {
          if (v11 == 45250 || v11 == 8755426) {
            goto LABEL_31;
          }
          int v13 = 9475298;
        }
        if (v11 != v13) {
          goto LABEL_33;
        }
      }
LABEL_31:
      int v5 = *v3;
    }
    while (*v3);
  }
  return 1;
}

uint64_t strIsInLang(uint64_t a1, int a2)
{
  *(_DWORD *)__s2 = a2;
  int v3 = *(_DWORD *)(a1 + 36);
  if (v3)
  {
    if (v3 == 4544069) {
      return 1;
    }
    if ((a2 & 0x808080) == 0) {
      return a2 != 92;
    }
  }
  uint64_t result = (uint64_t)strstr((char *)(a1 + 40), __s2);
  if (result) {
    return 1;
  }
  if (v3 && v3 != 4412225)
  {
    uint64_t result = 1;
    if (a2 > 10524385)
    {
      if (a2 != 10524386 && a2 != 10649826)
      {
        int v5 = 10715362;
LABEL_17:
        if (a2 != v5) {
          return 0;
        }
      }
    }
    else if (a2 != 45250 && a2 != 8755426)
    {
      int v5 = 9475298;
      goto LABEL_17;
    }
  }
  return result;
}

uint64_t FKRecognizeSetLanguage(uint64_t a1, char *a2)
{
  *(unsigned char *)(a1 + 40) = 0;
  if (a2 && (char v2 = *a2) != 0)
  {
    char v3 = 0;
    int v4 = 0;
    uint64_t v5 = 1;
    while (v2 && v2 != 45)
    {
      int v6 = v2 << v3;
      if ((unint64_t)(v5 - 1) >= 3) {
        int v6 = 0;
      }
      v4 += v6;
      char v2 = a2[v5++];
      v3 += 8;
    }
    *(_DWORD *)(a1 + 36) = v4;
    return FKRecognizeAddLanguage(a1, a2);
  }
  else
  {
    *(_DWORD *)(a1 + 36) = 0;
    return 1;
  }
}

uint64_t FKRecognizeSequence(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v138 = 0;
  LODWORD(v5) = *(_DWORD *)(a2 + 20);
  if ((int)v5 < 1) {
    goto LABEL_39;
  }
  uint64_t v6 = 0;
  int v7 = 0;
  int v8 = 0;
  do
  {
    while (1)
    {
      uint64_t v9 = *(void *)(a1 + 280);
      int v10 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * v6);
      int v11 = (float32x4_t *)(v9 + 100 * v10);
      if ((v11[5].i8[14] & 8) != 0) {
        break;
      }
      v139[v7++] = v10;
      if (v7 != 16) {
        goto LABEL_24;
      }
      FKRecognizeMultipleConcomps(a1, (uint64_t)v139, 16);
      int v7 = 0;
      ++v6;
      uint64_t v5 = *(int *)(a2 + 20);
      int v8 = v11;
      if (v6 >= v5) {
        goto LABEL_39;
      }
    }
    int v12 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * v6);
    v11[1].i64[1] = 0;
    v11[2].i64[0] = 0;
    uint64_t v13 = v9 + 100 * v10;
    int v16 = *(unsigned __int16 *)(v13 + 80);
    uint64_t v15 = (unsigned __int16 *)(v13 + 80);
    int v14 = v16;
    *(void *)(v15 - 14) = 0;
    *(void *)(v15 - 18) = 0;
    *((_DWORD *)v15 - 5) = 0;
    if (v8)
    {
      if ((v8[5].i8[13] & 2) == (v8[5].i8[13] & 1))
      {
        unsigned int v17 = (3 * v8[5].u16[3] + v8[5].u16[2]) >> 2;
      }
      else
      {
        int v18 = v8[5].u16[2];
        int v19 = v8[5].u16[3];
        unsigned int v20 = (v19 + v18) >> 1;
        unsigned int v21 = (3 * v19 + v18) >> 2;
        if (v8[5].i8[13]) {
          unsigned int v17 = v21;
        }
        else {
          unsigned int v17 = v20;
        }
      }
    }
    else
    {
      unsigned int v17 = 0;
    }
    int v22 = v15[1] - v14;
    int v23 = v15[2];
    int v24 = v15[3];
    int v25 = v24 - v23 + 1;
    if (3 * v25 > 2 * (v22 + 1) || 3 * (v22 + 1) <= *(_DWORD *)(a2 + 60)) {
      goto LABEL_20;
    }
    if (!v8 || v17 >= (v24 + v23 + 1) >> 1)
    {
      orderDiacriticToClusterCenters(a1, (uint64_t)v11, __base);
      if (v141 == 2)
      {
        unsigned int v26 = 126;
      }
      else
      {
        int v27 = *(_DWORD *)(v9 + 100 * v12 + 64);
        if (v27 == -1)
        {
          unsigned int v26 = 45;
        }
        else
        {
          int v28 = v15[1] - *v15 + 2;
          float v29 = (unsigned __int16 *)(*(void *)(a1 + 280) + 100 * v27);
          int v30 = v29[41] - v29[40] + 2;
          if (3 * v28 >= 4 * v30
            || 3 * v30 >= 4 * v28
            || (int v31 = v15[3] - v15[2] + 2, v32 = v29[43] - v29[42] + 2, 3 * v31 >= 4 * v32)
            || 3 * v32 >= 4 * v31)
          {
            unsigned int v26 = 45;
          }
          else
          {
            unsigned int v26 = 61;
          }
        }
      }
      goto LABEL_23;
    }
    if (v22 >= 2 * v25)
    {
      unsigned int v26 = 95;
    }
    else
    {
LABEL_20:
      if (v24 - v23 < v22 || *(_DWORD *)(v9 + 100 * v12 + 72) >= (signed int)((v25 * v25) >> 1)) {
        unsigned int v26 = 46;
      }
      else {
        unsigned int v26 = 44;
      }
    }
LABEL_23:
    *(float *)&a3 = ccSetStr(v11, v26, 1, a3);
    *(_DWORD *)(v9 + 100 * v12 + 48) = 1065353216;
    LODWORD(v5) = *(_DWORD *)(a2 + 20);
LABEL_24:
    ++v6;
    int v8 = v11;
  }
  while (v6 < (int)v5);
  if (v7 > 0) {
    FKRecognizeMultipleConcomps(a1, (uint64_t)v139, v7);
  }
LABEL_39:
  rsSetUpDownNum(a1, a2);
  if (*(int *)(a2 + 20) >= 1)
  {
    int v33 = 0;
    do
    {
      rcFixSpecials(a1, a2, v33++);
      int v34 = *(_DWORD *)(a2 + 20);
    }
    while (v33 < v34);
    v139[0] = 0;
    if (v34 > 0)
    {
      char v35 = 0;
      int v36 = 0;
      do
      {
        if (shouldTestSplit(*(void *)(a1 + 280) + 100 * *(int *)(*(void *)(a2 + 8) + 4 * v36)))
        {
          if (trySplit((void *)a1, a2, v139)) {
            char v35 = 1;
          }
          int v36 = v139[0];
        }
        v139[0] = ++v36;
        int v38 = *(_DWORD *)(a2 + 20);
      }
      while (v36 < v38);
      unsigned __int8 v138 = v35;
      if (v38 >= 1)
      {
        for (int i = 0; i < v40; ++i)
        {
          *(float *)&double v37 = rcFixSlanted_il(a1, a2, i, v37);
          int v40 = *(_DWORD *)(a2 + 20);
        }
        if (v40 >= 3)
        {
          for (int j = 0; j < v40; ++j)
          {
            float v42 = *(float *)(*(void *)(a1 + 280) + 100 * *(int *)(*(void *)(a2 + 8) + 4 * j) + 48);
            if (v42 > 0.0)
            {
              double v37 = v42;
              if (v37 > 0.1 || j && j != v40 - 1) {
                goto LABEL_59;
              }
            }
            FKSequenceRemoveConcomp(a1, a2, j--);
            int v40 = *(_DWORD *)(a2 + 20);
            char v35 = 1;
LABEL_59:
            if (v40 < 3) {
              break;
            }
          }
          unsigned __int8 v138 = v35;
          if (v40 >= 3)
          {
            int v43 = 1;
            while (1)
            {
              uint64_t v44 = *(void *)(a1 + 280);
              uint64_t v45 = *(void *)(a2 + 8);
              int v46 = *(_DWORD *)(v45 + 4 * v43);
              float v47 = (_DWORD *)(v44 + 100 * v46);
              if (v47[10] == 47)
              {
                BOOL v49 = v47 + 16;
                int v48 = v47[16];
                int v50 = v48 != -1;
                if (v47[17] != -1) {
                  ++v50;
                }
                if (v50 == 1)
                {
                  unsigned int v55 = combineSlash(a1, v46, *(_DWORD *)(v45 + 4 * (v43 - 1)), v48);
                  if (v55)
                  {
                    unsigned int v56 = v55;
                    int v54 = v43 - 1;
                    BOOL v49 = v47 + 17;
                    --v43;
                  }
                  else
                  {
                    unsigned int v57 = combineSlash(a1, *(_DWORD *)(*(void *)(a2 + 8) + 4 * v43), *v49, *(_DWORD *)(*(void *)(a2 + 8) + 4 * (v43 + 1)));
                    if (!v57) {
                      goto LABEL_76;
                    }
                    unsigned int v56 = v57;
                    int v54 = v43 + 1;
                    BOOL v49 = v47 + 17;
                  }
                  unsigned int v52 = v56;
                }
                else
                {
                  if (v50) {
                    goto LABEL_76;
                  }
                  unsigned int v51 = combineSlash(a1, v46, *(_DWORD *)(v45 + 4 * (v43 - 1)), *(_DWORD *)(v45 + 4 * (v43 + 1)));
                  if (!v51) {
                    goto LABEL_76;
                  }
                  unsigned int v52 = v51;
                  int v53 = FKSequenceRemoveConcomp(a1, a2, v43 + 1);
                  int v54 = v43 - 1;
                  v47[17] = v53;
                  --v43;
                }
                *BOOL v49 = FKSequenceRemoveConcomp(a1, a2, v54);
                *(unsigned char *)(v44 + 100 * v46 + 94) |= 0x20u;
                *(unsigned char *)(a2 + 93) = 0;
                char v35 = 1;
                *(float *)&double v37 = ccSetStr((float32x4_t *)(v44 + 100 * v46), v52, 1, v58);
              }
LABEL_76:
              ++v43;
              int v40 = *(_DWORD *)(a2 + 20);
              if (v43 >= v40 - 1)
              {
                unsigned __int8 v138 = v35;
                break;
              }
            }
          }
        }
        if (v40 >= 1)
        {
          for (int k = 0; k < v60; ++k)
          {
            rcAddDiacritics(a1, a2, k, v37);
            int v60 = *(_DWORD *)(a2 + 20);
          }
          if (v60 >= 1)
          {
            int v61 = 0;
            int v62 = 0;
            uint64_t v63 = 0;
            while (1)
            {
              uint64_t v64 = *(void *)(a1 + 280);
              int v65 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * v62);
              if (v63) {
                break;
              }
LABEL_106:
              uint64_t v63 = v64 + 100 * v65;
              if (++v62 >= *(_DWORD *)(a2 + 20))
              {
                unsigned __int8 v138 = v35;
                goto LABEL_108;
              }
            }
            unsigned int v66 = *(_DWORD *)(v64 + 100 * v65 + 40);
            if (!v61 || (*(unsigned char *)(v64 + 100 * v65 + 94) & 8) == 0)
            {
              if (v66 <= 0x2E && ((1 << v66) & 0x508400000000) != 0)
              {
                if (*(_DWORD *)(v64 + 100 * v65 + 64) != -1) {
                  goto LABEL_92;
                }
                if (v66 == 39)
                {
                  if (*(_DWORD *)(v63 + 40) != 39) {
                    goto LABEL_105;
                  }
                  uint64_t v68 = v62;
                  *(_DWORD *)(v63 + 64) = v65;
                  FKSequenceRemoveConcomp(a1, a2, v62);
                  *(unsigned char *)(v64 + 100 * v65 + 94) = 1;
                  *(_DWORD *)(v63 + 40) = 34;
                  --v62;
                  int v69 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * (v68 - 1));
                  uint64_t v70 = *(void *)(a1 + 280);
                  int v71 = *(_DWORD *)(v70 + 100 * v69 + 64);
                  if (v71 != -1 && *(_DWORD *)(v70 + 100 * v69 + 68) == -1)
                  {
                    v72 = (unsigned __int16 *)(v70 + 100 * v69);
                    int v73 = v72[43];
                    int v74 = v72[42];
                    int v75 = v73 - v74 + 1;
                    v76 = (unsigned __int16 *)(v70 + 100 * v71);
                    int v77 = v76[43];
                    int v78 = v76[42];
                    int v79 = v77 - v78 + 1;
                    int v80 = 30 * (v75 - v79);
                    int v81 = v79 + v75;
                    int v82 = v80 / (v81 + 3) * (v80 / (v81 + 3));
                    int v83 = v72[41];
                    LODWORD(v72) = v72[40];
                    int v84 = v83 - v72 + 1;
                    int v85 = v76[41];
                    LODWORD(v76) = v76[40];
                    int v86 = v85 - v76 + 1;
                    int v87 = 30 * (v84 - v86);
                    BOOL v88 = __OFADD__(v86, v84);
                    int v89 = v86 + v84;
                    int v90 = v87 / (v89 + 3);
                    int v91 = (int)(40 * (((v73 + v74 + 1) >> 1) - ((v77 + v78 + 1) >> 1)))
                        / (v81 + 3);
                    unsigned int v92 = v83 + v72 + 1;
                    unsigned int v93 = (v85 + v76 + 1) >> 1;
                    int v94 = v89 < 0 != v88 ? v89 + 1 : v89;
                    int v95 = (int)(20 * (v93 - ((v94 >> 1) + (v92 >> 1)))) / (v89 + 3);
                    int v96 = v82 + v90 * v90 + v91 * v91 + v95 * v95;
                    int v97 = 30 * (2 * v81 - 3 * v89) / (3 * v89 + 2 * v81 + 3);
                    if ((v96 + v97 * v97) <= 0x63)
                    {
                      int v61 = 0;
                      char v35 = 1;
                      goto LABEL_106;
                    }
                  }
                  goto LABEL_92;
                }
              }
              if ((v66 & 0xFFFFFFFE) != 0x3A
                || (*(unsigned char *)(v63 + 94) & 8) != 0
                || *(unsigned __int16 *)(v63 + 84) <= (*(unsigned __int16 *)(v64 + 100 * v65 + 86)
                                                     + *(unsigned __int16 *)(v64 + 100 * v65 + 84)
                                                     + 1) >> 1)
              {
LABEL_105:
                int v61 = 0;
                goto LABEL_106;
              }
            }
LABEL_92:
            FKSequenceRemoveConcomp(a1, a2, v62--);
            char v35 = 1;
            int v61 = 1;
            goto LABEL_106;
          }
        }
      }
    }
  }
LABEL_108:
  int v98 = computeSpaceLimit(a1, (_DWORD *)a2);
  if (*(int *)(a2 + 20) >= 1)
  {
    int v99 = v98;
    int v100 = 0;
    do
      rcSpace((char *)a1, a2, v100++, v99);
    while (v100 < *(_DWORD *)(a2 + 20));
  }
  rsSetUpDownNum(a1, a2);
  LODWORD(v101) = *(_DWORD *)(a2 + 20);
  if ((v101 & 0x80000000) == 0)
  {
    uint64_t v102 = 0;
    LODWORD(v103) = 0;
    int v137 = 0;
    uint64_t v104 = 0;
    char v105 = 1;
    while (1)
    {
      uint64_t v106 = v104;
      if (v102 >= (int)v101) {
        uint64_t v104 = 0;
      }
      else {
        uint64_t v104 = *(void *)(a1 + 280) + 100 * *(int *)(*(void *)(a2 + 8) + 4 * v102);
      }
      uint64_t v136 = v106;
      BOOL v107 = isWordBoundary(v106, v104);
      if (v107)
      {
        BOOL v109 = v102 - v103 == 4 || v137 == 0;
        int v137 = 0;
        if (v109)
        {
          if (v105)
          {
            if ((int)v102 - (int)v103 >= 2)
            {
              uint64_t v103 = (int)v103;
              if (v102 > (int)v103)
              {
                while (1)
                {
                  v110 = (float32x4_t *)(*(void *)(a1 + 280) + 100 * *(int *)(*(void *)(a2 + 8) + 4 * v103));
                  unsigned int v111 = v110[2].i32[2] - 48;
                  if (v111 <= 0x3F)
                  {
                    if (((1 << v111) & 0x1000000002000002) != 0)
                    {
                      unsigned int v112 = 49;
                      goto LABEL_130;
                    }
                    if (((1 << v111) & 0x8000000080000001) != 0)
                    {
                      unsigned int v112 = 48;
LABEL_130:
                      *(float *)&double v108 = ccSetStr(v110, v112, 0, v108);
                    }
                  }
                  if (v102 == ++v103)
                  {
                    int v137 = 0;
                    break;
                  }
                }
              }
            }
          }
        }
        char v105 = 1;
        LODWORD(v103) = v102;
      }
      if (!v104)
      {
        LODWORD(v101) = *(_DWORD *)(a2 + 20);
LABEL_150:
        if ((int)v101 >= 1)
        {
          for (int m = 0; m < v117; ++m)
          {
            checkSpaceOne(a1, a2, m);
            int v117 = *(_DWORD *)(a2 + 20);
          }
          if (v117 >= 1)
          {
            int v118 = 0;
            do
              rcSelectCase(a1, a2, v118++);
            while (v118 < *(_DWORD *)(a2 + 20));
          }
        }
        break;
      }
      if (v102 - v103 == 3)
      {
        v113 = (const char *)(v104 + 40);
        v114 = "mM";
      }
      else
      {
        if (v102 - v103 != 2) {
          goto LABEL_141;
        }
        v113 = (const char *)(v104 + 40);
        v114 = "aApP";
      }
      if (!strstr(v114, v113))
      {
LABEL_141:
        if (!strstr("oO0l1I$", (const char *)(v104 + 40))
          || !v107 && ((*(unsigned __int8 *)(v136 + 93) ^ *(unsigned __int8 *)(v104 + 93)) & 1) != 0)
        {
          char v105 = 0;
        }
        if (*(_DWORD *)(v104 + 24) == 73) {
          char v105 = 0;
        }
        goto LABEL_147;
      }
      int v137 = 1;
LABEL_147:
      uint64_t v101 = *(int *)(a2 + 20);
      if (v102++ >= v101) {
        goto LABEL_150;
      }
    }
  }
  rsRemoveBadWords(a1, a2, &v138);
  if (!*(unsigned char *)(a2 + 93))
  {
    FKSequenceRecalculateBox(a1, a2);
    FKSequenceSortAndProcess((void *)a1, a2, 0);
    unsigned __int8 v138 = 1;
  }
  v119 = malloc_type_malloc(*(int *)(a2 + 20) + 1, 0x24A467BDuLL);
  *(void *)(a2 + 80) = v119;
  *(_DWORD *)(a2 + 88) = *(_DWORD *)(a2 + 20);
  unsigned char *v119 = 0;
  if (*(int *)(a2 + 20) >= 1)
  {
    uint64_t v120 = 0;
    while (1)
    {
      uint64_t v121 = *(void *)(a1 + 280);
      int v122 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * v120);
      uint64_t v123 = v121 + 100 * v122;
      v124 = *(char **)(a2 + 80);
      int v125 = strlen(v124);
      int v126 = strlen((const char *)(v123 + 40));
      if (*(unsigned char *)(a1 + 336)) {
        int v127 = v126 + 20;
      }
      else {
        int v127 = v126;
      }
      int v128 = v125 + v127 + 2;
      int v129 = *(_DWORD *)(a2 + 88);
      if (v128 > v129)
      {
        int v130 = 2 * v129;
        if (v130 <= v128) {
          int v131 = v128;
        }
        else {
          int v131 = v130;
        }
        v132 = (char *)malloc_type_realloc(v124, v131, 0x678E9981uLL);
        if (!v132) {
          return v138;
        }
        v124 = v132;
        *(void *)(a2 + 80) = v132;
        *(_DWORD *)(a2 + 88) = v131;
      }
      if (*(unsigned char *)(v121 + 100 * v122 + 95)) {
        v124[v125++] = 32;
      }
      if (!*(unsigned char *)(a1 + 336)) {
        break;
      }
      if (!*(unsigned char *)(v121 + 100 * v122 + 96))
      {
        BOOL v134 = shouldTestSplit(v121 + 100 * v122);
        uint64_t v133 = *(void *)(a2 + 80);
        if (v134)
        {
          sprintf((char *)(v133 + v125), "\x1B[31m%s\x1B[0m");
          goto LABEL_178;
        }
        goto LABEL_175;
      }
      sprintf((char *)(*(void *)(a2 + 80) + v125), "\x1B[32m%s\x1B[0m");
LABEL_178:
      if (++v120 >= *(int *)(a2 + 20)) {
        return v138;
      }
    }
    uint64_t v133 = *(void *)(a2 + 80);
LABEL_175:
    strcpy((char *)(v133 + v125), (const char *)(v123 + 40));
    goto LABEL_178;
  }
  return v138;
}

void rsSetUpDownNum(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(a2 + 44))
  {
    uint64_t v50 = (uint64_t)&v50;
    int v53 = 0;
    MEMORY[0x1F4188790](a1);
    unsigned int v51 = (char *)&v50 - ((v4 + 15) & 0x7FFFFFFF0);
    uint64_t v6 = *(unsigned int *)(v5 + 20);
    if ((int)v6 >= 1)
    {
      uint64_t v7 = 0;
      char v8 = 0;
      uint64_t v9 = v6 + 1;
      unsigned int v10 = v6 - 1;
      do
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)(a1 + 280) + 100 * *(int *)(*(void *)(a2 + 8) + 4 * v10);
        if ((*(unsigned char *)(v12 + 94) & 8) != 0)
        {
          char v8 = 1;
        }
        else
        {
          if (v7)
          {
            int v13 = (isWordBoundary(v12, v7) | v8);
            vUpdate((char *)&v53, v7, v13);
            vPredict((char *)&v53, a2, v7, (unsigned __int16 *)v12, v13);
            char v8 = 0;
            *(_DWORD *)&v51[4 * v11] = v53;
          }
          else
          {
            *(_DWORD *)&v51[4 * v10] = 0;
          }
          uint64_t v7 = v12;
        }
        --v9;
        unsigned int v10 = v11 - 1;
      }
      while (v9 > 1);
      int v14 = *(_DWORD *)(a2 + 20);
      int v53 = 0;
      if (v14 >= 1)
      {
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        unsigned __int8 v17 = 0;
        char v18 = 1;
        do
        {
          uint64_t v19 = *(void *)(a1 + 280);
          int v20 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * v15);
          unsigned int v21 = (float32x4_t *)(v19 + 100 * v20);
          if ((v21[5].i8[14] & 8) != 0)
          {
            if (*(_DWORD *)(v19 + 100 * v20 + 40) != 39) {
              char v18 = 1;
            }
            uint64_t v22 = v15 + 1;
            goto LABEL_80;
          }
          if (v16)
          {
            vUpdate((char *)&v53, v16, v17);
            unsigned __int8 v17 = isWordBoundary(v16, (uint64_t)v21) | v18;
            vPredict((char *)&v53, a2, v16, (unsigned __int16 *)v21, v17);
          }
          else
          {
            unsigned __int8 v17 = v18;
          }
          int v52 = 0;
          vUpdate((char *)&v52, (uint64_t)v21, v17);
          uint64_t v22 = v15 + 1;
          if (v15 + 1 >= *(int *)(a2 + 20)) {
            uint64_t v24 = 0;
          }
          else {
            uint64_t v24 = *(void *)(a1 + 280) + 100 * *(int *)(*(void *)(a2 + 8) + 4 * v22);
          }
          int v25 = &v51[4 * v15];
          int v26 = (char)v52 + (char)v53;
          int v27 = *v25;
          BOOL v28 = __OFADD__(v26, v27);
          int v29 = v26 + v27;
          if ((v29 < 0) ^ v28 | (v29 == 0)) {
            char v30 = 0;
          }
          else {
            char v30 = 1;
          }
          if ((SBYTE1(v52) + SBYTE1(v53) + v25[1] < 0) ^ __OFADD__(SBYTE1(v52) + SBYTE1(v53), v25[1]) | (SBYTE1(v52) + SBYTE1(v53) + v25[1] == 0)) {
            char v31 = 0;
          }
          else {
            char v31 = 1;
          }
          *(unsigned char *)(v19 + 100 * v20 + 93) = *(unsigned char *)(v19 + 100 * v20 + 93) & 0xFC | v30 | (2 * v31);
          if (BYTE2(v52))
          {
            if (BYTE2(v52) == 100)
            {
              signed int v32 = *(_DWORD *)(v19 + 100 * v20 + 24);
LABEL_38:
              if (!v17 || (v32 & 0xFFFFFFDF) != 0x53)
              {
                uint64_t v38 = 0;
                uint64_t v39 = v19 + 100 * v20;
                while (1)
                {
                  double v23 = *(float *)(v39 + v38 + 48);
                  if (v23 < 0.1) {
                    goto LABEL_79;
                  }
                  int v40 = *(_DWORD *)(v39 + v38 + 24);
                  if ((v40 & 0xFFFFFFDF) == 0x4F)
                  {
                    unsigned int v36 = 48;
                    goto LABEL_77;
                  }
                  if ((v40 & 0xFFFFFFEF) == 0x6C || v40 == 73) {
                    unsigned int v36 = 49;
                  }
                  else {
                    unsigned int v36 = *(_DWORD *)(v39 + v38 + 24);
                  }
                  if (v36 - 48 <= 9) {
                    goto LABEL_77;
                  }
                  v38 += 4;
                  if (v38 == 16) {
                    goto LABEL_79;
                  }
                }
              }
              char v35 = (float32x4_t *)(v19 + 100 * v20);
              unsigned int v36 = 36;
              int v37 = 1;
              goto LABEL_78;
            }
            if (SBYTE2(v52) < 0)
            {
LABEL_54:
              int v42 = v51[4 * v15 + 3] + SHIBYTE(v53);
              signed int v32 = *(_DWORD *)(v19 + 100 * v20 + 24);
              goto LABEL_55;
            }
            char v33 = BYTE2(v53);
          }
          else
          {
            char v33 = BYTE2(v53);
            if (!BYTE2(v53))
            {
              if (!v51[4 * v15 + 2]) {
                goto LABEL_54;
              }
              char v33 = 0;
            }
          }
          int v34 = &v51[4 * v15];
          signed int v32 = *(_DWORD *)(v19 + 100 * v20 + 24);
          if (v34[2] + v33 >= 0) {
            goto LABEL_38;
          }
          int v42 = v34[3] + SHIBYTE(v53);
LABEL_55:
          char v43 = v32 - 48;
          if ((v32 - 48) <= 0x3F)
          {
            if (((1 << v43) & 0x8000000080000001) != 0)
            {
              BOOL v44 = v29 <= 0;
              int v45 = 111;
              int v46 = 79;
              goto LABEL_58;
            }
            if (((1 << v43) & 0x1000000000000002) != 0) {
              goto LABEL_67;
            }
          }
          if (v32 == 124 || v32 == 9475298)
          {
LABEL_67:
            if (v42 <= 0) {
              signed int v32 = 108;
            }
            else {
              signed int v32 = 73;
            }
            uint64_t v48 = v24;
            ccSetStr(v21, v32, 0, v23);
            uint64_t v24 = v48;
LABEL_71:
            if (v17
              && v32 == 108
              && (!v24 || strstr("bcCdfghklImnpPqrsStvVwWxXzZñðßç',;:\"", (const char *)(v24 + 40))))
            {
              *(_DWORD *)(v19 + 100 * v20 + 40) = 73;
            }
            goto LABEL_79;
          }
          if (v32 == 73 && v42 <= 0)
          {
            if (*(float *)(v19 + 100 * v20 + 48) < 0.8)
            {
              signed int v32 = 108;
              *(_DWORD *)(v19 + 100 * v20 + 40) = 108;
              goto LABEL_71;
            }
          }
          else
          {
            if (v32 > 82)
            {
              if (v32 != 115 && v32 != 83) {
                goto LABEL_71;
              }
LABEL_94:
              BOOL v44 = v29 <= 0;
              int v45 = 115;
              int v46 = 83;
LABEL_58:
              if (v44) {
                unsigned int v36 = v45;
              }
              else {
                unsigned int v36 = v46;
              }
LABEL_77:
              char v35 = (float32x4_t *)(v19 + 100 * v20);
              int v37 = 0;
LABEL_78:
              ccSetStr(v35, v36, v37, v23);
              goto LABEL_79;
            }
            if (v32 == 53) {
              goto LABEL_94;
            }
            if (v32 != 57) {
              goto LABEL_71;
            }
            *(_DWORD *)(v19 + 100 * v20 + 40) = 103;
          }
LABEL_79:
          char v18 = 0;
          int v14 = *(_DWORD *)(a2 + 20);
          uint64_t v16 = v19 + 100 * v20;
LABEL_80:
          uint64_t v15 = v22;
        }
        while (v22 < v14);
      }
    }
  }
}

float rcFixSpecials(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 280);
  int v4 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * a3);
  int v5 = *(_DWORD *)(v3 + 100 * v4 + 24);
  if (index("{}[]", v5) && (*(unsigned char *)(v3 + 100 * v4 + 93) & 2) == 0)
  {
LABEL_11:
    unsigned int v7 = 124;
    goto LABEL_12;
  }
  if (v5 != 40
    || (*(unsigned char *)(v3 + 100 * v4 + 93) & 2) != 0
    || *(unsigned __int16 *)(v3 + 100 * v4 + 86) - *(unsigned __int16 *)(v3 + 100 * v4 + 84) >= ((2 * (*(unsigned __int16 *)(v3 + 100 * v4 + 82) - *(unsigned __int16 *)(v3 + 100 * v4 + 80))) | 1))
  {
    uint64_t v8 = v3 + 100 * v4;
    if ((*(unsigned char *)(v8 + 94) & 8) != 0) {
      return *(float *)&v6;
    }
    int v9 = *(unsigned __int16 *)(v8 + 82) - *(unsigned __int16 *)(v8 + 80);
    if (v9 > 3
      || *(unsigned __int16 *)(v3 + 100 * v4 + 86) - *(unsigned __int16 *)(v3 + 100 * v4 + 84) < 3 * v9 + 2)
    {
      return *(float *)&v6;
    }
    goto LABEL_11;
  }
  unsigned int v7 = 99;
LABEL_12:
  *(float *)&double v6 = ccSetStr((float32x4_t *)(v3 + 100 * v4), v7, 1, v6);
  return *(float *)&v6;
}

float rcFixSlanted_il(uint64_t a1, uint64_t a2, int a3, double a4)
{
  int v4 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * a3);
  uint64_t v5 = *(void *)(a1 + 280);
  double v6 = (float32x4_t *)(v5 + 100 * v4);
  if ((v6[1].i32[2] & 0xFFFFFFDF) == 0x5A)
  {
    uint64_t v7 = v5 + 100 * v4;
    if (*(_DWORD *)(v7 + 64) == -1) {
      int v8 = 6;
    }
    else {
      int v8 = 9;
    }
    if (v8 + v8 * (*(unsigned __int16 *)(v7 + 86) - *(unsigned __int16 *)(v7 + 84)) >= 16
                                                                                      * (*(unsigned __int16 *)(v7 + 82)
                                                                                       - *(unsigned __int16 *)(v7 + 80))
                                                                                      + 16
      && 5 * *(_DWORD *)(a2 + 60) > 3 * *(_DWORD *)(a2 + 52))
    {
      *(float *)&a4 = ccSetStr(v6, 0x6Cu, 1, a4);
    }
  }
  return *(float *)&a4;
}

void rcAddDiacritics(uint64_t a1, uint64_t a2, int a3, double a4)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  int v4 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * a3);
  uint64_t v5 = *(void *)(a1 + 280);
  double v6 = (float32x4_t *)(v5 + 100 * v4);
  uint64_t v7 = &v6[5].i8[14];
  __int8 v8 = v6[5].i8[14];
  if ((v8 & 0x20) != 0) {
    return;
  }
  uint64_t v9 = a2;
  uint64_t v11 = v5 + 100 * v4;
  uint64_t v12 = (char *)(v11 + 84);
  int v13 = (char *)(v11 + 86);
  int v14 = *(_DWORD *)(v11 + 64);
  if (v14 != -1)
  {
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    unsigned int v18 = *(unsigned __int16 *)v13;
    unsigned int v19 = *(unsigned __int16 *)v12;
    char v20 = 1;
    while (1)
    {
      int v21 = v14;
      unsigned int v22 = *(unsigned __int16 *)(v5 + 100 * v14 + 86);
      if ((v18 + v19 + 1) >> 1 >= v22) {
        ++v16;
      }
      if (v22 <= v19)
      {
        ++v15;
        if ((v20 & 1) == 0) {
          goto LABEL_13;
        }
      }
      else
      {
        if (*(unsigned __int16 *)(v5 + 100 * v21 + 84) >= v18) {
          ++v17;
        }
        if ((v20 & 1) == 0)
        {
LABEL_13:
          unsigned int v23 = *(unsigned __int16 *)(v5 + 100 * v21 + 80);
          goto LABEL_15;
        }
      }
      char v20 = 0;
      int v14 = *(_DWORD *)(v5 + 100 * v4 + 68);
      if (v14 == -1) {
        goto LABEL_13;
      }
    }
  }
  int v15 = 0;
  int v16 = 0;
  int v17 = 0;
  unsigned int v23 = 0;
LABEL_15:
  uint64_t v24 = &v6[2].i32[2];
  signed int v25 = v6[2].i32[2];
  if (v25 > 85)
  {
    if (v25 <= 122)
    {
      switch(v25)
      {
        case 'V':
          if (v17 == 1) {
            signed int v25 = 33;
          }
          else {
            signed int v25 = 86;
          }
          goto LABEL_113;
        case '[':
          if ((*(unsigned char *)(v5 + 100 * v4 + 93) & 3) != 0) {
            goto LABEL_65;
          }
          signed int v25 = 116;
          goto LABEL_113;
        case '\\':
        case ']':
        case 'f':
        case 'i':
        case 'j':
        case 'l':
          goto LABEL_65;
        case 'h':
          signed int v25 = 104;
          if (v16 != 1 || v15) {
            goto LABEL_113;
          }
          *uint64_t v7 = v8 | 0x20;
          signed int v25 = 26988;
          goto LABEL_174;
        case 'm':
          goto LABEL_61;
        case 'n':
          if (v15 != 1)
          {
            signed int v25 = 110;
            goto LABEL_113;
          }
          if (v23 > (*(unsigned __int16 *)(v5 + 100 * v4 + 82)
                    + *(unsigned __int16 *)(v5 + 100 * v4 + 80)
                    + 1) >> 1)
          {
            signed int v25 = 26994;
            goto LABEL_98;
          }
          signed int v25 = 110;
          break;
        default:
          goto LABEL_113;
      }
      goto LABEL_99;
    }
    if (v25 > 28273)
    {
      if (v25 != 28274)
      {
        if (v25 == 29810)
        {
          if (v16 == 1)
          {
            *uint64_t v7 = v8 | 0x20;
            signed int v25 = 29801;
          }
          else
          {
            signed int v25 = 29810;
          }
        }
        else if (v25 == 29812)
        {
          if (v16 == 1)
          {
            *uint64_t v7 = v8 | 0x20;
            signed int v25 = 26996;
          }
          else
          {
            signed int v25 = 29812;
          }
        }
        goto LABEL_113;
      }
LABEL_61:
      if (v15 != 1) {
        goto LABEL_113;
      }
      uint64_t v30 = v5 + 100 * v4;
      int v31 = *(unsigned __int16 *)(v30 + 80);
      int v32 = *(unsigned __int16 *)(v30 + 82);
      if ((1431655766 * (unint64_t)(v31 + 2 * v32)) >> 32 >= v23)
      {
        if ((1431655766 * (unint64_t)(v32 + 2 * v31)) >> 32 <= v23) {
          goto LABEL_99;
        }
        signed int v25 = 28265;
      }
      else
      {
        signed int v25 = 6910578;
      }
LABEL_98:
      *uint64_t v7 = v8 | 0x20;
LABEL_99:
      int v42 = *(_DWORD *)(v5 + 100 * v4 + 64);
      uint64_t v43 = v5 + 100 * v42;
LABEL_117:
      if ((v25 - 97) > 0x19) {
        goto LABEL_174;
      }
      int v46 = -71;
      goto LABEL_119;
    }
    if ((v25 - 123) >= 3) {
      goto LABEL_113;
    }
    goto LABEL_65;
  }
  if (v25 <= 54)
  {
    if (v25 <= 45)
    {
      if (v25 == 33 || v25 == 41) {
        goto LABEL_65;
      }
      if (v25 != 44) {
        goto LABEL_113;
      }
      goto LABEL_41;
    }
    if (v25 <= 48)
    {
      if (v25 != 46)
      {
        if (v25 != 47) {
          goto LABEL_113;
        }
        goto LABEL_65;
      }
LABEL_41:
      if (v17 == 1)
      {
        int v26 = *(_DWORD *)(v5 + 100 * v4 + 64);
        int v27 = (unsigned __int16 *)(v5 + 100 * v26);
        int v28 = v27[41] - v27[40];
        int v29 = v27[43] - v27[42];
        signed int v25 = 58;
        if (v29 >= v28)
        {
          if (*(_DWORD *)(v5 + 100 * v26 + 72) >= (signed int)(((v29 + 1) * (v29 + 1)) >> 1)) {
            signed int v25 = 58;
          }
          else {
            signed int v25 = 59;
          }
        }
        *uint64_t v7 = v8 | 0x20;
      }
      else
      {
        __s1a = v12;
        unsigned int v36 = v13;
        int v37 = relativeYPosPercent(a1, v9, a3);
        int v13 = v36;
        uint64_t v12 = __s1a;
        uint64_t v24 = &v6[2].i32[2];
        if (v37 <= 39)
        {
          int v38 = *(unsigned __int16 *)(v5 + 100 * v4 + 82) - *(unsigned __int16 *)(v5 + 100 * v4 + 80);
          int v39 = *(unsigned __int16 *)v36 - *(unsigned __int16 *)__s1a;
          if (*(_DWORD *)(a1 + 36) == 4412225 || *(_WORD *)(v5 + 100 * v4 + 88) != 1) {
            goto LABEL_109;
          }
          int v40 = v38 - v39;
          if (v38 - v39 < 0) {
            int v40 = v39 - v38;
          }
          if (200 * v40 / (v39 + 1 + v38 + 1) >= 20)
          {
LABEL_109:
            if (v38 <= v39) {
              signed int v25 = 39;
            }
            else {
              signed int v25 = 34;
            }
          }
          else
          {
            signed int v25 = 45250;
          }
        }
      }
      goto LABEL_113;
    }
    if (v25 == 49) {
      goto LABEL_65;
    }
    if (v25 != 50) {
      goto LABEL_113;
    }
LABEL_59:
    if (v17 == 1)
    {
      *uint64_t v7 = v8 | 0x20;
      signed int v25 = 63;
    }
    goto LABEL_113;
  }
  if (v25 <= 72)
  {
    if (v25 != 55 && v25 != 63)
    {
      if (v25 == 68 && (*(unsigned char *)(v5 + 100 * v4 + 93) & 1) == 0 && !v15 && v17 == 1)
      {
        *uint64_t v7 = v8 | 0x20;
        signed int v25 = 112;
        goto LABEL_174;
      }
      goto LABEL_113;
    }
    goto LABEL_59;
  }
  if ((v25 - 73) >= 2)
  {
    if (v25 != 76 || (*(unsigned char *)(v5 + 100 * v4 + 93) & 1) != 0 || v15 != 1) {
      goto LABEL_113;
    }
LABEL_74:
    signed int v25 = 105;
    goto LABEL_98;
  }
LABEL_65:
  if (v15 == 1)
  {
    if ((*(unsigned char *)(v5 + 100 * v4 + 93) & 2) != 0)
    {
      if (v25 != 124 || (v25 = 41410, v41 = strIsInLang(a1, 41410), uint64_t v24 = &v6[2].i32[2], (v41 & 1) == 0)) {
        signed int v25 = 106;
      }
      goto LABEL_98;
    }
    if (*(unsigned char *)(v5 + 100 * v4 + 93)) {
      goto LABEL_114;
    }
    goto LABEL_74;
  }
  if (!v15)
  {
    if (v17)
    {
      if (v17 == 1)
      {
        __s1 = v13;
        char v33 = v12;
        if (diacriticLooksLikeDot(a1, *(_DWORD *)(v5 + 100 * v4 + 64)))
        {
          BOOL IsResonablyCentered = diacriticIsResonablyCentered(a1, v5 + 100 * v4);
          uint64_t v24 = &v6[2].i32[2];
          uint64_t v12 = v33;
          int v13 = __s1;
          if (IsResonablyCentered)
          {
            *uint64_t v7 = v8 | 0x20;
            signed int v25 = 33;
            goto LABEL_174;
          }
        }
        else
        {
          uint64_t v24 = &v6[2].i32[2];
          uint64_t v12 = v33;
          int v13 = __s1;
        }
      }
    }
    else
    {
      if (v25 == 106)
      {
        if (17 * (*(unsigned __int16 *)(v5 + 100 * v4 + 82) - *(unsigned __int16 *)(v5 + 100 * v4 + 80)) + 13 >= 4 * (*(unsigned __int16 *)v13 - *(unsigned __int16 *)v12)
          || (int v35 = *(unsigned __int8 *)(v5 + 100 * v4 + 93), (~v35 & 3) == 0))
        {
          signed int v25 = 74;
          goto LABEL_174;
        }
        if ((v35 & 2) != 0)
        {
          signed int v25 = 106;
          goto LABEL_174;
        }
        goto LABEL_170;
      }
      BOOL v44 = v13;
      int v45 = v12;
      if (index("{}", v6[2].i32[2]))
      {
        uint64_t v24 = &v6[2].i32[2];
        uint64_t v12 = v45;
        int v13 = v44;
        if ((*(unsigned char *)(v5 + 100 * v4 + 93) & 2) == 0)
        {
          signed int v25 = 124;
          goto LABEL_174;
        }
      }
      else
      {
        uint64_t v24 = &v6[2].i32[2];
        uint64_t v12 = v45;
        int v13 = v44;
      }
    }
LABEL_168:
    if (v25 != 108) {
      goto LABEL_174;
    }
    LOBYTE(v35) = *(unsigned char *)(v5 + 100 * v4 + 93);
LABEL_170:
    signed int v25 = 108;
    if ((v35 & 1) == 0)
    {
      if (*(unsigned __int16 *)v13 - *(unsigned __int16 *)v12 >= 15) {
        signed int v25 = 108;
      }
      else {
        signed int v25 = 105;
      }
    }
    goto LABEL_174;
  }
LABEL_113:
  if (v15 <= 0) {
    goto LABEL_168;
  }
LABEL_114:
  if (v25 < 65) {
    goto LABEL_174;
  }
  int v42 = *(_DWORD *)(v5 + 100 * v4 + 64);
  uint64_t v43 = v5 + 100 * v42;
  if (v25 >= 0x5B) {
    goto LABEL_117;
  }
  int v46 = -65;
LABEL_119:
  uint64_t v47 = (v46 + v25);
  if (v15 != 2)
  {
    uint64_t v54 = v5 + 100 * v4;
    int v55 = *(unsigned __int16 *)(v54 + 80);
    LODWORD(v54) = *(unsigned __int16 *)(v54 + 82);
    uint64_t v56 = v5 + 100 * v42;
    int v58 = *(unsigned __int16 *)(v56 + 80);
    unsigned int v57 = (unsigned __int16 *)(v56 + 80);
    unsigned int v59 = 3 * ((v57[1] + v58 + 1) >> 1);
    unsigned int v60 = v55 + 2 * v54;
    unsigned int v61 = v54 + 2 * v55;
    if (v59 > v60 || v59 < v61) {
      goto LABEL_174;
    }
    v76 = v57;
    int v77 = v24;
    uint64_t v78 = v9;
    orderDiacriticToClusterCenters(a1, v43, __s2);
    uint64_t v63 = 2;
    uint64_t v64 = (char *)&unicodeCharWithDiacritic[8 * v47];
    while (1)
    {
      int v48 = *(_DWORD *)&v64[4 * *(unsigned __int16 *)&__s2[v63]];
      if (v48)
      {
        *(_DWORD *)int v81 = *(_DWORD *)&v64[4 * *(unsigned __int16 *)&__s2[v63]];
        int v65 = *(_DWORD *)(a1 + 36);
        if (!v65) {
          goto LABEL_159;
        }
        if (v65 == 4544069) {
          goto LABEL_162;
        }
        if ((v48 & 0x808080) == 0)
        {
          if (v48 != 92) {
            goto LABEL_162;
          }
        }
        else
        {
LABEL_159:
          if (strstr((char *)(a1 + 40), v81)
            || v65
            && v65 != 4412225
            && (v48 > 10524385
              ? (v48 != 10524386 ? (BOOL v66 = v48 == 10715362) : (BOOL v66 = 1), v67 = 10649826)
              : (v48 != 45250 ? (BOOL v66 = v48 == 8755426) : (BOOL v66 = 1), v67 = 9475298),
                !v66 ? (BOOL v68 = v48 == v67) : (BOOL v68 = 1),
                v68))
          {
LABEL_162:
            int v69 = v76[1] - *v76 + 1;
            if (3 * *(_DWORD *)(v5 + 100 * v42 + 72) < v69
                                                        + v69
                                                        * (*(unsigned __int16 *)(v5 + 100 * v42 + 86)
                                                         - *(unsigned __int16 *)(v5 + 100 * v42 + 84)))
              int v48 = v25;
LABEL_164:
            uint64_t v9 = v78;
            double v6 = (float32x4_t *)(v5 + 100 * v4);
            uint64_t v24 = v77;
LABEL_165:
            if (v48 != v25)
            {
              *v7 |= 0x20u;
              signed int v25 = v48;
            }
            goto LABEL_174;
          }
        }
      }
      v63 += 4;
      if (v63 == 54)
      {
        int v48 = v25;
        goto LABEL_164;
      }
    }
  }
  int v48 = unicodeCharWithDiacritic[8 * v47 + 7];
  if (v48)
  {
    *(_DWORD *)__s2 = v48;
    int v49 = *(_DWORD *)(a1 + 36);
    if (!v49) {
      goto LABEL_124;
    }
    if (v49 == 4544069) {
      goto LABEL_165;
    }
    if ((v48 & 0x808080) == 0)
    {
      if (v48 != 92) {
        goto LABEL_165;
      }
    }
    else
    {
LABEL_124:
      uint64_t v50 = v24;
      unsigned int v51 = strstr((char *)(a1 + 40), __s2);
      uint64_t v24 = v50;
      if (v51) {
        goto LABEL_165;
      }
      if (v49 && v49 != 4412225)
      {
        if (v48 > 10524385)
        {
          BOOL v52 = v48 == 10524386 || v48 == 10715362;
          int v53 = 10649826;
        }
        else
        {
          BOOL v52 = v48 == 45250 || v48 == 8755426;
          int v53 = 9475298;
        }
        if (v52 || v48 == v53) {
          goto LABEL_165;
        }
      }
    }
  }
LABEL_174:
  if ((*v7 & 0x20) == 0)
  {
    uint64_t v70 = v5 + 100 * v4;
    int v72 = *(_DWORD *)(v70 + 64);
    int v71 = (void *)(v70 + 64);
    if (v72 != -1)
    {
      a4 = NAN;
      *int v71 = -1;
      *(unsigned char *)(v9 + 93) = 0;
    }
  }
  if (v25 == *v24) {
    return;
  }
  *(_DWORD *)__s2 = v25;
  int v73 = *(_DWORD *)(a1 + 36);
  if (v73)
  {
    if (v73 == 4544069) {
      goto LABEL_182;
    }
    if ((v25 & 0x808080) == 0)
    {
      if (v25 == 92) {
        return;
      }
LABEL_182:
      ccSetStr(v6, v25, 2, a4);
      return;
    }
  }
  if (strstr((char *)(a1 + 40), __s2)) {
    goto LABEL_182;
  }
  if (v73 && v73 != 4412225)
  {
    if (v25 > 10524385)
    {
      if (v25 == 10524386 || v25 == 10715362) {
        goto LABEL_182;
      }
      int v74 = 10649826;
    }
    else
    {
      if (v25 == 45250 || v25 == 8755426) {
        goto LABEL_182;
      }
      int v74 = 9475298;
    }
    if (v25 == v74) {
      goto LABEL_182;
    }
  }
}

uint64_t computeSpaceLimit(uint64_t a1, _DWORD *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  int v2 = a2[5];
  if (v2 < 2) {
    return 0;
  }
  uint64_t v5 = MEMORY[0x1F4188790](a1);
  __int8 v8 = (char *)v25 - v7;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)(v5 + 280);
  uint64_t v12 = *(int **)(v11 + 8);
  int v15 = *v12;
  int v13 = v12 + 1;
  int v14 = v15;
  do
  {
    int v16 = v13[v9 / 4];
    int v17 = *(unsigned __int16 *)(v10 + 100 * v16 + 80) - *(unsigned __int16 *)(v10 + 100 * v14 + 82);
    *(_DWORD *)&v8[v9] = v17 & ~(v17 >> 31);
    v9 += 4;
    int v14 = v16;
  }
  while (v6 != v9);
  qsort(v8, (v2 - 1), 4uLL, (int (__cdecl *)(const void *, const void *))compareInt);
  int v18 = v2 >> 1;
  if (v2 <= 2) {
    int v18 = 0;
  }
  int v19 = *(_DWORD *)&v8[4 * v18];
  int v20 = a2[15];
  int v21 = v20 / 4;
  if (v20 / 4 >= a2[13] / 5) {
    int v21 = a2[13] / 5;
  }
  if (v21 <= 9 * v19 / 16) {
    int v21 = 9 * v19 / 16;
  }
  int v22 = v21 + v19;
  if (v2 >= 17)
  {
    int v23 = *(_DWORD *)&v8[4 * (7 * (v2 - 1) / 8)];
    if (v22 <= v23 / 2) {
      int v22 = v23 / 2;
    }
  }
  int v24 = 4 * v20 / 3;
  if (v22 < v24) {
    int v24 = v22;
  }
  if (v24 <= 4) {
    return 4;
  }
  else {
    return v24;
  }
}

char *rcSpace(char *result, uint64_t a2, int a3, int a4)
{
  if (a3 >= 1)
  {
    int v4 = a4;
    uint64_t v5 = *((void *)result + 35);
    uint64_t v6 = *(void *)(a2 + 8);
    int v7 = *(_DWORD *)(v6 + 4 * a3);
    int v8 = *(_DWORD *)(v6 + 4 * (a3 - 1));
    uint64_t v9 = v5 + 100 * v7;
    *(unsigned char *)(v9 + 95) = 0;
    uint64_t v10 = (unsigned char *)(v9 + 95);
    int v11 = *(_DWORD *)(v10 - 55);
    uint64_t v12 = v5 + 100 * v8;
    int v13 = *(_DWORD *)(v12 + 40);
    int v14 = *(unsigned __int16 *)(v10 - 15);
    unsigned int v15 = *(unsigned __int16 *)(v12 + 82);
    int v16 = v14 - v15;
    if (v13 == 26214 || v13 == 102)
    {
      int v19 = v15 - *(unsigned __int16 *)(v12 + 80) + 1;
      if (3 * *(_DWORD *)(a2 + 60) < 4 * v19)
      {
        int v20 = ((int)(((unint64_t)(1431655765 * v19) >> 32) - v19) >> 1)
            + ((((unint64_t)(1431655765 * v19) >> 32) - v19) >> 31)
            + a4;
        if (a4 >= 0) {
          int v21 = a4;
        }
        else {
          int v21 = a4 + 1;
        }
        int v22 = v21 >> 1;
        if (v22 <= v20) {
          int v4 = v20;
        }
        else {
          int v4 = v22;
        }
      }
    }
    else if (v13 == 34)
    {
      int v17 = *(_DWORD *)(v5 + 100 * v8 + 64);
      if (v17 != -1)
      {
        unsigned int v18 = *(unsigned __int16 *)(v5 + 100 * v17 + 82);
        if (v15 < v18) {
          int v16 = v14 - v18;
        }
      }
    }
    if ((v11 & 0xFFFFFFDF) == 0x4A && (*(unsigned char *)(v5 + 100 * v7 + 93) & 2) != 0)
    {
      int v29 = *(unsigned __int16 *)(v10 - 13);
      uint64_t v23 = v5 + 100 * v7;
      int v24 = *(unsigned __int16 *)(v23 + 86);
      int v25 = *(unsigned __int16 *)(v23 + 84);
      if (!index("ijl", v13) && v24 - v25 < 3 * (v29 - v14) + 2) {
        int v4 = 2 * v4 / 3;
      }
    }
    if (index("ALRB", v13) && (uint64_t result = index("TVWY", v11)) != 0 || (uint64_t result = index("TVWY", v13)) != 0 && v11 == 65) {
      int v4 = 2 * v4 / 3;
    }
    if (v4 >= 0) {
      int v26 = v4;
    }
    else {
      int v26 = v4 + 1;
    }
    int v27 = v4 + (v26 >> 1);
    if ((*(unsigned char *)(v5 + 100 * v7 + 94) & 8) != 0) {
      int v28 = v27;
    }
    else {
      int v28 = v4;
    }
    if (v16 > v28) {
      *uint64_t v10 = 1;
    }
  }
  return result;
}

uint64_t checkSpaceOne(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(result + 280);
  uint64_t v4 = *(void *)(a2 + 8);
  int v5 = *(_DWORD *)(v4 + 4 * a3);
  uint64_t v6 = v3 + 100 * v5;
  int v9 = *(_DWORD *)(v6 + 40);
  uint64_t v8 = v6 + 40;
  int v7 = v9;
  int v10 = *(unsigned __int16 *)(v8 + 46) - *(unsigned __int16 *)(v8 + 44);
  int v11 = *(unsigned __int16 *)(v8 + 42);
  int v12 = *(unsigned __int16 *)(v8 + 40);
  if (v10 >= ((8 * (v11 - v12)) | 7) && (~*(unsigned __int8 *)(v3 + 100 * v5 + 93) & 3) == 0)
  {
    if (a3)
    {
      int v13 = *(unsigned __int8 *)(v3 + 100 * v5 + 95);
      if (!*(unsigned char *)(v3 + 100 * v5 + 95) || v7 == 91 || v7 == 93) {
        goto LABEL_10;
      }
    }
    else if (v7 == 91 || v7 == 93)
    {
      return result;
    }
    *(_DWORD *)uint64_t v8 = 124;
    return result;
  }
  if (!a3) {
    return result;
  }
  int v13 = *(unsigned __int8 *)(v3 + 100 * v5 + 95);
LABEL_10:
  if (v13)
  {
    int v14 = *(_DWORD *)(v4 + 4 * a3 - 4);
    int v15 = *(_DWORD *)(v3 + 100 * v14 + 40);
    unsigned int v16 = v7 - 48;
    if ((v15 - 48) < 0xA || v16 <= 9)
    {
      unsigned int v18 = v7 - 41;
      uint64_t result = 0x10000000000101;
      BOOL v19 = v18 > 0x34 || ((1 << v18) & 0x10000000000101) == 0;
      if (!v19 && 10 * (v11 - *(unsigned __int16 *)(v3 + 100 * v14 + 82)) < 8 * v10)
      {
LABEL_37:
        *(unsigned char *)(v3 + 100 * v5 + 95) = 0;
        return result;
      }
      if (v15 > 72)
      {
        if (v15 != 91 && (v15 != 73 || a3 != 1 && !*(unsigned char *)(v3 + 100 * v14 + 95))) {
          return result;
        }
      }
      else if (v15 != 40 && v15 != 49)
      {
        return result;
      }
      if (v16 < 0xA || (v18 <= 0x34 ? (BOOL v20 = ((1 << v18) & 0x10000000000011) == 0) : (BOOL v20 = 1), !v20))
      {
        if ((int)(v12
                 - ((*(unsigned __int16 *)(v3 + 100 * v14 + 82)
                   + *(unsigned __int16 *)(v3 + 100 * v14 + 80)
                   + 1) >> 1)) < *(unsigned __int16 *)(v3 + 100 * v14 + 86)
                               - *(unsigned __int16 *)(v3 + 100 * v14 + 84))
          goto LABEL_37;
      }
    }
  }
  return result;
}

float rcSelectCase(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a1 + 280);
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = *(_DWORD *)(v5 + 4 * a3);
  *(_DWORD *)__s2 = *(_DWORD *)(v4 + 100 * v6 + 40);
  int v7 = *(_DWORD *)__s2;
  signed int v8 = *(_DWORD *)__s2;
  if (*(_DWORD *)__s2 == 36)
  {
    if (*(_WORD *)(v4 + 100 * v6 + 88)
      || (uint64_t v9 = a3 + 1, (int)v9 < *(_DWORD *)(a2 + 20))
      && (*(_DWORD *)(v4 + 100 * *(int *)(v5 + 4 * v9) + 40) - 48) < 0xA)
    {
      signed int v8 = 36;
    }
    else
    {
      signed int v8 = 83;
      *(_DWORD *)__s2 = 83;
    }
  }
  if (strstr("CcOoPpSsUuWwXxZz", __s2))
  {
    char v11 = *(unsigned char *)(v4 + 100 * v6 + 93);
    int v12 = v8 | 0x20;
    unsigned int v13 = v8 & 0xFFFFFFDF;
    goto LABEL_11;
  }
  if (strstr("ÍíØøÓóÖöÚúÜüÇçŒœ", __s2))
  {
    char v11 = *(unsigned char *)(v4 + 100 * v6 + 93);
    int v12 = v8 | 0x2000;
    unsigned int v13 = v8 & 0xFFFFDFFF;
LABEL_11:
    if (v11) {
      signed int v8 = v13;
    }
    else {
      signed int v8 = v12;
    }
    goto LABEL_14;
  }
  if (strstr("ĪŌŪŻĆČŠŽ", __s2))
  {
    if ((*(unsigned char *)(v4 + 100 * v6 + 93) & 1) == 0) {
      v8 += 256;
    }
    goto LABEL_14;
  }
  if (strstr("īōūżćčšž", __s2))
  {
    if (*(unsigned char *)(v4 + 100 * v6 + 93)) {
      v8 -= 256;
    }
    goto LABEL_14;
  }
  if (v8 <= 109)
  {
    if (v8 <= 88)
    {
      if (v8 != 81)
      {
        if (v8 != 86) {
          goto LABEL_14;
        }
        goto LABEL_65;
      }
      BOOL v18 = (*(unsigned char *)(v4 + 100 * v6 + 93) & 1) == 0;
      int v19 = 81;
      int v20 = 111;
LABEL_72:
      if (v18) {
        signed int v8 = v20;
      }
      else {
        signed int v8 = v19;
      }
      goto LABEL_14;
    }
    if (v8 != 89)
    {
      if (v8 != 108) {
        goto LABEL_14;
      }
      BOOL v18 = (*(unsigned char *)(v4 + 100 * v6 + 93) & 1) == 0;
      int v19 = 108;
      int v20 = 105;
      goto LABEL_72;
    }
    goto LABEL_62;
  }
  if (v8 > 117)
  {
    if (v8 == 118)
    {
LABEL_65:
      if ((*(unsigned char *)(v4 + 100 * v6 + 93) & 2) != 0) {
        int v22 = 121;
      }
      else {
        int v22 = 118;
      }
      if (*(unsigned char *)(v4 + 100 * v6 + 93)) {
        signed int v8 = 86;
      }
      else {
        signed int v8 = v22;
      }
      goto LABEL_14;
    }
    if (v8 != 121) {
      goto LABEL_14;
    }
LABEL_62:
    int v21 = *(unsigned char *)(v4 + 100 * v6 + 93) & 3;
    if (v21 == 1)
    {
      signed int v8 = 89;
    }
    else if (v21 == 2)
    {
      signed int v8 = 121;
    }
    goto LABEL_14;
  }
  if (v8 != 110)
  {
    if (v8 != 114) {
      goto LABEL_14;
    }
    BOOL v18 = (*(unsigned char *)(v4 + 100 * v6 + 93) & 1) == 0;
    int v19 = 102;
    int v20 = 114;
    goto LABEL_72;
  }
  if (*(unsigned char *)(v4 + 100 * v6 + 93))
  {
    if (*(_DWORD *)(v4 + 100 * v6 + 28) == 27756) {
      signed int v8 = 27756;
    }
    else {
      signed int v8 = 110;
    }
  }
LABEL_14:
  if (v8 == v7) {
    return *(float *)&v10;
  }
  *(_DWORD *)int v25 = v8;
  int v14 = *(_DWORD *)(a1 + 36);
  if (v14)
  {
    if (v14 == 4544069)
    {
LABEL_20:
      *(float *)&double v10 = ccSetStr((float32x4_t *)(v4 + 100 * v6), v8, 2, v10);
      return *(float *)&v10;
    }
    if ((v8 & 0x808080) == 0)
    {
      if (v8 == 92) {
        return *(float *)&v10;
      }
      goto LABEL_20;
    }
  }
  if (strstr((char *)(a1 + 40), v25)) {
    goto LABEL_20;
  }
  if (v14 && v14 != 4412225)
  {
    if (v8 > 10524385)
    {
      BOOL v15 = v8 == 10524386 || v8 == 10715362;
      int v16 = 10649826;
    }
    else
    {
      BOOL v15 = v8 == 45250 || v8 == 8755426;
      int v16 = 9475298;
    }
    if (v15 || v8 == v16) {
      goto LABEL_20;
    }
  }
  return *(float *)&v10;
}

void rsRemoveBadWords(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  MEMORY[0x1F4188790](a1);
  signed int v8 = (char *)v32 - v7;
  *(_DWORD *)((char *)v32 - v7) = 0;
  if (v6 < 0) {
    return;
  }
  uint64_t v9 = 0;
  int v10 = 0;
  int v11 = 0;
  int v12 = 0;
  float v13 = 0.0;
  float v14 = 0.0;
  do
  {
    if (v9 < v6 && (uint64_t v15 = *(void *)(a1 + 280)) != 0)
    {
      uint64_t v16 = v15 + 100 * *(int *)(*(void *)(a2 + 8) + 4 * v9);
      if (!*(unsigned char *)(v16 + 95)) {
        goto LABEL_29;
      }
      char v17 = 0;
    }
    else
    {
      uint64_t v16 = 0;
      char v17 = 1;
    }
    if (v12 <= 0)
    {
      BOOL v18 = v14 > v13;
    }
    else
    {
      BOOL v18 = v14 > v13;
      if (v8[8 * (v12 - 1) + 4]) {
        goto LABEL_14;
      }
    }
    if ((int)v9 - *(_DWORD *)&v8[8 * v12] <= 2) {
      BOOL v18 = (double)((int)v9 - *(_DWORD *)&v8[8 * v12]) * 0.5 < v14;
    }
LABEL_14:
    if (v12 < 2 || *(_DWORD *)&v8[8 * v12] - *(_DWORD *)&v8[8 * (v12 - 1)] != 1) {
      goto LABEL_24;
    }
    int v19 = &v8[8 * (v12 - 1)];
    int v22 = v19[4];
    int v20 = v19 + 4;
    int v21 = v22;
    if (v8[8 * (v12 - 2) + 4])
    {
      if (v21 || !v18) {
        goto LABEL_24;
      }
      char v23 = 1;
      int v24 = 1;
    }
    else
    {
      if (!v21 || v18) {
        goto LABEL_24;
      }
      char v23 = 0;
      int v24 = -1;
    }
    char *v20 = v23;
    v11 += v24;
    v10 += v24;
LABEL_24:
    uint64_t v25 = v12;
    v8[8 * v12 + 4] = v18;
    if (v18)
    {
      ++v11;
      int v10 = v9 + v10 - *(_DWORD *)&v8[8 * v12];
    }
    ++v12;
    *(_DWORD *)&v8[8 * v25 + 8] = v9;
    float v13 = 0.0;
    if (v17)
    {
      uint64_t v26 = v6;
      float v27 = 0.0;
      goto LABEL_30;
    }
    float v14 = 0.0;
LABEL_29:
    float v27 = v13 + getConfusionScoreForCC(v16);
    float v13 = v14 + *(float *)(v16 + 44);
    int v6 = *(_DWORD *)(a2 + 20);
    uint64_t v26 = v6;
LABEL_30:
    float v14 = v13;
    float v13 = v27;
    BOOL v28 = v9++ < v26;
  }
  while (v28);
  if (v11 >= 1 && v11 != v12 && v6 - v10 >= 2)
  {
    if (v12 >= 1)
    {
      uint64_t v29 = v12;
      do
      {
        if (v8[8 * (v29 - 1) + 4])
        {
          int v30 = *(_DWORD *)&v8[8 * v29];
          int v31 = *(_DWORD *)&v8[8 * (v29 - 1)];
          while (v30 > v31)
            FKSequenceRemoveConcomp(a1, a2, --v30);
        }
        BOOL v28 = v29-- <= 1;
      }
      while (!v28);
    }
    *(unsigned char *)(*(void *)(a1 + 280) + 100 * **(int **)(a2 + 8) + 95) = 0;
    *a3 = 1;
  }
}

float FKCCMatchGetConfidence(uint64_t a1)
{
  return *(float *)(a1 + 48) / (1.0 - *(float *)(a1 + 44) + 0.000001);
}

char *FKSeqMatchGetConfidence(char *result, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 44))
  {
    int v3 = *(_DWORD *)(a2 + 20);
    if (v3 >= 2)
    {
      uint64_t v4 = result;
      uint64_t v5 = 0;
      int v6 = 0;
      int v7 = 0;
      float v8 = 0.0;
      float v9 = 0.0;
      do
      {
        uint64_t v10 = *((void *)v4 + 35);
        int v11 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * v5);
        if ((*(unsigned char *)(v10 + 100 * v11 + 94) & 8) == 0)
        {
          uint64_t v12 = v10 + 100 * v11;
          ++v6;
          float v9 = v9 + getConfusionScoreForCC(v12);
          float v8 = v8 + *(float *)(v12 + 44);
          *(_DWORD *)__s2 = *(_DWORD *)(v12 + 40);
          uint64_t result = strstr("•<>%iIl|1!tj?", __s2);
          if (!result) {
            ++v7;
          }
          int v3 = *(_DWORD *)(a2 + 20);
        }
        ++v5;
      }
      while (v5 < v3);
    }
  }
  return result;
}

float getConfusionScoreForCC(uint64_t a1)
{
  uint64_t v2 = 0;
  float v3 = *(float *)(a1 + 48);
  do
  {
    __darwin_ct_rune_t v4 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)int v11 = *(_DWORD *)(a1 + v2 + 28);
    __darwin_ct_rune_t v5 = *(_DWORD *)v11;
    *(_DWORD *)__s2 = v4;
    __darwin_ct_rune_t v6 = __tolower(v4);
    __darwin_ct_rune_t v7 = __tolower(v5);
    if (v5 != 76 && (v4 != 76 ? (BOOL v8 = v6 == v7) : (BOOL v8 = 0), v8)
      || ((v4 - 73) <= 0x33
        ? (BOOL v9 = ((1 << (v4 - 73)) & 0x8000800000001) == 0)
        : (BOOL v9 = 1),
          (!v9 || v4 == 49)
       && ((v5 - 73) <= 0x33 && ((1 << (v5 - 73)) & 0x8000800000001) != 0 || v5 == 49))
      || strstr("%xX", __s2) && strstr("%xX", v11)
      || strstr("oO0", __s2) && strstr("oO0", v11)
      || v4 == 109 && v5 == 28274
      || v4 == 28274 && v5 == 109)
    {
      float v3 = v3 + *(float *)(a1 + v2 + 52);
    }
    v2 += 4;
  }
  while (v2 != 12);
  return v3;
}

uint64_t clistCompare(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a1 + 4);
  float v3 = *(float *)(a2 + 4);
  if (v2 < v3) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = -1;
  }
  if (v2 == v3) {
    return 0;
  }
  else {
    return v4;
  }
}

float candlistInsert(float32x4_t *a1, int a2, int a3, float result)
{
  if (a2 != 27750 || (a1[5].i8[13] & 1) != 0)
  {
    uint64_t v4 = 0;
    int v5 = 4;
    float v6 = 0.0;
    LODWORD(v7) = 4;
    do
    {
      BOOL v8 = &a1->f32[v4];
      if (v8[15] <= result) {
        LODWORD(v7) = v4 + 3;
      }
      if (*((_DWORD *)v8 + 9) == a2)
      {
        int v5 = v4 + 3;
        float v6 = v8[15];
      }
      --v4;
    }
    while (v4 != -4);
    if (v7 != 4 && (int)v7 <= v5)
    {
      if ((int)v7 > 3)
      {
        float v10 = result;
      }
      else
      {
        uint64_t v7 = (int)v7;
        do
        {
          float v10 = result;
          int v11 = &a1->i8[4 * v7];
          int v12 = *((_DWORD *)v11 + 6);
          uint64_t result = *((float *)v11 + 12);
          *((_DWORD *)v11 + 6) = a2;
          *((float *)v11 + 12) = v10;
          if (v5 == v7) {
            break;
          }
          ++v7;
          a2 = v12;
          float v10 = result;
        }
        while (v7 != 4);
      }
      if (a3 == 2)
      {
        int32x2_t v13 = 0;
        if (v5 < 4) {
          *(float *)v13.i32 = v6;
        }
        *(float *)v13.i32 = (float)(v10 - *(float *)v13.i32) + 1.0;
        a1[3] = vdivq_f32(a1[3], (float32x4_t)vdupq_lane_s32(v13, 0));
        uint64_t result = a1[2].f32[3] / *(float *)v13.i32;
        a1[2].f32[3] = result;
      }
    }
  }
  return result;
}

float ccSetStr(float32x4_t *a1, unsigned int a2, int a3, double a4)
{
  if ((a2 & 0xFFFFFFDF) != 0x53 || a1[2].i32[2] != 53 || a1[1].i32[2] != 53 || (a4 = a1[3].f32[0], a4 < 0.8))
  {
    if (a2 == 124)
    {
      int v12 = 73;
    }
    else if (a2 == 9475298)
    {
      int v7 = a1[5].u16[3] - a1[5].u16[2] + 1;
      int v8 = 3 * ((v7 << 8) / (v7 - a1[5].u16[0] + a1[5].u16[1] + 1));
      int v9 = v8 - 384;
      int v10 = v8 - 383;
      if (v9 >= 0) {
        int v10 = v9;
      }
      int v11 = v10 >> 1;
      if (v11 <= -128) {
        int v11 = -128;
      }
      if (v11 >= 127) {
        int v11 = 127;
      }
      int v12 = (v11 + 128) >= 0xAB ? 49 : 55;
    }
    else
    {
      int v12 = a2;
    }
    a1[2].i32[2] = v12;
    if (a3)
    {
      float v13 = a1[3].f32[0];
      LODWORD(a4) = 1.0;
      if (v13 > 0.0)
      {
        if (a2 > 0x7F) {
          goto LABEL_28;
        }
        if (index("I1l", a2) && index("I1l|", a1[1].i32[2]) || index("01259", a2) && index("oOI1l|zZsSg", a1[1].i32[2])) {
          return *(float *)&a4;
        }
        if (index("01259", a1[1].i32[2]))
        {
          float v14 = index("oOI1l|zZsSg", a2);
          *(float *)&a4 = v13;
          if (v14) {
            return *(float *)&a4;
          }
        }
        else
        {
LABEL_28:
          *(float *)&a4 = v13;
        }
      }
      *(float *)&a4 = candlistInsert(a1, a2, a3, *(float *)&a4);
    }
  }
  return *(float *)&a4;
}

void FKRecognizeMultipleConcomps(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 344) + 8);
  if ((int)v3 >= 1)
  {
    do
    {
      uint64_t v6 = FKBatchLevels[(v3 - 1)];
      uint64_t v16 = v3 - 1;
      uint64_t v17 = v3;
      if (a3 >= (int)v6)
      {
        unsigned int v7 = v3 - 1;
        if ((int)v6 <= 1) {
          uint64_t v8 = 1;
        }
        else {
          uint64_t v8 = v6;
        }
        uint64_t v18 = 4 * v6;
        uint64_t v19 = FKBatchLevels[(v3 - 1)];
        do
        {
          int v20 = a3;
          for (uint64_t i = 0; i != v8; ++i)
          {
            uint64_t v10 = *(void *)(a1 + 280) + 100 * *(int *)(a2 + 4 * i);
            *(void *)(v10 + 24) = 0;
            *(void *)(v10 + 32) = 0;
            *(void *)(v10 + 52) = 0;
            *(void *)(v10 + 44) = 0;
            *(_DWORD *)(v10 + 60) = 0;
            int v11 = (void *)(*(void *)(a1 + 344) + 520 * v7);
            int v12 = *(unsigned __int16 *)(v10 + 82) - *(unsigned __int16 *)(v10 + 80) + 1;
            int v13 = *(unsigned __int16 *)(v10 + 86) - *(unsigned __int16 *)(v10 + 84) + 1;
            scaleCC(a1, v10, (char *)(v11[4] + 4 * v11[22] * i));
            *(float *)(v11[25] + 4 * v11[43] * i) = (float)v12 / (float)v13;
          }
          if (!espresso_plan_execute_sync())
          {
            uint64_t v15 = 0;
            do
            {
              *(float *)&double v14 = extractCandidates(a1, (float32x4_t *)(*(void *)(a1 + 280) + 100 * *(int *)(a2 + 4 * v15)), v15, (void *)(*(void *)(a1 + 344) + 520 * v7 + 368), v14);
              ++v15;
            }
            while (v15 < v19);
          }
          a2 += v18;
          a3 = v20 - v19;
        }
        while (v20 - (int)v19 >= (int)v19);
      }
      uint64_t v3 = v16;
    }
    while (v17 > 1);
  }
}

void orderDiacriticToClusterCenters(uint64_t a1, uint64_t a2, char *__base)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int16 *)(a2 + 84);
  int v4 = *(unsigned __int16 *)(a2 + 80);
  int v5 = *(unsigned __int16 *)(a2 + 82);
  unint64_t v58 = 0;
  unint64_t v59 = 0;
  int v56 = 0;
  unint64_t v54 = 0;
  unint64_t v55 = 0;
  int v6 = v5 - v4;
  if (v5 - v4 <= 7) {
    int v7 = v4;
  }
  else {
    int v7 = v4 + 1;
  }
  int v8 = *(_DWORD *)(a2 + 12);
  if (v8 == -1)
  {
    int v18 = 0;
    int v17 = 0;
  }
  else
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    unsigned int v11 = 0;
    unsigned int v12 = 0;
    unsigned int v13 = 0;
    unsigned int v14 = 0;
    unsigned int v15 = 0;
    unsigned int v16 = 0;
    int v17 = 0;
    int v18 = 0;
    unsigned int v19 = v5 + v4;
    unsigned int v20 = (v5 + v4) >> 1;
    unsigned int v21 = v4 + v20;
    int v22 = v5 - (v5 - v4 > 7);
    unsigned int v23 = v5 + (v19 >> 1);
    uint64_t v25 = *(void *)(a1 + 256);
    uint64_t v24 = *(void *)(a1 + 264);
    unsigned int v26 = v21 >> 1;
    unsigned int v27 = v23 >> 1;
    do
    {
      BOOL v28 = (_WORD *)(v25 + 8 * v8);
      unsigned int v29 = (unsigned __int16)v28[3];
      unsigned __int16 v30 = *(v28 - 1) + 1;
      if (v7 == v30) {
        int v31 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      }
      else {
        int v31 = 0;
      }
      v18 += v31;
      if (v7 == (unsigned __int16)(*(v28 - 1) + 1)) {
        ++v17;
      }
      if (v26 <= v29 && v26 >= v30) {
        int v32 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      }
      else {
        int v32 = 0;
      }
      v15 += v32;
      v16 += v26 <= v29 && v26 >= v30;
      if (v20 <= v29 && v20 >= v30) {
        int v33 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      }
      else {
        int v33 = 0;
      }
      v13 += v33;
      v14 += v20 <= v29 && v20 >= v30;
      int v34 = v27 <= v29 && v27 >= v30;
      if (v34) {
        int v35 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      }
      else {
        int v35 = 0;
      }
      v11 += v35;
      v12 += v34;
      BOOL v36 = v22 == v29;
      if (v22 == v29) {
        int v37 = (unsigned __int16)((*v28 >> 2) + *(_WORD *)(v24 + 2 * (v8 >> 6))) - v3;
      }
      else {
        int v37 = 0;
      }
      v9 += v37;
      if (v36) {
        ++v10;
      }
      int v38 = (unsigned __int16)v28[2];
      if (!v38) {
        break;
      }
      v8 -= v38;
    }
    while (v8 != -1);
    unint64_t v58 = __PAIR64__(v14, v16);
    unint64_t v54 = __PAIR64__(v13, v15);
    unint64_t v59 = __PAIR64__(v10, v12);
    unint64_t v55 = __PAIR64__(v9, v11);
  }
  uint64_t v39 = 0;
  int v40 = *(unsigned __int16 *)(a2 + 86);
  int v41 = v40 - v3 + 1;
  int v57 = v17;
  int v53 = v18;
  do
  {
    if (v40 == v3 || (int v42 = *(int *)((char *)&v57 + v39)) == 0) {
      *(int *)((char *)&v53 + v39) = 50;
    }
    else {
      *(int *)((char *)&v53 + v39) = (100 * *(int *)((char *)&v53 + v39) / v42 + 50) / v41;
    }
    v39 += 4;
  }
  while (v39 != 20);
  uint64_t v43 = 0;
  int v44 = 3 * ((v41 << 8) / (v6 + v41 + 1));
  int v45 = v44 - 384;
  int v46 = v44 - 383;
  if (v45 >= 0) {
    int v46 = v45;
  }
  int v47 = v46 >> 1;
  if (v47 <= -128) {
    int v47 = -128;
  }
  if (v47 >= 127) {
    int v47 = 127;
  }
  int v56 = v47 + 128;
  int v48 = clusterCenter;
  do
  {
    uint64_t v49 = 0;
    __int16 v50 = 0;
    unsigned int v51 = &__base[4 * v43];
    *((_WORD *)v51 + 1) = clusterCenter[8 * v43 - v43 + 6];
    do
    {
      int v52 = *(&v53 + v49) - v48[v49];
      v50 += v52 * v52;
      ++v49;
    }
    while (v49 != 6);
    *(_WORD *)unsigned int v51 = v50;
    ++v43;
    v48 += 7;
  }
  while (v43 != 13);
  qsort(__base, 0xDuLL, 4uLL, (int (__cdecl *)(const void *, const void *))v_compare);
}

uint64_t v_compare(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return *a1 - *a2;
}

BOOL isWordBoundary(uint64_t a1, uint64_t a2)
{
  BOOL result = 1;
  if (a1 && a2) {
    return *(unsigned char *)(a2 + 95)
  }
        || index("@-~()[]{}.,:;!?", *(_DWORD *)(a1 + 24))
        || index("@-~()[]{}.,:;!?", *(_DWORD *)(a2 + 24)) != 0;
  return result;
}

uint64_t vUpdate(char *a1, uint64_t a2, int a3)
{
  int v6 = *(_DWORD *)(a2 + 24);
  float v7 = *(float *)(a2 + 48);
  uint64_t result = getUpInfo(a2);
  char v9 = result;
  if (v6 == 116)
  {
    int v10 = (*a1 + (*a1 >> 7)) << 24 >> 25;
LABEL_3:
    *a1 = v10;
    goto LABEL_4;
  }
  if (result > 0x54u)
  {
    if (result == 115)
    {
      if (v7 > 0.5)
      {
        LOBYTE(v10) = -100;
        goto LABEL_3;
      }
      goto LABEL_4;
    }
    if (result != 85) {
      goto LABEL_4;
    }
  }
  else
  {
    if (result == 68)
    {
      if (v7 > 0.5 && *a1 <= 0)
      {
        LOBYTE(v10) = 25;
        goto LABEL_3;
      }
      goto LABEL_4;
    }
    if (result != 83) {
      goto LABEL_4;
    }
  }
  if (v7 > 0.5)
  {
    LOBYTE(v10) = 100;
    goto LABEL_3;
  }
LABEL_4:
  int v11 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)__s2 = v11;
  unsigned int v12 = v11 - 48;
  if ((v11 - 48) <= 9)
  {
    if (*(_DWORD *)(a2 + 64) != -1) {
      goto LABEL_21;
    }
    float v13 = 0.5;
    if (v12 <= 9) {
      float v13 = flt_1DCC6EA80[v12];
    }
    if (v7 <= v13) {
      char v14 = 50;
    }
    else {
      char v14 = 100;
    }
    goto LABEL_18;
  }
  if (v11 == 105 && *(_DWORD *)(a2 + 64) != -1)
  {
    char v14 = -50;
LABEL_18:
    a1[2] = v14;
    goto LABEL_21;
  }
  uint64_t result = getUpInfo(a2);
  if (result != 32)
  {
    uint64_t result = (uint64_t)strstr("0OoI1i|┐", __s2);
    if (!result)
    {
      for (uint64_t i = 0; i != 16; i += 4)
      {
        if (*(float *)(a2 + i + 48) < 0.1) {
          break;
        }
        int v18 = *(_DWORD *)(a2 + i + 24);
        if ((v18 - 48) < 0xA || (v18 & 0xFFFFFFDF) == 0x4F) {
          goto LABEL_21;
        }
      }
      uint64_t v19 = 0;
      while (*(_DWORD *)(a2 + v19 + 24) != 36)
      {
        v19 += 4;
        if (v19 == 16) {
          goto LABEL_55;
        }
      }
      if (*(float *)(a2 + v19 + 48) >= 0.1) {
        goto LABEL_21;
      }
LABEL_55:
      char v14 = -100;
      goto LABEL_18;
    }
  }
LABEL_21:
  if (v9 == 85) {
    goto LABEL_24;
  }
  if (v9 != 58)
  {
    if ((v9 & 0xDF) == 0x53) {
      goto LABEL_29;
    }
    LOBYTE(v15) = *a1;
LABEL_28:
    if ((v15 & 0x80) == 0) {
      goto LABEL_31;
    }
LABEL_29:
    char v16 = -100;
    goto LABEL_30;
  }
  int v15 = *a1;
  if (v15 < 1) {
    goto LABEL_28;
  }
LABEL_24:
  if (!a3)
  {
    char v16 = 100;
LABEL_30:
    a1[3] = v16;
  }
LABEL_31:
  if ((v6 - 128) >= 0xFFFFFFC0 && ((0x5FCE97E05FCF9FEuLL >> v6) & 1) != 0 && v7 > 0.5) {
    a1[1] = -100;
  }
  return result;
}

char *vPredict(char *result, uint64_t a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  int v5 = a4[42];
  int v6 = *(unsigned __int16 *)(a3 + 84);
  int v7 = (int)((((a4[41] + a4[40] + 1) >> 1)
            - ((*(unsigned __int16 *)(a3 + 82) + *(unsigned __int16 *)(a3 + 80) + 1) >> 1))
           * (*(_DWORD *)(a2 + 36) - *(_DWORD *)(a2 + 32)))
     / (*(unsigned __int16 *)(a2 + 26) - *(unsigned __int16 *)(a2 + 24));
  int v8 = v5 - v6 - v7;
  int v9 = a4[43];
  int v10 = *(unsigned __int16 *)(a3 + 86);
  int v11 = v9 - (v5 + v6) + v10;
  int v12 = v11 + 2;
  int v13 = v11 + 3;
  if (v12 >= 0) {
    int v13 = v12;
  }
  int v14 = v13 >> 1;
  int v15 = 100 * v8 / (v13 >> 1);
  int v16 = *result;
  int v17 = *(_DWORD *)(a3 + 24);
  if (v17 == 64 || v17 == 29810 || v17 == 116)
  {
    if (v15 < 0) {
      char v18 = 10;
    }
    else {
      char v18 = -10;
    }
    goto LABEL_9;
  }
  if (v15 < -14)
  {
    char v18 = 100;
LABEL_9:
    *uint64_t result = v18;
    goto LABEL_10;
  }
  if (v15 >= 15)
  {
    char v18 = -100;
    goto LABEL_9;
  }
  char v18 = *result;
LABEL_10:
  int v19 = result[1];
  int v20 = v9 - v10 - v7;
  unsigned int v21 = 100;
  int v22 = 100 * v20 / v14;
  if (v22 <= 14)
  {
    if (v22 > -15)
    {
      unsigned int v21 = result[1];
      if (a5) {
        goto LABEL_14;
      }
      goto LABEL_18;
    }
    unsigned int v21 = 156;
  }
  result[1] = v21;
  if (a5)
  {
LABEL_14:
    *uint64_t result = (char)(v18 + ((v18 & 0x80) >> 7)) >> 1;
    result[1] = (char)(v21 + (v21 >> 7)) >> 1;
    result[2] = (char)(result[2] + ((result[2] >> 13) & 3)) >> 2;
    result[3] = (char)(result[3] + (result[3] >> 7)) >> 1;
    return result;
  }
LABEL_18:
  int v23 = result[2];
  if (v23 >= 1 && (v18 * v16 < 0 || (char)v21 * v19 < 0)) {
    result[2] = v23 >> 1;
  }
  return result;
}

uint64_t getUpInfo(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 24);
  if (v1 == 26214 || v1 == 27756) {
    return 83;
  }
  if ((v1 - 128) < 0xFFFFFFA0) {
    return 32;
  }
  uint64_t v4 = (v1 - 32);
  if ((unint64_t)(v4 - 16) > 9) {
    return upInfo[v4];
  }
  if (*(_DWORD *)(a1 + 64) == -1) {
    return 68;
  }
  return 32;
}

BOOL shouldTestSplit(uint64_t a1)
{
  float v2 = (const char *)(a1 + 40);
  int v3 = *(_DWORD *)(a1 + 40);
  float v4 = *(float *)(a1 + 44);
  if (v4 > 0.5) {
    return (v3 != 72 || v4 >= 0.9) && (v3 != 37 || *(float *)(a1 + 48) <= 0.25);
  }
  if (index("mMwWU", v3)
    || *(float *)(a1 + 44) < 0.1
    || (*(unsigned char *)(a1 + 93) & 1) == 0
    || (BOOL result = 1,
        5 * (*(unsigned __int16 *)(a1 + 82) - *(unsigned __int16 *)(a1 + 80)) <= ((6
                                                                                 * (*(unsigned __int16 *)(a1 + 86)
                                                                                  - *(unsigned __int16 *)(a1 + 84))) | 1)))
  {
    if (v3 > 28273)
    {
      if (v3 != 28274)
      {
        if (v3 == 29300)
        {
          double v6 = *(float *)(a1 + 44);
          double v7 = 0.04;
          goto LABEL_22;
        }
        if (v3 != 29810) {
          return strstr("BCDFGHKLMPQRSTVWXZbcdfghkmpqrstvwxz", v2)
        }
              && *(_DWORD *)(a1 + 64) != -1
              && *(float *)(a1 + 48) < 0.95;
      }
    }
    else if (v3 != 26740)
    {
      if (v3 == 27750 || v3 == 28267)
      {
        double v6 = *(float *)(a1 + 44);
        double v7 = 0.01;
LABEL_22:
        if (v6 > v7 || *(_DWORD *)(a1 + 64) != -1) {
          return 1;
        }
      }
      return strstr("BCDFGHKLMPQRSTVWXZbcdfghkmpqrstvwxz", v2)
          && *(_DWORD *)(a1 + 64) != -1
          && *(float *)(a1 + 48) < 0.95;
    }
    double v6 = *(float *)(a1 + 44);
    double v7 = 0.1;
    goto LABEL_22;
  }
  return result;
}

uint64_t trySplit(void *a1, uint64_t a2, int *a3)
{
  v171[5] = *MEMORY[0x1E4F143B8];
  uint64_t v153 = a2;
  v154 = a3;
  uint64_t v4 = a1[35];
  uint64_t v166 = *(int *)(*(void *)(a2 + 8) + 4 * *a3);
  unint64_t v5 = *(unsigned __int16 *)(v4 + 100 * (int)v166 + 86)
     - (unint64_t)*(unsigned __int16 *)(v4 + 100 * (int)v166 + 84)
     + 1;
  MEMORY[0x1F4188790](a1);
  int v9 = &v151[-v8];
  for (uint64_t i = 0; i != 30; i += 3)
  {
    v168[i] = v9;
    v9 += 2 * v5;
  }
  unint64_t v158 = *(unsigned __int16 *)(v6 + 100 * (int)v166 + 82)
       - (unint64_t)*(unsigned __int16 *)(v6 + 100 * (int)v166 + 80);
  int v11 = v158 + 1;
  uint64_t v12 = (int)v5 * (uint64_t)((int)v158 + 1);
  if (1 - (int)v12 >= 0) {
    int v13 = -((1 - v12) & 0x3F);
  }
  else {
    int v13 = (v12 - 1) & 0x3F;
  }
  int v14 = v158 + 1;
  unsigned int v15 = (52 * v11 + 63) & 0xFFFFFFC0;
  int v16 = v12 - v13 + v15;
  int v17 = (v7 + 2) * 2 * v11;
  if (1 - v17 >= 0) {
    int v18 = -((1 - v17) & 0x3F);
  }
  else {
    int v18 = (v17 - 1) & 0x3F;
  }
  int v19 = v17 - v18 + 63;
  int v20 = (2 * v12 + 63) & 0xFFFFFFC0;
  int v21 = v16 + v20 + v19 + 63;
  uint64_t v22 = a1[43];
  int v23 = *(_DWORD *)(v22 + 2624);
  uint64_t v165 = (v158 + 1);
  uint64_t v155 = v7;
  if (v23 >= v21)
  {
    int v152 = 2 * v11;
    unint64_t v159 = v5;
  }
  else
  {
    int v24 = v21 + v21 / 4;
    if (1 - v24 >= 0) {
      int v25 = -((1 - v24) & 0xFFF);
    }
    else {
      int v25 = (v24 - 1) & 0xFFF;
    }
    int v26 = v24 - v25 + 4095;
    unsigned int v27 = *(void **)(v22 + 2616);
    if (v27)
    {
      uint64_t result = (uint64_t)malloc_type_realloc(v27, v26, 0x803A58C0uLL);
      if (!result) {
        return result;
      }
      uint64_t v22 = a1[43];
      *(void *)(v22 + 2616) = result;
    }
    else
    {
      uint64_t result = (uint64_t)malloc_type_malloc(v26, 0xF088B064uLL);
      uint64_t v22 = a1[43];
      *(void *)(v22 + 2616) = result;
      if (!result) {
        return result;
      }
    }
    int v152 = 2 * v11;
    unint64_t v159 = v5;
    *(_DWORD *)(v22 + 2624) = v26;
    int v14 = v165;
  }
  v164 = *(char **)(v22 + 2616);
  unsigned int v29 = &v164[v15];
  unsigned __int16 v30 = &v29[v20];
  size_t v31 = v19;
  int v32 = &v30[v19];
  bzero(v30, v31);
  uint64_t v33 = (uint64_t)&v30[v12 + v14 + v14];
  v162 = &v29[v12];
  v163 = v29;
  uint64_t v34 = a1[35];
  uint64_t v35 = v34 + 100 * (int)v166;
  unsigned int v37 = *(unsigned __int16 *)(v35 + 80);
  BOOL v36 = (unsigned __int16 *)(v35 + 80);
  unint64_t v38 = v36[1] - (unint64_t)v37 + 1;
  bzero(v32, v38 + (int)v38 * (uint64_t)(v36[3] - v36[2]));
  int v39 = v36[3];
  unsigned int v40 = v36[2];
  if (v39 >= v40)
  {
    int v41 = (_WORD *)(a1[32] + 8 * *(int *)(v34 + 100 * (int)v166 + 12));
    unsigned int v42 = *v36;
    do
    {
      int v43 = v36[1];
      if (v43 >= v42)
      {
        int v44 = (v39 - v40) * v38;
        do
        {
          unsigned int v45 = (unsigned __int16)(*(v41 - 1) + 1) | ((unsigned __int16)v41[3] << 16);
          uint64_t v46 = a1[32];
          unint64_t v47 = ((unint64_t)v41 - v46) >> 3;
          while (1)
          {
            unsigned __int16 v48 = (*v41 >> 2) + *(_WORD *)(a1[33] + 2 * ((int)v47 >> 6));
            int v49 = (unsigned __int16)v41[2];
            if (!v41[2]) {
              break;
            }
            unint64_t v50 = ((unint64_t)v41 - v46) >> 3;
            if (v50 - v49 == -1 || v39 >= v48 && (v39 != v48 || (unsigned __int16)v45 <= v43)) {
              break;
            }
            LODWORD(v47) = v50 - v49;
            int v41 = (_WORD *)(v46 + 8 * ((int)v50 - v49));
            unsigned int v45 = (unsigned __int16)(*(v41 - 1) + 1) | ((unsigned __int16)v41[3] << 16);
          }
          BOOL v51 = v39 != v48 || v43 < (unsigned __int16)v45;
          char v53 = !v51 && v43 <= (int)HIWORD(v45);
          v32[v44 - v42 + v43] = v53;
          unsigned int v42 = *v36;
          BOOL v51 = v43-- <= (int)v42;
        }
        while (!v51);
        unsigned int v40 = v36[2];
      }
      BOOL v51 = v39-- <= (int)v40;
    }
    while (!v51);
  }
  uint64_t v54 = v165;
  int v55 = v159;
  int v56 = v163;
  calculatePenaltiesForBestPath(v165, v159, (uint64_t)v32, (uint64_t)v30, (uint64_t)v163, 1);
  int v57 = v162;
  calculatePenaltiesForBestPath(v54, v55, (uint64_t)v32, v33, (uint64_t)v162, 0);
  uint64_t v58 = (uint64_t)v30;
  unint64_t v59 = v164;
  int PathStats = getPathStats(v54, v55, (uint64_t)v32, v58, (uint64_t)v56, v164, 1);
  uint64_t result = 0;
  if (!PathStats)
  {
    int v61 = getPathStats(v54, v55, (uint64_t)v32, v33 + (int)v155 * (uint64_t)v11, (uint64_t)v57, &v59[26 * (int)v54], 0);
    uint64_t result = 0;
    if (!v61)
    {
      v160 = v170;
      filterSplits((BOOL)v32, (uint64_t)v59, (uint64_t)v163, 1u, v54, v55);
      v161 = (float *)&v59[26 * (int)v54];
      filterSplits((BOOL)v32, (uint64_t)v161, (uint64_t)v57, 0, v54, v55);
      if (v55 >= 0) {
        int v62 = v55;
      }
      else {
        int v62 = v55 + 7;
      }
      if ((v158 & 0x80000000) != 0)
      {
LABEL_122:
        uint64_t v156 = 0;
        goto LABEL_124;
      }
      uint64_t v63 = 0;
      char v64 = 0;
      int v157 = (v62 >> 3) + 1;
      uint64_t v65 = 26 * (int)v54;
      BOOL v66 = (unsigned __int8 *)(v59 + 20);
      LODWORD(v67) = -1;
      LODWORD(v68) = -1;
      int v69 = v161;
      uint64_t v156 = v65;
      while (1)
      {
        unsigned int v70 = *v66;
        unsigned int v71 = v66[v65];
        if (v71 <= 0xFD) {
          uint64_t v67 = v63;
        }
        else {
          uint64_t v67 = v67;
        }
        if (v70 <= 0xFD) {
          uint64_t v68 = v63;
        }
        else {
          uint64_t v68 = v68;
        }
        if (v70 <= 0xFD || v71 <= 0xFD) {
          char v64 = 0;
        }
        if (v64) {
          BOOL v73 = 1;
        }
        else {
          BOOL v73 = v68 == -1;
        }
        if (v73 || v67 == -1) {
          goto LABEL_94;
        }
        uint64_t v75 = (uint64_t)&v59[26 * (int)v68];
        uint64_t v76 = (uint64_t)v69 + 26 * (int)v67;
        unsigned int v77 = *(unsigned __int8 *)(v75 + 22);
        unint64_t v158 = v75 + 22;
        int v79 = (unsigned __int8 *)(v76 + 22);
        unsigned int v78 = *(unsigned __int8 *)(v76 + 22);
        if (v77 >= v78) {
          unsigned int v80 = *(unsigned __int8 *)(v76 + 22);
        }
        else {
          unsigned int v80 = v77;
        }
        if (v77 <= v78) {
          unsigned int v81 = *(unsigned __int8 *)(v76 + 22);
        }
        else {
          unsigned int v81 = v77;
        }
        char v83 = v80 == 1 && v81 == 2;
        BOOL v84 = areCutsTooClose(v159, v68, v77, (_WORD *)v75, v67, v78, (_WORD *)v69 + 13 * (int)v67, v157 << v83);
        int v85 = 0;
        LOBYTE(v171[0]) = 0;
        if (!v84)
        {
          if (!isCuttingSerif ((uint64_t)v32, (unsigned __int16 *)v75, (unsigned __int16 *)v76, v165, v159, (BOOL *)v171)
            && !cutsCreateBadConcomp((uint64_t)v32, v75, (uint64_t)v163, v68, 1, v76, (uint64_t)v162, v67, 0, v165, v159))
          {
            unint64_t v59 = v164;
            uint64_t v54 = v165;
            int v69 = v161;
            uint64_t v65 = v156;
            goto LABEL_93;
          }
          int v85 = LOBYTE(v171[0]);
        }
        if ((int)v67 >= (int)v68)
        {
          uint64_t v54 = v165;
          int v69 = v161;
          if (v85)
          {
            unint64_t v59 = v164;
            if (*((unsigned __int8 *)v161 + 26 * (int)v67 + 20) <= 2
                                                                  * v164[26 * (int)v68 + 20])
              goto LABEL_91;
          }
          else
          {
            unsigned int v90 = *(unsigned __int8 *)v158;
            if (v90 <= 1) {
              unsigned int v90 = 1;
            }
            unsigned int v91 = v90 * v164[26 * (int)v68 + 20];
            unsigned int v92 = *v79;
            unint64_t v59 = v164;
            if (v92 <= 1) {
              unsigned int v92 = 1;
            }
            if (v91 >= v92 * *((unsigned __int8 *)v161 + 26 * (int)v67 + 20))
            {
LABEL_91:
              int v86 = &v59[26 * (int)v68 + 20];
              LODWORD(v68) = -1;
              goto LABEL_92;
            }
          }
        }
        else
        {
          uint64_t v54 = v165;
          int v69 = v161;
          if (v85)
          {
            unint64_t v59 = v164;
            if (v164[26 * (int)v68 + 20] > 2
                                                           * *((unsigned __int8 *)v161 + 26 * (int)v67 + 20))
              goto LABEL_91;
          }
          else
          {
            unsigned int v87 = *v79;
            if (v87 <= 1) {
              unsigned int v87 = 1;
            }
            unsigned int v88 = v87 * *((unsigned __int8 *)v161 + 26 * (int)v67 + 20);
            unsigned int v89 = *(unsigned __int8 *)v158;
            if (v89 <= 1) {
              unsigned int v89 = 1;
            }
            unint64_t v59 = v164;
            if (v88 < v89 * v164[26 * (int)v68 + 20]) {
              goto LABEL_91;
            }
          }
        }
        int v86 = (char *)v69 + 26 * (int)v67 + 20;
        LODWORD(v67) = -1;
LABEL_92:
        uint64_t v65 = v156;
        *int v86 = -2;
LABEL_93:
        char v64 = 1;
LABEL_94:
        v66 += 26;
        if (v54 == ++v63)
        {
          uint64_t v156 = 0;
          unsigned int v93 = 0;
          if (v152 <= 1) {
            int v94 = 1;
          }
          else {
            int v94 = v152;
          }
          while (1)
          {
            uint64_t v95 = v93 >> 1;
            int v96 = v164;
            if ((v93 & 1) == 0) {
              int v96 = (char *)v69;
            }
            unsigned int v97 = v96[26 * v95 + 20];
            if (v97 <= 0xFD)
            {
              int v98 = v156;
              int v99 = &v160[24 * (int)v156];
              v99[16] = 0;
              if (v93) {
                int v100 = v163;
              }
              else {
                int v100 = v162;
              }
              *((_DWORD *)v99 + 2) = v95;
              *((_DWORD *)v99 + 3) = v97;
              v99[17] = v96[26 * v95 + 22];
              v171[0] = MEMORY[0x1E4F143A8];
              v171[1] = 0x40000000;
              v171[2] = __markSplits_block_invoke;
              v171[3] = &__block_descriptor_tmp_35;
              v171[4] = v99;
              if ((walkPathAndReturnFinalColumn((uint64_t)v100, v165, v159, v95, v93 & 1, (uint64_t)v171) & 0x80000000) != 0) {
                goto LABEL_122;
              }
              uint64_t v156 = (v98 + 1);
              int v69 = v161;
              if (v98 == 7) {
                break;
              }
            }
            if (v94 == ++v93) {
              goto LABEL_124;
            }
          }
          uint64_t v156 = 8;
LABEL_124:
          uint64_t v101 = 0;
          uint64_t v102 = a1[35];
          uint64_t v103 = (unsigned __int16 *)(v102 + 100 * (int)v166);
          int v104 = v103[41];
          int v105 = v103[43];
          int v106 = v103[42];
          int v107 = v103[40];
          *(void *)&long long v167 = 0;
          uint64_t v108 = 1;
          unsigned int v109 = v156;
          do
          {
            BOOL v110 = v108;
            *((_DWORD *)v171 + v101) = -1;
            int v111 = *(_DWORD *)(v102 + 100 * (int)v166 + 4 * v101 + 64);
            if (v111 != -1)
            {
              unsigned int v112 = (unsigned __int16 *)(v102 + 100 * v111);
              *((_DWORD *)v171 + v101) = ((v112[41] + v112[40] + 1) >> 1) - v107;
              *((_DWORD *)&v168[-1] + v101) = ((v112[43] + v112[42] + 1) >> 1)
                                            - ((v105 + v106 + 1) >> 1);
            }
            uint64_t v108 = 0;
            uint64_t v101 = 1;
          }
          while (v110);
          uint64_t v113 = 0;
          int v157 = v104 - v107 + 1;
          int v114 = v105 - v106;
          uint64_t v115 = v102 + 100 * (int)v166;
          v161 = (float *)(v115 + 48);
          v164 = (char *)(v115 + 40);
          uint64_t v165 = (int)v109;
          unint64_t v158 = v109;
          do
          {
            v116 = v160;
            if (v113 < v165) {
              v160[24 * v113 + 16] = 0;
            }
            if (v113) {
              int v117 = *(_DWORD *)&v116[24 * (v113 - 1) + 8];
            }
            else {
              int v117 = 0;
            }
            int v118 = v157;
            if (v113 < v165) {
              int v118 = *(_DWORD *)&v116[24 * v113 + 8];
            }
            uint64_t v119 = 0;
            v162 = &v116[24 * v113 + 16];
            v163 = &v116[24 * (v113 - 1) + 16];
            char v120 = 1;
            do
            {
              char v121 = v120;
              if ((*((_DWORD *)&v168[-1] + v119) & 0x80000000) != 0)
              {
                int v122 = *((_DWORD *)v171 + v119);
                BOOL v123 = v117 < v122 && v122 < v118;
                if (v123 && 4 * (v118 - v117) / 3 <= v114)
                {
                  BOOL v110 = diacriticLooksLikeDot((uint64_t)a1, *(_DWORD *)(v102 + 100 * (int)v166 + 4 * v119 + 64));
                  if (v110 && (*(_DWORD *)v164 != 78 || *v161 <= 0.8))
                  {
                    if (v113 < v165) {
                      ++*v162;
                    }
                    if (v113) {
                      ++*v163;
                    }
                  }
                }
              }
              char v120 = 0;
              uint64_t v119 = 1;
            }
            while ((v121 & 1) != 0);
            BOOL v73 = v113++ == v158;
          }
          while (!v73);
          int v125 = v156;
          unsigned int v126 = v159;
          if ((int)v156 < 1) {
            return 0;
          }
          unint64_t v127 = 0;
          int v128 = 0;
          uint64_t v129 = 24 * v158;
          do
          {
            int v130 = &v168[v127 / 8];
            if (v170[v127 + 16]) {
              int v131 = v128 + 1;
            }
            else {
              int v131 = 0;
            }
            if (v131 >= 3)
            {
              if (*((unsigned __int8 *)v130 + 16) < 2u)
              {
                int v131 = v128 + 1;
              }
              else
              {
                *((unsigned char *)v130 + 16) = 0;
                int v131 = 1;
              }
            }
            v127 += 24;
            int v128 = v131;
          }
          while (v129 != v127);
          char v169 = 1;
          LOBYTE(v168[3 * (v125 + 1) + 2]) = 1;
          if ((v155 & 0x80000000) == 0)
          {
            v132 = (_WORD *)v168[0];
            uint64_t v133 = (_WORD *)v168[3 * (v125 + 1)];
            uint64_t v134 = v126;
            do
            {
              *v132++ = 0;
              *v133++ = -1;
              --v134;
            }
            while (v134);
          }
          MEMORY[0x1F4188790](v110);
          int v137 = (int *)&v151[-((v136 + 15) & 0x7FFFFFFF0)];
          int v138 = 0;
          LODWORD(v139) = 0;
          v164 = (char *)v171 + 4;
          v140 = v135 + 2;
          int v141 = 1;
          while (2)
          {
            uint64_t v142 = &v140[3 * v141];
            uint64_t v143 = v141 - 1;
            while (!*v142)
            {
              ++v141;
              v142 += 24;
              if (++v143 > v165) {
                goto LABEL_186;
              }
            }
            v144 = (__int16 *)*((void *)v142 - 2);
            if (!v138 && *v144 == -1)
            {
              splitCCIfGood((size_t)a1, v166, v166, (uint64_t)v168, 0, v141, (uint64_t)v171);
              int v138 = v171[0];
              long long v167 = *(_OWORD *)v164;
              int v147 = HIDWORD(v167);
              if (HIDWORD(v167)) {
                goto LABEL_184;
              }
              goto LABEL_181;
            }
            int v145 = createAndRecognizeSubConcomp((size_t)a1, v166, (_WORD *)v135[3 * v138], (uint64_t)v144);
            if (v145 != -1)
            {
              int v146 = v145;
              if (v141 - v138 < 2
                || !shouldTestSplit(a1[35] + 100 * v145)
                || (splitCCIfGood((size_t)a1, v166, v146, (uint64_t)v168, v138, v141, (uint64_t)v171),
                    int v141 = v171[0],
                    long long v167 = *(_OWORD *)v164,
                    int v147 = HIDWORD(v167),
                    int v138 = v171[0],
                    !HIDWORD(v167)))
              {
                v137[(int)v139] = v146;
                LODWORD(v139) = v139 + 1;
                int v138 = v141;
                goto LABEL_181;
              }
LABEL_184:
              if (v147 >= 1)
              {
                memcpy(&v137[(int)v139], &v167, 4 * v147);
                LODWORD(v139) = v139 + v147;
              }
LABEL_181:
              v135 = v168;
              int v141 = v138 + 1;
              if (v138 <= (int)v156) {
                continue;
              }
LABEL_186:
              if ((int)v139 < 1) {
                return 0;
              }
              uint64_t v148 = 0;
              while (v137[v148] != -1)
              {
                if (++v148 >= (unint64_t)v139)
                {
                  setDiacriticsOnSubCC((uint64_t)a1, v166, v137, v139, 0);
                  v149 = v154;
                  int *v149 = v139 + FKSequencesReplaceConcomp(a1, v153, *v154, v137, v139) - 1;
                  return 1;
                }
              }
              goto LABEL_192;
            }
            break;
          }
          if ((int)v139 <= 0) {
            return 0;
          }
LABEL_192:
          uint64_t v139 = v139;
          do
          {
            int v150 = *v137++;
            FKConcompRelease((uint64_t)a1, v150, 0);
            uint64_t result = 0;
            --v139;
          }
          while (v139);
          return result;
        }
      }
    }
  }
  return result;
}

uint64_t createAndRecognizeSubConcomp(size_t a1, int a2, _WORD *a3, uint64_t a4)
{
  uint64_t SubConcomp = FKConcompCreateSubConcomp(a1, a2, a3, a4);
  int v27 = SubConcomp;
  if (SubConcomp == -1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = SubConcomp;
  uint64_t v9 = *(void *)(a1 + 280);
  uint64_t v10 = v9 + 100 * a2;
  int v11 = *(unsigned __int16 *)(v10 + 86);
  int v12 = *(unsigned __int16 *)(v10 + 84);
  int v13 = (unsigned __int16 *)(v9 + 100 * (int)SubConcomp);
  int v14 = v11 - v12;
  unsigned int v15 = v13[43];
  unsigned int v16 = v13[42];
  int v17 = v15 - v16 + 1;
  if ((*(unsigned char *)(v10 + 93) & 3) != 0) {
    int v18 = 4;
  }
  else {
    int v18 = 3;
  }
  int v19 = v18 * v17;
  int v20 = 2 * v17;
  BOOL v21 = v19 > v14 || v13[41] - v13[40] + 1 < v20;
  if (v21 || (int v22 = v14 + 1, (int)(5 * (v11 - v15)) <= v22) || (int)(5 * (v16 - v12)) <= v22)
  {
    unsigned int v24 = (v11 + v12 + 1) >> 1;
    if (v24 < v15 && v24 > v16)
    {
      setDiacriticsOnSubCC(a1, a2, &v27, 1, 1);
      FKRecognizeConcomp(a1, (uint64_t)v13);
      return v8;
    }
    return 0xFFFFFFFFLL;
  }
  int v23 = SubConcomp;
  ccSetStr((float32x4_t *)(v9 + 100 * (int)SubConcomp), 0x2Du, 1, v7);
  *(unsigned char *)(v9 + 100 * v23 + 94) |= 9u;
  return v8;
}

uint64_t splitCCIfGood@<X0>(size_t a1@<X0>, int a2@<W1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  int v9 = a3;
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(_DWORD *)(a7 + 16) = 0;
  int v13 = ~a5 + a6;
  uint64_t v109 = 0;
  uint64_t v110 = 0;
  float v112 = 0.0;
  uint64_t v111 = 0;
  if (a3 == -1) {
    float ConfusionScoreForCC = 0.0;
  }
  else {
    float ConfusionScoreForCC = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * a3);
  }
  int v98 = a5;
  int v95 = v13;
  float v92 = ConfusionScoreForCC;
  if (v13 < 3)
  {
    int v15 = a5;
    if (v13 == 1)
    {
      uint64_t v19 = a4 + 24 * a5;
      int v20 = (void *)(a4 + 24 * v15);
      int v23 = (_WORD *)*v20;
      int v22 = v20 + 6;
      BOOL v21 = v23;
      uint64_t v25 = *(void *)(v19 + 24);
      unsigned int v24 = (_WORD **)(v19 + 24);
      int v26 = createAndRecognizeSubConcomp(a1, a2, v21, v25);
      int v96 = 1;
      int v97 = -1;
      float v93 = 0.0;
      int v99 = -1;
      int v27 = -1;
      int v28 = -1;
      goto LABEL_12;
    }
    uint64_t v16 = a5 + 3;
    goto LABEL_10;
  }
  int v15 = a5;
  uint64_t v16 = a5 + 3;
  int v17 = createAndRecognizeSubConcomp(a1, a2, *(_WORD **)(a4 + 24 * a5), *(void *)(a4 + 24 * a5 + 72));
  if (v17 == -1)
  {
LABEL_10:
    int v96 = 1;
    int v97 = -1;
    float v18 = 0.0;
    goto LABEL_11;
  }
  int v97 = v17;
  float v18 = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * v17);
  int v96 = 0;
LABEL_11:
  float v93 = v18;
  uint64_t v29 = 24 * v15;
  uint64_t v30 = a4 + 24 * a5;
  uint64_t v31 = *(void *)(v30 + 24);
  unsigned int v24 = (_WORD **)(v30 + 24);
  int v26 = createAndRecognizeSubConcomp(a1, a2, *(_WORD **)(a4 + v29), v31);
  int v99 = createAndRecognizeSubConcomp(a1, a2, *v24, (uint64_t)v24[3]);
  int v22 = (uint64_t *)(a4 + 24 * v16);
  int v27 = createAndRecognizeSubConcomp(a1, a2, v24[3], *v22);
  int v28 = createAndRecognizeSubConcomp(a1, a2, *(_WORD **)(a4 + v29), (uint64_t)v24[3]);
LABEL_12:
  int v32 = createAndRecognizeSubConcomp(a1, a2, *v24, *v22);
  float v33 = 0.0;
  float v34 = 0.0;
  if (v26 != -1) {
    float v34 = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * v26);
  }
  if (v99 != -1) {
    float v33 = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * v99);
  }
  float v35 = 0.0;
  float v36 = 0.0;
  if (v27 != -1) {
    float v36 = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * v27);
  }
  if (v28 != -1) {
    float v35 = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * v28);
  }
  float v37 = 0.0;
  float v38 = 0.0;
  if (v32 != -1) {
    float v38 = getConfusionScoreForCC(*(void *)(a1 + 280) + 100 * v32);
  }
  if (isFeasablePart(a1, a2, v26)) {
    float v39 = v34;
  }
  else {
    float v39 = 0.0;
  }
  if (isFeasablePart(a1, a2, v99)) {
    float v40 = v33;
  }
  else {
    float v40 = 0.0;
  }
  if (!isFeasablePart(a1, a2, v27)) {
    float v36 = 0.0;
  }
  if (isFeasablePart(a1, a2, v28)) {
    float v41 = v35;
  }
  else {
    float v41 = 0.0;
  }
  if (!isFeasablePart(a1, a2, v32)) {
    float v38 = 0.0;
  }
  if (!v96) {
    int v9 = v97;
  }
  v108[0] = v26;
  v108[1] = v99;
  v108[2] = v27;
  v107[0] = v26;
  v107[1] = v32;
  v106[0] = v28;
  v106[1] = v27;
  uint64_t v42 = a4 + 24 * v98;
  uint64_t v43 = v42 + 24;
  uint64_t v44 = v42 + 48;
  if (isSaneSplit(a1, v9, v108, 3, v42 + 24, 1u))
  {
    if (v39 >= v40) {
      float v45 = v40;
    }
    else {
      float v45 = v39;
    }
    if (v36 >= v45) {
      float v37 = v45;
    }
    else {
      float v37 = v36;
    }
    *(float *)&uint64_t v109 = v37;
  }
  float v46 = 0.0;
  float v47 = 0.0;
  if (isSaneSplit(a1, v9, v108, 2, v43, 1u))
  {
    if (v39 >= v40) {
      float v47 = v40;
    }
    else {
      float v47 = v39;
    }
    *(float *)&uint64_t v111 = v47;
  }
  if (isSaneSplit(a1, v9, v106, 2, v44, 1u))
  {
    if (v41 >= v36) {
      float v46 = v36;
    }
    else {
      float v46 = v41;
    }
    *((float *)&v109 + 1) = v46;
  }
  float v91 = v36;
  *((float *)&v111 + 1) = v41;
  uint64_t result = isSaneSplit(a1, v9, v107, 2, v43, 1u);
  if (result)
  {
    if (v39 >= v38) {
      float v49 = v38;
    }
    else {
      float v49 = v39;
    }
    *(float *)&uint64_t v110 = v49;
  }
  else
  {
    float v49 = 0.0;
  }
  float v90 = v38;
  if (v28 == -1)
  {
    float v112 = v39;
    *((float *)&v110 + 1) = v93;
    int v53 = 1;
    float v52 = v39;
  }
  else
  {
    BOOL v50 = isSaneSplit(a1, v28, v108, 2, v43, 0);
    uint64_t v51 = 24;
    if (v50)
    {
      float v52 = v39;
    }
    else
    {
      uint64_t v51 = 16;
      float v52 = 0.0;
    }
    if (!v50) {
      float v47 = 0.0;
    }
    *(float *)((char *)&v109 + v51) = v52;
    *((float *)&v110 + 1) = v93;
    uint64_t result = shouldTestSplit(*(void *)(a1 + 280) + 100 * v28);
    int v53 = result;
  }
  if (v32 == -1)
  {
    int v54 = 1;
  }
  else
  {
    uint64_t result = shouldTestSplit(*(void *)(a1 + 280) + 100 * v32);
    int v54 = result;
  }
  if (v95 >= 3)
  {
    int v55 = v97;
    if (v96)
    {
      uint64_t result = 1;
    }
    else
    {
      uint64_t v62 = *(void *)(a1 + 280);
      uint64_t v63 = v62 + 100 * v97;
      char v64 = *(unsigned char *)(v63 + 40);
      if (!v64) {
        goto LABEL_112;
      }
      unsigned int v65 = 0;
      BOOL v66 = (unsigned __int8 *)(v62 + 100 * v97 + 41);
      do
      {
        if ((v64 & 0xC0) != 0x80) {
          ++v65;
        }
        int v67 = *v66++;
        char v64 = v67;
      }
      while (v67);
      if (v65 < 2) {
        goto LABEL_112;
      }
      if (concatenatedCCsMatchCC(a1, v26, v32, v63))
      {
        float v68 = v90;
        if (v39 < v90) {
          float v68 = v39;
        }
        if (v68 > 0.9) {
          goto LABEL_111;
        }
      }
      if (concatenatedCCsMatchCC(a1, v28, v27, v63) && (v41 >= v91 ? (float v69 = v91) : (float v69 = v41), v69 > 0.9)) {
LABEL_111:
      }
        uint64_t result = 0;
      else {
LABEL_112:
      }
        uint64_t result = shouldTestSplit(v63);
    }
    if (v41 <= v47) {
      float v70 = v47;
    }
    else {
      float v70 = v41;
    }
    if (v70 <= v52) {
      float v70 = v52;
    }
    if (v93 > v70 || (v93 > 0.8 ? (BOOL v71 = result == 0) : (BOOL v71 = 0), v71))
    {
      unint64_t v58 = 3;
    }
    else if (v53 && v52 != 0.0 {
           || (v41 > 0.9 ? (v72 = v54 == 0) : (v72 = 1), v72 && (v47 <= v52 ? (float v73 = v52) : (float v73 = v47), v41 <= v73)))
    }
    {
      if (v47 <= v52) {
        unint64_t v58 = 6;
      }
      else {
        unint64_t v58 = 4;
      }
    }
    else
    {
      unint64_t v58 = 5;
    }
    goto LABEL_136;
  }
  if (v53) {
    BOOL v56 = v54 == 0;
  }
  else {
    BOOL v56 = 1;
  }
  int v57 = !v56;
  int v55 = v97;
  if (!v56 && v37 > v49 && v37 > v46)
  {
    unint64_t v58 = 0;
LABEL_136:
    float v59 = v92;
    goto LABEL_137;
  }
  float v59 = v92;
  if (v37 > 0.99)
  {
    float v60 = v46 <= v49 ? v49 : v46;
    if (v60 < 0.9)
    {
      unint64_t v58 = 0;
LABEL_137:
      int v61 = v99;
      goto LABEL_138;
    }
  }
  if (!(v53 | v54))
  {
    if (v49 <= v46) {
      unint64_t v58 = 1;
    }
    else {
      unint64_t v58 = 2;
    }
    goto LABEL_137;
  }
  int v61 = v99;
  if (v57)
  {
    if (v49 <= v46) {
      unint64_t v58 = 1;
    }
    else {
      unint64_t v58 = 2;
    }
  }
  else if (v53)
  {
    unint64_t v58 = 2;
  }
  else
  {
    unint64_t v58 = 1;
  }
LABEL_138:
  unsigned int v74 = 0;
  float v75 = *((float *)&v109 + v58);
  int v100 = v26;
  int v101 = v61;
  int v102 = v27;
  int v103 = v28;
  int v104 = v32;
  int v105 = v55;
  *(_DWORD *)(a7 + 16) = 0;
  if (((0x2AuLL >> v58) & 1) == 0)
  {
    unsigned int v74 = 1;
    *(_DWORD *)(a7 + 16) = 1;
    *(_DWORD *)(a7 + 4) = v26;
    int v100 = -1;
  }
  if ((v58 & 3) == 1)
  {
    uint64_t v76 = &v103;
  }
  else
  {
    if ((v58 & 3) != 0) {
      goto LABEL_145;
    }
    uint64_t v76 = &v101;
    int v28 = v61;
  }
  uint64_t v77 = a7 + 4 * v74++;
  *(_DWORD *)(a7 + 16) = v74;
  *(_DWORD *)(v77 + 4) = v28;
  int *v76 = -1;
LABEL_145:
  if (v58 == 2)
  {
    int v78 = 0;
    int v79 = &v104;
LABEL_151:
    *(_DWORD *)(a7 + 16) = v74 + 1;
    *(_DWORD *)(a7 + 4 * v74 + 4) = v32;
    *int v79 = -1;
    goto LABEL_152;
  }
  if (v58 < 2)
  {
    int v78 = 0;
    int v79 = &v102;
    int v32 = v27;
    goto LABEL_151;
  }
  if (v58 == 3)
  {
    int v79 = &v105;
    int v78 = 1;
    int v32 = v55;
    goto LABEL_151;
  }
  int v78 = 0;
LABEL_152:
  int v80 = *(_DWORD *)(a7 + 16);
  if (v80 < 1)
  {
LABEL_156:
    int v84 = 0;
  }
  else
  {
    unsigned int v81 = (int *)(a7 + 4);
    uint64_t v82 = *(unsigned int *)(a7 + 16);
    while (1)
    {
      int v83 = *v81++;
      if (v83 == -1) {
        break;
      }
      if (!--v82) {
        goto LABEL_156;
      }
    }
    int v84 = 1;
  }
  uint64_t v85 = 0;
  if (v59 >= v75) {
    int v86 = 1;
  }
  else {
    int v86 = v84;
  }
  do
  {
    int v87 = *(int *)((char *)&v100 + v85);
    if (v87 != -1) {
      uint64_t result = FKConcompRelease(a1, v87, 0);
    }
    v85 += 4;
  }
  while (v85 != 24);
  *(_DWORD *)a7 = a6;
  if (v86)
  {
    if (v80 >= 1)
    {
      uint64_t v88 = 0;
      uint64_t v89 = a7 + 4;
      do
      {
        uint64_t result = FKConcompRelease(a1, *(_DWORD *)(v89 + 4 * v88), 0);
        *(_DWORD *)(v89 + 4 * v88++) = -1;
      }
      while (v88 < *(int *)(a7 + 16));
    }
    *(_DWORD *)(a7 + 16) = 0;
  }
  else if (v95 >= 3)
  {
    *(_DWORD *)a7 = v98 + 1;
    if ((0x4CuLL >> v58))
    {
      if (v78) {
        *(_DWORD *)a7 = v98 + 3;
      }
    }
    else
    {
      *(_DWORD *)a7 = v98 + 2;
    }
  }
  return result;
}

uint64_t setDiacriticsOnSubCC(uint64_t result, int a2, int *a3, int a4, int a5)
{
  uint64_t v5 = *(void *)(result + 280);
  if (a4 >= 1)
  {
    uint64_t v6 = a4;
    double v7 = a3;
    do
    {
      int v9 = *v7++;
      int v8 = v9;
      if (v9 != -1) {
        *(void *)(v5 + 64 + 100 * v8) = -1;
      }
      --v6;
    }
    while (v6);
  }
  uint64_t v10 = 0;
  char v11 = 1;
  uint64_t v12 = v5 + 100 * a2;
  do
  {
    int v13 = *(_DWORD *)(v12 + 4 * v10 + 64);
    if (v13 == -1) {
      break;
    }
    char v14 = v11;
    if (a4 >= 1)
    {
      uint64_t v15 = 0;
      int v16 = 0;
      int v17 = 0xFFFF;
      while (1)
      {
        uint64_t result = a3[v15];
        if (result != -1)
        {
          uint64_t v18 = v5 + 100 * (int)result;
          int v19 = *(unsigned __int16 *)(v5 + 100 * v13 + 80) - *(unsigned __int16 *)(v18 + 80);
          if (v19 < 0) {
            int v19 = *(unsigned __int16 *)(v18 + 80) - *(unsigned __int16 *)(v5 + 100 * v13 + 80);
          }
          int v20 = *(unsigned __int16 *)(v5 + 100 * v13 + 82) - *(unsigned __int16 *)(v18 + 82);
          if (v20 < 0) {
            int v20 = -v20;
          }
          uint64_t result = (v20 + v19);
          if ((int)result >= v17) {
            goto LABEL_20;
          }
          int v17 = result;
          int v16 = v15;
        }
        if (a4 == ++v15) {
          goto LABEL_20;
        }
      }
    }
    int v16 = 0;
    int v17 = 0xFFFF;
LABEL_20:
    int v21 = a3[v16];
    if (!a5
      || ((int v22 = *(unsigned __int16 *)(v5 + 100 * v21 + 82) - *(unsigned __int16 *)(v5 + 100 * v21 + 80),
           uint64_t result = (v22 + 2),
           v22 + 1 >= 0)
        ? (int v23 = v22 + 1)
        : (int v23 = v22 + 2),
          v17 > v23 >> 1))
    {
      uint64_t v24 = 0;
      char v25 = 1;
      while (1)
      {
        char v26 = v25;
        uint64_t v27 = v5 + 100 * v21 + 4 * v24;
        int v29 = *(_DWORD *)(v27 + 64);
        int v28 = (_DWORD *)(v27 + 64);
        if (v29 == -1) {
          break;
        }
        char v25 = 0;
        uint64_t v24 = 1;
        if ((v26 & 1) == 0) {
          goto LABEL_30;
        }
      }
      *int v28 = v13;
    }
LABEL_30:
    char v11 = 0;
    uint64_t v10 = 1;
  }
  while ((v14 & 1) != 0);
  return result;
}

uint64_t calculatePenaltiesForBestPath(uint64_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6 = (int *)&unk_1DCC6EAB0;
  if (!a6) {
    uint64_t v6 = (int *)&unk_1DCC6EAC0;
  }
  if (a2 >= 1)
  {
    int v7 = 0;
    int v8 = *v6;
    do
    {
      if ((int)result >= 1)
      {
        uint64_t v9 = 0;
        int v10 = ~v7 + a2;
        if (!a6) {
          int v10 = v7;
        }
        uint64_t v11 = v10 * (int)result;
        do
        {
          char v12 = 0;
          uint64_t v13 = v9 + v11;
          int v14 = 255;
          if (v9 && v9 != result - 1)
          {
            unint64_t v15 = 0;
            char v12 = v8;
            do
            {
              int v16 = v6[v15];
              if (*(unsigned char *)(a3 + v13))
              {
                int v17 = *((_DWORD *)&choiceTable + 5 * v16 + 1);
              }
              else
              {
                int v17 = *((_DWORD *)&choiceTable + 5 * v16);
                if (((0xB5uLL >> v16) & 1) == 0)
                {
                  uint64_t v18 = (char *)&choiceTable + 20 * v16;
                  int v19 = *((_DWORD *)v18 + 2);
                  uint64_t v20 = *((int *)v18 + 3);
                  int v21 = v13 + v19 * result;
                  if (!*(unsigned char *)(a3 + v20 + v21)
                    && *(unsigned __int8 *)(a3 + v13 + v20) + *(unsigned __int8 *)(a3 + v21) == 2)
                  {
                    ++v17;
                  }
                }
              }
              int v23 = v17
                  + *(unsigned __int8 *)(a4
                                       + *((int *)&choiceTable + 5 * v16 + 3)
                                       + (uint64_t)((int)v13 + *((_DWORD *)&choiceTable + 5 * v16 + 2) * (int)result));
              if (v23 < v14)
              {
                char v12 = *((unsigned char *)&choiceTable + 20 * v16 + 17);
                int v14 = v23;
              }
              if (v15 > 2) {
                break;
              }
              ++v15;
            }
            while (v7);
          }
          *(unsigned char *)(a4 + v13) = v14;
          *(unsigned char *)(a5 + v13) = v12;
          ++v9;
        }
        while (v9 != result);
        if (v7 && (int)result >= 3)
        {
          uint64_t v24 = a5 + v11;
          uint64_t v25 = a3 + v11;
          uint64_t v26 = a4 + v11;
          uint64_t v27 = (int)result - 2;
          do
          {
            if (*(unsigned char *)(v25 + v27)) {
              int v28 = 7;
            }
            else {
              int v28 = 2;
            }
            unsigned int v29 = v28 + *(unsigned __int8 *)(v26 + v27 + 1);
            if (v29 < *(unsigned __int8 *)(v26 + v27))
            {
              *(unsigned char *)(v26 + v27) = v29;
              *(unsigned char *)(v24 + v27) = 5;
            }
          }
          while (v27-- > 1);
        }
      }
      ++v7;
    }
    while (v7 != a2);
  }
  return result;
}

uint64_t getPathStats(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, int a7)
{
  int v7 = a6;
  bzero(a6, 26 * a1);
  if (a1 >= 1)
  {
    uint64_t v11 = 0;
    int v12 = 1;
    uint64_t v24 = v7;
    while (1)
    {
      if (!v11 || a1 - 1 == v11)
      {
        v7[20] = -1;
      }
      else
      {
        uint64_t v72 = 0;
        float v73 = &v72;
        uint64_t v74 = 0x2000000000;
        int v75 = 0;
        uint64_t v67 = 0;
        float v68 = &v67;
        uint64_t v69 = 0x2000000000;
        __int16 v70 = v11;
        __int16 v71 = v11;
        uint64_t v63 = 0;
        char v64 = &v63;
        uint64_t v65 = 0x2000000000;
        uint64_t v66 = 0;
        uint64_t v59 = 0;
        float v60 = &v59;
        uint64_t v61 = 0x2000000000;
        int v62 = 0;
        uint64_t v55 = 0;
        BOOL v56 = &v55;
        uint64_t v57 = 0x2000000000;
        int v58 = 0;
        uint64_t v51 = 0;
        float v52 = &v51;
        uint64_t v53 = 0x2000000000;
        char v54 = 0;
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x2000000000;
        int v50 = 0;
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x2000000000;
        int v48 = v11;
        uint64_t v43 = 0;
        uint64_t v44 = &v43;
        uint64_t v45 = 0x2000000000;
        char v46 = 0;
        uint64_t v39 = 0;
        float v40 = &v39;
        uint64_t v41 = 0x2000000000;
        char v42 = 0;
        uint64_t v35 = 0;
        float v36 = &v35;
        uint64_t v37 = 0x2000000000;
        char v38 = 0;
        uint64_t v31 = 0;
        int v32 = &v31;
        uint64_t v33 = 0x2000000000;
        char v34 = 0;
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 0x40000000;
        v27[2] = __getPathStats_block_invoke;
        v27[3] = &unk_1E6CAADF0;
        v27[16] = a5;
        v27[17] = a3;
        v27[4] = &v35;
        v27[5] = &v51;
        v27[6] = &v63;
        v27[7] = v49;
        int v28 = a1;
        int v29 = a2;
        v27[8] = v47;
        v27[9] = &v43;
        v27[10] = &v55;
        v27[11] = &v59;
        v27[18] = v24;
        int v30 = v11;
        v27[12] = &v72;
        v27[13] = &v31;
        v27[14] = &v39;
        v27[15] = &v67;
        int v13 = walkPathAndReturnFinalColumn(a5, a1, a2, v11, a7, (uint64_t)v27);
        if ((v13 & 0x80000000) == 0)
        {
          int v14 = v73;
          if (*((unsigned char *)v52 + 24))
          {
            int v15 = *((_DWORD *)v73 + 6);
            if (v15 <= 1)
            {
              *(void *)&v7[8 * v15] = v64[3];
              int v15 = *((_DWORD *)v14 + 6);
            }
            *((_DWORD *)v14 + 6) = v15 + 1;
          }
          int v16 = v60;
          v7[21] = *((_DWORD *)v60 + 6);
          *((_DWORD *)v7 + 4) = *((_DWORD *)v68 + 6);
          v7[20] = *(unsigned char *)(a4 + v11);
          int v17 = *((unsigned __int8 *)v36 + 24);
          BOOL v19 = v17 == 7 || v17 == 2;
          v7[25] = v19;
          int v20 = *((_DWORD *)v14 + 6);
          v7[22] = v20;
          if (v20 == 1)
          {
            if (*((unsigned char *)v44 + 24) || (char v21 = *((unsigned char *)v40 + 24)) != 0) {
              char v21 = *((_DWORD *)v56 + 6) > *((_DWORD *)v16 + 6) / 2;
            }
          }
          else
          {
            char v21 = 0;
          }
          v7[23] = v21;
          v7[24] = *((unsigned char *)v32 + 24);
        }
        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(v47, 8);
        _Block_object_dispose(v49, 8);
        _Block_object_dispose(&v51, 8);
        _Block_object_dispose(&v55, 8);
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
        _Block_object_dispose(&v67, 8);
        _Block_object_dispose(&v72, 8);
        if (v13 < 0) {
          return (v12 << 31 >> 31);
        }
      }
      int v12 = ++v11 < a1;
      v7 += 26;
      if (a1 == v11) {
        return (v12 << 31 >> 31);
      }
    }
  }
  int v12 = 0;
  return (v12 << 31 >> 31);
}

BOOL filterSplits(BOOL result, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t v43 = result;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  int v6 = a6 + 7;
  int v49 = 0;
  __int16 v50 = 0;
  __int16 v51 = a6 - 1;
  if (a6 >= 0) {
    int v6 = a6;
  }
  int v7 = v6 >> 3;
  uint64_t v8 = (a5 - 1);
  __int16 v52 = a5 - 1;
  __int16 v53 = a5 - 1;
  if (a6 < 8) {
    int v9 = 1;
  }
  else {
    int v9 = v7;
  }
  __int16 v54 = 0;
  __int16 v55 = a6 - 1;
  if (a5 >= 3)
  {
    int v11 = 0;
    int v47 = a5 - v9;
    int v37 = 3 * a6 / 4;
    int v38 = a6 / 4;
    int v44 = v7 + 1;
    int v12 = 3 * (v7 + 1);
    int v13 = (unsigned __int16 *)(a2 + 42);
    unsigned int v46 = -1;
    uint64_t v14 = 1;
    while (1)
    {
      unsigned int v15 = *((unsigned __int8 *)v13 + 6);
      BOOL v16 = areCutsTooClose(a6, v14, v15, v13 - 8, 0, 2u, &v49, v9);
      BOOL v17 = v9 > *v13 || v47 < v13[1];
      uint64_t result = areCutsTooClose(a6, v14, *((unsigned __int8 *)v13 + 32), v13 + 5, 0, 2u, &v49, v9);
      unsigned int v18 = *((unsigned __int8 *)v13 + 4);
      unsigned int v19 = *((unsigned __int8 *)v13 + 30);
      if (v18 < v19 || v19 == 255 || result)
      {
        BOOL v20 = v11 != 0;
        if (v11 && v18 < v19 || v18 < v19 && *((unsigned char *)v13 + 9) && !*((unsigned char *)v13 - 17))
        {
          BOOL v20 = 1;
          goto LABEL_23;
        }
      }
      else
      {
        *((unsigned char *)v13 + 4) = -1;
        int v11 = 1;
        BOOL v20 = 1;
      }
      if (!result) {
        BOOL v20 = 0;
      }
LABEL_23:
      if (v15 <= 2 && !v16 && !v17 && v20)
      {
        int v21 = 0;
        BOOL v48 = 0;
        if (v15 != 1) {
          goto LABEL_31;
        }
        if (*((unsigned char *)v13 + 8)) {
          goto LABEL_61;
        }
        if (*(v13 - 7) - *(v13 - 8) <= v44 && (int v22 = *(v13 - 5), v23 = *(v13 - 6), v22 - v23 <= v44))
        {
          int v21 = 0;
          signed int v36 = (v23 + v22) >> 1;
          if (v36 >= v38 && v36 <= v37) {
            int v21 = *((unsigned __int8 *)v13 + 7);
          }
        }
        else
        {
          int v21 = 0;
        }
LABEL_31:
        if (v21 || (v46 & 0x80000000) != 0)
        {
          if (v21) {
            goto LABEL_61;
          }
          uint64_t result = cutsCreateBadConcomp(v43, 0, 0, v46, a4, (uint64_t)(v13 - 8), a3, v14, a4, a5, a6);
          int v32 = !result;
        }
        else
        {
          BOOL v39 = v21 == 0;
          uint64_t v24 = a2 + 26 * v46;
          unsigned int v25 = *(unsigned __int8 *)(v24 + 22);
          if (v25 >= v15) {
            unsigned int v26 = v15;
          }
          else {
            unsigned int v26 = *(unsigned __int8 *)(v24 + 22);
          }
          if (v25 <= v15) {
            unsigned int v27 = v15;
          }
          else {
            unsigned int v27 = *(unsigned __int8 *)(v24 + 22);
          }
          if (v27 == 2 && v26 == 1) {
            int v29 = v12 / 2;
          }
          else {
            int v29 = v44;
          }
          uint64_t result = areCutsTooClose(a6, v46, v25, (_WORD *)(a2 + 26 * v46), v14, v15, v13 - 8, v29);
          if (result
            || (uint64_t result = isCuttingSerif (v43, (unsigned __int16 *)v24, v13 - 8, a5, a6, &v48))
            || (uint64_t result = cutsCreateBadConcomp(v43, v24, a3, v46, a4, (uint64_t)(v13 - 8), a3, v14, a4, a5, a6)))
          {
            if (v48)
            {
              uint64_t v30 = a2;
              if (*((unsigned __int8 *)v13 + 4) <= 2 * *(unsigned __int8 *)(a2 + 26 * v46 + 20)) {
                goto LABEL_62;
              }
LABEL_61:
              LOBYTE(v31) = -2;
LABEL_66:
              int v11 = 0;
              goto LABEL_67;
            }
            unsigned int v33 = *(unsigned __int8 *)(v24 + 22);
            if (v33 <= 1) {
              unsigned int v33 = 1;
            }
            uint64_t v30 = a2;
            unsigned int v34 = v33 * *(unsigned __int8 *)(a2 + 26 * v46 + 20);
            unsigned int v35 = *((unsigned __int8 *)v13 + 6);
            if (v35 <= 1) {
              unsigned int v35 = 1;
            }
            if (v34 < v35 * *((unsigned __int8 *)v13 + 4)) {
              goto LABEL_61;
            }
LABEL_62:
            *(unsigned char *)(v30 + 26 * v46 + 20) = -2;
LABEL_63:
            unsigned int v31 = *((unsigned __int8 *)v13 + 4);
            if (v31 >= 0xFD) {
              LOBYTE(v31) = -3;
            }
            unsigned int v46 = v14;
            goto LABEL_66;
          }
          int v32 = v39;
        }
        if (!v32) {
          goto LABEL_61;
        }
        goto LABEL_63;
      }
      LOBYTE(v31) = -1;
LABEL_67:
      *((unsigned char *)v13 + 4) = v31;
      ++v14;
      v13 += 13;
      if (v8 == v14)
      {
        if ((v46 & 0x80000000) == 0)
        {
          uint64_t result = cutsCreateBadConcomp(v43, a2 + 26 * v46, a3, v46, a4, 0, 0, 0xFFFFFFFFLL, a4, a5, a6);
          if (result) {
            *(unsigned char *)(a2 + 26 * v46 + 20) = -2;
          }
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t walkPathAndReturnFinalColumn(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  if (a5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = (a3 - 1);
  }
  if ((int)v7 < a3 && (v7 & 0x80000000) == 0)
  {
    while (1)
    {
      int v12 = a4 + v7 * a2;
      unsigned int v13 = *(unsigned __int8 *)(a1 + v12);
      if (!*(unsigned char *)(a1 + v12)) {
        break;
      }
      if (a6) {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(a6 + 16))(a6, v7, a4);
      }
      uint64_t v14 = (char *)&choiceTable + 20 * v13;
      uint64_t v7 = (*((_DWORD *)v14 + 2) + v7);
      a4 = (*((_DWORD *)v14 + 3) + a4);
      if ((int)v7 >= a3 || (v7 & 0x80000000) != 0) {
        return a4;
      }
    }
    return 0xFFFFFFFFLL;
  }
  return a4;
}

uint64_t __getPathStats_block_invoke(uint64_t result, int a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (!*(unsigned char *)(v3 + 24)) {
    *(unsigned char *)(v3 + 24) = *(unsigned char *)(*(void *)(result + 128) + a3 + *(int *)(result + 152) * (uint64_t)a2);
  }
  uint64_t v4 = *(void *)(result + 136);
  int v5 = *(_DWORD *)(result + 152);
  int v6 = v5 * a2;
  uint64_t v7 = v5 * a2 + (uint64_t)a3;
  if (*(unsigned char *)(v4 + v7))
  {
    uint64_t v8 = result + 40;
    uint64_t v9 = *(void *)(result + 128);
    unsigned int v10 = *(unsigned __int8 *)(v9 + v7);
    if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
    {
      int v37 = *(_WORD **)(*(void *)(result + 48) + 8);
      v37[12] = a3;
      v37[13] = a3;
      v37[14] = a2;
      v37[15] = a2;
      int v38 = *(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 24);
      if (v38 >= 1 && v38 < *(_DWORD *)(result + 156) - 1)
      {
        int v39 = v38 * v5;
        uint64_t v40 = *(int *)(*(void *)(*(void *)(result + 64) + 8) + 24);
        uint64_t v41 = v40 + v39;
        switch(*(unsigned char *)(v9 + v41))
        {
          case 1:
          case 6:
            uint64_t v42 = v41 + v4;
            int v43 = *(unsigned __int8 *)(v4 + v6 + (int)v40 + 1);
            int v44 = *(unsigned __int8 *)(v42 + 1);
            goto LABEL_49;
          case 3:
          case 8:
            uint64_t v49 = v41 + v4;
            int v43 = *(unsigned __int8 *)(v4 + v6 + (int)v40 - 1);
            int v44 = *(unsigned __int8 *)(v49 - 1);
LABEL_49:
            *(unsigned char *)(*(void *)(*(void *)(result + 72) + 8) + 24) = v44 + v43 == 0;
            break;
          default:
            break;
        }
      }
    }
    uint64_t v11 = *(void *)(*(void *)(result + 48) + 8);
    int v12 = *(unsigned __int16 *)(v11 + 24);
    if (v12 >= a3) {
      LOWORD(v12) = a3;
    }
    *(_WORD *)(v11 + 24) = v12;
    uint64_t v13 = *(void *)(*(void *)(result + 48) + 8);
    int v14 = *(unsigned __int16 *)(v13 + 26);
    if (v14 <= a3) {
      LOWORD(v14) = a3;
    }
    *(_WORD *)(v13 + 26) = v14;
    uint64_t v15 = *(void *)(*(void *)(result + 48) + 8);
    int v16 = *(unsigned __int16 *)(v15 + 28);
    if (v16 >= a2) {
      LOWORD(v16) = a2;
    }
    *(_WORD *)(v15 + 28) = v16;
    uint64_t v17 = *(void *)(*(void *)(result + 48) + 8);
    int v18 = *(unsigned __int16 *)(v17 + 30);
    if (v18 <= a2) {
      LOWORD(v18) = a2;
    }
    *(_WORD *)(v17 + 30) = v18;
    BOOL v32 = v10 >= 8;
    BOOL v20 = v10 == 8;
    int v19 = (1 << v10) & 0x14A;
    BOOL v20 = !v20 && v32 || v19 == 0;
    if (!v20) {
      ++*(_DWORD *)(*(void *)(*(void *)(result + 80) + 8) + 24);
    }
    ++*(_DWORD *)(*(void *)(*(void *)(result + 88) + 8) + 24);
    char v21 = 1;
  }
  else
  {
    uint64_t v8 = result + 40;
    if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
      goto LABEL_43;
    }
    uint64_t v22 = *(void *)(*(void *)(result + 96) + 8);
    int v23 = *(_DWORD *)(v22 + 24);
    if (v23 <= 1)
    {
      *(void *)(*(void *)(result + 144) + 26 * *(int *)(result + 160) + 8 * v23) = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 24);
      uint64_t v22 = *(void *)(*(void *)(result + 96) + 8);
      int v23 = *(_DWORD *)(v22 + 24);
    }
    *(_DWORD *)(v22 + 24) = v23 + 1;
    if (*(_DWORD *)(*(void *)(*(void *)(result + 88) + 8) + 24) == 1)
    {
      int v24 = *(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 24);
      if (v24 >= 2 && v24 < *(_DWORD *)(result + 156) - 1)
      {
        uint64_t v25 = *(int *)(*(void *)(*(void *)(result + 64) + 8) + 24);
        if ((int)v25 >= 2)
        {
          int v26 = *(_DWORD *)(result + 152);
          if ((int)v25 < v26 - 1)
          {
            uint64_t v27 = *(void *)(result + 136);
            int v28 = (unsigned __int8 *)(v27 + v25 + v26 * (v24 - 1));
            int v29 = v26 * v24;
            uint64_t v30 = (unsigned __int8 *)(v27 + v25 + v26 + v29);
            unsigned int v31 = v28[1]
                + *(v28 - 1)
                + *(unsigned __int8 *)(v27 + (int)v25 + v29 - 1)
                + *(unsigned __int8 *)(v25 + v29 + v27 + 1)
                + *(v30 - 1)
                + v30[1];
            BOOL v32 = *v30 + *v28 != 2 || v31 >= 3;
            char v33 = !v32;
            *(unsigned char *)(*(void *)(*(void *)(result + 104) + 8) + 24) = v33;
          }
        }
      }
    }
    char v21 = 0;
    int v34 = *(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 24);
    int v35 = *(_DWORD *)(result + 152);
    switch(*(unsigned char *)(*(void *)(result + 128)
                      + *(int *)(*(void *)(*(void *)(result + 64) + 8) + 24)
                      + v35 * (uint64_t)v34))
    {
      case 1:
      case 6:
        int v36 = a3 - 1;
        goto LABEL_41;
      case 3:
      case 8:
        int v36 = a3 + 1;
LABEL_41:
        char v21 = 0;
        *(unsigned char *)(*(void *)(*(void *)(result + 112) + 8) + 24) = *(unsigned __int8 *)(*(void *)(result + 136)
                                                                                             + v36
                                                                                             + v35 * a2)
                                                                        + *(unsigned __int8 *)(*(void *)(result + 136)
                                                                                             + v36
                                                                                             + v35 * v34) == 0;
        break;
      default:
        break;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) = v21;
LABEL_43:
  uint64_t v45 = *(void *)(*(void *)(result + 120) + 8);
  int v46 = *(unsigned __int16 *)(v45 + 24);
  if (v46 >= a3) {
    LOWORD(v46) = a3;
  }
  *(_WORD *)(v45 + 24) = v46;
  uint64_t v47 = *(void *)(*(void *)(result + 120) + 8);
  int v48 = *(unsigned __int16 *)(v47 + 26);
  if (v48 <= a3) {
    LOWORD(v48) = a3;
  }
  *(_WORD *)(v47 + 26) = v48;
  *(_DWORD *)(*(void *)(*(void *)(result + 56) + 8) + 24) = a2;
  *(_DWORD *)(*(void *)(*(void *)(result + 64) + 8) + 24) = a3;
  return result;
}

BOOL areCutsTooClose(__int16 a1, __int16 a2, unsigned int a3, _WORD *a4, __int16 a5, unsigned int a6, _WORD *a7, int a8)
{
  v21[0] = a2;
  v21[1] = a2;
  v21[3] = a1 - 1;
  v20[0] = a5;
  v20[1] = a5;
  v20[3] = a1 - 1;
  uint64_t v8 = v21;
  if (a3) {
    uint64_t v8 = a4;
  }
  if (a3 <= 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = a3;
  }
  if (a6) {
    unsigned int v10 = a7;
  }
  else {
    unsigned int v10 = v20;
  }
  if ((int)v9 < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v11 = 0;
    if (a6 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = a6;
    }
    uint64_t v13 = v10 + 2;
    BOOL v14 = 1;
    while ((int)v12 < 1)
    {
LABEL_24:
      BOOL v14 = ++v11 < v9;
      if (v11 == v9) {
        return v14;
      }
    }
    uint64_t v15 = &v8[4 * v11];
    uint64_t v16 = v12;
    uint64_t v17 = v13;
    while (1)
    {
      BOOL v18 = v15[1] + a8 < *(v17 - 2) || *(v17 - 1) + a8 < *v15;
      if (v15[3] + a8 >= *v17)
      {
        if (v17[1] + a8 < v15[2]) {
          BOOL v18 = 1;
        }
        if (!v18) {
          break;
        }
      }
      v17 += 4;
      if (!--v16) {
        goto LABEL_24;
      }
    }
  }
  return v14;
}

BOOL isCuttingSerif (uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, int a4, int a5, BOOL *a6)
{
  if (a6) {
    *a6 = 0;
  }
  if (*((unsigned char *)a3 + 22) != 1) {
    return 0;
  }
  if (*((unsigned char *)a2 + 22) != 1) {
    return 0;
  }
  unsigned int v10 = a3[3];
  unsigned int v11 = a2[2];
  if (v10 < v11) {
    return 0;
  }
  unsigned int v12 = a3[2];
  unsigned int v13 = a2[3];
  if (v12 > v13) {
    return 0;
  }
  unsigned int v14 = v13 - v11;
  if ((int)(v13 - v11) >= (int)(v10 - v12)) {
    unsigned int v14 = v10 - v12;
  }
  int v15 = (int)(v13 - v11 - (v10 - v12)) >= 0 ? v13 - v11 - (v10 - v12) : v10 - v12 - (v13 - v11);
  if (v15 >= (int)(3 * v14)) {
    return 0;
  }
  if (v11 >= v12) {
    unsigned int v11 = a3[2];
  }
  int v16 = v13 <= v10 ? a3[3] : a2[3];
  uint64_t v17 = (v16 + v11) >> 1;
  if ((int)v17 > a5 / 4 && 3 * a5 > 4 * (int)v17) {
    return 0;
  }
  unsigned int v18 = *a2;
  if (v18 >= *a3) {
    unsigned int v18 = *a3;
  }
  unsigned int v19 = a2[1];
  if (v19 <= a3[1]) {
    unsigned int v19 = a3[1];
  }
  int v20 = a5 >= 0 ? a5 : a5 + 1;
  if ((int)(v19 - v18) > v20 >> 1) {
    return 0;
  }
  unsigned int v21 = v19 + v18;
  if (!*(unsigned char *)(a1 + (int)(v17 * a4 + ((v19 + v18) >> 1)))) {
    return 0;
  }
  unsigned int v27 = v16 - v11;
  int v22 = v21 >> 1;
  int v23 = v18 | (v19 << 16);
  int EndBlackPixelRowInColumn = findEndBlackPixelRowInColumn(a1, a4, a5, v21 >> 1, v17, v23, -1);
  int v25 = findEndBlackPixelRowInColumn(a1, a4, a5, v22, v17, v23, 1) - EndBlackPixelRowInColumn;
  BOOL result = v25 < (int)(2 * v27);
  if (a6)
  {
    if (v25 < (int)(2 * v27))
    {
      *a6 = v20 >> 1 > v16;
      return 1;
    }
  }
  return result;
}

BOOL cutsCreateBadConcomp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, unsigned int a10, unsigned int a11)
{
  uint64_t v15 = a1;
  int v17 = a10;
  uint64_t v16 = a11;
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = MEMORY[0x1F4188790](a1);
  int v20 = (BOOL *)&v71 - ((v19 + 15) & 0x3FFFFFFF0);
  MEMORY[0x1F4188790](v18);
  int v26 = (char *)&v71 - v24;
  uint64_t v85 = 0;
  int v86 = &v85;
  uint64_t v87 = 0x2000000000;
  int v88 = (unsigned __int16)a10;
  if (v25) {
    *int v25 = 0;
  }
  if (a3 | a7)
  {
    if (a3)
    {
      if (!a7)
      {
        uint64_t v74 = v25;
        if ((int)a11 >= 1)
        {
          uint64_t v27 = a11;
          int v28 = v20;
          do
          {
            *(_WORD *)int v28 = a10 - 1;
            v28 += 2;
            --v27;
          }
          while (v27);
        }
        HIWORD(v88) = a10 - 1;
        LOWORD(v88) = a10 - 1;
        if (!*(unsigned char *)(a2 + 21)) {
          goto LABEL_21;
        }
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v30 = v20;
      uint64_t v73 = a10;
      uint64_t v74 = v20;
      uint64_t v71 = a11;
      uint64_t v72 = (char *)&v71 - v24;
      unsigned int v31 = v25;
      int v32 = v22;
      uint64_t v33 = v21;
      uint64_t v34 = v23;
      bzero(v30, 2 * a11);
      uint64_t v23 = v34;
      uint64_t v21 = v33;
      int v22 = v32;
      int v25 = v31;
      uint64_t v16 = v71;
      int v26 = v72;
      int v17 = v73;
      int v20 = v74;
      int v88 = 0;
    }
    unsigned int v35 = *(unsigned __int8 *)(a6 + 21);
    if (a2)
    {
      if (*(unsigned __int8 *)(a2 + 21) > v35) {
        unsigned int v35 = *(unsigned __int8 *)(a2 + 21);
      }
    }
    else if (!*(unsigned char *)(a6 + 21))
    {
      goto LABEL_21;
    }
    if (v35)
    {
      uint64_t v74 = v25;
      if (a3)
      {
        LODWORD(v72) = v22;
        uint64_t v36 = v21;
        LODWORD(v73) = v23;
        memset(v20, 255, 2 * v16);
        v84[0] = MEMORY[0x1E4F143A8];
        v84[1] = 0x40000000;
        v84[2] = __cutsCreateBadConcomp_block_invoke;
        v84[3] = &unk_1E6CAAE18;
        v84[4] = &v85;
        v84[5] = v20;
        walkPathAndReturnFinalColumn(a3, v17, v16, v36, (int)v72, (uint64_t)v84);
        int v22 = a9;
        uint64_t v21 = v73;
      }
      else
      {
        int v22 = a9;
        uint64_t v21 = v23;
      }
      a3 = a7;
LABEL_24:
      uint64_t v80 = 0;
      unsigned int v81 = &v80;
      uint64_t v82 = 0x2000000000;
      char v83 = 0;
      v78[0] = 0;
      v78[1] = v78;
      v78[2] = 0x2000000000;
      int v79 = 0;
      v76[0] = 0;
      v76[1] = v76;
      int v77 = -1;
      v76[2] = 0x2000000000;
      int v37 = v22;
      uint64_t v38 = v21;
      memset(v26, 255, 2 * v16);
      v75[0] = MEMORY[0x1E4F143A8];
      v75[1] = 0x40000000;
      v75[2] = __cutsCreateBadConcomp_block_invoke_2;
      v75[3] = &unk_1E6CAAE40;
      v75[4] = &v85;
      v75[5] = v76;
      v75[8] = v26;
      v75[9] = v20;
      v75[6] = v78;
      v75[7] = &v80;
      uint64_t v39 = walkPathAndReturnFinalColumn(a3, v17, v16, v38, v37, (uint64_t)v75);
      if (*((unsigned char *)v81 + 24)) {
        goto LABEL_62;
      }
      uint64_t v40 = *((unsigned __int16 *)v86 + 12);
      uint64_t v41 = *((unsigned __int16 *)v86 + 13) - v40;
      if ((int)v41 < 3) {
        goto LABEL_62;
      }
      MEMORY[0x1F4188790](v39);
      int v43 = (int *)((char *)&v71 - v42);
      bzero((char *)&v71 - v42, v44);
      if ((int)v16 >= 1)
      {
        uint64_t v45 = 0;
        int v46 = 0;
        int v47 = 0;
        int v48 = 0;
        int v49 = 0;
        unsigned int v50 = 0;
        while (1)
        {
          unsigned int v51 = *(unsigned __int16 *)&v20[2 * v45];
          unsigned int v52 = *(unsigned __int16 *)&v26[2 * v45];
          unsigned int v53 = v51 >= v52 ? *(unsigned __int16 *)&v26[2 * v45] : *(unsigned __int16 *)&v20[2 * v45];
          uint64_t v54 = v51 <= v52 ? *(unsigned __int16 *)&v26[2 * v45] : *(unsigned __int16 *)&v20[2 * v45];
          if (v53 >= v54) {
            break;
          }
          int v55 = 0;
          uint64_t v56 = &v43[v53 - v40];
          uint64_t v57 = (unsigned __int8 *)(v15 + v53);
          uint64_t v58 = v54 - v53;
          do
          {
            int v59 = *v57++;
            v55 += v59;
            *v56++ += v59;
            --v58;
          }
          while (v58);
          if (v46 > 0 && v55 == 0) {
            ++v50;
          }
          if (!v55) {
            goto LABEL_46;
          }
          int v47 = 0;
          ++v49;
LABEL_51:
          ++v45;
          v15 += v17;
          int v46 = v55;
          if (v45 == v16) {
            goto LABEL_54;
          }
        }
        if (v46 > 0) {
          ++v50;
        }
LABEL_46:
        BOOL v61 = v50 == 0;
        if (!v50) {
          unsigned int v50 = 0;
        }
        int v55 = 0;
        if (v61) {
          ++v48;
        }
        else {
          ++v47;
        }
        goto LABEL_51;
      }
      unsigned int v50 = 0;
      int v49 = 0;
      int v48 = 0;
      int v47 = 0;
      int v55 = 0;
LABEL_54:
      if (v55 > 0) {
        ++v50;
      }
      if (v74)
      {
        if ((int)v16 >= 0) {
          int v62 = v16;
        }
        else {
          int v62 = v16 + 1;
        }
        *uint64_t v74 = v47 >= v62 >> 1;
      }
      if (v50 > 1)
      {
LABEL_62:
        BOOL v29 = 1;
      }
      else
      {
        if ((int)v16 >= 0) {
          int v64 = v16;
        }
        else {
          int v64 = v16 + 3;
        }
        int v65 = v64 >> 2;
        if (v47 <= v64 >> 2) {
          goto LABEL_73;
        }
        if (v48 <= v65) {
          goto LABEL_73;
        }
        int v66 = 0;
        int v67 = 0;
        uint64_t v68 = v41;
        do
        {
          int v69 = *v43++;
          v67 += v69;
          v66 += v69 * v69;
          --v68;
        }
        while (v68);
        if ((float)((float)v67 / (float)(int)v41) * 0.75 > (float)((float)((float)v66
                                                                          - (float)((float)(v67 * v67) / (float)(int)v41))
                                                                  / (float)(v41 - 1)))
        {
          BOOL v29 = 0;
        }
        else
        {
LABEL_73:
          if ((int)v16 >= 0) {
            int v70 = v16;
          }
          else {
            int v70 = v16 + 1;
          }
          if (v47 >= v70 >> 1 || v48 >= v70 >> 1) {
            int v65 = 2 * (int)v16 / 5;
          }
          BOOL v29 = v49 <= v65;
        }
      }
      _Block_object_dispose(v76, 8);
      _Block_object_dispose(v78, 8);
      _Block_object_dispose(&v80, 8);
      goto LABEL_64;
    }
LABEL_21:
    BOOL v29 = 0;
    goto LABEL_64;
  }
  BOOL v29 = 1;
LABEL_64:
  _Block_object_dispose(&v85, 8);
  return v29;
}

uint64_t findEndBlackPixelRowInColumn(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6, int a7)
{
  if ((int)a5 >= 1 && a3 - 1 > (int)a5)
  {
    uint64_t v7 = a2 * (a7 + (int)a5);
    while (1)
    {
      if (!*(unsigned char *)(a1 + a4 + v7))
      {
        if (a4 > (unsigned __int16)a6 && *(unsigned char *)(a1 + (int)v7 + a4 - 1))
        {
          --a4;
        }
        else
        {
          if (a4 >= HIWORD(a6) || !*(unsigned char *)(a1 + (int)v7 + a4 + 1)) {
            return a5;
          }
          ++a4;
        }
      }
      a5 = (a5 + a7);
      if ((int)a5 >= 1)
      {
        v7 += a7 * a2;
        if ((int)a5 < a3 - 1) {
          continue;
        }
      }
      return a5;
    }
  }
  return a5;
}

uint64_t __cutsCreateBadConcomp_block_invoke(uint64_t result, int a2, int a3)
{
  uint64_t v3 = *(void *)(result + 40);
  int v4 = *(unsigned __int16 *)(v3 + 2 * a2);
  if (v4 > a3) {
    LOWORD(v4) = a3;
  }
  unsigned int v5 = (unsigned __int16)v4;
  *(_WORD *)(v3 + 2 * a2) = v4;
  uint64_t v6 = *(void *)(*(void *)(result + 32) + 8);
  unsigned int v7 = *(unsigned __int16 *)(v6 + 24);
  if (v5 < v7) {
    LOWORD(v7) = v5;
  }
  *(_WORD *)(v6 + 24) = v7;
  uint64_t v8 = *(void *)(*(void *)(result + 32) + 8);
  unsigned int v9 = *(unsigned __int16 *)(v8 + 26);
  if (v5 > v9) {
    LOWORD(v9) = v5;
  }
  *(_WORD *)(v8 + 26) = v9;
  return result;
}

void *__cutsCreateBadConcomp_block_invoke_2(void *result, int a2, int a3)
{
  uint64_t v3 = result[8];
  int v4 = *(unsigned __int16 *)(v3 + 2 * a2);
  if (v4 > a3) {
    LOWORD(v4) = a3;
  }
  *(_WORD *)(v3 + 2 * a2) = v4;
  uint64_t v5 = *(void *)(result[4] + 8);
  unsigned int v6 = *(unsigned __int16 *)(v5 + 24);
  if ((unsigned __int16)v4 < v6) {
    LOWORD(v6) = v4;
  }
  *(_WORD *)(v5 + 24) = v6;
  uint64_t v7 = *(void *)(result[4] + 8);
  if ((unsigned __int16)v4 <= *(unsigned __int16 *)(v7 + 26)) {
    LOWORD(v4) = *(_WORD *)(v7 + 26);
  }
  *(_WORD *)(v7 + 26) = v4;
  int v8 = *(_DWORD *)(*(void *)(result[5] + 8) + 24);
  if (v8 != -1 && v8 != a2)
  {
    uint64_t v10 = *(void *)(result[6] + 8);
    int v11 = *(_DWORD *)(v10 + 24);
    if (v11 == -1)
    {
      BOOL v13 = *(unsigned __int16 *)(result[9] + 2 * v8) > *(unsigned __int16 *)(v3 + 2 * v8);
    }
    else
    {
      if (!v11)
      {
        if (*(unsigned __int16 *)(result[9] + 2 * v8) < *(unsigned __int16 *)(v3 + 2 * v8)) {
          int v12 = -1;
        }
        else {
          int v12 = 1;
        }
        *(_DWORD *)(v10 + 24) = v12;
        goto LABEL_23;
      }
      BOOL v13 = 0;
    }
    *(unsigned char *)(*(void *)(result[7] + 8) + 24) |= v13;
    if (*(_DWORD *)(*(void *)(result[6] + 8) + 24) == 1)
    {
      uint64_t v14 = *(int *)(*(void *)(result[5] + 8) + 24);
      BOOL v15 = *(unsigned __int16 *)(result[9] + 2 * v14) < *(unsigned __int16 *)(result[8] + 2 * v14);
    }
    else
    {
      BOOL v15 = 0;
    }
    *(unsigned char *)(*(void *)(result[7] + 8) + 24) |= v15;
  }
LABEL_23:
  *(_DWORD *)(*(void *)(result[5] + 8) + 24) = a2;
  return result;
}

uint64_t __markSplits_block_invoke(uint64_t result, int a2, __int16 a3)
{
  *(_WORD *)(**(void **)(result + 32) + 2 * a2) = a3;
  return result;
}

BOOL diacriticLooksLikeDot(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 280);
  uint64_t v3 = (unsigned __int16 *)(v2 + 100 * a2);
  int v4 = v3[41] - v3[40];
  int v5 = v3[43] - v3[42];
  return v4 < 2 * v5 + 3 && v5 < 2 * v4 + 3 && (v5 + 1) * (v4 + 1) <= 2 * *(_DWORD *)(v2 + 100 * a2 + 72);
}

uint64_t isFeasablePart(uint64_t a1, int a2, int a3)
{
  if (a3 == -1) {
    return 1;
  }
  uint64_t v3 = *(void *)(a1 + 280);
  uint64_t v4 = v3 + 100 * a2;
  char v5 = *(unsigned char *)(v4 + 93);
  int v6 = *(unsigned __int16 *)(v4 + 84);
  int v7 = *(unsigned __int16 *)(v4 + 86);
  int v8 = *(_DWORD *)(v3 + 100 * a3 + 40);
  if (v8 > 72)
  {
    if (v8 != 73 && v8 != 124 && v8 != 108) {
      return 1;
    }
    return (v5 & 1) != 0
        && (float)((float)(*(unsigned __int16 *)(v3 + 100 * a3 + 84) - v6) / (float)(v7 - v6 + 1)) <= 0.15;
  }
  if (v8 == 49) {
    return (v5 & 1) != 0
  }
        && (float)((float)(*(unsigned __int16 *)(v3 + 100 * a3 + 84) - v6) / (float)(v7 - v6 + 1)) <= 0.15;
  return v8 != 63;
}

BOOL isSaneSplit(uint64_t a1, int a2, int *a3, int a4, uint64_t a5, unsigned int a6)
{
  unsigned int v6 = a6;
  uint64_t v7 = a5;
  int v8 = a4;
  uint64_t v11 = *(void *)(a1 + 280);
  if (a4 < 1)
  {
    int v13 = 0;
    int v12 = 0;
    float v14 = 1.0;
    signed int v17 = 0x7FFFFFFF;
    int v15 = 0x7FFFFFFF;
  }
  else
  {
    int v12 = 0;
    int v13 = 0;
    float v14 = 1.0;
    int v15 = 0x7FFFFFFF;
    uint64_t v16 = a3;
    signed int v17 = 0x7FFFFFFF;
    uint64_t v18 = a4;
    do
    {
      int v20 = *v16++;
      int v19 = v20;
      if (v20 == -1) {
        return 0;
      }
      if ((*(unsigned char *)(v11 + 100 * v19 + 94) & 8) == 0)
      {
        uint64_t v21 = v11 + 100 * v19;
        int v22 = *(unsigned __int16 *)(v21 + 86) - *(unsigned __int16 *)(v21 + 84);
        signed int v23 = v22 + 1;
        int v24 = v23 + v23 * (*(unsigned __int16 *)(v21 + 82) - *(unsigned __int16 *)(v21 + 80));
        if (v12 <= v24) {
          int v12 = v23 + v23 * (*(unsigned __int16 *)(v21 + 82) - *(unsigned __int16 *)(v21 + 80));
        }
        if (v13 <= v23) {
          int v13 = v22 + 1;
        }
        if (v15 >= v24) {
          int v15 = v23 + v23 * (*(unsigned __int16 *)(v21 + 82) - *(unsigned __int16 *)(v21 + 80));
        }
        if (v17 >= v23) {
          signed int v17 = v22 + 1;
        }
        if (v14 >= *(float *)(v21 + 48)) {
          float v14 = *(float *)(v21 + 48);
        }
      }
      --v18;
    }
    while (v18);
  }
  BOOL result = 0;
  if (!v13) {
    return result;
  }
  signed int v26 = v12 / 0xAu;
  if (v17 < (int)(v13 / 3u) || v15 < v26) {
    return result;
  }
  int v28 = a2;
  if (a6)
  {
    *(_DWORD *)__s = 0;
    if (a4 < 1)
    {
      int v34 = 0;
    }
    else
    {
      uint64_t v30 = a4;
      unsigned int v31 = a3;
      while (1)
      {
        int v32 = *v31++;
        size_t v33 = strlen(__s);
        if (strlen((const char *)(*(void *)(a1 + 280) + 100 * v32 + 40)) + v33 > 3) {
          break;
        }
        __strncat_chk();
        if (!--v30)
        {
          int v34 = *(_DWORD *)__s;
          goto LABEL_31;
        }
      }
      int v34 = 0;
LABEL_31:
      int v8 = a4;
      unsigned int v6 = a6;
      uint64_t v7 = a5;
      int v28 = a2;
    }
    for (uint64_t i = 0; i != 154; ++i)
    {
      if (v34 == FKRecognitionLabels[i] && v34 != *(_DWORD *)(v11 + 100 * v28 + 40)) {
        return 0;
      }
    }
    uint64_t v11 = *(void *)(a1 + 280);
  }
  float ConfusionScoreForCC = getConfusionScoreForCC(v11 + 100 * v28);
  float v37 = ConfusionScoreForCC;
  if (v8 == 2)
  {
    uint64_t v38 = *(void *)(a1 + 280);
    int v39 = *a3;
    int v40 = a3[1];
    int v41 = *(_DWORD *)(v11 + 100 * v28 + 40);
    if (v41 > 97)
    {
      switch(v41)
      {
        case 'm':
          if (strstr("llIn[", (const char *)(v38 + 100 * v39 + 40)))
          {
            int v41 = 109;
            if (strstr("]", (const char *)(v38 + 100 * v40 + 40))) {
              goto LABEL_107;
            }
          }
          else
          {
            int v41 = 109;
          }
          goto LABEL_142;
        case 'n':
          if (!strstr("r", (const char *)(v38 + 100 * v39 + 40))
            || !strstr("Il", (const char *)(v38 + 100 * v40 + 40)))
          {
            int v41 = 110;
            goto LABEL_142;
          }
          int v50 = *(_DWORD *)(v11 + 100 * v28 + 64);
          int v41 = 110;
LABEL_106:
          if (v50 != -1) {
            goto LABEL_142;
          }
LABEL_107:
          double v53 = v14;
          double v54 = 0.7;
LABEL_108:
          if (v53 >= v54) {
            goto LABEL_142;
          }
          return 0;
        case 'o':
LABEL_56:
          size_t v44 = (const char *)(v38 + 100 * v39 + 40);
          if (strstr("[(", v44) && strstr(")]>", (const char *)(v38 + 100 * v40 + 40))) {
            return 0;
          }
          if (!strstr("C[(f", v44))
            goto LABEL_142;
          uint64_t v45 = (const char *)(v38 + 100 * v40 + 40);
          int v46 = ")]Jj";
LABEL_68:
          if (!strstr(v46, v45) || *(_DWORD *)(v11 + 100 * v28 + 64) != -1) {
            goto LABEL_142;
          }
          double v47 = v37;
          double v48 = 0.3;
LABEL_95:
          if (v47 <= v48) {
            goto LABEL_142;
          }
          return 0;
        case 'p':
        case 'q':
        case 'r':
        case 's':
        case 't':
          goto LABEL_142;
        case 'u':
LABEL_66:
          if (!strstr("Ii", (const char *)(v38 + 100 * v39 + 40))) {
            goto LABEL_142;
          }
          uint64_t v45 = (const char *)(v38 + 100 * v40 + 40);
          int v46 = "Jj";
          goto LABEL_68;
        case 'v':
LABEL_71:
          if (!strstr("\\"", (const char *)(v38 + 100 * v39 + 40))
            || !strstr("jJ", (const char *)(v38 + 100 * v40 + 40))
            || *(_DWORD *)(v11 + 100 * v28 + 64) != -1)
          {
            goto LABEL_142;
          }
          double v47 = v37;
          double v48 = 0.2;
          goto LABEL_95;
        case 'w':
LABEL_75:
          if (!strstr("}v", (const char *)(v38 + 100 * v39 + 40))
            || !strstr("vj", (const char *)(v38 + 100 * v40 + 40)))
          {
            goto LABEL_142;
          }
          if (*(_DWORD *)(v11 + 100 * v28 + 64) != -1 || v14 >= 0.5) {
            goto LABEL_142;
          }
          return 0;
        default:
          if (v41 != 98)
          {
            if (v41 == 100)
            {
              int v41 = 100;
              if (strstr("Cc(", (const char *)(v38 + 100 * v39 + 40)))
              {
                int v41 = 100;
                if (strstr("yY", (const char *)(v38 + 100 * v40 + 40)))
                {
                  if (*(unsigned __int8 *)(v7 + 17) > 1u) {
                    return 0;
                  }
                  int v41 = 100;
                }
              }
            }
            goto LABEL_142;
          }
          if (!strstr("L", (const char *)(v38 + 100 * v39 + 40)))
          {
            int v41 = 98;
            goto LABEL_142;
          }
          int v41 = 98;
          if (!strstr(")", (const char *)(v38 + 100 * v40 + 40)) || v14 >= 0.5) {
            goto LABEL_142;
          }
          return 0;
      }
    }
    switch(v41)
    {
      case 'A':
        if (strstr("Il", (const char *)(v38 + 100 * v39 + 40)))
        {
          int v41 = 65;
          if (strstr("Il", (const char *)(v38 + 100 * v40 + 40))) {
            goto LABEL_107;
          }
        }
        else
        {
          int v41 = 65;
        }
        goto LABEL_142;
      case 'B':
      case 'C':
      case 'E':
      case 'F':
      case 'G':
      case 'I':
      case 'J':
      case 'L':
      case 'P':
      case 'S':
      case 'T':
        goto LABEL_142;
      case 'D':
        unsigned int v51 = (const char *)(v38 + 100 * v39 + 40);
        if (strstr("T[", v51)
          && strstr("Jj", (const char *)(v38 + 100 * v40 + 40))
          && *(_DWORD *)(v11 + 100 * v28 + 64) == -1)
        {
          if (v37 > 0.3) {
            return 0;
          }
        }
        else if (strstr("r", v51) && *(unsigned __int8 *)(v7 + 17) > 1u)
        {
          return 0;
        }
        int v41 = 68;
        goto LABEL_142;
      case 'H':
        if (!strstr("t", (const char *)(v38 + 100 * v39 + 40)))
        {
          int v41 = 72;
          goto LABEL_142;
        }
        int v41 = 72;
        if (!strstr("I", (const char *)(v38 + 100 * v40 + 40))) {
          goto LABEL_142;
        }
        double v47 = v37;
        double v48 = 0.7;
        goto LABEL_95;
      case 'K':
        if (strstr("Il", (const char *)(v38 + 100 * v39 + 40)))
        {
          int v41 = 75;
          if (strstr("{", (const char *)(v38 + 100 * v40 + 40))) {
            goto LABEL_107;
          }
        }
        else
        {
          int v41 = 75;
        }
        goto LABEL_142;
      case 'M':
        unsigned int v52 = (const char *)(v38 + 100 * v39 + 40);
        if (strstr("KI", v52)
          && strstr("I", (const char *)(v38 + 100 * v40 + 40))
          && *(_DWORD *)(v11 + 100 * v28 + 64) == -1)
        {
          if (v14 < 0.5) {
            return 0;
          }
        }
        else if (strstr("wWj", v52) && strstr("jJI", (const char *)(v38 + 100 * v40 + 40)))
        {
          int v50 = *(_DWORD *)(v11 + 100 * v28 + 64);
          int v41 = 77;
          goto LABEL_106;
        }
        int v41 = 77;
        goto LABEL_142;
      case 'N':
        if (!strstr("I", (const char *)(v38 + 100 * v39 + 40))
          || !strstr("yN", (const char *)(v38 + 100 * v40 + 40)))
        {
          int v41 = 78;
          goto LABEL_142;
        }
        int v41 = 78;
        if (*(_DWORD *)(v11 + 100 * v28 + 64) != -1) {
          goto LABEL_142;
        }
        double v53 = v14;
        double v54 = 0.6;
        goto LABEL_108;
      case 'O':
      case 'Q':
        goto LABEL_56;
      case 'R':
        int v55 = (const char *)(v38 + 100 * v39 + 40);
        if (strstr("[If", v55) && strstr("Il", (const char *)(v38 + 100 * v40 + 40)))
        {
          if ((*(unsigned char *)(v11 + 100 * v28 + 93) & 3) != 0 || v14 < v37) {
            return 0;
          }
        }
        else if (strstr("F", v55) {
               && strstr("4", (const char *)(v38 + 100 * v40 + 40))
        }
               && *(unsigned __int8 *)(v7 + 17) > 1u)
        {
          return 0;
        }
        int v41 = 82;
        goto LABEL_142;
      case 'U':
        goto LABEL_66;
      case 'V':
        goto LABEL_71;
      case 'W':
        goto LABEL_75;
      default:
        if (v41 == 37) {
          goto LABEL_44;
        }
        if (v41 == 48) {
          goto LABEL_56;
        }
        goto LABEL_142;
    }
  }
  int v41 = *(_DWORD *)(v11 + 100 * v28 + 40);
  if (v41 == 37)
  {
LABEL_44:
    double v42 = ConfusionScoreForCC;
    return v14 >= 0.5 && v42 <= 0.3;
  }
LABEL_142:
  *(_DWORD *)__s2 = v41;
  if (!strstr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", __s2)) {
    return 1;
  }
  unint64_t v57 = (__PAIR64__(v8, v6) - 1) >> 32;
  if ((int)v57 < 1) {
    return 1;
  }
  int v77 = v8;
  uint64_t v58 = 0;
  int v59 = 0;
  int v60 = 0;
  uint64_t v61 = *(void *)(a1 + 280);
  float v62 = 1.0;
  do
  {
    int v63 = a3[v58];
    uint64_t v64 = v61 + 100 * v63;
    int v67 = *(unsigned __int8 *)(v64 + 40);
    int v65 = (int *)(v64 + 40);
    char v66 = v67;
    if (v67)
    {
      int v68 = 0;
      int v69 = (unsigned __int8 *)(v61 + 41 + 100 * v63);
      do
      {
        if ((v66 & 0xC0) != 0x80) {
          ++v68;
        }
        int v70 = *v69++;
        char v66 = v70;
      }
      while (v70);
      if (v68 == 1)
      {
        int v71 = *v65;
        *(_DWORD *)uint64_t v80 = *v65;
        if (strstr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789", v80))
        {
          if (((v71 - 73) > 0x33 || ((1 << (v71 - 73)) & 0x8000800000001) == 0)
            && v71 != 49)
          {
            goto LABEL_159;
          }
          ++v59;
        }
        else
        {
          ++v60;
        }
        uint64_t v72 = v61 + 100 * v63;
        if (*(float *)(v72 + 48) < v62) {
          float v62 = *(float *)(v72 + 48);
        }
      }
    }
LABEL_159:
    ++v58;
  }
  while (v58 != v57);
  if (v60 > 0)
  {
    float v73 = 0.94;
    if (v59 + v60 != v77) {
      float v73 = 0.5;
    }
    if (v73 <= v37) {
      float v73 = v37;
    }
    if (v62 < v73) {
      return 0;
    }
  }
  return 1;
}

BOOL concatenatedCCsMatchCC(uint64_t a1, int a2, int a3, uint64_t a4)
{
  BOOL result = 0;
  if (a2 != -1)
  {
    uint64_t v13 = v4;
    uint64_t v14 = v5;
    if (a3 != -1)
    {
      uint64_t v10 = *(void *)(a1 + 280);
      *(_DWORD *)__s = *(_DWORD *)(v10 + 100 * a2 + 40);
      size_t v11 = strlen(__s);
      if (strlen((const char *)(v10 + 100 * a3 + 40)) + v11 <= 3)
      {
        __strncat_chk();
        return *(_DWORD *)__s == *(_DWORD *)(a4 + 40);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t combineSlash(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 280);
  if (*(_DWORD *)(v4 + 100 * a2 + 40) != 47) {
    return 0;
  }
  uint64_t result = 0;
  if (a3 == -1 || a4 == -1) {
    return result;
  }
  uint64_t v11 = v4 + 100 * a2;
  int v12 = *(unsigned __int16 *)(v11 + 86);
  int v13 = *(unsigned __int16 *)(v11 + 84);
  uint64_t v14 = v4 + 100 * a3;
  int v15 = *(unsigned __int16 *)(v14 + 86);
  int v16 = *(unsigned __int16 *)(v14 + 84);
  int v17 = 3 * (v12 - v13);
  if (((4 * (v15 - v16)) | 1) > v17) {
    return 0;
  }
  int v20 = (unsigned __int16 *)(v4 + 100 * a4);
  int v21 = v20[43];
  int v22 = v20[42];
  unsigned int v23 = (v15 + v16 + 1) >> 1;
  unsigned int v24 = (v12 + v13 + 1) >> 1;
  unsigned int v25 = (*(unsigned __int16 *)(v4 + 100 * a2 + 82) + *(unsigned __int16 *)(v4 + 100 * a2 + 80) + 1) >> 1;
  BOOL v26 = ((4 * (v21 - v22)) | 1) > v17
     || (*(unsigned __int16 *)(v4 + 100 * a3 + 82) + *(unsigned __int16 *)(v4 + 100 * a3 + 80) + 1) >> 1 >= v25;
  BOOL v27 = v26 || v25 >= (v20[41] + v20[40] + 1) >> 1;
  BOOL v28 = v27 || v23 >= v24;
  if (v28 || v24 >= (v21 + v22 + 1) >> 1) {
    return 0;
  }
  if (*(_DWORD *)(a1 + 36) == 4412225)
  {
LABEL_26:
    uint64_t result = FKSequenceScoreAsPercent(a1, a2, a3, 0);
    if (!result) {
      return result;
    }
    uint64_t result = FKSequenceScoreAsPercent(a1, a2, a4, 0);
    if (!result) {
      return result;
    }
    v57[0] = a3;
    v57[1] = a4;
    uint64_t v34 = *(void *)(a1 + 280);
    if (!*(_DWORD *)(v34 + 100 * a3 + 40) && !*(_DWORD *)(v34 + 100 * a4 + 40)) {
      FKRecognizeMultipleConcomps(a1, (uint64_t)v57, 2);
    }
    uint64_t v35 = 0;
    memset(v55, 0, sizeof(v55));
    char v36 = 1;
    uint64_t v56 = 0;
    while (1)
    {
      char v37 = v36;
      uint64_t v38 = (char *)(*(void *)(a1 + 280) + 100 * (int)v57[v35]);
      if ((v38[94] & 8) != 0)
      {
        long long v39 = *((_OWORD *)v38 + 2);
        long long v40 = *((_OWORD *)v38 + 3);
        long long v41 = *((_OWORD *)v38 + 4);
        long long v42 = *((_OWORD *)v38 + 5);
        int v43 = *((_DWORD *)v38 + 24);
        long long v44 = *(_OWORD *)v38;
        long long v45 = *((_OWORD *)v38 + 1);
        uint64_t v38 = (char *)v55 + 100 * v35;
        *((_OWORD *)v38 + 2) = v39;
        *((_OWORD *)v38 + 3) = v40;
        *((_OWORD *)v38 + 4) = v41;
        *((_OWORD *)v38 + 5) = v42;
        *((_DWORD *)v38 + 24) = v43;
        *(_OWORD *)uint64_t v38 = v44;
        *((_OWORD *)v38 + 1) = v45;
        *((_DWORD *)v38 + 10) = 0;
      }
      if (!*((_DWORD *)v38 + 10)) {
        FKRecognizeConcomp(a1, (uint64_t)v38);
      }
      if ((*((_DWORD *)v38 + 6) | 0x20) != 0x6F || getConfusionScoreForCC((uint64_t)v38) < 0.8) {
        break;
      }
      char v36 = 0;
      uint64_t v35 = 1;
      if ((v37 & 1) == 0)
      {
        uint64_t v46 = 0;
        char v47 = 1;
        do
        {
          char v48 = v47;
          if (*((_DWORD *)&v55[2] + 25 * v46 + 2))
          {
            int v49 = v57[v46];
            int v50 = (char *)v55 + 100 * v46;
            long long v51 = *((_OWORD *)v50 + 5);
            uint64_t v52 = *(void *)(a1 + 280) + 100 * v49;
            *(_OWORD *)(v52 + 64) = *((_OWORD *)v50 + 4);
            *(_OWORD *)(v52 + 80) = v51;
            *(_DWORD *)(v52 + 96) = *((_DWORD *)v50 + 24);
            long long v53 = *((_OWORD *)v50 + 1);
            *(_OWORD *)uint64_t v52 = *(_OWORD *)v50;
            *(_OWORD *)(v52 + 16) = v53;
            long long v54 = *((_OWORD *)v50 + 3);
            *(_OWORD *)(v52 + 32) = *((_OWORD *)v50 + 2);
            *(_OWORD *)(v52 + 48) = v54;
          }
          char v47 = 0;
          uint64_t v46 = 1;
        }
        while ((v48 & 1) != 0);
        return 37;
      }
    }
    return 0;
  }
  uint64_t v30 = 0;
  int v31 = *(_DWORD *)(v4 + 100 * a3 + 40);
  int v32 = (_DWORD *)(v4 + 100 * a4 + 40);
  size_t v33 = "41234171913231525354516561838587800";
  while (v31 != *(v33 - 1) || *v32 != *v33)
  {
    v33 += 2;
    if (++v30 == 17) {
      goto LABEL_26;
    }
  }
  return combineSlash_vulgarFractionsStr[v30];
}

uint64_t relativeYPosPercent(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a1 + 280);
  uint64_t v5 = v4 + 100 * *(int *)(v3 + 4 * a3);
  int v6 = *(unsigned __int16 *)(v5 + 86);
  int v7 = *(unsigned __int16 *)(v5 + 84);
  if (a3 < 1)
  {
    int v11 = *(_DWORD *)(a2 + 20);
    LODWORD(v12) = a3 + 1;
    if (a3 + 1 >= v11) {
      return 100;
    }
    uint64_t v9 = 0;
    BOOL v10 = 1;
  }
  else
  {
    unint64_t v8 = a3;
    do
    {
      uint64_t v9 = v4 + 100 * *(int *)(v3 + 4 * (v8 - 1));
      if ((*(unsigned char *)(v9 + 94) & 8) != 0) {
        uint64_t v9 = 0;
      }
      BOOL v10 = v9 == 0;
      if (v8 < 2) {
        break;
      }
      --v8;
    }
    while (!v9);
    int v11 = *(_DWORD *)(a2 + 20);
    LODWORD(v12) = a3 + 1;
    if (a3 + 1 >= v11)
    {
      if (!v9) {
        return 100;
      }
      goto LABEL_23;
    }
  }
  uint64_t v12 = (int)v12;
  uint64_t v13 = v11;
  do
  {
    uint64_t v14 = v4 + 100 * *(int *)(v3 + 4 * v12);
    if ((*(unsigned char *)(v14 + 94) & 8) != 0) {
      uint64_t v14 = 0;
    }
    ++v12;
  }
  while (v12 < v13 && !v14);
  if (v10)
  {
    if (v14)
    {
      unsigned int v15 = *(unsigned __int16 *)(v14 + 84);
      unsigned int v16 = *(unsigned __int16 *)(v14 + 86);
      goto LABEL_24;
    }
    return 100;
  }
  if (v14)
  {
    unsigned int v15 = (*(unsigned __int16 *)(v14 + 84) + *(unsigned __int16 *)(v9 + 84)) >> 1;
    unsigned int v16 = (*(unsigned __int16 *)(v14 + 86) + *(unsigned __int16 *)(v9 + 86)) >> 1;
    goto LABEL_24;
  }
LABEL_23:
  unsigned int v15 = *(unsigned __int16 *)(v9 + 84);
  unsigned int v16 = *(unsigned __int16 *)(v9 + 86);
LABEL_24:
  BOOL v18 = v16 >= v15;
  signed int v19 = v16 - v15;
  if (v19 != 0 && v18) {
    return ((int)(100 * (((v6 + v7 + 1) >> 1) - v15)) / v19);
  }
  else {
    return 50;
  }
}

BOOL diacriticIsResonablyCentered(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 80);
  int v3 = *(unsigned __int16 *)(a2 + 82);
  uint64_t v4 = *(void *)(a1 + 280) + 100 * *(int *)(a2 + 64);
  unsigned int v5 = 3 * ((*(unsigned __int16 *)(v4 + 82) + *(unsigned __int16 *)(v4 + 80) + 1) >> 1);
  return v5 <= v2 + 2 * v3 && v5 >= v3 + 2 * v2;
}

uint64_t compareInt(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

void *FKSessionCreate(int a1, int a2)
{
  int v2 = 0;
  if (a1 >= 1 && a2 >= 1)
  {
    unsigned int v5 = (char *)malloc_type_calloc(1uLL, 0x160uLL, 0x10B00408D8AB762uLL);
    int v2 = v5;
    if (v5)
    {
      *(_DWORD *)unsigned int v5 = 10;
      *(void *)&long long v6 = 0x100000001;
      *((void *)&v6 + 1) = 0x100000001;
      *(_OWORD *)(v5 + 8) = v6;
      *((_DWORD *)v5 + 6) = 2;
      *((_DWORD *)v5 + 7) = a1;
      *((_DWORD *)v5 + 8) = a2;
      *((_DWORD *)v5 + 9) = 0;
      *((void *)v5 + 26) = a2;
      *((void *)v5 + 27) = a1;
      uint64_t v7 = (a1 + 31) & 0xFFFFFFE0;
      *((void *)v5 + 28) = v7;
      if (!(a1 >> 15))
      {
        unint64_t v8 = malloc_type_malloc(v7 * (unint64_t)((a2 + 31) & 0xFFFFFFE0), 0xCD8B3B48uLL);
        v2[25] = v8;
        if (!v8) {
          goto LABEL_12;
        }
      }
      unsigned int v9 = (a1 + 1) | ((a1 + 1) >> 1) | (((a1 + 1) | ((a1 + 1) >> 1)) >> 2);
      unsigned int v10 = v9 | (v9 >> 4) | ((v9 | (v9 >> 4)) >> 8);
      int v11 = v10 | HIWORD(v10);
      *((_DWORD *)v2 + 60) = v11 + 1;
      *((_DWORD *)v2 + 61) = v11;
      *((_DWORD *)v2 + 62) = 0;
      uint64_t v12 = malloc_type_malloc(12 * (v11 + 1), 0x1000040FD6F1FF4uLL);
      v2[29] = v12;
      if (!v12) {
        goto LABEL_12;
      }
      uint64_t v13 = malloc_type_malloc(0x40000uLL, 0x100004000313F17uLL);
      v2[32] = v13;
      if (!v13) {
        goto LABEL_12;
      }
      *((_DWORD *)v2 + 68) = 0x8000;
      uint64_t v14 = malloc_type_calloc(0x200uLL, 2uLL, 0x1000040BDFB0063uLL);
      v2[33] = v14;
      if (!v14) {
        goto LABEL_12;
      }
      unsigned int v15 = malloc_type_malloc(0x32000uLL, 0x1000040D2C85C19uLL);
      v2[35] = v15;
      if (v15
        && (v2[36] = 2048,
            *((_DWORD *)v2 + 77) = 0,
            unsigned int v16 = malloc_type_calloc(1uLL, 0x6800uLL, 0x1010040D07E2FD1uLL),
            (v2[39] = v16) != 0))
      {
        v2[40] = 0xFFFFFFFF00000100;
        *((_DWORD *)v2 + 82) = -1;
      }
      else
      {
LABEL_12:
        int v17 = (void *)v2[39];
        if (v17) {
          free(v17);
        }
        BOOL v18 = (void *)v2[35];
        if (v18) {
          free(v18);
        }
        signed int v19 = (void *)v2[32];
        if (v19) {
          free(v19);
        }
        int v20 = (void *)v2[25];
        if (v20) {
          free(v20);
        }
        free(v2);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t FKSessionReset(uint64_t result, int a2, int a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (*(_DWORD *)(result + 28) == a2 && *(_DWORD *)(result + 32) == a3)
    {
LABEL_12:
      *(void *)(v5 + 248) = 0;
      freeSequenceMemory(v5);
      *(void *)(v5 + 300) = 0;
      *(void *)(v5 + 292) = 0;
      *(_DWORD *)(v5 + 308) = 0;
      return 1;
    }
    int v6 = a3 + 31;
    if (a3 < -31) {
      int v6 = a3 + 62;
    }
    signed int v7 = v6 & 0xFFFFFFE0;
    int v8 = a2 + 31;
    if (a2 < -31) {
      int v8 = a2 + 62;
    }
    signed int v9 = v8 & 0xFFFFFFE0;
    *(void *)(result + 224) = v9;
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(result + 200), v7 * (uint64_t)v9, 0xCD2FD1F6uLL);
    if (result)
    {
      *(void *)(v5 + 200) = result;
      if (*(_DWORD *)(v5 + 28) != a2)
      {
        unsigned int v10 = (a2 + 1) | ((a2 + 1) >> 1) | (((a2 + 1) | ((a2 + 1) >> 1)) >> 2);
        unsigned int v11 = v10 | (v10 >> 4) | ((v10 | (v10 >> 4)) >> 8);
        int v12 = v11 | HIWORD(v11);
        *(_DWORD *)(v5 + 240) = v12 + 1;
        *(_DWORD *)(v5 + 244) = v12;
        *(void *)(v5 + 232) = malloc_type_realloc(*(void **)(v5 + 232), 12 * (v12 + 1), 0x1000040FD6F1FF4uLL);
      }
      *(_DWORD *)(v5 + 28) = a2;
      *(_DWORD *)(v5 + 32) = a3;
      goto LABEL_12;
    }
  }
  return result;
}

void freeSequenceMemory(uint64_t a1)
{
  if (*(int *)(a1 + 320) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(a1 + 312) + v2;
      free(*(void **)(v4 + 80));
      *(void *)(v4 + 80) = 0;
      *(_DWORD *)(v4 + 88) = 0;
      free(*(void **)(v4 + 8));
      *(void *)(v4 + 8) = 0;
      *(_DWORD *)(v4 + 16) = 0;
      ++v3;
      v2 += 104;
    }
    while (v3 < *(int *)(a1 + 320));
  }
}

uint64_t FKSessionGetMemoryUsage(uint64_t a1, void *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5 = *(int *)(a1 + 272);
  int v6 = *(_DWORD *)(a1 + 320);
  uint64_t v7 = 104 * v6;
  if (v6 >= 1)
  {
    uint64_t v8 = *(unsigned int *)(a1 + 320);
    signed int v9 = (int *)(*(void *)(a1 + 312) + 16);
    do
    {
      uint64_t v10 = *v9;
      v9 += 26;
      v7 += 4 * v10;
      --v8;
    }
    while (v8);
  }
  int v11 = *(_DWORD *)(a1 + 288);
  uint64_t v12 = 8 * v5;
  int v13 = (int)v5 >> 6;
  uint64_t v14 = *(void *)(a1 + 208) * *(void *)(a1 + 224);
  if (a2) {
    *a2 = v14;
  }
  uint64_t v15 = v12 + 2 * v13;
  if (a3) {
    *a3 = v15;
  }
  uint64_t v16 = 100 * v11;
  if (a4) {
    *a4 = v16;
  }
  if (a5) {
    *a5 = v7;
  }
  return v16 + v14 + v15 + v7;
}

void FKSessionDestroy(void **a1)
{
  freeSequenceMemory((uint64_t)a1);
  free(a1[25]);
  free(a1[29]);
  free(a1[32]);
  free(a1[33]);
  free(a1[35]);
  free(a1[39]);
  free(a1);
}

void FKSessionDestroyRecognizer(void **a1)
{
  if (a1)
  {
    free(a1[327]);
    *((_DWORD *)a1 + 656) = 0;
    for (uint64_t i = 3; i != 328; i += 65)
    {
      if (a1[i])
      {
        espresso_plan_destroy();
        a1[i] = 0;
      }
    }
    if (*a1) {
      espresso_context_destroy();
    }
    free(a1);
  }
}

void **FKSessionCreateRecognizer()
{
  v0 = (void **)malloc_type_calloc(0xA48uLL, 1uLL, 0xB9A42192uLL);
  int v1 = v0;
  if (v0)
  {
    *((_DWORD *)v0 + 2) = 5;
    v0[327] = 0;
    *((_DWORD *)v0 + 656) = 0;
    uint64_t context = espresso_create_context();
    *int v1 = (void *)context;
    if (context)
    {
      BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.Futhark");
      CFURLRef v4 = CFBundleCopyResourceURL(BundleWithIdentifier, @"recognition.espresso.net", 0, 0);
      if (v4)
      {
        CFStringRef v5 = (const __CFString *)v4;
        CFStringRef v6 = CFURLCopyFileSystemPath(v4, kCFURLPOSIXPathStyle);
        if (v6)
        {
          CFStringRef v7 = v6;
          CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
          CFStringGetCStringPtr(v7, SystemEncoding);
          signed int v9 = &FKBatchLevels_0;
          uint64_t v10 = 0x1FFFFFFFFFFFFEBBLL;
          while (1)
          {
            int v11 = *v9++;
            LODWORD(v1[v10 + 327]) = v11;
            uint64_t plan = espresso_create_plan();
            v1[v10 + 328] = (void *)plan;
            if (!plan
              || espresso_plan_add_network()
              || v10 != -325 && espresso_network_change_input_blob_shapes())
            {
              break;
            }
            if (espresso_plan_build()
              || espresso_network_bind_buffer()
              || espresso_network_bind_buffer()
              || espresso_network_bind_buffer())
            {
              break;
            }
            v10 += 65;
            if (!(v10 * 8))
            {
              CFRelease(v5);
              CFRelease(v7);
              return v1;
            }
          }
          CFRelease(v5);
        }
        else
        {
          CFStringRef v7 = v5;
        }
        CFRelease(v7);
      }
    }
  }
  FKSessionDestroyRecognizer(v1);
  return 0;
}

uint64_t FKThresholdCalculateOtsuLimit(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a1 + 28);
  int v4 = *(_DWORD *)(a1 + 32);
  bzero(v28, 0x400uLL);
  LODWORD(v5) = v4 / 4;
  int v6 = 3 * v4 + 3;
  if (3 * v4 >= 0) {
    int v6 = 3 * v4;
  }
  if ((int)v5 < v6 >> 2)
  {
    int v7 = v6 >> 2;
    if (3 * v3 >= 0) {
      int v8 = 3 * v3;
    }
    else {
      int v8 = 3 * v3 + 3;
    }
    int v9 = v8 >> 2;
    uint64_t v10 = a2[3];
    uint64_t v5 = (int)v5;
    uint64_t v11 = (uint64_t)v8 >> 2;
    uint64_t v12 = (unsigned __int8 *)(*a2 + v10 * (int)v5 + v3 / 4);
    uint64_t v13 = v11 - v3 / 4;
    do
    {
      if (v3 / 4 < v9)
      {
        uint64_t v14 = v13;
        uint64_t v15 = v12;
        do
        {
          int v16 = *v15++;
          ++v28[v16];
          --v14;
        }
        while (v14);
      }
      ++v5;
      v12 += v10;
    }
    while (v5 != v7);
  }
  uint64_t v17 = 0;
  double v18 = 0.0;
  double v19 = 0.0;
  do
  {
    int v20 = v28[v17];
    double v19 = v19 + (double)v20;
    double v18 = v18 + (double)(v20 * (int)v17++);
  }
  while (v17 != 256);
  uint64_t v21 = 0;
  uint64_t result = 0;
  double v24 = 0.0;
  double v25 = 0.0;
  double v26 = 0.0;
  do
  {
    int v27 = v28[v21];
    double v25 = v25 + (double)v27;
    double v24 = v24 + (double)(v27 * (int)v21);
    if (v25 != 0.0)
    {
      if (v25 == v19) {
        return result;
      }
      double v23 = -v19;
      if ((v24 * v23 + v18 * v25) * (v24 * v23 + v18 * v25) / (v25 * (v19 - v25)) >= v26)
      {
        double v26 = (v24 * v23 + v18 * v25) * (v24 * v23 + v18 * v25) / (v25 * (v19 - v25));
        uint64_t result = v21;
      }
    }
    ++v21;
  }
  while (v21 != 256);
  return result;
}

uint64_t FKThreshold(uint64_t result, uint64_t *a2, int a3)
{
  int v3 = *(_DWORD *)(result + 32);
  if (v3 >= 1)
  {
    int v4 = 0;
    uint64_t v5 = *(void *)(result + 200);
    uint64_t v6 = *a2;
    int v7 = *(_DWORD *)(result + 28);
    do
    {
      if (v7 >= 1)
      {
        uint64_t v8 = 0;
        do
        {
          *(unsigned char *)(v5 + v8) = *(unsigned __int8 *)(v6 + v8) >= a3;
          int v7 = *(_DWORD *)(result + 28);
          ++v8;
        }
        while ((int)v8 < v7);
        int v3 = *(_DWORD *)(result + 32);
        v5 += v8;
        v6 += v8;
      }
      v6 += a2[3] - v7;
      v5 += *(void *)(result + 224) - v7;
      ++v4;
    }
    while (v4 < v3);
  }
  return result;
}

void FKThresholdBlockAverage(uint64_t a1, uint64_t *a2)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v5 = *(_DWORD *)(a1 + 28);
  int v4 = *(_DWORD *)(a1 + 32);
  int v7 = v4 + 7;
  BOOL v6 = v4 < -7;
  int v8 = v4 + 14;
  if (!v6) {
    int v8 = v7;
  }
  int v9 = v8 >> 3;
  int v10 = v5 + 7;
  BOOL v6 = v5 < -7;
  int v11 = v5 + 14;
  if (!v6) {
    int v11 = v10;
  }
  int v12 = v11 >> 3;
  uint64_t v13 = malloc_type_malloc((v11 >> 3) * v9, 0xA0DA9599uLL);
  LODWORD(v14) = *(_DWORD *)(a1 + 32);
  if ((int)v14 >= 1)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = v12;
    do
    {
      uint64_t v18 = 0;
      memset(v41, 0, sizeof(v41));
      uint64_t v19 = (int)v14;
      uint64_t v20 = *a2;
      uint64_t v21 = a2[3];
      do
      {
        uint64_t v22 = v16 + v18;
        if (v16 + v18 >= (int)v14) {
          uint64_t v22 = (int)v14 - 1;
        }
        *((void *)v41 + v18++) = v20 + v21 * v22;
      }
      while (v18 != 8);
      int v23 = *(_DWORD *)(a1 + 28);
      if (v23 >= 1)
      {
        uint64_t v24 = 0;
        uint64_t v25 = 0;
        do
        {
          uint64_t v26 = 0;
          int v27 = 0;
          int v28 = 0;
          int v29 = 255;
          do
          {
            for (uint64_t i = 0; i != 8; ++i)
            {
              uint64_t v31 = v24 + i;
              if (v24 + i >= v23) {
                uint64_t v31 = v23 - 1;
              }
              int v32 = *(unsigned __int8 *)(*((void *)v41 + v26) + v31);
              v28 += v32;
              if (v27 <= v32) {
                int v27 = v32;
              }
              if (v29 >= v32) {
                int v29 = v32;
              }
            }
            ++v26;
          }
          while (v26 != 8);
          if (v27 - v29 <= 24)
          {
            if (v15
              && v25
              && (unsigned int v34 = v13[v25 + (v15 - 1) * v17]
                      + 2 * v13[(int)v15 * (int)v17 - 1 + (int)v25]
                      + v13[v25 - 1 + (v15 - 1) * v17],
                  v29 < (int)(v34 >> 2)))
            {
              int v33 = v34 >> 2;
            }
            else
            {
              int v33 = v29 >> 1;
            }
          }
          else
          {
            int v33 = v28 / 64;
          }
          v13[v25 + v15 * v17] = v33;
          int v23 = *(_DWORD *)(a1 + 28);
          uint64_t v14 = *(int *)(a1 + 32);
          if (v16 < v14)
          {
            uint64_t v35 = 0;
            uint64_t v36 = v16;
            do
            {
              if (v24 < v23)
              {
                uint64_t v37 = 0;
                uint64_t v38 = *((void *)v41 + v35) + v24;
                do
                {
                  *(unsigned char *)(*(void *)(a1 + 200) + v36 * *(void *)(a1 + 224) + v24 + v37) = v33 <= *(unsigned __int8 *)(v38 + v37);
                  ++v37;
                  int v23 = *(_DWORD *)(a1 + 28);
                  int v39 = v23 - v24;
                  if (v23 - (int)v24 >= 8) {
                    int v39 = 8;
                  }
                }
                while (v37 < v39);
                LODWORD(v14) = *(_DWORD *)(a1 + 32);
              }
              ++v35;
              int v40 = v14 - v16;
              if ((int)v14 - (int)v16 >= 8) {
                int v40 = 8;
              }
              ++v36;
            }
            while (v35 < v40);
          }
          v24 += 8;
          ++v25;
        }
        while (v24 < v23);
        uint64_t v19 = (int)v14;
      }
      v16 += 8;
      ++v15;
    }
    while (v16 < v19);
  }
  free(v13);
}

uint64_t FKThresholdCalculateContrast(uint64_t a1, void *a2, unint64_t a3)
{
  unsigned int v3 = WORD1(a3);
  if (WORD1(a3) >= *(int *)(a1 + 28)) {
    return 0;
  }
  unint64_t v4 = HIWORD(a3);
  if (*(_DWORD *)(a1 + 32) <= (int)HIWORD(a3) || v4 <= WORD2(a3)) {
    return 0;
  }
  int v5 = 0;
  int v6 = 0;
  unsigned int v7 = (unsigned __int16)a3;
  uint64_t v8 = (unsigned __int16)a3;
  int v9 = WORD1(a3) - (unsigned __int16)a3;
  uint64_t v10 = WORD2(a3);
  unint64_t v11 = WORD1(a3) - (unint64_t)(unsigned __int16)a3;
  int v12 = 255;
  do
  {
    if (v3 > v7)
    {
      uint64_t v13 = (unsigned __int8 *)(*a2 + v8 + a2[3] * v10);
      unint64_t v14 = v11;
      do
      {
        int v16 = *v13++;
        int v15 = v16;
        if (v12 >= v16) {
          int v12 = v15;
        }
        if (v6 <= v15) {
          int v6 = v15;
        }
        --v14;
      }
      while (v14);
      v5 += v9;
    }
    ++v10;
  }
  while (v10 != v4);
  if (v5) {
    return (v6 - v12);
  }
  else {
    return 0;
  }
}

void FKThresholdMinMaxBlock(uint64_t a1, void *a2, int a3, int a4, int a5)
{
  int v5 = a2;
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = a2[2] + 3;
  unint64_t v7 = v6 >> 2;
  uint64_t v179 = a2[1];
  unint64_t v8 = ((unint64_t)(v179 + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL;
  int v9 = (char *)malloc_type_malloc(v8 * (v6 & 0xFFFFFFFFFFFFFFFCLL), 0x100004052888210uLL);
  v181 = v5;
  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = v5[2];
    unint64_t v13 = (v12 >> 2) & 0x3FFFFFFFFFFFFFFCLL;
    unint64_t v186 = v12;
    unint64_t v14 = v12 & 0xF;
    do
    {
      uint64_t v15 = 0;
      uint64_t v189 = v11;
      int v16 = &v9[4 * v11 * v7];
      v193[0] = v16;
      v193[1] = &v16[4 * v7];
      memset(v194, 0, 64);
      uint64_t v18 = *v5;
      unint64_t v17 = v5[1];
      uint64_t v19 = v5[3];
      do
      {
        unint64_t v20 = v10 + v15;
        if (v17 <= v10 + v15) {
          unint64_t v20 = v17 - 1;
        }
        *((void *)v194 + v15++) = v18 + v20 * v19;
      }
      while (v15 != 8);
      if (v186 >= 0x10)
      {
        unint64_t v21 = 0;
        do
        {
          uint64_t v22 = 0;
          char v23 = 1;
          do
          {
            uint64_t v24 = 0;
            char v25 = v23;
            uint64_t v26 = &v194[2 * v22];
            do
            {
              int v27 = (uint8x16_t *)*((void *)v26 + v24);
              v195[v24] = *v27;
              *((void *)v26 + v24++) = v27 + 1;
            }
            while (v24 != 4);
            char v23 = 0;
            int16x8_t v28 = (int16x8_t)vpadalq_u8(vpadalq_u8(vpadalq_u8(vpaddlq_u8(v195[1]), v195[0]), v195[2]), v195[3]);
            v29.i64[0] = vpaddq_s16(v28, v28).u64[0];
            v29.i64[1] = v29.i64[0];
            uint8x16_t v30 = vminq_u8(vminq_u8(vminq_u8(v195[0], v195[1]), v195[2]), v195[3]);
            uint8x16_t v31 = vmaxq_u8(vmaxq_u8(vmaxq_u8(v195[0], v195[1]), v195[2]), v195[3]);
            int16x8_t v32 = (int16x8_t)vpminq_u8(v30, v30);
            v31.i64[0] = vpmaxq_u8(v31, v31).u64[0];
            *(int8x8_t *)v32.i8 = vzip1_s8((int8x8_t)vpmin_u8(*(uint8x8_t *)v32.i8, *(uint8x8_t *)v32.i8), (int8x8_t)vpmax_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v31.i8));
            *(int16x8_t *)(v193[v22] + 4 * v21) = vzip1q_s16(v32, v29);
            uint64_t v22 = 1;
          }
          while ((v25 & 1) != 0);
          v21 += 4;
        }
        while (v13 > v21);
      }
      if (v14)
      {
        uint64_t v33 = 0;
        uint64_t v34 = 0;
        uint64_t v36 = *((void *)&v194[0] + 1);
        uint64_t v35 = *(void *)&v194[0];
        uint64_t v38 = *((void *)&v194[1] + 1);
        uint64_t v37 = *(void *)&v194[1];
        uint64_t v40 = *((void *)&v194[2] + 1);
        uint64_t v39 = *(void *)&v194[2];
        uint64_t v42 = *((void *)&v194[3] + 1);
        uint64_t v41 = *(void *)&v194[3];
        do
        {
          uint64_t v43 = 0;
          unsigned int v44 = 0;
          int v45 = 0;
          int v46 = 0;
          int v47 = 0;
          int v48 = 255;
          int v49 = 255;
          do
          {
            if (v33 + v43 >= v14) {
              break;
            }
            int v50 = *(unsigned __int8 *)(v35 + v43);
            if (v49 >= v50) {
              int v49 = *(unsigned __int8 *)(v35 + v43);
            }
            if ((int)v44 <= v50) {
              unsigned int v44 = *(unsigned __int8 *)(v35 + v43);
            }
            int v51 = v46 + v50;
            int v52 = *(unsigned __int8 *)(v36 + v43);
            if (v49 >= v52) {
              int v49 = *(unsigned __int8 *)(v36 + v43);
            }
            if (v44 <= v52) {
              unsigned int v44 = *(unsigned __int8 *)(v36 + v43);
            }
            int v53 = *(unsigned __int8 *)(v37 + v43);
            if (v49 >= v53) {
              int v49 = *(unsigned __int8 *)(v37 + v43);
            }
            if (v44 <= v53) {
              unsigned int v44 = *(unsigned __int8 *)(v37 + v43);
            }
            int v54 = v52 + v53;
            int v55 = *(unsigned __int8 *)(v38 + v43);
            int v56 = v51 + v54;
            if (v49 >= v55) {
              int v49 = *(unsigned __int8 *)(v38 + v43);
            }
            if (v44 <= v55) {
              unsigned int v44 = *(unsigned __int8 *)(v38 + v43);
            }
            int v46 = v56 + v55;
            int v57 = *(unsigned __int8 *)(v39 + v43);
            if (v48 >= v57) {
              int v58 = *(unsigned __int8 *)(v39 + v43);
            }
            else {
              int v58 = v48;
            }
            if (v47 <= v57) {
              unsigned int v59 = *(unsigned __int8 *)(v39 + v43);
            }
            else {
              unsigned int v59 = v47;
            }
            int v60 = v45 + v57;
            unsigned int v61 = *(unsigned __int8 *)(v40 + v43);
            if (v58 >= (int)v61) {
              int v58 = *(unsigned __int8 *)(v40 + v43);
            }
            if (v59 <= v61) {
              unsigned int v59 = *(unsigned __int8 *)(v40 + v43);
            }
            unsigned int v62 = *(unsigned __int8 *)(v41 + v43);
            if (v58 >= (int)v62) {
              int v58 = *(unsigned __int8 *)(v41 + v43);
            }
            unsigned int v63 = v59 <= v62 ? *(unsigned __int8 *)(v41 + v43) : v59;
            int v64 = v60 + v61 + v62;
            unsigned int v65 = *(unsigned __int8 *)(v42 + v43);
            int v48 = v58 >= (int)v65 ? *(unsigned __int8 *)(v42 + v43) : v58;
            int v47 = v63 <= v65 ? *(unsigned __int8 *)(v42 + v43) : v63;
            int v45 = v64 + v65;
            ++v43;
          }
          while (v43 != 4);
          v42 += v43;
          v41 += v43;
          v40 += v43;
          v39 += v43;
          v38 += v43;
          v37 += v43;
          v36 += v43;
          v35 += v43;
          char v66 = &v16[4 * v34 + 4 * v13];
          *char v66 = v49;
          v66[1] = v44;
          *((_WORD *)v66 + 1) = v46;
          uint64_t v67 = (uint64_t)&v16[4 * v7 + 4 * v34 + 4 * v13];
          *(unsigned char *)uint64_t v67 = v48;
          *(unsigned char *)(v67 + 1) = v47;
          *(_WORD *)(v67 + 2) = v45;
          ++v34;
          v33 += 4;
        }
        while (v34 != (v14 + 3) >> 2);
      }
      uint64_t v11 = v189 + 2;
      v10 += 8;
      int v5 = v181;
    }
    while ((((unint64_t)(v179 + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) > v189 + 2);
  }
  int v68 = *(_DWORD *)(a1 + 28);
  int v69 = *(_DWORD *)(a1 + 32);
  unsigned int v70 = v68 + 62;
  if (v68 >= -31) {
    int v71 = v68 + 31;
  }
  else {
    int v71 = v68 + 62;
  }
  int v72 = v71 >> 5;
  uint64_t v177 = (uint64_t)v71 >> 5;
  int v73 = v69 + 31;
  unsigned int v74 = v69 + 62;
  if (v69 < -31) {
    int v73 = v69 + 62;
  }
  unsigned int v75 = v73 >> 5;
  uint64_t v76 = (char *)malloc_type_malloc(2 * v72 * (uint64_t)(v73 >> 5), 0x1000040BDFB0063uLL);
  if (v74 >= 0x3F)
  {
    uint64_t v77 = 0;
    int v78 = a5 + 8;
    if (v177 <= 1) {
      uint64_t v79 = 1;
    }
    else {
      uint64_t v79 = v177;
    }
    if (v75 <= 1) {
      uint64_t v80 = 1;
    }
    else {
      uint64_t v80 = v75;
    }
    do
    {
      if (v70 >= 0x3F)
      {
        uint64_t v81 = 0;
        int v82 = -a5;
        do
        {
          if (v78 <= -a5)
          {
            int v85 = 0;
            int v84 = 0;
            int v83 = 0;
            int v86 = 255;
          }
          else
          {
            int v83 = 0;
            int v84 = 0;
            int v85 = 0;
            int v86 = 255;
            int v87 = -a5;
            do
            {
              unint64_t v88 = (v87 + 8 * v77);
              unint64_t v89 = v7 * v88;
              BOOL v91 = (v88 & 0x80000000) != 0 || (unint64_t)(v179 + 3) >> 2 <= v88;
              int v92 = v82;
              int v93 = 2 * a5 + 8;
              do
              {
                char v94 = v92 < 0 || v91;
                if ((v94 & 1) == 0 && v7 > v92)
                {
                  int v95 = &v9[4 * v89 + 4 * v92];
                  int v96 = *v95;
                  int v97 = v95[1];
                  int v98 = *((unsigned __int16 *)v95 + 1);
                  if (v86 >= v96) {
                    int v86 = v96;
                  }
                  if (v85 <= v97) {
                    int v85 = v97;
                  }
                  v84 += v98;
                  ++v83;
                }
                ++v92;
                --v93;
              }
              while (v93);
              ++v87;
            }
            while (v87 != v78);
          }
          signed int v99 = v84 / (16 * v83) + ((v86 + v85 + 1) >> 1);
          int v100 = &v76[2 * v81 + 2 * v77 * v177];
          *int v100 = v99 / 2;
          v100[1] = v85 - v86;
          ++v81;
          v82 += 8;
        }
        while (v81 != v79);
      }
      ++v77;
    }
    while (v77 != v80);
  }
  unint64_t v101 = v5[1];
  int v102 = a4;
  if (v101)
  {
    uint64_t v103 = 0;
    unint64_t v104 = v5[2];
    unint64_t v105 = v104 >> 5;
    unint64_t v172 = v104;
    v173 = v76;
    unint64_t v175 = v104 & 0xFFFFFFFFFFFFFFE0;
    unint64_t v176 = v104 >> 5;
    uint64_t v106 = 1;
    *(void *)&long long v107 = 0x202020202020202;
    *((void *)&v107 + 1) = 0x202020202020202;
    v108.i64[0] = 0x101010101010101;
    v108.i64[1] = 0x101010101010101;
    uint64_t v109 = v76;
    while (1)
    {
      memset(&v195[0].u64[1], 0, 248);
      uint64_t v110 = v5[3];
      uint64_t v111 = *v5 + v110 * v103;
      uint64_t v112 = *(void *)(a1 + 200);
      uint64_t v113 = *(void *)(a1 + 224);
      uint64_t v114 = v112 + v113 * v103;
      memset((char *)v194 + 8, 0, 248);
      v195[0].i64[0] = v111;
      uint64_t v178 = v106;
      uint64_t v115 = v112 + v113 * v106;
      uint64_t v116 = 1;
      *(void *)&v194[0] = v114;
      do
      {
        if (v101 <= v103 + v116) {
          uint64_t v117 = 0;
        }
        else {
          uint64_t v117 = v110;
        }
        v111 += v117;
        v195[0].i64[v116] = v111;
        *((void *)v194 + v116++) = v115;
        v115 += v113;
      }
      while (v116 != 32);
      uint64_t v180 = v103;
      if (v172 >= 0x20)
      {
        uint64_t v118 = 0;
        uint64_t v119 = v109;
        do
        {
          if (*((unsigned __int8 *)v119 + 1) >= v102)
          {
            uint64_t v122 = 0;
            uint8x16_t v123 = (uint8x16_t)vld1q_dup_s8(v119);
            uint64_t v124 = (32 * v118);
            do
            {
              int v125 = (uint8x16_t *)(v195[0].i64[v122] + v124);
              unsigned int v126 = (int8x16_t *)(*(void *)((char *)v194 + v122 * 8) + v124);
              *unsigned int v126 = vandq_s8((int8x16_t)vcgeq_u8(*v125, v123), v108);
              v126[1] = vandq_s8((int8x16_t)vcgeq_u8(v125[1], v123), v108);
              ++v122;
            }
            while (v122 != 32);
            if (!a3) {
              goto LABEL_135;
            }
            uint64_t v127 = 0;
            int v128 = 0;
            int v129 = 0;
            do
            {
              uint64_t v130 = 0;
              uint64_t v131 = *((void *)v194 + v127);
              v129 += *(unsigned __int8 *)(v131 + v124);
              uint64_t v132 = v131 + 32 * (v118 & 0x7FFFFFF);
              do
              {
                int v133 = *(unsigned __int8 *)(v132 + v130 + 1);
                v129 += v133;
                if (v133 != *(unsigned __int8 *)(v132 + v130)) {
                  ++v128;
                }
                ++v130;
              }
              while (v130 != 31);
              ++v127;
            }
            while (v127 != 32);
            int v134 = 1024 - v129;
            if (v129 < 1024 - v129) {
              int v134 = v129;
            }
            if (!v134) {
              goto LABEL_135;
            }
            uint64_t v135 = 0;
            int v136 = 0;
            do
            {
              unsigned __int8 v137 = *(unsigned char *)(v114 + v135 + v124);
              for (uint64_t i = 8; i != 256; i += 8)
              {
                int v139 = *(unsigned __int8 *)(*(void *)((char *)v194 + i) + v135 + v124);
                if (v139 != v137) {
                  ++v136;
                }
                unsigned __int8 v137 = v139;
              }
              ++v135;
            }
            while (v135 != 32);
            int v140 = v136 + v128;
            float v141 = (float)v140;
            if (v134 >= 10)
            {
              if (v140 <= 450 && (float)(v141 / (float)v134) <= 2.5) {
                goto LABEL_135;
              }
LABEL_133:
              for (uint64_t j = 0; j != 256; j += 8)
              {
                uint64_t v143 = (_OWORD *)(*(void *)((char *)v194 + j) + v124);
                *uint64_t v143 = v107;
                v143[1] = v107;
              }
              goto LABEL_135;
            }
            if ((float)(v141 / (float)v134) > 3.0) {
              goto LABEL_133;
            }
          }
          else
          {
            for (uint64_t k = 0; k != 256; k += 8)
            {
              char v121 = (_OWORD *)(*(void *)((char *)v194 + k) + (32 * v118));
              *char v121 = v107;
              v121[1] = v107;
            }
          }
LABEL_135:
          v119 += 2;
          ++v118;
        }
        while (v118 != v105);
      }
      v183 = v109;
      unint64_t v144 = v5[2];
      uint64_t v190 = v144 - v175;
      if (v144 != v175)
      {
        unint64_t v145 = v190 + 31;
        if ((unint64_t)(v190 + 31) >= 0x20) {
          break;
        }
      }
LABEL_181:
      int v5 = v181;
      uint64_t v109 = &v183[2 * v177];
      uint64_t v103 = v180 + 32;
      unint64_t v101 = v181[1];
      uint64_t v106 = v178 + 32;
      uint64_t v76 = v173;
      unint64_t v105 = v176;
      if (v101 <= v180 + 32) {
        goto LABEL_182;
      }
    }
    unint64_t v146 = v175;
    unint64_t v187 = v145 & 0xFFFFFFFFFFFFFFE0;
    unint64_t v188 = v176 + (v145 >> 5);
    size_t v147 = (v145 & 0xFFFFFFFFFFFFFFE0) - v190;
    unint64_t v148 = v176;
    v149 = &v109[2 * v176];
    while (1)
    {
      v191 = v149;
      unint64_t v192 = v148;
      if (v149[1] >= v102)
      {
        uint64_t v152 = 0;
        unsigned int v153 = *v149;
        uint64_t v154 = 32 * v148;
        do
        {
          for (uint64_t m = 0; m != 32; ++m)
          {
            if (v146 + m >= v144) {
              break;
            }
            *(unsigned char *)(*((void *)v194 + v152) + v146 + m) = *(unsigned __int8 *)(v195[0].i64[v152] + v146 + m) >= v153;
          }
          ++v152;
        }
        while (v152 != 32);
        if (!a3) {
          goto LABEL_177;
        }
        uint64_t v156 = 0;
        int v157 = 0;
        int v158 = 0;
        do
        {
          uint64_t v159 = 0;
          uint64_t v160 = *((void *)v194 + v156);
          v158 += *(unsigned __int8 *)(v160 + v154);
          uint64_t v161 = v160 + v146;
          do
          {
            int v162 = *(unsigned __int8 *)(v161 + v159 + 1);
            v158 += v162;
            if (v162 != *(unsigned __int8 *)(v161 + v159)) {
              ++v157;
            }
            ++v159;
          }
          while (v159 != 31);
          ++v156;
        }
        while (v156 != 32);
        if (v158 >= 1024 - v158) {
          int v158 = 1024 - v158;
        }
        if (!v158) {
          goto LABEL_177;
        }
        uint64_t v163 = 0;
        int v164 = 0;
        do
        {
          unsigned __int8 v165 = *(unsigned char *)(v114 + v163 + v154);
          for (uint64_t n = 8; n != 256; n += 8)
          {
            int v167 = *(unsigned __int8 *)(*(void *)((char *)v194 + n) + v163 + v154);
            if (v167 != v165) {
              ++v164;
            }
            unsigned __int8 v165 = v167;
          }
          ++v163;
        }
        while (v163 != 32);
        float v168 = (float)(v164 + v157);
        if (v158 >= 10)
        {
          if (v164 + v157 > 450 || (float)(v168 / (float)v158) > 2.5)
          {
LABEL_172:
            for (iuint64_t i = 0; ii != 32; ++ii)
            {
              for (juint64_t j = 0; jj != 32; ++jj)
              {
                if (v146 + jj >= v144) {
                  break;
                }
                *(unsigned char *)(*((void *)v194 + ii) + v146 + jj) = 2;
              }
            }
          }
        }
        else if ((float)(v168 / (float)v158) > 3.0)
        {
          goto LABEL_172;
        }
      }
      else
      {
        for (kuint64_t k = 0; kk != 32; ++kk)
        {
          for (muint64_t m = 0; mm != 32; ++mm)
          {
            if (v146 + mm >= v144) {
              break;
            }
            *(unsigned char *)(*((void *)v194 + kk) + v146 + mm) = 2;
          }
        }
      }
LABEL_177:
      if (v187 != v190)
      {
        for (nuint64_t n = 0; nn != 256; nn += 8)
          memset((void *)(*(void *)((char *)v194 + nn) + v144), *(unsigned __int8 *)(*(void *)((char *)v194 + nn) + v144 - 1), v147);
      }
      v149 = v191 + 2;
      unint64_t v148 = v192 + 1;
      v146 += 32;
      int v102 = a4;
      *(void *)&long long v107 = 0x202020202020202;
      *((void *)&v107 + 1) = 0x202020202020202;
      v108.i64[0] = 0x101010101010101;
      v108.i64[1] = 0x101010101010101;
      if (v192 + 1 >= v188) {
        goto LABEL_181;
      }
    }
  }
LABEL_182:
  free(v76);
  free(v9);
}

uint64_t FKPrintLinesegList(uint64_t result, int a2)
{
  if (a2 != -1)
  {
    uint64_t v2 = result;
    do
    {
      uint64_t v3 = *(void *)(v2 + 256) + 8 * a2;
      if (*(_WORD *)(v3 + 4)) {
        int v4 = a2 - *(unsigned __int16 *)(v3 + 4);
      }
      else {
        int v4 = -1;
      }
      uint64_t result = printf("%6d: %6d %6d %2d %4d %4d %4d\n", a2, v4, *(int *)v3 >> 8, *(_DWORD *)v3 & 3, (unsigned __int16)((*(_DWORD *)v3 >> 2)+ *(_WORD *)(*(void *)(v2 + 264) + 2 * (a2 >> 6))), (unsigned __int16)(*(_WORD *)(v3 - 2) + 1), *(unsigned __int16 *)(v3 + 6));
      if (!*(_WORD *)(v3 + 4)) {
        break;
      }
      a2 = ((unint64_t)(v3 - *(void *)(v2 + 256)) >> 3) - *(unsigned __int16 *)(v3 + 4);
    }
    while (a2 != -1);
  }
  return result;
}

uint64_t FKComponentPrint(uint64_t a1, uint64_t a2)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(unsigned __int16 *)(a2 + 80);
  uint64_t v5 = *(unsigned __int16 *)(a2 + 82) - v4;
  uint64_t v6 = v5 + 1;
  int v7 = *(unsigned __int16 *)(a2 + 84);
  int v8 = *(unsigned __int16 *)(a2 + 86) - v7;
  MEMORY[0x1F4188790](a1);
  uint64_t v10 = (char *)v28 - v9;
  memset((char *)v28 - v9, 46, v11);
  printf("Color: %d\n", *(unsigned __int8 *)(a2 + 92));
  printf("Size: %dx%d\n", v5 + 1, v8 + 1);
  int v12 = *(_DWORD *)(a2 + 12);
  if (v12 != -1)
  {
    uint64_t v13 = *(void *)(a1 + 256);
    uint64_t v14 = *(void *)(a1 + 264);
    do
    {
      uint64_t v15 = v12;
      int v16 = (_WORD *)(v13 + 8 * v12);
      uint64_t v17 = (unsigned __int16)v16[3];
      unsigned __int16 v18 = *(v16 - 1) + 1;
      if (v17 >= v18)
      {
        uint64_t v19 = v17 - v18 + 1;
        int v20 = ((unsigned __int16)((*v16 >> 2) + *(_WORD *)(v14 + 2 * ((int)v15 >> 6))) - v7) * v6
            - v4
            + v18;
        do
        {
          v10[v20++] = 64;
          --v19;
        }
        while (v19);
      }
      int v12 = v15 - *(unsigned __int16 *)(v13 + 8 * v15 + 4);
      if (*(_WORD *)(v13 + 8 * v15 + 4)) {
        BOOL v21 = v12 == -1;
      }
      else {
        BOOL v21 = 1;
      }
    }
    while (!v21);
  }
  if ((v8 & 0x80000000) == 0)
  {
    uint64_t v22 = 0;
    do
    {
      uint64_t v23 = v6;
      uint64_t v24 = v10;
      if ((v5 & 0x80000000) == 0)
      {
        do
        {
          int v25 = *v24++;
          putchar(v25);
          --v23;
        }
        while (v23);
      }
      putchar(10);
      ++v22;
      v10 += v6;
    }
    while (v22 != v8 + 1);
  }
  uint64_t v26 = (FILE *)*MEMORY[0x1E4F143D8];
  return fflush(v26);
}

uint64_t FKConcompRelease(uint64_t result, int a2, char a3)
{
  if (a2 != -1)
  {
    uint64_t v3 = *(void *)(result + 280);
    uint64_t v4 = v3 + 100 * a2;
    int v7 = *(_DWORD *)(v4 + 8);
    uint64_t v6 = v4 + 8;
    int v5 = v7;
    *(unsigned char *)(v6 + 86) = a3;
    int v8 = *(_DWORD *)(v6 - 4);
    uint64_t v9 = (_DWORD *)(v3 + 100 * v8 + 8);
    if (v8 == -1) {
      uint64_t v9 = (_DWORD *)(result + 300);
    }
    *uint64_t v9 = v5;
    if (v5 == -1) {
      *(_DWORD *)(result + 296) = v8;
    }
    else {
      *(_DWORD *)(v3 + 100 * v5 + 4) = v8;
    }
    uint64_t v10 = 0;
    *(_DWORD *)(v6 - 4) = *(_DWORD *)(result + 304);
    *(_DWORD *)(result + 304) = a2;
    *(_DWORD *)uint64_t v6 = -2;
    uint64_t v11 = v3 + 100 * a2;
    uint64_t v12 = 100 * a2;
    *(void *)(v11 + 80) = -1;
    *(_DWORD *)(v11 + 40) = 0;
    uint64_t v13 = *(void *)(result + 280);
    do
    {
      *(_DWORD *)(v13 + v12 + v10 + 24) = 0;
      uint64_t v13 = *(void *)(result + 280);
      *(_DWORD *)(v13 + v12 + v10 + 48) = 0;
      v10 += 4;
    }
    while (v10 != 16);
    *(void *)(v13 + 100 * a2 + 64) = -1;
    ++*(_DWORD *)(result + 292);
  }
  return result;
}

uint64_t FKConcompCreateSubConcomp(size_t a1, int a2, _WORD *a3, uint64_t a4)
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void *)(a1 + 280) + 100 * a2;
  uint64_t v7 = *(void *)(v6 + 80);
  BOOL v8 = *a3 != 0;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 0x40000000;
  int v60 = __FKConcompCreateSubConcomp_block_invoke;
  unsigned int v61 = &__block_descriptor_tmp_0;
  uint64_t v63 = a4;
  uint64_t v64 = v7;
  BOOL v65 = v8;
  unsigned int v62 = a3;
  int v9 = *(_DWORD *)(v6 + 12);
  int v10 = *(_DWORD *)(a1 + 276);
  int v11 = (v10 - 1) & 0x3F;
  if (1 - v10 >= 0) {
    int v11 = -((1 - v10) & 0x3F);
  }
  int v12 = v10 - v11 + 63;
  *(_DWORD *)(a1 + 276) = v12;
  if (v9 == -1)
  {
LABEL_51:
    *(_DWORD *)(a1 + 276) = v10;
    return 0xFFFFFFFFLL;
  }
  int v58 = v10;
  int v57 = v12;
  int v13 = 0;
  unsigned __int16 v14 = 0;
  int v15 = 0x7FFFFFFF;
  do
  {
    int v16 = (_WORD *)(*(void *)(a1 + 256) + 8 * v9);
    unint64_t v17 = (unsigned __int16)(*(v16 - 1) + 1) | ((unint64_t)(unsigned __int16)v16[3] << 16);
    unsigned __int16 v18 = (*v16 >> 2) + *(_WORD *)(*(void *)(a1 + 264) + 2 * (v9 >> 6));
    int v19 = (unsigned __int16)v16[2];
    v69[0] = 0;
    v67[0] = 0;
    char v66 = 0;
    int v20 = v18;
    unint64_t v4 = v17 | v4 & 0xFFFFFFFF00000000;
    if (((unsigned int (*)(void *, unint64_t, void, int *, int *, char *))v60)(v59, v4, v18, v69, v67, &v66))
    {
      if (v15 != 0x7FFFFFFF && v15 - 1 > v20)
      {
        *(_DWORD *)(a1 + 276) = v58;
        return 0xFFFFFFFFLL;
      }
      if (v20 <= 63) {
        __int16 v21 = 63;
      }
      else {
        __int16 v21 = v20;
      }
      unsigned __int16 v22 = v21 - 63;
      if ((v13 & 0x3F) == 0) {
        unsigned __int16 v14 = v22;
      }
      createNewLineseg(a1, v20, v69[0], v67[0], *(_DWORD *)v16 & 3, 1, v14);
      ++v13;
      int v15 = v20;
    }
    if (v66) {
      break;
    }
    v9 -= v19;
  }
  while (v19 && v9 != -1);
  int v10 = v58;
  if (!v13) {
    goto LABEL_51;
  }
  if (1 - 2 * v13 >= 0) {
    int v24 = -((1 - 2 * v13) & 0x3F);
  }
  else {
    int v24 = (2 * (_BYTE)v13 - 1) & 0x3F;
  }
  unsigned int v25 = (63 - v24) >> 1;
  if (v24 <= 62)
  {
    if ((63 - v24) >> 1 <= 1) {
      unsigned int v26 = 1;
    }
    else {
      unsigned int v26 = (63 - v24) >> 1;
    }
    do
    {
      createNewLineseg(a1, v14, 0, 0, 2u, 1, -1);
      --v26;
    }
    while (v26);
  }
  int v27 = *(_DWORD *)(a1 + 276);
  int v28 = v27 - v57;
  if (v27 >= v57) {
    int v29 = v27 - v57;
  }
  else {
    int v29 = v28 + 1;
  }
  int v30 = v29 >> 1;
  if (v28 > 1)
  {
    int v31 = v30 + 2;
    if (v30 >= -1) {
      int v31 = v30 + 1;
    }
    LODWORD(v32) = v31 >> 1;
    if ((int)v32 <= 1) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = v32;
    }
    uint64_t v33 = 8 * v57;
    int v34 = -2;
    do
    {
      uint64_t v35 = *(void *)(a1 + 256);
      uint64_t v36 = 8 * (v34 + *(_DWORD *)(a1 + 276));
      long long v37 = *(_OWORD *)(v35 + v33);
      *(_OWORD *)(v35 + v33) = *(_OWORD *)(v35 + v36);
      *(_OWORD *)(v35 + v36) = v37;
      v34 -= 2;
      v33 += 16;
      --v32;
    }
    while (v32);
    int v38 = *(_DWORD *)(a1 + 276);
    if (v38 - v57 >= 128)
    {
      uint64_t v39 = (v38 - v57) >> 7;
      uint64_t v40 = *(void *)(a1 + 264);
      uint64_t v41 = (__int16 *)(v40 + 2 * (v38 >> 6) - 2);
      uint64_t v42 = (__int16 *)(v40 + 2 * (v57 >> 6));
      do
      {
        __int16 v43 = *v42;
        *v42++ = *v41;
        *v41-- = v43;
        --v39;
      }
      while (v39);
    }
  }
  unsigned int v44 = v30 - v25;
  if ((int)(v30 - v25) < 1) {
    return 0xFFFFFFFFLL;
  }
  int v45 = v57 - v24 + 64;
  uint64_t v46 = 8 * v45;
  uint64_t v47 = 0xFFFFFFFFLL;
  do
  {
    uint64_t v48 = *(void *)(a1 + 256);
    uint64_t v49 = v48 + v46;
    if (v47 == -1)
    {
      createConcompFromLineseg(a1, v48 + v46, 0);
      uint64_t v47 = (*(int *)v49 >> 8);
      uint64_t v54 = *(void *)(a1 + 280) + 100 * (int)v47;
      *(_WORD *)(v54 + 93) = 0;
      *(unsigned char *)(v54 + 96) = 1;
    }
    else
    {
      uint64_t v50 = *(int *)(*(void *)(a1 + 280) + 100 * (int)v47 + 12);
      int v68 = 0;
      v69[0] = v45;
      int v70 = 0;
      v69[1] = (unsigned __int16)(*(_WORD *)(v49 - 2) + 1) | (*(unsigned __int16 *)(v49 + 6) << 16);
      uint64_t v51 = *(void *)(a1 + 264);
      int v52 = *(_DWORD *)v49;
      LOWORD(v70) = (*(_DWORD *)v49 >> 2) + *(_WORD *)(v51 + 2 * (v45 >> 6));
      HIWORD(v70) = v52 & 3;
      uint64_t v53 = v48 + 8 * v50;
      v67[0] = v50;
      v67[1] = (unsigned __int16)(*(_WORD *)(v53 - 2) + 1) | (*(unsigned __int16 *)(v53 + 6) << 16);
      LODWORD(v53) = *(_DWORD *)v53;
      LOWORD(v68) = (v53 >> 2) + *(_WORD *)(v51 + 2 * ((int)v50 >> 6));
      HIWORD(v68) = v53 & 3;
      addScansegToScansegList(a1, v69, v67);
    }
    v46 += 16;
    v45 += 2;
    --v44;
  }
  while (v44);
  if (v47 != -1) {
    *(unsigned char *)(*(void *)(a1 + 280) + 100 * (int)v47 + 94) = *(unsigned char *)(*(void *)(a1 + 280) + 100 * a2 + 94);
  }
  return v47;
}

BOOL __FKConcompCreateSubConcomp_block_invoke(uint64_t a1, unsigned int a2, int a3, int *a4, int *a5)
{
  int v5 = HIWORD(a2);
  int v6 = a3 - *(unsigned __int16 *)(a1 + 52);
  int v7 = *(unsigned __int16 *)(a1 + 48);
  int v8 = v7 + *(unsigned __int8 *)(a1 + 56) + *(unsigned __int16 *)(*(void *)(a1 + 32) + 2 * v6);
  int v9 = v7 + *(unsigned __int16 *)(*(void *)(a1 + 40) + 2 * v6) - 1;
  if (v8 <= (unsigned __int16)a2) {
    int v8 = (unsigned __int16)a2;
  }
  if (v9 < (int)HIWORD(a2)) {
    int v5 = v9;
  }
  *a4 = v8;
  *a5 = v5;
  return v8 <= v5;
}

size_t FKComponentsFind(size_t result)
{
  size_t v1 = result;
  *(_DWORD *)(result + 276) = 0;
  *(void *)(result + 248) = 0;
  *(void *)(result + 296) = -1;
  *(_DWORD *)(result + 304) = 0;
  int v2 = *(_DWORD *)(result + 288);
  uint64_t v3 = *(void *)(result + 280);
  uint64_t v4 = (v2 - 1);
  if (v2 <= 1)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = (_DWORD *)(v3 + 4);
    do
    {
      *int v6 = ++v5;
      v6 += 25;
    }
    while (v4 != v5);
  }
  *(_DWORD *)(v3 + 100 * v4 + 4) = -1;
  *(_DWORD *)(result + 292) = v2;
  if (*(int *)(result + 32) >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      int v8 = 0;
      uint64_t v58 = v7;
      uint64_t v59 = *(void *)(v1 + 200) + *(void *)(v1 + 224) * v7;
      int v9 = *(_DWORD *)(v1 + 28);
      do
      {
        int v10 = v8;
        int v11 = *(unsigned __int8 *)(v59 + v8);
        int v12 = (unsigned __int8 *)(v59 + v8);
        while (1)
        {
          int v13 = *v12++;
          if (v13 != v11) {
            break;
          }
          if (v9 == ++v8)
          {
            int v8 = v9;
            break;
          }
        }
        if (v8 - v10 <= 1 && *(_DWORD *)(v1 + 308)) {
          continue;
        }
        unsigned int v14 = *(_DWORD *)(v1 + 248);
        int v15 = (int *)(*(void *)(v1 + 232) + 12 * v14);
        *(_DWORD *)(v1 + 248) = (v14 + 1) & *(_DWORD *)(v1 + 244);
        int v16 = v58;
        *((_WORD *)v15 + 4) = v58;
        *((_WORD *)v15 + 2) = v10;
        *((_WORD *)v15 + 3) = v8 - 1;
        unint64_t v17 = (unsigned __int16 *)v15 + 3;
        *((unsigned char *)v15 + 10) = v11;
        if (v10)
        {
          int v18 = *(_DWORD *)(v1 + 276);
          BOOL v19 = __OFSUB__(v18, 1);
          int v20 = v18 - 1;
          if (v20 < 0 != v19)
          {
            BOOL v21 = 0;
          }
          else
          {
            int v16 = v58;
            BOOL v21 = v10 - *(unsigned __int16 *)(*(void *)(v1 + 256) + 8 * v20 + 6) > 1;
          }
        }
        else
        {
          BOOL v21 = 1;
        }
        uint64_t result = (size_t)createNewLineseg(v1, v16, v10, (unsigned __int16)v8 - 1, v11, v21, -1);
        if (!result) {
          continue;
        }
        *int v15 = (result - *(void *)(v1 + 256)) >> 3;
        for (unsigned int i = *(_DWORD *)(v1 + 252); ; *(_DWORD *)(v1 + 252) = i)
        {
          uint64_t v23 = *(void *)(v1 + 232);
          uint64_t v24 = v23 + 12 * i;
          unsigned int v25 = *(unsigned __int16 *)(v24 + 8);
          unsigned int v26 = *((unsigned __int16 *)v15 + 4);
          if ((int)(v26 - 1) <= (int)v25)
          {
            if (v25 >= v26) {
              goto LABEL_52;
            }
            unsigned int v27 = i;
            uint64_t v28 = v23 + 12 * i;
            int v31 = *(unsigned __int16 *)(v28 + 6);
            int v30 = (unsigned __int16 *)(v28 + 6);
            unsigned int v29 = v31;
            if (*((unsigned __int16 *)v15 + 2) - 1 <= v31) {
              break;
            }
          }
LABEL_37:
          int v37 = *(_DWORD *)(v1 + 308);
          int v38 = *(_DWORD *)(v1 + 244);
          if (v37 >= 1)
          {
            uint64_t v39 = *(void *)(v1 + 232);
            unsigned int v40 = v38 & (i - 1);
            uint64_t v41 = *(void *)(v1 + 256);
            int v42 = *(int *)(v41 + 8 * *(int *)(v39 + 12 * v40)) >> 8;
            if (v42 != -1)
            {
              uint64_t v43 = *(void *)(v1 + 280);
              if (*(_DWORD *)(v43 + 100 * v42 + 72) <= v37
                && *(unsigned __int16 *)(v43 + 100 * v42 + 82) <= *(unsigned __int16 *)(v39 + 12 * v40 + 6)
                && *(unsigned __int16 *)(v43 + 100 * v42 + 86) <= *(unsigned __int16 *)(v39 + 12 * v40 + 8))
              {
                int v44 = *(_DWORD *)(v43 + 100 * v42 + 12);
                if (v44 != -1)
                {
                  do
                  {
                    uint64_t v45 = v41 + 8 * v44;
                    int v46 = *(unsigned __int16 *)(v45 + 4);
                    v44 -= v46;
                    *(_DWORD *)v45 |= 0xFFFFFF00;
                    if (v46) {
                      BOOL v47 = v44 == -1;
                    }
                    else {
                      BOOL v47 = 1;
                    }
                  }
                  while (!v47);
                }
                uint64_t result = FKConcompRelease(v1, v42, 0);
                unsigned int i = *(_DWORD *)(v1 + 252);
                int v38 = *(_DWORD *)(v1 + 244);
              }
            }
          }
          unsigned int i = (i + 1) & v38;
        }
        unsigned int v32 = *v17;
        if (v32 + 1 < *(v30 - 1)) {
          goto LABEL_52;
        }
        int v33 = *((unsigned __int8 *)v15 + 10);
        int v34 = *(unsigned __int8 *)(v23 + 12 * v27 + 10);
        if (v34 == 2 || v33 == 2 || v34 == v33)
        {
          uint64_t result = addScansegToScansegList(v1, v15, (int *)v24);
          unsigned int v29 = *v30;
          unsigned int v32 = *v17;
        }
        if (v29 <= v32)
        {
          unsigned int i = *(_DWORD *)(v1 + 252);
          goto LABEL_37;
        }
        if (v32 + 1 == *(v30 - 1)) {
          *(_DWORD *)(v1 + 252) = (*(_DWORD *)(v1 + 252) - 1) & *(_DWORD *)(v1 + 244);
        }
LABEL_52:
        uint64_t v48 = (_DWORD *)(*(void *)(v1 + 256) + 8 * *v15);
        if (*v48 >= 0xFFFFFF00) {
          uint64_t result = createConcompFromLineseg(v1, (uint64_t)v48, 1);
        }
      }
      while (v8 != v9);
      uint64_t v7 = v58 + 1;
    }
    while (v58 + 1 < *(int *)(v1 + 32));
    int v49 = *(_DWORD *)(v1 + 296);
    while (v49 != -1)
    {
      uint64_t v50 = *(void *)(v1 + 280);
      int v51 = v49;
      uint64_t v52 = v50 + 100 * v49;
      int v49 = *(_DWORD *)(v52 + 4);
      if (*(unsigned char *)(v52 + 92) == 2)
      {
        uint64_t v53 = v1;
        char v54 = 4;
      }
      else
      {
        if (*(_DWORD *)(v50 + 100 * v51 + 72) >= *(_DWORD *)(v1 + 24))
        {
          if (*(_DWORD *)(v1 + 8))
          {
            uint64_t v55 = v50 + 100 * v51;
            int v57 = *(unsigned __int16 *)(v55 + 80);
            uint64_t v56 = v55 + 80;
            if (!v57
              || *(_DWORD *)(v1 + 28) - 1 == *(unsigned __int16 *)(v56 + 2)
              || !*(_WORD *)(v50 + 100 * v51 + 84)
              || *(_DWORD *)(v1 + 32) - 1 == *(unsigned __int16 *)(v50 + 100 * v51 + 86))
            {
              *(unsigned char *)(v50 + 100 * v51 + 94) = 4;
            }
          }
          continue;
        }
        uint64_t v53 = v1;
        char v54 = 2;
      }
      uint64_t result = FKConcompRelease(v53, v51, v54);
    }
  }
  return result;
}

unsigned int *createNewLineseg(uint64_t a1, int a2, __int16 a3, __int16 a4, unsigned __int8 a5, int a6, int a7)
{
  if (a6) {
    int v14 = 2;
  }
  else {
    int v14 = 1;
  }
  int v15 = *(_DWORD *)(a1 + 276);
  int v16 = *(_DWORD *)(a1 + 272);
  if (v15 + v14 <= v16) {
    goto LABEL_13;
  }
  if (v16 >= 0) {
    int v17 = *(_DWORD *)(a1 + 272);
  }
  else {
    int v17 = v16 + 1;
  }
  int v18 = v17 >> 1;
  if (v18 <= v14) {
    int v18 = v14;
  }
  int v19 = v18 + v16;
  int v20 = malloc_type_realloc(*(void **)(a1 + 256), 8 * (v18 + v16), 0x100004000313F17uLL);
  if (!v20)
  {
    uint64_t v24 = (FILE *)*MEMORY[0x1E4F143C8];
    unsigned int v25 = "Could not create more linesegments\n";
    size_t v26 = 35;
LABEL_32:
    fwrite(v25, v26, 1uLL, v24);
    fwrite("Could not create more linesegments\n", 0x23uLL, 1uLL, (FILE *)*MEMORY[0x1E4F143C8]);
    return 0;
  }
  *(void *)(a1 + 256) = v20;
  BOOL v21 = malloc_type_realloc(*(void **)(a1 + 264), 2 * ((v19 >> 6) + 1), 0x1000040BDFB0063uLL);
  if (!v21)
  {
    uint64_t v24 = (FILE *)*MEMORY[0x1E4F143C8];
    unsigned int v25 = "Could not create more linesegments row indices\n";
    size_t v26 = 47;
    goto LABEL_32;
  }
  *(void *)(a1 + 264) = v21;
  *(_DWORD *)(a1 + 272) = v19;
  int v15 = *(_DWORD *)(a1 + 276);
LABEL_13:
  if (a6)
  {
    uint64_t v22 = *(void *)(a1 + 256);
    *(_DWORD *)(a1 + 276) = v15 + 1;
    if (a7 >= 0) {
      int v23 = a7;
    }
    else {
      int v23 = a2;
    }
    if ((v15 & 0x3F) != 0)
    {
      if (a7 < 0) {
        int v23 = *(unsigned __int16 *)(*(void *)(a1 + 264) + 2 * (v15 >> 6));
      }
    }
    else
    {
      *(_WORD *)(*(void *)(a1 + 264) + 2 * (v15 >> 6)) = v23;
    }
    *(_DWORD *)(v22 + 8 * v15) = (4 * (a2 - v23)) | 0xFFFFFF02;
    uint64_t v27 = v22 + 8 * v15;
    *(_WORD *)(v27 + 4) = 0;
    *(_WORD *)(v27 + 6) = a3 - 1;
    int v15 = *(_DWORD *)(a1 + 276);
  }
  uint64_t v28 = *(void *)(a1 + 256);
  *(_DWORD *)(a1 + 276) = v15 + 1;
  uint64_t result = (unsigned int *)(v28 + 8 * v15);
  if (a7 >= 0) {
    __int16 v30 = a7;
  }
  else {
    __int16 v30 = a2;
  }
  if ((v15 & 0x3F) != 0)
  {
    if (a7 < 0) {
      __int16 v30 = *(_WORD *)(*(void *)(a1 + 264) + 2 * (v15 >> 6));
    }
  }
  else
  {
    *(_WORD *)(*(void *)(a1 + 264) + 2 * (v15 >> 6)) = v30;
  }
  *uint64_t result = a5 | (4 * (a2 - v30)) | 0xFFFFFF00;
  uint64_t v31 = v28 + 8 * v15;
  *(_WORD *)(v31 + 4) = 0;
  *(_WORD *)(v31 + 6) = a4;
  return result;
}

size_t createConcompFromLineseg(size_t result, uint64_t a2, int a3)
{
  uint64_t v4 = result;
  int v5 = *(_DWORD *)(result + 304);
  if (v5 != -1)
  {
LABEL_27:
    uint64_t v20 = *(void *)(v4 + 280) + 100 * v5;
    *(_DWORD *)(v4 + 304) = *(_DWORD *)(v20 + 4);
    --*(_DWORD *)(v4 + 292);
    int v21 = *(unsigned __int16 *)(a2 + 6);
    unsigned __int16 v22 = *(_WORD *)(a2 - 2) + 1;
    unint64_t v23 = (unint64_t)(a2 - *(void *)(v4 + 256)) >> 3;
    __int16 v24 = (*(_DWORD *)a2 >> 2) + *(_WORD *)(*(void *)(v4 + 264) + 2 * ((int)v23 >> 6));
    int v25 = v21 - v22;
    int v26 = *(_DWORD *)a2 & 3;
    *(_DWORD *)a2 = *(_DWORD *)a2 | (v5 << 8);
    *(int32x2_t *)(v20 + 12) = vdup_n_s32(v23);
    *(_WORD *)(v20 + 84) = v24;
    *(_WORD *)(v20 + 86) = v24;
    *(_WORD *)(v20 + 80) = v22;
    *(_WORD *)(v20 + 82) = v21;
    *(unsigned char *)(v20 + 92) = v26;
    *(_WORD *)(v20 + 88) = 0;
    *(_DWORD *)(v20 + 72) = v25 + 1;
    *(_DWORD *)(v20 + 76) = 2 * v25 + 4;
    *(_DWORD *)(v20 + 20) = 1;
    *(_WORD *)(v20 + 90) = v25 + 1;
    *(void *)(v20 + 56) = 0;
    *(void *)(v20 + 64) = -1;
    *(void *)(v20 + 24) = 0;
    *(void *)(v20 + 32) = 0;
    *(void *)(v20 + 40) = 0;
    *(void *)(v20 + 48) = 0;
    *(_DWORD *)(v20 + 93) = 0;
    int v27 = *(_DWORD *)(v4 + 300);
    *(_DWORD *)(v20 + 8) = v27;
    *(_DWORD *)(v4 + 300) = v5;
    *(void *)uint64_t v20 = -1;
    if (v27 == -1) {
      *(_DWORD *)(v4 + 296) = v5;
    }
    else {
      *(_DWORD *)(*(void *)(v4 + 280) + 100 * v27 + 4) = v5;
    }
    return result;
  }
  int v6 = *(_DWORD *)(result + 288);
  if (a3 && v6 >= 0x8000)
  {
    int v7 = *(_DWORD *)(result + 308);
    do
    {
      if (v7 <= 1) {
        int v8 = 1;
      }
      else {
        int v8 = v7;
      }
      int v9 = *(_DWORD *)(v4 + 296);
      if (v9 == -1)
      {
        int v5 = -1;
      }
      else
      {
        int v10 = (unsigned __int16)((*(_WORD *)a2 >> 2)
                               + *(_WORD *)(*(void *)(v4 + 264)
                                          + 2 * ((int)((unint64_t)(a2 - *(void *)(v4 + 256)) >> 3) >> 6)))
            - 2;
        do
        {
          uint64_t v11 = *(void *)(v4 + 280);
          uint64_t v12 = v11 + 100 * v9;
          int v13 = *(_DWORD *)(v12 + 4);
          if (v10 > *(unsigned __int16 *)(v12 + 86))
          {
            int v14 = v9;
            if (*(_DWORD *)(v11 + 100 * v9 + 72) <= v8)
            {
              int v15 = *(_DWORD *)(v11 + 100 * v9 + 12);
              if (v15 != -1)
              {
                uint64_t v16 = *(void *)(v4 + 256);
                do
                {
                  uint64_t v17 = v16 + 8 * v15;
                  int v18 = *(unsigned __int16 *)(v17 + 4);
                  v15 -= v18;
                  *(_DWORD *)v17 |= 0xFFFFFF00;
                  if (v18) {
                    BOOL v19 = v15 == -1;
                  }
                  else {
                    BOOL v19 = 1;
                  }
                }
                while (!v19);
              }
              uint64_t result = FKConcompRelease(v4, v14, 0);
            }
          }
          int v9 = v13;
        }
        while (v13 != -1);
        int v5 = *(_DWORD *)(v4 + 304);
        int v7 = *(_DWORD *)(v4 + 308);
      }
      if (v7 < 1) {
        int v7 = 1;
      }
      else {
        v7 *= 2;
      }
      *(_DWORD *)(v4 + 308) = v7;
    }
    while (v5 == -1);
    goto LABEL_27;
  }
  if (v6 >= 0x800000) {
    int v28 = 0xFFFFFF;
  }
  else {
    int v28 = 2 * v6;
  }
  uint64_t result = (size_t)malloc_type_realloc(*(void **)(result + 280), 100 * v28, 0x1000040D2C85C19uLL);
  unsigned int v29 = (FILE **)MEMORY[0x1E4F143C8];
  if (result && (int v5 = *(_DWORD *)(v4 + 288), *(void *)(v4 + 280) = result, v28 != v5))
  {
    *(_DWORD *)(v4 + 304) = v5;
    *(_DWORD *)(v4 + 292) = v28 - v5;
    int v31 = v28 - 1;
    if (v5 < v28 - 1)
    {
      unsigned int v32 = (int *)(result + 100 * v5 + 4);
      uint64_t v33 = v31 - (uint64_t)v5;
      int v34 = v5 + 1;
      do
      {
        *unsigned int v32 = v34;
        v32 += 25;
        ++v34;
        --v33;
      }
      while (v33);
    }
    *(_DWORD *)(result + 100 * v31 + 4) = -1;
    *(_DWORD *)(v4 + 288) = v28;
    if (v5 != -1) {
      goto LABEL_27;
    }
  }
  else
  {
    fwrite("Could not create more concomps\n", 0x1FuLL, 1uLL, *v29);
  }
  __int16 v30 = *v29;
  return fwrite("Could not get a free connected component\n", 0x29uLL, 1uLL, v30);
}

uint64_t addScansegToScansegList(uint64_t result, int *a2, int *a3)
{
  uint64_t v4 = result;
  unsigned int v5 = *((unsigned __int16 *)a2 + 2);
  unsigned int v6 = *((unsigned __int16 *)a3 + 2);
  if (v5 > v6) {
    unsigned int v6 = *((unsigned __int16 *)a2 + 2);
  }
  unsigned int v7 = *((unsigned __int16 *)a2 + 3);
  unsigned int v8 = *((unsigned __int16 *)a3 + 3);
  if (v7 < v8) {
    unsigned int v8 = *((unsigned __int16 *)a2 + 3);
  }
  int v9 = v6 - v8;
  if (v9 >= 0) {
    int v10 = v9;
  }
  else {
    int v10 = -v9;
  }
  int v11 = ~v10;
  unsigned int v12 = v7 - v5;
  uint64_t v13 = *(void *)(result + 256);
  uint64_t v14 = *a2;
  uint64_t v15 = v13 + 8 * v14;
  int v16 = *(int *)v15 >> 8;
  int v17 = *(_DWORD *)(v13 + 8 * *a3);
  int v18 = v17 >> 8;
  if (v16 == -1)
  {
    int v21 = v12 + 1;
    *(_DWORD *)uint64_t v15 = v17 & 0xFFFFFF00 | *(_DWORD *)v15;
    uint64_t v22 = *(void *)(result + 280) + 100 * v18;
    int v23 = *(_DWORD *)(v22 + 12);
    __int16 v24 = v14 - v23;
    if (v23 == -1) {
      __int16 v24 = 0;
    }
    *(_WORD *)(v15 + 4) = v24;
    *(_DWORD *)(v22 + 12) = *a2;
    unsigned int v25 = *((unsigned __int16 *)a2 + 4);
    unsigned int v26 = *(unsigned __int16 *)(v22 + 84);
    if (v25 < v26) {
      LOWORD(v26) = *((_WORD *)a2 + 4);
    }
    *(_WORD *)(v22 + 84) = v26;
    if (v25 <= *(unsigned __int16 *)(v22 + 86)) {
      LOWORD(v25) = *(_WORD *)(v22 + 86);
    }
    *(_WORD *)(v22 + 86) = v25;
    unsigned int v27 = *(unsigned __int16 *)(v22 + 80);
    if (v27 >= *((unsigned __int16 *)a2 + 2)) {
      LOWORD(v27) = *((_WORD *)a2 + 2);
    }
    *(_WORD *)(v22 + 80) = v27;
    unsigned int v28 = *(unsigned __int16 *)(v22 + 82);
    if (v28 <= *((unsigned __int16 *)a2 + 3)) {
      LOWORD(v28) = *((_WORD *)a2 + 3);
    }
    *(_WORD *)(v22 + 82) = v28;
    int v29 = *(_DWORD *)(v22 + 76);
    int v30 = *(_DWORD *)(v22 + 72) + v21;
    ++*(_DWORD *)(v22 + 20);
    *(_DWORD *)(v22 + 72) = v30;
    *(_DWORD *)(v22 + 76) = v29 + 2 * (v12 + v11) + 4;
    if (v21 >= *(unsigned __int16 *)(v22 + 90)) {
      __int16 v31 = v12 + 1;
    }
    else {
      __int16 v31 = *(_WORD *)(v22 + 90);
    }
    *(_WORD *)(v22 + 90) = v31;
  }
  else
  {
    uint64_t v19 = *(void *)(result + 280);
    if (v16 == v18)
    {
      uint64_t v20 = v19 + 100 * v16;
      ++*(_WORD *)(v20 + 88);
      *(_DWORD *)(v20 + 76) += 2 * (v12 + v11) + 4;
      int v18 = v16;
    }
    else
    {
      unsigned int v32 = (int32x2_t *)(v19 + 100 * v16);
      uint64_t v33 = (int32x2_t *)(v19 + 100 * v18);
      unsigned int v34 = v32[10].u16[2];
      unsigned int v35 = v33[10].u16[2];
      if (v34 > v35 || v34 == v35 && v32[10].u16[0] > v33[10].u16[0])
      {
        int v36 = *(int *)v15 >> 8;
        int v37 = v33;
      }
      else
      {
        int v36 = v17 >> 8;
        int v37 = v32;
        unsigned int v32 = v33;
        int v18 = *(int *)v15 >> 8;
      }
      if (v37[11].i8[4] == 2 || v32[11].i8[4] == 2) {
        v37[11].i8[4] = 2;
      }
      unsigned int v38 = v37[10].u16[2];
      if (v38 >= v32[10].u16[2]) {
        LOWORD(v38) = v32[10].i16[2];
      }
      v37[10].i16[2] = v38;
      unsigned int v39 = v37[10].u16[3];
      if (v39 <= v32[10].u16[3]) {
        LOWORD(v39) = v32[10].i16[3];
      }
      v37[10].i16[3] = v39;
      unsigned int v40 = v37[10].u16[0];
      if (v40 >= v32[10].u16[0]) {
        LOWORD(v40) = v32[10].i16[0];
      }
      v37[10].i16[0] = v40;
      unsigned int v41 = v37[10].u16[1];
      if (v41 <= v32[10].u16[1]) {
        LOWORD(v41) = v32[10].i16[1];
      }
      v37[10].i16[1] = v41;
      v37[11].i16[0] += v32[11].i16[0];
      __int32 v42 = v37[2].i32[0];
      v37[2].i32[1] += v32[2].i32[1];
      unsigned int v43 = v37[11].u16[1];
      if (v43 <= v32[11].u16[1]) {
        LOWORD(v43) = v32[11].i16[1];
      }
      v37[9] = vadd_s32(v37[9], v32[9]);
      v37[11].i16[1] = v43;
      uint64_t v45 = v32[1].u32[1];
      __int32 v44 = v32[2].i32[0];
      if (v42 > v44) {
        v37[2].i32[0] = v44;
      }
      uint64_t v46 = v37[1].u32[1];
      uint64_t result = FKConcompRelease(result, v36, 0);
      if (v45 != -1)
      {
        int v47 = v18 << 8;
        int v48 = -1;
        while (v46 != -1)
        {
          uint64_t v49 = *(void *)(v4 + 256);
          if ((int)v45 >= (int)v46)
          {
            *(_DWORD *)(v49 + 8 * (int)v45) = *(unsigned __int8 *)(v49 + 8 * (int)v45) | v47;
            if (v48 == -1)
            {
              v37[1].i32[1] = v45;
            }
            else
            {
              *(_WORD *)(v49 + 8 * v48 + 4) = v48 - v45;
              uint64_t v49 = *(void *)(v4 + 256);
            }
            uint64_t v52 = v49 + 8 * (int)v45;
            int v53 = *(unsigned __int16 *)(v52 + 4);
            *(_WORD *)(v52 + 4) = v45 - v46;
            if (!v53) {
              goto LABEL_66;
            }
            uint64_t v51 = (v45 - v53);
            uint64_t v50 = v46;
            LODWORD(v46) = v45;
          }
          else
          {
            if (*(_WORD *)(v49 + 8 * (int)v46 + 4)) {
              uint64_t v50 = v46 - *(unsigned __int16 *)(v49 + 8 * (int)v46 + 4);
            }
            else {
              uint64_t v50 = 0xFFFFFFFFLL;
            }
            uint64_t v51 = v45;
          }
          int v48 = v46;
          uint64_t v45 = v51;
          uint64_t v46 = v50;
          if (v51 == -1) {
            goto LABEL_66;
          }
        }
        *(_WORD *)(*(void *)(v4 + 256) + 8 * v48 + 4) = v48 - v45;
        uint64_t v54 = *(void *)(v4 + 256);
        do
        {
          uint64_t v55 = (unsigned __int8 *)(v54 + 8 * (int)v45);
          *(_DWORD *)uint64_t v55 = *v55 | v47;
          LODWORD(v55) = *((unsigned __int16 *)v55 + 2);
          LODWORD(v45) = v45 - v55;
          if (v55) {
            BOOL v56 = v45 == -1;
          }
          else {
            BOOL v56 = 1;
          }
        }
        while (!v56);
      }
LABEL_66:
      int v18 = *(int *)v15 >> 8;
      uint64_t v57 = *(void *)(v4 + 280) + 100 * v18;
      *(_DWORD *)(v57 + 76) = *(_DWORD *)(v57 + 76) - 2 * v10 - 2;
    }
  }
  if (*((unsigned char *)a2 + 10) == 2) {
    *(unsigned char *)(*(void *)(v4 + 280) + 100 * v18 + 92) = 2;
  }
  return result;
}

void FKSequenceAdjustSlantedLines(uint64_t a1, unsigned __int16 *a2, uint64_t a3, int a4, int *a5, int *a6, int *a7)
{
  int v7 = *(unsigned __int16 *)(a3 + 2 * (a4 != 0));
  int v8 = *a2;
  int v9 = *a5;
  int v10 = *a6;
  int v12 = a2[1] - v8;
  int v11 = (*(unsigned __int16 *)(a3 + 2 * (a4 == 0)) - v8) << 16;
  int v13 = (v11 / v12 * *a6 + (0x10000 - v11 / v12) * *a5) / 0x10000;
  int v14 = *(unsigned __int16 *)(a3 + 4);
  BOOL v15 = __OFSUB__(v13, v14);
  int v16 = v13 - v14;
  if ((v16 < 0) ^ v15 | (v16 == 0))
  {
    int v17 = *a7;
  }
  else
  {
    *a5 = v9 - v16;
    *a6 -= v16;
    int v17 = *a7 + v16;
    *a7 = v17;
    int v9 = *a5;
    int v10 = *a6;
  }
  int v18 = *(unsigned __int16 *)(a3 + 6)
      - (((v7 - v8) << 16) / v12 * (v10 + v17) + (0x10000 - ((v7 - v8) << 16) / v12) * (v17 + v9)) / 0x10000;
  if (v18 >= 1) {
    *a7 = v18 + v17;
  }
}

uint64_t FKSequenceRecalculateBox(uint64_t result, uint64_t a2)
{
  if (*(int *)(a2 + 20) >= 1)
  {
    uint64_t v3 = result;
    int v4 = 0;
    do
      uint64_t result = sequenceUpdateBoxWithConcomp(v3, a2, v4++);
    while (v4 < *(_DWORD *)(a2 + 20));
  }
  return result;
}

uint64_t sequenceUpdateBoxWithConcomp(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(result + 280);
  int v4 = *(_DWORD *)(*(void *)(a2 + 8) + 4 * a3);
  if (a3)
  {
    LODWORD(v5) = *(unsigned __int16 *)(a2 + 24);
    unsigned int v6 = (_WORD *)(v3 + 100 * v4);
    if (v5 >= (unsigned __int16)v6[40]) {
      LOWORD(v5) = v6[40];
    }
    *(_WORD *)(a2 + 24) = v5;
    LODWORD(v7) = *(unsigned __int16 *)(a2 + 26);
    if (v7 <= (unsigned __int16)v6[41]) {
      LOWORD(v7) = v6[41];
    }
    *(_WORD *)(a2 + 26) = v7;
    LODWORD(v8) = *(unsigned __int16 *)(a2 + 28);
    if (v8 >= (unsigned __int16)v6[42]) {
      LOWORD(v8) = v6[42];
    }
    *(_WORD *)(a2 + 28) = v8;
    LODWORD(v6) = (unsigned __int16)v6[43];
    if (*(unsigned __int16 *)(a2 + 30) > v6) {
      LOWORD(v6) = *(_WORD *)(a2 + 30);
    }
    *(_WORD *)(a2 + 30) = (_WORD)v6;
  }
  else
  {
    uint64_t v9 = v3 + 100 * v4;
    *(unsigned char *)(a2 + 92) = *(unsigned char *)(v9 + 92);
    unint64_t v5 = *(void *)(v9 + 80);
    *(void *)(a2 + 24) = v5;
    unint64_t v7 = v5 >> 16;
    *(_DWORD *)(a2 + 56) = 0;
    *(_DWORD *)(a2 + 44) = 0;
    *(_DWORD *)(a2 + 48) = 0;
    unint64_t v8 = HIDWORD(v5);
    unsigned int v6 = (_WORD *)HIWORD(v5);
  }
  uint64_t v10 = 0;
  char v11 = 1;
  do
  {
    char v12 = v11;
    int v13 = *(_DWORD *)(v3 + 100 * v4 + 4 * v10 + 64);
    if (v13 == -1) {
      break;
    }
    char v11 = 0;
    int v14 = (_WORD *)(*(void *)(result + 280) + 100 * v13);
    if ((unsigned __int16)v5 >= (unsigned __int16)v14[40]) {
      LOWORD(v5) = v14[40];
    }
    if ((unsigned __int16)v7 <= (unsigned __int16)v14[41]) {
      LOWORD(v7) = v14[41];
    }
    if ((unsigned __int16)v8 >= (unsigned __int16)v14[42]) {
      LOWORD(v8) = v14[42];
    }
    *(_WORD *)(a2 + 24) = v5;
    *(_WORD *)(a2 + 26) = v7;
    *(_WORD *)(a2 + 28) = v8;
    unsigned int v15 = (unsigned __int16)v14[43];
    if ((unsigned __int16)v6 <= v15) {
      LOWORD(v6) = v15;
    }
    *(_WORD *)(a2 + 30) = (_WORD)v6;
    uint64_t v10 = 1;
  }
  while ((v12 & 1) != 0);
  if ((*(unsigned char *)(v3 + 100 * v4 + 94) & 8) == 0)
  {
    int v16 = *(_DWORD *)(a2 + 44) + 1;
    int v17 = (unsigned __int16 *)(v3 + 100 * v4);
    int v18 = *(_DWORD *)(a2 + 48) - v17[42] + v17[43] + 1;
    *(_DWORD *)(a2 + 44) = v16;
    *(_DWORD *)(a2 + 48) = v18;
    LODWORD(v17) = *(_DWORD *)(a2 + 56) - v17[40] + v17[41] + 1;
    *(_DWORD *)(a2 + 52) = v18 / v16;
    *(_DWORD *)(a2 + 56) = v17;
    *(_DWORD *)(a2 + 60) = (int)v17 / v16;
  }
  return result;
}

uint64_t FKSequenceRemoveConcomp(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(int *)(v5 + 4 * a3);
  uint64_t v7 = *(void *)(a1 + 280);
  LODWORD(v8) = *(_DWORD *)(a2 + 20) - 1;
  *(_DWORD *)(a2 + 20) = v8;
  if ((int)v8 > a3)
  {
    uint64_t v9 = a3;
    do
    {
      *(_DWORD *)(v5 + 4 * v9) = *(_DWORD *)(v5 + 4 * v9 + 4);
      uint64_t v8 = *(int *)(a2 + 20);
      ++v9;
    }
    while (v9 < v8);
  }
  uint64_t v10 = v7 + 100 * (int)v6;
  *(_DWORD *)uint64_t v10 = -1;
  *(unsigned char *)(v10 + 94) = 0;
  if ((int)v8 >= 1)
  {
    int v11 = 0;
    do
      sequenceUpdateBoxWithConcomp(a1, a2, v11++);
    while (v11 < *(_DWORD *)(a2 + 20));
  }
  *(unsigned char *)(a2 + 93) = 0;
  *(_DWORD *)(a2 + 95) = 0;
  return v6;
}

uint64_t FKSequenceScoreAsPercent(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v4 = *(void *)(a1 + 280);
  uint64_t v5 = (unsigned __int16 *)(v4 + 100 * a2);
  if (v5[44]) {
    return 0;
  }
  unsigned int v6 = v5[43];
  unsigned int v7 = v5[42];
  int v8 = v6 - v7 + 1;
  if (*(_DWORD *)(v4 + 100 * a2 + 20) - v8 > v8 / 10) {
    return 0;
  }
  unsigned int v9 = v5[41];
  unsigned int v10 = v5[40];
  int v11 = v9 - v10;
  if (100 * *(unsigned __int16 *)(v4 + 100 * a2 + 90) / (int)(v9 - v10 + 1) > 50
    || *(unsigned __int16 *)(v4 + 100 * a3 + 88) > 1u)
  {
    return 0;
  }
  char v12 = (unsigned __int16 *)(v4 + 100 * a3);
  int v13 = v12[43];
  int v14 = v12[42];
  int v15 = 4 * (v13 - v14) + 4;
  int v16 = 3 * v8;
  BOOL v17 = v15 > (int)(v6 - v7) && v15 <= v16;
  if (!v17) {
    return 0;
  }
  unsigned int v18 = v12[41];
  unsigned int v19 = v12[40];
  int v20 = v18 - v19 + 1;
  if (v11 >= 4 * v20 || (int)(v18 - v19) > v11) {
    return 0;
  }
  unsigned int v22 = v9 + v10 + 1;
  unsigned int v23 = (v6 + v7 + 1) >> 1;
  unsigned int v24 = (v18 + v19 + 1) >> 1;
  unsigned int v25 = (v13 + v14 + 1) >> 1;
  BOOL v26 = v24 < v22 >> 1 && v25 < v23 || v24 > v22 >> 1 && v25 > v23;
  if (a4)
  {
    uint64_t v28 = 0;
    if (v24 < v10 || v24 > v9 || v25 < v7) {
      return v28;
    }
    BOOL v29 = v25 <= v6;
  }
  else
  {
    if (v9 >= v18) {
      unsigned int v30 = v18;
    }
    else {
      unsigned int v30 = v5[41];
    }
    if (v10 <= v19) {
      unsigned int v31 = v19;
    }
    else {
      unsigned int v31 = v5[40];
    }
    int v32 = v30 - v31;
    BOOL v17 = v32 <= 0;
    int v33 = 5 * v32;
    BOOL v29 = !v17 && v33 > v20;
  }
  if (!v26 || !v29) {
    return 0;
  }
  return 10
       * scoreForInsideSequence(*(void *)(a1 + 312) + 104 * *(int *)v5, (unsigned __int16 *)(v4 + 100 * a3))+ 3;
}

uint64_t scoreForInsideSequence(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *(unsigned __int16 *)(a1 + 26) + *(_DWORD *)(a1 + 60) / 2;
  unsigned int v3 = *(unsigned __int16 *)(a1 + 24);
  int v4 = a2[40];
  int v5 = a2[41];
  BOOL v6 = v3 > v4 || v2 < v5;
  if (!v6
    && *(unsigned __int16 *)(a1 + 28) <= a2[42]
    && a2[43] <= *(unsigned __int16 *)(a1 + 30))
  {
    return 3;
  }
  unsigned int v7 = (v4 + v5 + 1) >> 1;
  unsigned int v8 = a2[43];
  unsigned int v9 = a2[42];
  if (v7 >= v3 && (int)v7 <= v2)
  {
    unsigned int v11 = (v8 + v9 + 1) >> 1;
    if (v11 >= *(unsigned __int16 *)(a1 + 28) && v11 <= *(unsigned __int16 *)(a1 + 30)) {
      return 2;
    }
  }
  return v3 <= v5 && v2 >= v4 && *(unsigned __int16 *)(a1 + 28) <= v8 && v9 <= *(unsigned __int16 *)(a1 + 30);
}

void FKSequenceSortAndProcess(void *a1, uint64_t a2, int a3)
{
  if (!*(unsigned char *)(a2 + 93))
  {
    *(unsigned char *)(a2 + 93) = 0;
    *(_DWORD *)(a2 + 95) = 0;
    qsort_r(*(void **)(a2 + 8), *(int *)(a2 + 20), 4uLL, a1, (int (__cdecl *)(void *, const void *, const void *))compareCCX);
    int v6 = *(_DWORD *)(a2 + 20);
    if (v6 < 1)
    {
      int v8 = 0;
      int v9 = 0;
    }
    else
    {
      uint64_t v7 = 0;
      int v8 = 0;
      int v9 = 0;
      uint64_t v10 = *((void *)a1 + 35);
      unsigned int v11 = *(int **)(a2 + 8);
      uint64_t v12 = *(unsigned int *)(a2 + 20);
      do
      {
        int v14 = *v11++;
        int v13 = v14;
        if (v7)
        {
          int v15 = ~*(unsigned __int16 *)(v7 + 82) + *(unsigned __int16 *)(v10 + 100 * v13 + 80);
          v9 += v15;
          v8 -= v15 & (v15 >> 31);
        }
        uint64_t v7 = v10 + 100 * v13;
        --v12;
      }
      while (v12);
      if (v6 >= 2) {
        v9 /= v6 - 1;
      }
    }
    *(_DWORD *)(a2 + 64) = v9;
    int v16 = 400 * v8 / (*(_DWORD *)(a2 + 60) * v6);
    if (v16 >= 100) {
      LOBYTE(v16) = 100;
    }
    *(unsigned char *)(a2 + 95) = v16;
    sequenceSetSlope((uint64_t)a1, a2);
    if (a3) {
      sequenceMarkup();
    }
    *(unsigned char *)(a2 + 93) = 1;
  }
}

void sequenceSetSlope(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v44 = a1;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a2 + 44);
  uint64_t v4 = MEMORY[0x1F4188790](a1);
  int v6 = (char *)&v42 - ((v5 + 15) & 0x7FFFFFFF0);
  uint64_t v7 = MEMORY[0x1F4188790](v4);
  int v9 = (int *)((char *)&v42 - v8);
  MEMORY[0x1F4188790](v7);
  unsigned int v11 = (char *)&v42 - v10;
  if (v3 < 4) {
    goto LABEL_34;
  }
  uint64_t v12 = *(unsigned int *)(v2 + 20);
  if ((int)v12 >= 1)
  {
    int v13 = 0;
    uint64_t v14 = *(void *)(v44 + 280);
    int v15 = *(int **)(v2 + 8);
    do
    {
      int v17 = *v15++;
      int v16 = v17;
      if ((*(unsigned char *)(v14 + 100 * v17 + 94) & 8) == 0)
      {
        unsigned int v18 = (unsigned __int16 *)(v14 + 100 * v16);
        *(_DWORD *)&v6[4 * v13] = (v18[41] + v18[40] + 1) >> 1;
        *(_DWORD *)&v11[4 * v13] = v18[42];
        v9[v13++] = v18[43];
      }
      --v12;
    }
    while (v12);
  }
  int v19 = computeBeta((uint64_t)v11);
  uint64_t v20 = computeBeta((uint64_t)v9);
  if ((int)v20 * v19 < 1)
  {
LABEL_34:
    int v41 = *(unsigned __int16 *)(v2 + 28);
    *(_DWORD *)(v2 + 32) = v41;
    *(_DWORD *)(v2 + 36) = v41;
    *(_DWORD *)(v2 + 40) = *(unsigned __int16 *)(v2 + 30) - v41 + 1;
  }
  else
  {
    if ((int)v20 >= 0) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = -(int)v20;
    }
    if (v19 >= 0) {
      unsigned int v22 = v19;
    }
    else {
      unsigned int v22 = -v19;
    }
    if (v21 >= v22) {
      unsigned int v23 = v19;
    }
    else {
      unsigned int v23 = v20;
    }
    int v24 = *v9;
    unsigned int v25 = (unsigned __int16 *)(v2 + 24);
    *(_DWORD *)(v2 + 36) = *v9 + ((int)((*(unsigned __int16 *)(v2 + 26) - *(unsigned __int16 *)(v2 + 24)) * v23) >> 16);
    BOOL v26 = (int *)(v2 + 36);
    *(_DWORD *)(v2 + 32) = v24;
    unsigned int v27 = (int *)(v2 + 32);
    int v28 = 1;
    *(_DWORD *)(v2 + 40) = 1;
    BOOL v29 = (int *)(v2 + 40);
    if (*(int *)(v2 + 20) >= 1)
    {
      uint64_t v30 = 0;
      int v31 = v23 >> 31;
      uint64_t v43 = v2;
      do
      {
        uint64_t v32 = *(void *)(v44 + 280);
        int v33 = *(_DWORD *)(*(void *)(v2 + 8) + 4 * v30);
        FKSequenceAdjustSlantedLines(v20, v25, v32 + 100 * v33 + 80, v31, v27, v26, v29);
        uint64_t v34 = 0;
        char v35 = 1;
        do
        {
          char v36 = v35;
          int v37 = *(_DWORD *)(v32 + 100 * v33 + 4 * v34 + 64);
          if (v37 == -1) {
            break;
          }
          FKSequenceAdjustSlantedLines(v20, v25, *(void *)(v44 + 280) + 100 * v37 + 80, v31, v27, v26, v29);
          char v35 = 0;
          uint64_t v34 = 1;
        }
        while ((v36 & 1) != 0);
        ++v30;
        uint64_t v2 = v43;
      }
      while (v30 < *(int *)(v43 + 20));
      int v28 = *v29;
    }
    int v38 = *(_DWORD *)(v44 + 32);
    if (v28 > v38)
    {
      *BOOL v29 = v38;
      int v28 = v38;
    }
    int v39 = *v27;
    if (*v27 < 0)
    {
      int v39 = 0;
      *unsigned int v27 = 0;
    }
    int v40 = *v26;
    if (*v26 < 0)
    {
      int v40 = 0;
      *BOOL v26 = 0;
    }
    if (v28 + v39 > v38) {
      *unsigned int v27 = v38 - v28;
    }
    if (v40 + v28 > v38) {
      *BOOL v26 = v38 - v28;
    }
  }
}

uint64_t sequenceMarkup()
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = ((uint64_t (*)(void))MEMORY[0x1F4188790])();
  uint64_t v2 = MEMORY[0x1F4188790](v1);
  uint64_t v86 = v5;
  int v6 = (char *)&v74 - ((v5 + 15) & 0x1FFFFFFF0);
  uint64_t v7 = *(unsigned int *)(v3 + 20);
  uint64_t v77 = v7;
  uint64_t v75 = v2;
  if ((int)v7 < 1)
  {
    uint64_t result = 0;
    int v20 = 0;
  }
  else
  {
    int v8 = 0;
    uint64_t v9 = *(void *)(v2 + 280);
    uint64_t v10 = *(int **)(v3 + 8);
    uint64_t v11 = v7;
    do
    {
      int v13 = *v10++;
      int v12 = v13;
      if ((*(unsigned char *)(v9 + 100 * v13 + 94) & 8) == 0)
      {
        uint64_t v14 = v9 + 100 * v12;
        int v15 = &v4[2 * v8];
        *int v15 = *(_WORD *)(v14 + 84);
        unsigned int v16 = *(unsigned __int16 *)(v14 + 86);
        v15[1] = v16;
        int v17 = v15 + 1;
        int v18 = *(_DWORD *)(v14 + 64);
        if (v18 != -1)
        {
          unsigned int v19 = *(unsigned __int16 *)(v9 + 100 * v18 + 86);
          if (v16 > v19) {
            LOWORD(v19) = v16;
          }
          *int v17 = v19;
        }
        ++v8;
      }
      --v11;
    }
    while (v11);
    int v20 = v4[1];
    uint64_t result = *v4;
  }
  int v22 = 0;
  int v23 = 0;
  uint64_t v78 = v3;
  int v76 = *(_DWORD *)(v3 + 52);
  int v24 = 7 * v76 + 7;
  if (7 * v76 >= 0) {
    int v24 = 7 * v76;
  }
  int v25 = v24 >> 3;
  int v26 = 7 * v76 / 24 + 1;
  uint64_t v81 = &v90;
  uint64_t v80 = (char *)&v90 + 4;
  int32x4_t v27 = vdupq_n_s32(v20 + 1);
  uint64_t v79 = (char *)&v89 + 4;
  int32x4_t v28 = vdupq_n_s32(result);
  uint64_t v85 = (v86 - 1);
  uint64_t v84 = (uint64_t)&v4[2 * v85 + 1];
  unsigned int v29 = v26;
  unsigned int v82 = result;
  int v83 = v20;
  while (1)
  {
    v30.i32[0] = v25;
    v30.i32[1] = v26 + v25;
    v30.u64[1] = (unint64_t)vadd_s32(*(int32x2_t *)v30.i8, vdup_n_s32(v29));
    int32x4_t v31 = vsubq_s32(v27, vaddq_s32(v30, v28));
    int32x4_t v91 = vmulq_s32(v31, v31);
    if ((int)v86 >= 2)
    {
      int v32 = result;
      uint64_t v33 = 1;
      do
      {
        int v34 = 0;
        uint64_t v35 = 0;
        int v36 = v32;
        int v37 = v20;
        v6[v33] = 0;
        int v38 = v4;
        int v39 = &v4[2 * v33];
        int v32 = *v39;
        int v20 = v39[1];
        int v40 = v32 - v36;
        int v41 = v20 - v37;
        do
        {
          char v42 = 0;
          uint64_t v43 = 0;
          __int32 v44 = v91.i32[v35];
          do
          {
            if (v22)
            {
              if (v43) {
                int v45 = v26;
              }
              else {
                int v45 = 0;
              }
              int v46 = v43 & 2;
              __int32 v47 = v44
                  + (v20 + 1 - (v29 & ((int)(v43 << 30) >> 31)) - (v25 + v32 + v45))
                  * (v20 + 1 - (v29 & ((int)(v43 << 30) >> 31)) - (v25 + v32 + v45));
            }
            else
            {
              int v46 = v43 & 2;
              __int32 v47 = v44;
            }
            int v23 = v47
                + (v40 + ((v43 & 1) - (v35 & 1)) * v26) * (v40 + ((v43 & 1) - (v35 & 1)) * v26)
                + (v41 + ((int)((v35 & 2) - v46) >> 1) * v29) * (v41 + ((int)((v35 & 2) - v46) >> 1) * v29);
            if (!v35 || v23 < v92.i32[v43])
            {
              v92.i32[v43] = v23;
              int v48 = v34 & ~(3 << v42);
              int v34 = v48 | (v35 << v42);
              v6[v33] = v48 | (v35 << v42);
            }
            ++v43;
            v42 += 2;
          }
          while (v43 != 4);
          ++v35;
        }
        while (v35 != 4);
        int32x4_t v91 = v92;
        ++v33;
        uint64_t v4 = v38;
      }
      while (v33 != v86);
      int v0 = v92.i32[0];
      uint64_t result = v82;
      int v20 = v83;
    }
    uint64_t v49 = 0;
    int v50 = 0;
    do
    {
      int v51 = v0;
      if (!v49 || (int v51 = v92.i32[v49], v51 < v23))
      {
        int v50 = v49;
        int v23 = v51;
      }
      ++v49;
    }
    while (v49 != 4);
    uint64_t v89 = 0;
    uint64_t v90 = 0;
    uint64_t v87 = 0;
    uint64_t v88 = 0;
    if ((int)v86 >= 1)
    {
      uint64_t v52 = (unsigned __int16 *)v84;
      uint64_t v53 = v85;
      do
      {
        unsigned int v54 = v6[v53];
        v6[v53] = v50;
        *((_DWORD *)&v89 + v50) = *((_DWORD *)&v89 + v50) - *(v52 - 1) + *v52 + 1;
        ++*((_DWORD *)&v87 + v50);
        int v50 = (v54 >> (2 * v50)) & 3;
        v52 -= 2;
      }
      while (v53-- > 0);
    }
    if (v22 == 1) {
      break;
    }
    BOOL v56 = (int)v86 < 6;
    if (v87 != 1) {
      BOOL v56 = 0;
    }
    if ((int)v87 > 1 || v56)
    {
      int v25 = (int)v89 / (int)v87;
      int v58 = (int)v89 / (int)v87 / 3 + 1;
      int v59 = HIDWORD(v87);
      int v60 = v79;
      if (SHIDWORD(v87) > 1 || (int v59 = HIDWORD(v88), v60 = v80, v61 = v25 / 3 + 1, SHIDWORD(v88) >= 2)) {
        int v61 = *v60 / v59 - v25;
      }
      if (v61 <= v25 / 6 + 1) {
        int v26 = v25 / 6 + 1;
      }
      else {
        int v26 = v61;
      }
      int v62 = v88;
      uint64_t v63 = v81;
      if ((int)v88 > 1 || (int v62 = HIDWORD(v88), v63 = (uint64_t *)v80, SHIDWORD(v88) >= 2)) {
        int v58 = *(_DWORD *)v63 / v62 - v25;
      }
      if (v58 <= v25 / 7 + 1) {
        unsigned int v29 = v25 / 7 + 1;
      }
      else {
        unsigned int v29 = v58;
      }
    }
    else
    {
      if ((int)v88 <= 1) {
        break;
      }
      int v25 = (int)v90 / (int)v88;
      if (SHIDWORD(v88) < 1) {
        int v57 = v25 / 3 + 1;
      }
      else {
        int v57 = SHIDWORD(v90) / SHIDWORD(v88) - v25;
      }
      if (v57 <= v25 / 8) {
        int v26 = v25 / 8;
      }
      else {
        int v26 = v57;
      }
      unsigned int v29 = v26;
    }
    ++v22;
  }
  float v64 = (float)((float)((float)v23 / (float)(v86 + 2 * v85)) / (float)(v76 * v76)) * 100.0;
  uint64_t v66 = v77;
  uint64_t v65 = v78;
  if ((int)v77 >= 1)
  {
    int v67 = 0;
    uint64_t v68 = *(void *)(v75 + 280);
    int v69 = *(int **)(v78 + 8);
    do
    {
      int v71 = *v69++;
      int v70 = v71;
      if ((*(unsigned char *)(v68 + 100 * v71 + 94) & 8) == 0)
      {
        char v72 = v6[v67++];
        *(unsigned char *)(v68 + 100 * v70 + 93) = v72;
      }
      --v66;
    }
    while (v66);
  }
  if (v64 > 1.0)
  {
    int v73 = (int)((double)(int)((v64 + -1.0) * 100.0) * 0.25);
    if (v73 >= 100) {
      LOBYTE(v73) = 100;
    }
    *(unsigned char *)(v65 + 97) = v73;
  }
  return result;
}

uint64_t FKSequencesReplaceConcomp(void *a1, uint64_t a2, int a3, int *a4, int a5)
{
  uint64_t v9 = a1[39];
  FKSequenceRemoveConcomp((uint64_t)a1, a2, a3);
  if (a5 >= 1)
  {
    int v10 = -991146299 * ((unint64_t)(a2 - v9) >> 3);
    uint64_t v11 = a5;
    int v12 = a4;
    do
    {
      int v13 = *v12++;
      sequenceAddConcomp((uint64_t)a1, v10, v13, 1);
      --v11;
    }
    while (v11);
  }
  FKSequenceSortAndProcess(a1, a2, 0);
  uint64_t v14 = *(unsigned int *)(a2 + 20);
  if ((int)v14 < 1) {
    return 0;
  }
  uint64_t result = 0;
  while (a5 < 1)
  {
LABEL_10:
    if (++result == v14) {
      return 0;
    }
  }
  uint64_t v16 = a5;
  int v17 = a4;
  while (1)
  {
    int v18 = *v17++;
    if (*(_DWORD *)(*(void *)(a2 + 8) + 4 * result) == v18) {
      return result;
    }
    if (!--v16) {
      goto LABEL_10;
    }
  }
}

uint64_t sequenceAddConcomp(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 312);
  uint64_t v10 = *(void *)(a1 + 280);
  uint64_t v12 = v8 + 104 * a2;
  int v14 = *(_DWORD *)(v12 + 20);
  int v13 = (int *)(v12 + 20);
  int v15 = v13 - 1;
  uint64_t v16 = *(v13 - 1);
  if (v14 >= (int)v16)
  {
    int v18 = (void **)(v8 + 104 * a2 + 8);
    if (v16)
    {
      *int v15 = 2 * v16;
      int v17 = malloc_type_realloc(*v18, 8 * v16, 0x100004052888210uLL);
    }
    else
    {
      *int v15 = 32;
      int v17 = malloc_type_malloc(0x80uLL, 0x100004052888210uLL);
    }
    *int v18 = v17;
  }
  else
  {
    int v17 = *(void **)(v8 + 104 * a2 + 8);
  }
  uint64_t v19 = *v13;
  *int v13 = v19 + 1;
  *((_DWORD *)v17 + v19) = a3;
  if (a4) {
    *(unsigned char *)(v10 + 100 * a3 + 94) = a4;
  }
  *(_DWORD *)(v10 + 100 * a3) = a2;
  uint64_t result = sequenceUpdateBoxWithConcomp(a1, v8 + 104 * a2, *v13 - 1);
  *(unsigned char *)(v8 + 104 * a2 + 93) = 0;
  return result;
}

uint64_t FKSequencesFind(int *a1)
{
  *(void *)v349 = 0;
  a1[81] = -1;
  *((void *)a1 + 41) = 0xFFFFFFFFLL;
  uint64_t v2 = a1[80];
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = (int *)*((void *)a1 + 39);
    do
    {
      uint64_t v5 = v3 + 1;
      if (v2 - 1 == v3) {
        int v6 = -1;
      }
      else {
        int v6 = v3 + 1;
      }
      *uint64_t v4 = v6;
      v4 += 26;
      uint64_t v3 = v5;
    }
    while (v2 != v5);
  }
  for (int i = a1[74]; i != -1; int i = *(_DWORD *)(v8 + 100 * v9 + 4))
  {
    uint64_t v8 = *((void *)a1 + 35);
    int v9 = i;
    uint64_t v10 = (int *)(v8 + 100 * i);
    if (concompCanBeGlyph((uint64_t)v10))
    {
      *(void *)v349 = -1;
      uint64_t v11 = v8 + 100 * v9;
      int v12 = *(unsigned __int16 *)(v11 + 84);
      int v13 = *(unsigned __int16 *)(v11 + 86) - v12;
      int NeighborAtY = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 230 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, NeighborAtY, &v349[1], v349);
      int v15 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 179 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, v15, &v349[1], v349);
      if (v13 >= 0) {
        int v16 = v13;
      }
      else {
        int v16 = v13 + 1;
      }
      int v17 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + (v16 >> 1));
      insertNeighbor((uint64_t)a1, v10, v17, &v349[1], v349);
      int v18 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 76 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, v18, &v349[1], v349);
      int v19 = findNeighborAtY((uint64_t)a1, (uint64_t)v10, v12 + 25 * v13 / 256);
      insertNeighbor((uint64_t)a1, v10, v19, &v349[1], v349);
      if (v349[1] != -1) {
        sequenceLinkConcomps(a1, v9, v349[1]);
      }
      if (v349[0] != -1) {
        sequenceLinkConcomps(a1, v9, v349[0]);
      }
    }
  }
  int v20 = a1[81];
  if (v20 != -1)
  {
    uint64_t v21 = *((void *)a1 + 39);
    do
    {
      uint64_t v22 = 104 * v20;
      FKSequenceSortAndProcess(a1, v21 + v22, 1);
      uint64_t v21 = *((void *)a1 + 39);
      int v20 = *(_DWORD *)(v21 + v22);
    }
    while (v20 != -1);
  }
  mergeNeighboringSequences(a1);
  int v24 = a1[81];
  if (v24 == -1) {
    goto LABEL_160;
  }
  do
  {
    uint64_t v25 = *((void *)a1 + 39);
    int v26 = v24;
    int32x4_t v27 = (int *)(v25 + 104 * v24);
    int v28 = v27[13];
    if (v28 < *a1 || (int v29 = *(_DWORD *)(v25 + 104 * v24 + 60), v29 < 5))
    {
LABEL_23:
      int v24 = sequenceRemove((uint64_t)a1, v26);
      continue;
    }
    uint64_t v30 = *(unsigned int *)(v25 + 104 * v24 + 20);
    if (v30 == 2)
    {
      uint64_t v31 = *((void *)a1 + 35);
      int v32 = *(int **)(v25 + 104 * v24 + 8);
      int v34 = *v32;
      int v33 = v32[1];
      uint64_t v35 = (unsigned __int16 *)(v31 + 100 * v34);
      int v36 = (unsigned __int16 *)(v31 + 100 * v33);
      int v37 = v35[43];
      int v38 = v35[42];
      int v39 = v37 - v38 + 1;
      int v40 = v36[43];
      int v41 = v36[42];
      int v42 = v40 - v41 + 1;
      int v43 = v42 + v39;
      if ((100 * (v42 - v39) / (v42 + v39) - 15) < 0xFFFFFFE3) {
        goto LABEL_23;
      }
      int v44 = v38 + v37 - (v40 + v41);
      if (v38 + v37 < v40 + v41) {
        v44 += 3;
      }
      if ((100 * (v44 >> 2) / v43 - 15) < 0xFFFFFFE3) {
        goto LABEL_23;
      }
      int v45 = v42 >= 0 ? v40 - v41 + 1 : v40 - v41 + 2;
      int v46 = v41 + (v45 >> 1);
      if (v46 <= v38) {
        goto LABEL_23;
      }
      int v47 = v39 >= 0 ? v37 - v38 + 1 : v37 - v38 + 2;
      int v48 = v38 + (v47 >> 1);
      BOOL v49 = v48 >= v40 || v48 <= v41;
      if (v49 || v46 >= v37) {
        goto LABEL_23;
      }
      int v51 = v35[41];
      int v52 = v36[40];
      int v53 = (v51 - v35[40] + 1) * v39;
      int v54 = (v36[41] - v52 + 1) * v42;
      unsigned int v55 = 100 * (v52 - v51) / v43 - 20;
      BOOL v56 = v53 <= 4 * v54 && v54 <= 4 * v53;
      BOOL v57 = v56 && v55 >= 0xFFFFFFE7;
      if (!v57) {
        goto LABEL_23;
      }
      if (*(unsigned __int16 *)(v31 + 100 * v34 + 88) > 2u) {
        goto LABEL_23;
      }
      if (*(unsigned __int16 *)(v31 + 100 * v33 + 88) > 2u) {
        goto LABEL_23;
      }
      if (!looksOkey((uint64_t)v35)) {
        goto LABEL_23;
      }
      if (!looksOkey((uint64_t)v36)) {
        goto LABEL_23;
      }
      if (5 * v29 <= v28) {
        goto LABEL_23;
      }
      int v58 = 2 * v28;
      if (v29 >= 2 * v28) {
        goto LABEL_23;
      }
    }
    else
    {
      int v58 = 2 * v28;
      if (5 * v29 <= v28 || v29 >= v58) {
        goto LABEL_23;
      }
      if ((int)v30 < 1)
      {
        int v61 = 0;
        int v60 = 0;
        goto LABEL_74;
      }
    }
    int v60 = 0;
    int v61 = 0;
    uint64_t v62 = *((void *)a1 + 35);
    uint64_t v63 = *(int **)(v25 + 104 * v26 + 8);
    uint64_t v64 = v30;
    do
    {
      int v66 = *v63++;
      int v65 = v66;
      int v67 = (unsigned __int16 *)(v62 + 100 * v66);
      int v68 = v67[43] - v67[42];
      int v69 = v67[41] - v67[40] + 1;
      if (v68 < 2 * v69)
      {
        ++v61;
        if (10 * *(_DWORD *)(v62 + 100 * v65 + 72) > v69 * (9 * v68 + 9)) {
          ++v60;
        }
      }
      --v64;
    }
    while (v64);
LABEL_74:
    if (v60 > v61 / 2) {
      goto LABEL_23;
    }
    int v70 = *(_DWORD *)(v25 + 104 * v26 + 64);
    if (v70 >= v29)
    {
      if ((int)v30 < 3 || v70 > v58) {
        goto LABEL_23;
      }
      uint64_t v71 = 0;
      int v72 = 0;
      int v73 = 0;
      uint64_t v74 = 0;
      uint64_t v75 = *((void *)a1 + 35);
      do
      {
        int v76 = *(_DWORD *)(*(void *)(v25 + 104 * v26 + 8) + v71);
        if (v71)
        {
          uint64_t v77 = (unsigned __int16 *)(v75 + 100 * v76);
          int v78 = v74[42] - v77[42];
          int v79 = v74[43] - v77[43];
          v73 += v78 * v78 + v79 * v79;
          if (v77[40] - v74[41] > v29) {
            ++v72;
          }
        }
        uint64_t v74 = (unsigned __int16 *)(v75 + 100 * v76);
        v71 += 4;
      }
      while (4 * v30 != v71);
      if ((int)v30 <= 2 * v72 && 100 * v73 / (2 * (int)v30) >= v28 * v28) {
        goto LABEL_23;
      }
    }
    int v24 = *v27;
  }
  while (v24 != -1);
  int v80 = a1[81];
  if (v80 != -1)
  {
    uint64_t v81 = *((void *)a1 + 39);
    do
    {
      uint64_t v82 = v81 + 104 * v80;
      int v83 = (_DWORD *)(v82 + 20);
      uint64_t v84 = (int **)(v82 + 8);
      uint64_t v85 = (int *)(v82 + 52);
      int v341 = v80;
      v345 = (_DWORD *)(v82 + 60);
      do
      {
        uint64_t v86 = *v83;
        if ((int)v86 < 1) {
          break;
        }
        uint64_t v87 = 0;
        unsigned int v88 = 0;
        unsigned int v89 = 0;
        uint64_t v90 = *((void *)a1 + 35);
        int32x4_t v91 = *v84;
        do
        {
          uint64_t v92 = v90 + 100 * v91[v87];
          int v93 = *(unsigned __int16 *)(v92 + 82) - *(unsigned __int16 *)(v92 + 80) + 1;
          int v94 = 100
              * *(_DWORD *)(v92 + 72)
              / (v93 + v93 * (*(unsigned __int16 *)(v92 + 86) - *(unsigned __int16 *)(v92 + 84)));
          if (v94 <= 50) {
            int v95 = 50;
          }
          else {
            int v95 = v94;
          }
          if (v94 >= 80)
          {
            int v96 = 0;
          }
          else
          {
            ++v89;
            int v96 = v95;
          }
          v88 += v96;
          ++v87;
        }
        while (v86 != v87);
        if (v89 < 4 || (int)v89 <= (int)v86 >> 1) {
          break;
        }
        int v98 = v88 / v89 + 15;
        int v99 = *v91;
        int v100 = (unsigned __int16 *)(v90 + 100 * v91[1]);
        unsigned int v101 = v100[40];
        uint64_t v102 = v90 + 100 * *v91;
        int v103 = *(unsigned __int16 *)(v102 + 82);
        int v104 = v101 - v103;
        int v105 = *v85;
        int v106 = v100[43];
        int v107 = v100[42];
        int v108 = v106 + 1;
        int v109 = v106 + 1 - v107;
        if (*v85 > v109) {
          int v109 = *v85;
        }
        if (v104 > 2 * v109) {
          goto LABEL_116;
        }
        if (v104 > v105 && v104 > 2 * *(_DWORD *)(v82 + 64))
        {
          int v110 = v107
               + *(unsigned __int16 *)(v90 + 100 * v99 + 86)
               - (v106
                + *(unsigned __int16 *)(v90 + 100 * v99 + 84));
          if (v110 < 0) {
            int v110 = -v110;
          }
          if (3 * v110 > v105) {
            goto LABEL_116;
          }
        }
        int v111 = *(unsigned __int16 *)(v102 + 80);
        if (v101 <= (v103 + v111 + 1) >> 1) {
          goto LABEL_116;
        }
        uint64_t v112 = v90 + 100 * v99;
        int v113 = *(unsigned __int16 *)(v112 + 86);
        int v114 = *(unsigned __int16 *)(v112 + 84);
        int v115 = v113 - v114 + 1;
        int v116 = v105 >= 0 ? *v85 : v105 + 1;
        if (v115 < v116 >> 1) {
          goto LABEL_116;
        }
        if (100 * *(_DWORD *)(v90 + 100 * v99 + 72) / (v115 + v115 * (v103 - v111)) <= v98 || v103 - v111 < *v345 / 2) {
          goto LABEL_133;
        }
        if (v104 > v116 >> 1) {
          goto LABEL_116;
        }
        int v131 = ((v113 + v114 + 1) >> 1) - ((v108 + v107) >> 1);
        if (v131 < 0) {
          int v131 = -v131;
        }
        if (v131 > v105 / 4)
        {
LABEL_116:
          FKSequenceRemoveConcomp((uint64_t)a1, v82, 0);
          uint64_t v90 = *((void *)a1 + 35);
          int32x4_t v91 = *v84;
          LODWORD(v86) = *v83;
          int v117 = 1;
          int v105 = *v85;
        }
        else
        {
LABEL_133:
          int v117 = 0;
        }
        uint64_t v118 = (int)v86 - 1;
        int v119 = v91[v118];
        int v120 = v91[(int)v86 - 2];
        uint64_t v121 = v90 + 100 * v119;
        int v124 = *(unsigned __int16 *)(v121 + 80);
        uint64_t v123 = v121 + 80;
        int v122 = v124;
        uint64_t v125 = v90 + 100 * v120;
        int v126 = v124 - *(unsigned __int16 *)(v125 + 82);
        if (v126 <= 2 * v105)
        {
          int v127 = *(unsigned __int16 *)(v123 + 2);
          if (*(unsigned __int16 *)(v125 + 80) < (v122 + v127 + 1) >> 1)
          {
            int v128 = *(unsigned __int16 *)(v90 + 100 * v119 + 86) - *(unsigned __int16 *)(v90 + 100 * v119 + 84) + 1;
            int v130 = v105;
            int v129 = v105 + (v105 < 0);
            if (v128 >= v130 / 2
              && (100 * *(_DWORD *)(v90 + 100 * v119 + 72) / (v128 + v128 * (v127 - v122)) <= v98
               || v126 <= v129 >> 1
               || v127 - v122 < *v345 / 2))
            {
              continue;
            }
          }
        }
        FKSequenceRemoveConcomp((uint64_t)a1, v82, v118);
        int v117 = 1;
        FKSequenceSortAndProcess(a1, v82, 1);
      }
      while (v117);
      uint64_t v81 = *((void *)a1 + 39);
      int v80 = *(_DWORD *)(v81 + 104 * v341);
    }
    while (v80 != -1);
    int v132 = a1[81];
    if (v132 != -1)
    {
      do
      {
        int v133 = (int *)(*((void *)a1 + 39) + 104 * v132);
        v23.i32[0] = *(int *)((char *)v133 + 95);
        if (vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v23))) <= 0x63
          && histogramIsOK((uint64_t)a1, *((void *)a1 + 39) + 104 * v132))
        {
          int v132 = *v133;
        }
        else
        {
          int v132 = sequenceRemove((uint64_t)a1, v132);
        }
      }
      while (v132 != -1);
      int v134 = a1[81];
      if (v134 != -1)
      {
        int v135 = a1[81];
        while (1)
        {
          uint64_t v136 = *((void *)a1 + 39);
          if (v134 != -1)
          {
            uint64_t v137 = v136 + 104 * v135;
            int v138 = (unsigned __int16 *)(v137 + 24);
            int v139 = (unsigned __int16 *)(v137 + 28);
            int v140 = (unsigned __int16 *)(v137 + 30);
            float v141 = (int *)(v137 + 52);
            uint64_t v142 = (_DWORD *)(v137 + 60);
            uint64_t v143 = (unsigned __int16 *)(v137 + 26);
            do
            {
              uint64_t v144 = *((void *)a1 + 39);
              unint64_t v145 = (int *)(v144 + 104 * v134);
              if (v145[5] == 2
                && (uint64_t v146 = v144 + 104 * v134, *(unsigned __int16 *)(v146 + 30) >= *v139)
                && *(unsigned __int16 *)(v144 + 104 * v134 + 28) <= *v140
                && ((int v147 = *(_DWORD *)(v144 + 104 * v134 + 52), v148 = 5 * v147, v149 = 4 * v147, v148 <= 3 * *v141)
                  ? (BOOL v150 = v149 < *v141)
                  : (BOOL v150 = 1),
                    !v150
                 && *v138 - *v142 <= *(unsigned __int16 *)(v144 + 104 * v134 + 26)
                 && *v142 + *v143 >= *(unsigned __int16 *)(v146 + 24)))
              {
                int v134 = sequenceRemove((uint64_t)a1, v134);
              }
              else
              {
                int v134 = *v145;
              }
            }
            while (v134 != -1);
          }
          int v135 = *(_DWORD *)(v136 + 104 * v135);
          if (v135 == -1) {
            break;
          }
          int v134 = a1[81];
        }
      }
    }
  }
LABEL_160:
  int v151 = a1[74];
  if (v151 == -1) {
    goto LABEL_351;
  }
  while (2)
  {
    uint64_t v152 = *((void *)a1 + 35);
    uint64_t v153 = v151;
    if (*(unsigned char *)(v152 + 100 * v151 + 94)) {
      goto LABEL_162;
    }
    int v154 = a1[81];
    if (v154 == -1) {
      goto LABEL_162;
    }
    int v155 = 0;
    int v338 = 0;
    uint64_t v156 = v152 + 100 * v151;
    unsigned int v157 = *(unsigned __int16 *)(v156 + 82);
    unsigned int v158 = *(unsigned __int16 *)(v156 + 80);
    signed int v159 = (v158 + v157 + 1) >> 1;
    unsigned int v160 = *(unsigned __int16 *)(v156 + 86);
    unsigned int v161 = *(unsigned __int16 *)(v156 + 84);
    signed int v162 = (v160 + v161 + 1) >> 1;
    uint64_t v163 = *((void *)a1 + 39);
    int v164 = (unsigned __int16 *)v156;
    int v165 = *(unsigned __int8 *)(v156 + 92);
    v328 = (_WORD *)(v156 + 88);
    uint64_t v166 = (int *)(v156 + 72);
    unsigned int v325 = 3 * v160;
    int v329 = v160 - v161 + 1;
    int v330 = v160 - v161;
    float v167 = (float)(int)(2 * (v160 - v161 + v157 - v158) + 4);
    v324 = (int *)(v156 + 76);
    int v326 = 4 * v329;
    int v331 = v157 - v158;
    int v327 = v157 - v158 + 1;
    int v168 = -1;
    int v169 = a1[81];
    int v170 = -1;
    while (2)
    {
      uint64_t v171 = v163 + 104 * v169;
      if (v165 != *(unsigned __int8 *)(v171 + 92)) {
        goto LABEL_313;
      }
      int v172 = v169;
      v173 = (unsigned __int16 *)(v163 + 104 * v169);
      if (v161 > v173[15]) {
        goto LABEL_313;
      }
      int v174 = *(_DWORD *)(v163 + 104 * v172 + 60);
      if (v159 < v173[12] - v174) {
        goto LABEL_313;
      }
      if (v174 + v173[13] < (int)v158) {
        goto LABEL_313;
      }
      if (v162 < v173[14] - *(_DWORD *)(v163 + 104 * v172 + 52)) {
        goto LABEL_313;
      }
      uint64_t v175 = *(unsigned int *)(v163 + 104 * v172 + 20);
      if ((int)v175 < 1) {
        goto LABEL_313;
      }
      int v332 = v155;
      int v334 = v168;
      int v337 = v170;
      uint64_t v176 = 0x7FFFFFFFLL;
      uint64_t v177 = *(int **)(v163 + 104 * v172 + 8);
      int v346 = -1;
      int v342 = -1;
      uint64_t v178 = 0xFFFFFFFFLL;
      int v179 = 0x7FFFFFFF;
      while (2)
      {
        uint64_t v181 = *v177++;
        uint64_t v180 = v181;
        uint64_t v182 = v152 + 100 * (int)v181;
        LODWORD(v181) = *(unsigned __int16 *)(v182 + 80);
        uint64_t v183 = v182 + 80;
        int v184 = v181;
        int v185 = v181 - v157;
        if (v181 <= v157)
        {
          unsigned int v187 = *(unsigned __int16 *)(v183 + 2);
          int v188 = v184 - v158;
          if (v188 < 0) {
            int v188 = -v188;
          }
          int v189 = v187 - v157;
          if ((int)(v187 - v157) < 0) {
            int v189 = v157 - v187;
          }
          unsigned int v190 = v189 + v188;
          if (v158 > v187) {
            uint64_t v186 = (v158 | 0x10000) - v187;
          }
          else {
            uint64_t v186 = v190;
          }
        }
        else
        {
          uint64_t v186 = (v185 + 0x10000);
        }
        if ((int)v186 >= v179)
        {
          uint64_t v180 = v178;
        }
        else
        {
          if ((int)v186 < (int)v176)
          {
            int v346 = v178;
            int v342 = v180;
            int v179 = v176;
            goto LABEL_188;
          }
          int v346 = v180;
          uint64_t v180 = v178;
          int v179 = v186;
        }
        uint64_t v186 = v176;
LABEL_188:
        uint64_t v178 = v180;
        uint64_t v176 = v186;
        if (--v175) {
          continue;
        }
        break;
      }
      if (v342 == -1)
      {
        int v168 = v334;
        int v170 = v337;
        int v155 = v332;
        goto LABEL_313;
      }
      v323 = v166;
      v191 = (int *)(v152 + 100 * v342);
      int v192 = *((unsigned __int16 *)v191 + 41);
      int v193 = *((unsigned __int16 *)v191 + 40);
      int v194 = v192 - v193;
      v318 = v164;
      int v319 = *v191;
      unsigned int v310 = v192 + v193 + 1;
      int v195 = v159 - (v310 >> 1);
      if (v195 < 0) {
        int v195 = (v310 >> 1) - v159;
      }
      int v196 = v194 + 3;
      if (v194 >= -2) {
        int v196 = v194 + 2;
      }
      uint64_t v317 = v153;
      signed int v315 = v162;
      signed int v316 = v159;
      unsigned int v321 = v160;
      unsigned int v322 = v161;
      if (v195 > v196 >> 1)
      {
        int v311 = *(unsigned char *)(v152 + 100 * v342 + 94) & 8;
        goto LABEL_243;
      }
      unsigned int v197 = *((unsigned __int16 *)v191 + 43);
      int v198 = *((unsigned __int16 *)v191 + 42);
      int v199 = v197 - v198 + 1;
      int v200 = 12 * (v194 + 2) / 10;
      int v201 = v197 - v198 + 3;
      if ((int)(v197 - v198) >= -2) {
        int v201 = v197 - v198 + 2;
      }
      int v202 = v201 >> 1;
      if (v200 <= 3 * v199 / 5) {
        int v200 = 3 * v199 / 5;
      }
      if ((*(unsigned char *)(v152 + 100 * v342 + 94) & 8) != 0)
      {
        int v204 = *(_DWORD *)(v163 + 104 * v319 + 52);
        if (v200 <= v204 / 4) {
          int v200 = v204 / 4;
        }
        int v205 = 3 * v204 / 5;
        if (v202 <= v205) {
          int v202 = v205;
        }
      }
      else if (*v328 == 1)
      {
        int v202 = (int)(6 * (v197 - v198 + 2)) / 10;
      }
      char v203 = *(unsigned char *)(v152 + 100 * v342 + 94);
      if (v331 >= v200 || v330 >= v202 || v329 < v199 / 8)
      {
        int v311 = v203 & 8;
        goto LABEL_243;
      }
      if (v199 >= 0) {
        int v208 = v197 - v198 + 1;
      }
      else {
        int v208 = v197 - v198 + 2;
      }
      int v209 = v208 >> 1;
      if ((*(unsigned char *)(v152 + 100 * v342 + 94) & 8) != 0)
      {
        unint64_t v212 = 2863311532 * *(_DWORD *)(v163 + 104 * v319 + 52);
        int v213 = HIDWORD(v212) + (v212 >> 63);
        if (v209 <= v213) {
          int v209 = v213;
        }
        unsigned int v210 = v160;
        int v211 = v161;
      }
      else
      {
        unsigned int v210 = v160;
        int v211 = v161;
        if (*v323 >= *(_DWORD *)(v152 + 100 * v342 + 72))
        {
          int v311 = 0;
          goto LABEL_243;
        }
      }
      int v311 = v203 & 8;
      if (v325 >= v197 + 2 * v198)
      {
        BOOL v57 = v211 >= v197;
        int v214 = v211 - v197;
        if (v214 != 0 && v57 && v214 <= v209)
        {
          uint64_t v215 = v163 + 104 * v319;
          int v216 = *(_DWORD *)(v215 + 40);
          int v217 = v216 + *(_DWORD *)(v215 + 32);
          int v218 = *(_DWORD *)(v215 + 36) + v216;
          LODWORD(v215) = (int)((v158 - *(unsigned __int16 *)(v215 + 24)) << 16)
                        / (*(unsigned __int16 *)(v215 + 26) - *(unsigned __int16 *)(v215 + 24));
          if (v211 <= ((int)v215 * v218 + (0x10000 - (int)v215) * v217) / 0x10000) {
            goto LABEL_233;
          }
        }
        goto LABEL_243;
      }
      if ((int)(v198 - v210) > v209) {
        goto LABEL_243;
      }
LABEL_233:
      if (*v328 && *v323 < 32) {
        goto LABEL_243;
      }
      int v219 = *(_DWORD *)(v152 + 100 * v342 + 72);
      int v220 = 2 * v194 + 2;
      if (v220 > v199) {
        int v219 = v219 * v199 / v220;
      }
      if (15 * *v323 < v219
        || (int)(2 * (v157 - v158) + 2) < v330
        || (*v328 != 1 ? (float v221 = 1.5) : (float v221 = 2.0),
            (float)((float)*v324 / v167) > fmaxf((float)(v221 * (float)*v323) / (float)*v324, 1.0)))
      {
LABEL_243:
        int v222 = FKSequenceScoreAsPercent((uint64_t)a1, v342, v153, 1);
        int v223 = v342;
        unsigned int v161 = v322;
        int v168 = v334;
        int v170 = v337;
        int v224 = v332;
        int v225 = v338;
        int v226 = v346;
        v227 = (int *)(v152 + 100 * v342);
        int v228 = v311;
      }
      else
      {
        int v245 = 10 * scoreForInsideSequence(v163 + 104 * v319, v164) + 3;
        int v228 = v311;
        if (v311) {
          int v222 = 6;
        }
        else {
          int v222 = v245;
        }
        unsigned int v161 = v322;
        int v168 = v334;
        int v170 = v337;
        int v224 = v332;
        int v225 = v338;
        int v226 = v346;
        int v223 = v342;
        v227 = (int *)(v152 + 100 * v342);
      }
      if (v222 <= v225) {
        unsigned int v229 = v225;
      }
      else {
        unsigned int v229 = v222;
      }
      if (v222 <= v225) {
        int v230 = v224;
      }
      else {
        int v230 = 17;
      }
      if (v222 > v225) {
        int v168 = v223;
      }
      if (!v228)
      {
        int v347 = v230;
        uint64_t v153 = v317;
        signed int v162 = v315;
        signed int v159 = v316;
        unsigned int v160 = v321;
        uint64_t v166 = v323;
        int v164 = v318;
        int v232 = v319;
        goto LABEL_260;
      }
      if (v310 >> 1 <= v158 || v310 >> 1 >= v157)
      {
        int v347 = v230;
        if ((*(unsigned char *)(v152 + 100 * v226 + 94) & 8) == 0)
        {
          v227 = (int *)(v152 + 100 * v226);
          int v226 = v223;
        }
        int v232 = *v227;
        uint64_t v153 = v317;
        signed int v162 = v315;
        signed int v159 = v316;
        unsigned int v160 = v321;
        uint64_t v166 = v323;
        int v164 = v318;
LABEL_260:
        int v339 = *((unsigned __int16 *)v227 + 41);
        int v233 = *((unsigned __int16 *)v227 + 40);
        uint64_t v234 = v163 + 104 * v232;
        signed int v235 = *(_DWORD *)(v234 + 60);
        uint64_t v333 = v234;
        int v236 = *(_DWORD *)(v234 + 52);
        unsigned int v343 = *((unsigned __int16 *)v227 + 43);
        if (v343 < v161 || (unsigned int v237 = *((unsigned __int16 *)v227 + 42), v237 > v160))
        {
          if (v226 == -1) {
            goto LABEL_269;
          }
          unsigned int v237 = *((unsigned __int16 *)v227 + 42);
          if (v160 < v237)
          {
            if ((int)(v343 - v237) >= 3 * *(_DWORD *)(v163 + 104 * v232 + 40) / 4)
            {
LABEL_303:
              unsigned int v231 = 0;
              int v170 = v337;
              goto LABEL_304;
            }
            int v170 = v337;
            if ((int)(6 * (v237 - v160)) <= (int)(v343 - v237 + 1)) {
              goto LABEL_270;
            }
LABEL_269:
            unsigned int v231 = 0;
            goto LABEL_304;
          }
          if (v327 < 3 * v329 || (int)(6 * (v161 - v343)) > (int)(v343 - v237 + 1)) {
            goto LABEL_269;
          }
        }
LABEL_270:
        int v320 = v232;
        int v238 = v236 * v236;
        int v239 = 2 * v235;
        if (2 * v235 < v236) {
          int v238 = 4 * v235 * v235;
        }
        int v241 = v238;
        int v240 = v238 + (v238 < 0 ? 0x3F : 0);
        if (*v166 <= v241 / 64)
        {
          if (3 * *v166 <= v240 >> 6) {
            goto LABEL_303;
          }
          if (fabsf((float)(int)(v160 - v343) / (float)v236) > 0.08 || v326 >= 3 * v236) {
            goto LABEL_303;
          }
        }
        else if (v326 >= 3 * v236)
        {
          goto LABEL_303;
        }
        unsigned int v335 = *((unsigned __int16 *)v227 + 40);
        int v312 = 3 * v235;
        BOOL v243 = 8 * v329 <= v331 && v327 < 3 * v235;
        if (!v243 && v331 >= v239 || 7 * v327 > 4 * v235 && 7 * v329 > 5 * v236) {
          goto LABEL_303;
        }
        unsigned int v244 = (v339 + v233 + 1) >> 1;
        if (v244 <= v157)
        {
          if (v244 >= v158) {
            goto LABEL_303;
          }
          if (v312 >= 0) {
            int v246 = 3 * v235;
          }
          else {
            int v246 = v312 + 1;
          }
          int v247 = v246 >> 1;
          int v248 = v239 / 3;
          if (!a1[9]) {
            int v247 = v248;
          }
          if ((int)(v158 - v339) > v247 + 1) {
            goto LABEL_303;
          }
          unsigned int v313 = v237;
          int v170 = v337;
          int v230 = v347;
          if (((4 * (v158 + v157) + 4) & 0xFFFF8) < v233 - v339 + 8 * v339)
          {
            unsigned int v231 = 0;
            goto LABEL_305;
          }
LABEL_317:
          unsigned int v340 = v229;
          int v348 = v230;
          int v336 = v168;
          int v314 = *v166;
          if ((int)(100 * pixelCount((uint64_t)a1, v158, v157, v161, v160, v165)) > 105 * v314)
          {
            unsigned int v231 = 0;
            uint64_t v153 = v317;
            signed int v162 = v315;
            signed int v159 = v316;
            unsigned int v160 = v321;
            unsigned int v161 = v322;
            uint64_t v166 = v323;
            int v164 = v318;
LABEL_328:
            int v168 = v336;
            int v170 = v337;
            int v230 = v348;
            unsigned int v229 = v340;
            goto LABEL_305;
          }
          unsigned int v161 = v322;
          if (v322 <= (v343 + v313 + 1) >> 1) {
            int v250 = 1;
          }
          else {
            int v250 = 4;
          }
          if (*(unsigned __int16 *)(v163 + 104 * v320 + 24) >= v157)
          {
            int v164 = v318;
            if (!a1[9])
            {
              unsigned int v231 = 0;
              goto LABEL_327;
            }
          }
          else
          {
            ++v250;
            int v164 = v318;
          }
          int v344 = v250;
          int v251 = scoreForInsideSequence(v333, v164);
          int v164 = v318;
          unsigned int v161 = v322;
          unsigned int v231 = v344 + 10 * v251;
LABEL_327:
          uint64_t v153 = v317;
          signed int v162 = v315;
          signed int v159 = v316;
          unsigned int v160 = v321;
          uint64_t v166 = v323;
          goto LABEL_328;
        }
        unsigned int v231 = 0;
        int v170 = v337;
        if ((int)(v335 - v157) < v235)
        {
          unsigned int v313 = v237;
          int v230 = v347;
          if (v158 >= v335) {
            goto LABEL_305;
          }
          goto LABEL_317;
        }
LABEL_304:
        int v230 = v347;
        goto LABEL_305;
      }
      unsigned int v231 = 0;
      uint64_t v153 = v317;
      signed int v162 = v315;
      signed int v159 = v316;
      unsigned int v160 = v321;
      uint64_t v166 = v323;
      int v164 = v318;
LABEL_305:
      if (v231 <= v229) {
        int v249 = v229;
      }
      else {
        int v249 = v231;
      }
      int v338 = v249;
      if (v231 <= v229) {
        int v155 = v230;
      }
      else {
        int v155 = 9;
      }
      if (v231 > v229) {
        int v170 = v172;
      }
LABEL_313:
      int v169 = *(_DWORD *)v171;
      if (*(_DWORD *)v171 != -1) {
        continue;
      }
      break;
    }
    if (v338 <= 0)
    {
      do
      {
        uint64_t v253 = v163 + 104 * v154;
        if (v165 == *(unsigned __int8 *)(v253 + 92))
        {
          v254 = (unsigned __int16 *)(v163 + 104 * v154);
          if (v161 <= v254[15])
          {
            unsigned int v255 = v254[12];
            int v256 = *(_DWORD *)(v163 + 104 * v154 + 60);
            if (v159 >= (int)(v255 - v256))
            {
              unsigned int v257 = v254[13];
              if (v159 <= (int)(v256 + v257))
              {
                int v258 = *(_DWORD *)(v163 + 104 * v154 + 52);
                BOOL v259 = v162 >= v254[14] - v258 && v158 >= v255;
                if (v259 && v157 <= v257 && *v166 >= (int)((v258 * v258) >> 8))
                {
                  int v261 = ((256 - (int)((v159 - v255) << 8) / (int)(v257 - v255)) * *(_DWORD *)(v163 + 104 * v154 + 32)
                        + *(_DWORD *)(v163 + 104 * v154 + 36) * ((int)((v159 - v255) << 8) / (int)(v257 - v255))) >> 8;
                  if (v261 <= (int)v161 && *(_DWORD *)(v163 + 104 * v154 + 40) + v261 >= (int)v160)
                  {
                    uint64_t v262 = v163 + 104 * v154;
                    int v263 = *(_DWORD *)(v262 + 72) + *v166;
                    ++*(_DWORD *)(v262 + 68);
                    *(_DWORD *)(v262 + 72) = v263;
                  }
                }
              }
            }
          }
        }
        int v154 = *(_DWORD *)v253;
      }
      while (*(_DWORD *)v253 != -1);
    }
    else
    {
      int v252 = v153;
      if (v155 == 17) {
        addDiacritic((uint64_t)a1, v168, v153);
      }
      else {
        sequenceAddConcomp((uint64_t)a1, v170, v153, 9);
      }
      LODWORD(v153) = v252;
    }
LABEL_162:
    int v151 = *(_DWORD *)(v152 + 100 * (int)v153 + 4);
    if (v151 != -1) {
      continue;
    }
    break;
  }
LABEL_351:
  int v264 = a1[81];
  while (v264 != -1)
  {
    uint64_t v265 = *((void *)a1 + 39);
    int v266 = v264;
    uint64_t v267 = v265 + 104 * v264;
    FKSequenceSortAndProcess(a1, v267, 1);
    uint64_t v268 = *(unsigned int *)(v267 + 20);
    if ((int)v268 >= 1)
    {
      uint64_t v269 = 0;
      char v270 = 0;
      uint64_t v271 = *((void *)a1 + 35);
      while (1)
      {
        int v272 = *(_DWORD *)(*(void *)(v265 + 104 * v266 + 8) + 4 * v269);
        if ((*(unsigned char *)(v271 + 100 * v272 + 94) & 8) == 0) {
          break;
        }
        if (*(_DWORD *)(v271 + 100 * v272 + 64) != -1) {
          char v270 = 1;
        }
        if (v268 == ++v269)
        {
          LODWORD(v269) = *(_DWORD *)(v267 + 20);
          break;
        }
      }
      if (v270) {
        BOOL v273 = 1;
      }
      else {
        BOOL v273 = v269 > 2;
      }
      int v274 = v273;
      if (v269 && v274)
      {
        do
        {
          FKSequenceRemoveConcomp((uint64_t)a1, v267, 0);
          LODWORD(v269) = v269 - 1;
        }
        while (v269);
        LODWORD(v268) = *(_DWORD *)(v267 + 20);
      }
    }
    uint64_t v275 = v265 + 104 * v266;
    int v276 = 100 * *(_DWORD *)(v275 + 68) / (int)v268;
    if (v276 >= 100) {
      LOBYTE(v276) = 100;
    }
    *(unsigned char *)(v275 + 98) = v276;
    if (*(unsigned __int8 *)(v275 + 96)
       + *(unsigned __int8 *)(v275 + 95)
       + *(unsigned __int8 *)(v275 + 97)
       + v276 >= 0x64)
      int v264 = sequenceRemove((uint64_t)a1, v266);
    else {
      int v264 = *(_DWORD *)(*((void *)a1 + 39) + 104 * v266);
    }
  }
  mergeNeighboringSequences(a1);
  uint64_t result = a1[81];
  if (result != -1)
  {
    int v279 = 0;
    do
    {
      uint64_t v280 = *((void *)a1 + 39);
      int v281 = result;
      v282 = (unsigned int *)(v280 + 104 * (int)result);
      LODWORD(v277) = *(unsigned int *)((char *)v282 + 95);
      if (vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)&v277))) > 0x63) {
        goto LABEL_412;
      }
      int v283 = v282[11];
      if (v283 < 4 || v283 <= 5 && *(int *)(v280 + 104 * (int)result + 52) <= 32)
      {
        uint64_t v284 = *(unsigned int *)(v280 + 104 * (int)result + 20);
        if ((int)v284 < 1)
        {
          int v286 = 0;
        }
        else
        {
          uint64_t v285 = 0;
          int v286 = 0;
          uint64_t v287 = *((void *)a1 + 35);
          do
          {
            uint64_t v288 = 0;
            int v289 = *(_DWORD *)(*(void *)(v280 + 104 * (int)result + 8) + 4 * v285);
            v286 += *(_DWORD *)(v287 + 100 * v289 + 72);
            char v290 = 1;
            do
            {
              char v291 = v290;
              int v292 = *(_DWORD *)(v287 + 100 * v289 + 4 * v288 + 64);
              if (v292 != -1) {
                v286 += *(_DWORD *)(v287 + 100 * v292 + 72);
              }
              char v290 = 0;
              uint64_t v288 = 1;
            }
            while ((v291 & 1) != 0);
            ++v285;
          }
          while (v285 != v284);
        }
        uint64_t v293 = v280 + 104 * (int)result;
        if (100 * v286 < (int)(99
                              * pixelCount((uint64_t)a1, *(unsigned __int16 *)(v293 + 24), *(unsigned __int16 *)(v293 + 26), *(unsigned __int16 *)(v293 + 28), *(unsigned __int16 *)(v293 + 30), *(unsigned __int8 *)(v293 + 92))))goto LABEL_412;
      }
      if (!histogramIsOK((uint64_t)a1, (uint64_t)v282)) {
        goto LABEL_412;
      }
      if (!a1[4]) {
        goto LABEL_415;
      }
      uint64_t v294 = *(unsigned int *)(v280 + 104 * v281 + 20);
      if ((int)v294 < 1)
      {
        int v296 = 0;
        int v295 = 0;
      }
      else
      {
        int v295 = 0;
        int v296 = 0;
        uint64_t v297 = *((void *)a1 + 35);
        v298 = *(int **)(v280 + 104 * v281 + 8);
        do
        {
          int v300 = *v298++;
          int v299 = v300;
          if ((*(unsigned char *)(v297 + 100 * v300 + 94) & 8) == 0)
          {
            uint64_t v301 = v297 + 100 * v299;
            int v302 = *(unsigned __int16 *)(v301 + 82) - *(unsigned __int16 *)(v301 + 80) + 1;
            int v303 = *(unsigned __int16 *)(v301 + 86) - *(unsigned __int16 *)(v301 + 84) + 1;
            double v277 = (float)((float)*(int *)(v301 + 76) / (float)(2 * (v303 + v302)));
            if (v277 < 1.1)
            {
              float v304 = (float)*(int *)(v297 + 100 * v299 + 72) / (float)(v303 * v302);
              double v305 = v304;
              if (v304 <= 0.6)
              {
                LOWORD(v305) = *(_WORD *)(v301 + 90);
                int v306 = v304 < 0.5;
                if ((float)((float)LODWORD(v305) / (float)v302) >= 0.5) {
                  int v306 = 0;
                }
                v296 += v306;
              }
              else
              {
                ++v295;
              }
            }
          }
          --v294;
        }
        while (v294);
      }
      if (v283 > 2
        && ((double v277 = (double)v295, v307 = (double)v283 * 0.6, v307 >= (double)v295)
          ? (BOOL v308 = v307 < (double)v296)
          : (BOOL v308 = 1),
            v308))
      {
LABEL_412:
        uint64_t result = sequenceRemove((uint64_t)a1, v281);
      }
      else
      {
LABEL_415:
        if (v279 <= v283) {
          int v279 = v283;
        }
        uint64_t result = *v282;
      }
    }
    while (result != -1);
    if (v279 == 2)
    {
      uint64_t result = a1[81];
      while (result != -1)
      {
        uint64_t v309 = *((void *)a1 + 39);
        if ((100
            * (*(unsigned __int16 *)(v309 + 104 * (int)result + 30)
             - *(unsigned __int16 *)(v309 + 104 * (int)result + 28))
            + 100)
           / a1[8] >= 11
          && a1[9]
          && (100
            * (*(unsigned __int16 *)(v309 + 104 * (int)result + 26)
             - *(unsigned __int16 *)(v309 + 104 * (int)result + 24))
            + 100)
           / a1[7] > 10)
        {
          uint64_t result = *(unsigned int *)(v309 + 104 * (int)result);
        }
        else
        {
          uint64_t result = sequenceRemove((uint64_t)a1, result);
        }
      }
    }
  }
  return result;
}

uint64_t sequenceLinkFreeList(uint64_t result, int a2)
{
  uint64_t v2 = *(int *)(result + 332);
  uint64_t v3 = *(int *)(result + 320);
  if ((int)v2 < (int)v3)
  {
    uint64_t v4 = ~v2 + v3;
    int v5 = v2 + 1;
    uint64_t v6 = v3 - v2;
    uint64_t v7 = *(void *)(result + 312) + 104 * (int)v2;
    do
    {
      if (v4) {
        int v8 = v5;
      }
      else {
        int v8 = -1;
      }
      *(_DWORD *)uint64_t v7 = v8;
      if (a2)
      {
        *(void *)(v7 + 8) = 0;
        *(_DWORD *)(v7 + 16) = 0;
        *(void *)(v7 + 80) = 0;
        *(_DWORD *)(v7 + 88) = 0;
      }
      --v4;
      ++v5;
      v7 += 104;
      --v6;
    }
    while (v6);
  }
  return result;
}

BOOL concompCanBeGlyph(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 94);
  if (v1 == 2 || v1 == 4) {
    return 0;
  }
  int v3 = *(unsigned __int16 *)(a1 + 82) - *(unsigned __int16 *)(a1 + 80);
  int v4 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84);
  int v5 = 6;
  if (v3 > v4) {
    int v5 = (6 * v3 + 6) / (v4 + 1);
  }
  if (v5 < *(unsigned __int16 *)(a1 + 88)) {
    return 0;
  }
  int v6 = *(_DWORD *)(a1 + 72);
  if (v6 < 17) {
    return 1;
  }
  if (v3 <= v4) {
    int v3 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84);
  }
  return (v3 + 1) * (v3 + 1) <= 32 * v6;
}

void *sequenceLinkConcomps(void *result, int a2, int a3)
{
  uint64_t v4 = result[35];
  int v5 = *(_DWORD *)(v4 + 100 * a2);
  int v6 = *(_DWORD *)(v4 + 100 * a3);
  if (v5 == -1)
  {
    if (v6 == -1) {
      return (void *)sequenceCreate((uint64_t)result, a2, a3);
    }
    int v5 = v6;
    a3 = a2;
    return (void *)sequenceAddConcomp((uint64_t)result, v5, a3, 1);
  }
  if (v6 == -1) {
    return (void *)sequenceAddConcomp((uint64_t)result, v5, a3, 1);
  }
  if (v5 != v6) {
    return (void *)sequenceMerge(result, v5, v6);
  }
  return result;
}

_DWORD *mergeNeighboringSequences(_DWORD *result)
{
  int v1 = result[81];
  if (v1 != -1)
  {
    uint64_t v2 = result;
    do
    {
      uint64_t v3 = v2[39];
      uint64_t v4 = (unsigned __int16 *)(v3 + 104 * v1);
      int v5 = *(_DWORD *)v4;
      if (*(_DWORD *)v4 == -1) {
        return result;
      }
      int v86 = v1;
      uint64_t v6 = v3 + 104 * v1;
      uint64_t v7 = (unsigned __int8 *)(v6 + 92);
      int v8 = (unsigned __int16 *)(v6 + 24);
      int v9 = (unsigned __int16 *)(v6 + 26);
      uint64_t v10 = (_DWORD *)(v6 + 60);
      uint64_t result = (_DWORD *)(v6 + 52);
      uint64_t v11 = (int *)(v6 + 40);
      int v93 = (unsigned int *)(v6 + 20);
      int v12 = (unsigned __int16 *)(v6 + 28);
      int v13 = (unsigned __int16 *)(v6 + 30);
      uint64_t v87 = (int **)(v6 + 8);
      unsigned int v88 = (_DWORD *)(v6 + 44);
      int v99 = (_DWORD *)(v6 + 52);
      int v98 = (int *)(v6 + 40);
      do
      {
        uint64_t v14 = v2[39];
        uint64_t v15 = v14 + 104 * v5;
        if (*v7 == *(unsigned __int8 *)(v15 + 92))
        {
          int v16 = v5;
          unsigned int v17 = *v8;
          uint64_t v18 = v14 + 104 * v16;
          unsigned int v19 = *(unsigned __int16 *)(v18 + 24);
          if (v17 <= v19) {
            unsigned int v17 = *(unsigned __int16 *)(v18 + 24);
          }
          unsigned int v20 = *v9;
          unsigned int v21 = *(unsigned __int16 *)(v18 + 26);
          if (v20 < v21) {
            unsigned int v21 = *v9;
          }
          int v22 = v17 - v21;
          int v23 = *(_DWORD *)(v18 + 60);
          int v24 = v23 + *v10;
          if (v24 < 0 != __OFADD__(v23, *v10)) {
            ++v24;
          }
          int v25 = v24 >> 1;
          int v26 = *result;
          int v27 = *(_DWORD *)(v18 + 52);
          int v28 = v27 + *result;
          if (v27 + v26 < 0 != __OFADD__(v27, v26)) {
            ++v28;
          }
          if (v25 <= v28 >> 1) {
            int v25 = v28 >> 1;
          }
          int v29 = v25 >= 0 ? v25 : v25 + 1;
          if (v22 >= -(v29 >> 1) && 5 * v25 >= 2 * v22)
          {
            int v30 = *v11;
            if (*v11 && (int v31 = *(_DWORD *)(v14 + 104 * v16 + 40)) != 0)
            {
              if (v30 >= v31) {
                int v30 = *(_DWORD *)(v14 + 104 * v16 + 40);
              }
              int v32 = v26 - v27;
              if (v32 >= 0) {
                int v33 = v32;
              }
              else {
                int v33 = -v32;
              }
              if (v30 >= 0) {
                int v34 = v30;
              }
              else {
                int v34 = v30 + 1;
              }
              if (v33 < v34 >> 1)
              {
                int v94 = v13;
                int v96 = v12;
                unsigned int v89 = v10;
                uint64_t v90 = v9;
                int32x4_t v91 = v8;
                signed int v35 = v34 >> 1;
                uint64_t v36 = (uint64_t)v4;
                BOOL v92 = doesSeqLineIntersectSeq(v15, v4, v34 >> 1);
                BOOL v37 = doesSeqLineIntersectSeq(v36, (unsigned __int16 *)v15, v35);
                if (!v92 && !v37 || !v92 && *(int *)(v14 + 104 * v16 + 20) > 5)
                {
                  int v8 = v91;
                  uint64_t v4 = (unsigned __int16 *)v36;
                  uint64_t v10 = v89;
                  int v9 = v90;
                  uint64_t result = v99;
                  int v12 = v96;
                  uint64_t v11 = v98;
                  int v13 = v94;
                  goto LABEL_98;
                }
                int v13 = v94;
                uint64_t v49 = *v93;
                BOOL v50 = v37 || (int)v49 < 6;
                int v8 = v91;
                uint64_t v4 = (unsigned __int16 *)v36;
                uint64_t v10 = v89;
                int v9 = v90;
                int v12 = v96;
                uint64_t v11 = v98;
                if (!v50)
                {
                  uint64_t result = v99;
                  goto LABEL_98;
                }
                uint64_t result = v99;
                goto LABEL_55;
              }
            }
            else
            {
              int v38 = *v13;
              int v39 = *v12;
              int v40 = v38 - v39 + 1;
              uint64_t v41 = v14 + 104 * v16;
              int v42 = *(unsigned __int16 *)(v41 + 30);
              int v43 = *(unsigned __int16 *)(v41 + 28);
              if (v40 >= v42 - v43 + 1) {
                int v40 = v42 - v43 + 1;
              }
              int v44 = v40 + (v40 < 0);
              if (v38 - v39 - (v42 - v43) >= 0) {
                int v45 = v38 - v39 - (v42 - v43);
              }
              else {
                int v45 = v42 - v43 - (v38 - v39);
              }
              if (v45 < v44 >> 1)
              {
                int v46 = v44 >> 1;
                int v47 = v39 - v43;
                if (v47 < 0) {
                  int v47 = -v47;
                }
                if (v47 < v46)
                {
                  int v48 = v38 - v42;
                  if (v48 < 0) {
                    int v48 = -v48;
                  }
                  if (v48 < v46)
                  {
                    uint64_t v49 = *v93;
LABEL_55:
                    if ((int)v49 < 1)
                    {
                      int v51 = 0;
                    }
                    else
                    {
                      int v51 = 0;
                      uint64_t v52 = v2[35];
                      int v53 = *v87;
                      do
                      {
                        int v55 = *v53++;
                        int v54 = v55;
                        if ((*(unsigned char *)(v52 + 100 * v55 + 94) & 8) == 0) {
                          v51 += *(_DWORD *)(v52 + 100 * v54 + 72);
                        }
                        --v49;
                      }
                      while (v49);
                    }
                    uint64_t v56 = *(unsigned int *)(v14 + 104 * v16 + 20);
                    if ((int)v56 < 1)
                    {
                      int v57 = 0;
                    }
                    else
                    {
                      int v57 = 0;
                      uint64_t v58 = v2[35];
                      int v59 = *(int **)(v14 + 104 * v16 + 8);
                      do
                      {
                        int v61 = *v59++;
                        int v60 = v61;
                        if ((*(unsigned char *)(v58 + 100 * v61 + 94) & 8) == 0) {
                          v57 += *(_DWORD *)(v58 + 100 * v60 + 72);
                        }
                        --v56;
                      }
                      while (v56);
                    }
                    int v62 = v51 / *v88;
                    int v63 = v57 / *(_DWORD *)(v14 + 104 * v16 + 44);
                    if (v63 <= 8 * v62 && 8 * v63 >= v62)
                    {
                      int v65 = v20 <= v19 ? v4 : (unsigned __int16 *)v15;
                      int v66 = v20 <= v19 ? (unsigned __int16 *)v15 : v4;
                      int v67 = v65[13];
                      int v68 = v66[12] - 1;
                      if (v68 <= v67) {
                        goto LABEL_97;
                      }
                      int v95 = v13;
                      int v97 = v12;
                      int v69 = v65[14] <= v66[14] ? v66[14] : v65[14];
                      int v70 = v65[15] >= v66[15] ? v66[15] : v65[15];
                      int v71 = *((_DWORD *)v65 + 10);
                      if (v71)
                      {
                        int v72 = v10;
                        int v73 = v9;
                        uint64_t v74 = v4;
                        int v75 = *((_DWORD *)v66 + 10);
                        if (v75)
                        {
                          int v76 = *((_DWORD *)v65 + 9);
                          int v77 = *((_DWORD *)v66 + 8);
                          if (v76 <= v77) {
                            int v69 = v77;
                          }
                          else {
                            int v69 = *((_DWORD *)v65 + 9);
                          }
                          int v78 = v76 + v71;
                          int v79 = v77 + v75;
                          if (v78 < v79) {
                            int v79 = v78;
                          }
                          int v70 = v79 - 1;
                        }
                      }
                      else
                      {
                        int v72 = v10;
                        int v73 = v9;
                        uint64_t v74 = v4;
                      }
                      BOOL v50 = (int)pixelCount((uint64_t)v2, v67 + 1, v68, v69, v70, *((unsigned __int8 *)v65 + 92)) <= 0;
                      uint64_t v4 = v74;
                      int v9 = v73;
                      uint64_t v10 = v72;
                      uint64_t result = v99;
                      int v12 = v97;
                      uint64_t v11 = v98;
                      int v13 = v95;
                      if (v50)
                      {
LABEL_97:
                        int v80 = v4;
                        int v81 = v16;
                        uint64_t v82 = v9;
                        int v83 = v10;
                        uint64_t v84 = v12;
                        uint64_t v85 = v13;
                        sequenceMerge(v2, v86, v81);
                        int v13 = v85;
                        int v12 = v84;
                        uint64_t v11 = v98;
                        uint64_t result = v99;
                        uint64_t v10 = v83;
                        int v9 = v82;
                        uint64_t v4 = v80;
                        uint64_t v15 = (uint64_t)v80;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_98:
        int v5 = *(_DWORD *)v15;
      }
      while (*(_DWORD *)v15 != -1);
      int v1 = *(_DWORD *)v4;
    }
    while (*(_DWORD *)v4 != -1);
  }
  return result;
}

uint64_t sequenceRemove(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 312);
  uint64_t v3 = (unsigned int *)(v2 + 104 * a2);
  uint64_t v4 = v3[5];
  if ((int)v4 >= 1)
  {
    uint64_t v5 = *(void *)(a1 + 280);
    uint64_t v6 = *(int **)(v2 + 104 * a2 + 8);
    do
    {
      int v7 = *v6++;
      *(unsigned char *)(v5 + 100 * v7 + 94) = 0;
      --v4;
    }
    while (v4);
  }
  int v8 = *(_DWORD *)(v2 + 104 * a2 + 4);
  uint64_t v9 = *v3;
  if (v8 == -1) {
    *(_DWORD *)(a1 + 324) = v9;
  }
  else {
    *(_DWORD *)(v2 + 104 * v8) = v9;
  }
  if (v9 == -1) {
    *(_DWORD *)(a1 + 328) = v8;
  }
  else {
    *(_DWORD *)(v2 + 104 * (int)v9 + 4) = v8;
  }
  *uint64_t v3 = *(_DWORD *)(a1 + 332);
  *(_DWORD *)(a1 + 332) = a2;
  return v9;
}

BOOL histogramIsOK(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!*(_DWORD *)(a1 + 12) || *(_DWORD *)(a1 + 36)) {
    return 1;
  }
  int32x4_t v3 = 0uLL;
  memset(v39, 0, sizeof(v39));
  uint64_t v4 = *(unsigned int *)(a2 + 20);
  if ((int)v4 > 0)
  {
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)(a1 + 168);
    uint64_t v7 = *(int *)(a1 + 192);
    uint64_t v8 = *(void *)(a1 + 280);
    uint64_t v9 = *(void *)(a2 + 8);
    do
    {
      int v10 = *(_DWORD *)(v9 + 4 * v5);
      if ((*(unsigned char *)(v8 + 100 * v10 + 94) & 8) == 0)
      {
        uint64_t v11 = v8 + 100 * v10;
        uint64_t v12 = *(unsigned __int16 *)(v11 + 80);
        uint64_t v13 = *(unsigned __int16 *)(v11 + 82);
        if (v12 <= v13)
        {
          uint64_t v14 = v8 + 100 * v10;
          uint64_t v15 = *(unsigned __int16 *)(v14 + 84);
          uint64_t v16 = *(unsigned __int16 *)(v14 + 86);
          do
          {
            if (v15 <= v16)
            {
              uint64_t v17 = v6 + (int)v7 * (uint64_t)(int)v15;
              uint64_t v18 = v16 - v15 + 1;
              do
              {
                unint64_t v19 = ((unint64_t)*(unsigned __int8 *)(v17 + v12) >> 1) & 0x7C;
                ++*(_DWORD *)((char *)v39 + v19);
                v17 += v7;
                --v18;
              }
              while (v18);
            }
          }
          while (v12++ != v13);
        }
      }
      ++v5;
    }
    while (v5 != v4);
  }
  uint64_t v21 = 0;
  int32x4_t v22 = (int32x4_t)xmmword_1DCC6EB30;
  float v23 = 0.0;
  v24.i64[0] = 0x400000004;
  v24.i64[1] = 0x400000004;
  do
  {
    int32x4_t v25 = (int32x4_t)v39[v21];
    int32x4_t v3 = vaddq_s32(v25, v3);
    float32x4_t v26 = vcvtq_f32_s32(vmulq_s32(v25, v22));
    float v23 = (float)((float)((float)(v23 + v26.f32[0]) + v26.f32[1]) + v26.f32[2]) + v26.f32[3];
    int32x4_t v22 = vaddq_s32(v22, v24);
    ++v21;
  }
  while (v21 != 8);
  uint64_t v27 = 0;
  float v28 = (float)vaddvq_s32(v3);
  float v29 = v23 / v28;
  float v30 = 0.0;
  float v31 = 0.0;
  float v32 = 0.0;
  do
  {
    float v33 = (float)(int)v27 - v29;
    float v34 = (float)*((int *)v39 + v27);
    float v32 = v32 + (float)(v34 * (float)(v33 * v33));
    float v35 = (float)(v33 * v33) * v34;
    float v31 = v31 + (float)(v35 * v33);
    float v30 = v30 + (float)(v35 * (float)(v33 * v33));
    ++v27;
  }
  while (v27 != 32);
  float v36 = v32 / v28;
  if ((float)(v32 / v28) < 0.00001) {
    return 0;
  }
  if ((float)((float)((float)(v31 / v28) * (float)(v31 / v28)) / (float)(v36 * (float)(v36 * v36))) > 0.49) {
    return 1;
  }
  double v37 = (float)((float)(v30 / v28) / (float)(v36 * v36));
  double v38 = v36 >= 8.0 ? 2.4 : 2.3;
  return v37 <= v38;
}

uint64_t FKSequenceOneBox(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 296);
  if (v1 == -1) {
    return 0;
  }
  int v3 = 0;
  uint64_t v4 = *(void *)(a1 + 280);
  int v5 = -1;
  do
  {
    int v6 = v1;
    int v7 = *(_DWORD *)(v4 + 100 * v1 + 72);
    if (v7 >= 32)
    {
      BOOL CanBeGlyph = concompCanBeGlyph(v4 + 100 * v1);
      int v9 = v7 <= v3 ? v5 : v6;
      int v10 = v7 <= v3 ? v3 : v7;
      if (CanBeGlyph)
      {
        int v5 = v9;
        int v3 = v10;
      }
    }
    int v1 = *(_DWORD *)(v4 + 100 * v6 + 4);
  }
  while (v1 != -1);
  if (v5 == -1) {
    return 0;
  }
  uint64_t v11 = *(void *)(a1 + 280);
  uint64_t v12 = (unsigned __int16 *)(v11 + 100 * v5);
  int v13 = v12[42];
  int v14 = v12[43];
  int v15 = *(_DWORD *)(a1 + 32);
  signed int v16 = (v14 + v13 + 1) >> 1;
  if (v14 - v13 < v15 / 3 || v16 < v15 / 3) {
    return 0;
  }
  int v18 = *(_DWORD *)(a1 + 28);
  signed int v19 = (v12[41] + v12[40] + 1) >> 1;
  BOOL v20 = v16 > 2 * v15 / 3 || v19 < v18 / 3;
  if (v20 || v19 > 2 * v18 / 3 || *(unsigned __int16 *)(v11 + 100 * v5 + 88) > 5u) {
    return 0;
  }
  sequenceCreate(a1, v5, -1);
  int v22 = *(_DWORD *)(a1 + 296);
  if (v22 == -1) {
    return 1;
  }
  uint64_t v23 = v11 + 100 * v5;
  int32x4_t v24 = (unsigned __int8 *)(v23 + 92);
  int32x4_t v25 = (int *)(v23 + 72);
  do
  {
    uint64_t v26 = *(void *)(a1 + 280);
    int v27 = v22;
    float v28 = (unsigned __int16 *)(v26 + 100 * v22);
    if (*((unsigned char *)v28 + 94)) {
      BOOL v29 = 1;
    }
    else {
      BOOL v29 = v28 == v12;
    }
    if (!v29 && *(unsigned __int8 *)(v26 + 100 * v27 + 92) == *v24)
    {
      float v30 = (unsigned __int16 *)(v26 + 100 * v27);
      if (v12[42] >= (v30[43] + v30[42] + 1) >> 1)
      {
        unsigned int v31 = (v30[41] + v30[40] + 1) >> 1;
        if (v31 >= v12[40] && v31 <= v12[41])
        {
          int v32 = *v25 + 31;
          if (*v25 >= 0) {
            int v32 = *v25;
          }
          int v33 = *(_DWORD *)(v26 + 100 * v27 + 72);
          if (v33 >= v32 >> 5 && v33 <= *v25 / 3) {
            addDiacritic(a1, v5, v27);
          }
        }
      }
    }
    int v22 = *(_DWORD *)(v26 + 100 * v27 + 4);
    uint64_t result = 1;
  }
  while (v22 != -1);
  return result;
}

size_t sequenceCreate(uint64_t a1, int a2, int a3)
{
  int v6 = *(_DWORD *)(a1 + 332);
  if (v6 != -1)
  {
LABEL_4:
    uint64_t v9 = *(void *)(a1 + 312);
    int v10 = (_DWORD *)(v9 + 104 * v6);
    *(_DWORD *)(a1 + 332) = *v10;
    int v11 = *(_DWORD *)(a1 + 328);
    *(_DWORD *)(a1 + 328) = v6;
    if (v11 == -1) {
      *(_DWORD *)(a1 + 324) = v6;
    }
    else {
      *(_DWORD *)(v9 + 104 * v11) = v6;
    }
    uint64_t v12 = v9 + 104 * v6;
    *(_DWORD *)(v12 + 4) = v11;
    *int v10 = -1;
    uint64_t v13 = *(int *)(v12 + 16);
    if (v13) {
      bzero(*(void **)(v9 + 104 * v6 + 8), 4 * v13);
    }
    uint64_t v14 = v9 + 104 * v6;
    int v16 = *(_DWORD *)(v14 + 88);
    int v15 = (_DWORD *)(v14 + 88);
    if (v16)
    {
      uint64_t v17 = v9 + 104 * v6;
      BOOL v20 = *(void **)(v17 + 80);
      signed int v19 = (void *)(v17 + 80);
      int v18 = v20;
      if (v20)
      {
        free(v18);
        void *v19 = 0;
        *int v15 = 0;
      }
    }
    uint64_t v21 = v9 + 104 * v6;
    *(_DWORD *)(v21 + 68) = 0;
    *(_DWORD *)(v21 + 72) = 0;
    *(_OWORD *)(v21 + 20) = 0u;
    *(_OWORD *)(v21 + 36) = 0u;
    *(_OWORD *)(v21 + 48) = 0u;
    *(_DWORD *)(v21 + 92) = 0;
    *(_DWORD *)(v21 + 95) = 0;
    size_t result = sequenceAddConcomp(a1, v6, a2, 1);
    if (a3 != -1)
    {
      return sequenceAddConcomp(a1, v6, a3, 1);
    }
    return result;
  }
  int v7 = malloc_type_realloc(*(void **)(a1 + 312), 208 * *(int *)(a1 + 320), 0x1010040D07E2FD1uLL);
  if (v7)
  {
    *(void *)(a1 + 312) = v7;
    int v8 = *(_DWORD *)(a1 + 320);
    *(_DWORD *)(a1 + 332) = v8;
    *(_DWORD *)(a1 + 320) = 2 * v8;
    sequenceLinkFreeList(a1, 1);
    int v6 = *(_DWORD *)(a1 + 332);
    goto LABEL_4;
  }
  uint64_t v23 = (FILE *)*MEMORY[0x1E4F143C8];
  return fwrite("Could not create more sequences\n", 0x20uLL, 1uLL, v23);
}

uint64_t addDiacritic(uint64_t result, int a2, int a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(result + 280);
  int v5 = (int *)(v4 + 100 * a2);
  for (char i = 1; ; char i = 0)
  {
    char v7 = i;
    uint64_t v8 = v4 + 100 * a2 + 4 * v3;
    int v10 = *(_DWORD *)(v8 + 64);
    uint64_t v9 = (_DWORD *)(v8 + 64);
    if (v10 == -1) {
      break;
    }
    uint64_t v3 = 1;
    if ((v7 & 1) == 0) {
      return result;
    }
  }
  *uint64_t v9 = a3;
  uint64_t v11 = v4 + 100 * a3;
  *(unsigned char *)(v11 + 94) = 17;
  uint64_t v12 = *(void *)(result + 312) + 104 * *v5;
  unsigned int v13 = *(unsigned __int16 *)(v12 + 28);
  if (v13 >= *(unsigned __int16 *)(v11 + 84)) {
    LOWORD(v13) = *(_WORD *)(v11 + 84);
  }
  *(_WORD *)(v12 + 28) = v13;
  unsigned int v14 = *(unsigned __int16 *)(v12 + 30);
  if (v14 <= *(unsigned __int16 *)(v11 + 86)) {
    LOWORD(v14) = *(_WORD *)(v11 + 86);
  }
  *(_WORD *)(v12 + 30) = v14;
  unsigned int v15 = *(unsigned __int16 *)(v12 + 24);
  if (v15 >= *(unsigned __int16 *)(v11 + 80)) {
    LOWORD(v15) = *(_WORD *)(v11 + 80);
  }
  *(_WORD *)(v12 + 24) = v15;
  unsigned int v16 = *(unsigned __int16 *)(v11 + 82);
  if (*(unsigned __int16 *)(v12 + 26) > v16) {
    LOWORD(v16) = *(_WORD *)(v12 + 26);
  }
  *(_WORD *)(v12 + 26) = v16;
  *(unsigned char *)(v12 + 93) = 0;
  return result;
}

uint64_t compareCCX(uint64_t a1, int *a2, int *a3)
{
  return *(unsigned __int16 *)(*(void *)(a1 + 280) + 100 * *a2 + 80)
       - *(unsigned __int16 *)(*(void *)(a1 + 280) + 100 * *a3 + 80);
}

uint64_t computeBeta(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = MEMORY[0x1F4188790](a1);
  int v5 = (char *)&v22 - v4;
  int v23 = 1;
  LODWORD(v24) = v3 / 7u + 1;
  HIDWORD(v24) = 2 * v24;
  if (v3 <= 6 && (uint64_t v24 = 2, v3 <= 4) && (LODWORD(v24) = 0, v3 < 1))
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    int v7 = 0;
    do
    {
      for (uint64_t i = 0; i != 12; i += 4)
      {
        int v9 = *(int *)((char *)&v23 + i);
        int v10 = v9 + v6;
        if (v9) {
          BOOL v11 = v10 < v3;
        }
        else {
          BOOL v11 = 0;
        }
        if (v11)
        {
          int v12 = *(_DWORD *)(v2 + 4 * v6);
          int v13 = *(_DWORD *)(v2 + 4 * v10);
          BOOL v14 = __OFSUB__(v13, v12);
          int v15 = v13 - v12;
          if (!((v15 < 0) ^ v14 | (v15 == 0))) {
            *(_DWORD *)&v5[4 * v7++] = ((*(_DWORD *)(v1 + 4 * v10) - *(_DWORD *)(v1 + 4 * v6)) << 16) / v15;
          }
        }
      }
      ++v6;
    }
    while (v6 != v3);
  }
  qsort(v5, v7, 4uLL, (int (__cdecl *)(const void *, const void *))increasingOrderCompare);
  if (v7 >= 0) {
    int v16 = v7;
  }
  else {
    int v16 = v7 + 1;
  }
  uint64_t result = *(unsigned int *)&v5[4 * (v16 >> 1)];
  if ((v7 & 1) == 0)
  {
    int v18 = *(_DWORD *)&v5[4 * ((uint64_t)v16 >> 1) + 4];
    if ((int)result <= v18) {
      unsigned int v19 = v18;
    }
    else {
      unsigned int v19 = result;
    }
    if (v18 > 0) {
      unsigned int v19 = 0;
    }
    if ((int)result >= v18) {
      int v20 = v18;
    }
    else {
      int v20 = result;
    }
    if (v18 >= 0) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = 0;
    }
    if ((int)result >= 0) {
      return v21;
    }
    else {
      return v19;
    }
  }
  return result;
}

uint64_t increasingOrderCompare(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

uint64_t findNeighborAtY(uint64_t a1, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(a2 + 12);
  uint64_t v4 = *(void *)(a1 + 256);
  uint64_t v5 = *(void *)(a1 + 264);
  for (uint64_t i = v3;
        a3 != (unsigned __int16)((*(_WORD *)(v4 + 8 * v3) >> 2) + *(_WORD *)(v5 + 2 * (v3 >> 6)));
        uint64_t i = v3)
  {
    int v7 = *(unsigned __int16 *)(v4 + 8 * i + 4);
    v3 -= v7;
    if (!v7) {
      int v3 = -1;
    }
  }
  if (i)
  {
    for (uint64_t j = 8 * i + 8; j != 8; j += 8)
    {
      if (*(int *)(a1 + 276) <= j >> 3) {
        break;
      }
      int v9 = *(_DWORD *)(v4 + j);
      if (a3 != (unsigned __int16)((v9 >> 2)
                                  + *(_WORD *)(v5 + 2 * ((int)((unint64_t)j >> 3) >> 6))))
        break;
      int v10 = v9 >> 8;
      if (v9 >> 8 != -1 && (*(_DWORD *)(v4 + j) & 3) == *(unsigned char *)(a2 + 92))
      {
        uint64_t v12 = *(void *)(a1 + 280) + 100 * v10;
        if (*(unsigned char *)(v12 + 94) != 2 && v12 != a2)
        {
          if (concompCanBeGlyph(*(void *)(a1 + 280) + 100 * v10)) {
            return v10;
          }
          else {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t insertNeighbor(uint64_t result, int *a2, int a3, int *a4, int *a5)
{
  if (a3 != -1)
  {
    uint64_t v5 = *(void *)(result + 280);
    uint64_t v6 = (int *)(v5 + 100 * a3);
    unsigned int v7 = *((unsigned __int16 *)v6 + 40);
    unsigned int v8 = *((unsigned __int16 *)a2 + 40);
    if (v7 >= v8 || *((unsigned __int16 *)a2 + 41) >= *(unsigned __int16 *)(v5 + 100 * a3 + 82))
    {
      if (v8 >= v7)
      {
        unsigned int v10 = *((unsigned __int16 *)a2 + 41);
      }
      else
      {
        unsigned int v9 = *(unsigned __int16 *)(v5 + 100 * a3 + 82);
        unsigned int v10 = *((unsigned __int16 *)a2 + 41);
        if (v9 < v10 && (v7 <= (v8 + v10 + 1) >> 1 || 7 * v9 + v7 >= 8 * v9)) {
          return result;
        }
      }
      int v11 = v7 - v10;
      unsigned int v12 = *((unsigned __int16 *)a2 + 43);
      unsigned int v13 = *((unsigned __int16 *)a2 + 42);
      int v14 = v12 - v13 + 1;
      uint64_t v15 = v5 + 100 * a3;
      unsigned int v16 = *(unsigned __int16 *)(v15 + 86);
      unsigned int v17 = *(unsigned __int16 *)(v15 + 84);
      int v18 = v16 - v17 + 1;
      int v19 = v18 + v14;
      if (v18 + v14 < 0 != __OFADD__(v18, v14)) {
        int v20 = v19 + 1;
      }
      else {
        int v20 = v18 + v14;
      }
      if (v11 < v20 >> 1
        || (v14 >= v18 ? (int v21 = v16 - v17 + 1) : (int v21 = v12 - v13 + 1),
            5 * v21 > 2 * v11 && (v14 - v18 >= 0 ? (int v22 = v14 - v18) : (int v22 = v18 - v14), 3 * v22 < v19)))
      {
        if (5 * v14 > 2 * v18)
        {
          unsigned int v23 = (v16 + v17 + 1) >> 1;
          unsigned int v24 = (v12 + v13 + 1) >> 1;
          BOOL v25 = 5 * v18 > 2 * v14 && v24 >= v17;
          BOOL v26 = v25 && v23 >= v13;
          BOOL v27 = !v26 || v24 > v16;
          BOOL v28 = v27 || v23 > v12;
          BOOL v29 = !v28 && (int)(v13 - v14) <= (int)v17;
          BOOL v30 = v29 && (int)(v17 - v18) <= (int)v13;
          BOOL v31 = !v30 || (int)(v14 + v12) < (int)v16;
          if (!v31 && (int)(v18 + v16) >= (int)v12)
          {
            int v33 = *(unsigned __int16 *)(v5 + 100 * a3 + 82);
            int v34 = *((unsigned __int16 *)v6 + 40);
            float v35 = a2;
            do
            {
              float v36 = v6;
              uint64_t v6 = v35;
              int v37 = v33 - v34;
              int v33 = *((unsigned __int16 *)v35 + 41);
              int v34 = *((unsigned __int16 *)v35 + 40);
              int v38 = v33 - v34;
              float v35 = v36;
            }
            while (v37 < v33 - v34);
            int v39 = *((unsigned __int16 *)v36 + 43) - *((unsigned __int16 *)v36 + 42);
            int v40 = v36[18];
            int v41 = v6[18];
            if (v37 > v39) {
              int v40 = (v40 + v40 * v39) / (v37 + 1);
            }
            if (v38 <= 1) {
              int v41 = 2 * (*((unsigned __int16 *)v6 + 43) - *((unsigned __int16 *)v6 + 42)) + 2;
            }
            if (v40 <= 8 * v41)
            {
              if (*a2 == -1
                || ((int v42 = *(_DWORD *)(*(void *)(result + 312) + 104 * *a2 + 52), 2 * v18 > v42)
                  ? (BOOL v43 = 2 * v42 <= v18)
                  : (BOOL v43 = 1),
                    !v43))
              {
                int v44 = *a4;
                if (*a4 == -1)
                {
                  *a4 = a3;
                }
                else
                {
                  if (v7 < *(unsigned __int16 *)(v5 + 100 * v44 + 80))
                  {
                    *a4 = a3;
                    a3 = v44;
                  }
                  if (*a5 == -1 || v7 < *(unsigned __int16 *)(v5 + 100 * *a5 + 80)) {
                    *a5 = a3;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sequenceMerge(void *a1, int a2, int a3)
{
  uint64_t v6 = a1[39];
  uint64_t v8 = *(unsigned int *)(v6 + 104 * a3 + 20);
  if ((int)v8 >= 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 4 * v8;
    do
    {
      sequenceAddConcomp((uint64_t)a1, a2, *(_DWORD *)(*(void *)(a1[39] + 104 * a3 + 8) + v9), 0);
      v9 += 4;
    }
    while (v10 != v9);
    uint64_t v6 = a1[39];
  }
  FKSequenceSortAndProcess(a1, v6 + 104 * a2, 1);
  *(_DWORD *)(a1[39] + 104 * a3 + 20) = 0;
  return sequenceRemove((uint64_t)a1, a3);
}

BOOL doesSeqLineIntersectSeq(uint64_t a1, unsigned __int16 *a2, signed int a3)
{
  int v3 = (int)((((a2[13] + a2[12] + 1) >> 1) - *(unsigned __int16 *)(a1 + 24)) << 16)
     / (*(unsigned __int16 *)(a1 + 26) - *(unsigned __int16 *)(a1 + 24));
  signed int v4 = *(_DWORD *)(a1 + 40) / 2
     - ((a2[15] + a2[14] + 1) >> 1)
     + (v3 * *(_DWORD *)(a1 + 36) + (0x10000 - v3) * *(_DWORD *)(a1 + 32)) / 0x10000;
  if (v4 < 0) {
    signed int v4 = -v4;
  }
  return v4 < a3;
}

uint64_t pixelCount(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v6 = a4 & ~(a4 >> 31);
  if (*(_DWORD *)(a1 + 32) - 1 >= a5) {
    int v7 = a5;
  }
  else {
    int v7 = *(_DWORD *)(a1 + 32) - 1;
  }
  if ((int)v6 > v7) {
    return 0;
  }
  uint64_t result = 0;
  int v10 = *(_DWORD *)(a1 + 28) - 1;
  if (v10 >= a3) {
    int v10 = a3;
  }
  uint64_t v11 = a2 & ~(a2 >> 31);
  uint64_t v12 = *(void *)(a1 + 200);
  uint64_t v13 = *(void *)(a1 + 224);
  uint64_t v14 = (v7 + 1);
  uint64_t v15 = (unsigned __int8 *)(v12 + v11 + v13 * v6);
  do
  {
    if ((int)v11 <= v10)
    {
      uint64_t v16 = (v10 + 1) - v11;
      unsigned int v17 = v15;
      do
      {
        int v18 = *v17++;
        if (v18 == a6) {
          uint64_t result = (result + 1);
        }
        else {
          uint64_t result = result;
        }
        --v16;
      }
      while (v16);
    }
    ++v6;
    v15 += v13;
  }
  while (v6 != v14);
  return result;
}

BOOL looksOkey(uint64_t a1)
{
  int v1 = *(unsigned __int16 *)(a1 + 86) - *(unsigned __int16 *)(a1 + 84) + 1;
  int v2 = *(unsigned __int16 *)(a1 + 82) - *(unsigned __int16 *)(a1 + 80);
  BOOL result = 0;
  if (v2 < 4 * v1)
  {
    int v3 = v2 + 1;
    if (v1 >= 2 * v3 || 100 * *(_DWORD *)(a1 + 72) <= 80 * v1 * v3) {
      return 1;
    }
  }
  return result;
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1F40D74D0](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1F40D7538](bundleID);
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1F40D85E0]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1F40D8758](anURL, pathStyle);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1F40DB200]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1F40DB210](dict, point);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1F40DFD28](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x1F40DFD30](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD40](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1F40DFD48](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD68](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD80](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFD98](pixelBuffer);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1F40DFDB0](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1F40DFDB8](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1F40DFE48](pixelBuffer, unlockFlags);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1F40C9CE0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1F4118648]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_change_input_blob_shapes()
{
  return MEMORY[0x1F4118738]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

int fflush(FILE *a1)
{
  return MEMORY[0x1F40CC0C8](a1);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CC658](a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

void objc_enumerationMutation(id obj)
{
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1F40D2D08](src, dest, tempBuffer, *(void *)&flags);
}