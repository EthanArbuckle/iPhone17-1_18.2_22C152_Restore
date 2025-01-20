void sub_100005264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100005C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_100005FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000060B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000061E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100006960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100006CCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000717C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000072F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1000081DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000945C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100009A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_100009BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D00(unint64_t a1, __n128 *a2, uint64_t a3, char a4)
{
  while (2)
  {
    unint64_t v10 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v10;
          uint64_t v11 = (uint64_t)a2 - v10;
          unint64_t v12 = (uint64_t)((uint64_t)a2 - v10) >> 5;
          if (v5 || !v4)
          {
            switch(v12)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                double v38 = a2[-2].n128_f64[0];
                v37 = a2 - 2;
                if (v38 < *(double *)v10)
                {
                  __n128 v105 = *(__n128 *)v10;
                  __n128 v114 = *(__n128 *)(v10 + 16);
                  __n128 v39 = v37[1];
                  *(__n128 *)unint64_t v10 = *v37;
                  *(__n128 *)(v10 + 16) = v39;
                  __n128 *v37 = v105;
                  v37[1] = v114;
                }
                break;
              case 3uLL:
                sub_10000A540((double *)v10, (double *)(v10 + 32), a2[-2].n128_f64);
                break;
              case 4uLL:
                sub_10000A858((__n128 *)v10, (__n128 *)(v10 + 32), (__n128 *)(v10 + 64), a2 - 2);
                break;
              case 5uLL:
                v40 = (__n128 *)(v10 + 32);
                v41 = (__n128 *)(v10 + 64);
                v42 = (__n128 *)(v10 + 96);
                sub_10000A858((__n128 *)v10, (__n128 *)(v10 + 32), (__n128 *)(v10 + 64), (__n128 *)(v10 + 96));
                double v44 = a2[-2].n128_f64[0];
                v43 = a2 - 2;
                if (v44 < *(double *)(v10 + 96))
                {
                  __n128 v45 = *v42;
                  __n128 v115 = *(__n128 *)(v10 + 112);
                  __n128 v46 = v43[1];
                  __n128 *v42 = *v43;
                  *(__n128 *)(v10 + 112) = v46;
                  __n128 *v43 = v45;
                  v43[1] = v115;
                  if (v42->n128_f64[0] < v41->n128_f64[0])
                  {
                    __n128 v48 = *v41;
                    long long v47 = *(_OWORD *)(v10 + 80);
                    long long v49 = *(_OWORD *)(v10 + 112);
                    __n128 *v41 = *v42;
                    *(_OWORD *)(v10 + 80) = v49;
                    __n128 *v42 = v48;
                    *(_OWORD *)(v10 + 112) = v47;
                    if (v41->n128_f64[0] < v40->n128_f64[0])
                    {
                      __n128 v51 = *v40;
                      long long v50 = *(_OWORD *)(v10 + 48);
                      long long v52 = *(_OWORD *)(v10 + 80);
                      __n128 *v40 = *v41;
                      *(_OWORD *)(v10 + 48) = v52;
                      __n128 *v41 = v51;
                      *(_OWORD *)(v10 + 80) = v50;
                      if (*(double *)(v10 + 32) < *(double *)v10)
                      {
                        __n128 v106 = *(__n128 *)v10;
                        long long v116 = *(_OWORD *)(v10 + 16);
                        long long v53 = *(_OWORD *)(v10 + 48);
                        *(__n128 *)unint64_t v10 = *v40;
                        *(_OWORD *)(v10 + 16) = v53;
                        __n128 *v40 = v106;
                        *(_OWORD *)(v10 + 48) = v116;
                      }
                    }
                  }
                }
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v11 <= 767)
          {
            v54 = (__n128 *)(v10 + 32);
            BOOL v56 = (__n128 *)v10 == a2 || v54 == a2;
            if (a4)
            {
              if (!v56)
              {
                uint64_t v57 = 0;
                unint64_t v58 = v10;
                do
                {
                  v59 = v54;
                  double v60 = *(double *)(v58 + 32);
                  if (v60 < *(double *)v58)
                  {
                    long long v107 = *(_OWORD *)(v58 + 40);
                    uint64_t v117 = *(void *)(v58 + 56);
                    uint64_t v61 = v57;
                    while (1)
                    {
                      uint64_t v62 = v10 + v61;
                      long long v63 = *(_OWORD *)(v10 + v61 + 16);
                      *(_OWORD *)(v62 + 32) = *(_OWORD *)(v10 + v61);
                      *(_OWORD *)(v62 + 48) = v63;
                      if (!v61) {
                        break;
                      }
                      v61 -= 32;
                      if (v60 >= *(double *)(v62 - 32))
                      {
                        uint64_t v64 = v10 + v61 + 32;
                        goto LABEL_80;
                      }
                    }
                    uint64_t v64 = v10;
LABEL_80:
                    *(double *)uint64_t v64 = v60;
                    *(void *)(v64 + 24) = v117;
                    *(_OWORD *)(v64 + 8) = v107;
                  }
                  v54 = v59 + 2;
                  v57 += 32;
                  unint64_t v58 = (unint64_t)v59;
                }
                while (&v59[2] != a2);
              }
            }
            else if (!v56)
            {
              do
              {
                unint64_t v91 = (unint64_t)v54;
                double v92 = *(double *)(a1 + 32);
                if (v92 < *(double *)a1)
                {
                  __n128 v110 = *(__n128 *)(a1 + 40);
                  unint64_t v120 = *(void *)(a1 + 56);
                  v93 = v54;
                  do
                  {
                    __n128 v94 = v93[-1];
                    __n128 *v93 = v93[-2];
                    v93[1] = v94;
                    double v95 = v93[-4].n128_f64[0];
                    v93 -= 2;
                  }
                  while (v92 < v95);
                  v93->n128_f64[0] = v92;
                  v93[1].n128_u64[1] = v120;
                  *(__n128 *)((char *)v93 + 8) = v110;
                }
                v54 += 2;
                a1 = v91;
              }
              while ((__n128 *)(v91 + 32) != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((__n128 *)v10 != a2)
            {
              int64_t v65 = (v12 - 2) >> 1;
              int64_t v66 = v65;
              do
              {
                int64_t v67 = v66;
                if (v65 >= v66)
                {
                  uint64_t v68 = (2 * v66) | 1;
                  unint64_t v69 = v10 + 32 * v68;
                  if (2 * v67 + 2 < (uint64_t)v12 && *(double *)v69 < *(double *)(v69 + 32))
                  {
                    v69 += 32;
                    uint64_t v68 = 2 * v67 + 2;
                  }
                  unint64_t v70 = v10 + 32 * v67;
                  double v71 = *(double *)v70;
                  if (*(double *)v69 >= *(double *)v70)
                  {
                    uint64_t v118 = *(void *)(v70 + 24);
                    long long v108 = *(_OWORD *)(v70 + 8);
                    do
                    {
                      v72 = (_OWORD *)v70;
                      unint64_t v70 = v69;
                      long long v73 = *(_OWORD *)(v69 + 16);
                      _OWORD *v72 = *(_OWORD *)v69;
                      v72[1] = v73;
                      if (v65 < v68) {
                        break;
                      }
                      uint64_t v74 = 2 * v68;
                      uint64_t v68 = (2 * v68) | 1;
                      unint64_t v69 = v10 + 32 * v68;
                      uint64_t v75 = v74 + 2;
                      if (v75 < (uint64_t)v12 && *(double *)v69 < *(double *)(v69 + 32))
                      {
                        v69 += 32;
                        uint64_t v68 = v75;
                      }
                    }
                    while (*(double *)v69 >= v71);
                    *(double *)unint64_t v70 = v71;
                    *(void *)(v70 + 24) = v118;
                    *(_OWORD *)(v70 + 8) = v108;
                  }
                }
                int64_t v66 = v67 - 1;
              }
              while (v67);
              uint64_t v76 = (unint64_t)v11 >> 5;
              do
              {
                uint64_t v77 = 0;
                __n128 v109 = *(__n128 *)v10;
                __n128 v119 = *(__n128 *)(v10 + 16);
                v78 = (__n128 *)v10;
                do
                {
                  v79 = v78;
                  v78 += 2 * v77 + 2;
                  uint64_t v80 = 2 * v77;
                  uint64_t v77 = (2 * v77) | 1;
                  uint64_t v81 = v80 + 2;
                  if (v81 < v76 && v78->n128_f64[0] < v78[2].n128_f64[0])
                  {
                    v78 += 2;
                    uint64_t v77 = v81;
                  }
                  __n128 v82 = v78[1];
                  __n128 *v79 = *v78;
                  v79[1] = v82;
                }
                while (v77 <= (uint64_t)((unint64_t)(v76 - 2) >> 1));
                a2 -= 2;
                if (v78 == a2)
                {
                  __n128 *v78 = v109;
                  v78[1] = v119;
                }
                else
                {
                  __n128 v83 = a2[1];
                  __n128 *v78 = *a2;
                  v78[1] = v83;
                  *a2 = v109;
                  a2[1] = v119;
                  uint64_t v84 = (uint64_t)&v78[2] - v10;
                  if (v84 >= 33)
                  {
                    unint64_t v85 = (((unint64_t)v84 >> 5) - 2) >> 1;
                    v86 = (__n128 *)(v10 + 32 * v85);
                    double v87 = v78->n128_f64[0];
                    if (v86->n128_f64[0] < v78->n128_f64[0])
                    {
                      uint64_t v101 = v78[1].n128_i64[1];
                      __n128 v98 = *(__n128 *)((char *)v78 + 8);
                      do
                      {
                        v88 = v78;
                        v78 = v86;
                        __n128 v89 = v86[1];
                        __n128 *v88 = *v86;
                        v88[1] = v89;
                        if (!v85) {
                          break;
                        }
                        unint64_t v85 = (v85 - 1) >> 1;
                        v86 = (__n128 *)(v10 + 32 * v85);
                      }
                      while (v86->n128_f64[0] < v87);
                      v78->n128_f64[0] = v87;
                      v78[1].n128_u64[1] = v101;
                      *(__n128 *)((char *)v78 + 8) = v98;
                    }
                  }
                }
              }
              while (v76-- > 2);
            }
            return;
          }
          unint64_t v13 = v12 >> 1;
          unint64_t v14 = v10 + 32 * (v12 >> 1);
          if ((unint64_t)v11 > 0x1000)
          {
            sub_10000A540((double *)a1, (double *)(a1 + 32 * (v12 >> 1)), a2[-2].n128_f64);
            sub_10000A540((double *)(a1 + 32), (double *)(v14 - 32), a2[-4].n128_f64);
            sub_10000A540((double *)(a1 + 64), (double *)(a1 + 32 + 32 * v13), a2[-6].n128_f64);
            sub_10000A540((double *)(v14 - 32), (double *)v14, (double *)(a1 + 32 + 32 * v13));
            long long v102 = *(_OWORD *)a1;
            long long v111 = *(_OWORD *)(a1 + 16);
            long long v15 = *(_OWORD *)(v14 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(_OWORD *)(a1 + 16) = v15;
            *(_OWORD *)unint64_t v14 = v102;
            *(_OWORD *)(v14 + 16) = v111;
          }
          else
          {
            sub_10000A540((double *)(a1 + 32 * (v12 >> 1)), (double *)a1, a2[-2].n128_f64);
          }
          --a3;
          double v16 = *(double *)a1;
          if ((a4 & 1) != 0 || *(double *)(a1 - 32) < v16) {
            break;
          }
          uint64_t v100 = *(void *)(a1 + 24);
          long long v97 = *(_OWORD *)(a1 + 8);
          if (v16 >= a2[-2].n128_f64[0])
          {
            unint64_t v30 = a1 + 32;
            do
            {
              unint64_t v10 = v30;
              if (v30 >= (unint64_t)a2) {
                break;
              }
              v30 += 32;
            }
            while (v16 >= *(double *)v10);
          }
          else
          {
            unint64_t v10 = a1;
            do
            {
              double v29 = *(double *)(v10 + 32);
              v10 += 32;
            }
            while (v16 >= v29);
          }
          v31 = a2;
          if (v10 < (unint64_t)a2)
          {
            v31 = a2;
            do
            {
              double v32 = v31[-2].n128_f64[0];
              v31 -= 2;
            }
            while (v16 < v32);
          }
          while (v10 < (unint64_t)v31)
          {
            __n128 v104 = *(__n128 *)v10;
            __n128 v113 = *(__n128 *)(v10 + 16);
            __n128 v33 = v31[1];
            *(__n128 *)unint64_t v10 = *v31;
            *(__n128 *)(v10 + 16) = v33;
            __n128 *v31 = v104;
            v31[1] = v113;
            do
            {
              double v34 = *(double *)(v10 + 32);
              v10 += 32;
            }
            while (v16 >= v34);
            do
            {
              double v35 = v31[-2].n128_f64[0];
              v31 -= 2;
            }
            while (v16 < v35);
          }
          BOOL v4 = v10 - 32 >= a1;
          BOOL v5 = v10 - 32 == a1;
          if (v10 - 32 != a1)
          {
            long long v36 = *(_OWORD *)(v10 - 16);
            *(_OWORD *)a1 = *(_OWORD *)(v10 - 32);
            *(_OWORD *)(a1 + 16) = v36;
          }
          a4 = 0;
          *(double *)(v10 - 32) = v16;
          *(void *)(v10 - 8) = v100;
          *(_OWORD *)(v10 - 24) = v97;
        }
        uint64_t v17 = 0;
        uint64_t v99 = *(void *)(a1 + 24);
        long long v96 = *(_OWORD *)(a1 + 8);
        do
        {
          double v18 = *(double *)(a1 + v17 + 32);
          v17 += 32;
        }
        while (v18 < v16);
        unint64_t v19 = a1 + v17;
        v20 = a2;
        if (v17 == 32)
        {
          v20 = a2;
          do
          {
            if (v19 >= (unint64_t)v20) {
              break;
            }
            double v22 = v20[-2].n128_f64[0];
            v20 -= 2;
          }
          while (v22 >= v16);
        }
        else
        {
          do
          {
            double v21 = v20[-2].n128_f64[0];
            v20 -= 2;
          }
          while (v21 >= v16);
        }
        unint64_t v10 = a1 + v17;
        if (v19 < (unint64_t)v20)
        {
          v23 = v20;
          do
          {
            __n128 v103 = *(__n128 *)v10;
            __n128 v112 = *(__n128 *)(v10 + 16);
            __n128 v24 = v23[1];
            *(__n128 *)unint64_t v10 = *v23;
            *(__n128 *)(v10 + 16) = v24;
            __n128 *v23 = v103;
            v23[1] = v112;
            do
            {
              double v25 = *(double *)(v10 + 32);
              v10 += 32;
            }
            while (v25 < v16);
            do
            {
              double v26 = v23[-2].n128_f64[0];
              v23 -= 2;
            }
            while (v26 >= v16);
          }
          while (v10 < (unint64_t)v23);
        }
        if (v10 - 32 != a1)
        {
          long long v27 = *(_OWORD *)(v10 - 16);
          *(_OWORD *)a1 = *(_OWORD *)(v10 - 32);
          *(_OWORD *)(a1 + 16) = v27;
        }
        *(double *)(v10 - 32) = v16;
        *(void *)(v10 - 8) = v99;
        *(_OWORD *)(v10 - 24) = v96;
        if (v19 >= (unint64_t)v20) {
          break;
        }
LABEL_30:
        sub_100009D00(a1, v10 - 32, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v28 = sub_10000A5E4(a1, v10 - 32);
      if (sub_10000A5E4(v10, (uint64_t)a2)) {
        break;
      }
      if (!v28) {
        goto LABEL_30;
      }
    }
    a2 = (__n128 *)(v10 - 32);
    if (!v28) {
      continue;
    }
    break;
  }
}

double *sub_10000A540(double *result, double *a2, double *a3)
{
  double v3 = *a2;
  double v4 = *a3;
  if (*a2 >= *result)
  {
    if (v4 < v3)
    {
      long long v9 = *(_OWORD *)a2;
      long long v8 = *((_OWORD *)a2 + 1);
      long long v10 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v10;
      *(_OWORD *)a3 = v9;
      *((_OWORD *)a3 + 1) = v8;
      if (*a2 < *result)
      {
        long long v12 = *(_OWORD *)result;
        long long v11 = *((_OWORD *)result + 1);
        long long v13 = *((_OWORD *)a2 + 1);
        *(_OWORD *)result = *(_OWORD *)a2;
        *((_OWORD *)result + 1) = v13;
        *(_OWORD *)a2 = v12;
        *((_OWORD *)a2 + 1) = v11;
      }
    }
  }
  else
  {
    if (v4 >= v3)
    {
      long long v15 = *(_OWORD *)result;
      long long v14 = *((_OWORD *)result + 1);
      long long v16 = *((_OWORD *)a2 + 1);
      *(_OWORD *)result = *(_OWORD *)a2;
      *((_OWORD *)result + 1) = v16;
      *(_OWORD *)a2 = v15;
      *((_OWORD *)a2 + 1) = v14;
      if (*a3 >= *a2) {
        return result;
      }
      long long v6 = *(_OWORD *)a2;
      long long v5 = *((_OWORD *)a2 + 1);
      long long v17 = *((_OWORD *)a3 + 1);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((_OWORD *)a2 + 1) = v17;
    }
    else
    {
      long long v6 = *(_OWORD *)result;
      long long v5 = *((_OWORD *)result + 1);
      long long v7 = *((_OWORD *)a3 + 1);
      *(_OWORD *)result = *(_OWORD *)a3;
      *((_OWORD *)result + 1) = v7;
    }
    *(_OWORD *)a3 = v6;
    *((_OWORD *)a3 + 1) = v5;
  }
  return result;
}

BOOL sub_10000A5E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 5;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      long long v6 = (__n128 *)(a2 - 32);
      if (*(double *)(a2 - 32) < *(double *)a1)
      {
        __n128 v8 = *(__n128 *)a1;
        long long v7 = *(_OWORD *)(a1 + 16);
        long long v9 = *(_OWORD *)(a2 - 16);
        *(__n128 *)a1 = *v6;
        *(_OWORD *)(a1 + 16) = v9;
        __n128 *v6 = v8;
        *(_OWORD *)(a2 - 16) = v7;
      }
      return result;
    case 3:
      sub_10000A540((double *)a1, (double *)(a1 + 32), (double *)(a2 - 32));
      return 1;
    case 4:
      sub_10000A858((__n128 *)a1, (__n128 *)(a1 + 32), (__n128 *)(a1 + 64), (__n128 *)(a2 - 32));
      return 1;
    case 5:
      unint64_t v19 = (__n128 *)(a1 + 32);
      v20 = (__n128 *)(a1 + 64);
      double v21 = (__n128 *)(a1 + 96);
      sub_10000A858((__n128 *)a1, (__n128 *)(a1 + 32), (__n128 *)(a1 + 64), (__n128 *)(a1 + 96));
      double v23 = *(double *)(a2 - 32);
      double v22 = (__n128 *)(a2 - 32);
      if (v23 < *(double *)(a1 + 96))
      {
        __n128 v25 = *v21;
        __n128 v24 = *(__n128 *)(a1 + 112);
        __n128 v26 = v22[1];
        __n128 *v21 = *v22;
        *(__n128 *)(a1 + 112) = v26;
        __n128 *v22 = v25;
        v22[1] = v24;
        if (v21->n128_f64[0] < v20->n128_f64[0])
        {
          __n128 v28 = *v20;
          long long v27 = *(_OWORD *)(a1 + 80);
          long long v29 = *(_OWORD *)(a1 + 112);
          __n128 *v20 = *v21;
          *(_OWORD *)(a1 + 80) = v29;
          __n128 *v21 = v28;
          *(_OWORD *)(a1 + 112) = v27;
          if (v20->n128_f64[0] < v19->n128_f64[0])
          {
            __n128 v31 = *v19;
            long long v30 = *(_OWORD *)(a1 + 48);
            long long v32 = *(_OWORD *)(a1 + 80);
            __n128 *v19 = *v20;
            *(_OWORD *)(a1 + 48) = v32;
            __n128 *v20 = v31;
            *(_OWORD *)(a1 + 80) = v30;
            if (*(double *)(a1 + 32) < *(double *)a1)
            {
              __n128 v34 = *(__n128 *)a1;
              long long v33 = *(_OWORD *)(a1 + 16);
              long long v35 = *(_OWORD *)(a1 + 48);
              *(__n128 *)a1 = *v19;
              *(_OWORD *)(a1 + 16) = v35;
              __n128 *v19 = v34;
              *(_OWORD *)(a1 + 48) = v33;
            }
          }
        }
      }
      return 1;
    default:
      long long v10 = (double *)(a1 + 64);
      sub_10000A540((double *)a1, (double *)(a1 + 32), (double *)(a1 + 64));
      uint64_t v11 = a1 + 96;
      if (a1 + 96 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    double v14 = *(double *)v11;
    if (*(double *)v11 < *v10)
    {
      long long v36 = *(_OWORD *)(v11 + 8);
      uint64_t v37 = *(void *)(v11 + 24);
      uint64_t v15 = v12;
      while (1)
      {
        uint64_t v16 = a1 + v15;
        long long v17 = *(_OWORD *)(a1 + v15 + 80);
        *(_OWORD *)(v16 + 96) = *(_OWORD *)(a1 + v15 + 64);
        *(_OWORD *)(v16 + 112) = v17;
        if (v15 == -64) {
          break;
        }
        v15 -= 32;
        if (v14 >= *(double *)(v16 + 32))
        {
          uint64_t v18 = a1 + v15 + 96;
          goto LABEL_12;
        }
      }
      uint64_t v18 = a1;
LABEL_12:
      *(double *)uint64_t v18 = v14;
      *(_OWORD *)(v18 + 8) = v36;
      *(void *)(v18 + 24) = v37;
      if (++v13 == 8) {
        return v11 + 32 == a2;
      }
    }
    long long v10 = (double *)v11;
    v12 += 32;
    v11 += 32;
    if (v11 == a2) {
      return 1;
    }
  }
}

__n128 sub_10000A858(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4)
{
  sub_10000A540(a1->n128_f64, a2->n128_f64, a3->n128_f64);
  result.n128_u64[0] = a4->n128_u64[0];
  if (a4->n128_f64[0] < a3->n128_f64[0])
  {
    __n128 v9 = *a3;
    __n128 result = a3[1];
    __n128 v10 = a4[1];
    *a3 = *a4;
    a3[1] = v10;
    *a4 = v9;
    a4[1] = result;
    result.n128_u64[0] = a3->n128_u64[0];
    if (a3->n128_f64[0] < a2->n128_f64[0])
    {
      __n128 v11 = *a2;
      __n128 result = a2[1];
      __n128 v12 = a3[1];
      *a2 = *a3;
      a2[1] = v12;
      *a3 = v11;
      a3[1] = result;
      result.n128_u64[0] = a2->n128_u64[0];
      if (a2->n128_f64[0] < a1->n128_f64[0])
      {
        __n128 v13 = *a1;
        __n128 result = a1[1];
        __n128 v14 = a2[1];
        *a1 = *a2;
        a1[1] = v14;
        *a2 = v13;
        a2[1] = result;
      }
    }
  }
  return result;
}

void sub_10000A8F8()
{
}

void sub_10000A910(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000A96C(exception, a1);
}

void sub_10000A958(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000A96C(std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  return result;
}

void *sub_10000A9A0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_10000A9D8();
  }
  return operator new(32 * a2);
}

void sub_10000A9D8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_10000AA0C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    long long v6 = result;
    __n128 result = sub_10000AA88(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10000AA6C(_Unwind_Exception *exception_object)
{
  double v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_10000AA88(void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_10000A8F8();
  }
  __n128 result = (char *)sub_10000A9A0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void sub_10000AACC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.corelocation.CoreLocationMapLNPromptPlugin", "Prompt");
  v2 = (void *)qword_100015DB0;
  qword_100015DB0 = (uint64_t)v1;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  MKMapPoint v3 = _MKMapPointForCoordinate(coordinate);
  double y = v3.y;
  double x = v3.x;
  result.double y = y;
  result.double x = x;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_allowedClassesForUnarchiving(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForUnarchiving];
}

id objc_msgSend_annotation(void *a1, const char *a2, ...)
{
  return [a1 annotation];
}

id objc_msgSend_annotationDict(void *a1, const char *a2, ...)
{
  return [a1 annotationDict];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizationPromptMapDisplayEnabled(void *a1, const char *a2, ...)
{
  return [a1 authorizationPromptMapDisplayEnabled];
}

id objc_msgSend_backgroundPlatter1(void *a1, const char *a2, ...)
{
  return [a1 backgroundPlatter1];
}

id objc_msgSend_backgroundPlatter2(void *a1, const char *a2, ...)
{
  return [a1 backgroundPlatter2];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_calloutFrame(void *a1, const char *a2, ...)
{
  return [a1 calloutFrame];
}

id objc_msgSend_calloutIconSize(void *a1, const char *a2, ...)
{
  return [a1 calloutIconSize];
}

id objc_msgSend_calloutImageView(void *a1, const char *a2, ...)
{
  return [a1 calloutImageView];
}

id objc_msgSend_callouts(void *a1, const char *a2, ...)
{
  return [a1 callouts];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_cgColor(void *a1, const char *a2, ...)
{
  return [a1 cgColor];
}

id objc_msgSend_clientDict(void *a1, const char *a2, ...)
{
  return [a1 clientDict];
}

id objc_msgSend_configureCallouts(void *a1, const char *a2, ...)
{
  return [a1 configureCallouts];
}

id objc_msgSend_configureMapSubLabels(void *a1, const char *a2, ...)
{
  return [a1 configureMapSubLabels];
}

id objc_msgSend_configureMapView(void *a1, const char *a2, ...)
{
  return [a1 configureMapView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_demandCreateLocationManager(void *a1, const char *a2, ...)
{
  return [a1 demandCreateLocationManager];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_extensionInputItems(void *a1, const char *a2, ...)
{
  return [a1 extensionInputItems];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locManager(void *a1, const char *a2, ...)
{
  return [a1 locManager];
}

id objc_msgSend_mainPlatterView(void *a1, const char *a2, ...)
{
  return [a1 mainPlatterView];
}

id objc_msgSend_mapSubLabel(void *a1, const char *a2, ...)
{
  return [a1 mapSubLabel];
}

id objc_msgSend_mapSubMessageString(void *a1, const char *a2, ...)
{
  return [a1 mapSubMessageString];
}

id objc_msgSend_mapType(void *a1, const char *a2, ...)
{
  return [a1 mapType];
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return [a1 mapView];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return [a1 rect];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_secondSubtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 secondSubtitleLabel];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_setupPlatters(void *a1, const char *a2, ...)
{
  return [a1 setupPlatters];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_showBackgroundPlatters(void *a1, const char *a2, ...)
{
  return [a1 showBackgroundPlatters];
}

id objc_msgSend_showMapView(void *a1, const char *a2, ...)
{
  return [a1 showMapView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_updateMapLayout(void *a1, const char *a2, ...)
{
  return [a1 updateMapLayout];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleBounds(void *a1, const char *a2, ...)
{
  return [a1 visibleBounds];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}