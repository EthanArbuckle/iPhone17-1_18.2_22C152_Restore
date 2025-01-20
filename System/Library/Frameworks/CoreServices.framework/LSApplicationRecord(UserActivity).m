@interface LSApplicationRecord(UserActivity)
+ (uint64_t)applicationRecordsForUserActivityType:()UserActivity limit:error:;
@end

@implementation LSApplicationRecord(UserActivity)

+ (uint64_t)applicationRecordsForUserActivityType:()UserActivity limit:error:
{
  unint64_t v10 = result;
  while (2)
  {
    v98 = (int *)(a2 - 16);
    unint64_t v11 = v10;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          unint64_t v10 = v11;
          uint64_t v12 = a2 - v11;
          uint64_t v13 = (uint64_t)(a2 - v11) >> 4;
          if (v6 || !v5)
          {
            switch(v13)
            {
              case 0:
              case 1:
                return result;
              case 2:
                result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(a2 - 8), *(void *)(v10 + 8));
                if (result == -1)
                {
                  int v44 = *(_DWORD *)v10;
                  *(_DWORD *)unint64_t v10 = *(_DWORD *)(a2 - 16);
                  *(_DWORD *)(a2 - 16) = v44;
                  uint64_t v45 = *(void *)(v10 + 8);
                  *(void *)(v10 + 8) = *(void *)(a2 - 8);
                  *(void *)(a2 - 8) = v45;
                }
                break;
              case 3:
                result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)v10, (int *)(v10 + 16), v98, a3);
                break;
              case 4:
                result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:v10 + 32 limit:(uint64_t)v98 error:a3];
                break;
              case 5:
                result = std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *,0>(v10, v10 + 16, v10 + 32, v10 + 48, (uint64_t)v98, a3);
                break;
              default:
                JUMPOUT(0);
            }
            return result;
          }
          if (v12 <= 383)
          {
            v46 = (_DWORD *)(v10 + 16);
            BOOL v48 = v10 == a2 || v46 == (_DWORD *)a2;
            if (a5)
            {
              if (!v48)
              {
                uint64_t v49 = 0;
                v50 = (_DWORD *)v10;
                do
                {
                  v51 = v46;
                  result = _LSBundleCompareForActivityContinuationSuitability(***a3, *((void *)v50 + 3), *((void *)v50 + 1));
                  if (result == -1)
                  {
                    unint64_t v52 = a2;
                    int v53 = *v51;
                    uint64_t v54 = *((void *)v50 + 3);
                    uint64_t v55 = v49;
                    while (1)
                    {
                      uint64_t v56 = v10 + v55;
                      *(_DWORD *)(v56 + 16) = *(_DWORD *)(v10 + v55);
                      *(void *)(v56 + 24) = *(void *)(v10 + v55 + 8);
                      if (!v55) {
                        break;
                      }
                      result = _LSBundleCompareForActivityContinuationSuitability(***a3, v54, *(void *)(v56 - 8));
                      v55 -= 16;
                      if (result != -1)
                      {
                        uint64_t v57 = v10 + v55 + 16;
                        goto LABEL_81;
                      }
                    }
                    uint64_t v57 = v10;
LABEL_81:
                    *(_DWORD *)uint64_t v57 = v53;
                    *(void *)(v57 + 8) = v54;
                    a2 = v52;
                  }
                  v46 = v51 + 4;
                  v49 += 16;
                  v50 = v51;
                }
                while (v51 + 4 != (_DWORD *)a2);
              }
            }
            else if (!v48)
            {
              v88 = (uint64_t *)(v10 + 24);
              do
              {
                v89 = v46;
                result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v10 + 24), *(void *)(v10 + 8));
                if (result == -1)
                {
                  unint64_t v90 = a2;
                  int v91 = *v89;
                  uint64_t v92 = *(void *)(v10 + 24);
                  v93 = v88;
                  do
                  {
                    v94 = v93;
                    int v95 = *((_DWORD *)v93 - 6);
                    uint64_t v96 = *(v93 - 2);
                    v93 -= 2;
                    *((_DWORD *)v94 - 2) = v95;
                    uint64_t *v94 = v96;
                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, v92, *(v94 - 4));
                  }
                  while (result == -1);
                  *((_DWORD *)v93 - 2) = v91;
                  uint64_t *v93 = v92;
                  a2 = v90;
                }
                v46 = v89 + 4;
                v88 += 2;
                unint64_t v10 = (unint64_t)v89;
              }
              while (v89 + 4 != (int *)a2);
            }
            return result;
          }
          if (!a4)
          {
            if (v10 != a2)
            {
              unint64_t v97 = a2;
              int64_t v58 = (unint64_t)(v13 - 2) >> 1;
              int64_t v59 = v58;
              do
              {
                int64_t v60 = v59;
                if (v58 >= v59)
                {
                  uint64_t v61 = (2 * v59) | 1;
                  unint64_t v62 = v10 + 16 * v61;
                  if (2 * v59 + 2 < v13)
                  {
                    uint64_t v63 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v62 + 8), *(void *)(v62 + 24));
                    v62 += 16 * (v63 == -1);
                    if (v63 == -1) {
                      uint64_t v61 = 2 * v60 + 2;
                    }
                  }
                  unint64_t v64 = v10 + 16 * v60;
                  uint64_t v66 = *(void *)(v64 + 8);
                  v65 = (uint64_t *)(v64 + 8);
                  result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v62 + 8), v66);
                  if (result != -1)
                  {
                    int64_t v101 = v60;
                    unint64_t v67 = v10 + 16 * v60;
                    int v99 = *(_DWORD *)v67;
                    uint64_t v68 = *v65;
                    do
                    {
                      unint64_t v69 = v67;
                      unint64_t v67 = v62;
                      *(_DWORD *)unint64_t v69 = *(_DWORD *)v62;
                      *(void *)(v69 + 8) = *(void *)(v62 + 8);
                      if (v58 < v61) {
                        break;
                      }
                      uint64_t v70 = (2 * v61) | 1;
                      unint64_t v62 = v10 + 16 * v70;
                      uint64_t v71 = 2 * v61 + 2;
                      if (v71 < v13)
                      {
                        uint64_t v72 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v62 + 8), *(void *)(v62 + 24));
                        v62 += 16 * (v72 == -1);
                        if (v72 == -1) {
                          uint64_t v70 = v71;
                        }
                      }
                      result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v62 + 8), v68);
                      uint64_t v61 = v70;
                    }
                    while (result != -1);
                    *(_DWORD *)unint64_t v67 = v99;
                    *(void *)(v67 + 8) = v68;
                    int64_t v60 = v101;
                  }
                }
                int64_t v59 = v60 - 1;
              }
              while (v60);
              uint64_t v73 = (unint64_t)v12 >> 4;
              unint64_t v74 = v97;
              do
              {
                uint64_t v75 = 0;
                int v102 = *(_DWORD *)v10;
                uint64_t v76 = *(void *)(v10 + 8);
                unint64_t v77 = v10;
                do
                {
                  unint64_t v78 = v77 + 16 * (v75 + 1);
                  uint64_t v79 = (2 * v75) | 1;
                  uint64_t v80 = 2 * v75 + 2;
                  if (v80 < v73)
                  {
                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v78 + 8), *(void *)(v78 + 24));
                    v78 += 16 * (result == -1);
                    if (result == -1) {
                      uint64_t v79 = v80;
                    }
                  }
                  *(_DWORD *)unint64_t v77 = *(_DWORD *)v78;
                  *(void *)(v77 + 8) = *(void *)(v78 + 8);
                  unint64_t v77 = v78;
                  uint64_t v75 = v79;
                }
                while (v79 <= (uint64_t)((unint64_t)(v73 - 2) >> 1));
                unint64_t v81 = v74 - 16;
                if (v78 == v74 - 16)
                {
                  *(_DWORD *)unint64_t v78 = v102;
                  *(void *)(v78 + 8) = v76;
                }
                else
                {
                  *(_DWORD *)unint64_t v78 = *(_DWORD *)(v74 - 16);
                  *(void *)(v78 + 8) = *(void *)(v74 - 8);
                  *(_DWORD *)(v74 - 16) = v102;
                  *(void *)(v74 - 8) = v76;
                  uint64_t v82 = v78 - v10 + 16;
                  if (v82 >= 17)
                  {
                    unint64_t v83 = (((unint64_t)v82 >> 4) - 2) >> 1;
                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v10 + 16 * v83 + 8), *(void *)(v78 + 8));
                    if (result == -1)
                    {
                      int v84 = *(_DWORD *)v78;
                      uint64_t v85 = *(void *)(v78 + 8);
                      do
                      {
                        unint64_t v86 = v78;
                        unint64_t v78 = v10 + 16 * v83;
                        *(_DWORD *)unint64_t v86 = *(_DWORD *)v78;
                        *(void *)(v86 + 8) = *(void *)(v78 + 8);
                        if (!v83) {
                          break;
                        }
                        unint64_t v83 = (v83 - 1) >> 1;
                        result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v10 + 16 * v83 + 8), v85);
                      }
                      while (result == -1);
                      *(_DWORD *)unint64_t v78 = v84;
                      *(void *)(v78 + 8) = v85;
                    }
                  }
                }
                unint64_t v74 = v81;
              }
              while (v73-- > 2);
            }
            return result;
          }
          unint64_t v14 = (unint64_t)v13 >> 1;
          unint64_t v15 = v10 + 16 * ((unint64_t)v13 >> 1);
          if ((unint64_t)v12 < 0x801)
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)v15, (int *)v10, v98, a3);
          }
          else
          {
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)v10, (int *)v15, v98, a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)(v10 + 16), (int *)(v15 - 16), (int *)(a2 - 32), a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)(v10 + 32), (int *)(v10 + 16 + 16 * v14), (int *)(a2 - 48), a3);
            std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>((int *)(v15 - 16), (int *)v15, (int *)(v10 + 16 + 16 * v14), a3);
            int v16 = *(_DWORD *)v10;
            *(_DWORD *)unint64_t v10 = *(_DWORD *)v15;
            *(_DWORD *)unint64_t v15 = v16;
            uint64_t v17 = *(void *)(v10 + 8);
            *(void *)(v10 + 8) = *(void *)(v15 + 8);
            *(void *)(v15 + 8) = v17;
          }
          --a4;
          if ((a5 & 1) != 0
            || _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v10 - 8), *(void *)(v10 + 8)) == -1)
          {
            break;
          }
          int v34 = *(_DWORD *)v10;
          uint64_t v35 = *(void *)(v10 + 8);
          result = _LSBundleCompareForActivityContinuationSuitability(***a3, v35, *(void *)(a2 - 8));
          if (result == -1)
          {
            unint64_t v37 = v10;
            do
            {
              unint64_t v11 = v37 + 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v35, *(void *)(v37 + 24));
              unint64_t v37 = v11;
            }
            while (result != -1);
          }
          else
          {
            unint64_t v36 = v10 + 16;
            do
            {
              unint64_t v11 = v36;
              if (v36 >= a2) {
                break;
              }
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v35, *(void *)(v36 + 8));
              unint64_t v36 = v11 + 16;
            }
            while (result != -1);
          }
          unint64_t v38 = a2;
          if (v11 < a2)
          {
            unint64_t v39 = a2;
            do
            {
              unint64_t v38 = v39 - 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v35, *(void *)(v39 - 8));
              unint64_t v39 = v38;
            }
            while (result == -1);
          }
          while (v11 < v38)
          {
            int v40 = *(_DWORD *)v11;
            *(_DWORD *)unint64_t v11 = *(_DWORD *)v38;
            *(_DWORD *)unint64_t v38 = v40;
            uint64_t v41 = *(void *)(v11 + 8);
            *(void *)(v11 + 8) = *(void *)(v38 + 8);
            *(void *)(v38 + 8) = v41;
            do
            {
              uint64_t v42 = *(void *)(v11 + 24);
              v11 += 16;
            }
            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v35, v42) != -1);
            do
            {
              uint64_t v43 = *(void *)(v38 - 8);
              v38 -= 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v35, v43);
            }
            while (result == -1);
          }
          BOOL v5 = v11 - 16 >= v10;
          BOOL v6 = v11 - 16 == v10;
          if (v11 - 16 != v10)
          {
            *(_DWORD *)unint64_t v10 = *(_DWORD *)(v11 - 16);
            *(void *)(v10 + 8) = *(void *)(v11 - 8);
          }
          a5 = 0;
          *(_DWORD *)(v11 - 16) = v34;
          *(void *)(v11 - 8) = v35;
        }
        uint64_t v18 = 0;
        int v19 = *(_DWORD *)v10;
        uint64_t v20 = *(void *)(v10 + 8);
        do
        {
          uint64_t v21 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v10 + v18 + 24), v20);
          v18 += 16;
        }
        while (v21 == -1);
        unint64_t v22 = v10 + v18;
        unint64_t v23 = a2;
        if (v18 == 16)
        {
          unint64_t v26 = a2;
          while (v22 < v26)
          {
            unint64_t v24 = v26 - 16;
            uint64_t v27 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v26 - 8), v20);
            unint64_t v26 = v24;
            if (v27 == -1) {
              goto LABEL_22;
            }
          }
          unint64_t v24 = v26;
        }
        else
        {
          do
          {
            unint64_t v24 = v23 - 16;
            uint64_t v25 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v23 - 8), v20);
            unint64_t v23 = v24;
          }
          while (v25 != -1);
        }
LABEL_22:
        unint64_t v11 = v10 + v18;
        if (v22 < v24)
        {
          unint64_t v28 = v24;
          do
          {
            int v29 = *(_DWORD *)v11;
            *(_DWORD *)unint64_t v11 = *(_DWORD *)v28;
            *(_DWORD *)unint64_t v28 = v29;
            uint64_t v30 = *(void *)(v11 + 8);
            *(void *)(v11 + 8) = *(void *)(v28 + 8);
            *(void *)(v28 + 8) = v30;
            do
            {
              uint64_t v31 = *(void *)(v11 + 24);
              v11 += 16;
            }
            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v31, v20) == -1);
            do
            {
              uint64_t v32 = *(void *)(v28 - 8);
              v28 -= 16;
            }
            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v32, v20) != -1);
          }
          while (v11 < v28);
        }
        if (v11 - 16 != v10)
        {
          *(_DWORD *)unint64_t v10 = *(_DWORD *)(v11 - 16);
          *(void *)(v10 + 8) = *(void *)(v11 - 8);
        }
        *(_DWORD *)(v11 - 16) = v19;
        *(void *)(v11 - 8) = v20;
        if (v22 >= v24) {
          break;
        }
LABEL_33:
        result = std::__introsort<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:a3 limit:a4 error:a5 & 1];
        a5 = 0;
      }
      BOOL v33 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>(v10, v11 - 16, a3);
      result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>(v11, a2, a3);
      if (result) {
        break;
      }
      if (!v33) {
        goto LABEL_33;
      }
    }
    a2 = v11 - 16;
    if (!v33) {
      continue;
    }
    return result;
  }
}

@end