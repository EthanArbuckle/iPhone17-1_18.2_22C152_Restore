void sub_1BF11F318(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF11F3C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BF11F464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF11F4FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF11F5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF11FD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, id a18)
{
  _Unwind_Resume(a1);
}

void sub_1BF11FF7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseAddress(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  if (_parseMailbox((uint64_t)a1, a2, a3, a4)) {
    return 1;
  }
  uint64_t v9 = a1[3];
  if (_parseOneStarWord((uint64_t)a1, (uint64_t (*)(uint64_t, id *))_parseWord, a2))
  {
    int64_t v10 = a1[3];
    if ((v10 & 0x8000000000000000) == 0)
    {
      uint64_t v11 = a1[2];
      int64_t v12 = *(void *)(v11 + 160);
      if (v12 > v10)
      {
        uint64_t v13 = *(void *)(v11 + 136);
        if (v13)
        {
          __int16 v14 = *(_WORD *)(v13 + 2 * (*(void *)(v11 + 152) + v10));
        }
        else
        {
          uint64_t v15 = *(void *)(v11 + 144);
          if (v15)
          {
            __int16 v14 = *(char *)(v15 + *(void *)(v11 + 152) + v10);
          }
          else
          {
            if (*(void *)(v11 + 176) <= v10 || (int64_t v16 = *(void *)(v11 + 168), v16 > v10))
            {
              int64_t v17 = v10 - 4;
              if ((unint64_t)v10 < 4) {
                int64_t v17 = 0;
              }
              if (v17 + 64 < v12) {
                int64_t v12 = v17 + 64;
              }
              *(void *)(v11 + 168) = v17;
              *(void *)(v11 + 176) = v12;
              v36.location = *(void *)(v11 + 152) + v17;
              v36.length = v12 - v17;
              CFStringGetCharacters(*(CFStringRef *)(v11 + 128), v36, (UniChar *)v11);
              int64_t v16 = *(void *)(v11 + 168);
            }
            __int16 v14 = *(_WORD *)(v11 + 2 * (v10 - v16));
          }
        }
        if (v14 == 58)
        {
          ++a1[3];
          if ((_parseElementList((uint64_t)a1, 0, _parseMailboxAppendingToList, a5) & 1) == 0)
          {
            if (!*(unsigned char *)a1) {
              goto LABEL_42;
            }
            uint64_t v18 = a1[3];
            while (1)
            {
              _parseCFWS(a1);
              int64_t v19 = a1[3];
              if (v19 < 0) {
                break;
              }
              uint64_t v20 = a1[2];
              int64_t v21 = *(void *)(v20 + 160);
              if (v21 <= v19) {
                break;
              }
              uint64_t v22 = *(void *)(v20 + 136);
              if (v22)
              {
                __int16 v23 = *(_WORD *)(v22 + 2 * (*(void *)(v20 + 152) + v19));
              }
              else
              {
                uint64_t v24 = *(void *)(v20 + 144);
                if (v24)
                {
                  __int16 v23 = *(char *)(v24 + *(void *)(v20 + 152) + v19);
                }
                else
                {
                  if (*(void *)(v20 + 176) <= v19 || (int64_t v25 = *(void *)(v20 + 168), v26 = a1[3], v25 > v19))
                  {
                    int64_t v27 = v19 - 4;
                    if ((unint64_t)v19 < 4) {
                      int64_t v27 = 0;
                    }
                    if (v27 + 64 < v21) {
                      int64_t v21 = v27 + 64;
                    }
                    *(void *)(v20 + 168) = v27;
                    *(void *)(v20 + 176) = v21;
                    v37.location = *(void *)(v20 + 152) + v27;
                    v37.length = v21 - v27;
                    CFStringGetCharacters(*(CFStringRef *)(v20 + 128), v37, (UniChar *)v20);
                    int64_t v25 = *(void *)(v20 + 168);
                    int64_t v26 = a1[3];
                  }
                  __int16 v23 = *(_WORD *)(v20 + 2 * (v19 - v25));
                  int64_t v19 = v26;
                }
              }
              if (v23 != 44) {
                break;
              }
              a1[3] = v19 + 1;
            }
            if (a5 && v18 != v19) {
              *a5 = MEMORY[0x1E4F1CBF0];
            }
            if (v18 == v19)
            {
LABEL_42:
              if (a5)
              {
                *a5 = 0;
                _parseCFWS(a1);
                *a5 = MEMORY[0x1E4F1CBF0];
              }
              else
              {
                _parseCFWS(a1);
              }
            }
          }
          int64_t v28 = a1[3];
          if ((v28 & 0x8000000000000000) == 0)
          {
            uint64_t v29 = a1[2];
            int64_t v30 = *(void *)(v29 + 160);
            if (v30 > v28)
            {
              uint64_t v31 = *(void *)(v29 + 136);
              if (v31)
              {
                __int16 v32 = *(_WORD *)(v31 + 2 * (*(void *)(v29 + 152) + v28));
              }
              else
              {
                uint64_t v33 = *(void *)(v29 + 144);
                if (v33)
                {
                  __int16 v32 = *(char *)(v33 + *(void *)(v29 + 152) + v28);
                }
                else
                {
                  if (*(void *)(v29 + 176) <= v28 || (int64_t v34 = *(void *)(v29 + 168), v34 > v28))
                  {
                    int64_t v35 = v28 - 4;
                    if ((unint64_t)v28 < 4) {
                      int64_t v35 = 0;
                    }
                    if (v35 + 64 < v30) {
                      int64_t v30 = v35 + 64;
                    }
                    *(void *)(v29 + 168) = v35;
                    *(void *)(v29 + 176) = v30;
                    v38.location = *(void *)(v29 + 152) + v35;
                    v38.length = v30 - v35;
                    CFStringGetCharacters(*(CFStringRef *)(v29 + 128), v38, (UniChar *)v29);
                    int64_t v34 = *(void *)(v29 + 168);
                  }
                  __int16 v32 = *(_WORD *)(v29 + 2 * (v28 - v34));
                }
              }
              if (v32 == 59)
              {
                ++a1[3];
                _parseCFWS(a1);
                return 1;
              }
            }
          }
        }
      }
    }
  }
  a1[3] = v9;
  if (a2) {
    *a2 = 0;
  }
  uint64_t result = 0;
  if (a5) {
    *a5 = 0;
  }
  return result;
}

uint64_t _parseMailbox(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v8 = *(void *)(a1 + 24);
  if (*(unsigned char *)(a1 + 1))
  {
    id v9 = 0;
    goto LABEL_3;
  }
  id v81 = 0;
  int v12 = _parseOneStarWord(a1, (uint64_t (*)(uint64_t, id *))_parseWord, &v81);
  id v9 = v81;
  if (!v12)
  {
LABEL_8:

    id v9 = 0;
    goto LABEL_9;
  }
  if (*(unsigned char *)(a1 + 1))
  {
LABEL_3:
    id v80 = v9;
    char v10 = _parseOneStarWord(a1, (uint64_t (*)(uint64_t, id *))_parseLenWord, &v80);
    id v11 = v80;

    id v9 = v11;
    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_9:
  _parseCFWS((void *)a1);
  int64_t v13 = *(void *)(a1 + 24);
  if ((v13 & 0x8000000000000000) == 0)
  {
    uint64_t v14 = *(void *)(a1 + 16);
    int64_t v15 = *(void *)(v14 + 160);
    if (v15 > v13)
    {
      uint64_t v16 = *(void *)(v14 + 136);
      if (v16)
      {
        __int16 v17 = *(_WORD *)(v16 + 2 * (*(void *)(v14 + 152) + v13));
      }
      else
      {
        uint64_t v18 = *(void *)(v14 + 144);
        if (v18)
        {
          __int16 v17 = *(char *)(v18 + *(void *)(v14 + 152) + v13);
        }
        else
        {
          if (*(void *)(v14 + 176) <= v13 || (int64_t v19 = *(void *)(v14 + 168), v19 > v13))
          {
            int64_t v20 = v13 - 4;
            if ((unint64_t)v13 < 4) {
              int64_t v20 = 0;
            }
            if (v20 + 64 < v15) {
              int64_t v15 = v20 + 64;
            }
            *(void *)(v14 + 168) = v20;
            *(void *)(v14 + 176) = v15;
            v82.location = *(void *)(v14 + 152) + v20;
            v82.length = v15 - v20;
            CFStringGetCharacters(*(CFStringRef *)(v14 + 128), v82, (UniChar *)v14);
            int64_t v19 = *(void *)(v14 + 168);
          }
          __int16 v17 = *(_WORD *)(v14 + 2 * (v13 - v19));
        }
      }
      if (v17 == 60)
      {
        ++*(void *)(a1 + 24);
        if (_parseAddrSpec((void *)a1, a3, a4))
        {
          int64_t v21 = *(void *)(a1 + 24);
          if ((v21 & 0x8000000000000000) == 0)
          {
            uint64_t v22 = *(void *)(a1 + 16);
            int64_t v23 = *(void *)(v22 + 160);
            if (v23 > v21)
            {
              uint64_t v24 = *(void *)(v22 + 136);
              if (v24)
              {
                __int16 v25 = *(_WORD *)(v24 + 2 * (*(void *)(v22 + 152) + v21));
              }
              else
              {
                uint64_t v26 = *(void *)(v22 + 144);
                if (v26)
                {
                  __int16 v25 = *(char *)(v26 + *(void *)(v22 + 152) + v21);
                }
                else
                {
                  if (*(void *)(v22 + 176) <= v21 || (int64_t v27 = *(void *)(v22 + 168), v27 > v21))
                  {
                    int64_t v28 = v21 - 4;
                    if ((unint64_t)v21 < 4) {
                      int64_t v28 = 0;
                    }
                    if (v28 + 64 < v23) {
                      int64_t v23 = v28 + 64;
                    }
                    *(void *)(v22 + 168) = v28;
                    *(void *)(v22 + 176) = v23;
                    v83.location = *(void *)(v22 + 152) + v28;
                    v83.length = v23 - v28;
                    CFStringGetCharacters(*(CFStringRef *)(v22 + 128), v83, (UniChar *)v22);
                    int64_t v27 = *(void *)(v22 + 168);
                  }
                  __int16 v25 = *(_WORD *)(v22 + 2 * (v21 - v27));
                }
              }
              if (v25 == 62)
              {
LABEL_40:
                ++*(void *)(a1 + 24);
                _parseCFWS((void *)a1);
                if (a2) {
                  *a2 = v9;
                }

                return 1;
              }
            }
          }
        }
      }
    }
  }
  *(void *)(a1 + 24) = v13;
  if (*(unsigned char *)a1)
  {
    _parseCFWS((void *)a1);
    int64_t v30 = *(void *)(a1 + 24);
    if (v30 < 0) {
      goto LABEL_167;
    }
    uint64_t v31 = *(void *)(a1 + 16);
    int64_t v32 = *(void *)(v31 + 160);
    if (v32 <= v30) {
      goto LABEL_167;
    }
    uint64_t v33 = *(void *)(v31 + 136);
    if (v33)
    {
      __int16 v34 = *(_WORD *)(v33 + 2 * (*(void *)(v31 + 152) + v30));
    }
    else
    {
      uint64_t v35 = *(void *)(v31 + 144);
      if (v35)
      {
        __int16 v34 = *(char *)(v35 + *(void *)(v31 + 152) + v30);
      }
      else
      {
        if (*(void *)(v31 + 176) <= v30 || (int64_t v36 = *(void *)(v31 + 168), v36 > v30))
        {
          int64_t v37 = v30 - 4;
          if ((unint64_t)v30 < 4) {
            int64_t v37 = 0;
          }
          if (v37 + 64 < v32) {
            int64_t v32 = v37 + 64;
          }
          *(void *)(v31 + 168) = v37;
          *(void *)(v31 + 176) = v32;
          v84.location = *(void *)(v31 + 152) + v37;
          v84.length = v32 - v37;
          CFStringGetCharacters(*(CFStringRef *)(v31 + 128), v84, (UniChar *)v31);
          int64_t v36 = *(void *)(v31 + 168);
        }
        __int16 v34 = *(_WORD *)(v31 + 2 * (v30 - v36));
      }
    }
    if (v34 != 60) {
      goto LABEL_167;
    }
    ++*(void *)(a1 + 24);
    if (!*(unsigned char *)a1) {
      goto LABEL_167;
    }
    while (1)
    {
      while (_parseCFWS((void *)a1))
        ;
      int64_t v38 = *(void *)(a1 + 24);
      if (v38 < 0) {
        goto LABEL_167;
      }
      uint64_t v39 = *(void *)(a1 + 16);
      int64_t v40 = *(void *)(v39 + 160);
      if (v40 <= v38) {
        break;
      }
      uint64_t v41 = *(void *)(v39 + 136);
      if (v41)
      {
        __int16 v42 = *(_WORD *)(v41 + 2 * (*(void *)(v39 + 152) + v38));
      }
      else
      {
        uint64_t v43 = *(void *)(v39 + 144);
        if (v43)
        {
          __int16 v42 = *(char *)(v43 + *(void *)(v39 + 152) + v38);
        }
        else
        {
          if (*(void *)(v39 + 176) <= v38 || (int64_t v44 = *(void *)(v39 + 168), v45 = *(void *)(a1 + 24), v44 > v38))
          {
            int64_t v46 = v38 - 4;
            if ((unint64_t)v38 < 4) {
              int64_t v46 = 0;
            }
            if (v46 + 64 < v40) {
              int64_t v40 = v46 + 64;
            }
            *(void *)(v39 + 168) = v46;
            *(void *)(v39 + 176) = v40;
            v85.location = *(void *)(v39 + 152) + v46;
            v85.length = v40 - v46;
            CFStringGetCharacters(*(CFStringRef *)(v39 + 128), v85, (UniChar *)v39);
            int64_t v44 = *(void *)(v39 + 168);
            int64_t v45 = *(void *)(a1 + 24);
          }
          __int16 v42 = *(_WORD *)(v39 + 2 * (v38 - v44));
          int64_t v38 = v45;
        }
      }
      if (v42 != 44)
      {
        if (v38 < 0) {
          goto LABEL_167;
        }
        uint64_t v39 = *(void *)(a1 + 16);
        int64_t v40 = *(void *)(v39 + 160);
        break;
      }
      *(void *)(a1 + 24) = v38 + 1;
    }
    if (v40 <= v38) {
      goto LABEL_167;
    }
    uint64_t v47 = *(void *)(v39 + 136);
    if (v47)
    {
      __int16 v48 = *(_WORD *)(v47 + 2 * (*(void *)(v39 + 152) + v38));
    }
    else
    {
      uint64_t v49 = *(void *)(v39 + 144);
      if (v49)
      {
        __int16 v48 = *(char *)(v49 + *(void *)(v39 + 152) + v38);
      }
      else
      {
        if (*(void *)(v39 + 176) <= v38 || (int64_t v50 = *(void *)(v39 + 168), v50 > v38))
        {
          int64_t v51 = v38 - 4;
          if ((unint64_t)v38 < 4) {
            int64_t v51 = 0;
          }
          if (v51 + 64 < v40) {
            int64_t v40 = v51 + 64;
          }
          *(void *)(v39 + 168) = v51;
          *(void *)(v39 + 176) = v40;
          v86.location = *(void *)(v39 + 152) + v51;
          v86.length = v40 - v51;
          CFStringGetCharacters(*(CFStringRef *)(v39 + 128), v86, (UniChar *)v39);
          int64_t v50 = *(void *)(v39 + 168);
        }
        __int16 v48 = *(_WORD *)(v39 + 2 * (v38 - v50));
      }
    }
    if (v48 != 64) {
      goto LABEL_167;
    }
    ++*(void *)(a1 + 24);
    if (!_parseDomain((void *)a1, 0)) {
      goto LABEL_167;
    }
    int64_t v52 = *(void *)(a1 + 24);
    if (v52 < 0) {
      goto LABEL_167;
    }
    uint64_t v53 = *(void *)(a1 + 16);
    int64_t v54 = *(void *)(v53 + 160);
    if (v54 > v52)
    {
      int64_t v55 = *(void *)(a1 + 24);
      while (1)
      {
        uint64_t v56 = *(void *)(v53 + 136);
        if (v56)
        {
          __int16 v57 = *(_WORD *)(v56 + 2 * (*(void *)(v53 + 152) + v52));
        }
        else
        {
          uint64_t v58 = *(void *)(v53 + 144);
          if (v58)
          {
            __int16 v57 = *(char *)(v58 + *(void *)(v53 + 152) + v52);
          }
          else
          {
            if (*(void *)(v53 + 176) <= v52 || (int64_t v59 = *(void *)(v53 + 168), v59 > v52))
            {
              int64_t v60 = v52 - 4;
              if ((unint64_t)v52 < 4) {
                int64_t v60 = 0;
              }
              if (v60 + 64 < v54) {
                int64_t v54 = v60 + 64;
              }
              *(void *)(v53 + 168) = v60;
              *(void *)(v53 + 176) = v54;
              v87.location = *(void *)(v53 + 152) + v60;
              v87.length = v54 - v60;
              CFStringGetCharacters(*(CFStringRef *)(v53 + 128), v87, (UniChar *)v53);
              int64_t v59 = *(void *)(v53 + 168);
            }
            __int16 v57 = *(_WORD *)(v53 + 2 * (v52 - v59));
          }
        }
        if (v57 != 44)
        {
          uint64_t v53 = *(void *)(a1 + 16);
LABEL_135:
          *(void *)(a1 + 24) = v55;
          if ((v55 & 0x8000000000000000) == 0)
          {
            int64_t v54 = *(void *)(v53 + 160);
            goto LABEL_137;
          }
          goto LABEL_167;
        }
        ++*(void *)(a1 + 24);
        _parseCFWS((void *)a1);
        int64_t v55 = *(void *)(a1 + 24);
        if (v55 < 0) {
          goto LABEL_167;
        }
        uint64_t v53 = *(void *)(a1 + 16);
        int64_t v54 = *(void *)(v53 + 160);
        if (v54 <= v55)
        {
          int64_t v52 = *(void *)(a1 + 24);
          goto LABEL_123;
        }
        uint64_t v61 = *(void *)(v53 + 136);
        if (v61)
        {
          __int16 v62 = *(_WORD *)(v61 + 2 * (*(void *)(v53 + 152) + v55));
        }
        else
        {
          uint64_t v63 = *(void *)(v53 + 144);
          if (!v63)
          {
            if (*(void *)(v53 + 176) <= v55 || (v65 = *(void *)(v53 + 168), int64_t v52 = *(void *)(a1 + 24), v65 > v55))
            {
              int64_t v66 = v55 - 4;
              if ((unint64_t)v55 < 4) {
                int64_t v66 = 0;
              }
              if (v66 + 64 < v54) {
                int64_t v54 = v66 + 64;
              }
              *(void *)(v53 + 168) = v66;
              *(void *)(v53 + 176) = v54;
              v88.location = *(void *)(v53 + 152) + v66;
              v88.length = v54 - v66;
              CFStringGetCharacters(*(CFStringRef *)(v53 + 128), v88, (UniChar *)v53);
              int64_t v65 = *(void *)(v53 + 168);
              int64_t v52 = *(void *)(a1 + 24);
            }
            __int16 v62 = *(_WORD *)(v53 + 2 * (v55 - v65));
            goto LABEL_118;
          }
          __int16 v62 = *(char *)(v63 + *(void *)(v53 + 152) + v55);
        }
        int64_t v52 = *(void *)(a1 + 24);
LABEL_118:
        if (v62 == 64)
        {
          *(void *)(a1 + 24) = v52 + 1;
          BOOL v64 = _parseDomain((void *)a1, 0);
          int64_t v52 = *(void *)(a1 + 24);
          if (v64) {
            int64_t v55 = *(void *)(a1 + 24);
          }
        }
        uint64_t v53 = *(void *)(a1 + 16);
        if (v52 < 0) {
          goto LABEL_135;
        }
        int64_t v54 = *(void *)(v53 + 160);
LABEL_123:
        if (v54 <= v52) {
          goto LABEL_135;
        }
      }
    }
    int64_t v55 = *(void *)(a1 + 24);
LABEL_137:
    if (v54 > v55)
    {
      uint64_t v67 = *(void *)(v53 + 136);
      if (v67)
      {
        __int16 v68 = *(_WORD *)(v67 + 2 * (*(void *)(v53 + 152) + v55));
      }
      else
      {
        uint64_t v69 = *(void *)(v53 + 144);
        if (v69)
        {
          __int16 v68 = *(char *)(v69 + *(void *)(v53 + 152) + v55);
        }
        else
        {
          if (*(void *)(v53 + 176) <= v55 || (int64_t v70 = *(void *)(v53 + 168), v70 > v55))
          {
            int64_t v71 = v55 - 4;
            if ((unint64_t)v55 < 4) {
              int64_t v71 = 0;
            }
            if (v71 + 64 < v54) {
              int64_t v54 = v71 + 64;
            }
            *(void *)(v53 + 168) = v71;
            *(void *)(v53 + 176) = v54;
            v89.location = *(void *)(v53 + 152) + v71;
            v89.length = v54 - v71;
            CFStringGetCharacters(*(CFStringRef *)(v53 + 128), v89, (UniChar *)v53);
            int64_t v70 = *(void *)(v53 + 168);
          }
          __int16 v68 = *(_WORD *)(v53 + 2 * (v55 - v70));
        }
      }
      if (v68 == 58)
      {
        ++*(void *)(a1 + 24);
        if (_parseAddrSpec((void *)a1, a3, a4))
        {
          int64_t v72 = *(void *)(a1 + 24);
          if ((v72 & 0x8000000000000000) == 0)
          {
            uint64_t v73 = *(void *)(a1 + 16);
            int64_t v74 = *(void *)(v73 + 160);
            if (v74 > v72)
            {
              uint64_t v75 = *(void *)(v73 + 136);
              if (v75)
              {
                __int16 v76 = *(_WORD *)(v75 + 2 * (*(void *)(v73 + 152) + v72));
              }
              else
              {
                uint64_t v77 = *(void *)(v73 + 144);
                if (v77)
                {
                  __int16 v76 = *(char *)(v77 + *(void *)(v73 + 152) + v72);
                }
                else
                {
                  if (*(void *)(v73 + 176) <= v72 || (int64_t v78 = *(void *)(v73 + 168), v78 > v72))
                  {
                    int64_t v79 = v72 - 4;
                    if ((unint64_t)v72 < 4) {
                      int64_t v79 = 0;
                    }
                    if (v79 + 64 < v74) {
                      int64_t v74 = v79 + 64;
                    }
                    *(void *)(v73 + 168) = v79;
                    *(void *)(v73 + 176) = v74;
                    v90.location = *(void *)(v73 + 152) + v79;
                    v90.length = v74 - v79;
                    CFStringGetCharacters(*(CFStringRef *)(v73 + 128), v90, (UniChar *)v73);
                    int64_t v78 = *(void *)(v73 + 168);
                  }
                  __int16 v76 = *(_WORD *)(v73 + 2 * (v72 - v78));
                }
              }
              if (v76 == 62) {
                goto LABEL_40;
              }
            }
          }
        }
      }
    }
LABEL_167:
    *(void *)(a1 + 24) = v13;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  *(void *)(a1 + 24) = v8;
  if (a2) {
    *a2 = 0;
  }
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }

  return _parseAddrSpec((void *)a1, a3, a4);
}

void sub_1BF120B4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseAddrSpec(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[3];
  if (_parseLocalPart(a1, a2))
  {
    int64_t v7 = a1[3];
    if ((v7 & 0x8000000000000000) == 0)
    {
      uint64_t v8 = a1[2];
      int64_t v9 = *(void *)(v8 + 160);
      if (v9 > v7)
      {
        uint64_t v10 = *(void *)(v8 + 136);
        if (v10)
        {
          __int16 v11 = *(_WORD *)(v10 + 2 * (*(void *)(v8 + 152) + v7));
        }
        else
        {
          uint64_t v12 = *(void *)(v8 + 144);
          if (v12)
          {
            __int16 v11 = *(char *)(v12 + *(void *)(v8 + 152) + v7);
          }
          else
          {
            if (*(void *)(v8 + 176) <= v7 || (int64_t v13 = *(void *)(v8 + 168), v13 > v7))
            {
              int64_t v14 = v7 - 4;
              if ((unint64_t)v7 < 4) {
                int64_t v14 = 0;
              }
              if (v14 + 64 < v9) {
                int64_t v9 = v14 + 64;
              }
              *(void *)(v8 + 168) = v14;
              *(void *)(v8 + 176) = v9;
              v16.location = *(void *)(v8 + 152) + v14;
              v16.length = v9 - v14;
              CFStringGetCharacters(*(CFStringRef *)(v8 + 128), v16, (UniChar *)v8);
              int64_t v13 = *(void *)(v8 + 168);
            }
            __int16 v11 = *(_WORD *)(v8 + 2 * (v7 - v13));
          }
        }
        if (v11 == 64)
        {
          ++a1[3];
          if (_parseDomain(a1, a3)) {
            return 1;
          }
        }
      }
    }
  }
  a1[3] = v6;
  if (a2) {
    *a2 = 0;
  }
  uint64_t result = 0;
  if (a3) {
    *a3 = 0;
  }
  return result;
}

void sub_1BF120DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF120E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF120EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF120FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF121240(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF121338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _parseDomain(void *a1, void *a2)
{
  uint64_t v4 = 1;
  if ((_parseStringWithWrappingCharacters(a1, (uint64_t (*)(void *, UniChar *))_parseDText, 91, 93, 1, a2) & 1) == 0)
  {
    if (*(unsigned char *)a1)
    {
      int64_t v5 = a1[3];
      if (a2)
      {
        uint64_t v6 = [MEMORY[0x1E4F28E78] string];
      }
      else
      {
        uint64_t v6 = 0;
      }
      id v20 = 0;
      BOOL v7 = _parseAtom((uint64_t)a1, &v20);
      id v8 = v20;
      if (v7)
      {
        [v6 appendString:v8];
        while (1)
        {
          int64_t v5 = a1[3];
          if (v5 < 0) {
            break;
          }
          uint64_t v9 = a1[2];
          int64_t v10 = *(void *)(v9 + 160);
          if (v10 <= v5) {
            break;
          }
          uint64_t v11 = *(void *)(v9 + 136);
          if (v11)
          {
            __int16 v12 = *(_WORD *)(v11 + 2 * (*(void *)(v9 + 152) + v5));
          }
          else
          {
            uint64_t v13 = *(void *)(v9 + 144);
            if (v13)
            {
              __int16 v12 = *(char *)(v13 + *(void *)(v9 + 152) + v5);
            }
            else
            {
              if (*(void *)(v9 + 176) <= v5 || (int64_t v14 = *(void *)(v9 + 168), v14 > v5))
              {
                int64_t v15 = v5 - 4;
                if ((unint64_t)v5 < 4) {
                  int64_t v15 = 0;
                }
                if (v15 + 64 < v10) {
                  int64_t v10 = v15 + 64;
                }
                *(void *)(v9 + 168) = v15;
                *(void *)(v9 + 176) = v10;
                v21.location = *(void *)(v9 + 152) + v15;
                v21.length = v10 - v15;
                CFStringGetCharacters(*(CFStringRef *)(v9 + 128), v21, (UniChar *)v9);
                int64_t v14 = *(void *)(v9 + 168);
              }
              __int16 v12 = *(_WORD *)(v9 + 2 * (v5 - v14));
            }
          }
          if (v12 != 46) {
            break;
          }
          ++a1[3];
          id v19 = v8;
          BOOL v16 = _parseAtom((uint64_t)a1, &v19);
          id v17 = v19;

          if (!v16)
          {
            id v8 = v17;
            break;
          }
          id v8 = v17;
          [v6 appendFormat:@".%@", v17];
        }
      }
      else
      {

        uint64_t v6 = 0;
      }
      a1[3] = v5;
      if (a2) {
        *a2 = v6;
      }

      if (v7) {
        return 1;
      }
    }
    else if (a2)
    {
      *a2 = 0;
    }
    return _parseDotAtom((uint64_t)a1, a2);
  }
  return v4;
}

void sub_1BF121588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseOneStarWord(uint64_t a1, uint64_t (*a2)(uint64_t, id *), void *a3)
{
  uint64_t v6 = 0;
  id v7 = 0;
  char v8 = 0;
  uint64_t v14 = *(void *)(a1 + 24);
LABEL_2:
  id v9 = v7;
LABEL_3:
  int64_t v10 = v9;
  while (1)
  {
    id v15 = v10;
    int v11 = a2(a1, &v15);
    id v9 = v15;

    if (!v11) {
      break;
    }
    char v8 = 1;
    int64_t v10 = v9;
    if (a3)
    {
      if (!v7)
      {
        id v7 = v9;
        goto LABEL_2;
      }
      if (!v6)
      {
        uint64_t v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@ %@", v7, v9];
        goto LABEL_3;
      }
      int64_t v10 = v9;
      [v6 appendFormat:@" %@", v9];
    }
  }
  if (v8)
  {
    if (a3)
    {
      if (v6) {
        __int16 v12 = v6;
      }
      else {
        __int16 v12 = v7;
      }
      *a3 = v12;
    }
  }
  else
  {
    *(void *)(a1 + 24) = v14;
  }

  return v8 & 1;
}

void sub_1BF1216CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseWord(void *a1, void *a2)
{
  if (_parseAtom((uint64_t)a1, a2)) {
    return 1;
  }
  return _parseStringWithWrappingCharacters(a1, (uint64_t (*)(void *, UniChar *))_parseQContent, 34, 34, 0, a2);
}

BOOL _parseAtom(uint64_t a1, void *a2)
{
  _parseCFWS((void *)a1);
  unint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = MEMORY[0x1E4F14390];
  int64_t v6 = v4;
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_5;
  }
LABEL_2:
  uint64_t v7 = *(void *)(a1 + 16);
  int64_t v8 = *(void *)(v7 + 160);
  if (v8 > v6)
  {
    uint64_t v9 = *(void *)(v7 + 136);
    if (v9)
    {
      unsigned int v10 = *(unsigned __int16 *)(v9 + 2 * (*(void *)(v7 + 152) + v6));
    }
    else
    {
      uint64_t v15 = *(void *)(v7 + 144);
      if (v15)
      {
        unsigned int v10 = *(char *)(v15 + *(void *)(v7 + 152) + v6);
      }
      else
      {
        if (*(void *)(v7 + 176) <= v6 || (int64_t v16 = *(void *)(v7 + 168), v16 > v6))
        {
          int64_t v17 = v6 - 4;
          if ((unint64_t)v6 < 4) {
            int64_t v17 = 0;
          }
          if (v17 + 64 < v8) {
            int64_t v8 = v17 + 64;
          }
          *(void *)(v7 + 168) = v17;
          *(void *)(v7 + 176) = v8;
          v22.location = *(void *)(v7 + 152) + v17;
          v22.length = v8 - v17;
          CFStringGetCharacters(*(CFStringRef *)(v7 + 128), v22, (UniChar *)v7);
          int64_t v16 = *(void *)(v7 + 168);
        }
        unsigned int v10 = *(unsigned __int16 *)(v7 + 2 * (v6 - v16));
      }
    }
    unsigned int v11 = (unsigned __int16)v10;
    if ((unsigned __int16)v10 > 0x7Fu)
    {
      int v12 = __maskrune((unsigned __int16)v10, 0x500uLL);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_5:
  while (1)
  {
    unsigned int v11 = 0;
    unsigned int v10 = 0;
LABEL_6:
    int v12 = *(_DWORD *)(v5 + 4 * v11 + 60) & 0x500;
LABEL_7:
    int16x4_t v13 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s16(v10), (int8x8_t)0xFFEDFFFEFFFCFFFDLL);
    uint64_t v14 = *(void *)(a1 + 24);
    if ((vmaxv_u16((uint16x4_t)vceq_s16(v13, (int16x4_t)0x2D002A00240021)) & 1) == 0
      && v13.u16[2] != 94
      && (unsigned __int16)v10 != 96
      && (unsigned __int16)v10 <= 0x7Fu
      && (unsigned __int16)(v10 - 123) >= 4u
      && !v12)
    {
      break;
    }
    int64_t v6 = v14 + 1;
    *(void *)(a1 + 24) = v14 + 1;
    if (((v14 + 1) & 0x8000000000000000) == 0) {
      goto LABEL_2;
    }
  }
  uint64_t v18 = v14 - v4;
  if (v14 == v4) {
    unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v19 = v14 - v4;
  }
  if (v14 == v4) {
    unint64_t v20 = 0xAAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v20 = v4;
  }
  if (v18 < 1)
  {
    *(void *)(a1 + 24) = v4;
  }
  else
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 8), "substringWithRange:", v20, v19);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    _parseCFWS((void *)a1);
  }
  return v18 > 0;
}

BOOL _parseLocalPart(void *a1, void *a2)
{
  if (_parseStringWithWrappingCharacters(a1, (uint64_t (*)(void *, UniChar *))_parseQContent, 34, 34, 0, a2))return 1; {
  if (*(unsigned char *)a1)
  }
  {
    if (a2)
    {
      unint64_t v4 = [MEMORY[0x1E4F28E78] string];
      if (v4)
      {
        int v5 = 0;
        id v23 = 0;
        int64_t v6 = &v23;
LABEL_9:
        char v7 = _parseWord(a1, v6);
        char v8 = v7;
        if (v5)
        {
          id v9 = 0;
          if ((v7 & 1) == 0)
          {
LABEL_11:

            goto LABEL_12;
          }
        }
        else
        {
          id v9 = v23;
          if ((v8 & 1) == 0) {
            goto LABEL_11;
          }
        }
        [v4 appendString:v9];
        if (v5) {
          unsigned int v11 = 0;
        }
        else {
          unsigned int v11 = &v22;
        }
        while (1)
        {
          int64_t v12 = a1[3];
          if (v12 < 0) {
            break;
          }
          uint64_t v13 = a1[2];
          int64_t v14 = *(void *)(v13 + 160);
          if (v14 <= v12) {
            break;
          }
          uint64_t v15 = *(void *)(v13 + 136);
          if (v15)
          {
            __int16 v16 = *(_WORD *)(v15 + 2 * (*(void *)(v13 + 152) + v12));
          }
          else
          {
            uint64_t v17 = *(void *)(v13 + 144);
            if (v17)
            {
              __int16 v16 = *(char *)(v17 + *(void *)(v13 + 152) + v12);
            }
            else
            {
              if (*(void *)(v13 + 176) <= v12 || (int64_t v18 = *(void *)(v13 + 168), v18 > v12))
              {
                int64_t v19 = v12 - 4;
                if ((unint64_t)v12 < 4) {
                  int64_t v19 = 0;
                }
                if (v19 + 64 < v14) {
                  int64_t v14 = v19 + 64;
                }
                *(void *)(v13 + 168) = v19;
                *(void *)(v13 + 176) = v14;
                v24.location = *(void *)(v13 + 152) + v19;
                v24.length = v14 - v19;
                CFStringGetCharacters(*(CFStringRef *)(v13 + 128), v24, (UniChar *)v13);
                int64_t v18 = *(void *)(v13 + 168);
              }
              __int16 v16 = *(_WORD *)(v13 + 2 * (v12 - v18));
            }
          }
          if (v16 != 46) {
            break;
          }
          ++a1[3];
          if ((v5 & 1) == 0) {
            id v22 = v9;
          }
          int v20 = _parseWord(a1, v11);
          if ((v5 & 1) == 0)
          {
            id v21 = v22;

            id v9 = v21;
          }
          if (!v20) {
            break;
          }
          [v4 appendFormat:@".%@", v9];
        }
        a1[3] = v12;
        if (a2) {
          *a2 = v4;
        }

        return 1;
      }
      int64_t v6 = 0;
    }
    else
    {
      int64_t v6 = 0;
      unint64_t v4 = 0;
    }
    int v5 = 1;
    goto LABEL_9;
  }
LABEL_12:
  if (a2) {
    *a2 = 0;
  }
  return _parseDotAtom((uint64_t)a1, a2);
}

void sub_1BF121B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseStringWithWrappingCharacters(void *a1, uint64_t (*a2)(void *, UniChar *), int a3, int a4, int a5, void *a6)
{
  UniChar chars = a3;
  UniChar v36 = a4;
  _parseCFWS(a1);
  int64_t v12 = a1[3];
  if (v12 < 0 || (uint64_t v13 = a1[2], v14 = *(void *)(v13 + 160), v14 <= v12))
  {
    unsigned __int16 v16 = 0;
  }
  else
  {
    uint64_t v15 = *(void *)(v13 + 136);
    if (v15)
    {
      unsigned __int16 v16 = *(_WORD *)(v15 + 2 * (*(void *)(v13 + 152) + v12));
    }
    else
    {
      uint64_t v27 = *(void *)(v13 + 144);
      if (v27)
      {
        unsigned __int16 v16 = *(char *)(v27 + *(void *)(v13 + 152) + v12);
      }
      else
      {
        if (*(void *)(v13 + 176) <= v12 || (int64_t v29 = *(void *)(v13 + 168), v29 > v12))
        {
          int64_t v30 = v12 - 4;
          if ((unint64_t)v12 < 4) {
            int64_t v30 = 0;
          }
          if (v30 + 64 < v14) {
            int64_t v14 = v30 + 64;
          }
          *(void *)(v13 + 168) = v30;
          *(void *)(v13 + 176) = v14;
          v38.location = *(void *)(v13 + 152) + v30;
          v38.length = v14 - v30;
          CFStringGetCharacters(*(CFStringRef *)(v13 + 128), v38, (UniChar *)v13);
          int64_t v29 = *(void *)(v13 + 168);
        }
        unsigned __int16 v16 = *(_WORD *)(v13 + 2 * (v12 - v29));
      }
    }
  }
  if (a3 != v16) {
    goto LABEL_29;
  }
  ++a1[3];
  if (a6)
  {
    uint64_t v17 = [MEMORY[0x1E4F28E78] string];
    int64_t v18 = v17;
    int v33 = 0;
    BOOL v19 = v17 != 0;
    if (a5 && v17)
    {
      int v33 = 1;
      CFStringAppendCharacters(v17, &chars, 1);
      BOOL v19 = 1;
    }
  }
  else
  {
    int v33 = 0;
    BOOL v19 = 0;
    int64_t v18 = 0;
  }
  do
  {
    while (1)
    {
      unsigned int v35 = 0;
      if (_parseFWS(a1, &v35)) {
        [(__CFString *)v18 appendFormat:@"%*c", v35, 32];
      }
      UniChar v34 = -21846;
      int v20 = a2(a1, &v34);
      if ((v20 & v19) != 1) {
        break;
      }
      CFStringAppendCharacters(v18, &v34, 1);
    }
  }
  while ((v20 & 1) != 0);
  int64_t v21 = a1[3];
  if (v21 < 0 || (uint64_t v22 = a1[2], v23 = *(void *)(v22 + 160), v23 <= v21))
  {
    unsigned __int16 v25 = 0;
  }
  else
  {
    uint64_t v24 = *(void *)(v22 + 136);
    if (v24)
    {
      unsigned __int16 v25 = *(_WORD *)(v24 + 2 * (*(void *)(v22 + 152) + v21));
    }
    else
    {
      uint64_t v28 = *(void *)(v22 + 144);
      if (v28)
      {
        unsigned __int16 v25 = *(char *)(v28 + *(void *)(v22 + 152) + v21);
      }
      else
      {
        if (*(void *)(v22 + 176) <= v21 || (int64_t v31 = *(void *)(v22 + 168), v31 > v21))
        {
          int64_t v32 = v21 - 4;
          if ((unint64_t)v21 < 4) {
            int64_t v32 = 0;
          }
          if (v32 + 64 < v23) {
            int64_t v23 = v32 + 64;
          }
          *(void *)(v22 + 168) = v32;
          *(void *)(v22 + 176) = v23;
          v39.location = *(void *)(v22 + 152) + v32;
          v39.length = v23 - v32;
          CFStringGetCharacters(*(CFStringRef *)(v22 + 128), v39, (UniChar *)v22);
          int64_t v31 = *(void *)(v22 + 168);
        }
        unsigned __int16 v25 = *(_WORD *)(v22 + 2 * (v21 - v31));
      }
    }
  }
  if (a4 != v25)
  {

LABEL_29:
    uint64_t result = 0;
    a1[3] = v12;
    return result;
  }
  ++a1[3];
  if (v33) {
    CFStringAppendCharacters(v18, &v36, 1);
  }
  _parseCFWS(a1);
  if (a6) {
    *a6 = v18;
  }

  return 1;
}

void sub_1BF121E80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _parseDotAtom(uint64_t a1, void *a2)
{
  _parseCFWS((void *)a1);
  NSUInteger v4 = *(void *)(a1 + 24);
  uint64_t v5 = MEMORY[0x1E4F14390];
  int64_t v6 = v4;
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_5;
  }
LABEL_2:
  uint64_t v7 = *(void *)(a1 + 16);
  int64_t v8 = *(void *)(v7 + 160);
  if (v8 > v6)
  {
    uint64_t v9 = *(void *)(v7 + 136);
    if (v9)
    {
      unsigned int v10 = *(unsigned __int16 *)(v9 + 2 * (*(void *)(v7 + 152) + v6));
    }
    else
    {
      uint64_t v15 = *(void *)(v7 + 144);
      if (v15)
      {
        unsigned int v10 = *(char *)(v15 + *(void *)(v7 + 152) + v6);
      }
      else
      {
        if (*(void *)(v7 + 176) <= v6 || (int64_t v16 = *(void *)(v7 + 168), v16 > v6))
        {
          int64_t v17 = v6 - 4;
          if ((unint64_t)v6 < 4) {
            int64_t v17 = 0;
          }
          if (v17 + 64 < v8) {
            int64_t v8 = v17 + 64;
          }
          *(void *)(v7 + 168) = v17;
          *(void *)(v7 + 176) = v8;
          v55.NSUInteger location = *(void *)(v7 + 152) + v17;
          v55.NSUInteger length = v8 - v17;
          CFStringGetCharacters(*(CFStringRef *)(v7 + 128), v55, (UniChar *)v7);
          int64_t v16 = *(void *)(v7 + 168);
        }
        unsigned int v10 = *(unsigned __int16 *)(v7 + 2 * (v6 - v16));
      }
    }
    unsigned int v11 = (unsigned __int16)v10;
    if ((unsigned __int16)v10 > 0x7Fu)
    {
      int v12 = __maskrune((unsigned __int16)v10, 0x500uLL);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_5:
  while (1)
  {
    unsigned int v11 = 0;
    unsigned int v10 = 0;
LABEL_6:
    int v12 = *(_DWORD *)(v5 + 4 * v11 + 60) & 0x500;
LABEL_7:
    int16x4_t v13 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s16(v10), (int8x8_t)0xFFEDFFFEFFFCFFFDLL);
    int64_t v14 = *(void *)(a1 + 24);
    if ((vmaxv_u16((uint16x4_t)vceq_s16(v13, (int16x4_t)0x2D002A00240021)) & 1) == 0
      && v13.u16[2] != 94
      && (unsigned __int16)v10 != 96
      && (unsigned __int16)v10 <= 0x7Fu
      && (unsigned __int16)(v10 - 123) >= 4u
      && !v12)
    {
      break;
    }
    int64_t v6 = v14 + 1;
    *(void *)(a1 + 24) = v14 + 1;
    if (((v14 + 1) & 0x8000000000000000) == 0) {
      goto LABEL_2;
    }
  }
  int64_t v18 = v14 - v4;
  if ((uint64_t)(v14 - v4) >= 1)
  {
    if (v14 == v4) {
      NSUInteger location = 0xAAAAAAAAAAAAAAAALL;
    }
    else {
      NSUInteger location = v4;
    }
    if (v14 == v4) {
      NSUInteger length = 0xAAAAAAAAAAAAAAAALL;
    }
    else {
      NSUInteger length = v14 - v4;
    }
    NSUInteger v51 = v14 - v4;
    int64_t v52 = a2;
    if (v14 < 0) {
      goto LABEL_87;
    }
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
    while (1)
    {
      uint64_t v23 = *(void *)(a1 + 16);
      int64_t v24 = *(void *)(v23 + 160);
      if (v24 <= v14) {
        goto LABEL_87;
      }
      uint64_t v25 = *(void *)(v23 + 136);
      if (v25)
      {
        __int16 v26 = *(_WORD *)(v25 + 2 * (*(void *)(v23 + 152) + v14));
      }
      else
      {
        uint64_t v27 = *(void *)(v23 + 144);
        if (v27)
        {
          __int16 v26 = *(char *)(v27 + *(void *)(v23 + 152) + v14);
        }
        else
        {
          if (*(void *)(v23 + 176) <= v14 || (int64_t v28 = *(void *)(v23 + 168), v28 > v14))
          {
            int64_t v29 = v14 - 4;
            if ((unint64_t)v14 < 4) {
              int64_t v29 = 0;
            }
            if (v29 + 64 < v24) {
              int64_t v24 = v29 + 64;
            }
            *(void *)(v23 + 168) = v29;
            *(void *)(v23 + 176) = v24;
            v56.NSUInteger location = *(void *)(v23 + 152) + v29;
            v56.NSUInteger length = v24 - v29;
            CFStringGetCharacters(*(CFStringRef *)(v23 + 128), v56, (UniChar *)v23);
            int64_t v28 = *(void *)(v23 + 168);
          }
          __int16 v26 = *(_WORD *)(v23 + 2 * (v14 - v28));
        }
      }
      if (v26 != 46) {
        goto LABEL_87;
      }
      NSUInteger range1 = location;
      uint64_t v30 = *(void *)(a1 + 24) + 1;
      int64_t v31 = v30;
      do
      {
        *(void *)(a1 + 24) = v31;
        if (v31 < 0 || (uint64_t v32 = *(void *)(a1 + 16), v33 = *(void *)(v32 + 160), v33 <= v31))
        {
          unsigned int v36 = 0;
          unsigned int v35 = 0;
        }
        else
        {
          uint64_t v34 = *(void *)(v32 + 136);
          if (v34)
          {
            unsigned int v35 = *(unsigned __int16 *)(v34 + 2 * (*(void *)(v32 + 152) + v31));
          }
          else
          {
            uint64_t v40 = *(void *)(v32 + 144);
            if (v40)
            {
              unsigned int v35 = *(char *)(v40 + *(void *)(v32 + 152) + v31);
            }
            else
            {
              if (*(void *)(v32 + 176) <= v31 || (int64_t v41 = *(void *)(v32 + 168), v41 > v31))
              {
                int64_t v42 = v31 - 4;
                if ((unint64_t)v31 < 4) {
                  int64_t v42 = 0;
                }
                if (v42 + 64 < v33) {
                  int64_t v33 = v42 + 64;
                }
                *(void *)(v32 + 168) = v42;
                *(void *)(v32 + 176) = v33;
                v57.NSUInteger location = *(void *)(v32 + 152) + v42;
                v57.NSUInteger length = v33 - v42;
                CFStringGetCharacters(*(CFStringRef *)(v32 + 128), v57, (UniChar *)v32);
                int64_t v41 = *(void *)(v32 + 168);
              }
              unsigned int v35 = *(unsigned __int16 *)(v32 + 2 * (v31 - v41));
            }
          }
          unsigned int v36 = (unsigned __int16)v35;
          if ((unsigned __int16)v35 > 0x7Fu)
          {
            int v37 = __maskrune((unsigned __int16)v35, 0x500uLL);
            goto LABEL_57;
          }
        }
        int v37 = *(_DWORD *)(v5 + 4 * v36 + 60) & 0x500;
LABEL_57:
        int16x4_t v38 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s16(v35), (int8x8_t)0xFFEDFFFEFFFCFFFDLL);
        uint64_t v39 = *(void *)(a1 + 24);
        int64_t v31 = v39 + 1;
      }
      while ((vmaxv_u16((uint16x4_t)vceq_s16(v38, (int16x4_t)0x2D002A00240021)) & 1) != 0
           || v38.u16[2] == 94
           || (unsigned __int16)v35 == 96
           || (unsigned __int16)v35 > 0x7Fu
           || (unsigned __int16)(v35 - 123) < 4u
           || v37);
      unint64_t v43 = v39 - v30;
      if (v39 - v30 < 1)
      {
        NSUInteger location = range1;
        goto LABEL_87;
      }
      BOOL v44 = v39 == v30;
      if (v39 == v30) {
        unint64_t v45 = v21;
      }
      else {
        unint64_t v45 = v30;
      }
      if (v44) {
        unint64_t v43 = v22;
      }
      unint64_t v21 = v45 - 1;
      unint64_t v22 = v43 + 1;
      v54.NSUInteger location = range1;
      v54.NSUInteger length = length;
      v58.NSUInteger location = v45 - 1;
      v58.NSUInteger length = v43 + 1;
      NSRange v46 = NSUnionRange(v54, v58);
      NSUInteger location = v46.location;
      NSUInteger length = v46.length;
      int64_t v14 = *(void *)(a1 + 24);
      if (v14 < 0)
      {
LABEL_87:
        *(void *)(a1 + 24) = v14;
        _parseCFWS((void *)a1);
        int64_t v18 = v51;
        a2 = v52;
        if (v52)
        {
          uint64_t v48 = *(void *)(a1 + 24);
          uint64_t v47 = objc_msgSend(*(id *)(a1 + 8), "substringWithRange:", location, length);
          *(void *)(a1 + 24) = v48;
LABEL_89:
          id v49 = v47;
          *a2 = v49;
        }
        return v18 > 0;
      }
    }
  }
  *(void *)(a1 + 24) = v4;
  if (a2)
  {
    uint64_t v47 = 0;
    goto LABEL_89;
  }
  return v18 > 0;
}

BOOL _parseCFWS(void *a1)
{
  uint64_t v2 = a1[3];
  _parseFWS(a1, 0);
  if (_parseComment(a1))
  {
    do
      _parseFWS(a1, 0);
    while ((_parseComment(a1) & 1) != 0);
  }
  return a1[3] != v2;
}

uint64_t _parseFWS(void *a1, _DWORD *a2)
{
  uint64_t v2 = a1[3];
  if (v2 >= a1[4]) {
    return 0;
  }
  int v4 = 0;
  int v5 = 0;
  int v6 = 0;
  uint64_t v7 = -v2;
  uint64_t v8 = v2 + 64;
  uint64_t v9 = a1[3];
  do
  {
    uint64_t v10 = (unint64_t)v9 >= 4 ? 4 : v9;
    if (v2 < 0) {
      break;
    }
    uint64_t v11 = a1[2];
    uint64_t v12 = *(void *)(v11 + 160);
    if (v12 <= v9) {
      break;
    }
    uint64_t v13 = *(void *)(v11 + 136);
    if (v13)
    {
      __int16 v14 = *(_WORD *)(v13 + 2 * (v9 + *(void *)(v11 + 152)));
    }
    else
    {
      uint64_t v15 = *(void *)(v11 + 144);
      if (v15)
      {
        __int16 v14 = *(char *)(v15 + *(void *)(v11 + 152) + v9);
      }
      else
      {
        if (*(void *)(v11 + 176) <= v9 || (uint64_t v16 = *(void *)(v11 + 168), v16 > v9))
        {
          uint64_t v17 = -v10;
          uint64_t v18 = v10 + v7;
          uint64_t v19 = v8 - v10;
          uint64_t v20 = v9 + v17;
          uint64_t v21 = v20 + 64;
          if (v20 + 64 >= v12) {
            uint64_t v21 = *(void *)(v11 + 160);
          }
          *(void *)(v11 + 168) = v20;
          *(void *)(v11 + 176) = v21;
          if (v12 >= v19) {
            uint64_t v12 = v19;
          }
          v24.NSUInteger length = v12 + v18;
          v24.NSUInteger location = v20 + *(void *)(v11 + 152);
          CFStringGetCharacters(*(CFStringRef *)(v11 + 128), v24, (UniChar *)v11);
          uint64_t v16 = *(void *)(v11 + 168);
        }
        __int16 v14 = *(_WORD *)(v11 - 2 * v16 + 2 * v9);
      }
    }
    if (v14 != 32)
    {
      if (v14 == 10)
      {
        int v4 = 0;
        int v5 = 1;
        goto LABEL_25;
      }
      if (v14 != 9) {
        break;
      }
    }
    v6 += v4 & 1 | ((v5 & 1) == 0);
    int v4 = v5;
LABEL_25:
    ++v9;
    --v7;
    ++v8;
  }
  while (v9 < a1[4]);
  uint64_t result = 0;
  if (a1[3] != v9 && ((v4 | v5 ^ 1) & 1) != 0)
  {
    a1[3] = v9;
    if (a2) {
      *a2 = v6;
    }
    return 1;
  }
  return result;
}

uint64_t _parseComment(void *a1)
{
  uint64_t v2 = a1[3];
  if (v2 < 0) {
    goto LABEL_55;
  }
  uint64_t v3 = a1[2];
  uint64_t v4 = *(void *)(v3 + 160);
  if (v4 <= v2) {
    goto LABEL_55;
  }
  uint64_t v5 = *(void *)(v3 + 136);
  if (v5)
  {
    __int16 v6 = *(_WORD *)(v5 + 2 * (*(void *)(v3 + 152) + v2));
  }
  else
  {
    uint64_t v7 = *(void *)(v3 + 144);
    if (v7)
    {
      __int16 v6 = *(char *)(v7 + *(void *)(v3 + 152) + v2);
    }
    else
    {
      if (*(void *)(v3 + 176) <= v2 || (uint64_t v8 = *(void *)(v3 + 168), v8 > v2))
      {
        uint64_t v9 = v2 - 4;
        if ((unint64_t)v2 < 4) {
          uint64_t v9 = 0;
        }
        if (v9 + 64 < v4) {
          uint64_t v4 = v9 + 64;
        }
        *(void *)(v3 + 168) = v9;
        *(void *)(v3 + 176) = v4;
        v27.NSUInteger location = *(void *)(v3 + 152) + v9;
        v27.NSUInteger length = v4 - v9;
        CFStringGetCharacters(*(CFStringRef *)(v3 + 128), v27, (UniChar *)v3);
        uint64_t v8 = *(void *)(v3 + 168);
      }
      __int16 v6 = *(_WORD *)(v3 + 2 * (v2 - v8));
    }
  }
  if (v6 != 40)
  {
LABEL_55:
    uint64_t result = 0;
    goto LABEL_56;
  }
LABEL_16:
  ++a1[3];
  do
  {
    _parseFWS(a1, 0);
    int64_t v10 = a1[3];
    if (v10 < 0 || (uint64_t v11 = a1[2], v12 = *(void *)(v11 + 160), v12 <= v10))
    {
      unsigned __int16 v14 = 0;
    }
    else
    {
      uint64_t v13 = *(void *)(v11 + 136);
      if (v13)
      {
        unsigned __int16 v14 = *(_WORD *)(v13 + 2 * (*(void *)(v11 + 152) + v10));
      }
      else
      {
        uint64_t v15 = *(void *)(v11 + 144);
        if (v15)
        {
          unsigned __int16 v14 = *(char *)(v15 + *(void *)(v11 + 152) + v10);
        }
        else
        {
          if (*(void *)(v11 + 176) <= v10 || (int64_t v16 = *(void *)(v11 + 168), v16 > v10))
          {
            int64_t v17 = v10 - 4;
            if ((unint64_t)v10 < 4) {
              int64_t v17 = 0;
            }
            if (v17 + 64 < v12) {
              int64_t v12 = v17 + 64;
            }
            *(void *)(v11 + 168) = v17;
            *(void *)(v11 + 176) = v12;
            v28.NSUInteger location = *(void *)(v11 + 152) + v17;
            v28.NSUInteger length = v12 - v17;
            CFStringGetCharacters(*(CFStringRef *)(v11 + 128), v28, (UniChar *)v11);
            int64_t v16 = *(void *)(v11 + 168);
          }
          unsigned __int16 v14 = *(_WORD *)(v11 + 2 * (v10 - v16));
        }
      }
    }
    if ((unsigned __int16)(v14 - 33) < 7u
      || (unsigned __int16)(v14 - 42) < 0x32u
      || v14 > 0x7Fu
      || (unsigned __int16)(v14 - 93) < 0x22u)
    {
      goto LABEL_16;
    }
  }
  while ((_parseQuotedPair((uint64_t)a1, 0) & 1) != 0 || (_parseComment(a1) & 1) != 0);
  int64_t v18 = a1[3];
  if (v18 < 0) {
    goto LABEL_55;
  }
  uint64_t v19 = a1[2];
  int64_t v20 = *(void *)(v19 + 160);
  if (v20 <= v18) {
    goto LABEL_55;
  }
  uint64_t v21 = *(void *)(v19 + 136);
  if (v21)
  {
    __int16 v22 = *(_WORD *)(v21 + 2 * (*(void *)(v19 + 152) + v18));
  }
  else
  {
    uint64_t v23 = *(void *)(v19 + 144);
    if (v23)
    {
      __int16 v22 = *(char *)(v23 + *(void *)(v19 + 152) + v18);
    }
    else
    {
      if (*(void *)(v19 + 176) <= v18 || (int64_t v24 = *(void *)(v19 + 168), v24 > v18))
      {
        int64_t v25 = v18 - 4;
        if ((unint64_t)v18 < 4) {
          int64_t v25 = 0;
        }
        if (v25 + 64 < v20) {
          int64_t v20 = v25 + 64;
        }
        *(void *)(v19 + 168) = v25;
        *(void *)(v19 + 176) = v20;
        v29.NSUInteger location = *(void *)(v19 + 152) + v25;
        v29.NSUInteger length = v20 - v25;
        CFStringGetCharacters(*(CFStringRef *)(v19 + 128), v29, (UniChar *)v19);
        int64_t v24 = *(void *)(v19 + 168);
      }
      __int16 v22 = *(_WORD *)(v19 + 2 * (v18 - v24));
    }
  }
  if (v22 != 41) {
    goto LABEL_55;
  }
  uint64_t v2 = a1[3] + 1;
  uint64_t result = 1;
LABEL_56:
  a1[3] = v2;
  return result;
}

uint64_t _parseQContent(uint64_t a1, unsigned __int16 *a2)
{
  int64_t v4 = *(void *)(a1 + 24);
  if (v4 < 0 || (v5 = *(void *)(a1 + 16), int64_t v6 = *(void *)(v5 + 160), v6 <= v4))
  {
    unsigned __int16 v8 = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(v5 + 136);
    if (v7)
    {
      unsigned __int16 v8 = *(_WORD *)(v7 + 2 * (*(void *)(v5 + 152) + v4));
    }
    else
    {
      uint64_t v10 = *(void *)(v5 + 144);
      if (v10)
      {
        unsigned __int16 v8 = *(char *)(v10 + *(void *)(v5 + 152) + v4);
      }
      else
      {
        if (*(void *)(v5 + 176) <= v4 || (int64_t v11 = *(void *)(v5 + 168), v11 > v4))
        {
          int64_t v12 = v4 - 4;
          if ((unint64_t)v4 < 4) {
            int64_t v12 = 0;
          }
          if (v12 + 64 < v6) {
            int64_t v6 = v12 + 64;
          }
          *(void *)(v5 + 168) = v12;
          *(void *)(v5 + 176) = v6;
          v14.NSUInteger location = *(void *)(v5 + 152) + v12;
          v14.NSUInteger length = v6 - v12;
          CFStringGetCharacters(*(CFStringRef *)(v5 + 128), v14, (UniChar *)v5);
          int64_t v11 = *(void *)(v5 + 168);
        }
        unsigned __int16 v8 = *(_WORD *)(v5 + 2 * (v4 - v11));
      }
    }
  }
  if (v8 == 33 || (unsigned __int16)(v8 - 35) < 0x39u || v8 > 0x7Fu || (unsigned __int16)(v8 - 93) <= 0x21u)
  {
    *a2 = v8;
    ++*(void *)(a1 + 24);
    return 1;
  }
  else
  {
    return _parseQuotedPair(a1, a2);
  }
}

void sub_1BF1229E0(_Unwind_Exception *a1)
{
  int64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF122B30(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF122CB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF122DD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseDisplayName(uint64_t a1, void *a2)
{
  return _parseOneStarWord(a1, (uint64_t (*)(uint64_t, id *))_parseWord, a2);
}

void sub_1BF122EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF122FE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseQuotedPair(uint64_t a1, unsigned __int16 *a2)
{
  int64_t v2 = *(void *)(a1 + 24);
  if (v2 < 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 16);
  int64_t v5 = *(void *)(v4 + 160);
  if (v5 <= v2) {
    return 0;
  }
  uint64_t v7 = *(void *)(v4 + 136);
  if (v7)
  {
    __int16 v8 = *(_WORD *)(v7 + 2 * (*(void *)(v4 + 152) + v2));
  }
  else
  {
    uint64_t v9 = *(void *)(v4 + 144);
    if (v9)
    {
      __int16 v8 = *(char *)(v9 + *(void *)(v4 + 152) + v2);
    }
    else
    {
      if (*(void *)(v4 + 176) <= v2 || (int64_t v10 = *(void *)(v4 + 168), v10 > v2))
      {
        int64_t v11 = v2 - 4;
        if ((unint64_t)v2 < 4) {
          int64_t v11 = 0;
        }
        if (v11 + 64 < v5) {
          int64_t v5 = v11 + 64;
        }
        *(void *)(v4 + 168) = v11;
        *(void *)(v4 + 176) = v5;
        v33.NSUInteger location = *(void *)(v4 + 152) + v11;
        v33.NSUInteger length = v5 - v11;
        CFStringGetCharacters(*(CFStringRef *)(v4 + 128), v33, (UniChar *)v4);
        int64_t v10 = *(void *)(v4 + 168);
      }
      __int16 v8 = *(_WORD *)(v4 + 2 * (v2 - v10));
    }
  }
  if (v8 != 92) {
    return 0;
  }
  uint64_t v12 = *(void *)(a1 + 24);
  int64_t v13 = v12 + 1;
  *(void *)(a1 + 24) = v12 + 1;
  if (v12 < -1 || (uint64_t v14 = *(void *)(a1 + 16), v15 = *(void *)(v14 + 160), v15 <= v13))
  {
    unsigned __int16 v17 = 0;
  }
  else
  {
    uint64_t v16 = *(void *)(v14 + 136);
    if (v16)
    {
      unsigned __int16 v17 = *(_WORD *)(v16 + 2 * (*(void *)(v14 + 152) + v13));
    }
    else
    {
      uint64_t v27 = *(void *)(v14 + 144);
      if (v27)
      {
        unsigned __int16 v17 = *(char *)(v27 + *(void *)(v14 + 152) + v13);
      }
      else
      {
        if (*(void *)(v14 + 176) <= v13 || (int64_t v29 = *(void *)(v14 + 168), v29 > v13))
        {
          int64_t v30 = v13 - 4;
          if ((unint64_t)v13 < 4) {
            int64_t v30 = 0;
          }
          if (v30 + 64 < v15) {
            int64_t v15 = v30 + 64;
          }
          *(void *)(v14 + 168) = v30;
          *(void *)(v14 + 176) = v15;
          v34.NSUInteger location = *(void *)(v14 + 152) + v30;
          v34.NSUInteger length = v15 - v30;
          CFStringGetCharacters(*(CFStringRef *)(v14 + 128), v34, (UniChar *)v14);
          int64_t v29 = *(void *)(v14 + 168);
        }
        unsigned __int16 v17 = *(_WORD *)(v14 + 2 * (v13 - v29));
      }
    }
  }
  BOOL v20 = v17 > 0x7Fu || (unsigned __int16)(v17 - 33) < 0x5Eu;
  if (v20)
  {
    if (a2) {
      *a2 = v17;
    }
    uint64_t v21 = *(void *)(a1 + 24) + 1;
    goto LABEL_66;
  }
  uint64_t v22 = *(void *)(a1 + 24);
  if (v22 < 0 || (uint64_t v23 = *(void *)(a1 + 16), v24 = *(void *)(v23 + 160), v24 <= v22))
  {
LABEL_65:
    uint64_t v21 = v22 - 1;
LABEL_66:
    *(void *)(a1 + 24) = v21;
    return v20;
  }
  uint64_t v25 = *(void *)(v23 + 136);
  if (v25)
  {
    unsigned __int16 v26 = *(_WORD *)(v25 + 2 * (*(void *)(v23 + 152) + v22));
  }
  else
  {
    uint64_t v28 = *(void *)(v23 + 144);
    if (v28)
    {
      unsigned __int16 v26 = *(char *)(v28 + *(void *)(v23 + 152) + v22);
    }
    else
    {
      if (*(void *)(v23 + 176) <= v22 || (uint64_t v31 = *(void *)(v23 + 168), v31 > v22))
      {
        uint64_t v32 = v22 - 4;
        if ((unint64_t)v22 < 4) {
          uint64_t v32 = 0;
        }
        if (v32 + 64 < v24) {
          uint64_t v24 = v32 + 64;
        }
        *(void *)(v23 + 168) = v32;
        *(void *)(v23 + 176) = v24;
        v35.NSUInteger location = *(void *)(v23 + 152) + v32;
        v35.NSUInteger length = v24 - v32;
        CFStringGetCharacters(*(CFStringRef *)(v23 + 128), v35, (UniChar *)v23);
        uint64_t v31 = *(void *)(v23 + 168);
      }
      unsigned __int16 v26 = *(_WORD *)(v23 + 2 * (v22 - v31));
    }
  }
  if (v26 != 9 && v26 != 32)
  {
    uint64_t v22 = *(void *)(a1 + 24);
    goto LABEL_65;
  }
  if (a2) {
    *a2 = v26;
  }
  uint64_t v22 = *(void *)(a1 + 24) + 1;
  *(void *)(a1 + 24) = v22;
  uint64_t result = 1;
  if (v26 != 9 && v26 != 32) {
    goto LABEL_65;
  }
  return result;
}

uint64_t _parseLenWord(uint64_t a1, void *a2)
{
  _parseCFWS((void *)a1);
  unint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = MEMORY[0x1E4F14390];
  int64_t v6 = v4;
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_5;
  }
LABEL_2:
  uint64_t v7 = *(void *)(a1 + 16);
  int64_t v8 = *(void *)(v7 + 160);
  if (v8 > v6)
  {
    uint64_t v9 = *(void *)(v7 + 136);
    if (v9)
    {
      unsigned int v10 = *(unsigned __int16 *)(v9 + 2 * (*(void *)(v7 + 152) + v6));
    }
    else
    {
      uint64_t v17 = *(void *)(v7 + 144);
      if (v17)
      {
        unsigned int v10 = *(char *)(v17 + *(void *)(v7 + 152) + v6);
      }
      else
      {
        if (*(void *)(v7 + 176) <= v6 || (int64_t v18 = *(void *)(v7 + 168), v18 > v6))
        {
          int64_t v19 = v6 - 4;
          if ((unint64_t)v6 < 4) {
            int64_t v19 = 0;
          }
          if (v19 + 64 < v8) {
            int64_t v8 = v19 + 64;
          }
          *(void *)(v7 + 168) = v19;
          *(void *)(v7 + 176) = v8;
          v25.NSUInteger location = *(void *)(v7 + 152) + v19;
          v25.NSUInteger length = v8 - v19;
          CFStringGetCharacters(*(CFStringRef *)(v7 + 128), v25, (UniChar *)v7);
          int64_t v18 = *(void *)(v7 + 168);
        }
        unsigned int v10 = *(unsigned __int16 *)(v7 + 2 * (v6 - v18));
      }
    }
    unsigned int v11 = (unsigned __int16)v10;
    if ((unsigned __int16)v10 > 0x7Fu)
    {
      int v12 = __maskrune((unsigned __int16)v10, 0x500uLL);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_5:
  while (1)
  {
    unsigned int v11 = 0;
    unsigned int v10 = 0;
LABEL_6:
    int v12 = *(_DWORD *)(v5 + 4 * v11 + 60) & 0x500;
LABEL_7:
    int16x4_t v13 = (int16x4_t)vand_s8((int8x8_t)vdup_n_s16(v10), (int8x8_t)0xFFEDFFFEFFFCFFFDLL);
    int8x8_t v14 = (int8x8_t)vceq_s16(v13, (int16x4_t)0x2D002A00240021);
    int16x4_t v15 = vdup_lane_s16(v13, 2);
    v15.i16[1] = v10;
    uint64_t v16 = *(void *)(a1 + 24);
    if ((vmaxv_u16((uint16x4_t)vorr_s8(v14, (int8x8_t)vceq_s16(vzip1_s16(v15, vdup_lane_s16(v15, 1)), (int16x4_t)0x2E00400060005ELL))) & 1) == 0&& (unsigned __int16)v10 <= 0x7Fu&& (unsigned __int16)(v10 - 123) >= 4u&& !v12)
    {
      break;
    }
    int64_t v6 = v16 + 1;
    *(void *)(a1 + 24) = v16 + 1;
    if (((v16 + 1) & 0x8000000000000000) == 0) {
      goto LABEL_2;
    }
  }
  uint64_t v20 = v16 - v4;
  if (v20) {
    unint64_t v21 = v20;
  }
  else {
    unint64_t v21 = 0xAAAAAAAAAAAAAAAALL;
  }
  if (v20) {
    unint64_t v22 = v4;
  }
  else {
    unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  }
  if (v20 < 1)
  {
    *(void *)(a1 + 24) = v4;
    return _parseStringWithWrappingCharacters((void *)a1, (uint64_t (*)(void *, UniChar *))_parseQContent, 34, 34, 0, a2);
  }
  else
  {
    if (a2)
    {
      objc_msgSend(*(id *)(a1 + 8), "substringWithRange:", v22, v21);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    _parseCFWS((void *)a1);
    return 1;
  }
}

void sub_1BF123674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1236F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL _ECIsNetworkActivityAllowed()
{
  if (![MEMORY[0x1E4F29060] isMainThread]) {
    return !_ThreadLocalAssertionForKey(@"_ECDisallowNetworkActivityAssertion");
  }
  BOOL result = _ThreadLocalAssertionForKey(@"_ECMainThreadNetworkingAllowedAssertion");
  if (result) {
    return !_ThreadLocalAssertionForKey(@"_ECDisallowNetworkActivityAssertion");
  }
  return result;
}

BOOL _ThreadLocalAssertionForKey(void *a1)
{
  id v1 = a1;
  int64_t v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = [v2 threadDictionary];
  unint64_t v4 = [v3 objectForKeyedSubscript:v1];

  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      __assert_rtn("_ThreadLocalAssertionForKey", "ECNetworkAssertions.m", 64, "[number isKindOfClass:[NSNumber class]]");
    }
    BOOL v5 = [v4 unsignedIntegerValue] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void sub_1BF123818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF123A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF123BF4(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF123D68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF123ECC(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF123FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF124230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF124318(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1244C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1245A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF124708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12493C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF124A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF124B50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF124C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF124ED8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF124FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF125054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125124(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1251DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125280(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF125314(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BF125444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1254F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1256D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1257C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF1258FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF1259CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void _DecrementThreadLocalCounterForKey(void *a1)
{
  id v9 = a1;
  id v1 = [MEMORY[0x1E4F29060] currentThread];
  int64_t v2 = [v1 threadDictionary];

  uint64_t v3 = [v2 objectForKeyedSubscript:v9];
  if (!v3) {
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = "[countNumber isKindOfClass:[NSNumber class]]";
    int v8 = 46;
    goto LABEL_11;
  }
  uint64_t v4 = [v3 unsignedIntegerValue];
  uint64_t v5 = v4 - 1;
  if (v4 == 1)
  {
    [v2 setObject:v5 forKeyedSubscript:v9];
    goto LABEL_7;
  }
  if (!v4)
  {
LABEL_12:
    uint64_t v7 = "0 < count";
    int v8 = 50;
LABEL_11:
    __assert_rtn("_DecrementThreadLocalCounterForKey", "ECNetworkAssertions.m", v8, v7);
  }
  int64_t v6 = [NSNumber numberWithUnsignedInteger:v5];
  [v2 setObject:v6 forKeyedSubscript:v9];

LABEL_7:
}

void sub_1BF125B0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int16x4_t v13 = v12;

  _Unwind_Resume(a1);
}

void _IncrementThreadLocalCounterForKey(void *a1)
{
  id v8 = a1;
  id v1 = [MEMORY[0x1E4F29060] currentThread];
  int64_t v2 = [v1 threadDictionary];

  uint64_t v3 = [v2 objectForKeyedSubscript:v8];
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v5 = "[countNumber isKindOfClass:[NSNumber class]]";
      int v6 = 31;
LABEL_10:
      __assert_rtn("_IncrementThreadLocalCounterForKey", "ECNetworkAssertions.m", v6, v5);
    }
    uint64_t v4 = [v3 unsignedIntegerValue];
    if (v4 == -1)
    {
      uint64_t v5 = "count < NSUIntegerMax";
      int v6 = 35;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v4 + 1];
  [v2 setObject:v7 forKeyedSubscript:v8];
}

void sub_1BF125C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int16x4_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF125DC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125E78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125F00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF125FC0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF126160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12631C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12638C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF126448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1264C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ECGetNextHeaderFromDataInRange(void *a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  id v11 = a3;
  id v12 = a4;
  int16x4_t v13 = (const char *)[v12 bytes];
  uint64_t HeaderFromBytes = ECGetNextHeaderFromBytes(a1, a2, v11, v13, (char *)&v13[a5], (unint64_t)&v13[a5 + a6]);

  return HeaderFromBytes;
}

void sub_1BF1265BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1266BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF126748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12686C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF126904(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF126978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF126A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF126BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF126C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ECGetNextHeaderFromBytes(void *a1, void *a2, void *a3, const char *a4, char *a5, unint64_t a6)
{
  id v10 = a3;
  id v11 = (const char *)[v10 cStringUsingEncoding:1];
  id v12 = v11;
  if (v10 && !v11) {
    goto LABEL_54;
  }
  if (v11) {
    size_t v36 = strlen(v11);
  }
  else {
    size_t v36 = 0;
  }
  if ((unint64_t)a5 < a6 && *a5 == 10) {
    ++a5;
  }
  if ((unint64_t)a5 >= a6)
  {
LABEL_54:
    uint64_t v28 = 0;
    goto LABEL_56;
  }
  id v34 = v10;
  while (1)
  {
    if (*a5 == 10)
    {
LABEL_55:
      uint64_t v28 = 0;
      id v10 = v34;
      goto LABEL_56;
    }
    int16x4_t v13 = a5;
    size_t v14 = a6 - (void)a5;
    while (1)
    {
      unint64_t v15 = (unint64_t)memchr(v13, 10, v14);
      if (v15 <= (unint64_t)a5 || v15 >= a6 - 1) {
        break;
      }
      int v16 = *(char *)(v15 + 1);
      if (v16 != 32 && v16 != 9) {
        break;
      }
      size_t v14 = ~v15 + a6;
      int16x4_t v13 = (char *)(v15 + 1);
    }
    int64_t v18 = (const char *)(v15 ? v15 : a6);
    uint64_t v19 = a5 - a4;
    if (a5 == a4 && a4 + 5 <= v18 && !strncasecmp(a4, "From ", 5uLL))
    {
      if (v12 && (v36 != 5 || strncasecmp(v12, "From ", 5uLL))) {
        goto LABEL_44;
      }
      uint64_t v27 = a4 + 5;
      if (a2)
      {
        *a2 = v19;
        a2[1] = 5;
        uint64_t v27 = a4 + 5;
      }
    }
    else
    {
      uint64_t v20 = (char *)memchr(a5, 58, a6 - (void)a5);
      if (!v20) {
        goto LABEL_44;
      }
      unint64_t v21 = v20;
      unint64_t v22 = v20;
      if (v20 > a5)
      {
        uint64_t v23 = v20;
        while (1)
        {
          int v25 = *--v23;
          int v24 = v25;
          if (v25 != 32 && v24 != 9) {
            break;
          }
          unint64_t v22 = v23;
          if (v23 <= a5)
          {
            unint64_t v22 = a5;
            break;
          }
        }
      }
      if (v12 && (v22 - a5 != v36 || strncasecmp(a5, v12, v36))) {
        goto LABEL_44;
      }
      if (a2)
      {
        *a2 = v19;
        a2[1] = v22 - a5;
      }
      uint64_t v27 = v21 + 1;
    }
    if (v27 <= v18) {
      break;
    }
LABEL_44:
    if ((unint64_t)v18 < a6 && *v18 == 10) {
      ++v18;
    }
    a5 = (char *)v18;
    if ((unint64_t)v18 >= a6) {
      goto LABEL_55;
    }
  }
  if (v27 >= v18)
  {
    uint64_t v31 = a1;
    id v10 = v34;
  }
  else
  {
    int64_t v30 = v18 - v27;
    uint64_t v31 = a1;
    id v10 = v34;
    while (1)
    {
      int v32 = *v27;
      if (v32 != 9 && v32 != 32 && *v27 != 10) {
        break;
      }
      ++v27;
      if (!--v30)
      {
        uint64_t v27 = v18;
        break;
      }
    }
  }
  if (v31)
  {
    *uint64_t v31 = v27 - a4;
    v31[1] = v18 - v27;
  }
  uint64_t v28 = 1;
LABEL_56:

  return v28;
}

void sub_1BF127010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ECEndDisallowingNetworkActivity()
{
}

void ECBeginDisallowingNetworkActivity()
{
}

void sub_1BF1271DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF127398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF127428(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BF1274F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF127578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF127644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1277C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12783C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __sharedCache_block_invoke()
{
  sharedCache_cache = [objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:150];
  return MEMORY[0x1F41817F8]();
}

void sub_1BF127A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *ECNSStringFromMailboxMailboxType(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      int64_t v2 = @"ECMailboxTypeGeneric";
      break;
    case 1:
      int64_t v2 = @"ECMailboxTypeJunk";
      break;
    case 2:
      int64_t v2 = @"ECMailboxTypeArchive";
      break;
    case 3:
      int64_t v2 = @"ECMailboxTypeTrash";
      break;
    case 4:
      int64_t v2 = @"ECMailboxTypeSentMessages";
      break;
    case 5:
      int64_t v2 = @"ECMailboxTypeDrafts";
      break;
    case 6:
      int64_t v2 = @"ECMailboxTypeOutbox";
      break;
    case 7:
      int64_t v2 = @"ECMailboxTypeInbox";
      break;
    case 8:
      int64_t v2 = @"ECMailboxTypeRoot";
      break;
    default:
      if (a1 == -500)
      {
        int64_t v2 = @"ECMailboxTypeInvalid";
      }
      else if (a1 == -100)
      {
        int64_t v2 = @"ECMailboxTypeRootless";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"unknown mailbox type: %ld", a1);
        int64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v2;
}

void sub_1BF127FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF128054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int16x4_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF1280EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1281B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1283A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128414(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12851C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  size_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_1BF1285C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12869C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  int16x4_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BF1287A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12883C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128B60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF128F8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1290D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12920C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1292D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF129364(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF1293C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1294F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF129680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12976C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1297EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF129854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1298C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1299A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129A14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129A84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129B64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129C54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF129DD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF129F90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF129FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A37C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A440(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12A820(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF12A968(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12AAAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12AC04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12ACCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12AED0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12AF34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12AF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12B034(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12B100(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12B2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECAPOPAuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF12B3EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12B5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECAppleToken2AuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF12B6EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12B8B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECAppleTokenAuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF12BB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12BE60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12BF3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12C10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BF12C47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12C680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12C6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12C778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12CA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12CC2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12CED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF12D0E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12D200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12D3A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12D548(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF12D748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12D808(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12D994(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF12DBB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12DD54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ECBytesInEncodingCanBeConcatenated(unint64_t a1)
{
  signed int v1 = CFStringConvertNSStringEncodingToEncoding(a1);
  uint64_t result = 1;
  if (v1 <= 2351)
  {
    if ((v1 - 1584) >= 3 && v1 != 1058) {
      return 0;
    }
  }
  else if (((v1 - 2352) > 0x10 || ((1 << (v1 - 48)) & 0x10003) == 0) && v1 != 2565 && v1 != 134217984)
  {
    return 0;
  }
  return result;
}

id ECConvertCharacterSetNameToEncoding(const __CFString *a1)
{
  CFStringEncoding v1 = CFStringConvertIANACharSetNameToEncoding(a1);
  if (v1 == -1)
  {
    int64_t v2 = 0;
  }
  else
  {
    int64_t v2 = [NSNumber numberWithUnsignedLong:CFStringConvertEncodingToNSStringEncoding(v1)];
  }
  return v2;
}

__CFString *ECConvertEncodingToCharacterSetName(unint64_t a1)
{
  int v2 = CFStringConvertNSStringEncodingToEncoding(a1);
  if (v2 <= 1583)
  {
    if (v2 <= 1056)
    {
      if (v2 == 518)
      {
        uint64_t v3 = @"ISO-8859-6-i";
        goto LABEL_18;
      }
      if (v2 == 520)
      {
        uint64_t v3 = @"ISO-8859-8-i";
        goto LABEL_18;
      }
      goto LABEL_13;
    }
    if (v2 != 1057)
    {
      if (v2 == 1058)
      {
        uint64_t v3 = @"KS_C_5601-1987";
        goto LABEL_18;
      }
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v3 = @"GB2312";
    goto LABEL_18;
  }
  if ((v2 - 3056) < 3)
  {
    int v2 = 2561;
    goto LABEL_13;
  }
  if ((v2 - 3059) < 2)
  {
    int v2 = 2080;
    goto LABEL_13;
  }
  if (v2 == 1584) {
    goto LABEL_16;
  }
LABEL_13:
  CFStringConvertEncodingToIANACharSetName(v2);
  uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"NSString * _Nonnull ECConvertEncodingToCharacterSetName(NSStringEncoding)"];
    int v6 = [NSString localizedNameOfStringEncoding:a1];
    [v4 handleFailureInFunction:v5, @"ECCharacterSet.m", 93, @"No character set name for string encoding %@ (%lu)", v6, a1 file lineNumber description];

    uint64_t v3 = 0;
  }
LABEL_18:
  return v3;
}

void sub_1BF12E008(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ECEncodingIsASCIISuperset(unint64_t a1)
{
  signed int v1 = CFStringConvertNSStringEncodingToEncoding(a1);
  uint64_t result = 0;
  if (v1 <= 1023)
  {
    if ((v1 - 513) <= 0xF && v1 != 524
      || v1 <= 0x26 && ((1 << v1) & 0x78200000D1) != 0
      || v1 == 152)
    {
      return 1;
    }
  }
  else
  {
    if (v1 <= 1279)
    {
      unsigned int v3 = v1 - 1024;
      if (v3 > 0x1D) {
        return result;
      }
      int v4 = 1 << v3;
      int v5 = 1073676385;
      goto LABEL_18;
    }
    if (v1 <= 2561)
    {
      if ((v1 - 1280) >= 9 && (v1 - 1536) >= 2) {
        return result;
      }
      return 1;
    }
    if (v1 <= 2816)
    {
      unsigned int v6 = v1 - 2562;
      if (v6 > 6) {
        return result;
      }
      int v4 = 1 << v6;
      int v5 = 101;
LABEL_18:
      if ((v4 & v5) == 0) {
        return result;
      }
      return 1;
    }
    if (v1 == 2817 || v1 == 134217984 || v1 == 3071) {
      return 1;
    }
  }
  return result;
}

void sub_1BF12E1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E338(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E6E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E7B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12E814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ECSignatureInfo;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF12E954(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v2);

  _Unwind_Resume(a1);
}

void sub_1BF12EA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF12EC48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12ED0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12ED60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id _ef_log_ECCMSEncoder()
{
  if (_ef_log_ECCMSEncoder_onceToken != -1) {
    dispatch_once(&_ef_log_ECCMSEncoder_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_ef_log_ECCMSEncoder_log;
  return v0;
}

void sub_1BF12F17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF12F68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF12FA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF12FC38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF12FD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF12FDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF12FEF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF130204(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF130320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF130384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ECCMSRecipient;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1BF1304F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1306C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECCramMD5AuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF1307FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1309C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECDigestMD5AuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

id _ef_log_ECDKIMCryptoUtil()
{
  if (_ef_log_ECDKIMCryptoUtil_onceToken != -1) {
    dispatch_once(&_ef_log_ECDKIMCryptoUtil_onceToken, &__block_literal_global_2);
  }
  v0 = (void *)_ef_log_ECDKIMCryptoUtil_log;
  return v0;
}

void sub_1BF130E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1BF13134C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131468(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1319A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131B98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131C7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF131FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF1320EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF132214(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1322FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF132380(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF132490(_Unwind_Exception *a1)
{
  unsigned int v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF1325CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13270C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1329E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF132AE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF132D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_1BF132E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF132F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1330C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1331E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1332B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF133374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF133430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1334F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13366C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF133780(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1337E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF133840(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1338C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id _ef_log_ECDKIMVerifier()
{
  if (_ef_log_ECDKIMVerifier_onceToken != -1) {
    dispatch_once(&_ef_log_ECDKIMVerifier_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)_ef_log_ECDKIMVerifier_log;
  return v0;
}

void sub_1BF133A5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF133ABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF133FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF134178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13422C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF134508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF13474C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF134900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF134D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BF13516C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF135320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1354DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF135724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1359BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF135B84(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF135CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF135DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF135E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF135F34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned char *OUTLINED_FUNCTION_0_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_1BF136298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1BF1363B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF136584(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF136664(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1366C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF136768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1367E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1368BC(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BF136A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1BF136DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v25 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_1BF136E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void query_callback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  unint64_t v21 = (void (**)(id, void *, void))MEMORY[0x1C18A3120](a11);
  if (!a4 && a8 && a9 && a11)
  {
    id v13 = (id) [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a9 length:a8];
    size_t v14 = (unsigned __int8 *)[v13 bytes];
    int v15 = *v14;
    int v16 = objc_opt_new();
    for (uint64_t i = 1; i < (int)[v13 length]; ++i)
    {
      if (i <= v15) {
        [v16 appendBytes:&v14[i] length:1];
      }
      uint64_t v18 = (v15 + 1);
      if (i == v18) {
        int v15 = v18 + v14[i];
      }
    }
    uint64_t v20 = (void *)[[NSString alloc] initWithData:v16 encoding:1];
    v21[2](v21, v20, 0);

    uint64_t v19 = v21;
  }
  else
  {
    uint64_t v19 = v21;
    if (v21)
    {
      v21[2](v21, 0, a4);
      uint64_t v19 = v21;
    }
  }
}

void sub_1BF136FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1370F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137310(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13736C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1373D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13753C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137800(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF137B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF137DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF137E70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF137F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1BF137FF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BF138094(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BF138158(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);

  _Unwind_Resume(a1);
}

void sub_1BF1381F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  objc_sync_exit(v10);

  _Unwind_Resume(a1);
}

void sub_1BF13826C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1382DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1383D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1BF138538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF1385D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1386DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1387A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1388AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF138928(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF138A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF138B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF138BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF138C2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF138D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF138F0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseDText(uint64_t a1, unsigned __int16 *a2)
{
  int64_t v4 = *(void *)(a1 + 24);
  if (v4 < 0 || (v5 = *(void *)(a1 + 16), int64_t v6 = *(void *)(v5 + 160), v6 <= v4))
  {
    unsigned __int16 v8 = 0;
  }
  else
  {
    uint64_t v7 = *(void *)(v5 + 136);
    if (v7)
    {
      unsigned __int16 v8 = *(_WORD *)(v7 + 2 * (*(void *)(v5 + 152) + v4));
    }
    else
    {
      uint64_t v14 = *(void *)(v5 + 144);
      if (v14)
      {
        unsigned __int16 v8 = *(char *)(v14 + *(void *)(v5 + 152) + v4);
      }
      else
      {
        if (*(void *)(v5 + 176) <= v4 || (int64_t v15 = *(void *)(v5 + 168), v15 > v4))
        {
          int64_t v16 = v4 - 4;
          if ((unint64_t)v4 < 4) {
            int64_t v16 = 0;
          }
          if (v16 + 64 < v6) {
            int64_t v6 = v16 + 64;
          }
          *(void *)(v5 + 168) = v16;
          *(void *)(v5 + 176) = v6;
          v22.NSUInteger location = *(void *)(v5 + 152) + v16;
          v22.NSUInteger length = v6 - v16;
          CFStringGetCharacters(*(CFStringRef *)(v5 + 128), v22, (UniChar *)v5);
          int64_t v15 = *(void *)(v5 + 168);
        }
        unsigned __int16 v8 = *(_WORD *)(v5 + 2 * (v4 - v15));
      }
    }
    if ((unsigned __int16)(v8 - 33) < 0x3Au) {
      goto LABEL_31;
    }
  }
  if (v8 > 0x7Fu || (unsigned __int16)(v8 - 94) <= 0x20u)
  {
LABEL_31:
    *a2 = v8;
    ++*(void *)(a1 + 24);
    return 1;
  }
  if (!*(unsigned char *)a1) {
    return 0;
  }
  int64_t v9 = *(void *)(a1 + 24);
  if (v9 < 0 || (uint64_t v10 = *(void *)(a1 + 16), v11 = *(void *)(v10 + 160), v11 <= v9))
  {
    unsigned __int16 v8 = 0;
  }
  else
  {
    uint64_t v12 = *(void *)(v10 + 136);
    if (v12)
    {
      unsigned __int16 v8 = *(_WORD *)(v12 + 2 * (*(void *)(v10 + 152) + v9));
    }
    else
    {
      uint64_t v17 = *(void *)(v10 + 144);
      if (v17)
      {
        unsigned __int16 v8 = *(char *)(v17 + *(void *)(v10 + 152) + v9);
      }
      else
      {
        if (*(void *)(v10 + 176) <= v9 || (int64_t v18 = *(void *)(v10 + 168), v18 > v9))
        {
          int64_t v19 = v9 - 4;
          if ((unint64_t)v9 < 4) {
            int64_t v19 = 0;
          }
          if (v19 + 64 < v11) {
            int64_t v11 = v19 + 64;
          }
          *(void *)(v10 + 168) = v19;
          *(void *)(v10 + 176) = v11;
          v23.NSUInteger location = *(void *)(v10 + 152) + v19;
          v23.NSUInteger length = v11 - v19;
          CFStringGetCharacters(*(CFStringRef *)(v10 + 128), v23, (UniChar *)v10);
          int64_t v18 = *(void *)(v10 + 168);
        }
        unsigned __int16 v8 = *(_WORD *)(v10 + 2 * (v9 - v18));
      }
    }
    __int16 v20 = v8 - 1;
    if (unsigned __int16)(v8 - 1) < 0xCu && ((0xCFFu >> v20))
    {
      unsigned __int16 v8 = word_1BF1773D0[v20];
      goto LABEL_31;
    }
  }
  if (v8 == 127 || (unsigned __int16)(v8 - 14) < 0x12u) {
    goto LABEL_31;
  }
  return _parseQuotedPair(a1, a2);
}

uint64_t _parseElementList(uint64_t a1, int a2, uint64_t (*a3)(uint64_t, void *), void *a4)
{
  if (*(unsigned char *)a1)
  {
    uint64_t v8 = *(void *)(a1 + 24);
    while (1)
    {
      while (_parseCFWS((void *)a1))
        ;
      int64_t v9 = *(void *)(a1 + 24);
      if (v9 < 0) {
        break;
      }
      uint64_t v10 = *(void *)(a1 + 16);
      int64_t v11 = *(void *)(v10 + 160);
      if (v11 <= v9) {
        break;
      }
      uint64_t v12 = *(void *)(v10 + 136);
      if (v12)
      {
        __int16 v13 = *(_WORD *)(v12 + 2 * (*(void *)(v10 + 152) + v9));
      }
      else
      {
        uint64_t v14 = *(void *)(v10 + 144);
        if (v14)
        {
          __int16 v13 = *(char *)(v14 + *(void *)(v10 + 152) + v9);
        }
        else
        {
          if (*(void *)(v10 + 176) <= v9 || (int64_t v15 = *(void *)(v10 + 168), v15 > v9))
          {
            int64_t v16 = v9 - 4;
            if ((unint64_t)v9 < 4) {
              int64_t v16 = 0;
            }
            if (v16 + 64 < v11) {
              int64_t v11 = v16 + 64;
            }
            *(void *)(v10 + 168) = v16;
            *(void *)(v10 + 176) = v11;
            v57.NSUInteger location = *(void *)(v10 + 152) + v16;
            v57.NSUInteger length = v11 - v16;
            CFStringGetCharacters(*(CFStringRef *)(v10 + 128), v57, (UniChar *)v10);
            int64_t v15 = *(void *)(v10 + 168);
          }
          __int16 v13 = *(_WORD *)(v10 + 2 * (v9 - v15));
        }
      }
      if (v13 != 44) {
        break;
      }
      ++*(void *)(a1 + 24);
    }
    if (a4)
    {
      uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    }
    else
    {
      uint64_t v17 = 0;
    }
    if (a3(a1, v17))
    {
      int64_t v18 = *(void *)(a1 + 24);
      if (v18 < 0 || (uint64_t v19 = *(void *)(a1 + 16), v20 = *(void *)(v19 + 160), v20 <= v18))
      {
        uint64_t v21 = *(void *)(a1 + 24);
      }
      else
      {
        uint64_t v21 = *(void *)(a1 + 24);
        do
        {
          uint64_t v22 = *(void *)(v19 + 136);
          if (v22)
          {
            __int16 v23 = *(_WORD *)(v22 + 2 * (*(void *)(v19 + 152) + v18));
          }
          else
          {
            uint64_t v24 = *(void *)(v19 + 144);
            if (v24)
            {
              __int16 v23 = *(char *)(v24 + *(void *)(v19 + 152) + v18);
            }
            else
            {
              if (*(void *)(v19 + 176) <= v18 || (int64_t v25 = *(void *)(v19 + 168), v25 > v18))
              {
                int64_t v26 = v18 - 4;
                if ((unint64_t)v18 < 4) {
                  int64_t v26 = 0;
                }
                if (v26 + 64 < v20) {
                  int64_t v20 = v26 + 64;
                }
                *(void *)(v19 + 168) = v26;
                *(void *)(v19 + 176) = v20;
                v58.NSUInteger location = *(void *)(v19 + 152) + v26;
                v58.NSUInteger length = v20 - v26;
                CFStringGetCharacters(*(CFStringRef *)(v19 + 128), v58, (UniChar *)v19);
                int64_t v25 = *(void *)(v19 + 168);
              }
              __int16 v23 = *(_WORD *)(v19 + 2 * (v18 - v25));
            }
          }
          if (v23 != 44) {
            break;
          }
          ++*(void *)(a1 + 24);
          _parseCFWS((void *)a1);
          uint64_t v27 = *(void *)(a1 + 24);
          int v28 = a3(a1, v17);
          int64_t v18 = *(void *)(a1 + 24);
          uint64_t v21 = v28 ? *(void *)(a1 + 24) : v27;
          if (v18 < 0) {
            break;
          }
          uint64_t v19 = *(void *)(a1 + 16);
          int64_t v20 = *(void *)(v19 + 160);
        }
        while (v20 > v18);
      }
      *(void *)(a1 + 24) = v21;
      if (!a4) {
        goto LABEL_94;
      }
      goto LABEL_100;
    }
    *(void *)(a1 + 24) = v8;
  }
  if (a4)
  {
    *a4 = 0;
    int64_t v30 = (uint64_t *)(a1 + 24);
    uint64_t v29 = *(void *)(a1 + 24);
    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
  }
  else
  {
    uint64_t v17 = 0;
    int64_t v30 = (uint64_t *)(a1 + 24);
    uint64_t v29 = *(void *)(a1 + 24);
  }
  int v31 = a3(a1, v17);
  int64_t v32 = *v30;
  if (v31 && (v32 & 0x8000000000000000) == 0)
  {
    do
    {
      uint64_t v33 = *(void *)(a1 + 16);
      int64_t v34 = *(void *)(v33 + 160);
      if (v34 <= v32) {
        break;
      }
      uint64_t v35 = *(void *)(v33 + 136);
      if (v35)
      {
        __int16 v36 = *(_WORD *)(v35 + 2 * (*(void *)(v33 + 152) + v32));
      }
      else
      {
        uint64_t v37 = *(void *)(v33 + 144);
        if (v37)
        {
          __int16 v36 = *(char *)(v37 + *(void *)(v33 + 152) + v32);
        }
        else
        {
          if (*(void *)(v33 + 176) <= v32 || (int64_t v38 = *(void *)(v33 + 168), v39 = v32, v38 > v32))
          {
            int64_t v40 = v32 - 4;
            if ((unint64_t)v32 < 4) {
              int64_t v40 = 0;
            }
            if (v40 + 64 < v34) {
              int64_t v34 = v40 + 64;
            }
            *(void *)(v33 + 168) = v40;
            *(void *)(v33 + 176) = v34;
            v59.NSUInteger location = *(void *)(v33 + 152) + v40;
            v59.NSUInteger length = v34 - v40;
            CFStringGetCharacters(*(CFStringRef *)(v33 + 128), v59, (UniChar *)v33);
            int64_t v38 = *(void *)(v33 + 168);
            int64_t v39 = *v30;
          }
          __int16 v36 = *(_WORD *)(v33 + 2 * (v32 - v38));
          int64_t v32 = v39;
        }
      }
      if (v36 != 44) {
        break;
      }
      *(void *)(a1 + 24) = v32 + 1;
      if ((a3(a1, v17) & 1) == 0)
      {
        int64_t v41 = *v30;
        if (!a2 || v41 < 0) {
          goto LABEL_95;
        }
        uint64_t v42 = *v30;
        do
        {
          uint64_t v43 = *(void *)(a1 + 16);
          uint64_t v44 = *(void *)(v43 + 160);
          if (v44 <= v42) {
            break;
          }
          uint64_t v45 = *(void *)(v43 + 136);
          if (v45)
          {
            __int16 v46 = *(_WORD *)(v45 + 2 * (*(void *)(v43 + 152) + v42));
          }
          else
          {
            uint64_t v47 = *(void *)(v43 + 144);
            if (v47)
            {
              __int16 v46 = *(char *)(v47 + *(void *)(v43 + 152) + v42);
            }
            else
            {
              if (*(void *)(v43 + 176) <= v42 || (uint64_t v48 = *(void *)(v43 + 168), v48 > v42))
              {
                uint64_t v49 = v42 - 4;
                if ((unint64_t)v42 < 4) {
                  uint64_t v49 = 0;
                }
                if (v49 + 64 < v44) {
                  uint64_t v44 = v49 + 64;
                }
                *(void *)(v43 + 168) = v49;
                *(void *)(v43 + 176) = v44;
                v60.NSUInteger location = *(void *)(v43 + 152) + v49;
                v60.NSUInteger length = v44 - v49;
                CFStringGetCharacters(*(CFStringRef *)(v43 + 128), v60, (UniChar *)v43);
                uint64_t v48 = *(void *)(v43 + 168);
              }
              __int16 v46 = *(_WORD *)(v43 + 2 * (v42 - v48));
            }
          }
          if (!v46) {
            break;
          }
          if (v46 == 44) {
            break;
          }
          uint64_t v50 = *v30;
          uint64_t v42 = *v30 + 1;
          *int64_t v30 = v42;
        }
        while (v50 >= -1);
        if (*v30 == v41)
        {
LABEL_95:
          int64_t v32 = v41 - 1;
          *int64_t v30 = v41 - 1;
          break;
        }
        NSUInteger v51 = objc_msgSend(*(id *)(a1 + 8), "substringWithRange:", v41, *v30 - v41);
        int64_t v52 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        uint64_t v53 = [v51 stringByTrimmingCharactersInSet:v52];

        if ([v53 length]) {
          [v17 addObject:v53];
        }
      }
      int64_t v32 = *v30;
    }
    while ((*v30 & 0x8000000000000000) == 0);
  }
  if (v32 == v29)
  {
    uint64_t v54 = 0;
    if (!a4) {
      goto LABEL_102;
    }
    id v55 = 0;
LABEL_101:
    *a4 = v55;
    goto LABEL_102;
  }
  if (a4)
  {
LABEL_100:
    id v55 = v17;
    uint64_t v54 = 1;
    uint64_t v17 = v55;
    goto LABEL_101;
  }
LABEL_94:
  uint64_t v54 = 1;
LABEL_102:

  return v54;
}

void sub_1BF139654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseMailboxAppendingToList(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  id v14 = 0;
  id v15 = 0;
  id v13 = 0;
  uint64_t v5 = _parseMailbox(a1, &v15, &v14, &v13);
  id v6 = v15;
  id v7 = v14;
  id v8 = v13;
  if (v3) {
    char v9 = v5;
  }
  else {
    char v9 = 0;
  }
  if (v9)
  {
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 8), "substringWithRange:", v4, *(void *)(a1 + 24) - v4);
    id v11 = [[ECEmailAddressComponents alloc] _initWithString:v10 displayName:v6 localPart:v7 domain:v8 groupList:0];
    [v3 addObject:v11];
  }
  return v5;
}

void sub_1BF1397A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t _parseAddressAppendingToList(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  id v16 = 0;
  id v17 = 0;
  id v14 = 0;
  id v15 = 0;
  uint64_t v5 = _parseAddress((void *)a1, &v17, &v16, &v15, &v14);
  id v6 = v17;
  id v7 = v16;
  id v8 = v15;
  id v9 = v14;
  if (v3) {
    char v10 = v5;
  }
  else {
    char v10 = 0;
  }
  if (v10)
  {
    id v11 = objc_msgSend(*(id *)(a1 + 8), "substringWithRange:", v4, *(void *)(a1 + 24) - v4);
    id v12 = [[ECEmailAddressComponents alloc] _initWithString:v11 displayName:v6 localPart:v7 domain:v8 groupList:v9];
    [v3 addObject:v12];
  }
  return v5;
}

void sub_1BF1398FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF139AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF139B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF139F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF13A3F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13A4B0(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF13A65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_1BF13A95C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13ABA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13AC3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13AD44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13B070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF13B1A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13B344(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13BA38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_1BF13C140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13C380(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v31 - 152), 8);
  _Block_object_dispose((const void *)(v31 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1BF13C8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13C944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13C9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13CAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13CCA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECExternalAuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF13CDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13CF04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13D060(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13D13C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13D5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13D7D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13D9A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECGSSAPIAuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

id _ef_log_ECHeaderAuthenticationResults()
{
  if (_ef_log_ECHeaderAuthenticationResults_onceToken != -1) {
    dispatch_once(&_ef_log_ECHeaderAuthenticationResults_onceToken, &__block_literal_global_8);
  }
  v0 = (void *)_ef_log_ECHeaderAuthenticationResults_log;
  return v0;
}

void sub_1BF13DB8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13DC84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13DD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13DE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF13DE9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13DFE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E0B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E1F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E340(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E4D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E7A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13E950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13EA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13EB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13EC34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13ED0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13EF5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13F1C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13F46C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13F578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *_stringByApplyingIDNATranslationWithRange(void *a1, uint64_t (*a2)(uint64_t, const UniChar *, unint64_t, UniChar *, void, long long *, int *))
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  if (_stringByApplyingIDNATranslationWithRange_onceToken != -1) {
    dispatch_once(&_stringByApplyingIDNATranslationWithRange_onceToken, &__block_literal_global_9);
  }
  if (!_stringByApplyingIDNATranslationWithRange_sIDNA || (unint64_t v4 = [(__CFString *)v3 length], v4 >> 31))
  {
    uint64_t v5 = v3;
    goto LABEL_6;
  }
  *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v25 + 14) = v7;
  v24[29] = v7;
  v25[0] = v7;
  v24[27] = v7;
  v24[28] = v7;
  v24[25] = v7;
  v24[26] = v7;
  v24[23] = v7;
  v24[24] = v7;
  v24[21] = v7;
  v24[22] = v7;
  v24[19] = v7;
  v24[20] = v7;
  v24[17] = v7;
  v24[18] = v7;
  v24[15] = v7;
  v24[16] = v7;
  v24[13] = v7;
  v24[14] = v7;
  v24[11] = v7;
  v24[12] = v7;
  v24[9] = v7;
  v24[10] = v7;
  v24[7] = v7;
  v24[8] = v7;
  v24[5] = v7;
  v24[6] = v7;
  v24[3] = v7;
  v24[4] = v7;
  v24[1] = v7;
  v24[2] = v7;
  v24[0] = v7;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  if (CharactersPtr)
  {
    id v9 = 0;
    BOOL v10 = 0;
    goto LABEL_18;
  }
  BOOL v10 = v4 > 0xFF;
  if (v4 < 0x100)
  {
    id v9 = (const UniChar *)v24;
    goto LABEL_17;
  }
  id v9 = (const UniChar *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (2 * v4), 0);
  if (v9)
  {
LABEL_17:
    -[__CFString getCharacters:range:](v3, "getCharacters:range:", v9, 0, v4);
    CharactersPtr = v9;
LABEL_18:
    ptr = (UniChar *)v9;
    int v23 = 0;
    long long v22 = xmmword_1BF177440;
    int v12 = a2(_stringByApplyingIDNATranslationWithRange_sIDNA, CharactersPtr, v4, 0, 0, &v22, &v23);
    int v13 = v12;
    BOOL v15 = v23 < 1 && DWORD1(v22) == 0;
    if (v23 == 15 || v15)
    {
      CFAllocatorRef v16 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      id v17 = (UniChar *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 2 * (v12 + 1), 0);
      int64_t v18 = v17;
      int v19 = v17 ? 0 : 7;
      int v23 = v19;
      if (v17)
      {
        long long v21 = xmmword_1BF177440;
        a2(_stringByApplyingIDNATranslationWithRange_sIDNA, CharactersPtr, v4, v17, (v13 + 1), &v21, &v23);
        if (v23 <= 0 && !DWORD1(v21))
        {
          uint64_t v5 = (__CFString *)CFStringCreateWithCharactersNoCopy(v16, v18, v13, v16);
          if (v5)
          {
LABEL_35:
            if (v10) {
              CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], ptr);
            }
            goto LABEL_6;
          }
        }
        CFAllocatorDeallocate(v16, v18);
      }
    }
    uint64_t v5 = 0;
    goto LABEL_35;
  }
  id v11 = ECIDNALog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    _stringByApplyingIDNATranslationWithRange_cold_1(2 * v4, v11);
  }

  uint64_t v5 = 0;
LABEL_6:

  return v5;
}

void sub_1BF13F8D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___stringByApplyingIDNATranslationWithRange_block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  UErrorCode code = U_ZERO_ERROR;
  _stringByApplyingIDNATranslationWithRange_sIDNA = MEMORY[0x1C18A35E0](60, &code);
  if (code >= U_ILLEGAL_ARGUMENT_ERROR)
  {
    v0 = ECIDNALog();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      signed int v1 = u_errorName(code);
      ___stringByApplyingIDNATranslationWithRange_block_invoke_cold_1((uint64_t)v1, buf, v0);
    }

    _stringByApplyingIDNATranslationWithRange_sIDNA = 0;
  }
}

void sub_1BF13F9B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ECIDNALog()
{
  if (ECIDNALog_onceToken != -1) {
    dispatch_once(&ECIDNALog_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)ECIDNALog_log;
  return v0;
}

uint64_t __ECIDNALog_block_invoke()
{
  ECIDNALog_log = (uint64_t)os_log_create("com.apple.email", "ECIDNA");
  return MEMORY[0x1F41817F8]();
}

void sub_1BF13FABC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FBA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FCA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FDA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FEE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FF68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF13FFD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF140054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1400C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF140140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1401AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14022C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF140318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140384(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF140404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1404F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14055C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1405DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140648(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1406C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140734(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1407B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140820(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1408A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14090C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14098C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF140A30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF140B74(_Unwind_Exception *a1)
{
  uint64_t v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF140CAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF141134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF141588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1417A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1419B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF141A04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF141A88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF141B20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF141C80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF141D8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ECSMIMELog()
{
  if (ECSMIMELog_onceToken != -1) {
    dispatch_once(&ECSMIMELog_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)ECSMIMELog_log;
  return v0;
}

uint64_t __ECSMIMELog_block_invoke()
{
  ECSMIMELog_log = (uint64_t)os_log_create("com.apple.email", "SMIME");
  return MEMORY[0x1F41817F8]();
}

__CFString *ECPrettyDescriptionFromMailboxType(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = @"Generic";
      break;
    case 1:
      uint64_t result = @"Junk";
      break;
    case 2:
      uint64_t result = @"Archive";
      break;
    case 3:
      uint64_t result = @"Trash";
      break;
    case 4:
      uint64_t result = @"Sent";
      break;
    case 5:
      uint64_t result = @"Drafts";
      break;
    case 6:
      uint64_t result = @"Outbox";
      break;
    case 7:
      uint64_t result = @"Inbox";
      break;
    case 8:
      uint64_t result = @"Root";
      break;
    default:
      int v2 = @"Unknown";
      if (a1 == -100) {
        int v2 = @"Rootless";
      }
      if (a1 == -500) {
        uint64_t result = @"Invalid";
      }
      else {
        uint64_t result = v2;
      }
      break;
  }
  return result;
}

void sub_1BF141FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF142090(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF142114(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1422A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1424F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1426BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1428FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF142C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

BOOL bufferIsHorizontalSeparator(char *a1, unint64_t a2)
{
  for (uint64_t i = a1; (unint64_t)i < a2; i += 2)
  {
    if (!isWhitespaceCharacter(*(unsigned __int16 *)i)) {
      break;
    }
  }
  if ((unint64_t)i < a2)
  {
    int v4 = 0;
    uint64_t v5 = i;
    while (1)
    {
      do
      {
        int v6 = *(unsigned __int16 *)v5;
        BOOL v7 = (v6 - 43) > 0x34 || ((1 << (v6 - 43)) & 0x10000000040005) == 0;
        if (v7 && v6 != 126) {
          break;
        }
        v5 += 2;
      }
      while ((unint64_t)v5 < a2);
      if (v5 - i < 6)
      {
        if ((unint64_t)(i + 2) >= a2 || *(_WORD *)i != 56 || *((_WORD *)i + 1) != 60) {
          return 0;
        }
        uint64_t v5 = i + 4;
      }
      else
      {
        ++v4;
      }
      while ((unint64_t)v5 < a2 && isWhitespaceCharacter(*(unsigned __int16 *)v5))
        v5 += 2;
      uint64_t i = v5;
      if ((unint64_t)v5 >= a2) {
        return v4 > 0;
      }
    }
  }
  int v4 = 0;
  return v4 > 0;
}

uint64_t isWhitespaceCharacter(unsigned int a1)
{
  uint64_t result = 1;
  if (a1 > 0x20 || ((1 << a1) & 0x100003600) == 0)
  {
    BOOL v5 = a1 == 8239 || a1 - 8194 < 0xA || a1 == 8287;
    return a1 == 160 || v5;
  }
  return result;
}

uint64_t _ef_log_ECMessageBodyParser()
{
  if (_ef_log_ECMessageBodyParser_onceToken != -1) {
    dispatch_once(&_ef_log_ECMessageBodyParser_onceToken, &__block_literal_global_13);
  }
  return _ef_log_ECMessageBodyParser_log;
}

void sub_1BF1470CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_1BF1471C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF147278(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14767C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF147760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1477F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1479BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF147F98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF148210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148628(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF1489D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF148A34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148BEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148C44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF148CD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1490F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1491EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1494C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14965C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF149778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1497F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF149A34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF149B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF149BF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF149F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, void *a11, void *a12, void *a13, int a14, char a15, char a16, char a17, void *a18)
{
  if ((v18 & 8) != 0) {

  }
  if ((v19 & 0x10) == 0) {
  if ((v20 & 0x40) == 0)
  }

  if ((a16 & 0x20) == 0) {
  if ((a15 & 4) == 0)
  }

  if ((a17 & 2) == 0) {
  _Unwind_Resume(a1);
  }
}

uint64_t ECGetNextHeaderFromData(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (const char *)[v10 bytes];
  uint64_t HeaderFromBytes = ECGetNextHeaderFromBytes(a1, a2, v9, v11, (char *)&v11[a5], (unint64_t)&v11[[v10 length]]);

  return HeaderFromBytes;
}

void sub_1BF14A0B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ECAllowNetworkActivityButLog(void *a1)
{
  signed int v1 = a1;
  _IncrementThreadLocalCounterForKey(@"_ECLogNetworkActivity");
  v1[2]();
  _DecrementThreadLocalCounterForKey(@"_ECLogNetworkActivity");
}

void sub_1BF14A130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void ECAssertNetworkActivityAllowed()
{
  if (!_ECIsNetworkActivityAllowed())
  {
    v0 = [MEMORY[0x1E4F29060] currentThread];
    signed int v1 = [v0 threadDictionary];
    int v2 = [v1 objectForKeyedSubscript:@"_ECLogNetworkActivity"];

    if (v2)
    {
      uint64_t v3 = ECNetworkAllowedLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        ECAssertNetworkActivityAllowed_cold_2(v3);
      }
    }
    else if ((EFIsSeedBuild() & 1) != 0 {
           || ([MEMORY[0x1E4F60D58] currentDevice],
    }
               int v4 = objc_claimAutoreleasedReturnValue(),
               int v5 = [v4 isInternal],
               v4,
               v5))
    {
      ECAssertNetworkActivityAllowed_cold_1();
    }
  }
}

void sub_1BF14A210(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id ECNetworkAllowedLog()
{
  if (ECNetworkAllowedLog_onceToken != -1) {
    dispatch_once(&ECNetworkAllowedLog_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)ECNetworkAllowedLog_log;
  return v0;
}

uint64_t __ECNetworkAllowedLog_block_invoke()
{
  ECNetworkAllowedLog_log = (uint64_t)os_log_create("com.apple.email", "ECNetworkAllowed");
  return MEMORY[0x1F41817F8]();
}

void _ECBeginAllowingMainThreadNetworking()
{
}

void _ECEndAllowingMainThreadNetworking()
{
}

void sub_1BF14A374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14A42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14A5F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14A6B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14A880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECNTLMAuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF14A9C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14AAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14AB64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14AC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14AD3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14ADF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14AEBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECOAuth2AuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF14B1D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  a11.super_class = (Class)ECPlainAuthScheme;
  [(_Unwind_Exception *)&a11 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF14B4A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B6DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B7C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B848(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14B948(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14BCF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_1BF14BE10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14BF20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14BFF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C0B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C730(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14C888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ECSASLClient;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF14CA60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14CE40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getMechanismInformation(uint64_t result, int a2, void *a3)
{
  if (a2 == 1) {
    return [a3 setMechanismUsesPlainText:(*(_DWORD *)(*(void *)(result + 16) + 12) & 1) == 0];
  }
  return result;
}

void sub_1BF14CF98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14D19C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14D3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14D498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14D580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14D760(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14D8EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14DB7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void __initializeSASLIfNecessary_block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  initializeSASLIfNecessary_saslInitializationStatus = sasl_client_init(0);
  if (initializeSASLIfNecessary_saslInitializationStatus)
  {
    v0 = [MEMORY[0x1E4F1CA20] currentLocale];
    signed int v1 = [v0 objectForKey:*MEMORY[0x1E4F1C438]];
    int v2 = [v0 objectForKey:*MEMORY[0x1E4F1C400]];
    id v3 = v1;
    int v4 = v3;
    if (v2)
    {
      int v4 = [NSString stringWithFormat:@"%@-%@", v3, v2];
    }
    id v5 = v4;
    int v6 = (const char *)[v5 UTF8String];

    BOOL v7 = objc_msgSend(NSString, "stringWithUTF8String:", sasl_errstring(initializeSASLIfNecessary_saslInitializationStatus, v6, 0));
    id v8 = +[ECSASLClient log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v10 = initializeSASLIfNecessary_saslInitializationStatus;
      __int16 v11 = 2114;
      int v12 = v7;
      _os_log_impl(&dword_1BF11D000, v8, OS_LOG_TYPE_DEFAULT, "Failed to initialize the SASL library, %d (%{public}@)", buf, 0x12u);
    }
  }
}

void sub_1BF14DEB4(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

uint64_t getOption(int a1, int a2, char *__s1, void *a4, _DWORD *a5)
{
  if (strcmp(__s1, "ntlm_v2")) {
    return 0xFFFFFFFFLL;
  }
  *a4 = "yes";
  uint64_t result = 0;
  if (a5) {
    *a5 = 3;
  }
  return result;
}

uint64_t getSimpleValue(void *a1, int a2, void *a3, _DWORD *a4)
{
  BOOL v7 = a1;
  id v8 = v7;
  uint64_t v9 = 0xFFFFFFFFLL;
  if (a2 > 18943)
  {
    switch(a2)
    {
      case 18944:
        int v10 = [v7 credentials];
        __int16 v11 = [v10 applePersonID];
        int v12 = v8 + 6;
        goto LABEL_11;
      case 18945:
        int v10 = [v7 credentials];
        __int16 v11 = [v10 applePersonID];
        int v12 = v8 + 5;
LABEL_11:

        int v17 = 0;
        char v18 = @"Person ID";
        goto LABEL_24;
      case 18946:
        char v19 = [v7 credentials];
        __int16 v11 = [v19 appleAuthenticationToken];
        int v12 = v8 + 7;

        int v17 = 1;
        char v18 = @"Apple token";
        goto LABEL_24;
      case 18948:
        char v20 = [v7 credentials];
        __int16 v11 = [v20 oauthToken];
        int v12 = v8 + 11;

        int v17 = 0;
        char v18 = @"OAuth 2 bearer access token";
        goto LABEL_24;
      case 18949:
        long long v21 = [v7 credentials];
        __int16 v11 = [v21 machineID];
        int v12 = v8 + 8;

        int v17 = 1;
        char v18 = @"Apple Machine ID";
        goto LABEL_24;
      case 18950:
        long long v22 = [v7 credentials];
        __int16 v11 = [v22 oneTimePassword];
        int v12 = v8 + 9;

        int v17 = 1;
        char v18 = @"Apple One Time Password";
        goto LABEL_24;
      case 18951:
        int v23 = [v7 credentials];
        __int16 v11 = [v23 clientInfo];
        int v12 = v8 + 10;

        int v17 = 1;
        char v18 = @"Apple Client Info";
        goto LABEL_24;
      case 18952:
        if (![v7 isATOKEN2Enabled]) {
          goto LABEL_43;
        }
        uint64_t v24 = [v8 credentials];
        __int16 v11 = [v24 base64EncodedAppleAuthenticationToken2];
        int v12 = v8 + 12;

        int v17 = 1;
        char v18 = @"Apple atoken2";
        break;
      default:
        goto LABEL_43;
    }
    goto LABEL_24;
  }
  if (a2 == 16385)
  {
    int v12 = v7 + 3;
    if ([v7 excludeAuthorizationName])
    {
      uint64_t v9 = 0;
      goto LABEL_41;
    }
    int64_t v25 = [v8 credentials];
    __int16 v11 = [v25 username];
    goto LABEL_23;
  }
  if (a2 == 16386)
  {
    int64_t v25 = [v7 credentials];
    __int16 v11 = [v25 username];
    int v12 = v8 + 2;
LABEL_23:

    int v17 = 0;
    char v18 = @"Username";
    goto LABEL_24;
  }
  if (a2 != 16387) {
    goto LABEL_43;
  }
  uint64_t v13 = [MEMORY[0x1E4F1CA20] currentLocale];
  id v14 = [v13 objectForKey:*MEMORY[0x1E4F1C438]];
  BOOL v15 = [v13 objectForKey:*MEMORY[0x1E4F1C400]];
  id v16 = v14;
  __int16 v11 = v16;
  if (v15)
  {
    __int16 v11 = [NSString stringWithFormat:@"%@-%@", v16, v15];
  }
  int v17 = 0;
  int v12 = v8 + 1;
  char v18 = @"Current language";
LABEL_24:
  if (!v11)
  {
    uint64_t v9 = 2;
    goto LABEL_41;
  }
  unint64_t v26 = [v11 lengthOfBytesUsingEncoding:4];
  uint64_t v27 = v26;
  unint64_t v34 = v26;
  if (HIDWORD(v26))
  {
    NSLog(&cfstr_WasTooLargeFor.isa, v18, v8, v11);
    uint64_t v27 = 0xFFFFFFFFLL;
  }
  else if (!v26)
  {
LABEL_40:

    uint64_t v9 = 0xFFFFFFFFLL;
LABEL_41:
    free(*v12);
    *int v12 = 0;
    *a3 = "";
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_43;
  }
  int v28 = malloc_type_realloc(*v12, v27 + 1, 0xA472AE9DuLL);
  uint64_t v29 = v28;
  if (!v28) {
    goto LABEL_40;
  }
  *int v12 = v28;
  int v30 = objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v28, v27, &v34, 4, 0, 0, objc_msgSend(v11, "length"), 0);
  int v31 = v34;
  int v32 = HIDWORD(v34) ? 0 : v30;
  if (v32 != 1) {
    goto LABEL_40;
  }
  v29[v34] = 0;
  *a3 = v29;
  if (a4) {
    *a4 = v31;
  }
  if (v17) {
    [v8 setLastResponseIncludesCredential:1];
  }

  uint64_t v9 = 0;
LABEL_43:

  return v9;
}

void sub_1BF14E3B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t getPassword(uint64_t a1, void *a2, int a3, uint64_t **a4)
{
  int v6 = a2;
  BOOL v7 = v6;
  if (a3 == 16388)
  {
    id v8 = [v6 credentials];
    uint64_t v9 = [v8 password];

    if (!v9)
    {
      uint64_t v12 = 2;
LABEL_12:
      free(v7[4]);
      v7[4] = 0;
      getPassword_emptyPassword = 0;
      byte_1EA144160 = 0;
      *a4 = &getPassword_emptyPassword;
      goto LABEL_13;
    }
    unint64_t v10 = [v9 lengthOfBytesUsingEncoding:4];
    uint64_t v11 = v10;
    uint64_t v16 = v10;
    if (v10 < 0xFFFFFFFFFFFFFFF0)
    {
      if (!v10)
      {
LABEL_11:
        uint64_t v12 = 0xFFFFFFFFLL;
        goto LABEL_12;
      }
    }
    else
    {
      NSLog(&cfstr_PasswordWasToo.isa, v10, v7);
      uint64_t v11 = -17;
      uint64_t v16 = -17;
    }
    uint64_t v13 = (uint64_t *)malloc_type_realloc(v7[4], v11 + 16, 0xD789DDDDuLL);
    id v14 = v13;
    if (v13)
    {
      v7[4] = v13;
      if (objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v13 + 1, v11, &v16, 4, 0, 0, objc_msgSend(v9, "length"), 0))
      {
        *id v14 = v16;
        *a4 = v14;
        [v7 setLastResponseIncludesCredential:1];
        uint64_t v12 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    goto LABEL_11;
  }
  uint64_t v12 = 0xFFFFFFFFLL;
LABEL_14:

  return v12;
}

void sub_1BF14E5B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14E6F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14E778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14E958(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF14EDA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF14EE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ECSecureMIMETrustEvaluation;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF14F0A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t copyDeserializedTrust(uint64_t a1, void *a2)
{
  uint64_t v3 = SecTrustDeserialize();
  if (a2) {
    *a2 = 0;
  }
  return v3;
}

void sub_1BF14F2F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id serializeTrust(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)SecTrustSerialize();
  if (a2) {
    *a2 = 0;
  }
  return v3;
}

void sub_1BF14F56C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14F640(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF14F6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_1BF14F838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14F8CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14F920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14F9D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14FA44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14FAD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14FB70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF14FCF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14FDEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF14FF58(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF14FFFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1BF150098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF150120(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF150220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1502D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1503EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF150498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF150524(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF150630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1507B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id localizePrefixIfNeeded(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 regex];
  int v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v3, 4, 0, objc_msgSend(v3, "length"));

  if (v6)
  {
    uint64_t v7 = [v6 rangeAtIndex:2];
    uint64_t v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
    if (([v4 prefixLastStrongDirectionalityIsLeftToRight] & 1) == 0
      && objc_msgSend(v9, "ef_firstStrongDirectionalityIsLeftToRight"))
    {
      uint64_t v10 = objc_msgSend(NSString, "ef_stringByIsolatingDirectionalityForString:", v9);

      uint64_t v9 = (void *)v10;
    }
    uint64_t v11 = NSString;
    uint64_t v12 = [v4 localizedPrefix];
    uint64_t v13 = [v6 rangeAtIndex:1];
    BOOL v15 = objc_msgSend(v3, "substringWithRange:", v13, v14);
    id v16 = [v11 stringWithFormat:@"%@%@%@", v12, v15, v9];
  }
  else
  {
    id v16 = v3;
  }

  return v16;
}

void sub_1BF150A38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF150C84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF150ED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF151054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF151250(_Unwind_Exception *a1)
{
  int v6 = v5;

  _Unwind_Resume(a1);
}

id copyRegexForPrefixStrings(void *a1)
{
  id v1 = a1;
  int v2 = [v1 allObjects];
  id v3 = objc_msgSend(v2, "ef_map:", &__block_literal_global_57);

  id v4 = objc_opt_new();
  objc_msgSend(v4, "appendString:", CFSTR("^(\\N{RIGHT-TO-LEFT MARK}*("));
  id v5 = [v3 componentsJoinedByString:@"|"];
  [v4 appendFormat:@"(%@)", v5];

  [v4 appendString:@"(\\[\\d+\\])?"];
  [v4 appendString:@"\\s?[\\N{COLON}\\N{FULLWIDTH COLON}]\\s*]+"));
  id v13 = 0;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:v4 options:1 error:&v13];
  id v7 = v13;
  uint64_t v8 = v7;
  if (!v6)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = [v7 description];
    id v12 = [v10 exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v11 userInfo:0];

    objc_exception_throw(v12);
  }

  return v6;
}

void sub_1BF151458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF151BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id __copyRegexForPrefixStrings_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2 = [MEMORY[0x1E4F28FD8] escapedPatternForString:a2];
  return v2;
}

id _ef_log_ECTagValueList()
{
  if (_ef_log_ECTagValueList_onceToken[0] != -1) {
    dispatch_once(_ef_log_ECTagValueList_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)_ef_log_ECTagValueList_log;
  return v0;
}

void sub_1BF151D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF151DE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF151E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)ECTagValueList;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BF1521D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BF152388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF152448(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF152580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF152620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_1BF1526A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF152EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, _Unwind_Exception *exception_objecta, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,void *a46,void *a47,void *a48,void *a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1BF153320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF15344C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF153510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF153590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF15361C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1536A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1538A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1539D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF153A80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF153AF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF154088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  _Unwind_Resume(a1);
}

void sub_1BF154280(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF154378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF154444(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF15451C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void sub_1BF15489C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF154B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF154CA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF154D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF155174(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_1BF1552C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1554AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF155718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF155824(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BF155A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BF155B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF155E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF155F64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF155FF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF15604C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF156168(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1561BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1562C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF156334(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF1563B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF156418(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF156494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1564FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF156578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF156710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1567CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF156958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF156E18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF156F9C(_Unwind_Exception *a1)
{
  id v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF157310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_1BF157454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF1574CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BF15755C(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF157790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1BF157924(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF157A00(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BF157C98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BF157E40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

char **ECFindHTMLEntity(char *__s1, int a2)
{
  if ((a2 - 2) <= 6)
  {
    int v3 = a2;
    int v4 = a2;
    int v5 = a2;
    int v6 = a2;
    int v7 = a2;
    int v8 = a2;
    switch(a2)
    {
      case 2:
        goto LABEL_9;
      case 3:
        goto LABEL_8;
      case 4:
        goto LABEL_7;
      case 5:
        goto LABEL_6;
      case 6:
        goto LABEL_5;
      case 7:
        goto LABEL_4;
      default:
        int v3 = hash_asso_values[__s1[7]] + a2;
LABEL_4:
        int v4 = v3 + hash_asso_values[__s1[6]];
LABEL_5:
        int v5 = v4 + hash_asso_values[__s1[5]];
LABEL_6:
        int v6 = v5 + hash_asso_values[__s1[4]];
LABEL_7:
        int v7 = v6 + hash_asso_values[__s1[3]];
LABEL_8:
        int v8 = v7 + hash_asso_values[__s1[2]];
LABEL_9:
        uint64_t v9 = *__s1;
        unsigned int v10 = v8 + hash_asso_values[v9] + hash_asso_values[__s1[1] + 1];
        if (v10 > 0x443) {
          return 0;
        }
        int v11 = ECFindHTMLEntity_lookup[v10];
        if (v11 < 0) {
          return 0;
        }
        id v12 = &(&ECFindHTMLEntity_wordlist)[2 * (unsigned __int16)v11];
        id v13 = *v12;
        if (v9 != **v12 || strncmp(__s1 + 1, v13 + 1, (a2 - 1)) || v13[a2]) {
          return 0;
        }
        return v12;
    }
  }
  return 0;
}

uint64_t parseEntity(const __CFString *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    parseEntity_cold_1();
  }
  uint64_t Length = CFStringGetLength(a1);
  if (Length > 19) {
    return 0;
  }
  uint64_t v5 = Length;
  *(void *)__s1 = 0;
  uint64_t v37 = 0;
  int v38 = 0;
  unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buffer = v6;
  long long v34 = v6;
  v40.NSUInteger location = 0;
  v40.NSUInteger length = Length;
  CFStringGetCharacters(a1, v40, buffer);
  if (v5 < 1) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  unsigned int v10 = buffer;
  int v11 = &buffer[v5];
  while (2)
  {
    int v12 = *v10;
    switch(v8)
    {
      case 0:
        if (v12 != 35) {
          goto LABEL_46;
        }
        __s1[v9] = 35;
        uint64_t v9 = (v9 + 1);
        ++v10;
        uint64_t v8 = 1;
        goto LABEL_51;
      case 1:
        if ((v12 & 0xFFFFFFDF) == 0x58)
        {
          __s1[v9] = v12;
          uint64_t v9 = (v9 + 1);
          ++v10;
          uint64_t v8 = 2;
        }
        else if ((v12 - 48) >= 0xA)
        {
          uint64_t v8 = 5;
        }
        else
        {
          uint64_t v8 = 3;
        }
        goto LABEL_51;
      case 2:
        uint64_t v13 = v11 - v10;
        if (v13 >= 10 - v9) {
          uint64_t v13 = 10 - v9;
        }
        if (!v13) {
          goto LABEL_20;
        }
        do
        {
          unsigned int v14 = *v10;
          if ((unsigned __int16)(*v10 - 48) >= 0xAu
            && (v14 - 65 > 0x25 || ((1 << (v14 - 65)) & 0x3F0000003FLL) == 0))
          {
            uint64_t v8 = 5;
            goto LABEL_21;
          }
          int v16 = v14 - 48;
          if (v14 >= 0x41) {
            int v16 = ((_BYTE)v14 + 9) & 0xF;
          }
          uint64_t v7 = (v16 + 16 * v7);
          uint64_t v17 = (v9 + 1);
          __s1[v9] = v14;
          ++v10;
          uint64_t v9 = v17;
          --v13;
        }
        while (v13);
        uint64_t v9 = v17;
LABEL_20:
        uint64_t v8 = 2;
LABEL_21:
        BOOL v18 = v9 == 10;
        goto LABEL_49;
      case 3:
        uint64_t v19 = v11 - v10;
        if (v19 >= 9 - v9) {
          uint64_t v19 = 9 - v9;
        }
        if (!v19) {
          goto LABEL_28;
        }
        do
        {
          int v20 = *v10;
          if ((v20 - 48) > 9)
          {
            uint64_t v8 = 5;
            goto LABEL_48;
          }
          uint64_t v7 = (v20 + 10 * v7 - 48);
          uint64_t v21 = (v9 + 1);
          __s1[v9] = v20;
          ++v10;
          uint64_t v9 = v21;
          --v19;
        }
        while (v19);
        uint64_t v9 = v21;
LABEL_28:
        uint64_t v8 = 3;
LABEL_48:
        BOOL v18 = v9 == 9;
LABEL_49:
        if (v18) {
          uint64_t v8 = 5;
        }
        goto LABEL_51;
      case 4:
        uint64_t v22 = v11 - v10;
        if (v22 >= 9 - v9) {
          uint64_t v22 = 9 - v9;
        }
        if (!v22)
        {
          uint64_t v25 = v9;
LABEL_45:
          uint64_t v9 = v25;
          if (v25 == 9) {
            goto LABEL_54;
          }
LABEL_46:
          uint64_t v8 = 4;
LABEL_51:
          if (v10 >= v11) {
            return 0;
          }
          continue;
        }
        while (1)
        {
          int v23 = *v10;
          if ((v23 - 58) <= 0xFFFFFFF5 && (v23 & 0xFFFFFFDF) - 91 < 0xFFFFFFE6) {
            break;
          }
          uint64_t v25 = (v9 + 1);
          __s1[v9] = v23;
          ++v10;
          LODWORD(v9) = v9 + 1;
          if (!--v22) {
            goto LABEL_45;
          }
        }
LABEL_54:
        if (v9 >= 2)
        {
          unint64_t v26 = ECFindHTMLEntity(__s1, v9);
          if (v26) {
            uint64_t v7 = *((unsigned int *)v26 + 2);
          }
        }
LABEL_57:
        if ((v7 - 1) > 0x10FFFE)
        {
          if (a2)
          {
            uint64_t v29 = NSString;
            int v30 = [NSString stringWithCharacters:__s1 length:v9];
            *a2 = [v29 stringWithFormat:@"&%@", v30];
          }
          return 0;
        }
        if (a2)
        {
          int v32 = 0;
          if (v7 < 0x10000)
          {
            uint64_t v28 = 1;
            LOWORD(v27) = v7;
          }
          else
          {
            unsigned int v27 = ((v7 + 67043328) >> 10) - 10240;
            HIWORD(v32) = v7 & 0x3FF | 0xDC00;
            uint64_t v28 = 2;
          }
          LOWORD(v32) = v27;
          *a2 = [NSString stringWithCharacters:&v32 length:v28];
        }
        return v7;
      case 5:
        goto LABEL_57;
      default:
        goto LABEL_51;
    }
  }
}

void sub_1BF1583D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t ECLocalMessageActionID.databaseID.getter()
{
  return *(void *)(v0 + OBJC_IVAR___ECLocalMessageActionID_databaseID);
}

uint64_t ECLocalMessageActionID.stringValue.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___ECLocalMessageActionID_stringValue);
  swift_bridgeObjectRetain();
  return v1;
}

void __swiftcall ECLocalMessageActionID.init(databaseID:)(ECLocalMessageActionID *__return_ptr retstr, Swift::Int64 databaseID)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v3, sel_initWithDatabaseID_, databaseID);
}

id ECLocalMessageActionID.init(databaseID:)(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR___ECLocalMessageActionID_databaseID] = a1;
  int v2 = v1;
  id v3 = (id)EFStringWithInt64();
  uint64_t v4 = sub_1BF172140();
  uint64_t v6 = v5;

  uint64_t v7 = (uint64_t *)&v2[OBJC_IVAR___ECLocalMessageActionID_stringValue];
  *uint64_t v7 = v4;
  v7[1] = v6;

  v9.receiver = v2;
  v9.super_class = (Class)ECLocalMessageActionID;
  return objc_msgSendSuper2(&v9, sel_init);
}

uint64_t ECLocalMessageActionID.description.getter()
{
  id v1 = objc_msgSend(v0, sel_stringValue);
  uint64_t v2 = sub_1BF172140();

  return v2;
}

BOOL ECLocalMessageActionID.isEqual(_:)(uint64_t a1)
{
  sub_1BF1587C0(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for ECLocalMessageActionID();
    if (swift_dynamicCast())
    {
      id v2 = objc_msgSend(v5, sel_databaseID);
      id v3 = objc_msgSend(v1, sel_databaseID);

      return v2 == v3;
    }
  }
  else
  {
    sub_1BF15886C((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_1BF1587C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1431B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1BF15886C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA1431B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t type metadata accessor for ECLocalMessageActionID()
{
  unint64_t result = qword_1EA143F60;
  if (!qword_1EA143F60)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EA143F60);
  }
  return result;
}

uint64_t ECLocalMessageActionID.hash.getter()
{
  objc_msgSend(v0, sel_databaseID);
  return sub_1BF172160();
}

id ECLocalMessageActionID.copy(with:)@<X0>(void *a1@<X8>)
{
  a1[3] = type metadata accessor for ECLocalMessageActionID();
  *a1 = v3;
  return v3;
}

void __swiftcall ECLocalMessageActionID.init()(ECLocalMessageActionID *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

void ECLocalMessageActionID.init()()
{
}

void __swiftcall ECLocalMessageActionID.init(integerLiteral:)(ECLocalMessageActionID *__return_ptr retstr, Swift::Int64 integerLiteral)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v3, sel_initWithDatabaseID_, integerLiteral);
}

uint64_t sub_1BF158B3C()
{
  return MEMORY[0x1E4FBC238];
}

id sub_1BF158B48@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDatabaseID_, *a1);
  *a2 = result;
  return result;
}

uint64_t anonymous_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &anonymous_server_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "ANONYMOUS version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t anonymous_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &anonymous_client_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "ANONYMOUS version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t anonymous_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a5)
  {
    uint64_t result = 0;
    *a5 = 0;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/anonymous.c near line %d", 76);
    return 4294967289;
  }
  return result;
}

uint64_t anonymous_server_mech_step(uint64_t a1, uint64_t a2, const char *a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  if (a2 && a5 && a6 && a7)
  {
    *a5 = 0;
    *a6 = 0;
    if (a3)
    {
      if (a4 >= 0xFF) {
        size_t v10 = 255;
      }
      else {
        size_t v10 = a4;
      }
      int v11 = (char *)(*(uint64_t (**)(void))(*(void *)(a2 + 80) + 40))((v10 + 1));
      if (v11)
      {
        int v12 = v11;
        strncpy(v11, a3, v10)[v10] = 0;
        (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 4, "ANONYMOUS login: \"%s\"", v12);
        if (v12 != a3) {
          (*(void (**)(const char *))(*(void *)(a2 + 80) + 64))(v12);
        }
        uint64_t result = (*(uint64_t (**)(void, const char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), "anonymous", 0, 3, a7);
        if (!result)
        {
          *(_DWORD *)a7 = 1;
          *(_DWORD *)(a7 + 136) = 0;
          *(_OWORD *)(a7 + 32) = 0u;
          *(_OWORD *)(a7 + 48) = 0u;
          *(void *)(a7 + 64) = 0;
        }
      }
      else
      {
        (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/anonymous.c near line %d", 118);
        return 4294967294;
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    if (a2) {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/anonymous.c near line %d", 101);
    }
    return 4294967289;
  }
  return result;
}

uint64_t anonymous_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (a3)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(v3 + 40))(16);
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      uint64_t result = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      *a3 = v7;
    }
    else
    {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/anonymous.c near line %d", 213);
      return 4294967294;
    }
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(v3 + 264))(*(void *)(v3 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/anonymous.c near line %d", 206);
    return 4294967289;
  }
  return result;
}

uint64_t anonymous_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t **a5, void *a6, unsigned int *a7, uint64_t a8)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  __src = 0;
  if (a2 && a6 && a7 && a8)
  {
    *a6 = 0;
    *a7 = 0;
    if (a4)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Nonzero serverinlen in ANONYMOUS continue_step");
      return 4294967291;
    }
    else
    {
      uint64_t v15 = *(void *)(a2 + 24);
      if (*(_DWORD *)(a2 + 80) <= *(_DWORD *)(a2 + 112))
      {
        uint64_t simple = _plug_get_simple(v15, 16385, 0, &__src, a5);
        if ((simple & 0xFFFFFFFD) == 0)
        {
          if (a5 && *a5)
          {
            (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
            *a5 = 0;
          }
          if (simple == 2)
          {
            unsigned int prompts = _plug_make_prompts(*(void *)(a2 + 24), a5, (uint64_t)"Please enter anonymous identification", (uint64_t)"", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
            if (prompts) {
              return prompts;
            }
            else {
              return 2;
            }
          }
          else
          {
            BOOL v18 = __src;
            if (!__src || !*__src)
            {
              BOOL v18 = "anonymous";
              __src = "anonymous";
            }
            size_t v19 = strlen(v18);
            uint64_t simple = (*(uint64_t (**)(void, const char *, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), "anonymous", 0, 3, a8);
            if (!simple)
            {
              long long v37 = 0u;
              long long v38 = 0u;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              long long v27 = 0u;
              long long v28 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              *(_OWORD *)__s = 0u;
              long long v24 = 0u;
              gethostname(__s, 0x100uLL);
              HIBYTE(v38) = 0;
              unsigned int v20 = strlen(__s) + v19 + 1;
              *a7 = v20;
              uint64_t simple = _plug_buf_alloc(*(void *)(a2 + 24), (uint64_t *)a1, (unsigned int *)(a1 + 8), v20);
              if (!simple)
              {
                strcpy(*(char **)a1, __src);
                *(unsigned char *)(*(void *)a1 + v19) = 64;
                size_t v21 = strlen(__s);
                memcpy((void *)(*(void *)a1 + v19 + 1), __s, v21);
                *a6 = *(void *)a1;
                *(_DWORD *)a8 = 1;
                *(_DWORD *)(a8 + 136) = 0;
                *(_OWORD *)(a8 + 32) = 0u;
                *(_OWORD *)(a8 + 48) = 0u;
                *(void *)(a8 + 64) = 0;
              }
            }
          }
        }
      }
      else
      {
        (*(void (**)(void, void, const char *))(v15 + 264))(*(void *)(v15 + 8), 0, "SSF requested of ANONYMOUS plugin");
        return 4294967281;
      }
    }
  }
  else
  {
    if (a2) {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/anonymous.c near line %d", 245);
    }
    return 4294967289;
  }
  return simple;
}

void *anonymous_client_dispose(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*result) {
      (*(void (**)(void))(a2 + 64))();
    }
    uint64_t v4 = *(uint64_t (**)(void *))(a2 + 64);
    return (void *)v4(v3);
  }
  return result;
}

uint64_t apop_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a4 = &apop_server_plugins;
    *a5 = 1;
    *a3 = 4;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "APOP version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t apop_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a4 = &apop_client_plugins;
    *a5 = 1;
    *a3 = 4;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "APOP version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t apop_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(56);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t result = 0;
    *(void *)(v8 + 48) = 0;
    *(_OWORD *)(v8 + 16) = 0u;
    *(_OWORD *)(v8 + 32) = 0u;
    *(_OWORD *)uint64_t v8 = 0u;
    *(_DWORD *)uint64_t v8 = 1;
    *a5 = v8;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 103);
    return 4294967294;
  }
  return result;
}

uint64_t apop_server_mech_step(_DWORD *a1, uint64_t a2, const char *a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  *(void *)(a7 + 32) = 0;
  *(void *)(a7 + 48) = 0;
  *(void *)(a7 + 64) = 0;
  *(_DWORD *)(a7 + 136) = 0;
  *(void *)(a7 + 8) = 0;
  *(void *)(a7 + 16) = 0;
  if (a4 >= 0x401)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "APOP input longer than 1024 bytes");
    return 4294967291;
  }
  if (*a1 != 1)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Unexpected State Reached in APOP plugin");
    return 0xFFFFFFFFLL;
  }
  if (!a4)
  {
LABEL_8:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Can only find author (no password)");
    return 4294967291;
  }
  uint64_t v12 = 0;
  while (a3[v12])
  {
    if (a4 == ++v12) {
      goto LABEL_8;
    }
  }
  if ((int)v12 + 1 >= a4)
  {
LABEL_14:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Can only find author/en (no challenge)");
    return 4294967291;
  }
  uint64_t v14 = (uint64_t)&a3[v12 + 1];
  while (a3[v12 + 1])
  {
    if (a4 - 1 == ++v12) {
      goto LABEL_14;
    }
  }
  LODWORD(v15) = v12 + 2;
  if ((int)v12 + 2 >= a4)
  {
LABEL_19:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Can only find author/en/challenge (no digest)");
    return 4294967291;
  }
  int v16 = (char *)&a3[v15];
  unsigned int v17 = v12 + 3;
  unint64_t v15 = v15;
  while (a3[v15])
  {
    ++v15;
    ++v17;
    if (v15 >= a4) {
      goto LABEL_19;
    }
  }
  LODWORD(v18) = v17;
  if (v17 < a4)
  {
    uint64_t v18 = v17;
    while (a3[v18])
    {
      if (++v18 >= (unint64_t)a4) {
        goto LABEL_28;
      }
    }
  }
  if (v18 != a4)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Got more data than we were expecting in the APOP plugin\n");
    return 4294967291;
  }
LABEL_28:
  long long v30 = &a3[v17];
  __s = v16;
  unint64_t v19 = a4 - (unint64_t)v17;
  if (*a3) {
    unsigned int v20 = a3;
  }
  else {
    unsigned int v20 = (const char *)v14;
  }
  size_t v29 = v19 + 1;
  size_t v21 = (char *)(*(uint64_t (**)(void))(*(void *)(a2 + 80) + 40))();
  long long v33 = v21;
  size_t v22 = v19 + strlen(v20) + 2;
  uint64_t v23 = (*(uint64_t (**)(size_t))(*(void *)(a2 + 80) + 40))(v22);
  if (v21) {
    BOOL v24 = v23 == 0;
  }
  else {
    BOOL v24 = 1;
  }
  if (v24)
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 251);
    return 4294967294;
  }
  else
  {
    long long v25 = (char *)v23;
    strlcpy(v21, v30, v29);
    long long v31 = v20;
    strlcpy(v25, v20, v22);
    strlcat(v25, " ", v22);
    strlcat(v25, v21, v22);
    unsigned int v26 = strlen(__s);
    unsigned int v27 = strlen(v25);
    uint64_t v28 = sasl_checkapop(*(sasl_conn_t **)(*(void *)(a2 + 80) + 8), __s, v26, v25, v27);
    (*(void (**)(char *))(*(void *)(a2 + 80) + 64))(v25);
    if (v28
      || (uint64_t result = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), v14, 0, 1, a7), !result)&& (uint64_t result = (*(uint64_t (**)(void, const char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), v31, 0, 2, a7), !result))
    {
      _plug_free_string(*(void *)(a2 + 80), (const char **)&v33);
      *a5 = 0;
      *a6 = 0;
      ++*a1;
      *(_DWORD *)a7 = 1;
      return v28;
    }
  }
  return result;
}

uint64_t apop_both_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(_DWORD *)(result + 48) && *(void *)(result + 8)) {
      _plug_free_secret((unsigned int *)a2, (void *)(result + 8));
    }
    if (*(void *)(v3 + 16)) {
      (*(void (**)(void))(a2 + 64))();
    }
    uint64_t v4 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v4(v3);
  }
  return result;
}

uint64_t apop_both_mech_free(uint64_t result, uint64_t a2)
{
  if (result) {
    return (*(uint64_t (**)(void))(a2 + 64))();
  }
  return result;
}

uint64_t apop_client_mech_new(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(56);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t result = 0;
    *(void *)(v6 + 48) = 0;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_OWORD *)(v6 + 32) = 0u;
    *(_OWORD *)uint64_t v6 = 0u;
    *(_DWORD *)uint64_t v6 = 1;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 362);
    return 4294967294;
  }
  return result;
}

uint64_t apop_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, int a4, const void ***a5, void *a6, _DWORD *a7, uint64_t a8)
{
  *a6 = 0;
  *a7 = 0;
  if (*(_DWORD *)a1 != 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 80) > *(_DWORD *)(a2 + 112))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "The APOP plugin cannot support any SSF");
    return 4294967281;
  }
  if (a3 || a4)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "The APOP plugin received initial data.");
    return 4294967291;
  }
  if (*(void *)(a8 + 16))
  {
    uint64_t v46 = 0;
LABEL_8:
    LODWORD(v15) = 0;
    goto LABEL_9;
  }
  unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v49 = (uint64_t (*)(unint64_t, uint64_t, uint64_t *, void))0xAAAAAAAAAAAAAAAALL;
  if (a5)
  {
    uint64_t v18 = *a5;
    if (*a5)
    {
      unint64_t v19 = *v18;
      if (*v18)
      {
        unsigned int v20 = v18 + 6;
        while (v19 != (const void *)16386)
        {
          size_t v21 = *v20;
          v20 += 6;
          unint64_t v19 = v21;
          if (!v21) {
            goto LABEL_19;
          }
        }
        uint64_t v46 = (uint64_t)*(v20 - 2);
        goto LABEL_8;
      }
    }
  }
LABEL_19:
  uint64_t v15 = (*(uint64_t (**)(void, uint64_t, void, unint64_t *))(*(void *)(a2 + 24) + 248))(*(void *)(*(void *)(a2 + 24) + 8), 16386, &v49, &v48);
  if (v15) {
    BOOL v22 = 1;
  }
  else {
    BOOL v22 = v49 == 0;
  }
  if (!v22)
  {
    uint64_t v47 = 0;
    uint64_t v15 = v49(v48, 16386, &v47, 0);
    if (!v15)
    {
      uint64_t v46 = v47;
      if (!v47)
      {
        (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 476);
        return 4294967289;
      }
      goto LABEL_8;
    }
  }
  if ((v15 & 0xFFFFFFFD) != 0) {
    return v15;
  }
  uint64_t v46 = 0;
LABEL_9:
  if (*(void *)(a8 + 8))
  {
    uint64_t v16 = 0;
LABEL_11:
    int v17 = 0;
    goto LABEL_41;
  }
  unint64_t v48 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v49 = (uint64_t (*)(unint64_t, uint64_t, uint64_t *, void))0xAAAAAAAAAAAAAAAALL;
  if (a5)
  {
    uint64_t v23 = *a5;
    if (*a5)
    {
      BOOL v24 = *v23;
      if (*v23)
      {
        long long v25 = v23 + 6;
        while (v24 != (const void *)16385)
        {
          unsigned int v26 = *v25;
          v25 += 6;
          BOOL v24 = v26;
          if (!v26) {
            goto LABEL_32;
          }
        }
        uint64_t v16 = (uint64_t)*(v25 - 2);
        goto LABEL_11;
      }
    }
  }
LABEL_32:
  int v27 = v15;
  int v17 = (*(uint64_t (**)(void, uint64_t, void, unint64_t *))(*(void *)(a2 + 24) + 248))(*(void *)(*(void *)(a2 + 24) + 8), 16385, &v49, &v48);
  if (v17) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = v49 == 0;
  }
  if (!v28)
  {
    uint64_t v47 = 0;
    int v17 = v49(v48, 16385, &v47, 0);
    if (!v17)
    {
      uint64_t v16 = v47;
      LODWORD(v15) = v27;
      if (v47) {
        goto LABEL_11;
      }
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 431);
      LODWORD(v15) = v27;
      int v17 = -7;
      goto LABEL_38;
    }
  }
  LODWORD(v15) = v27;
  if ((v17 & 0xFFFFFFFD) != 0)
  {
LABEL_38:
    uint64_t v16 = v46;
    goto LABEL_41;
  }
  uint64_t v16 = 0;
LABEL_41:
  size_t v29 = (size_t **)(a1 + 8);
  if (*(void *)(a1 + 8))
  {
    LODWORD(v9) = 0;
  }
  else
  {
    uint64_t v40 = v16;
    int v41 = v15;
    uint64_t password = _plug_get_password(*(void *)(a2 + 24), (size_t **)(a1 + 8), (_DWORD *)(a1 + 48), a5);
    uint64_t v16 = v40;
    LODWORD(v15) = v41;
    uint64_t v9 = password;
    if ((password & 0xFFFFFFFD) != 0) {
      return v9;
    }
  }
  if (a5 && *a5)
  {
    int v45 = v17;
    int v30 = v15;
    uint64_t v31 = v16;
    (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
    uint64_t v16 = v31;
    LODWORD(v15) = v30;
    int v17 = v45;
    *a5 = 0;
  }
  if (v15 != 2 && v17 != 2 && v9 != 2)
  {
    uint64_t v9 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v16, 0, 2, a8);
    if (v9) {
      return v9;
    }
    uint64_t v9 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v46, 0, 1, a8);
    if (v9) {
      return v9;
    }
    long long v32 = *v29;
    if (!*v29 || !*v32 || *((unsigned char *)v32 + 8) != 60)
    {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 658);
      return 4294967289;
    }
    long long v33 = (char *)(*(uint64_t (**)(size_t))(*(void *)(a2 + 24) + 40))(*v32 + 1);
    if (v33)
    {
      long long v34 = v33;
      memcpy(v33, *v29 + 1, **v29);
      v34[**v29] = 0;
      long long v35 = strstr(v34, "> ");
      if (v35)
      {
        v35[1] = 0;
        int v36 = *(_DWORD *)(a8 + 24) + *(_DWORD *)(a8 + 28) + **(_DWORD **)(a1 + 8);
        *a7 = v36 + 2;
        uint64_t v9 = _plug_buf_alloc(*(void *)(a2 + 24), (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), v36 + 3);
        if (!v9)
        {
          bzero(*(void **)(a1 + 16), (*a7 + 1));
          memcpy(*(void **)(a1 + 16), *(const void **)(a8 + 8), *(unsigned int *)(a8 + 24));
          memcpy((void *)(*(void *)(a1 + 16) + *(unsigned int *)(a8 + 24) + 1), *(const void **)(a8 + 16), *(unsigned int *)(a8 + 28));
          memcpy((void *)(*(void *)(a1 + 16) + *(unsigned int *)(a8 + 24) + *(unsigned int *)(a8 + 28) + 2), v34, **(void **)(a1 + 8) + 1);
          bzero(v34, **(void **)(a1 + 8));
          (*(void (**)(char *))(*(void *)(a2 + 24) + 64))(v34);
          *a6 = *(void *)(a1 + 16);
          *(void *)(a8 + 32) = 0;
          *(void *)(a8 + 48) = 0;
          *(void *)(a8 + 64) = 0;
          *(_DWORD *)(a8 + 136) = 0;
          *(_DWORD *)a1 = 2;
        }
        return v9;
      }
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 678);
      (*(void (**)(char *))(*(void *)(a2 + 24) + 64))(v34);
      return 4294967289;
    }
    return 4294967294;
  }
  if (v17 == 2) {
    int v37 = 2;
  }
  else {
    int v37 = 1;
  }
  if (v15 == 2) {
    ++v37;
  }
  if (v9 == 2) {
    ++v37;
  }
  uint64_t v38 = *(void *)(a2 + 24);
  if (v37 == 1)
  {
    (*(void (**)(void, void, const char *))(v38 + 264))(*(void *)(v38 + 8), 0, "make_prompts called with no actual prompts");
    return 0xFFFFFFFFLL;
  }
  int v43 = v15;
  uint64_t v44 = (const void **)(*(uint64_t (**)(void, uint64_t))(v38 + 40))((48 * v37 + 48), v16);
  if (!v44)
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/apop.c near line %d", 510);
    return 4294967294;
  }
  *a5 = v44;
  if (v17 == 2)
  {
    *uint64_t v44 = (const void *)16385;
    v44[1] = "Authorization Name";
    v44[2] = "Please enter your authorization name";
    v44[3] = 0;
    v44 += 6;
  }
  if (v43 == 2)
  {
    *uint64_t v44 = (const void *)16386;
    v44[1] = "Authentication Name";
    v44[2] = "Please enter your authentication name";
    v44[3] = 0;
    v44 += 6;
  }
  if (v9 == 2)
  {
    *uint64_t v44 = (const void *)16388;
    v44[1] = "Password";
    v44[2] = "Please enter your password";
    v44[3] = 0;
    v44 += 6;
  }
  *(_OWORD *)uint64_t v44 = 0u;
  *((_OWORD *)v44 + 1) = 0u;
  return 2;
}

uint64_t atoken_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a4 = &atoken_client_plugins;
    *a5 = 1;
    *a3 = 4;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "ATOKEN version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t atoken_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(64);
  if (v5)
  {
    uint64_t v6 = (_OWORD *)v5;
    uint64_t result = 0;
    v6[2] = 0u;
    v6[3] = 0u;
    *uint64_t v6 = 0u;
    v6[1] = 0u;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/atoken.c near line %d", 74);
    return 4294967294;
  }
  return result;
}

uint64_t atoken_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5, void *a6, unsigned int *a7, uint64_t a8)
{
  *a6 = 0;
  *a7 = 0;
  if (*(_DWORD *)(a2 + 80) <= *(_DWORD *)(a2 + 112))
  {
    uint64_t v15 = (void *)(a1 + 24);
    if (*(void *)(a1 + 24))
    {
      int v16 = 0;
    }
    else
    {
      uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 18944, 1, v15, a5);
      int v16 = simple;
      uint64_t prompts = simple;
      if ((simple & 0xFFFFFFFD) != 0) {
        return prompts;
      }
    }
    if (*(void *)(a1 + 16))
    {
      int v17 = 0;
    }
    else
    {
      uint64_t v39 = _plug_get_simple(*(void *)(a2 + 24), 18945, 1, (void *)(a1 + 16), a5);
      int v17 = v39;
      uint64_t prompts = v39;
      if ((v39 & 0xFFFFFFFD) != 0) {
        return prompts;
      }
    }
    if (*(void *)(a1 + 32))
    {
      int v18 = 0;
    }
    else
    {
      uint64_t v40 = _plug_get_simple(*(void *)(a2 + 24), 18946, 1, (void *)(a1 + 32), a5);
      int v18 = v40;
      uint64_t prompts = v40;
      if ((v40 & 0xFFFFFFFD) != 0) {
        return prompts;
      }
    }
    if (*(void *)(a1 + 40))
    {
      int v47 = 0;
    }
    else
    {
      uint64_t prompts = _plug_get_simple(*(void *)(a2 + 24), 18949, 1, (void *)(a1 + 40), a5);
      int v47 = prompts;
      if ((prompts & 0xFFFFFFFD) != 0) {
        return prompts;
      }
    }
    if (*(void *)(a1 + 48))
    {
      LODWORD(v19) = 0;
    }
    else
    {
      uint64_t v19 = _plug_get_simple(*(void *)(a2 + 24), 18950, 1, (void *)(a1 + 48), a5);
      uint64_t prompts = v19;
      if ((v19 & 0xFFFFFFFD) != 0) {
        return prompts;
      }
    }
    if (*(void *)(a1 + 56))
    {
      LODWORD(prompts) = 0;
    }
    else
    {
      int v44 = v19;
      uint64_t v45 = _plug_get_simple(*(void *)(a2 + 24), 18951, 1, (void *)(a1 + 56), a5);
      LODWORD(v19) = v44;
      uint64_t prompts = v45;
      if ((v45 & 0xFFFFFFFD) != 0) {
        return prompts;
      }
    }
    if (a5 && *a5)
    {
      int v46 = v19;
      (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      LODWORD(v19) = v46;
      *a5 = 0;
    }
    if (v18 == 2 || v17 == 2 || v16 == 2 || v47 == 2 || v19 == 2 || prompts == 2)
    {
      if (v17 == 2) {
        int v41 = "Please enter your authorization name";
      }
      else {
        int v41 = 0;
      }
      if (v16 == 2) {
        uint64_t v42 = "Please enter your authentication name";
      }
      else {
        uint64_t v42 = 0;
      }
      if (v18 == 2) {
        int v43 = "Please enter your authentication token";
      }
      else {
        int v43 = 0;
      }
      uint64_t prompts = _plug_make_prompts(*(void *)(a2 + 24), a5, (uint64_t)v41, 0, (uint64_t)v42, 0, (uint64_t)v43, 0, 0, 0, 0, 0, 0, 0);
      if (!prompts) {
        return 2;
      }
    }
    else
    {
      int v20 = strlen(*(const char **)(a1 + 24));
      int v21 = strlen(*(const char **)(a1 + 16));
      int v22 = strlen(*(const char **)(a1 + 32));
      int v23 = strlen(*(const char **)(a1 + 40));
      int v24 = strlen(*(const char **)(a1 + 48));
      unsigned int v25 = v20 + v21 + v22 + v23 + v24 + strlen(*(const char **)(a1 + 56)) + 5;
      *a7 = v25;
      uint64_t prompts = _plug_buf_alloc(*(void *)(a2 + 24), (uint64_t *)a1, (unsigned int *)(a1 + 8), v25);
      if (!prompts)
      {
        bzero(*(void **)a1, *a7);
        uint64_t v26 = *(void *)a1;
        size_t v27 = strlen(*(const char **)(a1 + 24));
        memcpy(*(void **)a1, *(const void **)(a1 + 24), v27);
        BOOL v28 = (char *)(v26 + strlen(*(const char **)(a1 + 24)) + 1);
        size_t v29 = strlen(*(const char **)(a1 + 16));
        memcpy(v28, *(const void **)(a1 + 16), v29);
        int v30 = &v28[strlen(*(const char **)(a1 + 16)) + 1];
        size_t v31 = strlen(*(const char **)(a1 + 32));
        memcpy(v30, *(const void **)(a1 + 32), v31);
        long long v32 = &v30[strlen(*(const char **)(a1 + 32)) + 1];
        size_t v33 = strlen(*(const char **)(a1 + 40));
        memcpy(v32, *(const void **)(a1 + 40), v33);
        long long v34 = &v32[strlen(*(const char **)(a1 + 40)) + 1];
        size_t v35 = strlen(*(const char **)(a1 + 48));
        memcpy(v34, *(const void **)(a1 + 48), v35);
        int v36 = &v34[strlen(*(const char **)(a1 + 48)) + 1];
        size_t v37 = strlen(*(const char **)(a1 + 56));
        memcpy(v36, *(const void **)(a1 + 56), v37);
        *a6 = *(void *)a1;
        uint64_t prompts = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), *(void *)(a1 + 16), 0, 1, a8);
        if (!prompts)
        {
          uint64_t prompts = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), *v15, 0, 2, a8);
          if (!prompts)
          {
            *(_DWORD *)a8 = 1;
            *(_DWORD *)(a8 + 136) = 0;
            *(_OWORD *)(a8 + 32) = 0u;
            *(_OWORD *)(a8 + 48) = 0u;
            *(void *)(a8 + 64) = 0;
          }
        }
      }
    }
  }
  else
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "SSF requested of ATOKEN plugin");
    return 4294967281;
  }
  return prompts;
}

void *atoken_client_mech_dispose(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*result) {
      (*(void (**)(void))(a2 + 64))();
    }
    uint64_t v4 = *(uint64_t (**)(void *))(a2 + 64);
    return (void *)v4(v3);
  }
  return result;
}

uint64_t atoken2_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a4 = &atoken2_client_plugins;
    *a5 = 1;
    *a3 = 4;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "ATOKEN2 version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t atoken2_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(24);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t result = 0;
    *uint64_t v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/atoken2.m near line %d", 31);
    return 4294967294;
  }
  return result;
}

uint64_t atoken2_client_mech_step(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5, void *a6, unsigned int *a7, uint64_t a8)
{
  *a6 = 0;
  *a7 = 0;
  if (*(_DWORD *)(a2 + 80) <= *(_DWORD *)(a2 + 112))
  {
    int v16 = a1 + 2;
    if (a1[2])
    {
      LODWORD(simple) = 0;
    }
    else
    {
      uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 18952, 1, v16, a5);
      if ((simple & 0xFFFFFFFD) != 0) {
        return simple;
      }
    }
    if (a5 && *a5)
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      *a5 = 0;
    }
    if (simple == 2)
    {
      uint64_t simple = _plug_make_prompts(*(void *)(a2 + 24), a5, 0, 0, 0, 0, (uint64_t)"Please enter your authentication token", 0, 0, 0, 0, 0, 0, 0);
      if (!simple) {
        return 2;
      }
    }
    else
    {
      int v17 = (void *)MEMORY[0x1C18A2EF0]();
      int v18 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:*v16 length:strlen((const char *)*v16) freeWhenDone:0];
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedData:v18 options:0];
      unsigned int v20 = [v19 length];
      *a7 = v20;
      uint64_t simple = _plug_buf_alloc(*(void *)(a2 + 24), a1, (unsigned int *)a1 + 2, v20);
      if (simple)
      {
      }
      else
      {
        [v19 getBytes:*a1 length:*a7];

        uint64_t simple = 0;
        uint64_t v21 = a1[2];
        *(void *)(a8 + 8) = v21;
        *(void *)(a8 + 16) = v21;
        *a6 = *a1;
        *(_DWORD *)a8 = 1;
        *(_DWORD *)(a8 + 136) = 0;
        *(_OWORD *)(a8 + 32) = 0u;
        *(_OWORD *)(a8 + 48) = 0u;
        *(void *)(a8 + 64) = 0;
      }
    }
  }
  else
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "SSF requested of ATOKEN2 plugin");
    return 4294967281;
  }
  return simple;
}

void sub_1BF15A690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *atoken2_client_mech_dispose(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*result) {
      (*(void (**)(void))(a2 + 64))();
    }
    uint64_t v4 = *(uint64_t (**)(void *))(a2 + 64);
    return (void *)v4(v3);
  }
  return result;
}

propctx *__cdecl prop_new(unsigned int estimate)
{
  uint64_t v2 = (propctx *)_sasl_allocation_utils(56);
  if (v2)
  {
    if (estimate) {
      uint64_t v3 = estimate + 96;
    }
    else {
      uint64_t v3 = 1116;
    }
    uint64_t v4 = alloc_proppool(v3);
    *((void *)v2 + 5) = v4;
    if (v4)
    {
      *((void *)v2 + 6) = v4;
      uint64_t v5 = v4[1];
      v4[2] = v5 - 96;
      *((void *)v2 + 2) = 0x400000000;
      *((void *)v2 + 3) = (char *)v4 + v5 + 24;
      *((void *)v2 + 4) = v4 + 15;
      *(void *)uint64_t v2 = v4 + 3;
      *((void *)v2 + 1) = 0;
    }
    else
    {
      off_1EB527668(v2);
      return 0;
    }
  }
  return v2;
}

void prop_dispose(propctx **ctx)
{
  if (ctx)
  {
    uint64_t v2 = *ctx;
    if (v2)
    {
      uint64_t v4 = (void *)((char *)v2 + 40);
      uint64_t v3 = (void *)*((void *)v2 + 5);
      if (v3)
      {
        do
        {
          void *v4 = *v3;
          off_1EB527668(v3);
          uint64_t v2 = *ctx;
          uint64_t v4 = (void *)((char *)*ctx + 40);
          uint64_t v3 = (void *)*v4;
        }
        while (*v4);
      }
      off_1EB527668(v2);
      *ctx = 0;
    }
  }
}

int prop_dup(propctx *src_ctx, propctx **dst_ctx)
{
  int v2 = -7;
  if (src_ctx && dst_ctx)
  {
    uint64_t v5 = (uint64_t *)*((void *)src_ctx + 5);
    if (v5)
    {
      unsigned int v6 = 0;
      do
      {
        v6 += *((_DWORD *)v5 + 2);
        uint64_t v5 = (uint64_t *)*v5;
      }
      while (v5);
    }
    else
    {
      unsigned int v6 = 0;
    }
    uint64_t v7 = prop_new(v6);
    if (v7)
    {
      uint64_t v8 = v7;
      *((_DWORD *)v7 + 4) = *((_DWORD *)src_ctx + 4);
      int v9 = *((_DWORD *)src_ctx + 4);
      *((_DWORD *)v7 + 5) = v9 + 1;
      uint64_t v10 = *((void *)v7 + 5);
      *(void *)(v10 + 16) = *(void *)(v10 + 8) - 24 * (v9 + 1);
      *((void *)v7 + 4) = v10 + 24 * (v9 + 1) + 24;
      if (v9)
      {
        uint64_t v11 = 0;
        unint64_t v12 = 0;
        while (1)
        {
          uint64_t v13 = *(void *)src_ctx + v11;
          uint64_t v14 = *(const char **)v13;
          uint64_t v15 = *(const char ***)(v13 + 8);
          *(void *)(*(void *)v8 + v11) = *(void *)v13;
          int v16 = prop_setvals(v8, v14, v15);
          if (v16) {
            break;
          }
          ++v12;
          v11 += 24;
          if (v12 >= *((unsigned int *)src_ctx + 4)) {
            goto LABEL_13;
          }
        }
        int v2 = v16;
        for (uint64_t i = (void *)*((void *)v8 + 5); i; uint64_t i = (void *)*((void *)v8 + 5))
        {
          *((void *)v8 + 5) = *i;
          off_1EB527668(i);
        }
        off_1EB527668(v8);
      }
      else
      {
LABEL_13:
        int v2 = 0;
        *((void *)v8 + 1) = *((void *)src_ctx + 1);
        *dst_ctx = v8;
      }
    }
    else
    {
      return -2;
    }
  }
  return v2;
}

int prop_setvals(propctx *ctx, const char *name, const char **values)
{
  if (!ctx) {
    return -7;
  }
  uint64_t v3 = values;
  if (!values) {
    return 0;
  }
  if (name)
  {
    uint64_t v3 = values + 1;
    int result = prop_set(ctx, name, *values, 0);
  }
  else
  {
    int result = 0;
  }
  unsigned int v6 = *v3;
  if (*v3 && !result)
  {
    uint64_t v7 = v3 + 1;
    do
    {
      int result = prop_set(ctx, 0, v6, 0);
      uint64_t v8 = *v7++;
      unsigned int v6 = v8;
      if (v8) {
        BOOL v9 = result == 0;
      }
      else {
        BOOL v9 = 0;
      }
    }
    while (v9);
  }
  return result;
}

int prop_request(propctx *ctx, const char **names)
{
  int result = -7;
  if (ctx && names)
  {
    int v5 = 0;
    while (names[v5++])
      ;
    unsigned int v7 = v5 - 1;
    if (v5 == 1) {
      return 0;
    }
    unsigned int v8 = *((_DWORD *)ctx + 4);
    unsigned int v9 = *((_DWORD *)ctx + 5);
    uint64_t v10 = v8 + v5;
    if (v10 <= v9)
    {
LABEL_16:
      uint64_t v18 = 0;
      if (v7 <= 1) {
        uint64_t v19 = 1;
      }
      else {
        uint64_t v19 = v7;
      }
      do
      {
        if (v8)
        {
          uint64_t v20 = 0;
          uint64_t v21 = *(void *)ctx;
          int v22 = names[v18];
          unsigned int v23 = v8;
          while (strcmp(*(const char **)(v21 + v20), v22))
          {
            v20 += 24;
            if (24 * v8 == v20) {
              goto LABEL_25;
            }
          }
        }
        else
        {
          unsigned int v23 = 0;
          int v22 = names[v18];
          uint64_t v21 = *(void *)ctx;
LABEL_25:
          *((_DWORD *)ctx + 4) = ++v8;
          *(void *)(v21 + 24 * v23) = v22;
        }
        ++v18;
      }
      while (v18 != v19);
      prop_clear(ctx, 0);
      return 0;
    }
    uint64_t v11 = *((void *)ctx + 5);
    unint64_t v12 = *(void *)(v11 + 8);
    if (v10 > (v12 / 0x18))
    {
      do
      {
        BOOL v13 = v10 > 2 * v9;
        v9 *= 2;
      }
      while (v13);
      unint64_t v14 = 24 * v9;
      uint64_t v15 = v12 - v14;
      if (v12 >= v14)
      {
        if (v11)
        {
          uint64_t v17 = v11 + 24;
          *(void *)ctx = v11 + 24;
          *((_DWORD *)ctx + 5) = v9;
          *(void *)(v11 + 16) = v15;
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v16 = off_1EB527660();
        if (v16)
        {
          *((void *)ctx + 5) = v16;
          uint64_t v17 = v16 + 24;
          *(void *)ctx = v16 + 24;
          *((_DWORD *)ctx + 5) = v9;
          *(void *)(v16 + 8) = v14;
          *(void *)(v16 + 16) = 0;
          unsigned int v8 = *((_DWORD *)ctx + 4);
LABEL_15:
          bzero((void *)(v17 + 24 * v8), 24 * (v9 - v8));
          *((void *)ctx + 4) = *(void *)ctx + 24 * v10;
          unsigned int v8 = *((_DWORD *)ctx + 4);
          goto LABEL_16;
        }
        *((void *)ctx + 5) = 0;
      }
      *(void *)ctx = 0;
      int result = -2;
      *((void *)ctx + 2) = 0;
      return result;
    }
    *((_DWORD *)ctx + 5) = v10;
    *(void *)(v11 + 16) = v12 - 24 * v10;
    uint64_t v17 = *(void *)ctx;
    unsigned int v9 = v10;
    goto LABEL_15;
  }
  return result;
}

void prop_clear(propctx *ctx, int requests)
{
  uint64_t v4 = alloc_proppool(*(void *)(*((void *)ctx + 5) + 8) + 24 * (*((_DWORD *)ctx + 4) + 1));
  if (!v4)
  {
    _sasl_log(0, 1u, "failed to allocate memory\n", v5, v6, v7, v8, v9, v19);
    exit(1);
  }
  uint64_t v10 = v4;
  if (requests)
  {
    int v11 = 0;
    *((_DWORD *)ctx + 4) = 0;
  }
  else
  {
    int v11 = *((_DWORD *)ctx + 4);
    if (v11)
    {
      unint64_t v12 = v4 + 3;
      BOOL v13 = *(uint64_t **)ctx;
      uint64_t v14 = *((unsigned int *)ctx + 4);
      do
      {
        uint64_t v15 = *v13;
        v13 += 3;
        *unint64_t v12 = v15;
        v12 += 3;
        --v14;
      }
      while (v14);
    }
  }
  uint64_t v16 = (void *)*((void *)ctx + 5);
  if (v16)
  {
    do
    {
      *((void *)ctx + 5) = *v16;
      off_1EB527668(v16);
      uint64_t v16 = (void *)*((void *)ctx + 5);
    }
    while (v16);
    int v11 = *((_DWORD *)ctx + 4);
  }
  uint64_t v17 = (v11 + 1);
  *((_DWORD *)ctx + 5) = v17;
  uint64_t v18 = v10[1];
  v10[2] = v18 - 24 * v17;
  *(void *)ctx = v10 + 3;
  *((void *)ctx + 1) = 0;
  *((void *)ctx + 5) = v10;
  *((void *)ctx + 6) = v10;
  *((void *)ctx + 3) = (char *)v10 + v18 + 24;
  *((void *)ctx + 4) = &v10[3 * v17 + 3];
}

const propval *__cdecl prop_get(const propval *ctx)
{
  if (ctx) {
    return (const propval *)ctx->name;
  }
  return ctx;
}

int prop_getnames(propctx *ctx, const char **names, propval *vals)
{
  int v3 = -7;
  if (ctx)
  {
    uint64_t v4 = names;
    if (names)
    {
      uint64_t v5 = vals;
      if (vals)
      {
        uint64_t v6 = *names;
        if (*names)
        {
          int v3 = 0;
          do
          {
            uint64_t v8 = *(const char ***)ctx;
            uint64_t v9 = **(const char ***)ctx;
            if (v9)
            {
              while (strcmp(v6, v9))
              {
                uint64_t v10 = v8[3];
                v8 += 3;
                uint64_t v9 = v10;
                if (!v10) {
                  goto LABEL_9;
                }
              }
              ++v3;
              long long v11 = *(_OWORD *)v8;
              *(void *)&v5->nvalues = v8[2];
              *(_OWORD *)&v5->name = v11;
            }
            else
            {
LABEL_9:
              v5->name = 0;
              v5->values = 0;
              *(void *)&v5->nvalues = 0;
            }
            ++v5;
            unint64_t v12 = v4[1];
            ++v4;
            uint64_t v6 = v12;
          }
          while (v12);
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return v3;
}

void *alloc_proppool(uint64_t a1)
{
  size_t v2 = a1 + 31;
  int v3 = (void *)_sasl_allocation_utils(a1 + 31);
  uint64_t v4 = v3;
  if (v3)
  {
    bzero(v3, v2);
    v4[1] = a1;
    v4[2] = a1;
  }
  return v4;
}

void prop_erase(propctx *ctx, const char *name)
{
  if (ctx)
  {
    if (name)
    {
      int v3 = **(const char ***)ctx;
      if (v3)
      {
        uint64_t v4 = (const char **)(*(void *)ctx + 24);
        while (strcmp(name, v3))
        {
          uint64_t v5 = *v4;
          v4 += 3;
          int v3 = v5;
          if (!v5) {
            return;
          }
        }
        uint64_t v8 = (char **)*(v4 - 2);
        uint64_t v7 = v4 - 2;
        uint64_t v6 = v8;
        if (v8)
        {
          uint64_t v9 = *v6;
          if (*v6)
          {
            uint64_t v10 = 0;
            do
            {
              size_t v11 = strlen(v9);
              bzero(v9, v11);
              *(void *)&(*v7)[v10] = 0;
              uint64_t v9 = *(char **)&(*v7)[v10 + 8];
              v10 += 8;
            }
            while (v9);
          }
          *uint64_t v7 = 0;
          v7[1] = 0;
        }
      }
    }
  }
}

int prop_format(propctx *ctx, const char *sep, int seplen, char *outbuf, unsigned int outmax, unsigned int *outlen)
{
  int result = -7;
  if (ctx && outbuf)
  {
    if (sep) {
      unsigned int v12 = seplen;
    }
    else {
      unsigned int v12 = 0;
    }
    if ((v12 & 0x80000000) != 0 && (unsigned int v12 = strlen(sep), (v12 & 0x80000000) != 0))
    {
      return -7;
    }
    else
    {
      unsigned int v13 = (*((_DWORD *)ctx + 4) - 1) * v12;
      uint64_t v14 = **(const char ***)ctx;
      if (v14)
      {
        uint64_t v15 = (const char **)(*(void *)ctx + 24);
        do
        {
          v13 += strlen(v14);
          uint64_t v16 = *v15;
          v15 += 3;
          uint64_t v14 = v16;
        }
        while (v16);
      }
      if (outmax)
      {
        int result = v13 - (outmax - 1);
        if (v13 <= outmax - 1)
        {
          *outbuf = 0;
          if (outlen) {
            *outlen = v13;
          }
          if (v13)
          {
            uint64_t v17 = *(const char ***)ctx;
            uint64_t v18 = *v17;
            if (*v17)
            {
              char v19 = 0;
              do
              {
                if (v12)
                {
                  if (v19)
                  {
                    strncat(outbuf, sep, v12);
                    uint64_t v18 = *v17;
                  }
                }
                strcat(outbuf, v18);
                uint64_t v20 = v17[3];
                v17 += 3;
                uint64_t v18 = v20;
                char v19 = 1;
              }
              while (v20);
            }
          }
          return 0;
        }
      }
      else
      {
        return v13 + 1;
      }
    }
  }
  return result;
}

int prop_set(propctx *ctx, const char *name, const char *value, int vallen)
{
  if (!ctx) {
    return -7;
  }
  uint64_t v6 = name;
  if (!name)
  {
    uint64_t v8 = (const char **)*((void *)ctx + 1);
    if (v8) {
      BOOL v12 = value == 0;
    }
    else {
      BOOL v12 = 1;
    }
    char v13 = v12;
    while (1)
    {
      if (v13)
      {
        if (v8) {
          return 0;
        }
        else {
          return -7;
        }
      }
      uint64_t v14 = *((void *)ctx + 6);
      unint64_t v15 = *(void *)(v14 + 16);
      if (v15 > 7) {
        break;
      }
      unint64_t v16 = (unint64_t)v8[1];
      if (v16 <= v14 + 24 || v16 >= v14 + 24 + *(void *)(v14 + 8)) {
        break;
      }
      uint64_t v6 = *v8;
      if (*v8) {
        goto LABEL_3;
      }
    }
    *(void *)(v14 + 16) = v15 - 8;
    uint64_t v17 = (void *)*((void *)ctx + 4);
    *((void *)ctx + 4) = v17 + 1;
    *uint64_t v17 = 0;
    uint64_t v18 = *((void *)ctx + 4);
    if (vallen <= 0) {
      size_t v19 = strlen(value) + 1;
    }
    else {
      size_t v19 = (vallen + 1);
    }
    size_t v29 = (void *)*((void *)ctx + 6);
    size_t v30 = v29[2];
    if (v19 <= v30)
    {
      long long v32 = (char *)*((void *)ctx + 3);
      goto LABEL_44;
    }
    unint64_t v31 = v29[1];
    do
      v31 *= 2;
    while (v31 < v19);
    size_t v29 = alloc_proppool(v31);
    **((void **)ctx + 6) = v29;
    if (v29)
    {
      *((void *)ctx + 6) = v29;
      *((void *)ctx + 4) = v29 + 3;
      long long v32 = (char *)v29 + v31 + 24;
      size_t v30 = v29[2];
LABEL_44:
      size_t v33 = &v32[-v19];
      *((void *)ctx + 3) = v33;
      v29[2] = v30 - v19;
      memcpy(v33, value, v19 - 1);
      *(unsigned char *)(*((void *)ctx + 3) + v19 - 1) = 0;
      *(void *)(v18 - 16) = *((void *)ctx + 3);
      goto LABEL_66;
    }
    return -2;
  }
LABEL_3:
  *((void *)ctx + 1) = 0;
  uint64_t v8 = *(const char ***)ctx;
  uint64_t v9 = **(const char ***)ctx;
  if (!v9) {
    return -7;
  }
  while (strcmp(v6, v9))
  {
    uint64_t v10 = v8[3];
    v8 += 3;
    uint64_t v9 = v10;
    if (!v10) {
      return -7;
    }
  }
  *((void *)ctx + 1) = v8;
  uint64_t v20 = v8[1];
  if (!v20) {
    goto LABEL_28;
  }
  if (!value) {
    return 0;
  }
  if (*(void *)v20)
  {
    uint64_t v21 = 1;
    while (*(void *)&v20[8 * v21++])
      ;
  }
  else
  {
LABEL_28:
    LODWORD(v21) = 1;
  }
  if (value) {
    uint64_t v23 = (v21 + 1);
  }
  else {
    uint64_t v23 = v21;
  }
  unint64_t v24 = 8 * v23;
  unsigned int v25 = (void *)*((void *)ctx + 6);
  unint64_t v26 = v25[2];
  if (v24 <= v26)
  {
    BOOL v28 = (const char *)*((void *)ctx + 4);
  }
  else
  {
    unint64_t v27 = v25[1];
    do
      v27 *= 2;
    while (v27 < v24);
    unsigned int v25 = alloc_proppool(v27);
    **((void **)ctx + 6) = v25;
    if (!v25) {
      return -2;
    }
    *((void *)ctx + 6) = v25;
    BOOL v28 = (const char *)(v25 + 3);
    *((void *)ctx + 3) = (char *)v25 + v27 + 24;
    unint64_t v26 = v25[2];
  }
  _OWORD v25[2] = v26 - v24;
  v8[1] = v28;
  *(void *)&v28[8 * (v23 - 1)] = 0;
  long long v34 = (char *)v8[1];
  *((void *)ctx + 4) = &v34[8 * v23];
  if (!value) {
    return 0;
  }
  if (v20)
  {
    uint64_t v35 = *(void *)v20;
    if (*(void *)v20)
    {
      int v36 = (uint64_t *)(v20 + 8);
      do
      {
        *(void *)long long v34 = v35;
        v34 += 8;
        uint64_t v37 = *v36++;
        uint64_t v35 = v37;
      }
      while (v37);
    }
  }
  if (vallen <= 0) {
    size_t v19 = strlen(value) + 1;
  }
  else {
    size_t v19 = (vallen + 1);
  }
  uint64_t v38 = (void *)*((void *)ctx + 6);
  size_t v39 = v38[2];
  if (v19 > v39)
  {
    unint64_t v40 = v38[1];
    do
      v40 *= 2;
    while (v40 < v19);
    uint64_t v38 = alloc_proppool(v40);
    **((void **)ctx + 6) = v38;
    if (v38)
    {
      *((void *)ctx + 6) = v38;
      *((void *)ctx + 4) = v38 + 3;
      int v41 = (char *)v38 + v40 + 24;
      size_t v39 = v38[2];
      goto LABEL_65;
    }
    return -2;
  }
  int v41 = (char *)*((void *)ctx + 3);
LABEL_65:
  uint64_t v42 = &v41[-v19];
  *((void *)ctx + 3) = v42;
  v38[2] = v39 - v19;
  memcpy(v42, value, v19 - 1);
  *(unsigned char *)(*((void *)ctx + 3) + v19 - 1) = 0;
  *(void *)&v8[1][8 * (v23 - 2)] = *((void *)ctx + 3);
LABEL_66:
  int result = 0;
  int v43 = v19 + *((_DWORD *)v8 + 5) - 1;
  ++*((_DWORD *)v8 + 4);
  *((_DWORD *)v8 + 5) = v43;
  return result;
}

int sasl_auxprop_add_plugin(const char *plugname, sasl_auxprop_init_t *auxpropfunc)
{
  int v2 = sasl_auxprop_add_plugin_nolog(plugname, auxpropfunc);
  int v3 = v2;
  if (v2)
  {
    uint64_t v4 = sasl_errstring(v2, 0, 0);
    _sasl_log(0, 1u, "auxpropfunc error %s\n", v5, v6, v7, v8, v9, (uint64_t)v4);
  }
  return v3;
}

int sasl_auxprop_add_plugin_nolog(const char *plugname, sasl_auxprop_init_t *auxpropfunc)
{
  int v15 = -1431655766;
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  int v2 = ((uint64_t (*)(uint64_t, uint64_t, int *, unint64_t *, const char *))auxpropfunc)(sasl_global_utils, 8, &v15, &v14, plugname);
  if (v15 < 4 && v2 == 0) {
    int v4 = -23;
  }
  else {
    int v4 = v2;
  }
  if (v4)
  {
    uint64_t v5 = sasl_errstring(v4, 0, 0);
    _sasl_log(0, 1u, "auxpropfunc error %s\n", v6, v7, v8, v9, v10, (uint64_t)v5);
  }
  else if (*(void *)(v14 + 24))
  {
    uint64_t v12 = _sasl_allocation_utils(24);
    if (v12)
    {
      int v4 = 0;
      unint64_t v13 = v14;
      *(void *)uint64_t v12 = auxprop_head;
      *(void *)(v12 + 8) = v13;
      *(_DWORD *)(v12 + 16) = v15;
      auxprop_head = v12;
    }
    else
    {
      return -2;
    }
  }
  else
  {
    return -5;
  }
  return v4;
}

uint64_t _sasl_auxprop_lookup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v42 = (uint64_t (*)())0xAAAAAAAAAAAAAAAALL;
  unint64_t v40 = 0;
  if (_sasl_getcallback(*(sasl_conn_t **)(*(void *)(a1 + 80) + 8), 1, &v42, &v41)) {
    goto LABEL_4;
  }
  if (((unsigned int (*)(unint64_t, void, const char *, const char **, void))v42)(v41, 0, "auxprop_plugin", &v40, 0))
  {
    unint64_t v40 = 0;
LABEL_4:
    uint64_t v13 = auxprop_head;
    if (!auxprop_head)
    {
      uint64_t v14 = 4294967292;
      goto LABEL_12;
    }
    uint64_t v14 = 4294967292;
    do
    {
      uint64_t v15 = *(void *)(v13 + 8);
      unint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 24);
      uint64_t v17 = *(void *)(v15 + 8);
      if (*(_DWORD *)(v13 + 16) == 4)
      {
        v16(v17, a1, a2, a3, a4);
        uint64_t v18 = 0;
      }
      else
      {
        uint64_t v18 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16)(v17, a1, a2, a3, a4);
      }
      uint64_t v14 = _sasl_account_status(v14, v18);
      uint64_t v13 = *(void *)v13;
    }
    while (v13);
    return v14;
  }
  if (!v40) {
    goto LABEL_4;
  }
  size_t v39 = 0;
  if (_sasl_strdup(v40, &v39, 0)) {
    return 4294967294;
  }
  int v21 = 0;
  uint64_t v14 = 4294967292;
  int v22 = v39;
  uint64_t v23 = MEMORY[0x1E4F14390];
  unint64_t v24 = v39;
  do
  {
    char v25 = *v24;
    if (!*v24) {
      break;
    }
    while ((v25 & 0x80) == 0)
    {
      if ((*(_DWORD *)(v23 + 4 * v25 + 60) & 0x4000) == 0) {
        goto LABEL_27;
      }
LABEL_25:
      int v26 = *++v24;
      char v25 = v26;
      if (!v26) {
        goto LABEL_47;
      }
    }
    if (__maskrune(v25, 0x4000uLL)) {
      goto LABEL_25;
    }
LABEL_27:
    char v27 = *v24;
    if (!*v24) {
      break;
    }
    int v38 = v21;
    BOOL v28 = v24;
    uint64_t v37 = v22;
    while (2)
    {
      if ((v27 & 0x80) == 0)
      {
        if ((*(_DWORD *)(v23 + 4 * v27 + 60) & 0x4000) != 0) {
          break;
        }
        goto LABEL_33;
      }
      if (!__maskrune(v27, 0x4000uLL))
      {
LABEL_33:
        int v29 = *++v28;
        char v27 = v29;
        if (!v29) {
          goto LABEL_37;
        }
        continue;
      }
      break;
    }
    if (*v28)
    {
      int v36 = 0;
      *BOOL v28 = 0;
      goto LABEL_38;
    }
LABEL_37:
    int v36 = 1;
LABEL_38:
    for (uint64_t i = auxprop_head; i; uint64_t i = *(void *)i)
    {
      unint64_t v31 = *(void **)(i + 8);
      long long v32 = (const char *)v31[4];
      if (v32 && !strcasecmp(v32, v24))
      {
        size_t v33 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v31[3];
        uint64_t v34 = v31[1];
        if (*(_DWORD *)(i + 16) == 4)
        {
          v33(v34, a1, a2, a3, a4);
          uint64_t v35 = 0;
        }
        else
        {
          uint64_t v35 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v33)(v34, a1, a2, a3, a4);
        }
        uint64_t v14 = _sasl_account_status(v14, v35);
        int v38 = 1;
      }
    }
    unint64_t v24 = v28 + 1;
    int v22 = v37;
    int v21 = v38;
  }
  while (!v36);
LABEL_47:
  off_1EB527668(v22);
  if (!v21)
  {
LABEL_12:
    size_t v19 = v40;
    if (!v40) {
      size_t v19 = "[all]";
    }
    _sasl_log(*(void *)(*(void *)(a1 + 80) + 8), 5u, "could not find auxprop plugin, was searching for '%s'", v8, v9, v10, v11, v12, (uint64_t)v19);
  }
  return v14;
}

uint64_t _sasl_account_status(uint64_t a1, uint64_t a2)
{
  switch((int)a2)
  {
    case -26:
      goto LABEL_5;
    case -25:
    case -23:
    case -22:
    case -21:
      return a2;
    case -24:
      a2 = 4294967272;
      break;
    case -20:
      if (a1 == -4) {
        a2 = 4294967276;
      }
      else {
        a2 = a1;
      }
      break;
    case -19:
      if (((1 << (a1 + 20)) & 0x110001) != 0) {
        unsigned int v2 = -19;
      }
      else {
        unsigned int v2 = a1;
      }
      if ((a1 + 20) <= 0x14) {
        a2 = v2;
      }
      else {
        a2 = a1;
      }
      break;
    default:
      if (a2 == -4)
      {
        a2 = a1;
      }
      else if (!a2)
      {
LABEL_5:
        if ((a1 & 0xFFFFFFEF) == 0xFFFFFFEC) {
          a2 = 0;
        }
        else {
          a2 = a1;
        }
      }
      break;
  }
  return a2;
}

int sasl_auxprop_store(sasl_conn_t *conn, propctx *ctx, const char *user)
{
  size_t v39 = 0;
  if (ctx)
  {
    int result = -7;
    if (!conn || !user) {
      return result;
    }
    uint64_t v7 = *((void *)conn + 572);
    size_t v8 = strlen(user);
  }
  else
  {
    uint64_t v7 = 0;
    size_t v8 = 0;
  }
  unint64_t v40 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v41 = (uint64_t (*)())0xAAAAAAAAAAAAAAAALL;
  if (!_sasl_getcallback(conn, 1, &v41, &v40)
    && ((unsigned int (*)(unint64_t, void, const char *, const char **, void))v41)(v40, 0, "auxprop_plugin", &v39, 0))
  {
    size_t v39 = 0;
    goto LABEL_50;
  }
  if (!v39)
  {
LABEL_50:
    unint64_t v31 = (void *)auxprop_head;
    if (!auxprop_head) {
      goto LABEL_65;
    }
    int v16 = 0;
    int v15 = 0;
    do
    {
      uint64_t v32 = v31[1];
      size_t v33 = *(uint64_t (**)(void, uint64_t, propctx *, const char *, size_t))(v32 + 40);
      if (v33)
      {
        int v34 = v33(*(void *)(v32 + 8), v7, ctx, user, v8);
        if (v34 == -30) {
          int v14 = 0;
        }
        else {
          int v14 = v34;
        }
        if (v34 == -30) {
          ++v15;
        }
      }
      else
      {
        int v14 = 0;
      }
      ++v16;
      if (v14) {
        break;
      }
      unint64_t v31 = (void *)*v31;
    }
    while (v31);
    goto LABEL_62;
  }
  int v38 = 0;
  if (_sasl_strdup(v39, &v38, 0)) {
    return -1;
  }
  int v14 = 0;
  int v15 = 0;
  int v16 = 0;
  uint64_t v17 = v38;
  uint64_t v18 = MEMORY[0x1E4F14390];
  size_t v19 = v38;
  do
  {
    char v20 = *v19;
    if (!*v19) {
      break;
    }
    while ((v20 & 0x80) == 0)
    {
      if ((*(_DWORD *)(v18 + 4 * v20 + 60) & 0x4000) == 0) {
        goto LABEL_17;
      }
LABEL_15:
      int v21 = *++v19;
      char v20 = v21;
      if (!v21) {
        goto LABEL_46;
      }
    }
    if (__maskrune(v20, 0x4000uLL)) {
      goto LABEL_15;
    }
LABEL_17:
    char v22 = *v19;
    if (!*v19) {
      break;
    }
    uint64_t v37 = v17;
    uint64_t v23 = v19;
    while (2)
    {
      if ((v22 & 0x80) == 0)
      {
        if ((*(_DWORD *)(v18 + 4 * v22 + 60) & 0x4000) != 0) {
          break;
        }
        goto LABEL_23;
      }
      if (!__maskrune(v22, 0x4000uLL))
      {
LABEL_23:
        int v24 = *++v23;
        char v22 = v24;
        if (!v24) {
          goto LABEL_27;
        }
        continue;
      }
      break;
    }
    if (*v23)
    {
      int v36 = 0;
      *uint64_t v23 = 0;
      goto LABEL_28;
    }
LABEL_27:
    int v36 = 1;
LABEL_28:
    char v25 = (void *)auxprop_head;
    if (auxprop_head && !v14)
    {
      do
      {
        BOOL v28 = (void *)v25[1];
        int v29 = (const char *)v28[4];
        if (v29
          && !strcasecmp(v29, v19)
          && (++v16, (int v26 = (uint64_t (*)(void, uint64_t, propctx *, const char *, size_t))v28[5]) != 0))
        {
          int v27 = v26(v28[1], v7, ctx, user, v8);
          if (v27 == -30) {
            int v14 = 0;
          }
          else {
            int v14 = v27;
          }
          if (v27 == -30) {
            ++v15;
          }
        }
        else
        {
          int v14 = 0;
        }
        char v25 = (void *)*v25;
        if (v25) {
          BOOL v30 = v14 == 0;
        }
        else {
          BOOL v30 = 0;
        }
      }
      while (v30);
    }
    size_t v19 = v23 + 1;
    uint64_t v17 = v37;
    uint64_t v18 = MEMORY[0x1E4F14390];
  }
  while (!v36);
LABEL_46:
  off_1EB527668(v17);
  if (v16)
  {
LABEL_62:
    if (v16 == v15) {
      return -30;
    }
    else {
      return v14;
    }
  }
LABEL_65:
  uint64_t v35 = v39;
  if (!v39) {
    uint64_t v35 = "[all]";
  }
  _sasl_log(0, 1u, "could not find auxprop plugin, was searching for %s", v9, v10, v11, v12, v13, (uint64_t)v35);
  return -1;
}

uint64_t _sasl_canon_user(sasl_conn_t *conn, char *__s, size_t a3, uint64_t a4, uint64_t a5)
{
  __s1 = 0;
  if (!conn) {
    return 4294967289;
  }
  uint64_t v5 = __s;
  uint64_t result = 4294967289;
  if (!__s || !a5) {
    return result;
  }
  size_t v10 = a3;
  if (a4)
  {
    uint64_t v11 = (char *)conn + 3489;
    uint64_t v12 = (unsigned int *)(a5 + 28);
  }
  else
  {
    if ((a4 & 2) == 0) {
      return result;
    }
    uint64_t v11 = (char *)conn + 2464;
    uint64_t v12 = (unsigned int *)(a5 + 24);
  }
  if (*(_DWORD *)conn == 1)
  {
    int v14 = 0;
    uint64_t v13 = conn;
    if (a3) {
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)conn != 2) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v13 = 0;
    int v14 = conn;
    if (a3) {
      goto LABEL_16;
    }
  }
  size_t v10 = strlen(__s);
LABEL_16:
  memset(v25, 170, sizeof(v25));
  if (_sasl_getcallback(conn, 32775, &v25[2], v25) || !v25[2])
  {
    char v22 = v14;
  }
  else
  {
    if (v13) {
      uint64_t v15 = *((void *)v13 + 569);
    }
    else {
      uint64_t v15 = 0;
    }
    uint64_t result = ((uint64_t (*)(sasl_conn_t *, uint64_t (*)(), char *, size_t, uint64_t, uint64_t, char *, uint64_t, unsigned int *))v25[2])(conn, v25[0], v5, v10, a4, v15, v11, 1024, v12);
    if (result) {
      return result;
    }
    char v22 = v14;
    size_t v10 = *v12;
    uint64_t v5 = v11;
  }
  uint64_t v23 = v11;
  if (_sasl_getcallback(conn, 1, &v25[1], v25)
    || !v25[1]
    || (((void (*)(uint64_t (*)(), void, const char *, char **, void))v25[1])(v25[0], 0, "canon_user_plugin", &__s1, 0), (int v16 = __s1) == 0))
  {
    int v16 = "INTERNAL";
    __s1 = "INTERNAL";
  }
  uint64_t v17 = &canonuser_head;
  do
  {
    uint64_t v17 = (uint64_t *)*v17;
    if (!v17)
    {
      sasl_seterror(conn, 0, "desired canon_user plugin %s not found", v16);
      return 4294967292;
    }
    uint64_t v18 = v17[129];
    size_t v19 = *(const char **)(v18 + 16);
  }
  while ((!v19 || strcmp(v16, v19)) && strcmp(v16, (const char *)v17 + 8));
  char v20 = (void *)((char *)v22 + 4552);
  if (v13) {
    char v20 = (void *)((char *)v13 + 4576);
  }
  uint64_t v21 = 32;
  if (!v13) {
    uint64_t v21 = 40;
  }
  uint64_t result = (*(uint64_t (**)(void, void, char *, size_t, uint64_t, char *, uint64_t, unsigned int *))(v18 + v21))(*(void *)(v18 + 8), *v20, v5, v10, a4, v23, 1024, v12);
  if (!result)
  {
    if ((~a4 & 3) != 0)
    {
      if ((a4 & 1) == 0) {
        goto LABEL_44;
      }
    }
    else
    {
      memcpy((char *)conn + 2464, (char *)conn + 3489, 0x400uLL);
      *(_DWORD *)(a5 + 24) = *(_DWORD *)(a5 + 28);
    }
    *(void *)(a5 + 16) = (char *)conn + 3489;
LABEL_44:
    uint64_t result = 0;
    if ((a4 & 2) != 0) {
      *(void *)(a5 + 8) = (char *)conn + 2464;
    }
  }
  return result;
}

uint64_t _sasl_canon_user_lookup(uint64_t a1, char *a2, size_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6 = a4;
  uint64_t result = _sasl_canon_user((sasl_conn_t *)a1, a2, a3, a4, a5);
  if (result || (uint64_t result = 4294967289, !a1) || !a5)
  {
LABEL_2:
    if (a1)
    {
      if ((result & 0x80000000) != 0) {
        *(_DWORD *)(a1 + 2400) = result;
      }
    }
    return result;
  }
  if (*(_DWORD *)a1 != 1) {
    return 0;
  }
  if (v6)
  {
    unsigned int v9 = _sasl_auxprop_lookup(*(void *)(a1 + 4576), v6 & 0xFFF0 | (v6 >> 3) & 1, *(void *)(a5 + 16), *(unsigned int *)(a5 + 28));
    if ((v6 & 2) == 0) {
      goto LABEL_23;
    }
  }
  else
  {
    unsigned int v9 = 1;
    if ((v6 & 2) == 0) {
      goto LABEL_23;
    }
  }
  unsigned int v10 = _sasl_auxprop_lookup(*(void *)(a1 + 4576), v6 & 0xFFF0 | (v6 >> 3) & 1 | 2, *(void *)(a5 + 8), *(unsigned int *)(a5 + 24));
  if (v10 != -20 && v9 == 0) {
    unsigned int v12 = v10;
  }
  else {
    unsigned int v12 = v9;
  }
  if (v9 == 1) {
    unsigned int v9 = v10;
  }
  else {
    unsigned int v9 = v12;
  }
LABEL_23:
  if ((v9 & 0xFFFFFFEF) == 0xFFFFFFEC) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = v9;
  }
  if ((v6 & 4) != 0) {
    uint64_t result = v13;
  }
  else {
    uint64_t result = v9;
  }
  if ((result & 0x80000000) != 0)
  {
    *(_DWORD *)(a1 + 2400) = result;
    goto LABEL_2;
  }
  return result;
}

int sasl_canonuser_add_plugin(const char *plugname, sasl_canonuser_init_t *canonuserfunc)
{
  if (plugname && strlen(plugname) < 0x400)
  {
    int v16 = -1431655766;
    unint64_t v15 = 0xAAAAAAAAAAAAAAAALL;
    int v5 = ((uint64_t (*)(uint64_t, uint64_t, int *, unint64_t *, const char *))canonuserfunc)(sasl_global_utils, 5, &v16, &v15, plugname);
    if (v5)
    {
      int v4 = v5;
      _sasl_log(0, 1u, "%s_canonuser_plug_init() failed in sasl_canonuser_add_plugin(): %z\n", v6, v7, v8, v9, v10, (uint64_t)plugname);
    }
    else if (*(void *)(v15 + 32) || *(void *)(v15 + 40))
    {
      uint64_t v11 = _sasl_allocation_utils(1040);
      if (v11)
      {
        unsigned int v12 = (void *)v11;
        uint64_t v13 = v11 + 8;
        strncpy((char *)(v11 + 8), plugname, 0x3FFuLL);
        int v4 = 0;
        *(unsigned char *)(v13 + strlen(plugname)) = 0;
        v12[129] = v15;
        *unsigned int v12 = canonuser_head;
        canonuser_head = (uint64_t)v12;
      }
      else
      {
        return -2;
      }
    }
    else
    {
      _sasl_log(0, 1u, "canonuser plugin '%s' without either client or server side", v6, v7, v8, v9, v10, (uint64_t)plugname);
      return -5;
    }
  }
  else
  {
    sasl_seterror(0, 0, "bad plugname passed to sasl_canonuser_add_plugin\n");
    return -7;
  }
  return v4;
}

uint64_t internal_canonuser_init(uint64_t a1, int a2, _DWORD *a3, void *a4)
{
  uint64_t result = 4294967289;
  if (a3 && a4)
  {
    if (a2 >= 5)
    {
      uint64_t result = 0;
      *a3 = 5;
      *a4 = &canonuser_internal_plugin;
    }
    else
    {
      return 4294967273;
    }
  }
  return result;
}

uint64_t _cu_internal_server(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, uint64_t a5, char *a6, unsigned int a7, unsigned int *a8)
{
  return _canonuser_internal(*(void *)(a2 + 80), a3, a4, a6, a7, a8);
}

uint64_t _cu_internal_client(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, uint64_t a5, char *a6, unsigned int a7, unsigned int *a8)
{
  return _canonuser_internal(*(void *)(a2 + 24), a3, a4, a6, a7, a8);
}

uint64_t _canonuser_internal(uint64_t a1, char *a2, unsigned int a3, char *a4, unsigned int a5, unsigned int *a6)
{
  uint64_t result = 4294967289;
  if (!a1 || !a2) {
    return result;
  }
  unsigned int v13 = a3 + 2;
  int v14 = (unsigned char *)_sasl_allocation_utils(a3 + 2);
  if (!v14) {
    return 4294967294;
  }
  unint64_t v15 = v14;
  __dst = a4;
  uint64_t v48 = a1;
  __s = a2;
  uint64_t v45 = a6;
  uint64_t v16 = a3;
  memcpy(v14, a2, a3);
  unint64_t v17 = 0;
  v15[a3] = 0;
  unsigned int v18 = a3 + 1;
  int v19 = ~a3 + a5 - 1;
  uint64_t v20 = MEMORY[0x1E4F14390];
  do
  {
    unsigned int v21 = (char)v15[v17];
    if ((v21 & 0x80000000) != 0) {
      int v22 = __maskrune(v21, 0x4000uLL);
    }
    else {
      int v22 = *(_DWORD *)(v20 + 4 * v21 + 60) & 0x4000;
    }
    unint64_t v23 = v17 + 1;
    --v18;
    v13 -= 2;
    ++v19;
    if (v17 >= a3) {
      break;
    }
    ++v17;
  }
  while (v22);
  unsigned int v49 = a5;
  int v24 = 0;
  uint64_t v25 = 0;
  unsigned int v46 = a3 + 1;
  uint64_t v26 = a3 + 1 - v23;
  uint64_t v27 = (uint64_t)&v15[v18 - 2];
  do
  {
    uint64_t v28 = v25;
    unsigned int v29 = v13;
    int v30 = v24;
    if (!(v26 + v25)) {
      break;
    }
    unsigned int v31 = *(char *)(v27 + v23 + v25);
    int v32 = (v31 & 0x80000000) != 0
        ? __maskrune(v31, 0x4000uLL)
        : *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v31 + 60) & 0x4000;
    uint64_t v25 = v28 - 1;
    --v16;
    --v13;
    int v24 = v30 - 1;
  }
  while (v32);
  if (!v29)
  {
    off_1EB527668(v15);
    (*(void (**)(void, void, const char *))(v48 + 264))(*(void *)(v48 + 8), 0, "All-whitespace username.");
    return 0xFFFFFFFFLL;
  }
  uint64_t v33 = *(void *)(v48 + 8);
  if (!v33)
  {
    int v38 = 0;
LABEL_26:
    int v37 = 0;
    uint64_t v35 = __dst;
    unsigned int v36 = v46;
    goto LABEL_29;
  }
  if (*(_DWORD *)v33 != 1)
  {
    int v38 = 0;
    uint64_t v33 = 0;
    goto LABEL_26;
  }
  int v34 = *(const char **)(v33 + 4552);
  uint64_t v35 = __dst;
  unsigned int v36 = v46;
  if (v34 && !strchr(__s, 64)) {
    int v37 = strlen(v34) + 1;
  }
  else {
    int v37 = 0;
  }
  int v38 = 1;
LABEL_29:
  unsigned int v39 = v36 - v23 + v28;
  if (v39 >= v49) {
    size_t v40 = v49;
  }
  else {
    size_t v40 = v39;
  }
  memcpy(v35, &v15[v23 - 1], v40);
  if (v38 && v37)
  {
    if (v36 - v23 + v28 >= v49) {
      return 4294967293;
    }
    v35[v36 - v23 + v28] = 64;
    if (v37 - 1 >= (v19 - v28)) {
      size_t v41 = (v19 - v28);
    }
    else {
      size_t v41 = (v37 - 1);
    }
    memcpy(&v35[v36 - v23 + 1 + v28], *(const void **)(v33 + 4552), v41);
  }
  unsigned int v42 = v36 + v37 + v30 - v23;
  BOOL v43 = v42 > v49;
  if (v42 >= v49) {
    unsigned int v42 = v49;
  }
  v35[v42] = 0;
  if (v43) {
    return 4294967293;
  }
  if (v45) {
    *uint64_t v45 = v42;
  }
  off_1EB527668(v15);
  return 0;
}

uint64_t _sasl_auxprop_verify_apop(sasl_conn_t *conn, uint64_t a2, const char *a3, const char *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  memset(v22, 170, sizeof(v22));
  *(_OWORD *)names = xmmword_1E63F0238;
  if (conn && a2 && a3 && a4)
  {
    char v21 = -86;
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)int v19 = v7;
    long long v20 = v7;
    vals[0] = v7;
    vals[1] = v7;
    vals[2] = v7;
    *(_OWORD *)v16.state = v7;
    *(_OWORD *)v16.count = v7;
    *(_OWORD *)&v16.UniChar buffer[8] = v7;
    *(_OWORD *)&v16.buffer[24] = v7;
    *(_OWORD *)&v16.buffer[40] = v7;
    *(void *)&v16.buffer[56] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v8 = prop_getnames(*(propctx **)(*((void *)conn + 572) + 152), (const char **)names, (propval *)vals);
    if ((v8 & 0x80000000) != 0)
    {
      uint64_t v14 = v8;
      sasl_seterror(conn, 0, "could not perform password lookup");
      if (v14 != -13) {
        return v14;
      }
    }
    else
    {
      if (!*(void *)&vals[0] || !*((void *)&vals[0] + 1) || !**((void **)&vals[0] + 1))
      {
        sasl_seterror(conn, 0, "could not find password");
        return 4294967276;
      }
      _sasl_MD5Init(&v16);
      unsigned int v9 = strlen(a3);
      _sasl_MD5Update(&v16, (const unsigned __int8 *)a3, v9);
      unsigned int v10 = strlen(**((const char ***)&vals[0] + 1));
      _sasl_MD5Update(&v16, **((const unsigned __int8 ***)&vals[0] + 1), v10);
      uint64_t v11 = v22;
      _sasl_MD5Final(v22, &v16);
      (*(void (**)(void, char *))(*(void *)(*((void *)conn + 572) + 80) + 360))(*(void *)(*((void *)conn + 572) + 152), names[0]);
      for (uint64_t i = 0; i != 32; i += 2)
      {
        int v13 = *v11++;
        sprintf(&v19[i], "%02x", v13);
      }
      if (!strncasecmp(v19, a4, 0x20uLL)) {
        return 0;
      }
    }
    sasl_seterror(conn, 1u, "login incorrect");
    return 4294967283;
  }
  uint64_t v14 = 4294967289;
  if (conn)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/checkpw.c near line %d", 351);
    *((_DWORD *)conn + 600) = -7;
  }
  return v14;
}

int sasl_client_add_plugin(const char *plugname, sasl_client_plug_init_t *cplugfunc)
{
  int v2 = -7;
  if (plugname && cplugfunc)
  {
    int v21 = -1431655766;
    long long v20 = (_DWORD *)0xAAAAAAAAAAAAAAAALL;
    int v19 = -1431655766;
    int v4 = ((uint64_t (*)(void, uint64_t, int *, _DWORD **, int *))cplugfunc)(*(void *)cmechlist, 4, &v19, &v20, &v21);
    if (v4)
    {
      int v2 = v4;
      _sasl_log(0, 3u, "sasl_client_add_plugin(): entry_point(): failed for plugname %s: %z", v5, v6, v7, v8, v9, (uint64_t)plugname);
    }
    else if (v19 == 4)
    {
      if (v21 < 1)
      {
        return 0;
      }
      else
      {
        int v10 = 0;
        while (1)
        {
          uint64_t v11 = _sasl_allocation_utils(32);
          if (!v11) {
            break;
          }
          uint64_t v12 = v11;
          *(void *)(v11 + 16) = v20;
          if (_sasl_strdup(plugname, (char **)(v11 + 8), 0))
          {
            off_1EB527668(v12);
            return -2;
          }
          *(_DWORD *)uint64_t v12 = v19;
          uint64_t v13 = cmechlist;
          unint64_t v15 = (uint64_t *)(cmechlist + 16);
          uint64_t v14 = *(void *)(cmechlist + 16);
          MD5_CTX v16 = v20;
          if (v14 && (mech_compare(v20, *(_DWORD **)(v14 + 16)) & 0x80000000) != 0)
          {
            do
            {
              uint64_t v17 = v14;
              uint64_t v14 = *(void *)(v14 + 24);
            }
            while (v14 && (int)mech_compare(v16, *(_DWORD **)(v14 + 16)) < 1);
            unint64_t v15 = (uint64_t *)(v17 + 24);
          }
          int v2 = 0;
          *(void *)(v12 + 24) = v14;
          *unint64_t v15 = v12;
          ++*(_DWORD *)(v13 + 24);
          ++v10;
          long long v20 = v16 + 24;
          if (v10 >= v21) {
            return v2;
          }
        }
        return -2;
      }
    }
    else
    {
      _sasl_log(0, 3u, "version conflict in sasl_client_add_plugin for %s", v5, v6, v7, v8, v9, (uint64_t)plugname);
      return -23;
    }
  }
  return v2;
}

uint64_t mech_compare(_DWORD *a1, _DWORD *a2)
{
  int v2 = a1[3];
  int v3 = a2[3];
  __int16 v4 = v3 ^ v2;
  __int16 v5 = (v3 ^ v2) & v2;
  if ((v5 & 0x10) != 0) {
    return 1;
  }
  __int16 v6 = v4 & v3;
  if ((v6 & 0x10) != 0) {
    return 0xFFFFFFFFLL;
  }
  if (v5) {
    return 1;
  }
  if (v6) {
    return 0xFFFFFFFFLL;
  }
  if ((v5 & 0x40) != 0) {
    return 1;
  }
  if ((v6 & 0x40) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((v5 & 2) != 0) {
    return 1;
  }
  if ((v6 & 2) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((v5 & 4) != 0) {
    return 1;
  }
  if ((v6 & 4) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((v5 & 8) != 0) {
    return 1;
  }
  if ((v6 & 8) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((v5 & 0x200) != 0) {
    return 1;
  }
  if ((v6 & 0x200) != 0) {
    return 0xFFFFFFFFLL;
  }
  if ((v5 & 0x400) != 0) {
    return 1;
  }
  if ((v6 & 0x400) != 0) {
    return 0xFFFFFFFFLL;
  }
  int v7 = a1[4];
  int v8 = a2[4];
  int v9 = ((unsigned __int16)v8 ^ (unsigned __int16)v7) & 0x800;
  if ((v9 & v7) != 0) {
    return 1;
  }
  if ((v9 & v8) != 0) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = a1[2];
  unsigned int v12 = a2[2];
  if (v11 > v12) {
    return 1;
  }
  if (v11 >= v12) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

int sasl_client_init(const sasl_callback_t *callbacks)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8[0] = xmmword_1F1A63018;
  v8[1] = *(_OWORD *)&off_1F1A63028;
  v8[2] = xmmword_1F1A63038;
  ++_sasl_allocation_locked;
  if (_sasl_client_active)
  {
    int plugins = 0;
    ++_sasl_client_active;
    return plugins;
  }
  global_callbacks_client = (uint64_t)callbacks;
  *(void *)algn_1EA144238 = 0;
  cmechlist = _sasl_allocation_utils(32);
  if (!cmechlist) {
    return -2;
  }
  _sasl_client_active = 1;
  uint64_t v3 = _sasl_alloc_utils(0, (uint64_t)&global_callbacks_client);
  uint64_t v4 = cmechlist;
  *(void *)cmechlist = v3;
  if (!v3)
  {
    client_done();
    return -2;
  }
  *(void *)(v4 + 16) = 0;
  *(_DWORD *)(v4 + 24) = 0;
  sasl_client_add_plugin("EXTERNAL", (sasl_client_plug_init_t *)external_client_plug_init);
  int plugins = _sasl_common_init((uint64_t)&global_callbacks_client);
  if (plugins
    || (getpath_callback = _sasl_find_getpath_callback((uint64_t *)callbacks),
        verifyfile_callback = _sasl_find_verifyfile_callback((uint64_t *)callbacks),
        (int plugins = _sasl_load_plugins((const char **)v8, getpath_callback, verifyfile_callback)) != 0))
  {
    client_done();
  }
  else
  {
    _sasl_client_cleanup_hook = (uint64_t)client_done;
    _sasl_client_idle_hook = (uint64_t)client_idle;
    return _sasl_build_mechlist();
  }
  return plugins;
}

uint64_t client_done()
{
  int v0 = _sasl_client_active;
  if (!_sasl_client_active) {
    return 4294967284;
  }
  --_sasl_client_active;
  if (v0 != 1) {
    return 1;
  }
  int v2 = (uint64_t *)cmechlist;
  uint64_t v3 = *(void **)(cmechlist + 16);
  if (v3)
  {
    do
    {
      uint64_t v4 = v3[2];
      __int16 v5 = (void *)v3[3];
      __int16 v6 = *(void (**)(void, void))(v4 + 64);
      if (v6) {
        v6(*(void *)(v4 + 32), *(void *)cmechlist);
      }
      off_1EB527668(v3[1]);
      off_1EB527668(v3);
      uint64_t v3 = v5;
    }
    while (v5);
    int v2 = (uint64_t *)cmechlist;
  }
  _sasl_free_utils(v2);
  off_1EB527668(cmechlist);
  uint64_t result = 0;
  cmechlist = 0;
  return result;
}

uint64_t client_idle(uint64_t a1)
{
  if (!cmechlist) {
    return 0;
  }
  uint64_t v1 = *(void *)(cmechlist + 16);
  if (!v1) {
    return 0;
  }
  while (1)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    uint64_t v4 = *(unsigned int (**)(void, uint64_t, uint64_t))(v3 + 72);
    if (v4)
    {
      uint64_t v5 = a1 ? *(void *)(a1 + 4552) : 0;
      if (v4(*(void *)(v3 + 32), a1, v5)) {
        break;
      }
    }
    uint64_t v1 = *(void *)(v1 + 24);
    if (!v1) {
      return 0;
    }
  }
  return 1;
}

int sasl_client_new(const char *service, const char *serverFQDN, const char *iplocalport, const char *ipremoteport, const sasl_callback_t *prompt_supp, unsigned int flags, sasl_conn_t **pconn)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  *(void *)uint64_t v53 = 0;
  int v52 = 0;
  if (!_sasl_client_active) {
    return -12;
  }
  int v8 = -7;
  if (service && pconn)
  {
    unint64_t v15 = (sasl_conn_t *)_sasl_allocation_utils(4584);
    *pconn = v15;
    if (v15)
    {
      *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v70 = v21;
      long long v71 = v21;
      long long v68 = v21;
      long long v69 = v21;
      long long v66 = v21;
      long long v67 = v21;
      long long v64 = v21;
      long long v65 = v21;
      long long v63 = v21;
      long long v61 = v21;
      long long v62 = v21;
      long long v59 = v21;
      long long v60 = v21;
      long long v57 = v21;
      long long v58 = v21;
      long long v56 = v21;
      bzero(v15, 0x11E8uLL);
      *((void *)*pconn + 1) = client_dispose;
      int v22 = *pconn;
      *((void *)*pconn + 568) = 0;
      uint64_t v23 = (_OWORD *)_sasl_allocation_utils(192);
      *((void *)v22 + 569) = v23;
      if (v23)
      {
        v23[10] = 0u;
        v23[11] = 0u;
        v23[8] = 0u;
        v23[9] = 0u;
        v23[6] = 0u;
        v23[7] = 0u;
        v23[4] = 0u;
        v23[5] = 0u;
        v23[2] = 0u;
        v23[3] = 0u;
        *uint64_t v23 = 0u;
        v23[1] = 0u;
        int v8 = _sasl_conn_init((uint64_t)*pconn, service, flags, 2, (uint64_t)client_idle, serverFQDN, iplocalport, ipremoteport, (uint64_t)prompt_supp, (uint64_t)&global_callbacks_client);
        int v24 = *pconn;
        if (v8)
        {
          if (v8 < 0 && v24) {
            *((_DWORD *)v24 + 600) = v8;
          }
          return v8;
        }
        uint64_t v28 = _sasl_alloc_utils((uint64_t)v24, (uint64_t)&global_callbacks_client);
        if (v28)
        {
          uint64_t v29 = v28;
          unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
          id v55 = (uint64_t (*)())0xAAAAAAAAAAAAAAAALL;
          *(void *)(v28 + 8) = *pconn;
          *(void *)(*((void *)v22 + 569) + 24) = v28;
          if (!_sasl_getcallback(*pconn, 1, &v55, &v54)) {
            ((void (*)(unint64_t, void, const char *, int *, void))v55)(v54, 0, "client_mech_list", v53, 0);
          }
          int v30 = *(const char **)v53;
          if (!*(void *)v53)
          {
            uint64_t v43 = cmechlist;
            *((void *)v22 + 571) = *(void *)(cmechlist + 16);
            *((_DWORD *)v22 + 1144) = *(_DWORD *)(v43 + 24);
            goto LABEL_52;
          }
          char v31 = **(unsigned char **)v53;
          if (!**(unsigned char **)v53) {
            goto LABEL_52;
          }
          uint64_t v32 = 0;
          uint64_t v33 = MEMORY[0x1E4F14390];
          while (1)
          {
            if (v31 < 0)
            {
              if (__maskrune(v31, 0x4000uLL)) {
                goto LABEL_29;
              }
            }
            else if ((*(_DWORD *)(v33 + 4 * v31 + 60) & 0x4000) != 0)
            {
              goto LABEL_29;
            }
            int v34 = *(unsigned __int8 *)++v30;
            char v31 = v34;
            if (v34) {
              continue;
            }
LABEL_29:
            uint64_t v35 = *(void *)(cmechlist + 16);
            if (v35)
            {
              while (!_sasl_is_equal_mech(*(const char **)v53, **(char ***)(v35 + 16), (unint64_t)&v30[-*(void *)v53], &v52))
              {
                uint64_t v35 = *(void *)(v35 + 24);
                if (!v35) {
                  goto LABEL_32;
                }
              }
              uint64_t v37 = _sasl_allocation_utils(32);
              if (!v37)
              {
                int v8 = -2;
                goto LABEL_57;
              }
              uint64_t v36 = v37;
              uint64_t v38 = *(void *)(v35 + 16);
              *(_OWORD *)uint64_t v37 = *(_OWORD *)v35;
              *(void *)(v37 + 16) = v38;
              *(void *)(v37 + 24) = 0;
              unsigned int v39 = (uint64_t *)((char *)v22 + 4568);
              if (*((void *)v22 + 571))
              {
                if (v32)
                {
                  unsigned int v39 = (uint64_t *)(v32 + 24);
                  goto LABEL_37;
                }
              }
              else
              {
LABEL_37:
                *unsigned int v39 = v37;
              }
              ++*((_DWORD *)v22 + 1144);
              goto LABEL_39;
            }
LABEL_32:
            uint64_t v36 = v32;
LABEL_39:
            *(void *)uint64_t v53 = v30;
            char v40 = *v30;
            if (!*v30) {
              goto LABEL_52;
            }
            size_t v41 = (unsigned __int8 *)(v30 + 1);
            while ((v40 & 0x80) == 0)
            {
              if ((*(_DWORD *)(v33 + 4 * v40 + 60) & 0x4000) == 0) {
                goto LABEL_47;
              }
LABEL_45:
              *(void *)uint64_t v53 = v41;
              int v42 = *v41++;
              char v40 = v42;
              if (!v42) {
                goto LABEL_52;
              }
            }
            if (__maskrune(v40, 0x4000uLL)) {
              goto LABEL_45;
            }
LABEL_47:
            int v30 = *(const char **)v53;
            char v31 = **(unsigned char **)v53;
            uint64_t v32 = v36;
            if (!**(unsigned char **)v53)
            {
LABEL_52:
              if (*((void *)v22 + 571))
              {
                uint64_t v44 = *((void *)v22 + 569);
                *(void *)(v44 + 24) = v29;
                *(void *)(v44 + 152) = _sasl_canon_user_lookup;
                *(_DWORD *)(v44 + 180) = flags;
                *(void *)(v44 + 32) = *((void *)*pconn + 296);
                long long v56 = 0u;
                long long v57 = 0u;
                long long v65 = 0u;
                long long v66 = 0u;
                long long v63 = 0u;
                long long v64 = 0u;
                long long v61 = 0u;
                long long v62 = 0u;
                long long v59 = 0u;
                long long v60 = 0u;
                long long v70 = 0u;
                long long v71 = 0u;
                long long v68 = 0u;
                long long v69 = 0u;
                long long v67 = 0u;
                long long v58 = 0u;
                if (get_fqhostname((char *)&v56, 256, 0)) {
                  return -1;
                }
                int v8 = _sasl_strdup((const char *)&v56, (char **)v22 + 570, 0);
                if (!v8) {
                  return v8;
                }
              }
              else
              {
                sasl_seterror(*pconn, 0, "No worthy mechs found");
                int v8 = -4;
              }
LABEL_57:
              _sasl_conn_dispose(*pconn);
              off_1EB527668(*pconn);
              *pconn = 0;
              _sasl_log(0, 1u, "Out of memory in sasl_client_new", v45, v46, v47, v48, v49, v51);
              return v8;
            }
          }
        }
        uint64_t v26 = *pconn;
        if (*pconn)
        {
          int v27 = 443;
LABEL_16:
          sasl_seterror(v26, 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/client.c near line %d", v27);
          int v8 = -2;
          if (*pconn) {
            *((_DWORD *)*pconn + 600) = -2;
          }
          return v8;
        }
      }
      else
      {
        uint64_t v26 = *pconn;
        if (*pconn)
        {
          int v27 = 432;
          goto LABEL_16;
        }
      }
    }
    else
    {
      _sasl_log(0, 1u, "Out of memory allocating connection context", v16, v17, v18, v19, v20, v50);
    }
    return -2;
  }
  return v8;
}

uint64_t client_dispose(void *a1)
{
  uint64_t v2 = a1[568];
  if (v2)
  {
    uint64_t v3 = *(void (**)(void, void))(*(void *)(v2 + 16) + 56);
    if (v3) {
      v3(a1[269], *(void *)(a1[569] + 24));
    }
  }
  a1[269] = 0;
  uint64_t v4 = a1[570];
  if (v4) {
    off_1EB527668(v4);
  }
  uint64_t v5 = a1[569];
  if (v5)
  {
    _sasl_free_utils((uint64_t *)(v5 + 24));
    off_1EB527668(a1[569]);
  }
  uint64_t v6 = a1[571];
  if (v6 != *(void *)(cmechlist + 16) && v6 != 0)
  {
    do
    {
      uint64_t v8 = *(void *)(v6 + 24);
      off_1EB527668(v6);
      uint64_t v6 = v8;
    }
    while (v8);
  }
  return _sasl_conn_dispose(a1);
}

int sasl_client_start(sasl_conn_t *conn, const char *mechlist, sasl_interact_t **prompt_need, const char **clientout, unsigned int *clientoutlen, const char **mech)
{
  if (!_sasl_client_active) {
    return -12;
  }
  uint64_t v6 = conn;
  if (!conn) {
    return -7;
  }
  if (!mechlist)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/client.c near line %d", 819);
    int v12 = -7;
    goto LABEL_87;
  }
  int v10 = prompt_need;
  if (prompt_need && *prompt_need)
  {
    unsigned int v11 = 0;
    goto LABEL_7;
  }
  uint64_t v77 = clientout;
  int64_t v78 = clientoutlen;
  unsigned int v13 = *((_DWORD *)conn + 576);
  unsigned int v14 = *((_DWORD *)conn + 584);
  BOOL v15 = v13 >= v14;
  unsigned int v16 = v13 - v14;
  if (!v15) {
    unsigned int v16 = 0;
  }
  unsigned int v79 = v16;
  uint64_t v17 = *((void *)conn + 569);
  uint64_t v81 = *(void *)(v17 + 24);
  int v18 = *(void *)(v17 + 128) != 0;
  uint64_t v19 = strdup(mechlist);
  __lasts = 0;
  if (*v19)
  {
    size_t v20 = 0;
    unint64_t v21 = 2;
    uint64_t v22 = MEMORY[0x1E4F14390];
    do
    {
      unsigned int v23 = v19[v20];
      if ((v23 & 0x80000000) != 0) {
        int v24 = __maskrune(v19[v20], 0x500uLL);
      }
      else {
        int v24 = *(_DWORD *)(v22 + 4 * v23 + 60) & 0x500;
      }
      if (v23 != 95 && v24 == 0 && v23 != 45) {
        ++v21;
      }
      ++v20;
    }
    while (v20 < strlen(v19));
  }
  else
  {
    unint64_t v21 = 2;
  }
  int v27 = (const char **)(*(uint64_t (**)(unint64_t))(v81 + 40))(8 * v21);
  bzero(v27, 8 * v21);
          "~\x7F\x80\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8A\x8B\x8C\x8D\x8E\x8F\x90\x91\x92\x93\x94\x95\x96\x97\x98\x99\x9A"
          "\x9B\x9C\x9D\x9E\x9F\xA0\xA1\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAB\xAC\xAD\xAE\xAF\xB0\xB1\xB2\xB3\xB4\xB5\xB6"
          "\xB7\xB8\xB9\xBA\xBB\xBC\xBD\xBE\xBF\xC0\xC1\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xCB\xCC\xCD\xCE\xCF\xD0\xD1\xD2"
          "\xD3\xD4\xD5\xD6\xD7\xD8\xD9\xDA\xDB\xDC\xDD\xDE\xDF\xE0\xE1\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9\xEA\xEB\xEC\xED\xEE"
          "\xEF\xF0\xF1\xF2\xF3\xF4\xF5\xF6\xF7\xF8\xF9\xFA\xFB\xFC\xFD\xFE",
          &__lasts);
  if (v28)
  {
    uint64_t v75 = mech;
    size_t v29 = 0;
    while (1)
    {
      v27[v29++] = v28;
      if (v29 > v21) {
        goto LABEL_42;
      }
      uint64_t v28 = strtok_r(0, "\x01\x02\x03\x04\x05\x06\a\b\t\n\v\f\r\x0E\x0F\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1A\x1B\x1C\x1D\x1E\x1F !\"#$%&'()*+,./:;<=>?@[\\]^"
              "\x99\x9A\x9B\x9C\x9D\x9E\x9F\xA0\xA1\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAB\xAC\xAD\xAE\xAF\xB0\xB1\xB2\xB3"
              "\xB4\xB5\xB6\xB7\xB8\xB9\xBA\xBB\xBC\xBD\xBE\xBF\xC0\xC1\xC2\xC3\xC4\xC5\xC6\xC7\xC8\xC9\xCA\xCB\xCC\xCD\xCE"
              "\xCF\xD0\xD1\xD2\xD3\xD4\xD5\xD6\xD7\xD8\xD9\xDA\xDB\xDC\xDD\xDE\xDF\xE0\xE1\xE2\xE3\xE4\xE5\xE6\xE7\xE8\xE9"
              "\xEA\xEB\xEC\xED\xEE\xEF\xF0\xF1\xF2\xF3\xF4\xF5\xF6\xF7\xF8\xF9\xFA\xFB\xFC\xFD\xFE",
              &__lasts);
      if (!v28) {
        goto LABEL_38;
      }
    }
  }
  if (!v27)
  {
LABEL_42:
    free(v19);
    goto LABEL_83;
  }
  uint64_t v75 = mech;
  size_t v29 = 0;
LABEL_38:
  qsort_b(v27, v29, 8uLL, &__block_literal_global_24);
  int v30 = *v27;
  if (*v27)
  {
    char v31 = v6;
    uint64_t v32 = v27 + 1;
    size_t v33 = 1;
    do
    {
      v33 += strlen(v30) + 1;
      int v34 = *v32++;
      int v30 = v34;
    }
    while (v34);
  }
  else
  {
    char v31 = v6;
    size_t v33 = 1;
  }
  uint64_t v35 = (unsigned char *)(*(uint64_t (**)(size_t))(v81 + 40))(v33);
  bzero(v35, v33);
  uint64_t v36 = *v27;
  if (*v27)
  {
    uint64_t v37 = v27 + 1;
    do
    {
      strlcat(v35, v36, v33);
      strlcat(v35, " ", v33);
      uint64_t v38 = *v37++;
      uint64_t v36 = v38;
    }
    while (v38);
  }
  (*(void (**)(const char **))(v81 + 64))(v27);
  (*(void (**)(char *))(v81 + 64))(v19);
  if (!v35)
  {
    int v12 = -4;
    uint64_t v6 = v31;
    goto LABEL_87;
  }
  uint64_t v6 = v31;
  if (!*v35)
  {
LABEL_83:
    int v12 = -4;
    goto LABEL_87;
  }
  size_t v39 = strlen(v35);
  uint64_t v40 = (*(uint64_t (**)(size_t))(v81 + 40))(v39 + 1);
  if (!v40)
  {
    int v12 = -2;
    goto LABEL_87;
  }
  uint64_t v83 = 0;
  int v82 = 0;
  uint64_t v73 = (_OWORD *)((char *)v31 + 2304);
  conna = v31;
  uint64_t v41 = MEMORY[0x1E4F14390];
  __s = (char *)v40;
  int v42 = (char *)v40;
  do
  {
    size_t v43 = 0;
    size_t v44 = 0;
    int v45 = v18;
    do
    {
      unsigned int v46 = (char)v35[v44];
      if ((v46 & 0x80000000) != 0)
      {
        if (__maskrune((char)v35[v44], 0x500uLL)) {
          goto LABEL_76;
        }
      }
      else if ((*(_DWORD *)(v41 + 4 * v46 + 60) & 0x500) != 0)
      {
        goto LABEL_76;
      }
      if (v46 != 45 && v46 != 95)
      {
        unint64_t v47 = v44 - v43;
        if (v44 != v43)
        {
          int v48 = v47 >= 6 && strncasecmp(&v35[v44 - 5], "-PLUS", 5uLL) == 0;
          if (v48 == v18)
          {
            memcpy(v42, &v35[v43], v44 - v43);
            int v49 = v82;
            if (v82) {
              BOOL v50 = 1;
            }
            else {
              BOOL v50 = v18 == 0;
            }
            v42[v44 - v43] = 0;
            v42 += v47 + 1;
            ++v83;
            if (!v50) {
              int v49 = 1;
            }
            int v82 = v49;
          }
        }
        size_t v43 = v44 + 1;
      }
LABEL_76:
      ++v44;
    }
    while (v44 <= v39);
    int v18 = 0;
  }
  while (v45);
  uint64_t v51 = *(void (**)(char *))(v81 + 64);
  if (!v83)
  {
    v51(__s);
    int v12 = -4;
    uint64_t v6 = conna;
    goto LABEL_87;
  }
  v51(v35);
  uint64_t v6 = conna;
  uint64_t v52 = *(void *)(*((void *)conna + 569) + 128);
  if (v52)
  {
    unsigned int v53 = v79;
    if (v83 == 1)
    {
      if (*(_DWORD *)(v52 + 8)) {
        int v54 = 2;
      }
      else {
        int v54 = 0;
      }
      goto LABEL_93;
    }
    if (v82 || !*(_DWORD *)(v52 + 8))
    {
      int v54 = 1;
      goto LABEL_93;
    }
LABEL_133:
    int v12 = -4;
    unsigned int v11 = __s;
    goto LABEL_45;
  }
  int v54 = 0;
  unsigned int v53 = v79;
LABEL_93:
  uint64_t v56 = *((void *)conna + 571);
  if (!v56) {
    goto LABEL_132;
  }
  int v57 = 0;
  while (2)
  {
    uint64_t v58 = v83;
    long long v59 = __s;
    while (1)
    {
      int v84 = -1431655766;
      size_t v60 = strlen(v59);
      if (_sasl_is_equal_mech(v59, **(char ***)(v56 + 16), v60, &v84)) {
        break;
      }
      v59 += v60 + 1;
      if (!--v58) {
        goto LABEL_116;
      }
    }
    if (have_prompts(conna, *(void *)(v56 + 16)))
    {
      uint64_t v61 = *(void *)(v56 + 16);
      if (v53 <= *(_DWORD *)(v61 + 8))
      {
        int v62 = *((_DWORD *)conna + 579);
        unsigned int v63 = *((_DWORD *)conna + 584);
        if (v63 > 1 && *((_DWORD *)conna + 576) <= v63) {
          v62 &= ~1u;
        }
        if ((v62 & ~*(_DWORD *)(v61 + 12)) == 0)
        {
          int v65 = *(_DWORD *)(v61 + 16);
          if ((v54 != 2 || (v65 & 0x800) != 0) && ((v65 & 1) == 0 || *((void *)conna + 298)))
          {
            int v66 = *((_DWORD *)conna + 6);
            if (((v65 & 0x20) != 0 || (v66 & 8) == 0) && ((v65 & 0x1000) != 0 || (v66 & 0x10) == 0))
            {
              if (v84) {
                BOOL v67 = *(void *)(*((void *)conna + 569) + 128) == 0;
              }
              else {
                BOOL v67 = 1;
              }
              if (v67) {
                int v57 = v54;
              }
              else {
                int v57 = 2;
              }
              if (v75) {
                *uint64_t v75 = *(const char **)v61;
              }
              uint64_t v58 = v56;
              break;
            }
          }
        }
      }
    }
    uint64_t v58 = 0;
LABEL_116:
    uint64_t v56 = *(void *)(v56 + 24);
    if (v56) {
      continue;
    }
    break;
  }
  if (!v58)
  {
LABEL_132:
    sasl_seterror(conna, 0, "No worthy mechs found");
    goto LABEL_133;
  }
  long long v68 = (const char *)*((void *)conna + 2);
  uint64_t v69 = *((void *)conna + 569);
  *(void *)uint64_t v69 = v68;
  *(_DWORD *)(v69 + 56) = strlen(v68);
  long long v70 = (const char *)*((void *)conna + 298);
  if (v70)
  {
    *(void *)(v69 + 8) = v70;
    *(_DWORD *)(v69 + 60) = strlen(v70);
  }
  long long v71 = (const char *)*((void *)conna + 570);
  *(void *)(v69 + 16) = v71;
  *(_DWORD *)(v69 + 64) = strlen(v71);
  *(_DWORD *)(v69 + 112) = *((_DWORD *)conna + 584);
  long long v72 = v73[1];
  *(_OWORD *)(v69 + 80) = *v73;
  *(_OWORD *)(v69 + 96) = v72;
  *(_DWORD *)(*((void *)conna + 569) + 168) = v57;
  *((void *)conna + 568) = v58;
  int v12 = (*(uint64_t (**)(void, void, uint64_t))(*(void *)(v58 + 16) + 40))(*(void *)(*(void *)(v58 + 16) + 32), *((void *)conna + 569), (uint64_t)conna + 2152);
  clientout = v77;
  clientoutlen = v78;
  int v10 = prompt_need;
  unsigned int v11 = __s;
  if (!v12)
  {
LABEL_7:
    if (clientout)
    {
      if ((*(unsigned char *)(*(void *)(*((void *)v6 + 568) + 16) + 16) & 0x10) == 0)
      {
        int v12 = sasl_client_step(v6, 0, 0, v10, clientout, clientoutlen);
        goto LABEL_45;
      }
      *clientout = 0;
      *clientoutlen = 0;
    }
    int v12 = 1;
  }
LABEL_45:
  if (v11) {
    (*(void (**)(char *))(*(void *)(*((void *)v6 + 569) + 24) + 64))(v11);
  }
  if (v12 < 0) {
LABEL_87:
  }
    *((_DWORD *)v6 + 600) = v12;
  return v12;
}

uint64_t have_prompts(sasl_conn_t *conn, uint64_t a2)
{
  unint64_t v8 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v9 = (uint64_t (*)())0xAAAAAAAAAAAAAAAALL;
  uint64_t v2 = *(uint64_t **)(a2 + 24);
  if (!v2) {
    uint64_t v2 = (uint64_t *)&have_prompts_default_prompts;
  }
  uint64_t v3 = *v2;
  if (!*v2) {
    return 1;
  }
  uint64_t v5 = v2 + 1;
  while ((_sasl_getcallback(conn, v3, &v9, &v8) & 0xFFFFFFFD) == 0)
  {
    uint64_t v6 = *v5++;
    uint64_t v3 = v6;
    if (!v6) {
      return 1;
    }
  }
  return 0;
}

int sasl_client_step(sasl_conn_t *conn, const char *serverin, unsigned int serverinlen, sasl_interact_t **prompt_need, const char **clientout, unsigned int *clientoutlen)
{
  if (!_sasl_client_active) {
    return -12;
  }
  if (!conn) {
    return -7;
  }
  if (!serverin && serverinlen)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/client.c near line %d", 1015);
    int result = -7;
LABEL_6:
    *((_DWORD *)conn + 600) = result;
    return result;
  }
  if (*((_DWORD *)conn + 540))
  {
    _sasl_log((uint64_t)conn, 1u, "attempting client step after doneflag", *(uint64_t *)&serverinlen, (uint64_t)prompt_need, (uint64_t)clientoutlen, v6, v7, v12);
    return -1;
  }
  else
  {
    if (clientout) {
      *clientout = 0;
    }
    if (clientoutlen) {
      *clientoutlen = 0;
    }
    int result = (*(uint64_t (**)(void, void, const char *, void, sasl_interact_t **, const char **, unsigned int *, char *))(*(void *)(*((void *)conn + 568) + 16) + 48))(*((void *)conn + 269), *((void *)conn + 569), serverin, *(void *)&serverinlen, prompt_need, clientout, clientoutlen, (char *)conn + 2160);
    if (result)
    {
      if (result < 0) {
        goto LABEL_6;
      }
    }
    else
    {
      if (!*clientout && (*((unsigned char *)conn + 24) & 4) == 0)
      {
        *clientout = "";
        *clientoutlen = 0;
      }
      if (!*((_DWORD *)conn + 548)) {
        *((_DWORD *)conn + 548) = *((_DWORD *)conn + 578);
      }
      if (!*((void *)conn + 271) || !*((void *)conn + 272))
      {
        sasl_seterror(conn, 0, "mech did not call canon_user for both authzid and authid");
        int result = -5;
        goto LABEL_6;
      }
      return 0;
    }
  }
  return result;
}

uint64_t _sasl_client_mechs()
{
  if (_sasl_client_active)
  {
    uint64_t v0 = *(void *)(cmechlist + 16);
    if (v0)
    {
      uint64_t v1 = 0;
      while (1)
      {
        uint64_t result = _sasl_allocation_utils(16);
        if (!(v1 | result)) {
          break;
        }
        if (!result)
        {
          uint64_t v3 = *(void *)(v1 + 8);
          do
          {
            off_1EB527668(v1);
            uint64_t v1 = v3;
            uint64_t v3 = *(void *)(v3 + 8);
          }
          while (v3);
          return 0;
        }
        *(void *)uint64_t result = **(void **)(v0 + 16);
        *(void *)(result + 8) = v1;
        uint64_t v0 = *(void *)(v0 + 24);
        uint64_t v1 = result;
        if (!v0) {
          return result;
        }
      }
    }
  }
  return 0;
}

int sasl_client_plugin_info(const char *mech_list, sasl_client_info_callback_t *info_cb, void *info_cb_rock)
{
  memset(v16, 170, 24);
  if (info_cb) {
    uint64_t v3 = info_cb;
  }
  else {
    uint64_t v3 = _sasl_print_mechanism;
  }
  if (!cmechlist) {
    return -12;
  }
  ((void (*)(void, void))v3)(0, 0);
  if (mech_list)
  {
    uint64_t v6 = strdup(mech_list);
    uint64_t v7 = v6;
    if (v6)
    {
      unint64_t v8 = v6;
      do
      {
        uint64_t v9 = v8;
        int v10 = strchr(v8, 32);
        unint64_t v8 = v10;
        if (v10)
        {
          *int v10 = 0;
          unint64_t v8 = v10 + 1;
        }
        for (uint64_t i = *(long long **)(cmechlist + 16); i; uint64_t i = (long long *)*((void *)i + 3))
        {
          if (!strcasecmp(v9, **((const char ***)i + 2)))
          {
            long long v12 = *i;
            *(void *)&v16[1] = *((void *)i + 2);
            v16[0] = v12;
            ((void (*)(_OWORD *, uint64_t, void *))v3)(v16, 1, info_cb_rock);
          }
        }
      }
      while (v8);
    }
    free(v7);
  }
  else
  {
    for (j = *(long long **)(cmechlist + 16); j; j = (long long *)*((void *)j + 3))
    {
      long long v15 = *j;
      *(void *)&v16[1] = *((void *)j + 2);
      v16[0] = v15;
      ((void (*)(_OWORD *, uint64_t, void *))v3)(v16, 1, info_cb_rock);
    }
  }
  ((void (*)(void, uint64_t, void *))v3)(0, 2, info_cb_rock);
  return 0;
}

uint64_t _sasl_print_mechanism(uint64_t result, int a2)
{
  if (a2 == 2) {
    return result;
  }
  if (!a2)
  {
    return puts("List of client plugins follows");
  }
  uint64_t v3 = result;
  printf("Plugin \"%s\" ", *(const char **)(result + 8));
  printf("[loaded]");
  printf(", \tAPI version: %d\n", *(_DWORD *)v3);
  uint64_t v4 = *(void *)(v3 + 16);
  if (!v4) {
    goto LABEL_35;
  }
  printf("\tSASL mechanism: %s, best SSF: %d\n", *(const char **)v4, *(_DWORD *)(v4 + 8));
  printf("\tsecurity flags:");
  int v5 = *(_DWORD *)(*(void *)(v3 + 16) + 12);
  if ((v5 & 0x10) != 0)
  {
    printf("%cNO_ANONYMOUS", 32);
    int v5 = *(_DWORD *)(*(void *)(v3 + 16) + 12);
    unsigned int v6 = 124;
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unsigned int v6 = 32;
  if (v5)
  {
LABEL_12:
    printf("%cNO_PLAINTEXT", v6);
    int v5 = *(_DWORD *)(*(void *)(v3 + 16) + 12);
    unsigned int v6 = 124;
  }
LABEL_13:
  if ((v5 & 2) != 0)
  {
    printf("%cNO_ACTIVE", v6);
    int v5 = *(_DWORD *)(*(void *)(v3 + 16) + 12);
    unsigned int v6 = 124;
    if ((v5 & 4) == 0)
    {
LABEL_15:
      if ((v5 & 8) == 0) {
        goto LABEL_16;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_15;
  }
  printf("%cNO_DICTIONARY", v6);
  int v5 = *(_DWORD *)(*(void *)(v3 + 16) + 12);
  unsigned int v6 = 124;
  if ((v5 & 8) == 0)
  {
LABEL_16:
    if ((v5 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_25;
  }
LABEL_24:
  printf("%cFORWARD_SECRECY", v6);
  int v5 = *(_DWORD *)(*(void *)(v3 + 16) + 12);
  unsigned int v6 = 124;
  if ((v5 & 0x20) == 0)
  {
LABEL_17:
    if ((v5 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_25:
  printf("%cPASS_CREDENTIALS", v6);
  unsigned int v6 = 124;
  if ((*(_DWORD *)(*(void *)(v3 + 16) + 12) & 0x40) != 0) {
LABEL_18:
  }
    printf("%cMUTUAL_AUTH", v6);
LABEL_19:
  printf("\n\tfeatures:");
  int v7 = *(_DWORD *)(*(void *)(v3 + 16) + 16);
  if ((v7 & 2) != 0)
  {
    printf("%cWANT_CLIENT_FIRST", 32);
    int v7 = *(_DWORD *)(*(void *)(v3 + 16) + 16);
    unsigned int v8 = 124;
    if ((v7 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  unsigned int v8 = 32;
  if ((v7 & 0x10) != 0)
  {
LABEL_28:
    printf("%cSERVER_FIRST", v8);
    int v7 = *(_DWORD *)(*(void *)(v3 + 16) + 16);
    unsigned int v8 = 124;
  }
LABEL_29:
  if ((v7 & 0x20) != 0)
  {
    printf("%cPROXY_AUTHENTICATION", v8);
    int v7 = *(_DWORD *)(*(void *)(v3 + 16) + 16);
    unsigned int v8 = 124;
    if ((v7 & 1) == 0)
    {
LABEL_31:
      if ((v7 & 0x100) == 0) {
        goto LABEL_32;
      }
      goto LABEL_40;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_31;
  }
  printf("%cNEED_SERVER_FQDN", v8);
  int v7 = *(_DWORD *)(*(void *)(v3 + 16) + 16);
  unsigned int v8 = 124;
  if ((v7 & 0x100) == 0)
  {
LABEL_32:
    if ((v7 & 0x800) == 0) {
      goto LABEL_33;
    }
LABEL_41:
    printf("%cCHANNEL_BINDING", v8);
    unsigned int v8 = 124;
    if ((*(_DWORD *)(*(void *)(v3 + 16) + 16) & 0x1000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_40:
  printf("%cGSS_FRAMING", v8);
  int v7 = *(_DWORD *)(*(void *)(v3 + 16) + 16);
  unsigned int v8 = 124;
  if ((v7 & 0x800) != 0) {
    goto LABEL_41;
  }
LABEL_33:
  if ((v7 & 0x1000) != 0) {
LABEL_34:
  }
    printf("%cSUPPORTS_HTTP", v8);
LABEL_35:
  return putchar(10);
}

uint64_t ___sasl_sort_mechlist_block_invoke(uint64_t a1, char **a2, char **a3)
{
  uint64_t v3 = *a3;
  int v4 = _sasl_mech_index(*a2);
  return v4 - _sasl_mech_index(v3);
}

uint64_t _sasl_mech_index(char *__s)
{
  int v6 = 0;
  uint64_t v1 = *(void *)(cmechlist + 16);
  if (!v1) {
    return 0x7FFFFFFFLL;
  }
  uint64_t v3 = 0;
  while (1)
  {
    size_t v4 = strlen(__s);
    if (_sasl_is_equal_mech(__s, **(char ***)(v1 + 16), v4, &v6)) {
      break;
    }
    uint64_t v3 = (v3 + 1);
    uint64_t v1 = *(void *)(v1 + 24);
    if (!v1) {
      return 0x7FFFFFFFLL;
    }
  }
  return v3;
}

pthread_mutex_t *sasl_mutex_alloc()
{
  uint64_t v0 = (pthread_mutex_t *)malloc_type_malloc(0x40uLL, 0x1000040FA0F61DDuLL);
  uint64_t v1 = v0;
  if (v0) {
    pthread_mutex_init(v0, 0);
  }
  return v1;
}

uint64_t sasl_mutex_lock(pthread_mutex_t *a1)
{
  if (pthread_mutex_lock(a1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t sasl_mutex_unlock(pthread_mutex_t *a1)
{
  if (pthread_mutex_unlock(a1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void sasl_mutex_free(pthread_mutex_t *a1)
{
  if (a1)
  {
    pthread_mutex_destroy(a1);
    free(a1);
  }
}

uint64_t _sasl_strdup(const char *a1, char **a2, size_t *a3)
{
  size_t v6 = strlen(a1);
  if (a3) {
    *a3 = v6;
  }
  int v7 = (char *)_sasl_allocation_utils((v6 + 1));
  *a2 = v7;
  if (!v7) {
    return 4294967294;
  }
  strcpy(v7, a1);
  return 0;
}

uint64_t _sasl_add_string(uint64_t *a1, unint64_t *a2, void *a3, const char *a4)
{
  if (a4) {
    int v7 = a4;
  }
  else {
    int v7 = "(null)";
  }
  size_t v8 = strlen(v7);
  if (_buf_alloc(a1, a2, *a3 + v8)) {
    return 4294967294;
  }
  strncpy((char *)(*a1 + *a3), v7, v8);
  uint64_t result = 0;
  *a3 += v8;
  return result;
}

uint64_t _buf_alloc(uint64_t *a1, unint64_t *a2, unint64_t a3)
{
  if (*a1)
  {
    unint64_t v6 = *a2;
    if (*a2 < a3)
    {
      do
        v6 *= 2;
      while (v6 < a3);
      uint64_t v7 = off_1EB527660();
      *a1 = v7;
      uint64_t v8 = v7 ? v6 : 0;
      *a2 = v8;
      if (!v7) {
        return 4294967294;
      }
    }
    return 0;
  }
  uint64_t v9 = _sasl_allocation_utils(a3);
  *a1 = v9;
  if (v9)
  {
    *a2 = a3;
    return 0;
  }
  *a2 = 0;
  return 4294967294;
}

int sasl_encode(sasl_conn_t *conn, const char *input, unsigned int inputlen, const char **output, unsigned int *outputlen)
{
  if (!conn) {
    return -7;
  }
  if (input && inputlen && output && outputlen)
  {
    invec.iov_base = (void *)input;
    invec.iov_len = inputlen;
    int result = sasl_encodev(conn, &invec, 1u, output, outputlen);
    if ((result & 0x80000000) == 0) {
      return result;
    }
  }
  else
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", 343);
    int result = -7;
  }
  *((_DWORD *)conn + 600) = result;
  return result;
}

int sasl_encodev(sasl_conn_t *conn, const iovec *invec, unsigned int numiov, const char **output, unsigned int *outputlen)
{
  *((void *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
  int v46 = 0;
  if (!conn) {
    return -7;
  }
  LODWORD(v5) = numiov;
  if (!numiov || (uint64_t v7 = invec) == 0 || !output || !outputlen)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", 468);
    int v36 = -7;
LABEL_32:
    *((_DWORD *)conn + 600) = v36;
    return v36;
  }
  if (!*((_DWORD *)conn + 578))
  {
    sasl_seterror(conn, 0, "called sasl_encode[v] with application that does not support security layers");
    return -15;
  }
  if (!*((void *)conn + 276))
  {
    uint64_t v38 = (const char ***)((char *)conn + 2392);
    int v39 = _iovec_to_buf((uint64_t)invec, numiov, (void **)conn + 299);
    int v36 = v39;
    if (!v39)
    {
      *output = **v38;
      *outputlen = (*v38)[1];
      return v36;
    }
    sasl_seterror(conn, 0, "Internal Error %d in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", v39, 481);
    goto LABEL_32;
  }
  unsigned int v43 = 0;
  size_t v10 = 0;
  uint64_t v11 = 0;
  long long v12 = 0;
  size_t v13 = 0;
  unsigned int v14 = 0;
  *(void *)&long long v47 = 0;
  unint64_t v15 = *((unsigned int *)conn + 548);
  do
  {
    while (1)
    {
      unsigned int v45 = v5;
      uint64_t v16 = v14;
      uint64_t v17 = &v7[v14];
      size_t iov_len = v17->iov_len;
      p_size_t iov_len = &v17->iov_len;
      size_t v20 = iov_len + v13;
      if (iov_len + v13 <= v15)
      {
        ++v14;
        size_t v13 = v20;
        uint64_t v5 = v45;
        goto LABEL_26;
      }
      *((void *)&v47 + 1) = v15 - v13;
      *(void *)&long long v47 = v7[v14].iov_base;
      uint64_t v21 = v14 + 2;
      unsigned int v22 = v43;
      unsigned int v23 = v7;
      if (v21 > v43)
      {
        int v24 = v12;
        size_t v44 = v10;
        uint64_t v25 = off_1EB527660(v12, 16 * (v14 + 2));
        size_t v10 = v44;
        long long v12 = (void *)v25;
        unsigned int v22 = v16 + 2;
        if (!v25)
        {
          if (v24) {
            off_1EB527668(v24);
          }
          sasl_seterror(conn, 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", 525);
          int v36 = -2;
          goto LABEL_32;
        }
      }
      int v42 = v16 + 1;
      unsigned int v43 = v22;
      if (v11)
      {
        *long long v12 = v11;
        v12[1] = v10;
        unsigned int v26 = 1;
      }
      else
      {
        unsigned int v26 = 0;
        uint64_t v21 = (v16 + 1);
      }
      int v27 = v23;
      if (v16)
      {
        uint64_t v28 = &v12[2 * v26];
        uint64_t v29 = v16;
        int v30 = v23;
        do
        {
          long long v31 = (__int128)*v30++;
          *v28++ = v31;
          --v29;
        }
        while (v29);
      }
      *(_OWORD *)&v12[2 * v26 + 2 * v16] = v47;
      uint64_t v32 = v12;
      int v33 = _sasl_encodev((uint64_t)conn, (uint64_t)v12, v21, &v46, (const void **)output, outputlen);
      if (v33)
      {
        int v36 = v33;
        uint64_t v37 = v32;
        goto LABEL_50;
      }
      uint64_t v11 = v47 + *((void *)&v47 + 1);
      size_t v13 = *p_iov_len + v13 - *((unsigned int *)conn + 548);
      uint64_t v7 = &v27[v42];
      uint64_t v5 = v45 - v42;
      while (1)
      {
        unint64_t v15 = *((unsigned int *)conn + 548);
        size_t v34 = v13 - v15;
        if (v13 <= v15) {
          break;
        }
        *(void *)&long long v47 = v11;
        *((void *)&v47 + 1) = v15;
        v11 += v15;
        int v35 = _sasl_encodev((uint64_t)conn, (uint64_t)&v47, 1, &v46, (const void **)output, outputlen);
        size_t v13 = v34;
        if (v35) {
          goto LABEL_47;
        }
      }
      if (v13) {
        break;
      }
      size_t v10 = 0;
      uint64_t v11 = 0;
      unsigned int v14 = 0;
      int v36 = 0;
      uint64_t v37 = v32;
      long long v12 = v32;
      if (!v5) {
        goto LABEL_49;
      }
    }
    unsigned int v14 = 0;
    long long v12 = v32;
    size_t v10 = v13;
LABEL_26:
    ;
  }
  while (v14 < v5);
  uint64_t v32 = v12;
  if (v11)
  {
    *(void *)&long long v47 = v11;
    *((void *)&v47 + 1) = v10;
    int v40 = _sasl_encodev((uint64_t)conn, (uint64_t)&v47, 1, &v46, (const void **)output, outputlen);
    int v36 = v40;
    if (!v5 || v40) {
      goto LABEL_48;
    }
LABEL_46:
    int v35 = _sasl_encodev((uint64_t)conn, (uint64_t)v7, v5, &v46, (const void **)output, outputlen);
LABEL_47:
    int v36 = v35;
    goto LABEL_48;
  }
  if (v5) {
    goto LABEL_46;
  }
  int v36 = 0;
LABEL_48:
  uint64_t v37 = v32;
LABEL_49:
  if (!v37) {
    goto LABEL_51;
  }
LABEL_50:
  off_1EB527668(v37);
LABEL_51:
  if (v36 < 0) {
    goto LABEL_32;
  }
  return v36;
}

uint64_t _iovec_to_buf(uint64_t a1, int a2, void **a3)
{
  uint64_t result = 4294967289;
  if (a1 && a3)
  {
    LODWORD(v6) = a2;
    uint64_t v7 = *a3;
    if (!*a3)
    {
      uint64_t v8 = (void *)_sasl_allocation_utils(24);
      *a3 = v8;
      if (!v8) {
        return 4294967294;
      }
      *uint64_t v8 = 0;
      v8[1] = 0;
      v8[2] = 0;
      uint64_t v7 = *a3;
    }
    v7[1] = 0;
    unint64_t v9 = 0;
    if (v6)
    {
      uint64_t v10 = v6;
      uint64_t v11 = (uint64_t *)(a1 + 8);
      do
      {
        uint64_t v12 = *v11;
        v11 += 2;
        v9 += v12;
        --v10;
      }
      while (v10);
      v7[1] = v9;
    }
    if (_buf_alloc(v7, v7 + 2, v9)) {
      return 4294967294;
    }
    bzero((void *)*v7, v7[2]);
    if (v6)
    {
      size_t v13 = (char *)*v7;
      uint64_t v6 = v6;
      unsigned int v14 = (size_t *)(a1 + 8);
      do
      {
        memcpy(v13, (const void *)*(v14 - 1), *v14);
        size_t v15 = *v14;
        v14 += 2;
        v13 += v15;
        --v6;
      }
      while (v6);
    }
    return 0;
  }
  return result;
}

uint64_t _sasl_encodev(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, const void **a5, _DWORD *a6)
{
  uint64_t v6 = *(uint64_t (**)(void, uint64_t, uint64_t, const void **, _DWORD *))(a1 + 2208);
  if (!v6) {
    _sasl_encodev_cold_1();
  }
  if (*a4 == 1)
  {
    unint64_t v13 = *a6;
    *(void *)(a1 + 4528) = v13;
    unsigned int v14 = *(void **)(a1 + 4520);
    if (v14)
    {
      if (*(void *)(a1 + 4536) < v13)
      {
        *(void *)(a1 + 4536) = v13 + 4096;
        unsigned int v14 = (void *)((uint64_t (*)(void))off_1EB527660)();
        if (!v14)
        {
          int v22 = 397;
          goto LABEL_22;
        }
        *(void *)(a1 + 4520) = v14;
      }
    }
    else
    {
      *(void *)(a1 + 4536) = v13 + 4096;
      unsigned int v14 = (void *)_sasl_allocation_utils(v13 + 4097);
      *(void *)(a1 + 4520) = v14;
      if (!v14)
      {
        int v22 = 384;
        goto LABEL_22;
      }
    }
    memcpy(v14, *a5, *a6);
    uint64_t v6 = *(uint64_t (**)(void, uint64_t, uint64_t, const void **, _DWORD *))(a1 + 2208);
  }
  uint64_t result = v6(*(void *)(a1 + 2152), a2, a3, a5, a6);
  if (*a4 < 1 || result != 0)
  {
    ++*a4;
    if ((result & 0x80000000) == 0) {
      return result;
    }
    goto LABEL_23;
  }
  uint64_t v17 = *(void *)(a1 + 4528);
  size_t v18 = *a6;
  size_t v19 = v17 + v18;
  uint64_t v20 = *(void *)(a1 + 4520);
  if (v17 + v18 <= *(void *)(a1 + 4536))
  {
LABEL_18:
    memcpy((void *)(v20 + v17), *a5, v18);
    uint64_t result = 0;
    uint64_t v21 = *(void *)(a1 + 4528) + *a6;
    *(void *)(a1 + 4528) = v21;
    *a5 = *(const void **)(a1 + 4520);
    *a6 = v21;
    ++*a4;
    return result;
  }
  *(void *)(a1 + 4536) = v19;
  uint64_t v20 = off_1EB527660(v20, v19 + 1);
  if (v20)
  {
    *(void *)(a1 + 4520) = v20;
    uint64_t v17 = *(void *)(a1 + 4528);
    size_t v18 = *a6;
    goto LABEL_18;
  }
  int v22 = 423;
LABEL_22:
  sasl_seterror((sasl_conn_t *)a1, 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", v22);
  uint64_t result = 4294967294;
LABEL_23:
  *(_DWORD *)(a1 + 2400) = result;
  return result;
}

int sasl_decode(sasl_conn_t *conn, const char *input, unsigned int inputlen, const char **output, unsigned int *outputlen)
{
  if (!conn) {
    return -7;
  }
  if (!input || !output || !outputlen)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", 656);
    int result = -7;
    goto LABEL_16;
  }
  unsigned int v9 = *((_DWORD *)conn + 578);
  if (!v9)
  {
    sasl_seterror(conn, 0, "called sasl_decode with application that does not support security layers");
    int result = -15;
    goto LABEL_16;
  }
  uint64_t v11 = (uint64_t (*)(void, const char *, void, const char **, unsigned int *))*((void *)conn + 278);
  if (!v11)
  {
    if (v9 >= inputlen)
    {
      unint64_t v13 = (void *)*((void *)conn + 307);
      if (v13 || (unint64_t v13 = (void *)_sasl_allocation_utils(v9 + 1), (*((void *)conn + 307) = v13) != 0))
      {
        memcpy(v13, input, inputlen);
        int result = 0;
        *(unsigned char *)(*((void *)conn + 307) + inputlen) = 0;
        *output = (const char *)*((void *)conn + 307);
        *outputlen = inputlen;
        return result;
      }
      sasl_seterror(conn, 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", 681);
      int result = -2;
    }
    else
    {
      sasl_seterror(conn, 0, "input too large for default sasl_decode");
      int result = -3;
    }
    goto LABEL_16;
  }
  int result = v11(*((void *)conn + 269), input, *(void *)&inputlen, output, outputlen);
  if (!*outputlen) {
    *output = 0;
  }
  if (result < 0) {
LABEL_16:
  }
    *((_DWORD *)conn + 600) = result;
  return result;
}

uint64_t _sasl_free_utils(uint64_t *a1)
{
  if (!a1) {
    return 4294967289;
  }
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0;
  }
  sasl_randfree((sasl_rand_t **)(v2 + 16));
  off_1EB527668(v2);
  uint64_t result = 0;
  *a1 = 0;
  return result;
}

uint64_t _sasl_conn_init(uint64_t a1, const char *a2, int a3, int a4, uint64_t a5, const char *a6, const void *a7, const void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  *(_DWORD *)a1 = a4;
  if (_sasl_strdup(a2, (char **)(a1 + 16), 0))
  {
    int v16 = 781;
LABEL_3:
    sasl_seterror((sasl_conn_t *)a1, 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", v16);
    uint64_t result = 4294967294;
LABEL_6:
    *(_DWORD *)(a1 + 2400) = result;
    return result;
  }
  *(_OWORD *)(a1 + 2288) = 0u;
  *(_OWORD *)(a1 + 2272) = 0u;
  *(_OWORD *)(a1 + 2256) = 0u;
  *(_OWORD *)(a1 + 2240) = 0u;
  *(_OWORD *)(a1 + 2224) = 0u;
  *(_OWORD *)(a1 + 2208) = 0u;
  *(_OWORD *)(a1 + 2192) = 0u;
  *(_OWORD *)(a1 + 2176) = 0u;
  *(_OWORD *)(a1 + 2160) = 0u;
  *(_OWORD *)(a1 + 2336) = 0u;
  *(_DWORD *)(a1 + 24) = a3;
  uint64_t result = sasl_setprop((sasl_conn_t *)a1, 8, a7);
  if (result) {
    goto LABEL_6;
  }
  uint64_t result = sasl_setprop((sasl_conn_t *)a1, 9, a8);
  if (result) {
    goto LABEL_6;
  }
  *(void *)(a1 + 2392) = 0;
  *(void *)(a1 + 2152) = 0;
  *(void *)(a1 + 2352) = 0;
  *(void *)(a1 + 2360) = a5;
  *(void *)(a1 + 2368) = a9;
  *(void *)(a1 + 2376) = a10;
  *(_OWORD *)(a1 + 2304) = 0u;
  *(_OWORD *)(a1 + 2320) = 0u;
  *(_DWORD *)(a1 + 2400) = 0;
  *(_OWORD *)(a1 + 2408) = 0u;
  *(int64x2_t *)(a1 + 2424) = vdupq_n_s64(0x96uLL);
  if (_buf_alloc((uint64_t *)(a1 + 2408), (unint64_t *)(a1 + 2424), 0x96uLL))
  {
    int v16 = 811;
    goto LABEL_3;
  }
  if (_buf_alloc((uint64_t *)(a1 + 2416), (unint64_t *)(a1 + 2432), 0x96uLL))
  {
    int v16 = 813;
    goto LABEL_3;
  }
  **(unsigned char **)(a1 + 2408) = 0;
  **(unsigned char **)(a1 + 2416) = 0;
  *(void *)(a1 + 2456) = 0;
  if (a6)
  {
    size_t v18 = (char **)(a1 + 2384);
    size_t v19 = a6;
  }
  else
  {
    if (*(_DWORD *)a1 != 1)
    {
      uint64_t result = 0;
      *(void *)(a1 + 2384) = 0;
      return result;
    }
    memset(v20, 0, sizeof(v20));
    if (get_fqhostname((char *)v20, 256, 0)) {
      return 0xFFFFFFFFLL;
    }
    size_t v18 = (char **)(a1 + 2384);
    size_t v19 = (const char *)v20;
  }
  uint64_t result = _sasl_strdup(v19, v18, 0);
  if (result)
  {
    int v16 = 839;
    goto LABEL_3;
  }
  return result;
}

int sasl_setprop(sasl_conn_t *conn, int propnum, const void *value)
{
  if (!conn) {
    return -7;
  }
  int v33 = (char *)0xAAAAAAAAAAAAAAAALL;
  int v5 = -7;
  uint64_t v6 = "Unknown parameter type";
  if (propnum <= 99)
  {
    switch(propnum)
    {
      case 8:
        if (!value)
        {
          *((_DWORD *)conn + 7) = 0;
          if (*(_DWORD *)conn == 1)
          {
            int v5 = 0;
            uint64_t v25 = *((void *)conn + 572);
            *(void *)(v25 + 32) = 0;
            *(_DWORD *)(v25 + 64) = 0;
            return v5;
          }
          int v5 = 0;
          if (*(_DWORD *)conn != 2) {
            return v5;
          }
          int v5 = 0;
          uint64_t v18 = *((void *)conn + 569);
          goto LABEL_76;
        }
        if (_sasl_ipfromstring((uint64_t)value, 0, 0))
        {
          uint64_t v6 = "Bad IPLOCALPORT value";
          goto LABEL_53;
        }
        uint64_t v21 = (char *)conn + 36;
        __strcpy_chk();
        *((_DWORD *)conn + 7) = 1;
        if (*(_DWORD *)conn == 1)
        {
          uint64_t v26 = *((void *)conn + 572);
          *(void *)(v26 + 32) = v21;
          int v27 = strlen(v21);
          int v5 = 0;
          *(_DWORD *)(v26 + 64) = v27;
          return v5;
        }
        if (*(_DWORD *)conn != 2) {
          return 0;
        }
        uint64_t v22 = *((void *)conn + 569);
        goto LABEL_79;
      case 9:
        if (value)
        {
          if (_sasl_ipfromstring((uint64_t)value, 0, 0))
          {
            uint64_t v6 = "Bad IPREMOTEPORT value";
            goto LABEL_53;
          }
          uint64_t v21 = (char *)conn + 1093;
          __strcpy_chk();
          *((_DWORD *)conn + 8) = 1;
          if (*(_DWORD *)conn == 1)
          {
            uint64_t v22 = *((void *)conn + 572);
LABEL_79:
            *(void *)(v22 + 40) = v21;
            int v28 = strlen(v21);
            int v5 = 0;
            *(_DWORD *)(v22 + 68) = v28;
          }
          else if (*(_DWORD *)conn == 2)
          {
            uint64_t v23 = *((void *)conn + 569);
            *(void *)(v23 + 48) = v21;
            int v24 = strlen(v21);
            int v5 = 0;
            *(_DWORD *)(v23 + 72) = v24;
          }
          else
          {
            return 0;
          }
        }
        else
        {
          *((_DWORD *)conn + 8) = 0;
          if (*(_DWORD *)conn == 1)
          {
            int v5 = 0;
            uint64_t v18 = *((void *)conn + 572);
LABEL_76:
            *(void *)(v18 + 40) = 0;
            *(_DWORD *)(v18 + 68) = 0;
          }
          else
          {
            int v5 = 0;
            if (*(_DWORD *)conn == 2)
            {
              int v5 = 0;
              uint64_t v19 = *((void *)conn + 569);
              *(void *)(v19 + 48) = 0;
              *(_DWORD *)(v19 + 72) = 0;
            }
          }
        }
        return v5;
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 19:
      case 20:
        goto LABEL_53;
      case 17:
        if (*(_DWORD *)conn != 1)
        {
          int v5 = -5;
          uint64_t v6 = "Tried to set application name on non-server connection";
          goto LABEL_53;
        }
        unsigned int v9 = (void *)((char *)conn + 4544);
        uint64_t v10 = *((void *)conn + 568);
        if (v10)
        {
          off_1EB527668(v10);
          *unsigned int v9 = 0;
        }
        if (value && *(unsigned char *)value)
        {
          if (_sasl_strdup((const char *)value, (char **)conn + 568, 0))
          {
            int v8 = 1321;
            goto LABEL_39;
          }
          uint64_t v29 = (const char *)*((void *)conn + 568);
          uint64_t v30 = *((void *)conn + 572);
          *(void *)(v30 + 8) = v29;
          int v5 = 0;
          *(_DWORD *)(v30 + 52) = strlen(v29);
        }
        else
        {
          int v5 = 0;
          uint64_t v20 = *((void *)conn + 572);
          *(void *)(v20 + 8) = 0;
          *(_DWORD *)(v20 + 52) = 0;
        }
        return v5;
      case 18:
        int v5 = 0;
        if (*(_DWORD *)conn == 2) {
          *(void *)(*((void *)conn + 569) + 120) = value;
        }
        else {
          *(void *)(*((void *)conn + 572) + 160) = value;
        }
        return v5;
      case 21:
        int v5 = 0;
        if (*(_DWORD *)conn == 1) {
          *(void *)(*((void *)conn + 572) + 168) = value;
        }
        else {
          *(void *)(*((void *)conn + 569) + 128) = value;
        }
        return v5;
      case 22:
        int v5 = 0;
        if (*(_DWORD *)conn == 1) {
          *(void *)(*((void *)conn + 572) + 176) = value;
        }
        else {
          *(void *)(*((void *)conn + 569) + 136) = value;
        }
        return v5;
      default:
        if (propnum != 3) {
          goto LABEL_53;
        }
        if (*(_DWORD *)conn != 1)
        {
          int v5 = -5;
          uint64_t v6 = "Tried to set realm on non-server connection";
          goto LABEL_53;
        }
        if (!value || !*(unsigned char *)value)
        {
          sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d");
          goto LABEL_54;
        }
        if (_sasl_strdup((const char *)value, &v33, 0))
        {
          int v8 = 1188;
          goto LABEL_39;
        }
        uint64_t v31 = *((void *)conn + 569);
        if (v31) {
          off_1EB527668(v31);
        }
        int v5 = 0;
        uint64_t v32 = v33;
        *((void *)conn + 569) = v33;
        *(void *)(*((void *)conn + 572) + 24) = v32;
        break;
    }
    return v5;
  }
  if (propnum != 102)
  {
    if (propnum == 101)
    {
      if (*((_DWORD *)value + 2) || !*(_DWORD *)value)
      {
        long long v11 = *(_OWORD *)value;
        *((_OWORD *)conn + 145) = *((_OWORD *)value + 1);
        *((_OWORD *)conn + 144) = v11;
        int v5 = 0;
        if (*(_DWORD *)conn == 1)
        {
          uint64_t v12 = *((void *)conn + 572);
          long long v13 = *((_OWORD *)value + 1);
          *(_OWORD *)(v12 + 96) = *(_OWORD *)value;
          *(_OWORD *)(v12 + 112) = v13;
        }
        else
        {
          uint64_t v16 = *((void *)conn + 569);
          long long v17 = *((_OWORD *)value + 1);
          *(_OWORD *)(v16 + 80) = *(_OWORD *)value;
          *(_OWORD *)(v16 + 96) = v17;
        }
        return v5;
      }
      sasl_seterror(conn, 0, "Attempt to disable security layers (maxoutbuf == 0) with min_ssf > 0");
      int v5 = -15;
    }
    else
    {
      if (propnum == 100)
      {
        int v7 = *(_DWORD *)value;
        *((_DWORD *)conn + 584) = *(_DWORD *)value;
        int v5 = 0;
        if (*(_DWORD *)conn == 1) {
          *(_DWORD *)(*((void *)conn + 572) + 128) = v7;
        }
        else {
          *(_DWORD *)(*((void *)conn + 569) + 112) = v7;
        }
        return v5;
      }
LABEL_53:
      sasl_seterror(conn, 0, v6);
    }
LABEL_54:
    *((_DWORD *)conn + 600) = v5;
    return v5;
  }
  if (value && *(unsigned char *)value)
  {
    if (_sasl_strdup((const char *)value, &v33, 0))
    {
      int v8 = 1167;
LABEL_39:
      sasl_seterror(conn, 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", v8);
      int v5 = -2;
      goto LABEL_54;
    }
  }
  else
  {
    int v33 = 0;
  }
  uint64_t v14 = *((void *)conn + 293);
  if (v14) {
    off_1EB527668(v14);
  }
  int v5 = 0;
  *((void *)conn + 293) = v33;
  return v5;
}

uint64_t _sasl_common_init(uint64_t a1)
{
  uint64_t v1 = sasl_global_utils;
  if (sasl_global_utils)
  {
    *(void *)(sasl_global_utils + 24) = a1;
    *(void *)(v1 + 32) = _sasl_global_getopt;
    if (!free_mutex) {
      goto LABEL_7;
    }
    return 0;
  }
  if (free_mutex) {
    return 0;
  }
  sasl_global_utils = _sasl_alloc_utils(0, a1);
  if (!sasl_global_utils) {
    return 4294967294;
  }
LABEL_7:
  uint64_t result = sasl_canonuser_add_plugin("INTERNAL", (sasl_canonuser_init_t *)internal_canonuser_init);
  if (!result)
  {
    uint64_t v3 = free_mutex;
    if (!free_mutex)
    {
      uint64_t v3 = _sasl_mutex_utils();
      free_mutex = v3;
    }
    if (v3) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t _sasl_global_getopt(void *a1, uint64_t a2, char *__s1, const char **a4, _DWORD *a5)
{
  if (a1 && *a1)
  {
    for (uint64_t i = (void *)(*a1 + 16); ; i += 3)
    {
      uint64_t v10 = *(i - 2);
      if (v10 == 1)
      {
        long long v11 = (uint64_t (*)(void, uint64_t, char *, const char **, _DWORD *))*(i - 1);
        if (!v11) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = v11(*i, a2, __s1, a4, a5);
        if (!result) {
          return result;
        }
      }
      else if (!v10)
      {
        break;
      }
    }
  }
  long long v13 = (const char *)sasl_config_getstring(__s1, 0);
  *a4 = v13;
  if (!v13) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0;
  }
  int v14 = strlen(v13);
  uint64_t result = 0;
  *a5 = v14;
  return result;
}

uint64_t _sasl_alloc_utils(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _sasl_allocation_utils(392);
  uint64_t v5 = v4;
  if (v4)
  {
    *(void *)(v4 + 8) = a1;
    sasl_randcreate((sasl_rand_t **)(v4 + 16));
    uint64_t v6 = _sasl_conn_getopt;
    if (a1)
    {
      uint64_t v7 = a1;
    }
    else
    {
      uint64_t v6 = _sasl_global_getopt;
      uint64_t v7 = a2;
    }
    *(void *)(v5 + 24) = v7;
    *(void *)(v5 + 32) = v6;
    long long v8 = *(_OWORD *)&off_1EB527660;
    *(_OWORD *)(v5 + 40) = *(_OWORD *)&_sasl_allocation_utils;
    *(_OWORD *)(v5 + 56) = v8;
    long long v9 = *(_OWORD *)off_1EB527680;
    *(_OWORD *)(v5 + 72) = _sasl_mutex_utils;
    *(_OWORD *)(v5 + 88) = v9;
    *(void *)(v5 + 104) = _sasl_MD5Init;
    *(void *)(v5 + 112) = _sasl_MD5Update;
    *(void *)(v5 + 120) = _sasl_MD5Final;
    *(void *)(v5 + 128) = _sasl_hmac_md5;
    *(void *)(v5 + 136) = _sasl_hmac_md5_init;
    *(void *)(v5 + 144) = _sasl_hmac_md5_final;
    *(void *)(v5 + 152) = _sasl_hmac_md5_precalc;
    *(void *)(v5 + 160) = _sasl_hmac_md5_import;
    *(void *)(v5 + 168) = sasl_mkchal;
    *(void *)(v5 + 176) = sasl_utf8verify;
    *(void *)(v5 + 184) = sasl_rand;
    *(void *)(v5 + 192) = sasl_churn;
    *(void *)(v5 + 200) = 0;
    *(void *)(v5 + 216) = sasl_encode64;
    *(void *)(v5 + 208) = sasl_decode64;
    *(void *)(v5 + 224) = sasl_erasebuffer;
    *(void *)(v5 + 232) = sasl_getprop;
    *(void *)(v5 + 240) = sasl_setprop;
    *(void *)(v5 + 248) = _sasl_getcallback;
    *(void *)(v5 + 256) = _sasl_log;
    *(void *)(v5 + 264) = sasl_seterror;
    *(void *)(v5 + 280) = prop_new;
    *(void *)(v5 + 288) = prop_dup;
    *(void *)(v5 + 296) = prop_request;
    *(void *)(v5 + 304) = prop_get;
    *(void *)(v5 + 312) = prop_getnames;
    *(void *)(v5 + 320) = prop_clear;
    *(void *)(v5 + 328) = prop_dispose;
    *(void *)(v5 + 336) = prop_format;
    *(void *)(v5 + 344) = prop_set;
    *(void *)(v5 + 352) = prop_setvals;
    *(void *)(v5 + 360) = prop_erase;
    *(void *)(v5 + 272) = 0;
    *(void *)(v5 + 376) = 0;
    *(void *)(v5 + 384) = 0;
    *(void *)(v5 + 368) = sasl_auxprop_store;
  }
  return v5;
}

void sasl_dispose(sasl_conn_t **pconn)
{
  if (pconn)
  {
    if (*pconn)
    {
      if ((free_mutex || (free_mutex = _sasl_mutex_utils()) != 0) && !(*(&_sasl_mutex_utils + 1))())
      {
        if (*pconn)
        {
          (*((void (**)(void))*pconn + 1))();
          off_1EB527668(*pconn);
          *pconn = 0;
        }
        uint64_t v2 = (void (*)(pthread_mutex_t *))off_1EB527680[0];
        uint64_t v3 = (pthread_mutex_t *)free_mutex;
        v2(v3);
      }
    }
  }
}

uint64_t _sasl_conn_dispose(void *a1)
{
  uint64_t v2 = a1[298];
  if (v2) {
    off_1EB527668(v2);
  }
  uint64_t v3 = a1[293];
  if (v3) {
    off_1EB527668(v3);
  }
  uint64_t v4 = (void *)a1[299];
  if (v4)
  {
    if (*v4)
    {
      off_1EB527668(*v4);
      uint64_t v4 = (void *)a1[299];
    }
    off_1EB527668(v4);
  }
  uint64_t v5 = a1[301];
  if (v5) {
    off_1EB527668(v5);
  }
  uint64_t v6 = a1[302];
  if (v6) {
    off_1EB527668(v6);
  }
  uint64_t v7 = a1[307];
  if (v7) {
    off_1EB527668(v7);
  }
  uint64_t v8 = a1[305];
  if (v8) {
    off_1EB527668(v8);
  }
  uint64_t v9 = a1[2];
  if (v9) {
    off_1EB527668(v9);
  }
  uint64_t result = a1[565];
  if (result)
  {
    long long v11 = (uint64_t (*)(void))off_1EB527668;
    return v11();
  }
  return result;
}

int sasl_getprop(sasl_conn_t *conn, int propnum, const void **pvalue)
{
  if (conn)
  {
    if (pvalue)
    {
      if (propnum <= 99)
      {
        switch(propnum)
        {
          case 0:
            uint64_t v4 = (char *)*((void *)conn + 271);
            if (!v4) {
              goto LABEL_56;
            }
            goto LABEL_49;
          case 1:
            int v5 = 0;
            uint64_t v4 = (char *)conn + 2196;
            goto LABEL_62;
          case 2:
            int v5 = 0;
            uint64_t v4 = (char *)conn + 2192;
            goto LABEL_62;
          case 3:
            if (*(_DWORD *)conn != 1) {
              goto LABEL_54;
            }
            int v5 = 0;
            uint64_t v4 = (char *)*((void *)conn + 569);
            goto LABEL_62;
          case 4:
            int v5 = 0;
            *pvalue = conn;
            return v5;
          case 7:
            int v5 = 0;
            uint64_t v4 = (char *)*((void *)conn + 296);
            goto LABEL_62;
          case 8:
            if (!*((_DWORD *)conn + 7)) {
              goto LABEL_55;
            }
            int v5 = 0;
            uint64_t v4 = (char *)conn + 36;
            goto LABEL_62;
          case 9:
            if (*((_DWORD *)conn + 8))
            {
              int v5 = 0;
              uint64_t v4 = (char *)conn + 1093;
              goto LABEL_62;
            }
LABEL_55:
            *pvalue = 0;
            goto LABEL_56;
          case 10:
            int v5 = 0;
            uint64_t v4 = (char *)*((void *)conn + 301);
            goto LABEL_62;
          case 11:
            uint64_t v4 = (char *)*((void *)conn + 279);
            if (!v4) {
              goto LABEL_56;
            }
            goto LABEL_49;
          case 12:
            int v5 = 0;
            uint64_t v4 = (char *)*((void *)conn + 2);
            goto LABEL_62;
          case 13:
            int v5 = 0;
            uint64_t v4 = (char *)*((void *)conn + 298);
            goto LABEL_62;
          case 14:
            if (*(_DWORD *)conn == 1)
            {
              uint64_t v7 = *((void *)conn + 571);
              if (!v7) {
                goto LABEL_56;
              }
            }
            else
            {
              if (*(_DWORD *)conn != 2) {
                goto LABEL_41;
              }
              uint64_t v7 = *((void *)conn + 568);
              if (!v7) {
                goto LABEL_56;
              }
            }
            int v5 = 0;
            goto LABEL_61;
          case 15:
            if (*(_DWORD *)conn == 1)
            {
              uint64_t v8 = *((void *)conn + 571);
              if (!v8) {
                goto LABEL_56;
              }
            }
            else
            {
              if (*(_DWORD *)conn != 2) {
                goto LABEL_41;
              }
              uint64_t v8 = *((void *)conn + 568);
              if (!v8) {
                goto LABEL_56;
              }
            }
            uint64_t v10 = **(const void ***)(v8 + 16);
            *pvalue = v10;
            if (!v10) {
              goto LABEL_56;
            }
            return 0;
          case 16:
            uint64_t v4 = (char *)*((void *)conn + 272);
            if (!v4) {
              goto LABEL_56;
            }
            goto LABEL_49;
          case 17:
            if (*(_DWORD *)conn != 1)
            {
LABEL_54:
              int v5 = -5;
              sasl_seterror(conn, 0, "Internal Error %d in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", -5, 1132);
              goto LABEL_10;
            }
            int v5 = 0;
            uint64_t v7 = *((void *)conn + 572);
LABEL_61:
            uint64_t v4 = *(char **)(v7 + 8);
            goto LABEL_62;
          case 18:
            int v5 = 0;
            if (*(_DWORD *)conn == 2) {
              uint64_t v4 = *(char **)(*((void *)conn + 569) + 120);
            }
            else {
              uint64_t v4 = *(char **)(*((void *)conn + 572) + 160);
            }
            goto LABEL_62;
          case 19:
            uint64_t v4 = (char *)*((void *)conn + 280);
            if (v4) {
              goto LABEL_49;
            }
            goto LABEL_56;
          case 20:
            goto LABEL_16;
          case 22:
            int v5 = 0;
            if (*(_DWORD *)conn == 1) {
              uint64_t v4 = *(char **)(*((void *)conn + 572) + 176);
            }
            else {
              uint64_t v4 = *(char **)(*((void *)conn + 569) + 136);
            }
            goto LABEL_62;
          default:
            goto LABEL_41;
        }
      }
      if (propnum <= 101)
      {
        int v5 = 0;
        if (propnum == 100) {
          uint64_t v4 = (char *)conn + 2336;
        }
        else {
          uint64_t v4 = (char *)conn + 2304;
        }
        goto LABEL_62;
      }
      if (propnum == 102)
      {
        int v5 = 0;
        uint64_t v4 = (char *)*((void *)conn + 293);
        goto LABEL_62;
      }
      if (propnum == 700)
      {
LABEL_16:
        uint64_t v4 = (char *)*((void *)conn + 281);
        if (!v4)
        {
LABEL_56:
          sasl_seterror(conn, 1u, "Information that was requested is not yet available.");
          int v5 = -6;
          goto LABEL_10;
        }
LABEL_49:
        int v5 = 0;
LABEL_62:
        *pvalue = v4;
        return v5;
      }
LABEL_41:
      int v6 = 1126;
    }
    else
    {
      int v6 = 959;
    }
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d", v6);
    int v5 = -7;
LABEL_10:
    *((_DWORD *)conn + 600) = v5;
    return v5;
  }
  return -7;
}

uint64_t _sasl_getcallback(sasl_conn_t *conn, uint64_t a2, uint64_t (**a3)(), void *a4)
{
  if (a3 && a4)
  {
    if (a2 == 1)
    {
      uint64_t v5 = 0;
      int v6 = (uint64_t (*)())_sasl_conn_getopt;
      if (!conn) {
        int v6 = (uint64_t (*)())_sasl_global_getopt;
      }
      *a3 = v6;
LABEL_13:
      *a4 = conn;
      return v5;
    }
    if (!a2)
    {
      uint64_t v5 = 0xFFFFFFFFLL;
      if (conn)
      {
        sasl_seterror(conn, 0, "Internal Error %d in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d");
LABEL_9:
        *((_DWORD *)conn + 600) = v5;
        return v5;
      }
      return v5;
    }
    if (conn)
    {
      uint64_t v8 = (uint64_t *)*((void *)conn + 296);
      if (v8)
      {
        uint64_t v9 = *v8;
        if (*v8)
        {
          uint64_t v10 = v8 + 2;
          while (v9 != a2)
          {
            uint64_t v9 = v10[1];
            v10 += 3;
            if (!v9) {
              goto LABEL_21;
            }
          }
          goto LABEL_32;
        }
      }
LABEL_21:
      long long v11 = (uint64_t **)*((void *)conn + 297);
      if (v11)
      {
        uint64_t v12 = *v11;
        if (v12)
        {
          uint64_t v13 = *v12;
          if (*v12)
          {
            uint64_t v10 = v12 + 2;
            while (v13 != a2)
            {
              uint64_t v13 = v10[1];
              v10 += 3;
              if (!v13) {
                goto LABEL_27;
              }
            }
LABEL_32:
            *a3 = (uint64_t (*)())*(v10 - 1);
            *a4 = *v10;
            return 2 * (*(v10 - 1) == 0);
          }
        }
      }
    }
LABEL_27:
    switch(a2)
    {
      case 2:
        uint64_t v5 = 0;
        int v14 = (uint64_t (*)())_sasl_syslog;
        goto LABEL_39;
      case 3:
        uint64_t v5 = 0;
        uint64_t v16 = &off_1EB527C78;
        goto LABEL_37;
      case 4:
        uint64_t v5 = 0;
        size_t v15 = _sasl_verifyfile;
        goto LABEL_35;
      case 5:
        uint64_t v5 = 0;
        uint64_t v16 = &off_1EB527C60;
LABEL_37:
        *a3 = *v16;
        *a4 = v16[1];
        return v5;
      default:
        if (a2 == 16386)
        {
          uint64_t v5 = 0;
          int v14 = (uint64_t (*)())_sasl_getsimple;
LABEL_39:
          *a3 = v14;
          goto LABEL_13;
        }
        if (a2 == 32769)
        {
          uint64_t v5 = 0;
          size_t v15 = (uint64_t (*)())_sasl_proxy_policy;
LABEL_35:
          *a3 = v15;
          *a4 = 0;
        }
        else
        {
          *a3 = 0;
          *a4 = 0;
          sasl_seterror(conn, 1u, "Unable to find a callback: %d", a2);
          uint64_t v5 = 0xFFFFFFFFLL;
          if (conn) {
            goto LABEL_9;
          }
        }
        break;
    }
    return v5;
  }
  uint64_t v5 = 4294967289;
  if (conn)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/common.c near line %d");
    goto LABEL_9;
  }
  return v5;
}

uint64_t _sasl_ipfromstring(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  size_t v15 = 0;
  __endptr = 0;
  if (!a1) {
    return 4294967289;
  }
  memset(__b, 170, sizeof(__b));
  for (uint64_t i = 0; ; ++i)
  {
    int v7 = *(unsigned __int8 *)(a1 + i);
    if (!*(unsigned char *)(a1 + i) || v7 == 59) {
      break;
    }
    if (i == 1025) {
      return 4294967289;
    }
    __b[i] = v7;
  }
  v14.s_addr = -1431655766;
  __b[i] = 0;
  if (v7 == 59) {
    uint64_t i = (i + 1);
  }
  else {
    uint64_t i = i;
  }
  uint64_t v8 = (const char *)(a1 + i);
  if (*v8)
  {
    unsigned int v9 = strtol(v8, &__endptr, 10);
    if (__endptr && *__endptr) {
      return 4294967289;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  if (inet_aton(__b, &v14) == 1)
  {
    if (a2)
    {
      if (a3 >= 0x10)
      {
        bzero((void *)a2, a3);
        uint64_t result = 0;
        *(unsigned char *)(a2 + 1) = 2;
        *(_WORD *)(a2 + 2) = bswap32(v9) >> 16;
        *(in_addr *)(a2 + 4) = v14;
        return result;
      }
      return 4294967289;
    }
    return 0;
  }
  memset(&v16, 0, sizeof(v16));
  v16.ai_socktype = 1;
  v16.ai_flags = 5;
  if (!getaddrinfo(__b, v8, &v16, &v15))
  {
    long long v11 = v15;
    if (a2)
    {
      size_t ai_addrlen = v15->ai_addrlen;
      if (ai_addrlen > a3)
      {
        freeaddrinfo(v15);
        return 4294967293;
      }
      memcpy((void *)a2, v15->ai_addr, ai_addrlen);
    }
    freeaddrinfo(v11);
    return 0;
  }
  return 4294967289;
}

const char *__cdecl sasl_errstring(int saslerr, const char *langlist, const char **outlang)
{
  if (outlang) {
    *outlang = "en-us";
  }
  int v3 = saslerr + 32;
  uint64_t result = "another step is needed in authentication";
  switch(v3)
  {
    case 0:
      uint64_t result = "channel binding failure";
      break;
    case 1:
    case 7:
      goto LABEL_7;
    case 2:
      uint64_t result = "sasl_setpass can't store a property because of a constraint violation";
      break;
    case 3:
      uint64_t result = "sasl_setpass needs old password in order to perform password change";
      break;
    case 4:
      uint64_t result = "user supplied passwords are not permitted";
      break;
    case 5:
      uint64_t result = "passphrase is too weak for security policy";
      break;
    case 6:
      uint64_t result = "user exists, but no verifier for user";
      break;
    case 8:
      uint64_t result = "remote authentication server unavailable";
      break;
    case 9:
      uint64_t result = "version mismatch with plug-in";
      break;
    case 10:
      uint64_t result = "requested change was not needed";
      break;
    case 11:
      uint64_t result = "passphrase locked";
      break;
    case 12:
      uint64_t result = "user not found";
      break;
    case 13:
      uint64_t result = "account disabled";
      break;
    case 14:
      uint64_t result = "passphrase expired, has to be reset";
      break;
    case 15:
      uint64_t result = "One time use of a plaintext password will enable requested mechanism for user";
      break;
    case 16:
      uint64_t result = "encryption needed to use mechanism";
      break;
    case 17:
      uint64_t result = "mechanism too weak for this user";
      break;
    case 18:
      uint64_t result = "authorization failure";
      break;
    case 19:
      uint64_t result = "authentication failure";
      break;
    case 20:
      uint64_t result = "SASL library is not initialized";
      break;
    case 21:
      uint64_t result = "mechanism doesn't support requested feature";
      break;
    case 22:
      uint64_t result = "server failed mutual authentication step";
      break;
    case 23:
      uint64_t result = "integrity check failed";
      break;
    case 24:
      uint64_t result = "transient failure (e.g., weak key)";
      break;
    case 25:
      uint64_t result = "invalid parameter supplied";
      break;
    case 26:
      uint64_t result = "can't request information until later in exchange";
      break;
    case 27:
      uint64_t result = "bad protocol / cancel";
      break;
    case 28:
      uint64_t result = "no mechanism available";
      break;
    case 29:
      uint64_t result = "overflowed buffer";
      break;
    case 30:
      uint64_t result = "no memory available";
      break;
    case 31:
      uint64_t result = "generic failure";
      break;
    case 32:
      uint64_t result = "successful result";
      break;
    case 33:
      return result;
    case 34:
      uint64_t result = "needs user interaction";
      break;
    default:
      if ("another step is needed in authentication" == -100) {
        uint64_t result = "error when parsing configuration file";
      }
      else {
LABEL_7:
      }
        uint64_t result = "undefined error!";
      break;
  }
  return result;
}

const char *__cdecl sasl_errdetail(const char *conn)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (conn)
  {
    uint64_t v2 = conn;
    *(void *)&long long v3 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v16 = v3;
    long long v17 = v3;
    long long v14 = v3;
    long long v15 = v3;
    long long v12 = v3;
    long long v13 = v3;
    *(_OWORD *)__str = v3;
    long long v11 = v3;
    int v4 = *((_DWORD *)conn + 600);
    uint64_t v5 = sasl_errstring(v4, v1, 0);
    if (v4 == -20) {
      int v6 = -13;
    }
    else {
      int v6 = v4;
    }
    snprintf(__str, 0x80uLL, "SASL(%d): %s: ", v6, v5);
    int v7 = strlen(__str);
    unint64_t v8 = v7 + strlen(*((const char **)v2 + 301)) + 12;
    int v9 = _buf_alloc((uint64_t *)v2 + 302, (unint64_t *)v2 + 304, v8);
    conn = 0;
    if (!v9)
    {
      snprintf(*((char **)v2 + 302), v8, "%s%s", __str, *((const char **)v2 + 301));
      return (const char *)*((void *)v2 + 302);
    }
  }
  return conn;
}

uint64_t _sasl_conn_getopt(uint64_t a1, uint64_t a2, char *__s1, const char **a4, _DWORD *a5)
{
  if (!a1) {
    return 4294967289;
  }
  uint64_t v10 = *(void *)(a1 + 2368);
  if (v10)
  {
    for (uint64_t i = (void *)(v10 + 16); ; i += 3)
    {
      uint64_t v12 = *(i - 2);
      if (v12 == 1)
      {
        uint64_t result = ((uint64_t (*)(void, uint64_t, char *, const char **, _DWORD *))*(i - 1))(*i, a2, __s1, a4, a5);
        if (!result) {
          return result;
        }
      }
      else if (!v12)
      {
        break;
      }
    }
  }
  long long v14 = *(void **)(a1 + 2376);
  return _sasl_global_getopt(v14, a2, __s1, a4, a5);
}

uint64_t _sasl_syslog(uint64_t a1, int a2, const char *a3)
{
  if (!a1 || *(_DWORD *)a1 != 1 || *(_DWORD *)(*(void *)(a1 + 4576) + 72) >= a2)
  {
    int v3 = 35;
    switch(a2)
    {
      case 0:
        return 0;
      case 1:
        goto LABEL_8;
      case 2:
      case 4:
        int v3 = 37;
        goto LABEL_8;
      case 3:
        int v3 = 36;
        goto LABEL_8;
      default:
        int v3 = 39;
LABEL_8:
        syslog(v3, "%s", a3);
        break;
    }
  }
  return 0;
}

uint64_t _sasl_getsimple(uint64_t a1, int a2, char **a3, size_t *a4)
{
  if (a2 != 16386 || a1 == 0 || a3 == 0) {
    return 4294967289;
  }
  int v9 = getenv("USER");
  if (!v9)
  {
    int v9 = getenv("USERNAME");
    if (!v9) {
      return 0xFFFFFFFFLL;
    }
  }
  *a3 = v9;
  if (!a4) {
    return 0;
  }
  size_t v10 = strlen(v9);
  uint64_t result = 0;
  *a4 = v10;
  return result;
}

uint64_t _sasl_verifyfile()
{
  return 0;
}

uint64_t _sasl_proxy_policy(sasl_conn_t *conn, int a2, unsigned char *__s2, size_t __n, void *__s1, int a6)
{
  if (!conn) {
    return 4294967289;
  }
  if (!__s2) {
    return 0;
  }
  if (!*__s2) {
    return 0;
  }
  if (!__s1 || __n != a6 || (uint64_t result = memcmp(__s1, __s2, __n), result))
  {
    sasl_seterror(conn, 0, "Requested identity not authenticated identity", __n);
    uint64_t result = 4294967283;
    *((_DWORD *)conn + 600) = -13;
  }
  return result;
}

uint64_t _sasl_log(uint64_t result, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v39 = 0;
  unint64_t v40 = 100;
  if (a3)
  {
    long long v11 = (sasl_conn_t *)result;
    uint64_t result = _sasl_allocation_utils(250);
    uint64_t v41 = result;
    if (result)
    {
      unsigned int v35 = a2;
      unint64_t v37 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v38 = (uint64_t (*)())0xAAAAAAAAAAAAAAAALL;
      size_t v12 = strlen(a3);
      if (!_sasl_getcallback(v11, 2, &v38, &v37) && v38)
      {
        int v36 = (int *)&a9;
        if (v12)
        {
          size_t v14 = 0;
          do
          {
            if (a3[v14] == 37)
            {
              uint64_t v15 = 0;
              unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
              char v45 = -86;
              memset(__str, 170, 21);
              long long v16 = &a3[v14 + 1];
              char __format = 37;
              while (1)
              {
                int v17 = v16[v15];
                char v18 = v16[v15];
                if (v17 > 99) {
                  break;
                }
                switch(v17)
                {
                  case '%':
                    uint64_t v26 = v39;
                    uint64_t v27 = v39 + 1;
                    if (_buf_alloc(&v41, &v40, v39 + 1)) {
                      goto LABEL_37;
                    }
                    *(unsigned char *)(v41 + v26) = 37;
                    uint64_t v39 = v27;
                    goto LABEL_31;
                  case 'X':
LABEL_22:
                    uint64_t v23 = &__format + v15;
                    v23[1] = v18;
                    v23[2] = 0;
                    int v24 = (unsigned int *)v36;
                    v36 += 2;
                    snprintf(__str, 0x14uLL, &__format, *v24);
                    goto LABEL_23;
                  case 'c':
                    int v28 = &__format + v15;
                    v28[1] = v18;
                    v28[2] = 0;
                    uint64_t v29 = v36;
                    v36 += 2;
                    __str[0] = *v29;
                    __str[1] = 0;
LABEL_23:
                    uint64_t v25 = __str;
                    goto LABEL_30;
                }
LABEL_17:
                uint64_t v19 = &__format + v15;
                v19[1] = v18;
                v19[2] = 0;
                uint64_t v20 = v15 + 1;
                if (v14 + v15 + 2 <= v12 && ++v15 < 9) {
                  continue;
                }
                v14 += v20 + 1;
                goto LABEL_32;
              }
              switch(v16[v15])
              {
                case 'm':
                  uint64_t v30 = v36;
                  v36 += 2;
                  uint64_t v31 = strerror(*v30);
                  break;
                case 'n':
                case 'p':
                case 'q':
                case 'r':
                case 't':
                case 'v':
                case 'w':
                case 'y':
                  goto LABEL_17;
                case 'o':
                case 'u':
                case 'x':
                  goto LABEL_22;
                case 's':
                  uint64_t v32 = (char **)v36;
                  v36 += 2;
                  uint64_t v25 = *v32;
                  goto LABEL_30;
                case 'z':
                  int v33 = v36;
                  v36 += 2;
                  uint64_t v31 = (char *)sasl_errstring(*v33, v13, 0);
                  break;
                default:
                  if (v17 != 100 && v17 != 105) {
                    goto LABEL_17;
                  }
                  goto LABEL_22;
              }
              uint64_t v25 = v31;
LABEL_30:
              if (_sasl_add_string(&v41, &v40, &v39, v25)) {
                goto LABEL_37;
              }
LABEL_31:
              v14 += v15 + 2;
            }
            else
            {
              uint64_t v21 = v39;
              uint64_t v22 = v39 + 1;
              if (_buf_alloc(&v41, &v40, v39 + 1)) {
                goto LABEL_37;
              }
              *(unsigned char *)(v41 + v21) = a3[v14];
              uint64_t v39 = v22;
              ++v14;
            }
LABEL_32:
            ;
          }
          while (v14 < v12);
          uint64_t v34 = v39;
        }
        else
        {
          uint64_t v34 = 0;
        }
        if (!_buf_alloc(&v41, &v40, v34 + 1))
        {
          *(unsigned char *)(v41 + v34) = 0;
          ((void (*)(unint64_t, void))v38)(v37, v35);
        }
      }
LABEL_37:
      uint64_t result = v41;
      if (v41) {
        return off_1EB527668(v41);
      }
    }
  }
  return result;
}

uint64_t *_sasl_find_getpath_callback(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = *result;
    if (*result)
    {
      while (v1 != 3)
      {
        uint64_t v2 = result[3];
        result += 3;
        uint64_t v1 = v2;
        if (!v2) {
          goto LABEL_5;
        }
      }
    }
    else
    {
LABEL_5:
      uint64_t result = 0;
    }
  }
  if (!result) {
    return (uint64_t *)&default_getpath_cb;
  }
  return result;
}

uint64_t *_sasl_find_verifyfile_callback(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = *result;
    if (*result)
    {
      while (v1 != 4)
      {
        uint64_t v2 = result[3];
        result += 3;
        uint64_t v1 = v2;
        if (!v2) {
          goto LABEL_5;
        }
      }
    }
    else
    {
LABEL_5:
      uint64_t result = 0;
    }
  }
  if (!result) {
    return (uint64_t *)&_sasl_find_verifyfile_callback_default_verifyfile_cb;
  }
  return result;
}

uint64_t _sasl_get_errorbuf(uint64_t result, void *a2, void *a3)
{
  *a2 = result + 2408;
  *a3 = result + 2424;
  return result;
}

uint64_t _sasl_build_mechlist()
{
  uint64_t v0 = _sasl_client_mechs();
  size_t v14 = (const char **)v0;
  uint64_t v1 = _sasl_server_mechs();
  uint64_t v2 = v1;
  if (v0)
  {
    if (!v1)
    {
      uint64_t v2 = v0;
      goto LABEL_16;
    }
    do
    {
      uint64_t v3 = *(void *)(v2 + 8);
      int v4 = v14;
      if (v14)
      {
        uint64_t v5 = *(const char **)v2;
        while (1)
        {
          int v6 = v4;
          if (!strcmp(*v4, v5)) {
            break;
          }
          int v4 = (const char **)v6[1];
          if (!v4)
          {
            int v7 = v6 + 1;
            goto LABEL_9;
          }
        }
        off_1EB527668(v2);
      }
      else
      {
        int v7 = &v14;
LABEL_9:
        *int v7 = v2;
        *(void *)(v2 + 8) = 0;
      }
      uint64_t v2 = v3;
    }
    while (v3);
    uint64_t v2 = (uint64_t)v14;
  }
  if (!v2)
  {
    printf("no olist");
    return 0xFFFFFFFFLL;
  }
LABEL_16:
  size_t v9 = 8;
  uint64_t v10 = v2;
  do
  {
    uint64_t v10 = *(void *)(v10 + 8);
    v9 += 8;
  }
  while (v10);
  if (global_mech_list)
  {
    off_1EB527668(global_mech_list);
    global_mech_list = 0;
  }
  long long v11 = (void *)_sasl_allocation_utils(v9);
  global_mech_list = (uint64_t)v11;
  if (!v11) {
    return 4294967294;
  }
  bzero(v11, v9);
  uint64_t v12 = 0;
  do
  {
    uint64_t v13 = *(void *)(v2 + 8);
    *(void *)(global_mech_list + v12) = *(void *)v2;
    off_1EB527668(v2);
    v12 += 8;
    uint64_t v2 = v13;
  }
  while (v13);
  return 0;
}

const char **sasl_global_listmech(void)
{
  return (const char **)global_mech_list;
}

BOOL _sasl_is_equal_mech(const char *a1, char *__s, unint64_t a3, int *a4)
{
  size_t v5 = a3;
  if (a3 >= 6 && !strcasecmp(&a1[a3 - 5], "-PLUS"))
  {
    int v8 = 1;
    v5 -= 5;
  }
  else
  {
    int v8 = 0;
  }
  *a4 = v8;
  return v5 >= strlen(__s) && strncasecmp(a1, __s, v5) == 0;
}

uint64_t _sasl_getpath(uint64_t a1, uint64_t *a2)
{
  if (!a2) {
    return 4294967289;
  }
  uint64_t v3 = default_plugin_path;
  if (default_plugin_path)
  {
LABEL_3:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  default_unix_path = _sasl_get_default_unix_path("SASL_PATH", (uint64_t)"");
  uint64_t result = _sasl_strdup(default_unix_path, (char **)&default_plugin_path, 0);
  if (!result)
  {
    uint64_t v3 = default_plugin_path;
    goto LABEL_3;
  }
  return result;
}

char *_sasl_get_default_unix_path(const char *a1, uint64_t a2)
{
  uid_t v4 = getuid();
  if (v4 == geteuid() && (gid_t v5 = getgid(), v5 == getegid())) {
    uint64_t result = getenv(a1);
  }
  else {
    uint64_t result = 0;
  }
  if (!result) {
    return (char *)a2;
  }
  return result;
}

uint64_t _sasl_getconfpath(uint64_t a1, uint64_t *a2)
{
  if (!a2) {
    return 4294967289;
  }
  uint64_t v3 = default_conf_path;
  if (default_conf_path)
  {
LABEL_3:
    uint64_t result = 0;
    *a2 = v3;
    return result;
  }
  default_unix_path = _sasl_get_default_unix_path("SASL_CONF_PATH", (uint64_t)"/etc/sasl");
  uint64_t result = _sasl_strdup(default_unix_path, (char **)&default_conf_path, 0);
  if (!result)
  {
    uint64_t v3 = default_conf_path;
    goto LABEL_3;
  }
  return result;
}

void _sasl_encodev_cold_1()
{
  __assert_rtn("_sasl_encodev", "common.c", 370, "conn->oparams.encode != NULL");
}

uint64_t sasl_config_getstring(char *__s1, uint64_t a2)
{
  uint64_t v3 = nconfiglist;
  if (nconfiglist >= 1)
  {
    int v5 = *__s1;
    for (uint64_t i = configlist + 8; ; i += 16)
    {
      int v7 = *(const char **)(i - 8);
      if (v5 == *(unsigned __int8 *)v7 && !strcmp(__s1, v7)) {
        break;
      }
      if (!--v3) {
        return a2;
      }
    }
    return *(void *)i;
  }
  return a2;
}

uint64_t crammd5_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &crammd5_server_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "CRAM version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t crammd5_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &crammd5_client_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "CRAM version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t crammd5_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(16);
  if (v7)
  {
    int v8 = (void *)v7;
    uint64_t result = 0;
    *int v8 = 0;
    v8[1] = 0;
    *(_DWORD *)int v8 = 1;
    *a5 = v8;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/cram.c near line %d", 110);
    return 4294967294;
  }
  return result;
}

uint64_t crammd5_server_mech_step(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  *a6 = 0;
  if (!a1) {
    return 4294967291;
  }
  if (a4 >= 0x401)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "CRAM-MD5 input longer than 1024 bytes");
    return 4294967291;
  }
  if (*(_DWORD *)a1 != 2)
  {
    if (*(_DWORD *)a1 != 1)
    {
      (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 1, "Invalid CRAM-MD5 server step %d\n", *(_DWORD *)a1);
      return 0xFFFFFFFFLL;
    }
    *(void *)(a1 + 8) = 0;
    if (a4)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "CRAM-MD5 does not accept inital data");
      return 4294967291;
    }
    time_t v25 = time(0);
    uint64_t v26 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(15);
    uint64_t v27 = v26;
    if (v26) {
      snprintf(v26, 0xFuLL, "%lu", v25 % 0xFFFFFF);
    }
    BYTE4(v49[0]) = -86;
    LODWORD(v49[0]) = -1431655766;
    (*(void (**)(void, _OWORD *, uint64_t))(*(void *)(a2 + 80) + 184))(*(void *)(*(void *)(a2 + 80) + 16), v49, 4);
    int v28 = LOBYTE(v49[0]);
    int v29 = BYTE1(v49[0]);
    int v30 = BYTE2(v49[0]);
    int v31 = BYTE3(v49[0]);
    uint64_t v32 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(15);
    if (v32 && (int v33 = v32, sprintf(v32, "%u", (v28 << 24) | (v29 << 16) | (v30 << 8) | v31), v27))
    {
      uint64_t v34 = *(void *)(a1 + 8);
      if (v34)
      {
LABEL_31:
        *a5 = v34;
        *a6 = strlen(*(const char **)(a1 + 8));
        (*(void (**)(const char *))(*(void *)(a2 + 80) + 64))(v27);
        (*(void (**)(const char *))(*(void *)(a2 + 80) + 64))(v33);
        *(_DWORD *)a1 = 2;
        return 1;
      }
      unsigned int v35 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(201);
      *(void *)(a1 + 8) = v35;
      if (v35)
      {
        snprintf(v35, 0xC8uLL, "<%s.%s@%s>", v33, v27, *(const char **)(a2 + 16));
        uint64_t v34 = *(void *)(a1 + 8);
        goto LABEL_31;
      }
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/cram.c near line %d", 214);
    }
    else
    {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/cram.c near line %d", 204);
    }
    return 4294967294;
  }
  uint64_t v14 = 0;
  uint64_t v47 = 0;
  long long v55 = xmmword_1E63F0268;
  uint64_t v56 = 0;
  unint64_t v54 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v15 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v52 = v15;
  long long v53 = v15;
  long long v50 = v15;
  long long v51 = v15;
  v49[9] = v15;
  v49[10] = v15;
  v49[7] = v15;
  v49[8] = v15;
  v49[5] = v15;
  v49[6] = v15;
  v49[3] = v15;
  v49[4] = v15;
  v49[1] = v15;
  v49[2] = v15;
  v49[0] = v15;
  v48[0] = 0xAAAAAAAAAAAAAAAALL;
  v48[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v45 = v15;
  long long v46 = v15;
  do
  {
    if ((int)(a4 + v14) < 2)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "need authentication name");
      return 4294967291;
    }
    int v16 = a3[a4 - 1 + v14--];
  }
  while (v16 != 32);
  int v17 = (unsigned char *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(a4 + v14 + 1);
  if (!v17)
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/cram.c near line %d", 271);
    return 4294967294;
  }
  char v18 = v17;
  uint64_t v19 = a4 - 1;
  memcpy(v17, a3, v19 + v14 + 1);
  v18[v19 + 1 + v14] = 0;
  uint64_t v20 = (*(uint64_t (**)(void, long long *))(*(void *)(a2 + 80) + 296))(*(void *)(a2 + 152), &v55);
  if (v20
    || (uint64_t v20 = (*(uint64_t (**)(void, unsigned char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), v18, 0, 3, a7), v20))
  {
    uint64_t v9 = v20;
    uint64_t v21 = 0;
    goto LABEL_17;
  }
  uint64_t v36 = (*(uint64_t (**)(void, long long *, long long *))(*(void *)(a2 + 80) + 312))(*(void *)(a2 + 152), &v55, &v50);
  if ((v36 & 0x80000000) != 0) {
    goto LABEL_48;
  }
  if (!(void)v50 || !*((void *)&v50 + 1))
  {
    if (*((void *)&v51 + 1) && (void)v52)
    {
      uint64_t v21 = 0;
      long long v41 = *(_OWORD *)(*(void *)v52 + 16);
      long long v45 = *(_OWORD *)*(void *)v52;
      long long v46 = v41;
      goto LABEL_45;
    }
LABEL_48:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "no secret in database");
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    if (*(void *)(a2 + 136)) {
      uint64_t v9 = 4294967279;
    }
    else {
      uint64_t v9 = 4294967276;
    }
    goto LABEL_18;
  }
  uint64_t v9 = v36;
  size_t v37 = strlen(**((const char ***)&v50 + 1));
  uint64_t v38 = *(void *)(a2 + 80);
  if (!v37)
  {
    (*(void (**)(void, void, const char *))(v38 + 264))(*(void *)(v38 + 8), 0, "empty secret");
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v9 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  size_t v39 = v37;
  uint64_t v40 = (*(uint64_t (**)(size_t))(v38 + 40))(v37 + 16);
  uint64_t v21 = (unsigned int *)v40;
  uint64_t v47 = v40;
  if (v40)
  {
    *(void *)uint64_t v40 = v39;
    strncpy((char *)(v40 + 8), **((const char ***)&v50 + 1), v39 + 1);
    (*(void (**)(long long *, unsigned int *, void))(*(void *)(a2 + 80) + 152))(&v45, v21 + 2, *v21);
LABEL_45:
    (*(void (**)(void, void))(*(void *)(a2 + 80) + 360))(*(void *)(a2 + 152), v55);
    (*(void (**)(_OWORD *, long long *))(*(void *)(a2 + 80) + 160))(v49, &v45);
    int v42 = *(const char **)(a1 + 8);
    size_t v43 = strlen(v42);
    (*(void (**)(_OWORD *, const char *, size_t))(*(void *)(a2 + 80) + 112))(v49, v42, v43);
    (*(void (**)(void *, _OWORD *))(*(void *)(a2 + 80) + 144))(v48, v49);
    uint64_t v22 = (const char *)convert16((uint64_t)v48, *(void *)(a2 + 80));
    size_t v44 = strlen(v22);
    if (v44 <= ~v14 && !strncmp(v22, &a3[v14 + 2 + v19], v44))
    {
      uint64_t v9 = 0;
      *(_DWORD *)a7 = 1;
      *(_DWORD *)(a7 + 136) = 0;
      *(_OWORD *)(a7 + 32) = 0u;
      *(_OWORD *)(a7 + 48) = 0u;
      *(void *)(a7 + 64) = 0;
    }
    else
    {
      (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 1, "incorrect digest response");
      uint64_t v9 = 4294967283;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v22 = 0;
LABEL_18:
  (*(void (**)(unsigned char *))(*(void *)(a2 + 80) + 64))(v18);
  if (v21) {
    _plug_free_secret(*(unsigned int **)(a2 + 80), &v47);
  }
  if (v22) {
    (*(void (**)(const char *))(*(void *)(a2 + 80) + 64))(v22);
  }
  return v9;
}

uint64_t crammd5_server_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 8)) {
      _plug_free_string(a2, (const char **)(result + 8));
    }
    uid_t v4 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v4(v3);
  }
  return result;
}

uint64_t convert16(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 40))(33);
  if (result)
  {
    uint64_t v4 = 0;
    int v5 = (unsigned char *)(result + 1);
    do
    {
      *(v5 - 1) = convert16_hex[(unint64_t)*(unsigned __int8 *)(a1 + v4) >> 4];
      unsigned char *v5 = convert16_hex[*(unsigned char *)(a1 + v4) & 0xF];
      v5 += 2;
      ++v4;
    }
    while (v4 != 16);
    *(unsigned char *)(result + 32) = 0;
  }
  return result;
}

uint64_t crammd5_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(16);
  if (v5)
  {
    int v6 = (void *)v5;
    uint64_t result = 0;
    *int v6 = 0;
    v6[1] = 0;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/cram.c near line %d", 513);
    return 4294967294;
  }
  return result;
}

uint64_t crammd5_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5, void *a6, _DWORD *a7, uint64_t a8)
{
  int v29 = 0;
  uint64_t v30 = 0;
  int v28 = 0;
  uint64_t v27 = 0;
  *a6 = 0;
  *a7 = 0;
  if (a4 < 0x401)
  {
    if (*(_DWORD *)(a2 + 80) <= *(_DWORD *)(a2 + 112))
    {
      if (*(void *)(a8 + 16))
      {
        int v17 = 0;
      }
      else
      {
        uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 16386, 1, &v30, a5);
        int v17 = simple;
        uint64_t password = simple;
        if ((simple & 0xFFFFFFFD) != 0) {
          return password;
        }
      }
      uint64_t password = _plug_get_password(*(void *)(a2 + 24), &v29, &v28, (const void ***)a5);
      if ((password & 0xFFFFFFFD) == 0)
      {
        if (a5 && *a5)
        {
          (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
          *a5 = 0;
        }
        if (v17 == 2 || password == 2)
        {
          if (v17 == 2) {
            int v24 = "Please enter your authentication name";
          }
          else {
            int v24 = 0;
          }
          if (password == 2) {
            time_t v25 = "Please enter your password";
          }
          else {
            time_t v25 = 0;
          }
          uint64_t password = _plug_make_prompts(*(void *)(a2 + 24), a5, 0, 0, (uint64_t)v24, 0, (uint64_t)v25, 0, 0, 0, 0, 0, 0, 0);
          if (!password) {
            return 2;
          }
        }
        else
        {
          if (!v29)
          {
            (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/cram.c near line %d", 633);
            return 4294967289;
          }
          uint64_t password = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v30, 0, 3, a8);
          if (!password)
          {
            hashed = make_hashed((unsigned int *)v29, a3, a4, *(void *)(a2 + 24));
            uint64_t v27 = (const char *)hashed;
            if (hashed)
            {
              uint64_t v19 = (const char *)hashed;
              size_t v20 = strlen(*(const char **)(a8 + 16));
              size_t v21 = v20 + 63;
              uint64_t password = _plug_buf_alloc(*(void *)(a2 + 24), (uint64_t *)a1, (unsigned int *)(a1 + 8), (int)v20 + 63);
              if (!password)
              {
                snprintf(*(char **)a1, v21, "%s %s", *(const char **)(a8 + 16), v19);
                uint64_t v22 = *(const char **)a1;
                *a6 = *(void *)a1;
                *a7 = strlen(v22);
                *(_DWORD *)a8 = 1;
                *(_DWORD *)(a8 + 136) = 0;
                *(void *)(a8 + 64) = 0;
                *(_OWORD *)(a8 + 32) = 0u;
                *(_OWORD *)(a8 + 48) = 0u;
              }
              _plug_free_string(*(void *)(a2 + 24), &v27);
            }
            else
            {
              (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "whoops, make_hashed failed us this time");
              uint64_t password = 0xFFFFFFFFLL;
            }
          }
        }
        if (v28) {
          _plug_free_secret(*(unsigned int **)(a2 + 24), &v29);
        }
      }
    }
    else
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "SSF requested of CRAM-MD5 plugin");
      return 4294967281;
    }
  }
  else
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "CRAM-MD5 input longer than 1024 bytes");
    return 4294967291;
  }
  return password;
}

void *crammd5_client_mech_dispose(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*result) {
      (*(void (**)(void))(a2 + 64))();
    }
    uint64_t v4 = *(uint64_t (**)(void *))(a2 + 64);
    return (void *)v4(v3);
  }
  return result;
}

unsigned int *make_hashed(unsigned int *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[3] = *MEMORY[0x1E4F143B8];
  memset(v5, 170, 24);
  if (result)
  {
    (*(void (**)(uint64_t, uint64_t, unsigned int *, void, void *))(a4 + 128))(a2, a3, result + 2, *result, v5);
    return (unsigned int *)convert16((uint64_t)v5, a4);
  }
  return result;
}

uint64_t DigestCalcResponse(uint64_t a1, uint64_t a2, const char *a3, int a4, const char *a5, const char *a6, const char *a7, const char *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  unint64_t v32 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[3] = v18;
  v31[4] = v18;
  v31[1] = v18;
  v31[2] = v18;
  v31[0] = v18;
  memset(v30, 170, 17);
  memset(v29, 170, 17);
  char v28 = -86;
  v27[0] = v18;
  v27[1] = v18;
  memset(__s, 170, 10);
  (*(void (**)(_OWORD *))(a1 + 104))(v31);
  if (a8)
  {
    size_t v19 = strlen(a8);
    (*(void (**)(_OWORD *, const char *, size_t))(a1 + 112))(v31, a8, v19);
  }
  (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
  size_t v20 = strlen(a7);
  (*(void (**)(_OWORD *, const char *, size_t))(a1 + 112))(v31, a7, v20);
  if (strcasecmp(a6, "auth"))
  {
    (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
    (*(void (**)(_OWORD *, uint64_t, uint64_t))(a1 + 112))(v31, a9, 32);
  }
  (*(void (**)(void *, _OWORD *))(a1 + 120))(v30, v31);
  CvtHex((uint64_t)v30, (uint64_t)v27);
  (*(void (**)(_OWORD *))(a1 + 104))(v31);
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(a1 + 112))(v31, a2, 32);
  (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
  size_t v21 = strlen(a3);
  (*(void (**)(_OWORD *, const char *, size_t))(a1 + 112))(v31, a3, v21);
  (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
  if (*a6)
  {
    __sprintf_chk(__s, 0, 0xAuLL, "%08x", a4);
    size_t v22 = strlen(__s);
    (*(void (**)(_OWORD *, char *, size_t))(a1 + 112))(v31, __s, v22);
    (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
    size_t v23 = strlen(a5);
    (*(void (**)(_OWORD *, const char *, size_t))(a1 + 112))(v31, a5, v23);
    (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
    size_t v24 = strlen(a6);
    (*(void (**)(_OWORD *, const char *, size_t))(a1 + 112))(v31, a6, v24);
    (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v31, &COLON, 1);
  }
  (*(void (**)(_OWORD *, _OWORD *, uint64_t))(a1 + 112))(v31, v27, 32);
  (*(void (**)(void *, _OWORD *))(a1 + 120))(v29, v31);
  return CvtHex((uint64_t)v29, a10);
}

uint64_t CvtHex(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = (unsigned char *)(a2 + 1);
  do
  {
    if (*(unsigned __int8 *)(result + v2) >= 0xA0u) {
      char v4 = (*(unsigned char *)(result + v2) >> 4) + 87;
    }
    else {
      char v4 = (*(unsigned char *)(result + v2) >> 4) | 0x30;
    }
    *(v3 - 1) = v4;
    unsigned int v5 = *(unsigned char *)(result + v2) & 0xF;
    char v6 = v5 + 87;
    if (v5 < 0xA) {
      char v6 = *(unsigned char *)(result + v2) & 0xF | 0x30;
    }
    unsigned char *v3 = v6;
    v3 += 2;
    ++v2;
  }
  while (v2 != 16);
  *(unsigned char *)(a2 + 32) = 0;
  return result;
}

uint64_t enc_rc4(uint64_t a1, char *a2, unsigned int a3, char *a4, unsigned char *a5, _DWORD *a6)
{
  *a6 = a3 + 10;
  rc4_encrypt(*(void *)(a1 + 296), a2, a5, a3);
  rc4_encrypt(*(void *)(a1 + 296), a4, &a5[a3], 10);
  return 0;
}

uint64_t dec_rc4(uint64_t a1, char *a2, int a3, uint64_t a4, unsigned char *a5, _DWORD *a6)
{
  uint64_t v6 = *(void *)(a1 + 304);
  int v7 = *(_DWORD *)(v6 + 256);
  int v8 = *(_DWORD *)(v6 + 260);
  if (a3)
  {
    uint64_t v9 = &a2[a3];
    do
    {
      BOOL v10 = -++v7 < 0;
      int v7 = v7;
      if (!v10) {
        int v7 = --(char)v7;
      }
      int v11 = *(unsigned __int8 *)(v6 + v7);
      int v12 = v8 + v11;
      int v13 = v12;
      int v14 = -v12;
      if (v14 >= 0) {
        int v8 = -v14;
      }
      else {
        int v8 = v13;
      }
      *(unsigned char *)(v6 + v7) = *(unsigned char *)(v6 + v8);
      *(unsigned char *)(v6 + v8) = v11;
      char v15 = *a2++;
      *a5++ = v15 ^ *(unsigned char *)(v6 + (*(unsigned char *)(v6 + v7) + v11));
    }
    while (a2 < v9);
  }
  *(_DWORD *)(v6 + 256) = v7;
  *(_DWORD *)(v6 + 260) = v8;
  *a6 = a3 - 10;
  return 0;
}

uint64_t init_rc4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1[19] + 40))(264);
  a1[37] = v6;
  if (!v6) {
    return 4294967294;
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(a1[19] + 40))(264);
  a1[38] = v7;
  if (!v7) {
    return 4294967294;
  }
  uint64_t v8 = 0;
  int8x16_t v9 = (int8x16_t)xmmword_1BF178010;
  uint64_t v10 = a1[37];
  v11.i64[0] = 0x1010101010101010;
  v11.i64[1] = 0x1010101010101010;
  do
  {
    *(int8x16_t *)(v10 + v8) = v9;
    v8 += 16;
    int8x16_t v9 = vaddq_s8(v9, v11);
  }
  while (v8 != 256);
  uint64_t v12 = 0;
  int v13 = 0;
  do
  {
    int v14 = *(unsigned __int8 *)(v10 + v12);
    v13 += v14 + *(unsigned __int8 *)(a2 + (v12 & 0xF));
    *(unsigned char *)(v10 + v12) = *(unsigned char *)(v10 + v13);
    *(unsigned char *)(v10 + v13) = v14;
    ++v12;
  }
  while (v12 != 256);
  uint64_t v15 = 0;
  *(void *)(v10 + 256) = 0;
  int8x16_t v16 = (int8x16_t)xmmword_1BF178010;
  uint64_t v17 = a1[38];
  v18.i64[0] = 0x1010101010101010;
  v18.i64[1] = 0x1010101010101010;
  do
  {
    *(int8x16_t *)(v17 + v15) = v16;
    v15 += 16;
    int8x16_t v16 = vaddq_s8(v16, v18);
  }
  while (v15 != 256);
  uint64_t v19 = 0;
  int v20 = 0;
  do
  {
    int v21 = *(unsigned __int8 *)(v17 + v19);
    v20 += v21 + *(unsigned __int8 *)(a3 + (v19 & 0xF));
    *(unsigned char *)(v17 + v19) = *(unsigned char *)(v17 + v20);
    *(unsigned char *)(v17 + v20) = v21;
    ++v19;
  }
  while (v19 != 256);
  uint64_t result = 0;
  *(void *)(v17 + 256) = 0;
  return result;
}

uint64_t free_rc4(void *a1)
{
  if (a1[37]) {
    (*(void (**)(void))(a1[19] + 64))();
  }
  uint64_t result = a1[38];
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(a1[19] + 64);
    return v3();
  }
  return result;
}

uint64_t digestmd5_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  __str = 0;
  if (a2 < 4) {
    return 4294967273;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(a1 + 40))(40);
  if (!v10) {
    return 4294967294;
  }
  uint64_t v11 = v10;
  int v15 = -1431655766;
  *(_OWORD *)uint64_t v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(void *)(v10 + 32) = 0;
  *(_DWORD *)uint64_t v10 = 0;
  (*(void (**)(void, const char *, const char *, char **, int *))(a1 + 32))(*(void *)(a1 + 24), "DIGEST-MD5", "reauth_timeout", &__str, &v15);
  if (!__str)
  {
    uint64_t v12 = *(void *)(v11 + 8);
    if ((v12 & 0x8000000000000000) == 0) {
      goto LABEL_6;
    }
LABEL_11:
    *(void *)(v11 + 8) = 0;
    goto LABEL_12;
  }
  uint64_t v12 = 60 * strtol(__str, 0, 10);
  *(void *)(v11 + 8) = v12;
  if (v12 < 0) {
    goto LABEL_11;
  }
LABEL_6:
  if (!v12)
  {
LABEL_12:
    uint64_t result = 0;
    *(void *)off_1EB527D00 = v11;
    *a3 = 4;
    *a4 = &digestmd5_server_plugins;
    *a5 = 1;
    return result;
  }
  uint64_t v13 = (*(uint64_t (**)(void))(a1 + 72))();
  *(void *)(v11 + 16) = v13;
  if (!v13)
  {
    (*(void (**)(uint64_t))(a1 + 64))(v11);
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(v11 + 24) = 100;
  int v14 = (void *)(*(uint64_t (**)(uint64_t))(a1 + 40))(8800);
  *(void *)(v11 + 32) = v14;
  if (v14)
  {
    bzero(v14, 88 * *(unsigned int *)(v11 + 24));
    goto LABEL_12;
  }
  (*(void (**)(void))(a1 + 96))(*(void *)(v11 + 16));
  (*(void (**)(uint64_t))(a1 + 64))(v11);
  return 4294967294;
}

uint64_t digestmd5_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 < 4) {
    return 4294967273;
  }
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(a1 + 40))(40);
  if (!v10) {
    return 4294967294;
  }
  uint64_t v11 = v10;
  *(void *)(v10 + 32) = 0;
  *(_OWORD *)uint64_t v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_DWORD *)uint64_t v10 = 1;
  uint64_t v12 = (*(uint64_t (**)(void))(a1 + 72))();
  *(void *)(v11 + 16) = v12;
  if (v12)
  {
    *(_DWORD *)(v11 + 24) = 10;
    uint64_t v13 = (void *)(*(uint64_t (**)(uint64_t))(a1 + 40))(880);
    *(void *)(v11 + 32) = v13;
    if (v13)
    {
      bzero(v13, 88 * *(unsigned int *)(v11 + 24));
      uint64_t result = 0;
      *(void *)off_1EB527CA8 = v11;
      *a3 = 4;
      *a4 = &digestmd5_client_plugins;
      *a5 = 1;
      return result;
    }
    return 4294967294;
  }
  return 0xFFFFFFFFLL;
}

uint64_t rc4_encrypt(uint64_t result, char *a2, unsigned char *a3, int a4)
{
  int v4 = *(_DWORD *)(result + 256);
  int v5 = *(_DWORD *)(result + 260);
  if (a4)
  {
    uint64_t v6 = &a2[a4];
    do
    {
      BOOL v7 = -++v4 < 0;
      int v4 = v4;
      if (!v7) {
        int v4 = --(char)v4;
      }
      int v8 = *(unsigned __int8 *)(result + v4);
      int v9 = v5 + v8;
      int v10 = v9;
      int v11 = -v9;
      if (v11 >= 0) {
        int v5 = -v11;
      }
      else {
        int v5 = v10;
      }
      *(unsigned char *)(result + v4) = *(unsigned char *)(result + v5);
      *(unsigned char *)(result + v5) = v8;
      char v12 = *a2++;
      *a3++ = v12 ^ *(unsigned char *)(result + (*(unsigned char *)(result + v4) + v8));
    }
    while (a2 < v6);
  }
  *(_DWORD *)(result + 256) = v4;
  *(_DWORD *)(result + 260) = v5;
  return result;
}

uint64_t digestmd5_server_mech_new(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(336);
  if (!v8) {
    return 4294967294;
  }
  uint64_t v9 = v8;
  uint64_t result = 0;
  *(_OWORD *)(v9 + 304) = 0u;
  *(_OWORD *)(v9 + 320) = 0u;
  *(_OWORD *)(v9 + 272) = 0u;
  *(_OWORD *)(v9 + 288) = 0u;
  *(_OWORD *)(v9 + 240) = 0u;
  *(_OWORD *)(v9 + 256) = 0u;
  *(_OWORD *)(v9 + 208) = 0u;
  *(_OWORD *)(v9 + 224) = 0u;
  *(_OWORD *)(v9 + 176) = 0u;
  *(_OWORD *)(v9 + 192) = 0u;
  *(_OWORD *)(v9 + 144) = 0u;
  *(_OWORD *)(v9 + 160) = 0u;
  *(_OWORD *)(v9 + 112) = 0u;
  *(_OWORD *)(v9 + 128) = 0u;
  *(_OWORD *)(v9 + 80) = 0u;
  *(_OWORD *)(v9 + 96) = 0u;
  *(_OWORD *)(v9 + 48) = 0u;
  *(_OWORD *)(v9 + 64) = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)uint64_t v9 = 0u;
  *(void *)uint64_t v9 = 1;
  *(_DWORD *)(v9 + 8) = *(_DWORD *)(a2 + 220) & 0x10;
  *(void *)(v9 + 16) = *a1;
  *a5 = v9;
  return result;
}

uint64_t digestmd5_server_mech_step(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, const char **a5, _DWORD *a6, _OWORD *a7)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  *a6 = 0;
  uint64_t result = 4294967291;
  if (!a1 || a4 > 0x1000) {
    return result;
  }
  if (*(_DWORD *)a1 == 2)
  {
    return digestmd5_server_mech_step2(a1, a2, a3, a4, a5, a6, (uint64_t)a7);
  }
  if (*(_DWORD *)a1 != 1)
  {
    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(0, 1, "Invalid DIGEST-MD5 server step %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 8) || (unsigned int v13 = *(_DWORD *)(a2 + 104)) != 0)
  {
    unsigned int v14 = *(_DWORD *)(a2 + 100);
    unsigned int v15 = *(_DWORD *)(a2 + 128);
    BOOL v16 = v14 >= v15;
    unsigned int v17 = v14 - v15;
    if (!v16) {
      unsigned int v17 = 0;
    }
    *(_DWORD *)(a1 + 324) = v17;
    unsigned int v18 = *(_DWORD *)(a2 + 96);
    BOOL v16 = v18 >= v15;
    unsigned int v13 = v18 - v15;
    if (!v16) {
      unsigned int v13 = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 324) = 0;
  }
  *(_DWORD *)(a1 + 328) = v13;
  if (a3 && *(void *)(*(void *)(a1 + 16) + 8))
  {
    uint64_t result = digestmd5_server_mech_step2(a1, a2, a3, a4, a5, a6, (uint64_t)a7);
    if (!result) {
      return result;
    }
    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(0, 3, "DIGEST-MD5 reauth failed\n");
    a7[7] = 0u;
    a7[8] = 0u;
    a7[5] = 0u;
    a7[6] = 0u;
    a7[3] = 0u;
    a7[4] = 0u;
    a7[1] = 0u;
    a7[2] = 0u;
    *a7 = 0u;
    if (*(void *)(a1 + 40)) {
      (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
    }
    if (*(void *)(a1 + 32)) {
      (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
    }
    *(void *)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0;
  }
  memset(__b, 170, sizeof(__b));
  memset(__s, 170, sizeof(__s));
  *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v44 = v19;
  long long v45 = v19;
  *(_OWORD *)__str = v19;
  long long v43 = v19;
  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "DIGEST-MD5 server step 1");
  int v20 = *(char **)(a2 + 24);
  if (v20)
  {
    if (!*v20)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "user_realm is an empty string!");
      return 4294967289;
    }
  }
  else
  {
    int v20 = *(char **)(a2 + 16);
    if (!v20)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "no way to obtain domain");
      return 0xFFFFFFFFLL;
    }
  }
  __b[0] = 0;
  __s[0] = 0;
  unsigned int v21 = *(_DWORD *)(a1 + 328);
  if (!v21)
  {
    __strcat_chk();
    unsigned int v21 = *(_DWORD *)(a1 + 328);
  }
  if (v21 <= 1 && *(_DWORD *)(a1 + 324))
  {
    if (__b[0]) {
      __strcat_chk();
    }
    __strcat_chk();
  }
  unsigned int v41 = -1431655766;
  size_t v22 = available_ciphers;
  if (available_ciphers)
  {
    int v23 = 0;
    size_t v24 = &available_ciphers;
    do
    {
      unsigned int v25 = *((_DWORD *)v24 + 2);
      if (*(_DWORD *)(a1 + 328) <= v25 && *(_DWORD *)(a1 + 324) >= v25)
      {
        if (!v23)
        {
          if (__b[0]) {
            __strcat_chk();
          }
          __strcat_chk();
          size_t v22 = *v24;
        }
        size_t v26 = strlen(__s);
        if (v26 + strlen(v22) - 1023 < 0xFFFFFFFFFFFFFC00) {
          return 0xFFFFFFFFLL;
        }
        if (__s[0]) {
          __strcat_chk();
        }
        __strcat_chk();
        int v23 = 1;
      }
      uint64_t v27 = v24[7];
      v24 += 7;
      size_t v22 = v27;
    }
    while (v27);
  }
  if (!__b[0]) {
    return 4294967281;
  }
  nonce = (char *)create_nonce(*(void *)(a2 + 80));
  if (!nonce)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal erorr: failed creating a nonce");
    return 0xFFFFFFFFLL;
  }
  int v29 = nonce;
  unsigned int v41 = 0;
  *(void *)(a1 + 160) = 0;
  *(_DWORD *)(a1 + 168) = 0;
  if (add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "nonce", nonce, 1)|| add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "realm", v20, 1))
  {
    goto LABEL_50;
  }
  if (add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "qop", __b, 1))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: add_to_challenge 3 failed");
    return 0xFFFFFFFFLL;
  }
  if (__s[0]
    && add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "cipher", __s, 1))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: add_to_challenge 4 failed");
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 320)
    && add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "stale", "true", 0))
  {
LABEL_50:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: add_to_challenge failed");
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 104))
  {
    snprintf(__str, 0x40uLL, "%u", *(_DWORD *)(a2 + 104));
    if (add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "maxbuf", __str, 0))
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: add_to_challenge 5 failed");
      return 0xFFFFFFFFLL;
    }
  }
  int v30 = add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "charset", "utf-8", 0);
  uint64_t v31 = *(void *)(a2 + 80);
  if (v30)
  {
    (*(void (**)(void, void, const char *))(v31 + 264))(*(void *)(v31 + 8), 0, "internal error: add_to_challenge 6 failed");
    return 0xFFFFFFFFLL;
  }
  if (add_to_challenge(v31, (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v41, "algorithm", "md5-sess", 0))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: add_to_challenge 7 failed");
    return 0xFFFFFFFFLL;
  }
  if (*a6 >= 0x801u)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: challenge larger than 2048 bytes");
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 24) = 0;
  if (_plug_strdup(*(void *)(a2 + 80), v20, (char **)(a1 + 32), 0))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: out of memory when saving realm");
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 8)
    && (uint64_t v32 = *(void *)(a1 + 16), *(void *)(v32 + 8))
    && !(*(unsigned int (**)(void))(*(void *)(a2 + 80) + 80))(*(void *)(v32 + 16)))
  {
    char v34 = *v29;
    if (*v29)
    {
      unsigned int v35 = 0;
      uint64_t v36 = (unsigned __int8 *)(v29 + 1);
      do
      {
        unsigned int v35 = 2 * (v35 ^ v34);
        int v37 = *v36++;
        char v34 = v37;
      }
      while (v37);
    }
    else
    {
      unsigned int v35 = 0;
    }
    uint64_t v38 = *(void *)(a1 + 16);
    unsigned int v39 = v35 % *(_DWORD *)(v38 + 24);
    clear_reauth_entry(*(void *)(v38 + 32) + 88 * v39, 0, *(void *)(a2 + 80));
    uint64_t v40 = *(void *)(*(void *)(a1 + 16) + 32) + 88 * v39;
    *(void *)uint64_t v40 = 0;
    *(void *)(v40 + 8) = *(void *)(a1 + 32);
    *(void *)(a1 + 32) = 0;
    *(void *)(v40 + 16) = v29;
    *(_DWORD *)(v40 + 24) = 1;
    *(void *)(v40 + 32) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v39 + 40) = time(0);
    (*(void (**)(void))(*(void *)(a2 + 80) + 88))(*(void *)(*(void *)(a1 + 16) + 16));
  }
  else
  {
    *(void *)(a1 + 40) = v29;
    *(_DWORD *)(a1 + 48) = 1;
    *(void *)(a1 + 56) = 0;
    *(void *)(a1 + 312) = time(0);
  }
  uint64_t v33 = *(const char **)(a1 + 160);
  *a6 = strlen(v33);
  *a5 = v33;
  *(_DWORD *)a1 = 2;
  return 1;
}

uint64_t digestmd5_server_mech_dispose(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2) {
      return digestmd5_common_mech_dispose(a1, a2);
    }
  }
  return a1;
}

uint64_t digestmd5_common_mech_free(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, const char *))(a2 + 256))(*(void *)(a2 + 8), 5, "DIGEST-MD5 common mech free");
  *a1 = 0;
  if (v4)
  {
    if (*(_DWORD *)(v4 + 24))
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        clear_reauth_entry(*(void *)(v4 + 32) + v6, *(_DWORD *)v4, a2);
        ++v7;
        v6 += 88;
      }
      while (v7 < *(unsigned int *)(v4 + 24));
    }
    if (*(void *)(v4 + 32)) {
      (*(void (**)(void))(a2 + 64))();
    }
    if (*(void *)(v4 + 16))
    {
      (*(void (**)(void))(a2 + 96))();
      *(void *)(v4 + 16) = 0;
    }
    uint64_t v8 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v8(v4);
  }
  return result;
}

uint64_t digestmd5_server_mech_step2(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, const char **a5, _DWORD *a6, uint64_t a7)
{
  v138[3] = *MEMORY[0x1E4F143B8];
  v131 = 0;
  v132 = 0;
  v129 = 0;
  v130 = 0;
  v127 = 0;
  v128 = 0;
  __s1 = 0;
  v126 = 0;
  unint64_t v124 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v122 = v14;
  long long v123 = v14;
  unint64_t v120 = 0x10000;
  __s2 = 0;
  v118 = 0;
  uint64_t v119 = 0;
  memset(v138, 170, 17);
  memset(v137, 170, 17);
  v116 = 0;
  v117 = 0;
  v135[2] = v14;
  long long v136 = xmmword_1E63F0280;
  v135[0] = v14;
  v135[1] = v14;
  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "DIGEST-MD5 server step 2");
  if (!a4)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "input expected in DIGEST-MD5, step 2");
    size_t v17 = 0;
    uint64_t v18 = 4294967283;
    goto LABEL_113;
  }
  if (*(_DWORD *)(a1 + 8))
  {
    unsigned int v15 = *(long long **)(a2 + 176);
    if (!v15)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "missing HTTP request in DIGEST-MD5, step 2");
      BOOL v16 = 0;
      size_t v17 = 0;
      uint64_t v18 = 4294967289;
      goto LABEL_93;
    }
  }
  else
  {
    *(void *)&long long v122 = "AUTHENTICATE";
    *((void *)&v122 + 1) = 0;
    long long v123 = 0uLL;
    LODWORD(v124) = 0;
    unsigned int v15 = &v122;
  }
  uint64_t v114 = a7;
  uint64_t v115 = (uint64_t)v15;
  BOOL v16 = (char *)(*(uint64_t (**)(void))(*(void *)(a2 + 80) + 40))(a4 + 1);
  v116 = v16;
  memcpy(v16, a3, a4);
  v16[a4] = 0;
  if (!*v16)
  {
    int v19 = 0;
    int v21 = 0x10000;
LABEL_66:
    if (v131)
    {
      if (v128)
      {
        if (v19)
        {
          if (v127)
          {
            if (__s1)
            {
              if (__s2)
              {
                v110 = a6;
                if (!v129)
                {
                  _plug_strdup(*(void *)(a2 + 80), "", &v129, 0);
                  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "The client didn't send a realm, assuming empty string.");
                }
                uint64_t v40 = a1;
                uint64_t v42 = *(void *)(a1 + 40);
                unsigned int v41 = (char **)(a1 + 40);
                v107 = a5;
                if (!v42)
                {
                  uint64_t v44 = v40;
                  uint64_t v66 = *(void *)(v40 + 16);
                  if (!*(void *)(v66 + 8)) {
                    goto LABEL_171;
                  }
                  unsigned int v48 = *(_DWORD *)(v66 + 24);
                  if (!v48) {
                    goto LABEL_172;
                  }
                  if (v128 && (char v67 = *v128) != 0)
                  {
                    unsigned int v68 = 0;
                    uint64_t v69 = v128 + 1;
                    do
                    {
                      unsigned int v68 = 2 * (v68 ^ v67);
                      int v70 = *v69++;
                      char v67 = v70;
                    }
                    while (v70);
                  }
                  else
                  {
                    unsigned int v68 = 0;
                  }
                  if (!(*(unsigned int (**)(void))(*(void *)(a2 + 80) + 80))(*(void *)(v66 + 16)))
                  {
                    int v112 = v21;
                    unsigned int v71 = v68 % v48;
                    uint64_t v72 = *(void *)(v44 + 16);
                    uint64_t v73 = *(void *)(v72 + 32);
                    int64_t v74 = (const char **)(v73 + 88 * v71);
                    uint64_t v75 = (char *)v74[1];
                    if (v75
                      && !strcmp(v129, v74[1])
                      && (*(_DWORD *)(v73 + 88 * v71 + 24) == 1 || *v74 && !strcmp(v131, *v74)))
                    {
                      _plug_strdup(*(void *)(a2 + 80), v75, (char **)(v44 + 32), 0);
                      _plug_strdup(*(void *)(a2 + 80), *(char **)(*(void *)(*(void *)(v44 + 16) + 32) + 88 * v71 + 16), v41, 0);
                      uint64_t v72 = *(void *)(v44 + 16);
                      uint64_t v76 = *(void *)(v72 + 32) + 88 * v71;
                      *(_DWORD *)(v44 + 48) = *(_DWORD *)(v76 + 24);
                      *(void *)(v44 + 312) = *(void *)(v76 + 40);
                    }
                    (*(void (**)(void))(*(void *)(a2 + 80) + 88))(*(void *)(v72 + 16));
                    int v21 = v112;
                  }
                  uint64_t v40 = v44;
                  if (!*v41)
                  {
                    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "No reauth info for '%s' found", v128);
                    if (!*v41)
                    {
LABEL_171:
                      unsigned int v48 = 0;
                      goto LABEL_172;
                    }
                  }
                }
                int v43 = v21;
                uint64_t v44 = v40;
                uint64_t v47 = *(const char **)(v40 + 32);
                long long v45 = (char **)(v40 + 32);
                long long v46 = v47;
                if (v47)
                {
                  if (strcmp(v129, v46) && *v46)
                  {
                    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "The client tries to override server provided realm");
                    int v21 = v43;
                    if (*v45) {
                      (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
                    }
                    _plug_strdup(*(void *)(a2 + 80), v129, v45, 0);
                    unsigned int v48 = 1;
LABEL_149:
                    if (strcmp(v128, *v41))
                    {
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "nonce changed: authentication aborted");
                      size_t v17 = 0;
LABEL_151:
                      uint64_t v18 = 4294967283;
LABEL_186:
                      a1 = v44;
                      goto LABEL_93;
                    }
LABEL_172:
                    uint64_t v77 = (*(uint64_t (**)(void, long long *))(*(void *)(a2 + 80) + 296))(*(void *)(a2 + 152), &v136);
                    if (v77)
                    {
                      uint64_t v18 = v77;
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "unable to obtain user password");
LABEL_185:
                      size_t v17 = 0;
                      goto LABEL_186;
                    }
                    if (v48)
                    {
                      size_t v78 = strlen(*(const char **)(v44 + 32));
                      uint64_t v79 = *(void *)(a2 + 80);
                      if (v78)
                      {
                        id v80 = *(uint64_t (**)(size_t))(v79 + 40);
                        size_t v81 = strlen(v131);
                        v117 = (char *)v80(v78 + v81 + 2);
                        char *v117 = 0;
                        sprintf(v117, "%s@%s", v131, *(const char **)(v44 + 32));
                        int v82 = &v117;
                      }
                      else
                      {
                        int v82 = &v117;
                        _plug_strdup(v79, v131, &v117, 0);
                      }
                    }
                    else
                    {
                      int v82 = &v131;
                    }
                    if (v130 && *v130) {
                      uint64_t v83 = 1;
                    }
                    else {
                      uint64_t v83 = 3;
                    }
                    uint64_t v84 = (*(uint64_t (**)(void, char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), *v82, 0, v83, v114);
                    if (v84)
                    {
                      uint64_t v18 = v84;
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "unable to canonify user and get auxprops");
                      goto LABEL_185;
                    }
                    if (v130)
                    {
                      if (*v130)
                      {
                        uint64_t v85 = (*(uint64_t (**)(void))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8));
                        if (v85)
                        {
                          uint64_t v18 = v85;
                          (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "unable to canonify authorization ID");
                          goto LABEL_185;
                        }
                      }
                    }
                    if (((*(uint64_t (**)(void, long long *, _OWORD *))(*(void *)(a2 + 80) + 312))(*(void *)(a2 + 152), &v136, v135) & 0x80000000) != 0|| !*(void *)&v135[0]|| !*((void *)&v135[0] + 1))
                    {
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "no secret in database");
                      size_t v17 = 0;
                      if (*(void *)(a2 + 136)) {
                        uint64_t v18 = 4294967279;
                      }
                      else {
                        uint64_t v18 = 4294967276;
                      }
                      goto LABEL_186;
                    }
                    size_t v86 = strlen(**((const char ***)&v135[0] + 1));
                    size_t v17 = v86;
                    uint64_t v87 = *(void *)(a2 + 80);
                    if (v86)
                    {
                      uint64_t v88 = (*(uint64_t (**)(size_t))(v87 + 40))(v86 + 16);
                      v132 = (char *)v88;
                      if (v88)
                      {
                        int v113 = v21;
                        *(void *)uint64_t v88 = v17;
                        strncpy((char *)(v88 + 8), **((const char ***)&v135[0] + 1), v17 + 1);
                        int v89 = DigestCalcSecret(*(void *)(a2 + 80), v131, v129, v132 + 8, *(unsigned int *)v132, 0, (uint64_t)v138);
                        LOBYTE(v138[2]) = 0;
                        if (v89)
                        {
                          DigestCalcSecret(*(void *)(a2 + 80), v131, v129, v132 + 8, *(unsigned int *)v132, 1, (uint64_t)v137);
                          LOBYTE(v137[2]) = 0;
                        }
                        _plug_free_secret(*(unsigned int **)(a2 + 80), &v132);
                        (*(void (**)(void, void))(*(void *)(a2 + 80) + 360))(*(void *)(a2 + 152), v136);
                        if (!v126) {
                          _plug_strdup(*(void *)(a2 + 80), "auth", &v126, 0);
                        }
                        if (*(_DWORD *)(v114 + 36) < 2u) {
                          v108 = 0;
                        }
                        else {
                          v108 = *(void (**)(uint64_t))(v44 + 288);
                        }
                        CFRange v90 = v126;
                        if (!strcasecmp(v126, "auth-conf"))
                        {
                          v91 = v118;
                          if (v118)
                          {
                            v92 = available_ciphers;
                            if (available_ciphers)
                            {
                              v93 = &xmmword_1EB527A88;
                              while (1)
                              {
                                if (!strcasecmp(v91, v92))
                                {
                                  unsigned int v94 = *((_DWORD *)v93 - 8);
                                  if (*(_DWORD *)(v44 + 328) <= v94 && *(_DWORD *)(v44 + 324) >= v94) {
                                    break;
                                  }
                                }
                                v92 = (const char *)*((void *)v93 + 2);
                                v93 = (long long *)((char *)v93 + 56);
                                if (!v92) {
                                  goto LABEL_217;
                                }
                              }
                              *(_OWORD *)(v44 + 264) = *(v93 - 1);
                              *(_OWORD *)(v44 + 280) = *v93;
                              *(_DWORD *)(v114 + 36) = v94;
                              uint64_t v95 = *((unsigned int *)v93 - 7);
                              *(void *)(v114 + 48) = digestmd5_encode;
                              *(void *)(v114 + 64) = digestmd5_decode;
LABEL_229:
                              response = (const char *)create_response(v44, *(void *)(a2 + 80), v128, v19, v127, v90, v115, (uint64_t)v138, v130, (void **)(v44 + 80));
                              size_t v17 = (size_t)response;
                              if (response)
                              {
                                if (!strcmp(response, __s2)) {
                                  goto LABEL_236;
                                }
                                uint64_t v97 = *(void *)(a2 + 80);
                                if (!v89)
                                {
                                  (*(void (**)(void, void, const char *))(v97 + 264))(*(void *)(v97 + 8), 0, "client response doesn't match what we generated");
                                  goto LABEL_151;
                                }
                                (*(void (**)(size_t))(v97 + 64))(v17);
                                v98 = (const char *)create_response(v44, *(void *)(a2 + 80), v128, v19, v127, v126, v115, (uint64_t)v137, v130, (void **)(v44 + 80));
                                size_t v17 = (size_t)v98;
                                if (v98)
                                {
                                  if (strcmp(v98, __s2))
                                  {
                                    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "client response doesn't match what we generated (tried bogus)");
                                    goto LABEL_151;
                                  }
LABEL_236:
                                  if (!*v41) {
                                    goto LABEL_244;
                                  }
                                  if (v19 != *(_DWORD *)(v44 + 48))
                                  {
LABEL_241:
                                    if (v19 == *(_DWORD *)(v44 + 48)) {
                                      v99 = "server nonce expired";
                                    }
                                    else {
                                      v99 = "incorrect nonce-count";
                                    }
                                    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, v99);
                                    goto LABEL_249;
                                  }
                                  if (*(void *)(*(void *)(v44 + 16) + 8)
                                    && time(0) - *(void *)(v44 + 312) > *(void *)(*(void *)(v44 + 16) + 8))
                                  {
                                    if (*v41) {
                                      goto LABEL_241;
                                    }
LABEL_244:
                                    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "no cached server nonce");
LABEL_249:
                                    a1 = v44;
                                    *(_DWORD *)(v44 + 320) = 1;
                                    goto LABEL_92;
                                  }
                                  *(_DWORD *)uint64_t v114 = 1;
                                  *(_DWORD *)(v114 + 32) = v113 - 4;
                                  unsigned int v100 = *(_DWORD *)(v114 + 36);
                                  if (v100 <= 1)
                                  {
                                    if (v100 != 1) {
                                      goto LABEL_253;
                                    }
                                    int v101 = -20;
                                  }
                                  else
                                  {
                                    int v101 = -29;
                                  }
                                  *(_DWORD *)(v114 + 32) = v101 + v113;
LABEL_253:
                                  *(_DWORD *)(v114 + 136) = 0;
                                  *(void *)(v44 + 88) = 0;
                                  uint64_t v102 = *(void *)(a2 + 80);
                                  *(void *)(v44 + 152) = v102;
                                  if (v108)
                                  {
                                    v108(v44);
                                    uint64_t v102 = *(void *)(v44 + 152);
                                  }
                                  if (*(_DWORD *)(a2 + 104)) {
                                    int v103 = *(_DWORD *)(a2 + 104);
                                  }
                                  else {
                                    int v103 = 0xFFFF;
                                  }
                                  _plug_decode_init(v44 + 224, v102, v103);
                                  if (*(_DWORD *)(v114 + 36))
                                  {
                                    memset(__str, 170, sizeof(__str));
                                    __s[0] = (char *)0xAAAAAAAAAAAAAAAALL;
                                    __s[1] = (char *)0xAAAAAAAAAAAAAAAALL;
                                    create_layer_keys(v44, *(void *)(a2 + 80), v44 + 130, v95, (uint64_t)__str, (uint64_t)__s);
                                    v104 = *(unsigned int (**)(uint64_t, char *, char **))(v44 + 280);
                                    if (v104)
                                    {
                                      if (v104(v44, __str, __s)) {
                                        (*(void (**)(void, void, const char *))(*(void *)(a2 + 80)
                                      }
                                                                                             + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "couldn't init cipher");
                                    }
                                  }
                                  LODWORD(__s[0]) = 0;
                                  if (add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(v44 + 160), (unsigned int *)(v44 + 168), (unsigned int *)__s, "rspauth", *(char **)(v44 + 80), *(_DWORD *)(v44 + 8) != 0))
                                  {
                                    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: add_to_challenge failed");
                                  }
                                  else if (!*(_DWORD *)(v44 + 8) {
                                         || (memset(__str, 170, 10),
                                  }
                                             !add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(v44 + 160), (unsigned int *)(v44 + 168), (unsigned int *)__s, "cnonce", v127, 1))&& (snprintf(__str, 0xAuLL, "%08x", *(_DWORD *)(v44 + 48)), !add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(v44 + 160), (unsigned int *)(v44 + 168), (unsigned int *)__s, "nc", __str, 0))&& !add_to_challenge(*(void *)(a2 + 80), (uint64_t *)(v44 + 160),
                                                             (unsigned int *)(v44 + 168),
                                                             (unsigned int *)__s,
                                                             "qop",
                                                             v126,
                                                             1))
                                  {
                                    v105 = *(const char **)(v44 + 160);
                                    size_t v106 = strlen(v105);
                                    if (v106 <= 0x800)
                                    {
                                      uint64_t v18 = 0;
                                      _DWORD *v110 = v106;
                                      *v107 = v105;
                                      goto LABEL_186;
                                    }
                                  }
                                  goto LABEL_226;
                                }
                              }
                              (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "internal error: unable to create response");
                              uint64_t v18 = 4294967294;
                              goto LABEL_186;
                            }
LABEL_217:
                            (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 3, "protocol violation: client requested invalid cipher");
                            (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "client requested invalid cipher");
                            size_t v17 = 0;
                            *(_DWORD *)(v114 + 36) = 2;
LABEL_226:
                            uint64_t v18 = 0xFFFFFFFFLL;
                            goto LABEL_186;
                          }
                        }
                        if (!strcasecmp(v90, "auth-int") && *(_DWORD *)(v44 + 328) <= 1u && *(_DWORD *)(v44 + 324))
                        {
                          uint64_t v95 = 0;
                          *(void *)(v114 + 48) = digestmd5_encode;
                          *(void *)(v114 + 64) = digestmd5_decode;
                          *(_DWORD *)(v114 + 36) = 1;
                          goto LABEL_229;
                        }
                        if (!strcasecmp(v90, "auth") && !*(_DWORD *)(v44 + 328))
                        {
                          uint64_t v95 = 0;
                          *(void *)(v114 + 48) = 0;
                          *(void *)(v114 + 64) = 0;
                          *(_DWORD *)(v114 + 36) = 0;
                          goto LABEL_229;
                        }
                        (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "protocol violation: client requested invalid qop");
                      }
                      else
                      {
                        (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "unable to allocate secret");
                      }
                      size_t v17 = 0;
                      goto LABEL_226;
                    }
                    (*(void (**)(void, void, const char *))(v87 + 264))(*(void *)(v87 + 8), 0, "empty secret");
                    goto LABEL_226;
                  }
                }
                else
                {
                  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "The client specifies a realm when the server hasn't provided one. Using client's realm.");
                  _plug_strdup(*(void *)(a2 + 80), v129, v45, 0);
                }
                unsigned int v48 = 0;
                int v21 = v43;
                goto LABEL_149;
              }
              (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "required parameters missing: response");
            }
            else
            {
              (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "required parameters missing: digesturi");
            }
          }
          else
          {
            (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "required parameters missing: cnonce");
          }
        }
        else
        {
          (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "required parameters missing: noncecount");
        }
      }
      else
      {
        (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "required parameters missing: nonce");
      }
    }
    else
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "required parameters missing: username");
    }
    size_t v17 = 0;
LABEL_92:
    uint64_t v18 = 4294967283;
    goto LABEL_93;
  }
  int v111 = 0;
  int v19 = 0;
  int v20 = "Parse error";
  int v21 = 0x10000;
  while (1)
  {
    *(void *)__str = 0;
    __s[0] = 0;
    get_pair(&v116, (char **)__str, __s);
    size_t v22 = *(const char **)__str;
    if (!*(void *)__str)
    {
      uint64_t v18 = 4294967283;
      goto LABEL_85;
    }
    if (!**(unsigned char **)__str) {
      goto LABEL_66;
    }
    if (!strcasecmp(*(const char **)__str, "username"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      unsigned int v25 = __s[0];
      size_t v26 = &v131;
LABEL_40:
      _plug_strdup(v24, v25, v26, 0);
      goto LABEL_41;
    }
    if (!strcasecmp(v22, "authzid"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      unsigned int v25 = __s[0];
      size_t v26 = (char **)&v130;
      goto LABEL_40;
    }
    if (!strcasecmp(v22, "cnonce"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      unsigned int v25 = __s[0];
      size_t v26 = &v127;
      goto LABEL_40;
    }
    if (!strcasecmp(v22, "nc"))
    {
      uint64_t v27 = __s[0];
      size_t v28 = strlen(__s[0]);
      int v19 = 0;
      if (v28)
      {
        while (1)
        {
          int v30 = *v27++;
          int v29 = v30;
          char v31 = v30 - 48;
          if ((v30 - 48) > 0x36 || ((0x7E0000007E03FFuLL >> v31) & 1) == 0) {
            break;
          }
          int v19 = v29 + 16 * v19 + dword_1BF17802C[v31];
          if (!--v28) {
            goto LABEL_41;
          }
        }
        uint64_t v18 = 4294967283;
        int v20 = "error converting hex to int";
        goto LABEL_85;
      }
      goto LABEL_41;
    }
    if (!strcasecmp(v22, "realm"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      if (v129)
      {
        uint64_t v18 = 0xFFFFFFFFLL;
        int v20 = "duplicate realm: authentication aborted";
        goto LABEL_86;
      }
      unsigned int v25 = __s[0];
      size_t v26 = &v129;
      goto LABEL_40;
    }
    if (!strcasecmp(v22, "nonce"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      unsigned int v25 = __s[0];
      size_t v26 = &v128;
      goto LABEL_40;
    }
    if (!strcasecmp(v22, "qop"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      if (v126)
      {
        uint64_t v18 = 0xFFFFFFFFLL;
        int v20 = "duplicate qop: authentication aborted";
        goto LABEL_86;
      }
      unsigned int v25 = __s[0];
      size_t v26 = &v126;
      goto LABEL_40;
    }
    v109 = a6;
    if (!strcasecmp(v22, "digest-uri") || (int v23 = *(_DWORD *)(a1 + 8)) != 0 && !strcasecmp(v22, "uri"))
    {
      uint64_t v24 = *(void *)(a2 + 80);
      if (__s1)
      {
        uint64_t v18 = 0xFFFFFFFFLL;
        int v20 = "duplicate digest-uri: authentication aborted";
        goto LABEL_86;
      }
      _plug_strdup(v24, __s[0], &__s1, 0);
      if (!*(_DWORD *)(a1 + 8) || (uint64_t v32 = *(const char **)(v115 + 8)) == 0)
      {
        size_t v33 = strlen(*(const char **)a2);
        char v34 = __s1;
        if (strncasecmp(__s1, *(const char **)a2, v33) || v34[v33] != 47)
        {
          uint64_t v18 = 4294967283;
          int v20 = "bad digest-uri: doesn't match service";
          goto LABEL_85;
        }
        *((void *)&v122 + 1) = v34;
        goto LABEL_54;
      }
      a6 = v109;
      if (strcmp(__s1, v32))
      {
        uint64_t v18 = 4294967283;
        int v20 = "bad digest-uri: doesn't match HTTP request";
LABEL_85:
        uint64_t v24 = *(void *)(a2 + 80);
        goto LABEL_86;
      }
      goto LABEL_41;
    }
    if (!strcasecmp(v22, "response"))
    {
      uint64_t v35 = *(void *)(a2 + 80);
      uint64_t v36 = __s[0];
      p_s2 = &__s2;
LABEL_53:
      _plug_strdup(v35, v36, p_s2, 0);
      goto LABEL_54;
    }
    if (!strcasecmp(v22, "cipher"))
    {
      uint64_t v35 = *(void *)(a2 + 80);
      uint64_t v36 = __s[0];
      p_s2 = &v118;
      goto LABEL_53;
    }
    if (!strcasecmp(v22, "maxbuf"))
    {
      if (v111)
      {
        uint64_t v18 = 4294967283;
        int v20 = "duplicate maxbuf: authentication aborted";
        goto LABEL_85;
      }
      if (!str2ul32((uint64_t)__s[0], &v120))
      {
        uint64_t v18 = 4294967283;
        int v20 = "invalid maxbuf parameter";
        goto LABEL_85;
      }
      int v21 = v120;
      if (v120 < 0x11)
      {
        uint64_t v18 = 4294967283;
        int v20 = "maxbuf parameter too small";
        goto LABEL_85;
      }
      if (v120 >> 24)
      {
        uint64_t v18 = 4294967283;
        int v20 = "maxbuf parameter too big";
        goto LABEL_85;
      }
      int v111 = 1;
      goto LABEL_54;
    }
    if (!strcasecmp(v22, "charset")) {
      break;
    }
    if (strcasecmp(v22, "algorithm"))
    {
      (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(*(void *)(*(void *)(a2 + 80) + 8), 5, "DIGEST-MD5 unrecognized pair %s/%s: ignoring", v22, __s[0]);
LABEL_54:
      a6 = v109;
      goto LABEL_41;
    }
    if (!v23) {
      goto LABEL_54;
    }
    a6 = v109;
    if (strcasecmp(__s[0], "md5-sess"))
    {
      uint64_t v18 = 0xFFFFFFFFLL;
      int v20 = "'algorithm' isn't 'md5-sess'";
      goto LABEL_85;
    }
LABEL_41:
    if (!*v116) {
      goto LABEL_66;
    }
  }
  uint64_t v38 = __s[0];
  int v39 = strcasecmp(__s[0], "utf-8");
  uint64_t v24 = *(void *)(a2 + 80);
  a6 = v109;
  if (!v39)
  {
    size_t v26 = (char **)&v119;
    unsigned int v25 = v38;
    goto LABEL_40;
  }
  uint64_t v18 = 0xFFFFFFFFLL;
  int v20 = "client doesn't support UTF-8";
LABEL_86:
  (*(void (**)(void, void, const char *))(v24 + 264))(*(void *)(v24 + 8), 0, v20);
  size_t v17 = 0;
LABEL_93:
  uint64_t v49 = *(void *)(a1 + 16);
  if (*(void *)(v49 + 8)
    && !(*(unsigned int (**)(void))(*(void *)(a2 + 80) + 80))(*(void *)(v49 + 16)))
  {
    if (v128 && (char v51 = *v128) != 0)
    {
      unsigned int v52 = 0;
      long long v53 = v128 + 1;
      do
      {
        unsigned int v52 = 2 * (v52 ^ v51);
        int v54 = *v53++;
        char v51 = v54;
      }
      while (v54);
    }
    else
    {
      unsigned int v52 = 0;
    }
    uint64_t v55 = *(void *)(a1 + 16);
    unsigned int v56 = v52 % *(_DWORD *)(v55 + 24);
    unsigned int v57 = *(_DWORD *)(a1 + 48);
    if (v18)
    {
      if (v57 >= 2)
      {
        uint64_t v58 = *(void *)(v55 + 32) + 88 * v56;
        goto LABEL_108;
      }
    }
    else
    {
      uint64_t v59 = *(void *)(v55 + 32);
      if (v57 == 1)
      {
        clear_reauth_entry(v59 + 88 * v56, 0, *(void *)(a2 + 80));
        uint64_t v59 = *(void *)(*(void *)(a1 + 16) + 32);
        uint64_t v60 = v59 + 88 * v56;
        *(void *)uint64_t v60 = v131;
        v131 = 0;
        long long v61 = *(_OWORD *)(a1 + 32);
        *(void *)(a1 + 32) = 0;
        *(_OWORD *)(v60 + 8) = v61;
        *(void *)(a1 + 40) = 0;
        *(void *)(v60 + 32) = v127;
        v127 = 0;
        unsigned int v57 = *(_DWORD *)(a1 + 48);
      }
      uint64_t v62 = v59 + 88 * v56;
      unsigned int v64 = *(_DWORD *)(v62 + 24);
      unsigned int v63 = (_DWORD *)(v62 + 24);
      if (v57 >= v64)
      {
        *(_DWORD *)(a1 + 48) = v57 + 1;
        *unsigned int v63 = v57 + 1;
        *(void *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v56 + 40) = time(0);
      }
      else
      {
        uint64_t v58 = v59 + 88 * v56;
LABEL_108:
        v50.n128_f64[0] = clear_reauth_entry(v58, 0, *(void *)(a2 + 80));
      }
    }
    (*(void (**)(void, __n128))(*(void *)(a2 + 80) + 88))(*(void *)(*(void *)(a1 + 16) + 16), v50);
  }
  if (v16) {
    (*(void (**)(char *))(*(void *)(a2 + 80) + 64))(v16);
  }
LABEL_113:
  if (v117) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v131) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v130) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v129) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v128) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v127) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (__s2) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v118) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v17) {
    (*(void (**)(size_t))(*(void *)(a2 + 80) + 64))(v17);
  }
  if (v119) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (__s1) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v126) {
    (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
  }
  if (v132) {
    _plug_free_secret(*(unsigned int **)(a2 + 80), &v132);
  }
  return v18;
}

void get_pair(char **a1, char **a2, void *a3)
{
  uint64_t v4 = *a1;
  *a2 = 0;
  *a3 = 0;
  if (!v4) {
    return;
  }
  unsigned int v6 = *v4;
  if (!*v4) {
    goto LABEL_10;
  }
  while (1)
  {
    while (1)
    {
      if (v6 > 0x2C) {
        goto LABEL_12;
      }
      if (((1 << v6) & 0x100002600) == 0) {
        break;
      }
      unsigned int v8 = *++v4;
      unsigned int v6 = v8;
    }
    if (v6 != 44) {
      break;
    }
    unsigned int v9 = *++v4;
    unsigned int v6 = v9;
    if (!v9) {
      goto LABEL_10;
    }
  }
  if (!v6)
  {
LABEL_10:
    *a2 = "";
    return;
  }
LABEL_12:
  *a2 = v4;
  int v10 = skip_token(v4);
  if (*v10 && *v10 != 61) {
    *v10++ = 0;
  }
  uint64_t v11 = 0;
  char v12 = v10 + 3;
  while (1)
  {
    uint64_t v13 = v10[v11];
    if (v13 > 0x3D) {
      goto LABEL_26;
    }
    if (((1 << v13) & 0x100002600) == 0) {
      break;
    }
    ++v11;
  }
  if (v13 != 61)
  {
LABEL_26:
    *a2 = 0;
    return;
  }
  v10[v11] = 0;
  while (1)
  {
    long long v14 = &v10[v11];
    unsigned int v15 = v10[v11 + 1];
    if (v15 > 0x20 || ((1 << v15) & 0x100002600) == 0) {
      break;
    }
    ++v11;
  }
  if (v15 == 34) {
    size_t v17 = v14 + 1;
  }
  else {
    size_t v17 = &v10[v11];
  }
  *a3 = v17 + 1;
  int v19 = v14[1];
  uint64_t v18 = v14 + 1;
  if (v19 != 34)
  {
    unsigned int v25 = skip_token(v18);
    if (v25) {
      goto LABEL_41;
    }
    goto LABEL_57;
  }
  int v20 = &v10[v11];
  int v23 = v20[2];
  int v21 = v20 + 2;
  int v22 = v23;
  if (!v23) {
    goto LABEL_57;
  }
  int v24 = 0;
  unsigned int v25 = v18 + 2;
  unint64_t v26 = (unint64_t)&v12[v11];
  while (1)
  {
    if (!v24)
    {
      if (v22 == 92)
      {
        --v21;
        int v24 = 1;
        goto LABEL_38;
      }
      if (v22 == 34) {
        break;
      }
    }
    int v24 = 0;
    *int v21 = v22;
LABEL_38:
    ++v21;
    int v27 = *v25++;
    int v22 = v27;
    ++v26;
    if (!v27) {
      goto LABEL_57;
    }
  }
  if (v21 <= v25 - 1)
  {
    if (v26 <= (unint64_t)(v21 + 1)) {
      unint64_t v26 = (unint64_t)(v21 + 1);
    }
    bzero(v21, v26 - (void)v21);
  }
LABEL_41:
  unsigned int v28 = *v25;
  if (v28 <= 0x20 && ((1 << v28) & 0x100002600) != 0)
  {
    *v25++ = 0;
    while (1)
    {
      unsigned int v28 = *v25;
      if (v28 > 0x20 || ((1 << v28) & 0x100002600) == 0) {
        break;
      }
      ++v25;
    }
  }
  if (v28)
  {
    if (v28 == 44)
    {
      *v25++ = 0;
      goto LABEL_56;
    }
LABEL_57:
    *a2 = 0;
    *a3 = 0;
  }
  else
  {
LABEL_56:
    *a1 = v25;
  }
}

uint64_t str2ul32(uint64_t result, void *a2)
{
  if (result)
  {
    *a2 = 0;
    while (1)
    {
      unsigned int v2 = *(unsigned __int8 *)result;
      if (v2 > 0x20) {
        break;
      }
      if (((1 << v2) & 0x100002600) == 0)
      {
        if (!*(unsigned char *)result) {
          return 0;
        }
        break;
      }
      ++result;
    }
    LODWORD(v3) = 0;
    uint64_t v4 = 1;
    while (1)
    {
      int v5 = (char)v2;
      unsigned int v6 = (char)v2 - 48;
      BOOL v7 = v6 > 9 || v3 > 0x19999999;
      if (v7 || v3 == 429496729 && (v5 - 54) < 0xFFFFFFFA) {
        break;
      }
      uint64_t v3 = v6 + 10 * v3;
      unsigned int v2 = *(unsigned __int8 *)(result + v4++);
      if (!v2)
      {
        *a2 = v3;
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DigestCalcSecret(uint64_t a1, char *a2, char *a3, char *a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v31 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v14 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  void v30[3] = v14;
  v30[4] = v14;
  v30[1] = v14;
  v30[2] = v14;
  v30[0] = v14;
  (*(void (**)(_OWORD *))(a1 + 104))(v30);
  if (a6)
  {
    size_t v15 = strlen(a2);
    (*(void (**)(_OWORD *, char *, size_t))(a1 + 112))(v30, a2, v15);
    uint64_t v16 = 0;
  }
  else
  {
    int64_t v17 = strlen(a2);
    uint64_t v18 = (unsigned __int8 *)&a2[v17];
    uint64_t i = a2;
    if (v17 >= 1)
    {
      for (uint64_t i = a2; i < (char *)v18; ++i)
      {
        unsigned int v20 = *i;
        if (v20 > 0xC3) {
          break;
        }
        if (v20 >= 0xC0)
        {
          if (++i == (char *)v18)
          {
            uint64_t i = &a2[v17];
            break;
          }
          if (*i > -65) {
            break;
          }
        }
      }
    }
    uint64_t v16 = i >= (char *)v18;
    MD5_UTF8_8859_1(a1, (uint64_t)v30, i >= (char *)v18, a2, v17);
  }
  (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v30, &COLON, 1);
  if (a3 && *a3)
  {
    if (a6)
    {
      size_t v21 = strlen(a3);
      (*(void (**)(_OWORD *, char *, size_t))(a1 + 112))(v30, a3, v21);
      (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v30, &COLON, 1);
LABEL_31:
      (*(void (**)(_OWORD *, char *, uint64_t))(a1 + 112))(v30, a4, a5);
      goto LABEL_45;
    }
    int64_t v22 = strlen(a3);
    int v23 = (unsigned __int8 *)&a3[v22];
    j = a3;
    if (v22 >= 1)
    {
      for (j = a3; j < (char *)v23; ++j)
      {
        unsigned int v25 = *j;
        if (v25 > 0xC3) {
          break;
        }
        if (v25 >= 0xC0)
        {
          if (++j == (char *)v23)
          {
            j = &a3[v22];
            break;
          }
          if (*j > -65) {
            break;
          }
        }
      }
    }
    if (j >= (char *)v23) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v16;
    }
    MD5_UTF8_8859_1(a1, (uint64_t)v30, j >= (char *)v23, a3, v22);
  }
  (*(void (**)(_OWORD *, void *, uint64_t))(a1 + 112))(v30, &COLON, 1);
  if (a6) {
    goto LABEL_31;
  }
  unint64_t v26 = (unsigned __int8 *)&a4[(int)a5];
  k = a4;
  if ((int)a5 >= 1)
  {
    for (k = a4; k < (char *)v26; ++k)
    {
      unsigned int v28 = *k;
      if (v28 > 0xC3) {
        break;
      }
      if (v28 >= 0xC0)
      {
        if (++k == (char *)v26)
        {
          k = &a4[(int)a5];
          break;
        }
        if (*k > -65) {
          break;
        }
      }
    }
  }
  if (k >= (char *)v26) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v16;
  }
  MD5_UTF8_8859_1(a1, (uint64_t)v30, k >= (char *)v26, a4, a5);
LABEL_45:
  (*(void (**)(uint64_t, _OWORD *))(a1 + 120))(a7, v30);
  return v16;
}

uint64_t digestmd5_encode(uint64_t a1, uint64_t a2, unsigned int a3, void *a4, unsigned int *a5)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  if (a1 && a2 && a3 && a4 && a5)
  {
    if (a3 < 2)
    {
      unint64_t v16 = *(void *)a2;
      int v11 = *(_DWORD *)(a2 + 8);
      LODWORD(v17) = v11;
      int v10 = &v16;
    }
    else
    {
      unsigned int v8 = (unint64_t **)(a1 + 176);
      uint64_t result = _plug_iovec_to_buf(*(void *)(a1 + 152), a2, a3, (char ***)(a1 + 176));
      if (result) {
        return result;
      }
      int v10 = *v8;
      int v11 = *((_DWORD *)*v8 + 2);
    }
    uint64_t result = _plug_buf_alloc(*(void *)(a1 + 152), (uint64_t *)(a1 + 184), (unsigned int *)(a1 + 208), v11 + 28);
    if (!result)
    {
      char v12 = *(_DWORD **)(a1 + 184);
      *char v12 = bswap32(*(_DWORD *)(a1 + 88));
      uint64_t v13 = v12 + 1;
      memcpy((void *)(*(void *)(a1 + 184) + 4), (const void *)*v10, *((unsigned int *)v10 + 2));
      if (*(void *)(a1 + 264))
      {
        v18[0] = 0xAAAAAAAAAAAAAAAALL;
        v18[1] = 0xAAAAAAAAAAAAAAAALL;
        (*(void (**)(void, void, uint64_t, uint64_t, void *))(*(void *)(a1 + 152) + 128))(*(void *)(a1 + 184), (*((_DWORD *)v10 + 2) + 4), a1 + 96, 16, v18);
        (*(void (**)(uint64_t, unint64_t, void, void *, _DWORD *, unsigned int *))(a1 + 264))(a1, *v10, *((unsigned int *)v10 + 2), v18, v13, a5);
        unsigned int v14 = *a5;
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 152) + 128))();
        *a5 = *((_DWORD *)v10 + 2) + 10;
        unsigned int v14 = *((_DWORD *)v10 + 2) + 10;
      }
      uint64_t result = 0;
      size_t v15 = (char *)v13 + v14;
      *(_WORD *)size_t v15 = 256;
      *a5 += 2;
      *(_DWORD *)(v15 + 2) = bswap32(*(_DWORD *)(a1 + 88));
      LODWORD(v15) = *a5 + 4;
      *a5 = v15;
      **(_DWORD **)(a1 + 184) = bswap32(v15);
      *a5 += 4;
      *a4 = *(void *)(a1 + 184);
      ++*(_DWORD *)(a1 + 88);
    }
  }
  else
  {
    if (a1) {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a1 + 152) + 264))(*(void *)(*(void *)(a1 + 152) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/digestmd5.c near line %d", 1405);
    }
    return 4294967289;
  }
  return result;
}

uint64_t digestmd5_decode(uint64_t a1, char *a2, unsigned int a3, void *a4, unsigned int *a5)
{
  uint64_t result = _plug_decode((_DWORD *)(a1 + 224), a2, a3, (uint64_t *)(a1 + 192), (unsigned int *)(a1 + 212), a5, (uint64_t (*)(uint64_t, void, void, _DWORD *, _DWORD *))digestmd5_decode_packet, a1);
  *a4 = *(void *)(a1 + 192);
  return result;
}

uint64_t create_response(uint64_t a1, uint64_t a2, const char *a3, int a4, const char *a5, const char *a6, uint64_t a7, uint64_t a8, const char *a9, void **a10)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v33 = -86;
  *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[0] = v17;
  v32[1] = v17;
  memset(v31, 170, 17);
  char v30 = -86;
  v29[0] = v17;
  v29[1] = v17;
  if (a6) {
    uint64_t v18 = a6;
  }
  else {
    uint64_t v18 = "auth";
  }
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  long long v39 = v17;
  long long v40 = v17;
  long long v37 = v17;
  long long v38 = v17;
  long long v36 = v17;
  (*(void (**)(long long *))(a2 + 104))(&v36);
  if (*(_DWORD *)(a1 + 8))
  {
    char v35 = -86;
    *(void *)&long long v19 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v34[0] = v19;
    v34[1] = v19;
    CvtHex(a8, (uint64_t)v34);
    (*(void (**)(long long *, _OWORD *, uint64_t))(a2 + 112))(&v36, v34, 32);
  }
  else
  {
    (*(void (**)(long long *, uint64_t, uint64_t))(a2 + 112))(&v36, a8, 16);
  }
  (*(void (**)(long long *, void *, uint64_t))(a2 + 112))(&v36, &COLON, 1);
  size_t v20 = strlen(a3);
  (*(void (**)(long long *, const char *, size_t))(a2 + 112))(&v36, a3, v20);
  (*(void (**)(long long *, void *, uint64_t))(a2 + 112))(&v36, &COLON, 1);
  size_t v21 = strlen(a5);
  (*(void (**)(long long *, const char *, size_t))(a2 + 112))(&v36, a5, v21);
  if (a9)
  {
    (*(void (**)(long long *, void *, uint64_t))(a2 + 112))(&v36, &COLON, 1);
    size_t v22 = strlen(a9);
    (*(void (**)(long long *, const char *, size_t))(a2 + 112))(&v36, a9, v22);
  }
  (*(void (**)(uint64_t, long long *))(a2 + 120))(a8, &v36);
  CvtHex(a8, (uint64_t)v32);
  long long v23 = *(_OWORD *)a8;
  *(unsigned char *)(a1 + 146) = *(unsigned char *)(a8 + 16);
  *(_OWORD *)(a1 + 130) = v23;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v24 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v39 = v24;
    long long v40 = v24;
    long long v37 = v24;
    long long v38 = v24;
    long long v36 = v24;
    (*(void (**)(long long *))(a2 + 104))(&v36);
    (*(void (**)(long long *, void, void))(a2 + 112))(&v36, *(void *)(a7 + 16), *(unsigned int *)(a7 + 24));
    (*(void (**)(void *, long long *))(a2 + 120))(v31, &v36);
  }
  else
  {
    v31[0] = 0;
    v31[1] = 0;
  }
  LOBYTE(v38) = -86;
  *(void *)&long long v25 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v36 = v25;
  long long v37 = v25;
  CvtHex((uint64_t)v31, (uint64_t)v29);
  DigestCalcResponse(a2, (uint64_t)v32, a3, a4, a5, v18, *(const char **)(a7 + 8), *(const char **)a7, (uint64_t)v29, (uint64_t)&v36);
  uint64_t v26 = (*(uint64_t (**)(uint64_t))(a2 + 40))(33);
  *(_OWORD *)uint64_t v26 = v36;
  *(_OWORD *)(v26 + 16) = v37;
  *(unsigned char *)(v26 + 32) = 0;
  if (a10)
  {
    DigestCalcResponse(a2, (uint64_t)v32, a3, a4, a5, v18, *(const char **)(a7 + 8), 0, (uint64_t)v29, (uint64_t)&v36);
    int v27 = (_OWORD *)(*(uint64_t (**)(void *, uint64_t))(a2 + 56))(*a10, 33);
    if (v27)
    {
      *a10 = v27;
      *int v27 = v36;
      v27[1] = v37;
      *((unsigned char *)*a10 + 32) = 0;
    }
    else
    {
      free(*a10);
      uint64_t v26 = 0;
      *a10 = 0;
    }
  }
  return v26;
}

uint64_t create_layer_keys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v27 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v12 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[3] = v12;
  v26[4] = v12;
  v26[1] = v12;
  v26[2] = v12;
  v26[0] = v12;
  (*(void (**)(void, uint64_t, const char *))(a2 + 256))(*(void *)(a2 + 8), 5, "DIGEST-MD5 create_layer_keys()");
  (*(void (**)(_OWORD *))(a2 + 104))(v26);
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(a2 + 112))(v26, a3, a4);
  if (*(_DWORD *)(a1 + 4)) {
    uint64_t v13 = SEALING_CLIENT_SERVER;
  }
  else {
    uint64_t v13 = SEALING_SERVER_CLIENT;
  }
  unsigned int v14 = *v13;
  size_t v15 = strlen(*v13);
  (*(void (**)(_OWORD *, const char *, size_t))(a2 + 112))(v26, v14, v15);
  (*(void (**)(uint64_t, _OWORD *))(a2 + 120))(a5, v26);
  (*(void (**)(_OWORD *))(a2 + 104))(v26);
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(a2 + 112))(v26, a3, a4);
  if (*(_DWORD *)(a1 + 4)) {
    unint64_t v16 = SEALING_SERVER_CLIENT;
  }
  else {
    unint64_t v16 = SEALING_CLIENT_SERVER;
  }
  long long v17 = *v16;
  size_t v18 = strlen(*v16);
  (*(void (**)(_OWORD *, const char *, size_t))(a2 + 112))(v26, v17, v18);
  (*(void (**)(uint64_t, _OWORD *))(a2 + 120))(a6, v26);
  (*(void (**)(_OWORD *))(a2 + 104))(v26);
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(a2 + 112))(v26, a1 + 130, 16);
  if (*(_DWORD *)(a1 + 4)) {
    long long v19 = SIGNING_CLIENT_SERVER;
  }
  else {
    long long v19 = &SIGNING_SERVER_CLIENT;
  }
  size_t v20 = *v19;
  size_t v21 = strlen(*v19);
  (*(void (**)(_OWORD *, const char *, size_t))(a2 + 112))(v26, v20, v21);
  (*(void (**)(uint64_t, _OWORD *))(a2 + 120))(a1 + 96, v26);
  (*(void (**)(_OWORD *))(a2 + 104))(v26);
  (*(void (**)(_OWORD *, uint64_t, uint64_t))(a2 + 112))(v26, a1 + 130, 16);
  if (*(_DWORD *)(a1 + 4)) {
    size_t v22 = &SIGNING_SERVER_CLIENT;
  }
  else {
    size_t v22 = SIGNING_CLIENT_SERVER;
  }
  long long v23 = *v22;
  size_t v24 = strlen(*v22);
  (*(void (**)(_OWORD *, const char *, size_t))(a2 + 112))(v26, v23, v24);
  return (*(uint64_t (**)(uint64_t, _OWORD *))(a2 + 120))(a1 + 113, v26);
}

uint64_t add_to_challenge(uint64_t a1, uint64_t *a2, unsigned int *a3, unsigned int *a4, char *__s, char *a6, int a7)
{
  int v14 = strlen(__s);
  unsigned int v15 = v14 + strlen(a6) + *a4 + 5;
  uint64_t v16 = _plug_buf_alloc(a1, a2, a3, v15);
  if (!v16)
  {
    if (*a4)
    {
      *(_WORD *)(*a2 + strlen((const char *)*a2)) = 44;
      strcat((char *)*a2, __s);
    }
    else
    {
      strcpy((char *)*a2, __s);
    }
    long long v17 = (char *)(*a2 + strlen((const char *)*a2));
    if (!a7)
    {
      *(_WORD *)long long v17 = 61;
      strcat((char *)*a2, a6);
LABEL_27:
      uint64_t v16 = 0;
      *a4 = v15;
      return v16;
    }
    strcpy(v17, "=\"");
    if (!strpbrk(a6, "\"\\""))
    {
      strcat((char *)*a2, a6);
LABEL_26:
      *(_WORD *)(*a2 + strlen((const char *)*a2)) = 34;
      goto LABEL_27;
    }
    if (a6)
    {
      size_t v18 = strpbrk(a6, "\"\\"");
      if (v18)
      {
        uint64_t v19 = 1;
        do
        {
          size_t v18 = strpbrk(v18 + 1, "\"\\"");
          ++v19;
        }
        while (v18);
        size_t v20 = strlen(a6);
        size_t v21 = (char *)malloc_type_malloc(v20 + v19, 0x14E1CD9BuLL);
        if (v21)
        {
          size_t v22 = v21;
          for (uint64_t i = v21; ; ++i)
          {
            int v24 = *a6;
            if (v24 == 34 || v24 == 92)
            {
              *i++ = 92;
              LOBYTE(v24) = *a6;
            }
            else if (!*a6)
            {
              *uint64_t i = 0;
              goto LABEL_23;
            }
            *uint64_t i = v24;
            ++a6;
          }
        }
      }
      else
      {
        size_t v22 = strdup(a6);
        if (v22)
        {
LABEL_23:
          uint64_t v25 = _plug_buf_alloc(a1, a2, a3, v15);
          if (v25)
          {
            uint64_t v16 = v25;
            free(v22);
            return v16;
          }
          strcat((char *)*a2, v22);
          free(v22);
          goto LABEL_26;
        }
      }
    }
    (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/digestmd5.c near line %d", 564);
    size_t v22 = 0;
    goto LABEL_23;
  }
  return v16;
}

double clear_reauth_entry(uint64_t a1, int a2, uint64_t a3)
{
  if (a1)
  {
    if (*(void *)a1) {
      (*(void (**)(void))(a3 + 64))();
    }
    if (*(void *)(a1 + 8)) {
      (*(void (**)(void))(a3 + 64))();
    }
    if (*(void *)(a1 + 16)) {
      (*(void (**)(void))(a3 + 64))();
    }
    if (*(void *)(a1 + 32)) {
      (*(void (**)(void))(a3 + 64))();
    }
    if (a2 == 1)
    {
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void))(a3 + 64))();
      }
    }
    *(void *)(a1 + 80) = 0;
    double result = 0.0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

char *__cdecl skip_token(char *result)
{
  if (result && *result >= 33)
  {
    uint64_t v2 = *result;
    do
    {
      if (((unint64_t)(v2 - 39) <= 0x36 && ((1 << (v2 - 39)) & 0x70000003F80127) != 0
         || (unint64_t)(v2 - 123) <= 4 && ((1 << (v2 - 123)) & 0x15) != 0)
        && (v1 != 1 || (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v2 + 60) & 0x8000) == 0))
      {
        break;
      }
      int v3 = *++result;
      uint64_t v2 = v3;
    }
    while (v3 > 32);
  }
  return result;
}

uint64_t MD5_UTF8_8859_1(uint64_t result, uint64_t a2, int a3, unsigned char *a4, uint64_t a5)
{
  uint64_t v6 = result;
  if (a3)
  {
    unint64_t v7 = (unint64_t)&a4[(int)a5];
    char v11 = -86;
    do
    {
      if ((unint64_t)a4 >= v7)
      {
        unsigned int v9 = a4;
      }
      else
      {
        uint64_t v8 = 0;
        while (a4[v8] <= 0xBFu)
        {
          if (v7 - (void)a4 == ++v8)
          {
            unsigned int v9 = (unsigned char *)v7;
            goto LABEL_10;
          }
        }
        unsigned int v9 = &a4[v8];
LABEL_10:
        if (v9 != a4) {
          double result = (*(uint64_t (**)(uint64_t, unsigned char *, void))(v6 + 112))(a2, a4, (v9 - a4));
        }
      }
      if ((unint64_t)(v9 + 1) >= v7) {
        break;
      }
      char v11 = v9[1] & 0x3F | (*v9 << 6);
      double result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 112))(a2, &v11, 1);
      a4 = v9 + 2;
    }
    while ((unint64_t)(v9 + 2) < v7);
  }
  else
  {
    int v10 = *(uint64_t (**)(uint64_t, unsigned char *, uint64_t))(result + 112);
    return v10(a2, a4, a5);
  }
  return result;
}

uint64_t digestmd5_decode_packet(uint64_t a1, char *a2, unsigned int a3, void *a4, unsigned int *a5)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  v23[0] = 0xAAAAAAAAAAAAAAAALL;
  v23[1] = 0xAAAAAAAAAAAAAAAALL;
  if (a3 > 0xF)
  {
    uint64_t v8 = &a2[a3];
    if (*((_WORD *)v8 - 3) == 256)
    {
      unsigned int v9 = bswap32(*((_DWORD *)v8 - 1));
      int v10 = *(_DWORD *)(a1 + 92);
      uint64_t v11 = *(void *)(a1 + 152);
      if (v9 == v10)
      {
        uint64_t result = _plug_buf_alloc(v11, (uint64_t *)(a1 + 200), (unsigned int *)(a1 + 216), a3 - 2);
        if (result) {
          return result;
        }
        size_t v15 = a3 - 6;
        **(_DWORD **)(a1 + 200) = bswap32((*(_DWORD *)(a1 + 92))++);
        uint64_t v16 = (void *)(*(void *)(a1 + 200) + 4);
        *a4 = v16;
        long long v17 = *(uint64_t (**)(uint64_t, char *, size_t, void))(a1 + 272);
        if (v17)
        {
          uint64_t result = v17(a1, a2, v15, 0);
          if (result) {
            return result;
          }
          unsigned int v18 = *a5;
          unsigned int v19 = a3 - 16;
        }
        else
        {
          memcpy(v16, a2, v15);
          unsigned int v19 = a3 - 16;
          *a5 = a3 - 16;
          unsigned int v18 = a3 - 16;
        }
        uint64_t v20 = *a4 + v19;
        (*(void (**)(void, void, uint64_t, uint64_t, void *))(*(void *)(a1 + 152) + 128))(*(void *)(a1 + 200), v18 + 4, a1 + 113, 16, v23);
        uint64_t v21 = 0;
        int v22 = 0;
        do
        {
          v22 |= *(unsigned __int8 *)(v20 + v21) ^ *((unsigned __int8 *)v23 + v21);
          ++v21;
        }
        while (v21 != 10);
        if (!v22) {
          return 0;
        }
        (*(void (**)(void, void, const char *))(*(void *)(a1 + 152) + 264))(*(void *)(*(void *)(a1 + 152) + 8), 0, "CMAC doesn't match!");
      }
      else
      {
        (*(void (**)(void, void, const char *, ...))(v11 + 264))(*(void *)(v11 + 8), 0, "Incorrect Sequence Number: received %u, expected %u", v9, v10);
      }
    }
    else
    {
      (*(void (**)(void, void, const char *))(*(void *)(a1 + 152) + 264))(*(void *)(*(void *)(a1 + 152) + 8), 0, "Wrong Version");
    }
  }
  else
  {
    (*(void (**)(void, void, const char *))(*(void *)(a1 + 152) + 264))(*(void *)(*(void *)(a1 + 152) + 8), 0, "DIGEST-MD5 SASL packets must be at least 16 bytes long");
  }
  return 0xFFFFFFFFLL;
}

uint64_t create_nonce(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(uint64_t))(a1 + 40))(32);
  if (result)
  {
    uint64_t v3 = result;
    (*(void (**)(void, uint64_t, uint64_t))(a1 + 184))(*(void *)(a1 + 16), result, 32);
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(a1 + 40))(47);
    if (v4)
    {
      uint64_t v5 = v4;
      int v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void))(a1 + 216))(v3, 32, v4, 46, 0);
      (*(void (**)(uint64_t))(a1 + 64))(v3);
      if (v6) {
        return 0;
      }
      else {
        return v5;
      }
    }
    else
    {
      (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Unable to allocate final buffer");
      return 0;
    }
  }
  return result;
}

uint64_t digestmd5_common_mech_dispose(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void, uint64_t, const char *))(a2 + 256))(*(void *)(a2 + 8), 5, "DIGEST-MD5 common mech dispose");
  if (*(void *)(a1 + 24)) {
    (*(void (**)(void))(a2 + 64))();
  }
  if (*(void *)(a1 + 32)) {
    (*(void (**)(void))(a2 + 64))();
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4)
  {
    if (*(int *)(a1 + 72) >= 1)
    {
      uint64_t v5 = 0;
      do
        (*(void (**)(void))(a2 + 64))(*(void *)(*(void *)(a1 + 64) + 8 * v5++));
      while (v5 < *(int *)(a1 + 72));
      uint64_t v4 = *(void *)(a1 + 64);
    }
    (*(void (**)(uint64_t))(a2 + 64))(v4);
  }
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(a2 + 64))();
  }
  if (*(void *)(a1 + 56)) {
    (*(void (**)(void))(a2 + 64))();
  }
  int v6 = *(void (**)(uint64_t))(a1 + 288);
  if (v6) {
    v6(a1);
  }
  if (*(void *)(a1 + 80)) {
    (*(void (**)(void))(a2 + 64))();
  }
  _plug_decode_free((void *)(a1 + 224));
  if (*(void *)(a1 + 184)) {
    (*(void (**)(void))(a2 + 64))();
  }
  if (*(void *)(a1 + 192)) {
    (*(void (**)(void))(a2 + 64))();
  }
  if (*(void *)(a1 + 200)) {
    (*(void (**)(void))(a2 + 64))();
  }
  if (*(void *)(a1 + 160)) {
    (*(void (**)(void))(a2 + 64))();
  }
  unint64_t v7 = *(void **)(a1 + 176);
  if (v7)
  {
    if (*v7)
    {
      (*(void (**)(void))(a2 + 64))(*v7);
      unint64_t v7 = *(void **)(a1 + 176);
    }
    (*(void (**)(void *))(a2 + 64))(v7);
  }
  uint64_t v8 = *(uint64_t (**)(uint64_t))(a2 + 64);
  return v8(a1);
}

uint64_t digestmd5_client_mech_new(void *a1, uint64_t a2, uint64_t *a3)
{
  if ((*(unsigned char *)(a2 + 180) & 0x10) != 0 && !*(void *)(a2 + 136))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "DIGEST-MD5 unavailable due to lack of HTTP request");
    return 4294967289;
  }
  else
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(360);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t result = 0;
      *(void *)(v7 + 352) = 0;
      *(_OWORD *)(v7 + 320) = 0u;
      *(_OWORD *)(v7 + 336) = 0u;
      *(_OWORD *)(v7 + 288) = 0u;
      *(_OWORD *)(v7 + 304) = 0u;
      *(_OWORD *)(v7 + 256) = 0u;
      *(_OWORD *)(v7 + 272) = 0u;
      *(_OWORD *)(v7 + 224) = 0u;
      *(_OWORD *)(v7 + 240) = 0u;
      *(_OWORD *)(v7 + 192) = 0u;
      *(_OWORD *)(v7 + 208) = 0u;
      *(_OWORD *)(v7 + 160) = 0u;
      *(_OWORD *)(v7 + 176) = 0u;
      *(_OWORD *)(v7 + 128) = 0u;
      *(_OWORD *)(v7 + 144) = 0u;
      *(_OWORD *)(v7 + 96) = 0u;
      *(_OWORD *)(v7 + 112) = 0u;
      *(_OWORD *)(v7 + 64) = 0u;
      *(_OWORD *)(v7 + 80) = 0u;
      *(_OWORD *)(v7 + 32) = 0u;
      *(_OWORD *)(v7 + 48) = 0u;
      *(_OWORD *)uint64_t v7 = 0u;
      *(_OWORD *)(v7 + 16) = 0u;
      *(void *)uint64_t v7 = 0x100000001;
      *(_DWORD *)(v7 + 8) = *(_DWORD *)(a2 + 180) & 0x10;
      *(void *)(v7 + 16) = *a1;
      *a3 = v7;
    }
    else
    {
      return 4294967294;
    }
  }
  return result;
}

uint64_t digestmd5_client_mech_step(uint64_t a1, uint64_t a2, char *a3, unsigned int a4, uint64_t **a5, const char **a6, _DWORD *a7, uint64_t a8)
{
  uint64_t v16 = *(unsigned char **)(a2 + 8);
  if (v16 && (char v17 = *v16) != 0)
  {
    unsigned int v18 = 0;
    unsigned int v19 = v16 + 1;
    do
    {
      unsigned int v18 = 2 * (v18 ^ v17);
      int v20 = *v19++;
      char v17 = v20;
    }
    while (v20);
  }
  else
  {
    unsigned int v18 = 0;
  }
  if (a4 > 0x800) {
    return 4294967291;
  }
  unsigned int v22 = *(_DWORD *)(*(void *)(a1 + 16) + 24);
  *a6 = 0;
  *a7 = 0;
  int v23 = *(_DWORD *)a1;
  if (*(_DWORD *)a1 == 3) {
    goto LABEL_130;
  }
  if (v23 == 2)
  {
LABEL_23:
    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 client step 2");
    if (*(_DWORD *)(a2 + 80) > *(_DWORD *)(a2 + 84)) {
      return 4294967289;
    }
    if (*(void *)(a1 + 40))
    {
      uint64_t v26 = *(const char ***)(a1 + 64);
      int v27 = *(_DWORD *)(a1 + 72);
LABEL_29:
      uint64_t client_response = ask_user_info(a1, a2, v26, v27, a5, a8);
      if (client_response) {
        return client_response;
      }
      uint64_t client_response = make_client_response(a1, a2, a8);
      if (client_response) {
        return client_response;
      }
      uint64_t v28 = *(const char **)(a1 + 160);
      *a7 = strlen(v28);
      *a6 = v28;
      int v29 = 3;
      goto LABEL_34;
    }
    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 parse_server_challenge()");
    uint64_t v30 = *(void *)(a2 + 24);
    if (a3 && a4)
    {
      unint64_t v31 = (char *)(*(uint64_t (**)(void))(v30 + 40))(a4 + 1);
      v109[0] = v31;
      if (v31)
      {
        uint64_t v32 = v31;
        memcpy(v31, a3, a4);
        v32[a4] = 0;
        *(void *)(a1 + 336) = 0x10000;
        uint64_t nonce = create_nonce(*(void *)(a2 + 24));
        *(void *)(a1 + 56) = nonce;
        int v101 = v32;
        if (!nonce)
        {
          (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "failed to create cnonce");
          uint64_t v26 = 0;
          int v27 = 0;
          v104 = 0;
          LODWORD(v74) = 0;
LABEL_195:
          uint64_t client_response = 0xFFFFFFFFLL;
          goto LABEL_196;
        }
        if (!*v32)
        {
          v104 = 0;
          LODWORD(v74) = 0;
          goto LABEL_193;
        }
        uint64_t v99 = 0;
        unsigned int v100 = (char **)(a1 + 40);
        int v93 = 0;
        int v98 = 0;
        int v95 = 0;
        int v96 = 0;
        int v105 = 0;
        uint64_t v26 = 0;
        unsigned int v94 = (void *)(a1 + 336);
        uint64_t v97 = (void *)(a1 + 312);
        while (1)
        {
          v107 = (char *)0xAAAAAAAAAAAAAAAALL;
          v108 = (char *)0xAAAAAAAAAAAAAAAALL;
          get_pair(v109, &v108, &v107);
          char v34 = v108;
          if (!v108)
          {
            v104 = v26;
            (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parse error");
            goto LABEL_209;
          }
          if (!*v108) {
            goto LABEL_167;
          }
          if (!strcasecmp(v108, "realm"))
          {
            uint64_t v35 = *(void *)(a2 + 24);
            if (v26) {
              uint64_t v36 = (*(uint64_t (**)(const char **, uint64_t))(v35 + 56))(v26, 8 * (v105 + 2));
            }
            else {
              uint64_t v36 = (*(uint64_t (**)(uint64_t))(v35 + 40))(8 * (v105 + 2));
            }
            uint64_t v26 = (const char **)v36;
            uint64_t v45 = v105 + 1;
            if (v36)
            {
              _plug_strdup(*(void *)(a2 + 24), v107, (char **)(v36 + 8 * v105++), 0);
              v26[v45] = 0;
              goto LABEL_83;
            }
            v104 = 0;
            uint64_t client_response = 4294967294;
            LODWORD(v74) = v105 + 1;
            goto LABEL_214;
          }
          if (!strcasecmp(v34, "nonce"))
          {
            _plug_strdup(*(void *)(a2 + 24), v107, v100, 0);
            *(_DWORD *)(a1 + 48) = 1;
          }
          else
          {
            if (!strcasecmp(v34, "qop"))
            {
              uint64_t v102 = v26;
              long long v37 = v107;
              if (!v107)
              {
LABEL_79:
                HIDWORD(v99) = 1;
                uint64_t v26 = v102;
                goto LABEL_83;
              }
              while (2)
              {
                if (!*v37) {
                  goto LABEL_79;
                }
                for (uint64_t i = v37; ; v107 = ++i)
                {
                  while (1)
                  {
                    unsigned int v39 = *i;
                    BOOL v86 = v39 > 0x20;
                    uint64_t v40 = (1 << v39) & 0x100002600;
                    if (v86 || v40 == 0) {
                      break;
                    }
                    ++i;
                  }
                  v107 = i;
                  if (*i != 44) {
                    break;
                  }
                }
                if (!*i) {
                  goto LABEL_79;
                }
                uint64_t v42 = strchr(i, 44);
                long long v37 = v42;
                if (v42)
                {
                  *uint64_t v42 = 0;
                  long long v37 = v42 + 1;
                }
                int v43 = skip_r_lws(i);
                if (v43)
                {
                  *int v43 = 0;
                  if (!strcasecmp(i, "auth-conf"))
                  {
                    int v44 = v99 | 4;
                  }
                  else if (!strcasecmp(i, "auth-int"))
                  {
                    int v44 = v99 | 2;
                  }
                  else
                  {
                    if (strcasecmp(i, "auth"))
                    {
                      (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "Server supports unknown layer: %s\n", i);
                      goto LABEL_78;
                    }
                    int v44 = v99 | 1;
                  }
                  LODWORD(v99) = v44;
                }
LABEL_78:
                v107 = v37;
                if (!v37) {
                  goto LABEL_79;
                }
                continue;
              }
            }
            if (!strcasecmp(v34, "cipher"))
            {
              long long v46 = v107;
              if (v107)
              {
                do
                {
                  if (!*v46) {
                    break;
                  }
                  while (1)
                  {
                    while (1)
                    {
                      unsigned int v47 = *v46;
                      BOOL v86 = v47 > 0x20;
                      uint64_t v48 = (1 << v47) & 0x100002600;
                      if (v86 || v48 == 0) {
                        break;
                      }
                      ++v46;
                    }
                    v107 = v46;
                    if (*v46 != 44) {
                      break;
                    }
                    v107 = ++v46;
                  }
                  if (!*v46) {
                    break;
                  }
                  __n128 v50 = strchr(v46, 44);
                  if (v50)
                  {
                    *__n128 v50 = 0;
                    v92 = v50 + 1;
                  }
                  else
                  {
                    v92 = 0;
                  }
                  char v51 = skip_r_lws(v46);
                  if (v51)
                  {
                    int v103 = v26;
                    *char v51 = 0;
                    unsigned int v52 = available_ciphers;
                    if (available_ciphers)
                    {
                      long long v53 = &off_1EB527A98;
                      while (strcasecmp(v46, v52))
                      {
                        int v54 = *v53;
                        v53 += 7;
                        unsigned int v52 = v54;
                        if (!v54) {
                          goto LABEL_103;
                        }
                      }
                      v96 |= *((_DWORD *)v53 - 10);
                    }
                    else
                    {
LABEL_103:
                      (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "Server supports unknown cipher: %s\n", v46);
                    }
                    uint64_t v26 = v103;
                  }
                  long long v46 = v92;
                  v107 = v92;
                }
                while (v92);
              }
              goto LABEL_83;
            }
            if (!strcasecmp(v34, "stale") && *v97)
            {
              if (*(_DWORD *)(a1 + 320)) {
                _plug_free_secret(*(unsigned int **)(a2 + 24), v97);
              }
              *uint64_t v97 = 0;
              goto LABEL_83;
            }
            if (!strcasecmp(v34, "maxbuf"))
            {
              if (v95)
              {
                v104 = v26;
                (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "At least two maxbuf directives found. Authentication aborted");
              }
              else if (str2ul32((uint64_t)v107, v94))
              {
                if (*v94 <= 0x10uLL)
                {
                  v104 = v26;
                  (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Invalid maxbuf parameter received from server (too small: %s)");
                }
                else
                {
                  if (!(*v94 >> 24))
                  {
                    int v95 = 1;
                    goto LABEL_83;
                  }
                  v104 = v26;
                  (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Invalid maxbuf parameter received from server (too big: %s)");
                }
              }
              else
              {
                v104 = v26;
                (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Invalid maxbuf parameter received from server (%s)");
              }
LABEL_209:
              uint64_t client_response = 4294967283;
              goto LABEL_210;
            }
            if (!strcasecmp(v34, "charset"))
            {
              if (!strcasecmp(v107, "utf-8")) {
                goto LABEL_83;
              }
              v104 = v26;
              (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Charset must be UTF-8");
              goto LABEL_209;
            }
            if (!strcasecmp(v34, "algorithm"))
            {
              uint64_t v55 = v107;
              if (*(_DWORD *)(a1 + 8))
              {
                if (!strcasecmp(v107, "md5") || !strcasecmp(v55, "md5-sess"))
                {
                  _plug_strdup(*(void *)(a2 + 24), v55, (char **)(a1 + 344), 0);
                  goto LABEL_127;
                }
LABEL_237:
                v104 = v26;
                (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "'algorithm' isn't 'md5-sess'");
              }
              else
              {
                if (strcasecmp(v107, "md5-sess")) {
                  goto LABEL_237;
                }
LABEL_127:
                if (v98 < 1)
                {
                  ++v98;
                  goto LABEL_83;
                }
                v104 = v26;
                (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Must see 'algorithm' only once");
              }
LABEL_239:
              uint64_t client_response = 0xFFFFFFFFLL;
LABEL_210:
              LODWORD(v74) = v105;
LABEL_214:
              uint64_t v26 = 0;
              int v27 = 0;
              goto LABEL_196;
            }
            if (!strcasecmp(v34, "opaque"))
            {
              if (!*(_DWORD *)(a1 + 8)) {
                goto LABEL_83;
              }
              _plug_strdup(*(void *)(a2 + 24), v107, (char **)(a1 + 352), 0);
              if (v93 < 1)
              {
                ++v93;
                goto LABEL_83;
              }
              v104 = v26;
              (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Must see 'opaque' only once");
              goto LABEL_239;
            }
            (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 unrecognized pair %s/%s: ignoring", v34, v107);
          }
LABEL_83:
          if (!*v109[0])
          {
LABEL_167:
            LODWORD(v74) = v105;
            char v75 = v99;
            v104 = v26;
            if (!v99)
            {
              if (HIDWORD(v99))
              {
                (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Server doesn't support any known qop level");
                uint64_t v26 = 0;
                int v27 = 0;
                uint64_t client_response = 4294967283;
                goto LABEL_196;
              }
              char v75 = 1;
            }
            if (v98 == 1)
            {
              if (*v100)
              {
                unsigned int v76 = *(_DWORD *)(a2 + 112);
                if (*(_DWORD *)(a1 + 8) || *(_DWORD *)(a2 + 88))
                {
                  unsigned int v78 = *(_DWORD *)(a2 + 80);
                  unsigned int v77 = *(_DWORD *)(a2 + 84);
                  BOOL v79 = v77 >= v76;
                  unsigned int v80 = v77 - v76;
                  if (v79) {
                    unsigned int v81 = v80;
                  }
                  else {
                    unsigned int v81 = 0;
                  }
                  BOOL v79 = v78 >= v76;
                  unsigned int v82 = v78 - v76;
                  if (v79) {
                    unsigned int v83 = v82;
                  }
                  else {
                    unsigned int v83 = 0;
                  }
                  if ((v75 & 4) != 0 && v81 >= 2)
                  {
                    if (available_ciphers)
                    {
                      uint64_t v84 = &available_ciphers;
                      do
                      {
                        unsigned int v85 = *((_DWORD *)v84 + 2);
                        BOOL v86 = v81 < v85 || v83 > v85;
                        if (!v86 && (v84[2] & v96) != 0)
                        {
                          uint64_t v87 = *(void *)(a1 + 328);
                          if (!v87 || v85 > *(_DWORD *)(v87 + 8)) {
                            *(void *)(a1 + 328) = v84;
                          }
                        }
                        uint64_t v88 = v84[7];
                        v84 += 7;
                      }
                      while (v88);
                    }
                    if (*(void *)(a1 + 328)) {
                      *(_DWORD *)(a1 + 324) = 4;
                    }
                    else {
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "No good privacy layers");
                    }
                  }
                }
                else
                {
                  unsigned int v83 = 0;
                  unsigned int v81 = 0;
                }
                if (*(void *)(a1 + 328))
                {
                  uint64_t client_response = 0;
                }
                else
                {
                  if ((v75 & 2) == 0 || !v81 || v83 > 1)
                  {
                    if (v83)
                    {
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Can't find an acceptable layer");
                      uint64_t v26 = 0;
                      int v27 = 0;
                      uint64_t client_response = 4294967281;
                    }
                    else
                    {
                      *(_DWORD *)(a1 + 324) = 1;
                      if (v75)
                      {
                        uint64_t client_response = 0;
                        goto LABEL_225;
                      }
                      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Server doesn't support \"no layer\"");
                      uint64_t v26 = 0;
                      int v27 = 0;
                      uint64_t client_response = 0xFFFFFFFFLL;
                    }
                    LODWORD(v74) = v105;
LABEL_196:
                    (*(void (**)(char *))(*(void *)(a2 + 24) + 64))(v101);
                    if (client_response && v104)
                    {
                      uint64_t v106 = a8;
                      if ((int)v74 >= 1)
                      {
                        uint64_t v74 = v74;
                        int v89 = v104;
                        do
                        {
                          uint64_t v90 = (uint64_t)*v89++;
                          (*(void (**)(uint64_t))(*(void *)(a2 + 24) + 64))(v90);
                          --v74;
                        }
                        while (v74);
                      }
                      (*(void (**)(const char **))(*(void *)(a2 + 24) + 64))(v104);
                      a8 = v106;
                    }
                    if (client_response) {
                      return client_response;
                    }
                    if (v27 == 1)
                    {
                      uint64_t v91 = *(void *)(a1 + 32);
                      if (v91) {
                        (*(void (**)(uint64_t))(*(void *)(a2 + 24) + 64))(v91);
                      }
                      *(void *)(a1 + 32) = *v26;
                      (*(void (**)(const char **))(*(void *)(a2 + 24) + 64))(v26);
                      uint64_t v26 = 0;
                      int v27 = 1;
                    }
                    else
                    {
                      *(void *)(a1 + 64) = v26;
                      *(_DWORD *)(a1 + 72) = v27;
                    }
                    goto LABEL_29;
                  }
                  uint64_t client_response = 0;
                  *(_DWORD *)(a1 + 324) = 2;
                }
LABEL_225:
                LODWORD(v74) = v105;
                int v27 = v105;
                goto LABEL_196;
              }
              (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Don't have nonce.");
              goto LABEL_194;
            }
LABEL_193:
            (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Must see 'algorithm' once. Didn't see at all");
LABEL_194:
            uint64_t v26 = 0;
            int v27 = 0;
            goto LABEL_195;
          }
        }
      }
      return 4294967294;
    }
    (*(void (**)(void, void, const char *))(v30 + 264))(*(void *)(v30 + 8), 0, "no server challenge");
    return 0xFFFFFFFFLL;
  }
  if (v23 != 1)
  {
    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 1, "Invalid DIGEST-MD5 client step %d\n", *(_DWORD *)a1);
    return 0xFFFFFFFFLL;
  }
  unsigned int v24 = v18 % v22;
  if (a3)
  {
    if (strncasecmp(a3, "rspauth=", 8uLL))
    {
      *(_DWORD *)a1 = 2;
      if (!(*(unsigned int (**)(void))(*(void *)(a2 + 24) + 80))(*(void *)(*(void *)(a1 + 16)
                                                                                             + 16)))
      {
        double v25 = clear_reauth_entry(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v24, 1, *(void *)(a2 + 24));
        (*(void (**)(void, double))(*(void *)(a2 + 24) + 88))(*(void *)(*(void *)(a1 + 16) + 16), v25);
      }
      if (*(void *)(a1 + 32)) {
        (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      }
      if (*(void *)(a1 + 40)) {
        (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      }
      if (*(void *)(a1 + 56)) {
        (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      }
      *(void *)(a1 + 56) = 0;
      *(void *)(a1 + 328) = 0;
      *(void *)(a1 + 32) = 0;
      *(void *)(a1 + 40) = 0;
      goto LABEL_23;
    }
    *(_DWORD *)a1 = 3;
LABEL_130:
    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 client step 3");
    unsigned int v56 = (char *)(*(uint64_t (**)(void))(*(void *)(a2 + 24) + 40))(a4 + 1);
    v109[0] = v56;
    if (v56)
    {
      unsigned int v57 = v56;
      memcpy(v56, a3, a4);
      v57[a4] = 0;
      if (*v57)
      {
        while (1)
        {
          v107 = (char *)0xAAAAAAAAAAAAAAAALL;
          v108 = (char *)0xAAAAAAAAAAAAAAAALL;
          get_pair(v109, &v108, &v107);
          uint64_t v58 = v108;
          if (!v108)
          {
            (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "DIGEST-MD5 Received Garbage");
            uint64_t client_response = 4294967283;
            goto LABEL_137;
          }
          if (!*v108) {
            goto LABEL_136;
          }
          if (!strcasecmp(v108, "rspauth")) {
            break;
          }
          (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 unrecognized pair %s/%s: ignoring", v58, v107);
          if (!*v109[0]) {
            goto LABEL_136;
          }
        }
        if (!strcmp(*(const char **)(a1 + 80), v107))
        {
          uint64_t client_response = 0;
          *(_DWORD *)a8 = 1;
          *(_DWORD *)(a8 + 136) = 0;
        }
        else
        {
          (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "DIGEST-MD5: This server wants us to believe that it knows shared secret");
          uint64_t client_response = 4294967286;
        }
      }
      else
      {
LABEL_136:
        uint64_t client_response = 0xFFFFFFFFLL;
      }
LABEL_137:
      (*(void (**)(char *))(*(void *)(a2 + 24) + 64))(v57);
      if (!(*(unsigned int (**)(void))(*(void *)(a2 + 24) + 80))(*(void *)(*(void *)(a1 + 16)
                                                                                             + 16)))
      {
        uint64_t v60 = *(unsigned char **)(a2 + 8);
        if (v60 && (char v61 = *v60) != 0)
        {
          unsigned int v62 = 0;
          unsigned int v63 = v60 + 1;
          do
          {
            unsigned int v62 = 2 * (v62 ^ v61);
            int v64 = *v63++;
            char v61 = v64;
          }
          while (v64);
        }
        else
        {
          unsigned int v62 = 0;
        }
        uint64_t v65 = *(void *)(a1 + 16);
        unsigned int v66 = v62 % *(_DWORD *)(v65 + 24);
        unsigned int v67 = *(_DWORD *)(a1 + 48);
        if (client_response)
        {
          if (v67 >= 2) {
            v59.n128_f64[0] = clear_reauth_entry(*(void *)(v65 + 32) + 88 * v66, 1, *(void *)(a2 + 24));
          }
        }
        else if (v67 == 1)
        {
          clear_reauth_entry(*(void *)(v65 + 32) + 88 * v66, 1, *(void *)(a2 + 24));
          _plug_strdup(*(void *)(a2 + 24), *(char **)(a8 + 16), (char **)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v66), 0);
          uint64_t v72 = *(void *)(*(void *)(a1 + 16) + 32) + 88 * v66;
          long long v73 = *(_OWORD *)(a1 + 32);
          *(void *)(a1 + 32) = 0;
          *(_OWORD *)(v72 + 8) = v73;
          *(void *)(a1 + 40) = 0;
          *(_DWORD *)(v72 + 24) = *(_DWORD *)(a1 + 48);
          *(void *)(v72 + 32) = *(void *)(a1 + 56);
          *(void *)(a1 + 56) = 0;
          _plug_strdup(*(void *)(a2 + 24), *(char **)(a2 + 8), (char **)(v72 + 40), 0);
          if (*(_DWORD *)(a1 + 8))
          {
            *(void *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v66 + 72) = *(void *)(a1 + 344);
            *(void *)(a1 + 344) = 0;
            *(void *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v66 + 80) = *(void *)(a1 + 352);
            *(void *)(a1 + 352) = 0;
          }
          *(_DWORD *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v66 + 48) = *(_DWORD *)(a1 + 324);
          *(void *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v66 + 56) = *(void *)(a1 + 328);
          *(void *)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v66 + 64) = *(void *)(a1 + 336);
        }
        (*(void (**)(void, __n128))(*(void *)(a2 + 24) + 88))(*(void *)(*(void *)(a1 + 16) + 16), v59);
      }
      return client_response;
    }
    return 4294967294;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a2 + 24) + 80))(*(void *)(*(void *)(a1 + 16) + 16))) {
    goto LABEL_33;
  }
  uint64_t v68 = *(void *)(a1 + 16);
  uint64_t v69 = *(const char **)(*(void *)(v68 + 32) + 88 * v24 + 40);
  if (!v69)
  {
    (*(void (**)(void))(*(void *)(a2 + 24) + 88))(*(void *)(v68 + 16));
    goto LABEL_33;
  }
  int v70 = strcasecmp(v69, *(const char **)(a2 + 8));
  (*(void (**)(void))(*(void *)(a2 + 24) + 88))(*(void *)(v68 + 16));
  if (v70)
  {
LABEL_33:
    int v29 = 2;
LABEL_34:
    *(_DWORD *)a1 = v29;
    return 1;
  }
  return digestmd5_client_mech_step1(a1, a2, a5, a6, a7, a8);
}

uint64_t digestmd5_client_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result && a2)
  {
    uint64_t v3 = result;
    (*(void (**)(void, uint64_t, const char *))(a2 + 256))(*(void *)(a2 + 8), 5, "DIGEST-MD5 client mech dispose");
    if (*(_DWORD *)(v3 + 320)) {
      _plug_free_secret((unsigned int *)a2, (void *)(v3 + 312));
    }
    if (*(void *)(v3 + 344)) {
      (*(void (**)(void))(a2 + 64))();
    }
    if (*(void *)(v3 + 352)) {
      (*(void (**)(void))(a2 + 64))();
    }
    return digestmd5_common_mech_dispose(v3, a2);
  }
  return result;
}

uint64_t digestmd5_client_mech_step1(uint64_t a1, uint64_t a2, uint64_t **a3, const char **a4, _DWORD *a5, uint64_t a6)
{
  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 client step 1");
  uint64_t result = ask_user_info(a1, a2, 0, 0, a3, a6);
  if (!result)
  {
    uint64_t v13 = *(unsigned char **)(a2 + 8);
    if (v13 && (char v14 = *v13) != 0)
    {
      unsigned int v15 = 0;
      uint64_t v16 = v13 + 1;
      do
      {
        unsigned int v15 = 2 * (v15 ^ v14);
        int v17 = *v16++;
        char v14 = v17;
      }
      while (v17);
    }
    else
    {
      unsigned int v15 = 0;
    }
    uint64_t v18 = *(void *)(a1 + 16);
    unsigned int v19 = *(_DWORD *)(v18 + 24);
    if (!(*(unsigned int (**)(void))(*(void *)(a2 + 24) + 80))(*(void *)(v18 + 16)))
    {
      unsigned int v20 = v15 % v19;
      uint64_t v21 = *(void *)(a1 + 16);
      uint64_t v22 = *(void *)(v21 + 32);
      int v23 = (const char **)(v22 + 88 * v20);
      unsigned int v24 = v23[5];
      if (v24 && !strcasecmp(v24, *(const char **)(a2 + 8)) && !strcmp(*v23, *(const char **)(a6 + 16)))
      {
        if (*(void *)(a1 + 32))
        {
          (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
          uint64_t v22 = *(void *)(*(void *)(a1 + 16) + 32);
        }
        _plug_strdup(*(void *)(a2 + 24), *(char **)(v22 + 88 * v20 + 8), (char **)(a1 + 32), 0);
        _plug_strdup(*(void *)(a2 + 24), *(char **)(*(void *)(*(void *)(a1 + 16) + 32) + 88 * v20 + 16), (char **)(a1 + 40), 0);
        uint64_t v25 = *(void *)(*(void *)(a1 + 16) + 32) + 88 * v20;
        int v26 = *(_DWORD *)(v25 + 24) + 1;
        *(_DWORD *)(v25 + 24) = v26;
        *(_DWORD *)(a1 + 48) = v26;
        _plug_strdup(*(void *)(a2 + 24), *(char **)(v25 + 32), (char **)(a1 + 56), 0);
        uint64_t v21 = *(void *)(a1 + 16);
        if (*(_DWORD *)(a1 + 8))
        {
          _plug_strdup(*(void *)(a2 + 24), *(char **)(*(void *)(v21 + 32) + 88 * v20 + 72), (char **)(a1 + 344), 0);
          uint64_t v21 = *(void *)(a1 + 16);
          int v27 = *(char **)(*(void *)(v21 + 32) + 88 * v20 + 80);
          if (v27)
          {
            _plug_strdup(*(void *)(a2 + 24), v27, (char **)(a1 + 352), 0);
            uint64_t v21 = *(void *)(a1 + 16);
          }
        }
        uint64_t v28 = *(void *)(v21 + 32) + 88 * v20;
        *(_DWORD *)(a1 + 324) = *(_DWORD *)(v28 + 48);
        *(void *)(a1 + 328) = *(void *)(v28 + 56);
        *(void *)(a1 + 336) = *(void *)(v28 + 64);
      }
      (*(void (**)(void))(*(void *)(a2 + 24) + 88))(*(void *)(v21 + 16));
    }
    if (*(void *)(a1 + 40))
    {
      uint64_t result = make_client_response(a1, a2, a6);
      if (result) {
        return result;
      }
      int v29 = *(const char **)(a1 + 160);
      *a5 = strlen(v29);
      *a4 = v29;
    }
    else
    {
      *(_DWORD *)a1 = 2;
    }
    return 1;
  }
  return result;
}

uint64_t ask_user_info(uint64_t a1, uint64_t a2, const char **a3, int a4, uint64_t **a5, uint64_t a6)
{
  int v44 = 0;
  uint64_t v45 = 0;
  __s = 0;
  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 ask_user_info()");
  if (*(void *)(a6 + 16))
  {
    int v12 = 0;
  }
  else
  {
    uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 16386, 1, &v45, a5);
    int v12 = simple;
    uint64_t realm = simple;
    if ((simple & 0xFFFFFFFD) != 0) {
      return realm;
    }
  }
  if (*(void *)(a6 + 8))
  {
    int v13 = 0;
  }
  else
  {
    uint64_t v19 = _plug_get_simple(*(void *)(a2 + 24), 16385, 0, &v44, a5);
    int v13 = v19;
    uint64_t realm = v19;
    if ((v19 & 0xFFFFFFFD) != 0) {
      return realm;
    }
  }
  if (*(void *)(a1 + 312))
  {
    int v14 = 0;
  }
  else
  {
    uint64_t password = _plug_get_password(*(void *)(a2 + 24), (size_t **)(a1 + 312), (_DWORD *)(a1 + 320), (const void ***)a5);
    int v14 = password;
    uint64_t realm = password;
    if ((password & 0xFFFFFFFD) != 0) {
      return realm;
    }
  }
  uint64_t v16 = *(void *)(a1 + 32);
  unsigned int v15 = (char **)(a1 + 32);
  if (!v16)
  {
    if (a3)
    {
      if (a4 == 1)
      {
        LODWORD(realm) = 0;
        uint64_t v21 = (char *)*a3;
LABEL_21:
        __s = v21;
        goto LABEL_22;
      }
      uint64_t realm = _plug_get_realm(*(void *)(a2 + 24), (uint64_t)a3, &__s, a5);
      if ((realm & 0xFFFFFFFD) == 0) {
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t realm = 0xFFFFFFFFLL;
    }
    uint64_t v21 = *(char **)(a2 + 8);
    if (!v21) {
      return realm;
    }
    goto LABEL_21;
  }
  LODWORD(realm) = -1;
LABEL_22:
  if (a5 && *a5)
  {
    (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
    *a5 = 0;
  }
  if (v12 != 2 && v13 != 2 && v14 != 2 && realm != 2)
  {
    if (*(void *)(a6 + 16))
    {
LABEL_30:
      if (__s && !*v15) {
        _plug_strdup(*(void *)(a2 + 24), __s, v15, 0);
      }
      return 0;
    }
    if (v44)
    {
      uint64_t v31 = v45;
      if (*v44)
      {
        uint64_t realm = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v45, 0, 1, a6);
        if (realm) {
          return realm;
        }
        uint64_t v32 = (*(uint64_t (**)(void, unsigned char *, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v44, 0, 2, a6);
        goto LABEL_52;
      }
    }
    else
    {
      uint64_t v31 = v45;
    }
    uint64_t v32 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v31, 0, 3, a6);
LABEL_52:
    uint64_t realm = v32;
    if (v32) {
      return realm;
    }
    goto LABEL_30;
  }
  if (realm == 2)
  {
    if (a3)
    {
      int v42 = v14;
      uint64_t v22 = a4;
      uint64_t v23 = 17;
      if (a4 >= 1)
      {
        uint64_t v24 = a4;
        uint64_t v25 = a3;
        do
        {
          int v26 = *v25++;
          v23 += strlen(v26) + 4;
          --v24;
        }
        while (v24);
      }
      int v27 = (char *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(v23 + 1);
      strcpy(v27, "Available realms:");
      if (a4 >= 1)
      {
        do
        {
          strcat(v27, " {");
          uint64_t v28 = *a3++;
          int v29 = strcat(v27, v28);
          strcpy(&v27[strlen(v29)], "},");
          --v22;
        }
        while (v22);
      }
      v27[v23 - 1] = 46;
      uint64_t v30 = "Please enter your realm";
      int v14 = v42;
    }
    else
    {
      char v33 = *(const char **)(a2 + 8);
      if (v33)
      {
        size_t v34 = strlen(v33);
        uint64_t v35 = (char *)(*(uint64_t (**)(size_t))(*(void *)(a2 + 24) + 40))(v34 + 3);
        if (!v35) {
          return 4294967294;
        }
        int v27 = v35;
        sprintf(v35, "{%s}", *(const char **)(a2 + 8));
      }
      else
      {
        int v27 = 0;
      }
      uint64_t v30 = "Please enter your realm";
    }
  }
  else
  {
    uint64_t v30 = 0;
    int v27 = 0;
  }
  if (v13 == 2) {
    uint64_t v36 = "Please enter your authorization name";
  }
  else {
    uint64_t v36 = 0;
  }
  if (v12 == 2) {
    long long v37 = "Please enter your authentication name";
  }
  else {
    long long v37 = 0;
  }
  if (v14 == 2) {
    long long v38 = "Please enter your password";
  }
  else {
    long long v38 = 0;
  }
  unsigned int v39 = "{}";
  if (v27) {
    unsigned int v39 = v27;
  }
  unsigned int prompts = _plug_make_prompts(*(void *)(a2 + 24), a5, (uint64_t)v36, 0, (uint64_t)v37, 0, (uint64_t)v38, 0, 0, 0, 0, (uint64_t)v39, (uint64_t)v30, *(void *)(a2 + 8));
  if (prompts) {
    return prompts;
  }
  else {
    return 2;
  }
}

uint64_t make_client_response(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  memset(__str, 170, 10);
  *(void *)&long long v6 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v69 = v6;
  long long v70 = v6;
  *(_OWORD *)unsigned int v67 = v6;
  long long v68 = v6;
  unsigned int v66 = 0;
  unint64_t v65 = 0xAAAAAAAAAAAAAAAALL;
  long long v63 = v6;
  long long v64 = v6;
  (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(*(void *)(*(void *)(a2 + 24) + 8), 5, "DIGEST-MD5 make_client_response()");
  if (*(_DWORD *)(a3 + 36) < 2u) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *(void (**)(uint64_t))(a1 + 288);
  }
  int v8 = *(_DWORD *)(a1 + 324);
  if (v8 == 2)
  {
    unsigned int v10 = 0;
    *(void *)(a3 + 48) = digestmd5_encode;
    *(void *)(a3 + 64) = digestmd5_decode;
    *(_DWORD *)(a3 + 36) = 1;
    uint64_t v11 = "auth-int";
  }
  else
  {
    if (v8 != 4)
    {
      unsigned int v10 = 0;
      *(void *)(a3 + 48) = 0;
      *(void *)(a3 + 64) = 0;
      uint64_t v58 = "auth";
      *(_DWORD *)(a3 + 36) = 0;
      goto LABEL_10;
    }
    *(void *)(a3 + 48) = digestmd5_encode;
    *(void *)(a3 + 64) = digestmd5_decode;
    uint64_t v9 = *(void *)(a1 + 328);
    *(_DWORD *)(a3 + 36) = *(_DWORD *)(v9 + 8);
    unsigned int v10 = *(_DWORD *)(v9 + 12);
    *(_OWORD *)(a1 + 264) = *(_OWORD *)(v9 + 24);
    *(_OWORD *)(a1 + 280) = *(_OWORD *)(v9 + 40);
    uint64_t v11 = "auth-conf";
  }
  uint64_t v58 = (char *)v11;
LABEL_10:
  if (*(_DWORD *)(a1 + 8))
  {
    unsigned int v57 = v7;
    unsigned int v56 = v10;
    __n128 v59 = 0;
    int v12 = *(long long **)(a2 + 136);
  }
  else
  {
    size_t v13 = strlen(*(const char **)a2);
    size_t v14 = strlen(*(const char **)(a2 + 8));
    unsigned int v15 = (char *)(*(uint64_t (**)(size_t))(*(void *)(a2 + 24) + 40))(v13 + v14 + 3);
    if (!v15) {
      return 4294967294;
    }
    uint64_t v16 = v15;
    unsigned int v57 = v7;
    unsigned int v56 = v10;
    int v17 = strcpy(v15, *(const char **)a2);
    *(_WORD *)&v16[strlen(v17)] = 47;
    strcat(v16, *(const char **)(a2 + 8));
    *(void *)&long long v63 = "AUTHENTICATE";
    *((void *)&v63 + 1) = v16;
    __n128 v59 = v16;
    long long v64 = 0uLL;
    LODWORD(v65) = 0;
    int v12 = &v63;
  }
  uint64_t v61 = a3;
  unsigned int v62 = v12;
  uint64_t v60 = a2;
  uint64_t v18 = *(void *)(a2 + 24);
  uint64_t v19 = *(const char **)(a1 + 344);
  unsigned int v20 = *(char **)(a1 + 32);
  uint64_t v21 = *(const char **)(a1 + 40);
  int v22 = *(_DWORD *)(a1 + 48);
  uint64_t v23 = *(const char **)(a1 + 56);
  uint64_t v24 = *(char **)(a1 + 312);
  uint64_t v27 = a3 + 8;
  int v26 = *(const char **)(a3 + 8);
  uint64_t v25 = *(char **)(v27 + 8);
  int v28 = strcmp(v26, v25);
  char v76 = -86;
  if (v28) {
    int v29 = v26;
  }
  else {
    int v29 = 0;
  }
  unint64_t v74 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v75 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v30 = (char **)v62;
  if (v24 && v62 && v22 && v21 && v25 && v23)
  {
    uint64_t v55 = v29;
    char v78 = -86;
    *(void *)&long long v31 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v77[0] = v31;
    v77[1] = v31;
    v72[0] = v31;
    v72[1] = v31;
    char v73 = -86;
    if (v20) {
      uint64_t v32 = v20;
    }
    else {
      uint64_t v32 = "";
    }
    unint64_t v87 = 0xAAAAAAAAAAAAAAAALL;
    long long v85 = v31;
    long long v86 = v31;
    long long v83 = v31;
    long long v84 = v31;
    long long v82 = v31;
    memset(v81, 170, sizeof(v81));
    DigestCalcSecret(v18, v25, v32, v24 + 8, *(unsigned int *)v24, 0, (uint64_t)v81);
    if (!*(_DWORD *)(a1 + 8) || v19 && !strcasecmp(v19, "md5-sess"))
    {
      (*(void (**)(long long *))(v18 + 104))(&v82);
      if (*(_DWORD *)(a1 + 8))
      {
        char v80 = -86;
        *(void *)&long long v33 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v79[0] = v33;
        v79[1] = v33;
        CvtHex((uint64_t)v81, (uint64_t)v79);
        (*(void (**)(long long *, _OWORD *, uint64_t))(v18 + 112))(&v82, v79, 32);
      }
      else
      {
        (*(void (**)(long long *, unsigned char *, uint64_t))(v18 + 112))(&v82, v81, 16);
      }
      (*(void (**)(long long *, void *, uint64_t))(v18 + 112))(&v82, &COLON, 1);
      size_t v36 = strlen(v21);
      (*(void (**)(long long *, const char *, size_t))(v18 + 112))(&v82, v21, v36);
      (*(void (**)(long long *, void *, uint64_t))(v18 + 112))(&v82, &COLON, 1);
      size_t v37 = strlen(v23);
      (*(void (**)(long long *, const char *, size_t))(v18 + 112))(&v82, v23, v37);
      if (v55)
      {
        (*(void (**)(long long *, void *, uint64_t))(v18 + 112))(&v82, &COLON, 1);
        size_t v38 = strlen(v55);
        (*(void (**)(long long *, const char *, size_t))(v18 + 112))(&v82, v55, v38);
      }
      (*(void (**)(unsigned char *, long long *))(v18 + 120))(v81, &v82);
    }
    CvtHex((uint64_t)v81, (uint64_t)v77);
    *(_OWORD *)(a1 + 130) = *(_OWORD *)v81;
    *(unsigned char *)(a1 + 146) = v81[16];
    if (*(_DWORD *)(a1 + 8))
    {
      unint64_t v87 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v85 = v39;
      long long v86 = v39;
      long long v83 = v39;
      long long v84 = v39;
      long long v82 = v39;
      (*(void (**)(long long *))(v18 + 104))(&v82);
      (*(void (**)(long long *, void, void))(v18 + 112))(&v82, *((void *)v62 + 2), *((unsigned int *)v62 + 6));
      (*(void (**)(unint64_t *, long long *))(v18 + 120))(&v74, &v82);
    }
    else
    {
      unint64_t v74 = 0;
      unint64_t v75 = 0;
    }
    LOBYTE(v84) = -86;
    *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v82 = v40;
    long long v83 = v40;
    CvtHex((uint64_t)&v74, (uint64_t)v72);
    DigestCalcResponse(v18, (uint64_t)v77, v21, v22, v23, v58, *((const char **)v62 + 1), *(const char **)v62, (uint64_t)v72, (uint64_t)&v82);
    uint64_t v41 = (*(uint64_t (**)(uint64_t))(v18 + 40))(33);
    *(_OWORD *)uint64_t v41 = v82;
    *(_OWORD *)(v41 + 16) = v83;
    size_t v34 = (char *)v41;
    *(unsigned char *)(v41 + 32) = 0;
    DigestCalcResponse(v18, (uint64_t)v77, v21, v22, v23, v58, *((const char **)v62 + 1), 0, (uint64_t)v72, (uint64_t)&v82);
    int v42 = (_OWORD *)(*(uint64_t (**)(void, uint64_t))(v18 + 56))(*(void *)(a1 + 80), 33);
    if (v42)
    {
      *(void *)(a1 + 80) = v42;
      *int v42 = v82;
      v42[1] = v83;
      *(unsigned char *)(*(void *)(a1 + 80) + 32) = 0;
    }
    else
    {
      free(*(void **)(a1 + 80));
      size_t v34 = 0;
      *(void *)(a1 + 80) = 0;
    }
    uint64_t v30 = (char **)v62;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(v18 + 264))(*(void *)(v18 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/digestmd5.c near line %d", 3297);
    size_t v34 = 0;
  }
  uint64_t v43 = v60;
  unsigned int v66 = 0;
  if (*(void *)(a1 + 160)) {
    (*(void (**)(void))(*(void *)(v60 + 24) + 64))();
  }
  *(_DWORD *)(a1 + 168) = 0;
  *(void *)(a1 + 160) = 0;
  if (!add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "username", *(char **)(v61 + 16), 1)&& !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "realm", *(char **)(a1 + 32), 1))
  {
    uint64_t v45 = *(char **)(v61 + 8);
    if ((!strcmp(v45, *(const char **)(v61 + 16))
       || !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "authzid", v45, 1))&& !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "nonce", *(char **)(a1 + 40), 1)&& !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168),
                          &v66,
                          "cnonce",
                          *(char **)(a1 + 56),
                          1))
    {
      snprintf(__str, 0xAuLL, "%08x", *(_DWORD *)(a1 + 48));
      if (!add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "nc", __str, 0)&& !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "qop", v58, 0))
      {
        long long v46 = *(char ***)(a1 + 328);
        if (!v46
          || !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "cipher", *v46, 0))
        {
          if (*(_DWORD *)(v60 + 88))
          {
            snprintf(v67, 0x40uLL, "%d", *(_DWORD *)(v60 + 88));
            if (add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "maxbuf", v67, 0))
            {
              (*(void (**)(void, void, const char *))(*(void *)(v60 + 24) + 264))(*(void *)(*(void *)(v60 + 24) + 8), 0, "internal error: add_to_challenge maxbuf failed");
              uint64_t v35 = 0;
              goto LABEL_49;
            }
          }
          unsigned int v47 = *(_DWORD *)(a1 + 8) ? "uri" : "digest-uri";
          if (!add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, v47, v30[1], 1)&& (!*(_DWORD *)(a1 + 8)|| !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "algorithm", *(char **)(a1 + 344), 0)&& ((uint64_t v48 = *(char **)(a1 + 352)) == 0|| !add_to_challenge(*(void *)(v60 + 24),
                                  (uint64_t *)(a1 + 160),
                                  (unsigned int *)(a1 + 168),
                                  &v66,
                                  "opaque",
                                  v48,
                                  1)))
            && !add_to_challenge(*(void *)(v60 + 24), (uint64_t *)(a1 + 160), (unsigned int *)(a1 + 168), &v66, "response", v34, 0))
          {
            if (strlen(*(const char **)(a1 + 160)) > 0x800)
            {
              uint64_t v35 = 0xFFFFFFFFLL;
LABEL_90:
              uint64_t v43 = v60;
              goto LABEL_49;
            }
            int v49 = *(_DWORD *)(a1 + 336);
            *(_DWORD *)(v61 + 32) = v49;
            unsigned int v50 = *(_DWORD *)(v61 + 36);
            if (v50 <= 1)
            {
              if (v50 != 1)
              {
LABEL_81:
                *(void *)(a1 + 88) = 0;
                uint64_t v52 = *(void *)(v60 + 24);
                *(void *)(a1 + 152) = v52;
                if (v57)
                {
                  v57(a1);
                  uint64_t v52 = *(void *)(a1 + 152);
                }
                if (*(_DWORD *)(v60 + 88)) {
                  int v53 = *(_DWORD *)(v60 + 88);
                }
                else {
                  int v53 = 0xFFFF;
                }
                _plug_decode_init(a1 + 224, v52, v53);
                if (*(_DWORD *)(v61 + 36))
                {
                  *(void *)&long long v82 = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v82 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  *(void *)&v79[0] = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v79[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
                  create_layer_keys(a1, *(void *)(v60 + 24), a1 + 130, v56, (uint64_t)&v82, (uint64_t)v79);
                  int v54 = *(void (**)(uint64_t, long long *, _OWORD *))(a1 + 280);
                  if (v54) {
                    v54(a1, &v82, v79);
                  }
                }
                uint64_t v35 = 0;
                goto LABEL_90;
              }
              int v51 = -16;
            }
            else
            {
              int v51 = -25;
            }
            *(_DWORD *)(v61 + 32) = v51 + v49;
            goto LABEL_81;
          }
        }
      }
    }
  }
  uint64_t v35 = 0xFFFFFFFFLL;
LABEL_49:
  if (v59) {
    (*(void (**)(void))(*(void *)(v43 + 24) + 64))();
  }
  if (v34) {
    (*(void (**)(char *))(*(void *)(v43 + 24) + 64))(v34);
  }
  return v35;
}

const char *skip_r_lws(const char *result)
{
  if (result)
  {
    unint64_t v1 = (unint64_t)result;
    uint64_t result = (const char *)strlen(result);
    if (result)
    {
      result += v1;
      uint64_t v2 = result - 1;
      if ((unint64_t)(result - 1) > v1)
      {
        uint64_t result = (const char *)(v1 + 1);
        while (1)
        {
          unsigned int v3 = *(unsigned __int8 *)v2;
          BOOL v4 = v3 > 0x20;
          uint64_t v5 = (1 << v3) & 0x100002600;
          if (v4 || v5 == 0) {
            break;
          }
          if ((unint64_t)--v2 <= v1) {
            goto LABEL_13;
          }
        }
        uint64_t result = v2 + 1;
      }
      if (v2 == (const char *)v1)
      {
LABEL_13:
        unsigned int v7 = *(unsigned __int8 *)v1;
        BOOL v4 = v7 > 0x20;
        uint64_t v8 = (1 << v7) & 0x100002600;
        if (!v4 && v8 != 0) {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t _sasl_load_plugins(const char **a1, void *a2, void *a3)
{
  uint64_t result = 4294967289;
  if (a1 && a2 && *a2 == 3 && a3 && a2[1] && *a3 == 4 && a3[1])
  {
    uint64_t v5 = *a1;
    if (!*a1) {
      return 0;
    }
    do
    {
      if (!strcmp(v5, "sasl_server_plug_init"))
      {
        long long v6 = sasl_server_add_plugin;
        int v7 = 1;
      }
      else if (!strcmp(v5, "sasl_client_plug_init"))
      {
        long long v6 = sasl_client_add_plugin;
        int v7 = 2;
      }
      else if (!strcmp(v5, "sasl_auxprop_plug_init"))
      {
        long long v6 = sasl_auxprop_add_plugin;
        int v7 = 3;
      }
      else
      {
        if (strcmp(v5, "sasl_canonuser_init")) {
          return 0xFFFFFFFFLL;
        }
        long long v6 = sasl_canonuser_add_plugin;
        int v7 = 4;
      }
      int v8 = _sasl_static_plugins;
      if (_sasl_static_plugins)
      {
        uint64_t v9 = &dword_1EB5276A8;
        do
        {
          if (v7 == v8) {
            ((void (*)(void, void))v6)(*((void *)v9 - 2), *((void *)v9 - 1));
          }
          int v10 = *v9;
          v9 += 6;
          int v8 = v10;
        }
        while (v10);
      }
      uint64_t result = 0;
      uint64_t v11 = a1[2];
      a1 += 2;
      uint64_t v5 = v11;
    }
    while (v11);
  }
  return result;
}

uint64_t external_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  uint64_t result = 4294967289;
  if (a1 && a3 && a4 && a5)
  {
    if (a2 == 4)
    {
      uint64_t result = 0;
      *a3 = 4;
      *a4 = &external_client_plugins;
      *a5 = 1;
    }
    else
    {
      (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "EXTERNAL version mismatch");
      return 4294967273;
    }
  }
  return result;
}

uint64_t external_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 4294967289;
  }
  uint64_t v3 = *(void *)(a2 + 24);
  if (!v3) {
    return 4294967289;
  }
  uint64_t result = 4294967289;
  if (a3)
  {
    uint64_t v6 = *(void *)(v3 + 8);
    if (v6)
    {
      if (*(void *)(v6 + 2344))
      {
        uint64_t v7 = _sasl_allocation_utils(16);
        if (v7)
        {
          int v8 = (void *)v7;
          uint64_t result = 0;
          *int v8 = 0;
          v8[1] = 0;
          *a3 = v8;
        }
        else
        {
          return 4294967294;
        }
      }
      else
      {
        return 4294967292;
      }
    }
  }
  return result;
}

uint64_t external_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t **a5, void *a6, _DWORD *a7, uint64_t a8)
{
  __s = 0;
  if (!a2) {
    return 4294967289;
  }
  uint64_t v9 = *(void *)(a2 + 24);
  if (!v9) {
    return 4294967289;
  }
  uint64_t v10 = *(void *)(v9 + 8);
  if (!v10) {
    return 4294967289;
  }
  uint64_t simple = 4294967289;
  if (a8)
  {
    if (a7)
    {
      if (a6)
      {
        if (*(void *)(v9 + 248))
        {
          uint64_t simple = 4294967291;
          if (!a4)
          {
            if (*(void *)(v10 + 2344))
            {
              *a6 = 0;
              *a7 = 0;
              uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 16385, 0, &__s, a5);
              if ((simple & 0xFFFFFFFD) == 0)
              {
                if (a5 && *a5)
                {
                  (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
                  *a5 = 0;
                }
                if (simple == 2)
                {
                  unsigned int prompts = _plug_make_prompts(*(void *)(a2 + 24), a5, (uint64_t)"Please enter your authorization name", (uint64_t)"", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                  if (prompts) {
                    return prompts;
                  }
                  else {
                    return 2;
                  }
                }
                int v19 = (int)__s;
                if (__s) {
                  int v19 = strlen(__s);
                }
                *a7 = v19;
                uint64_t simple = _buf_alloc((uint64_t *)a1, (unint64_t *)(a1 + 8), (v19 + 1));
                if (!simple)
                {
                  if (!__s || !*__s)
                  {
                    uint64_t simple = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), *(void *)(*(void *)(*(void *)(a2 + 24) + 8) + 2344), 0, 3, a8);
                    if (simple) {
                      return simple;
                    }
LABEL_29:
                    uint64_t simple = 0;
                    *(unsigned char *)(*(void *)a1 + *a7) = 0;
                    *a6 = *(void *)a1;
                    *(_DWORD *)a8 = 1;
                    *(_DWORD *)(a8 + 136) = 0;
                    *(_OWORD *)(a8 + 32) = 0u;
                    *(_OWORD *)(a8 + 48) = 0u;
                    *(void *)(a8 + 64) = 0;
                    return simple;
                  }
                  uint64_t simple = (*(uint64_t (**)(void))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8));
                  if (!simple)
                  {
                    uint64_t simple = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), *(void *)(*(void *)(*(void *)(a2 + 24) + 8) + 2344), 0, 1, a8);
                    if (!simple)
                    {
                      memcpy(*(void **)a1, __s, *a7);
                      goto LABEL_29;
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
  return simple;
}

void *external_client_mech_dispose(void *result)
{
  if (result)
  {
    unint64_t v1 = result;
    uint64_t v2 = *result;
    if (v2) {
      off_1EB527668(v2);
    }
    uint64_t v3 = (uint64_t (*)(void *))off_1EB527668;
    return (void *)v3(v1);
  }
  return result;
}

uint64_t gssapiv2_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 < 4) {
    return 4294967273;
  }
  *a3 = 4;
  *a4 = &gssapi_server_plugins;
  *a5 = 1;
  if (gss_mutex) {
    return 0;
  }
  gss_mutex = (*(uint64_t (**)(void))(a1 + 72))();
  if (gss_mutex) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t gssapiv2_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    *a3 = 4;
    *a4 = &gssapi_client_plugins;
    *a5 = 1;
    if (gss_mutex) {
      return 0;
    }
    gss_mutex = (*(uint64_t (**)(void))(a1 + 72))();
    if (gss_mutex) {
      return 0;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Version mismatch in GSSAPI");
    return 4294967273;
  }
}

uint64_t gssapi_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = sasl_gss_new_context(*(void *)(a2 + 80));
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t result = 0;
    *(void *)(v9 + 56) = 0;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 24) = 0u;
    *(_DWORD *)uint64_t v9 = 1;
    *(_DWORD *)(v9 + 16) = *(_DWORD *)(a2 + 220) & 0x10;
    *(void *)(v9 + 8) = a1;
    *a5 = v9;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/gssapi.c near line %d", 806);
    return 4294967294;
  }
  return result;
}

uint64_t gssapi_server_mech_step(int *a1, const char **a2, void *a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  if (!a5)
  {
    (*(void (**)(void, void, const char *, ...))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/gssapi.c near line %d", 1443);
    return 4294967289;
  }
  *a5 = 0;
  *a6 = 0;
  if (!a1) {
    return 4294967291;
  }
  (*((void (**)(void, uint64_t, const char *, ...))a2[10] + 32))(*((void *)a2[10] + 1), 5, "GSSAPI server step %d\n", *a1);
  int v14 = *a1;
  if (*a1 != 3)
  {
    if (v14 == 2)
    {
      input_token.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
      input_token.value = (void *)0xAAAAAAAAAAAAAAAALL;
      LODWORD(v79.length) = 0;
      output_token.unsigned int length = 0;
      output_token.value = 0;
      if (a4)
      {
        (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI server is not expecting data at this stage");
        sasl_gss_free_context_contents((uint64_t)a1);
        return 4294967283;
      }
LABEL_91:
      unsigned int v42 = *((_DWORD *)a2 + 25);
      unsigned int v43 = *((_DWORD *)a2 + 32);
      if (v42 >= v43) {
        unsigned int v44 = v42 - v43;
      }
      else {
        unsigned int v44 = 0;
      }
      a1[16] = v44;
      unsigned int v45 = *((_DWORD *)a2 + 24);
      if (v45 >= v43) {
        unsigned int v46 = v45 - v43;
      }
      else {
        unsigned int v46 = 0;
      }
      a1[17] = v46;
      unsigned int v47 = *((_DWORD *)a2 + 26);
      unsigned int v48 = HIBYTE(v47);
      unsigned int v49 = HIWORD(v47);
      if (v47 >= 0xFFFFFF) {
        char v50 = -1;
      }
      else {
        char v50 = *((_DWORD *)a2 + 26);
      }
      BOOL v51 = v48 == 0;
      if (v48) {
        char v52 = -1;
      }
      else {
        char v52 = BYTE1(*((_DWORD *)a2 + 26));
      }
      if (!v51) {
        LOBYTE(v49) = -1;
      }
      BYTE3(input_name_buffer.length) = v50;
      BYTE2(input_name_buffer.length) = v52;
      BYTE1(input_name_buffer.length) = v49;
      LOBYTE(input_name_buffer.length) = 0;
      if (v45 <= v43)
      {
        unsigned int v53 = 1;
        LOBYTE(input_name_buffer.length) = 1;
        char v54 = *((unsigned char *)a1 + 72);
        if ((v54 & 2) == 0)
        {
          if ((a1[18] & 4) == 0)
          {
LABEL_122:
            BYTE3(input_name_buffer.length) = 0;
            *(_WORD *)((char *)&input_name_buffer.length + 1) = 0;
LABEL_123:
            *((unsigned char *)a1 + 72) = v53;
            input_token.unsigned int length = 4;
            input_token.value = &input_name_buffer;
            if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
              goto LABEL_137;
            }
            OM_uint32 v55 = gss_wrap((OM_uint32 *)&v79, *((gss_ctx_id_t *)a1 + 3), 0, 0, &input_token, 0, &output_token);
            if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
              goto LABEL_137;
            }
            if (v55 < 0x10000)
            {
              unsigned int length = output_token.length;
              *a6 = output_token.length;
              if (!output_token.value) {
                goto LABEL_151;
              }
              int v57 = _plug_buf_alloc(*((void *)a1 + 10), (uint64_t *)a1 + 22, (unsigned int *)a1 + 46, length);
              if (v57)
              {
                LODWORD(v20) = v57;
                if (!(*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26)))
                {
                  gss_release_buffer((OM_uint32 *)&v79, &output_token);
                  if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
                    return 0xFFFFFFFFLL;
                  }
                  else {
                    return v20;
                  }
                }
                goto LABEL_137;
              }
              memcpy(*((void **)a1 + 22), output_token.value, *a6);
              *a5 = *((void *)a1 + 22);
              if (!(*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26)))
              {
                gss_release_buffer((OM_uint32 *)&v79, &output_token);
                if (!(*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26)))
                {
LABEL_151:
                  *a1 = 3;
                  return 1;
                }
              }
LABEL_137:
              uint64_t v20 = 0xFFFFFFFFLL;
              goto LABEL_138;
            }
            sasl_gss_seterror_(*((void *)a1 + 10), v55, v79.length, 0);
LABEL_134:
            if (output_token.value) {
              goto LABEL_135;
            }
LABEL_48:
            sasl_gss_free_context_contents((uint64_t)a1);
            goto LABEL_137;
          }
LABEL_118:
          if (v44 >= 0x38 && v47)
          {
            LOBYTE(v53) = v53 | 4;
            LOBYTE(input_name_buffer.length) = v53;
            goto LABEL_123;
          }
LABEL_121:
          if (v53 > 1) {
            goto LABEL_123;
          }
          goto LABEL_122;
        }
      }
      else
      {
        if (!v47)
        {
          (*((void (**)(void, void, const char *))a2[10] + 33))(*((void *)a2[10] + 1), 0, "GSSAPI needs a security layer but one is forbidden");
          return 4294967281;
        }
        unsigned int v53 = 0;
        char v54 = *((unsigned char *)a1 + 72);
        if (v46 > 1 || (a1[18] & 2) == 0)
        {
LABEL_116:
          if (v46 > 0x38 || (v54 & 4) == 0) {
            goto LABEL_121;
          }
          goto LABEL_118;
        }
      }
      if (v42 > v43 && v47)
      {
        v53 |= 2u;
        LOBYTE(input_name_buffer.length) = v53;
      }
      goto LABEL_116;
    }
    if (v14 != 1)
    {
      (*((void (**)(void, uint64_t, const char *, ...))a2[10] + 32))(*((void *)a2[10] + 1), 1, "Invalid GSSAPI server step %d\n", *a1);
      return 0xFFFFFFFFLL;
    }
    OM_uint32 minor_status = 0;
    v79.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
    v79.value = (void *)0xAAAAAAAAAAAAAAAALL;
    input_name_buffer.value = (void *)0xAAAAAAAAAAAAAAAALL;
    *(void *)ret_flags = 0;
    unsigned int v15 = (gss_cred_id_t_desc_struct *)a2[20];
    gss_name_t output_name = 0;
    input_name_buffer.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
    gss_OID mech_type = (gss_OID)0xAAAAAAAAAAAAAAAALL;
    gss_name_t input_name = 0;
    output_token.unsigned int length = 0;
    output_token.value = 0;
    uint64_t v16 = *((void *)a1 + 5);
    input_token.unsigned int length = 0;
    input_token.value = 0;
    if (v16)
    {
LABEL_7:
      if (a4)
      {
        input_token.unsigned int length = a4;
        input_token.value = a3;
      }
      if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      OM_uint32 v17 = gss_accept_sec_context(&minor_status, (gss_ctx_id_t *)a1 + 3, v15, &input_token, 0, (gss_name_t *)a1 + 4, &mech_type, &output_token, ret_flags, 0, (gss_cred_id_t *)a1 + 7);
      if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      if (v17 >= 0x10000)
      {
        sasl_gss_seterror_(*((void *)a1 + 10), v17, minor_status, 1);
        (*(void (**)(void, uint64_t, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 1, "GSSAPI Failure: gss_accept_sec_context");
        if (output_token.value)
        {
          if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          gss_release_buffer(&minor_status, &output_token);
          if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
        }
      }
      else
      {
        unsigned int v18 = output_token.length;
        *a6 = output_token.length;
        if (output_token.value)
        {
          uint64_t v19 = _plug_buf_alloc(*((void *)a1 + 10), (uint64_t *)a1 + 22, (unsigned int *)a1 + 46, v18);
          if (v19)
          {
            uint64_t v20 = v19;
            if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
            gss_release_buffer(&minor_status, &output_token);
            int v21 = (*((uint64_t (**)(void))a2[10] + 11))(*((void *)a1 + 26));
            goto LABEL_16;
          }
          memcpy(*((void **)a1 + 22), output_token.value, *a6);
          *a5 = *((void *)a1 + 22);
          if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          gss_release_buffer(&minor_status, &output_token);
          if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
        }
        else
        {
          *a5 = "";
          *a6 = 0;
        }
        if (v17 == 1)
        {
LABEL_63:
          if (*a6) {
            return 1;
          }
          input_token.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
          input_token.value = (void *)0xAAAAAAAAAAAAAAAALL;
          LODWORD(v79.length) = 0;
          output_token.unsigned int length = 0;
          output_token.value = 0;
          goto LABEL_91;
        }
        if (v17) {
          gssapi_server_mech_step_cold_1();
        }
        char v37 = ret_flags[0];
        if ((ret_flags[0] & 0x20) != 0)
        {
          if ((ret_flags[0] & 0x10) != 0) {
            char v38 = 7;
          }
          else {
            char v38 = 3;
          }
        }
        else
        {
          char v38 = 1;
        }
        *((unsigned char *)a1 + 72) = v38;
        if ((*((unsigned char *)a2 + 108) & 0x20) != 0 && ((v37 & 1) == 0 || !*((void *)a1 + 7))) {
          (*(void (**)(void, uint64_t, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 3, "GSSAPI warning: no credentials were passed");
        }
        if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
          return 0xFFFFFFFFLL;
        }
        OM_uint32 v63 = gss_canonicalize_name(&minor_status, *((gss_name_t *)a1 + 4), mech_type, &output_name);
        if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
          return 0xFFFFFFFFLL;
        }
        if (v63 < 0x10000)
        {
          v79.value = 0;
          input_name_buffer.value = 0;
          if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          OM_uint32 v64 = gss_display_name(&minor_status, output_name, &v79, 0);
          if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          if (v64 >= 0x10000)
          {
            (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure: gss_display_name");
          }
          else
          {
            value = (const char *)v79.value;
            if (!strchr((char *)v79.value, 64))
            {
              ret_flags[1] = 0;
LABEL_178:
              uint64_t v72 = strdup(value);
              *((void *)a1 + 24) = v72;
              if (v72)
              {
                uint64_t v20 = a1[4] == 0;
                if (a1[4]) {
                  int v73 = 4;
                }
                else {
                  int v73 = 2;
                }
                *a1 = v73;
                if (*((void *)a1 + 6))
                {
                  gss_release_cred(&minor_status, (gss_cred_id_t *)a1 + 6);
                  *((void *)a1 + 6) = 0;
                }
                goto LABEL_187;
              }
              (*((void (**)(void, void, const char *, ...))a2[10] + 33))(*((void *)a2[10] + 1), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/gssapi.c near line %d", 1102);
              goto LABEL_186;
            }
            size_t v66 = strlen(value);
            unsigned int v67 = (void *)(*((uint64_t (**)(size_t))a2[10] + 5))(v66 + 1);
            input_name_buffer.value = v67;
            if (!v67)
            {
              (*(void (**)(void, void, const char *, ...))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/gssapi.c near line %d", 1045);
LABEL_186:
              uint64_t v20 = 4294967294;
              goto LABEL_187;
            }
            long long v68 = (const char *)v67;
            long long v69 = strcpy((char *)v67, (const char *)v79.value);
            *strchr(v69, 64) = 0;
            input_name_buffer.unsigned int length = strlen(v68);
            if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
            OM_uint32 v70 = gss_import_name(&minor_status, &input_name_buffer, MEMORY[0x1E4F29310], &input_name);
            if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
            if (v70 >= 0x10000)
            {
              (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure: gss_import_name");
            }
            else
            {
              if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
                return 0xFFFFFFFFLL;
              }
              OM_uint32 v71 = gss_compare_name(&minor_status, output_name, input_name, (int *)&ret_flags[1]);
              if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
                return 0xFFFFFFFFLL;
              }
              if (v71 < 0x10000)
              {
                if (ret_flags[1]) {
                  value = (const char *)input_name_buffer.value;
                }
                else {
                  value = (const char *)v79.value;
                }
                goto LABEL_178;
              }
              (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure: gss_compare_name");
            }
          }
          sasl_gss_free_context_contents((uint64_t)a1);
          uint64_t v20 = 4294967283;
LABEL_187:
          if (*((void *)a1 + 6))
          {
            if ((*((unsigned int (**)(uint64_t))a2[10] + 10))(gss_mutex)) {
              return 0xFFFFFFFFLL;
            }
            gss_release_cred(&minor_status, (gss_cred_id_t *)a1 + 6);
            if ((*((unsigned int (**)(uint64_t))a2[10] + 11))(gss_mutex)) {
              return 0xFFFFFFFFLL;
            }
            *((void *)a1 + 6) = 0;
          }
          if (output_name)
          {
            if ((*((unsigned int (**)(uint64_t))a2[10] + 10))(gss_mutex)) {
              return 0xFFFFFFFFLL;
            }
            gss_release_name(&minor_status, &output_name);
            if ((*((unsigned int (**)(uint64_t))a2[10] + 11))(gss_mutex)) {
              return 0xFFFFFFFFLL;
            }
          }
          if (v79.value)
          {
            if ((*((unsigned int (**)(uint64_t))a2[10] + 10))(gss_mutex)) {
              return 0xFFFFFFFFLL;
            }
            gss_release_buffer(&minor_status, &v79);
            if ((*((unsigned int (**)(uint64_t))a2[10] + 11))(gss_mutex)) {
              return 0xFFFFFFFFLL;
            }
          }
          if (input_name_buffer.value) {
            (*((void (**)(void))a2[10] + 8))();
          }
          if (!input_name)
          {
LABEL_17:
            if (v20 != 1)
            {
LABEL_138:
              if (v20) {
                return v20;
              }
              goto LABEL_139;
            }
            goto LABEL_63;
          }
          if ((*((unsigned int (**)(uint64_t))a2[10] + 10))(gss_mutex)) {
            return 0xFFFFFFFFLL;
          }
          gss_release_name(&minor_status, &input_name);
          int v21 = (*((uint64_t (**)(uint64_t))a2[10] + 11))(gss_mutex);
LABEL_16:
          if (!v21) {
            goto LABEL_17;
          }
          return 0xFFFFFFFFLL;
        }
        (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure: gss_canonicalize_name");
      }
      sasl_gss_free_context_contents((uint64_t)a1);
      return 4294967283;
    }
    uint64_t v24 = a2[2];
    if (v24 && (size_t v25 = strlen(v24)) != 0)
    {
      size_t v26 = v25;
      size_t v27 = strlen(*a2);
      v79.unsigned int length = v26 + v27 + 1;
      int v28 = (void *)(*((uint64_t (**)(size_t))a2[10] + 5))(v26 + v27 + 2);
      v79.value = v28;
      if (!v28)
      {
        (*(void (**)(void, void, const char *, ...))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/gssapi.c near line %d", 860);
        sasl_gss_free_context_contents((uint64_t)a1);
        return 4294967294;
      }
      sprintf((char *)v28, "%s@%s", *a2, a2[2]);
      if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      OM_uint32 v29 = gss_import_name(&minor_status, &v79, MEMORY[0x1E4F29308], (gss_name_t *)a1 + 5);
      if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      (*((void (**)(void *))a2[10] + 8))(v79.value);
      v79.value = 0;
      if (v29 < 0x10000)
      {
        uint64_t v30 = (gss_cred_id_t_desc_struct **)(a1 + 12);
        if (*((void *)a1 + 6))
        {
          if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          gss_release_cred(&minor_status, (gss_cred_id_t *)a1 + 6);
          if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          *uint64_t v30 = 0;
        }
        if (!v15)
        {
          long long v31 = a3;
          unsigned int v32 = a4;
          if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v20 = 0xFFFFFFFFLL;
          OM_uint32 v33 = gss_acquire_cred(&minor_status, *((gss_name_t *)a1 + 5), 0xFFFFFFFF, 0, 2, (gss_cred_id_t *)a1 + 6, 0, 0);
          if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
            return v20;
          }
          if (v33 >= 0x10000)
          {
            sasl_gss_seterror_(*((void *)a1 + 10), v33, minor_status, 0);
LABEL_143:
            sasl_gss_free_context_contents((uint64_t)a1);
            return v20;
          }
          unsigned int v15 = *v30;
          a4 = v32;
          a3 = v31;
        }
        goto LABEL_7;
      }
      sasl_gss_seterror_(*((void *)a1 + 10), v29, minor_status, 0);
    }
    else
    {
      (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure: no serverFQDN");
    }
    sasl_gss_free_context_contents((uint64_t)a1);
    return 0xFFFFFFFFLL;
  }
  LODWORD(v79.length) = 0;
  output_token.unsigned int length = 0;
  output_token.value = 0;
  input_token.unsigned int length = a4;
  input_token.value = a3;
  if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
    goto LABEL_137;
  }
  OM_uint32 v22 = gss_unwrap((OM_uint32 *)&v79, *((gss_ctx_id_t *)a1 + 3), &input_token, &output_token, 0, 0);
  if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
    goto LABEL_137;
  }
  if (v22 >= 0x10000)
  {
    sasl_gss_seterror_(*((void *)a1 + 10), v22, v79.length, 0);
    goto LABEL_48;
  }
  size_t v23 = output_token.length;
  if (output_token.length <= 3)
  {
    (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "token too short");
LABEL_135:
    if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
      goto LABEL_137;
    }
    gss_release_buffer((OM_uint32 *)&v79, &output_token);
    if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
      goto LABEL_137;
    }
    goto LABEL_48;
  }
  size_t v34 = (unsigned __int8 *)output_token.value;
  if (*(unsigned char *)output_token.value & 6) == 0 && (a1[18])
  {
    size_t v36 = 0;
    uint64_t v35 = 0;
    int v39 = 0;
  }
  else if ((*(unsigned char *)output_token.value & 2) != 0 {
         && (uint64_t v35 = gssapi_decode, v36 = gssapi_integrity_encode, (a1[18] & 2) != 0))
  }
  {
    int v39 = 1;
  }
  else
  {
    if ((*(unsigned char *)output_token.value & 6) == 0
      || (uint64_t v35 = gssapi_decode, v36 = gssapi_privacy_encode, (a1[18] & 4) == 0))
    {
      (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "protocol violation: client requested invalid layer");
      *(_DWORD *)(a7 + 36) = 2;
      goto LABEL_134;
    }
    int v39 = 56;
  }
  *(void *)(a7 + 48) = v36;
  *(void *)(a7 + 64) = v35;
  *(_DWORD *)(a7 + 36) = v39;
  if (v23 >= 5)
  {
    uint64_t v40 = ((uint64_t (*)(void, unsigned __int8 *, void, uint64_t, uint64_t))a2[18])(*((void *)a2[10] + 1), v34 + 4, (v23 - 4), 6, a7);
    if (v40)
    {
      uint64_t v20 = v40;
      sasl_gss_free_context_contents((uint64_t)a1);
      if (v20) {
        return v20;
      }
      goto LABEL_139;
    }
    size_t v34 = (unsigned __int8 *)output_token.value;
  }
  *(_DWORD *)(a7 + 32) = (v34[1] << 16) | (v34[2] << 8) | v34[3];
  if ((*((unsigned int (**)(void))a2[10] + 10))(*((void *)a1 + 26))) {
    goto LABEL_137;
  }
  gss_release_buffer((OM_uint32 *)&v79, &output_token);
  if ((*((unsigned int (**)(void))a2[10] + 11))(*((void *)a1 + 26))) {
    goto LABEL_137;
  }
  if (*(_DWORD *)(a7 + 36) && gssapi_wrap_sizes((uint64_t)a1, a7)) {
    goto LABEL_48;
  }
  *a1 = 4;
  if (*((_DWORD *)a2 + 26) >= 0xFFFFFFu) {
    int v41 = 0xFFFFFF;
  }
  else {
    int v41 = *((_DWORD *)a2 + 26);
  }
  _plug_decode_init((uint64_t)(a1 + 22), *((void *)a1 + 10), v41);
LABEL_139:
  if (*(void *)(a7 + 8)) {
    uint64_t v58 = 5;
  }
  else {
    uint64_t v58 = 7;
  }
  uint64_t v20 = ((uint64_t (*)(void, void, void, uint64_t, uint64_t))a2[18])(*((void *)a2[10] + 1), *((void *)a1 + 24), 0, v58, a7);
  if (v20) {
    goto LABEL_143;
  }
  uint64_t v60 = *((void *)a1 + 7);
  __n128 v59 = a1 + 14;
  if (v60) {
    uint64_t v61 = v59;
  }
  else {
    uint64_t v61 = 0;
  }
  *(void *)(a7 + 72) = v61;
  *(_DWORD *)a7 = 1;
  return v20;
}

uint64_t gssapi_common_mech_dispose(uint64_t a1, uint64_t a2)
{
  sasl_gss_free_context_contents(a1);
  BOOL v4 = *(uint64_t (**)(uint64_t))(a2 + 64);
  return v4(a1);
}

uint64_t gssapi_common_mech_free(uint64_t a1, uint64_t a2)
{
  uint64_t result = gss_mutex;
  if (gss_mutex)
  {
    uint64_t result = (*(uint64_t (**)(void))(a2 + 96))();
    gss_mutex = 0;
  }
  return result;
}

uint64_t sasl_gss_new_context(uint64_t a1)
{
  uint64_t v2 = (*(uint64_t (**)(uint64_t))(a1 + 40))(216);
  uint64_t v3 = v2;
  if (v2)
  {
    *(void *)(v2 + 208) = 0;
    *(_OWORD *)(v2 + 176) = 0u;
    *(_OWORD *)(v2 + 192) = 0u;
    *(_OWORD *)(v2 + 144) = 0u;
    *(_OWORD *)(v2 + 160) = 0u;
    *(_OWORD *)(v2 + 112) = 0u;
    *(_OWORD *)(v2 + 128) = 0u;
    *(_OWORD *)(v2 + 80) = 0u;
    *(_OWORD *)(v2 + 96) = 0u;
    *(_OWORD *)(v2 + 48) = 0u;
    *(_OWORD *)(v2 + 64) = 0u;
    *(_OWORD *)(v2 + 16) = 0u;
    *(_OWORD *)(v2 + 32) = 0u;
    *(_OWORD *)uint64_t v2 = 0u;
    *(void *)(v2 + 80) = a1;
    uint64_t v4 = (*(uint64_t (**)(void))(a1 + 72))();
    *(void *)(v3 + 208) = v4;
    if (!v4)
    {
      (*(void (**)(uint64_t))(a1 + 64))(v3);
      return 0;
    }
  }
  return v3;
}

uint64_t sasl_gss_free_context_contents(uint64_t input_name)
{
  if (input_name)
  {
    uint64_t v1 = input_name;
    if (!*(void *)(input_name + 208)
      || (gss_name_t input_name = (*(uint64_t (**)(void))(*(void *)(input_name + 80) + 80))(), !input_name))
    {
      OM_uint32 minor_status = -1431655766;
      if (*(void *)(v1 + 24))
      {
        gss_delete_sec_context(&minor_status, (gss_ctx_id_t *)(v1 + 24), 0);
        *(void *)(v1 + 24) = 0;
      }
      if (*(void *)(v1 + 32))
      {
        gss_release_name(&minor_status, (gss_name_t *)(v1 + 32));
        *(void *)(v1 + 32) = 0;
      }
      if (*(void *)(v1 + 40))
      {
        gss_release_name(&minor_status, (gss_name_t *)(v1 + 40));
        *(void *)(v1 + 40) = 0;
      }
      if (*(void *)(v1 + 48))
      {
        gss_release_cred(&minor_status, (gss_cred_id_t *)(v1 + 48));
        *(void *)(v1 + 48) = 0;
      }
      if (*(void *)(v1 + 56))
      {
        gss_release_cred(&minor_status, (gss_cred_id_t *)(v1 + 56));
        *(void *)(v1 + 56) = 0;
      }
      if (*(void *)(v1 + 176))
      {
        (*(void (**)(void))(*(void *)(v1 + 80) + 64))();
        *(void *)(v1 + 176) = 0;
      }
      if (*(void *)(v1 + 128))
      {
        (*(void (**)(void))(*(void *)(v1 + 80) + 64))();
        *(void *)(v1 + 128) = 0;
      }
      if (*(void *)(v1 + 136))
      {
        (*(void (**)(void))(*(void *)(v1 + 80) + 64))();
        *(void *)(v1 + 136) = 0;
      }
      if (*(void *)(v1 + 144))
      {
        (*(void (**)(void))(*(void *)(v1 + 80) + 64))();
        *(void *)(v1 + 144) = 0;
      }
      uint64_t v2 = *(void **)(v1 + 168);
      if (v2)
      {
        if (*v2)
        {
          (*(void (**)(void))(*(void *)(v1 + 80) + 64))(*v2);
          uint64_t v2 = *(void **)(v1 + 168);
        }
        (*(void (**)(void *))(*(void *)(v1 + 80) + 64))(v2);
        *(void *)(v1 + 168) = 0;
      }
      _plug_decode_free((void *)(v1 + 88));
      if (*(void *)(v1 + 192))
      {
        (*(void (**)(void))(*(void *)(v1 + 80) + 64))();
        *(void *)(v1 + 192) = 0;
      }
      gss_name_t input_name = *(void *)(v1 + 208);
      if (input_name)
      {
        gss_name_t input_name = (*(uint64_t (**)(void))(*(void *)(v1 + 80) + 88))();
        if (!input_name)
        {
          gss_name_t input_name = (*(uint64_t (**)(void))(*(void *)(v1 + 80) + 96))(*(void *)(v1 + 208));
          *(void *)(v1 + 208) = 0;
        }
      }
    }
  }
  return input_name;
}

uint64_t sasl_gss_seterror_(uint64_t result, OM_uint32 a2, OM_uint32 a3, int a4)
{
  status_string.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
  status_string.value = (void *)0xAAAAAAAAAAAAAAAALL;
  __s1 = 0;
  unsigned int v18 = 0;
  if (!result) {
    return result;
  }
  uint64_t v7 = result;
  OM_uint32 minor_status = -1431655766;
  uint64_t result = _plug_buf_alloc(result, (uint64_t *)&__s1, &v18, 0x100u);
  if (result) {
    return result;
  }
  uint64_t v8 = __s1;
  *(void *)__s1 = *(void *)"GSSAPI Error: ";
  strcpy(v8 + 7, "Error: ");
  OM_uint32 message_content = 0;
  uint64_t v9 = 15;
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 80))(gss_mutex);
    if (result) {
      return result;
    }
    OM_uint32 v10 = gss_display_status(&minor_status, a2, 1, 0, &message_content, &status_string);
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 88))(gss_mutex);
    if (result) {
      return result;
    }
    if (v10 >= 0x10000)
    {
      uint64_t v14 = *(void *)(v7 + 8);
      if (a4)
      {
        unsigned int v15 = *(void (**)(uint64_t, uint64_t, const char *))(v7 + 256);
        uint64_t v16 = "GSSAPI Failure: (could not get major error message)";
LABEL_28:
        uint64_t v17 = 2;
      }
      else
      {
        unsigned int v15 = *(void (**)(uint64_t, uint64_t, const char *))(v7 + 264);
        uint64_t v16 = "GSSAPI Failure (could not get major error message)";
LABEL_30:
        uint64_t v17 = 0;
      }
      v15(v14, v17, v16);
      return (*(uint64_t (**)(char *))(v7 + 64))(__s1);
    }
    v9 += status_string.length;
    if (_plug_buf_alloc(v7, (uint64_t *)&__s1, &v18, v9)) {
      return (*(uint64_t (**)(char *))(v7 + 64))(__s1);
    }
    strncat(__s1, (const char *)status_string.value, status_string.length);
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 80))(gss_mutex);
    if (!result)
    {
      gss_release_buffer(&minor_status, &status_string);
      uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 88))(gss_mutex);
      if (!result) {
        continue;
      }
    }
    return result;
  }
  while (message_content);
  uint64_t v11 = v9 + 2;
  if (_plug_buf_alloc(v7, (uint64_t *)&__s1, &v18, (int)v9 + 2)) {
    return (*(uint64_t (**)(char *))(v7 + 64))(__s1);
  }
  strcat(__s1, " (");
  OM_uint32 message_content = 0;
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 80))(gss_mutex);
    if (result) {
      return result;
    }
    OM_uint32 v12 = gss_display_status(&minor_status, a3, 2, 0, &message_content, &status_string);
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 88))(gss_mutex);
    if (result) {
      return result;
    }
    if (v12 >= 0x10000)
    {
      uint64_t v14 = *(void *)(v7 + 8);
      if (a4)
      {
        unsigned int v15 = *(void (**)(uint64_t, uint64_t, const char *))(v7 + 256);
        uint64_t v16 = "GSSAPI Failure: (could not get minor error message)";
        goto LABEL_28;
      }
      unsigned int v15 = *(void (**)(uint64_t, uint64_t, const char *))(v7 + 264);
      uint64_t v16 = "GSSAPI Failure (could not get minor error message)";
      goto LABEL_30;
    }
    v11 += status_string.length;
    if (_plug_buf_alloc(v7, (uint64_t *)&__s1, &v18, v11)) {
      return (*(uint64_t (**)(char *))(v7 + 64))(__s1);
    }
    strncat(__s1, (const char *)status_string.value, status_string.length);
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 80))(gss_mutex);
    if (result) {
      return result;
    }
    gss_release_buffer(&minor_status, &status_string);
    uint64_t result = (*(uint64_t (**)(uint64_t))(v7 + 88))(gss_mutex);
    if (result) {
      return result;
    }
    if (!message_content)
    {
      if (!_plug_buf_alloc(v7, (uint64_t *)&__s1, &v18, (int)v11 + 1))
      {
        *(_WORD *)&__s1[strlen(__s1)] = 41;
        if (v11 != strlen(__s1)) {
          sasl_gss_seterror__cold_1();
        }
        uint64_t v13 = 256;
        if (!a4) {
          uint64_t v13 = 264;
        }
        (*(void (**)(void, void, const char *))(v7 + v13))(*(void *)(v7 + 8), 2 * (a4 != 0), "%s");
      }
      return (*(uint64_t (**)(char *))(v7 + 64))(__s1);
    }
  }
}

uint64_t gssapi_integrity_encode(uint64_t a1, unint64_t *a2, unsigned int a3, void *a4, _DWORD *a5)
{
  return sasl_gss_encode(a1, a2, a3, a4, a5, 0);
}

uint64_t gssapi_decode(uint64_t a1, char *a2, unsigned int a3, void *a4, unsigned int *a5)
{
  uint64_t result = _plug_decode((_DWORD *)(a1 + 88), a2, a3, (uint64_t *)(a1 + 136), (unsigned int *)(a1 + 156), a5, (uint64_t (*)(uint64_t, void, void, _DWORD *, _DWORD *))gssapi_decode_packet, a1);
  *a4 = *(void *)(a1 + 136);
  return result;
}

uint64_t gssapi_privacy_encode(uint64_t a1, unint64_t *a2, unsigned int a3, void *a4, _DWORD *a5)
{
  return sasl_gss_encode(a1, a2, a3, a4, a5, 1);
}

uint64_t gssapi_wrap_sizes(uint64_t a1, uint64_t a2)
{
  *(void *)max_input_size = 0;
  uint64_t result = gss_wrap_size_limit(&max_input_size[1], *(gss_ctx_id_t *)(a1 + 24), 1, 0, *(_DWORD *)(a2 + 32), max_input_size);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  OM_uint32 v4 = max_input_size[0];
  OM_uint32 v5 = *(_DWORD *)(a2 + 32);
  if (max_input_size[0] > v5) {
    OM_uint32 v4 = 2 * v5 - max_input_size[0];
  }
  *(_DWORD *)(a2 + 32) = v4;
  return result;
}

uint64_t sasl_gss_encode(uint64_t a1, unint64_t *a2, unsigned int a3, void *a4, _DWORD *a5, int a6)
{
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v19 = 0xAAAAAAAAAAAAAAAALL;
  if (!a4) {
    return 4294967289;
  }
  if (a3 < 2)
  {
    unint64_t v12 = a2[1];
    unint64_t v18 = *a2;
    LODWORD(v19) = v12;
    uint64_t v11 = &v18;
  }
  else
  {
    uint64_t result = _plug_iovec_to_buf(*(void *)(a1 + 80), (uint64_t)a2, a3, (char ***)(a1 + 168));
    if (result) {
      return result;
    }
    uint64_t v11 = *(unint64_t **)(a1 + 168);
  }
  if (*(_DWORD *)a1 != 4) {
    return 4294967290;
  }
  input_message_buffer.value = (void *)*v11;
  size_t v13 = *((unsigned int *)v11 + 2);
  output_message_buffer.value = 0;
  input_message_buffer.unsigned int length = v13;
  output_message_buffer.unsigned int length = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  OM_uint32 minor_status = -1431655766;
  OM_uint32 v14 = gss_wrap(&minor_status, *(gss_ctx_id_t *)(a1 + 24), a6, 0, &input_message_buffer, 0, &output_message_buffer);
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  if (v14 >= 0x10000)
  {
    sasl_gss_seterror_(*(void *)(a1 + 80), v14, minor_status, 0);
    if (output_message_buffer.value
      && !(*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208)))
    {
      gss_release_buffer(&minor_status, &output_message_buffer);
      (*(void (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208));
    }
    return 0xFFFFFFFFLL;
  }
  if (!output_message_buffer.value) {
    goto LABEL_24;
  }
  uint64_t v15 = a1 + 128;
  unsigned int v16 = _plug_buf_alloc(*(void *)(a1 + 80), (uint64_t *)(a1 + 128), (unsigned int *)(a1 + 152), LODWORD(output_message_buffer.length) + 4);
  if (!v16)
  {
    **(_DWORD **)uint64_t v15 = bswap32(output_message_buffer.length);
    memcpy((void *)(*(void *)v15 + 4), output_message_buffer.value, output_message_buffer.length);
LABEL_24:
    if (a5) {
      *a5 = LODWORD(output_message_buffer.length) + 4;
    }
    *a4 = *(void *)(a1 + 128);
    if (output_message_buffer.value)
    {
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208))) {
        return 0xFFFFFFFFLL;
      }
      gss_release_buffer(&minor_status, &output_message_buffer);
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208))) {
        return 0xFFFFFFFFLL;
      }
    }
    return 0;
  }
  unsigned int v17 = v16;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  gss_release_buffer(&minor_status, &output_message_buffer);
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v17;
  }
}

uint64_t gssapi_decode_packet(uint64_t a1, void *a2, unsigned int a3, void **a4, unsigned int *a5)
{
  if (*(_DWORD *)a1 != 4)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a1 + 80) + 264))(*(void *)(*(void *)(a1 + 80) + 8), 0, "GSSAPI Failure");
    return 4294967290;
  }
  input_message_buffer.unsigned int length = a3;
  input_message_buffer.value = a2;
  output_message_buffer.unsigned int length = 0;
  output_message_buffer.value = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  OM_uint32 minor_status = -1431655766;
  OM_uint32 v8 = gss_unwrap(&minor_status, *(gss_ctx_id_t *)(a1 + 24), &input_message_buffer, &output_message_buffer, 0, 0);
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  if (v8 >= 0x10000)
  {
    sasl_gss_seterror_(*(void *)(a1 + 80), v8, minor_status, 0);
    if (output_message_buffer.value
      && !(*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208)))
    {
      gss_release_buffer(&minor_status, &output_message_buffer);
      (*(void (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208));
    }
    return 0xFFFFFFFFLL;
  }
  if (a5) {
    *a5 = output_message_buffer.length;
  }
  if (!output_message_buffer.value) {
    return 0;
  }
  if (!a4 || !a5)
  {
LABEL_22:
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208))) {
      return 0xFFFFFFFFLL;
    }
    gss_release_buffer(&minor_status, &output_message_buffer);
    if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208))) {
      return 0xFFFFFFFFLL;
    }
    return 0;
  }
  OM_uint32 v10 = (void **)(a1 + 144);
  unsigned int v11 = _plug_buf_alloc(*(void *)(a1 + 80), (uint64_t *)(a1 + 144), (unsigned int *)(a1 + 160), *a5);
  if (!v11)
  {
    size_t v13 = *v10;
    *a4 = *v10;
    memcpy(v13, output_message_buffer.value, *a5);
    goto LABEL_22;
  }
  unsigned int v12 = v11;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 80))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  gss_release_buffer(&minor_status, &output_message_buffer);
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 80) + 88))(*(void *)(a1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v12;
  }
}

uint64_t gssapi_client_mech_new(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sasl_gss_new_context(*(void *)(a2 + 24));
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = 0;
    *(_DWORD *)uint64_t v7 = 1;
    *(void *)(v7 + 8) = a1;
    *(void *)(v7 + 24) = 0;
    *(void *)(v7 + 32) = 0;
    *(void *)(v7 + 48) = 0;
    *(void *)(v7 + 56) = 0;
    *(_DWORD *)(v7 + 16) = *(_DWORD *)(a2 + 180) & 0x10;
    *a3 = v7;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/gssapi.c near line %d", 1639);
    return 4294967294;
  }
  return result;
}

uint64_t gssapi_client_mech_step(_DWORD *a1, const char **a2, void *a3, unsigned int a4, uint64_t **a5, void **a6, unsigned int *a7, uint64_t a8)
{
  OM_uint32 minor_status = 0;
  input_name_buffer.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
  input_name_buffer.value = (void *)0xAAAAAAAAAAAAAAAALL;
  OM_uint32 ret_flags = 0;
  output_message_buffer.unsigned int length = 0xAAAAAAAAAAAAAAAALL;
  output_message_buffer.value = 0;
  input_message_buffer.unsigned int length = 0;
  input_message_buffer.value = 0;
  unsigned int v16 = (gss_cred_id_t_desc_struct *)a2[15];
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  (*((void (**)(void, uint64_t, const char *, ...))a2[3] + 32))(*((void *)a2[3] + 1), 5, "GSSAPI client step %d", *a1);
  if (*a1 != 2)
  {
    if (*a1 != 1)
    {
      (*((void (**)(void, uint64_t, const char *, ...))a2[3] + 32))(*((void *)a2[3] + 1), 1, "Invalid GSSAPI client step %d\n", *a1);
      return 0xFFFFFFFFLL;
    }
    unsigned int v62 = (_DWORD *)a8;
    unsigned int v17 = a1 + 50;
    if (!*((void *)a1 + 25))
    {
      uint64_t simple = _plug_get_simple((uint64_t)a2[3], 16385, 0, (void *)a1 + 25, a5);
      if ((simple & 0xFFFFFFFD) != 0)
      {
        sasl_gss_free_context_contents((uint64_t)a1);
        return simple;
      }
      if (a5 && *a5)
      {
        (*((void (**)(void))a2[3] + 8))();
        *a5 = 0;
      }
      if (simple == 2)
      {
        unsigned int prompts = _plug_make_prompts((uint64_t)a2[3], a5, (uint64_t)"Please enter your authorization name", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
        if (prompts) {
          return prompts;
        }
        else {
          return 2;
        }
      }
    }
    if (*((void *)a1 + 5))
    {
LABEL_9:
      if (a4) {
        gss_buffer_desc_struct input_token = &input_message_buffer;
      }
      else {
        gss_buffer_desc_struct input_token = 0;
      }
      if (a4)
      {
        input_message_buffer.unsigned int length = a4;
        input_message_buffer.value = a3;
      }
      else if (*((void *)a1 + 3))
      {
        if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
          return 0xFFFFFFFFLL;
        }
        gss_delete_sec_context(&minor_status, (gss_ctx_id_t *)a1 + 3, 0);
        if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
          return 0xFFFFFFFFLL;
        }
        *((void *)a1 + 3) = 0;
      }
      unsigned int v19 = *((_DWORD *)a2 + 21);
      unsigned int v20 = *((_DWORD *)a2 + 28);
      unsigned int v21 = *((_DWORD *)a2 + 23);
      if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      int v22 = v19 - v20 <= 1 ? 42 : 58;
      int v23 = v19 <= v20 ? 10 : v22;
      OM_uint32 inited = gss_init_sec_context(&minor_status, v16, (gss_ctx_id_t *)a1 + 3, *((gss_name_t *)a1 + 5), *((gss_OID *)a1 + 1), v23 & 0xFFFFFFFE | (v21 >> 5) & 1, 0, 0, input_token, 0, &output_message_buffer, &ret_flags, 0);
      if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      if (inited < 0x10000)
      {
        OM_uint32 v25 = ret_flags;
        if ((ret_flags & 0x20) != 0)
        {
          if ((ret_flags & 0x10) != 0) {
            char v26 = 7;
          }
          else {
            char v26 = 3;
          }
        }
        else
        {
          char v26 = 1;
        }
        *((unsigned char *)a1 + 72) = v26;
        if ((v25 ^ (v21 >> 5))) {
          (*(void (**)(void, uint64_t, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 3, "GSSAPI warning: no credentials were passed");
        }
        if (a7) {
          *a7 = output_message_buffer.length;
        }
        if (output_message_buffer.value)
        {
          if (a6 && a7)
          {
            unsigned int v48 = (void **)(a1 + 44);
            unsigned int v49 = _plug_buf_alloc(*((void *)a1 + 10), (uint64_t *)a1 + 22, a1 + 46, *a7);
            if (v49) {
              goto LABEL_83;
            }
            memcpy(*v48, output_message_buffer.value, *a7);
            *a6 = *v48;
          }
          if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          gss_release_buffer(&minor_status, &output_message_buffer);
          if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
        }
        if (inited) {
          return 1;
        }
        if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
          return 0xFFFFFFFFLL;
        }
        OM_uint32 v37 = gss_inquire_context(&minor_status, *((gss_ctx_id_t *)a1 + 3), (gss_name_t *)a1 + 4, 0, 0, 0, 0, 0, 0);
        if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
          return 0xFFFFFFFFLL;
        }
        if (v37 < 0x10000)
        {
          input_name_buffer.unsigned int length = 0;
          if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          OM_uint32 v53 = gss_display_name(&minor_status, *((gss_name_t *)a1 + 4), &input_name_buffer, 0);
          if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          if (v53 < 0x10000)
          {
            if (*v17 && *(unsigned char *)*v17)
            {
              uint64_t simple = ((uint64_t (*)(void))a2[19])(*((void *)a2[3] + 1));
              if (simple) {
                goto LABEL_168;
              }
              uint64_t v54 = 1;
            }
            else
            {
              uint64_t v54 = 3;
            }
            uint64_t simple = ((uint64_t (*)(void, void *, void, uint64_t, _DWORD *))a2[19])(*((void *)a2[3] + 1), input_name_buffer.value, 0, v54, v62);
LABEL_168:
            if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
            gss_release_buffer(&minor_status, &input_name_buffer);
            if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
            if (simple) {
              return simple;
            }
            if (a1[4])
            {
              uint64_t simple = 0;
              *a1 = 4;
              *unsigned int v62 = 1;
              return simple;
            }
            *a1 = 2;
            return 1;
          }
          if (input_name_buffer.value)
          {
            if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
            gss_release_buffer(&minor_status, &input_name_buffer);
            if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
              return 0xFFFFFFFFLL;
            }
          }
          (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure");
LABEL_48:
          sasl_gss_free_context_contents((uint64_t)a1);
          return 0xFFFFFFFFLL;
        }
LABEL_42:
        sasl_gss_seterror_(*((void *)a1 + 10), v37, minor_status, 0);
        goto LABEL_48;
      }
      uint64_t v40 = *((void *)a1 + 10);
      OM_uint32 v41 = minor_status;
      OM_uint32 v42 = inited;
      goto LABEL_158;
    }
    unsigned int v32 = a2[1];
    if (!v32 || (size_t v33 = strlen(v32)) == 0)
    {
      (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, "GSSAPI Failure: no serverFQDN");
      goto LABEL_48;
    }
    size_t v34 = v33;
    size_t v35 = strlen(*a2);
    input_name_buffer.unsigned int length = v34 + v35 + 1;
    size_t v36 = (void *)(*((uint64_t (**)(size_t))a2[3] + 5))(v34 + v35 + 2);
    input_name_buffer.value = v36;
    if (v36)
    {
      sprintf((char *)v36, "%s@%s", *a2, a2[1]);
      if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      OM_uint32 v37 = gss_import_name(&minor_status, &input_name_buffer, MEMORY[0x1E4F29308], (gss_name_t *)a1 + 5);
      if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
        return 0xFFFFFFFFLL;
      }
      (*((void (**)(void *))a2[3] + 8))(input_name_buffer.value);
      input_name_buffer.value = 0;
      if (v37 >= 0x10000) {
        goto LABEL_42;
      }
      goto LABEL_9;
    }
LABEL_138:
    sasl_gss_free_context_contents((uint64_t)a1);
    return 4294967294;
  }
  unsigned int v27 = *((_DWORD *)a2 + 28);
  input_message_buffer.unsigned int length = a4;
  input_message_buffer.value = a3;
  if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
    return 0xFFFFFFFFLL;
  }
  OM_uint32 v28 = gss_unwrap(&minor_status, *((gss_ctx_id_t *)a1 + 3), &input_message_buffer, &output_message_buffer, 0, 0);
  if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
    return 0xFFFFFFFFLL;
  }
  if (v28 >= 0x10000)
  {
LABEL_157:
    uint64_t v40 = *((void *)a1 + 10);
    OM_uint32 v41 = minor_status;
    OM_uint32 v42 = v28;
LABEL_158:
    sasl_gss_seterror_(v40, v42, v41, 0);
    if (!output_message_buffer.value) {
      goto LABEL_48;
    }
LABEL_159:
    if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
      return 0xFFFFFFFFLL;
    }
    gss_release_buffer(&minor_status, &output_message_buffer);
    if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_48;
  }
  if (output_message_buffer.length != 4)
  {
    if (output_message_buffer.length >= 4) {
      int v39 = "token too long";
    }
    else {
      int v39 = "token too short";
    }
    (*(void (**)(void, void, const char *))(*((void *)a1 + 10) + 264))(*(void *)(*((void *)a1 + 10) + 8), 0, v39);
    goto LABEL_159;
  }
  unsigned int v29 = *((_DWORD *)a2 + 20);
  if (v29 > v27 + 56) {
    return 4294967281;
  }
  unsigned int v43 = *((_DWORD *)a2 + 21);
  if (v29 > v43) {
    return 4294967289;
  }
  if (v29 >= v27) {
    unsigned int v44 = v29 - v27;
  }
  else {
    unsigned int v44 = 0;
  }
  value = (unsigned __int8 *)output_message_buffer.value;
  char v46 = *(unsigned char *)output_message_buffer.value;
  if ((a1[18] & 4) != 0)
  {
    unsigned int v51 = v43 - v27;
    if (v43 < v27) {
      unsigned int v51 = 0;
    }
    if (v51 >= 0x38 && v44 <= 0x38 && (*(unsigned char *)output_message_buffer.value & 4) != 0)
    {
      OM_uint32 v63 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      *(void *)(a8 + 48) = gssapi_privacy_encode;
      *(void *)(a8 + 64) = gssapi_decode;
      *(_DWORD *)(a8 + 36) = 56;
      if ((v46 & 2) != 0
        && ((*((void (**)(void, const char *, const char *, unsigned __int8 **, void))a2[3] + 4))(*((void *)a2[3] + 3), "GSSAPI", "ad_compat", &v63, 0), v63))
      {
        unsigned int v52 = *v63;
        unsigned int v47 = 4;
        if (v52 > 0x73)
        {
          if (v52 != 116 && v52 != 121) {
            goto LABEL_123;
          }
        }
        else if (v52 != 49 && (v52 != 111 || v63[1] != 110))
        {
          goto LABEL_123;
        }
        unsigned int v47 = 6;
      }
      else
      {
        unsigned int v47 = 4;
      }
LABEL_123:
      value = (unsigned __int8 *)output_message_buffer.value;
      goto LABEL_124;
    }
  }
  if ((a1[18] & 2) != 0 && v43 > v27 && v44 <= 1 && (*(unsigned char *)output_message_buffer.value & 2) != 0)
  {
    *(void *)(a8 + 48) = gssapi_integrity_encode;
    *(void *)(a8 + 64) = gssapi_decode;
    *(_DWORD *)(a8 + 36) = 1;
    unsigned int v47 = 2;
  }
  else
  {
    if ((a1[18] & 1) == 0 || v29 > v27 || (*(unsigned char *)output_message_buffer.value & 1) == 0)
    {
      sasl_gss_free_context_contents((uint64_t)a1);
      return 4294967281;
    }
    *(void *)(a8 + 48) = 0;
    *(void *)(a8 + 64) = 0;
    unsigned int v47 = 1;
    *(_DWORD *)(a8 + 36) = 0;
  }
LABEL_124:
  *(_DWORD *)(a8 + 32) = (value[1] << 16) | (value[2] << 8) | value[3];
  if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
    return 0xFFFFFFFFLL;
  }
  gss_release_buffer(&minor_status, &output_message_buffer);
  if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a8 + 36) && gssapi_wrap_sizes((uint64_t)a1, a8)) {
    goto LABEL_48;
  }
  OM_uint32 v55 = (unsigned char *)*((void *)a1 + 25);
  if (v55 && *v55) {
    unsigned int v56 = strlen(*(const char **)(a8 + 8));
  }
  else {
    unsigned int v56 = 0;
  }
  input_message_buffer.unsigned int length = v56 + 4;
  uint64_t v57 = (*((uint64_t (**)(size_t))a2[3] + 5))(input_message_buffer.length + 1);
  input_message_buffer.value = (void *)v57;
  if (!v57) {
    goto LABEL_138;
  }
  if (v56) {
    memcpy((void *)(v57 + 4), *(const void **)(a8 + 8), v56);
  }
  if (v47 < 2)
  {
    LOBYTE(v59) = 0;
    *((unsigned char *)input_message_buffer.value + 1) = 0;
    *((unsigned char *)input_message_buffer.value + 2) = 0;
  }
  else
  {
    unsigned int v58 = *((_DWORD *)a2 + 22);
    if (HIBYTE(v58))
    {
      LOBYTE(v59) = -1;
      *((unsigned char *)input_message_buffer.value + 1) = -1;
      *((unsigned char *)input_message_buffer.value + 2) = -1;
    }
    else
    {
      *((unsigned char *)input_message_buffer.value + 1) = BYTE2(v58);
      *((unsigned char *)input_message_buffer.value + 2) = BYTE1(*((_DWORD *)a2 + 22));
      int v59 = *((_DWORD *)a2 + 22);
    }
  }
  *((unsigned char *)input_message_buffer.value + 3) = v59;
  *(unsigned char *)input_message_buffer.value = v47;
  if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
    return 0xFFFFFFFFLL;
  }
  OM_uint32 v28 = gss_wrap(&minor_status, *((gss_ctx_id_t *)a1 + 3), 0, 0, &input_message_buffer, 0, &output_message_buffer);
  if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
    return 0xFFFFFFFFLL;
  }
  (*((void (**)(void *))a2[3] + 8))(input_message_buffer.value);
  input_message_buffer.value = 0;
  if (v28 >= 0x10000) {
    goto LABEL_157;
  }
  if (a7) {
    *a7 = output_message_buffer.length;
  }
  if (output_message_buffer.value)
  {
    if (a6 && a7)
    {
      uint64_t v60 = (void **)(a1 + 44);
      unsigned int v49 = _plug_buf_alloc(*((void *)a1 + 10), (uint64_t *)a1 + 22, a1 + 46, *a7);
      if (v49)
      {
LABEL_83:
        unsigned int v50 = v49;
        if (!(*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26)))
        {
          gss_release_buffer(&minor_status, &output_message_buffer);
          if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
            return 0xFFFFFFFFLL;
          }
          else {
            return v50;
          }
        }
        return 0xFFFFFFFFLL;
      }
      memcpy(*v60, output_message_buffer.value, *a7);
      *a6 = *v60;
    }
    if ((*((unsigned int (**)(void))a2[3] + 10))(*((void *)a1 + 26))) {
      return 0xFFFFFFFFLL;
    }
    gss_release_buffer(&minor_status, &output_message_buffer);
    if ((*((unsigned int (**)(void))a2[3] + 11))(*((void *)a1 + 26))) {
      return 0xFFFFFFFFLL;
    }
  }
  *a1 = 4;
  *(_DWORD *)a8 = 1;
  if (*((_DWORD *)a2 + 22) >= 0xFFFFFFu) {
    int v61 = 0xFFFFFF;
  }
  else {
    int v61 = *((_DWORD *)a2 + 22);
  }
  _plug_decode_init((uint64_t)(a1 + 22), *((void *)a1 + 10), v61);
  return 0;
}

void gssapi_server_mech_step_cold_1()
{
  __assert_rtn("gssapi_server_mech_authneg", "gssapi.c", 975, "maj_stat == GSS_S_COMPLETE");
}

void sasl_gss_seterror__cold_1()
{
  __assert_rtn("sasl_gss_seterror_", "gssapi.c", 344, "len == strlen(out) + 1");
}

uint64_t login_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &login_server_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "LOGIN version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t login_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &login_client_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Version mismatch in LOGIN");
    return 4294967273;
  }
  return result;
}

uint64_t login_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(24);
  if (v7)
  {
    OM_uint32 v8 = (void *)v7;
    uint64_t result = 0;
    v8[1] = 0;
    v8[2] = 0;
    *OM_uint32 v8 = 0;
    *(_DWORD *)OM_uint32 v8 = 1;
    *a5 = v8;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/login.c near line %d", 77);
    return 4294967294;
  }
  return result;
}

uint64_t login_server_mech_step(int *a1, uint64_t a2, const char *a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  *a5 = 0;
  *a6 = 0;
  if (!a1) {
    return 4294967291;
  }
  int v13 = *a1;
  if (*a1 != 3)
  {
    if (v13 != 2)
    {
      if (v13 != 1)
      {
        (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 1, "Invalid LOGIN server step %d\n", *a1);
        return 0xFFFFFFFFLL;
      }
      *a1 = 2;
      if (!a4)
      {
        *a6 = 9;
        *a5 = "Username:";
        return 1;
      }
    }
    uint64_t v14 = *(void *)(a2 + 80);
    if (a4 >= 0x401)
    {
      (*(void (**)(void, void, const char *))(v14 + 264))(*(void *)(v14 + 8), 0, "username too long (>1024 characters)");
      return 4294967291;
    }
    unsigned int v17 = (char *)(*(uint64_t (**)(uint64_t))(v14 + 40))(a4 + 17);
    *((void *)a1 + 1) = v17;
    if (v17)
    {
      strncpy(v17, a3, a4);
      a1[4] = a4;
      *(unsigned char *)(*((void *)a1 + 1) + a4) = 0;
      *a6 = 9;
      *a5 = "Password:";
      *a1 = 3;
      return 1;
    }
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/login.c near line %d", 139);
    return 4294967294;
  }
  uint64_t v15 = *(void *)(a2 + 80);
  if (a4 >= 0x401)
  {
    (*(void (**)(void, void, const char *))(v15 + 264))(*(void *)(v15 + 8), 0, "clientinlen is > 1024 characters in LOGIN plugin");
    return 4294967291;
  }
  size_t v19 = a4;
  uint64_t v20 = (*(uint64_t (**)(uint64_t))(v15 + 40))(a4 + 17);
  uint64_t v24 = v20;
  if (!v20)
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/login.c near line %d", 171);
    return 4294967294;
  }
  unsigned int v21 = (void *)v20;
  uint64_t v22 = v20 + 8;
  strncpy((char *)(v20 + 8), a3, v19);
  *(unsigned char *)(v22 + v19) = 0;
  *unsigned int v21 = v19;
  uint64_t v16 = (*(uint64_t (**)(void, void, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), *((void *)a1 + 1), a1[4], 7, a7);
  if (!v16)
  {
    uint64_t v16 = (*(uint64_t (**)(void, void, void, uint64_t, void))(*(void *)(a2 + 80) + 200))(*(void *)(*(void *)(a2 + 80) + 8), *(void *)(a7 + 16), *(unsigned int *)(a7 + 28), v22, *(unsigned int *)v21);
    _plug_free_secret(*(unsigned int **)(a2 + 80), &v24);
    if (!v16)
    {
      *a5 = 0;
      *a6 = 0;
      *(_DWORD *)a7 = 1;
      *(_DWORD *)(a7 + 136) = 0;
      *(_OWORD *)(a7 + 32) = 0u;
      *(_OWORD *)(a7 + 48) = 0u;
      *(void *)(a7 + 64) = 0;
    }
  }
  return v16;
}

uint64_t login_server_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 8)) {
      (*(void (**)(void))(a2 + 64))();
    }
    OM_uint32 v4 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v4(v3);
  }
  return result;
}

uint64_t login_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(24);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t result = 0;
    v6[1] = 0;
    v6[2] = 0;
    *uint64_t v6 = 0;
    *(_DWORD *)uint64_t v6 = 1;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/login.c near line %d", 294);
    return 4294967294;
  }
  return result;
}

uint64_t login_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void ***a5, void *a6, _DWORD *a7, uint64_t a8)
{
  uint64_t v19 = 0;
  if (!a6)
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/login.c near line %d", 322);
    return 4294967289;
  }
  if (*(_DWORD *)a1 == 2)
  {
    if (!a3)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Server didn't issue challenge for PASSWORD");
      return 4294967291;
    }
    uint64_t v15 = (void **)(a1 + 8);
    if (*(void *)(a1 + 8))
    {
      LODWORD(password) = 0;
    }
    else
    {
      uint64_t password = _plug_get_password(*(void *)(a2 + 24), (size_t **)(a1 + 8), (_DWORD *)(a1 + 16), a5);
      if ((password & 0xFFFFFFFD) != 0) {
        return password;
      }
    }
    if (a5 && *a5)
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      *a5 = 0;
    }
    if (password == 2)
    {
      unsigned int prompts = _plug_make_prompts(*(void *)(a2 + 24), a5, 0, 0, 0, 0, (uint64_t)"Please enter your password", 0, 0, 0, 0, 0, 0, 0);
      goto LABEL_27;
    }
    unsigned int v17 = *v15;
    if (*v15)
    {
      if (a7) {
        *a7 = *v17;
      }
      uint64_t password = 0;
      *a6 = v17 + 1;
      *(_DWORD *)a8 = 1;
      *(_DWORD *)(a8 + 136) = 0;
      *(_OWORD *)(a8 + 32) = 0u;
      *(_OWORD *)(a8 + 48) = 0u;
      *(void *)(a8 + 64) = 0;
      return password;
    }
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/login.c near line %d", 425);
    return 4294967289;
  }
  if (*(_DWORD *)a1 != 1)
  {
    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 1, "Invalid LOGIN client step %d\n", *(_DWORD *)a1);
    if (a7) {
      *a7 = 0;
    }
    *a6 = 0;
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 80) > *(_DWORD *)(a2 + 112))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "SSF requested of LOGIN plugin");
    return 4294967281;
  }
  if (!a3)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Server didn't issue challenge for USERNAME");
    return 4294967291;
  }
  if (*(void *)(a8 + 8))
  {
    LODWORD(password) = 0;
  }
  else
  {
    uint64_t password = _plug_get_simple(*(void *)(a2 + 24), 16386, 1, &v19, (uint64_t **)a5);
    if ((password & 0xFFFFFFFD) != 0) {
      return password;
    }
  }
  if (a5 && *a5)
  {
    (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
    *a5 = 0;
  }
  if (password == 2)
  {
    unsigned int prompts = _plug_make_prompts(*(void *)(a2 + 24), a5, 0, 0, (uint64_t)"Please enter your authentication name", 0, 0, 0, 0, 0, 0, 0, 0, 0);
LABEL_27:
    if (prompts) {
      return prompts;
    }
    else {
      return 2;
    }
  }
  uint64_t password = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v19, 0, 3, a8);
  if (!password)
  {
    if (a7) {
      *a7 = *(_DWORD *)(a8 + 28);
    }
    *a6 = *(void *)(a8 + 16);
    *(_DWORD *)a1 = 2;
    return 1;
  }
  return password;
}

uint64_t login_client_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(_DWORD *)(result + 16)) {
      _plug_free_secret((unsigned int *)a2, (void *)(result + 8));
    }
    OM_uint32 v4 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v4(v3);
  }
  return result;
}

void _sasl_MD5Init(MD5_CTX *a1)
{
  *(void *)a1->count = 0;
  *(_OWORD *)a1->state = xmmword_1BF178120;
}

void _sasl_MD5Update(MD5_CTX *a1, const unsigned __int8 *a2, unsigned int a3)
{
  unint64_t v6 = ((unint64_t)a1->count[0] >> 3) & 0x3F;
  *(void *)a1->count += __PAIR64__(a3 >> 29, 8 * a3);
  unsigned int v7 = 64 - v6;
  if (64 - (int)v6 <= a3)
  {
    uint64_t v8 = -(uint64_t)v7;
    unint64_t v9 = v6 + 24;
    OM_uint32 v10 = a2;
    do
    {
      char v11 = *v10++;
      *((unsigned char *)a1->state + v9++) = v11;
    }
    while (!__CFADD__(v8++, 1));
    MD5Transform(a1, (const char *)a1->buffer);
    unsigned int v13 = v6 ^ 0x7F;
    if ((v6 ^ 0x7F) >= a3)
    {
      unint64_t v6 = 0;
    }
    else
    {
      do
      {
        MD5Transform(a1, (const char *)&a2[v13 - 63]);
        v13 += 64;
      }
      while (v13 < a3);
      unint64_t v6 = 0;
      unsigned int v7 = v13 - 63;
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  uint64_t v14 = a3 - v7;
  if (a3 != v7)
  {
    uint64_t v15 = &a1->buffer[v6];
    uint64_t v16 = &a2[v7];
    do
    {
      unsigned __int8 v17 = *v16++;
      *v15++ = v17;
      --v14;
    }
    while (v14);
  }
}

void _sasl_MD5Final(unsigned __int8 a1[16], MD5_CTX *a2)
{
  uint64_t v4 = 0;
  v9[1] = *MEMORY[0x1E4F143B8];
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  do
  {
    *(_DWORD *)((char *)v9 + v4 * 4) = a2->count[v4];
    ++v4;
  }
  while (v4 != 2);
  UINT4 v5 = (a2->count[0] >> 3) & 0x3F;
  if (v5 >= 0x38) {
    int v6 = 120;
  }
  else {
    int v6 = 56;
  }
  _sasl_MD5Update(a2, PADDING, v6 - v5);
  _sasl_MD5Update(a2, (const unsigned __int8 *)v9, 8u);
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v8 = &a1[i * 4 + 1];
    *(_WORD *)(v8 - 1) = a2->state[i];
    v8[1] = HIWORD(a2->state[i]);
    v8[2] = HIBYTE(a2->state[i]);
  }
  MD5_memset(a2, 0, 0x58uLL);
}

void _sasl_hmac_md5_init(HMAC_MD5_CTX *hmac, const unsigned __int8 *key, int key_len)
{
  uint64_t v3 = key;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  memset(v12, 170, sizeof(v12));
  if (key_len >= 65)
  {
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&__dst.buffer[48] = v5;
    *(_OWORD *)&__dst.buffer[32] = v5;
    *(_OWORD *)&__dst.buffer[16] = v5;
    *(_OWORD *)__dst.buffer = v5;
    *(void *)__dst.count = 0;
    *(_OWORD *)__dst.state = xmmword_1BF178120;
    _sasl_MD5Update(&__dst, key, key_len);
    uint64_t v3 = v12;
    _sasl_MD5Final(v12, &__dst);
    memset(&__dst, 0, 65);
    *(_OWORD *)unsigned int v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    key_len = 16;
    char v17 = 0;
LABEL_4:
    size_t v6 = key_len;
    memcpy(&__dst, v3, key_len);
    memcpy(v13, v3, v6);
    goto LABEL_5;
  }
  memset(&__dst, 0, 65);
  *(_OWORD *)unsigned int v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v17 = 0;
  if (key_len) {
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v7 = 0;
  v8.i64[0] = 0x3636363636363636;
  v8.i64[1] = 0x3636363636363636;
  v9.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v9.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    *(int8x16_t *)&__dst.state[v7] = veorq_s8(*(int8x16_t *)&__dst.state[v7], v8);
    *(int8x16_t *)&v13[v7 * 4] = veorq_s8(*(int8x16_t *)&v13[v7 * 4], v9);
    v7 += 4;
  }
  while (v7 != 16);
  *(void *)hmac->ictx.count = 0;
  *(_OWORD *)hmac->ictx.state = xmmword_1BF178120;
  _sasl_MD5Update(&hmac->ictx, (const unsigned __int8 *)&__dst, 0x40u);
  *(_OWORD *)hmac->octx.state = xmmword_1BF178120;
  p_octx = &hmac->octx;
  *(void *)p_octx->count = 0;
  _sasl_MD5Update(p_octx, v13, 0x40u);
}

void _sasl_hmac_md5_precalc(HMAC_MD5_STATE *hmac, const unsigned __int8 *key, int key_len)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v6.octx.buffer[32] = v4;
  *(_OWORD *)&v6.octx.buffer[48] = v4;
  *(_OWORD *)v6.octx.buffer = v4;
  *(_OWORD *)&v6.octx.buffer[16] = v4;
  *(_OWORD *)&v6.ictx.buffer[56] = v4;
  *(_OWORD *)&v6.octx.state[2] = v4;
  *(_OWORD *)&v6.ictx.buffer[24] = v4;
  *(_OWORD *)&v6.ictx.buffer[40] = v4;
  *(_OWORD *)v6.ictx.count = v4;
  *(_OWORD *)&v6.ictx.UniChar buffer[8] = v4;
  *(_OWORD *)v6.ictx.state = v4;
  _sasl_hmac_md5_init(&v6, key, key_len);
  int8x16_t v5 = vrev32q_s8(*(int8x16_t *)v6.octx.state);
  *(int8x16_t *)hmac->istate = vrev32q_s8(*(int8x16_t *)v6.ictx.state);
  *(int8x16_t *)hmac->ostate = v5;
}

void _sasl_hmac_md5_import(HMAC_MD5_CTX *hmac, HMAC_MD5_STATE *state)
{
  uint64_t v2 = 0;
  *(_OWORD *)&hmac->octx.buffer[32] = 0u;
  *(_OWORD *)&hmac->octx.buffer[48] = 0u;
  *(_OWORD *)hmac->octx.buffer = 0u;
  *(_OWORD *)&hmac->octx.buffer[16] = 0u;
  *(_OWORD *)&hmac->ictx.buffer[56] = 0u;
  *(_OWORD *)&hmac->octx.state[2] = 0u;
  *(_OWORD *)&hmac->ictx.buffer[24] = 0u;
  *(_OWORD *)&hmac->ictx.buffer[40] = 0u;
  *(_OWORD *)hmac->ictx.count = 0u;
  *(_OWORD *)&hmac->ictx.UniChar buffer[8] = 0u;
  *(_OWORD *)hmac->ictx.state = 0u;
  do
  {
    uint64_t v3 = &hmac->ictx.state[v2];
    UINT4 *v3 = bswap32(state->istate[v2]);
    v3[22] = bswap32(state->ostate[v2++]);
  }
  while (v2 != 4);
  hmac->octx.count[0] = 512;
  hmac->ictx.count[0] = 512;
}

void _sasl_hmac_md5_final(unsigned __int8 digest[16], HMAC_MD5_CTX *hmac)
{
  _sasl_MD5Final(digest, &hmac->ictx);
  p_octx = &hmac->octx;
  _sasl_MD5Update(p_octx, digest, 0x10u);
  _sasl_MD5Final(digest, p_octx);
}

void _sasl_hmac_md5(const unsigned __int8 *text, int text_len, const unsigned __int8 *key, int key_len, unsigned __int8 digest[16])
{
  HMAC_MD5_CTX v6 = key;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v21.buffer[48] = v9;
  *(_OWORD *)&v21.buffer[32] = v9;
  *(_OWORD *)&v21.buffer[16] = v9;
  *(_OWORD *)v21.buffer = v9;
  memset(v15, 170, sizeof(v15));
  if (key_len >= 65)
  {
    *(_OWORD *)&__dst.buffer[48] = v9;
    *(_OWORD *)&__dst.buffer[32] = v9;
    *(_OWORD *)&__dst.buffer[16] = v9;
    *(_OWORD *)__dst.buffer = v9;
    *(void *)__dst.count = 0;
    *(_OWORD *)__dst.state = xmmword_1BF178120;
    _sasl_MD5Update(&__dst, key, key_len);
    HMAC_MD5_CTX v6 = v15;
    _sasl_MD5Final(v15, &__dst);
    memset(&__dst, 0, 65);
    *(_OWORD *)long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    key_len = 16;
    char v20 = 0;
LABEL_4:
    size_t v10 = key_len;
    memcpy(&__dst, v6, key_len);
    memcpy(v16, v6, v10);
    goto LABEL_5;
  }
  memset(&__dst, 0, 65);
  *(_OWORD *)long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v20 = 0;
  if (key_len) {
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v11 = 0;
  v12.i64[0] = 0x3636363636363636;
  v12.i64[1] = 0x3636363636363636;
  v13.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v13.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    *(int8x16_t *)&__dst.state[v11] = veorq_s8(*(int8x16_t *)&__dst.state[v11], v12);
    *(int8x16_t *)&v16[v11 * 4] = veorq_s8(*(int8x16_t *)&v16[v11 * 4], v13);
    v11 += 4;
  }
  while (v11 != 16);
  *(void *)v21.count = 0;
  *(_OWORD *)v21.state = xmmword_1BF178120;
  _sasl_MD5Update(&v21, (const unsigned __int8 *)&__dst, 0x40u);
  _sasl_MD5Update(&v21, text, text_len);
  _sasl_MD5Final(digest, &v21);
  *(void *)v21.count = 0;
  *(_OWORD *)v21.state = xmmword_1BF178120;
  _sasl_MD5Update(&v21, v16, 0x40u);
  _sasl_MD5Update(&v21, digest, 0x10u);
  _sasl_MD5Final(digest, &v21);
}

int8x16_t MD5Transform(_DWORD *a1, const char *a2)
{
  int8x16x4_t v96 = vld4q_s8(a2);
  int v2 = a1[1];
  int v4 = a1[2];
  int v3 = a1[3];
  uint16x8_t v5 = vmovl_u8(*(uint8x8_t *)v96.val[0].i8);
  int8x16_t v6 = (int8x16_t)vmovl_u16(*(uint16x4_t *)v5.i8);
  uint16x8_t v7 = vmovl_high_u8((uint8x16_t)v96.val[0]);
  uint16x8_t v8 = vmovl_high_u8((uint8x16_t)v96.val[1]);
  uint16x8_t v9 = vmovl_u8(*(uint8x8_t *)v96.val[1].i8);
  int8x16_t v10 = vorrq_s8((int8x16_t)vshll_high_n_u16(v8, 8uLL), (int8x16_t)vmovl_high_u16(v7));
  int8x16_t v11 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v8.i8, 8uLL), (int8x16_t)vmovl_u16(*(uint16x4_t *)v7.i8));
  int8x16_t v12 = vorrq_s8((int8x16_t)vshll_high_n_u16(v9, 8uLL), (int8x16_t)vmovl_high_u16(v5));
  int8x16_t v13 = vorrq_s8((int8x16_t)vshll_n_u16(*(uint16x4_t *)v9.i8, 8uLL), v6);
  _Q3 = vmovl_u8(*(uint8x8_t *)v96.val[2].i8);
  _Q4 = vmovl_high_u8((uint8x16_t)v96.val[2]);
  __asm { SHLL2           V5.4S, V4.8H, #0x10 }
  int8x16_t v21 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q4.i8, 0x10uLL);
  __asm { SHLL2           V4.4S, V3.8H, #0x10 }
  int8x16_t v23 = vorrq_s8(v13, (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q3.i8, 0x10uLL));
  int8x16_t v24 = vorrq_s8(v12, _Q4);
  int8x16_t v25 = vorrq_s8(v10, _Q5);
  uint16x8_t v26 = vmovl_high_u8((uint8x16_t)v96.val[3]);
  uint16x8_t v27 = vmovl_u8(*(uint8x8_t *)v96.val[3].i8);
  int8x16_t v28 = vorrq_s8(v23, (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v27.i8), 0x18uLL));
  HIDWORD(v29) = *a1 + (v4 & v2) + (v3 & ~v2) + v28.i32[0] - 680876936;
  LODWORD(v29) = HIDWORD(v29);
  int v30 = (v29 >> 25) + v2;
  HIDWORD(v29) = v3 + v28.i32[1] + (v4 & ~v30) + (v30 & v2) - 389564586;
  LODWORD(v29) = HIDWORD(v29);
  int v31 = (v29 >> 20) + v30;
  HIDWORD(v29) = v4 + v28.i32[2] + (v2 & ~v31) + (v31 & v30) + 606105819;
  LODWORD(v29) = HIDWORD(v29);
  int8x16_t v32 = vorrq_s8(v24, (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v27), 0x18uLL));
  int v33 = (v29 >> 15) + v31;
  HIDWORD(v29) = v2 + v28.i32[3] + (v30 & ~v33) + (v33 & v31) - 1044525330;
  LODWORD(v29) = HIDWORD(v29);
  int v34 = (v29 >> 10) + v33;
  HIDWORD(v29) = v32.i32[0] + v30 + (v31 & ~v34) + (v34 & v33) - 176418897;
  LODWORD(v29) = HIDWORD(v29);
  int v35 = (v29 >> 25) + v34;
  HIDWORD(v29) = v32.i32[1] + v31 + (v33 & ~v35) + (v35 & v34) + 1200080426;
  LODWORD(v29) = HIDWORD(v29);
  int v36 = (v29 >> 20) + v35;
  HIDWORD(v29) = v32.i32[2] + v33 + (v34 & ~v36) + (v36 & v35) - 1473231341;
  LODWORD(v29) = HIDWORD(v29);
  int8x16_t v37 = vorrq_s8(vorrq_s8(v11, v21), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v26.i8), 0x18uLL));
  int v38 = (v29 >> 15) + v36;
  HIDWORD(v29) = v32.i32[3] + v34 + (v35 & ~v38) + (v38 & v36) - 45705983;
  LODWORD(v29) = HIDWORD(v29);
  int v39 = (v29 >> 10) + v38;
  HIDWORD(v29) = v37.i32[0] + v35 + (v36 & ~v39) + (v39 & v38) + 1770035416;
  LODWORD(v29) = HIDWORD(v29);
  int v40 = (v29 >> 25) + v39;
  HIDWORD(v29) = v37.i32[1] + v36 + (v38 & ~v40) + (v40 & v39) - 1958414417;
  LODWORD(v29) = HIDWORD(v29);
  int v41 = (v29 >> 20) + v40;
  HIDWORD(v29) = v37.i32[2] + v38 + (v39 & ~v41) + (v41 & v40) - 42063;
  LODWORD(v29) = HIDWORD(v29);
  int8x16_t result = vorrq_s8(v25, (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v26), 0x18uLL));
  int v43 = (v29 >> 15) + v41;
  HIDWORD(v29) = v37.i32[3] + v39 + (v40 & ~v43) + (v43 & v41) - 1990404162;
  LODWORD(v29) = HIDWORD(v29);
  int v44 = (v29 >> 10) + v43;
  HIDWORD(v29) = result.i32[0] + v40 + (v41 & ~v44) + (v44 & v43) + 1804603682;
  LODWORD(v29) = HIDWORD(v29);
  int v45 = (v29 >> 25) + v44;
  HIDWORD(v29) = result.i32[1] + v41 + (v43 & ~v45) + (v45 & v44) - 40341101;
  LODWORD(v29) = HIDWORD(v29);
  int v46 = (v29 >> 20) + v45;
  HIDWORD(v29) = result.i32[2] + v43 + (v44 & ~v46) + (v46 & v45) - 1502002290;
  LODWORD(v29) = HIDWORD(v29);
  int v47 = (v29 >> 15) + v46;
  HIDWORD(v29) = result.i32[3] + v44 + (v45 & ~v47) + (v47 & v46) + 1236535329;
  LODWORD(v29) = HIDWORD(v29);
  int v48 = (v29 >> 10) + v47;
  HIDWORD(v29) = v28.i32[1] + v45 + (v47 & ~v46) - 165796510 + (v48 & v46);
  LODWORD(v29) = HIDWORD(v29);
  int v49 = (v29 >> 27) + v48;
  HIDWORD(v29) = v32.i32[2] + v46 + (v48 & ~v47) - 1069501632 + (v49 & v47);
  LODWORD(v29) = HIDWORD(v29);
  int v50 = (v29 >> 23) + v49;
  HIDWORD(v29) = v37.i32[3] + v47 + (v49 & ~v48) + 643717713 + (v50 & v48);
  LODWORD(v29) = HIDWORD(v29);
  int v51 = (v29 >> 18) + v50;
  HIDWORD(v29) = v28.i32[0] + v48 + (v50 & ~v49) - 373897302 + (v51 & v49);
  LODWORD(v29) = HIDWORD(v29);
  int v52 = (v29 >> 12) + v51;
  HIDWORD(v29) = v32.i32[1] + v49 + (v51 & ~v50) - 701558691 + (v52 & v50);
  LODWORD(v29) = HIDWORD(v29);
  int v53 = (v29 >> 27) + v52;
  HIDWORD(v29) = v37.i32[2] + v50 + (v52 & ~v51) + 38016083 + (v53 & v51);
  LODWORD(v29) = HIDWORD(v29);
  int v54 = (v29 >> 23) + v53;
  HIDWORD(v29) = result.i32[3] + v51 + (v53 & ~v52) - 660478335 + (v54 & v52);
  LODWORD(v29) = HIDWORD(v29);
  int v55 = (v29 >> 18) + v54;
  HIDWORD(v29) = v32.i32[0] + v52 + (v54 & ~v53) - 405537848 + (v55 & v53);
  LODWORD(v29) = HIDWORD(v29);
  int v56 = (v29 >> 12) + v55;
  HIDWORD(v29) = v37.i32[1] + v53 + (v55 & ~v54) + 568446438 + (v56 & v54);
  LODWORD(v29) = HIDWORD(v29);
  int v57 = (v29 >> 27) + v56;
  HIDWORD(v29) = result.i32[2] + v54 + (v56 & ~v55) - 1019803690 + (v57 & v55);
  LODWORD(v29) = HIDWORD(v29);
  int v58 = (v29 >> 23) + v57;
  HIDWORD(v29) = v28.i32[3] + v55 + (v57 & ~v56) - 187363961 + (v58 & v56);
  LODWORD(v29) = HIDWORD(v29);
  int v59 = (v29 >> 18) + v58;
  HIDWORD(v29) = v37.i32[0] + v56 + (v58 & ~v57) + 1163531501 + (v59 & v57);
  LODWORD(v29) = HIDWORD(v29);
  int v60 = (v29 >> 12) + v59;
  HIDWORD(v29) = result.i32[1] + v57 + (v59 & ~v58) - 1444681467 + (v60 & v58);
  LODWORD(v29) = HIDWORD(v29);
  int v61 = (v29 >> 27) + v60;
  HIDWORD(v29) = v28.i32[2] + v58 + (v60 & ~v59) - 51403784 + (v61 & v59);
  LODWORD(v29) = HIDWORD(v29);
  int v62 = (v29 >> 23) + v61;
  HIDWORD(v29) = v32.i32[3] + v59 + (v61 & ~v60) + 1735328473 + (v62 & v60);
  LODWORD(v29) = HIDWORD(v29);
  int v63 = (v29 >> 18) + v62;
  HIDWORD(v29) = result.i32[0] + v60 + (v62 & ~v61) - 1926607734 + (v63 & v61);
  LODWORD(v29) = HIDWORD(v29);
  int v64 = (v29 >> 12) + v63;
  HIDWORD(v29) = v32.i32[1] + v61 - 378558 + (v64 ^ v63 ^ v62);
  LODWORD(v29) = HIDWORD(v29);
  int v65 = (v29 >> 28) + v64;
  HIDWORD(v29) = v37.i32[0] + v62 - 2022574463 + (v64 ^ v63 ^ v65);
  LODWORD(v29) = HIDWORD(v29);
  int v66 = (v29 >> 21) + v65;
  HIDWORD(v29) = v37.i32[3] + v63 + 1839030562 + (v65 ^ v64 ^ v66);
  LODWORD(v29) = HIDWORD(v29);
  int v67 = (v29 >> 16) + v66;
  HIDWORD(v29) = result.i32[2] + v64 - 35309556 + (v66 ^ v65 ^ v67);
  LODWORD(v29) = HIDWORD(v29);
  int v68 = (v29 >> 9) + v67;
  HIDWORD(v29) = v28.i32[1] + v65 - 1530992060 + (v67 ^ v66 ^ v68);
  LODWORD(v29) = HIDWORD(v29);
  int v69 = (v29 >> 28) + v68;
  HIDWORD(v29) = v32.i32[0] + v66 + 1272893353 + (v68 ^ v67 ^ v69);
  LODWORD(v29) = HIDWORD(v29);
  int v70 = (v29 >> 21) + v69;
  HIDWORD(v29) = v32.i32[3] + v67 - 155497632 + (v69 ^ v68 ^ v70);
  LODWORD(v29) = HIDWORD(v29);
  int v71 = (v29 >> 16) + v70;
  HIDWORD(v29) = v37.i32[2] + v68 - 1094730640 + (v70 ^ v69 ^ v71);
  LODWORD(v29) = HIDWORD(v29);
  int v72 = (v29 >> 9) + v71;
  HIDWORD(v29) = result.i32[1] + v69 + 681279174 + (v71 ^ v70 ^ v72);
  LODWORD(v29) = HIDWORD(v29);
  int v73 = (v29 >> 28) + v72;
  HIDWORD(v29) = v28.i32[0] + v70 - 358537222 + (v72 ^ v71 ^ v73);
  LODWORD(v29) = HIDWORD(v29);
  int v74 = (v29 >> 21) + v73;
  HIDWORD(v29) = v28.i32[3] + v71 - 722521979 + (v73 ^ v72 ^ v74);
  LODWORD(v29) = HIDWORD(v29);
  int v75 = (v29 >> 16) + v74;
  HIDWORD(v29) = v32.i32[2] + v72 + 76029189 + (v74 ^ v73 ^ v75);
  LODWORD(v29) = HIDWORD(v29);
  int v76 = (v29 >> 9) + v75;
  HIDWORD(v29) = v37.i32[1] + v73 - 640364487 + (v75 ^ v74 ^ v76);
  LODWORD(v29) = HIDWORD(v29);
  int v77 = (v29 >> 28) + v76;
  HIDWORD(v29) = result.i32[0] + v74 - 421815835 + (v76 ^ v75 ^ v77);
  LODWORD(v29) = HIDWORD(v29);
  int v78 = (v29 >> 21) + v77;
  HIDWORD(v29) = result.i32[3] + v75 + 530742520 + (v77 ^ v76 ^ v78);
  LODWORD(v29) = HIDWORD(v29);
  int v79 = (v29 >> 16) + v78;
  HIDWORD(v29) = v28.i32[2] + v76 - 995338651 + (v78 ^ v77 ^ v79);
  LODWORD(v29) = HIDWORD(v29);
  int v80 = (v29 >> 9) + v79;
  HIDWORD(v29) = v28.i32[0] + v77 - 198630844 + ((v80 | ~v78) ^ v79);
  LODWORD(v29) = HIDWORD(v29);
  int v81 = (v29 >> 26) + v80;
  HIDWORD(v29) = v32.i32[3] + v78 + 1126891415 + ((v81 | ~v79) ^ v80);
  LODWORD(v29) = HIDWORD(v29);
  int v82 = (v29 >> 22) + v81;
  HIDWORD(v29) = result.i32[2] + v79 - 1416354905 + ((v82 | ~v80) ^ v81);
  LODWORD(v29) = HIDWORD(v29);
  int v83 = (v29 >> 17) + v82;
  HIDWORD(v29) = v32.i32[1] + v80 - 57434055 + ((v83 | ~v81) ^ v82);
  LODWORD(v29) = HIDWORD(v29);
  int v84 = (v29 >> 11) + v83;
  HIDWORD(v29) = result.i32[0] + v81 + 1700485571 + ((v84 | ~v82) ^ v83);
  LODWORD(v29) = HIDWORD(v29);
  int v85 = (v29 >> 26) + v84;
  HIDWORD(v29) = v28.i32[3] + v82 - 1894986606 + ((v85 | ~v83) ^ v84);
  LODWORD(v29) = HIDWORD(v29);
  int v86 = (v29 >> 22) + v85;
  HIDWORD(v29) = v37.i32[2] + v83 - 1051523 + ((v86 | ~v84) ^ v85);
  LODWORD(v29) = HIDWORD(v29);
  int v87 = (v29 >> 17) + v86;
  HIDWORD(v29) = v28.i32[1] + v84 - 2054922799 + ((v87 | ~v85) ^ v86);
  LODWORD(v29) = HIDWORD(v29);
  int v88 = (v29 >> 11) + v87;
  HIDWORD(v29) = v37.i32[0] + v85 + 1873313359 + ((v88 | ~v86) ^ v87);
  LODWORD(v29) = HIDWORD(v29);
  int v89 = (v29 >> 26) + v88;
  HIDWORD(v29) = result.i32[3] + v86 - 30611744 + ((v89 | ~v87) ^ v88);
  LODWORD(v29) = HIDWORD(v29);
  int v90 = (v29 >> 22) + v89;
  HIDWORD(v29) = v32.i32[2] + v87 - 1560198380 + ((v90 | ~v88) ^ v89);
  LODWORD(v29) = HIDWORD(v29);
  int v91 = (v29 >> 17) + v90;
  HIDWORD(v29) = result.i32[1] + v88 + 1309151649 + ((v91 | ~v89) ^ v90);
  LODWORD(v29) = HIDWORD(v29);
  int v92 = (v29 >> 11) + v91;
  HIDWORD(v29) = v32.i32[0] + v89 - 145523070 + ((v92 | ~v90) ^ v91);
  LODWORD(v29) = HIDWORD(v29);
  int v93 = (v29 >> 26) + v92;
  HIDWORD(v29) = v37.i32[3] + v90 - 1120210379 + ((v93 | ~v91) ^ v92);
  LODWORD(v29) = HIDWORD(v29);
  int v94 = (v29 >> 22) + v93;
  HIDWORD(v29) = v28.i32[2] + v91 + 718787259 + ((v94 | ~v92) ^ v93);
  LODWORD(v29) = HIDWORD(v29);
  int v95 = (v29 >> 17) + v94;
  HIDWORD(v29) = v37.i32[1] + v92 - 343485551 + ((v95 | ~v93) ^ v94);
  LODWORD(v29) = HIDWORD(v29);
  *a1 += v93;
  a1[1] = v95 + v2 + (v29 >> 11);
  a1[2] = v95 + v4;
  a1[3] = v94 + v3;
  return result;
}

void *MD5_memset(void *result, int a2, size_t __len)
{
  if (__len) {
    return memset(result, a2, __len);
  }
  return result;
}

uint64_t ntlm_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &ntlm_server_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "NTLM version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t ntlm_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &ntlm_client_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "NTLM version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t ntlm_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  __b[129] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 80) + 40))(32);
  if (!v7)
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/ntlm.c near line %d", 1353);
    return 4294967294;
  }
  uint64_t v8 = v7;
  int v44 = (char *)0xAAAAAAAAAAAAAAAALL;
  unsigned int v43 = -1431655766;
  (*(void (**)(void, const char *, const char *, char **, unsigned int *))(*(void *)(a2 + 80) + 32))(*(void *)(*(void *)(a2 + 80) + 24), "NTLM", "ntlm_server", &v44, &v43);
  if (!v44)
  {
    int v10 = -1;
    goto LABEL_59;
  }
  __s = (char *)0xAAAAAAAAAAAAAAAALL;
  if (_plug_strdup(*(void *)(a2 + 80), v44, &__s, 0))
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/ntlm.c near line %d", 1365);
    return 4294967294;
  }
  uint64_t v40 = v8;
  int v41 = a5;
  if (v43)
  {
    uint64_t v11 = 0;
    int v12 = 0;
    uint64_t v13 = MEMORY[0x1E4F14390];
    while (1)
    {
      long long v14 = __s;
      unsigned int v15 = __s[v11];
      if ((v15 & 0x80000000) != 0) {
        break;
      }
      if ((*(_DWORD *)(v13 + 4 * v15 + 60) & 0x4000) == 0) {
        goto LABEL_12;
      }
LABEL_13:
      if (++v11 >= (unint64_t)v43) {
        goto LABEL_18;
      }
    }
    if (__maskrune(__s[v11], 0x4000uLL)) {
      goto LABEL_13;
    }
LABEL_12:
    v14[v12++] = v15;
    goto LABEL_13;
  }
  int v12 = 0;
LABEL_18:
  __s[v12] = 0;
  long long v16 = __s;
  do
  {
    while (1)
    {
LABEL_19:
      while (1)
      {
        int v44 = v16;
        long long v17 = strchr(v16, 44);
        if (v17)
        {
          *long long v17 = 0;
          long long v18 = v44;
          long long v16 = v17 + 1;
        }
        else
        {
          long long v18 = v16;
          long long v16 = 0;
        }
        uint64_t v19 = *(void *)(a2 + 80);
        char v20 = *(const char **)(a2 + 16);
        int v47 = 0;
        memset(__b, 170, 0x401uLL);
        *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v57[0] = v21;
        v57[1] = v21;
        __int16 v56 = -21846;
        v55[0] = v21;
        v55[1] = v21;
        __int16 v54 = -21846;
        v53[0] = v21;
        v53[1] = v21;
        int v51 = 0;
        iovec v49 = (iovec)0;
        long long v50 = 0u;
        memset(&v48, 0, sizeof(v48));
        v48.ai_socktype = 1;
        v48.ai_flags = 2;
        int v22 = getaddrinfo(v18, "139", &v48, &v47);
        if (!v22) {
          break;
        }
        int8x16_t v23 = *(void (**)(void, uint64_t, const char *, ...))(v19 + 256);
        int8x16_t v24 = gai_strerror(v22);
        v23(0, 1, "NTLM: getaddrinfo %s/%s: %s", v18, "139", v24);
        if (!v16) {
          goto LABEL_57;
        }
      }
      int8x16_t v25 = v47;
      int ai_family = v47->ai_family;
      if (ai_family == 2 || ai_family == 30) {
        break;
      }
      ai_canonname = v47->ai_canonname;
      if (!ai_canonname) {
        ai_canonname = v18;
      }
      (*(void (**)(void, uint64_t, const char *, ...))(v19 + 256))(0, 1, "NTLM: no IP address info for %s", ai_canonname);
      freeaddrinfo(v47);
      if (!v16) {
        goto LABEL_57;
      }
    }
    while (1)
    {
      int v27 = socket(v25->ai_family, v25->ai_socktype, v25->ai_protocol);
      if ((v27 & 0x80000000) == 0) {
        break;
      }
LABEL_37:
      int8x16_t v25 = v25->ai_next;
      if (!v25)
      {
        if (getnameinfo(v47->ai_addr, v47->ai_addrlen, 0, 0, (char *)v57, 0x20u, 8)) {
          strcpy((char *)v57, "unknown");
        }
        int v33 = v47->ai_canonname;
        if (!v33) {
          int v33 = v18;
        }
        (*(void (**)(void, uint64_t, const char *, ...))(v19 + 256))(0, 1, "NTLM: couldn't connect to %s/%s", v33, (const char *)v57);
        freeaddrinfo(v47);
LABEL_43:
        if (v16) {
          goto LABEL_19;
        }
        goto LABEL_57;
      }
    }
    int v10 = v27;
    if (connect(v27, v25->ai_addr, v25->ai_addrlen) < 0)
    {
      int v28 = *__error();
      close(v10);
      if (v25->ai_family == 30) {
        int v29 = 42;
      }
      else {
        int v29 = 10;
      }
      if (getnameinfo(v25->ai_addr, v25->ai_addrlen, (char *)__b, 0x401u, (char *)v57, 0x20u, v29))
      {
        __b[0] = 0x6E776F6E6B6E75;
        strcpy((char *)v57, "unknown");
      }
      error_message = _plug_get_error_message(v19, v28);
      int v31 = error_message;
      int8x16_t v32 = v47->ai_canonname;
      if (!v32) {
        int8x16_t v32 = v18;
      }
      (*(void (**)(void, uint64_t, const char *, ...))(v19 + 256))(0, 3, "NTLM: connect %s[%s]/%s: %s", v32, (const char *)__b, (const char *)v57, error_message);
      (*(void (**)(char *))(v19 + 64))(v31);
      goto LABEL_37;
    }
    freeaddrinfo(v47);
    unsigned int v46 = 1140850817;
    make_netbios_name(v18, v55);
    make_netbios_name(v20, v53);
    v49.iov_base = &v46;
    v49.size_t iov_len = 4;
    *(void *)&long long v50 = v55;
    *((void *)&v50 + 1) = 34;
    int v51 = v53;
    uint64_t v52 = 34;
    if (retry_writev(v10, &v49, 3) == -1)
    {
      (*(void (**)(void, uint64_t, const char *))(v19 + 256))(0, 1, "NTLM: error sending NetBIOS session request");
      close(v10);
      goto LABEL_43;
    }
    int v35 = retry_read(v10, (char *)&v46, 4u);
    unsigned int v36 = v46;
    unsigned int v46 = bswap32(v46);
    if (v35 != -1 && v36 == 130)
    {
      int v39 = 1;
      goto LABEL_58;
    }
    char v45 = -113;
    retry_read(v10, &v45, 1u);
    unint64_t v37 = v45 ^ 0xFFFFFFFFFFFFFF80;
    int v38 = "Unspecified error";
    if (v37 <= 3) {
      int v38 = (&off_1E63F02A0)[v37];
    }
    (*(void (**)(void, uint64_t, const char *, ...))(v19 + 256))(0, 1, "NTLM: negative NetBIOS session response: %s", v38);
    close(v10);
  }
  while (v16);
LABEL_57:
  int v39 = 0;
  int v10 = -1;
LABEL_58:
  (*(void (**)(char *))(*(void *)(a2 + 80) + 64))(__s);
  uint64_t v8 = v40;
  a5 = v41;
  if (!v39) {
    return 4294967272;
  }
LABEL_59:
  uint64_t result = 0;
  *(_OWORD *)uint64_t v8 = 0u;
  *(_OWORD *)(v8 + 16) = 0u;
  *(_DWORD *)uint64_t v8 = 1;
  *(_DWORD *)(v8 + 28) = v10;
  *a5 = v8;
  return result;
}

uint64_t ntlm_server_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, void *a5, unsigned int *a6, uint64_t a7)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  *a6 = 0;
  if (!a1) {
    return 4294967291;
  }
  (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 5, "NTLM server step %d\n", *(_DWORD *)a1);
  if (*(_DWORD *)a1 == 2)
  {
    long long v88 = 0uLL;
    int v86 = 0;
    int v87 = 0;
    if (!a3
      || a4 < 0x34
      || *(void *)a3 != 0x5053534D4C544ELL
      || (*(char *)(a3 + 8) | (*(char *)(a3 + 9) << 8) | (*(char *)(a3 + 10) << 16) | (*(unsigned __int8 *)(a3 + 11) << 24)) != 3)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "client didn't issue valid NTLM response");
      return 4294967291;
    }
    unsigned int v84 = -1431655766;
    unsigned int v85 = -1431655766;
    unsigned int v82 = -1431655766;
    unsigned int v83 = -1431655766;
    uint64_t v21 = unload_buffer(*(void *)(a2 + 80), (unsigned __int16 *)(a3 + 12), (void *)&v88 + 1, &v85, 0, a3, a4);
    if (v21) {
      goto LABEL_29;
    }
    uint64_t v21 = unload_buffer(*(void *)(a2 + 80), (unsigned __int16 *)(a3 + 20), &v88, &v84, 0, a3, a4);
    if (v21) {
      goto LABEL_29;
    }
    uint64_t v21 = unload_buffer(*(void *)(a2 + 80), (unsigned __int16 *)(a3 + 28), &v87, &v83, *(_DWORD *)(a1 + 4) & 1, a3, a4);
    if (v21) {
      goto LABEL_29;
    }
    uint64_t v21 = unload_buffer(*(void *)(a2 + 80), (unsigned __int16 *)(a3 + 36), &v86, &v82, *(_DWORD *)(a1 + 4) & 1, a3, a4);
    if (v21) {
      goto LABEL_29;
    }
    long long v22 = v88;
    if (v88 == 0
      || *((void *)&v88 + 1) && v85 < 0x18
      || (v84 <= 0x17 ? (BOOL v35 = (void)v88 == 0) : (BOOL v35 = 1), !v35 || (__s = v86) == 0))
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "client issued incorrect/nonexistent responses");
      uint64_t v21 = 4294967291;
      goto LABEL_29;
    }
    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 5, "client user: %s", v86);
    unsigned int v36 = v87;
    if (v87) {
      (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 5, "client domain: %s", v87);
    }
    if (*(_DWORD *)(a1 + 28) != -1)
    {
      uint64_t v80 = *(void *)(a2 + 80);
      __int16 v37 = v85;
      __int16 v38 = v84;
      *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v106[0] = v39;
      v106[1] = v39;
      unsigned __int8 v91 = 13;
      __int16 v90 = -21846;
      unsigned int v89 = -1431655766;
      v101[5] = v39;
      v101[6] = v39;
      v101[3] = v39;
      v101[4] = v39;
      v101[1] = v39;
      v101[2] = v39;
      v101[0] = v39;
      memset(__b, 170, 0x202uLL);
      memset(__str, 170, 20);
      memset(v107, 0, sizeof(v107));
      int v108 = 0;
      BYTE4(v107[0]) = 115;
      load_smb_header((uint64_t)v106, (uint64_t)v107);
      if (*((void *)&v22 + 1)) {
        __int16 v40 = v37;
      }
      else {
        __int16 v40 = 0;
      }
      *(_DWORD *)uint64_t v102 = 255;
      *(_WORD *)&v102[4] = -1;
      *(void *)&v102[6] = 0;
      if ((void)v22) {
        __int16 v41 = v38;
      }
      else {
        __int16 v41 = 0;
      }
      __int16 v103 = v40;
      __int16 v104 = v41;
      uint64_t v105 = 0;
      _plug_snprintf_os_info((char *)__b, 514);
      snprintf(__str, 0x14uLL, "Cyrus SASL %u.%u.%u", 2, 1, 27);
      dataOut[0].iov_base = &v89;
      dataOut[0].size_t iov_len = 4;
      dataOut[1].iov_base = v106;
      dataOut[1].size_t iov_len = 32;
      int v95 = &v91;
      uint64_t v96 = 1;
      uint64_t v97 = v102;
      uint64_t v98 = 26;
      uint64_t v99 = &v90;
      uint64_t v100 = 2;
      if (*((void *)&v22 + 1))
      {
        *(void *)&v101[0] = *((void *)&v22 + 1);
        *((void *)&v101[0] + 1) = 24;
        unsigned int v42 = 6;
      }
      else
      {
        unsigned int v42 = 5;
      }
      if ((void)v22)
      {
        int v51 = &dataOut[v42++];
        v51->iov_base = (void *)v22;
        v51->size_t iov_len = 24;
      }
      uint64_t v52 = &dataOut[v42];
      v52->iov_base = __s;
      v52->size_t iov_len = strlen(__s) + 1;
      if (v36) {
        int v53 = v36;
      }
      else {
        int v53 = "";
      }
      __int16 v54 = &dataOut[v42 + 1];
      v54->iov_base = (void *)v53;
      v54->size_t iov_len = strlen(v53) + 1;
      int v55 = &dataOut[v42 + 2];
      v55->iov_base = __b;
      v55->size_t iov_len = strlen((const char *)__b) + 1;
      __int16 v56 = &dataOut[v42 + 3];
      v56->iov_base = __str;
      size_t v57 = strlen(__str);
      unint64_t v58 = 0;
      unsigned __int16 v59 = 0;
      v56->size_t iov_len = v57 + 1;
      v60.i64[0] = __PAIR64__(v96, dataOut[1].iov_len);
      v60.i64[1] = __PAIR64__(v100, v98);
      int v61 = vaddvq_s32(v60);
      do
      {
        v59 += WORD4(v101[v58 / 0x10]);
        v58 += 16;
      }
      while (16 * v42 - 16 != v58);
      unsigned int v89 = bswap32(v61 + v59);
      __int16 v90 = v59;
      if (retry_writev(*(_DWORD *)(a1 + 28), dataOut, v42 + 4) == -1)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: error sending SESSIONSETUP request");
        goto LABEL_123;
      }
      if ((int)retry_read(*(_DWORD *)(a1 + 28), (char *)&v89, 4u) <= 3)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: error reading SESSIONSETUP response length");
LABEL_123:
        uint64_t v21 = 0xFFFFFFFFLL;
        goto LABEL_29;
      }
      unsigned int v62 = v89;
      unsigned int v63 = bswap32(v89);
      int v64 = (uint64_t *)(a1 + 16);
      if (_plug_buf_alloc(v80, (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), v63))
      {
        (*(void (**)(void, void, const char *))(v80 + 264))(*(void *)(v80 + 8), 0, "cannot allocate NTLM SESSIONSETUP response buffer");
LABEL_126:
        uint64_t v21 = 4294967294;
        goto LABEL_29;
      }
      if ((int)retry_read(*(_DWORD *)(a1 + 28), *(char **)(a1 + 16), v63) < (int)v63)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: error reading SESSIONSETUP response");
        goto LABEL_123;
      }
      if (v63 <= 0x1F)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: not enough data for SESSIONSETUP response header");
        goto LABEL_123;
      }
      uint64_t v71 = *v64;
      unload_smb_header(*v64, (uint64_t)v107);
      if (LODWORD(v107[0]) != 1112364031 || BYTE4(v107[0]) != 115 || (SBYTE12(v107[0]) & 0x80000000) == 0)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: error in SESSIONSETUP response header");
        goto LABEL_123;
      }
      if (DWORD2(v107[0]))
      {
        (*(void (**)(void, uint64_t, const char *, ...))(v80 + 256))(0, 1, "NTLM: auth failure: %u", DWORD2(v107[0]));
LABEL_161:
        uint64_t v21 = 4294967283;
        goto LABEL_29;
      }
      if (v62 == 0x20000000)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: not enough data for SESSIONSETUP response wordcount");
        goto LABEL_123;
      }
      unsigned __int8 v91 = *(unsigned char *)(v71 + 32);
      if (v91 <= 2u)
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: incorrect SESSIONSETUP wordcount");
        goto LABEL_123;
      }
      if (*(unsigned char *)(v71 + 37))
      {
        (*(void (**)(void, uint64_t, const char *))(v80 + 256))(0, 1, "NTLM: authenticated as guest");
        goto LABEL_161;
      }
      uint64_t v21 = (*(uint64_t (**)(void, char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), __s, v82, 3, a7);
      if (!v21)
      {
LABEL_178:
        uint64_t v21 = 0;
        *(_DWORD *)a7 = 1;
        *(_DWORD *)(a7 + 136) = 0;
        *(_OWORD *)(a7 + 32) = 0u;
        *(_OWORD *)(a7 + 48) = 0u;
        *(void *)(a7 + 64) = 0;
      }
LABEL_29:
      if (*((void *)&v88 + 1)) {
        (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
      }
      if ((void)v88) {
        (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
      }
      if (v87) {
        (*(void (**)(void))(*(void *)(a2 + 80) + 64))();
      }
      int8x16_t v23 = v86;
      if (v86) {
        goto LABEL_59;
      }
      return v21;
    }
    v106[0] = xmmword_1E63F0290;
    v43.iov_base = (void *)0xAAAAAAAAAAAAAAAALL;
    v43.size_t iov_len = 0xAAAAAAAAAAAAAAAALL;
    __b[1] = v43;
    __b[2] = v43;
    __b[0] = v43;
    memset(v107, 170, 21);
    memset(dataOut, 170, 24);
    uint64_t v21 = (*(uint64_t (**)(void, _OWORD *))(*(void *)(a2 + 80) + 296))(*(void *)(a2 + 152), v106);
    if (v21) {
      goto LABEL_29;
    }
    uint64_t v21 = (*(uint64_t (**)(void, char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), __s, v82, 3, a7);
    if (v21) {
      goto LABEL_29;
    }
    if (((*(uint64_t (**)(void, _OWORD *, iovec *))(*(void *)(a2 + 80) + 312))(*(void *)(a2 + 152), v106, __b) & 0x80000000) != 0|| !__b[0].iov_base|| !__b[0].iov_len)
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "no secret in database");
      if (*(void *)(a2 + 136)) {
        uint64_t v21 = 4294967279;
      }
      else {
        uint64_t v21 = 4294967276;
      }
      goto LABEL_29;
    }
    size_t v44 = strlen(*(const char **)__b[0].iov_len);
    uint64_t v45 = *(void *)(a2 + 80);
    if (!v44)
    {
      (*(void (**)(void, void, const char *))(v45 + 264))(*(void *)(v45 + 8), 0, "empty secret");
      goto LABEL_123;
    }
    size_t v46 = v44;
    uint64_t v47 = (*(uint64_t (**)(size_t))(v45 + 40))(v44 + 16);
    *(void *)uint64_t v102 = v47;
    if (!v47) {
      goto LABEL_126;
    }
    addrinfo v48 = (uint64_t *)v47;
    *(void *)uint64_t v47 = v46;
    strncpy((char *)(v47 + 8), *(const char **)__b[0].iov_len, v46 + 1);
    (*(void (**)(void, void))(*(void *)(a2 + 80) + 360))(*(void *)(a2 + 152), *(void *)&v106[0]);
    *(_DWORD *)__str = 0;
    if ((void)v22 && v84 >= 0x19)
    {
      (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(0, 5, "calculating NTv2 response");
      V2(dataOut, v48, __s, v36, (const void *)(a1 + 8), (const void *)(v22 + 16), v84 - 16, *(void *)(a2 + 80), (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), (int *)__str);
      if (*(void **)v22 != dataOut[0].iov_base || *(void *)(v22 + 8) != dataOut[0].iov_len)
      {
        long long v50 = "incorrect NTLMv2 response";
LABEL_160:
        (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, v50);
        _plug_free_secret(*(unsigned int **)(a2 + 80), v102);
        goto LABEL_161;
      }
    }
    else if ((void)v22)
    {
      (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(0, 5, "calculating NT response");
      P16_nt((unsigned __int8 *)v107, v48, *(void *)(a2 + 80), (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), (int *)__str);
      BYTE4(v107[1]) = 0;
      LODWORD(v107[1]) = 0;
      E((char *)dataOut, (uint64_t)v107, 0x15u, (void *)(a1 + 8));
      if (*(void **)v22 != dataOut[0].iov_base
        || *(void *)(v22 + 8) != dataOut[0].iov_len
        || *(void **)(v22 + 16) != dataOut[1].iov_base)
      {
        long long v50 = "incorrect NTLM response";
        goto LABEL_160;
      }
    }
    else if (*((void *)&v22 + 1))
    {
      (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(0, 5, "calculating LMv2 response");
      V2(dataOut, v48, __s, v36, (const void *)(a1 + 8), (const void *)(*((void *)&v22 + 1) + 16), v85 - 16, *(void *)(a2 + 80), (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), (int *)__str);
      if ((void *)**((void **)&v22 + 1) != dataOut[0].iov_base
        || *(void *)(*((void *)&v22 + 1) + 8) != dataOut[0].iov_len)
      {
        (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 80) + 256))(0, 5, "calculating LM response");
        P16_lm((char *)v107, (uint64_t)v48, v75, v76, v77, __str);
        BYTE4(v107[1]) = 0;
        LODWORD(v107[1]) = 0;
        E((char *)dataOut, (uint64_t)v107, 0x15u, (void *)(a1 + 8));
        BOOL v78 = (void *)**((void **)&v22 + 1) == dataOut[0].iov_base
           && *(void *)(*((void *)&v22 + 1) + 8) == dataOut[0].iov_len;
        if (!v78 || *(void **)(*((void *)&v22 + 1) + 16) != dataOut[1].iov_base)
        {
          long long v50 = "incorrect LMv1/v2 response";
          goto LABEL_160;
        }
      }
    }
    uint64_t v21 = *(unsigned int *)__str;
    _plug_free_secret(*(unsigned int **)(a2 + 80), v102);
    if (v21) {
      goto LABEL_29;
    }
    goto LABEL_178;
  }
  if (*(_DWORD *)a1 != 1)
  {
    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 1, "Invalid NTLM server step %d\n", *(_DWORD *)a1);
    return 0xFFFFFFFFLL;
  }
  *(void *)&v106[0] = 0;
  if (!a3
    || a4 < 0x10
    || *(void *)a3 != 0x5053534D4C544ELL
    || (*(char *)(a3 + 8) | (*(char *)(a3 + 9) << 8) | (*(char *)(a3 + 10) << 16) | (*(unsigned __int8 *)(a3 + 11) << 24)) != 1)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "client didn't issue valid NTLM request");
    return 4294967291;
  }
  int v14 = *(char *)(a3 + 12) | (*(char *)(a3 + 13) << 8) | (*(char *)(a3 + 14) << 16) | (*(unsigned __int8 *)(a3 + 15) << 24);
  *(_DWORD *)(a1 + 4) = v14;
  (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 80) + 256))(0, 5, "client flags: %x", v14);
  int v15 = *(_DWORD *)(a1 + 4);
  if (v15) {
    int v16 = 65533;
  }
  else {
    int v16 = 0xFFFF;
  }
  *(_DWORD *)(a1 + 4) = v16 & v15;
  if (*(_DWORD *)(a1 + 28) == -1)
  {
    if ((v15 & 4) != 0)
    {
      uint64_t v21 = _plug_strdup(*(void *)(a2 + 80), *(char **)(a2 + 16), (char **)v106, 0);
      if (v21) {
        return v21;
      }
      *(_DWORD *)(a1 + 4) |= 0x20000u;
    }
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a2 + 80) + 184))(*(void *)(*(void *)(a2 + 80) + 16), a1 + 8, 8);
    int8x16_t v25 = *(char **)&v106[0];
    int v26 = *(_DWORD *)(a1 + 4);
  }
  else
  {
    uint64_t v17 = *(void *)(a2 + 80);
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v107[0] = v18;
    v107[1] = v18;
    BYTE8(v88) = 0;
    memset(dataOut, 0, sizeof(dataOut));
    LODWORD(v95) = 0;
    BYTE4(dataOut[0].iov_base) = 114;
    getpid();
    HIWORD(dataOut[1].iov_len) = 0;
    LOWORD(dataOut[1].iov_base) = 0;
    load_smb_header((uint64_t)v107, (uint64_t)dataOut);
    int v19 = 0;
    __b[0].iov_base = v102;
    __b[0].size_t iov_len = 4;
    __b[1].iov_base = v107;
    __b[1].size_t iov_len = 32;
    __b[2].iov_base = (char *)&v88 + 8;
    __b[2].size_t iov_len = 1;
    __b[3].iov_base = __str;
    __b[3].size_t iov_len = 2;
    uint64_t v20 = 24;
    __b[4].iov_base = "\x02NT LM 0.12";
    __b[4].size_t iov_len = 12;
    do
    {
      v19 += *(_DWORD *)((char *)&__b[0].iov_base + v20);
      v20 += 16;
    }
    while (v20 != 72);
    *(_DWORD *)uint64_t v102 = bswap32(v19 + 12);
    *(_WORD *)__str = 12;
    if (retry_writev(*(_DWORD *)(a1 + 28), __b, 5) == -1)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: error sending NEGPROT request");
      goto LABEL_51;
    }
    if ((int)retry_read(*(_DWORD *)(a1 + 28), v102, 4u) <= 3)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: error reading NEGPROT response length");
LABEL_51:
      uint64_t v21 = 0xFFFFFFFFLL;
      goto LABEL_58;
    }
    int v30 = *(_DWORD *)v102;
    unsigned int v31 = bswap32(*(unsigned int *)v102);
    if (_plug_buf_alloc(v17, (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), v31))
    {
      (*(void (**)(void, void, const char *))(v17 + 264))(*(void *)(v17 + 8), 0, "cannot allocate NTLM NEGPROT response buffer");
      goto LABEL_54;
    }
    if ((int)retry_read(*(_DWORD *)(a1 + 28), *(char **)(a1 + 16), v31) < (int)v31)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: error reading NEGPROT response");
      goto LABEL_51;
    }
    if (v31 <= 0x1F)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: not enough data for NEGPROT response header");
      goto LABEL_51;
    }
    uint64_t v34 = *(void *)(a1 + 16);
    unload_smb_header(v34, (uint64_t)dataOut);
    if (LODWORD(dataOut[0].iov_base) != 1112364031
      || BYTE4(dataOut[0].iov_base) != 114
      || LODWORD(dataOut[0].iov_len)
      || (SBYTE4(dataOut[0].iov_len) & 0x80000000) == 0)
    {
      (*(void (**)(void, uint64_t, const char *, ...))(v17 + 256))(0, 1, "NTLM: error in NEGPROT response header: %u", LODWORD(dataOut[0].iov_len));
      goto LABEL_51;
    }
    if (v30 == 0x20000000)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: not enough data for NEGPROT response wordcount");
      goto LABEL_51;
    }
    BYTE8(v88) = *(unsigned char *)(v34 + 32);
    if (BYTE8(v88) != 17)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: incorrect NEGPROT wordcount for NT LM 0.12");
      goto LABEL_51;
    }
    if (*(_WORD *)(v34 + 33)
      || (*(unsigned char *)(v34 + 35) & 0xB) != 3
      || (*(_DWORD *)(v34 + 52) & 0x80000000) != 0
      || *(unsigned char *)(v34 + 66) != 8)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: error in NEGPROT response parameters");
      goto LABEL_51;
    }
    if (v31 - 67 <= 1)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: not enough data for NEGPROT response bytecount");
      goto LABEL_51;
    }
    int v65 = *(unsigned __int16 *)(v34 + 67);
    if (v31 - 69 != v65)
    {
      (*(void (**)(void, uint64_t, const char *))(v17 + 256))(0, 1, "NTLM: incorrect bytecount for NEGPROT response data");
      goto LABEL_51;
    }
    *(void *)(a1 + 8) = *(void *)(v34 + 69);
    int v26 = *(_DWORD *)(a1 + 4);
    if ((v26 & 4) != 0)
    {
      size_t v66 = (v65 - 8);
      int v67 = (char *)(*(uint64_t (**)(size_t))(v17 + 40))(v66);
      *(void *)&v106[0] = v67;
      if (!v67)
      {
        (*(void (**)(void, void, const char *))(v17 + 264))(*(void *)(v17 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/ntlm.c near line %d");
        goto LABEL_54;
      }
      int8x16_t v25 = v67;
      memcpy(v67, (const void *)(v34 + 77), v66);
      if (v66)
      {
        int v68 = v25;
        int v69 = v25;
        do
        {
          char v70 = *v68;
          v68 += 2;
          *v69++ = v70 & 0x7F;
          LODWORD(v66) = v66 - 1;
        }
        while (v66);
      }
      int v26 = *(_DWORD *)(a1 + 4) | 0x10000;
      *(_DWORD *)(a1 + 4) = v26;
    }
    else
    {
      int8x16_t v25 = 0;
    }
  }
  uint64_t v27 = *(void *)(a2 + 80);
  int v28 = (void **)(a1 + 16);
  unsigned int v29 = 48;
  LODWORD(__b[0].iov_base) = 48;
  if (v25) {
    unsigned int v29 = 2 * strlen(v25) + 48;
  }
  *a6 = v29;
  if (_plug_buf_alloc(v27, (uint64_t *)(a1 + 16), (unsigned int *)(a1 + 24), v29))
  {
    (*(void (**)(void, void, const char *))(v27 + 264))(*(void *)(v27 + 8), 0, "cannot allocate NTLM challenge");
LABEL_54:
    uint64_t v21 = 4294967294;
    goto LABEL_58;
  }
  int8x16_t v32 = *v28;
  bzero(*v28, *a6);
  *(void *)int8x16_t v32 = 0x5053534D4C544ELL;
  _OWORD v32[2] = 2;
  unsigned __int16 v33 = (unsigned __int16)ucase(v25, 0);
  if (v25) {
    unsigned __int16 v33 = strlen(v25);
  }
  load_buffer((unsigned char *)v32 + 12, v25, v33, v26 & 1, (uint64_t)v32, (unsigned int *)__b);
  v32[5] = v26;
  *((void *)v32 + 3) = *(void *)(a1 + 8);
  *a5 = *(void *)(a1 + 16);
  *(_DWORD *)a1 = 2;
  uint64_t v21 = 1;
LABEL_58:
  int8x16_t v23 = *(const char **)&v106[0];
  if (*(void *)&v106[0]) {
LABEL_59:
  }
    (*(void (**)(const char *))(*(void *)(a2 + 80) + 64))(v23);
  return v21;
}

uint64_t ntlm_server_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 16)) {
      (*(void (**)(void))(a2 + 64))();
    }
    int v4 = *(_DWORD *)(v3 + 28);
    if (v4 != -1) {
      close(v4);
    }
    uint16x8_t v5 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v5(v3);
  }
  return result;
}

char *make_netbios_name(const char *a1, unsigned char *a2)
{
  size_t v4 = strcspn(a1, ".");
  unint64_t v5 = v4;
  if (v4 >= 0x10) {
    size_t v6 = 16;
  }
  else {
    size_t v6 = v4;
  }
  uint64_t v7 = strncpy(a2 + 18, a1, v6);
  uint64_t result = ucase(v7, v6);
  *a2 = 32;
  if (!v6)
  {
    uint64_t v12 = 1;
LABEL_10:
    size_t v13 = v6 - 16;
    do
    {
      *(_WORD *)&a2[v12] = 16707;
      v12 += 2;
    }
    while (!__CFADD__(v13++, 1));
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  uint64_t v10 = 18;
  do
  {
    uint64_t v11 = &a2[v9];
    v11[1] = (a2[v10] >> 4) + 65;
    v11[2] = (a2[v10] & 0xF) + 65;
    v9 += 2;
    ++v10;
  }
  while (2 * v6 != v9);
  uint64_t v12 = v9 + 1;
  if (v5 <= 0xF) {
    goto LABEL_10;
  }
LABEL_13:
  a2[v12] = 0;
  return result;
}

uint64_t retry_writev(int a1, iovec *a2, int a3)
{
  uint64_t v6 = 0;
  while (a3)
  {
    p_size_t iov_len = &a2->iov_len;
    uint64_t v8 = a3;
    while (1)
    {
      while (!a2->iov_len)
      {
        ++a2;
        p_iov_len += 2;
        --v8;
        if (!--a3) {
          return v6;
        }
      }
      int v9 = a3 >= retry_writev_iov_max ? retry_writev_iov_max : a3;
      int v10 = writev(a1, a2, v9);
      if (v10 != -1) {
        break;
      }
      if (*__error() != 22 || retry_writev_iov_max < 11)
      {
        int v12 = *__error();
        if (v12 == 4) {
          uint64_t result = v6;
        }
        else {
          uint64_t result = 0xFFFFFFFFLL;
        }
        if (v12 != 4) {
          return result;
        }
      }
      else
      {
        retry_writev_iov_max = retry_writev_iov_max >> 1;
      }
    }
    uint64_t v6 = (v6 + v10);
    if (a3 < 1)
    {
      int i = 0;
    }
    else
    {
      for (int i = 0; ; ++i)
      {
        int v15 = v10 - *p_iov_len;
        if (v10 < (int)*p_iov_len) {
          break;
        }
        size_t *p_iov_len = 0;
        p_iov_len += 2;
        int v10 = v15;
        if (!--v8) {
          return v6;
        }
      }
      size_t v16 = *p_iov_len - v10;
      *(p_iov_len - 1) += v10;
      size_t *p_iov_len = v16;
    }
    uint64_t result = v6;
    if (i == a3) {
      return result;
    }
  }
  return v6;
}

uint64_t retry_read(int a1, char *a2, unsigned int a3)
{
  if (!a3) {
    return 0;
  }
  LODWORD(v5) = 0;
  while (1)
  {
    size_t v6 = a3;
    int v7 = recv(a1, a2, a3, 0);
    if ((v7 + 1) <= 1) {
      break;
    }
LABEL_7:
    uint64_t v5 = (v7 + v5);
    if ((int)v6 <= v7) {
      return v5;
    }
    a2 += v7;
    a3 = v6 - v7;
  }
  while (*__error() == 4 || *__error() == 35)
  {
    int v7 = recv(a1, a2, v6, 0);
    if ((v7 + 1) >= 2) {
      goto LABEL_7;
    }
  }
  return 0xFFFFFFFFLL;
}

char *ucase(char *__s, size_t a2)
{
  size_t v2 = a2;
  if (a2 || __s && (size_t v2 = strlen(__s)) != 0)
  {
    if (__s)
    {
      size_t v4 = __s;
      do
      {
        if (!*v4) {
          break;
        }
        char *v4 = __toupper(*v4);
        ++v4;
        --v2;
      }
      while (v2);
    }
  }
  return __s;
}

uint64_t load_smb_header(uint64_t result, uint64_t a2)
{
  *(_DWORD *)uint64_t result = 1112364031;
  *(unsigned char *)(result + 4) = *(unsigned char *)(a2 + 4);
  *(_WORD *)(result + 5) = *(_DWORD *)(a2 + 8);
  *(unsigned char *)(result + 7) = *(_WORD *)(a2 + 10);
  *(unsigned char *)(result + 8) = *(unsigned char *)(a2 + 11);
  *(unsigned char *)(result + 9) = *(unsigned char *)(a2 + 12);
  *(unsigned char *)(result + 10) = *(unsigned char *)(a2 + 14);
  *(unsigned char *)(result + 11) = *(unsigned char *)(a2 + 15);
  *(unsigned char *)(result + 12) = *(unsigned char *)(a2 + 16);
  *(unsigned char *)(result + 13) = *(unsigned char *)(a2 + 17);
  uint64_t v2 = *(void *)(a2 + 18);
  *(_WORD *)(result + 22) = *(_WORD *)(a2 + 26);
  *(void *)(result + 14) = v2;
  *(unsigned char *)(result + 24) = *(unsigned char *)(a2 + 28);
  *(unsigned char *)(result + 25) = *(unsigned char *)(a2 + 29);
  *(unsigned char *)(result + 26) = *(unsigned char *)(a2 + 30);
  *(unsigned char *)(result + 27) = *(unsigned char *)(a2 + 31);
  *(unsigned char *)(result + 28) = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(result + 29) = *(unsigned char *)(a2 + 33);
  *(unsigned char *)(result + 30) = *(unsigned char *)(a2 + 34);
  *(unsigned char *)(result + 31) = *(unsigned char *)(a2 + 35);
  return result;
}

uint64_t unload_smb_header(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)result;
  *(unsigned char *)(a2 + 4) = *(unsigned char *)(result + 4);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(result + 5);
  *(unsigned char *)(a2 + 12) = *(unsigned char *)(result + 9);
  *(_WORD *)(a2 + 14) = *(_WORD *)(result + 10);
  *(_WORD *)(a2 + 16) = *(_WORD *)(result + 12);
  uint64_t v2 = *(void *)(result + 14);
  *(_WORD *)(a2 + 26) = *(_WORD *)(result + 22);
  *(void *)(a2 + 18) = v2;
  *(_WORD *)(a2 + 28) = *(_WORD *)(result + 24);
  *(_WORD *)(a2 + 30) = *(_WORD *)(result + 26);
  *(_WORD *)(a2 + 32) = *(_WORD *)(result + 28);
  *(_WORD *)(a2 + 34) = *(_WORD *)(result + 30);
  return result;
}

unsigned char *load_buffer(unsigned char *result, char *a2, size_t __n, int a4, uint64_t a5, unsigned int *a6)
{
  unsigned __int16 v7 = __n;
  uint64_t v8 = result;
  if (__n)
  {
    uint64_t result = (unsigned char *)(a5 + *a6);
    if (a4)
    {
      int v9 = __n;
      do
      {
        char v10 = *a2++;
        *uint64_t result = v10;
        result[1] = 0;
        result += 2;
        --v9;
      }
      while (v9);
      unsigned __int16 v7 = 2 * __n;
    }
    else
    {
      uint64_t result = memcpy(result, a2, __n);
    }
  }
  *(_WORD *)uint64_t v8 = v7;
  *((_WORD *)v8 + 1) = v7;
  *((_WORD *)v8 + 2) = *a6;
  v8[6] = *((_WORD *)a6 + 1);
  v8[7] = *((unsigned char *)a6 + 3);
  *a6 += v7;
  return result;
}

uint64_t unload_buffer(uint64_t a1, unsigned __int16 *a2, void *a3, unsigned int *a4, int a5, uint64_t a6, unsigned int a7)
{
  size_t v9 = *a2;
  if (*a2)
  {
    int v15 = (unsigned char *)(*(uint64_t (**)(void))(a1 + 40))((v9 + 1));
    *a3 = v15;
    if (!v15)
    {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/ntlm.c near line %d", 295);
      return 4294967294;
    }
    unsigned int v16 = *((_DWORD *)a2 + 1);
    if (a7 < v16 || a7 - v16 < v9) {
      return 4294967291;
    }
    if (a5)
    {
      unsigned int v19 = v9 >> 1;
      if (v9 >= 2)
      {
        uint64_t v20 = (char *)(a6 + v16);
        unsigned int v21 = v9 >> 1;
        do
        {
          char v22 = *v20;
          v20 += 2;
          *v15++ = v22 & 0x7F;
          --v21;
        }
        while (v21);
      }
    }
    else
    {
      memcpy(v15, (const void *)(a6 + v16), v9);
      unsigned int v19 = v9;
    }
    *(unsigned char *)(*a3 + v19) = 0;
  }
  else
  {
    unsigned int v19 = 0;
    *a3 = 0;
  }
  uint64_t result = 0;
  if (a4) {
    *a4 = v19;
  }
  return result;
}

void *V2(void *a1, uint64_t *a2, char *__s, const char *a4, const void *a5, const void *a6, unsigned int a7, uint64_t a8, uint64_t *a9, unsigned int *a10, int *a11)
{
  macOut[2] = *MEMORY[0x1E4F143B8];
  macOut[0] = 0xAAAAAAAAAAAAAAAALL;
  macOut[1] = 0xAAAAAAAAAAAAAAAALL;
  int v17 = strlen(__s);
  if (a4) {
    int v18 = strlen(a4);
  }
  else {
    int v18 = 0;
  }
  unsigned int v19 = v18 + v17;
  if (_plug_buf_alloc(a8, a9, a10, (2 * v19) | 1))
  {
    (*(void (**)(void, void, const char *))(a8 + 264))(*(void *)(a8 + 8), 0, "cannot allocate NTLMv2 hash");
    int v20 = -2;
  }
  else
  {
    *(void *)&long long v21 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx.ctx[88] = v21;
    *(_OWORD *)&ctx.ctx[92] = v21;
    *(_OWORD *)&ctx.ctx[80] = v21;
    *(_OWORD *)&ctx.ctx[84] = v21;
    *(_OWORD *)&ctx.ctx[72] = v21;
    *(_OWORD *)&ctx.ctx[76] = v21;
    *(_OWORD *)&ctx.ctx[64] = v21;
    *(_OWORD *)&ctx.ctx[68] = v21;
    *(_OWORD *)&ctx.ctx[56] = v21;
    *(_OWORD *)&ctx.ctx[60] = v21;
    *(_OWORD *)&ctx.ctx[48] = v21;
    *(_OWORD *)&ctx.ctx[52] = v21;
    *(_OWORD *)&ctx.ctx[40] = v21;
    *(_OWORD *)&ctx.ctx[44] = v21;
    *(_OWORD *)&ctx.ctx[32] = v21;
    *(_OWORD *)&ctx.ctx[36] = v21;
    *(_OWORD *)&ctx.ctx[24] = v21;
    *(_OWORD *)&ctx.ctx[28] = v21;
    *(_OWORD *)&ctx.ctx[16] = v21;
    *(_OWORD *)&ctx.ctx[20] = v21;
    *(_OWORD *)&ctx.ctx[8] = v21;
    *(_OWORD *)&ctx.ctx[12] = v21;
    *(_OWORD *)ctx.CCHmacContext ctx = v21;
    *(_OWORD *)&ctx.ctx[4] = v21;
    P16_nt((unsigned __int8 *)macOut, a2, a8, a9, a10, a11);
    char v22 = strcpy((char *)(*a9 + v19), __s);
    if (a4) {
      char v22 = strcat(v22, a4);
    }
    size_t v23 = 2 * v19;
    int8x16_t v24 = ucase(v22, v19);
    int8x16_t v25 = (unsigned char *)*a9;
    if (v19)
    {
      do
      {
        char v26 = *v24++;
        *int8x16_t v25 = v26;
        v25[1] = 0;
        v25 += 2;
        --v19;
      }
      while (v19);
      int8x16_t v25 = (unsigned char *)*a9;
    }
    CCHmac(1u, macOut, 0x10uLL, v25, v23, macOut);
    CCHmacInit(&ctx, 1u, macOut, 0x10uLL);
    CCHmacUpdate(&ctx, a5, 8uLL);
    CCHmacUpdate(&ctx, a6, a7);
    CCHmacFinal(&ctx, a1);
    int v20 = 0;
  }
  *a11 = v20;
  return a1;
}

unsigned __int8 *P16_nt(unsigned __int8 *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, unsigned int *a5, int *a6)
{
  if (_plug_buf_alloc(a3, a4, a5, 2 * *(_DWORD *)a2))
  {
    (*(void (**)(void, void, const char *))(a3 + 264))(*(void *)(a3 + 8), 0, "cannot allocate P16_nt unicode buffer");
    int v11 = -2;
  }
  else
  {
    int v12 = (_WORD *)*a4;
    uint64_t v13 = *a2;
    if (*a2)
    {
      uint64_t v14 = 0;
      do
        *v12++ = *((unsigned __int8 *)a2 + v14++ + 8);
      while (v13 != v14);
      int v12 = (_WORD *)*a4;
      CC_LONG v15 = 2 * *(_DWORD *)a2;
    }
    else
    {
      CC_LONG v15 = 0;
    }
    CC_MD4(v12, v15, a1);
    int v11 = 0;
  }
  *a6 = v11;
  return a1;
}

char *P16_lm(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = 0x252423402153474BLL;
  strncpy(__dst, (const char *)(a2 + 8), 0xEuLL);
  for (uint64_t i = 0; i != 14; ++i)
  {
    if (!__dst[i]) {
      break;
    }
    __dst[i] = __toupper(__dst[i]);
  }
  E(a1, (uint64_t)__dst, 0xEu, &v10);
  *a6 = 0;
  return a1;
}

char *E(char *dataOut, uint64_t a2, unsigned int a3, void *dataIn)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    unsigned __int16 v7 = dataOut;
    uint64_t v8 = 0;
    do
    {
      int v9 = *(unsigned __int8 *)(a2 + v8 + 1);
      key[0] = *(unsigned char *)(a2 + v8);
      HIDWORD(v11) = key[0];
      LODWORD(v11) = v9 << 24;
      char v10 = v11 >> 25;
      int v12 = *(unsigned __int8 *)(a2 + v8 + 2);
      HIDWORD(v11) = v9;
      LODWORD(v11) = v12 << 24;
      key[1] = v10;
      key[2] = v11 >> 26;
      int v13 = *(unsigned __int8 *)(a2 + v8 + 3);
      HIDWORD(v11) = v12;
      LODWORD(v11) = v13 << 24;
      key[3] = v11 >> 27;
      int v14 = *(unsigned __int8 *)(a2 + v8 + 4);
      HIDWORD(v11) = v13;
      LODWORD(v11) = v14 << 24;
      key[4] = v11 >> 28;
      int v15 = *(unsigned __int8 *)(a2 + v8 + 5);
      HIDWORD(v11) = v14;
      LODWORD(v11) = v15 << 24;
      key[5] = v11 >> 29;
      int v16 = *(unsigned __int8 *)(a2 + v8 + 6);
      HIDWORD(v11) = v15;
      LODWORD(v11) = v16 << 24;
      key[6] = v11 >> 30;
      key[7] = 2 * v16;
      dataOut = (char *)CCCrypt(0, 1u, 2u, key, 8uLL, 0, dataIn, 8uLL, v7, 8uLL, 0);
      v7 += 8;
      v8 += 7;
    }
    while (v8 < a3);
  }
  return dataOut;
}

uint64_t ntlm_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(24);
  if (v5)
  {
    size_t v6 = (void *)v5;
    uint64_t result = 0;
    v6[1] = 0;
    v6[2] = 0;
    *size_t v6 = 0;
    *(_DWORD *)size_t v6 = 1;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/ntlm.c near line %d", 1880);
    return 4294967294;
  }
  return result;
}

uint64_t ntlm_client_mech_step(_DWORD *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t **a5, uint64_t *a6, unsigned int *a7, uint64_t a8)
{
  v69[3] = *MEMORY[0x1E4F143B8];
  *a6 = 0;
  *a7 = 0;
  (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 5, "NTLM client step %d\n", *a1);
  if (*a1 != 2)
  {
    if (*a1 == 1)
    {
      unsigned int v16 = *(_DWORD *)(a2 + 80);
      unsigned int v17 = *(_DWORD *)(a2 + 112);
      uint64_t v18 = *(void *)(a2 + 24);
      if (v16 <= v17)
      {
        *a7 = 32;
        if (_plug_buf_alloc(v18, (uint64_t *)a1 + 1, a1 + 4, 0x20u))
        {
          (*(void (**)(void, void, const char *))(v18 + 264))(*(void *)(v18 + 8), 0, "cannot allocate NTLM request");
          return 4294967294;
        }
        else
        {
          long long v21 = (void *)*((void *)a1 + 1);
          bzero(v21, *a7);
          *long long v21 = 0x5053534D4C544ELL;
          *((_DWORD *)v21 + 2) = 1;
          *((_WORD *)v21 + 6) = 519;
          *(_DWORD *)((char *)v21 + 14) = 0;
          *((_WORD *)v21 + 9) = 0;
          *((unsigned char *)v21 + 20) = 32;
          *(_DWORD *)((char *)v21 + 21) = 0;
          *((_DWORD *)v21 + 6) = 0;
          *((_DWORD *)v21 + 7) = 32;
          *a6 = *((void *)a1 + 1);
          *a1 = 2;
          return 1;
        }
      }
      else
      {
        (*(void (**)(void, void, const char *))(v18 + 264))(*(void *)(v18 + 8), 0, "SSF requested of NTLM plugin");
        return 4294967281;
      }
    }
    else
    {
      (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 1, "Invalid NTLM client step %d\n", *a1);
      return 0xFFFFFFFFLL;
    }
  }
  *(void *)int v65 = 0;
  uint64_t v66 = 0;
  unsigned int v63 = 0;
  memset(v69, 170, 21);
  memset(dataOut, 170, sizeof(dataOut));
  if (!a3
    || a4 < 0x20
    || *(void *)a3 != 0x5053534D4C544ELL
    || (*(char *)(a3 + 8) | (*(char *)(a3 + 9) << 8) | (*(char *)(a3 + 10) << 16) | (*(unsigned __int8 *)(a3 + 11) << 24)) != 2)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "server didn't issue valid NTLM challenge");
    return 4294967291;
  }
  int v64 = -1431655766;
  int v61 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (*(void *)(a8 + 16))
  {
    int v20 = 0;
  }
  else
  {
    uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 16386, 1, &v66, a5);
    int v20 = simple;
    if ((simple & 0xFFFFFFFD) != 0) {
      return simple;
    }
  }
  uint64_t password = _plug_get_password(*(void *)(a2 + 24), (size_t **)v65, &v64, (const void ***)a5);
  if ((password & 0xFFFFFFFD) == 0)
  {
    if (a5 && *a5)
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      *a5 = 0;
    }
    if (v20 == 2 || password == 2)
    {
      if (v20 == 2) {
        int v28 = "Please enter your authentication name";
      }
      else {
        int v28 = 0;
      }
      if (password == 2) {
        unsigned int v29 = "Please enter your password";
      }
      else {
        unsigned int v29 = 0;
      }
      uint64_t password = _plug_make_prompts(*(void *)(a2 + 24), a5, 0, 0, (uint64_t)v28, 0, (uint64_t)v29, 0, 0, 0, 0, 0, 0, 0);
      if (!password) {
        return 2;
      }
      goto LABEL_69;
    }
    uint64_t password = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v66, 0, 3, a8);
    if (password)
    {
LABEL_69:
      if (v64) {
        _plug_free_secret(*(unsigned int **)(a2 + 24), v65);
      }
      return password;
    }
    int v24 = *(char *)(a3 + 20);
    int v60 = v24 | (*(char *)(a3 + 21) << 8);
    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 5, "server flags: %x", (*(char *)(a3 + 22) << 16) | (*(unsigned __int8 *)(a3 + 23) << 24) | v60);
    int v25 = v24 & 1;
    uint64_t password = unload_buffer(*(void *)(a2 + 24), (unsigned __int16 *)(a3 + 12), &v63, 0, v25, a3, a4);
    unsigned int v62 = password;
    char v26 = v63;
    if (password) {
      goto LABEL_67;
    }
    (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 5, "server domain: %s", v63);
    (*(void (**)(void, const char *, const char *, unsigned __int8 **, void))(*(void *)(a2 + 24) + 32))(*(void *)(*(void *)(a2 + 24) + 24), "NTLM", "ntlm_v2", &v61, 0);
    if (!v61) {
      goto LABEL_46;
    }
    unsigned int v27 = *v61;
    if (v27 > 0x73)
    {
      if (v27 != 116 && v27 != 121) {
        goto LABEL_46;
      }
    }
    else if (v27 != 49 && (v27 != 111 || v61[1] != 110))
    {
LABEL_46:
      int8x16_t v32 = *(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256);
      unsigned __int16 v33 = (void *)(a3 + 24);
      if ((v60 & 0x200) != 0)
      {
        v32(0, 5, "calculating NT response");
        P16_nt((unsigned __int8 *)v69, *(uint64_t **)v65, *(void *)(a2 + 24), (uint64_t *)a1 + 1, a1 + 4, (int *)&v62);
        BYTE4(v69[2]) = 0;
        LODWORD(v69[2]) = 0;
        E((char *)dataOut, (uint64_t)v69, 0x15u, v33);
        __int16 v38 = (char *)dataOut;
        unsigned int v31 = 0;
LABEL_50:
        uint64_t password = v62;
        if (!v62)
        {
          uint64_t v39 = *(void *)(a2 + 24);
          __int16 v40 = *(char **)(a8 + 16);
          unsigned int v67 = 64;
          if ((unint64_t)v31 | (unint64_t)v38)
          {
            __int16 v56 = v38;
            uint64_t v57 = v39;
            __s = v40;
            int v55 = a1 + 4;
            if (v26) {
              int v41 = strlen(v26);
            }
            else {
              int v41 = 0;
            }
            iovec v43 = (uint64_t *)(a1 + 2);
            int v44 = (int)__s;
            if (__s) {
              int v44 = strlen(__s);
            }
            if (v31) {
              int v45 = 88;
            }
            else {
              int v45 = 64;
            }
            if (v56) {
              unsigned int v46 = v45 + ((v44 + v41) << v25) + 24;
            }
            else {
              unsigned int v46 = v45 + ((v44 + v41) << v25);
            }
            *a7 = v46;
            if (!_plug_buf_alloc(v57, v43, v55, v46))
            {
              unint64_t v58 = v43;
              uint64_t v47 = (void *)*v43;
              bzero(v47, *a7);
              *uint64_t v47 = 0x5053534D4C544ELL;
              *((_DWORD *)v47 + 2) = 3;
              if (v31) {
                size_t v48 = 24;
              }
              else {
                size_t v48 = 0;
              }
              load_buffer((unsigned char *)v47 + 12, v31, v48, 0, (uint64_t)v47, &v67);
              if (v56) {
                size_t v49 = 24;
              }
              else {
                size_t v49 = 0;
              }
              load_buffer((unsigned char *)v47 + 20, v56, v49, 0, (uint64_t)v47, &v67);
              unsigned __int16 v50 = (unsigned __int16)ucase(v26, 0);
              if (v26) {
                unsigned __int16 v50 = strlen(v26);
              }
              load_buffer((unsigned char *)v47 + 28, v26, v50, v25, (uint64_t)v47, &v67);
              if (__s) {
                unsigned __int16 v51 = strlen(__s);
              }
              else {
                unsigned __int16 v51 = 0;
              }
              load_buffer((unsigned char *)v47 + 36, __s, v51, v25, (uint64_t)v47, &v67);
              uint64_t password = 0;
              *((_DWORD *)v47 + 11) = 0;
              unsigned int v52 = v67;
              *((unsigned char *)v47 + 48) = v67;
              unsigned int v53 = v52 >> 8;
              *((unsigned char *)v47 + 49) = BYTE1(v52);
              unsigned int v54 = HIWORD(v52);
              *((unsigned char *)v47 + 50) = BYTE2(v52);
              *((unsigned char *)v47 + 56) = v52;
              v52 >>= 24;
              *((unsigned char *)v47 + 51) = v52;
              *((_DWORD *)v47 + 13) = 0;
              *((unsigned char *)v47 + 57) = v53;
              *((unsigned char *)v47 + 58) = v54;
              *((unsigned char *)v47 + 59) = v52;
              *((unsigned char *)v47 + 60) = v24;
              *((unsigned char *)v47 + 61) = BYTE1(v60);
              *((_WORD *)v47 + 31) = 0;
              *a6 = *v58;
              *(_DWORD *)a8 = 1;
              *(_DWORD *)(a8 + 136) = 0;
              *(_OWORD *)(a8 + 32) = 0u;
              *(_OWORD *)(a8 + 48) = 0u;
              *(void *)(a8 + 64) = 0;
              if (!v26) {
                goto LABEL_69;
              }
LABEL_68:
              (*(void (**)(char *))(*(void *)(a2 + 24) + 64))(v26);
              goto LABEL_69;
            }
            uint64_t password = 4294967294;
            unsigned int v42 = "cannot allocate NTLM response";
            uint64_t v39 = v57;
          }
          else
          {
            uint64_t password = 0xFFFFFFFFLL;
            unsigned int v42 = "need at least one NT/LM response";
          }
          (*(void (**)(void, void, const char *))(v39 + 264))(*(void *)(v39 + 8), 0, v42);
        }
LABEL_67:
        if (!v26) {
          goto LABEL_69;
        }
        goto LABEL_68;
      }
      v32(0, 5, "calculating LM response");
      P16_lm((char *)v69, *(uint64_t *)v65, v34, v35, v36, &v62);
      BYTE4(v69[2]) = 0;
      LODWORD(v69[2]) = 0;
      __int16 v37 = v33;
      unsigned int v31 = (char *)dataOut;
      E((char *)dataOut, (uint64_t)v69, 0x15u, v37);
LABEL_48:
      __int16 v38 = 0;
      goto LABEL_50;
    }
    (*(void (**)(void, uint64_t, const char *))(*(void *)(a2 + 24) + 256))(0, 5, "calculating LMv2 response");
    (*(void (**)(void, void *, uint64_t))(*(void *)(a2 + 24) + 184))(*(void *)(*(void *)(a2 + 24) + 16), &dataOut[2], 8);
    int v30 = (const void *)(a3 + 24);
    unsigned int v31 = (char *)dataOut;
    V2(dataOut, *(uint64_t **)v65, *(char **)(a8 + 16), v26, v30, &dataOut[2], 8u, *(void *)(a2 + 24), (uint64_t *)a1 + 1, a1 + 4, (int *)&v62);
    goto LABEL_48;
  }
  return password;
}

uint64_t ntlm_client_mech_dispose(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*(void *)(result + 8)) {
      (*(void (**)(void))(a2 + 64))();
    }
    size_t v4 = *(uint64_t (**)(uint64_t))(a2 + 64);
    return v4(v3);
  }
  return result;
}

uint64_t oauthbearer_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a4 = &oauthbearer_client_plugins;
    *a5 = 2;
    *a3 = 4;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "OAUTHBEARER version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t oauthbearer_client_mech_new(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(32);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t result = 0;
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_DWORD *)(v6 + 12) = 1;
    *(unsigned char *)(v6 + 16) = 0;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/oauthbearer.c near line %d", 72);
    return 4294967294;
  }
  return result;
}

uint64_t oauthbearer_client_mech_step(uint64_t a1, uint64_t a2, const void *a3, unsigned int a4, uint64_t **a5, char **a6, _DWORD *a7, uint64_t a8)
{
  *a6 = 0;
  *a7 = 0;
  (*(void (**)(void, uint64_t, const char *, ...))(*(void *)(a2 + 24) + 256))(0, 5, "OAUTHBEARER client step %d\n", *(_DWORD *)(a1 + 12));
  int v16 = *(_DWORD *)(a1 + 12);
  if (v16 == 2)
  {
    MD5_CTX __dst = 0;
    LODWORD(v36) = a4 + 1;
    uint64_t v17 = _plug_buf_alloc(*(void *)(a2 + 24), (uint64_t *)&__dst, (unsigned int *)&v36, a4 + 1);
    if (!v17)
    {
      bzero(__dst, v36);
      memcpy(__dst, a3, a4);
      sasl_seterror(*(sasl_conn_t **)(*(void *)(a2 + 24) + 8), 0, (const char *)__dst);
      *a6 = "\x01";
      *a7 = 1;
      *(_DWORD *)a8 = 1;
    }
  }
  else
  {
    if (v16 != 1)
    {
      uint64_t v18 = *(void (**)(uint64_t, uint64_t, const char *))(*(void *)(a2 + 24) + 256);
      unsigned int v19 = "Invalid OAUTHBEARER client step %d\n";
      uint64_t v20 = 0;
      uint64_t v21 = 1;
LABEL_8:
      v18(v20, v21, v19);
      return 0xFFFFFFFFLL;
    }
    *a6 = 0;
    *a7 = 0;
    if (*(_DWORD *)(a2 + 80) > *(_DWORD *)(a2 + 112))
    {
      (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "SSF requested of OAUTHBEARER plugin");
      return 4294967281;
    }
    size_t v23 = (void *)(a8 + 8);
    if (*(void *)(a8 + 8)) {
      int simple = 0;
    }
    else {
      int simple = _plug_get_simple(*(void *)(a2 + 24), 16385, 0, (void *)(a8 + 8), a5);
    }
    if (*(void *)(a1 + 24))
    {
      LODWORD(v17) = 0;
    }
    else
    {
      uint64_t v17 = _plug_get_simple(*(void *)(a2 + 24), 18948, 1, (void *)(a1 + 24), a5);
      if ((v17 & 0xFFFFFFFD) != 0) {
        return v17;
      }
    }
    if (a5 && *a5)
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      *a5 = 0;
    }
    if (simple != 2 && v17 != 2)
    {
      size_t v36 = 0;
      MD5_CTX __dst = 0;
      if (!*(unsigned char *)(a1 + 16)) {
        sasl_getprop(*(sasl_conn_t **)(*(void *)(a2 + 24) + 8), 13, (const void **)&__dst);
      }
      if (sasl_getprop(*(sasl_conn_t **)(*(void *)(a2 + 24) + 8), 9, (const void **)&v36))
      {
        int v25 = 0;
      }
      else
      {
        unsigned int v29 = strchr((char *)v36, 59);
        if (!v29)
        {
          uint64_t v33 = *(void *)(a2 + 24);
          uint64_t v18 = *(void (**)(uint64_t, uint64_t, const char *))(v33 + 264);
          uint64_t v20 = *(void *)(v33 + 8);
          unsigned int v19 = "failed to split SASL_IPREMOTEPORT";
LABEL_50:
          uint64_t v21 = 0;
          goto LABEL_8;
        }
        int v25 = atoi(v29 + 1);
      }
      if (*v23 && *(unsigned char *)*v23)
      {
        uint64_t v17 = (*(uint64_t (**)(void))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8));
        if (v17) {
          return v17;
        }
        if (__dst)
        {
          if (*(unsigned char *)__dst && v25)
          {
            asprintf(a6, "%s=%s%s\x01host=%s\x01port=%d\x01auth=Bearer %s\x01\x01");
LABEL_61:
            uint64_t v34 = *a6;
            int v35 = strlen(v34);
            *a7 = v35;
            *(void *)a1 = v34;
            *(_DWORD *)(a1 + 8) = v35;
            *(_DWORD *)(a8 + 136) = 0;
            *(_OWORD *)(a8 + 32) = 0u;
            *(_OWORD *)(a8 + 48) = 0u;
            *(void *)(a8 + 64) = 0;
            uint64_t v17 = 1;
            *(_DWORD *)(a1 + 12) = 2;
            return v17;
          }
          if (*(unsigned char *)__dst)
          {
            asprintf(a6, "%s=%s%s\x01host=%s\x01auth=Bearer %s\x01\x01");
            goto LABEL_61;
          }
        }
        if (v25) {
          asprintf(a6, "%s=%s%s\x01port=%d\x01auth=Bearer %s\x01\x01");
        }
        else {
          asprintf(a6, "%s=%s%s\x01auth=Bearer %s\x01\x01");
        }
        goto LABEL_61;
      }
      if (!*(unsigned char *)(a1 + 16))
      {
        if (__dst)
        {
          if (*(unsigned char *)__dst && v25)
          {
            asprintf(a6, "n,\x01host=%s\x01port=%d\x01auth=Bearer %s\x01\x01");
            goto LABEL_61;
          }
          if (*(unsigned char *)__dst)
          {
            asprintf(a6, "n,\x01host=%s\x01auth=Bearer %s\x01\x01");
            goto LABEL_61;
          }
        }
        if (v25) {
          asprintf(a6, "n,\x01port=%d\x01auth=Bearer %s\x01\x01");
        }
        else {
          asprintf(a6, "n,\x01auth=Bearer %s\x01\x01");
        }
        goto LABEL_61;
      }
      uint64_t v30 = *(void *)(a2 + 24);
      uint64_t v18 = *(void (**)(uint64_t, uint64_t, const char *))(v30 + 264);
      uint64_t v20 = *(void *)(v30 + 8);
      unsigned int v19 = "XOAUTH2 requires user";
      goto LABEL_50;
    }
    char v26 = (uint64_t *)(*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(144);
    *a5 = v26;
    if (v26)
    {
      *((_OWORD *)v26 + 7) = 0u;
      *((_OWORD *)v26 + 8) = 0u;
      *((_OWORD *)v26 + 5) = 0u;
      *((_OWORD *)v26 + 6) = 0u;
      *((_OWORD *)v26 + 3) = 0u;
      *((_OWORD *)v26 + 4) = 0u;
      *((_OWORD *)v26 + 1) = 0u;
      *((_OWORD *)v26 + 2) = 0u;
      *(_OWORD *)char v26 = 0u;
      if (simple == 2)
      {
        unsigned int v27 = *a5;
        *unsigned int v27 = 16385;
        v27[1] = (uint64_t)"Authorization Name";
        (*a5)[2] = (uint64_t)"Please enter your authentication name";
        uint64_t v28 = 1;
      }
      else
      {
        uint64_t v28 = 0;
      }
      if (v17 == 2)
      {
        uint64_t v31 = (16 * v28) | (32 * v28);
        int8x16_t v32 = (uint64_t *)((char *)*a5 + v31);
        *int8x16_t v32 = 18948;
        v32[1] = "OAUTH2 Bearer Token";
        *(uint64_t *)((char *)*a5 + v31 + 16) = (uint64_t)"Please enter your access token";
        LODWORD(v28) = v28 + 1;
      }
      (*a5)[6 * v28] = 0;
      return 2;
    }
    else
    {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/oauthbearer.c near line %d", 163);
      return 4294967294;
    }
  }
  return v17;
}

void *oauthbearer_client_mech_dispose(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*result) {
      (*(void (**)(void))(a2 + 64))();
    }
    size_t v4 = *(uint64_t (**)(void *))(a2 + 64);
    return (void *)v4(v3);
  }
  return result;
}

uint64_t xoauth2_client_mech_new(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(32);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t result = 0;
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_DWORD *)(v6 + 12) = 1;
    *(unsigned char *)(v6 + 16) = 1;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/saslplugins/oauthbearer.c near line %d", 92);
    return 4294967294;
  }
  return result;
}

uint64_t plain_server_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &plain_server_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "PLAIN version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t plain_client_plug_init(uint64_t a1, int a2, _DWORD *a3, void *a4, _DWORD *a5)
{
  if (a2 > 3)
  {
    uint64_t result = 0;
    *a3 = 4;
    *a4 = &plain_client_plugins;
    *a5 = 1;
  }
  else
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "PLAIN version mismatch");
    return 4294967273;
  }
  return result;
}

uint64_t plain_server_mech_new(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a5)
  {
    uint64_t result = 0;
    *a5 = 0;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/plain.c near line %d", 70);
    return 4294967289;
  }
  return result;
}

uint64_t plain_server_mech_step(uint64_t a1, uint64_t a2, const char *a3, unsigned int a4, void *a5, _DWORD *a6, uint64_t a7)
{
  *a5 = 0;
  *a6 = 0;
  if (!a4)
  {
LABEL_5:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Can only find author (no password)");
    return 4294967291;
  }
  int v9 = a3;
  uint64_t v10 = 0;
  while (a3[v10])
  {
    if (a4 == ++v10) {
      goto LABEL_5;
    }
  }
  if ((int)v10 + 1 >= a4)
  {
LABEL_10:
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Can only find author/en (no password)");
    return 4294967291;
  }
  unint64_t v11 = &a3[v10 + 1];
  while (a3[v10 + 1])
  {
    if (a4 - 1 == ++v10) {
      goto LABEL_10;
    }
  }
  unsigned int v14 = v10 + 2;
  uint64_t v15 = (v10 + 2);
  int v16 = &a3[v14];
  if (v14 < a4)
  {
    while (a3[v15])
    {
      if (++v15 >= (unint64_t)a4)
      {
        uint64_t v17 = &a3[a4];
        goto LABEL_20;
      }
    }
    unsigned int v14 = v15;
    uint64_t v15 = v15;
  }
  if (v14 != a4)
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Got more data than we were expecting in the PLAIN plugin\n");
    return 4294967291;
  }
  uint64_t v17 = &a3[v15];
LABEL_20:
  int64_t v18 = v17 - v16;
  unsigned int v19 = (char *)(*(uint64_t (**)(void))(*(void *)(a2 + 80) + 40))((v17
                                                                                               - v16
                                                                                               + 1));
  unsigned int v29 = v19;
  if (v19)
  {
    uint64_t v20 = v19;
    strncpy(v19, v16, v18)[v18] = 0;
    uint64_t v21 = 7;
    if (*v9)
    {
      int v22 = strcmp(v9, v11);
      BOOL v23 = v22 != 0;
      if (v22) {
        uint64_t v21 = 5;
      }
      else {
        uint64_t v21 = 7;
      }
    }
    else
    {
      BOOL v23 = 0;
      int v9 = v11;
    }
    uint64_t v12 = (*(uint64_t (**)(void, const char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), v11, 0, v21, a7);
    uint64_t v24 = *(void *)(a2 + 80);
    if (v12)
    {
      _plug_free_string(v24, (const char **)&v29);
    }
    else
    {
      uint64_t v12 = (*(uint64_t (**)(void, void, void, char *, int64_t))(v24 + 200))(*(void *)(v24 + 8), *(void *)(a7 + 16), *(unsigned int *)(a7 + 28), v20, v18);
      _plug_free_string(*(void *)(a2 + 80), (const char **)&v29);
      if (v12)
      {
        (*(void (**)(void, void, const char *))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Password verification failed");
      }
      else
      {
        if (!v23) {
          goto LABEL_41;
        }
        int v25 = (unsigned char **)(*(uint64_t (**)(void))(*(void *)(a2 + 80) + 304))(*(void *)(a2 + 152));
        if (!v25) {
          return 0xFFFFFFFFLL;
        }
        char v26 = *v25;
        if (*v25)
        {
          unsigned int v27 = v25 + 3;
          do
          {
            if (*v26 != 42 && *(v27 - 2)) {
              (*(void (**)(void))(*(void *)(a2 + 80) + 360))(*(void *)(a2 + 152));
            }
            uint64_t v28 = (unsigned char *)*v27;
            v27 += 3;
            char v26 = v28;
          }
          while (v28);
        }
        uint64_t v12 = (*(uint64_t (**)(void, const char *, void, uint64_t, uint64_t))(a2 + 144))(*(void *)(*(void *)(a2 + 80) + 8), v9, 0, 2, a7);
        if (!v12)
        {
LABEL_41:
          uint64_t v12 = 0;
          *(_DWORD *)a7 = 1;
          *(_DWORD *)(a7 + 136) = 0;
          *(_OWORD *)(a7 + 32) = 0u;
          *(_OWORD *)(a7 + 48) = 0u;
          *(void *)(a7 + 64) = 0;
        }
      }
    }
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 80) + 264))(*(void *)(*(void *)(a2 + 80) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/plain.c near line %d", 139);
    return 4294967294;
  }
  return v12;
}

uint64_t plain_client_mech_new(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)(a2 + 24) + 40))(16);
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t result = 0;
    *uint64_t v6 = 0;
    v6[1] = 0;
    *a3 = v6;
  }
  else
  {
    (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/plain.c near line %d", 287);
    return 4294967294;
  }
  return result;
}

uint64_t plain_client_mech_step(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5, void *a6, int *a7, uint64_t a8)
{
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  unsigned int v29 = 0;
  int v28 = 0;
  *a6 = 0;
  *a7 = 0;
  if (*(_DWORD *)(a2 + 80) > *(_DWORD *)(a2 + 112))
  {
    (*(void (**)(void, void, const char *))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "SSF requested of PLAIN plugin");
    return 4294967281;
  }
  if (*(void *)(a8 + 16))
  {
    int v15 = 0;
  }
  else
  {
    uint64_t simple = _plug_get_simple(*(void *)(a2 + 24), 16386, 1, &v30, a5);
    int v15 = simple;
    uint64_t password = simple;
    if ((simple & 0xFFFFFFFD) != 0) {
      return password;
    }
  }
  if (*(void *)(a8 + 8))
  {
    int v16 = 0;
  }
  else
  {
    uint64_t v19 = _plug_get_simple(*(void *)(a2 + 24), 16385, 0, &v31, a5);
    int v16 = v19;
    uint64_t password = v19;
    if ((v19 & 0xFFFFFFFD) != 0) {
      return password;
    }
  }
  uint64_t password = _plug_get_password(*(void *)(a2 + 24), &v29, &v28, (const void ***)a5);
  if ((password & 0xFFFFFFFD) == 0)
  {
    if (a5 && *a5)
    {
      (*(void (**)(void))(*(void *)(a2 + 24) + 64))();
      *a5 = 0;
    }
    if (v15 == 2 || v16 == 2 || password == 2)
    {
      if (v16 == 2) {
        uint64_t v20 = "Please enter your authorization name";
      }
      else {
        uint64_t v20 = 0;
      }
      if (v15 == 2) {
        uint64_t v21 = "Please enter your authentication name";
      }
      else {
        uint64_t v21 = 0;
      }
      if (password == 2) {
        int v22 = "Please enter your password";
      }
      else {
        int v22 = 0;
      }
      uint64_t password = _plug_make_prompts(*(void *)(a2 + 24), a5, (uint64_t)v20, 0, (uint64_t)v21, 0, (uint64_t)v22, 0, 0, 0, 0, 0, 0, 0);
      if (!password) {
        return 2;
      }
      goto LABEL_46;
    }
    if (!v29)
    {
      (*(void (**)(void, void, const char *, ...))(*(void *)(a2 + 24) + 264))(*(void *)(*(void *)(a2 + 24) + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/plugins/plain.c near line %d", 381);
      return 4294967289;
    }
    if (v31 && *v31)
    {
      uint64_t password = (*(uint64_t (**)(void))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8));
      if (password)
      {
LABEL_46:
        if (v28) {
          _plug_free_secret(*(unsigned int **)(a2 + 24), &v29);
        }
        return password;
      }
      uint64_t v17 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v30, 0, 1, a8);
    }
    else
    {
      uint64_t v17 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(a2 + 152))(*(void *)(*(void *)(a2 + 24) + 8), v30, 0, 3, a8);
    }
    uint64_t password = v17;
    if (!v17)
    {
      int v23 = v31 && *v31 ? *(_DWORD *)(a8 + 24) + 2 : 2;
      int v24 = v23 + *(_DWORD *)(a8 + 28) + *(_DWORD *)v29;
      *a7 = v24;
      uint64_t password = _plug_buf_alloc(*(void *)(a2 + 24), (uint64_t *)a1, (unsigned int *)(a1 + 8), v24 + 1);
      if (!password)
      {
        bzero(*(void **)a1, (*a7 + 1));
        uint64_t v25 = *(void *)a1;
        if (v31 && *v31)
        {
          memcpy(*(void **)a1, *(const void **)(a8 + 8), *(unsigned int *)(a8 + 24));
          v25 += *(unsigned int *)(a8 + 24);
        }
        char v26 = (char *)(v25 + 1);
        memcpy(v26, *(const void **)(a8 + 16), *(unsigned int *)(a8 + 28));
        memcpy(&v26[*(unsigned int *)(a8 + 28) + 1], v29 + 1, *v29);
        uint64_t password = 0;
        *a6 = *(void *)a1;
        *(_DWORD *)a8 = 1;
        *(_DWORD *)(a8 + 136) = 0;
        *(_OWORD *)(a8 + 32) = 0u;
        *(_OWORD *)(a8 + 48) = 0u;
        *(void *)(a8 + 64) = 0;
      }
    }
    goto LABEL_46;
  }
  return password;
}

void *plain_client_mech_dispose(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    if (*result) {
      (*(void (**)(void))(a2 + 64))();
    }
    size_t v4 = *(uint64_t (**)(void *))(a2 + 64);
    return (void *)v4(v3);
  }
  return result;
}

uint64_t _plug_iovec_to_buf(uint64_t a1, uint64_t a2, int a3, char ***a4)
{
  if (a1 && a2 && a4)
  {
    LODWORD(v7) = a3;
    uint64_t v8 = *a4;
    if (!*a4)
    {
      int v9 = (char **)(*(uint64_t (**)(uint64_t))(a1 + 40))(16);
      *a4 = v9;
      if (!v9)
      {
        (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 190);
        return 4294967294;
      }
      *int v9 = 0;
      v9[1] = 0;
      uint64_t v8 = *a4;
    }
    *((_DWORD *)v8 + 2) = 0;
    unsigned int v10 = 0;
    if (v7)
    {
      uint64_t v11 = v7;
      uint64_t v12 = (int *)(a2 + 8);
      do
      {
        int v13 = *v12;
        v12 += 4;
        v10 += v13;
        --v11;
      }
      while (v11);
      *((_DWORD *)v8 + 2) = v10;
    }
    if (_plug_buf_alloc(a1, (uint64_t *)v8, (unsigned int *)v8 + 3, v10))
    {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 205);
      return 4294967294;
    }
    bzero(*v8, *((unsigned int *)v8 + 3));
    if (v7)
    {
      int v15 = *v8;
      uint64_t v7 = v7;
      int v16 = (size_t *)(a2 + 8);
      do
      {
        memcpy(v15, (const void *)*(v16 - 1), *v16);
        size_t v17 = *v16;
        v16 += 2;
        v15 += v17;
        --v7;
      }
      while (v7);
    }
    return 0;
  }
  else
  {
    if (a1) {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 183);
    }
    return 4294967289;
  }
}

uint64_t _plug_buf_alloc(uint64_t a1, uint64_t *a2, unsigned int *a3, unsigned int a4)
{
  if (a1 && a2 && a3)
  {
    if (*a2)
    {
      unsigned int v8 = *a3;
      if (*a3 >= a4) {
        return 0;
      }
      do
        v8 *= 2;
      while (v8 < a4);
      uint64_t v9 = (*(uint64_t (**)(void))(a1 + 56))();
      *a2 = v9;
      if (v9)
      {
        uint64_t result = 0;
        *a3 = v8;
        return result;
      }
      *a3 = 0;
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 246);
    }
    else
    {
      uint64_t v11 = (*(uint64_t (**)(void))(a1 + 40))(a4);
      *a2 = v11;
      if (v11)
      {
        uint64_t result = 0;
        *a3 = a4;
        return result;
      }
      *a3 = 0;
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 233);
    }
    return 4294967294;
  }
  else
  {
    if (a1) {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 225);
    }
    return 4294967289;
  }
}

uint64_t _plug_strdup(uint64_t a1, char *__s, char **a3, _DWORD *a4)
{
  if (a1 && __s && a3)
  {
    size_t v8 = strlen(__s);
    int v9 = v8;
    unsigned int v10 = (char *)(*(uint64_t (**)(size_t))(a1 + 40))(v8 + 1);
    *a3 = v10;
    if (v10)
    {
      strcpy(v10, __s);
      uint64_t result = 0;
      if (a4) {
        *a4 = v9;
      }
    }
    else
    {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 270);
      return 4294967294;
    }
  }
  else
  {
    if (a1) {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 262);
    }
    return 4294967289;
  }
  return result;
}

uint64_t _plug_free_string(uint64_t result, const char **a2)
{
  if (result && a2)
  {
    uint64_t v3 = *a2;
    if (*a2)
    {
      uint64_t v4 = result;
      size_t v5 = strlen(*a2);
      (*(void (**)(const char *, size_t))(v4 + 224))(v3, v5);
      uint64_t result = (*(uint64_t (**)(const char *))(v4 + 64))(*a2);
      *a2 = 0;
    }
  }
  return result;
}

unsigned int *_plug_free_secret(unsigned int *result, void *a2)
{
  if (result && a2)
  {
    uint64_t v3 = result;
    uint64_t result = (unsigned int *)*a2;
    if (*a2)
    {
      (*((void (**)(unsigned int *, void))v3 + 28))(result + 2, *result);
      uint64_t result = (unsigned int *)(*((uint64_t (**)(void))v3 + 8))(*a2);
      *a2 = 0;
    }
  }
  return result;
}

uint64_t _plug_get_simple(uint64_t a1, uint64_t a2, int a3, void *a4, uint64_t **a5)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  size_t v17 = (uint64_t (*)(unint64_t, uint64_t, void *, void))0xAAAAAAAAAAAAAAAALL;
  *a4 = 0;
  if (!a5 || (int v9 = *a5) == 0 || (v10 = *v9) == 0)
  {
LABEL_7:
    uint64_t result = (*(uint64_t (**)(void, void, void, unint64_t *))(a1 + 248))(*(void *)(a1 + 8), a2, &v17, &v16);
    if (a3 || result != -1)
    {
      if (result) {
        BOOL v14 = 1;
      }
      else {
        BOOL v14 = v17 == 0;
      }
      if (v14) {
        return result;
      }
      uint64_t result = v17(v16, a2, a4, 0);
      if (!a3 || result) {
        return result;
      }
      if (!*a4)
      {
        (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d");
        return 4294967289;
      }
    }
    return 0;
  }
  uint64_t v11 = v9 + 6;
  while (v10 != a2)
  {
    uint64_t v12 = *v11;
    v11 += 6;
    uint64_t v10 = v12;
    if (!v12) {
      goto LABEL_7;
    }
  }
  uint64_t v15 = *(v11 - 2);
  if (a3 && !v15)
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Unexpectedly missing a prompt result in _plug_get_simple");
    return 4294967289;
  }
  uint64_t result = 0;
  *a4 = v15;
  return result;
}

uint64_t _plug_get_password(uint64_t a1, size_t **a2, _DWORD *a3, const void ***a4)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = (uint64_t (*)(void, unint64_t, uint64_t, size_t **))0xAAAAAAAAAAAAAAAALL;
  *a2 = 0;
  *a3 = 0;
  if (a4)
  {
    uint64_t v6 = *a4;
    if (*a4)
    {
      uint64_t v7 = *v6;
      if (*v6)
      {
        int v9 = v6 + 4;
        while (v7 != (const void *)16388)
        {
          uint64_t v7 = v9[2];
          v9 += 6;
          if (!v7) {
            goto LABEL_7;
          }
        }
        if (*v9)
        {
          uint64_t v12 = (size_t *)(*(uint64_t (**)(uint64_t))(a1 + 40))(*((unsigned int *)v9 + 2) + 17);
          *a2 = v12;
          if (v12)
          {
            size_t v13 = *((unsigned int *)v9 + 2);
            *uint64_t v12 = v13;
            memcpy(v12 + 1, *v9, v13);
            uint64_t result = 0;
            *((unsigned char *)*a2 + **a2 + 8) = 0;
            *a3 = 1;
          }
          else
          {
            (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 400);
            return 4294967294;
          }
          return result;
        }
        (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Unexpectedly missing a prompt result in _plug_get_password");
        return 4294967289;
      }
    }
  }
LABEL_7:
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void, unint64_t *))(a1 + 248))(*(void *)(a1 + 8), 16388, &v15, &v14);
  if (result) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v15 == 0;
  }
  if (!v11)
  {
    uint64_t result = v15(*(void *)(a1 + 8), v14, 16388, a2);
    if (!result)
    {
      if (*a2) {
        return 0;
      }
      (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d");
      return 4294967289;
    }
  }
  return result;
}

uint64_t _plug_get_realm(uint64_t a1, uint64_t a2, void *a3, uint64_t **a4)
{
  unint64_t v14 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v15 = (uint64_t (*)(unint64_t, uint64_t, uint64_t, void *))0xAAAAAAAAAAAAAAAALL;
  *a3 = 0;
  if (a4)
  {
    uint64_t v7 = *a4;
    if (*a4)
    {
      uint64_t v8 = *v7;
      if (*v7)
      {
        int v9 = v7 + 6;
        while (v8 != 16392)
        {
          uint64_t v10 = *v9;
          v9 += 6;
          uint64_t v8 = v10;
          if (!v10) {
            goto LABEL_7;
          }
        }
        uint64_t v13 = *(v9 - 2);
        if (v13)
        {
          uint64_t result = 0;
          *a3 = v13;
          return result;
        }
        (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Unexpectedly missing a prompt result in _plug_get_realm");
        return 4294967289;
      }
    }
  }
LABEL_7:
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void, unint64_t *))(a1 + 248))(*(void *)(a1 + 8), 16392, &v15, &v14);
  if (result) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v15 == 0;
  }
  if (!v12)
  {
    uint64_t result = v15(v14, 16392, a2, a3);
    if (!result)
    {
      if (*a3) {
        return 0;
      }
      (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "Parameter Error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d");
      return 4294967289;
    }
  }
  return result;
}

uint64_t _plug_make_prompts(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (a3) {
    int v15 = 2;
  }
  else {
    int v15 = 1;
  }
  if (a5) {
    ++v15;
  }
  if (a7) {
    ++v15;
  }
  if (a10) {
    ++v15;
  }
  if (a13) {
    ++v15;
  }
  if (v15 == 1)
  {
    (*(void (**)(void, void, const char *))(a1 + 264))(*(void *)(a1 + 8), 0, "make_prompts() called with no actual prompts");
    return 0xFFFFFFFFLL;
  }
  else
  {
    size_t v22 = (48 * v15);
    int v23 = (void *)(*(uint64_t (**)(size_t))(a1 + 40))(v22);
    if (v23)
    {
      int v24 = v23;
      bzero(v23, v22);
      *a2 = v24;
      if (a3)
      {
        *int v24 = 16385;
        v24[1] = "Authorization Name";
        v24[2] = a3;
        v24[3] = a4;
        v24 += 6;
      }
      if (a5)
      {
        *int v24 = 16386;
        v24[1] = "Authentication Name";
        v24[2] = a5;
        v24[3] = a6;
        v24 += 6;
      }
      if (a7)
      {
        *int v24 = 16388;
        v24[1] = "Password";
        v24[2] = a7;
        v24[3] = a8;
        v24 += 6;
      }
      if (a10)
      {
        *int v24 = 16389;
        v24[1] = a9;
        v24[2] = a10;
        v24[3] = a11;
        v24 += 6;
      }
      if (a13)
      {
        *int v24 = 16392;
        v24[1] = a12;
        v24[2] = a13;
        v24[3] = a14;
        v24 += 6;
      }
      uint64_t result = 0;
      *(_OWORD *)int v24 = 0u;
      *((_OWORD *)v24 + 1) = 0u;
    }
    else
    {
      (*(void (**)(void, void, const char *, ...))(a1 + 264))(*(void *)(a1 + 8), 0, "Out of Memory in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/common/plugin_common.c near line %d", 554);
      return 4294967294;
    }
  }
  return result;
}

double _plug_decode_init(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(a1 + 32) = 0;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = 4;
  *(_DWORD *)(a1 + 36) = a3;
  return result;
}

uint64_t _plug_decode(_DWORD *a1, char *__src, unsigned int a3, uint64_t *a4, unsigned int *a5, unsigned int *a6, uint64_t (*a7)(uint64_t, void, void, _DWORD *, _DWORD *), uint64_t a8)
{
  *a6 = 0;
  if (a3)
  {
    unsigned int v13 = a3;
    memset(__n, 170, sizeof(__n));
    unsigned int v29 = a1 + 4;
    unsigned int v16 = a1[2];
    do
    {
      if (v16)
      {
        if (v13 >= v16) {
          size_t v17 = v16;
        }
        else {
          size_t v17 = v13;
        }
        memcpy((char *)v29 - v16, __src, v17);
        int v18 = a1[2] - v17;
        a1[2] = v18;
        if (v18) {
          return 0;
        }
        unsigned int v19 = a1[3];
        unsigned int v20 = bswap32(v19);
        a1[4] = v20;
        if (!v19) {
          return 0xFFFFFFFFLL;
        }
        unsigned int v21 = a1[9];
        if (v20 > v21)
        {
          (*(void (**)(void, uint64_t, const char *, ...))(*(void *)a1 + 256))(0, 1, "encoded packet size too big (%d > %d)", v20, v21);
          return 0xFFFFFFFFLL;
        }
        if (!*((void *)a1 + 3))
        {
          uint64_t v22 = (*(uint64_t (**)(void))(*(void *)a1 + 40))();
          *((void *)a1 + 3) = v22;
          if (!v22) {
            return 4294967294;
          }
        }
        unsigned int v23 = 0;
        unsigned int v24 = v13 - v17;
        __src += v17;
        a1[8] = 0;
      }
      else
      {
        unsigned int v23 = a1[8];
        unsigned int v24 = v13;
      }
      unsigned int v25 = a1[4] - v23;
      char v26 = (void *)(*((void *)a1 + 3) + v23);
      unsigned int v13 = v24 - v25;
      if (v24 < v25)
      {
        memcpy(v26, __src, v24);
        uint64_t result = 0;
        a1[8] += v24;
        return result;
      }
      memcpy(v26, __src, a1[4] - v23);
      uint64_t result = a7(a8, *((void *)a1 + 3), a1[4], &__n[1], __n);
      if (result) {
        return result;
      }
      uint64_t result = _plug_buf_alloc(*(void *)a1, a4, a5, *a6 + __n[0] + 1);
      if (result) {
        return result;
      }
      __src += v25;
      memcpy((void *)(*a4 + *a6), *(const void **)&__n[1], __n[0]);
      unsigned int v28 = *a6 + __n[0];
      *a6 = v28;
      *(unsigned char *)(*a4 + v28) = 0;
      unsigned int v16 = 4;
      a1[2] = 4;
    }
    while (v13);
  }
  return 0;
}

uint64_t _plug_decode_free(void *a1)
{
  uint64_t result = a1[3];
  if (result) {
    return (*(uint64_t (**)(void))(*a1 + 64))();
  }
  return result;
}

char *_plug_get_error_message(uint64_t a1, int __errnum)
{
  size_t v5 = (char *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = strerror(__errnum);
  if (_plug_strdup(a1, v3, &v5, 0)) {
    return 0;
  }
  else {
    return v5;
  }
}

uint64_t _plug_snprintf_os_info(char *a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  memset(&__b, 170, sizeof(__b));
  uname(&__b);
  return snprintf(a1, a2, "%s %s", __b.sysname, __b.release);
}

int sasl_encode64(const char *in, unsigned int inlen, char *out, unsigned int outmax, unsigned int *outlen)
{
  if (!in && inlen) {
    return -7;
  }
  unsigned int v6 = (2 * ((2863311531u * (unint64_t)(inlen + 2)) >> 32)) & 0xFFFFFFFC;
  if (outlen) {
    *outlen = v6;
  }
  if (v6 >= outmax) {
    return -3;
  }
  if (inlen >= 3)
  {
    do
    {
      *out = basis_64[(unint64_t)*(unsigned __int8 *)in >> 2];
      out[1] = basis_64[((unint64_t)*((unsigned __int8 *)in + 1) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (*in & 3))];
      out[2] = basis_64[((unint64_t)*((unsigned __int8 *)in + 2) >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (in[1] & 0xF))];
      uint64_t v7 = out + 4;
      out[3] = basis_64[in[2] & 0x3F];
      in += 3;
      inlen -= 3;
      out += 4;
    }
    while (inlen > 2);
    if (!inlen) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
  uint64_t v7 = out;
  if (inlen)
  {
LABEL_13:
    *uint64_t v7 = basis_64[(unint64_t)*(unsigned __int8 *)in >> 2];
    if (inlen == 1)
    {
      v7[1] = basis_64[16 * (*in & 3)];
      char v8 = 61;
    }
    else
    {
      v7[1] = basis_64[(16 * (*in & 3u)) | ((unint64_t)*((unsigned __int8 *)in + 1) >> 4)];
      char v8 = basis_64[4 * (in[1] & 0xF)];
    }
    v7[2] = v8;
    v7[3] = 61;
    v7 += 4;
  }
LABEL_17:
  int result = 0;
  *uint64_t v7 = 0;
  return result;
}

int sasl_decode64(const char *in, unsigned int inlen, char *out, unsigned int outmax, unsigned int *outlen)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v17 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t v18 = 0xAAAAAAAAAAAAAAAALL;
  if (!out) {
    return -1;
  }
  if (!inlen)
  {
    unsigned int v6 = 0;
    BOOL v7 = 0;
LABEL_51:
    *out = 0;
    if (outlen) {
      *outlen = v6;
    }
    if (v7) {
      int v5 = -5;
    }
    else {
      int v5 = 1;
    }
    if (!inlen) {
      return 0;
    }
    return v5;
  }
  if (*in == 13) {
    return -1;
  }
  if (inlen < 4)
  {
    unsigned int v6 = 0;
    BOOL v7 = 0;
    inlen = 1;
    goto LABEL_51;
  }
  BOOL v7 = 0;
  unsigned int v6 = 0;
  while (1)
  {
    if (v7) {
      return -5;
    }
    for (uint64_t i = 0; i != 4; ++i)
      *((_DWORD *)&v17 + i) = in[i];
    if (v17 > 0x7F) {
      return -5;
    }
    int v9 = *((unsigned __int8 *)index_64 + v17);
    if (v9 == 255) {
      return -5;
    }
    if (HIDWORD(v17) > 0x7F) {
      return -5;
    }
    int v10 = *((unsigned __int8 *)index_64 + HIDWORD(v17));
    if (v10 == 255
      || v18 != 61 && (v18 > 0x7F || *((unsigned __int8 *)index_64 + v18) == 255))
    {
      return -5;
    }
    if (HIDWORD(v18) != 61)
    {
      if (HIDWORD(v18) > 0x7F) {
        return -5;
      }
      int v5 = -5;
      if (v18 == 61 || *((unsigned __int8 *)index_64 + HIDWORD(v18)) == 255) {
        return v5;
      }
    }
    BOOL v11 = v18 == 61 || HIDWORD(v18) == 61;
    BOOL v7 = v11;
    *out = ((char)v10 >> 4) | (4 * v9);
    if (v6 + 1 >= outmax) {
      return -3;
    }
    if (v18 == 61)
    {
      ++out;
      ++v6;
    }
    else
    {
      if (HIDWORD(v17) <= 0x7F) {
        char v12 = *((unsigned char *)index_64 + HIDWORD(v17));
      }
      else {
        char v12 = -1;
      }
      if (v18 <= 0x7F) {
        char v13 = *((unsigned char *)index_64 + v18);
      }
      else {
        char v13 = -1;
      }
      out[1] = (16 * v12) | (v13 >> 2);
      if (v6 + 2 >= outmax) {
        return -3;
      }
      if (HIDWORD(v18) == 61)
      {
        out += 2;
        v6 += 2;
      }
      else
      {
        if (v18 <= 0x7F) {
          char v14 = *((unsigned char *)index_64 + v18);
        }
        else {
          char v14 = -1;
        }
        if (HIDWORD(v18) <= 0x7F) {
          char v15 = *((unsigned char *)index_64 + HIDWORD(v18));
        }
        else {
          char v15 = -1;
        }
        out[2] = v15 | (v14 << 6);
        v6 += 3;
        if (v6 >= outmax) {
          return -3;
        }
        out += 3;
      }
    }
    inlen -= 4;
    in += 4;
    if (inlen <= 3) {
      goto LABEL_51;
    }
  }
}

int sasl_mkchal(sasl_conn_t *conn, char *buf, unsigned int maxlen, unsigned int hostflag)
{
  if (hostflag && (char v8 = (const char *)*((void *)conn + 298)) != 0) {
    unsigned int v9 = strlen(v8) + 45;
  }
  else {
    unsigned int v9 = 44;
  }
  if (v9 > maxlen) {
    return 0;
  }
  time_t v11 = 0xAAAAAAAAAAAAAAAALL;
  unint64_t __buf = 0xAAAAAAAAAAAAAAAALL;
  arc4random_buf(&__buf, 8uLL);
  time(&v11);
  if (hostflag && *((void *)conn + 298)) {
    snprintf(buf, maxlen, "<%lu.%lu@%s>");
  }
  else {
    snprintf(buf, maxlen, "<%lu.%lu>");
  }
  return strlen(buf);
}

int sasl_randcreate(sasl_rand_t **rpool)
{
  return 0;
}

void sasl_rand(sasl_rand_t *rpool, char *buf, unsigned int len)
{
}

int sasl_utf8verify(const char *str, unsigned int len)
{
  if (!len) {
    return 0;
  }
  unsigned int v2 = 0;
  while (1)
  {
    unsigned int v3 = -1;
    int v4 = 1;
    do
    {
      int v5 = v4;
      ++v3;
      --v4;
    }
    while (((str[v2] << v3) & 0x80) != 0);
    if (v3) {
      break;
    }
    unsigned int v6 = v2 + 1;
LABEL_13:
    unsigned int v2 = v6;
    if (v6 >= len) {
      return 0;
    }
  }
  if (v3 != 1 && v3 <= 6)
  {
    unsigned int v6 = v2 + v3;
    unsigned int v7 = v2 + 1;
    while (v5)
    {
      int v8 = str[v7++] & 0xC0;
      ++v5;
      if (v8 != 128) {
        return -5;
      }
    }
    goto LABEL_13;
  }
  return -5;
}

void sasl_erasebuffer(char *pass, unsigned int len)
{
}

uint64_t get_fqhostname(char *a1, int a2, int a3)
{
  size_t v5 = a2;
  uint64_t result = gethostname(a1, a2);
  if (!result)
  {
    if (strchr(a1, 46)) {
      return 0;
    }
    unsigned int v9 = (addrinfo *)0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v10.ai_flags = xmmword_1BF178130;
    *(&v10.ai_addrlen + 1) = -1431655766;
    memset(&v10.ai_canonname, 0, 24);
    v10.size_t ai_addrlen = 0;
    if (getaddrinfo(a1, 0, &v10, &v9))
    {
      if (!a3) {
        return 0;
      }
    }
    else
    {
      unsigned int v7 = v9;
      if (v9)
      {
        ai_canonname = v9->ai_canonname;
        if (ai_canonname)
        {
          if (strchr(v9->ai_canonname, 46))
          {
            strncpy(a1, ai_canonname, v5);
            freeaddrinfo(v9);
            return 0;
          }
        }
      }
      freeaddrinfo(v7);
      if (!a3) {
        return 0;
      }
      *__error() = 96;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

int sasl_server_add_plugin(const char *plugname, sasl_server_plug_init_t *splugfunc)
{
  unsigned int v20 = 0;
  int v2 = -7;
  if (plugname && splugfunc)
  {
    int v21 = -1431655766;
    int v19 = -1431655766;
    int v2 = ((uint64_t (*)(void, uint64_t, int *, _DWORD **, int *))splugfunc)(*(void *)mechlist, 4, &v19, &v20, &v21);
    if ((v2 + 20) > 0x15 || ((1 << (v2 + 20)) & 0x300001) == 0)
    {
      _sasl_log(0, 5u, "%s_client_plug_init() failed in sasl_server_add_plugin(): %z\n", v4, v5, v6, v7, v8, (uint64_t)plugname);
    }
    else if (v19 == 4)
    {
      if (v21 < 1)
      {
        return 0;
      }
      else
      {
        int v10 = 0;
        while (1)
        {
          uint64_t v11 = _sasl_allocation_utils(40);
          if (!v11) {
            break;
          }
          uint64_t v12 = v11;
          *(void *)(v11 + 32) = 0;
          *(_OWORD *)uint64_t v11 = 0u;
          *(_OWORD *)(v11 + 16) = 0u;
          *(void *)(v11 + 16) = v20;
          if (_sasl_strdup(plugname, (char **)(v11 + 8), 0))
          {
            off_1EB527668(v12);
            return -2;
          }
          *(_DWORD *)uint64_t v12 = v19;
          *(_DWORD *)(v12 + 4) = v2;
          uint64_t v13 = mechlist;
          char v15 = (uint64_t *)(mechlist + 16);
          uint64_t v14 = *(void *)(mechlist + 16);
          unsigned int v16 = v20;
          if (v14 && (mech_compare(v20, *(_DWORD **)(v14 + 16)) & 0x80000000) != 0)
          {
            do
            {
              uint64_t v17 = v14;
              uint64_t v14 = *(void *)(v14 + 32);
            }
            while (v14 && (int)mech_compare(v16, *(_DWORD **)(v14 + 16)) < 1);
            char v15 = (uint64_t *)(v17 + 32);
          }
          *(void *)(v12 + 32) = v14;
          *char v15 = v12;
          ++*(_DWORD *)(v13 + 24);
          ++v10;
          unsigned int v20 = v16 + 26;
          if (v10 >= v21) {
            return 0;
          }
        }
        return -2;
      }
    }
    else
    {
      _sasl_log(0, 1u, "version mismatch on  sasl_server_add_plugin for '%s': %d expected, but %d reported", v4, v5, v6, v7, v8, (uint64_t)plugname);
      return -23;
    }
  }
  return v2;
}

uint64_t do_authorization(uint64_t a1)
{
  unint64_t v6 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v7 = (uint64_t (*)())0xAAAAAAAAAAAAAAAALL;
  if (_sasl_getcallback((sasl_conn_t *)a1, 32769, &v7, &v6))
  {
    uint64_t v2 = 4294967282;
    sasl_seterror((sasl_conn_t *)a1, 0, "Internal Error %d in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/server.c near line %d", -14, 1494);
LABEL_3:
    *(_DWORD *)(a1 + 2400) = v2;
    return v2;
  }
  uint64_t v3 = *(void *)(a1 + 4552);
  if (v3) {
    size_t v4 = strlen(*(const char **)(a1 + 4552));
  }
  else {
    size_t v4 = 0;
  }
  uint64_t v2 = ((uint64_t (*)(uint64_t, unint64_t, void, void, void, void, uint64_t, size_t, void))v7)(a1, v6, *(void *)(a1 + 2168), *(unsigned int *)(a1 + 2184), *(void *)(a1 + 2176), *(unsigned int *)(a1 + 2188), v3, v4, *(void *)(*(void *)(a1 + 4576) + 152));
  if ((v2 & 0x80000000) != 0) {
    goto LABEL_3;
  }
  return v2;
}

uint64_t _sasl_server_mechs()
{
  if (_sasl_server_active)
  {
    uint64_t v0 = *(void *)(mechlist + 16);
    if (v0)
    {
      uint64_t v1 = 0;
      while (1)
      {
        uint64_t result = _sasl_allocation_utils(16);
        if (!(v1 | result)) {
          break;
        }
        if (!result)
        {
          uint64_t v3 = *(void *)(v1 + 8);
          do
          {
            off_1EB527668(v1);
            uint64_t v1 = v3;
            uint64_t v3 = *(void *)(v3 + 8);
          }
          while (v3);
          return 0;
        }
        *(void *)uint64_t result = **(void **)(v0 + 16);
        *(void *)(result + 8) = v1;
        uint64_t v0 = *(void *)(v0 + 32);
        uint64_t v1 = result;
        if (!v0) {
          return result;
        }
      }
    }
  }
  return 0;
}

int sasl_checkapop(sasl_conn_t *conn, const char *challenge, unsigned int challen, const char *response, unsigned int resplen)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)names = xmmword_1E63F02C0;
  if (!_sasl_server_active) {
    return -12;
  }
  if (!challenge) {
    return 0;
  }
  if (!conn) {
    return -7;
  }
  if (!response)
  {
    sasl_seterror(conn, 1u, "Parameter error in /Library/Caches/com.apple.xbs/Sources/Mail_Email/Email/SASL/cyrus_sasl/lib/server.c near line %d", 2261);
    int v14 = -7;
    goto LABEL_14;
  }
  uint64_t v8 = strrchr((char *)response, 32);
  if (!v8 || (unsigned int v9 = v8, v10 = v8 + 1, strspn(v8 + 1, "0123456789abcdef") != 32))
  {
    sasl_seterror(conn, 0, "Bad Digest");
    int v14 = -5;
LABEL_14:
    *((_DWORD *)conn + 600) = v14;
    return v14;
  }
  size_t v11 = v9 - response;
  uint64_t v12 = (void *)_sasl_allocation_utils(v9 - response + 1);
  memcpy(v12, response, v11);
  *((unsigned char *)v12 + v11) = 0;
  int v13 = prop_request(*(propctx **)(*((void *)conn + 572) + 152), (const char **)names);
  if (v13)
  {
    int v14 = v13;
    off_1EB527668(v12);
  }
  else
  {
    (*(void (**)(void, char *))(*(void *)(*((void *)conn + 572) + 80) + 360))(*(void *)(*((void *)conn + 572) + 152), names[0]);
    int v14 = _sasl_canon_user_lookup((uint64_t)conn, (char *)v12, v11, 3, (uint64_t)conn + 2160);
    off_1EB527668(v12);
    if (!v14)
    {
      int v16 = _sasl_auxprop_verify_apop(conn, *((void *)conn + 272), challenge, v10);
      if (v16)
      {
        int v14 = v16;
        *((void *)conn + 272) = 0;
        *((void *)conn + 271) = 0;
      }
      else
      {
        int v14 = do_authorization((uint64_t)conn);
      }
    }
  }
  if (v14 < 0) {
    goto LABEL_14;
  }
  return v14;
}

void sasl_seterror(sasl_conn_t *conn, unsigned int flags, const char *fmt, ...)
{
  va_start(va, fmt);
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int8x16_t v32 = 0;
  uint64_t v33 = 0;
  memset(v31, 170, sizeof(v31));
  if (!conn)
  {
    if ((flags & 1) == 0) {
      _sasl_getcallback(0);
    }
    return;
  }
  if (!fmt) {
    return;
  }
  char v30 = flags;
  _sasl_get_errorbuf((uint64_t)conn, &v31[1], v31);
  size_t v4 = strlen(fmt);
  va_copy((va_list)&v31[2], va);
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0;
    while (1)
    {
      if (fmt[v6] != 37)
      {
        if (!_buf_alloc((uint64_t *)v31[1], v31[0], v33 + 1))
        {
          *(unsigned char *)(*v31[1] + v33++) = fmt[v6++];
          goto LABEL_36;
        }
        return;
      }
      uint64_t v7 = 0;
      unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
      char v37 = -86;
      memset(__str, 170, 21);
      uint64_t v8 = &fmt[v6 + 1];
      char __format = 37;
      while (1)
      {
        int v9 = v8[v7];
        char v10 = v8[v7];
        if (v9 <= 104)
        {
          switch(v9)
          {
            case '%':
              if (_buf_alloc((uint64_t *)v31[1], v31[0], v33 + 1)) {
                return;
              }
              *(unsigned char *)(*v31[1] + v33++) = 37;
              goto LABEL_35;
            case 'c':
              int v19 = &__format + v7;
              v19[1] = v10;
              v19[2] = 0;
              unsigned int v20 = v31[2]++;
              __str[0] = *(_DWORD *)v20;
              __str[1] = 0;
              goto LABEL_27;
            case 'd':
LABEL_23:
              int v13 = &__format + v7;
              v13[1] = v10;
              v13[2] = 0;
              int v14 = (unsigned int *)v31[2]++;
              snprintf(__str, 0x14uLL, &__format, *v14);
LABEL_27:
              uint64_t v22 = v31[0];
              int v21 = (uint64_t *)v31[1];
              unsigned int v23 = __str;
              goto LABEL_34;
          }
          goto LABEL_18;
        }
        if (v9 <= 114)
        {
          if (v9 == 105) {
            goto LABEL_23;
          }
          if (v9 == 109)
          {
            int v16 = v31[0];
            char v15 = v31[1];
            uint64_t v17 = (int *)v31[2]++;
            uint64_t v18 = strerror(*v17);
            goto LABEL_32;
          }
          goto LABEL_18;
        }
        if (v9 == 122) {
          break;
        }
        if (v9 == 115)
        {
          int v21 = (uint64_t *)v31[1];
          unsigned int v27 = (char **)v31[2]++;
          unsigned int v23 = *v27;
          uint64_t v22 = v31[0];
          goto LABEL_34;
        }
LABEL_18:
        size_t v11 = &__format + v7;
        v11[1] = v10;
        v11[2] = 0;
        uint64_t v12 = v7 + 1;
        if (v6 + v7 + 2 <= v5 && ++v7 < 9) {
          continue;
        }
        v6 += v12 + 1;
        goto LABEL_36;
      }
      int v16 = v31[0];
      char v15 = v31[1];
      unsigned int v24 = v31[2]++;
      int v25 = *(_DWORD *)v24;
      if (v25 == -20) {
        int v26 = -13;
      }
      else {
        int v26 = v25;
      }
      uint64_t v18 = (char *)sasl_errstring(v26, 0, 0);
LABEL_32:
      unsigned int v23 = v18;
      int v21 = (uint64_t *)v15;
      uint64_t v22 = v16;
LABEL_34:
      if (_sasl_add_string(v21, v22, &v33, v23)) {
        return;
      }
LABEL_35:
      v6 += v7 + 2;
LABEL_36:
      if (v6 >= v5)
      {
        unint64_t v28 = v33 + 1;
        goto LABEL_41;
      }
    }
  }
  unint64_t v28 = 1;
LABEL_41:
  if (!_buf_alloc((uint64_t *)v31[1], v31[0], v28))
  {
    *(unsigned char *)(*v31[1] + v33) = 0;
    if ((v30 & 1) == 0 && !_sasl_getcallback(conn))
    {
      if (v32) {
        v32(v31[3], 2, *((void *)conn + 301));
      }
    }
  }
}

void _stringByApplyingIDNATranslationWithRange_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1BF11D000, a2, OS_LOG_TYPE_ERROR, "failed to allocate buffer of size %d for IDNA conversion", (uint8_t *)v2, 8u);
}

void ___stringByApplyingIDNATranslationWithRange_block_invoke_cold_1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BF11D000, log, OS_LOG_TYPE_ERROR, "failed to create UIDNA pointer, IDNA domain names will be broken: %s", buf, 0xCu);
}

void ECAssertNetworkActivityAllowed_cold_1()
{
}

void ECAssertNetworkActivityAllowed_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1BF11D000, log, OS_LOG_TYPE_FAULT, "Doing networking even though ECIsNetworkActivityAllowed = NO.", v1, 2u);
}

void parseEntity_cold_1()
{
  __assert_rtn("parseEntity", "NSString+ECHTMLEntityParser.m", 23, "cfEntity != nil");
}

uint64_t sub_1BF172130()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1BF172140()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1BF172150()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1BF172160()
{
  return MEMORY[0x1F4185E30]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1F40C94A8](*(void *)&op, *(void *)&alg, *(void *)&options, key, keyLength, iv, dataIn, dataInLength);
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C96F0](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9730](data, *(void *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1F40D70E8](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1F40D71B8](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1F40D71F0](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1F40D77E8](allocator, bytes, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1F40D83A0](*(void *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x1F40D83A8](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x1F40D83B8](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1F40D83C0](encoding);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1F40D8470](alloc, chars, numChars, contentsDeallocator);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

DNSServiceAttributeRef DNSServiceAttributeCreate(void)
{
  return (DNSServiceAttributeRef)MEMORY[0x1F40C97F0]();
}

void DNSServiceAttributeDeallocate(DNSServiceAttributeRef attr)
{
}

uint64_t DNSServiceAttributeSetResolverOverride()
{
  return MEMORY[0x1F40C9800]();
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1F40C9858](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecordWithAttribute(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t ifindex, const char *name, uint16_t rrtype, uint16_t rrclass, const DNSServiceAttribute *attr, DNSServiceQueryRecordReply callback, void *context)
{
  return MEMORY[0x1F40C9868](sdRef, *(void *)&flags, *(void *)&ifindex, name, rrtype, rrclass, attr, callback);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

uint64_t EFAtomicObjectLoad()
{
  return MEMORY[0x1F4117A20]();
}

uint64_t EFAtomicObjectRelease()
{
  return MEMORY[0x1F4117A28]();
}

uint64_t EFAtomicObjectSetIfNil()
{
  return MEMORY[0x1F4117A40]();
}

uint64_t EFIsSeedBuild()
{
  return MEMORY[0x1F4117AD0]();
}

uint64_t EFObjectsAreEqual()
{
  return MEMORY[0x1F4117B00]();
}

uint64_t EFStringWithInt()
{
  return MEMORY[0x1F4117B48]();
}

uint64_t EFStringWithInt64()
{
  return MEMORY[0x1F4117B50]();
}

uint64_t EFStringWithUnsignedInteger()
{
  return MEMORY[0x1F4117B60]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x1F40E72E0](range1.location, range1.length, range2.location, range2.length);
  result.unsigned int length = v3;
  result.NSUInteger location = v2;
  return result;
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1F40F6AB8](certificate, commonName);
}

uint64_t SecCertificateCopyRFC822Names()
{
  return MEMORY[0x1F40F6B38]();
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1F40F6B98]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1F40F6F08](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

SecPolicyRef SecPolicyCreateRevocation(CFOptionFlags revocationFlags)
{
  return (SecPolicyRef)MEMORY[0x1F40F7078](revocationFlags);
}

uint64_t SecPolicyGetOidString()
{
  return MEMORY[0x1F40F70B8]();
}

OSStatus SecTrustCopyPolicies(SecTrustRef trust, CFArrayRef *policies)
{
  return MEMORY[0x1F40F71C0](trust, policies);
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x1F40F71D8](trust);
}

uint64_t SecTrustDeserialize()
{
  return MEMORY[0x1F40F71E8]();
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1F40F7230](trust, result);
}

uint64_t SecTrustSerialize()
{
  return MEMORY[0x1F40F7250]();
}

OSStatus SecTrustSetAnchorCertificates(SecTrustRef trust, CFArrayRef anchorCertificates)
{
  return MEMORY[0x1F40F7258](trust, anchorCertificates);
}

OSStatus SecTrustSetNetworkFetchAllowed(SecTrustRef trust, Boolean allowFetch)
{
  return MEMORY[0x1F40F7278](trust, allowFetch);
}

OSStatus SecTrustSetPolicies(SecTrustRef trust, CFTypeRef policies)
{
  return MEMORY[0x1F40F7290](trust, policies);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _EFLocalizedString()
{
  return MEMORY[0x1F4117B90]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40C9C18](*(void *)&a1, a2);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40C9CA0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1F40C9CC0]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1F40C9CC8]();
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9D00](*(void *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1F4186388]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1F40CA4A8](a1);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x1F40CC340](*(void *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1F40CC348](a1, a2, a3, a4);
}

gid_t getegid(void)
{
  return MEMORY[0x1F40CC3A8]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CC3B0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

gid_t getgid(void)
{
  return MEMORY[0x1F40CC3D0]();
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1F40CC400](a1, a2);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1F40CC450](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

OM_uint32 gss_accept_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_cred_id_t acceptor_cred_handle, gss_buffer_t input_token, gss_channel_bindings_t input_chan_bindings, gss_name_t *src_name, gss_OID *mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec, gss_cred_id_t *delegated_cred_handle)
{
  return MEMORY[0x1F40E73D8](minor_status, context_handle, acceptor_cred_handle, input_token, input_chan_bindings, src_name, mech_type, output_token);
}

OM_uint32 gss_acquire_cred(OM_uint32 *minor_status, gss_name_t desired_name, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  return MEMORY[0x1F40E73E0](minor_status, desired_name, *(void *)&time_req, desired_mechs, *(void *)&cred_usage, output_cred_handle, actual_mechs, time_rec);
}

OM_uint32 gss_canonicalize_name(OM_uint32 *minor_status, gss_name_t input_name, gss_OID mech_type, gss_name_t *output_name)
{
  return MEMORY[0x1F40E73F0](minor_status, input_name, mech_type, output_name);
}

OM_uint32 gss_compare_name(OM_uint32 *minor_status, gss_name_t name1_arg, gss_name_t name2_arg, int *name_equal)
{
  return MEMORY[0x1F40E73F8](minor_status, name1_arg, name2_arg, name_equal);
}

OM_uint32 gss_delete_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, gss_buffer_t output_token)
{
  return MEMORY[0x1F40E7408](minor_status, context_handle, output_token);
}

OM_uint32 gss_display_name(OM_uint32 *minor_status, gss_name_t input_name, gss_buffer_t output_name_buffer, gss_OID *output_name_type)
{
  return MEMORY[0x1F40E7418](minor_status, input_name, output_name_buffer, output_name_type);
}

OM_uint32 gss_display_status(OM_uint32 *minor_status, OM_uint32 status_value, int status_type, gss_OID mech_type, OM_uint32 *message_content, gss_buffer_t status_string)
{
  return MEMORY[0x1F40E7420](minor_status, *(void *)&status_value, *(void *)&status_type, mech_type, message_content, status_string);
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x1F40E7430](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x1F40E7440](minor_status, initiator_cred_handle, context_handle, target_name, input_mech_type, *(void *)&req_flags, *(void *)&time_req, input_chan_bindings);
}

OM_uint32 gss_inquire_context(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_name_t *src_name, gss_name_t *targ_name, OM_uint32 *lifetime_rec, gss_OID *mech_type, OM_uint32 *ctx_flags, int *locally_initiated, int *xopen)
{
  return MEMORY[0x1F40E7448](minor_status, context_handle, src_name, targ_name, lifetime_rec, mech_type, ctx_flags, locally_initiated);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x1F40E7458](minor_status, buffer);
}

OM_uint32 gss_release_cred(OM_uint32 *minor_status, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x1F40E7470](minor_status, cred_handle);
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  return MEMORY[0x1F40E7480](minor_status, input_name);
}

OM_uint32 gss_unwrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer, int *conf_state, gss_qop_t *qop_state)
{
  return MEMORY[0x1F40E7488](minor_status, context_handle, input_message_buffer, output_message_buffer, conf_state, qop_state);
}

OM_uint32 gss_wrap(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, gss_buffer_t input_message_buffer, int *conf_state, gss_buffer_t output_message_buffer)
{
  return MEMORY[0x1F40E7490](minor_status, context_handle, *(void *)&conf_req_flag, *(void *)&qop_req, input_message_buffer, conf_state, output_message_buffer);
}

OM_uint32 gss_wrap_size_limit(OM_uint32 *minor_status, gss_ctx_id_t context_handle, int conf_req_flag, gss_qop_t qop_req, OM_uint32 req_output_size, OM_uint32 *max_input_size)
{
  return MEMORY[0x1F40E7498](minor_status, context_handle, *(void *)&conf_req_flag, *(void *)&qop_req, *(void *)&req_output_size, max_input_size);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return MEMORY[0x1F40CC668](a1, a2);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
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

uint64_t nw_activity_activate()
{
  return MEMORY[0x1F40F2870]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1F40F2878]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1F40F2898]();
}

uint64_t nw_connection_end_activity()
{
  return MEMORY[0x1F40F2B20]();
}

uint64_t nw_connection_start_activity()
{
  return MEMORY[0x1F40F2CB0]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1F40CDBA8](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1F40CDCB8](*(void *)&a1, a2, a3, *(void *)&a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0D0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE138](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE148](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE150](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CE168](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE170](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1A8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CE1D8](a1, a2, a3);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1E8](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CE1F8](__dst, __src, __n);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE218](__s1, __s2);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CE230](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CE250](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1F40CE298](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2A0](__str, __endptr, *(void *)&__base);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1F41865F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

void syslog(int a1, const char *a2, ...)
{
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

const char *__cdecl u_errorName(UErrorCode code)
{
  return (const char *)MEMORY[0x1F417F728](*(void *)&code);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1F4180068](*(void *)&options, pErrorCode);
}

int uname(utsname *a1)
{
  return MEMORY[0x1F40CE5C8](a1);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40CE938](*(void *)&a1, a2, *(void *)&a3);
}