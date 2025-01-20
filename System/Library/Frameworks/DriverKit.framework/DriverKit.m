uint64_t OSUnserializeXMLparse(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  unsigned __int8 *v11;
  int v12;
  int Tag;
  int v14;
  char *v15;
  unsigned char *v16;
  uint64_t v17;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint32_t v27;
  void *v28;
  void *v29;
  OSStringPtr v30;
  size_t v31;
  OSDataPtr v32;
  OSNumberPtr v33;
  OSBooleanPtr *v34;
  OSBooleanPtr v35;
  int v36;
  BOOL v37;
  OSObject *Object;
  OSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  OSStringPtr v43;
  OSDictionaryPtr v44;
  uint64_t **v45;
  uint64_t *v46;
  int v47;
  const OSMetaClassBase *v48;
  int v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v55;
  char *v56;
  unsigned char *String;
  BOOL v58;
  int v59;
  BOOL v60;
  unsigned char *v61;
  unsigned char *v62;
  char *v63;
  char *v64;
  void *CFEncodedData;
  uint64_t result;
  void *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  int v73;
  uint64_t v74;
  _OWORD v75[100];
  _WORD v76[200];
  char __str[1024];
  char aKey[2];
  unsigned char v79[6];
  void v80[7];

  v1 = MEMORY[0x270FA5388](a1);
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v80[4] = *MEMORY[0x263EF8340];
  v5 = (uint64_t *)v75;
  memset(v75, 0, 512);
  v76[0] = 0;
  v6 = -2;
  while (1)
  {
    if (((0xFEB5FFC3FEuLL >> v3) & 1) == 0)
    {
      v7 = yypact[v3];
      if (v6 != -2) {
        goto LABEL_34;
      }
      v74 = 0;
      while (1)
      {
        do
        {
          while (1)
          {
            v8 = *(_DWORD *)(v1 + 8);
            v9 = *(unsigned __int8 *)(*(void *)v1 + v8);
            v10 = v9 == 32 || v9 == 9;
            if (v10)
            {
              v11 = (unsigned __int8 *)(*(void *)v1 + v8 + 1);
              do
              {
                do
                {
                  *(_DWORD *)(v1 + 8) = ++v8;
                  v12 = *v11++;
                  v9 = v12;
                }
                while (v12 == 9);
              }
              while (v9 == 32);
              if (!v9)
              {
                v6 = 0;
                goto LABEL_34;
              }
            }
            if (v9 != 10) {
              break;
            }
            v19 = *(_DWORD *)(v1 + 12) + 1;
            *(_DWORD *)(v1 + 8) = v8 + 1;
            *(_DWORD *)(v1 + 12) = v19;
          }
          v6 = (char)v9;
          if (!(_BYTE)v9) {
            goto LABEL_34;
          }
          Tag = getTag(v1, (uint64_t)v80, (int *)&v74 + 1, (uint64_t)aKey, (uint64_t)__str);
        }
        while (Tag == 4);
        v14 = Tag;
        if (!Tag)
        {
          v6 = 0x10Bu;
          goto LABEL_34;
        }
        v71 = newObject(v1);
        *((_DWORD *)v71 + 20) = -1;
        v70 = HIDWORD(v74);
        if (SHIDWORD(v74) >= 1) {
          break;
        }
LABEL_25:
        if (SLOBYTE(v80[0]) != 112)
        {
          v6 = 267;
          v4 = v71;
          switch(LOBYTE(v80[0]))
          {
            case 'a':
              if (LODWORD(v80[0]) == 1634890337 && WORD2(v80[0]) == 121)
              {
                if (v14 == 3)
                {
                  v71[2] = 0;
                  v6 = 0x102u;
                }
                else if (v14 == 1)
                {
                  v6 = 40;
                }
                else
                {
                  v6 = 41;
                }
              }
              break;
            case 'b':
            case 'c':
            case 'e':
            case 'g':
            case 'h':
            case 'j':
              goto LABEL_34;
            case 'd':
              if (LODWORD(v80[0]) ^ 0x74636964 | BYTE4(v80[0]))
              {
                if (!(LODWORD(v80[0]) ^ 0x61746164 | BYTE4(v80[0])))
                {
                  v73 = 0;
                  if (v14 == 3)
                  {
                    v71[6] = 0;
                    *((_DWORD *)v71 + 10) = 0;
                    v6 = 0x104u;
                  }
                  else
                  {
                    if ((int)v70 < 1)
                    {
LABEL_193:
                      CFEncodedData = getCFEncodedData((uint64_t *)v1, &v73);
                    }
                    else
                    {
                      v63 = __str;
                      v64 = aKey;
                      while (strcmp(v64, "format") || strcmp(v63, "hex"))
                      {
                        v63 += 32;
                        v64 += 32;
                        if (!--v70) {
                          goto LABEL_193;
                        }
                      }
                      CFEncodedData = getHexData((uint64_t *)v1, &v73);
                    }
                    v71[6] = CFEncodedData;
                    *((_DWORD *)v71 + 10) = v73;
                    if (getTag(v1, (uint64_t)v80, (int *)&v74 + 1, (uint64_t)aKey, (uint64_t)__str) != 2) {
                      goto LABEL_198;
                    }
                    if (LODWORD(v80[0]) ^ 0x61746164 | BYTE4(v80[0])) {
                      v6 = 267;
                    }
                    else {
                      v6 = 260;
                    }
                  }
                }
              }
              else if (v14 == 3)
              {
                v71[2] = 0;
                v6 = 0x105u;
              }
              else if (v14 == 1)
              {
                v6 = 123;
              }
              else
              {
                v6 = 125;
              }
              break;
            case 'f':
              v55 = LODWORD(v80[0]) != 1936482662 || WORD2(v80[0]) != 101;
              if (v14 == 3 && !v55)
              {
                v71[9] = 0;
                goto LABEL_145;
              }
              break;
            case 'i':
              if (v80[0] == 0x72656765746E69)
              {
                *((_DWORD *)v71 + 10) = 64;
                if ((int)v70 >= 1)
                {
                  v69 = __str;
                  v56 = aKey;
                  do
                  {
                    if (!strcmp(v56, "size")) {
                      *((_DWORD *)v71 + 10) = strtoul(v69, 0, 0);
                    }
                    v56 += 32;
                    v10 = v70 == 1;
                    v69 += 32;
                    --v70;
                  }
                  while (!v10);
                }
                if (v14 == 3)
                {
                  v71[9] = 0;
                  v6 = 0x108u;
                }
                else
                {
                  v71[9] = getNumber((uint64_t *)v1);
                  if (getTag(v1, (uint64_t)v80, (int *)&v74 + 1, (uint64_t)aKey, (uint64_t)__str) == 2)
                  {
                    v58 = v80[0] == 0x72656765746E69;
                    v59 = 264;
                    goto LABEL_177;
                  }
LABEL_198:
                  v6 = 267;
                }
              }
              break;
            case 'k':
              if (v14 != 3 && LODWORD(v80[0]) == 7955819)
              {
                String = getString((uint64_t *)v1, &v74);
                v71[7] = String;
                if (String)
                {
                  *((_DWORD *)v71 + 16) = v74;
                  if (getTag(v1, (uint64_t)v80, (int *)&v74 + 1, (uint64_t)aKey, (uint64_t)__str) == 2)
                  {
                    v58 = LODWORD(v80[0]) == 7955819;
                    v59 = 263;
LABEL_177:
                    if (v58) {
                      v6 = v59;
                    }
                    else {
                      v6 = 267;
                    }
                  }
                }
              }
              break;
            default:
              if (SLOBYTE(v80[0]) == 115)
              {
                v60 = LODWORD(v80[0]) == 1769108595 && *(_DWORD *)((char *)v80 + 3) == 6778473;
                v4 = v71;
                if (v60)
                {
                  if (v14 == 3)
                  {
                    v61 = malloc_type_calloc(1uLL, 1uLL, 0xF5577342uLL);
                    v71[7] = v61;
                    *((_DWORD *)v71 + 16) = 1;
                    *v61 = 0;
                    v6 = 0x10Au;
                  }
                  else
                  {
                    v62 = getString((uint64_t *)v1, &v74);
                    v71[7] = v62;
                    if (v62)
                    {
                      *((_DWORD *)v71 + 16) = v74;
                      if (getTag(v1, (uint64_t)v80, (int *)&v74 + 1, (uint64_t)aKey, (uint64_t)__str) == 2)
                      {
                        if (LODWORD(v80[0]) ^ 0x69727473 | *(_DWORD *)((char *)v80 + 3) ^ 0x676E69) {
                          v6 = 267;
                        }
                        else {
                          v6 = 266;
                        }
                      }
                    }
                  }
                }
                else if (LODWORD(v80[0]) == 7628147)
                {
                  if (v14 == 1)
                  {
                    v6 = 0x5Bu;
                  }
                  else if (v14 == 3)
                  {
                    v71[2] = 0;
                    v6 = 0x109u;
                  }
                  else
                  {
                    v6 = 0x5Du;
                  }
                }
              }
              else
              {
                v4 = v71;
                if (SLOBYTE(v80[0]) == 116 && v14 == 3 && !(LODWORD(v80[0]) ^ 0x65757274 | BYTE4(v80[0])))
                {
                  v71[9] = 1;
LABEL_145:
                  v6 = 0x103u;
                }
              }
              break;
          }
          goto LABEL_34;
        }
        if (LODWORD(v80[0]) != 1936288880 || WORD2(v80[0]) != 116)
        {
          v6 = 267;
          v4 = v71;
          goto LABEL_34;
        }
        v4 = v71;
        *v71 = *(void *)(v1 + 24);
        *(void *)(v1 + 24) = v71;
      }
      v15 = __str;
      v17 = HIDWORD(v74);
      v16 = v79;
      while (1)
      {
        if (*(v16 - 2) != 73 || *(v16 - 1) != 68) {
          goto LABEL_24;
        }
        if (*v16) {
          break;
        }
        *((_DWORD *)v71 + 20) = strtol(v15, 0, 0);
LABEL_24:
        v15 += 32;
        v16 += 32;
        if (!--v17) {
          goto LABEL_25;
        }
      }
      if (*v16 == 82)
      {
        if (v16[1] == 69 && v16[2] == 70)
        {
          v6 = 267;
          if (v14 == 3 && !v16[3])
          {
            v4 = v71;
            *((_DWORD *)v71 + 20) = strtol(v15, 0, 0);
            v6 = 0x106u;
            goto LABEL_34;
          }
        }
        else
        {
          v6 = 267;
        }
        v4 = v71;
      }
      else
      {
        v6 = 267;
        v4 = v71;
      }
LABEL_34:
      if (v6 < 1)
      {
        v20 = 0;
        v6 = 0;
      }
      else
      {
        v20 = v6 > 0x10B ? 2 : yytranslate[v6];
      }
      v21 = (v20 + v7);
      if (v21 <= 0x6C && v20 == yycheck[v21]) {
        break;
      }
    }
    v22 = v3;
    if ((0x14A003C00uLL >> v3)) {
      goto LABEL_202;
    }
    v23 = yydefact[v3];
    v24 = yyr2[yydefact[v22]];
    v25 = v5[1 - v24];
    switch((int)v23)
    {
      case 2:
        v68 = "unexpected end of buffer";
        goto LABEL_204;
      case 3:
        result = 0;
        *(void *)(v1 + 48) = *(void *)(*v5 + 24);
        *(void *)(*v5 + 24) = 0;
        v67 = (void *)*v5;
        *v67 = *(void *)(v1 + 24);
        *(void *)(v1 + 24) = v67;
        return result;
      case 4:
        goto LABEL_202;
      case 5:
        v25 = *v5;
        v26 = *(void **)(*v5 + 16);
        if (v26)
        {
          v27 = 0;
          v28 = 0;
          do
          {
            v29 = v26;
            ++v27;
            v26 = (void *)*v26;
            *v29 = v28;
            v28 = v29;
          }
          while (v26);
        }
        else
        {
          v29 = 0;
          v27 = 0;
        }
        v72 = v4;
        *(void *)(v25 + 16) = v29;
        v44 = OSDictionary::withCapacity(v27);
        if ((*(_DWORD *)(v25 + 80) & 0x80000000) == 0)
        {
          snprintf(aKey, 0x10uLL, "%u", *(_DWORD *)(v25 + 80));
          OSDictionary::setObject(*(OSDictionary **)(v1 + 32), aKey, v44);
        }
        v45 = *(uint64_t ***)(v25 + 16);
        if (v45)
        {
          do
          {
            OSDictionary::setObject(v44, (const OSObject *)v45[4], (const OSMetaClassBase *)v45[3]);
            (*(void (**)(uint64_t *))(*v45[4] + 16))(v45[4]);
            (*(void (**)(uint64_t *))(*v45[3] + 16))(v45[3]);
            v45[3] = 0;
            v45[4] = 0;
            v46 = *v45;
            *v45 = *(uint64_t **)(v1 + 24);
            *(void *)(v1 + 24) = v45;
            v45 = (uint64_t **)v46;
          }
          while (v46);
        }
        *(void *)(v25 + 24) = v44;
        if (!v44)
        {
          v68 = "buildDictionary";
          goto LABEL_204;
        }
        v47 = *(_DWORD *)(v1 + 56);
        *(_DWORD *)(v1 + 56) = v47 + 1;
        v37 = v47 < 0x1FFFF;
        v4 = v72;
        goto LABEL_100;
      case 6:
        v25 = *v5;
        buildArray(v1, *v5);
        if (*(void *)(v25 + 24)) {
          goto LABEL_72;
        }
        v68 = "buildArray";
        goto LABEL_204;
      case 7:
        v25 = *v5;
        buildArray(v1, *v5);
        if (*(void *)(v25 + 24)) {
          goto LABEL_72;
        }
        v68 = "buildSet";
        goto LABEL_204;
      case 8:
        v25 = *v5;
        v30 = OSString::withCString(*(const char **)(*v5 + 56));
        if ((*(_DWORD *)(v25 + 80) & 0x80000000) == 0)
        {
          snprintf(aKey, 0x10uLL, "%u", *(_DWORD *)(v25 + 80));
          OSDictionary::setObject(*(OSDictionary **)(v1 + 32), aKey, v30);
        }
        free(*(void **)(v25 + 56));
        *(void *)(v25 + 56) = 0;
        *(void *)(v25 + 24) = v30;
        if (v30) {
          goto LABEL_99;
        }
        v68 = "buildString";
        goto LABEL_204;
      case 9:
        v25 = *v5;
        v31 = *(int *)(*v5 + 40);
        if (v31) {
          v32 = OSData::withBytes(*(const void **)(v25 + 48), v31);
        }
        else {
          v32 = OSData::withCapacity(0);
        }
        v48 = v32;
        if ((*(_DWORD *)(v25 + 80) & 0x80000000) == 0)
        {
          snprintf(aKey, 0x10uLL, "%u", *(_DWORD *)(v25 + 80));
          OSDictionary::setObject(*(OSDictionary **)(v1 + 32), aKey, v48);
        }
        if (*(_DWORD *)(v25 + 40)) {
          free(*(void **)(v25 + 48));
        }
        *(void *)(v25 + 48) = 0;
        *(void *)(v25 + 24) = v48;
        if (v48) {
          goto LABEL_99;
        }
        v68 = "buildData";
        goto LABEL_204;
      case 10:
        v25 = *v5;
        v33 = OSNumber::withNumber(*(void *)(*v5 + 72), *(int *)(*v5 + 40));
        if ((*(_DWORD *)(v25 + 80) & 0x80000000) == 0)
        {
          snprintf(aKey, 0x10uLL, "%u", *(_DWORD *)(v25 + 80));
          OSDictionary::setObject(*(OSDictionary **)(v1 + 32), aKey, v33);
        }
        *(void *)(v25 + 24) = v33;
        if (v33) {
          goto LABEL_99;
        }
        v68 = "buildNumber";
        goto LABEL_204;
      case 11:
        v25 = *v5;
        v34 = &kOSBooleanFalse;
        if (*(void *)(*v5 + 72)) {
          v34 = &kOSBooleanTrue;
        }
        v35 = *v34;
        *(void *)(v25 + 24) = *v34;
        ((void (*)(OSBooleanPtr))v35->retain)(v35);
        if (!*(void *)(v25 + 24))
        {
          v68 = "buildBoolean";
          goto LABEL_204;
        }
LABEL_72:
        v36 = *(_DWORD *)(v1 + 56);
        *(_DWORD *)(v1 + 56) = v36 + 1;
        v37 = v36 < 0x1FFFF;
LABEL_100:
        if (!v37)
        {
          v68 = "maximum object count";
LABEL_204:
          OSUnserializeerror((OSStringPtr)v1, v68);
          return 1;
        }
LABEL_102:
        v50 = &v5[-v24];
        v2 -= v24;
        v50[1] = v25;
        v5 = v50 + 1;
        v51 = yyr1[v23] - 19;
        v52 = ((__int16)v76[v2] + yypgoto[v51]);
        if (v52 <= 0x6C && (unsigned __int16)v76[v2] == (unsigned __int16)yycheck[v52]) {
          v3 = yytable[v52];
        }
        else {
          v3 = yydefgoto[v51];
        }
LABEL_106:
        v76[v2 + 1] = v3;
        v37 = v2++ <= 197;
        if (!v37)
        {
          OSUnserializeerror((OSStringPtr)v1, "memory exhausted");
          return 2;
        }
        break;
      case 12:
        snprintf(aKey, 0x10uLL, "%u", *(_DWORD *)(*v5 + 80));
        Object = OSDictionary::getObject(*(const OSDictionary **)(v1 + 32), aKey);
        if (!Object)
        {
          v68 = "forward reference detected";
          goto LABEL_204;
        }
        v39 = Object;
        v25 = (uint64_t)newObject(v1);
        *(void *)(v25 + 24) = v39;
        ++*(_DWORD *)(v1 + 60);
        ((void (*)(OSObject *))v39->retain)(v39);
        if (*(int *)(v1 + 60) >= 0x10000)
        {
          v68 = "maximum object reference count";
          goto LABEL_204;
        }
        v40 = (void *)*v5;
        *v40 = *(void *)(v1 + 24);
        *(void *)(v1 + 24) = v40;
LABEL_99:
        v49 = *(_DWORD *)(v1 + 56);
        *(_DWORD *)(v1 + 56) = v49 + 1;
        v37 = v49 < 0x1FFFF;
        goto LABEL_100;
      case 13:
      case 20:
      case 23:
        v25 = *(v5 - 1);
        *(void *)(v25 + 16) = 0;
        goto LABEL_102;
      case 14:
      case 21:
      case 24:
        v25 = *(v5 - 2);
        *(void *)(v25 + 16) = *(v5 - 1);
        goto LABEL_102;
      case 17:
        v41 = (void *)*(v5 - 1);
        v25 = *v5;
        *(void *)*v5 = v41;
        if (!v41) {
          goto LABEL_102;
        }
        while (v41[4] != *(void *)(v25 + 32))
        {
          v41 = (void *)*v41;
          if (!v41) {
            goto LABEL_102;
          }
        }
        v68 = "duplicate dictionary key";
        goto LABEL_204;
      case 18:
        v25 = *(v5 - 1);
        *(void *)(v25 + 32) = *(void *)(v25 + 24);
        *(void *)(v25 + 24) = *(void *)(*v5 + 24);
        *(void *)v25 = 0;
        *(void *)(*v5 + 24) = 0;
        v42 = (void *)*v5;
        *v42 = *(void *)(v1 + 24);
        *(void *)(v1 + 24) = v42;
        goto LABEL_102;
      case 19:
        v25 = *v5;
        v43 = OSString::withCString(*(const char **)(*v5 + 56));
        if ((*(_DWORD *)(v25 + 80) & 0x80000000) == 0)
        {
          snprintf(aKey, 0x10uLL, "%u", *(_DWORD *)(v25 + 80));
          OSDictionary::setObject(*(OSDictionary **)(v1 + 32), aKey, v43);
        }
        free(*(void **)(v25 + 56));
        *(void *)(v25 + 56) = 0;
        *(void *)(v25 + 24) = v43;
        goto LABEL_102;
      case 26:
        v25 = *v5;
        *(void *)*v5 = 0;
        goto LABEL_102;
      case 27:
        v25 = *v5;
        *(void *)*v5 = *(v5 - 1);
        goto LABEL_102;
      default:
        goto LABEL_102;
    }
  }
  v3 = yytable[v21];
  if (!yytable[v21])
  {
LABEL_202:
    v68 = "syntax error";
    goto LABEL_204;
  }
  if (v21 != 10)
  {
    if (v6) {
      v6 = -2;
    }
    else {
      v6 = 0;
    }
    v5[1] = (uint64_t)v4;
    ++v5;
    goto LABEL_106;
  }
  return 0;
}

OSStringPtr OSUnserializeerror(OSStringPtr result, const char *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (result->ivars)
  {
    OSStringPtr v2 = result;
    snprintf(__str, 0x80uLL, "OSUnserializeXML: %s near line %d\n", a2, result->reserved);
    result = OSString::withCString(__str);
    *(void *)v2->ivars = result;
  }
  return result;
}

uint64_t buildArray(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void **)(a2 + 16);
  if (v4)
  {
    uint32_t v5 = 0;
    v6 = 0;
    do
    {
      v7 = v4;
      ++v5;
      uint64_t v4 = (void *)*v4;
      void *v7 = v6;
      v6 = v7;
    }
    while (v4);
  }
  else
  {
    v7 = 0;
    uint32_t v5 = 0;
  }
  *(void *)(a2 + 16) = v7;
  OSArrayPtr v8 = OSArray::withCapacity(v5);
  if ((*(_DWORD *)(a2 + 80) & 0x80000000) == 0)
  {
    snprintf(__str, 0x10uLL, "%u", *(_DWORD *)(a2 + 80));
    OSDictionary::setObject(*(OSDictionary **)(a1 + 32), __str, v8);
  }
  v9 = *(uint64_t ***)(a2 + 16);
  if (v9)
  {
    do
    {
      OSArray::setObject(v8, (const OSMetaClassBase *)v9[3]);
      (*(void (**)(uint64_t *))(*v9[3] + 16))(v9[3]);
      v9[3] = 0;
      v10 = *v9;
      *v9 = *(uint64_t **)(a1 + 24);
      *(void *)(a1 + 24) = v9;
      v9 = (uint64_t **)v10;
    }
    while (v10);
  }
  *(void *)(a2 + 24) = v8;
  return a2;
}

uint64_t OSUnserializeXML(const char *a1, OSString **a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = malloc_type_calloc(1uLL, 0x40uLL, 0x10F0040FF80D6CBuLL);
  if (!v4) {
    return 0;
  }
  uint32_t v5 = v4;
  if (a2) {
    *a2 = 0;
  }
  *uint64_t v4 = a1;
  v4[1] = 0x100000000;
  v4[2] = 0;
  v4[3] = 0;
  v4[4] = OSDictionary::withCapacity(0x80u);
  v5[5] = a2;
  v5[6] = 0;
  v5[7] = 0;
  OSUnserializeXMLparse(v5);
  uint64_t v6 = v5[6];
  v7 = (void *)v5[2];
  if (v7)
  {
    do
    {
      uint64_t v8 = v7[3];
      if (v8) {
        (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
      }
      v9 = (void *)v7[6];
      if (v9) {
        free(v9);
      }
      uint64_t v10 = v7[4];
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
      }
      v11 = (void *)v7[7];
      if (v11) {
        free(v11);
      }
      v12 = (void *)v7[1];
      free(v7);
      v7 = v12;
    }
    while (v12);
  }
  (*(void (**)(void))(*(void *)v5[4] + 16))(v5[4]);
  free(v5);
  return v6;
}

uint64_t OSUnserializeXML(const char *a1, uint64_t a2, OSString **a3)
{
  if (a1 && !a1[a2 - 1]) {
    return OSUnserializeXML(a1, a3);
  }
  else {
    return 0;
  }
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  if (*(void *)&len)
  {
    unsigned int v3 = ~crc;
    do
    {
      char v4 = *buf++;
      unsigned int v3 = crc32_tab[(v4 ^ v3)] ^ (v3 >> 8);
      --*(void *)&len;
    }
    while (*(void *)&len);
    return ~v3;
  }
  return crc;
}

void IOLogBuffer(const char *title, const void *buffer, size_t size)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  IOLog("%s(0x%lx):\n", title, size);
  IOLog("              0     1     2     3     4     5     6     7     8     9     A     B     C     D     E     F\n");
  if (size >= 0x10000) {
    size_t v5 = 0x10000;
  }
  else {
    size_t v5 = size;
  }
  v12[16] = 0;
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    do
    {
      int v8 = *((char *)buffer + v7);
      snprintf(&v13[6 * (v7 & 0xF)], 7uLL, "0x%02x, ", *((unsigned __int8 *)buffer + v7));
      if (v8 <= 32) {
        char v9 = 32;
      }
      else {
        char v9 = v8;
      }
      v12[v7 & 0xF] = v9;
      uint64_t v10 = v7 + 1;
      uint64_t v11 = (v7 + 1) & 0xF;
      if (v5 - 1 == v7 || !v11)
      {
        if (v11) {
          v12[v11] = 0;
        }
        IOLog("/* %04lx: */ %-96s /* |%-16s| */\n", v6, v13, v12);
        v6 += 16;
      }
      ++v7;
    }
    while (v5 != v10);
  }
}

int IOLog(const char *format, ...)
{
  va_start(va, format);
  return IOLogv(format, va);
}

int IOLogv(const char *format, va_list ap)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = vsnprintf(__str, 0x400uLL, format, ap);
  if (qword_268C09308 != -1) {
    dispatch_once(&qword_268C09308, &__block_literal_global);
  }
  int v3 = _MergedGlobals;
  BOOL v4 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      int v8 = 136446210;
      char v9 = __str;
      size_t v5 = &_os_log_internal;
      uint64_t v6 = "%{public}s";
LABEL_8:
      _os_log_impl(&dword_23D392000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v4)
  {
    int v8 = 136315138;
    char v9 = __str;
    size_t v5 = &_os_log_internal;
    uint64_t v6 = "%s";
    goto LABEL_8;
  }
  return v2;
}

void *__cdecl IOMalloc(void *length)
{
  if (length) {
    return malloc_type_calloc(1uLL, (size_t)length, 0xF5577342uLL);
  }
  return length;
}

void *__cdecl IOMallocZero(size_t length)
{
  return malloc_type_calloc(1uLL, length, 0x8449F201uLL);
}

void *IOMallocZeroTyped(size_t size, malloc_type_id_t type_id)
{
  return malloc_type_calloc(1uLL, size, type_id);
}

void *IOMallocData(size_t a1)
{
  return malloc_type_malloc(a1, 0x100000000000000uLL);
}

void *IOMallocZeroData(size_t size)
{
  return malloc_type_calloc(1uLL, size, 0x100000000000000uLL);
}

void IOSleep(uint64_t ms)
{
}

void OSSynchronizeIO(void)
{
}

uint64_t IOLibInit()
{
  size_t v1 = 1024;
  if (sysctlbyname("kern.bootargs", &gBootArgs, &v1, 0, 0) < 0) {
    gBootArgs = 0;
  }
  PE_parse_boot_argn_internal("dk", (unsigned __int8 *)&gIODKDebug, 8, 0);
  IOLog("Boot args: %s\n", &gBootArgs);
  return IOLog("debug=0x%qx\n", gIODKDebug);
}

BOOL IOParseBootArgNumber(const char *arg_string, void *arg_ptr, int max_len)
{
  return PE_parse_boot_argn_internal(arg_string, (unsigned __int8 *)arg_ptr, max_len, 0);
}

uint64_t PE_parse_boot_argn_internal(const char *__s2, unsigned __int8 *a2, int a3, int a4)
{
  char v4 = 0;
  if (a3 == -1) {
    return v4 & 1;
  }
  unsigned int v5 = gBootArgs;
  if (!gBootArgs) {
    return v4 & 1;
  }
  int v8 = &gBootArgs;
  while (v5 == 9 || v5 == 32)
  {
    unsigned int v9 = *(unsigned __int8 *)++v8;
    unsigned int v5 = v9;
  }
  if (!v5)
  {
    char v4 = 0;
    return v4 & 1;
  }
  char v4 = 0;
  int v55 = a3 - 1;
  do
  {
    size_t v10 = 0;
    uint64_t v11 = (unsigned __int8 *)(v8 + 1);
    int v12 = v5;
    while (v12 > 31)
    {
      if (v12 == 32) {
        goto LABEL_18;
      }
      if (v12 == 61) {
        goto LABEL_19;
      }
LABEL_17:
      int v12 = v8[++v10];
      ++v11;
    }
    if (v12 && v12 != 9) {
      goto LABEL_17;
    }
LABEL_18:
    if (v5 != 45) {
      goto LABEL_108;
    }
LABEL_19:
    if (strncmp(v8, __s2, v10) || strlen(__s2) != v10) {
      goto LABEL_108;
    }
    int v13 = v12;
    if (v5 == 45)
    {
      if (a4) {
        return v4 & 1;
      }
      if (a3 >= 1)
      {
        char v4 = 1;
        argnumcpy(1, a2, a3);
        return v4 & 1;
      }
      goto LABEL_133;
    }
    while (v13 == 9 || v13 == 32)
    {
      int v13 = v8[++v10];
      ++v11;
    }
    if (v13)
    {
      BOOL v14 = v13 == 61;
      if (v12 != 61 && v13 == 61)
      {
        v8 += v10 + 1;
        goto LABEL_108;
      }
    }
    else
    {
      BOOL v14 = 0;
    }
    if (*__s2 == 95)
    {
      if (a3 >= 1)
      {
        uint64_t v50 = 0;
        if (a3 <= 17) {
          int v51 = 17;
        }
        else {
          int v51 = a3;
        }
        int v52 = v51 - 1;
        do
        {
          unsigned int v53 = v8[v50 + 1 + v10];
          if (v53 <= 0x20 && ((1 << v53) & 0x100000201) != 0) {
            break;
          }
          a2[v50++] = v53;
        }
        while (v52 != v50);
        a2[v50] = 0;
        char v4 = 1;
        return v4 & 1;
      }
LABEL_133:
      v4 |= a3 == 0;
      return v4 & 1;
    }
    if (v14 & a4) {
      goto LABEL_30;
    }
    if (!v14)
    {
      uint64_t v29 = 1;
LABEL_104:
      if (a3 >= 1)
      {
        argnumcpy(v29, a2, a3);
        char v4 = 1;
        goto LABEL_108;
      }
LABEL_106:
      v4 |= a3 == 0;
      goto LABEL_108;
    }
    int v21 = v8[v10 + 1];
    if (v21 == 45) {
      v22 = &v8[v10 + 2];
    }
    else {
      v22 = &v8[v10 + 1];
    }
    if (v21 == 45) {
      int v23 = -1;
    }
    else {
      int v23 = 1;
    }
    v24 = (char *)(v22 + 1);
    unint64_t v25 = *v22 - 48;
    if (*v22 != 48)
    {
      if (v25 > 9) {
        goto LABEL_30;
      }
      char v26 = 0;
      goto LABEL_53;
    }
    int v30 = *v24;
    uint64_t v31 = *v24;
    if ((v30 - 48) >= 8)
    {
      if (v30 == 98)
      {
        char v26 = 0;
        unint64_t v25 = 0;
        v24 = (char *)(v22 + 2);
        char v27 = 1;
        unint64_t v28 = 2;
      }
      else if (v30 == 120)
      {
        char v27 = 0;
        unint64_t v25 = 0;
        v24 = (char *)(v22 + 2);
        char v26 = 1;
        unint64_t v28 = 16;
      }
      else
      {
        BOOL v43 = v31 > 0x20;
        uint64_t v44 = (1 << v31) & 0x100000201;
        if (v43 || v44 == 0) {
          goto LABEL_30;
        }
        char v26 = 0;
        unint64_t v25 = 0;
LABEL_53:
        char v27 = 1;
        unint64_t v28 = 10;
      }
    }
    else
    {
      char v26 = 0;
      unint64_t v25 = v31 - 48;
      v24 = (char *)(v22 + 2);
      char v27 = 1;
      unint64_t v28 = 8;
    }
    v32 = (unsigned __int8 *)(v24 + 1);
    while (2)
    {
      unint64_t v33 = *(v32 - 1);
      if (v33 <= 0x20 && ((1 << v33) & 0x100000201) != 0) {
        goto LABEL_103;
      }
      if (v33 > 0x2F) {
        char v35 = v27;
      }
      else {
        char v35 = 0;
      }
      if (v28 + 47 >= v33) {
        char v36 = v35;
      }
      else {
        char v36 = 0;
      }
      unsigned __int8 v37 = v33 - 48;
      if ((v33 - 48) < 0xAu) {
        char v38 = v26;
      }
      else {
        char v38 = 0;
      }
      if (v36 & 1) != 0 || (v38)
      {
LABEL_83:
        if (v28 <= v37) {
          goto LABEL_30;
        }
        ++v32;
        unint64_t v25 = v37 + v25 * v28;
        continue;
      }
      break;
    }
    char v39 = v26 ^ 1;
    if ((v33 - 97) > 5u) {
      char v40 = 1;
    }
    else {
      char v40 = v26 ^ 1;
    }
    if ((v40 & 1) == 0)
    {
      unsigned __int8 v37 = v33 - 87;
      goto LABEL_83;
    }
    if ((v33 - 65) > 5u) {
      char v39 = 1;
    }
    if ((v39 & 1) == 0)
    {
      unsigned __int8 v37 = v33 - 55;
      goto LABEL_83;
    }
    int v41 = v33 & 0xFFFFFFDF;
    if ((v33 & 0xFFFFFFDF) == 0x47)
    {
      char v42 = 30;
    }
    else if (v41 == 75)
    {
      char v42 = 10;
    }
    else
    {
      if (v41 != 77) {
        goto LABEL_30;
      }
      char v42 = 20;
    }
    unsigned int v46 = *v32;
    if (v46 <= 0x20 && ((1 << v46) & 0x100000201) != 0)
    {
      v23 <<= v42;
LABEL_103:
      uint64_t v29 = v25 * v23;
      goto LABEL_104;
    }
LABEL_30:
    if (a3 < 1) {
      goto LABEL_106;
    }
    v15 = a2;
    if (v55)
    {
      int v16 = v55;
      v15 = a2;
      do
      {
        unsigned int v18 = *v11++;
        unsigned __int8 v17 = v18;
        uint64_t v19 = (1 << v18) & 0x100000201;
        if (v18 <= 0x20 && v19 != 0) {
          break;
        }
        *v15++ = v17;
        --v16;
      }
      while (v16);
    }
    unsigned __int8 *v15 = 0;
    char v4 = 1;
LABEL_108:
    while (1)
    {
      unsigned int v5 = *(unsigned __int8 *)v8;
      if (v5 <= 0x20 && ((1 << v5) & 0x100000201) != 0) {
        break;
      }
      ++v8;
    }
    while (v5 == 9 || v5 == 32)
    {
      unsigned int v48 = *(unsigned __int8 *)++v8;
      unsigned int v5 = v48;
    }
  }
  while (v5);
  return v4 & 1;
}

BOOL IOParseBootArgString(const char *arg_string, char *arg_ptr, int strlen)
{
  return PE_parse_boot_argn_internal(arg_string, (unsigned __int8 *)arg_ptr, strlen, 1);
}

void OSReportWithBacktrace(const char *str, ...)
{
  va_start(va, str);
  uint64_t v11 = *MEMORY[0x263EF8340];
  va_list v8 = 0;
  __uint64_t v5 = 0;
  pthread_threadid_np(0, &v5);
  size_t v7 = 32;
  if (sysctlbyname("kern.backtrace.user", v9, &v7, 0, 0))
  {
    size_t v7 = 0;
  }
  else if (v7 >= 0x21)
  {
    size_t v7 = 32;
  }
  va_copy(v8, va);
  vsnprintf(__str, 0x80uLL, str, va);
  IOLog("%sbacktrace:\n", __str);
  if (v7 >= 3)
  {
    for (size_t i = 2; i < v7; ++i)
    {
      int v3 = dladdr((const void *)v9[i], &v6);
      dli_sname = v6.dli_sname;
      if (!v6.dli_sname) {
        dli_sname = v6.dli_fname;
      }
      if (!v3) {
        dli_sname = 0;
      }
      if (!dli_sname) {
        dli_sname = "???";
      }
      IOLog("[%#qx] 0x%016qx: %s\n", v5, v9[i], dli_sname);
    }
  }
}

uint64_t nanoseconds_to_absolutetime(unint64_t a1, unint64_t *a2)
{
  if (!a2) {
    nanoseconds_to_absolutetime_cold_1();
  }
  uint64_t result = mach_timebase_info(&info);
  if (result) {
    nanoseconds_to_absolutetime_cold_2();
  }
  if (0xFFFFFFFFFFFFFFFFLL / info.denom <= a1)
  {
    unint64_t v6 = a1 / info.numer;
    if (is_mul_ok(v6, info.denom)) {
      unint64_t v5 = v6 * info.denom;
    }
    else {
      unint64_t v5 = -1;
    }
  }
  else
  {
    unint64_t v5 = info.denom * a1 / info.numer;
  }
  *a2 = v5;
  return result;
}

uint64_t absolutetime_to_nanoseconds(unint64_t a1, unint64_t *a2)
{
  if (!a2) {
    absolutetime_to_nanoseconds_cold_1();
  }
  uint64_t result = mach_timebase_info(&info);
  if (result) {
    absolutetime_to_nanoseconds_cold_2();
  }
  if (0xFFFFFFFFFFFFFFFFLL / info.numer <= a1)
  {
    unint64_t v6 = a1 / info.denom;
    if (is_mul_ok(v6, info.numer)) {
      unint64_t v5 = v6 * info.numer;
    }
    else {
      unint64_t v5 = -1;
    }
  }
  else
  {
    unint64_t v5 = info.numer * a1 / info.denom;
  }
  *a2 = v5;
  return result;
}

uint64_t clock_get_calendar_nanotime(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = clock_gettime(_CLOCK_REALTIME, &v6);
  if (result) {
    clock_get_calendar_nanotime_cold_1();
  }
  int tv_nsec = v6.tv_nsec;
  *a1 = v6.tv_sec;
  *a2 = tv_nsec;
  return result;
}

uint64_t clock_get_calendar_microtime(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = clock_gettime(_CLOCK_REALTIME, &v6);
  if (result) {
    clock_get_calendar_microtime_cold_1();
  }
  unint64_t tv_nsec = v6.tv_nsec;
  *a1 = v6.tv_sec;
  *a2 = tv_nsec / 0x3E8;
  return result;
}

uint64_t clock_get_system_nanotime(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = clock_gettime(_CLOCK_MONOTONIC, &v6);
  if (result) {
    clock_get_system_nanotime_cold_1();
  }
  int tv_nsec = v6.tv_nsec;
  *a1 = v6.tv_sec;
  *a2 = tv_nsec;
  return result;
}

uint64_t clock_interval_to_deadline(unsigned int a1, unsigned int a2, uint64_t *a3)
{
  unint64_t v6 = 0;
  nanoseconds_to_absolutetime(a2 * (unint64_t)a1, &v6);
  uint64_t result = mach_absolute_time();
  uint64_t v5 = result + v6;
  if (__CFADD__(result, v6)) {
    uint64_t v5 = -1;
  }
  *a3 = v5;
  return result;
}

unint64_t continuoustime_to_absolutetime(unint64_t a1)
{
  if (a1 >= MEMORY[0xFFFFFC098]) {
    return a1 - MEMORY[0xFFFFFC098];
  }
  else {
    return 0;
  }
}

uint64_t absolutetime_to_continuoustime(uint64_t a1)
{
  return MEMORY[0xFFFFFC098] + a1;
}

uint32_t PE_i_can_has_debugger(uint32_t *a1)
{
  int v1 = MEMORY[0xFFFFF4084];
  if (a1 && MEMORY[0xFFFFF4084]) {
    PE_parse_boot_argn_internal("debug", (unsigned __int8 *)a1, 4, 0);
  }
  return v1 != 0;
}

uint64_t getTag(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = 0;
  uint64_t v6 = *(void *)a1;
  int v7 = *(unsigned __int8 *)(*(void *)a1 + *(int *)(a1 + 8));
  *a3 = 0;
  if (v7 != 60) {
    return v5;
  }
  uint64_t v8 = *(int *)(a1 + 8);
  LODWORD(v9) = v8 + 1;
  *(_DWORD *)(a1 + 8) = v8 + 1;
  LODWORD(v10) = *(unsigned __int8 *)(v6 + v8 + 1);
  switch(v10)
  {
    case '!':
      *(_DWORD *)(a1 + 8) = v8 + 2;
      int v13 = *(char *)(v6 + v8 + 2);
      if (v13 == 45)
      {
        LODWORD(v14) = v8 + 3;
        *(_DWORD *)(a1 + 8) = v8 + 3;
        int v15 = *(char *)(v6 + v8 + 3);
        char v16 = v15 == 45;
        if (v15) {
          int v13 = v15;
        }
        else {
          int v13 = 0;
        }
        if (!v15) {
          char v16 = 0;
        }
      }
      else
      {
        LODWORD(v14) = v8 + 2;
        char v16 = 0;
      }
      uint64_t v5 = 0;
      char v23 = ((v13 - 91) < 0xFFFFFFE6) & ~v16;
      if ((v13 - 123) >= 0xFFFFFFE6) {
        char v23 = 0;
      }
      if ((v23 & 1) != 0 || !v13) {
        return v5;
      }
      while (1)
      {
        uint64_t v24 = (int)v14;
        uint64_t v14 = (int)v14 + 1;
        *(_DWORD *)(a1 + 8) = v14;
        uint64_t v5 = *(unsigned __int8 *)(v6 + v14);
        if (v5 == 10) {
          break;
        }
        if (!*(unsigned char *)(v6 + v14)) {
          return v5;
        }
        if (v16)
        {
          if (v5 != 45) {
            goto LABEL_44;
          }
          LODWORD(v14) = v24 + 2;
          *(_DWORD *)(a1 + 8) = v24 + 2;
          uint64_t v5 = *(char *)(v6 + v24 + 2);
          if (v5 == 45)
          {
            LODWORD(v14) = v24 + 3;
            *(_DWORD *)(a1 + 8) = v24 + 3;
            LODWORD(v5) = *(unsigned __int8 *)(v6 + v24 + 3);
            goto LABEL_41;
          }
LABEL_45:
          if (!v5) {
            return v5;
          }
        }
        else
        {
LABEL_41:
          if (v5 == 62)
          {
            int v12 = v14 + 1;
LABEL_84:
            uint64_t v5 = 4;
            goto LABEL_85;
          }
LABEL_48:
          if (v5) {
            char v25 = v16;
          }
          else {
            char v25 = 1;
          }
          if (v25) {
            return 0;
          }
        }
      }
      ++*(_DWORD *)(a1 + 12);
      if ((v16 & 1) == 0)
      {
        LODWORD(v5) = 10;
        goto LABEL_48;
      }
LABEL_44:
      uint64_t v5 = 1;
      goto LABEL_45;
    case '/':
      uint64_t v17 = v8 + 2;
      *(_DWORD *)(a1 + 8) = v17;
      LOBYTE(v10) = *(unsigned char *)(v6 + v17);
      uint64_t v18 = 2;
      break;
    case '?':
      while (1)
      {
        while (1)
        {
          while (1)
          {
            uint64_t v11 = (int)v9;
            uint64_t v9 = (int)v9 + 1;
            *(_DWORD *)(a1 + 8) = v9;
            uint64_t v5 = *(unsigned __int8 *)(v6 + v9);
            if (v5 != 10) {
              break;
            }
            ++*(_DWORD *)(a1 + 12);
          }
          if (v5 == 63) {
            break;
          }
          if (!*(unsigned char *)(v6 + v9)) {
            return v5;
          }
        }
        LODWORD(v9) = v11 + 2;
        *(_DWORD *)(a1 + 8) = v11 + 2;
        if (!*(unsigned char *)(v6 + v11 + 2)) {
          return 4;
        }
        if (*(unsigned char *)(v6 + v11 + 2) == 62)
        {
          int v12 = v11 + 3;
          goto LABEL_84;
        }
      }
    default:
      uint64_t v18 = 1;
      break;
  }
  if (((v10 & 0xDF) - 65) > 0x19u) {
    return 0;
  }
  uint64_t v19 = 0;
  while (((v10 & 0xDF) - 65) < 0x1Au
       || v10 == 45
       || (v10 - 48) <= 9u)
  {
    *(unsigned char *)(a2 + v19) = v10;
    uint64_t v20 = v19 + 1;
    uint64_t v21 = *(void *)a1;
    uint64_t v10 = *(int *)(a1 + 8) + 1;
    *(_DWORD *)(a1 + 8) = v10;
    LOBYTE(v10) = *(unsigned char *)(v21 + v10);
    uint64_t v19 = v20;
    if (v20 == 31) {
      return 0;
    }
  }
  *(unsigned char *)(a2 + v19) = 0;
  do
  {
    if (v10 == 47)
    {
      uint64_t v46 = *(void *)a1;
      uint64_t v47 = *(int *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v47;
      if (*(unsigned char *)(v46 + v47) == 62)
      {
        uint64_t v18 = 3;
LABEL_89:
        int v12 = v47 + 1;
        uint64_t v5 = v18;
LABEL_85:
        *(_DWORD *)(a1 + 8) = v12;
        return v5;
      }
      return 0;
    }
    if (v10 == 62)
    {
      LODWORD(v47) = *(_DWORD *)(a1 + 8);
      goto LABEL_89;
    }
    while (1)
    {
      if (v10 != 9)
      {
        int v26 = (char)v10;
        if ((char)v10 != 32) {
          break;
        }
      }
      uint64_t v27 = *(void *)a1;
      uint64_t v10 = *(int *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v10;
      LOBYTE(v10) = *(unsigned char *)(v27 + v10);
    }
    uint64_t v28 = 0;
    while (1)
    {
      if ((v26 & 0xFFFFFFDF) - 65 <= 0x19)
      {
        int v29 = *a3;
        goto LABEL_64;
      }
      int v29 = *a3;
      if (v26 != 45 && (v26 - 48) > 9) {
        break;
      }
LABEL_64:
      *(unsigned char *)(a4 + 32 * v29 + v28) = v26;
      if (v28 == 30) {
        return 0;
      }
      ++v28;
      uint64_t v30 = *(void *)a1;
      uint64_t v31 = *(int *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v31;
      int v26 = *(char *)(v30 + v31);
    }
    *(unsigned char *)(a4 + 32 * v29 + v28) = 0;
    while (v26 == 9 || v26 == 32)
    {
      uint64_t v32 = *(void *)a1;
      uint64_t v33 = *(int *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v33;
      int v26 = *(char *)(v32 + v33);
    }
    if (v26 != 61) {
      return 0;
    }
    uint64_t v34 = *(void *)a1;
    uint64_t v35 = *(int *)(a1 + 8);
    int v36 = v35 + 2;
    unsigned __int8 v37 = (unsigned __int8 *)(*(void *)a1 + v35 + 1);
    while (1)
    {
      *(_DWORD *)(a1 + 8) = v36 - 1;
      int v39 = *v37++;
      int v38 = v39;
      if (v39 != 9 && v38 != 32) {
        break;
      }
      ++v36;
    }
    if (v38 != 34) {
      return 0;
    }
    uint64_t v40 = 0;
    *(_DWORD *)(a1 + 8) = v36;
    int v41 = *(unsigned __int8 *)(v34 + v36);
    while (1)
    {
      uint64_t v42 = *a3;
      if (v41 == 34) {
        break;
      }
      *(unsigned char *)(a5 + 32 * v42 + v40) = v41;
      if (v40 == 30) {
        return 0;
      }
      uint64_t v5 = 0;
      ++v40;
      uint64_t v43 = *(void *)a1;
      uint64_t v44 = *(int *)(a1 + 8) + 1;
      *(_DWORD *)(a1 + 8) = v44;
      int v41 = *(unsigned __int8 *)(v43 + v44);
      if (!v41) {
        return v5;
      }
    }
    uint64_t v5 = 0;
    *(unsigned char *)(a5 + 32 * v42 + v40) = 0;
    uint64_t v10 = *(void *)a1;
    uint64_t v45 = *(int *)(a1 + 8) + 1;
    *(_DWORD *)(a1 + 8) = v45;
    LOBYTE(v10) = *(unsigned char *)(v10 + v45);
    LODWORD(v45) = (*a3)++;
  }
  while ((int)v45 <= 30);
  return v5;
}

void *newObject(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 24);
  if (result)
  {
    *(void *)(a1 + 24) = *result;
  }
  else
  {
    uint64_t result = malloc_type_calloc(1uLL, 0x58uLL, 0x10B00400181E628uLL);
    result[1] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = result;
  }
  return result;
}

unsigned char *getHexData(uint64_t *a1, _DWORD *a2)
{
  int64_t v4 = 4096;
  uint64_t v5 = malloc_type_calloc(1uLL, 0x1000uLL, 0xF5577342uLL);
  uint64_t v6 = *a1;
  uint64_t v7 = *((int *)a1 + 2);
  uint64_t v8 = (unsigned __int8 *)(*a1 + v7);
  uint64_t v9 = v5;
  while (1)
  {
    int v10 = *v8;
    if (v10 != 9 && v10 != 32)
    {
      if (v10 == 60)
      {
        *a2 = v5 - v9;
        return v9;
      }
      goto LABEL_10;
    }
    uint64_t v11 = (unsigned __int8 *)(v6 + 1 + (int)v7);
    do
    {
      do
      {
        LODWORD(v7) = v7 + 1;
        *((_DWORD *)a1 + 2) = v7;
        int v12 = *v11++;
        int v10 = v12;
      }
      while (v12 == 9);
    }
    while (v10 == 32);
    if (!v10) {
      break;
    }
LABEL_10:
    if (v10 == 10)
    {
      int v13 = *((_DWORD *)a1 + 3) + 1;
      LODWORD(v7) = v7 + 1;
      *((_DWORD *)a1 + 2) = v7;
      *((_DWORD *)a1 + 3) = v13;
      uint64_t v8 = (unsigned __int8 *)(v6 + (int)v7);
    }
    else
    {
      if (((char)v10 - 48) > 9)
      {
        if (((char)v10 - 97) > 5) {
          break;
        }
        char v14 = 16 * v10 - 112;
      }
      else
      {
        char v14 = 16 * v10;
      }
      *uint64_t v5 = v14;
      uint64_t v15 = *a1;
      uint64_t v16 = *((int *)a1 + 2) + 1;
      *((_DWORD *)a1 + 2) = v16;
      int v17 = *(unsigned __int8 *)(v15 + v16);
      char v18 = v17 - 48;
      if ((v17 - 48) >= 0xA)
      {
        if ((v17 - 97) > 5) {
          break;
        }
        char v18 = v17 - 87;
      }
      *v5++ |= v18;
      if (v5 - v9 >= (unint64_t)v4)
      {
        if (v5 - v9 != v4) {
          getHexData();
        }
        if (v9)
        {
          if (v4)
          {
            uint64_t v19 = (char *)malloc_type_realloc(v9, 2 * v4, 0xFA8E840uLL);
            uint64_t v9 = v19;
            if (v4 >= 1)
            {
              if (v19) {
                bzero(&v19[v4], v4);
              }
            }
          }
        }
        else if (2 * v4)
        {
          uint64_t v9 = malloc_type_calloc(1uLL, 2 * v4, 0xF5577342uLL);
        }
        else
        {
          uint64_t v9 = 0;
        }
        uint64_t v5 = &v9[v4];
        v4 *= 2;
      }
      uint64_t v6 = *a1;
      uint64_t v7 = *((int *)a1 + 2) + 1;
      *((_DWORD *)a1 + 2) = v7;
      uint64_t v8 = (unsigned __int8 *)(v6 + v7);
    }
  }
  *a2 = 0;
  free(v9);
  return 0;
}

void *getCFEncodedData(uint64_t *a1, _DWORD *a2)
{
  int64_t v4 = malloc_type_calloc(1uLL, 0x1000uLL, 0xF5577342uLL);
  uint64_t v5 = *a1;
  int v6 = *(unsigned __int8 *)(*a1 + *((int *)a1 + 2));
  *a2 = 0;
  if (v6 == 60) {
    goto LABEL_34;
  }
  int v7 = 0;
  int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int64_t v11 = 4096;
  do
  {
    uint64_t v12 = v6 & 0x7F;
    switch(v12)
    {
      case 0xA:
        int v10 = 0;
        ++*((_DWORD *)a1 + 3);
        break;
      case 0x3D:
        ++v10;
        break;
      case 0:
        goto LABEL_34;
      default:
        int v10 = 0;
        break;
    }
    int v13 = __CFPLDataDecodeTable[v12];
    if (v13 < 0)
    {
      uint64_t v14 = *((int *)a1 + 2) + 1;
      *((_DWORD *)a1 + 2) = v14;
      int v6 = *(unsigned __int8 *)(v5 + v14);
    }
    else
    {
      ++v9;
      int v8 = v13 + (v8 << 6);
      if ((v9 & 3) != 0)
      {
        uint64_t v15 = v11;
      }
      else
      {
        uint64_t v16 = v7;
        unint64_t v17 = v7 + 2;
        if (v11 <= v17)
        {
          uint64_t v15 = 2 * v11;
          if (v4)
          {
            if (v11)
            {
              char v18 = (char *)malloc_type_realloc(v4, 2 * v11, 0xFA8E840uLL);
              int64_t v4 = v18;
              if (v11 >= 1 && v18) {
                bzero(&v18[v11], v11);
              }
              uint64_t v16 = v7;
              unint64_t v17 = v7 + 2;
            }
            else
            {
              uint64_t v15 = 0;
            }
          }
          else if (v15)
          {
            uint64_t v19 = malloc_type_calloc(1uLL, 2 * v11, 0xF5577342uLL);
            uint64_t v16 = v7;
            unint64_t v17 = v7 + 2;
            int64_t v4 = v19;
          }
          else
          {
            int64_t v4 = 0;
          }
        }
        else
        {
          uint64_t v15 = v11;
        }
        *((unsigned char *)v4 + v16) = BYTE2(v8);
        if (v10 > 1)
        {
          int v7 = v16 + 1;
        }
        else
        {
          *((unsigned char *)v4 + v16 + 1) = BYTE1(v8);
          if (v10 == 1)
          {
            int v7 = v17;
          }
          else
          {
            v7 += 3;
            *((unsigned char *)v4 + v17) = v8;
          }
        }
      }
      uint64_t v5 = *a1;
      uint64_t v20 = *((int *)a1 + 2) + 1;
      *((_DWORD *)a1 + 2) = v20;
      int v6 = *(unsigned __int8 *)(v5 + v20);
      int64_t v11 = v15;
    }
  }
  while (v6 != 60);
  *a2 = v7;
  if (!v7)
  {
LABEL_34:
    free(v4);
    return 0;
  }
  return v4;
}

uint64_t getNumber(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = *((_DWORD *)a1 + 2);
  int v3 = *(unsigned __int8 *)(*a1 + v2);
  if (v3 != 48)
  {
    LODWORD(v4) = *((_DWORD *)a1 + 2);
    goto LABEL_18;
  }
  uint64_t v4 = v2 + 1;
  *((_DWORD *)a1 + 2) = v4;
  int v3 = *(unsigned __int8 *)(v1 + v4);
  if (v3 != 120)
  {
LABEL_18:
    if (v3 == 45)
    {
      uint64_t v4 = (int)v4 + 1;
      *((_DWORD *)a1 + 2) = v4;
      char v16 = *(unsigned char *)(v1 + v4);
    }
    else
    {
      char v16 = v3;
    }
    unsigned int v17 = v16;
    if ((v16 - 48) > 9)
    {
      uint64_t v18 = 0;
    }
    else
    {
      uint64_t v18 = 0;
      uint64_t v19 = (char *)(v1 + (int)v4 + 1);
      int v20 = v4 + 1;
      do
      {
        uint64_t v18 = 10 * v18 + v17 - 48;
        *((_DWORD *)a1 + 2) = v20;
        unsigned int v21 = *v19++;
        unsigned int v17 = v21;
        ++v20;
      }
      while (v21 - 48 < 0xA);
    }
    if (v3 == 45) {
      return -v18;
    }
    else {
      return v18;
    }
  }
  uint64_t v5 = v2 + 2;
  *((_DWORD *)a1 + 2) = v2 + 2;
  unsigned int v6 = *(char *)(v1 + v5);
  BOOL v7 = v6 - 48 < 0xA;
  uint64_t v8 = 0;
  if (v6 - 48 < 0xA || v6 - 97 <= 5)
  {
    int v10 = v2 + 3;
    int64_t v11 = (char *)(v5 + v1 + 1);
    do
    {
      if (v7) {
        uint64_t v12 = -48;
      }
      else {
        uint64_t v12 = -87;
      }
      uint64_t v8 = v12 + 16 * v8 + v6;
      *((_DWORD *)a1 + 2) = v10;
      unsigned int v13 = *v11++;
      unsigned int v6 = v13;
      unsigned int v14 = v13 - 97;
      BOOL v7 = v13 - 48 < 0xA;
      ++v10;
    }
    while (v13 - 48 < 0xA || v14 < 6);
  }
  return v8;
}

unsigned char *getString(uint64_t *a1, _DWORD *a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = *((int *)a1 + 2);
  uint64_t v6 = *a1 + v5;
  while (1)
  {
    int v7 = *(unsigned __int8 *)(v6 + v4);
    if (v7 == 10)
    {
      ++*((_DWORD *)a1 + 3);
      goto LABEL_7;
    }
    if (!*(unsigned char *)(v6 + v4)) {
      return 0;
    }
    if (v7 == 60) {
      break;
    }
LABEL_7:
    *((_DWORD *)a1 + 2) = v5 + 1 + v4++;
  }
  if (v4 == -1 || (uint64_t result = malloc_type_calloc(1uLL, (int)v4 + 1, 0xF5577342uLL)) == 0)
  {
    puts("OSUnserializeXML: can't alloc temp memory");
    return 0;
  }
  if (a2) {
    *a2 = v4 + 1;
  }
  if ((int)v4 >= 1)
  {
    uint64_t v9 = 0;
    LODWORD(v10) = 0;
    int v11 = v5 + 3;
    uint64_t v12 = result;
    while (1)
    {
      uint64_t v13 = *a1;
      uint64_t v14 = (int)v10;
      uint64_t v15 = (int)v10 + 1;
      int v16 = *(unsigned __int8 *)(*a1 + v5 + (int)v10);
      if (v16 == 38)
      {
        uint64_t v10 = (int)v10 + 4;
        if ((int)v14 + 4 > (int)v4) {
          goto LABEL_35;
        }
        uint64_t v17 = v14 + 2;
        int v18 = *(unsigned __int8 *)(v13 + v15 + v5);
        if (v18 == 103)
        {
          if (*(unsigned char *)(v13 + v5 + (int)v17) != 116 || *(unsigned char *)(v13 + v11 + (int)v14) != 59)
          {
LABEL_35:
            free(result);
            if (a2)
            {
              uint64_t result = 0;
              *a2 = 0;
              return result;
            }
            return 0;
          }
          LOBYTE(v16) = 62;
        }
        else if (v18 == 108)
        {
          if (*(unsigned char *)(v13 + v17 + v5) != 116 || *(unsigned char *)(v13 + v11 + (int)v14) != 59) {
            goto LABEL_35;
          }
          LOBYTE(v16) = 60;
        }
        else
        {
          if ((int)v14 + 5 > (int)v4
            || v18 != 97
            || *(unsigned char *)(v13 + v5 + (int)v17) != 109
            || *(unsigned char *)(v13 + v11 + (int)v14) != 112
            || *(unsigned char *)(v13 + v10 + v5) != 59)
          {
            goto LABEL_35;
          }
          LOBYTE(v16) = 38;
          LODWORD(v10) = v14 + 5;
        }
      }
      else
      {
        LODWORD(v10) = v10 + 1;
      }
      *v12++ = v16;
      v9 += 0x100000000;
      if ((int)v10 >= (int)v4)
      {
        uint64_t v19 = v9 >> 32;
        goto LABEL_38;
      }
    }
  }
  uint64_t v19 = 0;
LABEL_38:
  result[v19] = 0;
  return result;
}

uint64_t ___ZL18isFirstPartyDriverv_block_invoke()
{
  getpid();
  uint64_t result = csops();
  _MergedGlobals = 0;
  return result;
}

uint64_t argnumcpy(uint64_t result, unsigned __int8 *a2, int a3)
{
  switch(a3)
  {
    case 1:
      *a2 = result;
      break;
    case 2:
      *(_WORD *)a2 = result;
      break;
    case 3:
      uint64_t result = result & 0xFFFFFF | (a2[3] << 24);
      goto LABEL_5;
    case 8:
      *(void *)a2 = result;
      break;
    default:
LABEL_5:
      *(_DWORD *)a2 = result;
      break;
  }
  return result;
}

void _GLOBAL__sub_I_IOLib_cpp()
{
  IOVMPageSize = *MEMORY[0x263EF8AF8];
}

OSMetaClassBase *OSMetaClassBase::Private(OSMetaClassBase *this)
{
  return this - 1;
}

__int32 *OSMetaClassBase::RemotePrivate(OSMetaClassBase *this)
{
  if ((uint64_t)this[-1].meta) {
    return &this[-4].refcount;
  }
  else {
    return 0;
  }
}

const OSMetaClass *__cdecl OSMetaClassBase::GetClass(OSMetaClassBase *this)
{
  return this->meta;
}

const char *__cdecl OSMetaClassBase::GetClassName(OSMetaClassBase *this)
{
  return (const char *)(**(void **)this->meta->metaClassPrivate + 4);
}

const char *__cdecl OSMetaClassBase::GetClassName(const OSMetaClassBase *this)
{
  return (const char *)(**(void **)this->meta->metaClassPrivate + 4);
}

BOOL OSMetaClassBase::IsRemote(OSMetaClassBase *this)
{
  return this[-1].reserved & 1;
}

_DWORD *OSCopyInStringArray(const char *a1, unsigned int a2)
{
  if (a2 < 2) {
    return 0;
  }
  size_t v4 = a2;
  size_t v5 = a2 + 8;
  uint64_t v6 = IOMallocTyped(v5, 0x2531DB39uLL);
  _DWORD *v6 = a2;
  int v7 = (char *)(v6 + 2);
  memmove(v6 + 2, a1, v4);
  v6[1] = 0;
  char v8 = *((unsigned char *)v6 + 8);
  if (v8)
  {
    uint64_t v9 = &v7[a2];
    for (int i = 1; ; ++i)
    {
      v7 += v8 + 1;
      if (v7 >= v9) {
        break;
      }
      v6[1] = i;
      char v8 = *v7;
      if (!*v7) {
        return v6;
      }
    }
    IOFree(v6, v5);
    return 0;
  }
  return v6;
}

uint64_t OSStringArrayIndex(unsigned int *a1, char *__s)
{
  uint64_t v4 = *a1;
  size_t v5 = strlen(__s);
  int v8 = *((unsigned __int8 *)a1 + 8);
  int v7 = a1 + 2;
  char v6 = v8;
  if (v8)
  {
    size_t v9 = v5;
    uint64_t v10 = 0;
    int v11 = &v7[v4];
    do
    {
      uint64_t v12 = v7 + 1;
      v7 += v6 + 1;
      if (v7 >= v11) {
        break;
      }
      if (v9 == v6 && !strncmp(v12, __s, v9)) {
        return v10;
      }
      uint64_t v10 = (v10 + 1);
      char v6 = *v7;
    }
    while (*v7);
  }
  return 0xFFFFFFFFLL;
}

uint64_t OSRegisterClass(uint64_t a1, void ***a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v17 = 0;
  int v18 = 2;
  uint64_t v16 = 0;
  int v2 = (unsigned int *)**a2[3];
  unsigned int v3 = *v2;
  if (v2[49] + v2[50] > *v2) {
    OSRegisterClass();
  }
  if (v2[53] + v2[54] > v3) {
    OSRegisterClass();
  }
  if (io_connect_method(*(_DWORD *)(a1 + 16), 4096, 0, 0, (int)v2, v3, 0, 0, 0, &v17, &v19, &v18, 0, &v16))OSRegisterClass(); {
  size_t v5 = v19;
  }
  int v6 = v20;
  if (*(_WORD *)(a2 - 1)) {
    int v7 = a2 - 11;
  }
  else {
    int v7 = 0;
  }
  v7[3] = v19;
  *((_DWORD *)a2 - 3) = v6;
  if ((gIODKDebug & 2) != 0)
  {
    int v8 = a2[3];
    size_t v9 = v8[1];
    uint64_t v10 = (const char *)(**v8 + 4);
    if (v9) {
      int v11 = (const char *)(**(void **)v9[3] + 4);
    }
    else {
      int v11 = "-";
    }
    IOLog("Register class: %s (super %s) object %p ref %qd\n", v10, v11, a2, v5);
  }
  unsigned int v12 = v2[49];
  *((_DWORD *)a2[3] + 6) = v12 >> 4;
  uint64_t v13 = IOMallocTyped(v12 & 0xFFFFFFF0, 0x100004000313F17uLL);
  uint64_t v14 = a2[3];
  v14[4] = v13;
  memmove(v13, (char *)v2 + v2[50], 8 * (2 * *((_DWORD *)v14 + 6)));
  a2[3][2] = OSCopyInStringArray((const char *)v2 + v2[54], v2[53]);
  return 0;
}

uint64_t OSFindClass(uint64_t a1, const char *a2)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)a1);
  uint64_t v4 = *(void **)(a1 + 56);
  if (!v4) {
LABEL_4:
  }
    OSFindClass();
  while (strcmp(a2, (const char *)(*(void *)*v4 + 4)))
  {
    uint64_t v4 = (void *)v4[2];
    if (!v4) {
      goto LABEL_4;
    }
  }
  uint64_t result = v4[1];
  if (!result) {
    OSFindClass();
  }
  return result;
}

kern_return_t OSObjectAllocate(OSMetaClass *meta, OSObject **pObject)
{
  return OSObjectAllocate(meta, 0, pObject);
}

uint64_t OSObjectAllocate(OSMetaClass *a1, __int16 a2, OSObject **a3)
{
  size_t v5 = *(unsigned int **)a1->metaClassPrivate;
  uint64_t v6 = v5[5];
  if (*(void *)(*(void *)v5 + 240)) {
    a2 = 1;
  }
  uint64_t v8 = 88;
  if ((a2 & 1) == 0) {
    uint64_t v8 = 24;
  }
  size_t v9 = IOMallocZeroTyped(v8 + v6, 0x100004077774924uLL);
  if (!v9) {
    return 3758097085;
  }
  uint64_t v10 = v9;
  if (a2)
  {
    void *v9 = *(void *)&a1[-3].refcount;
    uint64_t v10 = v9 + 8;
  }
  *((_WORD *)v10 + 8) = a2;
  atomic_store(1u, (unsigned int *)v10 + 8);
  v10[5] = a1;
  if (((unsigned int (*)(OSMetaClass *, void *))a1->New)(a1, v10 + 3)) {
    OSObjectAllocate();
  }
  uint64_t v11 = *((void *)a1->metaClassPrivate + 2);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 4);
    unsigned int v13 = v12 + 1;
    if ((gIODKDebug & 2) != 0) {
      IOLog("%s %d queues\n", (const char *)(***(void ***)(v10[5] + 24) + 4), v12);
    }
    if (v13 < 2) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = IOMallocZeroTyped(8 * v13, 0x2004093837F09uLL);
    }
  }
  else
  {
    uint64_t v14 = 0;
    unsigned int v13 = 1;
  }
  void *v10 = v14;
  *((_DWORD *)v10 + 2) = v13;
  if ((gIODKDebug & 2) != 0) {
    IOLog("%s allocated %p\n", (const char *)(***(void ***)(v10[5] + 24) + 4), v10 + 3);
  }
  uint64_t result = 0;
  *a3 = (OSObject *)(v10 + 3);
  return result;
}

void OSObjectPortFinalize(OSMetaClassBase *a1)
{
  kern_return_t v9;
  uint64_t vars8;

  p_refcount = &a1[-4].refcount;
  if (a1 == (OSMetaClassBase *)88 || ((uint64_t)a1[-1].meta & 1) == 0) {
    OSObjectPortFinalize();
  }
  if (*(void *)&a1[-3].refcount)
  {
    unsigned int v3 = *(os_unfair_lock_s **)&a1[-4].refcount;
    os_unfair_lock_lock(v3);
    uint64_t v4 = *(void *)&a1[-3].refcount;
    if (v4)
    {
      meta = a1[-4].meta;
      if (meta) {
        meta->meta = (OSMetaClass *)a1[-3].__vftable;
      }
      a1[-3].getMetaClass = (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))meta;
      if ((uint64_t)a1[-1].meta) {
        uint64_t v6 = p_refcount;
      }
      else {
        uint64_t v6 = 0;
      }
      __int32 v7 = v6[8];
      v6[8] = 0;
      *(void *)&a1[-3].refcount = 0;
      os_unfair_lock_unlock(v3);
      if (v7)
      {
        uint64_t v8 = (ipc_space_t *)MEMORY[0x263EF8960];
        size_t v9 = mach_port_mod_refs(*MEMORY[0x263EF8960], v4, 0, -v7);
        if (v9 == 17) {
          size_t v9 = mach_port_mod_refs(*v8, v4, 4u, -v7);
        }
        if (v9) {
          OSObjectPortFinalize();
        }
      }
    }
    else
    {
      os_unfair_lock_unlock(v3);
    }
  }
}

void OSObjectFree(OSMetaClass *a1)
{
  if (a1)
  {
    meta = a1->meta;
    if (meta == a1) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = a1->meta;
    }
    BOOL v4 = v3 != 0;
    if (v3) {
      BOOL v5 = v3 == gIOServiceMetaClass;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      do
      {
        meta = (OSMetaClass *)*((void *)meta->metaClassPrivate + 1);
        BOOL v4 = meta != 0;
        if (meta) {
          BOOL v6 = meta == gIOServiceMetaClass;
        }
        else {
          BOOL v6 = 1;
        }
      }
      while (!v6);
    }
    char v7 = !v4;
  }
  else
  {
    char v7 = 1;
  }
  if ((uint64_t)a1[-1].metaClassPrivate) {
    uint64_t v8 = (OSMetaClass *)((char *)a1 - 88);
  }
  else {
    uint64_t v8 = 0;
  }
  if (LODWORD(a1[-1].meta)) {
    CompactArray<IODispatchQueue *>::reset((uint64_t)&a1[-1].refcount);
  }
  if (!v8)
  {
    __int32 refcount = 0;
    size_t v9 = 0;
    goto LABEL_31;
  }
  size_t v9 = v8[1].__vftable;
  __int32 refcount = v8[1].refcount;
  uint64_t v11 = v8[2].__vftable;
  if (!v11) {
    goto LABEL_31;
  }
  if (!v8[1].reserved)
  {
    size_t v15 = 0;
    goto LABEL_30;
  }
  unint64_t v12 = 0;
  unsigned int v13 = (ipc_space_t *)MEMORY[0x263EF8960];
  do
  {
    mach_port_deallocate(*v13, *((void *)&v8[2].getMetaClass + v12++));
    unint64_t reserved = v8[1].reserved;
  }
  while (v12 < reserved);
  uint64_t v11 = v8[2].__vftable;
  if (v11)
  {
    size_t v15 = 8 * reserved;
LABEL_30:
    IOFree(v11, v15);
    v8[2].__vftable = 0;
  }
LABEL_31:
  if ((gIODKDebug & 2) != 0) {
    IOLog("free %s %p 0x%qx %d\n", (const char *)(**(void **)a1->meta->metaClassPrivate + 4), a1, v9, refcount);
  }
  if (v9 && (OSObjectPortFinalize(a1), (v7 & 1) == 0))
  {
    uint64_t v16 = v8->__vftable;
    if (!atomic_load((unsigned int *)&v8->__vftable[104])) {
      OSObjectFree();
    }
    unsigned int add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)&v16[104], 0xFFFFFFFF, memory_order_relaxed);
    if ((gIODKDebug & 2) != 0)
    {
      unsigned int v19 = atomic_load((unsigned int *)&v16[104]);
      IOLog("serviceCount %d\n", v19);
    }
    free(v8);
    if (add_explicit < 3)
    {
      IOLog("no services left, exiting\n");
      exit(0);
    }
  }
  else
  {
    if (!v8)
    {
      memset(&a1[-1].refcount, 238, *(unsigned int *)(*(void *)a1->meta->metaClassPrivate + 20) + 24);
      uint64_t v8 = (OSMetaClass *)((char *)a1 - 24);
    }
    free(v8);
  }
}

OSMetaClassBase *__cdecl OSMetaClassBase::safeMetaCast(OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  if (anObject)
  {
    meta = anObject->meta;
    if (meta == anObject) {
      unsigned int v3 = 0;
    }
    else {
      unsigned int v3 = anObject->meta;
    }
    BOOL v4 = v3 != 0;
    if (v3) {
      BOOL v5 = v3 == toMeta;
    }
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      do
      {
        meta = (OSMetaClass *)*((void *)meta->metaClassPrivate + 1);
        BOOL v4 = meta != 0;
        if (meta) {
          BOOL v6 = meta == toMeta;
        }
        else {
          BOOL v6 = 1;
        }
      }
      while (!v6);
    }
    if (!v4) {
      return 0;
    }
  }
  return anObject;
}

void CompactArray<IODispatchQueue *>::reset(uint64_t a1)
{
  unint64_t v2 = *(unsigned int *)(a1 + 8);
  if (v2 == 1)
  {
    BOOL v5 = *(void **)a1;
    if (*(void *)a1)
    {
      (*(void (**)(void *))(*(void *)v5 + 16))(v5);
      goto LABEL_11;
    }
  }
  else
  {
    if (!*(_DWORD *)(a1 + 8)) {
      CompactArray<IODispatchQueue *>::reset();
    }
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(*(void *)a1 + 8 * v3);
      if (v4)
      {
        (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
        *(void *)(*(void *)a1 + 8 * v3) = 0;
        unint64_t v2 = *(unsigned int *)(a1 + 8);
      }
      ++v3;
    }
    while (v3 < v2);
    if (*(void *)a1)
    {
      IOFree(*(void **)a1, 8 * v2);
LABEL_11:
      *(void *)a1 = 0;
    }
  }
  *(_DWORD *)(a1 + 8) = 0;
}

BOOL OSObjectTryRetain(OSObject *a1)
{
  unsigned int v1 = atomic_load((unsigned int *)&a1->refcount);
  while (1)
  {
    int v2 = v1;
    if (!v1) {
      break;
    }
    atomic_compare_exchange_strong_explicit(&a1->refcount, &v1, v1 + 1, memory_order_relaxed, memory_order_relaxed);
    if (v1 == v2)
    {
      if (v2 >= 0x7FFF) {
        OSObjectTryRetain();
      }
      return v2 != 0;
    }
  }
  return v2 != 0;
}

uint32_t OSMetaClassBase::getRetainCount(const OSMetaClassBase *this)
{
  return atomic_load((unsigned int *)&this->refcount);
}

void OSObject::retain(const OSObject *this)
{
  unsigned int add_explicit = atomic_fetch_add_explicit(&this->refcount, 1u, memory_order_relaxed);
  if (!add_explicit) {
    OSObject::retain();
  }
  if (add_explicit >= 0x7FFF) {
    OSObject::retain();
  }
}

void OSObject::release(const OSObject *this)
{
  if (!atomic_load((unsigned int *)&this->refcount)) {
    OSObject::release();
  }
  if ((int)atomic_fetch_add_explicit(&this->refcount, 0xFFFFFFFF, memory_order_release) <= 1)
  {
    __dmb(9u);
    free = (void (*)(void))this->free;
    free();
  }
}

BOOL OSMetaClassBase::isEqualTo(const OSMetaClassBase *this, const OSMetaClassBase *anObject)
{
  return this == anObject;
}

const OSMetaClass *__cdecl OSMetaClassBase::getMetaClass(const OSMetaClassBase *this)
{
  return 0;
}

OSMetaClassBase *__cdecl OSMetaClassBase::requiredMetaCast(OSMetaClassBase *anObject, const OSMetaClass *toMeta)
{
  if (anObject)
  {
    if (anObject->meta == anObject) {
      meta = 0;
    }
    else {
      meta = anObject->meta;
    }
    BOOL v3 = meta != 0;
    if (meta) {
      BOOL v4 = meta == toMeta;
    }
    else {
      BOOL v4 = 1;
    }
    if (!v4)
    {
      BOOL v5 = anObject->meta;
      do
      {
        BOOL v5 = (OSMetaClass *)*((void *)v5->metaClassPrivate + 1);
        BOOL v3 = v5 != 0;
        if (v5) {
          BOOL v6 = v5 == toMeta;
        }
        else {
          BOOL v6 = 1;
        }
      }
      while (!v6);
    }
    if (!v3) {
      OSMetaClassBase::requiredMetaCast((uint64_t)anObject->meta, (uint64_t)toMeta);
    }
  }
  return anObject;
}

uint64_t SearchMethodArray(unint64_t a1, const unint64_t *a2, unsigned int a3, unint64_t *a4)
{
  if (!a3) {
    return 0;
  }
  int v4 = 0;
  unsigned int v5 = a3;
  while (1)
  {
    int v6 = v4 + (v5 >> 1);
    unint64_t v7 = a2[v6];
    BOOL v8 = v7 >= a1;
    if (v7 == a1) {
      break;
    }
    BOOL v9 = v7 < a1;
    if (v8) {
      int v10 = 0;
    }
    else {
      int v10 = (v5 >> 1) + 1;
    }
    v4 += v10;
    unsigned int v11 = v5 - v9;
    unsigned int v5 = (v5 - v9) >> 1;
    if (v11 <= 1) {
      return 0;
    }
  }
  *a4 = a2[v6 + a3];
  return 1;
}

uint64_t OSMetaClassBase::QueueForObject(OSMetaClassBase *this, unint64_t a2)
{
  if (this->meta == this) {
    return 0;
  }
  if (!this[-1].refcount) {
    OSMetaClassBase::QueueForObject();
  }
  uint64_t v4 = *(void *)CompactArray<IODispatchQueue *>::operator[]((uint64_t)&this[-1], 0);
  metaClassPrivate = this->meta->metaClassPrivate;
  uint64_t v6 = *((void *)metaClassPrivate + 4);
  if (v6)
  {
    int v7 = *((_DWORD *)metaClassPrivate + 6);
    if (v7)
    {
      int v8 = 0;
      unsigned int v9 = *((_DWORD *)metaClassPrivate + 6);
      while (1)
      {
        unsigned int v10 = v8 + (v9 >> 1);
        unint64_t v11 = *(void *)(v6 + 8 * v10);
        BOOL v12 = v11 >= a2;
        if (v11 == a2) {
          break;
        }
        BOOL v13 = v11 < a2;
        if (v12) {
          int v14 = 0;
        }
        else {
          int v14 = (v9 >> 1) + 1;
        }
        v8 += v14;
        unsigned int v15 = v9 - v13;
        unsigned int v9 = (v9 - v13) >> 1;
        if (v15 <= 1) {
          return v4;
        }
      }
      unint64_t v16 = *(unsigned __int8 *)(v6 + 8 * (v10 + v7));
      if (v16 < *(unsigned int *)(*((void *)metaClassPrivate + 2) + 4))
      {
        unint64_t v17 = v16 + 1;
        if (*(void *)CompactArray<IODispatchQueue *>::operator[]((uint64_t)&this[-1], v16 + 1)) {
          uint64_t v4 = *(void *)CompactArray<IODispatchQueue *>::operator[]((uint64_t)&this[-1], v17);
        }
      }
      if (!v4) {
        OSMetaClassBase::QueueForObject();
      }
    }
  }
  return v4;
}

uint64_t CompactArray<IODispatchQueue *>::operator[](uint64_t result, unint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(result + 8);
  if (!v2) {
    CompactArray<IODispatchQueue *>::operator[]();
  }
  if (v2 <= a2) {
    CompactArray<IODispatchQueue *>::operator[]();
  }
  if (v2 != 1) {
    return *(void *)result + 8 * a2;
  }
  return result;
}

IORPCMessage *__cdecl IORPCMessageFromMach(IORPCMessageMach *msg, BOOL reply)
{
  if (reply) {
    int v2 = 1302509197;
  }
  else {
    int v2 = 1302509196;
  }
  if (msg->msgh.msgh_id != v2) {
    IORPCMessageFromMach_cold_2();
  }
  mach_msg_size_t msgh_descriptor_count = msg->msgh_body.msgh_descriptor_count;
  uint64_t v4 = msg + 1;
  if (msgh_descriptor_count)
  {
    size_t msgh_size = msg->msgh.msgh_size;
    while (v4 < (IORPCMessageMach *)((char *)msg + msgh_size))
    {
      mach_port_t msgh_remote_port_high = HIBYTE(v4->msgh.msgh_remote_port);
      if (msgh_remote_port_high)
      {
        if (msgh_remote_port_high != 1) {
          IORPCMessageFromMach_cold_1(msg, msgh_size);
        }
        uint64_t v7 = 16;
      }
      else
      {
        uint64_t v7 = 12;
      }
      uint64_t v4 = (IORPCMessageMach *)((char *)v4 + v7);
      if (!--msgh_descriptor_count) {
        return (IORPCMessage *)v4;
      }
    }
    return 0;
  }
  return (IORPCMessage *)v4;
}

kern_return_t OSMetaClassBase::Dispatch(OSMetaClassBase *this, IORPC *invoke)
{
  kern_return_t result;
  mach_msg_id_t *p_msgh_id;
  IORPCMessageMach *reply;
  long long v32;
  uint64_t v33;

  uint64_t v4 = IORPCMessageFromMach(invoke->message, 0);
  if (this == (OSMetaClassBase *)88 || ((uint64_t)this[-1].meta & 1) == 0) {
    OSMetaClassBase::Dispatch();
  }
  unsigned int v5 = v4;
  if ((gIODKDebug & 4) != 0) {
    IOLog("OSMetaClassBase::InvokeRemote(0x%x) 0x%qx 0x%qx %p %p\n", this[-1].reserved, v4->flags, v4->msgid, invoke->reply, this->meta);
  }
  if ((this[-1].reserved & 2) != 0
    && (v5->flags & 0x80) != 0
    && (unint64_t objectRefs = v5->objectRefs, objectRefs <= 2)
    && (uint64_t sendSize = invoke->sendSize, replySize = invoke->replySize, (replySize + sendSize) <= 0x7FF)
    && objectRefs == invoke->message->msgh_body.msgh_descriptor_count)
  {
    uint64_t v9 = *(void *)&this[-3].refcount;
    if (!v9) {
      OSMetaClassBase::Dispatch();
    }
    if (objectRefs >= 2 && (uint64_t flags = v5[1].flags) != 0)
    {
      __int16 v11 = *(_WORD *)(flags - 8);
      uint64_t v12 = flags - 88;
      if ((v11 & 1) == 0) {
        uint64_t v12 = 0;
      }
      BOOL v13 = (void *)*(unsigned int *)(v12 + 24);
      if (!*(_DWORD *)(v12 + 24)) {
        OSMetaClassBase::Dispatch();
      }
    }
    else
    {
      BOOL v13 = 0;
    }
    if (v9 == 0xFFFFFFFFLL) {
      OSMetaClassBase::Dispatch();
    }
    p_msgh_id = &invoke->reply->msgh.msgh_id;
    uint64_t result = iokit_user_client_trap((void *)(v9 & 0xFFFFFFFFFFFFFFFCLL), 0, v5, (char *)invoke->message + sendSize - (void)v5, p_msgh_id, (void *)(replySize - 20), v13, 0);
    if (!result)
    {
      reply = invoke->reply;
      reply->msgh.size_t msgh_size = *p_msgh_id + 20;
      *(void *)&reply->msgh.msgh_id = 1302509197;
    }
  }
  else
  {
    uint64_t v14 = *(void *)&this[-4].refcount;
    unsigned int v15 = *(uint64_t **)&this[-2].refcount;
    if (v15)
    {
      uint64_t v16 = *v15;
      int v17 = (int)this[-2].__vftable;
      if (v17)
      {
        int v18 = 0;
        uint64_t msgid = v5->msgid;
        meta = this[-2].meta;
        unsigned int v21 = this[-2].__vftable;
        while (1)
        {
          unsigned int v22 = v18 + (v21 >> 1);
          uint64_t v23 = *((void *)&meta->__vftable + v22);
          BOOL v24 = v23 >= msgid;
          if (v23 == msgid) {
            break;
          }
          BOOL v25 = v23 < msgid;
          if (v24) {
            int v26 = 0;
          }
          else {
            int v26 = (v21 >> 1) + 1;
          }
          v18 += v26;
          unsigned int v27 = v21 - v25;
          unsigned int v21 = (v21 - v25) >> 1;
          if (v27 <= 1) {
            goto LABEL_29;
          }
        }
        unint64_t v28 = *((unsigned __int8 *)&meta->__vftable + 8 * v22 + 8 * v17) + 1;
        if (v28 < HIDWORD(this[-3].meta)) {
          uint64_t v16 = v15[v28];
        }
      }
    }
    else
    {
      uint64_t v16 = *(void *)(v14 + 24);
    }
LABEL_29:
    uint64_t v32 = *(_OWORD *)&invoke->message;
    uint64_t v33 = *(void *)&invoke->sendSize;
    return InvokeRemote(v14, v16, (uint64_t)&v32);
  }
  return result;
}

uint64_t InvokeRemote(uint64_t a1, mach_port_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  __uint64_t v22 = 0;
  pthread_threadid_np(0, &v22);
  size_t v6 = *(unsigned int *)(a3 + 16);
  if (v6 <= 0x33) {
    InvokeRemote();
  }
  uint64_t v7 = *(IORPCMessageMach **)a3;
  unsigned int v8 = *(_DWORD *)(a3 + 20);
  uint64_t v9 = IORPCMessageFromMach(*(IORPCMessageMach **)a3, 0);
  uint64_t flags = v9->flags;
  if ((flags & 8) == 0 && v8 <= 0x33) {
    InvokeRemote();
  }
  if (OSCopyOutObjects((uint64_t)v7, (uint64_t)v9)) {
    InvokeRemote();
  }
  v7->msgh.msgh_remote_port = a2;
  uint64_t v11 = flags & 8;
  if ((flags & 8) != 0) {
    mach_port_t reply_port = 0;
  }
  else {
    mach_port_t reply_port = mig_get_reply_port();
  }
  v7->msgh.msgh_local_port = reply_port;
  v7->msgh.msgh_bits = -2147478253;
  *(void *)&v7->msgh.msgh_voucher_port = 0x4DA2B68C00000000;
  if ((gIODKDebug & 0x10) != 0)
  {
    snprintf(__str, 0x40uLL, "[%#qx] INVOKE MSG:", v22);
    IOLogBuffer(__str, v7, v6);
  }
  if ((flags & 8) != 0 || *(void *)(a3 + 8) == *(void *)a3)
  {
    size_t v13 = 0;
  }
  else
  {
    if (v8 <= v6) {
      size_t v13 = v6;
    }
    else {
      size_t v13 = v8;
    }
    uint64_t v7 = (IORPCMessageMach *)malloc_type_malloc(v13, 0xF0384957uLL);
    memmove(v7, *(const void **)a3, v6);
  }
  uint64_t msgid_low = mach_msg2_internal();
  if (!v11)
  {
    size_t msgh_size = v7->msgh.msgh_size;
    if ((gIODKDebug & 0x10) != 0)
    {
      snprintf(__str, 0x40uLL, "[%#qx] INVOKE REPLY:", v22);
      IOLogBuffer(__str, v7, msgh_size);
    }
    if (msgid_low)
    {
      if (v13) {
        free(v7);
      }
      mach_error("mach_msg: ", msgid_low);
    }
    else
    {
      mach_msg_id_t msgh_id = v7->msgh.msgh_id;
      if (msgh_id == 1302509197)
      {
        if (msgh_size > 0x33)
        {
          if ((v7->msgh.msgh_bits & 0x80000000) == 0) {
            v7->msgh_body.mach_msg_size_t msgh_descriptor_count = 0;
          }
          int v17 = IORPCMessageFromMach(v7, 1);
          uint64_t v18 = v17->flags;
          uint64_t v19 = OSCopyInObjects(a1, v7, v17);
          if ((v18 & 0x40) != 0) {
            uint64_t msgid_low = LODWORD(v17[1].msgid);
          }
          else {
            uint64_t msgid_low = v19;
          }
          if (!msgid_low)
          {
            uint64_t v20 = *(void **)(a3 + 8);
            if (v20 != *(void **)a3)
            {
              if (msgh_size > *(_DWORD *)(a3 + 20)) {
                InvokeRemote();
              }
              memmove(v20, v7, msgh_size);
            }
            uint64_t msgid_low = 0;
          }
        }
        else
        {
          if ((gIODKDebug & 4) != 0) {
            IOLog("BAD REPLY SIZE 0x%x\n", 1302509197);
          }
          uint64_t msgid_low = 4294966992;
        }
      }
      else
      {
        if ((gIODKDebug & 4) != 0)
        {
          IOLog("BAD REPLY ID 0x%x\n", v7->msgh.msgh_id);
          mach_msg_id_t msgh_id = v7->msgh.msgh_id;
        }
        if (msgh_id == 71) {
          uint64_t msgid_low = 4294966988;
        }
        else {
          uint64_t msgid_low = 4294966995;
        }
      }
      if (v13) {
        free(v7);
      }
    }
  }
  return msgid_low;
}

kern_return_t OSMetaClassBase::Invoke(OSMetaClassBase *this, IORPC *invoke)
{
  kern_return_t v4;
  IORPCMessage *v5;
  IORPCMessage *v6;
  OSMetaClassBase *msgid;
  unint64_t v8;
  OSMetaClass *meta;
  OSMetaClass *v10;
  BOOL v11;
  BOOL v12;
  BOOL v13;
  uint64_t flags;
  uint64_t v15;
  kern_return_t v16;
  void *v17;
  OSMetaClass *v18;
  OSMetaClassBase *v19;
  uint64_t v20;
  IODispatchQueue *v21;
  const char *v22;
  const char *label;
  uint64_t v24;
  kern_return_t v25;
  uint64_t (*v26)(uint64_t);
  void (__cdecl *v27)(void *);
  char *v29;
  IORPCMessage *v30;
  uint64_t objectRefs;
  IORPCMessage *v32;
  uint64_t v33;
  uint64_t v34;
  uint32_t sendSize;
  NSObject *v36;
  void context[2];
  uint64_t (*v38)(uint64_t);
  void *v39;
  uint64_t *v40;
  OSMetaClassBase *v41;
  OSMetaClassBase *v42;
  long long v43;
  uint64_t v44;
  long long v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int v50;
  void block[7];

  uint64_t v4 = -536870184;
  uint64_t v47 = 0;
  unsigned int v48 = &v47;
  v49 = 0x2000000000;
  uint64_t v50 = 0;
  unsigned int v5 = IORPCMessageFromMach(invoke->message, 0);
  if (!invoke->message->msgh_body.msgh_descriptor_count)
  {
    uint64_t v4 = -536870172;
    goto LABEL_68;
  }
  size_t v6 = v5;
  uint64_t msgid = (OSMetaClassBase *)v5[1].msgid;
  if (msgid)
  {
    unsigned int v8 = v5->msgid;
    meta = msgid->meta;
    if (meta == msgid) {
      unsigned int v10 = 0;
    }
    else {
      unsigned int v10 = msgid->meta;
    }
    uint64_t v11 = v10 != 0;
    if (v10) {
      uint64_t v12 = v10 == gOSActionMetaClass;
    }
    else {
      uint64_t v12 = 1;
    }
    if (!v12)
    {
      do
      {
        meta = (OSMetaClass *)*((void *)meta->metaClassPrivate + 1);
        uint64_t v11 = meta != 0;
        if (meta) {
          size_t v13 = meta == gOSActionMetaClass;
        }
        else {
          size_t v13 = 1;
        }
      }
      while (!v13);
    }
    uint64_t flags = v5->flags;
    if (!v11) {
      goto LABEL_33;
    }
    if ((gIODKDebug & 4) != 0) {
      IOLog("is action\n");
    }
    if ((this[-1].reserved & 2) != 0 && v6->objectRefs == 2)
    {
      if (this == (OSMetaClassBase *)88 || ((uint64_t)this[-1].meta & 1) == 0) {
        OSMetaClassBase::Invoke();
      }
      unsigned int v15 = *(void *)&this[-3].refcount;
      if (!v15) {
        OSMetaClassBase::Invoke();
      }
      if (v15 == 0xFFFFFFFFLL) {
        OSMetaClassBase::Invoke();
      }
      uint64_t v16 = iokit_user_client_trap((void *)(v15 & 0xFFFFFFFFFFFFFFFCLL), 0, v6, (void *)((char *)invoke->message - (char *)v6 + invoke->sendSize), 0, 0, 0, 0);
      uint64_t v4 = 0;
      *((_DWORD *)v48 + 6) = v16;
      if (v16) {
        OSMetaClassBase::Invoke();
      }
      goto LABEL_68;
    }
    int v17 = &msgid[1].meta->__vftable;
    if (v17 && *v17)
    {
      if ((gIODKDebug & 4) != 0) {
        IOLog("is local target\n");
      }
      ((void (*)(OSMetaClassBase *))msgid->retain)(msgid);
      uint64_t v18 = msgid[1].meta;
      if ((OSMetaClass *)v8 != v18->meta) {
        OSMetaClassBase::Invoke();
      }
      uint64_t v19 = msgid;
      uint64_t msgid = (OSMetaClassBase *)v18->__vftable;
      unsigned int v8 = *(void *)&v18->refcount;
      v6[1].uint64_t msgid = (uint64_t)v18->__vftable;
      v6->uint64_t msgid = v8;
    }
    else
    {
LABEL_33:
      uint64_t v19 = 0;
    }
    if ((v6->flags & 0x20) != 0)
    {
      if ((gIODKDebug & 4) == 0) {
        goto LABEL_54;
      }
      unsigned int v21 = 0;
      if (flags) {
        __uint64_t v22 = "remote";
      }
      else {
        __uint64_t v22 = "local";
      }
    }
    else
    {
      uint64_t v20 = OSMetaClassBase::QueueForObject(msgid, v8);
      unsigned int v21 = (IODispatchQueue *)v20;
      if ((gIODKDebug & 4) == 0) {
        goto LABEL_47;
      }
      if (flags) {
        __uint64_t v22 = "remote";
      }
      else {
        __uint64_t v22 = "local";
      }
      if (v20)
      {
        label = dispatch_queue_get_label(**(dispatch_queue_t **)(v20 + 40));
LABEL_46:
        IOLog("Invoke from %s 0x%qx, q %s refs %llx rpcKernel %d %s\n", v22, v8, label, v6->objectRefs, this[-1].reserved & 2, (const char *)(**(void **)this->meta->metaClassPrivate + 4));
LABEL_47:
        if (v21)
        {
          uint64_t v24 = *((void *)v21->ivars + 4);
          if ((v24 & 2) == 0 && (flags & 1) != 0 && v8 != 0xAB6F76DDE6D693F2)
          {
            if (!IODispatchQueue::OnQueue(v21)) {
              OSMetaClassBase::Invoke();
            }
            goto LABEL_59;
          }
          if ((v24 & 2) == 0)
          {
            if ((flags & 1) == 0 && (v6->flags & 8) != 0)
            {
              int v29 = (char *)malloc_type_malloc(invoke->sendSize + 40, 0xC5BEBBB1uLL);
              memmove(v29 + 40, invoke->message, invoke->sendSize);
              uint64_t v30 = IORPCMessageFromMach((IORPCMessageMach *)(v29 + 40), 0);
              unint64_t objectRefs = v30->objectRefs;
              if (objectRefs)
              {
                uint64_t v32 = v30 + 1;
                do
                {
                  uint64_t v34 = v32->msgid;
                  uint64_t v32 = (IORPCMessage *)((char *)v32 + 8);
                  uint64_t v33 = v34;
                  if (v34) {
                    (*(void (**)(uint64_t))(*(void *)v33 + 8))(v33);
                  }
                  --objectRefs;
                }
                while (objectRefs);
              }
              *((void *)v29 + 2) = v29 + 40;
              uint64_t sendSize = invoke->sendSize;
              *((void *)v29 + 3) = 0;
              *((void *)v29 + 4) = sendSize;
              *((void *)v29 + 1) = msgid;
              if (v19) {
                ((void (*)(OSMetaClassBase *))v19->retain)(v19);
              }
              *(void *)int v29 = v19;
              int v36 = *(NSObject **)v21->ivars;
              block[0] = MEMORY[0x263EF8330];
              block[1] = 0x40000000;
              block[2] = ___ZN15IODispatchQueue15DispatchAsync_fEPvPFvS0_E_block_invoke;
              block[3] = &__block_descriptor_tmp_87;
              block[4] = v21;
              block[5] = IORPCAsync;
              block[6] = v29;
              dispatch_async(v36, block);
              *((_DWORD *)v48 + 6) = 0;
              if (v19) {
                goto LABEL_67;
              }
              goto LABEL_77;
            }
LABEL_59:
            context[0] = MEMORY[0x263EF8330];
            context[1] = 1174405120;
            int v26 = ___ZN15OSMetaClassBase6InvokeE5IORPC_block_invoke;
            int v38 = ___ZN15OSMetaClassBase6InvokeE5IORPC_block_invoke;
            int v39 = &__block_descriptor_tmp_1;
            int v41 = v19;
            if (v19)
            {
              ((void (*)(OSMetaClassBase *))v19->retain)(v19);
              int v26 = v38;
            }
            uint64_t v40 = &v47;
            uint64_t v42 = msgid;
            uint64_t v43 = *(_OWORD *)&invoke->message;
            uint64_t v44 = *(void *)&invoke->sendSize;
            if (v26) {
              unsigned int v27 = (void (__cdecl *)(void *))v26;
            }
            else {
              unsigned int v27 = 0;
            }
            IODispatchQueue::DispatchSync_f(v21, context, v27);
            if (v41) {
              ((void (*)(OSMetaClassBase *))v41->release)(v41);
            }
            int v41 = 0;
            if (v19) {
              goto LABEL_67;
            }
LABEL_77:
            uint64_t v4 = *((_DWORD *)v48 + 6);
            goto LABEL_68;
          }
        }
LABEL_54:
        uint64_t v45 = *(_OWORD *)&invoke->message;
        uint64_t v46 = *(void *)&invoke->sendSize;
        BOOL v25 = ((uint64_t (*)(OSMetaClassBase *, long long *))msgid->Dispatch)(msgid, &v45);
        *((_DWORD *)v48 + 6) = v25;
        if (!v19)
        {
          uint64_t v4 = v25;
          goto LABEL_68;
        }
        DidAction((uint64_t)v19);
LABEL_67:
        v6->uint64_t msgid = (uint64_t)v19[1].meta->meta;
        v6[1].uint64_t msgid = (uint64_t)v19;
        uint64_t v4 = *((_DWORD *)v48 + 6);
        ((void (*)(OSMetaClassBase *))v19->release)(v19);
        goto LABEL_68;
      }
    }
    label = "noq";
    goto LABEL_46;
  }
LABEL_68:
  _Block_object_dispose(&v47, 8);
  return v4;
}

const char *__cdecl IODispatchQueue::GetName(IODispatchQueue *this)
{
  return dispatch_queue_get_label(*(dispatch_queue_t *)this->ivars);
}

BOOL IODispatchQueue::OnQueue(IODispatchQueue *this)
{
  int v2 = (IORecursiveConditionLock *)*((void *)this->ivars + 6);
  if (v2)
  {
    LOBYTE(specific) = IORecursiveConditionLockHaveLock(v2);
  }
  else
  {
    specific = dispatch_get_specific(&gIODispatchQueueKey);
    if (specific)
    {
      uint64_t v4 = specific[5] + 8;
      do
      {
        uint64_t v4 = *(void *)v4;
        LOBYTE(specific) = v4 != 0;
      }
      while (v4 && *(IODispatchQueue **)(v4 + 8) != this);
    }
  }
  return (char)specific;
}

uint64_t DidAction(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(v1 + 104))
  {
    uint64_t v2 = result;
    pthread_mutex_lock((pthread_mutex_t *)(v1 + 40));
    uint64_t v3 = *(void *)(v2 + 40);
    uint64_t v4 = *(void *)(v3 + 104);
    if (v4)
    {
      ++*(void *)(v4 + 48);
      if (pthread_cond_signal(*(pthread_cond_t **)(*(void *)(v2 + 40) + 104))) {
        DidAction();
      }
      uint64_t v3 = *(void *)(v2 + 40);
    }
    return pthread_mutex_unlock((pthread_mutex_t *)(v3 + 40));
  }
  return result;
}

void IODispatchQueue::DispatchAsync_f(IODispatchQueue *this, void *context, IODispatchFunction function)
{
  uint64_t v3 = *(NSObject **)this->ivars;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN15IODispatchQueue15DispatchAsync_fEPvPFvS0_E_block_invoke;
  block[3] = &__block_descriptor_tmp_87;
  block[4] = this;
  block[5] = function;
  block[6] = context;
  dispatch_async(v3, block);
}

void IORPCAsync(void *a1)
{
  if (*a1 && *(unsigned char *)(*(void *)(*a1 + 40) + 32))
  {
    if ((gIODKDebug & 4) != 0) {
      IOLog("is canceled action\n");
    }
  }
  else
  {
    uint64_t v2 = a1[1];
    long long v3 = *((_OWORD *)a1 + 1);
    uint64_t v4 = a1[4];
    (*(void (**)(uint64_t, long long *))(*(void *)v2 + 32))(v2, &v3);
    if (*a1) {
      DidAction(*a1);
    }
  }
  OSConsumeObjects((IORPCMessageMach *)a1[2], 0);
  if (*a1) {
    (*(void (**)(void))(*(void *)*a1 + 16))(*a1);
  }
  free(a1);
}

void IODispatchQueue::DispatchSync(IODispatchQueue *this, IODispatchBlock block)
{
  if (*((void *)block + 2)) {
    uint64_t v2 = (void (__cdecl *)(void *))*((void *)block + 2);
  }
  else {
    uint64_t v2 = 0;
  }
  IODispatchQueue::DispatchSync_f(this, block, v2);
}

uint64_t ___ZN15OSMetaClassBase6InvokeE5IORPC_block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 40);
  if (v2 && *(unsigned char *)(*(void *)(v2 + 40) + 32))
  {
    if ((gIODKDebug & 4) != 0) {
      uint64_t result = IOLog("is canceled action\n");
    }
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = -536870195;
  }
  else
  {
    uint64_t v3 = *(void *)(result + 48);
    long long v5 = *(_OWORD *)(v1 + 56);
    uint64_t v6 = *(void *)(v1 + 72);
    int v4 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v3 + 32))(v3, &v5);
    uint64_t result = *(void *)(v1 + 40);
    *(_DWORD *)(*(void *)(*(void *)(v1 + 32) + 8) + 24) = v4;
    if (result) {
      return DidAction(result);
    }
  }
  return result;
}

uint64_t __copy_helper_block_8_32r40c28_ZTS11OSSharedPtrI8OSActionE(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  uint64_t result = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = result;
  if (result)
  {
    long long v5 = *(uint64_t (**)(void))(*(void *)result + 8);
    return v5();
  }
  return result;
}

void __destroy_helper_block_8_32r40c28_ZTS11OSSharedPtrI8OSActionE(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
  *(void *)(a1 + 40) = 0;
  uint64_t v3 = *(const void **)(a1 + 32);

  _Block_object_dispose(v3, 8);
}

IOLock *IOLockAlloc(void)
{
  uint64_t result = (IOLock *)IOMallocZeroTyped(4uLL, 0x100004052888210uLL);
  if (result) {
    *(_DWORD *)uint64_t result = 0;
  }
  return result;
}

void IOLockFree(IOLock *lock)
{
  if (lock) {
    IOFree(lock, 4uLL);
  }
}

void IOLockAssert(IOLock *lock, IOLockAssertState type)
{
  if (type == kIOLockAssertNotOwned)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)lock);
  }
  else
  {
    if (type != kIOLockAssertOwned) {
      IOLockAssert_cold_1();
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)lock);
  }
}

IORecursiveLock *IORecursiveLockAlloc(void)
{
  uint64_t result = (IORecursiveLock *)IOMallocZeroTyped(8uLL, 0x100004000313F17uLL);
  if (result) {
    *(void *)uint64_t result = 0;
  }
  return result;
}

void IORecursiveLockFree(IORecursiveLock *lock)
{
  if (lock) {
    IOFree(lock, 8uLL);
  }
}

void IORecursiveLockLock(IORecursiveLock *lock)
{
}

BOOL IORecursiveLockHaveLock(IORecursiveLock *lock)
{
  return MEMORY[0x270EDAAF8](lock);
}

BOOL IORecursiveLockTryLock(IORecursiveLock *lock)
{
  return MEMORY[0x270EDAB00](lock);
}

IORecursiveConditionLock *IORecursiveConditionLockAlloc(void)
{
  v0 = (pthread_mutex_t *)IOMallocZeroTyped(0x50uLL, 0x1020040D51851D7uLL);
  uint64_t v1 = (IORecursiveConditionLock *)v0;
  if (v0) {
    pthread_mutex_init(v0, 0);
  }
  return v1;
}

void IORecursiveConditionLockFree(IORecursiveConditionLock *lock)
{
  if (lock) {
    IOFree(lock, 0x50uLL);
  }
}

void IORecursiveConditionLockLock(IORecursiveConditionLock *lock)
{
  pthread_t v2 = pthread_self();
  if (v2 == *((pthread_t *)lock + 8))
  {
    uint64_t v4 = *((void *)lock + 9);
    if (!v4) {
      IORecursiveConditionLockLock_cold_1();
    }
    *((void *)lock + 9) = v4 + 1;
  }
  else
  {
    pthread_t v3 = v2;
    pthread_mutex_lock((pthread_mutex_t *)lock);
    if (*((void *)lock + 9)) {
      IORecursiveConditionLockLock_cold_2();
    }
    *((void *)lock + 8) = v3;
    *((void *)lock + 9) = 1;
  }
}

void IORecursiveConditionLockUnlock(IORecursiveConditionLock *lock)
{
  if (pthread_self() != *((pthread_t *)lock + 8)) {
    IORecursiveConditionLockUnlock_cold_2();
  }
  uint64_t v2 = *((void *)lock + 9);
  if (!v2) {
    IORecursiveConditionLockUnlock_cold_1();
  }
  uint64_t v3 = v2 - 1;
  *((void *)lock + 9) = v3;
  if (!v3)
  {
    *((void *)lock + 8) = 0;
    pthread_mutex_unlock((pthread_mutex_t *)lock);
  }
}

BOOL IORecursiveConditionLockHaveLock(IORecursiveConditionLock *lock)
{
  pthread_t v2 = pthread_self();
  uint64_t v3 = (_opaque_pthread_t *)*((void *)lock + 8);
  if (v2 == v3 && !*((void *)lock + 9)) {
    IORecursiveConditionLockHaveLock_cold_1();
  }
  return v2 == v3;
}

BOOL IORecursiveConditionLockTryLock(IORecursiveConditionLock *lock)
{
  pthread_t v2 = pthread_self();
  if (v2 == *((pthread_t *)lock + 8))
  {
    uint64_t v5 = *((void *)lock + 9);
    if (!v5) {
      IORecursiveConditionLockTryLock_cold_1();
    }
    *((void *)lock + 9) = v5 + 1;
    return 1;
  }
  else
  {
    pthread_t v3 = v2;
    if (pthread_mutex_trylock((pthread_mutex_t *)lock))
    {
      return 0;
    }
    else
    {
      if (*((void *)lock + 9)) {
        IORecursiveConditionLockTryLock_cold_2();
      }
      BOOL result = 1;
      *((void *)lock + 8) = v3;
      *((void *)lock + 9) = 1;
    }
  }
  return result;
}

IORWLock *IORWLockAlloc(void)
{
  v0 = (pthread_rwlock_t *)IOMallocZeroTyped(0xC8uLL, 0x1000040BEF03554uLL);
  uint64_t v1 = (IORWLock *)v0;
  if (v0 && pthread_rwlock_init(v0, 0)) {
    IORWLockAlloc_cold_1();
  }
  return v1;
}

void IORWLockFree(IORWLock *lock)
{
  if (lock)
  {
    pthread_rwlock_destroy((pthread_rwlock_t *)lock);
    IOFree(lock, 0xC8uLL);
  }
}

void IORWLockRead(IORWLock *lock)
{
  if (pthread_rwlock_rdlock((pthread_rwlock_t *)lock)) {
    IORWLockRead_cold_1();
  }
}

void IORWLockWrite(IORWLock *lock)
{
  if (pthread_rwlock_wrlock((pthread_rwlock_t *)lock)) {
    IORWLockWrite_cold_1();
  }
}

void IORWLockUnlock(IORWLock *lock)
{
  if (pthread_rwlock_unlock((pthread_rwlock_t *)lock)) {
    IORWLockUnlock_cold_1();
  }
}

void IOCallOnce(dispatch_once_t *predicate, dispatch_block_t block)
{
  if (*predicate != -1) {
    dispatch_once(predicate, block);
  }
}

kern_return_t IOThreadLocalStorageKeyCreate(uint64_t *key)
{
  kern_return_t result;
  pthread_key_t v3;

  pthread_t v3 = 0;
  BOOL result = pthread_key_create(&v3, 0);
  if (result) {
    return -536870211;
  }
  *key = v3;
  return result;
}

kern_return_t IOThreadLocalStorageKeyDelete(uint64_t key)
{
  if (pthread_key_delete(key)) {
    return -536870206;
  }
  else {
    return 0;
  }
}

kern_return_t IOThreadLocalStorageSet(uint64_t key, const void *value)
{
  kern_return_t v3;

  int v2 = pthread_setspecific(key, value);
  if (v2 == 22) {
    pthread_t v3 = -536870206;
  }
  else {
    pthread_t v3 = -536870211;
  }
  if (v2) {
    return v3;
  }
  else {
    return 0;
  }
}

pthread_t ThreadStart(void *(__cdecl *a1)(void *), void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  pthread_t v6 = 0;
  if (pthread_attr_init(&v7)) {
    ThreadStart();
  }
  pthread_attr_setschedpolicy(&v7, 2);
  if (pthread_attr_getschedparam(&v7, &v5)) {
    ThreadStart();
  }
  v5.sched_priority = 63;
  if (pthread_attr_setschedparam(&v7, &v5)) {
    ThreadStart();
  }
  if (pthread_attr_setdetachstate(&v7, 2)) {
    ThreadStart();
  }
  if (pthread_create(&v6, &v7, a1, a2)) {
    ThreadStart();
  }
  pthread_attr_destroy(&v7);
  return v6;
}

uint64_t OSCopyOutObjects(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 16);
  if (v2 > *(unsigned int *)(a1 + 24)) {
    OSCopyOutObjects();
  }
  uint64_t v4 = a2 + 24;
  if (v2 > ((a1 - (a2 + 24) + (unint64_t)*(unsigned int *)(a1 + 4)) >> 3)) {
    OSCopyOutObjects();
  }
  if (v2)
  {
    uint64_t v5 = 0;
    uint64_t v6 = a1 + 28;
    do
    {
      unsigned int v7 = *(_DWORD *)(v6 + 8);
      if (HIBYTE(v7) == 1)
      {
        uint64_t v11 = *(OSObject **)(v4 + 8 * v5);
        if (v11)
        {
          size_t length = 0;
          uint64_t v12 = OSSerialization::createFromObject(v11);
          if (!v12) {
            OSCopyOutObjects();
          }
          size_t v13 = v12;
          uint64_t v14 = OSSerialization::finalizeBuffer(v12, &length);
          if (!v14) {
            OSCopyOutObjects();
          }
          *(_WORD *)(v6 + 8) = 257;
          *(_DWORD *)(v6 + 12) = length;
          *(void *)uint64_t v6 = v14;
          ((void (*)(OSSerialization *))v13->release)(v13);
        }
        uint64_t v10 = 16;
      }
      else
      {
        if (HIBYTE(v7)) {
          OSCopyOutObjects();
        }
        uint64_t v8 = *(void *)(v4 + 8 * v5);
        if ((*(unsigned char *)(a2 + 8) & 0x10) == 0 && v8)
        {
          if (v8 == 88 || (*(_WORD *)(v8 - 8) & 1) == 0) {
            OSCopyOutObjects();
          }
          uint64_t v8 = *(void *)(v8 - 64);
          if (!v8) {
            OSCopyOutObjects();
          }
        }
        *(_DWORD *)uint64_t v6 = v8;
        *(_DWORD *)(v6 + 4) = 0;
        *(_DWORD *)(v6 + 8) = v7 & 0xFF000000 | 0x130000;
        uint64_t v10 = 12;
      }
      v6 += v10;
      ++v5;
    }
    while (v5 < v2);
  }
  return 0;
}

uint64_t OSCopyInObjects(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a3 + 16);
  if (v3 > a2[6]) {
    OSCopyInObjects();
  }
  uint64_t v5 = a3 + 24;
  if (v3 > (((unint64_t)a2 + a2[1] - a3 - 24) >> 3)) {
    OSCopyInObjects();
  }
  if (!v3) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = a2 + 7;
  while (1)
  {
    uint64_t v24 = 0;
    unsigned int v9 = HIBYTE(v8[2]);
    if (v9 == 1) {
      break;
    }
    if (v9) {
      OSCopyInObjects();
    }
    uint64_t v10 = (OSMetaClass *)*v8;
    if (v10)
    {
      if (_OSObjectCopyIn(a1, v10, &v24)) {
        goto LABEL_22;
      }
      uint64_t v11 = v24;
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t v15 = 12;
LABEL_19:
    *(void *)(v5 + 8 * v7) = v11;
    uint64_t v8 = (unsigned int *)((char *)v8 + v15);
    if (++v7 >= v3) {
      return 0;
    }
  }
  size_t v12 = v8[3];
  if (!v12 || !*(void *)v8)
  {
    uint64_t v11 = 0;
LABEL_16:
    uint64_t v15 = 16;
    goto LABEL_19;
  }
  size_t v13 = OSSerialization::createFromBytes(*(const void **)v8, v12, &__block_literal_global_0);
  if (!v13) {
    OSCopyInObjects();
  }
  uint64_t v14 = v13;
  v8[3] = 0;
  *(void *)uint64_t v8 = 0;
  uint64_t v11 = OSSerialization::copyObject(v13);
  uint64_t v24 = v11;
  ((void (*)(OSSerialization *))v14->release)(v14);
  if (v11) {
    goto LABEL_16;
  }
LABEL_22:
  uint64_t v16 = 3758097090;
  if (v7)
  {
    unsigned int v18 = v7 - 1;
    do
    {
      uint64_t v19 = a3 + 8 * v18;
      uint64_t v22 = *(void *)(v19 + 24);
      unsigned int v21 = (void *)(v19 + 24);
      uint64_t v20 = v22;
      if (v22) {
        (*(void (**)(uint64_t))(*(void *)v20 + 16))(v20);
      }
      *unsigned int v21 = 0;
    }
    while ((unint64_t)v18--);
  }
  return v16;
}

char *astrcpy(const char *a1)
{
  size_t v2 = strlen(a1);
  unint64_t v3 = (char *)malloc_type_malloc(v2 + 1, 0xB72BF113uLL);

  return strcpy(v3, a1);
}

uint64_t OSLoadBundleByPath(uint64_t a1, char *__s1)
{
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    while (strcmp(__s1, *(const char **)v4))
    {
      uint64_t v4 = *(void *)(v4 + 16);
      if (!v4) {
        goto LABEL_4;
      }
    }
    return 3758097093;
  }
  else
  {
LABEL_4:
    uint64_t v5 = dlopen(__s1, 10);
    if (v5)
    {
      uint64_t v6 = v5;
      uint32_t v7 = _dyld_image_count();
      while (v7)
      {
        image_name = _dyld_get_image_name(--v7);
        if (!strcmp(__s1, image_name))
        {
          image_header = (mach_header_64 *)_dyld_get_image_header(v7);
          if (image_header)
          {
            OSScanClassesInMachO(a1, image_header);
            uint64_t v10 = IOMallocZeroTyped(0x20uLL, 0x10F00402688C218uLL);
            uint64_t v11 = 0;
            void *v10 = astrcpy(__s1);
            v10[1] = v6;
            v10[2] = *(void *)(a1 + 48);
            *(void *)(a1 + 48) = v10;
            return v11;
          }
          break;
        }
      }
      uint64_t v11 = 3758097084;
      dlclose(v6);
    }
    else
    {
      uint64_t v11 = 3758097084;
      size_t v12 = dlerror();
      IOLog("%s: %s\n", __s1, v12);
    }
  }
  return v11;
}

void OSScanClassesInMachO(uint64_t a1, mach_header_64 *mhp)
{
  unint64_t size = 0;
  unint64_t v3 = getsectiondata(mhp, "__DATA_CONST", "__osclassinfo", &size);
  if (v3)
  {
    uint64_t v4 = v3;
    size >>= 3;
    os_unfair_lock_lock((os_unfair_lock_t)a1);
    if (size)
    {
      unint64_t v5 = 0;
      uint64_t v6 = *(void **)(a1 + 56);
      do
      {
        for (i = (const char *)(**(void **)&v4[8 * v5] + 4); v6; uint64_t v6 = (void *)v6[2])
        {
          if (!strcmp(i, (const char *)(*(void *)*v6 + 4))) {
            OSScanClassesInMachO(i);
          }
        }
        IOLog("Found class: %s\n", i);
        uint64_t v8 = IOMallocZeroTyped(0x18uLL, 0x60040CE5A77A8uLL);
        if (!v8) {
          OSScanClassesInMachO();
        }
        uint64_t v6 = v8;
        *uint64_t v8 = *(void *)&v4[8 * v5];
        v8[2] = *(void *)(a1 + 56);
        *(void *)(a1 + 56) = v8;
        ++v5;
      }
      while (v5 < size);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
  }
}

void DriverExecutableMain(int a1, uint64_t a2)
{
  if (a1 <= 2)
  {
    IOLog("usage: %s <server name> <server tag> <bundle ID> <bundle executable path> [<bundle executable path>] ...\n", *(const char **)a2);
    exit(1);
  }
  IOUserServerMain(*(char **)(a2 + 8), *(const char **)(a2 + 16), *(const char **)(a2 + 24), a1 - 4, (char **)(a2 + 32));
  dispatch_main();
}

uint64_t IOUserServerMain(char *__s2, const char *a2, const char *a3, unsigned int a4, char **a5)
{
  unsigned int program_sdk_version = gIOExecutableSDKVersion;
  if (!gIOExecutableSDKVersion)
  {
    unsigned int program_sdk_version = dyld_get_program_sdk_version();
    gIOExecutableSDKVersion = program_sdk_version;
  }
  BOOL v11 = HIWORD(program_sdk_version) > 0x14u || strncmp("com.motu.driver", __s2, 0xFuLL) != 0;
  uint64_t v55 = 0;
  *(void *)io_main = 0;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  uint64_t v52 = 0;
  uint64_t v49 = 0;
  mach_port_array_t init_port_set = 0;
  mach_msg_type_number_t init_port_setCnt = 0;
  gIOTimerInterruptDispatchLeakFix = v11;
  pthread_key_create((pthread_key_t *)&gIOThreadTLSKey, 0);
  size_t v12 = (char *)IOMallocZeroTyped(0x1448uLL, 0x107004032C33A81uLL);
  *(_DWORD *)size_t v12 = 0;
  host_t v13 = MEMORY[0x23ECFF800]();
  if (host_get_io_main(v13, &io_main[1])) {
    IOUserServerMain_cold_10();
  }
  uint64_t v14 = (ipc_space_t *)MEMORY[0x263EF8960];
  mach_port_deallocate(*MEMORY[0x263EF8960], v13);
  if (io_registry_entry_from_path(io_main[1], "IOService:/")) {
    IOUserServerMain_cold_9();
  }
  mach_port_deallocate(*v14, io_main[1]);
  if (io_service_open_extended(io_main[0], *v14, -1728053245, *MEMORY[0x263EF80C8], 0, 0)) {
    IOUserServerMain_cold_8();
  }
  mach_port_deallocate(*v14, io_main[0]);
  if (v53)
  {
    uint64_t v34 = (FILE *)*MEMORY[0x263EF8348];
    uint64_t v35 = mach_error_string(v53);
    fprintf(v34, "open(kIOKitUserServerClientType) %s (0x%x)\n", v35, v53);
    exit(1);
  }
  IOLibInit();
  if (mach_ports_lookup(*v14, &init_port_set, &init_port_setCnt)) {
    IOUserServerMain_cold_7();
  }
  uint64_t v49 = *init_port_set;
  *((void *)v12 + 1) = __s2;
  *((_DWORD *)v12 + 4) = HIDWORD(v55);
  bufunint64_t size = 1024;
  if (_NSGetExecutablePath(v12 + 4164, &bufsize)) {
    IOUserServerMain_cold_6();
  }
  int v36 = a3;
  unsigned __int8 v37 = (IOUserServer *)__s2;
  uint64_t v54 = 0;
  HIDWORD(v53) = 0;
  LODWORD(v55) = 1;
  if (io_connect_method(SHIDWORD(v55), 4097, (int)&v49, 1, 0, 0, 0, 0, 0, (int *)&v53 + 1, &v52, (int *)&v55, 0, &v54))
  {
    IOLog("%s: kIOUserServerMethodStart failed, exiting\n", "IOUserServerMain");
    exit(0);
  }
  *((void *)v12 + 3) = v52;
  OSScanLibraries((uint64_t)v12, "/DriverKit");
  OSCollectionsInitialize();
  if (_dyld_image_count())
  {
    uint32_t v15 = 0;
    do
    {
      image_name = _dyld_get_image_name(v15);
      if ((gIODKDebug & 2) != 0) {
        IOLog("OSCollectionsRunInitializers(%s)\n", image_name);
      }
      image_header = _dyld_get_image_header(v15);
      unint64_t size = 0;
      unsigned int v18 = getsectiondata((const mach_header_64 *)image_header, "__DATA", "__osstringinfo", &size);
      if (v18)
      {
        uint64_t v19 = v18;
        size >>= 4;
        os_unfair_lock_lock((os_unfair_lock_t)v12);
        if (size)
        {
          unint64_t v20 = 0;
          unsigned int v21 = (OSStringPtr *)(v19 + 8);
          do
          {
            OSStringPtr v22 = OSString::withCStringNoCopy((const char *)*(v21 - 1));
            if (!v22) {
              IOUserServerMain_cold_5();
            }
            *unsigned int v21 = v22;
            v21 += 2;
            ++v20;
          }
          while (v20 < size);
        }
        os_unfair_lock_unlock((os_unfair_lock_t)v12);
      }
      ++v15;
    }
    while (v15 < _dyld_image_count());
  }
  if (a4)
  {
    uint64_t v23 = a4;
    do
    {
      uint64_t v24 = *a5++;
      OSLoadBundleByPath((uint64_t)v12, v24);
      --v23;
    }
    while (v23);
  }
  __endptr = 0;
  OSScanLibraries((uint64_t)v12, 0);
  BOOL v25 = (const char *)strtoll(a2, &__endptr, 0);
  if (*__endptr) {
    IOUserServerMain_cold_4();
  }
  OSStringPtr v26 = OSString::withCString(v36);
  int v28 = IOUserServer::Create(v37, v25, 0, (uint64_t)v26, (OSString *)(v12 + 40), v27);
  if (v26) {
    ((void (*)(OSStringPtr))v26->release)(v26);
  }
  if (v28) {
    IOUserServerMain_cold_3();
  }
  *(void *)(*((void *)v12 + 5) + 48) = v12;
  IODispatchQueue::Create("Root", 0, 0, (IODispatchQueue **)v12 + 4);
  if (IOService::RegisterService(*((IOService **)v12 + 5), 0)) {
    IOUserServerMain_cold_2();
  }
  if ((gIODKDebug & 2) != 0) {
    IOLog("Registered: %s\n", (const char *)v37);
  }
  unint64_t size = 0;
  p_unint64_t size = &size;
  uint64_t v45 = 0x2000000000;
  uint64_t v46 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = (IODispatchQueue **)&v39;
  uint64_t v41 = 0x2000000000;
  uint64_t v42 = 0;
  IODispatchQueue::Create("q1", 0, 0, &v46);
  IODispatchQueue::Create("q2", 0, 0, v40 + 3);
  int v29 = (IODispatchQueue *)p_size[3];
  context[0] = MEMORY[0x263EF8330];
  context[1] = 1107296256;
  context[2] = __IOUserServerMain_block_invoke;
  context[3] = &__block_descriptor_tmp_77;
  context[4] = &v39;
  context[5] = &size;
  if (__IOUserServerMain_block_invoke) {
    uint64_t v30 = (void (__cdecl *)(void *))__IOUserServerMain_block_invoke;
  }
  else {
    uint64_t v30 = 0;
  }
  IODispatchQueue::DispatchSync_f(v29, context, v30);
  (*(void (**)(unint64_t))(*(void *)p_size[3] + 16))(p_size[3]);
  ((void (*)(IODispatchQueue *))v40[3]->release)(v40[3]);
  if (init_port_setCnt)
  {
    for (unint64_t i = 0; i < init_port_setCnt; ++i)
    {
      if (mach_port_deallocate(*v14, init_port_set[i])) {
        IOUserServerMain_cold_1();
      }
    }
    vm_size_t v32 = 4 * init_port_setCnt;
  }
  else
  {
    vm_size_t v32 = 0;
  }
  mig_deallocate((vm_address_t)init_port_set, v32);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&size, 8);
  return 0;
}

uint64_t IOGetExecutableSDKVersion()
{
  uint64_t result = gIOExecutableSDKVersion;
  if (!gIOExecutableSDKVersion)
  {
    uint64_t result = dyld_get_program_sdk_version();
    gIOExecutableSDKVersion = result;
  }
  return result;
}

uint64_t IODriverKitTest()
{
  uint64_t v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x2000000000;
  v31[2] = 0;
  uint64_t v26 = 0;
  unsigned int v27 = &v26;
  uint64_t v28 = 0x2000000000;
  uint64_t v29 = 0;
  uint64_t v24 = 0;
  v25[0] = &v24;
  v25[1] = 0x2000000000;
  v25[2] = 0;
  v0 = IOMallocZeroTyped(4uLL, 0x100004052888210uLL);
  if (!v0) {
    IODriverKitTest_cold_1((uint64_t)v31);
  }
  _DWORD *v0 = 0;
  *(void *)(v31[0] + 24) = v0;
  uint64_t v1 = IORWLockAlloc();
  v27[3] = (uint64_t)v1;
  if (!v1) {
    IODriverKitTest_cold_2();
  }
  size_t v2 = IOMallocZeroTyped(8uLL, 0x100004000313F17uLL);
  if (!v2) {
    IODriverKitTest_cold_3((uint64_t)v25);
  }
  *size_t v2 = 0;
  *(void *)(v25[0] + 24) = v2;
  dispatch_group_t v3 = dispatch_group_create();
  if (!v3) {
    IODriverKitTest_cold_4();
  }
  uint64_t v4 = v3;
  dispatch_queue_t v5 = dispatch_queue_create("LockTest", MEMORY[0x263EF83A8]);
  if (!v5) {
    IODriverKitTest_cold_5();
  }
  uint64_t v6 = v5;
  uint64_t v20 = 0;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x2000000000;
  int v23 = 0;
  uint64_t v7 = MEMORY[0x263EF8330];
  int v8 = 100;
  do
  {
    block[0] = v7;
    block[1] = 1107296256;
    block[2] = ___ZL8LockTesti_block_invoke;
    block[3] = &__block_descriptor_tmp_216;
    block[4] = &v30;
    block[5] = &v20;
    dispatch_group_async(v4, v6, block);
    --v8;
  }
  while (v8);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v21 + 6) != 100) {
    IODriverKitTest_cold_8();
  }
  *((_DWORD *)v21 + 6) = 0;
  uint64_t v9 = MEMORY[0x263EF8330];
  int v10 = 100;
  do
  {
    v18[0] = v9;
    v18[1] = 1107296256;
    v18[2] = ___ZL8LockTesti_block_invoke_218;
    v18[3] = &__block_descriptor_tmp_221;
    v18[4] = &v26;
    v18[5] = &v20;
    dispatch_group_async(v4, v6, v18);
    --v10;
  }
  while (v10);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v21 + 6) != 100) {
    IODriverKitTest_cold_7();
  }
  *((_DWORD *)v21 + 6) = 0;
  uint64_t v11 = MEMORY[0x263EF8330];
  int v12 = 100;
  do
  {
    v17[0] = v11;
    v17[1] = 1107296256;
    v17[2] = ___ZL8LockTesti_block_invoke_222;
    v17[3] = &__block_descriptor_tmp_225;
    v17[4] = &v24;
    v17[5] = &v20;
    dispatch_group_async(v4, v6, v17);
    --v12;
  }
  while (v12);
  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  if (*((_DWORD *)v21 + 6) != 100) {
    IODriverKitTest_cold_6();
  }
  host_t v13 = *(void **)(v31[0] + 24);
  if (v13)
  {
    IOFree(v13, 4uLL);
    *(void *)(v31[0] + 24) = 0;
  }
  uint64_t v14 = (void *)v27[3];
  if (v14)
  {
    pthread_rwlock_destroy((pthread_rwlock_t *)v27[3]);
    IOFree(v14, 0xC8uLL);
    v27[3] = 0;
  }
  uint32_t v15 = *(void **)(v25[0] + 24);
  if (v15)
  {
    IOFree(v15, 8uLL);
    *(void *)(v25[0] + 24) = 0;
  }
  dispatch_release(v4);
  dispatch_release(v6);
  IOLog("LockTest ok\n");
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return 0;
}

void OSScanLibraries(uint64_t a1, const char *a2)
{
  if (_dyld_image_count())
  {
    uint32_t v4 = 0;
    do
    {
      image_name = _dyld_get_image_name(v4);
      uint64_t v6 = image_name;
      if (!a2 || (v7 = strlen(image_name), size_t v8 = strlen(a2), v7 >= v8) && !strncmp(&v6[v7 - v8], a2, v8))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        if (v9)
        {
          while (strcmp(v6, *(const char **)v9))
          {
            uint64_t v9 = *(void *)(v9 + 16);
            if (!v9) {
              goto LABEL_9;
            }
          }
        }
        else
        {
LABEL_9:
          int v10 = IOMallocZeroTyped(0x20uLL, 0x10F00402688C218uLL);
          uint64_t v11 = astrcpy(v6);
          void *v10 = v11;
          v10[2] = *(void *)(a1 + 48);
          *((unsigned char *)v10 + 24) = strcmp(v11, (const char *)(a1 + 4164)) == 0;
          *(void *)(a1 + 48) = v10;
          if ((gIODKDebug & 2) != 0) {
            IOLog("OSScanClassesInMachO(%s)\n", v6);
          }
          image_header = (mach_header_64 *)_dyld_get_image_header(v4);
          OSScanClassesInMachO(a1, image_header);
        }
      }
      ++v4;
    }
    while (v4 < _dyld_image_count());
  }
  os_unfair_lock_lock((os_unfair_lock_t)a1);
  do
  {
    host_t v13 = *(void **)(a1 + 56);
    if (!v13) {
      break;
    }
    char v14 = 0;
    do
    {
      if (v13[1]) {
        goto LABEL_29;
      }
      uint32_t v15 = (void *)*v13;
      uint64_t v16 = (const char *)(*(void *)*v13 + 100);
      if (!strcmp("OSMetaClassBase", v16))
      {
        uint64_t v18 = 0;
LABEL_25:
        uint64_t v19 = (char *)IOMallocZeroTyped(0x78uLL, 0x100004077774924uLL);
        if (!v19) {
          OSScanLibraries();
        }
        uint64_t v20 = v19;
        *(void *)uint64_t v19 = a1;
        *((_WORD *)v19 + 40) = 1;
        unsigned int v21 = (void ***)(v19 + 88);
        atomic_store(1u, (unsigned int *)v19 + 24);
        *((void *)v19 + 13) = v19 + 88;
        uint64_t v22 = IOMallocZeroTyped(0x28uLL, 0x1070040A716F3C8uLL);
        *((void *)v20 + 14) = v22;
        void *v22 = v15;
        v22[1] = v18;
        if (((unsigned int (*)(void ***))v15[11])(v21)) {
          OSScanLibraries();
        }
        v13[1] = v21;
        **(void **)(*v13 + 8) = v21;
        if (OSRegisterClass(a1, v21)) {
          OSScanLibraries();
        }
        char v14 = 1;
        goto LABEL_29;
      }
      int v17 = *(void **)(a1 + 56);
      if (!v17) {
LABEL_37:
      }
        OSScanLibraries(v16);
      while (strcmp(v16, (const char *)(*(void *)*v17 + 4)))
      {
        int v17 = (void *)v17[2];
        if (!v17) {
          goto LABEL_37;
        }
      }
      uint64_t v18 = v17[1];
      if (v18) {
        goto LABEL_25;
      }
LABEL_29:
      host_t v13 = (void *)v13[2];
    }
    while (v13);
  }
  while ((v14 & 1) != 0);

  os_unfair_lock_unlock((os_unfair_lock_t)a1);
}

kern_return_t IODispatchQueue::Create(const char *name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  queuea = 0;
  mach_port_name_t namea = 0;
  if (IODispatchQueue::Create_Call(name, options, priority, &queuea)) {
    IODispatchQueue::Create();
  }
  ivars = queuea->ivars;
  *((void *)ivars + 4) = options;
  if (mach_port_allocate(*MEMORY[0x263EF8960], 1u, &namea)) {
    IODispatchQueue::Create();
  }
  mach_port_name_t v8 = namea;
  *((_DWORD *)ivars + 6) = namea;
  if (IODispatchQueue::SetPort(queuea, v8, 0)) {
    IODispatchQueue::Create();
  }
  if (options)
  {
    int v12 = IORecursiveConditionLockAlloc();
    *((void *)ivars + 6) = v12;
    if (!v12) {
      IODispatchQueue::Create();
    }
    host_t v13 = IOMallocZeroTyped(0x1000uLL, 0x1080040E1BEC80AuLL);
    *((void *)ivars + 5) = v13;
    if (!v13) {
      IODispatchQueue::Create();
    }
    for (uint64_t i = 0; i != 4096; i += 64)
      pthread_cond_init((pthread_cond_t *)(*((void *)ivars + 5) + i), 0);
    uint64_t v11 = dispatch_queue_create(name, MEMORY[0x263EF83A8]);
    *(void *)ivars = v11;
    if (!v11) {
      IODispatchQueue::Create();
    }
  }
  else
  {
    inactive = dispatch_workloop_create_inactive(name);
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate(inactive);
    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2(name, 0, inactive);
    *(void *)ivars = v10;
    if (!v10) {
      IODispatchQueue::Create();
    }
    dispatch_release(inactive);
    uint64_t v11 = *(NSObject **)ivars;
  }
  dispatch_queue_set_specific(v11, &gIODispatchQueueKey, queuea, 0);
  uint64_t f = dispatch_mach_create_f();
  *((void *)ivars + 2) = f;
  if (!f) {
    IODispatchQueue::Create();
  }
  dispatch_mach_connect();
  *queue = queuea;
  return 0;
}

void __IOUserServerMain_block_invoke(int8x16_t *a1)
{
  v4[0] = MEMORY[0x263EF8330];
  int8x16_t v1 = vextq_s8(a1[2], a1[2], 8uLL);
  size_t v2 = *(IODispatchQueue **)(*(void *)(a1[2].i64[0] + 8) + 24);
  v4[1] = 1107296256;
  v4[2] = __IOUserServerMain_block_invoke_2;
  v4[3] = &__block_descriptor_tmp_74;
  int8x16_t v5 = v1;
  if (__IOUserServerMain_block_invoke_2) {
    dispatch_group_t v3 = (void (__cdecl *)(void *))__IOUserServerMain_block_invoke_2;
  }
  else {
    dispatch_group_t v3 = 0;
  }
  IODispatchQueue::DispatchSync_f(v2, v4, v3);
}

void __IOUserServerMain_block_invoke_2(uint64_t a1)
{
  v4[0] = MEMORY[0x263EF8330];
  long long v1 = *(_OWORD *)(a1 + 32);
  size_t v2 = *(IODispatchQueue **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  v4[1] = 1107296256;
  v4[2] = __IOUserServerMain_block_invoke_3;
  v4[3] = &__block_descriptor_tmp_71;
  long long v5 = v1;
  if (__IOUserServerMain_block_invoke_3) {
    dispatch_group_t v3 = (void (__cdecl *)(void *))__IOUserServerMain_block_invoke_3;
  }
  else {
    dispatch_group_t v3 = 0;
  }
  IODispatchQueue::DispatchSync_f(v2, v4, v3);
}

BOOL __IOUserServerMain_block_invoke_3(uint64_t a1)
{
  int program_sdk_version = gIOExecutableSDKVersion;
  if (!gIOExecutableSDKVersion)
  {
    int program_sdk_version = dyld_get_program_sdk_version();
    gIOExecutableSDKVersion = program_sdk_version;
  }
  IOLog("OnQueue SDK version 0x%x\n", program_sdk_version);
  if (!IODispatchQueue::OnQueue(*(IODispatchQueue **)(*(void *)(*(void *)(a1 + 32) + 8) + 24))) {
    __IOUserServerMain_block_invoke_3_cold_2();
  }
  BOOL result = IODispatchQueue::OnQueue(*(IODispatchQueue **)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if (!result) {
    __IOUserServerMain_block_invoke_3_cold_1();
  }
  return result;
}

void __copy_helper_block_8_32r40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  uint32_t v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_8_32r40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  size_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

BOOL OSObject::init(OSObject *this)
{
  return 1;
}

uint64_t non-virtual thunk to'OSObject::init(OSObject *this)
{
  return 1;
}

void non-virtual thunk to'OSObject::free(OSObject *this)
{
}

uint64_t IOUserServer::init(IOUserServer *this)
{
  return 1;
}

uint64_t non-virtual thunk to'IOUserServer::init(IOUserServer *this)
{
  return 1;
}

void IOService::free(IOService *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x20uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOUserServer::free(IOUserServer *this)
{
}

void IOUserServer::Exit_Impl(IOUserServer *this, const char *a2)
{
}

uint64_t IOUserServer::LoadModule_Impl(IOUserServer *this, char *__s1)
{
  if ((gIODKDebug & 2) != 0) {
    IOLog("Load module %s\n", __s1);
  }
  uint64_t v4 = *((void *)this + 6);

  return OSLoadBundleByPath(v4, __s1);
}

BOOL IODispatchQueue::init(IODispatchQueue *this)
{
  this->ivars = (IODispatchQueue_IVars *)IOMallocZeroTyped(0x48uLL, 0x1020040A85AFC95uLL);
  return 1;
}

uint64_t non-virtual thunk to'IODispatchQueue::init(IODispatchQueue *this)
{
  this->meta = (OSMetaClass *)IOMallocZeroTyped(0x48uLL, 0x1020040A85AFC95uLL);
  return 1;
}

kern_return_t IODispatchQueue::Cancel(IODispatchQueue *this, IODispatchQueueCancelHandler handler)
{
  size_t v2 = *(NSObject **)this->ivars;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  v4[2] = ___ZN15IODispatchQueue6CancelEU13block_pointerFvvE_block_invoke;
  v4[3] = &__block_descriptor_tmp_80;
  void v4[4] = handler;
  v4[5] = this;
  dispatch_async(v2, v4);
  return 0;
}

uint64_t ___ZN15IODispatchQueue6CancelEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  size_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = v2[5];
  if (*(void *)(v3 + 48))
  {
    (*(void (**)(void))(*v2 + 8))(*(void *)(a1 + 40));
    IORecursiveConditionLockLock(*(IORecursiveConditionLock **)(v2[5] + 48));
    uint64_t v3 = v2[5];
  }
  else
  {
    size_t v2 = 0;
  }
  *(unsigned char *)(v3 + 28) = 1;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v2)
  {
    IORecursiveConditionLockUnlock(*(IORecursiveConditionLock **)(v2[5] + 48));
    long long v5 = *(uint64_t (**)(void *))(*v2 + 16);
    return v5(v2);
  }
  return result;
}

void __copy_helper_block_8_32b(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32b(uint64_t a1)
{
}

void IODispatchQueue::free(IODispatchQueue *this)
{
  ivars = this->ivars;
  if ((*((unsigned char *)ivars + 32) & 1) == 0) {
    goto LABEL_19;
  }
  if (*((void *)ivars + 5))
  {
    for (uint64_t i = 0; i != 4096; i += 64)
      pthread_cond_destroy((pthread_cond_t *)(*((void *)this->ivars + 5) + i));
    ivars = this->ivars;
    if (*((void *)ivars + 5))
    {
      IOFree(*((void **)ivars + 5), 0x1000uLL);
      *((void *)this->ivars + 5) = 0;
      ivars = this->ivars;
    }
  }
  dispatch_release(*(dispatch_object_t *)ivars);
  *(void *)this->ivars = 0;
  ivars = this->ivars;
  if (!*((void *)ivars + 6)
    || (IOFree(*((void **)ivars + 6), 0x50uLL), *((void *)this->ivars + 6) = 0, (ivars = this->ivars) != 0))
  {
LABEL_19:
    if (*((void *)ivars + 2))
    {
      uint64_t v4 = *((void *)ivars + 2);
      MEMORY[0x270ED93C8](v4);
      return;
    }
    IOFree(ivars, 0x48uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IODispatchQueue::free(IODispatchQueue *this)
{
}

void uiomachchannel(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  switch(a2)
  {
    case 8:
      dispatch_release(*(dispatch_object_t *)(v3 + 16));
      if (*(void *)v3)
      {
        dispatch_release(*(dispatch_object_t *)v3);
        *(void *)uint64_t v3 = 0;
      }
      dispatch_queue_t v10 = *(void **)(a1 + 40);
      if (v10)
      {
        IOFree(v10, 0x48uLL);
        *(void *)(a1 + 40) = 0;
      }
      OSObjectFree((OSMetaClass *)a1);
      break;
    case 7:
      uint64_t msg = dispatch_mach_msg_get_msg();
      if ((*(_DWORD *)(msg + 8) - 1) <= 0xFFFFFFFD) {
        uiomachchannel();
      }
      mach_port_name_t v12 = *(_DWORD *)(msg + 12);
      if (v12 + 1 >= 2)
      {
        if (*(_DWORD *)(v3 + 24) != v12) {
          uiomachchannel();
        }
        if (mach_port_mod_refs(*MEMORY[0x263EF8960], v12, 1u, -1)) {
          uiomachchannel();
        }
      }
      break;
    case 2:
      uint64_t v4 = dispatch_mach_msg_get_msg();
      long long v5 = (unsigned int *)v4;
      if (*(void *)(v3 + 48))
      {
        uint64_t v6 = malloc_type_malloc(*(unsigned int *)(v4 + 4) + 16, 0x875FB153uLL);
        if (!v6) {
          uiomachchannel();
        }
        size_t v7 = v6;
        mach_port_name_t v8 = v6 + 2;
        void *v7 = a1;
        v7[1] = v8;
        memcpy(v8, v5, v5[1]);
        uint64_t v9 = *(NSObject **)v3;
        dispatch_async_f(v9, v7, (dispatch_function_t)uiomessage);
      }
      else
      {
        v13[0] = a1;
        v13[1] = v4;
        uiomessage(v13);
      }
      break;
  }
}

void IODispatchQueue::Log(const char *message, IODispatchLogFunction output)
{
  specific = (dispatch_queue_t **)dispatch_get_specific(&gIODispatchQueueKey);
  label = dispatch_queue_get_label(*specific[5]);
  output("%s queue: %s\n", message, label);
}

void IODispatchQueue::DispatchAsync(IODispatchQueue *this, IODispatchBlock block)
{
  uint64_t v3 = _Block_copy(block);
  uint64_t v4 = *(NSObject **)this->ivars;
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 0x40000000;
  blocka[2] = ___ZN15IODispatchQueue15DispatchAsync_fEPvPFvS0_E_block_invoke;
  blocka[3] = &__block_descriptor_tmp_87;
  blocka[4] = this;
  blocka[5] = IODispatchQueueBlockFunction;
  blocka[6] = v3;
  dispatch_async(v4, blocka);
}

void IODispatchQueueBlockFunction(void (**a1)(void))
{
  a1[2]();

  _Block_release(a1);
}

void ___ZN15IODispatchQueue15DispatchAsync_fEPvPFvS0_E_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  if (!*(unsigned char *)(v2 + 28))
  {
    uint64_t v4 = *(IORecursiveConditionLock **)(v2 + 48);
    if (v4)
    {
      IORecursiveConditionLockLock(v4);
      (*(void (**)(void))(a1 + 40))(*(void *)(a1 + 48));
      long long v5 = *(IORecursiveConditionLock **)(*(void *)(v1 + 40) + 48);
      IORecursiveConditionLockUnlock(v5);
    }
    else
    {
      v6[1] = v1;
      v6[0] = *(void *)(v2 + 8);
      *(void *)(v2 + 8) = v6;
      (*(void (**)(void))(a1 + 40))(*(void *)(a1 + 48));
      *(void *)(*(void *)(v1 + 40) + 8) = v6[0];
    }
  }
}

void IODispatchQueue::DispatchConcurrent(IODispatchQueue *this, IODispatchBlock block)
{
  uint64_t v3 = _Block_copy(block);

  IODispatchQueue::DispatchConcurrent_f(this, v3, (IODispatchFunction)IODispatchQueueBlockFunction);
}

void IODispatchQueue::DispatchConcurrent_f(IODispatchQueue *this, void *context, IODispatchFunction function)
{
  ivars = this->ivars;
  if (!*((void *)ivars + 6)) {
    IODispatchQueue::DispatchConcurrent_f();
  }
  uint64_t v4 = *(NSObject **)ivars;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___ZN15IODispatchQueue20DispatchConcurrent_fEPvPFvS0_E_block_invoke;
  v5[3] = &__block_descriptor_tmp_88;
  v5[4] = function;
  v5[5] = context;
  dispatch_async(v4, v5);
}

uint64_t ___ZN15IODispatchQueue20DispatchConcurrent_fEPvPFvS0_E_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

void IODispatchQueue::DispatchSync_f(IODispatchQueue *this, void *context, IODispatchFunction function)
{
  ivars = this->ivars;
  uint64_t v6 = (IORecursiveConditionLock *)*((void *)ivars + 6);
  if (v6)
  {
    IORecursiveConditionLockLock(v6);
    ((void (*)(void *))function)(context);
    size_t v7 = (IORecursiveConditionLock *)*((void *)this->ivars + 6);
    IORecursiveConditionLockUnlock(v7);
    return;
  }
  specific = dispatch_get_specific(&gIODispatchQueueKey);
  if (!specific)
  {
    uint64_t v9 = 0;
    IODispatchFunction v10 = function;
    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(specific[5] + 8);
  IODispatchFunction v10 = function;
  if (!v9)
  {
LABEL_12:
    mach_port_name_t v12 = *(NSObject **)ivars;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[5] = v9;
    void block[6] = v10;
    block[2] = ___ZN15IODispatchQueue14DispatchSync_fEPvPFvS0_E_block_invoke;
    block[3] = &__block_descriptor_tmp_89;
    block[4] = this;
    void block[7] = context;
    dispatch_sync(v12, block);
    return;
  }
  uint64_t v11 = *(uint64_t ***)(specific[5] + 8);
  while (v11[1] != (uint64_t *)this)
  {
    uint64_t v11 = (uint64_t **)*v11;
    if (!v11) {
      goto LABEL_12;
    }
  }

  ((void (*)(void *))function)(context);
}

uint64_t ___ZN15IODispatchQueue14DispatchSync_fEPvPFvS0_E_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(v1 + 40);
  if (!*(unsigned char *)(v2 + 28))
  {
    v4[0] = *(void *)(result + 40);
    v4[1] = v1;
    uint64_t v3 = *(void *)(v2 + 8);
    *(void *)(v2 + 8) = v4;
    uint64_t result = (*(uint64_t (**)(void))(result + 48))(*(void *)(result + 56));
    *(void *)(*(void *)(v1 + 40) + 8) = v3;
  }
  return result;
}

kern_return_t IODispatchQueue::SleepWithDeadline(IODispatchQueue *this, void *event, uint64_t options, uint64_t deadline)
{
  kern_return_t result;
  clockid_t v9;
  uint64_t v10;
  __uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  timespec v14;
  unint64_t v15;

  uint64_t v4 = deadline;
  __int16 v5 = options;
  uint32_t v15 = deadline;
  uint64_t result = -536870206;
  if (options > 0x87u)
  {
    if (options != 136)
    {
      if (options == 196)
      {
        IODispatchFunction v10 = mach_continuous_time();
      }
      else
      {
        if (options != 200) {
          return result;
        }
        IODispatchFunction v10 = mach_absolute_time();
      }
      uint32_t v15 = v4 - v10;
      if (v4 >= v10)
      {
        convert_mach_time_to_nsec(&v15);
        host_t v13 = v15;
      }
      else
      {
        host_t v13 = 1;
        uint32_t v15 = 1;
      }
      uint64_t v4 = clock_gettime_nsec_np(_CLOCK_REALTIME) + v13;
      goto LABEL_22;
    }
    uint64_t v9 = _CLOCK_UPTIME_RAW;
LABEL_13:
    uint64_t v11 = clock_gettime_nsec_np(v9);
    if (v4 < v11) {
      mach_port_name_t v12 = 1;
    }
    else {
      mach_port_name_t v12 = v4 - v11;
    }
    uint64_t v4 = v12 + clock_gettime_nsec_np(_CLOCK_REALTIME);
LABEL_22:
    uint32_t v15 = v4;
    goto LABEL_23;
  }
  if (!(_BYTE)options)
  {
    if (deadline) {
      IODispatchQueue::SleepWithDeadline();
    }
    goto LABEL_25;
  }
  if (options != 128)
  {
    if (options != 132) {
      return result;
    }
    uint64_t v9 = _CLOCK_MONOTONIC_RAW;
    goto LABEL_13;
  }
LABEL_23:
  if (!v4)
  {
LABEL_25:
    v14.tv_sec = 0;
    v14.int tv_nsec = 0;
    return _IODispatchQueueSleep(this->ivars, v5 & 0xFF00, event, v14);
  }
  v14.tv_sec = v4 / 0x3B9ACA00;
  v14.int tv_nsec = v4 % 0x3B9ACA00;
  return _IODispatchQueueSleep(this->ivars, v5 & 0xFF00, event, v14);
}

uint64_t convert_mach_time_to_nsec(unint64_t *a1)
{
  if (mach_timebase_info(&info)) {
    convert_mach_time_to_nsec();
  }
  uint64_t result = *a1;
  if (*a1 < 0x7FFFFFFFFFFFFFFFuLL / info.numer * info.denom) {
    return absolutetime_to_nanoseconds(result, a1);
  }
  *a1 = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t _IODispatchQueueSleep(IODispatchQueue_LocalIVars *a1, __int16 a2, void *a3, timespec a4)
{
  uint64_t v5 = 3758097090;
  timespec v25 = a4;
  uint64_t v6 = (IORecursiveConditionLock *)*((void *)a1 + 6);
  if (!v6) {
    return 3758097112;
  }
  if (a3)
  {
    if (!IORecursiveConditionLockHaveLock(v6)) {
      _IODispatchQueueSleep();
    }
    uint64_t v9 = 0;
    uint64_t v10 = *((void *)a1 + 5);
    uint64_t v11 = 48;
    while (*(void **)(v10 + v11) != a3)
    {
      ++v9;
      v11 += 64;
      if (v9 == 64) {
        goto LABEL_10;
      }
    }
    if (v10) {
      goto LABEL_15;
    }
LABEL_10:
    uint64_t v9 = 0;
    for (uint64_t i = (void *)(v10 + 48); *i; i += 8)
    {
      if (++v9 == 64) {
        return 3758097115;
      }
    }
    *uint64_t i = a3;
    i[1] = 0;
LABEL_15:
    uint64_t v13 = v10 + (v9 << 6);
    char v14 = (_DWORD *)(v13 + 56);
    ++*(_DWORD *)(v13 + 56);
    if ((a2 & 0x100) != 0) {
      int v15 = *(_DWORD *)(v13 + 60);
    }
    else {
      int v15 = 0;
    }
    uint64_t v16 = (void **)(v13 + 48);
    while (*v16 == a3 && *(_DWORD *)(v13 + 60) == v15)
    {
      uint64_t v17 = *((void *)a1 + 6);
      uint64_t v18 = *(void *)(v17 + 72);
      *(void *)(v17 + 64) = 0;
      *(void *)(v17 + 72) = 0;
      if (v25.tv_sec) {
        int v19 = pthread_cond_timedwait((pthread_cond_t *)v13, (pthread_mutex_t *)v17, &v25);
      }
      else {
        int v19 = pthread_cond_wait((pthread_cond_t *)v13, (pthread_mutex_t *)v17);
      }
      int v20 = v19;
      uint64_t v21 = *((void *)a1 + 6);
      if (*(void *)(v21 + 72)) {
        _IODispatchQueueSleep();
      }
      if (*(void *)(v21 + 64)) {
        _IODispatchQueueSleep();
      }
      *(void *)(v21 + 72) = v18;
      *(void *)(*((void *)a1 + 6) + 64) = pthread_self();
      if (v20) {
        goto LABEL_29;
      }
    }
    int v20 = 0;
LABEL_29:
    if ((*v14)-- == 1) {
      *uint64_t v16 = 0;
    }
    if (v20 == 60) {
      unsigned int v23 = -536870186;
    }
    else {
      unsigned int v23 = -536870199;
    }
    if (v20) {
      return v23;
    }
    else {
      return 0;
    }
  }
  return v5;
}

kern_return_t IODispatchQueue::SleepWithTimeout(IODispatchQueue *this, void *event, uint64_t timeout)
{
  if (timeout)
  {
    __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_REALTIME);
    v7.tv_sec = (v6 + timeout) / 0x3B9ACA00;
    v7.int tv_nsec = (v6 + timeout) % 0x3B9ACA00;
  }
  else
  {
    v7.int tv_nsec = 0;
    v7.tv_sec = 0;
  }
  ivars = this->ivars;

  return _IODispatchQueueSleep(ivars, 0, event, v7);
}

kern_return_t IODispatchQueue::WakeupWithOptions(IODispatchQueue *this, void *event, uint64_t options)
{
  kern_return_t v4;
  IORecursiveConditionLock *v5;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  uint64_t v4 = -536870206;
  uint64_t v5 = (IORecursiveConditionLock *)*((void *)this->ivars + 6);
  if (!v5) {
    return -536870184;
  }
  if (event)
  {
    timespec v7 = options;
    if (!IORecursiveConditionLockHaveLock(v5)) {
      IODispatchQueue::WakeupWithOptions();
    }
    mach_port_name_t v8 = 0;
    uint64_t v9 = *((void *)this->ivars + 5);
    while (1)
    {
      uint64_t v10 = v9 + v8;
      if (*(void **)(v9 + v8 + 48) == event) {
        break;
      }
      v8 += 64;
      if (v8 == 4096) {
        return -536870160;
      }
    }
    ++*(_DWORD *)(v10 + 60);
    if (v7) {
      uint64_t v11 = pthread_cond_broadcast((pthread_cond_t *)v10);
    }
    else {
      uint64_t v11 = pthread_cond_signal((pthread_cond_t *)v10);
    }
    if (v11) {
      IODispatchQueue::WakeupWithOptions();
    }
    return 0;
  }
  return v4;
}

kern_return_t IODispatchQueue::Wakeup(IODispatchQueue *this, void *event)
{
  return IODispatchQueue::WakeupWithOptions(this, event, 0);
}

kern_return_t IODispatchQueue::RunAction(IODispatchQueue *this, IODispatchAction action)
{
  kern_return_t v3;
  void v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  __uint64_t v6 = 0;
  timespec v7 = &v6;
  mach_port_name_t v8 = 0x2000000000;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = ___ZN15IODispatchQueue9RunActionEU13block_pointerFivE_block_invoke;
  v5[3] = &__block_descriptor_tmp_93;
  v5[4] = action;
  v5[5] = &v6;
  if (___ZN15IODispatchQueue9RunActionEU13block_pointerFivE_block_invoke) {
    uint64_t v2 = (void (__cdecl *)(void *))___ZN15IODispatchQueue9RunActionEU13block_pointerFivE_block_invoke;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v9 = 0;
  IODispatchQueue::DispatchSync_f(this, v5, v2);
  uint64_t v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ___ZN15IODispatchQueue9RunActionEU13block_pointerFivE_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __copy_helper_block_8_32b40r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
  uint64_t v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 8);
}

void __destroy_helper_block_8_32b40r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 7);
}

BOOL IODispatchSource::init(IODispatchSource *this)
{
  return 1;
}

uint64_t non-virtual thunk to'IODispatchSource::init(IODispatchSource *this)
{
  return 1;
}

void non-virtual thunk to'IODispatchSource::free(IODispatchSource *this)
{
}

kern_return_t IODispatchSource::SetEnable_Impl(IODispatchSource *this, BOOL enable)
{
  return IODispatchSource::SetEnableWithCompletion(this, enable, 0, 0);
}

kern_return_t IOInterruptDispatchSource::Create(IOService *provider, uint32_t index, IODispatchQueue *queue, IOInterruptDispatchSource **source)
{
  kern_return_t result;

  uint64_t result = IOInterruptDispatchSource::Create_Call(provider, index, queue, source);
  if (!result) {
    *((void *)(*source)->ivars + 1) = queue;
  }
  return result;
}

BOOL IOInterruptDispatchSource::init(IOInterruptDispatchSource *this)
{
  uint64_t v2 = (IOInterruptDispatchSource_IVars *)IOMallocZeroTyped(0x38uLL, 0x1020040764E79FEuLL);
  this->ivars = v2;
  *(void *)uint64_t v2 = this;
  return 1;
}

uint64_t non-virtual thunk to'IOInterruptDispatchSource::init(IOInterruptDispatchSource *this)
{
  p_ivars = (OSObject::$4342D741BF926617E558AFFE07804AA4 *)&this[-1].ivars;
  uint64_t v3 = (OSObjectInterface_vtbl *)IOMallocZeroTyped(0x38uLL, 0x1020040764E79FEuLL);
  this->IODispatchSource::OSObject::OSObjectInterface::__vftable = v3;
  v3->init = (BOOL (__cdecl *)(OSObjectInterface *__hidden))p_ivars;
  return 1;
}

void IOInterruptDispatchSource::free(IOInterruptDispatchSource *this)
{
  if (gIOTimerInterruptDispatchLeakFix)
  {
    uint64_t v2 = *((void *)this->ivars + 3);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
      *((void *)this->ivars + 3) = 0;
    }
  }
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x38uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOInterruptDispatchSource::free(IOInterruptDispatchSource *this)
{
}

kern_return_t IOInterruptDispatchSource::SetHandler_Impl(IOInterruptDispatchSource *this, OSAction *action)
{
  uint64_t v4 = *((void *)this->ivars + 3);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    *((void *)this->ivars + 3) = 0;
  }
  ((void (*)(OSAction *))action->retain)(action);
  *((void *)this->ivars + 3) = action;
  return 0;
}

kern_return_t IOInterruptDispatchSource::SetEnableWithCompletion_Impl(IOInterruptDispatchSource *this, BOOL enable, IODispatchSourceCancelHandler handler)
{
  kern_return_t v6;
  IODispatchQueue *v7;
  void (__cdecl *v8)(void *);
  void context[6];
  BOOL v11;

  __uint64_t v6 = IODispatchSource::SetEnableWithCompletion(this, enable, handler, (OSDispatchMethod)IODispatchSource::_Dispatch);
  if (!v6)
  {
    timespec v7 = (IODispatchQueue *)*((void *)this->ivars + 1);
    context[0] = MEMORY[0x263EF8330];
    context[1] = 1107296256;
    context[2] = ___ZN25IOInterruptDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke;
    context[3] = &__block_descriptor_tmp_96;
    uint64_t v11 = enable;
    context[4] = handler;
    context[5] = this;
    if (___ZN25IOInterruptDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke) {
      mach_port_name_t v8 = (void (__cdecl *)(void *))___ZN25IOInterruptDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke;
    }
    else {
      mach_port_name_t v8 = 0;
    }
    IODispatchQueue::DispatchSync_f(v7, context, v8);
  }
  return v6;
}

uint64_t ___ZN25IOInterruptDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  *(unsigned char *)(v2[6] + 32) = *(unsigned char *)(a1 + 48);
  if (*(unsigned char *)(a1 + 48) && !*(void *)(v2[6] + 16))
  {
    (*(void (**)(void *))(*v2 + 8))(v2);
    *(void *)(v2[6] + 16) = ThreadStart((void *(__cdecl *)(void *))IOInterruptDispatchSourceThread, v2);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

uint64_t IOInterruptDispatchSourceThread(_WORD *a1)
{
  kern_return_t v3;
  uint64_t v4;
  IODispatchQueue *v5;
  void (__cdecl *v6)(void *);
  kern_return_t v7;
  void context[6];
  long long v10;
  _WORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  long long v16;

  mach_port_name_t v12 = 0;
  uint64_t v13 = &v12;
  char v14 = 0x2000000000;
  int v15 = 0;
  if (a1 == (_WORD *)88 || (*(a1 - 4) & 1) == 0) {
    IOInterruptDispatchSourceThread();
  }
  uint64_t v2 = *((void *)a1 + 6);
  uint64_t v3 = iokit_user_client_trap((void *)*(unsigned int *)(*((void *)a1 - 11) + 16), 0, *((void **)a1 - 8), &v16, 0, 0, 0, 0);
  *((_DWORD *)v13 + 6) = v3;
  if (!v3)
  {
    uint64_t v4 = MEMORY[0x263EF8330];
    do
    {
      uint64_t v5 = *(IODispatchQueue **)(v2 + 8);
      context[0] = v4;
      context[1] = 1107296256;
      context[2] = ___ZL31IOInterruptDispatchSourceThreadPv_block_invoke;
      context[3] = &__block_descriptor_tmp_247;
      uint64_t v10 = v16;
      context[4] = &v12;
      context[5] = v2;
      uint64_t v11 = a1;
      if (___ZL31IOInterruptDispatchSourceThreadPv_block_invoke) {
        __uint64_t v6 = (void (__cdecl *)(void *))___ZL31IOInterruptDispatchSourceThreadPv_block_invoke;
      }
      else {
        __uint64_t v6 = 0;
      }
      IODispatchQueue::DispatchSync_f(v5, context, v6);
      timespec v7 = iokit_user_client_trap((void *)*(unsigned int *)(*((void *)a1 - 11) + 16), 0, *((void **)a1 - 8), &v16, 0, 0, 0, 0);
      *((_DWORD *)v13 + 6) = v7;
    }
    while (!v7);
  }
  (*(void (**)(_WORD *))(*(void *)a1 + 16))(a1);
  _Block_object_dispose(&v12, 8);
  return 0;
}

kern_return_t IOInterruptDispatchSource::Cancel_Impl(IOInterruptDispatchSource *this, IODispatchSourceCancelHandler handler)
{
  if (IODispatchSource::Cancel(this, 0, (OSDispatchMethod)IODispatchSource::_Dispatch)) {
    IOInterruptDispatchSource::Cancel_Impl();
  }
  uint64_t v4 = **(NSObject ***)(*((void *)this->ivars + 1) + 40);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  void v6[2] = ___ZN25IOInterruptDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke;
  v6[3] = &__block_descriptor_tmp_99;
  v6[4] = handler;
  v6[5] = this;
  dispatch_async(v4, v6);
  return 0;
}

uint64_t ___ZN25IOInterruptDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void **)(v3 + 8);
  if (*(void *)(v4[5] + 48))
  {
    (*(void (**)(void *))(*v4 + 8))(v4);
    IORecursiveConditionLockLock(*(IORecursiveConditionLock **)(*(void *)(*(void *)(*(void *)(v2 + 48) + 8)
                                                                          + 40)
                                                              + 48));
    uint64_t v3 = *(void *)(v2 + 48);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(unsigned char *)(v3 + 33) = 1;
  *(unsigned char *)(*(void *)(v2 + 48) + 32) = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v4)
  {
    IORecursiveConditionLockUnlock(*(IORecursiveConditionLock **)(v4[5] + 48));
    __uint64_t v6 = *(uint64_t (**)(void *))(*v4 + 16);
    return v6(v4);
  }
  return result;
}

kern_return_t IOInterruptDispatchSource::CheckForWork_Impl(IOInterruptDispatchSource *this, const IORPC *rpc, BOOL synchronous)
{
  kern_return_t v3;
  IOInterruptDispatchSource_IVars *ivars;
  uint64_t v5;
  IORPC v7;

  uint64_t v3 = -536870184;
  ivars = this->ivars;
  if (*((unsigned char *)ivars + 32))
  {
    if (*((void *)ivars + 3))
    {
      uint64_t v5 = *((void *)ivars + 5);
      if (v5)
      {
        *((void *)ivars + 5) = 0;
        timespec v7 = *rpc;
        return IOInterruptDispatchSource::InterruptOccurred(this, &v7, *((OSAction **)this->ivars + 3), v5, *((void *)this->ivars + 6), 0);
      }
    }
  }
  return v3;
}

kern_return_t IOServiceNotificationDispatchSource::Create(OSDictionary *matching, uint64_t options, IODispatchQueue *queue, IOServiceNotificationDispatchSource **notification)
{
  kern_return_t result;
  IOServiceNotificationDispatchSource *v7;

  uint64_t result = IOServiceNotificationDispatchSource::Create_Call(matching, options, queue, notification);
  if (result) {
    IOServiceNotificationDispatchSource::Create();
  }
  timespec v7 = *notification;
  *((void *)(*notification)->ivars + 1) = queue;
  *((unsigned char *)v7->ivars + 16) = 1;
  return result;
}

BOOL IOServiceNotificationDispatchSource::init(IOServiceNotificationDispatchSource *this)
{
  uint64_t v2 = (IOServiceNotificationDispatchSource_IVars *)IOMallocZeroTyped(0x28uLL, 0x10200400066CE25uLL);
  this->ivars = v2;
  *(void *)uint64_t v2 = this;
  return 1;
}

uint64_t non-virtual thunk to'IOServiceNotificationDispatchSource::init(IOServiceNotificationDispatchSource *this)
{
  p_ivars = (OSObject::$4342D741BF926617E558AFFE07804AA4 *)&this[-1].ivars;
  uint64_t v3 = (OSObjectInterface_vtbl *)IOMallocZeroTyped(0x28uLL, 0x10200400066CE25uLL);
  this->IODispatchSource::OSObject::OSObjectInterface::__vftable = v3;
  v3->init = (BOOL (__cdecl *)(OSObjectInterface *__hidden))p_ivars;
  return 1;
}

void IOServiceNotificationDispatchSource::free(IOServiceNotificationDispatchSource *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x28uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOServiceNotificationDispatchSource::free(IOServiceNotificationDispatchSource *this)
{
}

kern_return_t IOServiceNotificationDispatchSource::SetEnableWithCompletion_Impl(IOServiceNotificationDispatchSource *this, BOOL enable, IODispatchSourceCancelHandler handler)
{
  kern_return_t v6;
  IODispatchQueue *v7;
  void (__cdecl *v8)(void *);
  void context[6];
  BOOL v11;

  __uint64_t v6 = IODispatchSource::SetEnableWithCompletion(this, enable, handler, (OSDispatchMethod)IODispatchSource::_Dispatch);
  if (!v6)
  {
    timespec v7 = (IODispatchQueue *)*((void *)this->ivars + 1);
    context[0] = MEMORY[0x263EF8330];
    context[1] = 1107296256;
    context[2] = ___ZN35IOServiceNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke;
    context[3] = &__block_descriptor_tmp_102;
    uint64_t v11 = enable;
    context[4] = handler;
    context[5] = this;
    if (___ZN35IOServiceNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke) {
      mach_port_name_t v8 = (void (__cdecl *)(void *))___ZN35IOServiceNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke;
    }
    else {
      mach_port_name_t v8 = 0;
    }
    IODispatchQueue::DispatchSync_f(v7, context, v8);
  }
  return v6;
}

uint64_t ___ZN35IOServiceNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 48) + 16) = *(unsigned char *)(a1 + 48);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

kern_return_t IOServiceNotificationDispatchSource::Cancel_Impl(IOServiceNotificationDispatchSource *this, IODispatchSourceCancelHandler handler)
{
  uint64_t v2 = **(NSObject ***)(*((void *)this->ivars + 1) + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  void v4[2] = ___ZN35IOServiceNotificationDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke;
  v4[3] = &__block_descriptor_tmp_105;
  void v4[4] = handler;
  v4[5] = this;
  dispatch_async(v2, v4);
  return 0;
}

uint64_t ___ZN35IOServiceNotificationDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void **)(v3 + 8);
  if (*(void *)(v4[5] + 48))
  {
    (*(void (**)(void *))(*v4 + 8))(v4);
    IORecursiveConditionLockLock(*(IORecursiveConditionLock **)(*(void *)(*(void *)(*(void *)(v2 + 48) + 8)
                                                                          + 40)
                                                              + 48));
    uint64_t v3 = *(void *)(v2 + 48);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(unsigned char *)(v3 + 17) = 1;
  *(unsigned char *)(*(void *)(v2 + 48) + 16) = 0;
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v4)
  {
    IORecursiveConditionLockUnlock(*(IORecursiveConditionLock **)(v4[5] + 48));
    __uint64_t v6 = *(uint64_t (**)(void *))(*v4 + 16);
    return v6(v4);
  }
  return result;
}

kern_return_t IOServiceNotificationDispatchSource::CheckForWork_Impl(IOServiceNotificationDispatchSource *this, const IORPC *rpc, BOOL synchronous)
{
  return -536870184;
}

kern_return_t IOServiceNotificationDispatchSource::DeliverNotifications(IOServiceNotificationDispatchSource *this, IOServiceNotificationBlock block)
{
  kern_return_t v5;
  void context[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  mach_port_name_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  uint64_t v11 = -536870212;
  uint64_t v3 = (IODispatchQueue *)*((void *)this->ivars + 1);
  context[0] = MEMORY[0x263EF8330];
  context[1] = 1107296256;
  context[2] = ___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke;
  context[3] = &__block_descriptor_tmp_109;
  context[5] = &v8;
  void context[6] = this;
  context[4] = block;
  if (___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke) {
    uint64_t v4 = (void (__cdecl *)(void *))___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke;
  }
  else {
    uint64_t v4 = 0;
  }
  IODispatchQueue::DispatchSync_f(v3, context, v4);
  uint64_t v5 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

IOService *___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke(IOService *result)
{
  uint64_t v1 = (IOServiceNotificationDispatchSource *)result[1].OSObject::OSMetaClassBase::__vftable;
  if (*((unsigned char *)v1->ivars + 16))
  {
    uint64_t v2 = result;
    uint64_t options = 0;
    uint64_t type = 0;
    service = 0;
    while (1)
    {
      uint64_t result = (IOService *)IOServiceNotificationDispatchSource::CopyNextNotification(v1, &type, &service, &options, 0);
      *(_DWORD *)(*((void *)v2->ivars + 1) + 24) = result;
      if (*(_DWORD *)(*((void *)v2->ivars + 1) + 24)) {
        ___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke_cold_2();
      }
      if (type == 0xFFFFFFFF) {
        break;
      }
      (*((void (**)(void))v2->ivars + 2))();
      uint64_t result = service;
      if (service) {
        uint64_t result = (IOService *)((uint64_t (*)(IOService *))service->release)(service);
      }
      if (*(_DWORD *)(*((void *)v2->ivars + 1) + 24)) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = type == 0xFFFFFFFF;
      }
      if (v3) {
        return result;
      }
    }
    if (service) {
      ___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke_cold_1();
    }
  }
  return result;
}

OSDictionary *__cdecl IOService::CreatePropertyMatchingDictionary(const char *key, OSObjectPtr value, OSDictionary *matching)
{
  if (!value) {
    return 0;
  }
  BOOL v3 = matching;
  if (matching || (BOOL v3 = OSDictionary::withCapacity(2u)) != 0)
  {
    Object = OSDictionary::getObject(v3, "IOPropertyMatch");
    if (!Object) {
      goto LABEL_18;
    }
    OSDictionaryPtr v7 = (OSDictionaryPtr)Object;
    meta = Object->meta;
    if (meta == (OSMetaClass *)Object) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = Object->meta;
    }
    BOOL v10 = v9 != 0;
    if (v9) {
      BOOL v11 = v9 == gOSDictionaryMetaClass;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11)
    {
      do
      {
        meta = (OSMetaClass *)*((void *)meta->metaClassPrivate + 1);
        BOOL v10 = meta != 0;
        if (meta) {
          BOOL v12 = meta == gOSDictionaryMetaClass;
        }
        else {
          BOOL v12 = 1;
        }
      }
      while (!v12);
    }
    if (!v10)
    {
LABEL_18:
      OSDictionaryPtr v7 = OSDictionary::withCapacity(4u);
      OSDictionary::setObject(v3, "IOPropertyMatch", v7);
      ((void (*)(OSDictionaryPtr))v7->release)(v7);
    }
    OSDictionary::setObject(v7, key, value);
  }
  return v3;
}

OSDictionary *__cdecl IOService::CreatePropertyMatchingDictionary(const char *key, const char *stringValue, OSDictionary *matching)
{
  OSStringPtr v5 = OSString::withCString(stringValue);
  if (!v5) {
    IOService::CreatePropertyMatchingDictionary();
  }
  OSStringPtr v6 = v5;
  PropertyMatchingDictionary = IOService::CreatePropertyMatchingDictionary(key, v5, matching);
  ((void (*)(OSStringPtr))v6->release)(v6);
  return PropertyMatchingDictionary;
}

OSDictionary *__cdecl IOService::CreateKernelClassMatchingDictionary(OSString *className, OSDictionary *matching)
{
  if (!className) {
    return 0;
  }
  uint64_t v2 = matching;
  if (matching || (uint64_t v2 = OSDictionary::withCapacity(2u)) != 0) {
    OSDictionary::setObject(v2, "IOProviderClass", className);
  }
  return v2;
}

OSDictionary *__cdecl IOService::CreateKernelClassMatchingDictionary(const char *className, OSDictionary *matching)
{
  BOOL v3 = OSString::withCString(className);
  KernelClassMatchingDictionary = IOService::CreateKernelClassMatchingDictionary(v3, matching);
  if (v3) {
    ((void (*)(OSString *))v3->release)(v3);
  }
  return KernelClassMatchingDictionary;
}

OSDictionary *__cdecl IOService::CreateUserClassMatchingDictionary(OSString *className, OSDictionary *matching)
{
  return IOService::CreatePropertyMatchingDictionary("IOUserClass", className, matching);
}

OSDictionary *__cdecl IOService::CreateUserClassMatchingDictionary(const char *className, OSDictionary *matching)
{
  return IOService::CreatePropertyMatchingDictionary("IOUserClass", className, matching);
}

OSDictionary *__cdecl IOService::CreateNameMatchingDictionary(OSString *serviceName, OSDictionary *matching)
{
  if (!serviceName) {
    return 0;
  }
  uint64_t v2 = matching;
  if (matching || (uint64_t v2 = OSDictionary::withCapacity(2u)) != 0) {
    OSDictionary::setObject(v2, "IONameMatch", serviceName);
  }
  return v2;
}

OSDictionary *__cdecl IOService::CreateNameMatchingDictionary(const char *serviceName, OSDictionary *matching)
{
  BOOL v3 = OSString::withCString(serviceName);
  NameMatchingDictionary = IOService::CreateNameMatchingDictionary(v3, matching);
  if (v3) {
    ((void (*)(OSString *))v3->release)(v3);
  }
  return NameMatchingDictionary;
}

BOOL IODataQueueDispatchSource::init(IODataQueueDispatchSource *this)
{
  uint64_t returnAddress;

  uint64_t v2 = (IODataQueueDispatchSource_IVars *)IOMallocZeroTyped(0x38uLL, 0x10200402722E754uLL);
  this->ivars = v2;
  *((void *)v2 + 1) = this;
  if (IODataQueueDispatchSource::CopyMemory(this, (IOMemoryDescriptor **)this->ivars + 2, 0)) {
    IODataQueueDispatchSource::init();
  }
  uint64_t v4 = 0;
  returnAddress = 0;
  if (IOMemoryDescriptor::Map(*((IOMemoryDescriptor **)this->ivars + 2), 0, 0, 0, 0, &returnAddress, &v4)) {
    IODataQueueDispatchSource::init();
  }
  *(void *)this->ivars = returnAddress;
  *((_DWORD *)this->ivars + 12) = v4;
  return 1;
}

kern_return_t IOMemoryDescriptor::Map(IOMemoryDescriptor *this, uint64_t options, uint64_t address, uint64_t length, uint64_t alignment, uint64_t *returnAddress, uint64_t *returnLength)
{
  kern_return_t v10;
  kern_return_t v11;
  const OSArray *v12;
  OSArrayPtr v13;
  IOMemoryDescriptor_IVars *ivars;
  IOMemoryMap *v15;
  IOMemoryMap *map;

  map = 0;
  BOOL v10 = IOMemoryDescriptor::CreateMapping(this, options, address, 0, length, alignment, &map, 0);
  BOOL v11 = v10;
  if (v10)
  {
    IOLog("CreateMapping fail(0x%x)\n", v10);
  }
  else
  {
    BOOL v12 = (const OSArray *)*((void *)this->ivars + 2);
    if (!v12)
    {
      uint64_t v13 = OSArray::withCapacity(8u);
      ivars = this->ivars;
      if (*((void *)ivars + 2)) {
        IOMemoryDescriptor::Map();
      }
      *((void *)ivars + 2) = v13;
      BOOL v12 = (const OSArray *)*((void *)this->ivars + 2);
    }
    if (OSArray::getNextIndexOfObject(v12, map, 0) == -1) {
      OSArray::setObject(*((OSArray **)this->ivars + 2), map);
    }
    ((void (*)(IOMemoryMap *))map->release)(map);
    int v15 = map;
    *returnAddress = *((void *)map->ivars + 3);
    *returnLength = *(void *)v15->ivars;
  }
  return v11;
}

uint64_t non-virtual thunk to'IODataQueueDispatchSource::init(IODataQueueDispatchSource *this)
{
  return 1;
}

kern_return_t IODataQueueDispatchSource::CheckForWork_Impl(IODataQueueDispatchSource *this, const IORPC *rpc, BOOL synchronous)
{
  return -536870184;
}

void IODataQueueDispatchSource::SendDataAvailable(IODataQueueDispatchSource *this)
{
  kern_return_t v3;
  OSAction *v4;
  uint64_t vars8;

  ivars = this->ivars;
  if (!*((void *)ivars + 3))
  {
    BOOL v3 = IODataQueueDispatchSource::CopyDataAvailableHandler(this, (OSAction **)ivars + 3, 0);
    ivars = this->ivars;
    if (v3)
    {
      *((void *)ivars + 3) = 0;
      ivars = this->ivars;
    }
  }
  uint64_t v4 = (OSAction *)*((void *)ivars + 3);
  if (v4)
  {
    IODataQueueDispatchSource::DataAvailable(this, v4, 0);
  }
}

void IODataQueueDispatchSource::SendDataServiced(IODataQueueDispatchSource *this)
{
  kern_return_t v3;
  OSAction *v4;
  uint64_t vars8;

  ivars = (OSAction **)this->ivars;
  if (!ivars[4])
  {
    BOOL v3 = IODataQueueDispatchSource::CopyDataServicedHandler(this, ivars + 4, 0);
    ivars = (OSAction **)this->ivars;
    if (v3)
    {
      ivars[4] = 0;
      ivars = (OSAction **)this->ivars;
    }
  }
  if (ivars[4])
  {
    LOBYTE((*ivars)->refcount) = 0;
    uint64_t v4 = (OSAction *)*((void *)this->ivars + 4);
    IODataQueueDispatchSource::DataServiced(this, v4, 0);
  }
}

kern_return_t IODataQueueDispatchSource::SetEnableWithCompletion_Impl(IODataQueueDispatchSource *this, BOOL enable, IODispatchSourceCancelHandler handler)
{
  *((unsigned char *)this->ivars + 52) = enable;
  return 0;
}

void IODataQueueDispatchSource::free(IODataQueueDispatchSource *this)
{
  ivars = this->ivars;
  uint64_t v3 = *((void *)ivars + 2);
  if (v3)
  {
    (*(void (**)(void))(*(void *)v3 + 16))(*((void *)ivars + 2));
    *((void *)this->ivars + 2) = 0;
    ivars = this->ivars;
  }
  uint64_t v4 = *((void *)ivars + 3);
  if (v4)
  {
    (*(void (**)(void))(*(void *)v4 + 16))(*((void *)ivars + 3));
    *((void *)this->ivars + 3) = 0;
    ivars = this->ivars;
  }
  uint64_t v5 = *((void *)ivars + 4);
  if (!v5
    || ((*(void (**)(void))(*(void *)v5 + 16))(*((void *)ivars + 4)),
        *((void *)this->ivars + 4) = 0,
        (ivars = this->ivars) != 0))
  {
    IOFree(ivars, 0x38uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IODataQueueDispatchSource::free(IODataQueueDispatchSource *this)
{
}

kern_return_t IODataQueueDispatchSource::Cancel_Impl(IODataQueueDispatchSource *this, IODispatchSourceCancelHandler handler)
{
  if (handler) {
    (*((void (**)(IODispatchSourceCancelHandler))handler + 2))(handler);
  }
  return 0;
}

BOOL IODataQueueDispatchSource::IsDataAvailable(IODataQueueDispatchSource *this)
{
  uint64_t v1 = *(_DWORD **)this->ivars;
  return v1 && *v1 != v1[1];
}

kern_return_t IODataQueueDispatchSource::Peek(IODataQueueDispatchSource *this, IODataQueueClientDequeueEntryBlock callback)
{
  kern_return_t result;
  atomic_uint *v4;
  uint64_t v5;
  unint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  BOOL v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v19;
  uint64_t v20;

  uint64_t result = -536870212;
  uint64_t v4 = *(atomic_uint **)this->ivars;
  if (!v4) {
    return -536870211;
  }
  uint64_t v5 = *v4;
  if (v5 == atomic_load_explicit(v4 + 1, memory_order_acquire)) {
    return -536870169;
  }
  OSStringPtr v6 = *((unsigned int *)this->ivars + 12);
  if (v5 <= v6)
  {
    OSDictionaryPtr v7 = (atomic_uint *)((char *)v4 + v5 + 128);
    mach_port_name_t v8 = *v7 + 3;
    uint64_t v9 = v8 << 31 >> 31;
    if (v9 == v8 && (v9 & 0x8000000000000000) == 0)
    {
      BOOL v10 = v9 & 0xFFFFFFFC;
      BOOL v11 = v5 + 4;
      uint64_t v13 = v5 > 0xFFFFFFFB || v11 > v6 || v11 > ~v10;
      char v14 = (v10 + v5) + 4;
      if (!v13 && v14 <= v6)
      {
        int v19 = v7 + 1;
        LODWORD(v20) = *v7;
LABEL_26:
        (*((void (**)(IODataQueueClientDequeueEntryBlock, unsigned int *, void))callback + 2))(callback, v19, v20);
        return 0;
      }
      int v20 = v4[32];
      uint64_t v16 = (v20 + 3) << 31 >> 31;
      if (v16 == v20 + 3 && (v16 & 0x8000000000000000) == 0)
      {
        uint64_t v17 = ((v20 + 3) << 31 >> 31) & 0xFFFFFFFCLL;
        if (v17 != 4294967292 && v17 + 4 <= v6)
        {
          int v19 = (unsigned int *)(v4 + 33);
          goto LABEL_26;
        }
      }
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::Dequeue(IODataQueueDispatchSource *this, IODataQueueClientDequeueEntryBlock callback)
{
  kern_return_t v3;
  BOOL sendDataServiced;

  sendDataServiced = 0;
  uint64_t v3 = IODataQueueDispatchSource::DequeueWithCoalesce(this, &sendDataServiced, callback);
  if (sendDataServiced) {
    IODataQueueDispatchSource::SendDataServiced(this);
  }
  return v3;
}

kern_return_t IODataQueueDispatchSource::DequeueWithCoalesce(IODataQueueDispatchSource *this, BOOL *sendDataServiced, IODataQueueClientDequeueEntryBlock callback)
{
  kern_return_t result;
  unsigned int *v5;
  uint64_t v7;
  unsigned int explicit;
  unint64_t v9;
  unsigned int *v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  BOOL v25;

  uint64_t result = -536870212;
  uint64_t v5 = *(unsigned int **)this->ivars;
  if (!v5) {
    return -536870211;
  }
  OSDictionaryPtr v7 = *v5;
  explicit = atomic_load_explicit((atomic_uint *volatile)v5 + 1, memory_order_acquire);
  if (v7 == explicit)
  {
    uint64_t result = -536870169;
    if (*((unsigned char *)v5 + 8)) {
      *sendDataServiced = 1;
    }
    return result;
  }
  uint64_t v9 = *((unsigned int *)this->ivars + 12);
  if (v7 <= v9)
  {
    BOOL v10 = v5 + 32;
    BOOL v11 = (unsigned int *)((char *)v5 + v7 + 128);
    BOOL v12 = *v11;
    uint64_t v13 = (v12 + 3) << 31 >> 31;
    if (v13 == v12 + 3 && (v13 & 0x8000000000000000) == 0)
    {
      char v14 = ((v12 + 3) << 31 >> 31) & 0xFFFFFFFCLL;
      int v15 = v7 + 4;
      uint64_t v16 = v7 > 0xFFFFFFFB || v15 > v9;
      if (v16) {
        uint64_t v17 = 1;
      }
      else {
        uint64_t v17 = v15 > ~v14;
      }
      uint64_t v18 = (v14 + v7) + 4;
      if (v17 || v18 > v9)
      {
        BOOL v12 = *v10;
        int v20 = (v12 + 3) << 31 >> 31;
        if (v20 != v12 + 3 || v20 < 0) {
          return result;
        }
        uint64_t v21 = ((v12 + 3) << 31 >> 31) & 0xFFFFFFFCLL;
        uint64_t v18 = v21 + 4;
        if (v21 == 4294967292 || v18 > v9) {
          return result;
        }
      }
      else
      {
        uint64_t v16 = (v13 != -5) & __CFADD__(v13, 5);
        unsigned int v23 = ~v7;
        uint64_t v24 = v14 + 4 + v7;
        if (v16) {
          timespec v25 = 1;
        }
        else {
          timespec v25 = v14 + 4 > v23;
        }
        if (v25 || v24 > v9) {
          return result;
        }
        BOOL v10 = v11;
      }
      (*((void (**)(IODataQueueClientDequeueEntryBlock, unsigned int *, void))callback + 2))(callback, v10 + 1, v12);
      if (*((unsigned char *)v5 + 8)) {
        *sendDataServiced = 1;
      }
      atomic_store(v18, v5);
      uint64_t result = 0;
      if (explicit == v18) {
        __dmb(0xBu);
      }
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::Enqueue(IODataQueueDispatchSource *this, uint32_t dataSize, IODataQueueClientEnqueueEntryBlock callback)
{
  kern_return_t v4;
  BOOL sendDataAvailable;

  sendDataAvailable = 0;
  uint64_t v4 = IODataQueueDispatchSource::EnqueueWithCoalesce(this, dataSize, &sendDataAvailable, callback);
  if (sendDataAvailable) {
    IODataQueueDispatchSource::SendDataAvailable(this);
  }
  return v4;
}

kern_return_t IODataQueueDispatchSource::EnqueueWithCoalesce(IODataQueueDispatchSource *this, uint32_t dataSize, BOOL *sendDataAvailable, IODataQueueClientEnqueueEntryBlock callback)
{
  kern_return_t result;
  IODataQueueDispatchSource_IVars *ivars;
  uint64_t v7;
  unsigned int v10;
  uint64_t v11;
  unsigned int explicit;
  uint64_t v13;
  uint64_t v14;
  int v16;
  unsigned int v17;

  uint64_t result = -536870168;
  ivars = this->ivars;
  OSDictionaryPtr v7 = *(void *)ivars;
  if (!*(void *)ivars) {
    return -536870211;
  }
  BOOL v10 = *((_DWORD *)ivars + 12);
  BOOL v11 = *(unsigned int *)(v7 + 4);
  explicit = atomic_load_explicit((atomic_uint *volatile)v7, memory_order_acquire);
  uint64_t v13 = dataSize + 3;
  char v14 = v13 << 31 >> 31;
  if (v14 == v13 && (v14 & 0x8000000000000000) == 0 && (~v14 & 0xFFFFFFFC) != 0)
  {
    if (v10 < v11 || v10 < explicit) {
      return -536870169;
    }
    uint64_t v16 = v14 & 0xFFFFFFFC;
    uint64_t v17 = (v14 & 0xFFFFFFFC) + 4;
    if (explicit <= v11)
    {
      if (!__CFADD__(v11, v17) && v11 + v17 <= v10) {
        goto LABEL_21;
      }
      if (explicit > v17)
      {
        (*((void (**)(IODataQueueClientEnqueueEntryBlock, uint64_t))callback + 2))(callback, v7 + 132);
        *(_DWORD *)(v7 + 128) = dataSize;
        if (v10 - v11 >= 4) {
          *(_DWORD *)(v11 + v7 + 128) = v16;
        }
        goto LABEL_22;
      }
    }
    else if (explicit - v11 > v17)
    {
LABEL_21:
      (*((void (**)(IODataQueueClientEnqueueEntryBlock, uint64_t))callback + 2))(callback, v7 + v11 + 132);
      *(_DWORD *)(v7 + v11 + 128) = dataSize;
      v17 += v11;
LABEL_22:
      atomic_store(v17, (unsigned int *)(v7 + 4));
      if (v11 == explicit)
      {
        uint64_t result = 0;
        goto LABEL_25;
      }
      uint64_t result = 0;
      __dmb(0xBu);
      if (v11 == *(_DWORD *)v7) {
        goto LABEL_25;
      }
      return result;
    }
    *(unsigned char *)(v7 + 8) = 1;
LABEL_25:
    *sendDataAvailable = 1;
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::CanEnqueueData(IODataQueueDispatchSource *this, uint32_t dataSize)
{
  return IODataQueueDispatchSource::CanEnqueueData(this, dataSize, 1u);
}

kern_return_t IODataQueueDispatchSource::CanEnqueueData(IODataQueueDispatchSource *this, uint32_t dataSize, uint32_t entryCount)
{
  kern_return_t result;
  IODataQueueDispatchSource_IVars *ivars;
  atomic_uint *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int explicit;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint32_t v15;

  uint64_t result = -536870168;
  ivars = this->ivars;
  OSStringPtr v6 = *(atomic_uint **)ivars;
  if (!*(void *)ivars) {
    return -536870211;
  }
  OSDictionaryPtr v7 = *((_DWORD *)ivars + 12);
  mach_port_name_t v8 = v6[1];
  explicit = atomic_load_explicit(v6, memory_order_acquire);
  BOOL v10 = dataSize + 3;
  BOOL v11 = v10 << 31 >> 31;
  if (v11 == v10 && (v11 & 0x8000000000000000) == 0)
  {
    BOOL v12 = ((v10 << 31 >> 31) & 0xFFFFFFFCLL) + 4;
    if ((v12 & 0x100000000) == 0)
    {
      uint64_t v13 = v7 - v8;
      if (v7 < v8 || v7 < explicit) {
        return -536870212;
      }
      if (v8 < explicit)
      {
        if ((explicit + ~v8) / v12 < entryCount) {
          return result;
        }
        return 0;
      }
      int v15 = explicit / v12 + v13 / v12;
      if (v13 / v12 >= entryCount || v15 > entryCount) {
        return 0;
      }
    }
  }
  return result;
}

size_t IODataQueueDispatchSource::GetDataQueueEntryHeaderSize(void)
{
  return 4;
}

kern_return_t IOTimerDispatchSource::Create_Impl(IODispatchQueue *queue, IOTimerDispatchSource **source)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v11 = 0;
  if (OSObjectAllocate(gIOTimerDispatchSourceMetaClass, 0, &v11)) {
    IOTimerDispatchSource::Create_Impl();
  }
  uint64_t v4 = (IOTimerDispatchSource *)v11;
  ((void (*)(OSObject *))v11->init)(v11);
  *((void *)v4->ivars + 1) = queue;
  ivars = queue->ivars;
  if (*((void *)ivars + 6))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    *(_OWORD *)__str = 0u;
    long long v13 = 0u;
    label = dispatch_queue_get_label(*(dispatch_queue_t *)ivars);
    snprintf(__str, 0x80uLL, "IOTimerDispatchSourceQueue-%s-%p", label, v4);
    OSDictionaryPtr v7 = dispatch_queue_create_with_target_V2(__str, 0, **(dispatch_queue_t **)(*((void *)v4->ivars + 1) + 40));
    *((void *)v4->ivars + 4) = v7;
  }
  else
  {
    OSDictionaryPtr v7 = *(NSObject **)ivars;
  }
  mach_port_name_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v7);
  *((void *)v4->ivars + 3) = v8;
  if (!v8) {
    IOTimerDispatchSource::Create_Impl();
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = ___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke;
  handler[3] = &__block_descriptor_tmp_119;
  handler[4] = v4;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*((dispatch_object_t *)v4->ivars + 3));
  *source = v4;
  return 0;
}

void ___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(IODispatchQueue **)(v3 + 8);
  ivars = v4->ivars;
  if (*((void *)ivars + 6))
  {
    context[0] = MEMORY[0x263EF8330];
    context[1] = 0x40000000;
    context[2] = ___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke_2;
    context[3] = &__block_descriptor_tmp_118;
    context[4] = v2;
    if (___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke_2) {
      OSStringPtr v6 = (void (__cdecl *)(void *))___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke_2;
    }
    else {
      OSStringPtr v6 = 0;
    }
    IODispatchQueue::DispatchSync_f(v4, context, v6);
  }
  else if (*(unsigned char *)(v3 + 64))
  {
    v7[1] = *(void *)(v3 + 8);
    v7[0] = *((void *)ivars + 1);
    *((void *)ivars + 1) = v7;
    IODispatchSource::CheckForWork(*(IODispatchSource **)(a1 + 32), 1, 0);
    *(void *)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 48) + 8) + 40) + 8) = v7[0];
  }
}

IODispatchSource *___ZN21IOTimerDispatchSource11Create_ImplEP15IODispatchQueuePPS__block_invoke_2(uint64_t a1)
{
  uint64_t result = *(IODispatchSource **)(a1 + 32);
  if (LOBYTE(result[1].OSObject::OSMetaClassBase::__vftable[1].retain)) {
    return (IODispatchSource *)IODispatchSource::CheckForWork(result, 1, 0);
  }
  return result;
}

kern_return_t IOTimerDispatchSource::SetHandler_Impl(IOTimerDispatchSource *this, OSAction *action)
{
  uint64_t v4 = *((void *)this->ivars + 2);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    *((void *)this->ivars + 2) = 0;
  }
  ((void (*)(OSAction *))action->retain)(action);
  *((void *)this->ivars + 2) = action;
  return 0;
}

kern_return_t IOTimerDispatchSource::SetEnableWithCompletion_Impl(IOTimerDispatchSource *this, BOOL enable, IODispatchSourceCancelHandler handler)
{
  *((unsigned char *)this->ivars + 64) = enable;
  return 0;
}

BOOL IOTimerDispatchSource::init(IOTimerDispatchSource *this)
{
  uint64_t v2 = (IOTimerDispatchSource_IVars *)IOMallocZeroTyped(0x48uLL, 0x1020040BF833E4AuLL);
  this->ivars = v2;
  *(void *)uint64_t v2 = this;
  return 1;
}

uint64_t non-virtual thunk to'IOTimerDispatchSource::init(IOTimerDispatchSource *this)
{
  p_ivars = (OSObject::$4342D741BF926617E558AFFE07804AA4 *)&this[-1].IODispatchSource::OSObject::ivars;
  uint64_t v3 = (OSObjectInterface_vtbl *)IOMallocZeroTyped(0x48uLL, 0x1020040BF833E4AuLL);
  this->IODispatchSource::OSObject::OSObjectInterface::__vftable = v3;
  v3->init = (BOOL (__cdecl *)(OSObjectInterface *__hidden))p_ivars;
  return 1;
}

void IOTimerDispatchSource::free(IOTimerDispatchSource *this)
{
  dispatch_release(*((dispatch_object_t *)this->ivars + 3));
  uint64_t v2 = *((void *)this->ivars + 4);
  if (v2) {
    dispatch_release(v2);
  }
  ivars = this->ivars;
  if (gIOTimerInterruptDispatchLeakFix)
  {
    uint64_t v4 = *((void *)ivars + 2);
    if (v4)
    {
      (*(void (**)(void))(*(void *)v4 + 16))(*((void *)ivars + 2));
      ivars = this->ivars;
      *((void *)ivars + 2) = 0;
    }
  }
  else if (!ivars)
  {
    goto LABEL_8;
  }
  IOFree(ivars, 0x48uLL);
  this->ivars = 0;
LABEL_8:

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOTimerDispatchSource::free(IOTimerDispatchSource *this)
{
}

kern_return_t IOTimerDispatchSource::Cancel_Impl(IOTimerDispatchSource *this, IODispatchSourceCancelHandler handler)
{
  uint64_t v3 = *((void *)this->ivars + 3);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = ___ZN21IOTimerDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke;
  v5[3] = &__block_descriptor_tmp_122;
  v5[4] = handler;
  v5[5] = this;
  dispatch_source_set_cancel_handler(v3, v5);
  dispatch_source_cancel(*((dispatch_source_t *)this->ivars + 3));
  return 0;
}

IORecursiveConditionLock *___ZN21IOTimerDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(v2 + 48);
  uint64_t v4 = *(void **)(v3 + 8);
  uint64_t v5 = v4[5];
  if (*(void *)(v5 + 48))
  {
    (*(void (**)(void *))(*v4 + 8))(v4);
    IORecursiveConditionLockLock(*(IORecursiveConditionLock **)(v4[5] + 48));
    uint64_t v3 = *(void *)(v2 + 48);
  }
  else
  {
    v8[1] = *(void *)(v3 + 8);
    v8[0] = *(void *)(v5 + 8);
    *(void *)(v5 + 8) = v8;
  }
  *(_WORD *)(v3 + 64) = 256;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = v4[5];
  uint64_t result = *(IORecursiveConditionLock **)(v6 + 48);
  if (result)
  {
    IORecursiveConditionLockUnlock(result);
    return (IORecursiveConditionLock *)(*(uint64_t (**)(void *))(*v4 + 16))(v4);
  }
  else
  {
    *(void *)(v6 + 8) = v8[0];
  }
  return result;
}

kern_return_t IOTimerDispatchSource::WakeAtTime_Impl(IOTimerDispatchSource *this, uint64_t options, uint64_t deadline, uint64_t leeway)
{
  kern_return_t v6;
  unint64_t v7;
  IODispatchQueue *v8;
  void (__cdecl *v9)(void *);
  void context[10];
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;

  uint64_t v4 = options;
  uint64_t v6 = -536870206;
  long long v17 = leeway;
  long long v18 = deadline;
  long long v13 = 0;
  long long v14 = &v13;
  long long v15 = 0x2000000000;
  long long v16 = 0;
  if (options > 0xC3u)
  {
    if (options != 196 && options != 200) {
      goto LABEL_25;
    }
  }
  else if (options - 128 > 8 || ((1 << (options + 0x80)) & 0x111) == 0)
  {
    if ((_BYTE)options) {
      goto LABEL_25;
    }
    uint64_t v4 = options & 0xFFFFFFFFFFFFFF00 | 0xC8;
  }
  if (deadline <= 1)
  {
    deadline = 2;
    long long v18 = 2;
  }
  if ((v4 & 0x40) != 0)
  {
    convert_mach_time_to_nsec(&v18);
    convert_mach_time_to_nsec(&v17);
    deadline = v18;
  }
  BOOL v12 = 0;
  if (deadline > 0x3FFFFFFFFFFFFFFELL)
  {
    OSDictionaryPtr v7 = -1;
  }
  else if ((v4 & 0x3F) != 0)
  {
    BOOL v12 = deadline;
    nanoseconds_to_absolutetime(deadline, &v12);
    if ((v4 & 0x3F) == 4) {
      OSDictionaryPtr v7 = v12 | 0x8000000000000000;
    }
    else {
      OSDictionaryPtr v7 = v12;
    }
  }
  else
  {
    OSDictionaryPtr v7 = -(uint64_t)deadline;
  }
  mach_port_name_t v8 = (IODispatchQueue *)*((void *)this->ivars + 1);
  context[0] = MEMORY[0x263EF8330];
  context[1] = 1107296256;
  context[2] = ___ZN21IOTimerDispatchSource15WakeAtTime_ImplEyyy_block_invoke;
  context[3] = &__block_descriptor_tmp_123;
  context[4] = &v13;
  void context[5] = this;
  void context[6] = v4;
  context[7] = v18;
  context[8] = v17;
  context[9] = v7;
  if (___ZN21IOTimerDispatchSource15WakeAtTime_ImplEyyy_block_invoke) {
    uint64_t v9 = (void (__cdecl *)(void *))___ZN21IOTimerDispatchSource15WakeAtTime_ImplEyyy_block_invoke;
  }
  else {
    uint64_t v9 = 0;
  }
  IODispatchQueue::DispatchSync_f(v8, context, v9);
  if (*((unsigned char *)v14 + 24)) {
    uint64_t v6 = -536870185;
  }
  else {
    uint64_t v6 = 0;
  }
LABEL_25:
  _Block_object_dispose(&v13, 8);
  return v6;
}

void ___ZN21IOTimerDispatchSource15WakeAtTime_ImplEyyy_block_invoke(void *a1)
{
  uint64_t v1 = *(void *)(a1[5] + 48);
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = *(unsigned char *)(v1 + 65);
  if (!*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    *(void *)(v1 + 56) = a1[6];
    *(void *)(v1 + 40) = a1[7];
    *(void *)(v1 + 48) = a1[8];
    *(unsigned char *)(v1 + 64) = 1;
    dispatch_source_set_timer(*(dispatch_source_t *)(v1 + 24), a1[9], 0xFFFFFFFFFFFFFFFFLL, a1[8]);
  }
}

void __copy_helper_block_8_32r(uint64_t a1, uint64_t a2)
{
}

void __destroy_helper_block_8_32r(uint64_t a1)
{
}

kern_return_t IOTimerDispatchSource::CheckForWork_Impl(IOTimerDispatchSource *this, const IORPC *rpc, BOOL synchronous)
{
  kern_return_t v5;
  __uint64_t v6;
  IOTimerDispatchSource_IVars *ivars;
  OSAction *v8;
  uint64_t v9;
  IORPC v11;
  uint64_t time;

  uint64_t v5 = -536870184;
  uint64_t v6 = clock_gettime_nsec_np((clockid_t)(*((_DWORD *)this->ivars + 14) & 0x3F));
  time = v6;
  ivars = this->ivars;
  mach_port_name_t v8 = (OSAction *)*((void *)ivars + 2);
  if (v8)
  {
    uint64_t v9 = v6;
    if (*((void *)ivars + 5) - 1 < v6)
    {
      *((void *)ivars + 5) = 0;
      if ((*((unsigned char *)ivars + 56) & 0x40) != 0)
      {
        if (v6 < 0x7FFFFFFFFFFFFFFFLL)
        {
          nanoseconds_to_absolutetime(v6, &time);
          mach_port_name_t v8 = (OSAction *)*((void *)this->ivars + 2);
          uint64_t v9 = time;
        }
        else
        {
          time = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      BOOL v11 = *rpc;
      return IOTimerDispatchSource::TimerOccurred(this, &v11, v8, v9, 0);
    }
  }
  return v5;
}

kern_return_t OSAction::Create(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSAction **action)
{
  return OSAction::CreateWithTypeName(target, targetmsgid, msgid, referenceSize, 0, action);
}

kern_return_t OSAction::CreateWithTypeName(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSString *typeName, OSAction **action)
{
  kern_return_t v11;
  OSAction *v12;
  OSAction_IVars *v13;
  OSAction_IVars *ivars;

  BOOL v10 = target;
  if (target && (target == (OSObject *)88 || ((uint64_t)target[-1].ivars & 1) == 0 || !target[-2].meta)) {
    target = 0;
  }
  BOOL v11 = OSAction::CreateWithTypeName_Call(target, targetmsgid, msgid, 0, typeName, action);
  if (!v11)
  {
    BOOL v12 = *action;
    long long v13 = (OSAction_IVars *)IOMallocZeroTyped(referenceSize + 120, 0x100004077774924uLL);
    v12->ivars = v13;
    *(void *)long long v13 = v10;
    *((void *)v12->ivars + 1) = targetmsgid;
    *((void *)v12->ivars + 2) = msgid;
    *((void *)v12->ivars + 14) = referenceSize;
    ivars = v12->ivars;
    *((void *)ivars + 5) = 850045857;
    *((void *)ivars + 12) = 0;
    *((_OWORD *)ivars + 4) = 0u;
    *((_OWORD *)ivars + 5) = 0u;
    *((_OWORD *)ivars + 3) = 0u;
  }
  return v11;
}

void OSAction::free(OSAction *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    if (*((void *)ivars + 13)) {
      OSAction::free();
    }
    pthread_mutex_destroy((pthread_mutex_t *)((char *)ivars + 40));
    uint64_t v3 = this->ivars;
    if (!*((void *)v3 + 3)
      || (_Block_release(*((const void **)v3 + 3)), *((void *)this->ivars + 3) = 0, (uint64_t v3 = this->ivars) != 0))
    {
      IOFree(v3, *((void *)v3 + 14) + 120);
      this->ivars = 0;
    }
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'OSAction::free(OSAction *this)
{
}

kern_return_t OSAction::Cancel(OSAction *this, OSActionCancelHandler handler)
{
  ivars = this->ivars;
  if (ivars && *(void *)ivars)
  {
    uint64_t v5 = OSMetaClassBase::QueueForObject(*(OSMetaClassBase **)ivars, *((void *)ivars + 1));
    if (!v5) {
      OSAction::Cancel();
    }
    uint64_t v6 = (IODispatchQueue *)v5;
    ((void (*)(OSAction *))this->retain)(this);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1107296256;
    void v8[2] = ___ZN8OSAction6CancelEU13block_pointerFvvE_block_invoke;
    v8[3] = &__block_descriptor_tmp_127;
    v8[4] = handler;
    v8[5] = this;
    IODispatchQueue::DispatchAsync(v6, v8);
  }
  return 0;
}

uint64_t ___ZN8OSAction6CancelEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  *(unsigned char *)(v1[5] + 32) = 1;
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  DidAction((uint64_t)v1);
  uint64_t v3 = *(uint64_t (**)(void *))(*v1 + 16);

  return v3(v1);
}

void *__cdecl OSAction::GetReference(OSAction *this)
{
  ivars = this->ivars;
  if (!ivars) {
    OSAction::GetReference();
  }
  return (char *)ivars + 120;
}

kern_return_t OSAction::SetAbortedHandler(OSAction *this, OSActionAbortedHandler handler)
{
  *((void *)this->ivars + 3) = _Block_copy(handler);
  return 0;
}

void OSAction::Aborted_Impl(OSAction *this)
{
  uint64_t v1 = *((void *)this->ivars + 3);
  if (v1) {
    (*(void (**)(void))(v1 + 16))();
  }
}

kern_return_t OSAction::WillWait(OSAction *this, OSActionWaitToken **token)
{
  kern_return_t v2;
  pthread_cond_t *v5;
  OSActionWaitToken *v6;

  uint64_t v2 = -536870211;
  if (*((void *)this->ivars + 13)) {
    return -536870187;
  }
  uint64_t v5 = (pthread_cond_t *)IOMallocZeroTyped(0x38uLL, 0x100004021716A34uLL);
  if (v5)
  {
    uint64_t v6 = (OSActionWaitToken *)v5;
    if (pthread_cond_init(v5, 0)) {
      OSAction::WillWait();
    }
    uint64_t v2 = 0;
    *((void *)this->ivars + 13) = v6;
    *token = v6;
  }
  return v2;
}

kern_return_t OSAction::EndWait(OSAction *this, OSActionWaitToken *token)
{
  if (!token) {
    return -536870184;
  }
  ivars = this->ivars;
  if (*((OSActionWaitToken **)ivars + 13) != token) {
    OSAction::EndWait();
  }
  *((void *)ivars + 13) = 0;
  pthread_cond_destroy((pthread_cond_t *)token);
  IOFree(token, 0x38uLL);
  return 0;
}

kern_return_t OSAction::Wait(OSAction *this, OSActionWaitToken *token, uint64_t options, uint64_t deadline)
{
  kern_return_t v4;
  uint64_t v5;
  clockid_t v8;
  uint64_t v9;
  __uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  OSAction_IVars *ivars;
  pthread_mutex_t *v14;
  int v15;
  int v16;
  timespec v18;
  unint64_t v19;

  uint64_t v4 = -536870206;
  long long v19 = deadline;
  if (options > 0xFF) {
    return -536870201;
  }
  uint64_t v5 = deadline;
  if (options > 0x87u)
  {
    if (options != 136)
    {
      if (options == 196)
      {
        uint64_t v9 = mach_continuous_time();
      }
      else
      {
        if (options != 200) {
          return v4;
        }
        uint64_t v9 = mach_absolute_time();
      }
      long long v19 = v5 - v9;
      if (v5 >= v9)
      {
        convert_mach_time_to_nsec(&v19);
        BOOL v12 = v19;
      }
      else
      {
        BOOL v12 = 1;
        long long v19 = 1;
      }
      uint64_t v5 = clock_gettime_nsec_np(_CLOCK_REALTIME) + v12;
      goto LABEL_24;
    }
    mach_port_name_t v8 = _CLOCK_UPTIME_RAW;
LABEL_15:
    BOOL v10 = clock_gettime_nsec_np(v8);
    if (v5 < v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v5 - v10;
    }
    uint64_t v5 = v11 + clock_gettime_nsec_np(_CLOCK_REALTIME);
LABEL_24:
    long long v19 = v5;
LABEL_25:
    if (v5)
    {
      v18.tv_sec = v5 / 0x3B9ACA00;
      v18.int tv_nsec = v5 % 0x3B9ACA00;
    }
    goto LABEL_27;
  }
  if ((_BYTE)options)
  {
    if (options == 128) {
      goto LABEL_25;
    }
    if (options != 132) {
      return v4;
    }
    mach_port_name_t v8 = _CLOCK_MONOTONIC_RAW;
    goto LABEL_15;
  }
  if (deadline) {
    OSAction::Wait();
  }
LABEL_27:
  pthread_mutex_lock((pthread_mutex_t *)((char *)this->ivars + 40));
  while (!*((void *)token + 6))
  {
    ivars = this->ivars;
    if (*((unsigned char *)ivars + 32)) {
      break;
    }
    long long v14 = (pthread_mutex_t *)((char *)ivars + 40);
    if (v19) {
      long long v15 = pthread_cond_timedwait((pthread_cond_t *)token, v14, &v18);
    }
    else {
      long long v15 = pthread_cond_wait((pthread_cond_t *)token, v14);
    }
    long long v16 = v15;
    if (v15) {
      goto LABEL_36;
    }
  }
  long long v16 = 0;
LABEL_36:
  *((void *)token + 6) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this->ivars + 40));
  if (v16)
  {
    if (v16 == 60) {
      return -536870186;
    }
    else {
      return -536870199;
    }
  }
  else if (*((unsigned char *)this->ivars + 32))
  {
    return -536870165;
  }
  else
  {
    return 0;
  }
}

BOOL IOMemoryDescriptor::init(IOMemoryDescriptor *this)
{
  this->ivars = (IOMemoryDescriptor_IVars *)IOMallocZeroTyped(0x18uLL, 0x10200403ED2C137uLL);
  return 1;
}

uint64_t non-virtual thunk to'IOMemoryDescriptor::init(IOMemoryDescriptor *this)
{
  this->meta = (OSMetaClass *)IOMallocZeroTyped(0x18uLL, 0x10200403ED2C137uLL);
  return 1;
}

void IOMemoryDescriptor::free(IOMemoryDescriptor *this)
{
  ivars = this->ivars;
  uint64_t v3 = *((void *)ivars + 2);
  if (!v3
    || ((*(void (**)(void))(*(void *)v3 + 16))(*((void *)ivars + 2)),
        *((void *)this->ivars + 2) = 0,
        (ivars = this->ivars) != 0))
  {
    IOFree(ivars, 0x18uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOMemoryDescriptor::free(IOMemoryDescriptor *this)
{
}

kern_return_t IOMemoryDescriptor::GetLength(IOMemoryDescriptor *this, uint64_t *returnLength)
{
  kern_return_t result;

  uint64_t result = IOMemoryDescriptor::_CopyState(this, (_IOMDPrivateState *)this->ivars, 0);
  if (result) {
    IOMemoryDescriptor::GetLength();
  }
  *returnLength = *(void *)this->ivars;
  return result;
}

uint64_t IOMemoryMap::GetAddress(IOMemoryMap *this)
{
  return *((void *)this->ivars + 3);
}

uint64_t IOMemoryMap::GetLength(IOMemoryMap *this)
{
  return *(void *)this->ivars;
}

BOOL IOMemoryMap::init(IOMemoryMap *this)
{
  uint64_t v2 = (IOMemoryMap_IVars *)IOMallocZeroTyped(0x20uLL, 0x1000040E0EAB150uLL);
  this->ivars = v2;
  if (IOMemoryMap::_CopyState(this, (_IOMemoryMapPrivateState *)v2, 0)) {
    IOMemoryMap::init();
  }
  return 1;
}

BOOL non-virtual thunk to'IOMemoryMap::init(IOMemoryMap *this)
{
  return IOMemoryMap::init((IOMemoryMap *)((char *)this - 24));
}

void IOMemoryMap::free(IOMemoryMap *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x20uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOMemoryMap::free(IOMemoryMap *this)
{
}

uint64_t IOMemoryMap::GetOffset(IOMemoryMap *this)
{
  return *((void *)this->ivars + 1);
}

BOOL IOBufferMemoryDescriptor::init(IOBufferMemoryDescriptor *this)
{
  this->ivars = (IOMemoryDescriptor_IVars *)IOMallocZeroTyped(0x18uLL, 0x10200403ED2C137uLL);
  this->ivars = (IOBufferMemoryDescriptor_IVars *)IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
  return 1;
}

uint64_t non-virtual thunk to'IOBufferMemoryDescriptor::init(IOBufferMemoryDescriptor *this)
{
  this->meta = (OSMetaClass *)IOMallocZeroTyped(0x18uLL, 0x10200403ED2C137uLL);
  this->IOMemoryDescriptor::OSObject::OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
  return 1;
}

void IOBufferMemoryDescriptor::free(IOBufferMemoryDescriptor *this)
{
  ivars = this->ivars;
  if (!*(void *)ivars
    || ((*(void (**)(void))(**(void **)ivars + 16))(*(void *)ivars),
        *(void *)this->ivars = 0,
        (ivars = this->ivars) != 0))
  {
    IOFree(ivars, 8uLL);
    this->ivars = 0;
  }

  IOMemoryDescriptor::free(this);
}

void non-virtual thunk to'IOBufferMemoryDescriptor::free(IOBufferMemoryDescriptor *this)
{
}

kern_return_t IOBufferMemoryDescriptor::GetAddressRange(IOBufferMemoryDescriptor *this, IOAddressSegment *range)
{
  kern_return_t result;

  ivars = (IOMemoryMap **)this->ivars;
  uint64_t v5 = *ivars;
  if (*ivars) {
    goto LABEL_2;
  }
  uint64_t result = IOMemoryDescriptor::CreateMapping(this, 0, 0, 0, 0, 0, ivars, 0);
  if (!result)
  {
    uint64_t v5 = *(IOMemoryMap **)this->ivars;
LABEL_2:
    uint64_t result = 0;
    range->address = *((void *)v5->ivars + 3);
    range->size_t length = **(void **)(*(void *)this->ivars + 40);
  }
  return result;
}

BOOL IODMACommand::init(IODMACommand *this)
{
  this->ivars = (IODMACommand_IVars *)IOMallocZeroTyped(1uLL, 0x400A2AC0F1uLL);
  return 1;
}

uint64_t non-virtual thunk to'IODMACommand::init(IODMACommand *this)
{
  this->meta = (OSMetaClass *)IOMallocZeroTyped(1uLL, 0x400A2AC0F1uLL);
  return 1;
}

void IODMACommand::free(IODMACommand *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 1uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IODMACommand::free(IODMACommand *this)
{
}

BOOL IOUserClient::init(IOUserClient *this)
{
  LODWORD(v2) = IOService::init(this);
  if (v2)
  {
    uint64_t v2 = (IOUserClient_IVars *)IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
    this->ivars = v2;
    LOBYTE(v2) = v2 != 0;
  }
  return (char)v2;
}

BOOL IOService::init(IOService *this)
{
  uint64_t v2 = (IODispatchQueue **)IOMallocZeroTyped(0x20uLL, 0x1020040171E6E99uLL);
  uint64_t v3 = v2;
  this->ivars = (IOService_IVars *)v2;
  if (v2 && (BYTE4(this[-1].lvars) & 1) == 0 && !v2[1])
  {
    if (IOService::CreateDefaultDispatchQueue(this, v2 + 1, 0)) {
      IOService::init();
    }
    if (OSObject::SetDispatchQueue(this, "Default", *((IODispatchQueue **)this->ivars + 1), 0)) {
      IOService::init();
    }
  }
  return v3 != 0;
}

BOOL non-virtual thunk to'IOUserClient::init(IOUserClient *this)
{
  return IOUserClient::init((IOUserClient *)((char *)this - 24));
}

void IOUserClient::free(IOUserClient *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    if (!*(void *)ivars
      || ((*(void (**)(void))(**(void **)ivars + 16))(*(void *)ivars),
          *(void *)this->ivars = 0,
          (ivars = this->ivars) != 0))
    {
      IOFree(ivars, 8uLL);
      this->ivars = 0;
    }
  }

  IOService::free(this);
}

void non-virtual thunk to'IOUserClient::free(IOUserClient *this)
{
}

BOOL non-virtual thunk to'IOService::init(IOService *this)
{
  return IOService::init((IOService *)((char *)this - 24));
}

kern_return_t IOService::CreateDefaultDispatchQueue_Impl(IOService *this, IODispatchQueue **queue)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  *(_OWORD *)__str = 0u;
  long long v6 = 0u;
  snprintf(__str, 0x100uLL, "%s-Default", (const char *)(**(void **)this->meta->metaClassPrivate + 4));
  IODispatchQueue::Create(__str, 0, 0, queue);
  if ((gIODKDebug & 2) != 0) {
    IOLog("IODispatchQueue::Create(Default) %p\n", *((const void **)this->ivars + 1));
  }
  return 0;
}

void non-virtual thunk to'IOService::free(IOService *this)
{
}

kern_return_t IOService::GetRegistryEntryID_Impl(IOService *this, uint64_t *registryEntryID)
{
  kern_return_t result;
  IOService_IVars *v7;
  BOOL v8;

  ivars = this->ivars;
  if (ivars && (uint64_t v5 = *(void *)ivars) != 0)
  {
    uint64_t result = 0;
    *registryEntryID = v5;
  }
  else
  {
    uint64_t result = IOService::GetRegistryEntryID(this, registryEntryID, (OSDispatchMethod)OSObject::_Dispatch);
    long long v7 = this->ivars;
    if (v7) {
      long long v8 = result == 0;
    }
    else {
      long long v8 = 0;
    }
    if (v8)
    {
      uint64_t result = 0;
      *(void *)long long v7 = *registryEntryID;
    }
  }
  return result;
}

kern_return_t IOService::Start_Impl(IOService *this, IOService *provider)
{
  *((unsigned char *)this->ivars + 24) = 1;
  if ((BYTE4(this[-1].lvars) & 1) == 0)
  {
    *((void *)this->ivars + 2) = provider;
    (*(void (**)(void))(**((void **)this->ivars + 2) + 8))(*((void *)this->ivars + 2));
  }
  return 0;
}

kern_return_t IOService::Stop_Impl(IOService *this, IOService *provider)
{
  kern_return_t v3;
  IOService_IVars *ivars;
  uint64_t v5;
  NSObject *v6;
  void v8[2];
  uint64_t (*v9)(uint64_t);
  void *v10;
  IOService *v11;
  void block[6];

  uint64_t v3 = IOService::Stop(this, provider, (OSDispatchMethod)OSObject::_Dispatch);
  if ((gIODKDebug & 2) != 0) {
    IOLog("IOService::Stop kernel done 0x%x\n", v3);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  long long v9 = ___ZN9IOService9Stop_ImplEPS__block_invoke;
  long long v10 = &__block_descriptor_tmp_138;
  long long v11 = this;
  ivars = this->ivars;
  if (!*((unsigned char *)ivars + 24))
  {
    ((void (*)(IOService *))this->retain)(this);
    ivars = this->ivars;
  }
  uint64_t v5 = *((void *)ivars + 1);
  if (v5)
  {
    long long v6 = **(NSObject ***)(v5 + 40);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1107296256;
    block[2] = ___ZN15IODispatchQueue6CancelEU13block_pointerFvvE_block_invoke;
    block[3] = &__block_descriptor_tmp_80;
    block[4] = v8;
    block[5] = v5;
    dispatch_async(v6, block);
  }
  else
  {
    v9((uint64_t)v8);
  }
  return 0;
}

uint64_t ___ZN9IOService9Stop_ImplEPS__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if ((gIODKDebug & 2) != 0) {
    IOLog("IOService::finalize\n");
  }
  uint64_t v2 = v1[5];
  uint64_t v3 = *(void *)(v2 + 8);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
    *(void *)(v1[5] + 8) = 0;
    uint64_t v2 = v1[5];
  }
  uint64_t v4 = *(void *)(v2 + 16);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    *(void *)(v1[5] + 16) = 0;
  }
  uint64_t v5 = *(uint64_t (**)(void *))(*v1 + 16);

  return v5(v1);
}

void IOService::Stop_async_Impl(IOService *this, IOService *provider)
{
  if ((gIODKDebug & 2) != 0) {
    IOLog("IOService::Stop_async\n");
  }

  IOService::Stop(this, provider, 0);
}

kern_return_t IOService::SetPowerState_Impl(IOService *this, uint32_t powerFlags)
{
  if ((gIODKDebug & 8) != 0) {
    IOLog("IOService::SetPowerState(%s, %d) ack kernel\n", (const char *)(**(void **)this->meta->metaClassPrivate + 4), powerFlags);
  }

  return IOService::SetPowerState(this, powerFlags, (OSDispatchMethod)OSObject::_Dispatch);
}

kern_return_t IOService::SetDispatchQueue_Impl(IOService *this, const char *name, IODispatchQueue *queue)
{
  kern_return_t result;
  unsigned int v7;
  OSObjectInterface *v8;
  unint64_t v9;
  uint64_t v10;

  uint64_t result = OSObject::SetDispatchQueue(this, name, queue, (OSDispatchMethod)OSObject::_Dispatch);
  if (!result)
  {
    if ((gIODKDebug & 2) != 0) {
      IOLog("IOService::SetDispatchQueue(%s, %s)\n", (const char *)(**(void **)this->meta->metaClassPrivate + 4), name);
    }
    long long v7 = OSObjectQueueIndex(this, (char *)name);
    if (v7 == -1)
    {
      return -536870206;
    }
    else
    {
      long long v8 = &this[-1].OSObjectInterface;
      long long v9 = v7;
      long long v10 = *(void *)CompactArray<IODispatchQueue *>::operator[]((uint64_t)&this[-1].OSObjectInterface, v7);
      *(void *)CompactArray<IODispatchQueue *>::operator[]((uint64_t)v8, v9) = queue;
      ((void (*)(IODispatchQueue *))queue->retain)(queue);
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
      }
      return 0;
    }
  }
  return result;
}

uint64_t OSObjectQueueIndex(OSObject *a1, char *a2)
{
  uint64_t result = strcmp("Default", a2);
  if (result)
  {
    metaClassPrivate = a1->meta->metaClassPrivate;
    long long v6 = (unsigned int *)*((void *)metaClassPrivate + 2);
    if (v6)
    {
      int v7 = OSStringArrayIndex(v6, a2);
      int v8 = v7;
      if ((gIODKDebug & 2) != 0) {
        IOLog("IODispatchQueue::Create(%s, %s, %d)\n", (const char *)(**(void **)metaClassPrivate + 4), a2, v7);
      }
      if (v8 == -1) {
        return 0xFFFFFFFFLL;
      }
      else {
        return (v8 + 1);
      }
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

kern_return_t IOService::Create_Impl(IOService *this, IOService *provider, const char *propertiesKey, IOService **result)
{
  kern_return_t v6;
  kern_return_t v7;
  IOService *v8;
  IOService *meta;
  OSMetaClass *v11;
  BOOL v12;
  BOOL v13;
  BOOL v14;
  IOService *resulta;

  resulta = 0;
  long long v6 = IOService::Create(this, provider, propertiesKey, &resulta, (OSDispatchMethod)OSObject::_Dispatch);
  if (v6)
  {
    int v7 = v6;
LABEL_3:
    int v8 = 0;
    goto LABEL_4;
  }
  int v8 = resulta;
  if (resulta)
  {
    meta = (IOService *)resulta->meta;
    if (meta == resulta) {
      long long v11 = 0;
    }
    else {
      long long v11 = resulta->meta;
    }
    long long v12 = v11 != 0;
    if (v11) {
      long long v13 = v11 == gIOUserClientMetaClass;
    }
    else {
      long long v13 = 1;
    }
    if (!v13)
    {
      do
      {
        meta = (IOService *)meta->free;
        long long v12 = meta != 0;
        if (meta) {
          long long v14 = meta == (IOService *)gIOUserClientMetaClass;
        }
        else {
          long long v14 = 1;
        }
      }
      while (!v14);
    }
    if (v12)
    {
      int v7 = 0;
      goto LABEL_4;
    }
  }
  int v7 = IOService::Start(resulta, this, 0);
  int v8 = resulta;
  if (v7 && resulta)
  {
    ((void (*)(void))resulta->release)();
    goto LABEL_3;
  }
LABEL_4:
  *uint64_t result = v8;
  return v7;
}

kern_return_t IOService::_NewUserClient_Impl(IOService *this, uint32_t type, OSDictionary *entitlements, IOUserClient **userClient)
{
  kern_return_t v7;
  IOUserClient *v8;
  kern_return_t v9;
  unsigned int v10;

  int v7 = IOService::NewUserClient(this, type, userClient, 0);
  if (!v7)
  {
    int v8 = *userClient;
    if (v8)
    {
      if (entitlements)
      {
        ((void (*)(OSDictionary *))entitlements->retain)(entitlements);
        *(void *)v8->ivars = entitlements;
      }
      long long v9 = IOService::Start(v8, this, 0);
      if (v9)
      {
        int v7 = v9;
        ((void (*)(IOUserClient *))v8->release)(v8);
      }
      else
      {
        long long v10 = OSObjectQueueIndex(v8, "IOUserClientQueueExternalMethod");
        if (v10 != -1
          && !*(void *)CompactArray<IODispatchQueue *>::operator[]((uint64_t)&v8[-1].ivars, v10)
          && OSObject::SetDispatchQueue(v8, "IOUserClientQueueExternalMethod", *((IODispatchQueue **)this->ivars + 1), 0))
        {
          IOService::_NewUserClient_Impl();
        }
        return 0;
      }
    }
  }
  return v7;
}

kern_return_t IOService::UserSetProperties_Impl(IOService *this, OSContainer *properties)
{
  return 0;
}

const char *__cdecl IOService::StringFromReturn(IOService *this, IOReturn retval)
{
  str = 0;
  if (IOService::StringFromReturn(this, retval, &str, 0)) {
    return "<internal error>";
  }
  CStringNoCopy = OSString::getCStringNoCopy(str);
  int v3 = atomic_load((unsigned int *)&str->refcount);
  if (v3 >= 1025) {
    ((void (*)(OSString *))str->release)(str);
  }
  return CStringNoCopy;
}

IOService *__cdecl IOService::GetProvider(const IOService *this)
{
  return (IOService *)*((void *)this->ivars + 2);
}

kern_return_t IOUserClient::CopyClientEntitlements_Impl(IOUserClient *this, OSDictionary **entitlements)
{
  kern_return_t result;
  IOUserClient_IVars *ivars;
  uint64_t v5;

  uint64_t result = -536870184;
  ivars = this->ivars;
  if (ivars)
  {
    uint64_t v5 = *(void *)ivars;
    if (v5)
    {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      uint64_t result = 0;
      *entitlements = *(OSDictionary **)this->ivars;
    }
  }
  return result;
}

kern_return_t IOUserClient::ExternalMethod(IOUserClient *this, uint64_t selector, IOUserClientMethodArguments *arguments, const IOUserClientMethodDispatch *dispatch, OSObject *target, void *reference)
{
  kern_return_t v6;
  uint32_t checkCompletionExists;
  uint32_t checkScalarInputCount;
  const OSData *checkStructureInputSize;
  IOMemoryDescriptor *structureInputDescriptor;
  const OSData *structureInput;
  uint32_t checkScalarOutputCount;
  uint64_t checkStructureOutputSize;
  IOMemoryDescriptor *structureOutputDescriptor;
  uint64_t *p_returnLength;
  IOUserClientMethodFunction function;
  uint64_t returnLength;
  uint64_t vars8;

  long long v6 = -536870206;
  if (!dispatch) {
    return -536870201;
  }
  checkCompletionExists = dispatch->checkCompletionExists;
  if (checkCompletionExists != -1 && checkCompletionExists != (arguments->completion != 0)) {
    return v6;
  }
  checkScalarInputCount = dispatch->checkScalarInputCount;
  if (checkScalarInputCount != -1 && checkScalarInputCount != arguments->scalarInputCount) {
    return v6;
  }
  checkStructureInputSize = (const OSData *)dispatch->checkStructureInputSize;
  if (checkStructureInputSize != -1)
  {
    returnLength = 0;
    structureInputDescriptor = arguments->structureInputDescriptor;
    if (structureInputDescriptor)
    {
      IOMemoryDescriptor::GetLength(structureInputDescriptor, &returnLength);
      structureInput = (const OSData *)returnLength;
    }
    else
    {
      structureInput = arguments->structureInput;
      if (structureInput) {
        structureInput = (const OSData *)OSData::getLength(structureInput);
      }
    }
    if (structureInput != checkStructureInputSize) {
      return v6;
    }
  }
  checkScalarOutputCount = dispatch->checkScalarOutputCount;
  if (checkScalarOutputCount != -1 && checkScalarOutputCount != arguments->scalarOutputCount) {
    return v6;
  }
  checkStructureOutputSize = dispatch->checkStructureOutputSize;
  if (checkStructureOutputSize != -1)
  {
    returnLength = 0;
    structureOutputDescriptor = arguments->structureOutputDescriptor;
    if (structureOutputDescriptor)
    {
      p_returnLength = &returnLength;
      IOMemoryDescriptor::GetLength(structureOutputDescriptor, &returnLength);
    }
    else
    {
      p_returnLength = &arguments->structureOutputMaximumSize;
    }
    if (*p_returnLength != checkStructureOutputSize) {
      return v6;
    }
  }
  function = dispatch->function;
  if (!dispatch->function) {
    return -536870166;
  }

  return ((uint64_t (*)(OSObject *, void *, IOUserClientMethodArguments *))function)(target, reference, arguments);
}

kern_return_t IOUserClient::_ExternalMethod_Impl(IOUserClient *this, uint64_t selector, const unint64_t *scalarInput, uint32_t scalarInputCount, OSData *structureInput, IOMemoryDescriptor *structureInputDescriptor, unint64_t *scalarOutput, uint32_t *scalarOutputCount, uint64_t structureOutputMaximumSize, OSData **structureOutput, IOMemoryDescriptor *structureOutputDescriptor, OSAction *completion)
{
  kern_return_t result;
  void v14[8];
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;

  uint64_t v30 = 0u;
  uint64_t v31 = 0u;
  uint64_t v28 = 0u;
  uint64_t v29 = 0u;
  uint64_t v26 = 0u;
  unsigned int v27 = 0u;
  uint64_t v24 = 0u;
  timespec v25 = 0u;
  uint64_t v22 = 0u;
  unsigned int v23 = 0u;
  long long v20 = 0u;
  uint64_t v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  v14[0] = 2;
  v14[1] = selector;
  v14[2] = completion;
  v14[3] = scalarInput;
  v14[4] = scalarInputCount;
  v14[5] = structureInput;
  v14[6] = structureInputDescriptor;
  v14[7] = scalarOutput;
  LODWORD(v15) = *scalarOutputCount;
  *(void *)&long long v16 = structureOutputDescriptor;
  *((void *)&v16 + 1) = structureOutputMaximumSize;
  if (structureInput && structureInputDescriptor) {
    return -536870206;
  }
  uint64_t result = ((uint64_t (*)(IOUserClient *, uint64_t, void *, void, void, void))this->ExternalMethod)(this, selector, v14, 0, 0, 0);
  if (!result)
  {
    if ((void)v16 && *((void *)&v15 + 1))
    {
      (*(void (**)(void))(**((void **)&v15 + 1) + 16))(*((void *)&v15 + 1));
      return -536870212;
    }
    else
    {
      uint64_t result = 0;
      *structureOutput = (OSData *)*((void *)&v15 + 1);
      *scalarOutputCount = v15;
    }
  }
  return result;
}

OSBundle *OSBundle::mainBundle(void)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v0 = *(void *)(*(void *)&gOSBundleMetaClass[-3].refcount + 48);
  if (!v0) {
    return 0;
  }
  while (!*(unsigned char *)(v0 + 24))
  {
    uint64_t v0 = *(void *)(v0 + 16);
    if (!v0) {
      return 0;
    }
  }
  uint64_t v2 = *(const char **)v0;
  for (size_t i = strnlen(*(const char **)v0, 0x400uLL) - 1; ; --i)
  {
    if (v2[i] == 47)
    {
      bzero(__dst, 0x400uLL);
      if (strlcat(__dst, v2, i + 1) >= 0x400) {
        OSBundle::mainBundle();
      }
      if (strlcat(__dst, "/Info.plist", 0x400uLL) >= 0x400) {
        OSBundle::mainBundle();
      }
      if (!stat(__dst, &v8)) {
        break;
      }
    }
  }
  uint64_t v4 = OSString::withCString(v2, i);
  if (!v4) {
    OSBundle::mainBundle();
  }
  uint64_t v5 = v4;
  CStringNoCopy = OSString::getCStringNoCopy(v4);
  uint64_t v1 = OSBundle::createFromPath(CStringNoCopy);
  ((void (*)(const OSString *))v5->release)(v5);
  return v1;
}

OSBundle *__cdecl OSBundle::createFromPath(const char *path)
{
  if (!path) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v2 = 0;
  if (!OSObjectAllocate(gOSBundleMetaClass, 0, &v4))
  {
    uint64_t v2 = v4;
    if (((uint64_t (*)(OSObject *))v4->init)(v4))
    {
      v2[1].getMetaClass = (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))OSString::withCString(path);
      return (OSBundle *)v2;
    }
    ((void (*)(OSObject *))v2->release)(v2);
    return 0;
  }
  return (OSBundle *)v2;
}

BOOL OSBundle::init(OSBundle *this)
{
  this->ivars = (OSBundle_IVars *)IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
  return 1;
}

uint64_t non-virtual thunk to'OSBundle::init(OSBundle *this)
{
  this->meta = (OSMetaClass *)IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
  return 1;
}

void OSBundle::free(OSBundle *this)
{
  ivars = this->ivars;
  if (!*(void *)ivars
    || ((*(void (**)(void))(**(void **)ivars + 16))(*(void *)ivars),
        *(void *)this->ivars = 0,
        (ivars = this->ivars) != 0))
  {
    IOFree(ivars, 8uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'OSBundle::free(OSBundle *this)
{
}

kern_return_t OSBundle::loadResource(OSBundle *this, const char *name, uint64_t options, size_t minGuardSize, OSMappedFile **outputMap)
{
  kern_return_t v11;
  OSMappedFile *v13;
  char __dst[1024];
  uint64_t v15;

  long long v15 = *MEMORY[0x263EF8340];
  long long v13 = 0;
  if (!name) {
    return -536870212;
  }
  bzero(__dst, 0x400uLL);
  CStringNoCopy = OSString::getCStringNoCopy(*(const OSString **)this->ivars);
  strlcat(__dst, CStringNoCopy, 0x400uLL);
  strlcat(__dst, "/", 0x400uLL);
  strlcat(__dst, name, 0x400uLL);
  long long v11 = OSMappedFile::createFromPath(__dst, v10, minGuardSize, &v13);
  if (v11)
  {
    if (v13) {
      ((void (*)(void))v13->release)();
    }
  }
  else
  {
    *outputMap = v13;
  }
  return v11;
}

kern_return_t OSMappedFile::createFromPath(const char *path, uint64_t options, size_t minGuardSize, OSMappedFile **outputMappedFile)
{
  kern_return_t v4;
  int v8;
  int v9;
  int *v10;
  char *v11;
  size_t v12;
  const OSMetaClass *(__cdecl *v13)(const OSMetaClassBase *__hidden);
  int *v14;
  char *v15;
  uint64_t *v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  const OSMetaClass *(__cdecl *v20)(const OSMetaClassBase *__hidden);
  void (__cdecl *v21)(const OSObject *__hidden);
  void (__cdecl *v22)(const OSObject *__hidden);
  int v23;
  OSObject *v24;
  int *v25;
  int *v26;
  OSObject *v28;
  stat v29;

  uint64_t v4 = -536870212;
  uint64_t v28 = 0;
  if (!path)
  {
    long long v13 = 0;
    long long v12 = 0;
    uint64_t v4 = -536870206;
    goto LABEL_23;
  }
  if ((gIODKDebug & 2) != 0) {
    IOLog("Open file: %s\n", path);
  }
  stat v8 = open(path, 0);
  if (v8 < 0)
  {
    long long v14 = __error();
    long long v15 = strerror(*v14);
    IOLog("Failed to open %s: %s\n", path, v15);
    long long v13 = 0;
    long long v12 = 0;
    goto LABEL_23;
  }
  long long v9 = v8;
  if (fstat(v8, &v29))
  {
    uint64_t v10 = __error();
    long long v11 = strerror(*v10);
    IOLog("Failed to fstat %s: %s\n", path, v11);
    long long v12 = 0;
    long long v13 = 0;
LABEL_22:
    close(v9);
    goto LABEL_23;
  }
  if (minGuardSize)
  {
    long long v16 = (uint64_t *)MEMORY[0x263EF8AF8];
    if ((gIODKDebug & 2) != 0) {
      IOLog("Using guard pages: requested guard size is %zu, rounding up to %zu\n", minGuardSize, (minGuardSize - 1 + *MEMORY[0x263EF8AF8]) & -*MEMORY[0x263EF8AF8]);
    }
    long long v18 = *v16;
    long long v19 = -*v16;
    long long v17 = (minGuardSize - 1 + *v16) & v19;
  }
  else
  {
    long long v17 = 0;
    long long v18 = *MEMORY[0x263EF8AF8];
    long long v19 = -*MEMORY[0x263EF8AF8];
  }
  long long v12 = ((v29.st_size + v18 - 1) & v19) + 2 * v17;
  long long v20 = (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))mmap(0, v12, 0, 4098, 0, 0);
  long long v13 = v20;
  if (v20 == (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))-1)
  {
    timespec v25 = __error();
    strerror(*v25);
    IOLog("Failed to mmap region of size %zu: %s\n");
    goto LABEL_22;
  }
  uint64_t v21 = (void (__cdecl *)(const OSObject *__hidden))mmap((char *)v20 + v17, v29.st_size, 1, 17, v9, 0);
  if (v21 == (void (__cdecl *)(const OSObject *__hidden))-1)
  {
    uint64_t v26 = __error();
    strerror(*v26);
    IOLog("Failed to mmap file %s, size %lld at %p in mapped region %p->%p: %s\n");
    goto LABEL_22;
  }
  uint64_t v22 = v21;
  unsigned int v23 = OSObjectAllocate(gOSMappedFileMetaClass, 0, &v28);
  uint64_t v24 = v28;
  if (!v23)
  {
    if (((uint64_t (*)(OSObject *))v28->init)(v28))
    {
      v24[1].getMetaClass = v13;
      v24[1].retain = (void (__cdecl *)(const OSObject *__hidden))v12;
      v24[1].release = v22;
      v24[1].isEqualTo = (BOOL (__cdecl *)(const OSMetaClassBase *__hidden, const OSMetaClassBase *))v29.st_size;
      close(v9);
      uint64_t v4 = 0;
      *outputMappedFile = (OSMappedFile *)v24;
      return v4;
    }
    close(v9);
    goto LABEL_29;
  }
  close(v9);
  if (v24)
  {
LABEL_29:
    ((void (*)(OSObject *))v24->release)(v24);
    uint64_t v28 = 0;
  }
LABEL_23:
  if ((unint64_t)v13 + 1 >= 2) {
    munmap(v13, v12);
  }
  return v4;
}

BOOL OSMappedFile::init(OSMappedFile *this)
{
  this->ivars = (OSMappedFile_IVars *)IOMallocZeroTyped(0x20uLL, 0x108004066DFD6F0uLL);
  return 1;
}

uint64_t non-virtual thunk to'OSMappedFile::init(OSMappedFile *this)
{
  this->meta = (OSMetaClass *)IOMallocZeroTyped(0x20uLL, 0x108004066DFD6F0uLL);
  return 1;
}

void OSMappedFile::free(OSMappedFile *this)
{
  munmap(*(void **)this->ivars, *((void *)this->ivars + 1));
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x20uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'OSMappedFile::free(OSMappedFile *this)
{
}

const void *__cdecl OSMappedFile::data(const OSMappedFile *this)
{
  return (const void *)*((void *)this->ivars + 2);
}

size_t OSMappedFile::size(const OSMappedFile *this)
{
  return *((void *)this->ivars + 3);
}

BOOL IOCommand::init(IOCommand *this)
{
  uint64_t v2 = (IOCommand_IVars *)IOMallocZeroTyped(0x18uLL, 0x20040960023A9uLL);
  this->ivars = v2;
  if (v2) {
    *((void *)v2 + 2) = this;
  }
  return v2 != 0;
}

BOOL non-virtual thunk to'IOCommand::init(IOCommand *this)
{
  uint64_t v2 = (OSMetaClass *)IOMallocZeroTyped(0x18uLL, 0x20040960023A9uLL);
  this->meta = v2;
  if (v2) {
    v2->meta = (OSMetaClass *)&this[-1].OSObjectInterface;
  }
  return v2 != 0;
}

void IOCommand::free(IOCommand *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x18uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOCommand::free(IOCommand *this)
{
}

IOCommand *__cdecl IOCommand::FromChain(queue_chain_t *link)
{
  return (IOCommand *)link[1].next;
}

queue_chain_t *__cdecl IOCommand::CommandChain(IOCommand *this)
{
  return (queue_chain_t *)this->ivars;
}

BOOL IOCommandPool::init(IOCommandPool *this)
{
  return 0;
}

uint64_t non-virtual thunk to'IOCommandPool::init(IOCommandPool *this)
{
  return 0;
}

BOOL IOCommandPool::initWithQueue(IOCommandPool *this, IODispatchQueue *queue)
{
  uint64_t v4 = (IOCommandPool_IVars *)IOMallocZeroTyped(0x20uLL, 0x102004055CCDE27uLL);
  uint64_t v5 = v4;
  this->ivars = v4;
  if (v4)
  {
    *(void *)uint64_t v4 = v4;
    *((void *)this->ivars + 1) = this->ivars;
    ((void (*)(IODispatchQueue *))queue->retain)(queue);
    *((void *)this->ivars + 2) = queue;
  }
  return v5 != 0;
}

BOOL non-virtual thunk to'IOCommandPool::initWithQueue(IOCommandPool *this, IODispatchQueue *a2)
{
  return IOCommandPool::initWithQueue((IOCommandPool *)((char *)this - 40), a2);
}

void IOCommandPool::free(IOCommandPool *this)
{
  ivars = this->ivars;
  uint64_t v3 = *((void *)ivars + 2);
  if (!v3
    || ((*(void (**)(void))(*(void *)v3 + 16))(*((void *)ivars + 2)),
        *((void *)this->ivars + 2) = 0,
        (ivars = this->ivars) != 0))
  {
    IOFree(ivars, 0x20uLL);
    this->ivars = 0;
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOCommandPool::free(IOCommandPool *this)
{
}

IOCommandPoolPtr IOCommandPool::withQueue(IODispatchQueue *queue)
{
  uint64_t v4 = 0;
  if (OSObjectAllocate(gIOCommandPoolMetaClass, 0, &v4)) {
    return 0;
  }
  uint64_t v2 = (IOCommandPool *)v4;
  if (v4
    && (((uint64_t (*)(OSObject *, IODispatchQueue *))v4->OSMetaClassBase::__vftable[1].getMetaClass)(v4, queue) & 1) == 0)
  {
    ((void (*)(IOCommandPool *))v2->release)(v2);
    return 0;
  }
  return v2;
}

IOCommandPtr IOCommandPool::getCommand(IOCommandPool *this, BOOL blockForCommand)
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000;
  uint64_t v12 = 0;
  uint64_t v3 = (IODispatchQueue *)*((void *)this->ivars + 2);
  context[0] = MEMORY[0x263EF8330];
  context[1] = 1107296256;
  context[2] = ___ZN13IOCommandPool10getCommandEb_block_invoke;
  context[3] = &__block_descriptor_tmp_154;
  context[4] = &v9;
  void context[5] = this;
  BOOL v8 = blockForCommand;
  if (___ZN13IOCommandPool10getCommandEb_block_invoke) {
    uint64_t v4 = (void (__cdecl *)(void *))___ZN13IOCommandPool10getCommandEb_block_invoke;
  }
  else {
    uint64_t v4 = 0;
  }
  IODispatchQueue::DispatchSync_f(v3, context, v4);
  uint64_t v5 = (IOCommand *)v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t ___ZN13IOCommandPool10getCommandEb_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(**(void **)(a1 + 40) + 80))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 8) + 24, *(unsigned __int8 *)(a1 + 48));
  if (result) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

IOCommandPtr non-virtual thunk to'IOCommandPool::getCommand(IOCommandPool *this, BOOL a2)
{
  return IOCommandPool::getCommand((IOCommandPool *)((char *)this - 40), a2);
}

void IOCommandPool::returnCommand(IOCommandPool *this, IOCommand *command)
{
  uint64_t v3 = (IODispatchQueue *)*((void *)this->ivars + 2);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 0x40000000;
  v5[2] = ___ZN13IOCommandPool13returnCommandEP9IOCommand_block_invoke;
  v5[3] = &__block_descriptor_tmp_155;
  v5[4] = this;
  v5[5] = command;
  if (___ZN13IOCommandPool13returnCommandEP9IOCommand_block_invoke) {
    uint64_t v4 = (void (__cdecl *)(void *))___ZN13IOCommandPool13returnCommandEP9IOCommand_block_invoke;
  }
  else {
    uint64_t v4 = 0;
  }
  IODispatchQueue::DispatchSync_f(v3, v5, v4);
}

uint64_t ___ZN13IOCommandPool13returnCommandEP9IOCommand_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void, void))(**(void **)(a1 + 32) + 88))(*(void *)(a1 + 32), *(void *)(a1 + 40));
  if (result) {
    ___ZN13IOCommandPool13returnCommandEP9IOCommand_block_invoke_cold_1();
  }
  return result;
}

void non-virtual thunk to'IOCommandPool::returnCommand(IOCommandPool *this, IOCommand *a2)
{
  IOCommandPool::returnCommand((IOCommandPool *)((char *)this - 40), a2);
}

kern_return_t IOCommandPool::gatedGetCommand(IOCommandPool *this, IOCommand **command, BOOL blockForCommand)
{
  kern_return_t result;
  IOCommandPool_IVars *ivars;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t **v10;
  timespec v12;

  BOOL v3 = blockForCommand;
  uint64_t result = IODispatchQueue::OnQueue(*((IODispatchQueue **)this->ivars + 2));
  if (!result) {
    IOCommandPool::gatedGetCommand();
  }
  ivars = this->ivars;
  BOOL v8 = *(uint64_t **)ivars;
  if (ivars == *(IOCommandPool_IVars **)ivars)
  {
    if (!v3) {
      return -536870210;
    }
    do
    {
      ++*((_DWORD *)ivars + 6);
      v12.tv_sec = 0;
      v12.int tv_nsec = 0;
      uint64_t result = _IODispatchQueueSleep(*(IODispatchQueue_LocalIVars **)(*((void *)this->ivars + 2) + 40), 0, (char *)this->ivars + 24, v12);
      ivars = this->ivars;
      BOOL v8 = *(uint64_t **)ivars;
    }
    while (ivars == *(IOCommandPool_IVars **)ivars);
  }
  uint64_t v9 = (uint64_t *)*v8;
  uint64_t v10 = (uint64_t **)v8[1];
  if (*(uint64_t **)(*v8 + 8) == v8 && *v10 == v8)
  {
    uint64_t result = 0;
    v9[1] = (uint64_t)v10;
    uint64_t *v10 = v9;
    *BOOL v8 = 0;
    v8[1] = 0;
    *command = (IOCommand *)v8[2];
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t non-virtual thunk to'IOCommandPool::gatedGetCommand(IOCommandPool *this, IOCommand **a2, BOOL a3)
{
  return IOCommandPool::gatedGetCommand((IOCommandPool *)((char *)this - 40), a2, a3);
}

kern_return_t IOCommandPool::gatedReturnCommand(IOCommandPool *this, IOCommand *command)
{
  kern_return_t result;
  IOCommandPool_IVars *ivars;
  uint64_t v6;
  IOCommand_IVars *v7;
  IOCommandPool_IVars *v8;
  void *v9;
  int v10;

  uint64_t result = IODispatchQueue::OnQueue(*((IODispatchQueue **)this->ivars + 2));
  if ((result & 1) == 0) {
    IOCommandPool::gatedReturnCommand();
  }
  ivars = this->ivars;
  long long v6 = *(void *)ivars;
  if (*(IOCommandPool_IVars **)(*(void *)ivars + 8) == ivars)
  {
    int v7 = command->ivars;
    *(void *)int v7 = v6;
    *((void *)v7 + 1) = ivars;
    *(void *)(v6 + 8) = v7;
    *(void *)ivars = v7;
    BOOL v8 = this->ivars;
    uint64_t v10 = *((_DWORD *)v8 + 6);
    uint64_t v9 = (char *)v8 + 24;
    if (v10)
    {
      IODispatchQueue::WakeupWithOptions(*((IODispatchQueue **)this->ivars + 2), v9, 0);
      --*((_DWORD *)this->ivars + 6);
    }
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t non-virtual thunk to'IOCommandPool::gatedReturnCommand(IOCommandPool *this, IOCommand *a2)
{
  return 0;
}

kern_return_t IOServiceStateNotificationDispatchSource::Create(IOService *service, OSArray *items, IODispatchQueue *queue, IOServiceStateNotificationDispatchSource **source)
{
  kern_return_t result;

  uint64_t result = IOServiceStateNotificationDispatchSource::Create_Call(service, items, queue, source);
  if (result) {
    IOServiceStateNotificationDispatchSource::Create();
  }
  *(void *)(*source)->ivars = queue;
  return result;
}

BOOL IOServiceStateNotificationDispatchSource::init(IOServiceStateNotificationDispatchSource *this)
{
  uint64_t v2 = (IOServiceStateNotificationDispatchSource_IVars *)IOMallocZeroTyped(0x18uLL, 0x1020040839F2BD9uLL);
  this->ivars = v2;
  return v2 != 0;
}

BOOL non-virtual thunk to'IOServiceStateNotificationDispatchSource::init(IOServiceStateNotificationDispatchSource *this)
{
  uint64_t v2 = (OSObjectInterface_vtbl *)IOMallocZeroTyped(0x18uLL, 0x1020040839F2BD9uLL);
  this->IODispatchSource::OSObject::OSObjectInterface::__vftable = v2;
  return v2 != 0;
}

void IOServiceStateNotificationDispatchSource::free(IOServiceStateNotificationDispatchSource *this)
{
  ivars = this->ivars;
  if (ivars) {
    IOFree(ivars, 0x18uLL);
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOServiceStateNotificationDispatchSource::free(IOServiceStateNotificationDispatchSource *this)
{
}

kern_return_t IOServiceStateNotificationDispatchSource::SetEnableWithCompletion_Impl(IOServiceStateNotificationDispatchSource *this, BOOL enable, IODispatchSourceCancelHandler handler)
{
  kern_return_t v6;
  IODispatchQueue *v7;
  void (__cdecl *v8)(void *);
  void context[6];
  BOOL v11;

  long long v6 = IODispatchSource::SetEnableWithCompletion(this, enable, handler, (OSDispatchMethod)IODispatchSource::_Dispatch);
  if (!v6)
  {
    int v7 = *(IODispatchQueue **)this->ivars;
    context[0] = MEMORY[0x263EF8330];
    context[1] = 1107296256;
    context[2] = ___ZN40IOServiceStateNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke;
    context[3] = &__block_descriptor_tmp_159;
    uint64_t v11 = enable;
    context[4] = handler;
    void context[5] = this;
    if (___ZN40IOServiceStateNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke) {
      BOOL v8 = (void (__cdecl *)(void *))___ZN40IOServiceStateNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke;
    }
    else {
      BOOL v8 = 0;
    }
    IODispatchQueue::DispatchSync_f(v7, context, v8);
  }
  return v6;
}

uint64_t ___ZN40IOServiceStateNotificationDispatchSource28SetEnableWithCompletion_ImplEbU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 48) + 17) = *(unsigned char *)(a1 + 48);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

kern_return_t IOServiceStateNotificationDispatchSource::Cancel_Impl(IOServiceStateNotificationDispatchSource *this, IODispatchSourceCancelHandler handler)
{
  uint64_t v2 = **(NSObject ***)(*(void *)this->ivars + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  void v4[2] = ___ZN40IOServiceStateNotificationDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke;
  v4[3] = &__block_descriptor_tmp_162;
  void v4[4] = handler;
  v4[5] = this;
  dispatch_async(v2, v4);
  return 0;
}

uint64_t ___ZN40IOServiceStateNotificationDispatchSource11Cancel_ImplEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  *(unsigned char *)(*(void *)(v1 + 48) + 16) = 1;
  *(unsigned char *)(*(void *)(v1 + 48) + 17) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL IOThread::init(IOThread *this)
{
  uint64_t v2 = IOMallocZeroTyped(0x88uLL, 0x10A004045ED1EA6uLL);
  *((void *)this + 5) = v2;
  return v2 != 0;
}

BOOL non-virtual thunk to'IOThread::init(IOThread *this)
{
  uint64_t v2 = IOMallocZeroTyped(0x88uLL, 0x10A004045ED1EA6uLL);
  *((void *)this + 2) = v2;
  return v2 != 0;
}

void IOThread::free(OSMetaClassBase *this)
{
  meta = this[1].meta;
  if (meta)
  {
    pthread_mutex_destroy((pthread_mutex_t *)&meta->metaClassPrivate);
    pthread_cond_destroy((pthread_cond_t *)&this[1].meta[2].metaClassPrivate);
    IOFree(this[1].meta, 0x88uLL);
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOThread::free(OSMetaClassBase *this)
{
}

uint64_t IOThread::Create(IOThread *this, void (__cdecl *a2)(const OSObject *__hidden this), void (__cdecl *a3)(const OSObject *__hidden this), OSObject **a4, IOThread **a5)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v16 = 0;
  uint64_t v5 = 3758097090;
  if (a2 && a4)
  {
    pthread_t v15 = 0;
    uint64_t v9 = OSObjectAllocate((OSMetaClass *)gIOThreadMetaClass, 0, &v16);
    uint64_t v10 = v16;
    if (v9)
    {
      uint64_t v5 = v9;
      if (!v16) {
        return v5;
      }
    }
    else
    {
      uint64_t v5 = 3758097084;
      if (((unsigned int (*)(OSObject *))v16->init)(v16))
      {
        uint64_t v11 = v10[1].OSMetaClassBase::__vftable;
        v11->isEqualTo = (BOOL (__cdecl *)(const OSMetaClassBase *__hidden, const OSMetaClassBase *))850045863;
        *(_OWORD *)&v11->Dispatch = 0u;
        *(_OWORD *)&v11->free = 0u;
        *(_OWORD *)&v11[1].retain = 0u;
        v11[1].isEqualTo = 0;
        uint64_t v12 = v10[1].OSMetaClassBase::__vftable;
        v12[1].Dispatch = (kern_return_t (__cdecl *)(OSObject *__hidden, const IORPC))1018212795;
        *(_OWORD *)&v12[1].init = 0u;
        *(_OWORD *)&v12[2].getMetaClass = 0u;
        v12[2].release = 0;
        v10[1].retain = a2;
        v10[1].release = a3;
        uint64_t v5 = pthread_attr_init(&v17);
        if (!v5)
        {
          uint64_t v5 = pthread_attr_setschedpolicy(&v17, 2);
          if (!v5)
          {
            uint64_t v5 = pthread_attr_getschedparam(&v17, &v14);
            if (!v5)
            {
              v14.sched_priority = 63;
              uint64_t v5 = pthread_attr_setschedparam(&v17, &v14);
              if (!v5)
              {
                uint64_t v5 = pthread_attr_setdetachstate(&v17, 1);
                if (!v5)
                {
                  ((void (*)(OSObject *))v10->retain)(v10);
                  uint64_t v5 = pthread_create(&v15, &v17, (void *(__cdecl *)(void *))IOThreadStart, v10);
                  if (!v5)
                  {
                    pthread_mutex_lock((pthread_mutex_t *)&v10[1].isEqualTo);
                    v10[1].getMetaClass = (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))v15;
                    pthread_cond_signal((pthread_cond_t *)&v10[1].OSMetaClassBase::__vftable[1].Dispatch);
                    pthread_mutex_unlock((pthread_mutex_t *)&v10[1].isEqualTo);
                    pthread_attr_destroy(&v17);
                    *a4 = v10;
                    return v5;
                  }
                  ((void (*)(OSObject *))v10->release)(v10);
                }
              }
            }
          }
          pthread_attr_destroy(&v17);
        }
      }
    }
    ((void (*)(OSObject *))v10->release)(v10);
  }
  return v5;
}

uint64_t IOThreadStart(void *a1)
{
  if (!a1) {
    IOThreadStart();
  }
  uint64_t v2 = (void *)a1[2];
  if (v2 == a1) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a1[2];
  }
  BOOL v4 = v3 != 0;
  if (v3) {
    BOOL v5 = v3 == gIOThreadMetaClass;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    do
    {
      uint64_t v2 = *(void **)(v2[3] + 8);
      BOOL v4 = v2 != 0;
      if (v2) {
        BOOL v6 = v2 == (void *)gIOThreadMetaClass;
      }
      else {
        BOOL v6 = 1;
      }
    }
    while (!v6);
  }
  if (!v4) {
    IOThreadStart();
  }
  if (pthread_setspecific(gIOThreadTLSKey, a1)) {
    IOThreadStart();
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1[5] + 24));
  while (1)
  {
    int v7 = *(_opaque_pthread_t **)a1[5];
    if (v7 == pthread_self()) {
      break;
    }
    pthread_cond_wait((pthread_cond_t *)(a1[5] + 88), (pthread_mutex_t *)(a1[5] + 24));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1[5] + 24));
  uint64_t v8 = (*(uint64_t (**)(void))(a1[5] + 8))(*(void *)(a1[5] + 16));
  (*(void (**)(void *))(*a1 + 16))(a1);
  return v8;
}

uint64_t IOThread::Join(IOThread *this, void **a2)
{
  uint64_t v3 = 3758097084;
  BOOL v4 = (_opaque_pthread_t *)**((void **)this + 5);
  if (!v4) {
    return 3758097112;
  }
  if (!pthread_join(v4, a2))
  {
    uint64_t v3 = 0;
    **((void **)this + 5) = 0;
  }
  return v3;
}

uint64_t IOThread::CopyCurrentThread(IOThread *this, IOThread **a2)
{
  uint64_t v3 = pthread_getspecific(gIOThreadTLSKey);
  if (!v3) {
    IOThread::CopyCurrentThread();
  }
  BOOL v4 = v3;
  BOOL v5 = (void *)v3[2];
  if (v5 == v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v3[2];
  }
  BOOL v7 = v6 != 0;
  if (v6) {
    BOOL v8 = v6 == gIOThreadMetaClass;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    do
    {
      BOOL v5 = *(void **)(v5[3] + 8);
      BOOL v7 = v5 != 0;
      if (v5) {
        BOOL v9 = v5 == (void *)gIOThreadMetaClass;
      }
      else {
        BOOL v9 = 1;
      }
    }
    while (!v9);
  }
  if (!v7) {
    IOThread::CopyCurrentThread();
  }
  if (!this) {
    return 3758097090;
  }
  (*(void (**)(void *))(*v3 + 8))(v3);
  uint64_t result = 0;
  *(void *)this = v4;
  return result;
}

uint64_t IOThread::GetTimeConstraint(pthread_t **this, unsigned int *a2, unsigned int *a3, unsigned int *a4, BOOL *a5, BOOL *a6)
{
  mach_msg_type_number_t policy_infoCnt = 4;
  uint64_t result = 3758097090;
  if (a2 && a3 && a4 && a5 && a6)
  {
    BOOLean_t get_default = *a6;
    thread_inspect_t v13 = pthread_mach_thread_np(*this[5]);
    uint64_t result = thread_policy_get(v13, 2u, policy_info, &policy_infoCnt, &get_default);
    if (!result)
    {
      unsigned int v14 = policy_info[1];
      *a2 = policy_info[0];
      *a3 = v14;
      integer_t v15 = policy_info[3];
      *a4 = policy_info[2];
      *a5 = v15 != 0;
      *a6 = get_default != 0;
    }
  }
  return result;
}

uint64_t IOThread::SetTimeConstraint(pthread_t **this, integer_t a2, integer_t a3, integer_t a4, integer_t a5)
{
  v7[0] = a2;
  v7[1] = a3;
  void v7[2] = a4;
  v7[3] = a5;
  thread_act_t v5 = pthread_mach_thread_np(*this[5]);
  return thread_policy_set(v5, 2u, v7, 4u);
}

BOOL IOWorkGroup::init(IOWorkGroup *this)
{
  uint64_t v2 = IOMallocZeroTyped(0x18uLL, 0x20040960023A9uLL);
  *((void *)this + 5) = v2;
  return v2 != 0;
}

BOOL non-virtual thunk to'IOWorkGroup::init(IOWorkGroup *this)
{
  uint64_t v2 = IOMallocZeroTyped(0x18uLL, 0x20040960023A9uLL);
  *((void *)this + 2) = v2;
  return v2 != 0;
}

void IOWorkGroup::free(OSMetaClassBase *this)
{
  meta = this[1].meta;
  if (meta)
  {
    if (meta->__vftable)
    {
      (*((void (**)(OSMetaClass_vtbl *))meta->getMetaClass + 2))(meta->__vftable);
      this[1].meta->__vftable = 0;
      meta = this[1].meta;
    }
    uint64_t v3 = *(void *)&meta->refcount;
    if (v3)
    {
      (*(void (**)(void))(*(void *)v3 + 16))(*(void *)&meta->refcount);
      *(void *)&this[1].meta->__int32 refcount = 0;
      meta = this[1].meta;
    }
    if (meta->meta)
    {
      os_release(meta->meta);
      meta = this[1].meta;
    }
    IOFree(meta, 0x18uLL);
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOWorkGroup::free(OSMetaClassBase *this)
{
}

uint64_t IOWorkGroup::Create(const OSMetaClassBase *this, OSString *a2, IOUserClient *a3, IOWorkGroup **a4)
{
  uint64_t v10 = 0;
  uint64_t v7 = IOWorkGroup::Create_Call(this, a2, (IOUserClient *)&v10, a4);
  if (!v7)
  {
    uint64_t v7 = 3758097085;
    if (!v10) {
      return v7;
    }
    if (a3)
    {
      **(void **)(v10 + 40) = this;
      (*(void (**)(void))(***(void ***)(v10 + 40) + 8))(**(void **)(v10 + 40));
      uint64_t v8 = v10;
      *(void *)(*(void *)(v10 + 40) + 8) = a2;
      (*(void (**)(void))(**(void **)(*(void *)(v8 + 40) + 8) + 8))(*(void *)(*(void *)(v8 + 40) + 8));
      uint64_t v7 = 0;
      a3->IOService::OSObject::OSMetaClassBase::__vftable = (IOUserClient_vtbl *)v10;
      return v7;
    }
    uint64_t v7 = 3758097090;
    goto LABEL_3;
  }
  if (v10) {
LABEL_3:
  }
    (*(void (**)(void))(*(void *)v10 + 16))();
  return v7;
}

uint64_t IOWorkGroup::Invalidate(OSMetaClassBase *this)
{
  uint64_t v1 = *(IOUserClient **)&this[1].meta->refcount;
  if (!v1) {
    return 3758097112;
  }
  uint64_t v3 = IOWorkGroup::InvalidateKernel(this, v1, 0);
  uint64_t v4 = *(void *)&this[1].meta->refcount;
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
    *(void *)&this[1].meta->__int32 refcount = 0;
  }
  return v3;
}

uint64_t IOWorkGroup::SetWorkGroupPort_Impl(IOWorkGroup *this, mach_port_name_t name)
{
  uint64_t v3 = *((void *)this + 5);
  if (*(void *)(v3 + 16))
  {
    uint64_t v4 = 3758097115;
  }
  else
  {
    CStringNoCopy = OSString::getCStringNoCopy(*(const OSString **)v3);
    *(void *)(*((void *)this + 5) + 16) = os_workgroup_create_with_port(CStringNoCopy, name);
    if (*(void *)(*((void *)this + 5) + 16)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 3758097090;
    }
  }
  if (mach_port_mod_refs(*MEMORY[0x263EF8960], name, 0, -1)) {
    IOWorkGroup::SetWorkGroupPort_Impl();
  }
  return v4;
}

uint64_t IOWorkGroup::GetTokenSize(IOWorkGroup *this)
{
  return 40;
}

uint64_t IOWorkGroup::Join(IOWorkGroup *this, os_workgroup_join_token_opaque_s *a2)
{
  uint64_t v2 = *(OS_os_workgroup **)(*((void *)this + 5) + 16);
  if (!v2) {
    return 3758097112;
  }
  if (!a2) {
    return 3758097090;
  }
  if (os_workgroup_join(v2, a2)) {
    return 3758097084;
  }
  return 0;
}

uint64_t IOWorkGroup::Leave(IOWorkGroup *this, os_workgroup_join_token_opaque_s *a2)
{
  uint64_t result = 3758097090;
  uint64_t v4 = *(OS_os_workgroup **)(*((void *)this + 5) + 16);
  if (!v4) {
    return 3758097112;
  }
  if (a2)
  {
    os_workgroup_leave(v4, a2);
    return 0;
  }
  return result;
}

uint64_t IOEventLink::Create(const OSMetaClassBase *this, OSString *a2, IOUserClient *a3, IOEventLink **a4)
{
  uint64_t v10 = 0;
  uint64_t v7 = IOEventLink::Create_Call(this, a2, (IOUserClient *)&v10, a4);
  if (!v7)
  {
    if (a3)
    {
      **(void **)(v10 + 40) = this;
      (*(void (**)(void))(***(void ***)(v10 + 40) + 8))(**(void **)(v10 + 40));
      uint64_t v8 = v10;
      *(void *)(*(void *)(v10 + 40) + 24) = a2;
      (*(void (**)(void))(**(void **)(*(void *)(v8 + 40) + 24) + 8))(*(void *)(*(void *)(v8 + 40) + 24));
      uint64_t v7 = 0;
      a3->IOService::OSObject::OSMetaClassBase::__vftable = (IOUserClient_vtbl *)v10;
      return v7;
    }
    uint64_t v7 = 3758097090;
  }
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 16))(v10);
  }
  return v7;
}

BOOL IOEventLink::init(IOEventLink *this)
{
  uint64_t v2 = IOMallocZeroTyped(0x20uLL, 0x10200407DCD39BEuLL);
  *((void *)this + 5) = v2;
  return v2 != 0;
}

BOOL non-virtual thunk to'IOEventLink::init(IOEventLink *this)
{
  uint64_t v2 = IOMallocZeroTyped(0x20uLL, 0x10200407DCD39BEuLL);
  *((void *)this + 2) = v2;
  return v2 != 0;
}

void IOEventLink::free(OSMetaClassBase *this)
{
  uint64_t v2 = (void **)&this[1].meta->__vftable;
  if (v2)
  {
    if (*v2)
    {
      (*(void (**)(void *))(*(void *)*v2 + 16))(*v2);
      this[1].meta->__vftable = 0;
      uint64_t v2 = (void **)&this[1].meta->__vftable;
    }
    uint64_t v3 = v2[3];
    if (v3)
    {
      (*(void (**)(void *))(*(void *)v3 + 16))(v2[3]);
      this[1].meta->metaClassPrivate = 0;
      uint64_t v2 = (void **)&this[1].meta->__vftable;
    }
    if (!v2[1] || (os_release(v2[1]), (uint64_t v2 = (void **)&this[1].meta->__vftable) != 0))
    {
      IOFree(v2, 0x20uLL);
      this[1].meta = 0;
    }
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOEventLink::free(OSMetaClassBase *this)
{
}

uint64_t IOEventLink::SetEventlinkPort_Impl(IOEventLink *this, mach_port_name_t name)
{
  uint64_t v3 = *((void *)this + 5);
  if (*(void *)(v3 + 8))
  {
    uint64_t v4 = 3758097115;
  }
  else
  {
    OSString::getCStringNoCopy(*(const OSString **)v3);
    *(void *)(*((void *)this + 5) + 8) = os_eventlink_create_with_port();
    if (*(void *)(*((void *)this + 5) + 8)) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = 3758097090;
    }
  }
  if (mach_port_mod_refs(*MEMORY[0x263EF8960], name, 0, -1)) {
    IOEventLink::SetEventlinkPort_Impl();
  }
  return v4;
}

uint64_t IOEventLink::Invalidate(OSMetaClassBase *this)
{
  metaClassPrivate = (IOUserClient *)this[1].meta->metaClassPrivate;
  if (!metaClassPrivate) {
    return 3758097112;
  }
  uint64_t v3 = IOEventLink::InvalidateKernel(this, metaClassPrivate, 0);
  uint64_t v4 = this[1].meta->metaClassPrivate;
  if (v4)
  {
    (*(void (**)(OSMetaClassPrivate *))(*(void *)v4 + 16))(v4);
    this[1].meta->metaClassPrivate = 0;
  }
  return v3;
}

uint64_t IOEventLink::Cancel(IOEventLink *this)
{
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  os_eventlink_cancel();
  return 0;
}

uint64_t IOEventLink::Signal(IOEventLink *this)
{
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (os_eventlink_signal()) {
    return 3758097111;
  }
  return 0;
}

uint64_t IOEventLink::SignalAndWait(IOEventLink *this, unint64_t *a2)
{
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (os_eventlink_signal_and_wait()) {
    uint64_t result = 3758097111;
  }
  else {
    uint64_t result = 0;
  }
  if (a2) {
    *a2 = 0;
  }
  return result;
}

uint64_t IOEventLink::SignalAndWaitUntil(IOEventLink *this, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  uint64_t v4 = 3758097090;
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (!a2)
  {
    if (os_eventlink_signal_and_wait_until()) {
      uint64_t v4 = 3758097111;
    }
    else {
      uint64_t v4 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
  }
  return v4;
}

uint64_t IOEventLink::WaitUntil(IOEventLink *this, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  uint64_t v4 = 3758097090;
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (!a2)
  {
    if (os_eventlink_wait_until()) {
      uint64_t v4 = 3758097111;
    }
    else {
      uint64_t v4 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
  }
  return v4;
}

uint64_t IOEventLink::Wait(IOEventLink *this, unint64_t *a2)
{
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (os_eventlink_wait()) {
    uint64_t result = 3758097111;
  }
  else {
    uint64_t result = 0;
  }
  if (a2) {
    *a2 = 0;
  }
  return result;
}

uint64_t IOEventLink::Associate(IOEventLink *this, unint64_t a2)
{
  uint64_t v2 = 3758097090;
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (a2 <= 1)
  {
    if (os_eventlink_associate()) {
      return 3758097111;
    }
    else {
      return 0;
    }
  }
  return v2;
}

uint64_t IOEventLink::Disassociate(IOEventLink *this)
{
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (os_eventlink_disassociate()) {
    return 3758097111;
  }
  return 0;
}

uint64_t IOEventLink::Activate(IOEventLink *this)
{
  if (!*(void *)(*((void *)this + 5) + 8)) {
    return 3758097112;
  }
  if (os_eventlink_activate()) {
    return 3758097111;
  }
  return 0;
}

BOOL IOExtensiblePaniclog::init(IOExtensiblePaniclog *this)
{
  uint64_t v2 = IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
  *((void *)this + 6) = v2;
  return v2 != 0;
}

BOOL non-virtual thunk to'IOExtensiblePaniclog::init(IOExtensiblePaniclog *this)
{
  uint64_t v2 = IOMallocZeroTyped(8uLL, 0x2004093837F09uLL);
  *((void *)this + 3) = v2;
  return v2 != 0;
}

void IOExtensiblePaniclog::free(OSMetaClassBase *this)
{
  uint64_t v2 = this[2].__vftable;
  if (v2)
  {
    if (v2->getMetaClass)
    {
      (*(void (**)(const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden)))(*(void *)v2->getMetaClass
                                                                                              + 16))(v2->getMetaClass);
      this[2].getMetaClass = 0;
      uint64_t v2 = this[2].__vftable;
    }
    IOFree(v2, 8uLL);
  }

  OSObjectFree((OSMetaClass *)this);
}

void non-virtual thunk to'IOExtensiblePaniclog::free(OSMetaClassBase *this)
{
}

uint64_t IOExtensiblePaniclog::ClaimBuffer(IOExtensiblePaniclog *this, unint64_t *a2, unint64_t *a3)
{
  uint64_t v8 = 0;
  if (**((void **)this + 6))
  {
LABEL_2:
    uint64_t v6 = 0;
    *a2 = *(void *)(*(void *)(**((void **)this + 6) + 40) + 24);
    *a3 = **(void **)(**((void **)this + 6) + 40);
    return v6;
  }
  uint64_t v6 = 3758097085;
  if (IOExtensiblePaniclog::CopyMemoryDescriptor((OSMetaClassBase *)this, (IOBufferMemoryDescriptor **)&v8, 0))return v6; {
  if (!IOMemoryDescriptor::CreateMapping(v8, 0, 0, 0, 0, 0, *((IOMemoryMap ***)this + 6), 0))
  }
  {
    if (v8)
    {
      ((void (*)(void))v8->release)();
      uint64_t v8 = 0;
    }
    goto LABEL_2;
  }
  if (v8) {
    ((void (*)(void))v8->release)();
  }
  return v6;
}

uint64_t non-virtual thunk to'IOExtensiblePaniclog::ClaimBuffer(IOExtensiblePaniclog *this, unint64_t *a2, unint64_t *a3)
{
  return IOExtensiblePaniclog::ClaimBuffer((IOExtensiblePaniclog *)((char *)this - 40), a2, a3);
}

uint64_t IOExtensiblePaniclog::YieldBuffer(OSMetaClassBase *this, unsigned int a2)
{
  IOExtensiblePaniclog::SetUsedLen(this, a2, 0);
  getMetaClass = this[2].getMetaClass;
  if (getMetaClass)
  {
    (*(void (**)(const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden)))(*(void *)getMetaClass
                                                                                            + 16))(getMetaClass);
    this[2].getMetaClass = 0;
  }
  return 0;
}

uint64_t non-virtual thunk to'IOExtensiblePaniclog::YieldBuffer(IOExtensiblePaniclog *this, unsigned int a2)
{
  return 0;
}

IORPCMessage *OSConsumeObjects(IORPCMessageMach *a1, BOOL a2)
{
  uint64_t result = IORPCMessageFromMach(a1, a2);
  uint64_t objectRefs = result->objectRefs;
  if (objectRefs)
  {
    uint64_t v4 = (IORPCMessage **)&result[1];
    do
    {
      uint64_t result = *v4;
      if (*v4)
      {
        uint64_t result = (IORPCMessage *)(*(uint64_t (**)(IORPCMessage *))(result->msgid + 16))(result);
        *uint64_t v4 = 0;
      }
      ++v4;
      --objectRefs;
    }
    while (objectRefs);
  }
  return result;
}

uint64_t _OSObjectCopyIn(uint64_t a1, OSMetaClass *a2, OSObject **a3)
{
  v46[1] = *(OSObject **)MEMORY[0x263EF8340];
  v46[0] = 0;
  unint64_t v6 = a1 + 8 * (((unint64_t)a2 >> 8) & 0x1FF);
  os_unfair_lock_lock((os_unfair_lock_t)a1);
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v8 = (OSObject_vtbl **)(v6 + 64);
  uint64_t v7 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  while (*(OSMetaClass **)(v7 + 24) != a2)
  {
    uint64_t v7 = *(void *)(v7 + 8);
    if (!v7) {
      goto LABEL_9;
    }
  }
  v46[0] = (OSObject *)(v7 + 88);
  if (OSObjectTryRetain((OSObject *)(v7 + 88)))
  {
    *a3 = (OSObject *)(v7 + 88);
    int v10 = *(_DWORD *)(v7 + 32);
    *(_DWORD *)(v7 + 32) = v10 + 1;
    if ((v10 + 1) >= 0xC9)
    {
      *(_DWORD *)(v7 + 32) = v10 - 199;
      if (mach_port_mod_refs(*MEMORY[0x263EF8960], *(_DWORD *)(v7 + 24), 0, -200)) {
        _OSObjectCopyIn();
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
    return 0;
  }
  else
  {
LABEL_9:
    MEMORY[0x270FA5388]();
    bzero(&v38, 0x2000uLL);
    v38.msgh.size_t msgh_size = 72;
    *(_OWORD *)&v39[12] = xmmword_23D3CAAB0;
    uint64_t v40 = 1;
    uint64_t v41 = a2;
    *(void *)&v38.msgh.mach_msg_id_t msgh_id = 0x14DA2B68CLL;
    uint64_t v12 = *(void *)(a1 + 24);
    v45[0] = &v38;
    v45[1] = &v38;
    v45[2] = 0x200000000048;
    uint64_t msgid_low = InvokeRemote(a1, v12, (uint64_t)v45);
    if (msgid_low) {
      goto LABEL_12;
    }
    thread_inspect_t v13 = IORPCMessageFromMach(&v38, 1);
    if (v13->msgid != 0x100000001) {
      _OSObjectCopyIn();
    }
    unsigned int v14 = v13;
    uint64_t msgid_low = LODWORD(v13[1].msgid);
    if (msgid_low)
    {
LABEL_12:
      unsigned int v15 = atomic_load((unsigned int *)(a1 + 4160));
      if (v15 <= 1)
      {
        IOLog("no services, exiting\n");
        exit(0);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)a1);
    }
    else
    {
      uint64_t flags = v13[1].flags;
      if (HIDWORD(flags)) {
        _OSObjectCopyIn();
      }
      if (v38.msgh.msgh_size <= 0xC3) {
        _OSObjectCopyIn();
      }
      uint64_t msgh_descriptor_count = v38.msgh_body.msgh_descriptor_count;
      unint64_t v19 = v38.msgh.msgh_size - 196;
      if (v19 < 12 * (unint64_t)v38.msgh_body.msgh_descriptor_count) {
        _OSObjectCopyIn();
      }
      p_uint64_t objectRefs = (const char *)&v13[1].objectRefs;
      unint64_t v43 = v19 - 12 * v38.msgh_body.msgh_descriptor_count;
      unint64_t v44 = v43 >> 4;
      if ((gIODKDebug & 2) != 0) {
        IOLog("OSObjectAllocate 0x%qx %s remote %d, flags %#x, qc %d, mc %d\n", a2, (const char *)&v13[1].objectRefs, flags & 1, flags, v38.msgh_body.msgh_descriptor_count, v44);
      }
      uint64_t v21 = (OSMetaClass *)OSFindClass(a1, (const char *)&v14[1].objectRefs);
      if (v21)
      {
        uint64_t v42 = p_objectRefs;
        if (OSObjectAllocate(v21, 1, v46)) {
          _OSObjectCopyIn();
        }
        uint64_t v22 = v46[0];
        p_ivars = (OSObject::$4342D741BF926617E558AFFE07804AA4 *)&v46[0][-3].ivars;
        if (v46[0] == (OSObject *)88 || ((uint64_t)v46[0][-1].ivars & 1) == 0) {
          _OSObjectCopyIn();
        }
        v46[0][-2].meta = a2;
        LODWORD(v22[-2].OSObjectInterface::__vftable) = 1;
        HIDWORD(v22[-1].OSObjectInterface::__vftable) = flags;
        if (flags)
        {
          HIDWORD(v22[-2].OSObjectInterface::__vftable) = msgh_descriptor_count;
          if (msgh_descriptor_count)
          {
            uint64_t v24 = (OSObject_vtbl *)IOMallocZeroTyped(8 * msgh_descriptor_count, 0x100004000313F17uLL);
            p_ivars = (OSObject::$4342D741BF926617E558AFFE07804AA4 *)&v22[-3].ivars;
            v22[-1].OSMetaClassBase::__vftable = v24;
            timespec v25 = (unsigned int *)v39;
            do
            {
              unsigned int v26 = *v25;
              v25 += 3;
              v24->getMetaClass = (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))v26;
              uint64_t v24 = (OSObject_vtbl *)((char *)v24 + 8);
              --msgh_descriptor_count;
            }
            while (msgh_descriptor_count);
          }
          int v27 = v44;
          LODWORD(v22[-2].ivars) = v44;
          if (v27)
          {
            size_t v28 = v43 & 0x7FFFFFFF0;
            uint64_t v29 = p_ivars;
            uint64_t v30 = IOMallocZeroTyped(v43 & 0x7FFFFFFF0, 0x100004000313F17uLL);
            *(void *)&v22[-1].__int32 refcount = v30;
            memmove(v30, &v14[7], v28);
            p_ivars = v29;
          }
        }
        uint64_t v31 = *v8;
        v22[-2].OSMetaClassBase::__vftable = *v8;
        if (v31) {
          v31->release = (void (__cdecl *)(const OSObject *__hidden))&v22[-2];
        }
        *uint64_t v8 = (OSObject_vtbl *)p_ivars;
        *(void *)&v22[-2].__int32 refcount = v8;
        meta = v22->meta;
        if (meta == (OSMetaClass *)v22) {
          uint64_t v33 = 0;
        }
        else {
          uint64_t v33 = v22->meta;
        }
        BOOL v34 = v33 != 0;
        if (v33) {
          BOOL v35 = v33 == gIOServiceMetaClass;
        }
        else {
          BOOL v35 = 1;
        }
        if (!v35)
        {
          do
          {
            meta = (OSMetaClass *)*((void *)meta->metaClassPrivate + 1);
            BOOL v34 = meta != 0;
            if (meta) {
              BOOL v36 = meta == gIOServiceMetaClass;
            }
            else {
              BOOL v36 = 1;
            }
          }
          while (!v36);
        }
        if (v34)
        {
          atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 4160), 1u, memory_order_relaxed);
          if ((gIODKDebug & 2) != 0)
          {
            unsigned int v37 = atomic_load((unsigned int *)(a1 + 4160));
            IOLog("serviceCount %d\n", v37);
            uint64_t v22 = v46[0];
          }
        }
        os_unfair_lock_unlock((os_unfair_lock_t)a1);
        if ((((uint64_t (*)(OSObject *))v22->init)(v22) & 1) == 0) {
          panic("Fatal error: %s::init() method failed during copy-in\n", v42);
        }
        uint64_t msgid_low = 0;
        *a3 = v22;
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)a1);
        return 3758097136;
      }
    }
  }
  return msgid_low;
}

uint64_t ___ZL15OSCopyInObjectsP18IOUserServer_IVarsP16IORPCMessageMachP12IORPCMessageb_block_invoke()
{
  uint64_t result = MEMORY[0x23ECFFE40](*MEMORY[0x263EF8960]);
  if (result) {
    ___ZL15OSCopyInObjectsP18IOUserServer_IVarsP16IORPCMessageMachP12IORPCMessageb_block_invoke_cold_1();
  }
  return result;
}

void ___ZL8LockTesti_block_invoke(uint64_t a1)
{
  os_unfair_lock_lock(*(os_unfair_lock_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1;
  IOSleep(1uLL);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  uint64_t v3 = *(os_unfair_lock_s **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  os_unfair_lock_unlock(v3);
}

void ___ZL8LockTesti_block_invoke_218(uint64_t a1)
{
  IORWLockWrite(*(IORWLock **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1;
  IOSleep(1uLL);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  IORWLockUnlock(*(IORWLock **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  IORWLockRead(*(IORWLock **)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v3 = *(IORWLock **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  IORWLockUnlock(v3);
}

uint64_t ___ZL8LockTesti_block_invoke_222(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  os_unfair_recursive_lock_lock_with_options();
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1;
  IOSleep(1uLL);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  os_unfair_recursive_lock_unlock();

  return os_unfair_recursive_lock_unlock();
}

uint64_t uiomessage(void *a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v2 = (void *)*a1;
  uint64_t v3 = (IORPCMessageMach *)a1[1];
  uint64_t v4 = *(void *)(*a1 + 40);
  bzero(&v8, 0x400uLL);
  (*(void (**)(void *))(*v2 + 8))(v2);
  thread_act_t v5 = *(IORecursiveConditionLock **)(v4 + 48);
  if (v5)
  {
    if ((*(unsigned char *)(v2[5] + 32) & 2) == 0) {
      IORecursiveConditionLockLock(v5);
    }
    Server(v2, v3, &v8);
    if ((*(unsigned char *)(v2[5] + 32) & 2) == 0) {
      IORecursiveConditionLockUnlock(*(IORecursiveConditionLock **)(v4 + 48));
    }
    free(a1);
  }
  else
  {
    v7[1] = v2;
    v7[0] = *(void *)(v4 + 8);
    *(void *)(v4 + 8) = v7;
    Server(v2, v3, &v8);
    *(void *)(v4 + 8) = v7[0];
  }
  if (v8.msgh.msgh_remote_port + 1 >= 2)
  {
    mach_msg2_internal();
    if (v8.msgh.msgh_id == 1302509197) {
      OSConsumeObjects(&v8, 1);
    }
  }
  return (*(uint64_t (**)(void *))(*v2 + 16))(v2);
}

void Server(void *a1, IORPCMessageMach *a2, IORPCMessageMach *a3)
{
  kern_return_t v15;
  IORPCMessage *v16;
  mach_msg_bits_t v17;
  IORPCMessage *v18;
  IORPC invoke;
  __uint64_t v20;
  char __str[64];
  uint64_t v22;

  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v20 = 0;
  pthread_threadid_np(0, &v20);
  uint64_t v6 = *(a1 - 11);
  mach_port_t msgh_remote_port = a2->msgh.msgh_remote_port;
  mach_msg_id_t msgh_id = a2->msgh.msgh_id;
  if ((gIODKDebug & 0x10) != 0)
  {
    snprintf(__str, 0x40uLL, "[%#qx] SERVER MSG:", v20);
    IOLogBuffer(__str, a2, a2->msgh.msgh_size);
  }
  if (a2->msgh.msgh_size >= 0x34)
  {
    if ((a2->msgh.msgh_bits & 0x80000000) == 0) {
      a2->msgh_body.uint64_t msgh_descriptor_count = 0;
    }
    uint64_t v9 = IORPCMessageFromMach(a2, 0);
    uint64_t v10 = (uint64_t)v9;
    uint64_t msgid = v9->msgid;
    unint64_t v12 = v9->flags | 1;
    v9->uint64_t flags = v12;
    if ((gIODKDebug & 4) != 0)
    {
      IOLog("[%#qx] %p %#qx flags %#qx object %#qx \n", v20, v9, msgid, v12, v9[1].msgid);
      unint64_t v12 = *(void *)(v10 + 8);
    }
    if ((msgh_remote_port == 0) != ((v12 >> 3) & 1)) {
      Server();
    }
    if (!OSCopyInObjects(v6, &a2->msgh.msgh_bits, v10) && a2->msgh_body.msgh_descriptor_count)
    {
      thread_inspect_t v13 = *(OSMetaClassBase **)(v10 + 24);
      if (v13)
      {
        uint32_t msgh_size = a2->msgh.msgh_size;
        invoke.message = a2;
        invoke.reply = a3;
        invoke.uint64_t sendSize = msgh_size;
        invoke.uint64_t replySize = 1024;
        unsigned int v15 = OSMetaClassBase::Invoke(v13, &invoke);
        OSConsumeObjects(a2, 0);
        if (msgh_remote_port)
        {
          if (!v15)
          {
            uint64_t v18 = IORPCMessageFromMach(a3, 1);
            if (OSCopyOutObjects((uint64_t)a3, (uint64_t)v18)) {
              Server();
            }
            if (a3->msgh_body.msgh_descriptor_count) {
              pthread_attr_t v17 = -2147483630;
            }
            else {
              pthread_attr_t v17 = 18;
            }
LABEL_25:
            a3->msgh.msgh_local_port = 0;
            a3->msgh.msgh_voucher_port = 0;
            a3->msgh.mach_port_t msgh_remote_port = msgh_remote_port;
            a3->msgh.msgh_bits = v17;
            if (!msgh_remote_port) {
              return;
            }
            goto LABEL_11;
          }
          *(void *)&a3->msgh.mach_msg_id_t msgh_id = 1302509197;
          long long v16 = IORPCMessageFromMach(a3, 1);
          v16->uint64_t msgid = msgid;
          *(_OWORD *)&v16->uint64_t flags = xmmword_23D3CAAC0;
          LODWORD(v16[1].msgid) = v15;
          HIDWORD(v16[1].msgid) = 0;
          a3->msgh.uint32_t msgh_size = 60;
        }
        pthread_attr_t v17 = 18;
        goto LABEL_25;
      }
      OSConsumeObjects(a2, 0);
    }
  }
  a3->msgh.msgh_local_port = 0;
  a3->msgh.msgh_voucher_port = 0;
  a3->msgh.msgh_bits = 18;
  *(void *)&a3->msgh_body.uint64_t msgh_descriptor_count = *MEMORY[0x263EF80C8];
  a3->msgh.mach_msg_id_t msgh_id = msgh_id + 100;
  a3->msgh.uint32_t msgh_size = 36;
  a3->msgh.mach_port_t msgh_remote_port = msgh_remote_port;
  a3[1].msgh.uint32_t msgh_size = -304;
  if (!msgh_remote_port) {
    return;
  }
LABEL_11:
  if ((gIODKDebug & 0x10) != 0)
  {
    snprintf(__str, 0x40uLL, "[%#qx] SERVER REPLY:", v20);
    IOLogBuffer(__str, a3, a3->msgh.msgh_size);
  }
}

uint64_t ___ZL31IOInterruptDispatchSourceThreadPv_block_invoke(uint64_t a1)
{
  *(int8x16_t *)(*(void *)(a1 + 40) + 40) = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  uint64_t result = IODispatchSource::CheckForWork(*(IODispatchSource **)(a1 + 64), 1, 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

const char *__cdecl OSCollectionTypeName(OSCollectionType t)
{
  OSCollectionType v1 = t - 1;
  if (t - 1 >= 0xD || ((0x178Fu >> v1) & 1) == 0) {
    OSCollectionTypeName_cold_1();
  }
  return off_264E988B8[v1];
}

void OSObjectRetain(OSObjectPtr container)
{
}

void OSObjectRelease(OSObjectPtr container)
{
}

uint64_t OSSerializationTypeID(int a1)
{
  unsigned int v1 = ((a1 & 0x7F000000u) - 0x1000000) >> 24;
  if (v1 >= 0xD || ((0x178Fu >> v1) & 1) == 0) {
    OSSerializationTypeID();
  }
  return qword_23D3CAD10[(char)v1];
}

OSCollectionType OSCollectionTypeID(OSObjectPtr obj)
{
  unsigned int v1 = OSMetaClassBase::safeMetaCast(obj, gOSContainerMetaClass);
  if (!v1) {
    OSCollectionTypeID_cold_1();
  }
  int v2 = (int)v1[1].meta->__vftable;

  return OSSerializationTypeID(v2);
}

uint64_t OSSerializationValue(OSSerialization *a1, unsigned int a2)
{
  ivars = a1->ivars;
  if (*((_DWORD *)ivars + 12) <= a2) {
    OSSerializationValue();
  }
  int v3 = *(_DWORD *)(*((void *)ivars + 5) + 4 * a2);
  int v4 = v3 & 0x7F000000;
  unsigned int v5 = v3 & 0xFFFFFF;
  if (v4 == 201326592) {
    return v5;
  }
  else {
    return a2;
  }
}

OSObjectPtr OSCreateObjectFromSerialization(OSSerializationPtr serial)
{
  ivars = serial->ivars;
  if (*((unsigned char *)ivars + 54))
  {
    int v2 = (const char *)*((void *)ivars + 2);
    uint64_t v3 = *((void *)ivars + 4);
    return (OSObjectPtr)OSUnserializeXML(v2, v3, 0);
  }
  if (*((unsigned char *)ivars + 53))
  {
    return OSCreateObjectFromSerializationInternal(serial, 1u);
  }
  unint64_t v73 = *((void *)ivars + 4);
  if (v73 < 4) {
    return 0;
  }
  unsigned int v5 = (const char *)*((void *)ivars + 2);
  int v6 = *(unsigned __int8 *)v5;
  BOOL v7 = v6 == 212;
  if (v6 != 212)
  {
    if (strcmp(byte_23D3CAB90, v5)) {
      return 0;
    }
  }
  if ((v5 & 3) != 0) {
    return 0;
  }
  BOOL v62 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = 0;
  IORPCMessageMach v8 = 0;
  v58 = 0;
  unsigned int v13 = 0;
  address = 0;
  uint64_t v61 = 0;
  unsigned int v70 = 0;
  uint64_t v71 = 0;
  __src = 0;
  v72 = (int *)(v5 + 4);
  uint64_t v14 = 4;
  while (2)
  {
    v67 = v11;
    v68 = v10;
    v66 = v12;
    anObject = v8;
LABEL_17:
    unsigned int v15 = v9;
LABEL_18:
    unint64_t v16 = v14 + 4;
    if (v14 + 4 > v73) {
      goto LABEL_109;
    }
    IORPCMessageMach v8 = 0;
    pthread_attr_t v17 = v72 + 1;
    int v18 = *v72;
    unint64_t v19 = v15;
    uint64_t v20 = *v72 & 0xFFFFFFLL;
    uint64_t v21 = (v20 + 3) >> 2;
    switch(((*v72 & 0x7F000000u) - 0x1000000) >> 24)
    {
      case 0u:
        IORPCMessageMach v8 = OSDictionaryCreate();
        v63 = 0;
        v64 = 0;
        char v22 = 0;
        BOOL v23 = v20 != 0;
        v65 = v8;
        goto LABEL_23;
      case 1u:
        IORPCMessageMach v8 = OSArrayCreate();
        v64 = v8;
        v65 = 0;
        v63 = 0;
        char v22 = 0;
        BOOL v23 = v20 != 0;
        goto LABEL_23;
      case 2u:
        IORPCMessageMach v8 = OSSetCreate();
        v64 = 0;
        v65 = 0;
        char v22 = 0;
        BOOL v23 = v20 != 0;
        v63 = v8;
LABEL_23:
        BOOL v24 = v62;
        goto LABEL_45;
      case 3u:
        unint64_t v16 = v14 + 12;
        if (v14 + 12 > v73) {
          goto LABEL_109;
        }
        HIDWORD(v26) = *v72;
        LODWORD(v26) = v20 - 8;
        unsigned int v25 = v26 >> 3;
        BOOL v27 = v25 > 7;
        int v28 = (1 << v25) & 0x8B;
        if (v27 || v28 == 0) {
          goto LABEL_109;
        }
        IORPCMessageMach v8 = OSNumberCreateWithUInt64Value(*(void *)(v72 + 1));
        v64 = 0;
        v65 = 0;
        v63 = 0;
        BOOL v23 = 0;
        char v22 = 0;
        BOOL v24 = 0;
        pthread_attr_t v17 = v72 + 3;
        goto LABEL_45;
      case 7u:
        if (!v20) {
          goto LABEL_109;
        }
        v16 += 4 * v21;
        if (v16 > v73 || *((unsigned char *)v17 + (v20 - 1))) {
          goto LABEL_109;
        }
        uint64_t v30 = (const char *)(v72 + 1);
        size_t v31 = -1;
        goto LABEL_36;
      case 8u:
        v16 += 4 * v21;
        if (v16 > v73) {
          goto LABEL_109;
        }
        size_t v31 = v20;
        uint64_t v30 = (const char *)(v72 + 1);
LABEL_36:
        vm_size_t v32 = OSStringCreate(v30, v31);
        goto LABEL_39;
      case 9u:
        v16 += 4 * v21;
        if (v16 > v73) {
          goto LABEL_109;
        }
        vm_size_t v32 = OSDataCreate(v17, v20);
LABEL_39:
        IORPCMessageMach v8 = v32;
        v64 = 0;
        v65 = 0;
        v63 = 0;
        BOOL v23 = 0;
        char v22 = 0;
        BOOL v24 = 0;
        v17 += v21;
        goto LABEL_45;
      case 0xAu:
        v64 = 0;
        v65 = 0;
        v63 = 0;
        BOOL v23 = 0;
        char v22 = 0;
        BOOL v24 = 0;
        uint64_t v33 = &kOSBooleanTrue;
        if (!v20) {
          uint64_t v33 = &kOSBooleanFalse;
        }
        IORPCMessageMach v8 = *v33;
        goto LABEL_45;
      case 0xBu:
        if (v20 >= v70) {
          goto LABEL_109;
        }
        v64 = 0;
        v65 = 0;
        v63 = 0;
        BOOL v23 = 0;
        BOOL v24 = 0;
        char v22 = 1;
        IORPCMessageMach v8 = (OSObject *)__src[v20];
LABEL_45:
        if (!v8) {
          goto LABEL_110;
        }
        if (v24)
        {
          uint64_t v14 = v16 + 4;
          BOOL v27 = v16 + 4 > v73;
          uint64_t v34 = v71;
          if (v27) {
            goto LABEL_108;
          }
          unsigned int v15 = v19;
          v72 = v17 + 1;
          if (v22)
          {
LABEL_52:
            IORPCMessageMach v38 = (OSArray *)v67;
            unsigned int v37 = (OSSet *)v68;
            uint64_t v39 = (OSDictionary *)v66;
            goto LABEL_59;
          }
        }
        else
        {
          uint64_t v14 = v16;
          v72 = v17;
          uint64_t v34 = v71;
          unsigned int v15 = v19;
          if (v22) {
            goto LABEL_52;
          }
        }
        if (v70 >= v34)
        {
          if (BYTE3(v34) || (uint64_t v36 = (v34 + 64), (v40 = IOMallocTyped(8 * v36, 0x2004093837F09uLL)) == 0))
          {
LABEL_108:
            ((void (*)(OSObject *))v8->release)(v8);
            goto LABEL_109;
          }
          BOOL v35 = v40;
          if (__src)
          {
            size_t v41 = 8 * v34;
            memmove(v40, __src, v41);
            IOFree(__src, v41);
          }
          unsigned int v15 = v19;
        }
        else
        {
          BOOL v35 = __src;
          uint64_t v36 = v34;
        }
        IORPCMessageMach v38 = (OSArray *)v67;
        unsigned int v37 = (OSSet *)v68;
        uint64_t v39 = (OSDictionary *)v66;
        v35[v70++] = v8;
        __src = v35;
        uint64_t v34 = v36;
LABEL_59:
        uint64_t v71 = v34;
        if (v39)
        {
          if (!v15)
          {
            unsigned int v15 = v8;
            goto LABEL_80;
          }
          uint64_t v42 = OSMetaClassBase::safeMetaCast(v15, gOSStringMetaClass);
          if (v42)
          {
            unint64_t v43 = (unint64_t)v42;
          }
          else
          {
            uint64_t v45 = OSMetaClassBase::safeMetaCast(v15, gOSStringMetaClass);
            unint64_t v43 = (unint64_t)v45;
            if (v45)
            {
              ((void (*)(OSMetaClassBase *))v45->retain)(v45);
              unsigned int v15 = (const OSMetaClassBase *)v43;
            }
            else
            {
              unsigned int v15 = 0;
            }
          }
          if (v8 == v39) {
            int v46 = 1;
          }
          else {
            int v46 = OSDictionarySetValueInternal(v39, v43, 0, v8);
          }
          if (v43 && (const OSMetaClassBase *)v43 != v15) {
            (*(void (**)(unint64_t))(*(void *)v43 + 16))(v43);
          }
          unsigned int v15 = 0;
          goto LABEL_79;
        }
        if (v38)
        {
          int v44 = OSArraySetValueInternal(v38, 0xFFFFFFFFFFFFFFFFLL, v8, 0);
LABEL_70:
          int v46 = v44;
LABEL_79:
          if (!v46) {
            goto LABEL_109;
          }
          goto LABEL_80;
        }
        if (v37)
        {
          int v44 = OSSet::setObject(v37, v8);
          goto LABEL_70;
        }
        if (v58) {
          goto LABEL_109;
        }
        v58 = v8;
        if (anObject) {
          OSCreateObjectFromSerialization_cold_1();
        }
LABEL_80:
        if (v23)
        {
          if (v18 >= 0) {
            uint64_t v49 = anObject;
          }
          else {
            uint64_t v49 = 0;
          }
          if (++v13 < v61)
          {
            uint64_t v9 = v15;
            uint64_t v50 = address;
            uint64_t v51 = v61;
            goto LABEL_107;
          }
          if (v61 > 0x3F
            || (uint64_t v9 = v15, v51 = (v61 + 64), (v52 = IOMallocTyped(8 * v51, 0x2004093837F09uLL)) == 0))
          {
LABEL_109:
            IORPCMessageMach v8 = 0;
            goto LABEL_110;
          }
          uint64_t v50 = v52;
          if (address)
          {
            size_t v53 = 8 * v61;
            memmove(v52, address, v53);
            IOFree(address, v53);
          }
LABEL_107:
          uint64_t v11 = v64;
          unint64_t v12 = v65;
          uint64_t v10 = v63;
          v50[v13] = v49;
          address = v50;
          uint64_t v61 = v51;
          continue;
        }
        if ((v18 & 0x80000000) == 0) {
          goto LABEL_18;
        }
        if (v13)
        {
          uint64_t v9 = v15;
          do
          {
            uint64_t v47 = (const OSMetaClassBase *)address[v13];
            if (v47) {
              BOOL v48 = 1;
            }
            else {
              BOOL v48 = v13 == 1;
            }
            --v13;
          }
          while (!v48);
          if (v47)
          {
            anObject = (OSMetaClassBase *)v47;
            v67 = 0;
            v68 = 0;
            v66 = OSMetaClassBase::safeMetaCast(v47, gOSDictionaryMetaClass);
            if (!v66)
            {
              v67 = OSMetaClassBase::safeMetaCast(anObject, gOSArrayMetaClass);
              v68 = 0;
              v66 = 0;
              if (!v67)
              {
                v66 = 0;
                v67 = 0;
                IORPCMessageMach v8 = 0;
                v68 = OSMetaClassBase::safeMetaCast(anObject, gOSSetMetaClass);
                if (!v68) {
                  goto LABEL_110;
                }
              }
            }
            goto LABEL_17;
          }
        }
        IORPCMessageMach v8 = v58;
LABEL_110:
        if (v71)
        {
          unsigned int v54 = v8 != 0;
          int v55 = v70 - v54;
          if (v70 > v54)
          {
            v56 = &__src[v8 != 0];
            do
            {
              uint64_t v57 = *v56++;
              (*(void (**)(uint64_t))(*(void *)v57 + 16))(v57);
              --v55;
            }
            while (v55);
          }
          IOFree(__src, 8 * v71);
        }
        if (v61) {
          IOFree(address, 8 * v61);
        }
        return v8;
      default:
        goto LABEL_110;
    }
  }
}

OSStringPtr OSCreateObjectFromSerializationInternal(OSSerialization *a1, unsigned int a2)
{
  uint64_t v2 = *((void *)a1->ivars + 5);
  int v3 = *(_DWORD *)(v2 + 4 * a2);
  int v4 = v3 & 0x7F000000;
  switch(((v3 & 0x7F000000u) - 0x1000000) >> 24)
  {
    case 0u:
      pObject = 0;
      BOOL v7 = &gOSDictionaryMetaClass;
      goto LABEL_18;
    case 1u:
    case 2u:
      pObject = 0;
      if (v4 == 0x2000000) {
        BOOL v7 = &gOSArrayMetaClass;
      }
      else {
        BOOL v7 = &gOSSetMetaClass;
      }
LABEL_18:
      if (OSObjectAllocate(*v7, &pObject)) {
        unsigned int v13 = 0;
      }
      else {
        unsigned int v13 = pObject;
      }
      uint64_t v14 = (OSObjectInterface_vtbl *)IOMallocZeroTyped(0x28uLL, 0x1020040FBF3A4F7uLL);
      v13[1].OSObjectInterface::__vftable = v14;
      v13[1].OSMetaClassBase::__vftable = (OSObject_vtbl *)v14;
      LODWORD(v14->init) = v3;
      v13[1].free = (void (__cdecl *)(OSObjectInterface *__hidden))a1;
      ((void (*)(OSSerialization *))a1->retain)(a1);
      LODWORD(v13[1].OSObjectInterface::__vftable[1].init) = a2;
      HIDWORD(v13[1].OSObjectInterface::__vftable[1].init) = v3 & 0xFFFFFF;
      return (OSStringPtr)v13;
    case 3u:
    case 9u:
      if (v4 == 167772160)
      {
        pObject = 0;
        IORPCMessageMach v8 = &gOSDataMetaClass;
      }
      else
      {
        if (v4 != 0x4000000) {
          OSCreateObjectFromSerializationInternal();
        }
        pObject = 0;
        IORPCMessageMach v8 = &gOSNumberMetaClass;
      }
      if (OSObjectAllocate(*v8, &pObject)) {
        unsigned int v13 = 0;
      }
      else {
        unsigned int v13 = pObject;
      }
      unsigned int v15 = OSSerializationSize(a1, a2);
      if (v15 >> 30) {
        OSCreateObjectFromSerializationInternal();
      }
      size_t v16 = 4 * v15;
      pthread_attr_t v17 = (OSObject_vtbl *)IOMallocZeroTyped(v16, 0xF05D80D2uLL);
      v13[1].OSMetaClassBase::__vftable = v17;
      memmove(v17, (const void *)(*((void *)a1->ivars + 5) + 4 * a2), v16);
      return (OSStringPtr)v13;
    case 7u:
      if ((v3 & 0xFFFFFF) != 0)
      {
        uint64_t v9 = (const char *)(v2 + 4 * (a2 + 1));
        size_t v10 = (v3 & 0xFFFFFFu) - 1;
LABEL_11:
        return OSStringCreate(v9, v10);
      }
      else
      {
        return 0;
      }
    case 8u:
      uint64_t v9 = (const char *)(v2 + 4 * (a2 + 1));
      size_t v10 = *(void *)&v3 & 0xFFFFFFLL;
      goto LABEL_11;
    case 0xAu:
      unint64_t v12 = &kOSBooleanTrue;
      if ((v3 & 0xFFFFFF) == 0) {
        unint64_t v12 = &kOSBooleanFalse;
      }
      return (OSStringPtr)*v12;
    default:
      OSCreateObjectFromSerializationInternal();
  }
}

const char *__cdecl OSStringGetStringPtr(OSStringPtr obj)
{
  ivars = obj->ivars;
  int v2 = *(_DWORD *)ivars;
  if ((*(_DWORD *)ivars & 0x7E000000 | 0x1000000) != 0x9000000) {
    return 0;
  }
  int v3 = (char *)ivars + 4;
  if ((v2 & 0x7FFFFFFF) == 0x8000000) {
    return 0;
  }
  else {
    return v3;
  }
}

size_t OSStringGetLength(OSStringPtr string)
{
  return OSSerializationGetStringLength((const unsigned int *)string->ivars);
}

uint64_t OSSerializationGetStringLength(const unsigned int *a1)
{
  unsigned int v1 = *a1 & 0x7F000000;
  if ((*a1 & 0x7E000000 | 0x1000000) != 0x9000000) {
    return 0;
  }
  uint64_t result = *a1 & 0xFFFFFF;
  if (v1 == 0x8000000)
  {
    if (!result) {
      OSSerializationGetStringLength();
    }
    --result;
  }
  return result;
}

OSStringPtr OSStringCreate(const char *cstring, size_t length)
{
  if (length == -1)
  {
    size_t v3 = strlen(cstring);
  }
  else
  {
    size_t v3 = length;
    size_t v4 = strnlen(cstring, length);
    if (v4 != v3)
    {
      size_t v5 = v4;
      IOLog("OSStringCreate(\"%s\", %ld should be %ld)\n", cstring, v3, v4);
      size_t v3 = v5;
    }
  }
  if (v3 >> 24) {
    OSStringCreate_cold_1();
  }
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 0x40000000;
  v17[2] = __OSStringCreate_block_invoke;
  v17[3] = &__block_descriptor_tmp_0;
  v17[4] = v3;
  v17[5] = cstring;
  unsigned __int8 v6 = OSStringHash(cstring, v3);
  os_unfair_lock_lock((os_unfair_lock_t)&OSUniqueStringsLock);
  BOOL v7 = OSStringFind(v6, (uint64_t)v17);
  if (v7)
  {
    IORPCMessageMach v8 = (OSString *)v7[2];
    os_unfair_lock_unlock((os_unfair_lock_t)&OSUniqueStringsLock);
    if (v8) {
      return v8;
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&OSUniqueStringsLock);
  }
  if (v3 >= 0xFFFFFF) {
    OSStringCreate_cold_2();
  }
  if ((v3 & 0xFFFFFFFFFFFFFFFCLL) + 4 <= v3) {
    OSStringCreate_cold_3();
  }
  pObject = 0;
  if (OSObjectAllocate(gOSStringMetaClass, &pObject)) {
    IORPCMessageMach v8 = 0;
  }
  else {
    IORPCMessageMach v8 = (OSString *)pObject;
  }
  uint64_t v9 = (OSContainer_IVars *)IOMallocZeroTyped((v3 & 0xFFFFFFFFFFFFFFFCLL) + 8, 0xEBE06587uLL);
  v8->ivars = v9;
  *(_DWORD *)uint64_t v9 = v3 | 0x9000000;
  strncpy((char *)v8->ivars + 4, cstring, v3);
  size_t v10 = IOMallocTyped(0x18uLL, 0xA0040A8488062uLL);
  v10[2] = v8;
  os_unfair_lock_lock((os_unfair_lock_t)&OSUniqueStringsLock);
  uint64_t v11 = OSStringFind(v6, (uint64_t)v17);
  if (v11)
  {
    IORPCMessageMach v8 = (OSString *)v11[2];
    os_unfair_lock_unlock((os_unfair_lock_t)&OSUniqueStringsLock);
    (*(void (**)(void))(*(void *)v10[2] + 16))(v10[2]);
    IOFree(v10, 0x18uLL);
  }
  else
  {
    unint64_t v12 = (uint64_t *)((char *)&OSUniqueStrings + 16 * v6);
    uint64_t v13 = *v12;
    void *v10 = *v12;
    if (v13) {
      uint64_t v14 = (void *)(v13 + 8);
    }
    else {
      uint64_t v14 = v12 + 1;
    }
    *uint64_t v14 = v10;
    uint64_t *v12 = (uint64_t)v10;
    v10[1] = v12;
    os_unfair_lock_unlock((os_unfair_lock_t)&OSUniqueStringsLock);
  }
  return v8;
}

BOOL __OSStringCreate_block_invoke(uint64_t a1, uint64_t a2)
{
  size_t StringLength = OSSerializationGetStringLength(*(const unsigned int **)(a2 + 40));
  if (StringLength != *(void *)(a1 + 32)) {
    return 0;
  }
  size_t v5 = *(int **)(a2 + 40);
  int v7 = *v5;
  unsigned __int8 v6 = v5 + 1;
  int v8 = v7 & 0x7E000000 | 0x1000000;
  if ((v7 & 0x7FFFFFFF) == 0x8000000) {
    unsigned __int8 v6 = 0;
  }
  uint64_t v9 = v8 == 150994944 ? (const char *)v6 : 0;
  if (strncmp(*(const char **)(a1 + 40), v9, StringLength)) {
    return 0;
  }

  return OSObjectTryRetain((OSObject *)a2);
}

uint64_t OSStringHash(const char *a1, unint64_t a2)
{
  if (a2 >> 24) {
    OSStringHash();
  }
  if (a2)
  {
    unint64_t v2 = a2;
    int v3 = a2;
    do
    {
      int v4 = *a1++;
      int v3 = 257 * v3 + v4;
      --v2;
    }
    while (v2);
  }
  else
  {
    int v3 = 0;
  }
  return ((v3 << a2) + v3);
}

void *OSStringFind(unsigned __int8 a1, uint64_t a2)
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&OSUniqueStringsLock);
  int v4 = (void *)((char *)&OSUniqueStrings + 16 * a1);
  do
    int v4 = (void *)*v4;
  while (v4 && !(*(unsigned int (**)(uint64_t, void))(a2 + 16))(a2, v4[2]));
  return v4;
}

void OSString::free(OSString *this)
{
  ivars = (const unsigned int *)this->ivars;
  if ((*ivars & 0x7FFFFFFF) == 0x8000000) {
    int v3 = 0;
  }
  else {
    int v3 = (const char *)(ivars + 1);
  }
  if ((*ivars & 0x7E000000 | 0x1000000) == 0x9000000) {
    int v4 = v3;
  }
  else {
    int v4 = 0;
  }
  unint64_t StringLength = OSSerializationGetStringLength(ivars);
  unsigned __int8 v6 = OSStringHash(v4, StringLength);
  os_unfair_lock_lock((os_unfair_lock_t)&OSUniqueStringsLock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 0x40000000;
  v12[2] = ___ZN8OSString4freeEv_block_invoke;
  v12[3] = &__block_descriptor_tmp_16;
  v12[4] = this;
  int v7 = OSStringFind(v6, (uint64_t)v12);
  if (v7)
  {
    int v8 = v7;
    if ((OSString *)v7[2] != this) {
      OSString::free();
    }
    uint64_t v9 = *v7;
    size_t v10 = (void *)v7[1];
    if (*v7)
    {
      *(void *)(v9 + 8) = v10;
      size_t v10 = (void *)v7[1];
    }
    else
    {
      OSUniqueStrings[2 * v6 + 1] = v10;
    }
    void *v10 = v9;
    os_unfair_lock_unlock((os_unfair_lock_t)&OSUniqueStringsLock);
    IOFree(v8, 0x18uLL);
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&OSUniqueStringsLock);
  }
  uint64_t v11 = this->ivars;
  if (v11)
  {
    if ((StringLength + 1) >> 24) {
      OSString::free();
    }
    if ((StringLength & 0xFFFFFFFFFFFFFFFCLL) + 4 < StringLength + 1) {
      OSString::free();
    }
    IOFree(v11, (StringLength & 0xFFFFFFFFFFFFFFFCLL) + 8);
    this->ivars = 0;
  }
  OSObject::free(this);
}

const char *__cdecl OSString::getCStringNoCopy(const OSString *this)
{
  ivars = this->ivars;
  int v2 = *(_DWORD *)ivars;
  if ((*(_DWORD *)ivars & 0x7E000000 | 0x1000000) != 0x9000000) {
    return 0;
  }
  int v3 = (char *)ivars + 4;
  if ((v2 & 0x7FFFFFFF) == 0x8000000) {
    return 0;
  }
  else {
    return v3;
  }
}

size_t OSString::getLength(const OSString *this)
{
  return OSSerializationGetStringLength((const unsigned int *)this->ivars);
}

BOOL ___ZN8OSString4freeEv_block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

void non-virtual thunk to'OSString::free(OSString *this)
{
}

uint64_t OSSerializationGetBytesPtr(const unsigned int *a1, unint64_t a2, unint64_t a3)
{
  if ((*a1 & 0x7F000000) != 0xA000000) {
    return 0;
  }
  unint64_t v3 = *a1 & 0xFFFFFF;
  BOOL v4 = v3 > a2;
  unint64_t v5 = v3 - a2;
  if (v4 && v5 >= a3) {
    return (uint64_t)a1 + a2 + 4;
  }
  else {
    return 0;
  }
}

size_t OSSerializationGetBytes(const unsigned int *a1, void *__dst, unint64_t a3, size_t a4)
{
  if ((*a1 & 0x7F000000) != 0xA000000) {
    return 0;
  }
  unint64_t v4 = *a1 & 0xFFFFFF;
  BOOL v5 = v4 > a3;
  size_t v6 = v4 - a3;
  if (!v5) {
    return 0;
  }
  if (v6 >= a4) {
    size_t v7 = a4;
  }
  else {
    size_t v7 = v6;
  }
  memcpy(__dst, (char *)a1 + a3 + 4, v7);
  return v7;
}

const void *__cdecl OSDataGetBytesPtr(OSDataPtr obj, size_t offset, size_t length)
{
  ivars = obj->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0xA000000
    && ((size_t v4 = *(_DWORD *)ivars & 0xFFFFFF, v5 = v4 > offset, v6 = v4 - offset, v5) ? (v7 = v6 >= length) : (v7 = 0), v7))
  {
    return (char *)ivars + offset + 4;
  }
  else
  {
    return 0;
  }
}

size_t OSDataGetLength(OSDataPtr obj)
{
  return *(_DWORD *)obj->ivars & 0xFFFFFFLL;
}

size_t OSDataGetBytes(OSDataPtr obj, void *buffer, size_t offset, size_t length)
{
  ivars = obj->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) != 0xA000000) {
    return 0;
  }
  size_t v5 = *(_DWORD *)ivars & 0xFFFFFF;
  BOOL v6 = v5 > offset;
  size_t v7 = v5 - offset;
  if (!v6) {
    return 0;
  }
  size_t v8 = (size_t)ivars + offset;
  if (v7 >= length) {
    size_t v9 = length;
  }
  else {
    size_t v9 = v7;
  }
  memcpy(buffer, (const void *)(v8 + 4), v9);
  return v9;
}

OSDataPtr OSDataCreate(const void *bytes, size_t length)
{
  if (length >> 24) {
    return 0;
  }
  size_t v4 = (length + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (v4 < length) {
    OSDataCreate_cold_1();
  }
  pObject = 0;
  if (OSObjectAllocate(gOSDataMetaClass, &pObject)) {
    int v2 = 0;
  }
  else {
    int v2 = (OSData *)pObject;
  }
  BOOL v6 = (OSContainer_IVars *)IOMallocTyped(v4 + 4, 0x852CFE4EuLL);
  v2->ivars = v6;
  *(_DWORD *)BOOL v6 = length | 0xA000000;
  memcpy((char *)v2->ivars + 4, bytes, length);
  return v2;
}

BOOL OSDataAppendBytes(OSDataPtr data, const void *bytes, size_t length)
{
  OSDataPtr v3 = data;
  LOBYTE(data) = 0;
  uint64_t v4 = *(_DWORD *)v3->ivars & 0xFFFFFFLL;
  size_t v5 = v4 + length;
  if (!__CFADD__(v4, length) && !(v5 >> 24))
  {
    data = (OSDataPtr)malloc_type_realloc(v3->ivars, v5 + 4, 0x5A2EA038uLL);
    if (data)
    {
      v3->ivars = (OSContainer_IVars *)data;
      LODWORD(data->OSContainer::OSObject::OSMetaClassBase::__vftable) = v5 | 0xA000000;
      memcpy((char *)v3->ivars + v4 + 4, bytes, length);
      LOBYTE(data) = 1;
    }
  }
  return (char)data;
}

uint64_t OSSerializationGetUInt64Value(const unsigned int *a1)
{
  if ((*a1 & 0x7F000000) == 0x4000000) {
    return *(void *)(a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t OSNumberGetUInt64Value(OSNumberPtr obj)
{
  ivars = obj->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
    return *(void *)((char *)ivars + 4);
  }
  else {
    return 0;
  }
}

OSNumberPtr OSNumberCreateWithUInt64Value(uint64_t value)
{
  pObject = 0;
  if (OSObjectAllocate(gOSNumberMetaClass, &pObject)) {
    int v2 = 0;
  }
  else {
    int v2 = (OSNumber *)pObject;
  }
  OSDataPtr v3 = (OSContainer_IVars *)IOMallocTyped(0xCuLL, 0xD48035E0uLL);
  v2->ivars = v3;
  *(_DWORD *)OSDataPtr v3 = 67108928;
  *(void *)((char *)v2->ivars + 4) = value;
  return v2;
}

OSDictionaryPtr OSDictionaryCreate(void)
{
  pObject = 0;
  if (OSObjectAllocate(gOSDictionaryMetaClass, &pObject)) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = (OSDictionary *)pObject;
  }
  unsigned int v1 = (OSDictionary_IVars *)IOMallocZeroTyped(0x28uLL, 0x1020040FBF3A4F7uLL);
  v0->ivars = v1;
  v0->ivars = v1;
  *(_DWORD *)unsigned int v1 = 0x1000000;
  return v0;
}

uint32_t OSDictionaryGetCount(OSDictionaryPtr obj)
{
  return *((_DWORD *)obj->ivars + 5);
}

uint32_t OSArrayGetCount(OSArrayPtr obj)
{
  return *((_DWORD *)obj->ivars + 5);
}

BOOL OSDictionaryApply(OSDictionaryPtr obj, OSDictionaryApplier applier)
{
  OSDictionaryContainerize((uint64_t)obj);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = __OSDictionaryApply_block_invoke;
  v5[3] = &__block_descriptor_tmp_22;
  v5[4] = applier;
  v5[5] = obj;
  return OSDictionaryInternalApply((uint64_t)obj, (uint64_t)v5);
}

uint64_t OSDictionaryContainerize(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 64);
  if (!*(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(unsigned int *)(v1 + 20);
    *(_DWORD *)(v1 + 24) = v3;
    *(void *)(*(void *)(result + 64) + 32) = malloc_type_malloc(16 * v3, 0xAE44659AuLL);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___ZL24OSDictionaryContainerizeP12OSDictionary_block_invoke;
    v5[3] = &__block_descriptor_tmp_165;
    v5[4] = v2;
    uint64_t v4 = *(void *)(v2 + 64);
    uint64_t result = *(void *)(v4 + 8);
    if (result) {
      return OSSerializationDictionaryApply((OSSerialization *)result, *(_DWORD *)(v4 + 16), (uint64_t)v5);
    }
  }
  return result;
}

uint64_t OSDictionaryInternalApply(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  if (*(void *)(v4 + 32))
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = *(void *)(a1 + 64);
      unint64_t v8 = *(unsigned int *)(v7 + 20);
      BOOL v9 = v6 < v8;
      if (v6 >= v8) {
        break;
      }
      char v10 = (*(uint64_t (**)(uint64_t, unint64_t, void, void, void))(a2 + 16))(a2, v6++, *(void *)(v7 + 8), *(void *)(*(void *)(v7 + 32) + v5), *(void *)(*(void *)(v7 + 32) + v5 + 8));
      v5 += 16;
    }
    while ((v10 & 1) == 0);
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    void v13[2] = ___ZL25OSDictionaryInternalApplyP12OSDictionaryU13block_pointerFbmP15OSSerialization17OSCollectionEntryS3_E_block_invoke;
    v13[3] = &__block_descriptor_tmp_169;
    v13[4] = a2;
    v13[5] = a1;
    uint64_t v11 = *(OSSerialization **)(v4 + 8);
    if (v11) {
      return OSSerializationDictionaryApply(v11, *(_DWORD *)(v4 + 16), (uint64_t)v13);
    }
    else {
      return 0;
    }
  }
  return v9;
}

uint64_t __OSDictionaryApply_block_invoke(uint64_t a1, uint64_t a2, OSSerialization *a3, OSMetaClassBase *anObject, uint64_t a5)
{
  unint64_t v6 = anObject;
  if (anObject)
  {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 16 * a2) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(anObject));
    unint64_t v6 = *(const OSMetaClassBase **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 16 * a2);
  }
  if (!OSMetaClassBase::safeMetaCast(v6, gOSStringMetaClass)) {
    __OSDictionaryApply_block_invoke_cold_1();
  }
  if (a5)
  {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 16 * a2 + 8) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a5));
    a5 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 16 * a2 + 8);
  }
  if (!a5) {
    __OSDictionaryApply_block_invoke_cold_2();
  }
  char v10 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v10();
}

BOOL OSDictionarySetValue(OSDictionaryPtr obj, const char *key, OSObjectPtr value)
{
  return OSDictionarySetValueInternal(obj, 0, (unint64_t)key, value);
}

uint64_t OSDictionarySetValueInternal(OSDictionary *a1, unint64_t a2, unint64_t a3, OSObject *a4)
{
  if (!(a2 | a3)) {
    OSDictionarySetValueInternal();
  }
  uint64_t v5 = (const char *)a3;
  OSStringPtr v6 = (OSStringPtr)a2;
  OSDictionaryContainerize((uint64_t)a1);
  ivars = a1->ivars;
  if (*((_DWORD *)ivars + 5))
  {
    uint64_t v9 = 0;
    unint64_t v10 = 0;
    while (1)
    {
      uint64_t v11 = *(const OSMetaClassBase **)(*((void *)ivars + 4) + v9);
      if (v11)
      {
        if (!v5)
        {
          unint64_t v12 = OSMetaClassBase::safeMetaCast(v6, gOSStringMetaClass);
          if (!v12)
          {
            uint64_t v5 = 0;
            goto LABEL_25;
          }
          meta = v12[1].meta;
          int v14 = (int)meta->__vftable;
          if (((uint64_t)meta->__vftable & 0x7E000000 | 0x1000000) == 0x9000000)
          {
            unsigned int v15 = (char *)&meta->__vftable + 4;
            if ((v14 & 0x7FFFFFFF) == 0x8000000) {
              uint64_t v5 = 0;
            }
            else {
              uint64_t v5 = v15;
            }
          }
          else
          {
            uint64_t v5 = 0;
          }
        }
        StringPtr = OSCollectionEntryGetStringPtr(*((void *)a1->ivars + 1), *(OSMetaClassBase **)(*((void *)a1->ivars + 4) + v9));
        if (StringPtr)
        {
          char v22 = (const char *)StringPtr;
          size_t StringLength = OSSerializationGetStringLength((const unsigned int *)(*(void *)(*(void *)(*((void *)a1->ivars + 1) + 48)
                                                                                         + 40)
                                                                             + 4
                                                                             * HIDWORD(*(void *)(*((void *)a1->ivars + 4)
                                                                                                 + v9))));
          if (StringLength == strlen(v5) && !strncmp(v22, v5, StringLength)) {
            goto LABEL_30;
          }
        }
      }
      else if (v6)
      {
        if (v11 == v6) {
          goto LABEL_30;
        }
      }
      else
      {
        size_t v16 = OSMetaClassBase::safeMetaCast(v11, gOSStringMetaClass);
        if (v16)
        {
          pthread_attr_t v17 = v16[1].meta;
          int v19 = (int)v17->__vftable;
          int v18 = (_DWORD *)&v17->__vftable + 1;
          uint64_t v20 = (v19 & 0x7FFFFFFF) == 0x8000000 ? 0 : (const char *)v18;
          if (!strcmp(v5, v20))
          {
LABEL_30:
            if (a4)
            {
              ((void (*)(OSObject *))a4->retain)(a4);
              uint64_t v24 = *((void *)a1->ivars + 4);
              uint64_t v25 = *(void *)(v24 + v9 + 8);
              if ((v25 & 1) == 0)
              {
                (*(void (**)(uint64_t))(*(void *)v25 + 16))(v25);
                uint64_t v24 = *((void *)a1->ivars + 4);
              }
              *(void *)(v24 + v9 + 8) = a4;
              ivars = a1->ivars;
              goto LABEL_34;
            }
            size_t v31 = a1->ivars;
            uint64_t v32 = *((void *)v31 + 4);
            uint64_t v33 = *(void *)(v32 + v9 + 8);
            if ((v33 & 1) == 0)
            {
              (*(void (**)(uint64_t))(*(void *)v33 + 16))(v33);
              size_t v31 = a1->ivars;
              uint64_t v32 = *((void *)v31 + 4);
            }
            uint64_t v34 = *(void *)(v32 + v9);
            if ((v34 & 1) == 0)
            {
              (*(void (**)(uint64_t))(*(void *)v34 + 16))(v34);
              size_t v31 = a1->ivars;
            }
            --*((_DWORD *)v31 + 5);
            memmove((void *)(*((void *)a1->ivars + 4) + v9), (const void *)(*((void *)a1->ivars + 4) + v9 + 16), 16 * (*((_DWORD *)a1->ivars + 5) - v10));
            return 1;
          }
        }
      }
LABEL_25:
      ++v10;
      ivars = a1->ivars;
      v9 += 16;
      if (v10 >= *((unsigned int *)ivars + 5)) {
        goto LABEL_28;
      }
    }
  }
  LODWORD(v10) = 0;
LABEL_28:
  if (!a4) {
    return 1;
  }
LABEL_34:
  uint64_t v26 = *((unsigned int *)ivars + 5);
  if (v10 < v26) {
    return 1;
  }
  uint64_t result = 0;
  uint64_t v28 = v26 + 1;
  uint64_t v29 = (v26 + 1) << 31 >> 31;
  if (v29 == v28 && (v29 & 0x8000000000000000) == 0)
  {
    unsigned int v30 = *((_DWORD *)ivars + 6);
    if (v30 >= v28)
    {
LABEL_47:
      if (v6) {
        ((void (*)(OSStringPtr))v6->retain)(v6);
      }
      else {
        OSStringPtr v6 = OSStringCreate(v5, 0xFFFFFFFFFFFFFFFFLL);
      }
      *(void *)(*((void *)a1->ivars + 4) + 16 * *((unsigned int *)a1->ivars + 5)) = v6;
      *(void *)(*((void *)a1->ivars + 4) + 16 * *((unsigned int *)a1->ivars + 5) + 8) = a4;
      ((void (*)(OSObject *))a4->retain)(a4);
      *((_DWORD *)a1->ivars + 5) = v28;
      return 1;
    }
    if (v30 > 0xFFFFFFEF) {
      return 0;
    }
    unsigned int v35 = v30 + 16;
    uint64_t result = (uint64_t)malloc_type_realloc(*((void **)ivars + 4), 16 * (v30 + 16), 0x7CEEAC2FuLL);
    if (result)
    {
      *((void *)a1->ivars + 4) = result;
      *((_DWORD *)a1->ivars + 6) = v35;
      goto LABEL_47;
    }
  }
  return result;
}

OSObjectPtr OSDictionaryGetValue(OSDictionaryPtr obj, const char *key)
{
  return (OSObjectPtr)OSDictionaryGetValueInternal(obj, 0, key);
}

uint64_t OSDictionaryGetValueInternal(OSDictionary *a1, OSObject *a2, const char *a3)
{
  unint64_t v8 = 0;
  OSDictionaryContainerize((uint64_t)a1);
  uint64_t result = OSDictionaryGetEntry(a1, a2, a3, &v8);
  if (result)
  {
    OSStringPtr v7 = OSCreateObjectFromSerializationInternal(*((OSSerialization **)a1->ivars + 1), HIDWORD(result));
    *(void *)(*((void *)a1->ivars + 4) + 16 * v8 + 8) = v7;
    return *(void *)(*((void *)a1->ivars + 4) + 16 * v8 + 8);
  }
  return result;
}

const char *__cdecl OSDictionaryGetStringValue(OSDictionaryPtr obj, const char *key)
{
  uint64_t result = (const char *)OSDictionaryGetEntry(obj, 0, key, 0);
  if (result)
  {
    uint64_t v4 = (OSMetaClassBase *)result;
    uint64_t v5 = *((void *)obj->ivars + 1);
    return (const char *)OSCollectionEntryGetStringPtr(v5, v4);
  }
  return result;
}

uint64_t OSDictionaryGetEntry(OSDictionary *a1, OSObject *a2, const char *a3, unint64_t *a4)
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  void v6[2] = ___ZL20OSDictionaryGetEntryP12OSDictionaryP8OSObjectPKcPm_block_invoke;
  v6[3] = &__block_descriptor_tmp_174;
  v6[4] = &v7;
  v6[5] = a3;
  void v6[6] = a2;
  v6[7] = a4;
  OSDictionaryInternalApply((uint64_t)a1, (uint64_t)v6);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

OSMetaClassBase *OSCollectionEntryGetStringPtr(uint64_t a1, OSMetaClassBase *anObject)
{
  if (anObject)
  {
    meta = (OSMetaClass *)(*(void *)(*(void *)(a1 + 48) + 40) + 4 * ((unint64_t)anObject >> 32));
  }
  else
  {
    uint64_t result = OSMetaClassBase::safeMetaCast(anObject, gOSStringMetaClass);
    if (!result) {
      return result;
    }
    meta = result[1].meta;
  }
  int v4 = (int)meta->__vftable;
  if (((uint64_t)meta->__vftable & 0x7E000000 | 0x1000000) != 0x9000000) {
    return 0;
  }
  uint64_t v5 = (_DWORD *)&meta->__vftable + 1;
  if ((v4 & 0x7FFFFFFF) == 0x8000000) {
    return 0;
  }
  else {
    return (OSMetaClassBase *)v5;
  }
}

void OSDictionarySetStringValue(OSDictionaryPtr obj, const char *key, const char *value)
{
  OSStringPtr v5 = OSStringCreate(value, 0xFFFFFFFFFFFFFFFFLL);
  OSDictionarySetValueInternal(obj, 0, (unint64_t)key, v5);
  release = v5->release;

  ((void (*)(OSStringPtr))release)(v5);
}

uint64_t OSDictionaryGetUInt64Value(OSDictionaryPtr obj, const char *key)
{
  uint64_t result = OSDictionaryGetEntry(obj, 0, key, 0);
  if (result)
  {
    int v4 = (OSMetaClassBase *)result;
    uint64_t v5 = *((void *)obj->ivars + 1);
    return (uint64_t)OSCollectionEntryGetUInt64Value(v5, v4);
  }
  return result;
}

OSMetaClassBase *OSCollectionEntryGetUInt64Value(uint64_t a1, OSMetaClassBase *anObject)
{
  if (anObject)
  {
    unint64_t meta = *(void *)(*(void *)(a1 + 48) + 40) + 4 * ((unint64_t)anObject >> 32);
  }
  else
  {
    uint64_t result = OSMetaClassBase::safeMetaCast(anObject, gOSNumberMetaClass);
    if (!result) {
      return result;
    }
    unint64_t meta = (unint64_t)result[1].meta;
  }
  if ((*(_DWORD *)meta & 0x7F000000) == 0x4000000) {
    return *(OSMetaClassBase **)(meta + 4);
  }
  else {
    return 0;
  }
}

void OSDictionarySetUInt64Value(OSDictionaryPtr obj, const char *key, uint64_t value)
{
  OSNumberPtr v5 = OSNumberCreateWithUInt64Value(value);
  OSDictionarySetValueInternal(obj, 0, (unint64_t)key, v5);
  release = v5->release;

  ((void (*)(OSNumberPtr))release)(v5);
}

OSArrayPtr OSArrayCreate(void)
{
  pObject = 0;
  if (OSObjectAllocate(gOSArrayMetaClass, &pObject)) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = (OSArray *)pObject;
  }
  uint64_t v1 = (OSArray_IVars *)IOMallocZeroTyped(0x28uLL, 0x1020040FBF3A4F7uLL);
  v0->ivars = v1;
  v0->ivars = v1;
  *(_DWORD *)uint64_t v1 = 0x2000000;
  return v0;
}

BOOL OSArrayApply(OSArrayPtr obj, OSArrayApplier applier)
{
  OSArrayContainerize((uint64_t)obj);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = __OSArrayApply_block_invoke;
  v5[3] = &__block_descriptor_tmp_26;
  v5[4] = applier;
  void v5[5] = obj;
  return OSArrayInternalApply((uint64_t)obj, 0, (uint64_t)v5);
}

uint64_t OSArrayContainerize(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 64);
  if (!*(void *)(v1 + 32))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(unsigned int *)(v1 + 20);
    *(_DWORD *)(v1 + 24) = v3;
    *(void *)(*(void *)(result + 64) + 32) = malloc_type_malloc(8 * v3, 0x95DEB533uLL);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 0x40000000;
    v5[2] = ___ZL19OSArrayContainerizeP7OSArray_block_invoke;
    v5[3] = &__block_descriptor_tmp_176;
    v5[4] = v2;
    uint64_t v4 = *(void *)(v2 + 64);
    uint64_t result = *(void *)(v4 + 8);
    if (result) {
      return OSSerializationArrayApply((OSSerialization *)result, *(_DWORD *)(v4 + 16), 0, (uint64_t)v5);
    }
  }
  return result;
}

uint64_t OSArrayInternalApply(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 64);
  if (*(void *)(v5 + 32))
  {
    unint64_t v6 = a2;
    do
    {
      uint64_t v7 = *(void *)(a1 + 64);
      unint64_t v8 = *(unsigned int *)(v7 + 20);
      BOOL v9 = v6 < v8;
      if (v6 >= v8) {
        break;
      }
      char v10 = (*(uint64_t (**)(uint64_t, unint64_t, void, void))(a3 + 16))(a3, v6, *(void *)(v7 + 8), *(void *)(*(void *)(v7 + 32) + 8 * v6));
      ++v6;
    }
    while ((v10 & 1) == 0);
  }
  else
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 1107296256;
    void v13[2] = ___ZL20OSArrayInternalApplyP7OSArrayjU13block_pointerFbmP15OSSerialization17OSCollectionEntryE_block_invoke;
    v13[3] = &__block_descriptor_tmp_180;
    v13[4] = a3;
    v13[5] = a1;
    uint64_t v11 = *(OSSerialization **)(v5 + 8);
    if (v11) {
      return OSSerializationArrayApply(v11, *(_DWORD *)(v5 + 16), a2, (uint64_t)v13);
    }
    else {
      return 0;
    }
  }
  return v9;
}

uint64_t __OSArrayApply_block_invoke(uint64_t a1, uint64_t a2, OSSerialization *a3, uint64_t a4)
{
  if (a4) {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 8 * a2) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a4));
  }
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

BOOL OSArraySetValue(OSArrayPtr obj, size_t index, OSObjectPtr value)
{
  return OSArraySetValueInternal(obj, index, value, 0);
}

uint64_t OSArraySetValueInternal(OSArray *a1, unint64_t a2, OSObject *a3, int a4)
{
  OSArrayContainerize((uint64_t)a1);
  if (!a3 && a4 == 1) {
    return 0;
  }
  if (a3) {
    char v8 = a4 ^ 1;
  }
  else {
    char v8 = 0;
  }
  if ((v8 & 1) == 0)
  {
    ivars = a1->ivars;
    unint64_t v18 = *((unsigned int *)ivars + 5);
    if (v18 <= a2) {
      return 0;
    }
    if (!a3)
    {
      LODWORD(v13) = *((_DWORD *)ivars + 5);
      goto LABEL_22;
    }
    unint64_t v11 = a2;
    LODWORD(v13) = *((_DWORD *)ivars + 5);
    goto LABEL_18;
  }
  BOOL v9 = a1->ivars;
  unint64_t v10 = *((unsigned int *)v9 + 5);
  unint64_t v11 = v10;
  if (a2 != -1)
  {
    unint64_t v11 = a2;
    if (v10 < a2) {
      return 0;
    }
  }
  uint64_t result = 0;
  unint64_t v13 = v10 + 1;
  uint64_t v14 = (uint64_t)((v10 + 1) << 31) >> 31;
  if (v14 == v13 && (v14 & 0x8000000000000000) == 0)
  {
    unsigned int v15 = *((_DWORD *)v9 + 6);
    if (v15 < v13)
    {
      if (v15 <= 0xFFFFFFEF)
      {
        unsigned int v16 = v15 + 16;
        uint64_t result = (uint64_t)malloc_type_realloc(*((void **)v9 + 4), 8 * (v15 + 16), 0x532C5DFEuLL);
        if (!result) {
          return result;
        }
        *((void *)a1->ivars + 4) = result;
        *((_DWORD *)a1->ivars + 6) = v16;
        goto LABEL_18;
      }
      return 0;
    }
LABEL_18:
    ((void (*)(OSObject *))a3->retain)(a3);
    if (v8) {
      goto LABEL_27;
    }
    ivars = a1->ivars;
    unint64_t v18 = *((unsigned int *)ivars + 5);
    a2 = v11;
LABEL_22:
    if (a2 < v18)
    {
      uint64_t v19 = *(void *)(*((void *)ivars + 4) + 8 * a2);
      if ((v19 & 1) == 0) {
        (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
      }
    }
    if (!a3)
    {
      uint64_t v20 = a1->ivars;
      unint64_t v13 = (*((_DWORD *)v20 + 5) - 1);
      memmove((void *)(*((void *)v20 + 4) + 8 * a2), (const void *)(*((void *)v20 + 4) + 8 * a2 + 8), 8 * (v13 - a2));
LABEL_31:
      *((_DWORD *)a1->ivars + 5) = v13;
      return 1;
    }
    unint64_t v11 = a2;
LABEL_27:
    if ((a4 & 1) == 0) {
      memmove((void *)(*((void *)a1->ivars + 4) + 8 * v11 + 8), (const void *)(*((void *)a1->ivars + 4) + 8 * v11), 8 * (*((unsigned int *)a1->ivars + 5) - v11));
    }
    *(void *)(*((void *)a1->ivars + 4) + 8 * v1IOExtensiblePaniclog::free(this - 1) = a3;
    goto LABEL_31;
  }
  return result;
}

BOOL OSArrayReplaceValue(OSArrayPtr obj, size_t index, OSObjectPtr value)
{
  return OSArraySetValueInternal(obj, index, value, 1);
}

BOOL OSArrayAppendValue(OSArrayPtr obj, OSObjectPtr value)
{
  return OSArraySetValueInternal(obj, 0xFFFFFFFFFFFFFFFFLL, value, 0);
}

uint64_t OSArrayGetEntry(OSArray *a1, unint64_t a2)
{
  ivars = a1->ivars;
  if (*((unsigned int *)ivars + 5) <= a2) {
    return 0;
  }
  else {
    return *(void *)(*((void *)ivars + 4) + 8 * a2);
  }
}

OSObjectPtr OSArrayGetValue(OSArrayPtr obj, size_t index)
{
  OSArrayContainerize((uint64_t)obj);
  ivars = obj->ivars;
  if (*((unsigned int *)ivars + 5) <= index) {
    return 0;
  }
  OSObjectPtr result = *(OSObjectPtr *)(*((void *)ivars + 4) + 8 * index);
  if (result)
  {
    *(void *)(*((void *)obj->ivars + 4) + 8 * index) = OSCreateObjectFromSerializationInternal(*((OSSerialization **)ivars + 1), HIDWORD(result));
    return *(OSObjectPtr *)(*((void *)obj->ivars + 4) + 8 * index);
  }
  return result;
}

const char *__cdecl OSArrayGetStringValue(OSArrayPtr obj, size_t index)
{
  ivars = obj->ivars;
  if (*((unsigned int *)ivars + 5) > index && (uint64_t v3 = *(OSMetaClassBase **)(*((void *)ivars + 4) + 8 * index)) != 0) {
    return (const char *)OSCollectionEntryGetStringPtr(*((void *)ivars + 1), v3);
  }
  else {
    return 0;
  }
}

void OSArraySetStringValue(OSArrayPtr obj, size_t index, const char *value)
{
  OSStringPtr v5 = OSStringCreate(value, 0xFFFFFFFFFFFFFFFFLL);
  OSArraySetValueInternal(obj, index, v5, 0);
  release = v5->release;

  ((void (*)(OSStringPtr))release)(v5);
}

uint64_t OSArrayGetUInt64Value(OSArrayPtr obj, size_t index)
{
  ivars = obj->ivars;
  if (*((unsigned int *)ivars + 5) > index && (uint64_t v3 = *(OSMetaClassBase **)(*((void *)ivars + 4) + 8 * index)) != 0) {
    return (uint64_t)OSCollectionEntryGetUInt64Value(*((void *)ivars + 1), v3);
  }
  else {
    return 0;
  }
}

OSMetaClassBase *OSArrayGetString(OSArray *a1, unint64_t a2)
{
  ivars = a1->ivars;
  if (*((unsigned int *)ivars + 5) > a2 && (uint64_t v3 = *(OSMetaClassBase **)(*((void *)ivars + 4) + 8 * a2)) != 0) {
    return OSCollectionEntryGetStringPtr(*((void *)ivars + 1), v3);
  }
  else {
    return 0;
  }
}

uint64_t OSArraySetString(OSArray *a1, unint64_t a2, const char *cstring)
{
  OSStringPtr v5 = OSStringCreate(cstring, 0xFFFFFFFFFFFFFFFFLL);
  OSArraySetValueInternal(a1, a2, v5, 0);
  release = v5->release;

  return ((uint64_t (*)(OSStringPtr))release)(v5);
}

OSMetaClassBase *OSArrayGetUInt64(OSArray *a1, unint64_t a2)
{
  ivars = a1->ivars;
  if (*((unsigned int *)ivars + 5) > a2 && (uint64_t v3 = *(OSMetaClassBase **)(*((void *)ivars + 4) + 8 * a2)) != 0) {
    return OSCollectionEntryGetUInt64Value(*((void *)ivars + 1), v3);
  }
  else {
    return 0;
  }
}

void OSArraySetUInt64Value(OSArrayPtr obj, size_t index, uint64_t value)
{
  OSNumberPtr v5 = OSNumberCreateWithUInt64Value(value);
  OSArraySetValueInternal(obj, index, v5, 0);
  release = v5->release;

  ((void (*)(OSNumberPtr))release)(v5);
}

uint64_t OSSerializationAppendBytes(OSSerialization *a1, const void *__src, size_t __len)
{
  ivars = a1->ivars;
  if (*((void *)ivars + 1)) {
    OSSerializationAppendBytes();
  }
  uint64_t v5 = *((void *)ivars + 4);
  size_t v6 = v5 + __len;
  if (__CFADD__(v5, __len)) {
    OSSerializationAppendBytes();
  }
  if (v6 > *((void *)ivars + 3))
  {
    uint64_t v9 = v6 + IOVMPageSize - 1;
    if (__CFADD__(v6, IOVMPageSize - 1)) {
      return 0;
    }
    uint64_t v11 = v9 & -(uint64_t)IOVMPageSize;
    vm_address_t address = 0;
    unint64_t v12 = (unsigned int *)MEMORY[0x263EF8960];
    if (vm_allocate(*MEMORY[0x263EF8960], &address, v9 & -(uint64_t)IOVMPageSize, 1)) {
      OSSerializationAppendBytes();
    }
    unint64_t v13 = a1->ivars;
    size_t v14 = *((void *)v13 + 4);
    unsigned int v15 = (const void *)*((void *)v13 + 2);
    if (v14) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 0;
    }
    if (v16) {
      OSSerializationAppendBytes();
    }
    vm_address_t v17 = address;
    memmove((void *)address, v15, v14);
    unint64_t v18 = a1->ivars;
    if (*((void *)v18 + 3))
    {
      if (MEMORY[0x23ECFFE40](*v12, *((void *)v18 + 2))) {
        OSSerializationAppendBytes();
      }
      unint64_t v18 = a1->ivars;
    }
    *((void *)v18 + 2) = v17;
    *((void *)a1->ivars + 3) = v11;
    ivars = a1->ivars;
    uint64_t v5 = *((void *)ivars + 4);
  }
  memmove((void *)(v5 + *((void *)ivars + 2)), __src, __len);
  *((void *)a1->ivars + 4) += __len;
  return 1;
}

uint64_t OSSerializationAddBinaryObject(OSSerialization *a1, OSSerialization *a2, OSMetaClassBase *anObject)
{
  if (anObject)
  {
    if (!a2) {
      OSSerializationAddBinaryObject();
    }
    ivars = a2->ivars;
    if (*((_DWORD *)ivars + 12) <= HIDWORD(anObject)) {
      OSSerializationAddBinaryObject();
    }
    unint64_t meta = (const unsigned int *)(*((void *)ivars + 5) + 4 * ((unint64_t)anObject >> 32));
    int v6 = OSSerializationSize(a2, HIDWORD(anObject));
  }
  else
  {
    uint64_t v4 = OSMetaClassBase::safeMetaCast(anObject, gOSContainerMetaClass);
    if (!v4) {
      return 0;
    }
    unint64_t meta = (const unsigned int *)v4[1].meta;
    int v6 = OSSerializationSize(meta, 1u);
  }
  int v8 = v6;
  if (v6) {
    BOOL v9 = meta == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    OSSerializationAddBinaryObject();
  }
  unsigned int v10 = *meta;
  unsigned int __src = *meta & 0x7FFFFFFF;
  uint64_t v11 = a1->ivars;
  if (*((unsigned char *)v11 + 52))
  {
    *((unsigned char *)v11 + 52) = 0;
    unsigned int __src = v10 | 0x80000000;
  }
  if (!OSSerializationAppendBytes(a1, &__src, 4uLL)) {
    return 0;
  }

  return OSSerializationAppendBytes(a1, meta + 1, 4 * (v8 - 1));
}

uint64_t OSSerializationSize(OSSerialization *a1, unsigned int a2)
{
  ivars = a1->ivars;
  unsigned int v4 = *((_DWORD *)ivars + 12);
  BOOL v5 = v4 >= a2;
  unsigned int v6 = v4 - a2;
  if (v6 == 0 || !v5) {
    OSSerializationSize();
  }
  uint64_t result = OSSerializationSize((const unsigned int *)(*((void *)ivars + 5) + 4 * a2), v6);
  if (result + a2 > *((_DWORD *)a1->ivars + 12)) {
    OSSerializationSize();
  }
  return result;
}

uint64_t OSSerializationSize(const unsigned int *a1, unsigned int a2)
{
  if (!a2) {
    OSSerializationSize();
  }
  uint64_t v2 = 1;
  switch(((*a1 & 0x7F000000) - 0x1000000) >> 24)
  {
    case 0u:
    case 1u:
    case 2u:
      if (a2 <= 1) {
        OSSerializationSize();
      }
      uint64_t v2 = a1[1];
      if (BYTE3(v2)) {
        OSSerializationSize();
      }
      return result;
    case 3u:
      uint64_t v2 = 3;
      break;
    case 7u:
    case 8u:
    case 9u:
      uint64_t v2 = (((*a1 & 0xFFFFFF) + 3) >> 2) + 1;
      break;
    case 0xAu:
    case 0xBu:
      return v2;
    default:
      OSSerializationSize();
  }
  return v2;
}

uint64_t OSSerializeEntry(OSSerialization *a1, OSSerialization *a2, OSObjectPtr obj)
{
  OSCollectionType v6 = OSCollectionEntryTypeID((uint64_t)a2, obj);
  uint64_t result = 0;
  if (v6 > 0xB) {
    return result;
  }
  if (((1 << v6) & 0xF10) != 0)
  {
    return OSSerializationAddBinaryObject(a1, a2, obj);
  }
  if (((1 << v6) & 0xC) != 0)
  {
    uint64_t v8 = *((void *)a1->ivars + 4);
    if (OSCollectionEntryTypeID((uint64_t)a2, obj) == 2) {
      int v9 = 0x2000000;
    }
    else {
      int v9 = 50331648;
    }
    if (obj)
    {
      if (!a2) {
        OSSerializeEntry();
      }
      int v14 = *(_DWORD *)(*((void *)a2->ivars + 5) + (((unint64_t)obj >> 30) & 0x3FFFFFFFCLL));
      if ((v14 & 0x7E000000) != 0x2000000) {
        OSSerializeEntry();
      }
      int meta_high = v14 & 0xFFFFFF;
    }
    else
    {
      unsigned int v10 = OSMetaClassBase::safeMetaCast(obj, gOSArrayMetaClass);
      if (v10) {
        int meta_high = HIDWORD(v10[2].meta->meta);
      }
      else {
        int meta_high = 0;
      }
    }
    unsigned int __src = meta_high | v9;
    ivars = a1->ivars;
    if (*((unsigned char *)ivars + 52))
    {
      *((unsigned char *)ivars + 52) = 0;
      unsigned int __src = meta_high | v9 | 0x80000000;
    }
    uint64_t result = OSSerializationAppendBytes(a1, &__src, 4uLL);
    if (result)
    {
      int v26 = 0;
      int appended = OSSerializationAppendBytes(a1, &v26, 4uLL);
      uint64_t result = 0;
      if (appended)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 0x40000000;
        v22[2] = ___Z16OSSerializeEntryP15OSSerializationS0_17OSCollectionEntry_block_invoke_2;
        v22[3] = &__block_descriptor_tmp_33;
        v22[4] = a1;
        int v23 = meta_high;
        if (obj)
        {
          if (!a2) {
            OSSerializeEntry();
          }
          uint64_t v28 = MEMORY[0x263EF8330];
          uint64_t v29 = 1107296256;
          unsigned int v30 = ___ZL27OSCollectionEntryArrayApplyP15OSSerialization17OSCollectionEntryU13block_pointerFbmS0_S1_E_block_invoke;
          size_t v31 = &__block_descriptor_tmp_189;
          uint64_t v32 = v22;
          uint64_t v33 = a2;
          char v18 = OSSerializationArrayApply(a2, HIDWORD(obj), 0, (uint64_t)&v28);
        }
        else
        {
          uint64_t result = (uint64_t)OSMetaClassBase::safeMetaCast(obj, gOSArrayMetaClass);
          if (!result) {
            return result;
          }
          char v18 = OSArrayInternalApply(result, 0, (uint64_t)v22);
        }
        char v19 = v18;
        uint64_t result = 0;
        if (v19) {
          return result;
        }
        goto LABEL_43;
      }
    }
  }
  else if (v6 == 1)
  {
    uint64_t v8 = *((void *)a1->ivars + 4);
    if (obj)
    {
      if (!a2) {
        OSSerializeEntry();
      }
      int v15 = *(_DWORD *)(*((void *)a2->ivars + 5) + (((unint64_t)obj >> 30) & 0x3FFFFFFFCLL));
      if ((v15 & 0x7F000000) != 0x1000000) {
        OSSerializeEntry();
      }
      int v13 = v15 & 0xFFFFFF;
    }
    else
    {
      unint64_t v12 = OSMetaClassBase::safeMetaCast(obj, gOSDictionaryMetaClass);
      int v13 = v12 ? HIDWORD(v12[2].meta->meta) : 0;
    }
    unsigned int __src = v13 | 0x1000000;
    uint64_t v20 = a1->ivars;
    if (*((unsigned char *)v20 + 52))
    {
      *((unsigned char *)v20 + 52) = 0;
      unsigned int __src = v13 | 0x81000000;
    }
    uint64_t result = OSSerializationAppendBytes(a1, &__src, 4uLL);
    if (result)
    {
      int v26 = 0;
      int v21 = OSSerializationAppendBytes(a1, &v26, 4uLL);
      uint64_t result = 0;
      if (v21)
      {
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 0x40000000;
        v24[2] = ___Z16OSSerializeEntryP15OSSerializationS0_17OSCollectionEntry_block_invoke;
        v24[3] = &__block_descriptor_tmp_32;
        v24[4] = a1;
        int v25 = v13;
        if (obj)
        {
          if (!a2) {
            OSSerializeEntry();
          }
          uint64_t v28 = MEMORY[0x263EF8330];
          uint64_t v29 = 1107296256;
          unsigned int v30 = ___ZL32OSCollectionEntryDictionaryApplyP15OSSerialization17OSCollectionEntryU13block_pointerFbmS0_S1_S1_E_block_invoke;
          size_t v31 = &__block_descriptor_tmp_186;
          uint64_t v32 = v24;
          uint64_t v33 = a2;
          if ((OSSerializationDictionaryApply(a2, HIDWORD(obj), (uint64_t)&v28) & 1) == 0) {
            goto LABEL_43;
          }
        }
        else
        {
          uint64_t result = (uint64_t)OSMetaClassBase::safeMetaCast(obj, gOSDictionaryMetaClass);
          if (!result) {
            return result;
          }
          if ((OSDictionaryInternalApply(result, (uint64_t)v24) & 1) == 0)
          {
LABEL_43:
            *(_DWORD *)(*((void *)a1->ivars + 2) + v8 + 4) = (*((_DWORD *)a1->ivars + 8)
                                                                                            - v8) >> 2;
            return 1;
          }
        }
        return 0;
      }
    }
  }
  return result;
}

OSCollectionType OSCollectionEntryTypeID(uint64_t a1, OSObjectPtr obj)
{
  if (obj)
  {
    if (!a1) {
      OSCollectionEntryTypeID();
    }
    uint64_t v3 = *(void *)(a1 + 48);
    if (*(_DWORD *)(v3 + 48) <= HIDWORD(obj)) {
      OSCollectionEntryTypeID();
    }
    int v4 = *(_DWORD *)(*(void *)(v3 + 40) + 4 * ((unint64_t)obj >> 32));
    return OSSerializationTypeID(v4);
  }
  else
  {
    return OSCollectionTypeID(obj);
  }
}

uint64_t ___Z16OSSerializeEntryP15OSSerializationS0_17OSCollectionEntry_block_invoke(uint64_t a1, uint64_t a2, int a3, OSObjectPtr obj, OSObject *a5)
{
  int v9 = OSSerializeEntry(*(void *)(a1 + 32), a3, obj);
  uint64_t v10 = *(void *)(a1 + 32);
  *(unsigned char *)(*(void *)(v10 + 48) + 52) = *(_DWORD *)(a1 + 40) - 1 == a2;
  if (v9) {
    return OSSerializeEntry(v10, a3, a5) ^ 1;
  }
  else {
    return 1;
  }
}

uint64_t ___Z16OSSerializeEntryP15OSSerializationS0_17OSCollectionEntry_block_invoke_2(uint64_t a1, uint64_t a2, int a3, OSObjectPtr obj)
{
  BOOL v4 = *(_DWORD *)(a1 + 40) - 1 == a2;
  uint64_t v5 = *(void *)(a1 + 32);
  *(unsigned char *)(*(void *)(v5 + 48) + 52) = v4;
  return OSSerializeEntry(v5, a3, obj) ^ 1;
}

OSSerializationPtr OSCreateSerializationFromObject(OSObjectPtr obj)
{
  kern_return_t v2;
  OSSerialization *v3;
  OSSerialization *v4;
  OSContainer_IVars *v5;
  int __src;
  OSObject *pObject;

  pObject = 0;
  uint64_t v2 = OSObjectAllocate(gOSSerializationMetaClass, &pObject);
  uint64_t v3 = (OSSerialization *)pObject;
  if (v2) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = (OSSerialization *)pObject;
  }
  uint64_t v5 = (OSContainer_IVars *)IOMallocZeroTyped(0x38uLL, 0x10D20405E9062E8uLL);
  v4->ivars = v5;
  v4->ivars = v5;
  *(_DWORD *)uint64_t v5 = 218103808;
  *((void *)v4->ivars + 2) = 0;
  *((void *)v4->ivars + 3) = 0;
  *((void *)v4->ivars + 4) = 0;
  *((void *)v4->ivars + 5) = *((void *)v4->ivars + 2);
  *((_DWORD *)v4->ivars + 12) = *((void *)v4->ivars + 4) >> 2;
  *((unsigned char *)v4->ivars + 52) = 1;
  unsigned int __src = 212;
  if (OSSerializationAppendBytes(v4, &__src, 4uLL) && OSSerializeEntry(v4, 0, obj))
  {
    *((void *)v4->ivars + 5) = *((void *)v4->ivars + 2);
    *((_DWORD *)v4->ivars + 12) = *((void *)v4->ivars + 4) >> 2;
  }
  else
  {
    ((void (*)(OSSerialization *))v4->release)(v4);
    return 0;
  }
  return v3;
}

OSSerializationPtr OSCreateSerializationFromBytes(const void *bytes, size_t length, OSSerializationFreeBufferHandler freeBuffer)
{
  uint64_t v3 = 0;
  if (length >= 4 && (bytes & 3) == 0 && freeBuffer)
  {
    int v7 = *(unsigned __int8 *)bytes;
    BOOL v8 = v7 != 212 && strcmp(byte_23D3CAB90, (const char *)bytes) && *((char *)bytes + length - 1) == 0;
    BOOL v9 = v7 == 212;
    pObject = 0;
    if (OSObjectAllocate(gOSSerializationMetaClass, &pObject)) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = (OSSerialization *)pObject;
    }
    uint64_t v10 = (OSContainer_IVars *)IOMallocZeroTyped(0x38uLL, 0x10D20405E9062E8uLL);
    v3->ivars = v10;
    v3->ivars = v10;
    *(_DWORD *)uint64_t v10 = 218103808;
    *((void *)v3->ivars + IOExtensiblePaniclog::free(this - 1) = _Block_copy(freeBuffer);
    *((void *)v3->ivars + 2) = bytes;
    *((void *)v3->ivars + 4) = length;
    *((void *)v3->ivars + 5) = *((void *)v3->ivars + 2);
    *((unsigned char *)v3->ivars + 54) = v8;
    *((unsigned char *)v3->ivars + 53) = v9;
    *((_DWORD *)v3->ivars + 12) = *((void *)v3->ivars + 4) >> 2;
    if (*((_DWORD *)v3->ivars + 12) <= 1u) {
      OSCreateSerializationFromBytes_cold_1();
    }
  }
  return v3;
}

const void *__cdecl OSSerializationGetBytes(OSSerializationPtr serial, size_t *length)
{
  if (length) {
    *size_t length = *((void *)serial->ivars + 4);
  }
  return (const void *)*((void *)serial->ivars + 2);
}

void OSObjectLogInternal(OSObject *a1, unsigned int a2)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  int v31 = 0;
  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2000000000;
  BOOL v27 = __b;
  if (a2 >= 0xFF) {
    size_t v3 = 255;
  }
  else {
    size_t v3 = a2;
  }
  memset(__b, 32, v3);
  __b[v3] = 0;
  if (a1)
  {
    OSCollectionType v4 = OSCollectionTypeID(a1);
    uint64_t v5 = (const char *)v25[3];
    OSCollectionType v6 = OSCollectionTypeName(v4);
    IOLog("%s%s\n", v5, v6);
    switch(v4)
    {
      case 1uLL:
        *((_DWORD *)v29 + 6) = 0;
        uint64_t v10 = (OSDictionary *)OSMetaClassBase::requiredMetaCast(a1, gOSDictionaryMetaClass);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 1107296256;
        v22[2] = ___Z19OSObjectLogInternalP8OSObjectj_block_invoke;
        v22[3] = &__block_descriptor_tmp_40;
        v22[4] = &v24;
        void v22[5] = &v28;
        int v23 = v3;
        OSDictionaryApply(v10, v22);
        break;
      case 2uLL:
      case 3uLL:
        *((_DWORD *)v29 + 6) = 0;
        int v7 = (OSArray *)OSMetaClassBase::requiredMetaCast(a1, gOSArrayMetaClass);
        applier[0] = MEMORY[0x263EF8330];
        applier[1] = 1107296256;
        applier[2] = ___Z19OSObjectLogInternalP8OSObjectj_block_invoke_41;
        applier[3] = &__block_descriptor_tmp_46;
        applier[4] = &v24;
        applier[5] = &v28;
        int v21 = v3;
        OSArrayApply(v7, applier);
        break;
      case 4uLL:
        OSMetaClassBase::requiredMetaCast(a1, gOSNumberMetaClass);
        IOLog("%s%qd\n");
        break;
      case 8uLL:
      case 9uLL:
        unint64_t meta = OSMetaClassBase::requiredMetaCast(a1, gOSStringMetaClass)[1].meta;
        if (((uint64_t)meta->__vftable & 0x7E000000 | 0x1000000) != 0x9000000
          || ((uint64_t)meta->__vftable & 0x7FFFFFFF) == 0x8000000)
        {
          OSObjectLogInternal();
        }
        IOLog("%s\"%s\"\n");
        break;
      case 0xAuLL:
        uint64_t v11 = OSMetaClassBase::requiredMetaCast(a1, gOSDataMetaClass)[1].meta;
        int v13 = (int)v11->__vftable;
        unint64_t v12 = (char *)&v11->__vftable + 4;
        int v14 = v13 & 0x7F000000;
        if ((v13 & 0xFFFFFF) != 0 && v14 == 167772160) {
          BOOL v16 = v12;
        }
        else {
          BOOL v16 = 0;
        }
        vm_address_t v17 = OSMetaClassBase::requiredMetaCast(a1, gOSDataMetaClass);
        IOLogBuffer("content:", v16, (uint64_t)v17[1].meta->__vftable & 0xFFFFFF);
        break;
      case 0xBuLL:
        if (kOSBooleanTrue == a1) {
          IOLog("%strue");
        }
        else {
          IOLog("%sfalse\n");
        }
        break;
      default:
        IOLog("\n", v18, v19);
        break;
    }
  }
  else
  {
    IOLog("%s<NULL>\n");
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

uint64_t ___Z19OSObjectLogInternalP8OSObjectj_block_invoke(uint64_t a1, const char *a2, OSObject *a3)
{
  return 0;
}

uint64_t ___Z19OSObjectLogInternalP8OSObjectj_block_invoke_41(uint64_t a1, OSObject *a2)
{
  return 0;
}

void OSObjectLog(OSObjectPtr obj)
{
}

OSCollectionPtr OSCollection::copyCollection(const OSCollection *this, OSDictionary *cycleDict)
{
  return 0;
}

uint64_t non-virtual thunk to'OSCollection::copyCollection(OSCollection *this, OSDictionary *a2)
{
  return 0;
}

BOOL OSCollection::iterateObjects(const OSCollection *this, OSCollectionIterateObjectsBlock block)
{
  return 0;
}

uint64_t non-virtual thunk to'OSCollection::iterateObjects()
{
  return 0;
}

BOOL OSDictionary::isEqualTo(const OSDictionary *this, const OSMetaClassBase *anObject)
{
  size_t v3 = (const OSDictionary *)OSMetaClassBase::safeMetaCast(anObject, gOSDictionaryMetaClass);
  if (v3)
  {
    LOBYTE(v3) = OSDictionary::isEqualTo(this, v3);
  }
  return (char)v3;
}

BOOL OSDictionary::isEqualTo(const OSDictionary *this, const OSDictionary *aDictionary)
{
  uint64_t v5 = 0;
  OSCollectionType v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  void v4[2] = ___ZNK12OSDictionary9isEqualToEPKS__block_invoke;
  v4[3] = &__block_descriptor_tmp_58;
  void v4[4] = &v5;
  v4[5] = this;
  OSDictionary::iterateObjects(aDictionary, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint32_t OSDictionary::getCount(const OSDictionary *this)
{
  return *((_DWORD *)this->ivars + 5);
}

uint64_t non-virtual thunk to'OSDictionary::getCount(OSDictionary *this)
{
  return HIDWORD(this->meta->OSCollection::OSContainer::OSObject::meta);
}

uint32_t OSDictionary::getCapacity(const OSDictionary *this)
{
  return *((_DWORD *)this->ivars + 5);
}

uint64_t non-virtual thunk to'OSDictionary::getCapacity(OSDictionary *this)
{
  return HIDWORD(this->meta->OSCollection::OSContainer::OSObject::meta);
}

uint32_t OSDictionary::ensureCapacity(OSDictionary *this, uint32_t newCapacity)
{
  return newCapacity;
}

uint64_t non-virtual thunk to'OSDictionary::ensureCapacity(OSDictionary *this, uint64_t a2)
{
  return a2;
}

void OSDictionary::flushCollection(OSDictionary *this)
{
  ivars = this->ivars;
  size_t v3 = (void *)*((void *)ivars + 4);
  if (v3)
  {
    if (*((_DWORD *)ivars + 5))
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = *((void *)ivars + 4);
        uint64_t v7 = *(void *)(v6 + v4);
        if ((v7 & 1) == 0)
        {
          (*(void (**)(uint64_t))(*(void *)v7 + 16))(v7);
          ivars = this->ivars;
          uint64_t v6 = *((void *)ivars + 4);
        }
        uint64_t v8 = *(void *)(v6 + v4 + 8);
        if ((v8 & 1) == 0)
        {
          (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
          ivars = this->ivars;
        }
        ++v5;
        v4 += 16;
      }
      while (v5 < *((unsigned int *)ivars + 5));
      size_t v3 = (void *)*((void *)ivars + 4);
    }
    free(v3);
    *((void *)this->ivars + 4) = 0;
    ivars = this->ivars;
  }
  uint64_t v9 = *((void *)ivars + 1);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(void *)v9 + 16))(v9);
    *((void *)this->ivars + IOExtensiblePaniclog::free(this - 1) = 0;
    ivars = this->ivars;
  }
  *((_DWORD *)ivars + 5) = 0;
}

void non-virtual thunk to'OSDictionary::flushCollection(OSDictionary *this)
{
}

void OSDictionary::free(OSDictionary *this)
{
  ((void (*)(OSDictionary *))this->flushCollection)(this);
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x28uLL);
    this->ivars = 0;
  }
  this->ivars = 0;

  OSObject::free(this);
}

void non-virtual thunk to'OSDictionary::free(OSDictionary *this)
{
}

OSDictionaryPtr OSDictionary::withObjects(const OSObject **values, const OSObject **keys, uint32_t count, uint32_t capacity)
{
  uint64_t v7 = OSDictionaryCreate();
  if (v7 && count)
  {
    unint64_t v8 = 0;
    do
    {
      int v9 = OSDictionarySetValueInternal(v7, (unint64_t)keys[v8], 0, (OSObject *)values[v8]);
      ++v8;
      if (v9) {
        BOOL v10 = v8 >= count;
      }
      else {
        BOOL v10 = 1;
      }
    }
    while (!v10);
    if ((v9 & 1) == 0)
    {
      ((void (*)(OSDictionary *))v7->release)(v7);
      return 0;
    }
  }
  return v7;
}

BOOL OSDictionary::setObject(OSDictionary *this, const OSObject *aKey, const OSMetaClassBase *anObject)
{
  return OSDictionarySetValueInternal(this, (unint64_t)aKey, 0, (OSObject *)anObject);
}

OSDictionaryPtr OSDictionary::withDictionary(const OSDictionary *dictionary, uint32_t capacity)
{
  size_t v3 = OSDictionaryCreate();
  BOOL v4 = OSDictionary::merge(v3, dictionary);
  if (v3 && !v4)
  {
    ((void (*)(OSDictionary *))v3->release)(v3);
    return 0;
  }
  return v3;
}

BOOL OSDictionary::merge(OSDictionary *this, const OSDictionary *otherDictionary)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  void v4[2] = ___ZN12OSDictionary5mergeEPKS__block_invoke;
  v4[3] = &__block_descriptor_tmp_55;
  void v4[4] = &v5;
  v4[5] = this;
  OSDictionary::iterateObjects(otherDictionary, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL OSDictionary::setObject(OSDictionary *this, const char *aKey, const OSMetaClassBase *anObject)
{
  return OSDictionarySetValueInternal(this, 0, (unint64_t)aKey, (OSObject *)anObject);
}

void OSDictionary::removeObject(OSDictionary *this, const OSObject *aKey)
{
}

void OSDictionary::removeObject(OSDictionary *this, const char *aKey)
{
}

BOOL OSDictionary::iterateObjects(const OSDictionary *this, OSDictionaryIterateObjectsBlock block)
{
  OSDictionaryContainerize((uint64_t)this);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = ___ZL26OSDictionaryIterateObjectsP12OSDictionaryU13block_pointerFbP8OSObjectS2_E_block_invoke;
  v5[3] = &__block_descriptor_tmp_193;
  v5[4] = block;
  void v5[5] = this;
  return OSDictionaryInternalApply((uint64_t)this, (uint64_t)v5);
}

uint64_t ___ZN12OSDictionary5mergeEPKS__block_invoke(uint64_t a1, unint64_t a2, OSObject *a3)
{
  char v4 = OSDictionarySetValueInternal(*(OSDictionary **)(a1 + 40), a2, 0, a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    char v6 = v4;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  return 0;
}

BOOL ___ZNK12OSDictionary9isEqualToEPKS__block_invoke(uint64_t a1, OSObject *a2, uint64_t a3)
{
  uint64_t ValueInternal = OSDictionaryGetValueInternal(*(OSDictionary **)(a1 + 40), a2, 0);
  char v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a3 + 24))(a3, ValueInternal);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

OSObject *__cdecl OSDictionary::getObject(const OSDictionary *this, const OSObject *aKey)
{
  return (OSObject *)OSDictionaryGetValueInternal((OSDictionary *)this, (OSObject *)aKey, 0);
}

BOOL OSDictionary::isEqualTo(const OSDictionary *this, const OSDictionary *aDictionary, const OSCollection *keys)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  char v9 = 1;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = ___ZNK12OSDictionary9isEqualToEPKS_PK12OSCollection_block_invoke;
  v5[3] = &__block_descriptor_tmp_61;
  void v5[5] = this;
  void v5[6] = aDictionary;
  v5[4] = &v6;
  ((void (*)(const OSCollection *, void *))keys->iterateObjects)(keys, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ___ZNK12OSDictionary9isEqualToEPKS_PK12OSCollection_block_invoke(uint64_t a1, OSObject *a2)
{
  char v4 = *(OSDictionary **)(a1 + 40);
  uint64_t result = OSDictionaryGetValueInternal(*(OSDictionary **)(a1 + 48), a2, 0);
  if (result)
  {
    uint64_t v6 = result;
    uint64_t ValueInternal = OSDictionaryGetValueInternal(v4, a2, 0);
    if (ValueInternal) {
      LOBYTE(ValueInternal) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)ValueInternal + 24))(ValueInternal, v6);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) &= ValueInternal;
    return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
  }
  return result;
}

OSObject *__cdecl OSDictionary::getObject(const OSDictionary *this, const char *aKey)
{
  return (OSObject *)OSDictionaryGetValueInternal((OSDictionary *)this, 0, aKey);
}

BOOL OSDictionary::iterateObjects(const OSDictionary *this, OSCollectionIterateObjectsBlock block)
{
  blocka[0] = MEMORY[0x263EF8330];
  blocka[1] = 1107296256;
  blocka[2] = ___ZNK12OSDictionary14iterateObjectsEU13block_pointerFbP8OSObjectE_block_invoke;
  blocka[3] = &__block_descriptor_tmp_64;
  blocka[4] = block;
  return OSDictionary::iterateObjects(this, blocka);
}

uint64_t ___ZNK12OSDictionary14iterateObjectsEU13block_pointerFbP8OSObjectE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL non-virtual thunk to'OSDictionary::iterateObjects(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1107296256;
  block[2] = ___ZNK12OSDictionary14iterateObjectsEU13block_pointerFbP8OSObjectE_block_invoke;
  block[3] = &__block_descriptor_tmp_64;
  block[4] = a2;
  return OSDictionary::iterateObjects((const OSDictionary *)(a1 - 48), block);
}

BOOL OSArray::isEqualTo(const OSArray *this, const OSMetaClassBase *anObject)
{
  char v3 = (const OSArray *)OSMetaClassBase::safeMetaCast(anObject, gOSArrayMetaClass);
  if (v3)
  {
    LOBYTE(v3) = OSArray::isEqualTo(this, v3);
  }
  return (char)v3;
}

BOOL OSArray::isEqualTo(const OSArray *this, const OSArray *anArray)
{
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2000000000;
  char v15 = 0;
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  int v4 = ((uint64_t (*)(const OSArray *))this->getCount)(this);
  BOOL v5 = 0;
  if (v4 == ((unsigned int (*)(const OSArray *))anArray->getCount)(anArray))
  {
    *((unsigned char *)v13 + 24) = 1;
    *((_DWORD *)v9 + 6) = 0;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 1107296256;
    void v7[2] = ___ZNK7OSArray9isEqualToEPKS__block_invoke;
    v7[3] = &__block_descriptor_tmp_70;
    v7[5] = &v12;
    v7[6] = this;
    integer_t v7[4] = &v8;
    ((void (*)(const OSArray *, void *))anArray->iterateObjects)(anArray, v7);
    BOOL v5 = *((unsigned char *)v13 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint32_t OSArray::getCount(const OSArray *this)
{
  return *((_DWORD *)this->ivars + 5);
}

uint64_t non-virtual thunk to'OSArray::getCount(OSArray *this)
{
  return HIDWORD(this->meta->OSCollection::OSContainer::OSObject::meta);
}

uint32_t OSArray::getCapacity(const OSArray *this)
{
  return *((_DWORD *)this->ivars + 5);
}

uint64_t non-virtual thunk to'OSArray::getCapacity(OSArray *this)
{
  return HIDWORD(this->meta->OSCollection::OSContainer::OSObject::meta);
}

uint32_t OSArray::ensureCapacity(OSArray *this, uint32_t newCapacity)
{
  return newCapacity;
}

uint64_t non-virtual thunk to'OSArray::ensureCapacity(OSArray *this, uint64_t a2)
{
  return a2;
}

void OSArray::flushCollection(OSArray *this)
{
  ivars = this->ivars;
  char v3 = (void *)*((void *)ivars + 4);
  if (v3)
  {
    if (*((_DWORD *)ivars + 5))
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = *(void *)(*((void *)ivars + 4) + 8 * v4);
        if ((v5 & 1) == 0)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
          ivars = this->ivars;
        }
        ++v4;
      }
      while (v4 < *((unsigned int *)ivars + 5));
      char v3 = (void *)*((void *)ivars + 4);
    }
    free(v3);
    *((void *)this->ivars + 4) = 0;
    ivars = this->ivars;
  }
  uint64_t v6 = *((void *)ivars + 1);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(void *)v6 + 16))(v6);
    *((void *)this->ivars + IOExtensiblePaniclog::free(this - 1) = 0;
    ivars = this->ivars;
  }
  *((_DWORD *)ivars + 5) = 0;
}

void non-virtual thunk to'OSArray::flushCollection(OSArray *this)
{
}

void OSArray::free(OSArray *this)
{
  ((void (*)(OSArray *))this->flushCollection)(this);
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0x28uLL);
    this->ivars = 0;
  }
  this->ivars = 0;

  OSObject::free(this);
}

void non-virtual thunk to'OSArray::free(OSArray *this)
{
}

OSArrayPtr OSArray::withObjects(const OSObject **values, uint32_t count, uint32_t capacity)
{
  uint64_t v5 = OSArrayCreate();
  if (v5 && count)
  {
    unint64_t v6 = 0;
    do
    {
      int v7 = OSArraySetValueInternal(v5, 0xFFFFFFFFFFFFFFFFLL, (OSObject *)values[v6++], 0);
      if (v7) {
        BOOL v8 = v6 >= count;
      }
      else {
        BOOL v8 = 1;
      }
    }
    while (!v8);
    if ((v7 & 1) == 0)
    {
      ((void (*)(OSArray *))v5->release)(v5);
      return 0;
    }
  }
  return v5;
}

BOOL OSArray::setObject(OSArray *this, const OSMetaClassBase *anObject)
{
  return OSArraySetValueInternal(this, 0xFFFFFFFFFFFFFFFFLL, (OSObject *)anObject, 0);
}

OSArrayPtr OSArray::withArray(const OSArray *array, uint32_t capacity)
{
  char v3 = OSArrayCreate();
  BOOL v4 = OSArray::merge(v3, array);
  if (v3 && !v4)
  {
    ((void (*)(OSArray *))v3->release)(v3);
    return 0;
  }
  return v3;
}

BOOL OSArray::merge(OSArray *this, const OSArray *otherArray)
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  void v4[2] = ___ZN7OSArray5mergeEPKS__block_invoke;
  v4[3] = &__block_descriptor_tmp_67;
  void v4[4] = &v5;
  v4[5] = this;
  ((void (*)(const OSArray *, void *))otherArray->iterateObjects)(otherArray, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL OSArray::setObject(OSArray *this, uint32_t index, const OSMetaClassBase *anObject)
{
  return OSArraySetValueInternal(this, index, (OSObject *)anObject, 0);
}

BOOL OSArray::replaceObject(OSArray *this, uint32_t index, const OSMetaClassBase *anObject)
{
  return OSArraySetValueInternal(this, index, (OSObject *)anObject, 1);
}

void OSArray::removeObject(OSArray *this, uint32_t index)
{
}

uint64_t ___ZN7OSArray5mergeEPKS__block_invoke(uint64_t a1, OSObject *a2)
{
  char v3 = OSArraySetValueInternal(*(OSArray **)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL, a2, 0);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v4 + 24)) {
    char v5 = v3;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  return 0;
}

BOOL ___ZNK7OSArray9isEqualToEPKS__block_invoke(uint64_t a1, uint64_t a2)
{
  OSObjectPtr Value = OSArrayGetValue(*(OSArrayPtr *)(a1 + 48), *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  char v5 = (*(uint64_t (**)(uint64_t, OSObjectPtr))(*(void *)a2 + 24))(a2, Value);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    char v7 = v5;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
}

OSObject *__cdecl OSArray::getObject(const OSArray *this, uint32_t index)
{
  return OSArrayGetValue((OSArrayPtr)this, index);
}

OSObject *__cdecl OSArray::getLastObject(const OSArray *this)
{
  int v1 = *((_DWORD *)this->ivars + 5);
  if (v1) {
    return OSArrayGetValue((OSArrayPtr)this, (v1 - 1));
  }
  else {
    return 0;
  }
}

BOOL OSArray::iterateObjects(const OSArray *this, OSCollectionIterateObjectsBlock block)
{
  return OSArrayIterateObjects((uint64_t)this, 0, (uint64_t)block);
}

uint64_t OSArrayIterateObjects(uint64_t a1, unsigned int a2, uint64_t a3)
{
  OSArrayContainerize(a1);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  void v7[2] = ___ZL21OSArrayIterateObjectsP7OSArrayjU13block_pointerFbP8OSObjectE_block_invoke;
  v7[3] = &__block_descriptor_tmp_196_0;
  integer_t v7[4] = a3;
  v7[5] = a1;
  return OSArrayInternalApply(a1, a2, (uint64_t)v7);
}

uint64_t non-virtual thunk to'OSArray::iterateObjects(uint64_t a1, uint64_t a2)
{
  return OSArrayIterateObjects(a1 - 48, 0, a2);
}

uint32_t OSArray::getNextIndexOfObject(const OSArray *this, const OSMetaClassBase *anObject, uint32_t index)
{
  uint64_t v6 = 0;
  char v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint32_t v9 = index;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = ___ZNK7OSArray20getNextIndexOfObjectEPK15OSMetaClassBasej_block_invoke;
  v5[3] = &__block_descriptor_tmp_73;
  v5[4] = &v6;
  void v5[5] = anObject;
  if (OSArrayIterateObjects((uint64_t)this, index, (uint64_t)v5)) {
    uint32_t v3 = *((_DWORD *)v7 + 6);
  }
  else {
    uint32_t v3 = -1;
  }
  _Block_object_dispose(&v6, 8);
  return v3;
}

BOOL ___ZNK7OSArray20getNextIndexOfObjectEPK15OSMetaClassBasej_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 != a2) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return v2 == a2;
}

OSObject *OSSetCreate(void)
{
  pObject = 0;
  if (OSObjectAllocate(gOSSetMetaClass, &pObject)) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = pObject;
  }
  int v1 = (OSObjectInterface_vtbl *)IOMallocZeroTyped(0x28uLL, 0x1020040FBF3A4F7uLL);
  v0[1].OSObjectInterface::__vftable = v1;
  v0[1].OSMetaClassBase::__vftable = (OSObject_vtbl *)v1;
  LODWORD(v1->init) = 50331648;
  return v0;
}

OSSetPtr OSSet::withObjects(const OSObject **values, uint32_t count, uint32_t capacity)
{
  char v5 = (OSSet *)OSSetCreate();
  if (v5 && count)
  {
    unint64_t v6 = 0;
    do
      BOOL v7 = OSSet::setObject(v5, values[v6++]);
    while (v7 && v6 < count);
    if (!v7)
    {
      ((void (*)(OSSet *))v5->release)(v5);
      return 0;
    }
  }
  return v5;
}

BOOL OSSet::setObject(OSSet *this, const OSMetaClassBase *anObject)
{
  if (OSArray::getNextIndexOfObject(this, anObject, 0) != -1) {
    return 0;
  }

  return OSArraySetValueInternal(this, 0xFFFFFFFFFFFFFFFFLL, (OSObject *)anObject, 0);
}

OSSetPtr OSSet::withArray(const OSArray *array, uint32_t capacity)
{
  uint32_t v3 = (OSSet *)OSSetCreate();
  BOOL v4 = OSSet::merge(v3, array);
  if (v3 && !v4)
  {
    ((void (*)(OSSet *))v3->release)(v3);
    return 0;
  }
  return v3;
}

BOOL OSSet::merge(OSSet *this, const OSArray *otherArray)
{
  uint64_t v5 = 0;
  unint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 1;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 1107296256;
  void v4[2] = ___ZN5OSSet5mergeEPK7OSArray_block_invoke;
  v4[3] = &__block_descriptor_tmp_76;
  void v4[4] = &v5;
  v4[5] = this;
  ((void (*)(const OSArray *, void *))otherArray->iterateObjects)(otherArray, v4);
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

BOOL non-virtual thunk to'OSSet::init(OSSet *this)
{
  return OSObject::init((OSSet *)((char *)this - 24));
}

BOOL OSSet::containsObject(const OSSet *this, const OSMetaClassBase *anObject)
{
  return OSArray::getNextIndexOfObject(this, anObject, 0) != -1;
}

BOOL OSSet::member(const OSSet *this, const OSMetaClassBase *anObject)
{
  return OSArray::getNextIndexOfObject(this, anObject, 0) != -1;
}

void OSSet::removeObject(OSSet *this, const OSMetaClassBase *anObject)
{
  uint32_t NextIndexOfObject = OSArray::getNextIndexOfObject(this, anObject, 0);
  if (NextIndexOfObject != -1)
  {
    OSArraySetValueInternal(this, NextIndexOfObject, 0, 0);
  }
}

OSObject *__cdecl OSSet::getAnyObject(const OSSet *this)
{
  return OSArrayGetValue(&this->OSArray, 0);
}

uint64_t ___ZN5OSSet5mergeEPK7OSArray_block_invoke(uint64_t a1, const OSMetaClassBase *a2)
{
  BOOL v4 = *(OSSet **)(a1 + 40);
  if (OSArray::getNextIndexOfObject(v4, a2, 0) == -1)
  {
    BOOL v5 = OSSet::setObject(v4, a2);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    if (*(unsigned char *)(v6 + 24)) {
      BOOL v7 = v5;
    }
    else {
      BOOL v7 = 0;
    }
    *(unsigned char *)(v6 + 24) = v7;
  }
  return 0;
}

OSOrderedSetPtr OSOrderedSet::withCapacity(uint32_t capacity, OSOrderBlock orderBlock)
{
  pObject = 0;
  if (OSObjectAllocate(gOSOrderedSetMetaClass, &pObject)) {
    uint32_t v3 = 0;
  }
  else {
    uint32_t v3 = (OSOrderedSet *)pObject;
  }
  BOOL v4 = (OSArray_IVars *)IOMallocZeroTyped(0x28uLL, 0x1020040FBF3A4F7uLL);
  v3->ivars = v4;
  v3->ivars = v4;
  *(_DWORD *)BOOL v4 = 50331648;
  v3->ivars = (OSOrderedSet_IVars *)IOMallocTyped(8uLL, 0x80040B8603338uLL);
  *(void *)v3->ivars = _Block_copy(orderBlock);
  return v3;
}

BOOL non-virtual thunk to'OSOrderedSet::init(OSOrderedSet *this)
{
  return OSObject::init((OSOrderedSet *)((char *)this - 24));
}

void OSOrderedSet::free(OSOrderedSet *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    if (!*(void *)ivars
      || (_Block_release(*(const void **)ivars), *(void *)this->ivars = 0, (ivars = this->ivars) != 0))
    {
      IOFree(ivars, 8uLL);
      this->ivars = 0;
    }
  }

  OSArray::free(this);
}

void non-virtual thunk to'OSOrderedSet::free(OSOrderedSet *this)
{
}

BOOL OSOrderedSet::setObject(OSOrderedSet *this, const OSMetaClassBase *anObject)
{
  if (OSArray::getNextIndexOfObject(this, anObject, 0) != -1) {
    return 0;
  }
  if (*(void *)this->ivars)
  {
    unsigned int v5 = ((uint64_t (*)(OSOrderedSet *))this->getCount)(this);
    if (v5)
    {
      size_t v6 = 0;
      uint64_t v7 = v5;
      while (1)
      {
        OSArrayGetValue(this, v6);
        if (((*(uint64_t (**)(void))(*(void *)this->ivars + 16))() & 0x80000000) != 0) {
          break;
        }
        if (v7 == ++v6)
        {
          LODWORD(v6) = v7;
          break;
        }
      }
    }
    else
    {
      LODWORD(v6) = 0;
    }
    return OSArraySetValueInternal(this, v6, (OSObject *)anObject, 0);
  }
  else
  {
    return OSOrderedSet::setLastObject(this, anObject);
  }
}

BOOL OSOrderedSet::setLastObject(OSOrderedSet *this, const OSMetaClassBase *anObject)
{
  if (OSArray::getNextIndexOfObject(this, anObject, 0) != -1) {
    return 0;
  }

  return OSArraySetValueInternal(this, 0xFFFFFFFFFFFFFFFFLL, (OSObject *)anObject, 0);
}

BOOL OSOrderedSet::setFirstObject(OSOrderedSet *this, const OSMetaClassBase *anObject)
{
  if (OSArray::getNextIndexOfObject(this, anObject, 0) != -1) {
    return 0;
  }

  return OSArraySetValueInternal(this, 0, (OSObject *)anObject, 0);
}

OSObject *__cdecl OSOrderedSet::getFirstObject(const OSOrderedSet *this)
{
  return OSArrayGetValue(&this->OSSet, 0);
}

OSObject *__cdecl OSOrderedSet::getLastObject(const OSOrderedSet *this)
{
  int v2 = ((uint64_t (*)(const OSOrderedSet *))this->getCount)(this);
  if (!v2) {
    return 0;
  }

  return OSArrayGetValue(&this->OSSet, (v2 - 1));
}

int32_t OSOrderedSet::orderObject(OSOrderedSet *this, const OSMetaClassBase *anObject)
{
  return (*(void *(**)(void *__return_ptr))(*(void *)this->ivars + 16))((void *)this->ivars);
}

BOOL OSData::isEqualTo(const OSData *this, const OSMetaClassBase *anObject)
{
  BOOL v4 = OSMetaClassBase::safeMetaCast(anObject, gOSDataMetaClass);
  if (v4)
  {
    unint64_t meta = v4[1].meta;
    int v7 = (int)meta->__vftable;
    size_t v6 = (_DWORD *)&meta->__vftable + 1;
    int v8 = v7 & 0x7F000000;
    size_t v9 = v7 & 0xFFFFFF;
    if (v9) {
      BOOL v10 = v8 == 167772160;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10) {
      int v11 = v6;
    }
    else {
      int v11 = 0;
    }
    LOBYTE(v12) = OSData::isEqualTo(this, v11, v9);
  }
  else
  {
    uint64_t v12 = (const OSString *)OSMetaClassBase::safeMetaCast(anObject, gOSStringMetaClass);
    if (v12)
    {
      LOBYTE(v12) = OSString::isEqualTo(v12, this);
    }
  }
  return (char)v12;
}

BOOL OSData::isEqualTo(const OSData *this, const OSData *aDataObj)
{
  ivars = aDataObj->ivars;
  int v4 = *(_DWORD *)ivars;
  uint32_t v3 = (char *)ivars + 4;
  int v5 = v4 & 0x7F000000;
  size_t v6 = v4 & 0xFFFFFF;
  if (v6) {
    BOOL v7 = v5 == 167772160;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    int v8 = v3;
  }
  else {
    int v8 = 0;
  }
  return OSData::isEqualTo(this, v8, v6);
}

BOOL OSData::isEqualTo(const OSData *this, const OSString *aString)
{
  return OSString::isEqualTo(aString, this);
}

BOOL OSData::isEqualTo(const OSData *this, const void *bytes, size_t numBytes)
{
  ivars = this->ivars;
  if ((*(_DWORD *)ivars & 0xFFFFFF) != numBytes) {
    return 0;
  }
  BOOL v4 = (*(_DWORD *)ivars & 0xFFFFFF) != 0 && (*(_DWORD *)ivars & 0x7F000000) == 167772160;
  int v5 = (char *)ivars + 4;
  if (v4) {
    size_t v6 = v5;
  }
  else {
    size_t v6 = 0;
  }
  return memcmp(v6, bytes, numBytes) == 0;
}

const void *__cdecl OSData::getBytesNoCopy(const OSData *this)
{
  ivars = this->ivars;
  int v3 = *(_DWORD *)ivars;
  int v2 = (char *)ivars + 4;
  int v4 = v3 & 0x7F000000;
  if ((v3 & 0xFFFFFF) != 0 && v4 == 167772160) {
    return v2;
  }
  else {
    return 0;
  }
}

size_t OSData::getLength(const OSData *this)
{
  return *(_DWORD *)this->ivars & 0xFFFFFFLL;
}

BOOL OSString::isEqualTo(const OSString *this, const OSData *aDataObject)
{
  size_t StringLength = OSSerializationGetStringLength((const unsigned int *)this->ivars);
  ivars = aDataObject->ivars;
  int v7 = *(_DWORD *)ivars;
  size_t v6 = (char *)ivars + 4;
  size_t v8 = v7 & 0xFFFFFF;
  int v9 = v7 & 0x7F000000;
  if (v8) {
    BOOL v10 = v9 == 167772160;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    int v11 = v6;
  }
  else {
    int v11 = 0;
  }
  if (StringLength > v8) {
    return 0;
  }
  if (StringLength >= v8)
  {
    uint64_t v18 = this->ivars;
    int v20 = *(_DWORD *)v18;
    uint64_t v19 = (char *)v18 + 4;
    int v21 = v20 & 0x7E000000 | 0x1000000;
    if ((v20 & 0x7FFFFFFF) == 0x8000000) {
      uint64_t v19 = 0;
    }
    if (v21 == 150994944) {
      char v22 = v19;
    }
    else {
      char v22 = 0;
    }
    int v17 = strncmp(v11, v22, StringLength);
  }
  else
  {
    if (StringLength + 1 != v8) {
      return 0;
    }
    int v13 = this->ivars;
    int v15 = *(_DWORD *)v13;
    uint64_t v14 = (char *)v13 + 4;
    if ((v15 & 0x7FFFFFFF) == 0x8000000) {
      BOOL v16 = 0;
    }
    else {
      BOOL v16 = v14;
    }
    int v17 = strcmp(v11, v16);
  }
  return v17 == 0;
}

void OSData::free(OSData *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    unint64_t v3 = *(_DWORD *)ivars & 0xFFFFFF;
    unint64_t v4 = (v3 + 3) & 0x1FFFFFC;
    if (v4 < v3) {
      OSData::free();
    }
    IOFree(ivars, v4 + 4);
    this->ivars = 0;
  }

  OSObject::free(this);
}

void non-virtual thunk to'OSData::free(OSData *this)
{
}

OSDataPtr OSData::withCapacity(uint32_t capacity)
{
  return OSDataCreate(0, 0);
}

OSDataPtr OSData::withData(const OSData *inData)
{
  ivars = inData->ivars;
  int v3 = *(_DWORD *)ivars;
  int v2 = (char *)ivars + 4;
  int v4 = v3 & 0x7F000000;
  size_t v5 = v3 & 0xFFFFFF;
  if (v5) {
    BOOL v6 = v4 == 167772160;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    int v7 = v2;
  }
  else {
    int v7 = 0;
  }
  return OSDataCreate(v7, v5);
}

OSDataPtr OSData::withData(const OSData *inData, size_t start, size_t numBytes)
{
  if (__CFADD__(start, numBytes)) {
    return 0;
  }
  ivars = inData->ivars;
  if (start + numBytes > (*(_DWORD *)ivars & 0xFFFFFFu)) {
    return 0;
  }
  BOOL v4 = (*(_DWORD *)ivars & 0xFFFFFF) != 0 && (*(_DWORD *)ivars & 0x7F000000) == 167772160;
  size_t v5 = (char *)ivars + 4;
  if (!v4) {
    size_t v5 = 0;
  }
  if (!&v5[start]) {
    return 0;
  }
  else {
    return OSDataCreate(&v5[start], numBytes);
  }
}

const void *__cdecl OSData::getBytesNoCopy(const OSData *this, size_t start, size_t numBytes)
{
  if (__CFADD__(start, numBytes)) {
    return 0;
  }
  ivars = this->ivars;
  if (start + numBytes > (*(_DWORD *)ivars & 0xFFFFFFu)) {
    return 0;
  }
  BOOL v5 = (*(_DWORD *)ivars & 0xFFFFFF) != 0 && (*(_DWORD *)ivars & 0x7F000000) == 167772160;
  BOOL v6 = (char *)ivars + 4;
  if (!v5) {
    BOOL v6 = 0;
  }
  return &v6[start];
}

size_t OSData::getCapacity(const OSData *this)
{
  return *(_DWORD *)this->ivars & 0xFFFFFFLL;
}

BOOL OSData::appendBytes(OSData *this, const OSData *aDataObj)
{
  ivars = aDataObj->ivars;
  int v4 = *(_DWORD *)ivars;
  int v3 = (char *)ivars + 4;
  int v5 = v4 & 0x7F000000;
  size_t v6 = v4 & 0xFFFFFF;
  if (v6) {
    BOOL v7 = v5 == 167772160;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    size_t v8 = v3;
  }
  else {
    size_t v8 = 0;
  }
  return OSDataAppendBytes(this, v8, v6);
}

OSStringPtr OSString::withCString(OSStringPtr cString)
{
  if (cString) {
    return OSStringCreate((const char *)cString, 0xFFFFFFFFFFFFFFFFLL);
  }
  return cString;
}

OSStringPtr OSString::withCStringNoCopy(OSStringPtr cString)
{
  if (cString) {
    return OSStringCreate((const char *)cString, 0xFFFFFFFFFFFFFFFFLL);
  }
  return cString;
}

OSStringPtr OSString::withString(const OSString *aString)
{
  if (aString) {
    ((void (*)(const OSString *))aString->retain)(aString);
  }
  return (OSStringPtr)aString;
}

OSStringPtr OSString::withCString(OSStringPtr cString, size_t length)
{
  if (cString) {
    return OSStringCreate((const char *)cString, length);
  }
  return cString;
}

BOOL OSString::isEqualTo(const OSString *this, const OSMetaClassBase *anObject)
{
  if (anObject == this)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    int v3 = (const OSData *)OSMetaClassBase::safeMetaCast(anObject, gOSDataMetaClass);
    if (v3)
    {
      LOBYTE(v3) = OSString::isEqualTo(this, v3);
    }
  }
  return (char)v3;
}

BOOL OSString::isEqualTo(const OSString *this, const OSString *aString)
{
  return this == aString;
}

BOOL OSString::isEqualTo(const OSString *this, const char *cString)
{
  ivars = this->ivars;
  int v5 = *(_DWORD *)ivars;
  int v4 = (char *)ivars + 4;
  if ((v5 & 0x7FFFFFFF) == 0x8000000) {
    size_t v6 = 0;
  }
  else {
    size_t v6 = v4;
  }
  return strcmp(cString, v6) == 0;
}

OSNumberPtr OSNumber::withNumber(const char *valueString, size_t numberOfBits)
{
  uint64_t v2 = strtoll(valueString, 0, 0);

  return OSNumberCreateWithUInt64Value(v2);
}

size_t OSNumber::numberOfBits(const OSNumber *this)
{
  return 64;
}

uint8_t OSNumber::unsigned8BitValue(const OSNumber *this)
{
  ivars = this->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
    return *((unsigned char *)ivars + 4);
  }
  else {
    return 0;
  }
}

uint16_t OSNumber::unsigned16BitValue(const OSNumber *this)
{
  ivars = this->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
    return *((_WORD *)ivars + 2);
  }
  else {
    return 0;
  }
}

uint32_t OSNumber::unsigned32BitValue(const OSNumber *this)
{
  ivars = this->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
    return *((_DWORD *)ivars + 1);
  }
  else {
    return 0;
  }
}

uint64_t OSNumber::unsigned64BitValue(const OSNumber *this)
{
  ivars = this->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
    return *(void *)((char *)ivars + 4);
  }
  else {
    return 0;
  }
}

BOOL OSNumber::isEqualTo(const OSNumber *this, const OSMetaClassBase *anObject)
{
  int v3 = OSMetaClassBase::safeMetaCast(anObject, gOSNumberMetaClass);
  if (v3)
  {
    ivars = this->ivars;
    if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
      uint64_t v5 = *(void *)((char *)ivars + 4);
    }
    else {
      uint64_t v5 = 0;
    }
    unint64_t meta = v3[1].meta;
    if (((uint64_t)meta->__vftable & 0x7F000000) == 0x4000000) {
      uint64_t v7 = *(uint64_t *)((char *)&meta->__vftable + 4);
    }
    else {
      uint64_t v7 = 0;
    }
    LOBYTE(v3) = v5 == v7;
  }
  return (char)v3;
}

BOOL OSNumber::isEqualTo(const OSNumber *this, const OSNumber *aNumber)
{
  ivars = this->ivars;
  if ((*(_DWORD *)ivars & 0x7F000000) == 0x4000000) {
    uint64_t v3 = *(void *)((char *)ivars + 4);
  }
  else {
    uint64_t v3 = 0;
  }
  int v4 = aNumber->ivars;
  if ((*(_DWORD *)v4 & 0x7F000000) == 0x4000000) {
    uint64_t v5 = *(void *)((char *)v4 + 4);
  }
  else {
    uint64_t v5 = 0;
  }
  return v3 == v5;
}

void OSNumber::free(OSNumber *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    IOFree(ivars, 0xCuLL);
    this->ivars = 0;
  }

  OSObject::free(this);
}

void non-virtual thunk to'OSNumber::free(OSNumber *this)
{
}

OSObject *OSBooleanCreate(void)
{
  pObject = 0;
  if (OSObjectAllocate(gOSBooleanMetaClass, &pObject)) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = pObject;
  }
  v0[1].OSMetaClassBase::__vftable = (OSObject_vtbl *)IOMallocZeroTyped(4uLL, 0x996826BCuLL);
  return v0;
}

void OSCollectionsInitialize(void)
{
  kOSBooleanTrue = (OSBooleanPtr)OSBooleanCreate();
  *(_DWORD *)kOSBooleanTrue->ivars = 184549377;
  kOSBooleanFalse = (OSBooleanPtr)OSBooleanCreate();
  *(_DWORD *)kOSBooleanFalse->ivars = 184549376;
}

const void *__cdecl OSSerialization::finalizeBuffer(OSSerialization *this, size_t *length)
{
  ivars = this->ivars;
  if (*((void *)ivars + 1)) {
    OSSerialization::finalizeBuffer();
  }
  if (length)
  {
    *size_t length = *((void *)ivars + 4);
    ivars = this->ivars;
  }
  uint64_t v3 = (const void *)*((void *)ivars + 2);
  *((void *)ivars + 2) = 0;
  *((void *)this->ivars + 4) = 0;
  *((void *)this->ivars + 3) = 0;
  return v3;
}

void OSSerialization::freeBuffer(const void *buffer, size_t length)
{
  if (MEMORY[0x23ECFFE40](*MEMORY[0x263EF8960], buffer, length)) {
    OSSerialization::freeBuffer();
  }
}

void OSSerialization::free(OSSerialization *this)
{
  ivars = this->ivars;
  uint64_t v3 = *((void *)ivars + 1);
  if (v3)
  {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *((void *)ivars + 2), *((void *)ivars + 4));
    _Block_release(*((const void **)this->ivars + 1));
    *((void *)this->ivars + IOExtensiblePaniclog::free(this - 1) = 0;
  }
  else
  {
    size_t v4 = *((void *)ivars + 3);
    if (v4) {
      OSSerialization::freeBuffer(*((const void **)ivars + 2), v4);
    }
  }
  *((void *)this->ivars + 2) = 0;
  *((void *)this->ivars + 4) = 0;
  *((void *)this->ivars + 3) = 0;
  IOFree(this->ivars, 0x38uLL);

  OSObject::free(this);
}

void non-virtual thunk to'OSSerialization::free(OSSerialization *this)
{
}

uint64_t ___ZL24OSDictionaryContainerizeP12OSDictionary_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 32) + 16 * a2) = (a3 << 32) | 1;
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 32) + 16 * a2 + 8) = (a4 << 32) | 1;
  return 0;
}

uint64_t OSSerializationDictionaryApply(OSSerialization *a1, unsigned int a2, uint64_t a3)
{
  ivars = a1->ivars;
  if (*((_DWORD *)ivars + 12) <= a2) {
    OSSerializationDictionaryApply();
  }
  int v4 = *(_DWORD *)(*((void *)ivars + 5) + 4 * a2);
  if ((v4 & 0x7F000000) != 0x1000000) {
    OSSerializationDictionaryApply();
  }
  unint64_t v5 = *(void *)&v4 & 0xFFFFFFLL;
  if ((v4 & 0xFFFFFF) == 0) {
    return 0;
  }
  unint64_t v8 = 0;
  unsigned int v9 = a2 + 2;
  do
  {
    if (v9 >= *((_DWORD *)a1->ivars + 12)) {
      OSSerializationDictionaryApply();
    }
    unsigned int v10 = OSSerializationSize(a1, v9) + v9;
    if (v10 >= *((_DWORD *)a1->ivars + 12)) {
      OSSerializationDictionaryApply();
    }
    int v11 = OSSerializationSize(a1, v10);
    uint64_t v12 = OSSerializationValue(a1, v9);
    unsigned int v13 = OSSerializationValue(a1, v10);
    uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, void))(a3 + 16))(a3, v8, v12, v13);
    if (result) {
      break;
    }
    unsigned int v9 = v11 + v10;
    ++v8;
  }
  while (v8 < v5);
  return result;
}

uint64_t ___ZL25OSDictionaryInternalApplyP12OSDictionaryU13block_pointerFbmP15OSSerialization17OSCollectionEntryS3_E_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 8), (a3 << 32) | 1, (a4 << 32) | 1);
}

uint64_t ___ZL20OSDictionaryGetEntryP12OSDictionaryP8OSObjectPKcPm_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, OSMetaClassBase *anObject, uint64_t a5)
{
  if (anObject)
  {
    int v11 = *(const char **)(a1 + 40);
    if (!v11)
    {
      uint64_t result = (uint64_t)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(a1 + 48), gOSStringMetaClass);
      if (!result) {
        return result;
      }
      int v21 = *(_DWORD **)(result + 40);
      int v22 = *v21;
      if ((*v21 & 0x7E000000 | 0x1000000) == 0x9000000)
      {
        int v23 = (const char *)(v21 + 1);
        if ((v22 & 0x7FFFFFFF) == 0x8000000) {
          int v11 = 0;
        }
        else {
          int v11 = v23;
        }
      }
      else
      {
        int v11 = 0;
      }
    }
    StringPtr = OSCollectionEntryGetStringPtr(a3, anObject);
    uint64_t StringLength = OSSerializationGetStringLength((const unsigned int *)(*(void *)(*(void *)(a3 + 48) + 40)
                                                                       + 4 * ((unint64_t)anObject >> 32)));
    if (StringPtr)
    {
      size_t v14 = StringLength;
      if (StringLength == strlen(v11) && !strncmp((const char *)StringPtr, v11, v14)) {
        goto LABEL_16;
      }
    }
    return 0;
  }
  unsigned int v9 = *(OSMetaClassBase **)(a1 + 48);
  if (v9)
  {
    if (v9 == anObject)
    {
LABEL_16:
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a5;
      int v20 = *(void **)(a1 + 56);
      if (v20) {
        *int v20 = a2;
      }
      return 1;
    }
    return 0;
  }
  if (!*(void *)(a1 + 40)) {
    ___ZL20OSDictionaryGetEntryP12OSDictionaryP8OSObjectPKcPm_block_invoke_cold_1();
  }
  uint64_t result = (uint64_t)OSMetaClassBase::safeMetaCast(anObject, gOSStringMetaClass);
  if (result)
  {
    BOOL v16 = *(_DWORD **)(result + 40);
    int v18 = *v16;
    int v17 = (const char *)(v16 + 1);
    if ((v18 & 0x7FFFFFFF) == 0x8000000) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = v17;
    }
    if (!strcmp(*(const char **)(a1 + 40), v19)) {
      goto LABEL_16;
    }
    return 0;
  }
  return result;
}

uint64_t ___ZL19OSArrayContainerizeP7OSArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 64) + 32) + 8 * a2) = (a3 << 32) | 1;
  return 0;
}

uint64_t OSSerializationArrayApply(OSSerialization *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  ivars = a1->ivars;
  if (*((_DWORD *)ivars + 12) <= a2) {
    OSSerializationArrayApply();
  }
  int v5 = *(_DWORD *)(*((void *)ivars + 5) + 4 * a2);
  if ((v5 & 0x7E000000) != 0x2000000) {
    OSSerializationArrayApply();
  }
  unint64_t v6 = *(void *)&v5 & 0xFFFFFFLL;
  if ((v5 & 0xFFFFFF) == 0) {
    return 0;
  }
  unint64_t v9 = 0;
  unsigned int v10 = a2 + 2;
  unint64_t v11 = a3;
  do
  {
    if (v10 >= *((_DWORD *)a1->ivars + 12)) {
      OSSerializationArrayApply();
    }
    int v12 = OSSerializationSize(a1, v10);
    if (v9 >= v11)
    {
      unsigned int v14 = OSSerializationValue(a1, v10);
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, void))(a4 + 16))(a4, v9, v14);
      if (result) {
        return result;
      }
    }
    else
    {
      uint64_t result = 0;
    }
    v10 += v12;
    ++v9;
  }
  while (v9 < v6);
  return result;
}

uint64_t ___ZL20OSArrayInternalApplyP7OSArrayjU13block_pointerFbmP15OSSerialization17OSCollectionEntryE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 8), (a3 << 32) | 1);
}

uint64_t ___ZL32OSCollectionEntryDictionaryApplyP15OSSerialization17OSCollectionEntryU13block_pointerFbmS0_S1_S1_E_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40), (a3 << 32) | 1, (a4 << 32) | 1);
}

uint64_t ___ZL27OSCollectionEntryArrayApplyP15OSSerialization17OSCollectionEntryU13block_pointerFbmS0_S1_E_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40), (a3 << 32) | 1);
}

uint64_t ___ZL26OSDictionaryIterateObjectsP12OSDictionaryU13block_pointerFbP8OSObjectS2_E_block_invoke(uint64_t a1, uint64_t a2, OSSerialization *a3, uint64_t a4, uint64_t a5)
{
  if (a4) {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 16 * a2) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a4));
  }
  if (a5) {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 16 * a2 + 8) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a5));
  }
  unint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v9();
}

uint64_t ___ZL21OSArrayIterateObjectsP7OSArrayjU13block_pointerFbP8OSObjectE_block_invoke(uint64_t a1, uint64_t a2, OSSerialization *a3, uint64_t a4)
{
  if (a4) {
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 40) + 64) + 32) + 8 * a2) = OSCreateObjectFromSerializationInternal(a3, HIDWORD(a4));
  }
  int v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

kern_return_t iokit_user_client_trap(void *a1, uint32_t a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  return mac_syscall(IOKIT_USER_CLIENT_TRAP, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t io_object_get_class(unsigned int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(v13, 0, sizeof(v13));
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  *(void *)&v4.msgh_bits = 0x1800001513;
  *(void *)&v4.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v4.msgh_voucher_port = 0xAF000000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) <= 0xE && ((1 << (v1 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v4.msgh_local_port);
  }
  else if (v1)
  {
    mig_dealloc_reply_port(v4.msgh_local_port);
  }
  else
  {
    uint64_t v2 = 4294966995;
    mach_msg_destroy(&v4);
  }
  return v2;
}

uint64_t io_object_conforms_to(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAF100000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_iterator_next(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF200000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_iterator_reset(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF300000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_matching_services(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 480);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAF400000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_property(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAF500000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_create_iterator(unsigned int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v16, 0, 140);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v15 = 0u;
  *((void *)&v15 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v7 = mig_strncpy_zerofill((char *)v16 + 8, a2, 128);
  }
  else {
    int v7 = mig_strncpy((char *)v16 + 8, a2, 128);
  }
  LODWORD(v16[0]) = 0;
  DWORD1(v16[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_port_t v9 = v8 + 44;
  *(_DWORD *)((char *)v16 + v8 + 8) = a3;
  mach_port_t v10 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v9;
  *(void *)&reply_port[2] = __PAIR64__(v10, a1);
  *(void *)&long long v15 = 0xAF600000000;
  uint64_t v11 = mach_msg2_internal();
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v11)
    {
      if (DWORD1(v15) == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (DWORD1(v15) == 2906)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v12 = 4294966996;
          if (DWORD2(v15) == 1 && reply_port[1] == 40 && !reply_port[2] && WORD3(v16[0]) << 16 == 1114112)
          {
            uint64_t v12 = 0;
            *a4 = HIDWORD(v15);
            return v12;
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v12 = 4294966996;
          if (LODWORD(v16[0]))
          {
            if (reply_port[2]) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = LODWORD(v16[0]);
            }
          }
        }
        else
        {
          uint64_t v12 = 4294966996;
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v12;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v12;
}

uint64_t io_registry_iterator_enter_entry(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF700000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_iterator_exit_entry(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAF800000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_from_path(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 480);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAF900000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_name(unsigned int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  memset(v13, 0, sizeof(v13));
  long long v12 = 0u;
  long long v11 = 0u;
  long long v10 = 0u;
  long long v9 = 0u;
  long long v8 = 0u;
  long long v7 = 0u;
  long long v6 = 0u;
  long long v5 = 0u;
  *(void *)&v4.msgh_bits = 0x1800001513;
  *(void *)&v4.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v4.msgh_voucher_port = 0xAFA00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) <= 0xE && ((1 << (v1 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v4.msgh_local_port);
  }
  else if (v1)
  {
    mig_dealloc_reply_port(v4.msgh_local_port);
  }
  else
  {
    uint64_t v2 = 4294966995;
    mach_msg_destroy(&v4);
  }
  return v2;
}

uint64_t io_registry_entry_get_properties(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xAFB00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_property_bytes(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  mach_msg_header_t v4 = v3;
  long long v6 = v5;
  unsigned int v7 = v1;
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
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
  *(_OWORD *)__n = 0u;
  long long v24 = 0u;
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v22 = 0u;
  *((void *)&v22 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v8 = mig_strncpy_zerofill((char *)&__n[1], v2, 128);
  }
  else {
    int v8 = mig_strncpy((char *)&__n[1], v2, 128);
  }
  LODWORD(__n[0]) = 0;
  HIDWORD(__n[0]) = v8;
  uint64_t v9 = (v8 + 3) & 0xFFFFFFFC;
  mach_port_t v10 = v9 + 44;
  long long v11 = (char *)reply_port + v9;
  int v12 = *v4;
  if (*v4 >= 0x1000) {
    int v12 = 4096;
  }
  *((_DWORD *)v11 + 1OSArraySetValueInternal(this, index, 0, 0) = v12;
  mach_port_t v13 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v10;
  *(void *)&reply_port[2] = __PAIR64__(v13, v7);
  *(void *)&long long v22 = 0xAFC00000000;
  uint64_t v14 = mach_msg2_internal();
  uint64_t v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
    return v15;
  }
  if (v14)
  {
    mig_dealloc_reply_port(reply_port[3]);
    return v15;
  }
  if (DWORD1(v22) == 71)
  {
    uint64_t v15 = 4294966988;
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)reply_port);
    return v15;
  }
  if (DWORD1(v22) != 2912)
  {
    uint64_t v15 = 4294966995;
    goto LABEL_28;
  }
  if ((reply_port[0] & 0x80000000) != 0) {
    goto LABEL_27;
  }
  if (reply_port[1] - 4137 <= 0xFFFFEFFE)
  {
    if (reply_port[2]) {
      BOOL v16 = 1;
    }
    else {
      BOOL v16 = LODWORD(__n[0]) == 0;
    }
    if (!v16 && reply_port[1] == 36) {
      uint64_t v15 = LODWORD(__n[0]);
    }
    else {
      uint64_t v15 = 4294966996;
    }
    goto LABEL_28;
  }
  if (reply_port[2])
  {
LABEL_27:
    uint64_t v15 = 4294966996;
    goto LABEL_28;
  }
  uint64_t v15 = LODWORD(__n[0]);
  if (LODWORD(__n[0])) {
    goto LABEL_28;
  }
  int v19 = HIDWORD(__n[0]);
  uint64_t v15 = 4294966996;
  if (HIDWORD(__n[0]) > 0x1000
    || reply_port[1] - 40 < HIDWORD(__n[0])
    || reply_port[1] != ((HIDWORD(__n[0]) + 3) & 0xFFFFFFFC) + 40)
  {
    goto LABEL_28;
  }
  size_t v20 = *v4;
  if (HIDWORD(__n[0]) <= v20)
  {
    memcpy(v6, &__n[1], HIDWORD(__n[0]));
    uint64_t v15 = 0;
    *mach_msg_header_t v4 = v19;
  }
  else
  {
    memcpy(v6, &__n[1], v20);
    *mach_msg_header_t v4 = v19;
    return 4294966989;
  }
  return v15;
}

uint64_t io_registry_entry_get_child_iterator(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAFD00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_parent_iterator(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xAFE00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_close(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0000000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_connect_get_service(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0100000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_connect_add_client(unsigned int a1, int a2)
{
  uint64_t v9 = 0x13000000000000;
  int v7 = 1;
  int v8 = a2;
  int v10 = 0;
  *(void *)&v6.msgh_bits = 0x2880001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0400000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_connect_set_properties(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0500000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_registry_entry_get_path(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 480);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB0A00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_get_root_entry(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0B00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_set_properties(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB0C00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_registry_entry_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB0D00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_object_get_retain_count(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0E00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_busy_state(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB0F00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_wait_quiet(unsigned int a1, uint64_t a2)
{
  int v9 = 0;
  uint64_t v7 = *MEMORY[0x263EF80C8];
  uint64_t v8 = a2;
  *(void *)&v6.msgh_bits = 0x2800001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1000000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_create_iterator(unsigned int a1, const char *a2, int a3, _DWORD *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v16, 0, 140);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v15 = 0u;
  *((void *)&v15 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v7 = mig_strncpy_zerofill((char *)v16 + 8, a2, 128);
  }
  else {
    int v7 = mig_strncpy((char *)v16 + 8, a2, 128);
  }
  LODWORD(v16[0]) = 0;
  DWORD1(v16[0]) = v7;
  uint64_t v8 = (v7 + 3) & 0xFFFFFFFC;
  mach_port_t v9 = v8 + 44;
  *(_DWORD *)((char *)v16 + v8 + 8) = a3;
  mach_port_t v10 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v9;
  *(void *)&reply_port[2] = __PAIR64__(v10, a1);
  *(void *)&long long v15 = 0xB1100000000;
  uint64_t v11 = mach_msg2_internal();
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v11)
    {
      if (DWORD1(v15) == 71)
      {
        uint64_t v12 = 4294966988;
      }
      else if (DWORD1(v15) == 2933)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v12 = 4294966996;
          if (DWORD2(v15) == 1 && reply_port[1] == 40 && !reply_port[2] && WORD3(v16[0]) << 16 == 1114112)
          {
            uint64_t v12 = 0;
            *a4 = HIDWORD(v15);
            return v12;
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v12 = 4294966996;
          if (LODWORD(v16[0]))
          {
            if (reply_port[2]) {
              uint64_t v12 = 4294966996;
            }
            else {
              uint64_t v12 = LODWORD(v16[0]);
            }
          }
        }
        else
        {
          uint64_t v12 = 4294966996;
        }
      }
      else
      {
        uint64_t v12 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v12;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v12;
}

uint64_t io_iterator_is_valid(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1200000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_catalog_send_data(unsigned int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v8 = 1;
  uint64_t v9 = a3;
  int v10 = 16777472;
  int v11 = a4;
  uint64_t v12 = *MEMORY[0x263EF80C8];
  int v13 = a2;
  int v14 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513;
  *(void *)&v7.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB1400000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy(&v7);
  }
  return v5;
}

uint64_t io_catalog_terminate(unsigned int a1, int a2, char *src)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v10, 0, 140);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v9 = 0u;
  *((void *)&v9 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  LODWORD(v10[0]) = a2;
  if (MEMORY[0x263EF89D0]) {
    int v4 = mig_strncpy_zerofill((char *)v10 + 12, src, 128);
  }
  else {
    int v4 = mig_strncpy((char *)v10 + 12, src, 128);
  }
  DWORD1(v10[0]) = 0;
  DWORD2(v10[0]) = v4;
  reply_port[0] = 5395;
  reply_port[1] = ((v4 + 3) & 0xFFFFFFFC) + 44;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v9 = 0xB1500000000;
  uint64_t v5 = mach_msg2_internal();
  uint64_t v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v5)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v6 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v6;
}

uint64_t io_catalog_get_data(unsigned int a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  uint64_t v8 = 0;
  int v11 = 0;
  uint64_t v10 = 0;
  uint64_t v6 = *MEMORY[0x263EF80C8];
  int v7 = a2;
  *(void *)&v5.msgh_bits = 0x2400001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1600000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) <= 0xE && ((1 << (v2 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  else if (v2)
  {
    mig_dealloc_reply_port(v5.msgh_local_port);
  }
  else
  {
    uint64_t v3 = 4294966995;
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t io_catalog_get_gen_count(unsigned int a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB1700000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_catalog_module_loaded(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB1800000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_catalog_reset(unsigned int a1, int a2)
{
  uint64_t v9 = 0;
  uint64_t v7 = *MEMORY[0x263EF80C8];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1900000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_service_request_probe(unsigned int a1, int a2)
{
  uint64_t v9 = 0;
  uint64_t v7 = *MEMORY[0x263EF80C8];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB1A00000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_name_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB1B00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_match_property_table(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 480);
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB1C00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_connect_get_notification_semaphore(unsigned int a1, int a2)
{
  int v10 = 0;
  uint64_t v9 = 0;
  uint64_t v7 = *MEMORY[0x263EF80C8];
  int v8 = a2;
  *(void *)&v6.msgh_bits = 0x2400001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2400000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_location_in_plane(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB2600000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_property_recursively(unsigned int a1, const char *a2, const char *a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_OWORD *)mach_port_t reply_port = 0u;
  *((void *)&v27[0] + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  uint64_t v11 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v12 = mig_strncpy_zerofill((char *)&v27[1] + 8, a2, 128);
  }
  else {
    int v12 = mig_strncpy((char *)&v27[1] + 8, a2, 128);
  }
  LODWORD(v27[1]) = 0;
  DWORD1(v27[1]) = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  int v14 = v13 + 52;
  uint64_t v15 = (char *)reply_port + v13;
  BOOL v16 = v15 - 128;
  uint64_t v17 = v15 + 48;
  if (v11) {
    int v18 = mig_strncpy_zerofill(v17, a3, 128);
  }
  else {
    int v18 = mig_strncpy(v17, a3, 128);
  }
  *((_DWORD *)v16 + 42) = 0;
  *((_DWORD *)v16 + 43) = v18;
  uint64_t v19 = (v18 + 3) & 0xFFFFFFFC;
  mach_port_t v20 = v14 + v19;
  *(_DWORD *)&v16[v19 + 176] = a4;
  mach_port_t v21 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v20;
  *(void *)&reply_port[2] = __PAIR64__(v21, a1);
  *(void *)&v27[0] = 0xB2700000000;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v23 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v22)
    {
      if (DWORD1(v27[0]) == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (DWORD1(v27[0]) == 2955)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v23 = 4294966996;
          if (DWORD2(v27[0]) == 1 && reply_port[1] == 56 && !reply_port[2] && BYTE7(v27[1]) == 1)
          {
            int v24 = DWORD2(v27[1]);
            if (DWORD2(v27[1]) == DWORD1(v28))
            {
              uint64_t v23 = 0;
              *a5 = *(void *)((char *)v27 + 12);
              *a6 = v24;
              return v23;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v23 = 4294966996;
          if (LODWORD(v27[1]))
          {
            if (reply_port[2]) {
              uint64_t v23 = 4294966996;
            }
            else {
              uint64_t v23 = LODWORD(v27[1]);
            }
          }
        }
        else
        {
          uint64_t v23 = 4294966996;
        }
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v23;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v23;
}

uint64_t io_service_get_state(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB2800000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_matching_services_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a3;
  int v13 = 0;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2900000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_service_match_property_table_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a3;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB2A00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_object_get_superclass(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB2C00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_object_get_bundle_identifier(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v10 = 0;
  long long v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_port_t reply_port = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB2D00000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_open_extended(unsigned int a1, int a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  int v10 = 2;
  int v11 = a2;
  uint64_t v12 = 0x13000000000000;
  uint64_t v13 = a5;
  int v14 = 0x1000000;
  int v15 = a6;
  uint64_t v16 = *MEMORY[0x263EF80C8];
  int v17 = a3;
  uint64_t v18 = a4;
  int v19 = a6;
  *(void *)&v9.msgh_bits = 0x5080001513;
  *(void *)&v9.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v9.msgh_voucher_port = 0xB2E00000000;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }
  else if (v6)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }
  else
  {
    uint64_t v7 = 4294966995;
    mach_msg_destroy(&v9);
  }
  return v7;
}

uint64_t io_connect_map_memory_into_task(unsigned int a1, int a2, int a3, uint64_t *a4, uint64_t *a5, int a6)
{
  int v10 = 1;
  int v11 = a3;
  uint64_t v12 = 0x13000000000000;
  uint64_t v13 = *MEMORY[0x263EF80C8];
  int v14 = a2;
  uint64_t v15 = *a4;
  uint64_t v16 = *a5;
  int v17 = a6;
  *(void *)&v9.msgh_bits = 0x4880001513;
  *(void *)&v9.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v9.msgh_voucher_port = 0xB2F00000000;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v9.msgh_local_port);
  }
  else if (v6)
  {
    mig_dealloc_reply_port(v9.msgh_local_port);
  }
  else
  {
    uint64_t v7 = 4294966995;
    mach_msg_destroy(&v9);
  }
  return v7;
}

uint64_t io_connect_unmap_memory_from_task(unsigned int a1, int a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v8 = 1;
  int v9 = a3;
  uint64_t v10 = 0x13000000000000;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a2;
  uint64_t v13 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513;
  *(void *)&v7.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB3000000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy(&v7);
  }
  return v5;
}

uint64_t io_connect_method(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__dst, int *a10, void *a11, int *a12, uint64_t a13, void *a14)
{
  unsigned int v14 = MEMORY[0x270FA5388]();
  uint64_t v81 = *MEMORY[0x263EF8340];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  *(_OWORD *)__n = 0u;
  long long v52 = 0u;
  *(_OWORD *)mach_port_t reply_port = 0u;
  long long v50 = 0u;
  *((void *)&v50 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  LODWORD(__n[0]) = v20;
  if (v15 <= 0x10)
  {
    uint64_t v21 = v19;
    uint64_t v22 = v18;
    unsigned int v23 = v17;
    int v24 = v16;
    unsigned int v25 = v15;
    unsigned int v26 = v14;
    uint64_t v27 = 2 * v15;
    __memcpy_chk();
    HIDWORD(__n[0]) = v25;
    if (v23 <= 0x1000)
    {
      long long v30 = &reply_port[v27];
      uint64_t v31 = (v23 + 3) & 0xFFFFFFFC;
      long long v32 = (char *)&reply_port[v27] + v31;
      int v33 = v27 * 4 + v31;
      memcpy(v30 + 11, v24, v23);
      v30[10] = v23;
      *(void *)(v32 + 44) = v22;
      *(void *)(v32 + 52) = v21;
      int v34 = *a10;
      if (*a10 >= 0x1000) {
        int v34 = 4096;
      }
      *((_DWORD *)v32 + 15) = v34;
      int v35 = *a12;
      if (*a12 >= 0x10) {
        int v35 = 16;
      }
      *((_DWORD *)v32 + 16) = v35;
      *(void *)(v32 + 68) = a13;
      *(void *)(v32 + 76) = *a14;
      mach_port_t v36 = mig_get_reply_port();
      reply_port[0] = 5395;
      reply_port[1] = v33 + 84;
      *(void *)&reply_port[2] = __PAIR64__(v36, v26);
      *(void *)&long long v50 = 0xB3100000000;
      uint64_t v37 = mach_msg2_internal();
      uint64_t v28 = v37;
      if ((v37 - 268435458) <= 0xE && ((1 << (v37 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(reply_port[3]);
        return v28;
      }
      if (v37)
      {
        mig_dealloc_reply_port(reply_port[3]);
        return v28;
      }
      if (DWORD1(v50) == 71)
      {
        uint64_t v28 = 4294966988;
      }
      else if (DWORD1(v50) == 2965)
      {
        if ((reply_port[0] & 0x80000000) != 0) {
          goto LABEL_30;
        }
        if (reply_port[1] - 4277 <= 0xFFFFEF7E)
        {
          if (reply_port[2]) {
            BOOL v38 = 1;
          }
          else {
            BOOL v38 = LODWORD(__n[0]) == 0;
          }
          if (!v38 && reply_port[1] == 36) {
            uint64_t v28 = LODWORD(__n[0]);
          }
          else {
            uint64_t v28 = 4294966996;
          }
          goto LABEL_31;
        }
        if (reply_port[2]) {
          goto LABEL_30;
        }
        uint64_t v28 = LODWORD(__n[0]);
        if (LODWORD(__n[0])) {
          goto LABEL_31;
        }
        int v40 = HIDWORD(__n[0]);
        if (HIDWORD(__n[0]) > 0x1000)
        {
LABEL_30:
          uint64_t v28 = 4294966996;
        }
        else
        {
          uint64_t v28 = 4294966996;
          if (reply_port[1] - 52 >= HIDWORD(__n[0]))
          {
            unsigned int v41 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (reply_port[1] >= v41 + 52)
            {
              long long v42 = (char *)reply_port + v41;
              mach_port_t v43 = *((_DWORD *)v42 + 10);
              if (v43 <= 0x10 && v43 <= (reply_port[1] - v41 - 52) >> 3)
              {
                unsigned int v44 = 8 * v43;
                if (reply_port[1] - v41 == 8 * v43 + 52)
                {
                  size_t v45 = *a10;
                  if (HIDWORD(__n[0]) <= v45)
                  {
                    long long v46 = v42 - 4096;
                    memcpy(__dst, &__n[1], HIDWORD(__n[0]));
                    *a10 = v40;
                    unsigned int v47 = *((_DWORD *)v46 + 1034);
                    long long v48 = v46 + 4140;
                    if (v47 <= *a12)
                    {
                      memcpy(a11, v48, 8 * v47);
                      uint64_t v28 = 0;
                      *a12 = *((_DWORD *)v46 + 1034);
                      *a14 = *(void *)&v46[v44 + 4140];
                      return v28;
                    }
                    memcpy(a11, v48, (8 * *a12));
                    *a12 = *((_DWORD *)v46 + 1034);
                  }
                  else
                  {
                    memcpy(__dst, &__n[1], v45);
                    *a10 = v40;
                  }
                  return 4294966989;
                }
              }
            }
          }
        }
      }
      else
      {
        uint64_t v28 = 4294966995;
      }
LABEL_31:
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v28;
    }
  }
  return 4294966989;
}

uint64_t io_connect_async_method(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, unsigned int a9, uint64_t a10, uint64_t a11, void *__dst, int *a13, void *a14, int *a15, uint64_t a16, void *a17)
{
  unsigned int v17 = MEMORY[0x270FA5388](a1);
  uint64_t v88 = *MEMORY[0x263EF8340];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  *(_OWORD *)__n = 0u;
  long long v59 = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  int v56 = 1;
  int v57 = v23;
  HIDWORD(__n[0]) = 1310720;
  __n[1] = *MEMORY[0x263EF80C8];
  if (v18 <= 8)
  {
    int v24 = v22;
    unsigned int v25 = v21;
    unsigned int v26 = v20;
    int v27 = v19;
    unsigned int v28 = v18;
    unsigned int v29 = v17;
    uint64_t v30 = 8 * v18;
    __memcpy_chk();
    LODWORD(v59) = v28;
    uint64_t v31 = (char *)&reply_port + v30;
    *(_DWORD *)((char *)&reply_port + v30 + 52) = v27;
    if (v25 <= 0x10)
    {
      long long v32 = v31 - 64;
      size_t v33 = 8 * v25;
      memcpy(v31 + 60, v26, v33);
      *((_DWORD *)v32 + 3OSArraySetValueInternal(this, index, 0, 0) = v25;
      if (a9 <= 0x1000)
      {
        mach_port_t v36 = &v32[v33];
        uint64_t v37 = (a9 + 3) & 0xFFFFFFFC;
        BOOL v38 = &v36[v37];
        int v39 = v30 + v33 + v37;
        memcpy(v36 + 128, v24, a9);
        *((_DWORD *)v36 + 3IOExtensiblePaniclog::free(this - 1) = a9;
        *((void *)v38 + 16) = a10;
        *((void *)v38 + 17) = a11;
        int v40 = *a13;
        if (*a13 >= 0x1000) {
          int v40 = 4096;
        }
        *((_DWORD *)v38 + 36) = v40;
        int v41 = *a15;
        if (*a15 >= 0x10) {
          int v41 = 16;
        }
        *((_DWORD *)v38 + 37) = v41;
        *((void *)v38 + 19) = a16;
        *((void *)v38 + 2OSArraySetValueInternal(this, index, 0, 0) = *a17;
        mach_port_t v42 = mig_get_reply_port();
        reply_port.msgh_bits = -2147478253;
        reply_port.uint32_t msgh_size = v39 + 104;
        *(void *)&reply_port.mach_port_t msgh_remote_port = __PAIR64__(v42, v29);
        *(void *)&reply_port.msgh_voucher_port = 0xB3200000000;
        uint64_t v43 = mach_msg2_internal();
        uint64_t v34 = v43;
        if ((v43 - 268435458) <= 0xE && ((1 << (v43 - 2)) & 0x4003) != 0)
        {
          mig_put_reply_port(reply_port.msgh_local_port);
          return v34;
        }
        if (v43)
        {
          mig_dealloc_reply_port(reply_port.msgh_local_port);
          return v34;
        }
        if (reply_port.msgh_id == 71)
        {
          uint64_t v34 = 4294966988;
        }
        else if (reply_port.msgh_id == 2966)
        {
          if ((reply_port.msgh_bits & 0x80000000) != 0) {
            goto LABEL_31;
          }
          if (reply_port.msgh_size - 4277 <= 0xFFFFEF7E)
          {
            if (reply_port.msgh_remote_port) {
              BOOL v44 = 1;
            }
            else {
              BOOL v44 = LODWORD(__n[0]) == 0;
            }
            if (!v44 && reply_port.msgh_size == 36) {
              uint64_t v34 = LODWORD(__n[0]);
            }
            else {
              uint64_t v34 = 4294966996;
            }
            goto LABEL_32;
          }
          if (reply_port.msgh_remote_port) {
            goto LABEL_31;
          }
          uint64_t v34 = LODWORD(__n[0]);
          if (LODWORD(__n[0])) {
            goto LABEL_32;
          }
          int v46 = HIDWORD(__n[0]);
          if (HIDWORD(__n[0]) > 0x1000)
          {
LABEL_31:
            uint64_t v34 = 4294966996;
          }
          else
          {
            uint64_t v34 = 4294966996;
            if (reply_port.msgh_size - 52 >= HIDWORD(__n[0]))
            {
              unsigned int v47 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (reply_port.msgh_size >= v47 + 52)
              {
                long long v48 = (char *)&reply_port + v47;
                mach_msg_size_t v49 = *((_DWORD *)v48 + 10);
                if (v49 <= 0x10 && v49 <= (reply_port.msgh_size - v47 - 52) >> 3)
                {
                  unsigned int v50 = 8 * v49;
                  if (reply_port.msgh_size - v47 == 8 * v49 + 52)
                  {
                    size_t v51 = *a13;
                    if (HIDWORD(__n[0]) <= v51)
                    {
                      long long v52 = v48 - 4096;
                      memcpy(__dst, &__n[1], HIDWORD(__n[0]));
                      *a13 = v46;
                      unsigned int v53 = *((_DWORD *)v52 + 1034);
                      long long v54 = v52 + 4140;
                      if (v53 <= *a15)
                      {
                        memcpy(a14, v54, 8 * v53);
                        uint64_t v34 = 0;
                        *a15 = *((_DWORD *)v52 + 1034);
                        *a17 = *(void *)&v52[v50 + 4140];
                        return v34;
                      }
                      memcpy(a14, v54, (8 * *a15));
                      *a15 = *((_DWORD *)v52 + 1034);
                    }
                    else
                    {
                      memcpy(__dst, &__n[1], v51);
                      *a13 = v46;
                    }
                    return 4294966989;
                  }
                }
              }
            }
          }
        }
        else
        {
          uint64_t v34 = 4294966995;
        }
LABEL_32:
        mach_msg_destroy(&reply_port);
        return v34;
      }
    }
  }
  return 4294966989;
}

uint64_t io_connect_set_notification_port(unsigned int a1, int a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v8 = 1;
  int v9 = a3;
  uint64_t v10 = 0x14000000000000;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a2;
  uint64_t v13 = a4;
  *(void *)&v7.msgh_bits = 0x3C80001513;
  *(void *)&v7.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB3300000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy(&v7);
  }
  return v5;
}

uint64_t io_service_add_notification(unsigned int a1, const char *a2, const char *a3, int a4, const void *a5, unsigned int a6, _DWORD *a7)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  memset(v28, 0, 448);
  long long v26 = 0u;
  long long v27 = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  int v24 = 1;
  int v25 = a4;
  DWORD1(v26) = 1310720;
  *((void *)&v26 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  uint64_t v12 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v13 = mig_strncpy_zerofill((char *)&v27 + 8, a2, 128);
  }
  else {
    int v13 = mig_strncpy((char *)&v27 + 8, a2, 128);
  }
  LODWORD(v27) = 0;
  DWORD1(v27) = v13;
  uint64_t v14 = (v13 + 3) & 0xFFFFFFFC;
  unsigned int v15 = (char *)&reply_port + v14 - 128;
  uint64_t v16 = (char *)v28 + v14;
  if (v12) {
    int v17 = mig_strncpy_zerofill(v16, a3, 512);
  }
  else {
    int v17 = mig_strncpy(v16, a3, 512);
  }
  *((_DWORD *)v15 + 46) = 0;
  *((_DWORD *)v15 + 47) = v17;
  if (a6 > 8) {
    return 4294966989;
  }
  uint64_t v19 = (v17 + 3) & 0xFFFFFFFC;
  memcpy(&v15[v19 + 196], a5, 8 * a6);
  *(_DWORD *)&v15[v19 + 192] = a6;
  mach_port_t v20 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.uint32_t msgh_size = v14 + 8 * a6 + v19 + 68;
  *(void *)&reply_port.mach_port_t msgh_remote_port = __PAIR64__(v20, a1);
  *(void *)&reply_port.msgh_voucher_port = 0xB3400000000;
  uint64_t v21 = mach_msg2_internal();
  uint64_t v18 = v21;
  if ((v21 - 268435458) <= 0xE && ((1 << (v21 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v21)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v18 = 4294966988;
      }
      else if (reply_port.msgh_id == 2968)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v18 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 40 && !reply_port.msgh_remote_port && WORD3(v26) << 16 == 1114112)
          {
            uint64_t v18 = 0;
            *a7 = v25;
            return v18;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v18 = 4294966996;
          if (v26)
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v18 = 4294966996;
            }
            else {
              uint64_t v18 = v26;
            }
          }
        }
        else
        {
          uint64_t v18 = 4294966996;
        }
      }
      else
      {
        uint64_t v18 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v18;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v18;
}

uint64_t io_service_add_interest_notification(unsigned int a1, const char *a2, int a3, const void *a4, unsigned int a5, _DWORD *a6)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  memset(v20, 0, 204);
  long long v19 = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  int v17 = 1;
  int v18 = a3;
  DWORD1(v19) = 1310720;
  *((void *)&v19 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v10 = mig_strncpy_zerofill((char *)v20 + 8, a2, 128);
  }
  else {
    int v10 = mig_strncpy((char *)v20 + 8, a2, 128);
  }
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v10;
  if (a5 > 8) {
    return 4294966989;
  }
  uint64_t v12 = (v10 + 3) & 0xFFFFFFFC;
  memcpy((char *)v20 + v12 + 12, a4, 8 * a5);
  *(_DWORD *)((char *)v20 + v12 + 8) = a5;
  mach_port_t v13 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.uint32_t msgh_size = v12 + 8 * a5 + 60;
  *(void *)&reply_port.mach_port_t msgh_remote_port = __PAIR64__(v13, a1);
  *(void *)&reply_port.msgh_voucher_port = 0xB3500000000;
  uint64_t v14 = mach_msg2_internal();
  uint64_t v11 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v14)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (reply_port.msgh_id == 2969)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v11 = 4294966996;
          if (v17 == 1 && reply_port.msgh_size == 40 && !reply_port.msgh_remote_port && WORD3(v19) << 16 == 1114112)
          {
            uint64_t v11 = 0;
            *a6 = v18;
            return v11;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v11 = 4294966996;
          if (v19)
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = v19;
            }
          }
        }
        else
        {
          uint64_t v11 = 4294966996;
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v11;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v11;
}

uint64_t io_service_add_notification_ool(unsigned int a1, const char *a2, uint64_t a3, int a4, int a5, const void *a6, unsigned int a7, _DWORD *a8, _DWORD *a9)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  long long v29 = 0u;
  memset(v30, 0, sizeof(v30));
  memset(&reply_port, 0, sizeof(reply_port));
  int v24 = 2;
  uint64_t v25 = a3;
  int v26 = 0x1000000;
  int v27 = a4;
  int v28 = a5;
  DWORD1(v29) = 1310720;
  *((void *)&v29 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v14 = mig_strncpy_zerofill((char *)v30 + 8, a2, 128);
  }
  else {
    int v14 = mig_strncpy((char *)v30 + 8, a2, 128);
  }
  LODWORD(v30[0]) = 0;
  DWORD1(v30[0]) = v14;
  uint64_t v15 = (v14 + 3) & 0xFFFFFFFC;
  uint64_t v16 = (char *)&reply_port + v15;
  *(_DWORD *)((char *)v30 + v15 + 8) = a4;
  if (a7 > 8) {
    return 4294966989;
  }
  int v18 = v16 - 128;
  memcpy(v16 + 80, a6, 8 * a7);
  *((_DWORD *)v18 + 5IOExtensiblePaniclog::free(this - 1) = a7;
  mach_port_t v19 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.uint32_t msgh_size = v15 + 8 * a7 + 80;
  *(void *)&reply_port.mach_port_t msgh_remote_port = __PAIR64__(v19, a1);
  *(void *)&reply_port.msgh_voucher_port = 0xB3600000000;
  uint64_t v20 = mach_msg2_internal();
  uint64_t v17 = v20;
  if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v20)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v17 = 4294966988;
      }
      else if (reply_port.msgh_id == 2970)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 52 && !reply_port.msgh_remote_port && HIWORD(v26) << 16 == 1114112)
          {
            uint64_t v17 = 0;
            int v21 = v25;
            *a8 = v29;
            *a9 = v21;
            return v17;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v17 = 4294966996;
          if (HIDWORD(v25))
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v17 = 4294966996;
            }
            else {
              uint64_t v17 = HIDWORD(v25);
            }
          }
        }
        else
        {
          uint64_t v17 = 4294966996;
        }
      }
      else
      {
        uint64_t v17 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v17;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v17;
}

uint64_t io_registry_entry_get_registry_entry_id(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v9 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3700000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_connect_method_var_output(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__dst, int *a10, void *a11, int *a12, void *a13, _DWORD *a14)
{
  unsigned int v14 = MEMORY[0x270FA5388](a1);
  uint64_t v78 = *MEMORY[0x263EF8340];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  *(_OWORD *)&v48[16] = 0u;
  *(_OWORD *)__n = 0u;
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  *(_OWORD *)long long v48 = 0u;
  *(void *)&v48[8] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&v48[16] = v20;
  if (v15 <= 0x10)
  {
    uint64_t v21 = v19;
    uint64_t v22 = v18;
    unsigned int v23 = v17;
    int v24 = v16;
    unsigned int v25 = v15;
    unsigned int v26 = v14;
    uint64_t v27 = 2 * v15;
    __memcpy_chk();
    *(_DWORD *)&v48[20] = v25;
    if (v23 <= 0x1000)
    {
      uint64_t v30 = &reply_port[v27];
      uint64_t v31 = (v23 + 3) & 0xFFFFFFFC;
      long long v32 = (char *)&reply_port[v27] + v31;
      int v33 = v27 * 4 + v31;
      memcpy(v30 + 11, v24, v23);
      v30[10] = v23;
      *(void *)(v32 + 44) = v22;
      *(void *)(v32 + 52) = v21;
      int v34 = *a10;
      if (*a10 >= 0x1000) {
        int v34 = 4096;
      }
      *((_DWORD *)v32 + 15) = v34;
      int v35 = *a12;
      if (*a12 >= 0x10) {
        int v35 = 16;
      }
      *((_DWORD *)v32 + 16) = v35;
      mach_port_t v36 = mig_get_reply_port();
      reply_port[0] = 5395;
      reply_port[1] = v33 + 68;
      *(void *)&reply_port[2] = __PAIR64__(v36, v26);
      *(void *)long long v48 = 0xB3800000000;
      uint64_t v37 = mach_msg2_internal();
      uint64_t v28 = v37;
      if ((v37 - 268435458) <= 0xE && ((1 << (v37 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(reply_port[3]);
        return v28;
      }
      if (v37)
      {
        mig_dealloc_reply_port(reply_port[3]);
        return v28;
      }
      if (*(_DWORD *)&v48[4] == 71)
      {
        uint64_t v28 = 4294966988;
      }
      else if (*(_DWORD *)&v48[4] == 2972)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v28 = 4294966996;
          if (*(_DWORD *)&v48[8] == 1
            && reply_port[1] >= 0x40
            && reply_port[1] <= 0x10C0
            && !reply_port[2]
            && v48[23] == 1)
          {
            int v38 = HIDWORD(__n[0]);
            if (HIDWORD(__n[0]) <= 0x1000 && reply_port[1] - 64 >= HIDWORD(__n[0]))
            {
              unsigned int v39 = (HIDWORD(__n[0]) + 3) & 0xFFFFFFFC;
              if (reply_port[1] >= v39 + 64)
              {
                int v40 = (char *)reply_port + v39;
                mach_port_t v41 = *((_DWORD *)v40 + 14);
                if (v41 <= 0x10 && v41 <= (reply_port[1] - v39 - 64) >> 3 && reply_port[1] - v39 == 8 * v41 + 64)
                {
                  mach_port_t v42 = v40 - 4096;
                  uint64_t v43 = (uint64_t)&v40[8 * v41 - 4096];
                  if (*(_DWORD *)&v48[24] == *(_DWORD *)(v43 + 4156))
                  {
                    size_t v44 = *a10;
                    if (HIDWORD(__n[0]) <= v44)
                    {
                      memcpy(__dst, &__n[1], HIDWORD(__n[0]));
                      *a10 = v38;
                      unsigned int v45 = *((_DWORD *)v42 + 1038);
                      int v46 = v42 + 4156;
                      if (v45 <= *a12)
                      {
                        memcpy(a11, v46, 8 * v45);
                        uint64_t v28 = 0;
                        *a12 = *((_DWORD *)v42 + 1038);
                        *a13 = *(void *)&v48[12];
                        *a14 = *(_DWORD *)(v43 + 4156);
                        return v28;
                      }
                      memcpy(a11, v46, (8 * *a12));
                      *a12 = *((_DWORD *)v42 + 1038);
                    }
                    else
                    {
                      memcpy(__dst, &__n[1], v44);
                      *a10 = v38;
                    }
                    return 4294966989;
                  }
                }
              }
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v28 = 4294966996;
          if (*(_DWORD *)&v48[16])
          {
            if (reply_port[2]) {
              uint64_t v28 = 4294966996;
            }
            else {
              uint64_t v28 = *(unsigned int *)&v48[16];
            }
          }
        }
        else
        {
          uint64_t v28 = 4294966996;
        }
      }
      else
      {
        uint64_t v28 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v28;
    }
  }
  return 4294966989;
}

uint64_t io_service_get_matching_service(unsigned int a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 480);
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB3900000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_get_matching_service_ool(unsigned int a1, uint64_t a2, int a3)
{
  int v7 = 1;
  uint64_t v8 = a2;
  int v9 = 0x1000000;
  int v10 = a3;
  uint64_t v11 = *MEMORY[0x263EF80C8];
  int v12 = a3;
  int v13 = 0;
  *(void *)&v6.msgh_bits = 0x3880001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB3A00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_service_get_authorization_id(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v9 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3B00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_set_authorization_id(unsigned int a1, uint64_t a2)
{
  int v9 = 0;
  uint64_t v7 = *MEMORY[0x263EF80C8];
  uint64_t v8 = a2;
  *(void *)&v6.msgh_bits = 0x2800001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB3C00000000;
  uint64_t v2 = mach_msg2_internal();
  uint64_t v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if (v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      uint64_t v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_server_version(unsigned int a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  int v9 = 0;
  uint64_t v8 = 0;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3D00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_properties_bin(unsigned int a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v8 = 0;
  long long v6 = 0u;
  long long v7 = 0u;
  *(void *)&v5.msgh_bits = 0x1800001513;
  *(void *)&v5.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v5.msgh_voucher_port = 0xB3E00000000;
  uint64_t v1 = mach_msg2_internal();
  uint64_t v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if (v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      uint64_t v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_property_bin(unsigned int a1, const char *a2, const char *a3, int a4, void *a5, _DWORD *a6)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  int v44 = 0;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  *((void *)&v27[0] + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  uint64_t v11 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v12 = mig_strncpy_zerofill((char *)&v27[1] + 8, a2, 128);
  }
  else {
    int v12 = mig_strncpy((char *)&v27[1] + 8, a2, 128);
  }
  LODWORD(v27[1]) = 0;
  DWORD1(v27[1]) = v12;
  uint64_t v13 = (v12 + 3) & 0xFFFFFFFC;
  int v14 = v13 + 52;
  unsigned int v15 = (char *)reply_port + v13;
  uint64_t v16 = v15 - 128;
  unsigned int v17 = v15 + 48;
  if (v11) {
    int v18 = mig_strncpy_zerofill(v17, a3, 128);
  }
  else {
    int v18 = mig_strncpy(v17, a3, 128);
  }
  *((_DWORD *)v16 + 42) = 0;
  *((_DWORD *)v16 + 43) = v18;
  uint64_t v19 = (v18 + 3) & 0xFFFFFFFC;
  mach_port_t v20 = v14 + v19;
  *(_DWORD *)&v16[v19 + 176] = a4;
  mach_port_t v21 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v20;
  *(void *)&reply_port[2] = __PAIR64__(v21, a1);
  *(void *)&v27[0] = 0xB3F00000000;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v23 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v22)
    {
      if (DWORD1(v27[0]) == 71)
      {
        uint64_t v23 = 4294966988;
      }
      else if (DWORD1(v27[0]) == 2979)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v23 = 4294966996;
          if (DWORD2(v27[0]) == 1 && reply_port[1] == 56 && !reply_port[2] && BYTE7(v27[1]) == 1)
          {
            int v24 = DWORD2(v27[1]);
            if (DWORD2(v27[1]) == DWORD1(v28))
            {
              uint64_t v23 = 0;
              *a5 = *(void *)((char *)v27 + 12);
              *a6 = v24;
              return v23;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v23 = 4294966996;
          if (LODWORD(v27[1]))
          {
            if (reply_port[2]) {
              uint64_t v23 = 4294966996;
            }
            else {
              uint64_t v23 = LODWORD(v27[1]);
            }
          }
        }
        else
        {
          uint64_t v23 = 4294966996;
        }
      }
      else
      {
        uint64_t v23 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v23;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v23;
}

uint64_t io_service_get_matching_service_bin(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v9 = 0u;
  *((void *)&v9 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (v2 > 0x1000) {
    return 4294966989;
  }
  unsigned int v4 = v2;
  unsigned int v5 = v1;
  __memcpy_chk();
  LODWORD(v1OSArraySetValueInternal(this, index, 0, 0) = v4;
  reply_port[0] = 5395;
  reply_port[1] = ((v4 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v5);
  *(void *)&long long v9 = 0xB4000000000;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v3 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v6)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v3 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v3;
}

uint64_t io_service_get_matching_services_bin(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v9 = 0u;
  *((void *)&v9 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (v2 > 0x1000) {
    return 4294966989;
  }
  unsigned int v4 = v2;
  unsigned int v5 = v1;
  __memcpy_chk();
  LODWORD(v1OSArraySetValueInternal(this, index, 0, 0) = v4;
  reply_port[0] = 5395;
  reply_port[1] = ((v4 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v5);
  *(void *)&long long v9 = 0xB4100000000;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v3 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v6)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v3 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v3;
}

uint64_t io_service_match_property_table_bin(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v40 = *MEMORY[0x263EF8340];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v9 = 0u;
  *((void *)&v9 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (v2 > 0x1000) {
    return 4294966989;
  }
  unsigned int v4 = v2;
  unsigned int v5 = v1;
  __memcpy_chk();
  LODWORD(v1OSArraySetValueInternal(this, index, 0, 0) = v4;
  reply_port[0] = 5395;
  reply_port[1] = ((v4 + 3) & 0xFFFFFFFC) + 36;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v5);
  *(void *)&long long v9 = 0xB4200000000;
  uint64_t v6 = mach_msg2_internal();
  uint64_t v3 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v6)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v3 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v3;
}

uint64_t io_service_add_notification_bin(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  unsigned int v4 = v3;
  unsigned int v6 = v5;
  uint64_t v8 = v7;
  unsigned int v10 = v9;
  long long v12 = v11;
  unsigned int v13 = v1;
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v26 = 0u;
  memset(v27, 0, 464);
  memset(&reply_port, 0, sizeof(reply_port));
  int v24 = 1;
  int v25 = v14;
  DWORD1(v26) = 1310720;
  *((void *)&v26 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v15 = mig_strncpy_zerofill((char *)v27 + 8, v2, 128);
  }
  else {
    int v15 = mig_strncpy((char *)v27 + 8, v2, 128);
  }
  LODWORD(v27[0]) = 0;
  DWORD1(v27[0]) = v15;
  if (v10 > 0x1000) {
    return 4294966989;
  }
  uint64_t v16 = (v15 + 3) & 0xFFFFFFFC;
  memcpy((char *)v27 + v16 + 12, v12, v10);
  *(_DWORD *)((char *)v27 + v16 + 8) = v10;
  if (v6 > 8) {
    return 4294966989;
  }
  uint64_t v19 = (v10 + 3) & 0xFFFFFFFC;
  long long v20 = (char *)&reply_port + v16 + v19 - 128;
  memcpy(v20 + 192, v8, 8 * v6);
  *((_DWORD *)v20 + 47) = v6;
  mach_port_t v21 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.uint32_t msgh_size = v19 + 8 * v6 + v16 + 64;
  *(void *)&reply_port.mach_port_t msgh_remote_port = __PAIR64__(v21, v13);
  *(void *)&reply_port.msgh_voucher_port = 0xB4400000000;
  uint64_t v22 = mach_msg2_internal();
  uint64_t v17 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v22)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v17 = 4294966988;
      }
      else if (reply_port.msgh_id == 2984)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v17 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 40 && !reply_port.msgh_remote_port && WORD3(v26) << 16 == 1114112)
          {
            uint64_t v17 = 0;
            *unsigned int v4 = v25;
            return v17;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v17 = 4294966996;
          if (v26)
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v17 = 4294966996;
            }
            else {
              uint64_t v17 = v26;
            }
          }
        }
        else
        {
          uint64_t v17 = 4294966996;
        }
      }
      else
      {
        uint64_t v17 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v17;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v17;
}

uint64_t io_registry_entry_get_path_ool(uint64_t a1)
{
  unsigned int v2 = MEMORY[0x270FA5388](a1);
  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v9, 0, 480);
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, v1, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, v1, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v2);
  *(void *)&long long v8 = 0xB4500000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_from_path_ool(uint64_t a1)
{
  unsigned int v1 = MEMORY[0x270FA5388](a1);
  uint64_t v4 = v3;
  unsigned int v6 = v5;
  unsigned int v8 = v7;
  unsigned int v9 = v1;
  uint64_t v52 = *MEMORY[0x263EF8340];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  *(_OWORD *)&v23[8] = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  int v20 = 1;
  uint64_t v21 = v10;
  int v22 = 0x1000000;
  *(void *)long long v23 = v7;
  *(void *)&v23[4] = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v11 = mig_strncpy_zerofill(&v23[20], v2, 4096);
  }
  else {
    int v11 = mig_strncpy(&v23[20], v2, 4096);
  }
  *(_DWORD *)&v23[12] = 0;
  *(_DWORD *)&v23[16] = v11;
  uint64_t v12 = (v11 + 3) & 0xFFFFFFFC;
  mach_msg_size_t v13 = v12 + 64;
  *(_DWORD *)&v23[v12 + 20] = v8;
  mach_port_t v14 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.uint32_t msgh_size = v13;
  *(void *)&reply_port.mach_port_t msgh_remote_port = __PAIR64__(v14, v9);
  *(void *)&reply_port.msgh_voucher_port = 0xB4600000000;
  uint64_t v15 = mach_msg2_internal();
  uint64_t v16 = v15;
  if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!v15)
    {
      if (reply_port.msgh_id == 71)
      {
        uint64_t v16 = 4294966988;
      }
      else if (reply_port.msgh_id == 2986)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v16 = 4294966996;
          if (v20 == 1 && reply_port.msgh_size == 52 && !reply_port.msgh_remote_port && HIWORD(v22) << 16 == 1114112)
          {
            uint64_t v16 = 0;
            int v17 = v21;
            _DWORD *v6 = *(_DWORD *)&v23[8];
            *uint64_t v4 = v17;
            return v16;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          uint64_t v16 = 4294966996;
          if (HIDWORD(v21))
          {
            if (reply_port.msgh_remote_port) {
              uint64_t v16 = 4294966996;
            }
            else {
              uint64_t v16 = HIDWORD(v21);
            }
          }
        }
        else
        {
          uint64_t v16 = 4294966996;
        }
      }
      else
      {
        uint64_t v16 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v16;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v16;
}

uint64_t io_device_tree_entry_exists_with_name(unsigned int a1, const char *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  long long v8 = 0u;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  if (MEMORY[0x263EF89D0]) {
    int v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  }
  else {
    int v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  }
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(void *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&long long v8 = 0xB4700000000;
  uint64_t v4 = mach_msg2_internal();
  uint64_t v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if (v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    uint64_t v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_properties_bin_buf(unsigned int a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v7 = *MEMORY[0x263EF80C8];
  uint64_t v8 = a2;
  uint64_t v9 = *a3;
  uint64_t v10 = 0;
  *(void *)&v6.msgh_bits = 0x3000001513;
  *(void *)&v6.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v6.msgh_voucher_port = 0xB4800000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if (v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    uint64_t v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_registry_entry_get_property_bin_buf(unsigned int a1, const char *a2, const char *a3, int a4, uint64_t a5, void *a6, void *a7, _DWORD *a8)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  int v50 = 0;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  *(_OWORD *)mach_msg_header_t reply_port = 0u;
  memset(v32, 0, sizeof(v32));
  *((void *)&v32[0] + IOExtensiblePaniclog::free(this - 1) = *MEMORY[0x263EF80C8];
  uint64_t v15 = MEMORY[0x263EF89D0];
  if (MEMORY[0x263EF89D0]) {
    int v16 = mig_strncpy_zerofill((char *)&v32[1] + 8, a2, 128);
  }
  else {
    int v16 = mig_strncpy((char *)&v32[1] + 8, a2, 128);
  }
  LODWORD(v32[1]) = 0;
  DWORD1(v32[1]) = v16;
  uint64_t v17 = (v16 + 3) & 0xFFFFFFFC;
  int v18 = v17 + 68;
  uint64_t v19 = (char *)reply_port + v17;
  int v20 = v19 - 128;
  uint64_t v21 = v19 + 48;
  if (v15) {
    int v22 = mig_strncpy_zerofill(v21, a3, 128);
  }
  else {
    int v22 = mig_strncpy(v21, a3, 128);
  }
  *((_DWORD *)v20 + 42) = 0;
  *((_DWORD *)v20 + 43) = v22;
  uint64_t v23 = (v22 + 3) & 0xFFFFFFFC;
  mach_port_t v24 = v18 + v23;
  long long v25 = &v20[v23];
  *((_DWORD *)v25 + 44) = a4;
  *(void *)(v25 + 18OSArraySetValueInternal(this, index, 0, 0) = a5;
  *(void *)(v25 + 188) = *a6;
  mach_port_t v26 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v24;
  *(void *)&reply_port[2] = __PAIR64__(v26, a1);
  *(void *)&v32[0] = 0xB4900000000;
  uint64_t v27 = mach_msg2_internal();
  uint64_t v28 = v27;
  if ((v27 - 268435458) <= 0xE && ((1 << (v27 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!v27)
    {
      if (DWORD1(v32[0]) == 71)
      {
        uint64_t v28 = 4294966988;
      }
      else if (DWORD1(v32[0]) == 2989)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          uint64_t v28 = 4294966996;
          if (DWORD2(v32[0]) == 1 && reply_port[1] == 64 && !reply_port[2] && BYTE7(v32[1]) == 1)
          {
            int v29 = DWORD2(v32[1]);
            if (DWORD2(v32[1]) == HIDWORD(v33))
            {
              uint64_t v28 = 0;
              *a6 = *(void *)((char *)&v33 + 4);
              *a7 = *(void *)((char *)v32 + 12);
              *a8 = v29;
              return v28;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          uint64_t v28 = 4294966996;
          if (LODWORD(v32[1]))
          {
            if (reply_port[2]) {
              uint64_t v28 = 4294966996;
            }
            else {
              uint64_t v28 = LODWORD(v32[1]);
            }
          }
        }
        else
        {
          uint64_t v28 = 4294966996;
        }
      }
      else
      {
        uint64_t v28 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v28;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v28;
}

uint64_t io_service_wait_quiet_with_options(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x263EF80C8];
  uint64_t v9 = a2;
  int v10 = a3;
  *(void *)&v7.msgh_bits = 0x2C00001513;
  *(void *)&v7.mach_port_t msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(void *)&v7.msgh_voucher_port = 0xB4A00000000;
  uint64_t v3 = mach_msg2_internal();
  uint64_t v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if (v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
    }
    else
    {
      uint64_t v4 = 4294966995;
      mach_msg_destroy(&v7);
    }
  }
  else
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  return v4;
}

IOReturn IOReporter::configureAllReports(OSCollection *reporters, OSData *channels, IOReportConfigureAction action, uint32_t *outCount)
{
  mach_msg_header_t v7 = channelListWithData(channels);
  IOReturn v8 = -536870206;
  if (outCount && reporters && v7)
  {
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x2000000000;
    int v23 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000;
    int v19 = -536870212;
    if (action > 2)
    {
      IOReturn v8 = -536870201;
    }
    else
    {
      uint64_t v12 = 0;
      uint64_t v13 = &v12;
      uint64_t v14 = 0x2000000000;
      char v15 = 1;
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 1107296256;
      v10[2] = ___ZN10IOReporter19configureAllReportsEP12OSCollectionP6OSDatajPj_block_invoke;
      v10[3] = &__block_descriptor_tmp_2;
      IOReportConfigureAction v11 = action;
      v10[4] = &v20;
      v10[5] = &v16;
      v10[6] = &v12;
      v10[7] = v7;
      ((void (*)(OSCollection *, void *))reporters->iterateObjects)(reporters, v10);
      if (*((unsigned char *)v13 + 24))
      {
        _Block_object_dispose(&v12, 8);
        IOReturn v8 = 0;
        *outCount = *((_DWORD *)v21 + 6);
      }
      else
      {
        IOReturn v8 = *((_DWORD *)v17 + 6);
        _Block_object_dispose(&v12, 8);
      }
    }
    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v20, 8);
  }
  return v8;
}

unsigned int *channelListWithData(OSData *a1)
{
  if (OSData::getLength(a1) < 8) {
    return 0;
  }
  BytesNoCopy = (unsigned int *)OSData::getBytesNoCopy(a1);
  size_t v4 = (16 * *BytesNoCopy) | 8;
  if (OSData::getLength(a1) >= v4) {
    return BytesNoCopy;
  }
  else {
    return 0;
  }
}

BOOL ___ZN10IOReporter19configureAllReportsEP12OSCollectionP6OSDatajPj_block_invoke(uint64_t a1, OSMetaClassBase *anObject)
{
  uint64_t v3 = (IOReporter *)OSMetaClassBase::safeMetaCast(anObject, gIOReporterMetaClass);
  if (v3)
  {
    IOReporter::configureReport(v3, *(IOReportChannelList **)(a1 + 56), *(_DWORD *)(a1 + 64), (uint32_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -536870201;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 0;
}

IOReturn IOReporter::configureReport(IOReporter *this, IOReportChannelList *channelList, IOReportConfigureAction action, uint32_t *elementCount)
{
  uint64_t v5 = *(void *)&action;
  ivars = this->ivars;
  IOLockLock(*((IOLock **)ivars + 13));
  *((unsigned char *)ivars + 65) = 1;
  LODWORD(elementCount) = (*(uint64_t (**)(IOReporter_IVars *, IOReportChannelList *, uint64_t, uint32_t *))(*(void *)this->ivars + 40))(this->ivars, channelList, v5, elementCount);
  uint64_t v9 = this->ivars;
  *((unsigned char *)v9 + 65) = 0;
  IOLockUnlock(*((IOLock **)v9 + 13));
  return (int)elementCount;
}

void __copy_helper_block_8_32r40r48r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
  size_t v4 = *(const void **)(a2 + 48);

  _Block_object_assign((void *)(a1 + 48), v4, 8);
}

void __destroy_helper_block_8_32r40r48r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  unsigned int v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

IOReturn IOReporter::updateAllReports(OSCollection *reporters, OSData *channels, IOReportConfigureAction action, uint32_t *outElementCount, uint64_t offset, uint64_t capacity, IOMemoryDescriptor *buffer)
{
  kern_return_t v16;
  IOMemoryMap *v17;
  void v19[10];
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  void v33[3];
  uint64_t v34;
  IOMemoryMap *map;
  void v36[4];

  uint64_t v13 = channelListWithData(channels);
  IOReturn v14 = -536870206;
  if (buffer)
  {
    if (reporters)
    {
      if (outElementCount)
      {
        char v15 = v13;
        if (v13)
        {
          v36[0] = 0;
          v36[1] = v36;
          v36[2] = 0x2000000000;
          v36[3] = capacity;
          if (__CFADD__(offset, capacity))
          {
            IOReturn v14 = -536870168;
          }
          else
          {
            map = 0;
            uint64_t v16 = IOMemoryDescriptor::CreateMapping(buffer, 0, 0, 0, offset + capacity, 0, &map, 0);
            IOReturn v14 = v16;
            if (!v16)
            {
              uint64_t v17 = map;
              v33[0] = 0;
              v33[1] = v33;
              v33[2] = 0x2000000000;
              long long v34 = 0;
              long long v34 = IOMemoryMap::GetAddress(map) + offset;
              int v29 = 0;
              long long v30 = &v29;
              long long v31 = 0x2000000000;
              long long v32 = 0;
              long long v25 = 0;
              mach_port_t v26 = &v25;
              uint64_t v27 = 0x2000000000;
              uint64_t v28 = -536870212;
              if (action == 1)
              {
                uint64_t v21 = 0;
                uint64_t v22 = &v21;
                int v23 = 0x2000000000;
                mach_port_t v24 = 1;
                v19[0] = MEMORY[0x263EF8330];
                v19[1] = 1107296256;
                v19[2] = ___ZN10IOReporter16updateAllReportsEP12OSCollectionP6OSDatajPjyyP18IOMemoryDescriptor_block_invoke;
                v19[3] = &__block_descriptor_tmp_1;
                uint64_t v20 = 1;
                v19[4] = &v29;
                v19[5] = v33;
                v19[6] = v36;
                v19[7] = &v25;
                v19[8] = &v21;
                v19[9] = v15;
                ((void (*)(OSCollection *, void *))reporters->iterateObjects)(reporters, v19);
                if (*((unsigned char *)v22 + 24))
                {
                  _Block_object_dispose(&v21, 8);
                  IOReturn v14 = 0;
                  *outElementCount = *((_DWORD *)v30 + 6);
                }
                else
                {
                  IOReturn v14 = *((_DWORD *)v26 + 6);
                  _Block_object_dispose(&v21, 8);
                }
              }
              else
              {
                IOReturn v14 = -536870201;
              }
              _Block_object_dispose(&v25, 8);
              _Block_object_dispose(&v29, 8);
              _Block_object_dispose(v33, 8);
              if (v17) {
                ((void (*)(IOMemoryMap *))v17->release)(v17);
              }
            }
          }
          _Block_object_dispose(v36, 8);
        }
      }
    }
  }
  return v14;
}

BOOL ___ZN10IOReporter16updateAllReportsEP12OSCollectionP6OSDatajPjyyP18IOMemoryDescriptor_block_invoke(uint64_t a1, OSMetaClassBase *anObject)
{
  uint64_t v3 = (IOReporter *)OSMetaClassBase::safeMetaCast(anObject, gIOReporterMetaClass);
  if (v3)
  {
    IOReporter::updateReport(v3, *(IOReportChannelList **)(a1 + 72), *(_DWORD *)(a1 + 80), (uint32_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), (uint8_t **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), (size_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -536870201;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  return *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0;
}

IOReturn IOReporter::updateReport(IOReporter *this, IOReportChannelList *channelList, IOReportConfigureAction action, uint32_t *elementCount, uint8_t **buffer, size_t *capacity)
{
  uint64_t v9 = *(void *)&action;
  ivars = this->ivars;
  IOLockLock(*((IOLock **)ivars + 14));
  *((unsigned char *)ivars + 64) = 1;
  LODWORD(capacity) = (*(uint64_t (**)(IOReporter_IVars *, IOReportChannelList *, uint64_t, uint32_t *, uint8_t **, size_t *))(*(void *)this->ivars + 48))(this->ivars, channelList, v9, elementCount, buffer, capacity);
  uint64_t v13 = this->ivars;
  *((unsigned char *)v13 + 64) = 0;
  IOLockUnlock(*((IOLock **)v13 + 14));
  return (int)capacity;
}

void __copy_helper_block_8_32r40r48r56r64r(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 8);
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 8);
  _Block_object_assign((void *)(a1 + 48), *(const void **)(a2 + 48), 8);
  _Block_object_assign((void *)(a1 + 56), *(const void **)(a2 + 56), 8);
  size_t v4 = *(const void **)(a2 + 64);

  _Block_object_assign((void *)(a1 + 64), v4, 8);
}

void __destroy_helper_block_8_32r40r48r56r64r(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 64), 8);
  _Block_object_dispose(*(const void **)(a1 + 56), 8);
  _Block_object_dispose(*(const void **)(a1 + 48), 8);
  _Block_object_dispose(*(const void **)(a1 + 40), 8);
  unsigned int v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 8);
}

void IOReporter_IVars::IOReporter_IVars(IOReporter_IVars *this, IOService *a2, IOReportChannelType a3, uint64_t a4)
{
  *((_DWORD *)this + 1IOExtensiblePaniclog::free(this - 1) = 0;
  *((_DWORD *)this + 12) = 0;
  *((void *)this + 7) = 0;
  *((_WORD *)this + 32) = 0;
  *(void *)this = &unk_26F115A50;
  *((void *)this + IOExtensiblePaniclog::free(this - 1) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = 0;
  *((_WORD *)this + 2OSArraySetValueInternal(this, index, 0, 0) = 0;
  *((void *)this + 1OSArraySetValueInternal(this, index, 0, 0) = 0;
  *((void *)this + 1IOExtensiblePaniclog::free(this - 1) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 24) = 0;
  *((void *)this + 13) = 0;
  *((void *)this + 14) = 0;
  if (a3.report_format)
  {
    mach_msg_header_t v7 = (void *)((char *)this + 16);
    if (!IOService::GetRegistryEntryID(a2, (uint64_t *)this + 2, 0)
      && *v7
      && (*(void *)&a3 & 0x800000000000) == 0)
    {
      *((_WORD *)this + 2OSArraySetValueInternal(this, index, 0, 0) = a3.nelements;
      *((unsigned char *)this + 8) = a3.report_format;
      *((unsigned char *)this + 1IOExtensiblePaniclog::free(this - 1) = HIBYTE(a3.categories);
      *(_WORD *)((char *)this + 9) = *(_DWORD *)&a3.report_format >> 8;
      *((_WORD *)this + 6) = a3.nelements;
      *((_WORD *)this + 7) = a3.element_idx;
      uint64_t v8 = 0x100007980000018;
      if (a4 != 0x101000000000000) {
        uint64_t v8 = a4;
      }
      *((void *)this + 1IOExtensiblePaniclog::free(this - 1) = v8;
      *((void *)this + 14) = IOLockAlloc();
      *((unsigned char *)this + 64) = 0;
      *((void *)this + 13) = IOLockAlloc();
      *((unsigned char *)this + 65) = 0;
      *((void *)this + 7) = OSArray::withCapacity(1u);
    }
  }
}

void IOReporter::free(IOReporter *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    (*(void (**)(IOReporter_IVars *))(*(void *)ivars + 8))(ivars);
    this->ivars = 0;
  }

  OSObject::free(this);
}

void non-virtual thunk to'IOReporter::free(IOReporter *this)
{
}

void IOReporter_IVars::~IOReporter_IVars(IOReporter_IVars *this)
{
  *(void *)this = &unk_26F115A50;
  unsigned int v2 = (IOLock *)*((void *)this + 13);
  if (v2) {
    IOLockFree(v2);
  }
  uint64_t v3 = (IOLock *)*((void *)this + 14);
  if (v3) {
    IOLockFree(v3);
  }
  size_t v4 = (void *)*((void *)this + 3);
  if (v4)
  {
    uint64_t v5 = *((unsigned int *)this + 11);
    if ((int)v5 <= 0) {
      IOReporter_IVars::~IOReporter_IVars();
    }
    if (v5 >> 25) {
      IOReporter_IVars::~IOReporter_IVars();
    }
    IOFree(v4, v5 << 6);
  }
  mach_msg_header_t v6 = (void *)*((void *)this + 4);
  if (v6)
  {
    uint64_t v7 = *((unsigned int *)this + 12);
    if ((int)v7 <= 0) {
      IOReporter_IVars::~IOReporter_IVars();
    }
    if (v7 >> 29) {
      IOReporter_IVars::~IOReporter_IVars();
    }
    IOFree(v6, 4 * v7);
  }
  uint64_t v8 = *((void *)this + 7);
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
  }
}

{
  uint64_t vars8;

  IOReporter_IVars::~IOReporter_IVars(this);

  JUMPOUT(0x23ECFF2F0);
}

IOReturn IOReporter::addChannel(IOReporter *this, uint64_t channelID, const char *channelName)
{
  IOReturn v6 = -536870211;
  ivars = this->ivars;
  IOLockLock(*((IOLock **)ivars + 13));
  *((unsigned char *)ivars + 65) = 1;
  uint64_t v8 = this->ivars;
  unsigned int v9 = *((_DWORD *)v8 + 12);
  if (v9 > 0x7FFFFFFE)
  {
    OSStringPtr v10 = 0;
    uint64_t v11 = 0;
    IOReturn v6 = -536870168;
    goto LABEL_17;
  }
  uint64_t v11 = v9 + 1;
  if ((*(unsigned int (**)(void, uint64_t))(**((void **)v8 + 7) + 88))(*((void *)v8 + 7), v11) <= v9)
  {
    OSStringPtr v10 = 0;
    goto LABEL_17;
  }
  if (channelName)
  {
    OSStringPtr v10 = OSString::withCString(channelName);
    if (!v10) {
      goto LABEL_17;
    }
  }
  else
  {
    if (noChannelName(void)::once != -1) {
      dispatch_once(&noChannelName(void)::once, &__block_literal_global_1);
    }
    OSStringPtr v10 = (OSStringPtr)noChannelName(void)::name;
    if (noChannelName(void)::name) {
      (*(void (**)(uint64_t))(*(void *)noChannelName(void)::name + 8))(noChannelName(void)::name);
    }
  }
  IOReturn v12 = (*(uint64_t (**)(IOReporter_IVars *, void))(*(void *)this->ivars + 16))(this->ivars, v9 + 1);
  if (v12)
  {
    IOReturn v6 = v12;
  }
  else
  {
    uint64_t v13 = this->ivars;
    IOLockLock(*((IOLock **)v13 + 14));
    *((unsigned char *)v13 + 64) = 1;
    IOReturn v6 = (*(uint64_t (**)(IOReporter_IVars *, uint64_t, OSStringPtr))(*(void *)this->ivars + 24))(this->ivars, channelID, v10);
    IOReturn v14 = this->ivars;
    *((unsigned char *)v14 + 64) = 0;
    IOLockUnlock(*((IOLock **)v14 + 14));
    if (v6) {
      uint64_t v11 = v11;
    }
    else {
      uint64_t v11 = v9;
    }
  }
LABEL_17:
  (*(void (**)(IOReporter_IVars *, uint64_t))(*(void *)this->ivars + 32))(this->ivars, v11);
  char v15 = this->ivars;
  *((unsigned char *)v15 + 65) = 0;
  IOLockUnlock(*((IOLock **)v15 + 13));
  if (v10) {
    ((void (*)(OSStringPtr))v10->release)(v10);
  }
  return v6;
}

void IOReporter_IVars::lockReporterConfig(IOLock **this)
{
  *((unsigned char *)this + 65) = 1;
}

void IOReporter_IVars::lockReporter(IOLock **this)
{
  *((unsigned char *)this + 64) = 1;
}

void IOReporter_IVars::unlockReporter(IOReporter_IVars *this)
{
  *((unsigned char *)this + 64) = 0;
  IOLockUnlock(*((IOLock **)this + 14));
}

void IOReporter_IVars::unlockReporterConfig(IOReporter_IVars *this)
{
  *((unsigned char *)this + 65) = 0;
  IOLockUnlock(*((IOLock **)this + 13));
}

OSPtr<IOReportLegendEntry> IOReporter::createLegend(IOReporter *this)
{
  ivars = this->ivars;
  IOLockLock(*((IOLock **)ivars + 13));
  *((unsigned char *)ivars + 65) = 1;
  (*(void (**)(OSDictionary **__return_ptr))(*(void *)this->ivars + 56))(&v6);
  uint64_t v3 = v6;
  size_t v4 = this->ivars;
  *((unsigned char *)v4 + 65) = 0;
  IOLockUnlock(*((IOLock **)v4 + 13));
  return v3;
}

uint64_t IOReporter_IVars::handleSwapPrepare(IOReporter_IVars *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 65)) {
    IOReporter_IVars::handleSwapPrepare();
  }
  if (*((_DWORD *)this + 12) > (signed int)a2) {
    IOReporter_IVars::handleSwapPrepare();
  }
  uint64_t v4 = 3758097127;
  if ((int)a2 < 1) {
    goto LABEL_14;
  }
  unsigned int v5 = *((unsigned __int16 *)this + 20);
  if (!*((_WORD *)this + 20)) {
    goto LABEL_14;
  }
  if (*((void *)this + 9) || *((void *)this + 10)) {
    IOReporter_IVars::handleSwapPrepare();
  }
  if (0x7FFFFFFF / v5 < a2) {
    goto LABEL_11;
  }
  int v6 = v5 * a2;
  if (v6 <= 0)
  {
    IOLog("%s - %s <= 0!\n", "handleSwapPrepare", "newNElements");
LABEL_14:
    size_t v7 = 0;
    size_t v8 = 0;
    goto LABEL_15;
  }
  if (!(v6 >> 25))
  {
    size_t v7 = (unint64_t)v6 << 6;
    IOReturn v12 = IOMallocTyped(v7, 0xB564FA37uLL);
    *((void *)this + 9) = v12;
    if (v12)
    {
      bzero(v12, v7);
      if (a2 >> 29)
      {
        IOLog("%s - %s > INT_MAX / sizeof(%s)!\n", "handleSwapPrepare", "newNChannels", "int");
        goto LABEL_12;
      }
      size_t v8 = 4 * a2;
      uint64_t v13 = IOMallocTyped(v8, 0x36254CA3uLL);
      *((void *)this + 1OSArraySetValueInternal(this, index, 0, 0) = v13;
      if (v13)
      {
        bzero(v13, v8);
        return 0;
      }
    }
    else
    {
      size_t v8 = 0;
    }
    uint64_t v4 = 3758097085;
    goto LABEL_15;
  }
  IOLog("%s - %s > INT_MAX / sizeof(%s)!\n", "handleSwapPrepare", "newNElements", "IOReportElement");
LABEL_11:
  size_t v7 = 0;
LABEL_12:
  size_t v8 = 0;
  uint64_t v4 = 3758097128;
LABEL_15:
  unsigned int v9 = (void *)*((void *)this + 9);
  if (v9)
  {
    IOFree(v9, v7);
    *((void *)this + 9) = 0;
  }
  OSStringPtr v10 = (void *)*((void *)this + 10);
  if (v10)
  {
    IOFree(v10, v8);
    *((void *)this + 1OSArraySetValueInternal(this, index, 0, 0) = 0;
  }
  return v4;
}

uint64_t IOReporter_IVars::handleAddChannelSwap(IOReporter_IVars *this, uint64_t a2, const OSString *a3)
{
  if (!*((unsigned char *)this + 65)) {
    IOReporter_IVars::handleAddChannelSwap();
  }
  if (!*((unsigned char *)this + 64)) {
    IOReporter_IVars::handleAddChannelSwap();
  }
  uint64_t v4 = 3758097084;
  unsigned int v5 = (char *)*((void *)this + 9);
  if (v5)
  {
    uint64_t v6 = *((void *)this + 10);
    if (v6)
    {
      unsigned int v9 = (const void *)*((void *)this + 3);
      if (v9)
      {
        uint64_t v10 = *((unsigned int *)this + 11);
        if ((int)v10 <= 0) {
          IOReporter_IVars::handleAddChannelSwap();
        }
        if (v10 >> 25) {
          IOReporter_IVars::handleAddChannelSwap();
        }
        memcpy(v5, v9, v10 << 6);
        int v11 = *((_DWORD *)this + 11);
        if (v11 <= 0) {
          IOReporter_IVars::handleAddChannelSwap();
        }
        if (v11 >> 29) {
          IOReporter_IVars::handleAddChannelSwap();
        }
        memcpy(*((void **)this + 10), *((const void **)this + 4), 4 * *((int *)this + 12));
        uint64_t v12 = *((void *)this + 3);
        unsigned int v5 = (char *)*((void *)this + 9);
        uint64_t v6 = *((void *)this + 10);
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t v13 = *((void *)this + 4);
      *((void *)this + 3) = v5;
      *((void *)this + 4) = v6;
      *((void *)this + 9) = v12;
      *((void *)this + 1OSArraySetValueInternal(this, index, 0, 0) = v13;
      if (*((_WORD *)this + 20))
      {
        uint64_t v14 = 0;
        LODWORD(v15) = *((_DWORD *)this + 11);
        do
        {
          uint64_t v16 = &v5[64 * (v14 + (int)v15)];
          *(void *)uint64_t v16 = *((void *)this + 2);
          *((void *)v16 + IOExtensiblePaniclog::free(this - 1) = a2;
          *((void *)v16 + 2) = *((void *)this + 1);
          unsigned int v5 = (char *)*((void *)this + 3);
          uint64_t v15 = *((int *)this + 11);
          *(_WORD *)&v5[64 * v14 + 22 + 64 * v15] = v14;
          ++v14;
        }
        while (v14 < *((unsigned __int16 *)this + 20));
      }
      if (OSArray::setObject(*((OSArray **)this + 7), *((_DWORD *)this + 12), a3))
      {
        uint64_t v4 = 0;
        v17.i32[1] = 1;
        v17.i32[0] = *((unsigned __int16 *)this + 20);
        *(int32x2_t *)((char *)this + 44) = vadd_s32(*(int32x2_t *)((char *)this + 44), v17);
      }
      else
      {
        long long v18 = *(_OWORD *)((char *)this + 24);
        *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)this + 72);
        *(_OWORD *)((char *)this + 72) = v18;
        return 3758097085;
      }
    }
  }
  return v4;
}

void IOReporter_IVars::handleSwapCleanup(IOReporter_IVars *this, int a2)
{
  unsigned int v3 = *((unsigned __int16 *)this + 20);
  if (!*((_WORD *)this + 20) || (int)(0x7FFFFFFF / v3) < a2) {
    panic("%s - can't free %d channels of dimension %d", "handleSwapCleanup", a2, v3);
  }
  if (!*((unsigned char *)this + 65)) {
    IOReporter_IVars::handleSwapCleanup();
  }
  unsigned int v5 = (void *)*((void *)this + 9);
  if (v5)
  {
    int v6 = v3 * a2;
    if (v6 <= 0) {
      IOReporter_IVars::handleSwapCleanup();
    }
    if (v6 >> 25) {
      IOReporter_IVars::handleSwapCleanup();
    }
    IOFree(v5, (unint64_t)v6 << 6);
    *((void *)this + 9) = 0;
  }
  size_t v7 = (void *)*((void *)this + 10);
  if (v7)
  {
    if (a2 <= 0) {
      IOReporter_IVars::handleSwapCleanup();
    }
    if (a2 >> 29) {
      IOReporter_IVars::handleSwapCleanup();
    }
    IOFree(v7, 4 * a2);
    *((void *)this + 1OSArraySetValueInternal(this, index, 0, 0) = 0;
  }
}

uint64_t IOReporter_IVars::handleConfigureReport(IOReporter_IVars *this, IOReportChannelList *a2, int a3, unsigned int *a4)
{
  int v15 = 0;
  if (!a2) {
    return 3758097084;
  }
  if (a2->nchannels)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 2;
    do
    {
      if (!(*(unsigned int (**)(IOReporter_IVars *, void, int *))(*(void *)this + 96))(this, *(void *)&a2[v9].nchannels, &v15))
      {
        switch(a3)
        {
          case 0:
            --*((_DWORD *)this + 24);
            uint64_t v10 = *((void *)this + 4);
            uint64_t v11 = v15;
            int v12 = *(_DWORD *)(v10 + 4 * v15) - 1;
LABEL_11:
            *(_DWORD *)(v10 + 4 * v1IOExtensiblePaniclog::free(this - 1) = v12;
            int v13 = 1;
LABEL_12:
            *a4 += v13;
            break;
          case 2:
            int v13 = *((unsigned __int16 *)this + 20);
            goto LABEL_12;
          case 1:
            ++*((_DWORD *)this + 24);
            uint64_t v10 = *((void *)this + 4);
            uint64_t v11 = v15;
            int v12 = *(_DWORD *)(v10 + 4 * v15) + 1;
            goto LABEL_11;
        }
      }
      ++v8;
      v9 += 4;
    }
    while (v8 < a2->nchannels);
  }
  return 0;
}

uint64_t IOReporter_IVars::handleUpdateReport(IOReporter_IVars *this, IOReportChannelList *a2, int a3, unsigned int *a4, unsigned __int8 **a5, unint64_t *a6)
{
  int v17 = 0;
  uint64_t v6 = 3758097084;
  if (a2 && *a5 && *((_DWORD *)this + 24))
  {
    if (a2->nchannels)
    {
      uint64_t v13 = 0;
      for (uint64_t i = 2; ; i += 4)
      {
        if (!(*(unsigned int (**)(IOReporter_IVars *, void, int *))(*(void *)this + 96))(this, *(void *)&a2[i].nchannels, &v17))
        {
          if (a3 != 1) {
            return v6;
          }
          uint64_t updated = (*(uint64_t (**)(IOReporter_IVars *, void))(*(void *)this + 64))(this, v17);
          if (updated) {
            break;
          }
          uint64_t updated = IOReporter_IVars::updateReportChannel(this, v17, a4, a5, a6);
          if (updated) {
            break;
          }
        }
        if (++v13 >= (unint64_t)a2->nchannels) {
          return 0;
        }
      }
      return updated;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

uint64_t IOReporter_IVars::updateReportChannel(IOReporter_IVars *this, int a2, unsigned int *a3, unsigned __int8 **a4, unint64_t *a5)
{
  uint64_t v5 = 3758097090;
  if (*a4 && *((_DWORD *)this + 12) >= a2)
  {
    if (!*((unsigned char *)this + 64)) {
      IOReporter_IVars::updateReportChannel();
    }
    uint64_t v6 = *((unsigned __int16 *)this + 20) * (uint64_t)a2;
    int v7 = *((_DWORD *)this + 11);
    if ((int)v6 < v7
      && (uint64_t v8 = *((void *)this + 3), v9 = *(unsigned __int16 *)(v8 + (v6 << 6) + 20), (int)v6 + v9 <= v7))
    {
      unint64_t v12 = (unint64_t)*(unsigned __int16 *)(v8 + (v6 << 6) + 20) << 6;
      uint64_t v5 = 3758097128;
      if (v12 <= *a5)
      {
        memcpy(*a4, (const void *)(v8 + (v6 << 6)), (unint64_t)*(unsigned __int16 *)(v8 + (v6 << 6) + 20) << 6);
        uint64_t v5 = 0;
        *a4 += v12;
        *a5 -= v12;
        *a3 += v9;
      }
    }
    else
    {
      return 3758097128;
    }
  }
  return v5;
}

OSArrayPtr IOReporter_IVars::handleCreateLegend@<X0>(IOReporter_IVars *this@<X0>, IOReporter_IVars **a2@<X8>)
{
  *a2 = 0;
  OSArrayPtr result = IOReporter_IVars::copyChannelIDs(this, (OSArrayPtr *)&v8);
  uint64_t v5 = v8;
  if (v8)
  {
    IOReportChannelType v6 = (IOReportChannelType)*((void *)this + 11);
    IOReporter_IVars::legendWith((OSNumberPtr)v8, *((OSArray **)this + 7), *((OSArray **)this + 1), v6, (OSDictionary **)&v8);
    *a2 = v8;
    int v7 = *(uint64_t (**)(IOReporter_IVars *))(*(void *)v5 + 16);
    return (OSArrayPtr)v7(v5);
  }
  return result;
}

OSArrayPtr IOReporter_IVars::copyChannelIDs@<X0>(IOReporter_IVars *this@<X0>, OSArrayPtr *a2@<X8>)
{
  OSArrayPtr result = OSArray::withCapacity(*((_DWORD *)this + 12));
  if (result)
  {
    uint64_t v5 = result;
    if (*((int *)this + 12) <= 0)
    {
      *a2 = result;
    }
    else
    {
      signed int v6 = 0;
      OSNumberPtr v7 = 0;
      while (1)
      {
        OSNumberPtr v8 = OSNumber::withNumber(*(void *)(*((void *)this + 3)+ ((unint64_t)(v6 * *((unsigned __int16 *)this + 20)) << 6)+ 8), 0x40uLL);
        if (v7) {
          ((void (*)(OSNumberPtr))v7->release)(v7);
        }
        if (!v8) {
          break;
        }
        OSArray::setObject(v5, v6++, v8);
        OSNumberPtr v7 = v8;
        if (v6 >= *((_DWORD *)this + 12))
        {
          *a2 = v5;
          release = v8->release;
          uint64_t v10 = v8;
          goto LABEL_12;
        }
      }
      *a2 = 0;
      release = v5->release;
      uint64_t v10 = v5;
LABEL_12:
      return (OSArrayPtr)((uint64_t (*)(void *))release)(v10);
    }
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

OSNumberPtr IOReporter_IVars::legendWith@<X0>(OSNumberPtr this@<X0>, OSArray *a2@<X1>, OSArray *a3@<X2>, IOReportChannelType a4@<0:X3>, OSDictionary **a5@<X8>)
{
  *a5 = 0;
  if (!this) {
    return this;
  }
  OSNumberPtr v7 = (const OSArray *)this;
  uint32_t v8 = ((uint64_t (*)(OSNumberPtr))this->OSContainer::OSObject::OSMetaClassBase::__vftable[1].release)(this);
  OSArrayPtr v9 = OSArray::withCapacity(v8);
  if (!v8)
  {
LABEL_14:
    if (((unsigned int (*)(OSArrayPtr))v9->getCount)(v9) && (OSDictionaryPtr v17 = OSDictionary::withCapacity(1u)) != 0)
    {
      long long v18 = v17;
      OSNumberPtr v19 = OSNumber::withNumber(*(void *)&a4, 0x40uLL);
      if (v19) {
        OSDictionary::setObject(v18, "IOReportChannelUnit", v19);
      }
      uint64_t v20 = OSDictionary::withCapacity(1u);
      *a5 = v20;
      if (v20)
      {
        uint64_t v21 = v20;
        OSDictionary::setObject(v20, "IOReportChannels", v9);
        OSDictionary::setObject(v21, "IOReportChannelInfo", v18);
      }
      ((void (*)(OSDictionary *))v18->release)(v18);
    }
    else
    {
      OSNumberPtr v19 = 0;
    }
    goto LABEL_26;
  }
  uint32_t v10 = 0;
  while (1)
  {
    uint64_t v11 = OSArray::withCapacity(3u);
    Object = OSArray::getObject(v7, v10);
    OSArray::setObject(v11, 0, Object);
    this = OSNumber::withNumber((uint64_t)a3, 0x40uLL);
    if (!this) {
      break;
    }
    OSNumberPtr v13 = this;
    OSArray::setObject(v11, 1u, this);
    ((void (*)(OSNumberPtr))v13->release)(v13);
    if (a2)
    {
      uint64_t v14 = OSArray::getObject(a2, v10);
      int v15 = OSMetaClassBase::safeMetaCast(v14, gOSStringMetaClass);
      if (v15)
      {
        uint64_t v16 = v15;
        if (noChannelName(void)::once != -1) {
          dispatch_once(&noChannelName(void)::once, &__block_literal_global_1);
        }
        if (v16 != (const OSMetaClassBase *)noChannelName(void)::name) {
          OSArray::setObject(v11, 2u, v16);
        }
      }
    }
    OSArray::setObject(v9, v10, v11);
    if (v11) {
      ((void (*)(OSArray *))v11->release)(v11);
    }
    if (v8 == ++v10) {
      goto LABEL_14;
    }
  }
  if (v11) {
    this = (OSNumberPtr)((uint64_t (*)(OSArray *))v11->release)(v11);
  }
  if (v9)
  {
    OSNumberPtr v19 = 0;
LABEL_26:
    this = (OSNumberPtr)((uint64_t (*)(OSArrayPtr))v9->release)(v9);
    if (v19)
    {
      release = v19->release;
      return (OSNumberPtr)((uint64_t (*)(OSNumberPtr))release)(v19);
    }
  }
  return this;
}

__n128 IOReporter_IVars::setElementValues(IOReporter_IVars *this, int a2, IOReportElementValues *a3, uint64_t a4)
{
  if (!*((unsigned char *)this + 64)) {
    IOReporter_IVars::setElementValues();
  }
  if (!a4) {
    a4 = mach_absolute_time();
  }
  if (a3)
  {
    if (*((_DWORD *)this + 11) > a2)
    {
      uint64_t v8 = *((void *)this + 3) + ((uint64_t)a2 << 6);
      __n128 result = *(__n128 *)a3->v;
      long long v9 = *(_OWORD *)&a3->v[2];
      *(_OWORD *)(v8 + 32) = *(_OWORD *)a3->v;
      *(_OWORD *)(v8 + 48) = v9;
      *(void *)(*((void *)this + 3) + ((uint64_t)a2 << 6) + 24) = a4;
    }
  }
  return result;
}

unint64_t IOReporter_IVars::getElementValues(IOReporter_IVars *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 64)) {
    IOReporter_IVars::getElementValues();
  }
  if ((a2 & 0x80000000) != 0 || *((_DWORD *)this + 11) <= (signed int)a2) {
    return 0;
  }
  else {
    return *((void *)this + 3) + ((unint64_t)a2 << 6) + 32;
  }
}

uint64_t IOReporter_IVars::updateChannelValues(IOReporter_IVars *this)
{
  return 0;
}

uint64_t IOReporter_IVars::copyElementValues(IOReporter_IVars *this, int a2, IOReportElementValues *a3)
{
  uint64_t result = 3758097084;
  if (a3)
  {
    if (!*((unsigned char *)this + 64)) {
      IOReporter_IVars::copyElementValues();
    }
    if (*((_DWORD *)this + 11) <= a2)
    {
      return 3758097090;
    }
    else
    {
      uint64_t result = 0;
      uint64_t v5 = *((void *)this + 3) + ((uint64_t)a2 << 6);
      long long v6 = *(_OWORD *)(v5 + 48);
      *(_OWORD *)a3->v = *(_OWORD *)(v5 + 32);
      *(_OWORD *)&a3->v[2] = v6;
    }
  }
  return result;
}

uint64_t IOReporter_IVars::getFirstElementIndex(IOReporter_IVars *this, uint64_t a2, int *a3)
{
  uint64_t v5 = 0;
  if (!a3) {
    return 3758097084;
  }
  uint64_t result = (*(uint64_t (**)(IOReporter_IVars *, uint64_t, char *, uint64_t *))(*(void *)this + 104))(this, a2, (char *)&v5 + 4, &v5);
  if (!result) {
    *a3 = v5;
  }
  return result;
}

uint64_t IOReporter_IVars::getChannelIndex(IOReporter_IVars *this, uint64_t a2, int *a3)
{
  uint64_t v5 = 0;
  if (!a3) {
    return 3758097084;
  }
  uint64_t result = (*(uint64_t (**)(IOReporter_IVars *, uint64_t, char *, uint64_t *))(*(void *)this + 104))(this, a2, (char *)&v5 + 4, &v5);
  if (!result) {
    *a3 = HIDWORD(v5);
  }
  return result;
}

uint64_t IOReporter_IVars::getChannelIndices(IOReporter_IVars *this, uint64_t a2, int *a3, int *a4)
{
  uint64_t result = 3758097136;
  if (a3)
  {
    if (a4)
    {
      uint64_t v6 = *((unsigned int *)this + 12);
      if ((int)v6 >= 1)
      {
        uint64_t v7 = 0;
        uint64_t v8 = 0;
        uint64_t v9 = *((unsigned __int16 *)this + 20);
        uint64_t v10 = 8;
        while (1)
        {
          if (v7 >= *((int *)this + 11)) {
            return 3758097128;
          }
          if (*(void *)(*((void *)this + 3) + v10) == a2) {
            break;
          }
          ++v8;
          v7 += v9;
          v10 += v9 << 6;
          if (v6 == v8) {
            return result;
          }
        }
        uint64_t result = 0;
        *a3 = v8;
        *a4 = v7;
      }
    }
  }
  return result;
}

OSStringPtr ___ZL13noChannelNamev_block_invoke()
{
  OSStringPtr result = OSString::withCString("_NO_NAME_4");
  noChannelName(void)::name = (uint64_t)result;
  return result;
}

OSPtr<IOSimpleReporter> IOSimpleReporter::with(IOService *reportingService, IOReportCategories categories, IOReportUnit unit)
{
  kern_return_t v6;
  OSPtr<IOSimpleReporter> result;
  IOSimpleReporter *v8;
  BOOL v9;
  OSObject *pObject;

  pObject = 0;
  uint64_t v6 = OSObjectAllocate(gIOSimpleReporterMetaClass, &pObject);
  OSStringPtr result = 0;
  uint64_t v8 = (IOSimpleReporter *)pObject;
  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = pObject == 0;
  }
  if (!v9)
  {
    if (IOSimpleReporter::initWith((IOSimpleReporter *)pObject, reportingService, categories, unit))
    {
      return v8;
    }
    else
    {
      ((void (*)(IOSimpleReporter *))v8->release)(v8);
      return 0;
    }
  }
  return result;
}

BOOL IOSimpleReporter::initWith(IOSimpleReporter *this, IOService *reportingService, IOReportCategories categories, IOReportUnit unit)
{
}

IOReturn IOSimpleReporter::setValue(IOSimpleReporter *this, uint64_t channel_id, int64_t value)
{
  IOReturn v6 = -536870206;
  unsigned int v8 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  if (!(*(unsigned int (**)(IOSimpleReporter_IVars *, uint64_t, unsigned int *))(*(void *)this->ivars
                                                                                           + 88))(this->ivars, channel_id, &v8)&& !(*(unsigned int (**)(IOSimpleReporter_IVars *, void, void *))(*(void *)this->ivars + 112))(this->ivars, v8, v9))
  {
    v9[0] = value;
    IOReturn v6 = (*(uint64_t (**)(IOSimpleReporter_IVars *, void, void *, void))(*(void *)this->ivars + 72))(this->ivars, v8, v9, 0);
  }
  IOReporter_IVars::unlockReporter(this->ivars);
  return v6;
}

IOReturn IOSimpleReporter::incrementValue(IOSimpleReporter *this, uint64_t channel_id, int64_t increment)
{
  IOReturn v6 = -536870206;
  unsigned int v8 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  if (!(*(unsigned int (**)(IOSimpleReporter_IVars *, uint64_t, unsigned int *))(*(void *)this->ivars
                                                                                           + 88))(this->ivars, channel_id, &v8)&& !(*(unsigned int (**)(IOSimpleReporter_IVars *, void, void *))(*(void *)this->ivars + 112))(this->ivars, v8, v9))
  {
    v9[0] += increment;
    IOReturn v6 = (*(uint64_t (**)(IOSimpleReporter_IVars *, void, void *, void))(*(void *)this->ivars + 72))(this->ivars, v8, v9, 0);
  }
  IOReporter_IVars::unlockReporter(this->ivars);
  return v6;
}

int64_t IOSimpleReporter::getValue(IOSimpleReporter *this, uint64_t channel_id)
{
  unsigned int v7 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  if ((*(unsigned int (**)(IOSimpleReporter_IVars *, uint64_t, unsigned int *))(*(void *)this->ivars + 88))(this->ivars, channel_id, &v7)|| (uint64_t v5 = (int64_t *)(*(uint64_t (**)(IOSimpleReporter_IVars *, void))(*(void *)this->ivars + 80))(this->ivars, v7)) == 0)
  {
    int64_t v4 = 0x8000000000000000;
  }
  else
  {
    int64_t v4 = *v5;
  }
  IOReporter_IVars::unlockReporter(this->ivars);
  return v4;
}

void IOSimpleReporter_IVars::~IOSimpleReporter_IVars(IOSimpleReporter_IVars *this)
{
  IOReporter_IVars::~IOReporter_IVars(this);

  JUMPOUT(0x23ECFF2F0);
}

OSPtr<IOHistogramReporter> IOHistogramReporter::with(IOService *reportingService, IOReportCategories categories, uint64_t channelID, const char *channelName, IOReportUnit unit, int nSegments, IOHistogramSegmentConfig *config)
{
  pObject = 0;
  if (OSObjectAllocate(gIOHistogramReporterMetaClass, &pObject))
  {
    IOHistogramReporter::initWith(0, reportingService, categories, channelID, channelName, unit, nSegments, config);
    return 0;
  }
  uint64_t v14 = (IOHistogramReporter *)pObject;
  if (!IOHistogramReporter::initWith((IOHistogramReporter *)pObject, reportingService, categories, channelID, channelName, unit, nSegments, config)&& v14)
  {
    ((void (*)(IOHistogramReporter *))v14->release)(v14);
    return 0;
  }
  return v14;
}

BOOL IOHistogramReporter::initWith(IOHistogramReporter *this, IOService *reportingService, IOReportCategories categories, uint64_t channelID, const char *channelName, IOReportUnit unit, int nSegments, IOHistogramSegmentConfig *config)
{
  if (channelName) {
    OSString::withCString(channelName);
  }
  operator new();
}

void IOHistogramReporter_IVars::IOHistogramReporter_IVars(IOHistogramReporter_IVars *this, IOService *a2, IOReportChannelType a3, uint64_t a4, const OSString *a5, uint64_t a6, uint64_t a7, int a8, IOHistogramSegmentConfig *__src)
{
}

{
  uint64_t v13;
  unsigned int v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  __int16 v20;
  int v21;
  unsigned int v22;
  size_t v23;
  void *v24;
  int v25;
  unsigned int v26;
  size_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  int v32;
  unsigned int v33;
  size_t v34;
  void *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  int64x2_t v52;
  unsigned char v53[8];
  int64x2_t v54;
  unint64_t v55;

  IOReporter_IVars::IOReporter_IVars(this, a2, a3, a4);
  *(void *)OSNumberPtr v13 = &unk_26F115C60;
  *(_DWORD *)(v13 + 12OSArraySetValueInternal(this, index, 0, 0) = 0;
  *(void *)(v13 + 128) = 0;
  *(_DWORD *)(v13 + 136) = 0;
  *(void *)(v13 + 144) = 0;
  if (*(unsigned char *)(v13 + 8))
  {
    *((_DWORD *)this + 12) = 1;
    if (a5) {
      OSArray::setObject(*((OSArray **)this + 7), a5);
    }
    *((_DWORD *)this + 3OSArraySetValueInternal(this, index, 0, 0) = a8;
    if (a8)
    {
      uint64_t v14 = a8 >= 0 ? a8 : -a8;
      if ((a8 & 0x80000000) == 0)
      {
        int v15 = 16 * v14;
        uint64_t v16 = IOMallocTyped(v15, 0x69C4D122uLL);
        *((void *)this + 18) = v16;
        if (v16)
        {
          memcpy(v16, __src, v15);
          OSDictionaryPtr v17 = *((unsigned int *)this + 30);
          if ((int)v17 <= 0)
          {
            uint64_t v20 = *((_WORD *)this + 20);
            OSNumberPtr v19 = *((_DWORD *)this + 11);
LABEL_18:
            *((_WORD *)this + 6) = v20;
            if (v19 >= 0) {
              uint64_t v22 = v19;
            }
            else {
              uint64_t v22 = -v19;
            }
            if ((v19 & 0x80000000) == 0)
            {
              int v23 = (unint64_t)v22 << 6;
              mach_port_t v24 = IOMallocTyped(v23, 0x2C3E5C13uLL);
              *((void *)this + 3) = v24;
              if (v24)
              {
                bzero(v24, v23);
                long long v25 = *((_DWORD *)this + 12);
                mach_port_t v26 = v25 >= 0 ? *((_DWORD *)this + 12) : -v25;
                if ((v25 & 0x80000000) == 0)
                {
                  uint64_t v27 = 4 * v26;
                  uint64_t v28 = IOMallocTyped(v27, 0x7CAEFD5DuLL);
                  *((void *)this + 4) = v28;
                  if (v28)
                  {
                    bzero(v28, v27);
                    IOReporter_IVars::lockReporter((IOLock **)this);
                    if (*((_WORD *)this + 20))
                    {
                      int v29 = 0;
                      long long v30 = 0;
                      uint64_t v52 = vdupq_n_s64(0x8000000000000000);
                      while (!(*(unsigned int (**)(IOHistogramReporter_IVars *, unint64_t, unsigned char *))(*(void *)this + 112))(this, v30, v53))
                      {
                        long long v54 = v52;
                        long long v55 = 0x8000000000000000;
                        if ((*(unsigned int (**)(IOHistogramReporter_IVars *, unint64_t, unsigned char *, void))(*(void *)this + 72))(this, v30, v53, 0))
                        {
                          break;
                        }
                        long long v31 = (void *)(*((void *)this + 3) + v29);
                        v31[1] = a7;
                        *long long v31 = *((void *)this + 2);
                        v31[2] = *((void *)this + 1);
                        *(_WORD *)(*((void *)this + 3) + v29 + 22) = v30++;
                        v29 += 64;
                        if (v30 >= *((unsigned __int16 *)this + 20)) {
                          goto LABEL_33;
                        }
                      }
                    }
                    else
                    {
LABEL_33:
                      IOReporter_IVars::unlockReporter(this);
                      long long v32 = *((_DWORD *)this + 11);
                      if (v32 >= 0) {
                        long long v33 = *((_DWORD *)this + 11);
                      }
                      else {
                        long long v33 = -v32;
                      }
                      if ((v32 & 0x80000000) == 0)
                      {
                        long long v34 = 8 * v33;
                        long long v35 = IOMallocTyped(v34, 0x62FE8247uLL);
                        *((void *)this + 16) = v35;
                        if (v35)
                        {
                          bzero(v35, v34);
                          long long v36 = *((_DWORD *)this + 11);
                          *((_DWORD *)this + 34) = v36;
                          long long v37 = *((unsigned int *)this + 30);
                          if ((int)v37 < 1) {
                            return;
                          }
                          long long v38 = 0;
                          long long v39 = 0;
                          long long v40 = 0;
                          long long v41 = *((void *)this + 18);
                          while (1)
                          {
                            long long v42 = *(unsigned int *)(v41 + 16 * v38 + 12);
                            if ((v42 & 0x80000000) != 0) {
                              break;
                            }
                            long long v43 = *(unsigned int *)(v41 + 16 * v38);
                            if ((v43 & 0x80000000) != 0) {
                              goto LABEL_59;
                            }
                            if (v42)
                            {
                              long long v44 = 0;
                              long long v45 = v40;
                              if (v40 <= v36) {
                                long long v46 = v36;
                              }
                              else {
                                long long v46 = v40;
                              }
                              long long v47 = (v46 - v40);
                              long long v48 = -1;
                              while (v44 != v47)
                              {
                                if (*(_DWORD *)(v41 + 16 * v38 + 4))
                                {
                                  long long v49 = v48;
                                  int v50 = 1;
                                  do
                                    v50 *= v43;
                                  while (!__CFADD__(v49++, 1));
                                }
                                else
                                {
                                  int v50 = ((v44 + 1) * v43);
                                }
                                if (v39 >= v50) {
                                  break;
                                }
                                *(void *)(*((void *)this + 16) + 8 * v45++) = v50;
                                ++v44;
                                --v48;
                                long long v39 = v50;
                                if (v44 == v42)
                                {
                                  long long v40 = v45;
                                  long long v39 = v50;
                                  goto LABEL_57;
                                }
                              }
LABEL_59:
                              if (!this) {
                                return;
                              }
                              break;
                            }
LABEL_57:
                            if (++v38 == v37) {
                              return;
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
          else
          {
            long long v18 = (_DWORD *)*((void *)this + 18);
            OSNumberPtr v19 = *((_DWORD *)this + 11);
            uint64_t v20 = *((_WORD *)this + 20);
            while (1)
            {
              uint64_t v21 = v18[3];
              v19 += v21;
              v20 += v21;
              if (v18[1] > 1u || !*v18) {
                break;
              }
              v18 += 4;
              if (!--v17)
              {
                *((_DWORD *)this + 1IOExtensiblePaniclog::free(this - 1) = v19;
                *((_WORD *)this + 2OSArraySetValueInternal(this, index, 0, 0) = v20;
                goto LABEL_18;
              }
            }
            *((_DWORD *)this + 1IOExtensiblePaniclog::free(this - 1) = v19;
            *((_WORD *)this + 2OSArraySetValueInternal(this, index, 0, 0) = v20;
          }
        }
      }
    }
    *((void *)this + IOExtensiblePaniclog::free(this - 1) = 0;
  }
}

void IOHistogramReporter_IVars::~IOHistogramReporter_IVars(IOHistogramReporter_IVars *this)
{
  *(void *)this = &unk_26F115C60;
  unsigned int v2 = (void *)*((void *)this + 16);
  if (v2)
  {
    uint64_t v3 = *((unsigned int *)this + 11);
    if ((int)v3 <= 0) {
      IOHistogramReporter_IVars::~IOHistogramReporter_IVars();
    }
    if (v3 >> 28) {
      IOHistogramReporter_IVars::~IOHistogramReporter_IVars();
    }
    IOFree(v2, 8 * v3);
  }
  int64_t v4 = (void *)*((void *)this + 18);
  if (v4)
  {
    uint64_t v5 = *((unsigned int *)this + 30);
    if ((int)v5 <= 0) {
      IOHistogramReporter_IVars::~IOHistogramReporter_IVars();
    }
    if (v5 >> 27) {
      IOHistogramReporter_IVars::~IOHistogramReporter_IVars();
    }
    IOFree(v4, 16 * v5);
  }

  IOReporter_IVars::~IOReporter_IVars(this);
}

{
  uint64_t vars8;

  IOHistogramReporter_IVars::~IOHistogramReporter_IVars(this);

  JUMPOUT(0x23ECFF2F0);
}

OSArrayPtr IOHistogramReporter_IVars::handleCreateLegend@<X0>(const void **this@<X0>, const OSDictionary **a2@<X8>)
{
  OSArrayPtr result = IOReporter_IVars::handleCreateLegend((IOReporter_IVars *)this, (IOReporter_IVars **)&v12);
  uint64_t v5 = v12;
  if (!v12)
  {
    *a2 = 0;
    return result;
  }
  uint64_t v6 = *((unsigned int *)this + 30);
  if ((v6 & 0x80000000) != 0) {
    IOHistogramReporter_IVars::handleCreateLegend();
  }
  OSDataPtr v7 = OSData::withBytes(this[18], 16 * v6);
  if (!v7)
  {
    *a2 = 0;
    return (OSArrayPtr)((uint64_t (*)(const OSDictionary *))v5->release)(v5);
  }
  unsigned int v8 = v7;
  Object = OSDictionary::getObject(v5, "IOReportChannelInfo");
  uint64_t v10 = (OSDictionary *)OSMetaClassBase::safeMetaCast(Object, gOSDictionaryMetaClass);
  if (v10)
  {
    OSDictionary::setObject(v10, "IOReportChannelConfig", v8);
    uint64_t v11 = v5;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v11 = 0;
  }
  *a2 = v11;
  OSArrayPtr result = (OSArrayPtr)((uint64_t (*)(const OSMetaClassBase *))v8->release)(v8);
  if (v5) {
    return (OSArrayPtr)((uint64_t (*)(const OSDictionary *))v5->release)(v5);
  }
  return result;
}

IOReturn IOHistogramReporter::overrideBucketValues(IOHistogramReporter *this, unsigned int index, uint64_t bucket_hits, int64_t bucket_min, int64_t bucket_max, int64_t bucket_sum)
{
  uint64_t v10 = *(void *)&index;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  ivars = this->ivars;
  if (*((_DWORD *)ivars + 34) <= v10)
  {
    IOReturn v13 = -536870206;
  }
  else
  {
    v15[0] = bucket_hits;
    v15[1] = bucket_min;
    v15[2] = bucket_max;
    v15[3] = bucket_sum;
    IOReturn v13 = (*(uint64_t (**)(IOHistogramReporter_IVars *, uint64_t, void *, void))(*(void *)ivars + 72))(ivars, v10, v15, 0);
    ivars = this->ivars;
  }
  IOReporter_IVars::unlockReporter(ivars);
  return v13;
}

int IOHistogramReporter::tallyValue(IOHistogramReporter *this, int64_t value)
{
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  ivars = this->ivars;
  int v5 = *((_DWORD *)ivars + 34);
  if (v5 < 2)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = (v5 - 1);
    while (*(void *)(*((void *)ivars + 16) + 8 * v6) < value)
    {
      if (v7 == ++v6) {
        goto LABEL_8;
      }
    }
    uint64_t v7 = v6;
  }
LABEL_8:
  if ((*(unsigned int (**)(IOHistogramReporter_IVars *, uint64_t, uint64_t *))(*(void *)ivars + 112))(ivars, v7, &v11))
  {
    LODWORD(v7) = -1;
    goto LABEL_19;
  }
  uint64_t v8 = v11;
  if (v11)
  {
    if (v12 > value)
    {
      uint64_t v9 = &v12;
      goto LABEL_16;
    }
  }
  else
  {
    int64_t v12 = value;
    int64_t v13 = value;
    uint64_t v14 = 0;
  }
  if (v13 >= value) {
    goto LABEL_17;
  }
  uint64_t v9 = &v13;
LABEL_16:
  int64_t *v9 = value;
LABEL_17:
  v14 += value;
  uint64_t v11 = v8 + 1;
  if ((*(unsigned int (**)(IOHistogramReporter_IVars *, uint64_t, uint64_t *, void))(*(void *)this->ivars
                                                                                               + 72))(this->ivars, v7, &v11, 0))
  {
    LODWORD(v7) = -1;
  }
LABEL_19:
  IOReporter_IVars::unlockReporter(this->ivars);
  return v7;
}

IOReturn IOHistogramReporter::addChannel(IOHistogramReporter *this, uint64_t channelID, const char *channelName)
{
  return -536870201;
}

OSPtr<IOStateReporter> IOStateReporter::with(IOService *reportingService, IOReportCategories categories, int nstates, IOReportUnit unit)
{
  pObject = 0;
  if (OSObjectAllocate(gIOStateReporterMetaClass, &pObject)) {
    return 0;
  }
  uint64_t v8 = (IOStateReporter *)pObject;
  if (pObject && !IOStateReporter::initWith((IOStateReporter *)pObject, reportingService, categories, nstates, unit))
  {
    ((void (*)(IOStateReporter *))v8->release)(v8);
    return 0;
  }
  return v8;
}

BOOL IOStateReporter::initWith(IOStateReporter *this, IOService *reportingService, IOReportCategories categories, int nstates, IOReportUnit unit)
{
  if (nstates < 0x8000) {
    operator new();
  }
  return 0;
}

void IOStateReporter_IVars::IOStateReporter_IVars(IOStateReporter_IVars *this, IOService *a2, IOReportChannelType a3, uint64_t a4)
{
  IOReporter_IVars::IOReporter_IVars(this, a2, a3, a4);
  *(void *)uint64_t v4 = &unk_26F115D00;
  *(_OWORD *)(v4 + 12OSArraySetValueInternal(this, index, 0, 0) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
}

{
  uint64_t v4;

  IOReporter_IVars::IOReporter_IVars(this, a2, a3, a4);
  *(void *)uint64_t v4 = &unk_26F115D00;
  *(_OWORD *)(v4 + 12OSArraySetValueInternal(this, index, 0, 0) = 0u;
  *(_OWORD *)(v4 + 136) = 0u;
}

void IOStateReporter_IVars::~IOStateReporter_IVars(IOStateReporter_IVars *this)
{
  *(void *)this = &unk_26F115D00;
  unsigned int v2 = (void *)*((void *)this + 15);
  if (v2)
  {
    uint64_t v3 = *((unsigned int *)this + 12);
    if ((int)v3 <= 0) {
      IOStateReporter_IVars::~IOStateReporter_IVars();
    }
    if (v3 >> 29) {
      IOStateReporter_IVars::~IOStateReporter_IVars();
    }
    IOFree(v2, 4 * v3);
  }
  uint64_t v4 = (void *)*((void *)this + 16);
  if (v4)
  {
    uint64_t v5 = *((unsigned int *)this + 12);
    if ((int)v5 <= 0) {
      IOStateReporter_IVars::~IOStateReporter_IVars();
    }
    if (v5 >> 28) {
      IOStateReporter_IVars::~IOStateReporter_IVars();
    }
    IOFree(v4, 8 * v5);
  }

  IOReporter_IVars::~IOReporter_IVars(this);
}

{
  uint64_t vars8;

  IOStateReporter_IVars::~IOStateReporter_IVars(this);

  JUMPOUT(0x23ECFF2F0);
}

uint64_t IOStateReporter_IVars::handleSwapPrepare(IOStateReporter_IVars *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 65)) {
    IOStateReporter_IVars::handleSwapPrepare();
  }
  if (*((void *)this + 17) || *((void *)this + 18)) {
    IOStateReporter_IVars::handleSwapPrepare();
  }
  if ((int)a2 <= 0)
  {
    IOLog("%s - %s <= 0!\n", "handleSwapPrepare", "newNChannels");
    size_t v4 = 0;
    size_t v5 = 0;
    uint64_t v6 = 3758097127;
LABEL_14:
    uint64_t v9 = (void *)*((void *)this + 17);
    if (v9)
    {
      IOFree(v9, v5);
      *((void *)this + 17) = 0;
    }
    goto LABEL_16;
  }
  if (a2 >> 29)
  {
    IOLog("%s - %s > INT_MAX / sizeof(%s)!\n", "handleSwapPrepare", "newNChannels", "int");
    size_t v4 = 0;
    size_t v5 = 0;
    uint64_t v6 = 3758097128;
    goto LABEL_14;
  }
  uint64_t v6 = 3758097085;
  size_t v5 = 4 * a2;
  uint64_t v7 = IOMallocTyped(v5, 0x3E9A4EEuLL);
  *((void *)this + 17) = v7;
  if (v7)
  {
    memset(v7, 255, 4 * a2);
    if (a2 >> 28)
    {
      IOLog("%s - %s > INT_MAX / sizeof(%s)!\n", "handleSwapPrepare", "newNChannels", "uint64_t");
      size_t v4 = 0;
      uint64_t v6 = 3758097128;
    }
    else
    {
      size_t v4 = 8 * a2;
      uint64_t v8 = IOMallocTyped(v4, 0x3B2FEE0FuLL);
      *((void *)this + 18) = v8;
      if (v8)
      {
        bzero(v8, 8 * a2);
        uint64_t v6 = IOReporter_IVars::handleSwapPrepare(this, a2);
        if (!v6) {
          return v6;
        }
      }
    }
    goto LABEL_14;
  }
  size_t v4 = 0;
LABEL_16:
  uint64_t v10 = (void *)*((void *)this + 18);
  if (v10)
  {
    IOFree(v10, v4);
    *((void *)this + 18) = 0;
  }
  return v6;
}

uint64_t IOStateReporter_IVars::handleAddChannelSwap(IOStateReporter_IVars *this, uint64_t a2, const OSString *a3)
{
  uint64_t v4 = 3758097084;
  size_t v5 = (void *)*((void *)this + 17);
  if (v5)
  {
    uint64_t v6 = *((void *)this + 18);
    if (v6)
    {
      if (!*((unsigned char *)this + 65)) {
        IOStateReporter_IVars::handleAddChannelSwap();
      }
      if (!*((unsigned char *)this + 64)) {
        IOStateReporter_IVars::handleAddChannelSwap();
      }
      uint64_t v9 = (const void *)*((void *)this + 15);
      if (v9)
      {
        uint64_t v10 = *((unsigned int *)this + 12);
        if ((int)v10 <= 0) {
          goto LABEL_17;
        }
        if (v10 >> 29)
        {
          uint64_t v11 = "int";
LABEL_16:
          IOLog("%s - %s > INT_MAX / sizeof(%s)!\n", "handleAddChannelSwap", "ivar(nChannels)", v11);
          return 3758097128;
        }
        memcpy(v5, v9, 4 * v10);
        uint64_t v16 = (const void *)*((void *)this + 16);
        if (!v16) {
          IOStateReporter_IVars::handleAddChannelSwap();
        }
        uint64_t v17 = *((unsigned int *)this + 12);
        if ((int)v17 <= 0)
        {
LABEL_17:
          IOLog("%s - %s <= 0!\n", "handleAddChannelSwap", "ivar(nChannels)");
          return 3758097127;
        }
        if (v17 >> 28)
        {
          uint64_t v11 = "uint64_t";
          goto LABEL_16;
        }
        memcpy(*((void **)this + 18), v16, 8 * v17);
        uint64_t v12 = *((void *)this + 15);
        size_t v5 = (void *)*((void *)this + 17);
        uint64_t v6 = *((void *)this + 18);
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t v13 = *((void *)this + 16);
      *((void *)this + 15) = v5;
      *((void *)this + 16) = v6;
      *((void *)this + 17) = v12;
      *((void *)this + 18) = v13;
      uint64_t v14 = IOReporter_IVars::handleAddChannelSwap(this, a2, a3);
      if (v14)
      {
        uint64_t v4 = v14;
        long long v15 = *(_OWORD *)((char *)this + 120);
        *(_OWORD *)((char *)this + 12OSArraySetValueInternal(this, index, 0, 0) = *(_OWORD *)((char *)this + 136);
        *(_OWORD *)((char *)this + 136) = v15;
      }
      else
      {
        if (*((_WORD *)this + 20))
        {
          unint64_t v18 = 0;
          do
          {
            (*(void (**)(IOStateReporter_IVars *, uint64_t, unint64_t, unint64_t))(*(void *)this + 128))(this, a2, v18, v18);
            ++v18;
          }
          while (v18 < *((unsigned __int16 *)this + 20));
        }
        return 0;
      }
    }
  }
  return v4;
}

void IOStateReporter_IVars::handleSwapCleanup(IOStateReporter_IVars *this, int a2)
{
  if (!*((unsigned char *)this + 65)) {
    IOStateReporter_IVars::handleSwapCleanup();
  }
  IOReporter_IVars::handleSwapCleanup(this, a2);
  uint64_t v4 = (void *)*((void *)this + 17);
  if (v4)
  {
    if (a2 <= 0) {
      IOStateReporter_IVars::handleSwapCleanup();
    }
    if (a2 >> 29) {
      IOStateReporter_IVars::handleSwapCleanup();
    }
    IOFree(v4, 4 * a2);
    *((void *)this + 17) = 0;
  }
  size_t v5 = (void *)*((void *)this + 18);
  if (v5)
  {
    if (a2 <= 0) {
      IOStateReporter_IVars::handleSwapCleanup();
    }
    if (a2 >> 28) {
      IOStateReporter_IVars::handleSwapCleanup();
    }
    IOFree(v5, 8 * a2);
    *((void *)this + 18) = 0;
  }
}

uint64_t IOStateReporter_IVars::_getStateIndices(IOStateReporter_IVars *this, uint64_t a2, uint64_t a3, int *a4, int *a5)
{
  int v12 = 0;
  if (!*((unsigned char *)this + 64)) {
    IOStateReporter_IVars::_getStateIndices();
  }
  uint64_t v8 = 3758097090;
  if (!(*(unsigned int (**)(IOStateReporter_IVars *, uint64_t, int *, int *))(*(void *)this + 104))(this, a2, a4, &v12)&& *((_WORD *)this + 20))
  {
    int v10 = 0;
    while (1)
    {
      uint64_t v11 = (void *)(*(uint64_t (**)(IOStateReporter_IVars *, void))(*(void *)this + 80))(this, (v10 + v12));
      if (!v11) {
        return 3758097084;
      }
      if (*v11 == a3) {
        break;
      }
      if (++v10 >= *((unsigned __int16 *)this + 20)) {
        return v8;
      }
    }
    uint64_t v8 = 0;
    *a5 = v10;
  }
  return v8;
}

IOReturn IOStateReporter::setChannelState(IOStateReporter *this, uint64_t channel_id, uint64_t new_state_id)
{
  *(void *)uint64_t v8 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  if (IOStateReporter_IVars::_getStateIndices(this->ivars, channel_id, new_state_id, &v8[1], v8)) {
    IOReturn v6 = -536870206;
  }
  else {
    IOReturn v6 = (*(uint64_t (**)(IOStateReporter_IVars *, void, void, void, void))(*(void *)this->ivars
  }
                                                                                            + 120))(this->ivars, v8[1], v8[0], 0, 0);
  IOReporter_IVars::unlockReporter(this->ivars);
  return v6;
}

IOReturn IOStateReporter::overrideChannelState(IOStateReporter *this, uint64_t channel_id, uint64_t state_id, uint64_t time_in_state, uint64_t intransitions, uint64_t last_intransition)
{
  *(void *)int v12 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  if (IOStateReporter_IVars::_getStateIndices(this->ivars, channel_id, state_id, &v12[1], v12))
  {
    IOReturn v9 = -536870206;
  }
  else
  {
    ivars = this->ivars;
    if (*(void *)(*((void *)ivars + 16) + 8 * v12[1])) {
      IOStateReporter::overrideChannelState();
    }
    IOReturn v9 = (*(uint64_t (**)(IOStateReporter_IVars *))(*(void *)ivars + 136))(ivars);
  }
  IOReporter_IVars::unlockReporter(this->ivars);
  return v9;
}

uint64_t IOStateReporter_IVars::handleOverrideChannelStateByIndices(IOStateReporter_IVars *this, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 3758097090;
  if ((a2 & 0x80000000) == 0 && *((_DWORD *)this + 12) > a2)
  {
    int v8 = *((unsigned __int16 *)this + 20);
    if ((*((_DWORD *)this + 11) - a3) / v8 >= a2)
    {
      uint64_t v12 = (a3 + v8 * a2);
      uint64_t result = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, void *))(*(void *)this + 112))(this, v12, v13);
      if (!result)
      {
        void v13[2] = a4;
        v13[3] = a6;
        v13[1] = a5;
        return (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, void *, void))(*(void *)this + 72))(this, v12, v13, 0);
      }
    }
    else
    {
      return 3758097128;
    }
  }
  return result;
}

IOReturn IOStateReporter::incrementChannelState(IOStateReporter *this, uint64_t channel_id, uint64_t state_id, uint64_t time_in_state, uint64_t intransitions, uint64_t last_intransition)
{
  *(void *)uint64_t v12 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  if (IOStateReporter_IVars::_getStateIndices(this->ivars, channel_id, state_id, &v12[1], v12))
  {
    IOReturn v9 = -536870206;
  }
  else
  {
    ivars = this->ivars;
    if (*(void *)(*((void *)ivars + 16) + 8 * v12[1])) {
      IOStateReporter::incrementChannelState();
    }
    IOReturn v9 = (*(uint64_t (**)(IOStateReporter_IVars *))(*(void *)ivars + 144))(ivars);
  }
  IOReporter_IVars::unlockReporter(this->ivars);
  return v9;
}

uint64_t IOStateReporter_IVars::handleIncrementChannelStateByIndices(IOStateReporter_IVars *this, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = 3758097090;
  if ((a2 & 0x80000000) == 0 && *((_DWORD *)this + 12) > a2)
  {
    int v8 = *((unsigned __int16 *)this + 20);
    if ((*((_DWORD *)this + 11) - a3) / v8 >= a2)
    {
      uint64_t v12 = (a3 + v8 * a2);
      uint64_t result = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, uint64_t *))(*(void *)this + 112))(this, v12, &v13);
      if (!result)
      {
        v14 += a5;
        v15 += a4;
        uint64_t v16 = a6;
        return (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, uint64_t *, void))(*(void *)this + 72))(this, v12, &v13, 0);
      }
    }
    else
    {
      return 3758097128;
    }
  }
  return result;
}

IOReturn IOStateReporter::setState(IOStateReporter *this, uint64_t new_state_id)
{
  IOReturn v4 = -536870206;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  ivars = this->ivars;
  if (*((_DWORD *)ivars + 12) == 1 && *((_WORD *)ivars + 20))
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = (void *)(*(uint64_t (**)(IOStateReporter_IVars *, uint64_t))(*(void *)ivars + 80))(ivars, v6);
      if (!v7)
      {
        IOReturn v4 = -536870212;
        goto LABEL_10;
      }
      if (*v7 == new_state_id) {
        break;
      }
      uint64_t v6 = (v6 + 1);
      ivars = this->ivars;
      if (v6 >= *((unsigned __int16 *)ivars + 20)) {
        goto LABEL_10;
      }
    }
    IOReturn v4 = (*(uint64_t (**)(IOStateReporter_IVars *, void, uint64_t, void, void))(*(void *)this->ivars
                                                                                             + 120))(this->ivars, 0, v6, 0, 0);
  }
LABEL_10:
  IOReporter_IVars::unlockReporter(this->ivars);
  return v4;
}

IOReturn IOStateReporter::setStateID(IOStateReporter *this, uint64_t channel_id, int state_index, uint64_t state_id)
{
  uint64_t v5 = *(void *)&state_index;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  LODWORD(state_id) = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, uint64_t, uint64_t))(*(void *)this->ivars + 128))(this->ivars, channel_id, v5, state_id);
  IOReporter_IVars::unlockReporter(this->ivars);
  return state_id;
}

uint64_t IOStateReporter_IVars::handleSetStateID(IOStateReporter_IVars *this, uint64_t a2, int a3, uint64_t a4)
{
  int v9 = 0;
  if (!*((unsigned char *)this + 64)) {
    IOStateReporter_IVars::handleSetStateID();
  }
  uint64_t v7 = 3758097090;
  if ((*(unsigned int (**)(IOStateReporter_IVars *, uint64_t, int *))(*(void *)this + 88))(this, a2, &v9)) {
    return 3758097084;
  }
  if (*((unsigned __int16 *)this + 20) > a3)
  {
    if (*((_DWORD *)this + 11) - a3 <= v9)
    {
      return 3758097128;
    }
    else
    {
      v9 += a3;
      if (!(*(unsigned int (**)(IOStateReporter_IVars *))(*(void *)this + 112))(this))
      {
        v10[0] = a4;
        return (*(uint64_t (**)(IOStateReporter_IVars *, void, void *, void))(*(void *)this + 72))(this, v9, v10, 0);
      }
    }
  }
  return v7;
}

IOReturn IOStateReporter::setStateByIndices(IOStateReporter *this, int channel_index, int new_state_index)
{
  uint64_t v3 = *(void *)&new_state_index;
  uint64_t v4 = *(void *)&channel_index;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  LODWORD(v3) = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, uint64_t, void, void))(*(void *)this->ivars + 120))(this->ivars, v4, v3, 0, 0);
  IOReporter_IVars::unlockReporter(this->ivars);
  return v3;
}

uint64_t IOStateReporter_IVars::handleSetStateByIndices(IOStateReporter_IVars *this, unsigned int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = mach_absolute_time();
  if (!*((unsigned char *)this + 64)) {
    IOStateReporter_IVars::handleSetStateByIndices();
  }
  if ((a2 & 0x80000000) != 0 || *((_DWORD *)this + 12) <= (signed int)a2) {
    return 3758097090;
  }
  uint64_t v11 = v10;
  if (a4) {
    uint64_t v12 = a4;
  }
  else {
    uint64_t v12 = v10;
  }
  uint64_t v13 = a2;
  int v14 = *(_DWORD *)(*((void *)this + 15) + 4 * a2);
  if (v14 == a3)
  {
    uint64_t result = 3758097084;
    goto LABEL_9;
  }
  int v22 = *((unsigned __int16 *)this + 20);
  if ((*((_DWORD *)this + 11) - a3) / v22 < (int)a2) {
    return 3758097128;
  }
  uint64_t v23 = a3 + v22 * a2;
  if ((*(unsigned int (**)(IOStateReporter_IVars *, uint64_t, uint64_t *))(*(void *)this + 112))(this, v23, &v24))
  {
    return 3758097090;
  }
  ++v25;
  uint64_t v26 = v12;
  uint64_t result = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, uint64_t *, uint64_t))(*(void *)this + 72))(this, v23, &v24, v11);
  if (result) {
    return result;
  }
  *(_DWORD *)(*((void *)this + 15) + 4 * a2) = a3;
LABEL_9:
  uint64_t v16 = *((void *)this + 16);
  uint64_t v17 = *(void *)(v16 + 8 * a2);
  if (!v17)
  {
LABEL_16:
    *(void *)(v16 + 8 * v13) = v12;
    return result;
  }
  int v18 = *((unsigned __int16 *)this + 20);
  if ((*((_DWORD *)this + 11) - v14) / v18 < (int)a2) {
    return 3758097128;
  }
  uint64_t v19 = v14 + v18 * a2;
  int v20 = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, unsigned char *))(*(void *)this + 112))(this, v19, v27);
  uint64_t result = 3758097090;
  if (!v20)
  {
    uint64_t v21 = v12 - v17;
    if (a5) {
      uint64_t v21 = a5;
    }
    v28 += v21;
    uint64_t result = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, unsigned char *, uint64_t))(*(void *)this + 72))(this, v19, v27, v11);
    if (!result)
    {
      uint64_t v16 = *((void *)this + 16);
      goto LABEL_16;
    }
  }
  return result;
}

uint64_t IOStateReporter::getStateInTransitions(IOStateReporter *this, uint64_t channel_id, uint64_t state_id)
{
  return IOStateReporter_IVars::_getStateValue((IOLock **)this->ivars, channel_id, state_id, kInTransitions);
}

unint64_t IOStateReporter_IVars::_getStateValue(IOLock **this, uint64_t a2, uint64_t a3, IOStateReporter_valueSelector a4)
{
  uint64_t v14 = 0;
  IOReporter_IVars::lockReporter(this);
  if (!(*((unsigned int (**)(IOLock **, uint64_t, char *, uint64_t *))*this + 13))(this, a2, (char *)&v14 + 4, &v14)&& !(*((unsigned int (**)(IOLock **, void))*this + 8))(this, HIDWORD(v14))&& *((_WORD *)this + 20))
  {
    int v10 = 0;
    uint64_t v11 = v14;
    while (1)
    {
      uint64_t v12 = (unint64_t *)(*((uint64_t (**)(IOLock **, uint64_t))*this + 10))(this, v11);
      if (*v12 == a3) {
        break;
      }
      uint64_t v11 = (v14 + 1);
      LODWORD(v14) = v14 + 1;
      if (++v10 >= *((unsigned __int16 *)this + 20)) {
        goto LABEL_3;
      }
    }
    switch(a4)
    {
      case kLastTransitionTime:
        uint64_t v13 = v12 + 3;
        goto LABEL_16;
      case kResidencyTime:
        uint64_t v13 = v12 + 2;
        goto LABEL_16;
      case kInTransitions:
        uint64_t v13 = v12 + 1;
LABEL_16:
        unint64_t v8 = *v13;
        goto LABEL_4;
    }
  }
LABEL_3:
  unint64_t v8 = 0x8000000000000000;
LABEL_4:
  IOReporter_IVars::unlockReporter((IOReporter_IVars *)this);
  return v8;
}

uint64_t IOStateReporter::getStateResidencyTime(IOStateReporter *this, uint64_t channel_id, uint64_t state_id)
{
  return IOStateReporter_IVars::_getStateValue((IOLock **)this->ivars, channel_id, state_id, kResidencyTime);
}

uint64_t IOStateReporter::getStateLastTransitionTime(IOStateReporter *this, uint64_t channel_id, uint64_t state_id)
{
  return IOStateReporter_IVars::_getStateValue((IOLock **)this->ivars, channel_id, state_id, kLastTransitionTime);
}

uint64_t IOStateReporter::getStateLastChannelUpdateTime(IOStateReporter *this, uint64_t channel_id)
{
  int v8 = 0;
  IOReporter_IVars::lockReporter((IOLock **)this->ivars);
  int v4 = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, int *))(*(void *)this->ivars + 96))(this->ivars, channel_id, &v8);
  ivars = this->ivars;
  if (v4) {
    uint64_t v6 = 0x8000000000000000;
  }
  else {
    uint64_t v6 = *(void *)(*((void *)ivars + 16) + 8 * v8);
  }
  IOReporter_IVars::unlockReporter(ivars);
  return v6;
}

uint64_t IOStateReporter_IVars::updateChannelValues(IOStateReporter_IVars *this, unsigned int a2)
{
  if (!*((unsigned char *)this + 64)) {
    IOStateReporter_IVars::updateChannelValues();
  }
  uint64_t result = 3758097090;
  if ((a2 & 0x80000000) == 0 && *((_DWORD *)this + 12) > (signed int)a2)
  {
    uint64_t v4 = *(void *)(*((void *)this + 16) + 8 * a2);
    if (v4)
    {
      uint64_t v5 = a2;
      int v6 = *(_DWORD *)(*((void *)this + 15) + 4 * a2);
      int v7 = *((unsigned __int16 *)this + 20);
      if ((*((_DWORD *)this + 11) - v6) / v7 >= (int)a2)
      {
        uint64_t v8 = v6 + v7 * a2;
        uint64_t result = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, unsigned char *))(*(void *)this + 112))(this, v8, v10);
        if (!result)
        {
          uint64_t v9 = mach_absolute_time();
          v11 += v9 - v4;
          uint64_t result = (*(uint64_t (**)(IOStateReporter_IVars *, uint64_t, unsigned char *, uint64_t))(*(void *)this
                                                                                                  + 72))(this, v8, v10, v9);
          if (!result) {
            *(void *)(*((void *)this + 16) + 8 * v5) = v9;
          }
        }
      }
      else
      {
        return 3758097128;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

OSPtr<IOReportLegend> IOReportLegend::with(OSArray *legend)
{
  pObject = 0;
  OSObjectAllocate(gIOReportLegendMetaClass, &pObject);
  operator new();
}

OSArray *deepcopy@<X0>(OSArray **__return_ptr a1@<X8>, OSArray *a2@<X0>)
{
  int v4 = ((uint64_t (*)(OSArray *))a2->getCount)(a2);
  uint32_t v5 = ((uint64_t (*)(OSArray *))a2->getCount)(a2);
  uint64_t result = OSArray::withCapacity(v5);
  int v7 = result;
  if (v4)
  {
    uint32_t v8 = 0;
    while (1)
    {
      uint64_t result = (OSArray *)OSArray::getObject(a2, v8);
      if (!result) {
        break;
      }
      uint64_t result = (OSArray *)deepcopy((uint64_t *)&anObject, (uint64_t *)result);
      uint64_t v9 = anObject;
      if (!anObject) {
        break;
      }
      BOOL v10 = OSArray::setObject(v7, anObject);
      if (!v10) {
        *a1 = 0;
      }
      uint64_t result = (OSArray *)((uint64_t (*)(OSMetaClassBase *))v9->release)(v9);
      if (!v10) {
        goto LABEL_11;
      }
      if (v4 == ++v8) {
        goto LABEL_9;
      }
    }
    *a1 = 0;
LABEL_11:
    if (v7)
    {
      release = v7->release;
      return (OSArray *)((uint64_t (*)(OSArray *))release)(v7);
    }
  }
  else
  {
LABEL_9:
    *a1 = v7;
  }
  return result;
}

void IOReportLegend::free(IOReportLegend *this)
{
  ivars = this->ivars;
  if (ivars)
  {
    if (*(void *)ivars) {
      (*(void (**)(void))(**(void **)ivars + 16))(*(void *)ivars);
    }
    *(void *)ivars = 0;
    MEMORY[0x23ECFF2F0](ivars, 0x20C4093837F09);
  }

  OSObject::free(this);
}

void non-virtual thunk to'IOReportLegend::free(IOReportLegend *this)
{
}

OSArray *__cdecl IOReportLegend::getLegend(IOReportLegend *this)
{
  return *(OSArray **)this->ivars;
}

IOReturn IOReportLegend::addReporterLegend(IOService *reportingService, IOReporter *reporter, const char *groupName, const char *subGroupName)
{
  IOReturn v4 = -536870212;
  if (reportingService && reporter)
  {
    properties = 0;
    if (IOService::CopyProperties(reportingService, &properties, 0))
    {
      uint64_t v9 = 0;
    }
    else
    {
      if (!properties) {
        return v4;
      }
      Object = OSDictionary::getObject(properties, "IOReportLegend");
      uint64_t v11 = (OSArray *)OSMetaClassBase::safeMetaCast(Object, gOSArrayMetaClass);
      uint64_t v12 = IOReportLegend::with(v11);
      uint64_t v9 = (OSArray ***)v12;
      if (v12)
      {
        IOReturn v13 = IOReportLegend::addReporterLegend(v12, reporter, groupName, subGroupName);
        if (!v13) {
          IOReturn v13 = IOService::SetLegend(reportingService, *v9[5], 1, 0);
        }
        IOReturn v4 = v13;
      }
    }
    if (properties) {
      ((void (*)(OSDictionary *))properties->release)(properties);
    }
    if (v9) {
      ((void (*)(OSArray ***))(*v9)[2])(v9);
    }
  }
  return v4;
}

IOReturn IOReportLegend::addReporterLegend(IOReportLegend *this, IOReporter *reporter, const char *groupName, const char *subGroupName)
{
  if (!reporter) {
    return -536870212;
  }
  Legend = IOReporter::createLegend(reporter);
  if (!Legend) {
    return -536870212;
  }
  uint32_t v8 = Legend;
  IOReturn v9 = IOReportLegend::addLegendEntry(this, Legend, groupName, subGroupName);
  ((void (*)(IOReportLegendEntry *))v8->release)(v8);
  return v9;
}

IOReturn IOReportLegend::addLegendEntry(IOReportLegend *this, IOReportLegendEntry *legendEntry, const char *groupName, const char *subGroupName)
{
  IOReturn v4 = -536870206;
  if (!legendEntry) {
    return v4;
  }
  uint32_t v5 = subGroupName;
  if (!groupName)
  {
    if (subGroupName) {
      return v4;
    }
  }
  if (!groupName)
  {
    OSStringPtr v8 = 0;
    if (!subGroupName) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  OSStringPtr v8 = OSString::withCString(groupName);
  if (v5) {
LABEL_6:
  }
    uint32_t v5 = (const char *)OSString::withCString(v5);
LABEL_7:
  if (*(void *)this->ivars) {
    goto LABEL_11;
  }
  OSArrayPtr v9 = OSArray::withCapacity(1u);
  ivars = this->ivars;
  if (*(void *)ivars) {
    (*(void (**)(void))(**(void **)ivars + 16))(*(void *)ivars);
  }
  *(void *)ivars = v9;
  if (*(void *)this->ivars)
  {
LABEL_11:
    if (v8) {
      OSDictionary::setObject(legendEntry, "IOReportGroupName", v8);
    }
    if (v5) {
      OSDictionary::setObject(legendEntry, "IOReportSubGroupName", (const OSMetaClassBase *)v5);
    }
    if (OSArray::setObject(*(OSArray **)this->ivars, legendEntry)) {
      IOReturn v4 = 0;
    }
    else {
      IOReturn v4 = -536870212;
    }
    if (!v5) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  IOReturn v4 = -536870211;
  if (v5) {
LABEL_19:
  }
    (*(void (**)(const char *))(*(void *)v5 + 16))(v5);
LABEL_20:
  if (v8) {
    ((void (*)(OSStringPtr))v8->release)(v8);
  }
  return v4;
}

uint64_t *deepcopy@<X0>(uint64_t *__return_ptr a1@<X8>, uint64_t *result@<X0>)
{
  if (!result)
  {
LABEL_24:
    *a1 = 0;
    return result;
  }
  uint64_t v3 = (const OSMetaClassBase *)result;
  IOReturn v4 = (const OSNumber *)OSMetaClassBase::safeMetaCast((const OSMetaClassBase *)result, gOSNumberMetaClass);
  if (v4)
  {
    uint32_t v5 = v4;
    uint64_t v6 = OSNumber::unsigned64BitValue(v4);
    size_t v7 = OSNumber::numberOfBits(v5);
    uint64_t result = (uint64_t *)OSNumber::withNumber(v6, v7);
LABEL_6:
    *a1 = (uint64_t)result;
    return result;
  }
  OSStringPtr v8 = (const OSString *)OSMetaClassBase::safeMetaCast(v3, gOSStringMetaClass);
  if (v8)
  {
    OSArrayPtr v9 = v8;
    CStringNoCopy = OSString::getCStringNoCopy(v8);
    size_t Length = OSString::getLength(v9);
    uint64_t result = (uint64_t *)OSString::withCString(CStringNoCopy, Length);
    goto LABEL_6;
  }
  uint64_t v12 = (OSArray *)OSMetaClassBase::safeMetaCast(v3, gOSArrayMetaClass);
  if (v12)
  {
    uint64_t result = deepcopy(block, v12);
    *a1 = block[0];
    return result;
  }
  IOReturn v13 = OSMetaClassBase::safeMetaCast(v3, gOSDictionaryMetaClass);
  if (!v13)
  {
    uint64_t result = (uint64_t *)OSMetaClassBase::safeMetaCast(v3, gOSDataMetaClass);
    if (result)
    {
      uint64_t result = (uint64_t *)OSData::withData((const OSData *)result);
      goto LABEL_6;
    }
    goto LABEL_24;
  }
  uint64_t v14 = (const OSDictionary *)v13;
  OSDictionaryPtr v15 = OSDictionary::withCapacity(0);
  OSDictionaryPtr v16 = v15;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = (uint64_t)___ZL8deepcopyP12OSDictionary_block_invoke;
  block[3] = (uint64_t)&__block_descriptor_tmp_3;
  int v20 = (uint64_t *)v15;
  if (v15) {
    ((void (*)(OSDictionaryPtr))v15->retain)(v15);
  }
  BOOL v17 = OSDictionary::iterateObjects(v14, block);
  if (v17) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = (uint64_t)v16;
  }
  if (!v17) {
    OSDictionaryPtr v16 = 0;
  }
  uint64_t result = v20;
  if (v20) {
    uint64_t result = (uint64_t *)(*(uint64_t (**)(uint64_t *))(*v20 + 16))(v20);
  }
  int v20 = 0;
  if (v16) {
    uint64_t result = (uint64_t *)((uint64_t (*)(OSDictionaryPtr))v16->release)(v16);
  }
  *a1 = v18;
  return result;
}

BOOL ___ZL8deepcopyP12OSDictionary_block_invoke(uint64_t a1, OSObject *a2, OSObject *a3)
{
  deepcopy((uint64_t *)&v10, a2);
  deepcopy((uint64_t *)&v9, a3);
  if (!a2 || !a3)
  {
    BOOL v7 = 1;
    uint64_t v6 = v9;
    if (!v9) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  uint64_t v6 = v9;
  BOOL v7 = !OSDictionary::setObject(*(OSDictionary **)(a1 + 32), v10, v9);
  if (v6) {
LABEL_6:
  }
    ((void (*)(const OSMetaClassBase *))v6->release)(v6);
LABEL_7:
  if (v10) {
    ((void (*)(const OSObject *))v10->release)(v10);
  }
  return v7;
}

uint64_t __copy_helper_block_8_32c33_ZTS11OSSharedPtrI12OSDictionaryE(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = result;
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t __destroy_helper_block_8_32c33_ZTS11OSSharedPtrI12OSDictionaryE(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
  }
  *(void *)(a1 + 32) = 0;
  return result;
}

void *MD5Init(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = ccmd5_di();
  MEMORY[0x270FA5388](v2);
  IOReturn v4 = (void *)((char *)v6 - v3);
  ccdigest_init();
  return DiToMD5(v2, v4, a1);
}

void *DiToMD5(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t v6 = a2 + 1;
  unint64_t v5 = *a2;
  size_t v7 = *(void *)(a1 + 16);
  OSStringPtr v8 = (char *)a2 + *(void *)(a1 + 8) + 8;
  a3[2] = __ROR8__(*(unsigned int *)&v8[v7] + (v5 >> 3), 32);
  memcpy(a3 + 3, v8, v7);
  size_t v9 = *(void *)(a1 + 8);

  return memcpy(a3, v6, v9);
}

void *MD5Update(unsigned int *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = ccmd5_di();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  unint64_t v5 = (void *)((char *)v7 - v4);
  MD5ToDi(v3, a1, (void *)((char *)v7 - v4));
  ccdigest_update();
  return DiToMD5(v2, v5, a1);
}

void *MD5ToDi(uint64_t a1, unsigned int *a2, void *a3)
{
  unint64_t v6 = a2[5] | ((unint64_t)a2[4] << 32);
  uint64_t v8 = *(void *)(a1 + 8);
  size_t v7 = *(void *)(a1 + 16);
  *a3 = 8 * (v6 - (v6 % v7));
  size_t v9 = (char *)(a3 + 1);
  *(_DWORD *)&v9[v8 + v7] = v6 % v7;
  memcpy(&v9[v8], a2 + 6, v7);
  size_t v10 = *(void *)(a1 + 8);

  return memcpy(v9, a2, v10);
}

uint64_t MD5Final(uint64_t a1, unsigned int *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = ccmd5_di();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  size_t v7 = (char *)v9 - v6;
  MD5ToDi(v5, a2, (void *)((char *)v9 - v6));
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 56))(v4, v7, a1);
}

void *SHA1Init(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = ccsha1_di();
  MEMORY[0x270FA5388](v2);
  uint64_t v4 = (void *)((char *)v6 - v3);
  ccdigest_init();
  return DiToSHA1(v2, v4, a1);
}

void *DiToSHA1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2 + 1;
  a3[3] = *(unsigned int *)((char *)a2 + *(void *)(a1 + 8) + *(void *)(a1 + 16) + 8) + (*a2 >> 3);
  memcpy(a3 + 4, (char *)a2 + *(void *)(a1 + 8) + 8, *(void *)(a1 + 16));
  size_t v6 = *(void *)(a1 + 8);

  return memcpy(a3, v5, v6);
}

void *SHA1Update(void *a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = ccsha1_di();
  uint64_t v3 = MEMORY[0x270FA5388](v2);
  uint64_t v5 = (void *)((char *)v7 - v4);
  SHA1ToDi(v3, a1, (void *)((char *)v7 - v4));
  ccdigest_update();
  return DiToSHA1(v2, v5, a1);
}

void *SHA1ToDi(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6 = a2[3];
  uint64_t v8 = *(void *)(a1 + 8);
  size_t v7 = *(void *)(a1 + 16);
  *a3 = 8 * (v6 - (v6 % v7));
  size_t v9 = (char *)(a3 + 1);
  *(_DWORD *)&v9[v8 + v7] = v6 % v7;
  memcpy(&v9[v8], a2 + 4, v7);
  size_t v10 = *(void *)(a1 + 8);

  return memcpy(v9, a2, v10);
}

uint64_t SHA1Final(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = ccsha1_di();
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  size_t v7 = (char *)v9 - v6;
  SHA1ToDi(v5, a2, (void *)((char *)v9 - v6));
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 56))(v4, v7, a1);
}

uint64_t aes_encrypt_key()
{
  if (*(void *)ccaes_cbc_encrypt_mode() >= 0x121uLL) {
    aes_encrypt_key_cold_1();
  }

  return MEMORY[0x270ED8828]();
}

uint64_t aes_encrypt_cbc()
{
  uint64_t v0 = ccaes_cbc_encrypt_mode();
  MEMORY[0x270FA5388](v0);
  uint64_t result = cccbc_set_iv();
  if (!result) {
    return cccbc_update();
  }
  return result;
}

uint64_t aes_encrypt()
{
  return aes_encrypt_cbc();
}

uint64_t aes_decrypt_key()
{
  if (*(void *)ccaes_cbc_decrypt_mode() >= 0x121uLL) {
    aes_decrypt_key_cold_1();
  }

  return MEMORY[0x270ED8828]();
}

uint64_t aes_decrypt_cbc()
{
  uint64_t v0 = ccaes_cbc_decrypt_mode();
  MEMORY[0x270FA5388](v0);
  uint64_t result = cccbc_set_iv();
  if (!result) {
    return cccbc_update();
  }
  return result;
}

uint64_t aes_decrypt()
{
  return aes_decrypt_cbc();
}

uint64_t aes_encrypt_key128()
{
  return aes_encrypt_key();
}

uint64_t aes_decrypt_key128()
{
  return aes_decrypt_key();
}

uint64_t aes_encrypt_key256()
{
  return aes_encrypt_key();
}

uint64_t aes_decrypt_key256()
{
  return aes_decrypt_key();
}

uint64_t aes_encrypt_key_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B78]();
}

uint64_t aes_encrypt_key_with_iv_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B80]();
}

uint64_t aes_encrypt_set_iv_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B98]();
}

uint64_t aes_encrypt_reset_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return ccgcm_reset();
}

uint64_t aes_encrypt_inc_iv_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B70]();
}

uint64_t aes_encrypt_aad_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B50]();
}

uint64_t aes_encrypt_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8BA0]();
}

uint64_t aes_encrypt_finalize_gcm()
{
  if (!ccaes_gcm_encrypt_mode()) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ccgcm_finalize();
  if (!result)
  {
    return ccgcm_reset();
  }
  return result;
}

uint64_t aes_decrypt_key_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B78]();
}

uint64_t aes_decrypt_key_with_iv_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B80]();
}

uint64_t aes_decrypt_set_iv_gcm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = ccaes_gcm_decrypt_mode();
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  uint64_t result = ccgcm_reset();
  if (!result)
  {
    return MEMORY[0x270ED8B98](v7, a3, a2, a1);
  }
  return result;
}

uint64_t aes_decrypt_reset_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return ccgcm_reset();
}

uint64_t aes_decrypt_inc_iv_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B70]();
}

uint64_t aes_decrypt_aad_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8B50]();
}

uint64_t aes_decrypt_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }

  return MEMORY[0x270ED8BA0]();
}

uint64_t aes_decrypt_finalize_gcm()
{
  if (!ccaes_gcm_decrypt_mode()) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = ccgcm_finalize();
  if (!result)
  {
    return ccgcm_reset();
  }
  return result;
}

void *aes_encrypt_get_ctx_size_gcm()
{
  uint64_t result = (void *)ccaes_gcm_encrypt_mode();
  if (result) {
    return (void *)((*result + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  return result;
}

void *aes_decrypt_get_ctx_size_gcm()
{
  uint64_t result = (void *)ccaes_gcm_decrypt_mode();
  if (result) {
    return (void *)((*result + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  return result;
}

int SHA256_Init(SHA256_CTX *c)
{
  uint64_t v1 = ccsha256_di();
  if ((unint64_t)(*(void *)(v1 + 8) + *(void *)(v1 + 16) - 101) <= 0xFFFFFFFFFFFFFF8ELL) {
    SHA256_Init_cold_1();
  }

  return ccdigest_init();
}

int SHA256_Update(SHA256_CTX *c, const void *data, size_t len)
{
  ccsha256_di();

  return ccdigest_update();
}

int SHA256_Final(unsigned __int8 *md, SHA256_CTX *c)
{
  uint64_t v2 = *(uint64_t (**)(void))(ccsha256_di() + 56);

  return v2();
}

int SHA384_Init(SHA512_CTX *c)
{
  uint64_t v1 = ccsha384_di();
  if ((unint64_t)(*(void *)(v1 + 8) + *(void *)(v1 + 16) - 197) <= 0xFFFFFFFFFFFFFF2ELL) {
    SHA384_Init_cold_1();
  }

  return ccdigest_init();
}

int SHA384_Update(SHA512_CTX *c, const void *data, size_t len)
{
  ccsha384_di();

  return ccdigest_update();
}

int SHA384_Final(unsigned __int8 *md, SHA512_CTX *c)
{
  uint64_t v2 = *(uint64_t (**)(void))(ccsha384_di() + 56);

  return v2();
}

int SHA512_Init(SHA512_CTX *c)
{
  uint64_t v1 = ccsha512_di();
  if ((unint64_t)(*(void *)(v1 + 8) + *(void *)(v1 + 16) - 197) <= 0xFFFFFFFFFFFFFF2ELL) {
    SHA512_Init_cold_1();
  }

  return ccdigest_init();
}

int SHA512_Update(SHA512_CTX *c, const void *data, size_t len)
{
  ccsha512_di();

  return ccdigest_update();
}

int SHA512_Final(unsigned __int8 *md, SHA512_CTX *c)
{
  uint64_t v2 = *(uint64_t (**)(void))(ccsha512_di() + 56);

  return v2();
}

double _GLOBAL__sub_I_ObjectIntrospection_mm()
{
  gOSMetaClassBaseRemotePrivateLayout = xmmword_23D3CB0D0;
  qword_26AF00E80 = (uint64_t)"OSMetaClassBaseRemotePrivate";
  unk_26AF00E88 = xmmword_23D3CB0E0;
  memcpy(&unk_26AF00E98, off_264E98940, 0x168uLL);
  gOSMetaClassBasePrivateLayout = xmmword_23D3CB0F0;
  unk_26AF00D68 = xmmword_23D3CB100;
  unk_26AF00DD8 = xmmword_264E98B08;
  unk_26AF00DE8 = unk_264E98B18;
  unk_26AF00DF8 = xmmword_264E98B28;
  unk_26AF00E08 = unk_264E98B38;
  unk_26AF00D98 = xmmword_264E98AC8;
  unk_26AF00DA8 = *(_OWORD *)&off_264E98AD8;
  unk_26AF00DB8 = xmmword_264E98AE8;
  unk_26AF00DC8 = *(_OWORD *)&off_264E98AF8;
  *(void *)&double result = 0x23D3D2D11;
  unk_26AF00D78 = xmmword_264E98AA8;
  qword_26AF00D60 = (uint64_t)"OSMetaClassBasePrivate";
  unk_26AF00D88 = unk_264E98AB8;
  return result;
}

uint64_t IOBufferMemoryDescriptor_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOBufferMemoryDescriptorMetaClass::New(IOBufferMemoryDescriptorMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOBufferMemoryDescriptor::Dispatch(IOBufferMemoryDescriptor *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&rpca.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  rpca.message = message;
  return IOMemoryDescriptor::_Dispatch(this, &rpca);
}

kern_return_t IOBufferMemoryDescriptor::_Dispatch(IOBufferMemoryDescriptor *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return IOMemoryDescriptor::_Dispatch(self, &v5);
}

kern_return_t IOBufferMemoryDescriptorMetaClass::Dispatch(IOBufferMemoryDescriptorMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOBufferMemoryDescriptor::Create(uint64_t options, uint64_t capacity, uint64_t alignment, IOBufferMemoryDescriptor **memory)
{
  kern_return_t v5;
  IOBufferMemoryDescriptor *v6;
  BOOL v7;
  IORPC invoke;
  long long v10;
  long long v11;
  uint64_t v12;
  long long v13;
  uint64_t v14;
  OSMetaClassBase *anObject;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  uint64_t v19 = *MEMORY[0x263EF8340];
  size_t v10 = 0u;
  uint64_t v11 = 0u;
  uint64_t v12 = 0;
  DWORD1(v1OSArraySetValueInternal(this, index, 0, 0) = 96;
  IOReturn v13 = xmmword_23D3CB110;
  uint64_t v14 = 1;
  anObject = gIOBufferMemoryDescriptorMetaClass;
  *(void *)((char *)&v11 + 4) = 0x14DA2B68CLL;
  OSDictionaryPtr v16 = options;
  BOOL v17 = capacity;
  uint64_t v18 = alignment;
  invoke.message = (IORPCMessageMach *)&v10;
  invoke.reply = (IORPCMessageMach *)&v10;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000060;
  IORPC v5 = OSMetaClassBase::Invoke(gIOBufferMemoryDescriptorMetaClass, &invoke);
  if (!v5)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v10) == 72 && (void)v13 == 0xB78DE684E17D5A4BLL && DWORD2(v11) == 1 && v14 == 1)
    {
      uint64_t v6 = (IOBufferMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOBufferMemoryDescriptorMetaClass);
      *memory = v6;
      if (v6) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOBufferMemoryDescriptor::SetLength(IOBufferMemoryDescriptor *this, uint64_t length, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IOBufferMemoryDescriptor *v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  uint64_t v7 = xmmword_23D3CB120;
  uint64_t v8 = 1;
  size_t v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  size_t v10 = length;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    double result = ((uint64_t (*)(IOBufferMemoryDescriptor *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xC115230C191A6A9ALL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOBufferMemoryDescriptor::Create_Invoke(const IORPC *rpc, IOBufferMemoryDescriptor::Create_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(void, void, void, mach_port_t *))func)(*(void *)&message[2].msgh.msgh_voucher_port, *(void *)&message[2].msgh_body.msgh_descriptor_count, *(void *)&message[3].msgh.msgh_size, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB130;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IOBufferMemoryDescriptor::SetLength_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOBufferMemoryDescriptor::SetLength_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, *(void *)&message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CB140;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

uint64_t IOCommand_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOCommandMetaClass::New(IOCommandMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IOCommandPool_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOCommandPoolMetaClass::New(IOCommandPoolMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IODMACommand_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IODMACommandMetaClass::New(IODMACommandMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IODMACommand::Dispatch(IODMACommand *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&rpca.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  rpca.message = message;
  return OSObject::_Dispatch(this, &rpca);
}

kern_return_t IODMACommand::_Dispatch(IODMACommand *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSObject::_Dispatch(self, &v5);
}

kern_return_t IODMACommandMetaClass::Dispatch(IODMACommandMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IODMACommand::Create(IOService *device, uint64_t options, const IODMACommandSpecification *specification, IODMACommand **command)
{
  kern_return_t v9;
  IODMACommand *v10;
  BOOL v11;
  IORPC invoke;
  long long v14;
  long long v15;
  long long v16;
  int v17;
  unsigned char anObject[24];
  OSMetaClass *v19;
  IOService *v20;
  uint64_t v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;

  uint64_t v14 = 0u;
  OSDictionaryPtr v15 = 0u;
  OSDictionaryPtr v16 = 0u;
  *(_OWORD *)anObject = xmmword_23D3CB5D0;
  *(void *)((char *)&v15 + 4) = 0x24DA2B68CLL;
  long long v5 = *(_OWORD *)&specification->_resv[6];
  uint64_t v27 = *(_OWORD *)&specification->_resv[8];
  long long v6 = *(_OWORD *)&specification->_resv[12];
  uint64_t v28 = *(_OWORD *)&specification->_resv[10];
  int v29 = v6;
  long long v30 = *(_OWORD *)&specification->_resv[14];
  long long v7 = *(_OWORD *)&specification->options;
  uint64_t v23 = *(_OWORD *)specification->_resv;
  long long v8 = *(_OWORD *)&specification->_resv[4];
  uint64_t v24 = *(_OWORD *)&specification->_resv[2];
  uint64_t v25 = v8;
  uint64_t v26 = v5;
  DWORD1(v14) = 244;
  uint64_t v19 = gIODMACommandMetaClass;
  *(void *)&anObject[16] = 2;
  BOOL v17 = 0;
  int v20 = device;
  uint64_t v21 = options;
  int v22 = v7;
  invoke.message = (IORPCMessageMach *)&v14;
  invoke.reply = (IORPCMessageMach *)&v14;
  *(void *)&invoke.uint64_t sendSize = 0x8C000000F4;
  size_t v9 = OSMetaClassBase::Invoke(gIODMACommandMetaClass, &invoke);
  if (!v9)
  {
    size_t v9 = -536870209;
    if (DWORD1(v14) == 72
      && *((void *)&v16 + 1) == 0xF296A92BB435AF2ELL
      && DWORD2(v15) == 1
      && *(void *)&anObject[4] == 1)
    {
      size_t v10 = (IODMACommand *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&anObject[12], gIODMACommandMetaClass);
      *command = v10;
      if (v10) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = *(void *)&anObject[12] == 0;
      }
      if (v11) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v9;
}

kern_return_t IODMACommand::PrepareForDMA(IODMACommand *this, uint64_t options, IOMemoryDescriptor *memory, uint64_t offset, uint64_t length, uint64_t *flags, uint32_t *segmentsCount, IOAddressSegment *segments, OSDispatchMethod supermethod)
{
  kern_return_t result;
  uint32_t v13;
  uint32_t v14;
  IORPC v15;
  void v16[3];
  unsigned char v17[52];
  long long v18;
  uint64_t v19;
  void v20[4];
  long long v21;

  memset(v17, 0, sizeof(v17));
  uint64_t v21 = 0u;
  *(_DWORD *)&v17[4] = 124;
  uint64_t v18 = xmmword_23D3CB5E0;
  v20[0] = this;
  uint64_t v19 = 2;
  *(void *)&v17[20] = 0x24DA2B68CLL;
  v20[2] = options;
  v20[1] = memory;
  v20[3] = offset;
  *(void *)&uint64_t v21 = length;
  if (*segmentsCount > 0x20) {
    return -536870168;
  }
  DWORD2(v2IOExtensiblePaniclog::free(this - 1) = *segmentsCount;
  if (supermethod)
  {
    v16[0] = v17;
    v16[1] = v17;
    v16[2] = 0x2900000007CLL;
    double result = ((uint64_t (*)(IODMACommand *, void *))supermethod)(this, v16);
    if (result) {
      return result;
    }
  }
  else
  {
    v15.message = (IORPCMessageMach *)v17;
    v15.reply = (IORPCMessageMach *)v17;
    *(void *)&v15.uint64_t sendSize = 0x2900000007CLL;
    double result = OSMetaClassBase::Invoke(this, &v15);
    if (result) {
      return result;
    }
  }
  if (*(_DWORD *)&v17[4] != 588 || *(void *)&v17[28] != 0xF88A8C08B75B1110 || *(_DWORD *)&v17[24]) {
    return -536870209;
  }
  double result = -536870209;
  if (!*(void *)&v17[44])
  {
    if (flags) {
      *uint64_t flags = v18;
    }
    IOReturn v13 = DWORD2(v18);
    uint64_t v14 = *segmentsCount;
    if (DWORD2(v18) < *segmentsCount)
    {
      *segmentsCount = DWORD2(v18);
      uint64_t v14 = v13;
    }
    memcpy(segments, v20, 16 * v14);
    return 0;
  }
  return result;
}

kern_return_t IODMACommand::CompleteDMA(IODMACommand *this, uint64_t options, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IODMACommand *v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  long long v7 = xmmword_23D3CB5F0;
  long long v8 = 1;
  size_t v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  size_t v10 = options;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    double result = ((uint64_t (*)(IODMACommand *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xAE15E446C7041259 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODMACommand::GetPreparation(IODMACommand *this, uint64_t *offset, uint64_t *length, IOMemoryDescriptor **memory, OSDispatchMethod supermethod)
{
  kern_return_t v8;
  kern_return_t v9;
  IOMemoryDescriptor *v10;
  BOOL v11;
  IORPC v13;
  void v14[3];
  long long v15;
  long long v16;
  uint64_t v17;
  long long v18;
  uint64_t v19;
  OSMetaClassBase *anObject;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  uint64_t v23 = *MEMORY[0x263EF8340];
  OSDictionaryPtr v15 = 0u;
  OSDictionaryPtr v16 = 0u;
  BOOL v17 = 0;
  DWORD1(v15) = 72;
  uint64_t v18 = xmmword_23D3CB600;
  uint64_t v19 = 1;
  anObject = this;
  *(void *)((char *)&v16 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v14[0] = &v15;
    v14[1] = &v15;
    v14[2] = 0x9C00000048;
    long long v8 = ((uint64_t (*)(IODMACommand *, void *))supermethod)(this, v14);
  }
  else
  {
    v13.message = (IORPCMessageMach *)&v15;
    v13.reply = (IORPCMessageMach *)&v15;
    *(void *)&v13.uint64_t sendSize = 0x9C00000048;
    long long v8 = OSMetaClassBase::Invoke(this, &v13);
  }
  size_t v9 = v8;
  if (!v8)
  {
    size_t v9 = -536870209;
    if (DWORD1(v15) == 88 && (void)v18 == 0xCB1908DDF3B73CDELL && DWORD2(v16) == 1 && v19 == 1)
    {
      if (offset) {
        *offset = v21;
      }
      if (length) {
        *size_t length = v22;
      }
      size_t v10 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOMemoryDescriptorMetaClass);
      *memory = v10;
      if (v10) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = anObject == 0;
      }
      if (v11) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v9;
}

kern_return_t IODMACommand::PerformOperation(IODMACommand *this, uint64_t options, uint64_t dmaOffset, uint64_t length, uint64_t dataOffset, IOMemoryDescriptor *data, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v8;
  void v9[3];
  _DWORD v10[17];
  uint64_t v11;
  IODMACommand *v12;
  IOMemoryDescriptor *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  memset(v10, 0, 52);
  v10[1] = 124;
  *(_OWORD *)&v10[13] = xmmword_23D3CB610;
  uint64_t v12 = this;
  uint64_t v11 = 2;
  *(void *)&v10[5] = 0x24DA2B68CLL;
  uint64_t v14 = options;
  OSDictionaryPtr v15 = dmaOffset;
  OSDictionaryPtr v16 = length;
  BOOL v17 = dataOffset;
  IOReturn v13 = data;
  if (supermethod)
  {
    v9[0] = v10;
    v9[1] = v10;
    void v9[2] = 0x780000007CLL;
    double result = ((uint64_t (*)(IODMACommand *, void *))supermethod)(this, v9);
    if (result) {
      return result;
    }
  }
  else
  {
    v8.message = (IORPCMessageMach *)v10;
    v8.reply = (IORPCMessageMach *)v10;
    *(void *)&v8.uint64_t sendSize = 0x780000007CLL;
    double result = OSMetaClassBase::Invoke(this, &v8);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v10[1] == 52 && *(void *)&v10[7] == 0xC41CD97D9B3042EELL && !v10[6])
  {
    if (*(void *)&v10[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODMACommand::Create_Invoke(const IORPC *rpc, IODMACommand::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0xF4
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    if (OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass)
      || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v2 = ((uint64_t (*)(void))func)();
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB620;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IODMACommand::PrepareForDMA_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODMACommand::PrepareForDMA_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *reply;
  IORPCMessageMach *message;
  uint32_t replySize;
  uint32_t sendSize;
  mach_msg_size_t msgh_size;
  OSMetaClassBase *v11;
  mach_msg_size_t v13;

  uint64_t v3 = -536870209;
  message = rpc->message;
  reply = rpc->reply;
  uint64_t sendSize = rpc->sendSize;
  uint64_t replySize = rpc->replySize;
  uint32_t msgh_size = rpc->message[4].msgh.msgh_size;
  if (msgh_size >= 0x20) {
    uint32_t msgh_size = 32;
  }
  IOReturn v13 = msgh_size;
  if (message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && sendSize >= 0x7C
    && replySize >= 0x24C)
  {
    uint64_t v11 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOMemoryDescriptorMetaClass);
    if (v11 || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v3 = ((uint64_t (*)(OSMetaClassBase *, void, OSMetaClassBase *, void, void, mach_msg_body_t *, mach_msg_size_t *, mach_msg_id_t *))func)(target, *(void *)&message[3].msgh.msgh_remote_port, v11, *(void *)&message[3].msgh.msgh_voucher_port, *(void *)&message[3].msgh_body.msgh_descriptor_count, &reply[1].msgh_body, &v13, &reply[2].msgh.msgh_id);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CB630;
        reply->msgh.uint32_t msgh_size = 588;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
        reply[2].msgh.uint32_t msgh_size = v13;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IODMACommand::CompleteDMA_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODMACommand::CompleteDMA_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, *(void *)&message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CB640;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IODMACommand::GetPreparation_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODMACommand::GetPreparation_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x58)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_name_t *, mach_msg_body_t *, mach_port_t *))func)(target, &reply[2].msgh.msgh_voucher_port, &reply[2].msgh_body, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB650;
      reply->msgh.uint32_t msgh_size = 88;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IODMACommand::PerformOperation_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODMACommand::PerformOperation_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  uint64_t v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x7C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    long long v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOMemoryDescriptorMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v3 = ((uint64_t (*)(OSMetaClassBase *, void, void, void, void, OSMetaClassBase *))func)(target, *(void *)&message[3].msgh.msgh_remote_port, *(void *)&message[3].msgh.msgh_voucher_port, *(void *)&message[3].msgh_body.msgh_descriptor_count, *(void *)&message[4].msgh.msgh_size, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CB660;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

uint64_t IODataQueueDispatchSource_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IODataQueueDispatchSourceMetaClass::New(IODataQueueDispatchSourceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IODataQueueDispatchSource::Dispatch(IODataQueueDispatchSource *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IODataQueueDispatchSource::_Dispatch(this, &v3);
}

kern_return_t IODataQueueDispatchSource::_Dispatch(IODataQueueDispatchSource *self, const IORPC *rpc)
{
  uint64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  switch(msgid)
  {
    case 0xEF19D38D4F945FD0:
      IORPC v7 = *rpc;
      return IODispatchSource::CheckForWork_Invoke(&v7, self, (IODispatchSource::CheckForWork_Handler)IODataQueueDispatchSource::CheckForWork_Impl);
    case 0xD963BB196F70BB93:
      IORPC v8 = *rpc;
      return IODispatchSource::Cancel_Invoke(&v8, self, (IODispatchSource::Cancel_Handler)IODataQueueDispatchSource::Cancel_Impl);
    case 0xBB42C489FE4DEE8ELL:
      IORPC rpca = *rpc;
      return IODispatchSource::SetEnableWithCompletion_Invoke(&rpca, self, (IODispatchSource::SetEnableWithCompletion_Handler)IODataQueueDispatchSource::SetEnableWithCompletion_Impl);
    default:
      IORPC v6 = *rpc;
      return IODispatchSource::_Dispatch(self, &v6);
  }
}

kern_return_t IODataQueueDispatchSourceMetaClass::Dispatch(IODataQueueDispatchSourceMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IODataQueueDispatchSource::Create(uint64_t queueByteCount, IODispatchQueue *queue, IODataQueueDispatchSource **source)
{
  kern_return_t v4;
  IODataQueueDispatchSource *v5;
  BOOL v6;
  IORPC invoke;
  long long v9;
  long long v10;
  long long v11;
  int v12;
  unsigned char anObject[24];
  OSMetaClass *v14;
  IODispatchQueue *v15;
  uint64_t v16;

  size_t v9 = 0u;
  size_t v10 = 0u;
  uint64_t v11 = 0u;
  DWORD1(v9) = 100;
  *(_OWORD *)anObject = xmmword_23D3CB830;
  uint64_t v14 = gIODataQueueDispatchSourceMetaClass;
  *(void *)&anObject[16] = 2;
  *(void *)((char *)&v10 + 4) = 0x24DA2B68CLL;
  OSDictionaryPtr v16 = queueByteCount;
  uint64_t v12 = 0;
  OSDictionaryPtr v15 = queue;
  invoke.message = (IORPCMessageMach *)&v9;
  invoke.reply = (IORPCMessageMach *)&v9;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000064;
  uint64_t v4 = OSMetaClassBase::Invoke(gIODataQueueDispatchSourceMetaClass, &invoke);
  if (!v4)
  {
    uint64_t v4 = -536870209;
    if (DWORD1(v9) == 72
      && *((void *)&v11 + 1) == 0xE8544306A54D09E0
      && DWORD2(v10) == 1
      && *(void *)&anObject[4] == 1)
    {
      IORPC v5 = (IODataQueueDispatchSource *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&anObject[12], gIODataQueueDispatchSourceMetaClass);
      *source = v5;
      if (v5) {
        IORPC v6 = 1;
      }
      else {
        IORPC v6 = *(void *)&anObject[12] == 0;
      }
      if (v6) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v4;
}

kern_return_t IODataQueueDispatchSource::SetDataAvailableHandler(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IODataQueueDispatchSource *v8;
  OSAction *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CB840;
  IORPC v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  size_t v9 = action;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IODataQueueDispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xD2C1D8CC6EC3A591 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::SetDataServicedHandler(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IODataQueueDispatchSource *v8;
  OSAction *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CB850;
  IORPC v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  size_t v9 = action;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IODataQueueDispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xD0AAC29BBA67B644 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::CopyMemory(IODataQueueDispatchSource *this, IOMemoryDescriptor **memory, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  IOMemoryDescriptor *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  uint64_t v15;
  OSMetaClassBase *anObject;
  uint64_t v17;

  BOOL v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  IOReturn v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  uint64_t v14 = xmmword_23D3CB860;
  OSDictionaryPtr v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    uint64_t v4 = ((uint64_t (*)(IODataQueueDispatchSource *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x8C00000048;
    uint64_t v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 72 && (void)v14 == 0x9BE617EC7D8CD728 && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOMemoryDescriptorMetaClass);
      *memory = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IODataQueueDispatchSource::CopyDataAvailableHandler(IODataQueueDispatchSource *this, OSAction **action, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  OSAction *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  uint64_t v15;
  OSMetaClassBase *anObject;
  uint64_t v17;

  BOOL v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  IOReturn v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  uint64_t v14 = xmmword_23D3CB870;
  OSDictionaryPtr v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    uint64_t v4 = ((uint64_t (*)(IODataQueueDispatchSource *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x8C00000048;
    uint64_t v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 72 && (void)v14 == 0xC856B17471F65D99 && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (OSAction *)OSMetaClassBase::safeMetaCast(anObject, gOSActionMetaClass);
      *action = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IODataQueueDispatchSource::CopyDataServicedHandler(IODataQueueDispatchSource *this, OSAction **action, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  OSAction *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  uint64_t v15;
  OSMetaClassBase *anObject;
  uint64_t v17;

  BOOL v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  IOReturn v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  uint64_t v14 = xmmword_23D3CB880;
  OSDictionaryPtr v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    uint64_t v4 = ((uint64_t (*)(IODataQueueDispatchSource *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x8C00000048;
    uint64_t v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 72 && (void)v14 == 0xD8759C8DA406B3FCLL && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (OSAction *)OSMetaClassBase::safeMetaCast(anObject, gOSActionMetaClass);
      *action = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

void IODataQueueDispatchSource::DataAvailable(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  DWORD1(v4) = 92;
  long long v8 = xmmword_23D3CB890;
  size_t v10 = action;
  uint64_t v9 = 2;
  *(void *)((char *)&v5 + 4) = 0x24DA2B68CLL;
  int v7 = 0;
  uint64_t v11 = action;
  invoke.message = (IORPCMessageMach *)&v4;
  invoke.reply = 0;
  *(void *)&invoke.uint64_t sendSize = 92;
  OSMetaClassBase::Invoke(action, &invoke);
}

void IODataQueueDispatchSource::DataServiced(IODataQueueDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  DWORD1(v4) = 92;
  long long v8 = xmmword_23D3CB8A0;
  size_t v10 = action;
  uint64_t v9 = 2;
  *(void *)((char *)&v5 + 4) = 0x24DA2B68CLL;
  int v7 = 0;
  uint64_t v11 = action;
  invoke.message = (IORPCMessageMach *)&v4;
  invoke.reply = 0;
  *(void *)&invoke.uint64_t sendSize = 92;
  OSMetaClassBase::Invoke(action, &invoke);
}

kern_return_t IODataQueueDispatchSource::Create_Invoke(const IORPC *rpc, IODataQueueDispatchSource::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v6;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x64
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    long long v6 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIODispatchQueueMetaClass);
    if (v6 || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v2 = ((uint64_t (*)(void, OSMetaClassBase *, mach_port_t *))func)(*(void *)&message[3].msgh.msgh_remote_port, v6, &reply[2].msgh.msgh_remote_port);
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB8B0;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IODataQueueDispatchSource::SetDataAvailableHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::SetDataAvailableHandler_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    long long v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSActionMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CB8C0;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IODataQueueDispatchSource::SetDataServicedHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::SetDataServicedHandler_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    long long v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSActionMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CB8D0;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IODataQueueDispatchSource::CopyMemory_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::CopyMemory_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB8E0;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::CopyDataAvailableHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::CopyDataAvailableHandler_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB8F0;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::CopyDataServicedHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::CopyDataServicedHandler_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CB900;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IODataQueueDispatchSource::DataAvailable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataAvailable_Handler func)
{
  IORPC v4 = *rpc;
  return IODataQueueDispatchSource::DataAvailable_Invoke(&v4, target, func, 0);
}

kern_return_t IODataQueueDispatchSource::DataAvailable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataAvailable_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  const OSMetaClass *v8;
  OSMetaClassBase *v9;

  IORPC v4 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      long long v8 = targetActionClass;
    }
    else {
      long long v8 = gOSActionMetaClass;
    }
    uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v8);
    if (v9 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v9);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

kern_return_t IODataQueueDispatchSource::DataServiced_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataServiced_Handler func)
{
  IORPC v4 = *rpc;
  return IODataQueueDispatchSource::DataServiced_Invoke(&v4, target, func, 0);
}

kern_return_t IODataQueueDispatchSource::DataServiced_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODataQueueDispatchSource::DataServiced_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  const OSMetaClass *v8;
  OSMetaClassBase *v9;

  IORPC v4 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      long long v8 = targetActionClass;
    }
    else {
      long long v8 = gOSActionMetaClass;
    }
    uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v8);
    if (v9 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v9);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

const OSMetaClass *__cdecl IODataQueueDispatchSource::getMetaClass(const IODataQueueDispatchSource *this)
{
  return gIODataQueueDispatchSourceMetaClass;
}

uint64_t IODispatchQueue_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IODispatchQueueMetaClass::New(IODispatchQueueMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IODispatchQueue::Dispatch(IODispatchQueue *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&rpca.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  rpca.message = message;
  return OSObject::_Dispatch(this, &rpca);
}

kern_return_t IODispatchQueue::_Dispatch(IODispatchQueue *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSObject::_Dispatch(self, &v5);
}

kern_return_t IODispatchQueueMetaClass::Dispatch(IODispatchQueueMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IODispatchQueue::SetPort(IODispatchQueue *this, mach_port_t port, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[52];
  long long v7;
  uint64_t v8;
  IODispatchQueue *v9;

  memset(v6, 0, 48);
  *(_DWORD *)&v6[4] = 84;
  int v7 = xmmword_23D3CBAE0;
  uint64_t v9 = this;
  long long v8 = 1;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  *(_DWORD *)&v6[48] = 1310720;
  *(_DWORD *)&v6[40] = port;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000054;
    double result = ((uint64_t (*)(IODispatchQueue *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000054;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xC437E970B5609767 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)&v6[44]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODispatchQueue::Create_Call(const char *name, uint64_t options, uint64_t priority, IODispatchQueue **queue)
{
  kern_return_t v7;
  IODispatchQueue *v8;
  BOOL v9;
  IORPC invoke;
  long long v12;
  long long v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OSMetaClassBase *anObject[2];
  _OWORD v19[16];
  long long v20;
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x263EF8340];
  int v20 = 0u;
  memset(v19, 0, sizeof(v19));
  OSDictionaryPtr v16 = 0;
  IOReturn v13 = 0u;
  uint64_t v14 = 0;
  uint64_t v12 = 0u;
  DWORD1(v12) = 352;
  OSDictionaryPtr v15 = 0xAC000428DF2A91D0;
  BOOL v17 = 1;
  *(void *)((char *)&v13 + 4) = 0x14DA2B68CLL;
  anObject[0] = gIODispatchQueueMetaClass;
  anObject[1] = 0;
  strlcpy((char *)v19, name, 0x100uLL);
  *(void *)&int v20 = options;
  *((void *)&v20 + IOExtensiblePaniclog::free(this - 1) = priority;
  invoke.message = (IORPCMessageMach *)&v12;
  invoke.reply = (IORPCMessageMach *)&v12;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000160;
  int v7 = OSMetaClassBase::Invoke(gIODispatchQueueMetaClass, &invoke);
  if (!v7)
  {
    int v7 = -536870209;
    if (DWORD1(v12) == 72 && v15 == 0xAC000428DF2A91D0 && DWORD2(v13) == 1 && v17 == 1)
    {
      long long v8 = (IODispatchQueue *)OSMetaClassBase::safeMetaCast(anObject[0], gIODispatchQueueMetaClass);
      *queue = v8;
      if (v8) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = anObject[0] == 0;
      }
      if (v9) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v7;
}

kern_return_t IODispatchQueue::SetPort_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODispatchQueue::SetPort_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 1
    && rpc->sendSize >= 0x54
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, message[1].msgh.msgh_local_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CBAF0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IODispatchQueue::Create_Invoke(const IORPC *rpc, IODispatchQueue::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x160
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    if (strnlen((const char *)&message[2].msgh_body, 0x100uLL) <= 0xFF)
    {
      uint64_t v2 = ((uint64_t (*)(mach_msg_body_t *, void, void, mach_port_t *))func)(&message[2].msgh_body, *(void *)&message[12].msgh.msgh_bits, *(void *)&message[12].msgh.msgh_remote_port, &reply[2].msgh.msgh_remote_port);
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CBB00;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

const OSMetaClass *__cdecl IODispatchQueue::getMetaClass(const IODispatchQueue *this)
{
  return gIODispatchQueueMetaClass;
}

uint64_t IODispatchSource_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IODispatchSourceMetaClass::New(IODispatchSourceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IODispatchSource::Dispatch(IODispatchSource *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IODispatchSource::_Dispatch(this, &v3);
}

kern_return_t IODispatchSource::_Dispatch(IODispatchSource *self, const IORPC *rpc)
{
  if (IORPCMessageFromMach(rpc->message, 0)->msgid == 0xBBC036B4C2A26C45)
  {
    IORPC rpca = *rpc;
    return IODispatchSource::SetEnable_Invoke(&rpca, self, (IODispatchSource::SetEnable_Handler)IODispatchSource::SetEnable_Impl);
  }
  else
  {
    IORPC v5 = *rpc;
    return OSObject::_Dispatch(self, &v5);
  }
}

kern_return_t IODispatchSource::SetEnable_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODispatchSource::SetEnable_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, LOBYTE(message[2].msgh.msgh_voucher_port));
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CBCB0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IODispatchSourceMetaClass::Dispatch(IODispatchSourceMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IODispatchSource::Cancel(IODispatchSource *this, IODispatchSourceCancelHandler handler, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IODispatchSource *v9;
  IODispatchSourceCancelHandler v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  int v7 = xmmword_23D3CBCC0;
  long long v8 = 1;
  uint64_t v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  size_t v10 = handler;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    double result = ((uint64_t (*)(IODispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xD963BB196F70BB93 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODispatchSource::SetEnableWithCompletion(IODispatchSource *this, BOOL enable, IODispatchSourceCancelHandler handler, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  unsigned char v7[40];
  long long v8;
  uint64_t v9;
  IODispatchSource *v10;
  BOOL v11;
  IODispatchSourceCancelHandler v12;
  uint64_t v13;

  IOReturn v13 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  *(_DWORD *)&integer_t v7[4] = 88;
  long long v8 = xmmword_23D3CBCD0;
  uint64_t v9 = 1;
  size_t v10 = this;
  *(void *)&v7[20] = 0x14DA2B68CLL;
  uint64_t v11 = enable;
  uint64_t v12 = handler;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x7800000058;
    double result = ((uint64_t (*)(IODispatchSource *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x7800000058;
    double result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v7[4] == 52 && *(void *)&v7[28] == 0xBB42C489FE4DEE8ELL && !*(_DWORD *)&v7[24])
  {
    if (*(void *)((char *)&v8 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODispatchSource::CheckForWork(IODispatchSource *this, BOOL synchronous, OSDispatchMethod supermethod)
{
  kern_return_t v3;
  kern_return_t v4;
  IORPCMessage *v5;
  OSMetaClassBase *msgid;
  IORPC v8;
  IORPC invoke;
  void v10[3];
  unsigned char msg[40];
  long long v12;
  uint64_t v13;
  IODispatchSource *v14;
  BOOL v15;
  uint64_t v16;

  OSDictionaryPtr v16 = *MEMORY[0x263EF8340];
  memset(msg, 0, sizeof(msg));
  *(_DWORD *)&msg[4] = 80;
  uint64_t v12 = xmmword_23D3CBCE0;
  IOReturn v13 = 1;
  uint64_t v14 = this;
  *(void *)&msg[20] = 0x14DA2B68CLL;
  OSDictionaryPtr v15 = synchronous;
  if (supermethod)
  {
    v10[0] = msg;
    v10[1] = msg;
    v10[2] = 0xB800000050;
    IORPC v3 = ((uint64_t (*)(IODispatchSource *, void *))supermethod)(this, v10);
  }
  else
  {
    invoke.message = (IORPCMessageMach *)msg;
    invoke.reply = (IORPCMessageMach *)msg;
    *(void *)&invoke.uint64_t sendSize = 0xB800000050;
    IORPC v3 = OSMetaClassBase::Invoke(this, &invoke);
  }
  IORPC v4 = v3;
  if (!v3)
  {
    IORPC v4 = -536870209;
    if (*(_DWORD *)&msg[4] >= 0x34u)
    {
      if (*(_DWORD *)&msg[24])
      {
        if (*(_DWORD *)&msg[4] < 0x40u) {
          return v4;
        }
      }
      else if (*(_DWORD *)&msg[4] != 116 {
             || *(void *)&msg[28] != 0xEF19D38D4F945FD0
      }
             || *(void *)((char *)&v12 + 4))
      {
        return v4;
      }
      IORPC v5 = IORPCMessageFromMach((IORPCMessageMach *)msg, 0);
      if (*(_DWORD *)&msg[24])
      {
        if ((v5->flags & 8) != 0)
        {
          uint64_t msgid = (OSMetaClassBase *)v5[1].msgid;
          if (msgid)
          {
            v8.message = (IORPCMessageMach *)msg;
            v8.reply = 0;
            *(void *)&v8.uint64_t sendSize = 184;
            return OSMetaClassBase::Invoke(msgid, &v8);
          }
        }
      }
    }
  }
  return v4;
}

kern_return_t IODispatchSource::SetEnable(IODispatchSource *this, BOOL enable, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IODispatchSource *v9;
  BOOL v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  int v7 = xmmword_23D3CBCF0;
  long long v8 = 1;
  uint64_t v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  size_t v10 = enable;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    double result = ((uint64_t (*)(IODispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xBBC036B4C2A26C45 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IODispatchSource::Cancel_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODispatchSource::Cancel_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, *(void *)&message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CBD00;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IODispatchSource::SetEnableWithCompletion_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODispatchSource::SetEnableWithCompletion_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x58
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, void))func)(target, LOBYTE(message[2].msgh.msgh_voucher_port), *(void *)&message[2].msgh_body.msgh_descriptor_count);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CBD10;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IODispatchSource::CheckForWork_Invoke(const IORPC *rpc, OSMetaClassBase *target, IODispatchSource::CheckForWork_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  uint32_t sendSize;
  uint32_t replySize;
  IORPCMessageMach *reply;
  IORPCMessage *v9;
  void v10[2];
  uint32_t v11;
  uint32_t v12;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1 && *(void *)&message[2].msgh.msgh_bits == 1)
  {
    uint64_t sendSize = rpc->sendSize;
    if (sendSize >= 0x50)
    {
      uint64_t replySize = rpc->replySize;
      if (replySize >= 0x74)
      {
        reply = rpc->reply;
        v10[0] = rpc->message;
        v10[1] = reply;
        uint64_t v11 = sendSize;
        uint64_t v12 = replySize;
        double result = ((uint64_t (*)(OSMetaClassBase *, void *, void))func)(target, v10, LOBYTE(message[2].msgh.msgh_voucher_port));
        if (!result)
        {
          uint64_t v9 = IORPCMessageFromMach(reply, 0);
          if (reply->msgh_body.msgh_descriptor_count && (v9->flags & 8) != 0) {
            return 0;
          }
          else {
            return -536870209;
          }
        }
      }
    }
  }
  return result;
}

const OSMetaClass *__cdecl IODispatchSource::getMetaClass(const IODispatchSource *this)
{
  return gIODispatchSourceMetaClass;
}

uint64_t IOEventLink_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F1169C0;
  return 0;
}

uint64_t IOEventLinkMetaClass::New(IOEventLinkMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F116A18;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F116A60;
  return 0;
}

void IOEventLink::Dispatch(IORPC *this, IORPC *a2, IORPC *a3)
{
  IORPC v3 = *a2;
  IOEventLink::_Dispatch(this, (IOEventLink *)&v3, a3);
}

void IOEventLink::_Dispatch(IORPC *this, IOEventLink *a2, IORPC *a3)
{
  if (IORPCMessageFromMach(*(IORPCMessageMach **)a2, 0)->msgid == 0xAB7C21CF2602E225)
  {
    long long v7 = *(_OWORD *)a2;
    uint64_t v8 = *((void *)a2 + 2);
    IOEventLink::SetEventlinkPort_Invoke((IOEventLink *)&v7, this, (OSMetaClassBase *)IOEventLink::SetEventlinkPort_Impl, v5);
  }
  else
  {
    IORPC v6 = *(IORPC *)a2;
    OSObject::_Dispatch((OSObject *)this, &v6);
  }
}

double IOEventLink::SetEventlinkPort_Invoke(IOEventLink *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, unsigned int))
{
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v4 + 68) == 1
    && *((_DWORD *)this + 4) >= 0x54u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v5 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *, void))a3)(a2, *(unsigned int *)(v4 + 40)))
    {
      *(_OWORD *)(v5 + 28) = xmmword_23D3CBED0;
      *(_DWORD *)(v5 + 4) = 52;
      *(void *)&double result = 1302509197;
      *(void *)(v5 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v5 + 44) = 0;
    }
  }
  return result;
}

uint64_t IOEventLinkMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t IOEventLink::Create_Call(const OSMetaClassBase *this, OSString *a2, IOUserClient *a3, IOEventLink **a4)
{
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v12 = 0;
  long long v14 = 0u;
  DWORD1(v1OSArraySetValueInternal(this, index, 0, 0) = 116;
  *(_OWORD *)((char *)anObject + 4) = xmmword_23D3CBEE0;
  *(const OSMetaClassBase **)((char *)&anObject[3] + 4) = (const OSMetaClassBase *)gIOEventLinkMetaClass;
  *(const OSMetaClassBase **)((char *)&anObject[2] + 4) = (const OSMetaClassBase *)3;
  *(void *)((char *)&v11 + 4) = 0x34DA2B68CLL;
  uint64_t v13 = 32;
  *(const OSMetaClassBase **)((char *)&anObject[4] + 4) = this;
  LODWORD(v14) = 16777472;
  LODWORD(anObject[0]) = 0;
  *(const OSMetaClassBase **)((char *)&anObject[5] + 4) = a2;
  invoke.message = (IORPCMessageMach *)&v10;
  invoke.reply = (IORPCMessageMach *)&v10;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000074;
  uint64_t v5 = OSMetaClassBase::Invoke((OSMetaClassBase *)gIOEventLinkMetaClass, &invoke);
  if (!v5)
  {
    uint64_t v5 = 3758097087;
    if (DWORD1(v10) == 72 && v13 == 0xAAC47FEC2232263FLL && DWORD2(v11) == 1 && *((void *)&v14 + 1) == 1)
    {
      IORPC v6 = (IOUserClient_vtbl *)OSMetaClassBase::safeMetaCast(anObject[0], (const OSMetaClass *)gIOEventLinkMetaClass);
      a3->IOService::OSObject::OSMetaClassBase::__vftable = v6;
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = anObject[0] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v5;
}

uint64_t IOEventLink::SetEventlinkPort(OSMetaClassBase *this, int a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  memset(v6, 0, 48);
  *(_DWORD *)&v6[4] = 84;
  long long v7 = xmmword_23D3CBEF0;
  uint64_t v9 = this;
  uint64_t v8 = 1;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  *(_DWORD *)&v6[48] = 1245184;
  *(_DWORD *)&v6[40] = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000054;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000054;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xAB7C21CF2602E225 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)&v6[44]) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOEventLink::InvalidateKernel(OSMetaClassBase *this, IOUserClient *a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CBF00;
  uint64_t v8 = this;
  uint64_t v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  uint64_t v9 = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xE4E11BD235016FD8 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOEventLink::Create_Invoke(IOEventLink *this, IORPC *a2, int (*a3)(OSString *, IOUserClient *, IOEventLink **))
{
  uint64_t v3 = 3758097087;
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 3
    && *(void *)(v4 + 84) == 3
    && *((_DWORD *)this + 4) >= 0x74u
    && *((_DWORD *)this + 5) >= 0x48u)
  {
    uint64_t v6 = *((void *)this + 1);
    uint64_t v7 = *(const OSMetaClassBase **)(v4 + 100);
    if ((!v7 || OSMetaClassBase::safeMetaCast(v7, gOSStringMetaClass))
      && ((uint64_t v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v4 + 108), gIOUserClientMetaClass)) != 0
       || !*(void *)(v4 + 108)))
    {
      uint64_t v3 = ((uint64_t (*)(void, OSMetaClassBase *, uint64_t))a2)(*(void *)(v4 + 100), v8, v6 + 64);
      if (!v3)
      {
        *(_OWORD *)(v6 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CBF10;
        *(_DWORD *)(v6 + 4) = 72;
        *(void *)(v6 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
        *(void *)(v6 + 56) = 1;
        *(_DWORD *)(v6 + 36) &= 0xFFFFFFu;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v3;
}

uint64_t IOEventLink::InvalidateKernel_Invoke(IOEventLink *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, IOUserClient *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v5 + 68) == 2
    && *((_DWORD *)this + 4) >= 0x5Cu
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v5 + 84), gIOUserClientMetaClass);
    if (v9 || !*(void *)(v5 + 84))
    {
      uint64_t v4 = ((uint64_t (*)(IORPC *, OSMetaClassBase *))a3)(a2, v9);
      if (!v4)
      {
        *(_OWORD *)(v8 + 28) = xmmword_23D3CBF20;
        *(_DWORD *)(v8 + 4) = 52;
        *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
        *(void *)(v8 + 44) = 0;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v4;
}

uint64_t IOEventLink::getMetaClass(IOEventLink *this)
{
  return gIOEventLinkMetaClass;
}

uint64_t IOExtensiblePaniclog_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F116B70;
  return 0;
}

uint64_t IOExtensiblePaniclogMetaClass::New(IOExtensiblePaniclogMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F116BC8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F116C20;
  a2[1].OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F116C40;
  return 0;
}

uint64_t IOExtensiblePaniclog::Dispatch(OSObject *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSObject::_Dispatch(this, &rpc);
}

uint64_t IOExtensiblePaniclog::_Dispatch(OSObject *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSObject::_Dispatch(this, &v6);
}

uint64_t IOExtensiblePaniclogMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t IOExtensiblePaniclog::Create(IOExtensiblePaniclog *this, OSData *a2, OSString *a3, int a4, OSMetaClassBase **a5, IOExtensiblePaniclog **a6)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v14 = 0;
  DWORD1(v12) = 128;
  long long v19 = xmmword_23D3CC0D0;
  uint64_t v20 = 3;
  uint64_t v21 = gIOExtensiblePaniclogMetaClass;
  *(void *)((char *)&v13 + 4) = 0x34DA2B68CLL;
  uint64_t v16 = 16777472;
  uint64_t v15 = 32;
  uint64_t v17 = 40;
  anObject = (OSMetaClassBase *)16777472;
  int v22 = this;
  uint64_t v23 = a2;
  int v24 = (int)a3;
  int v25 = a4;
  invoke.message = (IORPCMessageMach *)&v12;
  invoke.reply = (IORPCMessageMach *)&v12;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000080;
  uint64_t v7 = OSMetaClassBase::Invoke((OSMetaClassBase *)gIOExtensiblePaniclogMetaClass, &invoke);
  if (!v7)
  {
    uint64_t v7 = 3758097087;
    if (DWORD1(v12) == 72 && v15 == 0xA7F6249922E20BD7 && DWORD2(v13) == 1 && v17 == 1)
    {
      uint64_t v8 = OSMetaClassBase::safeMetaCast(anObject, (const OSMetaClass *)gIOExtensiblePaniclogMetaClass);
      *a5 = v8;
      if (v8) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = anObject == 0;
      }
      if (v9) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v7;
}

uint64_t IOExtensiblePaniclog::SetActive(OSMetaClassBase *this, int (*a2)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  *(_DWORD *)&v5[4] = 72;
  long long v6 = xmmword_23D3CC0E0;
  uint64_t v7 = 1;
  uint64_t v8 = this;
  *(void *)&v5[20] = 0x14DA2B68CLL;
  if (a2)
  {
    v4[0] = v5;
    v4[1] = v5;
    void v4[2] = 0x7800000048;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a2)(this, v4);
    if (result) {
      return result;
    }
  }
  else
  {
    v3.message = (IORPCMessageMach *)v5;
    v3.reply = (IORPCMessageMach *)v5;
    *(void *)&v3.uint64_t sendSize = 0x7800000048;
    uint64_t result = OSMetaClassBase::Invoke(this, &v3);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v5[4] == 52 && *(void *)&v5[28] == 0xB058F6942CD75C58 && !*(_DWORD *)&v5[24])
  {
    if (*(void *)((char *)&v6 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOExtensiblePaniclog::SetInactive(OSMetaClassBase *this, int (*a2)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  *(_DWORD *)&v5[4] = 72;
  long long v6 = xmmword_23D3CC0F0;
  uint64_t v7 = 1;
  uint64_t v8 = this;
  *(void *)&v5[20] = 0x14DA2B68CLL;
  if (a2)
  {
    v4[0] = v5;
    v4[1] = v5;
    void v4[2] = 0x7800000048;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a2)(this, v4);
    if (result) {
      return result;
    }
  }
  else
  {
    v3.message = (IORPCMessageMach *)v5;
    v3.reply = (IORPCMessageMach *)v5;
    *(void *)&v3.uint64_t sendSize = 0x7800000048;
    uint64_t result = OSMetaClassBase::Invoke(this, &v3);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v5[4] == 52 && *(void *)&v5[28] == 0xF3F3D6994A227E5CLL && !*(_DWORD *)&v5[24])
  {
    if (*(void *)((char *)&v6 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOExtensiblePaniclog::InsertData(OSMetaClassBase *this, OSData *a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 96;
  long long v8 = xmmword_23D3CC100;
  uint64_t v9 = 2;
  long long v10 = this;
  *(void *)&long long v7 = 32;
  *((void *)&v7 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  long long v11 = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000060;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000060;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xD1F144A17E423D38 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOExtensiblePaniclog::AppendData(OSMetaClassBase *this, OSData *a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 96;
  long long v8 = xmmword_23D3CC110;
  uint64_t v9 = 2;
  long long v10 = this;
  *(void *)&long long v7 = 32;
  *((void *)&v7 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  long long v11 = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000060;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000060;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xB4E7EDBA1A448DBFLL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOExtensiblePaniclog::CopyMemoryDescriptor(OSMetaClassBase *this, IOBufferMemoryDescriptor **a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  long long v14 = xmmword_23D3CC120;
  uint64_t v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (a3)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x8C00000048;
    uint64_t v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = 3758097087;
    if (DWORD1(v11) == 72 && (void)v14 == 0xE16647D53B415A3BLL && DWORD2(v12) == 1 && v15 == 1)
    {
      long long v6 = (IOBufferMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOBufferMemoryDescriptorMetaClass);
      *a2 = v6;
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v5;
}

uint64_t IOExtensiblePaniclog::SetUsedLen(OSMetaClassBase *this, unsigned int a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  long long v7 = xmmword_23D3CC130;
  uint64_t v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  uint64_t v10 = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xFD7C6CCBBC4D6C5ELL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOExtensiblePaniclog::Create_Invoke(IOExtensiblePaniclog *this, IORPC *a2, int (*a3)(OSData *, OSString *, unsigned int, unsigned int, IOExtensiblePaniclog **))
{
  uint64_t v3 = 3758097087;
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) != 3
    || *(void *)(v4 + 88) != 3
    || *((_DWORD *)this + 4) < 0x80u
    || *((_DWORD *)this + 5) < 0x48u)
  {
    return v3;
  }
  uint64_t v6 = *((void *)this + 1);
  long long v7 = *(const OSMetaClassBase **)(v4 + 104);
  if (v7 && !OSMetaClassBase::safeMetaCast(v7, gOSDataMetaClass)) {
    return 3758097090;
  }
  uint64_t v8 = *(const OSMetaClassBase **)(v4 + 112);
  if (v8)
  {
    if (OSMetaClassBase::safeMetaCast(v8, gOSStringMetaClass))
    {
      uint64_t v9 = *(void *)(v4 + 112);
      goto LABEL_12;
    }
    return 3758097090;
  }
  uint64_t v9 = 0;
LABEL_12:
  uint64_t v3 = ((uint64_t (*)(void, uint64_t, void, void, uint64_t))a2)(*(void *)(v4 + 104), v9, *(unsigned int *)(v4 + 120), *(unsigned int *)(v4 + 124), v6 + 64);
  if (!v3)
  {
    *(_OWORD *)(v6 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CC140;
    *(_DWORD *)(v6 + 4) = 72;
    *(void *)(v6 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
    *(void *)(v6 + 56) = 1;
    *(_DWORD *)(v6 + 36) &= 0xFFFFFFu;
  }
  return v3;
}

double IOExtensiblePaniclog::SetActive_Invoke(IOExtensiblePaniclog *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *))
{
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(*(void *)this + 56) == 1
    && *((_DWORD *)this + 4) >= 0x48u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v4 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *))a3)(a2))
    {
      *(_OWORD *)(v4 + 28) = xmmword_23D3CC150;
      *(_DWORD *)(v4 + 4) = 52;
      *(void *)&double result = 1302509197;
      *(void *)(v4 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v4 + 44) = 0;
    }
  }
  return result;
}

double IOExtensiblePaniclog::SetInactive_Invoke(IOExtensiblePaniclog *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *))
{
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(*(void *)this + 56) == 1
    && *((_DWORD *)this + 4) >= 0x48u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v4 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *))a3)(a2))
    {
      *(_OWORD *)(v4 + 28) = xmmword_23D3CC160;
      *(_DWORD *)(v4 + 4) = 52;
      *(void *)&double result = 1302509197;
      *(void *)(v4 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v4 + 44) = 0;
    }
  }
  return result;
}

uint64_t IOExtensiblePaniclog::InsertData_Invoke(IOExtensiblePaniclog *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, OSData *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v5 + 72) == 2
    && *((_DWORD *)this + 4) >= 0x60u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    uint64_t v9 = *(const OSMetaClassBase **)(v5 + 88);
    if (v9)
    {
      if (!OSMetaClassBase::safeMetaCast(v9, gOSDataMetaClass)) {
        return 3758097090;
      }
      uint64_t v10 = *(void *)(v5 + 88);
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v4 = ((uint64_t (*)(IORPC *, uint64_t))a3)(a2, v10);
    if (!v4)
    {
      *(_OWORD *)(v8 + 28) = xmmword_23D3CC170;
      *(_DWORD *)(v8 + 4) = 52;
      *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v8 + 44) = 0;
    }
  }
  return v4;
}

uint64_t IOExtensiblePaniclog::AppendData_Invoke(IOExtensiblePaniclog *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, OSData *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v5 + 72) == 2
    && *((_DWORD *)this + 4) >= 0x60u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    uint64_t v9 = *(const OSMetaClassBase **)(v5 + 88);
    if (v9)
    {
      if (!OSMetaClassBase::safeMetaCast(v9, gOSDataMetaClass)) {
        return 3758097090;
      }
      uint64_t v10 = *(void *)(v5 + 88);
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v4 = ((uint64_t (*)(IORPC *, uint64_t))a3)(a2, v10);
    if (!v4)
    {
      *(_OWORD *)(v8 + 28) = xmmword_23D3CC180;
      *(_DWORD *)(v8 + 4) = 52;
      *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v8 + 44) = 0;
    }
  }
  return v4;
}

double IOExtensiblePaniclog::CopyMemoryDescriptor_Invoke(IOExtensiblePaniclog *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, IOBufferMemoryDescriptor **))
{
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(*(void *)this + 56) == 1
    && *((_DWORD *)this + 4) >= 0x48u
    && *((_DWORD *)this + 5) >= 0x48u)
  {
    uint64_t v4 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *, uint64_t))a3)(a2, v4 + 64))
    {
      *(_OWORD *)(v4 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CC190;
      *(_DWORD *)(v4 + 4) = 72;
      *(void *)&double result = 0x14DA2B68DLL;
      *(void *)(v4 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
      *(void *)(v4 + 56) = 1;
      *(_DWORD *)(v4 + 36) &= 0xFFFFFFu;
    }
  }
  return result;
}

double IOExtensiblePaniclog::SetUsedLen_Invoke(IOExtensiblePaniclog *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, unsigned int))
{
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(v4 + 56) == 1
    && *((_DWORD *)this + 4) >= 0x50u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v5 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *, void))a3)(a2, *(unsigned int *)(v4 + 72)))
    {
      *(_OWORD *)(v5 + 28) = xmmword_23D3CC1A0;
      *(_DWORD *)(v5 + 4) = 52;
      *(void *)&double result = 1302509197;
      *(void *)(v5 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v5 + 44) = 0;
    }
  }
  return result;
}

uint64_t IOInterruptDispatchSource_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOInterruptDispatchSourceMetaClass::New(IOInterruptDispatchSourceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOInterruptDispatchSource::Dispatch(IOInterruptDispatchSource *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IOInterruptDispatchSource::_Dispatch(this, &v3);
}

kern_return_t IOInterruptDispatchSource::_Dispatch(IOInterruptDispatchSource *self, const IORPC *rpc)
{
  int64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  if (msgid <= (uint64_t)0xD963BB196F70BB92)
  {
    if (msgid == 0xBB42C489FE4DEE8ELL)
    {
      IORPC v9 = *rpc;
      return IODispatchSource::SetEnableWithCompletion_Invoke(&v9, self, (IODispatchSource::SetEnableWithCompletion_Handler)IOInterruptDispatchSource::SetEnableWithCompletion_Impl);
    }
    if (msgid == 0xCE0513291CFA1EE1)
    {
      IORPC v11 = *rpc;
      return IOInterruptDispatchSource::InterruptOccurred_Invoke(&v11, self, (IOInterruptDispatchSource::InterruptOccurred_Handler)IOInterruptDispatchSource::InterruptOccurred_Impl, 0);
    }
  }
  else
  {
    switch(msgid)
    {
      case 0xD963BB196F70BB93:
        IORPC v8 = *rpc;
        return IODispatchSource::Cancel_Invoke(&v8, self, (IODispatchSource::Cancel_Handler)IOInterruptDispatchSource::Cancel_Impl);
      case 0xEF19D38D4F945FD0:
        IORPC v7 = *rpc;
        return IODispatchSource::CheckForWork_Invoke(&v7, self, (IODispatchSource::CheckForWork_Handler)IOInterruptDispatchSource::CheckForWork_Impl);
      case 0xFCC79B0928501BB1:
        IORPC rpca = *rpc;
        return IOInterruptDispatchSource::SetHandler_Invoke(&rpca, self, (IOInterruptDispatchSource::SetHandler_Handler)IOInterruptDispatchSource::SetHandler_Impl);
    }
  }
  IORPC v6 = *rpc;
  return IODispatchSource::_Dispatch(self, &v6);
}

kern_return_t IOInterruptDispatchSource::SetHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::SetHandler_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IORPC v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSActionMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CC370;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOInterruptDispatchSource::InterruptOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::InterruptOccurred_Handler func)
{
  IORPC v4 = *rpc;
  return IOInterruptDispatchSource::InterruptOccurred_Invoke(&v4, target, func, 0);
}

kern_return_t IOInterruptDispatchSourceMetaClass::Dispatch(IOInterruptDispatchSourceMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOInterruptDispatchSource::Create_Call(IOService *provider, uint32_t index, IODispatchQueue *queue, IOInterruptDispatchSource **source)
{
  kern_return_t v5;
  IOInterruptDispatchSource *v6;
  BOOL v7;
  IORPC invoke;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  OSMetaClassBase *anObject[2];
  uint64_t v15;
  OSMetaClass *v16;
  IOService *v17;
  IODispatchQueue *v18;
  uint64_t v19;
  uint64_t v20;

  uint64_t v20 = *MEMORY[0x263EF8340];
  anObject[1] = 0;
  uint64_t v10 = 0u;
  IORPC v11 = 0u;
  uint64_t v18 = queue;
  long long v12 = 0u;
  uint64_t v13 = 0u;
  DWORD1(v1OSArraySetValueInternal(this, index, 0, 0) = 120;
  anObject[0] = (OSMetaClassBase *)0xB6A948B1585FC259;
  uint64_t v15 = 3;
  uint64_t v16 = gIOInterruptDispatchSourceMetaClass;
  *(void *)((char *)&v11 + 4) = 0x34DA2B68CLL;
  LODWORD(v13) = 0;
  long long v19 = index;
  uint64_t v17 = provider;
  invoke.message = (IORPCMessageMach *)&v10;
  invoke.reply = (IORPCMessageMach *)&v10;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000078;
  IORPC v5 = OSMetaClassBase::Invoke(gIOInterruptDispatchSourceMetaClass, &invoke);
  if (!v5)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v10) == 72
      && *((void *)&v12 + 1) == 0xB6A948B1585FC259
      && DWORD2(v11) == 1
      && *((void *)&v13 + 1) == 1)
    {
      IORPC v6 = (IOInterruptDispatchSource *)OSMetaClassBase::safeMetaCast(anObject[0], gIOInterruptDispatchSourceMetaClass);
      *source = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject[0] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOInterruptDispatchSource::GetInterruptType(IOService *provider, uint32_t index, uint64_t *interruptType)
{
  kern_return_t result;
  IORPC invoke;
  unsigned char v6[52];
  long long v7;
  uint64_t v8;
  OSMetaClass *v9;
  IOService *v10;
  uint32_t v11;
  int v12;

  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 100;
  IORPC v7 = xmmword_23D3CC380;
  IORPC v9 = gIOInterruptDispatchSourceMetaClass;
  IORPC v8 = 2;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  uint64_t v10 = provider;
  IORPC v11 = index;
  long long v12 = 0;
  invoke.message = (IORPCMessageMach *)v6;
  invoke.reply = (IORPCMessageMach *)v6;
  *(void *)&invoke.uint64_t sendSize = 0x8000000064;
  double result = OSMetaClassBase::Invoke(gIOInterruptDispatchSourceMetaClass, &invoke);
  if (!result)
  {
    double result = -536870209;
    if (*(_DWORD *)&v6[4] == 60 && *(void *)&v6[28] == 0x846D2DF6B6BEF33BLL && !*(_DWORD *)&v6[24])
    {
      if (*(void *)&v6[44]) {
        double result = -536870209;
      }
      else {
        double result = 0;
      }
      if (interruptType)
      {
        if (!*(void *)&v6[44])
        {
          double result = 0;
          *interruptType = v7;
        }
      }
    }
  }
  return result;
}

kern_return_t IOInterruptDispatchSource::SetHandler(IOInterruptDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IOInterruptDispatchSource *v8;
  OSAction *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CC390;
  IORPC v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  IORPC v9 = action;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IOInterruptDispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xFCC79B0928501BB1 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOInterruptDispatchSource::GetLastInterrupt(IOInterruptDispatchSource *this, uint64_t *count, uint64_t *time, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v7;
  void v8[3];
  unsigned char v9[40];
  unsigned char v10[32];
  uint64_t v11;

  IORPC v11 = *MEMORY[0x263EF8340];
  memset(v9, 0, sizeof(v9));
  *(_DWORD *)&void v9[4] = 72;
  *(_OWORD *)uint64_t v10 = xmmword_23D3CC3A0;
  *(void *)&unsigned char v10[16] = 1;
  *(void *)&v10[24] = this;
  *(void *)&v9[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v8[0] = v9;
    v8[1] = v9;
    int v8[2] = 0x8800000048;
    double result = ((uint64_t (*)(IOInterruptDispatchSource *, void *))supermethod)(this, v8);
    if (result) {
      return result;
    }
  }
  else
  {
    v7.message = (IORPCMessageMach *)v9;
    v7.reply = (IORPCMessageMach *)v9;
    *(void *)&v7.uint64_t sendSize = 0x8800000048;
    double result = OSMetaClassBase::Invoke(this, &v7);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v9[4] == 68
    && *(void *)&v9[28] == 0x9B89E0DEA24A143BLL
    && !*(_DWORD *)&v9[24]
    && !*(void *)&v10[4])
  {
    if (count) {
      *count = *(void *)&v10[12];
    }
    double result = 0;
    if (time) {
      *time = *(void *)&v10[20];
    }
  }
  return result;
}

kern_return_t IOInterruptDispatchSource::InterruptOccurred(IOInterruptDispatchSource *this, IORPC *rpc, OSAction *action, uint64_t count, uint64_t time, OSDispatchMethod supermethod)
{
  reply = rpc->reply;
  *(_OWORD *)&reply->msgh.msgh_bits = 0u;
  *(_OWORD *)&reply->msgh.msgh_voucher_port = 0u;
  *(_OWORD *)&reply[1].msgh.uint32_t msgh_size = 0u;
  reply->msgh.uint32_t msgh_size = 108;
  *(_OWORD *)&reply[1].msgh_body.uint64_t msgh_descriptor_count = xmmword_23D3CC3B0;
  *(void *)&reply[2].msgh.mach_msg_id_t msgh_id = action;
  *(void *)&reply[2].msgh.msgh_local_port = 2;
  *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x24DA2B68CLL;
  reply[1].msgh.mach_msg_id_t msgh_id = 0;
  *(void *)&reply[3].msgh.msgh_bits = action;
  *(void *)&reply[3].msgh.mach_port_t msgh_remote_port = count;
  *(void *)&reply[3].msgh.msgh_voucher_port = time;
  return 0;
}

kern_return_t IOInterruptDispatchSource::Create_Invoke(const IORPC *rpc, IOInterruptDispatchSource::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v6;
  OSMetaClassBase *v7;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 3
    && *(void *)&message[2].msgh_body.msgh_descriptor_count == 3
    && rpc->sendSize >= 0x78
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    IORPC v6 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_local_port, gIOServiceMetaClass);
    if ((v6 || !*(void *)&message[3].msgh.msgh_local_port)
      && ((IORPC v7 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_id, gIODispatchQueueMetaClass)) != 0|| !*(void *)&message[3].msgh.msgh_id))
    {
      uint64_t v2 = ((uint64_t (*)(OSMetaClassBase *, void, OSMetaClassBase *, mach_port_t *))func)(v6, message[4].msgh.msgh_bits, v7, &reply[2].msgh.msgh_remote_port);
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CC3C0;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IOInterruptDispatchSource::GetInterruptType_Invoke(const IORPC *rpc, IOInterruptDispatchSource::GetInterruptType_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x64
    && rpc->replySize >= 0x3C)
  {
    reply = rpc->reply;
    if (OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass)
      || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v2 = ((uint64_t (*)(void))func)();
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CC3D0;
        reply->msgh.uint32_t msgh_size = 60;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IOInterruptDispatchSource::GetLastInterrupt_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::GetLastInterrupt_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x44)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *, mach_msg_size_t *))func)(target, &reply[1].msgh_body, &reply[2].msgh.msgh_size);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CC3E0;
      reply->msgh.uint32_t msgh_size = 68;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOInterruptDispatchSource::InterruptOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOInterruptDispatchSource::InterruptOccurred_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  const OSMetaClass *v8;
  OSMetaClassBase *v9;

  IORPC v4 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x6C
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      IORPC v8 = targetActionClass;
    }
    else {
      IORPC v8 = gOSActionMetaClass;
    }
    IORPC v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v8);
    if (v9 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *, void, void))func)(target, v9, *(void *)&message[3].msgh.msgh_remote_port, *(void *)&message[3].msgh.msgh_voucher_port);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

const OSMetaClass *__cdecl IOInterruptDispatchSource::getMetaClass(const IOInterruptDispatchSource *this)
{
  return gIOInterruptDispatchSourceMetaClass;
}

uint64_t IOMemoryDescriptor_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOMemoryDescriptorMetaClass::New(IOMemoryDescriptorMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOMemoryDescriptor::Dispatch(IOMemoryDescriptor *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&rpca.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  rpca.message = message;
  return OSObject::_Dispatch(this, &rpca);
}

kern_return_t IOMemoryDescriptor::_Dispatch(IOMemoryDescriptor *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSObject::_Dispatch(self, &v5);
}

kern_return_t IOMemoryDescriptorMetaClass::Dispatch(IOMemoryDescriptorMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOMemoryDescriptor::_CopyState(IOMemoryDescriptor *this, _IOMDPrivateState *state, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  unsigned char v7[40];
  unsigned char v8[32];
  uint64_t v9;

  IORPC v9 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  *(_DWORD *)&integer_t v7[4] = 72;
  *(_OWORD *)IORPC v8 = xmmword_23D3CC5C0;
  *(void *)&v8[16] = 1;
  *(void *)&v8[24] = this;
  *(void *)&v7[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x8800000048;
    double result = ((uint64_t (*)(IOMemoryDescriptor *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x8800000048;
    double result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v7[4] == 68 && *(void *)&v7[28] == 0xA2C0861D4118CE5ELL && !*(_DWORD *)&v7[24])
  {
    if (*(void *)&v8[4]) {
      double result = -536870209;
    }
    else {
      double result = 0;
    }
    if (state)
    {
      if (!*(void *)&v8[4])
      {
        double result = 0;
        *state = *(_IOMDPrivateState *)&v8[12];
      }
    }
  }
  return result;
}

kern_return_t IOMemoryDescriptor::CreateMapping(IOMemoryDescriptor *this, uint64_t options, uint64_t address, uint64_t offset, uint64_t length, uint64_t alignment, IOMemoryMap **map, OSDispatchMethod supermethod)
{
  kern_return_t v9;
  kern_return_t v10;
  IOMemoryMap *v11;
  BOOL v12;
  IORPC v14;
  void v15[3];
  long long v16;
  long long v17;
  uint64_t v18;
  long long v19;
  uint64_t v20;
  OSMetaClassBase *anObject;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0u;
  uint64_t v17 = 0u;
  uint64_t v18 = 0;
  DWORD1(v16) = 112;
  long long v19 = xmmword_23D3CC5D0;
  uint64_t v20 = 1;
  anObject = this;
  *(void *)((char *)&v17 + 4) = 0x14DA2B68CLL;
  int v22 = options;
  uint64_t v23 = address;
  int v24 = offset;
  int v25 = length;
  uint64_t v26 = alignment;
  if (supermethod)
  {
    v15[0] = &v16;
    v15[1] = &v16;
    v15[2] = 0x8C00000070;
    IORPC v9 = ((uint64_t (*)(IOMemoryDescriptor *, void *))supermethod)(this, v15);
  }
  else
  {
    v14.message = (IORPCMessageMach *)&v16;
    v14.reply = (IORPCMessageMach *)&v16;
    *(void *)&v14.uint64_t sendSize = 0x8C00000070;
    IORPC v9 = OSMetaClassBase::Invoke(this, &v14);
  }
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v10 = -536870209;
    if (DWORD1(v16) == 72 && (void)v19 == 0xC5E69B0414FF6EE5 && DWORD2(v17) == 1 && v20 == 1)
    {
      IORPC v11 = (IOMemoryMap *)OSMetaClassBase::safeMetaCast(anObject, gIOMemoryMapMetaClass);
      *map = v11;
      if (v11) {
        long long v12 = 1;
      }
      else {
        long long v12 = anObject == 0;
      }
      if (v12) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v10;
}

kern_return_t IOMemoryDescriptor::CreateSubMemoryDescriptor(uint64_t memoryDescriptorCreateOptions, uint64_t offset, uint64_t length, IOMemoryDescriptor *ofDescriptor, IOMemoryDescriptor **memory)
{
  kern_return_t v6;
  IOMemoryDescriptor *v7;
  BOOL v8;
  IORPC invoke;
  long long v11;
  long long v12;
  long long v13;
  int v14;
  unsigned char anObject[24];
  OSMetaClass *v16;
  IOMemoryDescriptor *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  IORPC v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0u;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 116;
  *(_OWORD *)anObject = xmmword_23D3CC5E0;
  uint64_t v16 = gIOMemoryDescriptorMetaClass;
  *(void *)&anObject[16] = 2;
  *(void *)((char *)&v12 + 4) = 0x24DA2B68CLL;
  uint64_t v18 = memoryDescriptorCreateOptions;
  long long v19 = offset;
  uint64_t v20 = length;
  long long v14 = 0;
  uint64_t v17 = ofDescriptor;
  invoke.message = (IORPCMessageMach *)&v11;
  invoke.reply = (IORPCMessageMach *)&v11;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000074;
  IORPC v6 = OSMetaClassBase::Invoke(gIOMemoryDescriptorMetaClass, &invoke);
  if (!v6)
  {
    IORPC v6 = -536870209;
    if (DWORD1(v11) == 72
      && *((void *)&v13 + 1) == 0xB085B5EE60AC732FLL
      && DWORD2(v12) == 1
      && *(void *)&anObject[4] == 1)
    {
      IORPC v7 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&anObject[12], gIOMemoryDescriptorMetaClass);
      *memory = v7;
      if (v7) {
        IORPC v8 = 1;
      }
      else {
        IORPC v8 = *(void *)&anObject[12] == 0;
      }
      if (v8) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v6;
}

kern_return_t IOMemoryDescriptor::CreateWithMemoryDescriptors(uint64_t memoryDescriptorCreateOptions, uint32_t withDescriptorsCount, IOMemoryDescriptor **const withDescriptors, IOMemoryDescriptor **memory)
{
  kern_return_t result;
  IOMemoryDescriptor *v11;
  BOOL v12;
  IORPC v13;
  unsigned char v14[4];
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  OSMetaClassBase *anObject;
  unint64_t v20;
  uint64_t v21;
  OSMetaClass *v22;
  void v23[33];
  uint32_t v24;

  bzero(v14, 0x2D8uLL);
  uint64_t v15 = 728;
  IORPC v8 = gIOMemoryDescriptorMetaClass;
  uint64_t v20 = 0xBA1530C996C4FEBCLL;
  uint64_t v21 = 33;
  int v22 = gIOMemoryDescriptorMetaClass;
  uint64_t v16 = 0x214DA2B68CLL;
  v23[32] = memoryDescriptorCreateOptions;
  int v24 = withDescriptorsCount;
  for (uint64_t i = 48; i != 432; i += 12)
    *(_DWORD *)&v14[i] &= 0xFFFFFFu;
  if (withDescriptorsCount > 0x20) {
    return -536870168;
  }
  memcpy(v23, withDescriptors, 8 * withDescriptorsCount);
  v13.message = (IORPCMessageMach *)v14;
  v13.reply = (IORPCMessageMach *)v14;
  *(void *)&v13.uint64_t sendSize = 0x8C000002D8;
  double result = OSMetaClassBase::Invoke(v8, &v13);
  if (!result)
  {
    if (v15 == 72 && v17 == 0xBA1530C996C4FEBCLL && HIDWORD(v16) == 1)
    {
      double result = -536870209;
      if (v18 == 1)
      {
        IORPC v11 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOMemoryDescriptorMetaClass);
        *memory = v11;
        if (v11) {
          long long v12 = 1;
        }
        else {
          long long v12 = anObject == 0;
        }
        if (v12) {
          return 0;
        }
        else {
          return -536870206;
        }
      }
    }
    else
    {
      return -536870209;
    }
  }
  return result;
}

kern_return_t IOMemoryDescriptor::_CopyState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOMemoryDescriptor::_CopyState_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x44)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *))func)(target, &reply[1].msgh_body);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CC5F0;
      reply->msgh.uint32_t msgh_size = 68;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOMemoryDescriptor::CreateMapping_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOMemoryDescriptor::CreateMapping_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x70
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, void, void, void, void, mach_port_t *))func)(target, *(void *)&message[2].msgh.msgh_voucher_port, *(void *)&message[2].msgh_body.msgh_descriptor_count, *(void *)&message[3].msgh.msgh_size, *(void *)&message[3].msgh.msgh_local_port, *(void *)&message[3].msgh.msgh_id, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CC600;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IOMemoryDescriptor::CreateSubMemoryDescriptor_Invoke(const IORPC *rpc, IOMemoryDescriptor::CreateSubMemoryDescriptor_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v6;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x74
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    IORPC v6 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOMemoryDescriptorMetaClass);
    if (v6 || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v2 = ((uint64_t (*)(void, void, void, OSMetaClassBase *, mach_port_t *))func)(*(void *)&message[3].msgh.msgh_remote_port, *(void *)&message[3].msgh.msgh_voucher_port, *(void *)&message[3].msgh_body.msgh_descriptor_count, v6, &reply[2].msgh.msgh_remote_port);
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CC610;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IOMemoryDescriptor::CreateWithMemoryDescriptors_Invoke(const IORPC *rpc, IOMemoryDescriptor::CreateWithMemoryDescriptors_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  unsigned int msgh_id;
  uint64_t v5;
  IORPCMessageMach *reply;
  uint64_t v8;
  const OSMetaClassBase **p_msgh_remote_port;

  uint64_t v2 = -536870209;
  message = rpc->message;
  mach_msg_id_t msgh_id = rpc->message[25].msgh.msgh_id;
  if (msgh_id >= 0x20) {
    IORPC v5 = 32;
  }
  else {
    IORPC v5 = msgh_id;
  }
  if (message->msgh_body.msgh_descriptor_count == 33
    && *(void *)&message[15].msgh.msgh_id == 33
    && rpc->sendSize >= 0x2D8
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    if (v5)
    {
      IORPC v8 = v5;
      p_mach_port_t msgh_remote_port = (const OSMetaClassBase **)&message[16].msgh.msgh_remote_port;
      while (!*p_msgh_remote_port || OSMetaClassBase::safeMetaCast(*p_msgh_remote_port, gIOMemoryDescriptorMetaClass))
      {
        ++p_msgh_remote_port;
        if (!--v8) {
          goto LABEL_13;
        }
      }
      return -536870206;
    }
    else
    {
LABEL_13:
      uint64_t v2 = ((uint64_t (*)(void, uint64_t, mach_port_t *, mach_port_t *))func)(*(void *)&message[25].msgh.msgh_local_port, v5, &message[16].msgh.msgh_remote_port, &reply[2].msgh.msgh_remote_port);
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CC620;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
  }
  return v2;
}

uint64_t IOMemoryMap_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOMemoryMapMetaClass::New(IOMemoryMapMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOMemoryMap::Dispatch(IOMemoryMap *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&rpca.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  rpca.message = message;
  return OSObject::_Dispatch(this, &rpca);
}

kern_return_t IOMemoryMap::_Dispatch(IOMemoryMap *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSObject::_Dispatch(self, &v5);
}

kern_return_t IOMemoryMapMetaClass::Dispatch(IOMemoryMapMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOMemoryMap::_CopyState(IOMemoryMap *this, _IOMemoryMapPrivateState *state, OSDispatchMethod supermethod)
{
  kern_return_t result;
  long long v5;
  IORPC v6;
  void v7[3];
  unsigned char v8[40];
  unsigned char v9[44];
  uint64_t v10;

  uint64_t v10 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  *(_DWORD *)&v8[4] = 72;
  *(_OWORD *)IORPC v9 = xmmword_23D3CC7E0;
  *(void *)&v9[16] = 1;
  *(void *)&v9[24] = this;
  *(void *)&v8[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v7[0] = v8;
    v7[1] = v8;
    void v7[2] = 0x9800000048;
    double result = ((uint64_t (*)(IOMemoryMap *, void *))supermethod)(this, v7);
    if (result) {
      return result;
    }
  }
  else
  {
    v6.message = (IORPCMessageMach *)v8;
    v6.reply = (IORPCMessageMach *)v8;
    *(void *)&v6.uint64_t sendSize = 0x9800000048;
    double result = OSMetaClassBase::Invoke(this, &v6);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v8[4] == 84 && *(void *)&v8[28] == 0xFC92B3D7F2D48EC7 && !*(_DWORD *)&v8[24])
  {
    if (*(void *)&v9[4]) {
      double result = -536870209;
    }
    else {
      double result = 0;
    }
    if (state)
    {
      if (!*(void *)&v9[4])
      {
        double result = 0;
        IORPC v5 = *(_OWORD *)&v9[28];
        *(_OWORD *)&state->size_t length = *(_OWORD *)&v9[12];
        *(_OWORD *)&state->uint64_t options = v5;
      }
    }
  }
  return result;
}

kern_return_t IOMemoryMap::_CopyState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOMemoryMap::_CopyState_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x54)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *))func)(target, &reply[1].msgh_body);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CC7F0;
      reply->msgh.uint32_t msgh_size = 84;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

uint64_t IOReporter_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOReporterMetaClass::New(IOReporterMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IOSimpleReporter_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOSimpleReporterMetaClass::New(IOSimpleReporterMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IOStateReporter_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOStateReporterMetaClass::New(IOStateReporterMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IOHistogramReporter_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOHistogramReporterMetaClass::New(IOHistogramReporterMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IOReportLegend_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOReportLegendMetaClass::New(IOReportLegendMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t IOService_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOServiceMetaClass::New(IOServiceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOService::Dispatch(IOService *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IOService::_Dispatch(this, &v3);
}

kern_return_t IOService::_Dispatch(IOService *self, const IORPC *rpc)
{
  int64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  if (msgid > (uint64_t)0xAB6F76DDE6D693F1)
  {
    if (msgid <= (uint64_t)0xD200FDE7D57ECCA5)
    {
      if (msgid == 0xAB6F76DDE6D693F2)
      {
        IORPC v16 = *rpc;
        return IOService::Start_Invoke(&v16, self, (IOService::Start_Handler)IOService::Start_Impl);
      }
      if (msgid == 0xAD8461D6BB5E656DLL)
      {
        IORPC v9 = *rpc;
        return IOService::UserSetProperties_Invoke(&v9, self, (IOService::UserSetProperties_Handler)IOService::UserSetProperties_Impl);
      }
    }
    else
    {
      switch(msgid)
      {
        case 0xD200FDE7D57ECCA6:
          IORPC v11 = *rpc;
          return IOService::SetPowerState_Invoke(&v11, self, (IOService::SetPowerState_Handler)IOService::SetPowerState_Impl);
        case 0xE1A46DBD68BBE09CLL:
          IORPC v10 = *rpc;
          return IOService::Create_Invoke(&v10, self, (IOService::Create_Handler)IOService::Create_Impl);
        case 0xE608AE8273DAE1BCLL:
          IORPC v13 = *rpc;
          return OSObject::SetDispatchQueue_Invoke(&v13, self, (OSObject::SetDispatchQueue_Handler)IOService::SetDispatchQueue_Impl);
      }
    }
  }
  else if (msgid <= (uint64_t)0x8A6F522F3894A0D6)
  {
    if (msgid == 0x805BB452F0B44EF7)
    {
      IORPC v12 = *rpc;
      return IOService::CreateDefaultDispatchQueue_Invoke(&v12, self, (IOService::CreateDefaultDispatchQueue_Handler)IOService::CreateDefaultDispatchQueue_Impl);
    }
    if (msgid == 0x80B22DD60EE3ABB6)
    {
      IORPC v7 = *rpc;
      return IOService::_NewUserClient_Invoke(&v7, self, (IOService::_NewUserClient_Handler)IOService::_NewUserClient_Impl);
    }
  }
  else
  {
    switch(msgid)
    {
      case 0x8A6F522F3894A0D7:
        IORPC v14 = *rpc;
        return IOService::GetRegistryEntryID_Invoke(&v14, self, (IOService::GetRegistryEntryID_Handler)IOService::GetRegistryEntryID_Impl);
      case 0x98E715041C459FA5:
        IORPC v15 = *rpc;
        return IOService::Stop_Invoke(&v15, self, (IOService::Stop_Handler)IOService::Stop_Impl);
      case 0xA8C93137712A16A2:
        IORPC rpca = *rpc;
        return IOService::Stop_async_Invoke(&rpca, self, (IOService::Stop_async_Handler)IOService::Stop_async_Impl);
    }
  }
  IORPC v6 = *rpc;
  return OSObject::_Dispatch(self, &v6);
}

kern_return_t IOService::Start_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Start_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IORPC v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD100;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOService::Stop_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Stop_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IORPC v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD110;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOService::GetRegistryEntryID_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::GetRegistryEntryID_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x3C)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *))func)(target, &reply[1].msgh_body);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD120;
      reply->msgh.uint32_t msgh_size = 60;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::CreateDefaultDispatchQueue_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::CreateDefaultDispatchQueue_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD130;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IOService::SetPowerState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SetPowerState_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD140;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::Create_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Create_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;
  const char *p_msgh_voucher_port;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0xE4
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    IORPC v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass);
    if (!v8 && *(void *)&message[3].msgh.msgh_bits) {
      return -536870206;
    }
    p_msgh_voucher_port = (const char *)&message[3].msgh.msgh_voucher_port;
    if (strnlen(p_msgh_voucher_port, 0x80uLL) > 0x7F)
    {
      return -536870206;
    }
    else
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *, const char *, mach_port_t *))func)(target, v8, p_msgh_voucher_port, &reply[2].msgh.msgh_remote_port);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD150;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
  }
  return v3;
}

kern_return_t IOService::UserSetProperties_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::UserSetProperties_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IORPC v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSContainerMetaClass)) {
        return -536870206;
      }
      IORPC v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      IORPC v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t))func)(target, v9);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD160;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return v3;
}

kern_return_t IOService::Stop_async_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Stop_async_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  OSMetaClassBase *v7;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    IORPC v7 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass);
    if (v7 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v7);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOService::_NewUserClient_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::_NewUserClient_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x68
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    IORPC v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSDictionaryMetaClass)) {
        return -536870206;
      }
      IORPC v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      IORPC v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, void, uint64_t, mach_port_t *))func)(target, message[3].msgh.msgh_local_port, v9, &reply[2].msgh.msgh_remote_port);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD170;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return v3;
}

kern_return_t IOServiceMetaClass::Dispatch(IOServiceMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOService::Start(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IOService *v8;
  IOService *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CD180;
  IORPC v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  IORPC v9 = provider;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xAB6F76DDE6D693F2 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::Stop(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IOService *v8;
  IOService *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CD190;
  IORPC v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  IORPC v9 = provider;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0x98E715041C459FA5 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::ClientCrashed(IOService *this, IOService *client, uint64_t options, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  _DWORD v7[17];
  uint64_t v8;
  IOService *v9;
  IOService *v10;
  uint64_t v11;

  memset(v7, 0, 52);
  v7[1] = 100;
  *(_OWORD *)&v7[13] = xmmword_23D3CD1A0;
  IORPC v9 = this;
  IORPC v8 = 2;
  *(void *)&v7[5] = 0x24DA2B68CLL;
  IORPC v10 = client;
  IORPC v11 = options;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x7800000064;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x7800000064;
    double result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v7[1] == 52 && *(void *)&v7[7] == 0xF608D8D479C824A3 && !v7[6])
  {
    if (*(void *)&v7[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::GetRegistryEntryID(IOService *this, uint64_t *registryEntryID, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  unsigned char v7[40];
  unsigned char v8[24];
  IOService *v9;
  uint64_t v10;

  IORPC v10 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  *(_DWORD *)&integer_t v7[4] = 72;
  *(_OWORD *)IORPC v8 = xmmword_23D3CD1B0;
  *(void *)&v8[16] = 1;
  IORPC v9 = this;
  *(void *)&v7[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x8000000048;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x8000000048;
    double result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v7[4] == 60 && *(void *)&v7[28] == 0x8A6F522F3894A0D7 && !*(_DWORD *)&v7[24])
  {
    if (*(void *)&v8[4]) {
      double result = -536870209;
    }
    else {
      double result = 0;
    }
    if (registryEntryID)
    {
      if (!*(void *)&v8[4])
      {
        double result = 0;
        *registryEntryID = *(void *)&v8[12];
      }
    }
  }
  return result;
}

kern_return_t IOService::SetName(IOService *this, const char *name, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v6;
  void v7[3];
  unsigned char v8[40];
  long long v9;
  uint64_t v10;
  long long v11;
  _OWORD v12[8];
  uint64_t v13;

  IORPC v13 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  memset(v12, 0, sizeof(v12));
  *(_DWORD *)&v8[4] = 208;
  IORPC v9 = xmmword_23D3CD1C0;
  IORPC v10 = 1;
  IORPC v11 = (unint64_t)this;
  *(void *)&v8[20] = 0x14DA2B68CLL;
  strlcpy((char *)v12, name, 0x80uLL);
  if (supermethod)
  {
    v7[0] = v8;
    v7[1] = v8;
    void v7[2] = 0x78000000D0;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v7);
    if (result) {
      return result;
    }
  }
  else
  {
    v6.message = (IORPCMessageMach *)v8;
    v6.reply = (IORPCMessageMach *)v8;
    *(void *)&v6.uint64_t sendSize = 0x78000000D0;
    double result = OSMetaClassBase::Invoke(this, &v6);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v8[4] == 52 && *(void *)&v8[28] == 0xFF378DD57615EB9FLL && !*(_DWORD *)&v8[24])
  {
    if (*(void *)((char *)&v9 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::RegisterService(IOService *this, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v3;
  void v4[3];
  unsigned char v5[40];
  long long v6;
  uint64_t v7;
  IOService *v8;
  uint64_t v9;

  IORPC v9 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  *(_DWORD *)&v5[4] = 72;
  IORPC v6 = xmmword_23D3CD1D0;
  IORPC v7 = 1;
  IORPC v8 = this;
  *(void *)&v5[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v4[0] = v5;
    v4[1] = v5;
    void v4[2] = 0x7800000048;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v4);
    if (result) {
      return result;
    }
  }
  else
  {
    v3.message = (IORPCMessageMach *)v5;
    v3.reply = (IORPCMessageMach *)v5;
    *(void *)&v3.uint64_t sendSize = 0x7800000048;
    double result = OSMetaClassBase::Invoke(this, &v3);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v5[4] == 52 && *(void *)&v5[28] == 0xE9722C2BB1347C28 && !*(_DWORD *)&v5[24])
  {
    if (*(void *)((char *)&v6 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::CreateDefaultDispatchQueue(IOService *this, IODispatchQueue **queue, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  IODispatchQueue *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  uint64_t v15;
  OSMetaClassBase *anObject;
  uint64_t v17;

  uint64_t v17 = *MEMORY[0x263EF8340];
  IORPC v11 = 0u;
  IORPC v12 = 0u;
  IORPC v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  IORPC v14 = xmmword_23D3CD1E0;
  IORPC v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    IORPC v4 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x8C00000048;
    IORPC v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 72 && (void)v14 == 0x805BB452F0B44EF7 && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (IODispatchQueue *)OSMetaClassBase::safeMetaCast(anObject, gIODispatchQueueMetaClass);
      *queue = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOService::CopyProperties(IOService *this, OSDictionary **properties, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  OSDictionary *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  unsigned char v15[20];
  uint64_t v16;

  IORPC v16 = *MEMORY[0x263EF8340];
  IORPC v11 = 0u;
  IORPC v12 = 0u;
  IORPC v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  IORPC v14 = xmmword_23D3CD1F0;
  *(void *)IORPC v15 = 1;
  *(void *)&v15[8] = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x9000000048;
    IORPC v4 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x9000000048;
    IORPC v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 76
      && *(void *)((char *)&v14 + 4) == 0x833EC8F92F8B5362
      && DWORD2(v12) == 1
      && *(void *)&v15[4] == 1)
    {
      IORPC v6 = (OSDictionary *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v15[12], gOSDictionaryMetaClass);
      OSDictionary *properties = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = *(void *)&v15[12] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOService::SearchProperty(IOService *this, const char *name, const char *plane, uint64_t options, OSContainer **property, OSDispatchMethod supermethod)
{
  kern_return_t v11;
  kern_return_t v12;
  OSContainer *v13;
  BOOL v14;
  IORPC v16;
  void v17[3];
  long long v18;
  long long v19;
  uint64_t v20;
  long long v21;
  unsigned char v22[24];
  _OWORD v23[16];
  long long v24;
  uint64_t v25;

  int v25 = *MEMORY[0x263EF8340];
  int v24 = 0u;
  memset(v23, 0, sizeof(v23));
  uint64_t v20 = 0;
  uint64_t v18 = 0u;
  long long v19 = 0u;
  DWORD1(v18) = 352;
  uint64_t v21 = 0xAD751CDB94C8DCC8;
  *(void *)int v22 = 1;
  *(_OWORD *)&v22[8] = (unint64_t)this;
  *(void *)((char *)&v19 + 4) = 0x14DA2B68CLL;
  strlcpy((char *)v23, name, 0x80uLL);
  *(void *)&v23[8] = 0;
  strlcpy((char *)&v23[8] + 8, plane, 0x80uLL);
  *((void *)&v24 + IOExtensiblePaniclog::free(this - 1) = options;
  if (supermethod)
  {
    v17[0] = &v18;
    v17[1] = &v18;
    v17[2] = 0x9000000160;
    IORPC v11 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v17);
  }
  else
  {
    v16.message = (IORPCMessageMach *)&v18;
    v16.reply = (IORPCMessageMach *)&v18;
    *(void *)&v16.uint64_t sendSize = 0x9000000160;
    IORPC v11 = OSMetaClassBase::Invoke(this, &v16);
  }
  IORPC v12 = v11;
  if (!v11)
  {
    IORPC v12 = -536870209;
    if (DWORD1(v18) == 76
      && *(void *)((char *)&v21 + 4) == 0xAD751CDB94C8DCC8
      && DWORD2(v19) == 1
      && *(void *)&v22[4] == 1)
    {
      IORPC v13 = (OSContainer *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v22[12], gOSContainerMetaClass);
      *property = v13;
      if (v13) {
        IORPC v14 = 1;
      }
      else {
        IORPC v14 = *(void *)&v22[12] == 0;
      }
      if (v14) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v12;
}

kern_return_t IOService::SetProperties(IOService *this, OSDictionary *properties, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  long long v8;
  uint64_t v9;
  IOService *v10;
  OSDictionary *v11;
  uint64_t v12;

  IORPC v12 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 96;
  IORPC v8 = xmmword_23D3CD200;
  IORPC v9 = 2;
  IORPC v10 = this;
  *(void *)&IORPC v7 = 32;
  *((void *)&v7 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  IORPC v11 = properties;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000060;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000060;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xD8A753EA156F9162 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::JoinPMTree(IOService *this, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v3;
  void v4[3];
  unsigned char v5[40];
  long long v6;
  uint64_t v7;
  IOService *v8;
  uint64_t v9;

  IORPC v9 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  *(_DWORD *)&v5[4] = 72;
  IORPC v6 = xmmword_23D3CD210;
  IORPC v7 = 1;
  IORPC v8 = this;
  *(void *)&v5[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v4[0] = v5;
    v4[1] = v5;
    void v4[2] = 0x7800000048;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v4);
    if (result) {
      return result;
    }
  }
  else
  {
    v3.message = (IORPCMessageMach *)v5;
    v3.reply = (IORPCMessageMach *)v5;
    *(void *)&v3.uint64_t sendSize = 0x7800000048;
    double result = OSMetaClassBase::Invoke(this, &v3);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v5[4] == 52 && *(void *)&v5[28] == 0xF26C46526735EFFFLL && !*(_DWORD *)&v5[24])
  {
    if (*(void *)((char *)&v6 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::SetPowerState(IOService *this, uint32_t powerFlags, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IOService *v9;
  uint64_t v10;
  uint64_t v11;

  IORPC v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  IORPC v7 = xmmword_23D3CD220;
  IORPC v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  IORPC v10 = powerFlags;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xD200FDE7D57ECCA6 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::ChangePowerState(IOService *this, uint32_t powerFlags, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IOService *v9;
  uint64_t v10;
  uint64_t v11;

  IORPC v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  IORPC v7 = xmmword_23D3CD230;
  IORPC v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  IORPC v10 = powerFlags;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    double result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xDB75CFC3395484A0 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOService::SetPowerOverride(IOService *this, unsigned __int8 a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  long long v7 = xmmword_23D3CD240;
  uint64_t v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  uint64_t v10 = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    uint64_t result = ((uint64_t (*)(IOService *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xDCA775718F07AE4FLL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::NewUserClient(IOService *this, uint32_t type, IOUserClient **userClient, OSDispatchMethod supermethod)
{
  kern_return_t v5;
  kern_return_t v6;
  IOUserClient *v7;
  BOOL v8;
  IORPC v10;
  void v11[3];
  long long v12;
  long long v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  OSMetaClassBase *anObject[2];
  uint64_t v19;

  long long v19 = *MEMORY[0x263EF8340];
  IORPC v16 = 0;
  IORPC v13 = 0u;
  IORPC v14 = 0;
  IORPC v12 = 0u;
  DWORD1(v12) = 80;
  IORPC v15 = 0xF669EFFFCB89ED9CLL;
  uint64_t v17 = 1;
  anObject[0] = this;
  *(void *)((char *)&v13 + 4) = 0x14DA2B68CLL;
  anObject[1] = (OSMetaClassBase *)type;
  if (supermethod)
  {
    v11[0] = &v12;
    v11[1] = &v12;
    v11[2] = 0x8C00000050;
    IORPC v5 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v11);
  }
  else
  {
    v10.message = (IORPCMessageMach *)&v12;
    v10.reply = (IORPCMessageMach *)&v12;
    *(void *)&v10.uint64_t sendSize = 0x8C00000050;
    IORPC v5 = OSMetaClassBase::Invoke(this, &v10);
  }
  IORPC v6 = v5;
  if (!v5)
  {
    IORPC v6 = -536870209;
    if (DWORD1(v12) == 72 && v15 == 0xF669EFFFCB89ED9CLL && DWORD2(v13) == 1 && v17 == 1)
    {
      long long v7 = (IOUserClient *)OSMetaClassBase::safeMetaCast(anObject[0], gIOUserClientMetaClass);
      *userClient = v7;
      if (v7) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = anObject[0] == 0;
      }
      if (v8) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v6;
}

kern_return_t IOService::Create(IOService *this, IOService *provider, const char *propertiesKey, IOService **result, OSDispatchMethod supermethod)
{
  kern_return_t v8;
  kern_return_t v9;
  IOService *v10;
  BOOL v11;
  IORPC v13;
  void v14[3];
  long long v15;
  long long v16;
  long long v17;
  int v18;
  unsigned char v19[12];
  unsigned char anObject[12];
  IOService *anObject_12;
  IOService *v22;
  int v23;
  _OWORD v24[8];
  int v25;
  uint64_t v26;

  uint64_t v26 = *MEMORY[0x263EF8340];
  *(_DWORD *)anObject = 0;
  uint64_t v23 = 0;
  IORPC v15 = 0u;
  IORPC v16 = 0u;
  int v25 = 0;
  memset(v24, 0, sizeof(v24));
  uint64_t v17 = 0u;
  *(_DWORD *)&v19[8] = 0;
  DWORD1(v15) = 228;
  *(void *)long long v19 = 0xE1A46DBD68BBE09CLL;
  anObject_12 = this;
  *(void *)&anObject[4] = 2;
  *(void *)((char *)&v16 + 4) = 0x24DA2B68CLL;
  int v22 = provider;
  uint64_t v18 = 0;
  strlcpy((char *)v24 + 4, propertiesKey, 0x80uLL);
  if (supermethod)
  {
    v14[0] = &v15;
    v14[1] = &v15;
    v14[2] = 0x8C000000E4;
    uint64_t v8 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v14);
  }
  else
  {
    v13.message = (IORPCMessageMach *)&v15;
    v13.reply = (IORPCMessageMach *)&v15;
    *(void *)&v13.uint64_t sendSize = 0x8C000000E4;
    uint64_t v8 = OSMetaClassBase::Invoke(this, &v13);
  }
  IORPC v9 = v8;
  if (!v8)
  {
    IORPC v9 = -536870209;
    if (DWORD1(v15) == 72
      && *((void *)&v17 + 1) == 0xE1A46DBD68BBE09CLL
      && DWORD2(v16) == 1
      && *(void *)&v19[4] == 1)
    {
      uint64_t v10 = (IOService *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)anObject, gIOServiceMetaClass);
      *uint64_t result = v10;
      if (v10) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = *(void *)anObject == 0;
      }
      if (v11) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v9;
}

kern_return_t IOService::Terminate(IOService *this, uint64_t options, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IOService *v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  long long v7 = xmmword_23D3CD250;
  uint64_t v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  uint64_t v10 = options;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    uint64_t result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xF7A595D9927810C8 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::CopyProviderProperties(IOService *this, OSArray *propertyKeys, OSArray **properties, OSDispatchMethod supermethod)
{
  kern_return_t v5;
  kern_return_t v6;
  OSArray *v7;
  BOOL v8;
  IORPC v10;
  void v11[3];
  long long v12;
  long long v13;
  uint64_t v14;
  long long v15;
  unsigned char v16[24];
  IOService *v17;
  OSArray *v18;
  uint64_t v19;

  long long v19 = *MEMORY[0x263EF8340];
  IORPC v12 = 0u;
  IORPC v13 = 0u;
  IORPC v14 = 0;
  DWORD1(v12) = 96;
  *(_OWORD *)IORPC v16 = xmmword_23D3CD260;
  *(void *)&v16[16] = 2;
  uint64_t v17 = this;
  *(void *)&IORPC v15 = 32;
  *((void *)&v15 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)((char *)&v13 + 4) = 0x24DA2B68CLL;
  uint64_t v18 = propertyKeys;
  if (supermethod)
  {
    v11[0] = &v12;
    v11[1] = &v12;
    v11[2] = 0x9000000060;
    IORPC v5 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v11);
  }
  else
  {
    v10.message = (IORPCMessageMach *)&v12;
    v10.reply = (IORPCMessageMach *)&v12;
    *(void *)&v10.uint64_t sendSize = 0x9000000060;
    IORPC v5 = OSMetaClassBase::Invoke(this, &v10);
  }
  IORPC v6 = v5;
  if (!v5)
  {
    IORPC v6 = -536870209;
    if (DWORD1(v12) == 76
      && *(void *)((char *)&v15 + 4) == 0xC2A554959002C8E7
      && DWORD2(v13) == 1
      && *(void *)&v16[4] == 1)
    {
      long long v7 = (OSArray *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v16[12], gOSArrayMetaClass);
      OSDictionary *properties = v7;
      if (v7) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = *(void *)&v16[12] == 0;
      }
      if (v8) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v6;
}

kern_return_t IOService::RequireMaxBusStall(IOService *this, uint64_t maxBusStall, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IOService *v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  long long v7 = xmmword_23D3CD270;
  uint64_t v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  uint64_t v10 = maxBusStall;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    uint64_t result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xC21228652FF536AFLL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::AdjustBusy(IOService *this, int32_t delta, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  uint64_t v8;
  IOService *v9;
  uint64_t v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 80;
  long long v7 = xmmword_23D3CD280;
  uint64_t v8 = 1;
  IORPC v9 = this;
  *(void *)&v6[20] = 0x14DA2B68CLL;
  uint64_t v10 = delta;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000050;
    uint64_t result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000050;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xDE9F5AB8CC9758EBLL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::GetBusyState(IOService *this, uint32_t *busyState, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  unsigned char v7[40];
  long long v8;
  uint64_t v9;
  IOService *v10;
  uint64_t v11;

  uint64_t v11 = *MEMORY[0x263EF8340];
  memset(v7, 0, sizeof(v7));
  *(_DWORD *)&integer_t v7[4] = 72;
  uint64_t v8 = xmmword_23D3CD290;
  IORPC v9 = 1;
  uint64_t v10 = this;
  *(void *)&v7[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x7C00000048;
    uint64_t result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x7C00000048;
    uint64_t result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  uint64_t result = -536870209;
  if (*(_DWORD *)&v7[4] == 56 && *(void *)&v7[28] == 0xF5E47B685861DEE5 && !*(_DWORD *)&v7[24])
  {
    if (*(void *)((char *)&v8 + 4)) {
      uint64_t result = -536870209;
    }
    else {
      uint64_t result = 0;
    }
    if (busyState)
    {
      if (!*(void *)((char *)&v8 + 4))
      {
        uint64_t result = 0;
        *busyState = HIDWORD(v8);
      }
    }
  }
  return result;
}

kern_return_t IOService::CoreAnalyticsSendEvent(IOService *this, uint64_t options, OSString *eventName, OSDictionary *eventPayload, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v6;
  void v7[3];
  unsigned char v8[40];
  long long v9;
  uint64_t v10;
  uint64_t v11;
  long long v12;
  uint64_t v13;
  IOService *v14;
  OSString *v15;
  OSDictionary *v16;
  uint64_t v17;

  memset(v8, 0, sizeof(v8));
  *(_DWORD *)&v8[4] = 128;
  IORPC v12 = xmmword_23D3CD2A0;
  IORPC v13 = 3;
  IORPC v14 = this;
  *(void *)&v8[20] = 0x34DA2B68CLL;
  IORPC v16 = eventPayload;
  uint64_t v17 = options;
  *((void *)&v9 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&IORPC v9 = 32;
  uint64_t v10 = 40;
  uint64_t v11 = 16777472;
  IORPC v15 = eventName;
  if (supermethod)
  {
    v7[0] = v8;
    v7[1] = v8;
    void v7[2] = 0x7800000080;
    uint64_t result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v7);
    if (result) {
      return result;
    }
  }
  else
  {
    v6.message = (IORPCMessageMach *)v8;
    v6.reply = (IORPCMessageMach *)v8;
    *(void *)&v6.uint64_t sendSize = 0x7800000080;
    uint64_t result = OSMetaClassBase::Invoke(this, &v6);
    if (result) {
      return result;
    }
  }
  uint64_t result = -536870209;
  if (*(_DWORD *)&v8[4] == 52 && *(void *)&v8[28] == 0xEDF64411B90D31CALL && !*(_DWORD *)&v8[24])
  {
    if (*(void *)((char *)&v9 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

IOReturn IOService::UpdateReport(IOService *this, OSData *channels, uint32_t action, uint32_t *outElementCount, uint64_t offset, uint64_t capacity, IOMemoryDescriptor *buffer, OSDispatchMethod supermethod)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v15 = 0;
  *(_OWORD *)&v13[8] = 0u;
  long long v14 = 0u;
  memset(v12, 0, sizeof(v12));
  long long v19 = 0u;
  *(_DWORD *)&v12[4] = 140;
  *(void *)((char *)&v14 + 4) = 0x8509EED786C7FF1ALL;
  uint64_t v17 = this;
  uint64_t v16 = 3;
  *(void *)&v12[20] = 0x34DA2B68CLL;
  *(_DWORD *)&v13[8] = 16777472;
  *(void *)IORPC v13 = 32;
  uint64_t v18 = channels;
  DWORD2(v19) = action;
  uint64_t v20 = offset;
  uint64_t v21 = capacity;
  *(void *)&long long v19 = buffer;
  if (supermethod)
  {
    v11[0] = v12;
    v11[1] = v12;
    v11[2] = 0x7C0000008CLL;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v11);
    if (result) {
      return result;
    }
  }
  else
  {
    v10.message = (IORPCMessageMach *)v12;
    v10.reply = (IORPCMessageMach *)v12;
    *(void *)&v10.uint64_t sendSize = 0x7C0000008CLL;
    IOReturn result = OSMetaClassBase::Invoke(this, &v10);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v12[4] == 56 && *(void *)&v12[28] == 0x8509EED786C7FF1ALL && !*(_DWORD *)&v12[24])
  {
    if (*(void *)&v13[4]) {
      IOReturn result = -536870209;
    }
    else {
      IOReturn result = 0;
    }
    if (outElementCount)
    {
      if (!*(void *)&v13[4])
      {
        IOReturn result = 0;
        *outElementCount = *(_DWORD *)&v13[12];
      }
    }
  }
  return result;
}

IOReturn IOService::ConfigureReport(IOService *this, OSData *channels, uint32_t action, uint32_t *outCount, OSDispatchMethod supermethod)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  memset(v9, 0, sizeof(v9));
  *((void *)&v10 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(_DWORD *)&void v9[4] = 104;
  unint64_t v11 = 0x85D9DEF59E3F02BELL;
  uint64_t v13 = 2;
  long long v14 = this;
  *(void *)&v9[20] = 0x24DA2B68CLL;
  *(void *)&long long v10 = 32;
  int v15 = channels;
  uint64_t v16 = action;
  if (supermethod)
  {
    v8[0] = v9;
    v8[1] = v9;
    int v8[2] = 0x7C00000068;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v8);
    if (result) {
      return result;
    }
  }
  else
  {
    v7.message = (IORPCMessageMach *)v9;
    v7.reply = (IORPCMessageMach *)v9;
    *(void *)&v7.uint64_t sendSize = 0x7C00000068;
    IOReturn result = OSMetaClassBase::Invoke(this, &v7);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v9[4] == 56 && *(void *)&v9[28] == 0x85D9DEF59E3F02BELL && !*(_DWORD *)&v9[24])
  {
    if (*(void *)((char *)&v10 + 4)) {
      IOReturn result = -536870209;
    }
    else {
      IOReturn result = 0;
    }
    if (outCount)
    {
      if (!*(void *)((char *)&v10 + 4))
      {
        IOReturn result = 0;
        *outCount = HIDWORD(v10);
      }
    }
  }
  return result;
}

IOReturn IOService::SetLegend(IOService *this, OSArray *legend, BOOL is_public, OSDispatchMethod supermethod)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  memset(v7, 0, sizeof(v7));
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(_DWORD *)&integer_t v7[4] = 104;
  unint64_t v9 = 0xA32EE5222548AFA2;
  uint64_t v11 = 2;
  uint64_t v12 = this;
  *(void *)&v7[20] = 0x24DA2B68CLL;
  *(void *)&long long v8 = 32;
  uint64_t v13 = legend;
  BOOL v14 = is_public;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x7800000068;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x7800000068;
    IOReturn result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v7[4] == 52 && *(void *)&v7[28] == 0xA32EE5222548AFA2 && !*(_DWORD *)&v7[24])
  {
    if (*(void *)((char *)&v8 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::CopyName(IOService *this, OSString **name, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  OSString *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  unsigned char v15[20];
  uint64_t v16;

  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  uint64_t v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  BOOL v14 = xmmword_23D3CD2B0;
  *(void *)uint64_t v15 = 1;
  *(void *)&v15[8] = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x9000000048;
    IORPC v4 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x9000000048;
    IORPC v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 76
      && *(void *)((char *)&v14 + 4) == 0xFE0617FEBC5B2CC4
      && DWORD2(v12) == 1
      && *(void *)&v15[4] == 1)
    {
      IORPC v6 = (OSString *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v15[12], gOSStringMetaClass);
      *name = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = *(void *)&v15[12] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOService::StringFromReturn(IOService *this, IOReturn retval, OSString **str, OSDispatchMethod supermethod)
{
  kern_return_t v5;
  kern_return_t v6;
  OSString *v7;
  BOOL v8;
  IORPC v10;
  void v11[3];
  long long v12;
  long long v13;
  uint64_t v14;
  long long v15;
  unsigned char v16[24];
  uint64_t v17;

  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v13 = 0u;
  BOOL v14 = 0;
  uint64_t v12 = 0u;
  DWORD1(v12) = 80;
  uint64_t v15 = 0xF62CEC3DF59DB769;
  *(void *)uint64_t v16 = 1;
  *(void *)&v16[8] = this;
  *(void *)((char *)&v13 + 4) = 0x14DA2B68CLL;
  *(void *)&v16[16] = retval;
  if (supermethod)
  {
    v11[0] = &v12;
    v11[1] = &v12;
    v11[2] = 0x9000000050;
    IORPC v5 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v11);
  }
  else
  {
    v10.message = (IORPCMessageMach *)&v12;
    v10.reply = (IORPCMessageMach *)&v12;
    *(void *)&v10.uint64_t sendSize = 0x9000000050;
    IORPC v5 = OSMetaClassBase::Invoke(this, &v10);
  }
  IORPC v6 = v5;
  if (!v5)
  {
    IORPC v6 = -536870209;
    if (DWORD1(v12) == 76
      && *(void *)((char *)&v15 + 4) == 0xF62CEC3DF59DB769
      && DWORD2(v13) == 1
      && *(void *)&v16[4] == 1)
    {
      IORPC v7 = (OSString *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v16[12], gOSStringMetaClass);
      OSString *str = v7;
      if (v7) {
        long long v8 = 1;
      }
      else {
        long long v8 = *(void *)&v16[12] == 0;
      }
      if (v8) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v6;
}

kern_return_t IOService::_ClaimSystemWakeEvent(IOService *this, IOService *device, uint64_t flags, const char *reason, OSContainer *details, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v10;
  void v11[3];
  unsigned char v12[52];
  uint64_t v13;
  int v14;
  long long v15;
  int v16;
  uint64_t v17;
  IOService *v18;
  IOService *v19;
  unsigned char v20[20];
  _OWORD v21[8];
  int v22;
  uint64_t v23;

  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  memset(v21, 0, sizeof(v21));
  *(_OWORD *)&v20[4] = 0u;
  uint64_t v15 = 0u;
  uint64_t v16 = 0;
  memset(v12, 0, sizeof(v12));
  *(_DWORD *)&v12[4] = 260;
  *(void *)((char *)&v15 + 4) = 0x845C18DFE6F75305;
  uint64_t v18 = this;
  uint64_t v17 = 3;
  *(void *)&v12[20] = 0x34DA2B68CLL;
  long long v19 = device;
  *(void *)&v20[8] = flags;
  strlcpy((char *)v21 + 4, reason, 0x80uLL);
  BOOL v14 = 16777472;
  uint64_t v13 = 40;
  *(void *)uint64_t v20 = details;
  if (supermethod)
  {
    v11[0] = v12;
    v11[1] = v12;
    v11[2] = 0x7800000104;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v11);
    if (result) {
      return result;
    }
  }
  else
  {
    v10.message = (IORPCMessageMach *)v12;
    v10.reply = (IORPCMessageMach *)v12;
    *(void *)&v10.uint64_t sendSize = 0x7800000104;
    IOReturn result = OSMetaClassBase::Invoke(this, &v10);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v12[4] == 52 && *(void *)&v12[28] == 0x845C18DFE6F75305 && !*(_DWORD *)&v12[24])
  {
    if (*(void *)&v12[44]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::UserSetProperties(IOService *this, OSContainer *properties, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  long long v8;
  uint64_t v9;
  IOService *v10;
  OSContainer *v11;
  uint64_t v12;

  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 96;
  long long v8 = xmmword_23D3CD2C0;
  unint64_t v9 = 2;
  uint64_t v10 = this;
  *(void *)&IORPC v7 = 32;
  *((void *)&v7 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  uint64_t v11 = properties;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000060;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000060;
    IOReturn result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xAD8461D6BB5E656DLL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::SendIOMessageServicePropertyChange(IOService *this, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v3;
  void v4[3];
  unsigned char v5[40];
  long long v6;
  uint64_t v7;
  IOService *v8;
  uint64_t v9;

  unint64_t v9 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  *(_DWORD *)&v5[4] = 72;
  IORPC v6 = xmmword_23D3CD2D0;
  IORPC v7 = 1;
  long long v8 = this;
  *(void *)&v5[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v4[0] = v5;
    v4[1] = v5;
    void v4[2] = 0x7800000048;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v4);
    if (result) {
      return result;
    }
  }
  else
  {
    v3.message = (IORPCMessageMach *)v5;
    v3.reply = (IORPCMessageMach *)v5;
    *(void *)&v3.uint64_t sendSize = 0x7800000048;
    IOReturn result = OSMetaClassBase::Invoke(this, &v3);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v5[4] == 52 && *(void *)&v5[28] == 0xF26F1C63C935E672 && !*(_DWORD *)&v5[24])
  {
    if (*(void *)((char *)&v6 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::RemoveProperty(IOService *this, OSString *propertyName, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  unsigned char v6[40];
  long long v7;
  long long v8;
  uint64_t v9;
  IOService *v10;
  OSString *v11;
  uint64_t v12;

  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v6, 0, sizeof(v6));
  *(_DWORD *)&v6[4] = 96;
  long long v8 = xmmword_23D3CD2E0;
  unint64_t v9 = 2;
  uint64_t v10 = this;
  *(void *)&IORPC v7 = 32;
  *((void *)&v7 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  uint64_t v11 = propertyName;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000060;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x7800000060;
    IOReturn result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0xDADEB06419D321B0 && !*(_DWORD *)&v6[24])
  {
    if (*(void *)((char *)&v7 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::CopySystemStateNotificationService(IOService *this, IOService **service, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  IOService *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  uint64_t v15;
  OSMetaClassBase *anObject;
  uint64_t v17;

  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  uint64_t v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  BOOL v14 = xmmword_23D3CD2F0;
  uint64_t v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    IORPC v4 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint64_t sendSize = 0x8C00000048;
    IORPC v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 72 && (void)v14 == 0x9165D1FCE9B2CA5ALL && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (IOService *)OSMetaClassBase::safeMetaCast(anObject, gIOServiceMetaClass);
      IOService *service = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOService::StateNotificationItemCreate(IOService *this, OSString *itemName, OSDictionary *schema, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  unsigned char v7[40];
  long long v8;
  uint64_t v9;
  uint64_t v10;
  long long v11;
  uint64_t v12;
  IOService *v13;
  OSString *v14;
  OSDictionary *v15;

  memset(v7, 0, sizeof(v7));
  *(_DWORD *)&integer_t v7[4] = 120;
  uint64_t v11 = xmmword_23D3CD300;
  uint64_t v12 = 3;
  uint64_t v13 = this;
  *(void *)&v7[20] = 0x34DA2B68CLL;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&long long v8 = 32;
  unint64_t v9 = 40;
  uint64_t v10 = 16777472;
  BOOL v14 = itemName;
  uint64_t v15 = schema;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x7800000078;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x7800000078;
    IOReturn result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v7[4] == 52 && *(void *)&v7[28] == 0xB35947BDAB354E9ELL && !*(_DWORD *)&v7[24])
  {
    if (*(void *)((char *)&v8 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::StateNotificationItemSet(IOService *this, OSString *itemName, OSDictionary *value, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v5;
  void v6[3];
  unsigned char v7[40];
  long long v8;
  uint64_t v9;
  uint64_t v10;
  long long v11;
  uint64_t v12;
  IOService *v13;
  OSString *v14;
  OSDictionary *v15;

  memset(v7, 0, sizeof(v7));
  *(_DWORD *)&integer_t v7[4] = 120;
  uint64_t v11 = xmmword_23D3CD310;
  uint64_t v12 = 3;
  uint64_t v13 = this;
  *(void *)&v7[20] = 0x34DA2B68CLL;
  *((void *)&v8 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)&long long v8 = 32;
  unint64_t v9 = 40;
  uint64_t v10 = 16777472;
  BOOL v14 = itemName;
  uint64_t v15 = value;
  if (supermethod)
  {
    v6[0] = v7;
    v6[1] = v7;
    void v6[2] = 0x7800000078;
    IOReturn result = ((uint64_t (*)(IOService *, void *))supermethod)(this, v6);
    if (result) {
      return result;
    }
  }
  else
  {
    v5.message = (IORPCMessageMach *)v7;
    v5.reply = (IORPCMessageMach *)v7;
    *(void *)&v5.uint64_t sendSize = 0x7800000078;
    IOReturn result = OSMetaClassBase::Invoke(this, &v5);
    if (result) {
      return result;
    }
  }
  IOReturn result = -536870209;
  if (*(_DWORD *)&v7[4] == 52 && *(void *)&v7[28] == 0xB318C8FA26B5B891 && !*(_DWORD *)&v7[24])
  {
    if (*(void *)((char *)&v8 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOService::StateNotificationItemCopy(IOService *this, OSString *itemName, OSDictionary **value, OSDispatchMethod supermethod)
{
  kern_return_t v5;
  kern_return_t v6;
  OSDictionary *v7;
  BOOL v8;
  IORPC v10;
  void v11[3];
  long long v12;
  long long v13;
  uint64_t v14;
  long long v15;
  unsigned char v16[24];
  IOService *v17;
  OSString *v18;
  uint64_t v19;

  long long v19 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0u;
  uint64_t v13 = 0u;
  BOOL v14 = 0;
  DWORD1(v12) = 96;
  *(_OWORD *)uint64_t v16 = xmmword_23D3CD320;
  *(void *)&v16[16] = 2;
  uint64_t v17 = this;
  *(void *)&uint64_t v15 = 32;
  *((void *)&v15 + IOExtensiblePaniclog::free(this - 1) = 16777472;
  *(void *)((char *)&v13 + 4) = 0x24DA2B68CLL;
  uint64_t v18 = itemName;
  if (supermethod)
  {
    v11[0] = &v12;
    v11[1] = &v12;
    v11[2] = 0x9000000060;
    IORPC v5 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v11);
  }
  else
  {
    v10.message = (IORPCMessageMach *)&v12;
    v10.reply = (IORPCMessageMach *)&v12;
    *(void *)&v10.uint64_t sendSize = 0x9000000060;
    IORPC v5 = OSMetaClassBase::Invoke(this, &v10);
  }
  IORPC v6 = v5;
  if (!v5)
  {
    IORPC v6 = -536870209;
    if (DWORD1(v12) == 76
      && *(void *)((char *)&v15 + 4) == 0xAD2E6404FDE4B615
      && DWORD2(v13) == 1
      && *(void *)&v16[4] == 1)
    {
      IORPC v7 = (OSDictionary *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v16[12], gOSDictionaryMetaClass);
      *value = v7;
      if (v7) {
        long long v8 = 1;
      }
      else {
        long long v8 = *(void *)&v16[12] == 0;
      }
      if (v8) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v6;
}

void IOService::Stop_async(IOService *this, IOService *provider, OSDispatchMethod supermethod)
{
  long long v5 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  DWORD1(v5) = 92;
  long long v9 = xmmword_23D3CD330;
  uint64_t v11 = this;
  uint64_t v10 = 2;
  *(void *)((char *)&v6 + 4) = 0x24DA2B68CLL;
  int v8 = 0;
  uint64_t v12 = provider;
  if (supermethod)
  {
    v4[0] = &v5;
    v4[1] = 0;
    void v4[2] = 92;
    ((void (*)(IOService *, void *))supermethod)(this, v4);
  }
  else
  {
    v3.message = (IORPCMessageMach *)&v5;
    v3.reply = 0;
    *(void *)&v3.uint64_t sendSize = 92;
    OSMetaClassBase::Invoke(this, &v3);
  }
}

kern_return_t IOService::_NewUserClient(IOService *this, uint32_t type, OSDictionary *entitlements, IOUserClient **userClient, OSDispatchMethod supermethod)
{
  kern_return_t v6;
  kern_return_t v7;
  IOUserClient *v8;
  BOOL v9;
  IORPC v11;
  void v12[3];
  long long v13;
  long long v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  OSMetaClassBase *anObject[2];
  IOService *v20;
  OSDictionary *v21;
  uint64_t v22;
  uint64_t v23;

  uint64_t v23 = *MEMORY[0x263EF8340];
  anObject[0] = 0;
  uint64_t v13 = 0u;
  BOOL v14 = 0u;
  uint64_t v15 = 0;
  uint64_t v17 = 16777472;
  DWORD1(v13) = 104;
  uint64_t v18 = 0x80B22DD60EE3ABB6;
  anObject[1] = (OSMetaClassBase *)2;
  uint64_t v20 = this;
  *(void *)((char *)&v14 + 4) = 0x24DA2B68CLL;
  uint64_t v21 = entitlements;
  uint64_t v22 = type;
  uint64_t v16 = 32;
  if (supermethod)
  {
    v12[0] = &v13;
    v12[1] = &v13;
    int v12[2] = 0x8C00000068;
    long long v6 = ((uint64_t (*)(IOService *, void *))supermethod)(this, v12);
  }
  else
  {
    v11.message = (IORPCMessageMach *)&v13;
    v11.reply = (IORPCMessageMach *)&v13;
    *(void *)&v11.uint64_t sendSize = 0x8C00000068;
    long long v6 = OSMetaClassBase::Invoke(this, &v11);
  }
  long long v7 = v6;
  if (!v6)
  {
    long long v7 = -536870209;
    if (DWORD1(v13) == 72 && v16 == 0x80B22DD60EE3ABB6 && DWORD2(v14) == 1 && v18 == 1)
    {
      int v8 = (IOUserClient *)OSMetaClassBase::safeMetaCast(anObject[0], gIOUserClientMetaClass);
      *userClient = v8;
      if (v8) {
        long long v9 = 1;
      }
      else {
        long long v9 = anObject[0] == 0;
      }
      if (v9) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v7;
}

kern_return_t IOService::ClientCrashed_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::ClientCrashed_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x64
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    int v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIOServiceMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *, void))func)(target, v8, *(void *)&message[3].msgh.msgh_remote_port);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD340;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOService::SetName_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SetName_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  mach_msg_body_t *p_msgh_body;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0xD0
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    p_msgh_body = &message[2].msgh_body;
    if (strnlen((const char *)&message[2].msgh_body, 0x80uLL) <= 0x7F)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *))func)(target, p_msgh_body);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD350;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOService::RegisterService_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::RegisterService_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  IOReturn result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IOReturn result = ((uint64_t (*)(OSMetaClassBase *))func)(target);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD360;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::CopyProperties_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::CopyProperties_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  IOReturn result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    IOReturn result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_local_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CD370;
      reply->msgh.uint32_t msgh_size = 76;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
      *(void *)&reply[1].msgh.msgh_bits = 24;
      *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
    }
  }
  return result;
}

kern_return_t IOService::SearchProperty_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SearchProperty_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x160
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    IORPC v3 = -536870206;
    if (strnlen((const char *)&message[2].msgh_body, 0x80uLL) <= 0x7F
      && strnlen((const char *)&message[7].msgh.msgh_id, 0x80uLL) <= 0x7F)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *, mach_msg_id_t *, void, mach_port_t *))func)(target, &message[2].msgh_body, &message[7].msgh.msgh_id, *(void *)&message[12].msgh.msgh_remote_port, &reply[2].msgh.msgh_local_port);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CD380;
        reply->msgh.uint32_t msgh_size = 76;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
        *(void *)&reply[1].msgh.msgh_bits = 24;
        *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
      }
    }
  }
  return v3;
}

kern_return_t IOService::SetProperties_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SetProperties_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSDictionaryMetaClass)) {
        return -536870206;
      }
      long long v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      long long v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t))func)(target, v9);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD390;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return v3;
}

kern_return_t IOService::JoinPMTree_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::JoinPMTree_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  IOReturn result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IOReturn result = ((uint64_t (*)(OSMetaClassBase *))func)(target);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD3A0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::ChangePowerState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::ChangePowerState_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  IOReturn result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IOReturn result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD3B0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

double IOService::SetPowerOverride_Invoke(IOService *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, BOOL))
{
  IORPC v4 = this->OSObject::OSMetaClassBase::__vftable;
  if (LODWORD(this->isEqualTo) == 1
    && v4[1].getMetaClass == (const OSMetaClass *(__cdecl *)(const OSMetaClassBase *__hidden))1
    && LODWORD(this->meta) >= 0x50
    && HIDWORD(this->meta) >= 0x34)
  {
    uint64_t v5 = *(void *)&this->refcount;
    if (!((unsigned int (*)(IORPC *, void))a3)(a2, LOBYTE(v4[1].release)))
    {
      *(_OWORD *)(v5 + 28) = xmmword_23D3CD3C0;
      *(_DWORD *)(v5 + 4) = 52;
      *(void *)&double result = 1302509197;
      *(void *)(v5 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v5 + 44) = 0;
    }
  }
  return result;
}

kern_return_t IOService::NewUserClient_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::NewUserClient_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, mach_port_t *))func)(target, message[2].msgh.msgh_voucher_port, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD3D0;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IOService::Terminate_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::Terminate_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, *(void *)&message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD3E0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::CopyProviderProperties_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::CopyProviderProperties_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSArrayMetaClass)) {
        return -536870206;
      }
      long long v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      long long v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t, mach_port_t *))func)(target, v9, &reply[2].msgh.msgh_local_port);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CD3F0;
      reply->msgh.uint32_t msgh_size = 76;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
      *(void *)&reply[1].msgh.msgh_bits = 24;
      *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
    }
  }
  return v3;
}

kern_return_t IOService::RequireMaxBusStall_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::RequireMaxBusStall_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, *(void *)&message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD400;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::AdjustBusy_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::AdjustBusy_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void))func)(target, message[2].msgh.msgh_voucher_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD410;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::GetBusyState_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::GetBusyState_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x38)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *))func)(target, &reply[1].msgh_body);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD420;
      reply->msgh.uint32_t msgh_size = 56;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::CoreAnalyticsSendEvent_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::CoreAnalyticsSendEvent_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  const OSMetaClassBase *v9;
  uint64_t v10;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count != 3
    || *(void *)&message[3].msgh.msgh_size != 3
    || rpc->sendSize < 0x80
    || rpc->replySize < 0x34)
  {
    return v3;
  }
  reply = rpc->reply;
  int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_id;
  if (v8 && !OSMetaClassBase::safeMetaCast(v8, gOSStringMetaClass)) {
    return -536870206;
  }
  long long v9 = *(const OSMetaClassBase **)&message[4].msgh.msgh_bits;
  if (v9)
  {
    if (OSMetaClassBase::safeMetaCast(v9, gOSDictionaryMetaClass))
    {
      uint64_t v10 = *(void *)&message[4].msgh.msgh_bits;
      goto LABEL_12;
    }
    return -536870206;
  }
  uint64_t v10 = 0;
LABEL_12:
  IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, void, void, uint64_t))func)(target, *(void *)&message[4].msgh.msgh_remote_port, *(void *)&message[3].msgh.msgh_id, v10);
  if (!v3)
  {
    *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD430;
    reply->msgh.uint32_t msgh_size = 52;
    *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
    *(void *)&reply[1].msgh.msgh_voucher_port = 0;
  }
  return v3;
}

kern_return_t IOService::UpdateReport_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::UpdateReport_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  OSMetaClassBase *v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 3
    && *(void *)&message[3].msgh.msgh_bits == 3
    && rpc->sendSize >= 0x8C
    && rpc->replySize >= 0x38)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_voucher_port;
    if ((!v8 || OSMetaClassBase::safeMetaCast(v8, gOSDataMetaClass))
      && ((long long v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh_body.msgh_descriptor_count, gIOMemoryDescriptorMetaClass)) != 0|| !*(void *)&message[3].msgh_body.msgh_descriptor_count))
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, void, void, mach_msg_body_t *, void, void, OSMetaClassBase *))func)(target, *(void *)&message[3].msgh.msgh_voucher_port, message[4].msgh.msgh_size, &reply[1].msgh_body, *(void *)&message[4].msgh.msgh_local_port, *(void *)&message[4].msgh.msgh_id, v9);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD440;
        reply->msgh.uint32_t msgh_size = 56;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOService::ConfigureReport_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::ConfigureReport_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x68
    && rpc->replySize >= 0x38)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSDataMetaClass)) {
        return -536870206;
      }
      long long v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      long long v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t, void, mach_msg_body_t *))func)(target, v9, message[3].msgh.msgh_local_port, &reply[1].msgh_body);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD450;
      reply->msgh.uint32_t msgh_size = 56;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return v3;
}

kern_return_t IOService::SetLegend_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SetLegend_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x68
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSArrayMetaClass)) {
        return -536870206;
      }
      long long v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      long long v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t, void))func)(target, v9, LOBYTE(message[3].msgh.msgh_local_port));
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD460;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return v3;
}

kern_return_t IOService::CopyName_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::CopyName_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_local_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CD470;
      reply->msgh.uint32_t msgh_size = 76;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
      *(void *)&reply[1].msgh.msgh_bits = 24;
      *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
    }
  }
  return result;
}

kern_return_t IOService::StringFromReturn_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::StringFromReturn_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, mach_port_t *))func)(target, message[2].msgh.msgh_voucher_port, &reply[2].msgh.msgh_local_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CD480;
      reply->msgh.uint32_t msgh_size = 76;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
      *(void *)&reply[1].msgh.msgh_bits = 24;
      *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
    }
  }
  return result;
}

kern_return_t IOService::_ClaimSystemWakeEvent_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::_ClaimSystemWakeEvent_Handler func)
{
  kern_return_t v4;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  OSMetaClassBase *v9;

  message = rpc->message;
  IORPC v4 = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 3
    && *(void *)&message[3].msgh.msgh_bits == 3
    && rpc->sendSize >= 0x104
    && rpc->replySize >= 0x34)
  {
    IORPC v4 = -536870206;
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh_body.msgh_descriptor_count;
    if (!v8 || OSMetaClassBase::safeMetaCast(v8, gOSContainerMetaClass))
    {
      long long v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_voucher_port, gIOServiceMetaClass);
      if ((v9 || !*(void *)&message[3].msgh.msgh_voucher_port)
        && strnlen((const char *)&message[4].msgh.msgh_id, 0x80uLL) <= 0x7F)
      {
        IORPC v4 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *, void, mach_msg_id_t *, void))func)(target, v9, *(void *)&message[4].msgh.msgh_size, &message[4].msgh.msgh_id, *(void *)&message[3].msgh_body.msgh_descriptor_count);
        if (!v4)
        {
          *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD490;
          reply->msgh.uint32_t msgh_size = 52;
          *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
          *(void *)&reply[1].msgh.msgh_voucher_port = 0;
        }
      }
    }
  }
  return v4;
}

kern_return_t IOService::SendIOMessageServicePropertyChange_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::SendIOMessageServicePropertyChange_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *))func)(target);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD4A0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOService::RemoveProperty_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::RemoveProperty_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSStringMetaClass)) {
        return -536870206;
      }
      long long v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      long long v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t))func)(target, v9);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD4B0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return v3;
}

kern_return_t IOService::CopySystemStateNotificationService_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::CopySystemStateNotificationService_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD4C0;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IOService::StateNotificationItemCreate_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::StateNotificationItemCreate_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  const OSMetaClassBase *v9;
  uint64_t v10;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count != 3
    || *(void *)&message[3].msgh.msgh_size != 3
    || rpc->sendSize < 0x78
    || rpc->replySize < 0x34)
  {
    return v3;
  }
  reply = rpc->reply;
  int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_id;
  if (v8 && !OSMetaClassBase::safeMetaCast(v8, gOSStringMetaClass)) {
    return -536870206;
  }
  long long v9 = *(const OSMetaClassBase **)&message[4].msgh.msgh_bits;
  if (v9)
  {
    if (OSMetaClassBase::safeMetaCast(v9, gOSDictionaryMetaClass))
    {
      uint64_t v10 = *(void *)&message[4].msgh.msgh_bits;
      goto LABEL_12;
    }
    return -536870206;
  }
  uint64_t v10 = 0;
LABEL_12:
  IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, void, uint64_t))func)(target, *(void *)&message[3].msgh.msgh_id, v10);
  if (!v3)
  {
    *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD4D0;
    reply->msgh.uint32_t msgh_size = 52;
    *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
    *(void *)&reply[1].msgh.msgh_voucher_port = 0;
  }
  return v3;
}

kern_return_t IOService::StateNotificationItemSet_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::StateNotificationItemSet_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  const OSMetaClassBase *v9;
  uint64_t v10;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count != 3
    || *(void *)&message[3].msgh.msgh_size != 3
    || rpc->sendSize < 0x78
    || rpc->replySize < 0x34)
  {
    return v3;
  }
  reply = rpc->reply;
  int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_id;
  if (v8 && !OSMetaClassBase::safeMetaCast(v8, gOSStringMetaClass)) {
    return -536870206;
  }
  long long v9 = *(const OSMetaClassBase **)&message[4].msgh.msgh_bits;
  if (v9)
  {
    if (OSMetaClassBase::safeMetaCast(v9, gOSDictionaryMetaClass))
    {
      uint64_t v10 = *(void *)&message[4].msgh.msgh_bits;
      goto LABEL_12;
    }
    return -536870206;
  }
  uint64_t v10 = 0;
LABEL_12:
  IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, void, uint64_t))func)(target, *(void *)&message[3].msgh.msgh_id, v10);
  if (!v3)
  {
    *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD4E0;
    reply->msgh.uint32_t msgh_size = 52;
    *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
    *(void *)&reply[1].msgh.msgh_voucher_port = 0;
  }
  return v3;
}

kern_return_t IOService::StateNotificationItemCopy_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOService::StateNotificationItemCopy_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  uint64_t v9;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_voucher_port == 2
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    int v8 = *(const OSMetaClassBase **)&message[3].msgh.msgh_size;
    if (v8)
    {
      if (!OSMetaClassBase::safeMetaCast(v8, gOSStringMetaClass)) {
        return -536870206;
      }
      long long v9 = *(void *)&message[3].msgh.msgh_size;
    }
    else
    {
      long long v9 = 0;
    }
    IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, uint64_t, mach_port_t *))func)(target, v9, &reply[2].msgh.msgh_local_port);
    if (!v3)
    {
      *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CD4F0;
      reply->msgh.uint32_t msgh_size = 76;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
      *(void *)&reply[1].msgh.msgh_bits = 24;
      *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
    }
  }
  return v3;
}

uint64_t IOServiceNotificationDispatchSource_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOServiceNotificationDispatchSourceMetaClass::New(IOServiceNotificationDispatchSourceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOServiceNotificationDispatchSource::Dispatch(IOServiceNotificationDispatchSource *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IOServiceNotificationDispatchSource::_Dispatch(this, &v3);
}

kern_return_t IOServiceNotificationDispatchSource::_Dispatch(IOServiceNotificationDispatchSource *self, const IORPC *rpc)
{
  uint64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  switch(msgid)
  {
    case 0xEF19D38D4F945FD0:
      IORPC v7 = *rpc;
      return IODispatchSource::CheckForWork_Invoke(&v7, self, (IODispatchSource::CheckForWork_Handler)IOServiceNotificationDispatchSource::CheckForWork_Impl);
    case 0xD963BB196F70BB93:
      IORPC v8 = *rpc;
      return IODispatchSource::Cancel_Invoke(&v8, self, (IODispatchSource::Cancel_Handler)IOServiceNotificationDispatchSource::Cancel_Impl);
    case 0xBB42C489FE4DEE8ELL:
      IORPC rpca = *rpc;
      return IODispatchSource::SetEnableWithCompletion_Invoke(&rpca, self, (IODispatchSource::SetEnableWithCompletion_Handler)IOServiceNotificationDispatchSource::SetEnableWithCompletion_Impl);
    default:
      IORPC v6 = *rpc;
      return IODispatchSource::_Dispatch(self, &v6);
  }
}

kern_return_t IOServiceNotificationDispatchSourceMetaClass::Dispatch(IOServiceNotificationDispatchSourceMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOServiceNotificationDispatchSource::Create_Call(OSDictionary *matching, uint64_t options, IODispatchQueue *queue, IOServiceNotificationDispatchSource **notification)
{
  kern_return_t v5;
  IOServiceNotificationDispatchSource *v6;
  BOOL v7;
  IORPC invoke;
  long long v10;
  long long v11;
  uint64_t v12;
  uint64_t v13;
  long long v14;
  const OSMetaClassBase *anObject[10];

  uint64_t v10 = 0u;
  uint64_t v11 = 0u;
  uint64_t v12 = 0;
  BOOL v14 = 0u;
  DWORD1(v1OSArraySetValueInternal(this, index, 0, 0) = 124;
  *(_OWORD *)((char *)anObject + 4) = xmmword_23D3CD700;
  *(const OSMetaClassBase **)((char *)&anObject[3] + 4) = gIOServiceNotificationDispatchSourceMetaClass;
  *(const OSMetaClassBase **)((char *)&anObject[2] + 4) = (const OSMetaClassBase *)3;
  *(void *)((char *)&v11 + 4) = 0x34DA2B68CLL;
  uint64_t v13 = 32;
  *(const OSMetaClassBase **)((char *)&anObject[4] + 4) = matching;
  *(const OSMetaClassBase **)((char *)&anObject[6] + 4) = (const OSMetaClassBase *)options;
  LODWORD(v14) = 16777472;
  LODWORD(anObject[0]) = 0;
  *(const OSMetaClassBase **)((char *)&anObject[5] + 4) = queue;
  invoke.message = (IORPCMessageMach *)&v10;
  invoke.reply = (IORPCMessageMach *)&v10;
  *(void *)&invoke.uint64_t sendSize = 0x8C0000007CLL;
  IORPC v5 = OSMetaClassBase::Invoke(gIOServiceNotificationDispatchSourceMetaClass, &invoke);
  if (!v5)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v10) == 72 && v13 == 0xB40D274E974E946ALL && DWORD2(v11) == 1 && *((void *)&v14 + 1) == 1)
    {
      IORPC v6 = (IOServiceNotificationDispatchSource *)OSMetaClassBase::safeMetaCast(anObject[0], gIOServiceNotificationDispatchSourceMetaClass);
      *notification = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = anObject[0] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOServiceNotificationDispatchSource::SetHandler(IOServiceNotificationDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IOServiceNotificationDispatchSource *v8;
  OSAction *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CD710;
  IORPC v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  long long v9 = action;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IOServiceNotificationDispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xCA55C48F95FC6F8ELL && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

void IOServiceNotificationDispatchSource::ServiceNotificationReady(IOServiceNotificationDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  DWORD1(v4) = 92;
  long long v8 = xmmword_23D3CD720;
  uint64_t v10 = action;
  uint64_t v9 = 2;
  *(void *)((char *)&v5 + 4) = 0x24DA2B68CLL;
  int v7 = 0;
  uint64_t v11 = action;
  invoke.message = (IORPCMessageMach *)&v4;
  invoke.reply = 0;
  *(void *)&invoke.uint64_t sendSize = 92;
  OSMetaClassBase::Invoke(action, &invoke);
}

kern_return_t IOServiceNotificationDispatchSource::CopyNextNotification(IOServiceNotificationDispatchSource *this, uint64_t *type, IOService **service, uint64_t *options, OSDispatchMethod supermethod)
{
  kern_return_t v8;
  kern_return_t v9;
  IOService *v11;
  BOOL v12;
  IORPC v13;
  void v14[3];
  long long v15;
  long long v16;
  uint64_t v17;
  long long v18;
  uint64_t v19;
  OSMetaClassBase *anObject;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0u;
  uint64_t v16 = 0u;
  uint64_t v17 = 0;
  DWORD1(v15) = 72;
  uint64_t v18 = xmmword_23D3CD730;
  long long v19 = 1;
  anObject = this;
  *(void *)((char *)&v16 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v14[0] = &v15;
    v14[1] = &v15;
    v14[2] = 0x9C00000048;
    long long v8 = ((uint64_t (*)(IOServiceNotificationDispatchSource *, void *))supermethod)(this, v14);
  }
  else
  {
    v13.message = (IORPCMessageMach *)&v15;
    v13.reply = (IORPCMessageMach *)&v15;
    *(void *)&v13.uint64_t sendSize = 0x9C00000048;
    long long v8 = OSMetaClassBase::Invoke(this, &v13);
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = -536870209;
    if (DWORD1(v15) == 88 && (void)v18 == 0xCA420ABBDA782780 && DWORD2(v16) == 1 && v19 == 1)
    {
      if (type) {
        *uint64_t type = v21;
      }
      uint64_t v11 = (IOService *)OSMetaClassBase::safeMetaCast(anObject, gIOServiceMetaClass);
      IOService *service = v11;
      if (v11) {
        uint64_t v12 = 1;
      }
      else {
        uint64_t v12 = anObject == 0;
      }
      if (v12) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = -536870206;
      }
      if (options) {
        *uint64_t options = v22;
      }
    }
  }
  return v9;
}

kern_return_t IOServiceNotificationDispatchSource::Create_Invoke(const IORPC *rpc, IOServiceNotificationDispatchSource::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v6;
  OSMetaClassBase *v7;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 3
    && *(void *)&message[3].msgh.msgh_bits == 3
    && rpc->sendSize >= 0x7C
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    long long v6 = *(const OSMetaClassBase **)&message[3].msgh.msgh_voucher_port;
    if ((!v6 || OSMetaClassBase::safeMetaCast(v6, gOSDictionaryMetaClass))
      && ((int v7 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh_body.msgh_descriptor_count, gIODispatchQueueMetaClass)) != 0|| !*(void *)&message[3].msgh_body.msgh_descriptor_count))
    {
      uint64_t v2 = ((uint64_t (*)(void, void, OSMetaClassBase *, mach_port_t *))func)(*(void *)&message[3].msgh.msgh_voucher_port, *(void *)&message[4].msgh.msgh_size, v7, &reply[2].msgh.msgh_remote_port);
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD740;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IOServiceNotificationDispatchSource::SetHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceNotificationDispatchSource::SetHandler_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    long long v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSActionMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD750;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOServiceNotificationDispatchSource::ServiceNotificationReady_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceNotificationDispatchSource::ServiceNotificationReady_Handler func)
{
  IORPC v4 = *rpc;
  return IOServiceNotificationDispatchSource::ServiceNotificationReady_Invoke(&v4, target, func, 0);
}

kern_return_t IOServiceNotificationDispatchSource::ServiceNotificationReady_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceNotificationDispatchSource::ServiceNotificationReady_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  const OSMetaClass *v8;
  OSMetaClassBase *v9;

  IORPC v4 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      long long v8 = targetActionClass;
    }
    else {
      long long v8 = gOSActionMetaClass;
    }
    uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v8);
    if (v9 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v9);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

kern_return_t IOServiceNotificationDispatchSource::CopyNextNotification_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceNotificationDispatchSource::CopyNextNotification_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x58)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_name_t *, mach_port_t *, mach_msg_body_t *))func)(target, &reply[2].msgh.msgh_voucher_port, &reply[2].msgh.msgh_remote_port, &reply[2].msgh_body);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD760;
      reply->msgh.uint32_t msgh_size = 88;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

const OSMetaClass *__cdecl IOServiceNotificationDispatchSource::getMetaClass(const IOServiceNotificationDispatchSource *this)
{
  return gIOServiceNotificationDispatchSourceMetaClass;
}

uint64_t IOServiceStateNotificationDispatchSource_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOServiceStateNotificationDispatchSourceMetaClass::New(IOServiceStateNotificationDispatchSourceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOServiceStateNotificationDispatchSource::Dispatch(IOServiceStateNotificationDispatchSource *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IOServiceStateNotificationDispatchSource::_Dispatch(this, &v3);
}

kern_return_t IOServiceStateNotificationDispatchSource::_Dispatch(IOServiceStateNotificationDispatchSource *self, const IORPC *rpc)
{
  uint64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  if (msgid == 0xD963BB196F70BB93)
  {
    IORPC v7 = *rpc;
    return IODispatchSource::Cancel_Invoke(&v7, self, (IODispatchSource::Cancel_Handler)IOServiceStateNotificationDispatchSource::Cancel_Impl);
  }
  else if (msgid == 0xBB42C489FE4DEE8ELL)
  {
    IORPC rpca = *rpc;
    return IODispatchSource::SetEnableWithCompletion_Invoke(&rpca, self, (IODispatchSource::SetEnableWithCompletion_Handler)IOServiceStateNotificationDispatchSource::SetEnableWithCompletion_Impl);
  }
  else
  {
    IORPC v6 = *rpc;
    return IODispatchSource::_Dispatch(self, &v6);
  }
}

kern_return_t IOServiceStateNotificationDispatchSourceMetaClass::Dispatch(IOServiceStateNotificationDispatchSourceMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t IOServiceStateNotificationDispatchSource::Create_Call(IOService *service, OSArray *items, IODispatchQueue *queue, IOServiceStateNotificationDispatchSource **source)
{
  kern_return_t v5;
  IOServiceStateNotificationDispatchSource *v6;
  BOOL v7;
  IORPC invoke;
  long long v10;
  long long v11;
  long long v12;
  int v13;
  unsigned char v14[24];
  int v15;
  long long v16;
  uint64_t v17;
  OSMetaClass *v18;
  IOService *v19;
  OSArray *v20;
  IODispatchQueue *v21;

  uint64_t v10 = 0u;
  uint64_t v11 = 0u;
  uint64_t v12 = 0u;
  *(_OWORD *)&v14[8] = 0u;
  DWORD1(v1OSArraySetValueInternal(this, index, 0, 0) = 136;
  uint64_t v16 = xmmword_23D3CD950;
  uint64_t v17 = 4;
  uint64_t v18 = gIOServiceStateNotificationDispatchSourceMetaClass;
  *(void *)((char *)&v11 + 4) = 0x44DA2B68CLL;
  uint64_t v13 = 0;
  *(void *)BOOL v14 = 40;
  long long v19 = service;
  uint64_t v20 = items;
  *(_DWORD *)&v14[8] = 16777472;
  uint64_t v15 = 0;
  uint64_t v21 = queue;
  invoke.message = (IORPCMessageMach *)&v10;
  invoke.reply = (IORPCMessageMach *)&v10;
  *(void *)&invoke.uint64_t sendSize = 0x8C00000088;
  IORPC v5 = OSMetaClassBase::Invoke(gIOServiceStateNotificationDispatchSourceMetaClass, &invoke);
  if (!v5)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v10) == 72
      && *((void *)&v12 + 1) == 0xDDFC03B5EB685059
      && DWORD2(v11) == 1
      && *(void *)&v14[4] == 1)
    {
      IORPC v6 = (IOServiceStateNotificationDispatchSource *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v14[12], gIOServiceStateNotificationDispatchSourceMetaClass);
      *source = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = *(void *)&v14[12] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOServiceStateNotificationDispatchSource::SetHandler(IOServiceStateNotificationDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IOServiceStateNotificationDispatchSource *v8;
  OSAction *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CD960;
  long long v8 = this;
  IORPC v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  uint64_t v9 = action;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IOServiceStateNotificationDispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0x91981670BC7B5188 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOServiceStateNotificationDispatchSource::StateNotificationBegin(IOServiceStateNotificationDispatchSource *this, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v3;
  void v4[3];
  unsigned char v5[40];
  long long v6;
  uint64_t v7;
  IOServiceStateNotificationDispatchSource *v8;
  uint64_t v9;

  uint64_t v9 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  *(_DWORD *)&v5[4] = 72;
  IORPC v6 = xmmword_23D3CD970;
  IORPC v7 = 1;
  long long v8 = this;
  *(void *)&v5[20] = 0x14DA2B68CLL;
  if (supermethod)
  {
    v4[0] = v5;
    v4[1] = v5;
    void v4[2] = 0x7800000048;
    double result = ((uint64_t (*)(IOServiceStateNotificationDispatchSource *, void *))supermethod)(this, v4);
    if (result) {
      return result;
    }
  }
  else
  {
    v3.message = (IORPCMessageMach *)v5;
    v3.reply = (IORPCMessageMach *)v5;
    *(void *)&v3.uint64_t sendSize = 0x7800000048;
    double result = OSMetaClassBase::Invoke(this, &v3);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v5[4] == 52 && *(void *)&v5[28] == 0xE0940D907A5FC5DCLL && !*(_DWORD *)&v5[24])
  {
    if (*(void *)((char *)&v6 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

void IOServiceStateNotificationDispatchSource::StateNotificationReady(IOServiceStateNotificationDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  long long v4 = 0u;
  long long v5 = 0u;
  long long v6 = 0u;
  DWORD1(v4) = 92;
  long long v8 = xmmword_23D3CD980;
  uint64_t v10 = action;
  uint64_t v9 = 2;
  *(void *)((char *)&v5 + 4) = 0x24DA2B68CLL;
  int v7 = 0;
  uint64_t v11 = action;
  invoke.message = (IORPCMessageMach *)&v4;
  invoke.reply = 0;
  *(void *)&invoke.uint64_t sendSize = 92;
  OSMetaClassBase::Invoke(action, &invoke);
}

kern_return_t IOServiceStateNotificationDispatchSource::Create_Invoke(const IORPC *rpc, IOServiceStateNotificationDispatchSource::Create_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v8;
  OSMetaClassBase *v9;
  OSMetaClassBase *v10;

  message = rpc->message;
  mach_msg_size_t msgh_descriptor_count = rpc->message->msgh_body.msgh_descriptor_count;
  double result = -536870209;
  if (msgh_descriptor_count == 4
    && *(void *)&message[3].msgh.msgh_local_port == 4
    && rpc->sendSize >= 0x88
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    long long v8 = *(const OSMetaClassBase **)&message[4].msgh.msgh_remote_port;
    if ((!v8 || OSMetaClassBase::safeMetaCast(v8, gOSArrayMetaClass))
      && ((uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[4].msgh.msgh_bits, gIOServiceMetaClass)) != 0|| !*(void *)&message[4].msgh.msgh_bits))
    {
      uint64_t v10 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[4].msgh.msgh_voucher_port, gIODispatchQueueMetaClass);
      if (v10 || (double result = -536870206, !*(void *)&message[4].msgh.msgh_voucher_port))
      {
        double result = ((uint64_t (*)(OSMetaClassBase *, void, OSMetaClassBase *, mach_port_t *))func)(v9, *(void *)&message[4].msgh.msgh_remote_port, v10, &reply[2].msgh.msgh_remote_port);
        if (!result)
        {
          *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CD990;
          reply->msgh.uint32_t msgh_size = 72;
          *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
          *(void *)&reply[2].msgh.msgh_bits = 1;
          reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
        }
      }
    }
    else
    {
      return -536870206;
    }
  }
  return result;
}

kern_return_t IOServiceStateNotificationDispatchSource::SetHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceStateNotificationDispatchSource::SetHandler_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    long long v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSActionMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD9A0;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOServiceStateNotificationDispatchSource::StateNotificationBegin_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceStateNotificationDispatchSource::StateNotificationBegin_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *))func)(target);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CD9B0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOServiceStateNotificationDispatchSource::StateNotificationReady_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceStateNotificationDispatchSource::StateNotificationReady_Handler func)
{
  IORPC v4 = *rpc;
  return IOServiceStateNotificationDispatchSource::StateNotificationReady_Invoke(&v4, target, func, 0);
}

kern_return_t IOServiceStateNotificationDispatchSource::StateNotificationReady_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOServiceStateNotificationDispatchSource::StateNotificationReady_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  const OSMetaClass *v8;
  OSMetaClassBase *v9;

  IORPC v4 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      long long v8 = targetActionClass;
    }
    else {
      long long v8 = gOSActionMetaClass;
    }
    uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v8);
    if (v9 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v9);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

const OSMetaClass *__cdecl IOServiceStateNotificationDispatchSource::getMetaClass(const IOServiceStateNotificationDispatchSource *this)
{
  return gIOServiceStateNotificationDispatchSourceMetaClass;
}

uint64_t IOTimerDispatchSource_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOTimerDispatchSourceMetaClass::New(IOTimerDispatchSourceMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOTimerDispatchSource::Dispatch(IOTimerDispatchSource *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IOTimerDispatchSource::_Dispatch(this, &v3);
}

kern_return_t IOTimerDispatchSource::_Dispatch(IOTimerDispatchSource *self, const IORPC *rpc)
{
  int64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  if (msgid > 0xF4AB1C3CBB5AE46)
  {
    switch(msgid)
    {
      case 0xF4AB1C3CBB5AE47:
        IORPC v12 = *rpc;
        return IOTimerDispatchSource::TimerOccurred_Invoke(&v12, self, (IOTimerDispatchSource::TimerOccurred_Handler)IOTimerDispatchSource::TimerOccurred_Impl, 0);
      case 0x1DA868F27D5D7D37:
        IORPC v8 = *rpc;
        return IOTimerDispatchSource::WakeAtTime_Invoke(&v8, self, (IOTimerDispatchSource::WakeAtTime_Handler)IOTimerDispatchSource::WakeAtTime_Impl);
      case 0x487F4F13F1A0A074:
        IORPC v11 = *rpc;
        return IOTimerDispatchSource::SetHandler_Invoke(&v11, self, (IOTimerDispatchSource::SetHandler_Handler)IOTimerDispatchSource::SetHandler_Impl);
    }
  }
  else
  {
    switch(msgid)
    {
      case 0xBB42C489FE4DEE8ELL:
        IORPC v10 = *rpc;
        return IODispatchSource::SetEnableWithCompletion_Invoke(&v10, self, (IODispatchSource::SetEnableWithCompletion_Handler)IOTimerDispatchSource::SetEnableWithCompletion_Impl);
      case 0xD963BB196F70BB93:
        IORPC v9 = *rpc;
        return IODispatchSource::Cancel_Invoke(&v9, self, (IODispatchSource::Cancel_Handler)IOTimerDispatchSource::Cancel_Impl);
      case 0xEF19D38D4F945FD0:
        IORPC rpca = *rpc;
        return IODispatchSource::CheckForWork_Invoke(&rpca, self, (IODispatchSource::CheckForWork_Handler)IOTimerDispatchSource::CheckForWork_Impl);
    }
  }
  IORPC v6 = *rpc;
  return IODispatchSource::_Dispatch(self, &v6);
}

kern_return_t IOTimerDispatchSource::SetHandler_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOTimerDispatchSource::SetHandler_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    IORPC v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSActionMetaClass);
    if (v8 || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, OSMetaClassBase *))func)(target, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CDBB0;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

kern_return_t IOTimerDispatchSource::WakeAtTime_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOTimerDispatchSource::WakeAtTime_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x60
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, void, void))func)(target, *(void *)&message[2].msgh.msgh_voucher_port, *(void *)&message[2].msgh_body.msgh_descriptor_count, *(void *)&message[3].msgh.msgh_size);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CDBC0;
      reply->msgh.uint32_t msgh_size = 52;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 1302509197;
      *(void *)&reply[1].msgh.msgh_voucher_port = 0;
    }
  }
  return result;
}

kern_return_t IOTimerDispatchSource::TimerOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOTimerDispatchSource::TimerOccurred_Handler func)
{
  IORPC v4 = *rpc;
  return IOTimerDispatchSource::TimerOccurred_Invoke(&v4, target, func, 0);
}

kern_return_t IOTimerDispatchSourceMetaClass::Dispatch(IOTimerDispatchSourceMetaClass *this, const IORPC *rpc)
{
  if (IORPCMessageFromMach(rpc->message, 0)->msgid == 0x5703101BA090EAF0)
  {
    IORPC rpca = *rpc;
    return IOTimerDispatchSource::Create_Invoke(&rpca, IOTimerDispatchSource::Create_Impl);
  }
  else
  {
    IORPC v5 = *rpc;
    return OSMetaClassBase::Dispatch(this, &v5);
  }
}

kern_return_t IOTimerDispatchSource::Create_Invoke(const IORPC *rpc, IOTimerDispatchSource::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  uint64_t v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x5C
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    if (OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIODispatchQueueMetaClass)
      || !*(void *)&message[3].msgh.msgh_bits)
    {
      uint64_t v2 = ((uint64_t (*)(void))func)();
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CDBD0;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t IOTimerDispatchSource::Create(IODispatchQueue *queue, IOTimerDispatchSource **source)
{
  kern_return_t v3;
  IOTimerDispatchSource *v4;
  BOOL v5;
  IORPC invoke;
  long long v8;
  long long v9;
  long long v10;
  int v11;
  unsigned char anObject[24];
  OSMetaClass *v13;
  IODispatchQueue *v14;

  IORPC v8 = 0u;
  IORPC v9 = 0u;
  IORPC v10 = 0u;
  DWORD1(v8) = 92;
  *(_OWORD *)anObject = xmmword_23D3CDBE0;
  uint64_t v13 = gIOTimerDispatchSourceMetaClass;
  *(void *)&anObject[16] = 2;
  *(void *)((char *)&v9 + 4) = 0x24DA2B68CLL;
  IORPC v11 = 0;
  BOOL v14 = queue;
  invoke.message = (IORPCMessageMach *)&v8;
  invoke.reply = (IORPCMessageMach *)&v8;
  *(void *)&invoke.uint64_t sendSize = 0x8C0000005CLL;
  IORPC v3 = OSMetaClassBase::Invoke(gIOTimerDispatchSourceMetaClass, &invoke);
  if (!v3)
  {
    IORPC v3 = -536870209;
    if (DWORD1(v8) == 72
      && *((void *)&v10 + 1) == 0x5703101BA090EAF0
      && DWORD2(v9) == 1
      && *(void *)&anObject[4] == 1)
    {
      IORPC v4 = (IOTimerDispatchSource *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&anObject[12], gIOTimerDispatchSourceMetaClass);
      *source = v4;
      if (v4) {
        IORPC v5 = 1;
      }
      else {
        IORPC v5 = *(void *)&anObject[12] == 0;
      }
      if (v5) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v3;
}

kern_return_t IOTimerDispatchSource::SetHandler(IOTimerDispatchSource *this, OSAction *action, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v4;
  void v5[3];
  _DWORD v6[17];
  uint64_t v7;
  IOTimerDispatchSource *v8;
  OSAction *v9;

  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CDBF0;
  IORPC v8 = this;
  int v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  IORPC v9 = action;
  if (supermethod)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    double result = ((uint64_t (*)(IOTimerDispatchSource *, void *))supermethod)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint64_t sendSize = 0x780000005CLL;
    double result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (v6[1] == 52 && *(void *)&v6[7] == 0x487F4F13F1A0A074 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOTimerDispatchSource::WakeAtTime(IOTimerDispatchSource *this, uint64_t options, uint64_t deadline, uint64_t leeway, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v6;
  void v7[3];
  unsigned char v8[40];
  long long v9;
  uint64_t v10;
  IOTimerDispatchSource *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  uint64_t v15 = *MEMORY[0x263EF8340];
  memset(v8, 0, sizeof(v8));
  *(_DWORD *)&v8[4] = 96;
  IORPC v9 = xmmword_23D3CDC00;
  IORPC v10 = 1;
  IORPC v11 = this;
  *(void *)&v8[20] = 0x14DA2B68CLL;
  IORPC v12 = options;
  uint64_t v13 = deadline;
  BOOL v14 = leeway;
  if (supermethod)
  {
    v7[0] = v8;
    v7[1] = v8;
    void v7[2] = 0x7800000060;
    double result = ((uint64_t (*)(IOTimerDispatchSource *, void *))supermethod)(this, v7);
    if (result) {
      return result;
    }
  }
  else
  {
    v6.message = (IORPCMessageMach *)v8;
    v6.reply = (IORPCMessageMach *)v8;
    *(void *)&v6.uint64_t sendSize = 0x7800000060;
    double result = OSMetaClassBase::Invoke(this, &v6);
    if (result) {
      return result;
    }
  }
  double result = -536870209;
  if (*(_DWORD *)&v8[4] == 52 && *(void *)&v8[28] == 0x1DA868F27D5D7D37 && !*(_DWORD *)&v8[24])
  {
    if (*(void *)((char *)&v9 + 4)) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t IOTimerDispatchSource::TimerOccurred(IOTimerDispatchSource *this, IORPC *rpc, OSAction *action, uint64_t time, OSDispatchMethod supermethod)
{
  reply = rpc->reply;
  *(_OWORD *)&reply->msgh.msgh_bits = 0u;
  *(_OWORD *)&reply->msgh.msgh_voucher_port = 0u;
  *(_OWORD *)&reply[1].msgh.uint32_t msgh_size = 0u;
  reply->msgh.uint32_t msgh_size = 100;
  *(_OWORD *)&reply[1].msgh_body.mach_msg_size_t msgh_descriptor_count = xmmword_23D3CDC10;
  *(void *)&reply[2].msgh.mach_msg_id_t msgh_id = action;
  *(void *)&reply[2].msgh.msgh_local_port = 2;
  *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x24DA2B68CLL;
  reply[1].msgh.mach_msg_id_t msgh_id = 0;
  *(void *)&reply[3].msgh.msgh_bits = action;
  *(void *)&reply[3].msgh.mach_port_t msgh_remote_port = time;
  return 0;
}

kern_return_t IOTimerDispatchSource::TimerOccurred_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOTimerDispatchSource::TimerOccurred_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  const OSMetaClass *v8;
  OSMetaClassBase *v9;

  IORPC v4 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x64
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      IORPC v8 = targetActionClass;
    }
    else {
      IORPC v8 = gOSActionMetaClass;
    }
    IORPC v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v8);
    if (v9 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *, void))func)(target, v9, *(void *)&message[3].msgh.msgh_remote_port);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

uint64_t IOUserClient_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t IOUserClientMetaClass::New(IOUserClientMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t IOUserClient::Dispatch(IOUserClient *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return IOUserClient::_Dispatch(this, &v3);
}

kern_return_t IOUserClient::_Dispatch(IOUserClient *self, const IORPC *rpc)
{
  uint64_t msgid = IORPCMessageFromMach(rpc->message, 0)->msgid;
  if (msgid == 0xCFE0C99E739D92F9)
  {
    IORPC v7 = *rpc;
    return IOUserClient::_ExternalMethod_Invoke(&v7, self, (IOUserClient::_ExternalMethod_Handler)IOUserClient::_ExternalMethod_Impl);
  }
  else if (msgid == 0xCAF3BD8932C8486FLL)
  {
    IORPC rpca = *rpc;
    return IOUserClient::CopyClientEntitlements_Invoke(&rpca, self, (IOUserClient::CopyClientEntitlements_Handler)IOUserClient::CopyClientEntitlements_Impl);
  }
  else
  {
    IORPC v6 = *rpc;
    return IOService::_Dispatch(self, &v6);
  }
}

kern_return_t IOUserClient::CopyClientEntitlements_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserClient::CopyClientEntitlements_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *reply;

  double result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && rpc->replySize >= 0x4C)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, mach_port_t *))func)(target, &reply[2].msgh.msgh_local_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CDDE0;
      reply->msgh.uint32_t msgh_size = 76;
      *(void *)&reply->msgh.mach_msg_id_t msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
      *(void *)&reply[1].msgh.msgh_bits = 24;
      *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
    }
  }
  return result;
}

kern_return_t IOUserClient::_ExternalMethod_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserClient::_ExternalMethod_Handler func)
{
  kern_return_t result;
  const OSMetaClassBase *v13;
  OSMetaClassBase *v14;
  OSMetaClassBase *v15;
  OSMetaClassBase *v16;
  mach_port_name_t v17;

  message = rpc->message;
  reply = rpc->reply;
  uint32_t sendSize = rpc->sendSize;
  uint32_t replySize = rpc->replySize;
  unsigned int msgh_id = rpc->message[10].msgh.msgh_id;
  if (msgh_id >= 0x10) {
    uint64_t v8 = 16;
  }
  else {
    uint64_t v8 = msgh_id;
  }
  unsigned int msgh_descriptor_count = message[10].msgh_body.msgh_descriptor_count;
  if (msgh_descriptor_count >= 0x10) {
    unsigned int msgh_descriptor_count = 16;
  }
  uint64_t v17 = msgh_descriptor_count;
  double result = -536870209;
  if (message->msgh_body.msgh_descriptor_count == 5
    && *(void *)&message[3].msgh_body.msgh_descriptor_count == 5
    && sendSize >= 0x13C
    && replySize >= 0xDC)
  {
    uint64_t v13 = *(const OSMetaClassBase **)&message[4].msgh.msgh_local_port;
    if ((!v13 || OSMetaClassBase::safeMetaCast(v13, gOSDataMetaClass))
      && ((BOOL v14 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[4].msgh.msgh_id, gIOMemoryDescriptorMetaClass)) != 0|| !*(void *)&message[4].msgh.msgh_id)&& ((v15 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[5].msgh.msgh_bits, gIOMemoryDescriptorMetaClass)) != 0|| !*(void *)&message[5].msgh.msgh_bits))
    {
      uint64_t v16 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[5].msgh.msgh_remote_port, gOSActionMetaClass);
      if (v16 || (double result = -536870206, !*(void *)&message[5].msgh.msgh_remote_port))
      {
        double result = ((uint64_t (*)(OSMetaClassBase *, void, mach_msg_size_t *, uint64_t, void, OSMetaClassBase *, IORPCMessageMach *, mach_port_name_t *, void, mach_port_t *, OSMetaClassBase *, OSMetaClassBase *))func)(target, *(void *)&message[5].msgh.msgh_voucher_port, &message[6].msgh.msgh_size, v8, *(void *)&message[4].msgh.msgh_local_port, v14, &reply[3], &v17, *(void *)&message[11].msgh.msgh_bits, &reply[2].msgh.msgh_local_port, v15, v16);
        if (!result)
        {
          *(_OWORD *)&reply[1].msgh.msgh_voucher_port = xmmword_23D3CDDF0;
          reply->msgh.uint32_t msgh_size = 220;
          *(void *)&reply->msgh.unsigned int msgh_id = 0x14DA2B68DLL;
          *(void *)&reply[2].msgh.uint32_t msgh_size = 1;
          reply[7].msgh.msgh_voucher_port = v17;
          *(void *)&reply[1].msgh.msgh_bits = 24;
          *(void *)&reply[1].msgh.mach_port_t msgh_remote_port = reply[1].msgh.msgh_remote_port & 0xFF00FF | 0x1000100;
        }
      }
    }
    else
    {
      return -536870206;
    }
  }
  return result;
}

kern_return_t IOUserClientMetaClass::Dispatch(IOUserClientMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

void IOUserClient::AsyncCompletion(IOUserClient *this, OSAction *action, IOReturn status, const unint64_t *asyncData, uint32_t asyncDataCount, OSDispatchMethod supermethod)
{
  int v20 = 0;
  long long v19 = 0u;
  memset(v18, 0, sizeof(v18));
  long long v11 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  DWORD1(v9) = 244;
  long long v13 = xmmword_23D3CDE00;
  uint64_t v15 = action;
  uint64_t v14 = 2;
  *(void *)((char *)&v10 + 4) = 0x24DA2B68CLL;
  int v12 = 0;
  uint64_t v16 = action;
  IOReturn v17 = status;
  if (asyncDataCount <= 0x10)
  {
    memcpy((char *)v18 + 12, asyncData, 8 * asyncDataCount);
    HIDWORD(v19) = asyncDataCount;
    invoke.message = (IORPCMessageMach *)&v9;
    invoke.reply = 0;
    *(void *)&invoke.uint32_t sendSize = 244;
    OSMetaClassBase::Invoke(action, &invoke);
  }
}

kern_return_t IOUserClient::CopyClientMemoryForType(IOUserClient *this, uint64_t type, uint64_t *options, IOMemoryDescriptor **memory, OSDispatchMethod supermethod)
{
  kern_return_t v7;
  kern_return_t v8;
  IOMemoryDescriptor *v9;
  BOOL v10;
  IORPC v12;
  void v13[3];
  long long v14;
  long long v15;
  uint64_t v16;
  long long v17;
  uint64_t v18;
  OSMetaClassBase *anObject;
  uint64_t v20;
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0u;
  uint64_t v15 = 0u;
  uint64_t v16 = 0;
  DWORD1(v14) = 80;
  IOReturn v17 = xmmword_23D3CDE10;
  uint64_t v18 = 1;
  anObject = this;
  *(void *)((char *)&v15 + 4) = 0x14DA2B68CLL;
  int v20 = type;
  if (supermethod)
  {
    v13[0] = &v14;
    v13[1] = &v14;
    void v13[2] = 0x9400000050;
    IORPC v7 = ((uint64_t (*)(IOUserClient *, void *))supermethod)(this, v13);
  }
  else
  {
    v12.message = (IORPCMessageMach *)&v14;
    v12.reply = (IORPCMessageMach *)&v14;
    *(void *)&v12.uint32_t sendSize = 0x9400000050;
    IORPC v7 = OSMetaClassBase::Invoke(this, &v12);
  }
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = -536870209;
    if (DWORD1(v14) == 80 && (void)v17 == 0x8399BDB3D0B4F474 && DWORD2(v15) == 1 && v18 == 1)
    {
      if (options) {
        *uint64_t options = v20;
      }
      long long v9 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOMemoryDescriptorMetaClass);
      *memory = v9;
      if (v9) {
        long long v10 = 1;
      }
      else {
        long long v10 = anObject == 0;
      }
      if (v10) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v8;
}

kern_return_t IOUserClient::CreateMemoryDescriptorFromClient(IOUserClient *this, uint64_t memoryDescriptorCreateOptions, uint32_t segmentsCount, const IOAddressSegment *segments, IOMemoryDescriptor **memory, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IOMemoryDescriptor *v13;
  BOOL v14;
  IORPC invoke;
  void v16[3];
  unsigned char v17[4];
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  OSMetaClassBase *anObject;
  uint64_t v23;
  uint32_t v24;
  uint64_t v25;

  bzero(v17, 0x260uLL);
  uint64_t v18 = 608;
  int v20 = 0xF2FA2FAA5CC11191;
  uint64_t v21 = 1;
  anObject = this;
  long long v19 = 0x14DA2B68CLL;
  uint64_t v23 = memoryDescriptorCreateOptions;
  int v24 = segmentsCount;
  if (segmentsCount > 0x20) {
    return -536870168;
  }
  memcpy(&v25, segments, 16 * segmentsCount);
  if (supermethod)
  {
    v16[0] = v17;
    v16[1] = v17;
    v16[2] = 0x8C00000260;
    double result = ((uint64_t (*)(IOUserClient *, void *))supermethod)(this, v16);
    if (result) {
      return result;
    }
  }
  else
  {
    invoke.message = (IORPCMessageMach *)v17;
    invoke.reply = (IORPCMessageMach *)v17;
    *(void *)&invoke.uint32_t sendSize = 0x8C00000260;
    double result = OSMetaClassBase::Invoke(this, &invoke);
    if (result) {
      return result;
    }
  }
  if (v18 != 72 || v20 != 0xF2FA2FAA5CC11191 || HIDWORD(v19) != 1) {
    return -536870209;
  }
  double result = -536870209;
  if (v21 == 1)
  {
    long long v13 = (IOMemoryDescriptor *)OSMetaClassBase::safeMetaCast(anObject, gIOMemoryDescriptorMetaClass);
    *memory = v13;
    if (v13) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = anObject == 0;
    }
    if (v14) {
      return 0;
    }
    else {
      return -536870206;
    }
  }
  return result;
}

kern_return_t IOUserClient::CopyClientEntitlements(IOUserClient *this, OSDictionary **entitlements, OSDispatchMethod supermethod)
{
  kern_return_t v4;
  kern_return_t v5;
  OSDictionary *v6;
  BOOL v7;
  IORPC v9;
  void v10[3];
  long long v11;
  long long v12;
  uint64_t v13;
  long long v14;
  unsigned char v15[20];
  uint64_t v16;

  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  int v12 = 0u;
  long long v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  uint64_t v14 = xmmword_23D3CDE20;
  *(void *)uint64_t v15 = 1;
  *(void *)&v15[8] = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x9000000048;
    IORPC v4 = ((uint64_t (*)(IOUserClient *, void *))supermethod)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint32_t sendSize = 0x9000000048;
    IORPC v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  IORPC v5 = v4;
  if (!v4)
  {
    IORPC v5 = -536870209;
    if (DWORD1(v11) == 76
      && *(void *)((char *)&v14 + 4) == 0xCAF3BD8932C8486FLL
      && DWORD2(v12) == 1
      && *(void *)&v15[4] == 1)
    {
      IORPC v6 = (OSDictionary *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&v15[12], gOSDictionaryMetaClass);
      *entitlements = v6;
      if (v6) {
        IORPC v7 = 1;
      }
      else {
        IORPC v7 = *(void *)&v15[12] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v5;
}

kern_return_t IOUserClient::_ExternalMethod(IOUserClient *this, uint64_t selector, const unint64_t *scalarInput, uint32_t scalarInputCount, OSData *structureInput, IOMemoryDescriptor *structureInputDescriptor, unint64_t *scalarOutput, uint32_t *scalarOutputCount, uint64_t structureOutputMaximumSize, OSData **structureOutput, IOMemoryDescriptor *structureOutputDescriptor, OSAction *completion, OSDispatchMethod supermethod)
{
  kern_return_t v13;
  kern_return_t v20;
  uint32_t v21;
  uint32_t v22;
  OSData *v23;
  BOOL v24;
  IORPC v26;
  void v27[3];
  long long v28;
  long long v29;
  _OWORD v30[11];
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  _OWORD v36[3];

  long long v35 = 0u;
  memset(v36, 0, 28);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v13 = -536870168;
  int v29 = 0u;
  memset(v30, 0, sizeof(v30));
  uint64_t v28 = 0u;
  DWORD1(v28) = 316;
  *(void *)((char *)&v30[3] + 12) = 0xCFE0C99E739D92F9;
  *(void *)((char *)&v30[5] + 4) = this;
  *(void *)((char *)&v30[4] + 12) = 5;
  *(void *)((char *)&v29 + 4) = 0x54DA2B68CLL;
  *(void *)((char *)&v30[7] + 12) = selector;
  if (scalarInputCount <= 0x10)
  {
    memcpy((char *)&v30[8] + 12, scalarInput, 8 * scalarInputCount);
    HIDWORD(v36[0]) = scalarInputCount;
    *((void *)&v30[0] + IOExtensiblePaniclog::free(this - 1) = 32;
    *(void *)((char *)&v30[5] + 12) = structureInput;
    LODWORD(v30[1]) = 16777472;
    LODWORD(v30[2]) = 0;
    *(void *)((char *)&v30[6] + 4) = structureInputDescriptor;
    if (*scalarOutputCount <= 0x10)
    {
      LODWORD(v36[1]) = *scalarOutputCount;
      *(void *)((char *)&v36[1] + 4) = structureOutputMaximumSize;
      *(_OWORD *)((char *)&v30[6] + 12) = __PAIR128__((unint64_t)completion, (unint64_t)structureOutputDescriptor);
      HIDWORD(v30[2]) = 0;
      DWORD2(v30[3]) = 0;
      if (supermethod)
      {
        v27[0] = &v28;
        v27[1] = &v28;
        _OWORD v27[2] = 0x1200000013CLL;
        int v20 = ((uint64_t (*)(IOUserClient *, void *))supermethod)(this, v27);
      }
      else
      {
        v26.message = (IORPCMessageMach *)&v28;
        v26.reply = (IORPCMessageMach *)&v28;
        *(void *)&v26.uint32_t sendSize = 0x1200000013CLL;
        int v20 = OSMetaClassBase::Invoke(this, &v26);
      }
      long long v13 = v20;
      if (!v20)
      {
        long long v13 = -536870209;
        if (DWORD1(v28) == 220
          && *(void *)((char *)v30 + 12) == 0xCFE0C99E739D92F9
          && DWORD2(v29) == 1
          && *(void *)((char *)&v30[1] + 12) == 1)
        {
          uint64_t v21 = DWORD1(v31);
          uint64_t v22 = *scalarOutputCount;
          if (DWORD1(v31) < *scalarOutputCount)
          {
            *scalarOutputCount = DWORD1(v31);
            uint64_t v22 = v21;
          }
          memcpy(scalarOutput, (char *)&v30[3] + 4, 8 * v22);
          uint64_t v23 = (OSData *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)((char *)&v30[2] + 4), gOSDataMetaClass);
          *structureOutput = v23;
          if (v23) {
            int v24 = 1;
          }
          else {
            int v24 = *(void *)((char *)&v30[2] + 4) == 0;
          }
          if (v24) {
            return 0;
          }
          else {
            return -536870206;
          }
        }
      }
    }
  }
  return v13;
}

kern_return_t IOUserClient::CreateActionKernelCompletion(IOUserClient *this, size_t referenceSize, OSAction **action)
{
  kern_return_t v8;

  IORPC v6 = OSString::withCString("OSAction_IOUserClient_KernelCompletion");
  if (!v6) {
    return -536870211;
  }
  IORPC v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0xF609F134C9046444, 0xDBC5B2E5D2B446F4, referenceSize, v6, action);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

kern_return_t IOUserClient::AsyncCompletion_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserClient::AsyncCompletion_Handler func)
{
  IORPC v4 = *rpc;
  return IOUserClient::AsyncCompletion_Invoke(&v4, target, func, 0);
}

kern_return_t IOUserClient::AsyncCompletion_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserClient::AsyncCompletion_Handler func, const OSMetaClass *targetActionClass)
{
  kern_return_t v4;
  IORPCMessageMach *message;
  mach_port_t msgh_local_port;
  uint64_t v7;
  const OSMetaClass *v10;
  OSMetaClassBase *v11;

  IORPC v4 = -536870209;
  message = rpc->message;
  msgh_local_port = rpc->message[8].msgh.msgh_local_port;
  if (msgh_local_port >= 0x10) {
    IORPC v7 = 16;
  }
  else {
    IORPC v7 = msgh_local_port;
  }
  if (message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0xF4
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    if (targetActionClass) {
      long long v10 = targetActionClass;
    }
    else {
      long long v10 = gOSActionMetaClass;
    }
    long long v11 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, v10);
    if (v11 || !*(void *)&message[3].msgh.msgh_bits)
    {
      ((void (*)(OSMetaClassBase *, OSMetaClassBase *, void, mach_msg_body_t *, uint64_t))func)(target, v11, message[3].msgh.msgh_remote_port, &message[3].msgh_body, v7);
      return 0;
    }
    else
    {
      return -536870206;
    }
  }
  return v4;
}

kern_return_t IOUserClient::CopyClientMemoryForType_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserClient::CopyClientMemoryForType_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x50
    && rpc->replySize >= 0x50)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, mach_port_name_t *, mach_port_t *))func)(target, *(void *)&message[2].msgh.msgh_voucher_port, &reply[2].msgh.msgh_voucher_port, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CDE30;
      reply->msgh.uint32_t msgh_size = 80;
      *(void *)&reply->msgh.unsigned int msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

kern_return_t IOUserClient::CreateMemoryDescriptorFromClient_Invoke(const IORPC *rpc, OSMetaClassBase *target, IOUserClient::CreateMemoryDescriptorFromClient_Handler func)
{
  kern_return_t result;
  IORPCMessageMach *message;
  mach_msg_size_t msgh_descriptor_count;
  uint64_t v8;
  IORPCMessageMach *reply;

  double result = -536870209;
  message = rpc->message;
  unsigned int msgh_descriptor_count = rpc->message[2].msgh_body.msgh_descriptor_count;
  if (msgh_descriptor_count >= 0x20) {
    uint64_t v8 = 32;
  }
  else {
    uint64_t v8 = msgh_descriptor_count;
  }
  if (message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x260
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    double result = ((uint64_t (*)(OSMetaClassBase *, void, uint64_t, mach_port_t *, mach_port_t *))func)(target, *(void *)&message[2].msgh.msgh_voucher_port, v8, &message[3].msgh.msgh_local_port, &reply[2].msgh.msgh_remote_port);
    if (!result)
    {
      *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CDE40;
      reply->msgh.uint32_t msgh_size = 72;
      *(void *)&reply->msgh.unsigned int msgh_id = 0x14DA2B68DLL;
      *(void *)&reply[2].msgh.msgh_bits = 1;
      reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
    }
  }
  return result;
}

uint64_t OSAction_IOUserClient_KernelCompletion_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSAction_IOUserClient_KernelCompletionMetaClass::New(OSAction_IOUserClient_KernelCompletionMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t OSAction_IOUserClient_KernelCompletion::Dispatch(OSAction_IOUserClient_KernelCompletion *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&rpca.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  rpca.message = message;
  return OSAction::_Dispatch(this, &rpca);
}

kern_return_t OSAction_IOUserClient_KernelCompletion::_Dispatch(OSAction_IOUserClient_KernelCompletion *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSAction::_Dispatch(self, &v5);
}

kern_return_t OSAction_IOUserClient_KernelCompletionMetaClass::Dispatch(OSAction_IOUserClient_KernelCompletionMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

const OSMetaClass *__cdecl OSAction_IOUserClient_KernelCompletion::getMetaClass(const OSAction_IOUserClient_KernelCompletion *this)
{
  return gOSAction_IOUserClient_KernelCompletionMetaClass;
}

uint64_t IOUserServer_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F1183A0;
  return 0;
}

uint64_t IOUserServerMetaClass::New(IOUserServerMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F1183F8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F118440;
  return 0;
}

uint64_t IOUserServer::Dispatch(IORPC *this, IORPC *a2, IORPC *a3)
{
  IORPC v4 = *a2;
  return IOUserServer::_Dispatch(this, &v4.message, a3);
}

uint64_t IOUserServer::_Dispatch(IORPC *this, IORPCMessageMach **a2, IORPC *a3)
{
  uint64_t msgid = IORPCMessageFromMach(*a2, 0)->msgid;
  if (msgid == 0xD96F074A91A53982)
  {
    long long v9 = *(_OWORD *)a2;
    long long v10 = a2[2];
    return IOUserServer::LoadModule_Invoke((IOUserServer *)&v9, this, (OSMetaClassBase *)IOUserServer::LoadModule_Impl, v5);
  }
  else if (msgid == 0xE949D58832EBE980)
  {
    long long v11 = *(_OWORD *)a2;
    int v12 = a2[2];
    return IOUserServer::Exit_Invoke((IOUserServer *)&v11, this, (OSMetaClassBase *)IOUserServer::Exit_Impl, v5);
  }
  else
  {
    IORPC v8 = *(IORPC *)a2;
    return IOService::_Dispatch((IOService *)this, &v8);
  }
}

uint64_t IOUserServer::Exit_Invoke(IOUserServer *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, const char *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(v5 + 56) == 1
    && *((_DWORD *)this + 4) >= 0x450u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    uint64_t v9 = v5 + 80;
    if (strnlen((const char *)(v5 + 80), 0x400uLL) <= 0x3FF)
    {
      uint64_t v4 = ((uint64_t (*)(IORPC *, uint64_t))a3)(a2, v9);
      if (!v4)
      {
        *(_OWORD *)(v8 + 28) = xmmword_23D3CE210;
        *(_DWORD *)(v8 + 4) = 52;
        *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
        *(void *)(v8 + 44) = 0;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v4;
}

uint64_t IOUserServer::LoadModule_Invoke(IOUserServer *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, const char *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(v5 + 56) == 1
    && *((_DWORD *)this + 4) >= 0x450u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    uint64_t v9 = v5 + 80;
    if (strnlen((const char *)(v5 + 80), 0x400uLL) <= 0x3FF)
    {
      uint64_t v4 = ((uint64_t (*)(IORPC *, uint64_t))a3)(a2, v9);
      if (!v4)
      {
        *(_OWORD *)(v8 + 28) = xmmword_23D3CE220;
        *(_DWORD *)(v8 + 4) = 52;
        *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
        *(void *)(v8 + 44) = 0;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v4;
}

uint64_t IOUserServerMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t IOUserServer::Create(IOUserServer *this, const char *a2, uint64_t a3, uint64_t a4, OSString *a5, IOUserServer **a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  anObject[0] = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v25 = 0u;
  uint64_t v17 = 0;
  DWORD1(v15) = 184;
  unint64_t v20 = 0xC1DBAEE5E75E22B9;
  anObject[1] = (OSMetaClassBase *)2;
  uint64_t v22 = gIOUserServerMetaClass;
  *(void *)((char *)&v16 + 4) = 0x24DA2B68CLL;
  uint64_t v26 = 0;
  memset(v24, 0, sizeof(v24));
  strlcpy(&v24[8], (const char *)this, 0x40uLL);
  *((void *)&v25 + IOExtensiblePaniclog::free(this - 1) = a2;
  uint64_t v26 = a3;
  uint64_t v19 = 16777472;
  uint64_t v18 = 32;
  uint64_t v23 = a4;
  invoke.message = (IORPCMessageMach *)&v15;
  invoke.reply = (IORPCMessageMach *)&v15;
  *(void *)&invoke.uint32_t sendSize = 0x8C000000B8;
  uint64_t v10 = OSMetaClassBase::Invoke((OSMetaClassBase *)gIOUserServerMetaClass, &invoke);
  if (!v10)
  {
    uint64_t v10 = 3758097087;
    if (DWORD1(v15) == 72 && v18 == 0xC1DBAEE5E75E22B9 && DWORD2(v16) == 1 && v20 == 1)
    {
      long long v11 = OSMetaClassBase::safeMetaCast(anObject[0], (const OSMetaClass *)gIOUserServerMetaClass);
      a5->OSContainer::OSObject::OSMetaClassBase::__vftable = (OSString_vtbl *)v11;
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = anObject[0] == 0;
      }
      if (v12) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v10;
}

uint64_t IOUserServer::Exit(OSMetaClassBase *this, const char *a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  bzero(v9, 0x450uLL);
  int v10 = 1104;
  long long v13 = xmmword_23D3CE230;
  uint64_t v14 = 1;
  long long v15 = this;
  uint64_t v11 = 0x14DA2B68CLL;
  uint64_t v16 = 0;
  strlcpy(v17, a2, 0x400uLL);
  if (a3)
  {
    v8[0] = v9;
    v8[1] = v9;
    int v8[2] = 0x7800000450;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v8);
    if (result) {
      return result;
    }
  }
  else
  {
    invoke.message = (IORPCMessageMach *)v9;
    invoke.reply = (IORPCMessageMach *)v9;
    *(void *)&invoke.uint32_t sendSize = 0x7800000450;
    uint64_t result = OSMetaClassBase::Invoke(this, &invoke);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (v10 == 52 && v12 == 0xE949D58832EBE980 && !HIDWORD(v11))
  {
    if (*(void *)((char *)&v13 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOUserServer::LoadModule(OSMetaClassBase *this, const char *a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  bzero(v9, 0x450uLL);
  int v10 = 1104;
  long long v13 = xmmword_23D3CE240;
  uint64_t v14 = 1;
  long long v15 = this;
  uint64_t v11 = 0x14DA2B68CLL;
  uint64_t v16 = 0;
  strlcpy(v17, a2, 0x400uLL);
  if (a3)
  {
    v8[0] = v9;
    v8[1] = v9;
    int v8[2] = 0x7800000450;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v8);
    if (result) {
      return result;
    }
  }
  else
  {
    invoke.message = (IORPCMessageMach *)v9;
    invoke.reply = (IORPCMessageMach *)v9;
    *(void *)&invoke.uint32_t sendSize = 0x7800000450;
    uint64_t result = OSMetaClassBase::Invoke(this, &invoke);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (v10 == 52 && v12 == 0xD96F074A91A53982 && !HIDWORD(v11))
  {
    if (*(void *)((char *)&v13 + 4)) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOUserServer::Create_Invoke(IOUserServer *this, IORPC *a2, int (*a3)(const char *, unint64_t, unint64_t, OSString *, IOUserServer **))
{
  uint64_t v3 = 3758097087;
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v4 + 72) == 2
    && *((_DWORD *)this + 4) >= 0xB8u
    && *((_DWORD *)this + 5) >= 0x48u)
  {
    uint64_t v6 = *((void *)this + 1);
    IORPC v7 = *(const OSMetaClassBase **)(v4 + 88);
    if ((!v7 || OSMetaClassBase::safeMetaCast(v7, gOSStringMetaClass))
      && strnlen((const char *)(v4 + 104), 0x40uLL) <= 0x3F)
    {
      uint64_t v3 = ((uint64_t (*)(uint64_t, void, void, void, uint64_t))a2)(v4 + 104, *(void *)(v4 + 168), *(void *)(v4 + 176), *(void *)(v4 + 88), v6 + 64);
      if (!v3)
      {
        *(_OWORD *)(v6 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CE250;
        *(_DWORD *)(v6 + 4) = 72;
        *(void *)(v6 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
        *(void *)(v6 + 56) = 1;
        *(_DWORD *)(v6 + 36) &= 0xFFFFFFu;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v3;
}

uint64_t IOWorkGroup_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F118550;
  return 0;
}

uint64_t IOWorkGroupMetaClass::New(IOWorkGroupMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F1185A8;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F1185F0;
  return 0;
}

void IOWorkGroup::Dispatch(IORPC *this, IORPC *a2, IORPC *a3)
{
  IORPC v3 = *a2;
  IOWorkGroup::_Dispatch(this, (IOWorkGroup *)&v3, a3);
}

void IOWorkGroup::_Dispatch(IORPC *this, IOWorkGroup *a2, IORPC *a3)
{
  if (IORPCMessageFromMach(*(IORPCMessageMach **)a2, 0)->msgid == 0x8FFAC48189CBD31BLL)
  {
    long long v7 = *(_OWORD *)a2;
    uint64_t v8 = *((void *)a2 + 2);
    IOWorkGroup::SetWorkGroupPort_Invoke((IOWorkGroup *)&v7, this, (OSMetaClassBase *)IOWorkGroup::SetWorkGroupPort_Impl, v5);
  }
  else
  {
    IORPC v6 = *(IORPC *)a2;
    OSObject::_Dispatch((OSObject *)this, &v6);
  }
}

double IOWorkGroup::SetWorkGroupPort_Invoke(IOWorkGroup *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, unsigned int))
{
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v4 + 68) == 1
    && *((_DWORD *)this + 4) >= 0x54u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v5 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *, void))a3)(a2, *(unsigned int *)(v4 + 40)))
    {
      *(_OWORD *)(v5 + 28) = xmmword_23D3CE400;
      *(_DWORD *)(v5 + 4) = 52;
      *(void *)&double result = 1302509197;
      *(void *)(v5 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
      *(void *)(v5 + 44) = 0;
    }
  }
  return result;
}

uint64_t IOWorkGroupMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t IOWorkGroup::Create_Call(const OSMetaClassBase *this, OSString *a2, IOUserClient *a3, IOWorkGroup **a4)
{
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v12 = 0;
  long long v14 = 0u;
  DWORD1(v1OSArraySetValueInternal(this, index, 0, 0) = 116;
  *(_OWORD *)((char *)anObject + 4) = xmmword_23D3CE410;
  *(const OSMetaClassBase **)((char *)&anObject[3] + 4) = (const OSMetaClassBase *)gIOWorkGroupMetaClass;
  *(const OSMetaClassBase **)((char *)&anObject[2] + 4) = (const OSMetaClassBase *)3;
  *(void *)((char *)&v11 + 4) = 0x34DA2B68CLL;
  uint64_t v13 = 32;
  *(const OSMetaClassBase **)((char *)&anObject[4] + 4) = this;
  LODWORD(v14) = 16777472;
  LODWORD(anObject[0]) = 0;
  *(const OSMetaClassBase **)((char *)&anObject[5] + 4) = a2;
  invoke.message = (IORPCMessageMach *)&v10;
  invoke.reply = (IORPCMessageMach *)&v10;
  *(void *)&invoke.uint32_t sendSize = 0x8C00000074;
  uint64_t v5 = OSMetaClassBase::Invoke((OSMetaClassBase *)gIOWorkGroupMetaClass, &invoke);
  if (!v5)
  {
    uint64_t v5 = 3758097087;
    if (DWORD1(v10) == 72 && v13 == 0xFF6C673BB6DF71E7 && DWORD2(v11) == 1 && *((void *)&v14 + 1) == 1)
    {
      IORPC v6 = (IOUserClient_vtbl *)OSMetaClassBase::safeMetaCast(anObject[0], (const OSMetaClass *)gIOWorkGroupMetaClass);
      a3->IOService::OSObject::OSMetaClassBase::__vftable = v6;
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = anObject[0] == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v5;
}

uint64_t IOWorkGroup::SetWorkGroupPort(OSMetaClassBase *this, int a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  memset(v6, 0, 48);
  *(_DWORD *)&v6[4] = 84;
  long long v7 = xmmword_23D3CE420;
  uint64_t v9 = this;
  uint64_t v8 = 1;
  *(void *)&v6[20] = 0x24DA2B68CLL;
  *(_DWORD *)&v6[48] = 1245184;
  *(_DWORD *)&unsigned char v6[40] = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x7800000054;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint32_t sendSize = 0x7800000054;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v6[4] == 52 && *(void *)&v6[28] == 0x8FFAC48189CBD31BLL && !*(_DWORD *)&v6[24])
  {
    if (*(void *)&v6[44]) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOWorkGroup::InvalidateKernel(OSMetaClassBase *this, IOUserClient *a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  memset(v6, 0, 52);
  v6[1] = 92;
  *(_OWORD *)&v6[13] = xmmword_23D3CE430;
  uint64_t v8 = this;
  uint64_t v7 = 2;
  *(void *)&v6[5] = 0x24DA2B68CLL;
  uint64_t v9 = a2;
  if (a3)
  {
    v5[0] = v6;
    v5[1] = v6;
    v5[2] = 0x780000005CLL;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v5);
    if (result) {
      return result;
    }
  }
  else
  {
    v4.message = (IORPCMessageMach *)v6;
    v4.reply = (IORPCMessageMach *)v6;
    *(void *)&v4.uint32_t sendSize = 0x780000005CLL;
    uint64_t result = OSMetaClassBase::Invoke(this, &v4);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (v6[1] == 52 && *(void *)&v6[7] == 0xAE2AE4397E9F08A1 && !v6[6])
  {
    if (*(void *)&v6[11]) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t IOWorkGroup::Create_Invoke(IOWorkGroup *this, IORPC *a2, int (*a3)(OSString *, IOUserClient *, IOWorkGroup **))
{
  uint64_t v3 = 3758097087;
  uint64_t v4 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 3
    && *(void *)(v4 + 84) == 3
    && *((_DWORD *)this + 4) >= 0x74u
    && *((_DWORD *)this + 5) >= 0x48u)
  {
    uint64_t v6 = *((void *)this + 1);
    uint64_t v7 = *(const OSMetaClassBase **)(v4 + 100);
    if ((!v7 || OSMetaClassBase::safeMetaCast(v7, gOSStringMetaClass))
      && ((uint64_t v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v4 + 108), gIOUserClientMetaClass)) != 0
       || !*(void *)(v4 + 108)))
    {
      uint64_t v3 = ((uint64_t (*)(void, OSMetaClassBase *, uint64_t))a2)(*(void *)(v4 + 100), v8, v6 + 64);
      if (!v3)
      {
        *(_OWORD *)(v6 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CE440;
        *(_DWORD *)(v6 + 4) = 72;
        *(void *)(v6 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
        *(void *)(v6 + 56) = 1;
        *(_DWORD *)(v6 + 36) &= 0xFFFFFFu;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v3;
}

uint64_t IOWorkGroup::InvalidateKernel_Invoke(IOWorkGroup *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, IOUserClient *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v5 + 68) == 2
    && *((_DWORD *)this + 4) >= 0x5Cu
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    uint64_t v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v5 + 84), gIOUserClientMetaClass);
    if (v9 || !*(void *)(v5 + 84))
    {
      uint64_t v4 = ((uint64_t (*)(IORPC *, OSMetaClassBase *))a3)(a2, v9);
      if (!v4)
      {
        *(_OWORD *)(v8 + 28) = xmmword_23D3CE450;
        *(_DWORD *)(v8 + 4) = 52;
        *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
        *(void *)(v8 + 44) = 0;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v4;
}

uint64_t IOWorkGroup::getMetaClass(IOWorkGroup *this)
{
  return gIOWorkGroupMetaClass;
}

uint64_t OSAction_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSActionMetaClass::New(OSActionMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t OSAction::Dispatch(OSAction *this, const IORPC *rpc)
{
  IORPC v3 = *rpc;
  return OSAction::_Dispatch(this, &v3);
}

kern_return_t OSAction::_Dispatch(OSAction *self, const IORPC *rpc)
{
  kern_return_t result;
  IORPC v5;

  if (IORPCMessageFromMach(rpc->message, 0)->msgid == 0xBFB95094C657D68FLL)
  {
    uint64_t result = -536870209;
    if (rpc->message->msgh_body.msgh_descriptor_count == 1
      && *(void *)&rpc->message[2].msgh.msgh_bits == 1
      && rpc->sendSize >= 0x48
      && (!rpc->reply || rpc->replySize >= 0x34))
    {
      OSAction::Aborted_Impl(self);
      return 0;
    }
  }
  else
  {
    uint64_t v5 = *rpc;
    return OSObject::_Dispatch(self, &v5);
  }
  return result;
}

kern_return_t OSAction::Aborted_Invoke(const IORPC *rpc, OSMetaClassBase *target, OSAction::Aborted_Handler func)
{
  kern_return_t result;

  uint64_t result = -536870209;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&rpc->message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x48
    && (!rpc->reply || rpc->replySize >= 0x34))
  {
    ((void (*)(OSMetaClassBase *))func)(target);
    return 0;
  }
  return result;
}

kern_return_t OSActionMetaClass::Dispatch(OSActionMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t OSAction::Create_Call(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSAction **action)
{
  kern_return_t v6;
  OSAction *v7;
  BOOL v8;
  IORPC invoke;
  long long v11;
  long long v12;
  long long v13;
  int v14;
  unsigned char anObject[24];
  OSMetaClass *v16;
  OSObject *v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;

  long long v11 = 0u;
  uint64_t v12 = 0u;
  uint64_t v13 = 0u;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 116;
  *(_OWORD *)anObject = xmmword_23D3CE5F0;
  uint64_t v16 = gOSActionMetaClass;
  *(void *)&anObject[16] = 2;
  *(void *)((char *)&v12 + 4) = 0x24DA2B68CLL;
  long long v14 = 0;
  uint64_t v17 = target;
  uint64_t v18 = targetmsgid;
  uint64_t v19 = msgid;
  unint64_t v20 = referenceSize;
  invoke.message = (IORPCMessageMach *)&v11;
  invoke.reply = (IORPCMessageMach *)&v11;
  *(void *)&invoke.uint32_t sendSize = 0x8C00000074;
  uint64_t v6 = OSMetaClassBase::Invoke(gOSActionMetaClass, &invoke);
  if (!v6)
  {
    uint64_t v6 = -536870209;
    if (DWORD1(v11) == 72
      && *((void *)&v13 + 1) == 0xAA1FC3CE85CE5497
      && DWORD2(v12) == 1
      && *(void *)&anObject[4] == 1)
    {
      uint64_t v7 = (OSAction *)OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&anObject[12], gOSActionMetaClass);
      *action = v7;
      if (v7) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = *(void *)&anObject[12] == 0;
      }
      if (v8) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v6;
}

kern_return_t OSAction::CreateWithTypeName_Call(OSObject *target, uint64_t targetmsgid, uint64_t msgid, size_t referenceSize, OSString *typeName, OSAction **action)
{
  kern_return_t v7;
  OSAction *v8;
  BOOL v9;
  IORPC invoke;
  long long v12;
  long long v13;
  long long v14;
  int v15;
  unsigned char v16[12];
  const OSMetaClassBase *anObject[10];

  uint64_t v12 = 0u;
  uint64_t v13 = 0u;
  long long v14 = 0u;
  DWORD1(v12) = 140;
  *(_OWORD *)((char *)anObject + 4) = xmmword_23D3CE600;
  *(const OSMetaClassBase **)((char *)&anObject[3] + 4) = gOSActionMetaClass;
  *(const OSMetaClassBase **)((char *)&anObject[2] + 4) = (const OSMetaClassBase *)3;
  *(void *)((char *)&v13 + 4) = 0x34DA2B68CLL;
  long long v15 = 0;
  *(const OSMetaClassBase **)((char *)&anObject[4] + 4) = target;
  *(const OSMetaClassBase **)((char *)&anObject[6] + 4) = (const OSMetaClassBase *)targetmsgid;
  *(const OSMetaClassBase **)((char *)&anObject[7] + 4) = (const OSMetaClassBase *)msgid;
  *(const OSMetaClassBase **)((char *)&anObject[8] + 4) = (const OSMetaClassBase *)referenceSize;
  *(_DWORD *)&v16[8] = 16777472;
  LODWORD(anObject[0]) = 0;
  *(void *)uint64_t v16 = 40;
  *(const OSMetaClassBase **)((char *)&anObject[5] + 4) = typeName;
  invoke.message = (IORPCMessageMach *)&v12;
  invoke.reply = (IORPCMessageMach *)&v12;
  *(void *)&invoke.uint32_t sendSize = 0x8C0000008CLL;
  uint64_t v7 = OSMetaClassBase::Invoke(gOSActionMetaClass, &invoke);
  if (!v7)
  {
    uint64_t v7 = -536870209;
    if (DWORD1(v12) == 72
      && *((void *)&v14 + 1) == 0xA0C5B3ED5A8EA283
      && DWORD2(v13) == 1
      && *(void *)&v16[4] == 1)
    {
      uint64_t v8 = (OSAction *)OSMetaClassBase::safeMetaCast(anObject[0], gOSActionMetaClass);
      *action = v8;
      if (v8) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = anObject[0] == 0;
      }
      if (v9) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v7;
}

void OSAction::Aborted(OSAction *this, OSDispatchMethod supermethod)
{
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t v6 = 0;
  DWORD1(v4) = 72;
  long long v7 = xmmword_23D3CE610;
  uint64_t v8 = 1;
  uint64_t v9 = this;
  *(void *)((char *)&v5 + 4) = 0x14DA2B68CLL;
  if (supermethod)
  {
    v3[0] = &v4;
    v3[1] = 0;
    v3[2] = 72;
    ((void (*)(OSAction *, void *))supermethod)(this, v3);
  }
  else
  {
    v2.message = (IORPCMessageMach *)&v4;
    v2.reply = 0;
    *(void *)&v2.uint32_t sendSize = 72;
    OSMetaClassBase::Invoke(this, &v2);
  }
}

kern_return_t OSAction::Create_Invoke(const IORPC *rpc, OSAction::Create_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;

  IORPC v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x74
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    if (OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gOSObjectMetaClass)
      || !*(void *)&message[3].msgh.msgh_bits)
    {
      IORPC v2 = ((uint64_t (*)(void))func)();
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CE620;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.unsigned int msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

kern_return_t OSAction::CreateWithTypeName_Invoke(const IORPC *rpc, OSAction::CreateWithTypeName_Handler func)
{
  kern_return_t v2;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  const OSMetaClassBase *v6;

  IORPC v2 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 3
    && *(void *)&message[3].msgh.msgh_bits == 3
    && rpc->sendSize >= 0x8C
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    uint64_t v6 = *(const OSMetaClassBase **)&message[3].msgh_body.msgh_descriptor_count;
    if ((!v6 || OSMetaClassBase::safeMetaCast(v6, gOSStringMetaClass))
      && (OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_voucher_port, gOSObjectMetaClass)|| !*(void *)&message[3].msgh.msgh_voucher_port))
    {
      IORPC v2 = ((uint64_t (*)(void))func)();
      if (!v2)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CE630;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.unsigned int msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v2;
}

const OSMetaClass *__cdecl OSAction::getMetaClass(const OSAction *this)
{
  return gOSActionMetaClass;
}

uint64_t OSArray_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSArrayMetaClass::New(OSArrayMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSBoolean_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSBooleanMetaClass::New(OSBooleanMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSBundle_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSBundleMetaClass::New(OSBundleMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSCollection_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSCollectionMetaClass::New(OSCollectionMetaClass *this, OSObject *instance)
{
  return -536870169;
}

uint64_t OSContainer_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSContainerMetaClass::New(OSContainerMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSData_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSDataMetaClass::New(OSDataMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSDictionary_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSDictionaryMetaClass::New(OSDictionaryMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSMappedFile_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSMappedFileMetaClass::New(OSMappedFileMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSNumber_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSNumberMetaClass::New(OSNumberMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSObject_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSObjectMetaClass::New(OSObjectMetaClass *this, OSObject *instance)
{
  return 0;
}

kern_return_t OSObject::Dispatch(OSObject *this, const IORPC *rpc)
{
  message = rpc->message;
  *(_OWORD *)&invoke.reply = *(_OWORD *)&rpc->reply;
  IORPCMessageFromMach(message, 0);
  invoke.message = message;
  return OSMetaClassBase::Dispatch(this, &invoke);
}

kern_return_t OSObject::_Dispatch(OSObject *self, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(self, &v5);
}

kern_return_t OSObjectMetaClass::Dispatch(OSObjectMetaClass *this, const IORPC *rpc)
{
  IORPCMessageFromMach(rpc->message, 0);
  IORPC v5 = *rpc;
  return OSMetaClassBase::Dispatch(this, &v5);
}

kern_return_t OSObject::SetDispatchQueue(OSObject *this, const char *name, IODispatchQueue *queue, OSDispatchMethod supermethod)
{
  kern_return_t result;
  IORPC v8;
  void v9[3];
  _DWORD v10[17];
  uint64_t v11;
  OSObject *v12;
  IODispatchQueue *v13;
  _DWORD v14[5];
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  int v30;
  uint64_t v31;

  long long v31 = *MEMORY[0x263EF8340];
  long long v30 = 0;
  uint64_t v28 = 0u;
  int v29 = 0u;
  uint64_t v26 = 0u;
  uint64_t v27 = 0u;
  int v24 = 0u;
  long long v25 = 0u;
  uint64_t v22 = 0u;
  uint64_t v23 = 0u;
  unint64_t v20 = 0u;
  uint64_t v21 = 0u;
  uint64_t v18 = 0u;
  uint64_t v19 = 0u;
  uint64_t v16 = 0u;
  uint64_t v17 = 0u;
  long long v15 = 0u;
  memset(v10, 0, 52);
  v10[1] = 356;
  *(_OWORD *)&v10[13] = xmmword_23D3CF3E0;
  uint64_t v12 = this;
  long long v11 = 2;
  *(void *)&v10[5] = 0x24DA2B68CLL;
  memset(v14, 0, sizeof(v14));
  strlcpy((char *)&v14[2], name, 0x100uLL);
  uint64_t v13 = queue;
  if (supermethod)
  {
    v9[0] = v10;
    v9[1] = v10;
    void v9[2] = 0x7800000164;
    uint64_t result = ((uint64_t (*)(OSObject *, void *))supermethod)(this, v9);
    if (result) {
      return result;
    }
  }
  else
  {
    v8.message = (IORPCMessageMach *)v10;
    v8.reply = (IORPCMessageMach *)v10;
    *(void *)&v8.uint32_t sendSize = 0x7800000164;
    uint64_t result = OSMetaClassBase::Invoke(this, &v8);
    if (result) {
      return result;
    }
  }
  uint64_t result = -536870209;
  if (v10[1] == 52 && *(void *)&v10[7] == 0xE608AE8273DAE1BCLL && !v10[6])
  {
    if (*(void *)&v10[11]) {
      return -536870209;
    }
    else {
      return 0;
    }
  }
  return result;
}

kern_return_t OSObject::CopyDispatchQueue(OSObject *this, const char *name, IODispatchQueue **queue, OSDispatchMethod supermethod)
{
  kern_return_t v7;
  kern_return_t v8;
  IODispatchQueue *v9;
  BOOL v10;
  IORPC v12;
  void v13[3];
  long long v14;
  long long v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  OSMetaClassBase *anObject[2];
  _OWORD v21[16];
  uint64_t v22;

  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(v21, 0, sizeof(v21));
  uint64_t v18 = 0;
  long long v15 = 0u;
  uint64_t v16 = 0;
  long long v14 = 0u;
  DWORD1(v14) = 336;
  uint64_t v17 = 0x95115B48FD29F7C9;
  uint64_t v19 = 1;
  anObject[0] = this;
  *(void *)((char *)&v15 + 4) = 0x14DA2B68CLL;
  anObject[1] = 0;
  strlcpy((char *)v21, name, 0x100uLL);
  if (supermethod)
  {
    v13[0] = &v14;
    v13[1] = &v14;
    void v13[2] = 0x8C00000150;
    long long v7 = ((uint64_t (*)(OSObject *, void *))supermethod)(this, v13);
  }
  else
  {
    v12.message = (IORPCMessageMach *)&v14;
    v12.reply = (IORPCMessageMach *)&v14;
    *(void *)&v12.uint32_t sendSize = 0x8C00000150;
    long long v7 = OSMetaClassBase::Invoke(this, &v12);
  }
  uint64_t v8 = v7;
  if (!v7)
  {
    uint64_t v8 = -536870209;
    if (DWORD1(v14) == 72 && v17 == 0x95115B48FD29F7C9 && DWORD2(v15) == 1 && v19 == 1)
    {
      uint64_t v9 = (IODispatchQueue *)OSMetaClassBase::safeMetaCast(anObject[0], gIODispatchQueueMetaClass);
      *queue = v9;
      if (v9) {
        long long v10 = 1;
      }
      else {
        long long v10 = anObject[0] == 0;
      }
      if (v10) {
        return 0;
      }
      else {
        return -536870206;
      }
    }
  }
  return v8;
}

kern_return_t OSObject::SetDispatchQueue_Invoke(const IORPC *rpc, OSMetaClassBase *target, OSObject::SetDispatchQueue_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  OSMetaClassBase *v8;
  const char *p_msgh_voucher_port;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 2
    && *(void *)&message[2].msgh.msgh_local_port == 2
    && rpc->sendSize >= 0x164
    && rpc->replySize >= 0x34)
  {
    reply = rpc->reply;
    uint64_t v8 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)&message[3].msgh.msgh_bits, gIODispatchQueueMetaClass);
    if (!v8 && *(void *)&message[3].msgh.msgh_bits) {
      return -536870206;
    }
    p_msgh_voucher_port = (const char *)&message[3].msgh.msgh_voucher_port;
    if (strnlen(p_msgh_voucher_port, 0x100uLL) > 0xFF)
    {
      return -536870206;
    }
    else
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, const char *, OSMetaClassBase *))func)(target, p_msgh_voucher_port, v8);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_bits = xmmword_23D3CF3F0;
        reply->msgh.uint32_t msgh_size = 52;
        *(void *)&reply->msgh.unsigned int msgh_id = 1302509197;
        *(void *)&reply[1].msgh.msgh_voucher_port = 0;
      }
    }
  }
  return v3;
}

kern_return_t OSObject::CopyDispatchQueue_Invoke(const IORPC *rpc, OSMetaClassBase *target, OSObject::CopyDispatchQueue_Handler func)
{
  kern_return_t v3;
  IORPCMessageMach *message;
  IORPCMessageMach *reply;
  mach_msg_body_t *p_msgh_body;

  IORPC v3 = -536870209;
  message = rpc->message;
  if (rpc->message->msgh_body.msgh_descriptor_count == 1
    && *(void *)&message[2].msgh.msgh_bits == 1
    && rpc->sendSize >= 0x150
    && rpc->replySize >= 0x48)
  {
    reply = rpc->reply;
    p_msgh_body = &message[2].msgh_body;
    if (strnlen((const char *)&message[2].msgh_body, 0x100uLL) <= 0xFF)
    {
      IORPC v3 = ((uint64_t (*)(OSMetaClassBase *, mach_msg_body_t *, mach_port_t *))func)(target, p_msgh_body, &reply[2].msgh.msgh_remote_port);
      if (!v3)
      {
        *(_OWORD *)&reply[1].msgh.msgh_local_port = xmmword_23D3CF400;
        reply->msgh.uint32_t msgh_size = 72;
        *(void *)&reply->msgh.unsigned int msgh_id = 0x14DA2B68DLL;
        *(void *)&reply[2].msgh.msgh_bits = 1;
        reply[1].msgh.msgh_remote_port &= 0xFFFFFFu;
      }
    }
    else
    {
      return -536870206;
    }
  }
  return v3;
}

uint64_t OSOrderedSet_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSOrderedSetMetaClass::New(OSOrderedSetMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSSerialization_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSSerializationMetaClass::New(OSSerializationMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSSet_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSSetMetaClass::New(OSSetMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t OSString_New(OSMetaClass *a1)
{
  return 0;
}

kern_return_t OSStringMetaClass::New(OSStringMetaClass *this, OSObject *instance)
{
  return 0;
}

uint64_t _IOBlockStorageDevice_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F119800;
  return 0;
}

uint64_t _IOBlockStorageDeviceMetaClass::New(_IOBlockStorageDeviceMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F119858;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F1198A0;
  return 0;
}

uint64_t _IOBlockStorageDevice::Dispatch(IOService *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return IOService::_Dispatch(this, &rpc);
}

uint64_t _IOBlockStorageDevice::_Dispatch(IOService *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return IOService::_Dispatch(this, &v6);
}

uint64_t _IOBlockStorageDeviceMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t _IOBlockStorageDevice::DoAsyncReadWriteCompletion(_IOBlockStorageDevice *this, OSAction *a2, int a3, uint64_t a4, int (*a5)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  DWORD1(v7) = 108;
  long long v11 = xmmword_23D3CFB00;
  uint64_t v13 = a2;
  uint64_t v12 = 2;
  *(void *)((char *)&v8 + 4) = 0x24DA2B68CLL;
  int v10 = 0;
  long long v14 = a2;
  int v15 = a3;
  int v16 = 0;
  uint64_t v17 = a4;
  invoke.message = (IORPCMessageMach *)&v7;
  invoke.reply = 0;
  *(void *)&invoke.uint32_t sendSize = 108;
  return OSMetaClassBase::Invoke(a2, &invoke);
}

uint64_t _IOBlockStorageDevice::DoAsyncReadWrite(OSMetaClassBase *this, IOMemoryDescriptor *a2, uint64_t a3, uint64_t a4, OSAction *a5, int (*a6)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  memset(v9, 0, sizeof(v9));
  uint64_t v10 = 0;
  *(_DWORD *)&unsigned char v9[4] = 128;
  long long v12 = xmmword_23D3CFB10;
  uint64_t v13 = 3;
  long long v14 = this;
  *(void *)&v9[20] = 0x34DA2B68CLL;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  int v11 = 0;
  int v15 = a2;
  int v16 = a5;
  if (a6)
  {
    v8[0] = v9;
    v8[1] = v9;
    int v8[2] = 0x7800000080;
    uint64_t result = ((uint64_t (*)(OSMetaClassBase *, void *))a6)(this, v8);
    if (result) {
      return result;
    }
  }
  else
  {
    v7.message = (IORPCMessageMach *)v9;
    v7.reply = (IORPCMessageMach *)v9;
    *(void *)&v7.uint32_t sendSize = 0x7800000080;
    uint64_t result = OSMetaClassBase::Invoke(this, &v7);
    if (result) {
      return result;
    }
  }
  uint64_t result = 3758097087;
  if (*(_DWORD *)&v9[4] == 52 && *(void *)&v9[28] == 0x531DA66B034F3069 && !*(_DWORD *)&v9[24])
  {
    if (*(void *)&v9[44]) {
      return 3758097087;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t _IOBlockStorageDevice::CopyProducerDataQueue(OSMetaClassBase *this, IODataQueueDispatchSource **a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  long long v14 = xmmword_23D3CFB20;
  uint64_t v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (a3)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint32_t sendSize = 0x8C00000048;
    uint64_t v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = 3758097087;
    if (DWORD1(v11) == 72 && (void)v14 == 0x5EB9E790228E9CFALL && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (IODataQueueDispatchSource *)OSMetaClassBase::safeMetaCast(anObject, gIODataQueueDispatchSourceMetaClass);
      *a2 = v6;
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v5;
}

uint64_t _IOBlockStorageDevice::CopyReceiverDataQueue(OSMetaClassBase *this, IODataQueueDispatchSource **a2, int (*a3)(OSMetaClassBase *, IORPC *__struct_ptr))
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v13 = 0;
  DWORD1(v1IOExtensiblePaniclog::free(this - 1) = 72;
  long long v14 = xmmword_23D3CFB30;
  uint64_t v15 = 1;
  anObject = this;
  *(void *)((char *)&v12 + 4) = 0x14DA2B68CLL;
  if (a3)
  {
    v10[0] = &v11;
    v10[1] = &v11;
    v10[2] = 0x8C00000048;
    uint64_t v4 = ((uint64_t (*)(OSMetaClassBase *, void *))a3)(this, v10);
  }
  else
  {
    v9.message = (IORPCMessageMach *)&v11;
    v9.reply = (IORPCMessageMach *)&v11;
    *(void *)&v9.uint32_t sendSize = 0x8C00000048;
    uint64_t v4 = OSMetaClassBase::Invoke(this, &v9);
  }
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = 3758097087;
    if (DWORD1(v11) == 72 && (void)v14 == 0x48630EEB0D6B8B14 && DWORD2(v12) == 1 && v15 == 1)
    {
      IORPC v6 = (IODataQueueDispatchSource *)OSMetaClassBase::safeMetaCast(anObject, gIODataQueueDispatchSourceMetaClass);
      *a2 = v6;
      if (v6) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = anObject == 0;
      }
      if (v7) {
        return 0;
      }
      else {
        return 3758097090;
      }
    }
  }
  return v5;
}

uint64_t _IOBlockStorageDevice::CreateActionKernelCompletion(OSObject *this, size_t a2, OSAction **a3)
{
  IORPC v6 = OSString::withCString("OSAction__IOBlockStorageDevice_KernelCompletion");
  if (!v6) {
    return 3758097085;
  }
  BOOL v7 = v6;
  uint64_t v8 = OSAction::CreateWithTypeName(this, 0xADE816E976E7C376, 0x4F3D0282014E62D4uLL, a2, v6, a3);
  ((void (*)(OSString *))v7->release)(v7);
  return v8;
}

uint64_t _IOBlockStorageDevice::DoAsyncReadWriteCompletion_Invoke(_IOBlockStorageDevice *this, IORPC *a2, OSMetaClassBase *a3, void (*a4)(OSMetaClassBase *, OSAction *, int, unint64_t), const OSMetaClass *a5)
{
  long long v6 = *(_OWORD *)this;
  uint64_t v7 = *((void *)this + 2);
  return _IOBlockStorageDevice::DoAsyncReadWriteCompletion_Invoke((_IOBlockStorageDevice *)&v6, a2, a3, 0, a5);
}

uint64_t _IOBlockStorageDevice::DoAsyncReadWriteCompletion_Invoke(_IOBlockStorageDevice *this, IORPC *a2, OSMetaClassBase *a3, OSMetaClass *a4, const OSMetaClass *a5)
{
  uint64_t v5 = 3758097087;
  uint64_t v6 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 2
    && *(void *)(v6 + 68) == 2
    && *((_DWORD *)this + 4) >= 0x6Cu
    && (!*((void *)this + 1) || *((_DWORD *)this + 5) >= 0x34u))
  {
    if (a4) {
      IORPC v9 = a4;
    }
    else {
      IORPC v9 = gOSActionMetaClass;
    }
    uint64_t v10 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v6 + 84), v9);
    if (v10 || !*(void *)(v6 + 84))
    {
      ((void (*)(IORPC *, OSMetaClassBase *, void, void))a3)(a2, v10, *(unsigned int *)(v6 + 92), *(void *)(v6 + 100));
      return 0;
    }
    else
    {
      return 3758097090;
    }
  }
  return v5;
}

uint64_t _IOBlockStorageDevice::DoAsyncReadWrite_Invoke(_IOBlockStorageDevice *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, IOMemoryDescriptor *, unint64_t, unint64_t, OSAction *))
{
  uint64_t v4 = 3758097087;
  uint64_t v5 = *(void *)this;
  if (*(_DWORD *)(*(void *)this + 24) == 3
    && *(void *)(v5 + 80) == 3
    && *((_DWORD *)this + 4) >= 0x80u
    && *((_DWORD *)this + 5) >= 0x34u)
  {
    uint64_t v8 = *((void *)this + 1);
    IORPC v9 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v5 + 96), gIOMemoryDescriptorMetaClass);
    if ((v9 || !*(void *)(v5 + 96))
      && ((uint64_t v10 = OSMetaClassBase::safeMetaCast(*(const OSMetaClassBase **)(v5 + 104), gOSActionMetaClass)) != 0
       || !*(void *)(v5 + 104)))
    {
      uint64_t v4 = ((uint64_t (*)(IORPC *, OSMetaClassBase *, void, void, OSMetaClassBase *))a3)(a2, v9, *(void *)(v5 + 112), *(void *)(v5 + 120), v10);
      if (!v4)
      {
        *(_OWORD *)(v8 + 28) = xmmword_23D3CFB40;
        *(_DWORD *)(v8 + 4) = 52;
        *(void *)(v8 + 2OSArraySetValueInternal(this, index, 0, 0) = 1302509197;
        *(void *)(v8 + 44) = 0;
      }
    }
    else
    {
      return 3758097090;
    }
  }
  return v4;
}

double _IOBlockStorageDevice::CopyProducerDataQueue_Invoke(_IOBlockStorageDevice *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, IODataQueueDispatchSource **))
{
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(*(void *)this + 56) == 1
    && *((_DWORD *)this + 4) >= 0x48u
    && *((_DWORD *)this + 5) >= 0x48u)
  {
    uint64_t v4 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *, uint64_t))a3)(a2, v4 + 64))
    {
      *(_OWORD *)(v4 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CFB50;
      *(_DWORD *)(v4 + 4) = 72;
      *(void *)&double result = 0x14DA2B68DLL;
      *(void *)(v4 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
      *(void *)(v4 + 56) = 1;
      *(_DWORD *)(v4 + 36) &= 0xFFFFFFu;
    }
  }
  return result;
}

double _IOBlockStorageDevice::CopyReceiverDataQueue_Invoke(_IOBlockStorageDevice *this, IORPC *a2, OSMetaClassBase *a3, int (*a4)(OSMetaClassBase *, IODataQueueDispatchSource **))
{
  if (*(_DWORD *)(*(void *)this + 24) == 1
    && *(void *)(*(void *)this + 56) == 1
    && *((_DWORD *)this + 4) >= 0x48u
    && *((_DWORD *)this + 5) >= 0x48u)
  {
    uint64_t v4 = *((void *)this + 1);
    if (!((unsigned int (*)(IORPC *, uint64_t))a3)(a2, v4 + 64))
    {
      *(_OWORD *)(v4 + 4OSArraySetValueInternal(this, index, 0, 0) = xmmword_23D3CFB60;
      *(_DWORD *)(v4 + 4) = 72;
      *(void *)&double result = 0x14DA2B68DLL;
      *(void *)(v4 + 2OSArraySetValueInternal(this, index, 0, 0) = 0x14DA2B68DLL;
      *(void *)(v4 + 56) = 1;
      *(_DWORD *)(v4 + 36) &= 0xFFFFFFu;
    }
  }
  return result;
}

uint64_t OSAction__IOBlockStorageDevice_KernelCompletion_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F119910;
  return 0;
}

uint64_t OSAction__IOBlockStorageDevice_KernelCompletionMetaClass::New(OSAction__IOBlockStorageDevice_KernelCompletionMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F119968;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F1199B0;
  return 0;
}

uint64_t OSAction__IOBlockStorageDevice_KernelCompletion::Dispatch(OSAction *this, IORPC *a2)
{
  message = a2->message;
  *(_OWORD *)&rpc.reply = *(_OWORD *)&a2->reply;
  IORPCMessageFromMach(message, 0);
  rpc.message = message;
  return OSAction::_Dispatch(this, &rpc);
}

uint64_t OSAction__IOBlockStorageDevice_KernelCompletion::_Dispatch(OSAction *this, IORPCMessageMach **a2, IORPC *a3)
{
  IORPCMessageFromMach(*a2, 0);
  IORPC v6 = *(IORPC *)a2;
  return OSAction::_Dispatch(this, &v6);
}

uint64_t OSAction__IOBlockStorageDevice_KernelCompletionMetaClass::Dispatch(OSMetaClassBase *this, IORPC *a2)
{
  IORPCMessageFromMach(a2->message, 0);
  IORPC v5 = *a2;
  return OSMetaClassBase::Dispatch(this, &v5);
}

uint64_t OSAction__IOBlockStorageDevice_KernelCompletion::getMetaClass(OSAction__IOBlockStorageDevice_KernelCompletion *this)
{
  return gOSAction__IOBlockStorageDevice_KernelCompletionMetaClass;
}

uint64_t IOThread_New(OSMetaClass *a1)
{
  a1->__vftable = (OSMetaClass_vtbl *)&unk_26F119AC0;
  return 0;
}

uint64_t IOThreadMetaClass::New(IOThreadMetaClass *this, OSObject *a2)
{
  a2->OSMetaClassBase::__vftable = (OSObject_vtbl *)&unk_26F114B38;
  a2->OSObjectInterface::__vftable = (OSObjectInterface_vtbl *)&unk_26F114B80;
  return 0;
}

void panic(const char *a1, ...)
{
  va_start(va, a1);
  va_copy(v8, va);
  vsnprintf(__str, 0x400uLL, a1, va);
  if (qword_268C09308 != -1) {
    dispatch_once(&qword_268C09308, &__block_literal_global);
  }
  int v1 = _MergedGlobals;
  BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (!v2) {
      goto LABEL_9;
    }
    int v5 = 136446210;
    IORPC v6 = __str;
    IORPC v3 = &_os_log_internal;
    uint64_t v4 = "%{public}s";
  }
  else
  {
    if (!v2) {
      goto LABEL_9;
    }
    int v5 = 136315138;
    IORPC v6 = __str;
    IORPC v3 = &_os_log_internal;
    uint64_t v4 = "%s";
  }
  _os_log_impl(&dword_23D392000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
LABEL_9:
  qword_268C08D58 = (uint64_t)strdup(__str);
  abort();
}

void nanoseconds_to_absolutetime_cold_1()
{
}

void nanoseconds_to_absolutetime_cold_2()
{
  __assert_rtn("nanoseconds_to_absolutetime", "IOLib.cpp", 675, "kr == KERN_SUCCESS");
}

void absolutetime_to_nanoseconds_cold_1()
{
}

void absolutetime_to_nanoseconds_cold_2()
{
  __assert_rtn("absolutetime_to_nanoseconds", "IOLib.cpp", 695, "kr == KERN_SUCCESS");
}

void clock_get_calendar_nanotime_cold_1()
{
  __assert_rtn("clock_get_calendar_nanotime", "IOLib.cpp", 727, "err == 0");
}

void clock_get_calendar_microtime_cold_1()
{
  __assert_rtn("clock_get_calendar_microtime", "IOLib.cpp", 738, "err == 0");
}

void clock_get_system_nanotime_cold_1()
{
  __assert_rtn("clock_get_system_nanotime", "IOLib.cpp", 749, "err == 0");
}

void getHexData()
{
  __assert_rtn("getHexData", "OSUnserializeXML.y", 891, "oldsize == buflen");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  if (a1)
  {
    if (a1 == (const char *)-1) {
    panic("Assertion failed: (%s), function %s, file %s, line %d.\n", a4, a1, a2, a3);
    }
  }
  panic("Assertion failed: (%s), file %s, line %d.\n", a4, a2, a3);
}

void OSRegisterClass()
{
  __assert_rtn("OSRegisterClass", "uioserver.cpp", 409, "(desc->methodOptionsOffset + desc->methodOptionsSize) <= descSize");
}

{
  __assert_rtn("OSRegisterClass", "uioserver.cpp", 410, "(desc->queueNamesOffset + desc->queueNamesSize) <= descSize");
}

{
  __assert_rtn("OSRegisterClass", "uioserver.cpp", 419, "kIOReturnSuccess == ret");
}

void OSFindClass()
{
}

{
  __assert_rtn("OSFindClass", "uioserver.cpp", 525, "meta");
}

void OSObjectAllocate()
{
  __assert_rtn("OSObjectAllocate", "uioserver.cpp", 613, "kIOReturnSuccess == ret");
}

void OSObjectPortFinalize()
{
}

{
  __assert_rtn("OSObjectPortFinalize", "uioserver.cpp", 681, "KERN_SUCCESS == ret");
}

void OSObjectFree()
{
}

void CompactArray<IODispatchQueue *>::reset()
{
  __assert_rtn("reset", "OSMetaClassBasePrivate.h", 103, "size != 0");
}

void OSObjectTryRetain()
{
}

void OSObject::retain()
{
}

{
  __assert_rtn("retain", "uioserver.cpp", 801, "oldcount < INT16_MAX");
}

void OSObject::release()
{
}

void OSMetaClassBase::requiredMetaCast(uint64_t a1, uint64_t a2)
{
  if (a2) {
    BOOL v2 = (const char *)(***(void ***)(a2 + 24) + 4);
  }
  else {
    BOOL v2 = "(null)";
  }
  panic("Failed to cast object of type %s to %s", (const char *)(***(void ***)(a1 + 24) + 4), v2);
}

void OSMetaClassBase::QueueForObject()
{
}

{
  __assert_rtn("QueueForObject", "uioserver.cpp", 909, "queue");
}

void CompactArray<IODispatchQueue *>::operator[]()
{
  __assert_rtn("operator[]", "OSMetaClassBasePrivate.h", 81, "size != 0");
}

{
  __assert_rtn("operator[]", "OSMetaClassBasePrivate.h", 82, "idx < size");
}

void IORPCMessageFromMach_cold_1(void *buffer, size_t size)
{
}

void IORPCMessageFromMach_cold_2()
{
}

void OSMetaClassBase::Dispatch()
{
}

{
  __assert_rtn("Dispatch", "uioserver.cpp", 1438, "MACH_PORT_NULL != remotePriv->objectRef");
}

{
  __assert_rtn("Dispatch", "uioserver.cpp", 1455, "MACH_PORT_DEAD != remotePriv->objectRef");
}

{
  __assert_rtn("Dispatch", "uioserver.cpp", 1446, "MACH_PORT_NULL != objectName1");
}

void InvokeRemote()
{
  __assert_rtn("InvokeRemote", "uioserver.cpp", 2197, "sendSize >= (sizeof(IORPCMessageMach) + sizeof(IORPCMessage))");
}

{
  __assert_rtn("InvokeRemote", "uioserver.cpp", 2200, "oneway || (replySize >= (sizeof(IORPCMessageMach) + sizeof(IORPCMessage)))");
}

{
  __assert_rtn("InvokeRemote", "uioserver.cpp", 2295, "replySize <= rpc.replySize");
}

{
  __assert_rtn("InvokeRemote", "uioserver.cpp", 2203, "kIOReturnSuccess == ret");
}

void OSMetaClassBase::Invoke()
{
  __assert_rtn("Invoke", "uioserver.cpp", 1612, "notsync || !remote || (msgid == IOService_Start_ID) || queue->OnQueue()");
}

{
  __assert_rtn("Invoke", "uioserver.cpp", 1589, "msgid == action->ivars->msgid");
}

{
  __assert_rtn("Invoke", "uioserver.cpp", 1570, "remotePriv");
}

{
  __assert_rtn("Invoke", "uioserver.cpp", 1577, "kIOReturnSuccess == ret");
}

{
  __assert_rtn("Invoke", "uioserver.cpp", 1571, "MACH_PORT_NULL != remotePriv->objectRef");
}

{
  __assert_rtn("Invoke", "uioserver.cpp", 1572, "MACH_PORT_DEAD != remotePriv->objectRef");
}

void DidAction()
{
  __assert_rtn("DidAction", "uioserver.cpp", 1512, "0 == err");
}

void IOLockAssert_cold_1()
{
  __assert_rtn("IOLockAssert", "uioserver.cpp", 1723, "(kIOLockAssertOwned == type) || (kIOLockAssertNotOwned == type)");
}

void IORecursiveConditionLockLock_cold_1()
{
}

void IORecursiveConditionLockLock_cold_2()
{
  __assert_rtn("IORecursiveConditionLockLock", "uioserver.cpp", 1817, "0 == lock->count");
}

void IORecursiveConditionLockUnlock_cold_1()
{
}

void IORecursiveConditionLockUnlock_cold_2()
{
  __assert_rtn("IORecursiveConditionLockUnlock", "uioserver.cpp", 1827, "pthread_self() == lock->thread");
}

void IORecursiveConditionLockHaveLock_cold_1()
{
}

void IORecursiveConditionLockTryLock_cold_1()
{
}

void IORecursiveConditionLockTryLock_cold_2()
{
  __assert_rtn("IORecursiveConditionLockTryLock", "uioserver.cpp", 1856, "0 == lock->count");
}

void IORWLockAlloc_cold_1()
{
}

void IORWLockRead_cold_1()
{
}

void IORWLockWrite_cold_1()
{
}

void IORWLockUnlock_cold_1()
{
}

void ThreadStart()
{
}

{
  __assert_rtn("ThreadStart", "uioserver.cpp", 2032, "!err");
}

{
  __assert_rtn("ThreadStart", "uioserver.cpp", 2028, "!err");
}

{
  __assert_rtn("ThreadStart", "uioserver.cpp", 2025, "!err");
}

{
  __assert_rtn("ThreadStart", "uioserver.cpp", 2021, "!err");
}

void OSCopyOutObjects()
{
  __assert_rtn("OSCopyOutObjects", "uioserver.cpp", 1161, "refs <= mach->msgh_body.msgh_descriptor_count");
}

{
  __assert_rtn("OSCopyOutObjects", "uioserver.cpp", 1162, "refs <= maxObjectCount");
}

{
  __assert_rtn("OSCopyOutObjects", "uioserver.cpp", 1241, "false");
}

{
  __assert_rtn("OSObjectCopyOut", "uioserver.cpp", 1130, "remotePriv");
}

{
  __assert_rtn("OSObjectCopyOut", "uioserver.cpp", 1131, "MACH_PORT_NULL != remotePriv->objectRef");
}

{
  __assert_rtn("OSCopyOutObjects", "uioserver.cpp", 1207, "serialOut");
}

{
  __assert_rtn("OSCopyOutObjects", "uioserver.cpp", 1213, "buffer");
}

void OSCopyInObjects()
{
  __assert_rtn("OSCopyInObjects", "uioserver.cpp", 1332, "refs <= mach->msgh_body.msgh_descriptor_count");
}

{
  __assert_rtn("OSCopyInObjects", "uioserver.cpp", 1333, "refs <= maxObjectCount");
}

{
  __assert_rtn("OSCopyInObjects", "uioserver.cpp", 1384, "false");
}

{
  __assert_rtn("OSCopyInObjects", "uioserver.cpp", 1369, "serial");
}

void OSScanClassesInMachO()
{
}

void OSScanClassesInMachO(const char *a1)
{
}

void IOUserServerMain_cold_1()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2826, "KERN_SUCCESS == ret");
}

void IOUserServerMain_cold_2()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2799, "KERN_SUCCESS == ret");
}

void IOUserServerMain_cold_3()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2792, "KERN_SUCCESS == ret");
}

void IOUserServerMain_cold_4()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2787, "serverTagStrEnd[0] == '\\0'");
}

void IOUserServerMain_cold_5()
{
  __assert_rtn("OSScanStringsInMachO", "uioserver.cpp", 2365, "str != NULL");
}

void IOUserServerMain_cold_6()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2751, "ret == 0");
}

void IOUserServerMain_cold_7()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2743, "KERN_SUCCESS == ret");
}

void IOUserServerMain_cold_8()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2726, "KERN_SUCCESS == ret");
}

void IOUserServerMain_cold_9()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2721, "KERN_SUCCESS == ret");
}

void IOUserServerMain_cold_10()
{
  __assert_rtn("IOUserServerMain", "uioserver.cpp", 2717, "KERN_SUCCESS == ret");
}

void IODriverKitTest_cold_1(uint64_t a1)
{
  *(void *)(*(void *)a1 + 24) = 0;
  __assert_rtn("LockTest", "uioserver.cpp", 2576, "lock");
}

void IODriverKitTest_cold_2()
{
}

void IODriverKitTest_cold_3(uint64_t a1)
{
  *(void *)(*(void *)a1 + 24) = 0;
  __assert_rtn("LockTest", "uioserver.cpp", 2580, "rlock");
}

void IODriverKitTest_cold_4()
{
}

void IODriverKitTest_cold_5()
{
}

void IODriverKitTest_cold_6()
{
  __assert_rtn("LockTest", "uioserver.cpp", 2634, "100 == count");
}

void IODriverKitTest_cold_7()
{
  __assert_rtn("LockTest", "uioserver.cpp", 2617, "100 == count");
}

void IODriverKitTest_cold_8()
{
  __assert_rtn("LockTest", "uioserver.cpp", 2600, "100 == count");
}

void OSScanLibraries()
{
}

{
  __assert_rtn("OSRegisterClasses", "uioserver.cpp", 496, "kIOReturnSuccess == ret");
}

{
  __assert_rtn("OSMetaClassAllocate", "uioserver.cpp", 565, "kIOReturnSuccess == ret");
}

void OSScanLibraries(const char *a1)
{
}

void IODispatchQueue::Create()
{
}

{
  __assert_rtn("Create", "uioserver.cpp", 3196, "lvars->ipcchannel");
}

{
  __assert_rtn("Create", "uioserver.cpp", 3167, "lvars->reentrantLock");
}

{
  __assert_rtn("Create", "uioserver.cpp", 3170, "lvars->waitTokens");
}

{
  __assert_rtn("Create", "uioserver.cpp", 3177, "lvars->queue");
}

{
  __assert_rtn("Create", "uioserver.cpp", 3162, "KERN_SUCCESS == ret");
}

{
  __assert_rtn("Create", "uioserver.cpp", 3159, "KERN_SUCCESS == ret");
}

{
  __assert_rtn("Create", "uioserver.cpp", 3154, "KERN_SUCCESS == ret");
}

void __IOUserServerMain_block_invoke_3_cold_1()
{
}

void __IOUserServerMain_block_invoke_3_cold_2()
{
}

void uiomachchannel()
{
}

{
  __assert_rtn("uiomachchannel", "uioserver.cpp", 3124, "!(MACH_PORT_VALID(hdr->msgh_remote_port))");
}

{
  __assert_rtn("uiomachchannel", "uioserver.cpp", 3128, "KERN_SUCCESS == ret");
}

{
  __assert_rtn("uiomachchannel", "uioserver.cpp", 3126, "lvars->recvport == hdr->msgh_local_port");
}

void IODispatchQueue::DispatchConcurrent_f()
{
}

void IODispatchQueue::SleepWithDeadline()
{
  __assert_rtn("SleepWithDeadline", "uioserver.cpp", 3451, "0 == deadline");
}

void convert_mach_time_to_nsec()
{
  __assert_rtn("convert_mach_time_to_nsec", "uioserver.cpp", 2843, "kr == KERN_SUCCESS");
}

void _IODispatchQueueSleep()
{
  __assert_rtn("_IODispatchQueueSleep", "uioserver.cpp", 3427, "0 == lvars->reentrantLock->thread");
}

{
  __assert_rtn("_IODispatchQueueSleep", "uioserver.cpp", 3426, "0 == lvars->reentrantLock->count");
}

{
  __assert_rtn("_IODispatchQueueSleep", "uioserver.cpp", 3375, "IORecursiveConditionLockHaveLock(lvars->reentrantLock)");
}

void IODispatchQueue::WakeupWithOptions()
{
  __assert_rtn("WakeupWithOptions", "uioserver.cpp", 3552, "0 == err");
}

{
  __assert_rtn("WakeupWithOptions", "uioserver.cpp", 3533, "IORecursiveConditionLockHaveLock(lvars->reentrantLock)");
}

void IOInterruptDispatchSourceThread()
{
}

void IOInterruptDispatchSource::Cancel_Impl()
{
  __assert_rtn("Cancel_Impl", "uioserver.cpp", 3735, "kIOReturnSuccess == ret");
}

void IOServiceNotificationDispatchSource::Create()
{
  __assert_rtn("Create", "uioserver.cpp", 3805, "kIOReturnSuccess == ret");
}

void ___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke_cold_1()
{
  __assert_rtn("DeliverNotifications_block_invoke", "uioserver.cpp", 3912, "service == nullptr");
}

void ___ZN35IOServiceNotificationDispatchSource20DeliverNotificationsEU13block_pointerFvyP9IOServiceyE_block_invoke_cold_2()
{
  __assert_rtn("DeliverNotifications_block_invoke", "uioserver.cpp", 3910, "kIOReturnSuccess == ret");
}

void IOService::CreatePropertyMatchingDictionary()
{
}

void IODataQueueDispatchSource::init()
{
  __assert_rtn("init", "IODataQueueDispatchSourceShared.h", 49, "kIOReturnSuccess == ret");
}

{
  __assert_rtn("init", "IODataQueueDispatchSourceShared.h", 43, "kIOReturnSuccess == ret");
}

void IOMemoryDescriptor::Map()
{
}

void IOTimerDispatchSource::Create_Impl()
{
}

{
  __assert_rtn("Create_Impl", "uioserver.cpp", 4078, "kIOReturnSuccess == ret");
}

void OSAction::free()
{
  __assert_rtn("free", "uioserver.cpp", 4388, "NULL == ivars->waiter");
}

void OSAction::Cancel()
{
}

void OSAction::GetReference()
{
}

void OSAction::WillWait()
{
  __assert_rtn("WillWait", "uioserver.cpp", 4455, "err == 0");
}

void OSAction::EndWait()
{
  __assert_rtn("EndWait", "uioserver.cpp", 4470, "ivars->waiter == token");
}

void OSAction::Wait()
{
  __assert_rtn("Wait", "uioserver.cpp", 4493, "0 == deadline");
}

void IOMemoryDescriptor::GetLength()
{
  __assert_rtn("GetLength", "uioserver.cpp", 4599, "kIOReturnSuccess == ret");
}

void IOMemoryMap::init()
{
  __assert_rtn("init", "uioserver.cpp", 4660, "kIOReturnSuccess == ret");
}

void IOService::init()
{
  __assert_rtn("init", "uioserver.cpp", 4813, "kIOReturnSuccess == ret");
}

{
  __assert_rtn("init", "uioserver.cpp", 4811, "kIOReturnSuccess == ret");
}

void IOService::_NewUserClient_Impl()
{
  __assert_rtn("_NewUserClient_Impl", "uioserver.cpp", 5056, "kIOReturnSuccess == kr");
}

void OSBundle::mainBundle()
{
}

{
  __assert_rtn("bundlePathFromExecutablePath", "uioserver.cpp", 5254, "tempPathLen < sizeof(tempPath)");
}

{
  __assert_rtn("bundlePathFromExecutablePath", "uioserver.cpp", 5258, "bundlePath != NULL");
}

void ___ZN13IOCommandPool13returnCommandEP9IOCommand_block_invoke_cold_1()
{
  __assert_rtn("returnCommand_block_invoke", "uioserver.cpp", 5589, "kIOReturnSuccess == ret");
}

void IOCommandPool::gatedGetCommand()
{
}

void IOCommandPool::gatedReturnCommand()
{
}

void IOServiceStateNotificationDispatchSource::Create()
{
  __assert_rtn("Create", "uioserver.cpp", 5648, "kIOReturnSuccess == ret");
}

void IOThreadStart()
{
  __assert_rtn("IOThreadStart", "uioserver.cpp", 5759, "self != NULL");
}

{
  __assert_rtn("IOThreadStart", "uioserver.cpp", 5764, "ret == KERN_SUCCESS");
}

{
  __assert_rtn("IOThreadStart", "uioserver.cpp", 5760, "self == OSDynamicCast(IOThread, self)");
}

void IOThread::CopyCurrentThread()
{
  __assert_rtn("CopyCurrentThread", "uioserver.cpp", 5889, "self != NULL");
}

{
  __assert_rtn("CopyCurrentThread", "uioserver.cpp", 5890, "self == OSDynamicCast(IOThread, self)");
}

void IOWorkGroup::SetWorkGroupPort_Impl()
{
  __assert_rtn("SetWorkGroupPort_Impl", "uioserver.cpp", 6050, "release_ret == KERN_SUCCESS");
}

void IOEventLink::SetEventlinkPort_Impl()
{
  __assert_rtn("SetEventlinkPort_Impl", "uioserver.cpp", 6179, "release_ret == KERN_SUCCESS");
}

void _OSObjectCopyIn()
{
}

{
  __assert_rtn("_OSObjectCopyIn", "uioserver.cpp", 1041, "size >= sizeof(OSObject_Instantiate_Rpl)");
}

{
  __assert_rtn("_OSObjectCopyIn", "uioserver.cpp", 1043, "size >= queueCount * sizeof(machReply->objects[0])");
}

{
  __assert_rtn("_OSObjectCopyIn", "uioserver.cpp", 1079, "remotePriv");
}

{
  __assert_rtn("_OSObjectCopyIn", "uioserver.cpp", 1075, "kIOReturnSuccess == ret");
}

{
  __assert_rtn("_OSObjectCopyIn", "uioserver.cpp", 1030, "reply->__hdr.msgid == OSObject_Instantiate_ID");
}

{
  __assert_rtn("_OSObjectCopyIn", "uioserver.cpp", 993, "KERN_SUCCESS == ret");
}

void ___ZL15OSCopyInObjectsP18IOUserServer_IVarsP16IORPCMessageMachP12IORPCMessageb_block_invoke_cold_1()
{
  __assert_rtn("OSCopyInObjects_block_invoke", "uioserver.cpp", 1367, "KERN_SUCCESS == kr");
}

void Server()
{
  __assert_rtn("Server", "uioserver.cpp", 2101, "(replyTo == 0) == (0 != (kIORPCMessageOneway & message->flags))");
}

{
  __assert_rtn("Server", "uioserver.cpp", 2135, "kIOReturnSuccess == ret");
}

void OSCollectionTypeName_cold_1()
{
}

void OSSerializationTypeID()
{
}

void OSCollectionTypeID_cold_1()
{
}

void OSSerializationValue()
{
}

void OSCreateObjectFromSerialization_cold_1()
{
}

void OSCreateObjectFromSerializationInternal()
{
}

{
  __assert_rtn("OSCreateObjectFromSerializationInternal", "OSCollections.cpp", 353, "false");
}

{
  __assert_rtn("OSCreateObjectFromSerializationInternal", "OSCollections.cpp", 359, "false");
}

void OSSerializationGetStringLength()
{
}

void OSStringCreate_cold_1()
{
  __assert_rtn("OSStringCreate", "OSCollections.cpp", 533, "len <= kOSSerializeDataMask");
}

void OSStringCreate_cold_2()
{
  __assert_rtn("roundSerializationSize", "OSCollections.cpp", 66, "length <= kOSSerializeDataMask");
}

void OSStringCreate_cold_3()
{
  __assert_rtn("OSStringCreate", "OSCollections.cpp", 566, "allocLen >= bufferLen");
}

void OSStringHash()
{
  __assert_rtn("OSStringHash", "OSCollections.cpp", 484, "len <= kOSSerializeDataMask");
}

void OSString::free()
{
  __assert_rtn("roundSerializationSize", "OSCollections.cpp", 66, "length <= kOSSerializeDataMask");
}

{
  __assert_rtn("free", "OSCollections.cpp", 623, "allocLen >= bufferLen");
}

{
  __assert_rtn("free", "OSCollections.cpp", 612, "uniq->string == this");
}

void OSDataCreate_cold_1()
{
  __assert_rtn("OSDataCreate", "OSCollections.cpp", 730, "allocLen >= length");
}

void __OSDictionaryApply_block_invoke_cold_1()
{
}

void __OSDictionaryApply_block_invoke_cold_2()
{
}

void OSDictionarySetValueInternal()
{
}

void OSSerializationAppendBytes()
{
}

{
  __assert_rtn("OSSerializationAppendBytes", "OSCollections.cpp", 1691, "serial->ivars->bufLen == 0 || serial->ivars->buffer != nullptr");
}

{
  __assert_rtn("OSSerializationAppendBytes", "OSCollections.cpp", 1695, "KERN_SUCCESS == kr");
}

{
  __assert_rtn("OSSerializationAppendBytes", "OSCollections.cpp", 1688, "KERN_SUCCESS == kr");
}

{
  __assert_rtn("OSSerializationAppendBytes", "OSCollections.cpp", 1668, "false");
}

void OSSerializationAddBinaryObject()
{
}

{
  __assert_rtn("OSSerializationAddBinaryObject", "OSCollections.cpp", 1723, "source != nullptr");
}

{
  __assert_rtn("OSSerializationAddBinaryObject", "OSCollections.cpp", 1725, "idx < source->ivars->maxIndex");
}

void OSSerializationSize()
{
  __assert_rtn("OSSerializationSize", "OSCollections.cpp", 217, "(count + idx) <= serial->ivars->maxIndex");
}

{
  __assert_rtn("OSSerializationSize", "OSCollections.cpp", 215, "idx < serial->ivars->maxIndex");
}

{
  __assert_rtn("OSSerializationSize", "OSCollections.cpp", 172, "idx < maxIndex");
}

{
  __assert_rtn("OSSerializationSize", "OSCollections.cpp", 203, "false");
}

{
  __assert_rtn("OSSerializationSize", "OSCollections.cpp", 181, "idx < maxIndex");
}

{
  __assert_rtn("OSSerializationSize", "OSCollections.cpp", 183, "length <= kOSSerializeDataMask");
}

void OSSerializeEntry()
{
  __assert_rtn("OSCollectionEntryDictionaryApply", "OSCollections.cpp", 975, "serial != nullptr");
}

{
  __assert_rtn("OSCollectionEntryDictionaryCount", "OSCollections.cpp", 943, "serial != nullptr");
}

{
  __assert_rtn("OSCollectionEntryDictionaryCount", "OSCollections.cpp", 945, "kOSSerializeDictionary == (kOSSerializeTypeMask & key)");
}

{
  __assert_rtn("OSCollectionEntryArrayApply", "OSCollections.cpp", 1412, "serial != nullptr");
}

{
  __assert_rtn("OSCollectionEntryArrayCount", "OSCollections.cpp", 1391, "serial != nullptr");
}

{
  __assert_rtn("OSCollectionEntryArrayCount", "OSCollections.cpp", 1394, "(kOSSerializeArray == (kOSSerializeTypeMask & key)) || (kOSSerializeSet == (kOSSerializeTypeMask & key))");
}

void OSCollectionEntryTypeID()
{
  __assert_rtn("OSCollectionEntryTypeID", "OSCollections.cpp", 271, "serial != nullptr");
}

{
  __assert_rtn("OSCollectionEntryTypeID", "OSCollections.cpp", 273, "idx < serial->ivars->maxIndex");
}

void OSCreateSerializationFromBytes_cold_1()
{
  __assert_rtn("OSCreateSerializationFromBytes", "OSCollections.cpp", 1915, "serial->ivars->maxIndex >= 2");
}

void OSObjectLogInternal()
{
}

void OSData::free()
{
  __assert_rtn("free", "OSCollections.cpp", 3204, "allocLen >= length");
}

void OSSerialization::finalizeBuffer()
{
}

void OSSerialization::freeBuffer()
{
  __assert_rtn("freeBuffer", "OSCollections.cpp", 3560, "KERN_SUCCESS == kr");
}

void OSSerializationDictionaryApply()
{
}

{
  __assert_rtn("OSSerializationDictionaryApply", "OSCollections.cpp", 851, "idx < serial->ivars->maxIndex");
}

{
  __assert_rtn("OSSerializationDictionaryApply", "OSCollections.cpp", 843, "kOSSerializeDictionary == (kOSSerializeTypeMask & key)");
}

{
  __assert_rtn("OSSerializationDictionaryApply", "OSCollections.cpp", 841, "idx < serial->ivars->maxIndex");
}

void ___ZL20OSDictionaryGetEntryP12OSDictionaryP8OSObjectPKcPm_block_invoke_cold_1()
{
}

void OSSerializationArrayApply()
{
}

{
  __assert_rtn("OSSerializationArrayApply", "OSCollections.cpp", 1303, "(kOSSerializeArray == (kOSSerializeTypeMask & key)) || (kOSSerializeSet == (kOSSerializeTypeMask & key))");
}

{
  __assert_rtn("OSSerializationArrayApply", "OSCollections.cpp", 1298, "idx < serial->ivars->maxIndex");
}

void IOReporter_IVars::~IOReporter_IVars()
{
  panic("%s - %s <= 0!", "~IOReporter_IVars", "ivar(nChannels)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "~IOReporter_IVars", "ivar(nChannels)", "int");
}

{
  panic("%s - %s <= 0!", "~IOReporter_IVars", "ivar(nElements)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "~IOReporter_IVars", "ivar(nElements)", "IOReportElement");
}

void IOReporter_IVars::handleSwapPrepare()
{
}

{
  panic("%s doesn't support shrinking", "handleSwapPrepare");
}

{
  panic("IOReporter::_swap* already in use");
}

void IOReporter_IVars::handleAddChannelSwap()
{
}

{
  panic("%s was called out of locked context!", "virtual IOReturn IOReporter_IVars::handleAddChannelSwap(uint64_t, const OSString *)");
}

{
  panic("%s - %s <= 0!", "handleAddChannelSwap", "ivar(nElements)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "handleAddChannelSwap", "ivar(nElements)", "IOReportElement");
}

{
  panic("%s - %s <= 0!", "handleAddChannelSwap", "ivar(nElements)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "handleAddChannelSwap", "ivar(nElements)", "int");
}

void IOReporter_IVars::handleSwapCleanup()
{
}

{
  panic("%s - %s <= 0!", "handleSwapCleanup", "swapNChannels");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "handleSwapCleanup", "swapNChannels", "int");
}

{
  panic("%s - %s <= 0!", "handleSwapCleanup", "swapNElements");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "handleSwapCleanup", "swapNElements", "IOReportElement");
}

void IOReporter_IVars::updateReportChannel()
{
}

void IOReporter_IVars::setElementValues()
{
}

void IOReporter_IVars::getElementValues()
{
}

void IOReporter_IVars::copyElementValues()
{
}

void IOHistogramReporter_IVars::~IOHistogramReporter_IVars()
{
  panic("%s - %s <= 0!", "~IOHistogramReporter_IVars", "ivar(segmentCount)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "~IOHistogramReporter_IVars", "ivar(segmentCount)", "IOHistogramSegmentConfig");
}

{
  panic("%s - %s <= 0!", "~IOHistogramReporter_IVars", "ivar(nElements)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "~IOHistogramReporter_IVars", "ivar(nElements)", "int64_t");
}

void IOHistogramReporter_IVars::handleCreateLegend()
{
}

void IOStateReporter_IVars::~IOStateReporter_IVars()
{
  panic("%s - %s <= 0!", "~IOStateReporter_IVars", "ivar(nChannels)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "~IOStateReporter_IVars", "ivar(nChannels)", "uint64_t");
}

{
  panic("%s - %s <= 0!", "~IOStateReporter_IVars", "ivar(nChannels)");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "~IOStateReporter_IVars", "ivar(nChannels)", "int");
}

void IOStateReporter_IVars::handleSwapPrepare()
{
}

{
  panic("IOStateReporter::_swap* already in use");
}

void IOStateReporter_IVars::handleAddChannelSwap()
{
}

{
  panic("%s was called out of locked context!", "virtual IOReturn IOStateReporter_IVars::handleAddChannelSwap(uint64_t, const OSString *)");
}

{
  panic("IOStateReporter::handleAddChannelSwap ivar(lastUpdateTimes) unset despite non-NULL ivar(currentStates)");
}

void IOStateReporter_IVars::handleSwapCleanup()
{
}

{
  panic("%s - %s <= 0!", "handleSwapCleanup", "swapNChannels");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "handleSwapCleanup", "swapNChannels", "uint64_t");
}

{
  panic("%s - %s <= 0!", "handleSwapCleanup", "swapNChannels");
}

{
  panic("%s - %s > INT_MAX / sizeof(%s)!", "handleSwapCleanup", "swapNChannels", "int");
}

void IOStateReporter_IVars::_getStateIndices()
{
}

void IOStateReporter::overrideChannelState()
{
}

void IOStateReporter::incrementChannelState()
{
}

void IOStateReporter_IVars::handleSetStateID()
{
}

void IOStateReporter_IVars::handleSetStateByIndices()
{
}

void IOStateReporter_IVars::updateChannelValues()
{
}

void aes_encrypt_key_cold_1()
{
}

void aes_decrypt_key_cold_1()
{
}

void SHA256_Init_cold_1()
{
}

void SHA384_Init_cold_1()
{
}

void SHA512_Init_cold_1()
{
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

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x270ED7D10](buf, bufsize);
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x270ED7F58](*(void *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x270ED7F60](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x270ED7F98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x270ED87E0]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x270ED87E8]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x270ED8800]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x270ED8808]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x270ED8838]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x270ED8840]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x270ED8A48]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x270ED8A50]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x270ED8B60]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x270ED8B90]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x270ED8C28]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x270ED8D60]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x270ED8D70]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x270ED8D78]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x270ED8D88]();
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return MEMORY[0x270ED8EF0](*(void *)&__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x270ED9150]();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x270ED93D0]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x270ED93E0]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x270ED93F8]();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x270ED9470](queue);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95D0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x270ED9600]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x270ED9610](a1, a2);
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

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x270ED9D60](mhp, segname, sectname, size);
}

kern_return_t host_get_io_main(host_t host, io_main_t *io_main)
{
  return MEMORY[0x270ED9E08](*(void *)&host, io_main);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDA158]();
}

void mach_error(const char *str, mach_error_t error_value)
{
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x270EDA178]();
}

uint64_t mach_msg2_internal()
{
  return MEMORY[0x270EDA198]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_ports_lookup(task_t target_task, mach_port_array_t *init_port_set, mach_msg_type_number_t *init_port_setCnt)
{
  return MEMORY[0x270EDA250](*(void *)&target_task, init_port_set, init_port_setCnt);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
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

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA500](dest, src, *(void *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x270EDA508](dest, src, *(void *)&len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

uint64_t os_eventlink_activate()
{
  return MEMORY[0x270EDA930]();
}

uint64_t os_eventlink_associate()
{
  return MEMORY[0x270EDA938]();
}

uint64_t os_eventlink_cancel()
{
  return MEMORY[0x270EDA940]();
}

uint64_t os_eventlink_create_with_port()
{
  return MEMORY[0x270EDA950]();
}

uint64_t os_eventlink_disassociate()
{
  return MEMORY[0x270EDA958]();
}

uint64_t os_eventlink_signal()
{
  return MEMORY[0x270EDA968]();
}

uint64_t os_eventlink_signal_and_wait()
{
  return MEMORY[0x270EDA970]();
}

uint64_t os_eventlink_signal_and_wait_until()
{
  return MEMORY[0x270EDA978]();
}

uint64_t os_eventlink_wait()
{
  return MEMORY[0x270EDA980]();
}

uint64_t os_eventlink_wait_until()
{
  return MEMORY[0x270EDA988]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_release(void *object)
{
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x270EDAAF0]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x270EDAB08]();
}

os_workgroup_t os_workgroup_create_with_port(const char *name, mach_port_t mach_port)
{
  return (os_workgroup_t)MEMORY[0x270EDAB90](name, *(void *)&mach_port);
}

int os_workgroup_join(os_workgroup_t wg, os_workgroup_join_token_t token_out)
{
  return MEMORY[0x270EDABC8](wg, token_out);
}

void os_workgroup_leave(os_workgroup_t wg, os_workgroup_join_token_t token)
{
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x270EDAE00](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x270EDAE30](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE38](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE78](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x270EDAEF0](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x270EDAF18](a1, a2);
}

int pthread_key_delete(pthread_key_t a1)
{
  return MEMORY[0x270EDAF20](a1);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x270EDAF38](a1);
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

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF68](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x270EDB010]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x270EDB048](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x270EDB068](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x270EDB5C0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB5F8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x270EDB600](__dst, __source, __size);
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

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6E8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

kern_return_t thread_policy_get(thread_inspect_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t *policy_infoCnt, BOOLean_t *get_default)
{
  return MEMORY[0x270EDB900](*(void *)&thread, *(void *)&flavor, policy_info, policy_infoCnt, get_default);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x270EDB908](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDBA80](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDBA90](*(void *)&target_task, address, size);
}