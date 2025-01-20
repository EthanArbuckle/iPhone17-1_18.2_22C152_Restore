CGImageRef sub_3C98(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  CFStringRef v17;
  CGImageRef v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  id v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  char *v38;
  int v39;
  int *v40;
  int v41;
  int v42;
  int *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  __CFString *v47;
  long long v48;
  long long v49;
  long long v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v52 = 0;
  v53 = 0;
  v51 = 0;
  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  v47 = 0;
  v10 = (__CFString *)v9;
  v11 = [v8 isEqualToString:@"L"];
  v12 = [v8 isEqualToString:@"Q"];
  v13 = [v8 isEqualToString:@"H"];
  v14 = v11 ^ 1;
  if (v12) {
    v14 = 2;
  }
  v15 = 3;
  if (v13) {
    v16 = 3;
  }
  else {
    v16 = v14;
  }
  if (v7)
  {
    LODWORD(v48) = 4;
    *((void *)&v48 + 1) = 0;
    *(void *)&v49 = -1;
    *((void *)&v49 + 1) = -1;
    *(void *)&v50 = -1;
    DWORD2(v50) = -1;
    v51 = 0;
    switch(v16)
    {
      case 1:
        v15 = 0;
        LODWORD(v46) = 1;
        v17 = @"M";
        break;
      case 2:
        LODWORD(v46) = 2;
        v17 = @"Q";
        break;
      case 3:
        LODWORD(v46) = 3;
        v17 = @"H";
        v15 = 2;
        break;
      default:
        LODWORD(v46) = 0;
        v17 = @"L";
        v15 = 1;
        break;
    }
    HIDWORD(v46) = v15;
    v47 = (__CFString *)v17;
    if (v9) {
      v20 = v10;
    }
    else {
      v20 = @"ISO-8859-1";
    }
    if ([(__CFString *)v20 isEqualToString:v46])
    {
LABEL_25:
      v23 = v7;
      v19 = v20;
      v24 = 10 * (void)[v23 length];
      if (v24 > 0x114FE)
      {
        v25 = sub_ACDC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_10CAC(v25, v26, v27, v28, v29, v30, v31, v32);
        }

LABEL_29:
        goto LABEL_30;
      }
      v34 = v24 / 3 + 12;
      v35 = 1;
      do
      {
        if (v35 == 4) {
          goto LABEL_29;
        }
        v36 = dword_15AE8[4 * dword_15D68[v35++] - 4 + v16];
      }
      while (v34 >= v36);
      if ((v35 - 2) > 2) {
        goto LABEL_29;
      }
      v37 = v35 - 2;
      v38 = (char *)&dword_15AE8[v16];
      while (1)
      {
        v52 = 0;
        v53 = 0;
        if (a4)
        {
          if (sub_44FC(v23, &v52, v37, v19)) {
            goto LABEL_41;
          }
        }
        else
        {
          v39 = sub_F128(v23, v19);
          if (sub_6BB0(v23, &v52, v39, v37, v19))
          {
LABEL_41:
            v40 = &dword_15D68[v37];
            v42 = *v40;
            v41 = v40[1];
            if (v42 > v41) {
              v41 = v42;
            }
            v43 = (int *)&v38[16 * v42];
            v44 = v41 - (uint64_t)v42;
            while (v44)
            {
              v45 = *v43;
              v43 += 4;
              ++v42;
              --v44;
              if (v45 >= (int)v52)
              {

                if (v42 < 0
                  || !sub_4A90(v42, (int *)&v46, (uint64_t)&v48)
                  || !sub_4358(v50, (unsigned int *)&v52))
                {
                  goto LABEL_30;
                }
                v18 = sub_6ED4((uint64_t)&v48, (uint64_t)&v52);
                if (v53) {
                  free(v53);
                }
                goto LABEL_31;
              }
            }
          }
        }
        if (++v37 == 3) {
          goto LABEL_29;
        }
      }
    }
    v19 = v20;
    if ([(__CFString *)v19 isEqualToString:@"Cp437"])
    {
      v21 = 0;
      v22 = @"Cp437";
      goto LABEL_24;
    }
    if ([(__CFString *)v19 isEqualToString:@"ISO8859_1"])
    {
      v22 = @"ISO8859_1";
    }
    else
    {
      if (([(__CFString *)v19 isEqualToString:@"ISO-8859-1"] & 1) == 0)
      {
        if ([(__CFString *)v19 isEqualToString:@"Cp437"])
        {
          v22 = @"Cp437";
          v21 = 2;
        }
        else if (([(__CFString *)v19 isEqualToString:@"ISO8859_1"] & 1) != 0 {
               || ([(__CFString *)v19 isEqualToString:@"ISO-8859_1"] & 1) != 0)
        }
        {
          v22 = @"ISO8859_1";
          v21 = 3;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_2"])
        {
          v22 = @"ISO8859_2";
          v21 = 4;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_3"])
        {
          v22 = @"ISO8859_3";
          v21 = 5;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_4"])
        {
          v22 = @"ISO8859_4";
          v21 = 6;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_5"])
        {
          v22 = @"ISO8859_5";
          v21 = 7;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_6"])
        {
          v22 = @"ISO8859_6";
          v21 = 8;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_7"])
        {
          v22 = @"ISO8859_7";
          v21 = 9;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_8"])
        {
          v22 = @"ISO8859_8";
          v21 = 10;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_9"])
        {
          v22 = @"ISO8859_9";
          v21 = 11;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_10"])
        {
          v22 = @"ISO8859_10";
          v21 = 12;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_11"])
        {
          v22 = @"ISO8859_11";
          v21 = 13;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_13"])
        {
          v22 = @"ISO8859_13";
          v21 = 15;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_14"])
        {
          v22 = @"ISO8859_14";
          v21 = 16;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_15"])
        {
          v22 = @"ISO8859_15";
          v21 = 17;
        }
        else if ([(__CFString *)v19 isEqualToString:@"ISO8859_16"])
        {
          v22 = @"ISO8859_16";
          v21 = 18;
        }
        else if ([(__CFString *)v19 isEqualToString:@"SJIS"])
        {
          v22 = @"SJIS";
          v21 = 20;
        }
        else
        {
          v22 = @"Shift_JIS";
          if ([(__CFString *)v19 isEqualToString:@"Shift_JIS"])
          {
            v21 = 20;
          }
          else
          {
            v22 = &stru_1D5B8;
            v21 = 0;
          }
        }
LABEL_24:

        if (!sub_EEB0(v21, v22, &v52))
        {
LABEL_30:
          v18 = 0;
          goto LABEL_31;
        }
        goto LABEL_25;
      }
      v22 = @"ISO8859-1";
    }
    v21 = 1;
    goto LABEL_24;
  }
  v18 = 0;
  v19 = v10;
LABEL_31:

  return v18;
}

void sub_4330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_4358(int a1, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  int v4 = 8 * a1;
  if ((int)sub_66CC(a2) <= 8 * a1)
  {
    int v14 = 4;
    do
    {
      if ((int)sub_66CC(a2) >= v4) {
        break;
      }
      if ((sub_9668(a2, 0) & 1) == 0) {
        return 0;
      }
      --v14;
    }
    while (v14);
    int v15 = sub_66CC(a2);
    if (v15 <= 0) {
      int v16 = -(-v15 & 7);
    }
    else {
      int v16 = v15 & 7;
    }
    if (v16 >= 1)
    {
      int v17 = v16 - 8;
      while ((sub_9668(a2, 0) & 1) != 0)
      {
        if (__CFADD__(v17++, 1)) {
          goto LABEL_18;
        }
      }
      return 0;
    }
LABEL_18:
    if ((sub_66CC(a2) & 7) != 0)
    {
      v5 = sub_ACDC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10E14(v5, v19, v20, v21, v22, v23, v24, v25);
      }
    }
    else
    {
      int v26 = a1 - sub_9840(a2);
      if (v26 >= 1)
      {
        for (int i = 0; i != v26; ++i)
        {
          if (i)
          {
            uint64_t result = sub_95A0(a2, 17, 8u);
            if (!result) {
              return result;
            }
          }
          else if ((sub_95A0(a2, 236, 8u) & 1) == 0)
          {
            return 0;
          }
        }
      }
      if (sub_66CC(a2) == v4) {
        return 1;
      }
      v5 = sub_ACDC();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_10D9C(v5, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }
  else
  {
    v5 = sub_ACDC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10D24(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

  return 0;
}

uint64_t sub_44FC(void *a1, void *a2, int a3, void *a4)
{
  v55 = a2;
  id v6 = a1;
  id v58 = a4;
  int v7 = dword_15D90[a3] + 4;
  LODWORD(v70) = dword_15D84[a3] + 4;
  HIDWORD(v70) = v7;
  int v56 = a3;
  int v71 = dword_15D9C[a3] + 4;
  int v69 = 3;
  uint64_t v68 = 0x300000004;
  uint64_t v67 = 0x500000006;
  int v63 = 8;
  v66[0] = &v68;
  v66[1] = &v67;
  v66[2] = &v63;
  id v8 = v6;
  uint64_t v9 = (unsigned __int8 *)[v8 bytes];
  id v60 = v8;
  v57 = &v55;
  id v61 = (id)([v8 length] + 1);
  uint64_t v10 = __chkstk_darwin();
  uint64_t v12 = (char *)&v55 - v11;
  int v65 = 0;
  uint64_t v64 = 0;
  *(void *)uint64_t v12 = v70;
  v62 = (char *)&v55 - v11;
  *((_DWORD *)v12 + 2) = v71;
  uint64_t v59 = v10;
  if ((int)v10 >= 1)
  {
    uint64_t v13 = v59;
    int v14 = v62 + 12;
    do
    {
      memset_pattern16(v14, &unk_163C0, 0xCuLL);
      v14 += 12;
      --v13;
    }
    while (v13);
    uint64_t v15 = 1;
    int v16 = v62;
    do
    {
      uint64_t v17 = 0;
      v18 = &v62[12 * v15];
      do
      {
        if (((unsigned int (*)(void))off_1C648[v17])(v9[v15 - 1]))
        {
          uint64_t v19 = 0;
          uint64_t v20 = (_DWORD *)v66[v17];
          int v21 = *((_DWORD *)&v64 + v17);
          int v22 = 23649;
          do
          {
            if (v17 != v19 && *(_DWORD *)&v16[4 * v19] < v22) {
              int v22 = *(_DWORD *)&v16[4 * v19];
            }
            ++v19;
          }
          while (v19 != 3);
          int v23 = v20[v21 % dword_15DA8[v17]] + *(_DWORD *)&v18[4 * v17 - 12];
          int v24 = *((_DWORD *)&v70 + v17) + v22 + *v20;
          if (v23 <= v24)
          {
            *(_DWORD *)&v18[4 * v17] = v23;
            int v25 = v21 + 1;
          }
          else
          {
            *(_DWORD *)&v18[4 * v17] = v24;
            int v25 = 1;
          }
          *((_DWORD *)&v64 + v17) = v25;
        }
        ++v17;
      }
      while (v17 != 3);
      ++v15;
      v16 += 12;
    }
    while ((id)v15 != v61);
  }
  uint64_t v26 = 0;
  LODWORD(v27) = v59;
  LODWORD(v28) = -1;
  int v29 = 23649;
  do
  {
    int v30 = *(_DWORD *)&v62[12 * (int)v59 + 4 * v26];
    if (v30 >= v29) {
      uint64_t v28 = v28;
    }
    else {
      uint64_t v28 = v26;
    }
    if (v30 < v29) {
      int v29 = *(_DWORD *)&v62[12 * (int)v59 + 4 * v26];
    }
    ++v26;
  }
  while (v26 != 3);
  if (v28 == -1)
  {
    uint64_t v50 = 0;
    v43 = v58;
  }
  else
  {
    uint64_t v31 = +[NSMutableArray array];
    id v61 = +[NSMutableArray array];
    unsigned int v32 = v27 - 1;
    if ((int)v27 >= 1)
    {
      uint64_t v27 = v27;
      do
      {
        uint64_t v33 = v28;
        int v34 = *(_DWORD *)&v62[12 * v27 + 4 * (int)v28] - (*((_DWORD *)&v70 + (int)v28) + *(_DWORD *)v66[(int)v28]);
        uint64_t v28 = 0;
        while (v33 == v28 || *(_DWORD *)&v62[12 * v32 + 4 * v28] != v34)
        {
          if (++v28 == 3)
          {
            uint64_t v28 = v33;
            goto LABEL_34;
          }
        }
        v35 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
        [v31 addObject:v35];

        v36 = +[NSNumber numberWithInt:(v27 - 1)];
        [v61 addObject:v36];

LABEL_34:
        --v32;
      }
      while (v27-- > 1);
    }
    v38 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v28, v55);
    [v31 addObject:v38];

    v39 = +[NSNumber numberWithInt:0];
    [v61 addObject:v39];

    v40 = v55;
    void *v55 = 0;
    v40[1] = 0;
    signed int v41 = 0;
    v42 = (char *)[v31 count] - 2;
    v43 = v58;
    int v44 = v56;
    while ((uint64_t)(v42 + 1) >= 1)
    {
      v45 = objc_msgSend(v31, "objectAtIndex:");
      int v46 = dword_15D78[(int)[v45 intValue]];

      v47 = [v61 objectAtIndex:v42];
      unsigned int v48 = [v47 intValue];

      v49 = objc_msgSend(v60, "subdataWithRange:", v41, (int)(v48 - v41));
      LOBYTE(v46) = sub_6BB0(v49, v40, v46, v44, v43);

      --v42;
      signed int v41 = v48;
      if ((v46 & 1) == 0)
      {
        uint64_t v50 = 0;
        goto LABEL_42;
      }
    }
    v51 = [v31 objectAtIndex:0];
    int v52 = dword_15D78[(int)[v51 intValue]];

    v53 = objc_msgSend(v60, "subdataWithRange:", v41, (int)v59 - v41);
    uint64_t v50 = sub_6BB0(v53, v40, v52, v44, v43);

LABEL_42:
  }

  return v50;
}

BOOL sub_4A50(int a1)
{
  return (a1 - 48) < 0xA;
}

uint64_t sub_4A60()
{
  return 1;
}

BOOL sub_4A68(int a1)
{
  return a1 <= 95 && dword_15968[a1] != -1;
}

uint64_t sub_4A90(int a1, int *a2, uint64_t a3)
{
  BOOL v3 = (a1 - 1) >= 0x28 || a3 == 0;
  uint64_t v4 = !v3;
  if (!v3)
  {
    int v26 = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    __n128 v19 = 0u;
    sub_4BD4(a1, (uint64_t)&v19);
    __n128 v17 = 0uLL;
    int v18 = 0;
    long long v13 = v23;
    long long v14 = v24;
    long long v15 = v25;
    int v16 = v26;
    __n128 v9 = v19;
    long long v10 = v20;
    long long v11 = v21;
    long long v12 = v22;
    sub_56D0((uint64_t)&v9, a2, &v17);
    *(void *)(a3 + 8) = a2;
    *(_DWORD *)(a3 + 16) = a1;
    *(_DWORD *)(a3 + 28) = v26;
    __n128 v9 = v17;
    LODWORD(v10) = v18;
    *(_DWORD *)(a3 + 36) = sub_72D8(&v9);
    __n128 v9 = v17;
    LODWORD(v10) = v18;
    *(_DWORD *)(a3 + 40) = sub_72EC((uint64_t)&v9);
    long long v13 = v23;
    long long v14 = v24;
    long long v15 = v25;
    int v16 = v26;
    __n128 v9 = v19;
    long long v10 = v20;
    long long v11 = v21;
    long long v12 = v22;
    *(_DWORD *)(a3 + 20) = sub_56F0(&v9);
    *(_DWORD *)(a3 + 32) = *(_DWORD *)(a3 + 28) - *(_DWORD *)(a3 + 36);
  }
  return v4;
}

void sub_4BD4(int a1@<W0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 112) = 0;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  if ((a1 - 41) > 0xFFFFFFD7)
  {
    switch(a1)
    {
      case 1:
        *(_DWORD *)a2 = 1;
        long long v3 = xmmword_15240;
        long long v4 = xmmword_15250;
        long long v5 = xmmword_15260;
        long long v6 = xmmword_15270;
        long long v7 = xmmword_15280;
        goto LABEL_46;
      case 2:
        *(void *)a2 = 0x600000002;
        *(_DWORD *)(a2 + 8) = 18;
        long long v3 = xmmword_151F0;
        long long v4 = xmmword_15200;
        long long v5 = xmmword_15210;
        long long v6 = xmmword_15220;
        long long v7 = xmmword_15230;
        goto LABEL_46;
      case 3:
        *(void *)a2 = 0x600000003;
        *(_DWORD *)(a2 + 8) = 22;
        long long v3 = xmmword_151B0;
        long long v4 = xmmword_151C0;
        long long v5 = xmmword_150A0;
        long long v6 = xmmword_151D0;
        long long v7 = xmmword_151E0;
        goto LABEL_46;
      case 4:
        *(void *)a2 = 0x600000004;
        *(_DWORD *)(a2 + 8) = 22;
        long long v3 = xmmword_15160;
        long long v4 = xmmword_15170;
        long long v5 = xmmword_15180;
        long long v6 = xmmword_15190;
        long long v7 = xmmword_151A0;
        goto LABEL_46;
      case 5:
        *(void *)a2 = 0x600000005;
        *(_DWORD *)(a2 + 8) = 30;
        long long v3 = xmmword_15120;
        long long v4 = xmmword_15130;
        long long v5 = xmmword_150A0;
        long long v6 = xmmword_15140;
        long long v7 = xmmword_15150;
        goto LABEL_46;
      case 6:
        *(void *)a2 = 0x600000006;
        *(_DWORD *)(a2 + 8) = 34;
        long long v3 = xmmword_150D0;
        long long v4 = xmmword_150E0;
        long long v5 = xmmword_150F0;
        long long v6 = xmmword_15100;
        long long v7 = xmmword_15110;
        goto LABEL_46;
      case 7:
        *(_OWORD *)a2 = xmmword_15070;
        long long v3 = xmmword_15080;
        long long v4 = xmmword_15090;
        long long v5 = xmmword_150A0;
        long long v6 = xmmword_150B0;
        long long v7 = xmmword_150C0;
        goto LABEL_46;
      case 8:
        *(_OWORD *)a2 = xmmword_15010;
        long long v3 = xmmword_15020;
        long long v4 = xmmword_15030;
        long long v5 = xmmword_15040;
        long long v6 = xmmword_15050;
        long long v7 = xmmword_15060;
        goto LABEL_46;
      case 9:
        *(_OWORD *)a2 = xmmword_14FB0;
        long long v3 = xmmword_14FC0;
        long long v4 = xmmword_14FD0;
        long long v5 = xmmword_14FE0;
        long long v6 = xmmword_14FF0;
        long long v7 = xmmword_15000;
        goto LABEL_46;
      case 10:
        *(_OWORD *)a2 = xmmword_14F50;
        long long v3 = xmmword_14F60;
        long long v4 = xmmword_14F70;
        long long v5 = xmmword_14F80;
        long long v6 = xmmword_14F90;
        long long v7 = xmmword_14FA0;
        goto LABEL_46;
      case 11:
        *(_OWORD *)a2 = xmmword_14EF0;
        long long v3 = xmmword_14F00;
        long long v4 = xmmword_14F10;
        long long v5 = xmmword_14F20;
        long long v6 = xmmword_14F30;
        long long v7 = xmmword_14F40;
        goto LABEL_46;
      case 12:
        *(_OWORD *)a2 = xmmword_14E90;
        long long v3 = xmmword_14EA0;
        long long v4 = xmmword_14EB0;
        long long v5 = xmmword_14EC0;
        long long v6 = xmmword_14ED0;
        long long v7 = xmmword_14EE0;
        goto LABEL_46;
      case 13:
        *(_OWORD *)a2 = xmmword_14E30;
        long long v3 = xmmword_14E40;
        long long v4 = xmmword_14E50;
        long long v5 = xmmword_14E60;
        long long v6 = xmmword_14E70;
        long long v7 = xmmword_14E80;
        goto LABEL_46;
      case 14:
        *(_OWORD *)a2 = xmmword_14DD0;
        *(_DWORD *)(a2 + 16) = 66;
        long long v3 = xmmword_14DE0;
        long long v4 = xmmword_14DF0;
        long long v5 = xmmword_14E00;
        long long v6 = xmmword_14E10;
        long long v7 = xmmword_14E20;
        goto LABEL_46;
      case 15:
        *(_OWORD *)a2 = xmmword_14D70;
        *(_DWORD *)(a2 + 16) = 70;
        long long v3 = xmmword_14D80;
        long long v4 = xmmword_14D90;
        long long v5 = xmmword_14DA0;
        long long v6 = xmmword_14DB0;
        long long v7 = xmmword_14DC0;
        goto LABEL_46;
      case 16:
        *(_OWORD *)a2 = xmmword_14D10;
        *(_DWORD *)(a2 + 16) = 74;
        long long v3 = xmmword_14D20;
        long long v4 = xmmword_14D30;
        long long v5 = xmmword_14D40;
        long long v6 = xmmword_14D50;
        long long v7 = xmmword_14D60;
        goto LABEL_46;
      case 17:
        *(_OWORD *)a2 = xmmword_14CB0;
        *(_DWORD *)(a2 + 16) = 78;
        long long v3 = xmmword_14CC0;
        long long v4 = xmmword_14CD0;
        long long v5 = xmmword_14CE0;
        long long v6 = xmmword_14CF0;
        long long v7 = xmmword_14D00;
        goto LABEL_46;
      case 18:
        *(_OWORD *)a2 = xmmword_14C50;
        *(_DWORD *)(a2 + 16) = 82;
        long long v3 = xmmword_14C60;
        long long v4 = xmmword_14C70;
        long long v5 = xmmword_14C80;
        long long v6 = xmmword_14C90;
        long long v7 = xmmword_14CA0;
        goto LABEL_46;
      case 19:
        *(_OWORD *)a2 = xmmword_14BF0;
        *(_DWORD *)(a2 + 16) = 86;
        long long v3 = xmmword_14C00;
        long long v4 = xmmword_14C10;
        long long v5 = xmmword_14C20;
        long long v6 = xmmword_14C30;
        long long v7 = xmmword_14C40;
        goto LABEL_46;
      case 20:
        *(_OWORD *)a2 = xmmword_14B90;
        *(_DWORD *)(a2 + 16) = 90;
        long long v3 = xmmword_14BA0;
        long long v4 = xmmword_14BB0;
        long long v5 = xmmword_14BC0;
        long long v6 = xmmword_14BD0;
        long long v7 = xmmword_14BE0;
        goto LABEL_46;
      case 21:
        *(_OWORD *)a2 = xmmword_14B40;
        *(void *)(a2 + 16) = 0x5E00000048;
        long long v3 = xmmword_14B50;
        long long v4 = xmmword_149A0;
        long long v5 = xmmword_14B60;
        long long v6 = xmmword_14B70;
        long long v7 = xmmword_14B80;
        goto LABEL_46;
      case 22:
        *(_OWORD *)a2 = xmmword_14AE0;
        *(void *)(a2 + 16) = 0x620000004ALL;
        long long v3 = xmmword_14AF0;
        long long v4 = xmmword_14B00;
        long long v5 = xmmword_14B10;
        long long v6 = xmmword_14B20;
        long long v7 = xmmword_14B30;
        goto LABEL_46;
      case 23:
        *(_OWORD *)a2 = xmmword_14A90;
        *(void *)(a2 + 16) = 0x660000004ALL;
        long long v3 = xmmword_14AA0;
        long long v4 = xmmword_14520;
        long long v5 = xmmword_14AB0;
        long long v6 = xmmword_14AC0;
        long long v7 = xmmword_14AD0;
        goto LABEL_46;
      case 24:
        *(_OWORD *)a2 = xmmword_14A30;
        *(void *)(a2 + 16) = 0x6A00000050;
        long long v3 = xmmword_14A40;
        long long v4 = xmmword_14A50;
        long long v5 = xmmword_14A60;
        long long v6 = xmmword_14A70;
        long long v7 = xmmword_14A80;
        goto LABEL_46;
      case 25:
        *(_OWORD *)a2 = xmmword_149E0;
        *(void *)(a2 + 16) = 0x6E00000054;
        long long v3 = xmmword_149F0;
        long long v4 = xmmword_144B0;
        long long v5 = xmmword_14A00;
        long long v6 = xmmword_14A10;
        long long v7 = xmmword_14A20;
        goto LABEL_46;
      case 26:
        *(_OWORD *)a2 = xmmword_14980;
        *(void *)(a2 + 16) = 0x7200000056;
        long long v3 = xmmword_14990;
        long long v4 = xmmword_149A0;
        long long v5 = xmmword_149B0;
        long long v6 = xmmword_149C0;
        long long v7 = xmmword_149D0;
        goto LABEL_46;
      case 27:
        *(_OWORD *)a2 = xmmword_14920;
        *(void *)(a2 + 16) = 0x760000005ALL;
        long long v3 = xmmword_14930;
        long long v4 = xmmword_14940;
        long long v5 = xmmword_14950;
        long long v6 = xmmword_14960;
        long long v7 = xmmword_14970;
        goto LABEL_46;
      case 28:
        *(_OWORD *)a2 = xmmword_148C0;
        *(void *)(a2 + 16) = 0x620000004ALL;
        long long v3 = xmmword_148D0;
        long long v4 = xmmword_148E0;
        long long v5 = xmmword_148F0;
        long long v6 = xmmword_14900;
        long long v7 = xmmword_14910;
        goto LABEL_46;
      case 29:
        *(_OWORD *)a2 = xmmword_14860;
        *(void *)(a2 + 16) = 0x660000004ELL;
        *(_DWORD *)(a2 + 24) = 126;
        long long v3 = xmmword_14870;
        long long v4 = xmmword_14880;
        long long v5 = xmmword_14890;
        long long v6 = xmmword_148A0;
        long long v7 = xmmword_148B0;
        goto LABEL_46;
      case 30:
        *(_OWORD *)a2 = xmmword_14800;
        *(void *)(a2 + 16) = 0x680000004ELL;
        *(_DWORD *)(a2 + 24) = 130;
        long long v3 = xmmword_14810;
        long long v4 = xmmword_14820;
        long long v5 = xmmword_14830;
        long long v6 = xmmword_14840;
        long long v7 = xmmword_14850;
        goto LABEL_46;
      case 31:
        *(_OWORD *)a2 = xmmword_147A0;
        *(void *)(a2 + 16) = 0x6C00000052;
        *(_DWORD *)(a2 + 24) = 134;
        long long v3 = xmmword_147B0;
        long long v4 = xmmword_147C0;
        long long v5 = xmmword_147D0;
        long long v6 = xmmword_147E0;
        long long v7 = xmmword_147F0;
        goto LABEL_46;
      case 32:
        *(_OWORD *)a2 = xmmword_14740;
        *(void *)(a2 + 16) = 0x7000000056;
        *(_DWORD *)(a2 + 24) = 138;
        long long v3 = xmmword_14750;
        long long v4 = xmmword_14760;
        long long v5 = xmmword_14770;
        long long v6 = xmmword_14780;
        long long v7 = xmmword_14790;
        goto LABEL_46;
      case 33:
        *(_OWORD *)a2 = xmmword_146F0;
        *(void *)(a2 + 16) = 0x7200000056;
        *(_DWORD *)(a2 + 24) = 142;
        long long v3 = xmmword_14700;
        long long v4 = xmmword_14710;
        long long v5 = xmmword_14720;
        long long v6 = xmmword_146D0;
        long long v7 = xmmword_14730;
        goto LABEL_46;
      case 34:
        *(_OWORD *)a2 = xmmword_14690;
        *(void *)(a2 + 16) = 0x760000005ALL;
        *(_DWORD *)(a2 + 24) = 146;
        long long v3 = xmmword_146A0;
        long long v4 = xmmword_146B0;
        long long v5 = xmmword_146C0;
        long long v6 = xmmword_146D0;
        long long v7 = xmmword_146E0;
        goto LABEL_46;
      case 35:
        *(_OWORD *)a2 = xmmword_14630;
        *(_OWORD *)(a2 + 16) = xmmword_14640;
        long long v3 = xmmword_14650;
        long long v4 = xmmword_14520;
        long long v5 = xmmword_14660;
        long long v6 = xmmword_14670;
        long long v7 = xmmword_14680;
        goto LABEL_46;
      case 36:
        *(_OWORD *)a2 = xmmword_145D0;
        *(_OWORD *)(a2 + 16) = xmmword_145E0;
        long long v3 = xmmword_145F0;
        long long v4 = xmmword_14590;
        long long v5 = xmmword_14600;
        long long v6 = xmmword_14610;
        long long v7 = xmmword_14620;
        goto LABEL_46;
      case 37:
        *(_OWORD *)a2 = xmmword_14560;
        *(_OWORD *)(a2 + 16) = xmmword_14570;
        long long v3 = xmmword_14580;
        long long v4 = xmmword_14590;
        long long v5 = xmmword_145A0;
        long long v6 = xmmword_145B0;
        long long v7 = xmmword_145C0;
        goto LABEL_46;
      case 38:
        *(_OWORD *)a2 = xmmword_144F0;
        *(_OWORD *)(a2 + 16) = xmmword_14500;
        long long v3 = xmmword_14510;
        long long v4 = xmmword_14520;
        long long v5 = xmmword_14530;
        long long v6 = xmmword_14540;
        long long v7 = xmmword_14550;
        goto LABEL_46;
      case 39:
        *(_OWORD *)a2 = xmmword_14480;
        *(_OWORD *)(a2 + 16) = xmmword_14490;
        long long v3 = xmmword_144A0;
        long long v4 = xmmword_144B0;
        long long v5 = xmmword_144C0;
        long long v6 = xmmword_144D0;
        long long v7 = xmmword_144E0;
        goto LABEL_46;
      case 40:
        *(_OWORD *)a2 = xmmword_14410;
        *(_OWORD *)(a2 + 16) = xmmword_14420;
        long long v3 = xmmword_14430;
        long long v4 = xmmword_14440;
        long long v5 = xmmword_14450;
        long long v6 = xmmword_14460;
        long long v7 = xmmword_14470;
LABEL_46:
        *(_OWORD *)(a2 + 32) = v7;
        *(_OWORD *)(a2 + 48) = v6;
        *(_OWORD *)(a2 + 64) = v5;
        *(_OWORD *)(a2 + 80) = v4;
        int v8 = v7;
        *(_OWORD *)(a2 + 96) = v3;
        break;
      default:
        int v8 = 0;
        break;
    }
    uint64_t v9 = 0;
    int v10 = 0;
    char v11 = 1;
    do
    {
      char v12 = v11;
      v10 += (*(_DWORD *)(a2 + 8 * v9 + 40) + v8) * *(_DWORD *)(a2 + 8 * v9 + 36);
      uint64_t v9 = 1;
      char v11 = 0;
    }
    while ((v12 & 1) != 0);
    *(_DWORD *)(a2 + 112) = v10;
  }
  else
  {
    v2 = sub_ACDC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10A9C(v2);
    }
  }
}

__n128 sub_56D0@<Q0>(uint64_t a1@<X0>, int *a2@<X1>, __n128 *a3@<X8>)
{
  long long v3 = (__n128 *)(a1 + 20 * *a2);
  __n128 result = v3[2];
  *a3 = result;
  a3[1].n128_u32[0] = v3[3].n128_u32[0];
  return result;
}

uint64_t sub_56F0(_DWORD *a1)
{
  return (4 * *a1 + 17);
}

uint64_t sub_5700(unsigned int *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        uint64_t v9 = malloc_type_malloc(*(int *)(a4 + 12) * (uint64_t)*(int *)(a4 + 8), 0xA8BCDBB6uLL);
        if (v9)
        {
          int v10 = v9;
          uint64_t v11 = 0;
          int v12 = 0x7FFFFFFF;
          while (sub_5C94(a1, a2, a3, v11, a4))
          {
            int v13 = sub_5808(a4);
            if (v13 < v12)
            {
              if (*(_DWORD *)(a4 + 12) * *(_DWORD *)(a4 + 8) >= 1)
              {
                uint64_t v14 = 0;
                do
                {
                  v10[v14] = *(unsigned char *)(*(void *)a4 + v14);
                  ++v14;
                }
                while (v14 < *(int *)(a4 + 12) * (uint64_t)*(int *)(a4 + 8));
              }
              int v12 = v13;
              uint64_t v4 = v11;
            }
            uint64_t v11 = (v11 + 1);
            if (v11 == 8)
            {
              free(*(void **)a4);
              *(void *)a4 = v10;
              return v4;
            }
          }
          free(v10);
        }
      }
    }
  }
  return v4;
}

uint64_t sub_5808(uint64_t a1)
{
  int v2 = sub_5BD4(a1, 1);
  int v3 = sub_5BD4(a1, 0) + v2;
  if (a1)
  {
    uint64_t v4 = *(unsigned __int8 **)a1;
    int64_t v5 = *(unsigned int *)(a1 + 12);
    if ((int)v5 > 1)
    {
      uint64_t v6 = 0;
      int v7 = 0;
      uint64_t v8 = *(int *)(a1 + 8);
      uint64_t v9 = v4 + 1;
      do
      {
        if ((int)v8 <= 1)
        {
          uint64_t v10 = v6 + 1;
        }
        else
        {
          uint64_t v10 = v6 + 1;
          uint64_t v11 = &v9[(v6 + 1) * v8];
          int v12 = &v9[v6 * v8];
          uint64_t v13 = (v8 - 1);
          do
          {
            int v14 = *(v12 - 1);
            if (v14 == *v12 && v14 == *(v11 - 1) && v14 == *v11) {
              v7 += 3;
            }
            ++v12;
            ++v11;
            --v13;
          }
          while (v13);
        }
        uint64_t v6 = v10;
      }
      while (v10 != v5 - 1);
      v3 += v7;
    }
    uint64_t v15 = *(int *)(a1 + 8);
    uint64_t v16 = *(unsigned int *)(a1 + 8);
    if ((int)v5 < 1)
    {
      int v22 = 0;
    }
    else
    {
      unint64_t v17 = 0;
      int v28 = 0;
      do
      {
        if ((int)v15 <= 0)
        {
          unint64_t v19 = v17 + 1;
        }
        else
        {
          int64_t v18 = 0;
          unint64_t v19 = v17 + 1;
          long long v20 = &v4[v17 * v15];
          do
          {
            if (v18 < v15 - 6
              && v20[v18] == 1
              && !v20[v18 + 1]
              && v20[v18 + 2] == 1
              && v20[v18 + 3] == 1
              && v20[v18 + 4] == 1
              && !v20[v18 + 5]
              && v20[v18 + 6] == 1
              && (v18 < v15 - 10 && !v20[v18 + 7] && !v20[v18 + 8] && !v20[v18 + 9] && !v20[v18 + 10]
               || (unint64_t)v18 >= 4 && !v20[v18 - 1] && !v20[v18 - 2] && !v20[v18 - 3] && !v20[v18 - 4]))
            {
              v28 += 40;
            }
            if ((uint64_t)(v17 + 6) < v5
              && v20[v18] == 1
              && !v4[(v17 + 1) * v15 + v18]
              && v4[(v17 + 2) * v15 + v18] == 1
              && v4[(v17 + 3) * v15 + v18] == 1
              && v4[(v17 + 4) * v15 + v18] == 1
              && !v4[(v17 + 5) * v15 + v18]
              && v4[(v17 + 6) * v15 + v18] == 1
              && ((uint64_t)(v17 + 10) < v5
               && !v4[(v17 + 7) * v15 + v18]
               && !v4[(v17 + 8) * v15 + v18]
               && !v4[(v17 + 9) * v15 + v18]
               && !v4[(v17 + 10) * v15 + v18]
               || v17 >= 4
               && !v4[(v17 - 1) * v15 + v18]
               && !v4[(v17 - 2) * v15 + v18]
               && !v4[(v17 - 3) * v15 + v18]
               && !v4[(v17 - 4) * v15 + v18]))
            {
              v28 += 40;
            }
            ++v18;
          }
          while (v16 != v18);
        }
        unint64_t v17 = v19;
      }
      while (v19 != v5);
      uint64_t v21 = 0;
      int v22 = 0;
      v3 += v28;
      do
      {
        long long v23 = v4;
        uint64_t v24 = *(unsigned int *)(a1 + 8);
        if ((int)v16 >= 1)
        {
          do
          {
            int v25 = *v23++;
            if (v25 == 1) {
              ++v22;
            }
            --v24;
          }
          while (v24);
        }
        ++v21;
        v4 += v15;
      }
      while (v21 != v5);
    }
    int v26 = (int)(fabs((double)v22 / (double)((int)v5 * (int)v16) * 100.0 + -50.0) / 5.0 * 10.0);
  }
  else
  {
    int v26 = 0;
  }
  return (v26 + v3);
}

uint64_t sub_5BD4(uint64_t a1, int a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a2 ? 12 : 8;
  int v3 = *(_DWORD *)(a1 + v2);
  uint64_t v4 = a2 ? 8 : 12;
  if (v3 < 1) {
    return 0;
  }
  int v5 = 0;
  uint64_t v6 = 0;
  int v7 = *(_DWORD *)(a1 + v4);
  int v8 = -1;
  do
  {
    if (v7 >= 1)
    {
      int v9 = 0;
      int v10 = 0;
      do
      {
        if (a2) {
          int v11 = v9 + v5 * *(_DWORD *)(a1 + 8);
        }
        else {
          int v11 = v5 + *(_DWORD *)(a1 + 12) * v9;
        }
        int v12 = *(char *)(*(void *)a1 + v11);
        if (v10 <= 4) {
          unsigned int v13 = v6;
        }
        else {
          unsigned int v13 = v6 + 1;
        }
        if (v10 == 4) {
          unsigned int v14 = v6 + 3;
        }
        else {
          unsigned int v14 = v13;
        }
        if (v10 == 4) {
          int v10 = 5;
        }
        else {
          ++v10;
        }
        if (v8 == v12) {
          uint64_t v6 = v14;
        }
        else {
          uint64_t v6 = v6;
        }
        if (v8 != v12)
        {
          int v10 = 1;
          int v8 = v12;
        }
        ++v9;
      }
      while (v7 != v9);
    }
    ++v5;
  }
  while (v5 != v3);
  return v6;
}

BOOL sub_5C94(unsigned int *a1, uint64_t a2, int a3, unsigned int a4, uint64_t a5)
{
  BOOL v10 = sub_6AC4(a5, -1);
  BOOL result = 0;
  if (!a5) {
    return result;
  }
  if (!v10) {
    return result;
  }
  BOOL v12 = sub_6818(0, 0, a5);
  BOOL result = 0;
  if (!v12) {
    return result;
  }
  BOOL v13 = sub_6818(*(_DWORD *)(a5 + 8) - 7, 0, a5);
  BOOL result = 0;
  if (!v13) {
    return result;
  }
  BOOL v14 = sub_6818(0, *(_DWORD *)(a5 + 8) - 7, a5);
  BOOL result = 0;
  if (!v14) {
    return result;
  }
  BOOL v15 = sub_690C(0, 7, a5);
  BOOL result = 0;
  if (!v15) {
    return result;
  }
  BOOL result = sub_690C(*(_DWORD *)(a5 + 8) - 8, 7, a5);
  if (!result) {
    return result;
  }
  BOOL v16 = sub_690C(0, *(_DWORD *)(a5 + 8) - 8, a5);
  BOOL result = 0;
  if (!v16) {
    return result;
  }
  BOOL v17 = sub_675C(7, 0, a5);
  BOOL result = 0;
  if (!v17) {
    return result;
  }
  BOOL v18 = sub_675C(*(_DWORD *)(a5 + 12) - 8, 0, a5);
  BOOL result = 0;
  if (!v18) {
    return result;
  }
  BOOL result = sub_675C(7, *(_DWORD *)(a5 + 12) - 7, a5);
  if (!result) {
    return result;
  }
  if (!sub_6688(a5, 8, *(_DWORD *)(a5 + 12) - 8))
  {
    v42 = sub_ACDC();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10F04(v42, v43, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_77;
  }
  BOOL result = sub_66AC(a5, 8, *(_DWORD *)(a5 + 12) - 8, 1);
  if (!result) {
    return result;
  }
  if (a3 >= 2)
  {
    uint64_t v50 = 0;
    v51 = (char *)&unk_15E78 + 28 * (a3 - 1);
    do
    {
      uint64_t v52 = 0;
      uint64_t v81 = v50;
      int v53 = *(_DWORD *)&v51[4 * v50];
      int v82 = v53 - 2;
      int v83 = v53;
      do
      {
        int v54 = *(_DWORD *)&v51[4 * v52];
        BOOL v55 = v54 == -1 || v53 == -1;
        if (!v55 && sub_6688(a5, *(_DWORD *)&v51[4 * v52], v53) == -1)
        {
          unint64_t v56 = 0;
          BOOL v86 = 0;
          int v87 = v54 - 2;
          v57 = (char *)&unk_162D8;
          do
          {
            uint64_t v58 = 0;
            unint64_t v85 = v56;
            int v59 = v82 + v56;
            do
            {
              if (sub_6688(a5, v87 + (int)v58, v59) != -1)
              {
                id v60 = sub_ACDC();
                v51 = (char *)&unk_15E78 + 28 * (a3 - 1);
                int v53 = v83;
                if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR)) {
                  sub_11220(v90, &v91, v60);
                }

                goto LABEL_98;
              }
              if (!sub_66AC(a5, v87 + v58, v59, v57[4 * v58]))
              {
                v51 = (char *)&unk_15E78 + 28 * (a3 - 1);
                int v53 = v83;
LABEL_98:
                if (v86) {
                  goto LABEL_99;
                }
                return 0;
              }
              ++v58;
            }
            while (v58 != 5);
            BOOL v86 = v85 > 3;
            v57 += 20;
            unint64_t v56 = v85 + 1;
            v51 = (char *)&unk_15E78 + 28 * (a3 - 1);
            int v53 = v83;
          }
          while (v85 != 4);
        }
LABEL_99:
        ++v52;
      }
      while (v52 != 7);
      uint64_t v50 = v81 + 1;
    }
    while (v81 != 6);
  }
  if (*(int *)(a5 + 8) >= 17)
  {
    int v19 = 8;
    while (1)
    {
      if (sub_6688(a5, v19, 6) + 1 >= 3)
      {
        v42 = sub_ACDC();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          goto LABEL_105;
        }
        goto LABEL_77;
      }
      int v20 = v19 + 1;
      if (sub_6688(a5, v19, 6) == -1)
      {
        BOOL result = sub_66AC(a5, v19, 6, v20 & 1);
        if (!result) {
          return result;
        }
      }
      if (sub_6688(a5, 6, v19) + 1 >= 3) {
        break;
      }
      if (sub_6688(a5, 6, v19) == -1)
      {
        BOOL result = sub_66AC(a5, 6, v19, v20 & 1);
        if (!result) {
          return result;
        }
      }
      ++v19;
      if (v20 >= *(_DWORD *)(a5 + 8) - 8) {
        goto LABEL_24;
      }
    }
    v42 = sub_ACDC();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
LABEL_105:
    }
      sub_111A8(v42, v68, v69, v70, v71, v72, v73, v74);
LABEL_77:

    return 0;
  }
LABEL_24:
  uint64_t v88 = 0;
  v89 = 0;
  if (!a2) {
    return 0;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  if (a4 >= 8)
  {
    v42 = sub_ACDC();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_11130(v42, v61, v62, v63, v64, v65, v66, v67);
    }
    goto LABEL_77;
  }
  int v21 = a4 | (8 * *(_DWORD *)(a2 + 4));
  if (!sub_95A0(&v88, v21, 5u)) {
    return 0;
  }
  int v22 = sub_69C8(v21, 1335);
  if (!sub_95A0(&v88, v22, 0xAu)
    || !sub_95A0(buf, 21522, 0xFu)
    || !sub_6B04((unsigned int *)&v88, (uint64_t)buf))
  {
    return 0;
  }
  if (sub_66CC((unsigned int *)&v88) != 15)
  {
    v42 = sub_ACDC();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_110AC((unsigned int *)&v88);
    }
    goto LABEL_77;
  }
  if (*(void *)&buf[8]) {
    free(*(void **)&buf[8]);
  }
  if ((int)sub_66CC((unsigned int *)&v88) >= 1)
  {
    unint64_t v23 = 0;
    uint64_t v24 = (int *)&unk_16340;
    int v25 = -1;
    do
    {
      unsigned int v26 = sub_66CC((unsigned int *)&v88);
      char v27 = sub_66D8((uint64_t)&v88, v26 + v25);
      if (!sub_66AC(a5, *(v24 - 1), *v24, v27)) {
        return 0;
      }
      if (v23 > 7)
      {
        if (!sub_66AC(a5, 8, v23 + *(_DWORD *)(a5 + 12) - 15, v27)) {
          return 0;
        }
      }
      else if (!sub_66AC(a5, v25 + *(_DWORD *)(a5 + 8), 8, v27))
      {
        return 0;
      }
      v24 += 2;
      ++v23;
      --v25;
    }
    while ((uint64_t)v23 < (int)sub_66CC((unsigned int *)&v88));
  }
  if (v89) {
    free(v89);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = 0;
  if (a3 >= 7)
  {
    if (!sub_95A0(buf, a3, 6u)) {
      return 0;
    }
    int v75 = sub_69C8(a3, 7973);
    if (!sub_95A0(buf, v75, 0xCu)) {
      return 0;
    }
    if (sub_66CC((unsigned int *)buf) != 18)
    {
      v42 = sub_ACDC();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_11028((unsigned int *)buf);
      }
      goto LABEL_77;
    }
    int v76 = 0;
    unsigned int v77 = 17;
    do
    {
      for (int i = -11; i != -8; ++i)
      {
        char v79 = sub_66D8((uint64_t)buf, v77);
        if (!sub_66AC(a5, v76, i + *(_DWORD *)(a5 + 12), v79) || !sub_66AC(a5, i + *(_DWORD *)(a5 + 12), v76, v79)) {
          return 0;
        }
        --v77;
      }
      ++v76;
    }
    while (v76 != 6);
    if (*(void *)&buf[8]) {
      free(*(void **)&buf[8]);
    }
  }
  int v28 = *(_DWORD *)(a5 + 8);
  if (v28 < 2)
  {
    signed int v29 = 0;
LABEL_122:
    if (v29 == sub_66CC(a1)) {
      return 1;
    }
    v80 = sub_ACDC();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
      sub_10F7C(a1, v29, v80);
    }

    return 0;
  }
  signed int v29 = 0;
  int v30 = v28 - 1;
  int v31 = *(_DWORD *)(a5 + 12) - 1;
  int v84 = -1;
  while (1)
  {
    if (v30 == 6) {
      int v32 = 5;
    }
    else {
      int v32 = v30;
    }
    if (v31 < 0) {
      goto LABEL_73;
    }
LABEL_50:
    if (v31 < *(_DWORD *)(a5 + 12)) {
      break;
    }
LABEL_73:
    v31 -= v84;
    int v84 = -v84;
    int v30 = v32 - 2;
    if (v32 <= 2) {
      goto LABEL_122;
    }
  }
  int v33 = 0;
  char v34 = 1;
  while (1)
  {
    char v35 = v34;
    unsigned int v36 = v33 + v32;
    if (sub_6688(a5, v33 + v32, v31) == -1)
    {
      if (v29 >= (int)sub_66CC(a1)) {
        char v37 = 0;
      }
      else {
        char v37 = sub_66D8((uint64_t)a1, v29++);
      }
      int v38 = v31 & 1;
      switch(a4)
      {
        case 0xFFFFFFFF:
          break;
        case 0u:
          LOBYTE(v39) = v36 + v31;
          goto LABEL_68;
        case 1u:
          goto LABEL_69;
        case 2u:
          int v38 = v36 % 3;
          goto LABEL_69;
        case 3u:
          int v38 = (int)(v36 + v31) % 3;
          goto LABEL_69;
        case 4u:
          signed int v39 = v36 / 3 + (v31 >> 1);
          goto LABEL_68;
        case 5u:
          int v38 = ((v36 * v31) & 1) + (int)(v36 * v31) % 3;
          goto LABEL_69;
        case 6u:
          signed int v39 = v36 * v31;
          int v41 = v39 - v39 / 3;
          goto LABEL_67;
        case 7u:
          signed int v39 = v36 * v31 - (int)(v36 * v31) / 3;
          LOBYTE(v41) = v36 + v31;
LABEL_67:
          LOBYTE(v39) = v41 + v39;
LABEL_68:
          int v38 = v39 & 1;
LABEL_69:
          v37 ^= v38 == 0;
          break;
        default:
          v40 = sub_ACDC();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "getDataMaskBit";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = a4;
            _os_log_error_impl(&dword_0, v40, OS_LOG_TYPE_ERROR, "%{public}s invalid mask pattern: %d", buf, 0x12u);
          }

          break;
      }
      BOOL result = sub_66AC(a5, v36, v31, v37);
      if (!result) {
        return result;
      }
    }
    char v34 = 0;
    int v33 = -1;
    if ((v35 & 1) == 0)
    {
      v31 += v84;
      if (v31 >= 0) {
        goto LABEL_50;
      }
      goto LABEL_73;
    }
  }
}

uint64_t sub_6688(uint64_t a1, int a2, int a3)
{
  if (a1) {
    return *(char *)(*(void *)a1 + a2 + *(_DWORD *)(a1 + 8) * a3);
  }
  else {
    return 0;
  }
}

BOOL sub_66AC(uint64_t a1, int a2, int a3, char a4)
{
  if (a1) {
    *(unsigned char *)(*(void *)a1 + a2 + *(_DWORD *)(a1 + 8) * a3) = a4;
  }
  return a1 != 0;
}

unsigned int *sub_66CC(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

uint64_t sub_66D8(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    if ((a2 & 0x80000000) == 0 && *(_DWORD *)a1 >= (signed int)a2)
    {
      uint64_t v2 = *(void *)(a1 + 8);
      if (v2) {
        return (*(unsigned __int8 *)(v2 + ((unint64_t)a2 >> 3)) >> (~(_BYTE)a2 & 7)) & 1;
      }
    }
  }
  uint64_t v4 = sub_ACDC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_11860();
  }

  return 0xFFFFFFFFLL;
}

BOOL sub_675C(int a1, int a2, uint64_t a3)
{
  BOOL v6 = 0;
  unsigned int v7 = 0;
  while (sub_6688(a3, a1, a2 + v7) == -1)
  {
    if (sub_66AC(a3, a1, a2 + v7, 0))
    {
      BOOL v6 = v7++ > 5;
      if (v7 != 7) {
        continue;
      }
    }
    return v6;
  }
  int v8 = sub_ACDC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_117E8(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  return v6;
}

BOOL sub_6818(int a1, int a2, uint64_t a3)
{
  unint64_t v5 = 0;
  BOOL v6 = 0;
  int v8 = (char *)&unk_15DB4;
  while (2)
  {
    for (uint64_t i = 0; i != 7; ++i)
    {
      if (sub_6688(a3, a1 + (int)i, (int)v5 + a2) != -1)
      {
        uint64_t v10 = sub_ACDC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_116F8(v10, v11, v12, v13, v14, v15, v16, v17);
        }

        return v6;
      }
      if (!sub_66AC(a3, a1 + i, v5 + a2, v8[4 * i])) {
        return v6;
      }
    }
    BOOL v6 = v5 > 5;
    v8 += 28;
    if (++v5 != 7) {
      continue;
    }
    break;
  }
  return 1;
}

BOOL sub_690C(int a1, int a2, uint64_t a3)
{
  BOOL v6 = 0;
  unsigned int v7 = 0;
  while (sub_6688(a3, a1 + v7, a2) == -1)
  {
    if (sub_66AC(a3, a1 + v7, a2, 0))
    {
      BOOL v6 = v7++ > 6;
      if (v7 != 8) {
        continue;
      }
    }
    return v6;
  }
  int v8 = sub_ACDC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_11770(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  return v6;
}

uint64_t sub_69C8(int a1, int a2)
{
  int v4 = 0;
  if (a2)
  {
    int v5 = a2;
    do
    {
      if (v5 < 0) {
        NSLog(@"Error: number should not be negative!");
      }
      ++v4;
      BOOL v6 = v5 > 1;
      v5 >>= 1;
    }
    while (v6);
  }
  uint64_t v7 = (a1 << (v4 - 1));
  if (!v7) {
    goto LABEL_17;
  }
  while (1)
  {
    int v8 = 0;
    int v9 = v7;
    do
    {
      if (v9 < 0) {
        NSLog(@"Error: number should not be negative!");
      }
      ++v8;
      BOOL v6 = v9 > 1;
      v9 >>= 1;
    }
    while (v6);
    if (v8 < v4) {
      break;
    }
    char v10 = 0;
    int v11 = v7;
    do
    {
      if (v11 < 0) {
        NSLog(@"Error: number should not be negative!");
      }
      ++v10;
      BOOL v6 = v11 > 1;
      v11 >>= 1;
    }
    while (v6);
    while (1)
    {
      uint64_t v7 = (a2 << (v10 - v4)) ^ v7;
      if (v7) {
        break;
      }
LABEL_17:
      if (v4 > 0) {
        return v7;
      }
      char v10 = 0;
    }
  }
  return v7;
}

BOOL sub_6AC4(uint64_t a1, char a2)
{
  if (a1 && *(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 8) >= 1)
  {
    uint64_t v2 = 0;
    do
      *(unsigned char *)(*(void *)a1 + v2++) = a2;
    while (v2 < *(int *)(a1 + 12) * (uint64_t)*(int *)(a1 + 8));
  }
  return a1 != 0;
}

uint64_t sub_6B04(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    uint64_t v3 = *a1;
    if (v3 == *(_DWORD *)a2)
    {
      if ((int)v3 >= 1)
      {
        uint64_t v4 = 0;
        unint64_t v5 = (unint64_t)(v3 + 7) >> 3;
        do
        {
          *(unsigned char *)(*((void *)a1 + 1) + v4) ^= *(unsigned char *)(*(void *)(a2 + 8) + v4);
          ++v4;
        }
        while (v5 != v4);
      }
      return 1;
    }
    else
    {
      BOOL v6 = sub_ACDC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_118FC();
      }

      return 0;
    }
  }
  return v2;
}

uint64_t sub_6BB0(void *a1, void *a2, int a3, int a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  if (!sub_95A0(a2, a3, 4u)) {
    goto LABEL_9;
  }
  int v11 = [v9 length];
  int v12 = v11 >= 0 ? v11 : v11 + 1;
  int v13 = v12 >> 1;
  if (a3 == 8) {
    int v11 = v13;
  }
  if (sub_6C6C(v11, a4, a3, a2)) {
    uint64_t v14 = sub_6DC8(v9, a3, a2, v10);
  }
  else {
LABEL_9:
  }
    uint64_t v14 = 0;

  return v14;
}

uint64_t sub_6C6C(int a1, int a2, int a3, void *a4)
{
  int v5 = a3 - 1;
  if (a3 - 1) <= 7 && ((0x8Bu >> v5))
  {
    signed int v6 = *((_DWORD *)*(&off_1C660 + v5) + a2);
    if (v6 >= 0) {
      int v7 = ~(-1 << v6);
    }
    else {
      int v7 = 0;
    }
  }
  else
  {
    signed int v6 = 0;
    int v7 = 0;
  }
  if (v7 >= a1)
  {
    return sub_95A0(a4, a1, v6);
  }
  else
  {
    int v8 = sub_ACDC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136446722;
      int v11 = "appendLengthInfo";
      __int16 v12 = 1024;
      int v13 = a1;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}s %d is bigger than %d", (uint8_t *)&v10, 0x18u);
    }

    return 0;
  }
}

uint64_t sub_6DC8(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  uint64_t v9 = 0;
  if (v7 && a3)
  {
    switch(a2)
    {
      case 1:
        if (sub_8FD0(v7, a3)) {
          goto LABEL_12;
        }
        goto LABEL_14;
      case 2:
        if ((sub_F30C(v7, a3) & 1) == 0) {
          goto LABEL_14;
        }
        goto LABEL_12;
      case 4:
        if (sub_9118(v7, a3)) {
          goto LABEL_12;
        }
        goto LABEL_14;
      case 8:
        if ((sub_F468(v7, a3) & 1) == 0) {
          goto LABEL_14;
        }
LABEL_12:
        uint64_t v9 = 1;
        break;
      default:
        int v10 = sub_ACDC();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_115B8(v10, v11, v12, v13, v14, v15, v16, v17);
        }

LABEL_14:
        uint64_t v9 = 0;
        break;
    }
  }

  return v9;
}

CGImageRef sub_6ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  CGImageRef v3 = 0;
  if (sub_91D4(a2, *(unsigned int *)(a1 + 28), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), &v48))
  {
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    CGImageRef v3 = 0;
    if (sub_7244((uint64_t)&v46, *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 20)))
    {
      unsigned int v4 = *(_DWORD *)(a1 + 24);
      uint64_t v5 = *(void *)(a1 + 8);
      int v6 = *(_DWORD *)(a1 + 16);
      if (v4 >= 8)
      {
        unsigned int v7 = sub_5700((unsigned int *)&v48, v5, v6, (uint64_t)&v46);
        *(_DWORD *)(a1 + 24) = v7;
      }
      else
      {
        sub_5C94((unsigned int *)&v48, v5, v6, v4, (uint64_t)&v46);
        unsigned int v7 = *(_DWORD *)(a1 + 24);
      }
      if (!*(void *)(a1 + 8)
        || *(_DWORD *)(a1 + 16) == -1
        || (int v8 = *(_DWORD *)(a1 + 20), v8 == -1)
        || v7 == -1
        || (int v9 = *(_DWORD *)(a1 + 28), v9 == -1)
        || (int v10 = *(_DWORD *)(a1 + 32), v10 == -1)
        || (int v11 = *(_DWORD *)(a1 + 36), v11 == -1)
        || v7 > 7
        || *(_DWORD *)(a1 + 40) == -1
        || v9 != v11 + v10
        || v8 != v47
        || v8 != HIDWORD(v47))
      {
        uint64_t v13 = sub_ACDC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_10E8C(v13, v14, v15, v16, v17, v18, v19, v20);
        }
        CGImageRef v3 = 0;
      }
      else
      {
        if (v49)
        {
          free(v49);
          int v12 = v47;
          int v8 = HIDWORD(v47);
        }
        else
        {
          int v12 = *(_DWORD *)(a1 + 20);
        }
        int v40 = v12 + 2;
        int v41 = v8 + 2;
        int v39 = 4 * (v12 + 2);
        uint64_t v21 = (v39 * (v8 + 2));
        uint64_t v13 = +[NSMutableData dataWithLength:(int)v21];
        if ((int)v21 >= 1)
        {
          for (uint64_t i = 0; i != v21; ++i)
            *((unsigned char *)[v13 mutableBytes] + i) = -1;
        }
        if (v8 >= 1)
        {
          int v23 = 0;
          int v24 = 4 * v12;
          int v42 = 4 * v12 + 8;
          uint64_t v43 = (v8 + 1);
          uint64_t v25 = 4 * (v12 + 1) - 4;
          uint64_t v26 = 1;
          int v44 = v12;
          do
          {
            uint64_t v45 = v26;
            if (v12 >= 1)
            {
              uint64_t v27 = 0;
              int v28 = 0;
              do
              {
                char v29 = *((unsigned char *)v46 + v28 + v23 * (int)v47) - 1;
                int v30 = v13;
                int v31 = v24 + v27;
                *((unsigned char *)[v30 mutableBytes] + v24 + (int)v27 + 12) = v29;
                char v32 = *((unsigned char *)v46 + v28 + v23 * (int)v47) - 1;
                int v33 = v30;
                *((unsigned char *)[v33 mutableBytes] + v31 + 13) = v32;
                char v34 = *((unsigned char *)v46 + v28 + v23 * (int)v47) - 1;
                char v35 = v33;
                *((unsigned char *)[v35 mutableBytes] + v31 + 14) = v34;
                *((unsigned char *)[v35 mutableBytes] + v31 + 15) = -1;
                ++v28;
                v27 += 4;
              }
              while (v25 != v27);
            }
            uint64_t v26 = v45 + 1;
            ++v23;
            v24 += v42;
            int v12 = v44;
          }
          while (v45 + 1 != v43);
        }
        if (v46) {
          free(v46);
        }
        unsigned int v36 = CGDataProviderCreateWithCFData((CFDataRef)v13);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        CGImageRef v3 = CGImageCreate(v40, v41, 8uLL, 0x20uLL, v39, DeviceRGB, 0x2002u, v36, 0, 0, kCGRenderingIntentDefault);
        CFRelease(DeviceRGB);
        CFRelease(v36);
      }
    }
  }
  return v3;
}

void *sub_7244(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    BOOL result = malloc_type_calloc(a3 * a2, 1uLL, 0x100004077774924uLL);
    *(void *)a1 = result;
    if (result)
    {
      *(_DWORD *)(a1 + 8) = a2;
      *(_DWORD *)(a1 + 12) = a3;
      return &dword_0 + 1;
    }
  }
  else
  {
    unsigned int v7 = sub_ACDC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_119CC();
    }

    return 0;
  }
  return result;
}

uint64_t sub_72D8(_DWORD *a1)
{
  return ((a1[3] + a1[1]) * *a1);
}

uint64_t sub_72EC(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) + *(_DWORD *)(a1 + 4));
}

CGImageRef sub_7698(void *a1, void *a2)
{
  id v3 = a1;
  id v166 = a2;
  if (!v3)
  {
    v159 = +[NSAssertionHandler currentHandler];
    v160 = +[NSString stringWithUTF8String:"CGImageRef PDF417CreateBarcodeImage(NSData *__strong, NSDictionary *__strong, NSError *__autoreleasing *)"];
    decode = (CGFloat *)@"message != nil";
    [v159 handleFailureInFunction:v160 file:@"PDF417.m" lineNumber:1751 description:@"Invalid parameter not satisfying: %@"];
  }
  id v165 = v3;
  if (![v3 length]) {
    sub_F628(@"The message must contain at least one character.", v4, v5, v6, v7, v8, v9, v10, (uint64_t)decode);
  }
  if (sub_87F4(v166, @"PDF417OptionMessageDataIsCodeWordData", qword_1A020))
  {
    uint64_t v11 = (uint64_t)sub_87F4(v166, @"PDF417OptionDataColumns", qword_16408);
    uint64_t v19 = (uint64_t)sub_87F4(v166, @"PDF417OptionRows", qword_16420);
    uint64_t v20 = @"When supplying a raw message payload, the data columns and rows must also be specified";
    if (v19 != -1 && v11 != -1)
    {
      if ((unint64_t)[v3 length] < 2)
      {
        uint64_t v20 = @"Message codeword payload must contain a symbol length descriptor codeword";
      }
      else
      {
        id v21 = v3;
        int v22 = (unsigned __int16 *)[v21 bytes];
        unint64_t v23 = *v22;
        if (v23 > (unint64_t)[v21 length] >> 1)
        {
          uint64_t v20 = @"Message codeword payload is too small for symbol length descriptor codeword.";
        }
        else
        {
          uint64_t v24 = (v19 * v11 - v23);
          if ((int)v24 < 2)
          {
            uint64_t v20 = @"Symbol matrix is too small for specified parameters with supplied message codeword payload";
          }
          else
          {
            unint64_t v25 = 8;
            while (sub_88B8(v25) != v24)
            {
              if (--v25 == -1)
              {
                LODWORD(v25) = -1;
                break;
              }
            }
            if (v19 * v11 <= 929)
            {
              char v29 = malloc_type_malloc(2 * v11 * v19, 0x73262888uLL);
              memcpy(v29, v22, 2 * v23);
              int v30 = &v29[v23];
              int v172 = v25;
              unint64_t v31 = (int)v25;
              goto LABEL_146;
            }
            uint64_t v20 = @"Specified PDF417 symbol matrix is too large";
          }
        }
      }
    }
    sub_F628(v20, v12, v13, v14, v15, v16, v17, v18, (uint64_t)decode);
  }
  id __len = v3;
  id __n = v166;
  if (qword_21030 != -1) {
    dispatch_once(&qword_21030, &stru_1C700);
  }
  v177 = +[NSMutableData data];
  int v26 = [__len length];
  id v27 = sub_87F4(__n, @"PDF417OptionAlwaysSpecifyCompaction", qword_1A020);
  unsigned int v28 = sub_87F4(__n, @"PDF417OptionCompactionMode", qword_16460);
  switch(v28)
  {
    case 1u:
      [v177 appendBytes:&unk_1643A length:2];
      sub_F8D8(__len, 0, v26, v177);
      goto LABEL_98;
    case 2u:
      if (v27) {
        [v177 appendBytes:&unk_16438 length:2];
      }
      sub_8954(__len, 0, v26, v177, 0);
      goto LABEL_98;
    case 3u:
      sub_F700(__len, 0, v26, 1, v177);
      goto LABEL_98;
  }
  if (v26 >= 1)
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    if (v27) {
      int v34 = -1;
    }
    else {
      int v34 = 0;
    }
    while (1)
    {
      id v35 = __len;
      unsigned int v36 = (char *)[v35 bytes];
      int v37 = [v35 length];
      int v38 = v37 - v33;
      if (v37 <= (int)v33 || v36[(int)v33] - 48 > 9)
      {

        int v43 = 0;
      }
      else
      {
        int v39 = &v36[(int)v33 + 1];
        uint64_t v40 = ~(uint64_t)(int)v33 + v37;
        unsigned int v41 = -1;
        while (v40)
        {
          int v42 = *v39++;
          --v40;
          ++v41;
          if ((v42 - 48) >= 0xA)
          {
            int v38 = v41 + 1;
            goto LABEL_92;
          }
        }
        unsigned int v41 = v37 + ~v33;
LABEL_92:

        if (v41 >= 0xC)
        {
          [v177 appendBytes:&unk_1643A length:2];
          sub_F8D8(v35, v33, v38, v177);
          uint64_t v32 = 0;
          int v34 = 2;
          goto LABEL_94;
        }
        int v43 = v38;
      }
      id v44 = v35;
      uint64_t v45 = (unsigned __int8 *)[v44 bytes];
      int v46 = [v44 length];
      LODWORD(v47) = v33;
      if ((int)v33 >= v46) {
        goto LABEL_59;
      }
      uint64_t v47 = v33;
      while (1)
      {
        uint64_t v48 = 0;
        uint64_t v49 = (int)v47;
        int v50 = v45[(int)v47];
        uint64_t v51 = v47 << 32;
        uint64_t v52 = (uint64_t)&v45[(int)v47 + 1];
        while (1)
        {
          BOOL v53 = v49 + v48 >= v46 || (v50 - 48) > 9;
          if (v53) {
            break;
          }
          if (v49 + v48 + 1 < v46) {
            int v50 = *(unsigned __int8 *)(v52 + v48);
          }
          v51 += 0x100000000;
          if (++v48 == 13)
          {
            LODWORD(v47) = v49;
            goto LABEL_59;
          }
        }
        if (!v48) {
          break;
        }
        uint64_t v47 = v48 + v49;
LABEL_55:
        if ((int)v47 >= v46) {
          goto LABEL_59;
        }
      }
      unsigned int v54 = v45[v51 >> 32];
      if (v54 <= 0xD && ((1 << v54) & 0x2600) != 0) {
        break;
      }
      if (v54 - 32 <= 0x5E)
      {
        uint64_t v47 = v48 + v49 + 1;
        goto LABEL_55;
      }
      LODWORD(v47) = v49;
LABEL_59:
      int v38 = v47 - v33;

      if (v38 > 4 || v43 == v26)
      {
        if (v34)
        {
          [v177 appendBytes:&unk_16438 length:2];
          uint64_t v32 = 0;
        }
        uint64_t v32 = sub_8954(v44, v33, v38, v177, v32);
        int v34 = 0;
      }
      else
      {
        id v56 = v44;
        v57 = (char *)[v56 bytes];
        int v58 = [v56 length];
        LODWORD(v59) = v33;
        if ((int)v33 < v58)
        {
          uint64_t v59 = (int)v33;
          id v60 = &v57[(int)v33];
LABEL_63:
          uint64_t v61 = v59 + 1;
          BOOL v62 = v57[v59] - 48 <= 9 && v61 < v58;
          int v63 = v57[v59];
          if (!v62) {
            goto LABEL_73;
          }
          uint64_t v64 = 1;
          do
          {
            int v63 = v60[v64];
            if ((unint64_t)(v64 - 1) > 0xB) {
              break;
            }
            if ((v63 - 48) >= 0xA) {
              break;
            }
            ++v64;
          }
          while (v59 + v64 < v58);
          if ((int)v64 <= 12)
          {
LABEL_73:
            unsigned int v65 = -1;
            while (v65 != 4)
            {
              if ((v63 > 0xDu || ((1 << v63) & 0x2600) == 0) && (v63 - 32) > 0x5E) {
                goto LABEL_80;
              }
              ++v65;
              int v63 = v57[v59];
              if ((int)(v59 + v65 + 1) >= v58)
              {
                if (v65 > 3) {
                  break;
                }
LABEL_80:
                ++v60;
                ++v59;
                if (v61 != v58) {
                  goto LABEL_63;
                }
                LODWORD(v59) = v58;
                break;
              }
            }
          }
        }
        int v38 = v59 - v33;

        BOOL v66 = v38 > 1;
        if (v38 <= 1) {
          int v38 = 1;
        }
        if (v34 || v66)
        {
          sub_F700(v56, v33, v38, v34, v177);
          uint64_t v32 = 0;
          int v34 = 1;
        }
        else
        {
          sub_F700(v56, v33, 1, 0, v177);
          int v34 = 0;
        }
      }
LABEL_94:
      uint64_t v33 = (v38 + v33);
      if ((int)v33 >= v26) {
        goto LABEL_98;
      }
    }
    uint64_t v47 = (v49 + 1);
    goto LABEL_55;
  }
LABEL_98:

  unint64_t v67 = (unint64_t)(int)[v177 length] >> 1;
  signed int v75 = sub_87F4(__n, @"PDF417OptionErrorCorrectionLevel", qword_16480);
  if (v75 == -1)
  {
    if ((uint64_t)(v67 << 32) >= 0x2900000000)
    {
      if (v67 >= 0xA1uLL)
      {
        if (v67 >= 0x141uLL)
        {
          if ((unint64_t)v67 >> 5 >= 0x1B)
          {
            v161 = @"It is not possible to encode a message this long with the recommended level of error correction";
LABEL_214:
            sub_F628(v161, v68, v69, v70, v71, v72, v73, v74, (uint64_t)decode);
          }
          signed int v75 = 5;
        }
        else
        {
          signed int v75 = 4;
        }
      }
      else
      {
        signed int v75 = 3;
      }
    }
    else
    {
      signed int v75 = 2;
    }
  }
  int v172 = v75;
  unint64_t v31 = v75;
  LODWORD(v24) = sub_88B8(v75);
  if ((int)v24 + (int)v67 >= 929)
  {
    v161 = @"Message is longer than is supportable by barcode format.";
    goto LABEL_214;
  }
  id v76 = __n;
  id v77 = sub_87F4(v76, @"PDF417OptionUseCompactStyle", qword_1A020);
  uint64_t v78 = (uint64_t)sub_87F4(v76, @"PDF417OptionDataColumns", qword_16408);
  LODWORD(v79) = v78;
  if (v78 == -1)
  {
    id v80 = v76;
    id v81 = sub_87F4(v80, @"PDF417OptionUseCompactStyle", qword_1A020);
    unint64_t v82 = 39;
    if (!v81) {
      unint64_t v82 = 73;
    }
    int64x2_t v179 = vaddq_s64(vdupq_n_s64(v82), (int64x2_t)xmmword_163E0);
    uint64_t v180 = v179.i64[0];
    id v83 = sub_87F4(v80, @"PDF417OptionMinWidth", &v179);

    if (v77) {
      uint64_t v84 = -39;
    }
    else {
      uint64_t v84 = -73;
    }
    if (v77) {
      uint64_t v85 = -23;
    }
    else {
      uint64_t v85 = -57;
    }
    id v86 = v80;
    id v87 = sub_87F4(v86, @"PDF417OptionUseCompactStyle", qword_1A020);
    uint64_t v88 = 39;
    if (!v87) {
      uint64_t v88 = 73;
    }
    v179.i64[0] = v88 + 17;
    v179.i64[1] = v88 + 510;
    uint64_t v180 = v88 + 510;
    id v89 = sub_87F4(v86, @"PDF417OptionMaxWidth", &v179);
    uint64_t v79 = ((uint64_t)v83 + v85) / 17;

    uint64_t v78 = ((uint64_t)v89 + v84) / 17;
  }
  uint64_t v90 = (uint64_t)sub_87F4(v76, @"PDF417OptionRows", qword_16420);
  uint64_t v91 = v90;
  if (v90 == -1)
  {
    int64x2_t v179 = (int64x2_t)xmmword_163F0;
    uint64_t v180 = 13;
    id v92 = sub_87F4(v76, @"PDF417OptionMinHeight", &v179);
    int64x2_t v179 = (int64x2_t)xmmword_163F0;
    uint64_t v180 = 274;
    uint64_t v90 = ((uint64_t)v92 - 2) / 3;
    uint64_t v91 = ((uint64_t)sub_87F4(v76, @"PDF417OptionMaxHeight", &v179) - 4) / 3;
  }
  v93 = [v76 objectForKey:@"PDF417OptionPreferredAspectRatio"];
  [v93 floatValue];
  float v95 = v94;

  float v96 = 3.0;
  if (v95 > 0.0) {
    float v96 = v95;
  }
  if (v78 < (int)v79) {
    goto LABEL_207;
  }
  if (v77) {
    uint64_t v97 = 39;
  }
  else {
    uint64_t v97 = 73;
  }
  if ((int)v79 < 1) {
    __assert_rtn("CalculateNumberOfRows", "PDF417.m", 1653, "dataCodeWordsWide>0");
  }
  uint64_t v11 = 0;
  uint64_t v98 = (int)v79;
  uint64_t v19 = 0;
  uint64_t v99 = v97 + 17 * v98;
  float v100 = 3.4028e38;
  do
  {
    uint64_t v101 = ((int)v24 + (int)v67 + (int)v98) / (int)v98;
    if (v90 > v101) {
      LODWORD(v101) = v90;
    }
    if ((int)v101 <= v91)
    {
      float v102 = (float)v99 / (float)(3 * v101 + 4);
      if (!(v11 | v19)) {
        goto LABEL_139;
      }
      float v103 = v102 - v96;
      if ((float)(v102 - v96) < 0.0) {
        float v103 = -(float)(v102 - v96);
      }
      float v104 = v100 - v96;
      if ((float)(v100 - v96) < 0.0) {
        float v104 = -(float)(v100 - v96);
      }
      if (v103 <= v104)
      {
LABEL_139:
        uint64_t v11 = v98;
        uint64_t v19 = (int)v101;
        float v100 = (float)v99 / (float)(3 * v101 + 4);
      }
    }
    ++v98;
    v99 += 17;
  }
  while (v78 >= v98);
  if (!(v11 | v19))
  {
LABEL_207:
    v161 = @"Unable to fit message into space available!";
    goto LABEL_214;
  }

  int v105 = v19 * v11 - v24;
  __int16 v106 = v67 + 1;
  if (v105 <= (int)v67 + 1) {
    int v107 = 0;
  }
  else {
    int v107 = v105 + ~v67;
  }
  unsigned __int16 v108 = v106 + v107;
  char v29 = malloc_type_malloc(2 * (int)(v24 + (unsigned __int16)(v106 + v107)), 0xBCAD74D9uLL);
  unint64_t v23 = v108;
  *char v29 = v108;
  id v109 = v177;
  memcpy(v29 + 1, [v109 bytes], (size_t)objc_msgSend(v109, "length"));
  v110 = (char *)[v109 length] + (void)(v29 + 1);
  memset_pattern4(v110, &unk_1A038, 2 * v107);
  int v30 = (unsigned __int16 *)&v110[2 * v107];

LABEL_146:
  bzero(v30, 2 * (int)v24);
  uint64_t v111 = sub_88B8(v31);
  if (v23)
  {
    uint64_t v112 = 0;
    v113 = (int *)*(&off_1C770 + v31);
    int v116 = *v113;
    v114 = v113 - 1;
    int v115 = v116;
    uint64_t v117 = (int)v111 - 1;
    do
    {
      unsigned int v118 = *v30 + (unsigned __int16)v29[v112];
      int v119 = v118 - 929 * ((4623216 * (unint64_t)v118) >> 32);
      v120 = v30 + 1;
      uint64_t v121 = v111;
      if ((int)v111 >= 2)
      {
        do
        {
          *(unsigned __int16 *)((char *)v120 + 2 * v117 - 2 * v111) = (*v120
                                                                     + 929 * (v114[v121] * v119 / 929)
                                                                     - v114[v121] * v119
                                                                     + 929)
                                                                    % 0x3A1;
          ++v120;
          BOOL v53 = v121-- <= 2;
        }
        while (!v53);
      }
      int v122 = v119 * v115 % 929;
      if ((929 - v122) >= 0x3A1) {
        int v122 = -v122;
      }
      else {
        LOWORD(v122) = 929 - v122;
      }
      v30[v117] = v122;
      ++v112;
    }
    while (v112 != v23);
  }
  if ((int)v111 >= 1)
  {
    uint64_t v123 = v111;
    do
    {
      if (*v30) {
        *int v30 = 929 - *v30;
      }
      ++v30;
      --v123;
    }
    while (v123);
  }
  id v124 = sub_87F4(v166, @"PDF417OptionUseCompactStyle", qword_1A020);
  uint64_t v125 = 17 * v11;
  if (v124) {
    uint64_t v126 = 39;
  }
  else {
    uint64_t v126 = 73;
  }
  size_t v127 = v126 + v125;
  uint64_t __na = 4 * (v126 + v125);
  uint64_t height = 3 * v19 + 4;
  v128 = (char *)malloc_type_malloc(__na * height, 0x8E3CDE9EuLL);
  size_t __lena = 8 * v127;
  memset_pattern4(v128, &unk_17490, 8 * v127);
  v129 = &v128[8 * v127];
  size_t v164 = v127;
  if (v19 >= 1)
  {
    uint64_t v130 = 0;
    int v178 = 0;
    int v170 = ((int)v19 - 1) / 3;
    int v169 = 3 * v172 + ((int)v19 - 1) % 3;
    int v168 = v11 - 1;
    uint64_t v167 = 12 * v127;
    uint64_t v131 = (uint64_t)&v128[136 * v11 + 8 + 8 * v126];
    uint64_t v171 = v11;
    do
    {
      *(void *)v129 = -1;
      int v132 = 16;
      v133 = (int *)v131;
      do
      {
        if (((1 << v132) & 0x1FEA8) != 0) {
          int v134 = -16777216;
        }
        else {
          int v134 = -1;
        }
        *v133++ = v134;
        --v132;
      }
      while (v132 != -1);
      unsigned int v135 = v130 % 3;
      unsigned int v136 = 30 * (v130 / 3) + v169;
      unsigned int v137 = 30 * (v130 / 3) + v168;
      unsigned int v138 = 30 * (v130 / 3);
      unsigned int v139 = v138 + v170;
      unsigned int v140 = v138 + v168;
      if (!(v130 % 3)) {
        unsigned int v137 = v139;
      }
      if (v135) {
        unsigned int v140 = 30 * (v130 / 3) + v169;
      }
      if (v135 == 1) {
        unsigned int v140 = 30 * (v130 / 3) + v170;
      }
      else {
        unsigned int v136 = v137;
      }
      unsigned int v141 = dword_17494[929 * v135 + v136];
      for (int i = 16; i != -1; --i)
      {
        if ((v141 >> i)) {
          int v143 = -16777216;
        }
        else {
          int v143 = -1;
        }
        *v133++ = v143;
      }
      if (v11 >= 1)
      {
        uint64_t v144 = 0;
        uint64_t v145 = v178;
        do
        {
          unsigned int v146 = dword_17494[929 * v135 + (unsigned __int16)v29[v145]];
          for (int j = 16; j != -1; --j)
          {
            if ((v146 >> j)) {
              int v148 = -16777216;
            }
            else {
              int v148 = -1;
            }
            *v133++ = v148;
          }
          ++v145;
          ++v144;
        }
        while (v144 != v11);
        int v178 = v145;
      }
      if (v124)
      {
        *v133++ = -16777216;
      }
      else
      {
        unsigned int v149 = dword_17494[929 * v135 + v140];
        for (int k = 16; k != -1; --k)
        {
          if ((v149 >> k)) {
            int v151 = -16777216;
          }
          else {
            int v151 = -1;
          }
          *v133++ = v151;
        }
        for (int m = 17; m != -1; --m)
        {
          if (((1 << m) & 0x3FA29) != 0) {
            int v153 = -16777216;
          }
          else {
            int v153 = -1;
          }
          *v133++ = v153;
        }
      }
      *(void *)v133 = -1;
      memcpy(&v129[__na], v129, __na);
      memcpy(&v129[__lena], v129, __na);
      v129 += v167;
      ++v130;
      v131 += v167;
      uint64_t v11 = v171;
    }
    while (v130 != v19);
  }
  memset_pattern4(v129, &unk_17490, __lena);
  CFDataRef v154 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)v128, __na * height, kCFAllocatorMalloc);
  v155 = CGDataProviderCreateWithCFData(v154);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v157 = CGImageCreate(v164, height, 8uLL, 0x20uLL, __na, DeviceRGB, 0x2002u, v155, 0, 0, kCGRenderingIntentDefault);
  CFRelease(DeviceRGB);
  CFRelease(v155);
  CFRelease(v154);
  free(v29);

  return v157;
}

void sub_86E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    if (a11) {
      *a11 = v11;
    }
    objc_end_catch();
    JUMPOUT(0x859CLL);
  }
  _Unwind_Resume(a1);
}

unint64_t sub_8730(void *a1, void *a2, _DWORD *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 objectForKey:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 intValue];
    unint64_t v17 = (unint64_t)v9;
    if ((int)v9 < *a3) {
      sub_E204(@"Specified %@, %d, is less than the minimum, %d.", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    }
    if ((int)v9 > a3[1]) {
      sub_E204(@"Specified %@, %d, is greater than the maximum, %d.", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    }
  }
  else
  {
    unint64_t v17 = a3[2];
  }

  return v17;
}

id sub_87F4(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = [v5 objectForKey:v6];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 integerValue];
    id v17 = v9;
    if ((uint64_t)v9 < *a3) {
      sub_F628(@"Specified %@, %ld, is less than the minimum, %ld.", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    }
    if ((uint64_t)v9 > a3[1]) {
      sub_F628(@"Specified %@, %ld, is greater than the maximum, %ld.", v10, v11, v12, v13, v14, v15, v16, (uint64_t)v6);
    }
  }
  else
  {
    id v17 = (id)a3[2];
  }

  return v17;
}

uint64_t sub_88B8(unint64_t a1)
{
  char v1 = a1;
  if (a1 >= 9)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"NSInteger ErrorCorrectionCodeWordCountForLevel(NSInteger)"];
    [v3 handleFailureInFunction:v4 file:@"PDF417.m" lineNumber:953 description:@"Error correction level must be between 0 and 8!"];
  }
  return 1 << (v1 + 1);
}

uint64_t sub_8954(void *a1, int a2, int a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x2020000000;
  v57[3] = &v58;
  uint64_t v53 = 0;
  unsigned int v54 = &v53;
  uint64_t v55 = 0x2020000000;
  int v56 = 0;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_8F00;
  v49[3] = &unk_1C728;
  uint64_t v51 = &v53;
  id v40 = a4;
  id v50 = v40;
  uint64_t v52 = v57;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_8E3C;
  v45[3] = &unk_1C750;
  uint64_t v47 = &v53;
  uint64_t v10 = objc_retainBlock(v49);
  id v46 = v10;
  uint64_t v48 = v57;
  uint64_t v11 = objc_retainBlock(v45);
  id v12 = v9;
  unsigned int v41 = (void (**)(void))v10;
  uint64_t v13 = (char *)[v12 bytes];
  id v38 = v12;
  int v39 = &v37;
  int v21 = 0;
  int v44 = a2 + 1;
  int v22 = &v13[a2];
  int v42 = v22;
  int v43 = v13;
LABEL_2:
  unint64_t v23 = &v22[v21];
  do
  {
    unsigned int v25 = *v23++;
    uint64_t v24 = v25;
    int v26 = (char)v25;
    switch(a5)
    {
      case 0:
        if (v26 != 32 && (v24 - 65) > 0x19)
        {
          if ((v24 - 97) <= 0x19)
          {
LABEL_55:
            a5 = 1;
            ((void (*)(void *, uint64_t, void))v11[2])(v11, 27, 0);
            int v22 = v42;
            goto LABEL_2;
          }
          if (v26 < 0) {
            goto LABEL_62;
          }
          if (*((unsigned __int8 *)&xmmword_21038 + v24) != 255)
          {
LABEL_56:
            a5 = 2;
            ((void (*)(void *, uint64_t, void))v11[2])(v11, 28, 0);
            int v22 = v42;
            goto LABEL_2;
          }
          if (*((unsigned __int8 *)&xmmword_210B8 + v24) == 255) {
            goto LABEL_62;
          }
LABEL_51:
          ((void (*)(void *, uint64_t, void))v11[2])(v11, 29, 0);
          uint64_t v27 = 0;
          LOBYTE(v26) = *((unsigned char *)&xmmword_210B8 + v24);
          goto LABEL_52;
        }
        BOOL v29 = v26 == 32;
        if (v26 == 32) {
          LOBYTE(v26) = 26;
        }
        unsigned int v30 = -65;
        goto LABEL_23;
      case 1:
        if (v26 != 32 && (v24 - 97) > 0x19)
        {
          if ((v24 - 65) <= 0x19)
          {
            ((void (*)(void *, uint64_t, void))v11[2])(v11, 27, 0);
            uint64_t v27 = 4294967231;
            goto LABEL_52;
          }
          if (v26 < 0) {
            goto LABEL_62;
          }
          if (*((unsigned __int8 *)&xmmword_21038 + v24) != 255) {
            goto LABEL_56;
          }
          if (*((unsigned __int8 *)&xmmword_210B8 + v24) == 255) {
            goto LABEL_62;
          }
          goto LABEL_51;
        }
        BOOL v29 = v26 == 32;
        if (v26 == 32) {
          LOBYTE(v26) = 26;
        }
        unsigned int v30 = -97;
LABEL_23:
        if (v29) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = v30;
        }
        goto LABEL_52;
      case 2:
        if ((v26 & 0x80000000) == 0 && *((unsigned __int8 *)&xmmword_21038 + v24) != 255)
        {
          uint64_t v27 = 0;
          LOBYTE(v26) = *((unsigned char *)&xmmword_21038 + v24);
          goto LABEL_52;
        }
        if (v26 == 32 || (v24 - 65) <= 0x19)
        {
          uint64_t v33 = 28;
LABEL_57:
          ((void (*)(void *, uint64_t, void))v11[2])(v11, v33, 0);
          a5 = 0;
          int v22 = v42;
          goto LABEL_2;
        }
        if ((v24 - 97) < 0x1A) {
          goto LABEL_55;
        }
        if (v26 < 0 || *((unsigned __int8 *)&xmmword_210B8 + v24) == 255) {
LABEL_62:
        }
          sub_F628(@"Message cannot be encoded with PDF417CompactionModeText because it contains character '%d'", v14, v15, v16, v17, v18, v19, v20, v24);
        if (v44 + v21 < a3
          && (v43[v44 + v21] & 0x80000000) == 0
          && *((unsigned __int8 *)&xmmword_210B8 + v43[v44 + v21]) != 255)
        {
          a5 = 3;
          ((void (*)(void *, uint64_t, void))v11[2])(v11, 25, 0);
          int v22 = v42;
          goto LABEL_2;
        }
        goto LABEL_51;
    }
    if (v26 < 0 || (int v26 = *((unsigned __int8 *)&xmmword_210B8 + v24), v26 == 255))
    {
      uint64_t v33 = 29;
      goto LABEL_57;
    }
    uint64_t v27 = 0;
LABEL_52:
    ((void (*)(void *, void, uint64_t))v11[2])(v11, (char)v26, v27);
    ++v21;
  }
  while (v21 < a3);
  int v34 = v41;
  if (v54[3]) {
    ((void (*)(void *, uint64_t, void))v11[2])(v11, 29, 0);
  }
  v34[2](v34);

  id v35 = v38;
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(v57, 8);

  return a5;
}

void sub_8DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_8E3C(uint64_t result, __int16 a2, __int16 a3)
{
  uint64_t v5 = result;
  int v6 = *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  if (v6 >= 0) {
    int v7 = *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  }
  else {
    int v7 = v6 + 1;
  }
  if (v6 < 128)
  {
    int v8 = v7 >> 1;
  }
  else
  {
    BOOL result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
    int v8 = 0;
    int v6 = *(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8) + 24);
  }
  __int16 v9 = a2 + a3;
  if (v6)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 24);
    *(_WORD *)(v10 + 2 * v8) += v9;
  }
  else
  {
    *(_WORD *)(*(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 24) + 2 * v8) = 30 * v9;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8) + 24);
  return result;
}

id sub_8F00(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v2)
  {
    uint64_t v4 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"int EmitCodeWordsWithTextCompactionMode(NSData *__strong, int, int, NSMutableData *__strong, int)_block_invoke"];
    [v4 handleFailureInFunction:v5 file:@"PDF417.m" lineNumber:336 description:@"cannot flush an odd number of half code words"];

    int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  id result = [*(id *)(a1 + 32) appendBytes:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) length:2 * (v2 / 2)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t sub_8FD0(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 length];
  if (v4 >= 1)
  {
    LODWORD(v5) = 0;
    do
    {
      id v6 = v3;
      int v7 = *((unsigned __int8 *)[v6 bytes] + (int)v5);
      uint64_t v8 = (int)v5;
      int v9 = v7 - 48;
      uint64_t v5 = (int)v5 + 2;
      if ((int)v5 >= v4)
      {
        uint64_t v11 = v8 + 1;
        if ((int)v11 >= v4)
        {
          LODWORD(v5) = v11;
          if (!sub_95A0(a2, v7 - 48, 4u))
          {
LABEL_12:
            uint64_t v12 = 0;
            goto LABEL_13;
          }
        }
        else if ((sub_95A0(a2, *((unsigned __int8 *)[v6 bytes] + v11)+ 10 * v9- 48, 7u) & 1) == 0)
        {
          goto LABEL_12;
        }
      }
      else
      {
        id v10 = v6;
        if ((sub_95A0(a2, 10 * *((unsigned __int8 *)[v10 bytes] + v8 + 1)+ 100 * v9+ *((unsigned __int8 *)objc_msgSend(v10, "bytes") + v5)- 528, 0xAu) & 1) == 0)goto LABEL_12; {
        LODWORD(v5) = v8 + 3;
        }
      }
    }
    while ((int)v5 < v4);
  }
  uint64_t v12 = 1;
LABEL_13:

  return v12;
}

BOOL sub_9118(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 length];
  if (v4)
  {
    id v5 = v4;
    id v6 = v3;
    if (sub_95A0(a2, *(unsigned __int8 *)[v6 bytes], 8u))
    {
      uint64_t v7 = 1;
      do
      {
        unint64_t v8 = v7;
        if (v5 == (id)v7) {
          break;
        }
        char v9 = sub_95A0(a2, *((unsigned __int8 *)[v6 bytes] + v7), 8u);
        uint64_t v7 = v8 + 1;
      }
      while ((v9 & 1) != 0);
      BOOL v10 = v8 >= (unint64_t)v5;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

uint64_t sub_91D4(uint64_t a1, uint64_t a2, int a3, int a4, _DWORD *a5)
{
  uint64_t result = 0;
  if (a1 && a5)
  {
    if (sub_9840((_DWORD *)a1) == a3)
    {
      uint64_t v11 = malloc_type_calloc(a4, 0x10uLL, 0x20040A4A59CD2uLL);
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = a4;
        uint64_t v72 = (void **)v11;
        if (a4 >= 1)
        {
          unint64_t v69 = a4;
          uint64_t v70 = a5;
          int v71 = a4;
          uint64_t v14 = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          uint64_t v18 = v11 + 1;
          do
          {
            uint64_t v73 = 0;
            uint64_t v19 = a2;
            if (!sub_9854(a2, a3, v13, v14, (int *)&v73 + 1, &v73)
              || (uint64_t v20 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040FDD9F14CuLL)) == 0
              || (uint64_t v21 = (uint64_t)v20, !sub_9AF4((uint64_t)v20, *(void *)(a1 + 8), v17, SHIDWORD(v73)))
              || (int v22 = sub_9950(v21, v73)) == 0)
            {
              a4 = v71;
              goto LABEL_50;
            }
            double v23 = (double)*(int *)(v21 + 8);
            *(v18 - 1) = v21;
            int v16 = (int)fmax((double)v16, v23);
            int v15 = (int)fmax((double)v15, (double)(int)v22[2]);
            void *v18 = v22;
            v18 += 2;
            v17 += HIDWORD(v73);
            ++v14;
            a2 = v19;
          }
          while (v13 != v14);
          BOOL v24 = v17 == a3;
          a4 = v71;
          unsigned int v25 = v72;
          if (!v24) {
            goto LABEL_43;
          }
          if (v16 >= 1)
          {
            int v26 = 0;
            if (v69 <= 1) {
              uint64_t v27 = 1;
            }
            else {
              uint64_t v27 = v69;
            }
LABEL_18:
            uint64_t v28 = v27;
            while (1)
            {
              if (v26 < *((_DWORD *)*v25 + 2))
              {
                int v29 = sub_97E8(*v25, v26);
                if (!sub_95A0(v70, v29, 8u)) {
                  goto LABEL_50;
                }
              }
              v25 += 2;
              if (!--v28)
              {
                ++v26;
                unsigned int v25 = v72;
                if (v26 != v16) {
                  goto LABEL_18;
                }
                break;
              }
            }
          }
          if (v15 >= 1)
          {
            int v30 = 0;
            if (v69 <= 1) {
              uint64_t v31 = 1;
            }
            else {
              uint64_t v31 = v69;
            }
LABEL_27:
            uint64_t v32 = v72 + 1;
            uint64_t v33 = v31;
            while (1)
            {
              if (v30 < *((_DWORD *)*v32 + 2))
              {
                int v34 = sub_97E8(*v32, v30);
                if (!sub_95A0(v70, v34, 8u)) {
                  goto LABEL_50;
                }
              }
              v32 += 2;
              if (!--v33)
              {
                if (++v30 != v15) {
                  goto LABEL_27;
                }
                break;
              }
            }
          }
          uint64_t v12 = v72;
          if (sub_9840(v70) != v19) {
            goto LABEL_47;
          }
          id v35 = (void ***)(v72 + 1);
          do
          {
            free(**(v35 - 1));
            free(**v35);
            free(*(v35 - 1));
            unsigned int v36 = *v35;
            v35 += 2;
            free(v36);
            --v13;
          }
          while (v13);
LABEL_46:
          free(v12);
          return 1;
        }
        if (a3)
        {
LABEL_43:
          uint64_t v52 = sub_ACDC();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_114C8(v52, v53, v54, v55, v56, v57, v58, v59);
          }
        }
        else
        {
          if (sub_9840(a5) == a2) {
            goto LABEL_46;
          }
LABEL_47:
          uint64_t v52 = sub_ACDC();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
            sub_11450(v52, v60, v61, v62, v63, v64, v65, v66);
          }
        }

LABEL_50:
        if (a4 >= 1)
        {
          unint64_t v67 = (void ***)(v72 + 1);
          do
          {
            uint64_t v68 = *(v67 - 1);
            if (v68)
            {
              free(*v68);
              free(*(v67 - 1));
            }
            if (*v67)
            {
              free(**v67);
              free(*v67);
            }
            v67 += 2;
            --v13;
          }
          while (v13);
        }
        free(v72);
        return 0;
      }
      uint64_t v37 = sub_ACDC();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_113D8(v37, v45, v46, v47, v48, v49, v50, v51);
      }
    }
    else
    {
      uint64_t v37 = sub_ACDC();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_11540(v37, v38, v39, v40, v41, v42, v43, v44);
      }
    }

    return 0;
  }
  return result;
}

uint64_t sub_95A0(void *a1, int a2, unsigned int a3)
{
  if (a3 >= 0x21)
  {
    id v3 = sub_ACDC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_118C8();
    }

    return 0;
  }
  if (!a1) {
    return 0;
  }
  int v5 = a3;
  if (a3)
  {
    do
    {
      char v7 = v5 - 8;
      if (v5 < 8 || (*(_DWORD *)a1 & 7) != 0)
      {
        uint64_t result = sub_9668(a1, (a2 >> --v5) & 1);
        if (!result) {
          return result;
        }
      }
      else
      {
        v5 -= 8;
        if ((sub_972C(a1, a2 >> v7) & 1) == 0) {
          return 0;
        }
      }
    }
    while (v5 > 0);
  }
  return 1;
}

uint64_t sub_9668(void *a1, unsigned int a2)
{
  if (a2 >= 2)
  {
    unint64_t v8 = sub_ACDC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_11894();
    }

    return 0;
  }
  if (!a1) {
    return 0;
  }
  char v3 = a2;
  int v4 = *(_DWORD *)a1;
  char v5 = *(_DWORD *)a1 & 7;
  if ((*(_DWORD *)a1 & 7) == 0)
  {
    unsigned int v6 = sub_972C(a1, 0);
    uint64_t result = 0;
    if (!v6) {
      return result;
    }
    int v4 = *(_DWORD *)a1 - 8;
    *(_DWORD *)a1 = v4;
  }
  *(unsigned char *)(a1[1] + (v4 >> 3)) |= v3 << (v5 ^ 7);
  ++*(_DWORD *)a1;
  return 1;
}

void *sub_972C(void *result, char a2)
{
  if (result)
  {
    char v3 = result;
    uint64_t result = (void *)result[1];
    if (result
      || (*v3 = 0x2000000000, uint64_t result = malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL),
                                (v3[1] = result) != 0))
    {
      int v4 = *(int *)v3 >> 3;
      if (v4 == *((_DWORD *)v3 + 1))
      {
        uint64_t result = malloc_type_realloc(result, 2 * v4, 0x100004077774924uLL);
        v3[1] = result;
        if (!result) {
          return result;
        }
        int v5 = *(_DWORD *)v3;
        *((_DWORD *)v3 + 1) *= 2;
        int v4 = v5 >> 3;
      }
      *((unsigned char *)result + v4) = a2;
      *(_DWORD *)v3 += 8;
      return (void *)(&dword_0 + 1);
    }
  }
  return result;
}

uint64_t sub_97E8(void *a1, int a2)
{
  if (a1) {
    return *(unsigned __int8 *)(*a1 + a2);
  }
  char v3 = sub_ACDC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_11930();
  }

  return 0xFFFFFFFFLL;
}

_DWORD *sub_9840(_DWORD *result)
{
  if (result) {
    return (_DWORD *)((*result + 7) >> 3);
  }
  return result;
}

uint64_t sub_9854(int a1, int a2, int a3, int a4, int *a5, _DWORD *a6)
{
  uint64_t v6 = 0;
  if (!a5 || !a6) {
    return v6;
  }
  if (a4 >= a3)
  {
    char v9 = sub_ACDC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_11360(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    goto LABEL_12;
  }
  int v7 = a2 / a3;
  int v8 = a1 % a3;
  if (a1 / a3 * (a3 - v8) + (a1 / a3 + 1) * v8 != a1)
  {
    char v9 = sub_ACDC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_11270(v9, v17, v18, v19, v20, v21, v22, v23);
    }
LABEL_12:

    return 0;
  }
  if (a3 - v8 <= a4) {
    int v7 = a2 / a3 + 1;
  }
  *a5 = v7;
  *a6 = a1 / a3 - a2 / a3;
  return 1;
}

_DWORD *sub_9950(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = *(int *)(a1 + 8);
  size_t v5 = v4 + (int)a2;
  uint64_t v6 = malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
  if ((int)v5 >= 1)
  {
    uint64_t v7 = 0;
    do
    {
      if (v7 >= v4) {
        int v8 = 0;
      }
      else {
        int v8 = sub_97E8((void *)a1, v7);
      }
      v6[v7++] = v8;
    }
    while (v5 != v7);
  }
  id v9 = [[CIReedSolomon alloc] initReedSolomon];
  if ([v9 encode:v6 length:v5 bytes:a2])
  {
    uint64_t v10 = malloc_type_calloc(1uLL, 0x10uLL, 0x1010040FDD9F14CuLL);
    sub_9BC0(v10, a2);
    if ((int)a2 >= 1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = (char *)&v6[v4];
      do
      {
        sub_9A94(v10, v11, *(_DWORD *)&v12[4 * v11]);
        ++v11;
      }
      while (a2 != v11);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  free(v6);

  return v10;
}

BOOL sub_9A94(void *a1, int a2, char a3)
{
  if (a1)
  {
    *(unsigned char *)(*a1 + a2) = a3;
  }
  else
  {
    uint64_t v4 = sub_ACDC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_11964();
    }
  }
  return a1 != 0;
}

void *sub_9AF4(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a1)
  {
    int v8 = *(void **)a1;
    if (v8) {
      free(v8);
    }
    uint64_t result = malloc_type_calloc(a4, 1uLL, 0x100004077774924uLL);
    *(void *)a1 = result;
    if (result)
    {
      *(_DWORD *)(a1 + 8) = a4;
      *(_DWORD *)(a1 + 12) = a4;
      if (a4 >= 1)
      {
        uint64_t v10 = 0;
        do
        {
          *(unsigned char *)(*(void *)a1 + v10) = *(unsigned char *)(a2 + a3 + v10);
          ++v10;
        }
        while (a4 != v10);
      }
      return &dword_0 + 1;
    }
  }
  else
  {
    uint64_t v11 = sub_ACDC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_11998();
    }

    return 0;
  }
  return result;
}

_DWORD *sub_9BC0(_DWORD *result, int a2)
{
  if (result)
  {
    char v3 = result;
    uint64_t result = malloc_type_calloc(a2, 1uLL, 0x100004077774924uLL);
    *(void *)char v3 = result;
    if (result)
    {
      v3[2] = a2;
      v3[3] = a2;
      return &dword_0 + 1;
    }
  }
  return result;
}

void sub_ABE0(id a1)
{
  uint64_t v1 = 0;
  *(void *)&long long v2 = -1;
  *((void *)&v2 + 1) = -1;
  xmmword_21098 = v2;
  unk_210A8 = v2;
  xmmword_21078 = v2;
  unk_21088 = v2;
  xmmword_21058 = v2;
  unk_21068 = v2;
  xmmword_21038 = v2;
  unk_21048 = v2;
  do
  {
    if (((0x3A000000uLL >> v1) & 1) == 0) {
      *((unsigned char *)&xmmword_21038 + a0123456789[v1]) = v1;
    }
    ++v1;
  }
  while (v1 != 30);
  uint64_t v3 = 0;
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  xmmword_21118 = v4;
  unk_21128 = v4;
  xmmword_210F8 = v4;
  unk_21108 = v4;
  xmmword_210D8 = v4;
  unk_210E8 = v4;
  xmmword_210B8 = v4;
  unk_210C8 = v4;
  do
  {
    *((unsigned char *)&xmmword_210B8 + asc_140E9[v3]) = v3;
    ++v3;
  }
  while (v3 != 29);
}

uint64_t sub_AC68()
{
  if (qword_20EF8 != -1) {
    dispatch_once(&qword_20EF8, &stru_1C3C8);
  }
  return qword_20EF0;
}

void sub_ACAC(id a1)
{
  qword_20EF0 = (uint64_t)os_log_create("com.apple.coreimage", "api");
}

uint64_t sub_ACDC()
{
  if (qword_20F08 != -1) {
    dispatch_once(&qword_20F08, &stru_1C408);
  }
  return qword_20F00;
}

void sub_AD20(id a1)
{
  qword_20F00 = (uint64_t)os_log_create("com.apple.coreimage", "filter");
}

void sub_C354(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_C370(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_C43C(uint64_t a1)
{
  long long v2 = +[NSMutableArray array];
  while (a1)
  {
    uint64_t v3 = *(int *)(a1 + 8);
    if (v3 > 6) {
      long long v4 = 0;
    }
    else {
      long long v4 = off_1C5A8[v3];
    }
    int v28 = 0;
    uint64_t v27 = 0;
    size_t v5 = (unsigned __int8 *)&v28;
    unsigned int v25 = &v28;
    long long v26 = xmmword_15310;
    sub_C868(a1);
    uint64_t v6 = v27 - 8 * v26 + 32;
    sub_C954((uint64_t)&v25);
    uint64_t v24 = 0;
    uint64_t v22 = &v28;
    long long v23 = xmmword_15310;
    uint64_t v7 = malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
    uint64_t v8 = 0;
    int v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = 4;
    do
    {
      if (!v9)
      {
        v10 <<= 8;
        if (v11)
        {
          --v11;
          unsigned int v12 = *v5++;
          v10 |= v12;
          int v9 = 8;
        }
        else
        {
          int v9 = 8;
          uint64_t v11 = -1;
        }
      }
      if ((v10 >> --v9)) {
        char v13 = 49;
      }
      else {
        char v13 = 48;
      }
      v7[v8++] = v13;
    }
    while (v8 != 32);
    id v14 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v7 length:32 encoding:1 freeWhenDone:1];
    uint64_t v15 = [v14 substringToIndex:v6];

    sub_C954((uint64_t)&v22);
    id v16 = v15;
    id v17 = [v16 UTF8String];
    uint64_t v18 = ((void (*)(uint64_t))v4)(a1 + 12);
    uint64_t v19 = +[NSString stringWithFormat:@"%-15s %@", v17, v18];
    [v2 addObject:v19];

    a1 = *(void *)a1;
  }
  uint64_t v20 = [v2 componentsJoinedByString:@"\n"];

  return v20;
}

CFStringRef sub_C664()
{
  return @"Head";
}

NSString *sub_C670(int *a1)
{
  uint64_t v1 = *a1;
  if (v1 > 6) {
    CFStringRef v2 = @"<unknown state>";
  }
  else {
    CFStringRef v2 = (const __CFString *)*((void *)&off_1C5E0 + v1);
  }
  return +[NSString stringWithFormat:@"%@ '%c'", v2, *((unsigned __int8 *)a1 + 4)];
}

NSString *sub_C6D0(unsigned __int8 *a1)
{
  return +[NSString stringWithFormat:@"%@ '%c'", @"B", *a1];
}

NSString *sub_C714(int *a1)
{
  uint64_t v1 = *a1;
  if (v1 > 6) {
    CFStringRef v2 = @"<unknown state>";
  }
  else {
    CFStringRef v2 = (const __CFString *)*((void *)&off_1C5E0 + v1);
  }
  uint64_t v3 = a1[1];
  if (v3 > 6) {
    CFStringRef v4 = @"<unknown state>";
  }
  else {
    CFStringRef v4 = (const __CFString *)*((void *)&off_1C5E0 + v3);
  }
  return +[NSString stringWithFormat:@"Latch %@->%@", v2, v4];
}

NSString *sub_C78C(int *a1)
{
  uint64_t v1 = *a1;
  if (v1 > 6) {
    CFStringRef v2 = @"<unknown state>";
  }
  else {
    CFStringRef v2 = (const __CFString *)*((void *)&off_1C5E0 + v1);
  }
  uint64_t v3 = a1[1];
  if (v3 > 6) {
    CFStringRef v4 = @"<unknown state>";
  }
  else {
    CFStringRef v4 = (const __CFString *)*((void *)&off_1C5E0 + v3);
  }
  return +[NSString stringWithFormat:@"Shift %@->%@", v2, v4];
}

CFStringRef sub_C804(int *a1)
{
  uint64_t v1 = *a1;
  if (v1 > 5) {
    return @"<unknown two char punc>";
  }
  else {
    return (const __CFString *)*((void *)&off_1C618 + v1);
  }
}

NSString *sub_C82C(unsigned __int16 *a1)
{
  return +[NSString stringWithFormat:@"len %d", *a1];
}

uint64_t sub_C868(uint64_t a1)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = nullsub_2;
      goto LABEL_10;
    case 1:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = (uint64_t (*)())sub_E2E0;
      goto LABEL_10;
    case 2:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = (uint64_t (*)())sub_E3BC;
      goto LABEL_10;
    case 3:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = (uint64_t (*)())sub_E3D0;
      goto LABEL_10;
    case 4:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = (uint64_t (*)())sub_E418;
      goto LABEL_10;
    case 5:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = (uint64_t (*)())sub_E450;
      goto LABEL_10;
    case 6:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      CFStringRef v2 = (uint64_t (*)())sub_E464;
LABEL_10:
      v1[53].base_prots = (__objc2_prot_list *)v2;
      uint64_t result = ((uint64_t (*)(uint64_t))v2)(a1 + 12);
      break;
    default:
      uint64_t result = ((uint64_t (*)(uint64_t))off_20F10)(a1 + 12);
      break;
  }
  return result;
}

uint64_t sub_C954(uint64_t result)
{
  uint64_t v1 = result;
  for (int i = *(_DWORD *)(result + 24); i; int i = *(_DWORD *)(v1 + 24))
    uint64_t result = sub_E598(v1, 0, -i & 7);
  if (*(void *)(v1 + 8))
  {
    do
    {
      uint64_t v3 = (unsigned char *)(*(void *)v1)++;
      *uint64_t v3 = 0;
      uint64_t v4 = *(void *)(v1 + 8) - 1;
      *(void *)(v1 + 8) = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_C9C0(void *a1)
{
  if (!a1) {
    return 0;
  }
  uint64_t v1 = a1;
  uint64_t v2 = 0;
  do
  {
    int v9 = 0;
    uint64_t v8 = 0;
    uint64_t v6 = &v9;
    long long v7 = xmmword_15310;
    sub_C868((uint64_t)v1);
    uint64_t v3 = v7;
    uint64_t v4 = v8;
    sub_C954((uint64_t)&v6);
    uint64_t v2 = v2 - 8 * v3 + v4 + 32;
    uint64_t v1 = (void *)*v1;
  }
  while (v1);
  return v2;
}

CGImageRef sub_CA60(void *a1, void *a2, uint64_t a3)
{
  id v4 = a1;
  id v244 = a2;
  v245 = v4;
  if (!v4)
  {
    v232 = +[NSAssertionHandler currentHandler];
    v233 = +[NSString stringWithUTF8String:"CGImageRef AztecCreateBarcodeImage(NSData *__strong, NSDictionary *__strong, NSError *__autoreleasing *)"];
    uint64_t decode = @"msgData != nil";
    [v232 handleFailureInFunction:v233 file:@"Aztec.m" lineNumber:1526 description:@"Invalid parameter not satisfying: %@"];
  }
  if (qword_21020 != -1) {
    dispatch_once(&qword_21020, &stru_1C4B8);
  }
  if (![v245 length])
  {
    v234 = @"The message must contain at least one character.";
    goto LABEL_332;
  }
  if ((unint64_t)[v245 length] >= 0x9C01)
  {
    v234 = @"The message is too long for an Aztec barcode.";
LABEL_332:
    sub_E204(v234, v5, v6, v7, v8, v9, v10, v11, decode);
  }
  BOOL v12 = sub_8730(v244, @"AztecOptionMessageCodeWordCount", dword_15784)
     && sub_8730(v244, @"AztecOptionLayers", dword_15790)
     && sub_8730(v244, @"AztecOptionUseCompactStyle", dword_1579C) != -1;
  if (sub_8730(v244, @"AztecOptionMessageDataIsDataCodeWords", dword_1579C)) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13)
  {
    id v28 = v245;
    v261 = (unsigned __int8 *)[v28 bytes];
    int v29 = [v28 length];
    v270 = (void **)sub_E6F8(6 * v29);
    long long v282 = xmmword_157A8;
    uint64_t v283 = 4294967297000000;
    memset((char *)v284 + 8, 0, 40);
    size_t v30 = sub_E764(v270);
    id v256 = v28;
    *(_DWORD *)(v30 + 8) = 0;
    *(void *)&v284[0] = v30;
    long long v278 = 0u;
    long long v279 = 0u;
    long long v277 = 0u;
    if (v29 > 0)
    {
      uint64_t v31 = 0;
      uint64_t v32 = 0;
      uint64_t v259 = v29;
      while (1)
      {
        uint64_t v33 = 0;
        int v34 = dword_15508;
        do
        {
          uint64_t v35 = v32;
          uint64_t v36 = 0;
          while (1)
          {
            int v37 = v34[v36] + *((_DWORD *)&v282 + v33);
            if (v37 < *((_DWORD *)&v282 + v36))
            {
              *((_DWORD *)&v282 + v36) = v37;
              uint64_t v38 = *((void *)v284 + v33);
              size_t v39 = sub_E764(v270);
              *(void *)size_t v39 = v38;
              *(_DWORD *)(v39 + 8) = 3;
              *(_DWORD *)(v39 + 12) = v33;
              *(_DWORD *)(v39 + 16) = v36;
              *((void *)v284 + v36) = v39;
              if (v36 == 5) {
                break;
              }
            }
            if (++v36 == 6)
            {
              uint64_t v32 = v35;
              goto LABEL_28;
            }
          }
          size_t v40 = sub_E764(v270);
          *(void *)size_t v40 = v39;
          *(_DWORD *)(v40 + 8) = 6;
          *(_WORD *)(v40 + 12) = 0;
          *((void *)&v284[2] + 1) = v40;
          uint64_t v32 = dword_157C0[v33];
LABEL_28:
          ++v33;
          v34 += 6;
        }
        while (v33 != 5);
        uint64_t v41 = 0;
        uint64_t v269 = v32;
        uint64_t v42 = &dword_15508[6 * v32];
        do
        {
          int v43 = v42[v41] + HIDWORD(v283);
          if (v43 < *((_DWORD *)&v282 + v41))
          {
            *((_DWORD *)&v282 + v41) = v43;
            uint64_t v44 = *((void *)&v284[2] + 1);
            size_t v45 = sub_E764(v270);
            *(void *)size_t v45 = v44;
            *(void *)(v45 + 8) = 0x500000003;
            *(_DWORD *)(v45 + 16) = v269;
            size_t v46 = sub_E764(v270);
            *(void *)size_t v46 = v45;
            *(_DWORD *)(v46 + 8) = 3;
            *(_DWORD *)(v46 + 12) = v269;
            *(_DWORD *)(v46 + 16) = v41;
            *((void *)v284 + v41) = v46;
          }
          ++v41;
        }
        while (v41 != 6);
        long long v278 = 0u;
        long long v279 = 0u;
        long long v277 = 0u;
        memset_pattern16(&__b, &unk_15320, 0x18uLL);
        uint64_t v47 = 0;
        uint64_t v48 = v261[v31];
        uint64_t v263 = v31;
        uint64_t v268 = *((void *)&v284[2] + 1);
        uint64_t v49 = dword_156B8;
        do
        {
          if (((unsigned int (*)(uint64_t))off_1C4D8[v47])(v48))
          {
            int v50 = dword_157D8[v47];
            int v51 = v50 + *((_DWORD *)&v282 + v47);
            if (v51 < *((_DWORD *)&__b + v47))
            {
              *((_DWORD *)&__b + v47) = v51;
              if (v47 == 5)
              {
                if (*(_DWORD *)(v268 + 8) == 2)
                {
                  __int16 v52 = *(unsigned __int8 *)(v268 + 13);
                  if (((v52 + 1) & 0x100) != 0) {
                    char v53 = -1;
                  }
                  else {
                    char v53 = v52 + 1;
                  }
                }
                else
                {
                  char v53 = 1;
                }
                size_t v56 = sub_E764(v270);
                *(void *)size_t v56 = v268;
                *(_DWORD *)(v56 + 8) = 2;
                *(unsigned char *)(v56 + 12) = v48;
                *(unsigned char *)(v56 + 13) = v53;
                *((void *)&v279 + 1) = v56;
              }
              else
              {
                uint64_t v54 = *((void *)v284 + v47);
                size_t v55 = sub_E764(v270);
                *(void *)size_t v55 = v54;
                *(_DWORD *)(v55 + 8) = 1;
                *(_DWORD *)(v55 + 12) = v47;
                *(unsigned char *)(v55 + 16) = v48;
                *((void *)&v277 + v47) = v55;
              }
            }
            uint64_t v57 = 0;
            uint64_t v58 = v49;
            do
            {
              if (v47 != v57)
              {
                int v59 = *((_DWORD *)&v282 + v57) + v50 + *v58;
                if (v59 < *((_DWORD *)&__b + v57))
                {
                  *((_DWORD *)&__b + v57) = v59;
                  uint64_t v60 = *((void *)v284 + v57);
                  size_t v61 = sub_E764(v270);
                  *(void *)size_t v61 = v60;
                  *(_DWORD *)(v61 + 8) = 4;
                  *(_DWORD *)(v61 + 12) = v57;
                  *(_DWORD *)(v61 + 16) = v47;
                  size_t v62 = sub_E764(v270);
                  *(void *)size_t v62 = v61;
                  *(_DWORD *)(v62 + 8) = 1;
                  *(_DWORD *)(v62 + 12) = v47;
                  *(unsigned char *)(v62 + 16) = v48;
                  *((void *)&v277 + v57) = v62;
                }
              }
              ++v57;
              v58 += 6;
            }
            while (v57 != 6);
          }
          ++v47;
          ++v49;
        }
        while (v47 != 6);
        if (!v263) {
          goto LABEL_67;
        }
        int v63 = HIDWORD(v282);
        if (SHIDWORD(v282) >= SHIDWORD(__b)) {
          goto LABEL_67;
        }
        int v64 = v261[(v263 - 1)];
        int v65 = v261[v263];
        if (v64 == 13 && v65 == 10) {
          break;
        }
        if (v64 == 46 && v65 == 32)
        {
          int v66 = 3;
          goto LABEL_64;
        }
        if (v64 == 44 && v65 == 32)
        {
          int v66 = 4;
          goto LABEL_64;
        }
        if (v64 == 58 && v65 == 32)
        {
          int v66 = 5;
          goto LABEL_64;
        }
LABEL_67:
        if (*(unsigned char *)(*((void *)&v279 + 1) + 13) == 32) {
          HIDWORD(v281) += 11;
        }
        uint64_t v31 = v263 + 1;
        long long v282 = __b;
        uint64_t v283 = v281;
        v284[0] = v277;
        v284[1] = v278;
        v284[2] = v279;
        uint64_t v32 = v269;
        if (v263 + 1 == v259) {
          goto LABEL_70;
        }
      }
      int v66 = 2;
LABEL_64:
      if (*(_DWORD *)(*((void *)&v284[1] + 1) + 8) == 1
        && *(unsigned __int8 *)(*((void *)&v284[1] + 1) + 16) == v64)
      {
        uint64_t v67 = **((void **)&v284[1] + 1);
        size_t v68 = sub_E764(v270);
        *(void *)size_t v68 = v67;
        *(_DWORD *)(v68 + 8) = 5;
        *(_DWORD *)(v68 + 12) = v66;
        *((void *)&v278 + 1) = v68;
        HIDWORD(__b) = v63;
      }
      goto LABEL_67;
    }
LABEL_70:
    uint64_t v69 = 0;
    unsigned int v70 = 0;
    signed int v71 = 0x7FFFFFFF;
    do
    {
      if (*((_DWORD *)&v282 + v69) < v71)
      {
        unsigned int v70 = v69;
        signed int v71 = *((_DWORD *)&v282 + v69);
      }
      ++v69;
    }
    while (v69 != 6);
    uint64_t v72 = *((void *)v284 + v70);
    if (v72)
    {
      uint64_t v73 = 0;
      __int16 v74 = 0;
      signed int v75 = v256;
      do
      {
        uint64_t v76 = v72;
        int v77 = *(_DWORD *)(v72 + 8);
        if (v77 == 6)
        {
          *(_WORD *)(v76 + 12) = v74;
          __int16 v74 = 0;
        }
        else if (v77 == 2)
        {
          ++v74;
        }
        uint64_t v72 = *(void *)v76;
        *(void *)uint64_t v76 = v73;
        uint64_t v73 = v76;
      }
      while (v72);
    }
    else
    {
      uint64_t v76 = 0;
      signed int v75 = v256;
    }
    if (byte_21028)
    {
      LOBYTE(v78) = byte_21028 - 2;
    }
    else
    {
      uint64_t v79 = +[NSUserDefaults standardUserDefaults];
      uint64_t v78 = [v79 objectForKey:@"AztecDebugSequence"];

      if (v78)
      {
        LODWORD(v78) = [v79 BOOLForKey:@"AztecDebugSequence"];
        id v80 = [v79 volatileDomainForName:NSArgumentDomain];
        id v81 = [v80 objectForKey:@"AztecDebugSequence"];

        byte_21028 = v78 | 2;
        if (v81)
        {
          CFStringRef v82 = @"NO";
          if (v78) {
            CFStringRef v82 = @"YES";
          }
          NSLog(@"%@=%@", @"AztecDebugSequence", v82, a3);
        }
      }
      else
      {
        byte_21028 = 2;
      }
    }
    if ((_BYTE)v78)
    {
      sub_C43C(v76);
      shouldInterpolate = uint64_t decode = v71;
      NSLog(@"len:%ld seq:\n%@");
    }
    int v91 = v71 + 7;
    if (v71 < -7) {
      int v91 = v71 + 14;
    }
    id v92 = +[NSMutableData dataWithLength:(uint64_t)v91 >> 3];
    uint64_t v273 = (uint64_t)[v92 mutableBytes];
    id v274 = [v92 length];
    uint64_t v275 = 0;
    for (uint64_t i = 0; v76; v76 = *(void *)v76)
      sub_C868(v76);
    sub_C954((uint64_t)&v273);
    v93 = v270;
    do
    {
      free(*v93);
      float v94 = (void **)v93[3];
      free(v93);
      v93 = v94;
    }
    while (v94);

    id v95 = v244;
    int v96 = sub_8730(v95, @"AztecOptionUseCompactStyle", dword_1579C);
    BOOL v97 = (v96 - 1) < 0xFFFFFFFE;
    unint64_t v98 = sub_8730(v95, @"AztecOptionLayers", dword_15790);
    double v99 = (double)(int)sub_8730(v95, @"AztecOptionErrorCorrectionPercentage", dword_157F0) / 100.0;
    if (!v98)
    {
      double v104 = 1.0 - v99;
      int v105 = (char *)&unk_15814;
      __int16 v106 = (char *)&unk_15800;
      unint64_t v107 = 1;
      while (1)
      {
        if (v96 == -1) {
          BOOL v97 = v107 < 4;
        }
        if (v107 < 5 || !v97)
        {
          unsigned __int16 v108 = (int *)(v97 ? v106 : v105);
          if (v104 * (double)*v108 + -3.0 >= (double)v71) {
            break;
          }
        }
        ++v107;
        v105 += 4;
        v106 += 4;
        if (v107 == 33)
        {
          unint64_t v98 = 33;
          goto LABEL_133;
        }
      }
      BOOL v267 = v97;
      LODWORD(v98) = v107;
      goto LABEL_147;
    }
    if (v96 == -1) {
      BOOL v100 = (int)v98 < 4;
    }
    else {
      BOOL v100 = (v96 - 1) < 0xFFFFFFFE;
    }
    if ((int)v98 >= 5 && v100)
    {
      if (v96 != -1) {
        goto LABEL_133;
      }
      uint64_t v101 = v98;
      double v102 = (double)v71;
      double v103 = 1.0 - v99;
    }
    else
    {
      uint64_t v117 = (int *)&unk_157FC;
      BOOL v267 = v100;
      if (!v100) {
        uint64_t v117 = dword_15810;
      }
      double v102 = (double)v71;
      double v103 = 1.0 - v99;
      double v118 = v103 * (double)v117[(int)v98] + -3.0;
      if (v118 >= (double)v71 || !v100 || v96 != -1)
      {
        if (v118 >= v102) {
          goto LABEL_147;
        }
        goto LABEL_133;
      }
      uint64_t v101 = (int)v98;
    }
    if (v103 * (double)dword_15810[v101] + -3.0 >= v102)
    {
      BOOL v267 = 0;
LABEL_147:

      if ((int)v98 >= 3)
      {
        if (v98 >= 9)
        {
          if (v98 >= 0x17) {
            int v119 = 12;
          }
          else {
            int v119 = 10;
          }
        }
        else
        {
          int v119 = 8;
        }
      }
      else
      {
        int v119 = 6;
      }
      signed int v262 = v119;
      v120 = (int *)&unk_15364;
      if (v267) {
        v120 = (int *)&unk_15350;
      }
      uint64_t v121 = v120[(int)v98];
      int v122 = +[NSMutableData dataWithLength:4 * v121];
      id v123 = v92;
      id v124 = v122;
      v264 = [v124 mutableBytes];
      unint64_t v125 = (unint64_t)[v124 length];
      *((void *)&v284[1] + 1) = 0;
      id v126 = v123;
      id v127 = [v126 bytes];
      id v128 = [v126 length];
      int v254 = v98;
      unint64_t v129 = v125 >> 2;
      signed int v130 = v262;
      int v271 = ~(-1 << v262);
      *(void *)&v284[0] = v127;
      *((void *)&v284[0] + 1) = v128;
      *(void *)&v284[1] = 0;
      DWORD2(v284[1]) = 0;
      unint64_t v257 = v125 >> 2;
      if (v71 >= v262)
      {
        id v249 = v126;
        uint64_t v133 = 0;
        LOBYTE(v131) = 0;
        uint64_t v134 = v129 & ~((int)v129 >> 31);
        v247 = @"The message does not fit into the space allocated in the barcode.";
        do
        {
          int v135 = sub_E600((uint64_t)v284, v130);
          int v136 = 1 << (v262 - 1);
          if ((v131 & 1) == 0) {
            int v136 = 0;
          }
          int v137 = v135 | v136;
          BOOL v138 = v137 == 1;
          if (v137 == 1) {
            int v139 = 1;
          }
          else {
            int v139 = v137;
          }
          if (!v137) {
            BOOL v138 = 0;
          }
          BOOL v140 = v137 == 0;
          if (!v137) {
            int v139 = 1;
          }
          if (v137 == -2 - (-1 << v262))
          {
            BOOL v138 = 0;
            BOOL v140 = 1;
            int v139 = -2 - (-1 << v262);
          }
          int v131 = v137 == v271 || v138;
          BOOL v132 = v137 != v271 && v140;
          if (v137 == v271) {
            int v141 = -2 - (-1 << v262);
          }
          else {
            int v141 = v139;
          }
          if (v134 == v133) {
            goto LABEL_136;
          }
          v71 -= v130;
          v264[v133] = v141;
          int v15 = v133 + 1;
          if (v131 | v132) {
            signed int v130 = v262 - 1;
          }
          else {
            signed int v130 = v262;
          }
          ++v133;
        }
        while (v71 >= v130);
        id v126 = v249;
      }
      else
      {
        int v15 = 0;
        int v131 = 0;
        BOOL v132 = 0;
      }
      int v24 = v254;
      if ((v131 & 1) == 0 && !v71 && !v132) {
        goto LABEL_199;
      }
      int v142 = sub_E600((uint64_t)v284, v71);
      if (v15 < (int)v257)
      {
        int v143 = v262 - (v131 | v132);
        if ((v143 - v71) <= 0x1F) {
          int v144 = ~(-1 << (v262 - (v131 | v132) - v71));
        }
        else {
          int v144 = -1;
        }
        int v145 = v143 - v71;
        if (!v145) {
          int v144 = 0;
        }
        int v146 = v142 << v145;
        int v147 = 1 << (v262 - 1);
        if (!v131) {
          int v147 = 0;
        }
        int v148 = v144 | v147 | v146;
        if (v148 == v271) {
          v148 &= ~1u;
        }
        v264[v15++] = v148;
LABEL_199:
        id v87 = v124;

        int v26 = v121;
        goto LABEL_200;
      }
      CFStringRef v116 = @"The message does not fit into the space allocated in the barcode.";
LABEL_135:
      v247 = (__CFString *)v116;
LABEL_136:
      sub_E204(v247, v109, v110, v111, v112, v113, v114, v115, decode);
    }
LABEL_133:
    if (sub_8730(v95, @"AztecOptionLayers", dword_15790)) {
      sub_E204(@"The message doesn't fit into the specified number of layers, %d.", v109, v110, v111, v112, v113, v114, v115, v98);
    }
    CFStringRef v116 = @"The message is too large for an Aztec barcode.";
    goto LABEL_135;
  }
  int v14 = sub_8730(v244, @"AztecOptionUseCompactStyle", dword_1579C);
  BOOL v267 = v14 != 0;
  int v15 = sub_8730(v244, @"AztecOptionMessageCodeWordCount", dword_15784);
  int v16 = sub_8730(v244, @"AztecOptionLayers", dword_15790);
  int v24 = v16;
  unsigned int v25 = &unk_15364;
  if (v14) {
    unsigned int v25 = &unk_15350;
  }
  int v26 = v25[v16];
  if (v16 >= 3)
  {
    if (v16 >= 9)
    {
      if (v16 >= 0x17) {
        int v27 = 12;
      }
      else {
        int v27 = 10;
      }
    }
    else
    {
      int v27 = 8;
    }
  }
  else
  {
    int v27 = 6;
  }
  signed int v262 = v27;
  if (v15 >= v26)
  {
    v235 = @"Number of message codewords must be less than the number of symbol codewords.";
    goto LABEL_335;
  }
  if (v27 * v15 > (unint64_t)(8 * (void)[v245 length]))
  {
    v235 = @"Insufficient message data supplied for Aztec symbol with explicit geometry";
LABEL_335:
    sub_E204(v235, v17, v18, v19, v20, v21, v22, v23, decode);
  }
  id v83 = +[NSMutableData dataWithLength:4 * v26];
  id v84 = v245;
  int v85 = v15;
  if ((int)(8 * [v84 length]) / v262 <= v15) {
    int v85 = (int)(8 * [v84 length]) / v262;
  }
  id v86 = v84;
  *(void *)&v284[0] = [v86 bytes];
  *((void *)&v284[0] + 1) = [v86 length];
  v284[1] = 0uLL;
  id v87 = v83;
  uint64_t v88 = [v87 mutableBytes];
  if (v85 >= 1)
  {
    id v89 = v88;
    uint64_t v90 = v85;
    do
    {
      *v89++ = sub_E600((uint64_t)v284, v262);
      --v90;
    }
    while (v90);
  }

LABEL_200:
  id v149 = v87;
  id v150 = [v149 mutableBytes];
  if (v24 >= 0x17) {
    int v151 = 4096;
  }
  else {
    int v151 = 1024;
  }
  if (v24 >= 0x17) {
    int v152 = 4201;
  }
  else {
    int v152 = 1033;
  }
  if (v24 >= 9) {
    unsigned int v153 = v151;
  }
  else {
    unsigned int v153 = 256;
  }
  if (v24 >= 9) {
    int v154 = v152;
  }
  else {
    int v154 = 301;
  }
  if (v24 >= 3) {
    size_t v155 = v153;
  }
  else {
    size_t v155 = 64;
  }
  if (v24 >= 3) {
    int v156 = v154;
  }
  else {
    int v156 = 67;
  }
  sub_E870((uint64_t)v150, v15, v26 - v15, v155, v156);
  int v157 = v24 - 1;
  int v158 = v15 - 1;
  if (v267)
  {
    LODWORD(v277) = (v158 >> 4) | (4 * v157);
    int v159 = 5;
    int v160 = 2;
    uint64_t v161 = 1;
  }
  else
  {
    LODWORD(v277) = v157 >> 1;
    DWORD1(v277) = (8 * (v157 & 1)) | (v158 >> 8);
    DWORD2(v277) = v158 >> 4;
    int v159 = 6;
    int v160 = 4;
    uint64_t v161 = 3;
  }
  *((_DWORD *)&v277 + v161) = v158 & 0xF;
  sub_E870((uint64_t)&v277, v160, v159, 0x10uLL, 19);
  id v162 = v149;
  v258 = [v162 bytes];
  unint64_t v163 = (unint64_t)[v162 length];
  if (v267) {
    size_t v164 = (int *)&unk_15894;
  }
  else {
    size_t v164 = (int *)&unk_158A8;
  }
  uint64_t v165 = v164[v24];
  uint64_t v166 = 4 * ((int)v165 + 4);
  size_t v242 = (int)v166 * ((int)v165 + 4);
  size_t height = v165 + 4;
  uint64_t v167 = (char *)malloc_type_malloc(v242, 0x9B9B106FuLL);
  int v168 = v167;
  if ((int)v165 >= 0) {
    int v169 = v165;
  }
  else {
    int v169 = v165 + 1;
  }
  int v170 = v169 >> 1;
  *(void *)&v284[0] = _NSConcreteStackBlock;
  *((void *)&v284[0] + 1) = 3221225472;
  *(void *)&v284[1] = sub_ED50;
  *((void *)&v284[1] + 1) = &unk_1C588;
  *(void *)&v284[2] = v167;
  DWORD2(v284[2]) = (v169 >> 1) + 2;
  HIDWORD(v284[2]) = 4 * (v165 + 4);
  v272 = objc_retainBlock(v284);
  uint64_t v171 = 0;
  unint64_t v260 = v163 >> 2;
  uint64_t v273 = 0x100000000;
  id v274 = (id)vadd_s32(vdup_n_s32(v165), (int32x2_t)0x300000002);
  do
  {
    memset(&v168[*(int *)((char *)&v273 + v171) * v166], 255, (int)v166);
    v171 += 4;
  }
  while (v171 != 16);
  v241 = v162;
  uint64_t v172 = 0;
  if ((int)height <= 1) {
    uint64_t v173 = 1;
  }
  else {
    uint64_t v173 = height;
  }
  do
  {
    if ((int)v165 >= -3)
    {
      v174 = &v168[4 * *((int *)&v273 + v172)];
      uint64_t v175 = v173;
      do
      {
        *(_DWORD *)v174 = -1;
        v174 += (int)v166;
        --v175;
      }
      while (v175);
    }
    ++v172;
  }
  while (v172 != 4);
  int v250 = v170;
  size_t bytesPerRow = (int)v166;
  v240 = v168;
  if (v267) {
    int v176 = 11;
  }
  else {
    int v176 = 15;
  }
  int v252 = v176;
  unsigned int v177 = v176 - 2;
  uint64_t v178 = -((v176 - 2) >> 1);
  uint64_t v179 = (v176 - 2) >> 1;
  uint64_t v180 = v179 | 1;
  uint64_t v181 = v178;
  do
  {
    if ((int)v181 >= 0) {
      unsigned int v182 = v181;
    }
    else {
      unsigned int v182 = -(int)v181;
    }
    unsigned int v183 = v177;
    uint64_t v184 = -(v177 >> 1);
    do
    {
      if ((int)v184 >= 0) {
        unsigned int v185 = v184;
      }
      else {
        unsigned int v185 = -(int)v184;
      }
      if (v182 > v185) {
        LOBYTE(v185) = v182;
      }
      (*((void (**)(_OWORD *, uint64_t, uint64_t, BOOL))v272 + 2))(v272, v181, v184, (v185 & 1) == 0);
      uint64_t v184 = (v184 + 1);
      --v183;
    }
    while (v183);
    uint64_t v181 = (v181 + 1);
  }
  while (v181 != v180);
  uint64_t v186 = ~v179;
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v186, v180, 1);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v178, v180, 1);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v186, v179, 1);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v179, v180, 0);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v180, v180, 1);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v180, v179, 1);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v180, v178, 1);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v180, v186, 0);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v179, v186, 0);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v178, v186, 0);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v186, v186, 0);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v186, v178, 0);
  if (!v267)
  {
    int v187 = v165 + 31;
    if ((int)v165 >= 0) {
      int v187 = v165;
    }
    if ((int)v165 >= -31)
    {
      int v188 = v187 >> 5;
      int v189 = -(v187 >> 5);
      LOBYTE(v187) = v250;
      unsigned int v265 = -v250;
      if (v250 >= 0) {
        int v190 = v250;
      }
      else {
        int v190 = -v250;
      }
      if (v188 >= 0) {
        int v191 = v188;
      }
      else {
        int v191 = -v188;
      }
      int v192 = v189;
      do
      {
        if ((int)v165 >= -1)
        {
          uint64_t v193 = v265;
          do
          {
            (*((void (**)(_OWORD *, void, uint64_t, BOOL))v272 + 2))(v272, (16 * v192), v193, (v193 & 1) == 0);
            uint64_t v193 = (v193 + 1);
          }
          while (v190 + 1 != v193);
        }
        BOOL v216 = v192++ == v191;
      }
      while (!v216);
      int v194 = v190 + 1;
      do
      {
        if ((int)v165 >= -1)
        {
          uint64_t v195 = v265;
          do
          {
            (*((void (**)(_OWORD *, uint64_t, void, BOOL))v272 + 2))(v272, v195, (16 * v189), (v195 & 1) == 0);
            uint64_t v195 = (v195 + 1);
          }
          while (v194 != v195);
        }
        BOOL v216 = v189++ == v191;
      }
      while (!v216);
    }
  }
  uint64_t v196 = 0;
  int v197 = 0;
  do
  {
    unsigned int v198 = 0;
    v199 = &dword_1592C[2 * v196];
    do
    {
      if (v198 >= 2 && v198 <= v252 - 3 && (v267 || v186 && v180))
      {
        (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v272 + 2))(v272, v186, v180, (*((_DWORD *)&v277 + v197 / 4) >> ((v187 & 0xFC) - v197 + 3)) & 1);
        ++v197;
      }
      uint64_t v186 = (*v199 + v186);
      uint64_t v180 = (v199[1] + v180);
      ++v198;
    }
    while (v252 - 1 != v198);
    ++v196;
  }
  while (v196 != 4);
  if (v24 >= 1)
  {
    int v200 = 0;
    uint64_t v246 = (v24 + 1);
    uint64_t v201 = 1;
    do
    {
      uint64_t v202 = 0;
      LODWORD(v203) = 0;
      LODWORD(v204) = 0;
      v205 = &unk_158A8;
      if (v267) {
        v205 = &unk_15894;
      }
      uint64_t v248 = v201;
      int v206 = v205[v201];
      if (v206 >= 0) {
        int v207 = v206;
      }
      else {
        int v207 = v206 + 1;
      }
      int v208 = 1 - (v207 >> 1);
      if (!v267 && (v208 & 0xF) == 0) {
        int v208 = 2 - (v207 >> 1);
      }
      if (v267 || (((_BYTE)v208 + 1) & 0xF) != 0) {
        uint64_t v209 = (v208 + 1);
      }
      else {
        uint64_t v209 = (v208 + 2);
      }
      int v210 = v206 - (v209 + (v207 >> 1));
      uint64_t v211 = (v207 >> 1);
      int v251 = v210;
      do
      {
        uint64_t v253 = (v202 + 1) & 3;
        uint64_t v255 = v202 + 1;
        if (v210 >= 1)
        {
          v212 = &dword_1592C[2 * ((v202 + 1) & 3)];
          v266 = v212 + 1;
          v213 = &dword_1592C[2 * v202];
          while (!v267)
          {
            if ((v209 & 0xF) != 0 && (v211 & 0xF) != 0)
            {
              unsigned int v214 = *v212 + v209;
              unsigned int v215 = *v266 + v211;
              BOOL v216 = (v214 & 0xF) == 0 || (v215 & 0xF) == 0;
              if (v216) {
                uint64_t v204 = v214 + *v212;
              }
              else {
                uint64_t v204 = v214;
              }
              if (v216) {
                uint64_t v203 = v215 + *v266;
              }
              else {
                uint64_t v203 = v215;
              }
              goto LABEL_311;
            }
LABEL_315:
            uint64_t v209 = (*v213 + v209);
            uint64_t v211 = (v213[1] + v211);
            if (!--v210) {
              goto LABEL_316;
            }
          }
          uint64_t v204 = (*v212 + v209);
          uint64_t v203 = (*v266 + v211);
LABEL_311:
          if (~(v200 / v262) + (int)v260 < 0)
          {
            uint64_t v220 = 0;
            uint64_t v219 = 0;
          }
          else
          {
            unsigned int v217 = v258[(~(v200 / v262) + v260)];
            int v218 = v200 + 1;
            uint64_t v219 = (v217 >> (v200 % v262)) & 1;
            v200 += 2;
            uint64_t v220 = (v217 >> (v218 % v262)) & 1;
          }
          (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v204, v203, v219);
          (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v272 + 2))(v272, v209, v211, v220);
          goto LABEL_315;
        }
LABEL_316:
        v221 = &dword_1592C[2 * v253];
        int v222 = *v221;
        int v223 = v221[1];
        uint64_t v209 = (v222 + v204);
        uint64_t v211 = (v223 + v203);
        if (!v267)
        {
          BOOL v224 = (((_BYTE)v222 + (_BYTE)v204) & 0xF) == 0 || (((_BYTE)v223 + (_BYTE)v203) & 0xF) == 0;
          unsigned int v225 = v209 + v222;
          unsigned int v226 = v211 + v223;
          if (v224) {
            uint64_t v209 = v225;
          }
          else {
            uint64_t v209 = v209;
          }
          if (v224) {
            uint64_t v211 = v226;
          }
          else {
            uint64_t v211 = v211;
          }
        }
        int v210 = v251;
        uint64_t v202 = v255;
      }
      while (v255 != 4);
      uint64_t v201 = v248 + 1;
    }
    while (v248 + 1 != v246);
  }
  CFDataRef v227 = (const __CFData *)[objc_alloc((Class)NSData) initWithBytesNoCopy:v240 length:v242 freeWhenDone:1];
  v228 = CGDataProviderCreateWithCFData(v227);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v230 = CGImageCreate(height, height, 8uLL, 0x20uLL, bytesPerRow, DeviceRGB, 0x2002u, v228, 0, 0, kCGRenderingIntentDefault);
  CFRelease(DeviceRGB);
  CFRelease(v228);

  return v230;
}

void sub_E178(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    BOOL v12 = v11;
    if (a11) {
      *a11 = v11;
    }

    objc_end_catch();
    JUMPOUT(0xE04CLL);
  }
  _Unwind_Resume(a1);
}

void sub_E204(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a1 arguments:&a9];
  v13[0] = NSLocalizedDescriptionKey;
  uint64_t v10 = [@"Unable to create barcode. " stringByAppendingString:v9];
  v13[1] = NSLocalizedFailureReasonErrorKey;
  v14[0] = v10;
  v14[1] = v9;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v12 = +[NSError errorWithDomain:@"com.apple.aztec" code:0 userInfo:v11];
  objc_exception_throw(v12);
}

uint64_t sub_E2E0(uint64_t result)
{
  switch(*(_DWORD *)result)
  {
    case 0:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_E4D0;
      goto LABEL_9;
    case 1:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_E4F0;
      goto LABEL_9;
    case 2:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_E510;
      goto LABEL_9;
    case 3:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_E52C;
      goto LABEL_9;
    case 4:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_E548;
      goto LABEL_9;
    case 5:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_E584;
LABEL_9:
      v1[53].ivars = v2;
      uint64_t result = ((uint64_t (*)(void))v2)(*(unsigned __int8 *)(result + 4));
      break;
    case 6:
      return result;
    default:
      uint64_t result = ((uint64_t (*)(void))off_20F18)(*(unsigned __int8 *)(result + 4));
      break;
  }
  return result;
}

uint64_t sub_E3BC(unsigned __int8 *a1, uint64_t a2)
{
  return sub_E598(a2, *a1, 8);
}

uint64_t sub_E3D0(unsigned int *a1, uint64_t a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = qword_153E8[6 * *a1 + v3];
  int v5 = dword_15508[6 * *a1 + v3];
  if (v3 == 5) {
    int v6 = -5;
  }
  else {
    int v6 = 0;
  }
  return sub_E598(a2, v4, v6 + v5);
}

uint64_t sub_E418(unsigned int *a1, uint64_t a2)
{
  return sub_E598(a2, qword_15598[6 * *a1 + a1[1]], dword_156B8[6 * *a1 + a1[1]]);
}

uint64_t sub_E450(unsigned int *a1, uint64_t a2)
{
  return sub_E598(a2, *a1, 5);
}

uint64_t sub_E464(unsigned __int16 *a1, uint64_t a2)
{
  unint64_t v3 = *a1;
  if (v3 > 0x1F)
  {
    sub_E598(a2, 0, 5);
    unint64_t v3 = *a1 - 31;
    uint64_t v4 = a2;
    int v5 = 11;
  }
  else
  {
    uint64_t v4 = a2;
    int v5 = 5;
  }

  return sub_E598(v4, v3, v5);
}

uint64_t sub_E4D0(unsigned int a1, uint64_t a2)
{
  if (a1 == 32) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = a1 - 63;
  }
  return sub_E598(a2, v3, 5);
}

uint64_t sub_E4F0(unsigned int a1, uint64_t a2)
{
  if (a1 == 32) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = a1 - 95;
  }
  return sub_E598(a2, v3, 5);
}

uint64_t sub_E510(unsigned int a1, uint64_t a2)
{
  return sub_E598(a2, *((char *)&qword_20F20 + a1), 5);
}

uint64_t sub_E52C(int a1, uint64_t a2)
{
  return sub_E598(a2, byte_20FA0[a1], 5);
}

uint64_t sub_E548(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = 13;
  uint64_t v4 = a1 - 46;
  if (a1 == 44) {
    uint64_t v4 = 12;
  }
  if (a1 != 46) {
    uint64_t v3 = v4;
  }
  if (a1 == 32) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v3;
  }
  return sub_E598(a2, v5, 4);
}

uint64_t sub_E584(unsigned int a1, uint64_t a2)
{
  return sub_E598(a2, a1, 8);
}

uint64_t sub_E598(uint64_t result, uint64_t a2, int a3)
{
  unsigned int v3 = *(_DWORD *)(result + 24);
  if (v3 >= 8)
  {
    uint64_t v4 = *(void *)(result + 8);
    do
    {
      if (!v4) {
        break;
      }
      unsigned int v5 = v3 - 8;
      *(_DWORD *)(result + 24) = v5;
      uint64_t v6 = *(void *)(result + 16) >> v5;
      uint64_t v7 = (unsigned char *)(*(void *)result)++;
      *uint64_t v7 = v6;
      uint64_t v4 = *(void *)(result + 8) - 1;
      *(void *)(result + 8) = v4;
      unsigned int v3 = *(_DWORD *)(result + 24);
    }
    while (v3 > 7);
  }
  *(void *)(result + 16) = (*(void *)(result + 16) << a3) | a2;
  *(_DWORD *)(result + 24) = v3 + a3;
  return result;
}

uint64_t sub_E600(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 24);
  if (v2 >= a2)
  {
    unint64_t v3 = *(void *)(a1 + 16);
  }
  else
  {
    unint64_t v3 = *(void *)(a1 + 16);
    uint64_t v4 = *(void *)(a1 + 8) - 1;
    do
    {
      v3 <<= 8;
      *(void *)(a1 + 8) = v4;
      *(void *)(a1 + 16) = v3;
      if (v4 != -1)
      {
        unsigned int v5 = (unsigned __int8 *)(*(void *)a1)++;
        v3 |= *v5;
        *(void *)(a1 + 16) = v3;
      }
      v2 += 8;
      *(_DWORD *)(a1 + 24) = v2;
      --v4;
    }
    while (v2 < a2);
  }
  unsigned int v6 = v2 - a2;
  *(_DWORD *)(a1 + 24) = v6;
  unint64_t v7 = v3 >> v6;
  if (a2 <= 0x1F) {
    int v8 = ~(-1 << a2);
  }
  else {
    int v8 = -1;
  }
  return v8 & v7;
}

void sub_E67C(id a1)
{
  uint64_t v1 = 0;
  qword_20F20 = 0;
  *(void *)algn_20F28 = 0;
  dword_20F38 = 0;
  qword_20F30 = 0;
  do
  {
    *((unsigned char *)&qword_20F20 + byte_15748[v1]) = v1;
    ++v1;
  }
  while (v1 != 28);
  uint64_t v2 = 0;
  qword_20FA1 = 0;
  unk_20FA9 = 0;
  *(uint64_t *)((char *)&qword_20FB1 + 6) = 0;
  qword_20FB1 = 0;
  do
  {
    byte_20FA0[byte_15764[v2]] = v2;
    ++v2;
  }
  while (v2 != 31);
  byte_20FA0[0] = 0;
}

void *sub_E6F8(size_t a1)
{
  uint64_t v2 = malloc_type_malloc(0x20uLL, 0x1020040D9E1CEDCuLL);
  if (!a1) {
    sub_10AE0();
  }
  unint64_t v3 = v2;
  void *v2 = malloc_type_calloc(a1, 0x18uLL, 0x10200405AF6BDC9uLL);
  v3[1] = a1;
  v3[2] = 0;
  v3[3] = 0;
  return v3;
}

size_t sub_E764(void *a1)
{
  uint64_t v1 = a1;
  size_t v2 = a1[1];
  for (size_t i = a1[2]; i >= v2; v1 = a1)
  {
    a1 = (void *)v1[3];
    if (!a1)
    {
      a1 = sub_E6F8(v2);
      v1[3] = a1;
    }
    size_t v2 = a1[1];
    size_t i = a1[2];
  }
  uint64_t v4 = *a1;
  a1[2] = i + 1;
  return v4 + 24 * i;
}

BOOL sub_E7D0(int a1)
{
  return a1 == 32 || (a1 - 65) < 0x1A;
}

BOOL sub_E7E4(int a1)
{
  return a1 == 32 || (a1 - 97) < 0x1A;
}

BOOL sub_E7F8(unsigned int a1)
{
  return (a1 & 0x80) == 0 && *((unsigned char *)&qword_20F20 + a1) != 0;
}

BOOL sub_E81C(int a1)
{
  return (a1 & 0x80) == 0 && byte_20FA0[a1] != 0;
}

uint64_t sub_E840(int a1)
{
  BOOL v2 = (a1 - 48) < 0xA || (a1 & 0xFFFFFFFD) == 44;
  return a1 == 32 || v2;
}

uint64_t sub_E868()
{
  return 1;
}

void sub_E870(uint64_t a1, int a2, int a3, size_t size, int a5)
{
  int v6 = size;
  size_t v9 = size;
  uint64_t v10 = malloc_type_calloc(4uLL, size, 0x56D77ED4uLL);
  uint64_t v11 = (unsigned int *)malloc_type_calloc(4uLL, v9, 0xDF162FBEuLL);
  *uint64_t v10 = 1 - v6;
  *uint64_t v11 = 1;
  if (v6 > 1)
  {
    uint64_t v12 = 0;
    do
    {
      BOOL v13 = &v11[v12];
      if ((int)(2 * *v13) >= (int)v9) {
        int v14 = a5;
      }
      else {
        int v14 = 0;
      }
      int v15 = v14 ^ (2 * *v13);
      v13[1] = v15;
      v10[v15] = ++v12;
    }
    while (v9 - 1 != v12);
  }
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_ECBC;
  v51[3] = &unk_1C508;
  size_t v39 = v11;
  v51[4] = v11;
  v51[5] = v10;
  int v37 = v10;
  int v52 = v6;
  int v16 = objc_retainBlock(v51);
  uint64_t v17 = malloc_type_calloc(4uLL, a3 + 1, 0x4F07CC1uLL);
  uint64_t v18 = v17;
  int v38 = a3 - 1;
  int v40 = a3;
  if (a3 < 1)
  {
    *uint64_t v17 = 1;
  }
  else
  {
    uint64_t v19 = a3;
    bzero(v17 + 1, 4 * a3);
    uint64_t v20 = 0;
    uint64_t v21 = 1;
    _DWORD *v18 = 1;
    unint64_t v22 = 1;
    do
    {
      v18[v22] = v18[v22 - 1];
      uint64_t v23 = v39[v22];
      uint64_t v24 = v20;
      if (v22 >= 2)
      {
        do
        {
          int v25 = v18[(v24 - 1)];
          v18[v24] = ((uint64_t (*)(void *, void, uint64_t))v16[2])(v16, v18[v24], v23) ^ v25;
        }
        while (v24-- > 1);
        uint64_t v21 = *v18;
      }
      uint64_t v21 = ((uint64_t (*)(void *, uint64_t, uint64_t))v16[2])(v16, v21, v23);
      _DWORD *v18 = v21;
      ++v22;
      ++v20;
    }
    while (v20 != v19);
  }
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_ECF4;
  v48[3] = &unk_1C528;
  v48[4] = a1;
  int v27 = v40;
  int v49 = v40;
  int v50 = a2;
  uint64_t v42 = objc_retainBlock(v48);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_ED24;
  v46[3] = &unk_1C548;
  int v47 = v40;
  v46[4] = a1 + 4 * a2;
  id v28 = objc_retainBlock(v46);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_ED44;
  v45[3] = &unk_1C568;
  void v45[4] = a1 + 4 * a2;
  uint64_t v41 = objc_retainBlock(v45);
  bzero((void *)(a1 + 4 * a2), 4 * v40);
  if (a2 >= 1)
  {
    uint64_t v29 = (v38 + a2);
    do
    {
      unsigned int v30 = ((uint64_t (*)(void *, void))v28[2])(v28, 0);
      int v43 = v29;
      int v31 = ((uint64_t (*)(void *, uint64_t))v42[2])(v42, v29);
      if (v27 >= 1)
      {
        uint64_t v32 = 0;
        uint64_t v33 = v31 ^ v30;
        int v34 = v38;
        do
        {
          unsigned int v35 = ((uint64_t (*)(void *, uint64_t))v28[2])(v28, v32 + 1);
          int v36 = ((uint64_t (*)(void *, uint64_t, void))v16[2])(v16, v33, v18[v34]);
          ((void (*)(void *, void, uint64_t))v41[2])(v41, v36 ^ v35, v32);
          --v34;
          ++v32;
        }
        while (v40 != v32);
      }
      uint64_t v29 = (v43 - 1);
      int v27 = v40;
    }
    while (v43 > v40);
  }
  free(v18);
  free(v39);
  free(v37);
}

uint64_t sub_ECBC(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = 0;
  if (a2 && a3) {
    return *(unsigned int *)(*(void *)(a1 + 32)
  }
                           + 4
                           * ((*(_DWORD *)(*(void *)(a1 + 40) + 4 * a3)
                             + *(_DWORD *)(*(void *)(a1 + 40) + 4 * a2))
                            % (*(_DWORD *)(a1 + 48) - 1)));
  return v3;
}

uint64_t sub_ECF4(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2 <= a2) {
    return *(unsigned int *)(*(void *)(a1 + 32) + 4 * (v2 + ~a2 + *(_DWORD *)(a1 + 44)));
  }
  else {
    return 0;
  }
}

uint64_t sub_ED24(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 40) <= a2) {
    return 0;
  }
  else {
    return *(unsigned int *)(*(void *)(a1 + 32) + 4 * a2);
  }
}

uint64_t sub_ED44(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(*(void *)(result + 32) + 4 * a3) = a2;
  return result;
}

uint64_t sub_ED50(uint64_t result, int a2, int a3, int a4)
{
  int v4 = *(_DWORD *)(result + 40);
  int v5 = v4 - a3;
  int v6 = v4 + a2;
  uint64_t v7 = *(void *)(result + 32) + *(int *)(result + 44) * (uint64_t)v5;
  if (a4) {
    int v8 = -16777216;
  }
  else {
    int v8 = -1;
  }
  *(_DWORD *)(v7 + 4 * v6) = v8;
  return result;
}

uint64_t sub_EEB0(int a1, void *a2, void *a3)
{
  if (sub_95A0(a3, 7, 4u)) {
    uint64_t v6 = sub_95A0(a3, a1, 8u);
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

void sub_EF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CGImageRef sub_EF28(void *a1, void *a2, int a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  uint64_t v24 = 0;
  unsigned int v9 = [v8 isEqualToString:@"L"];
  unsigned int v10 = [v8 isEqualToString:@"Q"];
  unsigned int v11 = [v8 isEqualToString:@"H"];
  LODWORD(v25) = 4;
  unsigned int v12 = v9 ^ 1;
  if (v10) {
    unsigned int v12 = 2;
  }
  *((void *)&v25 + 1) = 0;
  *(void *)&long long v26 = -1;
  if (v11) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v12;
  }
  *((void *)&v26 + 1) = -1;
  *(void *)&long long v27 = -1;
  DWORD2(v27) = -1;
  uint64_t v28 = 0;
  switch(v13)
  {
    case 1:
      int v15 = 0;
      v23[0] = 1;
      CFStringRef v14 = @"M";
      break;
    case 2:
      v23[0] = 2;
      CFStringRef v14 = @"Q";
      int v15 = 3;
      break;
    case 3:
      v23[0] = 3;
      CFStringRef v14 = @"H";
      int v15 = 2;
      break;
    default:
      v23[0] = 0;
      CFStringRef v14 = @"L";
      int v15 = 1;
      break;
  }
  v23[1] = v15;
  uint64_t v24 = (__CFString *)v14;
  int v16 = sub_4A90(a4, v23, (uint64_t)&v25);
  if (v26 == a4) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v17 == 1 && (unint64_t v18 = (int)v27, (unint64_t)[v7 length] >= v18))
  {
    DWORD2(v26) = a3;
    id v22 = [v7 bytes];
    v21[0] = 8 * v27;
    v21[1] = v27;
    CGImageRef v19 = sub_6ED4((uint64_t)&v25, (uint64_t)v21);
  }
  else
  {
    CGImageRef v19 = 0;
  }

  return v19;
}

void sub_F0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_F128(void *a1, void *a2)
{
  id v3 = a1;
  if ([a2 isEqualToString:@"Shift_JIS"])
  {
    BOOL v4 = !sub_F228(v3);
    unsigned int v5 = 4;
    unsigned int v6 = 8;
  }
  else
  {
    if (![v3 length])
    {
LABEL_18:
      uint64_t v12 = 4;
      goto LABEL_19;
    }
    char v7 = 0;
    char v8 = 0;
    unint64_t v9 = 0;
    do
    {
      id v10 = v3;
      uint64_t v11 = *((unsigned __int8 *)[v10 bytes] + v9);
      if ((v11 - 48) >= 0xA)
      {
        if (v11 > 0x5F || dword_15968[v11] == -1) {
          goto LABEL_18;
        }
        char v7 = 1;
      }
      else
      {
        char v8 = 1;
      }
      ++v9;
    }
    while (v9 < (unint64_t)[v10 length]);
    if (v8) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = 4;
    }
    BOOL v4 = (v7 & 1) == 0;
    unsigned int v6 = 2;
  }
  if (v4) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v6;
  }
LABEL_19:

  return v12;
}

BOOL sub_F228(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1) {
    goto LABEL_16;
  }
  int v3 = [v1 length];
  int v4 = v3;
  if (v3)
  {
    BOOL v10 = 0;
    goto LABEL_18;
  }
  if (v3 >= 1)
  {
    uint64_t v5 = 0;
    do
    {
      char v6 = *((unsigned char *)[v2 bytes] + v5);
      unsigned int v7 = (v6 + 127);
      unsigned int v8 = (v6 + 32);
      BOOL v10 = v7 < 0x1F || v8 < 0xC;
      v5 += 2;
    }
    while (v10 && (int)v5 < v4);
  }
  else
  {
LABEL_16:
    BOOL v10 = 1;
  }
LABEL_18:

  return v10;
}

uint64_t sub_F30C(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 length];
  if (v4 < 1)
  {
LABEL_12:
    uint64_t v12 = 1;
    goto LABEL_19;
  }
  LODWORD(v5) = 0;
  while (1)
  {
    id v6 = v3;
    unint64_t v7 = *((unsigned __int8 *)[v6 bytes] + (int)v5);
    if (v7 > 0x5F || (int v8 = dword_15968[v7], v8 == -1))
    {
      uint64_t v13 = sub_ACDC();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
    int v9 = v5;
    uint64_t v5 = (int)v5 + 1;
    if ((int)v5 < v4) {
      break;
    }
    if (!sub_95A0(a2, dword_15968[v7], 6u)) {
      goto LABEL_18;
    }
LABEL_11:
    if ((int)v5 >= v4) {
      goto LABEL_12;
    }
  }
  unint64_t v10 = *((unsigned __int8 *)[v6 bytes] + v5);
  if (v10 <= 0x5F)
  {
    int v11 = dword_15968[v10];
    if (v11 != -1)
    {
      if ((sub_95A0(a2, v11 + 45 * v8, 0xBu) & 1) == 0) {
        goto LABEL_18;
      }
      LODWORD(v5) = v9 + 2;
      goto LABEL_11;
    }
  }
  uint64_t v13 = sub_ACDC();
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
LABEL_16:
  sub_11630(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_17:

LABEL_18:
  uint64_t v12 = 0;
LABEL_19:

  return v12;
}

uint64_t sub_F468(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 length];
  if (v4 < 1)
  {
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v5 = 0;
    do
    {
      id v6 = v3;
      int v7 = *((unsigned __int8 *)[v6 bytes] + v5);
      int v8 = *((unsigned __int8 *)[v6 bytes] + v5 + 1) | (v7 << 8);
      int v9 = v8 - 33088;
      if ((v8 - 33088) >= 0x1EBD)
      {
        if ((v8 - 60352) > 0xFFFFF47F)
        {
          int v9 = v8 - 49472;
        }
        else
        {
          unint64_t v10 = sub_ACDC();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            sub_116A8(buf, &v16, v10);
          }

          int v9 = -1;
        }
      }
      uint64_t v11 = sub_95A0(a2, 192 * (v9 >> 8) + v9, 0xDu);
      v5 += 2;
      if (v11) {
        BOOL v12 = (int)v5 < v4;
      }
      else {
        BOOL v12 = 0;
      }
    }
    while (v12);
    uint64_t v13 = v11;
  }

  return v13;
}

void sub_F5D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_F5F4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_F628(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a1 arguments:&a9];
  v13[0] = NSLocalizedDescriptionKey;
  uint64_t v10 = [@"Unable to create barcode. " stringByAppendingString:v9];
  v13[1] = NSLocalizedFailureReasonErrorKey;
  v14[0] = v10;
  v14[1] = v9;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v12 = +[NSError errorWithDomain:@"com.apple.pdf417" code:0 userInfo:v11];
  objc_exception_throw(v12);
}

void sub_F700(void *a1, int a2, int a3, int a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = (unsigned __int8 *)[a1 bytes];
  uint64_t v11 = v10;
  if (a3 != 1 || a4)
  {
    HIDWORD(v12) = -1431655765 * a3 + 715827882;
    LODWORD(v12) = HIDWORD(v12);
    if ((v12 >> 1) >= 0x2AAAAAAB) {
      uint64_t v13 = &unk_1647A;
    }
    else {
      uint64_t v13 = &unk_16478;
    }
    [v9 appendBytes:v13 length:2];
    if (a3 <= 5)
    {
      int v14 = a3 + a2;
    }
    else
    {
      int v14 = a3 + a2;
      uint64_t v15 = a2;
      uint64_t v16 = &v11[a2];
      do
      {
        uint64_t v17 = 0;
        int64_t v18 = 0;
        do
          int64_t v18 = v16[v17++] | (unint64_t)(v18 << 8);
        while (v17 != 6);
        for (uint64_t i = 4; i != -1; --i)
        {
          v26[i] = v18 % 900;
          v18 /= 900;
        }
        [v9 appendBytes:v26 length:10];
        int v20 = v15 + 6;
        int v21 = v14 - v15;
        v16 += 6;
        v15 += 6;
      }
      while (v21 > 11);
      a2 = v20;
    }
    BOOL v22 = __OFSUB__(v14, a2);
    int v23 = v14 - a2;
    if (!((v23 < 0) ^ v22 | (v23 == 0)))
    {
      uint64_t v24 = &v11[a2];
      do
      {
        __int16 v25 = *v24++;
        v26[0] = v25;
        [v9 appendBytes:v26 length:2];
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    v26[0] = 913;
    v26[1] = v10[a2];
    [v9 appendBytes:v26 length:4];
  }
}

void sub_F8D8(void *a1, int a2, int a3, void *a4)
{
  id v7 = a1;
  id v33 = a4;
  id v31 = v7;
  int v8 = (char *)[v31 bytes];
  v30[1] = v30;
  if (a3 >= 1)
  {
    int v9 = 0;
    uint64_t v32 = &v8[a2];
    do
    {
      if (a3 - v9 >= 44) {
        int v10 = 44;
      }
      else {
        int v10 = a3 - v9;
      }
      char v35 = 49;
      __memcpy_chk();
      v36[v10] = 0;
      if (a3 - v9 > 0)
      {
        if (v10 <= 1) {
          uint64_t v18 = 1;
        }
        else {
          uint64_t v18 = v10;
        }
        uint64_t v19 = &v35;
        do
        {
          unsigned int v21 = *v19++;
          uint64_t v20 = v21;
          if ((v21 - 58) <= 0xF5u) {
            sub_F628(@"Message cannot be encoded with PDF417CompactionModeNumeric because it contains character '%d'", v11, v12, v13, v14, v15, v16, v17, v20);
          }
          --v18;
        }
        while (v18);
      }
      uint64_t v22 = 0;
      int v23 = 15;
      while (1)
      {
        char v24 = v35;
        if (!v35) {
          break;
        }
        uint64_t v25 = 0;
        char v26 = 1;
        long long v27 = v36;
        do
        {
          uint64_t v25 = 10 * v25 + v24 - 48;
          if (v25 >= 900)
          {
            char v26 = 0;
            char v28 = v25 / 0x384uLL + 48;
            v25 %= 0x384uLL;
          }
          else
          {
            char v28 = 48;
          }
          *(v27 - 1) = v28;
          int v29 = *v27++;
          char v24 = v29;
        }
        while (v29);
        v34[14 - v22++] = v25;
        --v23;
        if (v26) {
          goto LABEL_23;
        }
      }
      *(_WORD *)((char *)v34 + ((0xE00000000 - (v22 << 32)) >> 31)) = 0;
      LODWORD(v22) = v22 + 1;
      --v23;
LABEL_23:
      [v33 appendBytes:&v34[v23] length:(2 * v22)];
      v9 += v10;
    }
    while (v9 < a3);
  }
}

CGImageRef sub_FAF4(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  if (![v5 length])
  {
    uint64_t v48 = @"The message must contain at least one character.";
    goto LABEL_21;
  }
  if ((unint64_t)[v5 length] > 0x1000)
  {
    uint64_t v48 = @"The message is too long for a Code128 barcode.";
LABEL_21:
    sub_FDD0(v48, v6, v7, v8, v9, v10, v11, v12, (uint64_t)decode);
  }
  id v13 = v5;
  uint64_t v14 = (char *)[v13 bytes];
  uint64_t v15 = (char *)[v13 length];
  unint64_t v23 = (unint64_t)v15;
  if (v15)
  {
    char v24 = v14;
    uint64_t v25 = v15;
    do
    {
      int v26 = *v24++;
      if (v26 < 0) {
        sub_FDD0(@"The message contains non-7bit ascii characters.", v16, v17, v18, v19, v20, v21, v22, (uint64_t)decode);
      }
      --v25;
    }
    while (v25);
  }
  int v27 = sub_FEA8(v14, (unint64_t)v15, a2, 0);
  size_t v28 = a3 + 2 * a2;
  size_t v29 = 4 * v27;
  Mutable = CFDataCreateMutable(0, v29 * v28);
  CFDataSetLength(Mutable, v29 * v28);
  if (!Mutable) {
    sub_FDD0(@"Could not allocate memory for image.", v31, v32, v33, v34, v35, v36, v37, (uint64_t)decode);
  }
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_10724;
  v50[3] = &unk_1C7B8;
  v50[4] = MutableBytePtr;
  sub_FEA8(v14, v23, a2, v50);
  if (v28 >= 2)
  {
    uint64_t v39 = a3 + 2 * a2 - 1;
    uint64_t v40 = 4 * v27;
    do
    {
      memcpy(&MutableBytePtr[v40], MutableBytePtr, v29);
      v40 += v29;
      --v39;
    }
    while (v39);
  }
  if (a2)
  {
    uint64_t v41 = MutableBytePtr;
    unint64_t v42 = a2;
    do
    {
      memset(v41, 255, v29);
      v41 += v29;
      --v42;
    }
    while (v42);
  }
  if (v28 >= a2)
  {
    int v43 = &MutableBytePtr[4 * (v28 - a2) * v27];
    do
    {
      memset(v43, 255, v29);
      v43 += v29;
      --a2;
    }
    while (a2);
  }
  uint64_t v44 = CGDataProviderCreateWithCFData(Mutable);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v46 = CGImageCreate(v27, v28, 8uLL, 0x20uLL, v29, DeviceRGB, 1u, v44, 0, 0, kCGRenderingIntentDefault);
  CGColorSpaceRelease(DeviceRGB);
  CGDataProviderRelease(v44);
  CFRelease(Mutable);

  return v46;
}

void sub_FD7C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    if (a11) {
      *a11 = v11;
    }
    objc_end_catch();
    JUMPOUT(0xFD18);
  }
  _Unwind_Resume(a1);
}

void sub_FDD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = [objc_alloc((Class)NSString) initWithFormat:a1 arguments:&a9];
  v13[0] = NSLocalizedDescriptionKey;
  uint64_t v10 = [@"Unable to create barcode. " stringByAppendingString:v9];
  v13[1] = NSLocalizedFailureReasonErrorKey;
  v14[0] = v10;
  v14[1] = v9;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  id v12 = +[NSError errorWithDomain:@"com.apple.code128" code:0 userInfo:v11];
  objc_exception_throw(v12);
}

uint64_t sub_FEA8(unsigned char *a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = a4;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_1C7F8;
  }
  unsigned int v84 = 0;
  uint64_t v83 = 0;
  if (a3)
  {
    uint64_t v9 = 0;
    do
      v8->invoke(v8, v9++, 0, 0);
    while (a3 != v9);
    unsigned int v84 = v9;
  }
  unint64_t v10 = 10000000000;
  if (!a2)
  {
    char v72 = 0;
    goto LABEL_110;
  }
  do
  {
    do
    {
      while (1)
      {
        unint64_t v11 = 0;
        while (a1[v11] <= 0x5Fu)
        {
          if (a2 == ++v11)
          {
            unint64_t v11 = a2;
            break;
          }
        }
        unint64_t v12 = 0;
        while ((char)a1[v12] >= 32)
        {
          if (a2 == ++v12)
          {
            unint64_t v12 = a2;
            break;
          }
        }
        unint64_t v13 = 0;
        while (a1[v13] - 48 <= 9)
        {
          if (a2 == ++v13)
          {
            unint64_t v13 = a2;
            break;
          }
        }
        if (v83 != 66) {
          break;
        }
        if (v13 >= 6 && (v13 & 1) == 0)
        {
          uint64_t v17 = v84;
          BYTE1(v83) = (SBYTE1(v83) + 99 * HIDWORD(v83)++) % 103;
          unint64_t v21 = 10000000000;
          uint64_t v22 = "Code C";
          unint64_t v23 = 0x25AA9C926;
          do
          {
            BOOL v24 = v23 >= v21;
            if (v23 < v21) {
              unint64_t v25 = 0;
            }
            else {
              unint64_t v25 = v21;
            }
            v23 -= v25;
            v8->invoke(v8, v17, v24, v22);
            uint64_t v22 = 0;
            uint64_t v17 = (v17 + 1);
            BOOL v20 = v21 > 9;
            v21 /= 0xAuLL;
          }
          while (v20);
          goto LABEL_46;
        }
        if (!v12)
        {
          uint64_t v34 = v84;
          BYTE1(v83) = (SBYTE1(v83) + 101 * HIDWORD(v83)++) % 103;
          unint64_t v45 = 10000000000;
          CGImageRef v46 = "Code A";
          unint64_t v47 = 0x295ABFCA6;
          do
          {
            BOOL v48 = v47 >= v45;
            if (v47 < v45) {
              unint64_t v49 = 0;
            }
            else {
              unint64_t v49 = v45;
            }
            v47 -= v49;
            v8->invoke(v8, v34, v48, v46);
            CGImageRef v46 = 0;
            uint64_t v34 = (v34 + 1);
            BOOL v20 = v45 > 9;
            v45 /= 0xAuLL;
          }
          while (v20);
          goto LABEL_76;
        }
LABEL_104:
        int v70 = (char)*a1++;
        char v71 = v70 - 32;
        if (v70 <= 31) {
          char v53 = -1;
        }
        else {
          char v53 = v71;
        }
LABEL_107:
        sub_10764(v53, (uint64_t)&v83, (uint64_t)v8);
        if (!--a2) {
          goto LABEL_108;
        }
      }
      if (v83 == 65)
      {
        if (v13 >= 6 && (v13 & 1) == 0)
        {
          uint64_t v17 = v84;
          BYTE1(v83) = (SBYTE1(v83) + 99 * HIDWORD(v83)++) % 103;
          unint64_t v26 = 10000000000;
          int v27 = "Code C";
          unint64_t v28 = 0x25AA9C926;
          do
          {
            BOOL v29 = v28 >= v26;
            if (v28 < v26) {
              unint64_t v30 = 0;
            }
            else {
              unint64_t v30 = v26;
            }
            v28 -= v30;
            v8->invoke(v8, v17, v29, v27);
            int v27 = 0;
            uint64_t v17 = (v17 + 1);
            BOOL v20 = v26 > 9;
            v26 /= 0xAuLL;
          }
          while (v20);
          goto LABEL_46;
        }
        if (v11) {
          goto LABEL_78;
        }
        uint64_t v54 = v84;
        BYTE1(v83) = (SBYTE1(v83) + 100 * HIDWORD(v83)++) % 103;
        unint64_t v65 = 10000000000;
        int v66 = "Code B";
        unint64_t v67 = 0x25AAB28B6;
        do
        {
          BOOL v68 = v67 >= v65;
          if (v67 < v65) {
            unint64_t v69 = 0;
          }
          else {
            unint64_t v69 = v65;
          }
          v67 -= v69;
          v8->invoke(v8, v54, v68, v66);
          int v66 = 0;
          uint64_t v54 = (v54 + 1);
          BOOL v20 = v65 > 9;
          v65 /= 0xAuLL;
        }
        while (v20);
LABEL_103:
        unsigned int v84 = v54;
        LOBYTE(v83) = 66;
        goto LABEL_104;
      }
      if (!(_BYTE)v83)
      {
        if (v13 >= 2)
        {
          BYTE1(v83) = 105;
          HIDWORD(v83) = 1;
          unint64_t v14 = 0x2903F6FDCLL;
          unint64_t v15 = 10000000000;
          uint64_t v16 = "StartC";
          uint64_t v17 = v84;
          do
          {
            BOOL v18 = v14 >= v15;
            if (v14 < v15) {
              unint64_t v19 = 0;
            }
            else {
              unint64_t v19 = v15;
            }
            v14 -= v19;
            v8->invoke(v8, v17, v18, v16);
            uint64_t v16 = 0;
            uint64_t v17 = (v17 + 1);
            BOOL v20 = v15 > 9;
            v15 /= 0xAuLL;
          }
          while (v20);
LABEL_46:
          unsigned int v84 = v17;
          LOBYTE(v83) = 67;
          break;
        }
        if (v11 > v12)
        {
          BYTE1(v83) = 103;
          HIDWORD(v83) = 1;
          unint64_t v40 = 0x2903F44E4;
          unint64_t v41 = 10000000000;
          unint64_t v42 = "StartA";
          uint64_t v34 = v84;
          do
          {
            BOOL v43 = v40 >= v41;
            if (v40 < v41) {
              unint64_t v44 = 0;
            }
            else {
              unint64_t v44 = v41;
            }
            v40 -= v44;
            v8->invoke(v8, v34, v43, v42);
            unint64_t v42 = 0;
            uint64_t v34 = (v34 + 1);
            BOOL v20 = v41 > 9;
            v41 /= 0xAuLL;
          }
          while (v20);
LABEL_76:
          unsigned int v84 = v34;
          LOBYTE(v83) = 65;
LABEL_78:
          unsigned int v50 = *a1++;
          char v51 = v50 - 32;
          char v52 = v50 + 64;
          if (v50 >= 0x32) {
            char v53 = -1;
          }
          else {
            char v53 = v52;
          }
          if ((v51 & 0xC0) == 0) {
            char v53 = v51;
          }
          goto LABEL_107;
        }
        BYTE1(v83) = 104;
        HIDWORD(v83) = 1;
        unint64_t v60 = 10000000000;
        size_t v61 = "StartB";
        unint64_t v62 = 11010010000;
        uint64_t v54 = v84;
        do
        {
          BOOL v63 = v62 >= v60;
          if (v62 < v60) {
            unint64_t v64 = 0;
          }
          else {
            unint64_t v64 = v60;
          }
          v62 -= v64;
          v8->invoke(v8, v54, v63, v61);
          size_t v61 = 0;
          uint64_t v54 = (v54 + 1);
          BOOL v20 = v60 > 9;
          v60 /= 0xAuLL;
        }
        while (v20);
        goto LABEL_103;
      }
      if (v13 <= 1 && v83 == 67)
      {
        if (v11 > v12)
        {
          BYTE1(v83) = (SBYTE1(v83) + 101 * HIDWORD(v83)++) % 103;
          uint64_t v34 = v84;
          unint64_t v35 = 10000000000;
          uint64_t v36 = "Code A";
          unint64_t v37 = 0x295ABFCA6;
          do
          {
            BOOL v38 = v37 >= v35;
            if (v37 < v35) {
              unint64_t v39 = 0;
            }
            else {
              unint64_t v39 = v35;
            }
            v37 -= v39;
            v8->invoke(v8, v34, v38, v36);
            uint64_t v36 = 0;
            uint64_t v34 = (v34 + 1);
            BOOL v20 = v35 > 9;
            v35 /= 0xAuLL;
          }
          while (v20);
          goto LABEL_76;
        }
        BYTE1(v83) = (SBYTE1(v83) + 100 * HIDWORD(v83)++) % 103;
        uint64_t v54 = v84;
        unint64_t v55 = 10000000000;
        size_t v56 = "Code B";
        unint64_t v57 = 0x25AAB28B6;
        do
        {
          BOOL v58 = v57 >= v55;
          if (v57 < v55) {
            unint64_t v59 = 0;
          }
          else {
            unint64_t v59 = v55;
          }
          v57 -= v59;
          v8->invoke(v8, v54, v58, v56);
          size_t v56 = 0;
          uint64_t v54 = (v54 + 1);
          BOOL v20 = v55 > 9;
          v55 /= 0xAuLL;
        }
        while (v20);
        goto LABEL_103;
      }
    }
    while (v83 != 67);
    char v31 = a1[1];
    char v32 = v31 + 10 * *a1 - 16;
    if ((v31 - 58) < 0xF6u || (*a1 - 58) < 0xF6u) {
      char v32 = -1;
    }
    sub_10764(v32, (uint64_t)&v83, (uint64_t)v8);
    a1 += 2;
    a2 -= 2;
  }
  while (a2);
LABEL_108:
  char v72 = BYTE1(v83);
LABEL_110:
  sub_10764(v72, (uint64_t)&v83, (uint64_t)v8);
  p_invoke = (void (**)(void, void, void, void))&v8->invoke;
  unint64_t v74 = 0x28FA85FA2;
  uint64_t v75 = v84;
  uint64_t v76 = "Stop";
  do
  {
    BOOL v77 = v74 >= v10;
    if (v74 < v10) {
      unint64_t v78 = 0;
    }
    else {
      unint64_t v78 = v10;
    }
    v74 -= v78;
    v8->invoke(v8, v75, v77, v76);
    uint64_t v76 = 0;
    uint64_t v75 = (v75 + 1);
    BOOL v20 = v10 > 9;
    v10 /= 0xAuLL;
  }
  while (v20);
  unsigned int v84 = v75;
  invoke = (void (*)(void))v8->invoke;
  id v80 = v8;
  invoke();
  v8->invoke(v80, (v75 + 1), 1, 0);

  uint64_t v81 = (v75 + 2);
  unsigned int v84 = v75 + 2;
  if (a3)
  {
    do
    {
      (*p_invoke)(v80, v81, 0, 0);
      uint64_t v81 = (v81 + 1);
      --a3;
    }
    while (a3);
    unsigned int v84 = v81;
  }

  return v81;
}

uint64_t sub_10724(uint64_t result, int a2, char a3)
{
  uint64_t v3 = 4 * a2;
  *(unsigned char *)(*(void *)(result + 32) + (int)v3 + 2) = a3 - 1;
  *(unsigned char *)(*(void *)(result + 32) + v3 + 1) = a3 - 1;
  *(unsigned char *)(*(void *)(result + 32) + v3) = a3 - 1;
  *(unsigned char *)(*(void *)(result + 32) + (int)v3 + 3) = -1;
  return result;
}

uint64_t sub_10764(int a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = qword_1A040[a1];
  if ((a1 - 103) > 2)
  {
    int v7 = *(_DWORD *)(a2 + 4);
    *(unsigned char *)(a2 + 1) = (*(char *)(a2 + 1) + v7 * a1) % 103;
    int v6 = v7 + 1;
  }
  else
  {
    *(unsigned char *)(a2 + 1) = a1;
    int v6 = 1;
  }
  *(_DWORD *)(a2 + 4) = v6;
  uint64_t v8 = *(unsigned int *)(a2 + 8);
  unint64_t v9 = 10000000000;
  do
  {
    BOOL v10 = v5 >= v9;
    if (v5 < v9) {
      unint64_t v11 = 0;
    }
    else {
      unint64_t v11 = v9;
    }
    v5 -= v11;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, BOOL))(a3 + 16))(a3, v8, v10);
    uint64_t v8 = (*(_DWORD *)(a2 + 8) + 1);
    *(_DWORD *)(a2 + 8) = v8;
    BOOL v13 = v9 >= 0xA;
    v9 /= 0xAuLL;
  }
  while (v13);
  return result;
}

void sub_10854()
{
}

void sub_10880()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "CIBarcodeGenerator could not generate an image", v2, v3, v4, v5, v6);
}

void sub_108B4(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_C340();
  sub_C370(&dword_0, v2, v3, "%{public}s %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10944(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_C340();
  sub_C370(&dword_0, v2, v3, "%{public}s %{public}@", v4, v5, v6, v7, 2u);
}

void sub_109D4()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "Value for key inputBarcodeDescriptor of type CIDataMatrixCodeDescriptor is not yet supported", v2, v3, v4, v5, v6);
}

void sub_10A08()
{
  objc_opt_class();
  sub_C340();
  id v1 = v0;
  sub_C370(&dword_0, v2, v3, "%{public}s Unsupported value for key inputBarcodeDescriptor of class %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10A9C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "QRCode Generator: versionForNumber version number is not between 0 and 40\n", v1, 2u);
}

void sub_10AE0()
{
}

void sub_10B0C()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: inverse argument error", v2, v3, v4, v5, v6);
}

void sub_10B40()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: createMonomial arugment error", v2, v3, v4, v5, v6);
}

void sub_10B74()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: fillPoly argument error", v2, v3, v4, v5, v6);
}

void sub_10BA8()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: polyCoefficient argument error", v2, v3, v4, v5, v6);
}

void sub_10BDC()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: multiplyByMonomial arugment error", v2, v3, v4, v5, v6);
}

void sub_10C10()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: divide by 0", v2, v3, v4, v5, v6);
}

void sub_10C44()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: encode no error correction bytes", v2, v3, v4, v5, v6);
}

void sub_10C78()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: encode no data bytes provided", v2, v3, v4, v5, v6);
}

void sub_10CAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10D24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10D9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10E14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10E8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10F04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10F7C(unsigned int *a1, int a2, NSObject *a3)
{
  int v4 = 136446722;
  uint64_t v5 = "embedDataBits";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  unsigned int v9 = sub_66CC(a1);
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{public}s not all bits consumed: %i / %i", (uint8_t *)&v4, 0x18u);
}

void sub_11028(unsigned int *a1)
{
  sub_66CC(a1);
  sub_F614();
  sub_F5F4(&dword_0, v1, v2, "%{public}s should not happen but we got: %d", v3, v4, v5, v6, 2u);
}

void sub_110AC(unsigned int *a1)
{
  sub_66CC(a1);
  sub_F614();
  sub_F5F4(&dword_0, v1, v2, "%{public}s should not happen but we got: %d", v3, v4, v5, v6, 2u);
}

void sub_11130(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_111A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11220(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "embedPositionAdjustmentPattern";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s the matrix element should be empty", buf, 0xCu);
}

void sub_11270(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_112E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11360(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_113D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11450(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_114C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11540(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_115B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11630(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_116A8(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136446210;
  *a2 = "appendKanjiBytes";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s invalid byte sequence", buf, 0xCu);
}

void sub_116F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11770(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_117E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11860()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: bitAt parameter index out of range", v2, v3, v4, v5, v6);
}

void sub_11894()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: bitAppendBit bad bit", v2, v3, v4, v5, v6);
}

void sub_118C8()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: bitAppendBits num bits must be between 0 and 32\n", v2, v3, v4, v5, v6);
}

void sub_118FC()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: bitXor bitVector sizes don't match", v2, v3, v4, v5, v6);
}

void sub_11930()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: byteArrayAt ByteArray is NULL", v2, v3, v4, v5, v6);
}

void sub_11964()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: byteArraySetIndex ByteArray is NULL", v2, v3, v4, v5, v6);
}

void sub_11998()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: byteArraySetSource ByteArray is NULL", v2, v3, v4, v5, v6);
}

void sub_119CC()
{
  sub_C390();
  sub_C354(&dword_0, v0, v1, "QRCode Generator: byteMatrixInitWithSizes ByteMatrix is NULL", v2, v3, v4, v5, v6);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return _CFAutorelease(arg);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return _CGDataProviderCreateWithCFData(data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return _CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, bitmapInfo, provider, decode, shouldInterpolate, intent);
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return _dyld_program_sdk_at_least();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_exception_throw(id exception)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__defaultVersion(void *a1, const char *a2, ...)
{
  return [a1 _defaultVersion];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_columnCount(void *a1, const char *a2, ...)
{
  return [a1 columnCount];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataCodewordCount(void *a1, const char *a2, ...)
{
  return [a1 dataCodewordCount];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_errorCorrectedPayload(void *a1, const char *a2, ...)
{
  return [a1 errorCorrectedPayload];
}

id objc_msgSend_errorCorrectionLevel(void *a1, const char *a2, ...)
{
  return [a1 errorCorrectionLevel];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_initReedSolomon(void *a1, const char *a2, ...)
{
  return [a1 initReedSolomon];
}

id objc_msgSend_inputAlwaysSpecifyCompaction(void *a1, const char *a2, ...)
{
  return [a1 inputAlwaysSpecifyCompaction];
}

id objc_msgSend_inputCompactStyle(void *a1, const char *a2, ...)
{
  return [a1 inputCompactStyle];
}

id objc_msgSend_inputCompactionMode(void *a1, const char *a2, ...)
{
  return [a1 inputCompactionMode];
}

id objc_msgSend_inputCorrectionLevel(void *a1, const char *a2, ...)
{
  return [a1 inputCorrectionLevel];
}

id objc_msgSend_inputDataColumns(void *a1, const char *a2, ...)
{
  return [a1 inputDataColumns];
}

id objc_msgSend_inputMaxHeight(void *a1, const char *a2, ...)
{
  return [a1 inputMaxHeight];
}

id objc_msgSend_inputMaxWidth(void *a1, const char *a2, ...)
{
  return [a1 inputMaxWidth];
}

id objc_msgSend_inputMinHeight(void *a1, const char *a2, ...)
{
  return [a1 inputMinHeight];
}

id objc_msgSend_inputPreferredAspectRatio(void *a1, const char *a2, ...)
{
  return [a1 inputPreferredAspectRatio];
}

id objc_msgSend_inputRows(void *a1, const char *a2, ...)
{
  return [a1 inputRows];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCompact(void *a1, const char *a2, ...)
{
  return [a1 isCompact];
}

id objc_msgSend_layerCount(void *a1, const char *a2, ...)
{
  return [a1 layerCount];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_maskPattern(void *a1, const char *a2, ...)
{
  return [a1 maskPattern];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_outputCGImage(void *a1, const char *a2, ...)
{
  return [a1 outputCGImage];
}

id objc_msgSend_rowCount(void *a1, const char *a2, ...)
{
  return [a1 rowCount];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_symbolVersion(void *a1, const char *a2, ...)
{
  return [a1 symbolVersion];
}

id objc_msgSend_volatileDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volatileDomainForName:");
}